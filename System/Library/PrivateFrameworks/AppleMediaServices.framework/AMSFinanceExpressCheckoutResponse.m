@implementation AMSFinanceExpressCheckoutResponse

- (AMSFinanceExpressCheckoutResponse)initWithResponseDictionary:(id)a3 taskInfo:(id)a4
{
  id v6;
  id v7;
  AMSFinanceExpressCheckoutResponse *v8;
  AMSFinanceExpressCheckoutResponse *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  AMSBuyParams *buyParams;
  void *v16;
  void *v17;
  void *v18;
  AMSURLSession *v19;
  AMSURLSession *session;
  uint64_t v21;
  AMSURLRequestProperties *parentProperties;
  objc_super v24;

  v6 = a3;
  v7 = a4;
  v24.receiver = self;
  v24.super_class = (Class)AMSFinanceExpressCheckoutResponse;
  v8 = -[AMSFinancePaymentSheetResponse initWithResponseDictionary:confirmationOnly:delegateAuthenticationRequired:biometricSignatureRequired:taskInfo:](&v24, sel_initWithResponseDictionary_confirmationOnly_delegateAuthenticationRequired_biometricSignatureRequired_taskInfo_, v6, 0, 0, 1, v7);
  v9 = v8;
  if (v8)
  {
    v10 = -[AMSFinanceExpressCheckoutResponse _expressCheckoutModeFromPayload:](v8, "_expressCheckoutModeFromPayload:", v6);
    v9->_expressCheckoutMode = v10;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "properties");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "purchaseInfo");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setExpressCheckoutMode:", v11);

    -[AMSFinanceExpressCheckoutResponse _buyParamFromPayload:](v9, "_buyParamFromPayload:", v6);
    v14 = objc_claimAutoreleasedReturnValue();
    buyParams = v9->_buyParams;
    v9->_buyParams = (AMSBuyParams *)v14;

    v16 = (void *)MEMORY[0x1E0C92CA0];
    +[AMSProcessInfo currentProcess](AMSProcessInfo, "currentProcess");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "ams_configurationWithProcessInfo:bag:", v17, 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = -[AMSURLSession initWithConfiguration:delegate:delegateQueue:]([AMSURLSession alloc], "initWithConfiguration:delegate:delegateQueue:", v18, v9, 0);
    session = v9->_session;
    v9->_session = v19;

    objc_msgSend(v7, "properties");
    v21 = objc_claimAutoreleasedReturnValue();
    parentProperties = v9->_parentProperties;
    v9->_parentProperties = (AMSURLRequestProperties *)v21;

  }
  return v9;
}

- (id)performWithTaskInfo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  void *v29;
  void *v30;
  NSObject *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  NSObject *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  NSObject *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  const char *v49;
  void *v50;
  NSObject *v51;
  void *v52;
  uint64_t v53;
  void *v54;
  void *v55;
  uint64_t v56;
  void *v57;
  void *v58;
  NSObject *v59;
  void *v60;
  uint64_t v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v68;
  void *v69;
  NSObject *v70;
  void *v71;
  uint64_t v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  id v78;
  void *v79;
  void *v80;
  void *v81;
  objc_super v82;
  id v83;
  _QWORD v84[5];
  _QWORD v85[5];
  _QWORD v86[5];
  _QWORD v87[5];
  uint8_t buf[4];
  uint64_t v89;
  __int16 v90;
  void *v91;
  __int16 v92;
  uint64_t v93;
  _QWORD v94[5];

  v94[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[AMSFinanceExpressCheckoutResponse parentProperties](self, "parentProperties");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bag");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[AMSFinanceExpressCheckoutResponse parentProperties](self, "parentProperties");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "account");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "stringForKey:", 0x1E254C9C0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "valuePromise");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "stringForKey:", 0x1E254C520);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "valuePromise");
  v12 = objc_claimAutoreleasedReturnValue();

  v94[0] = v10;
  v94[1] = v12;
  v79 = (void *)v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v94, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSPromise promiseWithAll:](AMSPromise, "promiseWithAll:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = MEMORY[0x1E0C809B0];
  v87[0] = MEMORY[0x1E0C809B0];
  v87[1] = 3221225472;
  v87[2] = __57__AMSFinanceExpressCheckoutResponse_performWithTaskInfo___block_invoke;
  v87[3] = &unk_1E253D638;
  v87[4] = self;
  v80 = v14;
  objc_msgSend(v14, "thenWithBlock:", v87);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v86[0] = v15;
  v86[1] = 3221225472;
  v86[2] = __57__AMSFinanceExpressCheckoutResponse_performWithTaskInfo___block_invoke_2;
  v86[3] = &unk_1E253D750;
  v86[4] = self;
  objc_msgSend(v16, "thenWithBlock:", v86);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v85[0] = v15;
  v85[1] = 3221225472;
  v85[2] = __57__AMSFinanceExpressCheckoutResponse_performWithTaskInfo___block_invoke_3;
  v85[3] = &unk_1E2541F60;
  v85[4] = self;
  objc_msgSend(v17, "thenWithBlock:", v85);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v84[0] = v15;
  v84[1] = 3221225472;
  v84[2] = __57__AMSFinanceExpressCheckoutResponse_performWithTaskInfo___block_invoke_4;
  v84[3] = &unk_1E2541F88;
  v84[4] = self;
  objc_msgSend(v18, "thenWithBlock:", v84);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v83 = 0;
  objc_msgSend(v19, "resultWithError:", &v83);
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v83;
  v21 = v20;
  v78 = v4;
  if (v20)
  {
    v75 = v10;
    v76 = v6;
    v22 = v8;
    objc_msgSend(v20, "userInfo");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("AMSEngagementPresented"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v21, "userInfo");
      v25 = v19;
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("AMSEngagementPresented"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v27, "BOOLValue");

      v19 = v25;
      v29 = v21;
      if (v28 && objc_msgSend(v21, "code") == 6)
      {
        +[AMSLogConfig sharedPurchaseConfig](AMSLogConfig, "sharedPurchaseConfig");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v30)
        {
          +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v30, "OSLogObject");
        v31 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        {
          v32 = objc_opt_class();
          AMSLogKey();
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v89 = v32;
          v19 = v25;
          v90 = 2114;
          v91 = v33;
          v92 = 2114;
          v93 = (uint64_t)v21;
          _os_log_impl(&dword_18C849000, v31, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Express Checkout cancelled with: %{public}@", buf, 0x20u);

        }
        +[AMSURLAction actionWithError:](AMSURLAction, "actionWithError:", v21);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = v22;
        v10 = v75;
        v6 = v76;
        goto LABEL_40;
      }
    }
    else
    {

      v29 = v21;
    }
    +[AMSLogConfig sharedPurchaseConfig](AMSLogConfig, "sharedPurchaseConfig");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v50)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v50, "OSLogObject");
    v51 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
    {
      v52 = v19;
      v53 = objc_opt_class();
      AMSLogKey();
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v89 = v53;
      v19 = v52;
      v90 = 2114;
      v91 = v54;
      v92 = 2114;
      v93 = (uint64_t)v29;
      _os_log_impl(&dword_18C849000, v51, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Express Checkout failed and fallback to regular buy flow, error: %{public}@", buf, 0x20u);

    }
    -[AMSFinanceExpressCheckoutResponse removeExpressCheckoutSession](self, "removeExpressCheckoutSession");
    v8 = v22;
    v10 = v75;
    v6 = v76;
  }
  else
  {
    v35 = objc_msgSend(v81, "expressCheckoutPath");
    +[AMSLogConfig sharedPurchaseConfig](AMSLogConfig, "sharedPurchaseConfig");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v36)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v36, "OSLogObject");
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      v38 = v19;
      v39 = objc_opt_class();
      AMSLogKey();
      v77 = v6;
      v40 = v10;
      v41 = v8;
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v89 = v39;
      v19 = v38;
      v90 = 2114;
      v91 = v42;
      v92 = 2048;
      v93 = v35;
      _os_log_impl(&dword_18C849000, v37, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Express Checkout successful with path: %ld", buf, 0x20u);

      v8 = v41;
      v10 = v40;
      v6 = v77;
    }

    v29 = 0;
    switch(v35)
    {
      case 0:
        +[AMSLogConfig sharedPurchaseConfig](AMSLogConfig, "sharedPurchaseConfig");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v43)
        {
          +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v43, "OSLogObject");
        v44 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
          goto LABEL_30;
        v45 = v19;
        v46 = objc_opt_class();
        AMSLogKey();
        v47 = v8;
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v89 = v46;
        v19 = v45;
        v29 = 0;
        v90 = 2114;
        v91 = v48;
        v49 = "%{public}@: [%{public}@] Express checkout finished with ineligible path, remove merchantSession";
        break;
      case 1:
        +[AMSLogConfig sharedPurchaseConfig](AMSLogConfig, "sharedPurchaseConfig");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v43)
        {
          +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v43, "OSLogObject");
        v44 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
          goto LABEL_30;
        v55 = v19;
        v56 = objc_opt_class();
        AMSLogKey();
        v47 = v8;
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v89 = v56;
        v19 = v55;
        v29 = 0;
        v90 = 2114;
        v91 = v48;
        v49 = "%{public}@: [%{public}@] Express checkout success with alternative payment, remove merchantSession";
        break;
      case 3:
        objc_msgSend(v81, "expressCheckoutCardSelection");
        v57 = (void *)objc_claimAutoreleasedReturnValue();

        if (v57)
        {
          +[AMSLogConfig sharedPurchaseConfig](AMSLogConfig, "sharedPurchaseConfig");
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v58)
          {
            +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
            v58 = (void *)objc_claimAutoreleasedReturnValue();
          }
          objc_msgSend(v58, "OSLogObject");
          v59 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
          {
            v60 = v19;
            v61 = objc_opt_class();
            AMSLogKey();
            v62 = v8;
            v63 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v89 = v61;
            v19 = v60;
            v29 = 0;
            v90 = 2114;
            v91 = v63;
            _os_log_impl(&dword_18C849000, v59, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Card selection received and configured", buf, 0x16u);

            v8 = v62;
          }

          objc_msgSend(v81, "expressCheckoutCardSelection");
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          -[AMSFinancePaymentSheetResponse paymentSheetRequest](self, "paymentSheetRequest");
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v65, "setSelectedCard:", v64);

        }
        goto LABEL_37;
      case 4:
        AMSError(2, CFSTR("Express Checkout Closed"), CFSTR("User closed express checkout"), 0);
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        +[AMSLogConfig sharedPurchaseConfig](AMSLogConfig, "sharedPurchaseConfig");
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v69)
        {
          +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
          v69 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v69, "OSLogObject");
        v70 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
        {
          v71 = v19;
          v72 = objc_opt_class();
          AMSLogKey();
          v73 = v8;
          v74 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v89 = v72;
          v19 = v71;
          v29 = 0;
          v90 = 2114;
          v91 = v74;
          v92 = 2114;
          v93 = 0;
          _os_log_impl(&dword_18C849000, v70, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Express Checkout Closed with: %{public}@", buf, 0x20u);

          v8 = v73;
        }

        +[AMSURLAction actionWithError:](AMSURLAction, "actionWithError:", v68);
        v34 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_40;
      default:
        goto LABEL_37;
    }
    _os_log_impl(&dword_18C849000, v44, OS_LOG_TYPE_DEFAULT, v49, buf, 0x16u);

    v8 = v47;
LABEL_30:

    -[AMSFinanceExpressCheckoutResponse removeExpressCheckoutSession](self, "removeExpressCheckoutSession");
  }
LABEL_37:
  if (-[AMSFinanceExpressCheckoutResponse expressCheckoutMode](self, "expressCheckoutMode") == 1)
  {
    -[AMSFinancePaymentSheetResponse paymentSheetRequest](self, "paymentSheetRequest");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "setApplePayClassic:", 1);

  }
  v82.receiver = self;
  v82.super_class = (Class)AMSFinanceExpressCheckoutResponse;
  v4 = v78;
  -[AMSFinancePaymentSheetResponse performWithTaskInfo:](&v82, sel_performWithTaskInfo_, v78);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_40:

  return v34;
}

id __57__AMSFinanceExpressCheckoutResponse_performWithTaskInfo___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lastObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "_fetchCardDataForMerchantIdentifier:countryCode:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __57__AMSFinanceExpressCheckoutResponse_performWithTaskInfo___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_paymentChoicesForCardData:", a2);
}

uint64_t __57__AMSFinanceExpressCheckoutResponse_performWithTaskInfo___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_presentEngagementForPaymentChoices:", a2);
}

uint64_t __57__AMSFinanceExpressCheckoutResponse_performWithTaskInfo___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_recordUserChoiceForEngagementResult:", a2);
}

- (id)_fetchCardDataForMerchantIdentifier:(id)a3 countryCode:(id)a4
{
  id v6;
  id v7;
  AMSCardRegistrationTask *v8;
  void *v9;
  void *v10;
  _QWORD v12[5];

  v6 = a4;
  v7 = a3;
  v8 = -[AMSCardRegistrationTask initWithCountryCode:merchantIdentifier:]([AMSCardRegistrationTask alloc], "initWithCountryCode:merchantIdentifier:", v6, v7);

  -[AMSTask setRunMode:](v8, "setRunMode:", 1);
  -[AMSCardRegistrationTask performCardRegistration](v8, "performCardRegistration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __85__AMSFinanceExpressCheckoutResponse__fetchCardDataForMerchantIdentifier_countryCode___block_invoke;
  v12[3] = &unk_1E2541FB0;
  v12[4] = self;
  objc_msgSend(v9, "thenWithBlock:", v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

id __85__AMSFinanceExpressCheckoutResponse__fetchCardDataForMerchantIdentifier_countryCode___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  int v11;
  uint64_t v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "cardData");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "base64EncodedStringWithOptions:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    +[AMSLogConfig sharedPurchaseConfig](AMSLogConfig, "sharedPurchaseConfig");
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
      v8 = objc_opt_class();
      AMSLogKey();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543618;
      v12 = v8;
      v13 = 2114;
      v14 = v9;
      _os_log_impl(&dword_18C849000, v7, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Card data fetch failed during Express Checkout, continuing with regular buy", (uint8_t *)&v11, 0x16u);

    }
    +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", &stru_1E2548760);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

- (id)_paymentChoicesForCardData:(id)a3
{
  id v4;
  AMSExpressCheckoutPaymentChoices *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    -[AMSFinanceExpressCheckoutResponse _paymentChoicesRequestForCardData:](self, "_paymentChoicesRequestForCardData:", v4);
    v5 = (AMSExpressCheckoutPaymentChoices *)objc_claimAutoreleasedReturnValue();
    -[AMSFinanceExpressCheckoutResponse session](self, "session");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dataTaskPromiseWithRequestPromise:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "thenWithBlock:", &__block_literal_global_58);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = objc_alloc_init(AMSExpressCheckoutPaymentChoices);
    +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

id __64__AMSFinanceExpressCheckoutResponse__paymentChoicesForCardData___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "object");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_paymentChoicesRequestForCardData:(id)a3
{
  id v4;
  AMSURLRequestEncoder *v5;
  void *v6;
  void *v7;
  AMSURLRequestEncoder *v8;
  void *v9;
  void *v10;
  AMSCodableResponseDecoder *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  AMSURLRequestEncoder *v18;
  void *v19;
  _QWORD v21[5];
  AMSURLRequestEncoder *v22;
  id v23;

  v4 = a3;
  v5 = [AMSURLRequestEncoder alloc];
  -[AMSFinanceExpressCheckoutResponse parentProperties](self, "parentProperties");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bag");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[AMSURLRequestEncoder initWithBag:](v5, "initWithBag:", v7);

  -[AMSURLRequestEncoder setRequestEncoding:](v8, "setRequestEncoding:", 3);
  -[AMSFinanceExpressCheckoutResponse parentProperties](self, "parentProperties");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "account");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSURLRequestEncoder setAccount:](v8, "setAccount:", v10);

  v11 = -[AMSCodableResponseDecoder initWithRootClass:]([AMSCodableResponseDecoder alloc], "initWithRootClass:", objc_opt_class());
  -[AMSURLRequestEncoder setResponseDecoder:](v8, "setResponseDecoder:", v11);

  -[AMSFinanceExpressCheckoutResponse _paymentChoicesBodyForCardData:](self, "_paymentChoicesBodyForCardData:", v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[AMSFinanceExpressCheckoutResponse parentProperties](self, "parentProperties");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "bag");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "BOOLForKey:", 0x1E254C940);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "valuePromise");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __71__AMSFinanceExpressCheckoutResponse__paymentChoicesRequestForCardData___block_invoke;
  v21[3] = &unk_1E2541FD8;
  v21[4] = self;
  v22 = v8;
  v23 = v12;
  v17 = v12;
  v18 = v8;
  objc_msgSend(v16, "continueWithBlock:", v21);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

id __71__AMSFinanceExpressCheckoutResponse__paymentChoicesRequestForCardData___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v17;
  uint64_t v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    +[AMSLogConfig sharedPurchaseConfig](AMSLogConfig, "sharedPurchaseConfig");
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
      AMSLogKey();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138543874;
      v18 = v9;
      v19 = 2114;
      v20 = v10;
      v21 = 2114;
      v22 = v6;

    }
  }
  if (objc_msgSend(v5, "BOOLValue"))
    v11 = 4;
  else
    v11 = 2;
  objc_msgSend(*(id *)(a1 + 32), "parentProperties");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "bag");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "URLForKey:", 0x1E254C920);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "requestWithMethod:bagURL:parameters:", v11, v14, *(_QWORD *)(a1 + 48));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)_paymentChoicesBodyForCardData:(id)a3
{
  id v4;
  void *v5;
  AMSBuyParams *buyParams;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  unint64_t v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v20;
  uint8_t buf[4];
  uint64_t v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  buyParams = self->_buyParams;
  if (buyParams)
  {
    -[AMSBuyParams dictionary](buyParams, "dictionary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[AMSFinanceExpressCheckoutResponse parentProperties](self, "parentProperties");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "purchaseInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "buyParams");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dictionary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v20 = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v7, 0, &v20);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v20;
  v13 = 0x1E0CB3000uLL;
  if (v12)
  {
    +[AMSLogConfig sharedPurchaseConfig](AMSLogConfig, "sharedPurchaseConfig");
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
      v16 = objc_opt_class();
      AMSLogKey();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v22 = v16;
      v13 = 0x1E0CB3000;
      v23 = 2114;
      v24 = v17;
      v25 = 2114;
      v26 = v12;
      _os_log_impl(&dword_18C849000, v15, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to encode buyParams. %{public}@", buf, 0x20u);

    }
    goto LABEL_12;
  }
  if (v11)
  {
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v11, 4);
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v14, CFSTR("buyParams"));
LABEL_12:

  }
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, CFSTR("cardData"));
  objc_msgSend(*(id *)(v13 + 2368), "stringWithFormat:", CFSTR("%lu"), -[AMSFinanceExpressCheckoutResponse expressCheckoutMode](self, "expressCheckoutMode"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v18, CFSTR("expressCheckoutMode"));

  return v5;
}

- (id)_presentEngagementForPaymentChoices:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  AMSEngagementResult *v9;
  AMSPromise *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  AMSExpressCheckoutModel *v17;
  AMSEngagementRequest *v18;
  void *v19;
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
  NSObject *v30;
  uint64_t v31;
  void *v32;
  int v34;
  uint64_t v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  AMSExpressCheckoutModel *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "isEmpty")
    && -[AMSFinanceExpressCheckoutResponse expressCheckoutMode](self, "expressCheckoutMode") == 2)
  {
    +[AMSLogConfig sharedPurchaseConfig](AMSLogConfig, "sharedPurchaseConfig");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v5, "OSLogObject");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = objc_opt_class();
      AMSLogKey();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = 138543618;
      v35 = v7;
      v36 = 2114;
      v37 = v8;
      _os_log_impl(&dword_18C849000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Payment choices is empty & expressCheckout mode is AURUM, so marking the Express Checkout path as ineligible", (uint8_t *)&v34, 0x16u);

    }
    v9 = -[AMSEngagementResult initWithPath:]([AMSEngagementResult alloc], "initWithPath:", 0);
    +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", v9);
    v10 = (AMSPromise *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[AMSLogConfig sharedPurchaseConfig](AMSLogConfig, "sharedPurchaseConfig");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v11)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v11, "OSLogObject");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = objc_opt_class();
      AMSLogKey();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = 138543618;
      v35 = v13;
      v36 = 2114;
      v37 = v14;
      _os_log_impl(&dword_18C849000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Attempting Express Checkout engagement", (uint8_t *)&v34, 0x16u);

    }
    -[AMSFinanceExpressCheckoutResponse parentProperties](self, "parentProperties");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "purchaseInfo");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "delegate");
    v9 = (AMSEngagementResult *)objc_claimAutoreleasedReturnValue();

    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v17 = -[AMSExpressCheckoutModel initWithMode:paymentChoices:]([AMSExpressCheckoutModel alloc], "initWithMode:paymentChoices:", -[AMSFinanceExpressCheckoutResponse expressCheckoutMode](self, "expressCheckoutMode"), v4);
      v18 = -[AMSEngagementRequest initWithModel:destinationStyle:]([AMSEngagementRequest alloc], "initWithModel:destinationStyle:", v17, 3);
      -[AMSFinanceExpressCheckoutResponse parentProperties](self, "parentProperties");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "account");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[AMSEngagementRequest setAccount:](v18, "setAccount:", v20);

      AMSLogKey();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[AMSEngagementRequest setLogKey:](v18, "setLogKey:", v21);

      -[AMSEngagementRequest setFailOnDismiss:](v18, "setFailOnDismiss:", 1);
      objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("https://amsui.apple.com/dynamic/marketing#route=expressCheckout"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[AMSEngagementRequest setURL:](v18, "setURL:", v22);

      -[AMSFinanceExpressCheckoutResponse _createPageEventForPaymentChoices:](self, "_createPageEventForPaymentChoices:", v4);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[AMSEngagementRequest setMetricsOverlay:](v18, "setMetricsOverlay:", v23);

      -[AMSFinanceExpressCheckoutResponse _createClientDataForPaymentChoices:](self, "_createClientDataForPaymentChoices:", v4);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[AMSEngagementRequest setClientData:](v18, "setClientData:", v24);

      v10 = objc_alloc_init(AMSPromise);
      -[AMSFinanceExpressCheckoutResponse parentProperties](self, "parentProperties");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "purchaseInfo");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "purchase");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[AMSPromise completionHandlerAdapter](v10, "completionHandlerAdapter");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[AMSEngagementResult purchase:handleEngagementRequest:completion:](v9, "purchase:handleEngagementRequest:completion:", v27, v18, v28);

    }
    else
    {
      AMSError(2, CFSTR("Finance Engagement Error"), CFSTR("No delegate to present the engagement"), 0);
      v17 = (AMSExpressCheckoutModel *)objc_claimAutoreleasedReturnValue();
      +[AMSLogConfig sharedPurchaseConfig](AMSLogConfig, "sharedPurchaseConfig");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v29)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v29, "OSLogObject");
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        v31 = objc_opt_class();
        AMSLogKey();
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = 138543874;
        v35 = v31;
        v36 = 2114;
        v37 = v32;
        v38 = 2114;
        v39 = v17;
        _os_log_impl(&dword_18C849000, v30, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to present engagement (no delegate). %{public}@", (uint8_t *)&v34, 0x20u);

      }
      +[AMSPromise promiseWithError:](AMSPromise, "promiseWithError:", v17);
      v10 = (AMSPromise *)objc_claimAutoreleasedReturnValue();
    }

  }
  return v10;
}

- (id)_recordUserChoiceForEngagementResult:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BOOL v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  _QWORD v19[5];
  id v20;
  _QWORD v21[5];
  uint8_t buf[4];
  uint64_t v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "expressCheckoutPath") != 4)
  {
    +[AMSLogConfig sharedPurchaseConfig](AMSLogConfig, "sharedPurchaseConfig");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v12)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v12, "OSLogObject");
    v13 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      goto LABEL_13;
    v14 = objc_opt_class();
    AMSLogKey();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v23 = v14;
    v24 = 2114;
    v25 = v15;
    v16 = "%{public}@: [%{public}@] Skipping recording user choice due to ineligibility";
    goto LABEL_12;
  }
  -[AMSFinanceExpressCheckoutResponse parentProperties](self, "parentProperties");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bag");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = +[AMSFinanceExpressCheckoutResponse _isExpressCheckoutRecordUserChoiceEnabledForBag:](AMSFinanceExpressCheckoutResponse, "_isExpressCheckoutRecordUserChoiceEnabledForBag:", v6);

  if (!v7)
  {
    +[AMSLogConfig sharedPurchaseConfig](AMSLogConfig, "sharedPurchaseConfig");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v12)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v12, "OSLogObject");
    v13 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      goto LABEL_13;
    v17 = objc_opt_class();
    AMSLogKey();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v23 = v17;
    v24 = 2114;
    v25 = v15;
    v16 = "%{public}@: [%{public}@] Skipping recording user choice due to not enabled by bag key";
LABEL_12:
    _os_log_impl(&dword_18C849000, v13, OS_LOG_TYPE_DEFAULT, v16, buf, 0x16u);

LABEL_13:
    +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", v4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_14;
  }
  -[AMSFinanceExpressCheckoutResponse _recordUserChoiceRequest](self, "_recordUserChoiceRequest");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __74__AMSFinanceExpressCheckoutResponse__recordUserChoiceForEngagementResult___block_invoke;
  v21[3] = &unk_1E253DB08;
  v21[4] = self;
  objc_msgSend(v8, "thenWithBlock:", v21);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v9;
  v19[1] = 3221225472;
  v19[2] = __74__AMSFinanceExpressCheckoutResponse__recordUserChoiceForEngagementResult___block_invoke_54;
  v19[3] = &unk_1E2542000;
  v19[4] = self;
  v20 = v4;
  objc_msgSend(v10, "continueWithBlock:", v19);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_14:
  return v11;
}

id __74__AMSFinanceExpressCheckoutResponse__recordUserChoiceForEngagementResult___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  int v11;
  uint64_t v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  +[AMSLogConfig sharedPurchaseConfig](AMSLogConfig, "sharedPurchaseConfig");
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
    v6 = objc_opt_class();
    AMSLogKey();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543618;
    v12 = v6;
    v13 = 2114;
    v14 = v7;
    _os_log_impl(&dword_18C849000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Performing network request for recording user choice", (uint8_t *)&v11, 0x16u);

  }
  objc_msgSend(*(id *)(a1 + 32), "session");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dataTaskPromiseWithRequest:", v3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

id __74__AMSFinanceExpressCheckoutResponse__recordUserChoiceForEngagementResult___block_invoke_54(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  int v11;
  uint64_t v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    +[AMSLogConfig sharedPurchaseConfig](AMSLogConfig, "sharedPurchaseConfig");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v5, "OSLogObject");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = objc_opt_class();
      AMSLogKey();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543874;
      v12 = v7;
      v13 = 2114;
      v14 = v8;
      v15 = 2114;
      v16 = v4;
      _os_log_impl(&dword_18C849000, v6, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to perform network request for recording user choice with error:%{public}@", (uint8_t *)&v11, 0x20u);

    }
  }
  +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", *(_QWORD *)(a1 + 40));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_recordUserChoiceRequest
{
  AMSURLRequestEncoder *v3;
  void *v4;
  void *v5;
  AMSURLRequestEncoder *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v3 = [AMSURLRequestEncoder alloc];
  -[AMSFinanceExpressCheckoutResponse parentProperties](self, "parentProperties");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bag");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[AMSURLRequestEncoder initWithBag:](v3, "initWithBag:", v5);

  -[AMSFinanceExpressCheckoutResponse parentProperties](self, "parentProperties");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "account");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSURLRequestEncoder setAccount:](v6, "setAccount:", v8);

  -[AMSFinanceExpressCheckoutResponse parentProperties](self, "parentProperties");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bag");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "URLForKey:", 0x1E254C9A0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[AMSURLRequestEncoder requestWithMethod:bagURL:parameters:](v6, "requestWithMethod:bagURL:parameters:", 2, v11, &unk_1E25B0258);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "thenWithBlock:", &__block_literal_global_61_1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

id __61__AMSFinanceExpressCheckoutResponse__recordUserChoiceRequest__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;

  v2 = a2;
  objc_msgSend(v2, "setHTTPMethod:", CFSTR("POST"));
  +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_createClientDataForPaymentChoices:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  __CFString *v8;
  __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[AMSFinancePaymentSheetResponse paymentSheetRequest](self, "paymentSheetRequest");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "confirmationTitle");
  v8 = CFSTR("one_time_buy");
  if (v7 == 6)
    v8 = CFSTR("subscription");
  v9 = v8;

  -[AMSFinancePaymentSheetResponse paymentSheetRequest](self, "paymentSheetRequest");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "price");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v11, CFSTR("contentPrice"));

  -[AMSFinancePaymentSheetResponse paymentSheetRequest](self, "paymentSheetRequest");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "currencyCode");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v13, CFSTR("purchaseCurrency"));

  objc_msgSend(v5, "setObject:forKeyedSubscript:", v9, CFSTR("purchaseFrequency"));
  if (-[AMSFinanceExpressCheckoutResponse expressCheckoutMode](self, "expressCheckoutMode") == 2)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v4, "cardsCount"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v14, CFSTR("applePayCardsShown"));

  }
  return v5;
}

- (id)_createPageEventForPaymentChoices:(id)a3
{
  id v4;
  AMSBuyParams *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  BOOL v11;
  void *v12;
  _QWORD *v13;
  _QWORD *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  _QWORD v20[2];
  _QWORD v21[2];
  _QWORD v22[2];
  _QWORD v23[3];

  v23[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = self->_buyParams;
  if (!v5)
  {
    -[AMSFinanceExpressCheckoutResponse parentProperties](self, "parentProperties");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "purchaseInfo");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "buyParams");
    v5 = (AMSBuyParams *)objc_claimAutoreleasedReturnValue();

  }
  -[AMSBuyParams objectForKeyedSubscript:](v5, "objectForKeyedSubscript:", CFSTR("appAdamId"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSBuyParams objectForKeyedSubscript:](v5, "objectForKeyedSubscript:", CFSTR("salableAdamId"));
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (v8)
    v11 = v9 == 0;
  else
    v11 = 1;
  if (!v11)
  {
    v22[0] = CFSTR("parentAdamId");
    v22[1] = CFSTR("adamId");
    v23[0] = v8;
    v23[1] = v9;
    v12 = (void *)MEMORY[0x1E0C99D80];
    v13 = v23;
    v14 = v22;
LABEL_10:
    objc_msgSend(v12, "dictionaryWithObjects:forKeys:count:", v13, v14, 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }
  if (v9)
  {
    v20[0] = CFSTR("parentAdamId");
    v20[1] = CFSTR("adamId");
    v21[0] = v9;
    v21[1] = v9;
    v12 = (void *)MEMORY[0x1E0C99D80];
    v13 = v21;
    v14 = v20;
    goto LABEL_10;
  }
  v15 = (void *)MEMORY[0x1E0C9AA70];
LABEL_11:
  v16 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v16, "setObject:forKeyedSubscript:", CFSTR("finance"), 0x1E25521C0);
  objc_msgSend(v16, "setObject:forKeyedSubscript:", v15, 0x1E255B840);
  objc_msgSend(v4, "metrics");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    objc_msgSend(v4, "metrics");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addEntriesFromDictionary:", v18);

  }
  return v16;
}

- (void)AMSURLSession:(id)a3 task:(id)a4 handleAuthenticateRequest:(id)a5 completion:(id)a6
{
  void (**v8)(id, _QWORD, void *);
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a5;
  v8 = (void (**)(id, _QWORD, void *))a6;
  -[AMSFinanceExpressCheckoutResponse parentProperties](self, "parentProperties");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "purchaseInfo");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v10, "purchase");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "purchase:handleAuthenticateRequest:completion:", v12, v13, v8);
  }
  else
  {
    AMSError(2, CFSTR("Purchase Authentication Failed"), CFSTR("Purchase delegate not observing callback"), 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v8[2](v8, 0, v12);
  }

}

- (void)AMSURLSession:(id)a3 task:(id)a4 handleDialogRequest:(id)a5 completion:(id)a6
{
  void (**v8)(id, _QWORD, void *);
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a5;
  v8 = (void (**)(id, _QWORD, void *))a6;
  -[AMSFinanceExpressCheckoutResponse parentProperties](self, "parentProperties");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "purchaseInfo");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v10, "purchase");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "purchase:handleDialogRequest:completion:", v12, v13, v8);
  }
  else
  {
    AMSError(2, CFSTR("Purchase Dialog Failed"), CFSTR("Purchase delegate not observing callback"), 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v8[2](v8, 0, v12);
  }

}

- (void)AMSURLSession:(id)a3 task:(id)a4 handleEngagementRequest:(id)a5 completion:(id)a6
{
  void (**v8)(id, _QWORD, void *);
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a5;
  v8 = (void (**)(id, _QWORD, void *))a6;
  -[AMSFinanceExpressCheckoutResponse parentProperties](self, "parentProperties");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "purchaseInfo");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v10, "purchase");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "purchase:handleEngagementRequest:completion:", v12, v13, v8);
  }
  else
  {
    AMSError(2, CFSTR("Purchase Engagement Failed"), CFSTR("Purchase delegate not observing callback"), 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v8[2](v8, 0, v12);
  }

}

- (int64_t)_expressCheckoutModeFromPayload:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  int64_t v7;

  objc_msgSend(a3, "valueForKey:", 0x1E2555AC0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;

  objc_msgSend(v4, "valueForKey:", CFSTR("expressCheckoutMode"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;

  v7 = objc_msgSend(v6, "integerValue");
  return v7;
}

- (id)_buyParamFromPayload:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  AMSBuyParams *v9;

  objc_msgSend(a3, "valueForKey:", 0x1E2555AC0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;

  objc_msgSend(v4, "valueForKey:", CFSTR("touchIDButtonAction"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;

  objc_msgSend(v6, "valueForKey:", CFSTR("buyParams"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    v8 = 0;
    goto LABEL_11;
  }
  v8 = v7;

  if (!v8)
  {
LABEL_11:
    v9 = 0;
    goto LABEL_12;
  }
  v9 = -[AMSBuyParams initWithString:]([AMSBuyParams alloc], "initWithString:", v8);
LABEL_12:

  return v9;
}

- (void)removeExpressCheckoutSession
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  -[AMSFinancePaymentSheetResponse paymentSheetRequest](self, "paymentSheetRequest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setMerchantSession:", 0);

  -[AMSFinancePaymentSheetResponse paymentSheetRequest](self, "paymentSheetRequest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setApplePayClassic:", 0);

  -[AMSFinancePaymentSheetResponse paymentSheetRequest](self, "paymentSheetRequest");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "responseDictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSFinancePaymentSheetResponse fallbackTitleFromResponse:](AMSFinancePaymentSheetResponse, "fallbackTitleFromResponse:", v6);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[AMSFinancePaymentSheetResponse paymentSheetRequest](self, "paymentSheetRequest");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setTitle:", v9);

    -[AMSFinancePaymentSheetResponse paymentSheetRequest](self, "paymentSheetRequest");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setTitleType:", 0);

  }
}

+ (BOOL)isEligibleForBag:(id)a3
{
  id v3;
  BOOL v4;

  v3 = a3;
  if (+[AMSCardEnrollment isAURUMWithBag:](AMSCardEnrollment, "isAURUMWithBag:", v3))
    v4 = +[AMSFinanceExpressCheckoutResponse _isExpressCheckoutEnabledForBag:](AMSFinanceExpressCheckoutResponse, "_isExpressCheckoutEnabledForBag:", v3);
  else
    v4 = 0;

  return v4;
}

+ (BOOL)isExpressCheckoutPayload:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "valueForKey:", 0x1E2555AC0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("expressCheckoutMode"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  AMSSetLogKeyIfNeeded();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v7, "OSLogObject");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = (void *)objc_opt_class();
    v10 = (void *)MEMORY[0x1E0CB37E8];
    v11 = v9;
    objc_msgSend(v10, "numberWithBool:", v5 != 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138543874;
    v15 = v9;
    v16 = 2114;
    v17 = v6;
    v18 = 2114;
    v19 = v12;
    _os_log_impl(&dword_18C849000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Express Checkout payload eligibility status: %{public}@", (uint8_t *)&v14, 0x20u);

  }
  return v5 != 0;
}

+ (BOOL)isExpressCheckoutShouldCheckForWalletBiometricsForBag:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  id v21;
  id v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  AMSSetLogKeyIfNeeded();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "BOOLForKey:", 0x1E254C980);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0;
  objc_msgSend(v5, "valueWithError:", &v22);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v22;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v3, "BOOLForKey:", 0x1E254C980);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v7;
    objc_msgSend(v8, "valueWithError:", &v21);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v21;

    v11 = objc_msgSend(v9, "BOOLValue");
    v7 = v10;
  }
  else
  {
    v11 = 0;
  }

  if (v7)
  {
    +[AMSLogConfig sharedPurchaseConfig](AMSLogConfig, "sharedPurchaseConfig");
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
      v14 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      v24 = v14;
      v25 = 2114;
      v26 = v4;
      v27 = 2114;
      v28 = v7;
      v15 = v14;
      _os_log_impl(&dword_18C849000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] No bag key found for shouldCheckForWalletBiometrics, but the flag is default to enabled, if bag key does not exist , error: %{public}@", buf, 0x20u);

    }
    LOBYTE(v11) = 1;
  }
  else
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
      v16 = (void *)objc_opt_class();
      v17 = (void *)MEMORY[0x1E0CB37E8];
      v18 = v16;
      objc_msgSend(v17, "numberWithBool:", v11);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v24 = v16;
      v25 = 2114;
      v26 = v4;
      v27 = 2114;
      v28 = v19;
      _os_log_impl(&dword_18C849000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Express Checkout shouldCheckForWalletBiometrics from the bag: %{public}@", buf, 0x20u);

    }
  }

  return v11;
}

+ (BOOL)_isExpressCheckoutEnabledForBag:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  _BOOL8 v12;
  void *v13;
  NSObject *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  __CFString *v20;
  id v22;
  id v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  __CFString *v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  AMSSetLogKeyIfNeeded();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "BOOLForKey:", 0x1E254C900);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0;
  objc_msgSend(v5, "valueWithError:", &v23);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v23;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v3, "BOOLForKey:", 0x1E254C900);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v7;
    objc_msgSend(v8, "valueWithError:", &v22);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v22;

    v11 = objc_msgSend(v9, "BOOLValue");
    v12 = v11;
    v7 = v10;
  }
  else
  {
    v12 = 0;
  }

  if (v7)
  {
    +[AMSLogConfig sharedPurchaseConfig](AMSLogConfig, "sharedPurchaseConfig");
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
      *(_DWORD *)buf = 138544130;
      v25 = v15;
      v26 = 2114;
      v27 = v4;
      v28 = 2114;
      v29 = CFSTR("applePayExpressCheckoutEnabled");
      v30 = 2114;
      v31 = v7;
      v16 = v15;
      _os_log_impl(&dword_18C849000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] No bag key found: %{public}@, error: %{public}@", buf, 0x2Au);

    }
    LOBYTE(v12) = 0;
  }
  else
  {
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
      v17 = (void *)objc_opt_class();
      v18 = (void *)MEMORY[0x1E0CB37E8];
      v19 = v17;
      objc_msgSend(v18, "numberWithBool:", v12);
      v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v25 = v17;
      v26 = 2114;
      v27 = v4;
      v28 = 2114;
      v29 = v20;
      _os_log_impl(&dword_18C849000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Express Checkout bag enabled status: %{public}@", buf, 0x20u);

    }
  }

  return v12;
}

+ (BOOL)_isExpressCheckoutRecordUserChoiceEnabledForBag:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  __CFString *v19;
  id v21;
  id v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  __CFString *v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  AMSSetLogKeyIfNeeded();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "BOOLForKey:", 0x1E254C960);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0;
  objc_msgSend(v5, "valueWithError:", &v22);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v22;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v3, "BOOLForKey:", 0x1E254C960);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v7;
    objc_msgSend(v8, "valueWithError:", &v21);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v21;

    v11 = objc_msgSend(v9, "BOOLValue");
    v7 = v10;
  }
  else
  {
    v11 = 0;
  }

  if (v7)
  {
    +[AMSLogConfig sharedPurchaseConfig](AMSLogConfig, "sharedPurchaseConfig");
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
      v14 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138544130;
      v24 = v14;
      v25 = 2114;
      v26 = v4;
      v27 = 2114;
      v28 = CFSTR("applePayExpressCheckoutEnabled");
      v29 = 2114;
      v30 = v7;
      v15 = v14;
      _os_log_impl(&dword_18C849000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] No bag key found: %{public}@, error: %{public}@", buf, 0x2Au);

    }
    LOBYTE(v11) = 1;
  }
  else
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
      v16 = (void *)objc_opt_class();
      v17 = (void *)MEMORY[0x1E0CB37E8];
      v18 = v16;
      objc_msgSend(v17, "numberWithBool:", v11);
      v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v24 = v16;
      v25 = 2114;
      v26 = v4;
      v27 = 2114;
      v28 = v19;
      _os_log_impl(&dword_18C849000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Express Checkout Record User Choice bag enabled status: %{public}@", buf, 0x20u);

    }
  }

  return v11;
}

- (int64_t)expressCheckoutMode
{
  return self->_expressCheckoutMode;
}

- (void)setExpressCheckoutMode:(int64_t)a3
{
  self->_expressCheckoutMode = a3;
}

- (AMSURLRequestProperties)parentProperties
{
  return self->_parentProperties;
}

- (void)setParentProperties:(id)a3
{
  objc_storeStrong((id *)&self->_parentProperties, a3);
}

- (AMSURLSession)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
  objc_storeStrong((id *)&self->_session, a3);
}

- (AMSBuyParams)buyParams
{
  return self->_buyParams;
}

- (void)setBuyParams:(id)a3
{
  objc_storeStrong((id *)&self->_buyParams, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buyParams, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_parentProperties, 0);
}

@end
