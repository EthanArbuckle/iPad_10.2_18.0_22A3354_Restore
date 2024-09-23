@implementation FKBankConnectAuthorizationSessionProvider

- (FKBankConnectAuthorizationSessionProvider)init
{
  FKBankConnectAuthorizationSessionProvider *v2;
  uint64_t v3;
  id v4;
  _TtC10FinanceKit39BankConnectAuthorizationSessionProvider *wrappedProvider;
  FKBankConnectAuthorizationSessionProvider *v6;
  NSObject *v7;
  id v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)FKBankConnectAuthorizationSessionProvider;
  v2 = -[FKBankConnectAuthorizationSessionProvider init](&v10, sel_init);
  if (!v2)
    goto LABEL_4;
  v9 = 0;
  +[BankConnectAuthorizationSessionProvider makeProviderAndReturnError:](_TtC10FinanceKit39BankConnectAuthorizationSessionProvider, "makeProviderAndReturnError:", &v9);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v9;
  wrappedProvider = v2->_wrappedProvider;
  v2->_wrappedProvider = (_TtC10FinanceKit39BankConnectAuthorizationSessionProvider *)v3;

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

- (void)authorizationSessionWithCompletion:(id)a3
{
  -[BankConnectAuthorizationSessionProvider authorizationSessionWithCompletion:](self->_wrappedProvider, "authorizationSessionWithCompletion:", a3);
}

- (_TtC10FinanceKit39BankConnectAuthorizationSessionProvider)wrappedProvider
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

@end
