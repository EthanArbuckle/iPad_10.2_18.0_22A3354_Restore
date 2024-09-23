@implementation WalletExposedDB

- (id)fetchAppleAccountsAndReturnError:(id *)a3
{
  void *v3;
  _TtC10FinanceKit15WalletExposedDB *v4;
  void *v5;
  id v7;

  v3 = (void *)(*(_QWORD **)((char *)&self->super.isa + OBJC_IVAR____TtC10FinanceKit15WalletExposedDB_store))[2];
  v4 = self;
  v7 = objc_msgSend(v3, sel_newBackgroundContext);
  __swift_instantiateConcreteTypeFromMangledName(&qword_254245088);
  sub_23361E960();

  sub_233168668(0, &qword_254245090);
  v5 = (void *)sub_23361E3D8();
  swift_bridgeObjectRelease();
  return v5;
}

- (BOOL)insertOrUpdateTransactions:(id)a3 forAppleAccountWithID:(id)a4 error:(id *)a5
{
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  _TtC10FinanceKit15WalletExposedDB *v11;
  Swift::String v12;
  void *v13;
  void *v14;
  id v15;

  sub_233168668(0, &qword_256051D10);
  v7 = sub_23361E3F0();
  v8 = sub_23361E150();
  v10 = v9;
  v11 = self;
  v12._countAndFlagsBits = v8;
  v12._object = v10;
  WalletExposedDB.insertOrUpdateTransactions(_:forAppleAccountWithID:)((Swift::OpaquePointer)v7, v12);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  if (v13)
  {
    if (a5)
    {
      v14 = (void *)sub_23361D1A8();

      v15 = v14;
      *a5 = v14;
    }
    else
    {

    }
  }
  return v13 == 0;
}

+ (id)makeClassAndReturnError:(id *)a3
{
  return sub_2335DC608();
}

- (_TtC10FinanceKit15WalletExposedDB)init
{
  _TtC10FinanceKit15WalletExposedDB *result;

  result = (_TtC10FinanceKit15WalletExposedDB *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
}

@end
