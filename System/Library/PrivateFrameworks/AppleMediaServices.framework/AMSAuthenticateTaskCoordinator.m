@implementation AMSAuthenticateTaskCoordinator

+ (id)promiseStore
{
  if (_MergedGlobals_82 != -1)
    dispatch_once(&_MergedGlobals_82, &__block_literal_global_10);
  return (id)qword_1ECEACF78;
}

void __46__AMSAuthenticateTaskCoordinator_promiseStore__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v1 = (void *)qword_1ECEACF78;
  qword_1ECEACF78 = (uint64_t)v0;

}

+ (id)internalQueue
{
  if (qword_1ECEACF80 != -1)
    dispatch_once(&qword_1ECEACF80, &__block_literal_global_14);
  return (id)qword_1ECEACF88;
}

void __47__AMSAuthenticateTaskCoordinator_internalQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("com.apple.AppleMediaServices.AMSAuthenticateTaskCoordinator", v2);
  v1 = (void *)qword_1ECEACF88;
  qword_1ECEACF88 = (uint64_t)v0;

}

- (id)handleRequest:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v9 = CFSTR("AMSAuthenticateTaskCoordinatorItemKeyRequest");
  v10[0] = a3;
  v4 = (void *)MEMORY[0x1E0C99D80];
  v5 = a3;
  objc_msgSend(v4, "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[AMSAuthenticateTaskCoordinator handleRequestDictionary:](self, "handleRequestDictionary:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)handleRequestDictionary:(id)a3
{
  return -[AMSAuthenticateTaskCoordinator _enqueueItem:handleAuthenticationWithBlock:](self, "_enqueueItem:handleAuthenticationWithBlock:", a3, 0);
}

- (id)enqueueAuthenticationRequest:(id)a3 handleAuthenticationWithBlock:(id)a4
{
  uint64_t v4;
  id v7;
  id v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  _BOOL4 v17;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  AMSMutablePromise *v32;
  void *v33;
  void *v34;
  AMSMutablePromise *v35;
  _QWORD v37[4];
  AMSMutablePromise *v38;
  const __CFString *v39;
  id v40;
  uint8_t buf[4];
  void *v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (!v8)
    {
      +[AMSLogConfig sharedAccountsConfig](AMSLogConfig, "sharedAccountsConfig");
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
        AMSLogKey();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = (void *)MEMORY[0x1E0CB3940];
        v14 = objc_opt_class();
        v15 = v14;
        if (v12)
        {
          AMSLogKey();
          v4 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "stringWithFormat:", CFSTR("%@: [%@] "), v15, v4);
        }
        else
        {
          objc_msgSend(v13, "stringWithFormat:", CFSTR("%@: "), v14);
        }
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v42 = v16;
        _os_log_impl(&dword_18C849000, v11, OS_LOG_TYPE_ERROR, "%{public}@ Missing authentication handler block. Authentication will be processed by AMSAuthenticateTaskCoordinator.", buf, 0xCu);
        if (v12)
        {

          v16 = (void *)v4;
        }

      }
    }
    v32 = objc_alloc_init(AMSMutablePromise);
    v39 = CFSTR("AMSAuthenticateTaskCoordinatorItemKeyRequest");
    v40 = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v40, &v39, 1);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSAuthenticateTaskCoordinator _enqueueItem:handleAuthenticationWithBlock:](self, "_enqueueItem:handleAuthenticationWithBlock:", v33, v9);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v37[0] = MEMORY[0x1E0C809B0];
    v37[1] = 3221225472;
    v37[2] = __93__AMSAuthenticateTaskCoordinator_enqueueAuthenticationRequest_handleAuthenticationWithBlock___block_invoke;
    v37[3] = &unk_1E253E238;
    v35 = v32;
    v38 = v35;
    objc_msgSend(v34, "addFinishBlock:", v37);

  }
  else
  {
    v17 = +[AMSUnitTests isRunningUnitTests](AMSUnitTests, "isRunningUnitTests");
    +[AMSLogConfig sharedAccountsConfig](AMSLogConfig, "sharedAccountsConfig");
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = (void *)v18;
    if (v17)
    {
      if (!v18)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v19, "OSLogObject");
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        AMSLogKey();
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = (void *)MEMORY[0x1E0CB3940];
        v23 = objc_opt_class();
        v24 = v23;
        if (v21)
        {
          AMSLogKey();
          self = (AMSAuthenticateTaskCoordinator *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "stringWithFormat:", CFSTR("%@: [%@] "), v24, self);
        }
        else
        {
          objc_msgSend(v22, "stringWithFormat:", CFSTR("%@: "), v23);
        }
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v42 = v25;
        _os_log_impl(&dword_18C849000, v20, OS_LOG_TYPE_ERROR, "%{public}@ The provided AMSAuthenticateRequest is nil. Unable to continue.", buf, 0xCu);
        if (v21)
        {

          v25 = self;
        }

      }
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      +[AMSLogConfig sharedAccountsConfig](AMSLogConfig, "sharedAccountsConfig");
      v26 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "postNotificationName:object:userInfo:", CFSTR("com.apple.AppleMediaServicesTests.FaultLogged"), v26, 0);
    }
    else
    {
      if (!v18)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v19, "OSLogObject");
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
      {
        AMSLogKey();
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = (void *)MEMORY[0x1E0CB3940];
        v29 = objc_opt_class();
        v30 = v29;
        if (v27)
        {
          AMSLogKey();
          self = (AMSAuthenticateTaskCoordinator *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "stringWithFormat:", CFSTR("%@: [%@] "), v30, self);
        }
        else
        {
          objc_msgSend(v28, "stringWithFormat:", CFSTR("%@: "), v29);
        }
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v42 = v31;
        _os_log_impl(&dword_18C849000, v26, OS_LOG_TYPE_FAULT, "%{public}@ The provided AMSAuthenticateRequest is nil. Unable to continue.", buf, 0xCu);
        if (v27)
        {

          v31 = self;
        }

      }
    }

    AMSError(2, CFSTR("Missing Request Parameter"), CFSTR("There was no AMSAuthenticateRequest provided. Unable to continue."), 0);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    +[AMSPromise promiseWithError:](AMSPromise, "promiseWithError:", v33);
    v35 = (AMSMutablePromise *)objc_claimAutoreleasedReturnValue();
  }

  return v35;
}

uint64_t __93__AMSAuthenticateTaskCoordinator_enqueueAuthenticationRequest_handleAuthenticationWithBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithResult:error:", a2, a3);
}

- (id)_authenticateTaskForItem:(id)a3 authenticationResults:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  AMSAuthenticateTask *v8;

  v5 = a4;
  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("AMSAuthenticateTaskCoordinatorItemKeyRequest"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "options");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[AMSAuthenticateTask initWithAuthenticationResults:options:]([AMSAuthenticateTask alloc], "initWithAuthenticationResults:options:", v5, v7);

  return v8;
}

- (id)_authenticateTaskForItem:(id)a3
{
  void *v3;
  AMSAuthenticateTask *v4;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("AMSAuthenticateTaskCoordinatorItemKeyRequest"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[AMSAuthenticateTask initWithRequest:]([AMSAuthenticateTask alloc], "initWithRequest:", v3);

  return v4;
}

- (id)_enqueueItem:(id)a3 handleAuthenticationWithBlock:(id)a4
{
  uint64_t v4;
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  AMSMutablePromise *v20;
  NSObject *v21;
  AMSMutablePromise *v22;
  void *v23;
  AMSMutablePromise *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  id v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  id v36;
  _QWORD block[5];
  id v38;
  AMSMutablePromise *v39;
  id v40;
  id v41;
  uint8_t buf[4];
  void *v43;
  __int16 v44;
  uint64_t v45;
  __int16 v46;
  void *v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  +[AMSLogConfig sharedAccountsConfig](AMSLogConfig, "sharedAccountsConfig");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v9, "OSLogObject");
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    v36 = v8;
    AMSLogKey();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)MEMORY[0x1E0CB3940];
    v13 = objc_opt_class();
    v14 = v13;
    if (v11)
    {
      AMSLogKey();
      v4 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "stringWithFormat:", CFSTR("%@: [%@] "), v14, v4);
    }
    else
    {
      objc_msgSend(v12, "stringWithFormat:", CFSTR("%@: "), v13);
    }
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[AMSAuthenticateTaskCoordinator promiseStore](AMSAuthenticateTaskCoordinator, "promiseStore");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "count");
    AMSHashIfNeeded(v7);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v43 = v15;
    v44 = 2048;
    v45 = v17;
    v46 = 2114;
    v47 = v18;
    _os_log_impl(&dword_18C849000, v10, OS_LOG_TYPE_DEBUG, "%{public}@ Primary Request count in store: %lu. Adding Authenticate Request to coordinator: %{public}@", buf, 0x20u);

    if (v11)
    {

      v15 = (void *)v4;
    }

    v8 = v36;
  }

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("AMSAuthenticateTaskCoordinatorItemKeyRequest"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    v20 = objc_alloc_init(AMSMutablePromise);
    +[AMSAuthenticateTaskCoordinator internalQueue](AMSAuthenticateTaskCoordinator, "internalQueue");
    v21 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __77__AMSAuthenticateTaskCoordinator__enqueueItem_handleAuthenticationWithBlock___block_invoke;
    block[3] = &unk_1E253E328;
    block[4] = self;
    v38 = v19;
    v41 = v8;
    v22 = v20;
    v39 = v22;
    v40 = v7;
    dispatch_async(v21, block);

    v23 = v40;
    v24 = v22;

    v25 = v24;
  }
  else
  {
    AMSError(2, CFSTR("Enqueue item missing AMSAuthenticateRequest"), CFSTR("Unable to complete authenticate for request, enqueue item was passed a context that does not contain an AMSAuthenticateRequest"), 0);
    v24 = (AMSMutablePromise *)objc_claimAutoreleasedReturnValue();
    +[AMSLogConfig sharedAccountsConfig](AMSLogConfig, "sharedAccountsConfig");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v26)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v26, "OSLogObject");
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      v28 = v8;
      AMSLogKey();
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = (void *)MEMORY[0x1E0CB3940];
      v31 = objc_opt_class();
      v32 = v31;
      if (v29)
      {
        AMSLogKey();
        self = (AMSAuthenticateTaskCoordinator *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "stringWithFormat:", CFSTR("%@: [%@] "), v32, self);
      }
      else
      {
        objc_msgSend(v30, "stringWithFormat:", CFSTR("%@: "), v31);
      }
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      AMSLogableError(v24);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v43 = v33;
      v44 = 2114;
      v45 = (uint64_t)v34;
      _os_log_impl(&dword_18C849000, v27, OS_LOG_TYPE_ERROR, "%{public}@ Error processing authenticate request: %{public}@", buf, 0x16u);
      if (v29)
      {

        v33 = self;
      }

      v8 = v28;
    }

    +[AMSPromise promiseWithError:](AMSPromise, "promiseWithError:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v25;
}

void __77__AMSAuthenticateTaskCoordinator__enqueueItem_handleAuthenticationWithBlock___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  void *v38;
  _QWORD v39[5];
  id v40;
  id v41;
  _QWORD v42[5];
  id v43;
  _QWORD v44[5];
  id v45;
  id v46;
  id v47;
  _QWORD v48[5];
  id v49;
  id v50;
  id v51;
  uint8_t buf[4];
  void *v53;
  __int16 v54;
  uint64_t v55;
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_promiseWithResultsForRequest:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 == 0;
  v4 = *(_QWORD *)(a1 + 64);
  +[AMSLogConfig sharedAccountsOversizeConfig](AMSLogConfig, "sharedAccountsOversizeConfig");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v2)
  {
    if (v4)
    {
      if (!v5)
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
        v31 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)buf = 138543618;
        v53 = v12;
        v54 = 2114;
        v55 = v31;
        _os_log_impl(&dword_18C849000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ Will wait for another request to complete before running authHandler: %{public}@", buf, 0x16u);
        if (v8)
        {

          v12 = (void *)v3;
        }

      }
      v48[0] = MEMORY[0x1E0C809B0];
      v48[1] = 3221225472;
      v48[2] = __77__AMSAuthenticateTaskCoordinator__enqueueItem_handleAuthenticationWithBlock___block_invoke_40;
      v48[3] = &unk_1E253E260;
      v32 = *(void **)(a1 + 40);
      v48[4] = *(_QWORD *)(a1 + 32);
      v49 = v32;
      v51 = *(id *)(a1 + 64);
      v50 = *(id *)(a1 + 48);
      objc_msgSend(v2, "addFinishBlock:", v48);

    }
    else
    {
      if (!v5)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v6, "OSLogObject");
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        AMSLogKey();
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = (void *)MEMORY[0x1E0CB3940];
        v22 = objc_opt_class();
        v23 = v22;
        if (v20)
        {
          AMSLogKey();
          v3 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "stringWithFormat:", CFSTR("%@: [%@] "), v23, v3);
        }
        else
        {
          objc_msgSend(v21, "stringWithFormat:", CFSTR("%@: "), v22);
        }
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)buf = 138543618;
        v53 = v24;
        v54 = 2114;
        v55 = v35;
        _os_log_impl(&dword_18C849000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@ The authenticate request will wait for another request to complete: %{public}@", buf, 0x16u);
        if (v20)
        {

          v24 = (void *)v3;
        }

      }
      v44[0] = MEMORY[0x1E0C809B0];
      v44[1] = 3221225472;
      v44[2] = __77__AMSAuthenticateTaskCoordinator__enqueueItem_handleAuthenticationWithBlock___block_invoke_41;
      v44[3] = &unk_1E253E288;
      v36 = *(void **)(a1 + 40);
      v44[4] = *(_QWORD *)(a1 + 32);
      v45 = v36;
      v46 = *(id *)(a1 + 56);
      v47 = *(id *)(a1 + 48);
      objc_msgSend(v2, "addFinishBlock:", v44);

    }
  }
  else if (v4)
  {
    if (!v5)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v6, "OSLogObject");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      AMSLogKey();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (void *)MEMORY[0x1E0CB3940];
      v16 = objc_opt_class();
      v17 = v16;
      if (v14)
      {
        AMSLogKey();
        v3 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "stringWithFormat:", CFSTR("%@: [%@] "), v17, v3);
      }
      else
      {
        objc_msgSend(v15, "stringWithFormat:", CFSTR("%@: "), v16);
      }
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      v53 = v18;
      v54 = 2114;
      v55 = v33;
      _os_log_impl(&dword_18C849000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ There are no matching authentication requests calling authHandler immediately for request = %{public}@", buf, 0x16u);
      if (v14)
      {

        v18 = (void *)v3;
      }

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak((id *)buf, v34);
    v42[0] = MEMORY[0x1E0C809B0];
    v42[1] = 3221225472;
    v42[2] = __77__AMSAuthenticateTaskCoordinator__enqueueItem_handleAuthenticationWithBlock___block_invoke_43;
    v42[3] = &unk_1E253E2D8;
    objc_copyWeak(&v43, (id *)buf);
    v42[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v34, "addFinishBlock:", v42);
    objc_msgSend(*(id *)(a1 + 48), "finishWithPromise:", v34);
    objc_msgSend(*(id *)(a1 + 32), "_addToStoreRequest:promise:", *(_QWORD *)(a1 + 40), v34);
    objc_destroyWeak(&v43);
    objc_destroyWeak((id *)buf);

  }
  else
  {
    if (!v5)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v6, "OSLogObject");
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      AMSLogKey();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = (void *)MEMORY[0x1E0CB3940];
      v28 = objc_opt_class();
      v29 = v28;
      if (v26)
      {
        AMSLogKey();
        v3 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "stringWithFormat:", CFSTR("%@: [%@] "), v29, v3);
      }
      else
      {
        objc_msgSend(v27, "stringWithFormat:", CFSTR("%@: "), v28);
      }
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      v53 = v30;
      v54 = 2114;
      v55 = v37;
      _os_log_impl(&dword_18C849000, v25, OS_LOG_TYPE_DEFAULT, "%{public}@ Using authenticate request to begin a new authentication: %{public}@", buf, 0x16u);
      if (v26)
      {

        v30 = (void *)v3;
      }

    }
    objc_msgSend(*(id *)(a1 + 32), "_handleAuthenticateRequestWithItem:authenticationResults:", *(_QWORD *)(a1 + 56), 0);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak((id *)buf, v38);
    v39[0] = MEMORY[0x1E0C809B0];
    v39[1] = 3221225472;
    v39[2] = __77__AMSAuthenticateTaskCoordinator__enqueueItem_handleAuthenticationWithBlock___block_invoke_44;
    v39[3] = &unk_1E253E300;
    objc_copyWeak(&v41, (id *)buf);
    v39[4] = *(_QWORD *)(a1 + 32);
    v40 = *(id *)(a1 + 48);
    objc_msgSend(v38, "addFinishBlock:", v39);
    objc_msgSend(*(id *)(a1 + 32), "_addToStoreRequest:promise:", *(_QWORD *)(a1 + 40), v38);

    objc_destroyWeak(&v41);
    objc_destroyWeak((id *)buf);

  }
}

void __77__AMSAuthenticateTaskCoordinator__enqueueItem_handleAuthenticationWithBlock___block_invoke_40(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  +[AMSLogConfig sharedAccountsOversizeConfig](AMSLogConfig, "sharedAccountsOversizeConfig");
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
    AMSLogKey();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)MEMORY[0x1E0CB3940];
    v11 = objc_opt_class();
    v12 = v11;
    v20 = (void *)v9;
    if (v9)
    {
      AMSLogKey();
      v19 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "stringWithFormat:", CFSTR("%@: [%@] "), v12, v19);
    }
    else
    {
      objc_msgSend(v10, "stringWithFormat:", CFSTR("%@: "), v11);
    }
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = *(_QWORD *)(a1 + 40);
    objc_msgSend(v5, "authenticationResults");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "ak_redactedCopy");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    AMSHashIfNeeded(v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v22 = v13;
    v23 = 2114;
    v24 = v14;
    v25 = 2114;
    v26 = v17;
    _os_log_impl(&dword_18C849000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ Running authHandler for request. request = %{public}@ results = %{public}@", buf, 0x20u);

    if (v20)
    {

      v13 = (void *)v19;
    }

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 48), "finishWithPromise:", v18);
}

void __77__AMSAuthenticateTaskCoordinator__enqueueItem_handleAuthenticationWithBlock___block_invoke_41(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  _QWORD v20[4];
  id v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  +[AMSLogConfig sharedAccountsOversizeConfig](AMSLogConfig, "sharedAccountsOversizeConfig");
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
    AMSLogKey();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)MEMORY[0x1E0CB3940];
    v8 = objc_opt_class();
    v9 = v8;
    if (v6)
    {
      AMSLogKey();
      v19 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "stringWithFormat:", CFSTR("%@: [%@] "), v9, v19);
    }
    else
    {
      objc_msgSend(v7, "stringWithFormat:", CFSTR("%@: "), v8);
    }
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(a1 + 40);
    objc_msgSend(v3, "authenticationResults");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "ak_redactedCopy");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    AMSHashIfNeeded(v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v23 = v10;
    v24 = 2114;
    v25 = v11;
    v26 = 2114;
    v27 = v14;
    _os_log_impl(&dword_18C849000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ Using Authenticate result to complete request. request = %{public}@ results = %{public}@", buf, 0x20u);

    if (v6)
    {

      v10 = (void *)v19;
    }

  }
  v15 = *(void **)(a1 + 32);
  v16 = *(_QWORD *)(a1 + 48);
  objc_msgSend(v3, "authenticationResults");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "_handleAuthenticateRequestWithItem:authenticationResults:", v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __77__AMSAuthenticateTaskCoordinator__enqueueItem_handleAuthenticationWithBlock___block_invoke_42;
  v20[3] = &unk_1E253E238;
  v21 = *(id *)(a1 + 56);
  objc_msgSend(v18, "addFinishBlock:", v20);

}

uint64_t __77__AMSAuthenticateTaskCoordinator__enqueueItem_handleAuthenticationWithBlock___block_invoke_42(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithResult:error:", a2, a3);
}

void __77__AMSAuthenticateTaskCoordinator__enqueueItem_handleAuthenticationWithBlock___block_invoke_43(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  id v4;
  _QWORD v5[5];
  id v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  +[AMSAuthenticateTaskCoordinator internalQueue](AMSAuthenticateTaskCoordinator, "internalQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __77__AMSAuthenticateTaskCoordinator__enqueueItem_handleAuthenticationWithBlock___block_invoke_2;
  v5[3] = &unk_1E253E2B0;
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = WeakRetained;
  v4 = WeakRetained;
  dispatch_async(v3, v5);

}

uint64_t __77__AMSAuthenticateTaskCoordinator__enqueueItem_handleAuthenticationWithBlock___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_removeFromPromiseStore:", *(_QWORD *)(a1 + 40));
}

void __77__AMSAuthenticateTaskCoordinator__enqueueItem_handleAuthenticationWithBlock___block_invoke_44(uint64_t a1, void *a2, void *a3)
{
  uint64_t v3;
  id v6;
  id v7;
  id WeakRetained;
  NSObject *v9;
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t block;
  uint64_t v20;
  uint64_t (*v21)(uint64_t);
  void *v22;
  uint64_t v23;
  id v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  +[AMSAuthenticateTaskCoordinator internalQueue](AMSAuthenticateTaskCoordinator, "internalQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  block = MEMORY[0x1E0C809B0];
  v20 = 3221225472;
  v21 = __77__AMSAuthenticateTaskCoordinator__enqueueItem_handleAuthenticationWithBlock___block_invoke_2_45;
  v22 = &unk_1E253E2B0;
  v23 = *(_QWORD *)(a1 + 32);
  v10 = WeakRetained;
  v24 = v10;
  dispatch_async(v9, &block);

  if (v7)
  {
    +[AMSLogConfig sharedAccountsOversizeConfig](AMSLogConfig, "sharedAccountsOversizeConfig");
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
        v3 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "stringWithFormat:", CFSTR("%@: [%@] "), v16, v3, block, v20, v21, v22, v23);
      }
      else
      {
        objc_msgSend(v14, "stringWithFormat:", CFSTR("%@: "), v15);
      }
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      AMSLogableError(v7);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v26 = v17;
      v27 = 2114;
      v28 = v18;
      _os_log_impl(&dword_18C849000, v12, OS_LOG_TYPE_ERROR, "%{public}@ Authentication returned an error: %{public}@", buf, 0x16u);
      if (v13)
      {

        v17 = (void *)v3;
      }

    }
    objc_msgSend(*(id *)(a1 + 40), "finishWithError:", v7);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "finishWithResult:error:", v6, 0);
  }

}

uint64_t __77__AMSAuthenticateTaskCoordinator__enqueueItem_handleAuthenticationWithBlock___block_invoke_2_45(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_removeFromPromiseStore:", *(_QWORD *)(a1 + 40));
}

- (id)_handleAuthenticateRequestWithItem:(id)a3 authenticationResults:(id)a4
{
  void *v4;
  void *v5;

  if (a4)
    -[AMSAuthenticateTaskCoordinator _authenticateTaskForItem:authenticationResults:](self, "_authenticateTaskForItem:authenticationResults:", a3);
  else
    -[AMSAuthenticateTaskCoordinator _authenticateTaskForItem:](self, "_authenticateTaskForItem:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "performAuthentication");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)_addToStoreRequest:(id)a3 promise:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  AMSPair *v16;
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  +[AMSLogConfig sharedAccountsConfig](AMSLogConfig, "sharedAccountsConfig");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v8, "OSLogObject");
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    AMSLogKey();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)MEMORY[0x1E0CB3940];
    v12 = objc_opt_class();
    v13 = v12;
    if (v10)
    {
      AMSLogKey();
      self = (AMSAuthenticateTaskCoordinator *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "stringWithFormat:", CFSTR("%@: [%@] "), v13, self);
    }
    else
    {
      objc_msgSend(v11, "stringWithFormat:", CFSTR("%@: "), v12);
    }
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v18 = v14;
    _os_log_impl(&dword_18C849000, v9, OS_LOG_TYPE_DEBUG, "%{public}@ Adding Request to store", buf, 0xCu);
    if (v10)
    {

      v14 = self;
    }

  }
  +[AMSAuthenticateTaskCoordinator promiseStore](AMSAuthenticateTaskCoordinator, "promiseStore");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[AMSPair initWithFirst:second:]([AMSPair alloc], "initWithFirst:second:", v7, v6);

  objc_msgSend(v15, "addObject:", v16);
}

- (id)_promiseStorePairForRequest:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v3 = a3;
  +[AMSAuthenticateTaskCoordinator promiseStore](AMSAuthenticateTaskCoordinator, "promiseStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __62__AMSAuthenticateTaskCoordinator__promiseStorePairForRequest___block_invoke;
  v8[3] = &unk_1E253E350;
  v9 = v3;
  v5 = v3;
  objc_msgSend(v4, "ams_firstObjectPassingTest:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __62__AMSAuthenticateTaskCoordinator__promiseStorePairForRequest___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = a2;
  objc_msgSend(v3, "first");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "second");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v5, "isCancelled") & 1) != 0 || (objc_msgSend(*(id *)(a1 + 32), "isEqual:", v4) & 1) != 0)
  {
    v6 = 0;
  }
  else
  {
    objc_msgSend(v4, "account");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "account");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v8, "isEqual:", v10);

  }
  return v6;
}

- (id)_promiseWithResultsForRequest:(id)a3
{
  void *v3;
  void *v4;

  -[AMSAuthenticateTaskCoordinator _promiseStorePairForRequest:](self, "_promiseStorePairForRequest:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "second");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)_removeFromPromiseStore:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    +[AMSAuthenticateTaskCoordinator promiseStore](AMSAuthenticateTaskCoordinator, "promiseStore");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __58__AMSAuthenticateTaskCoordinator__removeFromPromiseStore___block_invoke;
    v15[3] = &unk_1E253E350;
    v16 = v4;
    objc_msgSend(v5, "ams_firstObjectPassingTest:", v15);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    +[AMSLogConfig sharedAccountsConfig](AMSLogConfig, "sharedAccountsConfig");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v7, "OSLogObject");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      AMSLogKey();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)MEMORY[0x1E0CB3940];
      v11 = objc_opt_class();
      v12 = v11;
      if (v9)
      {
        AMSLogKey();
        self = (AMSAuthenticateTaskCoordinator *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "stringWithFormat:", CFSTR("%@: [%@] "), v12, self);
      }
      else
      {
        objc_msgSend(v10, "stringWithFormat:", CFSTR("%@: "), v11);
      }
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v18 = v13;
      v19 = 2114;
      v20 = v6;
      _os_log_impl(&dword_18C849000, v8, OS_LOG_TYPE_DEBUG, "%{public}@ Removing request from store. pair = %{public}@", buf, 0x16u);
      if (v9)
      {

        v13 = self;
      }

    }
    +[AMSAuthenticateTaskCoordinator promiseStore](AMSAuthenticateTaskCoordinator, "promiseStore");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "removeObject:", v6);

  }
}

uint64_t __58__AMSAuthenticateTaskCoordinator__removeFromPromiseStore___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v3 = a2;
  objc_msgSend(v3, "first");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "second");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(*(id *)(a1 + 32), "isEqual:", v5);
  return v6;
}

@end
