@implementation HKPPTPluginManager

+ (id)sharedPluginManager
{
  if (sharedPluginManager_onceToken != -1)
    dispatch_once(&sharedPluginManager_onceToken, &__block_literal_global_103);
  return (id)sharedPluginManager_sharedManager;
}

void __41__HKPPTPluginManager_sharedPluginManager__block_invoke()
{
  HKPPTPluginManager *v0;
  void *v1;

  v0 = objc_alloc_init(HKPPTPluginManager);
  v1 = (void *)sharedPluginManager_sharedManager;
  sharedPluginManager_sharedManager = (uint64_t)v0;

}

- (HKPPTPluginManager)init
{
  HKPPTPluginManager *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *testClasses;
  NSMutableDictionary *v5;
  NSMutableDictionary *builtinTests;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HKPPTPluginManager;
  v2 = -[HKPPTPluginManager init](&v8, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    testClasses = v2->_testClasses;
    v2->_testClasses = v3;

    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    builtinTests = v2->_builtinTests;
    v2->_builtinTests = v5;

    -[HKPPTPluginManager _loadPPTBundles](v2, "_loadPPTBundles");
  }
  return v2;
}

- (id)builtinTests
{
  return (id)-[NSMutableDictionary copy](self->_builtinTests, "copy");
}

- (Class)classForTestType:(id)a3
{
  return (Class)-[NSMutableDictionary objectForKeyedSubscript:](self->_testClasses, "objectForKeyedSubscript:", a3);
}

- (void)registerDriverClass:(Class)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  _BOOL4 v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t v28[128];
  uint8_t buf[4];
  Class v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  uint64_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = objc_alloc_init(a3);
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "supportedTestType");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = -[NSMutableDictionary objectForKeyedSubscript:](self->_testClasses, "objectForKeyedSubscript:", v6);
      _HKInitializeLogging();
      HKLogTesting();
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = v8;
      if (v7)
      {
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        {
          v10 = -[NSMutableDictionary objectForKeyedSubscript:](self->_testClasses, "objectForKeyedSubscript:", v6);
          *(_DWORD *)buf = 138543874;
          v30 = a3;
          v31 = 2114;
          v32 = v6;
          v33 = 2114;
          v34 = v10;
          _os_log_error_impl(&dword_19A0E6000, v9, OS_LOG_TYPE_ERROR, "Loaded PPT driver %{public}@ supports %{public}@, but we already have a driver (%{public}@) supporting that type.", buf, 0x20u);
        }
      }
      else
      {
        v11 = os_log_type_enabled(v8, OS_LOG_TYPE_INFO);

        if (v11)
        {
          HKLogTesting();
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138543618;
            v30 = a3;
            v31 = 2114;
            v32 = v6;
            _os_log_impl(&dword_19A0E6000, v12, OS_LOG_TYPE_INFO, "Loaded PPT driver %{public}@ for %{public}@", buf, 0x16u);
          }

        }
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_testClasses, "setObject:forKeyedSubscript:", a3, v6);
        objc_msgSend(v5, "builtinTestDefinitions");
        v9 = objc_claimAutoreleasedReturnValue();
        v24 = 0u;
        v25 = 0u;
        v26 = 0u;
        v27 = 0u;
        v13 = -[NSObject countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
        if (v13)
        {
          v14 = v13;
          v15 = v6;
          v22 = v5;
          v16 = *(_QWORD *)v25;
          v17 = MEMORY[0x1E0C9AAB0];
          do
          {
            for (i = 0; i != v14; ++i)
            {
              if (*(_QWORD *)v25 != v16)
                objc_enumerationMutation(v9);
              v19 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i);
              -[NSObject objectForKeyedSubscript:](v9, "objectForKeyedSubscript:", v19, v22);
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              v21 = (void *)objc_msgSend(v20, "mutableCopy");

              objc_msgSend(v21, "setObject:forKeyedSubscript:", v19, CFSTR("testName"));
              objc_msgSend(v21, "setObject:forKeyedSubscript:", v15, CFSTR("testType"));
              objc_msgSend(v21, "setObject:forKeyedSubscript:", v17, CFSTR("enabled"));
              -[NSMutableDictionary setObject:forKeyedSubscript:](self->_builtinTests, "setObject:forKeyedSubscript:", v21, v19);

            }
            v14 = -[NSObject countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
          }
          while (v14);
          v5 = v22;
          v6 = v15;
        }
      }
    }
    else
    {
      _HKInitializeLogging();
      HKLogTesting();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        -[HKPPTPluginManager registerDriverClass:].cold.1((uint64_t)a3, v9);
    }

  }
}

- (void)_loadPPTBundles
{
  unint64_t v3;
  id v4;
  uint64_t v5;
  unint64_t v6;
  _UNKNOWN **v7;
  char **v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  id v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  id v32;
  void *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  id v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  _BYTE v48[128];
  char *v49;
  _BYTE v50[128];
  _QWORD v51[4];

  v51[2] = *MEMORY[0x1E0C80C00];
  v51[0] = CFSTR("/AppleInternal/Library/Health/Plugins");
  v51[1] = CFSTR("/AppleInternal/Library/Health/Plugins/PPTPlugins");
  v3 = 0x1E0C99000uLL;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v51, 2);
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v43, v50, 16);
  if (v29)
  {
    v5 = *(_QWORD *)v44;
    v6 = 0x1E0C99000uLL;
    v7 = &off_1E37E4000;
    v8 = &selRef_initWithExpectedObjectType_;
    v31 = v4;
    v28 = *(_QWORD *)v44;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v44 != v5)
          objc_enumerationMutation(v4);
        v30 = v9;
        v10 = *(void **)(v6 + 3736);
        objc_msgSend((id)GSSystemRootDirectory(), "stringByAppendingPathComponent:", *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * v9));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "fileURLWithPath:", v11);
        v12 = objc_claimAutoreleasedReturnValue();

        v13 = v7[487];
        v49 = v8[430];
        objc_msgSend(*(id *)(v3 + 3360), "arrayWithObjects:count:", &v49, 1);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = 0;
        v33 = (void *)v12;
        objc_msgSend(v13, "loadPrincipalClassesConformingToProtocols:fromBundlesInDirectoryAtURL:skipLoadedBundles:error:", v14, v12, 0, &v42);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = v42;

        v40 = 0u;
        v41 = 0u;
        v38 = 0u;
        v39 = 0u;
        v16 = v15;
        v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v38, v48, 16);
        if (v17)
        {
          v18 = v17;
          v19 = *(_QWORD *)v39;
          while (2)
          {
            for (i = 0; i != v18; ++i)
            {
              if (*(_QWORD *)v39 != v19)
                objc_enumerationMutation(v16);
              v21 = objc_alloc_init(*(Class *)(*((_QWORD *)&v38 + 1) + 8 * i));
              if (!v21)
              {

                v4 = v31;
                goto LABEL_25;
              }
              v22 = v21;
              v36 = 0u;
              v37 = 0u;
              v34 = 0u;
              v35 = 0u;
              objc_msgSend(v21, "PPTDriverClasses");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v34, v47, 16);
              if (v24)
              {
                v25 = v24;
                v26 = *(_QWORD *)v35;
                do
                {
                  for (j = 0; j != v25; ++j)
                  {
                    if (*(_QWORD *)v35 != v26)
                      objc_enumerationMutation(v23);
                    -[HKPPTPluginManager registerDriverClass:](self, "registerDriverClass:", *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * j), v28);
                  }
                  v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v34, v47, 16);
                }
                while (v25);
              }

            }
            v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v38, v48, 16);
            if (v18)
              continue;
            break;
          }
        }

        v9 = v30 + 1;
        v4 = v31;
        v3 = 0x1E0C99000;
        v5 = v28;
        v6 = 0x1E0C99000;
        v7 = &off_1E37E4000;
        v8 = &selRef_initWithExpectedObjectType_;
      }
      while (v30 + 1 != v29);
      v29 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v43, v50, 16);
    }
    while (v29);
  }
LABEL_25:

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_builtinTests, 0);
  objc_storeStrong((id *)&self->_testClasses, 0);
}

- (void)registerDriverClass:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_19A0E6000, a2, OS_LOG_TYPE_ERROR, "Loaded PPT driver %{public}@ did not return a supportedTestType.", (uint8_t *)&v2, 0xCu);
}

@end
