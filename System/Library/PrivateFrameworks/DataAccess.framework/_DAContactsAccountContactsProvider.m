@implementation _DAContactsAccountContactsProvider

- (_DAContactsAccountContactsProvider)initWithContactStore:(id)a3
{
  id v5;
  _DAContactsAccountContactsProvider *v6;
  _DAContactsAccountContactsProvider *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_DAContactsAccountContactsProvider;
  v6 = -[_DAContactsAccountContactsProvider init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_contactStore, a3);

  return v7;
}

- (id)fetchedAccountWithExternalIdentifier:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  DAContactsBasedAccount *v8;

  objc_msgSend(MEMORY[0x1E0C971B0], "predicateForAccountWithExternalIdentifier:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_DAContactsAccountContactsProvider contactStore](self, "contactStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accountsMatchingPredicate:error:", v4, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    v8 = -[DAContactsBasedAccount initWithAccount:]([DAContactsBasedAccount alloc], "initWithAccount:", v7);
  else
    v8 = 0;

  return v8;
}

- (id)accountByCreatingAccountWithExternalIdentifier:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;
  DAContactsBasedAccount *v6;

  v3 = (objc_class *)MEMORY[0x1E0C971B0];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithExternalIdentifier:", v4);

  if (v5)
    v6 = -[DAContactsBasedAccount initWithAccount:]([DAContactsBasedAccount alloc], "initWithAccount:", v5);
  else
    v6 = 0;

  return v6;
}

- (id)allAccounts
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  DAContactsBasedAccount *v12;
  DAContactsBasedAccount *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  id v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  -[_DAContactsAccountContactsProvider contactStore](self, "contactStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0;
  objc_msgSend(v2, "accountsMatchingPredicate:error:", 0, &v19);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v19;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = v3;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v10);
        v12 = [DAContactsBasedAccount alloc];
        v13 = -[DAContactsBasedAccount initWithAccount:](v12, "initWithAccount:", v11, (_QWORD)v15);
        objc_msgSend(v5, "addObject:", v13);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
    }
    while (v8);
  }

  return v5;
}

- (id)accountForContainerWithIdentifier:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  DAContactsBasedAccount *v8;
  uint64_t v10;

  objc_msgSend(MEMORY[0x1E0C971B0], "predicateForAccountForContainerWithIdentifier:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_DAContactsAccountContactsProvider contactStore](self, "contactStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  objc_msgSend(v5, "accountsMatchingPredicate:error:", v4, &v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    v8 = -[DAContactsBasedAccount initWithAccount:]([DAContactsBasedAccount alloc], "initWithAccount:", v7);
  else
    v8 = 0;

  return v8;
}

- (CNContactStore)contactStore
{
  return self->_contactStore;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactStore, 0);
}

@end
