@implementation AMSDelegatePurchasePaymentDialogTask

- (AMSDelegatePurchasePaymentDialogTask)initWithDelegatePurchaseRequest:(id)a3 bag:(id)a4 andDesignVersion:(id)a5
{
  id v9;
  id v10;
  id v11;
  AMSDelegatePurchasePaymentDialogTask *v12;
  AMSDelegatePurchasePaymentDialogTask *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  ACAccount *account;
  NSString *requestingPlatform;
  NSString *targetPlatformVersion;
  objc_super v21;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v21.receiver = self;
  v21.super_class = (Class)AMSDelegatePurchasePaymentDialogTask;
  v12 = -[AMSTask init](&v21, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_currentRequest, a3);
    objc_msgSend(v9, "purchaseResult");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "purchase");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "account");
    v16 = objc_claimAutoreleasedReturnValue();
    account = v13->_account;
    v13->_account = (ACAccount *)v16;

    objc_storeStrong((id *)&v13->_bag, a4);
    objc_storeStrong((id *)&v13->_designVersion, a5);
    if (objc_msgSend(v11, "isEqualToNumber:", 0x1E25AF8D8))
    {
      requestingPlatform = v13->_requestingPlatform;
      v13->_requestingPlatform = (NSString *)CFSTR("AppleTV");

      targetPlatformVersion = v13->_targetPlatformVersion;
      v13->_targetPlatformVersion = (NSString *)CFSTR("16.0");

    }
  }

  return v13;
}

- (id)performTask
{
  void *v3;
  _QWORD v5[4];
  id v6;
  id location;

  objc_initWeak(&location, self);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __51__AMSDelegatePurchasePaymentDialogTask_performTask__block_invoke;
  v5[3] = &unk_1E2540BC8;
  objc_copyWeak(&v6, &location);
  -[AMSTask performTaskWithPromiseBlock:](self, "performTaskWithPromiseBlock:", v5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
  return v3;
}

id __51__AMSDelegatePurchasePaymentDialogTask_performTask__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  AMSMutablePromise *v9;
  void *v10;
  NSObject *v11;
  AMSMutablePromise *v12;
  void *v13;
  uint64_t v14;
  id v15;
  _QWORD v17[5];
  id v18;
  _QWORD v19[5];
  id v20;
  AMSMutablePromise *v21;
  uint8_t buf[4];
  uint64_t v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  AMSSetLogKeyIfNeeded();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "designVersion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue");
  v5 = objc_msgSend(&unk_1E25AF8D8, "integerValue");

  +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v4 <= v5)
  {
    if (!v6)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v7, "OSLogObject");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v23 = objc_opt_class();
      v24 = 2114;
      v25 = v2;
      _os_log_impl(&dword_18C849000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Begin requesting payment sheet for legacy device", buf, 0x16u);
    }

    v12 = objc_alloc_init(AMSMutablePromise);
    objc_msgSend(WeakRetained, "_encodedURLRequest");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = MEMORY[0x1E0C809B0];
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __51__AMSDelegatePurchasePaymentDialogTask_performTask__block_invoke_9;
    v19[3] = &unk_1E2540BA0;
    v19[4] = WeakRetained;
    v15 = v2;
    v20 = v15;
    v21 = v12;
    v9 = v12;
    objc_msgSend(v13, "resultWithCompletion:", v19);

    v17[0] = v14;
    v17[1] = 3221225472;
    v17[2] = __51__AMSDelegatePurchasePaymentDialogTask_performTask__block_invoke_12;
    v17[3] = &unk_1E2540250;
    v17[4] = WeakRetained;
    v18 = v15;
    -[AMSMutablePromise continueWithBlock:](v9, "continueWithBlock:", v17);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if (!v6)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v7, "OSLogObject");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v23 = objc_opt_class();
      v24 = 2114;
      v25 = v2;
      _os_log_impl(&dword_18C849000, v8, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Design version 1.0 is the only supported dialog style", buf, 0x16u);
    }

    AMSError(2, CFSTR("Unsupported Design Version"), CFSTR("Design version 1.0 is the only supported dialog style"), 0);
    v9 = (AMSMutablePromise *)objc_claimAutoreleasedReturnValue();
    +[AMSPromise promiseWithError:](AMSPromise, "promiseWithError:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

void __51__AMSDelegatePurchasePaymentDialogTask_performTask__block_invoke_9(uint64_t a1, void *a2, void *a3)
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
      v14 = 138543874;
      v15 = v9;
      v16 = 2114;
      v17 = v10;
      v18 = 2114;
      v19 = v6;
      _os_log_impl(&dword_18C849000, v8, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Legacy payment sheet URL failed with error: %{public}@", (uint8_t *)&v14, 0x20u);
    }

    objc_msgSend(*(id *)(a1 + 48), "finishWithError:", v6);
  }
  else
  {
    +[AMSURLSession defaultSession](AMSURLSession, "defaultSession");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "completionHandlerAdapter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "dataTaskWithRequest:completionHandler:", v5, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "resume");
  }

}

id __51__AMSDelegatePurchasePaymentDialogTask_performTask__block_invoke_12(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  AMSDelegatePurchaseRequest *v17;
  void *v18;
  void *v19;
  void *v20;
  AMSDelegatePurchaseRequest *v21;
  void *v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  int v27;
  uint64_t v28;
  __int16 v29;
  uint64_t v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
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
      v9 = *(_QWORD *)(a1 + 40);
      v27 = 138543874;
      v28 = v8;
      v29 = 2114;
      v30 = v9;
      v31 = 2114;
      v32 = v5;
      _os_log_impl(&dword_18C849000, v7, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Legacy payment sheet URL failed with error: %{public}@", (uint8_t *)&v27, 0x20u);
    }

    +[AMSPromise promiseWithError:](AMSPromise, "promiseWithError:", v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(a2, "object");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKey:", CFSTR("paymentSheetInfo"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      v13 = *(void **)(a1 + 32);
      objc_msgSend(v13, "currentRequest");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "purchaseResult");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "_purchaseResultFromPurchaseResult:andPaymentSheetInfo:", v15, v11);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      v17 = [AMSDelegatePurchaseRequest alloc];
      objc_msgSend(*(id *)(a1 + 32), "currentRequest");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "challenge");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "_legacyUserAgentString");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = -[AMSDelegatePurchaseRequest initWithPurchaseResult:challenge:userAgent:](v17, "initWithPurchaseResult:challenge:userAgent:", v16, v19, v20);

      +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", v21);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
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
        v25 = *(_QWORD *)(a1 + 40);
        v27 = 138543618;
        v28 = v24;
        v29 = 2114;
        v30 = v25;
        _os_log_impl(&dword_18C849000, v23, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Legacy payment sheet response missing payment sheet info", (uint8_t *)&v27, 0x16u);
      }

      AMSError(7, CFSTR("Missing payment sheet info"), CFSTR("The legacy payment sheet response is missing payment sheet info"), 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      +[AMSPromise promiseWithError:](AMSPromise, "promiseWithError:", v16);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  return v10;
}

- (id)_legacyUserAgentString
{
  void *v2;
  void *v3;

  -[AMSDelegatePurchasePaymentDialogTask currentRequest](self, "currentRequest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "userAgent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_purchaseResultFromPurchaseResult:(id)a3 andPaymentSheetInfo:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_msgSend(v6, "copy");
  objc_msgSend(v6, "responseDictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "ams_dictionaryByAddingEntriesFromDictionary:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setResponseDictionary:", v9);
  return v7;
}

- (id)_encodedURLRequest
{
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  AMSMutablePromise *v15;
  NSObject *v16;
  uint64_t v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  AMSURLRequestEncoder *v31;
  void *v32;
  void *v33;
  void *v34;
  AMSMutablePromise *v35;
  AMSMutablePromise *v36;
  AMSMutablePromise *v37;
  _QWORD v39[5];
  id v40;
  id v41;
  AMSMutablePromise *v42;
  id v43;
  uint8_t buf[4];
  uint64_t v45;
  __int16 v46;
  void *v47;
  __int16 v48;
  void *v49;
  __int16 v50;
  id v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
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
    v45 = objc_opt_class();
    v46 = 2114;
    v47 = v3;
    _os_log_impl(&dword_18C849000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Begin extracting URL endpoint from bag", buf, 0x16u);
  }

  -[AMSDelegatePurchasePaymentDialogTask bag](self, "bag");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "URLForKey:", 0x1E254C800);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = 0;
  objc_msgSend(v7, "valueWithError:", &v43);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v43;

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
      AMSHashIfNeeded(CFSTR("generatePaymentSheetUrl"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v45 = v13;
      v46 = 2114;
      v47 = v3;
      v48 = 2112;
      v49 = v14;
      v50 = 2114;
      v51 = v9;
      _os_log_impl(&dword_18C849000, v12, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to find key: %@, error: %{public}@", buf, 0x2Au);

    }
    +[AMSPromise promiseWithError:](AMSPromise, "promiseWithError:", v9);
    v15 = (AMSMutablePromise *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!v10)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v11, "OSLogObject");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = objc_opt_class();
      *(_DWORD *)buf = 138543618;
      v45 = v17;
      v46 = 2114;
      v47 = v3;
      _os_log_impl(&dword_18C849000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Completed extracting URL endpoint from bag", buf, 0x16u);
    }

    v18 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    -[AMSDelegatePurchasePaymentDialogTask currentRequest](self, "currentRequest");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "userAgent");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "ams_setNullableObject:forKey:", v20, CFSTR("requesterUserAgent"));

    -[AMSDelegatePurchasePaymentDialogTask targetPlatformVersion](self, "targetPlatformVersion");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "ams_setNullableObject:forKey:", v21, CFSTR("targetPlatformVersion"));

    -[AMSDelegatePurchasePaymentDialogTask requestingPlatform](self, "requestingPlatform");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "ams_setNullableObject:forKey:", v22, CFSTR("requesterPlatform"));

    -[AMSDelegatePurchasePaymentDialogTask designVersion](self, "designVersion");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "stringValue");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "ams_setNullableObject:forKey:", v24, CFSTR("designVersion"));

    -[AMSDelegatePurchasePaymentDialogTask currentRequest](self, "currentRequest");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "purchaseResult");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "purchase");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "buyParams");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "dictionary");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addEntriesFromDictionary:", v29);

    v30 = (void *)objc_msgSend(v18, "copy");
    v31 = objc_alloc_init(AMSURLRequestEncoder);
    -[AMSDelegatePurchasePaymentDialogTask account](self, "account");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSURLRequestEncoder setAccount:](v31, "setAccount:", v32);

    -[AMSDelegatePurchasePaymentDialogTask bag](self, "bag");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSURLRequestEncoder setBag:](v31, "setBag:", v33);

    -[AMSURLRequestEncoder setLogUUID:](v31, "setLogUUID:", v3);
    -[AMSURLRequestEncoder setUrlKnownToBeTrusted:](v31, "setUrlKnownToBeTrusted:", 1);
    -[AMSURLRequestEncoder requestWithMethod:URL:headers:parameters:](v31, "requestWithMethod:URL:headers:parameters:", 4, v8, 0, v30);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_alloc_init(AMSMutablePromise);
    v39[0] = MEMORY[0x1E0C809B0];
    v39[1] = 3221225472;
    v39[2] = __58__AMSDelegatePurchasePaymentDialogTask__encodedURLRequest__block_invoke;
    v39[3] = &unk_1E2540B00;
    v39[4] = self;
    v40 = v3;
    v41 = v8;
    v36 = v35;
    v42 = v36;
    objc_msgSend(v34, "resultWithCompletion:", v39);
    v37 = v42;
    v15 = v36;

  }
  return v15;
}

void __58__AMSDelegatePurchasePaymentDialogTask__encodedURLRequest__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
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
      v9 = *(_QWORD *)(a1 + 40);
      AMSHashIfNeeded(*(void **)(a1 + 48));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138544130;
      v12 = v8;
      v13 = 2114;
      v14 = v9;
      v15 = 2112;
      v16 = v10;
      v17 = 2114;
      v18 = v5;
      _os_log_impl(&dword_18C849000, v7, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to encode request for URL: %@, error: %{public}@", (uint8_t *)&v11, 0x2Au);

    }
    objc_msgSend(*(id *)(a1 + 56), "finishWithError:", v5);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 56), "finishWithResult:", a2);
  }

}

- (AMSDelegatePurchaseRequest)currentRequest
{
  return self->_currentRequest;
}

- (void)setCurrentRequest:(id)a3
{
  objc_storeStrong((id *)&self->_currentRequest, a3);
}

- (ACAccount)account
{
  return self->_account;
}

- (AMSBagProtocol)bag
{
  return self->_bag;
}

- (NSNumber)designVersion
{
  return self->_designVersion;
}

- (NSString)requestingPlatform
{
  return self->_requestingPlatform;
}

- (NSString)targetPlatformVersion
{
  return self->_targetPlatformVersion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetPlatformVersion, 0);
  objc_storeStrong((id *)&self->_requestingPlatform, 0);
  objc_storeStrong((id *)&self->_designVersion, 0);
  objc_storeStrong((id *)&self->_bag, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_currentRequest, 0);
}

@end
