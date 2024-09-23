@implementation ACAccountStore(ESExtensions)

- (void)_esAccountsWithAccountTypeIdentifiers:()ESExtensions enabledForDADataclasses:filterOnDataclasses:withCompletion:
{
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  NSObject *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id obj;
  _QWORD block[4];
  id v26;
  id v27;
  _QWORD *v28;
  _QWORD v29[5];
  id v30;
  NSObject *v31;
  _QWORD *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _QWORD v37[5];
  id v38;
  _QWORD v39[5];
  id v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v23 = a3;
  v22 = a6;
  if ((_esAccountsWithAccountTypeIdentifiers_enabledForDADataclasses_filterOnDataclasses_withCompletion___haveRegisteredForInterrogation & 1) == 0)
  {
    _esAccountsWithAccountTypeIdentifiers_enabledForDADataclasses_filterOnDataclasses_withCompletion___haveRegisteredForInterrogation = 1;
    if ((_sESIsRunningInExchangeSyncD & 1) == 0)
    {
      if (_esAccountsWithAccountTypeIdentifiers_enabledForDADataclasses_filterOnDataclasses_withCompletion__onceToken != -1)
        dispatch_once(&_esAccountsWithAccountTypeIdentifiers_enabledForDADataclasses_filterOnDataclasses_withCompletion__onceToken, &__block_literal_global_0);
      objc_msgSend(MEMORY[0x24BE2FE00], "sharedConnection", v22);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "registerForInterrogationWithBlock:", &__block_literal_global_3);

    }
  }
  if (a5)
  {
    acDataclassesForDADataclasses();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "allObjects");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v39[0] = MEMORY[0x24BDAC760];
    v39[1] = 3221225472;
    v39[2] = __129__ACAccountStore_ESExtensions___esAccountsWithAccountTypeIdentifiers_enabledForDADataclasses_filterOnDataclasses_withCompletion___block_invoke_4;
    v39[3] = &unk_24F4DE288;
    v39[4] = a1;
    v40 = v22;
    v12 = v22;
    objc_msgSend(a1, "accountIdentifiersEnabledForDataclasses:withAccountTypeIdentifiers:completion:", v11, v23, v39);

  }
  else
  {
    v37[0] = 0;
    v37[1] = v37;
    v37[2] = 0x3032000000;
    v37[3] = __Block_byref_object_copy__0;
    v37[4] = __Block_byref_object_dispose__0;
    v38 = 0;
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = dispatch_group_create();
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    obj = v23;
    v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
    if (v15)
    {
      v16 = *(_QWORD *)v34;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v34 != v16)
            objc_enumerationMutation(obj);
          v18 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * i);
          dispatch_group_enter(v14);
          v29[0] = MEMORY[0x24BDAC760];
          v29[1] = 3221225472;
          v29[2] = __129__ACAccountStore_ESExtensions___esAccountsWithAccountTypeIdentifiers_enabledForDADataclasses_filterOnDataclasses_withCompletion___block_invoke_3_11;
          v29[3] = &unk_24F4DE2D8;
          v29[4] = a1;
          v32 = v37;
          v30 = v13;
          v31 = v14;
          objc_msgSend(a1, "accountTypeWithIdentifier:completion:", v18, v29);

        }
        v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
      }
      while (v15);
    }

    dispatch_get_global_queue(0, 0);
    v19 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __129__ACAccountStore_ESExtensions___esAccountsWithAccountTypeIdentifiers_enabledForDADataclasses_filterOnDataclasses_withCompletion___block_invoke_5;
    block[3] = &unk_24F4DE260;
    v26 = v13;
    v27 = v22;
    v28 = v37;
    v20 = v13;
    v21 = v22;
    dispatch_group_notify(v14, v19, block);

    _Block_object_dispose(v37, 8);
  }

}

- (void)es_loadESAccountsWithCompletion:()ESExtensions
{
  void *v4;
  id v5;
  void *v6;
  id v7;

  v4 = (void *)MEMORY[0x24BE2AA60];
  v5 = a3;
  objc_msgSend(v4, "_leafAccountTypes");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "allObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_esAccountsWithAccountTypeIdentifiers:enabledForDADataclasses:filterOnDataclasses:withCompletion:", v6, 0, 0, v5);

}

- (void)es_loadESAccountsEnabledForDADataclasses:()ESExtensions withCompletion:
{
  void *v6;
  id v7;
  void *v8;
  id v9;

  v6 = (void *)MEMORY[0x24BE2AA60];
  v7 = a4;
  objc_msgSend(v6, "_leafAccountTypes");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "allObjects");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_esAccountsWithAccountTypeIdentifiers:enabledForDADataclasses:filterOnDataclasses:withCompletion:", v8, a3, 1, v7);

}

- (uint64_t)es_loadESAccountsWithAccountTypeIdentifiers:()ESExtensions withCompletion:
{
  return objc_msgSend(a1, "_esAccountsWithAccountTypeIdentifiers:enabledForDADataclasses:filterOnDataclasses:withCompletion:", a3, 0, 0, a4);
}

- (uint64_t)es_loadESAccountsWithAccountTypeIdentifiers:()ESExtensions enabledForDADataclasses:withCompletion:
{
  return objc_msgSend(a1, "_esAccountsWithAccountTypeIdentifiers:enabledForDADataclasses:filterOnDataclasses:withCompletion:", a3, a4, 1, a5);
}

- (id)es_accountsWithAccountTypeIdentifiers:()ESExtensions outError:
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

  v27 = *MEMORY[0x24BDAC8D0];
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
      v11 = *(_BYTE *)(MEMORY[0x24BE2AD38] + 3);
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v21 != v10)
            objc_enumerationMutation(v7);
          v13 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i);
          +[ESAccount esAccountSubclassWithBackingAccountInfo:](ESAccount, "esAccountSubclassWithBackingAccountInfo:", v13);
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
              _os_log_impl(&dword_22AC94000, v15, v11, "Could not convert ACAccount (%@) to DAAccount", buf, 0xCu);
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
    v16 = *(_BYTE *)(MEMORY[0x24BE2AD38] + 3);
    if (os_log_type_enabled(v7, v16))
    {
      v17 = *a4;
      *(_DWORD *)buf = 138412290;
      v25 = v17;
      _os_log_impl(&dword_22AC94000, v7, v16, "Could not load ACAccounts due to Account Error %@", buf, 0xCu);
    }
    v6 = 0;
  }

  return v6;
}

@end
