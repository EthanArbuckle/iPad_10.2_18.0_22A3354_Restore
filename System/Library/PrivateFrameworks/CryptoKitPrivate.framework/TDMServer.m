@implementation TDMServer

- (_TtC16CryptoKitPrivate9TDMServer)init
{
  return (_TtC16CryptoKitPrivate9TDMServer *)TDMServer.init()();
}

- (id)publicKey
{
  _TtC16CryptoKitPrivate9TDMServer *v2;
  id v3;
  unint64_t v4;
  unint64_t v5;
  void *v6;

  v2 = self;
  v3 = sub_1D2C8439C();
  v5 = v4;

  v6 = (void *)sub_1D2CAA954();
  sub_1D2C45258((uint64_t)v3, v5);
  return v6;
}

- (id)info
{
  return (id)sub_1D2CAA954();
}

- (id)evaluateWithBlindedElement:(id)a3 error:(id *)a4
{
  id v5;
  _TtC16CryptoKitPrivate9TDMServer *v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  void *v10;

  v5 = a3;
  v6 = self;
  v7 = sub_1D2CAA96C();
  v9 = v8;

  v10 = (void *)sub_1D2C845B8(v7, v9);
  sub_1D2C45258(v7, v9);
  return v10;
}

- (BOOL)verifyTokenWithOutput:(id)a3 TID:(id)a4 FSR:(id)a5
{
  id v8;
  id v9;
  id v10;
  _TtC16CryptoKitPrivate9TDMServer *v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  void *v18;
  unint64_t v19;
  unint64_t v20;
  unsigned __int8 *v21;
  void *v22;
  uint64_t v23;
  int v24;
  id v25;
  char v26;
  _TtC16CryptoKitPrivate9TDMServer *v28;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  v12 = sub_1D2CAA96C();
  v14 = v13;

  v15 = sub_1D2CAA96C();
  v17 = v16;

  v18 = (void *)sub_1D2CAA96C();
  v20 = v19;

  v28 = v11;
  v21 = (unsigned __int8 *)v11 + OBJC_IVAR____TtC16CryptoKitPrivate9TDMServer_oprfServer;
  v23 = *(_QWORD *)&v11->oprfServer[OBJC_IVAR____TtC16CryptoKitPrivate9TDMServer_oprfServer];
  v22 = *(void **)&v11->oprfServer[OBJC_IVAR____TtC16CryptoKitPrivate9TDMServer_oprfServer + 8];
  LOBYTE(v11) = v11->oprfServer[OBJC_IVAR____TtC16CryptoKitPrivate9TDMServer_oprfServer + 16];
  v24 = *v21;
  v25 = v22;
  sub_1D2C7FCF8(v15, v17, v12, v14, v18, v20, v24, v23, v25, (char)v11);
  LOBYTE(v24) = v26;

  sub_1D2C45258((uint64_t)v18, v20);
  sub_1D2C45258(v15, v17);
  sub_1D2C45258(v12, v14);

  return v24 & 1;
}

- (void).cxx_destruct
{

}

@end
