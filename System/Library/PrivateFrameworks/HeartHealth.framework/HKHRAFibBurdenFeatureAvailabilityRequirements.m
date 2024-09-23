@implementation HKHRAFibBurdenFeatureAvailabilityRequirements

+ (id)requirementSet
{
  id v2;
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
  void *v14;
  _QWORD v15[9];
  _QWORD v16[11];

  v16[9] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0CB66F0]);
  v15[0] = *MEMORY[0x1E0CB4E70];
  objc_msgSend((id)objc_opt_class(), "_onboardingInitiation");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v14;
  v15[1] = *MEMORY[0x1E0CB4E88];
  objc_msgSend((id)objc_opt_class(), "_promotion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v3;
  v15[2] = *MEMORY[0x1E0CB4EB8];
  objc_msgSend((id)objc_opt_class(), "_tipsAppVisibility");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v16[2] = v4;
  v15[3] = *MEMORY[0x1E0CB4ED0];
  objc_msgSend((id)objc_opt_class(), "_usage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16[3] = v5;
  v15[4] = CFSTR("AFibBurdenAnalysis");
  objc_msgSend((id)objc_opt_class(), "_analysis");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v16[4] = v6;
  v15[5] = *MEMORY[0x1E0CB4E58];
  objc_msgSend((id)objc_opt_class(), "_highlightGeneration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16[5] = v7;
  v15[6] = CFSTR("LifeFactorPlatterGeneration");
  objc_msgSend((id)objc_opt_class(), "_lifeFactorPlatterGeneration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16[6] = v8;
  v15[7] = CFSTR("PDFGeneration");
  objc_msgSend((id)objc_opt_class(), "_pdfGeneration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v16[7] = v9;
  v15[8] = *MEMORY[0x1E0CB4E60];
  objc_msgSend((id)objc_opt_class(), "_mutualExclusivityEnforcement");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16[8] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v2, "initWithRequirementsByContext:", v11);

  return v12;
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

+ (id)tipsAppVisibilityRequirementIdentifiers
{
  void *v3;
  void *v4;

  objc_msgSend(a1, "_tipsAppVisibility");
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

+ (id)analysisRequirementIdentifiers
{
  void *v3;
  void *v4;

  objc_msgSend(a1, "_analysis");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_requirementIdentifiersForRequirements:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)highlightGenerationRequirementIdentifiers
{
  void *v3;
  void *v4;

  objc_msgSend(a1, "_highlightGeneration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_requirementIdentifiersForRequirements:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)lifeFactorPlatterGenerationRequirementIdentifiers
{
  void *v3;
  void *v4;

  objc_msgSend(a1, "_lifeFactorPlatterGeneration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_requirementIdentifiersForRequirements:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)pdfRequirementIdentifiers
{
  void *v3;
  void *v4;

  objc_msgSend(a1, "_pdfGeneration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_requirementIdentifiersForRequirements:", v3);
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
  _QWORD v12[7];

  v12[6] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB66F8], "profileIsNotFamilySetupPairingProfile");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v2;
  objc_msgSend(MEMORY[0x1E0CB66F8], "notInStoreDemoMode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v3;
  v4 = (void *)MEMORY[0x1E0CB66F8];
  objc_msgSend((id)objc_opt_class(), "_featureIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "capabilityIsSupportedOnActiveRemoteDeviceForFeatureWithIdentifier:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[2] = v6;
  objc_msgSend(MEMORY[0x1E0CB66F8], "notAgeGatedForUserDefaultsKey:", *MEMORY[0x1E0CB51F8]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[3] = v7;
  objc_msgSend(MEMORY[0x1E0CB66F8], "healthAppIsNotHidden");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[4] = v8;
  objc_msgSend(MEMORY[0x1E0CB66F8], "localDeviceIsCapableOfWatchPairing");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[5] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)_promotion
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
  _QWORD v21[8];

  v21[7] = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)objc_opt_class(), "_onboardingInitiation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "mutableCopy");

  v4 = (void *)MEMORY[0x1E0CB66F8];
  objc_msgSend((id)objc_opt_class(), "_featureIdentifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "seedIsNotExpiredForFeatureWithIdentifier:", v20);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v19;
  v5 = (void *)MEMORY[0x1E0CB66F8];
  objc_msgSend((id)objc_opt_class(), "_featureIdentifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "featureIsNotRemotelyDisabledWithIdentifier:", v18);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v21[1] = v6;
  v7 = (void *)MEMORY[0x1E0CB66F8];
  objc_msgSend((id)objc_opt_class(), "_featureIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "countryIsSupportedOnActiveRemoteDeviceForFeatureWithIdentifier:isSupportedIfCountryListMissing:", v8, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v21[2] = v9;
  v10 = (void *)MEMORY[0x1E0CB66F8];
  objc_msgSend((id)objc_opt_class(), "_featureIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "countryIsSupportedOnLocalDeviceForFeatureWithIdentifier:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v21[3] = v12;
  objc_msgSend(MEMORY[0x1E0CB66F8], "wristDetectionIsEnabledForActiveWatch");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v21[4] = v13;
  objc_msgSend(MEMORY[0x1E0CB66F8], "heartRateIsEnabledInPrivacy");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v21[5] = v14;
  objc_msgSend(MEMORY[0x1E0CB66F8], "mutuallyExclusiveFeatureIsOffWithIdentifier:", *MEMORY[0x1E0CB5038]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v21[6] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 7);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v16);

  return v3;
}

+ (id)_tipsAppVisibility
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
  _QWORD v18[5];

  v18[4] = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)objc_opt_class(), "_onboardingInitiation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "mutableCopy");

  v4 = (void *)MEMORY[0x1E0CB66F8];
  objc_msgSend((id)objc_opt_class(), "_featureIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "seedIsNotExpiredForFeatureWithIdentifier:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v6;
  v7 = (void *)MEMORY[0x1E0CB66F8];
  objc_msgSend((id)objc_opt_class(), "_featureIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "featureIsNotRemotelyDisabledWithIdentifier:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v9;
  v10 = (void *)MEMORY[0x1E0CB66F8];
  objc_msgSend((id)objc_opt_class(), "_featureIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "countryIsSupportedOnActiveRemoteDeviceForFeatureWithIdentifier:isSupportedIfCountryListMissing:", v11, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v18[2] = v12;
  v13 = (void *)MEMORY[0x1E0CB66F8];
  objc_msgSend((id)objc_opt_class(), "_featureIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "countryIsSupportedOnLocalDeviceForFeatureWithIdentifier:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v18[3] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v16);

  return v3;
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
  _QWORD v16[5];

  v16[4] = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)objc_opt_class(), "_promotion");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "mutableCopy");

  objc_msgSend(v3, "hk_removeObjectsPassingTest:", &__block_literal_global_6);
  objc_msgSend(MEMORY[0x1E0CB66F8], "notAgeGatedForUserDefaultsKey:", *MEMORY[0x1E0CB51F8]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v4;
  v5 = (void *)MEMORY[0x1E0CB66F8];
  objc_msgSend((id)objc_opt_class(), "_featureIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "countryIsSupportedOnActiveRemoteDeviceForFeatureWithIdentifier:isSupportedIfCountryListMissing:", v6, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v7;
  v8 = (void *)MEMORY[0x1E0CB66F8];
  objc_msgSend((id)objc_opt_class(), "_featureIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "onboardingRecordIsPresentForFeatureWithIdentifier:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16[2] = v10;
  v11 = (void *)MEMORY[0x1E0CB66F8];
  objc_msgSend((id)objc_opt_class(), "_featureIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "featureIsOnWithIdentifier:isOnIfSettingIsAbsent:", v12, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16[3] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v14);

  return v3;
}

uint64_t __55__HKHRAFibBurdenFeatureAvailabilityRequirements__usage__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  uint64_t v4;
  void *v5;

  v2 = a2;
  objc_msgSend((id)objc_opt_class(), "requirementIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0CB4F80]) & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "requirementIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0CB4F30]);

  }
  return v4;
}

+ (id)_analysis
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

  objc_msgSend(v3, "hk_removeObjectsPassingTest:", &__block_literal_global_193);
  objc_msgSend(MEMORY[0x1E0CB66F8], "localDeviceIsCapableOfPairingWithWatch");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v5);

  return v3;
}

uint64_t __58__HKHRAFibBurdenFeatureAvailabilityRequirements__analysis__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v2 = a2;
  objc_msgSend((id)objc_opt_class(), "requirementIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0CB4F20]) & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "requirementIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0CB4F30]) & 1) != 0)
    {
      v4 = 1;
    }
    else
    {
      objc_msgSend((id)objc_opt_class(), "requirementIdentifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0CB4F78]);

    }
  }

  return v4;
}

+ (id)_highlightGeneration
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)objc_opt_class(), "_analysis");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "mutableCopy");

  objc_msgSend(v3, "hk_removeObjectsPassingTest:", &__block_literal_global_194);
  objc_msgSend(MEMORY[0x1E0CB66F8], "onboardedAtLeastDaysAgo:featureIdentifier:", 42, *MEMORY[0x1E0CB4FF8]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v5);

  return v3;
}

uint64_t __69__HKHRAFibBurdenFeatureAvailabilityRequirements__highlightGeneration__block_invoke()
{
  void *v0;
  uint64_t v1;

  objc_msgSend((id)objc_opt_class(), "requirementIdentifier");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "isEqualToString:", *MEMORY[0x1E0CB4F88]);

  return v1;
}

+ (id)_lifeFactorPlatterGeneration
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
  objc_msgSend(v2, "onboardingRecordIsPresentForFeatureWithIdentifier:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)_pdfGeneration
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0CB66F8];
  objc_msgSend((id)objc_opt_class(), "_featureIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "onboardingRecordIsPresentForFeatureWithIdentifier:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v4;
  objc_msgSend(MEMORY[0x1E0CB66F8], "localDeviceIsCapableOfPairingWithWatch");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)_mutualExclusivityEnforcement
{
  void *v2;
  void *v3;

  objc_msgSend((id)objc_opt_class(), "_usage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "mutableCopy");

  objc_msgSend(v3, "hk_removeObjectsPassingTest:", &__block_literal_global_195);
  return v3;
}

uint64_t __78__HKHRAFibBurdenFeatureAvailabilityRequirements__mutualExclusivityEnforcement__block_invoke()
{
  void *v0;
  uint64_t v1;

  objc_msgSend((id)objc_opt_class(), "requirementIdentifier");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "isEqualToString:", *MEMORY[0x1E0CB4F78]);

  return v1;
}

+ (id)_featureIdentifier
{
  return (id)*MEMORY[0x1E0CB4FF8];
}

+ (id)_requirementIdentifiersForRequirements:(id)a3
{
  return (id)objc_msgSend(a3, "hk_map:", &__block_literal_global_197);
}

uint64_t __88__HKHRAFibBurdenFeatureAvailabilityRequirements__requirementIdentifiersForRequirements___block_invoke()
{
  return objc_msgSend((id)objc_opt_class(), "requirementIdentifier");
}

@end
