@implementation ACAccountStore(AppleMediaServices_Project)

- (id)_ams_accountsWithAccountTypeIdentifier:()AppleMediaServices_Project options:error:
{
  return AMSAccountsWithAccountTypeIdentifier(a1, a3, a4, a5);
}

+ (uint64_t)_ams_defaultAccountStore
{
  return objc_msgSend(MEMORY[0x1E0C8F2B8], "defaultStore");
}

- (id)_ams_localiTunesAccountForAccountMediaType:()AppleMediaServices_Project updateStorefront:
{
  void *v6;
  void *v7;
  _QWORD v9[5];
  char v10;

  objc_msgSend(a1, "_accountTypeForMediaType:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __106__ACAccountStore_AppleMediaServices_Project___ams_localiTunesAccountForAccountMediaType_updateStorefront___block_invoke;
  v9[3] = &unk_1E253D870;
  v9[4] = a1;
  v10 = a4;
  objc_msgSend(v6, "thenWithBlock:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (AMSMutablePromise)_ams_fetchAccountTypeWithAccountTypeIdenfitier:()AppleMediaServices_Project
{
  return AMSFetchAccountTypeWithAccountTypeIdenfitier(a1, a3);
}

- (id)_ams_localiTunesAccountForAccountType:()AppleMediaServices_Project shouldUpdateStorefront:
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v11[5];
  id v12;
  char v13;

  v6 = a3;
  objc_msgSend(a1, "_fetchLocaliTunesAccountForAccountType:shouldUpdateStorefront:", v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __107__ACAccountStore_AppleMediaServices_Project___ams_localiTunesAccountForAccountType_shouldUpdateStorefront___block_invoke;
  v11[3] = &unk_1E253D928;
  v11[4] = a1;
  v12 = v6;
  v13 = a4;
  v8 = v6;
  objc_msgSend(v7, "catchWithBlock:", v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)ams_sharedAccountStoreForProcessInfo:()AppleMediaServices_Project
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "accountMediaType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "ams_sharedAccountStoreForMediaType:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_ams_localiTunesAccount
{
  void *v1;
  void *v2;
  void *v3;
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v1 = a1;
  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "ams_mediaType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  objc_msgSend(v1, "ams_localiTunesAccountForAccountMediaType:error:", v2, &v14);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v14;

  if (!v3)
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
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      AMSLogKey();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)MEMORY[0x1E0CB3940];
      v9 = objc_opt_class();
      v10 = v9;
      if (v7)
      {
        AMSLogKey();
        v1 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "stringWithFormat:", CFSTR("%@: [%@] "), v10, v1);
      }
      else
      {
        objc_msgSend(v8, "stringWithFormat:", CFSTR("%@: "), v9);
      }
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      AMSLogableError(v4);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v16 = v11;
      v17 = 2114;
      v18 = v12;
      _os_log_impl(&dword_18C849000, v6, OS_LOG_TYPE_ERROR, "%{public}@Failed to create/fetch the local account. error = %{public}@", buf, 0x16u);
      if (v7)
      {

        v11 = v1;
      }

    }
  }

  return v3;
}

- (id)ams_localiTunesAccountForAccountMediaType:()AppleMediaServices_Project error:
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = a3;
  objc_msgSend((id)objc_opt_class(), "ams_accountTypeIdentifierForMediaType:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  AMSAccountTypeWithAccountTypeIdentifier(a1, v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "ams_localiTunesAccountForAccountType:error:", v8, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)ams_demoAccount
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "ams_iTunesAccounts");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "ams_firstObjectPassingTest:", &__block_literal_global_193);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)ams_regulatoryAccount
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "ams_iTunesAccounts");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "ams_firstObjectPassingTest:", &__block_literal_global_194);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (BOOL)ams_isAccountNew:()AppleMediaServices_Project
{
  void *v4;
  void *v5;
  _BOOL8 v6;

  objc_msgSend(a3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_ams_accountWithIdentifier:error:", v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5 == 0;

  return v6;
}

- (AMSMutableBinaryPromise)ams_saveAccount:()AppleMediaServices_Project withOptions:
{
  id v6;
  AMSMutableBinaryPromise *v7;
  void *v8;

  v6 = a3;
  v7 = objc_alloc_init(AMSMutableBinaryPromise);
  -[AMSBinaryPromise completionHandlerAdapter](v7, "completionHandlerAdapter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_ams_saveAccount:withOptions:sync:completion:", v6, a4, 0, v8);

  return v7;
}

- (BOOL)ams_saveVerifiedAccount:()AppleMediaServices_Project withOptions:error:
{
  id v8;
  int v9;
  _BOOL8 v10;
  _QWORD v12[6];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  char v22;

  v8 = a3;
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__3;
  v17 = __Block_byref_object_dispose__3;
  v18 = 0;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __88__ACAccountStore_AppleMediaServices_Project__ams_saveVerifiedAccount_withOptions_error___block_invoke;
  v12[3] = &unk_1E253D8D8;
  v12[4] = &v19;
  v12[5] = &v13;
  objc_msgSend(a1, "_ams_saveAccount:withOptions:sync:completion:", v8, a4, 1, v12);
  v9 = *((unsigned __int8 *)v20 + 24);
  if (a5 && !*((_BYTE *)v20 + 24))
  {
    *a5 = objc_retainAutorelease((id)v14[5]);
    v9 = *((unsigned __int8 *)v20 + 24);
  }
  v10 = v9 != 0;
  _Block_object_dispose(&v13, 8);

  _Block_object_dispose(&v19, 8);
  return v10;
}

- (id)ams_localiTunesAccountForAccountType:()AppleMediaServices_Project error:
{
  id v6;
  void *v7;
  id v8;
  id v9;
  int v10;
  id v11;
  void *v12;
  id v13;
  id v15;
  id v16;
  id v17;

  v6 = a3;
  v17 = 0;
  objc_msgSend(a1, "_fetchLocalAccountForAccountType:error:", v6, &v17);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v17;
  v9 = v8;
  if (!v7)
  {
    if ((objc_msgSend(v8, "ams_hasDomain:code:", CFSTR("AMSErrorDomain"), 7) & 1) != 0)
    {
      v16 = 0;
      v10 = objc_msgSend(a1, "_createLocaliTunesAccountForAccountType:error:", v6, &v16);
      v11 = v16;
      v12 = v11;
      if (v10)
      {
        v15 = v9;
        objc_msgSend(a1, "_fetchLocalAccountForAccountType:error:", v6, &v15);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v15;

        if (v7)
        {
LABEL_5:
          v9 = v13;
LABEL_15:

          goto LABEL_16;
        }
        if (!a4)
        {
          v7 = 0;
          goto LABEL_5;
        }
        v9 = v13;
      }
      else
      {
        if (!a4)
        {
          v7 = 0;
          goto LABEL_15;
        }
        v13 = v11;
      }
      v7 = 0;
      *a4 = objc_retainAutorelease(v13);
      goto LABEL_15;
    }
    if (a4)
    {
      v9 = objc_retainAutorelease(v9);
      v7 = 0;
      *a4 = v9;
    }
    else
    {
      v7 = 0;
    }
  }
LABEL_16:

  return v7;
}

- (void)_ams_saveAccount:()AppleMediaServices_Project withOptions:sync:completion:
{
  id v10;
  void (**v11)(id, _QWORD, void *);
  __CFString *v12;
  __CFString *v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  NSObject *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  NSObject *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  NSObject *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  id v38;
  void *v39;
  NSObject *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  id v44;
  uint8_t buf[4];
  uint64_t v46;
  __int16 v47;
  void *v48;
  __int16 v49;
  unint64_t v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a6;
  if ((a4 & 2) != 0 && a5)
  {
    v12 = CFSTR("Failed to save account");
    v13 = CFSTR("Cannot synchronously save an account with verification");
LABEL_24:
    v26 = 2;
LABEL_25:
    AMSError(v26, v12, v13, 0);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v11[2](v11, 0, v32);
    goto LABEL_26;
  }
  if (!v10)
  {
    +[AMSLogConfig sharedAccountsConfig](AMSLogConfig, "sharedAccountsConfig");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v27)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v27, "OSLogObject");
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      v29 = objc_opt_class();
      AMSLogKey();
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      AMSHashIfNeeded(0);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v46 = v29;
      v47 = 2114;
      v48 = v30;
      v49 = 2114;
      v50 = (unint64_t)v31;
      _os_log_impl(&dword_18C849000, v28, OS_LOG_TYPE_ERROR, "%{public}@ [%{public}@] Someone is attempting to save a nil account. account = %{public}@", buf, 0x20u);

    }
    v12 = CFSTR("Saving Nil Account");
    v13 = CFSTR("You cannot save a nil account.");
    goto LABEL_24;
  }
  if (objc_msgSend(v10, "ams_isEphemeralAccount"))
  {
    +[AMSLogConfig sharedAccountsConfig](AMSLogConfig, "sharedAccountsConfig");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v14)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v14, "OSLogObject");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v16 = objc_opt_class();
      AMSLogKey();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      AMSHashIfNeeded(v10);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v46 = v16;
      v47 = 2114;
      v48 = v17;
      v49 = 2114;
      v50 = (unint64_t)v18;
      _os_log_impl(&dword_18C849000, v15, OS_LOG_TYPE_ERROR, "%{public}@ [%{public}@] Someone is attempting to save an ephemeral account. account = %{public}@", buf, 0x20u);

    }
    AMSError(2, CFSTR("Saving Ephemeral Account"), CFSTR("You cannot save an ephemeral account."), 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v11[2](v11, 0, v19);

  }
  if (objc_msgSend(a1, "ams_isAccountNew:", v10))
  {
    v20 = objc_msgSend(v10, "ams_isLocalAccount");
    if ((a4 & 1) == 0 && (v20 & 1) == 0)
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
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        v23 = objc_opt_class();
        AMSLogKey();
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        AMSHashIfNeeded(v10);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v46 = v23;
        v47 = 2114;
        v48 = v24;
        v49 = 2114;
        v50 = (unint64_t)v25;
        _os_log_impl(&dword_18C849000, v22, OS_LOG_TYPE_ERROR, "%{public}@ [%{public}@] Someone is attempting to save a new account instead of using AMSAuthenticateTask. account = %{public}@", buf, 0x20u);

      }
      v12 = CFSTR("Saving New Account");
      v13 = CFSTR("Use AMSAuthenticateTask to add a new account to the system.");
      v26 = 105;
      goto LABEL_25;
    }
    if ((v20 & 1) == 0)
    {
      +[AMSLogConfig sharedAccountsConfig](AMSLogConfig, "sharedAccountsConfig");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v33)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v33, "OSLogObject");
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        v35 = objc_opt_class();
        AMSLogKey();
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v46 = v35;
        v47 = 2114;
        v48 = v36;
        v49 = 2048;
        v50 = a4;
        _os_log_impl(&dword_18C849000, v34, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Saving a new account. options = %ld", buf, 0x20u);

      }
    }
  }
  if ((objc_msgSend(v10, "isDirty") & 1) == 0)
  {
    +[AMSLogConfig sharedAccountsConfig](AMSLogConfig, "sharedAccountsConfig");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v39)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v39, "OSLogObject");
    v40 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
    {
      v41 = objc_opt_class();
      AMSLogKey();
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      AMSHashIfNeeded(v10);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v46 = v41;
      v47 = 2114;
      v48 = v42;
      v49 = 2114;
      v50 = (unint64_t)v43;
      _os_log_impl(&dword_18C849000, v40, OS_LOG_TYPE_DEBUG, "%{public}@ [%{public}@] Someone attempted to save an unmodified account. account = %{public}@", buf, 0x20u);

    }
    v12 = CFSTR("Saving Unmodified Account");
    v13 = CFSTR("You attempted to save an unmodified account.");
    v26 = 102;
    goto LABEL_25;
  }
  if (a5)
  {
    v44 = 0;
    v37 = objc_msgSend(a1, "_saveVerifiedAccount:error:", v10, &v44);
    v38 = v44;
    v11[2](v11, v37, v38);

    goto LABEL_27;
  }
  objc_msgSend(a1, "_saveAccount:verifyCredentials:", v10, (a4 >> 1) & 1);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "addFinishBlock:", v11);
LABEL_26:

LABEL_27:
}

- (id)_ams_accountTypeWithAccountTypeIdentifier:()AppleMediaServices_Project error:
{
  return AMSAccountTypeWithAccountTypeIdentifier(a1, a3, a4);
}

- (id)_ams_accountsWithAccountType:()AppleMediaServices_Project options:error:
{
  return AMSAccountsWithAccountType(a1, a3, a4, a5);
}

- (id)_ams_accountWithIdentifier:()AppleMediaServices_Project error:
{
  return AMSAccountWithIdentifier(a1, a3, a4);
}

- (AMSMutablePromise)_ams_fetchAccountWithIdentifier:()AppleMediaServices_Project
{
  return AMSFetchAccountWithIdentifier(a1, a3);
}

- (AMSMutablePromise)_ams_fetchAccountsWithAccountType:()AppleMediaServices_Project options:
{
  return AMSFetchAccountsWithAccountType(a1, a3, a4);
}

- (id)_ams_fetchAccountsWithAccountTypeIdentifier:()AppleMediaServices_Project options:
{
  return AMSFetchAccountsWithAccountTypeIdentifier(a1, a3, a4);
}

+ (id)_ams_newAccountStore
{
  return objc_alloc_init(MEMORY[0x1E0C8F2B8]);
}

@end
