@implementation AMSCardAuthorizationTask

- (AMSCardAuthorizationTask)initWithPaymentSession:(id)a3
{
  id v5;
  AMSCardAuthorizationTask *v6;
  AMSCardAuthorizationTask *v7;
  NSMutableArray *v8;
  NSMutableArray *userActions;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)AMSCardAuthorizationTask;
  v6 = -[AMSTask init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_didBiometricsLockout = 0;
    v6->_didCancelHomeButton = 0;
    objc_storeStrong((id *)&v6->_paymentSession, a3);
    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    userActions = v7->_userActions;
    v7->_userActions = v8;

  }
  return v7;
}

- (id)performCardAuthorization
{
  void *v3;
  _QWORD v5[5];
  id v6;
  id location;

  objc_initWeak(&location, self);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __52__AMSCardAuthorizationTask_performCardAuthorization__block_invoke;
  v5[3] = &unk_1E253FB00;
  objc_copyWeak(&v6, &location);
  v5[4] = self;
  -[AMSTask performTaskWithBlock:](self, "performTaskWithBlock:", v5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
  return v3;
}

id __52__AMSCardAuthorizationTask_performCardAuthorization__block_invoke(uint64_t a1, _QWORD *a2)
{
  id WeakRetained;
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  id v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  Class v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v34;
  _QWORD *v35;
  id v36;
  void *v37;
  void *v38;
  NSObject *v39;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  id v44;
  void *v45;
  AMSMutableBinaryPromise *v46;
  void *v47;
  void *v48;
  uint64_t *v49;
  void *v50;
  NSObject *v51;
  void *v52;
  uint64_t v53;
  id v54;
  _QWORD *v55;
  void *v56;
  NSObject *v57;
  void *v58;
  id v59;
  void *v61;
  uint64_t v62;
  void *v63;
  NSObject *v64;
  void *v65;
  id v66;
  NSObject *v67;
  void *v68;
  id v69;
  void *v70;
  _QWORD *v71;
  id v72;
  uint8_t buf[4];
  id v74;
  __int16 v75;
  void *v76;
  __int16 v77;
  uint64_t v78;
  _QWORD v79[2];

  v79[1] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  AMSSetLogKeyIfNeeded();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc_init((Class)_MergedGlobals_3[0]());
  objc_msgSend(v6, "setAPIType:", 0);
  v7 = objc_alloc((Class)off_1ECEAA638[0]());
  objc_msgSend(*(id *)(a1 + 32), "paymentSession");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithDictionary:", v8);

  objc_msgSend(v6, "setMerchantSession:", v9);
  objc_msgSend(v6, "setExpectsMerchantSession:", 1);
  objc_msgSend(v6, "setMerchantCapabilities:", 13);
  objc_msgSend(*(id *)(a1 + 32), "currencyCode");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setCurrencyCode:", v10);

  objc_msgSend(*(id *)(a1 + 32), "countryCode");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  AMSSetCountryCodeOnPaymentRequest(v11, v6);

  objc_msgSend(*(id *)(a1 + 32), "countryCode");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
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
      *(_DWORD *)buf = 138543618;
      v74 = (id)objc_opt_class();
      v75 = 2114;
      v76 = v5;
      v15 = v74;
      _os_log_impl(&dword_18C849000, v14, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] performCardAuthorization: Failed to find countryCode", buf, 0x16u);

    }
  }
  objc_msgSend(*(id *)(a1 + 32), "currencyCode");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v16)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v17)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v17, "OSLogObject");
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v19 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543618;
      v74 = v19;
      v75 = 2114;
      v76 = v5;
      v20 = v19;
      _os_log_impl(&dword_18C849000, v18, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] performCardAuthorization: Failed to find currencyCode", buf, 0x16u);

    }
  }
  v21 = objc_msgSend(WeakRetained, "confirmationStyle");
  if (v21)
  {
    if (v21 != 1)
      goto LABEL_18;
    v22 = 1;
  }
  else
  {
    v22 = 6;
  }
  objc_msgSend(v6, "setConfirmationStyle:", v22);
LABEL_18:
  v23 = off_1ECEAA640();
  objc_msgSend(MEMORY[0x1E0CB3598], "zero");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[objc_class summaryItemWithLabel:amount:](v23, "summaryItemWithLabel:amount:", &stru_1E2548760, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  v79[0] = v25;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v79, 1);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPaymentSummaryItems:", v26);

  objc_msgSend(v6, "setRequestType:", 3);
  objc_msgSend(*(id *)(a1 + 32), "passSerialNumber");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPassSerialNumber:", v27);

  objc_msgSend(*(id *)(a1 + 32), "passTypeIdentifier");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPassTypeIdentifier:", v28);

  objc_msgSend(*(id *)(a1 + 32), "passSerialNumber");
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v29)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v30)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v30, "OSLogObject");
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      v32 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543618;
      v74 = v32;
      v75 = 2114;
      v76 = v5;
      v33 = v9;
      v34 = v5;
      v35 = a2;
      v36 = v32;
      _os_log_impl(&dword_18C849000, v31, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] performCardAuthorization: Failed to find serialNumber", buf, 0x16u);

      a2 = v35;
      v5 = v34;
      v9 = v33;
    }

  }
  objc_msgSend(*(id *)(a1 + 32), "passTypeIdentifier");
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v37)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v38)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v38, "OSLogObject");
    v39 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
    {
      v40 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543618;
      v74 = v40;
      v75 = 2114;
      v76 = v5;
      v41 = v40;
      _os_log_impl(&dword_18C849000, v39, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] performCardAuthorization: Failed to find passTypeIdentifier", buf, 0x16u);

    }
  }
  objc_msgSend(WeakRetained, "_presentPaymentRequest:", v6);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v72 = 0;
  objc_msgSend(v42, "resultWithError:", &v72);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = v72;

  if (v44)
  {
    objc_msgSend(WeakRetained, "_metricsPost");
    v45 = 0;
    *a2 = objc_retainAutorelease(v44);
    goto LABEL_45;
  }
  if (!objc_msgSend(v43, "BOOLValue"))
  {
    v70 = v9;
    v55 = a2;
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v56)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v56, "OSLogObject");
    v57 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
    {
      v58 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543618;
      v74 = v58;
      v75 = 2114;
      v76 = v5;
      v59 = v58;
      _os_log_impl(&dword_18C849000, v57, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] performCardAuthorization: Failed to present view controller", buf, 0x16u);

    }
    objc_msgSend(WeakRetained, "_metricsPost");
    AMSError(0, CFSTR("Card Authorization Error"), CFSTR("Unknown Error"), 0);
    v45 = 0;
    *v55 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_44;
  }
  v46 = objc_alloc_init(AMSMutableBinaryPromise);
  objc_msgSend(WeakRetained, "setAuthorizationPromise:", v46);

  objc_msgSend(WeakRetained, "authorizationPromise");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "resultWithError:", a2);

  if (*a2)
  {
    v70 = v9;
    v48 = v5;
    v49 = a2;
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v50)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v50, "OSLogObject");
    v51 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
    {
      v52 = (void *)objc_opt_class();
      v53 = *v49;
      *(_DWORD *)buf = 138543874;
      v74 = v52;
      v75 = 2114;
      v76 = v48;
      v77 = 2114;
      v78 = v53;
      v54 = v52;
      _os_log_impl(&dword_18C849000, v51, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] performCardAuthorization: Authorization failed with error: %{public}@", buf, 0x20u);

    }
    objc_msgSend(WeakRetained, "_metricsPost");
    v45 = 0;
    v5 = v48;
LABEL_44:
    v9 = v70;
    goto LABEL_45;
  }
  v71 = a2;
  objc_msgSend(WeakRetained, "payment");
  v61 = (void *)objc_claimAutoreleasedReturnValue();

  +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
  v62 = objc_claimAutoreleasedReturnValue();
  v63 = (void *)v62;
  if (v61)
  {
    if (!v62)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v63, "OSLogObject");
    v64 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
    {
      v65 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543618;
      v74 = v65;
      v75 = 2114;
      v76 = v5;
      v66 = v65;
      _os_log_impl(&dword_18C849000, v64, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] performCardAuthorization: Authorization succeeded", buf, 0x16u);

    }
    objc_msgSend(WeakRetained, "_metricsPost");
    objc_msgSend(WeakRetained, "payment");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!v62)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v63, "OSLogObject");
    v67 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR))
    {
      v68 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543618;
      v74 = v68;
      v75 = 2114;
      v76 = v5;
      v69 = v68;
      _os_log_impl(&dword_18C849000, v67, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] performCardAuthorization: Authorization failed", buf, 0x16u);

    }
    objc_msgSend(WeakRetained, "_metricsPost");
    AMSError(6, CFSTR("Card Authorization Error"), CFSTR("No payment generated"), 0);
    v45 = 0;
    *v71 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_45:

  return v45;
}

- (void)_metricsPost
{
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  id v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  -[AMSCardAuthorizationTask metricsEvent](self, "metricsEvent");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2)
  {
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
      v5 = (void *)objc_opt_class();
      v6 = v5;
      AMSSetLogKeyIfNeeded();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138543618;
      v9 = v5;
      v10 = 2114;
      v11 = v7;
      _os_log_impl(&dword_18C849000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Metrics post failed for no metrics event", (uint8_t *)&v8, 0x16u);

    }
  }
}

- (id)_metricsTimestamp
{
  void *v2;
  double v3;
  double v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "timeIntervalSince1970");
  v4 = v3;

  v5 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", (uint64_t)v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_metricsUserActionDictionary
{
  id v3;
  void *v4;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[AMSCardAuthorizationTask _metricsTimestamp](self, "_metricsTimestamp");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("responseTime"));

  if (-[AMSCardAuthorizationTask didBiometricsLockout](self, "didBiometricsLockout"))
    objc_msgSend(v3, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("bioLockout"));
  return v3;
}

- (id)_presentPaymentRequest:(id)a3
{
  id v4;
  AMSMutableLazyPromise *v5;
  id v6;
  AMSMutableLazyPromise *v7;
  _QWORD v9[4];
  id v10;
  id v11;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v5 = [AMSMutableLazyPromise alloc];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __51__AMSCardAuthorizationTask__presentPaymentRequest___block_invoke;
  v9[3] = &unk_1E253FB50;
  objc_copyWeak(&v11, &location);
  v6 = v4;
  v10 = v6;
  v7 = -[AMSMutableLazyPromise initWithBlock:](v5, "initWithBlock:", v9);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

  return v7;
}

void __51__AMSCardAuthorizationTask__presentPaymentRequest___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = (void *)objc_msgSend(objc_alloc((Class)getPKPaymentAuthorizationControllerClass[0]()), "initWithPaymentRequest:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v5, "setDelegate:", WeakRetained);
  objc_msgSend(v5, "setPrivateDelegate:", WeakRetained);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __51__AMSCardAuthorizationTask__presentPaymentRequest___block_invoke_2;
  v7[3] = &unk_1E253FB28;
  v7[4] = WeakRetained;
  v8 = v3;
  v6 = v3;
  objc_msgSend(v5, "presentWithCompletion:", v7);

}

void __51__AMSCardAuthorizationTask__presentPaymentRequest___block_invoke_2(uint64_t a1, int a2)
{
  void *v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  id v8;
  NSObject *v9;
  id v10;
  void *v11;
  int v12;
  id v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  AMSSetLogKeyIfNeeded();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (a2)
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
      v12 = 138543618;
      v13 = (id)objc_opt_class();
      v14 = 2114;
      v15 = v4;
      v8 = v13;
      _os_log_impl(&dword_18C849000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] _presentPaymentRequest: Did present view controller", (uint8_t *)&v12, 0x16u);

    }
    objc_msgSend(*(id *)(a1 + 40), "finishWithResult:", &unk_1E25AF0E0);
  }
  else
  {
    if (!v5)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v6, "OSLogObject");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v12 = 138543618;
      v13 = (id)objc_opt_class();
      v14 = 2114;
      v15 = v4;
      v10 = v13;
      _os_log_impl(&dword_18C849000, v9, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] _presentPaymentRequest: Failed to present view controller", (uint8_t *)&v12, 0x16u);

    }
    AMSError(0, CFSTR("Card Authorization Error"), CFSTR("Failed to present view controller"), 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "finishWithError:", v11);

  }
}

- (void)paymentAuthorizationControllerDidFinish:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  _BOOL4 v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  const __CFString *v13;
  _QWORD v14[4];
  id v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  const __CFString *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[AMSCardAuthorizationTask payment](self, "payment");
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
    v8 = v5 == 0;
    v9 = (void *)objc_opt_class();
    v10 = v9;
    AMSSetLogKeyIfNeeded();
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)v11;
    v13 = CFSTR("YES");
    *(_DWORD *)buf = 138543874;
    v17 = v9;
    if (v8)
      v13 = CFSTR("NO");
    v18 = 2114;
    v19 = v11;
    v20 = 2112;
    v21 = v13;
    _os_log_impl(&dword_18C849000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] paymentAuthorizationControllerDidFinish: Card authorization did finish with payment: %@", buf, 0x20u);

  }
  objc_initWeak((id *)buf, self);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __68__AMSCardAuthorizationTask_paymentAuthorizationControllerDidFinish___block_invoke;
  v14[3] = &unk_1E253E9A0;
  objc_copyWeak(&v15, (id *)buf);
  objc_msgSend(v4, "dismissWithCompletion:", v14);
  objc_msgSend(v4, "setDelegate:", 0);
  objc_destroyWeak(&v15);
  objc_destroyWeak((id *)buf);

}

void __68__AMSCardAuthorizationTask_paymentAuthorizationControllerDidFinish___block_invoke(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "authorizationPromise");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "finishWithSuccess");

}

- (void)paymentAuthorizationController:(id)a3 didAuthorizePayment:(id)a4 handler:(id)a5
{
  id v7;
  void (**v8)(id, void *);
  void *v9;
  NSObject *v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  const __CFString *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = (void (**)(id, void *))a5;
  +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
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
    v11 = (void *)objc_opt_class();
    v12 = v11;
    AMSSetLogKeyIfNeeded();
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)v13;
    v15 = CFSTR("YES");
    *(_DWORD *)buf = 138543874;
    v22 = v11;
    v23 = 2114;
    if (!v7)
      v15 = CFSTR("NO");
    v24 = v13;
    v25 = 2114;
    v26 = v15;
    _os_log_impl(&dword_18C849000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] paymentAuthorizationControllerDidFinish: Did finish with payment? %{public}@", buf, 0x20u);

  }
  -[AMSCardAuthorizationTask setPayment:](self, "setPayment:", v7);
  if (v7)
  {
    v16 = (void *)objc_msgSend(objc_alloc(getPKPaymentAuthorizationResultClass_0()), "initWithStatus:errors:", 0, 0);
  }
  else
  {
    AMSError(0, CFSTR("Card Authorization Error"), CFSTR("No payment generated"), 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_alloc(getPKPaymentAuthorizationResultClass_0());
    v20 = v17;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v20, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v18, "initWithStatus:errors:", 1, v19);

  }
  v8[2](v8, v16);

}

- (void)paymentAuthorizationController:(id)a3 didEncounterAuthorizationEvent:(unint64_t)a4
{
  void *v6;
  NSObject *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  const __CFString *v15;
  const __CFString *v16;
  const __CFString *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig", a3);
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
    v8 = (void *)objc_opt_class();
    v9 = v8;
    AMSSetLogKeyIfNeeded();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 138543874;
    v21 = v8;
    v22 = 2114;
    v23 = v10;
    v24 = 2114;
    v25 = v11;
    _os_log_impl(&dword_18C849000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Did encounter authorization event: %{public}@", (uint8_t *)&v20, 0x20u);

  }
  switch(a4)
  {
    case 1uLL:
      -[AMSCardAuthorizationTask _metricsUserActionDictionary](self, "_metricsUserActionDictionary");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setObject:forKeyedSubscript:", CFSTR("authenticate"), CFSTR("actionType"));
      objc_msgSend(v12, "setObject:forKeyedSubscript:", CFSTR("invalidCredentials"), CFSTR("reason"));
      objc_msgSend(v12, "setObject:forKeyedSubscript:", CFSTR("failure"), CFSTR("result"));
      v13 = CFSTR("Biometric");
      goto LABEL_17;
    case 2uLL:
      -[AMSCardAuthorizationTask setDidBiometricsLockout:](self, "setDidBiometricsLockout:", 1);
      return;
    case 3uLL:
      -[AMSCardAuthorizationTask _metricsUserActionDictionary](self, "_metricsUserActionDictionary");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v14;
      v15 = CFSTR("open");
      goto LABEL_10;
    case 4uLL:
      -[AMSCardAuthorizationTask _metricsUserActionDictionary](self, "_metricsUserActionDictionary");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v14;
      v15 = CFSTR("cancel");
LABEL_10:
      objc_msgSend(v14, "setObject:forKeyedSubscript:", v15, CFSTR("actionType"));
      v13 = CFSTR("IForgot");
      goto LABEL_17;
    case 5uLL:
      -[AMSCardAuthorizationTask _metricsUserActionDictionary](self, "_metricsUserActionDictionary");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setObject:forKeyedSubscript:", CFSTR("invalidCredentials"), CFSTR("reason"));
      v16 = CFSTR("failure");
      v17 = CFSTR("result");
      v18 = v12;
      goto LABEL_16;
    case 6uLL:
      -[AMSCardAuthorizationTask setDidCancelHomeButton:](self, "setDidCancelHomeButton:", 1);
      return;
    case 7uLL:
      -[AMSCardAuthorizationTask _metricsUserActionDictionary](self, "_metricsUserActionDictionary");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v18;
      v16 = CFSTR("enterPasswordPressed");
      goto LABEL_15;
    case 8uLL:
      -[AMSCardAuthorizationTask _metricsUserActionDictionary](self, "_metricsUserActionDictionary");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v18;
      v16 = CFSTR("enterPasswordCancelled");
LABEL_15:
      v17 = CFSTR("actionType");
LABEL_16:
      objc_msgSend(v18, "setObject:forKeyedSubscript:", v16, v17);
      v13 = CFSTR("authenticate");
LABEL_17:
      objc_msgSend(v12, "setObject:forKeyedSubscript:", v13, CFSTR("targetId"));
      v19 = (void *)objc_msgSend(v12, "copy");

      if (v19)
      {
        -[NSMutableArray addObject:](self->_userActions, "addObject:", v19);

      }
      break;
    default:
      return;
  }
}

- (void)paymentAuthorizationController:(id)a3 willFinishWithError:(id)a4
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  id v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a4;
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
    v9 = (void *)objc_opt_class();
    v10 = v9;
    AMSSetLogKeyIfNeeded();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138543874;
    v13 = v9;
    v14 = 2114;
    v15 = v11;
    v16 = 2114;
    v17 = v5;
    _os_log_impl(&dword_18C849000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Payment sheet will finish with error: %{public}@", (uint8_t *)&v12, 0x20u);

  }
  objc_msgSend(v6, "setPrivateDelegate:", 0);

}

- (int64_t)confirmationStyle
{
  return self->_confirmationStyle;
}

- (void)setConfirmationStyle:(int64_t)a3
{
  self->_confirmationStyle = a3;
}

- (NSString)countryCode
{
  return self->_countryCode;
}

- (void)setCountryCode:(id)a3
{
  objc_storeStrong((id *)&self->_countryCode, a3);
}

- (NSString)currencyCode
{
  return self->_currencyCode;
}

- (void)setCurrencyCode:(id)a3
{
  objc_storeStrong((id *)&self->_currencyCode, a3);
}

- (AMSMetricsEvent)metricsEvent
{
  return self->_metricsEvent;
}

- (void)setMetricsEvent:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSString)passSerialNumber
{
  return self->_passSerialNumber;
}

- (void)setPassSerialNumber:(id)a3
{
  objc_storeStrong((id *)&self->_passSerialNumber, a3);
}

- (NSString)passTypeIdentifier
{
  return self->_passTypeIdentifier;
}

- (void)setPassTypeIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_passTypeIdentifier, a3);
}

- (NSDictionary)paymentSession
{
  return self->_paymentSession;
}

- (NSString)presentationSceneBundleIdentifier
{
  return self->_presentationSceneBundleIdentifier;
}

- (void)setPresentationSceneBundleIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_presentationSceneBundleIdentifier, a3);
}

- (NSString)presentationSceneIdentifier
{
  return self->_presentationSceneIdentifier;
}

- (void)setPresentationSceneIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_presentationSceneIdentifier, a3);
}

- (AMSMutableBinaryPromise)authorizationPromise
{
  return self->_authorizationPromise;
}

- (void)setAuthorizationPromise:(id)a3
{
  objc_storeStrong((id *)&self->_authorizationPromise, a3);
}

- (PKPayment)payment
{
  return self->_payment;
}

- (void)setPayment:(id)a3
{
  objc_storeStrong((id *)&self->_payment, a3);
}

- (BOOL)didBiometricsLockout
{
  return self->_didBiometricsLockout;
}

- (void)setDidBiometricsLockout:(BOOL)a3
{
  self->_didBiometricsLockout = a3;
}

- (BOOL)didCancelHomeButton
{
  return self->_didCancelHomeButton;
}

- (void)setDidCancelHomeButton:(BOOL)a3
{
  self->_didCancelHomeButton = a3;
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
  objc_storeStrong((id *)&self->_payment, 0);
  objc_storeStrong((id *)&self->_authorizationPromise, 0);
  objc_storeStrong((id *)&self->_presentationSceneIdentifier, 0);
  objc_storeStrong((id *)&self->_presentationSceneBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_paymentSession, 0);
  objc_storeStrong((id *)&self->_passTypeIdentifier, 0);
  objc_storeStrong((id *)&self->_passSerialNumber, 0);
  objc_storeStrong((id *)&self->_metricsEvent, 0);
  objc_storeStrong((id *)&self->_currencyCode, 0);
  objc_storeStrong((id *)&self->_countryCode, 0);
}

@end
