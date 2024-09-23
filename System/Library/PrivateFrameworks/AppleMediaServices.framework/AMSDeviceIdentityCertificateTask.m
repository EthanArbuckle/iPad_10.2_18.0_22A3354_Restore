@implementation AMSDeviceIdentityCertificateTask

- (id)performDeviceIdentityRequestForAbsinthe
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v11;
  _QWORD v12[6];
  _QWORD v13[7];

  v13[6] = *MEMORY[0x1E0C80C00];
  v3 = *MEMORY[0x1E0D1D130];
  v12[0] = *MEMORY[0x1E0D1D120];
  v12[1] = v3;
  v13[0] = MEMORY[0x1E0C9AAB0];
  v13[1] = MEMORY[0x1E0C9AAA0];
  v4 = *MEMORY[0x1E0D1D140];
  v12[2] = *MEMORY[0x1E0D1D138];
  v12[3] = v4;
  v13[2] = CFSTR("apple");
  v13[3] = CFSTR("com.apple.AppleMediaServices.antifraud");
  v5 = *MEMORY[0x1E0D1D150];
  v13[4] = &unk_1E25AF3F8;
  v6 = *MEMORY[0x1E0D1D190];
  v12[4] = v5;
  v12[5] = v6;
  v11 = *MEMORY[0x1E0D1D198];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v11, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[5] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[AMSDeviceIdentityCertificateTask performDeviceIdentityRequestWithBaaOptions:ttlBagKey:logInformation:](self, "performDeviceIdentityRequestWithBaaOptions:ttlBagKey:logInformation:", v8, 0x1E254D140, CFSTR("fraud prevention"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)performDeviceIdentityRequestForFraudReport
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[2];
  _QWORD v13[6];
  _QWORD v14[7];

  v14[6] = *MEMORY[0x1E0C80C00];
  v3 = *MEMORY[0x1E0D1D130];
  v13[0] = *MEMORY[0x1E0D1D120];
  v13[1] = v3;
  v14[0] = MEMORY[0x1E0C9AAB0];
  v14[1] = MEMORY[0x1E0C9AAA0];
  v4 = *MEMORY[0x1E0D1D140];
  v13[2] = *MEMORY[0x1E0D1D138];
  v13[3] = v4;
  v14[2] = CFSTR("apple");
  v14[3] = CFSTR("com.apple.AppleMediaServices.fsr");
  v5 = *MEMORY[0x1E0D1D150];
  v14[4] = &unk_1E25AF410;
  v6 = *MEMORY[0x1E0D1D190];
  v13[4] = v5;
  v13[5] = v6;
  v7 = *MEMORY[0x1E0D1D178];
  v12[0] = *MEMORY[0x1E0D1D168];
  v12[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14[5] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[AMSDeviceIdentityCertificateTask performDeviceIdentityRequestWithBaaOptions:ttlBagKey:logInformation:](self, "performDeviceIdentityRequestWithBaaOptions:ttlBagKey:logInformation:", v9, 0x1E254CF80, CFSTR("fraud score report"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (AMSDeviceIdentityCertificateTask)initWithBag:(id)a3
{
  uint64_t v3;
  id v6;
  AMSDeviceIdentityCertificateTask *v7;
  _BOOL4 v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  dispatch_queue_t v23;
  OS_dispatch_queue *requestQueue;
  objc_super v26;
  uint8_t buf[4];
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v26.receiver = self;
  v26.super_class = (Class)AMSDeviceIdentityCertificateTask;
  v7 = -[AMSTask init](&v26, sel_init);
  if (v7)
  {
    if (!v6)
    {
      v8 = +[AMSUnitTests isRunningUnitTests](AMSUnitTests, "isRunningUnitTests");
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = (void *)v9;
      if (v8)
      {
        if (!v9)
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
            v3 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "stringWithFormat:", CFSTR("%@: [%@] "), v15, v3);
          }
          else
          {
            objc_msgSend(v13, "stringWithFormat:", CFSTR("%@: "), v14);
          }
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v28 = v16;
          _os_log_impl(&dword_18C849000, v11, OS_LOG_TYPE_ERROR, "%{public}@Bag wasn't provided. No identity request can be performed with this instance.", buf, 0xCu);
          if (v12)
          {

            v16 = (void *)v3;
          }

        }
        objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v17 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "postNotificationName:object:userInfo:", CFSTR("com.apple.AppleMediaServicesTests.FaultLogged"), v17, 0);
      }
      else
      {
        if (!v9)
        {
          +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v10, "OSLogObject");
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
        {
          AMSLogKey();
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = (void *)MEMORY[0x1E0CB3940];
          v20 = objc_opt_class();
          v21 = v20;
          if (v18)
          {
            AMSLogKey();
            v3 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "stringWithFormat:", CFSTR("%@: [%@] "), v21, v3);
          }
          else
          {
            objc_msgSend(v19, "stringWithFormat:", CFSTR("%@: "), v20);
          }
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v28 = v22;
          _os_log_impl(&dword_18C849000, v17, OS_LOG_TYPE_FAULT, "%{public}@Bag wasn't provided. No identity request can be performed with this instance.", buf, 0xCu);
          if (v18)
          {

            v22 = (void *)v3;
          }

        }
      }

    }
    objc_storeStrong((id *)&v7->_bag, a3);
    v23 = dispatch_queue_create("com.apple.AppleMediaServices.deviceIdentityRequest", 0);
    requestQueue = v7->_requestQueue;
    v7->_requestQueue = (OS_dispatch_queue *)v23;

  }
  return v7;
}

- (id)performDeviceIdentityRequestWithBaaOptions:(id)a3 ttlBagKey:(id)a4 logInformation:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  AMSMutableLazyPromise *v13;
  AMSMutableLazyPromise *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v24;
  _QWORD v25[4];
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id location[4];

  location[3] = *(id *)MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  AMSSetLogKeyIfNeeded();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSDeviceIdentityCertificateTask bag](self, "bag");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    objc_initWeak(location, self);
    v13 = [AMSMutableLazyPromise alloc];
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __104__AMSDeviceIdentityCertificateTask_performDeviceIdentityRequestWithBaaOptions_ttlBagKey_logInformation___block_invoke;
    v25[3] = &unk_1E2540EE0;
    objc_copyWeak(&v31, location);
    v26 = v11;
    v27 = v10;
    v28 = v12;
    v29 = v9;
    v30 = v8;
    v14 = -[AMSMutableLazyPromise initWithBlock:](v13, "initWithBlock:", v25);

    objc_destroyWeak(&v31);
    objc_destroyWeak(location);
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
        v24 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "stringWithFormat:", CFSTR("%@: [%@] "), v20, v24);
      }
      else
      {
        objc_msgSend(v18, "stringWithFormat:", CFSTR("%@: "), v19);
      }
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(location[0]) = 138543362;
      *(id *)((char *)location + 4) = v21;
      _os_log_impl(&dword_18C849000, v16, OS_LOG_TYPE_ERROR, "%{public}@Bag wasn't provided. No identity request will be performed.", (uint8_t *)location, 0xCu);
      if (v17)
      {

        v21 = (void *)v24;
      }

    }
    AMSError(0, CFSTR("Bag wasn't provided"), 0, 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    +[AMSPromise promiseWithError:](AMSPromise, "promiseWithError:", v22);
    v14 = (AMSMutableLazyPromise *)objc_claimAutoreleasedReturnValue();

  }
  return v14;
}

void __104__AMSDeviceIdentityCertificateTask_performDeviceIdentityRequestWithBaaOptions_ttlBagKey_logInformation___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  _QWORD v17[5];
  id v18;
  id v19;
  id v20;
  id v21;
  uint8_t buf[4];
  uint64_t v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (WeakRetained)
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
      v8 = objc_opt_class();
      v9 = *(_QWORD *)(a1 + 32);
      v10 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543874;
      v23 = v8;
      v24 = 2114;
      v25 = v9;
      v26 = 2114;
      v27 = v10;
      _os_log_impl(&dword_18C849000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Fetching BAA certs for %{public}@", buf, 0x20u);
    }

    objc_msgSend(*(id *)(a1 + 48), "integerForKey:", *(_QWORD *)(a1 + 56));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "valuePromise");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __104__AMSDeviceIdentityCertificateTask_performDeviceIdentityRequestWithBaaOptions_ttlBagKey_logInformation___block_invoke_36;
    v17[3] = &unk_1E2540EB8;
    v17[4] = WeakRetained;
    v18 = *(id *)(a1 + 32);
    v19 = v3;
    v20 = *(id *)(a1 + 64);
    v21 = *(id *)(a1 + 40);
    objc_msgSend(v12, "addFinishBlock:", v17);

  }
  else
  {
    if (!v5)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v6, "OSLogObject");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = objc_opt_class();
      v15 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      v23 = v14;
      v24 = 2114;
      v25 = v15;
      _os_log_impl(&dword_18C849000, v13, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] AMSDeviceIdentityCertificateTask unexpectedly deallocated", buf, 0x16u);
    }

    AMSError(0, CFSTR("Task unexpectedly deallocated"), 0, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "finishWithError:", v16);

  }
}

void __104__AMSDeviceIdentityCertificateTask_performDeviceIdentityRequestWithBaaOptions_ttlBagKey_logInformation___block_invoke_36(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  id v20;
  __int16 v21;
  id v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
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
      v10 = a1[5];
      *(_DWORD *)buf = 138544130;
      v18 = v9;
      v19 = 2114;
      v20 = v10;
      v21 = 2114;
      v22 = v6;
      v23 = 2114;
      v24 = v5;
      _os_log_impl(&dword_18C849000, v8, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Parsing certificate TTL failed with error: %{public}@, TTL: %{public}@", buf, 0x2Au);
    }

    objc_msgSend(a1[6], "finishWithError:", v6);
  }
  else
  {
    v11 = (void *)objc_msgSend(a1[7], "mutableCopy");
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v5, *MEMORY[0x1E0D1D1B0]);
    objc_msgSend(a1[4], "requestQueue");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v11, "copy");
    v14 = a1[5];
    v15 = a1[8];
    v16 = a1[6];
    DeviceIdentityIssueClientCertificateWithCompletion();

  }
}

void __104__AMSDeviceIdentityCertificateTask_performDeviceIdentityRequestWithBaaOptions_ttlBagKey_logInformation___block_invoke_37(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  AMSBAAKeychainItems *v19;
  __SecCertificate *v20;
  CFDataRef v21;
  __SecCertificate *v22;
  CFDataRef v23;
  AMSBAAKeychainItems *v24;
  int v25;
  uint64_t v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  uint64_t v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (v8)
  {
    if (!v9)
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
      v14 = *(_QWORD *)(a1 + 48);
      v25 = 138544130;
      v26 = v12;
      v27 = 2114;
      v28 = v13;
      v29 = 2114;
      v30 = v14;
      v31 = 2114;
      v32 = v8;
      _os_log_impl(&dword_18C849000, v11, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Fetch BAA certs for %{public}@ failed with error: %{public}@", (uint8_t *)&v25, 0x2Au);
    }

    objc_msgSend(*(id *)(a1 + 56), "finishWithError:", v8);
  }
  else
  {
    if (!v9)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v10, "OSLogObject");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = objc_opt_class();
      v17 = *(_QWORD *)(a1 + 40);
      v18 = *(_QWORD *)(a1 + 48);
      v25 = 138543874;
      v26 = v16;
      v27 = 2114;
      v28 = v17;
      v29 = 2114;
      v30 = v18;
      _os_log_impl(&dword_18C849000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Successfully retrieved BAA certs for %{public}@", (uint8_t *)&v25, 0x20u);
    }

    v19 = [AMSBAAKeychainItems alloc];
    objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
    v20 = (__SecCertificate *)objc_claimAutoreleasedReturnValue();
    v21 = SecCertificateCopyData(v20);
    objc_msgSend(v7, "objectAtIndexedSubscript:", 1);
    v22 = (__SecCertificate *)objc_claimAutoreleasedReturnValue();
    v23 = SecCertificateCopyData(v22);
    v24 = -[AMSBAAKeychainItems initWithBAACert:BIKKey:intermediateRootCert:](v19, "initWithBAACert:BIKKey:intermediateRootCert:", v21, a2, v23);

    objc_msgSend(*(id *)(a1 + 56), "finishWithResult:", v24);
  }

}

- (AMSBagProtocol)bag
{
  return self->_bag;
}

- (OS_dispatch_queue)requestQueue
{
  return self->_requestQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestQueue, 0);
  objc_storeStrong((id *)&self->_bag, 0);
}

@end
