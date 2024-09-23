@implementation AMSUserNotificationAuthorizationTask

- (AMSUserNotificationAuthorizationTask)initWithBundleIdentifier:(id)a3 options:(id)a4
{
  id v7;
  id v8;
  AMSUserNotificationAuthorizationTask *v9;
  AMSUserNotificationAuthorizationTask *v10;
  uint64_t v11;
  UNUserNotificationCenter *notificationCenter;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)AMSUserNotificationAuthorizationTask;
  v9 = -[AMSTask init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_bundleIdentifier, a3);
    objc_storeStrong((id *)&v10->_options, a4);
    v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEC7A0]), "initWithBundleIdentifier:", v7);
    notificationCenter = v10->_notificationCenter;
    v10->_notificationCenter = (UNUserNotificationCenter *)v11;

  }
  return v10;
}

+ (id)engagementRequestForFullSheet
{
  AMSMutablePromise *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  AMSMutablePromise *v9;
  _QWORD v11[5];
  _QWORD v12[5];
  _QWORD v13[4];
  AMSMutablePromise *v14;
  id v15;

  v3 = objc_alloc_init(AMSMutablePromise);
  v4 = objc_alloc(MEMORY[0x1E0CEC7A0]);
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "initWithBundleIdentifier:", v6);

  v8 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __69__AMSUserNotificationAuthorizationTask_engagementRequestForFullSheet__block_invoke;
  v13[3] = &unk_1E2547628;
  v9 = v3;
  v14 = v9;
  v15 = a1;
  objc_msgSend(v7, "getNotificationSettingsWithCompletionHandler:", v13);
  v12[0] = v8;
  v12[1] = 3221225472;
  v12[2] = __69__AMSUserNotificationAuthorizationTask_engagementRequestForFullSheet__block_invoke_25;
  v12[3] = &__block_descriptor_40_e17_v16__0__NSError_8l;
  v12[4] = a1;
  -[AMSPromise addErrorBlock:](v9, "addErrorBlock:", v12);
  v11[0] = v8;
  v11[1] = 3221225472;
  v11[2] = __69__AMSUserNotificationAuthorizationTask_engagementRequestForFullSheet__block_invoke_26;
  v11[3] = &__block_descriptor_40_e48_v16__0__AMSUserNotificationAuthorizationResult_8l;
  v11[4] = a1;
  -[AMSPromise addSuccessBlock:](v9, "addSuccessBlock:", v11);

  return v9;
}

void __69__AMSUserNotificationAuthorizationTask_engagementRequestForFullSheet__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  AMSUserNotificationAuthorizationOptions *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  __int128 v11;
  _QWORD v12[4];
  __int128 v13;
  _QWORD v14[4];
  id v15;

  v3 = a2;
  if (objc_msgSend(v3, "authorizationStatus") == 1 || objc_msgSend(v3, "authorizationStatus") == 2)
  {
    AMSError(11, CFSTR("User has already accepted or denied notification authorization."), 0, 0);
    v4 = (AMSUserNotificationAuthorizationOptions *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "finishWithError:", v4);
  }
  else
  {
    v4 = objc_alloc_init(AMSUserNotificationAuthorizationOptions);
    v5 = *(void **)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bundleIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "recordEngagementEventWithBundleIdentifier:options:", v7, v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = MEMORY[0x1E0C809B0];
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __69__AMSUserNotificationAuthorizationTask_engagementRequestForFullSheet__block_invoke_2;
    v14[3] = &unk_1E253E120;
    v15 = *(id *)(a1 + 32);
    objc_msgSend(v8, "addErrorBlock:", v14);
    v12[0] = v9;
    v12[1] = 3221225472;
    v12[2] = __69__AMSUserNotificationAuthorizationTask_engagementRequestForFullSheet__block_invoke_3;
    v12[3] = &unk_1E2547600;
    v11 = *(_OWORD *)(a1 + 32);
    v10 = (id)v11;
    v13 = v11;
    objc_msgSend(v8, "addSuccessBlock:", v12);

  }
}

uint64_t __69__AMSUserNotificationAuthorizationTask_engagementRequestForFullSheet__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithError:", a2);
}

void __69__AMSUserNotificationAuthorizationTask_engagementRequestForFullSheet__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  id v13;
  void *v14;
  AMSUserNotificationAuthorizationResult *v15;
  int v16;
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a2;
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
    v6 = (void *)objc_opt_class();
    v7 = v6;
    AMSLogKey();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138543618;
    v17 = v6;
    v18 = 2114;
    v19 = v8;
    _os_log_impl(&dword_18C849000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Successfully obtained response", (uint8_t *)&v16, 0x16u);

  }
  objc_msgSend(*(id *)(a1 + 40), "_findEngagementRequestInResponse:", v3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
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
      v12 = (void *)objc_opt_class();
      v13 = v12;
      AMSLogKey();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138543618;
      v17 = v12;
      v18 = 2114;
      v19 = v14;
      _os_log_impl(&dword_18C849000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Successfully obtained engagement request", (uint8_t *)&v16, 0x16u);

    }
    objc_msgSend(v9, "setSilentlyCheckURL:", 1);
    v15 = objc_alloc_init(AMSUserNotificationAuthorizationResult);
    -[AMSUserNotificationAuthorizationResult setRequest:](v15, "setRequest:", v9);
    objc_msgSend(*(id *)(a1 + 32), "finishWithResult:", v15);
  }
  else
  {
    AMSError(12, CFSTR("No engagement request returned."), 0, 0);
    v15 = (AMSUserNotificationAuthorizationResult *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "finishWithError:", v15);
  }

}

void __69__AMSUserNotificationAuthorizationTask_engagementRequestForFullSheet__block_invoke_25(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
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
    v6 = *(_QWORD *)(a1 + 32);
    AMSLogKey();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543874;
    v9 = v6;
    v10 = 2114;
    v11 = v7;
    v12 = 2114;
    v13 = v3;
    _os_log_impl(&dword_18C849000, v5, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Explicit notification authorization for full sheet failed: %{public}@", (uint8_t *)&v8, 0x20u);

  }
}

void __69__AMSUserNotificationAuthorizationTask_engagementRequestForFullSheet__block_invoke_26(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v2, "OSLogObject");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(a1 + 32);
    AMSLogKey();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138543618;
    v7 = v4;
    v8 = 2114;
    v9 = v5;
    _os_log_impl(&dword_18C849000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Explicit notification authorization for full sheet completed successfully.", (uint8_t *)&v6, 0x16u);

  }
}

+ (id)_findEngagementRequestInResponse:(id)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  objc_msgSend(a3, "messageActions", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    while (2)
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v7), "engagementRequest");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (v8)
        {
          v9 = v8;
          objc_msgSend(v8, "setSilentlyCheckURL:", 1);
          objc_msgSend(v9, "setFailOnDismiss:", 1);
          goto LABEL_11;
        }
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v5)
        continue;
      break;
    }
  }
  v9 = 0;
LABEL_11:

  return v9;
}

+ (id)recordEngagementEventWithBundleIdentifier:(id)a3 options:(id)a4
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  AMSEngagement *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  AMSEngagementPlacementInfo *v17;
  AMSEngagementMessageEvent *v18;
  void *v19;
  AMSEngagementMessageEvent *v20;
  void *v21;
  AMSEngagementPlacementInfo *v23;
  _QWORD v24[4];
  _QWORD v25[4];
  uint8_t buf[4];
  uint64_t v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
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
    *(_DWORD *)buf = 138543618;
    v27 = v9;
    v28 = 2114;
    v29 = v10;
    _os_log_impl(&dword_18C849000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Recording engagement event.", buf, 0x16u);

  }
  v11 = objc_alloc_init(AMSEngagement);
  v25[0] = v5;
  v24[0] = CFSTR("bundleIdentifier");
  v24[1] = CFSTR("userInitiated");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v6, "userInitiated"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v25[1] = v12;
  v24[2] = CFSTR("authorizationOptions");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v6, "authorizationOptions"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v25[2] = v13;
  v24[3] = CFSTR("metricsOverlay");
  objc_msgSend(v6, "metricsOverlay");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = (void *)MEMORY[0x1E0C9AA70];
  if (v14)
    v15 = v14;
  v25[3] = v15;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = -[AMSEngagementPlacementInfo initWithPlacement:context:]([AMSEngagementPlacementInfo alloc], "initWithPlacement:context:", CFSTR("notificationAuthorization"), v16);
  v18 = [AMSEngagementMessageEvent alloc];
  v23 = v17;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v23, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = -[AMSEngagementMessageEvent initWithServiceType:placementInfo:](v18, "initWithServiceType:placementInfo:", CFSTR("com.apple.notificationAuthorization"), v19);

  -[AMSEngagement enqueueMessageEvent:](v11, "enqueueMessageEvent:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

- (id)requestAuthorization
{
  void *v3;
  NSObject *v4;
  void *v5;
  id v6;
  void *v7;
  AMSUserNotificationAuthorizationResult *v8;
  AMSMutablePromise *v9;
  void *v10;
  uint64_t v11;
  AMSMutablePromise *v12;
  AMSUserNotificationAuthorizationResult *v13;
  AMSMutablePromise *v14;
  _QWORD v16[5];
  _QWORD v17[5];
  _QWORD v18[4];
  AMSMutablePromise *v19;
  AMSUserNotificationAuthorizationResult *v20;
  id v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v3, "OSLogObject");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (void *)objc_opt_class();
    v6 = v5;
    AMSLogKey();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v23 = v5;
    v24 = 2114;
    v25 = v7;
    _os_log_impl(&dword_18C849000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Starting notification authorization task", buf, 0x16u);

  }
  v8 = objc_alloc_init(AMSUserNotificationAuthorizationResult);
  v9 = objc_alloc_init(AMSMutablePromise);
  objc_initWeak((id *)buf, self);
  -[AMSUserNotificationAuthorizationTask notificationCenter](self, "notificationCenter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __60__AMSUserNotificationAuthorizationTask_requestAuthorization__block_invoke;
  v18[3] = &unk_1E2547698;
  objc_copyWeak(&v21, (id *)buf);
  v12 = v9;
  v19 = v12;
  v13 = v8;
  v20 = v13;
  objc_msgSend(v10, "getNotificationSettingsWithCompletionHandler:", v18);

  v17[0] = v11;
  v17[1] = 3221225472;
  v17[2] = __60__AMSUserNotificationAuthorizationTask_requestAuthorization__block_invoke_5;
  v17[3] = &unk_1E253E120;
  v17[4] = self;
  -[AMSPromise addErrorBlock:](v12, "addErrorBlock:", v17);
  v16[0] = v11;
  v16[1] = 3221225472;
  v16[2] = __60__AMSUserNotificationAuthorizationTask_requestAuthorization__block_invoke_36;
  v16[3] = &unk_1E25476C0;
  v16[4] = self;
  -[AMSPromise addSuccessBlock:](v12, "addSuccessBlock:", v16);
  v14 = v12;

  objc_destroyWeak(&v21);
  objc_destroyWeak((id *)buf);

  return v14;
}

void __60__AMSUserNotificationAuthorizationTask_requestAuthorization__block_invoke(id *a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  uint64_t v6;
  _QWORD v7[5];
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained(a1 + 6);
  if (objc_msgSend(v3, "authorizationStatus") == 1 || objc_msgSend(v3, "authorizationStatus") == 2)
  {
    AMSError(11, CFSTR("User has already accepted or denied notification authorization."), 0, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[4], "finishWithError:", v5);
  }
  else
  {
    objc_msgSend(WeakRetained, "_startEngagementAuthorizationWithResult:", a1[5]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = MEMORY[0x1E0C809B0];
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __60__AMSUserNotificationAuthorizationTask_requestAuthorization__block_invoke_2;
    v10[3] = &unk_1E253E120;
    v11 = a1[4];
    objc_msgSend(v5, "addErrorBlock:", v10);
    v7[0] = v6;
    v7[1] = 3221225472;
    v7[2] = __60__AMSUserNotificationAuthorizationTask_requestAuthorization__block_invoke_3;
    v7[3] = &unk_1E25414B8;
    v7[4] = WeakRetained;
    v8 = a1[5];
    v9 = a1[4];
    objc_msgSend(v5, "addSuccessBlock:", v7);

  }
}

uint64_t __60__AMSUserNotificationAuthorizationTask_requestAuthorization__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithError:", a2);
}

void __60__AMSUserNotificationAuthorizationTask_requestAuthorization__block_invoke_3(id *a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;

  objc_msgSend(a1[4], "notificationCenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __60__AMSUserNotificationAuthorizationTask_requestAuthorization__block_invoke_4;
  v3[3] = &unk_1E2547670;
  v4 = a1[5];
  v5 = a1[6];
  objc_msgSend(v2, "getNotificationSettingsWithCompletionHandler:", v3);

}

uint64_t __60__AMSUserNotificationAuthorizationTask_requestAuthorization__block_invoke_4(uint64_t a1, void *a2)
{
  objc_msgSend(*(id *)(a1 + 32), "setAuthorizationStatus:", objc_msgSend(a2, "authorizationStatus"));
  return objc_msgSend(*(id *)(a1 + 40), "finishWithResult:", *(_QWORD *)(a1 + 32));
}

void __60__AMSUserNotificationAuthorizationTask_requestAuthorization__block_invoke_5(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  void *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v3, "OSLogObject");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = objc_opt_class();
    AMSLogKey();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543874;
    v8 = v5;
    v9 = 2114;
    v10 = v6;
    v11 = 2114;
    v12 = v2;
    _os_log_impl(&dword_18C849000, v4, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Notification authorization completed with error: %{public}@", (uint8_t *)&v7, 0x20u);

  }
}

void __60__AMSUserNotificationAuthorizationTask_requestAuthorization__block_invoke_36()
{
  void *v0;
  NSObject *v1;
  void *v2;
  id v3;
  void *v4;
  int v5;
  void *v6;
  __int16 v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v0)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v0 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v0, "OSLogObject");
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    v2 = (void *)objc_opt_class();
    v3 = v2;
    AMSLogKey();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138543618;
    v6 = v2;
    v7 = 2114;
    v8 = v4;
    _os_log_impl(&dword_18C849000, v1, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Notification authorization completed successfully", (uint8_t *)&v5, 0x16u);

  }
}

- (id)_presentDialogForUserInitiatedWithCompletion
{
  AMSMutableBinaryPromise *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  AMSMutableBinaryPromise *v7;
  AMSMutableBinaryPromise *v8;
  AMSMutableBinaryPromise *v9;
  _QWORD v11[5];
  AMSMutableBinaryPromise *v12;

  v3 = objc_alloc_init(AMSMutableBinaryPromise);
  -[AMSUserNotificationAuthorizationTask notificationCenter](self, "notificationCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSUserNotificationAuthorizationTask options](self, "options");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "authorizationOptions");
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __84__AMSUserNotificationAuthorizationTask__presentDialogForUserInitiatedWithCompletion__block_invoke;
  v11[3] = &unk_1E253F870;
  v11[4] = self;
  v7 = v3;
  v12 = v7;
  objc_msgSend(v4, "requestAuthorizationWithOptions:completionHandler:", v6, v11);

  v8 = v12;
  v9 = v7;

  return v9;
}

void __84__AMSUserNotificationAuthorizationTask__presentDialogForUserInitiatedWithCompletion__block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (a2)
  {
    if (!v6)
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
      v14 = 138543618;
      v15 = v9;
      v16 = 2114;
      v17 = v10;
      _os_log_impl(&dword_18C849000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Authorization granted.", (uint8_t *)&v14, 0x16u);

    }
    objc_msgSend(*(id *)(a1 + 40), "finishWithSuccess");
  }
  else
  {
    if (!v6)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v7, "OSLogObject");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = objc_opt_class();
      AMSLogKey();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543874;
      v15 = v12;
      v16 = 2114;
      v17 = v13;
      v18 = 2114;
      v19 = v5;
      _os_log_impl(&dword_18C849000, v11, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to acquire authorization. Error: %{public}@", (uint8_t *)&v14, 0x20u);

    }
    objc_msgSend(*(id *)(a1 + 40), "finishWithError:", v5);
  }

}

- (id)_startEngagementAuthorizationWithResult:(id)a3
{
  id v4;
  AMSMutableBinaryPromise *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  AMSMutableBinaryPromise *v11;
  AMSMutableBinaryPromise *v12;
  id v13;
  void *v14;
  AMSMutableBinaryPromise *v15;
  _QWORD v17[5];
  AMSMutableBinaryPromise *v18;
  id v19;
  _QWORD v20[4];
  AMSMutableBinaryPromise *v21;

  v4 = a3;
  v5 = objc_alloc_init(AMSMutableBinaryPromise);
  v6 = (void *)objc_opt_class();
  -[AMSUserNotificationAuthorizationTask bundleIdentifier](self, "bundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSUserNotificationAuthorizationTask options](self, "options");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "recordEngagementEventWithBundleIdentifier:options:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __80__AMSUserNotificationAuthorizationTask__startEngagementAuthorizationWithResult___block_invoke;
  v20[3] = &unk_1E253E120;
  v11 = v5;
  v21 = v11;
  objc_msgSend(v9, "addErrorBlock:", v20);
  v17[0] = v10;
  v17[1] = 3221225472;
  v17[2] = __80__AMSUserNotificationAuthorizationTask__startEngagementAuthorizationWithResult___block_invoke_2;
  v17[3] = &unk_1E2547710;
  v17[4] = self;
  v12 = v11;
  v18 = v12;
  v19 = v4;
  v13 = v4;
  objc_msgSend(v9, "addSuccessBlock:", v17);
  v14 = v19;
  v15 = v12;

  return v15;
}

uint64_t __80__AMSUserNotificationAuthorizationTask__startEngagementAuthorizationWithResult___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithError:", a2);
}

void __80__AMSUserNotificationAuthorizationTask__startEngagementAuthorizationWithResult___block_invoke_2(id *a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  NSObject *v25;
  uint64_t v26;
  void *v27;
  id v28;
  _QWORD v29[4];
  id v30;
  id v31;
  id v32;
  id v33;
  uint8_t buf[4];
  uint64_t v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v3 = a2;
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
    *(_DWORD *)buf = 138543618;
    v35 = v6;
    v36 = 2114;
    v37 = v7;
    _os_log_impl(&dword_18C849000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Successfully obtained response", buf, 0x16u);

  }
  objc_msgSend((id)objc_opt_class(), "_findEngagementRequestInResponse:", v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v9, "OSLogObject");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = objc_opt_class();
      AMSLogKey();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v35 = v11;
      v36 = 2114;
      v37 = v12;
      _os_log_impl(&dword_18C849000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Handling engagement request", buf, 0x16u);

    }
    objc_msgSend(v8, "setSilentlyCheckURL:", 1);
    objc_msgSend(a1[4], "delegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __80__AMSUserNotificationAuthorizationTask__startEngagementAuthorizationWithResult___block_invoke_43;
    v29[3] = &unk_1E25476E8;
    v30 = a1[6];
    v14 = v8;
    v15 = a1[4];
    v16 = a1[5];
    v31 = v14;
    v32 = v15;
    v33 = v16;
    objc_msgSend(v13, "handleEngagementRequest:completion:", v14, v29);

    v17 = v30;
    goto LABEL_22;
  }
  objc_msgSend(a1[4], "options");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v18, "userInitiated"))
  {
    objc_msgSend(v3, "data");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("forceTCC"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v3, "data");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("forceTCC"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "BOOLValue");

      if (v23)
        goto LABEL_15;
    }
    else
    {

    }
    AMSError(12, CFSTR("No engagement request obtained."), 0, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[5], "finishWithError:", v17);
    goto LABEL_22;
  }

LABEL_15:
  +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v24)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v24, "OSLogObject");
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    v26 = objc_opt_class();
    AMSLogKey();
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v35 = v26;
    v36 = 2114;
    v37 = v27;
    _os_log_impl(&dword_18C849000, v25, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] No engagement request obtained, attempting to present TCC dialog instead.", buf, 0x16u);

  }
  v28 = a1[5];
  objc_msgSend(a1[4], "_presentDialogForUserInitiatedWithCompletion");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "finishWithPromise:", v17);
LABEL_22:

}

void __80__AMSUserNotificationAuthorizationTask__startEngagementAuthorizationWithResult___block_invoke_43(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(*(id *)(a1 + 32), "setRequest:", *(_QWORD *)(a1 + 40));
  +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v4)
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
      v8 = objc_opt_class();
      AMSLogKey();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543874;
      v14 = v8;
      v15 = 2114;
      v16 = v9;
      v17 = 2114;
      v18 = v4;
      _os_log_impl(&dword_18C849000, v7, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Error while presenting engagement: %{public}@", (uint8_t *)&v13, 0x20u);

    }
    objc_msgSend(*(id *)(a1 + 56), "finishWithError:", v4);
  }
  else
  {
    if (!v5)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v6, "OSLogObject");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = objc_opt_class();
      AMSLogKey();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543618;
      v14 = v11;
      v15 = 2114;
      v16 = v12;
      _os_log_impl(&dword_18C849000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Engagement completed successfully", (uint8_t *)&v13, 0x16u);

    }
    objc_msgSend(*(id *)(a1 + 56), "finishWithSuccess");
  }

}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (AMSUserNotificationAuthorizationDelegate)delegate
{
  return (AMSUserNotificationAuthorizationDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (AMSUserNotificationAuthorizationOptions)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
  objc_storeStrong((id *)&self->_options, a3);
}

- (UNUserNotificationCenter)notificationCenter
{
  return self->_notificationCenter;
}

- (void)setNotificationCenter:(id)a3
{
  objc_storeStrong((id *)&self->_notificationCenter, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

@end
