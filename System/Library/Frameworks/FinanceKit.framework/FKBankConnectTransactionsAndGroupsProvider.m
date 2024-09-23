@implementation FKBankConnectTransactionsAndGroupsProvider

- (FKBankConnectTransactionsAndGroupsProvider)initWithPrimaryAccountIdentifier:(id)a3 fixedNumberOfLatestTransactions:(unint64_t)a4
{
  id v6;
  FKBankConnectTransactionsAndGroupsProvider *v7;
  uint64_t v8;
  _TtC10FinanceKit29TransactionsAndGroupsProvider *dataProvider;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)FKBankConnectTransactionsAndGroupsProvider;
  v7 = -[FKBankConnectTransactionsAndGroupsProvider init](&v11, sel_init);
  if (v7)
  {
    +[TransactionsAndGroupsProvider makeProviderWithPrimaryAccountIdentifier:fixedNumberOfLatestTransactions:](_TtC10FinanceKit29TransactionsAndGroupsProvider, "makeProviderWithPrimaryAccountIdentifier:fixedNumberOfLatestTransactions:", v6, a4);
    v8 = objc_claimAutoreleasedReturnValue();
    dataProvider = v7->_dataProvider;
    v7->_dataProvider = (_TtC10FinanceKit29TransactionsAndGroupsProvider *)v8;

  }
  return v7;
}

- (FKBankConnectTransactionsAndGroupsProvider)initWithPrimaryAccountIdentifier:(id)a3
{
  id v4;
  FKBankConnectTransactionsAndGroupsProvider *v5;
  uint64_t v6;
  _TtC10FinanceKit29TransactionsAndGroupsProvider *dataProvider;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FKBankConnectTransactionsAndGroupsProvider;
  v5 = -[FKBankConnectTransactionsAndGroupsProvider init](&v9, sel_init);
  if (v5)
  {
    +[TransactionsAndGroupsProvider makeProviderWithPrimaryAccountIdentifier:](_TtC10FinanceKit29TransactionsAndGroupsProvider, "makeProviderWithPrimaryAccountIdentifier:", v4);
    v6 = objc_claimAutoreleasedReturnValue();
    dataProvider = v5->_dataProvider;
    v5->_dataProvider = (_TtC10FinanceKit29TransactionsAndGroupsProvider *)v6;

  }
  return v5;
}

- (void)performFetchAndStartObservingNotifications
{
  -[TransactionsAndGroupsProvider performFetchAndStartObservingNotifications](self->_dataProvider, "performFetchAndStartObservingNotifications");
}

- (void)setDelegate:(id)a3
{
  -[TransactionsAndGroupsProvider setDelegate:](self->_dataProvider, "setDelegate:", a3);
}

- (FKBankConnectTransactionsAndGroupsProviderDelegate)delegate
{
  return -[TransactionsAndGroupsProvider delegate](self->_dataProvider, "delegate");
}

- (_TtC10FinanceKit29TransactionsAndGroupsProvider)dataProvider
{
  return self->_dataProvider;
}

- (void)setDataProvider:(id)a3
{
  objc_storeStrong((id *)&self->_dataProvider, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataProvider, 0);
}

@end
