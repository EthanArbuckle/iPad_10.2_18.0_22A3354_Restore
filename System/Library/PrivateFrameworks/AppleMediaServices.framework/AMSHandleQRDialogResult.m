@implementation AMSHandleQRDialogResult

+ (void)handleQRDialogPresentationForRequest:(id)a3 result:(id)a4 logKey:(id)a5
{
  id v8;
  id v9;
  id v10;
  AMSQRCodeDialogTask *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  uint8_t buf[4];
  id v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = -[AMSSystemAlertDialogTask initWithRequest:]([AMSQRCodeDialogTask alloc], "initWithRequest:", v10);

  +[AMSHandleQRDialogResult _dismissalIdentifierFromDialogResult:](AMSHandleQRDialogResult, "_dismissalIdentifierFromDialogResult:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (+[AMSHandleQRDialogResult _isDismissQRDialogEnabled](AMSHandleQRDialogResult, "_isDismissQRDialogEnabled"))
  {
    if (v12)
    {
      -[AMSSystemAlertDialogTask setIsDialogDismissalEnabled:](v11, "setIsDialogDismissalEnabled:", 1);
      +[AMSHandleQRDialogResult _observeQRDialogDismissalNotificationForIdentifier:dialog:](AMSHandleQRDialogResult, "_observeQRDialogDismissalNotificationForIdentifier:dialog:", v12, v11);
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
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        v24 = (id)objc_opt_class();
        v25 = 2114;
        v26 = v8;
        v15 = v24;
        _os_log_impl(&dword_18C849000, v14, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Error observing for QR code dialog dismissal. No dialog identifier or link code found on the dialog result.", buf, 0x16u);

      }
    }
  }
  -[AMSSystemAlertDialogTask present](v11, "present");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __78__AMSHandleQRDialogResult_handleQRDialogPresentationForRequest_result_logKey___block_invoke;
  v19[3] = &unk_1E2542570;
  v21 = v12;
  v22 = a1;
  v20 = v8;
  v17 = v12;
  v18 = v8;
  objc_msgSend(v16, "addFinishBlock:", v19);

}

void __78__AMSHandleQRDialogResult_handleQRDialogPresentationForRequest_result_logKey___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  id v12;
  const char *v13;
  NSObject *v14;
  os_log_type_t v15;
  void *v16;
  uint64_t v17;
  int v18;
  void *v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v6)
  {
    if (!v7)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v8, "OSLogObject");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = (void *)objc_opt_class();
      v11 = *(_QWORD *)(a1 + 32);
      v18 = 138543874;
      v19 = v10;
      v20 = 2114;
      v21 = v11;
      v22 = 2114;
      v23 = v6;
      v12 = v10;
      v13 = "%{public}@: [%{public}@] Error presenting QR code dialog: %{public}@";
      v14 = v9;
      v15 = OS_LOG_TYPE_ERROR;
LABEL_10:
      _os_log_impl(&dword_18C849000, v14, v15, v13, (uint8_t *)&v18, 0x20u);

    }
  }
  else
  {
    if (!v7)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v8, "OSLogObject");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v16 = (void *)objc_opt_class();
      v17 = *(_QWORD *)(a1 + 32);
      v18 = 138543874;
      v19 = v16;
      v20 = 2114;
      v21 = v17;
      v22 = 2112;
      v23 = v5;
      v12 = v16;
      v13 = "%{public}@: [%{public}@] QR code dialog presented: %@";
      v14 = v9;
      v15 = OS_LOG_TYPE_DEFAULT;
      goto LABEL_10;
    }
  }

  if (*(_QWORD *)(a1 + 40)
    && +[AMSHandleQRDialogResult _isDismissQRDialogEnabled](AMSHandleQRDialogResult, "_isDismissQRDialogEnabled"))
  {
    +[AMSHandleQRDialogResult _removeQRDialogDismissalObserverForIdentifier:](AMSHandleQRDialogResult, "_removeQRDialogDismissalObserverForIdentifier:", *(_QWORD *)(a1 + 40));
  }

}

+ (void)_observeQRDialogDismissalNotificationForIdentifier:(id)a3 dialog:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  AMSDaemonConnection *v22;

  v5 = a3;
  v6 = a4;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__36;
  v21 = __Block_byref_object_dispose__36;
  v22 = objc_alloc_init(AMSDaemonConnection);
  objc_msgSend((id)v18[5], "dismissQRDialogServiceProxy");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __85__AMSHandleQRDialogResult__observeQRDialogDismissalNotificationForIdentifier_dialog___block_invoke;
  v14[3] = &unk_1E2542598;
  v9 = v5;
  v15 = v9;
  v16 = &v17;
  objc_msgSend(v7, "thenWithBlock:", v14);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v8;
  v12[1] = 3221225472;
  v12[2] = __85__AMSHandleQRDialogResult__observeQRDialogDismissalNotificationForIdentifier_dialog___block_invoke_3;
  v12[3] = &unk_1E25425C0;
  v11 = v6;
  v13 = v11;
  objc_msgSend(v10, "addFinishBlock:", v12);

  _Block_object_dispose(&v17, 8);
}

AMSMutablePromise *__85__AMSHandleQRDialogResult__observeQRDialogDismissalNotificationForIdentifier_dialog___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  AMSMutablePromise *v4;
  uint64_t v5;
  AMSMutablePromise *v6;
  uint64_t v7;
  _QWORD v9[4];
  AMSMutablePromise *v10;
  uint64_t v11;

  v3 = a2;
  v4 = objc_alloc_init(AMSMutablePromise);
  v5 = *(_QWORD *)(a1 + 32);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __85__AMSHandleQRDialogResult__observeQRDialogDismissalNotificationForIdentifier_dialog___block_invoke_2;
  v9[3] = &unk_1E2542338;
  v6 = v4;
  v7 = *(_QWORD *)(a1 + 40);
  v10 = v6;
  v11 = v7;
  objc_msgSend(v3, "observeQRDialogDismissalNotificationForIdentifier:completion:", v5, v9);

  return v6;
}

void __85__AMSHandleQRDialogResult__observeQRDialogDismissalNotificationForIdentifier_dialog___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "finishWithResult:", MEMORY[0x1E0C9AAB0]);
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = 0;

}

uint64_t __85__AMSHandleQRDialogResult__observeQRDialogDismissalNotificationForIdentifier_dialog___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_dismiss");
}

+ (void)_removeQRDialogDismissalObserverForIdentifier:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  AMSMutablePromise *(*v9)(uint64_t, void *);
  void *v10;
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  AMSDaemonConnection *v18;

  v3 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__36;
  v17 = __Block_byref_object_dispose__36;
  v18 = objc_alloc_init(AMSDaemonConnection);
  objc_msgSend((id)v14[5], "dismissQRDialogServiceProxy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v8 = 3221225472;
  v9 = __73__AMSHandleQRDialogResult__removeQRDialogDismissalObserverForIdentifier___block_invoke;
  v10 = &unk_1E2542598;
  v5 = v3;
  v11 = v5;
  v12 = &v13;
  objc_msgSend(v4, "thenWithBlock:", &v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addFinishBlock:", &__block_literal_global_62, v7, v8, v9, v10);

  _Block_object_dispose(&v13, 8);
}

AMSMutablePromise *__73__AMSHandleQRDialogResult__removeQRDialogDismissalObserverForIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  AMSMutablePromise *v4;
  uint64_t v5;
  AMSMutablePromise *v6;
  uint64_t v7;
  _QWORD v9[4];
  AMSMutablePromise *v10;
  uint64_t v11;

  v3 = a2;
  v4 = objc_alloc_init(AMSMutablePromise);
  v5 = *(_QWORD *)(a1 + 32);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __73__AMSHandleQRDialogResult__removeQRDialogDismissalObserverForIdentifier___block_invoke_2;
  v9[3] = &unk_1E2542338;
  v6 = v4;
  v7 = *(_QWORD *)(a1 + 40);
  v10 = v6;
  v11 = v7;
  objc_msgSend(v3, "removeQRDialogDismissalObserverForIdentifier:completion:", v5, v9);

  return v6;
}

void __73__AMSHandleQRDialogResult__removeQRDialogDismissalObserverForIdentifier___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "finishWithResult:", MEMORY[0x1E0C9AAB0]);
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = 0;

}

+ (id)_dismissalIdentifierFromDialogResult:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;

  v3 = a3;
  objc_msgSend(v3, "originalRequest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "metricsEvent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "underlyingDictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "originalRequest");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "userInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("AMSDialogRequestUserInfoKeyServerPayload"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("okButtonAction"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("PINCode"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v12 = v11;
  else
    v12 = 0;

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("dialogId"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v14 = v13;

    if (v12)
    {
      v15 = v12;
    }
    else
    {
      v15 = v14;
      if (!v14)
      {
        v16 = 0;
        goto LABEL_11;
      }
    }
  }
  else
  {

    v14 = 0;
    v16 = 0;
    v15 = v12;
    if (!v12)
      goto LABEL_11;
  }
  v16 = v15;
LABEL_11:

  return v16;
}

+ (BOOL)_isDismissQRDialogEnabled
{
  return _os_feature_enabled_impl();
}

@end
