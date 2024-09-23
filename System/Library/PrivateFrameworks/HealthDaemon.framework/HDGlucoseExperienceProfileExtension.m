@implementation HDGlucoseExperienceProfileExtension

- (HDGlucoseExperienceProfileExtension)initWithProfile:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  HDGlucoseExperienceProfileExtension *v10;
  void *v11;
  void *v12;
  char v13;
  HDOTAFeatureDisableAndExpiryProvider *v14;
  void *v15;
  HDOTAFeatureDisableAndExpiryProvider *v16;
  HDLocalCountrySetAvailabilityProvider *v17;
  void *v18;
  void *v19;
  HDLocalCountrySetAvailabilityProvider *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  HDFeatureAvailabilityManager *v26;
  HDFeatureAvailabilityManager *featureAvailabilityManager;
  HDBackgroundFeatureDeliveryManager *v28;
  HDBackgroundFeatureDeliveryManager *featureDeliveryManager;
  objc_super v31;
  void *v32;
  uint64_t v33;
  _QWORD v34[2];

  v34[1] = *MEMORY[0x1E0C80C00];
  v4 = (void *)*MEMORY[0x1E0CB5028];
  v5 = a3;
  HKLogInfrastructure();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5;
  v8 = v4;
  v9 = v6;
  if (self)
  {
    v31.receiver = self;
    v31.super_class = (Class)HDGlucoseExperienceProfileExtension;
    v10 = -[HDGlucoseExperienceProfileExtension init](&v31, sel_init);
    self = v10;
    if (v10)
    {
      objc_storeStrong((id *)&v10->_featureIdentifier, v4);
      objc_msgSend(v7, "daemon");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "behavior");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "isAppleWatch");

      if ((v13 & 1) == 0)
      {
        v14 = [HDOTAFeatureDisableAndExpiryProvider alloc];
        objc_msgSend(v7, "daemon");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = -[HDOTAFeatureDisableAndExpiryProvider initWithDaemon:featureIdentifier:](v14, "initWithDaemon:featureIdentifier:", v15, v8);

        v17 = [HDLocalCountrySetAvailabilityProvider alloc];
        objc_msgSend(MEMORY[0x1E0CB6538], "localAvailabilityForGlucoseEnhancedCharting");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "daemon");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = -[HDLocalCountrySetAvailabilityProvider initWithFeatureIdentifier:defaultCountrySet:healthDaemon:](v17, "initWithFeatureIdentifier:defaultCountrySet:healthDaemon:", v8, v18, v19);

        v21 = objc_alloc(MEMORY[0x1E0CB66F0]);
        v33 = *MEMORY[0x1E0CB4E40];
        objc_msgSend(MEMORY[0x1E0CB66F8], "defaultOnboardingEligibilityRequirementsForFeatureIdentifier:", v8);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = v22;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v32, 1);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v34[0] = v23;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v34, &v33, 1);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = (void *)objc_msgSend(v21, "initWithRequirementsByContext:", v24);

        v26 = -[HDFeatureAvailabilityManager initWithProfile:featureIdentifier:availabilityRequirements:currentOnboardingVersion:pairedDeviceCapability:regionAvailabilityProvider:disableAndExpiryProvider:loggingCategory:]([HDFeatureAvailabilityManager alloc], "initWithProfile:featureIdentifier:availabilityRequirements:currentOnboardingVersion:pairedDeviceCapability:regionAvailabilityProvider:disableAndExpiryProvider:loggingCategory:", v7, v8, v25, 1, 0, v20, v16, v9);
        featureAvailabilityManager = self->_featureAvailabilityManager;
        self->_featureAvailabilityManager = v26;

        v28 = -[HDBackgroundFeatureDeliveryManager initWithProfile:featureAvailabilityExtension:loggingCategory:]([HDBackgroundFeatureDeliveryManager alloc], "initWithProfile:featureAvailabilityExtension:loggingCategory:", v7, self->_featureAvailabilityManager, v9);
        featureDeliveryManager = self->_featureDeliveryManager;
        self->_featureDeliveryManager = v28;

      }
    }
  }

  return self;
}

- (id)featureAvailabilityExtensionForFeatureIdentifier:(id)a3
{
  HDFeatureAvailabilityManager *v4;

  if (objc_msgSend(a3, "isEqualToString:", self->_featureIdentifier))
    v4 = self->_featureAvailabilityManager;
  else
    v4 = 0;
  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featureIdentifier, 0);
  objc_storeStrong((id *)&self->_featureDeliveryManager, 0);
  objc_storeStrong((id *)&self->_featureAvailabilityManager, 0);
}

@end
