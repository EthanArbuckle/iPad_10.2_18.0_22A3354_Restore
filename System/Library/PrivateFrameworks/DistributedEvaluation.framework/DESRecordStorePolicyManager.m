@implementation DESRecordStorePolicyManager

+ (DESRecordStorePolicyManager)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__DESRecordStorePolicyManager_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, block);
  return (DESRecordStorePolicyManager *)(id)sharedInstance_singleton;
}

void __45__DESRecordStorePolicyManager_sharedInstance__block_invoke()
{
  id v0;
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", CFSTR("/System/Library/DistributedEvaluation/DESRecordStorePolicies"), 1);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v0 = objc_alloc((Class)objc_opt_class());
  +[DESBundleRegistry sharedInstance](DESBundleRegistry, "sharedInstance");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v0, "initWithBundleRegistry:policyPathURL:", v1, v4);
  v3 = (void *)sharedInstance_singleton;
  sharedInstance_singleton = v2;

}

- (DESRecordStorePolicyManager)initWithBundleRegistry:(id)a3 policyPathURL:(id)a4
{
  unint64_t v7;
  unint64_t v8;
  DESRecordStorePolicyManager *v9;
  id *p_isa;
  DESRecordStorePolicyManager *v11;
  objc_super v13;

  v7 = (unint64_t)a3;
  v8 = (unint64_t)a4;
  if (v7 | v8)
  {
    v13.receiver = self;
    v13.super_class = (Class)DESRecordStorePolicyManager;
    v9 = -[DESRecordStorePolicyManager init](&v13, sel_init);
    p_isa = (id *)&v9->super.isa;
    if (v9)
    {
      objc_storeStrong((id *)&v9->_bundleRegistry, a3);
      objc_storeStrong(p_isa + 2, a4);
    }
    self = p_isa;
    v11 = self;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)policyForNSExtensionPluginID:(id)a3
{
  id v4;
  uint64_t *p_policyPathURL;
  NSURL *policyPathURL;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  NSObject *v16;
  id v18;

  v4 = a3;
  policyPathURL = self->_policyPathURL;
  p_policyPathURL = (uint64_t *)&self->_policyPathURL;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.plist"), v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSURL URLByAppendingPathComponent:isDirectory:](policyPathURL, "URLByAppendingPathComponent:isDirectory:", v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8
    && (objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v8, "path"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v11 = objc_msgSend(v9, "fileExistsAtPath:", v10),
        v10,
        v9,
        v11))
  {
    v12 = (void *)MEMORY[0x1BCCC38F0]();
    v18 = 0;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfURL:error:", v8, &v18);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v18;
    if (v13)
    {
      v15 = v13;
    }
    else
    {
      +[DESLogging coreChannel](DESLogging, "coreChannel");
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        -[DESRecordStorePolicyManager policyForNSExtensionPluginID:].cold.1(p_policyPathURL, (uint64_t)v14, v16);

    }
    objc_autoreleasePoolPop(v12);
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)policyForPluginID:(id)a3
{
  if (!a3)
    return 0;
  -[DESRecordStorePolicyManager policyForNSExtensionPluginID:](self, "policyForNSExtensionPluginID:");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (unint64_t)unsignedIntegerForPluginID:(id)a3 key:(id)a4 defaultValue:(unint64_t)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  id v14;
  int v15;
  id v16;
  __int16 v17;
  id v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  -[DESRecordStorePolicyManager policyForPluginID:](self, "policyForPluginID:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      a5 = objc_msgSend(v11, "unsignedIntegerValue");
    }
    else
    {
      +[DESLogging coreChannel](DESLogging, "coreChannel");
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v15 = 138412802;
        v16 = (id)objc_opt_class();
        v17 = 2112;
        v18 = v9;
        v19 = 2112;
        v20 = v8;
        v14 = v16;
        _os_log_error_impl(&dword_1B96E5000, v12, OS_LOG_TYPE_ERROR, "Ignore unknown value type %@, key=%@, plugin=%@.", (uint8_t *)&v15, 0x20u);

      }
    }
  }

  return a5;
}

- (id)stringForPluginID:(id)a3 key:(id)a4 defaultValue:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  char isKindOfClass;
  NSObject *v15;
  id v16;
  id v18;
  int v19;
  id v20;
  __int16 v21;
  id v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[DESRecordStorePolicyManager policyForPluginID:](self, "policyForPluginID:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v10;
  if (v12)
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    v13 = v12;
    if ((isKindOfClass & 1) == 0)
    {
      +[DESLogging coreChannel](DESLogging, "coreChannel");
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        v19 = 138412802;
        v20 = (id)objc_opt_class();
        v21 = 2112;
        v22 = v9;
        v23 = 2112;
        v24 = v8;
        v18 = v20;
        _os_log_error_impl(&dword_1B96E5000, v15, OS_LOG_TYPE_ERROR, "Ignore unknown value type %@, key=%@, plugin=%@.", (uint8_t *)&v19, 0x20u);

      }
      v13 = v10;
    }
  }
  v16 = v13;

  return v16;
}

- (id)arrayOfStringForPlugin:(id)a3 key:(id)a4 defaultValue:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  id v18;
  NSObject *v19;
  NSObject *v20;
  id v22;
  void *v23;
  id v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t v30[128];
  uint8_t buf[4];
  id v32;
  __int16 v33;
  id v34;
  __int16 v35;
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[DESRecordStorePolicyManager policyForPluginID:](self, "policyForPluginID:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
LABEL_15:
    v18 = v10;
    goto LABEL_19;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    +[DESLogging coreChannel](DESLogging, "coreChannel");
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      v32 = (id)objc_opt_class();
      v33 = 2112;
      v34 = v9;
      v35 = 2112;
      v36 = v8;
      v22 = v32;
      _os_log_error_impl(&dword_1B96E5000, v19, OS_LOG_TYPE_ERROR, "Ignore unknown value type=%@, key=%@, plugin=%@.", buf, 0x20u);

    }
    goto LABEL_15;
  }
  v25 = v8;
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v13 = v12;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v27;
    while (2)
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v27 != v16)
          objc_enumerationMutation(v13);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          +[DESLogging coreChannel](DESLogging, "coreChannel");
          v20 = objc_claimAutoreleasedReturnValue();
          v8 = v25;
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          {
            v23 = (void *)objc_opt_class();
            *(_DWORD *)buf = 138412802;
            v32 = v23;
            v33 = 2112;
            v34 = v9;
            v35 = 2112;
            v36 = v25;
            v24 = v23;
            _os_log_error_impl(&dword_1B96E5000, v20, OS_LOG_TYPE_ERROR, "Ignore unknown element value type %@, key=%@, plugin=%@.", buf, 0x20u);

          }
          v18 = v10;

          goto LABEL_19;
        }
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      if (v15)
        continue;
      break;
    }
  }

  v18 = v13;
  v8 = v25;
LABEL_19:

  return v18;
}

- (unint64_t)maximumNumberOfRecordsForPluginID:(id)a3
{
  return -[DESRecordStorePolicyManager unsignedIntegerForPluginID:key:defaultValue:](self, "unsignedIntegerForPluginID:key:defaultValue:", a3, CFSTR("DESMaximumNumberOfRecordsKey"), 10);
}

- (unint64_t)daysToExpirationOfRecordsForPluginID:(id)a3
{
  return -[DESRecordStorePolicyManager unsignedIntegerForPluginID:key:defaultValue:](self, "unsignedIntegerForPluginID:key:defaultValue:", a3, CFSTR("DESDaysToExpirationOfRecordsKey"), 28);
}

- (unint64_t)coreDuetEventLimitForPluginID:(id)a3
{
  return -[DESRecordStorePolicyManager unsignedIntegerForPluginID:key:defaultValue:](self, "unsignedIntegerForPluginID:key:defaultValue:", a3, CFSTR("DESCoreDuetEventLimit"), 1000);
}

- (id)coreDuetPredicateForPluginID:(id)a3
{
  return -[DESRecordStorePolicyManager stringForPluginID:key:defaultValue:](self, "stringForPluginID:key:defaultValue:", a3, CFSTR("DESCoreDuetEventPredicate"), 0);
}

- (id)supportedRecordTypesForPluginID:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v4 = (void *)MEMORY[0x1E0C99D20];
  v5 = a3;
  objc_msgSend(v4, "arrayWithObjects:count:", &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[DESRecordStorePolicyManager arrayOfStringForPlugin:key:defaultValue:](self, "arrayOfStringForPlugin:key:defaultValue:", v5, CFSTR("DESSupportedRecordTypes"), v6, v9, v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)supportedCoreDuetEventStreamNamesForPluginID:(id)a3
{
  return -[DESRecordStorePolicyManager arrayOfStringForPlugin:key:defaultValue:](self, "arrayOfStringForPlugin:key:defaultValue:", a3, CFSTR("DESCoreDuetSupportedEventStreamNames"), MEMORY[0x1E0C9AA60]);
}

- (id)coreDuetEventQueryForPluginID:(id)a3
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_policyPathURL, 0);
  objc_storeStrong((id *)&self->_bundleRegistry, 0);
}

- (void)policyForNSExtensionPluginID:(os_log_t)log .cold.1(uint64_t *a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *a1;
  v4 = 138412546;
  v5 = v3;
  v6 = 2112;
  v7 = a2;
  _os_log_error_impl(&dword_1B96E5000, log, OS_LOG_TYPE_ERROR, "Fail to load policy from plist=%@, error=%@", (uint8_t *)&v4, 0x16u);
}

@end
