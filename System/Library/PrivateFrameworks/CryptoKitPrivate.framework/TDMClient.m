@implementation TDMClient

- (_TtC16CryptoKitPrivate9TDMClient)initWithTID:(id)a3
{
  id v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  _TtC16CryptoKitPrivate9TDMClient *v7;

  v3 = a3;
  v4 = sub_1D2CAA96C();
  v6 = v5;

  v7 = (_TtC16CryptoKitPrivate9TDMClient *)sub_1D2C86DFC(v4, v6);
  sub_1D2C45258(v4, v6);
  return v7;
}

- (id)blindedElement
{
  void *v2;
  _TtC16CryptoKitPrivate9TDMClient *v3;
  id result;
  id v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  void *v9;

  v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC16CryptoKitPrivate9TDMClient_be);
  v3 = self;
  result = objc_msgSend(v2, sel_serializedPublicKey_, 1);
  if (result)
  {
    v5 = result;
    v6 = sub_1D2CAA96C();
    v8 = v7;

    v9 = (void *)sub_1D2CAA954();
    sub_1D2C45258(v6, v8);
    return v9;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (id)finalizeWithFSR:(id)a3 evaluatedElement:(id)a4 proof:(id)a5 publicKey:(id)a6 error:(id *)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  void *v30;
  uint64_t v32;
  _TtC16CryptoKitPrivate9TDMClient *v33;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v33 = self;
  v15 = sub_1D2CAA96C();
  v17 = v16;

  v32 = sub_1D2CAA96C();
  v19 = v18;

  v20 = sub_1D2CAA96C();
  v22 = v21;

  v23 = sub_1D2CAA96C();
  v25 = v24;

  sub_1D2C83700(v15, v17, v32, v19, v20, v22);
  v27 = v26;
  v29 = v28;

  sub_1D2C45258(v23, v25);
  sub_1D2C45258(v20, v22);
  sub_1D2C45258(v32, v19);
  sub_1D2C45258(v15, v17);
  v30 = (void *)sub_1D2CAA954();
  sub_1D2C45258(v27, v29);
  return v30;
}

- (_TtC16CryptoKitPrivate9TDMClient)init
{
  _TtC16CryptoKitPrivate9TDMClient *result;

  result = (_TtC16CryptoKitPrivate9TDMClient *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1D2C45258(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC16CryptoKitPrivate9TDMClient_input), *(_QWORD *)&self->oprfClient[OBJC_IVAR____TtC16CryptoKitPrivate9TDMClient_input]);

}

@end
