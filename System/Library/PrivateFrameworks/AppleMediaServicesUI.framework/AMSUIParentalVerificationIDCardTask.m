@implementation AMSUIParentalVerificationIDCardTask

- (AMSUIParentalVerificationIDCardTask)initWithAccount:(id)a3 accountParameters:(id)a4 bag:(id)a5 displayName:(id)a6 metrics:(id)a7 viewController:(id)a8
{
  id v15;
  id v16;
  id v17;
  AMSUIParentalVerificationIDCardTask *v18;
  AMSUIParentalVerificationIDCardTask *v19;
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
  v24.super_class = (Class)AMSUIParentalVerificationIDCardTask;
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
  NSObject *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  int v19;
  uint64_t v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
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
    v19 = 138543618;
    v20 = v5;
    v21 = 2114;
    v22 = v6;
    _os_log_impl(&dword_211102000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Running AMSUIParentalVerificationIDCardTask", (uint8_t *)&v19, 0x16u);

  }
  objc_msgSend(MEMORY[0x24BDB4398], "ams_sharedAccountStoreForMediaType:", *MEMORY[0x24BE07C98]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSUIParentalVerificationIDCardTask originalAccount](self, "originalAccount");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSUIParentalVerificationIDCardTask accountParameters](self, "accountParameters");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSUIPaymentVerificationProtocolHandler _accountToUseFromGivenAccount:accountParameters:accountStore:](AMSUIPaymentVerificationProtocolHandler, "_accountToUseFromGivenAccount:accountParameters:accountStore:", v8, v9, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[AMSUIParentalVerificationIDCardTask setAccount:](self, "setAccount:", v10);
    -[AMSUIParentalVerificationIDCardTask _promiseToRequestIDCardData](self, "_promiseToRequestIDCardData");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    AMSCustomError();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v13)
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v13, "OSLogObject");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v15 = objc_opt_class();
      AMSLogKey();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138543874;
      v20 = v15;
      v21 = 2114;
      v22 = v16;
      v23 = 2114;
      v24 = v12;
      _os_log_impl(&dword_211102000, v14, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] %{public}@", (uint8_t *)&v19, 0x20u);

    }
    objc_msgSend(MEMORY[0x24BE08340], "promiseWithError:", v12);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSUIParentalVerificationIDCardTask metrics](self, "metrics");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setDisplayReason:", CFSTR("Missing account"));

  }
  return v11;
}

- (id)_promiseToRequestIDCardData
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[5];
  id v13;

  -[AMSUIParentalVerificationIDCardTask account](self, "account");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ams_altDSID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[AMSUIParentalVerificationIDCardTask accountParameters](self, "accountParameters");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSUIParentalVerificationCore _minimumAgeFrom:](AMSUIParentalVerificationCore, "_minimumAgeFrom:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[AMSUIParentalVerificationIDCardTask _dataFromIDCardForMinimumAge:nonce:](self, "_dataFromIDCardForMinimumAge:nonce:", objc_msgSend(v6, "integerValue"), v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[AMSUIParentalVerificationIDCardTask bag](self, "bag");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dictionaryForKey:", CFSTR("parental-verification"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "valuePromise");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __66__AMSUIParentalVerificationIDCardTask__promiseToRequestIDCardData__block_invoke;
    v12[3] = &unk_24CB50390;
    v12[4] = self;
    v13 = v4;
    objc_msgSend(v10, "thenWithBlock:", v12);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

uint64_t __66__AMSUIParentalVerificationIDCardTask__promiseToRequestIDCardData__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;

  v3 = a2;
  v4 = objc_msgSend((id)objc_opt_class(), "_minAgeFromObject:", v3);

  return objc_msgSend(*(id *)(a1 + 32), "_dataFromIDCardForMinimumAge:nonce:", v4, *(_QWORD *)(a1 + 40));
}

- (id)_dataFromIDCardForMinimumAge:(int64_t)a3 nonce:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  _QWORD v17[5];
  id v18;
  id v19;
  id v20;
  id v21;
  int64_t v22;

  v6 = a4;
  v7 = objc_alloc_init(MEMORY[0x24BE082B0]);
  objc_msgSend((id)objc_opt_class(), "_descriptorForMinimumAge:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_identityController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __74__AMSUIParentalVerificationIDCardTask__dataFromIDCardForMinimumAge_nonce___block_invoke;
  v17[3] = &unk_24CB50490;
  v17[4] = self;
  v18 = v8;
  v19 = v6;
  v20 = v9;
  v10 = v7;
  v21 = v10;
  v22 = a3;
  v11 = v9;
  v12 = v6;
  v13 = v8;
  objc_msgSend(v11, "checkCanRequestDocument:completion:", v13, v17);
  v14 = v21;
  v15 = v10;

  return v15;
}

void __74__AMSUIParentalVerificationIDCardTask__dataFromIDCardForMinimumAge_nonce___block_invoke(uint64_t a1, int a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;
  uint64_t v13;

  v3 = *(void **)(a1 + 32);
  if (a2)
  {
    objc_msgSend((id)objc_opt_class(), "_identityRequestWithDescriptor:nonce:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __74__AMSUIParentalVerificationIDCardTask__dataFromIDCardForMinimumAge_nonce___block_invoke_2;
    v10[3] = &unk_24CB50468;
    v10[4] = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(a1 + 56);
    v6 = *(id *)(a1 + 64);
    v7 = *(_QWORD *)(a1 + 72);
    v11 = v6;
    v13 = v7;
    v12 = *(id *)(a1 + 48);
    objc_msgSend(v5, "requestDocument:completion:", v4, v10);

  }
  else
  {
    objc_msgSend(v3, "metrics");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setDisplayReason:", CFSTR("No suitable ID card"));

    AMSError();
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 64), "finishWithError:", v9);

  }
}

void __74__AMSUIParentalVerificationIDCardTask__dataFromIDCardForMinimumAge_nonce___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  const __CFString *v31;
  uint64_t v32;
  uint8_t buf[4];
  uint64_t v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  objc_msgSend(v5, "encryptedData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v5, "encryptedData");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "_requestDictFromMinimumAge:walletData:nonce:", *(_QWORD *)(a1 + 56), v8, *(_QWORD *)(a1 + 48));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "_promiseToLoadPVTURLWithBody:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "finishWithPromise:", v11);

  }
  else
  {
    v12 = objc_msgSend(v6, "code");
    objc_msgSend(*(id *)(a1 + 32), "metrics");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v12 == 2)
    {
      objc_msgSend(v13, "setDisplayReason:", CFSTR("User closed wallet UI"));

      objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v15)
      {
        objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v15, "OSLogObject");
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        v17 = objc_opt_class();
        AMSLogKey();
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v34 = v17;
        v35 = 2114;
        v36 = v18;
        v37 = 2114;
        v38 = v6;
        _os_log_impl(&dword_211102000, v16, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] ID Card UI was cancelled by user: %{public}@", buf, 0x20u);

      }
      v19 = *(void **)(a1 + 40);
      v31 = CFSTR("really_cancelled");
      v32 = MEMORY[0x24BDBD1C8];
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v32, &v31, 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      AMSCustomError();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "finishWithError:", v21);

    }
    else
    {
      objc_msgSend(v13, "setDisplayReason:", CFSTR("ID Card document request failed"));

      objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v22)
      {
        objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v22, "OSLogObject");
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        v24 = objc_opt_class();
        AMSLogKey();
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v34 = v24;
        v35 = 2114;
        v36 = v25;
        v37 = 2114;
        v38 = v6;
        _os_log_impl(&dword_211102000, v23, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Request document from wallet failed: %{public}@", buf, 0x20u);

      }
      v26 = *(void **)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 32), "bag");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "viewController");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "metrics");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      +[AMSUIParentalVerificationCommon _promiseToPromptAfterFailureWithBag:viewController:metrics:pageID:flowName:](AMSUIParentalVerificationCommon, "_promiseToPromptAfterFailureWithBag:viewController:metrics:pageID:flowName:", v27, v28, v29, CFSTR("ContinueNoIDCard"), CFSTR("Wallet ID card"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "finishWithPromise:", v30);

    }
  }

}

+ (id)_descriptorForMinimumAge:(int64_t)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  v4 = objc_alloc_init(getPKIdentityDriversLicenseDescriptorClass());
  objc_msgSend(MEMORY[0x24BE6EB48], "ageThresholdElementWithAge:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE6EB50], "willNotStoreIntent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addElements:withIntentToStore:", v6, v7);

  return v4;
}

+ (id)_identityController
{
  return objc_alloc_init(getPKIdentityAuthorizationControllerClass());
}

+ (id)_identityRequestWithDescriptor:(id)a3 nonce:(id)a4
{
  Class (__cdecl *v6)();
  id v7;
  id v8;
  id v9;
  void *v10;

  v6 = (Class (__cdecl *)())getPKIdentityRequestClass;
  v7 = a4;
  v8 = a3;
  v9 = objc_alloc_init(v6());
  objc_msgSend(v9, "setDescriptor:", v8);

  objc_msgSend(a1, "_nonceFromString:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setNonce:", v10);
  objc_msgSend(v9, "setMerchantIdentifier:", CFSTR("com.apple.ams-identity-verification"));
  return v9;
}

+ (id)_nonceFromString:(id)a3
{
  return (id)objc_msgSend(a3, "dataUsingEncoding:", 4);
}

- (id)_promiseToLoadPVTURLWithBody:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD v12[5];
  id v13;

  v4 = a3;
  -[AMSUIParentalVerificationIDCardTask metrics](self, "metrics");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "enqueueEventWithPageId:displayReason:", CFSTR("ParentalVerificationIDCard"), 0);

  -[AMSUIParentalVerificationIDCardTask bag](self, "bag");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "URLForKey:", CFSTR("verifyAgeMeadPvt"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "valuePromise");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __68__AMSUIParentalVerificationIDCardTask__promiseToLoadPVTURLWithBody___block_invoke;
  v12[3] = &unk_24CB50390;
  v12[4] = self;
  v13 = v4;
  v9 = v4;
  objc_msgSend(v8, "thenWithBlock:", v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

uint64_t __68__AMSUIParentalVerificationIDCardTask__promiseToLoadPVTURLWithBody___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_promiseToFetchIDCardTokenURL:requestBody:", a2, *(_QWORD *)(a1 + 40));
}

- (id)_promiseToFetchIDCardTokenURL:(id)a3 requestBody:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[5];

  v6 = a4;
  v7 = a3;
  -[AMSUIParentalVerificationIDCardTask account](self, "account");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSUIParentalVerificationIDCardTask accountParameters](self, "accountParameters");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSUIParentalVerificationIDCardTask bag](self, "bag");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSUIPaymentVerificationProtocolHandler _promiseToFetchURLResponseForAccount:accountParameters:url:bag:requestBody:bodyEncoding:contentType:](AMSUIPaymentVerificationProtocolHandler, "_promiseToFetchURLResponseForAccount:accountParameters:url:bag:requestBody:bodyEncoding:contentType:", v8, v9, v7, v10, v6, 3, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __81__AMSUIParentalVerificationIDCardTask__promiseToFetchIDCardTokenURL_requestBody___block_invoke;
  v14[3] = &unk_24CB503B8;
  v14[4] = self;
  objc_msgSend(v11, "continueWithBlock:", v14);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

id __81__AMSUIParentalVerificationIDCardTask__promiseToFetchIDCardTokenURL_requestBody___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v20;
  NSObject *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  uint64_t v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "metrics");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setDisplayReason:", CFSTR("ID card data fetch failed"));

    objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v8, "OSLogObject");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = objc_opt_class();
      AMSLogKey();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = 138543874;
      v29 = v10;
      v30 = 2114;
      v31 = v11;
      v32 = 2114;
      v33 = v6;
      _os_log_impl(&dword_211102000, v9, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Fetch PVT for ID Card failed: %{public}@", (uint8_t *)&v28, 0x20u);

    }
    objc_msgSend(*(id *)(a1 + 32), "bag");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "viewController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "metrics");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[AMSUIParentalVerificationCommon _promiseToPromptAfterFailureWithBag:viewController:metrics:pageID:flowName:](AMSUIParentalVerificationCommon, "_promiseToPromptAfterFailureWithBag:viewController:metrics:pageID:flowName:", v12, v13, v14, CFSTR("ContinueNoIDCard"), CFSTR("Wallet ID card"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v5, "object");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    +[AMSUIParentalVerificationCore _tokenFromObject:](AMSUIParentalVerificationCore, "_tokenFromObject:", v16);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    +[AMSUIParentalVerificationCore _tokenResultFromTokenString:](AMSUIParentalVerificationCore, "_tokenResultFromTokenString:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      objc_msgSend(*(id *)(a1 + 32), "metrics");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "enqueueEventWithPageId:displayReason:", CFSTR("ParentVerified"), CFSTR("IDCard"));

      objc_msgSend(*(id *)(a1 + 32), "metrics");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "flushEvents");

      objc_msgSend(MEMORY[0x24BE08340], "promiseWithResult:", v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    }
    objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v20)
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v20, "OSLogObject");
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      v22 = objc_opt_class();
      AMSLogKey();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "object");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = 138543874;
      v29 = v22;
      v30 = 2114;
      v31 = v23;
      v32 = 2114;
      v33 = v24;
      _os_log_impl(&dword_211102000, v21, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Fetch PVT for ID Card response had no token: %{public}@", (uint8_t *)&v28, 0x20u);

    }
    objc_msgSend(*(id *)(a1 + 32), "metrics");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setDisplayReason:", CFSTR("ID card data failed"));

    objc_msgSend(*(id *)(a1 + 32), "bag");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "viewController");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "metrics");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    +[AMSUIParentalVerificationCommon _promiseToPromptAfterFailureWithBag:viewController:metrics:pageID:flowName:](AMSUIParentalVerificationCommon, "_promiseToPromptAfterFailureWithBag:viewController:metrics:pageID:flowName:", v14, v26, v27, CFSTR("ContinueNoIDCard"), CFSTR("Wallet ID card"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
LABEL_10:

  return v15;
}

+ (id)_requestDictFromMinimumAge:(int64_t)a3 walletData:(id)a4 nonce:(id)a5
{
  __CFString *v7;
  __CFString *v8;
  uint64_t v9;
  void *v10;
  const __CFString *v11;
  const __CFString *v12;
  void *v13;
  _QWORD v15[3];
  _QWORD v16[4];

  v16[3] = *MEMORY[0x24BDAC8D0];
  v7 = (__CFString *)a5;
  objc_msgSend(a4, "base64EncodedStringWithOptions:", 1);
  v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v15[0] = CFSTR("ageThreshold");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (v8)
    v11 = v8;
  else
    v11 = &stru_24CB5A078;
  v16[0] = v9;
  v16[1] = v11;
  v15[1] = CFSTR("digitalId");
  v15[2] = CFSTR("nonce");
  if (v7)
    v12 = v7;
  else
    v12 = &stru_24CB5A078;
  v16[2] = v12;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v16, v15, 3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (int64_t)_minAgeFromObject:(id)a3
{
  id v3;
  id v4;
  void *v5;
  id v6;
  int64_t v7;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;

  if (v4)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("min-age"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v5;
    else
      v6 = 0;

    if (v6)
      v7 = objc_msgSend(v6, "integerValue");
    else
      v7 = 18;

  }
  else
  {
    v7 = 18;
  }

  return v7;
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
