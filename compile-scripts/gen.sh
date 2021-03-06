#!/usr/bin/sh
cd "$(dirname $0)"
docker pull namely/protoc-all
docker run -v `pwd`:/defs namely/protoc-all \
	-f nhentai.proto \
	-l go \
	-o generated/nhentai

docker run -v `pwd`:/defs namely/protoc-all \
	-f nhentai.proto \
	-l node \
	-o generated/nhentai \
	--with-typescript

docker run -v `pwd`:/defs namely/protoc-all \
	-f hentai-cafe.proto \
	-l python \
	-o generated/hentai-cafe \

docker run -v `pwd`:/defs namely/protoc-all \
	-f hentai-cafe.proto \
	-l node \
	-o generated/hentai-cafe \
	--with-typescript
