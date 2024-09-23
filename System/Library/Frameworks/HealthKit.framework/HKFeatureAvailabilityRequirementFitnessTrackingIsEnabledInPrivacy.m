@implementation HKFeatureAvailabilityRequirementFitnessTrackingIsEnabledInPrivacy

+ (NSString)requirementIdentifier
{
  return (NSString *)CFSTR("FitnessTrackingEnabled");
}

- (NSString)requirementDescription
{
  return (NSString *)CFSTR("Fitness Tracking must be enabled in Motion & Fitness in Settings");
}

- (id)isSatisfiedWithDataSource:(id)a3 error:(id *)a4
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(a3, "privacyPreferencesDataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "userDefaults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "numberWithBool:", HKIsFitnessTrackingEnabledWithUserDefaults(v6));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)registerObserver:(id)a3 forDataSource:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;
  _QWORD aBlock[5];
  id v20;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, v7);
  v8 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __100__HKFeatureAvailabilityRequirementFitnessTrackingIsEnabledInPrivacy_registerObserver_forDataSource___block_invoke;
  aBlock[3] = &unk_1E37EA350;
  objc_copyWeak(&v20, &location);
  aBlock[4] = self;
  v9 = _Block_copy(aBlock);
  +[_HKBehavior sharedBehavior](_HKBehavior, "sharedBehavior");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isAppleWatch");

  if (v11)
  {
    objc_msgSend(v7, "privacyPreferencesDataSource");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = v8;
    v17[1] = 3221225472;
    v17[2] = __100__HKFeatureAvailabilityRequirementFitnessTrackingIsEnabledInPrivacy_registerObserver_forDataSource___block_invoke_7;
    v17[3] = &unk_1E37F06A8;
    v18 = v9;
    objc_msgSend(v12, "registerObserver:forKey:newValueHandler:", v6, CFSTR("EnableFitnessTracking"), v17);

    v13 = v18;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "com.apple.tcc.access.changed");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "darwinNotificationDataSource");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = v8;
    v15[1] = 3221225472;
    v15[2] = __100__HKFeatureAvailabilityRequirementFitnessTrackingIsEnabledInPrivacy_registerObserver_forDataSource___block_invoke_2;
    v15[3] = &unk_1E37EC480;
    v16 = v9;
    objc_msgSend(v14, "registerObserver:forKey:newValueHandler:", v6, v13, v15);

  }
  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);

}

void __100__HKFeatureAvailabilityRequirementFitnessTrackingIsEnabledInPrivacy_registerObserver_forDataSource___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  _QWORD *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  id v10;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v6 = *(void **)(a1 + 32);
    v5 = (_QWORD *)(a1 + 32);
    v10 = 0;
    objc_msgSend(v6, "isSatisfiedWithDataSource:error:", WeakRetained, &v10);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v10;
    if (v7)
    {
      objc_msgSend(v3, "featureAvailabilityRequirement:didUpdateSatisfaction:", *v5, objc_msgSend(v7, "BOOLValue"));
    }
    else
    {
      _HKInitializeLogging();
      HKLogInfrastructure();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        __92__HKFeatureAvailabilityRequirementPrerequisiteFeaturesAreOn_registerObserver_forDataSource___block_invoke_cold_1((uint64_t)v5, (uint64_t)v8, v9);

    }
  }

}

uint64_t __100__HKFeatureAvailabilityRequirementFitnessTrackingIsEnabledInPrivacy_registerObserver_forDataSource___block_invoke_7(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __100__HKFeatureAvailabilityRequirementFitnessTrackingIsEnabledInPrivacy_registerObserver_forDataSource___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)unregisterObserver:(id)a3 fromDataSource:(id)a4
{
  id v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a4;
  v5 = a3;
  +[_HKBehavior sharedBehavior](_HKBehavior, "sharedBehavior");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isAppleWatch");

  if (v7)
  {
    objc_msgSend(v10, "privacyPreferencesDataSource");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "unregisterObserver:forKey:", v5, CFSTR("EnableFitnessTracking"));
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "com.apple.tcc.access.changed");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "darwinNotificationDataSource");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "unregisterObserver:forKey:", v5, v8);

    v5 = v9;
  }

}

- (BOOL)isEqual:(id)a3
{
  id v3;
  char isKindOfClass;

  v3 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (unint64_t)hash
{
  objc_class *v2;
  void *v3;
  unint64_t v4;

  v2 = (objc_class *)objc_opt_class();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
