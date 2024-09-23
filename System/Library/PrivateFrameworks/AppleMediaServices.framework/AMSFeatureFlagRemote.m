@implementation AMSFeatureFlagRemote

- (BOOL)isRemote
{
  return 1;
}

- (void)_updateInternalEnabledState
{
  void *v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  _BOOL8 v8;
  id v9;

  -[AMSFeatureFlag setDefaultEnabled:](self, "setDefaultEnabled:", -[AMSFeatureFlagRemote _developmentPhase](self, "_developmentPhase") == 4);
  +[AMSFeatureFlagRemote fetchRemoteFlagState](AMSFeatureFlagRemote, "fetchRemoteFlagState");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[AMSFeatureFlagRemote _preferencesKey](self, "_preferencesKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  -[AMSFeatureFlagRemote _preferencesKey](self, "_preferencesKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if ((v5 & 1) != 0)
  {
    v8 = 1;
  }
  else if (v7)
  {
    v8 = 0;
  }
  else
  {
    v8 = -[AMSFeatureFlag isDefaultEnabled](self, "isDefaultEnabled");
  }
  -[AMSFeatureFlag setEnabled:](self, "setEnabled:", v8);
  -[AMSFeatureFlag _updateUserEnabled:](self, "_updateUserEnabled:", -[AMSFeatureFlag isEnabled](self, "isEnabled"));

}

- (void)_updateDevelopmentPhase
{
  -[AMSFeatureFlag setDevelopmentPhase:](self, "setDevelopmentPhase:", -[AMSFeatureFlagRemote _developmentPhase](self, "_developmentPhase"));
}

- (void)_activateFlag
{
  void *v3;
  void *v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  AMSSetLogKeyIfNeeded();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSFeatureFlagRemote fetchRemoteFlagState](AMSFeatureFlagRemote, "fetchRemoteFlagState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[AMSFeatureFlag isUserEnabled](self, "isUserEnabled");
  -[AMSFeatureFlagRemote _preferencesKey](self, "_preferencesKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v4, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], v6);

    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v7, "OSLogObject");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = objc_opt_class();
      -[AMSFeatureFlag feature](self, "feature");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543874;
      v14 = v9;
      v15 = 2114;
      v16 = v3;
      v17 = 2114;
      v18 = v10;
      v11 = "%{public}@: [%{public}@] Remote Feature Flag enabled: %{public}@";
LABEL_10:
      _os_log_impl(&dword_18C849000, v8, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v13, 0x20u);

    }
  }
  else
  {
    objc_msgSend(v4, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], v6);

    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v7, "OSLogObject");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v12 = objc_opt_class();
      -[AMSFeatureFlag feature](self, "feature");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543874;
      v14 = v12;
      v15 = 2114;
      v16 = v3;
      v17 = 2114;
      v18 = v10;
      v11 = "%{public}@: [%{public}@] Remote Feature Flag disabled: %{public}@";
      goto LABEL_10;
    }
  }

  CFPreferencesSetAppValue(CFSTR("remoteFlagState"), v4, CFSTR("com.apple.storeservices.itfe"));
  CFPreferencesAppSynchronize(CFSTR("com.apple.storeservices.itfe"));

}

- (int64_t)_developmentPhase
{
  void *v3;
  void *v4;
  int64_t v5;

  -[AMSFeatureFlag flagData](self, "flagData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("DevelopmentPhase"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_10;
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("UnderDevelopment")) & 1) == 0)
  {
    if ((objc_msgSend(v4, "isEqualToString:", CFSTR("CodeComplete")) & 1) != 0)
    {
      v5 = 2;
      goto LABEL_11;
    }
    if ((objc_msgSend(v4, "isEqualToString:", CFSTR("PreviewReady")) & 1) != 0)
    {
      v5 = 3;
      goto LABEL_11;
    }
    if ((objc_msgSend(v4, "isEqualToString:", CFSTR("FeatureComplete")) & 1) != 0)
    {
      v5 = 4;
      goto LABEL_11;
    }
LABEL_10:
    v5 = -[AMSFeatureFlag _developmentPhaseFromGroupType:](self, "_developmentPhaseFromGroupType:", -[AMSFeatureFlag groupType](self, "groupType"));
    goto LABEL_11;
  }
  v5 = 1;
LABEL_11:

  return v5;
}

- (id)_preferencesKey
{
  int64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = -[AMSFeatureFlagRemote _developmentPhase](self, "_developmentPhase");
  v4 = (void *)MEMORY[0x1E0CB3940];
  -[AMSFeatureFlag domain](self, "domain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSFeatureFlag flagGroup](self, "flagGroup");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSFeatureFlag feature](self, "feature");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@-%@-%@-%ld"), v5, v6, v7, v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)fetchRemoteFlagState
{
  void *v2;
  uint64_t v3;
  void *v4;

  CFPreferencesAppSynchronize(CFSTR("com.apple.storeservices.itfe"));
  v2 = (void *)CFPreferencesCopyAppValue(CFSTR("remoteFlagState"), CFSTR("com.apple.storeservices.itfe"));
  if (!v2 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v3 = objc_opt_new();

    v2 = (void *)v3;
  }
  v4 = (void *)objc_msgSend(v2, "mutableCopy");

  return v4;
}

@end
