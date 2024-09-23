@implementation _DKSync3Policy

+ (id)policyCache
{
  objc_opt_self();
  if (policyCache_onceToken_0 != -1)
    dispatch_once(&policyCache_onceToken_0, &__block_literal_global_655);
  return (id)policyCache_policyCache_0;
}

+ (id)disabledPolicy
{
  if (disabledPolicy_onceToken != -1)
    dispatch_once(&disabledPolicy_onceToken, &__block_literal_global_33);
  return (id)disabledPolicy_policy;
}

+ (id)computedPolicyDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  +[_DKSync3Policy configurationPlistForFilename:](_DKSync3Policy, "configurationPlistForFilename:", CFSTR("Policies/com.apple.coreduet.knowledge.syncPolicies3.plist"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "userDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("Sync3Policies"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "userDefaults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("Sync3Policy"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "computePolicyDictionaryWithDefaultSyncPolicyDict:syncPolicyOverridesDict:topLevelDefaultsPolicy:", v3, v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)computePolicyDictionaryWithDefaultSyncPolicyDict:(id)a3 syncPolicyOverridesDict:(id)a4 topLevelDefaultsPolicy:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  float v14;
  float v15;
  void *v16;
  float v17;
  NSObject *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  int v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v11 = objc_msgSend(v8, "mutableCopy");
  else
    v11 = objc_opt_new();
  v12 = (void *)v11;
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("Version"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "floatValue");
  v15 = v14;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("Version"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v16 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0) || (objc_msgSend(v16, "floatValue"), v17 < v15))
    {
      +[_CDLogging syncChannel](_CDLogging, "syncChannel");
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        objc_msgSend((id)objc_opt_class(), "description");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = 138543362;
        v27 = v19;
        _os_log_impl(&dword_18DDBE000, v18, OS_LOG_TYPE_INFO, "%{public}@: Sync policy is invalid and/or old, removing saved policies from default", (uint8_t *)&v26, 0xCu);

      }
      if (!+[_DKCloudUtilities isUnitTesting](_DKCloudUtilities, "isUnitTesting"))
      {
        objc_msgSend(a1, "userDefaults");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "removeObjectForKey:", CFSTR("Sync3Policies"));

      }
      v9 = (id)MEMORY[0x1E0C9AA70];
    }
    if (objc_msgSend(v9, "count"))
    {
      +[_CDLogging syncChannel](_CDLogging, "syncChannel");
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
        +[_DKSync3Policy computePolicyDictionaryWithDefaultSyncPolicyDict:syncPolicyOverridesDict:topLevelDefaultsPolicy:].cold.2();

      objc_msgSend(a1, "overrideDictionary:withOverrides:", v12, v9);
    }

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v10, "count"))
  {
    +[_CDLogging syncChannel](_CDLogging, "syncChannel");
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      +[_DKSync3Policy computePolicyDictionaryWithDefaultSyncPolicyDict:syncPolicyOverridesDict:topLevelDefaultsPolicy:].cold.1();

    objc_msgSend(a1, "overrideDictionary:withOverrides:", v12, v10);
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("StreamNamesToAlwaysSync"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v23, "count"))
      objc_msgSend(a1, "addToDictionary:streamNamesToAlwaysSync:", v12, v23);

  }
  if (!objc_msgSend(v12, "count"))
    objc_msgSend(v12, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("SyncDisabled"));
  v24 = (void *)objc_msgSend(v12, "copy");

  return v24;
}

+ (void)overrideDictionary:(id)a3 withOverrides:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  __int128 v19;
  uint64_t v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  uint64_t v29;
  __int16 v30;
  uint64_t v31;
  __int16 v32;
  uint64_t v33;
  __int16 v34;
  id v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v36, 16);
  if (v7)
  {
    v9 = v7;
    v10 = *(_QWORD *)v23;
    *(_QWORD *)&v8 = 138544386;
    v19 = v8;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v23 != v10)
          objc_enumerationMutation(v6);
        v12 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i);
        objc_msgSend(v5, "objectForKeyedSubscript:", v12, v19);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "objectForKeyedSubscript:", v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13
          && ((objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
           || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)))
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            v15 = v14;
            v16 = (void *)objc_msgSend(v13, "mutableCopy");
            objc_msgSend(v16, "addEntriesFromDictionary:", v15);

            objc_msgSend(v5, "setObject:forKeyedSubscript:", v16, v12);
          }
          else
          {
            +[_CDLogging syncChannel](_CDLogging, "syncChannel");
            v17 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
            {
              objc_msgSend((id)objc_opt_class(), "description");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              v20 = objc_opt_class();
              v18 = objc_opt_class();
              *(_DWORD *)buf = v19;
              v27 = v21;
              v28 = 2114;
              v29 = v12;
              v30 = 2114;
              v31 = v20;
              v32 = 2114;
              v33 = v18;
              v34 = 2112;
              v35 = v5;
              _os_log_error_impl(&dword_18DDBE000, v17, OS_LOG_TYPE_ERROR, "%{public}@: Ignoring override due to type mismatch for key %{public}@ (%{public}@ vs. %{public}@: %@", buf, 0x34u);

            }
          }
        }
        else
        {
          objc_msgSend(v5, "setObject:forKeyedSubscript:", v14, v12);
        }

      }
      v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v36, 16);
    }
    while (v9);
  }

}

+ (void)addToDictionary:(id)a3 streamNamesToAlwaysSync:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  uint64_t v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  id v31;
  void *v32;
  id v33;
  uint64_t v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  _BYTE v48[128];
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v33 = a4;
  v32 = (void *)objc_opt_new();
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v43, v49, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v44;
    v30 = *(_QWORD *)v44;
    v31 = v6;
    do
    {
      v10 = 0;
      v34 = v8;
      do
      {
        if (*(_QWORD *)v44 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * v10);
        objc_msgSend(v6, "objectForKeyedSubscript:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("StreamNames"));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v14 = (void *)objc_msgSend(v13, "mutableCopy");
            v39 = 0u;
            v40 = 0u;
            v41 = 0u;
            v42 = 0u;
            v15 = v33;
            v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v39, v48, 16);
            if (v16)
            {
              v17 = v16;
              v18 = *(_QWORD *)v40;
              do
              {
                for (i = 0; i != v17; ++i)
                {
                  if (*(_QWORD *)v40 != v18)
                    objc_enumerationMutation(v15);
                  v20 = *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * i);
                  if ((objc_msgSend(v14, "containsObject:", v20) & 1) == 0)
                    objc_msgSend(v14, "addObject:", v20);
                }
                v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v39, v48, 16);
              }
              while (v17);
            }

            objc_msgSend(v32, "setObject:forKeyedSubscript:", v14, v11);
            v9 = v30;
            v6 = v31;
            v8 = v34;
          }

        }
        ++v10;
      }
      while (v10 != v8);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v43, v49, 16);
    }
    while (v8);
  }

  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v21 = v32;
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v35, v47, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v36;
    do
    {
      for (j = 0; j != v23; ++j)
      {
        if (*(_QWORD *)v36 != v24)
          objc_enumerationMutation(v21);
        v26 = *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * j);
        objc_msgSend(v21, "objectForKeyedSubscript:", v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "objectForKeyedSubscript:", v26);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = (void *)objc_msgSend(v28, "mutableCopy");
        objc_msgSend(v29, "setObject:forKeyedSubscript:", v27, CFSTR("StreamNames"));
        objc_msgSend(v6, "setObject:forKeyedSubscript:", v29, v26);

      }
      v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v35, v47, 16);
    }
    while (v23);
  }

}

+ (void)fillPolicyCache:(id)a3 bySplittingPolicyDictionary:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  NSObject *v24;
  void *v25;
  id v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  NSObject *v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v27 = a3;
  v5 = a4;
  v25 = (void *)objc_opt_new();
  v24 = objc_opt_new();
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v29;
    v26 = v6;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v29 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * v10);
        objc_msgSend(v6, "objectForKeyedSubscript:", v11);
        v12 = objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v13 = v8;
          v14 = v12;
          -[NSObject objectForKeyedSubscript:](v14, "objectForKeyedSubscript:", CFSTR("Feature"));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (v15)
          {
            v16 = -[_DKSync3FeaturePolicy initWithName:properties:]((id *)[_DKSync3FeaturePolicy alloc], v11, v14);
            objc_msgSend(v27, "setObject:forKey:", v16, v11);
            objc_msgSend(v25, "addObject:", v15);
            objc_msgSend(v27, "objectForKey:", v15);
            v17 = objc_claimAutoreleasedReturnValue();
            if (!v17)
            {
              v17 = objc_opt_new();
              objc_msgSend(v27, "setObject:forKey:", v17, v15);
            }
            v18 = v17;
            v19 = v16;
LABEL_15:
            -[NSObject addObject:](v18, "addObject:", v19);
          }
          else
          {
            -[NSObject objectForKeyedSubscript:](v14, "objectForKeyedSubscript:", CFSTR("Transport"));
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            if (v16)
            {
              v17 = -[_DKSync3TransportPolicy initWithName:properties:]((id *)[_DKSync3TransportPolicy alloc], v11, v14);
              objc_msgSend(v27, "setObject:forKey:", v17, v11);
              v18 = v24;
              v19 = v11;
              goto LABEL_15;
            }
            +[_CDLogging syncChannel](_CDLogging, "syncChannel");
            v17 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
            {
              objc_msgSend((id)objc_opt_class(), "description");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v33 = v21;
              v34 = 2112;
              v35 = v14;
              _os_log_fault_impl(&dword_18DDBE000, v17, OS_LOG_TYPE_FAULT, "%{public}@: Ignoring unrecognized policy dictionary: %@", buf, 0x16u);

            }
          }

          v8 = v13;
          v6 = v26;
          goto LABEL_17;
        }
        +[_CDLogging syncChannel](_CDLogging, "syncChannel");
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend((id)objc_opt_class(), "description");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v33 = v20;
          v34 = 2112;
          v35 = v12;
          _os_log_debug_impl(&dword_18DDBE000, v14, OS_LOG_TYPE_DEBUG, "%{public}@: Ignoring unrecognized policy object: %@", buf, 0x16u);

        }
LABEL_17:

        ++v10;
      }
      while (v8 != v10);
      v22 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
      v8 = v22;
    }
    while (v22);
  }

  objc_msgSend(v27, "setObject:forKey:", v25, CFSTR("_DKSync3PolicyAllFeatures"));
  objc_msgSend(v27, "setObject:forKey:", v24, CFSTR("_DKSync3PolicyAllTransports"));
  objc_msgSend(v27, "debugDescription");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  NSLog(CFSTR("policyCache = %@"), v23);

}

+ (id)productVersion
{
  void *v2;
  const void *v3;
  void *v4;

  v2 = (void *)_CFCopySystemVersionDictionary();
  if (v2)
  {
    v3 = v2;
    objc_msgSend(v2, "objectForKey:", *MEMORY[0x1E0C9ABB0]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    CFRelease(v3);
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

+ (id)userDefaults
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.CoreDuet"));
}

+ (BOOL)rapportSyncDisabled
{
  void *v2;
  void *v3;
  void *v4;
  char v5;

  objc_msgSend(a1, "userDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("Sync3Policy"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("RapportSyncDisabled"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "BOOLValue");

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (BOOL)cloudSyncDisabled
{
  void *v2;
  void *v3;
  void *v4;
  char v5;

  objc_msgSend(a1, "userDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("Sync3Policy"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("CloudSyncDisabled"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "BOOLValue");

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (void)possiblyDownloadSyncPolicyWithPolicyDownloadIntervalInDays:(unint64_t)a3
{
  _QWORD block[4];
  id v4;
  id v5;
  unint64_t v6;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __77___DKSync3Policy_possiblyDownloadSyncPolicyWithPolicyDownloadIntervalInDays___block_invoke;
  block[3] = &unk_1E26E2E50;
  v4 = CFSTR("com.apple.coreduet.sync-policy.policy-download");
  v5 = a1;
  v6 = a3;
  if (possiblyDownloadSyncPolicyWithPolicyDownloadIntervalInDays__initialized_0 != -1)
    dispatch_once(&possiblyDownloadSyncPolicyWithPolicyDownloadIntervalInDays__initialized_0, block);

}

+ (void)handleDownloadSyncPolicyResponse:(id)a3 data:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v10)
  {
    +[_CDLogging syncChannel](_CDLogging, "syncChannel");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      +[_DKSync2Policy handleDownloadSyncPolicyResponse:data:error:].cold.4();

    goto LABEL_5;
  }
  if (objc_msgSend(v8, "statusCode") != 200)
  {
    if (objc_msgSend(v8, "statusCode") != 204
      && objc_msgSend(v8, "statusCode") != 205
      && objc_msgSend(v8, "statusCode") != 404
      && objc_msgSend(v8, "statusCode") != 410)
    {
      goto LABEL_5;
    }
    v12 = (void *)objc_opt_new();
    if (!v12)
      goto LABEL_5;
LABEL_19:
    +[_DKSync3Policy userDefaults](_DKSync3Policy, "userDefaults");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKey:", CFSTR("Sync3Policies"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (v16)
      v18 = v16;
    else
      v18 = (id)objc_opt_new();
    v19 = v18;

    objc_msgSend(v13, "setValue:forKey:", v12, CFSTR("Sync3Policies"));
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setValue:forKey:", v20, CFSTR("CloudSyncPoliciesLastModified"));

    if ((objc_msgSend(v12, "isEqualToDictionary:", v19) & 1) == 0)
    {
      +[_DKSync3Policy policyCache]();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "removeAllObjects");

      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "postNotificationName:object:userInfo:", CFSTR("_DKSync3PolicyDidChangeNotification"), a1, 0);

    }
    goto LABEL_25;
  }
  v23 = 0;
  objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v9, 0, 0, &v23);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v23;
  if (!v12)
  {
    +[_CDLogging syncChannel](_CDLogging, "syncChannel");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      +[_DKSync2Policy handleDownloadSyncPolicyResponse:data:error:].cold.3();

  }
  if (v12)
    goto LABEL_19;
LABEL_5:
  if (objc_msgSend(v8, "statusCode") == 304)
  {
    +[_DKSync3Policy userDefaults](_DKSync3Policy, "userDefaults");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setValue:forKey:", v13, CFSTR("CloudSyncPoliciesLastModified"));
LABEL_25:

  }
}

+ (id)syncPolicyConfigPathForFilename:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB34D0];
  v4 = a3;
  objc_msgSend(v3, "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pathForResource:ofType:", v4, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)configurationPlistForFilename:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;

  v4 = a3;
  objc_msgSend(a1, "syncPolicyConfigPathForFilename:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    +[_CDLogging syncChannel](_CDLogging, "syncChannel");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      +[_DKSync3Policy configurationPlistForFilename:].cold.1();
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfFile:", v5);
  v6 = objc_claimAutoreleasedReturnValue();
  if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    +[_CDLogging syncChannel](_CDLogging, "syncChannel");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      +[_DKSync3Policy configurationPlistForFilename:].cold.2();

LABEL_9:
    v6 = 0;
  }

  return v6;
}

- (_DKSync3Policy)init
{
  _DKSync3Policy *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_DKSync3Policy;
  result = -[_DKSync3Policy init](&v3, sel_init);
  if (result)
    result->_syncDisabled = 1;
  return result;
}

+ (void)_possiblyAddToArray:(id)a3 ifTransport:(int64_t)a4 existsInTransports:(int64_t)a5
{
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;

  v7 = a3;
  if ((a5 & a4) != 0)
  {
    +[_DKSyncPeerStatusTracker stringForTransports:](_DKSyncPeerStatusTracker, "stringForTransports:", a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[_DKSync3Policy policyCache]();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKey:", v8);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v10;
    if (v10)
    {
      if (!*(_BYTE *)(v10 + 8))
      {
        objc_msgSend(v7, "addObject:", v10);
        goto LABEL_10;
      }
      +[_CDLogging syncChannel](_CDLogging, "syncChannel");
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        +[_DKSync3Policy _possiblyAddToArray:ifTransport:existsInTransports:].cold.2();
    }
    else
    {
      +[_CDLogging syncChannel](_CDLogging, "syncChannel");
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        +[_DKSync3Policy _possiblyAddToArray:ifTransport:existsInTransports:].cold.1();
    }

LABEL_10:
  }

}

- (unint64_t)_minimumPropertyValueWithKey:(id)a3 policies:(id)a4 skipZeroValues:(BOOL)a5
{
  id v6;
  id v7;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  char v13;
  uint64_t i;
  void *v15;
  void *v16;
  unint64_t v17;
  unint64_t v18;
  NSObject *v19;
  __int128 v21;
  void *v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  id v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
  if (v8)
  {
    v10 = v8;
    v11 = 0;
    v12 = *(_QWORD *)v25;
    v13 = 1;
    *(_QWORD *)&v9 = 138543618;
    v21 = v9;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v25 != v12)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * i), "properties", v21);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "objectForKeyedSubscript:", v6);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v17 = objc_msgSend(v16, "unsignedIntegerValue");
          if (v17 >= v11)
            v18 = v11;
          else
            v18 = v17;
          if ((v13 & 1) != 0)
            v18 = v17;
          v13 &= v17 == 0 && a5;
          if (v17 != 0 || !a5)
            v11 = v18;
        }
        else if (v16)
        {
          +[_CDLogging syncChannel](_CDLogging, "syncChannel");
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend((id)objc_opt_class(), "description");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v21;
            v29 = v22;
            v30 = 2114;
            v31 = v6;
            _os_log_error_impl(&dword_18DDBE000, v19, OS_LOG_TYPE_ERROR, "%{public}@: Invalid non-number type for key %{public}@", buf, 0x16u);

          }
        }

      }
      v10 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
    }
    while (v10);
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (unint64_t)_maximumPropertyValueWithKey:(id)a3 policies:(id)a4 skipZeroValues:(BOOL)a5
{
  id v6;
  id v7;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  char v13;
  uint64_t i;
  void *v15;
  void *v16;
  unint64_t v17;
  unint64_t v18;
  NSObject *v19;
  __int128 v21;
  void *v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  id v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
  if (v8)
  {
    v10 = v8;
    v11 = 0;
    v12 = *(_QWORD *)v25;
    v13 = 1;
    *(_QWORD *)&v9 = 138543618;
    v21 = v9;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v25 != v12)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * i), "properties", v21);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "objectForKeyedSubscript:", v6);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v17 = objc_msgSend(v16, "unsignedIntegerValue");
          if (v17 <= v11)
            v18 = v11;
          else
            v18 = v17;
          if ((v13 & 1) != 0)
            v18 = v17;
          v13 &= v17 == 0 && a5;
          if (v17 != 0 || !a5)
            v11 = v18;
        }
        else if (v16)
        {
          +[_CDLogging syncChannel](_CDLogging, "syncChannel");
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend((id)objc_opt_class(), "description");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v21;
            v29 = v22;
            v30 = 2114;
            v31 = v6;
            _os_log_error_impl(&dword_18DDBE000, v19, OS_LOG_TYPE_ERROR, "%{public}@: Invalid non-number type for key %{public}@", buf, 0x16u);

          }
        }

      }
      v10 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
    }
    while (v10);
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (BOOL)_anyFeaturePropertyValueWithKey:(id)a3 getterBlock:(id)a4
{
  uint64_t (**v5)(id, _QWORD);
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = (uint64_t (**)(id, _QWORD))a4;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = self->_featurePolicies;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v6);
        if ((v5[2](v5, *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i)) & 1) != 0)
        {
          LOBYTE(v7) = 1;
          goto LABEL_11;
        }
      }
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_11:

  return v7;
}

- (unint64_t)minimumTimeBetweenSyncsInSecondsMaximumValue
{
  _QWORD *v3;
  unint64_t v4;

  if (!-[NSArray count](self->_transportPolicies, "count"))
    return 0;
  if (-[NSArray count](self->_transportPolicies, "count") == 1)
  {
    -[NSArray firstObject](self->_transportPolicies, "firstObject");
    v3 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    if (v3)
      v4 = v3[9];
    else
      v4 = 0;

    return v4;
  }
  return -[_DKSync3Policy _maximumPropertyValueWithKey:policies:skipZeroValues:](self, "_maximumPropertyValueWithKey:policies:skipZeroValues:", CFSTR("MinimumTimeBetweenSyncsInSeconds"), self->_transportPolicies, 1);
}

- (uint64_t)periodicSyncCadenceInMinutesMinimumValue
{
  id *v1;
  _QWORD *v2;

  v1 = a1;
  if (!a1)
    return (uint64_t)v1;
  if (!objc_msgSend(a1[9], "count"))
    return 0;
  if (objc_msgSend(v1[9], "count") == 1)
  {
    objc_msgSend(v1[9], "firstObject");
    v2 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    if (v2)
      v1 = (id *)v2[10];
    else
      v1 = 0;

    return (uint64_t)v1;
  }
  return objc_msgSend(v1, "_minimumPropertyValueWithKey:policies:skipZeroValues:", CFSTR("PeriodicSyncCadenceInMinutes"), v1[9], 1);
}

- (id)description
{
  id v3;
  objc_class *v4;
  void *v5;
  const __CFString *v6;
  const __CFString *v7;
  const __CFString *v8;
  unint64_t triggeredSyncDelayInSeconds;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  const __CFString *v15;
  void *v16;

  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("%@ { \n"), v5);

  if (self)
  {
    objc_msgSend(v3, "appendFormat:", CFSTR("                                 version: %@\n"), self->_version);
    if (self->_syncDisabled
      || !-[NSArray count](self->_featurePolicies, "count")
      || !-[NSArray count](self->_transportPolicies, "count"))
    {
      v6 = CFSTR("YES");
      goto LABEL_4;
    }
  }
  else
  {
    objc_msgSend(v3, "appendFormat:", CFSTR("                                 version: %@\n"), 0);
  }
  v6 = CFSTR("NO");
LABEL_4:
  objc_msgSend(v3, "appendFormat:", CFSTR("                            syncDisabled: %@\n"), v6);
  if (+[_DKSync3Policy cloudSyncDisabled](_DKSync3Policy, "cloudSyncDisabled"))
  {
    if (+[_DKSync3Policy cloudSyncDisabled](_DKSync3Policy, "cloudSyncDisabled"))
      v7 = CFSTR("YES");
    else
      v7 = CFSTR("NO");
    objc_msgSend(v3, "appendFormat:", CFSTR("                       cloudSyncDisabled: %@\n"), v7);
  }
  if (+[_DKSync3Policy rapportSyncDisabled](_DKSync3Policy, "rapportSyncDisabled"))
  {
    if (+[_DKSync3Policy rapportSyncDisabled](_DKSync3Policy, "rapportSyncDisabled"))
      v8 = CFSTR("YES");
    else
      v8 = CFSTR("NO");
    objc_msgSend(v3, "appendFormat:", CFSTR("                     rapportSyncDisabled: %@\n"), v8);
  }
  if (self)
    triggeredSyncDelayInSeconds = self->_triggeredSyncDelayInSeconds;
  else
    triggeredSyncDelayInSeconds = 0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", triggeredSyncDelayInSeconds);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("             triggeredSyncDelayInSeconds: %@\n"), v10);

  +[_DKSyncPeerStatusTracker stringForTransports:](_DKSyncPeerStatusTracker, "stringForTransports:", self->_mask);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("                              transports: %@\n"), v11);

  if (-[NSArray count](self->_sourceDevices, "count"))
  {
    _CDPrettyPrintCollection(self->_sourceDevices, 0, 0, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("                           sourceDevices: %@\n"), v12);

  }
  if (-[NSArray count](self->_destinationDevices, "count"))
  {
    _CDPrettyPrintCollection(self->_destinationDevices, 0, 0, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("                      destinationDevices: %@\n"), v13);

  }
  if (self->_isSingleDevice)
    v14 = CFSTR("YES");
  else
    v14 = CFSTR("NO");
  objc_msgSend(v3, "appendFormat:", CFSTR("                          isSingleDevice: %@\n"), v14);
  if (self->_isOnPower)
    v15 = CFSTR("YES");
  else
    v15 = CFSTR("NO");
  objc_msgSend(v3, "appendFormat:", CFSTR("                               isOnPower: %@\n"), v15);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[_DKSync3Policy periodicSyncCadenceInMinutesMinimumValue]((id *)&self->super.isa));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("periodicSyncCadenceInMinutesMinimumValue: %@\n"), v16);

  objc_msgSend(v3, "appendFormat:", CFSTR("                       transportPolicies: %@\n"), self->_transportPolicies);
  objc_msgSend(v3, "appendFormat:", CFSTR("                         featurePolicies: %@\n"), self->_featurePolicies);
  objc_msgSend(v3, "appendString:", CFSTR("}\n"));
  return v3;
}

- (NSDictionary)properties
{
  return self->_properties;
}

- (void)setProperties:(id)a3
{
  objc_storeStrong((id *)&self->_properties, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featurePolicies, 0);
  objc_storeStrong((id *)&self->_transportPolicies, 0);
  objc_storeStrong((id *)&self->_destinationDevices, 0);
  objc_storeStrong((id *)&self->_sourceDevices, 0);
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_properties, 0);
}

+ (void)computePolicyDictionaryWithDefaultSyncPolicyDict:syncPolicyOverridesDict:topLevelDefaultsPolicy:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_8_1();
  objc_msgSend((id)OUTLINED_FUNCTION_3_0(), "description");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_6();
  OUTLINED_FUNCTION_9(&dword_18DDBE000, v1, v2, "%{public}@: Using local policy override: %{public}@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_7();
}

+ (void)computePolicyDictionaryWithDefaultSyncPolicyDict:syncPolicyOverridesDict:topLevelDefaultsPolicy:.cold.2()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_8_1();
  objc_msgSend((id)OUTLINED_FUNCTION_3_0(), "description");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_6();
  OUTLINED_FUNCTION_9(&dword_18DDBE000, v1, v2, "%{public}@: Using remote policy override: %{public}@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_7();
}

+ (void)configurationPlistForFilename:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  OUTLINED_FUNCTION_8_1();
  objc_msgSend((id)OUTLINED_FUNCTION_3_0(), "description");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_22_0();
  OUTLINED_FUNCTION_4_1(&dword_18DDBE000, v1, v2, "%{public}@: Unable to obtain resource path for %@", v3, v4, v5, v6, 2u);

  OUTLINED_FUNCTION_7();
}

+ (void)configurationPlistForFilename:.cold.2()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  OUTLINED_FUNCTION_8_1();
  objc_msgSend((id)OUTLINED_FUNCTION_3_0(), "description");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_22_0();
  OUTLINED_FUNCTION_4_1(&dword_18DDBE000, v1, v2, "%{public}@: Failed to read policy file: %@", v3, v4, v5, v6, 2u);

  OUTLINED_FUNCTION_7();
}

+ (void)_possiblyAddToArray:ifTransport:existsInTransports:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_8_1();
  objc_msgSend((id)OUTLINED_FUNCTION_3_0(), "description");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_6();
  OUTLINED_FUNCTION_4_1(&dword_18DDBE000, v1, v2, "%{public}@: Missing transport policy for %{public}@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_7();
}

+ (void)_possiblyAddToArray:ifTransport:existsInTransports:.cold.2()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_8_1();
  objc_msgSend((id)OUTLINED_FUNCTION_3_0(), "description");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_6();
  OUTLINED_FUNCTION_9(&dword_18DDBE000, v1, v2, "%{public}@: Transport policy is diabled for %{public}@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_7();
}

@end
