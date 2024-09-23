@implementation AMSPurchaseProtocolHandler

- (AMSPurchaseProtocolHandler)init
{
  AMSPurchaseProtocolHandler *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AMSPurchaseProtocolHandler;
  result = -[AMSURLProtocolHandler init](&v3, sel_init);
  if (result)
    result->_propertiesLock._os_unfair_lock_opaque = 0;
  return result;
}

- (void)setSession:(id)a3
{
  os_unfair_lock_s *p_propertiesLock;
  id v5;
  objc_super v6;

  p_propertiesLock = &self->_propertiesLock;
  v5 = a3;
  os_unfair_lock_lock_with_options();
  objc_msgSend(v5, "setDelegate:", self);
  v6.receiver = self;
  v6.super_class = (Class)AMSPurchaseProtocolHandler;
  -[AMSURLProtocolHandler setSession:](&v6, sel_setSession_, v5);

  os_unfair_lock_unlock(p_propertiesLock);
}

- (void)handleCompletionWithTask:(id)a3 metrics:(id)a4 decodedObject:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  objc_super v28;
  _QWORD v29[5];
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  v13 = a4;
  +[AMSURLTaskInfo taskInfoForTask:](AMSURLTaskInfo, "taskInfoForTask:", v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "properties");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "purchaseInfo");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = v11;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v18 = v17;
  else
    v18 = 0;

  objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("failureType"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "account");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSPurchaseProtocolHandler _updateSubscriptionStatusFromBody:account:](self, "_updateSubscriptionStatusFromBody:account:", v18, v20);

  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __95__AMSPurchaseProtocolHandler_handleCompletionWithTask_metrics_decodedObject_completionHandler___block_invoke;
  v29[3] = &unk_1E2544E48;
  v29[4] = self;
  v30 = v18;
  v31 = v16;
  v32 = v14;
  v33 = v10;
  v34 = v19;
  v35 = v17;
  v36 = v12;
  v28.receiver = self;
  v28.super_class = (Class)AMSPurchaseProtocolHandler;
  v21 = v12;
  v22 = v17;
  v23 = v19;
  v24 = v10;
  v25 = v14;
  v26 = v16;
  v27 = v18;
  -[AMSURLProtocolHandler handleCompletionWithTask:metrics:decodedObject:completionHandler:](&v28, sel_handleCompletionWithTask_metrics_decodedObject_completionHandler_, v24, v13, v22, v29);

}

void __95__AMSPurchaseProtocolHandler_handleCompletionWithTask_metrics_decodedObject_completionHandler___block_invoke(id *a1, void *a2)
{
  void *v2;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  __CFString *v8;
  __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  id v31;
  id v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  id v41;
  void *v42;
  _BOOL4 v43;
  void *v44;
  uint64_t v45;
  void *v46;
  id v47;
  _QWORD v48[4];
  id v49;
  id v50;
  id v51;
  id v52;
  id v53;
  id v54;
  id v55;
  id v56;
  uint64_t *v57;
  uint64_t v58;
  uint64_t *v59;
  uint64_t v60;
  uint64_t (*v61)(uint64_t, uint64_t);
  void (*v62)(uint64_t);
  id v63;
  uint8_t buf[4];
  void *v65;
  __int16 v66;
  void *v67;
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  v58 = 0;
  v59 = &v58;
  v60 = 0x3032000000;
  v61 = __Block_byref_object_copy__58;
  v62 = __Block_byref_object_dispose__58;
  v63 = a2;
  v47 = v63;
  objc_msgSend(v63, "dialogResult");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend((id)v59[5], "dialogResult");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "selectedActionIdentifier");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v6;
    v8 = CFSTR("AMSDialogResultDismissIdentifier");
    if (v6)
      v8 = (__CFString *)v6;
    v9 = v8;

    objc_msgSend((id)v59[5], "dialogResult");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "originalRequest");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "locateActionWithIdentifier:", v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      if ((objc_msgSend(v12, "ams_resolvedInterruption") & 1) != 0 || objc_msgSend(v12, "ams_actionType") == 4)
      {
        v13 = (void *)v59[5];
        if (!v13 || objc_msgSend(v13, "actionType") != 2)
        {
          +[AMSURLAction retryAction](AMSURLAction, "retryAction");
          v14 = objc_claimAutoreleasedReturnValue();
          v15 = (void *)v59[5];
          v59[5] = v14;

        }
        v16 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v12, "identifier");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "stringWithFormat:", CFSTR("%@-%@"), 0x1E2564280, v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)v59[5], "setRetryIdentifier:", v18);
      }
      else
      {
        if (objc_msgSend(v12, "style") != 2)
          goto LABEL_13;
        objc_msgSend((id)v59[5], "error");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v42)
          goto LABEL_13;
        v43 = objc_msgSend((id)v59[5], "actionType") == 3;

        if (!v43)
          goto LABEL_13;
        objc_msgSend((id)v59[5], "error");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        AMSError(6, CFSTR("Purchase Cancelled"), CFSTR("The dialog was cancelled"), v44);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        +[AMSURLAction actionWithError:](AMSURLAction, "actionWithError:", v17);
        v45 = objc_claimAutoreleasedReturnValue();
        v18 = (void *)v59[5];
        v59[5] = v45;
      }

    }
  }
  else
  {
    v12 = 0;
  }
LABEL_13:
  objc_msgSend(a1[4], "_determineUpdatedBuyParamsFromResponse:urlAction:selectedAction:purchaseInfo:", a1[5], v59[5], v12, a1[6]);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v19)
    goto LABEL_36;
  +[AMSLogConfig sharedPurchaseConfig](AMSLogConfig, "sharedPurchaseConfig");
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
    objc_msgSend(a1[6], "purchase");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "logUUID");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)MEMORY[0x1E0CB3940];
    if (v22)
    {
      v24 = objc_opt_class();
      objc_msgSend(a1[6], "purchase");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "logUUID");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "stringWithFormat:", CFSTR("%@: [%@] "), v24, v2);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: "), objc_opt_class());
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = v26;
    }
    AMSHashIfNeeded(v19);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v65 = v26;
    v66 = 2114;
    v67 = v27;
    _os_log_impl(&dword_18C849000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@Response determined updated buyParams = %{public}@", buf, 0x16u);
    if (v22)
    {

    }
  }

  objc_msgSend(a1[6], "setBuyParams:", v19);
  v28 = a1[4];
  objc_msgSend(a1[7], "properties");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "account");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "_updatePasswordSettingWithBuyParams:account:", v19, v30);

  if (!+[AMSPurchaseRequestEncoder isRedirectBagURLOverrideEnabled](AMSPurchaseRequestEncoder, "isRedirectBagURLOverrideEnabled"))goto LABEL_36;
  v31 = a1[4];
  v32 = a1[6];
  objc_msgSend(a1[7], "properties");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "bag");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = v59[5];
  objc_msgSend(a1[8], "currentRequest");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "URL");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "_shouldRedirectWithPurchaseInfo:bag:urlAction:currentURL:", v32, v34, v35, v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v38)
  {
LABEL_36:
    if (v59[5])
      +[AMSOptional optionalWithValue:](AMSOptional, "optionalWithValue:");
    else
      +[AMSOptional optionalWithNil](AMSOptional, "optionalWithNil");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", v39);
    v38 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v48[0] = MEMORY[0x1E0C809B0];
  v48[1] = 3221225472;
  v48[2] = __95__AMSPurchaseProtocolHandler_handleCompletionWithTask_metrics_decodedObject_completionHandler___block_invoke_50;
  v48[3] = &unk_1E2544E20;
  v57 = &v58;
  v49 = a1[9];
  v40 = a1[8];
  v41 = a1[4];
  v50 = v40;
  v51 = v41;
  v52 = a1[10];
  v53 = a1[5];
  v54 = a1[6];
  v55 = a1[7];
  v56 = a1[11];
  objc_msgSend(v38, "addFinishBlock:", v48);

  _Block_object_dispose(&v58, 8);
}

void __95__AMSPurchaseProtocolHandler_handleCompletionWithTask_metrics_decodedObject_completionHandler___block_invoke_50(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  unint64_t v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  AMSOptional *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  _QWORD v36[4];
  id v37;
  uint8_t buf[4];
  void *v39;
  __int16 v40;
  uint64_t v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  objc_msgSend(v5, "value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v5, "value");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 96) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

  }
  if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40), "actionType") == 2
    || objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40), "actionType") == 1
    || !*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(*(id *)(a1 + 48), "_syncKeybagFromResponse:purchaseInfo:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72));
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "response");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v11 = v10;
    else
      v11 = 0;

    if (objc_msgSend(*(id *)(a1 + 48), "_shouldRetryForFailureAction:response:task:decodedObject:responseDictionary:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40), v11, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64)))
    {
      +[AMSURLAction retryAction](AMSURLAction, "retryAction");
      v31 = objc_claimAutoreleasedReturnValue();
      v32 = *(_QWORD *)(*(_QWORD *)(a1 + 96) + 8);
      v33 = *(void **)(v32 + 40);
      *(_QWORD *)(v32 + 40) = v31;

    }
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v12 = objc_msgSend(*(id *)(a1 + 32), "integerValue") & 0xFFFFFFFFFFFFFFFDLL;
    v13 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40);
    if (!v13)
    {
      if (v12 != 1001)
        goto LABEL_24;
      goto LABEL_17;
    }
  }
  else
  {
    v13 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40);
    if (!v13)
      goto LABEL_24;
    v12 = 0;
  }
  if (objc_msgSend(v13, "actionType") != 3 || v12 != 1001)
  {
    v22 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40);
    if (v22 && objc_msgSend(v22, "actionType"))
      goto LABEL_28;
LABEL_24:
    objc_msgSend(*(id *)(a1 + 64), "objectForKeyedSubscript:", CFSTR("cancel-purchase-batch"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 64), "objectForKeyedSubscript:", CFSTR("cancel-purchase-batch"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "BOOLValue");

      if (!v25)
      {
LABEL_28:
        v29 = -[AMSOptional initWithValue:]([AMSOptional alloc], "initWithValue:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40));
        +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", v29);
        v30 = objc_claimAutoreleasedReturnValue();
        goto LABEL_38;
      }
      AMSError(305, CFSTR("Purchase Failed"), CFSTR("Server canceled the purchase"), 0);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      +[AMSURLAction actionWithError:](AMSURLAction, "actionWithError:", v23);
      v26 = objc_claimAutoreleasedReturnValue();
      v27 = *(_QWORD *)(*(_QWORD *)(a1 + 96) + 8);
      v28 = *(void **)(v27 + 40);
      *(_QWORD *)(v27 + 40) = v26;

    }
    goto LABEL_28;
  }
LABEL_17:
  +[AMSLogConfig sharedPurchaseConfig](AMSLogConfig, "sharedPurchaseConfig");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v14)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v14, "OSLogObject");
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 72), "purchase");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "logUUID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)MEMORY[0x1E0CB3940];
    v19 = objc_opt_class();
    v20 = v19;
    if (v17)
    {
      objc_msgSend(*(id *)(a1 + 72), "purchase");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "logUUID");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "stringWithFormat:", CFSTR("%@: [%@] "), v20, v3);
    }
    else
    {
      objc_msgSend(v18, "stringWithFormat:", CFSTR("%@: "), v19);
    }
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543618;
    v39 = v21;
    v40 = 2114;
    v41 = v34;
    _os_log_impl(&dword_18C849000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@Response has failureType %{public}@, authenticating…", buf, 0x16u);
    if (v17)
    {

      v21 = v2;
    }

  }
  objc_msgSend(*(id *)(a1 + 80), "response");
  v29 = (AMSOptional *)objc_claimAutoreleasedReturnValue();
  +[AMSFinanceAuthenticateResponse performAuthFromResponse:taskInfo:](AMSFinanceAuthenticateResponse, "performAuthFromResponse:taskInfo:", v29, *(_QWORD *)(a1 + 80));
  v30 = objc_claimAutoreleasedReturnValue();
LABEL_38:
  v35 = (void *)v30;

  v36[0] = MEMORY[0x1E0C809B0];
  v36[1] = 3221225472;
  v36[2] = __95__AMSPurchaseProtocolHandler_handleCompletionWithTask_metrics_decodedObject_completionHandler___block_invoke_61;
  v36[3] = &unk_1E2542E40;
  v37 = *(id *)(a1 + 88);
  objc_msgSend(v35, "addFinishBlock:", v36);

}

void __95__AMSPurchaseProtocolHandler_handleCompletionWithTask_metrics_decodedObject_completionHandler___block_invoke_61(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(a2, "value");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

}

- (void)reconfigureNewRequest:(id)a3 originalTask:(id)a4 redirect:(BOOL)a5 completionHandler:(id)a6
{
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  id v40;
  id v41;
  void *v42;
  void *v43;
  void *v44;
  BOOL v45;
  id v46;
  void *v47;
  id v48;
  _QWORD v50[4];
  id v51;
  id v52;
  AMSPurchaseProtocolHandler *v53;
  id v54;
  BOOL v55;
  uint8_t buf[4];
  void *v57;
  __int16 v58;
  void *v59;
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v48 = a3;
  v9 = a4;
  v46 = a6;
  v47 = v9;
  +[AMSURLTaskInfo taskInfoForTask:](AMSURLTaskInfo, "taskInfoForTask:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "properties");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "purchaseInfo");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "account");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "ams_DSID");
  v14 = objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    v15 = (void *)v14;
    v45 = a5;
    v44 = v13;
    objc_msgSend(v10, "properties");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "account");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "ams_DSID");
    v18 = objc_claimAutoreleasedReturnValue();
    if (!v18)
    {

LABEL_15:
      a5 = v45;
      goto LABEL_16;
    }
    v19 = (void *)v18;
    v20 = v44;
    objc_msgSend(v44, "ams_DSID");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "properties");
    v43 = v12;
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "account");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "ams_DSID");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v42) = objc_msgSend(v21, "isEqual:", v24);

    v12 = v43;
    v13 = v44;

    a5 = v45;
    if ((_DWORD)v42)
    {
      +[AMSLogConfig sharedPurchaseConfig](AMSLogConfig, "sharedPurchaseConfig");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v25)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v25, "OSLogObject");
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v43, "purchase");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "logUUID");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = (void *)MEMORY[0x1E0CB3940];
        v30 = objc_opt_class();
        v31 = v30;
        if (v28)
        {
          objc_msgSend(v43, "purchase");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "logUUID");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "stringWithFormat:", CFSTR("%@: [%@] "), v31, v20);
        }
        else
        {
          objc_msgSend(v29, "stringWithFormat:", CFSTR("%@: "), v30);
        }
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v44;
        AMSHashIfNeeded(v44);
        *(_DWORD *)buf = 138543618;
        v57 = v32;
        v58 = 2114;
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v59 = v33;
        _os_log_impl(&dword_18C849000, v26, OS_LOG_TYPE_DEFAULT, "%{public}@Purchase account has changed to: %{public}@", buf, 0x16u);
        if (v28)
        {

          v32 = v42;
        }

      }
      objc_msgSend(v10, "properties");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "setAccount:", v13);

      goto LABEL_15;
    }
  }
LABEL_16:
  v35 = (void *)objc_msgSend(v48, "mutableCopy");
  objc_msgSend(v10, "properties");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "bag");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSPurchaseRequestEncoder configureRequest:purchaseInfo:bag:](AMSPurchaseRequestEncoder, "configureRequest:purchaseInfo:bag:", v35, v12, v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  v50[0] = MEMORY[0x1E0C809B0];
  v50[1] = 3221225472;
  v50[2] = __92__AMSPurchaseProtocolHandler_reconfigureNewRequest_originalTask_redirect_completionHandler___block_invoke;
  v50[3] = &unk_1E2544E70;
  v51 = v35;
  v52 = v47;
  v55 = a5;
  v53 = self;
  v54 = v46;
  v39 = v46;
  v40 = v47;
  v41 = v35;
  objc_msgSend(v38, "addFinishBlock:", v50);

}

void __92__AMSPurchaseProtocolHandler_reconfigureNewRequest_originalTask_redirect_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  objc_super v7;

  v2 = *(void **)(a1 + 48);
  v3 = (void *)objc_msgSend(*(id *)(a1 + 32), "copy");
  v4 = *(_QWORD *)(a1 + 40);
  v5 = *(unsigned __int8 *)(a1 + 64);
  v6 = *(_QWORD *)(a1 + 56);
  v7.receiver = v2;
  v7.super_class = (Class)AMSPurchaseProtocolHandler;
  objc_msgSendSuper2(&v7, sel_reconfigureNewRequest_originalTask_redirect_completionHandler_, v3, v4, v5, v6);

}

- (void)AMSURLSession:(id)a3 task:(id)a4 handleDialogRequest:(id)a5 completion:(id)a6
{
  id v8;
  void (**v9)(id, _QWORD, void *);
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  __CFString *v25;
  void *v26;
  _QWORD v27[4];
  id v28;
  void (**v29)(id, _QWORD, void *);
  _QWORD v30[4];
  id v31;

  v8 = a5;
  v9 = (void (**)(id, _QWORD, void *))a6;
  +[AMSURLTaskInfo taskInfoForTask:](AMSURLTaskInfo, "taskInfoForTask:", a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "properties");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "purchaseInfo");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "delegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "purchase");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "isUserInitiated");

  if ((v15 & 1) == 0)
  {
    v25 = CFSTR("Not user initiated");
LABEL_6:
    AMSError(2, CFSTR("Purchase Dialog Failed"), v25, 0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v9[2](v9, 0, v26);

    goto LABEL_7;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    v25 = CFSTR("Purchase delegate not observing callback");
    goto LABEL_6;
  }
  objc_msgSend(v12, "purchase");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "metricsOverlay");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = MEMORY[0x1E0C809B0];
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __80__AMSPurchaseProtocolHandler_AMSURLSession_task_handleDialogRequest_completion___block_invoke;
  v30[3] = &unk_1E253FA48;
  v19 = v8;
  v31 = v19;
  objc_msgSend(v17, "enumerateKeysAndObjectsUsingBlock:", v30);

  objc_msgSend(v10, "properties");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "purchaseInfo");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "account");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "purchase");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v18;
  v27[1] = 3221225472;
  v27[2] = __80__AMSPurchaseProtocolHandler_AMSURLSession_task_handleDialogRequest_completion___block_invoke_2;
  v27[3] = &unk_1E2544E98;
  v28 = v22;
  v29 = v9;
  v24 = v22;
  objc_msgSend(v13, "purchase:handleDialogRequest:completion:", v23, v19, v27);

LABEL_7:
}

void __80__AMSPurchaseProtocolHandler_AMSURLSession_task_handleDialogRequest_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;

  v7 = a2;
  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "metricsEvent");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setProperty:forBodyKey:", v5, v7);

  }
}

void __80__AMSPurchaseProtocolHandler_AMSURLSession_task_handleDialogRequest_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(v5, "originalRequest");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(a1 + 32);
  objc_msgSend(v7, "metricsEvent");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAccount:", v8);

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend(v7, "buttonActions", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v18;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v18 != v13)
          objc_enumerationMutation(v10);
        v15 = *(_QWORD *)(a1 + 32);
        objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v14), "metricsEvent");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setAccount:", v15);

        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v12);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)AMSURLSession:(id)a3 task:(id)a4 handleAuthenticateRequest:(id)a5 completion:(id)a6
{
  void (**v8)(id, _QWORD, void *);
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a5;
  v8 = (void (**)(id, _QWORD, void *))a6;
  +[AMSURLTaskInfo taskInfoForTask:](AMSURLTaskInfo, "taskInfoForTask:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "properties");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "purchaseInfo");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "delegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v11, "purchase");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "purchase:handleAuthenticateRequest:completion:", v13, v14, v8);
  }
  else
  {
    AMSError(2, CFSTR("Purchase Authentication Failed"), CFSTR("Purchase delegate not observing callback"), 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v8[2](v8, 0, v13);
  }

}

- (void)AMSURLSession:(id)a3 task:(id)a4 handleEngagementRequest:(id)a5 completion:(id)a6
{
  void (**v8)(id, _QWORD, void *);
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
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
  id v24;

  v24 = a5;
  v8 = (void (**)(id, _QWORD, void *))a6;
  +[AMSURLTaskInfo taskInfoForTask:](AMSURLTaskInfo, "taskInfoForTask:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "properties");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "purchaseInfo");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "delegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "metricsOverlay");
  v13 = objc_claimAutoreleasedReturnValue();
  if (!v13)
    goto LABEL_4;
  v14 = (void *)v13;
  objc_msgSend(v11, "purchase");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "metricsOverlay");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    objc_msgSend(v24, "metricsOverlay");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "purchase");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "metricsOverlay");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "ams_dictionaryByAddingEntriesFromDictionary:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setMetricsOverlay:", v20);

  }
  else
  {
LABEL_4:
    objc_msgSend(v11, "purchase");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "metricsOverlay");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v22)
      goto LABEL_7;
    objc_msgSend(v11, "purchase");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "metricsOverlay");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setMetricsOverlay:", v18);
  }

LABEL_7:
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v11, "purchase");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "purchase:handleEngagementRequest:completion:", v23, v24, v8);
  }
  else
  {
    AMSError(2, CFSTR("Purchase Engagement Failed"), CFSTR("Purchase delegate not observing callback"), 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v8[2](v8, 0, v23);
  }

}

+ (double)reversePushSamplingPercentageForTask:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v36;
  void *v37;
  id v38;
  id v39;
  id v40;
  id v41;
  uint8_t buf[4];
  void *v43;
  __int16 v44;
  void *v45;
  __int16 v46;
  uint64_t v47;
  __int16 v48;
  NSObject *v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  +[AMSURLTaskInfo taskInfoForTask:](AMSURLTaskInfo, "taskInfoForTask:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "properties");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "purchaseInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "buyParams");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "parameterForKey:", 0x1E254E5E0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v13 = objc_claimAutoreleasedReturnValue();
      if (!v13)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v13 = objc_claimAutoreleasedReturnValue();
      }
      -[NSObject OSLogObject](v13, "OSLogObject");
      v12 = objc_claimAutoreleasedReturnValue();
      v17 = 0.0;
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        v22 = (void *)objc_opt_class();
        v38 = v22;
        objc_msgSend(v3, "properties");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "logUUID");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        AMSHashIfNeeded(v7);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v43 = v22;
        v44 = 2114;
        v45 = v24;
        v46 = 2114;
        v47 = (uint64_t)v25;
        _os_log_impl(&dword_18C849000, v12, OS_LOG_TYPE_DEBUG, "%{public}@: [%{public}@] Failed to fetch the APS sampling percentage. The buy params have no product type. buyParams = %{public}@", buf, 0x20u);

      }
      goto LABEL_26;
    }
    objc_msgSend(v3, "properties");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "bag");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dictionaryForKey:", 0x1E254C4A0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = 0;
    objc_msgSend(v11, "valueWithError:", &v41);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = v41;

    if (v12)
    {
      -[NSObject objectForKeyedSubscript:](v12, "objectForKeyedSubscript:", v8);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14)
      {
        v15 = v14;
        objc_msgSend(v14, "doubleValue");
        v17 = v16;
LABEL_25:

LABEL_26:
        goto LABEL_27;
      }
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v31)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v31, "OSLogObject");
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
      {
        v33 = (void *)objc_opt_class();
        v40 = v33;
        objc_msgSend(v3, "properties");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "logUUID");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v43 = v33;
        v44 = 2114;
        v45 = v34;
        v46 = 2114;
        v47 = (uint64_t)v8;
        v48 = 2114;
        v49 = v12;
        _os_log_impl(&dword_18C849000, v32, OS_LOG_TYPE_DEBUG, "%{public}@: [%{public}@] Failed to fetch the APS sampling percentage. The task's product type is not an allowed product type. productType = %{public}@ | allowedProductTypes = %{public}@", buf, 0x2Au);

      }
      v15 = 0;
    }
    else
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v15)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v15, "OSLogObject");
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
      {
        v27 = (void *)objc_opt_class();
        v39 = v27;
        objc_msgSend(v3, "properties");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "logUUID");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        AMSHashIfNeeded(v13);
        v29 = objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v43 = v27;
        v44 = 2114;
        v45 = v28;
        v46 = 2114;
        v47 = v29;
        v30 = (void *)v29;
        _os_log_impl(&dword_18C849000, v26, OS_LOG_TYPE_DEBUG, "%{public}@: [%{public}@] Failed to fetch the APS sampling percentage from the bag. error = %{public}@", buf, 0x20u);

      }
    }
    v17 = 0.0;
    goto LABEL_25;
  }
  +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v8, "OSLogObject");
  v13 = objc_claimAutoreleasedReturnValue();
  v17 = 0.0;
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    v18 = (void *)objc_opt_class();
    v19 = v18;
    objc_msgSend(v3, "properties");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "logUUID");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v43 = v18;
    v44 = 2114;
    v45 = v21;
    _os_log_impl(&dword_18C849000, v13, OS_LOG_TYPE_DEBUG, "%{public}@: [%{public}@] Failed to fetch the APS sampling percentage. The task has no buy params.", buf, 0x16u);

  }
LABEL_27:

  return v17;
}

- (id)_shouldRedirectWithPurchaseInfo:(id)a3 bag:(id)a4 urlAction:(id)a5 currentURL:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  _QWORD v20[5];
  id v21;
  id v22;
  id v23;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (v10
    && objc_msgSend(v12, "actionType") != 3
    && (objc_msgSend(v10, "buyParams"),
        v14 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v14, "dictionary"),
        v15 = (void *)objc_claimAutoreleasedReturnValue(),
        v16 = objc_msgSend(v15, "count"),
        v15,
        v14,
        v16))
  {
    +[AMSPurchaseRequestEncoder bagURLFromPurchaseInfo:bag:](AMSPurchaseRequestEncoder, "bagURLFromPurchaseInfo:bag:", v10, v11);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __87__AMSPurchaseProtocolHandler__shouldRedirectWithPurchaseInfo_bag_urlAction_currentURL___block_invoke;
    v20[3] = &unk_1E2544EC0;
    v20[4] = self;
    v21 = v13;
    v22 = v10;
    v23 = v12;
    objc_msgSend(v17, "continueWithBlock:", v20);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    +[AMSOptional optionalWithNil](AMSOptional, "optionalWithNil");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v18;
}

id __87__AMSPurchaseProtocolHandler__shouldRedirectWithPurchaseInfo_bag_urlAction_currentURL___block_invoke(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6 || (objc_msgSend(a1[4], "_isEquivalentURL:toURL:", a1[5], v5) & 1) != 0)
  {
    +[AMSOptional optionalWithNil](AMSOptional, "optionalWithNil");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
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
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(a1[6], "purchase");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "logUUID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)MEMORY[0x1E0CB3940];
      v15 = objc_opt_class();
      v16 = v15;
      if (v13)
      {
        objc_msgSend(a1[6], "purchase");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "logUUID");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "stringWithFormat:", CFSTR("%@: [%@] "), v16, v23);
      }
      else
      {
        objc_msgSend(v14, "stringWithFormat:", CFSTR("%@: "), v15);
      }
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      AMSLogableURL(a1[5]);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      AMSLogableURL(v5);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v26 = v17;
      v27 = 2114;
      v28 = v18;
      v29 = 2114;
      v30 = v19;
      _os_log_impl(&dword_18C849000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@Redirect from updated buyParam - from current URL: %{public}@ to URL: %{public}@", buf, 0x20u);
      if (v13)
      {

        v17 = v24;
      }

    }
    +[AMSURLAction redirectActionWithURL:](AMSURLAction, "redirectActionWithURL:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setReason:", CFSTR("buyParam redirect"));
    objc_msgSend(a1[7], "retryIdentifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setRetryIdentifier:", v20);

    objc_msgSend(a1[7], "updatedHeaders");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setUpdatedHeaders:", v21);

    +[AMSOptional optionalWithValue:](AMSOptional, "optionalWithValue:", v7);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", v22);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

- (BOOL)_isEquivalentURL:(id)a3 toURL:(id)a4
{
  id v5;
  id v6;
  BOOL v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v15;
  void *v16;

  v5 = a3;
  v6 = a4;
  if ((objc_msgSend(v5, "isEqual:", v6) & 1) != 0)
  {
    v7 = 1;
  }
  else
  {
    objc_msgSend(v5, "scheme");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "scheme");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "caseInsensitiveCompare:", v9);

    if (v10
      || (objc_msgSend(v5, "host"),
          v11 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v6, "host"),
          v12 = (void *)objc_claimAutoreleasedReturnValue(),
          v13 = objc_msgSend(v11, "caseInsensitiveCompare:", v12),
          v12,
          v11,
          v13))
    {
      v7 = 0;
    }
    else
    {
      objc_msgSend(v5, "path");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "path");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v15, "caseInsensitiveCompare:", v16) == 0;

    }
  }

  return v7;
}

- (id)_determineUpdatedBuyParamsFromResponse:(id)a3 urlAction:(id)a4 selectedAction:(id)a5 purchaseInfo:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  id v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  unint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  AMSBuyParams *v38;
  void *v39;
  void *v40;
  NSObject *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  NSObject *v50;
  void *v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  void *v56;
  void *v57;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  id v63;
  void *v65;
  void *v66;
  uint8_t buf[4];
  void *v68;
  __int16 v69;
  id v70;
  __int16 v71;
  void *v72;
  uint64_t v73;

  v73 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v66 = v11;
  if (v11)
  {
    objc_msgSend(v11, "ams_buyParams");
    v13 = objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      v14 = (id)v13;
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v15)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v15, "OSLogObject");
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v12, "purchase");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "logUUID");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v68 = v18;
        _os_log_impl(&dword_18C849000, v16, OS_LOG_TYPE_DEFAULT, "AMSPurchaseProtocolHandler: [%{public}@] Updating buy params from selected action", buf, 0xCu);

      }
      goto LABEL_26;
    }
  }
  if (objc_msgSend(v10, "actionType") == 3
    || (objc_msgSend(v10, "updatedHeaders"),
        v19 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v19, "ams_firstKeyObjectPassingTest:", &__block_literal_global_107),
        v20 = (void *)objc_claimAutoreleasedReturnValue(),
        v20,
        v19,
        v20))
  {
LABEL_25:
    objc_msgSend(v10, "updatedBuyParams");
    v14 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_26;
  }
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("dialog"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v22 = v21;
  else
    v22 = 0;

  objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("okButtonAction"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v24 = v23;
  else
    v24 = 0;

  objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("buyParams"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    goto LABEL_24;
  }
  v14 = v25;

  if (!v14)
  {
LABEL_24:

    goto LABEL_25;
  }
  +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v26)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v26, "OSLogObject");
  v27 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v12, "purchase");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "logUUID");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v68 = v29;
    v69 = 2114;
    v70 = v10;
    v71 = 2114;
    v72 = v66;
    _os_log_impl(&dword_18C849000, v27, OS_LOG_TYPE_DEFAULT, "AMSPurchaseProtocolHandler: [%{public}@] Updating buy params from any action the current URLAction is %{public}@ selected action is %{public}@", buf, 0x20u);

  }
LABEL_26:
  objc_msgSend(v14, "componentsSeparatedByString:", CFSTR("&"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = (void *)objc_msgSend(v30, "mutableCopy");

  objc_msgSend(MEMORY[0x1E0CB3500], "URLQueryAllowedCharacterSet");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v31, "count"))
  {
    v33 = 0;
    do
    {
      objc_msgSend(v31, "objectAtIndexedSubscript:", v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v34, "ams_isPercentEncodedForAllowedCharacters:", v32) & 1) == 0)
      {
        objc_msgSend(v34, "stringByRemovingPercentEncoding");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = v35;
        if (!v35)
          v35 = v34;
        objc_msgSend(v35, "stringByAddingPercentEncodingWithAllowedCharacters:", v32);
        v37 = objc_claimAutoreleasedReturnValue();

        v34 = (void *)v37;
      }
      objc_msgSend(v31, "setObject:atIndexedSubscript:", v34, v33);

      ++v33;
    }
    while (v33 < objc_msgSend(v31, "count"));
  }
  v65 = v10;
  if (objc_msgSend(v31, "count"))
  {
    v63 = v9;
    v38 = -[AMSBuyParams initWithArray:]([AMSBuyParams alloc], "initWithArray:", v31);
    objc_msgSend(v12, "paymentToken");
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    if (v39)
    {
      +[AMSLogConfig sharedPurchaseConfig](AMSLogConfig, "sharedPurchaseConfig");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v40)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v40, "OSLogObject");
      v41 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v12, "purchase");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v61, "logUUID");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = (void *)MEMORY[0x1E0CB3940];
        v44 = objc_opt_class();
        v45 = v44;
        if (v42)
        {
          objc_msgSend(v12, "purchase");
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v60, "logUUID");
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "stringWithFormat:", CFSTR("%@: [%@] "), v45, v59);
        }
        else
        {
          objc_msgSend(v43, "stringWithFormat:", CFSTR("%@: "), v44);
        }
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v68 = v46;
        _os_log_impl(&dword_18C849000, v41, OS_LOG_TYPE_DEFAULT, "%{public}@Appending payment token to buyParams", buf, 0xCu);
        if (v42)
        {

          v46 = v60;
        }

      }
      objc_msgSend(v12, "paymentToken");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      -[AMSBuyParams setParameter:forKey:](v38, "setParameter:forKey:", v47, CFSTR("pkPayment"));

    }
    objc_msgSend(v12, "paymentMethodType");
    v48 = (void *)objc_claimAutoreleasedReturnValue();

    if (v48)
    {
      +[AMSLogConfig sharedPurchaseConfig](AMSLogConfig, "sharedPurchaseConfig");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v49)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v49, "OSLogObject");
      v50 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v12, "purchase");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v62, "logUUID");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        v52 = (void *)MEMORY[0x1E0CB3940];
        v53 = objc_opt_class();
        v54 = v53;
        if (v51)
        {
          objc_msgSend(v12, "purchase");
          self = (AMSPurchaseProtocolHandler *)objc_claimAutoreleasedReturnValue();
          -[AMSPurchaseProtocolHandler logUUID](self, "logUUID");
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v52, "stringWithFormat:", CFSTR("%@: [%@] "), v54, v60);
        }
        else
        {
          objc_msgSend(v52, "stringWithFormat:", CFSTR("%@: "), v53);
        }
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v68 = v55;
        _os_log_impl(&dword_18C849000, v50, OS_LOG_TYPE_DEFAULT, "%{public}@Appending ApplePay payment method type to buyParams", buf, 0xCu);
        if (v51)
        {

          v55 = self;
        }

      }
      objc_msgSend(v12, "paymentMethodType");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "stringValue");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      -[AMSBuyParams setParameter:forKey:](v38, "setParameter:forKey:", v57, CFSTR("applePayPaymentMethodType"));

    }
    v9 = v63;
  }
  else
  {
    v38 = 0;
  }

  return v38;
}

uint64_t __107__AMSPurchaseProtocolHandler__determineUpdatedBuyParamsFromResponse_urlAction_selectedAction_purchaseInfo___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  uint64_t v5;

  v4 = a3;
  if (objc_msgSend(a2, "isEqualToString:", CFSTR("X-Apple-TID-Action")))
    v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("FB"));
  else
    v5 = 0;

  return v5;
}

- (BOOL)_shouldRetryForFailureAction:(id)a3 response:(id)a4 task:(id)a5 decodedObject:(id)a6 responseDictionary:(id)a7
{
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
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  char v27;
  void *v28;
  uint64_t v29;
  BOOL v30;
  int v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a7;
  +[AMSURLTaskInfo taskInfoForTask:](AMSURLTaskInfo, "taskInfoForTask:", a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "properties");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "purchaseInfo");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("dialog"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14
    || (objc_msgSend(v13, "hasRetriedOriginalOwnerAccount") & 1) != 0
    || (objc_msgSend(v13, "purchase"),
        v15 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v15, "ownerAccountId"),
        v16 = (void *)objc_claimAutoreleasedReturnValue(),
        v16,
        v15,
        !v16))
  {
    v27 = 0;
  }
  else
  {
    objc_msgSend(v13, "setHasRetriedOriginalOwnerAccount:", 1);
    objc_msgSend(MEMORY[0x1E0C8F2B8], "ams_sharedAccountStore");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "purchase");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "ownerAccountId");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "ams_iTunesAccountWithDSID:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setAccount:", v20);

    objc_msgSend(v13, "account");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "properties");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setAccount:", v21);

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
      objc_msgSend(v13, "purchase");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "logUUID");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = 138543362;
      v33 = v26;
      _os_log_impl(&dword_18C849000, v24, OS_LOG_TYPE_DEFAULT, "AMSPurchaseProtocolHandler: [%{public}@] Falling back to owner account", (uint8_t *)&v32, 0xCu);

    }
    v27 = 1;
  }
  objc_msgSend(v9, "error");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v28, "code");

  if ((unint64_t)(v29 - 513) < 0xFFFFFFFFFFFFFFFELL)
    v30 = v27;
  else
    v30 = 0;

  return v30;
}

- (void)_syncKeybagFromResponse:(id)a3 purchaseInfo:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  char v9;
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("keybag"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;

  if (objc_msgSend(v7, "length"))
  {
    +[AMSKeybag sharedInstance](AMSKeybag, "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 0;
    v9 = objc_msgSend(v8, "importKeybagWithData:error:", v7, &v17);
    v10 = v17;

    if ((v9 & 1) == 0)
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
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v5, "purchase");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "logUUID");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "account");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "ams_DSID");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v19 = v14;
        v20 = 2114;
        v21 = v16;
        v22 = 2114;
        v23 = v10;
        _os_log_impl(&dword_18C849000, v12, OS_LOG_TYPE_ERROR, "AMSPurchaseProtocolHandler: [%{public}@] Error importing keybag data for account: %{public}@ error: %{public}@", buf, 0x20u);

      }
    }

  }
}

- (void)_updatePasswordSettingWithBuyParams:(id)a3 account:(id)a4
{
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;

  v9 = a4;
  objc_msgSend(a3, "parameterForKey:", CFSTR("asn"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v6 = objc_msgSend(v5, "integerValue");
    objc_msgSend(v9, "ams_setFreePasswordPromptSetting:", +[AMSSyncPasswordSettingsTask freePasswordSettingFromServerValue:](AMSSyncPasswordSettingsTask, "freePasswordSettingFromServerValue:", v6));
    objc_msgSend(v9, "ams_setPaidPasswordPromptSetting:", +[AMSSyncPasswordSettingsTask paidPasswordSettingFromServerValue:](AMSSyncPasswordSettingsTask, "paidPasswordSettingFromServerValue:", v6));
    objc_msgSend(MEMORY[0x1E0C8F2B8], "ams_sharedAccountStore");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (id)objc_msgSend(v7, "ams_saveAccount:", v9);

  }
}

- (void)_updateSubscriptionStatusFromBody:(id)a3 account:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  _QWORD v17[7];
  _QWORD v18[8];

  v18[7] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v17[0] = CFSTR("newsEntitlements");
  v17[1] = CFSTR("appStoreEntitlements");
  v18[0] = &unk_1E25AF920;
  v18[1] = &unk_1E25AF938;
  v17[2] = CFSTR("activityEntitlements");
  v17[3] = CFSTR("musicEntitlements");
  v18[2] = &unk_1E25AF950;
  v18[3] = &unk_1E25AF968;
  v17[4] = CFSTR("tvEntitlements");
  v17[5] = CFSTR("iCloudEntitlements");
  v18[4] = &unk_1E25AF980;
  v18[5] = &unk_1E25AF998;
  v17[6] = CFSTR("podcastEntitlements");
  v18[6] = &unk_1E25AF9B0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 7);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __72__AMSPurchaseProtocolHandler__updateSubscriptionStatusFromBody_account___block_invoke;
  v14[3] = &unk_1E2544F08;
  v8 = v5;
  v15 = v8;
  v9 = v6;
  v16 = v9;
  objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", v14);
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("subscriptionStatus"));
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v11 = 0;
LABEL_8:

    goto LABEL_9;
  }
  v11 = v10;

  if (v11)
  {
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("music"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v10 = v12;

      if (v10)
        v13 = +[AMSSubscriptionEntitlementsTask updateCacheForMediaType:account:data:](AMSSubscriptionEntitlementsTask, "updateCacheForMediaType:account:data:", 2, v9, 0);
    }
    else
    {

      v10 = 0;
    }
    goto LABEL_8;
  }
LABEL_9:

}

void __72__AMSPurchaseProtocolHandler__updateSubscriptionStatusFromBody_account___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;
  id v7;
  id v8;

  v8 = a3;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = v5;

    if (v6)
      v7 = +[AMSSubscriptionEntitlementsTask updateCacheForMediaType:account:data:](AMSSubscriptionEntitlementsTask, "updateCacheForMediaType:account:data:", objc_msgSend(v8, "integerValue"), *(_QWORD *)(a1 + 40), v6);
  }
  else
  {

    v6 = 0;
  }

}

@end
