@implementation AMSNotificationSettingsTask

- (AMSNotificationSettingsTask)initWithIdentifier:(id)a3 account:(id)a4 bag:(id)a5
{
  id v9;
  id v10;
  id v11;
  AMSNotificationSettingsTask *v12;
  AMSNotificationSettingsTask *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)AMSNotificationSettingsTask;
  v12 = -[AMSTask init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_account, a4);
    objc_storeStrong((id *)&v13->_bag, a5);
    objc_storeStrong((id *)&v13->_identifier, a3);
  }

  return v13;
}

- (id)fetchAllSettings
{
  void *v3;
  _QWORD v5[5];
  id v6;
  id location;

  objc_initWeak(&location, self);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __47__AMSNotificationSettingsTask_fetchAllSettings__block_invoke;
  v5[3] = &unk_1E2544358;
  objc_copyWeak(&v6, &location);
  v5[4] = self;
  -[AMSTask performTaskWithBlock:](self, "performTaskWithBlock:", v5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
  return v3;
}

AMSNotificationSettingsResult *__47__AMSNotificationSettingsTask_fetchAllSettings__block_invoke(uint64_t a1, _QWORD *a2)
{
  id *v4;
  id WeakRetained;
  void *v6;
  id v7;
  void *v8;
  int v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  NSObject *v13;
  const char *v14;
  uint64_t v15;
  AMSNotificationSettingsResult *v16;
  void *v17;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  AMSMediaRequestEncoder *v26;
  void *v27;
  void *v28;
  AMSMediaRequestEncoder *v29;
  id v30;
  void *v31;
  id v32;
  void *v33;
  AMSMediaResponseDecoder *v34;
  void *v35;
  id v36;
  void *v37;
  AMSMutableLazyPromise *v38;
  AMSMutableLazyPromise *v39;
  void *v40;
  id v41;
  AMSNotificationSettingsResult *v42;
  void *v43;
  void *v44;
  NSObject *v45;
  void *v46;
  AMSMediaResponseDecoder *v47;
  id v48;
  void *v49;
  void *v50;
  NSObject *v51;
  void *v52;
  id v53;
  NSObject *v55;
  AMSMediaResponseDecoder *v56;
  void *v57;
  void *v58;
  _QWORD *v59;
  uint64_t v60;
  uint64_t v61;
  id v62;
  void *v63;
  id v64;
  _QWORD v65[4];
  id v66;
  id v67;
  id v68;
  uint8_t buf[4];
  uint64_t v70;
  __int16 v71;
  NSObject *v72;
  __int16 v73;
  id v74;
  __int16 v75;
  void *v76;
  uint64_t v77;

  v77 = *MEMORY[0x1E0C80C00];
  v4 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "account");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    AMSError(2, CFSTR("Invalid Parameter"), CFSTR("We cannot sync settings without an account."), 0);
    *a2 = (id)objc_claimAutoreleasedReturnValue();
    +[AMSLogConfig sharedAccountsConfig](AMSLogConfig, "sharedAccountsConfig");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v10 = (id)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v10, "OSLogObject");
    v11 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      goto LABEL_12;
    v15 = objc_opt_class();
    AMSLogKey();
    v13 = objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v70 = v15;
    v71 = 2114;
    v72 = v13;
    v14 = "%{public}@ [%{public}@] Unable to sync notification settings without an account.";
    goto LABEL_11;
  }
  v7 = objc_loadWeakRetained(v4);
  objc_msgSend(v7, "account");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "ams_isLocalAccount");

  if (v9)
  {
    AMSError(2, CFSTR("Invalid Parameter"), CFSTR("We cannot sync the local account's push notification settings."), 0);
    *a2 = (id)objc_claimAutoreleasedReturnValue();
    +[AMSLogConfig sharedAccountsConfig](AMSLogConfig, "sharedAccountsConfig");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v10 = (id)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v10, "OSLogObject");
    v11 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      goto LABEL_12;
    v12 = objc_opt_class();
    AMSLogKey();
    v13 = objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v70 = v12;
    v71 = 2114;
    v72 = v13;
    v14 = "%{public}@ [%{public}@] Unable to sync notification settings without a local account.";
LABEL_11:
    _os_log_impl(&dword_18C849000, v11, OS_LOG_TYPE_ERROR, v14, buf, 0x16u);

LABEL_12:
    v16 = 0;
    goto LABEL_34;
  }
  v59 = a2;
  AMSLogKey();
  v11 = objc_claimAutoreleasedReturnValue();
  +[AMSLogConfig sharedAccountsConfig](AMSLogConfig, "sharedAccountsConfig");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v17)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v17, "OSLogObject");
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    v60 = objc_opt_class();
    v62 = objc_loadWeakRetained(v4);
    objc_msgSend(v62, "account");
    v19 = v11;
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    AMSHashIfNeeded(v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_loadWeakRetained(v4);
    objc_msgSend(v22, "identifier");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    AMSHashIfNeeded(v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v70 = v60;
    v71 = 2114;
    v72 = v19;
    v73 = 2114;
    v74 = v21;
    v75 = 2114;
    v76 = v24;
    _os_log_impl(&dword_18C849000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Fetching Granular Push Notification Settings. account = %{public}@ | identifier = %{public}@", buf, 0x2Au);

    v11 = v19;
  }

  +[AMSMediaSharedProperties propertiesForNotificationSettingsTask:](AMSMediaSharedProperties, "propertiesForNotificationSettingsTask:", *(_QWORD *)(a1 + 32));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = [AMSMediaRequestEncoder alloc];
  objc_msgSend(v25, "tokenService");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "bag");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = -[AMSMediaRequestEncoder initWithTokenService:bag:](v26, "initWithTokenService:bag:", v27, v28);

  v30 = objc_loadWeakRetained(v4);
  objc_msgSend(v30, "account");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSMediaRequestEncoder setAccount:](v29, "setAccount:", v31);

  v32 = objc_loadWeakRetained(v4);
  objc_msgSend(v32, "clientInfo");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSMediaRequestEncoder setClientInfo:](v29, "setClientInfo:", v33);

  v34 = objc_alloc_init(AMSMediaResponseDecoder);
  -[AMSMediaRequestEncoder setResponseDecoder:](v29, "setResponseDecoder:", v34);
  objc_msgSend(*(id *)(a1 + 32), "_url");
  v61 = objc_claimAutoreleasedReturnValue();
  -[AMSMediaRequestEncoder requestWithURL:](v29, "requestWithURL:");
  v68 = 0;
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "resultWithTimeout:error:", &v68, 60.0);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = v68;
  v37 = v36;
  if (!v35 || v36)
  {
    v57 = v25;
    +[AMSLogConfig sharedUserNotificationConfig](AMSLogConfig, "sharedUserNotificationConfig");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v44)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v44, "OSLogObject");
    v45 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
    {
      v46 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      v70 = (uint64_t)v46;
      v71 = 2114;
      v72 = v11;
      v73 = 2114;
      v74 = v37;
      v47 = v34;
      v48 = v46;
      _os_log_impl(&dword_18C849000, v45, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Error generating media request: %{public}@", buf, 0x20u);

      v34 = v47;
    }

    v10 = objc_retainAutorelease(v37);
    v16 = 0;
    *v59 = v10;
    v25 = v57;
    v49 = (void *)v61;
  }
  else
  {
    v56 = v34;
    v38 = [AMSMutableLazyPromise alloc];
    v65[0] = MEMORY[0x1E0C809B0];
    v65[1] = 3221225472;
    v65[2] = __47__AMSNotificationSettingsTask_fetchAllSettings__block_invoke_15;
    v65[3] = &unk_1E2542CF8;
    v66 = v25;
    v67 = v35;
    v39 = -[AMSMutableLazyPromise initWithBlock:](v38, "initWithBlock:", v65);
    v64 = 0;
    -[AMSLazyPromise resultWithError:](v39, "resultWithError:", &v64);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = v64;
    v10 = v41;
    if (!v40 || v41)
    {
      v58 = v25;
      +[AMSLogConfig sharedUserNotificationConfig](AMSLogConfig, "sharedUserNotificationConfig", v11);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v50)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v50, "OSLogObject");
      v51 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
      {
        v52 = (void *)objc_opt_class();
        *(_DWORD *)buf = 138543874;
        v70 = (uint64_t)v52;
        v71 = 2114;
        v72 = v55;
        v73 = 2114;
        v74 = v10;
        v53 = v52;
        _os_log_impl(&dword_18C849000, v51, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Error getting result: %{public}@", buf, 0x20u);

      }
      v16 = 0;
      v25 = v58;
      *v59 = objc_retainAutorelease(v10);
      v11 = v55;
    }
    else
    {
      v42 = [AMSNotificationSettingsResult alloc];
      objc_msgSend(v40, "responseDictionary");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = -[AMSNotificationSettingsResult initWithDictionaryRepresentation:](v42, "initWithDictionaryRepresentation:", v43);

    }
    v34 = v56;
    v49 = (void *)v61;

  }
LABEL_34:

  return v16;
}

void __47__AMSNotificationSettingsTask_fetchAllSettings__block_invoke_15(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  id v6;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "session");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dataTaskPromiseWithRequest:", *(_QWORD *)(a1 + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "finishWithPromise:", v5);

}

- (id)updateSettings:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[5];
  id v9;
  id v10;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __46__AMSNotificationSettingsTask_updateSettings___block_invoke;
  v8[3] = &unk_1E2544380;
  objc_copyWeak(&v10, &location);
  v8[4] = self;
  v5 = v4;
  v9 = v5;
  -[AMSTask performBinaryTaskWithBlock:](self, "performBinaryTaskWithBlock:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

  return v6;
}

uint64_t __46__AMSNotificationSettingsTask_updateSettings___block_invoke(id *a1, _QWORD *a2)
{
  id *v4;
  id WeakRetained;
  void *v6;
  id v7;
  void *v8;
  int v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  NSObject *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  AMSURLRequestEncoder *v24;
  id v25;
  void *v26;
  AMSURLRequestEncoder *v27;
  id v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v51;
  void *v52;
  void *v53;
  id v54;
  void *v55;
  _QWORD *v56;
  _QWORD *v57;
  id v58;
  id v59;
  id v60;
  void *v61;
  uint8_t buf[4];
  uint64_t v63;
  __int16 v64;
  NSObject *v65;
  __int16 v66;
  void *v67;
  __int16 v68;
  void *v69;
  __int16 v70;
  void *v71;
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  v4 = a1 + 6;
  WeakRetained = objc_loadWeakRetained(a1 + 6);
  objc_msgSend(WeakRetained, "account");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    AMSError(2, CFSTR("Invalid Parameter"), CFSTR("We cannot sync settings without an account."), 0);
    *a2 = (id)objc_claimAutoreleasedReturnValue();
    +[AMSLogConfig sharedAccountsConfig](AMSLogConfig, "sharedAccountsConfig");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v10 = (id)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v10, "OSLogObject");
    v11 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      goto LABEL_12;
    v15 = objc_opt_class();
    AMSLogKey();
    v13 = objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v63 = v15;
    v64 = 2114;
    v65 = v13;
    v14 = "%{public}@ [%{public}@] Unable to sync notification settings without an account.";
    goto LABEL_11;
  }
  v7 = objc_loadWeakRetained(v4);
  objc_msgSend(v7, "account");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "ams_isLocalAccount");

  if (!v9)
  {
    AMSLogKey();
    v11 = objc_claimAutoreleasedReturnValue();
    +[AMSLogConfig sharedAccountsConfig](AMSLogConfig, "sharedAccountsConfig");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v17)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v17, "OSLogObject");
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v51 = objc_opt_class();
      v54 = objc_loadWeakRetained(v4);
      objc_msgSend(v54, "account");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      AMSHashIfNeeded(v52);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_loadWeakRetained(v4);
      objc_msgSend(v20, "identifier");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      AMSHashIfNeeded(v21);
      v56 = a2;
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      AMSHashIfNeeded(a1[5]);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544386;
      v63 = v51;
      v64 = 2114;
      v65 = v11;
      v66 = 2114;
      v67 = v19;
      v68 = 2114;
      v69 = v22;
      v70 = 2114;
      v71 = v23;
      _os_log_impl(&dword_18C849000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Updating Granular Push Notification Setting. account = %{public}@ | identifier = %{public}@ | items = %{public}@", buf, 0x34u);

      a2 = v56;
    }

    v24 = [AMSURLRequestEncoder alloc];
    v25 = objc_loadWeakRetained(v4);
    objc_msgSend(v25, "bag");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = -[AMSURLRequestEncoder initWithBag:](v24, "initWithBag:", v26);

    v28 = objc_loadWeakRetained(v4);
    objc_msgSend(v28, "account");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSURLRequestEncoder setAccount:](v27, "setAccount:", v29);

    -[AMSURLRequestEncoder setRequestEncoding:](v27, "setRequestEncoding:", 3);
    -[AMSURLRequestEncoder setLogUUID:](v27, "setLogUUID:", v11);
    v30 = objc_loadWeakRetained(v4);
    objc_msgSend(v30, "bag");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "URLForKey:", 0x1E254CF60);
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    v60 = 0;
    objc_msgSend(v32, "valueWithError:", &v60);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = v60;
    if (v34)
    {
      v10 = objc_retainAutorelease(v34);
      v16 = 0;
      *a2 = v10;
LABEL_24:

      goto LABEL_25;
    }
    v55 = v32;
    v57 = a2;
    objc_msgSend(MEMORY[0x1E0CB3998], "componentsWithURL:resolvingAgainstBaseURL:", v33, 1);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "queryItems");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = (void *)MEMORY[0x1E0CB39D8];
    v37 = objc_loadWeakRetained(v4);
    objc_msgSend(v37, "identifier");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "queryItemWithName:value:", CFSTR("serviceId"), v38);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = v39;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v61, 1);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "arrayByAddingObjectsFromArray:", v40);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setQueryItems:", v41);

    objc_msgSend(v35, "URL");
    v42 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1[4], "_generateParametersForItems:", a1[5]);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSURLRequestEncoder requestWithMethod:URL:parameters:](v27, "requestWithMethod:URL:parameters:", 4, v42, v43);
    v44 = (void *)objc_claimAutoreleasedReturnValue();

    v59 = 0;
    objc_msgSend(v44, "resultWithError:", &v59);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = v59;
    if (v46)
    {
      v10 = v46;
      v47 = 0;
    }
    else
    {
      +[AMSURLSession defaultSession](AMSURLSession, "defaultSession");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "dataTaskPromiseWithRequest:", v45);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v58 = 0;
      objc_msgSend(v49, "resultWithError:", &v58);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v58;

      if (!v10)
      {
        v16 = 1;
        v32 = v55;
        goto LABEL_23;
      }
    }
    v32 = v55;
    v10 = objc_retainAutorelease(v10);
    v16 = 0;
    *v57 = v10;
LABEL_23:

    v33 = (void *)v42;
    goto LABEL_24;
  }
  AMSError(2, CFSTR("Invalid Parameter"), CFSTR("We cannot sync the local account's push notification settings."), 0);
  *a2 = (id)objc_claimAutoreleasedReturnValue();
  +[AMSLogConfig sharedAccountsConfig](AMSLogConfig, "sharedAccountsConfig");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v10, "OSLogObject");
  v11 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    goto LABEL_12;
  v12 = objc_opt_class();
  AMSLogKey();
  v13 = objc_claimAutoreleasedReturnValue();
  *(_DWORD *)buf = 138543618;
  v63 = v12;
  v64 = 2114;
  v65 = v13;
  v14 = "%{public}@ [%{public}@] Unable to sync notification settings without a local account.";
LABEL_11:
  _os_log_impl(&dword_18C849000, v11, OS_LOG_TYPE_ERROR, v14, buf, 0x16u);

LABEL_12:
  v16 = 0;
LABEL_25:

  return v16;
}

- (id)_url
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v3 = (void *)objc_opt_new();
  -[AMSNotificationSettingsTask identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("service"));

  -[AMSNotificationSettingsTask bag](self, "bag");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSNotificationSettingsTask _stringForKey:fromBag:](self, "_stringForKey:fromBag:", 0x1E254CF40, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[AMSNotificationSettingsTask bag](self, "bag");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSNotificationSettingsTask _countryCodeFromBag:](self, "_countryCodeFromBag:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = 0;
  if (v6 && v8)
  {
    objc_msgSend(v6, "stringByReplacingOccurrencesOfString:withString:", CFSTR("{cc}"), v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_opt_new();
    -[AMSNotificationSettingsTask bag](self, "bag");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSNotificationSettingsTask _stringForKey:fromBag:](self, "_stringForKey:fromBag:", 0x1E254CF00, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setHost:", v13);

    objc_msgSend(v11, "setPath:", v10);
    v14 = (void *)MEMORY[0x1E0C99DE8];
    v15 = (void *)MEMORY[0x1E0CB39D8];
    v16 = (void *)objc_msgSend(v3, "copy");
    objc_msgSend(v15, "queryItemsFromDictionary:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "arrayWithArray:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setQueryItems:", v18);

    objc_msgSend(v11, "setScheme:", CFSTR("https"));
    objc_msgSend(v11, "URL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v9;
}

- (id)_countryCodeFromBag:(id)a3
{
  return -[AMSNotificationSettingsTask _stringForKey:fromBag:](self, "_stringForKey:fromBag:", 0x1E254C520, a3);
}

- (id)_stringForKey:(id)a3 fromBag:(id)a4
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v13;
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a4, "stringForKey:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  objc_msgSend(v4, "valueWithError:", &v13);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v13;

  if (v6)
  {
    +[AMSLogConfig sharedUserNotificationConfig](AMSLogConfig, "sharedUserNotificationConfig");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v7, "OSLogObject");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = objc_opt_class();
      AMSLogKey();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      AMSLogableError(v6);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v15 = v9;
      v16 = 2114;
      v17 = v10;
      v18 = 2114;
      v19 = v11;
      _os_log_impl(&dword_18C849000, v8, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] %{public}@", buf, 0x20u);

    }
  }

  return v5;
}

- (id)_generateParametersForItems:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v9), "dictionaryRepresentation", (_QWORD)v13);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", v4, CFSTR("settings"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (NSString)bagSubProfile
{
  if (_MergedGlobals_1_13 != -1)
    dispatch_once(&_MergedGlobals_1_13, &__block_literal_global_102);
  return (NSString *)(id)qword_1ECEACBB8;
}

void __44__AMSNotificationSettingsTask_bagSubProfile__block_invoke()
{
  void *v0;

  v0 = (void *)qword_1ECEACBB8;
  qword_1ECEACBB8 = (uint64_t)CFSTR("GranularNotificationSettings");

}

+ (NSString)bagSubProfileVersion
{
  if (qword_1ECEACBC0 != -1)
    dispatch_once(&qword_1ECEACBC0, &__block_literal_global_35_2);
  return (NSString *)(id)qword_1ECEACBC8;
}

void __51__AMSNotificationSettingsTask_bagSubProfileVersion__block_invoke()
{
  void *v0;

  v0 = (void *)qword_1ECEACBC8;
  qword_1ECEACBC8 = (uint64_t)CFSTR("1");

}

+ (AMSBagKeySet)bagKeySet
{
  return objc_alloc_init(AMSBagKeySet);
}

- (ACAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
  objc_storeStrong((id *)&self->_account, a3);
}

- (AMSBagProtocol)bag
{
  return self->_bag;
}

- (void)setBag:(id)a3
{
  objc_storeStrong((id *)&self->_bag, a3);
}

- (AMSProcessInfo)clientInfo
{
  return self->_clientInfo;
}

- (void)setClientInfo:(id)a3
{
  objc_storeStrong((id *)&self->_clientInfo, a3);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_clientInfo, 0);
  objc_storeStrong((id *)&self->_bag, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end
