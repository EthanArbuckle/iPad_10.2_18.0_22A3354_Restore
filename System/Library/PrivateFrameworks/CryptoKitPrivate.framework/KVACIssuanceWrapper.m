@implementation KVACIssuanceWrapper

- (NSData)keyId
{
  return (NSData *)sub_1D2C6319C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC16CryptoKitPrivate19KVACIssuanceWrapper_keyId);
}

- (NSData)issuanceData
{
  return (NSData *)sub_1D2C6319C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC16CryptoKitPrivate19KVACIssuanceWrapper_issuanceData);
}

- (_TtC16CryptoKitPrivate19KVACIssuanceWrapper)initWithIssuanceData:(id)a3 error:(id *)a4
{
  return (_TtC16CryptoKitPrivate19KVACIssuanceWrapper *)sub_1D2C62FA4((uint64_t)self, (uint64_t)a2, a3, (uint64_t)a4, (uint64_t (*)(uint64_t, uint64_t))KVACIssuanceWrapper.init(issuanceData:));
}

- (_TtC16CryptoKitPrivate19KVACIssuanceWrapper)init
{
  _TtC16CryptoKitPrivate19KVACIssuanceWrapper *result;

  result = (_TtC16CryptoKitPrivate19KVACIssuanceWrapper *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  unint64_t v11;
  void *v12;
  void *v13;

  v3 = *(void **)&self->issuance[OBJC_IVAR____TtC16CryptoKitPrivate19KVACIssuanceWrapper_issuance];
  v4 = *(void **)&self->issuance[OBJC_IVAR____TtC16CryptoKitPrivate19KVACIssuanceWrapper_issuance + 8];
  v5 = *(void **)&self->issuance[OBJC_IVAR____TtC16CryptoKitPrivate19KVACIssuanceWrapper_issuance + 16];
  v6 = *(void **)&self->issuance[OBJC_IVAR____TtC16CryptoKitPrivate19KVACIssuanceWrapper_issuance + 24];
  v7 = *(void **)&self->issuance[OBJC_IVAR____TtC16CryptoKitPrivate19KVACIssuanceWrapper_issuance + 32];
  v9 = *(void **)&self->issuance[OBJC_IVAR____TtC16CryptoKitPrivate19KVACIssuanceWrapper_issuance + 40];
  v8 = *(void **)&self->issuance[OBJC_IVAR____TtC16CryptoKitPrivate19KVACIssuanceWrapper_issuance + 48];
  v10 = *(_QWORD *)&self->issuance[OBJC_IVAR____TtC16CryptoKitPrivate19KVACIssuanceWrapper_issuance + 64];
  v11 = *(_QWORD *)&self->issuance[OBJC_IVAR____TtC16CryptoKitPrivate19KVACIssuanceWrapper_issuance + 72];
  v12 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC16CryptoKitPrivate19KVACIssuanceWrapper_issuance);
  v13 = *(void **)&self->issuance[OBJC_IVAR____TtC16CryptoKitPrivate19KVACIssuanceWrapper_issuance + 80];

  sub_1D2C45258(v10, v11);
  swift_bridgeObjectRelease();

  sub_1D2C45258(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC16CryptoKitPrivate19KVACIssuanceWrapper_keyId), *(_QWORD *)&self->issuance[OBJC_IVAR____TtC16CryptoKitPrivate19KVACIssuanceWrapper_keyId]);
  sub_1D2C45258(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC16CryptoKitPrivate19KVACIssuanceWrapper_issuanceData), *(_QWORD *)&self->issuance[OBJC_IVAR____TtC16CryptoKitPrivate19KVACIssuanceWrapper_issuanceData]);
}

@end
