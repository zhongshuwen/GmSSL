FROM ubuntu:bionic
WORKDIR /gmwork/
RUN apt-get update && apt-get install --no-install-recommends -y wget ca-certificates unzip build-essential cmake make git zip && apt-get purge -y --auto-remove
ENV GM_SSL_GIT_REPO_URL "https://github.com/zhongshuwen/GmSSL"
ENV GM_SSL_GIT_REPO_BRANCH "zswchain-production"
RUN git clone --branch "$GM_SSL_GIT_REPO_BRANCH" "$GM_SSL_GIT_REPO_URL" gmssl
RUN cd gmssl && ./config && make && cd .. && zip -r ./gmssl.zip ./gmssl
