@implementation HKiPadHealthSyncEnablement

+ (id)_syncEnablementKeyValueDomain:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;

  v3 = (objc_class *)MEMORY[0x1E0CB67F0];
  v4 = a3;
  v5 = [v3 alloc];
  v6 = (void *)objc_msgSend(v5, "initWithCategory:domainName:healthStore:", 3, *MEMORY[0x1E0CB7678], v4);

  return v6;
}

+ (BOOL)isSyncPromptedForHealthKit:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  BOOL v8;
  void *v9;
  id v10;
  void *v11;
  int v12;
  os_log_t *v13;
  NSObject *v14;
  NSObject *v15;
  const __CFString *v16;
  id v18;
  id v19;
  uint8_t buf[4];
  id v21;
  __int16 v22;
  const __CFString *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C8F2B8]);
  objc_msgSend(v5, "aa_primaryAppleAccount");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "aa_isManagedAppleID"))
  {
    v19 = 0;
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", &v19, 701, CFSTR("Managed Apple IDs are not permitted to participate in HealthKit cloud sync."));
    v7 = v19;
    v8 = 0;
  }
  else
  {
    objc_msgSend(a1, "_syncEnablementKeyValueDomain:", v4);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    v18 = (id)*MEMORY[0x1E0CB7670];
    objc_msgSend(v7, "dateForKey:error:");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 0;
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "hk_hasCompletedThirdPartyAuthSyncWithBooleanValue");

    v13 = (os_log_t *)MEMORY[0x1E0CB5370];
    if (v10)
    {
      _HKInitializeLogging();
      v14 = *v13;
      if (os_log_type_enabled(*v13, OS_LOG_TYPE_ERROR))
        +[HKiPadHealthSyncEnablement isSyncPromptedForHealthKit:].cold.1((uint64_t)a1, (uint64_t)v10, v14);
    }
    _HKInitializeLogging();
    v15 = *v13;
    if (os_log_type_enabled(*v13, OS_LOG_TYPE_INFO))
    {
      v16 = CFSTR("was not");
      if (v12)
        v16 = CFSTR("was");
      *(_DWORD *)buf = 138543618;
      v21 = a1;
      v22 = 2114;
      v23 = v16;
      _os_log_impl(&dword_1D7813000, v15, OS_LOG_TYPE_INFO, "%{public}@: HealthKit sync %{public}@ enabled on iPad", buf, 0x16u);
    }
    if (v9)
      v8 = 1;
    else
      v8 = v12;

  }
  return v8;
}

+ (void)isSyncPromptedForHealthKit:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138543618;
  v4 = a1;
  v5 = 2114;
  v6 = a2;
  _os_log_error_impl(&dword_1D7813000, log, OS_LOG_TYPE_ERROR, "%{public}@: Unable to get the status update for the sync %{public}@", (uint8_t *)&v3, 0x16u);
}

@end
