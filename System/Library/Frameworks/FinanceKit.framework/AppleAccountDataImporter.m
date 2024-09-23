@implementation AppleAccountDataImporter

- (_TtC10FinanceKit24AppleAccountDataImporter)init
{
  _TtC10FinanceKit24AppleAccountDataImporter *result;

  result = (_TtC10FinanceKit24AppleAccountDataImporter *)sub_23361EF24();
  __break(1u);
  return result;
}

+ (id)makeClassAndReturnError:(id *)a3
{
  return sub_23318ED78();
}

- (BOOL)insertOrUpdateWithAppleAccount:(id)a3 error:(id *)a4
{
  uint64_t v6;
  void *v7;
  id v8;
  _TtC10FinanceKit24AppleAccountDataImporter *v9;
  id v10;
  unint64_t v12;

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254248760);
  v6 = swift_allocObject();
  *(_OWORD *)(v6 + 16) = xmmword_233625CF0;
  *(_QWORD *)(v6 + 32) = a3;
  v12 = v6;
  sub_23361E408();
  v7 = (void *)(*(_QWORD **)((char *)&self->super.isa + OBJC_IVAR____TtC10FinanceKit24AppleAccountDataImporter_store))[2];
  v8 = a3;
  v9 = self;
  v10 = objc_msgSend(v7, sel_newBackgroundContext);
  sub_23318EE6C(v12);

  swift_bridgeObjectRelease();
  return 1;
}

- (BOOL)insertOrUpdateWithAppleAccounts:(id)a3 error:(id *)a4
{
  unint64_t v5;
  void *v6;
  _TtC10FinanceKit24AppleAccountDataImporter *v7;
  id v8;

  if (a3)
  {
    sub_233168668(0, &qword_256042BB8);
    v5 = sub_23361E3F0();
    v6 = (void *)(*(_QWORD **)((char *)&self->super.isa + OBJC_IVAR____TtC10FinanceKit24AppleAccountDataImporter_store))[2];
    v7 = self;
    v8 = objc_msgSend(v6, sel_newBackgroundContext);
    sub_23318EE6C(v5);
    swift_bridgeObjectRelease();

  }
  return 1;
}

- (BOOL)deleteTransactionsWithIdentifiers:(id)a3 forAppleAccountIdentifier:(id)a4 error:(id *)a5
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  _TtC10FinanceKit24AppleAccountDataImporter *v10;

  v6 = sub_23361E5DC();
  v7 = sub_23361E150();
  v9 = v8;
  v10 = self;
  sub_23318CDA0(v6, v7, v9);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return 1;
}

- (BOOL)deleteAllTransactionsFor:(id)a3 error:(id *)a4
{
  return sub_23318E734(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (void (*)(uint64_t, uint64_t))sub_23318DAD4);
}

- (BOOL)deleteAppleAccountWith:(id)a3 error:(id *)a4
{
  return sub_23318E734(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (void (*)(uint64_t, uint64_t))sub_23318E0F8);
}

- (void).cxx_destruct
{
  swift_release();
}

@end
