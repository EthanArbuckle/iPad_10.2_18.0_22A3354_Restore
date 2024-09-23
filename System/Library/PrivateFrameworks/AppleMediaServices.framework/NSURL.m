@implementation NSURL

uint64_t __69__NSURL_AppleMediaServices_Project___sortedQueryItemsFromQueryItems___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v4, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "compare:", v7);

  if (!v8)
  {
    objc_msgSend(v4, "value");
    v9 = objc_claimAutoreleasedReturnValue();
    if (v9
      && (v10 = (void *)v9,
          objc_msgSend(v5, "value"),
          v11 = (void *)objc_claimAutoreleasedReturnValue(),
          v11,
          v10,
          v11))
    {
      objc_msgSend(v4, "value");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "value");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v12, "compare:", v13);

    }
    else
    {
      objc_msgSend(v4, "value");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14)
        v8 = -1;
      else
        v8 = 1;
    }
  }

  return v8;
}

void __58__NSURL_AppleMediaServices_Project__ams_realHomeDirectory__block_invoke(uint64_t a1)
{
  free(*(void **)(a1 + 32));
}

uint64_t __95__NSURL_AppleMediaServices_Project__ams_URLByAppendingQueryParameters_preservingQueryEncoding___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", a2, a3);
}

void __48__NSURL_AppleMediaServices__ams_cachesDirectory__block_invoke(uint64_t a1)
{
  _BOOL4 v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v2 = +[AMSUnitTests isRunningUnitTests](AMSUnitTests, "isRunningUnitTests");
  +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v2)
  {
    if (!v3)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v4, "OSLogObject");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = objc_opt_class();
      v7 = *(_QWORD *)(a1 + 32);
      v11 = 138543618;
      v12 = v6;
      v13 = 2114;
      v14 = v7;
      _os_log_impl(&dword_18C849000, v5, OS_LOG_TYPE_ERROR, "%{public}@: Failed to fetch correct caches directory - %{public}@", (uint8_t *)&v11, 0x16u);
    }

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v8 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "postNotificationName:object:userInfo:", CFSTR("com.apple.AppleMediaServicesTests.FaultLogged"), v8, 0);
  }
  else
  {
    if (!v3)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v4, "OSLogObject");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      v9 = objc_opt_class();
      v10 = *(_QWORD *)(a1 + 32);
      v11 = 138543618;
      v12 = v9;
      v13 = 2114;
      v14 = v10;
      _os_log_impl(&dword_18C849000, v8, OS_LOG_TYPE_FAULT, "%{public}@: Failed to fetch correct caches directory - %{public}@", (uint8_t *)&v11, 0x16u);
    }
  }

}

uint64_t __68__NSURL_AppleMediaServices_Project__ams_URLQueryAllowedCharacterSet__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  objc_msgSend(MEMORY[0x1E0CB3500], "URLQueryAllowedCharacterSet");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "mutableCopy");
  v2 = (void *)_MergedGlobals_161;
  _MergedGlobals_161 = v1;

  return objc_msgSend((id)_MergedGlobals_161, "removeCharactersInString:", CFSTR("?=&+"));
}

BOOL __90__NSURL_AppleMediaServices_Project__ams_URLByAppendingQueryItems_preservingQueryEncoding___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  _BOOL8 v5;

  v2 = a2;
  objc_msgSend(v2, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "length"))
  {
    objc_msgSend(v2, "value");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "length") != 0;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

void __94__NSURL_AppleMediaServices_Project__ams_URLByReplaceingQueryParameters_withEncodedParameters___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  objc_class *v5;
  id v6;
  id v7;
  id v8;

  v4 = *(void **)(a1 + 32);
  v5 = (objc_class *)MEMORY[0x1E0CB39D8];
  v6 = a3;
  v7 = a2;
  v8 = (id)objc_msgSend([v5 alloc], "initWithName:value:", v7, v6);

  objc_msgSend(v4, "addObject:", v8);
}

@end
