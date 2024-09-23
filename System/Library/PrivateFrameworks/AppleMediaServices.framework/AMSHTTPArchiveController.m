@implementation AMSHTTPArchiveController

+ (id)harURLFilters
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__AMSHTTPArchiveController_harURLFilters__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1ECEAD280 != -1)
    dispatch_once(&qword_1ECEAD280, block);
  return (id)qword_1ECEAD278;
}

+ (BOOL)_disabled
{
  if (qword_1ECEAD288 != -1)
    dispatch_once(&qword_1ECEAD288, &__block_literal_global_64);
  return _MergedGlobals_112;
}

+ (void)initialize
{
  __CFNotificationCenter *DarwinNotifyCenter;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, a1, (CFNotificationCallback)_AMSHTTPArchiveControllerUpdateHarURLFilters, CFSTR("AMSUpdateHARFiltersNotification"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
}

uint64_t __41__AMSHTTPArchiveController_harURLFilters__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateHarFileFilters");
}

+ (BOOL)isRemoveDisabled
{
  id v2;
  char v3;

  v2 = a1;
  objc_sync_enter(v2);
  v3 = AMSHTTPArchiveControllerRemoveDisabled;
  objc_sync_exit(v2);

  return v3;
}

+ (void)setRemoveDisabled:(BOOL)a3
{
  id obj;

  obj = a1;
  objc_sync_enter(obj);
  AMSHTTPArchiveControllerRemoveDisabled = a3;
  objc_sync_exit(obj);

}

+ (NSNumber)maxBufferSizeOverride
{
  return (NSNumber *)&unk_1E25AF5D8;
}

+ (void)addHTTPArchive:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  char v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  int v29;
  uint64_t v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  AMSSetLogKeyIfNeeded();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(a1, "_disabled"))
  {
    objc_msgSend(a1, "harURLFilters");
    v10 = objc_claimAutoreleasedReturnValue();
    if (v10
      && (v11 = (void *)v10,
          objc_msgSend(a1, "harURLFilters"),
          v12 = (void *)objc_claimAutoreleasedReturnValue(),
          v13 = objc_msgSend(v12, "count"),
          v12,
          v11,
          v13))
    {
      if (!objc_msgSend(a1, "_shouldAddRequest:", v4))
        goto LABEL_25;
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
        objc_msgSend(v4, "urlString");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        AMSHashIfNeeded(v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "harURLFilters");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = 138544130;
        v30 = v16;
        v31 = 2114;
        v32 = v5;
        v33 = 2114;
        v34 = v18;
        v35 = 2114;
        v36 = v19;
        _os_log_impl(&dword_18C849000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Write HTTP Archive to disk for URL string: %{public}@ with HAR URL Filters: %{public}@", (uint8_t *)&v29, 0x2Au);

      }
    }
    else
    {
      if (!+[AMSDefaults streamHARToDisk](AMSDefaults, "streamHARToDisk"))
      {
        +[AMSProcessInfo currentProcess](AMSProcessInfo, "currentProcess");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "executableName");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v21, "isEqualToString:", CFSTR("amstoold"));

        if ((v22 & 1) != 0)
        {
          +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v6)
          {
            +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
            v6 = (void *)objc_claimAutoreleasedReturnValue();
          }
          objc_msgSend(v6, "OSLogObject");
          v7 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
          {
            v23 = objc_opt_class();
            objc_msgSend(v4, "urlString");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            AMSHashIfNeeded(v24);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v29 = 138543874;
            v30 = v23;
            v31 = 2114;
            v32 = v5;
            v33 = 2114;
            v34 = v25;
            _os_log_impl(&dword_18C849000, v7, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Skipping HTTP Archive, we should not hit this path. URL: %{public}@", (uint8_t *)&v29, 0x20u);

          }
          goto LABEL_6;
        }
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
        v26 = objc_opt_class();
        objc_msgSend(v4, "urlString");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        AMSHashIfNeeded(v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = 138543874;
        v30 = v26;
        v31 = 2114;
        v32 = v5;
        v33 = 2114;
        v34 = v28;
        _os_log_impl(&dword_18C849000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Write HTTP Archive to disk for URL string: %{public}@", (uint8_t *)&v29, 0x20u);

      }
    }

    objc_msgSend(v4, "writeToDiskWithError:compressed:", 0, 0);
    goto LABEL_25;
  }
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
    v29 = 138543618;
    v30 = v8;
    v31 = 2114;
    v32 = v9;
    _os_log_impl(&dword_18C849000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Error adding HAR, disabled", (uint8_t *)&v29, 0x16u);

  }
LABEL_6:

LABEL_25:
}

void __37__AMSHTTPArchiveController__disabled__block_invoke()
{
  void *v0;
  void *v1;
  char v2;

  if (+[AMSUnitTests isRunningUnitTests](AMSUnitTests, "isRunningUnitTests")
    || !os_variant_has_internal_content()
    || +[AMSDefaults disableHARLogging](AMSDefaults, "disableHARLogging")
    || (objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"),
        v0 = (void *)objc_claimAutoreleasedReturnValue(),
        +[AMSHTTPArchive directory](AMSHTTPArchive, "directory"),
        v1 = (void *)objc_claimAutoreleasedReturnValue(),
        v2 = objc_msgSend(v0, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v1, 1, 0, 0),
        v1,
        v0,
        (v2 & 1) == 0))
  {
    _MergedGlobals_112 = 1;
  }
}

+ (id)_harURLFilters
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  if ((objc_msgSend(a1, "_disabled") & 1) == 0)
  {
    +[AMSDefaults harURLFilters](AMSDefaults, "harURLFilters");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if (v3)
    {
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("*"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      if (v5)
      {
        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("*"));
        v2 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_11:

        return v2;
      }
      +[AMSProcessInfo currentProcess](AMSProcessInfo, "currentProcess");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "bundleIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7)
      {
        objc_msgSend(v4, "objectForKeyedSubscript:", v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        if (v8)
        {
          objc_msgSend(v4, "objectForKeyedSubscript:", v7);
          v2 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_11;
        }
      }

    }
    v2 = 0;
    goto LABEL_11;
  }
  v2 = 0;
  return v2;
}

+ (BOOL)_shouldAddRequest:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "urlString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length");

  if (v5)
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v6 = (id)qword_1ECEAD278;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v14;
      while (2)
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v14 != v8)
            objc_enumerationMutation(v6);
          v10 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i);
          objc_msgSend(v3, "urlString", (_QWORD)v13);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          LOBYTE(v10) = objc_msgSend(v11, "containsString:", v10);

          if ((v10 & 1) != 0)
          {
            LOBYTE(v7) = 1;
            goto LABEL_12;
          }
        }
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v7)
          continue;
        break;
      }
    }
LABEL_12:

  }
  else
  {
    LOBYTE(v7) = 1;
  }

  return v7;
}

+ (void)_updateHarFileFilters
{
  uint64_t v2;
  void *v3;
  id obj;

  obj = a1;
  objc_sync_enter(obj);
  objc_msgSend(obj, "_harURLFilters");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)qword_1ECEAD278;
  qword_1ECEAD278 = v2;

  objc_sync_exit(obj);
}

@end
