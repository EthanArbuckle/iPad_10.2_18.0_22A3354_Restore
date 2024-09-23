@implementation AMSFinanceDialogResponse

+ (int64_t)dialogKindForTaskInfo:(id)a3 withResponseDictionary:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  int64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  NSObject *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  int v26;
  uint64_t v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("dialog"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v9 = v8;
  else
    v9 = 0;

  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("paymentSheetInfo"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v11 = v10;
  else
    v11 = 0;

  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("kind"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v13 = v12;
  else
    v13 = 0;

  if ((objc_msgSend(v13, "isEqualToString:", CFSTR("authorization")) & 1) == 0)
  {
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("failureType"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("failureType"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "longLongValue");

      if (v16 == 2002)
        goto LABEL_13;
    }
    else
    {

    }
    if (v11)
    {
      v17 = 4;
    }
    else if (+[AMSFinanceVerifyPurchaseResponse isVerifyPurchasePayload:](AMSFinanceVerifyPurchaseResponse, "isVerifyPurchasePayload:", v7))
    {
      v17 = 5;
    }
    else
    {
      v17 = v9 != 0;
    }
    goto LABEL_32;
  }
LABEL_13:
  if (v11)
  {
    if (+[AMSFinanceExpressCheckoutResponse isExpressCheckoutPayload:](AMSFinanceExpressCheckoutResponse, "isExpressCheckoutPayload:", v7))
    {
      v17 = 7;
    }
    else if (+[AMSFinanceDelegateAuthenticateChallengeResponse isDelegateAuthChallengeForTaskInfo:](AMSFinanceDelegateAuthenticateChallengeResponse, "isDelegateAuthChallengeForTaskInfo:", v6))
    {
      v17 = 6;
    }
    else
    {
      v17 = 3;
    }
  }
  else
  {
    v18 = objc_msgSend(v6, "previousAuthorizationCredentialSource");
    objc_msgSend(v6, "response");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v18) = objc_msgSend(a1, "_credentialSource:satisfiesAuthenticationType:", v18, +[AMSFinanceAuthenticateResponse authenticationTypeForResponse:responseDictionary:](AMSFinanceAuthenticateResponse, "authenticationTypeForResponse:responseDictionary:", v19, v7));

    if ((_DWORD)v18)
    {
      +[AMSLogConfig sharedAccountsConfig](AMSLogConfig, "sharedAccountsConfig");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v20)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v20, "OSLogObject");
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        v22 = objc_opt_class();
        AMSLogKey();
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        AMSHashIfNeeded(v9);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = 138543874;
        v27 = v22;
        v28 = 2114;
        v29 = v23;
        v30 = 2114;
        v31 = v24;
        _os_log_impl(&dword_18C849000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Encountered a redundant authorization dialog. dialogDictionary = %{public}@", (uint8_t *)&v26, 0x20u);

      }
      v17 = 1;
    }
    else
    {
      v17 = 2;
    }
  }
LABEL_32:

  return v17;
}

- (AMSFinanceDialogResponse)initWithResponseDictionary:(id)a3 kind:(int64_t)a4 taskInfo:(id)a5
{
  id v9;
  id v10;
  void *v11;
  id v12;
  AMSFinanceDialogResponse *v13;
  AMSFinanceDialogResponse *v14;
  AMSFinanceDialogResponse *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  id v19;
  void *v20;
  objc_super v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a5;
  +[AMSFinanceResponse valueForProtocolKey:inResponse:](AMSFinanceResponse, "valueForProtocolKey:inResponse:", CFSTR("dialog"), v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v12 = v11;

    if (v12)
    {
      v22.receiver = self;
      v22.super_class = (Class)AMSFinanceDialogResponse;
      v13 = -[AMSFinanceDialogResponse init](&v22, sel_init);
      v14 = v13;
      if (v13)
      {
        objc_storeStrong((id *)&v13->_responseDictionary, a3);
        objc_storeStrong((id *)&v14->_dialogDictionary, v11);
        v14->_kind = a4;
        objc_storeStrong((id *)&v14->_taskInfo, a5);
      }
      self = v14;
      v15 = self;
      goto LABEL_10;
    }
  }
  else
  {

  }
  +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "OSLogObject");
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    v18 = (void *)objc_opt_class();
    v19 = v18;
    AMSLogKey();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v24 = v18;
    v25 = 2114;
    v26 = v20;
    _os_log_impl(&dword_18C849000, v17, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Attempting to initialize a finance dialog without a dictionary", buf, 0x16u);

  }
  v12 = 0;
  v15 = 0;
LABEL_10:

  return v15;
}

- (AMSDialogRequest)dialogRequest
{
  AMSDialogRequest *dialogRequest;
  AMSDialogRequest *v4;
  AMSDialogRequest *v5;

  dialogRequest = self->_dialogRequest;
  if (!dialogRequest)
  {
    -[AMSFinanceDialogResponse _createDialogRequest](self, "_createDialogRequest");
    v4 = (AMSDialogRequest *)objc_claimAutoreleasedReturnValue();
    v5 = self->_dialogRequest;
    self->_dialogRequest = v4;

    dialogRequest = self->_dialogRequest;
  }
  return dialogRequest;
}

+ (id)handleDialogResult:(id)a3 taskInfo:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  AMSHandleDialogResultTask *v21;
  void *v22;
  void *v23;
  AMSHandleDialogResultTask *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "originalRequest");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "selectedActionIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "locateActionWithIdentifier:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "deepLink");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "ams_actionType") == 11)
  {
    objc_msgSend(a1, "_serviceActionFromButton:taskInfo:", v10, v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (v11)
  {
    if (objc_msgSend(v10, "ams_actionType") == 12)
    {
      objc_msgSend(v7, "properties");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "account");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "_handleAskPermissionRequestWithURL:account:", v11, v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      +[AMSURLAction actionWithError:](AMSURLAction, "actionWithError:", v15);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      v16 = 0;
      v17 = 0;
    }
    else if (objc_msgSend(v10, "ams_actionType") == 5)
    {
      +[AMSFinanceActionResponse handleExternalGotoURL:](AMSFinanceActionResponse, "handleExternalGotoURL:", v11);
      v16 = 0;
      v17 = 0;
      v12 = 0;
    }
    else
    {
      +[AMSFinanceActionResponse handleGotoURL:taskInfo:gotoType:accountURL:tidContinue:retryOnSuccess:](AMSFinanceActionResponse, "handleGotoURL:taskInfo:gotoType:accountURL:tidContinue:retryOnSuccess:", v11, v7, objc_msgSend(v10, "ams_actionType"), objc_msgSend(v10, "ams_commerceUIURL"), objc_msgSend(v10, "ams_tidContinue"), objc_msgSend(v10, "ams_shouldRetry"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v18, "interruptionResult");
      objc_msgSend(v18, "action");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "updatedBuyParams");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v18, "action");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(v10, "setDeepLink:", 0);
    objc_msgSend(v10, "ams_setResolvedInterruption:", v16);
    objc_msgSend(v10, "ams_setBuyParams:", v17);
    objc_msgSend(v6, "originalRequest");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "replaceAction:", v10);

  }
  else
  {
    v12 = 0;
  }
  v21 = [AMSHandleDialogResultTask alloc];
  objc_msgSend(v7, "properties");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "bag");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = -[AMSHandleDialogResultTask initWithResult:bag:](v21, "initWithResult:bag:", v6, v23);

  -[AMSTask setRunMode:](v24, "setRunMode:", 1);
  objc_msgSend(v7, "properties");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "account");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSHandleDialogResultTask setAccount:](v24, "setAccount:", v26);

  objc_msgSend(v7, "properties");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "clientInfo");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "proxyAppBundleID");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSHandleDialogResultTask setProxyBundleId:](v24, "setProxyBundleId:", v29);

  objc_msgSend(v7, "properties");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "clientInfo");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSHandleDialogResultTask setClientInfo:](v24, "setClientInfo:", v31);

  -[AMSHandleDialogResultTask perform](v24, "perform");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "waitUntilFinished");

  if (!v12)
  {
    +[AMSURLAction proceedAction](AMSURLAction, "proceedAction");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v12, "setDialogResult:", v6);

  return v12;
}

+ (id)performFinanceDialog:(id)a3 taskInfo:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  NSObject *v16;
  os_log_type_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  void *v25;
  char v26;
  id v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  NSObject *v32;
  uint64_t v33;
  void *v34;
  uint64_t v36;
  id v37;
  id v38;
  uint8_t buf[4];
  uint64_t v40;
  __int16 v41;
  void *v42;
  __int16 v43;
  id v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "properties");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "dialogOptions");

  if ((v9 & 1) != 0)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v11)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v11, "OSLogObject");
    v12 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      goto LABEL_9;
    v13 = objc_opt_class();
    AMSLogKey();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v40 = v13;
    v41 = 2114;
    v42 = v14;
    v15 = "%{public}@: [%{public}@] Dialogs were suppressed by the caller";
    v16 = v12;
    v17 = OS_LOG_TYPE_ERROR;
    goto LABEL_8;
  }
  objc_msgSend(v6, "title");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v10, "length"))
  {
    objc_msgSend(v6, "message");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "length");

    if (v20)
      goto LABEL_12;
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v11)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v11, "OSLogObject");
    v12 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
LABEL_9:

LABEL_10:
      +[AMSURLAction proceedAction](AMSURLAction, "proceedAction");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_25;
    }
    v36 = objc_opt_class();
    AMSLogKey();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v40 = v36;
    v41 = 2114;
    v42 = v14;
    v15 = "%{public}@: [%{public}@] Suppressing blank dialog (no title & no message)";
    v16 = v12;
    v17 = OS_LOG_TYPE_DEFAULT;
LABEL_8:
    _os_log_impl(&dword_18C849000, v16, v17, v15, buf, 0x16u);

    goto LABEL_9;
  }

LABEL_12:
  if (objc_msgSend(a1, "_shouldSendOverIDS:taskInfo:", v6, v7))
  {
    objc_msgSend(a1, "_presentIDSDialog:taskInfo:", v6, v7);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "resultWithError:", 0);

    if (v22)
      goto LABEL_10;
  }
  objc_msgSend(v7, "properties");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "purchaseInfo");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "activePurchaseTask");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = 0;
  v26 = objc_msgSend(v25, "performPreActionRequestForTaskInfo:requiresAuthorization:error:", v7, 0, &v38);
  v27 = v38;

  if ((v26 & 1) != 0 || !v27)
  {
    objc_msgSend(a1, "_presentDialog:taskInfo:", v6, v7);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = 0;
    objc_msgSend(v28, "resultWithError:", &v37);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v37;

    if (v30)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v31)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v31, "OSLogObject");
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        v33 = objc_opt_class();
        AMSLogKey();
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v40 = v33;
        v41 = 2114;
        v42 = v34;
        v43 = 2114;
        v44 = v30;
        _os_log_impl(&dword_18C849000, v32, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] An error occurred during dialog presentation %{public}@", buf, 0x20u);

      }
    }
    objc_msgSend(a1, "handleDialogResult:taskInfo:", v29, v7);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    +[AMSURLAction actionWithError:](AMSURLAction, "actionWithError:", v27);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }

LABEL_25:
  return v18;
}

- (id)performWithTaskInfo:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[AMSFinanceDialogResponse dialogRequest](self, "dialogRequest");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSFinanceDialogResponse performFinanceDialog:taskInfo:](AMSFinanceDialogResponse, "performFinanceDialog:taskInfo:", v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (int64_t)_actionTypeFromButtonDictionary:(id)a3
{
  id v3;
  void *v4;
  id v5;
  int64_t v6;

  v3 = a3;
  objc_msgSend(v3, "objectForKey:", CFSTR("kind"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(v3, "objectForKey:", CFSTR("action"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    if ((objc_msgSend(v5, "isEqualToString:", CFSTR("Buy")) & 1) != 0)
    {
      v6 = 4;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("OpenURL")) & 1) != 0)
    {
      v6 = 5;
    }
    else if (objc_msgSend(v5, "caseInsensitiveCompare:", CFSTR("goback")))
    {
      if ((objc_msgSend(v5, "isEqualToString:", CFSTR("QRCode")) & 1) != 0)
      {
        v6 = 7;
      }
      else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("redeem-code")) & 1) != 0)
      {
        v6 = 8;
      }
      else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("RetryRestoreAll")) & 1) != 0)
      {
        v6 = 10;
      }
      else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("Review")) & 1) != 0)
      {
        v6 = 9;
      }
      else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("Goto")) & 1) != 0)
      {
        v6 = 1;
      }
      else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("GotoFinance")) & 1) != 0)
      {
        v6 = 2;
      }
      else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("GotoFinanceV2")) & 1) != 0)
      {
        v6 = 3;
      }
      else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("ServiceAction")) & 1) != 0)
      {
        v6 = 11;
      }
      else if (objc_msgSend(v5, "isEqualToString:", CFSTR("FamilyPermissionAction")))
      {
        v6 = 12;
      }
      else
      {
        v6 = 0;
      }
    }
    else
    {
      v6 = 6;
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)_createActionFromButtonDictionary:(id)a3 title:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  unint64_t v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  AMSDialogRequest *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  NSObject *v44;
  id v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  id v52;
  id v53;
  id v54;
  uint8_t buf[4];
  void *v56;
  __int16 v57;
  void *v58;
  __int16 v59;
  void *v60;
  __int16 v61;
  void *v62;
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  +[AMSDialogAction actionWithTitle:](AMSDialogAction, "actionWithTitle:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "ams_setButtonDictionary:", v6);
  objc_msgSend(v7, "ams_setActionType:", -[AMSFinanceDialogResponse _actionTypeFromButtonDictionary:](self, "_actionTypeFromButtonDictionary:", v6));
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("retry"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("retry"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "ams_setShouldRetry:", objc_msgSend(v9, "BOOLValue"));

  }
  else
  {
    objc_msgSend(v7, "ams_setShouldRetry:", 0);
  }

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("subtarget"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v11 = v10;
  else
    v11 = 0;

  objc_msgSend(v7, "ams_setSubtarget:", v11);
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("tidContinue"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("tidContinue"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "ams_setTidContinue:", objc_msgSend(v13, "BOOLValue"));

  }
  else
  {
    objc_msgSend(v7, "ams_setTidContinue:", 0);
  }

  if ((objc_msgSend(v7, "ams_tidContinue") & 1) != 0)
  {
    v14 = 1;
  }
  else
  {
    objc_msgSend(v7, "ams_subtarget");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v15, "hasPrefix:", CFSTR("account")) & 1) != 0)
    {
      v14 = 1;
    }
    else if (objc_msgSend(v15, "hasPrefix:", CFSTR("background")))
    {
      v14 = 2;
    }
    else
    {
      v14 = 0;
    }

  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("url"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v17 = v16;

    if (v17)
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_23;
    }
  }
  else
  {

    v17 = 0;
  }
  v18 = 0;
LABEL_23:
  objc_msgSend(v7, "ams_setURLType:", v14);
  switch(objc_msgSend(v7, "ams_actionType"))
  {
    case 1:
    case 2:
    case 3:
      if (v14 < 2)
      {
        if (-[AMSFinanceDialogResponse _isCommerceUIURL:actionType:URLType:](self, "_isCommerceUIURL:actionType:URLType:", v18, objc_msgSend(v7, "ams_actionType"), v14))
        {
          objc_msgSend(v7, "ams_setCommerceUIURL:", 1);
        }
        goto LABEL_27;
      }
      if (v18)
      {
        objc_msgSend(MEMORY[0x1E0C92C80], "requestWithURL:", v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setRequest:", v19);

      }
      else
      {
        objc_msgSend(v7, "setRequest:", 0);
      }
      break;
    case 5:
      objc_msgSend(v7, "setDeepLink:", v18);
      objc_msgSend(v7, "setInferLinkDestination:", 0);
      break;
    case 7:
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("message"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v21 = v20;
      else
        v21 = 0;

      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("explanation"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v23 = v18;
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v24 = v22;
      else
        v24 = 0;

      v25 = v21;
      v26 = -[AMSDialogRequest initWithTitle:message:]([AMSDialogRequest alloc], "initWithTitle:message:", v21, v24);
      AMSLogKey();
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[AMSDialogRequest setLogKey:](v26, "setLogKey:", v27);

      -[AMSDialogRequest userInfo](v26, "userInfo");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = (void *)objc_msgSend(v28, "mutableCopy");
      v30 = v29;
      if (v29)
        v31 = v29;
      else
        v31 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v32 = v31;

      objc_msgSend(v32, "setObject:forKeyedSubscript:", v6, CFSTR("AMSDialogRequestUserInfoKeyServerPayload"));
      -[AMSDialogRequest setUserInfo:](v26, "setUserInfo:", v32);
      objc_msgSend(v7, "setDialogRequest:", v26);

      v18 = v23;
      break;
    case 12:
LABEL_27:
      objc_msgSend(v7, "setDeepLink:", v18);
      break;
    default:
      break;
  }
  objc_msgSend(v7, "deepLink");
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  if (v33)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v34)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v34, "OSLogObject");
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      v36 = v6;
      v37 = v18;
      v38 = (void *)objc_opt_class();
      v52 = v38;
      AMSSetLogKeyIfNeeded();
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "deepLink");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      AMSHashIfNeeded(v40);
      v41 = v17;
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v56 = v38;
      v18 = v37;
      v6 = v36;
      v57 = 2114;
      v58 = v39;
      v59 = 2114;
      v60 = v42;
      _os_log_impl(&dword_18C849000, v35, OS_LOG_TYPE_DEFAULT, "%{public}@ [%{public}@] Button Deep-Link URL: %{public}@", buf, 0x20u);

      v17 = v41;
    }

  }
  +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig", v52);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v43)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v43, "OSLogObject");
  v44 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
  {
    v45 = v17;
    v46 = (void *)objc_opt_class();
    v53 = v46;
    AMSSetLogKeyIfNeeded();
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = v6;
    v48 = v18;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v7, "ams_commerceUIURL"));
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v7, "ams_resolvedInterruption"));
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v56 = v46;
    v17 = v45;
    v57 = 2114;
    v58 = v47;
    v59 = 2114;
    v60 = v49;
    v61 = 2114;
    v62 = v50;
    _os_log_impl(&dword_18C849000, v44, OS_LOG_TYPE_DEFAULT, "%{public}@ [%{public}@] Button CommerceUIURL: %{public}@, ResolvedInterruption: %{public}@", buf, 0x2Au);

    v18 = v48;
    v6 = v54;

  }
  return v7;
}

- (id)_createDialogRequest
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  AMSDialogRequest *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  AMSMetricsEvent *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v42;

  -[AMSFinanceDialogResponse taskInfo](self, "taskInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "properties");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "account");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[AMSFinanceDialogResponse dialogDictionary](self, "dialogDictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("message"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;

  objc_msgSend(v5, "username");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "ams_replaceAccountPatternWithUsername:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[AMSFinanceDialogResponse dialogDictionary](self, "dialogDictionary");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("explanation"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v13 = v12;
  else
    v13 = 0;

  objc_msgSend(v5, "username");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "ams_replaceAccountPatternWithUsername:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = -[AMSDialogRequest initWithTitle:message:]([AMSDialogRequest alloc], "initWithTitle:message:", v10, v15);
  AMSLogKey();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSDialogRequest setLogKey:](v16, "setLogKey:", v17);

  -[AMSDialogRequest userInfo](v16, "userInfo");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v18, "mutableCopy");
  v20 = v19;
  if (v19)
    v21 = v19;
  else
    v21 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v22 = v21;

  -[AMSFinanceDialogResponse dialogDictionary](self, "dialogDictionary");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setObject:forKeyedSubscript:", v23, CFSTR("AMSDialogRequestUserInfoKeyServerPayload"));

  -[AMSDialogRequest setUserInfo:](v16, "setUserInfo:", v22);
  -[AMSFinanceDialogResponse responseDictionary](self, "responseDictionary");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("metrics"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v26 = v25;

    if (!v26)
      goto LABEL_15;
    -[AMSFinanceDialogResponse _enrichedMetricsDictionaryWithFinanceDictionary:](self, "_enrichedMetricsDictionaryWithFinanceDictionary:", v26);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = -[AMSMetricsEvent initWithUnderlyingDictionary:]([AMSMetricsEvent alloc], "initWithUnderlyingDictionary:", v25);
    -[AMSDialogRequest setMetricsEvent:](v16, "setMetricsEvent:", v27);

  }
  else
  {
    v26 = 0;
  }

LABEL_15:
  objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("dialogId"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v29 = v28;

    if (v29)
      -[AMSDialogRequest setIdentifier:](v16, "setIdentifier:", v29);
  }
  else
  {

    v29 = 0;
  }
  -[AMSFinanceDialogResponse dialogDictionary](self, "dialogDictionary");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSFinanceDialogResponse _createRequestButtonsFromDialogDictionary:](self, "_createRequestButtonsFromDialogDictionary:", v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSDialogRequest setButtonActions:](v16, "setButtonActions:", v31);

  -[AMSFinanceDialogResponse dialogDictionary](self, "dialogDictionary");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "objectForKeyedSubscript:", CFSTR("preventsCancelButtonStyle"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[AMSFinanceDialogResponse dialogDictionary](self, "dialogDictionary");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "objectForKeyedSubscript:", CFSTR("preventsCancelButtonStyle"));
    v42 = v29;
    v35 = v26;
    v36 = v22;
    v37 = v15;
    v38 = v5;
    v39 = v10;
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSDialogRequest setPreventsCancelButtonStyle:](v16, "setPreventsCancelButtonStyle:", objc_msgSend(v40, "BOOLValue"));

    v10 = v39;
    v5 = v38;
    v15 = v37;
    v22 = v36;
    v26 = v35;
    v29 = v42;

  }
  else
  {
    -[AMSDialogRequest setPreventsCancelButtonStyle:](v16, "setPreventsCancelButtonStyle:", 0);
  }

  return v16;
}

- (id)_enrichedMetricsDictionaryWithFinanceDictionary:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)objc_msgSend(a3, "mutableCopy");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", &unk_1E25AF560, CFSTR("eventVersion"));
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

- (id)_createRequestButtonsFromDialogDictionary:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  const __CFString *v16;
  int v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  const __CFString *v28;
  const __CFString *v29;
  const __CFString *v30;
  const __CFString *v31;
  const __CFString *v32;
  _QWORD v33[2];

  v33[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("okButtonString"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = v6;

    if (v7)
    {
LABEL_7:
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("okButtonAction"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v9 = v8;
      else
        v9 = 0;

      -[AMSFinanceDialogResponse _createActionFromButtonDictionary:title:](self, "_createActionFromButtonDictionary:title:", v9, v7);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = CFSTR("targetId");
      v33[0] = CFSTR("OK");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v33, &v32, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "ams_setMetricsDictionary:", v11);

      objc_msgSend(v5, "addObject:", v10);
      goto LABEL_11;
    }
  }
  else
  {

  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("okButton"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = v7;

    if (!v7)
      goto LABEL_12;
    goto LABEL_7;
  }
LABEL_11:

LABEL_12:
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("cancelButtonString"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v13 = v12;

    if (v13)
    {
LABEL_18:
      v15 = v5;
      v16 = CFSTR("cancelButtonAction");
      v17 = 1;
LABEL_23:
      objc_msgSend(v4, "objectForKeyedSubscript:", v16);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v20 = v19;
      else
        v20 = 0;

      -[AMSFinanceDialogResponse _createActionFromButtonDictionary:title:](self, "_createActionFromButtonDictionary:title:", v20, v13);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setStyle:", 2);
      v30 = CFSTR("targetId");
      v31 = CFSTR("Cancel");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v31, &v30, 1);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "ams_setMetricsDictionary:", v22);

      objc_msgSend(v15, "addObject:", v21);
      if (v17)
      {
        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("otherButtonString"));
        v23 = (id)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v18 = 0;
          v5 = v15;
LABEL_37:

          goto LABEL_38;
        }
        v18 = v23;

        if (v18)
        {
          objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("otherButtonAction"));
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          v5 = v15;
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v23 = v24;
          else
            v23 = 0;

          -[AMSFinanceDialogResponse _createActionFromButtonDictionary:title:](self, "_createActionFromButtonDictionary:title:", v23, v18);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = CFSTR("targetId");
          v29 = CFSTR("Other");
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v29, &v28, 1);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "ams_setMetricsDictionary:", v26);

          objc_msgSend(v5, "addObject:", v25);
          goto LABEL_37;
        }
        v5 = v15;
LABEL_38:

        goto LABEL_39;
      }
      v5 = v15;
      goto LABEL_39;
    }
  }
  else
  {

  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("cancelButton"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v13 = v14;

    if (v13)
      goto LABEL_18;
  }
  else
  {

  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("otherButtonString"));
  v18 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v13 = 0;
    goto LABEL_38;
  }
  v13 = v18;

  if (v13)
  {
    v15 = v5;
    v17 = 0;
    v16 = CFSTR("otherButtonAction");
    goto LABEL_23;
  }
LABEL_39:

  return v5;
}

+ (BOOL)_credentialSource:(unint64_t)a3 satisfiesAuthenticationType:(unint64_t)a4
{
  BOOL v4;

  v4 = a4 < 2;
  if (a3 != 5)
    v4 = 0;
  return a3 == 2 || v4;
}

+ (id)_handleAskPermissionRequestWithURL:(id)a3 account:(id)a4
{
  id v5;
  id v6;
  AMSMutableBinaryPromise *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  AMSMutableBinaryPromise *v17;
  id v18;
  id v20;
  _QWORD v21[4];
  AMSMutableBinaryPromise *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;
  _BYTE buf[24];
  void *v28;
  uint64_t *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = objc_alloc_init(AMSMutableBinaryPromise);
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
    v11 = v10;
    AMSLogKey();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    AMSLogableURL(v5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    *(_QWORD *)&buf[4] = v10;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v12;
    *(_WORD *)&buf[22] = 2112;
    v28 = v13;
    _os_log_impl(&dword_18C849000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Starting ask permission request: %@", buf, 0x20u);

  }
  v23 = 0;
  v24 = &v23;
  v25 = 0x2050000000;
  v14 = (void *)_MergedGlobals_106;
  v26 = _MergedGlobals_106;
  v15 = MEMORY[0x1E0C809B0];
  if (!_MergedGlobals_106)
  {
    *(_QWORD *)buf = MEMORY[0x1E0C809B0];
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = __getAPRequestHandlerClass_block_invoke;
    v28 = &unk_1E253DDB8;
    v29 = &v23;
    __getAPRequestHandlerClass_block_invoke((uint64_t)buf);
    v14 = (void *)v24[3];
  }
  v16 = objc_retainAutorelease(v14);
  _Block_object_dispose(&v23, 8);
  v21[0] = v15;
  v21[1] = 3221225472;
  v21[2] = __71__AMSFinanceDialogResponse__handleAskPermissionRequestWithURL_account___block_invoke;
  v21[3] = &unk_1E253E120;
  v17 = v7;
  v22 = v17;
  objc_msgSend(v16, "addRequestWithURL:account:completion:", v5, v6, v21);
  v20 = 0;
  -[AMSBinaryPromise resultWithError:](v17, "resultWithError:", &v20);
  v18 = v20;
  if (!v18)
  {
    AMSError(512, CFSTR("Family permission unknown error"), &stru_1E2548760, 0);
    v18 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v18;
}

void __71__AMSFinanceDialogResponse__handleAskPermissionRequestWithURL_account___block_invoke(uint64_t a1, uint64_t a2)
{
  __CFString *v3;
  uint64_t v4;
  id v5;

  if (a2)
  {
    v3 = CFSTR("Family permission failed");
    v4 = 512;
  }
  else
  {
    v3 = CFSTR("Family permission required");
    v4 = 511;
  }
  AMSError(v4, v3, 0, 0);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "finishWithError:", v5);

}

- (BOOL)_isCommerceUIURL:(id)a3 actionType:(int64_t)a4 URLType:(int64_t)a5
{
  id v8;
  char v9;
  AMSURLParser *v10;
  void *v11;
  void *v12;
  void *v13;
  AMSURLParser *v14;
  void *v15;
  id v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  id v22;
  uint8_t buf[4];
  uint64_t v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  if (!v8)
    goto LABEL_13;
  if ((a4 & 0xFFFFFFFFFFFFFFFELL) == 2)
  {
LABEL_3:
    v9 = 1;
    goto LABEL_14;
  }
  if (a4 != 1)
  {
LABEL_13:
    v9 = 0;
    goto LABEL_14;
  }
  if (a5 == 1)
    goto LABEL_3;
  v10 = [AMSURLParser alloc];
  -[AMSFinanceDialogResponse taskInfo](self, "taskInfo");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "properties");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "bag");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[AMSURLParser initWithBag:](v10, "initWithBag:", v13);

  -[AMSURLParser isCommerceUIURL:](v14, "isCommerceUIURL:", v8);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0;
  v9 = objc_msgSend(v15, "resultWithError:", &v22);
  v16 = v22;

  if (v16)
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
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v19 = objc_opt_class();
      AMSLogKey();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v24 = v19;
      v25 = 2114;
      v26 = v20;
      v27 = 2114;
      v28 = v16;
      _os_log_impl(&dword_18C849000, v18, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to determine if is commerce URL. %{public}@", buf, 0x20u);

    }
  }

LABEL_14:
  return v9;
}

+ (id)_presentDialog:(id)a3 taskInfo:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  char v10;
  char v11;
  void *v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  id v21;
  void *v22;
  AMSPromise *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  _BOOL4 v28;
  void *v29;
  NSObject *v30;
  NSObject *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  _QWORD v39[5];
  uint8_t buf[4];
  uint64_t v41;
  __int16 v42;
  void *v43;
  __int16 v44;
  id v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "session");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_opt_respondsToSelector();
  v11 = objc_opt_respondsToSelector();
  if ((v10 & 1) == 0 && (v11 & 1) == 0)
  {
    AMSError(2, CFSTR("Finance Dialog Error"), CFSTR("No delegate to present the dialog"), 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v13)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v13, "OSLogObject");
    v14 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      goto LABEL_17;
    v15 = objc_opt_class();
    AMSLogKey();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v41 = v15;
    v42 = 2114;
    v43 = v16;
    v44 = 2114;
    v45 = v12;
    v17 = "%{public}@: [%{public}@] Failed to present dialog (no delegate). %{public}@";
LABEL_16:
    _os_log_impl(&dword_18C849000, v14, OS_LOG_TYPE_ERROR, v17, buf, 0x20u);

LABEL_17:
    +[AMSPromise promiseWithError:](AMSPromise, "promiseWithError:", v12);
    v23 = (AMSPromise *)objc_claimAutoreleasedReturnValue();

    goto LABEL_27;
  }
  if (!v6)
  {
    AMSError(2, CFSTR("Finance Dialog Failed"), CFSTR("No dialog request"), 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v13)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v13, "OSLogObject");
    v14 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      goto LABEL_17;
    v27 = objc_opt_class();
    AMSLogKey();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v41 = v27;
    v42 = 2114;
    v43 = v16;
    v44 = 2114;
    v45 = v12;
    v17 = "%{public}@: [%{public}@] Failed to present dialog (no request). %{public}@";
    goto LABEL_16;
  }
  +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "OSLogObject");
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    v20 = (void *)objc_opt_class();
    v21 = v20;
    AMSLogKey();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v41 = (uint64_t)v20;
    v42 = 2114;
    v43 = v22;
    v44 = 2114;
    v45 = v6;
    _os_log_impl(&dword_18C849000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Presenting dialog: %{public}@", buf, 0x20u);

  }
  v23 = -[AMSPromise initWithTimeout:]([AMSPromise alloc], "initWithTimeout:", 300.0);
  if ((v10 & 1) != 0)
  {
    objc_msgSend(v7, "session");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "task");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSPromise completionHandlerAdapter](v23, "completionHandlerAdapter");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "AMSURLSession:task:handleDialogRequest:completion:", v24, v25, v6, v26);

  }
  else
  {
    v28 = +[AMSUnitTests isRunningUnitTests](AMSUnitTests, "isRunningUnitTests");
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "OSLogObject");
    v30 = objc_claimAutoreleasedReturnValue();
    v31 = v30;
    if (v28)
    {
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        v32 = (void *)objc_opt_class();
        v33 = v32;
        AMSLogKey();
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v41 = (uint64_t)v32;
        v42 = 2114;
        v43 = v34;
        _os_log_impl(&dword_18C849000, v31, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Calling legacy delegate for dialog handling", buf, 0x16u);

      }
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "postNotificationName:object:userInfo:", CFSTR("com.apple.AppleMediaServicesTests.FaultLogged"), 0, 0);
    }
    else
    {
      if (os_log_type_enabled(v30, OS_LOG_TYPE_FAULT))
      {
        v35 = (void *)objc_opt_class();
        v36 = v35;
        AMSLogKey();
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v41 = (uint64_t)v35;
        v42 = 2114;
        v43 = v37;
        _os_log_impl(&dword_18C849000, v31, OS_LOG_TYPE_FAULT, "%{public}@: [%{public}@] Calling legacy delegate for dialog handling", buf, 0x16u);

      }
    }

    objc_msgSend(v7, "session");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSPromise completionHandlerAdapter](v23, "completionHandlerAdapter");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "AMSURLSession:handleDialogRequest:completion:", v24, v6, v25);
  }

  v39[0] = MEMORY[0x1E0C809B0];
  v39[1] = 3221225472;
  v39[2] = __52__AMSFinanceDialogResponse__presentDialog_taskInfo___block_invoke;
  v39[3] = &__block_descriptor_40_e37_v24__0__AMSDialogResult_8__NSError_16l;
  v39[4] = a1;
  -[AMSPromise addFinishBlock:](v23, "addFinishBlock:", v39);
LABEL_27:

  return v23;
}

void __52__AMSFinanceDialogResponse__presentDialog_taskInfo___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  NSObject *v11;
  os_log_type_t v12;
  uint32_t v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (a2)
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
      AMSLogKey();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543618;
      v16 = v8;
      v17 = 2114;
      v18 = v9;
      v10 = "%{public}@: [%{public}@] Dialog succeeded.";
      v11 = v7;
      v12 = OS_LOG_TYPE_DEFAULT;
      v13 = 22;
LABEL_10:
      _os_log_impl(&dword_18C849000, v11, v12, v10, (uint8_t *)&v15, v13);

    }
  }
  else
  {
    if (!v5)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v6, "OSLogObject");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v14 = objc_opt_class();
      AMSLogKey();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543874;
      v16 = v14;
      v17 = 2114;
      v18 = v9;
      v19 = 2114;
      v20 = v4;
      v10 = "%{public}@: [%{public}@] Dialog failed. %{public}@";
      v11 = v7;
      v12 = OS_LOG_TYPE_ERROR;
      v13 = 32;
      goto LABEL_10;
    }
  }

}

+ (id)_presentIDSDialog:(id)a3 taskInfo:(id)a4
{
  void *v4;
  void *v5;

  AMSError(11, CFSTR("IDS Not Supported"), CFSTR("Invalid platform"), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSBinaryPromise promiseWithError:](AMSBinaryPromise, "promiseWithError:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)_serviceActionFromButton:(id)a3 taskInfo:(id)a4
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  id v11;
  NSObject *v12;
  id v13;
  NSObject *v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v25;
  void *v26;
  void *v27;
  id v28;
  const __CFString *v29;
  const __CFString *v30;
  uint8_t buf[4];
  uint64_t v32;
  __int16 v33;
  uint64_t v34;
  __int16 v35;
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "ams_buttonDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("url"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = v6;

      if (v7)
      {
        objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v7);
        v8 = objc_claimAutoreleasedReturnValue();
        if (v8)
        {
          v9 = v8;
          objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("dialogData"));
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v11 = v10;

            if (v11)
            {
              if (objc_msgSend(MEMORY[0x1E0CB36D8], "isValidJSONObject:", v11))
              {
                v28 = 0;
                objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v11, 0, &v28);
                v12 = objc_claimAutoreleasedReturnValue();
                v13 = v28;
                if (!v13)
                {
LABEL_35:

                  goto LABEL_36;
                }
                +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
                v14 = objc_claimAutoreleasedReturnValue();
                if (!v14)
                {
                  +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
                  v14 = objc_claimAutoreleasedReturnValue();
                }
                -[NSObject OSLogObject](v14, "OSLogObject");
                v15 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
                {
                  v16 = objc_opt_class();
                  AMSLogKey();
                  v17 = objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138543874;
                  v32 = v16;
                  v33 = 2114;
                  v34 = v17;
                  v18 = (void *)v17;
                  v35 = 2114;
                  v36 = v13;
                  _os_log_impl(&dword_18C849000, v15, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Service action dialog data encountered JSON error: %{public}@", buf, 0x20u);

                }
              }
              else
              {
                +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
                v13 = (id)objc_claimAutoreleasedReturnValue();
                if (!v13)
                {
                  +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
                  v13 = (id)objc_claimAutoreleasedReturnValue();
                }
                objc_msgSend(v13, "OSLogObject");
                v14 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
                {
                  v25 = objc_opt_class();
                  AMSLogKey();
                  v26 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138543618;
                  v32 = v25;
                  v33 = 2114;
                  v34 = (uint64_t)v26;
                  _os_log_impl(&dword_18C849000, v14, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Service action dialog data not JSON compatible", buf, 0x16u);

                }
                v12 = 0;
              }

              goto LABEL_35;
            }
          }
          else
          {

            v11 = 0;
          }
          v12 = 0;
LABEL_36:
          +[AMSURLAction redirectActionWithURL:](AMSURLAction, "redirectActionWithURL:", v9);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "setUpdatedMethod:", CFSTR("POST"));
          objc_msgSend(v21, "setUpdatedBody:", v12);
          v29 = CFSTR("Content-Type");
          v30 = CFSTR("application/json");
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v30, &v29, 1);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "setUpdatedHeaders:", v27);

LABEL_25:
          goto LABEL_26;
        }
      }
    }
    else
    {

      v7 = 0;
    }
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v9 = objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v9 = objc_claimAutoreleasedReturnValue();
    }
    -[NSObject OSLogObject](v9, "OSLogObject");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v22 = objc_opt_class();
      AMSLogKey();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v32 = v22;
      v33 = 2114;
      v34 = (uint64_t)v23;
      _os_log_impl(&dword_18C849000, v12, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to locate URL for service action", buf, 0x16u);

    }
    v21 = 0;
    goto LABEL_25;
  }
  +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v7, "OSLogObject");
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    v19 = objc_opt_class();
    AMSLogKey();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v32 = v19;
    v33 = 2114;
    v34 = (uint64_t)v20;
    _os_log_impl(&dword_18C849000, v9, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to locate button dictionary for service action", buf, 0x16u);

  }
  v21 = 0;
LABEL_26:

  return v21;
}

+ (BOOL)_shouldSendOverIDS:(id)a3 taskInfo:(id)a4
{
  return 0;
}

- (NSDictionary)dialogDictionary
{
  return self->_dialogDictionary;
}

- (BOOL)containsCommerceUIURL
{
  return self->_containsCommerceUIURL;
}

- (int64_t)kind
{
  return self->_kind;
}

- (void)setKind:(int64_t)a3
{
  self->_kind = a3;
}

- (NSDictionary)responseDictionary
{
  return self->_responseDictionary;
}

- (AMSURLTaskInfo)taskInfo
{
  return self->_taskInfo;
}

- (void)setTaskInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_taskInfo, 0);
  objc_storeStrong((id *)&self->_responseDictionary, 0);
  objc_storeStrong((id *)&self->_dialogRequest, 0);
  objc_storeStrong((id *)&self->_dialogDictionary, 0);
}

@end
