@implementation AMSPaymentSetupFeatureVerification

- (AMSPaymentSetupFeatureVerification)initWithIdentifier:(id)a3
{
  id v4;
  AMSPaymentSetupFeatureVerification *v5;
  uint64_t v6;
  NSString *identifier;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AMSPaymentSetupFeatureVerification;
  v5 = -[AMSPaymentSetupFeatureVerification init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

  }
  return v5;
}

- (BOOL)isPaymentSetupFeatureSupportedWithError:(id *)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  id v11;
  BOOL v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  id v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  AMSSetLogKeyIfNeeded();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSPaymentSetupFeatureVerification performPaymentSetupFeatureLookup](self, "performPaymentSetupFeatureLookup");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0;
  objc_msgSend(v5, "resultWithError:", &v21);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v21;
  if (v7)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
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
      v10 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      v23 = v10;
      v24 = 2114;
      v25 = v4;
      v26 = 2114;
      v27 = v7;
      v11 = v10;
      _os_log_impl(&dword_18C849000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Failed to find feature with error: %{public}@", buf, 0x20u);

    }
    goto LABEL_7;
  }
  if (!v6)
  {
LABEL_7:
    v12 = 0;
    goto LABEL_14;
  }
  +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
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
    v15 = (void *)objc_opt_class();
    v16 = (void *)MEMORY[0x1E0CB37E8];
    v17 = v15;
    objc_msgSend(v16, "numberWithInteger:", objc_msgSend(v6, "state"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    AMSHashIfNeeded(v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v23 = v15;
    v24 = 2114;
    v25 = v4;
    v26 = 2114;
    v27 = v19;
    _os_log_impl(&dword_18C849000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Candidate payment setup feature state: %{public}@", buf, 0x20u);

  }
  v12 = objc_msgSend(v6, "state") == 1;
LABEL_14:

  return v12;
}

- (id)performPaymentSetupFeatureLookup
{
  void *v3;
  AMSMutableLazyPromise *v4;
  id v5;
  AMSMutableLazyPromise *v6;
  _QWORD v8[4];
  id v9;
  id v10;
  id location;

  AMSSetLogKeyIfNeeded();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v4 = [AMSMutableLazyPromise alloc];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __70__AMSPaymentSetupFeatureVerification_performPaymentSetupFeatureLookup__block_invoke;
  v8[3] = &unk_1E253FB50;
  objc_copyWeak(&v10, &location);
  v5 = v3;
  v9 = v5;
  v6 = -[AMSMutableLazyPromise initWithBlock:](v4, "initWithBlock:", v8);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

  return v6;
}

void __70__AMSPaymentSetupFeatureVerification_performPaymentSetupFeatureLookup__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  id v5;
  void *v6;
  Class v7;
  id v8;
  _QWORD v9[5];
  id v10;
  id v11;
  _QWORD *v12;
  _QWORD v13[5];
  id v14;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = objc_alloc_init((Class)_MergedGlobals_72[0]());
  objc_msgSend(WeakRetained, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setReferrerIdentifier:", v6);

  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x3032000000;
  v13[3] = __Block_byref_object_copy__54;
  v13[4] = __Block_byref_object_dispose__54;
  v14 = 0;
  v7 = (Class)off_1ECEAA700();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __70__AMSPaymentSetupFeatureVerification_performPaymentSetupFeatureLookup__block_invoke_3;
  v9[3] = &unk_1E2544518;
  v9[4] = WeakRetained;
  v10 = *(id *)(a1 + 32);
  v12 = v13;
  v8 = v3;
  v11 = v8;
  -[objc_class paymentSetupFeaturesForConfiguration:completion:](v7, "paymentSetupFeaturesForConfiguration:completion:", v5, v9);

  _Block_object_dispose(v13, 8);
}

void __70__AMSPaymentSetupFeatureVerification_performPaymentSetupFeatureLookup__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  id v19;
  void *v20;
  _QWORD v21[5];
  id v22;
  uint64_t v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
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
    v6 = (void *)objc_opt_class();
    v7 = *(_QWORD *)(a1 + 40);
    v8 = (void *)MEMORY[0x1E0CB37E8];
    v9 = v6;
    objc_msgSend(v8, "numberWithUnsignedInteger:", objc_msgSend(v3, "count"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    AMSHashIfNeeded(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v25 = v6;
    v26 = 2114;
    v27 = v7;
    v28 = 2114;
    v29 = v11;
    _os_log_impl(&dword_18C849000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Found %{public}@ payment setup features", buf, 0x20u);

  }
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __70__AMSPaymentSetupFeatureVerification_performPaymentSetupFeatureLookup__block_invoke_4;
  v21[3] = &unk_1E25444F0;
  v12 = *(void **)(a1 + 40);
  v21[4] = *(_QWORD *)(a1 + 32);
  v13 = v12;
  v14 = *(_QWORD *)(a1 + 56);
  v22 = v13;
  v23 = v14;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v21);
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
  {
    objc_msgSend(*(id *)(a1 + 48), "finishWithResult:");
  }
  else
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
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = (void *)objc_opt_class();
      v18 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      v25 = v17;
      v26 = 2114;
      v27 = v18;
      v19 = v17;
      _os_log_impl(&dword_18C849000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Failed to find payment setup feature", buf, 0x16u);

    }
    AMSError(7, CFSTR("Payment Setup Feature Error"), CFSTR("Did not find payment setup feature"), 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "finishWithError:", v20);

  }
}

void __70__AMSPaymentSetupFeatureVerification_performPaymentSetupFeatureLookup__block_invoke_4(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v5;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  _BYTE *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  id v21;
  id v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v5 = a2;
  v29 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
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
    v10 = (void *)objc_opt_class();
    v11 = v5;
    v12 = a4;
    v13 = *(_QWORD *)(a1 + 40);
    v14 = (void *)MEMORY[0x1E0CB37E8];
    v22 = v10;
    objc_msgSend(v14, "numberWithInteger:", objc_msgSend(v7, "type"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    AMSHashIfNeeded(v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v24 = v10;
    v25 = 2114;
    v26 = v13;
    a4 = v12;
    v5 = v11;
    v27 = 2114;
    v28 = v16;
    _os_log_impl(&dword_18C849000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Checking payment setup feature with type: %{public}@", buf, 0x20u);

  }
  if (objc_msgSend(v7, "type") == 1)
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
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v19 = (void *)objc_opt_class();
      v20 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      v24 = v19;
      v25 = 2114;
      v26 = v20;
      v21 = v19;
      _os_log_impl(&dword_18C849000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Found candidate payment setup feature", buf, 0x16u);

    }
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), v5);
    *a4 = 1;
  }

}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
