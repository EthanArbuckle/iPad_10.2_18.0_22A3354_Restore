@implementation HKPluginLoader

+ (id)loadPrincipalClassesConformingToProtocols:(id)a3 fromBundlesInDirectoryAtURL:(id)a4 skipLoadedBundles:(BOOL)a5 error:(id *)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  int v20;
  uint64_t v21;
  void *v23;
  id v24;
  id v25;
  id v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v7 = a5;
  v33 = *MEMORY[0x1E0C80C00];
  v27 = a3;
  v10 = a4;
  v11 = objc_alloc_init(MEMORY[0x1E0CB3620]);
  objc_msgSend(v11, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", v10, MEMORY[0x1E0C9AA60], 0, a6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v24 = v11;
    v25 = v10;
    v26 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v23 = v12;
    v13 = v12;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v29 != v16)
            objc_enumerationMutation(v13);
          v18 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
          objc_msgSend(v18, "pathExtension");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v19, "isEqualToString:", CFSTR("bundle"));

          if (v20)
          {
            v21 = objc_msgSend(a1, "loadPrincipalClassConformingToProtocols:fromBundleAtURL:skipIfLoaded:", v27, v18, v7);
            if (v21)
              objc_msgSend(v26, "addObject:", v21);
          }
        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      }
      while (v15);
    }

    v11 = v24;
    v10 = v25;
    v12 = v23;
  }
  else
  {
    v26 = 0;
  }

  return v26;
}

+ (Class)loadPrincipalClassConformingToProtocols:(id)a3 fromBundleAtURL:(id)a4 skipIfLoaded:(BOOL)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  char v11;
  id v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  NSObject *v19;
  id v20;
  __CFString *v22;
  void *v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  id v29;
  uint8_t buf[4];
  id v31;
  __int16 v32;
  __CFString *v33;
  __int16 v34;
  void *v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB34D0]), "initWithURL:", v8);
  v10 = v9;
  if (!v9)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)HKLogDefault, OS_LOG_TYPE_ERROR))
      +[HKPluginLoader loadPrincipalClassConformingToProtocols:fromBundleAtURL:skipIfLoaded:].cold.1();
    goto LABEL_20;
  }
  if (objc_msgSend(v9, "isLoaded") && a5)
  {
LABEL_20:
    v20 = 0;
    goto LABEL_28;
  }
  v29 = 0;
  v11 = objc_msgSend(v10, "loadAndReturnError:", &v29);
  v12 = v29;
  if ((v11 & 1) != 0)
  {
    v13 = (void *)objc_msgSend(v10, "principalClass");
    if (!v13)
    {
      _HKInitializeLogging();
      if (os_log_type_enabled((os_log_t)HKLogDefault, OS_LOG_TYPE_ERROR))
        +[HKPluginLoader loadPrincipalClassConformingToProtocols:fromBundleAtURL:skipIfLoaded:].cold.3();
    }
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v14 = v7;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v25, v36, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v26;
      while (2)
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v26 != v17)
            objc_enumerationMutation(v14);
          if (objc_msgSend(v13, "conformsToProtocol:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i), (_QWORD)v25))
          {
            _HKInitializeLogging();
            if (os_log_type_enabled((os_log_t)HKLogDefault, OS_LOG_TYPE_DEBUG))
              +[HKPluginLoader loadPrincipalClassConformingToProtocols:fromBundleAtURL:skipIfLoaded:].cold.2();
            v20 = v13;

            goto LABEL_27;
          }
        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v25, v36, 16);
        if (v16)
          continue;
        break;
      }
    }

    _HKInitializeLogging();
    v19 = (id)HKLogDefault;
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      if (v13)
      {
        NSStringFromClass((Class)v13);
        v22 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v22 = CFSTR("<>");
      }
      objc_msgSend(v14, "hk_map:", &__block_literal_global_2, (_QWORD)v25);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "componentsJoinedByString:", CFSTR(", "));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v31 = v8;
      v32 = 2114;
      v33 = v22;
      v34 = 2114;
      v35 = v24;
      _os_log_error_impl(&dword_19A0E6000, v19, OS_LOG_TYPE_ERROR, "Error: failed to load bundle \"%{public}@\": principal class %{public}@ doesn't conform to any of: %{public}@", buf, 0x20u);

      if (v13)
    }

  }
  else
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)HKLogDefault, OS_LOG_TYPE_ERROR))
      +[HKPluginLoader loadPrincipalClassConformingToProtocols:fromBundleAtURL:skipIfLoaded:].cold.4();
  }
  v20 = 0;
LABEL_27:

LABEL_28:
  return (Class)v20;
}

NSString *__87__HKPluginLoader_loadPrincipalClassConformingToProtocols_fromBundleAtURL_skipIfLoaded___block_invoke(int a1, Protocol *proto)
{
  return NSStringFromProtocol(proto);
}

+ (void)loadPrincipalClassConformingToProtocols:fromBundleAtURL:skipIfLoaded:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2(&dword_19A0E6000, v0, v1, "Error: failed to instantiate bundle \"%{public}@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

+ (void)loadPrincipalClassConformingToProtocols:fromBundleAtURL:skipIfLoaded:.cold.2()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_5();
  _os_log_debug_impl(&dword_19A0E6000, v0, OS_LOG_TYPE_DEBUG, "Loaded bundle \"%{public}@\", v1, 0xCu);
  OUTLINED_FUNCTION_3();
}

+ (void)loadPrincipalClassConformingToProtocols:fromBundleAtURL:skipIfLoaded:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2(&dword_19A0E6000, v0, v1, "Error: failed to get principal class from bundle \"%{public}@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

+ (void)loadPrincipalClassConformingToProtocols:fromBundleAtURL:skipIfLoaded:.cold.4()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_5();
  v3 = 2114;
  v4 = v0;
  _os_log_error_impl(&dword_19A0E6000, v1, OS_LOG_TYPE_ERROR, "Error: failed to load bundle \"%{public}@\": %{public}@", v2, 0x16u);
  OUTLINED_FUNCTION_3();
}

@end
