@implementation DDSMobileAssetv2QueryAdapter

void __115__DDSMobileAssetv2QueryAdapter_maAssetQueryForddsAssetQuery_compatiblilityVersion_platformVersion_internalInstall___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  char isKindOfClass;
  void *v9;
  NSObject *v10;
  int v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;

  v5 = a2;
  v6 = a3;
  objc_msgSend(v6, "anyObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    QueryLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      __115__DDSMobileAssetv2QueryAdapter_maAssetQueryForddsAssetQuery_compatiblilityVersion_platformVersion_internalInstall___block_invoke_cold_4();
    goto LABEL_17;
  }
  if (objc_msgSend(v6, "count") == 1)
  {
    objc_msgSend(v6, "allObjects");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "firstObject");
    v10 = objc_claimAutoreleasedReturnValue();

    v11 = -[NSObject isEqualToString:](v10, "isEqualToString:", &stru_1EA1420B0);
    v12 = *(void **)(a1 + 32);
    if (v11)
    {
      if (objc_msgSend(v12, "addKeyValueNull:", v5))
      {
        QueryLog();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          goto LABEL_13;
        goto LABEL_14;
      }
    }
    else if (objc_msgSend(v12, "addKeyValuePair:with:", v5, v10))
    {
      QueryLog();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
LABEL_13:
        +[DDSMobileAssetv2QueryAdapter maAssetQueryForddsAssetQuery:compatiblilityVersion:platformVersion:internalInstall:].cold.1();
LABEL_14:

    }
LABEL_17:

    goto LABEL_18;
  }
  if ((unint64_t)objc_msgSend(v6, "count") < 2)
  {
    QueryLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      __115__DDSMobileAssetv2QueryAdapter_maAssetQueryForddsAssetQuery_compatiblilityVersion_platformVersion_internalInstall___block_invoke_cold_3((uint64_t)v5, v10);
    goto LABEL_17;
  }
  v14 = *(void **)(a1 + 32);
  objc_msgSend(v6, "allObjects");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v15, "mutableCopy");
  objc_msgSend(v14, "addKeyValueArray:with:", v5, v16);

LABEL_18:
}

+ (id)maAssetQueryForddsAssetQuery:(id)a3 compatiblilityVersion:(int64_t)a4 platformVersion:(id)a5 internalInstall:(BOOL)a6
{
  _BOOL4 v6;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  NSObject *v26;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  void (*v31)(uint64_t, void *, void *);
  void *v32;
  id v33;
  id v34;
  uint8_t buf[4];
  const __CFString *v36;
  __int16 v37;
  void *v38;
  _QWORD v39[2];

  v6 = a6;
  v39[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a5;
  v11 = objc_alloc(MEMORY[0x1E0D4E050]);
  objc_msgSend(v9, "assetType");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v11, "initWithType:", v12);

  objc_msgSend(v13, "setDoNotBlockBeforeFirstUnlock:", 1);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v13, sel_setDoNotBlockOnNetworkStatus_, 1);
    QueryLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      +[DDSMobileAssetv2QueryAdapter maAssetQueryForddsAssetQuery:compatiblilityVersion:platformVersion:internalInstall:].cold.3(v14);
  }
  else
  {
    QueryLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DA990000, v14, OS_LOG_TYPE_DEFAULT, "WARNING: The version of DataDeliveryServices in this build does not set doNotBlockOnNetworkStatusSetter=YES, possibly resulting in hangs.", buf, 2u);
    }
  }

  objc_msgSend(v9, "filter");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "filters");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = MEMORY[0x1E0C809B0];
  v30 = 3221225472;
  v31 = __115__DDSMobileAssetv2QueryAdapter_maAssetQueryForddsAssetQuery_compatiblilityVersion_platformVersion_internalInstall___block_invoke;
  v32 = &unk_1EA141390;
  v17 = v13;
  v33 = v17;
  objc_msgSend(v16, "enumerateKeysAndObjectsUsingBlock:", &v29);

  if (a4 >= 1)
  {
    objc_msgSend((id)objc_opt_class(), "stringFromInteger:", a4, v29, v30, v31, v32);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = *MEMORY[0x1E0D4DEE0];
    if (objc_msgSend(v17, "addKeyValuePair:with:", *MEMORY[0x1E0D4DEE0], v18))
    {
      QueryLog();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        +[DDSMobileAssetv2QueryAdapter maAssetQueryForddsAssetQuery:compatiblilityVersion:platformVersion:internalInstall:].cold.1();

    }
    if (v6)
    {
      objc_msgSend((id)objc_opt_class(), "stringFromInteger:", a4);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v17, "addKeyValuePair:with:", v19, v21))
      {
        QueryLog();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          +[DDSMobileAssetv2QueryAdapter maAssetQueryForddsAssetQuery:compatiblilityVersion:platformVersion:internalInstall:].cold.1();

      }
    }

  }
  if (v10)
  {
    v39[0] = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v39, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (void *)objc_msgSend(v23, "mutableCopy");
    v25 = objc_msgSend(v17, "addKeyValueArray:with:", CFSTR("_SupportedPlatforms"), v24);

    if (v25)
    {
      QueryLog();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        v34 = v10;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v34, 1);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v36 = CFSTR("_SupportedPlatforms");
        v37 = 2114;
        v38 = v28;
        _os_log_error_impl(&dword_1DA990000, v26, OS_LOG_TYPE_ERROR, "Unexpected failure adding key (%{public}@)/value (%{public}@) pair", buf, 0x16u);

      }
    }
  }

  return v17;
}

+ (id)stringFromInteger:(unint64_t)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu"), a3);
}

+ (void)maAssetQueryForddsAssetQuery:compatiblilityVersion:platformVersion:internalInstall:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_1DA990000, v0, v1, "Unexpected failure adding key (%{public}@)/value (%{public}@) pair");
  OUTLINED_FUNCTION_4();
}

+ (void)maAssetQueryForddsAssetQuery:(os_log_t)log compatiblilityVersion:platformVersion:internalInstall:.cold.3(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1DA990000, log, OS_LOG_TYPE_DEBUG, "Setting setDoNotBlockOnNetworkStatus to YES", v1, 2u);
}

void __115__DDSMobileAssetv2QueryAdapter_maAssetQueryForddsAssetQuery_compatiblilityVersion_platformVersion_internalInstall___block_invoke_cold_3(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_1DA990000, a2, OS_LOG_TYPE_ERROR, "No values specified for key (%{public}@)", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_4();
}

void __115__DDSMobileAssetv2QueryAdapter_maAssetQueryForddsAssetQuery_compatiblilityVersion_platformVersion_internalInstall___block_invoke_cold_4()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_0_0();
  _os_log_debug_impl(&dword_1DA990000, v0, OS_LOG_TYPE_DEBUG, "Skipping key: %{public}@ values: %{public}@ (is this the region dict? that's handled elsewhere)", v1, 0x16u);
  OUTLINED_FUNCTION_4();
}

@end
