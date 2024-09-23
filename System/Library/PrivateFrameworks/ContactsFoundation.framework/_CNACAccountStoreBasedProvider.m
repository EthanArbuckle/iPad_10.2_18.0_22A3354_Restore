@implementation _CNACAccountStoreBasedProvider

- (_CNACAccountStoreBasedProvider)initWithAccountStore:(id)a3
{
  id v5;
  _CNACAccountStoreBasedProvider *v6;
  _CNACAccountStoreBasedProvider *v7;
  _CNACAccountStoreBasedProvider *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_CNACAccountStoreBasedProvider;
  v6 = -[_CNACAccountStoreBasedProvider init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_accountStore, a3);
    v8 = v7;
  }

  return v7;
}

- (id)allAccountTypes
{
  void *v2;
  void *v3;

  -[_CNACAccountStoreBasedProvider accountStore](self, "accountStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allAccountTypes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)accountsWithAccountType:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[_CNACAccountStoreBasedProvider accountStore](self, "accountStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accountsWithAccountType:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)childAccountsForAccount:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[_CNACAccountStoreBasedProvider accountStore](self, "accountStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "childAccountsForAccount:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)isAccountSyncable:(id)a3
{
  void *v3;
  void *v4;
  char v5;

  objc_msgSend(a3, "accountType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "syncableDataclasses");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "containsObject:", *MEMORY[0x1E0C8F388]);

  return v5;
}

- (BOOL)isAnyAccountSyncableIgnoringAccount:(id)a3
{
  uint64_t v4;
  void *v5;
  __CFString *v6;
  __CFString *v7;
  void *v8;
  __CFString *v9;
  _QWORD v11[5];
  __CFString *v12;

  objc_msgSend(a3, "identifier");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  v6 = &stru_1E29BCC70;
  if (v4)
    v6 = (__CFString *)v4;
  v7 = v6;

  -[_CNACAccountStoreBasedProvider allAccountTypes](self, "allAccountTypes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __70___CNACAccountStoreBasedProvider_isAnyAccountSyncableIgnoringAccount___block_invoke;
  v11[3] = &unk_1E29BC118;
  v11[4] = self;
  v12 = v7;
  v9 = v7;
  LOBYTE(v7) = objc_msgSend(v8, "_cn_any:", v11);

  return (char)v7;
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
