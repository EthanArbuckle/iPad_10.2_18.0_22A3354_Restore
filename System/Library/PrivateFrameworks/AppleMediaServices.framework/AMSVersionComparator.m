@implementation AMSVersionComparator

+ (BOOL)isVersionSupported:(id)a3 requiredVersion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  BOOL v11;
  void *v12;
  NSObject *v13;
  int v15;
  uint64_t v16;
  __int16 v17;
  id v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6 && v7)
  {
    objc_msgSend(a1, "_sanitizedVersionStringForVersionString:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_sanitizedVersionStringForVersionString:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "compare:options:", v9, 64) != 1;

  }
  else
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v12)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v12, "OSLogObject");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v15 = 138412802;
      v16 = objc_opt_class();
      v17 = 2112;
      v18 = v6;
      v19 = 2112;
      v20 = v8;
      _os_log_impl(&dword_18C849000, v13, OS_LOG_TYPE_ERROR, "%@: Comparing version strings with nil: candidate: %@, required: %@", (uint8_t *)&v15, 0x20u);
    }

    v11 = 0;
  }

  return v11;
}

+ (id)_sanitizedVersionStringForVersionString:(id)a3
{
  id v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  _QWORD v12[4];
  id v13;
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "componentsSeparatedByString:", CFSTR("."));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v4, "count") < 2)
  {
    v7 = v3;
    if (v7)
      goto LABEL_10;
  }
  else
  {
    v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __64__AMSVersionComparator__sanitizedVersionStringForVersionString___block_invoke;
    v12[3] = &unk_1E253DF48;
    v13 = v5;
    v6 = v5;
    objc_msgSend(v4, "enumerateObjectsUsingBlock:", v12);
    objc_msgSend(v6, "componentsJoinedByString:", CFSTR("."));
    v7 = (id)objc_claimAutoreleasedReturnValue();

    if (v7)
      goto LABEL_10;
  }
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
    v15 = v10;
    v16 = 2114;
    v17 = v3;
    _os_log_impl(&dword_18C849000, v9, OS_LOG_TYPE_ERROR, "%{public}@: Failed to sanitize version string: %{public}@", buf, 0x16u);
  }

LABEL_10:
  return v7;
}

void __64__AMSVersionComparator__sanitizedVersionStringForVersionString___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(a2, "integerValue"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@"), v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);
}

@end
