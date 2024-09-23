@implementation AMSUIWebVerifyPaymentSetupFeatureAction

- (AMSUIWebVerifyPaymentSetupFeatureAction)initWithJSObject:(id)a3 context:(id)a4
{
  id v6;
  AMSUIWebVerifyPaymentSetupFeatureAction *v7;
  void *v8;
  NSString *v9;
  NSString *referrerIdentifier;
  objc_super v12;

  v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)AMSUIWebVerifyPaymentSetupFeatureAction;
  v7 = -[AMSUIWebAction initWithJSObject:context:](&v12, sel_initWithJSObject_context_, v6, a4);
  if (v7)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("referrerIdentifier"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v9 = v8;
    else
      v9 = 0;

    referrerIdentifier = v7->_referrerIdentifier;
    v7->_referrerIdentifier = v9;

  }
  return v7;
}

- (id)runAction
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  _QWORD v17[5];
  _QWORD v18[5];
  _QWORD v19[5];
  objc_super v20;
  _QWORD v21[2];
  uint8_t buf[4];
  uint64_t v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v20.receiver = self;
  v20.super_class = (Class)AMSUIWebVerifyPaymentSetupFeatureAction;
  v3 = -[AMSUIWebAction runAction](&v20, sel_runAction);
  objc_msgSend(MEMORY[0x24BE081D8], "sharedWebUIConfig");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v4, "OSLogObject");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = objc_opt_class();
    AMSLogKey();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v23 = v6;
    v24 = 2114;
    v25 = v7;
    _os_log_impl(&dword_211102000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Verifying payment setup.", buf, 0x16u);

  }
  v8 = (void *)MEMORY[0x24BE08078];
  -[AMSUIWebVerifyPaymentSetupFeatureAction _checkUpsellCardEnrollment](self, "_checkUpsellCardEnrollment");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v9;
  -[AMSUIWebVerifyPaymentSetupFeatureAction _checkCombinedAccount](self, "_checkCombinedAccount");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v21[1] = v10;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v21, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "promiseWithAll:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "promiseAdapter");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = MEMORY[0x24BDAC760];
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __52__AMSUIWebVerifyPaymentSetupFeatureAction_runAction__block_invoke;
  v19[3] = &unk_24CB4FBD0;
  v19[4] = self;
  objc_msgSend(v13, "thenWithBlock:", v19);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v18[0] = v14;
  v18[1] = 3221225472;
  v18[2] = __52__AMSUIWebVerifyPaymentSetupFeatureAction_runAction__block_invoke_3;
  v18[3] = &unk_24CB51230;
  v18[4] = self;
  objc_msgSend(v15, "addSuccessBlock:", v18);
  v17[0] = v14;
  v17[1] = 3221225472;
  v17[2] = __52__AMSUIWebVerifyPaymentSetupFeatureAction_runAction__block_invoke_15;
  v17[3] = &unk_24CB4F560;
  v17[4] = self;
  objc_msgSend(v15, "addErrorBlock:", v17);

  return v15;
}

id __52__AMSUIWebVerifyPaymentSetupFeatureAction_runAction__block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = objc_alloc(MEMORY[0x24BE08318]);
  objc_msgSend(*(id *)(a1 + 32), "referrerIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithIdentifier:", v3);

  objc_msgSend(v4, "performPaymentSetupFeatureLookup");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "thenWithBlock:", &__block_literal_global_33);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __52__AMSUIWebVerifyPaymentSetupFeatureAction_runAction__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BE08340];
  v7 = CFSTR("supported");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", objc_msgSend(a2, "state") == 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v3;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "promiseWithResult:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

void __52__AMSUIWebVerifyPaymentSetupFeatureAction_runAction__block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  void *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  objc_msgSend(MEMORY[0x24BE081D8], "sharedWebUIConfig");
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
    AMSLogKey();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543874;
    v8 = v5;
    v9 = 2114;
    v10 = v6;
    v11 = 2114;
    v12 = v2;
    _os_log_impl(&dword_211102000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Verified payment setup: %{public}@", (uint8_t *)&v7, 0x20u);

  }
}

void __52__AMSUIWebVerifyPaymentSetupFeatureAction_runAction__block_invoke_15(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  objc_msgSend(MEMORY[0x24BE081D8], "sharedWebUIConfig");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v3, "OSLogObject");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = objc_opt_class();
    AMSLogKey();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    AMSLogableError();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543874;
    v9 = v5;
    v10 = 2114;
    v11 = v6;
    v12 = 2114;
    v13 = v7;
    _os_log_impl(&dword_211102000, v4, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to verify payment setup: %{public}@", (uint8_t *)&v8, 0x20u);

  }
}

- (id)_checkCombinedAccount
{
  void *v2;
  int v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BDB4398], "ams_sharedAccountStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "ams_isActiveAccountCombined");

  v4 = (void *)MEMORY[0x24BE08078];
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BE08078], "promiseWithSuccess");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    AMSError();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "promiseWithError:", v6);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (id)_checkUpsellCardEnrollment
{
  id v3;
  NSObject *v4;
  id v5;
  void *v6;
  id v7;
  _QWORD v9[5];
  id v10;

  v3 = objc_alloc_init(MEMORY[0x24BE08078]);
  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __69__AMSUIWebVerifyPaymentSetupFeatureAction__checkUpsellCardEnrollment__block_invoke;
  v9[3] = &unk_24CB4F4C0;
  v9[4] = self;
  v5 = v3;
  v10 = v5;
  dispatch_async(v4, v9);

  v6 = v10;
  v7 = v5;

  return v7;
}

void __69__AMSUIWebVerifyPaymentSetupFeatureAction__checkUpsellCardEnrollment__block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bag");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  v3 = objc_msgSend(MEMORY[0x24BE080B0], "shouldUseUpsellEnrollmentWithBag:", v6);
  v4 = *(void **)(a1 + 40);
  if (v3)
  {
    objc_msgSend(v4, "finishWithSuccess");
  }
  else
  {
    AMSError();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "finishWithError:", v5);

  }
}

- (NSString)referrerIdentifier
{
  return self->_referrerIdentifier;
}

- (void)setReferrerIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_referrerIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_referrerIdentifier, 0);
}

@end
