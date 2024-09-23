@implementation AMSPaymentSheetTask

- (AMSPaymentSheetTask)initWithRequest:(id)a3 bag:(id)a4
{
  id v7;
  id v8;
  AMSPaymentSheetTask *v9;
  void *v10;
  void *v11;
  id v12;
  AMSPaymentSheetAssetCache *assetCache;
  _PaymentSheetState *v14;
  _PaymentSheetState *state;
  NSMutableArray *v16;
  NSMutableArray *userActions;
  objc_super v19;

  v7 = a3;
  v8 = a4;
  v19.receiver = self;
  v19.super_class = (Class)AMSPaymentSheetTask;
  v9 = -[AMSTask init](&v19, sel_init);
  if (v9)
  {
    objc_msgSend(v7, "logKey");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v7, "logKey");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = AMSSetLogKey(v11);

    }
    assetCache = v9->_assetCache;
    v9->_assetCache = 0;

    objc_storeStrong((id *)&v9->_bag, a4);
    objc_storeStrong((id *)&v9->_request, a3);
    v14 = objc_alloc_init(_PaymentSheetState);
    state = v9->_state;
    v9->_state = v14;

    v16 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    userActions = v9->_userActions;
    v9->_userActions = v16;

  }
  return v9;
}

- (BOOL)cancel
{
  uint64_t v2;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v15;
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  +[AMSLogConfig sharedPurchaseConfig](AMSLogConfig, "sharedPurchaseConfig");
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
    -[AMSPaymentSheetTask request](self, "request");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "logKey");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)MEMORY[0x1E0CB3940];
    v10 = objc_opt_class();
    if (v8)
    {
      -[AMSPaymentSheetTask request](self, "request");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "logKey");
      v2 = objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      a2 = (SEL)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "stringWithFormat:", CFSTR("%@: [%@] %@ "), v10, v2, a2);
    }
    else
    {
      NSStringFromSelector(a2);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "stringWithFormat:", CFSTR("%@: %@ "), v10, v11);
    }
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v17 = v12;
    _os_log_impl(&dword_18C849000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@Canceling payment authorization controller", buf, 0xCu);
    if (v8)
    {

      v12 = (void *)v2;
    }

  }
  -[AMSPaymentSheetTask paymentAuthorizationController](self, "paymentAuthorizationController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSPaymentSheetTask _dismissPaymentAuthorizationController:](self, "_dismissPaymentAuthorizationController:", v13);

  v15.receiver = self;
  v15.super_class = (Class)AMSPaymentSheetTask;
  return -[AMSTask cancel](&v15, sel_cancel);
}

- (id)_performRemoteTask
{
  return +[AMSPromise promiseWithErrorCode:title:message:](AMSPromise, "promiseWithErrorCode:title:message:", 5, CFSTR("Payment Sheet Failed"), CFSTR("Platform not supported"));
}

- (id)_performInProcessTask
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __44__AMSPaymentSheetTask__performInProcessTask__block_invoke;
  v3[3] = &unk_1E253DB80;
  v3[4] = self;
  -[AMSTask performTaskWithPromiseBlock:](self, "performTaskWithPromiseBlock:", v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

id __44__AMSPaymentSheetTask__performInProcessTask__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  AMSMutablePromise *v14;
  void *v15;
  int v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  NSObject *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  AMSPurchaseResult *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v37;
  _QWORD v38[5];
  id v39;
  _QWORD v40[5];
  uint8_t buf[4];
  void *v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "request");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "logKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  +[AMSLogConfig sharedPurchaseConfig](AMSLogConfig, "sharedPurchaseConfig");
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
    v6 = (void *)MEMORY[0x1E0CB3940];
    v7 = objc_opt_class();
    if (v3)
      objc_msgSend(v6, "stringWithFormat:", CFSTR("%@: [%@] "), v7, v3);
    else
      objc_msgSend(v6, "stringWithFormat:", CFSTR("%@: "), v7, v37);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v42 = v8;
    _os_log_impl(&dword_18C849000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@Starting payment sheet task", buf, 0xCu);

  }
  objc_msgSend(*(id *)(a1 + 32), "request");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v9, "requiresAuthorization") & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "authenticationContext");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "username");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v11)
    {
      +[AMSPromise promiseWithErrorCode:title:message:](AMSPromise, "promiseWithErrorCode:title:message:", 2, CFSTR("Payment Sheet Failed"), CFSTR("Invalid AuthKit context (Username is nil)"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_33;
    }
  }
  else
  {

  }
  objc_msgSend(*(id *)(a1 + 32), "_paymentRequest");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = objc_alloc_init(AMSMutablePromise);
    objc_msgSend(*(id *)(a1 + 32), "setPaymentSheetPromise:", v14);

    objc_msgSend(*(id *)(a1 + 32), "request");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "requiresDelegateAuthentication");

    +[AMSLogConfig sharedPurchaseConfig](AMSLogConfig, "sharedPurchaseConfig");
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = (void *)v17;
    v19 = MEMORY[0x1E0C809B0];
    if (v16)
    {
      if (!v17)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v18, "OSLogObject");
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        v21 = (void *)MEMORY[0x1E0CB3940];
        v22 = objc_opt_class();
        if (v3)
          objc_msgSend(v21, "stringWithFormat:", CFSTR("%@: [%@] "), v22, v3);
        else
          objc_msgSend(v21, "stringWithFormat:", CFSTR("%@: "), v22, v37);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v42 = v27;
        _os_log_impl(&dword_18C849000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@Presenting delegate authentication sheet", buf, 0xCu);

      }
      objc_msgSend(*(id *)(a1 + 32), "purchaseInfo");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "purchase");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      +[AMSPurchase purchaseFromPurchase:](AMSPurchase, "purchaseFromPurchase:", v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      v31 = objc_alloc_init(AMSPurchaseResult);
      objc_msgSend(*(id *)(a1 + 32), "request");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "responseDictionary");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      -[AMSPurchaseResult setResponseDictionary:](v31, "setResponseDictionary:", v33);

      -[AMSPurchaseResult setPurchase:](v31, "setPurchase:", v30);
      objc_msgSend(*(id *)(a1 + 32), "_presentCompanionAuthenticationSheetWithPaymentRequest:purchaseResult:", v13, v31);

    }
    else
    {
      if (!v17)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v18, "OSLogObject");
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        v25 = (void *)MEMORY[0x1E0CB3940];
        v26 = objc_opt_class();
        if (v3)
          objc_msgSend(v25, "stringWithFormat:", CFSTR("%@: [%@] "), v26, v3);
        else
          objc_msgSend(v25, "stringWithFormat:", CFSTR("%@: "), v26, v37);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v42 = v34;
        _os_log_impl(&dword_18C849000, v24, OS_LOG_TYPE_DEFAULT, "%{public}@Presenting normal payment sheet", buf, 0xCu);

      }
      objc_msgSend(*(id *)(a1 + 32), "_presentPaymentSheetWithPaymentRequest:", v13);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v40[0] = v19;
      v40[1] = 3221225472;
      v40[2] = __44__AMSPaymentSheetTask__performInProcessTask__block_invoke_169;
      v40[3] = &unk_1E253E120;
      v40[4] = *(_QWORD *)(a1 + 32);
      objc_msgSend(v30, "addErrorBlock:", v40);
    }

    objc_msgSend(*(id *)(a1 + 32), "paymentSheetPromise");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v38[0] = v19;
    v38[1] = 3221225472;
    v38[2] = __44__AMSPaymentSheetTask__performInProcessTask__block_invoke_2;
    v38[3] = &unk_1E25447D0;
    v38[4] = *(_QWORD *)(a1 + 32);
    v39 = v3;
    objc_msgSend(v35, "continueWithBlock:", v38);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "state");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setCancellationType:", 100);

    +[AMSPromise promiseWithErrorCode:title:message:](AMSPromise, "promiseWithErrorCode:title:message:", 2, CFSTR("Payment Sheet Failed"), CFSTR("Payment request is nil"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }

LABEL_33:
  return v12;
}

void __44__AMSPaymentSheetTask__performInProcessTask__block_invoke_169(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "paymentSheetPromise");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "finishWithError:", v3);

}

id __44__AMSPaymentSheetTask__performInProcessTask__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  unint64_t v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "_metricsEvent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "bag");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSMetrics internalInstanceUsingBag:](AMSMetrics, "internalInstanceUsingBag:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "enqueueEvent:", v7);

  objc_msgSend(*(id *)(a1 + 32), "bag");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSMetrics internalInstanceUsingBag:](AMSMetrics, "internalInstanceUsingBag:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (id)objc_msgSend(v11, "flush");

  if (v5 | v6)
  {
    if (v6)
    {
      +[AMSLogConfig sharedPurchaseConfig](AMSLogConfig, "sharedPurchaseConfig");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v13)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v13, "OSLogObject");
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        v15 = (void *)MEMORY[0x1E0CB3940];
        v16 = *(_QWORD *)(a1 + 40);
        v17 = objc_opt_class();
        if (v16)
          objc_msgSend(v15, "stringWithFormat:", CFSTR("%@: [%@] "), v17, *(_QWORD *)(a1 + 40));
        else
          objc_msgSend(v15, "stringWithFormat:", CFSTR("%@: "), v17, v30);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        AMSLogableError((void *)v6);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v32 = v25;
        v33 = 2114;
        v34 = v26;
        _os_log_impl(&dword_18C849000, v14, OS_LOG_TYPE_ERROR, "%{public}@Completed with error: %{public}@", buf, 0x16u);

      }
      +[AMSPromise promiseWithError:](AMSPromise, "promiseWithError:", v6);
      v18 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "purchaseInfo");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setDidShowPaymentSheet:", 1);

      +[AMSLogConfig sharedPurchaseConfig](AMSLogConfig, "sharedPurchaseConfig");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v20)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v20, "OSLogObject");
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        v22 = (void *)MEMORY[0x1E0CB3940];
        v23 = *(_QWORD *)(a1 + 40);
        v24 = objc_opt_class();
        if (v23)
          objc_msgSend(v22, "stringWithFormat:", CFSTR("%@: [%@] "), v24, *(_QWORD *)(a1 + 40));
        else
          objc_msgSend(v22, "stringWithFormat:", CFSTR("%@: "), v24, v30);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v32 = v27;
        _os_log_impl(&dword_18C849000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@Completed successfully", buf, 0xCu);

      }
      +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", v5);
      v18 = objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    +[AMSPromise promiseWithErrorCode:title:message:](AMSPromise, "promiseWithErrorCode:title:message:", 0, CFSTR("Payment Sheet Failed"), CFSTR("Finished without a result"));
    v18 = objc_claimAutoreleasedReturnValue();
  }
  v28 = (void *)v18;

  return v28;
}

- (AKAppleIDAuthenticationContext)authenticationContext
{
  AKAppleIDAuthenticationContext *authenticationContext;
  void *v4;
  void *v5;
  AKAppleIDAuthenticationContext *v6;
  AKAppleIDAuthenticationContext *v7;
  AKAppleIDAuthenticationContext *v9;

  authenticationContext = self->_authenticationContext;
  if (!authenticationContext)
  {
    -[AMSPurchaseInfo purchase](self->_purchaseInfo, "purchase");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      -[AMSPurchaseInfo purchase](self->_purchaseInfo, "purchase");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "authenticationContextForRequest:", self->_request);
      v6 = (AKAppleIDAuthenticationContext *)objc_claimAutoreleasedReturnValue();
      v7 = self->_authenticationContext;
      self->_authenticationContext = v6;

    }
    else
    {
      authenticationContext = self->_authenticationContext;
      if (authenticationContext)
        return authenticationContext;
      +[AMSPurchase defaultAuthenticationContextForRequest:](AMSPurchase, "defaultAuthenticationContextForRequest:", self->_request);
      v9 = (AKAppleIDAuthenticationContext *)objc_claimAutoreleasedReturnValue();
      v5 = self->_authenticationContext;
      self->_authenticationContext = v9;
    }

    authenticationContext = self->_authenticationContext;
  }
  return authenticationContext;
}

- (id)_authorizePaymentWithAuthKitResults:(id)a3
{
  void *v3;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  char v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v44;
  void *v45;
  void *v46;
  uint8_t buf[4];
  void *v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0CFFFA0]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)0x1E0CB3000;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v6;

    if (v8)
    {
      -[AMSPaymentSheetTask state](self, "state");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      +[AMSPaymentSheetMetricsEvent dictionaryForUserAction:didBiometricsLockout:](AMSPaymentSheetMetricsEvent, "dictionaryForUserAction:didBiometricsLockout:", 6, objc_msgSend(v9, "didBiometricsLockout"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
      {
        -[AMSPaymentSheetTask userActions](self, "userActions");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "addObject:", v10);

      }
      -[AMSPaymentSheetTask purchaseInfo](self, "purchaseInfo");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "idmsTokens");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v13)
      {
        objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0CFFF70]);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v15 = v14;
        else
          v15 = 0;

        -[AMSPaymentSheetTask purchaseInfo](self, "purchaseInfo");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "setIdmsTokens:", v15);

      }
      -[AMSPaymentSheetTask state](self, "state");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "setPasswordEquivalentToken:", v8);

      +[AMSLogConfig sharedPurchaseConfig](AMSLogConfig, "sharedPurchaseConfig");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v34)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v34, "OSLogObject");
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        v46 = v10;
        -[AMSPaymentSheetTask request](self, "request");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "logKey");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = (void *)MEMORY[0x1E0CB3940];
        v39 = objc_opt_class();
        v40 = v39;
        if (v37)
        {
          -[AMSPaymentSheetTask request](self, "request");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "logKey");
          v3 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "stringWithFormat:", CFSTR("%@: [%@] "), v40, v3);
        }
        else
        {
          objc_msgSend(v38, "stringWithFormat:", CFSTR("%@: "), v39);
        }
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v48 = v41;
        _os_log_impl(&dword_18C849000, v35, OS_LOG_TYPE_DEFAULT, "%{public}@Payment authorized with PET from AuthKit", buf, 0xCu);
        if (v37)
        {

          v41 = v44;
        }

        v10 = v46;
      }

      -[AMSPaymentSheetTask state](self, "state");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "setDidAuthorizePayment:", 1);

      +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", &unk_1E25AF908);
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_36;
    }
  }
  else
  {

  }
  -[AMSPaymentSheetTask request](self, "request");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "requiresAuthorization");

  if ((v17 & 1) != 0)
  {
    AMSError(100, CFSTR("Payment Sheet Failed"), CFSTR("AuthKit authorization failed"), 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    +[AMSPromise promiseWithError:](AMSPromise, "promiseWithError:", v18);
    v19 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[AMSPaymentSheetTask state](self, "state");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    +[AMSPaymentSheetMetricsEvent dictionaryForUserAction:didBiometricsLockout:](AMSPaymentSheetMetricsEvent, "dictionaryForUserAction:didBiometricsLockout:", 1, objc_msgSend(v20, "didBiometricsLockout"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      -[AMSPaymentSheetTask userActions](self, "userActions");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "addObject:", v18);

    }
    +[AMSLogConfig sharedPurchaseConfig](AMSLogConfig, "sharedPurchaseConfig");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v22)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v22, "OSLogObject");
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      -[AMSPaymentSheetTask request](self, "request");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "logKey");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = (void *)MEMORY[0x1E0CB3940];
      v27 = objc_opt_class();
      v28 = v27;
      if (v25)
      {
        -[AMSPaymentSheetTask request](self, "request");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "logKey");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "stringWithFormat:", CFSTR("%@: [%@] "), v28, v7);
      }
      else
      {
        objc_msgSend(v26, "stringWithFormat:", CFSTR("%@: "), v27);
      }
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v48 = v29;
      _os_log_impl(&dword_18C849000, v23, OS_LOG_TYPE_DEFAULT, "%{public}@Payment authorized without authentication (confirmation only)", buf, 0xCu);
      if (v25)
      {

        v29 = v45;
      }

    }
    -[AMSPaymentSheetTask state](self, "state");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setDidAuthorizePayment:", 1);

    +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", &unk_1E25AF908);
    v19 = objc_claimAutoreleasedReturnValue();
  }
  v31 = (void *)v19;

  v8 = 0;
LABEL_36:

  return v31;
}

- (id)_authorizePaymentWithBiometricsRequest:(id)a3 payment:(id)a4
{
  void *v4;
  void *v5;
  id v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  AMSBiometricsSignatureTask *v24;
  void *v25;
  void *v26;
  int64_t v27;
  uint64_t v28;
  AMSMutableBinaryPromise *v29;
  void *v30;
  void *v31;
  AMSMutableBinaryPromise *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  id v40;
  _QWORD v41[5];
  id v42;
  _QWORD v43[4];
  AMSMutableBinaryPromise *v44;
  _QWORD v45[2];
  uint8_t buf[4];
  void *v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v40 = a4;
  v8 = a3;
  +[AMSLogConfig sharedPurchaseConfig](AMSLogConfig, "sharedPurchaseConfig");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v9, "OSLogObject");
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    -[AMSPaymentSheetTask request](self, "request");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "logKey");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)MEMORY[0x1E0CB3940];
    v14 = objc_opt_class();
    v15 = v14;
    if (v12)
    {
      -[AMSPaymentSheetTask request](self, "request");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "logKey");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "stringWithFormat:", CFSTR("%@: [%@] "), v15, v5);
    }
    else
    {
      objc_msgSend(v13, "stringWithFormat:", CFSTR("%@: "), v14);
    }
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v47 = v16;
    _os_log_impl(&dword_18C849000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@Signing biometrics challenge", buf, 0xCu);
    if (v12)
    {

      v16 = v4;
    }

  }
  -[AMSPaymentSheetTask state](self, "state");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSPaymentSheetMetricsEvent dictionaryForBiometricMatchState:didBiometricsLockout:biometricsType:](AMSPaymentSheetMetricsEvent, "dictionaryForBiometricMatchState:didBiometricsLockout:biometricsType:", 1, objc_msgSend(v17, "didBiometricsLockout"), +[AMSBiometrics type](AMSBiometrics, "type"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    -[AMSPaymentSheetTask userActions](self, "userActions");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addObject:", v18);

  }
  -[AMSPaymentSheetTask request](self, "request");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "biometricsRequest");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "localAuthContext");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSPaymentSheetTask purchaseInfo](self, "purchaseInfo");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setLocalAuthContext:", v22);

  v24 = -[AMSBiometricsSignatureTask initWithRequest:]([AMSBiometricsSignatureTask alloc], "initWithRequest:", v8);
  -[AMSPaymentSheetTask bag](self, "bag");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSBiometricsSignatureTask request](v24, "request");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setBag:", v25);

  v27 = +[AMSBiometrics type](AMSBiometrics, "type");
  v28 = MEMORY[0x1E0C809B0];
  if (v27 == 2)
  {
    v29 = objc_alloc_init(AMSMutableBinaryPromise);
    -[AMSPaymentSheetTask bag](self, "bag");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "doubleForKey:", 0x1E254D3E0);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v43[0] = v28;
    v43[1] = 3221225472;
    v43[2] = __70__AMSPaymentSheetTask__authorizePaymentWithBiometricsRequest_payment___block_invoke;
    v43[3] = &unk_1E25447F8;
    v32 = v29;
    v44 = v32;
    objc_msgSend(v31, "valueWithCompletion:", v43);

  }
  else
  {
    +[AMSBinaryPromise promiseWithSuccess](AMSBinaryPromise, "promiseWithSuccess");
    v32 = (AMSMutableBinaryPromise *)objc_claimAutoreleasedReturnValue();
  }
  -[AMSBiometricsSignatureTask performSignature](v24, "performSignature");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v45[0] = v33;
  -[AMSBinaryPromise promiseAdapter](v32, "promiseAdapter");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v45[1] = v34;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v45, 2);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSPromise promiseWithAll:](AMSPromise, "promiseWithAll:", v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v41[0] = v28;
  v41[1] = 3221225472;
  v41[2] = __70__AMSPaymentSheetTask__authorizePaymentWithBiometricsRequest_payment___block_invoke_3;
  v41[3] = &unk_1E2544820;
  v41[4] = self;
  v42 = v40;
  v37 = v40;
  objc_msgSend(v36, "continueWithBlock:", v41);
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  return v38;
}

void __70__AMSPaymentSheetTask__authorizePaymentWithBiometricsRequest_payment___block_invoke(uint64_t a1, void *a2)
{
  double v3;
  double v4;
  uint64_t v5;
  _QWORD *v6;
  void *v7;
  dispatch_time_t v8;
  id v9;
  _QWORD v10[4];
  id v11;
  _QWORD block[4];
  id v13;
  id v14;

  objc_msgSend(a2, "doubleValue");
  v4 = v3;
  v5 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __70__AMSPaymentSheetTask__authorizePaymentWithBiometricsRequest_payment___block_invoke_2;
  v10[3] = &unk_1E253DBD8;
  v11 = *(id *)(a1 + 32);
  v6 = v10;
  AMSLogKey();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 * 1000000000.0 <= 9.22337204e18)
    v8 = dispatch_time(0, (uint64_t)(v4 * 1000000000.0));
  else
    v8 = -1;
  block[0] = v5;
  block[1] = 3221225472;
  block[2] = __AMSDispatchAfter_block_invoke_6;
  block[3] = &unk_1E253DC28;
  v13 = v7;
  v14 = v6;
  v9 = v7;
  dispatch_after(v8, MEMORY[0x1E0C80D38], block);

}

uint64_t __70__AMSPaymentSheetTask__authorizePaymentWithBiometricsRequest_payment___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithSuccess");
}

id __70__AMSPaymentSheetTask__authorizePaymentWithBiometricsRequest_payment___block_invoke_3(id *a1, void *a2, void *a3)
{
  void *v3;
  void *v4;
  void *v5;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  int v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  NSObject *v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v53;
  uint8_t buf[4];
  void *v55;
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  objc_msgSend(a2, "objectAtIndexedSubscript:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v10 = 0;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v10 = v9;

  objc_msgSend(a1[4], "state");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setSignatureResult:", v10);

  if (v8)
  {
    AMSError(601, CFSTR("Payment Sheet Failed"), CFSTR("Failed to sign challenge."), v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[AMSPromise promiseWithError:](AMSPromise, "promiseWithError:", v12);
    v13 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(a1[4], "paymentSheetPromise");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "isFinished");

    if (v15)
    {
      +[AMSLogConfig sharedPurchaseConfig](AMSLogConfig, "sharedPurchaseConfig");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v16)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v16, "OSLogObject");
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(a1[4], "request");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "logKey");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = (void *)MEMORY[0x1E0CB3940];
        v21 = objc_opt_class();
        v22 = v21;
        if (v19)
        {
          objc_msgSend(a1[4], "request");
          v3 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "logKey");
          v4 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "stringWithFormat:", CFSTR("%@: [%@] "), v22, v4);
        }
        else
        {
          objc_msgSend(v20, "stringWithFormat:", CFSTR("%@: "), v21);
        }
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v55 = v5;
        _os_log_impl(&dword_18C849000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@Payment authorization cancelled before challenge was signed", buf, 0xCu);
        if (v19)
        {

          v5 = v3;
        }

        v29 = 1;
      }
      else
      {
        v29 = 1;
      }
    }
    else
    {
      objc_msgSend(a1[4], "state");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setDidAuthorizePayment:", 1);

      +[AMSLogConfig sharedPurchaseConfig](AMSLogConfig, "sharedPurchaseConfig");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v16)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v16, "OSLogObject");
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(a1[4], "request");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "logKey");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = (void *)MEMORY[0x1E0CB3940];
        v27 = objc_opt_class();
        v28 = v27;
        if (v25)
        {
          objc_msgSend(a1[4], "request");
          v3 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "logKey");
          v4 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "stringWithFormat:", CFSTR("%@: [%@] "), v28, v4);
        }
        else
        {
          objc_msgSend(v26, "stringWithFormat:", CFSTR("%@: "), v27);
        }
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v55 = v5;
        _os_log_impl(&dword_18C849000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@Payment authorization with signed biometrics challenge", buf, 0xCu);
        if (v25)
        {

          v5 = v3;
        }

        v29 = 0;
      }
      else
      {
        v29 = 0;
      }
    }

    objc_msgSend(a1[5], "token");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "paymentData");
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    +[AMSLogConfig sharedPurchaseConfig](AMSLogConfig, "sharedPurchaseConfig");
    v32 = objc_claimAutoreleasedReturnValue();
    v33 = (void *)v32;
    if (v31)
    {
      if (!v32)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v33, "OSLogObject");
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        v53 = v29;
        objc_msgSend(a1[4], "request");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "logKey");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = (void *)MEMORY[0x1E0CB3940];
        v38 = objc_opt_class();
        v39 = v38;
        if (v36)
        {
          objc_msgSend(a1[4], "request");
          v4 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "logKey");
          v5 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "stringWithFormat:", CFSTR("%@: [%@] "), v39, v5);
        }
        else
        {
          objc_msgSend(v37, "stringWithFormat:", CFSTR("%@: "), v38);
        }
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v55 = v40;
        _os_log_impl(&dword_18C849000, v34, OS_LOG_TYPE_DEFAULT, "%{public}@Received biometric payment token", buf, 0xCu);
        if (v36)
        {

          v40 = v4;
        }

        v29 = v53;
      }

      objc_msgSend(a1[5], "token");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "paymentData");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "base64EncodedStringWithOptions:", 0);
      v33 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(a1[4], "state");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "setPaymentToken:", v33);

      objc_msgSend(a1[4], "purchaseInfo");
      v41 = objc_claimAutoreleasedReturnValue();
      -[NSObject setPaymentToken:](v41, "setPaymentToken:", v33);
    }
    else
    {
      if (!v32)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v33, "OSLogObject");
      v41 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(a1[4], "request");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "logKey");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = (void *)MEMORY[0x1E0CB3940];
        v45 = objc_opt_class();
        v46 = v45;
        if (v43)
        {
          objc_msgSend(a1[4], "request");
          a1 = (id *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(a1, "logKey");
          v4 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "stringWithFormat:", CFSTR("%@: [%@] "), v46, v4);
        }
        else
        {
          objc_msgSend(v44, "stringWithFormat:", CFSTR("%@: "), v45);
        }
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v55 = v47;
        _os_log_impl(&dword_18C849000, v41, OS_LOG_TYPE_DEFAULT, "%{public}@Skipping biometric payment token", buf, 0xCu);
        if (v43)
        {

          v47 = a1;
        }

      }
    }

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v29);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", v12);
    v13 = objc_claimAutoreleasedReturnValue();
  }
  v51 = (void *)v13;

  return v51;
}

- (id)_metricsEvent
{
  uint64_t v2;
  AMSPaymentSheetMetricsEvent *v5;
  void *v6;
  AMSPaymentSheetMetricsEvent *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  AMSPaymentSheetMetricsEvent *v16;
  uint64_t v17;
  void *v18;
  int v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  int v39;
  void *v40;
  void *v41;
  void *v42;
  AMSPaymentSheetMetricsEvent *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v51;
  NSObject *v52;
  void *v53;
  void *v54;
  uint64_t v55;
  void *v56;
  void *v57;
  void *v58;
  _QWORD v59[4];
  AMSPaymentSheetMetricsEvent *v60;
  uint8_t buf[4];
  void *v62;
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v5 = [AMSPaymentSheetMetricsEvent alloc];
  -[AMSPaymentSheetTask metricsDictionary](self, "metricsDictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[AMSMetricsEvent initWithUnderlyingDictionary:](v5, "initWithUnderlyingDictionary:", v6);

  -[AMSPaymentSheetTask request](self, "request");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "biometricsRequest");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[AMSPaymentSheetTask state](self, "state");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "didAuthorizePayment");

  if (v9)
  {
    -[AMSPaymentSheetTask state](self, "state");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v11)
    {
      objc_msgSend(v12, "signatureResult");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "signature");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15)
      {
        v16 = v7;
        v17 = 1;
LABEL_19:
        -[AMSPaymentSheetMetricsEvent addBiometricMatchState:](v16, "addBiometricMatchState:", v17);
        goto LABEL_20;
      }
      -[AMSPaymentSheetTask state](self, "state");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "passwordEquivalentToken");
      v36 = (void *)objc_claimAutoreleasedReturnValue();

      v16 = v7;
      if (v36)
      {
        v17 = 2;
        goto LABEL_19;
      }
      -[AMSPaymentSheetMetricsEvent addBiometricMatchState:](v7, "addBiometricMatchState:", 0);
      +[AMSLogConfig sharedPurchaseConfig](AMSLogConfig, "sharedPurchaseConfig");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v51)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v51, "OSLogObject");
      v52 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
      {
        -[AMSPaymentSheetTask request](self, "request");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v58, "logKey");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        v54 = (void *)MEMORY[0x1E0CB3940];
        v55 = objc_opt_class();
        if (v53)
        {
          -[AMSPaymentSheetTask request](self, "request");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v56, "logKey");
          v2 = objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(a2);
          a2 = (SEL)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v54, "stringWithFormat:", CFSTR("%@: [%@] %@ "), v55, v2, a2);
        }
        else
        {
          NSStringFromSelector(a2);
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v54, "stringWithFormat:", CFSTR("%@: %@ "), v55, v56);
        }
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v62 = v57;
        _os_log_impl(&dword_18C849000, v52, OS_LOG_TYPE_ERROR, "%{public}@Recording metrics for a successful biometric authorization that is neither Signature- nor PET-based", buf, 0xCu);
        if (v53)
        {

          v57 = (void *)v2;
        }

      }
    }
    else
    {
      v20 = objc_msgSend(v12, "cancellationType");

      if (!v20)
      {
        -[AMSPaymentSheetTask state](self, "state");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "setCancellationType:", 2);

      }
      -[AMSPaymentSheetMetricsEvent addBiometricMatchState:](v7, "addBiometricMatchState:", 3);
      -[AMSPaymentSheetTask state](self, "state");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "cancellationType");
      -[AMSPaymentSheetTask state](self, "state");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      +[AMSPaymentSheetMetricsEvent dictionaryForCancellationEvent:didBiometricsLockout:biometricsType:](AMSPaymentSheetMetricsEvent, "dictionaryForCancellationEvent:didBiometricsLockout:biometricsType:", v23, objc_msgSend(v24, "didBiometricsLockout"), +[AMSBiometrics type](AMSBiometrics, "type"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      if (v25)
      {
        -[AMSPaymentSheetTask userActions](self, "userActions");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "addObject:", v25);

      }
    }
LABEL_20:
    -[AMSPaymentSheetTask request](self, "request");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "biometricsRequest");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = objc_msgSend(v38, "isDualAction");

    if (v39)
    {
      -[AMSPaymentSheetTask state](self, "state");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "paymentToken");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      -[AMSPaymentSheetMetricsEvent addDualActionSuccess:](v7, "addDualActionSuccess:", v34 != 0);
      goto LABEL_22;
    }
    goto LABEL_24;
  }
  if ((v11 & 1) == 0)
  {
    -[AMSPaymentSheetTask state](self, "state");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "cancellationType");

    if (!v28)
    {
      -[AMSPaymentSheetTask state](self, "state");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "setCancellationType:", 2);

    }
    -[AMSPaymentSheetTask state](self, "state");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v30, "cancellationType");
    -[AMSPaymentSheetTask state](self, "state");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    +[AMSPaymentSheetMetricsEvent dictionaryForCancellationEvent:didBiometricsLockout:biometricsType:](AMSPaymentSheetMetricsEvent, "dictionaryForCancellationEvent:didBiometricsLockout:biometricsType:", v31, objc_msgSend(v32, "didBiometricsLockout"), 1);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v33)
      goto LABEL_23;
    -[AMSPaymentSheetTask userActions](self, "userActions");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "addObject:", v33);
LABEL_22:

LABEL_23:
    goto LABEL_24;
  }
  -[AMSPaymentSheetTask request](self, "request");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "requiresAuthorization");

  if (v19)
    -[AMSPaymentSheetMetricsEvent addBiometricMatchState:](v7, "addBiometricMatchState:", 2);
LABEL_24:
  -[AMSPaymentSheetTask purchaseInfo](self, "purchaseInfo");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "purchase");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "metricsOverlay");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v59[0] = MEMORY[0x1E0C809B0];
  v59[1] = 3221225472;
  v59[2] = __36__AMSPaymentSheetTask__metricsEvent__block_invoke;
  v59[3] = &unk_1E253FA48;
  v43 = v7;
  v60 = v43;
  objc_msgSend(v42, "enumerateKeysAndObjectsUsingBlock:", v59);

  -[AMSPaymentSheetTask request](self, "request");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSPaymentSheetMetricsEvent addClientMetadataForPaymentSheetRequest:](v43, "addClientMetadataForPaymentSheetRequest:", v44);

  -[AMSPaymentSheetTask purchaseInfo](self, "purchaseInfo");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSPaymentSheetTask metricsDictionary](self, "metricsDictionary");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSPaymentSheetMetricsEvent addClientMetadataForPurchaseInfo:metricsDictionary:](v43, "addClientMetadataForPurchaseInfo:metricsDictionary:", v45, v46);

  -[AMSPaymentSheetMetricsEvent addBiometricsState:](v43, "addBiometricsState:", +[AMSDefaults deviceBiometricsState](AMSDefaults, "deviceBiometricsState"));
  -[AMSPaymentSheetTask userActions](self, "userActions");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSPaymentSheetMetricsEvent addUserActions:](v43, "addUserActions:", v47);

  -[AMSPaymentSheetTask request](self, "request");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "account");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSMetricsEvent setAccount:](v43, "setAccount:", v49);

  return v43;
}

void __36__AMSPaymentSheetTask__metricsEvent__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v6 = a2;
  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(*(id *)(a1 + 32), "setProperty:forBodyKey:", v5, v6);

}

- (id)_paymentRequest
{
  void *v3;
  objc_class *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  __CFString *v28;
  NSObject *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  _BOOL4 v35;
  void *v36;
  objc_class *v37;
  uint64_t v38;
  void *v39;
  NSObject *v40;
  void *v41;
  id v42;
  void *v43;
  void *v44;
  void *v45;
  int v46;
  void *v47;
  NSObject *v48;
  void *v49;
  id v50;
  void *v51;
  void *v52;
  void *v53;
  NSObject *v54;
  void *v55;
  id v56;
  void *v57;
  void *v58;
  NSObject *v59;
  void *v60;
  id v61;
  void *v62;
  void *v63;
  void *v64;
  int v65;
  void *v66;
  void *v67;
  void *v68;
  id v69;
  void *v70;
  NSObject *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  NSObject *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  NSObject *v87;
  void *v88;
  id v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  int v134;
  void *v135;
  void *v136;
  void *v137;
  int v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  void *v155;
  void *v156;
  void *v157;
  void *v158;
  void *v159;
  void *v160;
  BOOL v161;
  void *v162;
  void *v163;
  void *v164;
  _BOOL4 v165;
  void *v166;
  void *v167;
  void *v168;
  int v169;
  __CFString *v170;
  void *v171;
  NSObject *v172;
  uint64_t v173;
  void *v174;
  void *v175;
  id v176;
  void *v177;
  void *v178;
  void *v179;
  void *v180;
  void *v181;
  void *v182;
  void *v183;
  NSObject *v184;
  void *v185;
  void *v186;
  void *v187;
  void *v188;
  void *v189;
  void *v190;
  void *v191;
  void *v192;
  id v193;
  void *v195;
  void *v196;
  uint64_t v197;
  void *v198;
  void *v199;
  void *v200;
  void *v201;
  void *v202;
  void *v203;
  void *v204;
  void *v205;
  id v206;
  void *v207;
  id v208;
  id v209;
  void *v210;
  void *v211;
  AMSPaymentRequest *v212;
  void *v213;
  void *v214;
  id v215;
  id v216;
  id v217;
  id v218;
  uint64_t v219;
  uint64_t *v220;
  uint64_t v221;
  uint64_t v222;
  _QWORD v223[2];
  _QWORD v224[2];
  _QWORD v225[3];
  _QWORD v226[3];
  _BYTE buf[24];
  __CFString *v228;
  uint64_t *v229;
  uint64_t v230;

  v230 = *MEMORY[0x1E0C80C00];
  v219 = 0;
  v220 = &v219;
  v221 = 0x2050000000;
  v3 = (void *)_MergedGlobals_1_14;
  v222 = _MergedGlobals_1_14;
  if (!_MergedGlobals_1_14)
  {
    *(_QWORD *)buf = MEMORY[0x1E0C809B0];
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = __getPKPaymentRequestClass_block_invoke;
    v228 = (__CFString *)&unk_1E253DDB8;
    v229 = &v219;
    __getPKPaymentRequestClass_block_invoke((uint64_t)buf);
    v3 = (void *)v220[3];
  }
  v4 = objc_retainAutorelease(v3);
  _Block_object_dispose(&v219, 8);
  v5 = objc_alloc_init(v4);
  -[AMSPaymentSheetTask request](self, "request");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "biometricsRequest");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAccesssControlRef:", objc_msgSend(v7, "localAuthAccessControlRef"));

  v212 = objc_alloc_init(AMSPaymentRequest);
  -[AMSPaymentSheetTask request](self, "request");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "biometricsRequest");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localAuthContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "externalizedContext");
  v211 = (void *)objc_claimAutoreleasedReturnValue();

  -[AMSPaymentSheetTask request](self, "request");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "requiresAuthorization");
  if (v211)
    v13 = 1;
  else
    v13 = v12;

  if (v13)
  {
    -[AMSPaymentSheetTask authenticationContext](self, "authenticationContext");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAppleIDAuthenticationContext:", v14);

  }
  objc_msgSend(v5, "setExternalizedContext:", v211);
  objc_msgSend(v5, "setRequestType:", 1);
  -[AMSPaymentSheetTask request](self, "request");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "currencyCode");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCurrencyCode:", v16);

  -[AMSPaymentSheetTask request](self, "request");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "countryCode");
  v18 = objc_claimAutoreleasedReturnValue();
  AMSSetCountryCodeOnPaymentRequest((void *)v18, v5);

  -[AMSPaymentSheetTask request](self, "request");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v18) = objc_msgSend(v19, "titleType") == 2;

  if ((v18 & 1) != 0)
  {
    objc_msgSend(v5, "setRequestor:", 0);
  }
  else
  {
    -[AMSPaymentSheetTask request](self, "request");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v20, "titleType"))
    {
      -[AMSPaymentRequest setLocalizedNavigationTitle:](v212, "setLocalizedNavigationTitle:", 0);
    }
    else
    {
      -[AMSPaymentSheetTask request](self, "request");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "title");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[AMSPaymentRequest setLocalizedNavigationTitle:](v212, "setLocalizedNavigationTitle:", v22);

    }
  }
  -[AMSPaymentSheetTask request](self, "request");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "merchantSession");
  v203 = (void *)objc_claimAutoreleasedReturnValue();

  if (v203)
  {
    -[AMSPaymentSheetTask request](self, "request");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "biometricsRequest");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "localAuthAccessControlRef");

    -[AMSPaymentSheetTask bag](self, "bag");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v25) = +[AMSCardEnrollment shouldUseApplePayClassicWithBag:](AMSCardEnrollment, "shouldUseApplePayClassicWithBag:", v27);

    if ((_DWORD)v25)
    {
      if (!+[AMSBiometrics isActionSupported:withAccessControl:](AMSBiometrics, "isActionSupported:withAccessControl:", 4, v26))
      {
LABEL_38:
        +[AMSBiometrics ACLVersionForAccessControl:](AMSBiometrics, "ACLVersionForAccessControl:", v26);
        v28 = (__CFString *)objc_claimAutoreleasedReturnValue();
        +[AMSLogConfig sharedPurchaseConfig](AMSLogConfig, "sharedPurchaseConfig");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v53)
        {
          +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v53, "OSLogObject");
        v54 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
        {
          v55 = (void *)objc_opt_class();
          v56 = v55;
          -[AMSPaymentSheetTask request](self, "request");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v57, "logKey");
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          *(_QWORD *)&buf[4] = v55;
          *(_WORD *)&buf[12] = 2114;
          *(_QWORD *)&buf[14] = v58;
          *(_WORD *)&buf[22] = 2114;
          v228 = v28;
          _os_log_impl(&dword_18C849000, v54, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Skipping dual-action buy for insufficient ACL version: %{public}@", buf, 0x20u);

        }
        goto LABEL_72;
      }
    }
    else
    {
      -[AMSPaymentSheetTask bag](self, "bag");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = +[AMSCardEnrollment shouldUseAutoEnrollmentWithBag:](AMSCardEnrollment, "shouldUseAutoEnrollmentWithBag:", v34);

      if (!v35
        || !+[AMSBiometrics isActionSupported:withAccessControl:](AMSBiometrics, "isActionSupported:withAccessControl:", 3, v26))
      {
        goto LABEL_38;
      }
    }
    v219 = 0;
    v220 = &v219;
    v221 = 0x2050000000;
    v36 = (void *)qword_1ECEACBD8;
    v222 = qword_1ECEACBD8;
    if (!qword_1ECEACBD8)
    {
      *(_QWORD *)buf = MEMORY[0x1E0C809B0];
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = __getPKPaymentMerchantSessionClass_block_invoke_0;
      v228 = (__CFString *)&unk_1E253DDB8;
      v229 = &v219;
      __getPKPaymentMerchantSessionClass_block_invoke_0((uint64_t)buf);
      v36 = (void *)v220[3];
    }
    v37 = objc_retainAutorelease(v36);
    _Block_object_dispose(&v219, 8);
    v28 = (__CFString *)objc_msgSend([v37 alloc], "initWithDictionary:", v203);
    +[AMSLogConfig sharedPurchaseConfig](AMSLogConfig, "sharedPurchaseConfig");
    v38 = objc_claimAutoreleasedReturnValue();
    v39 = (void *)v38;
    if (v28)
    {
      if (!v38)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v39, "OSLogObject");
      v40 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
      {
        v41 = (void *)objc_opt_class();
        v42 = v41;
        -[AMSPaymentSheetTask request](self, "request");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "logKey");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v41;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v44;
        _os_log_impl(&dword_18C849000, v40, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Attaching merchant session", buf, 0x16u);

      }
      objc_msgSend(v5, "setMerchantSession:", v28);
      objc_msgSend(v5, "setMerchantCapabilities:", 13);
      -[AMSPaymentSheetTask request](self, "request");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = objc_msgSend(v45, "isApplePayClassic");

      if (v46)
      {
        +[AMSLogConfig sharedPurchaseConfig](AMSLogConfig, "sharedPurchaseConfig");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v47)
        {
          +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v47, "OSLogObject");
        v48 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
        {
          v49 = (void *)objc_opt_class();
          v50 = v49;
          -[AMSPaymentSheetTask request](self, "request");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v51, "logKey");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          *(_QWORD *)&buf[4] = v49;
          *(_WORD *)&buf[12] = 2114;
          *(_QWORD *)&buf[14] = v52;
          _os_log_impl(&dword_18C849000, v48, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Setting apple-pay-classic flag", buf, 0x16u);

        }
        objc_msgSend(v5, "setRequestType:", 0);
      }
    }
    else
    {
      if (!v38)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v39, "OSLogObject");
      v59 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
      {
        v60 = (void *)objc_opt_class();
        v61 = v60;
        -[AMSPaymentSheetTask request](self, "request");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v62, "logKey");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v60;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v63;
        _os_log_impl(&dword_18C849000, v59, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to instantiate PKPaymentMerchantSession object", buf, 0x16u);

      }
    }
    -[AMSPaymentSheetTask request](self, "request");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v65 = objc_msgSend(v64, "isApplePayClassic");

    if (v65)
    {
      -[AMSPaymentSheetTask bag](self, "bag");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v66, "stringForKey:", 0x1E254C520);
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      v218 = 0;
      objc_msgSend(v67, "valueWithError:", &v218);
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      v69 = v218;
      objc_msgSend(v68, "uppercaseString");
      v213 = (void *)objc_claimAutoreleasedReturnValue();

      if (v69)
      {
        +[AMSLogConfig sharedPurchaseConfig](AMSLogConfig, "sharedPurchaseConfig");
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v70)
        {
          +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
          v70 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v70, "OSLogObject");
        v71 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v71, OS_LOG_TYPE_ERROR))
        {
          v72 = (void *)objc_opt_class();
          v208 = v72;
          -[AMSPaymentSheetTask request](self, "request");
          v73 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v73, "logKey");
          v74 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          *(_QWORD *)&buf[4] = v72;
          *(_WORD *)&buf[12] = 2114;
          *(_QWORD *)&buf[14] = v74;
          *(_WORD *)&buf[22] = 2114;
          v228 = CFSTR("countryCode");
          _os_log_impl(&dword_18C849000, v71, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to lookup bag key '%{public}@' for dual-action buy", buf, 0x20u);

        }
      }
      -[AMSPaymentSheetTask bag](self, "bag");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v75, "arrayForKey:", 0x1E254C600);
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      v217 = v69;
      objc_msgSend(v76, "valueWithError:", &v217);
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      v209 = v217;

      if (v209)
      {
        +[AMSLogConfig sharedPurchaseConfig](AMSLogConfig, "sharedPurchaseConfig");
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v78)
        {
          +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
          v78 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v78, "OSLogObject");
        v79 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v79, OS_LOG_TYPE_ERROR))
        {
          v80 = (void *)objc_opt_class();
          v206 = v80;
          -[AMSPaymentSheetTask request](self, "request");
          v81 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v81, "logKey");
          v82 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          *(_QWORD *)&buf[4] = v80;
          *(_WORD *)&buf[12] = 2114;
          *(_QWORD *)&buf[14] = v82;
          *(_WORD *)&buf[22] = 2114;
          v228 = CFSTR("apple-pay-classic-networks");
          _os_log_impl(&dword_18C849000, v79, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to lookup bag key '%{public}@' for dual-action buy", buf, 0x20u);

        }
      }
      if (v213)
      {
        objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v213);
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setSupportedCountries:", v83);

      }
      if (v77)
        objc_msgSend(v5, "setSupportedNetworks:", v77);

    }
    -[AMSPaymentSheetTask request](self, "request");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v84, "selectedCard");
    v85 = (void *)objc_claimAutoreleasedReturnValue();

    if (v85)
    {
      +[AMSLogConfig sharedPurchaseConfig](AMSLogConfig, "sharedPurchaseConfig");
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v86)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v86 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v86, "OSLogObject");
      v87 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v87, OS_LOG_TYPE_DEFAULT))
      {
        v88 = (void *)objc_opt_class();
        v89 = v88;
        -[AMSPaymentSheetTask request](self, "request");
        v90 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v90, "logKey");
        v91 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v88;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v91;
        _os_log_impl(&dword_18C849000, v87, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Attaching selected card info", buf, 0x16u);

      }
      -[AMSPaymentSheetTask request](self, "request");
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v92, "selectedCard");
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v93, "passSerialNumber");
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setPassSerialNumber:", v94);

      -[AMSPaymentSheetTask request](self, "request");
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v95, "selectedCard");
      v96 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v96, "passTypeIdentifier");
      v97 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setPassTypeIdentifier:", v97);

      objc_msgSend(v5, "setRequestType:", 1);
      objc_msgSend(v5, "setAPIType:", 0);
    }
  }
  else
  {
    +[AMSLogConfig sharedPurchaseConfig](AMSLogConfig, "sharedPurchaseConfig");
    v28 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (!v28)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v28 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    -[__CFString OSLogObject](v28, "OSLogObject");
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      v30 = (void *)objc_opt_class();
      v31 = v30;
      -[AMSPaymentSheetTask request](self, "request");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "logKey");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v30;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v33;
      _os_log_impl(&dword_18C849000, v29, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Skipping dual-action buy for no merchant session", buf, 0x16u);

    }
  }
LABEL_72:

  v98 = (void *)objc_opt_new();
  v214 = (void *)objc_opt_new();
  -[AMSPaymentSheetTask request](self, "request");
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSPaymentSheetTask assetCache](self, "assetCache");
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSPaymentSheetTask request](self, "request");
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v101, "designVersion");
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSPaymentSheetTask bag](self, "bag");
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v99, "ams_createAMSContentItemForSalableInfoWithAssetCache:designVersion:bag:", v100, v102, v103);
  v202 = (void *)objc_claimAutoreleasedReturnValue();

  -[AMSPaymentRequest setSalableInfo:](v212, "setSalableInfo:", v202);
  -[AMSPaymentSheetTask request](self, "request");
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSPaymentSheetTask assetCache](self, "assetCache");
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSPaymentSheetTask request](self, "request");
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v106, "designVersion");
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSPaymentSheetTask bag](self, "bag");
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v104, "ams_createAMSContentItemsForPreScreenDialogWithAssetCache:designVersion:bag:", v105, v107, v108);
  v210 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v210, "count"))
    objc_msgSend(v214, "addObjectsFromArray:", v210);
  -[AMSPaymentSheetTask request](self, "request");
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v109, "ams_createAMSContentItemForRating");
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v214, "ams_addNullableObject:", v110);

  -[AMSPaymentSheetTask request](self, "request");
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSPaymentSheetTask assetCache](self, "assetCache");
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSPaymentSheetTask request](self, "request");
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v113, "designVersion");
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSPaymentSheetTask bag](self, "bag");
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v111, "ams_createAMSContentItemsForFlexibleListWithAssetCache:designVersion:bag:", v112, v114, v115);
  v207 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v207, "count"))
    objc_msgSend(v214, "addObjectsFromArray:", v207);
  -[AMSPaymentSheetTask request](self, "request");
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSPaymentSheetTask assetCache](self, "assetCache");
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSPaymentSheetTask request](self, "request");
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v118, "designVersion");
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSPaymentSheetTask bag](self, "bag");
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v116, "ams_createContentItemForSalableInfoWithAssetCache:designVersion:bag:", v117, v119, v120);
  v201 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v98, "ams_addNullableObject:", v201);
  -[AMSPaymentSheetTask request](self, "request");
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSPaymentSheetTask assetCache](self, "assetCache");
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSPaymentSheetTask request](self, "request");
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v123, "designVersion");
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSPaymentSheetTask bag](self, "bag");
  v125 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v121, "ams_createContentItemsForPreScreenDialogWithAssetCache:designVersion:bag:", v122, v124, v125);
  v205 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v205, "count"))
    objc_msgSend(v98, "addObjectsFromArray:", v205);
  -[AMSPaymentSheetTask request](self, "request");
  v126 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v126, "ams_createContentItemForRating");
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v98, "ams_addNullableObject:", v127);

  -[AMSPaymentSheetTask request](self, "request");
  v128 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSPaymentSheetTask assetCache](self, "assetCache");
  v129 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSPaymentSheetTask request](self, "request");
  v130 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v130, "designVersion");
  v131 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSPaymentSheetTask bag](self, "bag");
  v132 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v128, "ams_createContentItemsForFlexibleListWithAssetCache:designVersion:bag:", v129, v131, v132);
  v204 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v204, "count"))
    objc_msgSend(v98, "addObjectsFromArray:", v204);
  -[AMSPaymentSheetTask request](self, "request");
  v133 = (void *)objc_claimAutoreleasedReturnValue();
  v134 = objc_msgSend(v133, "isDesignVersionLessThan:", &unk_1E25AF8F0);

  if (v134)
  {
    -[AMSPaymentSheetTask request](self, "request");
    v135 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v135, "ams_createContentItemForAccount");
    v136 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v98, "ams_addNullableObject:", v136);
  }
  -[AMSPaymentSheetTask request](self, "request");
  v137 = (void *)objc_claimAutoreleasedReturnValue();
  v138 = objc_msgSend(v137, "isDesignVersionEqualOrGreaterThan:", &unk_1E25AF8F0);

  if (v138)
  {
    -[AMSPaymentSheetTask request](self, "request");
    v139 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSPaymentSheetTask assetCache](self, "assetCache");
    v140 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSPaymentSheetTask request](self, "request");
    v141 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v141, "designVersion");
    v142 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSPaymentSheetTask bag](self, "bag");
    v143 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v139, "ams_createSecondaryContentItemForSalableInfoWithAssetCache:designVersion:bag:", v140, v142, v143);
    v144 = (void *)objc_claimAutoreleasedReturnValue();

    if (v144)
      -[AMSPaymentRequest setSecondarySalableInfo:](v212, "setSecondarySalableInfo:", v144);
    -[AMSPaymentSheetTask request](self, "request");
    v145 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSPaymentSheetTask assetCache](self, "assetCache");
    v146 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSPaymentSheetTask request](self, "request");
    v147 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v147, "designVersion");
    v148 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSPaymentSheetTask bag](self, "bag");
    v149 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v145, "ams_createSecondaryContentItemsForFlexibleListWithAssetCache:designVersion:bag:", v146, v148, v149);
    v150 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v150, "count"))
      -[AMSPaymentRequest setSecondaryContentItems:](v212, "setSecondaryContentItems:", v150);

  }
  objc_msgSend(v5, "setPaymentContentItems:", v98);
  -[AMSPaymentRequest setPaymentContentItems:](v212, "setPaymentContentItems:", v214);
  -[AMSPaymentSheetTask request](self, "request");
  v151 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSPaymentSheetTask assetCache](self, "assetCache");
  v152 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSPaymentSheetTask bag](self, "bag");
  v153 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v151, "ams_createSummaryItemsForAttributedListWithAssetCache:bag:", v152, v153);
  v154 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v154, "count"))
  {
    objc_msgSend(v5, "setPaymentSummaryItems:", v154);
    objc_msgSend(v5, "setPaymentSummaryPinned:", 1);
    objc_msgSend(v5, "setSuppressTotal:", 1);
    goto LABEL_97;
  }
  -[AMSPaymentSheetTask request](self, "request");
  v155 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v155, "ams_createSummaryItems");
  v156 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setPaymentSummaryItems:", v156);
  -[AMSPaymentSheetTask request](self, "request");
  v157 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v157, "paymentSummary");
  v158 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v158)
    goto LABEL_93;
  -[AMSPaymentSheetTask request](self, "request");
  v159 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v159, "priceSectionItems");
  v160 = (void *)objc_claimAutoreleasedReturnValue();
  v161 = objc_msgSend(v160, "count") == 0;

  if (!v161)
  {
    -[AMSPaymentSheetTask request](self, "request");
    v157 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v157, "paymentSummary");
    v162 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setLocalizedSummaryItemsTitle:", v162);

LABEL_93:
  }
  -[AMSPaymentSheetTask request](self, "request");
  v163 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v163, "price");
  v164 = (void *)objc_claimAutoreleasedReturnValue();
  v165 = v164 == 0;

  if (v165)
    objc_msgSend(v5, "setSuppressTotal:", 1);

LABEL_97:
  -[AMSPaymentSheetTask request](self, "request");
  v166 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setConfirmationStyle:", objc_msgSend(v166, "ams_confirmationStyle"));

  -[AMSPaymentSheetTask request](self, "request");
  v167 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v167, "designVersion");
  v168 = (void *)objc_claimAutoreleasedReturnValue();
  v169 = objc_msgSend(v168, "isEqualToNumber:", &unk_1E25AF8F0);

  if (v169)
  {
    objc_msgSend(v5, "setClientViewSourceIdentifier:", CFSTR("AMSUIPaymentSheetViewProvider"));
    v216 = 0;
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v5, 1, &v216);
    v200 = (void *)objc_claimAutoreleasedReturnValue();
    v170 = (__CFString *)v216;
    if (v170)
    {
      +[AMSLogConfig sharedPurchaseConfig](AMSLogConfig, "sharedPurchaseConfig");
      v171 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v171)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v171 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v171, "OSLogObject");
      v172 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v172, OS_LOG_TYPE_ERROR))
      {
        v173 = objc_opt_class();
        -[AMSPaymentSheetTask request](self, "request");
        v174 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v174, "logKey");
        v175 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        *(_QWORD *)&buf[4] = v173;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v175;
        *(_WORD *)&buf[22] = 2114;
        v228 = v170;
        _os_log_impl(&dword_18C849000, v172, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to serialize payment request: %{public}@", buf, 0x20u);

      }
    }
    else
    {
      if (!v200)
      {
LABEL_114:

        goto LABEL_115;
      }
      v176 = objc_alloc(MEMORY[0x1E0C99E08]);
      v225[0] = CFSTR("AMSPaymentSheetPaymentRequestMetadataKeyPayee");
      v177 = (void *)MEMORY[0x1E0CB37E8];
      -[AMSPaymentSheetTask request](self, "request");
      v198 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v177, "numberWithInteger:", objc_msgSend(v198, "payee"));
      v196 = (void *)objc_claimAutoreleasedReturnValue();
      v226[0] = v196;
      v225[1] = CFSTR("AMSPaymentSheetPaymentRequestMetadataKeyDesignVersion");
      -[AMSPaymentSheetTask request](self, "request");
      v195 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v195, "designVersion");
      v178 = (void *)objc_claimAutoreleasedReturnValue();
      v226[1] = v178;
      v225[2] = CFSTR("AMSPaymentSheetPaymentRequestMetadataKeySalableIconType");
      v179 = (void *)MEMORY[0x1E0CB37E8];
      -[AMSPaymentSheetTask request](self, "request");
      v180 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v179, "numberWithInteger:", objc_msgSend(v180, "salableIcon"));
      v181 = (void *)objc_claimAutoreleasedReturnValue();
      v226[2] = v181;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v226, v225, 3);
      v182 = (void *)objc_claimAutoreleasedReturnValue();
      v171 = (void *)objc_msgSend(v176, "initWithDictionary:", v182);

      v215 = 0;
      objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v212, 1, &v215);
      v199 = (void *)objc_claimAutoreleasedReturnValue();
      v172 = v215;
      if (v172)
      {
        +[AMSLogConfig sharedPurchaseConfig](AMSLogConfig, "sharedPurchaseConfig");
        v183 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v183)
        {
          +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
          v183 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v183, "OSLogObject");
        v184 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v184, OS_LOG_TYPE_ERROR))
        {
          v197 = objc_opt_class();
          AMSLogKey();
          v185 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          *(_QWORD *)&buf[4] = v197;
          *(_WORD *)&buf[12] = 2114;
          *(_QWORD *)&buf[14] = v185;
          *(_WORD *)&buf[22] = 2114;
          v228 = (__CFString *)v172;
          _os_log_impl(&dword_18C849000, v184, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to serialize payment request metadata: %{public}@", buf, 0x20u);

        }
      }
      else if (v199)
      {
        objc_msgSend(v171, "setObject:forKeyedSubscript:", v199, CFSTR("AMSPaymentSheetPaymentRequestMetadataKeyRequestData"));
      }
      v223[0] = CFSTR("AMSPaymentSheetPaymentRequest");
      v223[1] = CFSTR("AMSPaymentSheetPaymentRequestMetadata");
      v224[0] = v200;
      v186 = (void *)objc_msgSend(v171, "copy");
      v224[1] = v186;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v224, v223, 2);
      v187 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setClientViewSourceParameter:", v187);

    }
    goto LABEL_114;
  }
LABEL_115:
  -[AMSPaymentSheetTask request](self, "request");
  v188 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v188, "performanceMetrics");
  v189 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSPaymentSheetTask purchaseInfo](self, "purchaseInfo");
  v190 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v190, "purchase");
  v191 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v191, "performanceMetricsOverlay");
  v192 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v189, "enqueueMetricsEventWithOverlay:", v192);

  v193 = v5;
  return v193;
}

- (void)_dismissPaymentAuthorizationController:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  _QWORD *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  _QWORD v30[5];
  id v31;
  id v32;
  SEL v33;
  _BYTE buf[24];
  void *v35;
  id v36;
  id v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  -[AMSPaymentSheetTask request](self, "request");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "logKey");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  +[AMSLogConfig sharedPurchaseConfig](AMSLogConfig, "sharedPurchaseConfig");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v5)
  {
    if (!v8)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v9, "OSLogObject");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = (void *)MEMORY[0x1E0CB3940];
      v12 = objc_opt_class();
      NSStringFromSelector(a2);
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = (void *)v13;
      if (v7)
        objc_msgSend(v11, "stringWithFormat:", CFSTR("%@: [%@] %@ "), v12, v7, v13);
      else
        objc_msgSend(v11, "stringWithFormat:", CFSTR("%@: %@ "), v12, v13, v29);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      AMSHashIfNeeded(v5);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v20;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v21;
      _os_log_impl(&dword_18C849000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@Dismissing authorization controller: %{public}@", buf, 0x16u);

    }
    v22 = MEMORY[0x1E0C809B0];
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __62__AMSPaymentSheetTask__dismissPaymentAuthorizationController___block_invoke;
    v30[3] = &unk_1E25432B8;
    v30[4] = self;
    v33 = a2;
    v31 = v5;
    v32 = v7;
    v23 = v30;
    AMSLogKey();
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)buf = v22;
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = __AMSDispatchAsync_block_invoke_6;
    v35 = &unk_1E253DC28;
    v36 = v24;
    v37 = v23;
    v25 = v24;
    dispatch_async(MEMORY[0x1E0C80D38], buf);

  }
  else
  {
    if (!v8)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v9, "OSLogObject");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v16 = (void *)MEMORY[0x1E0CB3940];
      v17 = objc_opt_class();
      NSStringFromSelector(a2);
      v18 = objc_claimAutoreleasedReturnValue();
      v19 = (void *)v18;
      if (v7)
        objc_msgSend(v16, "stringWithFormat:", CFSTR("%@: [%@] %@ "), v17, v7, v18);
      else
        objc_msgSend(v16, "stringWithFormat:", CFSTR("%@: %@ "), v17, v18, v29);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v26;
      _os_log_impl(&dword_18C849000, v15, OS_LOG_TYPE_ERROR, "%{public}@Attempting to dismiss nil controller", buf, 0xCu);

    }
    AMSError(509, CFSTR("Authorization Controller Missing"), CFSTR("We attempted to dismiss a nil controller."), 0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSPaymentSheetTask paymentSheetPromise](self, "paymentSheetPromise");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "finishWithError:", v27);

  }
}

void __62__AMSPaymentSheetTask__dismissPaymentAuthorizationController___block_invoke(uint64_t a1)
{
  AMSDeallocGuard *v2;
  uint64_t v3;
  uint64_t v4;
  AMSDeallocGuard *v5;
  AMSMutablePromise *v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  AMSMutablePromise *v11;
  AMSDeallocGuard *v12;
  void *v13;
  void *v14;
  _QWORD v15[5];
  _QWORD v16[4];
  id v17;
  uint64_t v18;
  id v19;
  AMSDeallocGuard *v20;
  AMSMutablePromise *v21;
  uint64_t v22;
  _QWORD v23[6];

  v2 = [AMSDeallocGuard alloc];
  v3 = MEMORY[0x1E0C809B0];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __62__AMSPaymentSheetTask__dismissPaymentAuthorizationController___block_invoke_2;
  v23[3] = &unk_1E2540A40;
  v4 = *(_QWORD *)(a1 + 56);
  v23[4] = *(_QWORD *)(a1 + 32);
  v23[5] = v4;
  v5 = -[AMSDeallocGuard initWithDeallocGuardBlock:](v2, "initWithDeallocGuardBlock:", v23);
  v6 = -[AMSMutablePromise initWithTimeout:]([AMSMutablePromise alloc], "initWithTimeout:", 3.0);
  v16[0] = v3;
  v16[1] = 3221225472;
  v16[2] = __62__AMSPaymentSheetTask__dismissPaymentAuthorizationController___block_invoke_210;
  v16[3] = &unk_1E2543C60;
  v7 = *(void **)(a1 + 40);
  v8 = *(id *)(a1 + 48);
  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(void **)(a1 + 40);
  v17 = v8;
  v18 = v9;
  v22 = *(_QWORD *)(a1 + 56);
  v19 = v10;
  v20 = v5;
  v21 = v6;
  v11 = v6;
  v12 = v5;
  objc_msgSend(v7, "dismissWithCompletion:", v16);
  objc_msgSend(*(id *)(a1 + 32), "paymentSheetPromise");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v3;
  v15[1] = 3221225472;
  v15[2] = __62__AMSPaymentSheetTask__dismissPaymentAuthorizationController___block_invoke_213;
  v15[3] = &unk_1E2544848;
  v15[4] = *(_QWORD *)(a1 + 32);
  -[AMSMutablePromise continueWithBlock:](v11, "continueWithBlock:", v15);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "finishWithPromise:", v14);

  objc_msgSend(*(id *)(a1 + 40), "setDelegate:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setPaymentAuthorizationController:", 0);

}

void __62__AMSPaymentSheetTask__dismissPaymentAuthorizationController___block_invoke_2(uint64_t a1)
{
  _BOOL4 v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v2 = +[AMSUnitTests isRunningUnitTests](AMSUnitTests, "isRunningUnitTests");
  +[AMSLogConfig sharedPurchaseConfig](AMSLogConfig, "sharedPurchaseConfig");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v2)
  {
    if (!v3)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v4, "OSLogObject");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      AMSLogKey();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)MEMORY[0x1E0CB3940];
      v8 = objc_opt_class();
      if (v6)
      {
        AMSLogKey();
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(*(SEL *)(a1 + 40));
        a1 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "stringWithFormat:", CFSTR("%@: [%@] %@ "), v8, v9, a1);
      }
      else
      {
        NSStringFromSelector(*(SEL *)(a1 + 40));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "stringWithFormat:", CFSTR("%@: %@ "), v8, v9);
      }
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v18 = v10;
      _os_log_impl(&dword_18C849000, v5, OS_LOG_TYPE_ERROR, "%{public}@Completion handler not called.", buf, 0xCu);
      if (v6)
      {

        v10 = (void *)a1;
      }

    }
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[AMSLogConfig sharedPurchaseConfig](AMSLogConfig, "sharedPurchaseConfig");
    v11 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "postNotificationName:object:userInfo:", CFSTR("com.apple.AppleMediaServicesTests.FaultLogged"), v11, 0);
  }
  else
  {
    if (!v3)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v4, "OSLogObject");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
    {
      AMSLogKey();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)MEMORY[0x1E0CB3940];
      v14 = objc_opt_class();
      if (v12)
      {
        AMSLogKey();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(*(SEL *)(a1 + 40));
        a1 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "stringWithFormat:", CFSTR("%@: [%@] %@ "), v14, v15, a1);
      }
      else
      {
        NSStringFromSelector(*(SEL *)(a1 + 40));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "stringWithFormat:", CFSTR("%@: %@ "), v14, v15);
      }
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v18 = v16;
      _os_log_impl(&dword_18C849000, v11, OS_LOG_TYPE_FAULT, "%{public}@Completion handler not called.", buf, 0xCu);
      if (v12)
      {

        v16 = (void *)a1;
      }

    }
  }

}

uint64_t __62__AMSPaymentSheetTask__dismissPaymentAuthorizationController___block_invoke_210(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  +[AMSLogConfig sharedPurchaseConfig](AMSLogConfig, "sharedPurchaseConfig");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v2, "OSLogObject");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = (void *)MEMORY[0x1E0CB3940];
    v5 = *(_QWORD *)(a1 + 32);
    v6 = objc_opt_class();
    if (v5)
    {
      v7 = *(_QWORD *)(a1 + 32);
      NSStringFromSelector(*(SEL *)(a1 + 72));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "stringWithFormat:", CFSTR("%@: [%@] %@ "), v6, v7, v8);
    }
    else
    {
      NSStringFromSelector(*(SEL *)(a1 + 72));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "stringWithFormat:", CFSTR("%@: %@ "), v6, v8, v13);
    }
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_dismissWithCompletion_);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    AMSHashIfNeeded(*(void **)(a1 + 48));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v15 = v9;
    v16 = 2114;
    v17 = v10;
    v18 = 2114;
    v19 = v11;
    _os_log_impl(&dword_18C849000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@Received %{public}@ callback from %{public}@", buf, 0x20u);

  }
  objc_msgSend(*(id *)(a1 + 56), "invalidate");
  return objc_msgSend(*(id *)(a1 + 64), "finishWithResult:", MEMORY[0x1E0C9AAB0]);
}

id __62__AMSPaymentSheetTask__dismissPaymentAuthorizationController___block_invoke_213(uint64_t a1)
{
  void *v2;
  AMSPaymentSheetResult *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  __CFString *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  const __CFString *v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "state");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "error");
  v3 = (AMSPaymentSheetResult *)objc_claimAutoreleasedReturnValue();

  if (v3
    || (objc_msgSend(*(id *)(a1 + 32), "state"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5 = objc_msgSend(v4, "didAuthorizePayment"),
        v4,
        !v5))
  {
    objc_msgSend(*(id *)(a1 + 32), "state");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "cancellationType");

    if (v11)
    {
      v25 = CFSTR("AMSCancellationType");
      v12 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(*(id *)(a1 + 32), "state");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "numberWithUnsignedInteger:", objc_msgSend(v13, "cancellationType"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v26[0] = v14;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, &v25, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (void *)objc_msgSend(v15, "mutableCopy");

      objc_msgSend(*(id *)(a1 + 32), "state");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "cancellationType");
      if ((unint64_t)(v18 - 1) > 4)
        v19 = 0;
      else
        v19 = off_1E25448E8[v18 - 1];
      objc_msgSend(v16, "setObject:forKeyedSubscript:", v19, CFSTR("AMSCancellationReason"));

      v21 = (void *)objc_msgSend(v16, "copy");
      AMSErrorWithUserInfo(6, CFSTR("Payment Sheet Failed"), CFSTR("The payment sheet was cancelled by the user."), v21, 0);
      v22 = objc_claimAutoreleasedReturnValue();

      v3 = (AMSPaymentSheetResult *)v22;
      if (!v22)
        goto LABEL_9;
    }
    else if (!v3)
    {
      AMSError(6, CFSTR("Payment Sheet Failed"), CFSTR("Payment sheet dismissed with neither an error nor a result"), 0);
      v3 = (AMSPaymentSheetResult *)objc_claimAutoreleasedReturnValue();
      if (!v3)
        goto LABEL_9;
    }
    +[AMSPromise promiseWithError:](AMSPromise, "promiseWithError:", v3);
    v20 = objc_claimAutoreleasedReturnValue();
    goto LABEL_13;
  }
  v3 = objc_alloc_init(AMSPaymentSheetResult);
  objc_msgSend(*(id *)(a1 + 32), "state");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "passwordEquivalentToken");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSPaymentSheetResult setPasswordEquivalentToken:](v3, "setPasswordEquivalentToken:", v7);

  objc_msgSend(*(id *)(a1 + 32), "state");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "signatureResult");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSPaymentSheetResult setSignatureResult:](v3, "setSignatureResult:", v9);

LABEL_9:
  +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", v3);
  v20 = objc_claimAutoreleasedReturnValue();
LABEL_13:
  v23 = (void *)v20;

  return v23;
}

- (void)_presentPaymentConfirmationWithPaymentRequest:(id)a3 purchaseResult:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  -[AMSPaymentSheetTask request](self, "request", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "logKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[AMSPaymentSheetTask request](self, "request");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "requiresAuthorization"))
  {

  }
  else
  {
    -[AMSPaymentSheetTask request](self, "request");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "requiresDelegateAuthentication");

    if (!v9)
      goto LABEL_9;
  }
  +[AMSLogConfig sharedPurchaseConfig](AMSLogConfig, "sharedPurchaseConfig");
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
    v15 = 138543618;
    v16 = objc_opt_class();
    v17 = 2114;
    v18 = v6;
    _os_log_impl(&dword_18C849000, v11, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Unable to present payment presentation confirmation for request that is not confirmation only.", (uint8_t *)&v15, 0x16u);
  }

LABEL_9:
  +[AMSLogConfig sharedPurchaseConfig](AMSLogConfig, "sharedPurchaseConfig");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v12, "OSLogObject");
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    v14 = objc_opt_class();
    v15 = 138543618;
    v16 = v14;
    v17 = 2114;
    v18 = v6;
    _os_log_impl(&dword_18C849000, v13, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Platform not supported", (uint8_t *)&v15, 0x16u);
  }

}

- (void)_presentCompanionAuthenticationSheetWithPaymentRequest:(id)a3 purchaseResult:(id)a4
{
  void *v5;
  void *v6;
  AMSMutablePromise *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  _QWORD v12[5];
  _QWORD v13[5];
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[AMSPaymentSheetTask request](self, "request", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "logKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_alloc_init(AMSMutablePromise);
  +[AMSLogConfig sharedPurchaseConfig](AMSLogConfig, "sharedPurchaseConfig");
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
    *(_DWORD *)buf = 138543618;
    v15 = objc_opt_class();
    v16 = 2114;
    v17 = v6;
    _os_log_impl(&dword_18C849000, v9, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Platform not supported", buf, 0x16u);
  }

  AMSError(5, CFSTR("Companion Auth Error"), CFSTR("Platform not supported"), 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSMutablePromise finishWithError:](v7, "finishWithError:", v10);

  v11 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __93__AMSPaymentSheetTask__presentCompanionAuthenticationSheetWithPaymentRequest_purchaseResult___block_invoke;
  v13[3] = &unk_1E2544870;
  v13[4] = self;
  -[AMSPromise addSuccessBlock:](v7, "addSuccessBlock:", v13);
  v12[0] = v11;
  v12[1] = 3221225472;
  v12[2] = __93__AMSPaymentSheetTask__presentCompanionAuthenticationSheetWithPaymentRequest_purchaseResult___block_invoke_2;
  v12[3] = &unk_1E253E120;
  v12[4] = self;
  -[AMSPromise addErrorBlock:](v7, "addErrorBlock:", v12);

}

void __93__AMSPaymentSheetTask__presentCompanionAuthenticationSheetWithPaymentRequest_purchaseResult___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  AMSPaymentSheetResult *v6;

  v3 = a2;
  v6 = objc_alloc_init(AMSPaymentSheetResult);
  objc_msgSend(v3, "token");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[AMSPaymentSheetResult setDelegateAuthenticateToken:](v6, "setDelegateAuthenticateToken:", v4);
  objc_msgSend(*(id *)(a1 + 32), "paymentSheetPromise");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "finishWithResult:", v6);

}

void __93__AMSPaymentSheetTask__presentCompanionAuthenticationSheetWithPaymentRequest_purchaseResult___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "paymentSheetPromise");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "finishWithError:", v3);

}

- (id)_presentPaymentSheetWithPaymentRequest:(id)a3
{
  id v4;
  AMSMutableBinaryPromise *v5;
  uint64_t v6;
  AMSMutableBinaryPromise *v7;
  _QWORD *v8;
  id v9;
  void *v10;
  id v11;
  AMSMutableBinaryPromise *v12;
  _QWORD v14[4];
  id v15;
  AMSMutableBinaryPromise *v16;
  AMSPaymentSheetTask *v17;
  _QWORD block[4];
  id v19;
  id v20;

  v4 = a3;
  v5 = objc_alloc_init(AMSMutableBinaryPromise);
  v6 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __62__AMSPaymentSheetTask__presentPaymentSheetWithPaymentRequest___block_invoke;
  v14[3] = &unk_1E25414B8;
  v15 = v4;
  v7 = v5;
  v16 = v7;
  v17 = self;
  v8 = v14;
  v9 = v4;
  AMSLogKey();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  block[0] = v6;
  block[1] = 3221225472;
  block[2] = __AMSDispatchAsync_block_invoke_6;
  block[3] = &unk_1E253DC28;
  v19 = v10;
  v20 = v8;
  v11 = v10;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  v12 = v7;
  return v12;
}

void __62__AMSPaymentSheetTask__presentPaymentSheetWithPaymentRequest___block_invoke(uint64_t a1)
{
  void *v2;
  objc_class *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  int8x16_t v9;
  _QWORD v10[4];
  int8x16_t v11;
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;

  v13 = 0;
  v14 = &v13;
  v15 = 0x2050000000;
  v2 = (void *)qword_1ECEACBE0;
  v16 = qword_1ECEACBE0;
  if (!qword_1ECEACBE0)
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __getPKPaymentAuthorizationControllerClass_block_invoke;
    v12[3] = &unk_1E253DDB8;
    v12[4] = &v13;
    __getPKPaymentAuthorizationControllerClass_block_invoke((uint64_t)v12);
    v2 = (void *)v14[3];
  }
  v3 = objc_retainAutorelease(v2);
  _Block_object_dispose(&v13, 8);
  v4 = (void *)objc_msgSend([v3 alloc], "initWithPaymentRequest:", *(_QWORD *)(a1 + 32));
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "setDelegate:", *(_QWORD *)(a1 + 48));
    objc_msgSend(v5, "setPrivateDelegate:", *(_QWORD *)(a1 + 48));
    objc_msgSend(*(id *)(a1 + 48), "setPaymentAuthorizationController:", v5);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __62__AMSPaymentSheetTask__presentPaymentSheetWithPaymentRequest___block_invoke_2;
    v10[3] = &unk_1E253FB28;
    v9 = *(int8x16_t *)(a1 + 40);
    v6 = (id)v9.i64[0];
    v11 = vextq_s8(v9, v9, 8uLL);
    objc_msgSend(v5, "presentWithCompletion:", v10);

  }
  else
  {
    v7 = *(void **)(a1 + 40);
    AMSError(0, CFSTR("Payment Sheet Failed"), CFSTR("Unable to create authorization controller"), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "finishWithError:", v8);

  }
}

void __62__AMSPaymentSheetTask__presentPaymentSheetWithPaymentRequest___block_invoke_2(uint64_t a1, int a2)
{
  void *v2;
  void *v3;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    +[AMSLogConfig sharedPurchaseConfig](AMSLogConfig, "sharedPurchaseConfig");
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
      objc_msgSend(*(id *)(a1 + 32), "request");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "logKey");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)MEMORY[0x1E0CB3940];
      v10 = objc_opt_class();
      v11 = v10;
      if (v8)
      {
        objc_msgSend(*(id *)(a1 + 32), "request");
        v2 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "logKey");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "stringWithFormat:", CFSTR("%@: [%@] "), v11, v3);
      }
      else
      {
        objc_msgSend(v9, "stringWithFormat:", CFSTR("%@: "), v10);
      }
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v17 = v12;
      _os_log_impl(&dword_18C849000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@Payment sheet has presented", buf, 0xCu);
      if (v8)
      {

        v12 = v2;
      }

    }
    objc_msgSend(*(id *)(a1 + 40), "finishWithSuccess");
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "state");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setCancellationType:", 101);

    v14 = *(void **)(a1 + 40);
    AMSError(10, CFSTR("Payment Sheet Failed"), CFSTR("Presentation failed"), 0);
    v15 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "finishWithError:");

  }
}

+ (BOOL)_shouldCompanionAuthFallbackToPasswordForError:(id)a3
{
  return 0;
}

- (void)paymentAuthorizationController:(id)a3 didAuthorizePayment:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  AMSMutablePromise *v10;
  uint64_t v11;
  id v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  const char *v20;
  id v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  _QWORD v36[4];
  id v37;
  _QWORD v38[5];
  uint8_t buf[4];
  void *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  v10 = objc_alloc_init(AMSMutablePromise);
  v11 = MEMORY[0x1E0C809B0];
  v38[0] = MEMORY[0x1E0C809B0];
  v38[1] = 3221225472;
  v38[2] = __82__AMSPaymentSheetTask_paymentAuthorizationController_didAuthorizePayment_handler___block_invoke;
  v38[3] = &unk_1E253E120;
  v38[4] = self;
  -[AMSPromise addErrorBlock:](v10, "addErrorBlock:", v38);
  v36[0] = v11;
  v36[1] = 3221225472;
  v36[2] = __82__AMSPaymentSheetTask_paymentAuthorizationController_didAuthorizePayment_handler___block_invoke_228;
  v36[3] = &unk_1E253F430;
  v12 = v9;
  v37 = v12;
  -[AMSPromise addFinishBlock:](v10, "addFinishBlock:", v36);
  +[AMSLogConfig sharedPurchaseConfig](AMSLogConfig, "sharedPurchaseConfig");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v13, "OSLogObject");
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v35 = v12;
    -[AMSPaymentSheetTask request](self, "request");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "logKey");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)MEMORY[0x1E0CB3940];
    v17 = objc_opt_class();
    if (v15)
    {
      -[AMSPaymentSheetTask request](self, "request");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "logKey");
      v19 = objc_claimAutoreleasedReturnValue();
      v20 = a2;
      v21 = v8;
      v22 = v19;
      NSStringFromSelector(v20);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = (void *)v22;
      v31 = v22;
      v8 = v21;
      objc_msgSend(v16, "stringWithFormat:", CFSTR("%@: [%@] %@ "), v17, v31, v32);
    }
    else
    {
      NSStringFromSelector(a2);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "stringWithFormat:", CFSTR("%@: %@ "), v17, v18);
    }
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v40 = v23;
    _os_log_impl(&dword_18C849000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@Authorizing payment…", buf, 0xCu);
    v12 = v35;
    if (v15)
    {

      v23 = v33;
    }

  }
  objc_msgSend(v8, "authKitAuthenticationResults");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    objc_msgSend(v8, "authKitAuthenticationResults");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSPaymentSheetTask _authorizePaymentWithAuthKitResults:](self, "_authorizePaymentWithAuthKitResults:", v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSMutablePromise finishWithPromise:](v10, "finishWithPromise:", v26);

  }
  else
  {
    -[AMSPaymentSheetTask request](self, "request");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "biometricsRequest");
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    if (v28)
    {
      -[AMSPaymentSheetTask request](self, "request");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "biometricsRequest");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[AMSPaymentSheetTask _authorizePaymentWithBiometricsRequest:payment:](self, "_authorizePaymentWithBiometricsRequest:payment:", v29, v8);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[AMSMutablePromise finishWithPromise:](v10, "finishWithPromise:", v30);

    }
    else
    {
      AMSError(0, CFSTR("Payment Sheet Failed"), CFSTR("Unknown error occurred during authorization"), 0);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[AMSMutablePromise finishWithError:](v10, "finishWithError:", v25);
    }
  }

}

void __82__AMSPaymentSheetTask_paymentAuthorizationController_didAuthorizePayment_handler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "state");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "error");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    +[AMSLogConfig sharedPurchaseConfig](AMSLogConfig, "sharedPurchaseConfig");
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
      objc_msgSend(*(id *)(a1 + 32), "request");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "logKey");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)MEMORY[0x1E0CB3940];
      v12 = objc_opt_class();
      v13 = v12;
      if (v10)
      {
        objc_msgSend(*(id *)(a1 + 32), "request");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "logKey");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "stringWithFormat:", CFSTR("%@: [%@] "), v13, v19);
      }
      else
      {
        objc_msgSend(v11, "stringWithFormat:", CFSTR("%@: "), v12);
      }
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "state");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "error");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      AMSLogableError(v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v22 = v14;
      v23 = 2114;
      v24 = v17;
      _os_log_impl(&dword_18C849000, v8, OS_LOG_TYPE_ERROR, "%{public}@Payment authorization failed with error, but an error already exists: %{public}@", buf, 0x16u);

      if (v10)
      {

        v14 = v20;
      }

    }
  }
  objc_msgSend(*(id *)(a1 + 32), "state");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setError:", v4);

}

void __82__AMSPaymentSheetTask_paymentAuthorizationController_didAuthorizePayment_handler___block_invoke_228(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v7 = objc_msgSend(v5, "integerValue");
    v8 = objc_alloc((Class)getPKPaymentAuthorizationResultClass());
    v9 = v7;
  }
  else
  {
    v8 = objc_alloc((Class)getPKPaymentAuthorizationResultClass());
    v11 = v8;
    if (v6)
    {
      v13[0] = v6;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)objc_msgSend(v11, "initWithStatus:errors:", 1, v12);

      goto LABEL_6;
    }
    v9 = 1;
  }
  v10 = (void *)objc_msgSend(v8, "initWithStatus:errors:", v9, 0);
LABEL_6:
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)paymentAuthorizationControllerDidFinish:(id)a3
{
  uint64_t v3;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  +[AMSLogConfig sharedPurchaseConfig](AMSLogConfig, "sharedPurchaseConfig");
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
    -[AMSPaymentSheetTask request](self, "request");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "logKey");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)MEMORY[0x1E0CB3940];
    v11 = objc_opt_class();
    if (v9)
    {
      -[AMSPaymentSheetTask request](self, "request");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "logKey");
      v3 = objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      a2 = (SEL)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "stringWithFormat:", CFSTR("%@: [%@] %@ "), v11, v3, a2);
    }
    else
    {
      NSStringFromSelector(a2);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "stringWithFormat:", CFSTR("%@: %@ "), v11, v12);
    }
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v16 = v13;
    _os_log_impl(&dword_18C849000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@Payment sheet did finish", buf, 0xCu);
    if (v9)
    {

      v13 = (void *)v3;
    }

  }
  -[AMSPaymentSheetTask _dismissPaymentAuthorizationController:](self, "_dismissPaymentAuthorizationController:", v6);

}

- (void)paymentAuthorizationController:(id)a3 didSelectPaymentMethod:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  const char *v31;
  _QWORD v32[5];
  id v33;
  id v34;
  SEL v35;
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  uint64_t v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  +[AMSLogConfig sharedPurchaseConfig](AMSLogConfig, "sharedPurchaseConfig");
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
    v30 = v9;
    -[AMSPaymentSheetTask request](self, "request");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "logKey");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)MEMORY[0x1E0CB3940];
    v14 = objc_opt_class();
    v31 = a2;
    if (v12)
    {
      -[AMSPaymentSheetTask request](self, "request");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "logKey");
      v15 = objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = (void *)v15;
      objc_msgSend(v13, "stringWithFormat:", CFSTR("%@: [%@] %@ "), v14, v15, v26);
    }
    else
    {
      NSStringFromSelector(a2);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "stringWithFormat:", CFSTR("%@: %@ "), v14, v28);
    }
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "displayName");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    AMSHashIfNeeded(v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "network");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    AMSHashIfNeeded(v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v37 = v16;
    v38 = 2114;
    v39 = v18;
    v40 = 2114;
    v41 = v20;
    v42 = 2048;
    v43 = objc_msgSend(v8, "type");
    _os_log_impl(&dword_18C849000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ displayName :%{public}@, network :%{public}@, type :%lu", buf, 0x2Au);

    if (v12)
    {

      v16 = v27;
    }

    v9 = v30;
    a2 = v31;
  }

  -[AMSPaymentSheetTask bag](self, "bag");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "BOOLForKey:", 0x1E254C640);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "valuePromise");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __85__AMSPaymentSheetTask_paymentAuthorizationController_didSelectPaymentMethod_handler___block_invoke;
  v32[3] = &unk_1E2544898;
  v32[4] = self;
  v33 = v8;
  v34 = v9;
  v35 = a2;
  v24 = v9;
  v25 = v8;
  objc_msgSend(v23, "addFinishBlock:", v32);

}

void __85__AMSPaymentSheetTask_paymentAuthorizationController_didSelectPaymentMethod_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v3;
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  objc_class *v27;
  id v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t v37;
  _BYTE buf[24];
  void *v39;
  uint64_t *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0 && objc_msgSend(v6, "BOOLValue"))
  {
    +[AMSLogConfig sharedPurchaseConfig](AMSLogConfig, "sharedPurchaseConfig");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v8, "OSLogObject");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "request");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "logKey");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)MEMORY[0x1E0CB3940];
      v12 = objc_opt_class();
      if (v10)
      {
        objc_msgSend(*(id *)(a1 + 32), "request");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "logKey");
        v30 = objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(*(SEL *)(a1 + 56));
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "stringWithFormat:", CFSTR("%@: [%@] %@ "), v12, v30, v3);
      }
      else
      {
        NSStringFromSelector(*(SEL *)(a1 + 56));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "stringWithFormat:", CFSTR("%@: %@ "), v12, v13);
      }
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(*(id *)(a1 + 40), "type");
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v14;
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = v15;
      _os_log_impl(&dword_18C849000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@Enabled to add buyParam for ApplePay payment Method type: %lu", buf, 0x16u);
      if (v10)
      {

        v14 = (void *)v30;
      }

    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 40), "type"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "purchaseInfo");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setPaymentMethodType:", v16);

  }
  if (v7 && objc_msgSend(v7, "code") != 204)
  {
    +[AMSLogConfig sharedPurchaseConfig](AMSLogConfig, "sharedPurchaseConfig");
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
      objc_msgSend(*(id *)(a1 + 32), "request");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "logKey");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = (void *)MEMORY[0x1E0CB3940];
      v22 = objc_opt_class();
      if (v20)
      {
        objc_msgSend(*(id *)(a1 + 32), "request");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "logKey");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(*(SEL *)(a1 + 56));
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "stringWithFormat:", CFSTR("%@: [%@] %@ "), v22, v23, v29);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        NSStringFromSelector(*(SEL *)(a1 + 56));
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "stringWithFormat:", CFSTR("%@: %@ "), v22, v31);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = v24;
      }
      AMSLogableError(v7);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v24;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v25;
      _os_log_impl(&dword_18C849000, v19, OS_LOG_TYPE_ERROR, "%{public}@Failed to get applePayPaymentMethodTypeBuyParamEnabled bag key with error: %{public}@", buf, 0x16u);
      if (v20)
      {

      }
    }

  }
  v34 = 0;
  v35 = &v34;
  v36 = 0x2050000000;
  v26 = (void *)getPKPaymentRequestPaymentMethodUpdateClass_softClass;
  v37 = getPKPaymentRequestPaymentMethodUpdateClass_softClass;
  if (!getPKPaymentRequestPaymentMethodUpdateClass_softClass)
  {
    *(_QWORD *)buf = MEMORY[0x1E0C809B0];
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = __getPKPaymentRequestPaymentMethodUpdateClass_block_invoke;
    v39 = &unk_1E253DDB8;
    v40 = &v34;
    __getPKPaymentRequestPaymentMethodUpdateClass_block_invoke((uint64_t)buf);
    v26 = (void *)v35[3];
  }
  v27 = objc_retainAutorelease(v26);
  _Block_object_dispose(&v34, 8);
  v28 = objc_alloc_init(v27);
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

- (void)paymentAuthorizationController:(id)a3 didEncounterAuthorizationEvent:(unint64_t)a4
{
  uint64_t v4;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  AMSPaymentSheetTask *v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  +[AMSLogConfig sharedPurchaseConfig](AMSLogConfig, "sharedPurchaseConfig", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v8, "OSLogObject");
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    -[AMSPaymentSheetTask request](self, "request");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "logKey");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)MEMORY[0x1E0CB3940];
    v13 = objc_opt_class();
    v25 = self;
    if (v11)
    {
      -[AMSPaymentSheetTask request](self, "request");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "logKey");
      v4 = objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      a2 = (SEL)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "stringWithFormat:", CFSTR("%@: [%@] %@ "), v13, v4, a2);
    }
    else
    {
      NSStringFromSelector(a2);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "stringWithFormat:", CFSTR("%@: %@ "), v13, v14);
    }
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v27 = v15;
    v28 = 2114;
    v29 = v16;
    _os_log_impl(&dword_18C849000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@Recording metrics for event: %{public}@", buf, 0x16u);

    if (v11)
    {

      v15 = (void *)v4;
    }

    self = v25;
  }

  switch(a4)
  {
    case 1uLL:
      -[AMSPaymentSheetTask state](self, "state");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      +[AMSPaymentSheetMetricsEvent dictionaryForBiometricMatchState:didBiometricsLockout:biometricsType:](AMSPaymentSheetMetricsEvent, "dictionaryForBiometricMatchState:didBiometricsLockout:biometricsType:", 100, objc_msgSend(v17, "didBiometricsLockout"), +[AMSBiometrics type](AMSBiometrics, "type"));
      v18 = objc_claimAutoreleasedReturnValue();
      goto LABEL_20;
    case 2uLL:
      -[AMSPaymentSheetTask state](self, "state");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setDidBiometricsLockout:", 1);
      goto LABEL_26;
    case 3uLL:
      -[AMSPaymentSheetTask state](self, "state");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v17, "didBiometricsLockout");
      v21 = 3;
      goto LABEL_19;
    case 4uLL:
      -[AMSPaymentSheetTask state](self, "state");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v17, "didBiometricsLockout");
      v21 = 2;
      goto LABEL_19;
    case 5uLL:
      -[AMSPaymentSheetTask state](self, "state");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v17, "didBiometricsLockout");
      v21 = 5;
      goto LABEL_19;
    case 6uLL:
      -[AMSPaymentSheetTask state](self, "state");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v22;
      v23 = 3;
      goto LABEL_25;
    case 7uLL:
      -[AMSPaymentSheetTask state](self, "state");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v17, "didBiometricsLockout");
      v21 = 8;
      goto LABEL_19;
    case 8uLL:
      -[AMSPaymentSheetTask state](self, "state");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v17, "didBiometricsLockout");
      v21 = 7;
LABEL_19:
      +[AMSPaymentSheetMetricsEvent dictionaryForUserAction:didBiometricsLockout:](AMSPaymentSheetMetricsEvent, "dictionaryForUserAction:didBiometricsLockout:", v21, v20);
      v18 = objc_claimAutoreleasedReturnValue();
LABEL_20:
      v19 = (void *)v18;

      if (!v19)
        return;
      -[AMSPaymentSheetTask userActions](self, "userActions");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "addObject:", v19);

      goto LABEL_26;
    case 9uLL:
      -[AMSPaymentSheetTask state](self, "state");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v22;
      v23 = 1;
      goto LABEL_25;
    case 0xAuLL:
      -[AMSPaymentSheetTask state](self, "state");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v22;
      v23 = 5;
      goto LABEL_25;
    case 0xBuLL:
      -[AMSPaymentSheetTask state](self, "state");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v22;
      v23 = 4;
LABEL_25:
      objc_msgSend(v22, "setCancellationType:", v23);
LABEL_26:

      break;
    default:
      return;
  }
}

- (void)paymentAuthorizationController:(id)a3 willFinishWithError:(id)a4
{
  void *v4;
  id v7;
  id v8;
  _UNKNOWN **v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  AMSPaymentSheetTask *v29;
  AMSPaymentSheetTask *v30;
  id v31;
  id v32;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = &off_1E2519000;
  +[AMSLogConfig sharedPurchaseConfig](AMSLogConfig, "sharedPurchaseConfig");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v10, "OSLogObject");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    v31 = v7;
    -[AMSPaymentSheetTask request](self, "request");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "logKey");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)MEMORY[0x1E0CB3940];
    v15 = objc_opt_class();
    v29 = self;
    if (v13)
    {
      -[AMSPaymentSheetTask request](self, "request");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "logKey");
      v9 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v7 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "stringWithFormat:", CFSTR("%@: [%@] %@ "), v15, v9, v7);
    }
    else
    {
      NSStringFromSelector(a2);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "stringWithFormat:", CFSTR("%@: %@ "), v15, v16);
    }
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    AMSLogableError(v8);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v35 = v4;
    v36 = 2114;
    v37 = v17;
    _os_log_impl(&dword_18C849000, v11, OS_LOG_TYPE_DEBUG, "%{public}@begin | error = %{public}@", buf, 0x16u);
    if (v13)
    {

      v4 = v9;
    }

    self = v29;
    v7 = v31;
  }

  if (v8)
  {
    +[AMSLogConfig sharedPurchaseConfig](AMSLogConfig, "sharedPurchaseConfig");
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
      v32 = v7;
      -[AMSPaymentSheetTask request](self, "request");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "logKey");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = (void *)MEMORY[0x1E0CB3940];
      v23 = objc_opt_class();
      v30 = self;
      if (v21)
      {
        -[AMSPaymentSheetTask request](self, "request");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "logKey");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v7 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "stringWithFormat:", CFSTR("%@: [%@] %@ "), v23, v4, v7);
      }
      else
      {
        NSStringFromSelector(a2);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "stringWithFormat:", CFSTR("%@: %@ "), v23, v24);
      }
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      AMSLogableError(v8);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v35 = v25;
      v36 = 2114;
      v37 = v26;
      _os_log_impl(&dword_18C849000, v19, OS_LOG_TYPE_ERROR, "%{public}@Payment sheet will finish with error: %{public}@", buf, 0x16u);
      if (v21)
      {

        v25 = v4;
      }

      self = v30;
      v7 = v32;
    }

    AMSError(509, CFSTR("Payment Sheet Failed"), CFSTR("There was an error in the payment authorization controller."), v8);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSPaymentSheetTask state](self, "state");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setError:", v27);

  }
  objc_msgSend(v7, "setPrivateDelegate:", 0);

}

- (id)presentationSceneIdentifierForPaymentAuthorizationController:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _UNKNOWN **v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v36;
  uint8_t buf[4];
  void *v39;
  __int16 v40;
  void *v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v8 = &off_1E2519000;
  +[AMSLogConfig sharedPurchaseConfig](AMSLogConfig, "sharedPurchaseConfig", a3);
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
    -[AMSPaymentSheetTask request](self, "request");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "logKey");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = (void *)MEMORY[0x1E0CB3940];
    v13 = objc_opt_class();
    if (v12)
    {
      -[AMSPaymentSheetTask request](self, "request");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "logKey");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: [%@] %@ "), v13, v4, v5);
    }
    else
    {
      NSStringFromSelector(a2);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: %@ "), v13, v14);
    }
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v39 = v6;
    _os_log_impl(&dword_18C849000, v10, OS_LOG_TYPE_DEBUG, "%{public}@begin", buf, 0xCu);
    if (v12)
    {

      v6 = v4;
    }

    v8 = &off_1E2519000;
  }

  -[AMSPaymentSheetTask presentingSceneIdentifier](self, "presentingSceneIdentifier");
  v15 = objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    v16 = (void *)v15;
    +[AMSLogConfig sharedPurchaseConfig](AMSLogConfig, "sharedPurchaseConfig");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v17)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v17, "OSLogObject");
    v18 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      goto LABEL_31;
    -[AMSPaymentSheetTask request](self, "request");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "logKey");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)MEMORY[0x1E0CB3940];
    v21 = objc_opt_class();
    if (v19)
    {
      -[AMSPaymentSheetTask request](self, "request");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "logKey");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "stringWithFormat:", CFSTR("%@: [%@] %@ "), v21, v3, v6);
    }
    else
    {
      NSStringFromSelector(a2);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "stringWithFormat:", CFSTR("%@: %@ "), v21, v4);
    }
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v39 = v22;
    _os_log_impl(&dword_18C849000, v18, OS_LOG_TYPE_DEBUG, "%{public}@Using self.presentingSceneIdentifier", buf, 0xCu);
    v8 = &off_1E2519000;
    if (v19)
    {

      v22 = v3;
    }

    goto LABEL_30;
  }
  -[AMSPaymentSheetTask purchaseInfo](self, "purchaseInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "purchase");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "presentingSceneIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v16)
    goto LABEL_32;
  +[AMSLogConfig sharedPurchaseConfig](AMSLogConfig, "sharedPurchaseConfig");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v17)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v17, "OSLogObject");
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    -[AMSPaymentSheetTask request](self, "request");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "logKey");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (void *)MEMORY[0x1E0CB3940];
    v25 = objc_opt_class();
    if (v19)
    {
      -[AMSPaymentSheetTask request](self, "request");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "logKey");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "stringWithFormat:", CFSTR("%@: [%@] %@ "), v25, v5, v6);
    }
    else
    {
      NSStringFromSelector(a2);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "stringWithFormat:", CFSTR("%@: %@ "), v25, v4);
    }
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v39 = v3;
    _os_log_impl(&dword_18C849000, v18, OS_LOG_TYPE_DEBUG, "%{public}@Using self.purchaseInfo.purchase.presentingSceneIdentifier", buf, 0xCu);
    v8 = &off_1E2519000;
    if (v19)
    {

      v3 = v5;
    }

LABEL_30:
  }
LABEL_31:

LABEL_32:
  objc_msgSend(v8[274], "sharedPurchaseConfig");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v26)
  {
    objc_msgSend(v8[274], "sharedConfig");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v26, "OSLogObject");
  v27 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
  {
    -[AMSPaymentSheetTask request](self, "request");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "logKey");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = (void *)MEMORY[0x1E0CB3940];
    v31 = objc_opt_class();
    if (v29)
    {
      -[AMSPaymentSheetTask request](self, "request");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "logKey");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "stringWithFormat:", CFSTR("%@: [%@] %@ "), v31, v4, v3);
    }
    else
    {
      NSStringFromSelector(a2);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "stringWithFormat:", CFSTR("%@: %@ "), v31, v32);
    }
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    AMSHashIfNeeded(v16);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v39 = v33;
    v40 = 2114;
    v41 = v34;
    _os_log_impl(&dword_18C849000, v27, OS_LOG_TYPE_DEBUG, "%{public}@ returning scene identifier %{public}@", buf, 0x16u);
    if (v29)
    {

      v33 = v4;
    }

  }
  return v16;
}

- (id)presentationSceneBundleIdentifierForPaymentAuthorizationController:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  const char *v32;
  void *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v44;
  uint8_t buf[4];
  void *v47;
  __int16 v48;
  void *v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  +[AMSLogConfig sharedPurchaseConfig](AMSLogConfig, "sharedPurchaseConfig", a3);
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
    -[AMSPaymentSheetTask request](self, "request");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "logKey");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = (void *)MEMORY[0x1E0CB3940];
    v11 = objc_opt_class();
    if (v10)
    {
      -[AMSPaymentSheetTask request](self, "request");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "logKey");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: [%@] %@ "), v11, v4, v5);
    }
    else
    {
      NSStringFromSelector(a2);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: %@ "), v11, v12);
    }
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v47 = v13;
    _os_log_impl(&dword_18C849000, v8, OS_LOG_TYPE_DEBUG, "%{public}@begin", buf, 0xCu);
    if (v10)
    {

      v13 = v4;
    }

  }
  -[AMSPaymentSheetTask presentingSceneBundleIdentifier](self, "presentingSceneBundleIdentifier");
  v14 = objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    v15 = (void *)v14;
    +[AMSLogConfig sharedPurchaseConfig](AMSLogConfig, "sharedPurchaseConfig");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v16)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v16, "OSLogObject");
    v17 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      goto LABEL_48;
    v44 = v15;
    -[AMSPaymentSheetTask request](self, "request");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "logKey");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)MEMORY[0x1E0CB3940];
    v21 = objc_opt_class();
    if (v19)
    {
      -[AMSPaymentSheetTask request](self, "request");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "logKey");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "stringWithFormat:", CFSTR("%@: [%@] %@ "), v21, v3, v15);
    }
    else
    {
      NSStringFromSelector(a2);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "stringWithFormat:", CFSTR("%@: %@ "), v21, v4);
    }
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v47 = v22;
    _os_log_impl(&dword_18C849000, v17, OS_LOG_TYPE_DEBUG, "%{public}@Using self.presentingSceneBundleIdentifier", buf, 0xCu);
    if (v19)
    {

      v22 = v3;
    }

    goto LABEL_47;
  }
  -[AMSPaymentSheetTask purchaseInfo](self, "purchaseInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "purchase");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "presentingSceneBundleIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    +[AMSLogConfig sharedPurchaseConfig](AMSLogConfig, "sharedPurchaseConfig");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v16)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v16, "OSLogObject");
    v17 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      goto LABEL_48;
    v44 = v15;
    -[AMSPaymentSheetTask request](self, "request");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "logKey");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (void *)MEMORY[0x1E0CB3940];
    v25 = objc_opt_class();
    if (v19)
    {
      -[AMSPaymentSheetTask request](self, "request");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "logKey");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "stringWithFormat:", CFSTR("%@: [%@] %@ "), v25, v5, v15);
    }
    else
    {
      NSStringFromSelector(a2);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "stringWithFormat:", CFSTR("%@: %@ "), v25, v4);
    }
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v47 = v3;
    v32 = "%{public}@Using self.purchaseInfo.purchase.presentingSceneBundleIdentifier";
    goto LABEL_44;
  }
  -[AMSPaymentSheetTask purchaseInfo](self, "purchaseInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "clientInfo");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "proxyAppBundleID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    +[AMSLogConfig sharedPurchaseConfig](AMSLogConfig, "sharedPurchaseConfig");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v16)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v16, "OSLogObject");
    v17 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      goto LABEL_48;
    v44 = v15;
    -[AMSPaymentSheetTask request](self, "request");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "logKey");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = (void *)MEMORY[0x1E0CB3940];
    v28 = objc_opt_class();
    if (v19)
    {
      -[AMSPaymentSheetTask request](self, "request");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "logKey");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "stringWithFormat:", CFSTR("%@: [%@] %@ "), v28, v5, v15);
    }
    else
    {
      NSStringFromSelector(a2);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "stringWithFormat:", CFSTR("%@: %@ "), v28, v4);
    }
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v47 = v3;
    v32 = "%{public}@Using self.purchaseInfo.clientInfo.proxyAppBundleID";
    goto LABEL_44;
  }
  -[AMSPaymentSheetTask purchaseInfo](self, "purchaseInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "clientInfo");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "bundleIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15)
    goto LABEL_49;
  +[AMSLogConfig sharedPurchaseConfig](AMSLogConfig, "sharedPurchaseConfig");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v16)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v16, "OSLogObject");
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    v44 = v15;
    -[AMSPaymentSheetTask request](self, "request");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "logKey");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = (void *)MEMORY[0x1E0CB3940];
    v31 = objc_opt_class();
    if (v19)
    {
      -[AMSPaymentSheetTask request](self, "request");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "logKey");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "stringWithFormat:", CFSTR("%@: [%@] %@ "), v31, v5, v15);
    }
    else
    {
      NSStringFromSelector(a2);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "stringWithFormat:", CFSTR("%@: %@ "), v31, v4);
    }
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v47 = v3;
    v32 = "%{public}@Using self.purchaseInfo.clientInfo.bundleIdentifier";
LABEL_44:
    _os_log_impl(&dword_18C849000, v17, OS_LOG_TYPE_DEBUG, v32, buf, 0xCu);
    if (v19)
    {

      v3 = v5;
    }

LABEL_47:
    v15 = v44;
  }
LABEL_48:

LABEL_49:
  +[AMSLogConfig sharedPurchaseConfig](AMSLogConfig, "sharedPurchaseConfig");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v33)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v33, "OSLogObject");
  v34 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
  {
    -[AMSPaymentSheetTask request](self, "request");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "logKey");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = (void *)MEMORY[0x1E0CB3940];
    v38 = objc_opt_class();
    if (v36)
    {
      -[AMSPaymentSheetTask request](self, "request");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "logKey");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "stringWithFormat:", CFSTR("%@: [%@] %@ "), v38, v4, v3);
    }
    else
    {
      NSStringFromSelector(a2);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "stringWithFormat:", CFSTR("%@: %@ "), v38, v39);
    }
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = v15;
    AMSHashIfNeeded(v15);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v47 = v40;
    v48 = 2114;
    v49 = v42;
    _os_log_impl(&dword_18C849000, v34, OS_LOG_TYPE_DEBUG, "%{public}@ returning bundle identifier %{public}@", buf, 0x16u);
    if (v36)
    {

      v40 = v4;
    }

    v15 = v41;
  }

  return v15;
}

+ (BOOL)isPaymentSheetEnablementAvailable
{
  return _os_feature_enabled_impl();
}

- (AMSBagProtocol)bag
{
  return self->_bag;
}

- (void)setBag:(id)a3
{
  objc_storeStrong((id *)&self->_bag, a3);
}

- (NSDictionary)metricsDictionary
{
  return self->_metricsDictionary;
}

- (void)setMetricsDictionary:(id)a3
{
  objc_storeStrong((id *)&self->_metricsDictionary, a3);
}

- (NSString)presentingSceneBundleIdentifier
{
  return self->_presentingSceneBundleIdentifier;
}

- (void)setPresentingSceneBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)presentingSceneIdentifier
{
  return self->_presentingSceneIdentifier;
}

- (void)setPresentingSceneIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (AMSPurchaseInfo)purchaseInfo
{
  return self->_purchaseInfo;
}

- (void)setPurchaseInfo:(id)a3
{
  objc_storeStrong((id *)&self->_purchaseInfo, a3);
}

- (AMSPaymentSheetAssetCache)assetCache
{
  return self->_assetCache;
}

- (void)setAssetCache:(id)a3
{
  objc_storeStrong((id *)&self->_assetCache, a3);
}

- (void)setAuthenticationContext:(id)a3
{
  objc_storeStrong((id *)&self->_authenticationContext, a3);
}

- (PKPaymentAuthorizationController)paymentAuthorizationController
{
  return self->_paymentAuthorizationController;
}

- (void)setPaymentAuthorizationController:(id)a3
{
  objc_storeStrong((id *)&self->_paymentAuthorizationController, a3);
}

- (AMSMutablePromise)paymentSheetPromise
{
  return self->_paymentSheetPromise;
}

- (void)setPaymentSheetPromise:(id)a3
{
  objc_storeStrong((id *)&self->_paymentSheetPromise, a3);
}

- (AMSFinancePaymentSheetResponse)paymentSheetResponse
{
  return self->_paymentSheetResponse;
}

- (AMSPaymentSheetRequest)request
{
  return self->_request;
}

- (_PaymentSheetState)state
{
  return self->_state;
}

- (void)setState:(id)a3
{
  objc_storeStrong((id *)&self->_state, a3);
}

- (NSMutableArray)userActions
{
  return self->_userActions;
}

- (void)setUserActions:(id)a3
{
  objc_storeStrong((id *)&self->_userActions, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userActions, 0);
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_paymentSheetResponse, 0);
  objc_storeStrong((id *)&self->_paymentSheetPromise, 0);
  objc_storeStrong((id *)&self->_paymentAuthorizationController, 0);
  objc_storeStrong((id *)&self->_authenticationContext, 0);
  objc_storeStrong((id *)&self->_assetCache, 0);
  objc_storeStrong((id *)&self->_purchaseInfo, 0);
  objc_storeStrong((id *)&self->_presentingSceneIdentifier, 0);
  objc_storeStrong((id *)&self->_presentingSceneBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_metricsDictionary, 0);
  objc_storeStrong((id *)&self->_bag, 0);
}

@end
