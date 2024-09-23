@implementation KVACRequestWrapper

- (NSData)requestData
{
  return (NSData *)sub_1D2C6319C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC16CryptoKitPrivate18KVACRequestWrapper_requestData);
}

- (_TtC16CryptoKitPrivate18KVACRequestWrapper)init
{
  _TtC16CryptoKitPrivate18KVACRequestWrapper *result;

  result = (_TtC16CryptoKitPrivate18KVACRequestWrapper *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  sub_1D2C45258(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC16CryptoKitPrivate18KVACRequestWrapper_requestData), *(_QWORD *)&self->requestData[OBJC_IVAR____TtC16CryptoKitPrivate18KVACRequestWrapper_requestData]);
  v3 = (char *)self + OBJC_IVAR____TtC16CryptoKitPrivate18KVACRequestWrapper_request;
  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC16CryptoKitPrivate18KVACRequestWrapper_request);
  v5 = *(void **)&self->requestData[OBJC_IVAR____TtC16CryptoKitPrivate18KVACRequestWrapper_request];
  v7 = v4;
  v6 = (void *)*((_QWORD *)v3 + 2);
  swift_bridgeObjectRelease();

}

@end
