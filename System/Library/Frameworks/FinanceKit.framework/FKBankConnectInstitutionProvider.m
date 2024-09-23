@implementation FKBankConnectInstitutionProvider

- (FKBankConnectInstitutionProvider)init
{
  FKBankConnectInstitutionProvider *v2;
  uint64_t v3;
  id v4;
  _TtC10FinanceKit30BankConnectInstitutionProvider *wrappedProvider;
  FKBankConnectInstitutionProvider *v6;
  NSObject *v7;
  id v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)FKBankConnectInstitutionProvider;
  v2 = -[FKBankConnectInstitutionProvider init](&v10, sel_init);
  if (!v2)
    goto LABEL_4;
  v9 = 0;
  +[BankConnectInstitutionProvider makeProviderAndReturnError:](_TtC10FinanceKit30BankConnectInstitutionProvider, "makeProviderAndReturnError:", &v9);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v9;
  wrappedProvider = v2->_wrappedProvider;
  v2->_wrappedProvider = (_TtC10FinanceKit30BankConnectInstitutionProvider *)v3;

  if (v2->_wrappedProvider)
  {

LABEL_4:
    v6 = v2;
    goto LABEL_8;
  }
  v7 = os_log_create("com.apple.FinanceKit", "BankConnect");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    -[FKBankConnectInstitutionProvider init].cold.1((uint64_t)v4, v7);

  v6 = 0;
LABEL_8:

  return v6;
}

- (void)institutionWithInstitutionID:(id)a3 completion:(id)a4
{
  -[BankConnectInstitutionProvider institutionFor:completion:](self->_wrappedProvider, "institutionFor:completion:", a3, a4);
}

- (_TtC10FinanceKit30BankConnectInstitutionProvider)wrappedProvider
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
  _os_log_error_impl(&dword_233151000, a2, OS_LOG_TYPE_ERROR, "Error initializing BankConnectInstitutionProvider: %@", (uint8_t *)&v2, 0xCu);
}

@end
