@implementation AMSFeatureFlagGroup

- (AMSFeatureFlagGroup)initWithName:(id)a3
{
  id v4;
  AMSFeatureFlagGroup *v5;
  AMSFeatureFlagGroup *v6;
  id v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AMSFeatureFlagGroup;
  v5 = -[AMSFeatureFlagGroup init](&v9, sel_init);
  v6 = v5;
  if (v5)
  {
    -[AMSFeatureFlagGroup setName:](v5, "setName:", v4);
    v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    -[AMSFeatureFlagGroup setMutableFlags:](v6, "setMutableFlags:", v7);

  }
  return v6;
}

- (void)appendFlag:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[AMSFeatureFlagGroup mutableFlags](self, "mutableFlags");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v4);

}

- (void)reset
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0C99E60];
  -[AMSFeatureFlagGroup flags](self, "flags");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "valueForKey:", CFSTR("domain"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v25;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v25 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v11);
        objc_msgSend(MEMORY[0x1E0D20F38], "shared");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "resetDomain:error:", v12, 0);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    }
    while (v9);
  }

  objc_msgSend(MEMORY[0x1E0D20F38], "shared");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "commitUpdates:", 0);

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  -[AMSFeatureFlagGroup flags](self, "flags", 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v21;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v21 != v18)
          objc_enumerationMutation(v15);
        objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * v19++), "_updateInternalEnabledState");
      }
      while (v17 != v19);
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
    }
    while (v17);
  }

}

- (id)fetchAllGroupKeys
{
  void *v2;
  uint64_t v3;

  CFPreferencesAppSynchronize(CFSTR("com.apple.storeservices.itfe"));
  v2 = (void *)CFPreferencesCopyAppValue(CFSTR("groupsEnabled"), CFSTR("com.apple.storeservices.itfe"));
  if (!v2 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v3 = objc_opt_new();

    v2 = (void *)v3;
  }
  return v2;
}

- (void)activateITFEs
{
  id v2;

  -[AMSFeatureFlagGroup flags](self, "flags");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "makeObjectsPerformSelector:", sel_activateITFEs);

}

+ (id)allFlagGroups
{
  return (id)objc_msgSend(a1, "allFlagGroupsIncludingHidden:", 0);
}

- (id)allITFEs
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[AMSFeatureFlagGroup flags](self, "flags", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8), "itfes");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObjectsFromArray:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  return v3;
}

+ (id)allFlagGroupsIncludingHidden:(BOOL)a3
{
  return (id)objc_msgSend(a1, "allFlagGroupsIncludingHidden:searchDirectory:", 0, CFSTR("/System/Library/FeatureFlags/Domain"));
}

+ (id)allFlagGroupsIncludingHidden:(BOOL)a3 searchDirectory:(id)a4
{
  __CFString *v4;
  __CFString *v5;
  __CFString *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  __CFString *v30;
  id obj;
  uint64_t v32;
  _BOOL4 v33;
  void *v34;
  void *v35;
  __CFString *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *context;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];
  _BYTE v51[128];
  uint64_t v52;

  v33 = a3;
  v52 = *MEMORY[0x1E0C80C00];
  v4 = (__CFString *)a4;
  v5 = CFSTR("/System/Library/FeatureFlags/Domain");
  v30 = v4;
  if (v4)
    v5 = v4;
  v6 = v5;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = v6;
  objc_msgSend(v7, "contentsOfDirectoryAtPath:error:", v6, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  +[AMSFeatureFlagITFE fetchMutableFeatures](AMSFeatureFlagITFE, "fetchMutableFeatures");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSFeatureFlagITFE fetchProfileFeatures](AMSFeatureFlagITFE, "fetchProfileFeatures");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  obj = v8;
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
  v38 = v10;
  if (v10)
  {
    v32 = *(_QWORD *)v47;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v47 != v32)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * v11);
        context = (void *)MEMORY[0x18D78A1C4](v10);
        objc_msgSend(v12, "stringByDeletingPathExtension", v30);
        v13 = objc_claimAutoreleasedReturnValue();
        v14 = (void *)MEMORY[0x1E0C99D80];
        -[__CFString stringByAppendingPathComponent:](v37, "stringByAppendingPathComponent:", v12);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "dictionaryWithContentsOfFile:", v15);
        v16 = objc_claimAutoreleasedReturnValue();

        v39 = (void *)v16;
        v40 = (void *)v13;
        objc_msgSend(a1, "groupsFromDomainData:domain:mutableFeatures:profileFeatures:includesHidden:", v16, v13, v35, v34, v33);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = 0u;
        v43 = 0u;
        v44 = 0u;
        v45 = 0u;
        v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v42, v50, 16);
        if (v18)
        {
          v19 = v18;
          v20 = *(_QWORD *)v43;
          do
          {
            for (i = 0; i != v19; ++i)
            {
              if (*(_QWORD *)v43 != v20)
                objc_enumerationMutation(v17);
              v22 = *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * i);
              objc_msgSend(v17, "objectForKeyedSubscript:", v22);
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v9, "objectForKeyedSubscript:", v22);
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              v25 = v24;
              if (v24)
              {
                objc_msgSend(v24, "mutableFlags");
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v23, "mutableFlags");
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v26, "addObjectsFromArray:", v27);

              }
              else
              {
                objc_msgSend(v9, "setObject:forKeyedSubscript:", v23, v22);
              }

            }
            v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v42, v50, 16);
          }
          while (v19);
        }

        objc_autoreleasePoolPop(context);
        ++v11;
      }
      while (v11 != v38);
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
      v38 = v10;
    }
    while (v10);
  }

  objc_msgSend(a1, "_normalizedFlagGroupsFromFlagGroups:", v9);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  return v28;
}

+ (id)groupsFromDomainData:(id)a3 domain:(id)a4 mutableFeatures:(id)a5 profileFeatures:(id)a6 includesHidden:(BOOL)a7
{
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  const __CFString *v16;
  uint64_t i;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  unint64_t v23;
  const __CFString *v24;
  void *v25;
  void *v26;
  AMSFeatureFlagGroup *v27;
  AMSFeatureFlagGroup *v28;
  uint64_t v30;
  id v32;
  id v33;
  id v34;
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v34 = a4;
  v33 = a5;
  v32 = a6;
  v35 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v11 = v10;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v37;
    v15 = 0x1E0C99000uLL;
    v30 = *(_QWORD *)v37;
    v16 = CFSTR("AMPFlagGroup");
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v37 != v14)
          objc_enumerationMutation(v11);
        v18 = *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * i);
        objc_msgSend(v11, "objectForKeyedSubscript:", v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v19, "objectForKeyedSubscript:", v16);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v34, "isEqualToString:", CFSTR("AMPFlagRemote"));
            v21 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithFlagData:mutableFeatures:profileFeatures:feature:domain:", v19, v33, v32, v18, v34);
            v22 = v21;
            if (a7 || (objc_msgSend(v21, "isHidden") & 1) == 0)
            {
              v23 = v15;
              v24 = v16;
              objc_msgSend(v35, "objectForKeyedSubscript:", v20);
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              v26 = v25;
              if (v25)
                v27 = v25;
              else
                v27 = -[AMSFeatureFlagGroup initWithName:]([AMSFeatureFlagGroup alloc], "initWithName:", v20);
              v28 = v27;

              -[AMSFeatureFlagGroup appendFlag:](v28, "appendFlag:", v22);
              objc_msgSend(v35, "setObject:forKeyedSubscript:", v28, v20);

              v16 = v24;
              v15 = v23;
              v14 = v30;
            }

          }
        }

      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
    }
    while (v13);
  }

  return v35;
}

+ (id)groupsFromDomainData:(id)a3 domain:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = a4;
  v7 = a3;
  +[AMSFeatureFlagITFE fetchMutableFeatures](AMSFeatureFlagITFE, "fetchMutableFeatures");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSFeatureFlagITFE fetchProfileFeatures](AMSFeatureFlagITFE, "fetchProfileFeatures");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSFeatureFlagGroup groupsFromDomainData:domain:mutableFeatures:profileFeatures:includesHidden:](AMSFeatureFlagGroup, "groupsFromDomainData:domain:mutableFeatures:profileFeatures:includesHidden:", v7, v6, v8, v9, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "_normalizedFlagGroupsFromFlagGroups:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)fetchFlagGroupWithName:(id)a3
{
  return (id)objc_msgSend(a1, "flagGroupWithName:includingHidden:", a3, 0);
}

+ (id)flagGroupWithName:(id)a3 includingHidden:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;

  v4 = a4;
  v6 = a3;
  objc_msgSend(a1, "allFlagGroupsIncludingHidden:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)flagsForDevelopmentPhase:(int64_t)a3
{
  void *v4;
  void *v5;
  _QWORD v7[5];

  -[AMSFeatureFlagGroup flags](self, "flags");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __48__AMSFeatureFlagGroup_flagsForDevelopmentPhase___block_invoke;
  v7[3] = &__block_descriptor_40_e24_B16__0__AMSFeatureFlag_8l;
  v7[4] = a3;
  objc_msgSend(v4, "ams_filterUsingTest:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

BOOL __48__AMSFeatureFlagGroup_flagsForDevelopmentPhase___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "developmentPhase") == *(_QWORD *)(a1 + 32);
}

+ (BOOL)enableFlagGroupWithName:(id)a3 error:(id *)a4
{
  return objc_msgSend(a1, "setFlagGroupWithName:enabled:error:", a3, 1, a4);
}

+ (BOOL)disableFlagGroupWithName:(id)a3 error:(id *)a4
{
  return objc_msgSend(a1, "setFlagGroupWithName:enabled:error:", a3, 0, a4);
}

+ (BOOL)setFlagGroupWithName:(id)a3 enabled:(BOOL)a4 error:(id *)a5
{
  _BOOL8 v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v5 = a4;
  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "flagGroupWithName:includingHidden:", a3, 1, a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(v6, "flags", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v14;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v11++), "setUserEnabled:", v5);
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v9);
  }

  return 1;
}

+ (void)resetAllFlagGroups
{
  void *v2;
  id v3;

  objc_msgSend(a1, "allFlagGroups");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allValues");
  v3 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "makeObjectsPerformSelector:", sel_reset);
}

+ (id)_normalizedFlagGroupsFromFlagGroups:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  unint64_t v23;
  AMSFeatureFlagGroup *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t j;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  id v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _BYTE v53[128];
  _BYTE v54[128];
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v40 = (id)objc_msgSend(v3, "mutableCopy");
  v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v49, v55, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v50;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v50 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * i);
        objc_msgSend(v10, "stringByReplacingOccurrencesOfString:withString:", CFSTR(" "), &stru_1E2548760);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "objectForKeyedSubscript:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v12;
        if (v12)
          v14 = v12;
        else
          v14 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v15 = v14;

        objc_msgSend(v15, "addObject:", v10);
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v15, v11);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v49, v55, 16);
    }
    while (v7);
  }

  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  v16 = v4;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v45, v54, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v46;
    v35 = *(_QWORD *)v46;
    v36 = v16;
    do
    {
      v20 = 0;
      v37 = v18;
      do
      {
        if (*(_QWORD *)v46 != v19)
          objc_enumerationMutation(v16);
        v21 = *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * v20);
        objc_msgSend(v16, "objectForKeyedSubscript:", v21, v35, v36);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v22, "count");

        if (v23 >= 2)
        {
          v39 = v20;
          v24 = -[AMSFeatureFlagGroup initWithName:]([AMSFeatureFlagGroup alloc], "initWithName:", v21);
          v41 = 0u;
          v42 = 0u;
          v43 = 0u;
          v44 = 0u;
          v38 = v21;
          objc_msgSend(v16, "objectForKeyedSubscript:", v21);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v41, v53, 16);
          if (v26)
          {
            v27 = v26;
            v28 = *(_QWORD *)v42;
            do
            {
              for (j = 0; j != v27; ++j)
              {
                if (*(_QWORD *)v42 != v28)
                  objc_enumerationMutation(v25);
                v30 = *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * j);
                objc_msgSend(v5, "objectForKeyedSubscript:", v30);
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                -[AMSFeatureFlagGroup mutableFlags](v24, "mutableFlags");
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v31, "mutableFlags");
                v33 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v32, "addObjectsFromArray:", v33);

                objc_msgSend(v40, "removeObjectForKey:", v30);
              }
              v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v41, v53, 16);
            }
            while (v27);
          }

          objc_msgSend(v40, "setObject:forKeyedSubscript:", v24, v38);
          v19 = v35;
          v16 = v36;
          v18 = v37;
          v20 = v39;
        }
        ++v20;
      }
      while (v20 != v18);
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v45, v54, 16);
    }
    while (v18);
  }

  return v40;
}

- (id)activateFlagsIfNeededForDevelopmentPhase:(int64_t)a3
{
  void *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t v21[128];
  uint8_t buf[4];
  uint64_t v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  if (-[AMSFeatureFlagGroup isDevelopmentPhaseEnabled:](self, "isDevelopmentPhaseEnabled:"))
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v5, "OSLogObject");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = objc_opt_class();
      AMSSetLogKeyIfNeeded();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[AMSFeatureFlagGroup name](self, "name");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%ld"), a3);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v23 = v7;
      v24 = 2114;
      v25 = v8;
      v26 = 2114;
      v27 = v9;
      v28 = 2114;
      v29 = v10;
      _os_log_impl(&dword_18C849000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Feature Flag Group automatically toggling flags for %{public}@ of type: %{public}@", buf, 0x2Au);

    }
    -[AMSFeatureFlagGroup flagsForDevelopmentPhase:](self, "flagsForDevelopmentPhase:", a3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v18 != v14)
            objc_enumerationMutation(v11);
          objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * i), "setUserEnabled:", 1);
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v13);
    }
  }
  else
  {
    v11 = 0;
  }
  return v11;
}

- (void)setFlagsForDevelopmentPhase:(int64_t)a3 enabled:(BOOL)a4
{
  _BOOL8 v4;
  void *v7;
  void *v8;
  void *v9;
  void *value;

  v4 = a4;
  -[AMSFeatureFlagGroup fetchAllGroupKeys](self, "fetchAllGroupKeys");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  value = (void *)objc_msgSend(v7, "mutableCopy");

  -[AMSFeatureFlagGroup _groupKeyForDevelopmentPhase:](self, "_groupKeyForDevelopmentPhase:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(value, "setObject:forKeyedSubscript:", v9, v8);

  CFPreferencesSetAppValue(CFSTR("groupsEnabled"), value, CFSTR("com.apple.storeservices.itfe"));
  CFPreferencesAppSynchronize(CFSTR("com.apple.storeservices.itfe"));

}

- (BOOL)isDevelopmentPhaseEnabled:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[AMSFeatureFlagGroup fetchAllGroupKeys](self, "fetchAllGroupKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  -[AMSFeatureFlagGroup _groupKeyForDevelopmentPhase:](self, "_groupKeyForDevelopmentPhase:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v5) = objc_msgSend(v8, "BOOLValue");

  return (char)v5;
}

- (id)_groupKeyForDevelopmentPhase:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)MEMORY[0x1E0CB3940];
  -[AMSFeatureFlagGroup name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@-%ld"), v5, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSMutableArray)mutableFlags
{
  return self->_mutableFlags;
}

- (void)setMutableFlags:(id)a3
{
  objc_storeStrong((id *)&self->_mutableFlags, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mutableFlags, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

- (void)setGroupType:(int64_t)a3 enabled:(BOOL)a4
{
  _BOOL8 v4;
  void *v7;
  void *v8;
  void *v9;
  void *value;

  v4 = a4;
  -[AMSFeatureFlagGroup fetchAllGroupKeys](self, "fetchAllGroupKeys");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  value = (void *)objc_msgSend(v7, "mutableCopy");

  -[AMSFeatureFlagGroup _groupKeyForType:](self, "_groupKeyForType:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(value, "setObject:forKeyedSubscript:", v9, v8);

  CFPreferencesSetAppValue(CFSTR("groupsEnabled"), value, CFSTR("com.apple.storeservices.itfe"));
  CFPreferencesAppSynchronize(CFSTR("com.apple.storeservices.itfe"));

}

- (BOOL)isGroupTypeEnabled:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[AMSFeatureFlagGroup fetchAllGroupKeys](self, "fetchAllGroupKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  -[AMSFeatureFlagGroup _groupKeyForType:](self, "_groupKeyForType:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v5) = objc_msgSend(v8, "BOOLValue");

  return (char)v5;
}

- (id)_groupKeyForType:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)MEMORY[0x1E0CB3940];
  -[AMSFeatureFlagGroup name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@-%ld"), v5, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)activateFlagsIfNeededForType:(int64_t)a3
{
  void *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t v21[128];
  uint8_t buf[4];
  uint64_t v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  if (-[AMSFeatureFlagGroup isGroupTypeEnabled:](self, "isGroupTypeEnabled:"))
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v5, "OSLogObject");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = objc_opt_class();
      AMSSetLogKeyIfNeeded();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[AMSFeatureFlagGroup name](self, "name");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%ld"), a3);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v23 = v7;
      v24 = 2114;
      v25 = v8;
      v26 = 2114;
      v27 = v9;
      v28 = 2114;
      v29 = v10;
      _os_log_impl(&dword_18C849000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Feature Flag Group automatically toggling flags for %{public}@ of type: %{public}@", buf, 0x2Au);

    }
    -[AMSFeatureFlagGroup flagsForType:](self, "flagsForType:", a3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v18 != v14)
            objc_enumerationMutation(v11);
          objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * i), "setUserEnabled:", 1);
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v13);
    }
  }
  else
  {
    v11 = 0;
  }
  return v11;
}

- (id)flagsForType:(int64_t)a3
{
  void *v3;

  if (a3 == 2)
  {
    -[AMSFeatureFlagGroup _completedFlags](self, "_completedFlags");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (a3 == 1)
  {
    -[AMSFeatureFlagGroup _developmentFlags](self, "_developmentFlags");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (a3)
  {
    v3 = 0;
  }
  else
  {
    -[AMSFeatureFlagGroup _testableFlags](self, "_testableFlags");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (id)_testableFlags
{
  void *v2;
  void *v3;

  -[AMSFeatureFlagGroup flags](self, "flags");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ams_filterUsingTest:", &__block_literal_global_55);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

BOOL __68__AMSFeatureFlagGroup_AppleMediaServices_Deprecated___testableFlags__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "groupType") == 0;
}

- (id)_developmentFlags
{
  void *v2;
  void *v3;

  -[AMSFeatureFlagGroup flags](self, "flags");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ams_filterUsingTest:", &__block_literal_global_101_0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

BOOL __71__AMSFeatureFlagGroup_AppleMediaServices_Deprecated___developmentFlags__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "groupType") == 1;
}

- (id)_completedFlags
{
  void *v2;
  void *v3;

  -[AMSFeatureFlagGroup flags](self, "flags");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ams_filterUsingTest:", &__block_literal_global_102);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

BOOL __69__AMSFeatureFlagGroup_AppleMediaServices_Deprecated___completedFlags__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "groupType") == 2;
}

@end
