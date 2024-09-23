@implementation _HKHeartSettingsUtilities

+ (NSString)heartRateSectionDescription
{
  return (NSString *)HKHeartRateLocalizedString(CFSTR("HEART_NOTIFICATION_THRESHOLD_SECTION_TITLE"));
}

+ (NSString)heartRateThresholdOffDescription
{
  return (NSString *)HKHeartRateLocalizedString(CFSTR("HEART_NOTIFICATION_OFF"));
}

+ (NSString)remoteDisabledLinkTitle
{
  return (NSString *)HKHeartRateLocalizedString(CFSTR("FEATURE_DISABLED_REMOTELY_LINK"));
}

+ (NSString)remoteDisabledLinkURL
{
  return (NSString *)HKHeartRateLocalizedString(CFSTR("FEATURE_DISABLED_REMOTELY_LINK_URL"));
}

+ (NSString)seedExpiredLinkTitle
{
  return (NSString *)HKHeartRateLocalizedString(CFSTR("FEATURE_SEED_EXPIRED_LINK"));
}

+ (NSString)seedExpiredLinkURL
{
  return (NSString *)HKHeartRateLocalizedString(CFSTR("FEATURE_SEED_EXPIRED_LINK_URL"));
}

+ (NSString)detailStatusOnText
{
  return (NSString *)HKHeartRateLocalizedString(CFSTR("DETAIL_FEATURE_STATUS_ON_TEXT"));
}

+ (NSString)detailStatusOffText
{
  return (NSString *)HKHeartRateLocalizedString(CFSTR("DETAIL_FEATURE_STATUS_OFF_TEXT"));
}

+ (id)heartRateSettingsURL
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("bridge:root=com.apple.HeartRateSettings"));
}

+ (BOOL)isWristDetectionEnabled
{
  void *v2;
  void *v3;
  int v4;

  HKObjectForNanoPreferencesUserDefaultsKey();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "BOOLValue") ^ 1;
  else
    LOBYTE(v4) = 1;

  return v4;
}

+ (BOOL)isBackgroundHeartRateEnabled
{
  int v3;

  v3 = objc_msgSend(a1, "isHeartRateEnabled");
  if (v3)
    LOBYTE(v3) = objc_msgSend(a1, "isWristDetectionEnabled");
  return v3;
}

+ (id)bradycardiaHeartThresholdFooterDescriptionWithThresholdValue:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v13;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0CB3940];
  HKHeartRateLocalizedString(CFSTR("MINUTES_%ld"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringWithFormat:", v6, 10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(a1, "shouldFooterTextDisplayOffConfiguration:", objc_msgSend(a1, "isBradycardiaDetectionEnabled"));
  v9 = (void *)MEMORY[0x1E0CB3940];
  if (v8)
  {
    HKHeartRateLocalizedString(CFSTR("HEART_NOTIFICATION_BRADYCARDIA_FOOTER_OFF_%@"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringWithFormat:", v10, v7, v13);
  }
  else
  {
    HKHeartRateLocalizedString(CFSTR("HEART_NOTIFICATION_BRADYCARDIA_FOOTER_%@_%@"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringWithFormat:", v10, v4, v7);
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (NSString)bradycardiaLearnMoreLink
{
  return (NSString *)HKHeartRateLocalizedString(CFSTR("HEART_NOTIFICATION_LEARN_MORE_LINK_URL"));
}

+ (BOOL)isBradycardiaDetectionSupportedOnActiveWatch
{
  return objc_msgSend(MEMORY[0x1E0CB6F18], "activePairedWatchSupportsBradycardiaDetection");
}

+ (BOOL)isBradycardiaDetectionSupportedOnAllWatches
{
  return objc_msgSend(MEMORY[0x1E0CB6F18], "allPairedWatchesSupportBradycardiaDetection");
}

+ (BOOL)isBradycardiaDetectionEnabled
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  char v6;

  v2 = objc_alloc(MEMORY[0x1E0C99EA0]);
  v3 = (void *)objc_msgSend(v2, "initWithSuiteName:", *MEMORY[0x1E0CB76F8]);
  objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E0CB76D8]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
    v6 = objc_msgSend(v4, "BOOLValue");
  else
    v6 = 0;

  return v6;
}

+ (int64_t)bradycardiaThresholdHeartRate
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  int64_t v6;

  v2 = objc_alloc(MEMORY[0x1E0C99EA0]);
  v3 = (void *)objc_msgSend(v2, "initWithSuiteName:", *MEMORY[0x1E0CB76F8]);
  objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E0CB76C8]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
    v6 = objc_msgSend(v4, "integerValue");
  else
    v6 = 40;

  return v6;
}

+ (int64_t)bradycardiaWarningThreshold
{
  return 50;
}

+ (id)bradycardiaHeartRateOptions
{
  return (id)objc_msgSend(a1, "_calculateHeartRateOptionsWithMin:increment:max:", 40, 5, 50);
}

+ (void)setBradycardiaThresholdHeartRate:(id)a3
{
  objc_msgSend(a1, "_setThresholdHeartRate:detectedEnabledDefaultsKey:thresholdHeartRateDefaultKey:", a3, *MEMORY[0x1E0CB76D8], *MEMORY[0x1E0CB76C8]);
}

+ (BOOL)isTachycardiaDetectionEnabled
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  char v6;

  v2 = objc_alloc(MEMORY[0x1E0C99EA0]);
  v3 = (void *)objc_msgSend(v2, "initWithSuiteName:", *MEMORY[0x1E0CB76F8]);
  objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E0CB76E8]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
    v6 = objc_msgSend(v4, "BOOLValue");
  else
    v6 = 0;

  return v6;
}

+ (int64_t)tachycardiaThresholdHeartRate
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  int64_t v6;

  v2 = objc_alloc(MEMORY[0x1E0C99EA0]);
  v3 = (void *)objc_msgSend(v2, "initWithSuiteName:", *MEMORY[0x1E0CB76F8]);
  objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E0CB76F0]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
    v6 = objc_msgSend(v4, "integerValue");
  else
    v6 = 120;

  return v6;
}

+ (id)tachycardiaHeartRateOptions
{
  return (id)objc_msgSend(a1, "_calculateHeartRateOptionsWithMin:increment:max:", 100, 10, 150);
}

+ (id)tachycardiaHeartThresholdFooterDescriptionWithThresholdValue:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v13;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0CB3940];
  HKHeartRateLocalizedString(CFSTR("MINUTES_%ld"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringWithFormat:", v6, 10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(a1, "shouldFooterTextDisplayOffConfiguration:", objc_msgSend(a1, "isTachycardiaDetectionEnabled"));
  v9 = (void *)MEMORY[0x1E0CB3940];
  if (v8)
  {
    HKHeartRateLocalizedString(CFSTR("HEART_NOTIFICATION_TACHYCARDIA_FOOTER_OFF_%@"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringWithFormat:", v10, v7, v13);
  }
  else
  {
    HKHeartRateLocalizedString(CFSTR("HEART_NOTIFICATION_TACHYCARDIA_FOOTER_%@_%@"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringWithFormat:", v10, v4, v7);
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (NSString)tachycardiaLearnMoreLink
{
  return (NSString *)HKHeartRateLocalizedString(CFSTR("HEART_NOTIFICATION_LEARN_MORE_LINK_URL"));
}

+ (void)setTachycardiaThresholdHeartRate:(id)a3
{
  objc_msgSend(a1, "_setThresholdHeartRate:detectedEnabledDefaultsKey:thresholdHeartRateDefaultKey:", a3, *MEMORY[0x1E0CB76E8], *MEMORY[0x1E0CB76F0]);
}

+ (NSString)irregularHeartRhythmSetupTitleDescription
{
  return (NSString *)HKHeartRateLocalizedString(CFSTR("HEART_NOTIFICATION_ATRIAL_FIBRILLATION_ONBOARDING_BUTTON_TITLE"));
}

+ (NSString)irregularHeartRhythmTitleDescription
{
  return (NSString *)HKHeartRateLocalizedString(CFSTR("HEART_NOTIFICATION_ATRIAL_FIBRILLATION_SWITCH_TITLE"));
}

+ (NSString)irregularHeartRhythmFooterDescription
{
  void *v3;
  void *v4;
  void *v5;

  HKHeartRateLocalizedString(CFSTR("HEART_NOTIFICATION_ATRIAL_FIBRILLATION_NEEDS_GEOLOCATION_FOOTER"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "irregularHeartRhythmFooterLinkTitle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@\n%@"), v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

+ (NSString)irregularHeartRhythmFooterLinkTitle
{
  return (NSString *)HKHeartRateLocalizedString(CFSTR("HEART_NOTIFICATION_ATRIAL_FIBRILLATION_FOOTER_LINK"));
}

+ (NSString)irregularHeartRhythmFooterLinkURL
{
  return (NSString *)HKHeartRateLocalizedString(CFSTR("HEART_NOTIFICATION_LEARN_MORE_LINK_URL"));
}

+ (NSString)cardioFitnessSectionTitle
{
  void *v2;
  void *v3;

  HKHRHeartHealthBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("CARDIO_FITNESS_SECTION_TITLE"), &stru_1E9C26A20, CFSTR("HeartRateSettings-CardioFitness"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

+ (NSString)cardioFitnessSetupTitleDescription
{
  void *v2;
  void *v3;

  HKHRHeartHealthBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("HEART_NOTIFICATION_CARDIO_FITNESS_ONBOARDING_BUTTON_TITLE"), &stru_1E9C26A20, CFSTR("HeartRateSettings-CardioFitness"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

+ (NSString)cardioFitnessUnavailableDetailText
{
  void *v2;
  void *v3;

  HKHRHeartHealthBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("HEART_NOTIFICATION_CARDIO_FITNESS_STATUS_UNAVAILABLE_TEXT"), &stru_1E9C26A20, CFSTR("HeartRateSettings-CardioFitness"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

+ (NSString)cardioFitnessTitleDescription
{
  void *v2;
  void *v3;

  HKHRHeartHealthBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("HEART_NOTIFICATION_CARDIO_FITNESS_SWITCH_TITLE"), &stru_1E9C26A20, CFSTR("HeartRateSettings-CardioFitness"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

+ (NSString)cardioFitnessFooterDescription
{
  void *v2;
  void *v3;

  HKHRHeartHealthBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("HEART_NOTIFICATION_CARDIO_FITNESS_FOOTER"), &stru_1E9C26A20, CFSTR("HeartRateSettings-CardioFitness"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

+ (NSString)cardioFitnessPregnantFooterDescription
{
  void *v2;
  void *v3;

  HKHRHeartHealthBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("CARDIO_FITNESS_PREGNANCY_FOOTER"), &stru_1E9C26A20, CFSTR("HeartRateSettings-Seahorse"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

+ (NSString)cardioFitnessFooterDescriptionWithLink
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  HKHRHeartHealthBundle();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("HEART_NOTIFICATION_CARDIO_FITNESS_FOOTER"), &stru_1E9C26A20, CFSTR("HeartRateSettings-CardioFitness"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "cardioFitnessFooterLinkTitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@\n%@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

+ (NSString)cardioFitnessPregnantFooterDescriptionWithLink
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  HKHRHeartHealthBundle();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("CARDIO_FITNESS_PREGNANCY_FOOTER"), &stru_1E9C26A20, CFSTR("HeartRateSettings-Seahorse"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "cardioFitnessFooterLinkTitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@\n%@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

+ (NSString)cardioFitnessFooterLinkTitle
{
  void *v2;
  void *v3;

  HKHRHeartHealthBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("HEART_NOTIFICATION_CARDIO_FITNESS_FOOTER_LINK"), &stru_1E9C26A20, CFSTR("HeartRateSettings-CardioFitness"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

+ (NSString)cardioFitnessFooterLinkURL
{
  return (NSString *)CFSTR("x-apple-Health://Heart.healthplugin/CardioFitnessOverview");
}

+ (NSString)cardioFitnessWristDetectFooterDescription
{
  void *v2;
  void *v3;

  HKHRHeartHealthBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("HEART_NOTIFICATION_CARDIO_FITNESS_FOOTER_WRIST_DETECT"), &stru_1E9C26A20, CFSTR("HeartRateSettings-CardioFitness"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

+ (NSString)cardioFitnessWristDetectFooterDescriptionWithLink
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  HKHRHeartHealthBundle();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("HEART_NOTIFICATION_CARDIO_FITNESS_FOOTER_WRIST_DETECT"), &stru_1E9C26A20, CFSTR("HeartRateSettings-CardioFitness"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "cardioFitnessWristDetectFooterLinkTitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

+ (NSString)cardioFitnessWristDetectFooterLinkTitle
{
  void *v2;
  void *v3;

  HKHRHeartHealthBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("HEART_NOTIFICATION_CARDIO_FITNESS_FOOTER_LINK_PASSCODE"), &stru_1E9C26A20, CFSTR("HeartRateSettings-CardioFitness"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

+ (NSString)cardioFitnessWristDetectFooterLinkURL
{
  return (NSString *)CFSTR("bridge:root=PASSCODE_ID");
}

+ (NSString)cardioFitnessAgeDeletedFooterDescription
{
  void *v2;
  void *v3;

  HKHRHeartHealthBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("HEART_NOTIFICATION_CARDIO_FITNESS_FOOTER_AGE_DELETED"), &stru_1E9C26A20, CFSTR("HeartRateSettings-CardioFitness"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

+ (NSString)cardioFitnessAgeDeletedFooterDescriptionWithLink
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  HKHRHeartHealthBundle();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("HEART_NOTIFICATION_CARDIO_FITNESS_FOOTER_AGE_DELETED"), &stru_1E9C26A20, CFSTR("HeartRateSettings-CardioFitness"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "cardioFitnessAgeDeletedFooterLinkTitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

+ (NSString)cardioFitnessAgeDeletedFooterLinkTitle
{
  void *v2;
  void *v3;

  HKHRHeartHealthBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("HEART_NOTIFICATION_CARDIO_FITNESS_FOOTER_LINK_HEALTH_DETAILS"), &stru_1E9C26A20, CFSTR("HeartRateSettings-CardioFitness"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

+ (NSString)cardioFitnessAgeDeletedFooterLinkURL
{
  return (NSString *)CFSTR("x-apple-health://HealthProfile");
}

+ (NSString)cardioFitnessAgeRestrictedFooterDescription
{
  void *v2;
  void *v3;

  HKHRHeartHealthBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("HEART_NOTIFICATION_CARDIO_FITNESS_FOOTER_AGE_GATING"), &stru_1E9C26A20, CFSTR("HeartRateSettings-CardioFitness"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

+ (NSString)cardioFitnessPairedDeviceRegionGatedFooterDescription
{
  void *v2;
  void *v3;

  HKHRHeartHealthBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("HEART_NOTIFICATION_CARDIO_FITNESS_FOOTER_PAIRED_DEVICE_REGION_GATED"), &stru_1E9C26A20, CFSTR("HeartRateSettings-CardioFitness"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

+ (NSString)electrocardiogramLearnMoreURL
{
  return (NSString *)CFSTR("https://support.apple.com/kb/HT208955");
}

+ (NSString)aFibBurdenSectionTitle
{
  void *v2;
  void *v3;

  HKHRHeartHealthBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("AFIB_BURDEN_SECTION_TITLE"), &stru_1E9C26A20, CFSTR("HeartRateSettings-AFibBurden"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

+ (NSString)aFibBurdenTitleDescription
{
  void *v2;
  void *v3;

  HKHRHeartHealthBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("HEART_NOTIFICATION_AFIB_BURDEN_SWITCH_TITLE"), &stru_1E9C26A20, CFSTR("HeartRateSettings-AFibBurden"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

+ (NSString)aFibBurdenSetupTitleDescription
{
  void *v2;
  void *v3;

  HKHRHeartHealthBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("HEART_NOTIFICATION_AFIB_BURDEN_ONBOARDING_BUTTON_TITLE"), &stru_1E9C26A20, CFSTR("HeartRateSettings-AFibBurden"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

+ (NSString)aFibBurdenUnavailableDetailText
{
  void *v2;
  void *v3;

  HKHRHeartHealthBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("HEART_NOTIFICATION_AFIB_BURDEN_STATUS_UNAVAILABLE_TEXT"), &stru_1E9C26A20, CFSTR("HeartRateSettings-AFibBurden"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

+ (NSString)aFibBurdenFooterDescription
{
  void *v2;
  void *v3;

  HKHRHeartHealthBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("HEART_NOTIFICATION_AFIB_BURDEN_FOOTER"), &stru_1E9C26A20, CFSTR("HeartRateSettings-AFibBurden"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

+ (NSString)aFibBurdenFooterDescriptionWithLink
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a1, "aFibBurdenFooterDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "aFibBurdenFooterLinkTitle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@\n%@"), v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

+ (NSString)aFibBurdenFooterLinkTitle
{
  void *v2;
  void *v3;

  HKHRHeartHealthBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("HEART_NOTIFICATION_AFIB_BURDEN_FOOTER_LINK_ABOUT"), &stru_1E9C26A20, CFSTR("HeartRateSettings-AFibBurden"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

+ (NSString)aFibBurdenArticleLinkURL
{
  return (NSString *)CFSTR("x-apple-Health://Heart.healthplugin/AFibBurden");
}

+ (NSString)aFibBurdenAppleSupportURL
{
  void *v2;
  void *v3;

  HKHRHeartHealthBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("AFIB_BURDEN_SUPPORT_URL"), &stru_1E9C26A20, CFSTR("HeartRateSettings-AFibBurden"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

+ (NSString)aFibBurdenDefaultLinkURL
{
  void *v2;
  void *v3;

  HKHRHeartHealthBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("AFIB_BURDEN_GENERIC_LEARN_MORE_URL"), &stru_1E9C26A20, CFSTR("HeartRateSettings-AFibBurden"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

+ (NSString)aFibBurdenHeartRateFooterDescriptionWithLink
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  HKHRHeartHealthBundle();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("HEART_NOTIFICATION_AFIB_BURDEN_FOOTER_HEART_RATE"), &stru_1E9C26A20, CFSTR("HeartRateSettings-AFibBurden"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "aFibBurdenHeartRateFooterLinkTitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

+ (NSString)aFibBurdenHeartRateFooterLinkTitle
{
  void *v2;
  void *v3;

  HKHRHeartHealthBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("HEART_NOTIFICATION_AFIB_BURDEN_FOOTER_LINK_PRIVACY"), &stru_1E9C26A20, CFSTR("HeartRateSettings-AFibBurden"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

+ (NSString)aFibBurdenHeartRateFooterLinkURL
{
  return (NSString *)CFSTR("bridge:root=PRIVACY_ID");
}

+ (NSString)aFibBurdenWristDetectFooterDescriptionWithLink
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  HKHRHeartHealthBundle();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("HEART_NOTIFICATION_AFIB_BURDEN_FOOTER_WRIST_DETECT"), &stru_1E9C26A20, CFSTR("HeartRateSettings-AFibBurden"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "aFibBurdenWristDetectFooterLinkTitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

+ (NSString)aFibBurdenWristDetectFooterLinkTitle
{
  void *v2;
  void *v3;

  HKHRHeartHealthBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("HEART_NOTIFICATION_AFIB_BURDEN_FOOTER_LINK_PASSCODE"), &stru_1E9C26A20, CFSTR("HeartRateSettings-AFibBurden"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

+ (NSString)aFibBurdenWristDetectFooterLinkURL
{
  return (NSString *)CFSTR("bridge:root=PASSCODE_ID");
}

+ (NSString)aFibBurdenDeviceNotSupportedFooterDescription
{
  void *v2;
  void *v3;

  HKHRHeartHealthBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("HEART_NOTIFICATION_AFIB_BURDEN_DEVICE_NOT_SUPPORTED_FOOTER"), &stru_1E9C26A20, CFSTR("HeartRateSettings-AFibBurden"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

+ (NSString)aFibBurdenIRNEnabledFooterDescription
{
  void *v2;
  void *v3;

  HKHRHeartHealthBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("HEART_NOTIFICATION_AFIB_BURDEN_IRN_ENABLED_FOOTER"), &stru_1E9C26A20, CFSTR("HeartRateSettings-AFibBurden"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

+ (NSString)aFibBurdenIRNEnabledFooterDescriptionWithLink
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a1, "aFibBurdenIRNEnabledFooterDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "aFibBurdenFooterLinkTitle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@\n%@"), v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

+ (NSString)aFibBurdenIRNEnabledFooterDescriptionWatch
{
  void *v2;
  void *v3;

  HKHRHeartHealthBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("HEART_NOTIFICATION_AFIB_BURDEN_IRN_ENABLED_FOOTER_WATCH"), &stru_1E9C26A20, CFSTR("HeartRateSettings-AFibBurden"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

+ (NSString)aFibBurdenRegionNotSupportedFooterDescription
{
  void *v2;
  void *v3;

  HKHRHeartHealthBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("HEART_NOTIFICATION_AFIB_BURDEN_REGION_NOT_SUPPORTED_FOOTER"), &stru_1E9C26A20, CFSTR("HeartRateSettings-AFibBurden"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

+ (NSString)aFibBurdenRemoteDisabledFooterDescription
{
  void *v2;
  void *v3;

  HKHRHeartHealthBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("HEART_NOTIFICATION_AFIB_BURDEN_REMOTE_DISABLED_FOOTER"), &stru_1E9C26A20, CFSTR("HeartRateSettings-AFibBurden"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

+ (NSString)aFibBurdenRemoteDisabledFooterDescriptionWatch
{
  void *v2;
  void *v3;

  HKHRHeartHealthBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("HEART_NOTIFICATION_AFIB_BURDEN_REMOTE_DISABLED_FOOTER_WATCH"), &stru_1E9C26A20, CFSTR("HeartRateSettings-AFibBurden"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

+ (NSString)aFibBurdenRemoteDisabledFooterDescriptionWithLink
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a1, "aFibBurdenRemoteDisabledFooterDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "remoteDisabledLinkTitle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@\n%@"), v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

+ (NSString)aFibBurdenSeedExpiryFooterDescription
{
  void *v2;
  void *v3;

  HKHRHeartHealthBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("HEART_NOTIFICATION_AFIB_BURDEN_SEED_EXPIRY_FOOTER"), &stru_1E9C26A20, CFSTR("HeartRateSettings-AFibBurden"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

+ (NSString)aFibBurdenSeedExpiryFooterDescriptionWatch
{
  void *v2;
  void *v3;

  HKHRHeartHealthBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("HEART_NOTIFICATION_AFIB_BURDEN_SEED_EXPIRY_FOOTER_WATCH"), &stru_1E9C26A20, CFSTR("HeartRateSettings-AFibBurden"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

+ (NSString)aFibBurdenSeedExpiryFooterDescriptionWithLink
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a1, "aFibBurdenSeedExpiryFooterDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "seedExpiredLinkTitle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@\n%@"), v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

+ (NSString)aFibBurdenRegionNotSupportedFooterDescriptionWithLink
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a1, "aFibBurdenRegionNotSupportedFooterDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "remoteDisabledLinkTitle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@\n%@"), v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

+ (BOOL)shouldFooterTextDisplayOffConfiguration:(BOOL)a3
{
  if (objc_msgSend(a1, "isHeartRateEnabled"))
    return objc_msgSend(a1, "isWristDetectionEnabled") & a3 ^ 1;
  else
    return 1;
}

+ (void)_setThresholdHeartRate:(id)a3 detectedEnabledDefaultsKey:(id)a4 thresholdHeartRateDefaultKey:(id)a5
{
  uint64_t v7;
  _BOOL8 v8;
  objc_class *v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[3];

  v18[2] = *MEMORY[0x1E0C80C00];
  v7 = *MEMORY[0x1E0CB76F8];
  v8 = a3 != 0;
  v9 = (objc_class *)MEMORY[0x1E0C99EA0];
  v10 = a5;
  v11 = a4;
  v12 = a3;
  v13 = (void *)objc_msgSend([v9 alloc], "initWithSuiteName:", v7);
  objc_msgSend(v13, "setBool:forKey:", v8, v11);
  objc_msgSend(v13, "setObject:forKey:", v12, v10);

  v14 = objc_alloc_init(MEMORY[0x1E0D51618]);
  v15 = (void *)MEMORY[0x1E0C99E60];
  v18[0] = v11;
  v18[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setWithArray:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "synchronizeUserDefaultsDomain:keys:", v7, v17);
  if (a3)
    HKHRSubmitNotificationsEnabledSignal();

}

+ (id)_calculateHeartRateOptionsWithMin:(int64_t)a3 increment:(int64_t)a4 max:(int64_t)a5
{
  void *i;
  void *v9;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  for (i = (void *)objc_claimAutoreleasedReturnValue(); a3 <= a5; a3 += a4)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(i, "addObject:", v9);

  }
  return i;
}

@end
