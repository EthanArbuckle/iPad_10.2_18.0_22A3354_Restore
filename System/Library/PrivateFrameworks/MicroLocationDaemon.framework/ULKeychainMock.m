@implementation ULKeychainMock

+ (id)retrieveSymmetricKey:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  double v8;
  uint64_t v9;
  char *v10;
  void *v11;
  _QWORD v13[3];
  uint64_t v14;

  v3 = sub_241B7FE4C();
  static ULKeychainMock.retrieveSymmetricKey(_:)(v3, v4, (uint64_t)v13);
  swift_bridgeObjectRelease();
  v5 = v14;
  if (!v14)
    return 0;
  v6 = __swift_project_boxed_opaque_existential_1(v13, v14);
  v7 = *(_QWORD *)(v5 - 8);
  v8 = MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, double))(v7 + 16))(v10, v8);
  v11 = (void *)sub_241B7FF3C();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v5);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v13);
  return v11;
}

- (_TtC19MicroLocationDaemon14ULKeychainMock)init
{
  return (_TtC19MicroLocationDaemon14ULKeychainMock *)sub_241B75864(self, (uint64_t)a2, type metadata accessor for ULKeychainMock);
}

@end
