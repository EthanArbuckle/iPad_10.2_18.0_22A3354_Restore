@implementation AMSMediaInvokeAuthenticationHandler

+ (id)performAuthFromResponse:(id)a3 taskInfo:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v20;
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(a1, "_authenticationTypeForResponse:", v6);
  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v9, "OSLogObject");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = (void *)objc_opt_class();
      v12 = v11;
      AMSSetLogKeyIfNeeded();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "ams_valueForHTTPHeaderField:", CFSTR("X-Apple-Invoke-Auth"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138543874;
      v21 = v11;
      v22 = 2114;
      v23 = v13;
      v24 = 2114;
      v25 = v14;
      _os_log_impl(&dword_18C849000, v10, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Unexpected invoke auth type: %{public}@", (uint8_t *)&v20, 0x20u);

    }
    +[AMSOptional optionalWithNil](AMSOptional, "optionalWithNil");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(a1, "_authenticateRequestWithAuthType:taskInfo:", v8, v7);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "ams_valueForHTTPHeaderField:", CFSTR("Location"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v18 = 0;
    }
    objc_msgSend(a1, "_performAuthRequest:redirectURL:taskInfo:", v15, v18, v7);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v16;
}

+ (BOOL)isInvokeAuthenticationEnabled
{
  return _os_feature_enabled_impl();
}

+ (unint64_t)_authenticationTypeForResponse:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;

  objc_msgSend(a3, "ams_valueForHTTPHeaderField:", CFSTR("X-Apple-Invoke-Auth"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(v3, "componentsSeparatedByString:", CFSTR(" "));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWithArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "containsObject:", CFSTR("loud"));
  v8 = objc_msgSend(v6, "containsObject:", CFSTR("silent"));
  v9 = 0x7FFFFFFFFFFFFFFFLL;
  if (v8)
    v9 = 1;
  v10 = 2;
  if (v8)
    v10 = 0;
  if (v7)
    v11 = v10;
  else
    v11 = v9;

  return v11;
}

+ (id)_authenticateRequestWithAuthType:(unint64_t)a3 taskInfo:(id)a4
{
  id v5;
  AMSAuthenticateOptions *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  AMSAuthenticateRequest *v14;
  void *v15;
  void *v16;

  v5 = a4;
  v6 = objc_alloc_init(AMSAuthenticateOptions);
  -[AMSAuthenticateOptions setAuthenticationType:](v6, "setAuthenticationType:", a3);
  -[AMSAuthenticateOptions setAllowServerDialogs:](v6, "setAllowServerDialogs:", a3 != 1);
  -[AMSAuthenticateOptions setAllowSecondaryCredentialSource:](v6, "setAllowSecondaryCredentialSource:", 0);
  -[AMSAuthenticateOptions setCanMakeAccountActive:](v6, "setCanMakeAccountActive:", 0);
  objc_msgSend(v5, "properties");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "clientInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSAuthenticateOptions setClientInfo:](v6, "setClientInfo:", v8);

  objc_msgSend(v5, "properties");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "account");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "ams_isLocalAccount");

  if ((v11 & 1) != 0)
  {
    v12 = 0;
  }
  else
  {
    objc_msgSend(v5, "properties");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "account");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v14 = -[AMSAuthenticateRequest initWithAccount:options:]([AMSAuthenticateRequest alloc], "initWithAccount:options:", v12, v6);
  objc_msgSend(v5, "properties");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "logUUID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSAuthenticateRequest setLogKey:](v14, "setLogKey:", v16);

  return v14;
}

+ (id)_performAuthRequest:(id)a3 redirectURL:(id)a4 taskInfo:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;

  v8 = a4;
  v9 = a5;
  objc_msgSend(a1, "_presentAuthRequest:taskInfo:", a3, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __80__AMSMediaInvokeAuthenticationHandler__performAuthRequest_redirectURL_taskInfo___block_invoke;
  v15[3] = &unk_1E2542E18;
  v17 = v8;
  v18 = a1;
  v16 = v9;
  v11 = v8;
  v12 = v9;
  objc_msgSend(v10, "continueWithBlock:", v15);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

id __80__AMSMediaInvokeAuthenticationHandler__performAuthRequest_redirectURL_taskInfo___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  AMSOptional *v17;
  void *v18;
  _BYTE v20[12];
  __int16 v21;
  void *v22;
  __int16 v23;
  _BOOL4 v24;
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
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = (void *)objc_opt_class();
    v10 = *(void **)(a1 + 32);
    v11 = v9;
    objc_msgSend(v10, "properties");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "logUUID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v20 = 138543874;
    *(_QWORD *)&v20[4] = v9;
    v21 = 2114;
    v22 = v13;
    v23 = 1024;
    v24 = v5 != 0;
    _os_log_impl(&dword_18C849000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Authentication finished (success: %d)", v20, 0x1Cu);

  }
  if (v6)
  {
    +[AMSURLAction actionWithError:](AMSURLAction, "actionWithError:", v6);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v14 && objc_msgSend(v14, "actionType"))
      goto LABEL_14;
  }
  else
  {
    v15 = 0;
  }
  if (*(_QWORD *)(a1 + 40))
    +[AMSURLAction redirectActionWithURL:](AMSURLAction, "redirectActionWithURL:");
  else
    +[AMSURLAction retryAction](AMSURLAction, "retryAction");
  v16 = objc_claimAutoreleasedReturnValue();

  v15 = (void *)v16;
LABEL_14:
  objc_msgSend(v15, "setRetryIdentifier:", 0x1E254B620, *(_QWORD *)v20);
  objc_msgSend(v15, "setReason:", CFSTR("authentication"));
  objc_msgSend(v15, "setAuthenticateResult:", v5);
  v17 = -[AMSOptional initWithValue:]([AMSOptional alloc], "initWithValue:", v15);
  +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

+ (id)_presentAuthRequest:(id)a3 taskInfo:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  char v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  AMSPromise *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  id v30;
  id v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "session");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_respondsToSelector();
  v10 = objc_opt_respondsToSelector();
  if ((v9 & 1) != 0 || (v10 & 1) != 0)
  {
    +[AMSLogConfig sharedAccountsConfig](AMSLogConfig, "sharedAccountsConfig");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v18)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v18, "OSLogObject");
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v20 = (void *)objc_opt_class();
      v30 = v20;
      objc_msgSend(v6, "properties");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "logUUID");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v33 = v20;
      v34 = 2114;
      v35 = v22;
      _os_log_impl(&dword_18C849000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Performing authentication", buf, 0x16u);

    }
    v17 = objc_alloc_init(AMSPromise);
    if ((v9 & 1) != 0)
    {
      objc_msgSend(v6, "task");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[AMSPromise completionHandlerAdapter](v17, "completionHandlerAdapter");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "AMSURLSession:task:handleAuthenticateRequest:completion:", v7, v16, v5, v23);

    }
    else
    {
      +[AMSLogConfig sharedAccountsConfig](AMSLogConfig, "sharedAccountsConfig");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v24)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v24, "OSLogObject");
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        v26 = (void *)objc_opt_class();
        v31 = v26;
        objc_msgSend(v6, "properties");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "logUUID");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v33 = v26;
        v34 = 2114;
        v35 = v28;
        _os_log_impl(&dword_18C849000, v25, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Calling legacy delegate for authentication handling", buf, 0x16u);

      }
      -[AMSPromise completionHandlerAdapter](v17, "completionHandlerAdapter");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "AMSURLSession:handleAuthenticateRequest:completion:", v7, v5, v16);
    }
  }
  else
  {
    AMSErrorWithFormat(2, CFSTR("Media Authentication Error"), CFSTR("No delegate to perform authentication: %@"), v11, v12, v13, v14, v15, (uint64_t)v5);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    +[AMSPromise promiseWithError:](AMSPromise, "promiseWithError:", v16);
    v17 = (AMSPromise *)objc_claimAutoreleasedReturnValue();
  }

  return v17;
}

@end
