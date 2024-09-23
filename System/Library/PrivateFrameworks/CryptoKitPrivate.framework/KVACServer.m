@implementation KVACServer

- (NSData)keyId
{
  return (NSData *)sub_1D2C6319C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC16CryptoKitPrivate10KVACServer_keyId);
}

- (_TtC16CryptoKitPrivate10KVACServer)init
{
  return (_TtC16CryptoKitPrivate10KVACServer *)KVACServer.init()();
}

- (id)issueWithRequestData:(id)a3 error:(id *)a4
{
  id v5;
  _TtC16CryptoKitPrivate10KVACServer *v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  char *v10;

  v5 = a3;
  v6 = self;
  v7 = sub_1D2CAA96C();
  v9 = v8;

  v10 = sub_1D2C634C0(v7, v9);
  sub_1D2C45258(v7, v9);
  return v10;
}

- (BOOL)verifyWithPresentationData:(id)a3 tokenChallenge:(id)a4
{
  id v6;
  id v7;
  _TtC16CryptoKitPrivate10KVACServer *v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = sub_1D2CAA96C();
  v11 = v10;

  v12 = sub_1D2CAA96C();
  v14 = v13;

  LOBYTE(v7) = sub_1D2C636D0(v9, v11, v12, v14);
  sub_1D2C45258(v12, v14);
  sub_1D2C45258(v9, v11);

  return v7 & 1;
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

  v3 = *(void **)&self->server[OBJC_IVAR____TtC16CryptoKitPrivate10KVACServer_server + 8];
  v12 = *(void **)&self->server[OBJC_IVAR____TtC16CryptoKitPrivate10KVACServer_server];
  v4 = *(void **)&self->server[OBJC_IVAR____TtC16CryptoKitPrivate10KVACServer_server + 16];
  v5 = *(void **)&self->server[OBJC_IVAR____TtC16CryptoKitPrivate10KVACServer_server + 24];
  v6 = *(void **)&self->server[OBJC_IVAR____TtC16CryptoKitPrivate10KVACServer_server + 32];
  v7 = *(void **)&self->server[OBJC_IVAR____TtC16CryptoKitPrivate10KVACServer_server + 40];
  v9 = *(void **)&self->server[OBJC_IVAR____TtC16CryptoKitPrivate10KVACServer_server + 48];
  v8 = *(void **)&self->server[OBJC_IVAR____TtC16CryptoKitPrivate10KVACServer_server + 56];
  v10 = *(_QWORD *)&self->server[OBJC_IVAR____TtC16CryptoKitPrivate10KVACServer_server + 72];
  v11 = *(_QWORD *)&self->server[OBJC_IVAR____TtC16CryptoKitPrivate10KVACServer_server + 80];

  sub_1D2C45258(v10, v11);
  sub_1D2C45258(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC16CryptoKitPrivate10KVACServer_keyId), *(_QWORD *)&self->server[OBJC_IVAR____TtC16CryptoKitPrivate10KVACServer_keyId]);
}

@end
