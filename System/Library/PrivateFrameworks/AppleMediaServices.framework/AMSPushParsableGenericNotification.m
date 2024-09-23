@implementation AMSPushParsableGenericNotification

+ (void)handleNotificationPayload:(id)a3 config:(id)a4 bag:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  AMSSystemAlertDialogTask *v16;
  void *v17;
  NSObject *v18;
  AMSUserNotification *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  _QWORD v23[4];
  NSObject *v24;
  id v25;
  id v26;
  uint8_t buf[4];
  id v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v8, "clientIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSLogConfig sharedPushNotificationConfig](AMSLogConfig, "sharedPushNotificationConfig");
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
    objc_msgSend(v8, "logKey");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v28 = a1;
    v29 = 2114;
    v30 = v14;
    v31 = 2114;
    v32 = v11;
    _os_log_impl(&dword_18C849000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Posting notification with identifier: %{public}@", buf, 0x20u);

  }
  if (objc_msgSend(a1, "_shouldPresentAlertForPayload:", v8))
  {
    objc_msgSend(a1, "_generateDialogRequestFromPayload:config:", v8, v9);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      v16 = -[AMSSystemAlertDialogTask initWithRequest:]([AMSSystemAlertDialogTask alloc], "initWithRequest:", v15);
      -[AMSSystemAlertDialogTask present](v16, "present");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __75__AMSPushParsableGenericNotification_handleNotificationPayload_config_bag___block_invoke;
      v23[3] = &unk_1E2542570;
      v24 = v10;
      v26 = a1;
      v25 = v8;
      objc_msgSend(v17, "addFinishBlock:", v23);

      v18 = v24;
    }
    else
    {
      +[AMSLogConfig sharedPushNotificationConfig](AMSLogConfig, "sharedPushNotificationConfig");
      v16 = (AMSSystemAlertDialogTask *)objc_claimAutoreleasedReturnValue();
      if (!v16)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v16 = (AMSSystemAlertDialogTask *)objc_claimAutoreleasedReturnValue();
      }
      -[AMSSystemAlertDialogTask OSLogObject](v16, "OSLogObject");
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v8, "logKey");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v28 = a1;
        v29 = 2114;
        v30 = v20;
        _os_log_impl(&dword_18C849000, v18, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to determine dialog request.", buf, 0x16u);

      }
    }

  }
  else
  {
    v19 = -[AMSUserNotification initWithPayload:andConfig:]([AMSUserNotification alloc], "initWithPayload:andConfig:", v8, v9);
    if (v19)
    {
      v15 = v19;
      +[AMSUserNotificationCenter postNotification:bag:centerBundleId:](AMSUserNotificationCenter, "postNotification:bag:centerBundleId:", v19, v10, v11);
      v16 = (AMSSystemAlertDialogTask *)objc_claimAutoreleasedReturnValue();
      -[AMSSystemAlertDialogTask waitUntilFinished](v16, "waitUntilFinished");
    }
    else
    {
      +[AMSLogConfig sharedPushNotificationConfig](AMSLogConfig, "sharedPushNotificationConfig");
      v16 = (AMSSystemAlertDialogTask *)objc_claimAutoreleasedReturnValue();
      if (!v16)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v16 = (AMSSystemAlertDialogTask *)objc_claimAutoreleasedReturnValue();
      }
      -[AMSSystemAlertDialogTask OSLogObject](v16, "OSLogObject");
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v8, "logKey");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v28 = a1;
        v29 = 2114;
        v30 = v22;
        _os_log_impl(&dword_18C849000, v21, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to determine user notification.", buf, 0x16u);

      }
      v15 = 0;
    }
  }

}

void __75__AMSPushParsableGenericNotification_handleNotificationPayload_config_bag___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  AMSHandleDialogResultTask *v4;
  void *v5;
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint8_t buf[4];
  uint64_t v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = -[AMSHandleDialogResultTask initWithResult:bag:]([AMSHandleDialogResultTask alloc], "initWithResult:bag:", v3, *(_QWORD *)(a1 + 32));

  -[AMSTask setRunMode:](v4, "setRunMode:", 1);
  -[AMSHandleDialogResultTask perform](v4, "perform");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  objc_msgSend(v5, "resultWithError:", &v11);
  v6 = v11;

  if (v6)
  {
    +[AMSLogConfig sharedPushNotificationConfig](AMSLogConfig, "sharedPushNotificationConfig");
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
      v9 = *(_QWORD *)(a1 + 48);
      objc_msgSend(*(id *)(a1 + 40), "logKey");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v13 = v9;
      v14 = 2114;
      v15 = v10;
      v16 = 2114;
      v17 = v6;
      _os_log_impl(&dword_18C849000, v8, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Dialog handling failed with error: %{public}@", buf, 0x20u);

    }
  }

}

+ (BOOL)_shouldPresentAlertForPayload:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  BOOL v6;

  v3 = a3;
  objc_msgSend(v3, "clientIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length");

  if (v5)
    v6 = objc_msgSend(v3, "alertType") != 2;
  else
    v6 = 1;

  return v6;
}

+ (id)_generateDialogRequestFromPayload:(id)a3 config:(id)a4
{
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  AMSDialogRequest *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;

  v4 = a3;
  objc_msgSend(v4, "aps");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("alert"));
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v7 = 0;
    v9 = 0;
LABEL_24:

    goto LABEL_25;
  }
  v7 = v6;

  if (v7)
  {
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("body"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v8;
    else
      v6 = 0;

    objc_msgSend(v4, "aps");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("uuid"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("title"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v13 = v12;
    else
      v13 = 0;

    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("ok"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v15 = v14;

      if (v15)
      {
        v16 = v15;
        v17 = v16;
LABEL_16:

        objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("cancel"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v20 = v19;
        else
          v20 = 0;

        v21 = (void *)MEMORY[0x1E0C99E98];
        objc_msgSend(v4, "URLString");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "URLWithString:", v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        v9 = -[AMSDialogRequest initWithTitle:message:]([AMSDialogRequest alloc], "initWithTitle:message:", v13, v6);
        -[AMSDialogRequest setIdentifier:](v9, "setIdentifier:", v11);
        if (objc_msgSend(v20, "length"))
        {
          +[AMSDialogAction actionWithTitle:style:](AMSDialogAction, "actionWithTitle:style:", v20, 2);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          -[AMSDialogRequest addButtonAction:](v9, "addButtonAction:", v24);

        }
        if (objc_msgSend(v17, "length"))
        {
          +[AMSDialogAction actionWithTitle:](AMSDialogAction, "actionWithTitle:", v17);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "setDeepLink:", v23);
          objc_msgSend(v25, "setInferLinkDestination:", 0);
          -[AMSDialogRequest addButtonAction:](v9, "addButtonAction:", v25);
          -[AMSDialogRequest setDefaultAction:](v9, "setDefaultAction:", v25);

        }
        goto LABEL_24;
      }
    }
    else
    {

    }
    objc_msgSend(MEMORY[0x1E0CB34D0], "ams_AppleMediaServicesBundle");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_1E2548760, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = 0;
    goto LABEL_16;
  }
  v9 = 0;
LABEL_25:

  return v9;
}

+ (id)_generateNotificationFromPayload:(id)a3 config:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  AMSUserNotification *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  AMSUserNotificationAction *v32;
  void *v33;
  void *v35;
  id v36;
  _QWORD v37[2];

  v37[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "aps");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("alert"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    v9 = 0;
    goto LABEL_6;
  }
  v9 = v8;

  if (!v9)
  {
LABEL_6:
    v12 = 0;
    goto LABEL_22;
  }
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("body"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v11 = v10;
  else
    v11 = 0;

  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("title"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v14 = v13;
  else
    v14 = 0;

  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("ok"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    goto LABEL_15;
  }
  v16 = v15;

  if (!v16)
  {
LABEL_15:
    objc_msgSend(MEMORY[0x1E0CB34D0], "ams_AppleMediaServicesBundle");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_1E2548760, 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = 0;
    goto LABEL_16;
  }
  v17 = v16;
  v18 = v17;
LABEL_16:

  v20 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(v5, "URLString");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "URLWithString:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "clientIdentifier");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v14, "length"))
  {
    v24 = v14;
    v25 = v18;
    v35 = v24;
    v12 = -[AMSUserNotification initWithTitle:]([AMSUserNotification alloc], "initWithTitle:", v24);
    v36 = v11;
    -[AMSUserNotification setInformativeText:](v12, "setInformativeText:", v11);
    objc_msgSend(v5, "logKey");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSUserNotification setLogKey:](v12, "setLogKey:", v26);

    objc_msgSend(v5, "account");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSUserNotification setAccount:](v12, "setAccount:", v27);

    -[AMSUserNotification setCenterBundleIdentifier:](v12, "setCenterBundleIdentifier:", v23);
    objc_msgSend(v6, "userNotificationExtensionId");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSUserNotification setCategoryIdentifier:](v12, "setCategoryIdentifier:", v28);

    objc_msgSend(v5, "aps");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("uuid"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v30, "length"))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.ams+%@"), v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[AMSUserNotification setIdentifier:](v12, "setIdentifier:", v31);

    }
    v32 = -[AMSUserNotificationAction initWithTitle:]([AMSUserNotificationAction alloc], "initWithTitle:", v18);
    -[AMSUserNotificationAction setDefaultURL:](v32, "setDefaultURL:", v22);
    v37[0] = v32;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 1);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSUserNotification setButtonActions:](v12, "setButtonActions:", v33);

    v18 = v25;
    -[AMSUserNotification setDefaultAction:](v12, "setDefaultAction:", v32);

    v14 = v35;
    v11 = v36;
  }
  else
  {
    v12 = 0;
  }

LABEL_22:
  return v12;
}

@end
