@implementation AMSGenerateFDSTask

- (AMSGenerateFDSTask)initWithPurchaseInfo:(id)a3 bag:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  void *v12;
  int v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  AMSFDSOptions *v19;
  void *v20;
  AMSFDSRequest *v21;
  void *v22;
  void *v23;
  void *v24;
  AMSFDSRequest *v25;
  AMSGenerateFDSTask *v26;
  int v28;
  uint64_t v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "purchase");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "logUUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "buyParams");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "price");
  if (v11 == 0.0)
  {
    objc_msgSend(v6, "buyParams");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "isFreeTrial");

    if (!v13)
    {
      v14 = 0;
      goto LABEL_8;
    }
  }
  else
  {

  }
  if (+[AMSGenerateFDSTask deviceSupportsAFDSPaidODIWithBag:logKey:](AMSGenerateFDSTask, "deviceSupportsAFDSPaidODIWithBag:logKey:", v7, v9))
  {
    v14 = 4;
  }
  else
  {
    v14 = 1;
  }
LABEL_8:
  +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v15)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v15, "OSLogObject");
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v17 = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v14);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = 138543874;
    v29 = v17;
    v30 = 2114;
    v31 = v9;
    v32 = 2114;
    v33 = v18;
    _os_log_impl(&dword_18C849000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Initializing AFDS task with action type: %{public}@", (uint8_t *)&v28, 0x20u);

  }
  v19 = objc_alloc_init(AMSFDSOptions);
  -[AMSFDSOptions setAction:](v19, "setAction:", v14);
  objc_msgSend(v6, "clientInfo");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSFDSOptions setClientInfo:](v19, "setClientInfo:", v20);

  v21 = [AMSFDSRequest alloc];
  objc_msgSend(v6, "purchase");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "uniqueIdentifier");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "account");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = -[AMSFDSRequest initWithPurchaseIdentifier:account:options:](v21, "initWithPurchaseIdentifier:account:options:", v23, v24, v19);

  -[AMSFDSRequest setLogKey:](v25, "setLogKey:", v9);
  v26 = -[AMSGenerateFDSTask initWithRequest:bag:](self, "initWithRequest:bag:", v25, v7);

  return v26;
}

- (AMSGenerateFDSTask)initWithRequest:(id)a3 bag:(id)a4
{
  id v7;
  id v8;
  AMSGenerateFDSTask *v9;
  AMSGenerateFDSTask *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)AMSGenerateFDSTask;
  v9 = -[AMSTask init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_bag, a4);
    objc_storeStrong((id *)&v10->_request, a3);
  }

  return v10;
}

- (ACAccount)account
{
  void *v2;
  void *v3;

  -[AMSGenerateFDSTask request](self, "request");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "account");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (ACAccount *)v3;
}

- (unint64_t)action
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[AMSGenerateFDSTask request](self, "request");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "options");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "action");

  return v4;
}

- (BOOL)deviceSupportsAFDSValues
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  char v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v17;
  uint8_t buf[4];
  uint64_t v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  -[AMSGenerateFDSTask logKey](self, "logKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = AMSSetLogKey(v3);

  -[AMSGenerateFDSTask bag](self, "bag");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "BOOLForKey:", 0x1E254D120);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  objc_msgSend(v6, "valueWithError:", &v17);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v17;
  v9 = objc_msgSend(v7, "BOOLValue");

  if (v8)
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
      AMSSetLogKeyIfNeeded();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      AMSHashIfNeeded(CFSTR("afds-enabled"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      AMSHashIfNeeded(v8);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v19 = v12;
      v20 = 2114;
      v21 = v13;
      v22 = 2114;
      v23 = v14;
      v24 = 2114;
      v25 = v15;
      _os_log_impl(&dword_18C849000, v11, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to determine if the device supports AFDS. key = %{public}@, error = %{public}@", buf, 0x2Au);

    }
  }

  return v9;
}

- (NSString)logKey
{
  void *v2;
  void *v3;

  -[AMSGenerateFDSTask request](self, "request");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "logKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSNumber)purchaseIdentifier
{
  void *v2;
  void *v3;

  -[AMSGenerateFDSTask request](self, "request");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "purchaseIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v3;
}

+ (BOOL)deviceSupportsAFDSPaidODIWithBag:(id)a3 logKey:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  double v10;
  double v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  void *v20;
  NSObject *v21;
  uint64_t v22;
  void *v23;
  _BOOL8 v24;
  double v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  id v32;
  uint8_t buf[4];
  uint64_t v34;
  __int16 v35;
  id v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  id v40;
  __int16 v41;
  void *v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "doubleForKey:", 0x1E254D100);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = 0;
  objc_msgSend(v7, "valueWithError:", &v32);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v32;
  objc_msgSend(v8, "doubleValue");
  v11 = v10;

  if (v9)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v12)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v12, "OSLogObject");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = objc_opt_class();
      AMSHashIfNeeded(CFSTR("afds-paid-odi-percentage"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v34 = v14;
      v35 = 2114;
      v36 = v6;
      v37 = 2114;
      v38 = v15;
      v39 = 2114;
      v40 = v9;
      _os_log_impl(&dword_18C849000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] No bag entry found for key: %{public}@, error: %{public}@", buf, 0x2Au);

    }
  }
  objc_msgSend(v5, "integerForKey:", 0x1E254D0E0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = v9;
  objc_msgSend(v16, "valueWithError:", &v31);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v31;

  v19 = objc_msgSend(v17, "integerValue");
  if (v18)
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
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      v22 = objc_opt_class();
      AMSHashIfNeeded(CFSTR("afds-paid-odi-duration"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v34 = v22;
      v35 = 2114;
      v36 = v6;
      v37 = 2114;
      v38 = v23;
      v39 = 2114;
      v40 = v18;
      _os_log_impl(&dword_18C849000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] No bag entry found for key: %{public}@, error: %{public}@", buf, 0x2Au);

    }
    LOBYTE(v24) = 0;
  }
  else
  {
    if (v9)
    {
      LOBYTE(v24) = 0;
      goto LABEL_16;
    }
    v26 = (double)v19;
    v24 = +[AMSDefaults shouldSampleWithPercentage:sessionDuration:identifier:](AMSDefaults, "shouldSampleWithPercentage:sessionDuration:identifier:", 0x1E2551740, v11, (double)v19);
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
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
      v27 = objc_opt_class();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v11);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v26);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v24);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544386;
      v34 = v27;
      v35 = 2114;
      v36 = v6;
      v37 = 2114;
      v38 = v28;
      v39 = 2114;
      v40 = v29;
      v41 = 2114;
      v42 = v30;
      _os_log_impl(&dword_18C849000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Sampling AFDSPaidODI with bag values: %{public}@, %{public}@, result: %{public}@", buf, 0x34u);

    }
  }

LABEL_16:
  return v24;
}

- (id)runTask
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __29__AMSGenerateFDSTask_runTask__block_invoke;
  v3[3] = &unk_1E253DB80;
  v3[4] = self;
  -[AMSTask performTaskWithPromiseBlock:](self, "performTaskWithPromiseBlock:", v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

id __29__AMSGenerateFDSTask_runTask__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  if ((objc_msgSend(*(id *)(a1 + 32), "deviceSupportsAFDSValues") & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "request");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    +[AMSFDSService generateFDSWithRequest:](AMSFDSService, "generateFDSWithRequest:", v2);
  }
  else
  {
    AMSError(5, CFSTR("Platform Not Supported"), CFSTR("AFDS is not supported on this platform."), 0);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    +[AMSPromise promiseWithError:](AMSPromise, "promiseWithError:", v2);
  }
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (AMSBagProtocol)bag
{
  return self->_bag;
}

- (BOOL)deviceSupportsAFDSValuesV2
{
  return self->_deviceSupportsAFDSValuesV2;
}

- (AMSFDSRequest)request
{
  return self->_request;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_bag, 0);
}

@end
