@implementation AMSPushParsableBadging

+ (void)handleNotificationPayload:(id)a3 config:(id)a4 bag:(id)a5
{
  id v7;
  id v8;
  id v9;
  AMSBadgeRequest *v10;
  void *v11;
  NSObject *v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  void *v21;
  char v22;
  id v23;
  void *v24;
  NSObject *v25;
  NSObject *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  id v32;
  id v33;
  uint8_t buf[4];
  uint64_t v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  _BOOL4 v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v32 = a5;
  v9 = AMSSetLogKeyIfNeeded();
  v10 = -[AMSBadgeRequest initWithPushPayload:]([AMSBadgeRequest alloc], "initWithPushPayload:", v7);
  +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
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
    v13 = v8;
    v14 = objc_opt_class();
    AMSLogKey();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSBadgeRequest bundleIdentifier](v10, "bundleIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSBadgeRequest badgeIdentifier](v10, "badgeIdentifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544386;
    v35 = v14;
    v8 = v13;
    v36 = 2114;
    v37 = v15;
    v38 = 2114;
    v39 = v16;
    v40 = 2114;
    v41 = v17;
    v42 = 1024;
    v43 = -[AMSBadgeRequest enabled](v10, "enabled");
    _os_log_impl(&dword_18C849000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Received badging push. Client: %{public}@ Id: %{public}@ enabled: %d", buf, 0x30u);

  }
  objc_msgSend(v8, "delegate");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_opt_respondsToSelector();

  objc_msgSend(v8, "delegate");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v20;
  if ((v19 & 1) != 0)
  {
    objc_msgSend(v20, "pushPayload:withBadgeRequest:", v7, v10);

LABEL_16:
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
      v29 = objc_opt_class();
      AMSLogKey();
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v35 = v29;
      v36 = 2114;
      v37 = v30;
      _os_log_impl(&dword_18C849000, v25, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Finished handling badge push.", buf, 0x16u);

    }
    goto LABEL_20;
  }
  v22 = objc_opt_respondsToSelector();

  if ((v22 & 1) != 0)
  {
    v33 = 0;
    objc_msgSend(a1, "_performLegacyCallbackWithRequest:payload:config:bag:error:", v10, v7, v8, v32, &v33);
    v23 = v33;
  }
  else
  {
    AMSError(11, CFSTR("Failed To Badge"), CFSTR("No delegate registered to provide consent"), 0);
    v23 = (id)objc_claimAutoreleasedReturnValue();
  }
  v24 = v23;
  if (!v23)
    goto LABEL_16;
  +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
  v25 = objc_claimAutoreleasedReturnValue();
  if (!v25)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v25 = objc_claimAutoreleasedReturnValue();
  }
  -[NSObject OSLogObject](v25, "OSLogObject");
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
  {
    v27 = objc_opt_class();
    AMSLogKey();
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v35 = v27;
    v36 = 2114;
    v37 = v28;
    v38 = 2114;
    v39 = v24;
    _os_log_impl(&dword_18C849000, v26, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to handle badge push. %{public}@", buf, 0x20u);

  }
LABEL_20:

}

+ (BOOL)shouldSkipAccountCheck
{
  return 1;
}

+ (void)_performLegacyCallbackWithRequest:(id)a3 payload:(id)a4 config:(id)a5 bag:(id)a6 error:(id *)a7
{
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  uint64_t v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a6;
  v13 = a4;
  objc_msgSend(a5, "delegate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "bundleIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "badgeIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v14, "pushPaylod:shouldUpdateBadgeForBundleIdentifier:badgeIdentifier:enabled:", v13, v15, v16, objc_msgSend(v11, "enabled"));

  if ((v17 & 1) != 0)
  {
    objc_msgSend(v11, "bundleIdentifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "badgeIdentifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    +[AMSUserNotificationCenter badgeBundleId:badgeId:enabled:error:](AMSUserNotificationCenter, "badgeBundleId:badgeId:enabled:error:", v18, v19, objc_msgSend(v11, "enabled"), a7);

  }
  else
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
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
      v29 = 138543618;
      v30 = v22;
      v31 = 2114;
      v32 = v23;
      _os_log_impl(&dword_18C849000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Not allowed to badge.", (uint8_t *)&v29, 0x16u);

    }
  }
  objc_msgSend(v11, "metrics");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    objc_msgSend(v11, "metrics");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "bundleIdentifier");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    +[AMSUserNotificationMetricsEvent eventForBadgingForMetricsDictionary:bundleID:](AMSUserNotificationMetricsEvent, "eventForBadgingForMetricsDictionary:bundleID:", v25, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    +[AMSMetrics internalInstanceUsingBag:](AMSMetrics, "internalInstanceUsingBag:", v12);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "enqueueEvent:", v27);

  }
}

@end
