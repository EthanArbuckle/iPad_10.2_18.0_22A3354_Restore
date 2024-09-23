@implementation AMSUICardOnFilePVTFetchTask

- (AMSUICardOnFilePVTFetchTask)initWithAccount:(id)a3 accountParameters:(id)a4 bag:(id)a5 displayName:(id)a6 metrics:(id)a7 viewController:(id)a8
{
  id v15;
  id v16;
  id v17;
  AMSUICardOnFilePVTFetchTask *v18;
  AMSUICardOnFilePVTFetchTask *v19;
  id v21;
  id v22;
  id v23;
  objc_super v24;

  v23 = a3;
  v22 = a4;
  v21 = a5;
  v15 = a6;
  v16 = a7;
  v17 = a8;
  v24.receiver = self;
  v24.super_class = (Class)AMSUICardOnFilePVTFetchTask;
  v18 = -[AMSTask init](&v24, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_originalAccount, a3);
    objc_storeStrong((id *)&v19->_accountParameters, a4);
    objc_storeStrong((id *)&v19->_bag, a5);
    objc_storeStrong((id *)&v19->_displayName, a6);
    objc_storeStrong((id *)&v19->_metrics, a7);
    objc_storeStrong((id *)&v19->_viewController, a8);
  }

  return v19;
}

- (id)performTask
{
  void *v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  const __CFString *v22;
  void *v23;
  NSObject *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  _QWORD v29[5];
  uint8_t buf[4];
  uint64_t v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  void *v35;
  const __CFString *v36;
  _QWORD v37[2];

  v37[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
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
    *(_DWORD *)buf = 138543618;
    v31 = v5;
    v32 = 2114;
    v33 = v6;
    _os_log_impl(&dword_211102000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Running AMSUICardOnFilePVTFetchTask", buf, 0x16u);

  }
  objc_msgSend(MEMORY[0x24BDB4398], "ams_sharedAccountStoreForMediaType:", *MEMORY[0x24BE07C98]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_opt_class();
  -[AMSUICardOnFilePVTFetchTask originalAccount](self, "originalAccount");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSUICardOnFilePVTFetchTask accountParameters](self, "accountParameters");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "ams_activeiTunesAccount");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_accountToUseFromGivenAccount:accountParameters:activeiTunesAccount:", v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v36 = CFSTR("AMSUICardOnFilePVTPreconditionsNotMet");
  v37[0] = MEMORY[0x24BDBD1C8];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v37, &v36, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    AMSCustomError();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v16)
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v16, "OSLogObject");
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v18 = objc_opt_class();
      AMSLogKey();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v31 = v18;
      v32 = 2114;
      v33 = v19;
      v34 = 2114;
      v35 = v15;
      _os_log_impl(&dword_211102000, v17, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] %{public}@", buf, 0x20u);

    }
    objc_msgSend(MEMORY[0x24BE08340], "promiseWithError:", v15);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSUICardOnFilePVTFetchTask metrics](self, "metrics");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v20;
    v22 = CFSTR("Active iTunes account mismatch");
    goto LABEL_18;
  }
  if (!objc_msgSend(MEMORY[0x24BE08080], "isAvailableForAccount:", v12))
  {
    AMSCustomError();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
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
      *(_DWORD *)buf = 138543874;
      v31 = v25;
      v32 = 2114;
      v33 = v26;
      v34 = 2114;
      v35 = v15;
      _os_log_impl(&dword_211102000, v24, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] %{public}@", buf, 0x20u);

    }
    objc_msgSend(MEMORY[0x24BE08340], "promiseWithError:", v15);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSUICardOnFilePVTFetchTask metrics](self, "metrics");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v20;
    v22 = CFSTR("Biometrics for iTunes & App Store not enabled");
LABEL_18:
    objc_msgSend(v20, "setDisplayReason:", v22);

    goto LABEL_19;
  }
  -[AMSUICardOnFilePVTFetchTask _promiseToLoadBooleanURL](self, "_promiseToLoadBooleanURL");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSUICardOnFilePVTFetchTask setAccount:](self, "setAccount:", v12);
LABEL_19:
  v29[0] = MEMORY[0x24BDAC760];
  v29[1] = 3221225472;
  v29[2] = __42__AMSUICardOnFilePVTFetchTask_performTask__block_invoke;
  v29[3] = &unk_24CB4F738;
  v29[4] = self;
  objc_msgSend(v14, "continueWithBlock:", v29);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  return v27;
}

id __42__AMSUICardOnFilePVTFetchTask_performTask__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  int v17;
  uint64_t v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = v5;
  if (a2)
  {
    objc_msgSend(MEMORY[0x24BE08340], "promiseWithResult:", a2);
    v7 = objc_claimAutoreleasedReturnValue();
    goto LABEL_12;
  }
  objc_msgSend(v5, "domain");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8 != (void *)*MEMORY[0x24BE07D20])
  {

LABEL_11:
    objc_msgSend(MEMORY[0x24BE08340], "promiseWithError:", v6);
    v7 = objc_claimAutoreleasedReturnValue();
    goto LABEL_12;
  }
  v10 = objc_msgSend(v6, "code");

  if (v10 != 6)
    goto LABEL_11;
  objc_msgSend(MEMORY[0x24BE081D8], "sharedAccountsConfig");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v11, "OSLogObject");
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = objc_opt_class();
    AMSLogKey();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 138543618;
    v18 = v13;
    v19 = 2114;
    v20 = v14;
    _os_log_impl(&dword_211102000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] User cancelled biometric auth", (uint8_t *)&v17, 0x16u);

  }
  objc_msgSend(*(id *)(a1 + 32), "_promiseToPromptAfterCancel");
  v7 = objc_claimAutoreleasedReturnValue();
LABEL_12:
  v15 = (void *)v7;

  return v15;
}

- (id)_promiseToLoadBooleanURL
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[5];

  -[AMSUICardOnFilePVTFetchTask bag](self, "bag");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URLForKey:", CFSTR("verifyPaymentApplePayAurumOnStackBoolean"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "valuePromise");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __55__AMSUICardOnFilePVTFetchTask__promiseToLoadBooleanURL__block_invoke;
  v8[3] = &unk_24CB4F760;
  v8[4] = self;
  objc_msgSend(v5, "thenWithBlock:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __55__AMSUICardOnFilePVTFetchTask__promiseToLoadBooleanURL__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_promiseToFetchCardOnStackBooleanURL:", a2);
}

- (id)_promiseToFetchCardOnStackBooleanURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  _QWORD v12[5];
  _QWORD v13[5];

  v4 = a3;
  -[AMSUICardOnFilePVTFetchTask account](self, "account");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSUICardOnFilePVTFetchTask accountParameters](self, "accountParameters");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSUICardOnFilePVTFetchTask bag](self, "bag");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSUIPaymentVerificationProtocolHandler _promiseToFetchURLResponseForAccount:accountParameters:url:bag:requestBody:bodyEncoding:contentType:](AMSUIPaymentVerificationProtocolHandler, "_promiseToFetchURLResponseForAccount:accountParameters:url:bag:requestBody:bodyEncoding:contentType:", v5, v6, v4, v7, 0, 0, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = MEMORY[0x24BDAC760];
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __68__AMSUICardOnFilePVTFetchTask__promiseToFetchCardOnStackBooleanURL___block_invoke;
  v13[3] = &unk_24CB4F788;
  v13[4] = self;
  objc_msgSend(v8, "thenWithBlock:", v13);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v9;
  v12[1] = 3221225472;
  v12[2] = __68__AMSUICardOnFilePVTFetchTask__promiseToFetchCardOnStackBooleanURL___block_invoke_28;
  v12[3] = &unk_24CB4F560;
  v12[4] = self;
  objc_msgSend(v10, "addErrorBlock:", v12);

  return v10;
}

id __68__AMSUICardOnFilePVTFetchTask__promiseToFetchCardOnStackBooleanURL___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  const __CFString *v16;
  uint64_t v17;
  uint8_t buf[4];
  uint64_t v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
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
    objc_msgSend(v3, "object");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v19 = v6;
    v20 = 2114;
    v21 = v7;
    v22 = 2114;
    v23 = v8;
    _os_log_impl(&dword_211102000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Fetched BOOLean url object: %{public}@", buf, 0x20u);

  }
  objc_msgSend(v3, "object");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = +[AMSUIParentalVerificationCore _isCardOnFileOnStack:](AMSUIParentalVerificationCore, "_isCardOnFileOnStack:", v9);

  if (v10)
  {
    objc_msgSend(*(id *)(a1 + 32), "_promiseToPromptBeforeBiometricAuth");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v16 = CFSTR("AMSUICardOnFilePVTPreconditionsNotMet");
    v17 = MEMORY[0x24BDBD1C8];
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    AMSCustomError();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "metrics");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setDisplayReason:", CFSTR("No Aurum card on file"));

    objc_msgSend(MEMORY[0x24BE08340], "promiseWithError:", v13);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v11;
}

void __68__AMSUICardOnFilePVTFetchTask__promiseToFetchCardOnStackBooleanURL___block_invoke_28(uint64_t a1, void *a2)
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
  objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
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
    v7 = 138543874;
    v8 = v5;
    v9 = 2114;
    v10 = v6;
    v11 = 2114;
    v12 = v2;
    _os_log_impl(&dword_211102000, v4, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Finding card on file failed: %{public}@", (uint8_t *)&v7, 0x20u);

  }
}

- (id)_promiseToPromptBeforeBiometricAuth
{
  uint64_t v3;
  void *v4;
  void *v5;
  __CFString *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  AMSUIAlertDialogTask *v30;
  void *v31;
  AMSUIAlertDialogTask *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  id v36;
  id v37;
  void *v38;
  void *v40;
  _QWORD v41[5];
  _QWORD v42[4];
  id v43;
  id v44;
  AMSUICardOnFilePVTFetchTask *v45;

  v3 = objc_msgSend(MEMORY[0x24BE08080], "type");
  -[AMSUICardOnFilePVTFetchTask bag](self, "bag");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.AppleMediaServicesUI"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 == 3)
    v6 = CFSTR("FACE_ID");
  else
    v6 = CFSTR("TOUCH_ID");
  AMSUILocalizedStringFromBundle(v6, v4, v5);
  v7 = objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x24BDD17C8];
  -[AMSUICardOnFilePVTFetchTask bag](self, "bag");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.AppleMediaServicesUI"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  AMSUILocalizedStringFromBundle(CFSTR("PAYMENT_VERIFICATION_BIOMETRIC_CONFIRMATION_MESSAGE"), v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = (void *)v7;
  objc_msgSend(v8, "stringWithFormat:", v11, v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)MEMORY[0x24BDD17C8];
  -[AMSUICardOnFilePVTFetchTask bag](self, "bag");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.AppleMediaServicesUI"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  AMSUILocalizedStringFromBundle(CFSTR("PAYMENT_VERIFICATION_BIOMETRIC_CONFIRMATION_CONTINUE_BUTTON"), v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringWithFormat:", v16, v7);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = objc_alloc_init(MEMORY[0x24BE08340]);
  v19 = objc_alloc(MEMORY[0x24BE08130]);
  -[AMSUICardOnFilePVTFetchTask bag](self, "bag");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.AppleMediaServicesUI"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  AMSUILocalizedStringFromBundle(CFSTR("PAYMENT_VERIFICATION_BIOMETRIC_CONFIRMATION_TITLE"), v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)objc_msgSend(v19, "initWithTitle:message:", v22, v12);

  objc_msgSend(MEMORY[0x24BE08128], "actionWithTitle:", v17);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "addButtonAction:", v24);

  v25 = (void *)MEMORY[0x24BE08128];
  -[AMSUICardOnFilePVTFetchTask bag](self, "bag");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.AppleMediaServicesUI"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  AMSUILocalizedStringFromBundle(CFSTR("CANCEL"), v26, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "actionWithTitle:style:", v28, 2);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "addButtonAction:", v29);

  v30 = [AMSUIAlertDialogTask alloc];
  -[AMSUICardOnFilePVTFetchTask viewController](self, "viewController");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = -[AMSUIAlertDialogTask initWithRequest:presentingViewController:](v30, "initWithRequest:presentingViewController:", v23, v31);

  -[AMSUICardOnFilePVTFetchTask metrics](self, "metrics");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "enqueueEventWithPageId:displayReason:", CFSTR("ParentConsent"), 0);

  -[AMSUIAlertDialogTask present](v32, "present");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = MEMORY[0x24BDAC760];
  v42[0] = MEMORY[0x24BDAC760];
  v42[1] = 3221225472;
  v42[2] = __66__AMSUICardOnFilePVTFetchTask__promiseToPromptBeforeBiometricAuth__block_invoke;
  v42[3] = &unk_24CB4F7B0;
  v43 = v23;
  v44 = v18;
  v45 = self;
  v36 = v18;
  v37 = v23;
  objc_msgSend(v34, "addFinishBlock:", v42);

  v41[0] = v35;
  v41[1] = 3221225472;
  v41[2] = __66__AMSUICardOnFilePVTFetchTask__promiseToPromptBeforeBiometricAuth__block_invoke_2;
  v41[3] = &unk_24CB4F760;
  v41[4] = self;
  objc_msgSend(v36, "thenWithBlock:", v41);
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  return v38;
}

void __66__AMSUICardOnFilePVTFetchTask__promiseToPromptBeforeBiometricAuth__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  id v11;

  v3 = *(void **)(a1 + 32);
  objc_msgSend(a2, "selectedActionIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "locateActionWithIdentifier:", v4);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v11, "style");
  v6 = *(void **)(a1 + 40);
  if (v5 == 2)
  {
    AMSError();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "finishWithError:", v7);

    objc_msgSend(*(id *)(a1 + 48), "metrics");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    v10 = CFSTR("Cancel");
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "finishWithResult:", CFSTR("User continued with biometric auth"));
    objc_msgSend(*(id *)(a1 + 48), "metrics");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    v10 = CFSTR("Continue");
  }
  objc_msgSend(v8, "enqueueEventWithTargetId:pageId:displayReason:", v10, CFSTR("ParentConsent"), 0);

}

uint64_t __66__AMSUICardOnFilePVTFetchTask__promiseToPromptBeforeBiometricAuth__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_promiseToLoadPVTURL");
}

- (id)_promiseToLoadPVTURL
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[5];

  -[AMSUICardOnFilePVTFetchTask metrics](self, "metrics");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "enqueueEventWithPageId:displayReason:", CFSTR("ParentBiometric"), 0);

  -[AMSUICardOnFilePVTFetchTask bag](self, "bag");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "URLForKey:", CFSTR("verifyPaymentApplePayAurumOnStackPVT"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "valuePromise");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __51__AMSUICardOnFilePVTFetchTask__promiseToLoadPVTURL__block_invoke;
  v9[3] = &unk_24CB4F760;
  v9[4] = self;
  objc_msgSend(v6, "thenWithBlock:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t __51__AMSUICardOnFilePVTFetchTask__promiseToLoadPVTURL__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_promiseToFetchCardOnStackTokenURL:", a2);
}

- (id)_promiseToFetchCardOnStackTokenURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  _QWORD v12[5];
  _QWORD v13[5];

  v4 = a3;
  -[AMSUICardOnFilePVTFetchTask account](self, "account");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSUICardOnFilePVTFetchTask accountParameters](self, "accountParameters");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSUICardOnFilePVTFetchTask bag](self, "bag");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSUIPaymentVerificationProtocolHandler _promiseToFetchURLResponseForAccount:accountParameters:url:bag:requestBody:bodyEncoding:contentType:](AMSUIPaymentVerificationProtocolHandler, "_promiseToFetchURLResponseForAccount:accountParameters:url:bag:requestBody:bodyEncoding:contentType:", v5, v6, v4, v7, 0, 0, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = MEMORY[0x24BDAC760];
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __66__AMSUICardOnFilePVTFetchTask__promiseToFetchCardOnStackTokenURL___block_invoke;
  v13[3] = &unk_24CB4F788;
  v13[4] = self;
  objc_msgSend(v8, "thenWithBlock:", v13);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v9;
  v12[1] = 3221225472;
  v12[2] = __66__AMSUICardOnFilePVTFetchTask__promiseToFetchCardOnStackTokenURL___block_invoke_2;
  v12[3] = &unk_24CB4F560;
  v12[4] = self;
  objc_msgSend(v10, "addErrorBlock:", v12);

  return v10;
}

id __66__AMSUICardOnFilePVTFetchTask__promiseToFetchCardOnStackTokenURL___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  objc_msgSend(a2, "object");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSUIParentalVerificationCore _tokenFromObject:](AMSUIParentalVerificationCore, "_tokenFromObject:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  +[AMSUIParentalVerificationCore _tokenResultFromTokenString:](AMSUIParentalVerificationCore, "_tokenResultFromTokenString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "metrics");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "enqueueEventWithPageId:displayReason:", CFSTR("ParentVerified"), CFSTR("CardOnFile"));

    objc_msgSend(*(id *)(a1 + 32), "metrics");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "flushEvents");

    objc_msgSend(MEMORY[0x24BE08340], "promiseWithResult:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    AMSError();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "metrics");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setDisplayReason:", CFSTR("Biometric scan failed"));

    objc_msgSend(MEMORY[0x24BE08340], "promiseWithError:", v9);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

void __66__AMSUICardOnFilePVTFetchTask__promiseToFetchCardOnStackTokenURL___block_invoke_2(uint64_t a1, void *a2)
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
  objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
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
    v7 = 138543874;
    v8 = v5;
    v9 = 2114;
    v10 = v6;
    v11 = 2114;
    v12 = v2;
    _os_log_impl(&dword_211102000, v4, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Fetch card on file failed: %{public}@", (uint8_t *)&v7, 0x20u);

  }
}

- (id)_promiseToPromptAfterCancel
{
  uint64_t v3;
  void *v4;
  void *v5;
  __CFString *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  AMSUIAlertDialogTask *v29;
  void *v30;
  AMSUIAlertDialogTask *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  id v35;
  id v36;
  void *v37;
  void *v39;
  void *v40;
  void *v41;
  _QWORD v42[5];
  _QWORD v43[4];
  id v44;
  __CFString *v45;
  id v46;
  AMSUICardOnFilePVTFetchTask *v47;

  v3 = objc_msgSend(MEMORY[0x24BE08080], "type");
  -[AMSUICardOnFilePVTFetchTask bag](self, "bag");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.AppleMediaServicesUI"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 == 3)
    v6 = CFSTR("FACE_ID");
  else
    v6 = CFSTR("TOUCH_ID");
  AMSUILocalizedStringFromBundle(v6, v4, v5);
  v7 = objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x24BDD17C8];
  -[AMSUICardOnFilePVTFetchTask bag](self, "bag");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.AppleMediaServicesUI"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  AMSUILocalizedStringFromBundle(CFSTR("PAYMENT_VERIFICATION_BIOMETRIC_CANCEL_TITLE"), v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", v11, v7);
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)MEMORY[0x24BDD17C8];
  -[AMSUICardOnFilePVTFetchTask bag](self, "bag");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.AppleMediaServicesUI"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  AMSUILocalizedStringFromBundle(CFSTR("PAYMENT_VERIFICATION_BIOMETRIC_CANCEL_MESSAGE"), v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = (void *)v7;
  objc_msgSend(v12, "stringWithFormat:", v15, v7);
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = (void *)MEMORY[0x24BDD17C8];
  -[AMSUICardOnFilePVTFetchTask bag](self, "bag");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.AppleMediaServicesUI"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  AMSUILocalizedStringFromBundle(CFSTR("PAYMENT_VERIFICATION_BIOMETRIC_CANCEL_RETRACT_BUTTON"), v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "stringWithFormat:", v19, v7);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = objc_alloc_init(MEMORY[0x24BE08340]);
  v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE08130]), "initWithTitle:message:", v40, v39);
  v23 = (void *)MEMORY[0x24BE08128];
  -[AMSUICardOnFilePVTFetchTask bag](self, "bag");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.AppleMediaServicesUI"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  AMSUILocalizedStringFromBundle(CFSTR("PAYMENT_VERIFICATION_BIOMETRIC_CANCEL_CONFIRM_BUTTON"), v24, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "actionWithTitle:identifier:", v26, CFSTR("cancelConfirmId"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "addButtonAction:", v27);

  objc_msgSend(MEMORY[0x24BE08128], "actionWithTitle:identifier:", v20, CFSTR("cancelRetractId"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "addButtonAction:", v28);

  v29 = [AMSUIAlertDialogTask alloc];
  -[AMSUICardOnFilePVTFetchTask viewController](self, "viewController");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = -[AMSUIAlertDialogTask initWithRequest:presentingViewController:](v29, "initWithRequest:presentingViewController:", v22, v30);

  -[AMSUICardOnFilePVTFetchTask metrics](self, "metrics");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "enqueueEventWithPageId:displayReason:", CFSTR("ContinueNoBiometric"), 0);

  -[AMSUIAlertDialogTask present](v31, "present");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = MEMORY[0x24BDAC760];
  v43[0] = MEMORY[0x24BDAC760];
  v43[1] = 3221225472;
  v43[2] = __58__AMSUICardOnFilePVTFetchTask__promiseToPromptAfterCancel__block_invoke;
  v43[3] = &unk_24CB4F7D8;
  v44 = v22;
  v45 = CFSTR("cancelConfirmId");
  v46 = v21;
  v47 = self;
  v35 = v21;
  v36 = v22;
  objc_msgSend(v33, "addFinishBlock:", v43);

  v42[0] = v34;
  v42[1] = 3221225472;
  v42[2] = __58__AMSUICardOnFilePVTFetchTask__promiseToPromptAfterCancel__block_invoke_2;
  v42[3] = &unk_24CB4F760;
  v42[4] = self;
  objc_msgSend(v35, "thenWithBlock:", v42);
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  return v37;
}

void __58__AMSUICardOnFilePVTFetchTask__promiseToPromptAfterCancel__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  id v11;

  v3 = *(void **)(a1 + 32);
  objc_msgSend(a2, "selectedActionIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "locateActionWithIdentifier:", v4);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = objc_msgSend(v5, "isEqualToString:", *(_QWORD *)(a1 + 40));

  v6 = *(void **)(a1 + 48);
  if ((_DWORD)v4)
  {
    AMSError();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "finishWithError:", v7);

    objc_msgSend(*(id *)(a1 + 56), "metrics");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    v10 = CFSTR("Payment");
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 48), "finishWithResult:", CFSTR("User opted to not cancel biometric auth"));
    objc_msgSend(*(id *)(a1 + 56), "metrics");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    v10 = CFSTR("Biometric");
  }
  objc_msgSend(v8, "enqueueEventWithTargetId:pageId:displayReason:", v10, CFSTR("ContinueNoBiometric"), 0);

}

uint64_t __58__AMSUICardOnFilePVTFetchTask__promiseToPromptAfterCancel__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_promiseToLoadPVTURL");
}

+ (id)_accountToUseFromGivenAccount:(id)a3 accountParameters:(id)a4 activeiTunesAccount:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  int v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  int v22;
  uint8_t buf[4];
  uint64_t v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a5;
  v9 = a4;
  objc_msgSend(v8, "ams_altDSID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "ams_altDSID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isEqualToString:", v10);

  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("altDsId"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_msgSend(v13, "isEqualToString:", v10);
  objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v15)
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v15, "OSLogObject");
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v17 = objc_opt_class();
    AMSLogKey();
    v22 = v12;
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "ams_altDSID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544386;
    v24 = v17;
    v25 = 2114;
    v26 = v18;
    v27 = 2114;
    v28 = v10;
    v29 = 2114;
    v30 = v19;
    v31 = 2114;
    v32 = v13;
    _os_log_impl(&dword_211102000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Active iTunes: %{public}@, provided account: %{public}@, provided parameters: %{public}@", buf, 0x34u);

    v12 = v22;
  }

  if ((v12 | v14) == 1)
    v20 = v8;
  else
    v20 = 0;

  return v20;
}

- (ACAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
  objc_storeStrong((id *)&self->_account, a3);
}

- (NSDictionary)accountParameters
{
  return self->_accountParameters;
}

- (void)setAccountParameters:(id)a3
{
  objc_storeStrong((id *)&self->_accountParameters, a3);
}

- (AMSBagProtocol)bag
{
  return self->_bag;
}

- (void)setBag:(id)a3
{
  objc_storeStrong((id *)&self->_bag, a3);
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
  objc_storeStrong((id *)&self->_displayName, a3);
}

- (AMSUIPaymentVerificationMetrics)metrics
{
  return self->_metrics;
}

- (void)setMetrics:(id)a3
{
  objc_storeStrong((id *)&self->_metrics, a3);
}

- (ACAccount)originalAccount
{
  return self->_originalAccount;
}

- (void)setOriginalAccount:(id)a3
{
  objc_storeStrong((id *)&self->_originalAccount, a3);
}

- (UIViewController)viewController
{
  return self->_viewController;
}

- (void)setViewController:(id)a3
{
  objc_storeStrong((id *)&self->_viewController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewController, 0);
  objc_storeStrong((id *)&self->_originalAccount, 0);
  objc_storeStrong((id *)&self->_metrics, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_bag, 0);
  objc_storeStrong((id *)&self->_accountParameters, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end
