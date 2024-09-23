@implementation CalPlistSavingMigrationAccountStore

- (CalPlistSavingMigrationAccountStore)initWithPlistURL:(id)a3 backingAccountStore:(id)a4
{
  id v7;
  id v8;
  CalPlistSavingMigrationAccountStore *v9;
  CalPlistSavingMigrationAccountStore *v10;
  uint64_t v11;
  NSMutableDictionary *addedAccounts;
  uint64_t v13;
  NSMutableDictionary *modifiedAccounts;
  uint64_t v15;
  NSMutableDictionary *loadedAccounts;
  uint64_t v17;
  NSMutableDictionary *addedChildAccounts;
  uint64_t v19;
  NSMutableSet *deletedAccountIdentifiers;
  objc_super v22;

  v7 = a3;
  v8 = a4;
  v22.receiver = self;
  v22.super_class = (Class)CalPlistSavingMigrationAccountStore;
  v9 = -[CalPlistSavingMigrationAccountStore init](&v22, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_plistURL, a3);
    objc_storeStrong((id *)&v10->_backingAccountStore, a4);
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v11 = objc_claimAutoreleasedReturnValue();
    addedAccounts = v10->_addedAccounts;
    v10->_addedAccounts = (NSMutableDictionary *)v11;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v13 = objc_claimAutoreleasedReturnValue();
    modifiedAccounts = v10->_modifiedAccounts;
    v10->_modifiedAccounts = (NSMutableDictionary *)v13;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v15 = objc_claimAutoreleasedReturnValue();
    loadedAccounts = v10->_loadedAccounts;
    v10->_loadedAccounts = (NSMutableDictionary *)v15;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v17 = objc_claimAutoreleasedReturnValue();
    addedChildAccounts = v10->_addedChildAccounts;
    v10->_addedChildAccounts = (NSMutableDictionary *)v17;

    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v19 = objc_claimAutoreleasedReturnValue();
    deletedAccountIdentifiers = v10->_deletedAccountIdentifiers;
    v10->_deletedAccountIdentifiers = (NSMutableSet *)v19;

  }
  return v10;
}

- (id)_accountWithIdentifier:(id)a3 preloadedBackingAccount:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  CalPlistSavingMigrationAccount *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  CalPlistSavingMigrationAccount *v15;
  void *v16;
  void *v17;

  v6 = a3;
  v7 = a4;
  -[CalPlistSavingMigrationAccountStore deletedAccountIdentifiers](self, "deletedAccountIdentifiers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "containsObject:", v6);

  if ((v9 & 1) != 0)
  {
LABEL_2:
    v10 = 0;
    goto LABEL_9;
  }
  -[CalPlistSavingMigrationAccountStore addedAccounts](self, "addedAccounts");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", v6);
  v10 = (CalPlistSavingMigrationAccount *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    -[CalPlistSavingMigrationAccountStore modifiedAccounts](self, "modifiedAccounts");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKeyedSubscript:", v6);
    v10 = (CalPlistSavingMigrationAccount *)objc_claimAutoreleasedReturnValue();

    if (!v10)
    {
      -[CalPlistSavingMigrationAccountStore loadedAccounts](self, "loadedAccounts");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "objectForKeyedSubscript:", v6);
      v10 = (CalPlistSavingMigrationAccount *)objc_claimAutoreleasedReturnValue();

      if (!v10)
      {
        if (v7
          || (-[CalPlistSavingMigrationAccountStore backingAccountStore](self, "backingAccountStore"),
              v14 = (void *)objc_claimAutoreleasedReturnValue(),
              objc_msgSend(v14, "accountWithIdentifier:", v6),
              v7 = (id)objc_claimAutoreleasedReturnValue(),
              v14,
              v7))
        {
          v15 = [CalPlistSavingMigrationAccount alloc];
          objc_msgSend(v7, "accountTypeIdentifier");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = -[CalPlistSavingMigrationAccount initWithIdentifier:accountTypeIdentifier:backingAccount:initialProperties:](v15, "initWithIdentifier:accountTypeIdentifier:backingAccount:initialProperties:", v6, v16, v7, 0);

          -[CalPlistSavingMigrationAccountStore loadedAccounts](self, "loadedAccounts");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "setObject:forKeyedSubscript:", v10, v6);

          goto LABEL_9;
        }
        goto LABEL_2;
      }
    }
  }
LABEL_9:

  return v10;
}

- (id)accountWithIdentifier:(id)a3
{
  return -[CalPlistSavingMigrationAccountStore _accountWithIdentifier:preloadedBackingAccount:](self, "_accountWithIdentifier:preloadedBackingAccount:", a3, 0);
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

  v39 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  -[CalPlistSavingMigrationAccountStore backingAccountStore](self, "backingAccountStore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "topLevelAccountsWithAccountTypeIdentifier:error:", v6, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v8, "count"));
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
          -[CalPlistSavingMigrationAccountStore _accountWithIdentifier:preloadedBackingAccount:](self, "_accountWithIdentifier:preloadedBackingAccount:", v16, v15);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
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
    -[CalPlistSavingMigrationAccountStore addedAccounts](self, "addedAccounts", 0);
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
  NSObject *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t j;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  NSObject *v39;
  NSObject *v41;
  void *v42;
  id v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v6;
    -[CalPlistSavingMigrationAccountStore deletedAccountIdentifiers](self, "deletedAccountIdentifiers");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject identifier](v8, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "containsObject:", v10);

    if ((v11 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[CalPlistSavingMigrationAccountStore addedAccounts](self, "addedAccounts");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject identifier](v8, "identifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "objectForKeyedSubscript:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      v43 = v7;
      if (!v15)
      {
        -[NSObject backingAccount](v8, "backingAccount");
        v16 = objc_claimAutoreleasedReturnValue();
        if (!v16)
        {
          +[CalMigrationLog defaultCategory](CalMigrationLog, "defaultCategory");
          v41 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v41, OS_LOG_TYPE_FAULT))
            -[CalPlistSavingMigrationAccountStore childAccountsForAccount:withTypeIdentifier:].cold.1();

          v38 = 0;
LABEL_31:

          goto LABEL_32;
        }
        v17 = (void *)v16;
        -[CalPlistSavingMigrationAccountStore backingAccountStore](self, "backingAccountStore");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = v17;
        objc_msgSend(v18, "childAccountsForAccount:withTypeIdentifier:", v17, v7);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        v50 = 0u;
        v51 = 0u;
        v48 = 0u;
        v49 = 0u;
        v20 = v19;
        v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v48, v53, 16);
        if (v21)
        {
          v22 = v21;
          v23 = *(_QWORD *)v49;
          do
          {
            for (i = 0; i != v22; ++i)
            {
              if (*(_QWORD *)v49 != v23)
                objc_enumerationMutation(v20);
              v25 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * i);
              objc_msgSend(v25, "identifier");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              -[CalPlistSavingMigrationAccountStore _accountWithIdentifier:preloadedBackingAccount:](self, "_accountWithIdentifier:preloadedBackingAccount:", v26, v25);
              v27 = (void *)objc_claimAutoreleasedReturnValue();

              if (v27)
                objc_msgSend(v12, "addObject:", v27);

            }
            v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v48, v53, 16);
          }
          while (v22);
        }

      }
      v46 = 0u;
      v47 = 0u;
      v44 = 0u;
      v45 = 0u;
      -[CalPlistSavingMigrationAccountStore addedChildAccounts](self, "addedChildAccounts");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject identifier](v8, "identifier");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "objectForKeyedSubscript:", v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
      if (v31)
      {
        v32 = v31;
        v33 = *(_QWORD *)v45;
        while (2)
        {
          for (j = 0; j != v32; ++j)
          {
            if (*(_QWORD *)v45 != v33)
              objc_enumerationMutation(v30);
            v35 = *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * j);
            -[CalPlistSavingMigrationAccountStore _accountWithIdentifier:preloadedBackingAccount:](self, "_accountWithIdentifier:preloadedBackingAccount:", v35, 0);
            v36 = objc_claimAutoreleasedReturnValue();
            if (!v36)
            {
              +[CalMigrationLog defaultCategory](CalMigrationLog, "defaultCategory");
              v39 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v39, OS_LOG_TYPE_FAULT))
                -[CalPlistSavingMigrationAccountStore childAccountsForAccount:withTypeIdentifier:].cold.2(v35, v8, v39);

              v38 = 0;
              goto LABEL_30;
            }
            v37 = (void *)v36;
            objc_msgSend(v12, "addObject:", v36);

          }
          v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
          if (v32)
            continue;
          break;
        }
      }

      v38 = (void *)objc_msgSend(v12, "copy");
LABEL_30:
      v7 = v43;
      goto LABEL_31;
    }
  }
  else
  {
    +[CalMigrationLog defaultCategory](CalMigrationLog, "defaultCategory");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      -[CalPlistSavingMigrationAccountStore childAccountsForAccount:withTypeIdentifier:].cold.3();
  }
  v38 = 0;
LABEL_32:

  return v38;
}

- (id)createAccountWithAccountTypeIdentifier:(id)a3 error:(id *)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  CalPlistSavingMigrationAccount *v9;
  void *v10;

  v5 = (void *)MEMORY[0x24BDD1880];
  v6 = a3;
  objc_msgSend(v5, "UUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "UUIDString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[CalPlistSavingMigrationAccount initWithIdentifier:accountTypeIdentifier:backingAccount:initialProperties:]([CalPlistSavingMigrationAccount alloc], "initWithIdentifier:accountTypeIdentifier:backingAccount:initialProperties:", v8, v6, 0, 0);
  -[CalPlistSavingMigrationAccountStore addedAccounts](self, "addedAccounts");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v9, v8);

  return v9;
}

- (id)createChildAccountOfParent:(id)a3 withAccountTypeIdentifier:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v8 = a3;
  -[CalPlistSavingMigrationAccountStore createAccountWithAccountTypeIdentifier:error:](self, "createAccountWithAccountTypeIdentifier:error:", a4, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend(v8, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setParentAccountIdentifier:", v10);

    objc_msgSend(v9, "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[CalPlistSavingMigrationAccountStore _registerAddedChildAccountWithIdentifier:parentAccountIdentifier:](self, "_registerAddedChildAccountWithIdentifier:parentAccountIdentifier:", v11, v12);

    v13 = v9;
  }

  return v9;
}

- (void)_registerAddedChildAccountWithIdentifier:(id)a3 parentAccountIdentifier:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  -[CalPlistSavingMigrationAccountStore addedChildAccounts](self, "addedChildAccounts");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    objc_msgSend(MEMORY[0x24BDBCEF0], "setWithCapacity:", 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CalPlistSavingMigrationAccountStore addedChildAccounts](self, "addedChildAccounts");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v8, v6);

  }
  objc_msgSend(v8, "addObject:", v10);

}

- (BOOL)removeAccount:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  int v9;
  NSObject *v10;
  BOOL v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v24[4];
  id v25;

  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v6, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CalPlistSavingMigrationAccountStore deletedAccountIdentifiers](self, "deletedAccountIdentifiers");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "containsObject:", v7);

    if (v9)
    {
      +[CalMigrationLog defaultCategory](CalMigrationLog, "defaultCategory");
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
        -[CalPlistSavingMigrationAccountStore removeAccount:error:].cold.1();

      if (a4)
      {
        objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("kCalPlistSavingMigrationAccountStoreErrorDomain"), 0, 0);
        v11 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v11 = 0;
      }
      goto LABEL_20;
    }
    -[CalPlistSavingMigrationAccountStore addedAccounts](self, "addedAccounts");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKeyedSubscript:", v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      -[CalPlistSavingMigrationAccountStore addedAccounts](self, "addedAccounts");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "removeObjectForKey:", v7);

      -[CalPlistSavingMigrationAccountStore addedChildAccounts](self, "addedChildAccounts");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v24[0] = MEMORY[0x24BDAC760];
      v24[1] = 3221225472;
      v24[2] = __59__CalPlistSavingMigrationAccountStore_removeAccount_error___block_invoke;
      v24[3] = &unk_24D3F4940;
      v25 = v7;
      objc_msgSend(v15, "enumerateKeysAndObjectsUsingBlock:", v24);

      v16 = v25;
    }
    else
    {
      -[CalPlistSavingMigrationAccountStore modifiedAccounts](self, "modifiedAccounts");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "objectForKeyedSubscript:", v7);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (v18)
      {
        -[CalPlistSavingMigrationAccountStore modifiedAccounts](self, "modifiedAccounts");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        -[CalPlistSavingMigrationAccountStore loadedAccounts](self, "loadedAccounts");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "objectForKeyedSubscript:", v7);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v21)
        {
LABEL_19:
          -[CalPlistSavingMigrationAccountStore deletedAccountIdentifiers](self, "deletedAccountIdentifiers");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "addObject:", v7);

          v11 = -[CalPlistSavingMigrationAccountStore _trySaveWithError:](self, "_trySaveWithError:", a4);
LABEL_20:

          goto LABEL_21;
        }
        -[CalPlistSavingMigrationAccountStore loadedAccounts](self, "loadedAccounts");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v16 = v19;
      objc_msgSend(v19, "removeObjectForKey:", v7);
    }

    goto LABEL_19;
  }
  if (a4)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.calendar.MigrationErrors"), 3, 0);
    v11 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }
LABEL_21:

  return v11;
}

uint64_t __59__CalPlistSavingMigrationAccountStore_removeAccount_error___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "removeObject:", *(_QWORD *)(a1 + 32));
}

- (BOOL)saveAccount:(id)a3 withError:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  int v9;
  NSObject *v10;
  BOOL v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v6, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CalPlistSavingMigrationAccountStore deletedAccountIdentifiers](self, "deletedAccountIdentifiers");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "containsObject:", v7);

    if (v9)
    {
      +[CalMigrationLog defaultCategory](CalMigrationLog, "defaultCategory");
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
        -[CalPlistSavingMigrationAccountStore saveAccount:withError:].cold.1();

      if (a4)
      {
        objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("kCalPlistSavingMigrationAccountStoreErrorDomain"), 0, 0);
        v11 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v11 = 0;
      }
    }
    else
    {
      -[CalPlistSavingMigrationAccountStore addedAccounts](self, "addedAccounts");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectForKeyedSubscript:", v7);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13 || objc_msgSend(v6, "dirty"))
      {
        v14 = v6;
        if (objc_msgSend(v14, "dirty"))
        {
          objc_msgSend(v14, "save");
          if (!v13)
          {
            -[CalPlistSavingMigrationAccountStore modifiedAccounts](self, "modifiedAccounts");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "objectForKeyedSubscript:", v7);
            v16 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v16)
            {
              -[CalPlistSavingMigrationAccountStore modifiedAccounts](self, "modifiedAccounts");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "setObject:forKeyedSubscript:", v14, v7);

              -[CalPlistSavingMigrationAccountStore loadedAccounts](self, "loadedAccounts");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "removeObjectForKey:", v7);

            }
          }
          v11 = -[CalPlistSavingMigrationAccountStore _trySaveWithError:](self, "_trySaveWithError:", a4);
        }
        else
        {
          v11 = 1;
        }

      }
      else
      {
        v11 = 1;
      }
    }

  }
  else if (a4)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.calendar.MigrationErrors"), 3, 0);
    v11 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (BOOL)_trySaveWithError:(id *)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  id *v23;
  void *v24;
  char v25;
  id v26;
  NSObject *v27;
  NSObject *v28;
  void *v29;
  NSObject *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  id v44;
  id v45;
  id v46;
  _QWORD v47[4];
  id v48;
  _QWORD v49[4];
  id v50;
  _QWORD v51[4];
  id v52;
  uint8_t buf[4];
  void *v54;
  uint64_t v55;

  v55 = *MEMORY[0x24BDAC8D0];
  +[CalMigrationLog defaultCategory](CalMigrationLog, "defaultCategory");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    -[CalPlistSavingMigrationAccountStore plistURL](self, "plistURL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v54 = v6;
    _os_log_impl(&dword_215A53000, v5, OS_LOG_TYPE_DEFAULT, "Attempting to save account changes to file %@", buf, 0xCu);

  }
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CalPlistSavingMigrationAccountStore addedAccounts](self, "addedAccounts");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x24BDAC760];
  v51[0] = MEMORY[0x24BDAC760];
  v51[1] = 3221225472;
  v51[2] = __57__CalPlistSavingMigrationAccountStore__trySaveWithError___block_invoke;
  v51[3] = &unk_24D3F4968;
  v11 = v8;
  v52 = v11;
  objc_msgSend(v9, "enumerateKeysAndObjectsUsingBlock:", v51);

  if (objc_msgSend(v11, "count"))
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v11, CFSTR("AddedAccounts"));
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[CalPlistSavingMigrationAccountStore addedAccounts](self, "addedAccounts");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v49[0] = v10;
  v49[1] = 3221225472;
  v49[2] = __57__CalPlistSavingMigrationAccountStore__trySaveWithError___block_invoke_2;
  v49[3] = &unk_24D3F4968;
  v14 = v12;
  v50 = v14;
  objc_msgSend(v13, "enumerateKeysAndObjectsUsingBlock:", v49);

  -[CalPlistSavingMigrationAccountStore modifiedAccounts](self, "modifiedAccounts");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v47[0] = v10;
  v47[1] = 3221225472;
  v47[2] = __57__CalPlistSavingMigrationAccountStore__trySaveWithError___block_invoke_3;
  v47[3] = &unk_24D3F4968;
  v16 = v14;
  v48 = v16;
  objc_msgSend(v15, "enumerateKeysAndObjectsUsingBlock:", v47);

  if (objc_msgSend(v16, "count"))
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v16, CFSTR("AccountProperties"));
  -[CalPlistSavingMigrationAccountStore deletedAccountIdentifiers](self, "deletedAccountIdentifiers");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    -[CalPlistSavingMigrationAccountStore deletedAccountIdentifiers](self, "deletedAccountIdentifiers");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "allObjects");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v19, CFSTR("DeletedAccounts"));

  }
  v46 = 0;
  objc_msgSend(MEMORY[0x24BDD1770], "dataWithPropertyList:format:options:error:", v7, 100, 0, &v46);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v46;
  v22 = v21;
  if (v20)
  {
    v44 = v21;
    v23 = a3;
    -[CalPlistSavingMigrationAccountStore plistURL](self, "plistURL");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = 0;
    v25 = objc_msgSend(v20, "writeToURL:options:error:", v24, 0, &v45);
    v26 = v45;

    +[CalMigrationLog defaultCategory](CalMigrationLog, "defaultCategory");
    v27 = objc_claimAutoreleasedReturnValue();
    v28 = v27;
    if ((v25 & 1) != 0)
    {
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        -[CalPlistSavingMigrationAccountStore plistURL](self, "plistURL");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v54 = v29;
        _os_log_impl(&dword_215A53000, v28, OS_LOG_TYPE_DEFAULT, "Successfully saved account changes to file %@", buf, 0xCu);

      }
    }
    else
    {
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        -[CalPlistSavingMigrationAccountStore _trySaveWithError:].cold.2((uint64_t)v26, v28, v37, v38, v39, v40, v41, v42);

      if (v23)
        *v23 = objc_retainAutorelease(v26);
    }

    v22 = v44;
  }
  else
  {
    +[CalMigrationLog defaultCategory](CalMigrationLog, "defaultCategory");
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      -[CalPlistSavingMigrationAccountStore _trySaveWithError:].cold.1((uint64_t)v22, v30, v31, v32, v33, v34, v35, v36);

    v25 = 0;
    if (a3)
      *a3 = objc_retainAutorelease(v22);
  }

  return v25;
}

void __57__CalPlistSavingMigrationAccountStore__trySaveWithError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v5 = (void *)MEMORY[0x24BDBCED8];
  v6 = a3;
  v7 = a2;
  objc_msgSend(v5, "dictionary");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "accountTypeIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v8, CFSTR("AccountTypeIdentifier"));

  objc_msgSend(v6, "parentAccountIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setObject:forKeyedSubscript:", v9, CFSTR("ParentIdentifier"));
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v10, v7);

}

void __57__CalPlistSavingMigrationAccountStore__trySaveWithError___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;

  v5 = a2;
  objc_msgSend(a3, "savedProperties");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v6, v5);

}

void __57__CalPlistSavingMigrationAccountStore__trySaveWithError___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;

  v5 = a2;
  objc_msgSend(a3, "savedProperties");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v6, v5);

}

- (NSURL)plistURL
{
  return self->_plistURL;
}

- (CalMigrationReadOnlyAccountStore)backingAccountStore
{
  return self->_backingAccountStore;
}

- (NSMutableDictionary)addedAccounts
{
  return self->_addedAccounts;
}

- (NSMutableDictionary)modifiedAccounts
{
  return self->_modifiedAccounts;
}

- (NSMutableDictionary)loadedAccounts
{
  return self->_loadedAccounts;
}

- (NSMutableDictionary)addedChildAccounts
{
  return self->_addedChildAccounts;
}

- (NSMutableSet)deletedAccountIdentifiers
{
  return self->_deletedAccountIdentifiers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deletedAccountIdentifiers, 0);
  objc_storeStrong((id *)&self->_addedChildAccounts, 0);
  objc_storeStrong((id *)&self->_loadedAccounts, 0);
  objc_storeStrong((id *)&self->_modifiedAccounts, 0);
  objc_storeStrong((id *)&self->_addedAccounts, 0);
  objc_storeStrong((id *)&self->_backingAccountStore, 0);
  objc_storeStrong((id *)&self->_plistURL, 0);
}

- (void)childAccountsForAccount:withTypeIdentifier:.cold.1()
{
  id v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_4();
  objc_msgSend(v0, "identifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_215A53000, v2, v3, "CalPlistSavingMigrationAccountStore somehow got an account that wasn't added but has no backing account: %{public}@, %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2();
}

- (void)childAccountsForAccount:(NSObject *)a3 withTypeIdentifier:.cold.2(uint64_t a1, void *a2, NSObject *a3)
{
  void *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a2, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138543874;
  v8 = a1;
  v9 = 2114;
  v10 = v6;
  v11 = 2112;
  v12 = a2;
  _os_log_fault_impl(&dword_215A53000, a3, OS_LOG_TYPE_FAULT, "CalPlistSavingMigrationAccountStore somehow has an added child account identifier (%{public}@) for parent account (%{public}@, %@) with no account details.", (uint8_t *)&v7, 0x20u);

}

- (void)childAccountsForAccount:withTypeIdentifier:.cold.3()
{
  id v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_4();
  objc_msgSend(v0, "identifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_215A53000, v2, v3, "Wrong account type give to CalPlistSavingMigrationAccountStore method: %{public}@, %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2();
}

- (void)removeAccount:error:.cold.1()
{
  id v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_4();
  objc_msgSend(v0, "identifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_215A53000, v2, v3, "Attempt to remove already deleted account: %{public}@, %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2();
}

- (void)saveAccount:withError:.cold.1()
{
  id v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_4();
  objc_msgSend(v0, "identifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_215A53000, v2, v3, "Attempt to save deleted account: %{public}@, %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2();
}

- (void)_trySaveWithError:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_215A53000, a2, a3, "Failed to serialize account changes: %@", a5, a6, a7, a8, 2u);
}

- (void)_trySaveWithError:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_215A53000, a2, a3, "Failed to write plist data to file: %@", a5, a6, a7, a8, 2u);
}

@end
