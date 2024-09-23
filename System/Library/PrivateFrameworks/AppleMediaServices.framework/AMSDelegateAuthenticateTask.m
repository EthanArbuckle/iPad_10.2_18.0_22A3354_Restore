@implementation AMSDelegateAuthenticateTask

- (AMSDelegateAuthenticateTask)initWithDelegateAuthenticateRequest:(id)a3 bag:(id)a4 account:(id)a5
{
  id v9;
  id v10;
  id v11;
  AMSDelegateAuthenticateTask *v12;
  AMSDelegateAuthenticateTask *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)AMSDelegateAuthenticateTask;
  v12 = -[AMSTask init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_account, a5);
    objc_storeStrong((id *)&v13->_bag, a4);
    objc_storeStrong((id *)&v13->_request, a3);
    -[AMSDelegateAuthenticateTask _init](v13, "_init");
  }

  return v13;
}

- (AMSDelegateAuthenticateTask)initWithBag:(id)a3 account:(id)a4
{
  id v7;
  id v8;
  AMSDelegateAuthenticateTask *v9;
  AMSDelegateAuthenticateTask *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)AMSDelegateAuthenticateTask;
  v9 = -[AMSTask init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_account, a4);
    objc_storeStrong((id *)&v10->_bag, a3);
    -[AMSDelegateAuthenticateTask _init](v10, "_init");
  }

  return v10;
}

- (void)_init
{
  AMSURLSession *v3;
  AMSURLSession *session;
  id v5;

  objc_msgSend(MEMORY[0x1E0C92CA0], "ams_configurationWithProcessInfo:bag:", 0, 0);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v3 = -[AMSURLSession initWithConfiguration:delegate:delegateQueue:]([AMSURLSession alloc], "initWithConfiguration:delegate:delegateQueue:", v5, self, 0);
  session = self->_session;
  self->_session = v3;

}

- (id)performDelegateAuthentication
{
  AMSMutableLazyPromise *v3;
  _QWORD v5[5];

  v3 = [AMSMutableLazyPromise alloc];
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __60__AMSDelegateAuthenticateTask_performDelegateAuthentication__block_invoke;
  v5[3] = &unk_1E253FBC0;
  v5[4] = self;
  return -[AMSMutableLazyPromise initWithBlock:](v3, "initWithBlock:", v5);
}

void __60__AMSDelegateAuthenticateTask_performDelegateAuthentication__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;
  uint8_t buf[4];
  uint64_t v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  AMSSetLogKeyIfNeeded();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v5, "OSLogObject");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v25 = objc_opt_class();
    v26 = 2114;
    v27 = v4;
    _os_log_impl(&dword_18C849000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Starting delegate authenticate task", buf, 0x16u);
  }

  v7 = *(void **)(a1 + 32);
  v23 = 0;
  objc_msgSend(v7, "_performDelegateAuthenticationWithError:", &v23);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v23;
  +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  if (v9)
  {
    if (!v10)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v11, "OSLogObject");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = objc_opt_class();
      *(_DWORD *)buf = 138543874;
      v25 = v13;
      v26 = 2114;
      v27 = v4;
      v28 = 2114;
      v29 = v9;
      _os_log_impl(&dword_18C849000, v12, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Delegate authenticate call failed with error: %{public}@", buf, 0x20u);
    }

    objc_msgSend(v3, "finishWithError:", v9);
  }
  else
  {
    if (!v10)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v11, "OSLogObject");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = objc_opt_class();
      *(_DWORD *)buf = 138543618;
      v25 = v15;
      v26 = 2114;
      v27 = v4;
      _os_log_impl(&dword_18C849000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Delegate authenticate call succeeded", buf, 0x16u);
    }

    objc_msgSend(*(id *)(a1 + 32), "_delegateAuthenticateResultFromUrlResult:", v8);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "token");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      objc_msgSend(v3, "finishWithResult:", v16);
    }
    else
    {
      +[AMSLogConfig sharedConfigOversize](AMSLogConfig, "sharedConfigOversize");
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
        AMSHashIfNeeded(v8);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v25 = v20;
        v26 = 2114;
        v27 = v4;
        v28 = 2114;
        v29 = v21;
        _os_log_impl(&dword_18C849000, v19, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Unexpected response from server: %{public}@", buf, 0x20u);

      }
      AMSError(301, CFSTR("Delegate Authenticate Failed"), CFSTR("Delegate authenticate call failed with an unexpected server response."), 0);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "finishWithError:", v22);

    }
  }

}

+ (NSString)bagSubProfile
{
  return (NSString *)CFSTR("AMSDelegateAuthenticate");
}

+ (NSString)bagSubProfileVersion
{
  return (NSString *)CFSTR("1");
}

+ (id)createBagForSubProfile
{
  return 0;
}

- (id)_encodedURLRequestWithError:(id *)a3
{
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  AMSKeychainOptions *v12;
  AMSURLRequestEncoder *v13;
  void *v14;
  void *v15;
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
  id v26;
  void *v27;
  _QWORD *v29;
  void *v30;
  void *v31;
  id v32;
  uint8_t buf[4];
  uint64_t v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  id v40;
  const __CFString *v41;
  _QWORD v42[2];

  v42[1] = *MEMORY[0x1E0C80C00];
  AMSSetLogKeyIfNeeded();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v6, "OSLogObject");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v34 = objc_opt_class();
    v35 = 2114;
    v36 = v5;
    _os_log_impl(&dword_18C849000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Begin extracting URL endpoint from bag", buf, 0x16u);
  }

  -[AMSDelegateAuthenticateTask delegateAuthenticateUrl](self, "delegateAuthenticateUrl");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v9, "OSLogObject", a3);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = objc_opt_class();
      *(_DWORD *)buf = 138543618;
      v34 = v11;
      v35 = 2114;
      v36 = v5;
      _os_log_impl(&dword_18C849000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Completed extracting URL endpoint from bag", buf, 0x16u);
    }

    v12 = objc_alloc_init(AMSKeychainOptions);
    -[AMSKeychainOptions setStyle:](v12, "setStyle:", +[AMSKeychainOptions preferredAttestationStyle](AMSKeychainOptions, "preferredAttestationStyle"));
    -[AMSKeychainOptions setPurpose:](v12, "setPurpose:", 0);
    v13 = objc_alloc_init(AMSURLRequestEncoder);
    -[AMSDelegateAuthenticateTask account](self, "account");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSURLRequestEncoder setAccount:](v13, "setAccount:", v14);

    -[AMSDelegateAuthenticateTask bag](self, "bag");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSURLRequestEncoder setBag:](v13, "setBag:", v15);

    -[AMSURLRequestEncoder setDialogOptions:](v13, "setDialogOptions:", 2);
    v31 = v5;
    -[AMSURLRequestEncoder setLogUUID:](v13, "setLogUUID:", v5);
    -[AMSURLRequestEncoder setKeychainOptions:](v13, "setKeychainOptions:", v12);
    -[AMSURLRequestEncoder setUrlKnownToBeTrusted:](v13, "setUrlKnownToBeTrusted:", 1);
    -[AMSDelegateAuthenticateTask formData](self, "formData");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
      -[AMSURLRequestEncoder setRequestEncoding:](v13, "setRequestEncoding:", 2);
    v41 = CFSTR("X-Apple-TID-Action");
    v42[0] = 0x1E254D760;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v42, &v41, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSDelegateAuthenticateTask _urlRequestParameters](self, "_urlRequestParameters");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v8;
    -[AMSURLRequestEncoder requestWithMethod:URL:headers:parameters:](v13, "requestWithMethod:URL:headers:parameters:", 4, v8, v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v32 = 0;
    objc_msgSend(v19, "resultWithError:", &v32);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v32;
    if (v21)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
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
        AMSHashIfNeeded(v30);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v34 = v24;
        v35 = 2114;
        v36 = v31;
        v37 = 2112;
        v38 = v25;
        v39 = 2114;
        v40 = v21;
        _os_log_impl(&dword_18C849000, v23, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to encode request for URL: %@, error: %{public}@", buf, 0x2Au);

      }
      v26 = 0;
      if (v29)
        *v29 = objc_retainAutorelease(v21);
    }
    else
    {
      v26 = v20;
    }

    v8 = v30;
    v5 = v31;
  }
  else
  {
    AMSError(100, CFSTR("Delegate Authentication Failed"), CFSTR("Failed to create NSURL for delegate "), 0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v27;
    if (a3)
    {
      v21 = objc_retainAutorelease(v27);
      v26 = 0;
      *a3 = v21;
    }
    else
    {
      v26 = 0;
    }
  }

  return v26;
}

- (id)_parseFormDataFromResult:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  void *v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v25;
  int v26;
  uint64_t v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  AMSSetLogKeyIfNeeded();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v6, "OSLogObject");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v26 = 138543618;
    v27 = objc_opt_class();
    v28 = 2114;
    v29 = v5;
    _os_log_impl(&dword_18C849000, v7, OS_LOG_TYPE_INFO, "%{public}@: [%{public}@] Attempting to parse form-data from URL result.", (uint8_t *)&v26, 0x16u);
  }

  objc_msgSend(v4, "object");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    goto LABEL_15;
  }
  v9 = v8;

  if (!v9)
  {
LABEL_15:
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    if (!v11)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v11 = (id)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v11, "OSLogObject");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      v17 = objc_opt_class();
      v26 = 138543618;
      v27 = v17;
      v28 = 2114;
      v29 = v5;
      _os_log_impl(&dword_18C849000, v16, OS_LOG_TYPE_INFO, "%{public}@: [%{public}@] Did not find URL result object or it was not an NSDictionary.", (uint8_t *)&v26, 0x16u);
    }

    v9 = 0;
    v15 = 0;
    goto LABEL_34;
  }
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("dialog"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v11 = v10;

    if (v11)
    {
      objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("okButtonAction"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v13 = v12;

        if (v13)
        {
          objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("form-data"));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v15 = v14;

            if (v15)
            {
LABEL_33:

              goto LABEL_34;
            }
          }
          else
          {

          }
          +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v21)
          {
            +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
          }
          objc_msgSend(v21, "OSLogObject");
          v22 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
          {
            v25 = objc_opt_class();
            v26 = 138543618;
            v27 = v25;
            v28 = 2114;
            v29 = v5;
            _os_log_impl(&dword_18C849000, v22, OS_LOG_TYPE_INFO, "%{public}@: [%{public}@] Did not find formData or it was not an NSDictionary", (uint8_t *)&v26, 0x16u);
          }
LABEL_32:

          v15 = 0;
          goto LABEL_33;
        }
      }
      else
      {

      }
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v21)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v21, "OSLogObject");
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        v23 = objc_opt_class();
        v26 = 138543618;
        v27 = v23;
        v28 = 2114;
        v29 = v5;
        _os_log_impl(&dword_18C849000, v22, OS_LOG_TYPE_INFO, "%{public}@: [%{public}@] Did not find 'okButtonAction' or it was not an NSDictionary.", (uint8_t *)&v26, 0x16u);
      }
      v13 = 0;
      goto LABEL_32;
    }
  }
  else
  {

  }
  +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v18)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v18, "OSLogObject");
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    v20 = objc_opt_class();
    v26 = 138543618;
    v27 = v20;
    v28 = 2114;
    v29 = v5;
    _os_log_impl(&dword_18C849000, v19, OS_LOG_TYPE_INFO, "%{public}@: [%{public}@] Did not find 'dialog' or it was not an NSDictionary. Attempt to locate form data as string.", (uint8_t *)&v26, 0x16u);
  }

  -[AMSDelegateAuthenticateTask _parseFormDataAsStringFromResult:](self, "_parseFormDataAsStringFromResult:", v9);
  v15 = (id)objc_claimAutoreleasedReturnValue();
  v11 = 0;
LABEL_34:

  return v15;
}

- (id)_parseFormDataAsStringFromResult:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v27;
  void *v28;
  NSObject *log;
  id v30;
  id v31;
  uint8_t buf[4];
  uint64_t v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  AMSSetLogKeyIfNeeded();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v5, "OSLogObject");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543618;
    v33 = objc_opt_class();
    v34 = 2114;
    v35 = v4;
    _os_log_impl(&dword_18C849000, v6, OS_LOG_TYPE_INFO, "%{public}@: [%{public}@] Attempting to parse form-data as string from URL result.", buf, 0x16u);
  }

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("okButtonAction"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v7;

    if (v8)
    {
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("form-data"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v10 = v9;

        if (v10)
        {
          objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "stringByTrimmingCharactersInSet:", v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "mutableCopy");

          if ((-[NSObject containsString:](v13, "containsString:", CFSTR("<dict>")) & 1) == 0)
            -[NSObject insertString:atIndex:](v13, "insertString:atIndex:", CFSTR("<dict>"), 0);
          if ((-[NSObject containsString:](v13, "containsString:", CFSTR("</dict>")) & 1) == 0)
            -[NSObject appendString:](v13, "appendString:", CFSTR("</dict>"));
          -[NSObject dataUsingEncoding:](v13, "dataUsingEncoding:", 4);
          v14 = objc_claimAutoreleasedReturnValue();
          if (!v14)
          {
            +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v21)
            {
              +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
            }
            objc_msgSend(v21, "OSLogObject");
            v17 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
            {
              v22 = objc_opt_class();
              *(_DWORD *)buf = 138543618;
              v33 = v22;
              v34 = 2114;
              v35 = v4;
              _os_log_impl(&dword_18C849000, v17, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Could not convert 'formData' from NSString to NSData.", buf, 0x16u);
            }
            v18 = 0;
            goto LABEL_47;
          }
          v31 = 0;
          objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v14, 0, 0, &v31);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = v31;
          if (!v15)
          {
            +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v16)
            {
              +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
            }
            objc_msgSend(v16, "OSLogObject");
            log = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
            {
              v27 = objc_opt_class();
              AMSLogableError(v30);
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543874;
              v33 = v27;
              v34 = 2114;
              v35 = v4;
              v36 = 2114;
              v37 = v28;
              _os_log_impl(&dword_18C849000, log, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Error parsing property list from data. error = %{public}@", buf, 0x20u);

            }
          }
          v17 = v15;
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v18 = v17;

            if (v15)
            {
              v17 = v18;
LABEL_46:
              v21 = v30;
LABEL_47:

LABEL_48:
              goto LABEL_49;
            }
          }
          else
          {

          }
          +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v23)
          {
            +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
          }
          objc_msgSend(v23, "OSLogObject");
          v24 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
          {
            v25 = objc_opt_class();
            *(_DWORD *)buf = 138543618;
            v33 = v25;
            v34 = 2114;
            v35 = v4;
            _os_log_impl(&dword_18C849000, v24, OS_LOG_TYPE_INFO, "%{public}@: [%{public}@] Parsed formData was not an NSDictionary", buf, 0x16u);
          }

          v18 = 0;
          goto LABEL_46;
        }
      }
      else
      {

      }
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v13 = objc_claimAutoreleasedReturnValue();
      if (!v13)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v13 = objc_claimAutoreleasedReturnValue();
      }
      -[NSObject OSLogObject](v13, "OSLogObject");
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        v20 = objc_opt_class();
        *(_DWORD *)buf = 138543618;
        v33 = v20;
        v34 = 2114;
        v35 = v4;
        _os_log_impl(&dword_18C849000, v14, OS_LOG_TYPE_INFO, "%{public}@: [%{public}@] Did not find 'formData' or it was not an NSString.", buf, 0x16u);
      }
      v10 = 0;
      v18 = 0;
      goto LABEL_48;
    }
  }
  else
  {

  }
  +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v10, "OSLogObject");
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    v19 = objc_opt_class();
    *(_DWORD *)buf = 138543618;
    v33 = v19;
    v34 = 2114;
    v35 = v4;
    _os_log_impl(&dword_18C849000, v13, OS_LOG_TYPE_INFO, "%{public}@: [%{public}@] Did not find 'okButtonAction' or it was not an NSDictionary.", buf, 0x16u);
  }
  v8 = 0;
  v18 = 0;
LABEL_49:

  return v18;
}

- (id)_performDelegateAuthenticationWithError:(id *)a3
{
  void *v5;
  id v6;
  id v7;
  id v8;
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
  NSObject *v19;
  uint64_t v20;
  void *v21;
  id v23;
  id v24;
  uint8_t buf[4];
  uint64_t v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v24 = 0;
  -[AMSDelegateAuthenticateTask _encodedURLRequestWithError:](self, "_encodedURLRequestWithError:", &v24);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v24;
  if (v6)
  {
    v7 = v6;
    if (a3)
    {
      v7 = objc_retainAutorelease(v6);
      v8 = 0;
      *a3 = v7;
    }
    else
    {
      v8 = 0;
    }
  }
  else
  {
    -[AMSDelegateAuthenticateTask signatureResult](self, "signatureResult");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      -[AMSDelegateAuthenticateTask account](self, "account");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "properties");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "keychainOptions");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[AMSDelegateAuthenticateTask signatureResult](self, "signatureResult");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      +[AMSBiometrics headersWithAccount:options:signatureResult:](AMSBiometrics, "headersWithAccount:options:signatureResult:", v10, v12, v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "ams_addHeaders:", v14);

    }
    -[AMSDelegateAuthenticateTask session](self, "session");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "dataTaskPromiseWithRequest:", v5);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 0;
    objc_msgSend(v16, "resultWithError:", &v23);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v23;

    if (v7)
    {
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
        AMSSetLogKeyIfNeeded();
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v26 = v20;
        v27 = 2114;
        v28 = v21;
        v29 = 2114;
        v30 = v7;
        _os_log_impl(&dword_18C849000, v19, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] URL request failed with error: %{public}@", buf, 0x20u);

      }
      v8 = 0;
      if (a3)
        *a3 = objc_retainAutorelease(v7);
    }
    else
    {
      v8 = v17;
    }

  }
  return v8;
}

- (id)_urlRequestParameters
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[AMSDelegateAuthenticateTask formData](self, "formData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[AMSDelegateAuthenticateTask formData](self, "formData");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    -[AMSDelegateAuthenticateTask request](self, "request");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "challenge");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "ams_setNullableObject:forKey:", v7, CFSTR("challenge"));

    -[AMSDelegateAuthenticateTask request](self, "request");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "userAgent");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "ams_setNullableObject:forKey:", v9, CFSTR("requesterUserAgent"));

    v4 = (void *)objc_msgSend(v5, "copy");
  }
  return v4;
}

- (id)_delegateAuthenticateResultFromUrlResult:(id)a3
{
  AMSDelegateAuthenticateResult *v3;
  AMSDelegateAuthenticateResult *v4;
  void *v5;

  objc_msgSend(a3, "object");
  v3 = (AMSDelegateAuthenticateResult *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v4 = 0;
    goto LABEL_6;
  }
  v4 = v3;

  if (!v4)
  {
LABEL_7:
    v3 = 0;
    goto LABEL_8;
  }
  v3 = -[AMSDelegateAuthenticateResult initWithServerResponse:]([AMSDelegateAuthenticateResult alloc], "initWithServerResponse:", v4);
  -[AMSDelegateAuthenticateResult token](v3, "token");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
LABEL_6:

    goto LABEL_7;
  }
LABEL_8:

  return v3;
}

- (id)delegateAuthenticateUrl
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v14;
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  AMSSetLogKeyIfNeeded();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSDelegateAuthenticateTask bag](self, "bag");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "URLForKey:", 0x1E254C7A0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  objc_msgSend(v5, "valueWithError:", &v14);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v14;

  if (v7)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
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
      AMSHashIfNeeded(CFSTR("delegateAuthenticateAccount"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v16 = v10;
      v17 = 2114;
      v18 = v3;
      v19 = 2112;
      v20 = v11;
      v21 = 2114;
      v22 = v7;
      _os_log_impl(&dword_18C849000, v9, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to find key: %@, error: %{public}@", buf, 0x2Au);

    }
    v12 = 0;
  }
  else
  {
    v12 = v6;
  }

  return v12;
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

- (NSDictionary)formData
{
  return self->_formData;
}

- (void)setFormData:(id)a3
{
  objc_storeStrong((id *)&self->_formData, a3);
}

- (AMSDelegateAuthenticateRequest)request
{
  return self->_request;
}

- (AMSBiometricsSignatureResult)signatureResult
{
  return self->_signatureResult;
}

- (void)setSignatureResult:(id)a3
{
  objc_storeStrong((id *)&self->_signatureResult, a3);
}

- (AMSURLSession)session
{
  return self->_session;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_signatureResult, 0);
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_formData, 0);
  objc_storeStrong((id *)&self->_bag, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end
