@implementation _HKFeatureAvailabilityRequirementCapabilityIsSupportedOnActiveRemoteDevice

+ (NSString)requirementIdentifier
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HKFeatureAvailabilityRequirementCapabilityIsSupportedOnActiveRemoteDevice.m"), 25, CFSTR("Subclasses must specify their own requirement identifiers"));

  return (NSString *)CFSTR("InvalidRequirement");
}

- (NSString)requirementDescription
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3940];
  -[HKFeatureAvailabilityOnboardingEligibilityRequirement featureIdentifier](self, "featureIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("The paired device capability for %@ must be supported"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (id)isSatisfiedWithOnboardingEligibility:(id)a3 error:(id *)a4
{
  id v4;
  uint64_t v5;
  uint64_t v6;

  v4 = a3;
  v5 = objc_msgSend(v4, "ineligibilityReasons") & 2;
  v6 = v5 | objc_msgSend(v4, "ineligibilityReasons") & 4;

  return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v6 == 0);
}

- (void)registerObserver:(id)a3 forDataSource:(id)a4
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __109___HKFeatureAvailabilityRequirementCapabilityIsSupportedOnActiveRemoteDevice_registerObserver_forDataSource___block_invoke;
  v4[3] = &unk_1E37EDBD0;
  v4[4] = self;
  objc_msgSend(a4, "registerObserverForDeviceCharacteristicAndPairingChanges:block:", a3, v4);
}

- (void)unregisterObserver:(id)a3 fromDataSource:(id)a4
{
  objc_msgSend(a4, "unregisterObserverForDeviceCharacteristicAndPairingChanges:", a3);
}

@end
