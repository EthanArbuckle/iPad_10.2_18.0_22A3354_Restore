@implementation HDHRHeartRateNotificationsFeatureAvailabilityManager

- (HDHRHeartRateNotificationsFeatureAvailabilityManager)initWithFeatureIdentifier:(id)a3 notificationSettingsDefaults:(id)a4 pairedDeviceCapabilityProvider:(id)a5
{
  id v10;
  id v11;
  id v12;
  HDHRHeartRateNotificationsFeatureAvailabilityManager *v13;
  HDHRHeartRateNotificationsFeatureAvailabilityManager *v14;
  id v15;
  void *v16;
  uint64_t v17;
  HKObserverSet *observers;
  void *v20;
  objc_super v21;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if ((objc_msgSend(v10, "isEqualToString:", *MEMORY[0x1E0CB5058]) & 1) == 0
    && (objc_msgSend(v10, "isEqualToString:", *MEMORY[0x1E0CB5030]) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDHRHeartRateNotificationsFeatureAvailabilityManager.m"), 92, CFSTR("Unsupported feature identifier %@"), v10);

  }
  v21.receiver = self;
  v21.super_class = (Class)HDHRHeartRateNotificationsFeatureAvailabilityManager;
  v13 = -[HDHRHeartRateNotificationsFeatureAvailabilityManager init](&v21, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_featureIdentifier, a3);
    objc_storeStrong((id *)&v14->_notificationSettingsDefaults, a4);
    objc_storeStrong((id *)&v14->_pairedDeviceCapabilityProvider, a5);
    v15 = objc_alloc(MEMORY[0x1E0CB6988]);
    -[HDHRHeartRateNotificationsFeatureAvailabilityManager description](v14, "description");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "initWithName:loggingCategory:", v16, *MEMORY[0x1E0CB52E8]);
    observers = v14->_observers;
    v14->_observers = (HKObserverSet *)v17;

  }
  return v14;
}

- (id)_featureEnabledDefaultsKey
{
  id *v4;
  __CFString *v5;
  void *v6;

  if (-[NSString isEqualToString:](self->_featureIdentifier, "isEqualToString:", *MEMORY[0x1E0CB5058]))
  {
    v4 = (id *)MEMORY[0x1E0CB76D8];
  }
  else
  {
    if (!-[NSString isEqualToString:](self->_featureIdentifier, "isEqualToString:", *MEMORY[0x1E0CB5030]))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDHRHeartRateNotificationsFeatureAvailabilityManager.m"), 112, CFSTR("Unsupported feature identifier %@"), self->_featureIdentifier);

      v5 = &stru_1E87F0B08;
      return v5;
    }
    v4 = (id *)MEMORY[0x1E0CB76E8];
  }
  v5 = (__CFString *)*v4;
  return v5;
}

- (id)_thresholdDefaultsKey
{
  id *v4;
  __CFString *v5;
  void *v6;

  if (-[NSString isEqualToString:](self->_featureIdentifier, "isEqualToString:", *MEMORY[0x1E0CB5058]))
  {
    v4 = (id *)MEMORY[0x1E0CB76C8];
  }
  else
  {
    if (!-[NSString isEqualToString:](self->_featureIdentifier, "isEqualToString:", *MEMORY[0x1E0CB5030]))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDHRHeartRateNotificationsFeatureAvailabilityManager.m"), 123, CFSTR("Unsupported feature identifier %@"), self->_featureIdentifier);

      v5 = &stru_1E87F0B08;
      return v5;
    }
    v4 = (id *)MEMORY[0x1E0CB76F0];
  }
  v5 = (__CFString *)*v4;
  return v5;
}

- (int64_t)_defaultHeartRateThreshold
{
  int64_t *v4;
  void *v6;

  if (-[NSString isEqualToString:](self->_featureIdentifier, "isEqualToString:", *MEMORY[0x1E0CB5058]))
  {
    v4 = (int64_t *)MEMORY[0x1E0D2FC30];
    return *v4;
  }
  if (-[NSString isEqualToString:](self->_featureIdentifier, "isEqualToString:", *MEMORY[0x1E0CB5030]))
  {
    v4 = (int64_t *)MEMORY[0x1E0D2FC38];
    return *v4;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDHRHeartRateNotificationsFeatureAvailabilityManager.m"), 134, CFSTR("Unsupported feature identifier %@"), self->_featureIdentifier);

  return -1;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@:%@"), objc_opt_class(), self->_featureIdentifier);
}

- (id)earliestDateLowestOnboardingVersionCompletedWithError:(id *)a3
{
  void *v3;

  if (-[HDHRHeartRateNotificationsFeatureAvailabilityManager _isOnboardingRecordPresent](self, "_isOnboardingRecordPresent", a3))
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", 0.0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (id)featureOnboardingRecordWithError:(id *)a3
{
  void *v5;
  id v6;
  NSString *featureIdentifier;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;

  if (-[HDHRHeartRateNotificationsFeatureAvailabilityManager _isOnboardingRecordPresent](self, "_isOnboardingRecordPresent"))
  {
    -[HDHRHeartRateNotificationsFeatureAvailabilityManager onboardingEligibilityForCountryCode:error:](self, "onboardingEligibilityForCountryCode:error:", 0, a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = objc_alloc(MEMORY[0x1E0CB6990]);
      featureIdentifier = self->_featureIdentifier;
      objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", 0.0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)objc_msgSend(v6, "initWithFeatureIdentifier:version:completionDate:countryCode:countryCodeProvenance:", featureIdentifier, 1, v8, 0, 0);

      v10 = objc_alloc(MEMORY[0x1E0CB6718]);
      v11 = objc_msgSend(v5, "onboardedCountrySupportedState");
      -[HDHRHeartRateNotificationsFeatureAvailabilityManager _featureSettings](self, "_featureSettings");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)objc_msgSend(v10, "initWithOnboardingState:onboardingCompletion:featureSettings:", v11, v9, v12);

    }
    else
    {
      v13 = 0;
    }

  }
  else
  {
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB6718]), "initWithOnboardingState:onboardingCompletion:featureSettings:", 1, 0, 0);
  }
  return v13;
}

- (void)getFeatureOnboardingRecordWithCompletion:(id)a3
{
  void (**v4)(id, void *, id);
  void *v5;
  id v6;
  id v7;

  v7 = 0;
  v4 = (void (**)(id, void *, id))a3;
  -[HDHRHeartRateNotificationsFeatureAvailabilityManager featureOnboardingRecordWithError:](self, "featureOnboardingRecordWithError:", &v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v7;
  v4[2](v4, v5, v6);

}

- (id)_featureSettings
{
  NSUserDefaults *notificationSettingsDefaults;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  NSUserDefaults *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  if (-[HDHRHeartRateNotificationsFeatureAvailabilityManager _isOnboardingRecordPresent](self, "_isOnboardingRecordPresent"))
  {
    notificationSettingsDefaults = self->_notificationSettingsDefaults;
    -[HDHRHeartRateNotificationsFeatureAvailabilityManager _featureEnabledDefaultsKey](self, "_featureEnabledDefaultsKey");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSUserDefaults objectForKey:](notificationSettingsDefaults, "objectForKey:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      v6 = objc_msgSend(v5, "BOOLValue");
    else
      v6 = 0;
    v9 = self->_notificationSettingsDefaults;
    -[HDHRHeartRateNotificationsFeatureAvailabilityManager _thresholdDefaultsKey](self, "_thresholdDefaultsKey");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSUserDefaults objectForKey:](v9, "objectForKey:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v12 = v11;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[HDHRHeartRateNotificationsFeatureAvailabilityManager _defaultHeartRateThreshold](self, "_defaultHeartRateThreshold"));
      v12 = (id)objc_claimAutoreleasedReturnValue();
    }
    v13 = v12;
    v14 = (void *)MEMORY[0x1E0C99E08];
    v19 = *MEMORY[0x1E0CB50C8];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v6);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = v15;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "dictionaryWithDictionary:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if ((_DWORD)v6)
      objc_msgSend(v17, "setObject:forKeyedSubscript:", v13, *MEMORY[0x1E0CB50D0]);
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB6720]), "initWithDictionary:", v17);

    return v18;
  }
  else
  {
    v7 = objc_alloc(MEMORY[0x1E0CB6720]);
    return (id)objc_msgSend(v7, "initWithDictionary:", MEMORY[0x1E0C9AA70]);
  }
}

- (BOOL)_isOnboardingRecordPresent
{
  NSUserDefaults *notificationSettingsDefaults;
  void *v3;
  void *v4;

  notificationSettingsDefaults = self->_notificationSettingsDefaults;
  -[HDHRHeartRateNotificationsFeatureAvailabilityManager _featureEnabledDefaultsKey](self, "_featureEnabledDefaultsKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSUserDefaults objectForKey:](notificationSettingsDefaults, "objectForKey:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(notificationSettingsDefaults) = v4 != 0;

  return (char)notificationSettingsDefaults;
}

- (id)onboardingEligibilityForCountryCode:(id)a3 error:(id *)a4
{
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;

  objc_msgSend(MEMORY[0x1E0CB6F18], "sharedBehavior", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isAppleWatch");

  if (v7)
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB66D0]), "initWithIneligibilityReasons:countryAvailabilityVersion:", 0, CFSTR("unchecked"));
  }
  else
  {
    -[HDHRHeartRateNotificationsFeatureAvailabilityManager _activeRemoteDeviceSupportsHeartRateNotificationsWithError:](self, "_activeRemoteDeviceSupportsHeartRateNotificationsWithError:", a4);
    v9 = objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      v12 = 0;
      return v12;
    }
    v10 = (void *)v9;
    if (-[HDHRHeartRateNotificationsFeatureAvailabilityManager _isActiveRemoteDevicePresent](self, "_isActiveRemoteDevicePresent"))
    {
      v11 = 0;
    }
    else
    {
      v11 = 2;
    }
    if (!objc_msgSend(v10, "BOOLValue"))
      v11 |= 4uLL;
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB66D0]), "initWithIneligibilityReasons:countryAvailabilityVersion:", v11, CFSTR("unchecked"));

  }
  objc_msgSend(v8, "eligibilityRespectingOverridesForFeatureIdentifier:", self->_featureIdentifier);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (BOOL)_isActiveRemoteDevicePresent
{
  void *v2;
  BOOL v3;

  -[HDPairedDeviceCapabilityProviding activePairedDevice](self->_pairedDeviceCapabilityProvider, "activePairedDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (id)_activeRemoteDeviceSupportsHeartRateNotificationsWithError:(id *)a3
{
  HDPairedDeviceCapabilityProviding *pairedDeviceCapabilityProvider;
  void *v5;
  void *v6;

  pairedDeviceCapabilityProvider = self->_pairedDeviceCapabilityProvider;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", CFSTR("E17D2903-B868-4E6C-8E76-6D4939BEED44"));
  -[HDPairedDeviceCapabilityProviding isCapabilitySupportedOnActivePairedDevice:error:](pairedDeviceCapabilityProvider, "isCapabilitySupportedOnActivePairedDevice:error:", v5, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)regionAvailabilityWithError:(id *)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB6AC8], "uncheckedAvailability", a3);
}

- (id)pairedFeatureAttributesWithError:(id *)a3
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB66B0], "featureAttributesDerivedFromOSBuildAndFeatureVersion:", CFSTR("1"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB69D0]), "initWithLocalAttributes:pairedAttributes:", v3, 0);

  return v4;
}

- (id)featureAvailabilityRequirementsWithError:(id *)a3
{
  objc_class *v3;
  NSString *v4;
  uint64_t v5;
  uint64_t v6;
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
  id v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  _QWORD v31[2];
  _QWORD v32[7];
  void *v33;
  _QWORD v34[6];
  _QWORD v35[4];
  _QWORD v36[6];

  v36[4] = *MEMORY[0x1E0C80C00];
  v3 = (objc_class *)MEMORY[0x1E0CB66F0];
  v4 = self->_featureIdentifier;
  v23 = [v3 alloc];
  v35[0] = *MEMORY[0x1E0CB4E88];
  objc_msgSend(MEMORY[0x1E0CB66F8], "activeRemoteDeviceIsPresentWhenRequiredForRegionAvailabilityOrDeviceCapabilityForFeatureWithIdentifier:", v4);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v34[0] = v30;
  objc_msgSend(MEMORY[0x1E0CB66F8], "capabilityIsSupportedOnActiveWatchForFeatureWithIdentifier:supportedOnLocalDevice:", v4, 1);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v34[1] = v29;
  v5 = *MEMORY[0x1E0CB51F8];
  objc_msgSend(MEMORY[0x1E0CB66F8], "notAgeGatedForUserDefaultsKey:", *MEMORY[0x1E0CB51F8]);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v34[2] = v28;
  objc_msgSend(MEMORY[0x1E0CB66F8], "heartRateIsEnabledInPrivacy");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v34[3] = v27;
  objc_msgSend(MEMORY[0x1E0CB66F8], "wristDetectionIsEnabledForActiveWatch");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v34[4] = v26;
  v6 = *MEMORY[0x1E0D2FB50];
  objc_msgSend(MEMORY[0x1E0CB66F8], "watchAppIsInstalledForBundleIdentifier:", *MEMORY[0x1E0D2FB50]);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v34[5] = v25;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 6);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v36[0] = v22;
  v35[1] = *MEMORY[0x1E0CB4EA8];
  objc_msgSend(MEMORY[0x1E0CB66F8], "watchAppIsInstalledForBundleIdentifier:", v6);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = v21;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v33, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v36[1] = v20;
  v35[2] = *MEMORY[0x1E0CB4ED0];
  objc_msgSend(MEMORY[0x1E0CB66F8], "activeRemoteDeviceIsPresentWhenRequiredForRegionAvailabilityOrDeviceCapabilityForFeatureWithIdentifier:", v4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = v19;
  objc_msgSend(MEMORY[0x1E0CB66F8], "capabilityIsSupportedOnActiveWatchForFeatureWithIdentifier:supportedOnLocalDevice:", v4, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v32[1] = v18;
  objc_msgSend(MEMORY[0x1E0CB66F8], "notAgeGatedForUserDefaultsKey:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v32[2] = v7;
  objc_msgSend(MEMORY[0x1E0CB66F8], "heartRateIsEnabledInPrivacy");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v32[3] = v8;
  objc_msgSend(MEMORY[0x1E0CB66F8], "wristDetectionIsEnabledForActiveWatch");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v32[4] = v9;
  objc_msgSend(MEMORY[0x1E0CB66F8], "featureIsOnWithIdentifier:isOnIfSettingIsAbsent:", v4, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v32[5] = v10;
  objc_msgSend(MEMORY[0x1E0CB66F8], "watchAppIsInstalledForBundleIdentifier:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v32[6] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v36[2] = v12;
  v35[3] = *MEMORY[0x1E0CB4E68];
  objc_msgSend(MEMORY[0x1E0CB66F8], "isNotInPostPregnancy");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = v13;
  objc_msgSend(MEMORY[0x1E0CB66F8], "noOngoingPregnancy");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v31[1] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v36[3] = v15;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v36, v35, 4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (id)objc_msgSend(v23, "initWithRequirementsByContext:", v16);

  return v24;
}

- (void)saveOnboardingCompletion:(id)a3 settings:(id)a4 completion:(id)a5
{
  id v9;
  void (**v10)(id, _QWORD, id);
  void *v11;
  void *v12;
  id v13;
  char v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  uint8_t buf[4];
  HDHRHeartRateNotificationsFeatureAvailabilityManager *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v9 = a4;
  v10 = (void (**)(id, _QWORD, id))a5;
  objc_msgSend(a3, "countryCode");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0;
  -[HDHRHeartRateNotificationsFeatureAvailabilityManager onboardingEligibilityForCountryCode:error:](self, "onboardingEligibilityForCountryCode:error:", v11, &v23);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v23;

  if (!v12)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52E8], OS_LOG_TYPE_ERROR))
    {
      -[HDHRHeartRateNotificationsFeatureAvailabilityManager saveOnboardingCompletion:settings:completion:].cold.1();
      if (v13)
        goto LABEL_8;
    }
    else if (v13)
    {
LABEL_8:
      v10[2](v10, 0, v13);
      goto LABEL_14;
    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:format:", 100, CFSTR("Unexpected failure when evaluating eligibility"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v10[2](v10, 0, v22);

    goto LABEL_14;
  }
  v14 = objc_msgSend(v12, "isEligible");
  _HKInitializeLogging();
  v15 = *MEMORY[0x1E0CB52E8];
  v16 = *MEMORY[0x1E0CB52E8];
  if ((v14 & 1) != 0)
  {
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v25 = self;
      _os_log_impl(&dword_1CC29C000, v15, OS_LOG_TYPE_DEFAULT, "[%{public}@] Saving onboarding record", buf, 0xCu);
    }
    objc_msgSend(v9, "numberForKey:", *MEMORY[0x1E0CB50D0]);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDHRHeartRateNotificationsFeatureAvailabilityManager _setFeatureEnabled:preferredThreshold:](self, "_setFeatureEnabled:preferredThreshold:", MEMORY[0x1E0C9AAB0], v17);
    v10[2](v10, 1, 0);

  }
  else
  {
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[HDHRHeartRateNotificationsFeatureAvailabilityManager saveOnboardingCompletion:settings:completion:].cold.2((uint64_t)self, v15, v12);
    v18 = (void *)MEMORY[0x1E0CB35C8];
    v19 = objc_opt_class();
    objc_msgSend(v12, "ineligibilityReasonsDescription");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "hk_errorForInvalidArgument:class:selector:format:", CFSTR("@\"\"), v19, a2, CFSTR("Cannot complete onboarding: %@"), v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v10[2](v10, 0, v21);

  }
LABEL_14:

}

- (void)setCurrentOnboardingVersionCompletedForCountryCode:(id)a3 countryCodeProvenance:(int64_t)a4 date:(id)a5 settings:(id)a6 completion:(id)a7
{
  id v12;
  objc_class *v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  NSString *featureIdentifier;
  void *v19;
  void *v20;
  id v21;

  v21 = a3;
  v12 = a5;
  v13 = (objc_class *)MEMORY[0x1E0CB6990];
  v14 = a7;
  v15 = a6;
  v16 = [v13 alloc];
  v17 = v16;
  featureIdentifier = self->_featureIdentifier;
  if (v12)
  {
    v19 = (void *)objc_msgSend(v16, "initWithFeatureIdentifier:version:completionDate:countryCode:countryCodeProvenance:", self->_featureIdentifier, 1, v12, v21, a4);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend(v17, "initWithFeatureIdentifier:version:completionDate:countryCode:countryCodeProvenance:", featureIdentifier, 1, v20, v21, a4);

  }
  -[HDHRHeartRateNotificationsFeatureAvailabilityManager saveOnboardingCompletion:settings:completion:](self, "saveOnboardingCompletion:settings:completion:", v19, v15, v14);

}

- (void)resetOnboardingWithCompletion:(id)a3
{
  void (**v4)(id, uint64_t, _QWORD);
  NSObject *v5;
  int v6;
  HDHRHeartRateNotificationsFeatureAvailabilityManager *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, uint64_t, _QWORD))a3;
  _HKInitializeLogging();
  v5 = *MEMORY[0x1E0CB52E8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52E8], OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138543362;
    v7 = self;
    _os_log_impl(&dword_1CC29C000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] Resetting onboarding", (uint8_t *)&v6, 0xCu);
  }
  -[HDHRHeartRateNotificationsFeatureAvailabilityManager _setFeatureEnabled:preferredThreshold:](self, "_setFeatureEnabled:preferredThreshold:", 0, 0);
  v4[2](v4, 1, 0);

}

- (void)setFeatureSettingNumber:(id)a3 forKey:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, uint64_t, _QWORD);
  NSUserDefaults *notificationSettingsDefaults;
  void *v12;
  void *v13;
  void *v14;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, uint64_t, _QWORD))a5;
  if (objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0CB50C8]))
  {
    notificationSettingsDefaults = self->_notificationSettingsDefaults;
    -[HDHRHeartRateNotificationsFeatureAvailabilityManager _thresholdDefaultsKey](self, "_thresholdDefaultsKey");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSUserDefaults objectForKey:](notificationSettingsDefaults, "objectForKey:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDHRHeartRateNotificationsFeatureAvailabilityManager _setFeatureEnabled:preferredThreshold:](self, "_setFeatureEnabled:preferredThreshold:", v8, v13);

LABEL_5:
    v10[2](v10, 1, 0);
    goto LABEL_9;
  }
  if (objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0CB50D0]))
  {
    -[HDHRHeartRateNotificationsFeatureAvailabilityManager _setFeatureEnabled:preferredThreshold:](self, "_setFeatureEnabled:preferredThreshold:", MEMORY[0x1E0C9AAB0], v8);
    goto LABEL_5;
  }
  _HKInitializeLogging();
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52E8], OS_LOG_TYPE_ERROR))
    -[HDHRHeartRateNotificationsFeatureAvailabilityManager setFeatureSettingNumber:forKey:completion:].cold.1();
  objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:format:", 3, CFSTR("Unsupported feature setting %@"), v9);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(id, uint64_t, void *))v10)[2](v10, 0, v14);

LABEL_9:
}

- (void)setFeatureSettingData:(id)a3 forKey:(id)a4 completion:(id)a5
{
  void (**v6)(id, _QWORD, void *);
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;

  v6 = (void (**)(id, _QWORD, void *))a5;
  _HKInitializeLogging();
  v7 = *MEMORY[0x1E0CB52E8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52E8], OS_LOG_TYPE_ERROR))
    -[HDHRHeartRateNotificationsFeatureAvailabilityManager setFeatureSettingData:forKey:completion:].cold.1((uint64_t)self, v7, v8, v9, v10, v11, v12, v13);
  objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:format:", 3, CFSTR("setFeatureSettingData: is not supported"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v6[2](v6, 0, v14);

}

- (void)setFeatureSettingString:(id)a3 forKey:(id)a4 completion:(id)a5
{
  void (**v6)(id, _QWORD, void *);
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;

  v6 = (void (**)(id, _QWORD, void *))a5;
  _HKInitializeLogging();
  v7 = *MEMORY[0x1E0CB52E8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52E8], OS_LOG_TYPE_ERROR))
    -[HDHRHeartRateNotificationsFeatureAvailabilityManager setFeatureSettingString:forKey:completion:].cold.1((uint64_t)self, v7, v8, v9, v10, v11, v12, v13);
  objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:format:", 3, CFSTR("setFeatureSettingString: is not supported"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v6[2](v6, 0, v14);

}

- (void)removeFeatureSettingValueForKey:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, uint64_t, _QWORD);
  NSUserDefaults *notificationSettingsDefaults;
  void *v9;
  void *v10;

  v6 = a3;
  v7 = (void (**)(id, uint64_t, _QWORD))a4;
  if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0CB50C8]))
  {
    -[HDHRHeartRateNotificationsFeatureAvailabilityManager resetOnboardingWithCompletion:](self, "resetOnboardingWithCompletion:", v7);
  }
  else if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0CB50D0]))
  {
    notificationSettingsDefaults = self->_notificationSettingsDefaults;
    -[HDHRHeartRateNotificationsFeatureAvailabilityManager _thresholdDefaultsKey](self, "_thresholdDefaultsKey");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSUserDefaults removeObjectForKey:](notificationSettingsDefaults, "removeObjectForKey:", v9);

    v7[2](v7, 1, 0);
  }
  else
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52E8], OS_LOG_TYPE_ERROR))
      -[HDHRHeartRateNotificationsFeatureAvailabilityManager setFeatureSettingNumber:forKey:completion:].cold.1();
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:format:", 3, CFSTR("Unsupported feature setting %@"), v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, uint64_t, void *))v7)[2](v7, 0, v10);

  }
}

- (void)_setFeatureEnabled:(id)a3 preferredThreshold:(id)a4
{
  id v6;
  NSUserDefaults *notificationSettingsDefaults;
  void *v8;
  id v9;
  void *v10;
  char v11;
  NSUserDefaults *v12;
  void *v13;
  int v14;
  NSUserDefaults *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;

  v21 = a3;
  v6 = a4;
  notificationSettingsDefaults = self->_notificationSettingsDefaults;
  -[HDHRHeartRateNotificationsFeatureAvailabilityManager _featureEnabledDefaultsKey](self, "_featureEnabledDefaultsKey");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSUserDefaults objectForKey:](notificationSettingsDefaults, "objectForKey:", v8);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  v10 = v21;
  if (v9 != v21)
  {
    if (!v9 || (v11 = objc_msgSend(v21, "isEqual:", v9), v10 = v21, (v11 & 1) == 0))
    {
      v12 = self->_notificationSettingsDefaults;
      -[HDHRHeartRateNotificationsFeatureAvailabilityManager _featureEnabledDefaultsKey](self, "_featureEnabledDefaultsKey");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSUserDefaults setObject:forKey:](v12, "setObject:forKey:", v21, v13);

      v10 = v21;
    }
  }
  v14 = objc_msgSend(v10, "BOOLValue");
  if (!v6 && v14)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[HDHRHeartRateNotificationsFeatureAvailabilityManager _defaultHeartRateThreshold](self, "_defaultHeartRateThreshold"));
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v15 = self->_notificationSettingsDefaults;
  -[HDHRHeartRateNotificationsFeatureAvailabilityManager _thresholdDefaultsKey](self, "_thresholdDefaultsKey");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSUserDefaults setObject:forKey:](v15, "setObject:forKey:", v6, v16);

  v17 = (void *)MEMORY[0x1E0C99E60];
  -[HDHRHeartRateNotificationsFeatureAvailabilityManager _featureEnabledDefaultsKey](self, "_featureEnabledDefaultsKey");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDHRHeartRateNotificationsFeatureAvailabilityManager _thresholdDefaultsKey](self, "_thresholdDefaultsKey");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setWithObjects:", v18, v19, 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  HKSynchronizeNanoPreferencesUserDefaults();

  if (objc_msgSend(v21, "BOOLValue"))
    HKHRSubmitNotificationsEnabledSignal();

}

- (void)registerObserver:(id)a3 queue:(id)a4
{
  HKObserverSet *observers;
  _QWORD v5[5];

  observers = self->_observers;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __79__HDHRHeartRateNotificationsFeatureAvailabilityManager_registerObserver_queue___block_invoke;
  v5[3] = &unk_1E87EF6F0;
  v5[4] = self;
  -[HKObserverSet registerObserver:queue:runIfFirstObserver:](observers, "registerObserver:queue:runIfFirstObserver:", a3, a4, v5);
}

void __79__HDHRHeartRateNotificationsFeatureAvailabilityManager_registerObserver_queue___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  void *v3;
  void *v4;
  _QWORD *v5;
  void *v6;
  id v7;

  v2 = *(_QWORD **)(a1 + 32);
  v3 = (void *)v2[1];
  objc_msgSend(v2, "_featureEnabledDefaultsKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:forKeyPath:options:context:", v2, v4, 1, _HDHRHeartRateNotificationsSettingObservingContext);

  v5 = *(_QWORD **)(a1 + 32);
  v6 = (void *)v5[1];
  objc_msgSend(v5, "_thresholdDefaultsKey");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObserver:forKeyPath:options:context:", v5, v7, 1, _HDHRHeartRateNotificationsSettingObservingContext);

}

- (void)unregisterObserver:(id)a3
{
  HKObserverSet *observers;
  _QWORD v4[5];

  observers = self->_observers;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __75__HDHRHeartRateNotificationsFeatureAvailabilityManager_unregisterObserver___block_invoke;
  v4[3] = &unk_1E87EF6F0;
  v4[4] = self;
  -[HKObserverSet unregisterObserver:runIfLastObserver:](observers, "unregisterObserver:runIfLastObserver:", a3, v4);
}

void __75__HDHRHeartRateNotificationsFeatureAvailabilityManager_unregisterObserver___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  void *v3;
  void *v4;
  _QWORD *v5;
  void *v6;
  id v7;

  v2 = *(_QWORD **)(a1 + 32);
  v3 = (void *)v2[1];
  objc_msgSend(v2, "_featureEnabledDefaultsKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:forKeyPath:context:", v2, v4, _HDHRHeartRateNotificationsSettingObservingContext);

  v5 = *(_QWORD **)(a1 + 32);
  v6 = (void *)v5[1];
  objc_msgSend(v5, "_thresholdDefaultsKey");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObserver:forKeyPath:context:", v5, v7, _HDHRHeartRateNotificationsSettingObservingContext);

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  int v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  HKObserverSet *observers;
  id v20;
  void *v21;
  HKObserverSet *v22;
  _QWORD *v23;
  void *v24;
  int v25;
  void *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  HKObserverSet *v30;
  id v31;
  void *v32;
  objc_super v33;
  _QWORD v34[5];
  _QWORD v35[5];
  objc_super v36;
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  id v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  if ((void *)_HDHRHeartRateNotificationsSettingObservingContext != a6)
  {
    v36.receiver = self;
    v36.super_class = (Class)HDHRHeartRateNotificationsFeatureAvailabilityManager;
    -[HDHRHeartRateNotificationsFeatureAvailabilityManager observeValueForKeyPath:ofObject:change:context:](&v36, sel_observeValueForKeyPath_ofObject_change_context_, v10, v11, v12, a6, v33.receiver, v33.super_class);
    goto LABEL_13;
  }
  -[HDHRHeartRateNotificationsFeatureAvailabilityManager _featureEnabledDefaultsKey](self, "_featureEnabledDefaultsKey");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v10, "isEqualToString:", v13);

  if (v14)
  {
    _HKInitializeLogging();
    v15 = (void *)*MEMORY[0x1E0CB52E8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52E8], OS_LOG_TYPE_DEFAULT))
    {
      v16 = v15;
      v17 = (void *)objc_opt_class();
      v18 = (void *)MEMORY[0x1E0CB37E8];
      observers = self->_observers;
      v20 = v17;
      objc_msgSend(v18, "numberWithUnsignedInteger:", -[HKObserverSet count](observers, "count"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v38 = v17;
      v39 = 2114;
      v40 = v21;
      v41 = 2114;
      v42 = v10;
      _os_log_impl(&dword_1CC29C000, v16, OS_LOG_TYPE_DEFAULT, "[%{public}@] Notifying %{public}@ observers for change in setting %{public}@", buf, 0x20u);

    }
    v22 = self->_observers;
    v35[0] = MEMORY[0x1E0C809B0];
    v35[1] = 3221225472;
    v35[2] = __103__HDHRHeartRateNotificationsFeatureAvailabilityManager_observeValueForKeyPath_ofObject_change_context___block_invoke;
    v35[3] = &unk_1E87EF678;
    v35[4] = self;
    v23 = v35;
  }
  else
  {
    -[HDHRHeartRateNotificationsFeatureAvailabilityManager _thresholdDefaultsKey](self, "_thresholdDefaultsKey");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v10, "isEqualToString:", v24);

    if (!v25)
    {
      -[HDHRHeartRateNotificationsFeatureAvailabilityManager observeValueForKeyPath:ofObject:change:context:](&v33, sel_observeValueForKeyPath_ofObject_change_context_, v10, v11, v12, a6, self, HDHRHeartRateNotificationsFeatureAvailabilityManager);
      goto LABEL_13;
    }
    _HKInitializeLogging();
    v26 = (void *)*MEMORY[0x1E0CB52E8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52E8], OS_LOG_TYPE_DEFAULT))
    {
      v27 = v26;
      v28 = (void *)objc_opt_class();
      v29 = (void *)MEMORY[0x1E0CB37E8];
      v30 = self->_observers;
      v31 = v28;
      objc_msgSend(v29, "numberWithUnsignedInteger:", -[HKObserverSet count](v30, "count"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v38 = v28;
      v39 = 2114;
      v40 = v32;
      v41 = 2114;
      v42 = v10;
      _os_log_impl(&dword_1CC29C000, v27, OS_LOG_TYPE_DEFAULT, "[%{public}@] Notifying %{public}@ observers for change in setting %{public}@", buf, 0x20u);

    }
    v22 = self->_observers;
    v34[0] = MEMORY[0x1E0C809B0];
    v34[1] = 3221225472;
    v34[2] = __103__HDHRHeartRateNotificationsFeatureAvailabilityManager_observeValueForKeyPath_ofObject_change_context___block_invoke_232;
    v34[3] = &unk_1E87EF678;
    v34[4] = self;
    v23 = v34;
  }
  -[HKObserverSet notifyObservers:](v22, "notifyObservers:", v23);
LABEL_13:

}

uint64_t __103__HDHRHeartRateNotificationsFeatureAvailabilityManager_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "featureAvailabilityProvidingDidUpdateOnboardingCompletion:", *(_QWORD *)(a1 + 32));
}

void __103__HDHRHeartRateNotificationsFeatureAvailabilityManager_observeValueForKeyPath_ofObject_change_context___block_invoke_232(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "featureAvailabilityProvidingDidUpdateSettings:", *(_QWORD *)(a1 + 32));

}

- (id)canCompleteOnboardingForCountryCode:(id)a3 error:(id *)a4
{
  void *v4;
  void *v5;
  void *v6;

  -[HDHRHeartRateNotificationsFeatureAvailabilityManager onboardingEligibilityForCountryCode:error:](self, "onboardingEligibilityForCountryCode:error:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v4, "ineligibilityReasons") == 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)onboardedCountryCodeSupportedStateWithError:(id *)a3
{
  void *v3;
  void *v4;
  void *v5;

  -[HDHRHeartRateNotificationsFeatureAvailabilityManager onboardingEligibilityForCountryCode:error:](self, "onboardingEligibilityForCountryCode:error:", 0, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v3, "onboardedCountrySupportedState"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)isCurrentOnboardingVersionCompletedWithCompletion:(id)a3
{
  void (**v4)(id, id, _QWORD);
  _BOOL8 v5;
  id v6;

  v4 = (void (**)(id, id, _QWORD))a3;
  v5 = -[HDHRHeartRateNotificationsFeatureAvailabilityManager _isOnboardingRecordPresent](self, "_isOnboardingRecordPresent");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v5);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v4[2](v4, v6, 0);

}

- (id)isCurrentOnboardingVersionCompletedWithError:(id *)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HDHRHeartRateNotificationsFeatureAvailabilityManager _isOnboardingRecordPresent](self, "_isOnboardingRecordPresent", a3));
}

- (NSString)featureIdentifier
{
  return self->_featureIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featureIdentifier, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_pairedDeviceCapabilityProvider, 0);
  objc_storeStrong((id *)&self->_notificationSettingsDefaults, 0);
}

- (void)saveOnboardingCompletion:settings:completion:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_0(&dword_1CC29C000, v0, v1, "[%{public}@] Failed to determine onboarding eligibility: %{public}@");
  OUTLINED_FUNCTION_2();
}

- (void)saveOnboardingCompletion:(uint64_t)a1 settings:(void *)a2 completion:(void *)a3 .cold.2(uint64_t a1, void *a2, void *a3)
{
  NSObject *v5;
  void *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  objc_msgSend(a3, "ineligibilityReasonsDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138543618;
  v8 = a1;
  v9 = 2114;
  v10 = v6;
  _os_log_error_impl(&dword_1CC29C000, v5, OS_LOG_TYPE_ERROR, "[%{public}@] Ineligible for onboarding: %{public}@", (uint8_t *)&v7, 0x16u);

}

- (void)setFeatureSettingNumber:forKey:completion:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_0(&dword_1CC29C000, v0, v1, "[%{public}@] Unsupported feature setting %{public}@");
  OUTLINED_FUNCTION_2();
}

- (void)setFeatureSettingData:(uint64_t)a3 forKey:(uint64_t)a4 completion:(uint64_t)a5 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_4(&dword_1CC29C000, a2, a3, "[%{public}@] setFeatureSettingData: is not supported", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)setFeatureSettingString:(uint64_t)a3 forKey:(uint64_t)a4 completion:(uint64_t)a5 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_4(&dword_1CC29C000, a2, a3, "[%{public}@] setFeatureSettingString: is not supported", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

@end
