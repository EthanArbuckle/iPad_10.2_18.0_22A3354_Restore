@implementation AMSMarketingItemParser

+ (id)selectionFromMarketingItems:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v10), "rawValues", (_QWORD)v14);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  objc_msgSend(a1, "selectionFromRawMarketingItems:", v5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)selectionFromRawMarketingItems:(id)a3
{
  return (id)objc_msgSend(a1, "selectionFromRawMarketingItems:serviceType:placement:", a3, 0, 0);
}

+ (id)selectionFromRawMarketingItems:(id)a3 serviceType:(id)a4 placement:(id)a5
{
  id v8;
  id v9;
  id v10;
  AMSEngagement *v11;
  void *v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = objc_alloc_init(AMSEngagement);
  objc_msgSend(a1, "_rawMarketingItemSelectionFromRawMarketingItems:serviceType:placement:engagementService:", v10, v9, v8, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)_rawMarketingItemSelectionFromRawMarketingItems:(id)a3 serviceType:(id)a4 placement:(id)a5 engagementService:(id)a6
{
  id v10;
  __CFString *v11;
  __CFString *v12;
  id v13;
  const __CFString *v14;
  const __CFString *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  AMSMutablePromise *v22;
  AMSMutablePromise *v23;
  AMSMutablePromise *v24;
  AMSMutablePromise *v25;
  _QWORD v27[4];
  id v28;
  AMSMutablePromise *v29;
  id v30;
  uint8_t buf[4];
  uint64_t v32;
  __int16 v33;
  void *v34;
  _QWORD v35[4];
  _QWORD v36[6];

  v36[4] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = (__CFString *)a4;
  v12 = (__CFString *)a5;
  v13 = a6;
  if (objc_msgSend(v10, "count"))
  {
    v35[0] = CFSTR("kind");
    v35[1] = CFSTR("serviceType");
    v14 = &stru_1E2548760;
    if (v11)
      v15 = v11;
    else
      v15 = &stru_1E2548760;
    v36[0] = CFSTR("AMSMarketingItemParser");
    v36[1] = v15;
    if (v12)
      v14 = v12;
    v35[2] = CFSTR("placement");
    v35[3] = CFSTR("items");
    v36[2] = v14;
    v36[3] = v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v36, v35, 4);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v17)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v17, "OSLogObject");
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v19 = objc_opt_class();
      AMSLogKey();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v32 = v19;
      v33 = 2114;
      v34 = v20;
      _os_log_impl(&dword_18C849000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Parsing marketing items", buf, 0x16u);

    }
    objc_msgSend(v13, "enqueueData:", v16);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_alloc_init(AMSMutablePromise);
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __114__AMSMarketingItemParser__rawMarketingItemSelectionFromRawMarketingItems_serviceType_placement_engagementService___block_invoke;
    v27[3] = &unk_1E2542C80;
    v28 = v10;
    v30 = a1;
    v23 = v22;
    v29 = v23;
    objc_msgSend(v21, "addFinishBlock:", v27);
    v24 = v29;
    v25 = v23;

  }
  else
  {
    AMSError(7, CFSTR("No marketing items found"), CFSTR("Found no marketing items for the given account"), 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    +[AMSPromise promiseWithError:](AMSPromise, "promiseWithError:", v16);
    v25 = (AMSMutablePromise *)objc_claimAutoreleasedReturnValue();
  }

  return v25;
}

void __114__AMSMarketingItemParser__rawMarketingItemSelectionFromRawMarketingItems_serviceType_placement_engagementService___block_invoke(uint64_t a1, void *a2, void *a3)
{
  __CFString *v5;
  void *v6;
  void *v7;
  id v8;
  _BOOL4 v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  AMSMarketingItem *v17;
  AMSMarketingItem *v18;
  void *v19;
  __CFString *v20;
  __CFString *v21;
  void *v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const __CFString *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  int v34;
  uint64_t v35;
  __int16 v36;
  uint64_t v37;
  __int16 v38;
  __CFString *v39;
  __int16 v40;
  const __CFString *v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(a2, "data");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("item"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v7;

    v9 = v5 != 0;
    if (!v5 && v8)
    {
      v10 = objc_msgSend(v8, "count");
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = (void *)v11;
      if (v10)
      {
        if (!v11)
        {
          +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v12, "OSLogObject");
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          v14 = objc_opt_class();
          AMSLogKey();
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = 138543618;
          v35 = v14;
          v36 = 2114;
          v37 = (uint64_t)v15;
          _os_log_impl(&dword_18C849000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Marketing item selected", (uint8_t *)&v34, 0x16u);

        }
        v16 = *(void **)(a1 + 40);
        v17 = -[AMSMarketingItem initWithDictionary:]([AMSMarketingItem alloc], "initWithDictionary:", v8);
        objc_msgSend(v16, "finishWithResult:", v17);
      }
      else
      {
        if (!v11)
        {
          +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v12, "OSLogObject");
        v30 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          v31 = objc_opt_class();
          AMSLogKey();
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = 138543618;
          v35 = v31;
          v36 = 2114;
          v37 = (uint64_t)v32;
          _os_log_impl(&dword_18C849000, v30, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] No marketing item selected", (uint8_t *)&v34, 0x16u);

        }
        v33 = *(void **)(a1 + 40);
        AMSError(7, CFSTR("No marketing item"), CFSTR("Engagement did not select a marketing item"), 0);
        v17 = (AMSMarketingItem *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "finishWithError:", v17);
      }
      goto LABEL_26;
    }
  }
  else
  {

    v8 = 0;
    v9 = v5 != 0;
  }
  if (objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    v18 = [AMSMarketingItem alloc];
    objc_msgSend(*(id *)(a1 + 32), "firstObject");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[AMSMarketingItem initWithDictionary:](v18, "initWithDictionary:", v19);

  }
  else
  {
    v17 = 0;
  }
  v20 = &stru_1E2548760;
  if (!v17)
    v20 = CFSTR(" NOT");
  v21 = v20;
  +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v22)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v22, "OSLogObject");
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
  {
    v24 = objc_opt_class();
    AMSLogKey();
    v25 = objc_claimAutoreleasedReturnValue();
    v26 = (void *)v25;
    v34 = 138544130;
    v27 = CFSTR("<noerror>");
    v35 = v24;
    if (v9)
      v27 = v5;
    v36 = 2114;
    v37 = v25;
    v38 = 2114;
    v39 = v21;
    v40 = 2114;
    v41 = v27;
    _os_log_impl(&dword_18C849000, v23, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Parsing failed. Will%{public}@ fall back to first item. %{public}@", (uint8_t *)&v34, 0x2Au);

  }
  v28 = *(void **)(a1 + 40);
  if (v17)
  {
    objc_msgSend(v28, "finishWithResult:", v17);
  }
  else
  {
    AMSError(7, CFSTR("No marketing item"), CFSTR("Engagement did not select a marketing item"), 0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "finishWithError:", v29);

  }
LABEL_26:

}

@end
