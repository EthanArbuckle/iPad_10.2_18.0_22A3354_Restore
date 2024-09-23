@implementation HKFeatureAvailabilityRequirementCapabilityIsSupportedOnActiveRemoteDevice

void __109___HKFeatureAvailabilityRequirementCapabilityIsSupportedOnActiveRemoteDevice_registerObserver_forDataSource___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  _QWORD *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  id v11;

  v5 = a3;
  v7 = *(void **)(a1 + 32);
  v6 = (_QWORD *)(a1 + 32);
  v11 = 0;
  objc_msgSend(v7, "isSatisfiedWithDataSource:error:", a2, &v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v11;
  if (v8)
  {
    objc_msgSend(v5, "featureAvailabilityRequirement:didUpdateSatisfaction:", *v6, objc_msgSend(v8, "BOOLValue"));
  }
  else
  {
    _HKInitializeLogging();
    HKLogInfrastructure();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      __109__HKFeatureAvailabilityOnboardingEligibilityObservingRemoteDeviceRequirement_registerObserver_forDataSource___block_invoke_cold_1((uint64_t)v6, (uint64_t)v9, v10);

  }
}

+ (id)requirementIdentifier
{
  return CFSTR("CapabilityIsSupportedOnActiveRemoteDevice");
}

@end
