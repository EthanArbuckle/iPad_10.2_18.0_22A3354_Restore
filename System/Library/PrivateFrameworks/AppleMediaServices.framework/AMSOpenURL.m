@implementation AMSOpenURL

- (AMSOpenURL)initWithURL:(id)a3 clientInfo:(id)a4 bag:(id)a5
{
  id v9;
  id v10;
  id v11;
  AMSOpenURL *v12;
  AMSOpenURL *v13;
  AMSProcessInfo *v14;
  AMSProcessInfo *clientInfo;
  objc_super v17;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)AMSOpenURL;
  v12 = -[AMSOpenURL init](&v17, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_URL, a3);
    objc_storeStrong((id *)&v13->_bag, a5);
    if (v10)
    {
      v14 = (AMSProcessInfo *)v10;
    }
    else
    {
      +[AMSProcessInfo currentProcess](AMSProcessInfo, "currentProcess");
      v14 = (AMSProcessInfo *)objc_claimAutoreleasedReturnValue();
    }
    clientInfo = v13->_clientInfo;
    v13->_clientInfo = v14;

  }
  return v13;
}

+ (BOOL)openStandardURL:(id)a3
{
  id v4;
  id v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  char v20;
  id v22;
  uint8_t buf[4];
  uint64_t v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = AMSSetLogKeyIfNeeded();
  +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
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
    v8 = objc_opt_class();
    AMSLogKey();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    AMSLogableURL(v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v24 = v8;
    v25 = 2114;
    v26 = v9;
    v27 = 2114;
    v28 = v10;
    _os_log_impl(&dword_18C849000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Opening URL: %{public}@", buf, 0x20u);

  }
  v22 = 0;
  objc_msgSend(MEMORY[0x1E0CA5838], "appLinksWithURL:limit:includeLinksForCurrentApplication:error:", v4, 1, 1, &v22);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v22;
  +[AMSProcessInfo currentProcess](AMSProcessInfo, "currentProcess");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "bundleIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

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
    v17 = objc_opt_class();
    AMSLogKey();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    AMSLogableURL(v4);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544642;
    v24 = v17;
    v25 = 2114;
    v26 = v18;
    v27 = 2114;
    v28 = v19;
    v29 = 2114;
    v30 = v14;
    v31 = 2114;
    v32 = v11;
    v33 = 2114;
    v34 = v12;
    _os_log_impl(&dword_18C849000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Asking for appLinks for URL: %{public}@ from app %{public}@ returned: %{public}@ with error: %{public}@", buf, 0x3Eu);

  }
  if (objc_msgSend(a1, "_openModeForStandardURL:inApp:withLinks:", v4, v14, v11) == 1
    && (objc_msgSend(a1, "_openURL:inApp:", v4, v14) & 1) != 0)
  {
    v20 = 1;
  }
  else
  {
    v20 = objc_msgSend(a1, "_openURLWithLaunchServices:", v4);
  }

  return v20;
}

+ (void)openURL:(id)a3 account:(id)a4 preferredClient:(id)a5
{
  id v7;
  void *v8;
  id v9;
  id v10;

  v10 = a3;
  v7 = a5;
  +[AMSProcessInfo currentProcess](AMSProcessInfo, "currentProcess");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setProxyAppBundleID:", v7);

  v9 = (id)objc_msgSend(a1, "openURL:clientInfo:bag:", v10, v8, 0);
}

+ (id)openURL:(id)a3 clientInfo:(id)a4 bag:(id)a5
{
  id v7;
  id v8;
  id v9;
  AMSOpenURL *v10;
  void *v11;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = -[AMSOpenURL initWithURL:clientInfo:bag:]([AMSOpenURL alloc], "initWithURL:clientInfo:bag:", v9, v8, v7);

  -[AMSOpenURL _performOpen](v10, "_performOpen");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)_performOpen
{
  AMSMutableBinaryPromise *v3;
  void *v4;
  NSObject *v5;
  AMSMutableBinaryPromise *v6;
  id v7;
  AMSMutableBinaryPromise *v8;
  AMSMutableBinaryPromise *v9;
  _QWORD block[4];
  id v12;
  AMSOpenURL *v13;
  AMSMutableBinaryPromise *v14;

  v3 = objc_alloc_init(AMSMutableBinaryPromise);
  AMSSetLogKeyIfNeeded();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  dispatch_get_global_queue(25, 0);
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __26__AMSOpenURL__performOpen__block_invoke;
  block[3] = &unk_1E25414B8;
  v12 = v4;
  v13 = self;
  v6 = v3;
  v14 = v6;
  v7 = v4;
  dispatch_async(v5, block);

  v8 = v14;
  v9 = v6;

  return v9;
}

void __26__AMSOpenURL__performOpen__block_invoke(void **a1)
{
  id v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  AMSProcessInfo *v7;
  void *v8;
  void *v9;
  AMSProcessInfo *v10;
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
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  NSObject *v36;
  uint64_t v37;
  void *v38;
  uint8_t buf[4];
  uint64_t v40;
  __int16 v41;
  void *v42;
  __int16 v43;
  void *v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v2 = AMSSetLogKey(a1[4]);
  v3 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  objc_msgSend(a1[5], "setAttemptedTargets:", v3);

  objc_msgSend(a1[5], "URL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4
    || (AMSError(2, CFSTR("Open URL Failed"), CFSTR("No URL to open"), 0),
        (v12 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    objc_msgSend(a1[5], "clientInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "proxyAppBundleID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = [AMSProcessInfo alloc];
      objc_msgSend(a1[5], "clientInfo");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "proxyAppBundleID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = -[AMSProcessInfo initWithBundleIdentifier:](v7, "initWithBundleIdentifier:", v9);

      +[AMSMappedBundleInfo bundleInfoForProcessInfo:](AMSMappedBundleInfo, "bundleInfoForProcessInfo:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v11 = 0;
    }
    v13 = a1[5];
    objc_msgSend(v13, "URL");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v13) = objc_msgSend(v13, "_openURL:bundleInfo:", v14, v11);

    if ((v13 & 1) != 0)
      goto LABEL_14;
    objc_msgSend(a1[5], "clientInfo");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      objc_msgSend(a1[5], "clientInfo");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      +[AMSMappedBundleInfo bundleInfoForProcessInfo:](AMSMappedBundleInfo, "bundleInfoForProcessInfo:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      v18 = a1[5];
      objc_msgSend(v18, "URL");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v18) = objc_msgSend(v18, "_openURL:bundleInfo:", v19, v17);

      if ((v18 & 1) != 0)
        goto LABEL_14;
    }
    objc_msgSend(a1[5], "clientInfo");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      objc_msgSend(a1[5], "clientInfo");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      +[AMSMappedBundleInfo bundleInfoForMobileAppStoreWithProcessInfo:](AMSMappedBundleInfo, "bundleInfoForMobileAppStoreWithProcessInfo:", v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      v23 = a1[5];
      objc_msgSend(v23, "URL");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v23) = objc_msgSend(v23, "_openURL:bundleInfo:", v24, v22);

      if ((v23 & 1) != 0)
        goto LABEL_14;
    }
    v25 = a1[5];
    objc_msgSend(v25, "URL");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v25) = objc_msgSend(v25, "_shouldOpenURL:", v26);

    if ((_DWORD)v25)
    {
      v27 = (void *)objc_opt_class();
      objc_msgSend(a1[5], "URL");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v27) = objc_msgSend(v27, "openStandardURL:", v28);

      if ((_DWORD)v27)
      {
LABEL_14:
        objc_msgSend(a1[6], "finishWithSuccess");
        return;
      }
    }
    objc_msgSend(a1[5], "URL");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    AMSErrorWithFormat(0, CFSTR("Open URL Failed"), CFSTR("Unable to open the given URL: %@"), v30, v31, v32, v33, v34, (uint64_t)v29);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v35)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v35, "OSLogObject");
  v36 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
  {
    v37 = objc_opt_class();
    AMSLogKey();
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v40 = v37;
    v41 = 2114;
    v42 = v38;
    v43 = 2114;
    v44 = v12;
    _os_log_impl(&dword_18C849000, v36, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to open URL. %{public}@", buf, 0x20u);

  }
  objc_msgSend(a1[6], "finishWithError:", v12);

}

+ (id)_modifiedURLFromURL:(id)a3 bundleInfo:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v5 = a3;
  v6 = a4;
  if (v6)
  {
    objc_msgSend(v5, "scheme");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isEqualToString:", CFSTR("http")))
    {
      objc_msgSend(v6, "scheme");
      v8 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (!objc_msgSend(v7, "isEqualToString:", CFSTR("https")))
      {
        v10 = 0;
        goto LABEL_10;
      }
      objc_msgSend(v6, "secureScheme");
      v8 = objc_claimAutoreleasedReturnValue();
    }
    v10 = (void *)v8;
    if (v8)
    {
      objc_msgSend(v5, "absoluteString");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "substringFromIndex:", objc_msgSend(v7, "length"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "stringByAppendingString:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initWithString:", v13);
LABEL_11:

      goto LABEL_12;
    }
LABEL_10:
    v9 = 0;
    goto LABEL_11;
  }
  v9 = 0;
LABEL_12:

  return v9;
}

- (BOOL)_openURL:(id)a3 bundleInfo:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  char v15;

  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x18D78A1C4]();
  objc_msgSend((id)objc_opt_class(), "_modifiedURLFromURL:bundleInfo:", v6, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "applicationsAvailableForOpeningURL:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9 && objc_msgSend(v11, "count"))
    v12 = v9;
  else
    v12 = 0;
  if (-[AMSOpenURL _shouldOpenURL:](self, "_shouldOpenURL:", v12))
  {
    -[AMSOpenURL attemptedTargets](self, "attemptedTargets");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "absoluteString");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObject:", v14);

    v15 = objc_msgSend((id)objc_opt_class(), "openStandardURL:", v12);
  }
  else
  {
    v15 = 0;
  }

  objc_autoreleasePoolPop(v8);
  return v15;
}

- (BOOL)_shouldOpenURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;

  v4 = a3;
  objc_msgSend(v4, "absoluteString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "length"))
  {
    -[AMSOpenURL attemptedTargets](self, "attemptedTargets");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "absoluteString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "containsObject:", v7) ^ 1;

  }
  else
  {
    LOBYTE(v8) = 0;
  }

  return v8;
}

+ (BOOL)_shouldOpenStandardURL:(id)a3 inApp:(id)a4 withLinks:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  BOOL v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  int v20;
  uint64_t v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  objc_msgSend(a5, "firstObject");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  v11 = 0;
  if (!v8 || !v9)
    goto LABEL_14;
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
LABEL_13:
    v11 = 0;
    goto LABEL_14;
  }
  objc_msgSend(v10, "targetApplicationRecord");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
LABEL_12:

    goto LABEL_13;
  }
  objc_msgSend(v12, "bundleIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v8, "isEqualToString:", v13))
  {

    goto LABEL_12;
  }
  +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
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
    v16 = objc_opt_class();
    AMSLogKey();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    AMSLogableURL(v7);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 138544130;
    v21 = v16;
    v22 = 2114;
    v23 = v17;
    v24 = 2114;
    v25 = v18;
    v26 = 2114;
    v27 = v8;
    _os_log_impl(&dword_18C849000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] URL (%{public}@) is a universal link for the currently open app (%{public}@).", (uint8_t *)&v20, 0x2Au);

  }
  v11 = 1;
LABEL_14:

  return v11;
}

+ (unint64_t)_openModeForStandardURL:(id)a3 inApp:(id)a4 withLinks:(id)a5
{
  return objc_msgSend(a1, "_shouldOpenStandardURL:inApp:withLinks:", a3, a4, a5);
}

+ (BOOL)_openURLWithLaunchServices:(id)a3
{
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  int v17;
  uint64_t v18;
  __int16 v19;
  void *v20;
  _QWORD v21[3];
  _QWORD v22[4];

  v22[3] = *MEMORY[0x1E0C80C00];
  v3 = *MEMORY[0x1E0D22DA8];
  v21[0] = *MEMORY[0x1E0D22D88];
  v21[1] = v3;
  v22[0] = MEMORY[0x1E0C9AAB0];
  v22[1] = MEMORY[0x1E0C9AAB0];
  v21[2] = *MEMORY[0x1E0D22D58];
  v22[2] = CFSTR("AMSOpenURL");
  v4 = (void *)MEMORY[0x1E0C99D80];
  v5 = a3;
  objc_msgSend(v4, "dictionaryWithObjects:forKeys:count:", v22, v21, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "openSensitiveURL:withOptions:", v5, v6);

  +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (v8)
  {
    if (!v9)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v10, "OSLogObject");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = objc_opt_class();
      AMSLogKey();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138543618;
      v18 = v12;
      v19 = 2114;
      v20 = v13;
      v14 = "%{public}@: [%{public}@] URL opened successfully.";
LABEL_10:
      _os_log_impl(&dword_18C849000, v11, OS_LOG_TYPE_DEFAULT, v14, (uint8_t *)&v17, 0x16u);

    }
  }
  else
  {
    if (!v9)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v10, "OSLogObject");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v15 = objc_opt_class();
      AMSLogKey();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138543618;
      v18 = v15;
      v19 = 2114;
      v20 = v13;
      v14 = "%{public}@: [%{public}@] URL failed to open.";
      goto LABEL_10;
    }
  }

  return v8;
}

+ (BOOL)_openURL:(id)a3 inApp:(id)a4
{
  id v6;
  id v7;
  AMSProcessInfo *v8;
  void *v9;
  void *v10;
  char v11;

  v6 = a4;
  v7 = a3;
  v8 = -[AMSProcessInfo initWithBundleIdentifier:]([AMSProcessInfo alloc], "initWithBundleIdentifier:", v6);

  +[AMSMappedBundleInfo bundleInfoForProcessInfo:](AMSMappedBundleInfo, "bundleInfoForProcessInfo:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_modifiedURLFromURL:bundleInfo:", v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
    v11 = objc_msgSend(a1, "_openURLWithLaunchServices:", v10);
  else
    v11 = 0;

  return v11;
}

- (NSMutableSet)attemptedTargets
{
  return self->_attemptedTargets;
}

- (void)setAttemptedTargets:(id)a3
{
  objc_storeStrong((id *)&self->_attemptedTargets, a3);
}

- (NSURL)URL
{
  return self->_URL;
}

- (AMSProcessInfo)clientInfo
{
  return self->_clientInfo;
}

- (void)setClientInfo:(id)a3
{
  objc_storeStrong((id *)&self->_clientInfo, a3);
}

- (AMSBagProtocol)bag
{
  return self->_bag;
}

- (void)setBag:(id)a3
{
  objc_storeStrong((id *)&self->_bag, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bag, 0);
  objc_storeStrong((id *)&self->_clientInfo, 0);
  objc_storeStrong((id *)&self->_URL, 0);
  objc_storeStrong((id *)&self->_attemptedTargets, 0);
}

@end
