@implementation AMSUserNotificationSettingsTask

- (AMSUserNotificationSettingsTask)initWithIdentifier:(id)a3 clientIdentifier:(id)a4 account:(id)a5 bag:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  AMSUserNotificationSettingsTask *v15;
  AMSUserNotificationSettingsTask *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)AMSUserNotificationSettingsTask;
  v15 = -[AMSTask init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_account, a5);
    objc_storeStrong((id *)&v16->_bag, a6);
    objc_storeStrong((id *)&v16->_clientIdentifier, a4);
    objc_storeStrong((id *)&v16->_identifier, a3);
  }

  return v16;
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
  v5[2] = __51__AMSUserNotificationSettingsTask_fetchAllSettings__block_invoke;
  v5[3] = &unk_1E2544358;
  objc_copyWeak(&v6, &location);
  v5[4] = self;
  -[AMSTask performTaskWithBlock:](self, "performTaskWithBlock:", v5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
  return v3;
}

AMSUserNotificationSettingsResult *__51__AMSUserNotificationSettingsTask_fetchAllSettings__block_invoke(uint64_t a1, _QWORD *a2)
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
  AMSUserNotificationSettingsResult *v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  AMSMediaRequestEncoder *v27;
  void *v28;
  void *v29;
  AMSMediaRequestEncoder *v30;
  id v31;
  void *v32;
  id v33;
  void *v34;
  AMSMediaResponseDecoder *v35;
  uint64_t v36;
  void *v37;
  id v38;
  void *v39;
  AMSMutableLazyPromise *v40;
  AMSMutableLazyPromise *v41;
  void *v42;
  id v43;
  AMSUserNotificationSettingsResult *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  NSObject *v49;
  void *v50;
  id v51;
  void *v52;
  void *v53;
  NSObject *v54;
  void *v55;
  id v56;
  AMSMediaResponseDecoder *v58;
  _QWORD *v59;
  void *v60;
  id v61;
  void *v62;
  NSObject *v63;
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
  v17 = objc_claimAutoreleasedReturnValue();
  +[AMSLogConfig sharedAccountsConfig](AMSLogConfig, "sharedAccountsConfig");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v18)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v63 = v17;
  objc_msgSend(v18, "OSLogObject");
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    v20 = objc_opt_class();
    v61 = objc_loadWeakRetained(v4);
    objc_msgSend(v61, "account");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    AMSHashIfNeeded(v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_loadWeakRetained(v4);
    objc_msgSend(v23, "identifier");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    AMSHashIfNeeded(v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v70 = v20;
    v71 = 2114;
    v72 = v63;
    v73 = 2114;
    v74 = v22;
    v75 = 2114;
    v76 = v25;
    _os_log_impl(&dword_18C849000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Fetching Granular Push Notification Settings. account = %{public}@ | identifier = %{public}@", buf, 0x2Au);

  }
  +[AMSMediaSharedProperties propertiesForUserNotificationSettingsTask:](AMSMediaSharedProperties, "propertiesForUserNotificationSettingsTask:", *(_QWORD *)(a1 + 32));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = [AMSMediaRequestEncoder alloc];
  objc_msgSend(v26, "tokenService");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "bag");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = -[AMSMediaRequestEncoder initWithTokenService:bag:](v27, "initWithTokenService:bag:", v28, v29);

  v31 = objc_loadWeakRetained(v4);
  objc_msgSend(v31, "account");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSMediaRequestEncoder setAccount:](v30, "setAccount:", v32);

  v33 = objc_loadWeakRetained(v4);
  objc_msgSend(v33, "clientInfo");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSMediaRequestEncoder setClientInfo:](v30, "setClientInfo:", v34);

  v35 = objc_alloc_init(AMSMediaResponseDecoder);
  -[AMSMediaRequestEncoder setResponseDecoder:](v30, "setResponseDecoder:", v35);
  objc_msgSend(*(id *)(a1 + 32), "_url");
  v36 = objc_claimAutoreleasedReturnValue();
  -[AMSMediaRequestEncoder requestWithURL:](v30, "requestWithURL:", v36);
  v68 = 0;
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "resultWithTimeout:error:", &v68, 60.0);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = v68;
  v39 = v38;
  v62 = (void *)v36;
  if (!v37 || v38)
  {
    v47 = v26;
    +[AMSLogConfig sharedUserNotificationConfig](AMSLogConfig, "sharedUserNotificationConfig");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v48)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v48, "OSLogObject");
    v49 = objc_claimAutoreleasedReturnValue();
    v11 = v63;
    if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
    {
      v50 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      v70 = (uint64_t)v50;
      v71 = 2114;
      v72 = v63;
      v73 = 2114;
      v74 = v39;
      v51 = v50;
      _os_log_impl(&dword_18C849000, v49, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Error generating media request: %{public}@", buf, 0x20u);

      v11 = v63;
    }

    v10 = objc_retainAutorelease(v39);
    v16 = 0;
    *v59 = v10;
    v26 = v47;
  }
  else
  {
    v58 = v35;
    v40 = [AMSMutableLazyPromise alloc];
    v65[0] = MEMORY[0x1E0C809B0];
    v65[1] = 3221225472;
    v65[2] = __51__AMSUserNotificationSettingsTask_fetchAllSettings__block_invoke_25;
    v65[3] = &unk_1E2542CF8;
    v66 = v26;
    v67 = v37;
    v41 = -[AMSMutableLazyPromise initWithBlock:](v40, "initWithBlock:", v65);
    v64 = 0;
    -[AMSLazyPromise resultWithError:](v41, "resultWithError:", &v64);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = v64;
    v10 = v43;
    if (!v42 || v43)
    {
      v52 = v26;
      +[AMSLogConfig sharedUserNotificationConfig](AMSLogConfig, "sharedUserNotificationConfig");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v53)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v53, "OSLogObject");
      v54 = objc_claimAutoreleasedReturnValue();
      v11 = v63;
      if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
      {
        v55 = (void *)objc_opt_class();
        *(_DWORD *)buf = 138543874;
        v70 = (uint64_t)v55;
        v71 = 2114;
        v72 = v63;
        v73 = 2114;
        v74 = v10;
        v56 = v55;
        _os_log_impl(&dword_18C849000, v54, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Error getting result: %{public}@", buf, 0x20u);

        v11 = v63;
      }

      v16 = 0;
      *v59 = objc_retainAutorelease(v10);
      v26 = v52;
    }
    else
    {
      v44 = [AMSUserNotificationSettingsResult alloc];
      objc_msgSend(*(id *)(a1 + 32), "identifier");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "responseDictionary");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = -[AMSUserNotificationSettingsResult initWithServiceIdentifier:dictionaryRepresentation:](v44, "initWithServiceIdentifier:dictionaryRepresentation:", v45, v46);

      v11 = v63;
    }

    v35 = v58;
  }

LABEL_34:
  return v16;
}

void __51__AMSUserNotificationSettingsTask_fetchAllSettings__block_invoke_25(uint64_t a1, void *a2)
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
  v8[2] = __50__AMSUserNotificationSettingsTask_updateSettings___block_invoke;
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

uint64_t __50__AMSUserNotificationSettingsTask_updateSettings___block_invoke(id *a1, _QWORD *a2)
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
  NSObject *v22;
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
  void *v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  NSObject *v39;
  AMSMutableLazyPromise *v40;
  AMSMutableLazyPromise *v41;
  void *v42;
  id v43;
  BOOL v44;
  void *v45;
  NSObject *v46;
  void *v47;
  NSObject *v48;
  id v49;
  void *v50;
  void *v51;
  NSObject *v52;
  void *v53;
  id v54;
  void *v55;
  NSObject *v56;
  void *v57;
  id v58;
  AMSMutableLazyPromise *v60;
  void *v61;
  void *v62;
  uint64_t v63;
  void *v64;
  void *v65;
  void *v66;
  id v67;
  void *v68;
  _QWORD *v69;
  id v70;
  _QWORD v71[4];
  id v72;
  id v73;
  id v74;
  uint8_t buf[4];
  uint64_t v76;
  __int16 v77;
  NSObject *v78;
  __int16 v79;
  id v80;
  __int16 v81;
  void *v82;
  __int16 v83;
  void *v84;
  uint64_t v85;

  v85 = *MEMORY[0x1E0C80C00];
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
    v76 = v15;
    v77 = 2114;
    v78 = v13;
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
    v76 = v12;
    v77 = 2114;
    v78 = v13;
    v14 = "%{public}@ [%{public}@] Unable to sync notification settings without a local account.";
LABEL_11:
    _os_log_impl(&dword_18C849000, v11, OS_LOG_TYPE_ERROR, v14, buf, 0x16u);

LABEL_12:
    v16 = 0;
    goto LABEL_45;
  }
  v69 = a2;
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
    v63 = objc_opt_class();
    v67 = objc_loadWeakRetained(v4);
    objc_msgSend(v67, "account");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    AMSHashIfNeeded(v65);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_loadWeakRetained(v4);
    objc_msgSend(v20, "identifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    AMSHashIfNeeded(v21);
    v22 = v11;
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    AMSHashIfNeeded(a1[5]);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544386;
    v76 = v63;
    v77 = 2114;
    v78 = v22;
    v79 = 2114;
    v80 = v19;
    v81 = 2114;
    v82 = v23;
    v83 = 2114;
    v84 = v24;
    _os_log_impl(&dword_18C849000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Updating Granular Push Notification Setting. account = %{public}@ | identifier = %{public}@ | items = %{public}@", buf, 0x34u);

    v11 = v22;
  }

  +[AMSMediaSharedProperties propertiesForUserNotificationSettingsTask:](AMSMediaSharedProperties, "propertiesForUserNotificationSettingsTask:", a1[4]);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = [AMSMediaRequestEncoder alloc];
  objc_msgSend(v25, "tokenService");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[4], "bag");
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

  -[AMSMediaRequestEncoder setRequestEncoding:](v29, "setRequestEncoding:", 3);
  objc_msgSend(a1[4], "_url");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  if (v34)
  {
    v35 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C92C28]), "initWithURL:", v34);
    objc_msgSend(v35, "setHTTPMethod:", CFSTR("PATCH"));
    objc_msgSend(a1[4], "_generateParametersForItems:", a1[5]);
    v64 = v35;
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSMediaRequestEncoder requestByEncodingRequest:parameters:](v29, "requestByEncodingRequest:parameters:", v35);
    v74 = 0;
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "resultWithTimeout:error:", &v74, 60.0);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = v74;
    v38 = v37;
    if (!v36 || v37)
    {
      v62 = v25;
      +[AMSLogConfig sharedUserNotificationConfig](AMSLogConfig, "sharedUserNotificationConfig");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v55)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v55, "OSLogObject");
      v56 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
      {
        v57 = (void *)objc_opt_class();
        *(_DWORD *)buf = 138543874;
        v76 = (uint64_t)v57;
        v77 = 2114;
        v78 = v11;
        v79 = 2114;
        v80 = v38;
        v58 = v57;
        _os_log_impl(&dword_18C849000, v56, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Error generating media request: %{public}@", buf, 0x20u);

      }
      v10 = objc_retainAutorelease(v38);
      v16 = 0;
      *v69 = v10;
      v25 = v62;
    }
    else
    {
      v39 = v11;
      v40 = [AMSMutableLazyPromise alloc];
      v71[0] = MEMORY[0x1E0C809B0];
      v71[1] = 3221225472;
      v71[2] = __50__AMSUserNotificationSettingsTask_updateSettings___block_invoke_36;
      v71[3] = &unk_1E2542CF8;
      v72 = v25;
      v73 = v36;
      v41 = -[AMSMutableLazyPromise initWithBlock:](v40, "initWithBlock:", v71);
      v70 = 0;
      -[AMSLazyPromise resultWithError:](v41, "resultWithError:", &v70);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = v70;
      v10 = v43;
      if (v42)
        v44 = v43 == 0;
      else
        v44 = 0;
      v16 = v44;
      if (!v44)
      {
        v60 = v41;
        v61 = v25;
        +[AMSLogConfig sharedUserNotificationConfig](AMSLogConfig, "sharedUserNotificationConfig");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v45)
        {
          +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v45, "OSLogObject");
        v46 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
        {
          v47 = (void *)objc_opt_class();
          *(_DWORD *)buf = 138543874;
          v76 = (uint64_t)v47;
          v77 = 2114;
          v78 = v39;
          v79 = 2114;
          v80 = v10;
          v48 = v46;
          v49 = v47;
          _os_log_impl(&dword_18C849000, v48, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Error getting result: %{public}@", buf, 0x20u);

          v46 = v48;
        }

        *v69 = objc_retainAutorelease(v10);
        v41 = v60;
        v25 = v61;
      }

      v11 = v39;
    }

  }
  else
  {
    v50 = v25;
    +[AMSLogConfig sharedUserNotificationConfig](AMSLogConfig, "sharedUserNotificationConfig");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v51)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v51, "OSLogObject");
    v52 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
    {
      v53 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543618;
      v76 = (uint64_t)v53;
      v77 = 2114;
      v78 = v11;
      v54 = v53;
      _os_log_impl(&dword_18C849000, v52, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Bag missing URL", buf, 0x16u);

    }
    AMSError(204, CFSTR("Could not build user notification task URL"), CFSTR("Bag is missing URL components"), 0);
    v10 = 0;
    v16 = 0;
    *v69 = (id)objc_claimAutoreleasedReturnValue();
    v25 = v50;
  }

LABEL_45:
  return v16;
}

void __50__AMSUserNotificationSettingsTask_updateSettings___block_invoke_36(uint64_t a1, void *a2)
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

- (id)_generateParametersForItems:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v10;
  void *v11;
  const __CFString *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "ams_dictionaryUsingTransform:", &__block_literal_global_140);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ams_mapWithTransform:", &__block_literal_global_40_1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = CFSTR("notification-preferences");
  -[AMSUserNotificationSettingsTask identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v6;
  v11 = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v11, &v10, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

uint64_t __63__AMSUserNotificationSettingsTask__generateParametersForItems___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "identifier");
}

AMSPair *__63__AMSUserNotificationSettingsTask__generateParametersForItems___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  AMSPair *v6;
  void *v7;
  AMSPair *v8;

  v4 = a3;
  v5 = a2;
  v6 = [AMSPair alloc];
  objc_msgSend(v4, "updateDictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[AMSPair initWithFirst:second:](v6, "initWithFirst:second:", v5, v7);
  return v8;
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
  void *v19;

  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", CFSTR("notification-preferences"), CFSTR("kinds"));
  -[AMSUserNotificationSettingsTask identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("service"));

  objc_msgSend(v3, "setObject:forKeyedSubscript:", CFSTR("explicit"), CFSTR("action"));
  +[AMSMediaURLBuilderUtility devicePlatform](AMSMediaURLBuilderUtility, "devicePlatform");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("platform"));
  -[AMSUserNotificationSettingsTask bag](self, "bag");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSUserNotificationSettingsTask _stringForKey:fromBag:](self, "_stringForKey:fromBag:", 0x1E254CF20, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[AMSUserNotificationSettingsTask bag](self, "bag");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSUserNotificationSettingsTask _countryCodeFromBag:](self, "_countryCodeFromBag:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = 0;
  if (v7 && v9)
  {
    objc_msgSend(v7, "stringByReplacingOccurrencesOfString:withString:", CFSTR("{cc}"), v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_opt_new();
    -[AMSUserNotificationSettingsTask bag](self, "bag");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSUserNotificationSettingsTask _stringForKey:fromBag:](self, "_stringForKey:fromBag:", 0x1E254CF00, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setHost:", v14);

    objc_msgSend(v12, "setPath:", v11);
    v15 = (void *)MEMORY[0x1E0C99DE8];
    v16 = (void *)MEMORY[0x1E0CB39D8];
    v17 = (void *)objc_msgSend(v3, "copy");
    objc_msgSend(v16, "queryItemsFromDictionary:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "arrayWithArray:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setQueryItems:", v19);

    objc_msgSend(v12, "setScheme:", CFSTR("https"));
    objc_msgSend(v12, "URL");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v10;
}

- (id)_countryCodeFromBag:(id)a3
{
  return -[AMSUserNotificationSettingsTask _stringForKey:fromBag:](self, "_stringForKey:fromBag:", 0x1E254C520, a3);
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

+ (NSString)bagSubProfile
{
  if (_MergedGlobals_1_17 != -1)
    dispatch_once(&_MergedGlobals_1_17, &__block_literal_global_49_1);
  return (NSString *)(id)qword_1ECEACC38;
}

void __48__AMSUserNotificationSettingsTask_bagSubProfile__block_invoke()
{
  void *v0;

  v0 = (void *)qword_1ECEACC38;
  qword_1ECEACC38 = (uint64_t)CFSTR("GranularNotificationSettings");

}

+ (NSString)bagSubProfileVersion
{
  if (qword_1ECEACC40 != -1)
    dispatch_once(&qword_1ECEACC40, &__block_literal_global_52_0);
  return (NSString *)(id)qword_1ECEACC48;
}

void __55__AMSUserNotificationSettingsTask_bagSubProfileVersion__block_invoke()
{
  void *v0;

  v0 = (void *)qword_1ECEACC48;
  qword_1ECEACC48 = (uint64_t)CFSTR("1");

}

+ (AMSBagKeySet)bagKeySet
{
  return objc_alloc_init(AMSBagKeySet);
}

- (NSString)clientIdentifier
{
  return self->_clientIdentifier;
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
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
}

@end
