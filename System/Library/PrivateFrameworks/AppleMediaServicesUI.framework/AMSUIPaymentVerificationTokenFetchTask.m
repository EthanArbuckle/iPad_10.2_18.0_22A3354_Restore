@implementation AMSUIPaymentVerificationTokenFetchTask

- (AMSUIPaymentVerificationTokenFetchTask)initWithMode:(unint64_t)a3 account:(id)a4 viewController:(id)a5 bag:(id)a6 displayName:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  AMSUIPaymentVerificationTokenFetchTask *v16;
  AMSUIPaymentVerificationTokenFetchTask *v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  void *v21;
  objc_super v23;
  uint8_t buf[4];
  uint64_t v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  v23.receiver = self;
  v23.super_class = (Class)AMSUIPaymentVerificationTokenFetchTask;
  v16 = -[AMSTask init](&v23, sel_init);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_account, a4);
    objc_storeStrong((id *)&v17->_bag, a6);
    objc_storeStrong((id *)&v17->_displayName, a7);
    objc_storeStrong((id *)&v17->_viewController, a5);
    objc_msgSend(MEMORY[0x24BE081D8], "sharedAccountsConfig");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v18)
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v18, "OSLogObject");
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v20 = objc_opt_class();
      AMSLogKey();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v25 = v20;
      v26 = 2114;
      v27 = v21;
      _os_log_impl(&dword_211102000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Creating task with ACAccount", buf, 0x16u);

    }
  }

  return v17;
}

- (AMSUIPaymentVerificationTokenFetchTask)initWithMode:(unint64_t)a3 accountParameters:(id)a4 viewController:(id)a5 bag:(id)a6 displayName:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  AMSUIPaymentVerificationTokenFetchTask *v16;
  AMSUIPaymentVerificationTokenFetchTask *v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  void *v21;
  objc_super v23;
  uint8_t buf[4];
  uint64_t v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  v23.receiver = self;
  v23.super_class = (Class)AMSUIPaymentVerificationTokenFetchTask;
  v16 = -[AMSTask init](&v23, sel_init);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_accountParameters, a4);
    objc_storeStrong((id *)&v17->_bag, a6);
    objc_storeStrong((id *)&v17->_displayName, a7);
    objc_storeStrong((id *)&v17->_viewController, a5);
    objc_msgSend(MEMORY[0x24BE081D8], "sharedAccountsConfig");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v18)
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v18, "OSLogObject");
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v20 = objc_opt_class();
      AMSLogKey();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v25 = v20;
      v26 = 2114;
      v27 = v21;
      _os_log_impl(&dword_211102000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Creating task with accountParameters", buf, 0x16u);

    }
  }

  return v17;
}

- (id)performTask
{
  void *v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  AMSUIPaymentVerificationMetrics *v7;
  void *v8;
  void *v9;
  void *v10;
  AMSUIPaymentVerificationMetrics *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  uint64_t v23;
  void *v24;
  uint64_t v26;
  uint64_t v27;
  void (*v28)(uint64_t);
  void *v29;
  id v30;
  _QWORD v31[5];
  _QWORD v32[5];
  _QWORD v33[5];
  uint8_t buf[4];
  uint64_t v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE081D8], "sharedAccountsConfig");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v3, "OSLogObject");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = objc_opt_class();
    AMSSetLogKey();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v35 = v5;
    v36 = 2114;
    v37 = v6;
    _os_log_impl(&dword_211102000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Starting task", buf, 0x16u);

  }
  v7 = [AMSUIPaymentVerificationMetrics alloc];
  -[AMSUIPaymentVerificationTokenFetchTask bag](self, "bag");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE08328], "currentProcess");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bundleIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[AMSUIPaymentVerificationMetrics initWithBag:appID:](v7, "initWithBag:appID:", v8, v10);
  -[AMSUIPaymentVerificationTokenFetchTask setMetrics:](self, "setMetrics:", v11);

  -[AMSUIPaymentVerificationTokenFetchTask metrics](self, "metrics");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "enqueueEventWithPageId:displayReason:", CFSTR("ParentVerifyRequest"), 0);

  -[AMSUIPaymentVerificationTokenFetchTask viewController](self, "viewController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v12) = v13 == 0;

  if ((_DWORD)v12)
  {
    AMSError();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v21)
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v21, "OSLogObject");
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      v23 = objc_opt_class();
      AMSLogKey();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v35 = v23;
      v36 = 2114;
      v37 = v24;
      v38 = 2114;
      v39 = v14;
      _os_log_impl(&dword_211102000, v22, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] %{public}@", buf, 0x20u);

    }
    objc_msgSend(MEMORY[0x24BE08340], "promiseWithError:", v14);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[AMSUIPaymentVerificationTokenFetchTask performIDCardTaskWithFeatureFlag:](self, "performIDCardTaskWithFeatureFlag:", 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = MEMORY[0x24BDAC760];
    v33[0] = MEMORY[0x24BDAC760];
    v33[1] = 3221225472;
    v33[2] = __53__AMSUIPaymentVerificationTokenFetchTask_performTask__block_invoke;
    v33[3] = &unk_24CB4F738;
    v33[4] = self;
    objc_msgSend(v14, "continueWithBlock:", v33);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v32[0] = v15;
    v32[1] = 3221225472;
    v32[2] = __53__AMSUIPaymentVerificationTokenFetchTask_performTask__block_invoke_3;
    v32[3] = &unk_24CB4F738;
    v32[4] = self;
    objc_msgSend(v16, "continueWithBlock:", v32);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v31[0] = v15;
    v31[1] = 3221225472;
    v31[2] = __53__AMSUIPaymentVerificationTokenFetchTask_performTask__block_invoke_5;
    v31[3] = &unk_24CB4F738;
    v31[4] = self;
    objc_msgSend(v17, "continueWithBlock:", v31);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSUIPaymentVerificationTokenFetchTask setResultPromise:](self, "setResultPromise:", v18);
    objc_initWeak((id *)buf, self);
    -[AMSUIPaymentVerificationTokenFetchTask resultPromise](self, "resultPromise");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v15;
    v27 = 3221225472;
    v28 = __53__AMSUIPaymentVerificationTokenFetchTask_performTask__block_invoke_7;
    v29 = &unk_24CB4FBF8;
    objc_copyWeak(&v30, (id *)buf);
    objc_msgSend(v19, "addErrorBlock:", &v26);

    -[AMSUIPaymentVerificationTokenFetchTask resultPromise](self, "resultPromise", v26, v27, v28, v29);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_destroyWeak(&v30);
    objc_destroyWeak((id *)buf);

  }
  return v20;
}

id __53__AMSUIPaymentVerificationTokenFetchTask_performTask__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  _QWORD v10[5];

  v5 = a3;
  v6 = a2;
  v7 = (void *)objc_opt_class();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __53__AMSUIPaymentVerificationTokenFetchTask_performTask__block_invoke_2;
  v10[3] = &unk_24CB4F228;
  v10[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v7, "_promiseToTryNextFlowWithResult:error:continuationBlock:", v6, v5, v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

uint64_t __53__AMSUIPaymentVerificationTokenFetchTask_performTask__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "performApplePayTaskWithFeatureFlag:", _os_feature_enabled_impl());
}

id __53__AMSUIPaymentVerificationTokenFetchTask_performTask__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  _QWORD v10[5];

  v5 = a3;
  v6 = a2;
  v7 = (void *)objc_opt_class();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __53__AMSUIPaymentVerificationTokenFetchTask_performTask__block_invoke_4;
  v10[3] = &unk_24CB4F228;
  v10[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v7, "_promiseToTryNextFlowWithResult:error:continuationBlock:", v6, v5, v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

uint64_t __53__AMSUIPaymentVerificationTokenFetchTask_performTask__block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "performCardOnFileTaskWithFeatureFlag:", 1);
}

id __53__AMSUIPaymentVerificationTokenFetchTask_performTask__block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  _QWORD v10[5];

  v5 = a3;
  v6 = a2;
  v7 = (void *)objc_opt_class();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __53__AMSUIPaymentVerificationTokenFetchTask_performTask__block_invoke_6;
  v10[3] = &unk_24CB4F228;
  v10[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v7, "_promiseToTryNextFlowWithResult:error:continuationBlock:", v6, v5, v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

uint64_t __53__AMSUIPaymentVerificationTokenFetchTask_performTask__block_invoke_6(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "performWebFlowTask");
}

void __53__AMSUIPaymentVerificationTokenFetchTask_performTask__block_invoke_7(uint64_t a1)
{
  void *v1;
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "metrics");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "enqueueEventWithPageId:displayReason:", CFSTR("ParentalVerificationFailed"), 0);

  objc_msgSend(WeakRetained, "metrics");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "flushEvents");

}

+ (id)_promiseToTryNextFlowWithResult:(id)a3 error:(id)a4 continuationBlock:(id)a5
{
  id v7;
  void (**v8)(_QWORD);
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  NSObject *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  int v26;
  int v27;
  uint64_t v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  v8 = (void (**)(_QWORD))a5;
  if (!a3)
  {
    objc_msgSend(v7, "domain");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10 == (void *)*MEMORY[0x24BE07D20])
    {
      v12 = objc_msgSend(v7, "code");

      if (v12 == 6)
      {
        objc_msgSend(MEMORY[0x24BE081D8], "sharedAccountsConfig");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v13)
        {
          objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v13, "OSLogObject");
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          v15 = objc_opt_class();
          AMSLogKey();
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = 138543874;
          v28 = v15;
          v29 = 2114;
          v30 = v16;
          v31 = 2114;
          v32 = v7;
          _os_log_impl(&dword_211102000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] User cancelled previous flow: %{public}@", (uint8_t *)&v27, 0x20u);

        }
        objc_msgSend(v7, "userInfo");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("really_cancelled"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v19 = v18;
        else
          v19 = 0;

        v26 = objc_msgSend(v19, "BOOLValue");
        if (v26)
        {
          objc_msgSend(MEMORY[0x24BE08340], "promiseWithError:", v7);
          v9 = objc_claimAutoreleasedReturnValue();
          goto LABEL_18;
        }
        goto LABEL_17;
      }
    }
    else
    {

    }
    objc_msgSend(MEMORY[0x24BE081D8], "sharedAccountsConfig");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v20)
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v20, "OSLogObject");
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      v22 = objc_opt_class();
      AMSLogKey();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = 138543874;
      v28 = v22;
      v29 = 2114;
      v30 = v23;
      v31 = 2114;
      v32 = v7;
      _os_log_impl(&dword_211102000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Moving to next flow due to: %{public}@", (uint8_t *)&v27, 0x20u);

    }
LABEL_17:
    v8[2](v8);
    v9 = objc_claimAutoreleasedReturnValue();
    goto LABEL_18;
  }
  objc_msgSend(MEMORY[0x24BE08340], "promiseWithResult:", a3);
  v9 = objc_claimAutoreleasedReturnValue();
LABEL_18:
  v24 = (void *)v9;

  return v24;
}

+ (id)performRemoteDisabledFeatureWithBag:(id)a3 featureKey:(id)a4 featureBlock:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  _QWORD v15[4];
  id v16;
  id v17;

  v7 = a4;
  v8 = a5;
  objc_msgSend(a3, "BOOLForKey:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "valuePromise");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __102__AMSUIPaymentVerificationTokenFetchTask_performRemoteDisabledFeatureWithBag_featureKey_featureBlock___block_invoke;
  v15[3] = &unk_24CB50760;
  v16 = v7;
  v17 = v8;
  v11 = v8;
  v12 = v7;
  objc_msgSend(v10, "continueWithBlock:", v15);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

id __102__AMSUIPaymentVerificationTokenFetchTask_performRemoteDisabledFeatureWithBag_featureKey_featureBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;

  if (objc_msgSend(v4, "BOOLValue"))
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Feature %@ disabled in bag"), *(_QWORD *)(a1 + 32));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)MEMORY[0x24BE08340];
    AMSError();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "promiseWithError:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

- (id)performIDCardTaskWithFeatureFlag:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[5];

  if (a3)
  {
    v4 = (void *)objc_opt_class();
    -[AMSUIPaymentVerificationTokenFetchTask bag](self, "bag");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __75__AMSUIPaymentVerificationTokenFetchTask_performIDCardTaskWithFeatureFlag___block_invoke;
    v11[3] = &unk_24CB4F228;
    v11[4] = self;
    objc_msgSend(v4, "performRemoteDisabledFeatureWithBag:featureKey:featureBlock:", v5, CFSTR("pvk_mead_disabled"), v11);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    return v6;
  }
  else
  {
    v8 = (void *)MEMORY[0x24BE08340];
    AMSError();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "promiseWithError:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    return v10;
  }
}

id __75__AMSUIPaymentVerificationTokenFetchTask_performIDCardTaskWithFeatureFlag___block_invoke(uint64_t a1)
{
  AMSUIParentalVerificationIDCardTask *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  AMSUIParentalVerificationIDCardTask *v9;
  void *v10;

  v2 = [AMSUIParentalVerificationIDCardTask alloc];
  objc_msgSend(*(id *)(a1 + 32), "account");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "accountParameters");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "bag");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "displayName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "metrics");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "viewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[AMSUIParentalVerificationIDCardTask initWithAccount:accountParameters:bag:displayName:metrics:viewController:](v2, "initWithAccount:accountParameters:bag:displayName:metrics:viewController:", v3, v4, v5, v6, v7, v8);

  -[AMSUIParentalVerificationIDCardTask performTask](v9, "performTask");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)performApplePayTaskWithFeatureFlag:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[5];

  if (a3)
  {
    v4 = (void *)objc_opt_class();
    -[AMSUIPaymentVerificationTokenFetchTask bag](self, "bag");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __77__AMSUIPaymentVerificationTokenFetchTask_performApplePayTaskWithFeatureFlag___block_invoke;
    v11[3] = &unk_24CB4F228;
    v11[4] = self;
    objc_msgSend(v4, "performRemoteDisabledFeatureWithBag:featureKey:featureBlock:", v5, CFSTR("pvk_apc_disabled"), v11);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    return v6;
  }
  else
  {
    v8 = (void *)MEMORY[0x24BE08340];
    AMSError();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "promiseWithError:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    return v10;
  }
}

id __77__AMSUIPaymentVerificationTokenFetchTask_performApplePayTaskWithFeatureFlag___block_invoke(uint64_t a1)
{
  AMSUIParentalVerificationApplePayTask *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  AMSUIParentalVerificationApplePayTask *v9;
  void *v10;

  v2 = [AMSUIParentalVerificationApplePayTask alloc];
  objc_msgSend(*(id *)(a1 + 32), "account");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "accountParameters");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "bag");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "displayName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "metrics");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "viewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[AMSUIParentalVerificationApplePayTask initWithAccount:accountParameters:bag:displayName:metrics:viewController:](v2, "initWithAccount:accountParameters:bag:displayName:metrics:viewController:", v3, v4, v5, v6, v7, v8);

  -[AMSUIParentalVerificationApplePayTask performTask](v9, "performTask");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)performCardOnFileTaskWithFeatureFlag:(BOOL)a3
{
  AMSUICardOnFilePVTFetchTask *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  AMSUICardOnFilePVTFetchTask *v11;
  void *v12;

  if (a3)
  {
    v4 = [AMSUICardOnFilePVTFetchTask alloc];
    -[AMSUIPaymentVerificationTokenFetchTask account](self, "account");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSUIPaymentVerificationTokenFetchTask accountParameters](self, "accountParameters");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSUIPaymentVerificationTokenFetchTask bag](self, "bag");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSUIPaymentVerificationTokenFetchTask displayName](self, "displayName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSUIPaymentVerificationTokenFetchTask metrics](self, "metrics");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSUIPaymentVerificationTokenFetchTask viewController](self, "viewController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[AMSUICardOnFilePVTFetchTask initWithAccount:accountParameters:bag:displayName:metrics:viewController:](v4, "initWithAccount:accountParameters:bag:displayName:metrics:viewController:", v5, v6, v7, v8, v9, v10);

    -[AMSUICardOnFilePVTFetchTask performTask](v11, "performTask");
  }
  else
  {
    AMSError();
    v11 = (AMSUICardOnFilePVTFetchTask *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE08340], "promiseWithError:", v11);
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)performWebFlowTask
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD v18[5];
  id v19;

  v3 = objc_alloc_init(MEMORY[0x24BE08340]);
  objc_msgSend(MEMORY[0x24BDB4398], "ams_sharedAccountStoreForMediaType:", *MEMORY[0x24BE07C98]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSUIPaymentVerificationTokenFetchTask account](self, "account");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSUIPaymentVerificationTokenFetchTask accountParameters](self, "accountParameters");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSUIPaymentVerificationProtocolHandler _accountToUseFromGivenAccount:accountParameters:accountStore:](AMSUIPaymentVerificationProtocolHandler, "_accountToUseFromGivenAccount:accountParameters:accountStore:", v5, v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    v8 = objc_alloc(MEMORY[0x24BDB4380]);
    objc_msgSend(v4, "accountTypeWithAccountTypeIdentifier:", *MEMORY[0x24BDB4180]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v8, "initWithAccountType:", v9);

    -[AMSUIPaymentVerificationTokenFetchTask accountParameters](self, "accountParameters");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("accountNameApprover"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setUsername:", v11);

    -[AMSUIPaymentVerificationTokenFetchTask accountParameters](self, "accountParameters");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("altDsId"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "ams_setAltDSID:", v13);

    objc_msgSend(v4, "ams_localiTunesAccount");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "ams_storefront");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "ams_setStorefront:", v15);

  }
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __60__AMSUIPaymentVerificationTokenFetchTask_performWebFlowTask__block_invoke;
  v18[3] = &unk_24CB4F4C0;
  v18[4] = self;
  v19 = v7;
  v16 = v7;
  dispatch_async(MEMORY[0x24BDAC9B8], v18);

  return v3;
}

void __60__AMSUIPaymentVerificationTokenFetchTask_performWebFlowTask__block_invoke(uint64_t a1)
{
  WrappedAMSUIWebViewController *v2;
  void *v3;
  WrappedAMSUIWebViewController *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  _QWORD v19[5];
  _QWORD v20[5];
  _QWORD v21[5];
  id v22;

  v2 = [WrappedAMSUIWebViewController alloc];
  objc_msgSend(*(id *)(a1 + 32), "bag");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[AMSUIWebViewController initWithBag:account:clientInfo:](v2, "initWithBag:account:clientInfo:", v3, *(_QWORD *)(a1 + 40), 0);
  objc_msgSend(*(id *)(a1 + 32), "setWebVC:", v4);

  v5 = *(void **)(a1 + 32);
  objc_msgSend(v5, "webVC");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDelegate:", v5);

  objc_msgSend(*(id *)(a1 + 32), "metrics");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "displayReason");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "userInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "accountParameters");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSUIPaymentVerificationTokenFetchTask _contextCombining:with:accountParameters:account:](AMSUIPaymentVerificationTokenFetchTask, "_contextCombining:with:accountParameters:account:", v8, v9, v10, *(_QWORD *)(a1 + 40));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "webVC");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setClientOptions:", v11);

  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x3032000000;
  v21[3] = __Block_byref_object_copy__2;
  v21[4] = __Block_byref_object_dispose__2;
  v22 = *(id *)(a1 + 32);
  v13 = MEMORY[0x24BDAC760];
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __60__AMSUIPaymentVerificationTokenFetchTask_performWebFlowTask__block_invoke_53;
  v20[3] = &unk_24CB4F3E8;
  v20[4] = v21;
  objc_msgSend(*(id *)(a1 + 32), "webVC");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setDismissBlock:", v20);

  objc_msgSend(*(id *)(a1 + 32), "bag");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "URLForKey:", CFSTR("verifyPaymentCommerceURL"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "webVC");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (id)objc_msgSend(v17, "loadBagValue:", v16);

  v19[0] = v13;
  v19[1] = 3221225472;
  v19[2] = __60__AMSUIPaymentVerificationTokenFetchTask_performWebFlowTask__block_invoke_2;
  v19[3] = &unk_24CB4F0E8;
  v19[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x24BDAC9B8], v19);

  _Block_object_dispose(v21, 8);
}

void __60__AMSUIPaymentVerificationTokenFetchTask_performWebFlowTask__block_invoke_53(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;

  v2 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  AMSError();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_finishPromiseWithResult:error:", 0, v3);

  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = 0;

}

void __60__AMSUIPaymentVerificationTokenFetchTask_performWebFlowTask__block_invoke_2(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  id v5;

  v2 = objc_alloc(MEMORY[0x24BEBD7A0]);
  objc_msgSend(*(id *)(a1 + 32), "webVC");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v2, "initWithRootViewController:", v3);

  objc_msgSend(v5, "setModalPresentationStyle:", 2);
  objc_msgSend(*(id *)(a1 + 32), "viewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "presentViewController:animated:completion:", v5, 1, 0);

}

+ (id)_contextCombining:(id)a3 with:(id)a4 accountParameters:(id)a5 account:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  UIImage *v18;
  UIImage *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)MEMORY[0x24BDD1488];
  objc_msgSend(MEMORY[0x24BE08328], "currentProcess");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "bundleIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "bundleWithIdentifier:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "icon");
  v18 = (UIImage *)objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (v18)
  {
    UIImagePNGRepresentation(v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v20;
    if (v20)
    {
      objc_msgSend(v20, "base64EncodedStringWithOptions:", 1);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("data:image/png;base64,%@"), v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setObject:forKeyedSubscript:", v23, CFSTR("appIcon"));

    }
  }
  if (v9)
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v9, CFSTR("displayReason"));
  if (v10)
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v10, CFSTR("userInfo"));
  if (v11)
  {
    +[AMSUIParentalVerificationCore _allowedAccountParameters:](AMSUIParentalVerificationCore, "_allowedAccountParameters:", v11);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v24, CFSTR("accountParameters"));

  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(MEMORY[0x24BE08080], "isAvailableForAccount:", v12));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v25, CFSTR("biometricsIsEnabled"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(MEMORY[0x24BE08080], "type"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v26, CFSTR("biometricsType"));

  return v13;
}

- (BOOL)webViewController:(id)a3 handleDelegateAction:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  void *v19;
  int v21;
  uint64_t v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  v8 = a5;
  objc_msgSend(MEMORY[0x24BE081D8], "sharedAccountsConfig");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v9, "OSLogObject");
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = objc_opt_class();
    AMSLogKey();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 138543874;
    v22 = v11;
    v23 = 2114;
    v24 = v12;
    v25 = 2114;
    v26 = v7;
    _os_log_impl(&dword_211102000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Web flow finished by returning: %{public}@", (uint8_t *)&v21, 0x20u);

  }
  objc_msgSend((id)objc_opt_class(), "_tokenFromDictionary:", v7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = 0;
  }
  else
  {
    AMSError();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[AMSUIPaymentVerificationTokenFetchTask metrics](self, "metrics");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "enqueueEventWithPageId:displayReason:", CFSTR("ParentVerified"), CFSTR("WebFlow"));

  -[AMSUIPaymentVerificationTokenFetchTask metrics](self, "metrics");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "flushEvents");

  -[AMSUIPaymentVerificationTokenFetchTask _finishPromiseWithResult:error:](self, "_finishPromiseWithResult:error:", v13, v14);
  if (v14)
  {
    v17 = v8;
    v18 = 0;
    v19 = v14;
  }
  else
  {
    v18 = MEMORY[0x24BDBD1C8];
    v17 = v8;
    v19 = 0;
  }
  (*((void (**)(id, uint64_t, void *))v8 + 2))(v17, v18, v19);

  return 0;
}

- (void)webViewController:(id)a3 handleAuthenticateRequest:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  AMSUIAuthKitUpdateTask *v13;
  void *v14;
  void *v15;
  AMSUIAuthKitUpdateTask *v16;
  void *v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v9, "options");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "copy");

  objc_msgSend(v12, "setEphemeral:", 1);
  objc_msgSend(v12, "setServiceIdentifier:", CFSTR("com.apple.gs.ams.pvkit"));
  v13 = [AMSUIAuthKitUpdateTask alloc];
  objc_msgSend(v9, "account");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSUIPaymentVerificationTokenFetchTask webVC](self, "webVC");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[AMSUIAuthKitUpdateTask initWithAccount:presentingViewController:options:](v13, "initWithAccount:presentingViewController:options:", v14, v15, v12);

  objc_initWeak(&location, self);
  -[AMSAuthKitUpdateTask performAuthKitUpdate](v16, "performAuthKitUpdate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __97__AMSUIPaymentVerificationTokenFetchTask_webViewController_handleAuthenticateRequest_completion___block_invoke;
  v19[3] = &unk_24CB50788;
  objc_copyWeak(&v21, &location);
  v18 = v10;
  v20 = v18;
  objc_msgSend(v17, "addFinishBlock:", v19);

  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);

}

void __97__AMSUIPaymentVerificationTokenFetchTask_webViewController_handleAuthenticateRequest_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id *WeakRetained;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  int v23;
  uint64_t v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(v5, "authenticationResults");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x24BE0AB98]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("com.apple.gs.ams.pvkit"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (id)v11;
  if (v10)
  {
    if (!v11)
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
      v12 = (id)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v12, "OSLogObject");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = objc_opt_class();
      AMSLogKey();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 138543618;
      v24 = v14;
      v25 = 2114;
      v26 = v15;
      _os_log_impl(&dword_211102000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] We've received an updated GS token", (uint8_t *)&v23, 0x16u);

    }
    v16 = (void *)objc_msgSend(WeakRetained[7], "mutableCopy");
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v10, CFSTR("gsToken"));
    v12 = WeakRetained[7];
    WeakRetained[7] = v16;
  }
  else
  {
    if (!v11)
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
      v12 = (id)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v12, "OSLogObject");
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v18 = objc_opt_class();
      AMSLogKey();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 138543618;
      v24 = v18;
      v25 = 2114;
      v26 = v19;
      _os_log_impl(&dword_211102000, v17, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Unable to locate GS Token in auth result", (uint8_t *)&v23, 0x16u);

    }
  }

  if (v6)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    v20 = objc_alloc(MEMORY[0x24BE08030]);
    objc_msgSend(v5, "account");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)objc_msgSend(v20, "initWithAccount:", v21);

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

- (void)webViewController:(id)a3 didEncodeNetworkRequest:(id)a4
{
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;

  v12 = a4;
  -[AMSUIPaymentVerificationTokenFetchTask accountParameters](self, "accountParameters");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = *MEMORY[0x24BE07D80];
    -[AMSUIPaymentVerificationTokenFetchTask accountParameters](self, "accountParameters");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSUIPaymentVerificationTokenFetchTask setHeader:withValueIn:forKey:onRequest:](self, "setHeader:withValueIn:forKey:onRequest:", v6, v7, CFSTR("gsToken"), v12);

    v8 = *MEMORY[0x24BE07D90];
    -[AMSUIPaymentVerificationTokenFetchTask accountParameters](self, "accountParameters");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSUIPaymentVerificationTokenFetchTask setHeader:withValueIn:forKey:onRequest:](self, "setHeader:withValueIn:forKey:onRequest:", v8, v9, CFSTR("mmeClientInfo"), v12);

    v10 = *MEMORY[0x24BE07D98];
    -[AMSUIPaymentVerificationTokenFetchTask accountParameters](self, "accountParameters");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSUIPaymentVerificationTokenFetchTask setHeader:withValueIn:forKey:onRequest:](self, "setHeader:withValueIn:forKey:onRequest:", v10, v11, CFSTR("deviceId"), v12);

    objc_msgSend(v12, "setValue:forHTTPHeaderField:", CFSTR("1"), CFSTR("X-Apple-Payment-Verification"));
  }

}

- (void)setHeader:(id)a3 withValueIn:(id)a4 forKey:(id)a5 onRequest:(id)a6
{
  id v9;
  void *v10;
  id v11;

  v11 = a3;
  v9 = a6;
  objc_msgSend(a4, "objectForKeyedSubscript:", a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
    objc_msgSend(v9, "setValue:forHTTPHeaderField:", v10, v11);

}

+ (id)_tokenFromDictionary:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  AMSPaymentVerificationTokenResult *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("actionName"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v5;
    else
      v6 = 0;

    if (v6 && objc_msgSend(v6, "isEqualToString:", CFSTR("providePVT")))
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("options"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v9 = v8;
      else
        v9 = 0;

      if (v9)
      {
        objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("status"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v11 = v10;
        else
          v11 = 0;

        if (v11 && !objc_msgSend(v11, "integerValue"))
        {
          objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("pvt"));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v13 = v12;
          else
            v13 = 0;

          if (v13)
          {
            objc_msgSend(v13, "dataUsingEncoding:", 4);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v7 = -[AMSPaymentVerificationTokenResult initWithTokenData:]([AMSPaymentVerificationTokenResult alloc], "initWithTokenData:", v14);

          }
          else
          {
            v7 = 0;
          }

        }
        else
        {
          v7 = 0;
        }

      }
      else
      {
        v7 = 0;
      }

    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (AMSBagKeySet)bagKeySet
{
  id v2;
  void *v3;

  v2 = objc_alloc_init(MEMORY[0x24BE08298]);
  objc_msgSend(v2, "addBagKey:valueType:defaultValue:", CFSTR("verifyPaymentApplePayAurumOnStackBoolean"), 5, CFSTR("https://buy.itunes.apple.com/account/verifyPayment/applePay/aurumOnStackBoolean"));
  objc_msgSend(v2, "addBagKey:valueType:defaultValue:", CFSTR("verifyPaymentApplePayAurumOnStackPVT"), 5, CFSTR("https://buy.itunes.apple.com/account/verifyPayment/applePay/aurumOnStackPVT"));
  objc_msgSend(v2, "addBagKey:valueType:defaultValue:", CFSTR("verifyPaymentApplePayCardOnDevice"), 5, CFSTR("https://buy.itunes.apple.com/account/verifyPayment/applePay/cardOnDevice"));
  objc_msgSend(v2, "addBagKey:valueType:defaultValue:", CFSTR("verifyPaymentCommerceURL"), 5, CFSTR("https://apps.mzstatic.com/content/54a1317a0ad442d3965d64ef6bfaae1c/verify-billing"));
  objc_msgSend(MEMORY[0x24BE083F8], "bagKeySet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "unionBagKeySet:", v3);

  return (AMSBagKeySet *)v2;
}

+ (NSString)bagSubProfile
{
  if (bagSubProfile_ams_once_token___COUNTER__ != -1)
    dispatch_once(&bagSubProfile_ams_once_token___COUNTER__, &__block_literal_global_14);
  return (NSString *)(id)bagSubProfile_ams_once_object___COUNTER__;
}

void __55__AMSUIPaymentVerificationTokenFetchTask_bagSubProfile__block_invoke()
{
  void *v0;

  v0 = (void *)bagSubProfile_ams_once_object___COUNTER__;
  bagSubProfile_ams_once_object___COUNTER__ = (uint64_t)CFSTR("AMSUIPaymentVerification");

}

+ (NSString)bagSubProfileVersion
{
  if (bagSubProfileVersion_ams_once_token___COUNTER__ != -1)
    dispatch_once(&bagSubProfileVersion_ams_once_token___COUNTER__, &__block_literal_global_107);
  return (NSString *)(id)bagSubProfileVersion_ams_once_object___COUNTER__;
}

void __62__AMSUIPaymentVerificationTokenFetchTask_bagSubProfileVersion__block_invoke()
{
  void *v0;

  v0 = (void *)bagSubProfileVersion_ams_once_object___COUNTER__;
  bagSubProfileVersion_ams_once_object___COUNTER__ = (uint64_t)CFSTR("1");

}

+ (id)createBagForSubProfile
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v2 = (void *)MEMORY[0x24BE08060];
  objc_msgSend((id)objc_opt_class(), "bagKeySet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "bagSubProfile");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "bagSubProfileVersion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "registerBagKeySet:forProfile:profileVersion:", v3, v4, v5);

  v6 = (void *)MEMORY[0x24BE08050];
  objc_msgSend((id)objc_opt_class(), "bagSubProfile");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "bagSubProfileVersion");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bagForProfile:profileVersion:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)_finishPromiseWithResult:(id)a3 error:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  if (v10)
  {
    -[AMSUIPaymentVerificationTokenFetchTask resultPromise](self, "resultPromise");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "finishWithResult:", v10);
  }
  else
  {
    -[AMSUIPaymentVerificationTokenFetchTask resultPromise](self, "resultPromise");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v8;
    if (v6)
    {
      objc_msgSend(v8, "finishWithError:", v6);
    }
    else
    {
      AMSError();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "finishWithError:", v9);

    }
  }

  -[AMSUIPaymentVerificationTokenFetchTask setResultPromise:](self, "setResultPromise:", 0);
}

- (ACAccount)account
{
  return self->_account;
}

- (NSDictionary)accountParameters
{
  return self->_accountParameters;
}

- (AMSBagProtocol)bag
{
  return self->_bag;
}

- (AMSProcessInfo)clientInfo
{
  return self->_clientInfo;
}

- (void)setClientInfo:(id)a3
{
  objc_storeStrong((id *)&self->_clientInfo, a3);
}

- (NSString)displayName
{
  return self->_displayName;
}

- (unint64_t)mode
{
  return self->_mode;
}

- (NSDictionary)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(id)a3
{
  objc_storeStrong((id *)&self->_userInfo, a3);
}

- (UIViewController)viewController
{
  return self->_viewController;
}

- (AMSUIPaymentVerificationMetrics)metrics
{
  return self->_metrics;
}

- (void)setMetrics:(id)a3
{
  objc_storeStrong((id *)&self->_metrics, a3);
}

- (AMSPromise)resultPromise
{
  return self->_resultPromise;
}

- (void)setResultPromise:(id)a3
{
  objc_storeStrong((id *)&self->_resultPromise, a3);
}

- (WrappedAMSUIWebViewController)webVC
{
  return self->_webVC;
}

- (void)setWebVC:(id)a3
{
  objc_storeStrong((id *)&self->_webVC, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_webVC, 0);
  objc_storeStrong((id *)&self->_resultPromise, 0);
  objc_storeStrong((id *)&self->_metrics, 0);
  objc_storeStrong((id *)&self->_viewController, 0);
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_clientInfo, 0);
  objc_storeStrong((id *)&self->_bag, 0);
  objc_storeStrong((id *)&self->_accountParameters, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end
