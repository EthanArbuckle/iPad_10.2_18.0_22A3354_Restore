@implementation RSAPSSSPKI_Bridging

- (_TtC16CryptoKitPrivate19RSAPSSSPKI_Bridging)initWithData:(id)a3 error:(id *)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  _TtC16CryptoKitPrivate19RSAPSSSPKI_Bridging *v14;
  objc_class *v15;
  _TtC16CryptoKitPrivate19RSAPSSSPKI_Bridging *v16;
  uint64_t v18;
  objc_super v19;

  v6 = sub_1D2CAAB70();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = a3;
  v11 = sub_1D2CAA96C();
  v13 = v12;

  v14 = self;
  sub_1D2C45028(v11, v13);
  sub_1D2CAAB58();
  (*(void (**)(uint64_t, char *, uint64_t))(v7 + 32))((uint64_t)v14 + OBJC_IVAR____TtC16CryptoKitPrivate19RSAPSSSPKI_Bridging_backingStruct, v9, v6);

  v15 = (objc_class *)type metadata accessor for RSAPSSSPKI_Bridging();
  v19.receiver = v14;
  v19.super_class = v15;
  v16 = -[RSAPSSSPKI_Bridging init](&v19, sel_init);
  sub_1D2C45258(v11, v13);
  return v16;
}

- (id)publicKeyBytes
{
  _TtC16CryptoKitPrivate19RSAPSSSPKI_Bridging *v2;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  void *v6;

  v2 = self;
  v3 = sub_1D2CAAB4C();
  v5 = v4;

  v6 = (void *)sub_1D2CAA954();
  sub_1D2C45258(v3, v5);
  return v6;
}

+ (id)serializeWithKeyBytes:(id)a3 error:(id *)a4
{
  id v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  void *v11;

  v4 = a3;
  v5 = sub_1D2CAA96C();
  v7 = v6;

  v8 = sub_1D2CAAB64();
  v10 = v9;
  sub_1D2C45258(v5, v7);
  v11 = (void *)sub_1D2CAA954();
  sub_1D2C45258(v8, v10);
  return v11;
}

- (_TtC16CryptoKitPrivate19RSAPSSSPKI_Bridging)init
{
  _TtC16CryptoKitPrivate19RSAPSSSPKI_Bridging *result;

  result = (_TtC16CryptoKitPrivate19RSAPSSSPKI_Bridging *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v2;
  uint64_t v3;

  v2 = (char *)self + OBJC_IVAR____TtC16CryptoKitPrivate19RSAPSSSPKI_Bridging_backingStruct;
  v3 = sub_1D2CAAB70();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);
}

@end
