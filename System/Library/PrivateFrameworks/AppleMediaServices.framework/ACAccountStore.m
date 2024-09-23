@implementation ACAccountStore

uint64_t __106__ACAccountStore_AppleMediaServices_Project___ams_localiTunesAccountForAccountMediaType_updateStorefront___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_ams_localiTunesAccountForAccountType:shouldUpdateStorefront:", a2, *(unsigned __int8 *)(a1 + 40));
}

id __100__ACAccountStore_AppleMediaServices___fetchLocaliTunesAccountForAccountType_shouldUpdateStorefront___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v16;
  uint64_t v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v6 && (AMSErrorIsEqual(v6, CFSTR("AMSErrorDomain"), 7) & 1) == 0)
  {
    +[AMSLogConfig sharedAccountsConfig](AMSLogConfig, "sharedAccountsConfig");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v8, "OSLogObject");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = objc_opt_class();
      AMSLogKey();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      AMSHashIfNeeded(*(void **)(a1 + 40));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      AMSHashIfNeeded(v7);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138544130;
      v17 = v10;
      v18 = 2114;
      v19 = v11;
      v20 = 2114;
      v21 = v12;
      v22 = 2114;
      v23 = v13;
      _os_log_impl(&dword_18C849000, v9, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to update the storefront in local account after fetching it. localAccount = %{public}@ | error = %{public}@", (uint8_t *)&v16, 0x2Au);

    }
  }
  +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", *(_QWORD *)(a1 + 40));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

id __60__ACAccountStore_AppleMediaServices__ams_cookiesForURL_bag___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  _QWORD v16[4];
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v19 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v10, "name");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v10, v11);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v7);
  }

  v12 = *(void **)(a1 + 32);
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __60__ACAccountStore_AppleMediaServices__ams_cookiesForURL_bag___block_invoke_3;
  v16[3] = &unk_1E253D638;
  v17 = v4;
  v13 = v4;
  objc_msgSend(v12, "thenWithBlock:", v16);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

uint64_t __60__ACAccountStore_AppleMediaServices__ams_cookiesForURL_bag___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "ams_cookiesForURL:bag:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

id __100__ACAccountStore_AppleMediaServices___fetchLocaliTunesAccountForAccountType_shouldUpdateStorefront___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[5];
  id v9;

  objc_msgSend(a2, "ams_firstObjectPassingTest:", &__block_literal_global_87);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    if (!*(_BYTE *)(a1 + 40))
    {
      +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", v3);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
    objc_msgSend(*(id *)(a1 + 32), "_updateStorefrontInLocalAccount:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "promiseAdapter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __100__ACAccountStore_AppleMediaServices___fetchLocaliTunesAccountForAccountType_shouldUpdateStorefront___block_invoke_3;
    v8[3] = &unk_1E253D820;
    v8[4] = *(_QWORD *)(a1 + 32);
    v9 = v3;
    objc_msgSend(v5, "continueWithBlock:", v8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    AMSError(7, CFSTR("Local Account Not Found"), CFSTR("The local account doesn't exist."), 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[AMSPromise promiseWithError:](AMSPromise, "promiseWithError:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

LABEL_7:
  return v6;
}

uint64_t __61__ACAccountStore_AppleMediaServices__ams_activeiTunesAccount__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "ams_isActiveForMediaType:", *(_QWORD *)(a1 + 32));
}

uint64_t __100__ACAccountStore_AppleMediaServices___fetchLocaliTunesAccountForAccountType_shouldUpdateStorefront___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "ams_isLocalAccount");
}

uint64_t __74__ACAccountStore_AppleMediaServices__ams_activeiTunesAccountForMediaType___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "ams_isActiveForMediaType:", *(_QWORD *)(a1 + 32));
}

uint64_t __60__ACAccountStore_AppleMediaServices__ams_localiTunesAccount__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "ams_isLocalAccount");
}

uint64_t __97__ACAccountStore_AppleMediaServices__ams_accountWithAltDSID_DSID_username_accountTypeIdentifier___block_invoke(_QWORD *a1, void *a2)
{
  void *v2;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  v4 = a2;
  objc_msgSend(v4, "ams_altDSID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isEqualToString:", a1[4]) & 1) == 0)
  {
    v7 = a1[5];
    if (v7
      && (objc_msgSend(v4, "ams_DSID"),
          v2 = (void *)objc_claimAutoreleasedReturnValue(),
          (objc_msgSend(v2, "isEqualToNumber:", a1[5]) & 1) != 0))
    {
      v6 = 1;
    }
    else
    {
      objc_msgSend(v4, "username");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v8, "isEqualToString:", a1[6]);

      if (!v7)
        goto LABEL_8;
    }

    goto LABEL_8;
  }
  v6 = 1;
LABEL_8:

  return v6;
}

id __74__ACAccountStore_AppleMediaServices__ams_activeiTunesAccountForMediaType___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[4];
  id v8;

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __74__ACAccountStore_AppleMediaServices__ams_activeiTunesAccountForMediaType___block_invoke_3;
  v7[3] = &unk_1E253D5A0;
  v8 = *(id *)(a1 + 32);
  objc_msgSend(a2, "ams_firstObjectPassingTest:", v7);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    AMSError(7, CFSTR("Account Not Found"), CFSTR("Could not find an account for this media type."), 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[AMSPromise promiseWithError:](AMSPromise, "promiseWithError:", v5);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

void __76__ACAccountStore_AppleMediaServices__ams_mediaAccountForHomeWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  +[AMSLogConfig sharedAccountsConfig](AMSLogConfig, "sharedAccountsConfig");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v4, "OSLogObject");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    v6 = objc_opt_class();
    AMSLogKey();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    AMSHashIfNeeded(*(void **)(a1 + 40));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    AMSLogableError(v3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138544130;
    v11 = v6;
    v12 = 2114;
    v13 = v7;
    v14 = 2114;
    v15 = v8;
    v16 = 2114;
    v17 = v9;
    _os_log_impl(&dword_18C849000, v5, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to fetch the iTunes account for a home identifier. homeIdentifier = %{public}@ | error = %{public}@", (uint8_t *)&v10, 0x2Au);

  }
}

uint64_t __64__ACAccountStore_AppleMediaServices__ams_iTunesAccountWithDSID___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "ams_DSID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToNumber:", *(_QWORD *)(a1 + 32));

  return v4;
}

id __70__ACAccountStore_AppleMediaServices___updateStorefrontInLocalAccount___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v13;
  uint64_t v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "reload");
  if (objc_msgSend(*(id *)(a1 + 32), "ams_copyStorefrontFromAccount:", v3))
  {
    +[AMSLogConfig sharedAccountsConfig](AMSLogConfig, "sharedAccountsConfig");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v4)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v4, "OSLogObject");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = objc_opt_class();
      AMSLogKey();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      AMSHashIfNeeded(*(void **)(a1 + 32));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      AMSHashIfNeeded(v3);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138544130;
      v14 = v6;
      v15 = 2114;
      v16 = v7;
      v17 = 2114;
      v18 = v8;
      v19 = 2114;
      v20 = v9;
      _os_log_impl(&dword_18C849000, v5, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Local account storefront was not in sync with an active account and needed updating. local account = %{public}@ | source account: %{public}@", (uint8_t *)&v13, 0x2Au);

    }
    objc_msgSend(*(id *)(a1 + 40), "ams_saveAccount:", *(_QWORD *)(a1 + 32));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "promiseAdapter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", MEMORY[0x1E0C9AAB0]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

id __74__ACAccountStore_AppleMediaServices__ams_activeiTunesAccountForMediaType___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "ams_altDSID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ams_DSID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "username");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "ams_iTunesAccountWithAltDSID:DSID:username:forMediaType:", v5, v6, v7, *(_QWORD *)(a1 + 40));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

void __66__ACAccountStore_AppleMediaServices__ams_fetchActiveiCloudAccount__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  +[AMSLogConfig sharedAccountsConfig](AMSLogConfig, "sharedAccountsConfig");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v7, "OSLogObject");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    AMSLogKey();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)MEMORY[0x1E0CB3940];
    v11 = objc_opt_class();
    if (v9)
    {
      AMSLogKey();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(*(SEL *)(a1 + 48));
      v18 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "stringWithFormat:", CFSTR("%@: [%@] %@ "), v11, v12, v18);
    }
    else
    {
      NSStringFromSelector(*(SEL *)(a1 + 48));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "stringWithFormat:", CFSTR("%@: %@ "), v11, v12);
    }
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    AMSHashIfNeeded(v5);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    AMSLogableError(v6);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v20 = v13;
    v21 = 2114;
    v22 = v14;
    v23 = 2114;
    v24 = v15;
    _os_log_impl(&dword_18C849000, v8, OS_LOG_TYPE_DEBUG, "%{public}@Received active iCloud account: %{public}@ | error: %{public}@", buf, 0x20u);
    if (v9)
    {

      v13 = (void *)v18;
    }

  }
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 40), "finishWithResult:", v5);
  }
  else
  {
    v16 = *(void **)(a1 + 40);
    if (v6)
    {
      objc_msgSend(v16, "finishWithError:", v6);
    }
    else
    {
      AMSError(7, CFSTR("No Active iCloud Account"), CFSTR("There is no active iCloud account."), 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "finishWithError:", v17);

    }
  }

}

id __60__ACAccountStore_AppleMediaServices__ams_cookiesForURL_bag___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v15 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        v9 = *(void **)(a1 + 32);
        objc_msgSend(v8, "name");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setObject:forKeyedSubscript:", v8, v10);

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v5);
  }
  objc_msgSend(*(id *)(a1 + 32), "allValues");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

id __94__ACAccountStore_AppleMediaServices__ams_iTunesAccountForAccount_forMediaType_createIfNeeded___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  _QWORD v17[4];
  id v18;
  uint64_t v19;
  uint8_t buf[4];
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  if (objc_msgSend(v4, "ams_hasDomain:code:", CFSTR("AMSErrorDomain"), 7))
  {
    +[AMSLogConfig sharedAccountsConfig](AMSLogConfig, "sharedAccountsConfig");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v5, "OSLogObject");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      AMSLogKey();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)MEMORY[0x1E0CB3940];
      v9 = objc_opt_class();
      v10 = v9;
      if (v7)
      {
        AMSLogKey();
        v2 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "stringWithFormat:", CFSTR("%@: [%@] "), v10, v2);
      }
      else
      {
        objc_msgSend(v8, "stringWithFormat:", CFSTR("%@: "), v9);
      }
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v21 = v11;
      _os_log_impl(&dword_18C849000, v6, OS_LOG_TYPE_DEBUG, "%{public}@Did not find an account, creating a new one.", buf, 0xCu);
      if (v7)
      {

        v11 = (void *)v2;
      }

    }
    objc_msgSend(*(id *)(a1 + 32), "_ams_fetchAccountTypeWithAccountTypeIdenfitier:", *MEMORY[0x1E0C8F170]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __94__ACAccountStore_AppleMediaServices__ams_iTunesAccountForAccount_forMediaType_createIfNeeded___block_invoke_50;
    v17[3] = &unk_1E253D6B0;
    v14 = *(id *)(a1 + 40);
    v15 = *(_QWORD *)(a1 + 32);
    v18 = v14;
    v19 = v15;
    objc_msgSend(v13, "thenWithBlock:", v17);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    +[AMSPromise promiseWithError:](AMSPromise, "promiseWithError:", v4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v12;
}

id __94__ACAccountStore_AppleMediaServices__ams_iTunesAccountForAccount_forMediaType_createIfNeeded___block_invoke_50(uint64_t a1, void *a2)
{
  uint64_t v2;
  objc_class *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  _QWORD v23[5];
  id v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = (objc_class *)MEMORY[0x1E0C8F298];
  v5 = a2;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithAccountType:", v5);

  objc_msgSend(v6, "setActive:", 0);
  objc_msgSend(*(id *)(a1 + 32), "ams_altDSID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "ams_setAltDSID:", v7);

  objc_msgSend(*(id *)(a1 + 32), "ams_DSID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "ams_setDSID:", v8);

  objc_msgSend(*(id *)(a1 + 32), "username");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setUsername:", v9);

  +[AMSLogConfig sharedAccountsConfig](AMSLogConfig, "sharedAccountsConfig");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v10, "OSLogObject");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    AMSLogKey();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)MEMORY[0x1E0CB3940];
    v14 = objc_opt_class();
    v15 = v14;
    if (v12)
    {
      AMSLogKey();
      v2 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "stringWithFormat:", CFSTR("%@: [%@] "), v15, v2);
    }
    else
    {
      objc_msgSend(v13, "stringWithFormat:", CFSTR("%@: "), v14);
    }
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    AMSHashIfNeeded(v6);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v26 = v16;
    v27 = 2114;
    v28 = v17;
    _os_log_impl(&dword_18C849000, v11, OS_LOG_TYPE_DEBUG, "%{public}@Created account, saving. account = %{public}@", buf, 0x16u);
    if (v12)
    {

      v16 = (void *)v2;
    }

  }
  objc_msgSend(*(id *)(a1 + 40), "ams_saveAccount:withOptions:", v6, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "promiseAdapter");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __94__ACAccountStore_AppleMediaServices__ams_iTunesAccountForAccount_forMediaType_createIfNeeded___block_invoke_52;
  v23[3] = &unk_1E253D688;
  v23[4] = *(_QWORD *)(a1 + 40);
  v24 = v6;
  v20 = v6;
  objc_msgSend(v19, "thenWithBlock:", v23);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

id __94__ACAccountStore_AppleMediaServices__ams_iTunesAccountForAccount_forMediaType_createIfNeeded___block_invoke_52(uint64_t a1)
{
  uint64_t v1;
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  +[AMSLogConfig sharedAccountsConfig](AMSLogConfig, "sharedAccountsConfig");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v3, "OSLogObject");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    AMSLogKey();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)MEMORY[0x1E0CB3940];
    v7 = objc_opt_class();
    v8 = v7;
    if (v5)
    {
      AMSLogKey();
      v1 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "stringWithFormat:", CFSTR("%@: [%@] "), v8, v1);
    }
    else
    {
      objc_msgSend(v6, "stringWithFormat:", CFSTR("%@: "), v7);
    }
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    AMSHashIfNeeded(*(void **)(a1 + 40));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v13 = v9;
    v14 = 2114;
    v15 = v10;
    _os_log_impl(&dword_18C849000, v4, OS_LOG_TYPE_DEBUG, "%{public}@Successfully saved account, returning. newAccount = %{public}@", buf, 0x16u);
    if (v5)
    {

      v9 = (void *)v1;
    }

  }
  +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", *(_QWORD *)(a1 + 40));
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t __67__ACAccountStore_AppleMediaServices__ams_iTunesAccountWithAltDSID___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "ams_altDSID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

id __80__ACAccountStore_AppleMediaServices__ams_iTunesAccountWithAltDSID_forMediaType___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[4];
  id v8;

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __80__ACAccountStore_AppleMediaServices__ams_iTunesAccountWithAltDSID_forMediaType___block_invoke_2;
  v7[3] = &unk_1E253D5A0;
  v8 = *(id *)(a1 + 32);
  objc_msgSend(a2, "ams_firstObjectPassingTest:", v7);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    AMSError(7, CFSTR("Account Not Found"), CFSTR("Could not find an account with this altDSID for this media type."), 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[AMSPromise promiseWithError:](AMSPromise, "promiseWithError:", v5);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

uint64_t __80__ACAccountStore_AppleMediaServices__ams_iTunesAccountWithAltDSID_forMediaType___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "ams_altDSID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

id __94__ACAccountStore_AppleMediaServices__ams_iTunesAccountWithAltDSID_DSID_username_forMediaType___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;

  v3 = a2;
  v4 = (void *)a1[4];
  v5 = MEMORY[0x1E0C809B0];
  if (v4)
  {
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __94__ACAccountStore_AppleMediaServices__ams_iTunesAccountWithAltDSID_DSID_username_forMediaType___block_invoke_2;
    v16[3] = &unk_1E253D5A0;
    v17 = v4;
    objc_msgSend(v3, "ams_firstObjectPassingTest:", v16);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
      goto LABEL_7;
  }
  v7 = (void *)a1[5];
  if (v7)
  {
    v14[0] = v5;
    v14[1] = 3221225472;
    v14[2] = __94__ACAccountStore_AppleMediaServices__ams_iTunesAccountWithAltDSID_DSID_username_forMediaType___block_invoke_3;
    v14[3] = &unk_1E253D5A0;
    v15 = v7;
    objc_msgSend(v3, "ams_firstObjectPassingTest:", v14);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
      goto LABEL_7;
  }
  v8 = (void *)a1[6];
  if (!v8)
    goto LABEL_8;
  v12[0] = v5;
  v12[1] = 3221225472;
  v12[2] = __94__ACAccountStore_AppleMediaServices__ams_iTunesAccountWithAltDSID_DSID_username_forMediaType___block_invoke_4;
  v12[3] = &unk_1E253D5A0;
  v13 = v8;
  objc_msgSend(v3, "ams_firstObjectPassingTest:", v12);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
LABEL_7:
    +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", v6);
    v9 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
LABEL_8:
    AMSError(7, CFSTR("Account Not Found"), CFSTR("Could not find an account with this altDSID, DSID, or username for this media type."), 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[AMSPromise promiseWithError:](AMSPromise, "promiseWithError:", v6);
    v9 = objc_claimAutoreleasedReturnValue();
  }
  v10 = (void *)v9;

  return v10;
}

uint64_t __94__ACAccountStore_AppleMediaServices__ams_iTunesAccountWithAltDSID_DSID_username_forMediaType___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "ams_altDSID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

uint64_t __94__ACAccountStore_AppleMediaServices__ams_iTunesAccountWithAltDSID_DSID_username_forMediaType___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "ams_DSID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToNumber:", *(_QWORD *)(a1 + 32));

  return v4;
}

uint64_t __94__ACAccountStore_AppleMediaServices__ams_iTunesAccountWithAltDSID_DSID_username_forMediaType___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;

  v3 = a2;
  objc_msgSend(v3, "username");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("local")) & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend(v3, "username");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v6, "isEqualToString:", *(_QWORD *)(a1 + 32));

  }
  return v5;
}

id __77__ACAccountStore_AppleMediaServices__ams_iTunesAccountWithDSID_forMediaType___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[4];
  id v8;

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __77__ACAccountStore_AppleMediaServices__ams_iTunesAccountWithDSID_forMediaType___block_invoke_2;
  v7[3] = &unk_1E253D5A0;
  v8 = *(id *)(a1 + 32);
  objc_msgSend(a2, "ams_firstObjectPassingTest:", v7);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    AMSError(7, CFSTR("Account Not Found"), CFSTR("Could not find an account with this DSID for this media type."), 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[AMSPromise promiseWithError:](AMSPromise, "promiseWithError:", v5);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

uint64_t __77__ACAccountStore_AppleMediaServices__ams_iTunesAccountWithDSID_forMediaType___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "ams_DSID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToNumber:", *(_QWORD *)(a1 + 32));

  return v4;
}

uint64_t __68__ACAccountStore_AppleMediaServices__ams_iTunesAccountWithUsername___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "username");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

id __81__ACAccountStore_AppleMediaServices__ams_iTunesAccountWithUsername_forMediaType___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[4];
  id v8;

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __81__ACAccountStore_AppleMediaServices__ams_iTunesAccountWithUsername_forMediaType___block_invoke_2;
  v7[3] = &unk_1E253D5A0;
  v8 = *(id *)(a1 + 32);
  objc_msgSend(a2, "ams_firstObjectPassingTest:", v7);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    AMSError(7, CFSTR("Account Not Found"), CFSTR("Could not find an account with this username for this media type."), 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[AMSPromise promiseWithError:](AMSPromise, "promiseWithError:", v5);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

uint64_t __81__ACAccountStore_AppleMediaServices__ams_iTunesAccountWithUsername_forMediaType___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "username");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

id __70__ACAccountStore_AppleMediaServices__ams_iTunesAccountsForMediaTypes___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;

  v2 = a2;
  objc_msgSend((id)objc_opt_class(), "ams_accountTypeIdentifierForMediaType:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __70__ACAccountStore_AppleMediaServices__ams_iTunesAccountsForMediaTypes___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_ams_fetchAccountsWithAccountTypeIdentifier:options:", a2, 1);
}

id __70__ACAccountStore_AppleMediaServices__ams_iTunesAccountsForMediaTypes___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = v2;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(v3, "addObjectsFromArray:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v8++), (_QWORD)v12);
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  v9 = (void *)objc_msgSend(v3, "copy");
  +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

void __81__ACAccountStore_AppleMediaServices__ams_setiTunesAccount_forHomeWithIdentifier___block_invoke(void **a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  id WeakRetained;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  +[AMSLogConfig sharedAccountsConfig](AMSLogConfig, "sharedAccountsConfig");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v4, "OSLogObject");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    WeakRetained = objc_loadWeakRetained(a1 + 6);
    v7 = objc_opt_class();
    AMSLogKey();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    AMSHashIfNeeded(a1[4]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    AMSHashIfNeeded(a1[5]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    AMSLogableError(v3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138544386;
    v13 = v7;
    v14 = 2114;
    v15 = v8;
    v16 = 2114;
    v17 = v9;
    v18 = 2114;
    v19 = v10;
    v20 = 2114;
    v21 = v11;
    _os_log_impl(&dword_18C849000, v5, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to set the iTunes account for a home identifier. account = %{public}@ | homeIdentifier = %{public}@ | error = %{public}@", (uint8_t *)&v12, 0x34u);

  }
}

id __67__ACAccountStore_AppleMediaServices___addGlobalCookiesForResponse___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  if (a2)
  {
    objc_msgSend(a2, "ams_asynchronouslyAddGlobalCookiesForResponse:", *(_QWORD *)(a1 + 32));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "promiseAdapter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", MEMORY[0x1E0C9AAB0]);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

id __78__ACAccountStore_AppleMediaServices___createLocaliTunesAccountForAccountType___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;

  v2 = a2;
  if (objc_msgSend(v2, "ams_hasDomain:code:", *MEMORY[0x1E0C8F1D0], 5))
    +[AMSBinaryPromise promiseWithSuccess](AMSBinaryPromise, "promiseWithSuccess");
  else
    +[AMSBinaryPromise promiseWithError:](AMSBinaryPromise, "promiseWithError:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __77__ACAccountStore_AppleMediaServices___fetchLocalAccountForAccountType_error___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "ams_isLocalAccount");
}

void __70__ACAccountStore_AppleMediaServices___updateStorefrontInLocalAccount___block_invoke_100(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if ((AMSErrorIsEqual(v3, CFSTR("AMSErrorDomain"), 7) & 1) == 0)
  {
    +[AMSLogConfig sharedAccountsConfig](AMSLogConfig, "sharedAccountsConfig");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v4)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v4, "OSLogObject");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = objc_opt_class();
      AMSLogKey();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      AMSHashIfNeeded(*(void **)(a1 + 40));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      AMSHashIfNeeded(v3);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138544130;
      v11 = v6;
      v12 = 2114;
      v13 = v7;
      v14 = 2114;
      v15 = v8;
      v16 = 2114;
      v17 = v9;
      _os_log_impl(&dword_18C849000, v5, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to fetch an active account for local account storefront sync. local account = %{public}@ | error = %{public}@", (uint8_t *)&v10, 0x2Au);

    }
  }

}

uint64_t __61__ACAccountStore_AppleMediaServices_Project__ams_demoAccount__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "ams_isDemoAccount");
}

uint64_t __67__ACAccountStore_AppleMediaServices_Project__ams_regulatoryAccount__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "ams_isRegulatoryAccount");
}

void __88__ACAccountStore_AppleMediaServices_Project__ams_saveVerifiedAccount_withOptions_error___block_invoke(uint64_t a1, char a2, id obj)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
}

id __107__ACAccountStore_AppleMediaServices_Project___ams_localiTunesAccountForAccountType_shouldUpdateStorefront___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[5];
  id v10;
  char v11;

  v3 = a2;
  if ((objc_msgSend(v3, "ams_hasDomain:code:", CFSTR("AMSErrorDomain"), 7) & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "_createLocaliTunesAccountForAccountType:", *(_QWORD *)(a1 + 40));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "promiseAdapter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __107__ACAccountStore_AppleMediaServices_Project___ams_localiTunesAccountForAccountType_shouldUpdateStorefront___block_invoke_2;
    v9[3] = &unk_1E253D900;
    v6 = *(void **)(a1 + 40);
    v9[4] = *(_QWORD *)(a1 + 32);
    v10 = v6;
    v11 = *(_BYTE *)(a1 + 48);
    objc_msgSend(v5, "thenWithBlock:", v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    +[AMSPromise promiseWithError:](AMSPromise, "promiseWithError:", v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

uint64_t __107__ACAccountStore_AppleMediaServices_Project___ams_localiTunesAccountForAccountType_shouldUpdateStorefront___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchLocaliTunesAccountForAccountType:shouldUpdateStorefront:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));
}

@end
