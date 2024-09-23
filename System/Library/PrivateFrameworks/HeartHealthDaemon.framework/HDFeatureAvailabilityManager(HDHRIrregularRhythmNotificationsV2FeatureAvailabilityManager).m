@implementation HDFeatureAvailabilityManager(HDHRIrregularRhythmNotificationsV2FeatureAvailabilityManager)

+ (id)hdhr_irregularRhythmNotificationsV2FeatureAvailabilityManagerWithProfile:()HDHRIrregularRhythmNotificationsV2FeatureAvailabilityManager disableAndExpiryProvider:pairedFeaturePropertiesSyncManager:
{
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  _QWORD *v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v24;
  uint64_t v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  v7 = a5;
  v8 = a4;
  v9 = a3;
  if (objc_msgSend(v9, "profileType") == 1)
    objc_msgSend(v7, "synchronizeLocalProperties");
  v10 = objc_alloc(MEMORY[0x1E0D295C8]);
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", CFSTR("2B5E630F-55DE-4122-A36B-5F8F77D1363E"));
  v12 = (_QWORD *)MEMORY[0x1E0CB52F0];
  v13 = (void *)objc_msgSend(v10, "initWithAllowedCountriesDataSource:profile:featureCapability:loggingCategory:", v7, v9, v11, *MEMORY[0x1E0CB52F0]);

  v14 = objc_alloc(MEMORY[0x1E0CB66F0]);
  v25 = *MEMORY[0x1E0CB4E40];
  v15 = *MEMORY[0x1E0CB5048];
  objc_msgSend(MEMORY[0x1E0CB66F8], "defaultOnboardingEligibilityRequirementsForFeatureIdentifier:", *MEMORY[0x1E0CB5048]);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v24, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v17;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, &v25, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v14, "initWithRequirementsByContext:", v18);

  v20 = objc_alloc(MEMORY[0x1E0D294A0]);
  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", CFSTR("2B5E630F-55DE-4122-A36B-5F8F77D1363E"));
  v22 = (void *)objc_msgSend(v20, "initWithProfile:featureIdentifier:availabilityRequirements:currentOnboardingVersion:pairedDeviceCapability:pairedFeatureAttributesProvider:regionAvailabilityProvider:disableAndExpiryProvider:loggingCategory:", v9, v15, v19, 1, v21, v7, v13, v8, *v12);

  return v22;
}

@end
