@implementation HDHRElectrocardiogramRecordingCommonFeatureAvailabilityManager

- (HDHRElectrocardiogramRecordingCommonFeatureAvailabilityManager)initWithProfile:(id)a3 featureIdentifier:(id)a4 onboardingVersion:(unint64_t)a5 pairedFeatureAttributesProvider:(id)a6 disableAndExpiryProvider:(id)a7 regionAvailabilityProvider:(id)a8 deviceSupportedProvider:(id)a9 availabilityRequirementSet:(id)a10 cacheDefaults:(id)a11 isStandalone:(BOOL)a12
{
  id v17;
  id v18;
  HDHRElectrocardiogramRecordingCommonFeatureAvailabilityManager *v19;
  HDHRElectrocardiogramRecordingCommonFeatureAvailabilityManager *v20;
  id v21;
  objc_class *v22;
  void *v23;
  uint64_t v24;
  HKFeatureAvailabilityProvidingObserver *observers;
  id WeakRetained;
  void *v27;
  id v29;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id obj;
  objc_super v37;

  obj = a3;
  v17 = a4;
  v18 = a6;
  v35 = a7;
  v34 = a8;
  v33 = a9;
  v32 = a10;
  v31 = a11;
  v37.receiver = self;
  v37.super_class = (Class)HDHRElectrocardiogramRecordingCommonFeatureAvailabilityManager;
  v19 = -[HDHRElectrocardiogramRecordingCommonFeatureAvailabilityManager init](&v37, sel_init);
  v20 = v19;
  if (v19)
  {
    v29 = v17;
    objc_storeWeak((id *)&v19->_profile, obj);
    objc_storeStrong((id *)&v20->_featureIdentifier, a4);
    v20->_onboardingVersion = a5;
    objc_storeStrong((id *)&v20->_pairedFeatureAttributesProvider, a6);
    objc_storeStrong((id *)&v20->_disableAndExpiryProvider, a7);
    objc_storeStrong((id *)&v20->_regionAvailabilityProvider, a8);
    objc_storeStrong((id *)&v20->_deviceSupportedProvider, a9);
    objc_storeStrong((id *)&v20->_availabilityRequirementSet, a10);
    objc_storeStrong((id *)&v20->_cacheDefaults, a11);
    v20->_isStandalone = a12;
    v21 = objc_alloc(MEMORY[0x1E0CB6988]);
    v22 = (objc_class *)objc_opt_class();
    NSStringFromClass(v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v21, "initWithName:loggingCategory:", v23, *MEMORY[0x1E0CB52F0]);
    observers = v20->_observers;
    v20->_observers = (HKFeatureAvailabilityProvidingObserver *)v24;

    WeakRetained = objc_loadWeakRetained((id *)&v20->_profile);
    objc_msgSend(WeakRetained, "daemon");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "registerDaemonReadyObserver:queue:", v20, 0);

    v17 = v29;
  }

  return v20;
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDHRElectrocardiogramRecordingCommonFeatureAvailabilityManager featureIdentifier](self, "featureIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p: %@>"), v5, self, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (id)pairedDeviceProvider
{
  id WeakRetained;
  void *v3;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "daemon");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "nanoRegistryDeviceCapabilityProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (NSString)featureIdentifier
{
  return self->_featureIdentifier;
}

- (id)featureOnboardingRecordWithError:(id *)a3
{
  void *v5;
  id v6;
  os_log_t *v7;
  void *v8;
  id v9;
  NSObject *v10;
  _BOOL4 v11;
  NSObject *v12;
  void *v13;
  id WeakRetained;
  void *v15;
  NSString *featureIdentifier;
  void *v17;
  id v18;
  void *v19;
  NSObject *v20;
  NSObject *v21;
  id v22;
  id v23;
  void *v24;
  id *v26;
  id v27;
  id v28;
  id v29;
  uint8_t buf[4];
  HDHRElectrocardiogramRecordingCommonFeatureAvailabilityManager *v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v29 = 0;
  -[HDHRElectrocardiogramRecordingCommonFeatureAvailabilityManager _onboardingCompletionWithError:](self, "_onboardingCompletionWithError:", &v29);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v29;
  v7 = (os_log_t *)MEMORY[0x1E0CB52F0];
  if (v5)
    goto LABEL_2;
  _HKInitializeLogging();
  v20 = *v7;
  v21 = *v7;
  if (!v6)
  {
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v31 = self;
      _os_log_impl(&dword_1CC29C000, v20, OS_LOG_TYPE_DEFAULT, "[%{public}@] ECG is not onboarded", buf, 0xCu);
    }
LABEL_2:
    v28 = 0;
    -[HDHRElectrocardiogramRecordingCommonFeatureAvailabilityManager _onboardedCountryCodeSupportedStateWithOnboardingCompletion:error:](self, "_onboardedCountryCodeSupportedStateWithOnboardingCompletion:error:", v5, &v28);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v28;
    _HKInitializeLogging();
    v10 = *v7;
    v11 = os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT);
    if (v8)
    {
      v26 = a3;
      if (v11)
      {
        v12 = v10;
        objc_msgSend(v8, "integerValue");
        NSStringFromHKFeatureAvailabilityOnboardedCountrySupportedState();
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v31 = self;
        v32 = 2114;
        v33 = v13;
        _os_log_impl(&dword_1CC29C000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@] Onboarded country state: %{public}@", buf, 0x16u);

      }
      WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
      objc_msgSend(WeakRetained, "featureSettingsManager");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      featureIdentifier = self->_featureIdentifier;
      v27 = 0;
      objc_msgSend(v15, "featureSettingsForFeatureIdentifier:error:", featureIdentifier, &v27);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v27;

      if (v17)
      {
        v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB6718]), "initWithOnboardingState:onboardingCompletion:featureSettings:", objc_msgSend(v8, "integerValue"), v5, v17);
      }
      else
      {
        _HKInitializeLogging();
        if (os_log_type_enabled(*v7, OS_LOG_TYPE_ERROR))
          -[HDHRElectrocardiogramRecordingCommonFeatureAvailabilityManager featureOnboardingRecordWithError:].cold.1();
        v23 = v18;
        v24 = v23;
        if (v23)
        {
          if (v26)
            *v26 = objc_retainAutorelease(v23);
          else
            _HKLogDroppedError();
        }

        v19 = 0;
      }

      goto LABEL_30;
    }
    if (v11)
    {
      *(_DWORD *)buf = 138543618;
      v31 = self;
      v32 = 2114;
      v33 = v9;
      _os_log_impl(&dword_1CC29C000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@] Can't read ECG onboarding state with error: %{public}@", buf, 0x16u);
    }
    v22 = v9;
    v18 = v22;
    if (v22)
    {
      if (a3)
      {
        v18 = objc_retainAutorelease(v22);
        v19 = 0;
        *a3 = v18;
LABEL_30:

        goto LABEL_31;
      }
      _HKLogDroppedError();
    }
    v19 = 0;
    goto LABEL_30;
  }
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    -[HDHRElectrocardiogramRecordingCommonFeatureAvailabilityManager featureOnboardingRecordWithError:].cold.2();
  if (a3)
  {
    v19 = 0;
    *a3 = objc_retainAutorelease(v6);
  }
  else
  {
    _HKLogDroppedError();
    v19 = 0;
  }
LABEL_31:

  return v19;
}

- (void)getFeatureOnboardingRecordWithCompletion:(id)a3
{
  void (**v4)(id, void *, id);
  void *v5;
  id v6;
  id v7;

  v7 = 0;
  v4 = (void (**)(id, void *, id))a3;
  -[HDHRElectrocardiogramRecordingCommonFeatureAvailabilityManager featureOnboardingRecordWithError:](self, "featureOnboardingRecordWithError:", &v7);
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
  -[HDHRElectrocardiogramRecordingCommonFeatureAvailabilityManager isCurrentOnboardingVersionCompletedWithError:](self, "isCurrentOnboardingVersionCompletedWithError:", &v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v7;
  v4[2](v4, v5, v6);

}

- (id)isCurrentOnboardingVersionCompletedWithError:(id *)a3
{
  void *v3;
  void *v4;
  void *v5;

  -[HDHRElectrocardiogramRecordingCommonFeatureAvailabilityManager onboardedCountryCodeSupportedStateWithError:](self, "onboardedCountryCodeSupportedStateWithError:", a3);
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

- (id)canCompleteOnboardingForCountryCode:(id)a3 error:(id *)a4
{
  void *v4;
  void *v5;
  void *v6;

  -[HDHRElectrocardiogramRecordingCommonFeatureAvailabilityManager onboardingEligibilityForCountryCode:error:](self, "onboardingEligibilityForCountryCode:error:", a3, a4);
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

- (id)onboardingEligibilityForCountryCode:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  uint64_t v14;
  unint64_t v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  id v22;
  void *v23;

  v6 = a3;
  -[HDRegionAvailabilityProviding onboardingEligibilityForCountryCode:](self->_regionAvailabilityProvider, "onboardingEligibilityForCountryCode:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "ineligibilityReasons");
  -[HDHRElectrocardiogramRecordingCommonFeatureAvailabilityManager pairedDeviceProvider](self, "pairedDeviceProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "activePairedDevice");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v11 = -[HDHRElectrocardiogramDeviceSupportedStateProvider isDeviceSupported:](self->_deviceSupportedProvider, "isDeviceSupported:", v10);
    -[HDFeatureDisableAndExpiryProviding rescindedStatusForCountryCode:device:error:](self->_disableAndExpiryProvider, "rescindedStatusForCountryCode:device:error:", v6, v10, a4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (!v12)
    {
      v20 = 0;
      goto LABEL_10;
    }
    if (v11)
      v14 = v8 | (v6 == 0);
    else
      v14 = v8 | (v6 == 0) | 4;
    v15 = -[HDHRElectrocardiogramRecordingCommonFeatureAvailabilityManager _ineligibilityReasonsForRescindedStatus:](self, "_ineligibilityReasonsForRescindedStatus:", objc_msgSend(v12, "integerValue")) | v14;
    v16 = objc_alloc(MEMORY[0x1E0CB66D0]);
    -[HDHRElectrocardiogramRecordingCommonFeatureAvailabilityManager countryAvailabilityVersion](self, "countryAvailabilityVersion");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(v16, "initWithIneligibilityReasons:countryAvailabilityVersion:", v15, v17);

    -[HDHRElectrocardiogramRecordingCommonFeatureAvailabilityManager featureIdentifier](self, "featureIdentifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "eligibilityRespectingOverridesForFeatureIdentifier:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v21 = v8 | 2;
    v22 = objc_alloc(MEMORY[0x1E0CB66D0]);
    -[HDHRElectrocardiogramRecordingCommonFeatureAvailabilityManager countryAvailabilityVersion](self, "countryAvailabilityVersion");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v22, "initWithIneligibilityReasons:countryAvailabilityVersion:", v21, v23);

    -[HDHRElectrocardiogramRecordingCommonFeatureAvailabilityManager featureIdentifier](self, "featureIdentifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "eligibilityRespectingOverridesForFeatureIdentifier:", v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }

LABEL_10:
  return v20;
}

- (unint64_t)_ineligibilityReasonsForRescindedStatus:(int64_t)a3
{
  if (a3 == 1)
    return 64;
  else
    return (unint64_t)(a3 == 2) << 7;
}

- (id)onboardedCountryCodeSupportedStateWithError:(id *)a3
{
  void *v5;
  id v6;
  void *v7;
  int v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  id v13;
  uint8_t buf[4];
  HDHRElectrocardiogramRecordingCommonFeatureAvailabilityManager *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v13 = 0;
  -[HDHRElectrocardiogramRecordingCommonFeatureAvailabilityManager _onboardingCompletionWithError:](self, "_onboardingCompletionWithError:", &v13);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v13;
  v7 = v6;
  if (v6)
  {
    v8 = objc_msgSend(v6, "hk_isDatabaseAccessibilityError");
    _HKInitializeLogging();
    v9 = *MEMORY[0x1E0CB52F0];
    v10 = *MEMORY[0x1E0CB52F0];
    if (v8)
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v15 = self;
        _os_log_impl(&dword_1CC29C000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] Database is inaccessible; can't read ECG onboarding completion",
          buf,
          0xCu);
      }
    }
    else if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      -[HDHRElectrocardiogramRecordingCommonFeatureAvailabilityManager onboardedCountryCodeSupportedStateWithError:].cold.1();
    }
    if (a3)
    {
      v11 = 0;
      *a3 = objc_retainAutorelease(v7);
    }
    else
    {
      _HKLogDroppedError();
      v11 = 0;
    }
  }
  else
  {
    -[HDHRElectrocardiogramRecordingCommonFeatureAvailabilityManager _onboardedCountryCodeSupportedStateWithOnboardingCompletion:error:](self, "_onboardedCountryCodeSupportedStateWithOnboardingCompletion:error:", v5, a3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

- (id)isFeatureCapabilitySupportedOnActivePairedDeviceWithError:(id *)a3
{
  void *v3;
  HDHRElectrocardiogramDeviceSupportedStateProvider *deviceSupportedProvider;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB37E8];
  deviceSupportedProvider = self->_deviceSupportedProvider;
  -[HDHRElectrocardiogramRecordingCommonFeatureAvailabilityManager pairedDeviceProvider](self, "pairedDeviceProvider", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "activePairedDevice");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "numberWithBool:", -[HDHRElectrocardiogramDeviceSupportedStateProvider isDeviceSupported:](deviceSupportedProvider, "isDeviceSupported:", v6));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
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

  objc_msgSend(v6, "hdhr_electrocardiogramRecordingFirstOnboardingCompletedDateWithError:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)pairedFeatureAttributesWithError:(id *)a3
{
  return (id)-[HDPairedFeatureAttributesProviding currentPairedFeatureAttributes](self->_pairedFeatureAttributesProvider, "currentPairedFeatureAttributes", a3);
}

- (id)featureAvailabilityRequirementsWithError:(id *)a3
{
  return self->_availabilityRequirementSet;
}

- (id)regionAvailabilityWithError:(id *)a3
{
  return (id)-[HDRegionAvailabilityProviding regionAvailability](self->_regionAvailabilityProvider, "regionAvailability", a3);
}

- (void)_setOnboardingCompletedForCountryCode:(id)a3 countryCodeProvenance:(int64_t)a4 onboardingVersion:(unint64_t)a5 date:(id)a6 settings:(id)a7 completion:(id)a8
{
  id v13;
  void (**v14)(id, uint64_t, id);
  void *v15;
  id WeakRetained;
  void *v17;
  uint64_t v18;
  id v19;
  void *v20;
  uint64_t v21;
  id v22;
  void *v23;
  void *v24;
  char v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  NSUserDefaults *cacheDefaults;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  _QWORD *v36;
  NSObject *v37;
  void *v38;
  NSObject *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  NSUserDefaults *v44;
  uint64_t v45;
  NSUserDefaults *v46;
  void *v47;
  uint64_t v48;
  HKFeatureAvailabilityProvidingObserver *observers;
  id v50;
  void *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  id v56;
  void *v57;
  uint64_t v58;
  void *v59;
  id v60;
  id v61;
  _QWORD v62[5];
  _QWORD v63[5];
  id v64;
  id v65;
  id v66;
  _QWORD v67[3];
  _QWORD v68[3];
  uint8_t buf[4];
  HDHRElectrocardiogramRecordingCommonFeatureAvailabilityManager *v70;
  __int16 v71;
  unint64_t v72;
  __int16 v73;
  id v74;
  __int16 v75;
  id v76;
  uint64_t v77;

  v77 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v61 = a7;
  v14 = (void (**)(id, uint64_t, id))a8;
  v15 = (void *)MEMORY[0x1E0D294B8];
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(v15, "hdhr_heartRhythmProtectedSyncedDomainForProfile:", WeakRetained);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = *MEMORY[0x1E0CB51A0];
  if (*MEMORY[0x1E0CB51A0] == a5)
  {
    v19 = v13;
    v20 = (void *)MEMORY[0x1E0C9AA70];
LABEL_9:
    v24 = (void *)*MEMORY[0x1E0CB4D28];
    v65 = 0;
    v25 = objc_msgSend(v17, "setPropertyListValue:forKey:error:", v20, v24, &v65);
    v60 = v65;
    if ((v25 & 1) != 0)
    {
      v26 = *MEMORY[0x1E0CB4D20];
      v68[0] = v19;
      v27 = *MEMORY[0x1E0CB4D30];
      v67[0] = v26;
      v67[1] = v27;
      v58 = v27;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a5);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v68[1] = v28;
      v67[2] = CFSTR("HKElectrocardiogramOnboardingCountryCodeProvenance");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
      v29 = objc_claimAutoreleasedReturnValue();
      v68[2] = v29;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v68, v67, 3);
      v30 = objc_claimAutoreleasedReturnValue();

      v64 = 0;
      v59 = (void *)v30;
      LOBYTE(v29) = objc_msgSend(v17, "setValuesWithDictionary:error:", v30, &v64);
      v31 = v64;
      if ((v29 & 1) != 0)
      {
        cacheDefaults = self->_cacheDefaults;
        v56 = v31;
        v57 = v17;
        if (v18 == a5)
        {
          v33 = v58;
          -[NSUserDefaults removeObjectForKey:](cacheDefaults, "removeObjectForKey:", v58);
          v34 = *MEMORY[0x1E0CB4D80];
          v35 = *MEMORY[0x1E0CB4D78];
          v13 = v19;
          v23 = v61;
          v36 = (_QWORD *)MEMORY[0x1E0CB4D70];
        }
        else
        {
          v33 = v58;
          -[NSUserDefaults setInteger:forKey:](cacheDefaults, "setInteger:forKey:", a5, v58);
          v55 = *MEMORY[0x1E0CB4D80];
          -[NSUserDefaults setBool:forKey:](self->_cacheDefaults, "setBool:forKey:", 1);
          v35 = *MEMORY[0x1E0CB4D78];
          v13 = v19;
          v23 = v61;
          if (v61)
          {
            objc_msgSend(v61, "numberForKey:", *MEMORY[0x1E0CB4D78]);
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            v41 = v40;
            if (v40)
              -[NSUserDefaults setBool:forKey:](self->_cacheDefaults, "setBool:forKey:", objc_msgSend(v40, "BOOLValue"), v35);
            v36 = (_QWORD *)MEMORY[0x1E0CB4D70];
            v54 = *MEMORY[0x1E0CB4D70];
            objc_msgSend(v61, "numberForKey:");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            v43 = v42;
            if (v42)
            {
              v53 = v41;
              v44 = self->_cacheDefaults;
              v45 = objc_msgSend(v42, "BOOLValue");
              v46 = v44;
              v41 = v53;
              -[NSUserDefaults setBool:forKey:](v46, "setBool:forKey:", v45, v54);
            }

          }
          else
          {
            v36 = (_QWORD *)MEMORY[0x1E0CB4D70];
          }
          v34 = v55;
        }
        objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", v33, v34, v35, *v36, 0);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        HKSynchronizeNanoPreferencesUserDefaults();

        v48 = MEMORY[0x1E0C809B0];
        observers = self->_observers;
        v63[0] = MEMORY[0x1E0C809B0];
        v63[1] = 3221225472;
        v63[2] = __169__HDHRElectrocardiogramRecordingCommonFeatureAvailabilityManager__setOnboardingCompletedForCountryCode_countryCodeProvenance_onboardingVersion_date_settings_completion___block_invoke;
        v63[3] = &unk_1E87EF678;
        v63[4] = self;
        -[HKFeatureAvailabilityProvidingObserver notifyObservers:](observers, "notifyObservers:", v63);
        v50 = objc_loadWeakRetained((id *)&self->_profile);
        objc_msgSend(v50, "nanoSyncManager");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[%@] Onboarding completed"), objc_opt_class());
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        v62[0] = v48;
        v62[1] = 3221225472;
        v62[2] = __169__HDHRElectrocardiogramRecordingCommonFeatureAvailabilityManager__setOnboardingCompletedForCountryCode_countryCodeProvenance_onboardingVersion_date_settings_completion___block_invoke_2;
        v62[3] = &unk_1E87EFB60;
        v62[4] = self;
        objc_msgSend(v51, "syncHealthDataWithOptions:reason:completion:", 0, v52, v62);

        v38 = v60;
        v14[2](v14, 1, v60);
        v31 = v56;
        v17 = v57;
      }
      else
      {
        _HKInitializeLogging();
        v39 = *MEMORY[0x1E0CB52F0];
        v38 = v60;
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52F0], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543874;
          v70 = self;
          v71 = 2048;
          v72 = a5;
          v73 = 2112;
          v74 = v60;
          _os_log_error_impl(&dword_1CC29C000, v39, OS_LOG_TYPE_ERROR, "[%{public}@] Couldn't set ECG onboarding completion version %ld: %@", buf, 0x20u);
        }
        v13 = v19;
        v23 = v61;
        if (v14)
          v14[2](v14, 0, v60);
      }

    }
    else
    {
      _HKInitializeLogging();
      v37 = *MEMORY[0x1E0CB52F0];
      v38 = v60;
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52F0], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138544130;
        v70 = self;
        v71 = 2048;
        v72 = a5;
        v73 = 2112;
        v74 = v24;
        v75 = 2112;
        v76 = v60;
        _os_log_error_impl(&dword_1CC29C000, v37, OS_LOG_TYPE_ERROR, "[%{public}@] Couldn't set ECG onboarding history %ld for key [%@]: %@", buf, 0x2Au);
      }
      v13 = v19;
      v23 = v61;
      if (v14)
        v14[2](v14, 0, v60);
    }

    goto LABEL_32;
  }
  v66 = 0;
  -[HDHRElectrocardiogramRecordingCommonFeatureAvailabilityManager _makeOnboardingHistoryWithOnboardingVersion:countryCode:error:](self, "_makeOnboardingHistoryWithOnboardingVersion:countryCode:error:", a5, v13, &v66);
  v21 = objc_claimAutoreleasedReturnValue();
  v22 = v66;
  v20 = v22;
  if (v21 || !v22)
  {
    v19 = v13;

    v20 = (void *)v21;
    goto LABEL_9;
  }
  if (v14)
    v14[2](v14, 0, v22);
  v23 = v61;
LABEL_32:

}

uint64_t __169__HDHRElectrocardiogramRecordingCommonFeatureAvailabilityManager__setOnboardingCompletedForCountryCode_countryCodeProvenance_onboardingVersion_date_settings_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "featureAvailabilityProvidingDidUpdateOnboardingCompletion:", *(_QWORD *)(a1 + 32));
}

void __169__HDHRElectrocardiogramRecordingCommonFeatureAvailabilityManager__setOnboardingCompletedForCountryCode_countryCodeProvenance_onboardingVersion_date_settings_completion___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  _HKInitializeLogging();
  v6 = *MEMORY[0x1E0CB52F0];
  v7 = *MEMORY[0x1E0CB52F0];
  if (a2)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(_QWORD *)(a1 + 32);
      v9 = 138543362;
      v10 = v8;
      _os_log_impl(&dword_1CC29C000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] NanoSync completed after onboarding completed", (uint8_t *)&v9, 0xCu);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    __169__HDHRElectrocardiogramRecordingCommonFeatureAvailabilityManager__setOnboardingCompletedForCountryCode_countryCodeProvenance_onboardingVersion_date_settings_completion___block_invoke_2_cold_1(a1, (uint64_t)v5, v6);
  }

}

- (void)setCurrentOnboardingVersionCompletedForCountryCode:(id)a3 countryCodeProvenance:(int64_t)a4 date:(id)a5 settings:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  unint64_t onboardingVersion;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  id v28;
  _BYTE location[12];
  __int16 v30;
  id v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  if (v12)
  {
    v28 = 0;
    -[HDHRElectrocardiogramRecordingCommonFeatureAvailabilityManager onboardingEligibilityForCountryCode:error:](self, "onboardingEligibilityForCountryCode:error:", v12, &v28);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v28;
    if (v16)
    {
      if ((objc_msgSend(v16, "isEligible") & 1) != 0)
      {
        objc_initWeak((id *)location, self);
        onboardingVersion = self->_onboardingVersion;
        v24[0] = MEMORY[0x1E0C809B0];
        v24[1] = 3221225472;
        v24[2] = __164__HDHRElectrocardiogramRecordingCommonFeatureAvailabilityManager_setCurrentOnboardingVersionCompletedForCountryCode_countryCodeProvenance_date_settings_completion___block_invoke;
        v24[3] = &unk_1E87F0388;
        objc_copyWeak(&v27, (id *)location);
        v25 = v13;
        v26 = v15;
        -[HDHRElectrocardiogramRecordingCommonFeatureAvailabilityManager _setOnboardingCompletedForCountryCode:countryCodeProvenance:onboardingVersion:date:settings:completion:](self, "_setOnboardingCompletedForCountryCode:countryCodeProvenance:onboardingVersion:date:settings:completion:", v12, a4, onboardingVersion, v25, v14, v24);

        objc_destroyWeak(&v27);
        objc_destroyWeak((id *)location);
      }
      else
      {
        v20 = (void *)MEMORY[0x1E0CB35C8];
        objc_msgSend(v16, "ineligibilityReasonsDescription");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "hk_error:format:", 110, CFSTR("This feature cannot be enabled for country %@: %@"), v12, v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        (*((void (**)(id, _QWORD, void *))v15 + 2))(v15, 0, v22);

      }
    }
    else
    {
      _HKInitializeLogging();
      v19 = *MEMORY[0x1E0CB52F0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52F0], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)location = 138543874;
        *(_QWORD *)&location[4] = self;
        v30 = 2114;
        v31 = v12;
        v32 = 2114;
        v33 = v17;
        _os_log_error_impl(&dword_1CC29C000, v19, OS_LOG_TYPE_ERROR, "[%{public}@] Error checking onboarding completion ability in country %{public}@: %{public}@", location, 0x20u);
      }
      (*((void (**)(id, _QWORD, id))v15 + 2))(v15, 0, v17);
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:", 3, CFSTR("A non-nil country code is required to onboard this feature"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v15 + 2))(v15, 0, v18);

  }
}

void __164__HDHRElectrocardiogramRecordingCommonFeatureAvailabilityManager_setCurrentOnboardingVersionCompletedForCountryCode_countryCodeProvenance_date_settings_completion___block_invoke(uint64_t a1, int a2, void *a3)
{
  id WeakRetained;
  id v6;

  v6 = a3;
  if (a2)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    objc_msgSend(WeakRetained, "_saveFirstOnboardingCompletionDateIfNeeded:", *(_QWORD *)(a1 + 32));

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)saveOnboardingCompletion:(id)a3 settings:(id)a4 completion:(id)a5
{
  void (**v6)(id, _QWORD, void *);
  NSObject *v7;
  void *v8;

  v6 = (void (**)(id, _QWORD, void *))a5;
  _HKInitializeLogging();
  v7 = *MEMORY[0x1E0CB52F0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52F0], OS_LOG_TYPE_ERROR))
    -[HDHRElectrocardiogramRecordingCommonFeatureAvailabilityManager saveOnboardingCompletion:settings:completion:].cold.1((uint64_t)self, v7);
  objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:", 3, CFSTR("Saving HKOnboardingCompletion is not supported for ECG 1.0"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v6[2](v6, 0, v8);

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
    -[HDHRElectrocardiogramRecordingCommonFeatureAvailabilityManager setFeatureSettingData:forKey:completion:].cold.1();
  objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:", 3, CFSTR("Cannot set unknown data setting for ECG 1.0"));
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
    -[HDHRElectrocardiogramRecordingCommonFeatureAvailabilityManager setFeatureSettingString:forKey:completion:].cold.1();
  objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:", 3, CFSTR("Cannot set unknown string setting for ECG 1.0"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v7[2](v7, 0, v8);

}

- (void)setFeatureSettingNumber:(id)a3 forKey:(id)a4 completion:(id)a5
{
  id v6;
  void (**v7)(id, _QWORD, void *);
  void *v8;

  v6 = a4;
  v7 = (void (**)(id, _QWORD, void *))a5;
  _HKInitializeLogging();
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52F0], OS_LOG_TYPE_ERROR))
    -[HDHRElectrocardiogramRecordingCommonFeatureAvailabilityManager setFeatureSettingNumber:forKey:completion:].cold.1();
  objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:", 3, CFSTR("Cannot set unknown string setting for ECG 1.0"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v7[2](v7, 0, v8);

}

- (void)removeFeatureSettingValueForKey:(id)a3 completion:(id)a4
{
  id v5;
  void (**v6)(id, _QWORD, void *);
  void *v7;

  v5 = a3;
  v6 = (void (**)(id, _QWORD, void *))a4;
  _HKInitializeLogging();
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52F0], OS_LOG_TYPE_ERROR))
    -[HDHRElectrocardiogramRecordingCommonFeatureAvailabilityManager removeFeatureSettingValueForKey:completion:].cold.1();
  objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:", 3, CFSTR("Removing settings for ECG 1.0 is not supported"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v6[2](v6, 0, v7);

}

- (void)resetOnboardingWithCompletion:(id)a3
{
  NSUserDefaults *cacheDefaults;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id WeakRetained;
  void *v13;
  uint64_t v14;

  cacheDefaults = self->_cacheDefaults;
  v5 = *MEMORY[0x1E0CB4D18];
  v6 = a3;
  -[NSUserDefaults removeObjectForKey:](cacheDefaults, "removeObjectForKey:", v5);
  -[NSUserDefaults removeObjectForKey:](self->_cacheDefaults, "removeObjectForKey:", CFSTR("WristConfirmationAlertDate"));
  v7 = *MEMORY[0x1E0CB4D80];
  -[NSUserDefaults removeObjectForKey:](self->_cacheDefaults, "removeObjectForKey:", *MEMORY[0x1E0CB4D80]);
  -[NSUserDefaults removeObjectForKey:](self->_cacheDefaults, "removeObjectForKey:", CFSTR("PromimentUpgradeTileDismissed"));
  v8 = *MEMORY[0x1E0CB4D78];
  -[NSUserDefaults removeObjectForKey:](self->_cacheDefaults, "removeObjectForKey:", *MEMORY[0x1E0CB4D78]);
  v9 = *MEMORY[0x1E0CB4D70];
  -[NSUserDefaults removeObjectForKey:](self->_cacheDefaults, "removeObjectForKey:", *MEMORY[0x1E0CB4D70]);
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", v5, CFSTR("WristConfirmationAlertDate"), v7, v8, v9, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  HKSynchronizeNanoPreferencesUserDefaults();

  v11 = (void *)MEMORY[0x1E0D294B8];
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(v11, "hdhr_heartRhythmProtectedSyncedDomainForProfile:", WeakRetained);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = 0;
  objc_msgSend(v13, "hdhr_resetElectrocardiogramRecordingFirstOnboardingCompletedDateWithError:", &v14);
  -[HDHRElectrocardiogramRecordingCommonFeatureAvailabilityManager _setOnboardingCompletedForCountryCode:countryCodeProvenance:onboardingVersion:date:settings:completion:](self, "_setOnboardingCompletedForCountryCode:countryCodeProvenance:onboardingVersion:date:settings:completion:", &stru_1E87F0B08, 0, *MEMORY[0x1E0CB51A0], 0, 0, v6);

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

- (void)registerObserver:(id)a3 queue:(id)a4
{
  HKFeatureAvailabilityProvidingObserver *observers;
  _QWORD v5[5];

  observers = self->_observers;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __89__HDHRElectrocardiogramRecordingCommonFeatureAvailabilityManager_registerObserver_queue___block_invoke;
  v5[3] = &unk_1E87EF6F0;
  v5[4] = self;
  -[HKFeatureAvailabilityProvidingObserver registerObserver:queue:runIfFirstObserver:](observers, "registerObserver:queue:runIfFirstObserver:", a3, a4, v5);
}

void __89__HDHRElectrocardiogramRecordingCommonFeatureAvailabilityManager_registerObserver_queue___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "pairedDeviceProvider");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "registerObserver:queue:", *(_QWORD *)(a1 + 32), 0);

}

- (void)unregisterObserver:(id)a3
{
  -[HKFeatureAvailabilityProvidingObserver unregisterObserver:](self->_observers, "unregisterObserver:", a3);
}

- (void)pairedDeviceCapabilitiesDidUpdate:(id)a3
{
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  void *v7;
  HKFeatureAvailabilityProvidingObserver *observers;
  _QWORD v9[5];
  uint8_t buf[4];
  HDHRElectrocardiogramRecordingCommonFeatureAvailabilityManager *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  _HKInitializeLogging();
  HKLogInfrastructure();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_INFO);

  if (v5)
  {
    HKLogInfrastructure();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HKFeatureAvailabilityProvidingObserver count](self->_observers, "count"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v11 = self;
      v12 = 2114;
      v13 = v7;
      _os_log_impl(&dword_1CC29C000, v6, OS_LOG_TYPE_INFO, "[%{public}@] Notifying %{public}@ observers paired device capability changes", buf, 0x16u);

    }
  }
  observers = self->_observers;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __100__HDHRElectrocardiogramRecordingCommonFeatureAvailabilityManager_pairedDeviceCapabilitiesDidUpdate___block_invoke;
  v9[3] = &unk_1E87EF678;
  v9[4] = self;
  -[HKFeatureAvailabilityProvidingObserver notifyObservers:](observers, "notifyObservers:", v9);
}

void __100__HDHRElectrocardiogramRecordingCommonFeatureAvailabilityManager_pairedDeviceCapabilitiesDidUpdate___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "featureAvailabilityProvidingDidUpdatePairedDeviceCapability:", *(_QWORD *)(a1 + 32));

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
  HKFeatureAvailabilityProvidingObserver *observers;
  _QWORD v10[5];
  uint8_t buf[4];
  HDHRElectrocardiogramRecordingCommonFeatureAvailabilityManager *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
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
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HKFeatureAvailabilityProvidingObserver count](self->_observers, "count"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v12 = self;
        v13 = 2114;
        v14 = v8;
        _os_log_impl(&dword_1CC29C000, v7, OS_LOG_TYPE_INFO, "[%{public}@] Notifying %{public}@ observers for protected database becoming available", buf, 0x16u);

      }
    }
    observers = self->_observers;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __107__HDHRElectrocardiogramRecordingCommonFeatureAvailabilityManager_database_protectedDataDidBecomeAvailable___block_invoke;
    v10[3] = &unk_1E87EF678;
    v10[4] = self;
    -[HKFeatureAvailabilityProvidingObserver notifyObservers:](observers, "notifyObservers:", v10);
  }
}

void __107__HDHRElectrocardiogramRecordingCommonFeatureAvailabilityManager_database_protectedDataDidBecomeAvailable___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(v3, "conformsToProtocol:", &unk_1EF9CBA60))
    objc_msgSend(v3, "featureAvailabilityExtensionOnboardingCompletionDataDidBecomeAvailable:", *(_QWORD *)(a1 + 32));

}

- (id)_onboardedCountryCodeSupportedStateWithOnboardingCompletion:(id)a3 error:(id *)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  unint64_t v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  id v17;
  id v18;
  uint8_t buf[4];
  HDHRElectrocardiogramRecordingCommonFeatureAvailabilityManager *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    objc_msgSend(a3, "countryCode");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0;
    -[HDHRElectrocardiogramRecordingCommonFeatureAvailabilityManager onboardingEligibilityForCountryCode:error:](self, "onboardingEligibilityForCountryCode:error:", v6, &v18);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    v8 = v18;
    v9 = v8;
    if (v7)
    {
      if (self->_isStandalone)
      {
        objc_msgSend(v7, "ineligibilityReasons");
        v10 = objc_msgSend(v7, "ineligibilityReasons") & 0xFFFFFFFFFFFFFFFDLL;
        v11 = objc_alloc(MEMORY[0x1E0CB66D0]);
        objc_msgSend(v7, "countryAvailabilityVersion");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v11, "initWithIneligibilityReasons:countryAvailabilityVersion:", v10, v12);

        v7 = (id)v13;
      }
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v7, "onboardedCountrySupportedState"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_14;
    }
    v17 = v8;
    v7 = v17;
    if (v17)
    {
      if (a4)
      {
        v7 = objc_retainAutorelease(v17);
        v14 = 0;
        *a4 = v7;
LABEL_14:

        return v14;
      }
      _HKLogDroppedError();
    }
    v14 = 0;
    goto LABEL_14;
  }
  _HKInitializeLogging();
  v15 = *MEMORY[0x1E0CB52F0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52F0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v20 = self;
    _os_log_impl(&dword_1CC29C000, v15, OS_LOG_TYPE_DEFAULT, "[%{public}@] No record of onboarding found, assuming not onboarded", buf, 0xCu);
  }
  return &unk_1E87FF758;
}

- (void)_saveFirstOnboardingCompletionDateIfNeeded:(id)a3
{
  id v4;
  void *v5;
  id WeakRetained;
  void *v7;
  void *v8;
  id v9;
  char v10;
  id v11;
  void *v12;
  int v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  id v17;
  id v18;
  uint8_t buf[4];
  HDHRElectrocardiogramRecordingCommonFeatureAvailabilityManager *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v5 = (void *)MEMORY[0x1E0D294B8];
    WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
    objc_msgSend(v5, "hdhr_heartRhythmProtectedSyncedDomainForProfile:", WeakRetained);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = 0;
    objc_msgSend(v7, "hdhr_electrocardiogramRecordingFirstOnboardingCompletedDateWithError:", &v18);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v18;
    if (!v8)
    {
      v17 = 0;
      v10 = objc_msgSend(v7, "hdhr_setElectrocardiogramRecordingFirstOnboardingCompletedDate:error:", v4, &v17);
      v11 = v17;
      v12 = v11;
      if ((v10 & 1) == 0 && v11)
      {
        v13 = objc_msgSend(v11, "hk_isDatabaseAccessibilityError");
        _HKInitializeLogging();
        v14 = *MEMORY[0x1E0CB52F0];
        v15 = *MEMORY[0x1E0CB52F0];
        if (v13)
        {
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            v20 = self;
            _os_log_impl(&dword_1CC29C000, v14, OS_LOG_TYPE_DEFAULT, "[%{public}@] Database is inaccessible; can't save first ECG onboarding completion date",
              buf,
              0xCu);
          }
        }
        else if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          -[HDHRElectrocardiogramRecordingCommonFeatureAvailabilityManager _saveFirstOnboardingCompletionDateIfNeeded:].cold.1();
        }
      }

    }
  }
  else
  {
    _HKInitializeLogging();
    v16 = *MEMORY[0x1E0CB52F0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52F0], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v20 = self;
      _os_log_impl(&dword_1CC29C000, v16, OS_LOG_TYPE_DEFAULT, "[%{public}@] First ECG onboarding completion date is not provided", buf, 0xCu);
    }
  }

}

- (id)_onboardingCompletionWithError:(id *)a3
{
  void *v5;
  id WeakRetained;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  unint64_t onboardingVersion;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t i;
  void *v19;
  __CFString *v20;
  uint64_t v21;
  __CFString *v22;
  void *v23;
  __CFString *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  id v33;
  NSString *featureIdentifier;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v40;
  id v41;
  id v42;
  id v43;
  id v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  void *v49;
  __CFString *v50;
  uint8_t buf[4];
  HDHRElectrocardiogramRecordingCommonFeatureAvailabilityManager *v52;
  __int16 v53;
  void *v54;
  __int16 v55;
  void *v56;
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1E0D294B8];
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(v5, "hdhr_heartRhythmProtectedSyncedDomainForProfile:", WeakRetained);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v44 = 0;
  -[HDHRElectrocardiogramRecordingCommonFeatureAvailabilityManager _currentOnboardingHistoryDictionaryWithError:](self, "_currentOnboardingHistoryDictionaryWithError:", &v44);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v44;
  v10 = v9;
  if (!v8)
  {
    if (v9)
    {
      if (a3)
      {
        v26 = 0;
        *a3 = objc_retainAutorelease(v9);
      }
      else
      {
        _HKLogDroppedError();
        v26 = 0;
      }
      goto LABEL_27;
    }
    v8 = (void *)MEMORY[0x1E0C9AA70];
  }
  v42 = v9;
  onboardingVersion = self->_onboardingVersion;
  v12 = v8;
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  objc_msgSend(v12, "allKeys");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v45, buf, 16);
  if (v14)
  {
    v15 = v14;
    v40 = v7;
    v16 = *(_QWORD *)v46;
    v17 = (void *)MEMORY[0x1E0C9AA70];
    while (2)
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v46 != v16)
          objc_enumerationMutation(v13);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v45 + 1) + 8 * i), "integerValue") == onboardingVersion)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%i"), onboardingVersion);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "objectForKeyedSubscript:", v19);
          v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
          v21 = -[__CFString length](v20, "length");
          v22 = &stru_1E87F0B08;
          if (v21)
            v22 = v20;
          v23 = (void *)MEMORY[0x1E0CB37E8];
          v24 = v22;
          objc_msgSend(v23, "numberWithInteger:", onboardingVersion);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v49 = v25;
          v50 = v24;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v50, &v49, 1);
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_14;
        }
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v45, buf, 16);
      if (v15)
        continue;
      break;
    }
LABEL_14:
    v7 = v40;
  }
  else
  {
    v17 = (void *)MEMORY[0x1E0C9AA70];
  }

  if (objc_msgSend(v17, "count"))
  {
    objc_msgSend(v17, "allKeys");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "lastObject");
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v17, "objectForKeyedSubscript:", v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = 0;
    objc_msgSend(v7, "hdhr_electrocardiogramRecordingFirstOnboardingCompletedDateWithError:", &v43);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = v43;
    if (!v30)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", 1.0);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
    }
    _HKInitializeLogging();
    v31 = *MEMORY[0x1E0CB52F0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52F0], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      v52 = self;
      v53 = 2114;
      v54 = v29;
      v55 = 2114;
      v56 = v28;
      _os_log_impl(&dword_1CC29C000, v31, OS_LOG_TYPE_DEFAULT, "[%{public}@] ECG onboarding countryCode: %{public}@, version: %{public}@", buf, 0x20u);
    }
    objc_msgSend(v7, "hdhr_electrocardiogramRecordingCountryCodeProvenanceWithError:", 0);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_alloc(MEMORY[0x1E0CB6990]);
    featureIdentifier = self->_featureIdentifier;
    v35 = v7;
    v36 = objc_msgSend(v28, "integerValue");
    v37 = objc_msgSend(v32, "integerValue");
    v38 = v36;
    v7 = v35;
    v26 = (void *)objc_msgSend(v33, "initWithFeatureIdentifier:version:completionDate:countryCode:countryCodeProvenance:", featureIdentifier, v38, v30, v29, v37);

  }
  else
  {
    v26 = 0;
  }

  v10 = v42;
LABEL_27:

  return v26;
}

- (id)_currentOnboardingHistoryDictionaryWithError:(id *)a3
{
  void *v5;
  id WeakRetained;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  BOOL v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  __CFString *v16;
  void *v17;
  void *v18;
  const __CFString *v19;
  void *v20;
  void *v21;
  int v22;
  uint64_t v23;
  id v24;
  NSObject *v25;
  id v27;
  id v28;
  id v29;
  uint8_t buf[4];
  HDHRElectrocardiogramRecordingCommonFeatureAvailabilityManager *v31;
  __int16 v32;
  const __CFString *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1E0D294B8];
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(v5, "hdhr_heartRhythmProtectedSyncedDomainForProfile:", WeakRetained);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v29 = 0;
  objc_msgSend(v7, "hdhr_electrocardiogramRecordingOnboardingHistoryWithError:", &v29);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v29;
  v10 = v9;
  if (v8)
    v11 = 1;
  else
    v11 = v9 == 0;
  if (v11)
  {
    v28 = 0;
    objc_msgSend(v7, "hdhr_electrocardiogramRecordingOnboardingCompletionVersionWithError:", &v28);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    v13 = v28;
    if (!v12)
    {
      objc_msgSend(MEMORY[0x1E0CB6F18], "sharedBehavior");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "isAppleWatch");

      if (!v22
        || (v23 = -[NSUserDefaults integerForKey:](self->_cacheDefaults, "integerForKey:", *MEMORY[0x1E0CB4D30]), v23 < 1)
        || (objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v23),
            (v12 = (id)objc_claimAutoreleasedReturnValue()) == 0))
      {
        v24 = v13;
        v12 = v24;
        if (v24)
        {
          if (a3)
          {
            v12 = objc_retainAutorelease(v24);
            v18 = 0;
            *a3 = v12;
            goto LABEL_34;
          }
          _HKLogDroppedError();
        }
        v18 = 0;
        goto LABEL_34;
      }
    }
    v27 = 0;
    objc_msgSend(v7, "hdhr_electrocardiogramRecordingOnboardingCountryCodeWithError:", &v27);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v27;
    objc_msgSend(v14, "hk_copyNonEmptyString");
    v16 = (__CFString *)objc_claimAutoreleasedReturnValue();

    if (!v16)
    {
      if (v15)
      {
        if (a3)
        {
          v18 = 0;
          *a3 = objc_retainAutorelease(v15);
        }
        else
        {
          _HKLogDroppedError();
          v18 = 0;
        }
LABEL_16:

LABEL_34:
        goto LABEL_35;
      }
      if (objc_msgSend(v12, "integerValue"))
      {
        _HKInitializeLogging();
        v25 = *MEMORY[0x1E0CB52F0];
        v16 = CFSTR("US");
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52F0], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          v31 = self;
          v32 = 2114;
          v33 = CFSTR("US");
          _os_log_impl(&dword_1CC29C000, v25, OS_LOG_TYPE_DEFAULT, "[%{public}@] Onboarding region: %{public}@ (Not Present, Assumed)", buf, 0x16u);
        }
      }
      else
      {
        v16 = 0;
      }
    }
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (v8)
      objc_msgSend(v17, "addEntriesFromDictionary:", v8);
    if (objc_msgSend(v12, "integerValue"))
    {
      if (v16)
        v19 = v16;
      else
        v19 = &stru_1E87F0B08;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%i"), objc_msgSend(v12, "integerValue"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setObject:forKey:", v19, v20);

    }
    goto LABEL_16;
  }
  if (a3)
  {
    v18 = 0;
    *a3 = objc_retainAutorelease(v9);
  }
  else
  {
    _HKLogDroppedError();
    v18 = 0;
  }
LABEL_35:

  return v18;
}

- (id)_makeOnboardingHistoryWithOnboardingVersion:(int64_t)a3 countryCode:(id)a4 error:(id *)a5
{
  __CFString *v8;
  __CFString *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v17;

  v8 = (__CFString *)a4;
  if (v8)
    v9 = v8;
  else
    v9 = &stru_1E87F0B08;
  v17 = 0;
  -[HDHRElectrocardiogramRecordingCommonFeatureAvailabilityManager _currentOnboardingHistoryDictionaryWithError:](self, "_currentOnboardingHistoryDictionaryWithError:", &v17);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v17;
  v12 = v11;
  if (v10)
    goto LABEL_5;
  if (!v11)
  {
    v10 = (void *)MEMORY[0x1E0C9AA70];
LABEL_5:
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%i"), a3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKey:", v9, v14);

    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithDictionary:", v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_6;
  }
  if (a5)
  {
    v15 = 0;
    *a5 = objc_retainAutorelease(v11);
  }
  else
  {
    _HKLogDroppedError();
    v15 = 0;
  }
LABEL_6:

  return v15;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_availabilityRequirementSet, 0);
  objc_storeStrong((id *)&self->_featureIdentifier, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_cacheDefaults, 0);
  objc_storeStrong((id *)&self->_deviceSupportedProvider, 0);
  objc_storeStrong((id *)&self->_regionAvailabilityProvider, 0);
  objc_storeStrong((id *)&self->_disableAndExpiryProvider, 0);
  objc_storeStrong((id *)&self->_pairedFeatureAttributesProvider, 0);
  objc_destroyWeak((id *)&self->_profile);
}

- (void)featureOnboardingRecordWithError:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_0(&dword_1CC29C000, v0, v1, "[%{public}@] Can't read ECG feature settings with error: %{public}@");
  OUTLINED_FUNCTION_2();
}

- (void)featureOnboardingRecordWithError:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_0(&dword_1CC29C000, v0, v1, "[%{public}@] Can't read ECG onboarding record with error: %{public}@");
  OUTLINED_FUNCTION_2();
}

- (void)onboardedCountryCodeSupportedStateWithError:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_0(&dword_1CC29C000, v0, v1, "[%{public}@] Error reading ECG onboarding completion: %{public}@");
  OUTLINED_FUNCTION_2();
}

void __169__HDHRElectrocardiogramRecordingCommonFeatureAvailabilityManager__setOnboardingCompletedForCountryCode_countryCodeProvenance_onboardingVersion_date_settings_completion___block_invoke_2_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 138543618;
  *(_QWORD *)&v3[4] = *(_QWORD *)(a1 + 32);
  *(_WORD *)&v3[12] = 2114;
  *(_QWORD *)&v3[14] = a2;
  OUTLINED_FUNCTION_0(&dword_1CC29C000, a2, a3, "[%{public}@] NanoSync failed after onboarding completed: %{public}@", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16]);
  OUTLINED_FUNCTION_2();
}

- (void)saveOnboardingCompletion:(uint64_t)a1 settings:(NSObject *)a2 completion:.cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_1CC29C000, a2, OS_LOG_TYPE_ERROR, "[%{public}@] Saving HKOnboardingCompletion is not supported for ECG 1.0", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_2();
}

- (void)setFeatureSettingData:forKey:completion:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_0(&dword_1CC29C000, v0, v1, "[%{public}@] Unknown data setting for ECG 1.0: %{public}@");
  OUTLINED_FUNCTION_2();
}

- (void)setFeatureSettingString:forKey:completion:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_0(&dword_1CC29C000, v0, v1, "[%{public}@] Unknown string setting for ECG 1.0: %{public}@");
  OUTLINED_FUNCTION_2();
}

- (void)setFeatureSettingNumber:forKey:completion:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_0(&dword_1CC29C000, v0, v1, "[%{public}@] Unknown number setting for ECG 1.0: %{public}@");
  OUTLINED_FUNCTION_2();
}

- (void)removeFeatureSettingValueForKey:completion:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_0(&dword_1CC29C000, v0, v1, "[%{public}@] Removing settings for ECG 1.0 is not supported: %{public}@");
  OUTLINED_FUNCTION_2();
}

- (void)_saveFirstOnboardingCompletionDateIfNeeded:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_0(&dword_1CC29C000, v0, v1, "[%{public}@] Error saving first ECG onboarding completion date: %{public}@");
  OUTLINED_FUNCTION_2();
}

@end
