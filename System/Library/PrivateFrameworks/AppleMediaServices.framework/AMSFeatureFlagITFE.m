@implementation AMSFeatureFlagITFE

- (AMSFeatureFlagITFE)initWithValue:(id)a3 isEnabled:(BOOL)a4 isMutable:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL8 v6;
  id v8;
  AMSFeatureFlagITFE *v9;
  AMSFeatureFlagITFE *v10;
  objc_super v12;

  v5 = a5;
  v6 = a4;
  v8 = a3;
  v12.receiver = self;
  v12.super_class = (Class)AMSFeatureFlagITFE;
  v9 = -[AMSFeatureFlagITFE init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    -[AMSFeatureFlagITFE setValue:](v9, "setValue:", v8);
    -[AMSFeatureFlagITFE setEnabled:](v10, "setEnabled:", v6);
    -[AMSFeatureFlagITFE setReadonly:](v10, "setReadonly:", !v5);
  }

  return v10;
}

- (void)toggle:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id v6;

  v3 = a3;
  -[AMSFeatureFlagITFE value](self, "value");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "setMutableFeatureName:toValue:", v6, v5);
  -[AMSFeatureFlagITFE setEnabled:](self, "setEnabled:", v3);

}

+ (id)fetchProfileFeatures
{
  void *v2;
  uint64_t v3;

  CFPreferencesAppSynchronize(CFSTR("com.apple.storeservices.itfe"));
  v2 = (void *)CFPreferencesCopyAppValue(CFSTR("additionalFeatures"), CFSTR("com.apple.storeservices.itfe"));
  if (!v2 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v3 = objc_opt_new();

    v2 = (void *)v3;
  }
  return v2;
}

+ (id)fetchMutableFeatures
{
  void *v2;
  uint64_t v3;
  void *v4;

  CFPreferencesAppSynchronize(CFSTR("com.apple.storeservices.itfe"));
  v2 = (void *)CFPreferencesCopyAppValue(CFSTR("features"), CFSTR("com.apple.storeservices.itfe"));
  if (!v2 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v3 = objc_opt_new();

    v2 = (void *)v3;
  }
  v4 = (void *)objc_msgSend(v2, "mutableCopy");

  return v4;
}

+ (id)fetchCustomFeatures
{
  void *v3;
  void *v4;
  const void *v5;
  void *v6;

  CFPreferencesAppSynchronize(CFSTR("com.apple.storeservices.itfe"));
  v3 = (void *)CFPreferencesCopyAppValue(CFSTR("customFeatures"), CFSTR("com.apple.storeservices.itfe"));
  if (!v3 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_msgSend(a1, "_customITFEs");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "ams_mapWithTransform:", &__block_literal_global_56);
    v5 = (const void *)objc_claimAutoreleasedReturnValue();

    CFPreferencesSetAppValue(CFSTR("customFeatures"), v5, CFSTR("com.apple.storeservices.itfe"));
    CFPreferencesAppSynchronize(CFSTR("com.apple.storeservices.itfe"));
    v3 = (void *)v5;
  }
  v6 = (void *)objc_msgSend(v3, "mutableCopy");

  return v6;
}

uint64_t __41__AMSFeatureFlagITFE_fetchCustomFeatures__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "value");
}

+ (void)setMutableFeatureName:(id)a3 toValue:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  int v18;
  const __CFString *v19;
  const char *v20;
  NSObject *v21;
  uint32_t v22;
  void *v23;
  void *v24;
  int v25;
  uint64_t v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  const __CFString *v30;
  __int16 v31;
  __CFString *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByTrimmingCharactersInSet:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "lowercaseString");
  v10 = (__CFString *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "fetchProfileFeatures");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[__CFString length](v10, "length"))
    goto LABEL_22;
  objc_msgSend(v11, "objectForKey:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
    goto LABEL_22;
  objc_msgSend(a1, "fetchMutableFeatures");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  AMSSetLogKeyIfNeeded();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v7, v10);
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v15)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v15, "OSLogObject");
    v16 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      goto LABEL_15;
    v17 = objc_opt_class();
    v18 = objc_msgSend(v7, "BOOLValue");
    v19 = CFSTR("Disabled");
    v25 = 138544130;
    v26 = v17;
    v27 = 2114;
    if (v18)
      v19 = CFSTR("Enabled");
    v28 = v14;
    v29 = 2114;
    v30 = v19;
    v31 = 2114;
    v32 = v10;
    v20 = "%{public}@: [%{public}@] ITFE %{public}@: %{public}@";
    v21 = v16;
    v22 = 42;
  }
  else
  {
    objc_msgSend(v13, "removeObjectForKey:", v10);
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v15)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v15, "OSLogObject");
    v16 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      goto LABEL_15;
    v25 = 138543874;
    v26 = objc_opt_class();
    v27 = 2114;
    v28 = v14;
    v29 = 2114;
    v30 = v10;
    v20 = "%{public}@: [%{public}@] ITFE Removed: %{public}@";
    v21 = v16;
    v22 = 32;
  }
  _os_log_impl(&dword_18C849000, v21, OS_LOG_TYPE_DEFAULT, v20, (uint8_t *)&v25, v22);
LABEL_15:

  if (objc_msgSend(a1, "_isITFEValueCustom:", v6))
  {
    objc_msgSend(a1, "fetchCustomFeatures");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v23;
    if (v7)
    {
      if ((objc_msgSend(v23, "containsObject:", v6) & 1) == 0)
        objc_msgSend(v24, "addObject:", v6);
    }
    else
    {
      objc_msgSend(v23, "removeObject:", v6);
    }
    CFPreferencesSetAppValue(CFSTR("customFeatures"), v24, CFSTR("com.apple.storeservices.itfe"));

  }
  CFPreferencesSetAppValue(CFSTR("features"), v13, CFSTR("com.apple.storeservices.itfe"));
  CFPreferencesAppSynchronize(CFSTR("com.apple.storeservices.itfe"));

LABEL_22:
}

+ (void)resetFeatures
{
  CFArrayRef v2;
  const __CFArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = CFPreferencesCopyKeyList(CFSTR("com.apple.storeservices.itfe"), (CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B230]);
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = v2;
  v4 = -[__CFArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        CFPreferencesSetAppValue(*(CFStringRef *)(*((_QWORD *)&v8 + 1) + 8 * v7++), 0, CFSTR("com.apple.storeservices.itfe"));
      }
      while (v5 != v7);
      v5 = -[__CFArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

  CFPreferencesAppSynchronize(CFSTR("com.apple.storeservices.itfe"));
}

+ (void)verifyOrphans
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;

  objc_msgSend(a1, "fetchCustomFeatures");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_mutableITFEs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_remoteGroupITFEs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_flagGroupITFEs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __35__AMSFeatureFlagITFE_verifyOrphans__block_invoke;
  v12[3] = &unk_1E2541DD0;
  v13 = v5;
  v14 = v6;
  v15 = v3;
  v7 = v3;
  v8 = v6;
  v9 = v5;
  objc_msgSend(v4, "ams_filterUsingTest:", v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "valueForKeyPath:", CFSTR("value"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "removeOrphanITFEValues:", v11);
}

uint64_t __35__AMSFeatureFlagITFE_verifyOrphans__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:", v3) & 1) != 0
    || (objc_msgSend(*(id *)(a1 + 40), "containsObject:", v3) & 1) != 0)
  {
    v4 = 0;
  }
  else
  {
    v5 = *(void **)(a1 + 48);
    objc_msgSend(v3, "value");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "containsObject:", v6) ^ 1;

  }
  return v4;
}

+ (void)removeOrphanITFEValues:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[4];
  uint64_t v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  uint64_t v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    objc_msgSend(a1, "fetchMutableFeatures");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "ams_dictionaryRemovingKeys:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = v6;
    CFPreferencesSetAppValue(CFSTR("features"), v6, CFSTR("com.apple.storeservices.itfe"));
    CFPreferencesAppSynchronize(CFSTR("com.apple.storeservices.itfe"));
    AMSSetLogKeyIfNeeded();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v8 = v4;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v28, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v19 != v11)
            objc_enumerationMutation(v8);
          v13 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
          +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig", v17);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v14)
          {
            +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
          }
          objc_msgSend(v14, "OSLogObject");
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            v16 = objc_opt_class();
            *(_DWORD *)buf = 138543874;
            v23 = v16;
            v24 = 2114;
            v25 = v7;
            v26 = 2114;
            v27 = v13;
            _os_log_impl(&dword_18C849000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] ITFE orphan removed: %{public}@", buf, 0x20u);
          }

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v28, 16);
      }
      while (v10);
    }

  }
}

+ (id)_flagGroupITFEs
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  +[AMSFeatureFlagGroup allFlagGroups](AMSFeatureFlagGroup, "allFlagGroups");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "ams_mapWithTransform:", &__block_literal_global_39);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "valueForKeyPath:", CFSTR("@unionOfArrays.self"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __37__AMSFeatureFlagITFE__flagGroupITFEs__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a2, "flags");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ams_mapWithTransform:", &__block_literal_global_41_0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueForKeyPath:", CFSTR("@unionOfArrays.self"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t __37__AMSFeatureFlagITFE__flagGroupITFEs__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "itfes");
}

+ (id)_remoteGroupITFEs
{
  void *v2;
  void *v3;
  void *v4;

  +[AMSFeatureFlagTask cachedRemoteGroups](AMSFeatureFlagTask, "cachedRemoteGroups");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ams_mapWithTransform:", &__block_literal_global_45);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueForKeyPath:", CFSTR("@unionOfArrays.self"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __39__AMSFeatureFlagITFE__remoteGroupITFEs__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a2, "flags");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ams_mapWithTransform:", &__block_literal_global_46_0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueForKeyPath:", CFSTR("@unionOfArrays.self"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t __39__AMSFeatureFlagITFE__remoteGroupITFEs__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "itfes");
}

+ (id)_mutableITFEs
{
  void *v2;
  void *v3;

  +[AMSFeatureFlagITFE fetchMutableFeatures](AMSFeatureFlagITFE, "fetchMutableFeatures");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ams_arrayUsingTransform:", &__block_literal_global_49);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

AMSFeatureFlagITFE *__35__AMSFeatureFlagITFE__mutableITFEs__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  AMSFeatureFlagITFE *v6;
  uint64_t v7;
  AMSFeatureFlagITFE *v8;

  v4 = a3;
  v5 = a2;
  v6 = [AMSFeatureFlagITFE alloc];
  v7 = objc_msgSend(v4, "BOOLValue");

  v8 = -[AMSFeatureFlagITFE initWithValue:isEnabled:isMutable:](v6, "initWithValue:isEnabled:isMutable:", v5, v7, 0);
  return v8;
}

+ (id)_profileITFEs
{
  void *v2;
  void *v3;

  +[AMSFeatureFlagITFE fetchProfileFeatures](AMSFeatureFlagITFE, "fetchProfileFeatures");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ams_arrayUsingTransform:", &__block_literal_global_50_0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

AMSFeatureFlagITFE *__35__AMSFeatureFlagITFE__profileITFEs__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  AMSFeatureFlagITFE *v6;
  uint64_t v7;
  AMSFeatureFlagITFE *v8;

  v4 = a3;
  v5 = a2;
  v6 = [AMSFeatureFlagITFE alloc];
  v7 = objc_msgSend(v4, "BOOLValue");

  v8 = -[AMSFeatureFlagITFE initWithValue:isEnabled:isMutable:](v6, "initWithValue:isEnabled:isMutable:", v5, v7, 0);
  return v8;
}

+ (id)_customITFEs
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;
  id v12;

  objc_msgSend(a1, "_mutableITFEs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_remoteGroupITFEs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_flagGroupITFEs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __34__AMSFeatureFlagITFE__customITFEs__block_invoke;
  v10[3] = &unk_1E2541E38;
  v11 = v4;
  v12 = v5;
  v6 = v5;
  v7 = v4;
  objc_msgSend(v3, "ams_filterUsingTest:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

uint64_t __34__AMSFeatureFlagITFE__customITFEs__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;

  v3 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:", v3) & 1) != 0)
    v4 = 0;
  else
    v4 = objc_msgSend(*(id *)(a1 + 40), "containsObject:", v3) ^ 1;

  return v4;
}

+ (id)_concreteITFEs
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a1, "_mutableITFEs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_remoteGroupITFEs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_flagGroupITFEs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObjectsFromArray:", v3);
  objc_msgSend(v6, "addObjectsFromArray:", v4);
  objc_msgSend(v6, "addObjectsFromArray:", v5);

  return v6;
}

+ (BOOL)_isITFEValueCustom:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  BOOL v12;
  BOOL v13;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;

  v4 = a3;
  objc_msgSend(a1, "_concreteITFEs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __41__AMSFeatureFlagITFE__isITFEValueCustom___block_invoke;
  v17[3] = &unk_1E2541E60;
  v7 = v4;
  v18 = v7;
  objc_msgSend(v5, "ams_firstObjectPassingTest:", v17);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "_customITFEs");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v6;
  v15[1] = 3221225472;
  v15[2] = __41__AMSFeatureFlagITFE__isITFEValueCustom___block_invoke_2;
  v15[3] = &unk_1E2541E60;
  v16 = v7;
  v10 = v7;
  objc_msgSend(v9, "ams_firstObjectPassingTest:", v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    v12 = v11 == 0;
  else
    v12 = 0;
  v13 = !v12;

  return v13;
}

uint64_t __41__AMSFeatureFlagITFE__isITFEValueCustom___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

uint64_t __41__AMSFeatureFlagITFE__isITFEValueCustom___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[AMSFeatureFlagITFE value](self, "value");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  AMSFeatureFlagITFE *v4;
  void *v5;
  void *v6;
  char v7;

  v4 = (AMSFeatureFlagITFE *)a3;
  if (self == v4)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[AMSFeatureFlagITFE value](self, "value");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[AMSFeatureFlagITFE value](v4, "value");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v5, "isEqualToString:", v6);

    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (NSString)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (BOOL)isReadonly
{
  return self->_readonly;
}

- (void)setReadonly:(BOOL)a3
{
  self->_readonly = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
}

@end
