@implementation KVACPresentationWrapper

- (NSData)serverKeyId
{
  return (NSData *)sub_1D2C6319C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC16CryptoKitPrivate23KVACPresentationWrapper_serverKeyId);
}

- (NSData)tag
{
  return (NSData *)sub_1D2C6319C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC16CryptoKitPrivate23KVACPresentationWrapper_tag);
}

- (NSData)prefix
{
  return (NSData *)sub_1D2C6319C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC16CryptoKitPrivate23KVACPresentationWrapper_prefix);
}

- (NSData)presentationData
{
  return (NSData *)sub_1D2C6319C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC16CryptoKitPrivate23KVACPresentationWrapper_presentationData);
}

- (_TtC16CryptoKitPrivate23KVACPresentationWrapper)init
{
  _TtC16CryptoKitPrivate23KVACPresentationWrapper *result;

  result = (_TtC16CryptoKitPrivate23KVACPresentationWrapper *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1D2C45258(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC16CryptoKitPrivate23KVACPresentationWrapper_serverKeyId), *(_QWORD *)&self->serverKeyId[OBJC_IVAR____TtC16CryptoKitPrivate23KVACPresentationWrapper_serverKeyId]);
  sub_1D2C45258(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC16CryptoKitPrivate23KVACPresentationWrapper_tag), *(_QWORD *)&self->serverKeyId[OBJC_IVAR____TtC16CryptoKitPrivate23KVACPresentationWrapper_tag]);
  sub_1D2C45258(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC16CryptoKitPrivate23KVACPresentationWrapper_prefix), *(_QWORD *)&self->serverKeyId[OBJC_IVAR____TtC16CryptoKitPrivate23KVACPresentationWrapper_prefix]);
  sub_1D2C45258(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC16CryptoKitPrivate23KVACPresentationWrapper_presentationData), *(_QWORD *)&self->serverKeyId[OBJC_IVAR____TtC16CryptoKitPrivate23KVACPresentationWrapper_presentationData]);
}

@end
