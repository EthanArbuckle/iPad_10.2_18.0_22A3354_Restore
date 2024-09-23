@implementation AMSFeatureFlagTask

- (id)perform
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __29__AMSFeatureFlagTask_perform__block_invoke;
  v3[3] = &unk_1E2541E90;
  v3[4] = self;
  -[AMSTask performTaskWithBlock:](self, "performTaskWithBlock:", v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

id __29__AMSFeatureFlagTask_perform__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_updateRemoteFeatureFlags");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "resultWithError:", a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)lastFetchedDate
{
  CFPreferencesAppSynchronize(CFSTR("com.apple.storeservices.itfe"));
  return (id)(id)CFPreferencesCopyAppValue(CFSTR("lastFetched"), CFSTR("com.apple.storeservices.itfe"));
}

+ (id)cachedRemoteGroups
{
  void *v2;
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(a1, "_cachePath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "fileExistsAtPath:", v2);

  if (v4)
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithContentsOfFile:", v2);
    if (v5)
    {
      +[AMSFeatureFlagGroup groupsFromDomainData:domain:](AMSFeatureFlagGroup, "groupsFromDomainData:domain:", v5, CFSTR("AMPFlagRemote"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "allValues");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (void)clearCache
{
  void *v2;
  void *v3;
  int v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "_cachePath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "fileExistsAtPath:", v2);

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 0;
    objc_msgSend(v5, "removeItemAtPath:error:", v2, &v15);
    v6 = v15;

    +[AMSLogConfig sharedAccountsDaemonConfig](AMSLogConfig, "sharedAccountsDaemonConfig");
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
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        goto LABEL_12;
      v10 = (void *)objc_opt_class();
      v11 = v10;
      AMSLogKey();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      AMSLogableError(v6);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v17 = v10;
      v18 = 2114;
      v19 = v12;
      v20 = 2114;
      v21 = v13;
      _os_log_impl(&dword_18C849000, v9, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Error when clearing server-side feature flag cache: %{public}@", buf, 0x20u);

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
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        goto LABEL_12;
      v14 = (void *)objc_opt_class();
      v11 = v14;
      AMSLogKey();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v17 = v14;
      v18 = 2114;
      v19 = v12;
      _os_log_impl(&dword_18C849000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Successfully cleared server-side feature flag cache", buf, 0x16u);
    }

LABEL_12:
  }
  CFPreferencesSetAppValue(CFSTR("lastFetched"), 0, CFSTR("com.apple.storeservices.itfe"));
  CFPreferencesAppSynchronize(CFSTR("com.apple.storeservices.itfe"));

}

- (id)_updateRemoteFeatureFlags
{
  void *v3;
  NSObject *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  AMSBagActiveAccountProvider *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  id v26;
  id v27;
  void *v28;
  void *v29;
  void *v31;
  void *v32;
  _QWORD v33[5];
  _QWORD v34[5];
  _QWORD v35[4];
  id v36;
  id v37;
  uint8_t buf[4];
  void *v39;
  __int16 v40;
  void *v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  +[AMSLogConfig sharedAccountsDaemonConfig](AMSLogConfig, "sharedAccountsDaemonConfig");
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
    v39 = v5;
    v40 = 2114;
    v41 = v7;
    _os_log_impl(&dword_18C849000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Starting server-side feature flag caching", buf, 0x16u);

  }
  +[AMSFeatureFlagTask createBagForSubProfile](AMSFeatureFlagTask, "createBagForSubProfile");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "URLForKey:", CFSTR("featureFlagUrl"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "valuePromise");
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  +[AMSProcessInfo currentProcess](AMSProcessInfo, "currentProcess");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_alloc_init(AMSBagActiveAccountProvider);
  objc_msgSend(v10, "accountMediaType");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSBagActiveAccountProvider bagStorefrontForAccountMediaType:](v11, "bagStorefrontForAccountMediaType:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  +[AMSDefaults storefrontSuffixes](AMSDefaults, "storefrontSuffixes");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = v10;
  objc_msgSend(v10, "bundleIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKeyedSubscript:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v16, "length") && (objc_msgSend(v13, "containsString:", v16) & 1) == 0)
  {
    objc_msgSend(v13, "stringByAppendingString:", v16);
    v17 = objc_claimAutoreleasedReturnValue();

    v13 = (void *)v17;
  }
  v18 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  +[AMSDevice operatingSystem](AMSDevice, "operatingSystem");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "appendFormat:", CFSTR("os=%@"), v19);

  +[AMSDevice productVersion](AMSDevice, "productVersion");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "appendFormat:", CFSTR("&osVersion=%@"), v20);

  objc_msgSend((id)objc_opt_class(), "_deviceClass");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "appendFormat:", CFSTR("&deviceClass=%@"), v21);

  if (v13)
    objc_msgSend(v18, "appendFormat:", CFSTR("&storefront=%@"), v13);
  objc_msgSend(MEMORY[0x1E0CB3500], "URLQueryAllowedCharacterSet");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)objc_msgSend(v22, "mutableCopy");

  objc_msgSend(v23, "removeCharactersInString:", CFSTR("+"));
  objc_msgSend(v18, "stringByAddingPercentEncodingWithAllowedCharacters:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = MEMORY[0x1E0C809B0];
  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v35[2] = __47__AMSFeatureFlagTask__updateRemoteFeatureFlags__block_invoke;
  v35[3] = &unk_1E2541EB8;
  v36 = v24;
  v37 = v8;
  v26 = v8;
  v27 = v24;
  objc_msgSend(v32, "thenWithBlock:", v35);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v34[0] = v25;
  v34[1] = 3221225472;
  v34[2] = __47__AMSFeatureFlagTask__updateRemoteFeatureFlags__block_invoke_2;
  v34[3] = &unk_1E253FFE0;
  v34[4] = self;
  objc_msgSend(v28, "addFinishBlock:", v34);
  v33[0] = v25;
  v33[1] = 3221225472;
  v33[2] = __47__AMSFeatureFlagTask__updateRemoteFeatureFlags__block_invoke_54;
  v33[3] = &unk_1E253E418;
  v33[4] = self;
  objc_msgSend(v28, "thenWithBlock:", v33);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  return v29;
}

id __47__AMSFeatureFlagTask__updateRemoteFeatureFlags__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  AMSURLRequestEncoder *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@?%@"), a2, *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[AMSURLRequestEncoder initWithBag:]([AMSURLRequestEncoder alloc], "initWithBag:", *(_QWORD *)(a1 + 40));
  AMSLogKey();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSURLRequestEncoder setLogUUID:](v5, "setLogUUID:", v6);

  -[AMSURLRequestEncoder requestWithMethod:URL:parameters:](v5, "requestWithMethod:URL:parameters:", 2, v4, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSURLSession defaultSession](AMSURLSession, "defaultSession");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dataTaskPromiseWithRequestPromise:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

void __47__AMSFeatureFlagTask__updateRemoteFeatureFlags__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  +[AMSLogConfig sharedAccountsDaemonConfig](AMSLogConfig, "sharedAccountsDaemonConfig");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v3)
  {
    if (!v4)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v5, "OSLogObject");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = (void *)objc_opt_class();
      v8 = v7;
      AMSLogKey();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      AMSLogableError(v3);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543874;
      v13 = v7;
      v14 = 2114;
      v15 = v9;
      v16 = 2114;
      v17 = v10;
      _os_log_impl(&dword_18C849000, v6, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Error with requesting server-side feature flags: %{public}@", (uint8_t *)&v12, 0x20u);

LABEL_10:
    }
  }
  else
  {
    if (!v4)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v5, "OSLogObject");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v11 = (void *)objc_opt_class();
      v8 = v11;
      AMSLogKey();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543618;
      v13 = v11;
      v14 = 2114;
      v15 = v9;
      _os_log_impl(&dword_18C849000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Successfully received feature flag network response", (uint8_t *)&v12, 0x16u);
      goto LABEL_10;
    }
  }

}

id __47__AMSFeatureFlagTask__updateRemoteFeatureFlags__block_invoke_54(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  int v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v10;

  objc_msgSend(a2, "object");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;

  v10 = 0;
  v4 = objc_msgSend((id)objc_opt_class(), "_cacheResponse:error:", v3, &v10);
  v5 = v10;
  if (v4)
  {
    +[AMSFeatureFlagGroup groupsFromDomainData:domain:](AMSFeatureFlagGroup, "groupsFromDomainData:domain:", v3, CFSTR("AMPFlagRemote"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "allValues");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "makeObjectsPerformSelector:", sel_activateITFEs);
    objc_msgSend((id)objc_opt_class(), "_handleDeletedITFEsFromResponse:", v3);
    +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    +[AMSPromise promiseWithError:](AMSPromise, "promiseWithError:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

+ (id)_cacheDirectory
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0C99E98], "ams_cachesDirectory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByAppendingPathComponent:isDirectory:", CFSTR("feature-flags"), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v5, 1, 0, 0);

  return v3;
}

+ (id)_cachePath
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a1, "_cacheDirectory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByAppendingPathComponent:", CFSTR("response.plist"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (BOOL)_cacheResponse:(id)a3 error:(id *)a4
{
  void *v6;
  id v7;
  BOOL v8;
  id v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  id v17;
  id v18;
  uint8_t buf[4];
  id v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v18 = 0;
  objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", a3, 200, 0, &v18);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v18;
  v8 = v7 == 0;
  if (v7)
  {
    v9 = v7;
    +[AMSLogConfig sharedAccountsDaemonConfig](AMSLogConfig, "sharedAccountsDaemonConfig");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v10, "OSLogObject");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      AMSLogKey();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      AMSLogableError(v9);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v20 = a1;
      v21 = 2114;
      v22 = v12;
      v23 = 2114;
      v24 = v13;
      _os_log_impl(&dword_18C849000, v11, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Error with serializing feature flag response data: %{public}@", buf, 0x20u);

LABEL_11:
    }
  }
  else
  {
    objc_msgSend(a1, "_cachePath");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 0;
    v15 = objc_msgSend(v6, "writeToFile:options:error:", v14, 1, &v17);
    v9 = v17;

    if (!v15)
    {
      v8 = 0;
      if (!a4)
        goto LABEL_14;
      goto LABEL_13;
    }
    CFPreferencesSetAppValue(CFSTR("lastFetched"), (CFPropertyListRef)objc_msgSend(MEMORY[0x1E0C99D68], "date"), CFSTR("com.apple.storeservices.itfe"));
    CFPreferencesAppSynchronize(CFSTR("com.apple.storeservices.itfe"));
    +[AMSLogConfig sharedAccountsDaemonConfig](AMSLogConfig, "sharedAccountsDaemonConfig");
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
      AMSLogKey();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v20 = a1;
      v21 = 2114;
      v22 = v12;
      _os_log_impl(&dword_18C849000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Successfully cached feature flag response to disk", buf, 0x16u);
      goto LABEL_11;
    }
  }

  if (a4)
LABEL_13:
    *a4 = objc_retainAutorelease(v9);
LABEL_14:

  return v8;
}

+ (void)_handleDeletedITFEsFromResponse:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, void *);
  void *v30;
  id v31;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  +[AMSFeatureFlagGroup groupsFromDomainData:domain:](AMSFeatureFlagGroup, "groupsFromDomainData:domain:", a3, CFSTR("AMPFlagRemote"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  +[AMSFeatureFlagTask cachedRemoteGroups](AMSFeatureFlagTask, "cachedRemoteGroups");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v8 = v4;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v38;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v38 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * v12), "allITFEs");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "addObjectsFromArray:", v13);

          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
      }
      while (v10);
    }

    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    v14 = v5;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v34;
      do
      {
        v18 = 0;
        do
        {
          if (*(_QWORD *)v34 != v17)
            objc_enumerationMutation(v14);
          objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * v18), "allITFEs");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "addObjectsFromArray:", v19);

          ++v18;
        }
        while (v16 != v18);
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
      }
      while (v16);
    }

    objc_msgSend(v7, "minusSet:", v6);
    +[AMSFeatureFlagITFE _flagGroupITFEs](AMSFeatureFlagITFE, "_flagGroupITFEs");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    +[AMSFeatureFlagITFE fetchCustomFeatures](AMSFeatureFlagITFE, "fetchCustomFeatures");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "allObjects");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = MEMORY[0x1E0C809B0];
    v28 = 3221225472;
    v29 = __54__AMSFeatureFlagTask__handleDeletedITFEsFromResponse___block_invoke;
    v30 = &unk_1E2541E38;
    v31 = v20;
    v32 = v21;
    v23 = v21;
    v24 = v20;
    objc_msgSend(v22, "ams_filterUsingTest:", &v27);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "valueForKeyPath:", CFSTR("value"), v27, v28, v29, v30);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    +[AMSFeatureFlagITFE removeOrphanITFEValues:](AMSFeatureFlagITFE, "removeOrphanITFEValues:", v26);
  }

}

uint64_t __54__AMSFeatureFlagTask__handleDeletedITFEsFromResponse___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:", v3) & 1) != 0)
  {
    v4 = 0;
  }
  else
  {
    v5 = *(void **)(a1 + 40);
    objc_msgSend(v3, "value");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "containsObject:", v6) ^ 1;

  }
  return v4;
}

+ (id)_deviceClass
{
  if (+[AMSDevice deviceIsAudioAccessory](AMSDevice, "deviceIsAudioAccessory"))
    return CFSTR("AudioAccessory");
  if (+[AMSDevice deviceIsiPad](AMSDevice, "deviceIsiPad")
    || +[AMSDevice deviceIsiPadSimulator](AMSDevice, "deviceIsiPadSimulator"))
  {
    return CFSTR("iPad");
  }
  if (+[AMSDevice deviceIsiPhone](AMSDevice, "deviceIsiPhone")
    || +[AMSDevice deviceIsiPhoneSimulator](AMSDevice, "deviceIsiPhoneSimulator"))
  {
    return CFSTR("iPhone");
  }
  if (+[AMSDevice deviceIsiPod](AMSDevice, "deviceIsiPod")
    || +[AMSDevice deviceIsiPodSimulator](AMSDevice, "deviceIsiPodSimulator"))
  {
    return CFSTR("iPod");
  }
  return 0;
}

+ (NSString)bagSubProfile
{
  if (_MergedGlobals_105 != -1)
    dispatch_once(&_MergedGlobals_105, &__block_literal_global_57);
  return (NSString *)(id)qword_1ECEAD1D0;
}

void __35__AMSFeatureFlagTask_bagSubProfile__block_invoke()
{
  void *v0;

  v0 = (void *)qword_1ECEAD1D0;
  qword_1ECEAD1D0 = (uint64_t)CFSTR("AMSFeatureFlag");

}

+ (NSString)bagSubProfileVersion
{
  if (qword_1ECEAD1D8 != -1)
    dispatch_once(&qword_1ECEAD1D8, &__block_literal_global_79);
  return (NSString *)(id)qword_1ECEAD1E0;
}

void __42__AMSFeatureFlagTask_bagSubProfileVersion__block_invoke()
{
  void *v0;

  v0 = (void *)qword_1ECEAD1E0;
  qword_1ECEAD1E0 = (uint64_t)CFSTR("1");

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

@end
