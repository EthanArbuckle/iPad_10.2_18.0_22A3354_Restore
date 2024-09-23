@implementation FKBankConnectOsloProvider

- (FKBankConnectOsloProvider)init
{
  FKBankConnectOsloProvider *v2;
  uint64_t v3;
  id v4;
  _TtC10FinanceKit23BankConnectOsloProvider *dataProvider;
  FKBankConnectOsloProvider *v6;
  NSObject *v7;
  id v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)FKBankConnectOsloProvider;
  v2 = -[FKBankConnectOsloProvider init](&v10, sel_init);
  if (!v2)
    goto LABEL_4;
  v9 = 0;
  +[BankConnectOsloProvider makeProviderAndReturnError:](_TtC10FinanceKit23BankConnectOsloProvider, "makeProviderAndReturnError:", &v9);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v9;
  dataProvider = v2->_dataProvider;
  v2->_dataProvider = (_TtC10FinanceKit23BankConnectOsloProvider *)v3;

  if (v2->_dataProvider)
  {

LABEL_4:
    v6 = v2;
    goto LABEL_8;
  }
  v7 = os_log_create("com.apple.FinanceKit", "BankConnect");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    -[FKBankConnectOsloProvider init].cold.1((uint64_t)v4, v7);

  v6 = 0;
LABEL_8:

  return v6;
}

- (void)listenForAccountsWithPrimaryAccountIdentifiers:(id)a3 callback:(id)a4
{
  -[BankConnectOsloProvider listenForAccountsWithPrimaryAccountIdentifiers:callback:](self->_dataProvider, "listenForAccountsWithPrimaryAccountIdentifiers:callback:", a3, a4);
}

- (_TtC10FinanceKit23BankConnectOsloProvider)dataProvider
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

- (void)init
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_233151000, a2, OS_LOG_TYPE_ERROR, "Error initializing FKBankConnectAccountBalancesProvider: %@", (uint8_t *)&v2, 0xCu);
}

@end
