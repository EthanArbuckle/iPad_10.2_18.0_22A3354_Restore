@implementation HKHRCardioFitnessFeatureAvailabilityRequirements

+ (id)requirementSet
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v26[20];
  _QWORD v27[22];

  v27[20] = *MEMORY[0x1E0C80C00];
  v20 = objc_alloc(MEMORY[0x1E0CB66F0]);
  v26[0] = *MEMORY[0x1E0CB4E40];
  objc_msgSend((id)objc_opt_class(), "_backgroundDelivery");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v25;
  v26[1] = *MEMORY[0x1E0CB4E70];
  objc_msgSend((id)objc_opt_class(), "_onboardingInitiation");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v27[1] = v24;
  v26[2] = *MEMORY[0x1E0CB4E88];
  objc_msgSend((id)objc_opt_class(), "_promotion");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v27[2] = v23;
  v26[3] = *MEMORY[0x1E0CB4E38];
  objc_msgSend((id)objc_opt_class(), "_advertiseableFeature");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v27[3] = v22;
  v26[4] = *MEMORY[0x1E0CB4ED0];
  objc_msgSend((id)objc_opt_class(), "_usage");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v27[4] = v21;
  v26[5] = *MEMORY[0x1E0CB4E68];
  objc_msgSend((id)objc_opt_class(), "_notInPregnancyMode");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v27[5] = v19;
  v26[6] = *MEMORY[0x1E0CB4E98];
  objc_msgSend((id)objc_opt_class(), "_pregnancyAdjustmentEligibility");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v27[6] = v18;
  v26[7] = *MEMORY[0x1E0CB4E90];
  objc_msgSend((id)objc_opt_class(), "_postPregnancyAdjustmentEligibility");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v27[7] = v17;
  v26[8] = CFSTR("CardioFitnessNotification");
  objc_msgSend((id)objc_opt_class(), "_notificationGeneration");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v27[8] = v16;
  v26[9] = CFSTR("CardioFitnessClassification");
  objc_msgSend((id)objc_opt_class(), "_classification");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v27[9] = v15;
  v26[10] = CFSTR("CardioFitnessHealthChecklistSettingsFooter");
  objc_msgSend((id)objc_opt_class(), "_healthChecklistSettingsFooter");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v27[10] = v14;
  v26[11] = CFSTR("CardioFitnessBridgeSettingsVisibility");
  objc_msgSend((id)objc_opt_class(), "_bridgeSettingsVisibility");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v27[11] = v13;
  v26[12] = CFSTR("CardioFitnessBridgeOnboardingVisibility");
  objc_msgSend((id)objc_opt_class(), "_bridgeOnboardingVisibility");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v27[12] = v2;
  v26[13] = CFSTR("CardioFitnessBridgeOnboardingEnablement");
  objc_msgSend((id)objc_opt_class(), "_bridgeOnboardingEnablement");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v27[13] = v3;
  v26[14] = CFSTR("CardioFitnessBridgeNotificationsEnablement");
  objc_msgSend((id)objc_opt_class(), "_bridgeNotificationsEnablement");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v27[14] = v4;
  v26[15] = CFSTR("CardioFitnessBridgeNotificationsFooter");
  objc_msgSend((id)objc_opt_class(), "_bridgeNotificationsFooter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v27[15] = v5;
  v26[16] = CFSTR("CardioFitnessNanoSettingsVisibility");
  objc_msgSend((id)objc_opt_class(), "_nanoSettingsVisibility");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v27[16] = v6;
  v26[17] = CFSTR("CardioFitnessNanoSettingsEnablement");
  objc_msgSend((id)objc_opt_class(), "_nanoSettingsEnablement");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v27[17] = v7;
  v26[18] = CFSTR("CardioFitnessOnboardedHealthChecklist");
  objc_msgSend((id)objc_opt_class(), "_onboardedHealthChecklist");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v27[18] = v8;
  v26[19] = CFSTR("CardioFitnessNotOnboardedHealthChecklist");
  objc_msgSend((id)objc_opt_class(), "_notOnboardedHealthChecklist");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v27[19] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, v26, 20);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v20, "initWithRequirementsByContext:", v10);

  return v11;
}

+ (id)backgroundDelivery
{
  void *v3;
  void *v4;

  objc_msgSend(a1, "_backgroundDelivery");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_requirementIdentifiersForRequirements:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)onboardingInitiationRequirementIdentifiers
{
  void *v3;
  void *v4;

  objc_msgSend(a1, "_onboardingInitiation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_requirementIdentifiersForRequirements:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)promotionRequirementIdentifiers
{
  void *v3;
  void *v4;

  objc_msgSend(a1, "_promotion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_requirementIdentifiersForRequirements:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)usageRequirementIdentifiers
{
  void *v3;
  void *v4;

  objc_msgSend(a1, "_usage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_requirementIdentifiersForRequirements:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)notificationGeneration
{
  void *v3;
  void *v4;

  objc_msgSend(a1, "_notificationGeneration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_requirementIdentifiersForRequirements:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)classificationGeneration
{
  void *v3;
  void *v4;

  objc_msgSend(a1, "_classification");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_requirementIdentifiersForRequirements:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)healthChecklistSettingsFooter
{
  void *v3;
  void *v4;

  objc_msgSend(a1, "_healthChecklistSettingsFooter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_requirementIdentifiersForRequirements:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)bridgeSettingsVisibilityRequirementIdentifiers
{
  void *v3;
  void *v4;

  objc_msgSend(a1, "_bridgeSettingsVisibility");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_requirementIdentifiersForRequirements:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)bridgeOnboardingVisibilityRequirementIdentifiers
{
  void *v3;
  void *v4;

  objc_msgSend(a1, "_bridgeOnboardingVisibility");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_requirementIdentifiersForRequirements:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)bridgeOnboardingEnablementRequirementIdentifiers
{
  void *v3;
  void *v4;

  objc_msgSend(a1, "_bridgeOnboardingEnablement");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_requirementIdentifiersForRequirements:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)bridgeNotificationsEnablementRequirementIdentifiers
{
  void *v3;
  void *v4;

  objc_msgSend(a1, "_bridgeNotificationsEnablement");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_requirementIdentifiersForRequirements:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)bridgeNotificationsFooterRequirementIdentifiers
{
  void *v3;
  void *v4;

  objc_msgSend(a1, "_bridgeNotificationsFooter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_requirementIdentifiersForRequirements:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)nanoSettingsVisibilityRequirementIdentifiers
{
  void *v3;
  void *v4;

  objc_msgSend(a1, "_nanoSettingsVisibility");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_requirementIdentifiersForRequirements:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)nanoSettingsEnablementRequirementIdentifiers
{
  void *v3;
  void *v4;

  objc_msgSend(a1, "_nanoSettingsEnablement");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_requirementIdentifiersForRequirements:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)notInPregnancyModeRequirementIdentifiers
{
  void *v3;
  void *v4;

  objc_msgSend(a1, "_notInPregnancyMode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_requirementIdentifiersForRequirements:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)_backgroundDelivery
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB66F8];
  objc_msgSend((id)objc_opt_class(), "_featureIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "defaultOnboardingEligibilityRequirementsForFeatureIdentifier:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)_onboardingInitiation
{
  void *v2;
  void *v3;
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
  void *v15;
  void *v16;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v24[11];

  v24[10] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB66F8], "profileIsNotFamilySetupPairingProfile");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v23;
  objc_msgSend(MEMORY[0x1E0CB66F8], "notAgeGatedForUserDefaultsKey:", *MEMORY[0x1E0CB51E8]);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v24[1] = v22;
  v2 = (void *)MEMORY[0x1E0CB66F8];
  objc_msgSend((id)objc_opt_class(), "_featureIdentifier");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "capabilityIsSupportedOnActiveWatchForFeatureWithIdentifier:supportedOnLocalDevice:", v21, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v24[2] = v20;
  objc_msgSend(MEMORY[0x1E0CB66F8], "heartRateIsEnabledInPrivacy");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v24[3] = v19;
  objc_msgSend(MEMORY[0x1E0CB66F8], "healthAppIsNotHidden");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v24[4] = v18;
  objc_msgSend(MEMORY[0x1E0CB66F8], "watchAppIsInstalledForBundleIdentifier:", CFSTR("com.apple.HeartRate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v24[5] = v3;
  v4 = (void *)MEMORY[0x1E0CB66F8];
  objc_msgSend((id)objc_opt_class(), "_featureIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "onboardingRecordIsPresentForFeatureWithIdentifier:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v24[6] = v6;
  v7 = (void *)MEMORY[0x1E0CB66F8];
  objc_msgSend((id)objc_opt_class(), "_featureIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "countryIsSupportedOnLocalDeviceForFeatureWithIdentifier:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v24[7] = v9;
  v10 = (void *)MEMORY[0x1E0CB66F8];
  objc_msgSend((id)objc_opt_class(), "_featureIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "countryIsSupportedOnActiveRemoteDeviceForFeatureWithIdentifier:isSupportedIfCountryListMissing:", v11, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v24[8] = v12;
  v13 = (void *)MEMORY[0x1E0CB66F8];
  objc_msgSend((id)objc_opt_class(), "_featureIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "onboardingNotAcknowledgedWithIdentifier:settingsKey:", v14, CFSTR("CardioFitnessFeatureSettingsKeyNotificationDetailsEntered"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v24[9] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 10);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

+ (id)_promotion
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend((id)objc_opt_class(), "_onboardingInitiation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  objc_msgSend(a1, "_notInPregnancyMode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObjectsFromArray:", v5);

  return v4;
}

+ (id)_advertiseableFeature
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)objc_opt_class(), "_onboardingInitiation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  objc_msgSend(v4, "hk_removeObjectsPassingTest:", &__block_literal_global_1);
  objc_msgSend(MEMORY[0x1E0CB66F8], "ageIsPresent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v5;
  v6 = (void *)MEMORY[0x1E0CB66F8];
  objc_msgSend((id)objc_opt_class(), "_featureIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "featureIsOffWithIdentifier:isOffIfSettingIsAbsent:", v7, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObjectsFromArray:", v9);

  objc_msgSend(a1, "_notInPregnancyMode");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObjectsFromArray:", v10);

  return v4;
}

uint64_t __73__HKHRCardioFitnessFeatureAvailabilityRequirements__advertiseableFeature__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  uint64_t v4;
  void *v5;

  v2 = a2;
  objc_msgSend((id)objc_opt_class(), "requirementIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0CB4FA0]) & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "requirementIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0CB4FA8]);

  }
  return v4;
}

+ (id)_usage
{
  void *v2;
  void *v3;
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
  void *v15;
  void *v16;
  void *v17;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v27[13];

  v27[11] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB66F8], "healthAppIsNotHidden");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v26;
  objc_msgSend(MEMORY[0x1E0CB66F8], "watchAppIsInstalledForBundleIdentifier:", CFSTR("com.apple.HeartRate"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v27[1] = v25;
  objc_msgSend(MEMORY[0x1E0CB66F8], "notAgeGatedForUserDefaultsKey:", *MEMORY[0x1E0CB7518]);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v27[2] = v24;
  v2 = (void *)MEMORY[0x1E0CB66F8];
  objc_msgSend((id)objc_opt_class(), "_featureIdentifier");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "countryIsSupportedOnLocalDeviceForFeatureWithIdentifier:", v23);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v27[3] = v22;
  v3 = (void *)MEMORY[0x1E0CB66F8];
  objc_msgSend((id)objc_opt_class(), "_featureIdentifier");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "countryIsSupportedOnActiveRemoteDeviceForFeatureWithIdentifier:isSupportedIfCountryListMissing:", v21, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v27[4] = v20;
  v4 = (void *)MEMORY[0x1E0CB66F8];
  objc_msgSend((id)objc_opt_class(), "_featureIdentifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "capabilityIsSupportedOnActiveWatchForFeatureWithIdentifier:supportedOnLocalDevice:", v19, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v27[5] = v5;
  objc_msgSend(MEMORY[0x1E0CB66F8], "ageIsPresent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v27[6] = v6;
  objc_msgSend(MEMORY[0x1E0CB66F8], "heartRateIsEnabledInPrivacy");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v27[7] = v7;
  v8 = (void *)MEMORY[0x1E0CB66F8];
  objc_msgSend((id)objc_opt_class(), "_featureIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "onboardingRecordIsPresentForFeatureWithIdentifier:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v27[8] = v10;
  v11 = (void *)MEMORY[0x1E0CB66F8];
  objc_msgSend((id)objc_opt_class(), "_featureIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "onboardingAcknowledgedWithIdentifier:settingsKey:", v12, CFSTR("CardioFitnessFeatureSettingsKeyNotificationDetailsEntered"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v27[9] = v13;
  v14 = (void *)MEMORY[0x1E0CB66F8];
  objc_msgSend((id)objc_opt_class(), "_featureIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "featureIsOnWithIdentifier:isOnIfSettingIsAbsent:", v15, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v27[10] = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 11);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

+ (id)_notificationGeneration
{
  void *v2;
  void *v3;

  objc_msgSend((id)objc_opt_class(), "_usage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "mutableCopy");

  return v3;
}

+ (id)_classification
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[5];

  v12[4] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0CB66F8];
  objc_msgSend((id)objc_opt_class(), "_featureIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "onboardingRecordIsPresentForFeatureWithIdentifier:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v4;
  v5 = (void *)MEMORY[0x1E0CB66F8];
  objc_msgSend((id)objc_opt_class(), "_featureIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "countryIsSupportedOnLocalDeviceForFeatureWithIdentifier:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v7;
  objc_msgSend(MEMORY[0x1E0CB66F8], "ageIsPresent");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[2] = v8;
  objc_msgSend(MEMORY[0x1E0CB66F8], "notAgeGatedForUserDefaultsKey:", *MEMORY[0x1E0CB51E8]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[3] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)_healthChecklistSettingsFooter
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)objc_opt_class(), "_usage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "mutableCopy");

  objc_msgSend(MEMORY[0x1E0CB66F8], "wristDetectionIsEnabledForActiveWatch");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v5);

  return v3;
}

+ (id)_bridgeSettingsVisibility
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[6];

  v12[5] = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)objc_opt_class(), "_featureIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB66F8], "onboardingRecordIsPresentForFeatureWithIdentifier:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB66F8], "notAgeGatedForUserDefaultsKey:", *MEMORY[0x1E0CB7520], v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v4;
  v5 = (void *)MEMORY[0x1E0CB66F8];
  objc_msgSend((id)objc_opt_class(), "_featureIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "capabilityIsSupportedOnActiveWatchForFeatureWithIdentifier:supportedOnLocalDevice:", v6, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[2] = v7;
  objc_msgSend(MEMORY[0x1E0CB66F8], "healthAppIsNotHidden");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[3] = v8;
  objc_msgSend(MEMORY[0x1E0CB66F8], "watchAppIsInstalledForBundleIdentifier:", CFSTR("com.apple.HeartRate"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[4] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)_bridgeOnboardingVisibility
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0CB66F8];
  objc_msgSend((id)objc_opt_class(), "_featureIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "onboardingNotAcknowledgedWithIdentifier:settingsKey:", v3, CFSTR("CardioFitnessFeatureSettingsKeyNotificationDetailsEntered"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)_bridgeOnboardingEnablement
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[4];

  v11[3] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0CB66F8];
  objc_msgSend((id)objc_opt_class(), "_featureIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "countryIsSupportedOnLocalDeviceForFeatureWithIdentifier:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0CB66F8];
  objc_msgSend((id)objc_opt_class(), "_featureIdentifier", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "countryIsSupportedOnActiveRemoteDeviceForFeatureWithIdentifier:isSupportedIfCountryListMissing:", v6, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v7;
  objc_msgSend(MEMORY[0x1E0CB66F8], "heartRateIsEnabledInPrivacy");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[2] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)_bridgeNotificationsEnablement
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[6];

  v13[5] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB66F8], "notAgeGatedForUserDefaultsKey:", *MEMORY[0x1E0CB51E8]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB66F8], "ageIsPresent", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v3;
  v4 = (void *)MEMORY[0x1E0CB66F8];
  objc_msgSend((id)objc_opt_class(), "_featureIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "countryIsSupportedOnLocalDeviceForFeatureWithIdentifier:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13[2] = v6;
  v7 = (void *)MEMORY[0x1E0CB66F8];
  objc_msgSend((id)objc_opt_class(), "_featureIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "countryIsSupportedOnActiveRemoteDeviceForFeatureWithIdentifier:isSupportedIfCountryListMissing:", v8, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[3] = v9;
  objc_msgSend(MEMORY[0x1E0CB66F8], "heartRateIsEnabledInPrivacy");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[4] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)_bridgeNotificationsFooter
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)objc_opt_class(), "_bridgeNotificationsEnablement");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "mutableCopy");

  objc_msgSend(MEMORY[0x1E0CB66F8], "wristDetectionIsEnabledForActiveWatch");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v5);

  return v3;
}

+ (id)_nanoSettingsVisibility
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend((id)objc_opt_class(), "_notificationGeneration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "mutableCopy");

  v4 = (void *)MEMORY[0x1E0CB66F8];
  objc_msgSend((id)objc_opt_class(), "_featureIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "featureIsOnWithIdentifier:isOnIfSettingIsAbsent:", v5, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObject:", v6);

  objc_msgSend(MEMORY[0x1E0CB66F8], "ageIsPresent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObject:", v7);

  objc_msgSend(MEMORY[0x1E0CB66F8], "notAgeGatedForUserDefaultsKey:", *MEMORY[0x1E0CB51E8]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObject:", v8);

  objc_msgSend(MEMORY[0x1E0CB66F8], "notAgeGatedForUserDefaultsKey:", *MEMORY[0x1E0CB7520]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v9);

  return v3;
}

+ (id)_nanoSettingsEnablement
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB66F8], "notAgeGatedForUserDefaultsKey:", *MEMORY[0x1E0CB51E8]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  objc_msgSend(MEMORY[0x1E0CB66F8], "ageIsPresent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)_onboardedHealthChecklist
{
  void *v2;
  void *v3;
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
  void *v15;
  void *v16;
  void *v17;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v27[13];

  v27[11] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB66F8], "healthAppIsNotHidden");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v26;
  objc_msgSend(MEMORY[0x1E0CB66F8], "watchAppIsInstalledForBundleIdentifier:", CFSTR("com.apple.HeartRate"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v27[1] = v25;
  objc_msgSend(MEMORY[0x1E0CB66F8], "notAgeGatedForUserDefaultsKey:", *MEMORY[0x1E0CB7518]);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v27[2] = v24;
  v2 = (void *)MEMORY[0x1E0CB66F8];
  objc_msgSend((id)objc_opt_class(), "_featureIdentifier");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "countryIsSupportedOnLocalDeviceForFeatureWithIdentifier:", v23);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v27[3] = v22;
  v3 = (void *)MEMORY[0x1E0CB66F8];
  objc_msgSend((id)objc_opt_class(), "_featureIdentifier");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "countryIsSupportedOnActiveRemoteDeviceForFeatureWithIdentifier:isSupportedIfCountryListMissing:", v21, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v27[4] = v20;
  v4 = (void *)MEMORY[0x1E0CB66F8];
  objc_msgSend((id)objc_opt_class(), "_featureIdentifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "capabilityIsSupportedOnActiveWatchForFeatureWithIdentifier:supportedOnLocalDevice:", v19, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v27[5] = v5;
  objc_msgSend(MEMORY[0x1E0CB66F8], "ageIsPresent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v27[6] = v6;
  objc_msgSend(MEMORY[0x1E0CB66F8], "heartRateIsEnabledInPrivacy");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v27[7] = v7;
  v8 = (void *)MEMORY[0x1E0CB66F8];
  objc_msgSend((id)objc_opt_class(), "_featureIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "onboardingRecordIsPresentForFeatureWithIdentifier:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v27[8] = v10;
  v11 = (void *)MEMORY[0x1E0CB66F8];
  objc_msgSend((id)objc_opt_class(), "_featureIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "onboardingAcknowledgedWithIdentifier:settingsKey:", v12, CFSTR("CardioFitnessFeatureSettingsKeyNotificationDetailsEntered"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v27[9] = v13;
  v14 = (void *)MEMORY[0x1E0CB66F8];
  objc_msgSend((id)objc_opt_class(), "_featureIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "featureIsOnWithIdentifier:isOnIfSettingIsAbsent:", v15, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v27[10] = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 11);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

+ (id)_notOnboardedHealthChecklist
{
  void *v2;
  void *v3;
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
  void *v15;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[9];

  v20[8] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB66F8], "healthAppIsNotHidden");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v19;
  objc_msgSend(MEMORY[0x1E0CB66F8], "watchAppIsInstalledForBundleIdentifier:", CFSTR("com.apple.HeartRate"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = v18;
  objc_msgSend(MEMORY[0x1E0CB66F8], "notAgeGatedForUserDefaultsKey:", *MEMORY[0x1E0CB7518]);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v20[2] = v17;
  v2 = (void *)MEMORY[0x1E0CB66F8];
  objc_msgSend((id)objc_opt_class(), "_featureIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "countryIsSupportedOnLocalDeviceForFeatureWithIdentifier:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v20[3] = v4;
  v5 = (void *)MEMORY[0x1E0CB66F8];
  objc_msgSend((id)objc_opt_class(), "_featureIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "countryIsSupportedOnActiveRemoteDeviceForFeatureWithIdentifier:isSupportedIfCountryListMissing:", v6, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v20[4] = v7;
  v8 = (void *)MEMORY[0x1E0CB66F8];
  objc_msgSend((id)objc_opt_class(), "_featureIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "capabilityIsSupportedOnActiveWatchForFeatureWithIdentifier:supportedOnLocalDevice:", v9, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v20[5] = v10;
  objc_msgSend(MEMORY[0x1E0CB66F8], "heartRateIsEnabledInPrivacy");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v20[6] = v11;
  v12 = (void *)MEMORY[0x1E0CB66F8];
  objc_msgSend((id)objc_opt_class(), "_featureIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "onboardingRecordIsPresentForFeatureWithIdentifier:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v20[7] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 8);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

+ (id)_notInPregnancyMode
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB66F8], "isNotInPostPregnancy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  objc_msgSend(MEMORY[0x1E0CB66F8], "noOngoingPregnancy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)_pregnancyAdjustmentEligibility
{
  void *v2;
  void *v3;
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
  void *v15;
  void *v16;
  void *v17;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v27[13];

  v27[11] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB66F8], "healthAppIsNotHidden");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v26;
  objc_msgSend(MEMORY[0x1E0CB66F8], "watchAppIsInstalledForBundleIdentifier:", CFSTR("com.apple.HeartRate"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v27[1] = v25;
  objc_msgSend(MEMORY[0x1E0CB66F8], "notAgeGatedForUserDefaultsKey:", *MEMORY[0x1E0CB7518]);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v27[2] = v24;
  v2 = (void *)MEMORY[0x1E0CB66F8];
  objc_msgSend((id)objc_opt_class(), "_featureIdentifier");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "countryIsSupportedOnLocalDeviceForFeatureWithIdentifier:", v23);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v27[3] = v22;
  v3 = (void *)MEMORY[0x1E0CB66F8];
  objc_msgSend((id)objc_opt_class(), "_featureIdentifier");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "countryIsSupportedOnActiveRemoteDeviceForFeatureWithIdentifier:isSupportedIfCountryListMissing:", v21, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v27[4] = v20;
  v4 = (void *)MEMORY[0x1E0CB66F8];
  objc_msgSend((id)objc_opt_class(), "_featureIdentifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "capabilityIsSupportedOnActiveWatchForFeatureWithIdentifier:supportedOnLocalDevice:", v19, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v27[5] = v5;
  objc_msgSend(MEMORY[0x1E0CB66F8], "ageIsPresent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v27[6] = v6;
  objc_msgSend(MEMORY[0x1E0CB66F8], "heartRateIsEnabledInPrivacy");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v27[7] = v7;
  v8 = (void *)MEMORY[0x1E0CB66F8];
  objc_msgSend((id)objc_opt_class(), "_featureIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "onboardingRecordIsPresentForFeatureWithIdentifier:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v27[8] = v10;
  v11 = (void *)MEMORY[0x1E0CB66F8];
  objc_msgSend((id)objc_opt_class(), "_featureIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "onboardingAcknowledgedWithIdentifier:settingsKey:", v12, CFSTR("CardioFitnessFeatureSettingsKeyNotificationDetailsEntered"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v27[9] = v13;
  v14 = (void *)MEMORY[0x1E0CB66F8];
  objc_msgSend((id)objc_opt_class(), "_featureIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "featureIsOnWithIdentifier:isOnIfSettingIsAbsent:", v15, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v27[10] = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 11);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

+ (id)_postPregnancyAdjustmentEligibility
{
  void *v2;
  void *v3;
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
  void *v15;
  void *v16;
  void *v17;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v27[13];

  v27[11] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB66F8], "healthAppIsNotHidden");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v26;
  objc_msgSend(MEMORY[0x1E0CB66F8], "watchAppIsInstalledForBundleIdentifier:", CFSTR("com.apple.HeartRate"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v27[1] = v25;
  objc_msgSend(MEMORY[0x1E0CB66F8], "notAgeGatedForUserDefaultsKey:", *MEMORY[0x1E0CB7518]);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v27[2] = v24;
  v2 = (void *)MEMORY[0x1E0CB66F8];
  objc_msgSend((id)objc_opt_class(), "_featureIdentifier");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "countryIsSupportedOnLocalDeviceForFeatureWithIdentifier:", v23);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v27[3] = v22;
  v3 = (void *)MEMORY[0x1E0CB66F8];
  objc_msgSend((id)objc_opt_class(), "_featureIdentifier");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "countryIsSupportedOnActiveRemoteDeviceForFeatureWithIdentifier:isSupportedIfCountryListMissing:", v21, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v27[4] = v20;
  v4 = (void *)MEMORY[0x1E0CB66F8];
  objc_msgSend((id)objc_opt_class(), "_featureIdentifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "capabilityIsSupportedOnActiveWatchForFeatureWithIdentifier:supportedOnLocalDevice:", v19, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v27[5] = v5;
  objc_msgSend(MEMORY[0x1E0CB66F8], "ageIsPresent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v27[6] = v6;
  objc_msgSend(MEMORY[0x1E0CB66F8], "heartRateIsEnabledInPrivacy");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v27[7] = v7;
  v8 = (void *)MEMORY[0x1E0CB66F8];
  objc_msgSend((id)objc_opt_class(), "_featureIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "onboardingRecordIsPresentForFeatureWithIdentifier:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v27[8] = v10;
  v11 = (void *)MEMORY[0x1E0CB66F8];
  objc_msgSend((id)objc_opt_class(), "_featureIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "onboardingAcknowledgedWithIdentifier:settingsKey:", v12, CFSTR("CardioFitnessFeatureSettingsKeyNotificationDetailsEntered"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v27[9] = v13;
  v14 = (void *)MEMORY[0x1E0CB66F8];
  objc_msgSend((id)objc_opt_class(), "_featureIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "featureIsOffWithIdentifier:isOffIfSettingIsAbsent:", v15, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v27[10] = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 11);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

+ (id)_featureIdentifier
{
  return (id)*MEMORY[0x1E0CB5000];
}

+ (id)_requirementIdentifiersForRequirements:(id)a3
{
  return (id)objc_msgSend(a3, "hk_map:", &__block_literal_global_216);
}

uint64_t __91__HKHRCardioFitnessFeatureAvailabilityRequirements__requirementIdentifiersForRequirements___block_invoke()
{
  return objc_msgSend((id)objc_opt_class(), "requirementIdentifier");
}

@end
