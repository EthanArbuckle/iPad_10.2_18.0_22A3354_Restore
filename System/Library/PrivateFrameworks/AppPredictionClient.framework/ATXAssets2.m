@implementation ATXAssets2

+ (void)addOverridePath:(id)a3 forResource:(id)a4 ofType:(id)a5
{
  objc_class *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;

  v14 = a3;
  v7 = (objc_class *)MEMORY[0x1E0D81638];
  v8 = a5;
  v9 = a4;
  v10 = (void *)objc_msgSend([v7 alloc], "initWithFirst:second:", v9, v8);

  pthread_mutex_lock(&overridesLock);
  v11 = (void *)overrides;
  if (!overrides)
  {
    v12 = objc_opt_new();
    v13 = (void *)overrides;
    overrides = v12;

    v11 = (void *)overrides;
  }
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v14, v10);
  pthread_mutex_unlock(&overridesLock);

}

+ (void)clearOverrides
{
  void *v2;

  pthread_mutex_lock(&overridesLock);
  v2 = (void *)overrides;
  overrides = 0;

  pthread_mutex_unlock(&overridesLock);
}

+ (void)onUpdateRestartThisProcess
{
  if (onUpdateRestartThisProcess_onceToken != -1)
    dispatch_once(&onUpdateRestartThisProcess_onceToken, &__block_literal_global_92);
}

void __40__ATXAssets2_onUpdateRestartThisProcess__block_invoke()
{
  void *v0;
  id v1;
  void *v2;
  void *v3;
  id v4;
  void *v5;
  _QWORD v6[4];
  id v7;

  getAsset();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    __40__ATXAssets2_onUpdateRestartThisProcess__block_invoke_cold_1((uint64_t)v0);
  v1 = (id)objc_msgSend(v0, "registerUpdateHandler:", &__block_literal_global_7_3);
  +[ATXAssetsABHelper decDeviceId](ATXAssetsABHelper, "decDeviceId");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0D81590];
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __40__ATXAssets2_onUpdateRestartThisProcess__block_invoke_2;
  v6[3] = &unk_1E4D57590;
  v7 = v2;
  v4 = v2;
  objc_msgSend(v3, "runBlockWhenDeviceIsClassCUnlocked:", v6);
  getTrialAssets();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addUpdateHandlerWithBlock:", &__block_literal_global_10_4);

}

void __40__ATXAssets2_onUpdateRestartThisProcess__block_invoke_2(uint64_t a1)
{
  void *v2;
  char v3;
  void *v4;
  void *v5;

  +[ATXAssetsABHelper decDeviceId](ATXAssetsABHelper, "decDeviceId");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v2;
  if (!v2 || (v3 = objc_msgSend(v2, "isEqual:", *(_QWORD *)(a1 + 32)), v4 = v5, (v3 & 1) == 0))
  {
    xpc_transaction_exit_clean();
    v4 = v5;
  }

}

+ (id)pathForResource:(id)a3 ofType:(id)a4 isDirectory:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  int v17;
  NSObject *v18;
  id v19;
  void *v20;
  int v21;
  NSObject *v22;
  NSObject *v23;
  void *v24;
  id v25;
  NSObject *v26;
  objc_class *v27;
  void *v28;
  objc_class *v30;
  void *v31;
  void *v33;
  void *v34;
  char v35;
  uint8_t buf[4];
  id v37;
  __int16 v38;
  id v39;
  __int16 v40;
  id v41;
  uint64_t v42;

  v5 = a5;
  v42 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0D81638]), "initWithFirst:second:", v7, v8);
  pthread_mutex_lock(&overridesLock);
  v34 = (void *)v9;
  objc_msgSend((id)overrides, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  pthread_mutex_unlock(&overridesLock);
  objc_msgSend(v7, "stringByAppendingPathExtension:", v8);
  v11 = objc_claimAutoreleasedReturnValue();
  getAsset();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = (void *)v11;
  objc_msgSend(v12, "filesystemPathForAssetDataRelativePath:", v11);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  getTrialAssets();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v8, "isEqualToString:", CFSTR("mlmodelc")) & 1) != 0 || v5)
  {
    objc_msgSend(v14, "directoryPathForTrialResource:", v7, a1);
    v15 = (id)objc_claimAutoreleasedReturnValue();
    v35 = 0;
    v19 = v13;
    if (v15)
    {
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "fileExistsAtPath:isDirectory:", v15, &v35);

      v19 = v13;
      if (v21)
      {
        v19 = v13;
        if (v35)
        {
          v19 = v15;

          __atxlog_handle_trial_assets();
          v22 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            v37 = v19;
            v38 = 2112;
            v39 = v7;
            _os_log_impl(&dword_1A49EF000, v22, OS_LOG_TYPE_DEFAULT, "Using Trial directory path: %@ for resource: %@", buf, 0x16u);
          }

        }
      }
    }
  }
  else
  {
    objc_msgSend(v14, "filePathForResource:", v7);
    v15 = (id)objc_claimAutoreleasedReturnValue();
    if (v15
      && (objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"),
          v16 = (void *)objc_claimAutoreleasedReturnValue(),
          v17 = objc_msgSend(v16, "fileExistsAtPath:", v15),
          v16,
          v17))
    {
      v15 = v15;

      __atxlog_handle_trial_assets();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v37 = v15;
        v38 = 2112;
        v39 = v7;
        _os_log_impl(&dword_1A49EF000, v18, OS_LOG_TYPE_DEFAULT, "Using Trial file path: %@ for resource: %@", buf, 0x16u);
      }

      v19 = v15;
    }
    else
    {
      v19 = v13;
    }
  }

  if (!v19)
  {
    __atxlog_handle_default();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
    {
      v30 = (objc_class *)objc_opt_class();
      NSStringFromClass(v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v37 = v31;
      v38 = 2112;
      v39 = v7;
      v40 = 2112;
      v41 = v8;
      _os_log_fault_impl(&dword_1A49EF000, v23, OS_LOG_TYPE_FAULT, "%@ - could not find path for resource: %@ with extension: %@", buf, 0x20u);

    }
  }
  if (v10)
    v24 = v10;
  else
    v24 = v19;
  v25 = v24;
  __atxlog_handle_default();
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    v27 = (objc_class *)objc_opt_class();
    NSStringFromClass(v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v37 = v28;
    v38 = 2112;
    v39 = v25;
    v40 = 2112;
    v41 = v7;
    _os_log_impl(&dword_1A49EF000, v26, OS_LOG_TYPE_DEFAULT, "%@ - using path: %@ for resource name: %@", buf, 0x20u);

  }
  return v25;
}

+ (void)updateMobileAssetMetadata
{
  void *v2;
  uint8_t v3[16];

  getAsset();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_1A49EF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Kicking off mobile asset metadata download.", v3, 2u);
  }
  objc_msgSend(v2, "downloadMetadataWithCompletion:", 0);

}

+ (id)rawDictionaryUsingTrialForResource:(id)a3 ofType:(id)a4
{
  id v5;
  objc_class *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  id v15;
  NSObject *v16;
  void *v17;
  int v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (objc_class *)MEMORY[0x1E0D81638];
  v7 = a4;
  v8 = (void *)objc_msgSend([v6 alloc], "initWithFirst:second:", v5, v7);

  pthread_mutex_lock(&overridesLock);
  objc_msgSend((id)overrides, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  pthread_mutex_unlock(&overridesLock);
  v10 = v9;
  getTrialAssets();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "filePathForResource:", v5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "fileExistsAtPath:", v12);

    if (v14)
    {
      v15 = v12;

      goto LABEL_8;
    }
  }
  else
  {
    __atxlog_handle_trial_assets();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v19 = 138543362;
      v20 = v5;
      _os_log_impl(&dword_1A49EF000, v16, OS_LOG_TYPE_DEFAULT, "Unable to locate Trial resource: %{public}@", (uint8_t *)&v19, 0xCu);
    }

  }
  v15 = v10;
  if (!v10)
  {
    v17 = 0;
    goto LABEL_10;
  }
LABEL_8:
  loadLazyOrRegularPlist_0(v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_10:

  return v17;
}

+ (id)rawDictionaryUsingMobileAssetsForResource:(id)a3 ofType:(id)a4
{
  objc_class *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v5 = (objc_class *)MEMORY[0x1E0D81638];
  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend([v5 alloc], "initWithFirst:second:", v7, v6);
  pthread_mutex_lock(&overridesLock);
  objc_msgSend((id)overrides, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  pthread_mutex_unlock(&overridesLock);
  objc_msgSend(v7, "stringByAppendingPathExtension:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  getAsset();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "filesystemPathForAssetDataRelativePath:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v9)
    v12 = v9;
  if (v12)
  {
    loadLazyOrRegularPlist_0(v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

+ (id)rawDictionaryForResource:(id)a3 ofType:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a3;
  v7 = a4;
  if ((objc_msgSend(v7, "isEqualToString:", CFSTR("mlmodelc")) & 1) != 0)
  {
    v8 = 0;
  }
  else
  {
    objc_msgSend(a1, "pathForResource:ofType:isDirectory:", v6, v7, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      loadLazyOrRegularPlist_0(v9);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = 0;
    }

  }
  return v8;
}

+ (id)dictionaryForResource:(id)a3 ofType:(id)a4 specifiedABGroup:(id)a5
{
  id v8;
  void *v9;
  ATXAssetsABHelper *v10;
  void *v11;

  v8 = a5;
  objc_msgSend(a1, "rawDictionaryForResource:ofType:", a3, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[ATXAssetsABHelper initWithAssetContents:specifiedABGroup:indexForDevice:]([ATXAssetsABHelper alloc], "initWithAssetContents:specifiedABGroup:indexForDevice:", v9, v8, +[ATXAssetsABHelper indexForDevice](ATXAssetsABHelper, "indexForDevice"));

  -[ATXAssetsABHelper abGroupContents](v10, "abGroupContents");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)dictionaryWithLegacyPathForClass:(Class)a3
{
  void *v4;
  void *v5;

  NSStringFromClass(a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "dictionaryForResource:ofType:specifiedABGroup:", v4, CFSTR("plist"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)dictionaryFromLazyPlistWithLegacyPathForClass:(Class)a3
{
  void *v4;
  void *v5;

  NSStringFromClass(a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "dictionaryForResource:ofType:specifiedABGroup:", v4, CFSTR("plplist"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)dictionaryForClass:(Class)a3
{
  void *v4;
  void *v5;

  NSStringFromClass(a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "dictionaryForClassName:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)dictionaryForClassName:(id)a3
{
  return (id)objc_msgSend(a1, "dictionaryForResource:ofType:", a3, CFSTR("plist"));
}

+ (id)dictionaryFromLazyPlistForClass:(Class)a3
{
  void *v4;
  void *v5;

  NSStringFromClass(a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "dictionaryFromLazyPlistForClassName:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)dictionaryFromLazyPlistForClassName:(id)a3
{
  return (id)objc_msgSend(a1, "dictionaryForResource:ofType:", a3, CFSTR("plplist"));
}

void __40__ATXAssets2_onUpdateRestartThisProcess__block_invoke_cold_1(uint64_t a1)
{
  int v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v1 = 138412290;
  v2 = a1;
  _os_log_debug_impl(&dword_1A49EF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "Registering to quit on update of asset %@", (uint8_t *)&v1, 0xCu);
  OUTLINED_FUNCTION_2();
}

@end
