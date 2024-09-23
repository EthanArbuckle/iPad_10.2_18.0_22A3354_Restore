@implementation CDContextQueries

void __41___CDContextQueries_keyPathForDeviceName__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[_CDContextualKeyPath keyPathWithKey:](_CDContextualKeyPath, "keyPathWithKey:", CFSTR("/system/deviceName"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)keyPathForDeviceName_deviceName;
  keyPathForDeviceName_deviceName = v0;

}

void __71___CDContextQueries_HomeKitScene__keyPathForHomeKitSceneDataDictionary__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[_CDContextualKeyPath keyPathWithKey:](_CDContextualKeyPath, "keyPathWithKey:", CFSTR("/homeKitScene/dataDictionary"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)keyPathForHomeKitSceneDataDictionary_homeKitData;
  keyPathForHomeKitSceneDataDictionary_homeKitData = v0;

}

uint64_t __57___CDContextQueries_Interactions__keyPathForRecentEmails__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[_CDContextualKeyPath ephemeralKeyPathWithKey:](_CDContextualKeyPath, "ephemeralKeyPathWithKey:", CFSTR("/interactions/emails"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)keyPathForRecentEmails_incomingEmailsKeyPath;
  keyPathForRecentEmails_incomingEmailsKeyPath = v0;

  return objc_msgSend((id)keyPathForRecentEmails_incomingEmailsKeyPath, "setSensitiveContents:", 1);
}

uint64_t __59___CDContextQueries_Interactions__keyPathForRecentMessages__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[_CDContextualKeyPath ephemeralKeyPathWithKey:](_CDContextualKeyPath, "ephemeralKeyPathWithKey:", CFSTR("/interactions/messages"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)keyPathForRecentMessages_messagesKeyPath;
  keyPathForRecentMessages_messagesKeyPath = v0;

  return objc_msgSend((id)keyPathForRecentMessages_messagesKeyPath, "setSensitiveContents:", 1);
}

void __71___CDContextQueries_LocationCoordinates__keyPathForLocationCoordinates__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[_CDContextualKeyPath keyPathWithKey:](_CDContextualKeyPath, "keyPathWithKey:", CFSTR("/location/coordinates"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)keyPathForLocationCoordinates_locationCoordniateKeyPath;
  keyPathForLocationCoordinates_locationCoordniateKeyPath = v0;

}

void __65___CDContextQueries_AppUsage__keyPathForAppUsageDataDictionaries__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[_CDContextualKeyPath ephemeralKeyPathWithKey:](_CDContextualKeyPath, "ephemeralKeyPathWithKey:", CFSTR("/app/usage"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)keyPathForAppUsageDataDictionaries_appUsageKeyPath;
  keyPathForAppUsageDataDictionaries_appUsageKeyPath = v0;

}

void __67___CDContextQueries_AppUsage__keyPathForAppRunningDataDictionaries__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[_CDContextualKeyPath ephemeralKeyPathWithKey:](_CDContextualKeyPath, "ephemeralKeyPathWithKey:", CFSTR("/app/running"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)keyPathForAppRunningDataDictionaries_appActiveKeyPath;
  keyPathForAppRunningDataDictionaries_appActiveKeyPath = v0;

}

uint64_t __71___CDContextQueries_AppWebUsage__keyPathForAppWebUsageDataDictionaries__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[_CDContextualKeyPath ephemeralKeyPathWithKey:](_CDContextualKeyPath, "ephemeralKeyPathWithKey:", CFSTR("/app/webUsage"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)keyPathForAppWebUsageDataDictionaries_appWebUsageKeyPath;
  keyPathForAppWebUsageDataDictionaries_appWebUsageKeyPath = v0;

  return objc_msgSend((id)keyPathForAppWebUsageDataDictionaries_appWebUsageKeyPath, "setSensitiveContents:", 1);
}

void __75___CDContextQueries_AppMediaUsage__keyPathForAppMediaUsageDataDictionaries__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[_CDContextualKeyPath ephemeralKeyPathWithKey:](_CDContextualKeyPath, "ephemeralKeyPathWithKey:", CFSTR("/app/mediaUsage"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)keyPathForAppMediaUsageDataDictionaries_usageKeyPath;
  keyPathForAppMediaUsageDataDictionaries_usageKeyPath = v0;

}

void __71___CDContextQueries_BatteryState__keyPathForBatteryStateDataDictionary__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[_CDContextualKeyPath keyPathWithKey:](_CDContextualKeyPath, "keyPathWithKey:", CFSTR("/system/battery/dataDictionary"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)keyPathForBatteryStateDataDictionary_batteryData;
  keyPathForBatteryStateDataDictionary_batteryData = v0;

}

void __42___CDContextQueries_keyPathForInUseStatus__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[_CDContextualKeyPath keyPathWithKey:](_CDContextualKeyPath, "keyPathWithKey:", CFSTR("/system/inUse"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)keyPathForInUseStatus_inUseStatus;
  keyPathForInUseStatus_inUseStatus = v0;

}

void __42___CDContextQueries_keyPathForLastUseDate__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[_CDContextualKeyPath keyPathWithKey:](_CDContextualKeyPath, "keyPathWithKey:", CFSTR("/system/inUse/date"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)keyPathForLastUseDate_lastUseDate;
  keyPathForLastUseDate_lastUseDate = v0;

}

void __44___CDContextQueries_keyPathForForegroundApp__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[_CDContextualKeyPath keyPathWithKey:](_CDContextualKeyPath, "keyPathWithKey:", CFSTR("/app/inFocus"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)keyPathForForegroundApp_foregroundApp;
  keyPathForForegroundApp_foregroundApp = v0;

}

void __51___CDContextQueries_keyPathForCallInProgressStatus__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[_CDContextualKeyPath keyPathWithKey:](_CDContextualKeyPath, "keyPathWithKey:", CFSTR("/call/inProgress"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)keyPathForCallInProgressStatus_callInProgressStatus;
  keyPathForCallInProgressStatus_callInProgressStatus = v0;

}

void __48___CDContextQueries_keyPathForBacklightOnStatus__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[_CDContextualKeyPath keyPathWithKey:](_CDContextualKeyPath, "keyPathWithKey:", CFSTR("/system/isBacklit"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)keyPathForBacklightOnStatus_backlightOnStatus;
  keyPathForBacklightOnStatus_backlightOnStatus = v0;

}

void __71___CDContextQueries_keyPathForDisplayOnBeforeFirstUnlockOfTheDayStatus__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[_CDContextualKeyPath keyPathWithKey:](_CDContextualKeyPath, "keyPathWithKey:", CFSTR("/system/displayOnBeforeFirstUnlockOfTheDay"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)keyPathForDisplayOnBeforeFirstUnlockOfTheDayStatus_displayOnBeforeFirstUnlockOfTheDayStatus;
  keyPathForDisplayOnBeforeFirstUnlockOfTheDayStatus_displayOnBeforeFirstUnlockOfTheDayStatus = v0;

}

void __57___CDContextQueries_keyPathForDeviceAssertionsHeldStatus__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[_CDContextualKeyPath keyPathWithKey:](_CDContextualKeyPath, "keyPathWithKey:", CFSTR("/system/deviceAssertionsHeld"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)keyPathForDeviceAssertionsHeldStatus_deviceAssertionsHeld;
  keyPathForDeviceAssertionsHeldStatus_deviceAssertionsHeld = v0;

}

void __54___CDContextQueries_keyPathForNextUserVisibleWakeDate__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[_CDContextualKeyPath keyPathWithKey:](_CDContextualKeyPath, "keyPathWithKey:", CFSTR("/system/nextUserVisibleWake"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)keyPathForNextUserVisibleWakeDate_nextUserVisibleWakeDate;
  keyPathForNextUserVisibleWakeDate_nextUserVisibleWakeDate = v0;

}

void __48___CDContextQueries_keyPathForFirstWakeupStatus__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[_CDContextualKeyPath keyPathWithKey:](_CDContextualKeyPath, "keyPathWithKey:", CFSTR("/system/firstBacklightAfterWakeup"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)keyPathForFirstWakeupStatus_firstWakeup;
  keyPathForFirstWakeupStatus_firstWakeup = v0;

}

void __47___CDContextQueries_keyPathForDeviceLockStatus__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[_CDContextualKeyPath keyPathWithKey:](_CDContextualKeyPath, "keyPathWithKey:", CFSTR("/system/isLocked"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)keyPathForDeviceLockStatus_deviceLockStatus;
  keyPathForDeviceLockStatus_deviceLockStatus = v0;

}

void __47___CDContextQueries_keyPathForKeybagLockStatus__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[_CDContextualKeyPath keyPathWithKey:](_CDContextualKeyPath, "keyPathWithKey:", CFSTR("/keybag/isLocked"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)keyPathForKeybagLockStatus_keybagLockStatus;
  keyPathForKeybagLockStatus_keybagLockStatus = v0;

}

void __49___CDContextQueries_keyPathForMediaPlayingStatus__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[_CDContextualKeyPath keyPathWithKey:](_CDContextualKeyPath, "keyPathWithKey:", CFSTR("/media/nowPlaying"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)keyPathForMediaPlayingStatus_mediaPlayingStatus;
  keyPathForMediaPlayingStatus_mediaPlayingStatus = v0;

}

void __47___CDContextQueries_keyPathForNavigationStatus__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[_CDContextualKeyPath keyPathWithKey:](_CDContextualKeyPath, "keyPathWithKey:", CFSTR("/maps/navigationInProgress"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)keyPathForNavigationStatus_navigationStatus;
  keyPathForNavigationStatus_navigationStatus = v0;

}

void __49___CDContextQueries_keyPathForCarConnectedStatus__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[_CDContextualKeyPath keyPathWithKey:](_CDContextualKeyPath, "keyPathWithKey:", CFSTR("/car/isConnected"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)keyPathForCarConnectedStatus_carConnectedStatus;
  keyPathForCarConnectedStatus_carConnectedStatus = v0;

}

void __47___CDContextQueries_keyPathForSiriActiveStatus__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[_CDContextualKeyPath keyPathWithKey:](_CDContextualKeyPath, "keyPathWithKey:", CFSTR("/siri/isActive"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)keyPathForSiriActiveStatus_siriActiveStatus;
  keyPathForSiriActiveStatus_siriActiveStatus = v0;

}

void __39___CDContextQueries_keyPathForDeviceID__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[_CDContextualKeyPath keyPathWithKey:](_CDContextualKeyPath, "keyPathWithKey:", CFSTR("/system/deviceID"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)keyPathForDeviceID_deviceID;
  keyPathForDeviceID_deviceID = v0;

}

void __49___CDContextQueries_keyPathForLowPowerModeStatus__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[_CDContextualKeyPath keyPathWithKey:](_CDContextualKeyPath, "keyPathWithKey:", CFSTR("/system/batterySaver"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)keyPathForLowPowerModeStatus_lowPowerModeStatus;
  keyPathForLowPowerModeStatus_lowPowerModeStatus = v0;

}

void __49___CDContextQueries_keyPathForDoNotDisturbStatus__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[_CDContextualKeyPath keyPathWithKey:](_CDContextualKeyPath, "keyPathWithKey:", CFSTR("/system/doNotDisturb"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)keyPathForDoNotDisturbStatus_doNotDisturbStatus;
  keyPathForDoNotDisturbStatus_doNotDisturbStatus = v0;

}

void __49___CDContextQueries_keyPathForAirplaneModeStatus__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[_CDContextualKeyPath keyPathWithKey:](_CDContextualKeyPath, "keyPathWithKey:", CFSTR("/system/airplaneMode"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)keyPathForAirplaneModeStatus_airplaneModeStatus;
  keyPathForAirplaneModeStatus_airplaneModeStatus = v0;

}

void __49___CDContextQueries_keyPathForWiFiConnectionSSID__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[_CDContextualKeyPath keyPathWithKey:](_CDContextualKeyPath, "keyPathWithKey:", CFSTR("/system/wifi/ssid"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)keyPathForWiFiConnectionSSID_wifiConnectionSSIDKeyPath;
  keyPathForWiFiConnectionSSID_wifiConnectionSSIDKeyPath = v0;

}

void __53___CDContextQueries_keyPathForWiredConnectionQuality__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[_CDContextualKeyPath keyPathWithKey:](_CDContextualKeyPath, "keyPathWithKey:", CFSTR("/system/wired/quality"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)keyPathForWiredConnectionQuality_wiredConnectionQuality;
  keyPathForWiredConnectionQuality_wiredConnectionQuality = v0;

}

void __52___CDContextQueries_keyPathForWiFiConnectionQuality__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[_CDContextualKeyPath keyPathWithKey:](_CDContextualKeyPath, "keyPathWithKey:", CFSTR("/system/wifi/quality"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)keyPathForWiFiConnectionQuality_wifiConnectionQuality;
  keyPathForWiFiConnectionQuality_wifiConnectionQuality = v0;

}

void __52___CDContextQueries_keyPathForCellConnectionQuality__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[_CDContextualKeyPath keyPathWithKey:](_CDContextualKeyPath, "keyPathWithKey:", CFSTR("/system/cell/quality"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)keyPathForCellConnectionQuality_cellConnectionQuality;
  keyPathForCellConnectionQuality_cellConnectionQuality = v0;

}

void __53___CDContextQueries_keyPathForCarplayConnectedStatus__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[_CDContextualKeyPath keyPathWithKey:](_CDContextualKeyPath, "keyPathWithKey:", CFSTR("/carplay/isConnected"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)keyPathForCarplayConnectedStatus_carplayConnectedStatus;
  keyPathForCarplayConnectedStatus_carplayConnectedStatus = v0;

}

void __44___CDContextQueries_keyPathForWorkoutStatus__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[_CDContextualKeyPath keyPathWithKey:](_CDContextualKeyPath, "keyPathWithKey:", CFSTR("/workout/inProgress"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)keyPathForWorkoutStatus_workoutStatus;
  keyPathForWorkoutStatus_workoutStatus = v0;

}

void __42___CDContextQueries_keyPathForMotionState__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[_CDContextualKeyPath keyPathWithKey:](_CDContextualKeyPath, "keyPathWithKey:", CFSTR("/system/motionState"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)keyPathForMotionState_motionState;
  keyPathForMotionState_motionState = v0;

}

void __41___CDContextQueries_keyPathForSystemTime__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[_CDContextualKeyPath keyPathWithKey:](_CDContextualKeyPath, "keyPathWithKey:", CFSTR("/system/time"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)keyPathForSystemTime_systemTime;
  keyPathForSystemTime_systemTime = v0;

}

void __41___CDContextQueries_keyPathForLowBattery__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[_CDContextualKeyPath keyPathWithKey:](_CDContextualKeyPath, "keyPathWithKey:", CFSTR("/system/lowBattery"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)keyPathForLowBattery_lowBattery;
  keyPathForLowBattery_lowBattery = v0;

}

void __43___CDContextQueries_keyPathForBatteryLevel__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[_CDContextualKeyPath keyPathWithKey:](_CDContextualKeyPath, "keyPathWithKey:", CFSTR("/system/batteryPercentage"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)keyPathForBatteryLevel_batteryLevel;
  keyPathForBatteryLevel_batteryLevel = v0;

}

void __43___CDContextQueries_keyPathForPluginStatus__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[_CDContextualKeyPath keyPathWithKey:](_CDContextualKeyPath, "keyPathWithKey:", CFSTR("/system/isPluggedIn"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)keyPathForPluginStatus_pluginStatus;
  keyPathForPluginStatus_pluginStatus = v0;

}

void __51___CDContextQueries_keyPathForThermalPressureLevel__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[_CDContextualKeyPath keyPathWithKey:](_CDContextualKeyPath, "keyPathWithKey:", CFSTR("/system/thermalpressure"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)keyPathForThermalPressureLevel_thermalPressureLevel;
  keyPathForThermalPressureLevel_thermalPressureLevel = v0;

}

void __44___CDContextQueries_keyPathForCPUUsageLevel__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[_CDContextualKeyPath keyPathWithKey:](_CDContextualKeyPath, "keyPathWithKey:", CFSTR("/system/cpuusage"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)keyPathForCPUUsageLevel_cpuUsageLevel;
  keyPathForCPUUsageLevel_cpuUsageLevel = v0;

}

void __51___CDContextQueries_keyPathForNearbyLOIIdentifiers__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[_CDContextualKeyPath keyPathWithKey:](_CDContextualKeyPath, "keyPathWithKey:", CFSTR("/inferred/locationVisit"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)keyPathForNearbyLOIIdentifiers_nearbyLoiIdentifiers;
  keyPathForNearbyLOIIdentifiers_nearbyLoiIdentifiers = v0;

}

void __58___CDContextQueries_keyPathForEnergyBudgetRemainingStatus__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[_CDContextualKeyPath keyPathWithKey:](_CDContextualKeyPath, "keyPathWithKey:", CFSTR("/system/budgets/energy"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)keyPathForEnergyBudgetRemainingStatus_energyBudgetRemainingStatus;
  keyPathForEnergyBudgetRemainingStatus_energyBudgetRemainingStatus = v0;

}

void __62___CDContextQueries_keyPathForNetworkingBudgetRemainingStatus__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[_CDContextualKeyPath keyPathWithKey:](_CDContextualKeyPath, "keyPathWithKey:", CFSTR("/system/budgets/networking"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)keyPathForNetworkingBudgetRemainingStatus_networkingBudgetRemainingStatus;
  keyPathForNetworkingBudgetRemainingStatus_networkingBudgetRemainingStatus = v0;

}

void __62___CDContextQueries_keyPathForDefaultPairedDeviceNearbyStatus__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[_CDContextualKeyPath keyPathWithKey:](_CDContextualKeyPath, "keyPathWithKey:", CFSTR("/defaultPaired/nearby"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)keyPathForDefaultPairedDeviceNearbyStatus_defaultPairedNearbyStatus;
  keyPathForDefaultPairedDeviceNearbyStatus_defaultPairedNearbyStatus = v0;

}

void __48___CDContextQueries_keyPathForWatchActiveStatus__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[_CDContextualKeyPath keyPathWithKey:](_CDContextualKeyPath, "keyPathWithKey:", CFSTR("/watch/active"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)keyPathForWatchActiveStatus_defaultPairedActiveStatus;
  keyPathForWatchActiveStatus_defaultPairedActiveStatus = v0;

}

void __62___CDContextQueries_keyPathForDefaultPairedDeviceBatteryLevel__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[_CDContextualKeyPath ephemeralKeyPathWithKey:](_CDContextualKeyPath, "ephemeralKeyPathWithKey:", CFSTR("/defaultPaired/batteryPercentage"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)keyPathForDefaultPairedDeviceBatteryLevel_defaultPairedBatteryLevel;
  keyPathForDefaultPairedDeviceBatteryLevel_defaultPairedBatteryLevel = v0;

}

void __62___CDContextQueries_keyPathForDefaultPairedDevicePluginStatus__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[_CDContextualKeyPath ephemeralKeyPathWithKey:](_CDContextualKeyPath, "ephemeralKeyPathWithKey:", CFSTR("/defaultPaired/isPluggedIn"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)keyPathForDefaultPairedDevicePluginStatus_defaultPairedPluginStatus;
  keyPathForDefaultPairedDevicePluginStatus_defaultPairedPluginStatus = v0;

}

void __70___CDContextQueries_keyPathForDefaultPairedDeviceThermalPressureLevel__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[_CDContextualKeyPath ephemeralKeyPathWithKey:](_CDContextualKeyPath, "ephemeralKeyPathWithKey:", CFSTR("/defaultPaired/thermalpressure"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)keyPathForDefaultPairedDeviceThermalPressureLevel_defaultPairedThermalPressureLevel;
  keyPathForDefaultPairedDeviceThermalPressureLevel_defaultPairedThermalPressureLevel = v0;

}

void __63___CDContextQueries_keyPathForDefaultPairedDeviceForegroundApp__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[_CDContextualKeyPath ephemeralKeyPathWithKey:](_CDContextualKeyPath, "ephemeralKeyPathWithKey:", CFSTR("/defaultPaired/foregroundApp"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)keyPathForDefaultPairedDeviceForegroundApp_defaultPairedForegroundApp;
  keyPathForDefaultPairedDeviceForegroundApp_defaultPairedForegroundApp = v0;

}

void __50___CDContextQueries_keyPathForActiveComplications__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[_CDContextualKeyPath ephemeralKeyPathWithKey:](_CDContextualKeyPath, "ephemeralKeyPathWithKey:", CFSTR("/watch/activeComplications"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)keyPathForActiveComplications_activeComplications;
  keyPathForActiveComplications_activeComplications = v0;

}

void __66___CDContextQueries_keyPathForDefaultPairedDeviceWiFiWiredQuality__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[_CDContextualKeyPath ephemeralKeyPathWithKey:](_CDContextualKeyPath, "ephemeralKeyPathWithKey:", CFSTR("/defaultPaired/wifiQuality"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)keyPathForDefaultPairedDeviceWiFiWiredQuality_defaultPairedWiFiWiredQuality;
  keyPathForDefaultPairedDeviceWiFiWiredQuality_defaultPairedWiFiWiredQuality = v0;

}

void __61___CDContextQueries_keyPathForDefaultPairedDeviceCellQuality__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[_CDContextualKeyPath ephemeralKeyPathWithKey:](_CDContextualKeyPath, "ephemeralKeyPathWithKey:", CFSTR("/defaultPaired/cellQuality"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)keyPathForDefaultPairedDeviceCellQuality_defaultPairedCellQuality;
  keyPathForDefaultPairedDeviceCellQuality_defaultPairedCellQuality = v0;

}

void __61___CDContextQueries_Intents__keyPathForIntentsDataDictionary__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[_CDContextualKeyPath ephemeralKeyPathWithKey:](_CDContextualKeyPath, "ephemeralKeyPathWithKey:", CFSTR("/intents/dataDictionary"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)keyPathForIntentsDataDictionary_intentsData;
  keyPathForIntentsDataDictionary_intentsData = v0;

}

void __64___CDContextQueries_Location__keyPathForCircularLocationRegions__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[_CDContextualKeyPath keyPathWithKey:](_CDContextualKeyPath, "keyPathWithKey:", CFSTR("/location/circularRegions"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)keyPathForCircularLocationRegions_circularLocationRegionsKeyPath;
  keyPathForCircularLocationRegions_circularLocationRegionsKeyPath = v0;

}

void __79___CDContextQueries_HomeKitAccessory__keyPathForHomeKitAccessoryDataDictionary__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[_CDContextualKeyPath keyPathWithKey:](_CDContextualKeyPath, "keyPathWithKey:", CFSTR("/homeKitAccessory/dataDictionary"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)keyPathForHomeKitAccessoryDataDictionary_homeKitData;
  keyPathForHomeKitAccessoryDataDictionary_homeKitData = v0;

}

void __61___CDContextQueries_Application__keyPathForAppDataDictionary__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[_CDContextualKeyPath ephemeralKeyPathWithKey:](_CDContextualKeyPath, "ephemeralKeyPathWithKey:", CFSTR("/app/dataDictionary"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)keyPathForAppDataDictionary_appData;
  keyPathForAppDataDictionary_appData = v0;

}

void __57___CDContextQueries_Application__keyPathForAppClipLaunch__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[_CDContextualKeyPath ephemeralKeyPathWithKey:](_CDContextualKeyPath, "ephemeralKeyPathWithKey:", CFSTR("/appClip/launch"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)keyPathForAppClipLaunch_appClipLaunchKeyPath;
  keyPathForAppClipLaunch_appClipLaunchKeyPath = v0;

}

void __78___CDContextQueries_Routine__keyPathForPredictedLocationOfInterestTransitions__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[_CDContextualKeyPath keyPathWithKey:](_CDContextualKeyPath, "keyPathWithKey:", CFSTR("/routine/predictedLocationOfInterestTransitions"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)keyPathForPredictedLocationOfInterestTransitions_predictedLocationOfInterestTransitionsKeyPath;
  keyPathForPredictedLocationOfInterestTransitions_predictedLocationOfInterestTransitionsKeyPath = v0;

}

void __48___CDContextQueries_Calls__keyPathForActiveCall__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[_CDContextualKeyPath keyPathWithKey:](_CDContextualKeyPath, "keyPathWithKey:", CFSTR("/interactions/activeCall"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)keyPathForActiveCall_keyPathForActiveCall;
  keyPathForActiveCall_keyPathForActiveCall = v0;

}

void __67___CDContextQueries_NowPlaying__keyPathForNowPlayingDataDictionary__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[_CDContextualKeyPath ephemeralKeyPathWithKey:](_CDContextualKeyPath, "ephemeralKeyPathWithKey:", CFSTR("/nowPlaying/dataDictionary"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)keyPathForNowPlayingDataDictionary_nowPlayingData;
  keyPathForNowPlayingDataDictionary_nowPlayingData = v0;

}

void __63___CDContextQueries_Audio__keyPathForAudioOutputDataDictionary__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[_CDContextualKeyPath keyPathWithKey:](_CDContextualKeyPath, "keyPathWithKey:", CFSTR("/audioOutput/dataDictionary"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)keyPathForAudioOutputDataDictionary_audioData;
  keyPathForAudioOutputDataDictionary_audioData = v0;

}

void __76___CDContextQueries_IDSTrafficPolicy__keyPathForServicesAppearingForeground__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[_CDContextualKeyPath keyPathWithKey:](_CDContextualKeyPath, "keyPathWithKey:", CFSTR("/ids/app/foregroundServices"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)keyPathForServicesAppearingForeground_servicesAppearingForeground;
  keyPathForServicesAppearingForeground_servicesAppearingForeground = v0;

}

void __89___CDContextQueries_IDSTrafficPolicy__keyPathForDefaultPairedServicesAppearingForeground__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[_CDContextualKeyPath keyPathWithKey:](_CDContextualKeyPath, "keyPathWithKey:", CFSTR("/ids/remote/app/foregroundServices"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)keyPathForDefaultPairedServicesAppearingForeground_defaultPairedServicesAppearingForeground;
  keyPathForDefaultPairedServicesAppearingForeground_defaultPairedServicesAppearingForeground = v0;

}

void __61___CDContextQueries_Workout__keyPathForWorkoutDataDictionary__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[_CDContextualKeyPath keyPathWithKey:](_CDContextualKeyPath, "keyPathWithKey:", CFSTR("/workout/dataDictionary"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)keyPathForWorkoutDataDictionary_workoutData;
  keyPathForWorkoutDataDictionary_workoutData = v0;

}

void __75___CDContextQueries_HomeKitAppView__keyPathForHomeKitAppViewDataDictionary__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[_CDContextualKeyPath keyPathWithKey:](_CDContextualKeyPath, "keyPathWithKey:", CFSTR("/homeKitAppView/dataDictionary"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)keyPathForHomeKitAppViewDataDictionary_homeKitData;
  keyPathForHomeKitAppViewDataDictionary_homeKitData = v0;

}

void __73___CDContextQueries_SunriseSunset__keyPathForSunriseSunsetDataDictionary__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[_CDContextualKeyPath ephemeralKeyPathWithKey:](_CDContextualKeyPath, "ephemeralKeyPathWithKey:", CFSTR("/sunriseSunset/dataDictionary"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)keyPathForSunriseSunsetDataDictionary_sunriseSunsetData;
  keyPathForSunriseSunsetDataDictionary_sunriseSunsetData = v0;

}

void __65___CDContextQueries_Bluetooth__keyPathForBluetoothDataDictionary__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[_CDContextualKeyPath keyPathWithKey:](_CDContextualKeyPath, "keyPathWithKey:", CFSTR("/bluetooth/dataDictionary"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)keyPathForBluetoothDataDictionary_bluetoothData;
  keyPathForBluetoothDataDictionary_bluetoothData = v0;

}

void __71___CDContextQueries_UserActivity__keyPathForUserActivityDataDictionary__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[_CDContextualKeyPath ephemeralKeyPathWithKey:](_CDContextualKeyPath, "ephemeralKeyPathWithKey:", CFSTR("/app/activity/dataDictionary"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)keyPathForUserActivityDataDictionary_intentsData;
  keyPathForUserActivityDataDictionary_intentsData = v0;

}

void __53___CDContextQueries_NFC__keyPathForNFCTagIdentifiers__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[_CDContextualKeyPath ephemeralKeyPathWithKey:](_CDContextualKeyPath, "ephemeralKeyPathWithKey:", CFSTR("/system/nfcTags"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)keyPathForNFCTagIdentifiers_NFCTagIdentifiersKeyPath;
  keyPathForNFCTagIdentifiers_NFCTagIdentifiersKeyPath = v0;

}

void __48___CDContextQueries_MDCS__keyPathForMDCSProxies__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[_CDContextualKeyPath keyPathWithKey:](_CDContextualKeyPath, "keyPathWithKey:", CFSTR("/private/sync/proxies"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)keyPathForMDCSProxies_proxiesKeyPath;
  keyPathForMDCSProxies_proxiesKeyPath = v0;

}

void __51___CDContextQueries_Alarm__keyPathForCurrentAlarms__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[_CDContextualKeyPath ephemeralKeyPathWithKey:](_CDContextualKeyPath, "ephemeralKeyPathWithKey:", CFSTR("/system/currentAlarms"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)keyPathForCurrentAlarms_keyPathForCurrentAlarms;
  keyPathForCurrentAlarms_keyPathForCurrentAlarms = v0;

}

void __47___CDContextQueries_Alarm__keyPathForNextAlarm__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[_CDContextualKeyPath keyPathWithKey:](_CDContextualKeyPath, "keyPathWithKey:", CFSTR("/system/nextAlarm"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)keyPathForNextAlarm_keyPathForNextAlarm;
  keyPathForNextAlarm_keyPathForNextAlarm = v0;

}

void __51___CDContextQueries_Alarm__keyPathForCurrentTimers__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[_CDContextualKeyPath ephemeralKeyPathWithKey:](_CDContextualKeyPath, "ephemeralKeyPathWithKey:", CFSTR("/system/currentTimers"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)keyPathForCurrentTimers_keyPathForCurrentTimers;
  keyPathForCurrentTimers_keyPathForCurrentTimers = v0;

}

void __69___CDContextQueries_SiriService__keyPathForSiriServiceDataDictionary__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[_CDContextualKeyPath ephemeralKeyPathWithKey:](_CDContextualKeyPath, "ephemeralKeyPathWithKey:", CFSTR("/siri/service/dataDictionary"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)keyPathForSiriServiceDataDictionary_keyPathForSiriServiceDataDictionary;
  keyPathForSiriServiceDataDictionary_keyPathForSiriServiceDataDictionary = v0;

}

void __89___CDContextQueries_SafariSpotlightDonation__keyPathForMostRecentSafariSpotlightDonation__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[_CDContextualKeyPath ephemeralKeyPathWithKey:](_CDContextualKeyPath, "ephemeralKeyPathWithKey:", CFSTR("/safari/mostRecentCSSI"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)keyPathForMostRecentSafariSpotlightDonation_keyPathForMostRecentSafariSpotlightDonation;
  keyPathForMostRecentSafariSpotlightDonation_keyPathForMostRecentSafariSpotlightDonation = v0;

}

void __58___CDContextQueries_Sleep__keyPathForSleepStateDictionary__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[_CDContextualKeyPath keyPathWithKey:](_CDContextualKeyPath, "keyPathWithKey:", CFSTR("/system/currentSleepState"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)keyPathForSleepStateDictionary_keyPathForSleepState;
  keyPathForSleepStateDictionary_keyPathForSleepState = v0;

}

void __77___CDContextQueries_DoNotDisturb__keyPathForDoNotDisturbStatusDataDictionary__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[_CDContextualKeyPath keyPathWithKey:](_CDContextualKeyPath, "keyPathWithKey:", CFSTR("/system/doNotDisturb/dataDictionary"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)keyPathForDoNotDisturbStatusDataDictionary_doNotDisturbData;
  keyPathForDoNotDisturbStatusDataDictionary_doNotDisturbData = v0;

}

@end
