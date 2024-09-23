@implementation AMSPurchaseTask

+ (AMSBagKeySet)bagKeySet
{
  return objc_alloc_init(AMSBagKeySet);
}

- (void)generateFDSWithInfo:(id)a3 bag:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  AMSGenerateFDSTask *v12;
  NSObject *v13;
  AMSGenerateFDSTask *v14;
  uint64_t v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  AMSGenerateFDSTask *v23;
  id v24;
  id v25;
  id v26;
  uint8_t buf[4];
  uint64_t v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "purchase");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "logUUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "purchase");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "purchaseType");

  if (v11 == 5)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v12 = (AMSGenerateFDSTask *)objc_claimAutoreleasedReturnValue();
    if (!v12)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v12 = (AMSGenerateFDSTask *)objc_claimAutoreleasedReturnValue();
    }
    -[AMSGenerateFDSTask OSLogObject](v12, "OSLogObject");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543618;
      v28 = objc_opt_class();
      v29 = 2114;
      v30 = v9;
      _os_log_impl(&dword_18C849000, v13, OS_LOG_TYPE_INFO, "%{public}@: [%{public}@] Skipping AFDS for VPP download", buf, 0x16u);
    }
  }
  else
  {
    v14 = -[AMSGenerateFDSTask initWithPurchaseInfo:bag:]([AMSGenerateFDSTask alloc], "initWithPurchaseInfo:bag:", v6, v7);
    -[AMSTask setRunMode:](v14, "setRunMode:", 1);
    -[AMSGenerateFDSTask runTask](v14, "runTask");
    v13 = objc_claimAutoreleasedReturnValue();
    objc_initWeak((id *)buf, self);
    v15 = MEMORY[0x1E0C809B0];
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __48__AMSPurchaseTask_FDS__generateFDSWithInfo_bag___block_invoke;
    v21[3] = &unk_1E2545220;
    objc_copyWeak(&v26, (id *)buf);
    v16 = v9;
    v22 = v16;
    v12 = v14;
    v23 = v12;
    v17 = v6;
    v24 = v17;
    v25 = v7;
    -[NSObject addErrorBlock:](v13, "addErrorBlock:", v21);
    v18[0] = v15;
    v18[1] = 3221225472;
    v18[2] = __48__AMSPurchaseTask_FDS__generateFDSWithInfo_bag___block_invoke_3;
    v18[3] = &unk_1E2545248;
    v19 = v16;
    v20 = v17;
    -[NSObject addSuccessBlock:](v13, "addSuccessBlock:", v18);

    objc_destroyWeak(&v26);
    objc_destroyWeak((id *)buf);
  }

}

void __48__AMSPurchaseTask_FDS__generateFDSWithInfo_bag___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if ((objc_msgSend(v3, "ams_hasDomain:code:", CFSTR("AMSErrorDomain"), 5) & 1) == 0)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v5, "OSLogObject");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = objc_opt_class();
      v8 = *(_QWORD *)(a1 + 32);
      v13 = 138543874;
      v14 = v7;
      v15 = 2114;
      v16 = v8;
      v17 = 2114;
      v18 = v3;
      _os_log_impl(&dword_18C849000, v6, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to generate AFDS, error = %{public}@", (uint8_t *)&v13, 0x20u);
    }

  }
  if (objc_msgSend(v3, "ams_hasDomain:", CFSTR("com.apple.asd.ca"))
    && objc_msgSend(*(id *)(a1 + 40), "action") == 4)
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
      v11 = objc_opt_class();
      v12 = *(_QWORD *)(a1 + 32);
      v13 = 138543618;
      v14 = v11;
      v15 = 2114;
      v16 = v12;
      _os_log_impl(&dword_18C849000, v10, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to generate ODI, attempting to fetch partial score", (uint8_t *)&v13, 0x16u);
    }

    objc_msgSend(WeakRetained, "_partialFDSWithInfo:bag:action:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), 4);
  }

}

void __48__AMSPurchaseTask_FDS__generateFDSWithInfo_bag___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
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
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = *(_QWORD *)(a1 + 32);
    objc_msgSend(v3, "value");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    AMSHashIfNeeded(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543618;
    v11 = v6;
    v12 = 2114;
    v13 = v8;
    _os_log_impl(&dword_18C849000, v5, OS_LOG_TYPE_DEFAULT, "AMSPurchaseQueue: [%{public}@] Successfully generated AFDS = %{public}@", (uint8_t *)&v10, 0x16u);

  }
  v9 = +[AMSFDSService cacheFDS:forPurchaseInfo:](AMSFDSService, "cacheFDS:forPurchaseInfo:", v3, *(_QWORD *)(a1 + 40));

}

- (void)_partialFDSWithInfo:(id)a3 bag:(id)a4 action:(unint64_t)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  AMSFDSOptions *v12;
  void *v13;
  AMSFDSRequest *v14;
  void *v15;
  void *v16;
  void *v17;
  AMSFDSRequest *v18;
  AMSGeneratePartialFDSTask *v19;
  void *v20;
  uint64_t v21;
  id v22;
  id v23;
  id v24;
  _QWORD v25[4];
  id v26;
  id v27;
  unint64_t v28;
  _QWORD v29[5];
  id v30;
  unint64_t v31;

  v8 = a3;
  v9 = a4;
  objc_msgSend(v8, "purchase");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "logUUID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_alloc_init(AMSFDSOptions);
  -[AMSFDSOptions setAction:](v12, "setAction:", a5);
  objc_msgSend(v8, "clientInfo");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSFDSOptions setClientInfo:](v12, "setClientInfo:", v13);

  v14 = [AMSFDSRequest alloc];
  objc_msgSend(v8, "purchase");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "uniqueIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "account");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[AMSFDSRequest initWithPurchaseIdentifier:account:options:](v14, "initWithPurchaseIdentifier:account:options:", v16, v17, v12);

  -[AMSFDSRequest setLogKey:](v18, "setLogKey:", v11);
  v19 = -[AMSGeneratePartialFDSTask initWithRequest:bag:]([AMSGeneratePartialFDSTask alloc], "initWithRequest:bag:", v18, v9);

  -[AMSTask setRunMode:](v19, "setRunMode:", 1);
  -[AMSGeneratePartialFDSTask runTask](v19, "runTask");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = MEMORY[0x1E0C809B0];
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __55__AMSPurchaseTask_FDS___partialFDSWithInfo_bag_action___block_invoke;
  v29[3] = &unk_1E2545270;
  v29[4] = self;
  v22 = v11;
  v30 = v22;
  v31 = a5;
  objc_msgSend(v20, "addErrorBlock:", v29);
  v25[0] = v21;
  v25[1] = 3221225472;
  v25[2] = __55__AMSPurchaseTask_FDS___partialFDSWithInfo_bag_action___block_invoke_10;
  v25[3] = &unk_1E2545298;
  v27 = v8;
  v28 = a5;
  v26 = v22;
  v23 = v8;
  v24 = v22;
  objc_msgSend(v20, "addSuccessBlock:", v25);

}

void __55__AMSPurchaseTask_FDS___partialFDSWithInfo_bag_action___block_invoke(uint64_t a1, void *a2)
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
  id v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if ((objc_msgSend(v3, "ams_hasDomain:code:", CFSTR("AMSErrorDomain"), 5) & 1) == 0)
  {
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
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 48));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138544130;
      v10 = v6;
      v11 = 2114;
      v12 = v7;
      v13 = 2114;
      v14 = v3;
      v15 = 2114;
      v16 = v8;
      _os_log_impl(&dword_18C849000, v5, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to fetch partial AFDS, error = %{public}@, action: %{public}@", (uint8_t *)&v9, 0x2Au);

    }
  }

}

void __55__AMSPurchaseTask_FDS___partialFDSWithInfo_bag_action___block_invoke_10(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  void *v16;
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
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = a1[4];
    objc_msgSend(v3, "value");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    AMSHashIfNeeded(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a1[6]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543874;
    v12 = v6;
    v13 = 2114;
    v14 = v8;
    v15 = 2114;
    v16 = v9;
    _os_log_impl(&dword_18C849000, v5, OS_LOG_TYPE_DEFAULT, "AMSPurchaseQueue: [%{public}@] Successfully generated partial AFDS = %{public}@, action = %{public}@", (uint8_t *)&v11, 0x20u);

  }
  v10 = +[AMSFDSService cacheFDS:forPurchaseInfo:](AMSFDSService, "cacheFDS:forPurchaseInfo:", v3, a1[5]);

}

- (void)_regenerateFDSWithInfo:(id)a3 bag:(id)a4 action:(unint64_t)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  AMSFDSOptions *v12;
  void *v13;
  AMSFDSRequest *v14;
  void *v15;
  void *v16;
  void *v17;
  AMSFDSRequest *v18;
  AMSGenerateFDSTask *v19;
  void *v20;
  uint64_t v21;
  id v22;
  id v23;
  id v24;
  _QWORD v25[4];
  id v26;
  id v27;
  unint64_t v28;
  _QWORD v29[5];
  id v30;
  unint64_t v31;

  v8 = a3;
  v9 = a4;
  objc_msgSend(v8, "purchase");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "logUUID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_alloc_init(AMSFDSOptions);
  -[AMSFDSOptions setAction:](v12, "setAction:", a5);
  objc_msgSend(v8, "clientInfo");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSFDSOptions setClientInfo:](v12, "setClientInfo:", v13);

  v14 = [AMSFDSRequest alloc];
  objc_msgSend(v8, "purchase");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "uniqueIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "account");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[AMSFDSRequest initWithPurchaseIdentifier:account:options:](v14, "initWithPurchaseIdentifier:account:options:", v16, v17, v12);

  -[AMSFDSRequest setLogKey:](v18, "setLogKey:", v11);
  v19 = -[AMSGenerateFDSTask initWithRequest:bag:]([AMSGenerateFDSTask alloc], "initWithRequest:bag:", v18, v9);

  -[AMSTask setRunMode:](v19, "setRunMode:", 1);
  -[AMSGenerateFDSTask runTask](v19, "runTask");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = MEMORY[0x1E0C809B0];
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __58__AMSPurchaseTask_FDS___regenerateFDSWithInfo_bag_action___block_invoke;
  v29[3] = &unk_1E2545270;
  v29[4] = self;
  v22 = v11;
  v30 = v22;
  v31 = a5;
  objc_msgSend(v20, "addErrorBlock:", v29);
  v25[0] = v21;
  v25[1] = 3221225472;
  v25[2] = __58__AMSPurchaseTask_FDS___regenerateFDSWithInfo_bag_action___block_invoke_11;
  v25[3] = &unk_1E2545298;
  v27 = v8;
  v28 = a5;
  v26 = v22;
  v23 = v8;
  v24 = v22;
  objc_msgSend(v20, "addSuccessBlock:", v25);

}

void __58__AMSPurchaseTask_FDS___regenerateFDSWithInfo_bag_action___block_invoke(uint64_t a1, void *a2)
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
  id v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if ((objc_msgSend(v3, "ams_hasDomain:code:", CFSTR("AMSErrorDomain"), 5) & 1) == 0)
  {
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
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 48));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138544130;
      v10 = v6;
      v11 = 2114;
      v12 = v7;
      v13 = 2114;
      v14 = v3;
      v15 = 2114;
      v16 = v8;
      _os_log_impl(&dword_18C849000, v5, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed second attempt to generate AFDS, error = %{public}@, action: %{public}@", (uint8_t *)&v9, 0x2Au);

    }
  }

}

void __58__AMSPurchaseTask_FDS___regenerateFDSWithInfo_bag_action___block_invoke_11(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  void *v16;
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
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = a1[4];
    objc_msgSend(v3, "value");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    AMSHashIfNeeded(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a1[6]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543874;
    v12 = v6;
    v13 = 2114;
    v14 = v8;
    v15 = 2114;
    v16 = v9;
    _os_log_impl(&dword_18C849000, v5, OS_LOG_TYPE_DEFAULT, "AMSPurchaseQueue: [%{public}@] Successfully generated AFDS = %{public}@, action = %{public}@", (uint8_t *)&v11, 0x20u);

  }
  v10 = +[AMSFDSService cacheFDS:forPurchaseInfo:](AMSFDSService, "cacheFDS:forPurchaseInfo:", v3, a1[5]);

}

- (AMSPurchaseTask)initWithPurchase:(id)a3 bag:(id)a4
{
  id v6;
  id v7;
  AMSPurchaseTask *v8;
  uint64_t v9;
  Class paymentSheetTaskClass;
  AMSPurchaseInfo *v11;
  AMSPurchaseInfo *purchaseInfo;
  AMSPurchaseRequestEncoder *v13;
  AMSPurchaseRequestEncoder *purchaseRequestEncoder;
  void *v15;
  void *v16;
  void *v17;
  AMSURLSession *v18;
  AMSURLSession *session;
  AMSPurchaseProtocolHandler *v20;
  objc_super v22;

  v6 = a3;
  v7 = a4;
  v22.receiver = self;
  v22.super_class = (Class)AMSPurchaseTask;
  v8 = -[AMSTask init](&v22, sel_init);
  if (v8)
  {
    objc_opt_class();
    v9 = objc_claimAutoreleasedReturnValue();
    paymentSheetTaskClass = v8->_paymentSheetTaskClass;
    v8->_paymentSheetTaskClass = (Class)v9;

    v11 = -[AMSPurchaseInfo initWithPurchase:]([AMSPurchaseInfo alloc], "initWithPurchase:", v6);
    purchaseInfo = v8->_purchaseInfo;
    v8->_purchaseInfo = v11;

    -[AMSPurchaseInfo setActivePurchaseTask:](v8->_purchaseInfo, "setActivePurchaseTask:", v8);
    objc_storeStrong((id *)&v8->_bag, a4);
    v13 = -[AMSPurchaseRequestEncoder initWithPurchaseInfo:bag:]([AMSPurchaseRequestEncoder alloc], "initWithPurchaseInfo:bag:", v8->_purchaseInfo, v8->_bag);
    purchaseRequestEncoder = v8->_purchaseRequestEncoder;
    v8->_purchaseRequestEncoder = v13;

    v15 = (void *)MEMORY[0x1E0C92CA0];
    +[AMSProcessInfo currentProcess](AMSProcessInfo, "currentProcess");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "ams_configurationWithProcessInfo:bag:", v16, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = -[AMSURLSession initWithConfiguration:delegate:delegateQueue:]([AMSURLSession alloc], "initWithConfiguration:delegate:delegateQueue:", v17, v8, 0);
    session = v8->_session;
    v8->_session = v18;

    v20 = objc_alloc_init(AMSPurchaseProtocolHandler);
    -[AMSURLSession setProtocolHandler:](v8->_session, "setProtocolHandler:", v20);

  }
  return v8;
}

- (AMSPurchaseDelegate)delegate
{
  void *v2;
  void *v3;

  -[AMSPurchaseTask purchaseInfo](self, "purchaseInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (AMSPurchaseDelegate *)v3;
}

- (void)setDelegate:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[AMSPurchaseTask purchaseInfo](self, "purchaseInfo");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDelegate:", v4);

}

- (BOOL)_shouldAttemptCardEnrollment
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[AMSPurchaseTask purchaseInfo](self, "purchaseInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "purchase");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "purchaseType");

  return (v4 > 5) | (9u >> v4) & 1;
}

- (BOOL)_shouldGenerateAFDSWithPurchaseInfo:(id)a3
{
  id v3;
  void *v4;
  char v5;
  void *v6;
  char v7;
  BOOL v8;
  void *v9;
  uint64_t v10;
  BOOL v11;

  v3 = a3;
  objc_msgSend(v3, "account");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "ams_isEphemeralAccount");

  if ((v5 & 1) != 0
    || (objc_msgSend(v3, "purchase"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v6, "isRedownload"),
        v6,
        (v7 & 1) != 0))
  {
    v8 = 0;
  }
  else
  {
    objc_msgSend(v3, "purchase");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "purchaseType");

    if (v10)
      v11 = v10 == 3;
    else
      v11 = 1;
    v8 = v11;
  }

  return v8;
}

- (id)performPurchase
{
  void *v3;
  _QWORD v5[4];
  id v6;
  id location;

  objc_initWeak(&location, self);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __34__AMSPurchaseTask_performPurchase__block_invoke;
  v5[3] = &unk_1E2540BC8;
  objc_copyWeak(&v6, &location);
  -[AMSTask performTaskWithPromiseBlock:](self, "performTaskWithPromiseBlock:", v5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
  return v3;
}

id __34__AMSPurchaseTask_performPurchase__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  int v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _BOOL4 v17;
  void *v18;
  void *v19;
  void *v20;
  _BOOL4 v21;
  void *v22;
  NSObject *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  _BOOL4 v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  NSObject *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  char v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  id v52;
  void *v53;
  id v54;
  id v55;
  uint64_t v57;
  _QWORD v58[4];
  id v59;
  id v60;
  _QWORD v61[4];
  id v62;
  id v63;
  _QWORD v64[5];
  _QWORD v65[4];
  id v66;
  id v67;
  char v68;
  _QWORD v69[5];
  _QWORD v70[4];
  id v71;
  id v72;
  id v73;
  _QWORD v74[4];
  id v75;
  id v76;
  id v77;
  uint8_t buf[4];
  void *v79;
  uint64_t v80;

  v80 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "purchaseInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "purchase");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "logUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "purchaseInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSLogConfig sharedPurchaseConfig](AMSLogConfig, "sharedPurchaseConfig");
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
    v8 = (void *)MEMORY[0x1E0CB3940];
    v9 = objc_opt_class();
    if (v4)
      objc_msgSend(v8, "stringWithFormat:", CFSTR("%@: [%@] "), v9, v4);
    else
      objc_msgSend(v8, "stringWithFormat:", CFSTR("%@: "), v9, v57);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v79 = v10;
    _os_log_impl(&dword_18C849000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@Starting purchase task", buf, 0xCu);

  }
  v11 = objc_msgSend(WeakRetained, "_shouldGenerateAFDSWithPurchaseInfo:", v5);
  v12 = v11;
  if (v11)
  {
    objc_msgSend(WeakRetained, "bag");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "generateFDSWithInfo:bag:", v5, v13);

  }
  if (objc_msgSend(WeakRetained, "_shouldAttemptCardEnrollment"))
  {
    objc_msgSend(WeakRetained, "bag");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "purchaseInfo");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "account");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = +[AMSCardEnrollment beginCardEnrollmentAttemptWithBag:account:](AMSCardEnrollment, "beginCardEnrollmentAttemptWithBag:account:", v14, v16);

    if (v17)
    {
      +[AMSCardEnrollment paymentServicesMerchantURL](AMSCardEnrollment, "paymentServicesMerchantURL");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "purchaseInfo");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setPaymentServicesURL:", v18);

    }
    objc_msgSend(WeakRetained, "bag");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = +[AMSFinanceExpressCheckoutResponse isEligibleForBag:](AMSFinanceExpressCheckoutResponse, "isEligibleForBag:", v20);

    if (v21)
    {
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
        v24 = (void *)MEMORY[0x1E0CB3940];
        v25 = objc_opt_class();
        if (v4)
          objc_msgSend(v24, "stringWithFormat:", CFSTR("%@: [%@] "), v25, v4);
        else
          objc_msgSend(v24, "stringWithFormat:", CFSTR("%@: "), v25, v57);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v79 = v26;
        _os_log_impl(&dword_18C849000, v23, OS_LOG_TYPE_DEFAULT, "%{public}@AURUM storefront is eligible for Express Checkout", buf, 0xCu);

      }
      objc_msgSend(WeakRetained, "bag");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      if (+[AMSFinanceExpressCheckoutResponse isExpressCheckoutShouldCheckForWalletBiometricsForBag:](AMSFinanceExpressCheckoutResponse, "isExpressCheckoutShouldCheckForWalletBiometricsForBag:", v27))
      {
        v28 = +[AMSDevice isWalletBiometricsEnabled](AMSDevice, "isWalletBiometricsEnabled");

        if (v28)
        {
          +[AMSCardEnrollment paymentServicesMerchantURL](AMSCardEnrollment, "paymentServicesMerchantURL");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(WeakRetained, "purchaseInfo");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "setPaymentServicesURL:", v29);

          objc_msgSend(WeakRetained, "purchaseInfo");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "buyParams");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(WeakRetained, "bag");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "numberWithBool:", +[AMSCardEnrollment isApplePayWalletRefreshedForBag:](AMSCardEnrollment, "isApplePayWalletRefreshedForBag:", v34));
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "setParameter:forKey:", v35, CFSTR("isApplePayWalletRefreshed"));

LABEL_33:
          goto LABEL_34;
        }
      }
      else
      {

      }
      +[AMSLogConfig sharedPurchaseConfig](AMSLogConfig, "sharedPurchaseConfig");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v36)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v36, "OSLogObject");
      v37 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        v38 = (void *)MEMORY[0x1E0CB3940];
        v39 = objc_opt_class();
        if (v4)
          objc_msgSend(v38, "stringWithFormat:", CFSTR("%@: [%@] "), v39, v4);
        else
          objc_msgSend(v38, "stringWithFormat:", CFSTR("%@: "), v39, v57);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v79 = v40;
        _os_log_impl(&dword_18C849000, v37, OS_LOG_TYPE_DEFAULT, "%{public}@When Wallet & Apple Pay biometrics toggle is OFF then ExpressCheckout is ineligible, remove the paymentServicesURL", buf, 0xCu);

      }
      objc_msgSend(WeakRetained, "purchaseInfo");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "setPaymentServicesURL:", 0);
      goto LABEL_33;
    }
  }
LABEL_34:
  objc_msgSend(v5, "purchase");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = objc_msgSend(v41, "requiresAccount");
  v43 = MEMORY[0x1E0C809B0];
  if ((v42 & 1) != 0)
  {
    objc_msgSend(v5, "account");
    v44 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v44)
    {
      objc_msgSend(WeakRetained, "_promptForAccount");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v74[0] = v43;
      v74[1] = 3221225472;
      v74[2] = __34__AMSPurchaseTask_performPurchase__block_invoke_15;
      v74[3] = &unk_1E25452C0;
      v75 = v4;
      v76 = WeakRetained;
      v77 = v5;
      objc_msgSend(v45, "addSuccessBlock:", v74);
      objc_msgSend(v45, "binaryPromiseAdapter");
      v46 = (void *)objc_claimAutoreleasedReturnValue();

      v47 = v75;
      goto LABEL_40;
    }
  }
  else
  {

  }
  v48 = (void *)objc_opt_class();
  objc_msgSend(WeakRetained, "purchaseInfo");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v48) = objc_msgSend(v48, "shouldPreauthenticatePurchaseWithInfo:", v49);

  if (!(_DWORD)v48)
  {
    +[AMSBinaryPromise promiseWithSuccess](AMSBinaryPromise, "promiseWithSuccess");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_42;
  }
  objc_msgSend(WeakRetained, "performPreauthenticate");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v70[0] = v43;
  v70[1] = 3221225472;
  v70[2] = __34__AMSPurchaseTask_performPurchase__block_invoke_17;
  v70[3] = &unk_1E25452C0;
  v71 = v4;
  v72 = WeakRetained;
  v73 = v5;
  objc_msgSend(v45, "addSuccessBlock:", v70);
  objc_msgSend(v45, "binaryPromiseAdapter");
  v46 = (void *)objc_claimAutoreleasedReturnValue();

  v47 = v71;
LABEL_40:

LABEL_42:
  objc_msgSend(v46, "promiseAdapter");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v69[0] = v43;
  v69[1] = 3221225472;
  v69[2] = __34__AMSPurchaseTask_performPurchase__block_invoke_19;
  v69[3] = &unk_1E253E440;
  v69[4] = WeakRetained;
  objc_msgSend(v50, "thenWithBlock:", v69);
  v51 = (void *)objc_claimAutoreleasedReturnValue();

  v65[0] = v43;
  v65[1] = 3221225472;
  v65[2] = __34__AMSPurchaseTask_performPurchase__block_invoke_2;
  v65[3] = &unk_1E25452E8;
  v68 = v12;
  v66 = v5;
  v67 = WeakRetained;
  v52 = v5;
  objc_msgSend(v51, "continueWithBlock:", v65);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v64[0] = v43;
  v64[1] = 3221225472;
  v64[2] = __34__AMSPurchaseTask_performPurchase__block_invoke_5;
  v64[3] = &unk_1E2545310;
  v64[4] = WeakRetained;
  objc_msgSend(v53, "addSuccessBlock:", v64);
  v61[0] = v43;
  v61[1] = 3221225472;
  v61[2] = __34__AMSPurchaseTask_performPurchase__block_invoke_6;
  v61[3] = &unk_1E253D950;
  v54 = v4;
  v62 = v54;
  v63 = WeakRetained;
  objc_msgSend(v53, "addErrorBlock:", v61);
  v58[0] = v43;
  v58[1] = 3221225472;
  v58[2] = __34__AMSPurchaseTask_performPurchase__block_invoke_33;
  v58[3] = &unk_1E2545338;
  v59 = v54;
  v60 = WeakRetained;
  v55 = v54;
  objc_msgSend(v53, "addSuccessBlock:", v58);

  return v53;
}

uint64_t __34__AMSPurchaseTask_performPurchase__block_invoke_15(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v12;
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
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
    v7 = *(_QWORD *)(a1 + 32);
    v8 = objc_opt_class();
    if (v7)
      objc_msgSend(v6, "stringWithFormat:", CFSTR("%@: [%@] "), v8, *(_QWORD *)(a1 + 32));
    else
      objc_msgSend(v6, "stringWithFormat:", CFSTR("%@: "), v8, v12);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v14 = v9;
    _os_log_impl(&dword_18C849000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@'hasBeenAuthedForBuy' flag set: Pre-Flight Authentication", buf, 0xCu);

  }
  objc_msgSend(v3, "account");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 48), "setAccount:", v10);
  return objc_msgSend(*(id *)(a1 + 48), "setHasBeenAuthedForBuy:", 1);
}

uint64_t __34__AMSPurchaseTask_performPurchase__block_invoke_17(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v9;
  uint8_t buf[4];
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
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
      objc_msgSend(v4, "stringWithFormat:", CFSTR("%@: [%@] "), v6, *(_QWORD *)(a1 + 32));
    else
      objc_msgSend(v4, "stringWithFormat:", CFSTR("%@: "), v6, v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v11 = v7;
    _os_log_impl(&dword_18C849000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@'hasBeenAuthedForBuy' flag set: Device Restrictions", buf, 0xCu);

  }
  return objc_msgSend(*(id *)(a1 + 48), "setHasBeenAuthedForBuy:", 1);
}

uint64_t __34__AMSPurchaseTask_performPurchase__block_invoke_19(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "performPurchaseRequest");
}

id __34__AMSPurchaseTask_performPurchase__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  AMSPurchaseResult *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char isKindOfClass;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  int v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  id v26;
  AMSPurchaseResult *v27;
  void *v28;
  _QWORD v30[4];
  AMSPurchaseResult *v31;
  id v32;
  _QWORD v33[5];

  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v7 = objc_alloc_init(AMSPurchaseResult);
    objc_msgSend(v5, "object");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSPurchaseResult setResponseDictionary:](v7, "setResponseDictionary:", v8);

    objc_msgSend(*(id *)(a1 + 32), "purchase");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSPurchaseResult setPurchase:](v7, "setPurchase:", v9);

    objc_msgSend(v5, "response");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSPurchaseResult setURLResponse:](v7, "setURLResponse:", v10);

    objc_msgSend(v5, "loadURLEventDictionary");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSPurchaseResult setLoadURLEventDictionary:](v7, "setLoadURLEventDictionary:", v11);

    -[AMSPurchaseResult setDidShowPaymentSheet:](v7, "setDidShowPaymentSheet:", objc_msgSend(*(id *)(a1 + 32), "didShowPaymentSheet"));
  }
  else
  {
    v7 = 0;
  }
  objc_msgSend(v5, "response");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v5, "response");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "allHeaderFields");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("X-Apple-Jingle-Correlation-Key"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    -[AMSPurchaseResult setCorrelationID:](v7, "setCorrelationID:", v16);
  }
  if (*(_BYTE *)(a1 + 48))
    v17 = +[AMSFDSService cacheFDS:forPurchaseInfo:](AMSFDSService, "cacheFDS:forPurchaseInfo:", 0, *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 32), "account");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "ams_isEphemeralAccount");

  v20 = MEMORY[0x1E0C809B0];
  if (v19)
  {
    +[AMSBinaryPromise promiseWithSuccess](AMSBinaryPromise, "promiseWithSuccess");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v23 = *(_QWORD *)(a1 + 32);
    v22 = *(void **)(a1 + 40);
    objc_msgSend(v5, "object");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "_recordEngagementEventWithInfo:responseDictionary:error:", v23, v24, v6);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    v33[0] = v20;
    v33[1] = 3221225472;
    v33[2] = __34__AMSPurchaseTask_performPurchase__block_invoke_3;
    v33[3] = &unk_1E253DBD8;
    v33[4] = *(_QWORD *)(a1 + 40);
    objc_msgSend(v21, "addSuccessBlock:", v33);
  }
  objc_msgSend(v21, "promiseAdapter");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = v20;
  v30[1] = 3221225472;
  v30[2] = __34__AMSPurchaseTask_performPurchase__block_invoke_4;
  v30[3] = &unk_1E253D820;
  v31 = v7;
  v32 = v6;
  v26 = v6;
  v27 = v7;
  objc_msgSend(v25, "continueWithBlock:", v30);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  return v28;
}

void __34__AMSPurchaseTask_performPurchase__block_invoke_3(uint64_t a1)
{
  void *v1;
  id v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "bag");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  +[AMSMetrics internalInstanceUsingBag:](AMSMetrics, "internalInstanceUsingBag:", v3);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (id)objc_msgSend(v1, "flush");

}

id __34__AMSPurchaseTask_performPurchase__block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v10;

  v5 = a2;
  v6 = a3;
  if (*(_QWORD *)(a1 + 32))
  {
    +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!*(_QWORD *)(a1 + 40))
    {
      AMSError(0, CFSTR("No Purchase Result"), 0, 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      +[AMSPromise promiseWithError:](AMSPromise, "promiseWithError:", v10);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_6;
    }
    +[AMSPromise promiseWithError:](AMSPromise, "promiseWithError:");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  v8 = (void *)v7;
LABEL_6:

  return v8;
}

void __34__AMSPurchaseTask_performPurchase__block_invoke_5(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "bag");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "purchaseInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "buyParams");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSCardEnrollment finishCardEnrollmentAttemptWithBag:buyParams:purchaseResult:](AMSCardEnrollment, "finishCardEnrollmentAttemptWithBag:buyParams:purchaseResult:", v7, v6, v4);

}

void __34__AMSPurchaseTask_performPurchase__block_invoke_6(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  +[AMSLogConfig sharedPurchaseConfig](AMSLogConfig, "sharedPurchaseConfig");
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
    v6 = (void *)MEMORY[0x1E0CB3940];
    v7 = *(_QWORD *)(a1 + 32);
    v8 = objc_opt_class();
    if (v7)
      objc_msgSend(v6, "stringWithFormat:", CFSTR("%@: [%@] "), v8, *(_QWORD *)(a1 + 32));
    else
      objc_msgSend(v6, "stringWithFormat:", CFSTR("%@: "), v8, v11);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    AMSLogableError(v3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v13 = v9;
    v14 = 2114;
    v15 = v10;
    _os_log_impl(&dword_18C849000, v5, OS_LOG_TYPE_ERROR, "%{public}@Purchase completed with error: %{public}@", buf, 0x16u);

  }
}

void __34__AMSPurchaseTask_performPurchase__block_invoke_33(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint8_t buf[4];
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
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
      objc_msgSend(v4, "stringWithFormat:", CFSTR("%@: [%@] "), v6, *(_QWORD *)(a1 + 32));
    else
      objc_msgSend(v4, "stringWithFormat:", CFSTR("%@: "), v6, v8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v10 = v7;
    _os_log_impl(&dword_18C849000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@Purchase completed successfully", buf, 0xCu);

  }
}

+ (NSString)bagSubProfile
{
  return +[AMSPurchaseBagConsumer bagSubProfile](AMSPurchaseBagConsumer, "bagSubProfile");
}

+ (NSString)bagSubProfileVersion
{
  return +[AMSPurchaseBagConsumer bagSubProfileVersion](AMSPurchaseBagConsumer, "bagSubProfileVersion");
}

+ (id)createBagForSubProfile
{
  return +[AMSPurchaseBagConsumer createBagForSubProfile](AMSPurchaseBagConsumer, "createBagForSubProfile");
}

+ (id)_filterResponseDictionary:(id)a3
{
  void *v3;
  void *v4;

  if (a3)
  {
    objc_msgSend(a3, "ams_dictionaryRemovingKeys:", &unk_1E25B0170);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    +[AMSMetricsEvent sanitizedObject:](AMSMetricsEvent, "sanitizedObject:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)_promptForAccount
{
  AMSAuthenticateOptions *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  AMSAuthenticateRequest *v13;
  void *v14;

  v4 = objc_alloc_init(AMSAuthenticateOptions);
  -[AMSAuthenticateOptions setAuthenticationType:](v4, "setAuthenticationType:", 2);
  -[AMSPurchaseTask purchaseInfo](self, "purchaseInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "clientInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSAuthenticateOptions setClientInfo:](v4, "setClientInfo:", v6);

  v7 = (void *)MEMORY[0x1E0CB3940];
  v8 = (objc_class *)objc_opt_class();
  NSStringFromClass(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("-[%@ %@]"), v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSAuthenticateOptions setDebugReason:](v4, "setDebugReason:", v11);

  -[AMSAuthenticateOptions setEnableAccountCreation:](v4, "setEnableAccountCreation:", 1);
  -[AMSAuthenticateOptions setIgnoreAccountConversion:](v4, "setIgnoreAccountConversion:", 1);
  AMSLogKey();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSAuthenticateOptions setLogKey:](v4, "setLogKey:", v12);

  v13 = -[AMSAuthenticateRequest initWithDSID:altDSID:username:options:]([AMSAuthenticateRequest alloc], "initWithDSID:altDSID:username:options:", 0, 0, 0, v4);
  -[AMSPurchaseTask _runAuthenticateRequest:](self, "_runAuthenticateRequest:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)_recordEngagementEventWithInfo:(id)a3 responseDictionary:(id)a4 error:(id)a5
{
  uint64_t v5;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  AMSEngagement *v21;
  void *v22;
  AMSEngagement *v23;
  void *v24;
  void *v25;
  AMSMutableBinaryPromise *v26;
  uint64_t v27;
  AMSMutableBinaryPromise *v28;
  id v29;
  AMSMutableBinaryPromise *v30;
  _QWORD v32[5];
  _QWORD v33[4];
  AMSMutableBinaryPromise *v34;
  id v35;
  AMSPurchaseTask *v36;
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  void *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a5;
  v11 = a4;
  objc_msgSend((id)objc_opt_class(), "engagementEventWithInfo:responseDictionary:error:", v9, v11, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

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
    AMSLogKey();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)MEMORY[0x1E0CB3940];
    v17 = objc_opt_class();
    v18 = v17;
    if (v15)
    {
      AMSLogKey();
      v5 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "stringWithFormat:", CFSTR("%@: [%@] "), v18, v5);
    }
    else
    {
      objc_msgSend(v16, "stringWithFormat:", CFSTR("%@: "), v17);
    }
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "propertyForBodyKey:", CFSTR("success"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v38 = v19;
    v39 = 2114;
    v40 = v20;
    _os_log_impl(&dword_18C849000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@Recording engagement event. success: %{public}@", buf, 0x16u);
    if (v15)
    {

      v19 = (void *)v5;
    }

  }
  v21 = [AMSEngagement alloc];
  -[AMSPurchaseTask bag](self, "bag");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = -[AMSEngagement initWithBag:](v21, "initWithBag:", v22);

  objc_msgSend(v12, "dictionaryForPosting");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSEngagement enqueueData:](v23, "enqueueData:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = objc_alloc_init(AMSMutableBinaryPromise);
  v27 = MEMORY[0x1E0C809B0];
  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = __75__AMSPurchaseTask__recordEngagementEventWithInfo_responseDictionary_error___block_invoke;
  v33[3] = &unk_1E2545360;
  v28 = v26;
  v34 = v28;
  v35 = v9;
  v36 = self;
  v29 = v9;
  objc_msgSend(v25, "addFinishBlock:", v33);
  v32[0] = v27;
  v32[1] = 3221225472;
  v32[2] = __75__AMSPurchaseTask__recordEngagementEventWithInfo_responseDictionary_error___block_invoke_56;
  v32[3] = &unk_1E253E120;
  v32[4] = self;
  -[AMSBinaryPromise addErrorBlock:](v28, "addErrorBlock:", v32);
  v30 = v28;

  return v30;
}

void __75__AMSPurchaseTask__recordEngagementEventWithInfo_responseDictionary_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  _QWORD v24[5];
  id v25;
  uint8_t buf[4];
  uint64_t v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = v5;
  if (a3)
  {
    objc_msgSend(*(id *)(a1 + 32), "finishWithError:", a3);
  }
  else
  {
    objc_msgSend(v5, "request");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(*(id *)(a1 + 40), "delegate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_opt_respondsToSelector();

      if ((v9 & 1) != 0)
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
          AMSLogKey();
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v27 = v12;
          v28 = 2114;
          v29 = v13;
          _os_log_impl(&dword_18C849000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Handling engagement request", buf, 0x16u);

        }
        objc_msgSend(*(id *)(a1 + 40), "delegate");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "purchase");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "request");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v24[0] = MEMORY[0x1E0C809B0];
        v24[1] = 3221225472;
        v24[2] = __75__AMSPurchaseTask__recordEngagementEventWithInfo_responseDictionary_error___block_invoke_53;
        v24[3] = &unk_1E253FED0;
        v24[4] = *(_QWORD *)(a1 + 48);
        v25 = *(id *)(a1 + 32);
        objc_msgSend(v14, "purchase:handleEngagementRequest:completion:", v15, v16, v24);

      }
      else
      {
        objc_msgSend(*(id *)(a1 + 40), "delegate");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        AMSErrorWithFormat(2, CFSTR("Engagement presentation failed"), CFSTR("Delegate does not respond: %@"), v18, v19, v20, v21, v22, (uint64_t)v17);
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(*(id *)(a1 + 32), "finishWithError:", v23);
      }
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "finishWithSuccess");
    }
  }

}

void __75__AMSPurchaseTask__recordEngagementEventWithInfo_responseDictionary_error___block_invoke_53(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
  {
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
      v7 = objc_opt_class();
      AMSLogKey();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138543618;
      v10 = v7;
      v11 = 2114;
      v12 = v8;
      _os_log_impl(&dword_18C849000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Engagement completed successfully", (uint8_t *)&v9, 0x16u);

    }
  }
  objc_msgSend(*(id *)(a1 + 40), "finishWithSuccess:error:", v4 == 0, v4);

}

void __75__AMSPurchaseTask__recordEngagementEventWithInfo_responseDictionary_error___block_invoke_56(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  +[AMSLogConfig sharedPurchaseConfig](AMSLogConfig, "sharedPurchaseConfig");
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
    AMSLogKey();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)MEMORY[0x1E0CB3940];
    v8 = objc_opt_class();
    v9 = v8;
    if (v6)
    {
      AMSLogKey();
      a1 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "stringWithFormat:", CFSTR("%@: [%@] "), v9, a1);
    }
    else
    {
      objc_msgSend(v7, "stringWithFormat:", CFSTR("%@: "), v8);
    }
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    AMSLogableError(v3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v13 = v10;
    v14 = 2114;
    v15 = v11;
    _os_log_impl(&dword_18C849000, v5, OS_LOG_TYPE_ERROR, "%{public}@Engagement failed. %{public}@", buf, 0x16u);
    if (v6)
    {

      v10 = (void *)a1;
    }

  }
}

- (id)_runAuthenticateRequest:(id)a3
{
  id v4;
  void *v5;
  char v6;
  AMSPromise *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  -[AMSPurchaseTask delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    v7 = objc_alloc_init(AMSPromise);
    -[AMSPurchaseTask delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSPurchaseTask purchaseInfo](self, "purchaseInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "purchase");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSPromise completionHandlerAdapter](v7, "completionHandlerAdapter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "purchase:handleAuthenticateRequest:completion:", v10, v4, v11);

  }
  else
  {
    AMSError(12, CFSTR("Purchase Authentication Failed"), CFSTR("Delegate does not respond to auth callback"), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[AMSPromise promiseWithError:](AMSPromise, "promiseWithError:", v8);
    v7 = (AMSPromise *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- (id)_runDialogRequest:(id)a3
{
  id v4;
  void *v5;
  char v6;
  AMSPromise *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  -[AMSPurchaseTask delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    v7 = objc_alloc_init(AMSPromise);
    -[AMSPurchaseTask delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSPurchaseTask purchaseInfo](self, "purchaseInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "purchase");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSPromise completionHandlerAdapter](v7, "completionHandlerAdapter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "purchase:handleDialogRequest:completion:", v10, v4, v11);

  }
  else
  {
    AMSError(12, CFSTR("Purchase Dialog Failed"), CFSTR("Delegate does not respond to dialog callback"), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[AMSPromise promiseWithError:](AMSPromise, "promiseWithError:", v8);
    v7 = (AMSPromise *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- (void)authenticateTask:(id)a3 handleDialogRequest:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  int v16;
  uint64_t v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a5;
  -[AMSPurchaseTask delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[AMSPurchaseTask delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSPurchaseTask purchaseInfo](self, "purchaseInfo");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "purchase");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "purchase:handleDialogRequest:completion:", v12, v7, v8);

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
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = objc_opt_class();
      AMSLogKey();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138543618;
      v17 = v14;
      v18 = 2114;
      v19 = v15;
      _os_log_impl(&dword_18C849000, v13, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Auth task dialog is being dropped as there is no purchase delegate set on this task.", (uint8_t *)&v16, 0x16u);

    }
  }

}

- (Class)paymentSheetTaskClass
{
  return self->_paymentSheetTaskClass;
}

- (void)setPaymentSheetTaskClass:(Class)a3
{
  objc_storeStrong((id *)&self->_paymentSheetTaskClass, a3);
}

- (AMSBagProtocol)bag
{
  return self->_bag;
}

- (void)setBag:(id)a3
{
  objc_storeStrong((id *)&self->_bag, a3);
}

- (AMSPurchaseInfo)purchaseInfo
{
  return self->_purchaseInfo;
}

- (void)setPurchaseInfo:(id)a3
{
  objc_storeStrong((id *)&self->_purchaseInfo, a3);
}

- (AMSPurchaseRequestEncoder)purchaseRequestEncoder
{
  return self->_purchaseRequestEncoder;
}

- (void)setPurchaseRequestEncoder:(id)a3
{
  objc_storeStrong((id *)&self->_purchaseRequestEncoder, a3);
}

- (AMSURLSession)session
{
  return self->_session;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_purchaseRequestEncoder, 0);
  objc_storeStrong((id *)&self->_purchaseInfo, 0);
  objc_storeStrong((id *)&self->_bag, 0);
  objc_storeStrong((id *)&self->_paymentSheetTaskClass, 0);
}

+ (id)engagementEventWithInfo:(id)a3 responseDictionary:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  _BOOL4 v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  const __CFString *v36;
  uint64_t v37;
  void *v38;
  const __CFString *v39;
  uint64_t v40;
  void *v41;
  const __CFString *v42;
  void *v43;
  _QWORD v45[4];
  _QWORD v46[5];

  v46[4] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v10 = a4;
  v11 = +[AMSDefaults forceEngagementPurchaseSuccess](AMSDefaults, "forceEngagementPurchaseSuccess");
  if (v9)
    v12 = v11;
  else
    v12 = 1;
  v13 = -[AMSMetricsEvent initForEngagement]([AMSMetricsEvent alloc], "initForEngagement");
  objc_msgSend(v13, "setProperty:forBodyKey:", CFSTR("purchase"), CFSTR("eventType"));
  objc_msgSend(v13, "setProperty:forBodyKey:", CFSTR("AMS"), CFSTR("source"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setProperty:forBodyKey:", v14, CFSTR("success"));

  v15 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v8, "purchase");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "numberWithInteger:", objc_msgSend(v16, "purchaseType"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setProperty:forBodyKey:", v17, CFSTR("purchaseType"));

  objc_msgSend(v8, "purchase");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "account");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "ams_DSID");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "description");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setProperty:forBodyKey:", v21, CFSTR("accountId"));

  objc_msgSend(v8, "purchase");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "buyParams");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "dictionary");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSMetricsEvent sanitizedObject:](AMSMetricsEvent, "sanitizedObject:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setProperty:forBodyKey:", v25, CFSTR("buyParameters"));

  objc_msgSend(a1, "_filterResponseDictionary:", v10);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setProperty:forBodyKey:", v26, CFSTR("responseDictionary"));

  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("metrics"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v28 = v27;

    if (v28)
      objc_msgSend(v13, "addPropertiesWithDictionary:", v28);
  }
  else
  {

    v28 = 0;
  }
  objc_msgSend(v8, "purchase");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "metricsOverlay");
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  if (v30)
  {
    objc_msgSend(v8, "purchase");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "metricsOverlay");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addPropertiesWithDictionary:", v32);

  }
  if (v9)
  {
    v45[0] = CFSTR("code");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v9, "code"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v46[0] = v33;
    v45[1] = CFSTR("domain");
    objc_msgSend(v9, "domain");
    v34 = objc_claimAutoreleasedReturnValue();
    v35 = (void *)v34;
    if (v34)
      v36 = (const __CFString *)v34;
    else
      v36 = &stru_1E2548760;
    v46[1] = v36;
    v45[2] = CFSTR("title");
    objc_msgSend(v9, "ams_title");
    v37 = objc_claimAutoreleasedReturnValue();
    v38 = (void *)v37;
    if (v37)
      v39 = (const __CFString *)v37;
    else
      v39 = &stru_1E2548760;
    v46[2] = v39;
    v45[3] = CFSTR("message");
    objc_msgSend(v9, "ams_message");
    v40 = objc_claimAutoreleasedReturnValue();
    v41 = (void *)v40;
    if (v40)
      v42 = (const __CFString *)v40;
    else
      v42 = &stru_1E2548760;
    v46[3] = v42;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v46, v45, 4);
    v43 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "setProperty:forBodyKey:", v43, CFSTR("error"));
  }

  return v13;
}

- (BOOL)performPreActionRequestForTaskInfo:(id)a3 requiresAuthorization:(BOOL)a4 error:(id *)a5
{
  return 1;
}

- (id)performPreauthenticate
{
  void *v3;
  NSObject *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  AMSAuthenticateRequest *v9;
  void *v10;
  void *v11;
  AMSAuthenticateRequest *v12;
  void *v13;
  void *v14;
  _QWORD v16[5];
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
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
    AMSLogKey();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v18 = v5;
    v19 = 2114;
    v20 = v7;
    _os_log_impl(&dword_18C849000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Attempting to pre-authenticate purchase for device restrictions", buf, 0x16u);

  }
  -[AMSPurchaseTask preauthenticateOptions](self, "preauthenticateOptions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = [AMSAuthenticateRequest alloc];
  -[AMSPurchaseTask purchaseInfo](self, "purchaseInfo");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "account");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[AMSAuthenticateRequest initWithAccount:options:](v9, "initWithAccount:options:", v11, v8);

  AMSLogKey();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSAuthenticateRequest setLogKey:](v12, "setLogKey:", v13);

  -[AMSPurchaseTask _runAuthenticateRequest:](self, "_runAuthenticateRequest:", v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __69__AMSPurchaseTask_AppleMediaServices_Project__performPreauthenticate__block_invoke;
  v16[3] = &unk_1E253E238;
  v16[4] = self;
  objc_msgSend(v14, "addFinishBlock:", v16);

  return v14;
}

void __69__AMSPurchaseTask_AppleMediaServices_Project__performPreauthenticate__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
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
      v8 = (void *)objc_opt_class();
      v9 = v8;
      AMSLogKey();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543874;
      v16 = v8;
      v17 = 2114;
      v18 = v10;
      v19 = 2114;
      v20 = v5;
      _os_log_impl(&dword_18C849000, v7, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Purchase pre-authentication for device restrictions failed with error: %{public}@", (uint8_t *)&v15, 0x20u);

    }
  }
  else
  {
    objc_msgSend(a2, "authenticationResults");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "valueForKey:", *MEMORY[0x1E0CFFF70]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v13 = v12;
    else
      v13 = 0;

    objc_msgSend(*(id *)(a1 + 32), "purchaseInfo");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setIdmsTokens:", v13);

  }
}

- (id)performPurchaseRequest
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v16;
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  -[AMSPurchaseTask purchaseInfo](self, "purchaseInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "purchase");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "logUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  +[AMSLogConfig sharedPurchaseConfig](AMSLogConfig, "sharedPurchaseConfig");
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
    v8 = (void *)MEMORY[0x1E0CB3940];
    v9 = objc_opt_class();
    if (v5)
      objc_msgSend(v8, "stringWithFormat:", CFSTR("%@: [%@] "), v9, v5);
    else
      objc_msgSend(v8, "stringWithFormat:", CFSTR("%@: "), v9, v16);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v18 = v10;
    _os_log_impl(&dword_18C849000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@Performing purchase", buf, 0xCu);

  }
  -[AMSPurchaseTask purchaseRequestEncoder](self, "purchaseRequestEncoder");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSPurchaseTask session](self, "session");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "encodeRequest");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "dataTaskPromiseWithRequestPromise:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)preauthenticateOptions
{
  AMSAuthenticateOptions *v3;
  void *v4;
  void *v5;

  v3 = objc_alloc_init(AMSAuthenticateOptions);
  -[AMSAuthenticateOptions setAuthenticationType:](v3, "setAuthenticationType:", 2);
  -[AMSAuthenticateOptions setCanMakeAccountActive:](v3, "setCanMakeAccountActive:", 0);
  -[AMSPurchaseTask purchaseInfo](self, "purchaseInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "clientInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSAuthenticateOptions setClientInfo:](v3, "setClientInfo:", v5);

  -[AMSAuthenticateOptions setDebugReason:](v3, "setDebugReason:", CFSTR("Pre-authentication due to device restrictions around purchasing."));
  return v3;
}

+ (BOOL)shouldPreauthenticatePurchaseWithInfo:(id)a3
{
  id v3;
  BOOL v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  void *v8;
  id v9;
  void *v10;
  NSObject *v11;
  void *v12;
  id v13;
  void *v14;
  const char *v15;
  void *v16;
  NSObject *v17;
  os_log_type_t v18;
  void *v19;
  void *v20;
  _BOOL4 v21;
  void *v22;
  void *v23;
  int v24;
  uint64_t v25;
  void *v26;
  BOOL v27;
  void *v29;
  id v30;
  void *v31;
  int v32;
  void *v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = +[AMSRestrictions requirePasswordImmediately](AMSRestrictions, "requirePasswordImmediately");
  +[AMSLogConfig sharedPurchaseConfig](AMSLogConfig, "sharedPurchaseConfig");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (!v4)
  {
    if (!v5)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v6, "OSLogObject");
    v11 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      goto LABEL_27;
    v16 = (void *)objc_opt_class();
    v13 = v16;
    AMSSetLogKeyIfNeeded();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = 138543618;
    v33 = v16;
    v34 = 2114;
    v35 = v14;
    v15 = "%{public}@: [%{public}@] Purchase pre-authentication not required.";
    v17 = v11;
    v18 = OS_LOG_TYPE_INFO;
    goto LABEL_26;
  }
  if (!v5)
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
    v32 = 138543618;
    v33 = v8;
    v34 = 2114;
    v35 = v10;
    _os_log_impl(&dword_18C849000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Purchase requires pre-authentication.", (uint8_t *)&v32, 0x16u);

  }
  if (objc_msgSend(v3, "hasBeenAuthedForBuy"))
  {
    +[AMSLogConfig sharedPurchaseConfig](AMSLogConfig, "sharedPurchaseConfig");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v6, "OSLogObject");
    v11 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      goto LABEL_27;
    v12 = (void *)objc_opt_class();
    v13 = v12;
    AMSSetLogKeyIfNeeded();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = 138543618;
    v33 = v12;
    v34 = 2114;
    v35 = v14;
    v15 = "%{public}@: [%{public}@] Purchase has already been authed, skipping purchase pre-authentication.";
    goto LABEL_25;
  }
  objc_msgSend(v3, "purchase");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "account");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = +[AMSBiometrics isAvailableForAccount:](AMSBiometrics, "isAvailableForAccount:", v20);

  if (v21)
  {
    +[AMSLogConfig sharedPurchaseConfig](AMSLogConfig, "sharedPurchaseConfig");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v6, "OSLogObject");
    v11 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      goto LABEL_27;
    v22 = (void *)objc_opt_class();
    v13 = v22;
    AMSSetLogKeyIfNeeded();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = 138543618;
    v33 = v22;
    v34 = 2114;
    v35 = v14;
    v15 = "%{public}@: [%{public}@] Biometrics enabled, skipping purchase pre-authentication.";
    goto LABEL_25;
  }
  objc_msgSend(v3, "purchase");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "ignoreRequirePasswordRestriction");

  +[AMSLogConfig sharedPurchaseConfig](AMSLogConfig, "sharedPurchaseConfig");
  v25 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v25;
  if (v24)
  {
    if (!v25)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v6, "OSLogObject");
    v11 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      goto LABEL_27;
    v26 = (void *)objc_opt_class();
    v13 = v26;
    AMSSetLogKeyIfNeeded();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = 138543618;
    v33 = v26;
    v34 = 2114;
    v35 = v14;
    v15 = "%{public}@: [%{public}@] Purchase is configured to ignore password restriction, skipping purchase pre-authentication.";
LABEL_25:
    v17 = v11;
    v18 = OS_LOG_TYPE_DEFAULT;
LABEL_26:
    _os_log_impl(&dword_18C849000, v17, v18, v15, (uint8_t *)&v32, 0x16u);

LABEL_27:
    v27 = 0;
    goto LABEL_28;
  }
  if (!v25)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v6, "OSLogObject");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v29 = (void *)objc_opt_class();
    v30 = v29;
    AMSSetLogKeyIfNeeded();
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = 138543618;
    v33 = v29;
    v34 = 2114;
    v35 = v31;
    _os_log_impl(&dword_18C849000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Enforcing purchase pre-authentication.", (uint8_t *)&v32, 0x16u);

  }
  v27 = 1;
LABEL_28:

  return v27;
}

@end
