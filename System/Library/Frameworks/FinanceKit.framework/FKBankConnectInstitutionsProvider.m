@implementation FKBankConnectInstitutionsProvider

- (FKBankConnectInstitutionsProvider)init
{
  FKBankConnectInstitutionsProvider *v2;
  uint64_t v3;
  id v4;
  _TtC10FinanceKit31BankConnectInstitutionsProvider *wrappedProvider;
  FKBankConnectInstitutionsProvider *v6;
  NSObject *v7;
  id v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)FKBankConnectInstitutionsProvider;
  v2 = -[FKBankConnectInstitutionsProvider init](&v10, sel_init);
  if (!v2)
    goto LABEL_4;
  v9 = 0;
  +[BankConnectInstitutionsProvider makeProviderAndReturnError:](_TtC10FinanceKit31BankConnectInstitutionsProvider, "makeProviderAndReturnError:", &v9);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v9;
  wrappedProvider = v2->_wrappedProvider;
  v2->_wrappedProvider = (_TtC10FinanceKit31BankConnectInstitutionsProvider *)v3;

  if (v2->_wrappedProvider)
  {

LABEL_4:
    v6 = v2;
    goto LABEL_8;
  }
  v7 = os_log_create("com.apple.FinanceKit", "BankConnect");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    -[FKBankConnectInstitutionsProvider init].cold.1((uint64_t)v4, v7);

  v6 = 0;
LABEL_8:

  return v6;
}

- (void)setDelegate:(id)a3
{
  -[BankConnectInstitutionsProvider setDelegate:](self->_wrappedProvider, "setDelegate:", a3);
}

- (FKBankConnectInstitutionsProviderDelegate)delegate
{
  return -[BankConnectInstitutionsProvider delegate](self->_wrappedProvider, "delegate");
}

- (void)connectedInstitutionsWithCompletion:(id)a3
{
  -[BankConnectInstitutionsProvider fetchConnectedInstitutionsWithCompletion:](self->_wrappedProvider, "fetchConnectedInstitutionsWithCompletion:", a3);
}

- (_TtC10FinanceKit31BankConnectInstitutionsProvider)wrappedProvider
{
  return self->_wrappedProvider;
}

- (void)setWrappedProvider:(id)a3
{
  objc_storeStrong((id *)&self->_wrappedProvider, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wrappedProvider, 0);
}

- (void)init
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_233151000, a2, OS_LOG_TYPE_ERROR, "Error initializing BankConnectInstitutionsProvider: %@", (uint8_t *)&v2, 0xCu);
}

@end
