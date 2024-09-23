@implementation FKBankConnectTransactionsListProvider

- (FKBankConnectTransactionsListProvider)initWithPrimaryAccountIdentifier:(id)a3 dateFromYear:(id)a4 groupType:(unint64_t)a5
{
  id v8;
  id v9;
  FKBankConnectTransactionsListProvider *v10;
  uint64_t v11;
  _TtC10FinanceKit24TransactionsListProvider *dataProvider;
  objc_super v14;

  v8 = a3;
  v9 = a4;
  v14.receiver = self;
  v14.super_class = (Class)FKBankConnectTransactionsListProvider;
  v10 = -[FKBankConnectTransactionsListProvider init](&v14, sel_init);
  if (v10)
  {
    +[TransactionsListProvider makeProviderWithPrimaryAccountIdentifier:dateFromYear:groupType:](_TtC10FinanceKit24TransactionsListProvider, "makeProviderWithPrimaryAccountIdentifier:dateFromYear:groupType:", v8, v9, a5);
    v11 = objc_claimAutoreleasedReturnValue();
    dataProvider = v10->_dataProvider;
    v10->_dataProvider = (_TtC10FinanceKit24TransactionsListProvider *)v11;

  }
  return v10;
}

- (void)performFetchAndStartObservingNotifications
{
  -[TransactionsListProvider performFetchAndStartObservingNotifications](self->_dataProvider, "performFetchAndStartObservingNotifications");
}

- (void)setDelegate:(id)a3
{
  -[TransactionsListProvider setDelegate:](self->_dataProvider, "setDelegate:", a3);
}

- (FKBankConnectTransactionsListProviderDelegate)delegate
{
  return -[TransactionsListProvider delegate](self->_dataProvider, "delegate");
}

- (_TtC10FinanceKit24TransactionsListProvider)dataProvider
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
