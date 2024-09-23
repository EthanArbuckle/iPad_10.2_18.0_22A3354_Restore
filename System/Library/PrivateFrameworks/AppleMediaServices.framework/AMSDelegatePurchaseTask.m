@implementation AMSDelegatePurchaseTask

- (AMSDelegatePurchaseTask)initWithDelegatePurchaseRequest:(id)a3 bag:(id)a4 account:(id)a5
{
  id v9;
  AMSDelegatePurchaseTask *v10;
  AMSDelegatePurchaseTask *v11;
  objc_super v13;

  v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)AMSDelegatePurchaseTask;
  v10 = -[AMSDelegateAuthenticateTask initWithBag:account:](&v13, sel_initWithBag_account_, a4, a5);
  v11 = v10;
  if (v10)
    objc_storeStrong((id *)&v10->_request, a3);

  return v11;
}

- (BOOL)cancel
{
  void *v3;
  objc_super v5;

  -[AMSDelegatePurchaseTask paymentSheetTask](self, "paymentSheetTask");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancel");

  v5.receiver = self;
  v5.super_class = (Class)AMSDelegatePurchaseTask;
  return -[AMSTask cancel](&v5, sel_cancel);
}

- (id)performDelegatePurchase
{
  void *v3;
  _QWORD v5[4];
  id v6;
  id location;

  objc_initWeak(&location, self);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __50__AMSDelegatePurchaseTask_performDelegatePurchase__block_invoke;
  v5[3] = &unk_1E25401E0;
  objc_copyWeak(&v6, &location);
  -[AMSTask performTaskWithBlock:](self, "performTaskWithBlock:", v5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
  return v3;
}

id __50__AMSDelegatePurchaseTask_performDelegatePurchase__block_invoke(uint64_t a1, _QWORD *a2)
{
  id WeakRetained;
  void *v4;
  AMSDelegatePurchaseProtocolHandler *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
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
  id v32;
  void *v33;
  NSObject *v34;
  uint64_t v35;
  NSObject *v36;
  uint64_t v37;
  id v39;
  id v40;
  id v41;
  uint8_t buf[4];
  uint64_t v43;
  __int16 v44;
  void *v45;
  __int16 v46;
  id v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  AMSSetLogKeyIfNeeded();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc_init(AMSDelegatePurchaseProtocolHandler);
  objc_msgSend(WeakRetained, "session");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setProtocolHandler:", v5);

  if (objc_msgSend(WeakRetained, "isCancelled"))
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
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = objc_opt_class();
      AMSLogKey();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v43 = v9;
      v44 = 2114;
      v45 = v10;
      _os_log_impl(&dword_18C849000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Ending early due to cancelled task", buf, 0x16u);

    }
    AMSError(6, CFSTR("Early Cancellation"), CFSTR("The task was cancelled before it began."), 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (a2)
    {
      v12 = objc_retainAutorelease(v11);
      v13 = 0;
      *a2 = v12;
    }
    else
    {
      v13 = 0;
    }
  }
  else
  {
    v41 = 0;
    objc_msgSend(WeakRetained, "_urlRequestForDelegateAuthError:", &v41);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v41;
    if (v15)
    {
      v12 = v15;
      if (a2)
      {
        v12 = objc_retainAutorelease(v15);
        v13 = 0;
        *a2 = v12;
      }
      else
      {
        v13 = 0;
      }
    }
    else
    {
      objc_msgSend(WeakRetained, "_fetchDelegateAuthResultWithRequest:error:", v14, a2);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "_delegateAuthenticateResultFromUrlResult:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "token");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (v18)
      {
        objc_msgSend(WeakRetained, "_finishWithDelegateAuthenticateResult:error:", v17, a2);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = 0;
      }
      else
      {
        objc_msgSend(WeakRetained, "setDelegateAuthResult:", v16);
        objc_msgSend(WeakRetained, "_parseFormDataFromResult:", v16);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(WeakRetained, "setFormData:", v19);

        objc_msgSend(WeakRetained, "paymentSheetResult");
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        if (v20)
          goto LABEL_16;
        objc_msgSend(v16, "task");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(WeakRetained, "_parseBiometricsSignatureRequestFromTask:", v30);

        objc_msgSend(WeakRetained, "_performAuthenticateTaskWithPaymentSheet");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = 0;
        v32 = (id)objc_msgSend(v31, "resultWithError:", &v40);
        v12 = v40;

        if (!v12)
        {
LABEL_16:
          +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v21)
          {
            +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
          }
          objc_msgSend(v21, "OSLogObject");
          v22 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            v23 = objc_opt_class();
            *(_DWORD *)buf = 138543618;
            v43 = v23;
            v44 = 2114;
            v45 = v4;
            _os_log_impl(&dword_18C849000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Begin fetching delegate auth token", buf, 0x16u);
          }

          objc_msgSend(WeakRetained, "performDelegateAuthentication");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v39 = 0;
          objc_msgSend(v24, "resultWithError:", &v39);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = v39;

          +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
          v26 = objc_claimAutoreleasedReturnValue();
          v27 = (void *)v26;
          if (v12)
          {
            if (!v26)
            {
              +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
            }
            objc_msgSend(v27, "OSLogObject");
            v28 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
            {
              v29 = objc_opt_class();
              *(_DWORD *)buf = 138543874;
              v43 = v29;
              v44 = 2114;
              v45 = v4;
              v46 = 2114;
              v47 = v12;
              _os_log_impl(&dword_18C849000, v28, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Delegate authenticate task failed with error: %{public}@", buf, 0x20u);
            }

            v13 = 0;
            if (a2)
              *a2 = objc_retainAutorelease(v12);
          }
          else
          {
            if (!v26)
            {
              +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
            }
            objc_msgSend(v27, "OSLogObject");
            v36 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
            {
              v37 = objc_opt_class();
              *(_DWORD *)buf = 138543618;
              v43 = v37;
              v44 = 2114;
              v45 = v4;
              _os_log_impl(&dword_18C849000, v36, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Completed fetching delegate auth token", buf, 0x16u);
            }

            objc_msgSend(WeakRetained, "_finishWithDelegateAuthenticateResult:error:", v25, a2);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
          }

        }
        else
        {
          +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v33)
          {
            +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
          }
          objc_msgSend(v33, "OSLogObject");
          v34 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
          {
            v35 = objc_opt_class();
            *(_DWORD *)buf = 138543874;
            v43 = v35;
            v44 = 2114;
            v45 = v4;
            v46 = 2114;
            v47 = v12;
            _os_log_impl(&dword_18C849000, v34, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Delegate authenticate task failed with error: %{public}@", buf, 0x20u);
          }

          if (a2)
          {
            v12 = objc_retainAutorelease(v12);
            v13 = 0;
            *a2 = v12;
          }
          else
          {
            v13 = 0;
          }
        }
      }

    }
  }

  return v13;
}

- (id)delegateAuthenticateUrl
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  BOOL v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  id v15;
  id v17;
  id v18;
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  AMSSetLogKeyIfNeeded();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSDelegateAuthenticateTask bag](self, "bag");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "URLForKey:", 0x1E254C7C0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  objc_msgSend(v5, "valueWithError:", &v18);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v18;

  if (objc_msgSend(v7, "ams_hasDomain:code:", CFSTR("AMSErrorDomain"), 204))
    v8 = v6 == 0;
  else
    v8 = 0;
  if (v8)
  {

    -[AMSDelegateAuthenticateTask bag](self, "bag");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "URLForKey:", 0x1E254C7A0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 0;
    objc_msgSend(v10, "valueWithError:", &v17);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v17;

  }
  if (v7)
  {
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
      AMSHashIfNeeded(CFSTR("delegateAuthenticateAccount"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v20 = v13;
      v21 = 2114;
      v22 = v3;
      v23 = 2112;
      v24 = v14;
      v25 = 2114;
      v26 = v7;
      _os_log_impl(&dword_18C849000, v12, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to find key: %@, error: %{public}@", buf, 0x2Au);

    }
    v15 = 0;
  }
  else
  {
    v15 = v6;
  }

  return v15;
}

- (void)AMSURLSession:(id)a3 task:(id)a4 handleAuthenticateRequest:(id)a5 completion:(id)a6
{
  id v9;
  id v10;
  void (**v11)(id, id, AMSAuthenticateTask *);
  char isKindOfClass;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  AMSAuthenticateTask *v20;
  AMSAuthenticateTask *v21;
  NSObject *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
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
  v9 = a4;
  v10 = a5;
  v11 = (void (**)(id, id, AMSAuthenticateTask *))a6;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)v13;
  if ((isKindOfClass & 1) != 0)
  {
    if (!v13)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v14, "OSLogObject");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = objc_opt_class();
      AMSLogKey();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      AMSHashIfNeeded(v10);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v33 = v16;
      v34 = 2114;
      v35 = v17;
      v36 = 2114;
      v37 = v18;
      _os_log_impl(&dword_18C849000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Handling AMSDelegateAuthenticateRequest. authenticateRequest = %{public}@", buf, 0x20u);

    }
    -[AMSDelegatePurchaseTask _parseBiometricsSignatureRequestFromTask:](self, "_parseBiometricsSignatureRequestFromTask:", v9);
    -[AMSDelegatePurchaseTask _performAuthenticateTaskWithPaymentSheet](self, "_performAuthenticateTaskWithPaymentSheet");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = 0;
    objc_msgSend(v19, "resultWithError:", &v31);
    v20 = (AMSAuthenticateTask *)objc_claimAutoreleasedReturnValue();
    v21 = (AMSAuthenticateTask *)v31;

    v11[2](v11, v20, v21);
  }
  else
  {
    if (!v13)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v14, "OSLogObject");
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      v23 = objc_opt_class();
      AMSLogKey();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      AMSHashIfNeeded(v10);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v33 = v23;
      v34 = 2114;
      v35 = v24;
      v36 = 2114;
      v37 = v25;
      _os_log_impl(&dword_18C849000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Handling AMSAuthenticateRequest. authenticateRequest = %{public}@", buf, 0x20u);

    }
    v21 = -[AMSAuthenticateTask initWithRequest:]([AMSAuthenticateTask alloc], "initWithRequest:", v10);
    -[AMSAuthenticateTask performAuthentication](v21, "performAuthentication");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = 0;
    objc_msgSend(v26, "resultWithError:", &v30);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (AMSAuthenticateTask *)v30;

    objc_msgSend(v27, "account");
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    if (v28)
    {
      objc_msgSend(v27, "account");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[AMSDelegateAuthenticateTask setAccount:](self, "setAccount:", v29);

    }
    v11[2](v11, v27, v20);

  }
}

- (id)_fetchDelegateAuthResultWithRequest:(id)a3 error:(id *)a4
{
  id v6;
  AMSPromise *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  id v26;
  id v28;
  _QWORD v29[5];
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = objc_alloc_init(AMSPromise);
  -[AMSDelegateAuthenticateTask session](self, "session");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __69__AMSDelegatePurchaseTask__fetchDelegateAuthResultWithRequest_error___block_invoke;
  v29[3] = &unk_1E2540BF0;
  v29[4] = self;
  -[AMSPromise completionHandlerAdapter](v7, "completionHandlerAdapter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "createDataTaskWithRequest:activity:dataTaskCreationCompletionHandler:requestCompletionHandler:", v6, 0, v29, v9);

  v28 = 0;
  -[AMSPromise resultWithError:](v7, "resultWithError:", &v28);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v28;
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
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      AMSLogKey();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (void *)MEMORY[0x1E0CB3940];
      v17 = objc_opt_class();
      v18 = v17;
      if (v15)
      {
        AMSLogKey();
        self = (AMSDelegatePurchaseTask *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "stringWithFormat:", CFSTR("%@: [%@] "), v18, self);
      }
      else
      {
        objc_msgSend(v16, "stringWithFormat:", CFSTR("%@: "), v17);
      }
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v31 = v19;
      v32 = 2114;
      v33 = v11;
      _os_log_impl(&dword_18C849000, v14, OS_LOG_TYPE_ERROR, "%{public}@URL request failed with error: %{public}@", buf, 0x16u);
      if (v15)
      {

        v19 = self;
      }

    }
    v26 = 0;
    if (a4)
      *a4 = objc_retainAutorelease(v11);
  }
  else
  {
    if (!v12)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v13, "OSLogObject");
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      AMSLogKey();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = (void *)MEMORY[0x1E0CB3940];
      v23 = objc_opt_class();
      v24 = v23;
      if (v21)
      {
        AMSLogKey();
        self = (AMSDelegatePurchaseTask *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "stringWithFormat:", CFSTR("%@: [%@] "), v24, self);
      }
      else
      {
        objc_msgSend(v22, "stringWithFormat:", CFSTR("%@: "), v23);
      }
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v31 = v25;
      _os_log_impl(&dword_18C849000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@Completed requesting delegate auth endpoint", buf, 0xCu);
      if (v21)
      {

        v25 = self;
      }

    }
    v26 = v10;
  }

  return v26;
}

void __69__AMSDelegatePurchaseTask__fetchDelegateAuthResultWithRequest_error___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  +[AMSURLTaskInfo createTaskInfoForTask:](AMSURLTaskInfo, "createTaskInfoForTask:", v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setDelegateAuthTaskInfo:", v3);

  objc_msgSend(v4, "resume");
}

- (id)_finishWithDelegateAuthenticateResult:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  AMSDelegatePurchaseResult *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  void *v14;
  AMSDelegatePurchaseResult *v15;
  id v16;
  NSObject *v17;
  uint64_t v18;
  void *v19;
  int v21;
  uint64_t v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  AMSSetLogKeyIfNeeded();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "serverResponse");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[AMSDelegateAuthenticateResult initWithServerResponse:]([AMSDelegatePurchaseResult alloc], "initWithServerResponse:", v8);
  -[AMSDelegateAuthenticateResult token](v9, "token");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  if (v10)
  {
    if (!v11)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v12, "OSLogObject");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v21 = 138543618;
      v22 = objc_opt_class();
      v23 = 2114;
      v24 = v7;
      _os_log_impl(&dword_18C849000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Delegate purchase task completed successfully", (uint8_t *)&v21, 0x16u);
    }

    -[AMSDelegatePurchaseTask request](self, "request");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSDelegatePurchaseResult setRequest:](v9, "setRequest:", v14);

    v15 = v9;
    v16 = 0;
  }
  else
  {
    if (!v11)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v12, "OSLogObject");
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v18 = objc_opt_class();
      AMSHashIfNeeded(v9);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 138543874;
      v22 = v18;
      v23 = 2114;
      v24 = v7;
      v25 = 2114;
      v26 = v19;
      _os_log_impl(&dword_18C849000, v17, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Delegate authenticate result missing token: %{public}@", (uint8_t *)&v21, 0x20u);

    }
    AMSError(7, CFSTR("Missing Delegate Token"), CFSTR("The authentication result is missing a token."), 0);
    v16 = (id)objc_claimAutoreleasedReturnValue();
    if (a4)
    {
      v16 = objc_retainAutorelease(v16);
      v15 = 0;
      *a4 = v16;
    }
    else
    {
      v15 = 0;
    }
  }

  return v15;
}

- (void)_parseBiometricsSignatureRequestFromTask:(id)a3
{
  id v4;
  void *v5;
  AMSKeychainOptions *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  id v19;
  uint8_t buf[4];
  uint64_t v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  AMSSetLogKeyIfNeeded();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc_init(AMSKeychainOptions);
  -[AMSKeychainOptions setStyle:](v6, "setStyle:", +[AMSKeychainOptions preferredAttestationStyle](AMSKeychainOptions, "preferredAttestationStyle"));
  -[AMSKeychainOptions setPurpose:](v6, "setPurpose:", 0);
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
    *(_DWORD *)buf = 138543618;
    v21 = objc_opt_class();
    v22 = 2114;
    v23 = v5;
    _os_log_impl(&dword_18C849000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Proceeding with local authorization for delegate buy", buf, 0x16u);
  }

  objc_msgSend(v4, "response");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSDelegateAuthenticateTask account](self, "account");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSDelegateAuthenticateTask session](self, "session");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSProcessInfo currentProcess](AMSProcessInfo, "currentProcess");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0;
  +[AMSBiometricsSignatureRequest biometricsSignatureRequestForURLResponse:account:session:task:clientInfo:options:error:](AMSBiometricsSignatureRequest, "biometricsSignatureRequestForURLResponse:account:session:task:clientInfo:options:error:", v9, v10, v11, v4, v12, v6, &v19);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = v19;
  -[AMSDelegatePurchaseTask setBiometricsRequest:](self, "setBiometricsRequest:", v13);

  -[AMSDelegatePurchaseTask biometricsRequest](self, "biometricsRequest");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

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
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v18 = objc_opt_class();
      *(_DWORD *)buf = 138543874;
      v21 = v18;
      v22 = 2114;
      v23 = v5;
      v24 = 2114;
      v25 = v14;
      _os_log_impl(&dword_18C849000, v17, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Could not create biometrics signature request. error: %{public}@", buf, 0x20u);
    }

  }
}

- (id)_performAuthenticateTaskWithPaymentSheetResult:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  AMSAuthenticateOptions *v13;
  void *v14;
  AMSAuthenticateTask *v15;
  void *v16;
  AMSAuthenticateTask *v17;
  void *v18;
  void *v19;
  int v21;
  uint64_t v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
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
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v21 = 138543618;
    v22 = objc_opt_class();
    v23 = 2114;
    v24 = v5;
    _os_log_impl(&dword_18C849000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Starting authenticate task", (uint8_t *)&v21, 0x16u);
  }

  objc_msgSend(v4, "passwordEquivalentToken");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = 1;
  }
  else
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
      v21 = 138543618;
      v22 = v12;
      v23 = 2114;
      v24 = v5;
      _os_log_impl(&dword_18C849000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Payment sheet result has no password, falling back to silent-preferred authentication.", (uint8_t *)&v21, 0x16u);
    }

    v9 = 0;
  }
  v13 = objc_alloc_init(AMSAuthenticateOptions);
  -[AMSAuthenticateOptions setAllowServerDialogs:](v13, "setAllowServerDialogs:", 1);
  -[AMSAuthenticateOptions setAuthenticationType:](v13, "setAuthenticationType:", v9);
  -[AMSAuthenticateOptions setCanMakeAccountActive:](v13, "setCanMakeAccountActive:", 0);
  +[AMSProcessInfo currentProcess](AMSProcessInfo, "currentProcess");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSAuthenticateOptions setClientInfo:](v13, "setClientInfo:", v14);

  -[AMSAuthenticateOptions setCredentialSource:](v13, "setCredentialSource:", 2);
  -[AMSAuthenticateOptions setDebugReason:](v13, "setDebugReason:", CFSTR("-[AMSDelegatePurchaseTask _performAuthenticateTaskWithPaymentSheetResult:]"));
  v15 = [AMSAuthenticateTask alloc];
  -[AMSDelegateAuthenticateTask account](self, "account");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[AMSAuthenticateTask initWithAccount:options:](v15, "initWithAccount:options:", v16, v13);

  objc_msgSend(v4, "passwordEquivalentToken");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSAuthenticateTask setPassword:](v17, "setPassword:", v18);

  -[AMSAuthenticateTask performAuthentication](v17, "performAuthentication");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (id)_performAuthenticateTaskWithPaymentSheet
{
  AMSMutableLazyPromise *v2;
  AMSMutableLazyPromise *v3;
  _QWORD v5[4];
  id v6;
  id location;

  objc_initWeak(&location, self);
  v2 = [AMSMutableLazyPromise alloc];
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __67__AMSDelegatePurchaseTask__performAuthenticateTaskWithPaymentSheet__block_invoke;
  v5[3] = &unk_1E253FE58;
  objc_copyWeak(&v6, &location);
  v3 = -[AMSMutableLazyPromise initWithBlock:](v2, "initWithBlock:", v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
  return v3;
}

void __67__AMSDelegatePurchaseTask__performAuthenticateTaskWithPaymentSheet__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  AMSAuthenticateResult *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  AMSAuthenticateResult *v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  AMSAuthenticateResult *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  AMSAuthenticateResult *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  NSObject *v41;
  uint64_t v42;
  AMSAuthenticateResult *v43;
  void *v44;
  NSObject *v45;
  uint64_t v46;
  void *v47;
  id v48;
  void *v49;
  id v50;
  id v51;
  uint8_t buf[4];
  uint64_t v53;
  __int16 v54;
  void *v55;
  __int16 v56;
  AMSAuthenticateResult *v57;
  __int16 v58;
  void *v59;
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (!WeakRetained)
  {
    AMSError(0, 0, 0, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "finishWithError:", v5);

  }
  AMSSetLogKeyIfNeeded();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "_performPaymentSheetTask");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = 0;
  objc_msgSend(v7, "resultWithError:", &v51);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (AMSAuthenticateResult *)v51;
  objc_msgSend(WeakRetained, "setPaymentSheetResult:", v8);

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
    objc_msgSend(WeakRetained, "paymentSheetResult");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    AMSHashIfNeeded(v13);
    v14 = (AMSAuthenticateResult *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v53 = v12;
    v54 = 2114;
    v55 = v6;
    v56 = 2114;
    v57 = v14;
    _os_log_impl(&dword_18C849000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Delegate payment sheet completed with result: %{public}@", buf, 0x20u);

  }
  +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = (void *)v15;
  if (v9)
  {
    if (!v15)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v16, "OSLogObject");
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v18 = objc_opt_class();
      *(_DWORD *)buf = 138543874;
      v53 = v18;
      v54 = 2114;
      v55 = v6;
      v56 = 2114;
      v57 = v9;
      _os_log_impl(&dword_18C849000, v17, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Delegate payment sheet failed with error: %{public}@", buf, 0x20u);
    }

    objc_msgSend(v3, "finishWithError:", v9);
    goto LABEL_34;
  }
  if (!v15)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v49 = v6;
  objc_msgSend(v16, "OSLogObject");
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    v20 = objc_opt_class();
    v21 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(WeakRetained, "paymentSheetResult");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "signatureResult");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "numberWithInt:", v23 != 0);
    v24 = (AMSAuthenticateResult *)objc_claimAutoreleasedReturnValue();
    v48 = v3;
    v25 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(WeakRetained, "paymentSheetResult");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "passwordEquivalentToken");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "numberWithInt:", v27 != 0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v53 = v20;
    v54 = 2114;
    v55 = v49;
    v56 = 2114;
    v57 = v24;
    v58 = 2114;
    v59 = v28;
    _os_log_impl(&dword_18C849000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Delegate payment sheet completed with biometric signature: %{public}@, PET: %{public}@", buf, 0x2Au);

    v3 = v48;
  }

  objc_msgSend(WeakRetained, "paymentSheetResult");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "signatureResult");
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "paymentSheetResult");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = v31;
  if (v30)
  {
    objc_msgSend(v31, "signatureResult");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "setSignatureResult:", v33);

    v34 = [AMSAuthenticateResult alloc];
    objc_msgSend(WeakRetained, "account");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[AMSAuthenticateResult initWithAccount:](v34, "initWithAccount:", v35);

    objc_msgSend(v3, "finishWithResult:", v9);
LABEL_19:
    v6 = v49;
    goto LABEL_34;
  }
  objc_msgSend(v31, "passwordEquivalentToken");
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v36)
  {
    AMSError(0, CFSTR("Missing Authentication"), CFSTR("The result had neither a signature result nor a PET."), 0);
    v9 = (AMSAuthenticateResult *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "finishWithError:", v9);
    goto LABEL_19;
  }
  objc_msgSend(WeakRetained, "paymentSheetResult");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "_performAuthenticateTaskWithPaymentSheetResult:", v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = 0;
  objc_msgSend(v38, "resultWithError:", &v50);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (AMSAuthenticateResult *)v50;

  +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v40)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v40, "OSLogObject");
  v41 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
  {
    v42 = objc_opt_class();
    AMSHashIfNeeded(v39);
    v43 = (AMSAuthenticateResult *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v53 = v42;
    v54 = 2114;
    v55 = v49;
    v56 = 2114;
    v57 = v43;
    _os_log_impl(&dword_18C849000, v41, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Authentication task completed with result: %{public}@", buf, 0x20u);

  }
  if (v9)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v49;
    if (!v44)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v44, "OSLogObject");
    v45 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
    {
      v46 = objc_opt_class();
      *(_DWORD *)buf = 138543874;
      v53 = v46;
      v54 = 2114;
      v55 = v49;
      v56 = 2114;
      v57 = v9;
      _os_log_impl(&dword_18C849000, v45, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Authentication task failed with error: %{public}@", buf, 0x20u);
    }

    objc_msgSend(v3, "finishWithError:", v9);
  }
  else
  {
    objc_msgSend(v39, "account");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "setAccount:", v47);

    objc_msgSend(v3, "finishWithResult:", v39);
    v6 = v49;
  }

LABEL_34:
}

- (id)_performPaymentSheetTask
{
  void *v3;
  void *v4;
  NSObject *v5;
  AMSMutablePromise *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  AMSMutablePromise *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  AMSFinancePaymentSheetResponse *v24;
  void *v25;
  void *v26;
  AMSFinancePaymentSheetResponse *v27;
  AMSPaymentSheetTask *v28;
  void *v29;
  void *v30;
  AMSPaymentSheetTask *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  AMSFinancePaymentSheetResponse *v41;
  AMSPaymentSheetTask *v42;
  void *v43;
  void *v44;
  AMSDelegatePaymentSheetRequest *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  AMSDelegatePaymentSheetTask *v52;
  void *v53;
  AMSDelegatePaymentSheetTask *v54;
  void *v55;
  NSObject *v56;
  uint64_t v57;
  void *v59;
  const __CFString *v60;
  void *v61;
  uint8_t buf[4];
  uint64_t v63;
  __int16 v64;
  void *v65;
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  AMSSetLogKeyIfNeeded();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v4, "OSLogObject");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v63 = objc_opt_class();
    v64 = 2114;
    v65 = v3;
    _os_log_impl(&dword_18C849000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Starting payment sheet task", buf, 0x16u);
  }

  if (-[AMSTask isCancelled](self, "isCancelled"))
  {
    v6 = objc_alloc_init(AMSMutablePromise);
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
      *(_DWORD *)buf = 138543618;
      v63 = v9;
      v64 = 2114;
      v65 = v10;
      _os_log_impl(&dword_18C849000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Ending early due to cancelled task", buf, 0x16u);

    }
    AMSError(6, CFSTR("Interrupted Cancellation"), CFSTR("The task was cancelled just before presenting the payment sheet."), 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v6;
LABEL_30:
    -[AMSMutablePromise finishWithError:](v12, "finishWithError:", v11);
    goto LABEL_31;
  }
  -[AMSDelegatePurchaseTask delegateAuthResult](self, "delegateAuthResult");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "object");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("dialog"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v16 = v15;

    if (v16)
    {
      -[AMSDelegatePurchaseTask delegateAuthResult](self, "delegateAuthResult");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "object");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_18;
    }
  }
  else
  {

  }
  -[AMSDelegatePurchaseTask request](self, "request");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "purchaseResult");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "responseDictionary");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    goto LABEL_25;
  }
  v21 = v20;

  if (!v21)
  {
LABEL_25:
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
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
      v57 = objc_opt_class();
      *(_DWORD *)buf = 138543618;
      v63 = v57;
      v64 = 2114;
      v65 = v3;
      _os_log_impl(&dword_18C849000, v56, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Delegate purchase failed for null response dictionary", buf, 0x16u);
    }

    AMSError(2, CFSTR("Delegate purchase failed"), CFSTR("Did not receive a response dictionary"), 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_alloc_init(AMSMutablePromise);
    v6 = v12;
    goto LABEL_30;
  }
  v60 = CFSTR("dialog");
  -[AMSDelegatePurchaseTask request](self, "request");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "purchaseResult");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "responseDictionary");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v61 = v23;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v61, &v60, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_18:
  if (!v11)
    goto LABEL_25;
  v24 = [AMSFinancePaymentSheetResponse alloc];
  -[AMSDelegatePurchaseTask biometricsRequest](self, "biometricsRequest");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSDelegatePurchaseTask delegateAuthTaskInfo](self, "delegateAuthTaskInfo");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = -[AMSFinancePaymentSheetResponse initWithResponseDictionary:confirmationOnly:delegateAuthenticationRequired:biometricSignatureRequired:taskInfo:](v24, "initWithResponseDictionary:confirmationOnly:delegateAuthenticationRequired:biometricSignatureRequired:taskInfo:", v11, 0, 1, v25 != 0, v26);

  v28 = [AMSPaymentSheetTask alloc];
  -[AMSFinancePaymentSheetResponse paymentSheetRequest](v27, "paymentSheetRequest");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSDelegateAuthenticateTask bag](self, "bag");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = -[AMSPaymentSheetTask initWithRequest:bag:](v28, "initWithRequest:bag:", v29, v30);

  -[AMSPaymentSheetTask _paymentRequest](v31, "_paymentRequest");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSDelegatePurchaseTask biometricsRequest](self, "biometricsRequest");
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  if (v33)
  {
    -[AMSDelegatePurchaseTask biometricsRequest](self, "biometricsRequest");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setAccesssControlRef:", objc_msgSend(v34, "localAuthAccessControlRef"));

    -[AMSDelegatePurchaseTask biometricsRequest](self, "biometricsRequest");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "localAuthContext");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "externalizedContext");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setExternalizedContext:", v37);

  }
  objc_msgSend(v32, "appleIDAuthenticationContext");
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v38)
  {
    -[AMSDelegatePurchaseTask request](self, "request");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "purchaseResult");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "purchase");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSFinancePaymentSheetResponse paymentSheetRequest](v27, "paymentSheetRequest");
    v41 = v27;
    v42 = v31;
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "authenticationContextForRequest:", v43);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setAppleIDAuthenticationContext:", v44);

    v31 = v42;
    v27 = v41;

  }
  v45 = objc_alloc_init(AMSDelegatePaymentSheetRequest);
  -[AMSDelegateAuthenticateTask account](self, "account");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSPaymentSheetRequest setAccount:](v45, "setAccount:", v46);

  -[AMSDelegatePurchaseTask biometricsRequest](self, "biometricsRequest");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSPaymentSheetRequest setBiometricsRequest:](v45, "setBiometricsRequest:", v47);

  -[AMSDelegatePurchaseTask request](self, "request");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "challenge");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSPaymentSheetRequest setDelegateAuthenticateChallenge:](v45, "setDelegateAuthenticateChallenge:", v49);

  -[AMSDelegatePaymentSheetRequest setPaymentRequest:](v45, "setPaymentRequest:", v32);
  -[AMSDelegatePurchaseTask request](self, "request");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "userAgent");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSPaymentSheetRequest setUserAgent:](v45, "setUserAgent:", v51);

  v52 = [AMSDelegatePaymentSheetTask alloc];
  -[AMSDelegateAuthenticateTask bag](self, "bag");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = -[AMSDelegatePaymentSheetTask initWithRequest:bag:](v52, "initWithRequest:bag:", v45, v53);

  -[AMSDelegatePurchaseTask setPaymentSheetTask:](self, "setPaymentSheetTask:", v54);
  -[AMSDelegatePaymentSheetTask perform](v54, "perform");
  v6 = (AMSMutablePromise *)objc_claimAutoreleasedReturnValue();

LABEL_31:
  return v6;
}

- (BOOL)_updateBiometricsTokenError:(id *)a3
{
  AMSBiometricsTokenUpdateTask *v5;
  void *v6;
  AMSBiometricsTokenUpdateTask *v7;
  void *v8;
  char v9;
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = [AMSBiometricsTokenUpdateTask alloc];
  -[AMSDelegateAuthenticateTask account](self, "account");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[AMSBiometricsTokenUpdateTask initWithAccount:](v5, "initWithAccount:", v6);

  -[AMSBiometricsTokenUpdateTask setUserInitiated:](v7, "setUserInitiated:", 1);
  -[AMSBiometricsTokenUpdateTask setPresentationDelegate:](v7, "setPresentationDelegate:", self);
  -[AMSBiometricsTokenUpdateTask performUpdate](v7, "performUpdate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0;
  v9 = objc_msgSend(v8, "resultWithError:", &v20);
  v10 = v20;

  if (v10)
  {
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
      AMSLogKey();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)MEMORY[0x1E0CB3940];
      v15 = objc_opt_class();
      v16 = v15;
      if (v13)
      {
        AMSLogKey();
        self = (AMSDelegatePurchaseTask *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "stringWithFormat:", CFSTR("%@: [%@] "), v16, self);
      }
      else
      {
        objc_msgSend(v14, "stringWithFormat:", CFSTR("%@: "), v15);
      }
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      AMSLogableError(v10);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v22 = v17;
      v23 = 2114;
      v24 = v18;
      _os_log_impl(&dword_18C849000, v12, OS_LOG_TYPE_ERROR, "%{public}@Updating biometric token failed with error: %{public}@", buf, 0x16u);
      if (v13)
      {

        v17 = self;
      }

    }
    if (a3)
      *a3 = objc_retainAutorelease(v10);
  }

  return v9;
}

- (id)_urlRequestForDelegateAuthError:(id *)a3
{
  uint64_t v3;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  id v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
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
    AMSLogKey();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)MEMORY[0x1E0CB3940];
    v10 = objc_opt_class();
    v11 = v10;
    if (v8)
    {
      AMSLogKey();
      v3 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "stringWithFormat:", CFSTR("%@: [%@] "), v11, v3);
    }
    else
    {
      objc_msgSend(v9, "stringWithFormat:", CFSTR("%@: "), v10);
    }
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v28 = v12;
    _os_log_impl(&dword_18C849000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@Begin requesting delegate auth endpoint", buf, 0xCu);
    if (v8)
    {

      v12 = (void *)v3;
    }

  }
  v26 = 0;
  -[AMSDelegateAuthenticateTask _encodedURLRequestWithError:](self, "_encodedURLRequestWithError:", &v26);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v26;
  if (v14)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v15)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v15, "OSLogObject");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      AMSLogKey();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = (void *)MEMORY[0x1E0CB3940];
      v19 = objc_opt_class();
      v20 = v19;
      if (v17)
      {
        AMSLogKey();
        self = (AMSDelegatePurchaseTask *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "stringWithFormat:", CFSTR("%@: [%@] "), v20, self);
      }
      else
      {
        objc_msgSend(v18, "stringWithFormat:", CFSTR("%@: "), v19);
      }
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      AMSLogableError(v14);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v28 = v21;
      v29 = 2114;
      v30 = v24;
      _os_log_impl(&dword_18C849000, v16, OS_LOG_TYPE_ERROR, "%{public}@Encoding URL request failed with error: %{public}@", buf, 0x16u);
      if (v17)
      {

        v21 = self;
      }

    }
    v23 = 0;
    if (a3)
      *a3 = objc_retainAutorelease(v14);
  }
  else
  {
    objc_msgSend(v13, "properties");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setDisableBiometricsResponseHandling:", 1);

    v23 = v13;
  }

  return v23;
}

- (id)_urlRequestParameters
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
  id v12;
  void *v13;
  void *v14;
  void *v15;
  objc_super v17;

  -[AMSDelegatePurchaseTask request](self, "request");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "purchaseResult");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "purchase");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "buyParams");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[AMSDelegatePurchaseTask request](self, "request");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "purchaseResult");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "responseDictionary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("delegateParams"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v12 = v11;
  else
    v12 = 0;

  objc_msgSend(v7, "ams_dictionaryByAddingEntriesFromDictionary:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17.receiver = self;
  v17.super_class = (Class)AMSDelegatePurchaseTask;
  -[AMSDelegateAuthenticateTask _urlRequestParameters](&v17, sel__urlRequestParameters);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "ams_dictionaryByAddingEntriesFromDictionary:", v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (AMSDelegatePurchaseRequest)request
{
  return self->_request;
}

- (AMSBiometricsSignatureRequest)biometricsRequest
{
  return self->_biometricsRequest;
}

- (void)setBiometricsRequest:(id)a3
{
  objc_storeStrong((id *)&self->_biometricsRequest, a3);
}

- (AMSURLResult)delegateAuthResult
{
  return self->_delegateAuthResult;
}

- (void)setDelegateAuthResult:(id)a3
{
  objc_storeStrong((id *)&self->_delegateAuthResult, a3);
}

- (AMSURLTaskInfo)delegateAuthTaskInfo
{
  return self->_delegateAuthTaskInfo;
}

- (void)setDelegateAuthTaskInfo:(id)a3
{
  objc_storeStrong((id *)&self->_delegateAuthTaskInfo, a3);
}

- (AMSPaymentSheetResult)paymentSheetResult
{
  return self->_paymentSheetResult;
}

- (void)setPaymentSheetResult:(id)a3
{
  objc_storeStrong((id *)&self->_paymentSheetResult, a3);
}

- (AMSDelegatePaymentSheetTask)paymentSheetTask
{
  return self->_paymentSheetTask;
}

- (void)setPaymentSheetTask:(id)a3
{
  objc_storeStrong((id *)&self->_paymentSheetTask, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_paymentSheetTask, 0);
  objc_storeStrong((id *)&self->_paymentSheetResult, 0);
  objc_storeStrong((id *)&self->_delegateAuthTaskInfo, 0);
  objc_storeStrong((id *)&self->_delegateAuthResult, 0);
  objc_storeStrong((id *)&self->_biometricsRequest, 0);
  objc_storeStrong((id *)&self->_request, 0);
}

@end
