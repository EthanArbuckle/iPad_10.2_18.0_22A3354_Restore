@implementation AMSCardRegistrationTask

- (AMSCardRegistrationTask)initWithCountryCode:(id)a3 merchantIdentifier:(id)a4
{
  id v6;
  id v7;
  AMSCardRegistrationTask *v8;
  uint64_t v9;
  NSString *countryCode;
  uint64_t v11;
  NSString *merchantIdentifier;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)AMSCardRegistrationTask;
  v8 = -[AMSTask init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    countryCode = v8->_countryCode;
    v8->_countryCode = (NSString *)v9;

    v11 = objc_msgSend(v7, "copy");
    merchantIdentifier = v8->_merchantIdentifier;
    v8->_merchantIdentifier = (NSString *)v11;

  }
  return v8;
}

- (id)performCardRegistration
{
  void *v3;
  _QWORD v5[5];
  id v6;
  id location;

  objc_initWeak(&location, self);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __50__AMSCardRegistrationTask_performCardRegistration__block_invoke;
  v5[3] = &unk_1E253FE08;
  objc_copyWeak(&v6, &location);
  v5[4] = self;
  -[AMSTask performTaskWithBlock:](self, "performTaskWithBlock:", v5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
  return v3;
}

id __50__AMSCardRegistrationTask_performCardRegistration__block_invoke(uint64_t a1, void **a2)
{
  id WeakRetained;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  id v18;
  int v20;
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
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
    v8 = (void *)objc_opt_class();
    v9 = *(void **)(a1 + 32);
    v10 = v8;
    objc_msgSend(v9, "countryCode");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 138543874;
    v21 = v8;
    v22 = 2114;
    v23 = v5;
    v24 = 2114;
    v25 = v11;
    _os_log_impl(&dword_18C849000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Attempting to fetch wallet card data with countryCode: %{public}@", (uint8_t *)&v20, 0x20u);

  }
  objc_msgSend(WeakRetained, "_performCardRegistration");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "resultWithError:", a2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v14)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v14, "OSLogObject");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v16 = (void *)objc_opt_class();
      v17 = *a2;
      v20 = 138543874;
      v21 = v16;
      v22 = 2114;
      v23 = v5;
      v24 = 2114;
      v25 = v17;
      v18 = v16;
      _os_log_impl(&dword_18C849000, v15, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to fetch wallet card data with error: %{public}@", (uint8_t *)&v20, 0x20u);

    }
  }

  return v13;
}

- (id)_performCardRegistration
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
  v5[2] = __51__AMSCardRegistrationTask__performCardRegistration__block_invoke;
  v5[3] = &unk_1E253FE58;
  objc_copyWeak(&v6, &location);
  v3 = -[AMSMutableLazyPromise initWithBlock:](v2, "initWithBlock:", v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
  return v3;
}

void __51__AMSCardRegistrationTask__performCardRegistration__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  _QWORD *v12;
  _QWORD v13[5];
  id v14;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x3032000000;
  v13[3] = __Block_byref_object_copy__16;
  v13[4] = __Block_byref_object_dispose__16;
  v14 = 0;
  v5 = objc_alloc_init((Class)getPKInAppPaymentServiceClass[0]());
  objc_msgSend(WeakRetained, "merchantIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "countryCode");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "uppercaseString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __51__AMSCardRegistrationTask__performCardRegistration__block_invoke_9;
  v10[3] = &unk_1E253FE30;
  v10[4] = WeakRetained;
  v9 = v3;
  v11 = v9;
  v12 = v13;
  objc_msgSend(v5, "cardDataForMerchantIdentifier:countryCode:completion:", v6, v8, v10);

  _Block_object_dispose(v13, 8);
}

void __51__AMSCardRegistrationTask__performCardRegistration__block_invoke_9(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  id v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  AMSCardRegistrationResult *v37;
  uint64_t v38;
  void *v39;
  NSObject *v40;
  id v41;
  _BYTE v42[24];
  void *v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  AMSSetLogKeyIfNeeded();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "error");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

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
      objc_msgSend(v3, "error");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v42 = 138543874;
      *(_QWORD *)&v42[4] = v8;
      *(_WORD *)&v42[12] = 2114;
      *(_QWORD *)&v42[14] = v4;
      *(_WORD *)&v42[22] = 2114;
      v43 = v10;
      _os_log_impl(&dword_18C849000, v7, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Card registration failed with error: %{public}@", v42, 0x20u);

    }
    v11 = *(void **)(a1 + 40);
    objc_msgSend(v3, "error");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v11;
LABEL_7:
    objc_msgSend(v13, "finishWithError:", v12, *(_OWORD *)v42, *(_QWORD *)&v42[16]);

    goto LABEL_26;
  }
  +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)v14;
  if (!v3)
  {
    if (!v14)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v15, "OSLogObject");
    v40 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v42 = 138543618;
      *(_QWORD *)&v42[4] = objc_opt_class();
      *(_WORD *)&v42[12] = 2114;
      *(_QWORD *)&v42[14] = v4;
      v41 = *(id *)&v42[4];
      _os_log_impl(&dword_18C849000, v40, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Card registration failed for no response", v42, 0x16u);

    }
    AMSError(7, CFSTR("Card Registration Error"), CFSTR("Card Registration Not Found"), 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = *(void **)(a1 + 40);
    goto LABEL_7;
  }
  if (!v14)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v15, "OSLogObject");
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v42 = 138543618;
    *(_QWORD *)&v42[4] = objc_opt_class();
    *(_WORD *)&v42[12] = 2114;
    *(_QWORD *)&v42[14] = v4;
    v17 = *(id *)&v42[4];
    _os_log_impl(&dword_18C849000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Card registration success", v42, 0x16u);

  }
  +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v18)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v18, "OSLogObject", *(_QWORD *)v42, *(_OWORD *)&v42[8]);
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    v20 = (void *)objc_opt_class();
    v21 = (void *)MEMORY[0x1E0CB37E8];
    v22 = v20;
    objc_msgSend(v3, "cardData");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "numberWithUnsignedInteger:", objc_msgSend(v23, "length"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v42 = 138543874;
    *(_QWORD *)&v42[4] = v20;
    *(_WORD *)&v42[12] = 2114;
    *(_QWORD *)&v42[14] = v4;
    *(_WORD *)&v42[22] = 2114;
    v43 = v24;
    _os_log_impl(&dword_18C849000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Card registration data: %{public}@", v42, 0x20u);

  }
  +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v25)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v25, "OSLogObject");
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    v27 = (void *)objc_opt_class();
    v28 = v27;
    objc_msgSend(v3, "brokerURL");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    AMSLogableURL(v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v42 = 138543874;
    *(_QWORD *)&v42[4] = v27;
    *(_WORD *)&v42[12] = 2114;
    *(_QWORD *)&v42[14] = v4;
    *(_WORD *)&v42[22] = 2114;
    v43 = v30;
    _os_log_impl(&dword_18C849000, v26, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Card registration broker URL: %{public}@", v42, 0x20u);

  }
  +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v31)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v31, "OSLogObject");
  v32 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
  {
    v33 = (void *)objc_opt_class();
    v34 = v33;
    objc_msgSend(v3, "paymentServicesURL");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    AMSLogableURL(v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v42 = 138543874;
    *(_QWORD *)&v42[4] = v33;
    *(_WORD *)&v42[12] = 2114;
    *(_QWORD *)&v42[14] = v4;
    *(_WORD *)&v42[22] = 2114;
    v43 = v36;
    _os_log_impl(&dword_18C849000, v32, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Card registration payment services URL: %{public}@", v42, 0x20u);

  }
  v37 = -[AMSCardRegistrationResult initWithCardRegistrationResponse:]([AMSCardRegistrationResult alloc], "initWithCardRegistrationResponse:", v3);
  v38 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v39 = *(void **)(v38 + 40);
  *(_QWORD *)(v38 + 40) = v37;

  objc_msgSend(*(id *)(a1 + 40), "finishWithResult:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
LABEL_26:

}

- (NSString)countryCode
{
  return self->_countryCode;
}

- (void)setCountryCode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)merchantIdentifier
{
  return self->_merchantIdentifier;
}

- (void)setMerchantIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_merchantIdentifier, 0);
  objc_storeStrong((id *)&self->_countryCode, 0);
}

@end
