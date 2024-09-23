@implementation AAAccountManager

+ (AAAccountManager)sharedManager
{
  if (sharedManager_onceToken_0 != -1)
    dispatch_once(&sharedManager_onceToken_0, &__block_literal_global_28);
  return (AAAccountManager *)(id)sharedManager_sharedManager_0;
}

uint64_t __33__AAAccountManager_sharedManager__block_invoke()
{
  AAAccountManager *v0;
  void *v1;

  v0 = objc_alloc_init(AAAccountManager);
  v1 = (void *)sharedManager_sharedManager_0;
  sharedManager_sharedManager_0 = (uint64_t)v0;

  return objc_msgSend((id)sharedManager_sharedManager_0, "reloadAccounts");
}

- (void)dealloc
{
  objc_super v3;

  if (self->_accountStore)
    -[AAAccountManager _stopObservingAccountStoreDidChangeNotification](self, "_stopObservingAccountStoreDidChangeNotification");
  v3.receiver = self;
  v3.super_class = (Class)AAAccountManager;
  -[AAAccountManager dealloc](&v3, sel_dealloc);
}

- (id)_accountStore
{
  ACAccountStore *accountStore;
  ACAccountStore *v4;
  ACAccountStore *v5;

  accountStore = self->_accountStore;
  if (!accountStore)
  {
    objc_msgSend(MEMORY[0x1E0C8F2B8], "defaultStore");
    v4 = (ACAccountStore *)objc_claimAutoreleasedReturnValue();
    v5 = self->_accountStore;
    self->_accountStore = v4;

    -[AAAccountManager _beginObservingAccountStoreDidChangeNotification](self, "_beginObservingAccountStoreDidChangeNotification");
    accountStore = self->_accountStore;
  }
  return accountStore;
}

- (void)_beginObservingAccountStoreDidChangeNotification
{
  void *v3;
  uint64_t v4;
  void *v5;
  id accountStoreDidChangeObserver;
  _QWORD v7[4];
  id v8;
  id location;

  if (!self->_accountStoreDidChangeObserver)
  {
    objc_initWeak(&location, self);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *MEMORY[0x1E0C8F010];
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __68__AAAccountManager__beginObservingAccountStoreDidChangeNotification__block_invoke;
    v7[3] = &unk_1E4170F08;
    objc_copyWeak(&v8, &location);
    objc_msgSend(v3, "addObserverForName:object:queue:usingBlock:", v4, 0, 0, v7);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    accountStoreDidChangeObserver = self->_accountStoreDidChangeObserver;
    self->_accountStoreDidChangeObserver = v5;

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
}

void __68__AAAccountManager__beginObservingAccountStoreDidChangeNotification__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "reloadAccounts");

}

- (void)_stopObservingAccountStoreDidChangeNotification
{
  void *v3;
  id accountStoreDidChangeObserver;

  if (self->_accountStoreDidChangeObserver)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeObserver:", self->_accountStoreDidChangeObserver);

    accountStoreDidChangeObserver = self->_accountStoreDidChangeObserver;
    self->_accountStoreDidChangeObserver = 0;

  }
}

- (id)accounts
{
  return self->_accounts;
}

- (void)reloadAccounts
{
  AAAccountManager *v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  AAAccount *v11;
  AAAccount *v12;
  uint64_t v13;
  NSMutableArray *originalAccounts;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v2 = self;
  objc_sync_enter(v2);
  -[AAAccountManager _accountStore](v2, "_accountStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "aa_appleAccounts");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v16;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v6);
        v10 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v9);
        v11 = [AAAccount alloc];
        v12 = -[AAAccount initWithAccount:](v11, "initWithAccount:", v10, (_QWORD)v15);
        objc_msgSend(v5, "addObject:", v12);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }

  objc_storeStrong((id *)&v2->_accounts, v5);
  v13 = -[NSMutableArray copy](v2->_accounts, "copy");
  originalAccounts = v2->_originalAccounts;
  v2->_originalAccounts = (NSMutableArray *)v13;

  objc_sync_exit(v2);
}

- (id)primaryAccount
{
  AAAccountManager *v2;
  NSMutableArray *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  id v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v2 = self;
  objc_sync_enter(v2);
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = v2->_accounts;
  v4 = 0;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        if (objc_msgSend(v8, "primaryAccount", (_QWORD)v11))
        {
          v9 = v8;

          v4 = v9;
        }
      }
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }

  objc_sync_exit(v2);
  return v4;
}

- (id)accountsEnabledForDataclass:(id)a3
{
  id v4;
  AAAccountManager *v5;
  void *v6;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v7 = v5->_accounts;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v7);
        v11 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v11, "isEnabledForDataclass:", v4, (_QWORD)v13))
          objc_msgSend(v6, "addObject:", v11);
      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  objc_sync_exit(v5);
  return v6;
}

- (id)accountWithUsername:(id)a3
{
  id v4;
  AAAccountManager *v5;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  int v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  AAAccountManager *obj;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  obj = v5;
  v6 = v5->_accounts;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v25;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v25 != v8)
        objc_enumerationMutation(v6);
      v10 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v9);
      objc_msgSend(v10, "username");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "isEqualToString:", v4);

      if (v12)
      {
        v13 = v10;
      }
      else
      {
        v22 = 0u;
        v23 = 0u;
        v20 = 0u;
        v21 = 0u;
        objc_msgSend(v10, "appleIDAliases");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
        if (v15)
        {
          v16 = *(_QWORD *)v21;
          while (2)
          {
            for (i = 0; i != v15; ++i)
            {
              if (*(_QWORD *)v21 != v16)
                objc_enumerationMutation(v14);
              if (objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * i), "isEqualToString:", v4))
              {
                v13 = v10;
                goto LABEL_18;
              }
            }
            v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
            if (v15)
              continue;
            break;
          }
        }
        v13 = 0;
LABEL_18:

      }
      if (v13)
        break;
      if (++v9 == v7)
      {
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
        if (v7)
          goto LABEL_3;
        goto LABEL_22;
      }
    }
  }
  else
  {
LABEL_22:
    v13 = 0;
  }

  objc_sync_exit(obj);
  return v13;
}

- (id)accountWithPersonID:(id)a3
{
  id v4;
  AAAccountManager *v5;
  NSMutableArray *v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  int v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = v5->_accounts;
  v7 = (id)-[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v10, "personID", (_QWORD)v14);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isEqualToString:", v4);

        if (v12)
        {
          v7 = v10;
          goto LABEL_11;
        }
      }
      v7 = (id)-[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_11:

  objc_sync_exit(v5);
  return v7;
}

- (id)accountWithIdentifier:(id)a3
{
  id v4;
  AAAccountManager *v5;
  NSMutableArray *v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  int v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = v5->_accounts;
  v7 = (id)-[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v10, "identifier", (_QWORD)v14);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isEqualToString:", v4);

        if (v12)
        {
          v7 = v10;
          goto LABEL_11;
        }
      }
      v7 = (id)-[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_11:

  objc_sync_exit(v5);
  return v7;
}

- (void)addAccount:(id)a3
{
  id v4;
  AAAccountManager *v5;
  NSObject *v6;
  id v7;
  void *v8;
  NSMutableArray *accounts;
  int v10;
  id v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  _AALogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "username");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138412546;
    v11 = v7;
    v12 = 2112;
    v13 = v8;
    _os_log_impl(&dword_19EACA000, v6, OS_LOG_TYPE_DEFAULT, "Adding account: %@:%@", (uint8_t *)&v10, 0x16u);

  }
  accounts = v5->_accounts;
  if (accounts)
    -[NSMutableArray addObject:](accounts, "addObject:", v4);
  objc_sync_exit(v5);

}

- (void)updateAccount:(id)a3
{
  id v4;
  AAAccountManager *v5;
  void *v6;
  id v7;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  int v15;
  NSObject *v16;
  id v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t buf[4];
  id v25;
  __int16 v26;
  void *v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v6 = (void *)-[NSMutableArray copy](v5->_accounts, "copy");
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
  if (v8)
  {
    v10 = 0;
    v11 = *(_QWORD *)v21;
    *(_QWORD *)&v9 = 138412546;
    v19 = v9;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v21 != v11)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * v12), "identifier", v19, (_QWORD)v20);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "identifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v13, "isEqualToString:", v14);

        if (v15)
        {
          -[NSMutableArray replaceObjectAtIndex:withObject:](v5->_accounts, "replaceObjectAtIndex:withObject:", v10 + v12, v4);
          _AALogSystem();
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v4, "username");
            v17 = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "identifier");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v19;
            v25 = v17;
            v26 = 2112;
            v27 = v18;
            _os_log_impl(&dword_19EACA000, v16, OS_LOG_TYPE_DEFAULT, "Updating account: %@:%@", buf, 0x16u);

          }
        }
        ++v12;
      }
      while (v8 != v12);
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
      v10 += v12;
    }
    while (v8);
  }

  objc_sync_exit(v5);
}

- (void)removeAccount:(id)a3
{
  id v4;
  AAAccountManager *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  objc_msgSend(v4, "username");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  _AALogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = -[NSMutableArray count](v5->_accounts, "count");
    *(_DWORD *)buf = 138412546;
    v17 = v6;
    v18 = 2048;
    v19 = v8;
    _os_log_impl(&dword_19EACA000, v7, OS_LOG_TYPE_DEFAULT, "Removing account %@. Count: %lu", buf, 0x16u);
  }

  -[AAAccountManager _accountStore](v5, "_accountStore");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "account");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __34__AAAccountManager_removeAccount___block_invoke;
  v13[3] = &unk_1E4170F30;
  v13[4] = v5;
  v11 = v4;
  v14 = v11;
  v12 = v6;
  v15 = v12;
  objc_msgSend(v9, "removeAccount:withCompletionHandler:", v10, v13);

  objc_sync_exit(v5);
}

void __34__AAAccountManager_removeAccount___block_invoke(_QWORD *a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  _BOOL4 v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  _AALogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (a2)
  {
    if (v7)
    {
      v8 = objc_msgSend(*(id *)(a1[4] + 16), "count");
      v10 = 134217984;
      v11 = v8;
      _os_log_impl(&dword_19EACA000, v6, OS_LOG_TYPE_DEFAULT, "Removed account. Count: %lu", (uint8_t *)&v10, 0xCu);
    }

    objc_msgSend(*(id *)(a1[4] + 16), "removeObject:", a1[5]);
  }
  else
  {
    if (v7)
    {
      v9 = a1[6];
      v10 = 138412546;
      v11 = v9;
      v12 = 2112;
      v13 = v5;
      _os_log_impl(&dword_19EACA000, v6, OS_LOG_TYPE_DEFAULT, "Failed to remove account %@. Error: %@", (uint8_t *)&v10, 0x16u);
    }

  }
}

- (void)saveAllAccounts
{
  AAAccountManager *v2;
  AAAccountManager *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSMutableArray *originalAccounts;
  __CFNotificationCenter *DarwinNotifyCenter;
  void *v16;
  NSMutableArray *obj;
  _QWORD v18[5];
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t v23[128];
  uint8_t buf[4];
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v2 = self;
  objc_sync_enter(v2);
  v3 = v2;
  _AALogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = -[NSMutableArray count](v2->_accounts, "count");
    *(_DWORD *)buf = 134217984;
    v25 = v5;
    _os_log_impl(&dword_19EACA000, v4, OS_LOG_TYPE_DEFAULT, "Saving Accounts. Count: %lu", buf, 0xCu);
  }

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  obj = v2->_accounts;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v20;
    v8 = MEMORY[0x1E0C809B0];
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v20 != v7)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v9);
        -[AAAccountManager _accountStore](v3, "_accountStore");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "account");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v18[0] = v8;
        v18[1] = 3221225472;
        v18[2] = __35__AAAccountManager_saveAllAccounts__block_invoke;
        v18[3] = &unk_1E4170028;
        v18[4] = v10;
        objc_msgSend(v11, "saveAccount:withCompletionHandler:", v12, v18);

        v2 = v3;
        ++v9;
      }
      while (v6 != v9);
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v6);
  }

  v13 = -[NSMutableArray copy](v2->_accounts, "copy");
  originalAccounts = v2->_originalAccounts;
  v2->_originalAccounts = (NSMutableArray *)v13;

  objc_sync_exit(v2);
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotificationWithOptions(DarwinNotifyCenter, CFSTR("AAAccountConfigChangedNotification"), v2, 0, 1uLL);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "postNotificationName:object:", CFSTR("AAAccountConfigChangedNotification"), 0);

}

void __35__AAAccountManager_saveAllAccounts__block_invoke(uint64_t a1, char a2)
{
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if ((a2 & 1) == 0)
  {
    _AALogSystem();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "username");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = 138412290;
      v6 = v4;
      _os_log_impl(&dword_19EACA000, v3, OS_LOG_TYPE_DEFAULT, "Failed to save account %@.", (uint8_t *)&v5, 0xCu);

    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_accountStoreDidChangeObserver, 0);
  objc_storeStrong((id *)&self->_originalAccounts, 0);
  objc_storeStrong((id *)&self->_accounts, 0);
  objc_storeStrong((id *)&self->_accountStore, 0);
}

@end
