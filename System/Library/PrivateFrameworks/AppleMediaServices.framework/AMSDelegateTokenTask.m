@implementation AMSDelegateTokenTask

- (AMSDelegateTokenTask)initWithDelegateAuthenticateRequest:(id)a3 bag:(id)a4 processInfo:(id)a5 account:(id)a6
{
  id v11;
  AMSDelegateTokenTask *v12;
  AMSDelegateTokenTask *v13;
  objc_super v15;

  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)AMSDelegateTokenTask;
  v12 = -[AMSDelegateAuthenticateTask initWithDelegateAuthenticateRequest:bag:account:](&v15, sel_initWithDelegateAuthenticateRequest_bag_account_, a3, a4, a6);
  v13 = v12;
  if (v12)
    objc_storeStrong((id *)&v12->_processInfo, a5);

  return v13;
}

- (id)performRetrieveDelegateToken
{
  AMSMutableLazyPromise *v3;
  _QWORD v5[5];

  v3 = [AMSMutableLazyPromise alloc];
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __52__AMSDelegateTokenTask_performRetrieveDelegateToken__block_invoke;
  v5[3] = &unk_1E253FBC0;
  v5[4] = self;
  return -[AMSMutableLazyPromise initWithBlock:](v3, "initWithBlock:", v5);
}

void __52__AMSDelegateTokenTask_performRetrieveDelegateToken__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  AMSPromise *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  NSObject *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  id v29;
  void *v30;
  void *v31;
  AMSPromise *v32;
  _QWORD v33[5];
  id v34;
  id v35;
  _QWORD v36[5];
  id v37;
  id v38;
  id v39;
  uint8_t buf[4];
  uint64_t v41;
  __int16 v42;
  void *v43;
  __int16 v44;
  id v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
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
    v41 = objc_opt_class();
    v42 = 2114;
    v43 = v4;
    _os_log_impl(&dword_18C849000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Begin requesting delegate auth endpoint", buf, 0x16u);
  }

  v7 = *(void **)(a1 + 32);
  v39 = 0;
  objc_msgSend(v7, "_encodedURLRequestWithError:", &v39);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v39;
  if (v9)
  {
    v10 = v9;
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v11)
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
      v41 = v13;
      v42 = 2114;
      v43 = v4;
      v44 = 2114;
      v45 = v10;
      _os_log_impl(&dword_18C849000, v12, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Encoding URL request failed with error: %{public}@", buf, 0x20u);
    }

    objc_msgSend(v3, "finishWithError:", v10);
  }
  else
  {
    v14 = objc_alloc_init(AMSPromise);
    objc_msgSend(*(id *)(a1 + 32), "session");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSPromise completionHandlerAdapter](v14, "completionHandlerAdapter");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "dataTaskWithRequest:completionHandler:", v8, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    +[AMSURLTaskInfo createTaskInfoForTask:](AMSURLTaskInfo, "createTaskInfoForTask:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setTaskInfo:", v18);

    objc_msgSend(v17, "resume");
    v38 = 0;
    -[AMSPromise resultWithError:](v14, "resultWithError:", &v38);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v38;
    if (v10)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v20)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v20, "OSLogObject");
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        v22 = objc_opt_class();
        *(_DWORD *)buf = 138543874;
        v41 = v22;
        v42 = 2114;
        v43 = v4;
        v44 = 2114;
        v45 = v10;
        _os_log_impl(&dword_18C849000, v21, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] URL request failed with error: %{public}@", buf, 0x20u);
      }

      objc_msgSend(v3, "finishWithError:", v10);
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "_parseFormDataFromResult:", v19);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "setFormData:", v23);

      objc_msgSend(*(id *)(a1 + 32), "setUrlResult:", v19);
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v24)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v31 = v19;
      v32 = v14;
      objc_msgSend(v24, "OSLogObject");
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        v26 = objc_opt_class();
        *(_DWORD *)buf = 138543618;
        v41 = v26;
        v42 = 2114;
        v43 = v4;
        _os_log_impl(&dword_18C849000, v25, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Completed requesting delegate auth endpoint", buf, 0x16u);
      }

      objc_msgSend(*(id *)(a1 + 32), "_parseBiometricsSignatureRequestFromTask:", v17);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = MEMORY[0x1E0C809B0];
      v36[0] = MEMORY[0x1E0C809B0];
      v36[1] = 3221225472;
      v36[2] = __52__AMSDelegateTokenTask_performRetrieveDelegateToken__block_invoke_4;
      v36[3] = &unk_1E2540C40;
      v36[4] = *(_QWORD *)(a1 + 32);
      v29 = v4;
      v37 = v29;
      objc_msgSend(v27, "continueWithBlock:", v36);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v33[0] = v28;
      v33[1] = 3221225472;
      v33[2] = __52__AMSDelegateTokenTask_performRetrieveDelegateToken__block_invoke_2;
      v33[3] = &unk_1E2540C68;
      v33[4] = *(_QWORD *)(a1 + 32);
      v34 = v29;
      v35 = v3;
      objc_msgSend(v30, "resultWithCompletion:", v33);

      v19 = v31;
      v14 = v32;
    }

  }
}

id __52__AMSDelegateTokenTask_performRetrieveDelegateToken__block_invoke_4(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  _QWORD v14[5];
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "setSignatureResult:", a2);
    objc_msgSend(*(id *)(a1 + 32), "performDelegateAuthentication");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
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
      v16 = v9;
      v17 = 2114;
      v18 = v10;
      v19 = 2114;
      v20 = v5;
      _os_log_impl(&dword_18C849000, v8, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Biometrics failed with error: %{public}@", buf, 0x20u);
    }

    if (objc_msgSend(v5, "ams_hasDomain:code:", CFSTR("AMSErrorDomain"), 6))
    {
      AMSError(100, CFSTR("Biometrics were canceled during authentication"), 0, v5);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      +[AMSPromise promiseWithError:](AMSPromise, "promiseWithError:", v11);
      v12 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "_performFallbackAuthentication");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __52__AMSDelegateTokenTask_performRetrieveDelegateToken__block_invoke_5;
      v14[3] = &unk_1E2540C18;
      v14[4] = *(_QWORD *)(a1 + 32);
      objc_msgSend(v11, "continueWithBlock:", v14);
      v12 = objc_claimAutoreleasedReturnValue();
    }
    v6 = (void *)v12;

  }
  return v6;
}

id __52__AMSDelegateTokenTask_performRetrieveDelegateToken__block_invoke_5(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
    +[AMSPromise promiseWithError:](AMSPromise, "promiseWithError:");
  else
    objc_msgSend(*(id *)(a1 + 32), "performDelegateAuthentication");
  return (id)objc_claimAutoreleasedReturnValue();
}

void __52__AMSDelegateTokenTask_performRetrieveDelegateToken__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  AMSDelegateAuthenticateResult *v7;
  void *v8;
  AMSDelegateAuthenticateResult *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(a2, "serverResponse");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = [AMSDelegateAuthenticateResult alloc];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithDictionary:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[AMSDelegateAuthenticateResult initWithServerResponse:](v7, "initWithServerResponse:", v8);

  if (v5)
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
      v13 = *(_QWORD *)(a1 + 40);
      v17 = 138543874;
      v18 = v12;
      v19 = 2114;
      v20 = v13;
      v21 = 2114;
      v22 = v5;
      _os_log_impl(&dword_18C849000, v11, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] An error occurred while attempting to get delegate token: %{public}@", (uint8_t *)&v17, 0x20u);
    }

    objc_msgSend(*(id *)(a1 + 48), "finishWithError:", v5);
  }
  else
  {
    -[AMSDelegateAuthenticateResult token](v9, "token");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = *(void **)(a1 + 48);
    if (v14)
    {
      objc_msgSend(v15, "finishWithResult:", v9);
    }
    else
    {
      AMSError(100, CFSTR("Failed to retrieve a Delegate Token"), 0, 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "finishWithError:", v16);

    }
  }

}

- (id)_parseBiometricsSignatureRequestFromTask:(id)a3
{
  uint64_t v4;
  AMSKeychainOptions *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  AMSMutablePromise *v16;
  AMSBiometricsSignatureTask *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  uint64_t v22;
  void *v23;
  id v25;
  id v26;
  id v27;
  uint8_t buf[4];
  uint64_t v29;
  __int16 v30;
  uint64_t v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v25 = a3;
  AMSSetLogKeyIfNeeded();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc_init(AMSKeychainOptions);
  -[AMSKeychainOptions setStyle:](v5, "setStyle:", +[AMSKeychainOptions preferredAttestationStyle](AMSKeychainOptions, "preferredAttestationStyle"));
  -[AMSKeychainOptions setPurpose:](v5, "setPurpose:", 0);
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
    v29 = objc_opt_class();
    v30 = 2114;
    v31 = v4;
    _os_log_impl(&dword_18C849000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Proceeding with local authorization for delegate buy", buf, 0x16u);
  }
  v8 = (void *)v4;

  objc_msgSend(v25, "response");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSDelegateAuthenticateTask account](self, "account");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSDelegateAuthenticateTask session](self, "session");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSDelegateTokenTask processInfo](self, "processInfo");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (!v12)
  {
    +[AMSProcessInfo currentProcess](AMSProcessInfo, "currentProcess");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v27 = 0;
  +[AMSBiometricsSignatureRequest biometricsSignatureRequestForURLResponse:account:session:task:clientInfo:options:error:](AMSBiometricsSignatureRequest, "biometricsSignatureRequestForURLResponse:account:session:task:clientInfo:options:error:", v9, v10, v11, v25, v13, v5, &v27);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v27;
  if (!v12)

  if (v14)
  {
    v16 = objc_alloc_init(AMSMutablePromise);
    v17 = -[AMSBiometricsSignatureTask initWithRequest:]([AMSBiometricsSignatureTask alloc], "initWithRequest:", v14);

    -[AMSBiometricsSignatureTask performSignature](v17, "performSignature");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 0;
    objc_msgSend(v18, "resultWithError:", &v26);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v26;

    if (v19)
    {
      -[AMSMutablePromise finishWithResult:](v16, "finishWithResult:", v19);
    }
    else if (v15)
    {
      -[AMSMutablePromise finishWithError:](v16, "finishWithError:", v15);
    }
    else
    {
      AMSError(0, CFSTR("An unknown error with biometrics occurred"), 0, 0);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[AMSMutablePromise finishWithError:](v16, "finishWithError:", v23);

    }
  }
  else
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v20)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v20, "OSLogObject");
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      v22 = objc_opt_class();
      *(_DWORD *)buf = 138543874;
      v29 = v22;
      v30 = 2114;
      v31 = (uint64_t)v8;
      v32 = 2114;
      v33 = v15;
      _os_log_impl(&dword_18C849000, v21, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Could not create biometrics signature request. error: %{public}@", buf, 0x20u);
    }

    +[AMSPromise promiseWithError:](AMSPromise, "promiseWithError:", v15);
    v16 = (AMSMutablePromise *)objc_claimAutoreleasedReturnValue();
  }

  return v16;
}

- (id)_performFallbackAuthentication
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  __CFString *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  id v21;

  -[AMSDelegateTokenTask urlResult](self, "urlResult");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "response");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSDelegateTokenTask taskInfo](self, "taskInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSFinanceAuthenticateResponse performAuthFromResponse:taskInfo:](AMSFinanceAuthenticateResponse, "performAuthFromResponse:taskInfo:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0;
  objc_msgSend(v6, "resultWithError:", &v21);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v21;

  objc_msgSend(v7, "value");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (!v9)
  {
    v11 = CFSTR("Authentication failed");
LABEL_5:
    v12 = v8;
    goto LABEL_6;
  }
  if (objc_msgSend(v9, "actionType") != 3)
  {
    objc_msgSend(v10, "error");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      objc_msgSend(v10, "error");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      AMSError(100, CFSTR("The Authentication Attempt encountered an error"), 0, v13);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      +[AMSPromise promiseWithError:](AMSPromise, "promiseWithError:", v18);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_8;
    }
    if (!v8)
    {
      objc_msgSend(v10, "authenticateResult");
      v19 = objc_claimAutoreleasedReturnValue();
      if (!v19)
      {
        AMSError(100, CFSTR("The Authentication Attempt encountered an error"), 0, 0);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        +[AMSPromise promiseWithError:](AMSPromise, "promiseWithError:", v20);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        v13 = 0;
        goto LABEL_8;
      }
      v13 = (void *)v19;
      +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", v19);
      v14 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
    v11 = CFSTR("The Authentication Attempt encountered an error");
    goto LABEL_5;
  }
  v11 = CFSTR("The Authentication Attempt was cancelled");
  v12 = 0;
LABEL_6:
  AMSError(100, v11, 0, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSPromise promiseWithError:](AMSPromise, "promiseWithError:", v13);
  v14 = objc_claimAutoreleasedReturnValue();
LABEL_7:
  v15 = (void *)v14;
LABEL_8:

  return v15;
}

- (id)authenticateTaskWithRequest:(id)a3
{
  id v3;
  AMSAuthenticateTask *v4;

  v3 = a3;
  v4 = -[AMSAuthenticateTask initWithRequest:]([AMSAuthenticateTask alloc], "initWithRequest:", v3);

  return v4;
}

- (id)delegateAuthenticateUrl
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("https://amp-account.itunes.apple.com/account/delegate/auth"));
}

- (void)AMSURLSession:(id)a3 task:(id)a4 handleAuthenticateRequest:(id)a5 completion:(id)a6
{
  id v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[5];
  id v13;

  v8 = a6;
  -[AMSDelegateTokenTask authenticateTaskWithRequest:](self, "authenticateTaskWithRequest:", a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "performAuthentication");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __80__AMSDelegateTokenTask_AMSURLSession_task_handleAuthenticateRequest_completion___block_invoke;
  v12[3] = &unk_1E2540C90;
  v12[4] = self;
  v13 = v8;
  v11 = v8;
  objc_msgSend(v10, "resultWithCompletion:", v12);

}

void __80__AMSDelegateTokenTask_AMSURLSession_task_handleAuthenticateRequest_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
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
    v9 = objc_opt_class();
    AMSLogKey();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    AMSHashIfNeeded(v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138543874;
    v15 = v9;
    v16 = 2114;
    v17 = v10;
    v18 = 2114;
    v19 = v11;
    _os_log_impl(&dword_18C849000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Handling AMSAuthenticateRequest. authenticateRequest = %{public}@", (uint8_t *)&v14, 0x20u);

  }
  objc_msgSend(v5, "account");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(v5, "account");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setAccount:", v13);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (AMSProcessInfo)processInfo
{
  return self->_processInfo;
}

- (void)setProcessInfo:(id)a3
{
  objc_storeStrong((id *)&self->_processInfo, a3);
}

- (AMSURLTaskInfo)taskInfo
{
  return self->_taskInfo;
}

- (void)setTaskInfo:(id)a3
{
  objc_storeStrong((id *)&self->_taskInfo, a3);
}

- (AMSURLResult)urlResult
{
  return self->_urlResult;
}

- (void)setUrlResult:(id)a3
{
  objc_storeStrong((id *)&self->_urlResult, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_urlResult, 0);
  objc_storeStrong((id *)&self->_taskInfo, 0);
  objc_storeStrong((id *)&self->_processInfo, 0);
}

@end
