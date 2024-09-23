@implementation ACAccountStore(AppleMediaServices)

- (id)ams_activeiTunesAccount
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[4];
  id v12;

  objc_msgSend(a1, "ams_mediaType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isEqualToString:", AMSAccountMediaTypeAppStoreBeta))
  {
    objc_msgSend(MEMORY[0x1E0C8F2B8], "ams_sharedAccountStore");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "ams_activeiTunesAccount");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "ams_altDSID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "ams_DSID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "username");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "ams_iTunesAccountWithAltDSID:DSID:username:", v5, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(a1, "ams_iTunesAccounts");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __61__ACAccountStore_AppleMediaServices__ams_activeiTunesAccount__block_invoke;
    v11[3] = &unk_1E253D5A0;
    v12 = v2;
    objc_msgSend(v9, "ams_firstObjectPassingTest:", v11);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

- (id)ams_iTunesAccounts
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  id v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_opt_class();
  objc_msgSend(a1, "ams_mediaType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ams_accountTypeIdentifierForMediaType:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = 0;
  objc_msgSend(a1, "_ams_accountsWithAccountTypeIdentifier:options:error:", v4, 1, &v15);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v15;
  v7 = v5;
  if (!v5)
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
      v10 = (void *)objc_opt_class();
      v11 = v10;
      AMSLogableError(v6);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v17 = v10;
      v18 = 2114;
      v19 = v12;
      _os_log_impl(&dword_18C849000, v9, OS_LOG_TYPE_ERROR, "%{public}@: Failed to fetch the iTunes accounts. error = %{public}@", buf, 0x16u);

    }
    v7 = (void *)MEMORY[0x1E0C9AA60];
  }
  v13 = v7;

  return v13;
}

+ (id)ams_accountTypeIdentifierForMediaType:()AppleMediaServices
{
  return AMSAccountTypeIdentifierForMediaType(a3);
}

+ (id)ams_sharedAccountStoreForMediaType:()AppleMediaServices
{
  id v4;
  void *v5;

  v4 = a3;
  if (!v4)
  {
    +[AMSProcessInfo defaultMediaTypeForCurrentProcess](AMSProcessInfo, "defaultMediaTypeForCurrentProcess");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  if ((objc_msgSend(v4, "isEqualToString:", AMSAccountMediaTypeAppStoreBeta) & 1) == 0
    && (objc_msgSend(v4, "isEqualToString:", AMSAccountMediaTypeAppStoreSandbox) & 1) == 0)
  {

    goto LABEL_8;
  }
  if (!v4)
  {
LABEL_8:
    objc_msgSend(a1, "_ams_defaultAccountStore");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    return v5;
  }
  +[AMSAccountStoreCache accountStoreForMediaType:](AMSAccountStoreCache, "accountStoreForMediaType:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)ams_mediaType
{
  return +[AMSAccountStoreCache mediaTypeForAccountStore:](AMSAccountStoreCache, "mediaTypeForAccountStore:", a1);
}

- (id)ams_fetchLocaliTunesAccount
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "ams_mediaType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "ams_localiTunesAccountForAccountMediaType:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (uint64_t)ams_localiTunesAccountForAccountMediaType:()AppleMediaServices
{
  return objc_msgSend(a1, "_ams_localiTunesAccountForAccountMediaType:updateStorefront:", a3, 0);
}

- (id)_accountTypeForMediaType:()AppleMediaServices
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "ams_accountTypeIdentifierForMediaType:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "_ams_fetchAccountTypeWithAccountTypeIdenfitier:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_fetchLocaliTunesAccountForAccountType:()AppleMediaServices shouldUpdateStorefront:
{
  void *v6;
  void *v7;
  _QWORD v9[5];
  char v10;

  AMSiTunesAccountsForAccountType(a1, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __100__ACAccountStore_AppleMediaServices___fetchLocaliTunesAccountForAccountType_shouldUpdateStorefront___block_invoke;
  v9[3] = &unk_1E253D848;
  v10 = a4;
  v9[4] = a1;
  objc_msgSend(v6, "thenWithBlock:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_correspondingAccountWithAccountTypeIdentifier:()AppleMediaServices forAccount:
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  int v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  int v20;
  uint64_t v21;
  __int16 v22;
  id v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "accountType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqualToString:", v6);

  if (v10)
  {
    v11 = v7;
  }
  else
  {
    objc_msgSend(v7, "ams_altDSID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "ams_DSID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "username");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "ams_accountWithAltDSID:DSID:username:accountTypeIdentifier:", v12, v13, v14, v6);
    v11 = (id)objc_claimAutoreleasedReturnValue();

    if (!v11)
    {
      +[AMSLogConfig sharedAccountsConfig](AMSLogConfig, "sharedAccountsConfig");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v15)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v15, "OSLogObject");
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        v17 = objc_opt_class();
        objc_msgSend(v7, "hashedDescription");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = 138543874;
        v21 = v17;
        v22 = 2114;
        v23 = v6;
        v24 = 2114;
        v25 = v18;
        _os_log_impl(&dword_18C849000, v16, OS_LOG_TYPE_DEBUG, "%{public}@: Failed to find a corresponding account. accountTypeIdentifier = %{public}@ | account = %{public}@", (uint8_t *)&v20, 0x20u);

      }
      v11 = 0;
    }
  }

  return v11;
}

- (id)ams_accountWithAltDSID:()AppleMediaServices DSID:username:accountTypeIdentifier:
{
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  id v26;
  uint8_t buf[4];
  uint64_t v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  id v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v26 = 0;
  objc_msgSend(a1, "_ams_accountsWithAccountTypeIdentifier:options:error:", a6, 1, &v26);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v26;
  if (v13)
  {
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __97__ACAccountStore_AppleMediaServices__ams_accountWithAltDSID_DSID_username_accountTypeIdentifier___block_invoke;
    v22[3] = &unk_1E253D5E8;
    v23 = v10;
    v24 = v11;
    v25 = v12;
    objc_msgSend(v13, "ams_firstObjectPassingTest:", v22);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = v23;
  }
  else
  {
    +[AMSLogConfig sharedAccountsConfig](AMSLogConfig, "sharedAccountsConfig");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v16)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v16, "OSLogObject");
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v18 = objc_opt_class();
      AMSLogKey();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      AMSLogableError(v14);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v28 = v18;
      v29 = 2114;
      v30 = v19;
      v31 = 2114;
      v32 = v11;
      v33 = 2114;
      v34 = v20;
      _os_log_impl(&dword_18C849000, v17, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to fetch account with DSID %{public}@: %{public}@", buf, 0x2Au);

    }
    v15 = 0;
  }

  return v15;
}

+ (uint64_t)ams_sharedAccountStore
{
  return objc_msgSend(a1, "ams_sharedAccountStoreForMediaType:", 0);
}

- (uint64_t)ams_IDMSAccountForAccount:()AppleMediaServices
{
  return objc_msgSend(a1, "_correspondingAccountWithAccountTypeIdentifier:forAccount:", *MEMORY[0x1E0C8F0C8], a3);
}

- (void)ams_isActiveAccountCombined
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(a1, "ams_activeiCloudAccount");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "ams_activeiTunesAccount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ams_DSID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v3, "ams_DSID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      objc_msgSend(v2, "ams_DSID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "ams_DSID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = (void *)objc_msgSend(v6, "isEqualToNumber:", v7);

    }
    else
    {
      v4 = 0;
    }
  }

  return v4;
}

- (uint64_t)ams_localiTunesAccountForAccountType:()AppleMediaServices
{
  return objc_msgSend(a1, "_ams_localiTunesAccountForAccountType:shouldUpdateStorefront:", a3, 0);
}

- (uint64_t)ams_addCookiesForResponse:()AppleMediaServices account:error:
{
  void *v6;
  uint64_t v7;

  objc_msgSend(a1, "ams_addCookiesForResponse:account:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "resultWithError:", a5);

  return v7;
}

- (id)ams_localiTunesAccount
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  NSObject *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  id v28;
  id v29;
  uint8_t buf[4];
  uint64_t v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_opt_class();
  objc_msgSend(a1, "ams_mediaType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ams_accountTypeIdentifierForMediaType:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v29 = 0;
    objc_msgSend(a1, "_ams_accountsWithAccountTypeIdentifier:options:error:", v4, 1, &v29);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = v29;
    if (v5)
    {
      -[NSObject ams_firstObjectPassingTest:](v5, "ams_firstObjectPassingTest:", &__block_literal_global_0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        v8 = v7;
        v9 = v8;
      }
      else
      {
        objc_msgSend(a1, "ams_mediaType");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "ams_localiTunesAccountForAccountMediaType:", v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = v6;
        objc_msgSend(v19, "resultWithError:", &v28);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = v28;

        if (!v20)
        {
          +[AMSLogConfig sharedAccountsConfig](AMSLogConfig, "sharedAccountsConfig");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v22)
          {
            +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
          }
          objc_msgSend(v22, "OSLogObject");
          v23 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          {
            v24 = objc_opt_class();
            AMSLogKey();
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            AMSLogableError(v21);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v31 = v24;
            v32 = 2114;
            v33 = v25;
            v34 = 2114;
            v35 = v26;
            _os_log_impl(&dword_18C849000, v23, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to create/fetch the local account. error = %{public}@", buf, 0x20u);

          }
        }
        v8 = v20;
        v9 = v8;
        v6 = v21;
      }
      v13 = v8;
    }
    else
    {
      +[AMSLogConfig sharedAccountsConfig](AMSLogConfig, "sharedAccountsConfig");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v9)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v9, "OSLogObject");
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        v15 = objc_opt_class();
        AMSLogKey();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        AMSLogableError(v6);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v31 = v15;
        v32 = 2114;
        v33 = v16;
        v34 = 2114;
        v35 = v17;
        _os_log_impl(&dword_18C849000, v14, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to create/fetch the local account. error = %{public}@", buf, 0x20u);

      }
      v13 = 0;
    }

  }
  else
  {
    +[AMSLogConfig sharedAccountsConfig](AMSLogConfig, "sharedAccountsConfig");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v6 = (id)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v6, "OSLogObject");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v10 = objc_opt_class();
      AMSLogKey();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "ams_mediaType");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v31 = v10;
      v32 = 2114;
      v33 = v11;
      v34 = 2114;
      v35 = v12;
      _os_log_impl(&dword_18C849000, v5, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to create/fetch the local account. Invalid media type. mediaType = %{public}@", buf, 0x20u);

    }
    v13 = 0;
  }

  return v13;
}

- (AMSPromise)ams_mediaAccountForHomeWithIdentifier:()AppleMediaServices
{
  id v4;
  AMSPromise *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, void *);
  void *v13;
  uint64_t v14;
  id v15;

  v4 = a3;
  v5 = objc_alloc_init(AMSPromise);
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __76__ACAccountStore_AppleMediaServices__ams_mediaAccountForHomeWithIdentifier___block_invoke;
  v13 = &unk_1E253D950;
  v14 = a1;
  v15 = v4;
  v6 = v4;
  -[AMSPromise addErrorBlock:](v5, "addErrorBlock:", &v10);
  +[AMSMultiUserService proxyObject](AMSMultiUserService, "proxyObject", v10, v11, v12, v13, v14);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSPromise completionHandlerAdapter](v5, "completionHandlerAdapter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "iTunesAccountForHomeWithIdentifier:completion:", v6, v8);

  return v5;
}

- (id)ams_cookiesForURL:()AppleMediaServices
{
  void *v3;
  void *v4;

  objc_msgSend(a1, "ams_cookiesForURL:bag:", a3, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "resultWithError:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)ams_cookiesForURL:()AppleMediaServices bag:
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  _QWORD v19[4];
  id v20;
  _QWORD aBlock[4];
  id v22;
  id v23;

  v6 = a3;
  v7 = a4;
  objc_msgSend(a1, "ams_fetchLocaliTunesAccount");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "ams_mediaType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "ams_activeiTunesAccountForMediaType:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __60__ACAccountStore_AppleMediaServices__ams_cookiesForURL_bag___block_invoke;
  aBlock[3] = &unk_1E253D610;
  v22 = v6;
  v23 = v7;
  v12 = v7;
  v13 = v6;
  v14 = _Block_copy(aBlock);
  objc_msgSend(v8, "thenWithBlock:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "thenWithBlock:", v14);
  v19[0] = v11;
  v19[1] = 3221225472;
  v19[2] = __60__ACAccountStore_AppleMediaServices__ams_cookiesForURL_bag___block_invoke_2;
  v19[3] = &unk_1E253D638;
  v20 = (id)objc_claimAutoreleasedReturnValue();
  v16 = v20;
  objc_msgSend(v15, "thenWithBlock:", v19);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (id)_updateStorefrontInLocalAccount:()AppleMediaServices
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(uint64_t, void *);
  void *v25;
  void *v26;
  id v27;
  _QWORD v28[4];
  id v29;
  void *v30;
  uint8_t buf[4];
  uint64_t v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((objc_msgSend(v4, "ams_isLocalAccount") & 1) != 0)
  {
    objc_msgSend(a1, "ams_mediaType");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(a1, "ams_activeiTunesAccountForMediaType:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = MEMORY[0x1E0C809B0];
      v28[0] = MEMORY[0x1E0C809B0];
      v28[1] = 3221225472;
      v28[2] = __70__ACAccountStore_AppleMediaServices___updateStorefrontInLocalAccount___block_invoke;
      v28[3] = &unk_1E253D610;
      v8 = v4;
      v29 = v8;
      v30 = a1;
      objc_msgSend(v6, "thenWithBlock:", v28);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      v22 = v7;
      v23 = 3221225472;
      v24 = __70__ACAccountStore_AppleMediaServices___updateStorefrontInLocalAccount___block_invoke_100;
      v25 = &unk_1E253D950;
      v26 = a1;
      v27 = v8;
      objc_msgSend(v9, "addErrorBlock:", &v22);
      objc_msgSend(v9, "binaryPromiseAdapter", v22, v23, v24, v25, v26);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      v11 = v29;
    }
    else
    {
      +[AMSLogConfig sharedAccountsConfig](AMSLogConfig, "sharedAccountsConfig");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v17)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v17, "OSLogObject");
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        v19 = objc_opt_class();
        AMSLogKey();
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v32 = v19;
        v33 = 2114;
        v34 = v20;
        _os_log_impl(&dword_18C849000, v18, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to fetch media type for storefront sync.", buf, 0x16u);

      }
      AMSError(0, CFSTR("Aborted attempt to sync storefront to local account"), CFSTR("Failed to fetch the mediaType for the provided account"), 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      +[AMSBinaryPromise promiseWithError:](AMSBinaryPromise, "promiseWithError:", v11);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    +[AMSLogConfig sharedAccountsConfig](AMSLogConfig, "sharedAccountsConfig");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v12)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v12, "OSLogObject");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = objc_opt_class();
      AMSLogKey();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      AMSHashIfNeeded(v4);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v32 = v14;
      v33 = 2114;
      v34 = v15;
      v35 = 2114;
      v36 = v16;
      _os_log_impl(&dword_18C849000, v13, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Storefront sync attempted on a non-local account. account = %{public}@", buf, 0x20u);

    }
    AMSError(2, CFSTR("Aborted attempt to sync storefront to local account"), CFSTR("The provided account is not a local account"), 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[AMSBinaryPromise promiseWithError:](AMSBinaryPromise, "promiseWithError:", v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

- (id)ams_activeiTunesAccountForMediaType:()AppleMediaServices
{
  id v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;
  _QWORD v12[5];
  id v13;

  v4 = a3;
  if (objc_msgSend(v4, "isEqualToString:", AMSAccountMediaTypeAppStoreBeta))
  {
    objc_msgSend(MEMORY[0x1E0C8F2B8], "ams_sharedAccountStore");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "ams_activeiTunesAccountForMediaType:", AMSAccountMediaTypeProduction);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __74__ACAccountStore_AppleMediaServices__ams_activeiTunesAccountForMediaType___block_invoke;
    v12[3] = &unk_1E253D610;
    v12[4] = a1;
    v13 = v4;
    v7 = v4;
    objc_msgSend(v6, "thenWithBlock:", v12);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(a1, "ams_iTunesAccountsForMediaType:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __74__ACAccountStore_AppleMediaServices__ams_activeiTunesAccountForMediaType___block_invoke_2;
    v10[3] = &unk_1E253D638;
    v11 = v4;
    v5 = v4;
    objc_msgSend(v6, "thenWithBlock:", v10);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v11;
  }

  return v8;
}

- (id)ams_iTunesAccountsForMediaType:()AppleMediaServices
{
  return AMSiTunesAccountsForMediaType(a1, a3);
}

- (uint64_t)ams_removeCookiesMatchingProperties:()AppleMediaServices error:
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  objc_msgSend(a1, "ams_alliTunesAccounts", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    LODWORD(v11) = 1;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v7);
        v11 = v11 & objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "ams_removeCookiesMatchingProperties:error:", v6, a4);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v9);
  }
  else
  {
    v11 = 1;
  }

  return v11;
}

- (id)ams_iTunesAccountWithDSID:()AppleMediaServices
{
  id v4;
  void *v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  if (v4)
  {
    objc_msgSend(a1, "ams_iTunesAccounts");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __64__ACAccountStore_AppleMediaServices__ams_iTunesAccountWithDSID___block_invoke;
    v8[3] = &unk_1E253D5A0;
    v9 = v4;
    objc_msgSend(v5, "ams_firstObjectPassingTest:", v8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)ams_sharedAccountStoreForClient:()AppleMediaServices
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "accountMediaType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "ams_sharedAccountStoreForMediaType:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (uint64_t)ams_fetchiTunesAccounts
{
  return objc_msgSend(a1, "_ams_fetchAccountsWithAccountTypeIdentifier:options:", *MEMORY[0x1E0C8F170], 1);
}

- (uint64_t)ams_fetchiTunesSandboxAccounts
{
  return objc_msgSend(a1, "_ams_fetchAccountsWithAccountTypeIdentifier:options:", *MEMORY[0x1E0C8F180], 1);
}

- (AMSMutablePromise)ams_fetchActiveiCloudAccount
{
  uint64_t v2;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  AMSMutablePromise *v12;
  AMSMutablePromise *v13;
  AMSMutablePromise *v14;
  AMSMutablePromise *v15;
  _QWORD v17[5];
  AMSMutablePromise *v18;
  const char *v19;
  uint8_t buf[4];
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
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
    if (v7)
    {
      AMSLogKey();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v2 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "stringWithFormat:", CFSTR("%@: [%@] %@ "), v9, v10, v2);
    }
    else
    {
      NSStringFromSelector(a2);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "stringWithFormat:", CFSTR("%@: %@ "), v9, v10);
    }
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v21 = v11;
    _os_log_impl(&dword_18C849000, v6, OS_LOG_TYPE_DEBUG, "%{public}@Fetching active iCloud account", buf, 0xCu);
    if (v7)
    {

      v11 = (void *)v2;
    }

  }
  v12 = objc_alloc_init(AMSMutablePromise);
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __66__ACAccountStore_AppleMediaServices__ams_fetchActiveiCloudAccount__block_invoke;
  v17[3] = &unk_1E253D660;
  v17[4] = a1;
  v19 = a2;
  v13 = v12;
  v18 = v13;
  objc_msgSend(a1, "aa_primaryAppleAccountWithCompletion:", v17);
  v14 = v18;
  v15 = v13;

  return v15;
}

- (id)ams_fetchGrandSlamTokenForAccount:()AppleMediaServices withIdentifier:error:
{
  void *v6;
  void *v7;

  objc_msgSend(a1, "ams_fetchGrandSlamTokenForAccount:withIdentifier:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "resultWithError:", a5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)ams_fetchGrandSlamTokenForAccount:()AppleMediaServices withIdentifier:
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  id v31;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "ams_altDSID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "aida_accountForAltDSID:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = (void *)MEMORY[0x18D78A1C4]();
    v31 = 0;
    objc_msgSend(a1, "credentialForAccount:serviceID:error:", v9, v7, &v31);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v31;
    objc_msgSend(v11, "token");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v13, "copy");

    objc_autoreleasePoolPop(v10);
    if (v12)
    {
      +[AMSPromise promiseWithError:](AMSPromise, "promiseWithError:", v12);
      v15 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (!v14)
      {
        AMSHashIfNeeded(v6);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        AMSErrorWithFormat(7, CFSTR("GrandSlam Token Missing"), CFSTR("There's no GrandSlam token (%@) for %@."), v24, v25, v26, v27, v28, (uint64_t)v7);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        +[AMSPromise promiseWithError:](AMSPromise, "promiseWithError:", v29);
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_8;
      }
      +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", v14);
      v15 = objc_claimAutoreleasedReturnValue();
    }
    v22 = (void *)v15;
LABEL_8:

    goto LABEL_9;
  }
  AMSHashIfNeeded(v6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  AMSErrorWithFormat(7, CFSTR("AIDA Account Missing"), CFSTR("There's no AIDA account matching %@."), v16, v17, v18, v19, v20, (uint64_t)v14);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSPromise promiseWithError:](AMSPromise, "promiseWithError:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_9:
  return v22;
}

- (uint64_t)ams_iCloudAccountForAccount:()AppleMediaServices
{
  return objc_msgSend(a1, "_correspondingAccountWithAccountTypeIdentifier:forAccount:", *MEMORY[0x1E0C8F030], a3);
}

- (uint64_t)ams_IDSAccountForAccount:()AppleMediaServices
{
  return objc_msgSend(a1, "_correspondingAccountWithAccountTypeIdentifier:forAccount:", *MEMORY[0x1E0C8F0E8], a3);
}

- (uint64_t)ams_iTunesAccountForAccount:()AppleMediaServices
{
  return objc_msgSend(a1, "_correspondingAccountWithAccountTypeIdentifier:forAccount:", *MEMORY[0x1E0C8F170], a3);
}

- (id)ams_iTunesAccountForAccount:()AppleMediaServices forMediaType:createIfNeeded:
{
  uint64_t v5;
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  const __CFString *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  _QWORD v36[5];
  id v37;
  uint8_t buf[4];
  void *v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  uint64_t v43;
  __int16 v44;
  const __CFString *v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
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
      v5 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "stringWithFormat:", CFSTR("%@: [%@] "), v15, v5);
    }
    else
    {
      objc_msgSend(v13, "stringWithFormat:", CFSTR("%@: "), v14);
    }
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    AMSHashIfNeeded(v8);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    AMSHashIfNeeded(v9);
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = (void *)v18;
    v20 = CFSTR("false");
    *(_DWORD *)buf = 138544130;
    v39 = v16;
    if (a5)
      v20 = CFSTR("true");
    v40 = 2114;
    v41 = v17;
    v42 = 2114;
    v43 = v18;
    v44 = 2114;
    v45 = v20;
    _os_log_impl(&dword_18C849000, v11, OS_LOG_TYPE_DEBUG, "%{public}@Searching for iTunes account for account: %{public}@ | mediaType = %{public}@ | createIfNeeded = %{public}@", buf, 0x2Au);
    if (v12)
    {

      v16 = (void *)v5;
    }

  }
  if (objc_msgSend(v8, "ams_isiTunesAccount"))
  {
    +[AMSLogConfig sharedAccountsConfig](AMSLogConfig, "sharedAccountsConfig");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v21)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v21, "OSLogObject");
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    {
      AMSLogKey();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = (void *)MEMORY[0x1E0CB3940];
      v25 = objc_opt_class();
      v26 = v25;
      if (v23)
      {
        AMSLogKey();
        a1 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "stringWithFormat:", CFSTR("%@: [%@] "), v26, a1);
      }
      else
      {
        objc_msgSend(v24, "stringWithFormat:", CFSTR("%@: "), v25);
      }
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      AMSHashIfNeeded(v8);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v39 = v27;
      v40 = 2114;
      v41 = v33;
      _os_log_impl(&dword_18C849000, v22, OS_LOG_TYPE_DEBUG, "%{public}@The account is already an iTunes account, returning. account = %{public}@", buf, 0x16u);
      if (v23)
      {

        v27 = a1;
      }

    }
    +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", v8);
    v32 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v8, "ams_altDSID");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "ams_DSID");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "username");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "ams_iTunesAccountWithAltDSID:DSID:username:forMediaType:", v28, v29, v30, v9);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    if (a5)
    {
      v36[0] = MEMORY[0x1E0C809B0];
      v36[1] = 3221225472;
      v36[2] = __94__ACAccountStore_AppleMediaServices__ams_iTunesAccountForAccount_forMediaType_createIfNeeded___block_invoke;
      v36[3] = &unk_1E253D6D8;
      v36[4] = a1;
      v37 = v8;
      objc_msgSend(v31, "catchWithBlock:", v36);
      v32 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v32 = v31;
    }

  }
  return v32;
}

- (id)ams_iTunesAccountWithAltDSID:()AppleMediaServices
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  objc_msgSend(a1, "ams_iTunesAccounts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __67__ACAccountStore_AppleMediaServices__ams_iTunesAccountWithAltDSID___block_invoke;
  v9[3] = &unk_1E253D5A0;
  v10 = v4;
  v6 = v4;
  objc_msgSend(v5, "ams_firstObjectPassingTest:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)ams_iTunesAccountWithAltDSID:()AppleMediaServices forMediaType:
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v11[4];
  id v12;

  v6 = a3;
  objc_msgSend(a1, "ams_iTunesAccountsForMediaType:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __80__ACAccountStore_AppleMediaServices__ams_iTunesAccountWithAltDSID_forMediaType___block_invoke;
  v11[3] = &unk_1E253D638;
  v12 = v6;
  v8 = v6;
  objc_msgSend(v7, "thenWithBlock:", v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)ams_iTunesAccountWithAltDSID:()AppleMediaServices DSID:username:
{
  id v8;
  id v9;
  id v10;
  void *v11;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v8)
  {
    objc_msgSend(a1, "ams_iTunesAccountWithAltDSID:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9)
      goto LABEL_7;
  }
  else
  {
    v11 = 0;
    if (!v9)
      goto LABEL_7;
  }
  if (!v11)
  {
    objc_msgSend(a1, "ams_iTunesAccountWithDSID:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
LABEL_7:
  if (v10 && !v11)
  {
    objc_msgSend(a1, "ams_iTunesAccountWithUsername:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

- (id)ams_iTunesAccountWithAltDSID:()AppleMediaServices DSID:username:forMediaType:
{
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  objc_msgSend(a1, "ams_iTunesAccountsForMediaType:", a6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __94__ACAccountStore_AppleMediaServices__ams_iTunesAccountWithAltDSID_DSID_username_forMediaType___block_invoke;
  v19[3] = &unk_1E253D700;
  v20 = v10;
  v21 = v11;
  v22 = v12;
  v14 = v12;
  v15 = v11;
  v16 = v10;
  objc_msgSend(v13, "thenWithBlock:", v19);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (id)ams_iTunesAccountWithDSID:()AppleMediaServices forMediaType:
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v11[4];
  id v12;

  v6 = a3;
  objc_msgSend(a1, "ams_iTunesAccountsForMediaType:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __77__ACAccountStore_AppleMediaServices__ams_iTunesAccountWithDSID_forMediaType___block_invoke;
  v11[3] = &unk_1E253D638;
  v12 = v6;
  v8 = v6;
  objc_msgSend(v7, "thenWithBlock:", v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)ams_iTunesAccountWithUsername:()AppleMediaServices
{
  id v4;
  void *v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("local")) & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend(a1, "ams_iTunesAccounts");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __68__ACAccountStore_AppleMediaServices__ams_iTunesAccountWithUsername___block_invoke;
    v8[3] = &unk_1E253D5A0;
    v9 = v4;
    objc_msgSend(v6, "ams_firstObjectPassingTest:", v8);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (id)ams_iTunesAccountWithUsername:()AppleMediaServices forMediaType:
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD v11[4];
  id v12;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("local")))
  {
    AMSError(7, CFSTR("Account Not Found"), CFSTR("Could not find an account with the local username for this media type."), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[AMSPromise promiseWithError:](AMSPromise, "promiseWithError:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(a1, "ams_iTunesAccountsForMediaType:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __81__ACAccountStore_AppleMediaServices__ams_iTunesAccountWithUsername_forMediaType___block_invoke;
    v11[3] = &unk_1E253D638;
    v12 = v6;
    objc_msgSend(v8, "thenWithBlock:", v11);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v9;
}

- (id)ams_iTunesAccountsForMediaTypes:()AppleMediaServices
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[5];
  _QWORD v12[5];

  v4 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __70__ACAccountStore_AppleMediaServices__ams_iTunesAccountsForMediaTypes___block_invoke;
  v12[3] = &unk_1E253D728;
  v12[4] = a1;
  objc_msgSend(a3, "ams_mapWithTransform:", v12);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v4;
  v11[1] = 3221225472;
  v11[2] = __70__ACAccountStore_AppleMediaServices__ams_iTunesAccountsForMediaTypes___block_invoke_2;
  v11[3] = &unk_1E253D750;
  v11[4] = a1;
  objc_msgSend(v5, "ams_mapWithTransform:", v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allObjects");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSPromise promiseWithAll:](AMSPromise, "promiseWithAll:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "thenWithBlock:", &__block_literal_global_68);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (uint64_t)ams_saveAccount:()AppleMediaServices
{
  return objc_msgSend(a1, "ams_saveAccount:verifyCredentials:", a3, 0);
}

- (uint64_t)ams_saveAccount:()AppleMediaServices verifyCredentials:
{
  uint64_t v4;

  if (a4)
    v4 = 2;
  else
    v4 = 0;
  return objc_msgSend(a1, "ams_saveAccount:withOptions:", a3, v4);
}

- (uint64_t)ams_saveVerifiedAccount:()AppleMediaServices error:
{
  return objc_msgSend(a1, "ams_saveVerifiedAccount:withOptions:error:", a3, 0, a4);
}

- (AMSBinaryPromise)ams_setiTunesAccount:()AppleMediaServices forHomeWithIdentifier:
{
  id v6;
  id v7;
  AMSBinaryPromise *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  id location;

  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(AMSBinaryPromise);
  +[AMSMultiUserService proxyObjectAsync](AMSMultiUserService, "proxyObjectAsync");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSBinaryPromise completionHandlerAdapter](v8, "completionHandlerAdapter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setiTunesAccount:forHomeWithIdentifier:completion:", v6, v7, v10);

  objc_initWeak(&location, a1);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __81__ACAccountStore_AppleMediaServices__ams_setiTunesAccount_forHomeWithIdentifier___block_invoke;
  v14[3] = &unk_1E253D7B8;
  objc_copyWeak(&v17, &location);
  v11 = v6;
  v15 = v11;
  v12 = v7;
  v16 = v12;
  -[AMSBinaryPromise addErrorBlock:](v8, "addErrorBlock:", v14);

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);

  return v8;
}

- (id)ams_addCookiesForResponse:()AppleMediaServices account:
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7
      || (objc_msgSend(a1, "_addUserCookiesForResponse:account:", v6, v7),
          v9 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v8, "addObject:", v9),
          v9,
          (objc_msgSend(v7, "ams_isEphemeralAccount") & 1) == 0))
    {
      objc_msgSend(a1, "_addGlobalCookiesForResponse:", v6);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addObject:", v10);

    }
    +[AMSBinaryPromise promiseWithAll:](AMSBinaryPromise, "promiseWithAll:", v8);
    v11 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    AMSError(2, CFSTR("Expected non-nil response"), 0, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[AMSBinaryPromise promiseWithError:](AMSBinaryPromise, "promiseWithError:", v8);
    v11 = objc_claimAutoreleasedReturnValue();
  }
  v12 = (void *)v11;

  return v12;
}

- (id)ams_addCookiesForResult:()AppleMediaServices account:
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;

  v6 = a4;
  objc_msgSend(a3, "response");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    goto LABEL_5;
  }
  v8 = v7;

  if (!v8)
  {
LABEL_5:
    AMSError(2, CFSTR("Invalid Parameter"), CFSTR("The AMSURLResult didn't contain a NSHTTPURLResponse."), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[AMSBinaryPromise promiseWithError:](AMSBinaryPromise, "promiseWithError:", v10);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = 0;
    goto LABEL_6;
  }
  objc_msgSend(a1, "ams_addCookiesForResponse:account:", v8, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_6:

  return v9;
}

- (id)_addGlobalCookiesForResponse:()AppleMediaServices
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  if (v4)
  {
    objc_msgSend(a1, "ams_mediaType");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "ams_localiTunesAccountForAccountMediaType:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __67__ACAccountStore_AppleMediaServices___addGlobalCookiesForResponse___block_invoke;
    v10[3] = &unk_1E253D550;
    v11 = v4;
    objc_msgSend(v6, "continueWithBlock:", v10);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "binaryPromiseAdapter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    AMSError(2, CFSTR("Expected response to be non-nil"), 0, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[AMSBinaryPromise promiseWithError:](AMSBinaryPromise, "promiseWithError:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

- (id)_addUserCookiesForResponse:()AppleMediaServices account:
{
  void *v4;
  void *v5;

  if (a3 && a4)
  {
    objc_msgSend(a4, "ams_asynchronouslyAddCookiesForResponse:");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    AMSError(2, CFSTR("Expected response and account to be non-nil"), 0, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[AMSBinaryPromise promiseWithError:](AMSBinaryPromise, "promiseWithError:", v5);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

- (id)_createLocaliTunesAccountForAccountType:()AppleMediaServices
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_msgSend(a1, "_newLocalAccountWithAccountType:");
  objc_msgSend(a1, "ams_saveAccount:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "catchWithBlock:", &__block_literal_global_86);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (uint64_t)_createLocaliTunesAccountForAccountType:()AppleMediaServices error:
{
  void *v6;
  char v7;
  id v8;
  void *v9;
  uint64_t v10;
  id v12;

  v6 = (void *)objc_msgSend(a1, "_newLocalAccountWithAccountType:");
  v12 = 0;
  v7 = objc_msgSend(a1, "ams_saveVerifiedAccount:withOptions:error:", v6, 0, &v12);
  v8 = v12;
  v9 = v8;
  if ((v7 & 1) != 0 || (objc_msgSend(v8, "ams_hasDomain:code:", *MEMORY[0x1E0C8F1D0], 5) & 1) != 0)
  {
    v10 = 1;
  }
  else
  {
    v10 = 0;
    if (a4)
      *a4 = objc_retainAutorelease(v9);
  }

  return v10;
}

- (void)_newLocalAccountWithAccountType:()AppleMediaServices
{
  objc_class *v3;
  id v4;
  void *v5;

  v3 = (objc_class *)MEMORY[0x1E0C8F298];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithAccountType:", v4);

  objc_msgSend(v5, "setActive:", 0);
  objc_msgSend(v5, "setUsername:", CFSTR("local"));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], 0x1E2549AA0);
  return v5;
}

- (id)_fetchLocalAccountForAccountType:()AppleMediaServices error:
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v12;

  v12 = 0;
  AMSAccountsWithAccountType(a1, a3, 1, &v12);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v12;
  v7 = v6;
  if (v5)
  {
    objc_msgSend(v5, "ams_firstObjectPassingTest:", &__block_literal_global_93);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      v10 = v8;
    }
    else if (a4)
    {
      AMSError(7, CFSTR("Local Account Not Found"), CFSTR("The local account doesn't exist."), 0);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    v9 = 0;
    if (a4)
      *a4 = objc_retainAutorelease(v6);
  }

  return v9;
}

- (AMSMutablePromise)_iTunesAccountsForAccountType:()AppleMediaServices
{
  return AMSiTunesAccountsForAccountType(a1, a3);
}

- (AMSMutableBinaryPromise)_saveAccount:()AppleMediaServices verifyCredentials:
{
  return AMSSaveAccount(a1, a3, a4);
}

- (uint64_t)_saveVerifiedAccount:()AppleMediaServices error:
{
  return AMSSaveVerifiedAccount(a1, a3, a4);
}

- (uint64_t)ams_iTunesAccountForHomeWithIdentifier:()AppleMediaServices
{
  return objc_msgSend(a1, "ams_iTunesAccountForHomeWithIdentifier:error:", a3, 0);
}

- (id)ams_iTunesAccountForHomeWithIdentifier:()AppleMediaServices error:
{
  void *v5;
  void *v6;

  objc_msgSend(a1, "ams_mediaAccountForHomeWithIdentifier:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "resultWithError:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (uint64_t)ams_iTunesAccountsWithHomeUserIdentifiers
{
  return MEMORY[0x1E0C9AA60];
}

- (id)ams_iTunesAccountWithHomeUserID:()AppleMediaServices
{
  objc_class *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = (objc_class *)MEMORY[0x1E0CB3A28];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithUUIDString:", v5);

  objc_msgSend(a1, "ams_iTunesAccountWithHomeUserIdentifier:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (uint64_t)ams_iTunesAccountWithHomeUserIdentifier:()AppleMediaServices
{
  return 0;
}

- (id)ams_iTunesSandboxAccounts
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C8F2B8], "ams_sharedAccountStoreForMediaType:", AMSAccountMediaTypeAppStoreSandbox);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "ams_iTunesAccounts");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

- (uint64_t)ams_addCookiesForResult:()AppleMediaServices account:error:
{
  void *v6;
  uint64_t v7;

  objc_msgSend(a1, "ams_addCookiesForResult:account:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "resultWithError:", a5);

  return v7;
}

- (uint64_t)ams_addCookiesForResponse:()AppleMediaServices request:account:error:
{
  void *v7;
  uint64_t v8;

  objc_msgSend(a1, "ams_addCookiesForResponse:account:", a3, a5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "resultWithError:", a6);

  return v8;
}

@end
