@implementation TransactionsListProvider

- (FKBankConnectTransactionsListProviderDelegate)delegate
{
  char *v2;

  v2 = (char *)self + OBJC_IVAR____TtC10FinanceKit24TransactionsListProvider_delegate;
  swift_beginAccess();
  return (FKBankConnectTransactionsListProviderDelegate *)(id)MEMORY[0x23493465C](v2);
}

- (void)setDelegate:(id)a3
{
  swift_beginAccess();
  swift_unknownObjectWeakAssign();
}

+ (id)makeProviderWithPrimaryAccountIdentifier:(id)a3 dateFromYear:(id)a4 groupType:(unint64_t)a5
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v15;

  v6 = sub_23361D634();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_23361E150();
  v12 = v11;
  sub_23361D5EC();
  v13 = sub_233531F20(v10, v12, (uint64_t)v9, a5);
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return v13;
}

- (void)performFetchAndStartObservingNotifications
{
  _TtC10FinanceKit24TransactionsListProvider *v2;

  v2 = self;
  sub_233530D34();

}

- (_TtC10FinanceKit24TransactionsListProvider)init
{
  _TtC10FinanceKit24TransactionsListProvider *result;

  result = (_TtC10FinanceKit24TransactionsListProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  swift_bridgeObjectRelease();
  swift_release();

  swift_release();
  swift_release();
  sub_233168500((uint64_t)self + OBJC_IVAR____TtC10FinanceKit24TransactionsListProvider_formatterConfiguration, (uint64_t (*)(_QWORD))type metadata accessor for FormatterConfiguration);
  v3 = (char *)self + OBJC_IVAR____TtC10FinanceKit24TransactionsListProvider_dateFromYear;
  v4 = sub_23361D634();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease();
  sub_233291C90((uint64_t)self + OBJC_IVAR____TtC10FinanceKit24TransactionsListProvider_delegate);
}

@end
