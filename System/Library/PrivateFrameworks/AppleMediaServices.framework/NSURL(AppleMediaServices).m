@implementation NSURL(AppleMediaServices)

+ (id)ams_engagementDirectory
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "ams_cachesDirectory");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "URLByAppendingPathComponent:", CFSTR("Engagement"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

+ (id)ams_dataVaultDirectory
{
  void *v2;
  NSObject *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  char v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  NSObject *v22;
  uint64_t v23;
  id v25;
  uint8_t buf[4];
  uint64_t v27;
  __int16 v28;
  NSObject *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  if (+[AMSProcessInfo BOOLForEntitlement:](AMSProcessInfo, "BOOLForEntitlement:", CFSTR("com.apple.private.security.storage.AppleMediaServices")))
  {
    objc_msgSend(a1, "ams_realHomeDirectory");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("/Library/AppleMediaServices"));
    v3 = objc_claimAutoreleasedReturnValue();
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v4)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v4, "OSLogObject");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6 = objc_opt_class();
      AMSHashIfNeeded(v3);
      v7 = objc_claimAutoreleasedReturnValue();
      AMSHashIfNeeded(v2);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      AMSHashIfNeeded(CFSTR("/Library/AppleMediaServices"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v27 = v6;
      v28 = 2114;
      v29 = v7;
      v30 = 2114;
      v31 = v8;
      v32 = 2114;
      v33 = v9;
      _os_log_impl(&dword_18C849000, v5, OS_LOG_TYPE_INFO, "%{public}@: Computed data vault path is %{public}@. homeDirectory = %{public}@ | relativeDirectory = %{public}@", buf, 0x2Au);

    }
    if (v3)
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v3);
      v10 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "path");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 0;
      v13 = objc_msgSend(v11, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v12, 1, 0, &v25);
      v14 = v25;

      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = (void *)v15;
      if ((v13 & 1) != 0)
      {
        if (!v15)
        {
          +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v16, "OSLogObject");
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          v18 = objc_opt_class();
          AMSHashIfNeeded(v10);
          v19 = objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v27 = v18;
          v28 = 2114;
          v29 = v19;
          _os_log_impl(&dword_18C849000, v17, OS_LOG_TYPE_INFO, "%{public}@: Successfully created data vault directory (or it already exists). dataVaultURL = %{public}@", buf, 0x16u);

        }
        v10 = v10;
        v20 = v10;
        goto LABEL_28;
      }
      if (!v15)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v16, "OSLogObject");
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        v23 = objc_opt_class();
        *(_DWORD *)buf = 138543618;
        v27 = v23;
        v28 = 2114;
        v29 = v14;
        _os_log_impl(&dword_18C849000, v22, OS_LOG_TYPE_ERROR, "%{public}@: Failed to create data vault directory. %{public}@", buf, 0x16u);
      }

    }
    else
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v10 = (id)objc_claimAutoreleasedReturnValue();
      if (!v10)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v10 = (id)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v10, "OSLogObject");
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        v21 = objc_opt_class();
        *(_DWORD *)buf = 138543362;
        v27 = v21;
        _os_log_impl(&dword_18C849000, v14, OS_LOG_TYPE_ERROR, "%{public}@: Could not compute data vault path.", buf, 0xCu);
      }
    }
    v20 = 0;
LABEL_28:

    goto LABEL_29;
  }
  +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v2, "OSLogObject");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v27 = objc_opt_class();
    _os_log_impl(&dword_18C849000, v3, OS_LOG_TYPE_ERROR, "%{public}@: Cannot access data vault. Current process does not have the correct entitlement.", buf, 0xCu);
  }
  v20 = 0;
LABEL_29:

  return v20;
}

+ (id)ams_cachesDirectory
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  int v6;
  id v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  id v11;
  void *v12;
  char v13;
  id v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  id v18;
  NSObject *v19;
  uint64_t v20;
  id v22;
  _QWORD block[4];
  id v24;
  void *v25;
  id v26;
  uint8_t buf[4];
  uint64_t v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "ams_realHomeDirectory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("/Library/Caches/com.apple.AppleMediaServices"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v3, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v26 = 0;
      v6 = objc_msgSend(v4, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v5, 1, 0, &v26);
      v7 = v26;
      if (!v6)
      {
LABEL_7:
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v8)
        {
          +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v8, "OSLogObject");
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          v10 = objc_opt_class();
          *(_DWORD *)buf = 138543618;
          v28 = v10;
          v29 = 2114;
          v30 = v7;
          _os_log_impl(&dword_18C849000, v9, OS_LOG_TYPE_ERROR, "%{public}@: Failed to create caches directory. %{public}@", buf, 0x16u);
        }

        goto LABEL_12;
      }
    }
    else
    {
      v7 = 0;
    }
    if ((objc_msgSend(v4, "isWritableFileAtPath:", v3) & 1) != 0)
      goto LABEL_28;
    goto LABEL_7;
  }
LABEL_12:
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__NSURL_AppleMediaServices__ams_cachesDirectory__block_invoke;
  block[3] = &unk_1E2540A40;
  v25 = a1;
  v11 = v3;
  v24 = v11;
  if (ams_cachesDirectory_onceToken[0] != -1)
    dispatch_once(ams_cachesDirectory_onceToken, block);
  objc_msgSend(v4, "URLForDirectory:inDomain:appropriateForURL:create:error:", 13, 1, 0, 1, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "URLByAppendingPathComponent:", CFSTR("com.apple.AppleMediaServices"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v22 = 0;
    v13 = objc_msgSend(v4, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v5, 1, 0, &v22);
    v14 = v22;
    if ((v13 & 1) == 0)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v15)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v15, "OSLogObject");
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        v17 = objc_opt_class();
        *(_DWORD *)buf = 138543618;
        v28 = v17;
        v29 = 2114;
        v30 = v14;
        _os_log_impl(&dword_18C849000, v16, OS_LOG_TYPE_ERROR, "%{public}@: Failed to create caches directory. %{public}@", buf, 0x16u);
      }

    }
    v18 = v5;
  }
  else
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v14 = (id)objc_claimAutoreleasedReturnValue();
    if (!v14)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v14 = (id)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v14, "OSLogObject");
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v20 = objc_opt_class();
      *(_DWORD *)buf = 138543618;
      v28 = v20;
      v29 = 2114;
      v30 = v11;
      _os_log_impl(&dword_18C849000, v19, OS_LOG_TYPE_ERROR, "%{public}@: Could not create caches URL from caches path: %{public}@", buf, 0x16u);
    }

  }
  v7 = v24;
LABEL_28:

  return v5;
}

- (id)ams_unmodifiedParameters
{
  id v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3998]), "initWithURL:resolvingAgainstBaseURL:", a1, 0);
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  objc_msgSend(v3, "percentEncodedQueryItems", 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  v6 = (void *)MEMORY[0x1E0C9AA60];
  if (v4)
    v6 = (void *)v4;
  v7 = v6;

  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v19 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v12, "name");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v13, "length"))
        {
          objc_msgSend(v12, "value");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "length");

          if (!v15)
            continue;
          objc_msgSend(v12, "value");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "name");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v2, "setObject:forKeyedSubscript:", v13, v16);

        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v9);
  }

  return v2;
}

- (id)ams_parameters
{
  id v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3998]), "initWithURL:resolvingAgainstBaseURL:", a1, 0);
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  objc_msgSend(v3, "queryItems", 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  v6 = (void *)MEMORY[0x1E0C9AA60];
  if (v4)
    v6 = (void *)v4;
  v7 = v6;

  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v19 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v12, "name");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v13, "length"))
        {
          objc_msgSend(v12, "value");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "length");

          if (!v15)
            continue;
          objc_msgSend(v12, "value");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "name");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v2, "setObject:forKeyedSubscript:", v13, v16);

        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v9);
  }

  return v2;
}

+ (id)ams_dynamicUIDirectory
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "ams_cachesDirectory");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "URLByAppendingPathComponent:", CFSTR("DynamicUI"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

+ (id)ams_unescapedStringForString:()AppleMediaServices
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = v3;
  if (objc_msgSend(v3, "length"))
  {
    objc_msgSend(v3, "stringByRemovingPercentEncoding");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

- (uint64_t)ams_URLByReplaceingQueryParameters:()AppleMediaServices
{
  return objc_msgSend(a1, "ams_URLByReplaceingQueryParameters:withEncodedParameters:", a3, 0);
}

@end
