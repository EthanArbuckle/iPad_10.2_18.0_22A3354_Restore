@implementation BankConnectOsloProvider

+ (id)makeProviderAndReturnError:(id *)a3
{
  void *v3;
  objc_class *v4;
  char *v5;
  objc_super v7;

  if (qword_254244AD0 != -1)
    swift_once();
  v3 = off_254245198;
  v4 = (objc_class *)type metadata accessor for BankConnectOsloProvider();
  v5 = (char *)objc_allocWithZone(v4);
  *(_QWORD *)&v5[OBJC_IVAR____TtC10FinanceKit23BankConnectOsloProvider_consentsTask] = 0;
  *(_QWORD *)&v5[OBJC_IVAR____TtC10FinanceKit23BankConnectOsloProvider_accountsTask] = 0;
  *(_QWORD *)&v5[OBJC_IVAR____TtC10FinanceKit23BankConnectOsloProvider_balancesTask] = 0;
  *(_QWORD *)&v5[OBJC_IVAR____TtC10FinanceKit23BankConnectOsloProvider_callbackCancellable] = 0;
  *(_QWORD *)&v5[OBJC_IVAR____TtC10FinanceKit23BankConnectOsloProvider_financeStore] = v3;
  v7.receiver = v5;
  v7.super_class = v4;
  swift_retain();
  return objc_msgSendSuper2(&v7, sel_init);
}

- (void)listenForAccountsWithPrimaryAccountIdentifiers:(id)a3 callback:(id)a4
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  _TtC10FinanceKit23BankConnectOsloProvider *v8;

  v5 = _Block_copy(a4);
  v6 = sub_23361E5DC();
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = v5;
  v8 = self;
  sub_2332052E4(v6, (uint64_t)sub_2331CA260, v7);
  swift_release();
  swift_bridgeObjectRelease();

}

- (void)dealloc
{
  _TtC10FinanceKit23BankConnectOsloProvider *v2;
  objc_super v3;

  v2 = self;
  sub_23320697C();
  v3.receiver = v2;
  v3.super_class = (Class)type metadata accessor for BankConnectOsloProvider();
  -[BankConnectOsloProvider dealloc](&v3, sel_dealloc);
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
}

- (_TtC10FinanceKit23BankConnectOsloProvider)init
{
  _TtC10FinanceKit23BankConnectOsloProvider *result;

  result = (_TtC10FinanceKit23BankConnectOsloProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
