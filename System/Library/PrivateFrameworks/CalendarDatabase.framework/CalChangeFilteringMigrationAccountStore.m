@implementation CalChangeFilteringMigrationAccountStore

- (CalChangeFilteringMigrationAccountStore)initWithBackingAccountStore:(id)a3 delegate:(id)a4
{
  id v7;
  id v8;
  CalChangeFilteringMigrationAccountStore *v9;
  CalChangeFilteringMigrationAccountStore *v10;
  uint64_t v11;
  NSMutableDictionary *addedWrappedAccounts;
  uint64_t v13;
  NSMutableDictionary *addedWrappedChildAccounts;
  uint64_t v15;
  NSMutableDictionary *loadedAccounts;
  uint64_t v17;
  NSMutableSet *removedWrappedAccountIdentifiers;
  objc_super v20;

  v7 = a3;
  v8 = a4;
  v20.receiver = self;
  v20.super_class = (Class)CalChangeFilteringMigrationAccountStore;
  v9 = -[CalChangeFilteringMigrationAccountStore init](&v20, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_backingAccountStore, a3);
    objc_storeWeak((id *)&v10->_delegate, v8);
    v11 = objc_opt_new();
    addedWrappedAccounts = v10->_addedWrappedAccounts;
    v10->_addedWrappedAccounts = (NSMutableDictionary *)v11;

    v13 = objc_opt_new();
    addedWrappedChildAccounts = v10->_addedWrappedChildAccounts;
    v10->_addedWrappedChildAccounts = (NSMutableDictionary *)v13;

    v15 = objc_opt_new();
    loadedAccounts = v10->_loadedAccounts;
    v10->_loadedAccounts = (NSMutableDictionary *)v15;

    v17 = objc_opt_new();
    removedWrappedAccountIdentifiers = v10->_removedWrappedAccountIdentifiers;
    v10->_removedWrappedAccountIdentifiers = (NSMutableSet *)v17;

  }
  return v10;
}

+ (id)storeFilteringAllChangesInBackingAccountStore:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  v6 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithBackingAccountStore:delegate:", v4, v5);

  return v6;
}

- (id)accountWithIdentifier:(id)a3
{
  return -[CalChangeFilteringMigrationAccountStore _accountWithIdentifier:preloadedBackingAccount:](self, "_accountWithIdentifier:preloadedBackingAccount:", a3, 0);
}

- (id)_accountWithIdentifier:(id)a3 preloadedBackingAccount:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  CalChangeFilteringMigrationAccount *v10;
  void *v11;
  void *v12;
  CalChangeFilteringMigrationAccount *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  CalChangeFilteringMigrationAccount *v21;
  CalChangeFilteringMigrationAccount *v22;
  void *v23;
  void *v24;

  v6 = a3;
  v7 = a4;
  -[CalChangeFilteringMigrationAccountStore removedWrappedAccountIdentifiers](self, "removedWrappedAccountIdentifiers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "containsObject:", v6);

  if ((v9 & 1) != 0)
  {
    v10 = 0;
  }
  else
  {
    -[CalChangeFilteringMigrationAccountStore addedWrappedAccounts](self, "addedWrappedAccounts");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      v13 = v12;
      v10 = v13;
    }
    else
    {
      -[CalChangeFilteringMigrationAccountStore loadedAccounts](self, "loadedAccounts");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectForKeyedSubscript:", v6);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15)
      {
        v10 = v15;
        v13 = 0;
      }
      else if (v7
             || (-[CalChangeFilteringMigrationAccountStore backingAccountStore](self, "backingAccountStore"),
                 v16 = (void *)objc_claimAutoreleasedReturnValue(),
                 objc_msgSend(v16, "accountWithIdentifier:", v6),
                 v7 = (id)objc_claimAutoreleasedReturnValue(),
                 v16,
                 v7))
      {
        objc_msgSend(v7, "parentAccountIdentifier");
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        if (v17
          || (-[CalChangeFilteringMigrationAccountStore delegate](self, "delegate"),
              v18 = (void *)objc_claimAutoreleasedReturnValue(),
              v19 = objc_msgSend(v18, "allowChangesToExistingTopLevelAccount:", v7),
              v18,
              !v19))
        {
          v22 = -[CalChangeFilteringMigrationAccount initWithBackingAccount:]([CalChangeFilteringMigrationAccount alloc], "initWithBackingAccount:", v7);
          -[CalChangeFilteringMigrationAccountStore loadedAccounts](self, "loadedAccounts");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "identifier");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "setObject:forKeyedSubscript:", v22, v24);

          v21 = v22;
          v13 = v21;
        }
        else
        {
          -[CalChangeFilteringMigrationAccountStore loadedAccounts](self, "loadedAccounts");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "setObject:forKeyedSubscript:", v7, v6);

          v21 = (CalChangeFilteringMigrationAccount *)v7;
          v7 = v21;
          v13 = 0;
        }
        v10 = v21;
      }
      else
      {
        v13 = 0;
        v10 = 0;
      }

    }
  }

  return v10;
}

- (id)topLevelAccountsWithAccountTypeIdentifier:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[CalChangeFilteringMigrationAccountStore backingAccountStore](self, "backingAccountStore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "topLevelAccountsWithAccountTypeIdentifier:error:", v6, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v8, "count"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v10 = v8;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v34;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v34 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
          objc_msgSend(v15, "identifier");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          -[CalChangeFilteringMigrationAccountStore _accountWithIdentifier:preloadedBackingAccount:](self, "_accountWithIdentifier:preloadedBackingAccount:", v16, v15);
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          if (v17)
            objc_msgSend(v9, "addObject:", v17);

        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
      }
      while (v12);
    }

    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    -[CalChangeFilteringMigrationAccountStore addedWrappedAccounts](self, "addedWrappedAccounts", 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "allValues");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v30;
      do
      {
        for (j = 0; j != v21; ++j)
        {
          if (*(_QWORD *)v30 != v22)
            objc_enumerationMutation(v19);
          v24 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * j);
          objc_msgSend(v24, "parentAccountIdentifier");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          if (v25)
          {

          }
          else
          {
            objc_msgSend(v24, "accountTypeIdentifier");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v27 = objc_msgSend(v26, "isEqualToString:", v6);

            if (v27)
              objc_msgSend(v9, "addObject:", v24);
          }
        }
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
      }
      while (v21);
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)childAccountsForAccount:(id)a3 withTypeIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t j;
  void *v34;
  void *v35;
  void *v36;
  int v37;
  id v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[CalChangeFilteringMigrationAccountStore removedWrappedAccountIdentifiers](self, "removedWrappedAccountIdentifiers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "containsObject:", v9);

  if ((v10 & 1) != 0)
  {
    v11 = 0;
  }
  else
  {
    v12 = (void *)objc_opt_new();
    -[CalChangeFilteringMigrationAccountStore addedWrappedAccounts](self, "addedWrappedAccounts");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "identifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKeyedSubscript:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v39 = v6;
    if (!v15)
    {
      -[CalChangeFilteringMigrationAccountStore _backingAccountForAccount:](self, "_backingAccountForAccount:", v6);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[CalChangeFilteringMigrationAccountStore backingAccountStore](self, "backingAccountStore");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "childAccountsForAccount:withTypeIdentifier:", v16, v7);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      v46 = 0u;
      v47 = 0u;
      v44 = 0u;
      v45 = 0u;
      v19 = v18;
      v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
      if (v20)
      {
        v21 = v20;
        v22 = *(_QWORD *)v45;
        do
        {
          for (i = 0; i != v21; ++i)
          {
            if (*(_QWORD *)v45 != v22)
              objc_enumerationMutation(v19);
            v24 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * i);
            objc_msgSend(v24, "identifier");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            -[CalChangeFilteringMigrationAccountStore _accountWithIdentifier:preloadedBackingAccount:](self, "_accountWithIdentifier:preloadedBackingAccount:", v25, v24);
            v26 = (void *)objc_claimAutoreleasedReturnValue();

            if (v26)
              objc_msgSend(v12, "addObject:", v26);

          }
          v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
        }
        while (v21);
      }

      v6 = v39;
    }
    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    -[CalChangeFilteringMigrationAccountStore addedWrappedChildAccounts](self, "addedWrappedChildAccounts");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "identifier");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "objectForKeyedSubscript:", v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
    if (v30)
    {
      v31 = v30;
      v32 = *(_QWORD *)v41;
      do
      {
        for (j = 0; j != v31; ++j)
        {
          if (*(_QWORD *)v41 != v32)
            objc_enumerationMutation(v29);
          -[CalChangeFilteringMigrationAccountStore _accountWithIdentifier:preloadedBackingAccount:](self, "_accountWithIdentifier:preloadedBackingAccount:", *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * j), 0);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = v34;
          if (v34)
          {
            objc_msgSend(v34, "accountTypeIdentifier");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            v37 = objc_msgSend(v36, "isEqualToString:", v7);

            if (v37)
              objc_msgSend(v12, "addObject:", v35);
          }

        }
        v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
      }
      while (v31);
    }

    v11 = (void *)objc_msgSend(v12, "copy");
    v6 = v39;
  }

  return v11;
}

- (id)createAccountWithAccountTypeIdentifier:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  int v8;
  void *v9;
  CalChangeFilteringMigrationAccount *v10;
  void *v11;
  void *v12;

  v6 = a3;
  -[CalChangeFilteringMigrationAccountStore delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "allowCreationOfTopLevelAccountWithTypeIdentifier:", v6);

  if (v8)
  {
    -[CalChangeFilteringMigrationAccountStore backingAccountStore](self, "backingAccountStore");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "createAccountWithAccountTypeIdentifier:error:", v6, a4);
    v10 = (CalChangeFilteringMigrationAccount *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "UUIDString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = -[CalChangeFilteringMigrationAccount initWithAccountIdentifier:accountTypeIdentifier:]([CalChangeFilteringMigrationAccount alloc], "initWithAccountIdentifier:accountTypeIdentifier:", v9, v6);
    -[CalChangeFilteringMigrationAccountStore addedWrappedAccounts](self, "addedWrappedAccounts");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v10, v9);

  }
  return v10;
}

- (id)createChildAccountOfParent:(id)a3 withAccountTypeIdentifier:(id)a4 error:(id *)a5
{
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  CalChangeFilteringMigrationAccount *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  v7 = a3;
  v8 = (void *)MEMORY[0x1E0CB3A28];
  v9 = a4;
  objc_msgSend(v8, "UUID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "UUIDString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = -[CalChangeFilteringMigrationAccount initWithAccountIdentifier:accountTypeIdentifier:]([CalChangeFilteringMigrationAccount alloc], "initWithAccountIdentifier:accountTypeIdentifier:", v11, v9);
  -[CalChangeFilteringMigrationAccountStore addedWrappedAccounts](self, "addedWrappedAccounts");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v12, v11);

  -[CalChangeFilteringMigrationAccountStore addedWrappedChildAccounts](self, "addedWrappedChildAccounts");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "identifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKeyedSubscript:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v16)
  {
    v16 = (void *)objc_opt_new();
    -[CalChangeFilteringMigrationAccountStore addedWrappedChildAccounts](self, "addedWrappedChildAccounts");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "identifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setObject:forKeyedSubscript:", v16, v18);

  }
  objc_msgSend(v16, "addObject:", v11);
  objc_msgSend(v7, "identifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[CalChangeFilteringMigrationAccount setParentAccountIdentifier:](v12, "setParentAccountIdentifier:", v19);

  return v12;
}

- (BOOL)removeAccount:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  char v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v18[4];
  id v19;

  v6 = a3;
  objc_msgSend(v6, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CalChangeFilteringMigrationAccountStore removedWrappedAccountIdentifiers](self, "removedWrappedAccountIdentifiers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "containsObject:", v7);

  if ((v9 & 1) != 0)
  {
    v10 = 1;
  }
  else
  {
    -[CalChangeFilteringMigrationAccountStore addedWrappedAccounts](self, "addedWrappedAccounts");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      -[CalChangeFilteringMigrationAccountStore addedWrappedAccounts](self, "addedWrappedAccounts");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "removeObjectForKey:", v7);

      -[CalChangeFilteringMigrationAccountStore addedWrappedChildAccounts](self, "addedWrappedChildAccounts");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __63__CalChangeFilteringMigrationAccountStore_removeAccount_error___block_invoke;
      v18[3] = &unk_1E4F84238;
      v19 = v7;
      objc_msgSend(v14, "enumerateKeysAndObjectsUsingBlock:", v18);

      v15 = v19;
    }
    else
    {
      -[CalChangeFilteringMigrationAccountStore loadedAccounts](self, "loadedAccounts");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "removeObjectForKey:", v7);
    }

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[CalChangeFilteringMigrationAccountStore removedWrappedAccountIdentifiers](self, "removedWrappedAccountIdentifiers");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "addObject:", v7);
      v10 = 1;
    }
    else
    {
      -[CalChangeFilteringMigrationAccountStore backingAccountStore](self, "backingAccountStore");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v16, "removeAccount:error:", v6, a4);
    }

  }
  return v10;
}

uint64_t __63__CalChangeFilteringMigrationAccountStore_removeAccount_error___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "removeObject:", *(_QWORD *)(a1 + 32));
}

- (BOOL)saveAccount:(id)a3 withError:(id *)a4
{
  id v6;
  char v7;
  void *v8;

  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = 1;
  }
  else
  {
    -[CalChangeFilteringMigrationAccountStore backingAccountStore](self, "backingAccountStore");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v8, "saveAccount:withError:", v6, a4);

  }
  return v7;
}

- (id)_backingAccountForAccount:(id)a3
{
  id v3;
  id v4;
  void *v5;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "backingAccount");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = v3;
  }
  v5 = v4;

  return v5;
}

- (CalMigrationAccountStore)backingAccountStore
{
  return self->_backingAccountStore;
}

- (CalChangeFilteringMigrationAccountStoreDelegate)delegate
{
  return (CalChangeFilteringMigrationAccountStoreDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (NSMutableDictionary)addedWrappedAccounts
{
  return self->_addedWrappedAccounts;
}

- (NSMutableDictionary)addedWrappedChildAccounts
{
  return self->_addedWrappedChildAccounts;
}

- (NSMutableDictionary)loadedAccounts
{
  return self->_loadedAccounts;
}

- (NSMutableSet)removedWrappedAccountIdentifiers
{
  return self->_removedWrappedAccountIdentifiers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_removedWrappedAccountIdentifiers, 0);
  objc_storeStrong((id *)&self->_loadedAccounts, 0);
  objc_storeStrong((id *)&self->_addedWrappedChildAccounts, 0);
  objc_storeStrong((id *)&self->_addedWrappedAccounts, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_backingAccountStore, 0);
}

@end
