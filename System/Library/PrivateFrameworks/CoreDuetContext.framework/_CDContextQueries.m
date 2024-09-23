@implementation _CDContextQueries

+ (BOOL)isMDCSKeyPath:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(a3, "key");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasPrefix:", CFSTR("/private/sync/"));

  return v4;
}

+ (id)keyPathForSystemTime
{
  if (keyPathForSystemTime_onceToken != -1)
    dispatch_once(&keyPathForSystemTime_onceToken, &__block_literal_global_124);
  return (id)keyPathForSystemTime_systemTime;
}

+ (id)keyPathForDeviceName
{
  if (keyPathForDeviceName_onceToken != -1)
    dispatch_once(&keyPathForDeviceName_onceToken, &__block_literal_global_108);
  return (id)keyPathForDeviceName_deviceName;
}

+ (id)keyPathForAppWebUsageDataDictionaries
{
  if (keyPathForAppWebUsageDataDictionaries_onceToken != -1)
    dispatch_once(&keyPathForAppWebUsageDataDictionaries_onceToken, &__block_literal_global_21);
  return (id)keyPathForAppWebUsageDataDictionaries_appWebUsageKeyPath;
}

+ (id)keyPathForPluginStatus
{
  if (keyPathForPluginStatus_onceToken != -1)
    dispatch_once(&keyPathForPluginStatus_onceToken, &__block_literal_global_133);
  return (id)keyPathForPluginStatus_pluginStatus;
}

+ (id)appBundleIdKey
{
  return CFSTR("bundleId");
}

+ (id)appUsageBundleID
{
  return CFSTR("bundleID");
}

+ (id)appLaunchReasonKey
{
  return CFSTR("launchReason");
}

+ (id)batteryExternalConnectedKey
{
  return CFSTR("externalConnected");
}

+ (id)batteryIsChargingKey
{
  return CFSTR("isCharging");
}

+ (id)batteryFullyChargedKey
{
  return CFSTR("fullyCharged");
}

+ (id)batteryVoltageKey
{
  return CFSTR("voltage");
}

+ (id)batteryTemperatureKey
{
  return CFSTR("temperature");
}

+ (id)batteryAdapterIsWirelessKey
{
  return CFSTR("isWireless");
}

+ (id)isUsageTrusted
{
  return CFSTR("isUsageTrusted");
}

+ (id)appUsageType
{
  return CFSTR("usageType");
}

+ (id)appUsageStartDate
{
  return CFSTR("startDate");
}

+ (id)batteryRawExternalConnectedKey
{
  return CFSTR("rawExternalConnected");
}

+ (id)keyPathForInUseStatus
{
  if (keyPathForInUseStatus_onceToken != -1)
    dispatch_once(&keyPathForInUseStatus_onceToken, &__block_literal_global_5);
  return (id)keyPathForInUseStatus_inUseStatus;
}

+ (id)keyPathForAppUsageDataDictionaries
{
  if (keyPathForAppUsageDataDictionaries_onceToken != -1)
    dispatch_once(&keyPathForAppUsageDataDictionaries_onceToken, &__block_literal_global_2);
  return (id)keyPathForAppUsageDataDictionaries_appUsageKeyPath;
}

+ (id)batteryAdapterTypeKey
{
  return CFSTR("adapterType");
}

+ (id)batteryRawExternalConnectedChangeDateKey
{
  return CFSTR("rawExternalConnectedChangeDate");
}

+ (id)batteryExternalConnectedChangeDateKey
{
  return CFSTR("externalConnectedChangeDate");
}

+ (id)keyPathForForegroundApp
{
  if (keyPathForForegroundApp_onceToken != -1)
    dispatch_once(&keyPathForForegroundApp_onceToken, &__block_literal_global_95);
  return (id)keyPathForForegroundApp_foregroundApp;
}

+ (id)keyPathForAppDataDictionary
{
  if (keyPathForAppDataDictionary_onceToken != -1)
    dispatch_once(&keyPathForAppDataDictionary_onceToken, &__block_literal_global_12);
  return (id)keyPathForAppDataDictionary_appData;
}

+ (id)keyPathForCallInProgressStatus
{
  if (keyPathForCallInProgressStatus_onceToken != -1)
    dispatch_once(&keyPathForCallInProgressStatus_onceToken, &__block_literal_global_96);
  return (id)keyPathForCallInProgressStatus_callInProgressStatus;
}

+ (id)keyPathForCarplayConnectedStatus
{
  if (keyPathForCarplayConnectedStatus_onceToken != -1)
    dispatch_once(&keyPathForCarplayConnectedStatus_onceToken, &__block_literal_global_121);
  return (id)keyPathForCarplayConnectedStatus_carplayConnectedStatus;
}

+ (id)keyPathForDefaultPairedDeviceForegroundApp
{
  if (keyPathForDefaultPairedDeviceForegroundApp_onceToken != -1)
    dispatch_once(&keyPathForDefaultPairedDeviceForegroundApp_onceToken, &__block_literal_global_145);
  return (id)keyPathForDefaultPairedDeviceForegroundApp_defaultPairedForegroundApp;
}

+ (id)keyPathForDefaultPairedServicesAppearingForeground
{
  if (keyPathForDefaultPairedServicesAppearingForeground_onceToken != -1)
    dispatch_once(&keyPathForDefaultPairedServicesAppearingForeground_onceToken, &__block_literal_global_4);
  return (id)keyPathForDefaultPairedServicesAppearingForeground_defaultPairedServicesAppearingForeground;
}

+ (id)keyPathForCircularLocationRegions
{
  if (keyPathForCircularLocationRegions_onceToken != -1)
    dispatch_once(&keyPathForCircularLocationRegions_onceToken, &__block_literal_global_7);
  return (id)keyPathForCircularLocationRegions_circularLocationRegionsKeyPath;
}

+ (id)keyPathForEnergyBudgetRemainingStatus
{
  if (keyPathForEnergyBudgetRemainingStatus_onceToken != -1)
    dispatch_once(&keyPathForEnergyBudgetRemainingStatus_onceToken, &__block_literal_global_137);
  return (id)keyPathForEnergyBudgetRemainingStatus_energyBudgetRemainingStatus;
}

+ (id)batteryPercentageKey
{
  return CFSTR("percentage");
}

+ (id)keyPathForServicesAppearingForeground
{
  if (keyPathForServicesAppearingForeground_onceToken != -1)
    dispatch_once(&keyPathForServicesAppearingForeground_onceToken, &__block_literal_global_21);
  return (id)keyPathForServicesAppearingForeground_servicesAppearingForeground;
}

+ (id)keyPathForMotionState
{
  if (keyPathForMotionState_onceToken != -1)
    dispatch_once(&keyPathForMotionState_onceToken, &__block_literal_global_123);
  return (id)keyPathForMotionState_motionState;
}

+ (id)keyPathForActiveComplications
{
  if (keyPathForActiveComplications_onceToken != -1)
    dispatch_once(&keyPathForActiveComplications_onceToken, &__block_literal_global_146);
  return (id)keyPathForActiveComplications_activeComplications;
}

+ (id)keyPathForKeybagLockStatus
{
  if (keyPathForKeybagLockStatus_onceToken != -1)
    dispatch_once(&keyPathForKeybagLockStatus_onceToken, &__block_literal_global_103);
  return (id)keyPathForKeybagLockStatus_keybagLockStatus;
}

+ (id)keyPathForBatteryLevel
{
  if (keyPathForBatteryLevel_onceToken != -1)
    dispatch_once(&keyPathForBatteryLevel_onceToken, &__block_literal_global_132);
  return (id)keyPathForBatteryLevel_batteryLevel;
}

+ (id)keyPathForBatteryStateDataDictionary
{
  if (keyPathForBatteryStateDataDictionary_onceToken != -1)
    dispatch_once(&keyPathForBatteryStateDataDictionary_onceToken, &__block_literal_global_3);
  return (id)keyPathForBatteryStateDataDictionary_batteryData;
}

+ (id)keyPathForNetworkingBudgetRemainingStatus
{
  if (keyPathForNetworkingBudgetRemainingStatus_onceToken != -1)
    dispatch_once(&keyPathForNetworkingBudgetRemainingStatus_onceToken, &__block_literal_global_138);
  return (id)keyPathForNetworkingBudgetRemainingStatus_networkingBudgetRemainingStatus;
}

+ (id)keyPathForDeviceLockStatus
{
  if (keyPathForDeviceLockStatus_onceToken != -1)
    dispatch_once(&keyPathForDeviceLockStatus_onceToken, &__block_literal_global_102);
  return (id)keyPathForDeviceLockStatus_deviceLockStatus;
}

+ (id)keyPathForUserActivityDataDictionary
{
  if (keyPathForUserActivityDataDictionary_onceToken != -1)
    dispatch_once(&keyPathForUserActivityDataDictionary_onceToken, &__block_literal_global_29);
  return (id)keyPathForUserActivityDataDictionary_intentsData;
}

+ (id)keyPathForIntentsDataDictionary
{
  if (keyPathForIntentsDataDictionary_onceToken != -1)
    dispatch_once(&keyPathForIntentsDataDictionary_onceToken, &__block_literal_global_6);
  return (id)keyPathForIntentsDataDictionary_intentsData;
}

+ (id)keyPathForBacklightOnStatus
{
  if (keyPathForBacklightOnStatus_onceToken != -1)
    dispatch_once(&keyPathForBacklightOnStatus_onceToken, &__block_literal_global_97);
  return (id)keyPathForBacklightOnStatus_backlightOnStatus;
}

+ (id)intentSourceItemIDKey
{
  return CFSTR("sourceItemID");
}

+ (id)intentSourceBundleIDKey
{
  return CFSTR("sourceBundleID");
}

+ (id)intentHandlingStatusKey
{
  return CFSTR("handlingStatus");
}

+ (id)intentDonatedBySiriKey
{
  return CFSTR("donatedBySiri");
}

+ (id)intentDirectionKey
{
  return CFSTR("direction");
}

+ (id)intentDKObjUUIDKey
{
  return CFSTR("DKObjUUID");
}

+ (id)intentClassKey
{
  return CFSTR("intentClass");
}

+ (id)keyPathForThermalPressureLevel
{
  if (keyPathForThermalPressureLevel_onceToken != -1)
    dispatch_once(&keyPathForThermalPressureLevel_onceToken, &__block_literal_global_134);
  return (id)keyPathForThermalPressureLevel_thermalPressureLevel;
}

+ (id)keyPathForNextUserVisibleWakeDate
{
  if (keyPathForNextUserVisibleWakeDate_onceToken != -1)
    dispatch_once(&keyPathForNextUserVisibleWakeDate_onceToken, &__block_literal_global_100);
  return (id)keyPathForNextUserVisibleWakeDate_nextUserVisibleWakeDate;
}

+ (id)keyPathForLastUseDate
{
  if (keyPathForLastUseDate_onceToken != -1)
    dispatch_once(&keyPathForLastUseDate_onceToken, &__block_literal_global_90);
  return (id)keyPathForLastUseDate_lastUseDate;
}

+ (id)keyPathForDefaultPairedDevicePluginStatus
{
  if (keyPathForDefaultPairedDevicePluginStatus_onceToken != -1)
    dispatch_once(&keyPathForDefaultPairedDevicePluginStatus_onceToken, &__block_literal_global_143);
  return (id)keyPathForDefaultPairedDevicePluginStatus_defaultPairedPluginStatus;
}

+ (id)keyPathForHomeKitSceneDataDictionary
{
  if (keyPathForHomeKitSceneDataDictionary_onceToken != -1)
    dispatch_once(&keyPathForHomeKitSceneDataDictionary_onceToken, &__block_literal_global);
  return (id)keyPathForHomeKitSceneDataDictionary_homeKitData;
}

+ (id)sceneHomeUUID
{
  return CFSTR("sceneHomeUUID");
}

+ (id)actionSetUUID
{
  return CFSTR("actionSetUUID");
}

+ (id)actionSetName
{
  return CFSTR("actionSetName");
}

+ (id)actionSetType
{
  return CFSTR("actionSetType");
}

+ (id)sceneClientName
{
  return CFSTR("sceneClientName");
}

+ (id)sceneName
{
  return CFSTR("sceneName");
}

+ (id)keyPathForRecentEmails
{
  if (keyPathForRecentEmails_onceToken != -1)
    dispatch_once(&keyPathForRecentEmails_onceToken, &__block_literal_global_0);
  return (id)keyPathForRecentEmails_incomingEmailsKeyPath;
}

+ (id)keyPathForRecentMessages
{
  if (keyPathForRecentMessages_onceToken != -1)
    dispatch_once(&keyPathForRecentMessages_onceToken, &__block_literal_global_2);
  return (id)keyPathForRecentMessages_messagesKeyPath;
}

+ (id)senderKey
{
  return CFSTR("sender");
}

+ (id)recipientsKey
{
  return CFSTR("recipients");
}

+ (id)subjectKey
{
  return CFSTR("subject");
}

+ (id)hasAttachmentsKey
{
  return CFSTR("hasAttachments");
}

+ (id)identifierKey
{
  return CFSTR("identifier");
}

+ (id)accountIdentifierKey
{
  return CFSTR("accountIdentifier");
}

+ (id)incomingKey
{
  return CFSTR("incoming");
}

+ (id)senderHandlesKey
{
  return CFSTR("senderHandles");
}

+ (id)senderContactIDKey
{
  return CFSTR("senderContactID");
}

+ (id)recipientContactIDsKey
{
  return CFSTR("recipientContactIDs");
}

+ (id)contentKey
{
  return CFSTR("content");
}

+ (id)conversationIdentifierKey
{
  return CFSTR("conversationIdentifier");
}

+ (id)keyPathForLocationCoordinates
{
  if (keyPathForLocationCoordinates_onceToken != -1)
    dispatch_once(&keyPathForLocationCoordinates_onceToken, &__block_literal_global_1);
  return (id)keyPathForLocationCoordinates_locationCoordniateKeyPath;
}

+ (id)latitudeKey
{
  return CFSTR("latitude");
}

+ (id)longitudeKey
{
  return CFSTR("longitude");
}

+ (id)altitudeKey
{
  return CFSTR("altitude");
}

+ (id)timestampKey
{
  return CFSTR("timestamp");
}

+ (id)keyPathForAppRunningDataDictionaries
{
  if (keyPathForAppRunningDataDictionaries_onceToken != -1)
    dispatch_once(&keyPathForAppRunningDataDictionaries_onceToken, &__block_literal_global_2_0);
  return (id)keyPathForAppRunningDataDictionaries_appActiveKeyPath;
}

+ (id)appUsageSafariProfileID
{
  return CFSTR("safariProfileID");
}

+ (id)appWebUsageBundleID
{
  return +[_CDContextQueries appUsageBundleID](_CDContextQueries, "appUsageBundleID");
}

+ (id)appWebUsageStartDate
{
  return +[_CDContextQueries appUsageStartDate](_CDContextQueries, "appUsageStartDate");
}

+ (id)appWebUsageType
{
  return +[_CDContextQueries appUsageType](_CDContextQueries, "appUsageType");
}

+ (id)appWebUsageWepageURL
{
  return CFSTR("webpageURL");
}

+ (id)appWebUsageWebDomain
{
  return CFSTR("webDomain");
}

+ (id)appWebUsageSafariProfileID
{
  return +[_CDContextQueries appUsageSafariProfileID](_CDContextQueries, "appUsageSafariProfileID");
}

+ (id)keyPathForAppMediaUsageDataDictionaries
{
  if (keyPathForAppMediaUsageDataDictionaries_onceToken != -1)
    dispatch_once(&keyPathForAppMediaUsageDataDictionaries_onceToken, &__block_literal_global_37);
  return (id)keyPathForAppMediaUsageDataDictionaries_usageKeyPath;
}

+ (id)appMediaUsageBundleID
{
  return +[_CDContextQueries appUsageBundleID](_CDContextQueries, "appUsageBundleID");
}

+ (id)appMediaUsageStartDate
{
  return +[_CDContextQueries appUsageStartDate](_CDContextQueries, "appUsageStartDate");
}

+ (id)appMediaUsageURL
{
  return CFSTR("URL");
}

+ (id)appMediaUsageMediaURL
{
  return CFSTR("mediaURL");
}

+ (id)appMediaSafariProfileID
{
  return +[_CDContextQueries appUsageSafariProfileID](_CDContextQueries, "appUsageSafariProfileID");
}

+ (id)predicateForInUseStatus:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  objc_msgSend(a1, "keyPathForInUseStatus");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[_CDContextualPredicate predicateForKeyPath:withFormat:](_CDContextualPredicate, "predicateForKeyPath:withFormat:", v4, CFSTR("self.%@.value == %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)keyPathForDisplayOnBeforeFirstUnlockOfTheDayStatus
{
  if (keyPathForDisplayOnBeforeFirstUnlockOfTheDayStatus_onceToken != -1)
    dispatch_once(&keyPathForDisplayOnBeforeFirstUnlockOfTheDayStatus_onceToken, &__block_literal_global_98);
  return (id)keyPathForDisplayOnBeforeFirstUnlockOfTheDayStatus_displayOnBeforeFirstUnlockOfTheDayStatus;
}

+ (id)keyPathForDeviceAssertionsHeldStatus
{
  if (keyPathForDeviceAssertionsHeldStatus_onceToken != -1)
    dispatch_once(&keyPathForDeviceAssertionsHeldStatus_onceToken, &__block_literal_global_99);
  return (id)keyPathForDeviceAssertionsHeldStatus_deviceAssertionsHeld;
}

+ (id)keyPathForFirstWakeupStatus
{
  if (keyPathForFirstWakeupStatus_onceToken != -1)
    dispatch_once(&keyPathForFirstWakeupStatus_onceToken, &__block_literal_global_101);
  return (id)keyPathForFirstWakeupStatus_firstWakeup;
}

+ (id)keyPathForMediaPlayingStatus
{
  if (keyPathForMediaPlayingStatus_onceToken != -1)
    dispatch_once(&keyPathForMediaPlayingStatus_onceToken, &__block_literal_global_104);
  return (id)keyPathForMediaPlayingStatus_mediaPlayingStatus;
}

+ (id)keyPathForNavigationStatus
{
  if (keyPathForNavigationStatus_onceToken != -1)
    dispatch_once(&keyPathForNavigationStatus_onceToken, &__block_literal_global_105);
  return (id)keyPathForNavigationStatus_navigationStatus;
}

+ (id)keyPathForCarConnectedStatus
{
  if (keyPathForCarConnectedStatus_onceToken != -1)
    dispatch_once(&keyPathForCarConnectedStatus_onceToken, &__block_literal_global_106);
  return (id)keyPathForCarConnectedStatus_carConnectedStatus;
}

+ (id)keyPathForSiriActiveStatus
{
  if (keyPathForSiriActiveStatus_onceToken != -1)
    dispatch_once(&keyPathForSiriActiveStatus_onceToken, &__block_literal_global_107);
  return (id)keyPathForSiriActiveStatus_siriActiveStatus;
}

+ (id)keyPathForDeviceID
{
  if (keyPathForDeviceID_onceToken != -1)
    dispatch_once(&keyPathForDeviceID_onceToken, &__block_literal_global_109);
  return (id)keyPathForDeviceID_deviceID;
}

+ (id)keyPathForLowPowerModeStatus
{
  if (keyPathForLowPowerModeStatus_onceToken != -1)
    dispatch_once(&keyPathForLowPowerModeStatus_onceToken, &__block_literal_global_110);
  return (id)keyPathForLowPowerModeStatus_lowPowerModeStatus;
}

+ (id)keyPathForDoNotDisturbStatus
{
  if (keyPathForDoNotDisturbStatus_onceToken != -1)
    dispatch_once(&keyPathForDoNotDisturbStatus_onceToken, &__block_literal_global_111);
  return (id)keyPathForDoNotDisturbStatus_doNotDisturbStatus;
}

+ (id)predicateForDoNotDisturbStatus:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  objc_msgSend(a1, "keyPathForDoNotDisturbStatus");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[_CDContextualPredicate predicateForKeyPath:withFormat:](_CDContextualPredicate, "predicateForKeyPath:withFormat:", v4, CFSTR("self.%@.value == %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)keyPathForAirplaneModeStatus
{
  if (keyPathForAirplaneModeStatus_onceToken != -1)
    dispatch_once(&keyPathForAirplaneModeStatus_onceToken, &__block_literal_global_112);
  return (id)keyPathForAirplaneModeStatus_airplaneModeStatus;
}

+ (id)keyPathForWiFiConnectionSSID
{
  if (keyPathForWiFiConnectionSSID_onceToken != -1)
    dispatch_once(&keyPathForWiFiConnectionSSID_onceToken, &__block_literal_global_113);
  return (id)keyPathForWiFiConnectionSSID_wifiConnectionSSIDKeyPath;
}

+ (id)keyPathForWiredConnectionQuality
{
  if (keyPathForWiredConnectionQuality_onceToken != -1)
    dispatch_once(&keyPathForWiredConnectionQuality_onceToken, &__block_literal_global_114);
  return (id)keyPathForWiredConnectionQuality_wiredConnectionQuality;
}

+ (id)predicateForWiredConnectionAvailability:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  const __CFString *v5;
  void *v6;

  v3 = a3;
  objc_msgSend(a1, "keyPathForWiredConnectionQuality");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    v5 = CFSTR("self.%@.value > 0");
  else
    v5 = CFSTR("self.%@.value == 0");
  +[_CDContextualPredicate predicateForKeyPath:withFormat:](_CDContextualPredicate, "predicateForKeyPath:withFormat:", v4, v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)keyPathForWiFiConnectionQuality
{
  if (keyPathForWiFiConnectionQuality_onceToken != -1)
    dispatch_once(&keyPathForWiFiConnectionQuality_onceToken, &__block_literal_global_119);
  return (id)keyPathForWiFiConnectionQuality_wifiConnectionQuality;
}

+ (id)predicateForWiFiConnectionAvailability:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  const __CFString *v5;
  void *v6;

  v3 = a3;
  objc_msgSend(a1, "keyPathForWiFiConnectionQuality");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    v5 = CFSTR("self.%@.value > 0");
  else
    v5 = CFSTR("self.%@.value == 0");
  +[_CDContextualPredicate predicateForKeyPath:withFormat:](_CDContextualPredicate, "predicateForKeyPath:withFormat:", v4, v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)keyPathForCellConnectionQuality
{
  if (keyPathForCellConnectionQuality_onceToken != -1)
    dispatch_once(&keyPathForCellConnectionQuality_onceToken, &__block_literal_global_120);
  return (id)keyPathForCellConnectionQuality_cellConnectionQuality;
}

+ (id)predicateForCellConnectionAvailability:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  const __CFString *v5;
  void *v6;

  v3 = a3;
  objc_msgSend(a1, "keyPathForCellConnectionQuality");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    v5 = CFSTR("self.%@.value > 0");
  else
    v5 = CFSTR("self.%@.value == 0");
  +[_CDContextualPredicate predicateForKeyPath:withFormat:](_CDContextualPredicate, "predicateForKeyPath:withFormat:", v4, v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)keyPathForWorkoutStatus
{
  if (keyPathForWorkoutStatus_onceToken != -1)
    dispatch_once(&keyPathForWorkoutStatus_onceToken, &__block_literal_global_122);
  return (id)keyPathForWorkoutStatus_workoutStatus;
}

+ (id)predicateForSystemTimeInInterval:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  objc_msgSend(a1, "keyPathForSystemTime");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(v4, "startDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "endDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "predicateWithFormat:", CFSTR("self.%@.value >= %@ AND self.%@.value <= %@"), v5, v7, v5, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  +[_CDContextualPredicate predicateForKeyPath:withPredicate:](_CDContextualPredicate, "predicateForKeyPath:withPredicate:", v5, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E40], "orderedSetWithObject:", v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setTimeBasedPredicateEvaluationIntervals:", v11);
  return v10;
}

+ (id)predicateForSystemTime:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = (objc_class *)MEMORY[0x1E0CB3588];
  v5 = a3;
  v6 = [v4 alloc];
  objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithStartDate:endDate:", v5, v7);

  objc_msgSend(a1, "predicateForSystemTimeInInterval:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)predicateForSystemTime:(id)a3 gracePeriod:(double)a4
{
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(a3, "dateByAddingTimeInterval:", -a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:duration:", v6, a4 + a4);
  objc_msgSend(a1, "predicateForSystemTimeInInterval:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)keyPathForLowBattery
{
  if (keyPathForLowBattery_onceToken != -1)
    dispatch_once(&keyPathForLowBattery_onceToken, &__block_literal_global_131);
  return (id)keyPathForLowBattery_lowBattery;
}

+ (id)predicateForBatteryLevel:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(a1, "keyPathForBatteryLevel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[_CDContextualPredicate predicateForKeyPath:withFormat:](_CDContextualPredicate, "predicateForKeyPath:withFormat:", v5, CFSTR("self.%@.value == %@"), v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)predicateForPluginStatus:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  objc_msgSend(a1, "keyPathForPluginStatus");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[_CDContextualPredicate predicateForKeyPath:withFormat:](_CDContextualPredicate, "predicateForKeyPath:withFormat:", v4, CFSTR("self.%@.value == %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)keyPathForCPUUsageLevel
{
  if (keyPathForCPUUsageLevel_onceToken != -1)
    dispatch_once(&keyPathForCPUUsageLevel_onceToken, &__block_literal_global_135);
  return (id)keyPathForCPUUsageLevel_cpuUsageLevel;
}

+ (id)keyPathForNearbyLOIIdentifiers
{
  if (keyPathForNearbyLOIIdentifiers_onceToken != -1)
    dispatch_once(&keyPathForNearbyLOIIdentifiers_onceToken, &__block_literal_global_136);
  return (id)keyPathForNearbyLOIIdentifiers_nearbyLoiIdentifiers;
}

+ (id)keyPathForWatchNearbyStatus
{
  return +[_CDContextQueries keyPathForDefaultPairedDeviceNearbyStatus](_CDContextQueries, "keyPathForDefaultPairedDeviceNearbyStatus");
}

+ (id)keyPathForDefaultPairedDeviceNearbyStatus
{
  if (keyPathForDefaultPairedDeviceNearbyStatus_onceToken != -1)
    dispatch_once(&keyPathForDefaultPairedDeviceNearbyStatus_onceToken, &__block_literal_global_140);
  return (id)keyPathForDefaultPairedDeviceNearbyStatus_defaultPairedNearbyStatus;
}

+ (id)keyPathForWatchActiveStatus
{
  if (keyPathForWatchActiveStatus_onceToken != -1)
    dispatch_once(&keyPathForWatchActiveStatus_onceToken, &__block_literal_global_141);
  return (id)keyPathForWatchActiveStatus_defaultPairedActiveStatus;
}

+ (id)keyPathForWatchBatteryLevel
{
  return +[_CDContextQueries keyPathForDefaultPairedDeviceBatteryLevel](_CDContextQueries, "keyPathForDefaultPairedDeviceBatteryLevel");
}

+ (id)keyPathForDefaultPairedDeviceBatteryLevel
{
  if (keyPathForDefaultPairedDeviceBatteryLevel_onceToken != -1)
    dispatch_once(&keyPathForDefaultPairedDeviceBatteryLevel_onceToken, &__block_literal_global_142);
  return (id)keyPathForDefaultPairedDeviceBatteryLevel_defaultPairedBatteryLevel;
}

+ (id)keyPathForWatchPluginStatus
{
  return +[_CDContextQueries keyPathForDefaultPairedDevicePluginStatus](_CDContextQueries, "keyPathForDefaultPairedDevicePluginStatus");
}

+ (id)keyPathForWatchThermalPressureLevel
{
  return +[_CDContextQueries keyPathForDefaultPairedDeviceThermalPressureLevel](_CDContextQueries, "keyPathForDefaultPairedDeviceThermalPressureLevel");
}

+ (id)keyPathForDefaultPairedDeviceThermalPressureLevel
{
  if (keyPathForDefaultPairedDeviceThermalPressureLevel_onceToken != -1)
    dispatch_once(&keyPathForDefaultPairedDeviceThermalPressureLevel_onceToken, &__block_literal_global_144);
  return (id)keyPathForDefaultPairedDeviceThermalPressureLevel_defaultPairedThermalPressureLevel;
}

+ (id)keyPathForWatchForegroundApp
{
  return +[_CDContextQueries keyPathForDefaultPairedDeviceForegroundApp](_CDContextQueries, "keyPathForDefaultPairedDeviceForegroundApp");
}

+ (id)keyPathForDefaultPairedDeviceWiFiWiredQuality
{
  if (keyPathForDefaultPairedDeviceWiFiWiredQuality_onceToken != -1)
    dispatch_once(&keyPathForDefaultPairedDeviceWiFiWiredQuality_onceToken, &__block_literal_global_147);
  return (id)keyPathForDefaultPairedDeviceWiFiWiredQuality_defaultPairedWiFiWiredQuality;
}

+ (id)keyPathForDefaultPairedDeviceCellQuality
{
  if (keyPathForDefaultPairedDeviceCellQuality_onceToken != -1)
    dispatch_once(&keyPathForDefaultPairedDeviceCellQuality_onceToken, &__block_literal_global_148);
  return (id)keyPathForDefaultPairedDeviceCellQuality_defaultPairedCellQuality;
}

+ (id)source
{
  return CFSTR("source");
}

+ (id)intentTypeKey
{
  return CFSTR("type");
}

+ (id)intentVerbKey
{
  return CFSTR("verb");
}

+ (id)predicateForCircularLocationRegion:(id)a3
{
  return (id)objc_msgSend(a1, "predicateForCircularLocationRegion:state:", a3, 1);
}

+ (id)predicateForCircularLocationRegion:(id)a3 state:(int64_t)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v25;

  v6 = a3;
  if (v6)
  {
    objc_msgSend(a1, "keyPathForCircularLocationRegions");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)MEMORY[0x1E0CB3880];
    v8 = v6;
    +[_CDContextQueries keyPathForCircularLocationRegions](_CDContextQueries, "keyPathForCircularLocationRegions");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[_CDContextQueries regionIdentifierKey](_CDContextQueries, "regionIdentifierKey");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    +[_CDContextQueries regionStateKey](_CDContextQueries, "regionStateKey");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "predicateWithFormat:", CFSTR("SUBQUERY(self.%@.value, $regionInfo, $regionInfo.%K == %@ AND $regionInfo.%K == %@).@count > 0"), v9, v10, v11, v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if ((unint64_t)(a4 - 1) > 1)
    {
      v21 = 0;
    }
    else
    {
      if (a4 == 1)
        v15 = 2;
      else
        v15 = 1;
      v16 = (void *)MEMORY[0x1E0CB3880];
      +[_CDContextQueries regionIdentifierKey](_CDContextQueries, "regionIdentifierKey");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "identifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      +[_CDContextQueries regionStateKey](_CDContextQueries, "regionStateKey");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v15);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "predicateWithFormat:", CFSTR("SUBQUERY(SELF.value, $regionInfo, $regionInfo.%K == %@ AND $regionInfo.%K == %@).@count > 0"), v17, v18, v19, v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

    }
    +[_CDContextualPredicate predicateForKeyPath:withPredicate:withPredicateForPreviousState:withMinimumDurationInPreviousState:](_CDContextualPredicate, "predicateForKeyPath:withPredicate:withPredicateForPreviousState:withMinimumDurationInPreviousState:", v25, v14, v21, 0.0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v8);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setCircularLocationRegions:", v23);

  }
  else
  {
    v22 = 0;
  }

  return v22;
}

+ (id)regionIdentifierKey
{
  return CFSTR("regionIdentifier");
}

+ (id)regionStateKey
{
  return CFSTR("regionState");
}

+ (id)changeDateKey
{
  return CFSTR("changeDate");
}

+ (id)keyPathForHomeKitAccessoryDataDictionary
{
  if (keyPathForHomeKitAccessoryDataDictionary_onceToken != -1)
    dispatch_once(&keyPathForHomeKitAccessoryDataDictionary_onceToken, &__block_literal_global_9);
  return (id)keyPathForHomeKitAccessoryDataDictionary_homeKitData;
}

+ (id)accessoryHomeUUID
{
  return CFSTR("accessoryHomeUUID");
}

+ (id)accessoryUUID
{
  return CFSTR("accessoryUUID");
}

+ (id)accessoryName
{
  return CFSTR("accessoryName");
}

+ (id)serviceName
{
  return CFSTR("serviceName");
}

+ (id)serviceType
{
  return CFSTR("serviceType");
}

+ (id)characteristicType
{
  return CFSTR("characteristicType");
}

+ (id)accessoryClientName
{
  return CFSTR("accessoryClientName");
}

+ (id)serviceUUID
{
  return CFSTR("serviceUUID");
}

+ (id)accessoryState
{
  return CFSTR("accessoryState");
}

+ (id)keyPathForAppClipLaunch
{
  if (keyPathForAppClipLaunch_onceToken != -1)
    dispatch_once(&keyPathForAppClipLaunch_onceToken, &__block_literal_global_8);
  return (id)keyPathForAppClipLaunch_appClipLaunchKeyPath;
}

+ (id)timeSinceDownloadKey
{
  return CFSTR("timeSinceDownload");
}

+ (id)URLHashKey
{
  return CFSTR("URLHash");
}

+ (id)clipBundleIDKey
{
  return CFSTR("clipBundleID");
}

+ (id)webAppBundleIDKey
{
  return CFSTR("webAppBundleID");
}

+ (id)fullURLKey
{
  return CFSTR("fullURL");
}

+ (id)referrerURLKey
{
  return CFSTR("referrerURL");
}

+ (id)keyPathForPredictedLocationOfInterestTransitions
{
  if (keyPathForPredictedLocationOfInterestTransitions_onceToken != -1)
    dispatch_once(&keyPathForPredictedLocationOfInterestTransitions_onceToken, &__block_literal_global_14);
  return (id)keyPathForPredictedLocationOfInterestTransitions_predictedLocationOfInterestTransitionsKeyPath;
}

+ (id)locationOfInterestUUIDKey
{
  return CFSTR("locationOfInterestUUID");
}

+ (id)locationOfInterestTypeKey
{
  return CFSTR("locationOfInterestType");
}

+ (id)transitionWithinTimeIntervalKey
{
  return CFSTR("transitionWithinTimeInterval");
}

+ (id)keyPathForActiveCall
{
  if (keyPathForActiveCall_onceToken != -1)
    dispatch_once(&keyPathForActiveCall_onceToken, &__block_literal_global_15);
  return (id)keyPathForActiveCall_keyPathForActiveCall;
}

+ (id)calleeContactIDKey
{
  return CFSTR("calleeContactID");
}

+ (id)calleeHandleKey
{
  return CFSTR("calleeHandle");
}

+ (id)calleeContactIDsKey
{
  return CFSTR("calleeContactIDs");
}

+ (id)calleeHandlesKey
{
  return CFSTR("calleeHandles");
}

+ (id)bundleIDKey
{
  return CFSTR("bundleID");
}

+ (id)groupIDKey
{
  return CFSTR("groupID");
}

+ (id)groupNameKey
{
  return CFSTR("groupName");
}

+ (id)keyPathForNowPlayingDataDictionary
{
  if (keyPathForNowPlayingDataDictionary_onceToken != -1)
    dispatch_once(&keyPathForNowPlayingDataDictionary_onceToken, &__block_literal_global_17);
  return (id)keyPathForNowPlayingDataDictionary_nowPlayingData;
}

+ (id)nowPlayingStatusKey
{
  return CFSTR("status");
}

+ (id)nowPlayingBundleIdKey
{
  return CFSTR("bundleId");
}

+ (id)nowPlayingTrackKey
{
  return CFSTR("track");
}

+ (id)nowPlayingOutputDeviceIDsKey
{
  return CFSTR("outputDeviceIDs");
}

+ (id)nowPlayingMediaTypeKey
{
  return CFSTR("mediaType");
}

+ (id)nowPlayingiTunesStoreIdentifierKey
{
  return CFSTR("iTunesStoreIdentifier");
}

+ (id)nowPlayingiTunesSubscriptionIdentifierKey
{
  return CFSTR("iTunesSubscriptionIdentifier");
}

+ (id)nowPlayingCreationDateKey
{
  return CFSTR("creation");
}

+ (id)keyPathForAudioOutputDataDictionary
{
  if (keyPathForAudioOutputDataDictionary_onceToken != -1)
    dispatch_once(&keyPathForAudioOutputDataDictionary_onceToken, &__block_literal_global_20);
  return (id)keyPathForAudioOutputDataDictionary_audioData;
}

+ (id)audioOutputStatusKey
{
  return CFSTR("status");
}

+ (id)audioPortTypeKey
{
  return CFSTR("portType");
}

+ (id)audioPortNameKey
{
  return CFSTR("portName");
}

+ (id)audioIdentifierKey
{
  return CFSTR("identifier");
}

+ (id)audioRouteChangeReasonKey
{
  return CFSTR("routeChangeReason");
}

+ (id)predicateForAudioOutputStatus:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = a3;
  +[_CDContextQueries keyPathForAudioOutputDataDictionary](_CDContextQueries, "keyPathForAudioOutputDataDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0CB3880];
  +[_CDContextQueries audioOutputStatusKey](_CDContextQueries, "audioOutputStatusKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "predicateWithFormat:", CFSTR("self.%@.value.%@ == %@"), v4, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  +[_CDContextualPredicate predicateForKeyPath:withPredicate:](_CDContextualPredicate, "predicateForKeyPath:withPredicate:", v4, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)keyPathForWorkoutDataDictionary
{
  if (keyPathForWorkoutDataDictionary_onceToken != -1)
    dispatch_once(&keyPathForWorkoutDataDictionary_onceToken, &__block_literal_global_23);
  return (id)keyPathForWorkoutDataDictionary_workoutData;
}

+ (id)isFirstPartyWorkout
{
  return CFSTR("isFirstPartyWorkout");
}

+ (id)bundleId
{
  return CFSTR("bundleId");
}

+ (id)workoutActivityType
{
  return CFSTR("workoutActivityType");
}

+ (id)sessionIdentifier
{
  return CFSTR("sessionIdentifier");
}

+ (id)sessionState
{
  return CFSTR("sessionState");
}

+ (id)keyPathForHomeKitAppViewDataDictionary
{
  if (keyPathForHomeKitAppViewDataDictionary_onceToken != -1)
    dispatch_once(&keyPathForHomeKitAppViewDataDictionary_onceToken, &__block_literal_global_24);
  return (id)keyPathForHomeKitAppViewDataDictionary_homeKitData;
}

+ (id)viewHomeUUID
{
  return CFSTR("viewHomeUUID");
}

+ (id)viewUUID
{
  return CFSTR("viewUUID");
}

+ (id)viewName
{
  return CFSTR("viewName");
}

+ (id)viewInformation
{
  return CFSTR("viewInformation");
}

+ (id)keyPathForSunriseSunsetDataDictionary
{
  if (keyPathForSunriseSunsetDataDictionary_onceToken != -1)
    dispatch_once(&keyPathForSunriseSunsetDataDictionary_onceToken, &__block_literal_global_26);
  return (id)keyPathForSunriseSunsetDataDictionary_sunriseSunsetData;
}

+ (id)sunriseSunsetAvailabilityStatusKey
{
  return CFSTR("status");
}

+ (id)currentSunriseKey
{
  return CFSTR("sunrise");
}

+ (id)currentSunsetKey
{
  return CFSTR("sunset");
}

+ (id)nextSunriseKey
{
  return CFSTR("nextSunrise");
}

+ (id)nextSunsetKey
{
  return CFSTR("nextSunset");
}

+ (id)previousSunriseKey
{
  return CFSTR("previousSunrise");
}

+ (id)previousSunsetKey
{
  return CFSTR("previousSunset");
}

+ (id)isDaylightKey
{
  return CFSTR("isDaylight");
}

+ (id)keyPathForBluetoothDataDictionary
{
  if (keyPathForBluetoothDataDictionary_onceToken != -1)
    dispatch_once(&keyPathForBluetoothDataDictionary_onceToken, &__block_literal_global_27);
  return (id)keyPathForBluetoothDataDictionary_bluetoothData;
}

+ (id)bluetoothConnectionStatusKey
{
  return CFSTR("status");
}

+ (id)bluetoothNameKey
{
  return CFSTR("name");
}

+ (id)bluetoothAddressKey
{
  return CFSTR("address");
}

+ (id)bluetoothDeviceTypeKey
{
  return CFSTR("deviceType");
}

+ (id)bluetoothIsAppleAudioDeviceKey
{
  return CFSTR("isAppleAudioDeviceKey");
}

+ (id)bluetoothIsUserWearingKey
{
  return CFSTR("isUserWearing");
}

+ (id)bluetoothProductIDKey
{
  return CFSTR("productID");
}

+ (id)predicateForBluetoothConnectionStatus:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = a3;
  +[_CDContextQueries keyPathForBluetoothDataDictionary](_CDContextQueries, "keyPathForBluetoothDataDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0CB3880];
  +[_CDContextQueries bluetoothConnectionStatusKey](_CDContextQueries, "bluetoothConnectionStatusKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "predicateWithFormat:", CFSTR("self.%@.value.%@ == %@"), v4, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  +[_CDContextualPredicate predicateForKeyPath:withPredicate:](_CDContextualPredicate, "predicateForKeyPath:withPredicate:", v4, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)predicateForBluetoothConnectedAndUserIsWearing:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = a3;
  +[_CDContextQueries keyPathForBluetoothDataDictionary](_CDContextQueries, "keyPathForBluetoothDataDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0CB3880];
  +[_CDContextQueries bluetoothConnectionStatusKey](_CDContextQueries, "bluetoothConnectionStatusKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[_CDContextQueries bluetoothIsUserWearingKey](_CDContextQueries, "bluetoothIsUserWearingKey");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "predicateWithFormat:", CFSTR("self.%@.value.%@ == %@ AND self.%@.value.%@ == %@"), v4, v6, MEMORY[0x1E0C9AAB0], v4, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  +[_CDContextualPredicate predicateForKeyPath:withPredicate:](_CDContextualPredicate, "predicateForKeyPath:withPredicate:", v4, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)userActivityUUID
{
  return CFSTR("userActivityUUID");
}

+ (id)eligibility
{
  return CFSTR("eligibility");
}

+ (id)title
{
  return CFSTR("title");
}

+ (id)userActivityType
{
  return CFSTR("userActivityType");
}

+ (id)itemIdentifier
{
  return CFSTR("itemIdentifier");
}

+ (id)userActivityRequiredString
{
  return CFSTR("userActivityRequiredString");
}

+ (id)keyPathForNFCTagIdentifiers
{
  if (keyPathForNFCTagIdentifiers_onceToken != -1)
    dispatch_once(&keyPathForNFCTagIdentifiers_onceToken, &__block_literal_global_30);
  return (id)keyPathForNFCTagIdentifiers_NFCTagIdentifiersKeyPath;
}

+ (id)keyPathForMDCSProxies
{
  if (keyPathForMDCSProxies_onceToken != -1)
    dispatch_once(&keyPathForMDCSProxies_onceToken, &__block_literal_global_31);
  return (id)keyPathForMDCSProxies_proxiesKeyPath;
}

+ (id)keyPathForMDCSProxyTokenWithUserID:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("/private/sync/proxy/%@/token"), a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[_CDContextualKeyPath ephemeralKeyPathWithKey:](_CDContextualKeyPath, "ephemeralKeyPathWithKey:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)keyPathForMDCSProxySourceDeviceUUIDWithUserID:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("/private/sync/proxy/%@/uuid"), a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[_CDContextualKeyPath keyPathWithKey:](_CDContextualKeyPath, "keyPathWithKey:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)keyPathForMDCSUserIDWithProxySourceDeviceUUID:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(a3, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("/private/sync/proxy/%@/uid"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  +[_CDContextualKeyPath keyPathWithKey:](_CDContextualKeyPath, "keyPathWithKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)keyPathForMDCSDevicesWithProxySourceDeviceUUID:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(a3, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("/private/sync/proxy/%@/no-longer-supported/devices"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  +[_CDContextualKeyPath keyPathWithKey:](_CDContextualKeyPath, "keyPathWithKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)keyPathForMDCSDeviceIDsWithProxySourceDeviceUUID:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(a3, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("/private/sync/proxy/%@/devices"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  +[_CDContextualKeyPath ephemeralKeyPathWithKey:](_CDContextualKeyPath, "ephemeralKeyPathWithKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)predicateForMDCSDevicesWithDeviceTypes:(unint64_t)a3
{
  unsigned int v3;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v3 = a3;
  v5 = objc_alloc(MEMORY[0x1E0CB3A28]);
  +[_CDDevice localDevice](_CDDevice, "localDevice");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "deviceID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v5, "initWithUUIDString:", v7);

  objc_msgSend(a1, "keyPathForMDCSDevicesWithProxySourceDeviceUUID:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if ((v3 & 1) != 0)
  {
    objc_msgSend(v10, "addObject:", &unk_1E26DFDD0);
    if ((v3 & 2) == 0)
    {
LABEL_3:
      if ((v3 & 0x40) == 0)
        goto LABEL_4;
      goto LABEL_12;
    }
  }
  else if ((v3 & 2) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(v11, "addObject:", &unk_1E26DFDE8);
  if ((v3 & 0x40) == 0)
  {
LABEL_4:
    if ((v3 & 8) == 0)
      goto LABEL_5;
    goto LABEL_13;
  }
LABEL_12:
  objc_msgSend(v11, "addObject:", &unk_1E26DFE00);
  if ((v3 & 8) == 0)
  {
LABEL_5:
    if ((v3 & 0x10) == 0)
      goto LABEL_6;
    goto LABEL_14;
  }
LABEL_13:
  objc_msgSend(v11, "addObject:", &unk_1E26DFE18);
  if ((v3 & 0x10) == 0)
  {
LABEL_6:
    if ((v3 & 0x20) == 0)
      goto LABEL_7;
LABEL_15:
    objc_msgSend(v11, "addObject:", &unk_1E26DFE48);
    if ((v3 & 0x80) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
LABEL_14:
  objc_msgSend(v11, "addObject:", &unk_1E26DFE30);
  if ((v3 & 0x20) != 0)
    goto LABEL_15;
LABEL_7:
  if ((v3 & 0x80) != 0)
LABEL_8:
    objc_msgSend(v11, "addObject:", &unk_1E26DFE60);
LABEL_9:
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("SUBQUERY(SELF.value, $device, $device.deviceClass IN %@ AND $device.companion == %@).@count > 0"), v11, HIBYTE(v3) & 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[_CDContextualPredicate predicateForKeyPath:withPredicate:](_CDContextualPredicate, "predicateForKeyPath:withPredicate:", v9, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)keyPathForCurrentAlarms
{
  if (keyPathForCurrentAlarms_onceToken != -1)
    dispatch_once(&keyPathForCurrentAlarms_onceToken, &__block_literal_global_32);
  return (id)keyPathForCurrentAlarms_keyPathForCurrentAlarms;
}

+ (id)keyPathForNextAlarm
{
  if (keyPathForNextAlarm_onceToken != -1)
    dispatch_once(&keyPathForNextAlarm_onceToken, &__block_literal_global_2_1);
  return (id)keyPathForNextAlarm_keyPathForNextAlarm;
}

+ (id)keyPathForCurrentTimers
{
  if (keyPathForCurrentTimers_onceToken != -1)
    dispatch_once(&keyPathForCurrentTimers_onceToken, &__block_literal_global_5);
  return (id)keyPathForCurrentTimers_keyPathForCurrentTimers;
}

+ (id)timerIDKey
{
  return CFSTR("timerID");
}

+ (id)alarmIDKey
{
  return CFSTR("alarmID");
}

+ (id)expectedFireDateKey
{
  return CFSTR("expectedFireDate");
}

+ (id)isSleepAlarm
{
  return CFSTR("isSleepAlarm");
}

+ (id)transition
{
  return CFSTR("transition");
}

+ (id)stateKey
{
  return CFSTR("state");
}

+ (id)modifiedDateKey
{
  return CFSTR("modifiedDate");
}

+ (id)keyPathForSiriServiceDataDictionary
{
  if (keyPathForSiriServiceDataDictionary_onceToken != -1)
    dispatch_once(&keyPathForSiriServiceDataDictionary_onceToken, &__block_literal_global_35);
  return (id)keyPathForSiriServiceDataDictionary_keyPathForSiriServiceDataDictionary;
}

+ (id)domainKey
{
  return CFSTR("domain");
}

+ (id)commandKey
{
  return CFSTR("command");
}

+ (id)keyPathForMostRecentSafariSpotlightDonation
{
  if (keyPathForMostRecentSafariSpotlightDonation_onceToken != -1)
    dispatch_once(&keyPathForMostRecentSafariSpotlightDonation_onceToken, &__block_literal_global_36);
  return (id)keyPathForMostRecentSafariSpotlightDonation_keyPathForMostRecentSafariSpotlightDonation;
}

+ (id)mostRecentSafariSearchableItem
{
  return CFSTR("mostRecentSafariSearchableItem");
}

+ (id)safariURLInMostRecentSearchableItem
{
  return CFSTR("safariURLInMostRecentSearchableItem");
}

+ (id)keyPathForSleepStateDictionary
{
  if (keyPathForSleepStateDictionary_onceToken != -1)
    dispatch_once(&keyPathForSleepStateDictionary_onceToken, &__block_literal_global_38);
  return (id)keyPathForSleepStateDictionary_keyPathForSleepState;
}

+ (id)sleepScheduleState
{
  return CFSTR("sleepScheduleState");
}

+ (id)sleepModeOn
{
  return CFSTR("sleepModeOn");
}

+ (id)sleepModeState
{
  return CFSTR("sleepModeState");
}

+ (id)sleepScheduleModelDateModified
{
  return CFSTR("sleepScheduleModelDateModified");
}

+ (id)sleepEvent
{
  return CFSTR("sleepEvent");
}

+ (id)keyPathForDoNotDisturbStatusDataDictionary
{
  if (keyPathForDoNotDisturbStatusDataDictionary_onceToken != -1)
    dispatch_once(&keyPathForDoNotDisturbStatusDataDictionary_onceToken, &__block_literal_global_39);
  return (id)keyPathForDoNotDisturbStatusDataDictionary_doNotDisturbData;
}

+ (id)doNotDisturbUpdateReason
{
  return CFSTR("doNotDisturbUpdateReason");
}

+ (id)doNotDisturbState
{
  return CFSTR("doNotDisturbState");
}

+ (id)doNotDisturbStateMetadataArray
{
  return CFSTR("doNotDisturbStateMetadataArray");
}

+ (id)modeIdentifier
{
  return CFSTR("modeIdentifier");
}

+ (id)activeDateInterval
{
  return CFSTR("activeDateInterval");
}

@end
