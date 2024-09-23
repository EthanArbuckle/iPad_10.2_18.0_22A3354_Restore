@implementation CADACAccountStoreAccountsProvider

- (CADACAccountStoreAccountsProvider)initWithAccountStore:(id)a3
{
  id v5;
  CADACAccountStoreAccountsProvider *v6;
  CADACAccountStoreAccountsProvider *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CADACAccountStoreAccountsProvider;
  v6 = -[CADACAccountStoreAccountsProvider init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_accountStore, a3);

  return v7;
}

- (id)accounts
{
  void *v2;
  void *v3;

  -[CADACAccountStoreAccountsProvider accountStore](self, "accountStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accounts");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)accountWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[CADACAccountStoreAccountsProvider accountStore](self, "accountStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accountWithIdentifier:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (ACAccountStore)accountStore
{
  return self->_accountStore;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountStore, 0);
}

@end
