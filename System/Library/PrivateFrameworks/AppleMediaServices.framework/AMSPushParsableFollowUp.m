@implementation AMSPushParsableFollowUp

+ (void)removeDeviceOfferWithPayload:(id)a3 logKey:(id)a4 bag:(id)a5
{
  id v7;
  id v8;
  id v9;
  __CFString *v10;
  void *v11;
  NSObject *v12;
  id v13;
  __CFString **v14;
  __CFString *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  id v24;
  void *v25;
  NSObject *v26;
  void *v27;
  id v28;
  void *v29;
  NSObject *v30;
  void *v31;
  id v32;
  _BYTE v33[24];
  __CFString *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(v7, "clientIdentifier");
  v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
  +[AMSLogConfig sharedFollowUpConfig](AMSLogConfig, "sharedFollowUpConfig");
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
    *(_DWORD *)v33 = 138543874;
    *(_QWORD *)&v33[4] = objc_opt_class();
    *(_WORD *)&v33[12] = 2114;
    *(_QWORD *)&v33[14] = v8;
    *(_WORD *)&v33[22] = 2114;
    v34 = v10;
    v13 = *(id *)&v33[4];
    _os_log_impl(&dword_18C849000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Attempting to clear device offer with notification for client identifier: %{public}@", v33, 0x20u);

  }
  if (-[__CFString isEqualToString:](v10, "isEqualToString:", AMSDeviceOfferFollowUpIdentifierAppleMusic))
  {
    v14 = &AMSDeviceOfferIdentifierAppleMusic;
LABEL_9:
    v15 = *v14;
    goto LABEL_15;
  }
  if (-[__CFString isEqualToString:](v10, "isEqualToString:", AMSDeviceOfferFollowUpIdentifieriCloud))
  {
    v14 = &AMSDeviceOfferIdentifieriCloud;
    goto LABEL_9;
  }
  +[AMSLogConfig sharedFollowUpConfig](AMSLogConfig, "sharedFollowUpConfig");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v16)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v16, "OSLogObject", *(_OWORD *)v33, *(_QWORD *)&v33[16], v34);
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v18 = (void *)objc_opt_class();
    *(_DWORD *)v33 = 138543874;
    *(_QWORD *)&v33[4] = v18;
    *(_WORD *)&v33[12] = 2114;
    *(_QWORD *)&v33[14] = v8;
    *(_WORD *)&v33[22] = 2114;
    v34 = v10;
    v19 = v18;
    _os_log_impl(&dword_18C849000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Failed to recognize client identifier: %{public}@", v33, 0x20u);

  }
  v15 = 0;
LABEL_15:
  objc_msgSend(v7, "account", *(_QWORD *)v33, *(_OWORD *)&v33[8]);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20)
  {
    if (v9 && v15)
    {
      +[AMSLogConfig sharedFollowUpConfig](AMSLogConfig, "sharedFollowUpConfig");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v21)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v21, "OSLogObject");
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        v23 = (void *)objc_opt_class();
        *(_DWORD *)v33 = 138543874;
        *(_QWORD *)&v33[4] = v23;
        *(_WORD *)&v33[12] = 2114;
        *(_QWORD *)&v33[14] = v8;
        *(_WORD *)&v33[22] = 2114;
        v34 = v15;
        v24 = v23;
        _os_log_impl(&dword_18C849000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Attempting to clear device offer with notification for identifier: %{public}@", v33, 0x20u);

      }
      +[AMSDevice removeDeviceOfferWithIdentifier:account:bag:logKey:](AMSDevice, "removeDeviceOfferWithIdentifier:account:bag:logKey:", v15, v20, v9, v8);
      goto LABEL_33;
    }
  }
  else
  {
    +[AMSLogConfig sharedFollowUpConfig](AMSLogConfig, "sharedFollowUpConfig");
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
      v27 = (void *)objc_opt_class();
      *(_DWORD *)v33 = 138543618;
      *(_QWORD *)&v33[4] = v27;
      *(_WORD *)&v33[12] = 2114;
      *(_QWORD *)&v33[14] = v8;
      v28 = v27;
      _os_log_impl(&dword_18C849000, v26, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Clear device offer with notification failed for no account", v33, 0x16u);

    }
  }
  +[AMSLogConfig sharedFollowUpConfig](AMSLogConfig, "sharedFollowUpConfig");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v29)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v29, "OSLogObject");
  v30 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
  {
    v31 = (void *)objc_opt_class();
    *(_DWORD *)v33 = 138543618;
    *(_QWORD *)&v33[4] = v31;
    *(_WORD *)&v33[12] = 2114;
    *(_QWORD *)&v33[14] = v8;
    v32 = v31;
    _os_log_impl(&dword_18C849000, v30, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Failed to clear device offer with notification", v33, 0x16u);

  }
LABEL_33:

}

+ (BOOL)isDeviceOfferNotification:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(a3, "clientIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isEqualToString:", AMSDeviceOfferFollowUpIdentifierAppleMusic) & 1) != 0)
    v4 = 1;
  else
    v4 = objc_msgSend(v3, "isEqualToString:", AMSDeviceOfferFollowUpIdentifieriCloud);

  return v4;
}

+ (void)handleNotificationPayload:(id)a3 config:(id)a4 bag:(id)a5
{
  id v7;
  id v8;

  v8 = a3;
  v7 = a5;
  if (objc_msgSend(a1, "_shouldAllowFollowUp:bag:", v8, v7))
  {
    if (objc_msgSend(a1, "_shouldClearFollowUpFromPayload:", v8))
    {
      if (objc_msgSend(a1, "isDeviceOfferNotification:", v8))
        objc_msgSend(a1, "removeDeviceOfferWithPayload:logKey:bag:", v8, 0, v7);
      else
        objc_msgSend(a1, "_performClearWithPayload:", v8);
    }
    else
    {
      objc_msgSend(a1, "_performPostWithPayload:bag:", v8, v7);
    }
  }

}

+ (BOOL)shouldSkipAccountCheck
{
  return 1;
}

+ (void)userNotification:(id)a3 selectedButtonAction:(id)a4 bag:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v25[4];
  id v26;
  id v27;
  _QWORD v28[4];
  id v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  +[AMSLogConfig sharedFollowUpConfig](AMSLogConfig, "sharedFollowUpConfig");
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
    v13 = (void *)objc_opt_class();
    v14 = v13;
    objc_msgSend(v8, "logKey");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v31 = v13;
    v32 = 2114;
    v33 = v15;
    _os_log_impl(&dword_18C849000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Handling follow up response.", buf, 0x16u);

  }
  objc_msgSend(a1, "_createFollowUpItemFromNotification:", v8);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    objc_msgSend(v9, "identifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "actions");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = MEMORY[0x1E0C809B0];
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __69__AMSPushParsableFollowUp_userNotification_selectedButtonAction_bag___block_invoke;
    v28[3] = &unk_1E2545430;
    v29 = v17;
    v20 = v17;
    objc_msgSend(v18, "ams_firstObjectPassingTest:", v28);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v16, "account");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "performActionsWithBag:account:", v10, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    v25[0] = v19;
    v25[1] = 3221225472;
    v25[2] = __69__AMSPushParsableFollowUp_userNotification_selectedButtonAction_bag___block_invoke_2;
    v25[3] = &unk_1E2543D68;
    v27 = a1;
    v26 = v8;
    objc_msgSend(v23, "addErrorBlock:", v25);
    objc_msgSend(v21, "postMetricsWithBag:", v10);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "waitUntilFinished");
    objc_msgSend(v23, "waitUntilFinished");

  }
}

uint64_t __69__AMSPushParsableFollowUp_userNotification_selectedButtonAction_bag___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "isEqualToString:", v3);

  return v4;
}

void __69__AMSPushParsableFollowUp_userNotification_selectedButtonAction_bag___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  +[AMSLogConfig sharedFollowUpConfig](AMSLogConfig, "sharedFollowUpConfig");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v4, "OSLogObject");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    v6 = (void *)objc_opt_class();
    v7 = *(void **)(a1 + 32);
    v8 = v6;
    objc_msgSend(v7, "logKey");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    AMSLogableError(v3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543874;
    v12 = v6;
    v13 = 2114;
    v14 = v9;
    v15 = 2114;
    v16 = v10;
    _os_log_impl(&dword_18C849000, v5, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to perform follow up action. Error: %{public}@", (uint8_t *)&v11, 0x20u);

  }
}

+ (NSString)bagSubProfile
{
  if (_MergedGlobals_139 != -1)
    dispatch_once(&_MergedGlobals_139, &__block_literal_global_110);
  return (NSString *)(id)qword_1ECEAD838;
}

void __40__AMSPushParsableFollowUp_bagSubProfile__block_invoke()
{
  void *v0;

  v0 = (void *)qword_1ECEAD838;
  qword_1ECEAD838 = (uint64_t)CFSTR("AMSFollowUp");

}

+ (NSString)bagSubProfileVersion
{
  if (qword_1ECEAD840 != -1)
    dispatch_once(&qword_1ECEAD840, &__block_literal_global_36_0);
  return (NSString *)(id)qword_1ECEAD848;
}

void __47__AMSPushParsableFollowUp_bagSubProfileVersion__block_invoke()
{
  void *v0;

  v0 = (void *)qword_1ECEAD848;
  qword_1ECEAD848 = (uint64_t)CFSTR("1");

}

+ (id)createBagForSubProfile
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend((id)objc_opt_class(), "bagSubProfile");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "bagSubProfileVersion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSBag bagForProfile:profileVersion:](AMSBag, "bagForProfile:profileVersion:", v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (void)_performClearWithPayload:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  char v14;
  id v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  AMSFollowUp *v29;
  id v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v29 = objc_alloc_init(AMSFollowUp);
  objc_msgSend(v3, "clientIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "aps");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("deviceGroup"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0 && (objc_msgSend(v6, "BOOLValue") & 1) != 0)
  {
    v7 = 0;
  }
  else
  {
    objc_msgSend(v3, "account");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  +[AMSLogConfig sharedFollowUpConfig](AMSLogConfig, "sharedFollowUpConfig");
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
    objc_msgSend(v3, "logKey");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v32 = v10;
    v33 = 2114;
    v34 = v12;
    v35 = 2114;
    v36 = v4;
    _os_log_impl(&dword_18C849000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Clearing follow up with identifier: %{public}@", buf, 0x20u);

  }
  -[AMSFollowUp clearFollowUpWithIdentifier:account:](v29, "clearFollowUpWithIdentifier:account:", v4, v7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = 0;
  v14 = objc_msgSend(v13, "resultWithError:", &v30);
  v15 = v30;
  +[AMSLogConfig sharedFollowUpConfig](AMSLogConfig, "sharedFollowUpConfig");
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = (void *)v16;
  if ((v14 & 1) != 0)
  {
    if (!v16)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v17, "OSLogObject");
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v19 = (void *)objc_opt_class();
      v27 = v7;
      v20 = v19;
      objc_msgSend(v3, "logKey");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v32 = v19;
      v33 = 2114;
      v34 = v21;
      _os_log_impl(&dword_18C849000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Successfully cleared follow up!", buf, 0x16u);

      v7 = v27;
    }
  }
  else
  {
    if (!v16)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v17, "OSLogObject");
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v22 = (void *)objc_opt_class();
      v26 = v22;
      objc_msgSend(v3, "logKey");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      AMSLogableError(v15);
      v28 = v4;
      v24 = v7;
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v32 = v22;
      v33 = 2114;
      v34 = v23;
      v35 = 2114;
      v36 = v25;
      _os_log_impl(&dword_18C849000, v18, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to clear follow up. Error = %{public}@", buf, 0x20u);

      v7 = v24;
      v4 = v28;

    }
  }

}

+ (void)_performPostWithPayload:(id)a3 bag:(id)a4
{
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  AMSFollowUp *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  id v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  uint64_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  +[AMSLogConfig sharedFollowUpConfig](AMSLogConfig, "sharedFollowUpConfig");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v6, "OSLogObject");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = (void *)objc_opt_class();
    v9 = v8;
    objc_msgSend(v5, "logKey");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "clientIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v30 = v8;
    v31 = 2114;
    v32 = v10;
    v33 = 2114;
    v34 = (uint64_t)v11;
    _os_log_impl(&dword_18C849000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Posting follow up with identifier: %{public}@", buf, 0x20u);

  }
  v12 = objc_alloc_init(AMSFollowUp);
  objc_msgSend(a1, "_createFollowUpItemFromPayload:", v5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSFollowUp postFollowUpItem:](v12, "postFollowUpItem:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0;
  objc_msgSend(v14, "resultWithError:", &v28);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v28;
  v17 = objc_msgSend(v15, "integerValue");

  +[AMSLogConfig sharedFollowUpConfig](AMSLogConfig, "sharedFollowUpConfig");
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = (void *)v18;
  if (v16)
  {
    if (!v18)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v19, "OSLogObject");
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      v21 = (void *)objc_opt_class();
      v26 = v21;
      objc_msgSend(v5, "logKey");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      AMSLogableError(v16);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v30 = v21;
      v31 = 2114;
      v32 = v22;
      v33 = 2114;
      v34 = (uint64_t)v23;
      _os_log_impl(&dword_18C849000, v20, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to post follow up. Error: %{public}@", buf, 0x20u);

    }
  }
  else
  {
    if (!v18)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v19, "OSLogObject");
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      v24 = (void *)objc_opt_class();
      v27 = v24;
      objc_msgSend(v5, "logKey");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v30 = v24;
      v31 = 2114;
      v32 = v25;
      v33 = 2048;
      v34 = v17;
      _os_log_impl(&dword_18C849000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Successfully posted follow up! Result = %ld", buf, 0x20u);

    }
  }

}

+ (BOOL)_shouldAllowFollowUp:(id)a3 bag:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  void *v17;
  id v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  char v25;
  BOOL v26;
  void *v27;
  NSObject *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  const char *v33;
  void *v34;
  id v36;
  id v37;
  id v38;
  uint8_t buf[4];
  void *v40;
  __int16 v41;
  void *v42;
  __int16 v43;
  void *v44;
  _QWORD v45[7];

  v45[6] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void *)MEMORY[0x1E0C99E60];
  v45[0] = AMSDeviceOfferFollowUpIdentifierAppleMusic;
  v45[1] = AMSDeviceOfferFollowUpIdentifierAppleMusicAndiCloud;
  v45[2] = AMSDeviceOfferFollowUpIdentifieriCloud;
  v45[3] = CFSTR("com.apple.AMSFollowUpIdentifier.Billing");
  v45[4] = CFSTR("com.apple.AMSFollowUpIdentifier.HardwareOffer");
  v45[5] = CFSTR("com.apple.AMSFollowUpIdentifier.HardwareOffer.Fitness");
  v7 = (void *)MEMORY[0x1E0C99D20];
  v8 = a4;
  objc_msgSend(v7, "arrayWithObjects:count:", v45, 6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setWithArray:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "arrayForKey:", 0x1E254C9E0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v38 = 0;
  objc_msgSend(v11, "valueWithError:", &v38);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = v38;

  v13 = objc_msgSend(v12, "count");
  +[AMSLogConfig sharedFollowUpConfig](AMSLogConfig, "sharedFollowUpConfig");
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)v14;
  if (v13)
  {
    if (!v14)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v15, "OSLogObject");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = (void *)objc_opt_class();
      v18 = v17;
      objc_msgSend(v5, "logKey");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v40 = v17;
      v41 = 2114;
      v42 = v19;
      _os_log_impl(&dword_18C849000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Bag did provided an allow-list, merging the allowed identifiers", buf, 0x16u);

    }
    objc_msgSend(v10, "setByAddingObjectsFromArray:", v12);
    v15 = v10;
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!v14)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v15, "OSLogObject");
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      v21 = (void *)objc_opt_class();
      v36 = v21;
      objc_msgSend(v5, "logKey");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      AMSLogableError(v37);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v40 = v21;
      v41 = 2114;
      v42 = v22;
      v43 = 2114;
      v44 = v23;
      _os_log_impl(&dword_18C849000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Bag did not provide an allow-list : %{public}@", buf, 0x20u);

    }
  }

  objc_msgSend(v5, "clientIdentifier");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v10, "containsObject:", v24);

  if ((v25 & 1) == 0)
  {
    +[AMSLogConfig sharedFollowUpConfig](AMSLogConfig, "sharedFollowUpConfig");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v27)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v27, "OSLogObject");
    v28 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      goto LABEL_24;
    v29 = (void *)objc_opt_class();
    v30 = v29;
    objc_msgSend(v5, "logKey");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "clientIdentifier");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v40 = v29;
    v41 = 2114;
    v42 = v31;
    v43 = 2114;
    v44 = v32;
    v33 = "%{public}@: [%{public}@] Follow up DENIED due to denylisted identifier: %{public}@";
    goto LABEL_23;
  }
  if ((objc_msgSend(v5, "isAccountTypeActive") & 1) == 0)
  {
    +[AMSLogConfig sharedFollowUpConfig](AMSLogConfig, "sharedFollowUpConfig");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v27)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v27, "OSLogObject");
    v28 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      goto LABEL_24;
    v34 = (void *)objc_opt_class();
    v30 = v34;
    objc_msgSend(v5, "logKey");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "clientIdentifier");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v40 = v34;
    v41 = 2114;
    v42 = v31;
    v43 = 2114;
    v44 = v32;
    v33 = "%{public}@: [%{public}@] Follow up DENIED due to inactive account %{public}@";
LABEL_23:
    _os_log_impl(&dword_18C849000, v28, OS_LOG_TYPE_ERROR, v33, buf, 0x20u);

LABEL_24:
    v26 = 0;
    goto LABEL_25;
  }
  v26 = 1;
LABEL_25:

  return v26;
}

+ (BOOL)_shouldClearFollowUpFromPayload:(id)a3
{
  void *v3;
  void *v4;
  char v5;

  objc_msgSend(a3, "aps");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("clear"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
    v5 = objc_msgSend(v4, "BOOLValue");
  else
    v5 = 0;

  return v5;
}

+ (id)_createFollowUpItemFromPayload:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  AMSFollowUpItem *v7;
  void *v8;
  void *v9;
  AMSFollowUpItem *v10;

  v3 = a3;
  objc_msgSend(v3, "clientIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "priority");
  objc_msgSend(v3, "logKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = [AMSFollowUpItem alloc];
  objc_msgSend(v3, "aps");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "account");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[AMSFollowUpItem initWithIdentifier:jsonDictionary:account:priority:logKey:](v7, "initWithIdentifier:jsonDictionary:account:priority:logKey:", v4, v8, v9, v5, v6);
  return v10;
}

+ (id)_createFollowUpItemFromNotification:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
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
  AMSFollowUpItem *v21;
  void *v22;
  AMSFollowUpItem *v23;
  void *v24;
  AMSMetricsEvent *v25;
  id v26;
  uint64_t i;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  __CFString *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  const __CFString *v40;
  void *v41;
  AMSFollowUpAction *v42;
  void *v43;
  AMSFollowUpAction *v44;
  void *v45;
  void *v46;
  AMSMetricsEvent *v47;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  uint64_t v56;
  void *v57;
  id obj;
  uint64_t v59;
  void *v60;
  void *v61;
  AMSFollowUpItem *v62;
  uint64_t v63;
  void *v64;
  void *v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  _BYTE v70[128];
  uint64_t v71;

  v71 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "title");
  v4 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("expirationDate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "informativeText");
  v7 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "logKey");
  v56 = objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "length"))
  {
    +[AMSPushParsableFollowUp _dateFromString:](AMSPushParsableFollowUp, "_dateFromString:", v6);
    v8 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }
  objc_msgSend(v3, "userInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "mutableCopy");

  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("priority"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("priority"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v12, "integerValue");

    objc_msgSend(v10, "removeObjectForKey:", CFSTR("priority"));
  }
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("metrics"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("metrics"));
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "removeObjectForKey:", CFSTR("metrics"));
  }
  else
  {
    v55 = 0;
  }
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("accountDSID"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("accountDSID"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      objc_msgSend(MEMORY[0x1E0C8F2B8], "ams_sharedAccountStore");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "ams_iTunesAccountWithDSID:", v15);
      v54 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v54 = 0;
    }
    objc_msgSend(v10, "removeObjectForKey:", CFSTR("accountDSID"));

  }
  else
  {
    v54 = 0;
  }
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("expirationDateHidden"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("expirationDateHidden"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v17 = (void *)objc_msgSend(v18, "BOOLValue");
    else
      v17 = 0;
    objc_msgSend(v10, "removeObjectForKey:", CFSTR("expirationDateHidden"));

  }
  objc_msgSend(v3, "userInfo");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("iconImageName"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
    objc_msgSend(v10, "removeObjectForKey:", CFSTR("iconImageName"));
  v51 = v6;
  v21 = [AMSFollowUpItem alloc];
  objc_msgSend(v3, "identifier");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = -[AMSFollowUpItem initWithIdentifier:account:priority:](v21, "initWithIdentifier:account:priority:", v22, v54, v11);

  v52 = (void *)v4;
  -[AMSFollowUpItem setTitle:](v23, "setTitle:", v4);
  -[AMSFollowUpItem setExpirationDateHidden:](v23, "setExpirationDateHidden:", v17);
  -[AMSFollowUpItem setBundleIconName:](v23, "setBundleIconName:", 0);
  v49 = (void *)v8;
  -[AMSFollowUpItem setExpirationDate:](v23, "setExpirationDate:", v8);
  v50 = (void *)v7;
  -[AMSFollowUpItem setInformativeText:](v23, "setInformativeText:", v7);
  v24 = (void *)v56;
  -[AMSFollowUpItem setLogKey:](v23, "setLogKey:", v56);
  -[AMSFollowUpItem setUserInfo:](v23, "setUserInfo:", v10);
  if (v55)
  {
    v25 = -[AMSMetricsEvent initWithUnderlyingDictionary:]([AMSMetricsEvent alloc], "initWithUnderlyingDictionary:", v55);
    -[AMSFollowUpItem setMetricsEvent:](v23, "setMetricsEvent:", v25);

  }
  v62 = v23;
  v26 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v66 = 0u;
  v67 = 0u;
  v68 = 0u;
  v69 = 0u;
  v53 = v3;
  objc_msgSend(v3, "buttonActions");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v63 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v66, v70, 16);
  if (v63)
  {
    v59 = *(_QWORD *)v67;
    v60 = v26;
    v61 = v10;
    do
    {
      for (i = 0; i != v63; ++i)
      {
        if (*(_QWORD *)v67 != v59)
          objc_enumerationMutation(obj);
        v28 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * i);
        objc_msgSend(v28, "defaultURL");
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "title");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "userInfo");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = (void *)objc_msgSend(v29, "mutableCopy");

        objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("metrics"));
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        if (v31)
          objc_msgSend(v30, "removeObjectForKey:", CFSTR("metrics"));
        objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("serverActionUrl"));
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        if (v32)
        {
          objc_msgSend(v30, "removeObjectForKey:", CFSTR("serverActionUrl"));
          objc_msgSend(v32, "objectForKeyedSubscript:", CFSTR("url"));
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "objectForKeyedSubscript:", CFSTR("method"));
          v34 = (__CFString *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "objectForKeyedSubscript:", CFSTR("body"));
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          if (v33)
          {
            objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v33);
            v36 = objc_claimAutoreleasedReturnValue();
            if (v36)
            {
              v37 = (void *)v36;
              v38 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C92C28]), "initWithURL:", v36);
              v39 = v38;
              if (v34)
                v40 = v34;
              else
                v40 = CFSTR("GET");
              objc_msgSend(v38, "setHTTPMethod:", v40);
              objc_msgSend(v35, "dataUsingEncoding:", 4);
              v57 = v35;
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v39, "setHTTPBody:", v41);

              v35 = v57;
            }
            else
            {
              v39 = 0;
            }
            v24 = (void *)v56;
          }
          else
          {
            v39 = 0;
          }

        }
        else
        {
          v39 = 0;
        }
        v42 = [AMSFollowUpAction alloc];
        -[AMSFollowUpItem identifier](v62, "identifier");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = -[AMSFollowUpAction initWithLabel:parentIdentifier:](v42, "initWithLabel:parentIdentifier:", v65, v43);

        objc_msgSend(v28, "identifier");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        -[AMSFollowUpAction setIdentifier:](v44, "setIdentifier:", v45);

        -[AMSFollowUpAction setUrl:](v44, "setUrl:", v64);
        v46 = (void *)objc_msgSend(v30, "mutableCopy");
        -[AMSFollowUpAction setUserInfo:](v44, "setUserInfo:", v46);

        -[AMSFollowUpAction setRequest:](v44, "setRequest:", v39);
        -[AMSFollowUpAction setLogKey:](v44, "setLogKey:", v24);
        if (v31)
        {
          v47 = -[AMSMetricsEvent initWithUnderlyingDictionary:]([AMSMetricsEvent alloc], "initWithUnderlyingDictionary:", v31);
          -[AMSFollowUpAction setMetricsEvent:](v44, "setMetricsEvent:", v47);

        }
        v26 = v60;
        objc_msgSend(v60, "addObject:", v44);

        v10 = v61;
      }
      v63 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v66, v70, 16);
    }
    while (v63);
  }

  if (objc_msgSend(v26, "count"))
    -[AMSFollowUpItem setActions:](v62, "setActions:", v26);

  return v62;
}

+ (id)_createNotificationFromFollowUpItem:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  AMSUserNotification *v22;
  void *v23;
  id v24;
  uint64_t i;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  void *v46;
  void *v47;
  void *v48;
  AMSUserNotificationAction *v49;
  AMSUserNotification *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  id obj;
  id v58;
  void *v59;
  uint64_t v60;
  uint64_t v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  _BYTE v66[128];
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "title");
  v4 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "informativeText");
  v5 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "metricsEvent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "underlyingDictionary");
  v7 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "logKey");
  v8 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "expirationDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3578], "ams_serverFriendlyLocalTimeZoneFormatter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "expirationDate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringFromDate:", v11);
    v12 = objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = 0;
  }
  v13 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v3, "priority"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v14, CFSTR("priority"));

  if (v7)
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v7, CFSTR("metrics"));
  objc_msgSend(v3, "account");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "ams_DSID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    objc_msgSend(v3, "account");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "ams_DSID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v18, CFSTR("accountDSID"));

  }
  objc_msgSend(v3, "bundleIconName");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    objc_msgSend(v3, "bundleIconName");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v20, CFSTR("iconImageName"));

  }
  v59 = (void *)v7;
  if (objc_msgSend(v3, "isExpirationDateHidden"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v3, "isExpirationDateHidden"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v21, CFSTR("expirationDateHidden"));

  }
  v53 = (void *)v12;
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v12, CFSTR("expirationDate"));
  v56 = (void *)v4;
  v22 = -[AMSUserNotification initWithTitle:intent:]([AMSUserNotification alloc], "initWithTitle:intent:", v4, 1);
  objc_msgSend(v3, "identifier");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSUserNotification setIdentifier:](v22, "setIdentifier:", v23);

  -[AMSUserNotification setCenterBundleIdentifier:](v22, "setCenterBundleIdentifier:", CFSTR("com.apple.appstoreagent"));
  v55 = (void *)v5;
  -[AMSUserNotification setInformativeText:](v22, "setInformativeText:", v5);
  v54 = (void *)v8;
  -[AMSUserNotification setLogKey:](v22, "setLogKey:", v8);
  v51 = v22;
  v52 = v13;
  -[AMSUserNotification setUserInfo:](v22, "setUserInfo:", v13);
  v24 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v62 = 0u;
  v63 = 0u;
  v64 = 0u;
  v65 = 0u;
  objc_msgSend(v3, "actions");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v61 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v62, v66, 16);
  if (v61)
  {
    v60 = *(_QWORD *)v63;
    v58 = v24;
    do
    {
      for (i = 0; i != v61; ++i)
      {
        if (*(_QWORD *)v63 != v60)
          objc_enumerationMutation(obj);
        v26 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * i);
        objc_msgSend(v26, "url");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "label");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "userInfo");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = (void *)objc_msgSend(v29, "mutableCopy");
        v31 = v30;
        if (v30)
          v32 = v30;
        else
          v32 = objc_alloc_init(MEMORY[0x1E0C99E08]);
        v33 = v32;

        objc_msgSend(v3, "metricsEvent");
        v34 = (void *)objc_claimAutoreleasedReturnValue();

        if (v34)
          objc_msgSend(v33, "setObject:forKeyedSubscript:", v59, CFSTR("metrics"));
        objc_msgSend(v26, "request");
        v35 = (void *)objc_claimAutoreleasedReturnValue();

        if (v35)
        {
          v36 = v3;
          v37 = objc_alloc_init(MEMORY[0x1E0C99E08]);
          objc_msgSend(v26, "request");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "URL");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "absoluteString");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "setObject:forKeyedSubscript:", v40, CFSTR("url"));

          objc_msgSend(v26, "request");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "HTTPMethod");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "setObject:forKeyedSubscript:", v42, CFSTR("method"));

          objc_msgSend(v26, "request");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "HTTPBody");
          v44 = (void *)objc_claimAutoreleasedReturnValue();

          if (v44)
          {
            v45 = objc_alloc(MEMORY[0x1E0CB3940]);
            objc_msgSend(v26, "request");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v46, "HTTPBody");
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            v48 = (void *)objc_msgSend(v45, "initWithData:encoding:", v47, 4);

            if (v48)
              objc_msgSend(v37, "setObject:forKeyedSubscript:", v48, CFSTR("body"));

          }
          objc_msgSend(v33, "setObject:forKeyedSubscript:", v37, CFSTR("serverActionUrl"));

          v3 = v36;
          v24 = v58;
        }
        v49 = -[AMSUserNotificationAction initWithTitle:]([AMSUserNotificationAction alloc], "initWithTitle:", v28);
        -[AMSUserNotificationAction setDefaultURL:](v49, "setDefaultURL:", v27);
        -[AMSUserNotificationAction setUserInfo:](v49, "setUserInfo:", v33);
        objc_msgSend(v24, "addObject:", v49);

      }
      v61 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v62, v66, 16);
    }
    while (v61);
  }

  if (objc_msgSend(v24, "count"))
    -[AMSUserNotification setButtonActions:](v51, "setButtonActions:", v24);

  return v51;
}

+ (id)_dateFromString:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB3578], "ams_serverFriendlyFormatter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dateFromString:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3578], "ams_serverFriendlyLocalTimeZoneFormatter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dateFromString:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

@end
