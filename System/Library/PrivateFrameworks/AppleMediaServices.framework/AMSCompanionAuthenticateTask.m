@implementation AMSCompanionAuthenticateTask

- (id)performCompanionAuthentication
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __62__AMSCompanionAuthenticateTask_performCompanionAuthentication__block_invoke;
  v3[3] = &unk_1E253DB80;
  v3[4] = self;
  -[AMSTask performTaskWithPromiseBlock:](self, "performTaskWithPromiseBlock:", v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

id __62__AMSCompanionAuthenticateTask_performCompanionAuthentication__block_invoke()
{
  void *v0;
  void *v1;
  NSObject *v2;
  void *v3;
  void *v4;
  int v6;
  uint64_t v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  AMSSetLogKeyIfNeeded();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSLogConfig sharedPurchaseConfig](AMSLogConfig, "sharedPurchaseConfig");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v1)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v1, "OSLogObject");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    v6 = 138543618;
    v7 = objc_opt_class();
    v8 = 2114;
    v9 = v0;
    _os_log_impl(&dword_18C849000, v2, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Platform not supported", (uint8_t *)&v6, 0x16u);
  }

  AMSError(5, CFSTR("Companion Auth Error"), CFSTR("Platform not supported"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSPromise promiseWithError:](AMSPromise, "promiseWithError:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_authenticateWithDelegateAuthToken:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v10[5];
  id v11;

  v4 = a3;
  AMSSetLogKeyIfNeeded();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSCompanionAuthenticateTask _performAuthenticationRequest:](self, "_performAuthenticationRequest:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __67__AMSCompanionAuthenticateTask__authenticateWithDelegateAuthToken___block_invoke;
  v10[3] = &unk_1E2540250;
  v10[4] = self;
  v11 = v5;
  v7 = v5;
  objc_msgSend(v6, "continueWithBlock:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id __67__AMSCompanionAuthenticateTask__authenticateWithDelegateAuthToken___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  int v26;
  uint64_t v27;
  __int16 v28;
  uint64_t v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
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
      v26 = 138543874;
      v27 = v9;
      v28 = 2114;
      v29 = v10;
      v30 = 2114;
      v31 = v6;
      _os_log_impl(&dword_18C849000, v8, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Companion authentication call failed with error: %{public}@", (uint8_t *)&v26, 0x20u);
    }

    +[AMSPromise promiseWithError:](AMSPromise, "promiseWithError:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v5, "object");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v13 = v12;
    else
      v13 = 0;

    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v14)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v14, "OSLogObject");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = objc_opt_class();
      v17 = *(_QWORD *)(a1 + 40);
      AMSHashIfNeeded(v13);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = 138543874;
      v27 = v16;
      v28 = 2114;
      v29 = v17;
      v30 = 2114;
      v31 = v18;
      _os_log_impl(&dword_18C849000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Companion authentication call finished with response = %{public}@", (uint8_t *)&v26, 0x20u);

    }
    if (objc_msgSend(v5, "responseStatusCode") == 200)
    {
      if (!v13)
        v13 = &unk_1E25B0208;
      +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", v13);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      +[AMSLogConfig sharedConfigOversize](AMSLogConfig, "sharedConfigOversize");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v19)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v19, "OSLogObject");
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        v21 = objc_opt_class();
        v22 = *(_QWORD *)(a1 + 40);
        AMSHashIfNeeded(v5);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = 138543874;
        v27 = v21;
        v28 = 2114;
        v29 = v22;
        v30 = 2114;
        v31 = v23;
        _os_log_impl(&dword_18C849000, v20, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Unexpected response from server: %{public}@", (uint8_t *)&v26, 0x20u);

      }
      AMSError(301, CFSTR("Companion authentication Failed"), CFSTR("Companion authentication call failed with an unexpected server response."), 0);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      +[AMSPromise promiseWithError:](AMSPromise, "promiseWithError:", v24);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }

  return v11;
}

- (id)_encodedAuthenticationRequestWithToken:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  _QWORD v15[5];
  id v16;
  id v17;
  uint8_t buf[4];
  uint64_t v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  AMSSetLogKeyIfNeeded();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSLogConfig sharedAccountsConfig](AMSLogConfig, "sharedAccountsConfig");
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
    v19 = objc_opt_class();
    v20 = 2114;
    v21 = v5;
    _os_log_impl(&dword_18C849000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Begin extracting URL endpoint from bag", buf, 0x16u);
  }

  -[AMSDelegateAuthenticateTask bag](self, "bag");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "URLForKey:", 0x1E254C820);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "valuePromise");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __71__AMSCompanionAuthenticateTask__encodedAuthenticationRequestWithToken___block_invoke;
  v15[3] = &unk_1E2540278;
  v15[4] = self;
  v16 = v5;
  v17 = v4;
  v11 = v4;
  v12 = v5;
  objc_msgSend(v10, "continueWithBlock:", v15);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

id __71__AMSCompanionAuthenticateTask__encodedAuthenticationRequestWithToken___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  void *v18;
  void *v19;
  AMSKeychainOptions *v20;
  AMSURLRequestEncoder *v21;
  void *v22;
  void *v23;
  int v25;
  uint64_t v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  +[AMSLogConfig sharedAccountsConfig](AMSLogConfig, "sharedAccountsConfig");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v6)
  {
    if (!v7)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v8, "OSLogObject");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = objc_opt_class();
      v11 = *(_QWORD *)(a1 + 40);
      AMSHashIfNeeded(CFSTR("companionAuthenticateUrl"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 138544130;
      v26 = v10;
      v27 = 2114;
      v28 = v11;
      v29 = 2112;
      v30 = v12;
      v31 = 2114;
      v32 = v6;
      _os_log_impl(&dword_18C849000, v9, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to find key: %@, error: %{public}@", (uint8_t *)&v25, 0x2Au);

    }
    +[AMSPromise promiseWithError:](AMSPromise, "promiseWithError:", v6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!v7)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v8, "OSLogObject");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = objc_opt_class();
      v16 = *(_QWORD *)(a1 + 40);
      v25 = 138543618;
      v26 = v15;
      v27 = 2114;
      v28 = v16;
      _os_log_impl(&dword_18C849000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Completed extracting URL endpoint from bag", (uint8_t *)&v25, 0x16u);
    }

    v17 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(v17, "ams_setNullableObject:forKey:", *(_QWORD *)(a1 + 48), CFSTR("delegateAuthToken"));
    +[AMSDevice deviceGUID](AMSDevice, "deviceGUID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "ams_setNullableObject:forKey:", v18, CFSTR("guid"));

    v19 = (void *)objc_msgSend(v17, "copy");
    v20 = objc_alloc_init(AMSKeychainOptions);
    -[AMSKeychainOptions setStyle:](v20, "setStyle:", +[AMSKeychainOptions preferredAttestationStyle](AMSKeychainOptions, "preferredAttestationStyle"));
    -[AMSKeychainOptions setPurpose:](v20, "setPurpose:", 0);
    v21 = objc_alloc_init(AMSURLRequestEncoder);
    objc_msgSend(*(id *)(a1 + 32), "account");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSURLRequestEncoder setAccount:](v21, "setAccount:", v22);

    objc_msgSend(*(id *)(a1 + 32), "bag");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSURLRequestEncoder setBag:](v21, "setBag:", v23);

    -[AMSURLRequestEncoder setDialogOptions:](v21, "setDialogOptions:", 2);
    -[AMSURLRequestEncoder setLogUUID:](v21, "setLogUUID:", *(_QWORD *)(a1 + 40));
    -[AMSURLRequestEncoder setKeychainOptions:](v21, "setKeychainOptions:", v20);
    -[AMSURLRequestEncoder setUrlKnownToBeTrusted:](v21, "setUrlKnownToBeTrusted:", 1);
    -[AMSURLRequestEncoder setRequestEncoding:](v21, "setRequestEncoding:", 3);
    -[AMSURLRequestEncoder requestWithMethod:URL:headers:parameters:](v21, "requestWithMethod:URL:headers:parameters:", 4, v5, 0, v19);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v13;
}

- (id)_performAuthenticationRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v10[5];
  id v11;

  v4 = a3;
  AMSSetLogKeyIfNeeded();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSCompanionAuthenticateTask _encodedAuthenticationRequestWithToken:](self, "_encodedAuthenticationRequestWithToken:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __62__AMSCompanionAuthenticateTask__performAuthenticationRequest___block_invoke;
  v10[3] = &unk_1E25402A0;
  v10[4] = self;
  v11 = v5;
  v7 = v5;
  objc_msgSend(v6, "continueWithBlock:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id __62__AMSCompanionAuthenticateTask__performAuthenticationRequest___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  int v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    +[AMSLogConfig sharedAccountsConfig](AMSLogConfig, "sharedAccountsConfig");
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
      v14 = 138543874;
      v15 = v9;
      v16 = 2114;
      v17 = v10;
      v18 = 2114;
      v19 = v6;
      _os_log_impl(&dword_18C849000, v8, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] URL request failed with error: %{public}@", (uint8_t *)&v14, 0x20u);
    }

    +[AMSPromise promiseWithError:](AMSPromise, "promiseWithError:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "session");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "dataTaskPromiseWithRequest:", v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v11;
}

@end
