@implementation HKFeatureAvailabilityRequirements

+ (id)activeRemoteDeviceIsPresentWhenRequiredForRegionAvailabilityOrDeviceCapabilityForFeatureWithIdentifier:(id)a3
{
  id v3;
  HKFeatureAvailabilityRequirementActiveRemoteDeviceIsPresentWhenRequiredForRegionAvailabilityOrDeviceCapability *v4;

  v3 = a3;
  v4 = -[HKFeatureAvailabilityOnboardingEligibilityRequirement initWithFeatureIdentifier:]([HKFeatureAvailabilityRequirementActiveRemoteDeviceIsPresentWhenRequiredForRegionAvailabilityOrDeviceCapability alloc], "initWithFeatureIdentifier:", v3);

  return v4;
}

+ (id)activeWatchIsNotUnderInternalDevelopmentImportExclusionForFeatureWithIdentifier:(id)a3
{
  id v3;
  HKFeatureAvailabilityRequirementActiveWatchIsNotUnderInternalDevelopmentImportExclusion *v4;

  v3 = a3;
  v4 = -[HKFeatureAvailabilityRequirementActiveWatchIsNotUnderInternalDevelopmentImportExclusion initWithFeatureIdentifier:]([HKFeatureAvailabilityRequirementActiveWatchIsNotUnderInternalDevelopmentImportExclusion alloc], "initWithFeatureIdentifier:", v3);

  return v4;
}

+ (id)ageIsPresent
{
  return objc_alloc_init(HKFeatureAvailabilityRequirementAgeIsPresent);
}

+ (id)bloodOxygenRecordingsAreEnabled
{
  return objc_alloc_init(HKFeatureAvailabilityRequirementBloodOxygenRecordingsAreEnabled);
}

+ (id)capabilityIsSupportedOnActiveRemoteDeviceForFeatureWithIdentifier:(id)a3
{
  id v3;
  HKFeatureAvailabilityRequirementCapabilityIsSupportedOnActiveRemoteDevice *v4;

  v3 = a3;
  v4 = -[HKFeatureAvailabilityOnboardingEligibilityRequirement initWithFeatureIdentifier:]([HKFeatureAvailabilityRequirementCapabilityIsSupportedOnActiveRemoteDevice alloc], "initWithFeatureIdentifier:", v3);

  return v4;
}

+ (id)capabilityIsSupportedOnActiveWatchForFeatureWithIdentifier:(id)a3 supportedOnLocalDevice:(BOOL)a4
{
  _BOOL8 v4;
  id v5;
  HKFeatureAvailabilityRequirementCapabilityIsSupportedOnActiveWatch *v6;

  v4 = a4;
  v5 = a3;
  v6 = -[HKFeatureAvailabilityRequirementCapabilityIsSupportedOnActiveWatch initWithFeatureIdentifier:supportedOnLocalDevice:]([HKFeatureAvailabilityRequirementCapabilityIsSupportedOnActiveWatch alloc], "initWithFeatureIdentifier:supportedOnLocalDevice:", v5, v4);

  return v6;
}

+ (id)capabilityIsSupportedOnAnyWatch:(id)a3 supportedOnLocalDevice:(BOOL)a4
{
  _BOOL8 v4;
  id v5;
  HKFeatureAvailabilityRequirementCapabilityIsSupportedOnAnyWatch *v6;

  v4 = a4;
  v5 = a3;
  v6 = -[HKFeatureAvailabilityRequirementCapabilityIsSupportedOnAnyWatch initWithNanoRegistryCapability:supportedOnLocalDevice:]([HKFeatureAvailabilityRequirementCapabilityIsSupportedOnAnyWatch alloc], "initWithNanoRegistryCapability:supportedOnLocalDevice:", v5, v4);

  return v6;
}

+ (id)countryCodeIsPresentForFeatureWithIdentifier:(id)a3
{
  id v3;
  HKFeatureAvailabilityRequirementCountryCodeIsPresent *v4;

  v3 = a3;
  v4 = -[HKFeatureAvailabilityOnboardingEligibilityRequirement initWithFeatureIdentifier:]([HKFeatureAvailabilityRequirementCountryCodeIsPresent alloc], "initWithFeatureIdentifier:", v3);

  return v4;
}

+ (id)countryIsSupportedOnActiveRemoteDeviceForFeatureWithIdentifier:(id)a3 isSupportedIfCountryListMissing:(BOOL)a4
{
  _BOOL8 v4;
  id v5;
  HKFeatureAvailabilityRequirementCountryIsSupportedOnActiveRemoteDevice *v6;

  v4 = a4;
  v5 = a3;
  v6 = -[_HKFeatureAvailabilityRequirementCountryIsSupportedOnActiveRemoteDevice initWithFeatureIdentifier:isSupportedIfCountryListMissing:]([HKFeatureAvailabilityRequirementCountryIsSupportedOnActiveRemoteDevice alloc], "initWithFeatureIdentifier:isSupportedIfCountryListMissing:", v5, v4);

  return v6;
}

+ (id)countryIsSupportedOnLocalDeviceForFeatureWithIdentifier:(id)a3
{
  id v3;
  HKFeatureAvailabilityRequirementCountryIsSupportedOnLocalDevice *v4;

  v3 = a3;
  v4 = -[HKFeatureAvailabilityOnboardingEligibilityRequirement initWithFeatureIdentifier:]([HKFeatureAvailabilityRequirementCountryIsSupportedOnLocalDevice alloc], "initWithFeatureIdentifier:", v3);

  return v4;
}

+ (id)currentCountryCodeIsPresentForFeatureWithIdentifier:(id)a3
{
  id v3;
  HKFeatureAvailabilityRequirementCurrentCountryCodeIsPresent *v4;

  v3 = a3;
  v4 = -[HKFeatureAvailabilityOnboardingEligibilityRequirement initWithFeatureIdentifier:]([HKFeatureAvailabilityRequirementCurrentCountryCodeIsPresent alloc], "initWithFeatureIdentifier:", v3);

  return v4;
}

+ (id)currentCountryIsSupportedOnActiveRemoteDeviceForFeatureWithIdentifier:(id)a3 isSupportedIfCountryListMissing:(BOOL)a4
{
  _BOOL8 v4;
  id v5;
  HKFeatureAvailabilityRequirementCurrentCountryIsSupportedOnActiveRemoteDevice *v6;

  v4 = a4;
  v5 = a3;
  v6 = -[_HKFeatureAvailabilityRequirementCountryIsSupportedOnActiveRemoteDevice initWithFeatureIdentifier:isSupportedIfCountryListMissing:]([HKFeatureAvailabilityRequirementCurrentCountryIsSupportedOnActiveRemoteDevice alloc], "initWithFeatureIdentifier:isSupportedIfCountryListMissing:", v5, v4);

  return v6;
}

+ (id)currentCountryIsSupportedOnLocalDeviceForFeatureWithIdentifier:(id)a3
{
  id v3;
  HKFeatureAvailabilityRequirementCurrentCountryIsSupportedOnLocalDevice *v4;

  v3 = a3;
  v4 = -[HKFeatureAvailabilityOnboardingEligibilityRequirement initWithFeatureIdentifier:]([HKFeatureAvailabilityRequirementCurrentCountryIsSupportedOnLocalDevice alloc], "initWithFeatureIdentifier:", v3);

  return v4;
}

+ (id)featureFlagIsEnabled:(BOOL)a3
{
  return -[HKFeatureAvailabilityMustBeTrueRequirement initWithWhatMustBeTrue:]([HKFeatureAvailabilityRequirementFeatureFlagIsEnabled alloc], "initWithWhatMustBeTrue:", a3);
}

+ (id)featureIsNotRemotelyDisabledWithIdentifier:(id)a3
{
  id v3;
  HKFeatureAvailabilityRequirementFeatureIsNotRemotelyDisabled *v4;

  v3 = a3;
  v4 = -[HKFeatureAvailabilityOnboardingEligibilityRequirement initWithFeatureIdentifier:]([HKFeatureAvailabilityRequirementFeatureIsNotRemotelyDisabled alloc], "initWithFeatureIdentifier:", v3);

  return v4;
}

+ (id)featureIsOffWithIdentifier:(id)a3 isOffIfSettingIsAbsent:(BOOL)a4
{
  _BOOL8 v4;
  id v5;
  HKFeatureAvailabilityRequirementFeatureIsOff *v6;

  v4 = a4;
  v5 = a3;
  v6 = -[HKFeatureAvailabilityRequirementFeatureIsOff initWithFeatureIdentifier:isOffWhenSettingIsAbsent:]([HKFeatureAvailabilityRequirementFeatureIsOff alloc], "initWithFeatureIdentifier:isOffWhenSettingIsAbsent:", v5, v4);

  return v6;
}

+ (id)featureIsOffWithIdentifier:(id)a3 settingsKey:(id)a4 isOffIfSettingIsAbsent:(BOOL)a5
{
  _BOOL8 v5;
  id v7;
  id v8;
  HKFeatureAvailabilityRequirementFeatureIsOff *v9;

  v5 = a5;
  v7 = a4;
  v8 = a3;
  v9 = -[HKFeatureAvailabilityRequirementFeatureIsOff initWithFeatureIdentifier:settingsOffKey:isOffWhenSettingIsAbsent:]([HKFeatureAvailabilityRequirementFeatureIsOff alloc], "initWithFeatureIdentifier:settingsOffKey:isOffWhenSettingIsAbsent:", v8, v7, v5);

  return v9;
}

+ (id)featureIsOnWithIdentifier:(id)a3 isOnIfSettingIsAbsent:(BOOL)a4
{
  _BOOL8 v4;
  id v5;
  HKFeatureAvailabilityRequirementFeatureIsOn *v6;

  v4 = a4;
  v5 = a3;
  v6 = -[HKFeatureAvailabilityRequirementFeatureIsOn initWithFeatureIdentifier:isOnWhenSettingIsAbsent:]([HKFeatureAvailabilityRequirementFeatureIsOn alloc], "initWithFeatureIdentifier:isOnWhenSettingIsAbsent:", v5, v4);

  return v6;
}

+ (id)featureIsOnWithIdentifier:(id)a3 settingsKey:(id)a4 isOnIfSettingIsAbsent:(BOOL)a5
{
  _BOOL8 v5;
  id v7;
  id v8;
  HKFeatureAvailabilityRequirementFeatureIsOn *v9;

  v5 = a5;
  v7 = a4;
  v8 = a3;
  v9 = -[HKFeatureAvailabilityRequirementFeatureIsOn initWithFeatureIdentifier:settingsOnKey:isOnWhenSettingIsAbsent:]([HKFeatureAvailabilityRequirementFeatureIsOn alloc], "initWithFeatureIdentifier:settingsOnKey:isOnWhenSettingIsAbsent:", v8, v7, v5);

  return v9;
}

+ (id)fitnessTrackingIsEnabledInPrivacy
{
  return objc_alloc_init(HKFeatureAvailabilityRequirementFitnessTrackingIsEnabledInPrivacy);
}

+ (id)healthAppIsNotHidden
{
  return objc_alloc_init(HKFeatureAvailabilityRequirementHealthAppIsNotHidden);
}

+ (id)heartRateIsEnabledInPrivacy
{
  return objc_alloc_init(HKFeatureAvailabilityRequirementHeartRateIsEnabledInPrivacy);
}

+ (id)heightIsPresent
{
  return objc_alloc_init(HKFeatureAvailabilityRequirementHeightIsPresent);
}

+ (id)localDeviceIsCapableOfPairingWithWatch
{
  return objc_alloc_init(HKFeatureAvailabilityRequirementLocalDeviceIsCapableOfPairingWithWatch);
}

+ (id)localDeviceIsCapableOfWatchPairing
{
  return objc_alloc_init(HKFeatureAvailabilityRequirementLocalDeviceIsCapableOfWatchPairing);
}

+ (id)mutuallyExclusiveFeatureIsOffWithIdentifier:(id)a3
{
  id v3;
  HKFeatureAvailabilityRequirementMutuallyExclusiveFeatureIsOff *v4;

  v3 = a3;
  v4 = -[HKFeatureAvailabilityRequirementMutuallyExclusiveFeatureIsOff initWithFeatureIdentifier:]([HKFeatureAvailabilityRequirementMutuallyExclusiveFeatureIsOff alloc], "initWithFeatureIdentifier:", v3);

  return v4;
}

+ (id)notAgeGatedForUserDefaultsKey:(id)a3
{
  id v3;
  HKFeatureAvailabilityRequirementNotAgeGatedForUserDefaultsKey *v4;

  v3 = a3;
  v4 = -[HKFeatureAvailabilityRequirementNotAgeGatedForUserDefaultsKey initWithUserDefaultsKey:]([HKFeatureAvailabilityRequirementNotAgeGatedForUserDefaultsKey alloc], "initWithUserDefaultsKey:", v3);

  return v4;
}

+ (id)notInStoreDemoMode
{
  return objc_alloc_init(HKFeatureAvailabilityRequirementNotInStoreDemoMode);
}

+ (id)notificationAuthorizedWithBundleIdentifier:(id)a3
{
  id v3;
  HKFeatureAvailabilityRequirementNotificationAuthorized *v4;

  v3 = a3;
  v4 = -[HKFeatureAvailabilityRequirementNotificationAuthorized initWithBundleIdentifier:]([HKFeatureAvailabilityRequirementNotificationAuthorized alloc], "initWithBundleIdentifier:", v3);

  return v4;
}

+ (id)notificationsOnForUserDefaultsKey:(id)a3
{
  id v3;
  HKFeatureAvailabilityRequirementNotificationsOnForUserDefaultsKey *v4;

  v3 = a3;
  v4 = -[HKFeatureAvailabilityRequirementUserDefaultEvaluator initWithUserDefaultsKey:]([HKFeatureAvailabilityRequirementNotificationsOnForUserDefaultsKey alloc], "initWithUserDefaultsKey:", v3);

  return v4;
}

+ (id)onboardedAtLeastDaysAgo:(int64_t)a3 featureIdentifier:(id)a4
{
  id v5;
  HKFeatureAvailabilityRequirementOnboardedBeforeTimeAgo *v6;

  v5 = a4;
  v6 = -[HKFeatureAvailabilityRequirementOnboardedBeforeTimeAgo initWithFeatureIdentifier:daysBeforeCurrentDate:]([HKFeatureAvailabilityRequirementOnboardedBeforeTimeAgo alloc], "initWithFeatureIdentifier:daysBeforeCurrentDate:", v5, a3);

  return v6;
}

+ (id)onboardingAcknowledgedWithIdentifier:(id)a3
{
  id v3;
  HKFeatureAvailabilityRequirementOnboardingAcknowledged *v4;

  v3 = a3;
  v4 = -[HKFeatureAvailabilityRequirementOnboardingAcknowledged initWithFeatureIdentifier:]([HKFeatureAvailabilityRequirementOnboardingAcknowledged alloc], "initWithFeatureIdentifier:", v3);

  return v4;
}

+ (id)onboardingAcknowledgedWithIdentifier:(id)a3 settingsKey:(id)a4
{
  id v5;
  id v6;
  HKFeatureAvailabilityRequirementOnboardingAcknowledged *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[HKFeatureAvailabilityRequirementOnboardingAcknowledged initWithFeatureIdentifier:settingsKey:]([HKFeatureAvailabilityRequirementOnboardingAcknowledged alloc], "initWithFeatureIdentifier:settingsKey:", v6, v5);

  return v7;
}

+ (id)onboardingNotAcknowledgedWithIdentifier:(id)a3
{
  id v3;
  HKFeatureAvailabilityRequirementOnboardingNotAcknowledged *v4;

  v3 = a3;
  v4 = -[HKFeatureAvailabilityRequirementOnboardingNotAcknowledged initWithFeatureIdentifier:]([HKFeatureAvailabilityRequirementOnboardingNotAcknowledged alloc], "initWithFeatureIdentifier:", v3);

  return v4;
}

+ (id)onboardingNotAcknowledgedWithIdentifier:(id)a3 settingsKey:(id)a4
{
  id v5;
  id v6;
  HKFeatureAvailabilityRequirementOnboardingNotAcknowledged *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[HKFeatureAvailabilityRequirementOnboardingNotAcknowledged initWithFeatureIdentifier:settingsKey:]([HKFeatureAvailabilityRequirementOnboardingNotAcknowledged alloc], "initWithFeatureIdentifier:settingsKey:", v6, v5);

  return v7;
}

+ (id)onboardingRecordsArePresentForPrerequisiteFeaturesWithIdentifiers:(id)a3
{
  id v3;
  HKFeatureAvailabilityRequirementOnboardingRecordsArePresentForPrerequisiteFeatures *v4;

  v3 = a3;
  v4 = -[HKFeatureAvailabilityRequirementOnboardingRecordsArePresentForPrerequisiteFeatures initWithPrerequisiteFeatureIdentifiers:]([HKFeatureAvailabilityRequirementOnboardingRecordsArePresentForPrerequisiteFeatures alloc], "initWithPrerequisiteFeatureIdentifiers:", v3);

  return v4;
}

+ (id)onboardingRecordIsNotPresentForFeatureWithIdentifier:(id)a3
{
  id v3;
  HKFeatureAvailabilityRequirementOnboardingRecordIsNotPresent *v4;

  v3 = a3;
  v4 = -[HKFeatureAvailabilityOnboardingRecordRequirement initWithFeatureIdentifier:]([HKFeatureAvailabilityRequirementOnboardingRecordIsNotPresent alloc], "initWithFeatureIdentifier:", v3);

  return v4;
}

+ (id)onboardingRecordIsNotPresentForMutuallyExclusiveFeatureWithIdentifier:(id)a3
{
  id v3;
  HKFeatureAvailabilityRequirementOnboardingRecordIsNotPresentForMutuallyExclusiveFeature *v4;

  v3 = a3;
  v4 = -[HKFeatureAvailabilityOnboardingRecordRequirement initWithFeatureIdentifier:]([HKFeatureAvailabilityRequirementOnboardingRecordIsNotPresentForMutuallyExclusiveFeature alloc], "initWithFeatureIdentifier:", v3);

  return v4;
}

+ (id)onboardingRecordIsPresentForFeatureWithIdentifier:(id)a3
{
  id v3;
  HKFeatureAvailabilityRequirementOnboardingRecordIsPresent *v4;

  v3 = a3;
  v4 = -[HKFeatureAvailabilityOnboardingRecordRequirement initWithFeatureIdentifier:]([HKFeatureAvailabilityRequirementOnboardingRecordIsPresent alloc], "initWithFeatureIdentifier:", v3);

  return v4;
}

+ (id)onboardingUserDefaultsKeyIsNotPresent:(id)a3
{
  id v3;
  HKFeatureAvailabilityRequirementOnboardingUserDefaultsKeyIsNotPresent *v4;

  v3 = a3;
  v4 = -[HKFeatureAvailabilityRequirementUserDefaultEvaluator initWithUserDefaultsKey:]([HKFeatureAvailabilityRequirementOnboardingUserDefaultsKeyIsNotPresent alloc], "initWithUserDefaultsKey:", v3);

  return v4;
}

+ (id)onboardingUserDefaultsKeyIsPresent:(id)a3
{
  id v3;
  HKFeatureAvailabilityRequirementOnboardingUserDefaultsKeyIsPresent *v4;

  v3 = a3;
  v4 = -[HKFeatureAvailabilityRequirementUserDefaultEvaluator initWithUserDefaultsKey:]([HKFeatureAvailabilityRequirementOnboardingUserDefaultsKeyIsPresent alloc], "initWithUserDefaultsKey:", v3);

  return v4;
}

+ (id)prerequisiteFeaturesAreOnWithFeatureSettings:(id)a3
{
  id v3;
  HKFeatureAvailabilityRequirementPrerequisiteFeaturesAreOn *v4;

  v3 = a3;
  v4 = -[HKFeatureAvailabilityRequirementPrerequisiteFeaturesAreOn initWithPrerequisiteFeatureSettings:]([HKFeatureAvailabilityRequirementPrerequisiteFeaturesAreOn alloc], "initWithPrerequisiteFeatureSettings:", v3);

  return v4;
}

+ (id)profileIsNotFamilySetupPairingProfile
{
  return objc_alloc_init(HKFeatureAvailabilityRequirementProfileIsNotFamilySetupPairingProfile);
}

+ (id)seedIsNotExpiredForFeatureWithIdentifier:(id)a3
{
  id v3;
  HKFeatureAvailabilityRequirementSeedIsNotExpired *v4;

  v3 = a3;
  v4 = -[HKFeatureAvailabilityOnboardingEligibilityRequirement initWithFeatureIdentifier:]([HKFeatureAvailabilityRequirementSeedIsNotExpired alloc], "initWithFeatureIdentifier:", v3);

  return v4;
}

+ (id)someRegionIsSupportedForFeatureWithIdentifier:(id)a3
{
  id v3;
  HKFeatureAvailabilityRequirementSomeRegionIsSupported *v4;

  v3 = a3;
  v4 = -[HKFeatureAvailabilityRegionAvailabilityRequirement initWithFeatureIdentifier:]([HKFeatureAvailabilityRequirementSomeRegionIsSupported alloc], "initWithFeatureIdentifier:", v3);

  return v4;
}

+ (id)userDefaultsKeyIsNotPresent:(id)a3
{
  id v3;
  HKFeatureAvailabilityRequirementUserDefaultsKeyIsNotPresent *v4;

  v3 = a3;
  v4 = -[HKFeatureAvailabilityRequirementUserDefaultEvaluator initWithUserDefaultsKey:]([HKFeatureAvailabilityRequirementUserDefaultsKeyIsNotPresent alloc], "initWithUserDefaultsKey:", v3);

  return v4;
}

+ (id)walkingSteadinessCapabilityIsSupportedOnLocalDevice
{
  return objc_alloc_init(HKFeatureAvailabilityRequirementWalkingSteadinessCapabilityIsSupportedOnLocalDevice);
}

+ (id)watchAppIsInstalledForBundleIdentifier:(id)a3
{
  id v3;
  HKFeatureAvailabilityRequirementWatchAppIsInstalled *v4;

  v3 = a3;
  v4 = -[HKFeatureAvailabilityRequirementWatchAppIsInstalled initWithBundleIdentifier:]([HKFeatureAvailabilityRequirementWatchAppIsInstalled alloc], "initWithBundleIdentifier:", v3);

  return v4;
}

+ (id)watchLowPowerModeIsOff
{
  return objc_alloc_init(HKFeatureAvailabilityRequirementWatchLowPowerModeIsOff);
}

+ (id)wristDetectionIsEnabledForActiveWatch
{
  return objc_alloc_init(HKFeatureAvailabilityRequirementWristDetectionIsEnabledForActiveWatch);
}

+ (id)isNotInPostPregnancy
{
  return objc_alloc_init(HKFeatureAvailabilityRequirementNotInPostPregnancy);
}

+ (id)noOngoingPregnancy
{
  return objc_alloc_init(HKFeatureAvailabilityRequirementNoOngoingPregnancy);
}

+ (id)countryIsSupportedOnWatchForFeatureWithIdentifier:(id)a3 isSupportedIfCountryListMissing:(BOOL)a4
{
  _BOOL8 v4;
  id v5;
  void *v6;
  int v7;
  void *v8;

  v4 = a4;
  v5 = a3;
  +[_HKBehavior sharedBehavior](_HKBehavior, "sharedBehavior");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isAppleWatch");

  if (v7)
    +[HKFeatureAvailabilityRequirements countryIsSupportedOnLocalDeviceForFeatureWithIdentifier:](HKFeatureAvailabilityRequirements, "countryIsSupportedOnLocalDeviceForFeatureWithIdentifier:", v5);
  else
    +[HKFeatureAvailabilityRequirements countryIsSupportedOnActiveRemoteDeviceForFeatureWithIdentifier:isSupportedIfCountryListMissing:](HKFeatureAvailabilityRequirements, "countryIsSupportedOnActiveRemoteDeviceForFeatureWithIdentifier:isSupportedIfCountryListMissing:", v5, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)countryIsSupportedOnLocalDeviceAndPhoneForFeatureWithIdentifier:(id)a3 isSupportedIfCountryListMissing:(BOOL)a4
{
  _BOOL8 v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  id v11;
  _QWORD v13[2];

  v4 = a4;
  v13[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  +[HKFeatureAvailabilityRequirements countryIsSupportedOnLocalDeviceForFeatureWithIdentifier:](HKFeatureAvailabilityRequirements, "countryIsSupportedOnLocalDeviceForFeatureWithIdentifier:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  +[_HKBehavior sharedBehavior](_HKBehavior, "sharedBehavior");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isAppleWatch");

  if (v9)
  {
    +[HKFeatureAvailabilityRequirements countryIsSupportedOnActiveRemoteDeviceForFeatureWithIdentifier:isSupportedIfCountryListMissing:](HKFeatureAvailabilityRequirements, "countryIsSupportedOnActiveRemoteDeviceForFeatureWithIdentifier:isSupportedIfCountryListMissing:", v5, v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "arrayByAddingObject:", v10);
    v11 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = v7;
  }

  return v11;
}

+ (id)defaultOnboardingEligibilityRequirementsForFeatureIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[8];

  v14[7] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(a1, "currentCountryCodeIsPresentForFeatureWithIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "activeRemoteDeviceIsPresentWhenRequiredForRegionAvailabilityOrDeviceCapabilityForFeatureWithIdentifier:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v6;
  objc_msgSend(a1, "capabilityIsSupportedOnActiveRemoteDeviceForFeatureWithIdentifier:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14[2] = v7;
  objc_msgSend(a1, "currentCountryIsSupportedOnLocalDeviceForFeatureWithIdentifier:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14[3] = v8;
  objc_msgSend(a1, "currentCountryIsSupportedOnActiveRemoteDeviceForFeatureWithIdentifier:isSupportedIfCountryListMissing:", v4, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[4] = v9;
  objc_msgSend(a1, "featureIsNotRemotelyDisabledWithIdentifier:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[5] = v10;
  objc_msgSend(a1, "seedIsNotExpiredForFeatureWithIdentifier:", v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v14[6] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)defaultHelpTileRequirementsForBackgroundDeliveredFeatureWithFeatureIdentifier:(id)a3 isAgeGatedUserDefaultsKey:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = a3;
  objc_msgSend(a1, "defaultTipsAppVisibilityRequirementsForBackgroundDeliveredFeatureWithFeatureIdentifier:isAgeGatedUserDefaultsKey:", v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKFeatureAvailabilityRequirements featureIsOnWithIdentifier:isOnIfSettingIsAbsent:](HKFeatureAvailabilityRequirements, "featureIsOnWithIdentifier:isOnIfSettingIsAbsent:", v6, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "arrayByAddingObject:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)defaultTipsAppVisibilityRequirementsForBackgroundDeliveredFeatureWithFeatureIdentifier:(id)a3 isAgeGatedUserDefaultsKey:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v16;
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = a3;
  +[HKFeatureAvailabilityRequirements onboardingRecordIsPresentForFeatureWithIdentifier:](HKFeatureAvailabilityRequirements, "onboardingRecordIsPresentForFeatureWithIdentifier:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v7;
  +[HKFeatureAvailabilityRequirements featureIsNotRemotelyDisabledWithIdentifier:](HKFeatureAvailabilityRequirements, "featureIsNotRemotelyDisabledWithIdentifier:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKFeatureAvailabilityRequirements countryIsSupportedOnLocalDeviceAndPhoneForFeatureWithIdentifier:isSupportedIfCountryListMissing:](HKFeatureAvailabilityRequirements, "countryIsSupportedOnLocalDeviceAndPhoneForFeatureWithIdentifier:isSupportedIfCountryListMissing:", v6, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "arrayByAddingObjectsFromArray:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKFeatureAvailabilityRequirements notAgeGatedForUserDefaultsKey:](HKFeatureAvailabilityRequirements, "notAgeGatedForUserDefaultsKey:", v5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v16, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "arrayByAddingObjectsFromArray:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

@end
