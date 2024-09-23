@implementation AMSUIWebPaymentSetupAction

- (AMSUIWebPaymentSetupAction)initWithJSObject:(id)a3 context:(id)a4
{
  id v6;
  AMSUIWebPaymentSetupAction *v7;
  void *v8;
  NSString *v9;
  NSString *referrerIdentifier;
  objc_super v12;

  v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)AMSUIWebPaymentSetupAction;
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
  char v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  AMSUIPaymentSetupTask *v16;
  void *v17;
  AMSUIPaymentSetupTask *v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  NSObject *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  _QWORD v31[5];
  id v32;
  objc_super v33;
  uint8_t buf[4];
  uint64_t v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v33.receiver = self;
  v33.super_class = (Class)AMSUIWebPaymentSetupAction;
  v3 = -[AMSUIWebAction runAction](&v33, sel_runAction);
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
    v35 = v6;
    v36 = 2114;
    v37 = v7;
    _os_log_impl(&dword_211102000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Started running.", buf, 0x16u);

  }
  -[AMSUIWebAction context](self, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bag");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(MEMORY[0x24BE080B0], "shouldUseUpsellEnrollmentWithBag:", v9) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedWebUIConfig");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v23)
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v23, "OSLogObject");
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      v25 = objc_opt_class();
      AMSLogKey();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v35 = v25;
      v36 = 2114;
      v37 = v26;
      _os_log_impl(&dword_211102000, v24, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed for feature not enabled.", buf, 0x16u);

    }
    goto LABEL_17;
  }
  objc_msgSend(MEMORY[0x24BDB4398], "ams_sharedAccountStore");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "ams_isActiveAccountCombined");

  if ((v11 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedWebUIConfig");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v23)
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v23, "OSLogObject");
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      v27 = objc_opt_class();
      AMSLogKey();
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v35 = v27;
      v36 = 2114;
      v37 = v28;
      _os_log_impl(&dword_211102000, v24, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed for no combined account.", buf, 0x16u);

    }
LABEL_17:

    v29 = (void *)MEMORY[0x24BE08340];
    AMSError();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "promiseWithError:", v15);
    v22 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_18;
  }
  v12 = objc_alloc_init(MEMORY[0x24BE08340]);
  -[AMSUIWebAction context](self, "context");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "flowController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "currentContainer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = [AMSUIPaymentSetupTask alloc];
  -[AMSUIWebPaymentSetupAction referrerIdentifier](self, "referrerIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[AMSUIPaymentSetupTask initWithReferrerIdentifier:presentingViewController:](v16, "initWithReferrerIdentifier:presentingViewController:", v17, v15);

  -[AMSUIPaymentSetupTask present](v18, "present");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = MEMORY[0x24BDAC760];
  v31[1] = 3221225472;
  v31[2] = __39__AMSUIWebPaymentSetupAction_runAction__block_invoke;
  v31[3] = &unk_24CB4FA28;
  v31[4] = self;
  v20 = v12;
  v32 = v20;
  objc_msgSend(v19, "addFinishBlock:", v31);
  v21 = v32;
  v22 = v20;

LABEL_18:
  return v22;
}

void __39__AMSUIWebPaymentSetupAction_runAction__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  const __CFString *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
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
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v7;
    v9 = CFSTR("unsuccessfully");
    *(_DWORD *)buf = 138543874;
    v16 = v6;
    v17 = 2114;
    if ((_DWORD)a2)
      v9 = CFSTR("successfully");
    v18 = v7;
    v19 = 2114;
    v20 = v9;
    _os_log_impl(&dword_211102000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Finished %{public}@.", buf, 0x20u);

  }
  v10 = *(void **)(a1 + 40);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a2, CFSTR("success"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v11;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "finishWithResult:", v12);

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
