@implementation HKFeatureOnboardingRecordInaccessibilityCache

- (HKFeatureOnboardingRecordInaccessibilityCache)initWithCachingDefaults:(id)a3
{
  id v5;
  HKFeatureOnboardingRecordInaccessibilityCache *v6;
  HKFeatureOnboardingRecordInaccessibilityCache *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HKFeatureOnboardingRecordInaccessibilityCache;
  v6 = -[HKFeatureOnboardingRecordInaccessibilityCache init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_cachingDefaults, a3);

  return v7;
}

- (id)fallbackOnboardingRecordForError:(id)a3 featureIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a3;
  v7 = a4;
  if (v6 && objc_msgSend(v6, "hk_isDatabaseAccessibilityError"))
  {
    -[HKFeatureOnboardingRecordInaccessibilityCache _cachedOnboardingRecordForFeatureIdentifier:](self, "_cachedOnboardingRecordForFeatureIdentifier:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)_cachedOnboardingRecordForFeatureIdentifier:(id)a3
{
  id v4;
  NSUserDefaults *cachingDefaults;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v13;
  id v14;
  id v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  id v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  cachingDefaults = self->_cachingDefaults;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_OnboardingRecord"), v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSUserDefaults dataForKey:](cachingDefaults, "dataForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v15 = 0;
    objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v7, &v15);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v15;
    if (v8)
    {
      v10 = v8;
    }
    else
    {
      _HKInitializeLogging();
      HKLogInfrastructure();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        v13 = (void *)objc_opt_class();
        *(_DWORD *)buf = 138543874;
        v17 = v13;
        v18 = 2114;
        v19 = v4;
        v20 = 2114;
        v21 = v9;
        v14 = v13;
        _os_log_error_impl(&dword_19A0E6000, v11, OS_LOG_TYPE_ERROR, "[%{public}@]: Unable to unarchive cached onboarding record for %{public}@: %{public}@", buf, 0x20u);

      }
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)updateForRetrievedOnboardingRecord:(id)a3 featureIdentifier:(id)a4
{
  id v6;
  void *v7;
  id v8;
  NSUserDefaults *cachingDefaults;
  NSObject *v10;
  void *v11;
  id v12;
  id v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  id v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v13 = 0;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", a3, 1, &v13);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v13;
  if (v7)
  {
    cachingDefaults = self->_cachingDefaults;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_OnboardingRecord"), v6);
    v10 = objc_claimAutoreleasedReturnValue();
    -[NSUserDefaults setObject:forKey:](cachingDefaults, "setObject:forKey:", v7, v10);
  }
  else
  {
    _HKInitializeLogging();
    HKLogInfrastructure();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      v15 = v11;
      v16 = 2114;
      v17 = v6;
      v18 = 2114;
      v19 = v8;
      v12 = v11;
      _os_log_error_impl(&dword_19A0E6000, v10, OS_LOG_TYPE_ERROR, "[%{public}@]: Unable to archive onboarding record for %{public}@: %{public}@", buf, 0x20u);

    }
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachingDefaults, 0);
}

@end
