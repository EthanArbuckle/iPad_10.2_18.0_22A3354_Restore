@implementation HDFeatureAvailabilityManager(CardioFitness)

+ (id)hdhr_makeCardioFitnessFeatureAvailabilityManagerWithProfile:()CardioFitness
{
  uint64_t v5;
  objc_class *v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;

  v5 = *MEMORY[0x1E0CB5000];
  v6 = (objc_class *)MEMORY[0x1E0D294C8];
  v7 = (id)*MEMORY[0x1E0CB52E8];
  v8 = a3;
  v9 = [v6 alloc];
  HKHRCardioFitnessAllowedCountrySet();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "daemon");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v9, "initWithFeatureIdentifier:defaultCountrySet:healthDaemon:", v5, v10, v11);

  v13 = objc_alloc(MEMORY[0x1E0D29538]);
  HKHRCardioFitnessLocalFeatureAttributes();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v13, "initWithFeatureIdentifier:localFeatureAttributes:localCountrySetAvailabilityProvider:", v5, v14, v12);

  objc_msgSend(v15, "synchronizeLocalProperties");
  objc_msgSend(a1, "_makeRegionAvailabilityProviderWithProfile:syncManager:", v8, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_alloc(MEMORY[0x1E0D294A0]);
  objc_msgSend(MEMORY[0x1E0D2FBD8], "requirementSet");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", CFSTR("7640DD53-A02B-4C03-AB93-9FA49BCD0AB6"));
  v20 = objc_alloc_init(MEMORY[0x1E0D294B0]);
  v21 = (void *)objc_msgSend(v17, "initWithProfile:featureIdentifier:availabilityRequirements:currentOnboardingVersion:pairedDeviceCapability:pairedFeatureAttributesProvider:regionAvailabilityProvider:disableAndExpiryProvider:loggingCategory:", v8, v5, v18, 1, v19, v15, v16, v20, v7);

  return v21;
}

+ (id)_makeRegionAvailabilityProviderWithProfile:()CardioFitness syncManager:
{
  uint64_t v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  _QWORD *v13;
  void *v14;
  void *v15;

  v5 = *MEMORY[0x1E0D51648];
  v6 = (void *)MEMORY[0x1E0CB6F18];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "sharedBehavior");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v9, "isAppleWatch") & 1) != 0)
    v10 = 0;
  else
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", CFSTR("7640DD53-A02B-4C03-AB93-9FA49BCD0AB6"));

  v11 = objc_alloc(MEMORY[0x1E0D29408]);
  objc_msgSend(v8, "daemon");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (_QWORD *)MEMORY[0x1E0CB52E8];
  v14 = (void *)objc_msgSend(v11, "initWithDaemon:allowedCountriesDataSource:availableRegionsDevicePropertyName:loggingCategory:shouldReturnLocalAvailabilityForNilDeviceRegions:", v12, v7, v5, *MEMORY[0x1E0CB52E8], 1);

  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D295C8]), "initWithAllowedCountriesDataSource:profile:featureCapability:loggingCategory:", v14, v8, v10, *v13);
  return v15;
}

@end
