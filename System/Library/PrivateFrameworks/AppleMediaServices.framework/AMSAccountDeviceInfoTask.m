@implementation AMSAccountDeviceInfoTask

- (AMSAccountDeviceInfoTask)initWithAccount:(id)a3 accountStore:(id)a4 bag:(id)a5
{
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  AMSURLSession *v14;
  AMSURLRequestEncoder *v15;
  void *v16;
  AMSAccountDeviceInfoTask *v17;

  v8 = (void *)MEMORY[0x1E0C92CA0];
  v9 = a5;
  v10 = a4;
  v11 = a3;
  +[AMSProcessInfo currentProcess](AMSProcessInfo, "currentProcess");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "ams_configurationWithProcessInfo:bag:", v12, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = -[AMSURLSession initWithConfiguration:delegate:delegateQueue:]([AMSURLSession alloc], "initWithConfiguration:delegate:delegateQueue:", v13, 0, 0);
  v15 = -[AMSURLRequestEncoder initWithBag:]([AMSURLRequestEncoder alloc], "initWithBag:", v9);
  +[AMSDevice serialNumber](AMSDevice, "serialNumber");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[AMSAccountDeviceInfoTask initWithAccount:accountStore:bag:requestEncoder:session:serialNumber:](self, "initWithAccount:accountStore:bag:requestEncoder:session:serialNumber:", v11, v10, v9, v15, v14, v16);

  return v17;
}

- (AMSAccountDeviceInfoTask)initWithAccount:(id)a3 accountStore:(id)a4 bag:(id)a5 requestEncoder:(id)a6 session:(id)a7 serialNumber:(id)a8
{
  id v15;
  id v16;
  id v17;
  AMSAccountDeviceInfoTask *v18;
  AMSAccountDeviceInfoTask *v19;
  id v21;
  id v22;
  id v23;
  objc_super v24;

  v15 = a3;
  v16 = a4;
  v23 = a5;
  v22 = a6;
  v21 = a7;
  v17 = a8;
  v24.receiver = self;
  v24.super_class = (Class)AMSAccountDeviceInfoTask;
  v18 = -[AMSTask init](&v24, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_account, a3);
    objc_storeStrong((id *)&v19->_accountStore, a4);
    objc_storeStrong((id *)&v19->_bag, a5);
    objc_storeStrong((id *)&v19->_requestEncoder, a6);
    objc_storeStrong((id *)&v19->_session, a7);
    objc_storeStrong((id *)&v19->_serialNumber, a8);
  }

  return v19;
}

- (id)perform
{
  void *v2;
  void *v3;
  _QWORD v5[5];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __35__AMSAccountDeviceInfoTask_perform__block_invoke;
  v5[3] = &unk_1E253DB80;
  v5[4] = self;
  -[AMSTask performTaskWithPromiseBlock:](self, "performTaskWithPromiseBlock:", v5);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "promiseWithTimeout:", 30.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __35__AMSAccountDeviceInfoTask_perform__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  NSObject *v22;
  uint64_t v23;
  void *v24;
  __CFString *v25;
  __CFString *v26;
  NSObject *v27;
  uint64_t v28;
  void *v29;
  _QWORD v31[5];
  id v32;
  _QWORD v33[5];
  _QWORD v34[5];
  uint8_t buf[4];
  uint64_t v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  void *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_opt_new();
  objc_msgSend(*(id *)(a1 + 32), "account");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
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
      *(_DWORD *)buf = 138543618;
      v36 = v23;
      v37 = 2114;
      v38 = v24;
      _os_log_impl(&dword_18C849000, v22, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Aborting - missing account", buf, 0x16u);

    }
    v25 = CFSTR("Missing required account");
    v26 = CFSTR("Cannot perform account-device info lookup without account");
    goto LABEL_18;
  }
  objc_msgSend(*(id *)(a1 + 32), "serialNumber");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (!v4)
  {
    if (!v5)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v6, "OSLogObject");
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      v28 = objc_opt_class();
      AMSLogKey();
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v36 = v28;
      v37 = 2114;
      v38 = v29;
      _os_log_impl(&dword_18C849000, v27, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Aborting - missing serial number", buf, 0x16u);

    }
    v25 = CFSTR("Missing required serial number");
    v26 = CFSTR("Cannot perform account-device info lookup without serial number");
LABEL_18:
    AMSError(2, v25, v26, 0);
    v20 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "finishWithError:", v20);
    goto LABEL_19;
  }
  if (!v5)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v6, "OSLogObject");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = objc_opt_class();
    AMSLogKey();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "account");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v36 = v8;
    v37 = 2114;
    v38 = v9;
    v39 = 2114;
    v40 = v10;
    _os_log_impl(&dword_18C849000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Beginning account-device info task for account  %{public}@", buf, 0x20u);

  }
  objc_msgSend(*(id *)(a1 + 32), "account");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "requestEncoder");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setAccount:", v11);

  objc_msgSend(*(id *)(a1 + 32), "requestEncoder");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setUrlKnownToBeTrusted:", 1);

  objc_msgSend(*(id *)(a1 + 32), "_deviceInfoRequest");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = MEMORY[0x1E0C809B0];
  v34[0] = MEMORY[0x1E0C809B0];
  v34[1] = 3221225472;
  v34[2] = __35__AMSAccountDeviceInfoTask_perform__block_invoke_13;
  v34[3] = &unk_1E253DAE0;
  v34[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v14, "thenWithBlock:", v34);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v33[0] = v15;
  v33[1] = 3221225472;
  v33[2] = __35__AMSAccountDeviceInfoTask_perform__block_invoke_2;
  v33[3] = &unk_1E253DB08;
  v33[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v16, "thenWithBlock:", v33);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = v15;
  v31[1] = 3221225472;
  v31[2] = __35__AMSAccountDeviceInfoTask_perform__block_invoke_3;
  v31[3] = &unk_1E253DB58;
  v31[4] = *(_QWORD *)(a1 + 32);
  v18 = v2;
  v32 = v18;
  objc_msgSend(v17, "addFinishBlock:", v31);
  v19 = v32;
  v20 = v18;

LABEL_19:
  return v2;
}

id __35__AMSAccountDeviceInfoTask_perform__block_invoke_13(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "requestEncoder");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "requestByEncodingRequest:parameters:", v3, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __35__AMSAccountDeviceInfoTask_perform__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "session");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dataTaskPromiseWithRequest:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

void __35__AMSAccountDeviceInfoTask_perform__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  AMSAccountDeviceInfoResult *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  AMSAccountDeviceInfoResult *v11;
  void *v12;
  void *v13;
  AMSAccountDeviceInfoResult *v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  AMSAccountDeviceInfoResult *v21;
  _QWORD v22[5];
  id v23;
  AMSAccountDeviceInfoResult *v24;
  uint8_t buf[4];
  uint64_t v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  AMSAccountDeviceInfoResult *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
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
      *(_DWORD *)buf = 138543874;
      v26 = v9;
      v27 = 2114;
      v28 = v10;
      v29 = 2114;
      v30 = v6;
      _os_log_impl(&dword_18C849000, v8, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to get account-device info. Error: %{public}@", buf, 0x20u);

    }
    objc_msgSend(*(id *)(a1 + 40), "finishWithError:", v6);
  }
  else
  {
    v11 = [AMSAccountDeviceInfoResult alloc];
    objc_msgSend(*(id *)(a1 + 32), "account");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "object");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[AMSAccountDeviceInfoResult initWithAccount:responseDictionary:](v11, "initWithAccount:responseDictionary:", v12, v13);

    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v15)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v15, "OSLogObject");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = objc_opt_class();
      AMSLogKey();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v26 = v17;
      v27 = 2114;
      v28 = v18;
      v29 = 2114;
      v30 = v14;
      _os_log_impl(&dword_18C849000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Retrieved account-device info:  %{public}@", buf, 0x20u);

    }
    objc_msgSend(*(id *)(a1 + 32), "_updateAccountWithInfo:", v14);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __35__AMSAccountDeviceInfoTask_perform__block_invoke_17;
    v22[3] = &unk_1E253DB30;
    v20 = *(void **)(a1 + 40);
    v22[4] = *(_QWORD *)(a1 + 32);
    v23 = v20;
    v24 = v14;
    v21 = v14;
    objc_msgSend(v19, "addFinishBlock:", v22);

  }
}

void __35__AMSAccountDeviceInfoTask_perform__block_invoke_17(id *a1, char a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  void *v21;
  int v22;
  uint64_t v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  id v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v6, "OSLogObject");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = objc_opt_class();
      AMSLogKey();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 138543874;
      v23 = v8;
      v24 = 2114;
      v25 = v9;
      v26 = 2114;
      v27 = v5;
      _os_log_impl(&dword_18C849000, v7, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to update account. Error: %{public}@", (uint8_t *)&v22, 0x20u);

    }
    objc_msgSend(a1[5], "finishWithError:", v5);
  }
  if ((a2 & 1) != 0)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v10, "OSLogObject");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = objc_opt_class();
      AMSLogKey();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[4], "account");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "hashedDescription");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[6], "isBundleOwner");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 138544130;
      v23 = v12;
      v24 = 2114;
      v25 = v13;
      v26 = 2114;
      v27 = v15;
      v28 = 2114;
      v29 = v16;
      _os_log_impl(&dword_18C849000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Finished updating account %{public}@ with property %{public}@", (uint8_t *)&v22, 0x2Au);

    }
    objc_msgSend(a1[5], "finishWithResult:", a1[6]);
  }
  else
  {
    AMSError(0, CFSTR("Failed to update account"), CFSTR("And unknown error occurred"), 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v18)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v18, "OSLogObject");
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v20 = objc_opt_class();
      AMSLogKey();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 138543618;
      v23 = v20;
      v24 = 2114;
      v25 = v21;
      _os_log_impl(&dword_18C849000, v19, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to update account - no error provided", (uint8_t *)&v22, 0x16u);

    }
    objc_msgSend(a1[5], "finishWithError:", v17);

  }
}

- (id)_deviceInfoRequest
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[4];
  id v9;
  id location;

  -[AMSAccountDeviceInfoTask bag](self, "bag");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URLForKey:", 0x1E254D060);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak(&location, self);
  objc_msgSend(v4, "valuePromise");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __46__AMSAccountDeviceInfoTask__deviceInfoRequest__block_invoke;
  v8[3] = &unk_1E253DBA8;
  objc_copyWeak(&v9, &location);
  objc_msgSend(v5, "thenWithBlock:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_destroyWeak(&v9);

  objc_destroyWeak(&location);
  return v6;
}

id __46__AMSAccountDeviceInfoTask__deviceInfoRequest__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_requestWithURL:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_requestWithURL:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v4 = (objc_class *)MEMORY[0x1E0CB3998];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithURL:resolvingAgainstBaseURL:", v5, 0);

  v7 = objc_alloc(MEMORY[0x1E0CB39D8]);
  -[AMSAccountDeviceInfoTask serialNumber](self, "serialNumber");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithName:value:", CFSTR("sn"), v8);
  v16[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setQueryItems:", v10);

  v11 = objc_alloc(MEMORY[0x1E0C92C28]);
  objc_msgSend(v6, "URL");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v11, "initWithURL:", v12);

  objc_msgSend(v13, "setHTTPMethod:", CFSTR("POST"));
  v14 = (void *)objc_msgSend(v13, "copy");

  return v14;
}

- (id)_updateAccountWithInfo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  -[AMSAccountDeviceInfoTask account](self, "account");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "isBundleOwner");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "ams_setIsBundleOwner:", v6);
  -[AMSAccountDeviceInfoTask accountStore](self, "accountStore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSAccountDeviceInfoTask account](self, "account");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "ams_saveAccount:withOptions:", v8, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (NSString)bagSubProfile
{
  return +[AMSURLRequestEncoder bagSubProfile](AMSURLRequestEncoder, "bagSubProfile");
}

+ (NSString)bagSubProfileVersion
{
  return +[AMSURLRequestEncoder bagSubProfileVersion](AMSURLRequestEncoder, "bagSubProfileVersion");
}

+ (id)createBagForSubProfile
{
  return +[AMSURLRequestEncoder createBagForSubProfile](AMSURLRequestEncoder, "createBagForSubProfile");
}

- (ACAccount)account
{
  return self->_account;
}

- (AMSBagProtocol)bag
{
  return self->_bag;
}

- (AMSProcessInfo)clientInfo
{
  return self->_clientInfo;
}

- (void)setClientInfo:(id)a3
{
  objc_storeStrong((id *)&self->_clientInfo, a3);
}

- (AMSURLSession)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
  objc_storeStrong((id *)&self->_session, a3);
}

- (AMSURLRequestEncoder)requestEncoder
{
  return self->_requestEncoder;
}

- (void)setRequestEncoder:(id)a3
{
  objc_storeStrong((id *)&self->_requestEncoder, a3);
}

- (NSString)serialNumber
{
  return self->_serialNumber;
}

- (void)setSerialNumber:(id)a3
{
  objc_storeStrong((id *)&self->_serialNumber, a3);
}

- (ACAccountStore)accountStore
{
  return self->_accountStore;
}

- (void)setAccountStore:(id)a3
{
  objc_storeStrong((id *)&self->_accountStore, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountStore, 0);
  objc_storeStrong((id *)&self->_serialNumber, 0);
  objc_storeStrong((id *)&self->_requestEncoder, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_clientInfo, 0);
  objc_storeStrong((id *)&self->_bag, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end
