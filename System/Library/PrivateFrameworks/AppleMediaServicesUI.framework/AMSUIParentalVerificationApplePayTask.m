@implementation AMSUIParentalVerificationApplePayTask

- (AMSUIParentalVerificationApplePayTask)initWithAccount:(id)a3 accountParameters:(id)a4 bag:(id)a5 displayName:(id)a6 metrics:(id)a7 viewController:(id)a8
{
  id v15;
  id v16;
  id v17;
  AMSUIParentalVerificationApplePayTask *v18;
  AMSUIParentalVerificationApplePayTask *v19;
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
  v24.super_class = (Class)AMSUIParentalVerificationApplePayTask;
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
  NSObject *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  _QWORD v21[5];
  uint8_t buf[4];
  uint64_t v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
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
    v23 = v5;
    v24 = 2114;
    v25 = v6;
    _os_log_impl(&dword_211102000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Starting task", buf, 0x16u);

  }
  objc_msgSend(MEMORY[0x24BDB4398], "ams_sharedAccountStoreForMediaType:", *MEMORY[0x24BE07C98]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSUIParentalVerificationApplePayTask originalAccount](self, "originalAccount");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSUIParentalVerificationApplePayTask accountParameters](self, "accountParameters");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSUIPaymentVerificationProtocolHandler _accountToUseFromGivenAccount:accountParameters:accountStore:](AMSUIPaymentVerificationProtocolHandler, "_accountToUseFromGivenAccount:accountParameters:accountStore:", v8, v9, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[AMSUIParentalVerificationApplePayTask setAccount:](self, "setAccount:", v10);
    v11 = (void *)MEMORY[0x24BE080B8];
    -[AMSUIParentalVerificationApplePayTask bag](self, "bag");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "performPaymentSessionForVerificationWithBag:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 3221225472;
    v21[2] = __52__AMSUIParentalVerificationApplePayTask_performTask__block_invoke;
    v21[3] = &unk_24CB50340;
    v21[4] = self;
    objc_msgSend(v13, "thenWithBlock:", v21);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    AMSCustomError();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
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
      v23 = v17;
      v24 = 2114;
      v25 = v18;
      v26 = 2114;
      v27 = v13;
      _os_log_impl(&dword_211102000, v16, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] %{public}@", buf, 0x20u);

    }
    objc_msgSend(MEMORY[0x24BE08340], "promiseWithError:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSUIParentalVerificationApplePayTask metrics](self, "metrics");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setDisplayReason:", CFSTR("Missing account"));

  }
  -[AMSUIParentalVerificationApplePayTask setResultPromise:](self, "setResultPromise:", v14);

  return v14;
}

id __52__AMSUIParentalVerificationApplePayTask_performTask__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x24BDD1488];
  v4 = a2;
  objc_msgSend(v3, "bundleWithIdentifier:", CFSTR("com.apple.AppleMediaServicesUI"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(void **)(a1 + 32);
  objc_msgSend(v6, "bag");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "accountParameters");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_promiseToRequestWalletDataUsingSession:bag:accountParameters:bundle:", v4, v7, v8, v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_promiseToRequestWalletDataUsingSession:(id)a3 bag:(id)a4 accountParameters:(id)a5 bundle:(id)a6
{
  id v10;
  id v11;
  id v12;
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
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v37;
  uint64_t v38;
  void *v39;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  objc_msgSend(MEMORY[0x24BE6ECF8], "availableNetworks");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "countryCode");
  v38 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "currencyCode");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = (void *)objc_opt_class();
  -[AMSUIParentalVerificationApplePayTask account](self, "account");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "_biometricsRequestWithAccount:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSUIParentalVerificationApplePayTask setBiometricsRequest:](self, "setBiometricsRequest:", v20);

  -[AMSUIParentalVerificationApplePayTask biometricsRequest](self, "biometricsRequest");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v39 = v13;
  if (v21)
  {
    v22 = (void *)objc_opt_class();
    -[AMSUIParentalVerificationApplePayTask biometricsRequest](self, "biometricsRequest");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = v13;
    v24 = v10;
    v25 = v10;
    v26 = (void *)v38;
    objc_msgSend(v22, "paymentRequestFromPaymentSession:currencyCode:countryCode:networks:bag:accountParameters:bundle:biometricsRequest:", v25, v17, v38, v14, v11, v12, v37, v23);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    v28 = (void *)objc_opt_class();
    -[AMSUIParentalVerificationApplePayTask biometricsRequest](self, "biometricsRequest");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v28) = objc_msgSend(v28, "_walletHasValidSetup:paymentRequest:", v29, v27);

    if ((_DWORD)v28)
    {
      -[AMSUIParentalVerificationApplePayTask _presentPaymentRequest:](self, "_presentPaymentRequest:", v27);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[AMSUIParentalVerificationApplePayTask metrics](self, "metrics");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "setDisplayReason:", CFSTR("No suitable credit card in Wallet"));

      v34 = (void *)MEMORY[0x24BE08340];
      AMSError();
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "promiseWithError:", v35);
      v30 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v24 = v10;
    -[AMSUIParentalVerificationApplePayTask metrics](self, "metrics");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setDisplayReason:", CFSTR("Unable to create Wallet biometrics request"));

    v32 = (void *)MEMORY[0x24BE08340];
    AMSError();
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "promiseWithError:", v27);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = (void *)v38;
  }

  return v30;
}

+ (BOOL)_walletHasValidSetup:(id)a3 paymentRequest:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v5, "supportedNetworks");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "supportedCountries");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = PKCanMakePaymentsUsingNetworksIssuerCountryCodesWithCapabilities();

  objc_msgSend(v6, "localAuthContext");
  v9 = objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v5, "accesssControlRef");
  objc_msgSend((id)v9, "evaluationMechanismsForAccessControl:operation:error:", v10, 3, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v10) = objc_msgSend(v11, "containsObject:", &unk_24CB8C110);
  LOBYTE(v9) = objc_msgSend(v11, "containsObject:", &unk_24CB8C128);
  LOBYTE(a3) = a3 & (v10 | v9 | objc_msgSend(v11, "containsObject:", &unk_24CB8C140));

  return (char)a3;
}

+ (id)paymentRequestFromPaymentSession:(id)a3 currencyCode:(id)a4 countryCode:(id)a5 networks:(id)a6 bag:(id)a7 accountParameters:(id)a8 bundle:(id)a9 biometricsRequest:(id)a10
{
  id v16;
  void *v17;
  objc_class *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  NSObject *v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;
  uint64_t v51;
  uint64_t *v52;
  uint64_t v53;
  uint64_t v54;
  _QWORD v55[3];
  _QWORD v56[3];
  void *v57;
  _BYTE buf[24];
  void *v59;
  uint64_t *v60;
  uint64_t v61;

  v61 = *MEMORY[0x24BDAC8D0];
  v47 = a3;
  v46 = a4;
  v45 = a5;
  v44 = a6;
  v49 = a7;
  v43 = a8;
  v16 = a9;
  v48 = a10;
  v51 = 0;
  v52 = &v51;
  v53 = 0x2050000000;
  v17 = (void *)getPKPaymentRequestClass_softClass;
  v54 = getPKPaymentRequestClass_softClass;
  if (!getPKPaymentRequestClass_softClass)
  {
    *(_QWORD *)buf = MEMORY[0x24BDAC760];
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = __getPKPaymentRequestClass_block_invoke;
    v59 = &unk_24CB4F3E8;
    v60 = &v51;
    __getPKPaymentRequestClass_block_invoke((uint64_t)buf);
    v17 = (void *)v52[3];
  }
  v18 = objc_retainAutorelease(v17);
  _Block_object_dispose(&v51, 8);
  v19 = objc_alloc_init(v18);
  objc_msgSend(v19, "setAPIType:", 0);
  objc_msgSend(v19, "setRequestType:", 0);
  objc_msgSend(v19, "setRequestor:", 0);
  objc_msgSend(v19, "setMerchantSession:", v47);
  objc_msgSend(v19, "setExpectsMerchantSession:", 1);
  objc_msgSend(v19, "setMerchantCapabilities:", 5);
  objc_msgSend(v19, "setCurrencyCode:", v46);
  AMSNormalisedCountryCodeForPaymentRequest();
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20)
  {
    objc_msgSend(v19, "setCountryCode:", v20);
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setSupportedCountries:", v21);

  }
  objc_msgSend(v19, "setConfirmationStyle:", 1);
  v51 = 0;
  v52 = &v51;
  v53 = 0x2050000000;
  v22 = (void *)getPKPaymentSummaryItemClass_softClass;
  v54 = getPKPaymentSummaryItemClass_softClass;
  if (!getPKPaymentSummaryItemClass_softClass)
  {
    *(_QWORD *)buf = MEMORY[0x24BDAC760];
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = __getPKPaymentSummaryItemClass_block_invoke;
    v59 = &unk_24CB4F3E8;
    v60 = &v51;
    __getPKPaymentSummaryItemClass_block_invoke((uint64_t)buf);
    v22 = (void *)v52[3];
  }
  v23 = objc_retainAutorelease(v22);
  _Block_object_dispose(&v51, 8);
  objc_msgSend(MEMORY[0x24BDD1518], "zero");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "summaryItemWithLabel:amount:", CFSTR("Parental Verification (PVK)"), v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  v57 = v25;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v57, 1);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setPaymentSummaryItems:", v26);

  objc_msgSend(v19, "setSupportedNetworks:", v44);
  v27 = (id)objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.AppleMediaServicesUI"));
  AMSUILocalizedStringFromBundle(CFSTR("PARENTAL_VERIFICATION_APPLE_PAY_CLASSIC_SHEET_AUTH_TITLE"), v49, v16);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setLocalizedAuthorizingTitle:", v28);

  v29 = (id)objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.AppleMediaServicesUI"));
  AMSUILocalizedStringFromBundle(CFSTR("PARENTAL_VERIFICATION_APPLE_PAY_CLASSIC_SHEET_ERROR_TITLE"), v49, v16);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setLocalizedErrorMessage:", v30);

  objc_msgSend(v19, "setAccesssControlRef:", objc_msgSend(v48, "localAuthAccessControlRef"));
  objc_msgSend(v48, "localAuthContext");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "externalizedContext");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setExternalizedContext:", v32);

  objc_msgSend(v19, "setDisablePasscodeFallback:", 1);
  objc_msgSend(v19, "setClientViewSourceIdentifier:", CFSTR("AMSUIPaymentSheetViewProvider"));
  v50 = 0;
  objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v19, 1, &v50);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = v50;
  if (v34)
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v35)
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v35, "OSLogObject");
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      v37 = objc_opt_class();
      AMSLogKey();
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      *(_QWORD *)&buf[4] = v37;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v38;
      *(_WORD *)&buf[22] = 2114;
      v59 = v34;
      _os_log_impl(&dword_211102000, v36, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to serialise payment request with error: %{public}@", buf, 0x20u);

    }
    goto LABEL_15;
  }
  if (v33)
  {
    v39 = *MEMORY[0x24BE07FA8];
    v56[0] = v33;
    v40 = *MEMORY[0x24BE07FB8];
    v55[0] = v39;
    v55[1] = v40;
    objc_msgSend(a1, "_paymentRequestMetadataWithBag:bundle:accountParameters:", v49, v16, v43);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v56[1] = v41;
    v55[2] = *MEMORY[0x24BE07FB0];
    v56[2] = CFSTR("AMSPaymentSheetPaymentRequestLayoutValuePVK");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v56, v55, 3);
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v19, "setClientViewSourceParameter:", v35);
LABEL_15:

  }
  return v19;
}

+ (id)_biometricsRequestWithAccount:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  id v14;
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v3 = (objc_class *)MEMORY[0x24BE081B8];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  objc_msgSend(v5, "setAuthenticationFallbackVisible:", 0);
  objc_msgSend(v5, "setStyle:", objc_msgSend(MEMORY[0x24BE081B8], "preferredAttestationStyle"));
  objc_msgSend(v5, "setPurpose:", 0);
  objc_msgSend(MEMORY[0x24BE08328], "currentProcess");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE08088]), "initWithAccount:clientInfo:challenge:localAuthContext:options:error:", v4, v6, CFSTR("PVKAPCBiometricsChallenge"), 0, v5, &v14);

  v8 = v14;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v9, "OSLogObject");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = objc_opt_class();
      AMSLogKey();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v16 = v11;
      v17 = 2114;
      v18 = v12;
      v19 = 2114;
      v20 = v8;
      _os_log_impl(&dword_211102000, v10, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to create biometrics request with error: %{public}@", buf, 0x20u);

    }
  }

  return v7;
}

+ (id)_paymentRequestMetadataWithBag:(id)a3 bundle:(id)a4 accountParameters:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v21[6];
  _QWORD v22[7];

  v22[6] = *MEMORY[0x24BDAC8D0];
  v21[0] = CFSTR("sheetTitle");
  v8 = a5;
  v9 = a4;
  v10 = a3;
  objc_msgSend(a1, "_sheetTitleWithBag:bundle:", v10, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v11;
  v21[1] = CFSTR("contextTitle");
  objc_msgSend(a1, "_contextTitleWithBag:bundle:accountParameters:", v10, v9, v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v12;
  v21[2] = CFSTR("message");
  objc_msgSend(a1, "_messageWithBag:bundle:", v10, v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v22[2] = v13;
  v21[3] = CFSTR("titleIcon");
  objc_msgSend(a1, "_titleIconWithBundle:", v9);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v22[3] = v14;
  v21[4] = CFSTR("contextIcon");
  objc_msgSend(a1, "_contextIconWithBundle:accountParameters:", v9, v8);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v22[4] = v15;
  v21[5] = CFSTR("screenScale");
  v16 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "scale");
  objc_msgSend(v16, "numberWithDouble:");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v22[5] = v18;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v22, v21, 6);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

+ (id)_sheetTitleWithBag:(id)a3 bundle:(id)a4
{
  void *v5;
  id v6;
  id v7;
  id v8;
  void *v9;

  v5 = (void *)MEMORY[0x24BDD1488];
  v6 = a4;
  v7 = a3;
  v8 = (id)objc_msgSend(v5, "bundleWithIdentifier:", CFSTR("com.apple.AppleMediaServicesUI"));
  AMSUILocalizedStringFromBundle(CFSTR("PARENTAL_VERIFICATION_APPLE_PAY_CLASSIC_WALLET"), v7, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)_contextTitleWithBag:(id)a3 bundle:(id)a4 accountParameters:(id)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;

  v7 = a3;
  v8 = a4;
  objc_msgSend(a5, "objectForKeyedSubscript:", CFSTR("PVKApplePayClassicContextTitle"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v10 = v9;
  else
    v10 = 0;

  if (!v10)
  {
    v11 = (id)objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.AppleMediaServicesUI"));
    AMSUILocalizedStringFromBundle(CFSTR("PARENTAL_VERIFICATION_APPLE_PAY_CLASSIC_CONTEXT_NAME"), v7, v8);
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

+ (id)_messageWithBag:(id)a3 bundle:(id)a4
{
  void *v5;
  id v6;
  id v7;
  id v8;
  void *v9;

  v5 = (void *)MEMORY[0x24BDD1488];
  v6 = a4;
  v7 = a3;
  v8 = (id)objc_msgSend(v5, "bundleWithIdentifier:", CFSTR("com.apple.AppleMediaServicesUI"));
  AMSUILocalizedStringFromBundle(CFSTR("PARENTAL_VERIFICATION_APPLE_PAY_CLASSIC_MESSAGE"), v7, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)_titleIconWithBundle:(id)a3
{
  UIImage *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BEBD640], "imageNamed:inBundle:compatibleWithTraitCollection:", CFSTR("Wallet20x20"), a3, 0);
  v3 = (UIImage *)objc_claimAutoreleasedReturnValue();
  UIImagePNGRepresentation(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)_contextIconWithBundle:(id)a3 accountParameters:(id)a4
{
  id v5;
  void *v6;
  id v7;
  UIImage *v8;

  v5 = a3;
  objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("PVKApplePayClassicContextIcon"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;

  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BEBD640], "imageNamed:inBundle:compatibleWithTraitCollection:", CFSTR("FS54x54"), v5, 0);
    v8 = (UIImage *)objc_claimAutoreleasedReturnValue();
    UIImagePNGRepresentation(v8);
    v7 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (id)_presentPaymentRequest:(id)a3
{
  id v4;
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  objc_class *v9;
  void *v10;
  id v11;
  _QWORD v13[4];
  id v14;
  id v15;
  id location[5];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x24BE082B0]);
  v6 = objc_alloc_init(MEMORY[0x24BE082B0]);
  -[AMSUIParentalVerificationApplePayTask setDelegatePromise:](self, "setDelegatePromise:", v6);

  v17 = 0;
  v18 = &v17;
  v19 = 0x2050000000;
  v7 = (void *)getPKPaymentAuthorizationControllerClass_softClass;
  v20 = getPKPaymentAuthorizationControllerClass_softClass;
  v8 = MEMORY[0x24BDAC760];
  if (!getPKPaymentAuthorizationControllerClass_softClass)
  {
    location[0] = (id)MEMORY[0x24BDAC760];
    location[1] = (id)3221225472;
    location[2] = __getPKPaymentAuthorizationControllerClass_block_invoke;
    location[3] = &unk_24CB4F3E8;
    location[4] = &v17;
    __getPKPaymentAuthorizationControllerClass_block_invoke((uint64_t)location);
    v7 = (void *)v18[3];
  }
  v9 = objc_retainAutorelease(v7);
  _Block_object_dispose(&v17, 8);
  v10 = (void *)objc_msgSend([v9 alloc], "initWithPaymentRequest:", v4);
  objc_msgSend(v10, "setDelegate:", self);
  objc_msgSend(v10, "setPrivateDelegate:", self);
  -[AMSUIParentalVerificationApplePayTask setStrongSelf:](self, "setStrongSelf:", self);
  objc_initWeak(location, self);
  v13[0] = v8;
  v13[1] = 3221225472;
  v13[2] = __64__AMSUIParentalVerificationApplePayTask__presentPaymentRequest___block_invoke;
  v13[3] = &unk_24CB50368;
  objc_copyWeak(&v15, location);
  v11 = v5;
  v14 = v11;
  objc_msgSend(v10, "presentWithCompletion:", v13);

  objc_destroyWeak(&v15);
  objc_destroyWeak(location);

  return v11;
}

void __64__AMSUIParentalVerificationApplePayTask__presentPaymentRequest___block_invoke(uint64_t a1, int a2)
{
  void *v4;
  void *v5;
  void *v6;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  AMSSetLogKeyIfNeeded();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
  {
    v5 = *(void **)(a1 + 32);
    objc_msgSend(WeakRetained, "delegatePromise");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "finishWithPromise:", v6);
  }
  else
  {
    AMSError();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "finishWithError:", v6);
    objc_msgSend(WeakRetained, "setStrongSelf:", 0);
  }

}

- (void)paymentAuthorizationControllerDidFinish:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  BOOL v13;
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
  _QWORD v24[4];
  id v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  const __CFString *v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v5, "OSLogObject");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (void *)objc_opt_class();
    v8 = v7;
    AMSSetLogKeyIfNeeded();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSUIParentalVerificationApplePayTask paymentData](self, "paymentData");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = CFSTR("YES");
    *(_DWORD *)buf = 138543874;
    v27 = v7;
    if (!v10)
      v11 = CFSTR("NO");
    v28 = 2114;
    v29 = v9;
    v30 = 2112;
    v31 = v11;
    _os_log_impl(&dword_211102000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] paymentAuthorizationControllerDidFinish: with payment %@", buf, 0x20u);

  }
  -[AMSUIParentalVerificationApplePayTask paymentData](self, "paymentData");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12 == 0;

  if (v13)
  {
    -[AMSUIParentalVerificationApplePayTask metrics](self, "metrics");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setDisplayReason:", CFSTR("Present payment sheet completed with failure"));

    -[AMSUIParentalVerificationApplePayTask paymentError](self, "paymentError");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v17) = v18 == 0;

    if ((_DWORD)v17)
    {
      AMSCustomError();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[AMSUIParentalVerificationApplePayTask setPaymentError:](self, "setPaymentError:", v19);

      -[AMSUIParentalVerificationApplePayTask metrics](self, "metrics");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setDisplayReason:", CFSTR("User closed payment sheet"));

    }
    -[AMSUIParentalVerificationApplePayTask bag](self, "bag");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSUIParentalVerificationApplePayTask viewController](self, "viewController");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSUIParentalVerificationApplePayTask metrics](self, "metrics");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    +[AMSUIParentalVerificationCommon _promiseToPromptAfterFailureWithBag:viewController:metrics:pageID:flowName:](AMSUIParentalVerificationCommon, "_promiseToPromptAfterFailureWithBag:viewController:metrics:pageID:flowName:", v21, v22, v23, CFSTR("ContinueNoWalletPay"), CFSTR("Wallet pay"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    -[AMSUIParentalVerificationApplePayTask delegatePromise](self, "delegatePromise");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "finishWithPromise:", v14);
  }
  else
  {
    -[AMSUIParentalVerificationApplePayTask delegatePromise](self, "delegatePromise");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSUIParentalVerificationApplePayTask paymentData](self, "paymentData");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSUIParentalVerificationApplePayTask _promiseToLoadPVTURLWithBody:](self, "_promiseToLoadPVTURLWithBody:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "finishWithPromise:", v16);

  }
  objc_initWeak((id *)buf, self);
  v24[0] = MEMORY[0x24BDAC760];
  v24[1] = 3221225472;
  v24[2] = __81__AMSUIParentalVerificationApplePayTask_paymentAuthorizationControllerDidFinish___block_invoke;
  v24[3] = &unk_24CB4F800;
  objc_copyWeak(&v25, (id *)buf);
  objc_msgSend(v4, "dismissWithCompletion:", v24);
  objc_msgSend(v4, "setDelegate:", 0);
  -[AMSUIParentalVerificationApplePayTask setStrongSelf:](self, "setStrongSelf:", 0);
  objc_destroyWeak(&v25);
  objc_destroyWeak((id *)buf);

}

void __81__AMSUIParentalVerificationApplePayTask_paymentAuthorizationControllerDidFinish___block_invoke(uint64_t a1)
{

}

- (void)paymentAuthorizationController:(id)a3 didAuthorizePayment:(id)a4 handler:(id)a5
{
  id v7;
  void *v8;
  void (**v9)(id, void *);
  void *v10;
  NSObject *v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  const __CFString *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  v8 = (void *)MEMORY[0x24BE081D8];
  v9 = (void (**)(id, void *))a5;
  objc_msgSend(v8, "sharedConfig");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v10, "OSLogObject");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = (void *)objc_opt_class();
    v13 = v12;
    AMSSetLogKeyIfNeeded();
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = (void *)v14;
    v16 = CFSTR("YES");
    *(_DWORD *)buf = 138543874;
    v25 = v12;
    v26 = 2114;
    if (!v7)
      v16 = CFSTR("NO");
    v27 = v14;
    v28 = 2114;
    v29 = v16;
    _os_log_impl(&dword_211102000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] didAuthorizePayment: Did finish with payment? %{public}@", buf, 0x20u);

  }
  if (v7)
  {
    v17 = (void *)objc_msgSend(objc_alloc((Class)getPKPaymentAuthorizationResultClass()), "initWithStatus:errors:", 0, 0);
    objc_msgSend(v7, "token");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "paymentData");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSUIParentalVerificationApplePayTask setPaymentData:](self, "setPaymentData:", v19);
  }
  else
  {
    -[AMSUIParentalVerificationApplePayTask paymentError](self, "paymentError");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v20)
    {
      AMSError();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[AMSUIParentalVerificationApplePayTask setPaymentError:](self, "setPaymentError:", v21);

    }
    v22 = objc_alloc((Class)getPKPaymentAuthorizationResultClass());
    -[AMSUIParentalVerificationApplePayTask paymentError](self, "paymentError");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v18;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v23, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v22, "initWithStatus:errors:", 1, v19);
  }

  v9[2](v9, v17);
}

- (void)paymentAuthorizationController:(id)a3 willFinishWithError:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  id v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (v7)
  {
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
      v10 = (void *)objc_opt_class();
      v11 = v10;
      AMSSetLogKeyIfNeeded();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543874;
      v14 = v10;
      v15 = 2114;
      v16 = v12;
      v17 = 2114;
      v18 = v7;
      _os_log_impl(&dword_211102000, v9, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Payment sheet will finish with error: %{public}@", (uint8_t *)&v13, 0x20u);

    }
  }
  objc_msgSend(v6, "setPrivateDelegate:", 0);
  -[AMSUIParentalVerificationApplePayTask setPaymentError:](self, "setPaymentError:", v7);

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
  -[AMSUIParentalVerificationApplePayTask metrics](self, "metrics");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "enqueueEventWithPageId:displayReason:", CFSTR("ParentalVerificationApplePay"), 0);

  -[AMSUIParentalVerificationApplePayTask bag](self, "bag");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "URLForKey:", CFSTR("verifyPaymentApplePayCardOnDevice"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "valuePromise");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __70__AMSUIParentalVerificationApplePayTask__promiseToLoadPVTURLWithBody___block_invoke;
  v12[3] = &unk_24CB50390;
  v12[4] = self;
  v13 = v4;
  v9 = v4;
  objc_msgSend(v8, "thenWithBlock:", v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

uint64_t __70__AMSUIParentalVerificationApplePayTask__promiseToLoadPVTURLWithBody___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_promiseToFetchPaymentCardTokenURL:requestBody:", a2, *(_QWORD *)(a1 + 40));
}

- (id)_promiseToFetchPaymentCardTokenURL:(id)a3 requestBody:(id)a4
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
  -[AMSUIParentalVerificationApplePayTask account](self, "account");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSUIParentalVerificationApplePayTask accountParameters](self, "accountParameters");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSUIParentalVerificationApplePayTask bag](self, "bag");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSUIPaymentVerificationProtocolHandler _promiseToFetchURLResponseForAccount:accountParameters:url:bag:requestBody:bodyEncoding:contentType:](AMSUIPaymentVerificationProtocolHandler, "_promiseToFetchURLResponseForAccount:accountParameters:url:bag:requestBody:bodyEncoding:contentType:", v8, v9, v7, v10, v6, 1, CFSTR("application/json"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __88__AMSUIParentalVerificationApplePayTask__promiseToFetchPaymentCardTokenURL_requestBody___block_invoke;
  v14[3] = &unk_24CB503B8;
  v14[4] = self;
  objc_msgSend(v11, "continueWithBlock:", v14);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

id __88__AMSUIParentalVerificationApplePayTask__promiseToFetchPaymentCardTokenURL_requestBody___block_invoke(uint64_t a1, void *a2, void *a3)
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
    objc_msgSend(v7, "setDisplayReason:", CFSTR("Wallet pay data fetch failed"));

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
      _os_log_impl(&dword_211102000, v9, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Fetch PVT for Wallet pay failed: %{public}@", (uint8_t *)&v28, 0x20u);

    }
    objc_msgSend(*(id *)(a1 + 32), "bag");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "viewController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "metrics");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[AMSUIParentalVerificationCommon _promiseToPromptAfterFailureWithBag:viewController:metrics:pageID:flowName:](AMSUIParentalVerificationCommon, "_promiseToPromptAfterFailureWithBag:viewController:metrics:pageID:flowName:", v12, v13, v14, CFSTR("ContinueNoWalletPay"), CFSTR("Wallet pay"));
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
      objc_msgSend(v17, "enqueueEventWithPageId:displayReason:", CFSTR("ParentVerified"), CFSTR("WalletPay"));

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
      _os_log_impl(&dword_211102000, v21, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Fetch PVT for Wallet pay response had no token: %{public}@", (uint8_t *)&v28, 0x20u);

    }
    objc_msgSend(*(id *)(a1 + 32), "metrics");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setDisplayReason:", CFSTR("Wallet pay data failed"));

    objc_msgSend(*(id *)(a1 + 32), "bag");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "viewController");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "metrics");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    +[AMSUIParentalVerificationCommon _promiseToPromptAfterFailureWithBag:viewController:metrics:pageID:flowName:](AMSUIParentalVerificationCommon, "_promiseToPromptAfterFailureWithBag:viewController:metrics:pageID:flowName:", v14, v26, v27, CFSTR("ContinueNoWalletPay"), CFSTR("Wallet pay"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
LABEL_10:

  return v15;
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

- (AMSBiometricsSignatureRequest)biometricsRequest
{
  return self->_biometricsRequest;
}

- (void)setBiometricsRequest:(id)a3
{
  objc_storeStrong((id *)&self->_biometricsRequest, a3);
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

- (AMSUIParentalVerificationApplePayTask)strongSelf
{
  return self->_strongSelf;
}

- (void)setStrongSelf:(id)a3
{
  objc_storeStrong((id *)&self->_strongSelf, a3);
}

- (AMSPromise)resultPromise
{
  return self->_resultPromise;
}

- (void)setResultPromise:(id)a3
{
  objc_storeStrong((id *)&self->_resultPromise, a3);
}

- (AMSMutablePromise)delegatePromise
{
  return self->_delegatePromise;
}

- (void)setDelegatePromise:(id)a3
{
  objc_storeStrong((id *)&self->_delegatePromise, a3);
}

- (NSData)paymentData
{
  return self->_paymentData;
}

- (void)setPaymentData:(id)a3
{
  objc_storeStrong((id *)&self->_paymentData, a3);
}

- (NSError)paymentError
{
  return self->_paymentError;
}

- (void)setPaymentError:(id)a3
{
  objc_storeStrong((id *)&self->_paymentError, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_paymentError, 0);
  objc_storeStrong((id *)&self->_paymentData, 0);
  objc_storeStrong((id *)&self->_delegatePromise, 0);
  objc_storeStrong((id *)&self->_resultPromise, 0);
  objc_storeStrong((id *)&self->_strongSelf, 0);
  objc_storeStrong((id *)&self->_viewController, 0);
  objc_storeStrong((id *)&self->_originalAccount, 0);
  objc_storeStrong((id *)&self->_metrics, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_biometricsRequest, 0);
  objc_storeStrong((id *)&self->_bag, 0);
  objc_storeStrong((id *)&self->_accountParameters, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end
