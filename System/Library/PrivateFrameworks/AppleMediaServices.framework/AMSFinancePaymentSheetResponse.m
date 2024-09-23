@implementation AMSFinancePaymentSheetResponse

- (AMSFinancePaymentSheetResponse)initWithResponseDictionary:(id)a3 confirmationOnly:(BOOL)a4 delegateAuthenticationRequired:(BOOL)a5 biometricSignatureRequired:(BOOL)a6 taskInfo:(id)a7
{
  _BOOL8 v8;
  _BOOL8 v9;
  _BOOL8 v10;
  id v12;
  id v13;
  AMSFinancePaymentSheetResponse *v14;
  AMSFinanceAuthenticateResponse *v15;
  AMSFinanceAuthenticateResponse *authenticateResponse;
  void *v17;
  id v18;
  uint64_t v19;
  AMSPaymentSheetRequest *paymentSheetRequest;
  void *v21;
  NSDictionary *v22;
  NSDictionary *metricsDictionary;
  void *v24;
  void *v25;
  objc_super v27;

  v8 = a6;
  v9 = a5;
  v10 = a4;
  v12 = a3;
  v13 = a7;
  v27.receiver = self;
  v27.super_class = (Class)AMSFinancePaymentSheetResponse;
  v14 = -[AMSFinancePaymentSheetResponse init](&v27, sel_init);
  if (v14)
  {
    v15 = -[AMSFinanceAuthenticateResponse initWithResponseDictionary:taskInfo:]([AMSFinanceAuthenticateResponse alloc], "initWithResponseDictionary:taskInfo:", v12, v13);
    authenticateResponse = v14->_authenticateResponse;
    v14->_authenticateResponse = v15;

    +[AMSFinanceResponse valueForProtocolKey:inResponse:](AMSFinanceResponse, "valueForProtocolKey:inResponse:", CFSTR("dialog"), v12);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v18 = v17;
    else
      v18 = 0;

    objc_msgSend((id)objc_opt_class(), "createRequestFromDictionary:confirmationOnly:delegateAuthenticationRequired:biometricSignatureRequired:authenticateResponse:taskInfo:account:", v18, v10, v9, v8, v14->_authenticateResponse, v13, 0);
    v19 = objc_claimAutoreleasedReturnValue();
    paymentSheetRequest = v14->_paymentSheetRequest;
    v14->_paymentSheetRequest = (AMSPaymentSheetRequest *)v19;

    objc_msgSend(v12, "valueForKey:", CFSTR("metrics"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v22 = 0;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v22 = v21;

    metricsDictionary = v14->_metricsDictionary;
    v14->_metricsDictionary = v22;

    objc_msgSend((id)objc_opt_class(), "_createMerchantSessionFromDictionary:", v12);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (v24)
    {
      -[AMSPaymentSheetRequest setMerchantSession:](v14->_paymentSheetRequest, "setMerchantSession:", v24);
      -[AMSPaymentSheetRequest biometricsRequest](v14->_paymentSheetRequest, "biometricsRequest");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setDualAction:", 1);

    }
  }

  return v14;
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
  int v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  objc_class *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  AMSFinancePaymentSheetResponse *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  char v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  NSObject *v69;
  void *v70;
  uint64_t v71;
  id v72;
  void *v73;
  void *v74;
  uint64_t v75;
  uint64_t v76;
  void *v77;
  AMSFinancePaymentSheetResponse *v79;
  id v80;
  id v81;
  id v82;
  uint8_t buf[4];
  void *v84;
  uint64_t v85;

  v85 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "properties");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "purchaseInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "activePurchaseTask");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    v13 = 0;
LABEL_10:
    objc_msgSend(v4, "properties");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "purchaseInfo");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "activePurchaseTask");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (objc_class *)objc_msgSend(v21, "paymentSheetTaskClass");

    if (!v22)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v23)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v23, "OSLogObject");
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        AMSLogKey();
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = (void *)MEMORY[0x1E0CB3940];
        v27 = self;
        v28 = objc_opt_class();
        v29 = v28;
        if (v25)
        {
          AMSLogKey();
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "stringWithFormat:", CFSTR("%@: [%@] "), v29, v21);
        }
        else
        {
          objc_msgSend(v26, "stringWithFormat:", CFSTR("%@: "), v28);
        }
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v84 = v30;
        _os_log_impl(&dword_18C849000, v24, OS_LOG_TYPE_DEFAULT, "%{public}@Could not determine payment sheet task class, using default", buf, 0xCu);
        self = v27;
        if (v25)
        {

          v30 = v21;
        }

      }
      v22 = (objc_class *)objc_opt_class();
    }
    v32 = [v22 alloc];
    -[AMSFinancePaymentSheetResponse paymentSheetRequest](self, "paymentSheetRequest");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "properties");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "bag");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = (void *)objc_msgSend(v32, "initWithRequest:bag:", v33, v35);

    -[AMSFinancePaymentSheetResponse metricsDictionary](self, "metricsDictionary");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSFinancePaymentSheetResponse _enrichedMetricsDictionaryWithFinanceDictionary:](self, "_enrichedMetricsDictionaryWithFinanceDictionary:", v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setMetricsDictionary:", v38);

    objc_msgSend(v4, "session");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "delegate");
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v40, "presentingSceneIdentifier");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "setPresentingSceneIdentifier:", v41);

    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v40, "presentingSceneBundleIdentifier");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "setPresentingSceneBundleIdentifier:", v42);

    }
    objc_msgSend(v4, "properties");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "purchaseInfo");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setPurchaseInfo:", v44);

    objc_msgSend(v36, "setRunMode:", 1);
    objc_msgSend(v36, "perform");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v81 = v13;
    objc_msgSend(v45, "resultWithError:", &v81);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = v81;

    v13 = v46;
    if (v46)
      goto LABEL_4;
    goto LABEL_31;
  }
  objc_msgSend(v4, "properties");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "purchaseInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "activePurchaseTask");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSFinancePaymentSheetResponse paymentSheetRequest](self, "paymentSheetRequest");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v82 = 0;
  v12 = objc_msgSend(v10, "performPreActionRequestForTaskInfo:requiresAuthorization:error:", v4, objc_msgSend(v11, "requiresAuthorization"), &v82);
  v13 = v82;

  v14 = 0;
  if (v12)
    goto LABEL_10;
  if (v13)
  {
LABEL_4:
    +[AMSURLAction actionWithError:](AMSURLAction, "actionWithError:", v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
LABEL_31:
  objc_msgSend(v14, "passwordEquivalentToken");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    -[AMSFinancePaymentSheetResponse authenticateResponse](self, "authenticateResponse");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      -[AMSFinancePaymentSheetResponse authenticateResponse](self, "authenticateResponse");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "authenticateRequest");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "options");
      v49 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v49, "setCredentialSource:", 2);
      objc_msgSend(v49, "setAllowServerDialogs:", 1);
      objc_msgSend(v49, "setAuthenticationType:", 1);
      objc_msgSend(v49, "setReason:", CFSTR("payment sheet"));
      objc_msgSend(v47, "authenticateRequest");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "account");
      v51 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v14, "passwordEquivalentToken");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "ams_setPassword:", v52);

      objc_msgSend(v47, "performWithTaskInfo:", v4);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "error");
      v13 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v13 = 0;
    }
  }
  else
  {
    v15 = 0;
  }
LABEL_5:
  if (v14)
  {
    -[AMSFinancePaymentSheetResponse paymentSheetRequest](self, "paymentSheetRequest");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v16, "requiresAuthorization"))
    {
      objc_msgSend(v14, "delegateAuthenticateToken");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (v17)
      {
        v18 = 1;
      }
      else
      {
        objc_msgSend(v14, "passwordEquivalentToken");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        if (v31)
        {
          v18 = 1;
        }
        else
        {
          objc_msgSend(v14, "signatureResult");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = v53 != 0;

        }
      }

    }
    else
    {
      v18 = 1;
    }

    if (v13)
      goto LABEL_55;
  }
  else
  {
    v18 = 0;
    if (v13)
      goto LABEL_55;
  }
  if (v15)
  {
    if (objc_msgSend(v15, "actionType"))
      v54 = 0;
    else
      v54 = v18;
    if ((v54 & 1) != 0)
      goto LABEL_45;
  }
  else if ((_DWORD)v18)
  {
LABEL_45:
    v79 = self;
    objc_msgSend(v4, "properties");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "account");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v80 = v4;
    objc_msgSend(v4, "properties");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "keychainOptions");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "signatureResult");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    +[AMSBiometrics headersWithAccount:options:signatureResult:](AMSBiometrics, "headersWithAccount:options:signatureResult:", v56, v58, v59);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = (void *)objc_msgSend(v60, "mutableCopy");

    objc_msgSend(v14, "passwordEquivalentToken");
    v62 = (void *)objc_claimAutoreleasedReturnValue();

    if (v62)
      objc_msgSend(v61, "setObject:forKeyedSubscript:", 0x1E254D740, CFSTR("X-Apple-TID-Action"));
    objc_msgSend(v14, "delegateAuthenticateToken");
    v63 = (void *)objc_claimAutoreleasedReturnValue();

    if (v63)
    {
      objc_msgSend(v14, "delegateAuthenticateToken");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "setObject:forKeyedSubscript:", v64, CFSTR("X-Apple-DelegateAuth-Token"));

      objc_msgSend(v14, "delegateAuthenticateToken");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "setObject:forKeyedSubscript:", v65, CFSTR("X-Apple-Delegate-Auth-Token"));

    }
    -[AMSFinancePaymentSheetResponse authenticateResponse](v79, "authenticateResponse");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSFinancePaymentSheetResponse authenticateResponse](v79, "authenticateResponse");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "dialogResponse");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "_locateActionableButtonUsingDialogResponse:", v68);
    v69 = objc_claimAutoreleasedReturnValue();

    -[NSObject deepLink](v69, "deepLink");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v80;
    if (v70)
    {
      +[AMSURLAction redirectActionWithURL:](AMSURLAction, "redirectActionWithURL:", v70);
      v71 = objc_claimAutoreleasedReturnValue();

      v15 = (void *)v71;
    }
    if (!v15)
    {
      +[AMSURLAction retryAction](AMSURLAction, "retryAction");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v15, "setRetryIdentifier:", 0x1E25642A0);
    objc_msgSend(v15, "setReason:", CFSTR("payment sheet"));
    objc_msgSend(v15, "setUpdatedHeaders:", v61);

    goto LABEL_64;
  }
LABEL_55:
  +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v61)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v61, "OSLogObject");
  v69 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v69, OS_LOG_TYPE_ERROR))
  {
    v72 = v4;
    AMSLogKey();
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    v74 = (void *)MEMORY[0x1E0CB3940];
    v75 = objc_opt_class();
    v76 = v75;
    if (v73)
    {
      AMSLogKey();
      v18 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v74, "stringWithFormat:", CFSTR("%@: [%@] "), v76, v18);
    }
    else
    {
      objc_msgSend(v74, "stringWithFormat:", CFSTR("%@: "), v75);
    }
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v84 = v77;
    _os_log_impl(&dword_18C849000, v69, OS_LOG_TYPE_ERROR, "%{public}@Unable to continue the purchase.", buf, 0xCu);
    v4 = v72;
    if (v73)
    {

      v77 = (void *)v18;
    }

  }
LABEL_64:

  return v15;
}

- (id)_performAuthorizationDialogProxyWithTaskInfo:(id)a3
{
  id v4;
  void *v5;
  AMSPaymentAuthorizationDialogTask *v6;
  void *v7;
  void *v8;
  AMSPaymentAuthorizationDialogTask *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  uint8_t buf[4];
  void *v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[AMSFinancePaymentSheetResponse paymentSheetRequest](self, "paymentSheetRequest");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = [AMSPaymentAuthorizationDialogTask alloc];
  objc_msgSend(v4, "properties");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bag");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[AMSPaymentAuthorizationDialogTask initWithRequest:bag:](v6, "initWithRequest:bag:", v5, v8);

  objc_msgSend(v4, "properties");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "purchaseInfo");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSPaymentAuthorizationDialogTask setPurchaseInfo:](v9, "setPurchaseInfo:", v11);

  -[AMSTask setRunMode:](v9, "setRunMode:", 1);
  -[AMSPaymentAuthorizationDialogTask perform](v9, "perform");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = 0;
  objc_msgSend(v12, "resultWithError:", &v40);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v40;

  if (v14)
  {
    v15 = 0;
LABEL_3:
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v16)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v16, "OSLogObject");
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v37 = v5;
      v38 = v13;
      AMSLogKey();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (void *)MEMORY[0x1E0CB3940];
      v20 = objc_opt_class();
      v21 = v20;
      if (v18)
      {
        AMSLogKey();
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "stringWithFormat:", CFSTR("%@: [%@] "), v21, v13);
      }
      else
      {
        objc_msgSend(v19, "stringWithFormat:", CFSTR("%@: "), v20);
      }
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v42 = v22;
      _os_log_impl(&dword_18C849000, v17, OS_LOG_TYPE_ERROR, "%{public}@Unable to continue the purchase.", buf, 0xCu);
      if (v18)
      {

        v22 = v13;
      }

      v5 = v37;
      v13 = v38;
    }

    goto LABEL_23;
  }
  v39 = v13;
  objc_msgSend(v13, "passwordEquivalentToken");
  v23 = objc_claimAutoreleasedReturnValue();
  if (v23
    && (v24 = (void *)v23,
        -[AMSFinancePaymentSheetResponse authenticateResponse](self, "authenticateResponse"),
        v25 = (void *)objc_claimAutoreleasedReturnValue(),
        v25,
        v24,
        v25))
  {
    -[AMSFinancePaymentSheetResponse authenticateResponse](self, "authenticateResponse");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "authenticateRequest");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "options");
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v28, "setCredentialSource:", 2);
    objc_msgSend(v28, "setAllowServerDialogs:", 1);
    objc_msgSend(v28, "setAuthenticationType:", 1);
    objc_msgSend(v28, "setReason:", CFSTR("payment sheet"));
    objc_msgSend(v26, "authenticateRequest");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "account");
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v39, "passwordEquivalentToken");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "ams_setPassword:", v31);

    objc_msgSend(v26, "performWithTaskInfo:", v4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "error");
    v14 = (id)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
LABEL_11:
      v13 = v39;
      goto LABEL_3;
    }
    if (v15 && objc_msgSend(v15, "actionType"))
    {
      v14 = 0;
      goto LABEL_11;
    }
  }
  else
  {
    v15 = 0;
  }
  -[AMSFinancePaymentSheetResponse authenticateResponse](self, "authenticateResponse");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSFinancePaymentSheetResponse authenticateResponse](self, "authenticateResponse");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "dialogResponse");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "_locateActionableButtonUsingDialogResponse:", v34);
  v14 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "deepLink");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    +[AMSURLAction redirectActionWithURL:](AMSURLAction, "redirectActionWithURL:", v16);
    v35 = objc_claimAutoreleasedReturnValue();

    v15 = (void *)v35;
  }
  if (!v15)
  {
    +[AMSURLAction retryAction](AMSURLAction, "retryAction");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v15, "setRetryIdentifier:", 0x1E25642A0);
  objc_msgSend(v15, "setReason:", CFSTR("payment sheet"));
  v13 = v39;
LABEL_23:

  return v15;
}

+ (id)_createMerchantSessionFromDictionary:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  id v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  NSObject *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "valueForKey:", CFSTR("tid-dialog"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = v3;

    if (v4)
    {
      objc_msgSend(v4, "valueForKey:", CFSTR("applePayPaymentSession"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v6 = v5;

        if (v6)
        {
          v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v6, 0);
          v22 = 0;
          objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v7, 0, &v22);
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v9 = v22;
          if (v9)
          {
            +[AMSLogConfig sharedPurchaseConfig](AMSLogConfig, "sharedPurchaseConfig");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v10)
            {
              +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
              v10 = (void *)objc_claimAutoreleasedReturnValue();
            }
            objc_msgSend(v10, "OSLogObject");
            v11 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
            {
              v12 = (void *)objc_opt_class();
              v13 = v12;
              AMSSetLogKeyIfNeeded();
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543874;
              v24 = v12;
              v25 = 2114;
              v26 = v14;
              v27 = 2114;
              v28 = v9;
              _os_log_impl(&dword_18C849000, v11, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] JSON serialization of payment session failed with error: %{public}@", buf, 0x20u);

            }
          }
LABEL_23:

          goto LABEL_24;
        }
      }
      else
      {

      }
      +[AMSLogConfig sharedPurchaseConfig](AMSLogConfig, "sharedPurchaseConfig");
      v9 = objc_claimAutoreleasedReturnValue();
      if (!v9)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v9 = objc_claimAutoreleasedReturnValue();
      }
      -[NSObject OSLogObject](v9, "OSLogObject");
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v18 = (void *)objc_opt_class();
        v19 = v18;
        AMSSetLogKeyIfNeeded();
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v24 = v18;
        v25 = 2114;
        v26 = v20;
        _os_log_impl(&dword_18C849000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Skipping dual-action buy for no payment session", buf, 0x16u);

      }
      v6 = 0;
      v8 = 0;
      goto LABEL_23;
    }
  }
  else
  {

  }
  +[AMSLogConfig sharedPurchaseConfig](AMSLogConfig, "sharedPurchaseConfig");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v6, "OSLogObject");
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v15 = (void *)objc_opt_class();
    v16 = v15;
    AMSSetLogKeyIfNeeded();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v24 = v15;
    v25 = 2114;
    v26 = v17;
    _os_log_impl(&dword_18C849000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Skipping dual-action buy for no tid-dialog", buf, 0x16u);

  }
  v4 = 0;
  v8 = 0;
LABEL_24:

  return v8;
}

+ (id)_attributedListDictionaryForValues:(id)a3 account:(id)a4
{
  id v6;
  objc_class *v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, void *);
  void *v20;
  id v21;
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;

  v6 = a4;
  v7 = (objc_class *)MEMORY[0x1E0C99DE8];
  v8 = a3;
  v9 = objc_alloc_init(v7);
  v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v11 = MEMORY[0x1E0C809B0];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __77__AMSFinancePaymentSheetResponse__attributedListDictionaryForValues_account___block_invoke;
  v24[3] = &unk_1E2542030;
  v12 = v10;
  v25 = v12;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", v24);

  v17 = v11;
  v18 = 3221225472;
  v19 = __77__AMSFinancePaymentSheetResponse__attributedListDictionaryForValues_account___block_invoke_2;
  v20 = &unk_1E25420A8;
  v23 = a1;
  v21 = v6;
  v13 = v9;
  v22 = v13;
  v14 = v6;
  objc_msgSend(v12, "enumerateObjectsUsingBlock:", &v17);
  if (objc_msgSend(v13, "count", v17, v18, v19, v20))
    v15 = (void *)objc_msgSend(v13, "copy");
  else
    v15 = 0;

  return v15;
}

void __77__AMSFinancePaymentSheetResponse__attributedListDictionaryForValues_account___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("attributedList"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v3;

    v4 = v5;
    if (v5)
    {
      objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);
      v4 = v5;
    }
  }
  else
  {

    v4 = 0;
  }

}

void __77__AMSFinancePaymentSheetResponse__attributedListDictionaryForValues_account___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = v3;

    if (v4)
    {
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __77__AMSFinancePaymentSheetResponse__attributedListDictionaryForValues_account___block_invoke_195;
      v11[3] = &unk_1E2542080;
      v15 = *(_QWORD *)(a1 + 48);
      v5 = v4;
      v12 = v5;
      v13 = *(id *)(a1 + 32);
      v14 = *(id *)(a1 + 40);
      objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v11);

      goto LABEL_10;
    }
  }
  else
  {

  }
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
    AMSSetLogKeyIfNeeded();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v17 = v8;
    v18 = 2114;
    v19 = v10;
    v20 = 2114;
    v21 = v3;
    _os_log_impl(&dword_18C849000, v7, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Unexpected response type: %{public}@", buf, 0x20u);

  }
  v5 = 0;
LABEL_10:

}

void __77__AMSFinancePaymentSheetResponse__attributedListDictionaryForValues_account___block_invoke_195(uint64_t a1, void *a2, void *a3)
{
  objc_class *v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  uint64_t v16;

  v11 = a3;
  v5 = (objc_class *)MEMORY[0x1E0C99E08];
  v6 = a2;
  v7 = objc_alloc_init(v5);
  LODWORD(v5) = objc_msgSend(v6, "isEqualToString:", CFSTR("value"));

  if ((_DWORD)v5)
  {
    v8 = v11;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = v8;

      if (!v9)
      {
LABEL_9:

        goto LABEL_10;
      }
      v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __77__AMSFinancePaymentSheetResponse__attributedListDictionaryForValues_account___block_invoke_2_198;
      v12[3] = &unk_1E2542058;
      v16 = *(_QWORD *)(a1 + 56);
      v13 = *(id *)(a1 + 32);
      v14 = *(id *)(a1 + 40);
      v8 = v10;
      v15 = v8;
      objc_msgSend(v9, "enumerateObjectsUsingBlock:", v12);
      if (objc_msgSend(v8, "count"))
        objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("value"));

    }
    else
    {
      v9 = 0;
    }

    goto LABEL_9;
  }
LABEL_10:
  if (objc_msgSend(v7, "count"))
    objc_msgSend(*(id *)(a1 + 48), "addObject:", v7);

}

void __77__AMSFinancePaymentSheetResponse__attributedListDictionaryForValues_account___block_invoke_2_198(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  int v19;
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = v3;

    if (v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("header"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v7 = v6;

        if (!v7)
          goto LABEL_14;
        v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", v7);
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, CFSTR("header"));
      }
      else
      {
        v7 = 0;
      }

LABEL_14:
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("value"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v15 = v14;

        if (v15)
        {
          objc_msgSend(*(id *)(a1 + 56), "_attributedStringForAttributedDictionary:account:", v15, *(_QWORD *)(a1 + 40));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v16)
            goto LABEL_26;
          goto LABEL_25;
        }
      }
      else
      {

      }
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("value"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v18 = v17;

        if (v18)
        {
          objc_msgSend(*(id *)(a1 + 56), "_attributedStringForAttributedArray:account:", v18, *(_QWORD *)(a1 + 40));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_24;
        }
      }
      else
      {

        v18 = 0;
      }
      v16 = 0;
LABEL_24:

      v15 = 0;
      if (!v16)
      {
LABEL_26:
        objc_msgSend(*(id *)(a1 + 48), "addObject:", v5);

        goto LABEL_27;
      }
LABEL_25:
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v16, CFSTR("value"));
      goto LABEL_26;
    }
  }
  else
  {

  }
  +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
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
    v13 = *(_QWORD *)(a1 + 32);
    v19 = 138543874;
    v20 = v10;
    v21 = 2114;
    v22 = v12;
    v23 = 2114;
    v24 = v13;
    _os_log_impl(&dword_18C849000, v9, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Unexpected inner response type: %{public}@", (uint8_t *)&v19, 0x20u);

  }
  v4 = 0;
LABEL_27:

}

+ (id)_salableInfoDictionaryForValues:(id)a3 styles:(id)a4 account:(id)a5 shouldUppercaseText:(BOOL)a6 designVersion:(id)a7
{
  id v9;
  objc_class *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;

  v9 = a4;
  v10 = (objc_class *)MEMORY[0x1E0C99DE8];
  v11 = a3;
  v12 = objc_alloc_init(v10);
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __115__AMSFinancePaymentSheetResponse__salableInfoDictionaryForValues_styles_account_shouldUppercaseText_designVersion___block_invoke;
  v18[3] = &unk_1E25420A8;
  v13 = v12;
  v20 = v9;
  v21 = a1;
  v19 = v13;
  v14 = v9;
  objc_msgSend(v11, "enumerateObjectsUsingBlock:", v18);

  v15 = v20;
  v16 = v13;

  return v16;
}

void __115__AMSFinancePaymentSheetResponse__salableInfoDictionaryForValues_styles_account_shouldUppercaseText_designVersion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  void (*v30)(uint64_t, void *, void *);
  void *v31;
  id v32;
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  void *v38;
  const __CFString *v39;
  _QWORD v40[2];

  v40[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;

  v5 = v3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    if (!v4)
      goto LABEL_15;
    v6 = 0;
LABEL_12:
    v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", v4);
    objc_msgSend(v7, "setObject:forKey:", v10, CFSTR("value"));

    v11 = *(void **)(a1 + 32);
    v8 = (id)objc_msgSend(v7, "copy");
    objc_msgSend(v11, "addObject:", v8);
    goto LABEL_13;
  }
  v6 = v5;

  if (v4)
    goto LABEL_12;
  if (v6)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("value"));
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
LABEL_14:

      goto LABEL_20;
    }
    v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("value"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v26 = v9;
    else
      v26 = 0;

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("style"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v19 = v18;
    else
      v19 = 0;

    objc_msgSend((id)objc_opt_class(), "_styleDictionaryWithName:styles:", v19, *(_QWORD *)(a1 + 40));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      objc_msgSend((id)objc_opt_class(), "attributedStringWithString:styles:", v26, v20);
      v21 = objc_claimAutoreleasedReturnValue();
      v22 = (void *)v21;
      if (v21)
      {
        v39 = CFSTR("value");
        v40[0] = v21;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v40, &v39, 1);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addEntriesFromDictionary:", v23);

      }
    }
    else
    {
      v28 = MEMORY[0x1E0C809B0];
      v29 = 3221225472;
      v30 = __115__AMSFinancePaymentSheetResponse__salableInfoDictionaryForValues_styles_account_shouldUppercaseText_designVersion___block_invoke_2;
      v31 = &unk_1E25420D0;
      v32 = v8;
      objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", &v28);

    }
    v24 = *(void **)(a1 + 32);
    v25 = (void *)objc_msgSend(v8, "copy", v26, v28, v29, v30, v31);
    objc_msgSend(v24, "addObject:", v25);

LABEL_13:
    goto LABEL_14;
  }
LABEL_15:
  +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v12, "OSLogObject");
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    v14 = (void *)objc_opt_class();
    v15 = v14;
    AMSSetLogKeyIfNeeded();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    AMSHashIfNeeded(v5);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v34 = v14;
    v35 = 2114;
    v36 = v16;
    v37 = 2112;
    v38 = v17;
    _os_log_impl(&dword_18C849000, v13, OS_LOG_TYPE_ERROR, "%{public}@:  [%{public}@] Salable Info value doesn't conform to String or Dictionary - %@", buf, 0x20u);

  }
  v6 = 0;
LABEL_20:

}

void __115__AMSFinancePaymentSheetResponse__salableInfoDictionaryForValues_styles_account_shouldUppercaseText_designVersion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  int v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  v5 = a3;
  v6 = objc_msgSend(v9, "isEqualToString:", CFSTR("value"));
  v7 = *(void **)(a1 + 32);
  if (v6)
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", v5);
    objc_msgSend(v7, "setObject:forKey:", v8, v9);

  }
  else
  {
    objc_msgSend(v7, "setObject:forKey:", v5, v9);
  }

}

+ (id)_flexListDictionaryForValues:(id)a3 styles:(id)a4 account:(id)a5 shouldUppercaseText:(BOOL)a6 designVersion:(id)a7
{
  id v12;
  id v13;
  id v14;
  objc_class *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(uint64_t, void *);
  void *v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  BOOL v33;

  v12 = a4;
  v13 = a5;
  v14 = a7;
  v15 = (objc_class *)MEMORY[0x1E0C99DE8];
  v16 = a3;
  v17 = objc_alloc_init(v15);
  v24 = MEMORY[0x1E0C809B0];
  v25 = 3221225472;
  v26 = __112__AMSFinancePaymentSheetResponse__flexListDictionaryForValues_styles_account_shouldUppercaseText_designVersion___block_invoke;
  v27 = &unk_1E2542148;
  v31 = v17;
  v32 = a1;
  v28 = v14;
  v29 = v12;
  v30 = v13;
  v33 = a6;
  v18 = v17;
  v19 = v13;
  v20 = v12;
  v21 = v14;
  objc_msgSend(v16, "enumerateObjectsUsingBlock:", &v24);

  v22 = (void *)objc_msgSend(v18, "copy", v24, v25, v26, v27);
  return v22;
}

void __112__AMSFinancePaymentSheetResponse__flexListDictionaryForValues_styles_account_shouldUppercaseText_designVersion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  id v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  unsigned int v48;
  void *v49;
  void *v50;
  void *v51;
  _QWORD v52[4];
  id v53;
  id v54;
  id v55;
  uint64_t *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t *v59;
  uint64_t v60;
  uint64_t (*v61)(uint64_t, uint64_t);
  void (*v62)(uint64_t);
  id v63;
  _QWORD v64[4];
  id v65;
  id v66;
  _QWORD v67[2];
  _QWORD v68[2];
  _QWORD v69[2];
  _QWORD v70[2];
  _QWORD v71[2];
  _QWORD v72[2];
  void *v73;
  const __CFString *v74;
  _QWORD v75[3];

  v75[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (!objc_msgSend(*(id *)(a1 + 32), "isEqualToNumber:", 0x1E25AF8F0))
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("valueStyle"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = v6;
    else
      v7 = 0;

    v51 = v7;
    if ((objc_msgSend(v7, "isEqualToString:", CFSTR("gray")) & 1) != 0)
      v48 = 1;
    else
      v48 = objc_msgSend(v7, "isEqualToString:", CFSTR("grey"));
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("header"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v8 = v13;
    else
      v8 = 0;

    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("headerIcon"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v9 = v14;
    else
      v9 = 0;

    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("style"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v10 = v18;
    else
      v10 = 0;

    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("value"));
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = (void *)v19;
    if (!(v8 | v9) || !v19)
      goto LABEL_69;
    if (v8)
    {
      if (*(_BYTE *)(a1 + 72))
      {
        objc_msgSend((id)v8, "localizedUppercaseString");
        v21 = objc_claimAutoreleasedReturnValue();

        v8 = v21;
      }
      v50 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", v8);
      if (v9)
      {
LABEL_34:
        v47 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", v9);
        if (v10)
        {
LABEL_35:
          v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", v10);
          goto LABEL_51;
        }
LABEL_50:
        v22 = 0;
LABEL_51:
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v33 = *(void **)(a1 + 64);
          v73 = v20;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v73, 1);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "_attributedStringForStringArray:useGrey:account:shouldUppercase:", v34, v48, *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 72));
          v35 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            v35 = 0;
            goto LABEL_64;
          }
          objc_msgSend(*(id *)(a1 + 64), "_attributedStringForStringArray:useGrey:account:shouldUppercase:", v20, v48, *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 72));
          v35 = (void *)objc_claimAutoreleasedReturnValue();
        }
        if (v50 && v35)
        {
          v71[0] = CFSTR("header");
          v71[1] = CFSTR("value");
          v72[0] = v50;
          v72[1] = v35;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v72, v71, 2);
          v36 = objc_claimAutoreleasedReturnValue();
          goto LABEL_67;
        }
        if (v47 && v35)
        {
          v69[0] = CFSTR("headerIcon");
          v69[1] = CFSTR("value");
          v70[0] = v47;
          v70[1] = v35;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v70, v69, 2);
          v36 = objc_claimAutoreleasedReturnValue();
          goto LABEL_67;
        }
LABEL_64:
        if (!v22 || !v51)
          goto LABEL_68;
        v67[0] = CFSTR("style");
        v67[1] = CFSTR("value");
        v68[0] = v22;
        v68[1] = v35;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v68, v67, 2);
        v36 = objc_claimAutoreleasedReturnValue();
LABEL_67:
        v39 = (void *)v36;
        objc_msgSend(*(id *)(a1 + 56), "addObject:", v36, v47);

LABEL_68:
LABEL_69:

LABEL_70:
        goto LABEL_71;
      }
    }
    else
    {
      v50 = 0;
      if (v9)
        goto LABEL_34;
    }
    v47 = 0;
    if (v10)
      goto LABEL_35;
    goto LABEL_50;
  }
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("leadingItem"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;

  v51 = v5;
  objc_msgSend(*(id *)(a1 + 64), "_flexListLeadingItemForValues:styles:", v5, *(_QWORD *)(a1 + 40));
  v8 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("value"));
  v9 = objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v10 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("axID"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v12 = v11;

      if (v12)
      {
        v49 = v12;
        if (objc_msgSend(v12, "length"))
          objc_msgSend(v10, "setObject:forKeyedSubscript:", v12, CFSTR("axID"));
        goto LABEL_38;
      }
    }
    else
    {

    }
    v49 = 0;
LABEL_38:
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("value"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v24 = v23;
    else
      v24 = 0;

    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("style"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v26 = v25;
    else
      v26 = 0;

    objc_msgSend((id)objc_opt_class(), "_styleDictionaryWithName:styles:", v26, *(_QWORD *)(a1 + 40));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (v27)
    {
      objc_msgSend(*(id *)(a1 + 48), "username");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "ams_replaceAccountPatternWithUsername:", v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend((id)objc_opt_class(), "attributedStringWithString:styles:", v29, v27);
      v30 = objc_claimAutoreleasedReturnValue();
      v31 = (void *)v30;
      if (v30)
      {
        v74 = CFSTR("value");
        v75[0] = v30;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v75, &v74, 1);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addEntriesFromDictionary:", v32);

      }
    }
    else
    {
      v64[0] = MEMORY[0x1E0C809B0];
      v64[1] = 3221225472;
      v64[2] = __112__AMSFinancePaymentSheetResponse__flexListDictionaryForValues_styles_account_shouldUppercaseText_designVersion___block_invoke_2;
      v64[3] = &unk_1E25420F8;
      v65 = *(id *)(a1 + 48);
      v66 = v10;
      objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v64);

      v29 = v24;
    }
    v37 = *(void **)(a1 + 56);
    v38 = (void *)objc_msgSend(v10, "copy");
    objc_msgSend(v37, "addObject:", v38);

    goto LABEL_70;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v15 = objc_alloc_init(MEMORY[0x1E0CB3778]);
    v58 = 0;
    v59 = &v58;
    v60 = 0x3032000000;
    v61 = __Block_byref_object_copy__32;
    v62 = __Block_byref_object_dispose__32;
    v63 = 0;
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("value"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v17 = v16;
    else
      v17 = 0;

    v52[0] = MEMORY[0x1E0C809B0];
    v52[1] = 3221225472;
    v52[2] = __112__AMSFinancePaymentSheetResponse__flexListDictionaryForValues_styles_account_shouldUppercaseText_designVersion___block_invoke_203;
    v52[3] = &unk_1E2542120;
    v40 = *(_QWORD *)(a1 + 64);
    v56 = &v58;
    v57 = v40;
    v53 = *(id *)(a1 + 40);
    v10 = v15;
    v54 = v10;
    v41 = v17;
    v55 = v41;
    objc_msgSend(v41, "enumerateObjectsUsingBlock:", v52);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = (void *)objc_msgSend(v10, "copy");
    objc_msgSend(v42, "setObject:forKeyedSubscript:", v43, CFSTR("value"));

    v44 = (void *)v59[5];
    if (v44 && objc_msgSend(v44, "length"))
      objc_msgSend(v42, "setObject:forKeyedSubscript:", v59[5], CFSTR("axID"));
    if (v8)
      objc_msgSend(v42, "setObject:forKeyedSubscript:", v8, CFSTR("leadingItem"));
    v45 = *(void **)(a1 + 56);
    v46 = (void *)objc_msgSend(v42, "copy");
    objc_msgSend(v45, "addObject:", v46);

    _Block_object_dispose(&v58, 8);
    goto LABEL_70;
  }
LABEL_71:

}

void __112__AMSFinancePaymentSheetResponse__flexListDictionaryForValues_styles_account_shouldUppercaseText_designVersion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a2;
  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(v5, "username");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "ams_replaceAccountPatternWithUsername:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v12, "isEqualToString:", CFSTR("value"));
  v10 = *(void **)(a1 + 40);
  if (v9)
  {
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", v8);
    objc_msgSend(v10, "setObject:forKey:", v11, v12);

  }
  else
  {
    objc_msgSend(v10, "setObject:forKey:", v8, v12);
  }

}

void __112__AMSFinancePaymentSheetResponse__flexListDictionaryForValues_styles_account_shouldUppercaseText_designVersion___block_invoke_203(uint64_t a1, void *a2, unint64_t a3)
{
  char isKindOfClass;
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;

  v20 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v6 = v20;
  if ((isKindOfClass & 1) == 0)
    goto LABEL_20;
  v7 = v20;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;

  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("axID"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v10 = 0;
    goto LABEL_10;
  }
  v10 = v9;

  if (v10 && objc_msgSend(v10, "length"))
  {
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v10 = v10;
    v9 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v10;
LABEL_10:

  }
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("value"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v13 = v12;
  else
    v13 = 0;

  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("style"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v15 = v14;
  else
    v15 = 0;

  objc_msgSend((id)objc_opt_class(), "_styleDictionaryWithName:styles:", v15, *(_QWORD *)(a1 + 32));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "attributedStringWithString:styles:", v13, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "appendAttributedString:", v17);
  if (objc_msgSend(*(id *)(a1 + 48), "count") - 1 > a3)
  {
    v18 = *(void **)(a1 + 40);
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", 0x1E2566F00);
    objc_msgSend(v18, "appendAttributedString:", v19);

  }
  v6 = v20;
LABEL_20:

}

+ (id)_flexListLeadingItemForValues:(id)a3 styles:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v37;
  id v38;
  id v39;
  id v40;
  uint8_t buf[4];
  void *v42;
  __int16 v43;
  void *v44;
  __int16 v45;
  void *v46;
  __int16 v47;
  void *v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v6
    && (objc_msgSend(v6, "allKeys"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_msgSend(v8, "count"),
        v8,
        v9))
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("iconType"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v12 = v11;
    else
      v12 = 0;

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("style"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v40 = v14;
    else
      v40 = 0;

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("type"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v16 = v15;
    else
      v16 = 0;

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("value"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v18 = v17;
    else
      v18 = 0;

    if (objc_msgSend(v16, "isEqualToString:", CFSTR("url")))
    {
      v19 = a1;
      v20 = v12;
      v21 = objc_msgSend(v19, "_salableIconForString:", v12);
      objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v18);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = v22;
      if (v21)
      {
        objc_msgSend(v22, "host");
        v24 = objc_claimAutoreleasedReturnValue();
        if (v24)
        {
          v25 = (void *)v24;
          objc_msgSend(v23, "scheme");
          v26 = (void *)objc_claimAutoreleasedReturnValue();

          if (v26)
          {
            objc_msgSend(v10, "setObject:forKeyedSubscript:", &unk_1E25AF578, CFSTR("AMSPaymentSheetContentItemLeadingItemAttribute"));
            objc_msgSend(v10, "setObject:forKeyedSubscript:", v18, CFSTR("AMSPaymentSheetContentItemLeadingItemValueAttribute"));
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v21);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "setObject:forKeyedSubscript:", v27, CFSTR("AMSPaymentSheetContentItemLeadingItemIconTypeAttribute"));

          }
        }
      }

      v12 = v20;
    }
    else if (objc_msgSend(v16, "isEqualToString:", CFSTR("symbol")) && v18)
    {
      objc_msgSend(v10, "setObject:forKeyedSubscript:", &unk_1E25AF590, CFSTR("AMSPaymentSheetContentItemLeadingItemAttribute"));
      objc_msgSend(v10, "setObject:forKeyedSubscript:", v18, CFSTR("AMSPaymentSheetContentItemLeadingItemValueAttribute"));
    }
    objc_msgSend(v10, "allKeys");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "count");

    if (v29)
    {
      v13 = (void *)objc_msgSend(v10, "copy");
    }
    else
    {
      v39 = v12;
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
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
        v32 = (void *)objc_opt_class();
        v38 = v32;
        AMSSetLogKeyIfNeeded();
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        AMSHashIfNeeded(v16);
        v37 = v10;
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        AMSHashIfNeeded(v6);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v42 = v32;
        v43 = 2114;
        v44 = v33;
        v45 = 2114;
        v46 = v34;
        v47 = 2112;
        v48 = v35;
        _os_log_impl(&dword_18C849000, v31, OS_LOG_TYPE_ERROR, "%{public}@:  [%{public}@] Unable to construct a valid leading item of type \"%{public}@\" raw values were: %@", buf, 0x2Au);

        v10 = v37;
      }

      v13 = 0;
      v12 = v39;
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

+ (int64_t)_confirmationTitleForString:(id)a3
{
  id v3;
  int64_t v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("pay")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("confirm")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("get")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("install")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("rent")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("redeem")) & 1) != 0)
  {
    v4 = 5;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("subscribe")))
  {
    v4 = 6;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)_enrichedMetricsDictionaryWithFinanceDictionary:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)objc_msgSend(a3, "mutableCopy");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", &unk_1E25AF5A8, CFSTR("eventVersion"));
  +[AMSDevice screenScale](AMSDevice, "screenScale");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("pixelRatio"));
  +[AMSDevice screenWidth](AMSDevice, "screenWidth");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("screenWidth"));
  +[AMSDevice screenHeight](AMSDevice, "screenHeight");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("screenHeight"));
  v7 = (void *)objc_msgSend(v3, "copy");

  return v7;
}

+ (int64_t)_payeeInferredFromEnumeratedTitle:(id)a3
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  char v9;
  int64_t v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  char v18;
  void *v19;
  char v20;
  void *v21;
  char v22;
  void *v23;
  char v24;
  uint64_t v26;
  void *v27;
  void *v28;
  int v29;
  uint64_t v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  +[AMSLogConfig sharedAccountsConfig](AMSLogConfig, "sharedAccountsConfig");
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
    objc_msgSend(v3, "logKey");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = 138543618;
    v30 = v6;
    v31 = 2114;
    v32 = v7;
    _os_log_impl(&dword_18C849000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Requestor key not found, attempting to infer requestor from title enumeration.", (uint8_t *)&v29, 0x16u);

  }
  if (objc_msgSend(v3, "titleType") == 1)
  {
    objc_msgSend(v3, "title");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("AppleArcade"));

    if ((v9 & 1) != 0)
    {
      v10 = 6;
    }
    else
    {
      objc_msgSend(v3, "title");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "isEqualToString:", CFSTR("AppleFitness"));

      if (v16)
        v10 = 7;
      else
        v10 = 0;
    }
    objc_msgSend(v3, "title");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "isEqualToString:", CFSTR("AppleMusic"));

    if ((v18 & 1) != 0)
    {
      v10 = 1;
      goto LABEL_25;
    }
    objc_msgSend(v3, "title");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "isEqualToString:", CFSTR("AppleNews"));

    if ((v20 & 1) != 0)
    {
      v10 = 2;
      goto LABEL_25;
    }
    objc_msgSend(v3, "title");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "isEqualToString:", CFSTR("AppleOne"));

    if ((v22 & 1) != 0)
    {
      v10 = 8;
      goto LABEL_25;
    }
    objc_msgSend(v3, "title");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "isEqualToString:", CFSTR("AppleTV"));

    if ((v24 & 1) != 0)
    {
      v10 = 9;
      goto LABEL_25;
    }
    +[AMSLogConfig sharedAccountsConfig](AMSLogConfig, "sharedAccountsConfig");
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
      v26 = objc_opt_class();
      objc_msgSend(v3, "logKey");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "title");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = 138543874;
      v30 = v26;
      v31 = 2114;
      v32 = v27;
      v33 = 2114;
      v34 = v28;
      _os_log_impl(&dword_18C849000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] No requestor identified for title: %{public}@", (uint8_t *)&v29, 0x20u);

    }
  }
  else
  {
    +[AMSLogConfig sharedAccountsConfig](AMSLogConfig, "sharedAccountsConfig");
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
      objc_msgSend(v3, "logKey");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = 138543618;
      v30 = v13;
      v31 = 2114;
      v32 = v14;
      _os_log_impl(&dword_18C849000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] No requestor identified, title type is not enumeration", (uint8_t *)&v29, 0x16u);

    }
    v10 = 0;
  }

LABEL_25:
  return v10;
}

+ (int64_t)_salableIconForString:(id)a3
{
  id v3;
  int64_t v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("app")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("merchant")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("messages")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("watch")) & 1) != 0)
  {
    v4 = 3;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("vision")))
  {
    v4 = 6;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)_salableInfoForKey:(id)a3 inDictionary:(id)a4 shouldUppercase:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  _QWORD v17[4];
  id v18;
  _QWORD v19[2];

  v5 = a5;
  v19[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  objc_msgSend(v8, "objectForKeyedSubscript:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v10 = v9;

    if (v10)
    {
      if (!v5)
        goto LABEL_12;
      goto LABEL_11;
    }
  }
  else
  {

  }
  objc_msgSend(v8, "objectForKeyedSubscript:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v12 = v11;

    if (v12)
    {
      v19[0] = v12;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
      v10 = (id)objc_claimAutoreleasedReturnValue();

      goto LABEL_12;
    }
  }
  else
  {

  }
  v10 = 0;
  if (v5)
  {
LABEL_11:
    v13 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __82__AMSFinancePaymentSheetResponse__salableInfoForKey_inDictionary_shouldUppercase___block_invoke;
    v17[3] = &unk_1E253DF48;
    v18 = v13;
    v14 = v13;
    objc_msgSend(v10, "enumerateObjectsUsingBlock:", v17);
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v14);
    v15 = objc_claimAutoreleasedReturnValue();

    v10 = (id)v15;
  }
LABEL_12:

  return v10;
}

void __82__AMSFinancePaymentSheetResponse__salableInfoForKey_inDictionary_shouldUppercase___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "localizedUppercaseString");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

+ (id)_styleDictionaryWithName:(id)a3 styles:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v5 = a3;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __66__AMSFinancePaymentSheetResponse__styleDictionaryWithName_styles___block_invoke;
  v10[3] = &unk_1E2542170;
  v11 = v5;
  v6 = v5;
  objc_msgSend(a4, "ams_mapWithTransformIgnoresNil:", v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id __66__AMSFinancePaymentSheetResponse__styleDictionaryWithName_styles___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a2;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("name"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqualToString:", *(_QWORD *)(a1 + 32)))
    v5 = v3;
  else
    v5 = 0;
  v6 = v5;

  return v6;
}

+ (id)_attributedStringForAttributedArray:(id)a3 account:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;

  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(MEMORY[0x1E0CB3778]);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", CFSTR("\n"));
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __78__AMSFinancePaymentSheetResponse__attributedStringForAttributedArray_account___block_invoke;
  v16[3] = &unk_1E2542198;
  v17 = v7;
  v18 = v8;
  v20 = v9;
  v21 = a1;
  v19 = v6;
  v10 = v9;
  v11 = v6;
  v12 = v8;
  v13 = v7;
  objc_msgSend(v11, "enumerateObjectsUsingBlock:", v16);
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithAttributedString:", v12);

  return v14;
}

void __78__AMSFinancePaymentSheetResponse__attributedStringForAttributedArray_account___block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v10;

    if (v5)
    {
      objc_msgSend(v5, "ams_replacingMarkupUsingAccount:shouldUppercase:", *(_QWORD *)(a1 + 32), 0);
      v6 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "appendAttributedString:", v6);
      goto LABEL_10;
    }
  }
  else
  {

  }
  v7 = v10;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = v7;

    if (v6)
    {
      v8 = *(void **)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 64), "_attributedStringForAttributedDictionary:account:", v6, *(_QWORD *)(a1 + 32));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "appendAttributedString:", v9);

    }
    v5 = 0;
  }
  else
  {

    v5 = 0;
    v6 = 0;
  }
LABEL_10:

  if (objc_msgSend(*(id *)(a1 + 48), "count") - 1 > a3)
    objc_msgSend(*(id *)(a1 + 40), "appendAttributedString:", *(_QWORD *)(a1 + 56));

}

+ (id)_attributedStringForAttributedDictionary:(id)a3 account:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("value"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v8 = 0;
    v10 = 0;
LABEL_10:

    goto LABEL_11;
  }
  v8 = v7;

  if (v8)
  {
    objc_msgSend(v8, "ams_replacingMarkupUsingAccount:shouldUppercase:", v6, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "mutableCopy");

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("size"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = v11;
    else
      v7 = 0;

    if (objc_msgSend(v7, "isEqualToString:", CFSTR("large")))
    {
      v12 = objc_msgSend(v10, "length");
      objc_msgSend(v10, "addAttribute:value:range:", CFSTR("useLargeSize"), MEMORY[0x1E0C9AAB0], 0, v12);
    }
    goto LABEL_10;
  }
  v10 = 0;
LABEL_11:
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithAttributedString:", v10);

  return v13;
}

+ (id)_attributedStringForSalableInfoStringArray:(id)a3 account:(id)a4 shouldUppercase:(BOOL)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t, void *, unint64_t);
  void *v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  BOOL v28;

  v8 = a3;
  v9 = a4;
  v10 = objc_alloc_init(MEMORY[0x1E0CB3778]);
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", CFSTR("\n"));
  v19 = MEMORY[0x1E0C809B0];
  v20 = 3221225472;
  v21 = __101__AMSFinancePaymentSheetResponse__attributedStringForSalableInfoStringArray_account_shouldUppercase___block_invoke;
  v22 = &unk_1E25421C0;
  v28 = a5;
  v26 = v11;
  v27 = a1;
  v23 = v9;
  v24 = v10;
  v25 = v8;
  v12 = v11;
  v13 = v8;
  v14 = v10;
  v15 = v9;
  objc_msgSend(v13, "enumerateObjectsUsingBlock:", &v19);
  v16 = objc_alloc(MEMORY[0x1E0CB3498]);
  v17 = (void *)objc_msgSend(v16, "initWithAttributedString:", v14, v19, v20, v21, v22);

  return v17;
}

void __101__AMSFinancePaymentSheetResponse__attributedStringForSalableInfoStringArray_account_shouldUppercase___block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;

  objc_msgSend(a2, "ams_replacingMarkupUsingAccount:shouldUppercase:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 72));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (a3)
  {
    v8 = v5;
    objc_msgSend(*(id *)(a1 + 64), "_greyAttributedStringForAttributedString:range:", v5, 0, objc_msgSend(v5, "length"));
    v7 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v7;
  }
  v9 = v6;
  objc_msgSend(*(id *)(a1 + 40), "appendAttributedString:", v6);
  if (objc_msgSend(*(id *)(a1 + 48), "count") - 1 > a3)
    objc_msgSend(*(id *)(a1 + 40), "appendAttributedString:", *(_QWORD *)(a1 + 56));

}

+ (id)_attributedStringForSalableInfoStyledStringArray:(id)a3 account:(id)a4 shouldUppercase:(BOOL)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t, void *, unint64_t);
  void *v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  BOOL v28;

  v8 = a3;
  v9 = a4;
  v10 = objc_alloc_init(MEMORY[0x1E0CB3778]);
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", CFSTR("\n"));
  v19 = MEMORY[0x1E0C809B0];
  v20 = 3221225472;
  v21 = __107__AMSFinancePaymentSheetResponse__attributedStringForSalableInfoStyledStringArray_account_shouldUppercase___block_invoke;
  v22 = &unk_1E25421E8;
  v28 = a5;
  v26 = v11;
  v27 = a1;
  v23 = v9;
  v24 = v10;
  v25 = v8;
  v12 = v11;
  v13 = v8;
  v14 = v10;
  v15 = v9;
  objc_msgSend(v13, "enumerateObjectsUsingBlock:", &v19);
  v16 = objc_alloc(MEMORY[0x1E0CB3498]);
  v17 = (void *)objc_msgSend(v16, "initWithAttributedString:", v14, v19, v20, v21, v22);

  return v17;
}

void __107__AMSFinancePaymentSheetResponse__attributedStringForSalableInfoStyledStringArray_account_shouldUppercase___block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  id v12;

  v5 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = v5;

    if (v6)
    {
      objc_msgSend(v6, "ams_replacingMarkupUsingAccount:shouldUppercase:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 72));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    }
  }
  else
  {

    v6 = 0;
  }
  v7 = 0;
LABEL_6:
  v12 = v5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v12;

    if (!v8)
      goto LABEL_11;
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("value"));
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = v7;
    v7 = (void *)v9;
  }
  else
  {
    v8 = 0;
    v10 = v12;
  }

LABEL_11:
  if (a3)
  {
    objc_msgSend(*(id *)(a1 + 64), "_greyAttributedStringForAttributedString:range:", v7, 0, objc_msgSend(v7, "length"));
    v11 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v11;
  }
  objc_msgSend(*(id *)(a1 + 40), "appendAttributedString:", v7);
  if (objc_msgSend(*(id *)(a1 + 48), "count") - 1 > a3)
    objc_msgSend(*(id *)(a1 + 40), "appendAttributedString:", *(_QWORD *)(a1 + 56));

}

+ (id)_attributedStringForStringArray:(id)a3 useGrey:(BOOL)a4 account:(id)a5 shouldUppercase:(BOOL)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t, void *, unint64_t);
  void *v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  BOOL v30;
  BOOL v31;

  v10 = a3;
  v11 = a5;
  v12 = objc_alloc_init(MEMORY[0x1E0CB3778]);
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", CFSTR("\n"));
  v21 = MEMORY[0x1E0C809B0];
  v22 = 3221225472;
  v23 = __98__AMSFinancePaymentSheetResponse__attributedStringForStringArray_useGrey_account_shouldUppercase___block_invoke;
  v24 = &unk_1E2542210;
  v30 = a6;
  v31 = a4;
  v28 = v13;
  v29 = a1;
  v25 = v11;
  v26 = v12;
  v27 = v10;
  v14 = v13;
  v15 = v10;
  v16 = v12;
  v17 = v11;
  objc_msgSend(v15, "enumerateObjectsUsingBlock:", &v21);
  v18 = objc_alloc(MEMORY[0x1E0CB3498]);
  v19 = (void *)objc_msgSend(v18, "initWithAttributedString:", v16, v21, v22, v23, v24);

  return v19;
}

void __98__AMSFinancePaymentSheetResponse__attributedStringForStringArray_useGrey_account_shouldUppercase___block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;

  objc_msgSend(a2, "ams_replacingMarkupUsingAccount:shouldUppercase:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 72));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (*(_BYTE *)(a1 + 73))
  {
    v8 = v5;
    objc_msgSend(*(id *)(a1 + 64), "_greyAttributedStringForAttributedString:range:", v5, 0, objc_msgSend(v5, "length"));
    v7 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v7;
  }
  v9 = v6;
  objc_msgSend(*(id *)(a1 + 40), "appendAttributedString:", v6);
  if (objc_msgSend(*(id *)(a1 + 48), "count") - 1 > a3)
    objc_msgSend(*(id *)(a1 + 40), "appendAttributedString:", *(_QWORD *)(a1 + 56));

}

+ (id)attributedStringWithString:(id)a3 styles:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  __CFString **v21;
  void *v22;
  void *v23;
  __CFString **v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  void *v29;
  char v30;
  void *v31;
  void *v33;
  void *v34;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("image"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" %@"), v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringByAppendingString:", v8);
    v9 = objc_claimAutoreleasedReturnValue();

    v5 = (id)v9;
  }
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:", v5);
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("color"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "isEqualToString:", CFSTR("gray")))
  {

LABEL_6:
    v14 = objc_msgSend(v5, "length");
    objc_msgSend(v10, "addAttribute:value:range:", CFSTR("AMSPaymentContentItemLightColorAttribute"), MEMORY[0x1E0C9AAB0], 0, v14);
    goto LABEL_7;
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("color"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("grey"));

  if (v13)
    goto LABEL_6;
LABEL_7:
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("bold"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v15, "isEqualToString:", CFSTR("true")) & 1) != 0 || objc_msgSend(v15, "BOOLValue"))
  {
    v16 = objc_msgSend(v5, "length");
    objc_msgSend(v10, "addAttribute:value:range:", CFSTR("AMSPaymentContentItemBoldAttribute"), MEMORY[0x1E0C9AAB0], 0, v16);
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("size"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v18 = v17;

    if (v18)
    {
      v34 = v18;
      objc_msgSend(v10, "addAttribute:value:range:", CFSTR("AMSPaymentSheetContentItemSizeAttribute"), v18, 0, objc_msgSend(v5, "length"));
      goto LABEL_15;
    }
  }
  else
  {

  }
  v34 = 0;
LABEL_15:
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("spacingAfter"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v19;
  if (!v19)
    goto LABEL_23;
  if ((objc_msgSend(v19, "isEqualToString:", CFSTR("large")) & 1) != 0)
  {
    v21 = AMSPaymentSheetContentItemSpacingAttributeLargeValue;
  }
  else if ((objc_msgSend(v20, "isEqualToString:", CFSTR("small")) & 1) != 0)
  {
    v21 = AMSPaymentSheetContentItemSpacingAttributeSmallValue;
  }
  else
  {
    if (!objc_msgSend(v20, "isEqualToString:", CFSTR("medium")))
      goto LABEL_23;
    v21 = AMSPaymentSheetContentItemSpacingAttributeMediumValue;
  }
  objc_msgSend(v10, "addAttribute:value:range:", CFSTR("AMSPaymentSheetContentItemSpacingAfterAttribute"), *v21, 0, objc_msgSend(v5, "length"));
LABEL_23:
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("spacingBefore"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v22;
  if (!v22)
    goto LABEL_31;
  if ((objc_msgSend(v22, "isEqualToString:", CFSTR("large")) & 1) != 0)
  {
    v24 = AMSPaymentSheetContentItemSpacingAttributeLargeValue;
  }
  else if ((objc_msgSend(v23, "isEqualToString:", CFSTR("small")) & 1) != 0)
  {
    v24 = AMSPaymentSheetContentItemSpacingAttributeSmallValue;
  }
  else
  {
    if (!objc_msgSend(v23, "isEqualToString:", CFSTR("medium")))
      goto LABEL_31;
    v24 = AMSPaymentSheetContentItemSpacingAttributeMediumValue;
  }
  objc_msgSend(v10, "addAttribute:value:range:", CFSTR("AMSPaymentSheetContentItemSpacingBeforeAttribute"), *v24, 0, objc_msgSend(v5, "length"));
LABEL_31:
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("dividerBefore"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v33 = v15;
    v26 = v7;
    v27 = v25;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v28 = v27;
    else
      v28 = 0;

    objc_msgSend(v28, "lowercaseString");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v29, "isEqualToString:", CFSTR("false"));

    v7 = v26;
    v15 = v33;
    if ((v30 & 1) != 0)
      goto LABEL_39;
  }
  else if ((objc_opt_respondsToSelector() & 1) != 0 && (objc_msgSend(v25, "BOOLValue") & 1) == 0)
  {
LABEL_39:
    objc_msgSend(v10, "addAttribute:value:range:", CFSTR("AMSPaymentSheetContentItemDividerAttribute"), CFSTR("AMSPaymentSheetContentItemDividerNoValue"), 0, objc_msgSend(v5, "length"));
  }
  v31 = (void *)objc_msgSend(v10, "copy");

  return v31;
}

+ (id)_greyAttributedStringForAttributedString:(id)a3 range:(_NSRange)a4
{
  NSUInteger length;
  id v5;
  void *v6;
  void *v7;
  BOOL v8;
  void *v9;

  length = a4.length;
  v5 = a3;
  if (!_greyAttributedStringForAttributedString_range__kAMSPaymentContentItemLightColorAttribute)
    objc_storeStrong((id *)&_greyAttributedStringForAttributedString_range__kAMSPaymentContentItemLightColorAttribute, CFSTR("AMSPaymentContentItemLightColorAttribute"));
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithAttributedString:", v5);
  v7 = v6;
  if (_greyAttributedStringForAttributedString_range__kAMSPaymentContentItemLightColorAttribute)
    v8 = length == 0;
  else
    v8 = 1;
  if (!v8)
    objc_msgSend(v6, "addAttribute:value:range:");
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithAttributedString:", v7);

  return v9;
}

+ (id)createRequestFromDictionary:(id)a3 confirmationOnly:(BOOL)a4 delegateAuthenticationRequired:(BOOL)a5 biometricSignatureRequired:(BOOL)a6 authenticateResponse:(id)a7 taskInfo:(id)a8 account:(id)a9
{
  _BOOL4 v11;
  _BOOL4 v12;
  _BOOL4 v13;
  id v14;
  id v15;
  id v16;
  id v17;
  double v18;
  double v19;
  AMSPaymentSheetRequest *v20;
  void *v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
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
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  id v41;
  void *v42;
  int v43;
  void *v44;
  id v45;
  id v46;
  void *v47;
  id v48;
  id v49;
  void *v50;
  id v51;
  id v52;
  uint64_t v53;
  void *v54;
  id v55;
  id v56;
  void *v57;
  uint64_t v58;
  void *v59;
  id v60;
  id v61;
  void *v62;
  id v63;
  id v64;
  void *v65;
  void *v66;
  void *v67;
  id v68;
  id v69;
  void *v70;
  void *v71;
  id v72;
  id v73;
  void *v74;
  void *v75;
  id v76;
  id v77;
  void *v78;
  id v79;
  id v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  id v88;
  id v89;
  id v90;
  id v91;
  AMSPaymentSheetRequest *v92;
  id v93;
  void *v94;
  id v95;
  id v96;
  void *v97;
  void *v98;
  id v99;
  id v100;
  void *v101;
  void *v102;
  id v103;
  id v104;
  void *v105;
  void *v106;
  void *v107;
  id v108;
  id v109;
  void *v110;
  id v111;
  id v112;
  void *v113;
  id v114;
  id v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  id v121;
  id v122;
  void *v123;
  void *v124;
  id v125;
  id v126;
  void *v127;
  void *v128;
  void *v129;
  id v130;
  uint64_t v131;
  id v132;
  void *v133;
  void *v134;
  void *v135;
  id v136;
  id v137;
  void *v138;
  void *v139;
  id v140;
  id v141;
  void *v142;
  void *v143;
  id v144;
  void *v145;
  id v146;
  id v147;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  id v152;
  id v153;
  void *v154;
  id v155;
  id v156;
  void *v157;
  void *v158;
  id v159;
  id v160;
  void *v161;
  void *v162;
  void *v163;
  void *v164;
  id v165;
  id v166;
  void *v167;
  void *v168;
  void *v169;
  AMSPaymentSheetInlineImage *v170;
  void *v171;
  AMSPaymentSheetInlineImage **v172;
  id v173;
  void *v174;
  id v175;
  id v176;
  void *v177;
  void *v178;
  void *v179;
  id v180;
  double v181;
  double v182;
  AMSPaymentSheetPerformanceMetrics *v183;
  void *v184;
  void *v185;
  AMSPaymentSheetPerformanceMetrics *v186;
  void *v187;
  void *v188;
  void *v189;
  void *v190;
  void *v191;
  void *v192;
  void *v193;
  void *v194;
  AMSPaymentSheetRequest *v195;
  void *v197;
  id v198;
  void *v199;
  void *v200;
  void *v201;
  void *v202;
  void *v203;
  void *v204;
  void *v205;
  void *v206;
  void *v207;
  void *v208;
  void *v210;
  id v211;
  void *v212;
  void *v213;
  void *v214;
  unsigned int v215;
  void *v216;
  id v217;
  _QWORD v218[4];
  AMSPaymentSheetInlineImage *v219;
  _QWORD v220[4];
  AMSPaymentSheetRequest *v221;
  id v222;
  AMSPaymentSheetInlineImage *v223;
  AMSPaymentSheetInlineImage *v224;
  _QWORD v225[3];

  v11 = a6;
  v12 = a5;
  v13 = a4;
  v225[1] = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a7;
  v16 = a8;
  v217 = a9;
  v17 = objc_alloc_init(MEMORY[0x1E0C99D68]);
  objc_msgSend(v17, "timeIntervalSince1970");
  v19 = v18;

  v207 = v15;
  objc_msgSend(v15, "authenticateRequest");
  v212 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_alloc_init(AMSPaymentSheetRequest);
  -[AMSPaymentSheetRequest setResponseDictionary:](v20, "setResponseDictionary:", v14);
  v208 = v14;
  objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("paymentSheetInfo"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v22 = v21;
  else
    v22 = 0;
  v211 = v22;

  -[AMSPaymentSheetRequest setRequiresAuthorization:](v20, "setRequiresAuthorization:", !v13);
  v23 = a1;
  if (v12)
  {
    objc_msgSend(v16, "response");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "ams_valueForHTTPHeaderField:", CFSTR("X-Apple-DelegateAuth-Challenge"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSPaymentSheetRequest setDelegateAuthenticateChallenge:](v20, "setDelegateAuthenticateChallenge:", v25);

    +[AMSDelegateAuthenticateRequest preferredUserAgent](AMSDelegateAuthenticateRequest, "preferredUserAgent");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSPaymentSheetRequest setUserAgent:](v20, "setUserAgent:", v26);

    -[AMSPaymentSheetRequest setIsDelegateAuthentication:](v20, "setIsDelegateAuthentication:", 1);
  }
  v213 = v16;
  if (v11)
  {
    objc_msgSend(v16, "response");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "properties");
    v214 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v214, "account");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "session");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "task");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "properties");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "clientInfo");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v213, "properties");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "keychainOptions");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    +[AMSBiometricsSignatureRequest biometricsSignatureRequestForURLResponse:account:session:task:clientInfo:options:error:](AMSBiometricsSignatureRequest, "biometricsSignatureRequestForURLResponse:account:session:task:clientInfo:options:error:", v27, v28, v29, v30, v32, v34, 0);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSPaymentSheetRequest setBiometricsRequest:](v20, "setBiometricsRequest:", v35);

    v23 = a1;
    v16 = v213;

  }
  if (!v217)
  {
    objc_msgSend(v16, "properties");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "account");
    v217 = (id)objc_claimAutoreleasedReturnValue();

  }
  -[AMSPaymentSheetRequest setAccount:](v20, "setAccount:", v217);
  objc_msgSend(v16, "properties");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "logUUID");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSPaymentSheetRequest setLogKey:](v20, "setLogKey:", v38);

  objc_msgSend(v211, "objectForKeyedSubscript:", CFSTR("caseControl"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v40 = v39;
  else
    v40 = 0;
  v41 = v40;

  v206 = v41;
  objc_msgSend(v41, "lowercaseString");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = objc_msgSend(v42, "isEqualToString:", CFSTR("true"));

  v215 = v43 ^ 1;
  -[AMSPaymentSheetRequest setShouldUppercaseText:](v20, "setShouldUppercaseText:");
  objc_msgSend(v211, "objectForKeyedSubscript:", CFSTR("designVersion"));
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v45 = v44;
  else
    v45 = 0;
  v46 = v45;

  -[AMSPaymentSheetRequest setDesignVersion:](v20, "setDesignVersion:", v46);
  objc_msgSend(v211, "objectForKeyedSubscript:", CFSTR("title"));
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v48 = v47;
  else
    v48 = 0;
  v49 = v48;

  if (v49)
  {
    objc_msgSend(v49, "objectForKeyedSubscript:", CFSTR("type"));
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v51 = v50;
    else
      v51 = 0;
    v52 = v51;

    if ((objc_msgSend(v52, "isEqualToString:", CFSTR("text")) & 1) != 0)
    {
      v53 = 0;
    }
    else if (objc_msgSend(v52, "isEqualToString:", CFSTR("enum")))
    {
      v53 = 1;
    }
    else
    {
      v53 = 2;
    }
    -[AMSPaymentSheetRequest setTitleType:](v20, "setTitleType:", v53);
    objc_msgSend(v49, "objectForKeyedSubscript:", CFSTR("value"));
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v55 = v54;
    else
      v55 = 0;
    v56 = v55;

    -[AMSPaymentSheetRequest setTitle:](v20, "setTitle:", v56);
  }
  -[AMSPaymentSheetRequest title](v20, "title");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = objc_msgSend(v57, "length");

  if (!v58)
  {
    objc_msgSend(v211, "objectForKeyedSubscript:", CFSTR("title"));
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v60 = v59;
    else
      v60 = 0;
    v61 = v60;

    if (v61)
    {
      -[AMSPaymentSheetRequest setTitle:](v20, "setTitle:", v61);
      -[AMSPaymentSheetRequest setTitleType:](v20, "setTitleType:", 0);
    }

  }
  objc_msgSend(v211, "objectForKeyedSubscript:", CFSTR("accountHeader"));
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v63 = v62;
  else
    v63 = 0;
  v64 = v63;

  -[AMSPaymentSheetRequest setAccountHeader:](v20, "setAccountHeader:", v64);
  if ((v43 & 1) == 0)
  {
    -[AMSPaymentSheetRequest accountHeader](v20, "accountHeader");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "localizedUppercaseString");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSPaymentSheetRequest setAccountHeader:](v20, "setAccountHeader:", v66);

  }
  objc_msgSend(v211, "objectForKeyedSubscript:", CFSTR("countryCode"));
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v68 = v67;
  else
    v68 = 0;
  v69 = v68;

  -[AMSPaymentSheetRequest setCountryCode:](v20, "setCountryCode:", v69);
  -[AMSPaymentSheetRequest countryCode](v20, "countryCode");
  v70 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v70)
    -[AMSPaymentSheetRequest setCountryCode:](v20, "setCountryCode:", CFSTR("US"));
  objc_msgSend(v211, "objectForKeyedSubscript:", CFSTR("currency"));
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v72 = v71;
  else
    v72 = 0;
  v73 = v72;

  -[AMSPaymentSheetRequest setCurrencyCode:](v20, "setCurrencyCode:", v73);
  -[AMSPaymentSheetRequest currencyCode](v20, "currencyCode");
  v74 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v74)
    -[AMSPaymentSheetRequest setCurrencyCode:](v20, "setCurrencyCode:", CFSTR("USD"));
  objc_msgSend(v211, "objectForKeyedSubscript:", CFSTR("price"));
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v76 = v75;
  else
    v76 = 0;
  v77 = v76;

  -[AMSPaymentSheetRequest setPrice:](v20, "setPrice:", v77);
  objc_msgSend(v211, "objectForKeyedSubscript:", CFSTR("displayPrice"));
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v79 = v78;
  else
    v79 = 0;
  v80 = v79;

  -[AMSPaymentSheetRequest setDisplayPrice:](v20, "setDisplayPrice:", v80);
  if ((v43 & 1) == 0)
  {
    -[AMSPaymentSheetRequest displayPrice](v20, "displayPrice");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v81, "localizedUppercaseString");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSPaymentSheetRequest setDisplayPrice:](v20, "setDisplayPrice:", v82);

  }
  objc_msgSend(v212, "options");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v83, "promptTitle");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSPaymentSheetRequest setExplanation:](v20, "setExplanation:", v84);

  objc_msgSend(v212, "options");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v85, "reason");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSPaymentSheetRequest setMessage:](v20, "setMessage:", v86);

  objc_msgSend(v211, "objectForKeyedSubscript:", CFSTR("priceSection"));
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v87)
  {
    objc_msgSend(v211, "objectForKeyedSubscript:", CFSTR("pricingSection"));
    v87 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v88 = v87;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v89 = v88;
  else
    v89 = 0;
  v90 = v89;

  v204 = v88;
  if (v90)
  {
    v91 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v220[0] = MEMORY[0x1E0C809B0];
    v220[1] = 3221225472;
    v220[2] = __175__AMSFinancePaymentSheetResponse_createRequestFromDictionary_confirmationOnly_delegateAuthenticationRequired_biometricSignatureRequired_authenticateResponse_taskInfo_account___block_invoke;
    v220[3] = &unk_1E2542238;
    v92 = v20;
    v221 = v92;
    v93 = v91;
    v222 = v93;
    objc_msgSend(v90, "enumerateObjectsUsingBlock:", v220);
    -[AMSPaymentSheetRequest setPriceSectionItems:](v92, "setPriceSectionItems:", v93);

  }
  if (-[AMSPaymentSheetRequest titleType](v20, "titleType") == 1)
    -[AMSPaymentSheetRequest setPayee:](v20, "setPayee:", objc_msgSend(v23, "_payeeInferredFromEnumeratedTitle:", v20));
  objc_msgSend(v211, "objectForKeyedSubscript:", CFSTR("salableIcon"));
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v203 = v90;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v95 = v94;
  else
    v95 = 0;
  v96 = v95;

  if (v96)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v96);
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSPaymentSheetRequest setSalableIconURL:](v20, "setSalableIconURL:", v97);

  }
  objc_msgSend(v211, "objectForKeyedSubscript:", CFSTR("salableIconType"));
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v99 = v98;
  else
    v99 = 0;
  v100 = v99;

  if (v100)
  {
    objc_msgSend(v100, "lowercaseString");
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSPaymentSheetRequest setSalableIcon:](v20, "setSalableIcon:", objc_msgSend(v23, "_salableIconForString:", v101));

  }
  v201 = v100;
  objc_msgSend(v211, "objectForKeyedSubscript:", CFSTR("storeName"));
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v202 = v96;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v103 = v102;
  else
    v103 = 0;
  v104 = v103;

  -[AMSPaymentSheetRequest setStoreName:](v20, "setStoreName:", v104);
  if ((v43 & 1) == 0)
  {
    -[AMSPaymentSheetRequest storeName](v20, "storeName");
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v105, "localizedUppercaseString");
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSPaymentSheetRequest setStoreName:](v20, "setStoreName:", v106);

  }
  objc_msgSend(v211, "objectForKeyedSubscript:", CFSTR("rating"));
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v108 = v107;
  else
    v108 = 0;
  v109 = v108;

  v210 = v109;
  objc_msgSend(v109, "objectForKeyedSubscript:", CFSTR("header"));
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v111 = v110;
  else
    v111 = 0;
  v112 = v111;

  -[AMSPaymentSheetRequest setRatingHeader:](v20, "setRatingHeader:", v112);
  objc_msgSend(v210, "objectForKeyedSubscript:", CFSTR("text"));
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v114 = v113;
  else
    v114 = 0;
  v115 = v114;

  -[AMSPaymentSheetRequest setRatingValue:](v20, "setRatingValue:", v115);
  if ((v43 & 1) == 0)
  {
    -[AMSPaymentSheetRequest ratingHeader](v20, "ratingHeader");
    v116 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v116, "localizedUppercaseString");
    v117 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSPaymentSheetRequest setRatingHeader:](v20, "setRatingHeader:", v117);

    -[AMSPaymentSheetRequest ratingValue](v20, "ratingValue");
    v118 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v118, "localizedUppercaseString");
    v119 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSPaymentSheetRequest setRatingValue:](v20, "setRatingValue:", v119);

  }
  objc_msgSend(v211, "objectForKeyedSubscript:", CFSTR("confirmationTitle"));
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v121 = v120;
  else
    v121 = 0;
  v122 = v121;

  if (v122)
  {
    objc_msgSend(v122, "lowercaseString");
    v123 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSPaymentSheetRequest setConfirmationTitle:](v20, "setConfirmationTitle:", objc_msgSend(v23, "_confirmationTitleForString:", v123));

  }
  objc_msgSend(v211, "objectForKeyedSubscript:", CFSTR("paymentSummary"));
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v200 = v122;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v125 = v124;
  else
    v125 = 0;
  v126 = v125;

  -[AMSPaymentSheetRequest setPaymentSummary:](v20, "setPaymentSummary:", v126);
  if ((v43 & 1) == 0)
  {
    -[AMSPaymentSheetRequest paymentSummary](v20, "paymentSummary");
    v127 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v127, "localizedUppercaseString");
    v128 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSPaymentSheetRequest setPaymentSummary:](v20, "setPaymentSummary:", v128);

  }
  objc_msgSend(v211, "objectForKeyedSubscript:", CFSTR("preSheetDialog"));
  v129 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v130 = v129;
  else
    v130 = 0;
  v131 = v215;
  v132 = v130;

  if (v132)
    goto LABEL_111;
  objc_msgSend(v211, "objectForKeyedSubscript:", CFSTR("preSheetDialog"));
  v145 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v146 = (objc_opt_isKindOfClass() & 1) != 0 ? v145 : 0;
  v198 = v146;

  if (v198)
  {
    v225[0] = v198;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v225, 1);
    v132 = (id)objc_claimAutoreleasedReturnValue();

    if (v132)
    {
LABEL_111:
      -[AMSPaymentSheetRequest designVersion](v20, "designVersion");
      v133 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "_flexListDictionaryForValues:styles:account:shouldUppercaseText:designVersion:", v132, 0, v217, v215, v133);
      v134 = (void *)objc_claimAutoreleasedReturnValue();
      -[AMSPaymentSheetRequest setPreSheetDialog:](v20, "setPreSheetDialog:", v134);

    }
  }
  objc_msgSend(v211, "objectForKeyedSubscript:", CFSTR("isApplePay"));
  v135 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v136 = v135;
  else
    v136 = 0;
  v137 = v136;

  v199 = v137;
  objc_msgSend(v137, "lowercaseString");
  v138 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v137) = objc_msgSend(v138, "isEqualToString:", CFSTR("true"));

  if ((_DWORD)v137)
    -[AMSPaymentSheetRequest setApplePayClassic:](v20, "setApplePayClassic:", 1);
  objc_msgSend(v211, "objectForKeyedSubscript:", CFSTR("styles"));
  v139 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v140 = v139;
  else
    v140 = 0;
  v141 = v140;

  if (v141)
    -[AMSPaymentSheetRequest setStyles:](v20, "setStyles:", v141);
  v216 = v141;
  objc_msgSend(v211, "objectForKeyedSubscript:", CFSTR("salableInfo"));
  v142 = (void *)objc_claimAutoreleasedReturnValue();

  if (v142)
  {
    objc_msgSend(v211, "objectForKeyedSubscript:", CFSTR("salableInfo"));
    v143 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v144 = v143;
    else
      v144 = 0;
    v147 = v144;

    -[AMSPaymentSheetRequest designVersion](v20, "designVersion");
    v148 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "_salableInfoDictionaryForValues:styles:account:shouldUppercaseText:designVersion:", v147, v141, v217, v131, v148);
    v149 = (void *)objc_claimAutoreleasedReturnValue();

    -[AMSPaymentSheetRequest setSalableInfo:](v20, "setSalableInfo:", v149);
    objc_msgSend(v23, "_attributedStringForSalableInfoStyledStringArray:account:shouldUppercase:", v149, v217, v131);
    v150 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSPaymentSheetRequest setSalableInfoLabel:](v20, "setSalableInfoLabel:", v150);

  }
  objc_msgSend(v211, "objectForKeyedSubscript:", CFSTR("secondarySheetInfo"));
  v151 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v152 = v151;
  else
    v152 = 0;
  v205 = v49;
  v153 = v152;

  if (v153)
  {
    objc_msgSend(v153, "objectForKeyedSubscript:", CFSTR("salableIcon"));
    v154 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v155 = v154;
    else
      v155 = 0;
    v156 = v155;

    if (v156)
      objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v156);
    else
      -[AMSPaymentSheetRequest salableIconURL](v20, "salableIconURL");
    v157 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSPaymentSheetRequest setSecondarySalableIconURL:](v20, "setSecondarySalableIconURL:", v157);

    objc_msgSend(v153, "objectForKeyedSubscript:", CFSTR("salableIconType"));
    v158 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v159 = v158;
    else
      v159 = 0;
    v160 = v159;

    if (v160)
    {
      objc_msgSend(v160, "lowercaseString");
      v161 = (void *)objc_claimAutoreleasedReturnValue();
      -[AMSPaymentSheetRequest setSecondarySalableIcon:](v20, "setSecondarySalableIcon:", objc_msgSend(v23, "_salableIconForString:", v161));

    }
    else
    {
      -[AMSPaymentSheetRequest setSecondarySalableIcon:](v20, "setSecondarySalableIcon:", -[AMSPaymentSheetRequest salableIcon](v20, "salableIcon"));
    }
    objc_msgSend(v23, "_salableInfoForKey:inDictionary:shouldUppercase:", CFSTR("salableInfo"), v153, v131);
    v162 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSPaymentSheetRequest setSecondarySalableInfo:](v20, "setSecondarySalableInfo:", v162);
    objc_msgSend(v23, "_attributedStringForSalableInfoStringArray:account:shouldUppercase:", v162, v217, v131);
    v163 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSPaymentSheetRequest setSecondarySalableInfoLabel:](v20, "setSecondarySalableInfoLabel:", v163);

    objc_msgSend(v153, "objectForKeyedSubscript:", CFSTR("flexList"));
    v164 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v165 = v164;
    else
      v165 = 0;
    v166 = v165;

    if (v166)
    {
      -[AMSPaymentSheetRequest designVersion](v20, "designVersion");
      v167 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "_flexListDictionaryForValues:styles:account:shouldUppercaseText:designVersion:", v166, v216, v217, v131, v167);
      v168 = (void *)objc_claimAutoreleasedReturnValue();
      -[AMSPaymentSheetRequest setSecondaryFlexList:](v20, "setSecondaryFlexList:", v168);

      v23 = a1;
    }

  }
  objc_msgSend(v211, "objectForKeyedSubscript:", CFSTR("images"));
  v169 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v170 = -[AMSPaymentSheetInlineImage initWithURLString:]([AMSPaymentSheetInlineImage alloc], "initWithURLString:", v169);
    v224 = v170;
    v171 = (void *)MEMORY[0x1E0C99D20];
    v172 = &v224;
LABEL_155:
    objc_msgSend(v171, "arrayWithObjects:count:", v172, 1);
    v173 = (id)objc_claimAutoreleasedReturnValue();
    -[AMSPaymentSheetRequest setInlineImages:](v20, "setInlineImages:", v173);
LABEL_156:

    goto LABEL_157;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v170 = -[AMSPaymentSheetInlineImage initWithDictionary:]([AMSPaymentSheetInlineImage alloc], "initWithDictionary:", v169);
    v223 = v170;
    v171 = (void *)MEMORY[0x1E0C99D20];
    v172 = &v223;
    goto LABEL_155;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v170 = (AMSPaymentSheetInlineImage *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v173 = v169;
    if (objc_msgSend(v173, "count"))
    {
      v218[0] = MEMORY[0x1E0C809B0];
      v218[1] = 3221225472;
      v218[2] = __175__AMSFinancePaymentSheetResponse_createRequestFromDictionary_confirmationOnly_delegateAuthenticationRequired_biometricSignatureRequired_authenticateResponse_taskInfo_account___block_invoke_2;
      v218[3] = &unk_1E2542260;
      v219 = v170;
      objc_msgSend(v173, "enumerateObjectsUsingBlock:", v218);

    }
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v170);
    v197 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSPaymentSheetRequest setInlineImages:](v20, "setInlineImages:", v197);

    goto LABEL_156;
  }
LABEL_157:
  objc_msgSend(v211, "objectForKeyedSubscript:", CFSTR("flexList"));
  v174 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v175 = v174;
  else
    v175 = 0;
  v176 = v175;

  if (v176)
  {
    -[AMSPaymentSheetRequest designVersion](v20, "designVersion");
    v177 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "_flexListDictionaryForValues:styles:account:shouldUppercaseText:designVersion:", v176, v216, v217, v131, v177);
    v178 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSPaymentSheetRequest setFlexList:](v20, "setFlexList:", v178);

    objc_msgSend(v23, "_attributedListDictionaryForValues:account:", v176, v217);
    v179 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSPaymentSheetRequest setAttributedList:](v20, "setAttributedList:", v179);

  }
  v180 = objc_alloc_init(MEMORY[0x1E0C99D68]);
  objc_msgSend(v180, "timeIntervalSince1970");
  v182 = v181;

  v183 = [AMSPaymentSheetPerformanceMetrics alloc];
  objc_msgSend(v213, "properties");
  v184 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v184, "bag");
  v185 = (void *)objc_claimAutoreleasedReturnValue();
  v186 = -[AMSPaymentSheetPerformanceMetrics initWithBag:](v183, "initWithBag:", v185);

  -[AMSPaymentSheetPerformanceMetrics setPrimaryDataParseStartTime:](v186, "setPrimaryDataParseStartTime:", v19);
  -[AMSPaymentSheetPerformanceMetrics setPrimaryDataParseEndTime:](v186, "setPrimaryDataParseEndTime:", v182);
  objc_msgSend(v213, "metrics");
  v187 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v187, "transactionMetrics");
  v188 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v188, "firstObject");
  v189 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v189, "responseStartDate");
  v190 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v190, "timeIntervalSince1970");
  -[AMSPaymentSheetPerformanceMetrics setPrimaryDataResponseStartTime:](v186, "setPrimaryDataResponseStartTime:");

  objc_msgSend(v213, "metrics");
  v191 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v191, "transactionMetrics");
  v192 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v192, "firstObject");
  v193 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v193, "responseEndDate");
  v194 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v194, "timeIntervalSince1970");
  -[AMSPaymentSheetPerformanceMetrics setPrimaryDataResponseEndTime:](v186, "setPrimaryDataResponseEndTime:");

  -[AMSPaymentSheetRequest setPerformanceMetrics:](v20, "setPerformanceMetrics:", v186);
  v195 = v20;

  return v195;
}

void __175__AMSFinancePaymentSheetResponse_createRequestFromDictionary_confirmationOnly_delegateAuthenticationRequired_biometricSignatureRequired_authenticateResponse_taskInfo_account___block_invoke(uint64_t a1, void *a2)
{
  AMSPaymentSheetPriceSectionItem *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;

  v10 = a2;
  v3 = objc_alloc_init(AMSPaymentSheetPriceSectionItem);
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("header"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;

  if ((objc_msgSend(*(id *)(a1 + 32), "shouldUppercaseText") & 1) != 0)
  {
    objc_msgSend(v5, "localizedUppercaseString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSPaymentSheetPriceSectionItem setLabel:](v3, "setLabel:", v6);

  }
  else
  {
    -[AMSPaymentSheetPriceSectionItem setLabel:](v3, "setLabel:", v5);
  }
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("value"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;

  if ((objc_msgSend(*(id *)(a1 + 32), "shouldUppercaseText") & 1) != 0)
  {
    objc_msgSend(v8, "localizedUppercaseString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSPaymentSheetPriceSectionItem setPrice:](v3, "setPrice:", v9);

  }
  else
  {
    -[AMSPaymentSheetPriceSectionItem setPrice:](v3, "setPrice:", v8);
  }
  objc_msgSend(*(id *)(a1 + 40), "addObject:", v3);

}

void __175__AMSFinancePaymentSheetResponse_createRequestFromDictionary_confirmationOnly_delegateAuthenticationRequired_biometricSignatureRequired_authenticateResponse_taskInfo_account___block_invoke_2(uint64_t a1, void *a2)
{
  AMSPaymentSheetInlineImage *v3;
  AMSPaymentSheetInlineImage *v4;
  id v5;

  v5 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = -[AMSPaymentSheetInlineImage initWithURLString:]([AMSPaymentSheetInlineImage alloc], "initWithURLString:", v5);
LABEL_5:
    v4 = v3;
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

    goto LABEL_6;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = -[AMSPaymentSheetInlineImage initWithDictionary:]([AMSPaymentSheetInlineImage alloc], "initWithDictionary:", v5);
    goto LABEL_5;
  }
LABEL_6:

}

+ (id)fallbackTitleFromResponse:(id)a3
{
  void *v3;
  id v4;
  id v5;
  id v6;
  void *v7;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("paymentSheetInfo"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("title"));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v6 = 0;
LABEL_9:
    v7 = 0;
    goto LABEL_10;
  }
  v6 = v5;

  if (!v6)
  {
    v7 = 0;
    goto LABEL_11;
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("fallback"));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_9;
  v5 = v5;
  v7 = v5;
LABEL_10:

LABEL_11:
  return v7;
}

- (AMSFinanceAuthenticateResponse)authenticateResponse
{
  return self->_authenticateResponse;
}

- (NSDictionary)metricsDictionary
{
  return self->_metricsDictionary;
}

- (AMSPaymentSheetRequest)paymentSheetRequest
{
  return self->_paymentSheetRequest;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_paymentSheetRequest, 0);
  objc_storeStrong((id *)&self->_metricsDictionary, 0);
  objc_storeStrong((id *)&self->_authenticateResponse, 0);
}

@end
