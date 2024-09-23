@implementation HKFeatureAvailabilityRequirementActiveWatchIsNotUnderInternalDevelopmentImportExclusion

- (HKFeatureAvailabilityRequirementActiveWatchIsNotUnderInternalDevelopmentImportExclusion)initWithFeatureIdentifier:(id)a3
{
  id v4;
  HKFeatureAvailabilityRequirementActiveWatchIsNotUnderInternalDevelopmentImportExclusion *v5;
  uint64_t v6;
  NSString *featureIdentifier;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HKFeatureAvailabilityRequirementActiveWatchIsNotUnderInternalDevelopmentImportExclusion;
  v5 = -[HKFeatureAvailabilityRequirementActiveWatchIsNotUnderInternalDevelopmentImportExclusion init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    featureIdentifier = v5->_featureIdentifier;
    v5->_featureIdentifier = (NSString *)v6;

  }
  return v5;
}

+ (NSString)requirementIdentifier
{
  return (NSString *)CFSTR("ActiveWatchIsNotUnderInternalDevelopmentImportExclusion");
}

- (NSString)requirementDescription
{
  void *v2;
  int v3;

  +[_HKBehavior sharedBehavior](_HKBehavior, "sharedBehavior");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isAppleWatch");

  if (v3)
    return (NSString *)CFSTR("Current watch must not be excluded from import for internal development");
  else
    return (NSString *)CFSTR("The active watch must not be excluded from import for internal development");
}

- (id)isSatisfiedWithDataSource:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v5 = a3;
  -[HKFeatureAvailabilityRequirementActiveWatchIsNotUnderInternalDevelopmentImportExclusion featureIdentifier](self, "featureIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("OxygenSaturationRecording"));

  if (v7)
  {
    objc_msgSend(v5, "importExclusionDeviceDataSource");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "behavior");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "isActiveWatchProdFusedWithBehavior:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      if ((objc_msgSend(v10, "BOOLValue") & 1) != 0)
      {
        v11 = (void *)MEMORY[0x1E0C9AAB0];
      }
      else
      {
        objc_msgSend(v5, "importExclusionDeviceDataSource");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "behavior");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "isImportAllowedForActiveWatchWithBehavior:featureIdentifier:", v13, self->_featureIdentifier);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v14 && (objc_msgSend(v14, "BOOLValue") & 1) != 0)
          v11 = (void *)MEMORY[0x1E0C9AAB0];
        else
          v11 = (void *)MEMORY[0x1E0C9AAA0];

      }
    }
    else
    {
      v11 = (void *)MEMORY[0x1E0C9AAA0];
    }

  }
  else
  {
    v11 = (void *)MEMORY[0x1E0C9AAB0];
  }

  return v11;
}

- (void)registerObserver:(id)a3 forDataSource:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _QWORD v9[5];
  id v10;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, v7);
  objc_msgSend(v7, "devicePairingAndSwitchingNotificationDataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __122__HKFeatureAvailabilityRequirementActiveWatchIsNotUnderInternalDevelopmentImportExclusion_registerObserver_forDataSource___block_invoke;
  v9[3] = &unk_1E37EA350;
  objc_copyWeak(&v10, &location);
  v9[4] = self;
  objc_msgSend(v8, "registerObserverForDevicePairingChanges:block:", v6, v9);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

}

void __122__HKFeatureAvailabilityRequirementActiveWatchIsNotUnderInternalDevelopmentImportExclusion_registerObserver_forDataSource___block_invoke(uint64_t a1, void *a2)
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
        __109__HKFeatureAvailabilityOnboardingEligibilityObservingRemoteDeviceRequirement_registerObserver_forDataSource___block_invoke_cold_1((uint64_t)v5, (uint64_t)v8, v9);

    }
  }

}

- (void)unregisterObserver:(id)a3 fromDataSource:(id)a4
{
  id v5;
  id v6;

  v5 = a3;
  objc_msgSend(a4, "devicePairingAndSwitchingNotificationDataSource");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "unregisterObserverForDevicePairingChanges:", v5);

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  char v8;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[HKFeatureAvailabilityRequirementActiveWatchIsNotUnderInternalDevelopmentImportExclusion featureIdentifier](self, "featureIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "featureIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = objc_msgSend(v6, "isEqualToString:", v7);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  objc_class *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  unint64_t v7;

  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash");
  -[HKFeatureAvailabilityRequirementActiveWatchIsNotUnderInternalDevelopmentImportExclusion featureIdentifier](self, "featureIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hash") ^ v5;

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_featureIdentifier, CFSTR("featureIdentifier"));
}

- (HKFeatureAvailabilityRequirementActiveWatchIsNotUnderInternalDevelopmentImportExclusion)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  HKFeatureAvailabilityRequirementActiveWatchIsNotUnderInternalDevelopmentImportExclusion *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("featureIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[HKFeatureAvailabilityRequirementActiveWatchIsNotUnderInternalDevelopmentImportExclusion initWithFeatureIdentifier:](self, "initWithFeatureIdentifier:", v5);
  return v6;
}

- (NSString)featureIdentifier
{
  return self->_featureIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featureIdentifier, 0);
}

@end
