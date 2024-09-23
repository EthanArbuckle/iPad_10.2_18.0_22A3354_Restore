@implementation FKBankConnectAccountsProvider

- (FKBankConnectAccountsProvider)initWithPrimaryAccountIdentifier:(id)a3
{
  id v4;
  FKBankConnectAccountsProvider *v5;
  uint64_t v6;
  _TtC10FinanceKit27BankConnectAccountsProvider *dataProvider;
  FKBankConnectAccountsProvider *v8;
  NSObject *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)FKBankConnectAccountsProvider;
  v5 = -[FKBankConnectAccountsProvider init](&v11, sel_init);
  if (v5
    && (+[BankConnectAccountsProvider makeProviderWithPrimaryAccountIdentifier:](_TtC10FinanceKit27BankConnectAccountsProvider, "makeProviderWithPrimaryAccountIdentifier:", v4), v6 = objc_claimAutoreleasedReturnValue(), dataProvider = v5->_dataProvider, v5->_dataProvider = (_TtC10FinanceKit27BankConnectAccountsProvider *)v6, dataProvider, !v5->_dataProvider))
  {
    v9 = os_log_create("com.apple.FinanceKit", "BankConnect");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[FKBankConnectAccountsProvider initWithPrimaryAccountIdentifier:].cold.1(v9);

    v8 = 0;
  }
  else
  {
    v8 = v5;
  }

  return v8;
}

- (void)accountAndReconsentStatusWithCompletion:(id)a3
{
  -[BankConnectAccountsProvider accountAndReconsentStatusWithCompletion:](self->_dataProvider, "accountAndReconsentStatusWithCompletion:", a3);
}

- (void)setDelegate:(id)a3
{
  -[BankConnectAccountsProvider setDelegate:](self->_dataProvider, "setDelegate:", a3);
}

- (FKBankConnectAccountsProviderDelegate)delegate
{
  return -[BankConnectAccountsProvider delegate](self->_dataProvider, "delegate");
}

- (_TtC10FinanceKit27BankConnectAccountsProvider)dataProvider
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

- (void)initWithPrimaryAccountIdentifier:(os_log_t)log .cold.1(os_log_t log)
{
  int v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v1 = 138412290;
  v2 = 0;
  _os_log_error_impl(&dword_233151000, log, OS_LOG_TYPE_ERROR, "Error initializing FKBankConnectAccountsProvider: %@", (uint8_t *)&v1, 0xCu);
}

@end
