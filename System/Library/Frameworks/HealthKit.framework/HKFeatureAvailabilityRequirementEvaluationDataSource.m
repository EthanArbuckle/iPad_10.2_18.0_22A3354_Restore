@implementation HKFeatureAvailabilityRequirementEvaluationDataSource

- (void)registerObserverForDeviceCharacteristicAndPairingChanges:(id)a3 block:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  _QWORD aBlock[4];
  id v18;
  id v19;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  v8 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __133__HKFeatureAvailabilityRequirementEvaluationDataSource_NanoRegistry__registerObserverForDeviceCharacteristicAndPairingChanges_block___block_invoke;
  aBlock[3] = &unk_1E37ECA88;
  objc_copyWeak(&v19, &location);
  v9 = v7;
  v18 = v9;
  v10 = _Block_copy(aBlock);
  -[HKFeatureAvailabilityRequirementEvaluationDataSource devicePairingAndSwitchingNotificationDataSource](self, "devicePairingAndSwitchingNotificationDataSource");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "registerObserverForDevicePairingChanges:block:", v6, v10);

  -[HKFeatureAvailabilityRequirementEvaluationDataSource darwinNotificationDataSource](self, "darwinNotificationDataSource");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  getNRPairedDeviceRegistryPairedDeviceDidChangeCapabilitiesDarwinNotification();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v8;
  v15[1] = 3221225472;
  v15[2] = __133__HKFeatureAvailabilityRequirementEvaluationDataSource_NanoRegistry__registerObserverForDeviceCharacteristicAndPairingChanges_block___block_invoke_2;
  v15[3] = &unk_1E37ECAB0;
  v14 = v10;
  v16 = v14;
  objc_msgSend(v12, "registerObserver:forKey:newValueHandler:", v6, v13, v15);

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);

}

void __133__HKFeatureAvailabilityRequirementEvaluationDataSource_NanoRegistry__registerObserverForDeviceCharacteristicAndPairingChanges_block___block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  id v4;

  v4 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

uint64_t __133__HKFeatureAvailabilityRequirementEvaluationDataSource_NanoRegistry__registerObserverForDeviceCharacteristicAndPairingChanges_block___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)unregisterObserverForDeviceCharacteristicAndPairingChanges:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[HKFeatureAvailabilityRequirementEvaluationDataSource devicePairingAndSwitchingNotificationDataSource](self, "devicePairingAndSwitchingNotificationDataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unregisterObserverForDevicePairingChanges:", v4);

  -[HKFeatureAvailabilityRequirementEvaluationDataSource darwinNotificationDataSource](self, "darwinNotificationDataSource");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  getNRPairedDeviceRegistryPairedDeviceDidChangeCapabilitiesDarwinNotification();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "unregisterObserver:forKey:", v4, v6);

}

- (HKFeatureAvailabilityRequirementEvaluationDataSource)initWithHealthDataSource:(id)a3 bluetoothDeviceDataSource:(id)a4 privacyPreferencesDataSource:(id)a5 respiratoryPreferencesDataSource:(id)a6 ageGatingDataSource:(id)a7 userNotificationSettingsDataSource:(id)a8 wristDetectionSettingDataSource:(id)a9 devicePairingAndSwitchingNotificationDataSource:(id)a10 darwinNotificationDataSource:(id)a11 watchLowPowerModeDataSource:(id)a12 currentCountryCodeProvider:(id)a13 requirementSatisfactionOverridesDataSource:(id)a14 currentDateDataSource:(id)a15 watchAppInstallationDataSource:(id)a16 onboardingRecordFallbackProvider:(id)a17 userNotificationsDataSource:(id)a18
{
  id v19;
  id v20;
  HKFeatureAvailabilityHealthDataRequirementDataSource *v21;
  void *v22;
  HKFeatureAvailabilityProvidingDataSource *v23;
  HKFeatureStatusProvidingDataSource *v24;
  HKImportExclusionDeviceDataSource *v26;
  HKFeatureAvailabilityHealthDataRequirementDataSource *v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  HKFeatureAvailabilityRequirementEvaluationDataSource *v36;
  id v37;
  id v38;
  id v39;
  id v41;
  id v43;
  id v45;
  id v47;
  id v48;

  v34 = a18;
  v33 = a17;
  v32 = a16;
  v19 = a15;
  v31 = a14;
  v30 = a13;
  v29 = a12;
  v37 = a11;
  v38 = a10;
  v39 = a9;
  v48 = a8;
  v47 = a7;
  v45 = a6;
  v43 = a5;
  v41 = a4;
  v20 = a3;
  v21 = [HKFeatureAvailabilityHealthDataRequirementDataSource alloc];
  objc_msgSend(v20, "healthDataRequirementEvaluationProvider");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = -[HKFeatureAvailabilityHealthDataRequirementDataSource initWithEvaluationProvider:](v21, "initWithEvaluationProvider:", v22);

  v23 = -[HKFeatureAvailabilityProvidingDataSource initWithHealthDataSource:]([HKFeatureAvailabilityProvidingDataSource alloc], "initWithHealthDataSource:", v20);
  v24 = objc_alloc_init(HKFeatureStatusProvidingDataSource);
  v26 = objc_alloc_init(HKImportExclusionDeviceDataSource);
  v36 = -[HKFeatureAvailabilityRequirementEvaluationDataSource initWithHealthDataSource:featureAvailabilityProvidingDataSource:featureStatusProvidingDataSource:bluetoothDeviceDataSource:privacyPreferencesDataSource:respiratoryPreferencesDataSource:ageGatingDataSource:userNotificationSettingsDataSource:wristDetectionSettingDataSource:devicePairingAndSwitchingNotificationDataSource:darwinNotificationDataSource:watchLowPowerModeDataSource:currentCountryCodeProvider:requirementSatisfactionOverridesDataSource:currentDateDataSource:watchAppInstallationDataSource:onboardingRecordFallbackProvider:userNotificationsDataSource:healthDataRequirementDataSource:importExclusionDeviceDataSource:](self, "initWithHealthDataSource:featureAvailabilityProvidingDataSource:featureStatusProvidingDataSource:bluetoothDeviceDataSource:privacyPreferencesDataSource:respiratoryPreferencesDataSource:ageGatingDataSource:userNotificationSettingsDataSource:wristDetectionSettingDataSource:devicePairingAndSwitchingNotificationDataSource:darwinNotificationDataSource:watchLowPowerModeDataSource:currentCountryCodeProvider:requirementSatisfactionOverridesDataSource:currentDateDataSource:watchAppInstallationDataSource:onboardingRecordFallbackProvider:userNotificationsDataSource:healthDataRequirementDataSource:importExclusionDeviceDataSource:", v20, v23, v24, v41, v43, v45, v47, v48, v39, v38, v37, v29,
          v30,
          v31,
          v19,
          v32,
          v33,
          v34,
          v28,
          v26);

  return v36;
}

- (HKFeatureAvailabilityRequirementEvaluationDataSource)initWithHealthDataSource:(id)a3 featureAvailabilityProvidingDataSource:(id)a4 featureStatusProvidingDataSource:(id)a5 bluetoothDeviceDataSource:(id)a6 privacyPreferencesDataSource:(id)a7 respiratoryPreferencesDataSource:(id)a8 ageGatingDataSource:(id)a9 userNotificationSettingsDataSource:(id)a10 wristDetectionSettingDataSource:(id)a11 devicePairingAndSwitchingNotificationDataSource:(id)a12 darwinNotificationDataSource:(id)a13 watchLowPowerModeDataSource:(id)a14 currentCountryCodeProvider:(id)a15 requirementSatisfactionOverridesDataSource:(id)a16 currentDateDataSource:(id)a17 watchAppInstallationDataSource:(id)a18 onboardingRecordFallbackProvider:(id)a19 userNotificationsDataSource:(id)a20 healthDataRequirementDataSource:(id)a21 importExclusionDeviceDataSource:(id)a22
{
  id v27;
  HKFeatureAvailabilityRequirementEvaluationDataSource *v28;
  int v29;
  id *p_weakHealthDataSource;
  HKFeatureAvailabilityHealthDataSource *v31;
  HKFeatureAvailabilityHealthDataSource *strongHealthDataSource;
  void *v33;
  id currentDateDataSource;
  void *v35;
  id obj;
  id v38;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;
  id v51;
  id v52;
  id v53;
  id v54;
  id v55;
  id v56;
  id v57;
  objc_super v58;

  v38 = a3;
  obj = a4;
  v57 = a4;
  v56 = a5;
  v55 = a6;
  v54 = a7;
  v53 = a8;
  v52 = a9;
  v51 = a10;
  v50 = a11;
  v49 = a12;
  v48 = a13;
  v47 = a14;
  v46 = a15;
  v45 = a16;
  v27 = a17;
  v44 = a18;
  v43 = a19;
  v42 = a20;
  v41 = a21;
  v40 = a22;
  v58.receiver = self;
  v58.super_class = (Class)HKFeatureAvailabilityRequirementEvaluationDataSource;
  v28 = -[HKFeatureAvailabilityRequirementEvaluationDataSource init](&v58, sel_init);
  if (v28)
  {
    v29 = objc_msgSend(v38, "requiresWeakRetention");
    p_weakHealthDataSource = (id *)&v28->_weakHealthDataSource;
    if (v29)
    {
      objc_storeWeak(p_weakHealthDataSource, v38);
      v31 = 0;
    }
    else
    {
      objc_storeWeak(p_weakHealthDataSource, 0);
      v31 = (HKFeatureAvailabilityHealthDataSource *)v38;
    }
    strongHealthDataSource = v28->_strongHealthDataSource;
    v28->_strongHealthDataSource = v31;

    objc_storeStrong((id *)&v28->_featureAvailabilityProvidingDataSource, obj);
    objc_storeStrong((id *)&v28->_featureStatusProvidingDataSource, a5);
    objc_storeStrong((id *)&v28->_bluetoothDeviceDataSource, a6);
    objc_storeStrong((id *)&v28->_privacyPreferencesDataSource, a7);
    objc_storeStrong((id *)&v28->_respiratoryPreferencesDataSource, a8);
    objc_storeStrong((id *)&v28->_ageGatingDataSource, a9);
    objc_storeStrong((id *)&v28->_userNotificationSettingsDataSource, a10);
    objc_storeStrong((id *)&v28->_wristDetectionSettingDataSource, a11);
    objc_storeStrong((id *)&v28->_devicePairingAndSwitchingNotificationDataSource, a12);
    objc_storeStrong((id *)&v28->_darwinNotificationDataSource, a13);
    objc_storeStrong((id *)&v28->_watchLowPowerModeDataSource, a14);
    objc_storeStrong((id *)&v28->_currentCountryCodeProvider, a15);
    objc_storeStrong((id *)&v28->_requirementSatisfactionOverridesDataSource, a16);
    v33 = _Block_copy(v27);
    currentDateDataSource = v28->_currentDateDataSource;
    v28->_currentDateDataSource = v33;

    objc_storeStrong((id *)&v28->_watchAppInstallationDataSource, a18);
    objc_storeStrong((id *)&v28->_onboardingRecordFallbackProvider, a19);
    objc_storeStrong((id *)&v28->_userNotificationsDataSource, a20);
    objc_storeStrong((id *)&v28->_healthDataRequirementDataSource, a21);
    objc_storeStrong((id *)&v28->_importExclusionDeviceDataSource, a22);
    -[HKFeatureStatusProvidingDataSource dataSource](v28->_featureStatusProvidingDataSource, "dataSource");
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v35)
      -[HKFeatureStatusProvidingDataSource setDataSource:](v28->_featureStatusProvidingDataSource, "setDataSource:", v28);
  }

  return v28;
}

+ (HKFeatureAvailabilityRequirementEvaluationDataSource)dataSourceWithHealthDataSource:(id)a3
{
  id v4;
  HKFixedCurrentCountryCodeProvider *v5;
  void *v6;

  v4 = a3;
  v5 = -[HKFixedCurrentCountryCodeProvider initWithCountryCode:]([HKFixedCurrentCountryCodeProvider alloc], "initWithCountryCode:", 0);
  objc_msgSend(a1, "dataSourceWithHealthDataSource:currentCountryCodeProvider:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (HKFeatureAvailabilityRequirementEvaluationDataSource *)v6;
}

+ (HKFeatureAvailabilityRequirementEvaluationDataSource)dataSourceWithHealthDataSource:(id)a3 currentCountryCodeProvider:(id)a4
{
  return (HKFeatureAvailabilityRequirementEvaluationDataSource *)objc_msgSend(a1, "dataSourceWithHealthDataSource:currentCountryCodeProvider:onboardingRecordFallbackProvider:", a3, a4, 0);
}

+ (HKFeatureAvailabilityRequirementEvaluationDataSource)dataSourceWithHealthDataSource:(id)a3 currentCountryCodeProvider:(id)a4 onboardingRecordFallbackProvider:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  objc_msgSend(v10, "wristDetectionSettingManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "requirementSatisfactionOverridesDataSource");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "dataSourceWithHealthDataSource:currentCountryCodeProvider:wristDetectionSettingManager:requirementSatisfactionOverridesDataSource:onboardingRecordFallbackProvider:", v10, v9, v11, v12, v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return (HKFeatureAvailabilityRequirementEvaluationDataSource *)v13;
}

+ (HKFeatureAvailabilityRequirementEvaluationDataSource)dataSourceWithHealthDataSource:(id)a3 currentCountryCodeProvider:(id)a4 wristDetectionSettingManager:(id)a5 requirementSatisfactionOverridesDataSource:(id)a6 onboardingRecordFallbackProvider:(id)a7
{
  id v12;
  id v13;
  HKNanoRegistryPairingAndSwitchingNotificationDataSource *v14;
  HKWatchLowPowerModeDataSource *v15;
  HKWatchAppInstallationDataSource *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  HKWristDetectionSettingDataSource *v21;
  HKUserNotificationsDataSource *v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  HKBluetoothDeviceDataSource *v29;
  void *v30;
  HKDarwinNotificationDataSource *v31;

  v12 = a3;
  v28 = a7;
  v27 = a6;
  v13 = a5;
  v26 = a4;
  v29 = objc_alloc_init(HKBluetoothDeviceDataSource);
  v14 = objc_alloc_init(HKNanoRegistryPairingAndSwitchingNotificationDataSource);
  v30 = v12;
  v31 = objc_alloc_init(HKDarwinNotificationDataSource);
  objc_msgSend(v12, "watchLowPowerModeDataSource");
  v15 = (HKWatchLowPowerModeDataSource *)objc_claimAutoreleasedReturnValue();
  v16 = -[HKWatchAppInstallationDataSource initWithDevicePairingAndSwitchingNotificationDataSource:]([HKWatchAppInstallationDataSource alloc], "initWithDevicePairingAndSwitchingNotificationDataSource:", v14);
  if (!v15)
    v15 = -[HKWatchLowPowerModeDataSource initWithDarwinNotificationDataSource:devicePairingAndSwitchingNotificationDataSource:]([HKWatchLowPowerModeDataSource alloc], "initWithDarwinNotificationDataSource:devicePairingAndSwitchingNotificationDataSource:", v31, v14);
  v23 = objc_alloc_init(HKUserNotificationsDataSource);
  v24 = objc_alloc((Class)a1);
  +[HKUserDefaultsDataSource privacyPreferencesDataSource](HKUserDefaultsDataSource, "privacyPreferencesDataSource");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKUserDefaultsDataSource respiratoryPreferencesDataSource](HKUserDefaultsDataSource, "respiratoryPreferencesDataSource");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKUserDefaultsDataSource ageGatingDataSource](HKUserDefaultsDataSource, "ageGatingDataSource");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKUserDefaultsDataSource sharedHealthPreferencesDataSource](HKUserDefaultsDataSource, "sharedHealthPreferencesDataSource");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = -[HKWristDetectionSettingDataSource initWithWristDetectionSettingManager:]([HKWristDetectionSettingDataSource alloc], "initWithWristDetectionSettingManager:", v13);

  v25 = (id)objc_msgSend(v24, "initWithHealthDataSource:bluetoothDeviceDataSource:privacyPreferencesDataSource:respiratoryPreferencesDataSource:ageGatingDataSource:userNotificationSettingsDataSource:wristDetectionSettingDataSource:devicePairingAndSwitchingNotificationDataSource:darwinNotificationDataSource:watchLowPowerModeDataSource:currentCountryCodeProvider:requirementSatisfactionOverridesDataSource:currentDateDataSource:watchAppInstallationDataSource:onboardingRecordFallbackProvider:userNotificationsDataSource:", v30, v29, v17, v18, v19, v20, v21, v14, v31, v15, v26, v27, &__block_literal_global_118,
              v16,
              v28,
              v23);

  return (HKFeatureAvailabilityRequirementEvaluationDataSource *)v25;
}

uint64_t __219__HKFeatureAvailabilityRequirementEvaluationDataSource_dataSourceWithHealthDataSource_currentCountryCodeProvider_wristDetectionSettingManager_requirementSatisfactionOverridesDataSource_onboardingRecordFallbackProvider___block_invoke()
{
  return objc_msgSend(MEMORY[0x1E0C99D68], "date");
}

- (id)healthDataSource
{
  HKFeatureAvailabilityHealthDataSource *WeakRetained;
  HKFeatureAvailabilityHealthDataSource *strongHealthDataSource;
  HKFeatureAvailabilityHealthDataSource *v5;
  NSObject *v7;

  WeakRetained = (HKFeatureAvailabilityHealthDataSource *)objc_loadWeakRetained((id *)&self->_weakHealthDataSource);
  strongHealthDataSource = WeakRetained;
  if (WeakRetained || (strongHealthDataSource = self->_strongHealthDataSource) != 0)
  {
    v5 = strongHealthDataSource;
  }
  else
  {
    _HKInitializeLogging();
    HKLogInfrastructure();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[HKAnalyticsDataSource healthDataSource].cold.1((uint64_t)self, v7);

    v5 = 0;
  }

  return v5;
}

- (_HKBehavior)behavior
{
  return (_HKBehavior *)+[_HKBehavior sharedBehavior](_HKBehavior, "sharedBehavior");
}

- (id)currentCountryCode
{
  return (id)-[HKCurrentCountryCodeProvider currentCountryCode](self->_currentCountryCodeProvider, "currentCountryCode");
}

- (NSDate)currentDate
{
  return (NSDate *)(*((uint64_t (**)(void))self->_currentDateDataSource + 2))();
}

- (id)onboardingEligibilityForFeatureWithIdentifier:(id)a3 error:(id *)a4
{
  HKFeatureAvailabilityOnboardingEligibility *v4;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  __CFString *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  uint64_t v20;
  HKFeatureAvailabilityRequirementEvaluationDataSource *v21;
  id v22;
  void *v23;
  HKFeatureAvailabilityOnboardingEligibility *v24;
  const __CFString *v25;
  void *v27;
  void *v28;
  id obj;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  -[HKFeatureAvailabilityRequirementEvaluationDataSource onboardingRecordForFeatureWithIdentifier:error:](self, "onboardingRecordForFeatureWithIdentifier:error:", v7, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    v10 = objc_msgSend(v8, "onboardingState");
    if ((unint64_t)(v10 - 2) < 4)
    {
      objc_msgSend(v9, "onboardedCountryCodesForOnboardingState");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v11, "count"))
      {
        v27 = v11;
        v28 = v9;
        v32 = 0u;
        v33 = 0u;
        v30 = 0u;
        v31 = 0u;
        obj = v11;
        v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
        if (v12)
        {
          v13 = v12;
          v14 = 0;
          v15 = *(_QWORD *)v31;
          v16 = -1;
          while (2)
          {
            for (i = 0; i != v13; ++i)
            {
              if (*(_QWORD *)v31 != v15)
                objc_enumerationMutation(obj);
              -[HKFeatureAvailabilityRequirementEvaluationDataSource onboardingEligibilityForFeatureWithIdentifier:countryCode:error:](self, "onboardingEligibilityForFeatureWithIdentifier:countryCode:error:", v7, *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * i), a4);
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              if (!v18)
              {

                v4 = 0;
                goto LABEL_26;
              }
              v19 = v18;
              v20 = objc_msgSend(v18, "ineligibilityReasons");
              if (!v14)
              {
                objc_msgSend(v19, "countryAvailabilityVersion");
                v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
              }
              v16 &= v20;

            }
            v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
            if (v13)
              continue;
            break;
          }
        }
        else
        {
          v14 = 0;
          v16 = -1;
        }

        v24 = [HKFeatureAvailabilityOnboardingEligibility alloc];
        if (v14)
          v25 = v14;
        else
          v25 = CFSTR("Unknown");
        v4 = -[HKFeatureAvailabilityOnboardingEligibility initWithIneligibilityReasons:countryAvailabilityVersion:](v24, "initWithIneligibilityReasons:countryAvailabilityVersion:", v16, v25);
LABEL_26:

        v11 = v27;
        v9 = v28;
        goto LABEL_27;
      }
      v21 = self;
      v22 = v7;
      v23 = 0;
LABEL_20:
      -[HKFeatureAvailabilityRequirementEvaluationDataSource onboardingEligibilityForFeatureWithIdentifier:countryCode:error:](v21, "onboardingEligibilityForFeatureWithIdentifier:countryCode:error:", v22, v23, a4);
      v4 = (HKFeatureAvailabilityOnboardingEligibility *)objc_claimAutoreleasedReturnValue();
LABEL_27:

      goto LABEL_28;
    }
    if (v10 == 1)
    {
      -[HKFeatureAvailabilityRequirementEvaluationDataSource currentCountryCode](self, "currentCountryCode");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = self;
      v22 = v7;
      v23 = v11;
      goto LABEL_20;
    }
  }
  else
  {
    v4 = 0;
  }
LABEL_28:

  return v4;
}

- (id)onboardingEligibilityForFeatureWithIdentifier:(id)a3 countryCode:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;

  v8 = a3;
  v9 = a4;
  -[HKFeatureAvailabilityProvidingDataSource featureAvailabilityProvidingForFeatureIdentifier:](self->_featureAvailabilityProvidingDataSource, "featureAvailabilityProvidingForFeatureIdentifier:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    objc_msgSend(v10, "onboardingEligibilityForCountryCode:error:", v9, a5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = (void *)MEMORY[0x1E0CB35C8];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("No extension found for feature with identifier %@"), v8);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "hk_error:description:", 110, v14);
    v15 = (id)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v15)
    {
      if (a5)
        *a5 = objc_retainAutorelease(v15);
      else
        _HKLogDroppedError(v15);
    }

    v12 = 0;
  }

  return v12;
}

- (id)onboardingRecordForFeatureWithIdentifier:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  HKFeatureOnboardingRecordFallbackProviding *onboardingRecordFallbackProvider;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  id v20;

  v6 = a3;
  -[HKFeatureAvailabilityProvidingDataSource featureAvailabilityProvidingForFeatureIdentifier:](self->_featureAvailabilityProvidingDataSource, "featureAvailabilityProvidingForFeatureIdentifier:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v20 = 0;
    objc_msgSend(v7, "featureOnboardingRecordWithError:", &v20);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v20;
    onboardingRecordFallbackProvider = self->_onboardingRecordFallbackProvider;
    if (v9)
    {
      -[HKFeatureOnboardingRecordFallbackProviding updateForRetrievedOnboardingRecord:featureIdentifier:](onboardingRecordFallbackProvider, "updateForRetrievedOnboardingRecord:featureIdentifier:", v9, v6);
    }
    else
    {
      -[HKFeatureOnboardingRecordFallbackProviding fallbackOnboardingRecordForError:featureIdentifier:](onboardingRecordFallbackProvider, "fallbackOnboardingRecordForError:featureIdentifier:", v10, v6);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v9)
      {
        v16 = v10;
        v17 = v16;
        if (v16)
        {
          if (a4)
            *a4 = objc_retainAutorelease(v16);
          else
            _HKLogDroppedError(v16);
        }

      }
    }
    v18 = v9;

  }
  else
  {
    v12 = (void *)MEMORY[0x1E0CB35C8];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("No extension found for feature with identifier %@"), v6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "hk_error:description:", 110, v13);
    v14 = (id)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v14)
    {
      if (a4)
        *a4 = objc_retainAutorelease(v14);
      else
        _HKLogDroppedError(v14);
    }

    v18 = 0;
  }

  return v18;
}

- (id)regionAvailabilityForFeatureWithIdentifier:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  id v19;

  v6 = a3;
  -[HKFeatureAvailabilityProvidingDataSource featureAvailabilityProvidingForFeatureIdentifier:](self->_featureAvailabilityProvidingDataSource, "featureAvailabilityProvidingForFeatureIdentifier:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v19 = 0;
    objc_msgSend(v7, "regionAvailabilityWithError:", &v19);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v19;
    v11 = v10;
    if (!v9)
    {
      v12 = v10;
      v13 = v12;
      if (v12)
      {
        if (a4)
          *a4 = objc_retainAutorelease(v12);
        else
          _HKLogDroppedError(v12);
      }

    }
  }
  else
  {
    v14 = (void *)MEMORY[0x1E0CB35C8];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("No extension found for feature with identifier %@"), v6);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "hk_error:description:", 110, v15);
    v16 = (id)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (v16)
    {
      if (a4)
        *a4 = objc_retainAutorelease(v16);
      else
        _HKLogDroppedError(v16);
    }

    v9 = 0;
  }

  return v9;
}

- (id)featureStatusForFeatureWithIdentifier:(id)a3 context:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;

  v8 = a3;
  -[HKFeatureStatusProvidingDataSource featureStatusProvidingForFeatureIdentifier:context:](self->_featureStatusProvidingDataSource, "featureStatusProvidingForFeatureIdentifier:context:", v8, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    objc_msgSend(v9, "featureStatusWithError:", a5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = (void *)MEMORY[0x1E0CB35C8];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("No feature status manager available for feature with identifier %@"), v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "hk_error:description:", 110, v13);
    v14 = (id)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v14)
    {
      if (a5)
        *a5 = objc_retainAutorelease(v14);
      else
        _HKLogDroppedError(v14);
    }

    v11 = 0;
  }

  return v11;
}

- (id)performLocalEvaluation:(id)a3
{
  void (**v4)(id, void *);
  HKFeatureAvailabilityLocalRequirementEvaluationContext *v5;
  void *v6;
  HKFeatureAvailabilityLocalRequirementEvaluationContext *v7;
  void *v8;

  v4 = (void (**)(id, void *))a3;
  v5 = [HKFeatureAvailabilityLocalRequirementEvaluationContext alloc];
  -[HKFeatureAvailabilityRequirementEvaluationDataSource healthDataSource](self, "healthDataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HKFeatureAvailabilityRequirementEvaluationDataSource initWithHealthDataSource:featureAvailabilityProvidingDataSource:featureStatusProvidingDataSource:bluetoothDeviceDataSource:privacyPreferencesDataSource:respiratoryPreferencesDataSource:ageGatingDataSource:userNotificationSettingsDataSource:wristDetectionSettingDataSource:devicePairingAndSwitchingNotificationDataSource:darwinNotificationDataSource:watchLowPowerModeDataSource:currentCountryCodeProvider:requirementSatisfactionOverridesDataSource:currentDateDataSource:watchAppInstallationDataSource:onboardingRecordFallbackProvider:userNotificationsDataSource:healthDataRequirementDataSource:importExclusionDeviceDataSource:](v5, "initWithHealthDataSource:featureAvailabilityProvidingDataSource:featureStatusProvidingDataSource:bluetoothDeviceDataSource:privacyPreferencesDataSource:respiratoryPreferencesDataSource:ageGatingDataSource:userNotificationSettingsDataSource:wristDetectionSettingDataSource:devicePairingAndSwitchingNotificationDataSource:darwinNotificationDataSource:watchLowPowerModeDataSource:currentCountryCodeProvider:requirementSatisfactionOverridesDataSource:currentDateDataSource:watchAppInstallationDataSource:onboardingRecordFallbackProvider:userNotificationsDataSource:healthDataRequirementDataSource:importExclusionDeviceDataSource:", v6, self->_featureAvailabilityProvidingDataSource, self->_featureStatusProvidingDataSource, self->_bluetoothDeviceDataSource, self->_privacyPreferencesDataSource, self->_respiratoryPreferencesDataSource, self->_ageGatingDataSource, self->_userNotificationSettingsDataSource, self->_wristDetectionSettingDataSource, self->_devicePairingAndSwitchingNotificationDataSource, self->_darwinNotificationDataSource, self->_watchLowPowerModeDataSource,
         self->_currentCountryCodeProvider,
         self->_requirementSatisfactionOverridesDataSource,
         self->_currentDateDataSource,
         self->_watchAppInstallationDataSource,
         self->_onboardingRecordFallbackProvider,
         self->_userNotificationsDataSource,
         self->_healthDataRequirementDataSource,
         self->_importExclusionDeviceDataSource);

  v4[2](v4, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)requirementSatisfactionOverridesForFeatureWithIdentifier:(id)a3
{
  id v4;
  HKFeatureAvailabilityRequirementSatisfactionOverrides *v5;
  void *v6;
  HKFeatureAvailabilityRequirementSatisfactionOverrides *v7;
  _QWORD v9[4];
  id v10;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v5 = [HKFeatureAvailabilityRequirementSatisfactionOverrides alloc];
  -[HKUserDefaultsDataSource userDefaults](self->_requirementSatisfactionOverridesDataSource, "userDefaults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __113__HKFeatureAvailabilityRequirementEvaluationDataSource_requirementSatisfactionOverridesForFeatureWithIdentifier___block_invoke;
  v9[3] = &unk_1E37F5C50;
  objc_copyWeak(&v10, &location);
  v7 = -[HKFeatureAvailabilityRequirementSatisfactionOverrides initWithUserDefaults:featureIdentifier:requirementOverridableEvaluator:](v5, "initWithUserDefaults:featureIdentifier:requirementOverridableEvaluator:", v6, v4, v9);
  objc_destroyWeak(&v10);

  objc_destroyWeak(&location);
  return v7;
}

uint64_t __113__HKFeatureAvailabilityRequirementEvaluationDataSource_requirementSatisfactionOverridesForFeatureWithIdentifier___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  HKFeatureAvailabilityRequirementSatisfactionOverrideEligibility *v8;
  uint64_t v9;

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v8 = objc_alloc_init(HKFeatureAvailabilityRequirementSatisfactionOverrideEligibility);
    v9 = -[HKFeatureAvailabilityRequirementSatisfactionOverrideEligibility isRequirementOverridable:featureIdentifier:dataSource:](v8, "isRequirementOverridable:featureIdentifier:dataSource:", v6, v5, WeakRetained);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)isWatchAppInstalledWithBundleIdentifier:(id)a3 error:(id *)a4
{
  HKWatchAppInstallationDataSource *watchAppInstallationDataSource;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v12;

  watchAppInstallationDataSource = self->_watchAppInstallationDataSource;
  v12 = 0;
  -[HKWatchAppInstallationDataSource isWatchAppInstalledWithBundleIdentifier:error:](watchAppInstallationDataSource, "isWatchAppInstalledWithBundleIdentifier:error:", a3, &v12);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v12;
  v8 = v7;
  if (!v6)
  {
    v9 = v7;
    v10 = v9;
    if (v9)
    {
      if (a4)
        *a4 = objc_retainAutorelease(v9);
      else
        _HKLogDroppedError(v9);
    }

  }
  return v6;
}

- (HKFeatureAvailabilityProvidingDataSource)featureAvailabilityProvidingDataSource
{
  return self->_featureAvailabilityProvidingDataSource;
}

- (HKFeatureStatusProvidingDataSource)featureStatusProvidingDataSource
{
  return self->_featureStatusProvidingDataSource;
}

- (HKBluetoothDeviceDataSource)bluetoothDeviceDataSource
{
  return self->_bluetoothDeviceDataSource;
}

- (HKUserDefaultsDataSource)privacyPreferencesDataSource
{
  return self->_privacyPreferencesDataSource;
}

- (HKUserDefaultsDataSource)respiratoryPreferencesDataSource
{
  return self->_respiratoryPreferencesDataSource;
}

- (HKUserDefaultsDataSource)ageGatingDataSource
{
  return self->_ageGatingDataSource;
}

- (HKUserDefaultsDataSource)userNotificationSettingsDataSource
{
  return self->_userNotificationSettingsDataSource;
}

- (HKWristDetectionSettingDataSource)wristDetectionSettingDataSource
{
  return self->_wristDetectionSettingDataSource;
}

- (HKNanoRegistryPairingAndSwitchingNotificationDataSource)devicePairingAndSwitchingNotificationDataSource
{
  return self->_devicePairingAndSwitchingNotificationDataSource;
}

- (HKDarwinNotificationDataSource)darwinNotificationDataSource
{
  return self->_darwinNotificationDataSource;
}

- (HKWatchAppInstallationDataSource)watchAppInstallationDataSource
{
  return self->_watchAppInstallationDataSource;
}

- (HKWatchLowPowerModeDataSource)watchLowPowerModeDataSource
{
  return self->_watchLowPowerModeDataSource;
}

- (HKUserNotificationsDataSource)userNotificationsDataSource
{
  return self->_userNotificationsDataSource;
}

- (HKImportExclusionDeviceDataSource)importExclusionDeviceDataSource
{
  return self->_importExclusionDeviceDataSource;
}

- (HKCurrentCountryCodeProvider)currentCountryCodeProvider
{
  return self->_currentCountryCodeProvider;
}

- (HKFeatureAvailabilityHealthDataSource)weakHealthDataSource
{
  return (HKFeatureAvailabilityHealthDataSource *)objc_loadWeakRetained((id *)&self->_weakHealthDataSource);
}

- (HKFeatureAvailabilityHealthDataSource)strongHealthDataSource
{
  return self->_strongHealthDataSource;
}

- (id)currentDateDataSource
{
  return self->_currentDateDataSource;
}

- (void)setCurrentDateDataSource:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (HKFeatureOnboardingRecordFallbackProviding)onboardingRecordFallbackProvider
{
  return self->_onboardingRecordFallbackProvider;
}

- (void)setOnboardingRecordFallbackProvider:(id)a3
{
  objc_storeStrong((id *)&self->_onboardingRecordFallbackProvider, a3);
}

- (HKFeatureAvailabilityHealthDataRequirementDataSource)healthDataRequirementDataSource
{
  return self->_healthDataRequirementDataSource;
}

- (HKFeatureAvailabilityRequirementSatisfactionOverridesDataSource)requirementSatisfactionOverridesDataSource
{
  return self->_requirementSatisfactionOverridesDataSource;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requirementSatisfactionOverridesDataSource, 0);
  objc_storeStrong((id *)&self->_healthDataRequirementDataSource, 0);
  objc_storeStrong((id *)&self->_onboardingRecordFallbackProvider, 0);
  objc_storeStrong(&self->_currentDateDataSource, 0);
  objc_storeStrong((id *)&self->_strongHealthDataSource, 0);
  objc_destroyWeak((id *)&self->_weakHealthDataSource);
  objc_storeStrong((id *)&self->_currentCountryCodeProvider, 0);
  objc_storeStrong((id *)&self->_importExclusionDeviceDataSource, 0);
  objc_storeStrong((id *)&self->_userNotificationsDataSource, 0);
  objc_storeStrong((id *)&self->_watchLowPowerModeDataSource, 0);
  objc_storeStrong((id *)&self->_watchAppInstallationDataSource, 0);
  objc_storeStrong((id *)&self->_darwinNotificationDataSource, 0);
  objc_storeStrong((id *)&self->_devicePairingAndSwitchingNotificationDataSource, 0);
  objc_storeStrong((id *)&self->_wristDetectionSettingDataSource, 0);
  objc_storeStrong((id *)&self->_userNotificationSettingsDataSource, 0);
  objc_storeStrong((id *)&self->_ageGatingDataSource, 0);
  objc_storeStrong((id *)&self->_respiratoryPreferencesDataSource, 0);
  objc_storeStrong((id *)&self->_privacyPreferencesDataSource, 0);
  objc_storeStrong((id *)&self->_bluetoothDeviceDataSource, 0);
  objc_storeStrong((id *)&self->_featureStatusProvidingDataSource, 0);
  objc_storeStrong((id *)&self->_featureAvailabilityProvidingDataSource, 0);
}

@end
