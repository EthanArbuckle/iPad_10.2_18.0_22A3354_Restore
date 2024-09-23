@implementation HKHRElectrocardiogramRecordingFeatureAvailabilityRequirements

+ (id)requirementSet
{
  id v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[7];
  _QWORD v16[8];

  v16[7] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0CB66F0]);
  v15[0] = *MEMORY[0x1E0CB4E70];
  v3 = (void *)objc_opt_class();
  v4 = *MEMORY[0x1E0CB5008];
  objc_msgSend(v3, "_onboardingInitiationRequirementsForFeatureIdentifier:", *MEMORY[0x1E0CB5008]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v5;
  v15[1] = *MEMORY[0x1E0CB4E88];
  objc_msgSend((id)objc_opt_class(), "_onboardingPromotionRequirementsForFeatureIdentifier:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v6;
  v15[2] = *MEMORY[0x1E0CB4ED0];
  objc_msgSend((id)objc_opt_class(), "_usageRequirementsForFeatureIdentifier:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16[2] = v7;
  v15[3] = *MEMORY[0x1E0CB4EC8];
  objc_msgSend((id)objc_opt_class(), "_upgradePromotion");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16[3] = v8;
  v15[4] = *MEMORY[0x1E0CB4EC0];
  objc_msgSend((id)objc_opt_class(), "_upgradeInitiation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v16[4] = v9;
  v15[5] = *MEMORY[0x1E0CB4EA8];
  objc_msgSend((id)objc_opt_class(), "_settingsVisibilityRequirementsForFeatureIdentifier:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16[5] = v10;
  v15[6] = *MEMORY[0x1E0CB4EA0];
  objc_msgSend((id)objc_opt_class(), "_settingsUserInteractionEnabledForFeatureIdentifier:", v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16[6] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v2, "initWithRequirementsByContext:", v12);

  return v13;
}

+ (id)requirementSetV2
{
  uint64_t v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[3];
  _QWORD v17[4];
  _QWORD v18[5];

  v18[4] = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0CB5018];
  v3 = objc_alloc(MEMORY[0x1E0CB66F0]);
  v17[0] = *MEMORY[0x1E0CB4E70];
  objc_msgSend((id)objc_opt_class(), "_onboardingInitiationRequirementsForFeatureIdentifier:", v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v4;
  v17[1] = *MEMORY[0x1E0CB4E88];
  objc_msgSend((id)objc_opt_class(), "_onboardingPromotionRequirementsForFeatureIdentifier:", v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v5;
  v17[2] = *MEMORY[0x1E0CB4ED0];
  objc_msgSend((id)objc_opt_class(), "_usageRequirementsForFeatureIdentifier:", v2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v18[2] = v6;
  v17[3] = *MEMORY[0x1E0CB4E40];
  objc_msgSend(MEMORY[0x1E0CB66F8], "defaultOnboardingEligibilityRequirementsForFeatureIdentifier:", v2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB66F8], "onboardingRecordIsPresentForFeatureWithIdentifier:", *MEMORY[0x1E0CB5010], v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v8;
  v9 = (void *)MEMORY[0x1E0CB66F8];
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", CFSTR("253F2ED0-FFC6-4D36-A387-B6965C9E4682"));
  objc_msgSend(v9, "capabilityIsSupportedOnAnyWatch:supportedOnLocalDevice:", v10, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16[2] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v18[3] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v3, "initWithRequirementsByContext:", v13);

  return v14;
}

+ (id)_onboardingInitiationRequirementsForFeatureIdentifier:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[9];

  v15[8] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB66F8];
  v4 = a3;
  objc_msgSend(v3, "seedIsNotExpiredForFeatureWithIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v5;
  objc_msgSend(MEMORY[0x1E0CB66F8], "featureIsNotRemotelyDisabledWithIdentifier:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v6;
  objc_msgSend(MEMORY[0x1E0CB66F8], "profileIsNotFamilySetupPairingProfile");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15[2] = v7;
  objc_msgSend(MEMORY[0x1E0CB66F8], "notInStoreDemoMode");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15[3] = v8;
  objc_msgSend(MEMORY[0x1E0CB66F8], "activeRemoteDeviceIsPresentWhenRequiredForRegionAvailabilityOrDeviceCapabilityForFeatureWithIdentifier:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15[4] = v9;
  objc_msgSend(MEMORY[0x1E0CB66F8], "capabilityIsSupportedOnActiveRemoteDeviceForFeatureWithIdentifier:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v15[5] = v10;
  objc_msgSend(MEMORY[0x1E0CB66F8], "notAgeGatedForUserDefaultsKey:", *MEMORY[0x1E0CB51F8]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[6] = v11;
  objc_msgSend(MEMORY[0x1E0CB66F8], "healthAppIsNotHidden");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15[7] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)_onboardingPromotionRequirementsForFeatureIdentifier:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[13];

  v19[12] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB66F8];
  v4 = a3;
  objc_msgSend(v3, "seedIsNotExpiredForFeatureWithIdentifier:", v4);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v18;
  objc_msgSend(MEMORY[0x1E0CB66F8], "featureIsNotRemotelyDisabledWithIdentifier:", v4);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = v17;
  objc_msgSend(MEMORY[0x1E0CB66F8], "profileIsNotFamilySetupPairingProfile");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v19[2] = v16;
  objc_msgSend(MEMORY[0x1E0CB66F8], "notInStoreDemoMode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v19[3] = v5;
  objc_msgSend(MEMORY[0x1E0CB66F8], "activeRemoteDeviceIsPresentWhenRequiredForRegionAvailabilityOrDeviceCapabilityForFeatureWithIdentifier:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v19[4] = v6;
  objc_msgSend(MEMORY[0x1E0CB66F8], "capabilityIsSupportedOnActiveRemoteDeviceForFeatureWithIdentifier:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v19[5] = v7;
  objc_msgSend(MEMORY[0x1E0CB66F8], "countryIsSupportedOnActiveRemoteDeviceForFeatureWithIdentifier:isSupportedIfCountryListMissing:", v4, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v19[6] = v8;
  objc_msgSend(MEMORY[0x1E0CB66F8], "countryIsSupportedOnLocalDeviceForFeatureWithIdentifier:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v19[7] = v9;
  objc_msgSend(MEMORY[0x1E0CB66F8], "notAgeGatedForUserDefaultsKey:", *MEMORY[0x1E0CB51F8]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v19[8] = v10;
  objc_msgSend(MEMORY[0x1E0CB66F8], "healthAppIsNotHidden");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v19[9] = v11;
  objc_msgSend(MEMORY[0x1E0CB66F8], "wristDetectionIsEnabledForActiveWatch");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v19[10] = v12;
  objc_msgSend(MEMORY[0x1E0CB66F8], "heartRateIsEnabledInPrivacy");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v19[11] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (id)_usageRequirementsForFeatureIdentifier:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v16;
  void *v17;
  _QWORD v18[12];

  v18[11] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB66F8];
  v4 = a3;
  objc_msgSend(v3, "seedIsNotExpiredForFeatureWithIdentifier:", v4);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v17;
  objc_msgSend(MEMORY[0x1E0CB66F8], "featureIsNotRemotelyDisabledWithIdentifier:", v4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v16;
  objc_msgSend(MEMORY[0x1E0CB66F8], "profileIsNotFamilySetupPairingProfile");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v18[2] = v5;
  objc_msgSend(MEMORY[0x1E0CB66F8], "activeRemoteDeviceIsPresentWhenRequiredForRegionAvailabilityOrDeviceCapabilityForFeatureWithIdentifier:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v18[3] = v6;
  objc_msgSend(MEMORY[0x1E0CB66F8], "capabilityIsSupportedOnActiveRemoteDeviceForFeatureWithIdentifier:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v18[4] = v7;
  objc_msgSend(MEMORY[0x1E0CB66F8], "countryIsSupportedOnActiveRemoteDeviceForFeatureWithIdentifier:isSupportedIfCountryListMissing:", v4, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v18[5] = v8;
  objc_msgSend(MEMORY[0x1E0CB66F8], "countryIsSupportedOnLocalDeviceForFeatureWithIdentifier:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v18[6] = v9;
  objc_msgSend(MEMORY[0x1E0CB66F8], "notAgeGatedForUserDefaultsKey:", *MEMORY[0x1E0CB51F8]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v18[7] = v10;
  objc_msgSend(MEMORY[0x1E0CB66F8], "healthAppIsNotHidden");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v18[8] = v11;
  objc_msgSend(MEMORY[0x1E0CB66F8], "wristDetectionIsEnabledForActiveWatch");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v18[9] = v12;
  objc_msgSend(MEMORY[0x1E0CB66F8], "heartRateIsEnabledInPrivacy");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v18[10] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (id)_upgradePromotion
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0CB5018];
  objc_msgSend(a1, "_onboardingPromotionRequirementsForFeatureIdentifier:", *MEMORY[0x1E0CB5018]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB66F8], "onboardingRecordIsPresentForFeatureWithIdentifier:", *MEMORY[0x1E0CB5010]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v4;
  objc_msgSend(MEMORY[0x1E0CB66F8], "onboardingRecordIsNotPresentForFeatureWithIdentifier:", v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)_upgradeInitiation
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[5];

  v11[4] = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0CB5018];
  objc_msgSend(a1, "_onboardingInitiationRequirementsForFeatureIdentifier:", *MEMORY[0x1E0CB5018]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB66F8], "onboardingRecordIsPresentForFeatureWithIdentifier:", *MEMORY[0x1E0CB5010]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v4;
  objc_msgSend(MEMORY[0x1E0CB66F8], "onboardingRecordIsNotPresentForFeatureWithIdentifier:", v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v5;
  objc_msgSend(MEMORY[0x1E0CB66F8], "countryIsSupportedOnActiveRemoteDeviceForFeatureWithIdentifier:isSupportedIfCountryListMissing:", v2, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[2] = v6;
  objc_msgSend(MEMORY[0x1E0CB66F8], "countryIsSupportedOnLocalDeviceForFeatureWithIdentifier:", v2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[3] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)_settingsVisibilityRequirementsForFeatureIdentifier:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[5];

  v11[4] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB66F8];
  v4 = a3;
  objc_msgSend(v3, "profileIsNotFamilySetupPairingProfile");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v5;
  objc_msgSend(MEMORY[0x1E0CB66F8], "activeRemoteDeviceIsPresentWhenRequiredForRegionAvailabilityOrDeviceCapabilityForFeatureWithIdentifier:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v6;
  objc_msgSend(MEMORY[0x1E0CB66F8], "capabilityIsSupportedOnActiveRemoteDeviceForFeatureWithIdentifier:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v11[2] = v7;
  objc_msgSend(MEMORY[0x1E0CB66F8], "healthAppIsNotHidden");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[3] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)_settingsUserInteractionEnabledForFeatureIdentifier:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[6];

  v12[5] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB66F8];
  v4 = a3;
  objc_msgSend(v3, "profileIsNotFamilySetupPairingProfile");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB66F8], "heartRateIsEnabledInPrivacy", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v6;
  objc_msgSend(MEMORY[0x1E0CB66F8], "featureIsNotRemotelyDisabledWithIdentifier:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[2] = v7;
  objc_msgSend(MEMORY[0x1E0CB66F8], "seedIsNotExpiredForFeatureWithIdentifier:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v12[3] = v8;
  objc_msgSend(MEMORY[0x1E0CB66F8], "healthAppIsNotHidden");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[4] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

@end
