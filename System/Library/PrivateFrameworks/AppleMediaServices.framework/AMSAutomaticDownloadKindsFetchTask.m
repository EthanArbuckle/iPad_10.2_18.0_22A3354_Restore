@implementation AMSAutomaticDownloadKindsFetchTask

- (AMSAutomaticDownloadKindsFetchTask)initWithAccount:(id)a3 bag:(id)a4
{
  id v7;
  id v8;
  AMSAutomaticDownloadKindsFetchTask *v9;
  AMSAutomaticDownloadKindsFetchTask *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)AMSAutomaticDownloadKindsFetchTask;
  v9 = -[AMSTask init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_account, a3);
    objc_storeStrong((id *)&v10->_bag, a4);
  }

  return v10;
}

- (id)perform
{
  void *v3;
  void *v4;
  int v5;
  __CFString *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  AMSAutomaticDownloadKindsResult *v19;
  void *v20;
  AMSAutomaticDownloadKindsResult *v21;
  NSObject *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  AMSURLRequestEncoder *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  _QWORD v37[5];
  uint8_t buf[4];
  uint64_t v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  void *v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  -[AMSAutomaticDownloadKindsFetchTask account](self, "account");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v6 = CFSTR("An account is required.");
    goto LABEL_5;
  }
  -[AMSAutomaticDownloadKindsFetchTask account](self, "account");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "ams_isLocalAccount");

  if (v5)
  {
    v6 = CFSTR("We cannot sync the local account's automatic download kinds.");
LABEL_5:
    AMSError(2, CFSTR("Invalid Parameter"), v6, 0);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    +[AMSPromise promiseWithError:](AMSPromise, "promiseWithError:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_21;
  }
  -[AMSAutomaticDownloadKindsFetchTask account](self, "account");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", 0x1E2548220);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v10;
  else
    v7 = 0;

  v11 = objc_msgSend(v7, "count");
  +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  if (v11)
  {
    if (!v12)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v13, "OSLogObject");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      v15 = objc_opt_class();
      AMSLogKey();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[AMSAutomaticDownloadKindsFetchTask account](self, "account");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      AMSHashIfNeeded(v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v39 = v15;
      v40 = 2114;
      v41 = v16;
      v42 = 2114;
      v43 = v18;
      _os_log_impl(&dword_18C849000, v14, OS_LOG_TYPE_INFO, "%{public}@: [%{public}@] Returning cached automatic download kinds. account = %{public}@", buf, 0x20u);

    }
    v19 = [AMSAutomaticDownloadKindsResult alloc];
    -[AMSAutomaticDownloadKindsFetchTask account](self, "account");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = -[AMSAutomaticDownloadKindsResult initWithAccount:andEnabledMediaKinds:](v19, "initWithAccount:andEnabledMediaKinds:", v20, v7);

    +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", v21);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!v12)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v13, "OSLogObject");
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      v23 = objc_opt_class();
      AMSLogKey();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[AMSAutomaticDownloadKindsFetchTask account](self, "account");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      AMSHashIfNeeded(v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v39 = v23;
      v40 = 2114;
      v41 = v24;
      v42 = 2114;
      v43 = v26;
      _os_log_impl(&dword_18C849000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Syncing automatic download kinds. account = %{public}@", buf, 0x20u);

    }
    v27 = [AMSURLRequestEncoder alloc];
    -[AMSAutomaticDownloadKindsFetchTask bag](self, "bag");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = -[AMSURLRequestEncoder initWithBag:](v27, "initWithBag:", v28);

    -[AMSAutomaticDownloadKindsFetchTask account](self, "account");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSAutomaticDownloadKindsResult setAccount:](v21, "setAccount:", v29);

    -[AMSAutomaticDownloadKindsResult setRequestEncoding:](v21, "setRequestEncoding:", 2);
    AMSLogKey();
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSAutomaticDownloadKindsResult setLogUUID:](v21, "setLogUUID:", v30);

    v31 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    +[AMSDevice deviceGUID](AMSDevice, "deviceGUID");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "ams_setNullableObject:forKey:", v32, CFSTR("guid"));

    -[AMSBagProtocol URLForKey:](self->_bag, "URLForKey:", 0x1E254D160);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSAutomaticDownloadKindsResult requestWithMethod:bagURL:parameters:](v21, "requestWithMethod:bagURL:parameters:", 2, v33, v31);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "thenWithBlock:", &__block_literal_global_13);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v37[0] = MEMORY[0x1E0C809B0];
    v37[1] = 3221225472;
    v37[2] = __45__AMSAutomaticDownloadKindsFetchTask_perform__block_invoke_2;
    v37[3] = &unk_1E253E418;
    v37[4] = self;
    objc_msgSend(v35, "thenWithBlock:", v37);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
LABEL_21:

  return v8;
}

id __45__AMSAutomaticDownloadKindsFetchTask_perform__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;

  v2 = a2;
  +[AMSURLSession defaultSession](AMSURLSession, "defaultSession");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dataTaskPromiseWithRequest:", v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __45__AMSAutomaticDownloadKindsFetchTask_perform__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  AMSAutomaticDownloadKindsResult *v18;
  void *v19;
  AMSAutomaticDownloadKindsResult *v20;
  void *v21;
  id v23;
  uint8_t buf[4];
  uint64_t v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "object");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("enabled-media-kinds"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v10 = 0;
    v6 = (id)MEMORY[0x1E0C9AA60];
    goto LABEL_8;
  }
  v6 = v5;

  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "account");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v6, 0x1E2548220);

    objc_msgSend(MEMORY[0x1E0C8F2B8], "ams_sharedAccountStore");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "account");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (id)objc_msgSend(v5, "ams_saveAccount:verifyCredentials:", v8, 0);

    v10 = v6;
LABEL_8:

    goto LABEL_9;
  }
  v10 = 0;
  v6 = (id)MEMORY[0x1E0C9AA60];
LABEL_9:
  +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v11, "OSLogObject");
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = objc_opt_class();
    AMSLogKey();
    v23 = v4;
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "account");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    AMSHashIfNeeded(v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    AMSHashIfNeeded(v10);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v25 = v13;
    v26 = 2114;
    v27 = v14;
    v28 = 2114;
    v29 = v16;
    v30 = 2114;
    v31 = v17;
    _os_log_impl(&dword_18C849000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Fetched automatic download kinds. account = %{public}@ | enabled media kinds = %{public}@", buf, 0x2Au);

    v4 = v23;
  }

  v18 = [AMSAutomaticDownloadKindsResult alloc];
  objc_msgSend(*(id *)(a1 + 32), "account");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = -[AMSAutomaticDownloadKindsResult initWithAccount:andEnabledMediaKinds:](v18, "initWithAccount:andEnabledMediaKinds:", v19, v6);

  +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

+ (NSString)bagSubProfile
{
  if (_MergedGlobals_1_2 != -1)
    dispatch_once(&_MergedGlobals_1_2, &__block_literal_global_19);
  return (NSString *)(id)qword_1ECEACA58;
}

void __51__AMSAutomaticDownloadKindsFetchTask_bagSubProfile__block_invoke()
{
  void *v0;

  v0 = (void *)qword_1ECEACA58;
  qword_1ECEACA58 = (uint64_t)CFSTR("AMSAutomaticDownloadKinds");

}

+ (NSString)bagSubProfileVersion
{
  if (qword_1ECEACA60 != -1)
    dispatch_once(&qword_1ECEACA60, &__block_literal_global_22);
  return (NSString *)(id)qword_1ECEACA68;
}

void __58__AMSAutomaticDownloadKindsFetchTask_bagSubProfileVersion__block_invoke()
{
  void *v0;

  v0 = (void *)qword_1ECEACA68;
  qword_1ECEACA68 = (uint64_t)CFSTR("1");

}

+ (id)createBagForSubProfile
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend((id)objc_opt_class(), "bagSubProfile");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "bagSubProfileVersion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSBag bagForProfile:profileVersion:](AMSBag, "bagForProfile:profileVersion:", v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (AMSBagKeySet)bagKeySet
{
  return objc_alloc_init(AMSBagKeySet);
}

- (ACAccount)account
{
  return self->_account;
}

- (AMSBagProtocol)bag
{
  return self->_bag;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bag, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end
