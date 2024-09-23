@implementation FKBankConnectSpotlightTransactionsProvider

- (FKBankConnectSpotlightTransactionsProvider)init
{
  FKBankConnectSpotlightTransactionsProvider *v2;
  uint64_t v3;
  _TtC10FinanceKit40BankConnectSpotlightTransactionsProvider *spotlightProvider;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)FKBankConnectSpotlightTransactionsProvider;
  v2 = -[FKBankConnectSpotlightTransactionsProvider init](&v6, sel_init);
  if (v2)
  {
    +[BankConnectSpotlightTransactionsProvider makeProvider](_TtC10FinanceKit40BankConnectSpotlightTransactionsProvider, "makeProvider");
    v3 = objc_claimAutoreleasedReturnValue();
    spotlightProvider = v2->_spotlightProvider;
    v2->_spotlightProvider = (_TtC10FinanceKit40BankConnectSpotlightTransactionsProvider *)v3;

  }
  return v2;
}

- (void)transactionWithURL:(id)a3 completion:(id)a4
{
  -[BankConnectSpotlightTransactionsProvider transactionWithURL:completion:](self->_spotlightProvider, "transactionWithURL:completion:", a3, a4);
}

- (_TtC10FinanceKit40BankConnectSpotlightTransactionsProvider)spotlightProvider
{
  return self->_spotlightProvider;
}

- (void)setSpotlightProvider:(id)a3
{
  objc_storeStrong((id *)&self->_spotlightProvider, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spotlightProvider, 0);
}

@end
