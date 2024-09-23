@implementation CalACMigrationAccountStore

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_0 != -1)
    dispatch_once(&sharedInstance_onceToken_0, &__block_literal_global_20);
  return (id)sharedInstance_sharedInstance_0;
}

void __44__CalACMigrationAccountStore_sharedInstance__block_invoke()
{
  CalACMigrationAccountStore *v0;
  void *v1;

  v0 = objc_alloc_init(CalACMigrationAccountStore);
  v1 = (void *)sharedInstance_sharedInstance_0;
  sharedInstance_sharedInstance_0 = (uint64_t)v0;

}

- (id)accountWithIdentifier:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  CalACMigrationAccount *v7;

  v3 = (void *)MEMORY[0x1E0D0C248];
  v4 = a3;
  objc_msgSend(v3, "defaultProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accountWithIdentifier:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    v7 = -[CalACMigrationAccount initWithACAccount:]([CalACMigrationAccount alloc], "initWithACAccount:", v6);
  else
    v7 = 0;

  return v7;
}

- (id)topLevelAccountsWithAccountTypeIdentifier:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  CalACMigrationAccount *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(MEMORY[0x1E0D0C248], "defaultProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "accountsWithAccountTypeIdentifier:error:", v5, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v7, "count"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v9 = v7;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v20 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
          objc_msgSend(v14, "parentAccount", (_QWORD)v19);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v15)
          {
            v16 = -[CalACMigrationAccount initWithACAccount:]([CalACMigrationAccount alloc], "initWithACAccount:", v14);
            objc_msgSend(v8, "addObject:", v16);

          }
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v11);
    }

    v17 = (void *)objc_msgSend(v8, "copy");
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (id)childAccountsForAccount:(id)a3 withTypeIdentifier:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  CalACMigrationAccount *v16;
  void *v17;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v5, "account");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "accountStore");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "childAccountsForAccount:withTypeIdentifier:", v7, v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      v19 = v7;
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v9, "count"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 0u;
      v21 = 0u;
      v22 = 0u;
      v23 = 0u;
      v11 = v9;
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v21;
        do
        {
          v15 = 0;
          do
          {
            if (*(_QWORD *)v21 != v14)
              objc_enumerationMutation(v11);
            v16 = -[CalACMigrationAccount initWithACAccount:]([CalACMigrationAccount alloc], "initWithACAccount:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v15));
            objc_msgSend(v10, "addObject:", v16);

            ++v15;
          }
          while (v13 != v15);
          v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
        }
        while (v13);
      }

      v17 = (void *)objc_msgSend(v10, "copy");
      v7 = v19;
    }
    else
    {
      v17 = 0;
    }

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (id)createAccountWithAccountTypeIdentifier:(id)a3 error:(id *)a4
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  CalACMigrationAccount *v9;

  v4 = (void *)MEMORY[0x1E0D0C248];
  v5 = a3;
  objc_msgSend(v4, "defaultProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "accountTypeWithIdentifier:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C8F298]), "initWithAccountType:", v7);
    objc_msgSend(v8, "setActive:", 1);
    v9 = -[CalACMigrationAccount initWithACAccount:]([CalACMigrationAccount alloc], "initWithACAccount:", v8);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)createChildAccountOfParent:(id)a3 withAccountTypeIdentifier:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v8 = a3;
  v9 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v8, "account");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CalACMigrationAccountStore createAccountWithAccountTypeIdentifier:error:](self, "createAccountWithAccountTypeIdentifier:error:", v9, a5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
    {
      objc_msgSend(v11, "account");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setParentAccount:", v10);

      v14 = v12;
    }

  }
  else if (a5)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.calendar.ACMigrationAccountStoreErrors"), 1, 0);
    v12 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (BOOL)removeAccount:(id)a3 error:(id *)a4
{
  id v5;
  id v6;
  void *v7;
  dispatch_semaphore_t v8;
  void *v9;
  NSObject *v10;
  BOOL v11;
  _QWORD v13[4];
  NSObject *v14;
  uint64_t *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = v5;
    objc_msgSend(v6, "account");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 0;
    v22 = &v21;
    v23 = 0x3032000000;
    v24 = __Block_byref_object_copy__1;
    v25 = __Block_byref_object_dispose__1;
    v26 = 0;
    v17 = 0;
    v18 = &v17;
    v19 = 0x2020000000;
    v20 = 0;
    v8 = dispatch_semaphore_create(0);
    objc_msgSend(v7, "accountStore");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __50__CalACMigrationAccountStore_removeAccount_error___block_invoke;
    v13[3] = &unk_1E4F8DCE0;
    v15 = &v21;
    v16 = &v17;
    v10 = v8;
    v14 = v10;
    objc_msgSend(v9, "removeAccount:withDeleteSync:completion:", v7, 0, v13);

    dispatch_semaphore_wait(v10, 0xFFFFFFFFFFFFFFFFLL);
    if (a4)
      *a4 = objc_retainAutorelease((id)v22[5]);
    v11 = *((_BYTE *)v18 + 24) != 0;

    _Block_object_dispose(&v17, 8);
    _Block_object_dispose(&v21, 8);

  }
  else if (a4)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.calendar.ACMigrationAccountStoreErrors"), 1, 0);
    v11 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

void __50__CalACMigrationAccountStore_removeAccount_error___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v6;

  v6 = a3;
  if ((a2 & 1) == 0)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

- (BOOL)saveAccount:(id)a3 withError:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  char v8;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v5, "account");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D0C248], "defaultProvider");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "saveAccount:verify:withError:", v6, 0, a4);

  }
  else if (a4)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.calendar.ACMigrationAccountStoreErrors"), 1, 0);
    v8 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

@end
