@implementation HKFeatureAvailabilityRequirementWatchLowPowerModeIsOff

+ (NSString)requirementIdentifier
{
  return (NSString *)CFSTR("WatchLowPowerModeIsOff");
}

- (NSString)requirementDescription
{
  return (NSString *)CFSTR("Low Power Mode must be turned off on the active watch");
}

- (id)isSatisfiedWithDataSource:(id)a3 error:(id *)a4
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(a3, "watchLowPowerModeDataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "numberWithInt:", objc_msgSend(v5, "isWatchLowPowerModeEnabled") ^ 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)registerObserver:(id)a3 forDataSource:(id)a4
{
  id v6;
  void *v7;
  _QWORD v8[5];

  v6 = a3;
  objc_msgSend(a4, "watchLowPowerModeDataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __89__HKFeatureAvailabilityRequirementWatchLowPowerModeIsOff_registerObserver_forDataSource___block_invoke;
  v8[3] = &unk_1E37F1D68;
  v8[4] = self;
  objc_msgSend(v7, "registerObserver:onLowPowerModeChange:", v6, v8);

}

uint64_t __89__HKFeatureAvailabilityRequirementWatchLowPowerModeIsOff_registerObserver_forDataSource___block_invoke(uint64_t a1, void *a2, int a3)
{
  return objc_msgSend(a2, "featureAvailabilityRequirement:didUpdateSatisfaction:", *(_QWORD *)(a1 + 32), a3 ^ 1u);
}

- (void)unregisterObserver:(id)a3 fromDataSource:(id)a4
{
  id v5;
  id v6;

  v5 = a3;
  objc_msgSend(a4, "watchLowPowerModeDataSource");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "unregisterObserver:", v5);

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
