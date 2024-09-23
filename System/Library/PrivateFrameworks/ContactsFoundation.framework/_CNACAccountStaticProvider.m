@implementation _CNACAccountStaticProvider

- (_CNACAccountStaticProvider)initWithAccounts:(id)a3
{
  id v5;
  _CNACAccountStaticProvider *v6;
  _CNACAccountStaticProvider *v7;
  _CNACAccountStaticProvider *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_CNACAccountStaticProvider;
  v6 = -[_CNACAccountStaticProvider init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_accountChildAccountsPairs, a3);
    v8 = v7;
  }

  return v7;
}

- (id)allAccountTypes
{
  void *v2;
  void *v3;
  void *v4;

  -[_CNACAccountStaticProvider accountChildAccountsPairs](self, "accountChildAccountsPairs");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_cn_reduce:initialValue:", &__block_literal_global_71, MEMORY[0x1E0C9AA60]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_cn_map:", &__block_literal_global_22);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)accountsWithAccountType:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  -[_CNACAccountStaticProvider accountChildAccountsPairs](self, "accountChildAccountsPairs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_cn_reduce:initialValue:", &__block_literal_global_71, MEMORY[0x1E0C9AA60]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __54___CNACAccountStaticProvider_accountsWithAccountType___block_invoke;
  v10[3] = &unk_1E29BC0F0;
  v11 = v4;
  v7 = v4;
  objc_msgSend(v6, "_cn_filter:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)childAccountsForAccount:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  -[_CNACAccountStaticProvider accountChildAccountsPairs](self, "accountChildAccountsPairs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __54___CNACAccountStaticProvider_childAccountsForAccount___block_invoke;
  v10[3] = &unk_1E29BC160;
  v11 = v4;
  v6 = v4;
  objc_msgSend(v5, "_cn_firstObjectPassingTest:", v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "second");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)isAccountSyncable:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  char v9;
  _QWORD v11[4];
  id v12;

  v4 = a3;
  -[_CNACAccountStaticProvider accountChildAccountsPairs](self, "accountChildAccountsPairs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_cn_reduce:initialValue:", &__block_literal_global_71, MEMORY[0x1E0C9AA60]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_cn_filter:", &__block_literal_global_23);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __48___CNACAccountStaticProvider_isAccountSyncable___block_invoke;
  v11[3] = &unk_1E29BC0F0;
  v12 = v4;
  v8 = v4;
  v9 = objc_msgSend(v7, "_cn_any:", v11);

  return v9;
}

- (NSArray)accountChildAccountsPairs
{
  return self->_accountChildAccountsPairs;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountChildAccountsPairs, 0);
}

@end
