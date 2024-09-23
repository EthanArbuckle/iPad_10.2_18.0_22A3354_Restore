@implementation TransactionsAndGroupsProvider

- (FKBankConnectTransactionsAndGroupsProviderDelegate)delegate
{
  char *v2;

  v2 = (char *)self + OBJC_IVAR____TtC10FinanceKit29TransactionsAndGroupsProvider_delegate;
  swift_beginAccess();
  return (FKBankConnectTransactionsAndGroupsProviderDelegate *)(id)MEMORY[0x23493465C](v2);
}

- (void)setDelegate:(id)a3
{
  swift_beginAccess();
  swift_unknownObjectWeakAssign();
}

+ (id)makeProviderWithPrimaryAccountIdentifier:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  id v5;

  v3 = sub_23361E150();
  v5 = sub_233495030(v3, v4, 10);
  swift_bridgeObjectRelease();
  return v5;
}

+ (id)makeProviderWithPrimaryAccountIdentifier:(id)a3 fixedNumberOfLatestTransactions:(int64_t)a4
{
  uint64_t v5;
  uint64_t v6;
  id v7;

  v5 = sub_23361E150();
  v7 = sub_233495030(v5, v6, a4);
  swift_bridgeObjectRelease();
  return v7;
}

- (void)performFetchAndStartObservingNotifications
{
  _TtC10FinanceKit29TransactionsAndGroupsProvider *v2;

  v2 = self;
  sub_233492528();

}

- (_TtC10FinanceKit29TransactionsAndGroupsProvider)init
{
  _TtC10FinanceKit29TransactionsAndGroupsProvider *result;

  result = (_TtC10FinanceKit29TransactionsAndGroupsProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_release();

  sub_233168500((uint64_t)self + OBJC_IVAR____TtC10FinanceKit29TransactionsAndGroupsProvider_formatterConfiguration, (uint64_t (*)(_QWORD))type metadata accessor for FormatterConfiguration);
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_233291C90((uint64_t)self + OBJC_IVAR____TtC10FinanceKit29TransactionsAndGroupsProvider_delegate);
}

@end
