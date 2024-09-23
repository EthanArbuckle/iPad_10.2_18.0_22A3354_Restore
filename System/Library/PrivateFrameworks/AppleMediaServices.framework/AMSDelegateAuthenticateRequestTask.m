@implementation AMSDelegateAuthenticateRequestTask

- (AMSDelegateAuthenticateRequestTask)initWithAccount:(id)a3
{
  id v5;
  AMSDelegateAuthenticateRequestTask *v6;
  AMSDelegateAuthenticateRequestTask *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AMSDelegateAuthenticateRequestTask;
  v6 = -[AMSTask init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_account, a3);

  return v7;
}

- (id)perform
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __45__AMSDelegateAuthenticateRequestTask_perform__block_invoke;
  v3[3] = &unk_1E253DB80;
  v3[4] = self;
  -[AMSTask performTaskWithPromiseBlock:](self, "performTaskWithPromiseBlock:", v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

AMSMutablePromise *__45__AMSDelegateAuthenticateRequestTask_perform__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  AMSPromise *v5;
  AMSMutablePromise *v6;
  void *v7;
  uint64_t v8;
  id v9;
  AMSMutablePromise *v10;
  AMSPromise *v11;
  AMSMutablePromise *v12;
  id v13;
  AMSMutablePromise *v14;
  AMSMutablePromise *v15;
  _QWORD v17[5];
  id v18;
  AMSMutablePromise *v19;
  _QWORD v20[5];
  id v21;
  AMSMutablePromise *v22;
  AMSPromise *v23;
  uint8_t buf[4];
  uint64_t v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  AMSSetLogKeyIfNeeded();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v3, "OSLogObject");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v25 = objc_opt_class();
    v26 = 2114;
    v27 = v2;
    _os_log_impl(&dword_18C849000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Begin requesting delegate auth endpoint", buf, 0x16u);
  }

  v5 = objc_alloc_init(AMSPromise);
  v6 = objc_alloc_init(AMSMutablePromise);
  objc_msgSend(*(id *)(a1 + 32), "_encodedURLRequest");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __45__AMSDelegateAuthenticateRequestTask_perform__block_invoke_3;
  v20[3] = &unk_1E2540B00;
  v20[4] = *(_QWORD *)(a1 + 32);
  v9 = v2;
  v21 = v9;
  v10 = v6;
  v22 = v10;
  v23 = v5;
  v11 = v5;
  objc_msgSend(v7, "resultWithCompletion:", v20);

  v17[0] = v8;
  v17[1] = 3221225472;
  v17[2] = __45__AMSDelegateAuthenticateRequestTask_perform__block_invoke_7;
  v17[3] = &unk_1E2540B28;
  v17[4] = *(_QWORD *)(a1 + 32);
  v18 = v9;
  v12 = v10;
  v19 = v12;
  v13 = v9;
  -[AMSPromise addFinishBlock:](v11, "addFinishBlock:", v17);
  v14 = v19;
  v15 = v12;

  return v15;
}

void __45__AMSDelegateAuthenticateRequestTask_perform__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  AMSURLSession *v12;
  void *v13;
  void *v14;
  int v15;
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
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
      v10 = *(_QWORD *)(a1 + 40);
      v15 = 138543874;
      v16 = v9;
      v17 = 2114;
      v18 = v10;
      v19 = 2114;
      v20 = v6;
      _os_log_impl(&dword_18C849000, v8, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Encoding URL request failed with error: %{public}@", (uint8_t *)&v15, 0x20u);
    }

    objc_msgSend(*(id *)(a1 + 48), "finishWithError:", v6);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C92CA0], "ams_configurationWithProcessInfo:bag:", 0, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[AMSURLSession initWithConfiguration:delegate:delegateQueue:]([AMSURLSession alloc], "initWithConfiguration:delegate:delegateQueue:", v11, *(_QWORD *)(a1 + 32), 0);
    objc_msgSend(*(id *)(a1 + 56), "completionHandlerAdapter");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSURLSession dataTaskWithRequest:completionHandler:](v12, "dataTaskWithRequest:completionHandler:", v5, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "resume");
  }

}

void __45__AMSDelegateAuthenticateRequestTask_perform__block_invoke_7(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  AMSDelegateAuthenticateRequest *v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint8_t buf[4];
  uint64_t v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
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
      v10 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543874;
      v24 = v9;
      v25 = 2114;
      v26 = v10;
      v27 = 2114;
      v28 = v6;
      _os_log_impl(&dword_18C849000, v8, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] URL request failed with error: %{public}@", buf, 0x20u);
    }

    objc_msgSend(*(id *)(a1 + 48), "finishWithError:", v6);
  }
  else
  {
    objc_msgSend(v5, "object");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "valueForKey:", CFSTR("challenge"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    +[AMSProcessInfo currentProcess](AMSProcessInfo, "currentProcess");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[AMSUserAgent userAgentForProcessInfo:](AMSUserAgent, "userAgentForProcessInfo:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      v15 = -[AMSDelegateAuthenticateRequest initWithChallenge:userAgent:]([AMSDelegateAuthenticateRequest alloc], "initWithChallenge:userAgent:", v12, v14);
      objc_msgSend(*(id *)(a1 + 48), "finishWithResult:", v15);
    }
    else
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
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
        v22 = *(_QWORD *)(a1 + 40);
        objc_msgSend(v5, "object");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        AMSHashIfNeeded(v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v24 = v18;
        v25 = 2114;
        v26 = v22;
        v27 = 2114;
        v28 = v20;
        _os_log_impl(&dword_18C849000, v17, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] challenge response did not contain a challenge. response = %{public}@", buf, 0x20u);

      }
      v21 = *(void **)(a1 + 48);
      AMSError(116, CFSTR("Request for challenge failed"), CFSTR("The request for a delegate challenge completed successfully but didn't contain a challenge"), 0);
      v15 = (AMSDelegateAuthenticateRequest *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "finishWithError:", v15);
    }

  }
}

- (id)_encodedURLRequest
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  AMSKeychainOptions *v15;
  AMSURLRequestEncoder *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  _QWORD v22[5];
  id v23;
  id v24;
  id v25;
  uint8_t buf[4];
  uint64_t v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  AMSSetLogKeyIfNeeded();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "createBagForSubProfile");
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
    v27 = objc_opt_class();
    v28 = 2114;
    v29 = v3;
    _os_log_impl(&dword_18C849000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Begin extracting URL endpoint from bag", buf, 0x16u);
  }

  objc_msgSend(v4, "URLForKey:", 0x1E254C7E0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0;
  objc_msgSend(v7, "valueWithError:", &v25);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v25;

  if (v9)
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
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = objc_opt_class();
      AMSHashIfNeeded(CFSTR("delegateAuthenticateAccount"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v27 = v12;
      v28 = 2114;
      v29 = v3;
      v30 = 2112;
      v31 = v13;
      v32 = 2114;
      v33 = v9;
      _os_log_impl(&dword_18C849000, v11, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to find key: %@, error: %{public}@", buf, 0x2Au);

    }
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("https://auth.itunes.apple.com/auth/v1/companion/challenge"));
    v14 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v14;
  }
  v15 = objc_alloc_init(AMSKeychainOptions);
  -[AMSKeychainOptions setStyle:](v15, "setStyle:", +[AMSKeychainOptions preferredAttestationStyle](AMSKeychainOptions, "preferredAttestationStyle"));
  -[AMSKeychainOptions setPurpose:](v15, "setPurpose:", 0);
  v16 = objc_alloc_init(AMSURLRequestEncoder);
  -[AMSDelegateAuthenticateRequestTask account](self, "account");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSURLRequestEncoder setAccount:](v16, "setAccount:", v17);

  -[AMSURLRequestEncoder setBag:](v16, "setBag:", v4);
  -[AMSURLRequestEncoder setDialogOptions:](v16, "setDialogOptions:", 2);
  -[AMSURLRequestEncoder setLogUUID:](v16, "setLogUUID:", v3);
  -[AMSURLRequestEncoder setKeychainOptions:](v16, "setKeychainOptions:", v15);
  -[AMSURLRequestEncoder setUrlKnownToBeTrusted:](v16, "setUrlKnownToBeTrusted:", 1);
  -[AMSURLRequestEncoder requestWithMethod:URL:headers:parameters:](v16, "requestWithMethod:URL:headers:parameters:", 2, v8, 0, 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __56__AMSDelegateAuthenticateRequestTask__encodedURLRequest__block_invoke;
  v22[3] = &unk_1E2540B50;
  v22[4] = self;
  v23 = v3;
  v24 = v8;
  v19 = v8;
  v20 = v3;
  objc_msgSend(v18, "addErrorBlock:", v22);

  return v18;
}

void __56__AMSDelegateAuthenticateRequestTask__encodedURLRequest__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
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
    v7 = *(_QWORD *)(a1 + 40);
    AMSHashIfNeeded(*(void **)(a1 + 48));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138544130;
    v10 = v6;
    v11 = 2114;
    v12 = v7;
    v13 = 2112;
    v14 = v8;
    v15 = 2114;
    v16 = v3;
    _os_log_impl(&dword_18C849000, v5, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to encode request for URL: %@, error: %{public}@", (uint8_t *)&v9, 0x2Au);

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

- (ACAccount)account
{
  return self->_account;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_account, 0);
}

@end
