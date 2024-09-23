@implementation ACAccountStore(DAExtensions)

- (void)_daAccountsWithAccountTypeIdentifiers:()DAExtensions enabledForDADataclasses:filterOnDataclasses:withCompletion:
{
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
  NSObject *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id obj;
  _QWORD block[4];
  id v27;
  id v28;
  _QWORD *v29;
  _QWORD v30[5];
  id v31;
  NSObject *v32;
  _QWORD *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _QWORD v38[5];
  id v39;
  _QWORD v40[5];
  id v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v24 = a3;
  v23 = a6;
  if ((_daAccountsWithAccountTypeIdentifiers_enabledForDADataclasses_filterOnDataclasses_withCompletion___haveRegisteredForInterrogation & 1) == 0)
  {
    _daAccountsWithAccountTypeIdentifiers_enabledForDADataclasses_filterOnDataclasses_withCompletion___haveRegisteredForInterrogation = 1;
    if ((_sDAIsRunningInDataAccessD & 1) == 0)
    {
      if (_daAccountsWithAccountTypeIdentifiers_enabledForDADataclasses_filterOnDataclasses_withCompletion__onceToken != -1)
        dispatch_once(&_daAccountsWithAccountTypeIdentifiers_enabledForDADataclasses_filterOnDataclasses_withCompletion__onceToken, &__block_literal_global_2);
      objc_msgSend(MEMORY[0x1E0D03900], "sharedConnection", v23);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "registerForInterrogationWithBlock:", &__block_literal_global_22);

    }
  }
  if (a5)
  {
    acDataclassesForDADataclasses(a4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "allObjects");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v40[0] = MEMORY[0x1E0C809B0];
    v40[1] = 3221225472;
    v40[2] = __129__ACAccountStore_DAExtensions___daAccountsWithAccountTypeIdentifiers_enabledForDADataclasses_filterOnDataclasses_withCompletion___block_invoke_4;
    v40[3] = &unk_1E7B92668;
    v40[4] = a1;
    v41 = v23;
    v13 = v23;
    objc_msgSend(a1, "accountIdentifiersEnabledForDataclasses:withAccountTypeIdentifiers:completion:", v12, v24, v40);

  }
  else
  {
    v38[0] = 0;
    v38[1] = v38;
    v38[2] = 0x3032000000;
    v38[3] = __Block_byref_object_copy__1;
    v38[4] = __Block_byref_object_dispose__1;
    v39 = 0;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = dispatch_group_create();
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    obj = v24;
    v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
    if (v16)
    {
      v17 = *(_QWORD *)v35;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v35 != v17)
            objc_enumerationMutation(obj);
          v19 = *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * i);
          dispatch_group_enter(v15);
          v30[0] = MEMORY[0x1E0C809B0];
          v30[1] = 3221225472;
          v30[2] = __129__ACAccountStore_DAExtensions___daAccountsWithAccountTypeIdentifiers_enabledForDADataclasses_filterOnDataclasses_withCompletion___block_invoke_3_30;
          v30[3] = &unk_1E7B926B8;
          v30[4] = a1;
          v33 = v38;
          v31 = v14;
          v32 = v15;
          objc_msgSend(a1, "accountTypeWithIdentifier:completion:", v19, v30);

        }
        v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
      }
      while (v16);
    }

    dispatch_get_global_queue(0, 0);
    v20 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __129__ACAccountStore_DAExtensions___daAccountsWithAccountTypeIdentifiers_enabledForDADataclasses_filterOnDataclasses_withCompletion___block_invoke_5;
    block[3] = &unk_1E7B92640;
    v27 = v14;
    v28 = v23;
    v29 = v38;
    v21 = v14;
    v22 = v23;
    dispatch_group_notify(v15, v20, block);

    _Block_object_dispose(v38, 8);
  }

}

- (void)da_loadDAAccountsWithCompletion:()DAExtensions
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  +[DAAccount _leafAccountTypes](DAAccount, "_leafAccountTypes");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_daAccountsWithAccountTypeIdentifiers:enabledForDADataclasses:filterOnDataclasses:withCompletion:", v5, 0, 0, v4);

}

- (void)da_loadDAAccountsEnabledForDADataclasses:()DAExtensions withCompletion:
{
  id v6;
  void *v7;
  id v8;

  v6 = a4;
  +[DAAccount _leafAccountTypes](DAAccount, "_leafAccountTypes");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "allObjects");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_daAccountsWithAccountTypeIdentifiers:enabledForDADataclasses:filterOnDataclasses:withCompletion:", v7, a3, 1, v6);

}

- (uint64_t)da_loadDAAccountsWithAccountTypeIdentifiers:()DAExtensions withCompletion:
{
  return objc_msgSend(a1, "_daAccountsWithAccountTypeIdentifiers:enabledForDADataclasses:filterOnDataclasses:withCompletion:", a3, 0, 0, a4);
}

- (uint64_t)da_loadDAAccountsWithAccountTypeIdentifiers:()DAExtensions enabledForDADataclasses:withCompletion:
{
  return objc_msgSend(a1, "_daAccountsWithAccountTypeIdentifiers:enabledForDADataclasses:filterOnDataclasses:withCompletion:", a3, a4, 1, a5);
}

- (id)da_accounts
{
  dispatch_semaphore_t v2;
  NSObject *v3;
  id v4;
  _QWORD v6[4];
  NSObject *v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v2 = dispatch_semaphore_create(0);
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__1;
  v13 = __Block_byref_object_dispose__1;
  v14 = 0;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __43__ACAccountStore_DAExtensions__da_accounts__block_invoke;
  v6[3] = &unk_1E7B926E0;
  v8 = &v9;
  v3 = v2;
  v7 = v3;
  objc_msgSend(a1, "da_loadDAAccountsWithCompletion:", v6);
  dispatch_semaphore_wait(v3, 0xFFFFFFFFFFFFFFFFLL);
  v4 = (id)v10[5];

  _Block_object_dispose(&v9, 8);
  return v4;
}

- (id)da_accountsEnabledForDADataclasses:()DAExtensions
{
  dispatch_semaphore_t v5;
  NSObject *v6;
  id v7;
  _QWORD v9[4];
  NSObject *v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v5 = dispatch_semaphore_create(0);
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__1;
  v16 = __Block_byref_object_dispose__1;
  v17 = 0;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __67__ACAccountStore_DAExtensions__da_accountsEnabledForDADataclasses___block_invoke;
  v9[3] = &unk_1E7B926E0;
  v11 = &v12;
  v6 = v5;
  v10 = v6;
  objc_msgSend(a1, "da_loadDAAccountsEnabledForDADataclasses:withCompletion:", a3, v9);
  dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (id)da_accountsWithAccountTypeIdentifiers:()DAExtensions
{
  id v4;
  dispatch_semaphore_t v5;
  NSObject *v6;
  id v7;
  _QWORD v9[4];
  NSObject *v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v5 = dispatch_semaphore_create(0);
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__1;
  v16 = __Block_byref_object_dispose__1;
  v17 = 0;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __70__ACAccountStore_DAExtensions__da_accountsWithAccountTypeIdentifiers___block_invoke;
  v9[3] = &unk_1E7B926E0;
  v11 = &v12;
  v6 = v5;
  v10 = v6;
  objc_msgSend(a1, "da_loadDAAccountsWithAccountTypeIdentifiers:withCompletion:", v4, v9);
  dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (id)da_accountsWithAccountTypeIdentifiers:()DAExtensions outError:
{
  void *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  os_log_type_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  os_log_type_t v16;
  uint64_t v17;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t buf[4];
  uint64_t v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "accountsWithAccountTypeIdentifiers:error:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)objc_opt_new();
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v7 = v5;
    v8 = -[NSObject countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
    if (v8)
    {
      v9 = v8;
      v19 = v5;
      v10 = *(_QWORD *)v21;
      v11 = *(_BYTE *)(MEMORY[0x1E0D03918] + 3);
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v21 != v10)
            objc_enumerationMutation(v7);
          v13 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i);
          +[DAAccount daAccountSubclassWithBackingAccountInfo:](DAAccount, "daAccountSubclassWithBackingAccountInfo:", v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (v14)
          {
            objc_msgSend(v6, "addObject:", v14);
          }
          else
          {
            DALoggingwithCategory();
            v15 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v15, v11))
            {
              *(_DWORD *)buf = 138412290;
              v25 = v13;
              _os_log_impl(&dword_1C1CD1000, v15, v11, "Could not convert ACAccount (%@) to DAAccount", buf, 0xCu);
            }

          }
        }
        v9 = -[NSObject countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
      }
      while (v9);
      v5 = v19;
    }
  }
  else
  {
    DALoggingwithCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    v16 = *(_BYTE *)(MEMORY[0x1E0D03918] + 3);
    if (os_log_type_enabled(v7, v16))
    {
      v17 = *a4;
      *(_DWORD *)buf = 138412290;
      v25 = v17;
      _os_log_impl(&dword_1C1CD1000, v7, v16, "Could not load ACAccounts due to Account Error %@", buf, 0xCu);
    }
    v6 = 0;
  }

  return v6;
}

- (id)da_accountsWithAccountTypeIdentifiers:()DAExtensions enabledForDADataclasses:
{
  id v6;
  dispatch_semaphore_t v7;
  NSObject *v8;
  id v9;
  _QWORD v11[4];
  NSObject *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v6 = a3;
  v7 = dispatch_semaphore_create(0);
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__1;
  v18 = __Block_byref_object_dispose__1;
  v19 = 0;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __94__ACAccountStore_DAExtensions__da_accountsWithAccountTypeIdentifiers_enabledForDADataclasses___block_invoke;
  v11[3] = &unk_1E7B926E0;
  v13 = &v14;
  v8 = v7;
  v12 = v8;
  objc_msgSend(a1, "da_loadDAAccountsWithAccountTypeIdentifiers:enabledForDADataclasses:withCompletion:", v6, a4, v11);
  dispatch_semaphore_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
  v9 = (id)v15[5];

  _Block_object_dispose(&v14, 8);
  return v9;
}

@end
