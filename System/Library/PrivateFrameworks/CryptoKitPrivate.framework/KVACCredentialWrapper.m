@implementation KVACCredentialWrapper

- (NSData)credentialData
{
  return (NSData *)sub_1D2C6319C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC16CryptoKitPrivate21KVACCredentialWrapper_credentialData);
}

- (NSData)serverKeyId
{
  return (NSData *)sub_1D2C6319C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC16CryptoKitPrivate21KVACCredentialWrapper_serverKeyId);
}

- (_TtC16CryptoKitPrivate21KVACCredentialWrapper)initWithCredentialData:(id)a3 error:(id *)a4
{
  return (_TtC16CryptoKitPrivate21KVACCredentialWrapper *)sub_1D2C62FA4((uint64_t)self, (uint64_t)a2, a3, (uint64_t)a4, (uint64_t (*)(uint64_t, uint64_t))KVACCredentialWrapper.init(credentialData:));
}

- (id)makePresentationWithTagPrefix:(id)a3 error:(id *)a4
{
  id v5;
  _TtC16CryptoKitPrivate21KVACCredentialWrapper *v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  __int128 v10;
  __int128 v11;
  id v12;
  char *v13;
  _OWORD v15[7];
  _OWORD v16[7];
  _OWORD v17[3];

  v5 = a3;
  v6 = self;
  v7 = sub_1D2CAA96C();
  v9 = v8;

  v11 = *(_OWORD *)&v6->credentialData[OBJC_IVAR____TtC16CryptoKitPrivate21KVACCredentialWrapper_credential + 8];
  v10 = *(_OWORD *)&v6->serverKeyId[OBJC_IVAR____TtC16CryptoKitPrivate21KVACCredentialWrapper_credential + 8];
  v17[0] = *(_OWORD *)((char *)&v6->super.isa + OBJC_IVAR____TtC16CryptoKitPrivate21KVACCredentialWrapper_credential);
  v17[1] = v11;
  v17[2] = v10;
  sub_1D2C69AB4((uint64_t)v17);
  sub_1D2C5DDE8(v7, v9, (uint64_t)v15);
  sub_1D2C69B0C((uint64_t)v17);
  v16[3] = v15[3];
  v16[4] = v15[4];
  v16[5] = v15[5];
  v16[6] = v15[6];
  v16[0] = v15[0];
  v16[1] = v15[1];
  v16[2] = v15[2];
  v12 = objc_allocWithZone((Class)type metadata accessor for KVACPresentationWrapper());
  v13 = sub_1D2C60564((uint64_t)v16);

  sub_1D2C45258(v7, v9);
  return v13;
}

- (_TtC16CryptoKitPrivate21KVACCredentialWrapper)init
{
  _TtC16CryptoKitPrivate21KVACCredentialWrapper *result;

  result = (_TtC16CryptoKitPrivate21KVACCredentialWrapper *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  unint64_t v9;

  sub_1D2C45258(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC16CryptoKitPrivate21KVACCredentialWrapper_credentialData), *(_QWORD *)&self->credentialData[OBJC_IVAR____TtC16CryptoKitPrivate21KVACCredentialWrapper_credentialData]);
  sub_1D2C45258(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC16CryptoKitPrivate21KVACCredentialWrapper_serverKeyId), *(_QWORD *)&self->credentialData[OBJC_IVAR____TtC16CryptoKitPrivate21KVACCredentialWrapper_serverKeyId]);
  v3 = (char *)self + OBJC_IVAR____TtC16CryptoKitPrivate21KVACCredentialWrapper_credential;
  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC16CryptoKitPrivate21KVACCredentialWrapper_credential);
  v5 = *(void **)&self->credentialData[OBJC_IVAR____TtC16CryptoKitPrivate21KVACCredentialWrapper_credential];
  v7 = *(void **)&self->credentialData[OBJC_IVAR____TtC16CryptoKitPrivate21KVACCredentialWrapper_credential + 8];
  v6 = *(void **)&self->serverKeyId[OBJC_IVAR____TtC16CryptoKitPrivate21KVACCredentialWrapper_credential];
  v8 = *(_QWORD *)&self->serverKeyId[OBJC_IVAR____TtC16CryptoKitPrivate21KVACCredentialWrapper_credential + 8];
  v9 = *((_QWORD *)v3 + 5);

  sub_1D2C45258(v8, v9);
}

@end
