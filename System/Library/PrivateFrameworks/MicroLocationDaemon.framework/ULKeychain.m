@implementation ULKeychain

+ (id)getSymmetricKeyOrCreateNew:(id)a3
{
  return sub_241B7506C((uint64_t)a1, (uint64_t)a2, (uint64_t)a3, (void (*)(_QWORD *__return_ptr, uint64_t, uint64_t))static ULKeychain.getSymmetricKeyOrCreateNew(_:));
}

+ (id)retrieveSymmetricKey:(id)a3
{
  return sub_241B7506C((uint64_t)a1, (uint64_t)a2, (uint64_t)a3, (void (*)(_QWORD *__return_ptr, uint64_t, uint64_t))static ULKeychain.retrieveSymmetricKey(_:));
}

+ (BOOL)removeKey:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  BOOL v5;

  v3 = sub_241B7FE4C();
  v5 = _s19MicroLocationDaemon10ULKeychainC9removeKeyySbSSFZ_0(v3, v4);
  swift_bridgeObjectRelease();
  return v5;
}

- (_TtC19MicroLocationDaemon10ULKeychain)init
{
  return (_TtC19MicroLocationDaemon10ULKeychain *)sub_241B75864(self, (uint64_t)a2, type metadata accessor for ULKeychain);
}

@end
