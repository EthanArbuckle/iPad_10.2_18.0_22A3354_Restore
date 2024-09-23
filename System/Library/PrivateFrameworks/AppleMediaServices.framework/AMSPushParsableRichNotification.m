@implementation AMSPushParsableRichNotification

+ (void)handleNotificationPayload:(id)a3 config:(id)a4 bag:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  _BOOL4 v12;
  id v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  id v19;
  NSObject *v20;
  void *v21;
  id v22;
  id v23;
  unsigned __int8 v24;
  uint8_t buf[4];
  id v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v8, "clientIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0;
  v23 = 0;
  v12 = +[AMSUserNotification shouldDeleteNotificationForPayload:outIdentifier:scheduledOnly:](AMSUserNotification, "shouldDeleteNotificationForPayload:outIdentifier:scheduledOnly:", v8, &v23, &v24);
  v13 = v23;
  +[AMSLogConfig sharedPushNotificationConfig](AMSLogConfig, "sharedPushNotificationConfig");
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)v14;
  if (v12)
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
      objc_msgSend(v8, "logKey");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v26 = a1;
      v27 = 2114;
      v28 = v17;
      v29 = 2114;
      v30 = v11;
      _os_log_impl(&dword_18C849000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Deleting notification with identifier: %{public}@", buf, 0x20u);

    }
    AMSLogKey();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = +[AMSUserNotificationCenter removeNotificationWithIdentifier:centerBundleId:logKey:scheduledOnly:](AMSUserNotificationCenter, "removeNotificationWithIdentifier:centerBundleId:logKey:scheduledOnly:", v13, v11, v18, v24);
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
      objc_msgSend(v8, "logKey");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v26 = a1;
      v27 = 2114;
      v28 = v21;
      v29 = 2114;
      v30 = v11;
      _os_log_impl(&dword_18C849000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Posting notification with identifier: %{public}@", buf, 0x20u);

    }
    +[AMSUserNotification notificationWithPayload:andConfig:](AMSUserNotification, "notificationWithPayload:andConfig:", v8, v9);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = +[AMSUserNotificationCenter postNotification:bag:centerBundleId:](AMSUserNotificationCenter, "postNotification:bag:centerBundleId:", v18, v10, v11);
  }

}

+ (BOOL)shouldSkipAccountCheck
{
  return 1;
}

@end
