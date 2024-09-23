@implementation HKFeatureAvailabilityRequirementWristDetectionIsEnabledForActiveWatch

+ (NSString)requirementIdentifier
{
  return (NSString *)CFSTR("WristDetectionIsEnabledForActiveWatch");
}

- (NSString)requirementDescription
{
  return (NSString *)CFSTR("The Wrist Detection setting for the active watch must be enabled");
}

- (id)isSatisfiedWithDataSource:(id)a3 error:(id *)a4
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(a3, "wristDetectionSettingDataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "wristDetectionSettingManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "numberWithBool:", objc_msgSend(v6, "isWristDetectEnabled"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)registerObserver:(id)a3 forDataSource:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  _QWORD v9[5];

  v6 = a3;
  objc_msgSend(a4, "wristDetectionSettingDataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __104__HKFeatureAvailabilityRequirementWristDetectionIsEnabledForActiveWatch_registerObserver_forDataSource___block_invoke;
  v9[3] = &unk_1E37EC678;
  v9[4] = self;
  objc_msgSend(v7, "registerObserver:forKey:newValueHandler:", v6, v8, v9);

}

void __104__HKFeatureAvailabilityRequirementWristDetectionIsEnabledForActiveWatch_registerObserver_forDataSource___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4;
  id v5;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = a2;
  objc_msgSend(v5, "featureAvailabilityRequirement:didUpdateSatisfaction:", v4, objc_msgSend(a3, "BOOLValue"));

}

- (void)unregisterObserver:(id)a3 fromDataSource:(id)a4
{
  id v5;
  void *v6;
  id v7;

  v5 = a3;
  objc_msgSend(a4, "wristDetectionSettingDataSource");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "unregisterObserver:forKey:", v5, v6);

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
