@implementation HKFeatureAvailabilityRequirementSatisfactionOverridesDataSource

+ (id)requirementSatisfactionOverridesDataSource
{
  id v2;
  void *v3;
  void *v4;

  v2 = objc_alloc((Class)a1);
  objc_msgSend(MEMORY[0x1E0C99EA0], "hk_featureAvailabilityRequirementEvaluationOverridesUserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithUserDefaults:", v3);

  return v4;
}

- (void)registerObserver:(id)a3 forFeature:(id)a4 requirement:(id)a5 newValueHandler:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;

  v9 = a6;
  v10 = a4;
  v11 = a3;
  objc_msgSend((id)objc_opt_class(), "requirementIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  HKRequirementSatisfactionOverrideKeyForFeatureAndRequirement((uint64_t)v10, (uint64_t)v12);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  -[HKObserverBridge registerObserver:forKey:newValueHandler:](self, "registerObserver:forKey:newValueHandler:", v11, v13, v9);
}

- (void)unregisterObserver:(id)a3 forFeature:(id)a4 requirement:(id)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;

  v7 = a4;
  v8 = a3;
  objc_msgSend((id)objc_opt_class(), "requirementIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  HKRequirementSatisfactionOverrideKeyForFeatureAndRequirement((uint64_t)v7, (uint64_t)v9);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  -[HKObserverBridge unregisterObserver:forKey:](self, "unregisterObserver:forKey:", v8, v10);
}

@end
