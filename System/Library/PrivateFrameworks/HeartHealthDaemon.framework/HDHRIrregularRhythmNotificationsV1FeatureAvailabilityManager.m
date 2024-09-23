@implementation HDHRIrregularRhythmNotificationsV1FeatureAvailabilityManager

- (id)featureOnboardingRecordWithError:(id *)a3
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v13;
  void *v14;
  void *v15;
  id v16;
  id v17;

  v17 = 0;
  -[HDHRIrregularRhythmNotificationsV1FeatureAvailabilityManager onboardedCountryCodeSupportedStateWithError:](self, "onboardedCountryCodeSupportedStateWithError:", &v17);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v17;
  v7 = v6;
  if (!v5)
  {
    v9 = v6;
    if (!v9)
    {
LABEL_12:
      v11 = 0;
      goto LABEL_13;
    }
    if (!a3)
    {
LABEL_11:
      _HKLogDroppedError();
      goto LABEL_12;
    }
LABEL_7:
    v9 = objc_retainAutorelease(v9);
    v11 = 0;
    *a3 = v9;
    goto LABEL_13;
  }
  v16 = 0;
  -[HDHRIrregularRhythmNotificationsV1FeatureAvailabilityManager _onboardingCompletionWithError:](self, "_onboardingCompletionWithError:", &v16);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v16;
  if (!v8)
  {
    if (objc_msgSend(v5, "integerValue") == 1)
    {
      if (v9)
      {
        if (!a3)
          goto LABEL_11;
        goto LABEL_7;
      }
      if (objc_msgSend(v5, "integerValue") != 1)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:description:", a3, 100, CFSTR("Unexpectedly in an onboarded state with no onboarding completion"));
        goto LABEL_12;
      }
      v8 = 0;
    }
    else
    {
      _HKInitializeLogging();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52F0], OS_LOG_TYPE_DEBUG))
        -[HDHRIrregularRhythmNotificationsV1FeatureAvailabilityManager featureOnboardingRecordWithError:].cold.1();
      v13 = objc_alloc(MEMORY[0x1E0CB6990]);
      -[HDHRIrregularRhythmNotificationsV1FeatureAvailabilityManager featureIdentifier](self, "featureIdentifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)objc_msgSend(v13, "initWithFeatureIdentifier:version:completionDate:countryCode:countryCodeProvenance:", v14, 1, v15, 0, 0);

      if (v8)
        goto LABEL_3;
    }
    v10 = 0;
    goto LABEL_4;
  }
LABEL_3:
  objc_msgSend(MEMORY[0x1E0CB6720], "hdhr_irregularRhythmNotificationsV1SettingsFromDefaults:", self->_notificationSettingDefaults);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_4:
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB6718]), "initWithOnboardingState:onboardingCompletion:featureSettings:", objc_msgSend(v5, "integerValue"), v8, v10);

LABEL_13:
  return v11;
}

- (id)onboardingEligibilityForCountryCode:(id)a3 error:(id *)a4
{
  void *v5;
  void *v6;
  void *v7;

  -[HDHRIrregularRhythmNotificationsV1FeatureAvailabilityManager _onboardingEligibilityForCountryCode:error:](self, "_onboardingEligibilityForCountryCode:error:", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDHRIrregularRhythmNotificationsV1FeatureAvailabilityManager featureIdentifier](self, "featureIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "eligibilityRespectingOverridesForFeatureIdentifier:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_onboardingEligibilityForCountryCode:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  int v12;
  int v13;
  uint64_t v14;
  BOOL v15;
  void *v16;
  uint64_t v17;
  id v18;
  void *v19;
  int v20;
  id v21;
  void *v22;

  v6 = a3;
  -[HDPairedDeviceCapabilityProviding activePairedDevice](self->_pairedDeviceProvider, "activePairedDevice");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDFeatureDisableAndExpiryProviding rescindedStatusForCountryCode:device:error:](self->_disableAndExpiryProvider, "rescindedStatusForCountryCode:device:error:", v6, v7, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "integerValue");
    v10 = HKFeatureAvailabilityOnboardingIneligibilityReasonsForRescindedStatus() | (2 * (v7 == 0));
    if (v6)
    {
      objc_msgSend(MEMORY[0x1E0CB6F18], "sharedBehavior");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "isAppleWatch");

      if (v12)
      {
        v13 = _LocalWatchDeviceSupportsCountryCode(v6);
        v14 = v10 | 8;
        v15 = v13 == 0;
      }
      else
      {
        if (v7 && !_PairedWatchDeviceSupportsCountryCode(v7, v6))
          v10 |= 0x20uLL;
        v18 = v6;
        HKAtrialFibrillationDetectionSupportedCountries();
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "containsObject:", v18);

        v14 = v10 | 8;
        v15 = v20 == 0;
      }
      if (v15)
        v17 = v14;
      else
        v17 = v10;
      if (v7
        && !-[HDHRIrregularRhythmNotificationsV1FeatureAvailabilityManager _isFeatureSupportedOnDevice:](self, "_isFeatureSupportedOnDevice:", v7))
      {
        v17 |= 4uLL;
      }
    }
    else
    {
      v17 = v10 | 1;
    }
    v21 = objc_alloc(MEMORY[0x1E0CB66D0]);
    -[HDHRIrregularRhythmNotificationsV1FeatureAvailabilityManager countryAvailabilityVersion](self, "countryAvailabilityVersion");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v21, "initWithIneligibilityReasons:countryAvailabilityVersion:", v17, v22);

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (id)countryAvailabilityVersion
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB6F18], "sharedBehavior");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentOSBuild");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_onboardingCompletionWithError:(id *)a3
{
  void *v5;
  id WeakRetained;
  void *v7;
  void *v8;
  void *v9;

  v5 = (void *)MEMORY[0x1E0D294B8];
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(v5, "hdhr_heartRhythmProtectedSyncedDomainForProfile:", WeakRetained);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[HDHRIrregularRhythmNotificationsV1FeatureAvailabilityManager featureIdentifier](self, "featureIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "hdhr_irregularRhythmNotificationsOnboardingCompletionForFeatureIdentifier:error:", v8, a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (NSString)featureIdentifier
{
  return (NSString *)(id)*MEMORY[0x1E0CB5040];
}

- (id)onboardedCountryCodeSupportedStateWithError:(id *)a3
{
  void *v5;
  id v6;
  __CFString *v7;
  id WeakRetained;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  NSObject *v13;
  BOOL v14;
  const __CFString *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  _BOOL4 v25;
  HDFeatureDisableAndExpiryProviding *disableAndExpiryProvider;
  void *v27;
  unint64_t v28;
  id v29;
  NSObject *v31;
  void *v32;
  id v33;
  id v34;
  id v35;
  uint8_t buf[4];
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v35 = 0;
  -[HDHRIrregularRhythmNotificationsV1FeatureAvailabilityManager _onboardingCompletionWithError:](self, "_onboardingCompletionWithError:", &v35);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v35;
  objc_msgSend(v5, "countryCode");
  v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
LABEL_20:
    -[HDPairedDeviceCapabilityProviding activePairedDevice](self->_pairedDeviceProvider, "activePairedDevice");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v17)
    {
      _HKInitializeLogging();
      v18 = (void *)*MEMORY[0x1E0CB52F0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52F0], OS_LOG_TYPE_DEFAULT))
      {
        v19 = v18;
        v20 = (void *)objc_opt_class();
        *(_DWORD *)buf = 138543362;
        v37 = v20;
        v21 = v20;
        _os_log_impl(&dword_1CC29C000, v19, OS_LOG_TYPE_DEFAULT, "[%{public}@] Onboarding record present but not supported due to nil paired device", buf, 0xCu);

      }
LABEL_27:
      v22 = &unk_1E87FECD8;
LABEL_28:
      v23 = v6;
LABEL_54:

      goto LABEL_55;
    }
    if (v7)
    {
      if (!v5
        || -[HDHRIrregularRhythmNotificationsV1FeatureAvailabilityManager _countryCodeIsSupportedForDevicePairing:device:](self, "_countryCodeIsSupportedForDevicePairing:device:", v7, v17))
      {
LABEL_36:
        disableAndExpiryProvider = self->_disableAndExpiryProvider;
        v34 = v6;
        -[HDFeatureDisableAndExpiryProviding rescindedStatusForCountryCode:device:error:](disableAndExpiryProvider, "rescindedStatusForCountryCode:device:error:", v7, v17, &v34);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = v34;

        if (v27)
        {
          v28 = objc_msgSend(v27, "integerValue");
          if (v28 > 2)
            v22 = &unk_1E87FED20;
          else
            v22 = (void *)qword_1E87EF710[v28];
        }
        else
        {
          _HKInitializeLogging();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52F0], OS_LOG_TYPE_ERROR))
            -[HDHRIrregularRhythmNotificationsV1FeatureAvailabilityManager onboardedCountryCodeSupportedStateWithError:].cold.1();
          v29 = v23;
          if (v29)
          {
            if (a3)
              *a3 = objc_retainAutorelease(v29);
            else
              _HKLogDroppedError();
          }

          v22 = 0;
        }

        goto LABEL_54;
      }
      goto LABEL_27;
    }
    _HKInitializeLogging();
    v24 = (void *)*MEMORY[0x1E0CB52F0];
    v25 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52F0], OS_LOG_TYPE_ERROR);
    if (!v6)
    {
      if (v25)
        -[HDHRIrregularRhythmNotificationsV1FeatureAvailabilityManager onboardedCountryCodeSupportedStateWithError:].cold.2(v24);
      v7 = CFSTR("OnboardedInHealthDatabaseWithoutACountryCode");
      goto LABEL_36;
    }
    if (v25)
    {
      -[HDHRIrregularRhythmNotificationsV1FeatureAvailabilityManager onboardedCountryCodeSupportedStateWithError:].cold.3();
      if (a3)
        goto LABEL_32;
    }
    else if (a3)
    {
LABEL_32:
      v23 = objc_retainAutorelease(v6);
      v7 = 0;
      v22 = 0;
      *a3 = v23;
      goto LABEL_54;
    }
    _HKLogDroppedError();
    v7 = 0;
    v22 = 0;
    goto LABEL_28;
  }
  if (v6 && objc_msgSend(v6, "hk_isDatabaseAccessibilityError"))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
    objc_msgSend(WeakRetained, "database");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isDataProtectedByFirstUnlockAvailable");

  }
  else
  {
    v10 = 0;
  }
  -[NSUserDefaults objectForKey:](self->_notificationSettingDefaults, "objectForKey:", *MEMORY[0x1E0CB76D0]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  _HKInitializeLogging();
  v12 = (void *)*MEMORY[0x1E0CB52F0];
  v13 = *MEMORY[0x1E0CB52F0];
  if (v11)
    v14 = v10 == 0;
  else
    v14 = 1;
  if (!v14)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[HDHRIrregularRhythmNotificationsV1FeatureAvailabilityManager onboardedCountryCodeSupportedStateWithError:].cold.4(v12);
    v16 = CFSTR("HealthDatabaseIsUnavailableButSettingIsPresent");
LABEL_19:

    v7 = (__CFString *)v16;
    goto LABEL_20;
  }
  if (v6)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[HDHRIrregularRhythmNotificationsV1FeatureAvailabilityManager onboardedCountryCodeSupportedStateWithError:].cold.6();
    if (a3)
      *a3 = objc_retainAutorelease(v6);
    else
      _HKLogDroppedError();

    v22 = 0;
  }
  else
  {
    if (v11)
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        -[HDHRIrregularRhythmNotificationsV1FeatureAvailabilityManager onboardedCountryCodeSupportedStateWithError:].cold.5(v12);
      v16 = CFSTR("NoOnboardingInHealthDatabaseButSettingIsPresent");
      goto LABEL_19;
    }
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v31 = v12;
      v32 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543362;
      v37 = v32;
      v33 = v32;
      _os_log_impl(&dword_1CC29C000, v31, OS_LOG_TYPE_DEFAULT, "[%{public}@] No record of onboarding found", buf, 0xCu);

    }
    v22 = &unk_1E87FECC0;
  }
LABEL_55:

  return v22;
}

- (HDHRIrregularRhythmNotificationsV1FeatureAvailabilityManager)initWithProfile:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  HDHRIrregularRhythmNotificationsV1FeatureAvailabilityManager *v11;

  v4 = (objc_class *)MEMORY[0x1E0D29510];
  v5 = a3;
  v6 = [v4 alloc];
  objc_msgSend(v5, "daemon");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithDaemon:remoteDisableCondition:seedExpirationCondition:", v7, *MEMORY[0x1E0CB5DF8], *MEMORY[0x1E0CB5E08]);

  v9 = objc_alloc(MEMORY[0x1E0C99EA0]);
  v10 = (void *)objc_msgSend(v9, "initWithSuiteName:", *MEMORY[0x1E0CB76F8]);
  v11 = -[HDHRIrregularRhythmNotificationsV1FeatureAvailabilityManager initWithProfile:disableAndExpiryProvider:notificationSettingDefaults:](self, "initWithProfile:disableAndExpiryProvider:notificationSettingDefaults:", v5, v8, v10);

  return v11;
}

- (HDHRIrregularRhythmNotificationsV1FeatureAvailabilityManager)initWithProfile:(id)a3 disableAndExpiryProvider:(id)a4 notificationSettingDefaults:(id)a5
{
  id v8;
  id v9;
  id v10;
  HDHRIrregularRhythmNotificationsV1FeatureAvailabilityManager *v11;
  HDHRIrregularRhythmNotificationsV1FeatureAvailabilityManager *v12;
  void *v13;
  uint64_t v14;
  HDPairedDeviceCapabilityProviding *pairedDeviceProvider;
  id v16;
  objc_class *v17;
  void *v18;
  uint64_t v19;
  HKFeatureAvailabilityProvidingObserver *observers;
  id WeakRetained;
  void *v22;
  objc_super v24;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v24.receiver = self;
  v24.super_class = (Class)HDHRIrregularRhythmNotificationsV1FeatureAvailabilityManager;
  v11 = -[HDHRIrregularRhythmNotificationsV1FeatureAvailabilityManager init](&v24, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_profile, v8);
    objc_msgSend(v8, "daemon");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "nanoRegistryDeviceCapabilityProvider");
    v14 = objc_claimAutoreleasedReturnValue();
    pairedDeviceProvider = v12->_pairedDeviceProvider;
    v12->_pairedDeviceProvider = (HDPairedDeviceCapabilityProviding *)v14;

    objc_storeStrong((id *)&v12->_disableAndExpiryProvider, a4);
    objc_storeStrong((id *)&v12->_notificationSettingDefaults, a5);
    v16 = objc_alloc(MEMORY[0x1E0CB6988]);
    v17 = (objc_class *)objc_opt_class();
    NSStringFromClass(v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v16, "initWithName:loggingCategory:", v18, *MEMORY[0x1E0CB52F0]);
    observers = v12->_observers;
    v12->_observers = (HKFeatureAvailabilityProvidingObserver *)v19;

    WeakRetained = objc_loadWeakRetained((id *)&v12->_profile);
    objc_msgSend(WeakRetained, "daemon");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "registerDaemonReadyObserver:queue:", v12, 0);

  }
  return v12;
}

- (void)dealloc
{
  objc_super v3;

  if (-[HKFeatureAvailabilityProvidingObserver count](self->_observers, "count"))
    -[NSUserDefaults removeObserver:forKeyPath:context:](self->_notificationSettingDefaults, "removeObserver:forKeyPath:context:", self, *MEMORY[0x1E0CB76D0], HDHRIrregularRhythmNotificationsSettingObservingContext);
  v3.receiver = self;
  v3.super_class = (Class)HDHRIrregularRhythmNotificationsV1FeatureAvailabilityManager;
  -[HDHRIrregularRhythmNotificationsV1FeatureAvailabilityManager dealloc](&v3, sel_dealloc);
}

- (BOOL)_countryCodeIsSupportedForDevicePairing:(id)a3 device:(id)a4
{
  id v5;
  id v6;
  void *v7;
  int v8;
  char v9;
  char v10;
  id v11;
  void *v12;
  char v13;

  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0CB6F18], "sharedBehavior");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isAppleWatch");

  if (v8)
  {
    v9 = _LocalWatchDeviceSupportsCountryCode(v5);
  }
  else
  {
    v10 = _PairedWatchDeviceSupportsCountryCode(v6, v5);
    v11 = v5;
    HKAtrialFibrillationDetectionSupportedCountries();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "containsObject:", v11);

    v9 = v10 & v13;
  }

  return v9;
}

- (BOOL)_isFeatureSupportedOnDevice:(id)a3
{
  id v3;
  void *v4;
  char v5;
  BOOL v6;
  void *v7;

  v3 = a3;
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB6F18], "sharedBehavior");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isAppleWatch");

    if ((v5 & 1) != 0)
    {
      v6 = 1;
    }
    else
    {
      objc_msgSend(v3, "valueForProperty:", *MEMORY[0x1E0D51638]);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v7 != 0;

    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)canCompleteOnboardingForCountryCode:(id)a3 error:(id *)a4
{
  void *v4;
  void *v5;
  void *v6;

  -[HDHRIrregularRhythmNotificationsV1FeatureAvailabilityManager onboardingEligibilityForCountryCode:error:](self, "onboardingEligibilityForCountryCode:error:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v4, "isEligible"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)earliestDateLowestOnboardingVersionCompletedWithError:(id *)a3
{
  void *v4;
  id WeakRetained;
  void *v6;
  void *v7;

  v4 = (void *)MEMORY[0x1E0D294B8];
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(v4, "hdhr_heartRhythmProtectedSyncedDomainForProfile:", WeakRetained);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "hdhr_atrialFibrillationOnboardingCompletedDateWithError:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)getFeatureOnboardingRecordWithCompletion:(id)a3
{
  void (**v4)(id, void *, id);
  void *v5;
  id v6;
  id v7;

  v7 = 0;
  v4 = (void (**)(id, void *, id))a3;
  -[HDHRIrregularRhythmNotificationsV1FeatureAvailabilityManager featureOnboardingRecordWithError:](self, "featureOnboardingRecordWithError:", &v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v7;
  v4[2](v4, v5, v6);

}

- (void)isCurrentOnboardingVersionCompletedWithCompletion:(id)a3
{
  void (**v4)(id, void *, id);
  void *v5;
  id v6;
  id v7;

  v7 = 0;
  v4 = (void (**)(id, void *, id))a3;
  -[HDHRIrregularRhythmNotificationsV1FeatureAvailabilityManager isCurrentOnboardingVersionCompletedWithError:](self, "isCurrentOnboardingVersionCompletedWithError:", &v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v7;
  v4[2](v4, v5, v6);

}

- (id)isCurrentOnboardingVersionCompletedWithError:(id *)a3
{
  void *v3;
  void *v4;
  void *v5;

  -[HDHRIrregularRhythmNotificationsV1FeatureAvailabilityManager onboardedCountryCodeSupportedStateWithError:](self, "onboardedCountryCodeSupportedStateWithError:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    if (objc_msgSend(v3, "integerValue") == 2)
      v5 = (void *)MEMORY[0x1E0C9AAB0];
    else
      v5 = (void *)MEMORY[0x1E0C9AAA0];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)isFeatureCapabilitySupportedOnActivePairedDeviceWithError:(id *)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  -[HDPairedDeviceCapabilityProviding activePairedDevice](self->_pairedDeviceProvider, "activePairedDevice", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "numberWithBool:", -[HDHRIrregularRhythmNotificationsV1FeatureAvailabilityManager _isFeatureSupportedOnDevice:](self, "_isFeatureSupportedOnDevice:", v5));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)pairedFeatureAttributesWithError:(id *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  objc_msgSend(MEMORY[0x1E0CB66B0], "featureAttributesDerivedFromOSBuildAndFeatureVersion:watchDeviceIdentifier:phoneDeviceIdentifier:", *MEMORY[0x1E0CB51D0], *MEMORY[0x1E0CB51E0], *MEMORY[0x1E0CB51D8]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDPairedDeviceCapabilityProviding activePairedDevice](self->_pairedDeviceProvider, "activePairedDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "valueForProperty:", *MEMORY[0x1E0D51638]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_msgSend(v6, "valueForProperty:", *MEMORY[0x1E0D51630]);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "valueForProperty:", *MEMORY[0x1E0D51628]);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB66B0]), "initWithFeatureVersion:updateVersion:UDIDeviceIdentifier:yearOfRelease:", CFSTR("1"), v7, v8, v9);

    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB69D0]), "initWithLocalAttributes:pairedAttributes:", v4, v10);

  return v11;
}

- (id)featureAvailabilityRequirementsWithError:(id *)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB66F0], "noRequirements", a3);
}

- (id)regionAvailabilityWithError:(id *)a3
{
  objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:description:", a3, 125, CFSTR("-regionAvailabilityWithError is not implemented"));
  return 0;
}

- (void)removeFeatureSettingValueForKey:(id)a3 completion:(id)a4
{
  id v6;
  uint64_t v7;
  void (**v8)(id, uint64_t, _QWORD);
  NSUserDefaults *notificationSettingDefaults;
  uint64_t v10;
  void *v11;
  uint64_t v12;

  v6 = a3;
  v7 = *MEMORY[0x1E0CB50C8];
  v8 = (void (**)(id, uint64_t, _QWORD))a4;
  if (objc_msgSend(v6, "isEqual:", v7))
  {
    notificationSettingDefaults = self->_notificationSettingDefaults;
    v10 = *MEMORY[0x1E0CB76D0];
    -[NSUserDefaults removeObjectForKey:](notificationSettingDefaults, "removeObjectForKey:", *MEMORY[0x1E0CB76D0]);
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    HKSynchronizeNanoPreferencesUserDefaults();

    v8[2](v8, 1, 0);
  }
  else
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52F0], OS_LOG_TYPE_ERROR))
      -[HDHRIrregularRhythmNotificationsV1FeatureAvailabilityManager removeFeatureSettingValueForKey:completion:].cold.1();
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:", 3, CFSTR("Cannot remove unknown setting for IRN 1.0"));
    v12 = objc_claimAutoreleasedReturnValue();
    v8[2](v8, 0, v12);

    v8 = (void (**)(id, uint64_t, _QWORD))v12;
  }

}

- (void)resetOnboardingWithCompletion:(id)a3
{
  void *v4;
  HDProfile **p_profile;
  void (**v6)(id, uint64_t, id);
  id WeakRetained;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  HDHRHealthKitSyncManager *v16;
  id v17;
  HDHRHealthKitSyncManager *v18;
  NSObject **v19;
  NSObject *v20;
  NSObject *v21;
  void *v22;
  id v23;
  id v24;
  uint8_t buf[4];
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0D294B8];
  p_profile = &self->_profile;
  v6 = (void (**)(id, uint64_t, id))a3;
  WeakRetained = objc_loadWeakRetained((id *)p_profile);
  objc_msgSend(v4, "hdhr_heartRhythmProtectedSyncedDomainForProfile:", WeakRetained);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = 0;
  v9 = objc_msgSend(v8, "hdhr_resetAtrialFibrillationDetectionOnboardingWithError:", &v24);
  v10 = v24;
  if ((_DWORD)v9)
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "hk_heartRhythmDefaults");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = *MEMORY[0x1E0CB47A0];
    objc_msgSend(v11, "removeObjectForKey:", *MEMORY[0x1E0CB47A0]);
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    HKSynchronizeNanoPreferencesUserDefaults();

    v14 = *MEMORY[0x1E0CB76D0];
    -[NSUserDefaults removeObjectForKey:](self->_notificationSettingDefaults, "removeObjectForKey:", *MEMORY[0x1E0CB76D0]);
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    HKSynchronizeNanoPreferencesUserDefaults();

    notify_post((const char *)*MEMORY[0x1E0CB5E18]);
    v16 = [HDHRHealthKitSyncManager alloc];
    v17 = objc_loadWeakRetained((id *)p_profile);
    v18 = -[HDHRHealthKitSyncManager initWithProfile:](v16, "initWithProfile:", v17);

    v19 = (NSObject **)MEMORY[0x1E0CB52F0];
    -[HDHRHealthKitSyncManager triggerImmediateSyncWithReason:loggingCategory:](v18, "triggerImmediateSyncWithReason:loggingCategory:", CFSTR("IRN onboarding has been reset"), *MEMORY[0x1E0CB52F0]);
    _HKInitializeLogging();
    v20 = *v19;
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      v21 = v20;
      v22 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543362;
      v26 = v22;
      v23 = v22;
      _os_log_impl(&dword_1CC29C000, v21, OS_LOG_TYPE_DEFAULT, "[%{public}@] Reset onboarding successfully", buf, 0xCu);

    }
  }
  else
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52F0], OS_LOG_TYPE_ERROR))
      -[HDHRIrregularRhythmNotificationsV1FeatureAvailabilityManager resetOnboardingWithCompletion:].cold.1();
  }
  v6[2](v6, v9, v10);

}

- (void)setCurrentOnboardingVersionCompletedForCountryCode:(id)a3 countryCodeProvenance:(int64_t)a4 date:(id)a5 settings:(id)a6 completion:(id)a7
{
  id v11;
  id v12;
  id v13;
  void (**v14)(id, _QWORD, id);
  void *v15;
  NSObject *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  id WeakRetained;
  void *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  id *v45;
  id v46;
  id v47;
  NSObject *v48;
  void *v49;
  id v50;
  NSObject *v51;
  void *v52;
  id v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  char v58;
  void *v59;
  id v60;
  _QWORD v61[5];
  void *v62;
  _QWORD v63[5];
  void *v64;
  _QWORD v65[5];
  id v66;
  void (**v67)(id, _QWORD, id);
  char v68;
  id v69;
  id v70;
  id v71;
  id v72;
  uint8_t buf[4];
  void *v74;
  __int16 v75;
  id v76;
  __int16 v77;
  id v78;
  uint64_t v79;

  v79 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a5;
  v13 = a6;
  v14 = (void (**)(id, _QWORD, id))a7;
  if (v12)
  {
    _HKInitializeLogging();
    v15 = (void *)*MEMORY[0x1E0CB52F0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52F0], OS_LOG_TYPE_DEFAULT))
    {
      v16 = v15;
      v17 = (void *)objc_opt_class();
      v18 = v17;
      objc_msgSend(v12, "debugDescription");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v74 = v17;
      v75 = 2114;
      v76 = v19;
      _os_log_impl(&dword_1CC29C000, v16, OS_LOG_TYPE_DEFAULT, "[%{public}@] Attempting to set onboarding date to %{public}@, but IRN V1 does not support specifying onboarding date", buf, 0x16u);

    }
  }
  if (v11)
  {
    v72 = 0;
    -[HDHRIrregularRhythmNotificationsV1FeatureAvailabilityManager featureOnboardingRecordWithError:](self, "featureOnboardingRecordWithError:", &v72);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v72;
    if (!v20)
    {
      _HKInitializeLogging();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52F0], OS_LOG_TYPE_ERROR))
        -[HDHRIrregularRhythmNotificationsV1FeatureAvailabilityManager setCurrentOnboardingVersionCompletedForCountryCode:countryCodeProvenance:date:settings:completion:].cold.1();
      v14[2](v14, 0, v21);
      goto LABEL_33;
    }
    objc_msgSend(v20, "allOnboardedCountryCodesRegardlessOfSupportedState");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "containsObject:", v11);

    if (v23)
    {
      _HKInitializeLogging();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52F0], OS_LOG_TYPE_ERROR))
        -[HDHRIrregularRhythmNotificationsV1FeatureAvailabilityManager setCurrentOnboardingVersionCompletedForCountryCode:countryCodeProvenance:date:settings:completion:].cold.2();
      objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:format:", 3, CFSTR("IRN is already onboarded for %@"), v11);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v14[2](v14, 0, v24);

      goto LABEL_33;
    }
    v71 = v21;
    -[HDHRIrregularRhythmNotificationsV1FeatureAvailabilityManager onboardingEligibilityForCountryCode:error:](self, "onboardingEligibilityForCountryCode:error:", v11, &v71);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v71;

    if (!v25)
    {
      _HKInitializeLogging();
      v34 = (void *)*MEMORY[0x1E0CB52F0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52F0], OS_LOG_TYPE_ERROR))
      {
        v48 = v34;
        v49 = (void *)objc_opt_class();
        *(_DWORD *)buf = 138543874;
        v74 = v49;
        v75 = 2114;
        v76 = v11;
        v77 = 2114;
        v78 = v26;
        v50 = v49;
        _os_log_error_impl(&dword_1CC29C000, v48, OS_LOG_TYPE_ERROR, "[%{public}@] Error checking onboarding completion ability in country %{public}@: %{public}@", buf, 0x20u);

      }
      v14[2](v14, 0, v26);
      goto LABEL_32;
    }
    if ((objc_msgSend(v25, "isEligible") & 1) == 0)
    {
      v35 = (void *)MEMORY[0x1E0CB35C8];
      objc_msgSend(v25, "ineligibilityReasonsDescription");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "hk_error:format:", 110, CFSTR("This feature cannot be enabled for country %@: %@"), v11, v36);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v14[2](v14, 0, v37);

LABEL_32:
      v21 = v26;
LABEL_33:

      goto LABEL_34;
    }
    v27 = (void *)MEMORY[0x1E0D294B8];
    WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
    objc_msgSend(v27, "hdhr_heartRhythmProtectedSyncedDomainForProfile:", WeakRetained);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    v70 = v26;
    v59 = v29;
    LODWORD(v29) = objc_msgSend(v29, "hdhr_setAtrialFibrillationDetectionCurrentOnboardingVersionCompletedInCountryCode:error:", v11, &v70);
    v60 = v70;

    v58 = (char)v29;
    if ((_DWORD)v29)
    {
      notify_post((const char *)*MEMORY[0x1E0CB5E18]);
      _HKInitializeLogging();
      v30 = (void *)*MEMORY[0x1E0CB52F0];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52F0], OS_LOG_TYPE_DEFAULT))
        goto LABEL_25;
      v31 = v30;
      v32 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543618;
      v74 = v32;
      v75 = 2114;
      v76 = v11;
      v33 = v32;
      _os_log_impl(&dword_1CC29C000, v31, OS_LOG_TYPE_DEFAULT, "[%{public}@] Set onboarding completed in country %{public}@", buf, 0x16u);
    }
    else
    {
      _HKInitializeLogging();
      v38 = (void *)*MEMORY[0x1E0CB52F0];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52F0], OS_LOG_TYPE_ERROR))
      {
LABEL_25:
        v56 = v25;
        v39 = (void *)*MEMORY[0x1E0CB50C8];
        v69 = 0;
        objc_msgSend(v13, "numberForKey:error:", v39, &v69);
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = v69;
        if (v40)
        {
          _HKInitializeLogging();
          v41 = (void *)*MEMORY[0x1E0CB52F0];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52F0], OS_LOG_TYPE_ERROR))
          {
            v51 = v41;
            v52 = (void *)objc_opt_class();
            *(_DWORD *)buf = 138543874;
            v74 = v52;
            v75 = 2114;
            v76 = v39;
            v77 = 2114;
            v78 = v40;
            v53 = v52;
            _os_log_error_impl(&dword_1CC29C000, v51, OS_LOG_TYPE_ERROR, "[%{public}@] Error retrieving setting for key %{public}@: %{public}@", buf, 0x20u);

          }
        }
        v55 = v39;
        v42 = MEMORY[0x1E0C809B0];
        v65[0] = MEMORY[0x1E0C809B0];
        v65[1] = 3221225472;
        v65[2] = __162__HDHRIrregularRhythmNotificationsV1FeatureAvailabilityManager_setCurrentOnboardingVersionCompletedForCountryCode_countryCodeProvenance_date_settings_completion___block_invoke;
        v65[3] = &unk_1E87EF6A0;
        v65[4] = self;
        v67 = v14;
        v68 = v58;
        v26 = v60;
        v66 = v26;
        v43 = (void *)MEMORY[0x1D17A8B4C](v65);
        v44 = v43;
        if (v57)
        {
          v63[0] = v42;
          v63[1] = 3221225472;
          v63[2] = __162__HDHRIrregularRhythmNotificationsV1FeatureAvailabilityManager_setCurrentOnboardingVersionCompletedForCountryCode_countryCodeProvenance_date_settings_completion___block_invoke_3;
          v63[3] = &unk_1E87EF6C8;
          v45 = &v64;
          v63[4] = self;
          v64 = v43;
          v46 = v43;
          -[HDHRIrregularRhythmNotificationsV1FeatureAvailabilityManager setFeatureSettingNumber:forKey:completion:](self, "setFeatureSettingNumber:forKey:completion:", v57, v55, v63);
        }
        else
        {
          v61[0] = v42;
          v61[1] = 3221225472;
          v61[2] = __162__HDHRIrregularRhythmNotificationsV1FeatureAvailabilityManager_setCurrentOnboardingVersionCompletedForCountryCode_countryCodeProvenance_date_settings_completion___block_invoke_235;
          v61[3] = &unk_1E87EF6C8;
          v45 = &v62;
          v61[4] = self;
          v62 = v43;
          v47 = v43;
          -[HDHRIrregularRhythmNotificationsV1FeatureAvailabilityManager removeFeatureSettingValueForKey:completion:](self, "removeFeatureSettingValueForKey:completion:", v55, v61);
        }

        v25 = v56;
        goto LABEL_32;
      }
      v31 = v38;
      v54 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      v74 = v54;
      v75 = 2114;
      v76 = v11;
      v77 = 2114;
      v78 = v60;
      v33 = v54;
      _os_log_error_impl(&dword_1CC29C000, v31, OS_LOG_TYPE_ERROR, "[%{public}@] Error setting onboarding completed in country %{public}@: %{public}@", buf, 0x20u);
    }

    goto LABEL_25;
  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:", 3, CFSTR("A non-nil country code is required to onboard this feature"));
  v21 = (id)objc_claimAutoreleasedReturnValue();
  v14[2](v14, 0, v21);
LABEL_34:

}

void __162__HDHRIrregularRhythmNotificationsV1FeatureAvailabilityManager_setCurrentOnboardingVersionCompletedForCountryCode_countryCodeProvenance_date_settings_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  HDHRHealthKitSyncManager *v4;
  id WeakRetained;
  HDHRHealthKitSyncManager *v6;
  _QWORD v7[5];

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 40);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __162__HDHRIrregularRhythmNotificationsV1FeatureAvailabilityManager_setCurrentOnboardingVersionCompletedForCountryCode_countryCodeProvenance_date_settings_completion___block_invoke_2;
  v7[3] = &unk_1E87EF678;
  v7[4] = v2;
  objc_msgSend(v3, "notifyObservers:", v7);
  v4 = [HDHRHealthKitSyncManager alloc];
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  v6 = -[HDHRHealthKitSyncManager initWithProfile:](v4, "initWithProfile:", WeakRetained);

  -[HDHRHealthKitSyncManager triggerImmediateSyncWithReason:loggingCategory:](v6, "triggerImmediateSyncWithReason:loggingCategory:", CFSTR("IRN onboarding has been completed"), *MEMORY[0x1E0CB52F0]);
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

uint64_t __162__HDHRIrregularRhythmNotificationsV1FeatureAvailabilityManager_setCurrentOnboardingVersionCompletedForCountryCode_countryCodeProvenance_date_settings_completion___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "featureAvailabilityProvidingDidUpdateOnboardingCompletion:", *(_QWORD *)(a1 + 32));
}

void __162__HDHRIrregularRhythmNotificationsV1FeatureAvailabilityManager_setCurrentOnboardingVersionCompletedForCountryCode_countryCodeProvenance_date_settings_completion___block_invoke_3(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;

  v5 = a3;
  if ((a2 & 1) == 0)
  {
    _HKInitializeLogging();
    v6 = (void *)*MEMORY[0x1E0CB52F0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52F0], OS_LOG_TYPE_ERROR))
      __162__HDHRIrregularRhythmNotificationsV1FeatureAvailabilityManager_setCurrentOnboardingVersionCompletedForCountryCode_countryCodeProvenance_date_settings_completion___block_invoke_3_cold_1(a1, v6);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __162__HDHRIrregularRhythmNotificationsV1FeatureAvailabilityManager_setCurrentOnboardingVersionCompletedForCountryCode_countryCodeProvenance_date_settings_completion___block_invoke_235(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;

  v5 = a3;
  if ((a2 & 1) == 0)
  {
    _HKInitializeLogging();
    v6 = (void *)*MEMORY[0x1E0CB52F0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52F0], OS_LOG_TYPE_ERROR))
      __162__HDHRIrregularRhythmNotificationsV1FeatureAvailabilityManager_setCurrentOnboardingVersionCompletedForCountryCode_countryCodeProvenance_date_settings_completion___block_invoke_235_cold_1(a1, v6);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)saveOnboardingCompletion:(id)a3 settings:(id)a4 completion:(id)a5
{
  void (**v5)(id, _QWORD, void *);
  void *v6;
  void *v7;

  v5 = (void (**)(id, _QWORD, void *))a5;
  _HKInitializeLogging();
  v6 = (void *)*MEMORY[0x1E0CB52F0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52F0], OS_LOG_TYPE_ERROR))
    -[HDHRIrregularRhythmNotificationsV1FeatureAvailabilityManager saveOnboardingCompletion:settings:completion:].cold.1(v6);
  objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:", 3, CFSTR("Saving HKOnboardingCompletion is not supported for IRN 1.0"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v5[2](v5, 0, v7);

}

- (void)setFeatureSettingData:(id)a3 forKey:(id)a4 completion:(id)a5
{
  id v6;
  void (**v7)(id, _QWORD, void *);
  void *v8;

  v6 = a4;
  v7 = (void (**)(id, _QWORD, void *))a5;
  _HKInitializeLogging();
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52F0], OS_LOG_TYPE_ERROR))
    -[HDHRIrregularRhythmNotificationsV1FeatureAvailabilityManager setFeatureSettingData:forKey:completion:].cold.1();
  objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:", 3, CFSTR("Cannot set unknown data setting for IRN 1.0"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v7[2](v7, 0, v8);

}

- (void)setFeatureSettingString:(id)a3 forKey:(id)a4 completion:(id)a5
{
  id v6;
  void (**v7)(id, _QWORD, void *);
  void *v8;

  v6 = a4;
  v7 = (void (**)(id, _QWORD, void *))a5;
  _HKInitializeLogging();
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52F0], OS_LOG_TYPE_ERROR))
    -[HDHRIrregularRhythmNotificationsV1FeatureAvailabilityManager setFeatureSettingString:forKey:completion:].cold.1();
  objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:", 3, CFSTR("Cannot set unknown string setting for IRN 1.0"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v7[2](v7, 0, v8);

}

- (void)setFeatureSettingNumber:(id)a3 forKey:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  void (**v11)(id, uint64_t, _QWORD);
  NSUserDefaults *notificationSettingDefaults;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;

  v8 = a3;
  v9 = a4;
  v10 = *MEMORY[0x1E0CB50C8];
  v11 = (void (**)(id, uint64_t, _QWORD))a5;
  if (objc_msgSend(v9, "isEqual:", v10))
  {
    notificationSettingDefaults = self->_notificationSettingDefaults;
    v13 = objc_msgSend(v8, "BOOLValue");
    v14 = *MEMORY[0x1E0CB76D0];
    -[NSUserDefaults setBool:forKey:](notificationSettingDefaults, "setBool:forKey:", v13, *MEMORY[0x1E0CB76D0]);
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    HKSynchronizeNanoPreferencesUserDefaults();

    v11[2](v11, 1, 0);
  }
  else
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52F0], OS_LOG_TYPE_ERROR))
      -[HDHRIrregularRhythmNotificationsV1FeatureAvailabilityManager setFeatureSettingNumber:forKey:completion:].cold.1();
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:", 3, CFSTR("Cannot set number string setting for IRN 1.0"));
    v16 = objc_claimAutoreleasedReturnValue();
    v11[2](v11, 0, v16);

    v11 = (void (**)(id, uint64_t, _QWORD))v16;
  }

}

- (void)registerObserver:(id)a3 queue:(id)a4
{
  HKFeatureAvailabilityProvidingObserver *observers;
  _QWORD v5[5];

  observers = self->_observers;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __87__HDHRIrregularRhythmNotificationsV1FeatureAvailabilityManager_registerObserver_queue___block_invoke;
  v5[3] = &unk_1E87EF6F0;
  v5[4] = self;
  -[HKFeatureAvailabilityProvidingObserver registerObserver:queue:runIfFirstObserver:](observers, "registerObserver:queue:runIfFirstObserver:", a3, a4, v5);
}

uint64_t __87__HDHRIrregularRhythmNotificationsV1FeatureAvailabilityManager_registerObserver_queue___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "addObserver:forKeyPath:options:context:", *(_QWORD *)(a1 + 32), *MEMORY[0x1E0CB76D0], 1, HDHRIrregularRhythmNotificationsSettingObservingContext);
}

- (void)unregisterObserver:(id)a3
{
  HKFeatureAvailabilityProvidingObserver *observers;
  _QWORD v4[5];

  observers = self->_observers;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __83__HDHRIrregularRhythmNotificationsV1FeatureAvailabilityManager_unregisterObserver___block_invoke;
  v4[3] = &unk_1E87EF6F0;
  v4[4] = self;
  -[HKFeatureAvailabilityProvidingObserver unregisterObserver:runIfLastObserver:](observers, "unregisterObserver:runIfLastObserver:", a3, v4);
}

uint64_t __83__HDHRIrregularRhythmNotificationsV1FeatureAvailabilityManager_unregisterObserver___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "removeObserver:forKeyPath:context:", *(_QWORD *)(a1 + 32), *MEMORY[0x1E0CB76D0], HDHRIrregularRhythmNotificationsSettingObservingContext);
}

- (void)daemonReady:(id)a3
{
  void *v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "database");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addProtectedDataObserver:", self);

}

- (void)database:(id)a3 protectedDataDidBecomeAvailable:(BOOL)a4
{
  NSObject *v5;
  _BOOL4 v6;
  NSObject *v7;
  void *v8;
  void *v9;
  HKFeatureAvailabilityProvidingObserver *observers;
  id v11;
  void *v12;
  HKFeatureAvailabilityProvidingObserver *v13;
  _QWORD v14[5];
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (a4)
  {
    _HKInitializeLogging();
    HKLogInfrastructure();
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);

    if (v6)
    {
      HKLogInfrastructure();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        v8 = (void *)objc_opt_class();
        v9 = (void *)MEMORY[0x1E0CB37E8];
        observers = self->_observers;
        v11 = v8;
        objc_msgSend(v9, "numberWithUnsignedInteger:", -[HKFeatureAvailabilityProvidingObserver count](observers, "count"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v16 = v8;
        v17 = 2114;
        v18 = v12;
        _os_log_impl(&dword_1CC29C000, v7, OS_LOG_TYPE_INFO, "[%{public}@] Notifying %{public}@ observers for protected database becoming available", buf, 0x16u);

      }
    }
    v13 = self->_observers;
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __105__HDHRIrregularRhythmNotificationsV1FeatureAvailabilityManager_database_protectedDataDidBecomeAvailable___block_invoke;
    v14[3] = &unk_1E87EF678;
    v14[4] = self;
    -[HKFeatureAvailabilityProvidingObserver notifyObservers:](v13, "notifyObservers:", v14);
  }
}

void __105__HDHRIrregularRhythmNotificationsV1FeatureAvailabilityManager_database_protectedDataDidBecomeAvailable___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(v3, "conformsToProtocol:", &unk_1EF9CBA60))
    objc_msgSend(v3, "featureAvailabilityExtensionOnboardingCompletionDataDidBecomeAvailable:", *(_QWORD *)(a1 + 32));

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  _BOOL4 v14;
  NSObject *v15;
  void *v16;
  void *v17;
  HKFeatureAvailabilityProvidingObserver *observers;
  id v19;
  void *v20;
  HKFeatureAvailabilityProvidingObserver *v21;
  _QWORD v22[5];
  objc_super v23;
  objc_super v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  if ((void *)HDHRIrregularRhythmNotificationsSettingObservingContext == a6)
  {
    if (v10 && (objc_msgSend(v10, "isEqualToString:", *MEMORY[0x1E0CB76D0]) & 1) != 0)
    {
      _HKInitializeLogging();
      HKLogInfrastructure();
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = os_log_type_enabled(v13, OS_LOG_TYPE_INFO);

      if (v14)
      {
        HKLogInfrastructure();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          v16 = (void *)objc_opt_class();
          v17 = (void *)MEMORY[0x1E0CB37E8];
          observers = self->_observers;
          v19 = v16;
          objc_msgSend(v17, "numberWithUnsignedInteger:", -[HKFeatureAvailabilityProvidingObserver count](observers, "count"));
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v26 = v16;
          v27 = 2114;
          v28 = v20;
          v29 = 2114;
          v30 = v10;
          _os_log_impl(&dword_1CC29C000, v15, OS_LOG_TYPE_INFO, "[%{public}@] Notifying %{public}@ observers for change in setting %{public}@", buf, 0x20u);

        }
      }
      v21 = self->_observers;
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __111__HDHRIrregularRhythmNotificationsV1FeatureAvailabilityManager_observeValueForKeyPath_ofObject_change_context___block_invoke;
      v22[3] = &unk_1E87EF678;
      v22[4] = self;
      -[HKFeatureAvailabilityProvidingObserver notifyObservers:](v21, "notifyObservers:", v22);
    }
    else
    {
      v23.receiver = self;
      v23.super_class = (Class)HDHRIrregularRhythmNotificationsV1FeatureAvailabilityManager;
      -[HDHRIrregularRhythmNotificationsV1FeatureAvailabilityManager observeValueForKeyPath:ofObject:change:context:](&v23, sel_observeValueForKeyPath_ofObject_change_context_, v10, v11, v12, a6);
    }
  }
  else
  {
    v24.receiver = self;
    v24.super_class = (Class)HDHRIrregularRhythmNotificationsV1FeatureAvailabilityManager;
    -[HDHRIrregularRhythmNotificationsV1FeatureAvailabilityManager observeValueForKeyPath:ofObject:change:context:](&v24, sel_observeValueForKeyPath_ofObject_change_context_, v10, v11, v12, a6);
  }

}

void __111__HDHRIrregularRhythmNotificationsV1FeatureAvailabilityManager_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "featureAvailabilityProvidingDidUpdateSettings:", *(_QWORD *)(a1 + 32));

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_notificationSettingDefaults, 0);
  objc_storeStrong((id *)&self->_disableAndExpiryProvider, 0);
  objc_storeStrong((id *)&self->_pairedDeviceProvider, 0);
  objc_destroyWeak((id *)&self->_profile);
}

- (void)featureOnboardingRecordWithError:.cold.1()
{
  NSObject *v0;
  id v1;
  void *v2;
  id v3;
  uint8_t v4[24];

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_5(v1);
  v2 = (void *)OUTLINED_FUNCTION_3_0();
  v3 = OUTLINED_FUNCTION_0_0(v2);
  _os_log_debug_impl(&dword_1CC29C000, v0, OS_LOG_TYPE_DEBUG, "[%{public}@] No onboarding found in health database (error: %{public}@), but workaround is present", v4, 0x16u);

  OUTLINED_FUNCTION_2_0();
}

- (void)onboardedCountryCodeSupportedStateWithError:.cold.1()
{
  void *v0;
  id v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_5(v1);
  v2 = (void *)OUTLINED_FUNCTION_3_0();
  v3 = OUTLINED_FUNCTION_0_0(v2);
  OUTLINED_FUNCTION_1_0(&dword_1CC29C000, v4, v5, "[%{public}@] Error computing external rescinded status: %{public}@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_2_0();
}

- (void)onboardedCountryCodeSupportedStateWithError:(void *)a1 .cold.2(void *a1)
{
  void *v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_5(a1);
  v2 = (void *)OUTLINED_FUNCTION_9();
  v3 = OUTLINED_FUNCTION_7(v2);
  OUTLINED_FUNCTION_4(&dword_1CC29C000, v4, v5, "[%{public}@] Nil country code found with non-nil onboarding. Applying Workaround.", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_8();
}

- (void)onboardedCountryCodeSupportedStateWithError:.cold.3()
{
  void *v0;
  id v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_5(v1);
  v2 = (void *)OUTLINED_FUNCTION_3_0();
  v3 = OUTLINED_FUNCTION_0_0(v2);
  OUTLINED_FUNCTION_1_0(&dword_1CC29C000, v4, v5, "[%{public}@] Unable to read country code even though we're onboarded: %{public}@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_2_0();
}

- (void)onboardedCountryCodeSupportedStateWithError:(void *)a1 .cold.4(void *a1)
{
  void *v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_5(a1);
  v2 = (void *)OUTLINED_FUNCTION_9();
  v3 = OUTLINED_FUNCTION_7(v2);
  OUTLINED_FUNCTION_4(&dword_1CC29C000, v4, v5, "[%{public}@] Onboarding is unavailable while the health database is locked, but setting is present. Applying Workaround.", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_8();
}

- (void)onboardedCountryCodeSupportedStateWithError:(void *)a1 .cold.5(void *a1)
{
  void *v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_5(a1);
  v2 = (void *)OUTLINED_FUNCTION_9();
  v3 = OUTLINED_FUNCTION_7(v2);
  OUTLINED_FUNCTION_4(&dword_1CC29C000, v4, v5, "[%{public}@] No onboarding found in health database, but setting is present. Applying Workaround.", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_8();
}

- (void)onboardedCountryCodeSupportedStateWithError:.cold.6()
{
  void *v0;
  id v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_5(v1);
  v2 = (void *)OUTLINED_FUNCTION_3_0();
  v3 = OUTLINED_FUNCTION_0_0(v2);
  OUTLINED_FUNCTION_1_0(&dword_1CC29C000, v4, v5, "[%{public}@] Cannot read onboarding completion data: %{public}@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_2_0();
}

- (void)removeFeatureSettingValueForKey:completion:.cold.1()
{
  void *v0;
  id v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_5(v1);
  v2 = (void *)OUTLINED_FUNCTION_3_0();
  v3 = OUTLINED_FUNCTION_0_0(v2);
  OUTLINED_FUNCTION_1_0(&dword_1CC29C000, v4, v5, "[%{public}@]: Unknown setting for IRN 1.0: %{public}@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_2_0();
}

- (void)resetOnboardingWithCompletion:.cold.1()
{
  void *v0;
  id v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_5(v1);
  v2 = (void *)OUTLINED_FUNCTION_3_0();
  v3 = OUTLINED_FUNCTION_0_0(v2);
  OUTLINED_FUNCTION_1_0(&dword_1CC29C000, v4, v5, "[%{public}@] Error resetting onboarding: %{public}@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_2_0();
}

- (void)setCurrentOnboardingVersionCompletedForCountryCode:countryCodeProvenance:date:settings:completion:.cold.1()
{
  void *v0;
  id v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_5(v1);
  v2 = (void *)OUTLINED_FUNCTION_3_0();
  v3 = OUTLINED_FUNCTION_0_0(v2);
  OUTLINED_FUNCTION_1_0(&dword_1CC29C000, v4, v5, "[%{public}@] Error checking existing onboarding record prior to setting onboarding completed: %{public}@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_2_0();
}

- (void)setCurrentOnboardingVersionCompletedForCountryCode:countryCodeProvenance:date:settings:completion:.cold.2()
{
  void *v0;
  id v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_5(v1);
  v2 = (void *)OUTLINED_FUNCTION_3_0();
  v3 = OUTLINED_FUNCTION_0_0(v2);
  OUTLINED_FUNCTION_1_0(&dword_1CC29C000, v4, v5, "[%{public}@] Error setting onboarding completed: IRN is already onboarded for %{public}@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_2_0();
}

void __162__HDHRIrregularRhythmNotificationsV1FeatureAvailabilityManager_setCurrentOnboardingVersionCompletedForCountryCode_countryCodeProvenance_date_settings_completion___block_invoke_3_cold_1(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  OUTLINED_FUNCTION_13(a1, a2);
  v3 = (void *)OUTLINED_FUNCTION_3_0();
  v4 = OUTLINED_FUNCTION_10(v3);
  OUTLINED_FUNCTION_11(&dword_1CC29C000, v5, v6, "[%{public}@] Error setting value for key %{public}@: %{public}@", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_12();
}

void __162__HDHRIrregularRhythmNotificationsV1FeatureAvailabilityManager_setCurrentOnboardingVersionCompletedForCountryCode_countryCodeProvenance_date_settings_completion___block_invoke_235_cold_1(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  OUTLINED_FUNCTION_13(a1, a2);
  v3 = (void *)OUTLINED_FUNCTION_3_0();
  v4 = OUTLINED_FUNCTION_10(v3);
  OUTLINED_FUNCTION_11(&dword_1CC29C000, v5, v6, "[%{public}@] Error removing value for key %{public}@: %{public}@", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_12();
}

- (void)saveOnboardingCompletion:(void *)a1 settings:completion:.cold.1(void *a1)
{
  void *v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_5(a1);
  v2 = (void *)OUTLINED_FUNCTION_9();
  v3 = OUTLINED_FUNCTION_7(v2);
  OUTLINED_FUNCTION_4(&dword_1CC29C000, v4, v5, "[%{public}@] Saving HKOnboardingCompletion is not supported for IRN 1.0", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_8();
}

- (void)setFeatureSettingData:forKey:completion:.cold.1()
{
  void *v0;
  id v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_5(v1);
  v2 = (void *)OUTLINED_FUNCTION_3_0();
  v3 = OUTLINED_FUNCTION_0_0(v2);
  OUTLINED_FUNCTION_1_0(&dword_1CC29C000, v4, v5, "[%{public}@]: Unknown data setting for IRN 1.0: %{public}@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_2_0();
}

- (void)setFeatureSettingString:forKey:completion:.cold.1()
{
  void *v0;
  id v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_5(v1);
  v2 = (void *)OUTLINED_FUNCTION_3_0();
  v3 = OUTLINED_FUNCTION_0_0(v2);
  OUTLINED_FUNCTION_1_0(&dword_1CC29C000, v4, v5, "[%{public}@]: Unknown string setting for IRN 1.0: %{public}@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_2_0();
}

- (void)setFeatureSettingNumber:forKey:completion:.cold.1()
{
  void *v0;
  id v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_5(v1);
  v2 = (void *)OUTLINED_FUNCTION_3_0();
  v3 = OUTLINED_FUNCTION_0_0(v2);
  OUTLINED_FUNCTION_1_0(&dword_1CC29C000, v4, v5, "[%{public}@]: Unknown number setting for IRN 1.0: %{public}@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_2_0();
}

@end
