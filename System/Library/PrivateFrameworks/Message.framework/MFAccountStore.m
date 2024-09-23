@implementation MFAccountStore

+ (BOOL)_shouldUpdateAccountsInPlace
{
  void *v2;
  void *v3;
  char v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("MFUpdateAccountsInPlaceKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v4 = objc_msgSend(v3, "BOOLValue");
    else
      v4 = 0;
  }
  else
  {
    MFUserAgent();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "isMobileMail");

  }
  return v4;
}

+ (id)sharedAccountStore
{
  if (sharedAccountStore_onceToken != -1)
    dispatch_once(&sharedAccountStore_onceToken, &__block_literal_global_20);
  return (id)sharedAccountStore_sAccountStore;
}

- (id)supportedDataclassesWithAccountTypeIdentifier:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0C8F2B8], "defaultStore");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "accountTypeWithAccountTypeIdentifier:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "supportedDataclasses");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "allObjects");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)newPersistentAccountWithAccountTypeIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;

  v4 = a3;
  if (v4)
  {
    -[ACAccountStore accountTypeWithAccountTypeIdentifier:](self->_accountStore, "accountTypeWithAccountTypeIdentifier:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C8F298]), "initWithAccountType:", v5);
    }
    else
    {
      MFAccountsLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        -[MFAccountStore newPersistentAccountWithAccountTypeIdentifier:].cold.1((uint64_t)v4, v7);

      v6 = 0;
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)accountsWithTypeIdentifiers:(id)a3 error:(id *)a4
{
  id v5;
  ACAccountStore *accountStore;
  void *v7;
  _BOOL4 v8;
  NSObject *v9;
  void *v10;
  void *v11;
  ACAccountStore *v12;
  uint64_t v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  NSObject *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v40;
  id v41;
  id obj;
  id obja;
  uint64_t v44;
  uint64_t v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  id v50[2];
  uint8_t v51[4];
  void *v52;
  __int16 v53;
  void *v54;
  uint8_t v55[128];
  uint8_t buf[4];
  void *v57;
  __int16 v58;
  void *v59;
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  accountStore = self->_accountStore;
  v50[1] = 0;
  v40 = v5;
  -[ACAccountStore accountsWithAccountTypeIdentifiers:error:](accountStore, "accountsWithAccountTypeIdentifiers:error:");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v41 = 0;
  objc_msgSend(v41, "domain");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0C8F1D0]))
  {
    v8 = objc_msgSend(v41, "code") == 10002;

    if (!v8)
      goto LABEL_7;
    MFAccountsLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v40, "componentsJoinedByString:", CFSTR(", "));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "ef_publicDescription");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v57 = v10;
      v58 = 2114;
      v59 = v11;
      _os_log_impl(&dword_1A4F90000, v9, OS_LOG_TYPE_DEFAULT, "Transient account store error; re-attempting to fetch accounts for types [%{public}@]: %{public}@",
        buf,
        0x16u);

    }
    v12 = self->_accountStore;
    v50[0] = v41;
    -[ACAccountStore accountsWithAccountTypeIdentifiers:error:](v12, "accountsWithAccountTypeIdentifiers:error:", v40, v50);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = v50[0];

    v7 = obj;
    obj = (id)v13;
    v41 = v14;
  }

LABEL_7:
  if (v41)
  {
    MFAccountsLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v40, "componentsJoinedByString:", CFSTR(", "));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "ef_publicDescription");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[MFAccountStore accountsWithTypeIdentifiers:error:].cold.1(v16, v17, buf, v15);
    }

  }
  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  obja = obj;
  v18 = 0;
  v19 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v46, v55, 16);
  if (v19)
  {
    v20 = 0;
    v45 = *(_QWORD *)v47;
    v44 = *MEMORY[0x1E0CFAAE8];
    do
    {
      v21 = 0;
      do
      {
        if (*(_QWORD *)v47 != v45)
          objc_enumerationMutation(obja);
        v22 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * v21);
        -[MFAccountStore _accountWithPersistentAccount:useExisting:](self, "_accountWithPersistentAccount:useExisting:", v22, objc_msgSend((id)objc_opt_class(), "_shouldUpdateAccountsInPlace"));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        if (v23)
        {
          if (!v18)
          {
            objc_msgSend(MEMORY[0x1E0C99DE8], "array");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
          }
          objc_msgSend(v22, "parentAccount");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = objc_msgSend(v24, "aa_isAccountClass:", v44);

          if (v25)
          {
            if ((v20 & 1) != 0)
            {
              MFAccountsLog();
              v26 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
              {
                objc_msgSend(v22, "identifier");
                v35 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v22, "parentAccount");
                v36 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v36, "identifier");
                v37 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)v51 = 138543618;
                v52 = v35;
                v53 = 2114;
                v54 = v37;
                _os_log_error_impl(&dword_1A4F90000, v26, OS_LOG_TYPE_ERROR, "Duplicate Primary iCloud IMAPMail account %{public}@ found for parent iCloud account %{public}@", v51, 0x16u);

              }
            }
            else
            {
              MFAccountsLog();
              v31 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
              {
                objc_msgSend(v22, "identifier");
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v22, "parentAccount");
                v33 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v33, "identifier");
                v34 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)v51 = 138543618;
                v52 = v32;
                v53 = 2114;
                v54 = v34;
                _os_log_impl(&dword_1A4F90000, v31, OS_LOG_TYPE_DEFAULT, "Primary iCloud IMAPMail account %{public}@ found for parent iCloud account %{public}@", v51, 0x16u);

              }
              objc_msgSend(v18, "addObject:", v23);
            }
            v20 = 1;
          }
          else
          {
            MFAccountsLog();
            v27 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v22, "identifier");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v22, "parentAccount");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v29, "identifier");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)v51 = 138543618;
              v52 = v28;
              v53 = 2114;
              v54 = v30;
              _os_log_impl(&dword_1A4F90000, v27, OS_LOG_TYPE_DEFAULT, "Mail account %{public}@ found for parent account %{public}@", v51, 0x16u);

            }
            objc_msgSend(v18, "addObject:", v23);
          }
        }

        ++v21;
      }
      while (v19 != v21);
      v19 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v46, v55, 16);
    }
    while (v19);
  }

  if (a4)
    *a4 = objc_retainAutorelease(v41);

  return v18;
}

- (id)_accountWithPersistentAccount:(id)a3 useExisting:(BOOL)a4
{
  _BOOL8 v4;
  id v5;
  objc_class *v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  const __CFString *v15;
  id v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  const __CFString *v22;
  uint64_t v23;

  v4 = a4;
  v23 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    v16 = 0;
    v6 = +[MFAccountLoader accountClassForPersistentAccount:error:](MFAccountLoader, "accountClassForPersistentAccount:error:", v5, &v16);
    v7 = v16;
    if (v6)
    {
      objc_msgSend((id)objc_opt_class(), "_accountWithAccountClass:persistentAccount:useExisting:", v6, v5, v4);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      MFAccountsLog();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v5, "identifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "ef_publicDescription");
        v12 = objc_claimAutoreleasedReturnValue();
        v13 = (void *)v12;
        v14 = ": ";
        if (!v7)
          v14 = "";
        v15 = &stru_1E4F1C8F8;
        *(_DWORD *)buf = 138543874;
        v18 = v11;
        if (v12)
          v15 = (const __CFString *)v12;
        v19 = 2080;
        v20 = v14;
        v21 = 2114;
        v22 = v15;
        _os_log_error_impl(&dword_1A4F90000, v9, OS_LOG_TYPE_ERROR, "Failed to load account for persistent account \"%{public}@\"%s%{public}@", buf, 0x20u);

      }
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)_accountWithAccountClass:(Class)a3 persistentAccount:(id)a4 useExisting:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = a5;
  v7 = a4;
  v8 = v7;
  if (v5
    && (objc_msgSend(v7, "identifier"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        -[objc_class existingAccountForUniqueID:](a3, "existingAccountForUniqueID:", v9),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v9,
        v10))
  {
    if ((Class)objc_opt_class() == a3)
      objc_msgSend(v10, "setPersistentAccount:", v8);
  }
  else
  {
    v10 = (void *)objc_msgSend([a3 alloc], "initWithPersistentAccount:", v8);
  }

  return v10;
}

void __36__MFAccountStore_sharedAccountStore__block_invoke()
{
  MFAccountStore *v0;
  void *v1;

  v0 = objc_alloc_init(MFAccountStore);
  v1 = (void *)sharedAccountStore_sAccountStore;
  sharedAccountStore_sAccountStore = (uint64_t)v0;

}

- (MFAccountStore)init
{
  MFAccountStore *v2;
  MFAccountStore *v3;
  void *v4;
  MFAccountStore *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MFAccountStore;
  v2 = -[MFAccountStore init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_accountStoreLock._os_unfair_lock_opaque = 0;
    objc_msgSend(MEMORY[0x1E0C8F2B8], "defaultStore");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFAccountStore setPersistentStore:](v3, "setPersistentStore:", v4);

    v5 = v3;
  }

  return v3;
}

- (void)setPersistentStore:(id)a3
{
  ACAccountStore *accountStore;
  _QWORD *v6;
  void *v7;
  void *v8;
  ACAccountStore *v9;

  v9 = (ACAccountStore *)a3;
  os_unfair_lock_lock(&self->_accountStoreLock);
  accountStore = self->_accountStore;
  if (accountStore != v9)
  {
    v6 = (_QWORD *)MEMORY[0x1E0C8F010];
    if (accountStore)
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "removeObserver:name:object:", self, *v6, self->_accountStore);

    }
    objc_storeStrong((id *)&self->_accountStore, a3);
    if (v9)
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addObserver:selector:name:object:", self, sel__accountsStoreChanged_, *v6, v9);

    }
  }
  os_unfair_lock_unlock(&self->_accountStoreLock);

}

- (void)dealloc
{
  objc_super v3;

  -[MFAccountStore setPersistentStore:](self, "setPersistentStore:", 0);
  v3.receiver = self;
  v3.super_class = (Class)MFAccountStore;
  -[MFAccountStore dealloc](&v3, sel_dealloc);
}

- (ACAccountStore)persistentStore
{
  os_unfair_lock_s *p_accountStoreLock;
  ACAccountStore *v4;

  p_accountStoreLock = &self->_accountStoreLock;
  os_unfair_lock_lock(&self->_accountStoreLock);
  v4 = self->_accountStore;
  os_unfair_lock_unlock(p_accountStoreLock);
  return v4;
}

- (id)existingAccountWithPersistentAccount:(id)a3
{
  -[MFAccountStore _accountWithPersistentAccount:useExisting:](self, "_accountWithPersistentAccount:useExisting:", a3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)savePersistentAccountWithAccount:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  dispatch_semaphore_t v15;
  ACAccountStore *accountStore;
  NSObject *v17;
  _QWORD v18[4];
  id v19;
  id v20;
  dispatch_semaphore_t v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "persistentAccount");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "accountDescription");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "accountType");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v10, "isEqualToString:", *MEMORY[0x1E0C8F0D0]) & 1) != 0)
    {
      objc_msgSend(v6, "username");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "dataUsingEncoding:", 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v12)
      {
        MFAccountsLog();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          v23 = v7;
          v24 = 2114;
          v25 = v8;
          _os_log_impl(&dword_1A4F90000, v13, OS_LOG_TYPE_DEFAULT, "\"%@\" has Non-ASCII username - Disabling Notes for account (%{public}@)", buf, 0x16u);
        }

        v14 = *MEMORY[0x1E0C8F3F8];
        objc_msgSend(v6, "setProvisioned:forDataclass:", 0, *MEMORY[0x1E0C8F3F8]);
        objc_msgSend(v6, "setEnabled:forDataclass:", 0, v14);
      }
    }
    else
    {

    }
    if (objc_msgSend(v6, "isDirty"))
    {
      v15 = dispatch_semaphore_create(0);
      accountStore = self->_accountStore;
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __51__MFAccountStore_savePersistentAccountWithAccount___block_invoke;
      v18[3] = &unk_1E4E8B698;
      v19 = v7;
      v20 = v8;
      v21 = v15;
      v17 = v15;
      -[ACAccountStore saveVerifiedAccount:withCompletionHandler:](accountStore, "saveVerifiedAccount:withCompletionHandler:", v6, v18);
      dispatch_semaphore_wait(v17, 0xFFFFFFFFFFFFFFFFLL);

    }
    else
    {
      MFAccountsLog();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v23 = v7;
        v24 = 2114;
        v25 = v8;
        _os_log_impl(&dword_1A4F90000, v17, OS_LOG_TYPE_DEFAULT, "Nothing to save for account \"%@\" (%{public}@)", buf, 0x16u);
      }
    }

  }
}

void __51__MFAccountStore_savePersistentAccountWithAccount___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (a2)
  {
    MFAccountsLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(_QWORD *)(a1 + 32);
      v8 = *(_QWORD *)(a1 + 40);
      v12 = 138412546;
      v13 = v7;
      v14 = 2114;
      v15 = v8;
      _os_log_impl(&dword_1A4F90000, v6, OS_LOG_TYPE_DEFAULT, "Saved account \"%@\" (%{public}@)", (uint8_t *)&v12, 0x16u);
    }
  }
  else
  {
    MFAccountsLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v10 = *(_QWORD *)(a1 + 32);
      v9 = *(_QWORD *)(a1 + 40);
      objc_msgSend(v5, "ef_publicDescription");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138412802;
      v13 = v10;
      v14 = 2112;
      v15 = v9;
      v16 = 2114;
      v17 = v11;
      _os_log_error_impl(&dword_1A4F90000, v6, OS_LOG_TYPE_ERROR, "Failed to save account \"%@\" (%@) error: %{public}@", (uint8_t *)&v12, 0x20u);

    }
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

- (void)removePersistentAccountWithAccount:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  dispatch_semaphore_t v9;
  ACAccountStore *accountStore;
  id v11;
  NSObject *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  dispatch_semaphore_t v17;

  v4 = a3;
  objc_msgSend(v4, "persistentAccount");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "accountDescription");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = dispatch_semaphore_create(0);
    accountStore = self->_accountStore;
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __53__MFAccountStore_removePersistentAccountWithAccount___block_invoke;
    v14[3] = &unk_1E4E8B698;
    v11 = v7;
    v15 = v11;
    v16 = v8;
    v17 = v9;
    v12 = v9;
    v13 = v8;
    -[ACAccountStore removeAccount:withCompletionHandler:](accountStore, "removeAccount:withCompletionHandler:", v6, v14);
    dispatch_semaphore_wait(v12, 0xFFFFFFFFFFFFFFFFLL);

  }
}

void __53__MFAccountStore_removePersistentAccountWithAccount___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (a2)
  {
    MFAccountsLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(_QWORD *)(a1 + 32);
      v8 = *(_QWORD *)(a1 + 40);
      v12 = 138412546;
      v13 = v7;
      v14 = 2114;
      v15 = v8;
      _os_log_impl(&dword_1A4F90000, v6, OS_LOG_TYPE_DEFAULT, "Removed account \"%@\" (%{public}@)", (uint8_t *)&v12, 0x16u);
    }
  }
  else
  {
    MFAccountsLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v10 = *(_QWORD *)(a1 + 32);
      v9 = *(_QWORD *)(a1 + 40);
      objc_msgSend(v5, "ef_publicDescription");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138412802;
      v13 = v10;
      v14 = 2114;
      v15 = v9;
      v16 = 2114;
      v17 = v11;
      _os_log_error_impl(&dword_1A4F90000, v6, OS_LOG_TYPE_ERROR, "Failed to remove account \"%@\" (%{public}@) error: %{public}@", (uint8_t *)&v12, 0x20u);

    }
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

- (void)_accountsStoreChanged:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  MFAccountsLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v3, "name");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138412290;
    v7 = v5;
    _os_log_impl(&dword_1A4F90000, v4, OS_LOG_TYPE_INFO, "Received %@ notification", (uint8_t *)&v6, 0xCu);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountStore, 0);
}

- (void)newPersistentAccountWithAccountTypeIdentifier:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_1A4F90000, a2, OS_LOG_TYPE_ERROR, "Missing account type for identifier %{public}@", (uint8_t *)&v2, 0xCu);
}

- (void)accountsWithTypeIdentifiers:(uint8_t *)buf error:(os_log_t)log .cold.1(void *a1, void *a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543618;
  *(_QWORD *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2114;
  *(_QWORD *)(buf + 14) = a2;
  _os_log_error_impl(&dword_1A4F90000, log, OS_LOG_TYPE_ERROR, "Failed to fetch accounts for types [%{public}@]: %{public}@", buf, 0x16u);

}

@end
