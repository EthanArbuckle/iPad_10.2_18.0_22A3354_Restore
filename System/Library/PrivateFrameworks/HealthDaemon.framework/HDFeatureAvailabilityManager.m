@implementation HDFeatureAvailabilityManager

- (HDFeatureAvailabilityManager)initWithProfile:(id)a3 featureIdentifier:(id)a4 currentOnboardingVersion:(int64_t)a5 loggingCategory:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  HDFeatureAvailabilityManager *v14;

  v10 = a6;
  v11 = a4;
  v12 = a3;
  +[HDRegionAvailabilityProvider uncheckedAvailability](HDRegionAvailabilityProvider, "uncheckedAvailability");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[HDFeatureAvailabilityManager initWithProfile:featureIdentifier:currentOnboardingVersion:pairedDeviceCapability:regionAvailabilityProvider:loggingCategory:](self, "initWithProfile:featureIdentifier:currentOnboardingVersion:pairedDeviceCapability:regionAvailabilityProvider:loggingCategory:", v12, v11, a5, 0, v13, v10);

  return v14;
}

- (HDFeatureAvailabilityManager)initWithProfile:(id)a3 featureIdentifier:(id)a4 currentOnboardingVersion:(int64_t)a5 pairedDeviceCapability:(id)a6 regionAvailabilityProvider:(id)a7 loggingCategory:(id)a8
{
  void *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  HDFeatureNeverDisabledOrExpiredProvider *v21;
  HDFeatureAvailabilityManager *v22;

  v14 = (void *)MEMORY[0x1E0CB66F0];
  v15 = a8;
  v16 = a7;
  v17 = a6;
  v18 = a4;
  v19 = a3;
  objc_msgSend(v14, "noRequirements");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_alloc_init(HDFeatureNeverDisabledOrExpiredProvider);
  v22 = -[HDFeatureAvailabilityManager initWithProfile:featureIdentifier:availabilityRequirements:currentOnboardingVersion:pairedDeviceCapability:regionAvailabilityProvider:disableAndExpiryProvider:loggingCategory:](self, "initWithProfile:featureIdentifier:availabilityRequirements:currentOnboardingVersion:pairedDeviceCapability:regionAvailabilityProvider:disableAndExpiryProvider:loggingCategory:", v19, v18, v20, a5, v17, v16, v21, v15);

  return v22;
}

- (HDFeatureAvailabilityManager)initWithProfile:(id)a3 featureIdentifier:(id)a4 availabilityRequirements:(id)a5 currentOnboardingVersion:(int64_t)a6 pairedDeviceCapability:(id)a7 regionAvailabilityProvider:(id)a8 disableAndExpiryProvider:(id)a9 loggingCategory:(id)a10
{
  void *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  HDFeatureAvailabilityOnboardingEligibilityDeterminer *v24;
  HDLocalFeatureAttributesProvider *v26;
  id v27;
  id v28;
  void *v29;
  void *v30;
  HDFeatureAvailabilityManager *v32;

  v16 = (void *)MEMORY[0x1E0CB3940];
  v28 = a10;
  v17 = a9;
  v18 = a8;
  v19 = a7;
  v27 = a5;
  v20 = a4;
  v21 = a3;
  objc_msgSend(v16, "stringWithFormat:", CFSTR("%ld"), a6);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB66B0]), "initWithFeatureVersion:updateVersion:UDIDeviceIdentifier:yearOfRelease:", v30, v30, 0, 0);
  v26 = -[HDLocalFeatureAttributesProvider initWithLocalFeatureAttributes:]([HDLocalFeatureAttributesProvider alloc], "initWithLocalFeatureAttributes:", v29);
  objc_msgSend(v21, "daemon");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "nanoRegistryDeviceCapabilityProvider");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = -[HDFeatureAvailabilityOnboardingEligibilityDeterminer initWithFeatureIdentifier:currentOnboardingVersion:pairedDeviceCapability:pairedDeviceCapabilityProvider:regionAvailabilityProvider:disableAndExpiryProvider:loggingCategory:]([HDFeatureAvailabilityOnboardingEligibilityDeterminer alloc], "initWithFeatureIdentifier:currentOnboardingVersion:pairedDeviceCapability:pairedDeviceCapabilityProvider:regionAvailabilityProvider:disableAndExpiryProvider:loggingCategory:", v20, a6, v19, v23, v18, v17, v28);
  v32 = -[HDFeatureAvailabilityManager initWithProfile:featureIdentifier:availabilityRequirements:currentOnboardingVersion:pairedDeviceCapability:pairedFeatureAttributesProvider:regionAvailabilityProvider:disableAndExpiryProvider:onboardingEligibilityDeterminer:featureSettingsAtOnboardingTimeValidator:loggingCategory:](self, "initWithProfile:featureIdentifier:availabilityRequirements:currentOnboardingVersion:pairedDeviceCapability:pairedFeatureAttributesProvider:regionAvailabilityProvider:disableAndExpiryProvider:onboardingEligibilityDeterminer:featureSettingsAtOnboardingTimeValidator:loggingCategory:", v21, v20, v27, a6, v19, v26, v18, v17, v24, 0, v28);

  return v32;
}

- (HDFeatureAvailabilityManager)initWithProfile:(id)a3 featureIdentifier:(id)a4 availabilityRequirements:(id)a5 currentOnboardingVersion:(int64_t)a6 pairedDeviceCapability:(id)a7 pairedFeatureAttributesProvider:(id)a8 regionAvailabilityProvider:(id)a9 disableAndExpiryProvider:(id)a10 loggingCategory:(id)a11
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  HDFeatureAvailabilityOnboardingEligibilityDeterminer *v25;
  HDFeatureAvailabilityManager *v26;
  void *v28;
  id v29;

  v17 = a11;
  v18 = a10;
  v19 = a9;
  v29 = a8;
  v20 = a7;
  v21 = a5;
  v22 = a4;
  v23 = a3;
  objc_msgSend(v23, "daemon");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "nanoRegistryDeviceCapabilityProvider");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = -[HDFeatureAvailabilityOnboardingEligibilityDeterminer initWithFeatureIdentifier:currentOnboardingVersion:pairedDeviceCapability:pairedDeviceCapabilityProvider:regionAvailabilityProvider:disableAndExpiryProvider:loggingCategory:]([HDFeatureAvailabilityOnboardingEligibilityDeterminer alloc], "initWithFeatureIdentifier:currentOnboardingVersion:pairedDeviceCapability:pairedDeviceCapabilityProvider:regionAvailabilityProvider:disableAndExpiryProvider:loggingCategory:", v22, a6, v20, v28, v19, v18, v17);
  v26 = -[HDFeatureAvailabilityManager initWithProfile:featureIdentifier:availabilityRequirements:currentOnboardingVersion:pairedDeviceCapability:pairedFeatureAttributesProvider:regionAvailabilityProvider:disableAndExpiryProvider:onboardingEligibilityDeterminer:featureSettingsAtOnboardingTimeValidator:loggingCategory:](self, "initWithProfile:featureIdentifier:availabilityRequirements:currentOnboardingVersion:pairedDeviceCapability:pairedFeatureAttributesProvider:regionAvailabilityProvider:disableAndExpiryProvider:onboardingEligibilityDeterminer:featureSettingsAtOnboardingTimeValidator:loggingCategory:", v23, v22, v21, a6, v20, v29, v19, v18, v25, 0, v17);

  return v26;
}

- (HDFeatureAvailabilityManager)initWithProfile:(id)a3 featureIdentifier:(id)a4 availabilityRequirements:(id)a5 currentOnboardingVersion:(int64_t)a6 pairedDeviceCapability:(id)a7 pairedFeatureAttributesProvider:(id)a8 regionAvailabilityProvider:(id)a9 disableAndExpiryProvider:(id)a10 onboardingEligibilityDeterminer:(id)a11 featureSettingsAtOnboardingTimeValidator:(id)a12 loggingCategory:(id)a13
{
  id v17;
  id v18;
  void *v19;
  id v20;
  id v21;
  HDFeatureAvailabilityManager *v22;
  HDFeatureAvailabilityManager *v23;
  void *v24;
  uint64_t v25;
  HDPairedDeviceCapabilityProviding *pairedDeviceCapabilityProvider;
  HKFeatureAvailabilityRequirementSet *v27;
  HKFeatureAvailabilityRequirementSet *requirements;
  id v29;
  void *v30;
  uint64_t v31;
  HKObserverSet *observers;
  uint64_t v33;
  OS_dispatch_queue *queue;
  id obj;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  objc_super v46;

  v17 = a3;
  obj = a4;
  v18 = a4;
  v19 = v17;
  v44 = v18;
  v20 = a5;
  v43 = a7;
  v42 = a8;
  v41 = a9;
  v40 = a10;
  v39 = a11;
  v21 = a12;
  v45 = a13;
  v46.receiver = self;
  v46.super_class = (Class)HDFeatureAvailabilityManager;
  v22 = -[HDFeatureAvailabilityManager init](&v46, sel_init);
  v23 = v22;
  if (v22)
  {
    objc_storeWeak((id *)&v22->_profile, v17);
    objc_storeStrong((id *)&v23->_loggingCategory, a13);
    objc_storeStrong((id *)&v23->_featureIdentifier, obj);
    v23->_currentOnboardingVersion = a6;
    objc_storeStrong((id *)&v23->_pairedDeviceCapability, a7);
    objc_msgSend(v17, "daemon");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "nanoRegistryDeviceCapabilityProvider");
    v25 = objc_claimAutoreleasedReturnValue();
    pairedDeviceCapabilityProvider = v23->_pairedDeviceCapabilityProvider;
    v23->_pairedDeviceCapabilityProvider = (HDPairedDeviceCapabilityProviding *)v25;

    objc_storeStrong((id *)&v23->_pairedFeatureAttributesProvider, a8);
    objc_storeStrong((id *)&v23->_regionAvailabilityProvider, a9);
    objc_storeStrong((id *)&v23->_disableAndExpiryProvider, a10);
    objc_storeStrong((id *)&v23->_onboardingEligibilityDeterminer, a11);
    if (v20)
    {
      v27 = (HKFeatureAvailabilityRequirementSet *)v20;
    }
    else
    {
      v20 = 0;
      objc_msgSend(MEMORY[0x1E0CB66F0], "noRequirements");
      v27 = (HKFeatureAvailabilityRequirementSet *)objc_claimAutoreleasedReturnValue();
    }
    requirements = v23->_requirements;
    v23->_requirements = v27;

    v29 = objc_alloc(MEMORY[0x1E0CB6988]);
    -[HDFeatureAvailabilityManager description](v23, "description");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v29, "initWithName:loggingCategory:", v30, v45);
    observers = v23->_observers;
    v23->_observers = (HKObserverSet *)v31;

    HKCreateSerialDispatchQueue();
    v33 = objc_claimAutoreleasedReturnValue();
    queue = v23->_queue;
    v23->_queue = (OS_dispatch_queue *)v33;

    -[HDPairedDeviceCapabilityProviding registerObserver:queue:](v23->_pairedDeviceCapabilityProvider, "registerObserver:queue:", v23, v23->_queue);
    -[HDFeatureDisableAndExpiryProviding setDelegate:](v23->_disableAndExpiryProvider, "setDelegate:", v23);
    if (-[HDRegionAvailabilityProviding conformsToProtocol:](v23->_regionAvailabilityProvider, "conformsToProtocol:", &unk_1EF1A5F20))-[HDRegionAvailabilityProviding setDelegate:](v23->_regionAvailabilityProvider, "setDelegate:", v23);
    objc_storeStrong((id *)&v23->_featureSettingsAtOnboardingTimeValidator, a12);
  }

  return v23;
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@:%@"), objc_opt_class(), self->_featureIdentifier);
}

- (void)dealloc
{
  HDProfile **p_profile;
  id WeakRetained;
  void *v5;
  id v6;
  void *v7;
  objc_super v8;

  p_profile = &self->_profile;
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "featureSettingsManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unregisterObserver:", self);

  v6 = objc_loadWeakRetained((id *)p_profile);
  objc_msgSend(v6, "onboardingCompletionManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "unregisterObserver:", self);

  v8.receiver = self;
  v8.super_class = (Class)HDFeatureAvailabilityManager;
  -[HDFeatureAvailabilityManager dealloc](&v8, sel_dealloc);
}

- (id)featureOnboardingRecordWithError:(id *)a3
{
  HDFeatureAvailabilityManager *v4;
  void *v5;
  HDFeatureAvailabilityManager *v6;
  HDFeatureAvailabilityManager *v7;
  uint64_t v8;
  void *v9;
  id WeakRetained;
  void *v11;
  NSString *featureIdentifier;
  void *v13;
  id v14;
  HDFeatureAvailabilityManager *v15;
  NSObject *loggingCategory;
  HDFeatureAvailabilityManager *v17;
  id v19;
  id v20;
  uint8_t buf[4];
  HDFeatureAvailabilityManager *v22;
  __int16 v23;
  HDFeatureAvailabilityManager *v24;
  uint64_t v25;

  v4 = self;
  v25 = *MEMORY[0x1E0C80C00];
  v19 = 0;
  -[HDFeatureAvailabilityManager _onboardingCompletionsByStateWithError:]((uint64_t)self, &v19);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (HDFeatureAvailabilityManager *)v19;
  v7 = v6;
  if (v5)
  {
    v8 = -[HDFeatureAvailabilityManager _onboardedCountryCodeSupportedStateFromOnboardingCompletionsByState:]((uint64_t)v4, v5);
    if (v8 == 1)
    {
      v4 = 0;
LABEL_16:
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB6718]), "initWithOnboardingState:onboardingCompletionsByState:featureSettings:", v8, v5, v4);
      goto LABEL_21;
    }
    if (v4)
    {
      WeakRetained = objc_loadWeakRetained((id *)&v4->_profile);
      objc_msgSend(WeakRetained, "featureSettingsManager");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      featureIdentifier = v4->_featureIdentifier;
      v20 = 0;
      objc_msgSend(v11, "featureSettingsForFeatureIdentifier:error:", featureIdentifier, &v20);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v20;

      if (v14)
      {
        v15 = (HDFeatureAvailabilityManager *)objc_retainAutorelease(v14);
        _HKInitializeLogging();
        loggingCategory = v4->_loggingCategory;
        if (os_log_type_enabled(loggingCategory, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          v22 = v4;
          v23 = 2114;
          v24 = v15;
          _os_log_error_impl(&dword_1B7802000, loggingCategory, OS_LOG_TYPE_ERROR, "[%{public}@] Failed to get keys/values out of feature settings domain: %{public}@", buf, 0x16u);
        }
        v4 = 0;
      }
      else
      {
        v4 = v13;
        v15 = v7;
      }

    }
    else
    {
      v15 = v7;
    }
    v17 = v15;

    if (v4)
    {
      v7 = v17;
      goto LABEL_16;
    }
    v4 = v17;
    if (v4)
    {
      if (!a3)
        goto LABEL_19;
      goto LABEL_6;
    }
LABEL_20:
    v7 = 0;
    v9 = 0;
    goto LABEL_21;
  }
  v4 = v6;
  if (!v4)
    goto LABEL_20;
  if (!a3)
  {
LABEL_19:
    _HKLogDroppedError();
    v9 = 0;
    v7 = v4;
    goto LABEL_21;
  }
LABEL_6:
  v4 = objc_retainAutorelease(v4);
  v9 = 0;
  *a3 = v4;
  v7 = v4;
LABEL_21:

  return v9;
}

- (id)_onboardingCompletionsByStateWithError:(uint64_t)a1
{
  id WeakRetained;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  id v39;
  id v41;
  void *v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  id v47;
  id v48;
  _BYTE v49[128];
  _QWORD v50[4];
  _QWORD v51[4];
  uint8_t buf[4];
  uint64_t v53;
  __int16 v54;
  id v55;
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
    objc_msgSend(WeakRetained, "onboardingCompletionManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 24);
    v48 = 0;
    objc_msgSend(v5, "onboardingCompletionsForHighestVersionOfFeatureIdentifier:error:", v6, &v48);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v48;

    if (v7)
    {
      v9 = v7;
      v10 = 0;
    }
    else
    {
      _HKInitializeLogging();
      v11 = *(NSObject **)(a1 + 16);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        v53 = a1;
        v54 = 2114;
        v55 = v8;
        _os_log_error_impl(&dword_1B7802000, v11, OS_LOG_TYPE_ERROR, "[%{public}@] Failed to fetch highest version of onboarding completed: %{public}@", buf, 0x16u);
      }
      v12 = v8;
      v10 = v12;
      if (v12)
        v13 = objc_retainAutorelease(v12);

    }
    v14 = v10;
    v15 = v14;
    if (!v7)
    {
      v38 = v14;
      v17 = v38;
      if (v38)
      {
        if (a2)
        {
          v17 = objc_retainAutorelease(v38);
          v37 = 0;
          *a2 = v17;
        }
        else
        {
          _HKLogDroppedError();
          v37 = 0;
        }
        v18 = v17;
      }
      else
      {
        v18 = 0;
        v37 = 0;
      }
      goto LABEL_31;
    }
    v16 = *(void **)(a1 + 88);
    v47 = v15;
    objc_msgSend(v16, "onboardingEligibilitiesForOnboardingCompletions:error:", v7, &v47);
    v17 = (id)objc_claimAutoreleasedReturnValue();
    v18 = v47;

    if (v17)
    {
      v41 = v18;
      v42 = v7;
      v19 = (void *)MEMORY[0x1E0C99E08];
      v50[0] = &unk_1E6DFADC0;
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v51[0] = v20;
      v50[1] = &unk_1E6DFAE08;
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v51[1] = v21;
      v50[2] = &unk_1E6DFADF0;
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v51[2] = v22;
      v50[3] = &unk_1E6DFADD8;
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v51[3] = v23;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v51, v50, 4);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "dictionaryWithDictionary:", v24);
      v25 = (id)objc_claimAutoreleasedReturnValue();

      v45 = 0u;
      v46 = 0u;
      v43 = 0u;
      v44 = 0u;
      v26 = v17;
      v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v43, v49, 16);
      if (v27)
      {
        v28 = v27;
        v29 = *(_QWORD *)v44;
        do
        {
          for (i = 0; i != v28; ++i)
          {
            if (*(_QWORD *)v44 != v29)
              objc_enumerationMutation(v26);
            v31 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * i);
            v32 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend(v31, "onboardingEligibility");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v32, "numberWithInteger:", objc_msgSend(v33, "onboardedCountrySupportedState"));
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "objectForKeyedSubscript:", v34);
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "onboardingCompletion");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v35, "addObject:", v36);

          }
          v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v43, v49, 16);
        }
        while (v28);
      }

      objc_msgSend(v25, "hk_map:", &__block_literal_global_68);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v42;
      v18 = v41;
      goto LABEL_30;
    }
    v39 = v18;
    v25 = v39;
    if (v39)
    {
      if (a2)
      {
        v25 = objc_retainAutorelease(v39);
        v37 = 0;
        *a2 = v25;
LABEL_30:

LABEL_31:
        return v37;
      }
      _HKLogDroppedError();
    }
    v37 = 0;
    goto LABEL_30;
  }
  return 0;
}

- (uint64_t)_onboardedCountryCodeSupportedStateFromOnboardingCompletionsByState:(uint64_t)a1
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  uint64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (a1)
  {
    if (objc_msgSend(v3, "count"))
    {
      v15 = 0u;
      v16 = 0u;
      v13 = 0u;
      v14 = 0u;
      v5 = objc_msgSend(&unk_1E6DF8DE0, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v5)
      {
        v6 = v5;
        v7 = *(_QWORD *)v14;
        a1 = 3;
        while (2)
        {
          for (i = 0; i != v6; ++i)
          {
            if (*(_QWORD *)v14 != v7)
              objc_enumerationMutation(&unk_1E6DF8DE0);
            v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
            objc_msgSend(v4, "objectForKeyedSubscript:", v9);
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            v11 = objc_msgSend(v10, "count");

            if (v11)
            {
              a1 = objc_msgSend(v9, "integerValue");
              goto LABEL_15;
            }
          }
          v6 = objc_msgSend(&unk_1E6DF8DE0, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
          if (v6)
            continue;
          break;
        }
      }
      else
      {
        a1 = 3;
      }
    }
    else
    {
      a1 = 1;
    }
  }
LABEL_15:

  return a1;
}

- (void)getFeatureOnboardingRecordWithCompletion:(id)a3
{
  void (**v4)(id, void *, id);
  void *v5;
  id v6;
  id v7;

  v7 = 0;
  v4 = (void (**)(id, void *, id))a3;
  -[HDFeatureAvailabilityManager featureOnboardingRecordWithError:](self, "featureOnboardingRecordWithError:", &v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v7;
  v4[2](v4, v5, v6);

}

- (id)isCurrentOnboardingVersionCompletedWithError:(id *)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v10;

  v10 = 0;
  -[HDFeatureAvailabilityManager onboardedCountryCodeSupportedStateWithError:](self, "onboardedCountryCodeSupportedStateWithError:", &v10);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v10;
  v6 = v5;
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v4, "isEqual:", &unk_1E6DFADC0));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = v5;
    if (v8)
    {
      if (a3)
        *a3 = objc_retainAutorelease(v8);
      else
        _HKLogDroppedError();
    }

    v7 = 0;
  }

  return v7;
}

- (void)isCurrentOnboardingVersionCompletedWithCompletion:(id)a3
{
  void (**v4)(id, void *, id);
  void *v5;
  id v6;
  id v7;

  v7 = 0;
  v4 = (void (**)(id, void *, id))a3;
  -[HDFeatureAvailabilityManager isCurrentOnboardingVersionCompletedWithError:](self, "isCurrentOnboardingVersionCompletedWithError:", &v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v7;
  v4[2](v4, v5, v6);

}

- (id)earliestDateLowestOnboardingVersionCompletedWithError:(id *)a3
{
  id WeakRetained;
  void *v6;
  NSString *featureIdentifier;
  void *v8;
  id v9;
  id v10;
  void *v11;
  NSObject *loggingCategory;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  NSObject *v27;
  _BOOL4 v28;
  NSObject *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  NSObject *v33;
  void *v34;
  void *v35;
  int v36;
  NSObject *v37;
  void *v38;
  id v39;
  NSObject *v40;
  id *v42;
  void *v43;
  id obj;
  id v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  id v50;
  uint8_t v51[128];
  uint8_t buf[4];
  HDFeatureAvailabilityManager *v53;
  __int16 v54;
  id v55;
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  if (self)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
    objc_msgSend(WeakRetained, "onboardingCompletionManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    featureIdentifier = self->_featureIdentifier;
    v50 = 0;
    objc_msgSend(v6, "onboardingCompletionsForLowestVersionOfFeatureIdentifier:error:", featureIdentifier, &v50);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v50;

    if (v8)
    {
      v10 = v8;
      v11 = 0;
    }
    else
    {
      _HKInitializeLogging();
      loggingCategory = self->_loggingCategory;
      if (os_log_type_enabled(loggingCategory, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        v53 = self;
        v54 = 2114;
        v55 = v9;
        _os_log_error_impl(&dword_1B7802000, loggingCategory, OS_LOG_TYPE_ERROR, "[%{public}@] Failed to fetch lowest version of onboarding completed: %{public}@", buf, 0x16u);
      }
      v13 = v9;
      v11 = v13;
      if (v13)
        v14 = objc_retainAutorelease(v13);

    }
  }
  else
  {
    v11 = 0;
    v8 = 0;
  }
  v15 = v11;
  v16 = v15;
  if (!v8)
  {
    v16 = v15;
    if (v16)
    {
      if (a3)
        *a3 = objc_retainAutorelease(v16);
      else
        _HKLogDroppedError();
    }

    goto LABEL_40;
  }
  if (!objc_msgSend(v8, "count"))
  {
    _HKInitializeLogging();
    v40 = self->_loggingCategory;
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v53 = self;
      _os_log_impl(&dword_1B7802000, v40, OS_LOG_TYPE_DEFAULT, "[%{public}@] No onboarding completion found", buf, 0xCu);
    }
LABEL_40:
    v38 = 0;
    goto LABEL_46;
  }
  objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v43 = v8;
  obj = v8;
  v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
  if (v18)
  {
    v19 = v18;
    v42 = a3;
    v20 = *(_QWORD *)v47;
    while (2)
    {
      for (i = 0; i != v19; ++i)
      {
        v22 = v16;
        if (*(_QWORD *)v47 != v20)
          objc_enumerationMutation(obj);
        v23 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * i);
        objc_msgSend(v23, "countryCode", v42);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = v16;
        -[HDFeatureAvailabilityManager onboardingEligibilityForCountryCode:error:](self, "onboardingEligibilityForCountryCode:error:", v24, &v45);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = v45;

        if (!v25)
        {
          v39 = v16;
          v16 = v39;
          v8 = v43;
          if (v39)
          {
            if (v42)
              *v42 = objc_retainAutorelease(v39);
            else
              _HKLogDroppedError();
          }

          v38 = 0;
          goto LABEL_45;
        }
        v26 = objc_msgSend(v25, "isEligible");
        _HKInitializeLogging();
        v27 = self->_loggingCategory;
        v28 = os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT);
        if (v26)
        {
          if (v28)
          {
            v29 = v27;
            HKSensitiveLogItem();
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v53 = self;
            v54 = 2114;
            v55 = v30;
            _os_log_impl(&dword_1B7802000, v29, OS_LOG_TYPE_DEFAULT, "[%{public}@] Onboarding completion found with supported country code: %{public}@", buf, 0x16u);

          }
          objc_msgSend(v23, "completionDate");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "earlierDate:", v31);
          v32 = objc_claimAutoreleasedReturnValue();

          v17 = (id)v32;
        }
        else if (v28)
        {
          v33 = v27;
          HKSensitiveLogItem();
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v53 = self;
          v54 = 2114;
          v55 = v34;
          _os_log_impl(&dword_1B7802000, v33, OS_LOG_TYPE_DEFAULT, "[%{public}@] Onboarding completion found with unsupported country code: %{public}@", buf, 0x16u);

        }
      }
      v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
      if (v19)
        continue;
      break;
    }
  }

  objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = objc_msgSend(v17, "isEqualToDate:", v35);

  if (v36)
  {
    _HKInitializeLogging();
    v37 = self->_loggingCategory;
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v53 = self;
      _os_log_impl(&dword_1B7802000, v37, OS_LOG_TYPE_DEFAULT, "[%{public}@] No onboarding completions meet the current requirements", buf, 0xCu);
    }
    v38 = 0;
  }
  else
  {
    v17 = v17;
    v38 = v17;
  }
  v8 = v43;
LABEL_45:

LABEL_46:
  return v38;
}

- (id)canCompleteOnboardingForCountryCode:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  NSObject *loggingCategory;
  id v11;
  id v13;
  uint8_t buf[4];
  HDFeatureAvailabilityManager *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v13 = 0;
  -[HDFeatureAvailabilityManager onboardingEligibilityForCountryCode:error:](self, "onboardingEligibilityForCountryCode:error:", v6, &v13);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v13;
  if (!v7)
  {
    _HKInitializeLogging();
    loggingCategory = self->_loggingCategory;
    if (os_log_type_enabled(loggingCategory, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v15 = self;
      v16 = 2114;
      v17 = v8;
      _os_log_error_impl(&dword_1B7802000, loggingCategory, OS_LOG_TYPE_ERROR, "[%{public}@] Failed to determine onboarding eligibility: %{public}@", buf, 0x16u);
      if (v8)
        goto LABEL_5;
    }
    else if (v8)
    {
LABEL_5:
      v11 = v8;
      goto LABEL_8;
    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:format:", 100, CFSTR("Unexpected failure when evaluating eligibility for %@"), v6);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    if (!v11)
    {
LABEL_12:

LABEL_13:
      v9 = 0;
      goto LABEL_14;
    }
LABEL_8:
    if (a4)
      *a4 = objc_retainAutorelease(v11);
    else
      _HKLogDroppedError();

    if (v8)
      goto LABEL_13;
    goto LABEL_12;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v7, "isEligible"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_14:

  return v9;
}

- (id)onboardingEligibilityForCountryCode:(id)a3 error:(id *)a4
{
  return -[HDFeatureAvailabilityOnboardingEligibilityDeterminer onboardingEligibilityForCountryCode:error:](self->_onboardingEligibilityDeterminer, "onboardingEligibilityForCountryCode:error:", a3, a4);
}

void __71__HDFeatureAvailabilityManager__onboardingCompletionsByStateWithError___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v6;
  void (**v7)(id, id, void *);
  void *v8;
  id v9;

  v9 = a2;
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, v9, v8);

  }
}

- (id)onboardedCountryCodeSupportedStateWithError:(id *)a3
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v11;

  v11 = 0;
  -[HDFeatureAvailabilityManager _onboardingCompletionsByStateWithError:]((uint64_t)self, &v11);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v11;
  v7 = v6;
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[HDFeatureAvailabilityManager _onboardedCountryCodeSupportedStateFromOnboardingCompletionsByState:]((uint64_t)self, v5));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = v6;
    if (v9)
    {
      if (a3)
        *a3 = objc_retainAutorelease(v9);
      else
        _HKLogDroppedError();
    }

    v8 = 0;
  }

  return v8;
}

- (id)isFeatureCapabilitySupportedOnActivePairedDeviceWithError:(id *)a3
{
  HDPairedDeviceCapabilityProviding *pairedDeviceCapabilityProvider;
  NSUUID *pairedDeviceCapability;
  void *v7;

  pairedDeviceCapabilityProvider = self->_pairedDeviceCapabilityProvider;
  if (pairedDeviceCapabilityProvider && (pairedDeviceCapability = self->_pairedDeviceCapability) != 0)
  {
    -[HDPairedDeviceCapabilityProviding isCapabilitySupportedOnActivePairedDevice:error:](pairedDeviceCapabilityProvider, "isCapabilitySupportedOnActivePairedDevice:error:", pairedDeviceCapability, a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = (void *)MEMORY[0x1E0C9AAA0];
  }
  return v7;
}

- (id)pairedFeatureAttributesWithError:(id *)a3
{
  return (id)-[HDPairedFeatureAttributesProviding currentPairedFeatureAttributes](self->_pairedFeatureAttributesProvider, "currentPairedFeatureAttributes", a3);
}

- (id)featureAvailabilityRequirementsWithError:(id *)a3
{
  return self->_requirements;
}

- (id)regionAvailabilityWithError:(id *)a3
{
  return (id)-[HDRegionAvailabilityProviding regionAvailability](self->_regionAvailabilityProvider, "regionAvailability", a3);
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
  int64_t currentOnboardingVersion;
  void *v20;
  void *v21;
  id v22;

  v22 = a3;
  v12 = a5;
  v13 = (objc_class *)MEMORY[0x1E0CB6990];
  v14 = a7;
  v15 = a6;
  v16 = [v13 alloc];
  v17 = v16;
  featureIdentifier = self->_featureIdentifier;
  currentOnboardingVersion = self->_currentOnboardingVersion;
  if (v12)
  {
    v20 = (void *)objc_msgSend(v16, "initWithFeatureIdentifier:version:completionDate:countryCode:countryCodeProvenance:", self->_featureIdentifier, self->_currentOnboardingVersion, v12, v22, a4);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_msgSend(v17, "initWithFeatureIdentifier:version:completionDate:countryCode:countryCodeProvenance:", featureIdentifier, currentOnboardingVersion, v21, v22, a4);

  }
  -[HDFeatureAvailabilityManager saveOnboardingCompletion:settings:completion:](self, "saveOnboardingCompletion:settings:completion:", v20, v15, v14);

}

- (void)saveOnboardingCompletion:(id)a3 settings:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, _QWORD, id);
  id v11;
  HDFeatureSettingsValidating *featureSettingsAtOnboardingTimeValidator;
  id v13;
  id v14;
  NSObject *loggingCategory;
  id v16;
  id v17;
  id WeakRetained;
  void *v19;
  id v20;
  id v21;
  _BOOL8 v22;
  NSObject *v23;
  id v24;
  id v25;
  _BYTE buf[24];
  void *v27;
  id v28;
  id v29;
  id v30;
  HDFeatureAvailabilityManager *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, _QWORD, id))a5;
  v11 = v9;
  featureSettingsAtOnboardingTimeValidator = self->_featureSettingsAtOnboardingTimeValidator;
  v13 = v11;
  if (featureSettingsAtOnboardingTimeValidator
    && (v25 = 0,
        -[HDFeatureSettingsValidating featureSettingsGivenBaseSettings:onboardingCompletion:error:](featureSettingsAtOnboardingTimeValidator, "featureSettingsGivenBaseSettings:onboardingCompletion:error:", v11, v8, &v25), v13 = (id)objc_claimAutoreleasedReturnValue(), v14 = v25, v11, v14))
  {
    _HKInitializeLogging();
    loggingCategory = self->_loggingCategory;
    if (os_log_type_enabled(loggingCategory, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = self;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v14;
      _os_log_error_impl(&dword_1B7802000, loggingCategory, OS_LOG_TYPE_ERROR, "[%{public}@] Feature settings failed validation: %{public}@", buf, 0x16u);
    }
    v10[2](v10, 0, v14);
  }
  else
  {
    v24 = 0;
    v16 = v8;
    v17 = v13;
    WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
    objc_msgSend(WeakRetained, "database");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)buf = MEMORY[0x1E0C809B0];
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = __88__HDFeatureAvailabilityManager__insertOnboardingCompletion_featureSettingsValues_error___block_invoke;
    v27 = &unk_1E6CF26F8;
    v13 = v17;
    v28 = v13;
    v29 = WeakRetained;
    v20 = v16;
    v30 = v20;
    v31 = self;
    v21 = WeakRetained;
    v22 = +[HDHealthEntity performWriteTransactionWithHealthDatabase:error:block:inaccessibilityHandler:](HDOnboardingCompletionEntity, "performWriteTransactionWithHealthDatabase:error:block:inaccessibilityHandler:", v19, &v24, buf, 0);

    v14 = v24;
    _HKInitializeLogging();
    v23 = self->_loggingCategory;
    if (v22)
    {
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        *(_QWORD *)&buf[4] = self;
        _os_log_impl(&dword_1B7802000, v23, OS_LOG_TYPE_DEFAULT, "[%{public}@] Did set current onboarding version completed with success", buf, 0xCu);
      }
      -[HDFeatureAvailabilityManager _triggerImmediateSyncWithReason:]((uint64_t)self, CFSTR("Onboarding completed"));
    }
    else if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = self;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v14;
      _os_log_error_impl(&dword_1B7802000, v23, OS_LOG_TYPE_ERROR, "[%{public}@] Failed to set current onboarding version completed: %{public}@", buf, 0x16u);
    }
    v10[2](v10, v22, v14);
  }

}

- (void)_triggerImmediateSyncWithReason:(uint64_t)a1
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  _QWORD v15[5];
  id v16;
  _QWORD v17[5];
  id v18;

  v3 = a2;
  if (a1)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
    objc_msgSend(WeakRetained, "nanoSyncManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[%@] %@"), a1, v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __64__HDFeatureAvailabilityManager__triggerImmediateSyncWithReason___block_invoke;
    v17[3] = &unk_1E6CEB718;
    v17[4] = a1;
    v7 = v3;
    v18 = v7;
    objc_msgSend(v5, "syncHealthDataWithOptions:reason:completion:", 0, v6, v17);

    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB6388]), "initWithPush:pull:lite:", 1, 0, 1);
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB6430]), "initWithChangesSyncRequest:", v8);
    v10 = objc_loadWeakRetained((id *)(a1 + 8));
    objc_msgSend(v10, "cloudSyncManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[%@] %@"), a1, v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __64__HDFeatureAvailabilityManager__triggerImmediateSyncWithReason___block_invoke_290;
    v15[3] = &unk_1E6CEB718;
    v15[4] = a1;
    v13 = v7;
    v16 = v13;
    objc_msgSend(v11, "syncWithRequest:reason:completion:", v9, v12, v15);

    v14 = *(_QWORD *)(a1 + 120);
    if (v14)
      (*(void (**)(uint64_t, id))(v14 + 16))(v14, v13);

  }
}

- (void)setFeatureSettingData:(id)a3 forKey:(id)a4 completion:(id)a5
{
  HDProfile **p_profile;
  void (**v9)(id, uint64_t, id);
  id v10;
  id v11;
  id WeakRetained;
  void *v13;
  NSString *featureIdentifier;
  uint64_t v15;
  id v16;
  NSObject *loggingCategory;
  id v18;
  uint8_t buf[4];
  HDFeatureAvailabilityManager *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  p_profile = &self->_profile;
  v9 = (void (**)(id, uint64_t, id))a5;
  v10 = a4;
  v11 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_profile);
  objc_msgSend(WeakRetained, "featureSettingsManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  featureIdentifier = self->_featureIdentifier;
  v18 = 0;
  v15 = objc_msgSend(v13, "setFeatureSettingsData:forKey:featureIdentifier:error:", v11, v10, featureIdentifier, &v18);

  v16 = v18;
  _HKInitializeLogging();
  loggingCategory = self->_loggingCategory;
  if ((v15 & 1) != 0)
  {
    if (os_log_type_enabled(loggingCategory, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v20 = self;
      _os_log_impl(&dword_1B7802000, loggingCategory, OS_LOG_TYPE_DEFAULT, "[%{public}@] Did set data for key in feature settings domain with success", buf, 0xCu);
    }
    -[HDFeatureAvailabilityManager _triggerImmediateSyncWithReason:]((uint64_t)self, CFSTR("Did set data for key"));
  }
  else if (os_log_type_enabled(loggingCategory, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543618;
    v20 = self;
    v21 = 2114;
    v22 = v16;
    _os_log_error_impl(&dword_1B7802000, loggingCategory, OS_LOG_TYPE_ERROR, "[%{public}@] Failed to set data for key in feature settings domain, with error: %{public}@", buf, 0x16u);
  }
  v9[2](v9, v15, v16);

}

- (void)setFeatureSettingNumber:(id)a3 forKey:(id)a4 completion:(id)a5
{
  HDProfile **p_profile;
  void (**v9)(id, uint64_t, id);
  id v10;
  id v11;
  id WeakRetained;
  void *v13;
  NSString *featureIdentifier;
  uint64_t v15;
  id v16;
  NSObject *loggingCategory;
  id v18;
  uint8_t buf[4];
  HDFeatureAvailabilityManager *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  p_profile = &self->_profile;
  v9 = (void (**)(id, uint64_t, id))a5;
  v10 = a4;
  v11 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_profile);
  objc_msgSend(WeakRetained, "featureSettingsManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  featureIdentifier = self->_featureIdentifier;
  v18 = 0;
  v15 = objc_msgSend(v13, "setFeatureSettingsNumber:forKey:featureIdentifier:suppressNotificationsToObserver:error:", v11, v10, featureIdentifier, 0, &v18);

  v16 = v18;
  _HKInitializeLogging();
  loggingCategory = self->_loggingCategory;
  if ((v15 & 1) != 0)
  {
    if (os_log_type_enabled(loggingCategory, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v20 = self;
      _os_log_impl(&dword_1B7802000, loggingCategory, OS_LOG_TYPE_DEFAULT, "[%{public}@] Did set number for key in feature settings domain with success", buf, 0xCu);
    }
    -[HDFeatureAvailabilityManager _triggerImmediateSyncWithReason:]((uint64_t)self, CFSTR("Did set number for key"));
  }
  else if (os_log_type_enabled(loggingCategory, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543618;
    v20 = self;
    v21 = 2114;
    v22 = v16;
    _os_log_error_impl(&dword_1B7802000, loggingCategory, OS_LOG_TYPE_ERROR, "[%{public}@] Failed to set number for key in feature settings domain, with error: %{public}@", buf, 0x16u);
  }
  v9[2](v9, v15, v16);

}

- (void)setFeatureSettingString:(id)a3 forKey:(id)a4 completion:(id)a5
{
  HDProfile **p_profile;
  void (**v9)(id, uint64_t, id);
  id v10;
  id v11;
  id WeakRetained;
  void *v13;
  NSString *featureIdentifier;
  uint64_t v15;
  id v16;
  NSObject *loggingCategory;
  id v18;
  uint8_t buf[4];
  HDFeatureAvailabilityManager *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  p_profile = &self->_profile;
  v9 = (void (**)(id, uint64_t, id))a5;
  v10 = a4;
  v11 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_profile);
  objc_msgSend(WeakRetained, "featureSettingsManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  featureIdentifier = self->_featureIdentifier;
  v18 = 0;
  v15 = objc_msgSend(v13, "setFeatureSettingsString:forKey:featureIdentifier:error:", v11, v10, featureIdentifier, &v18);

  v16 = v18;
  _HKInitializeLogging();
  loggingCategory = self->_loggingCategory;
  if ((v15 & 1) != 0)
  {
    if (os_log_type_enabled(loggingCategory, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v20 = self;
      _os_log_impl(&dword_1B7802000, loggingCategory, OS_LOG_TYPE_DEFAULT, "[%{public}@] Did set string for key in feature settings domain with success", buf, 0xCu);
    }
    -[HDFeatureAvailabilityManager _triggerImmediateSyncWithReason:]((uint64_t)self, CFSTR("Did set string for key"));
  }
  else if (os_log_type_enabled(loggingCategory, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543618;
    v20 = self;
    v21 = 2114;
    v22 = v16;
    _os_log_error_impl(&dword_1B7802000, loggingCategory, OS_LOG_TYPE_ERROR, "[%{public}@] Failed to set string for key in feature settings domain, with error: %{public}@", buf, 0x16u);
  }
  v9[2](v9, v15, v16);

}

- (void)removeFeatureSettingValueForKey:(id)a3 completion:(id)a4
{
  HDProfile **p_profile;
  void (**v7)(id, uint64_t, id);
  id v8;
  id WeakRetained;
  void *v10;
  NSString *featureIdentifier;
  uint64_t v12;
  id v13;
  NSObject *loggingCategory;
  id v15;
  uint8_t buf[4];
  HDFeatureAvailabilityManager *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  p_profile = &self->_profile;
  v7 = (void (**)(id, uint64_t, id))a4;
  v8 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_profile);
  objc_msgSend(WeakRetained, "featureSettingsManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  featureIdentifier = self->_featureIdentifier;
  v15 = 0;
  v12 = objc_msgSend(v10, "removeFeatureSettingsValueForKey:featureIdentifier:error:", v8, featureIdentifier, &v15);

  v13 = v15;
  _HKInitializeLogging();
  loggingCategory = self->_loggingCategory;
  if ((v12 & 1) != 0)
  {
    if (os_log_type_enabled(loggingCategory, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v17 = self;
      _os_log_impl(&dword_1B7802000, loggingCategory, OS_LOG_TYPE_DEFAULT, "[%{public}@] Did remove value for key in feature settings domain with success", buf, 0xCu);
    }
    -[HDFeatureAvailabilityManager _triggerImmediateSyncWithReason:]((uint64_t)self, CFSTR("Did remove setting for key"));
  }
  else if (os_log_type_enabled(loggingCategory, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543618;
    v17 = self;
    v18 = 2114;
    v19 = v13;
    _os_log_error_impl(&dword_1B7802000, loggingCategory, OS_LOG_TYPE_ERROR, "[%{public}@] Failed to remove value for key in feature settings domain, with error: %{public}@", buf, 0x16u);
  }
  v7[2](v7, v12, v13);

}

- (void)resetOnboardingWithCompletion:(id)a3
{
  HDProfile **p_profile;
  void (**v5)(id, _BOOL8, id);
  id WeakRetained;
  void *v7;
  id v8;
  _BOOL8 v9;
  id v10;
  NSObject *loggingCategory;
  _QWORD v12[4];
  id v13;
  HDFeatureAvailabilityManager *v14;
  id v15;
  uint8_t buf[4];
  HDFeatureAvailabilityManager *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  p_profile = &self->_profile;
  v5 = (void (**)(id, _BOOL8, id))a3;
  WeakRetained = objc_loadWeakRetained((id *)p_profile);
  objc_msgSend(WeakRetained, "database");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __62__HDFeatureAvailabilityManager_resetOnboardingWithCompletion___block_invoke;
  v12[3] = &unk_1E6CE7950;
  v8 = WeakRetained;
  v13 = v8;
  v14 = self;
  v9 = +[HDHealthEntity performWriteTransactionWithHealthDatabase:error:block:inaccessibilityHandler:](HDOnboardingCompletionEntity, "performWriteTransactionWithHealthDatabase:error:block:inaccessibilityHandler:", v7, &v15, v12, 0);
  v10 = v15;

  if (v9)
  {
    -[HDFeatureAvailabilityManager _triggerImmediateSyncWithReason:]((uint64_t)self, CFSTR("Onboarding reset"));
  }
  else
  {
    _HKInitializeLogging();
    loggingCategory = self->_loggingCategory;
    if (os_log_type_enabled(loggingCategory, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v17 = self;
      v18 = 2114;
      v19 = v10;
      _os_log_error_impl(&dword_1B7802000, loggingCategory, OS_LOG_TYPE_ERROR, "[%{public}@] Failed to reset onboarding: %{public}@", buf, 0x16u);
    }
  }
  v5[2](v5, v9, v10);

}

uint64_t __62__HDFeatureAvailabilityManager_resetOnboardingWithCompletion___block_invoke(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  id v9;
  void *v10;
  uint64_t v11;
  char v12;
  id v13;
  uint64_t v14;
  id v16;
  id v17;

  objc_msgSend(*(id *)(a1 + 32), "featureSettingsManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1 + 40);
  v7 = *(_QWORD *)(v6 + 24);
  v17 = 0;
  v8 = objc_msgSend(v5, "resetFeatureSettingsForFeatureIdentifier:suppressNotificationsToObserver:error:", v7, v6, &v17);
  v9 = v17;

  if ((v8 & 1) == 0)
  {
    v13 = v9;
    if (!v13)
    {
LABEL_10:

      v14 = 0;
      goto LABEL_11;
    }
    if (!a3)
    {
LABEL_9:
      _HKLogDroppedError();
      goto LABEL_10;
    }
LABEL_6:
    v13 = objc_retainAutorelease(v13);
    *a3 = v13;
    goto LABEL_10;
  }
  objc_msgSend(*(id *)(a1 + 32), "onboardingCompletionManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 24);
  v16 = v9;
  v12 = objc_msgSend(v10, "resetOnboardingCompletionsForFeature:error:", v11, &v16);
  v13 = v16;

  if ((v12 & 1) == 0)
  {
    v13 = v13;
    if (!v13)
      goto LABEL_10;
    if (!a3)
      goto LABEL_9;
    goto LABEL_6;
  }
  v14 = 1;
LABEL_11:

  return v14;
}

uint64_t __88__HDFeatureAvailabilityManager__insertOnboardingCompletion_featureSettingsValues_error___block_invoke(uint64_t a1, void *a2, _QWORD *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  char v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  id v18;
  id v19;

  v5 = a2;
  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(*(id *)(a1 + 40), "featureSettingsManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 48), "featureIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(a1 + 56);
    v19 = 0;
    v10 = objc_msgSend(v6, "setFeatureSettingsValues:featureIdentifier:suppressNotificationsToObserver:error:", v7, v8, v9, &v19);
    v11 = v19;

    if ((v10 & 1) == 0)
    {
      v12 = v11;
      if (!v12)
      {
LABEL_14:

        v16 = 0;
        goto LABEL_15;
      }
      if (a3)
      {
LABEL_5:
        v12 = objc_retainAutorelease(v12);
        *a3 = v12;
        goto LABEL_14;
      }
LABEL_13:
      _HKLogDroppedError();
      goto LABEL_14;
    }
  }
  else
  {
    v11 = 0;
  }
  objc_msgSend(*(id *)(a1 + 40), "onboardingCompletionManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = *(_QWORD *)(a1 + 48);
  v18 = v11;
  v15 = objc_msgSend(v13, "insertOnboardingCompletion:error:", v14, &v18);
  v12 = v18;

  if ((v15 & 1) == 0 && (!*(_QWORD *)(a1 + 32) || (objc_msgSend(v12, "hk_isDuplicateObjectError") & 1) == 0))
  {
    v12 = v12;
    if (!v12)
      goto LABEL_14;
    if (a3)
      goto LABEL_5;
    goto LABEL_13;
  }
  v16 = 1;
LABEL_15:

  return v16;
}

void __64__HDFeatureAvailabilityManager__triggerImmediateSyncWithReason___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  _HKInitializeLogging();
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(NSObject **)(v6 + 16);
  if (a2)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(_QWORD *)(a1 + 40);
      v10 = 138543618;
      v11 = v6;
      v12 = 2114;
      v13 = v8;
      _os_log_impl(&dword_1B7802000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] NanoSync completed after %{public}@", (uint8_t *)&v10, 0x16u);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    v9 = *(_QWORD *)(a1 + 40);
    v10 = 138543874;
    v11 = v6;
    v12 = 2114;
    v13 = v9;
    v14 = 2114;
    v15 = v5;
    _os_log_error_impl(&dword_1B7802000, v7, OS_LOG_TYPE_ERROR, "[%{public}@] NanoSync failed after %{public}@: %{public}@", (uint8_t *)&v10, 0x20u);
  }

}

void __64__HDFeatureAvailabilityManager__triggerImmediateSyncWithReason___block_invoke_290(uint64_t a1, int a2, void *a3)
{
  id v5;
  uint64_t v6;
  NSObject *v7;
  _BOOL4 v8;
  uint64_t v9;
  const char *v10;
  NSObject *v11;
  uint32_t v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  _HKInitializeLogging();
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(NSObject **)(v6 + 16);
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (a2)
  {
    if (v8)
    {
      v9 = *(_QWORD *)(a1 + 40);
      v14 = 138543618;
      v15 = v6;
      v16 = 2114;
      v17 = v9;
      v10 = "[%{public}@] Cloud sync request completed after %{public}@";
      v11 = v7;
      v12 = 22;
LABEL_6:
      _os_log_impl(&dword_1B7802000, v11, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v14, v12);
    }
  }
  else if (v8)
  {
    v13 = *(_QWORD *)(a1 + 40);
    v14 = 138543874;
    v15 = v6;
    v16 = 2114;
    v17 = v13;
    v18 = 2114;
    v19 = v5;
    v10 = "[%{public}@] Cloud sync request failed after %{public}@: %{public}@";
    v11 = v7;
    v12 = 32;
    goto LABEL_6;
  }

}

- (void)setCurrentOnboardingVersion:(int64_t)a3
{
  self->_currentOnboardingVersion = a3;
  -[HDFeatureAvailabilityOnboardingEligibilityDeterminer setCurrentOnboardingVersion:](self->_onboardingEligibilityDeterminer, "setCurrentOnboardingVersion:");
}

- (void)registerObserver:(id)a3 queue:(id)a4
{
  HDProfile **p_profile;
  id v7;
  id v8;
  id WeakRetained;
  HKObserverSet *observers;
  id v11;
  _QWORD v12[4];
  id v13;
  HDFeatureAvailabilityManager *v14;

  p_profile = &self->_profile;
  v7 = a4;
  v8 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_profile);
  observers = self->_observers;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __55__HDFeatureAvailabilityManager_registerObserver_queue___block_invoke;
  v12[3] = &unk_1E6CE8080;
  v13 = WeakRetained;
  v14 = self;
  v11 = WeakRetained;
  -[HKObserverSet registerObserver:queue:runIfFirstObserver:](observers, "registerObserver:queue:runIfFirstObserver:", v8, v7, v12);

}

void __55__HDFeatureAvailabilityManager_registerObserver_queue___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  char v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v11[5];
  uint8_t buf[4];
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "featureSettingsManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "registerObserver:featureIdentifier:queue:", *(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 40) + 24), *(_QWORD *)(*(_QWORD *)(a1 + 40) + 112));

  objc_msgSend(*(id *)(a1 + 32), "onboardingCompletionManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerObserver:featureIdentifier:queue:", *(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 40) + 24), *(_QWORD *)(*(_QWORD *)(a1 + 40) + 112));

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 48), "registerObserver:queue:", *(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 40) + 112));
  objc_msgSend(*(id *)(a1 + 32), "database");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isDataProtectedByFirstUnlockAvailable");

  if ((v5 & 1) == 0)
  {
    _HKInitializeLogging();
    v6 = *(_QWORD *)(a1 + 40);
    v7 = *(NSObject **)(v6 + 16);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v13 = v6;
      _os_log_impl(&dword_1B7802000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] First unlock has not occurred, registering to notify when it has", buf, 0xCu);
    }
    objc_msgSend(*(id *)(a1 + 32), "database");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(a1 + 40);
    v10 = *(_QWORD *)(v9 + 112);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __55__HDFeatureAvailabilityManager_registerObserver_queue___block_invoke_291;
    v11[3] = &unk_1E6CE80E8;
    v11[4] = v9;
    objc_msgSend(v8, "performWhenDataProtectedByFirstUnlockIsAvailableOnQueue:block:", v10, v11);

  }
}

uint64_t __55__HDFeatureAvailabilityManager_registerObserver_queue___block_invoke_291(uint64_t result)
{
  uint64_t v1;
  NSObject *v2;
  void *v3;
  __int128 v4;
  void (*v5)(uint64_t, void *);
  void *v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(result + 32);
  if (v1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(v1 + 112));
    _HKInitializeLogging();
    v2 = *(NSObject **)(v1 + 16);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(v4) = 138543362;
      *(_QWORD *)((char *)&v4 + 4) = v1;
      _os_log_impl(&dword_1B7802000, v2, OS_LOG_TYPE_DEFAULT, "[%{public}@] Notifying for first unlock", (uint8_t *)&v4, 0xCu);
    }
    v3 = *(void **)(v1 + 104);
    *(_QWORD *)&v4 = MEMORY[0x1E0C809B0];
    *((_QWORD *)&v4 + 1) = 3221225472;
    v5 = __76__HDFeatureAvailabilityManager__queue_dataProtectedByFirstUnlockIsAvailable__block_invoke;
    v6 = &unk_1E6CF3810;
    v7 = v1;
    return objc_msgSend(v3, "notifyObservers:", &v4);
  }
  return result;
}

- (void)unregisterObserver:(id)a3
{
  -[HKObserverSet unregisterObserver:](self->_observers, "unregisterObserver:", a3);
}

void __76__HDFeatureAvailabilityManager__queue_dataProtectedByFirstUnlockIsAvailable__block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(v3, "conformsToProtocol:", &unk_1EF1EA750))
    objc_msgSend(v3, "featureAvailabilityExtensionOnboardingCompletionDataDidBecomeAvailable:", *(_QWORD *)(a1 + 32));

}

- (void)onboardingCompletionManager:(id)a3 didUpdateOnboardingCompletionsForFeatureIdentifier:(id)a4
{
  NSObject *loggingCategory;
  void *v6;
  HKObserverSet *observers;
  NSObject *v8;
  void *v9;
  HKObserverSet *v10;
  _QWORD v11[5];
  uint8_t buf[4];
  HDFeatureAvailabilityManager *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  _HKInitializeLogging();
  loggingCategory = self->_loggingCategory;
  if (os_log_type_enabled(loggingCategory, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (void *)MEMORY[0x1E0CB37E8];
    observers = self->_observers;
    v8 = loggingCategory;
    objc_msgSend(v6, "numberWithUnsignedInteger:", -[HKObserverSet count](observers, "count"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v13 = self;
    v14 = 2112;
    v15 = v9;
    _os_log_impl(&dword_1B7802000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] Notifying %@ observers of onboarding completion update", buf, 0x16u);

  }
  v10 = self->_observers;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __111__HDFeatureAvailabilityManager_onboardingCompletionManager_didUpdateOnboardingCompletionsForFeatureIdentifier___block_invoke;
  v11[3] = &unk_1E6CF3810;
  v11[4] = self;
  -[HKObserverSet notifyObservers:](v10, "notifyObservers:", v11);
}

uint64_t __111__HDFeatureAvailabilityManager_onboardingCompletionManager_didUpdateOnboardingCompletionsForFeatureIdentifier___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "featureAvailabilityProvidingDidUpdateOnboardingCompletion:", *(_QWORD *)(a1 + 32));
}

- (void)featureSettingsManager:(id)a3 didUpdateSettingsForFeatureIdentifier:(id)a4
{
  NSObject *loggingCategory;
  void *v6;
  HKObserverSet *observers;
  NSObject *v8;
  void *v9;
  HKObserverSet *v10;
  _QWORD v11[5];
  uint8_t buf[4];
  HDFeatureAvailabilityManager *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  _HKInitializeLogging();
  loggingCategory = self->_loggingCategory;
  if (os_log_type_enabled(loggingCategory, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (void *)MEMORY[0x1E0CB37E8];
    observers = self->_observers;
    v8 = loggingCategory;
    objc_msgSend(v6, "numberWithUnsignedInteger:", -[HKObserverSet count](observers, "count"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v13 = self;
    v14 = 2112;
    v15 = v9;
    _os_log_impl(&dword_1B7802000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] Notifying %@ observers of feature settings update", buf, 0x16u);

  }
  v10 = self->_observers;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __93__HDFeatureAvailabilityManager_featureSettingsManager_didUpdateSettingsForFeatureIdentifier___block_invoke;
  v11[3] = &unk_1E6CF3810;
  v11[4] = self;
  -[HKObserverSet notifyObservers:](v10, "notifyObservers:", v11);
}

void __93__HDFeatureAvailabilityManager_featureSettingsManager_didUpdateSettingsForFeatureIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "featureAvailabilityProvidingDidUpdateSettings:", *(_QWORD *)(a1 + 32));

}

- (void)pairedDeviceCapabilitiesDidUpdate:(id)a3
{
  NSObject *loggingCategory;
  void *v5;
  HKObserverSet *observers;
  NSObject *v7;
  void *v8;
  HKObserverSet *v9;
  _QWORD v10[5];
  uint8_t buf[4];
  HDFeatureAvailabilityManager *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  _HKInitializeLogging();
  loggingCategory = self->_loggingCategory;
  if (os_log_type_enabled(loggingCategory, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (void *)MEMORY[0x1E0CB37E8];
    observers = self->_observers;
    v7 = loggingCategory;
    objc_msgSend(v5, "numberWithUnsignedInteger:", -[HKObserverSet count](observers, "count"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v12 = self;
    v13 = 2112;
    v14 = v8;
    _os_log_impl(&dword_1B7802000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] Notifying %@ observers of paired device capability update", buf, 0x16u);

  }
  v9 = self->_observers;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __66__HDFeatureAvailabilityManager_pairedDeviceCapabilitiesDidUpdate___block_invoke;
  v10[3] = &unk_1E6CF3810;
  v10[4] = self;
  -[HKObserverSet notifyObservers:](v9, "notifyObservers:", v10);
}

void __66__HDFeatureAvailabilityManager_pairedDeviceCapabilitiesDidUpdate___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "featureAvailabilityProvidingDidUpdatePairedDeviceCapability:", *(_QWORD *)(a1 + 32));

}

- (void)regionAvailabilityProvidingDidUpdate:(id)a3
{
  NSObject *loggingCategory;
  void *v5;
  HKObserverSet *observers;
  NSObject *v7;
  void *v8;
  HKObserverSet *v9;
  _QWORD v10[5];
  uint8_t buf[4];
  HDFeatureAvailabilityManager *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  _HKInitializeLogging();
  loggingCategory = self->_loggingCategory;
  if (os_log_type_enabled(loggingCategory, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (void *)MEMORY[0x1E0CB37E8];
    observers = self->_observers;
    v7 = loggingCategory;
    objc_msgSend(v5, "numberWithUnsignedInteger:", -[HKObserverSet count](observers, "count"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v12 = self;
    v13 = 2112;
    v14 = v8;
    _os_log_impl(&dword_1B7802000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] Notifying %@ observers of region availability update", buf, 0x16u);

  }
  v9 = self->_observers;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __69__HDFeatureAvailabilityManager_regionAvailabilityProvidingDidUpdate___block_invoke;
  v10[3] = &unk_1E6CF3810;
  v10[4] = self;
  -[HKObserverSet notifyObservers:](v9, "notifyObservers:", v10);
}

void __69__HDFeatureAvailabilityManager_regionAvailabilityProvidingDidUpdate___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(v3, "conformsToProtocol:", &unk_1EF1EA750))
    objc_msgSend(v3, "featureAvailabilityExtensionDidUpdateRegionAvailability:", *(_QWORD *)(a1 + 32));

}

- (void)disableAndExpiryProviderDidUpdate:(id)a3
{
  NSObject *loggingCategory;
  void *v5;
  HKObserverSet *observers;
  NSObject *v7;
  void *v8;
  HKObserverSet *v9;
  _QWORD v10[5];
  uint8_t buf[4];
  HDFeatureAvailabilityManager *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  _HKInitializeLogging();
  loggingCategory = self->_loggingCategory;
  if (os_log_type_enabled(loggingCategory, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (void *)MEMORY[0x1E0CB37E8];
    observers = self->_observers;
    v7 = loggingCategory;
    objc_msgSend(v5, "numberWithUnsignedInteger:", -[HKObserverSet count](observers, "count"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v12 = self;
    v13 = 2112;
    v14 = v8;
    _os_log_impl(&dword_1B7802000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] Notifying %@ observers of disable and expiry update", buf, 0x16u);

  }
  v9 = self->_observers;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __66__HDFeatureAvailabilityManager_disableAndExpiryProviderDidUpdate___block_invoke;
  v10[3] = &unk_1E6CF3810;
  v10[4] = self;
  -[HKObserverSet notifyObservers:](v9, "notifyObservers:", v10);
}

uint64_t __66__HDFeatureAvailabilityManager_disableAndExpiryProviderDidUpdate___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "featureAvailabilityProvidingDidUpdateOnboardingCompletion:", *(_QWORD *)(a1 + 32));
}

- (NSString)featureIdentifier
{
  return self->_featureIdentifier;
}

- (int64_t)currentOnboardingVersion
{
  return self->_currentOnboardingVersion;
}

- (id)unitTest_didTriggerImmediateSync
{
  return objc_getProperty(self, a2, 120, 1);
}

- (void)setUnitTest_didTriggerImmediateSync:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 120);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_unitTest_didTriggerImmediateSync, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_requirements, 0);
  objc_storeStrong((id *)&self->_onboardingEligibilityDeterminer, 0);
  objc_storeStrong((id *)&self->_featureSettingsAtOnboardingTimeValidator, 0);
  objc_storeStrong((id *)&self->_disableAndExpiryProvider, 0);
  objc_storeStrong((id *)&self->_regionAvailabilityProvider, 0);
  objc_storeStrong((id *)&self->_pairedFeatureAttributesProvider, 0);
  objc_storeStrong((id *)&self->_pairedDeviceCapabilityProvider, 0);
  objc_storeStrong((id *)&self->_pairedDeviceCapability, 0);
  objc_storeStrong((id *)&self->_featureIdentifier, 0);
  objc_storeStrong((id *)&self->_loggingCategory, 0);
  objc_destroyWeak((id *)&self->_profile);
}

@end
