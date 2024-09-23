@implementation HDAudioAnalyticsSettingsPreferences

- (id)noisePreferences
{
  _BOOL8 v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  HDAudioAnalyticsNoiseSettingsResult *v7;

  v2 = -[HDAudioAnalyticsSettingsPreferences _hasPairedWatchWithNoiseApp](self, "_hasPairedWatchWithNoiseApp");
  objc_msgSend(MEMORY[0x24BE4BE80], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "notificationsEnabled");
  if (objc_msgSend(v3, "noiseEnabled"))
    v5 = objc_msgSend(v3, "onboardingCompleted");
  else
    v5 = 0;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v3, "notificationThreshold"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HDAudioAnalyticsNoiseSettingsResult initWithWatchPairedWithNoiseApp:hasNoiseEnabled:hasNoiseNotificationsEnabled:noiseThreshold:]([HDAudioAnalyticsNoiseSettingsResult alloc], "initWithWatchPairedWithNoiseApp:hasNoiseEnabled:hasNoiseNotificationsEnabled:noiseThreshold:", v2, v5, v4, v6);

  return v7;
}

- (id)headphonePreferences
{
  HDAudioAnalyticsHeadphoneSettingsResult *v3;
  void *v4;
  void *v5;
  HDAudioAnalyticsHeadphoneSettingsResult *v6;

  v3 = [HDAudioAnalyticsHeadphoneSettingsResult alloc];
  -[HDAudioAnalyticsSettingsPreferences headphonePreferencesForLocalDevice](self, "headphonePreferencesForLocalDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDAudioAnalyticsSettingsPreferences headphonePreferencesForActivePairedWatch](self, "headphonePreferencesForActivePairedWatch");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[HDAudioAnalyticsHeadphoneSettingsResult initWithLocalDevice:activePairedWatch:](v3, "initWithLocalDevice:activePairedWatch:", v4, v5);

  return v6;
}

- (id)headphonePreferencesForLocalDevice
{
  uint64_t v2;
  uint64_t v3;

  if (objc_msgSend(MEMORY[0x24BE456A0], "areHeadphoneExposureNotificationsMandatory"))
  {
    +[HDAudioAnalyticsHeadphoneSettingsDeviceResult requiredSettingsWithSaveForEightDays:](HDAudioAnalyticsHeadphoneSettingsDeviceResult, "requiredSettingsWithSaveForEightDays:", objc_msgSend(MEMORY[0x24BE456A0], "_isHeadphoneExposureDataTransient"));
  }
  else
  {
    v2 = objc_msgSend(MEMORY[0x24BE456A0], "isHeadphoneExposureNotificationsEnabled");
    v3 = objc_msgSend(MEMORY[0x24BE456A0], "isHeadphoneExposureMeasureLevelsEnabled");
    +[HDAudioAnalyticsHeadphoneSettingsDeviceResult optInSettingsWithHasHAENEnabled:hasMeasureLevelsEnabled:hasIncludeOtherHeadphonesEnabled:](HDAudioAnalyticsHeadphoneSettingsDeviceResult, "optInSettingsWithHasHAENEnabled:hasMeasureLevelsEnabled:hasIncludeOtherHeadphonesEnabled:", v2, v3, objc_msgSend(MEMORY[0x24BE456A0], "_isMeasureOtherHeadphonesEnabled"));
  }
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)headphonePreferencesForActivePairedWatch
{
  int v2;
  id v3;
  void *v4;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  id v12;
  int v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;

  if (!objc_msgSend(MEMORY[0x24BE456A0], "isHeadphoneExposureNotificationsSupportedOnActiveWatch"))
    return 0;
  v19 = 0;
  v2 = objc_msgSend(MEMORY[0x24BE456A0], "areHeadphoneExposureNotificationsMandatoryOnActiveWatchWithError:", &v19);
  v3 = v19;
  if (v3)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3000], OS_LOG_TYPE_FAULT))
      -[HDAudioAnalyticsSettingsPreferences headphonePreferencesForActivePairedWatch].cold.5();
    v4 = 0;
    goto LABEL_35;
  }
  if (v2)
  {
    v18 = 0;
    v6 = objc_msgSend(MEMORY[0x24BE456A0], "_isHeadphoneExposureDataTransientOnActiveWatchWithError:", &v18);
    v7 = v18;
    if (!v7)
    {
      +[HDAudioAnalyticsHeadphoneSettingsDeviceResult requiredSettingsWithSaveForEightDays:](HDAudioAnalyticsHeadphoneSettingsDeviceResult, "requiredSettingsWithSaveForEightDays:", v6);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_34;
    }
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3000], OS_LOG_TYPE_FAULT))
      -[HDAudioAnalyticsSettingsPreferences headphonePreferencesForActivePairedWatch].cold.1();
  }
  else
  {
    v17 = 0;
    v8 = objc_msgSend(MEMORY[0x24BE456A0], "isHeadphoneExposureNotificationsEnabledOnActiveWatchWithError:", &v17);
    v7 = v17;
    if (!v7)
    {
      v16 = 0;
      v9 = objc_msgSend(MEMORY[0x24BE456A0], "isHeadphoneExposureMeasureLevelsEnabledOnActiveWatchWithError:", &v16);
      v10 = v16;
      if (v10)
      {
        _HKInitializeLogging();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3000], OS_LOG_TYPE_FAULT))
          -[HDAudioAnalyticsSettingsPreferences headphonePreferencesForActivePairedWatch].cold.3();
        v4 = 0;
      }
      else
      {
        v15 = 0;
        v11 = objc_msgSend(MEMORY[0x24BE456A0], "_isMeasureOtherHeadphonesEnabledOnActiveWatchWithError:", &v15);
        v12 = v15;
        v13 = v11 ^ 1;
        if (v12)
          v13 = 1;
        if (v13)
          v14 = v12;
        else
          v14 = 0;
        if (((v13 | v9) & 1) == 0)
        {
          objc_msgSend(MEMORY[0x24BDD1540], "hk_error:description:", 100, CFSTR("includeOtherHeadphonesEnabled should not be enabled if measureLevelsEnabled is disabled"));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
        }
        if (v14)
        {
          _HKInitializeLogging();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3000], OS_LOG_TYPE_FAULT))
            -[HDAudioAnalyticsSettingsPreferences headphonePreferencesForActivePairedWatch].cold.2();
          v4 = 0;
        }
        else
        {
          +[HDAudioAnalyticsHeadphoneSettingsDeviceResult optInSettingsWithHasHAENEnabled:hasMeasureLevelsEnabled:hasIncludeOtherHeadphonesEnabled:](HDAudioAnalyticsHeadphoneSettingsDeviceResult, "optInSettingsWithHasHAENEnabled:hasMeasureLevelsEnabled:hasIncludeOtherHeadphonesEnabled:", v8, v9, v11);
          v4 = (void *)objc_claimAutoreleasedReturnValue();
        }

      }
      goto LABEL_34;
    }
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3000], OS_LOG_TYPE_FAULT))
      -[HDAudioAnalyticsSettingsPreferences headphonePreferencesForActivePairedWatch].cold.4();
  }
  v4 = 0;
LABEL_34:

LABEL_35:
  return v4;
}

- (BOOL)_hasPairedWatchWithNoiseApp
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  BOOL v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE6B4E0], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  objc_msgSend(v2, "getPairedDevices", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", CFSTR("F5C2DAD0-38FB-4B3B-86D3-B264F4F8CBDA"));
        LOBYTE(v8) = objc_msgSend(v8, "supportsCapability:", v9);

        if ((v8 & 1) != 0)
        {
          v10 = 1;
          goto LABEL_11;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v5)
        continue;
      break;
    }
  }
  v10 = 0;
LABEL_11:

  return v10;
}

- (void)headphonePreferencesForActivePairedWatch
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_1(&dword_21A0AA000, v0, v1, "Unable to compute headphone preferences for active paired watch (haenRequired): %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

@end
