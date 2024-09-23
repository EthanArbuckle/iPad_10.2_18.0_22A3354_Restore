@implementation AMSAccountStoreCache

+ (id)mediaTypeForAccountStore:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  objc_msgSend(a1, "cache", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
LABEL_3:
    v10 = 0;
    while (1)
    {
      if (*(_QWORD *)v17 != v9)
        objc_enumerationMutation(v6);
      v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v10);
      objc_msgSend(a1, "cache");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectForKeyedSubscript:", v11);
      v13 = (id)objc_claimAutoreleasedReturnValue();

      if (v13 == v4)
        break;

      if (v8 == ++v10)
      {
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        if (v8)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
    v14 = v11;

    if (v14)
      goto LABEL_12;
  }
  else
  {
LABEL_9:

  }
  +[AMSProcessInfo defaultMediaTypeForCurrentProcess](AMSProcessInfo, "defaultMediaTypeForCurrentProcess");
  v14 = (id)objc_claimAutoreleasedReturnValue();
LABEL_12:

  return v14;
}

+ (AMSThreadSafeDictionary)cache
{
  if (_MergedGlobals_77 != -1)
    dispatch_once(&_MergedGlobals_77, &__block_literal_global_4);
  return (AMSThreadSafeDictionary *)(id)qword_1ECEACED8;
}

void __29__AMSAccountStoreCache_cache__block_invoke()
{
  AMSThreadSafeDictionary *v0;
  void *v1;

  v0 = objc_alloc_init(AMSThreadSafeDictionary);
  v1 = (void *)qword_1ECEACED8;
  qword_1ECEACED8 = (uint64_t)v0;

}

+ (id)accountStoreForMediaType:(id)a3
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v18[4];
  id v19;
  _BYTE *v20;
  id v21;
  _BYTE buf[24];
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v23 = __Block_byref_object_copy__4;
    v24 = __Block_byref_object_dispose__4;
    v25 = 0;
    objc_msgSend(a1, "cache");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __49__AMSAccountStoreCache_accountStoreForMediaType___block_invoke;
    v18[3] = &unk_1E253DC78;
    v20 = buf;
    v19 = v5;
    v21 = a1;
    objc_msgSend(v6, "readWrite:", v18);

    v7 = *(id *)(*(_QWORD *)&buf[8] + 40);
    _Block_object_dispose(buf, 8);

  }
  else
  {
    +[AMSLogConfig sharedAccountsConfig](AMSLogConfig, "sharedAccountsConfig");
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
      AMSLogKey();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)MEMORY[0x1E0CB3940];
      v12 = objc_opt_class();
      v13 = v12;
      if (v10)
      {
        AMSLogKey();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "stringWithFormat:", CFSTR("%@: [%@] "), v13, v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend(v11, "stringWithFormat:", CFSTR("%@: "), v12);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v15;
      }
      NSStringFromSelector(a2);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v15;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v16;
      _os_log_impl(&dword_18C849000, v9, OS_LOG_TYPE_ERROR, "%{public}@%{public}@ was passed a nil media type. Returning an ACAccountStore that isn't associated with any media type.", buf, 0x16u);
      if (v10)

    }
    if (+[AMSUnitTests isRunningUnitTests](AMSUnitTests, "isRunningUnitTests"))
      objc_msgSend(MEMORY[0x1E0C8F2B8], "_ams_newAccountStore");
    else
      objc_msgSend(MEMORY[0x1E0C8F2B8], "_ams_defaultAccountStore");
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

void __49__AMSAccountStoreCache_accountStoreForMediaType___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  uint64_t v32;
  __int16 v33;
  uint64_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  objc_msgSend(v4, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  v8 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  +[AMSLogConfig sharedAccountsConfig](AMSLogConfig, "sharedAccountsConfig");
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
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      AMSLogKey();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)MEMORY[0x1E0CB3940];
      v14 = objc_opt_class();
      v15 = v14;
      if (v12)
      {
        AMSLogKey();
        v2 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "stringWithFormat:", CFSTR("%@: [%@] "), v15, v2);
      }
      else
      {
        objc_msgSend(v13, "stringWithFormat:", CFSTR("%@: "), v14);
      }
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = *(_QWORD *)(a1 + 32);
      v24 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
      *(_DWORD *)buf = 138543874;
      v30 = v16;
      v31 = 2114;
      v32 = v23;
      v33 = 2114;
      v34 = v24;
      _os_log_impl(&dword_18C849000, v11, OS_LOG_TYPE_INFO, "%{public}@Found an existing ACAccountStore for a media type. mediaType = %{public}@ | accountStore = %{public}@", buf, 0x20u);
      if (v12)
      {

        v16 = (void *)v2;
      }

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
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      AMSLogKey();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (void *)MEMORY[0x1E0CB3940];
      v20 = objc_opt_class();
      v21 = v20;
      if (v18)
      {
        AMSLogKey();
        v2 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "stringWithFormat:", CFSTR("%@: [%@] "), v21, v2);
      }
      else
      {
        objc_msgSend(v19, "stringWithFormat:", CFSTR("%@: "), v20);
      }
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      v30 = v22;
      v31 = 2114;
      v32 = v25;
      _os_log_impl(&dword_18C849000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@Creating a new ACAccountStore for a media type. mediaType = %{public}@", buf, 0x16u);
      if (v18)
      {

        v22 = (void *)v2;
      }

    }
    objc_msgSend(MEMORY[0x1E0C8F2B8], "_ams_newAccountStore");
    v26 = objc_claimAutoreleasedReturnValue();
    v27 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v28 = *(void **)(v27 + 40);
    *(_QWORD *)(v27 + 40) = v26;

    objc_msgSend(v4, "setObject:forKeyedSubscript:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(_QWORD *)(a1 + 32));
  }

}

+ (void)_resetAccountStoreCache
{
  id v2;

  objc_msgSend(a1, "cache");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeAllObjects");

}

@end
