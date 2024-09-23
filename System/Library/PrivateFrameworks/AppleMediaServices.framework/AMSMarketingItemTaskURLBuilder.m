@implementation AMSMarketingItemTaskURLBuilder

- (id)urlWithServiceType:(id)a3 placement:(id)a4 bag:(id)a5 hydrateRelatedContents:(BOOL)a6 offerHints:(id)a7 additionalParameters:(id)a8
{
  _BOOL4 v10;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v36;
  id v37;
  id v38;
  id v39;

  v10 = a6;
  v14 = a3;
  v39 = a4;
  v15 = a5;
  v16 = a7;
  v17 = a8;
  objc_msgSend(v14, "uppercaseString");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSMarketingItemTaskURLBuilder _realmOverridesFromBag:](self, "_realmOverridesFromBag:", v15);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "valueForKey:", v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  -[AMSMarketingItemTaskURLBuilder _formattedURLPathWithBag:](self, "_formattedURLPathWithBag:", v15);
  v21 = objc_claimAutoreleasedReturnValue();
  v22 = (void *)v21;
  if (v20 && v21)
  {
    v38 = v16;
    v36 = v17;
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v17);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setObject:forKeyedSubscript:", CFSTR("priceDiffsForDisplay"), CFSTR("extend[marketing-items]"));
    +[AMSDevice language](AMSDevice, "language");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSMarketingItemTaskURLBuilder _languageTagFromBag:fallback:](self, "_languageTagFromBag:fallback:", v15, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setObject:forKeyedSubscript:", v25, CFSTR("l"));

    objc_msgSend(v23, "setObject:forKeyedSubscript:", CFSTR("metrics"), CFSTR("meta[marketing-items]"));
    objc_msgSend(v23, "setObject:forKeyedSubscript:", v39, CFSTR("placement"));
    objc_msgSend(v23, "setObject:forKeyedSubscript:", v14, CFSTR("serviceType"));
    if (v10)
      objc_msgSend(v23, "setObject:forKeyedSubscript:", CFSTR("contents"), CFSTR("include"));
    v37 = v14;
    if (v38)
      objc_msgSend(v23, "setObject:forKeyedSubscript:", v38, CFSTR("offerHints"));
    v26 = (void *)MEMORY[0x1E0C99DE8];
    v27 = (void *)MEMORY[0x1E0CB39D8];
    v28 = (void *)objc_msgSend(v23, "copy");
    objc_msgSend(v27, "queryItemsFromDictionary:", v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "arrayWithArray:", v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    -[AMSMarketingItemTaskURLBuilder _additionalQueryItems](self, "_additionalQueryItems");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "addObjectsFromArray:", v31);

    objc_msgSend(v30, "sortUsingComparator:", &__block_literal_global_73);
    v32 = (void *)objc_opt_new();
    objc_msgSend(v32, "setHost:", v20);
    objc_msgSend(v32, "setPath:", v22);
    objc_msgSend(v32, "setQueryItems:", v30);
    objc_msgSend(v32, "setScheme:", CFSTR("https"));
    objc_msgSend(v32, "URL");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = v38;
    v17 = v36;
    v14 = v37;
  }
  else
  {
    AMSError(204, CFSTR("Could not build marketing item URL"), CFSTR("Bag is missing URL components"), 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    +[AMSPromise promiseWithError:](AMSPromise, "promiseWithError:", v23);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v34;
}

uint64_t __122__AMSMarketingItemTaskURLBuilder_urlWithServiceType_placement_bag_hydrateRelatedContents_offerHints_additionalParameters___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

- (id)_additionalQueryItems
{
  id v2;
  void *v3;
  void *v4;

  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  +[AMSMediaURLBuilderUtility devicePlatform](AMSMediaURLBuilderUtility, "devicePlatform");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB39D8]), "initWithName:value:", CFSTR("platform"), v3);
    objc_msgSend(v2, "addObject:", v4);

  }
  return v2;
}

- (id)_countryCodeFromBag:(id)a3
{
  return -[AMSMarketingItemTaskURLBuilder _stringForKey:fromBag:](self, "_stringForKey:fromBag:", 0x1E254C520, a3);
}

- (id)_languageTagFromBag:(id)a3 fallback:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  id v13;
  int v15;
  uint64_t v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  -[AMSMarketingItemTaskURLBuilder _stringForKey:fromBag:](self, "_stringForKey:fromBag:", 0x1E254CA00, a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v7)
  {
    +[AMSLogConfig sharedMarketingItemConfig](AMSLogConfig, "sharedMarketingItemConfig");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v9, "OSLogObject");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = objc_opt_class();
      AMSLogKey();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543874;
      v16 = v11;
      v17 = 2114;
      v18 = v12;
      v19 = 2114;
      v20 = v6;
      _os_log_impl(&dword_18C849000, v10, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Retrieving language tag from bag failed, using fallback: %{public}@", (uint8_t *)&v15, 0x20u);

    }
    v8 = v6;
  }
  v13 = v8;

  return v13;
}

- (id)_realmOverridesFromBag:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v16;
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "dictionaryForKey:", 0x1E254CA20);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  objc_msgSend(v3, "valueWithError:", &v16);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v16;

  if (v5)
  {
    +[AMSLogConfig sharedMarketingItemConfig](AMSLogConfig, "sharedMarketingItemConfig");
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
      v8 = objc_opt_class();
      AMSLogKey();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v18 = v8;
      v19 = 2114;
      v20 = v9;
      _os_log_impl(&dword_18C849000, v7, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Error retrieving realm mappings.", buf, 0x16u);

    }
    +[AMSLogConfig sharedMarketingItemConfig](AMSLogConfig, "sharedMarketingItemConfig");
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
      v12 = objc_opt_class();
      AMSLogKey();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      AMSLogableError(v5);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v18 = v12;
      v19 = 2114;
      v20 = v13;
      v21 = 2114;
      v22 = v14;
      _os_log_impl(&dword_18C849000, v11, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] %{public}@", buf, 0x20u);

    }
  }

  return v4;
}

- (id)_stringForKey:(id)a3 fromBag:(id)a4
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v13;
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a4, "stringForKey:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  objc_msgSend(v4, "valueWithError:", &v13);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v13;

  if (v6)
  {
    +[AMSLogConfig sharedMarketingItemConfig](AMSLogConfig, "sharedMarketingItemConfig");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v7, "OSLogObject");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = objc_opt_class();
      AMSLogKey();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      AMSLogableError(v6);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v15 = v9;
      v16 = 2114;
      v17 = v10;
      v18 = 2114;
      v19 = v11;
      _os_log_impl(&dword_18C849000, v8, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] %{public}@", buf, 0x20u);

    }
  }

  return v5;
}

- (id)_urlPathFromBag:(id)a3
{
  return -[AMSMarketingItemTaskURLBuilder _stringForKey:fromBag:](self, "_stringForKey:fromBag:", 0x1E254CA40, a3);
}

- (id)_formattedURLPathWithBag:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[AMSMarketingItemTaskURLBuilder _urlPathFromBag:](self, "_urlPathFromBag:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSMarketingItemTaskURLBuilder _countryCodeFromBag:](self, "_countryCodeFromBag:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = 0;
  if (v5 && v6)
  {
    objc_msgSend(v5, "stringByReplacingOccurrencesOfString:withString:", CFSTR("{cc}"), v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

+ (NSString)bagSubProfile
{
  return (NSString *)CFSTR("AMSMarketingItemTask");
}

+ (NSString)bagSubProfileVersion
{
  return (NSString *)CFSTR("1");
}

+ (AMSBagKeySet)bagKeySet
{
  return objc_alloc_init(AMSBagKeySet);
}

@end
