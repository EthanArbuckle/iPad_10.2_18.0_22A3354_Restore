@implementation HDRespiratoryRateMeasurementsProfileExtension

- (HDRespiratoryRateMeasurementsProfileExtension)initWithProfile:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;

  v4 = a3;
  HKLogInfrastructure();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (self)
  {
    v7 = (void *)*MEMORY[0x1E0CB5088];
    v8 = v5;
    v9 = v7;
    v10 = v4;
    objc_msgSend(v10, "daemon");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "behavior");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "isCompanionCapable");

    self = -[HDRespiratoryRateMeasurementsProfileExtension initWithProfile:featureIdentifier:isBackgroundDeliveryEnabled:loggingCategory:](self, "initWithProfile:featureIdentifier:isBackgroundDeliveryEnabled:loggingCategory:", v10, v9, v13, v8);
  }

  return self;
}

- (HDRespiratoryRateMeasurementsProfileExtension)initWithProfile:(id)a3 featureIdentifier:(id)a4 isBackgroundDeliveryEnabled:(BOOL)a5 loggingCategory:(id)a6
{
  _BOOL4 v7;
  id v10;
  id v11;
  id v12;
  HDRespiratoryRateMeasurementsProfileExtension *v13;
  HDRespiratoryRateMeasurementsProfileExtension *v14;
  HDOTAFeatureDisableAndExpiryProvider *v15;
  void *v16;
  objc_class *v17;
  NSString *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  HDFeatureAvailabilityManager *featureAvailabilityManager;
  HDBackgroundFeatureDeliveryManager *v32;
  HDBackgroundFeatureDeliveryManager *featureDeliveryManager;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  _BOOL4 v41;
  id v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  HDOTAFeatureDisableAndExpiryProvider *v51;
  HDFeatureAvailabilityManager *v52;
  id v53;
  id v54;
  objc_super v55;
  _QWORD v56[8];
  _QWORD v57[2];
  _QWORD v58[4];
  void *v59;
  _QWORD v60[4];
  _QWORD v61[6];

  v7 = a5;
  v61[4] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a6;
  v55.receiver = self;
  v55.super_class = (Class)HDRespiratoryRateMeasurementsProfileExtension;
  v13 = -[HDRespiratoryRateMeasurementsProfileExtension init](&v55, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_featureIdentifier, a4);
    v15 = [HDOTAFeatureDisableAndExpiryProvider alloc];
    objc_msgSend(v10, "daemon");
    v53 = v12;
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = -[HDOTAFeatureDisableAndExpiryProvider initWithDaemon:featureIdentifier:](v15, "initWithDaemon:featureIdentifier:", v16, v11);

    v48 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", CFSTR("5C64C95B-8E7C-46AB-A110-1E51C93D7B7F"));
    v52 = [HDFeatureAvailabilityManager alloc];
    v17 = (objc_class *)MEMORY[0x1E0CB66F0];
    v18 = v14->_featureIdentifier;
    v42 = [v17 alloc];
    v60[0] = *MEMORY[0x1E0CB4E40];
    objc_msgSend(MEMORY[0x1E0CB66F8], "defaultOnboardingEligibilityRequirementsForFeatureIdentifier:", v18);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = v50;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v59, 1);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v61[0] = v49;
    v60[1] = *MEMORY[0x1E0CB4EA8];
    objc_msgSend(MEMORY[0x1E0CB66F8], "capabilityIsSupportedOnActiveRemoteDeviceForFeatureWithIdentifier:", v18);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v58[0] = v47;
    objc_msgSend(MEMORY[0x1E0CB66F8], "onboardingRecordIsPresentForFeatureWithIdentifier:", v18);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v58[1] = v46;
    v19 = *MEMORY[0x1E0CB5208];
    objc_msgSend(MEMORY[0x1E0CB66F8], "notAgeGatedForUserDefaultsKey:", *MEMORY[0x1E0CB5208]);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v58[2] = v45;
    objc_msgSend(MEMORY[0x1E0CB66F8], "profileIsNotFamilySetupPairingProfile");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v58[3] = v44;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v58, 4);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v61[1] = v40;
    v60[2] = *MEMORY[0x1E0CB4EA0];
    objc_msgSend(MEMORY[0x1E0CB66F8], "featureIsNotRemotelyDisabledWithIdentifier:", v18);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v57[0] = v39;
    objc_msgSend(MEMORY[0x1E0CB66F8], "countryIsSupportedOnWatchForFeatureWithIdentifier:isSupportedIfCountryListMissing:", v18, 0);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v57[1] = v38;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v57, 2);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v61[2] = v37;
    v60[3] = *MEMORY[0x1E0CB4ED0];
    objc_msgSend(MEMORY[0x1E0CB66F8], "capabilityIsSupportedOnActiveRemoteDeviceForFeatureWithIdentifier:", v18);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v56[0] = v36;
    objc_msgSend(MEMORY[0x1E0CB66F8], "profileIsNotFamilySetupPairingProfile");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v56[1] = v35;
    objc_msgSend(MEMORY[0x1E0CB66F8], "onboardingRecordIsPresentForFeatureWithIdentifier:", v18);
    v41 = v7;
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v56[2] = v20;
    objc_msgSend(MEMORY[0x1E0CB66F8], "featureIsNotRemotelyDisabledWithIdentifier:", v18);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v56[3] = v21;
    objc_msgSend(MEMORY[0x1E0CB66F8], "countryIsSupportedOnWatchForFeatureWithIdentifier:isSupportedIfCountryListMissing:", v18, 0);
    v54 = v10;
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v56[4] = v22;
    objc_msgSend(MEMORY[0x1E0CB66F8], "notAgeGatedForUserDefaultsKey:", v19);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v56[5] = v23;
    objc_msgSend(MEMORY[0x1E0CB66F8], "featureIsOnWithIdentifier:isOnIfSettingIsAbsent:", v18, 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    v56[6] = v24;
    objc_msgSend(MEMORY[0x1E0CB66F8], "wristDetectionIsEnabledForActiveWatch");
    v25 = v11;
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v56[7] = v26;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v56, 8);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v61[3] = v27;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v61, v60, 4);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = (void *)objc_msgSend(v42, "initWithRequirementsByContext:", v28);

    v11 = v25;
    v12 = v53;

    v10 = v54;
    +[HDRegionAvailabilityProvider anyCountryAvailability](HDRegionAvailabilityProvider, "anyCountryAvailability");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = -[HDFeatureAvailabilityManager initWithProfile:featureIdentifier:availabilityRequirements:currentOnboardingVersion:pairedDeviceCapability:regionAvailabilityProvider:disableAndExpiryProvider:loggingCategory:](v52, "initWithProfile:featureIdentifier:availabilityRequirements:currentOnboardingVersion:pairedDeviceCapability:regionAvailabilityProvider:disableAndExpiryProvider:loggingCategory:", v54, v25, v43, 1, v48, v29, v51, v53);
    featureAvailabilityManager = v14->_featureAvailabilityManager;
    v14->_featureAvailabilityManager = (HDFeatureAvailabilityManager *)v30;

    if (v41)
    {
      v32 = -[HDBackgroundFeatureDeliveryManager initWithProfile:featureAvailabilityExtension:loggingCategory:]([HDBackgroundFeatureDeliveryManager alloc], "initWithProfile:featureAvailabilityExtension:loggingCategory:", v54, v14->_featureAvailabilityManager, v53);
      featureDeliveryManager = v14->_featureDeliveryManager;
      v14->_featureDeliveryManager = v32;

    }
  }

  return v14;
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
