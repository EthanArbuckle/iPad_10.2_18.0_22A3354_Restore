@implementation ArtworkLoadingProtocol

+ (BOOL)canInitWithRequest:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  char v7;
  uint64_t v9;

  v3 = sub_21205CD44();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8]();
  v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21205CD08();
  swift_getObjCClassMetadata();
  v7 = sub_211B325C8(v6);
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  return v7 & 1;
}

+ (id)canonicalRequestForRequest:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  void (*v10)(char *, uint64_t);
  void *v11;
  uint64_t v13;

  v3 = sub_21205CD44();
  v4 = *(_QWORD *)(v3 - 8);
  v5 = MEMORY[0x24BDAC7A8](v3);
  v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)&v13 - v8;
  sub_21205CD08();
  sub_211E7F430((uint64_t)v7, (uint64_t)v9);
  v10 = *(void (**)(char *, uint64_t))(v4 + 8);
  v10(v7, v3);
  v11 = (void *)sub_21205CCF0();
  v10(v9, v3);
  return v11;
}

- (void)startLoading
{
  _TtC8MusicKit22ArtworkLoadingProtocol *v2;

  v2 = self;
  sub_211E7F534();

}

- (_TtC8MusicKit22ArtworkLoadingProtocol)initWithRequest:(id)a3 cachedResponse:(id)a4 client:(id)a5
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  uint64_t v12;

  v7 = sub_21205CD44();
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21205CD08();
  v10 = a4;
  swift_unknownObjectRetain();
  return (_TtC8MusicKit22ArtworkLoadingProtocol *)sub_211E804EC((uint64_t)v9, a4, (uint64_t)a5);
}

@end
