@implementation AMSFeatureFlag

- (AMSFeatureFlag)initWithFlagData:(id)a3 mutableFeatures:(id)a4 profileFeatures:(id)a5 feature:(id)a6 domain:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  AMSFeatureFlag *v17;
  AMSFeatureFlag *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v28;
  id v29;
  id v30;
  objc_super v31;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v31.receiver = self;
  v31.super_class = (Class)AMSFeatureFlag;
  v17 = -[AMSFeatureFlag init](&v31, sel_init);
  v18 = v17;
  if (v17)
  {
    -[AMSFeatureFlag setFeature:](v17, "setFeature:", v15);
    -[AMSFeatureFlag setDomain:](v18, "setDomain:", v16);
    -[AMSFeatureFlag setFlagData:](v18, "setFlagData:", v12);
    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("Hidden"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[AMSFeatureFlag setHidden:](v18, "setHidden:", objc_msgSend(v19, "BOOLValue"));
    v28 = v19;
    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("AMPITFE"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v30 = v13;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[AMSFeatureFlag itfesFromString:mutableFeatures:profileFeatures:](v18, "itfesFromString:mutableFeatures:profileFeatures:", v20, v13, v14);
    else
      objc_msgSend(MEMORY[0x1E0C99D20], "array");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v14;
    -[AMSFeatureFlag setItfes:](v18, "setItfes:", v21);

    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("AMPAssociatedGroup"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[AMSFeatureFlag setAssociatedGroup:](v18, "setAssociatedGroup:", v22);
    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("DisplayName"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[AMSFeatureFlag setDisplayName:](v18, "setDisplayName:", v23);
    v24 = v15;
    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("Description"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[AMSFeatureFlag setFeatureDescription:](v18, "setFeatureDescription:", v25);
    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("AMPFlagGroup"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[AMSFeatureFlag setFlagGroup:](v18, "setFlagGroup:", v26);
    -[AMSFeatureFlag _updateInternalEnabledState](v18, "_updateInternalEnabledState");
    -[AMSFeatureFlag _updateDevelopmentPhase](v18, "_updateDevelopmentPhase");

    v14 = v29;
    v13 = v30;
    v15 = v24;
  }

  return v18;
}

- (BOOL)isRemote
{
  return 0;
}

+ (id)flagForFeature:(id)a3 domain:(id)a4
{
  return (id)objc_msgSend(a1, "flagForFeature:domain:searchDirectory:", a3, a4, 0);
}

+ (id)flagForFeature:(id)a3 domain:(id)a4 searchDirectory:(id)a5
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  void *v21;
  char v22;
  id v23;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  +[AMSFeatureFlagGroup allFlagGroupsIncludingHidden:searchDirectory:](AMSFeatureFlagGroup, "allFlagGroupsIncludingHidden:searchDirectory:", 1, a5);
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
  if (v26)
  {
    v10 = *(_QWORD *)v34;
    v28 = v9;
    v25 = *(_QWORD *)v34;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v34 != v10)
          objc_enumerationMutation(v9);
        v27 = v11;
        objc_msgSend(v9, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * v11), v25);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "flags");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        v31 = 0u;
        v32 = 0u;
        v29 = 0u;
        v30 = 0u;
        v14 = v13;
        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
        if (v15)
        {
          v16 = v15;
          v17 = *(_QWORD *)v30;
          do
          {
            for (i = 0; i != v16; ++i)
            {
              if (*(_QWORD *)v30 != v17)
                objc_enumerationMutation(v14);
              v19 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
              objc_msgSend(v19, "feature");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              if ((objc_msgSend(v20, "isEqualToString:", v7) & 1) != 0)
              {
                objc_msgSend(v19, "domain");
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                v22 = objc_msgSend(v21, "isEqualToString:", v8);

                if ((v22 & 1) != 0)
                {
                  v23 = v19;

                  v9 = v28;
                  goto LABEL_21;
                }
              }
              else
              {

              }
            }
            v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
          }
          while (v16);
        }

        v11 = v27 + 1;
        v9 = v28;
        v10 = v25;
      }
      while (v27 + 1 != v26);
      v23 = 0;
      v26 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
    }
    while (v26);
  }
  else
  {
    v23 = 0;
  }
LABEL_21:

  return v23;
}

+ (BOOL)enableFlagForFeature:(id)a3 domain:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  BOOL v17;
  BOOL v18;

  v8 = a3;
  v9 = a4;
  objc_msgSend(a1, "flagForFeature:domain:", v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v10;
  if (a5)
    v17 = v10 == 0;
  else
    v17 = 0;
  v18 = !v17;
  if (v17)
  {
    AMSErrorWithFormat(7, CFSTR("Feature Flag Doesn't Exist"), CFSTR("Feature: %@, Domain: %@"), v11, v12, v13, v14, v15, (uint64_t)v8);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v10, "setUserEnabled:", 1);
  }

  return v18;
}

+ (BOOL)disableFlagForFeature:(id)a3 domain:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  BOOL v17;
  BOOL v18;

  v8 = a3;
  v9 = a4;
  objc_msgSend(a1, "flagForFeature:domain:", v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v10;
  if (a5)
    v17 = v10 == 0;
  else
    v17 = 0;
  v18 = !v17;
  if (v17)
  {
    AMSErrorWithFormat(7, CFSTR("Feature Flag Doesn't Exist"), CFSTR("Feature: %@, Domain: %@"), v11, v12, v13, v14, v15, (uint64_t)v8);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v10, "setUserEnabled:", 0);
  }

  return v18;
}

- (void)setUserEnabled:(BOOL)a3
{
  _BOOL8 v3;
  AMSFeatureFlag *obj;

  v3 = a3;
  obj = self;
  objc_sync_enter(obj);
  -[AMSFeatureFlag _updateUserEnabled:](obj, "_updateUserEnabled:", v3);
  -[AMSFeatureFlag _activateFlag](obj, "_activateFlag");
  -[AMSFeatureFlag _updateInternalEnabledState](obj, "_updateInternalEnabledState");
  -[AMSFeatureFlag activateITFEs](obj, "activateITFEs");
  objc_sync_exit(obj);

}

- (void)_activateFlag
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  const char *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  const char *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  NSObject *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  uint64_t v32;
  id v33;
  uint8_t buf[4];
  uint64_t v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  id v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  AMSSetLogKeyIfNeeded();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D20F38], "shared");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSFeatureFlag feature](self, "feature");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSFeatureFlag domain](self, "domain");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ams_safeStateForFeature:domain:level:", v5, v6, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (self->_userEnabled)
  {
    if (v7 && objc_msgSend(v7, "value") == 1)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v8 = (id)objc_claimAutoreleasedReturnValue();
      if (!v8)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v8 = (id)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v8, "OSLogObject");
      v9 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        goto LABEL_30;
      v10 = objc_opt_class();
      -[AMSFeatureFlag domain](self, "domain");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[AMSFeatureFlag feature](self, "feature");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v35 = v10;
      v36 = 2114;
      v37 = v3;
      v38 = 2114;
      v39 = v11;
      v40 = 2114;
      v41 = v12;
      v13 = "%{public}@: [%{public}@] Skipping Feature Flag Enable Toggle as it is already enabled: %{public}@/%{public}@";
LABEL_29:
      _os_log_impl(&dword_18C849000, v9, OS_LOG_TYPE_DEFAULT, v13, buf, 0x2Au);

LABEL_30:
      goto LABEL_31;
    }
    objc_msgSend(MEMORY[0x1E0D20F38], "shared");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSFeatureFlag feature](self, "feature");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSFeatureFlag domain](self, "domain");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "enableFeature:domain:level:", v15, v16, 3);

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
      -[AMSFeatureFlag domain](self, "domain");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[AMSFeatureFlag feature](self, "feature");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v35 = v19;
      v36 = 2114;
      v37 = v3;
      v38 = 2114;
      v39 = v20;
      v40 = 2114;
      v41 = v21;
      v22 = "%{public}@: [%{public}@] Feature Flag Enabled: %{public}@/%{public}@";
LABEL_18:
      _os_log_impl(&dword_18C849000, v18, OS_LOG_TYPE_DEFAULT, v22, buf, 0x2Au);

    }
  }
  else
  {
    if (v7 && !objc_msgSend(v7, "value"))
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v8 = (id)objc_claimAutoreleasedReturnValue();
      if (!v8)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v8 = (id)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v8, "OSLogObject");
      v9 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        goto LABEL_30;
      v32 = objc_opt_class();
      -[AMSFeatureFlag domain](self, "domain");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[AMSFeatureFlag feature](self, "feature");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v35 = v32;
      v36 = 2114;
      v37 = v3;
      v38 = 2114;
      v39 = v11;
      v40 = 2114;
      v41 = v12;
      v13 = "%{public}@: [%{public}@] Skipping Feature Flag Disable Toggle as it is already disabled: %{public}@/%{public}@";
      goto LABEL_29;
    }
    objc_msgSend(MEMORY[0x1E0D20F38], "shared");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSFeatureFlag feature](self, "feature");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSFeatureFlag domain](self, "domain");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "disableFeature:domain:level:", v24, v25, 3);

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
      v26 = objc_opt_class();
      -[AMSFeatureFlag domain](self, "domain");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[AMSFeatureFlag feature](self, "feature");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v35 = v26;
      v36 = 2114;
      v37 = v3;
      v38 = 2114;
      v39 = v20;
      v40 = 2114;
      v41 = v21;
      v22 = "%{public}@: [%{public}@] Feature Flag Disabled: %{public}@/%{public}@";
      goto LABEL_18;
    }
  }

  objc_msgSend(MEMORY[0x1E0D20F38], "shared");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = 0;
  objc_msgSend(v27, "commitUpdates:", &v33);
  v8 = v33;

  if (v8)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v9 = objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v9 = objc_claimAutoreleasedReturnValue();
    }
    -[NSObject OSLogObject](v9, "OSLogObject");
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      v29 = objc_opt_class();
      -[AMSFeatureFlag domain](self, "domain");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[AMSFeatureFlag feature](self, "feature");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544386;
      v35 = v29;
      v36 = 2114;
      v37 = v3;
      v38 = 2114;
      v39 = v30;
      v40 = 2114;
      v41 = v31;
      v42 = 2114;
      v43 = v8;
      _os_log_impl(&dword_18C849000, v28, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Feature Flag error occurred for flag: %{public}@/%{public}@ %{public}@", buf, 0x34u);

    }
    goto LABEL_30;
  }
LABEL_31:

}

- (void)_updateInternalEnabledState
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  objc_msgSend(MEMORY[0x1E0D20F38], "shared");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSFeatureFlag feature](self, "feature");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSFeatureFlag domain](self, "domain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ams_safeStateForFeature:domain:", v4, v5);
  v14 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D20F38], "shared");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSFeatureFlag feature](self, "feature");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSFeatureFlag domain](self, "domain");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "ams_safeStateForFeature:domain:level:", v7, v8, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D20F38], "shared");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSFeatureFlag feature](self, "feature");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSFeatureFlag domain](self, "domain");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "ams_safeStateForFeature:domain:level:", v11, v12, 3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[AMSFeatureFlag setEnabled:](self, "setEnabled:", objc_msgSend(v14, "value") == 1);
  -[AMSFeatureFlag setDefaultEnabled:](self, "setDefaultEnabled:", objc_msgSend(v9, "value") == 1);
  -[AMSFeatureFlag _updateUserEnabled:](self, "_updateUserEnabled:", objc_msgSend(v13, "value") == 1);

}

- (void)_updateDevelopmentPhase
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int64_t v12;
  id v13;

  v13 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D20F40]), "initWithName:value:", CFSTR("UnderDevelopment"), CFSTR("true"));
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D20F40]), "initWithName:value:", CFSTR("CodeComplete"), CFSTR("true"));
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D20F40]), "initWithName:value:", CFSTR("PreviewReady"), CFSTR("true"));
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D20F40]), "initWithName:value:", CFSTR("FeatureComplete"), CFSTR("true"));
  objc_msgSend(MEMORY[0x1E0D20F38], "shared");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSFeatureFlag feature](self, "feature");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSFeatureFlag domain](self, "domain");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "ams_safeStateForFeature:domain:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "attributes");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("DevelopmentPhase"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v11, "matchesAgainst:", v13) & 1) != 0)
  {
    v12 = 1;
  }
  else if ((objc_msgSend(v11, "matchesAgainst:", v3) & 1) != 0)
  {
    v12 = 2;
  }
  else if ((objc_msgSend(v11, "matchesAgainst:", v4) & 1) != 0)
  {
    v12 = 3;
  }
  else if ((objc_msgSend(v11, "matchesAgainst:", v5) & 1) != 0)
  {
    v12 = 4;
  }
  else
  {
    v12 = -[AMSFeatureFlag _developmentPhaseFromGroupType:](self, "_developmentPhaseFromGroupType:", -[AMSFeatureFlag groupType](self, "groupType"));
  }
  -[AMSFeatureFlag setDevelopmentPhase:](self, "setDevelopmentPhase:", v12);

}

- (int64_t)_developmentPhaseFromGroupType:(int64_t)a3
{
  if ((unint64_t)a3 > 2)
    return 0;
  else
    return qword_18CF5CA50[a3];
}

- (void)_updateUserEnabled:(BOOL)a3
{
  self->_userEnabled = a3;
}

- (int64_t)groupType
{
  _BOOL4 v3;

  v3 = -[AMSFeatureFlag isTestable](self, "isTestable");
  if (-[AMSFeatureFlag isDefaultEnabled](self, "isDefaultEnabled"))
    return 2;
  else
    return !v3;
}

- (void)activateITFEs
{
  if (-[AMSFeatureFlag hasITFEs](self, "hasITFEs"))
  {
    if (-[AMSFeatureFlag isEnabled](self, "isEnabled"))
      -[AMSFeatureFlag _enableITFEs](self, "_enableITFEs");
    else
      -[AMSFeatureFlag _disableITFEs](self, "_disableITFEs");
  }
}

- (BOOL)hasITFEs
{
  void *v2;
  BOOL v3;

  -[AMSFeatureFlag itfes](self, "itfes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (BOOL)hasITFEWithName:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  char v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[AMSFeatureFlag itfes](self, "itfes", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "value");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "isEqualToString:", v4);

        if ((v10 & 1) != 0)
        {
          LOBYTE(v6) = 1;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void)_enableITFEs
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  -[AMSFeatureFlag itfes](self, "itfes", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "toggle:", 1);
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (void)_disableITFEs
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  -[AMSFeatureFlag itfes](self, "itfes", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "toggle:", 0);
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (id)itfesFromString:(id)a3 mutableFeatures:(id)a4 profileFeatures:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _UNKNOWN **v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  _UNKNOWN **v22;
  void *v23;
  void *v24;
  id v26;
  id v27;
  id obj;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v27 = a4;
  v7 = a5;
  objc_msgSend(a3, "componentsSeparatedByString:", CFSTR(","));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v8, "count"));
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  obj = v8;
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v30;
    v13 = &off_1E2519000;
    v26 = v7;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v30 != v12)
          objc_enumerationMutation(obj);
        v15 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * i);
        objc_msgSend(v7, "objectForKey:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v7, "objectForKeyedSubscript:", v15);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v17, "BOOLValue") & 1) != 0)
        {
          v18 = 1;
        }
        else
        {
          objc_msgSend(v27, "objectForKeyedSubscript:", v15);
          v19 = v11;
          v20 = v12;
          v21 = v9;
          v22 = v13;
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v23, "BOOLValue");

          v13 = v22;
          v9 = v21;
          v12 = v20;
          v11 = v19;
          v7 = v26;
        }

        v24 = (void *)objc_msgSend(objc_alloc((Class)v13[253]), "initWithValue:isEnabled:isMutable:", v15, v18, v16 == 0);
        objc_msgSend(v9, "addObject:", v24);

      }
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    }
    while (v11);
  }

  return v9;
}

- (NSString)associatedGroup
{
  return self->_associatedGroup;
}

- (void)setAssociatedGroup:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (BOOL)isDefaultEnabled
{
  return self->_defaultEnabled;
}

- (void)setDefaultEnabled:(BOOL)a3
{
  self->_defaultEnabled = a3;
}

- (int64_t)developmentPhase
{
  return self->_developmentPhase;
}

- (void)setDevelopmentPhase:(int64_t)a3
{
  self->_developmentPhase = a3;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (NSString)feature
{
  return self->_feature;
}

- (void)setFeature:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSDictionary)flagData
{
  return self->_flagData;
}

- (void)setFlagData:(id)a3
{
  objc_storeStrong((id *)&self->_flagData, a3);
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)domain
{
  return self->_domain;
}

- (void)setDomain:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)featureDescription
{
  return self->_featureDescription;
}

- (void)setFeatureDescription:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)flagGroup
{
  return self->_flagGroup;
}

- (void)setFlagGroup:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSArray)itfes
{
  return self->_itfes;
}

- (void)setItfes:(id)a3
{
  objc_storeStrong((id *)&self->_itfes, a3);
}

- (BOOL)isUserEnabled
{
  return self->_userEnabled;
}

- (BOOL)isHidden
{
  return self->_hidden;
}

- (void)setHidden:(BOOL)a3
{
  self->_hidden = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itfes, 0);
  objc_storeStrong((id *)&self->_flagGroup, 0);
  objc_storeStrong((id *)&self->_featureDescription, 0);
  objc_storeStrong((id *)&self->_domain, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_flagData, 0);
  objc_storeStrong((id *)&self->_feature, 0);
  objc_storeStrong((id *)&self->_associatedGroup, 0);
}

- (NSString)ITFE
{
  void *v2;
  void *v3;
  void *v4;

  -[AMSFeatureFlag itfes](self, "itfes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ams_mapWithTransform:", &__block_literal_global_54);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR(","));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

uint64_t __53__AMSFeatureFlag_AppleMediaServices_Deprecated__ITFE__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "value");
}

- (void)setITFE:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  +[AMSFeatureFlagITFE fetchMutableFeatures](AMSFeatureFlagITFE, "fetchMutableFeatures");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  +[AMSFeatureFlagITFE fetchProfileFeatures](AMSFeatureFlagITFE, "fetchProfileFeatures");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSFeatureFlag itfesFromString:mutableFeatures:profileFeatures:](self, "itfesFromString:mutableFeatures:profileFeatures:", v4, v7, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[AMSFeatureFlag setItfes:](self, "setItfes:", v6);
}

+ (id)allFlagGroups
{
  void *v2;
  void *v3;

  +[AMSFeatureFlagGroup allFlagGroups](AMSFeatureFlagGroup, "allFlagGroups");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ams_mapWithTransform:", &__block_literal_global_144);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

AMSPair *__62__AMSFeatureFlag_AppleMediaServices_Deprecated__allFlagGroups__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  AMSPair *v6;
  void *v7;
  AMSPair *v8;

  v4 = a3;
  v5 = a2;
  v6 = [AMSPair alloc];
  objc_msgSend(v4, "flags");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[AMSPair initWithFirst:second:](v6, "initWithFirst:second:", v5, v7);
  return v8;
}

+ (id)flagGroupWithName:(id)a3
{
  void *v3;
  void *v4;

  +[AMSFeatureFlagGroup fetchFlagGroupWithName:](AMSFeatureFlagGroup, "fetchFlagGroupWithName:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "flags");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (BOOL)enableFlagGroup:(id)a3 error:(id *)a4
{
  return +[AMSFeatureFlagGroup enableFlagGroupWithName:error:](AMSFeatureFlagGroup, "enableFlagGroupWithName:error:", a3, a4);
}

+ (BOOL)disableFlagGroup:(id)a3 error:(id *)a4
{
  return +[AMSFeatureFlagGroup disableFlagGroupWithName:error:](AMSFeatureFlagGroup, "disableFlagGroupWithName:error:", a3, a4);
}

- (BOOL)isCodeComplete
{
  return -[AMSFeatureFlag developmentPhase](self, "developmentPhase") == 2;
}

- (BOOL)isTestable
{
  void *v3;
  void *v4;
  BOOL v5;

  -[AMSFeatureFlag flagData](self, "flagData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("AMPTestable"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0
    && ((objc_msgSend(v4, "BOOLValue") & 1) != 0 || -[AMSFeatureFlag developmentPhase](self, "developmentPhase") == 2);

  return v5;
}

@end
