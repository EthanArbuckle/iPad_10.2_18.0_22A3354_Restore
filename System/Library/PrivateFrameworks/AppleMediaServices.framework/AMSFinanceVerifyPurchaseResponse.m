@implementation AMSFinanceVerifyPurchaseResponse

+ (BOOL)isVerifyPurchasePayload:(id)a3
{
  return objc_msgSend(a1, "_verifyTypeFromPayload:", a3) != 0;
}

+ (int64_t)_verifyTypeFromPayload:(id)a3
{
  void *v3;
  id v4;
  int64_t v5;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("failureType"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;

  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("machineVerificationFailed")) & 1) != 0)
  {
    v5 = 1;
  }
  else if (objc_msgSend(v4, "isEqualToString:", CFSTR("carrierBillingVerificationFailed")))
  {
    v5 = 2;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (AMSFinanceVerifyPurchaseResponse)initWithPayload:(id)a3 taskInfo:(id)a4
{
  id v7;
  id v8;
  int64_t v9;
  int64_t v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  AMSFinanceVerifyPurchaseResponse *v16;
  AMSFinanceVerifyPurchaseResponse *v17;
  AMSFinanceVerifyPurchaseResponse *v18;
  objc_super v20;
  uint8_t buf[4];
  uint64_t v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = +[AMSFinanceVerifyPurchaseResponse _verifyTypeFromPayload:](AMSFinanceVerifyPurchaseResponse, "_verifyTypeFromPayload:", v7);
  if (!v9)
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
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = objc_opt_class();
      AMSLogKey();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v22 = v14;
      v23 = 2114;
      v24 = v15;
      v25 = 2048;
      v26 = 0;
      _os_log_impl(&dword_18C849000, v13, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Unknown verify purchase type: %ld", buf, 0x20u);

    }
    v16 = 0;
    goto LABEL_15;
  }
  v10 = v9;
  if (v9 == 2)
  {
    +[AMSFinanceVerifyPurchaseResponse _dialogRequestForCarrierFromPayload:verifyType:](AMSFinanceVerifyPurchaseResponse, "_dialogRequestForCarrierFromPayload:verifyType:", v7, 2);
    v11 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v9 != 1)
    {
LABEL_16:
      v16 = 0;
      goto LABEL_17;
    }
    +[AMSFinanceVerifyPurchaseResponse _dialogRequestForCVVFromPayload:verifyType:](AMSFinanceVerifyPurchaseResponse, "_dialogRequestForCVVFromPayload:verifyType:", v7, 1);
    v11 = objc_claimAutoreleasedReturnValue();
  }
  v12 = (void *)v11;
  if (!v11)
    goto LABEL_16;
  v20.receiver = self;
  v20.super_class = (Class)AMSFinanceVerifyPurchaseResponse;
  v17 = -[AMSFinanceVerifyPurchaseResponse init](&v20, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_dialogRequest, v12);
    objc_storeStrong((id *)&v18->_responseDictionary, a3);
    objc_storeStrong((id *)&v18->_taskInfo, a4);
    v18->_verifyType = v10;
  }
  self = v18;
  v16 = self;
LABEL_15:

LABEL_17:
  return v16;
}

- (id)performWithTaskInfo:(id)a3
{
  void *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  char v12;
  uint64_t v13;
  char v14;
  char v15;
  __int128 v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  unsigned int v21;
  void *v22;
  NSObject *v23;
  uint64_t v24;
  void *v25;
  AMSPromise *v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  uint64_t v31;
  void *v32;
  int64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  NSObject *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  NSObject *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  __int128 v46;
  void *v47;
  id v48;
  void *v49;
  void *v50;
  id v51;
  char v52;
  uint8_t buf[4];
  uint64_t v54;
  __int16 v55;
  void *v56;
  __int16 v57;
  int64_t v58;
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v48 = a3;
  +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
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
    *(_DWORD *)buf = 138543874;
    v54 = v6;
    v55 = 2114;
    v56 = v7;
    v57 = 2048;
    v58 = -[AMSFinanceVerifyPurchaseResponse verifyType](self, "verifyType");
    _os_log_impl(&dword_18C849000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Performing verification with type: %ld", buf, 0x20u);

  }
  objc_msgSend(v48, "session");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "session");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "delegate");
  v49 = (void *)objc_claimAutoreleasedReturnValue();

  -[AMSFinanceVerifyPurchaseResponse dialogRequest](self, "dialogRequest");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[AMSFinanceVerifyPurchaseResponse verifyType](self, "verifyType"))
  {
    v10 = 0;
  }
  else
  {
    AMSError(2, CFSTR("Verify Dialog Error"), CFSTR("Unknown verify type"), 0);
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v48, "properties");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "dialogOptions");

  if ((v12 & 1) != 0)
  {
    AMSError(2, CFSTR("Finance Dialog Error"), CFSTR("Dialogs were suppressed by the caller"), 0);
    v13 = objc_claimAutoreleasedReturnValue();

    v10 = (id)v13;
  }
  v14 = objc_opt_respondsToSelector();
  v15 = objc_opt_respondsToSelector();
  if ((v14 & 1) == 0 && (v15 & 1) == 0)
  {
    AMSError(2, CFSTR("Verify Dialog Error"), CFSTR("No delegate to present the dialog"), 0);
    v17 = objc_claimAutoreleasedReturnValue();

    v10 = (id)v17;
  }
  v52 = 1;
  if (v10)
  {
    v18 = 0;
    v19 = 0;
    goto LABEL_50;
  }
  v19 = 0;
  v20 = 0;
  v21 = 0;
  *(_QWORD *)&v16 = 138543618;
  v46 = v16;
  v47 = v8;
  while (1)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig", v46);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v22)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v22, "OSLogObject");
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      v24 = objc_opt_class();
      AMSLogKey();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v54 = v24;
      v55 = 2114;
      v56 = v25;
      v57 = 2114;
      v58 = (int64_t)v50;
      _os_log_impl(&dword_18C849000, v23, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Presenting dialog: %{public}@", buf, 0x20u);

    }
    v26 = objc_alloc_init(AMSPromise);
    if ((v14 & 1) != 0)
    {
      objc_msgSend(v48, "task");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[AMSPromise completionHandlerAdapter](v26, "completionHandlerAdapter");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "AMSURLSession:task:handleDialogRequest:completion:", v8, v27, v50, v28);

    }
    else
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
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
        *(_DWORD *)buf = v46;
        v54 = v31;
        v55 = 2114;
        v56 = v32;
        _os_log_impl(&dword_18C849000, v30, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Calling legacy delegate for dialog handling", buf, 0x16u);

        v8 = v47;
      }

      -[AMSPromise completionHandlerAdapter](v26, "completionHandlerAdapter");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "AMSURLSession:handleDialogRequest:completion:", v8, v50, v27);
    }

    v51 = 0;
    -[AMSPromise resultWithTimeout:error:](v26, "resultWithTimeout:error:", &v51, 300.0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v51;

    if (v10)
      break;
    v33 = -[AMSFinanceVerifyPurchaseResponse verifyType](self, "verifyType");
    if (v33)
    {
      if (v33 == 2)
      {
        -[AMSFinanceVerifyPurchaseResponse _handleCarrierDialogResult:shouldReattempt:](self, "_handleCarrierDialogResult:shouldReattempt:", v18, &v52);
        v34 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (v33 != 1)
          goto LABEL_35;
        -[AMSFinanceVerifyPurchaseResponse _handleCVVDialogResult:shouldReattempt:](self, "_handleCVVDialogResult:shouldReattempt:", v18, &v52);
        v34 = objc_claimAutoreleasedReturnValue();
      }
      v35 = (void *)v34;

      v19 = v35;
    }
    else
    {
      v52 = 0;
    }
LABEL_35:
    v10 = 0;
    if (v52 && v21 >= 2)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v36)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v36, "OSLogObject");
      v37 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      {
        v38 = objc_opt_class();
        AMSLogKey();
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = v46;
        v54 = v38;
        v8 = v47;
        v55 = 2114;
        v56 = v39;
        _os_log_impl(&dword_18C849000, v37, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Max attempts reached", buf, 0x16u);

      }
      AMSError(6, CFSTR("Verify Dialog Error"), CFSTR("Max attempts reached, cancelling dialog"), 0);
      v10 = (id)objc_claimAutoreleasedReturnValue();
      v52 = 0;
    }

    if (!v10)
    {
      ++v21;
      v20 = v18;
      if (v52)
        continue;
    }
    goto LABEL_50;
  }
  +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v40)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v40, "OSLogObject");
  v41 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
  {
    v42 = objc_opt_class();
    AMSLogKey();
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    AMSLogableError(v10);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v54 = v42;
    v55 = 2114;
    v56 = v43;
    v57 = 2114;
    v58 = (int64_t)v44;
    _os_log_impl(&dword_18C849000, v41, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to present dialog. Error: %{public}@", buf, 0x20u);

    v8 = v47;
  }

LABEL_50:
  if (v10 && !v19)
  {
    +[AMSURLAction actionWithError:](AMSURLAction, "actionWithError:", v10);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v19, "setDialogResult:", v18);

  return v19;
}

+ (id)_dialogRequestForCarrierFromPayload:(id)a3 verifyType:(int64_t)a4
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v27;
  void *v28;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("customerTitleMessage"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("customerMessage"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;

  v27 = v8;
  v28 = v6;
  +[AMSDialogRequest requestWithTitle:message:](AMSDialogRequest, "requestWithTitle:message:", v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "ams_AppleMediaServicesBundle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("VERIFY_PAYMENT_ENTER_CODE"), &stru_1E2548760, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSDialogTextField textFieldWithPlaceholder:secure:](AMSDialogTextField, "textFieldWithPlaceholder:secure:", v11, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "setKeyboardType:", 2);
  objc_msgSend(v9, "addTextField:", v12);
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("failureClientInfo"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v14 = 0;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v14 = v13;

  objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("localization"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v16 = v15;
  else
    v16 = 0;

  objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("customerSubmitButtonMessage"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v18 = v17;
  else
    v18 = 0;

  if (objc_msgSend(v18, "length"))
  {
    +[AMSDialogAction actionWithTitle:](AMSDialogAction, "actionWithTitle:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setIdentifier:", CFSTR("customerSubmitButtonMessage"));
    objc_msgSend(v9, "addButtonAction:", v19);
    objc_msgSend(v9, "setDefaultAction:", v19);

  }
  objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("customerSendNewCodeButtonMessage"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v21 = v20;
  else
    v21 = 0;

  if (objc_msgSend(v21, "length"))
  {
    +[AMSDialogAction actionWithTitle:](AMSDialogAction, "actionWithTitle:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setIdentifier:", CFSTR("customerSendNewCodeButtonMessage"));
    objc_msgSend(v9, "addButtonAction:", v22);

  }
  objc_msgSend(MEMORY[0x1E0CB34D0], "ams_AppleMediaServicesBundle");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_1E2548760, 0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSDialogAction actionWithTitle:](AMSDialogAction, "actionWithTitle:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v25, "setStyle:", 2);
  objc_msgSend(v9, "addButtonAction:", v25);

  return v9;
}

+ (id)_dialogRequestForCVVFromPayload:(id)a3 verifyType:(int64_t)a4
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("customerTitleMessage"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("customerMessage"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;

  +[AMSDialogRequest requestWithTitle:message:](AMSDialogRequest, "requestWithTitle:message:", v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "ams_AppleMediaServicesBundle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("VERIFY_PAYMENT_ENTER_CVV"), &stru_1E2548760, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSDialogTextField textFieldWithPlaceholder:secure:](AMSDialogTextField, "textFieldWithPlaceholder:secure:", v11, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "setKeyboardType:", 2);
  objc_msgSend(v9, "addTextField:", v12);
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("dialog"));
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v14 = 0;
    goto LABEL_15;
  }
  v14 = v13;

  if (v14)
  {
    objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("okButtonString"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v13 = 0;
      goto LABEL_14;
    }
    v13 = v15;

    if (v13)
    {
      +[AMSDialogAction actionWithTitle:](AMSDialogAction, "actionWithTitle:", v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addButtonAction:", v15);
LABEL_14:

    }
LABEL_15:

  }
  objc_msgSend(MEMORY[0x1E0CB34D0], "ams_AppleMediaServicesBundle");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_1E2548760, 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSDialogAction actionWithTitle:](AMSDialogAction, "actionWithTitle:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "setStyle:", 2);
  objc_msgSend(v9, "addButtonAction:", v18);

  return v9;
}

- (id)_handleCarrierDialogResult:(id)a3 shouldReattempt:(BOOL *)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  id v19;
  id v20;
  id v21;
  NSObject *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  BOOL v26;
  void *v27;
  int v28;
  void *v29;
  NSObject *v30;
  void *v31;
  id v32;
  void *v33;
  id v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  NSObject *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  NSObject *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  NSObject *v51;
  uint64_t v52;
  void *v53;
  void *v55;
  NSObject *v56;
  BOOL *v57;
  void *v58;
  id v59;
  id v60;
  uint8_t buf[4];
  uint64_t v62;
  __int16 v63;
  void *v64;
  __int16 v65;
  id v66;
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  v6 = a3;
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
    v9 = objc_opt_class();
    AMSLogKey();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v62 = v9;
    v63 = 2114;
    v64 = v10;
    v65 = 2114;
    v66 = v6;
    _os_log_impl(&dword_18C849000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Handling CVV dialog result: %{public}@", buf, 0x20u);

  }
  objc_msgSend(v6, "originalRequest");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    v13 = v11;
  }
  else
  {
    -[AMSFinanceVerifyPurchaseResponse dialogRequest](self, "dialogRequest");
    v13 = (id)objc_claimAutoreleasedReturnValue();
  }
  v14 = v13;

  objc_msgSend(v6, "selectedActionIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "locateActionWithIdentifier:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "identifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "isEqualToString:", CFSTR("customerSendNewCodeButtonMessage"));

  if (!v18)
  {
    objc_msgSend(v16, "identifier");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "isEqualToString:", CFSTR("customerSubmitButtonMessage"));

    if (!v28)
    {
      v26 = 0;
      v25 = 0;
      if (!a4)
        goto LABEL_57;
      goto LABEL_56;
    }
    objc_msgSend(v6, "textfieldValues");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "firstObject");
    v20 = (id)objc_claimAutoreleasedReturnValue();

    if (!objc_msgSend(v20, "length"))
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v21 = (id)objc_claimAutoreleasedReturnValue();
      if (!v21)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v21 = (id)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v21, "OSLogObject");
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        v35 = objc_opt_class();
        AMSLogKey();
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v62 = v35;
        v63 = 2114;
        v64 = v36;
        _os_log_impl(&dword_18C849000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] No code provided, cancelling verification", buf, 0x16u);

      }
      v26 = 0;
      v25 = 0;
      goto LABEL_54;
    }
    v59 = 0;
    -[AMSFinanceVerifyPurchaseResponse _runCarrierVerifyCode:error:](self, "_runCarrierVerifyCode:error:", v20, &v59);
    v30 = objc_claimAutoreleasedReturnValue();
    v21 = v59;
    v56 = v30;
    -[NSObject object](v30, "object");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v32 = 0;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v32 = v31;

    v58 = v32;
    objc_msgSend(v32, "objectForKeyedSubscript:", CFSTR("failureType"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v34 = v33;
    else
      v34 = 0;

    v57 = a4;
    v37 = v34;
    if (!v34 && v21)
    {
      objc_msgSend(v21, "userInfo");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "objectForKeyedSubscript:", CFSTR("AMSServerErrorCode"));
      v39 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v39, "stringValue");
      v37 = (void *)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(v58, "objectForKeyedSubscript:", CFSTR("success"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = v40;
    if ((objc_opt_respondsToSelector() & 1) != 0 && (objc_msgSend(v40, "BOOLValue", v40) & 1) != 0)
    {
      v41 = v37;
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v42)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v42, "OSLogObject");
      v43 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
      {
        v44 = objc_opt_class();
        AMSLogKey();
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v62 = v44;
        v63 = 2114;
        v64 = v45;
        _os_log_impl(&dword_18C849000, v43, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Carrier verification succeeded", buf, 0x16u);

      }
      +[AMSURLAction retryAction](AMSURLAction, "retryAction");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setRetryIdentifier:", 0x1E2564300);
    }
    else
    {
      if (!v21 || objc_msgSend(v37, "length"))
      {
        v41 = v37;
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig", v55);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v46)
        {
          +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v46, "OSLogObject");
        v47 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
        {
          v48 = objc_opt_class();
          AMSLogKey();
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v62 = v48;
          v63 = 2114;
          v64 = v49;
          v65 = 2112;
          v66 = v41;
          _os_log_impl(&dword_18C849000, v47, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] User entered incorrect SMS code. (failureType: %@)", buf, 0x20u);

        }
        v25 = 0;
        v26 = 1;
        goto LABEL_53;
      }
      v41 = v37;
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v50)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v50, "OSLogObject", v55);
      v51 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
      {
        v52 = objc_opt_class();
        AMSLogKey();
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v62 = v52;
        v63 = 2114;
        v64 = v53;
        v65 = 2114;
        v66 = v21;
        _os_log_impl(&dword_18C849000, v51, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Carrier verification failed. %{public}@", buf, 0x20u);

      }
      +[AMSURLAction actionWithError:](AMSURLAction, "actionWithError:", v21);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v26 = 0;
LABEL_53:

    v22 = v56;
    a4 = v57;
    goto LABEL_54;
  }
  v60 = 0;
  v19 = -[AMSFinanceVerifyPurchaseResponse _runCarrierNewCodeWithError:](self, "_runCarrierNewCodeWithError:", &v60);
  v20 = v60;
  if (!v20)
  {
    v25 = 0;
    v26 = 1;
    goto LABEL_55;
  }
  +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
  v21 = (id)objc_claimAutoreleasedReturnValue();
  if (!v21)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v21 = (id)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v21, "OSLogObject");
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
  {
    v23 = objc_opt_class();
    AMSLogKey();
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v62 = v23;
    v63 = 2114;
    v64 = v24;
    v65 = 2114;
    v66 = v20;
    _os_log_impl(&dword_18C849000, v22, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to send new code. %{public}@", buf, 0x20u);

  }
  v25 = 0;
  v26 = 1;
LABEL_54:

LABEL_55:
  if (a4)
LABEL_56:
    *a4 = v26;
LABEL_57:

  return v25;
}

- (id)_handleCVVDialogResult:(id)a3 shouldReattempt:(BOOL *)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  NSObject *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  BOOL v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  id v29;
  void *v30;
  _UNKNOWN **v31;
  void *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  NSObject *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  NSObject *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v51;
  void *v52;
  void *v53;
  BOOL *v54;
  id v55;
  uint8_t buf[4];
  uint64_t v57;
  __int16 v58;
  void *v59;
  __int16 v60;
  id v61;
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v6 = a3;
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
    v9 = objc_opt_class();
    AMSLogKey();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v57 = v9;
    v58 = 2114;
    v59 = v10;
    v60 = 2114;
    v61 = v6;
    _os_log_impl(&dword_18C849000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Handling CVV dialog result: %{public}@", buf, 0x20u);

  }
  objc_msgSend(v6, "originalRequest");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    v13 = v11;
  }
  else
  {
    -[AMSFinanceVerifyPurchaseResponse dialogRequest](self, "dialogRequest");
    v13 = (id)objc_claimAutoreleasedReturnValue();
  }
  v14 = v13;

  objc_msgSend(v6, "selectedActionIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "locateActionWithIdentifier:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "textfieldValues");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "firstObject");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v18, "length") && objc_msgSend(v16, "style") != 2)
  {
    v52 = v14;
    v55 = 0;
    -[AMSFinanceVerifyPurchaseResponse _runCVVRequestForCode:error:](self, "_runCVVRequestForCode:error:", v18, &v55);
    v20 = objc_claimAutoreleasedReturnValue();
    v19 = v55;
    -[NSObject object](v20, "object");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v27 = 0;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v27 = v26;

    v53 = v27;
    objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("failureType"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v29 = v28;
    else
      v29 = 0;

    v54 = a4;
    v14 = v52;
    v30 = v29;
    if (v29)
    {
      v31 = &off_1E2519000;
    }
    else
    {
      v31 = &off_1E2519000;
      if (v19)
      {
        objc_msgSend(v19, "userInfo");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "objectForKeyedSubscript:", CFSTR("AMSServerErrorCode"));
        v33 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v33, "stringValue");
        v30 = (void *)objc_claimAutoreleasedReturnValue();

      }
    }
    v51 = v30;
    if ((objc_msgSend(v30, "isEqualToString:", CFSTR("5202")) & 1) != 0
      || objc_msgSend(v30, "isEqualToString:", CFSTR("2025")))
    {
      objc_msgSend(v31[274], "sharedConfig");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v34)
      {
        objc_msgSend(v31[274], "sharedConfig");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v34, "OSLogObject");
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      {
        v36 = objc_opt_class();
        AMSLogKey();
        v37 = v16;
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v57 = v36;
        v58 = 2114;
        v59 = v38;
        _os_log_impl(&dword_18C849000, v35, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Invalid verification code", buf, 0x16u);

        v16 = v37;
      }

      v25 = 0;
      v24 = 1;
    }
    else
    {
      objc_msgSend(v31[274], "sharedConfig");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      if (v19)
      {
        if (!v39)
        {
          objc_msgSend(v31[274], "sharedConfig");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
        }
        v40 = v39;
        objc_msgSend(v39, "OSLogObject");
        v41 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
        {
          v42 = objc_opt_class();
          AMSLogKey();
          v43 = v16;
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v57 = v42;
          v58 = 2114;
          v59 = v44;
          v60 = 2114;
          v61 = v19;
          _os_log_impl(&dword_18C849000, v41, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] CVV verification failed. %{public}@", buf, 0x20u);

          v16 = v43;
        }

        +[AMSURLAction actionWithError:](AMSURLAction, "actionWithError:", v19);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (!v39)
        {
          objc_msgSend(v31[274], "sharedConfig");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
        }
        v45 = v39;
        objc_msgSend(v39, "OSLogObject");
        v46 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
        {
          v47 = objc_opt_class();
          AMSLogKey();
          v48 = v16;
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v57 = v47;
          v58 = 2114;
          v59 = v49;
          _os_log_impl(&dword_18C849000, v46, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Verification succeeded", buf, 0x16u);

          v16 = v48;
        }

        +[AMSURLAction retryAction](AMSURLAction, "retryAction");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "setRetryIdentifier:", 0x1E25642E0);
      }
      v24 = 0;
    }

    a4 = v54;
  }
  else
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v19 = (id)objc_claimAutoreleasedReturnValue();
    if (!v19)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v19 = (id)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v19, "OSLogObject");
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      v21 = objc_opt_class();
      AMSLogKey();
      v22 = v16;
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v57 = v21;
      v58 = 2114;
      v59 = v23;
      _os_log_impl(&dword_18C849000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Dialog cancelled", buf, 0x16u);

      v16 = v22;
    }
    v24 = 0;
    v25 = 0;
  }

  if (a4)
    *a4 = v24;

  return v25;
}

- (id)_runCarrierNewCodeWithError:(id *)a3
{
  void *v5;
  void *v6;
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
  void *v17;
  const __CFString *v18;
  void *v19;
  AMSURLRequestEncoder *v20;
  void *v21;
  void *v22;
  void *v23;
  AMSURLRequestEncoder *v24;
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
  id v35;
  void *v36;
  AMSURLSession *v37;
  void *v38;
  AMSURLSession *v40;
  void *v41;
  id v42;
  id *v43;
  id v44;
  id v45;
  const __CFString *v46;
  _QWORD v47[2];

  v47[1] = *MEMORY[0x1E0C80C00];
  -[AMSFinanceVerifyPurchaseResponse responseDictionary](self, "responseDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("failureClientInfo"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("carrierBillingUrls"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v9 = v8;
  else
    v9 = 0;

  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("sendCodeUrl"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    v11 = 0;
    goto LABEL_12;
  }
  v11 = v10;

  if (!v11
    || (objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v11),
        (v12 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
LABEL_12:
    AMSError(2, CFSTR("Verify Purchase Failed"), CFSTR("No new code URL found"), 0);
    v13 = (id)objc_claimAutoreleasedReturnValue();
    v12 = 0;
    v14 = 0;
    v15 = 0;
    if (v13)
      goto LABEL_19;
  }
  v42 = v7;
  v43 = a3;
  v46 = CFSTR("guid");
  +[AMSDevice deviceGUID](AMSDevice, "deviceGUID");
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = (void *)v16;
  v18 = &stru_1E2548760;
  if (v16)
    v18 = (const __CFString *)v16;
  v47[0] = v18;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v47, &v46, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = [AMSURLRequestEncoder alloc];
  -[AMSFinanceVerifyPurchaseResponse taskInfo](self, "taskInfo");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "properties");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "bag");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = -[AMSURLRequestEncoder initWithBag:](v20, "initWithBag:", v23);

  -[AMSURLRequestEncoder setRequestEncoding:](v24, "setRequestEncoding:", 2);
  -[AMSFinanceVerifyPurchaseResponse taskInfo](self, "taskInfo");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "properties");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "account");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSURLRequestEncoder setAccount:](v24, "setAccount:", v27);

  -[AMSURLRequestEncoder setDialogOptions:](v24, "setDialogOptions:", 1);
  -[AMSFinanceVerifyPurchaseResponse taskInfo](self, "taskInfo");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "properties");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSURLRequestEncoder setParentProperties:](v24, "setParentProperties:", v29);

  -[AMSURLRequestEncoder requestWithMethod:URL:parameters:](v24, "requestWithMethod:URL:parameters:", 4, v12, v19);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = 0;
  objc_msgSend(v30, "resultWithError:", &v45);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v45;

  if (v13)
  {
    v15 = 0;
  }
  else
  {
    v40 = [AMSURLSession alloc];
    -[AMSFinanceVerifyPurchaseResponse taskInfo](self, "taskInfo");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "session");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "configuration");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSFinanceVerifyPurchaseResponse taskInfo](self, "taskInfo");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "session");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "delegate");
    v35 = v9;
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = -[AMSURLSession initWithConfiguration:delegate:delegateQueue:](v40, "initWithConfiguration:delegate:delegateQueue:", v32, v36, 0);

    v9 = v35;
    -[AMSURLSession dataTaskPromiseWithRequest:](v37, "dataTaskPromiseWithRequest:", v14);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = 0;
    objc_msgSend(v38, "resultWithError:", &v44);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v44;

  }
  v7 = v42;
  a3 = v43;
LABEL_19:
  if (a3)
    *a3 = objc_retainAutorelease(v13);

  return v15;
}

- (id)_runCarrierVerifyCode:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  const __CFString *v20;
  void *v21;
  AMSURLRequestEncoder *v22;
  void *v23;
  void *v24;
  void *v25;
  AMSURLRequestEncoder *v26;
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
  id v37;
  void *v38;
  AMSURLSession *v39;
  void *v40;
  AMSURLSession *v42;
  void *v43;
  id v44;
  id *v45;
  void *v46;
  id v47;
  id v48;
  _QWORD v49[2];
  _QWORD v50[3];

  v50[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[AMSFinanceVerifyPurchaseResponse responseDictionary](self, "responseDictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("failureClientInfo"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v9 = v8;
  else
    v9 = 0;

  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("carrierBillingUrls"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v11 = v10;
  else
    v11 = 0;

  v46 = v11;
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("verifyCodeUrl"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    v13 = 0;
    goto LABEL_12;
  }
  v13 = v12;

  if (!v13
    || (objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v13),
        (v14 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
LABEL_12:
    AMSError(2, CFSTR("Verify Purchase Failed"), CFSTR("No verify URL found"), 0);
    v15 = (id)objc_claimAutoreleasedReturnValue();
    v14 = 0;
    v16 = 0;
    v17 = 0;
    if (v15)
      goto LABEL_19;
  }
  v44 = v9;
  v45 = a4;
  v49[0] = CFSTR("guid");
  +[AMSDevice deviceGUID](AMSDevice, "deviceGUID");
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = (void *)v18;
  v20 = &stru_1E2548760;
  if (v18)
    v20 = (const __CFString *)v18;
  v49[1] = CFSTR("verificationCode");
  v50[0] = v20;
  v50[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v50, v49, 2);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = [AMSURLRequestEncoder alloc];
  -[AMSFinanceVerifyPurchaseResponse taskInfo](self, "taskInfo");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "properties");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "bag");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = -[AMSURLRequestEncoder initWithBag:](v22, "initWithBag:", v25);

  -[AMSURLRequestEncoder setRequestEncoding:](v26, "setRequestEncoding:", 2);
  -[AMSFinanceVerifyPurchaseResponse taskInfo](self, "taskInfo");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "properties");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "account");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSURLRequestEncoder setAccount:](v26, "setAccount:", v29);

  -[AMSFinanceVerifyPurchaseResponse taskInfo](self, "taskInfo");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "properties");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSURLRequestEncoder setParentProperties:](v26, "setParentProperties:", v31);

  -[AMSURLRequestEncoder requestWithMethod:URL:parameters:](v26, "requestWithMethod:URL:parameters:", 4, v14, v21);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = 0;
  objc_msgSend(v32, "resultWithError:", &v48);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v48;

  if (v15)
  {
    v17 = 0;
  }
  else
  {
    v42 = [AMSURLSession alloc];
    -[AMSFinanceVerifyPurchaseResponse taskInfo](self, "taskInfo");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "session");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "configuration");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSFinanceVerifyPurchaseResponse taskInfo](self, "taskInfo");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "session");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "delegate");
    v37 = v6;
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = -[AMSURLSession initWithConfiguration:delegate:delegateQueue:](v42, "initWithConfiguration:delegate:delegateQueue:", v34, v38, 0);

    v6 = v37;
    -[AMSURLSession dataTaskPromiseWithRequest:](v39, "dataTaskPromiseWithRequest:", v16);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = 0;
    objc_msgSend(v40, "resultWithError:", &v47);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v47;

  }
  v9 = v44;
  a4 = v45;
LABEL_19:
  if (a4)
    *a4 = objc_retainAutorelease(v15);

  return v17;
}

- (id)_runCVVRequestForCode:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  AMSURLRequestEncoder *v18;
  void *v19;
  void *v20;
  void *v21;
  AMSURLRequestEncoder *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  AMSURLSession *v35;
  void *v36;
  AMSURLSession *v38;
  void *v39;
  id *v40;
  id v41;
  id v42;
  _QWORD v43[3];
  _QWORD v44[4];

  v44[3] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[AMSFinanceVerifyPurchaseResponse responseDictionary](self, "responseDictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("nextActionUrl"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = v8;

    if (v9)
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
      {
LABEL_7:
        v40 = a4;
        v43[0] = CFSTR("guid");
        +[AMSDevice deviceGUID](AMSDevice, "deviceGUID");
        v14 = objc_claimAutoreleasedReturnValue();
        v15 = (void *)v14;
        if (v14)
          v16 = (const __CFString *)v14;
        else
          v16 = &stru_1E2548760;
        v44[0] = v16;
        v44[1] = v6;
        v43[1] = CFSTR("cvm");
        v43[2] = CFSTR("machineName");
        v44[2] = &stru_1E2548760;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v44, v43, 3);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        v18 = [AMSURLRequestEncoder alloc];
        -[AMSFinanceVerifyPurchaseResponse taskInfo](self, "taskInfo");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "properties");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "bag");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = -[AMSURLRequestEncoder initWithBag:](v18, "initWithBag:", v21);

        -[AMSURLRequestEncoder setRequestEncoding:](v22, "setRequestEncoding:", 2);
        -[AMSFinanceVerifyPurchaseResponse taskInfo](self, "taskInfo");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "properties");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "account");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        -[AMSURLRequestEncoder setAccount:](v22, "setAccount:", v25);

        -[AMSFinanceVerifyPurchaseResponse taskInfo](self, "taskInfo");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "properties");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        -[AMSURLRequestEncoder setParentProperties:](v22, "setParentProperties:", v27);

        -[AMSURLRequestEncoder requestWithMethod:URL:parameters:](v22, "requestWithMethod:URL:parameters:", 4, v10, v17);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = 0;
        objc_msgSend(v28, "resultWithError:", &v42);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v42;

        if (v11)
        {
          v13 = 0;
        }
        else
        {
          v38 = [AMSURLSession alloc];
          -[AMSFinanceVerifyPurchaseResponse taskInfo](self, "taskInfo");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "session");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "configuration");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          -[AMSFinanceVerifyPurchaseResponse taskInfo](self, "taskInfo");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "session");
          v32 = v6;
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "delegate");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = -[AMSURLSession initWithConfiguration:delegate:delegateQueue:](v38, "initWithConfiguration:delegate:delegateQueue:", v30, v34, 0);

          v6 = v32;
          -[AMSURLSession dataTaskPromiseWithRequest:](v35, "dataTaskPromiseWithRequest:", v12);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v41 = 0;
          objc_msgSend(v36, "resultWithError:", &v41);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = v41;

        }
        a4 = v40;
        goto LABEL_14;
      }
    }
  }
  else
  {

    v9 = 0;
  }
  AMSError(2, CFSTR("Verify Purchase Failed"), CFSTR("No verify URL"), 0);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  v12 = 0;
  v13 = 0;
  if (!v11)
    goto LABEL_7;
LABEL_14:
  if (a4)
    *a4 = objc_retainAutorelease(v11);

  return v13;
}

- (AMSDialogRequest)dialogRequest
{
  return self->_dialogRequest;
}

- (void)setDialogRequest:(id)a3
{
  objc_storeStrong((id *)&self->_dialogRequest, a3);
}

- (NSDictionary)responseDictionary
{
  return self->_responseDictionary;
}

- (void)setResponseDictionary:(id)a3
{
  objc_storeStrong((id *)&self->_responseDictionary, a3);
}

- (AMSURLTaskInfo)taskInfo
{
  return self->_taskInfo;
}

- (void)setTaskInfo:(id)a3
{
  objc_storeStrong((id *)&self->_taskInfo, a3);
}

- (int64_t)verifyType
{
  return self->_verifyType;
}

- (void)setVerifyType:(int64_t)a3
{
  self->_verifyType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_taskInfo, 0);
  objc_storeStrong((id *)&self->_responseDictionary, 0);
  objc_storeStrong((id *)&self->_dialogRequest, 0);
}

@end
