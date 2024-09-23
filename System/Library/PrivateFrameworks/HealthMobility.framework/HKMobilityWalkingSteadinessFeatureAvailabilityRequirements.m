@implementation HKMobilityWalkingSteadinessFeatureAvailabilityRequirements

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
  id v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[2];
  _QWORD v22[13];
  _QWORD v23[15];

  v23[13] = *MEMORY[0x1E0C80C00];
  v17 = objc_alloc(MEMORY[0x1E0CB66F0]);
  v22[0] = *MEMORY[0x1E0CB4E40];
  objc_msgSend((id)objc_opt_class(), "_backgroundDelivery");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v20;
  v22[1] = *MEMORY[0x1E0CB4E70];
  objc_msgSend((id)objc_opt_class(), "_onboardingInitiation");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v23[1] = v19;
  v22[2] = *MEMORY[0x1E0CB4E88];
  objc_msgSend((id)objc_opt_class(), "_promotion");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v23[2] = v18;
  v22[3] = *MEMORY[0x1E0CB4E38];
  objc_msgSend((id)objc_opt_class(), "_advertisableFeature");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v23[3] = v16;
  v22[4] = *MEMORY[0x1E0CB4E68];
  objc_msgSend(MEMORY[0x1E0CB66F8], "isNotInPostPregnancy");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v15;
  objc_msgSend(MEMORY[0x1E0CB66F8], "noOngoingPregnancy");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v21[1] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v23[4] = v13;
  v22[5] = *MEMORY[0x1E0CB4E98];
  objc_msgSend((id)objc_opt_class(), "_pregnancyAdjustmentEligibility");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v23[5] = v2;
  v22[6] = CFSTR("WalkingSteadinessEventSubmission");
  objc_msgSend((id)objc_opt_class(), "_eventSubmission");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v23[6] = v3;
  v22[7] = CFSTR("WalkingSteadinessNotificationSettingsVisibility");
  objc_msgSend((id)objc_opt_class(), "_notificationSettingsVisibility");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v23[7] = v4;
  v22[8] = CFSTR("WalkingSteadinessClassification");
  objc_msgSend((id)objc_opt_class(), "_classification");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v23[8] = v5;
  v22[9] = CFSTR("WalkingSteadinessOnboardedHealthChecklist");
  objc_msgSend((id)objc_opt_class(), "_onboardedHealthChecklist");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v23[9] = v6;
  v22[10] = CFSTR("WalkingSteadinessNotOnboardedHealthChecklist");
  objc_msgSend((id)objc_opt_class(), "_notOnboardedHealthChecklist");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v23[10] = v7;
  v22[11] = CFSTR("WalkingSteadinessPromotionFeatureTag");
  objc_msgSend((id)objc_opt_class(), "_promotionFeatureTag");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v23[11] = v8;
  v22[12] = CFSTR("WalkingSteadinessShouldNotShowPregnancyContent");
  objc_msgSend((id)objc_opt_class(), "_notInPregnancyMode");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v23[12] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 13);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v17, "initWithRequirementsByContext:", v10);

  return v11;
}

+ (id)backgroundDeliveryIdentifiers
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

+ (id)eventSubmission
{
  void *v3;
  void *v4;

  objc_msgSend(a1, "_eventSubmission");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_requirementIdentifiersForRequirements:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)notificationSettingsVisibility
{
  void *v3;
  void *v4;

  objc_msgSend(a1, "_notificationSettingsVisibility");
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

+ (id)promotionFeatureTagRequirementIdentifiers
{
  void *v3;
  void *v4;

  objc_msgSend(a1, "_promotionFeatureTag");
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
  void *v17;
  void *v18;
  _QWORD v19[8];

  v19[7] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB66F8], "profileIsNotFamilySetupPairingProfile");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v18;
  objc_msgSend(MEMORY[0x1E0CB66F8], "walkingSteadinessCapabilityIsSupportedOnLocalDevice");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = v17;
  objc_msgSend(MEMORY[0x1E0CB66F8], "healthAppIsNotHidden");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v19[2] = v2;
  v3 = (void *)MEMORY[0x1E0CB66F8];
  objc_msgSend((id)objc_opt_class(), "_featureIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "onboardingRecordIsPresentForFeatureWithIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v19[3] = v5;
  v6 = (void *)MEMORY[0x1E0CB66F8];
  objc_msgSend((id)objc_opt_class(), "_featureIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "countryCodeIsPresentForFeatureWithIdentifier:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v19[4] = v8;
  v9 = (void *)MEMORY[0x1E0CB66F8];
  objc_msgSend((id)objc_opt_class(), "_featureIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "countryIsSupportedOnLocalDeviceForFeatureWithIdentifier:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v19[5] = v11;
  v12 = (void *)MEMORY[0x1E0CB66F8];
  objc_msgSend((id)objc_opt_class(), "_featureIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "onboardingNotAcknowledgedWithIdentifier:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v19[6] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 7);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

+ (id)_promotion
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)objc_opt_class(), "_onboardingInitiation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "mutableCopy");

  objc_msgSend(MEMORY[0x1E0CB66F8], "fitnessTrackingIsEnabledInPrivacy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v4;
  objc_msgSend(MEMORY[0x1E0CB66F8], "notAgeGatedForUserDefaultsKey:", *MEMORY[0x1E0CB7548]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v6);

  return v3;
}

+ (id)_promotionFeatureTag
{
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB66F8], "heightIsPresent");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)_eventSubmission
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
  void *v24;
  _QWORD v25[13];

  v25[11] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0CB66F8];
  objc_msgSend((id)objc_opt_class(), "_featureIdentifier");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "onboardingRecordIsPresentForFeatureWithIdentifier:", v24);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v23;
  v3 = (void *)MEMORY[0x1E0CB66F8];
  objc_msgSend((id)objc_opt_class(), "_featureIdentifier");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "onboardingAcknowledgedWithIdentifier:", v22);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v25[1] = v21;
  v4 = (void *)MEMORY[0x1E0CB66F8];
  objc_msgSend((id)objc_opt_class(), "_featureIdentifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "featureIsOnWithIdentifier:isOnIfSettingIsAbsent:", v20, 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v25[2] = v19;
  v5 = (void *)MEMORY[0x1E0CB66F8];
  objc_msgSend((id)objc_opt_class(), "_featureIdentifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "countryCodeIsPresentForFeatureWithIdentifier:", v18);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v25[3] = v6;
  v7 = (void *)MEMORY[0x1E0CB66F8];
  objc_msgSend((id)objc_opt_class(), "_featureIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "countryIsSupportedOnLocalDeviceForFeatureWithIdentifier:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v25[4] = v9;
  objc_msgSend(MEMORY[0x1E0CB66F8], "walkingSteadinessCapabilityIsSupportedOnLocalDevice");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v25[5] = v10;
  objc_msgSend(MEMORY[0x1E0CB66F8], "ageIsPresent");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v25[6] = v11;
  objc_msgSend(MEMORY[0x1E0CB66F8], "heightIsPresent");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v25[7] = v12;
  objc_msgSend(MEMORY[0x1E0CB66F8], "notAgeGatedForUserDefaultsKey:", *MEMORY[0x1E0CB7548]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v25[8] = v13;
  objc_msgSend(MEMORY[0x1E0CB66F8], "healthAppIsNotHidden");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v25[9] = v14;
  objc_msgSend(MEMORY[0x1E0CB66F8], "fitnessTrackingIsEnabledInPrivacy");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v25[10] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 11);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

+ (id)_advertisableFeature
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
  _QWORD v13[3];
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)objc_opt_class(), "_onboardingInitiation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "mutableCopy");

  objc_msgSend(MEMORY[0x1E0CB66F8], "fitnessTrackingIsEnabledInPrivacy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v5);

  objc_msgSend(v3, "hk_removeObjectsPassingTest:", &__block_literal_global_1);
  objc_msgSend(MEMORY[0x1E0CB66F8], "ageIsPresent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v6;
  objc_msgSend(MEMORY[0x1E0CB66F8], "heightIsPresent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v7;
  v8 = (void *)MEMORY[0x1E0CB66F8];
  objc_msgSend((id)objc_opt_class(), "_featureIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "featureIsOffWithIdentifier:isOffIfSettingIsAbsent:", v9, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[2] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v11);

  return v3;
}

uint64_t __82__HKMobilityWalkingSteadinessFeatureAvailabilityRequirements__advertisableFeature__block_invoke(uint64_t a1, void *a2)
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

+ (id)_notificationSettingsVisibility
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)objc_opt_class(), "_eventSubmission");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "mutableCopy");

  objc_msgSend(v3, "hk_removeObjectsPassingTest:", &__block_literal_global_201);
  objc_msgSend(MEMORY[0x1E0CB66F8], "notificationAuthorizedWithBundleIdentifier:", *MEMORY[0x1E0CB7630]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v5);

  return v3;
}

uint64_t __93__HKMobilityWalkingSteadinessFeatureAvailabilityRequirements__notificationSettingsVisibility__block_invoke()
{
  void *v0;
  uint64_t v1;

  objc_msgSend((id)objc_opt_class(), "requirementIdentifier");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "isEqualToString:", *MEMORY[0x1E0CB4F58]);

  return v1;
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
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v26[14];

  v26[12] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB66F8], "healthAppIsNotHidden");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v25;
  v2 = (void *)MEMORY[0x1E0CB66F8];
  objc_msgSend((id)objc_opt_class(), "_featureIdentifier");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "onboardingRecordIsPresentForFeatureWithIdentifier:", v24);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v26[1] = v23;
  v3 = (void *)MEMORY[0x1E0CB66F8];
  objc_msgSend((id)objc_opt_class(), "_featureIdentifier");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "countryCodeIsPresentForFeatureWithIdentifier:", v22);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v26[2] = v21;
  v4 = (void *)MEMORY[0x1E0CB66F8];
  objc_msgSend((id)objc_opt_class(), "_featureIdentifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "countryIsSupportedOnLocalDeviceForFeatureWithIdentifier:", v20);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v26[3] = v19;
  objc_msgSend(MEMORY[0x1E0CB66F8], "notAgeGatedForUserDefaultsKey:", *MEMORY[0x1E0CB7548]);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v26[4] = v18;
  objc_msgSend(MEMORY[0x1E0CB66F8], "walkingSteadinessCapabilityIsSupportedOnLocalDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v26[5] = v5;
  objc_msgSend(MEMORY[0x1E0CB66F8], "ageIsPresent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v26[6] = v6;
  objc_msgSend(MEMORY[0x1E0CB66F8], "notificationAuthorizedWithBundleIdentifier:", *MEMORY[0x1E0CB7630]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v26[7] = v7;
  objc_msgSend(MEMORY[0x1E0CB66F8], "fitnessTrackingIsEnabledInPrivacy");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v26[8] = v8;
  objc_msgSend(MEMORY[0x1E0CB66F8], "heightIsPresent");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v26[9] = v9;
  v10 = (void *)MEMORY[0x1E0CB66F8];
  objc_msgSend((id)objc_opt_class(), "_featureIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "onboardingAcknowledgedWithIdentifier:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v26[10] = v12;
  v13 = (void *)MEMORY[0x1E0CB66F8];
  objc_msgSend((id)objc_opt_class(), "_featureIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "featureIsOnWithIdentifier:isOnIfSettingIsAbsent:", v14, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v26[11] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 12);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
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
  void *v16;
  _QWORD v17[8];

  v17[7] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB66F8], "healthAppIsNotHidden");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v16;
  v2 = (void *)MEMORY[0x1E0CB66F8];
  objc_msgSend((id)objc_opt_class(), "_featureIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "onboardingRecordIsPresentForFeatureWithIdentifier:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v4;
  v5 = (void *)MEMORY[0x1E0CB66F8];
  objc_msgSend((id)objc_opt_class(), "_featureIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "countryCodeIsPresentForFeatureWithIdentifier:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v17[2] = v7;
  v8 = (void *)MEMORY[0x1E0CB66F8];
  objc_msgSend((id)objc_opt_class(), "_featureIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "countryIsSupportedOnLocalDeviceForFeatureWithIdentifier:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v17[3] = v10;
  objc_msgSend(MEMORY[0x1E0CB66F8], "notAgeGatedForUserDefaultsKey:", *MEMORY[0x1E0CB7548]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v17[4] = v11;
  objc_msgSend(MEMORY[0x1E0CB66F8], "walkingSteadinessCapabilityIsSupportedOnLocalDevice");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17[5] = v12;
  objc_msgSend(MEMORY[0x1E0CB66F8], "fitnessTrackingIsEnabledInPrivacy");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17[6] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 7);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
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
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[6];

  v15[5] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0CB66F8];
  objc_msgSend((id)objc_opt_class(), "_featureIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "onboardingRecordIsPresentForFeatureWithIdentifier:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0CB66F8];
  objc_msgSend((id)objc_opt_class(), "_featureIdentifier", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "countryCodeIsPresentForFeatureWithIdentifier:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v7;
  v8 = (void *)MEMORY[0x1E0CB66F8];
  objc_msgSend((id)objc_opt_class(), "_featureIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "countryIsSupportedOnLocalDeviceForFeatureWithIdentifier:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[2] = v10;
  objc_msgSend(MEMORY[0x1E0CB66F8], "notAgeGatedForUserDefaultsKey:", *MEMORY[0x1E0CB7548]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[3] = v11;
  objc_msgSend(MEMORY[0x1E0CB66F8], "ageIsPresent");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15[4] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)_featureIdentifier
{
  return (id)*MEMORY[0x1E0CB50B8];
}

+ (id)_requirementIdentifiersForRequirements:(id)a3
{
  return (id)objc_msgSend(a3, "hk_map:", &__block_literal_global_203);
}

uint64_t __101__HKMobilityWalkingSteadinessFeatureAvailabilityRequirements__requirementIdentifiersForRequirements___block_invoke()
{
  return objc_msgSend((id)objc_opt_class(), "requirementIdentifier");
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
  _QWORD v14[4];
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)objc_opt_class(), "_onboardingInitiation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "mutableCopy");

  objc_msgSend(MEMORY[0x1E0CB66F8], "fitnessTrackingIsEnabledInPrivacy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v5);

  objc_msgSend(v3, "hk_removeObjectsPassingTest:", &__block_literal_global_204);
  objc_msgSend(MEMORY[0x1E0CB66F8], "ageIsPresent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB66F8], "notAgeGatedForUserDefaultsKey:", *MEMORY[0x1E0CB7548], v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v7;
  objc_msgSend(MEMORY[0x1E0CB66F8], "heightIsPresent");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14[2] = v8;
  v9 = (void *)MEMORY[0x1E0CB66F8];
  objc_msgSend((id)objc_opt_class(), "_featureIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "featureIsOffWithIdentifier:isOffIfSettingIsAbsent:", v10, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[3] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v12);

  return v3;
}

uint64_t __93__HKMobilityWalkingSteadinessFeatureAvailabilityRequirements__pregnancyAdjustmentEligibility__block_invoke(uint64_t a1, void *a2)
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

@end
