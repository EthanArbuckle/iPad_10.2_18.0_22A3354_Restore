@implementation HDFeatureAvailabilityOnboardingEligibilityDeterminer

- (HDFeatureAvailabilityOnboardingEligibilityDeterminer)initWithFeatureIdentifier:(id)a3 currentOnboardingVersion:(int64_t)a4 pairedDeviceCapability:(id)a5 pairedDeviceCapabilityProvider:(id)a6 regionAvailabilityProvider:(id)a7 disableAndExpiryProvider:(id)a8 loggingCategory:(id)a9
{
  id v15;
  id v16;
  id v17;
  HDFeatureAvailabilityOnboardingEligibilityDeterminer *v18;
  HDFeatureAvailabilityOnboardingEligibilityDeterminer *v19;
  id v22;
  id v23;
  id v24;
  objc_super v25;

  v24 = a3;
  v23 = a5;
  v22 = a6;
  v15 = a7;
  v16 = a8;
  v17 = a9;
  v25.receiver = self;
  v25.super_class = (Class)HDFeatureAvailabilityOnboardingEligibilityDeterminer;
  v18 = -[HDFeatureAvailabilityOnboardingEligibilityDeterminer init](&v25, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_featureIdentifier, a3);
    v19->_currentOnboardingVersion = a4;
    objc_storeStrong((id *)&v19->_pairedDeviceCapability, a5);
    objc_storeStrong((id *)&v19->_pairedDeviceCapabilityProvider, a6);
    objc_storeStrong((id *)&v19->_regionAvailabilityProvider, a7);
    objc_storeStrong((id *)&v19->_disableAndExpiryProvider, a8);
    objc_storeStrong((id *)&v19->_loggingCategory, a9);
  }

  return v19;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@:%@"), objc_opt_class(), self->_featureIdentifier);
}

- (id)onboardingEligibilityForCountryCode:(id)a3 error:(id *)a4
{
  HDRegionAvailabilityProviding *regionAvailabilityProvider;
  id v7;
  void *v8;
  HDFeatureDisableAndExpiryProviding *disableAndExpiryProvider;
  void *v10;
  id v11;
  void *v12;
  HDPairedDeviceCapabilityProviding *pairedDeviceCapabilityProvider;
  NSUUID *pairedDeviceCapability;
  void *v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  id v21;
  id v22;

  regionAvailabilityProvider = self->_regionAvailabilityProvider;
  v7 = a3;
  -[HDRegionAvailabilityProviding onboardingEligibilityForCountryCode:](regionAvailabilityProvider, "onboardingEligibilityForCountryCode:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  disableAndExpiryProvider = self->_disableAndExpiryProvider;
  v22 = 0;
  -[HDFeatureDisableAndExpiryProviding rescindedStatusOnActivePairedDeviceForCountryCode:error:](disableAndExpiryProvider, "rescindedStatusOnActivePairedDeviceForCountryCode:error:", v7, &v22);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = v22;
  v12 = v11;
  if (!v10)
  {
    if (v11)
    {
      v17 = v11;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:format:", 100, CFSTR("Failure when determining rescinded status, no error given"));
      v17 = (id)objc_claimAutoreleasedReturnValue();
      if (!v17)
        goto LABEL_26;
    }
    if (a4)
      *a4 = objc_retainAutorelease(v17);
    else
      _HKLogDroppedError();

    v18 = 0;
    v19 = 0;
    if (!v12)
      goto LABEL_21;
    goto LABEL_22;
  }
  pairedDeviceCapabilityProvider = self->_pairedDeviceCapabilityProvider;
  if (!pairedDeviceCapabilityProvider || (pairedDeviceCapability = self->_pairedDeviceCapability) == 0)
  {
    v17 = 0;
    v15 = 0;
LABEL_20:
    -[HDFeatureAvailabilityOnboardingEligibilityDeterminer _onboardingEligibilityForRegionEligibility:rescindedStatus:isCapabilitySupported:isActiveRemoteDevicePresent:](self, "_onboardingEligibilityForRegionEligibility:rescindedStatus:isCapabilitySupported:isActiveRemoteDevicePresent:", v8, v10, v15, v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = v12;
LABEL_21:

    v12 = v18;
    goto LABEL_22;
  }
  v21 = v12;
  -[HDPairedDeviceCapabilityProviding isCapabilitySupportedOnActivePairedDevice:error:](pairedDeviceCapabilityProvider, "isCapabilitySupportedOnActivePairedDevice:error:", pairedDeviceCapability, &v21);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v21;

  if (v15)
  {
    if ((objc_msgSend(v15, "BOOLValue") & 1) != 0)
    {
      v17 = (id)MEMORY[0x1E0C9AAB0];
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HDFeatureAvailabilityOnboardingEligibilityDeterminer _isActiveRemoteDevicePresent](self, "_isActiveRemoteDevicePresent"));
      v17 = (id)objc_claimAutoreleasedReturnValue();
    }
    v12 = v16;
    goto LABEL_20;
  }
  if (v16)
  {
    v17 = v16;
    goto LABEL_24;
  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:format:", 100, CFSTR("Failure when determining device capability support, no error given"));
  v17 = (id)objc_claimAutoreleasedReturnValue();
  if (!v17)
  {
LABEL_26:
    v18 = 0;
    v19 = 0;
    goto LABEL_21;
  }
LABEL_24:
  if (a4)
    *a4 = objc_retainAutorelease(v17);
  else
    _HKLogDroppedError();

  v18 = 0;
  v19 = 0;
  v12 = v16;
  if (!v16)
    goto LABEL_21;
LABEL_22:

  return v19;
}

- (id)onboardingEligibilityForDevice:(id)a3 countryCode:(id)a4 error:(id *)a5
{
  id v8;
  HDRegionAvailabilityProviding *regionAvailabilityProvider;
  id v10;
  void *v11;
  HDFeatureDisableAndExpiryProviding *disableAndExpiryProvider;
  void *v13;
  id v14;
  void *v15;
  HDPairedDeviceCapabilityProviding *pairedDeviceCapabilityProvider;
  id v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  id v22;

  v8 = a3;
  regionAvailabilityProvider = self->_regionAvailabilityProvider;
  v10 = a4;
  -[HDRegionAvailabilityProviding onboardingEligibilityForCountryCode:device:](regionAvailabilityProvider, "onboardingEligibilityForCountryCode:device:", v10, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  disableAndExpiryProvider = self->_disableAndExpiryProvider;
  v22 = 0;
  -[HDFeatureDisableAndExpiryProviding rescindedStatusForCountryCode:device:error:](disableAndExpiryProvider, "rescindedStatusForCountryCode:device:error:", v10, v8, &v22);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = v22;
  v15 = v14;
  if (v13)
  {
    pairedDeviceCapabilityProvider = self->_pairedDeviceCapabilityProvider;
    if (pairedDeviceCapabilityProvider && self->_pairedDeviceCapability)
    {
      if (v8)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HDPairedDeviceCapabilityProviding isCapabilitySupported:onDevice:](pairedDeviceCapabilityProvider, "isCapabilitySupported:onDevice:"));
        v17 = (id)objc_claimAutoreleasedReturnValue();
        v18 = MEMORY[0x1E0C9AAB0];
      }
      else
      {
        v18 = MEMORY[0x1E0C9AAA0];
        v17 = (id)MEMORY[0x1E0C9AAA0];
      }
    }
    else
    {
      v18 = 0;
      v17 = 0;
    }
    -[HDFeatureAvailabilityOnboardingEligibilityDeterminer _onboardingEligibilityForRegionEligibility:rescindedStatus:isCapabilitySupported:isActiveRemoteDevicePresent:](self, "_onboardingEligibilityForRegionEligibility:rescindedStatus:isCapabilitySupported:isActiveRemoteDevicePresent:", v11, v13, v17, v18);
    v19 = objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  if (v14)
  {
    v17 = v14;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:format:", 100, CFSTR("Failure when determining rescinded status, no error given"));
    v17 = (id)objc_claimAutoreleasedReturnValue();
    if (!v17)
    {
      v19 = 0;
LABEL_8:

      v20 = (void *)v19;
      goto LABEL_9;
    }
  }
  if (a5)
    *a5 = objc_retainAutorelease(v17);
  else
    _HKLogDroppedError();

  v19 = 0;
  v20 = 0;
  if (!v15)
    goto LABEL_8;
LABEL_9:

  return v20;
}

- (id)_onboardingEligibilityForRegionEligibility:(id)a3 rescindedStatus:(id)a4 isCapabilitySupported:(id)a5 isActiveRemoteDevicePresent:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;

  v10 = a5;
  v11 = a6;
  v12 = a4;
  v13 = a3;
  v14 = objc_msgSend(v13, "ineligibilityReasons");
  v15 = objc_msgSend(v12, "integerValue");

  v16 = v14 | 0x80;
  if (v15 != 2)
    v16 = v14;
  if (v15 == 1)
    v17 = v14 | 0x40;
  else
    v17 = v16;
  if (v11 && !objc_msgSend(v11, "BOOLValue"))
    v17 |= 2uLL;
  if (v10 && !objc_msgSend(v10, "BOOLValue"))
    v17 |= 4uLL;
  v18 = objc_alloc(MEMORY[0x1E0CB66D0]);
  objc_msgSend(v13, "countryAvailabilityVersion");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = (void *)objc_msgSend(v18, "initWithIneligibilityReasons:countryAvailabilityVersion:", v17, v19);
  objc_msgSend(v20, "eligibilityRespectingOverridesForFeatureIdentifier:", self->_featureIdentifier);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

- (id)onboardingEligibilitiesForOnboardingCompletions:(id)a3 error:(id *)a4
{
  _QWORD v5[5];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __110__HDFeatureAvailabilityOnboardingEligibilityDeterminer_onboardingEligibilitiesForOnboardingCompletions_error___block_invoke;
  v5[3] = &unk_1E6D036A0;
  v5[4] = self;
  -[HDFeatureAvailabilityOnboardingEligibilityDeterminer _onboardingEligibilitiesForOnboardingCompletions:onboardingEligibilityRetrievalBlock:error:](self, "_onboardingEligibilitiesForOnboardingCompletions:onboardingEligibilityRetrievalBlock:error:", a3, v5, a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t __110__HDFeatureAvailabilityOnboardingEligibilityDeterminer_onboardingEligibilitiesForOnboardingCompletions_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "onboardingEligibilityForCountryCode:error:", a2, a3);
}

- (id)onboardingEligibilitiesForDevice:(id)a3 onboardingCompletions:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  _QWORD v12[5];
  id v13;

  v8 = a3;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __117__HDFeatureAvailabilityOnboardingEligibilityDeterminer_onboardingEligibilitiesForDevice_onboardingCompletions_error___block_invoke;
  v12[3] = &unk_1E6D036C8;
  v12[4] = self;
  v13 = v8;
  v9 = v8;
  -[HDFeatureAvailabilityOnboardingEligibilityDeterminer _onboardingEligibilitiesForOnboardingCompletions:onboardingEligibilityRetrievalBlock:error:](self, "_onboardingEligibilitiesForOnboardingCompletions:onboardingEligibilityRetrievalBlock:error:", a4, v12, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

uint64_t __117__HDFeatureAvailabilityOnboardingEligibilityDeterminer_onboardingEligibilitiesForDevice_onboardingCompletions_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "onboardingEligibilityForDevice:countryCode:error:", *(_QWORD *)(a1 + 40), a2, a3);
}

- (id)_onboardingEligibilitiesForOnboardingCompletions:(id)a3 onboardingEligibilityRetrievalBlock:(id)a4 error:(id *)a5
{
  id v8;
  void (**v9)(id, void *, id *);
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  NSObject *v23;
  NSObject *loggingCategory;
  id v25;
  void *v26;
  id *v28;
  id v29;
  id obj;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint8_t buf[4];
  HDFeatureAvailabilityOnboardingEligibilityDeterminer *v37;
  __int16 v38;
  id v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = (void (**)(id, void *, id *))a4;
  if (objc_msgSend(v8, "count"))
  {
    v28 = a5;
    v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v29 = v8;
    obj = v8;
    v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v33;
LABEL_4:
      v14 = 0;
      while (1)
      {
        if (*(_QWORD *)v33 != v13)
          objc_enumerationMutation(obj);
        v15 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * v14);
        if (objc_msgSend(v15, "version") >= self->_currentOnboardingVersion)
        {
          v17 = v10;
          objc_msgSend(v15, "countryCode");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = 0;
          v9[2](v9, v18, &v31);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = v31;

          if (!v19)
          {
            _HKInitializeLogging();
            loggingCategory = self->_loggingCategory;
            v10 = v17;
            if (os_log_type_enabled(loggingCategory, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543618;
              v37 = self;
              v38 = 2114;
              v39 = v20;
              _os_log_error_impl(&dword_1B7802000, loggingCategory, OS_LOG_TYPE_ERROR, "[%{public}@] Failed to determine onboarding eligibility: %{public}@", buf, 0x16u);
            }
            v8 = v29;
            if (v20)
            {
              v25 = v20;
              goto LABEL_23;
            }
            v26 = (void *)MEMORY[0x1E0CB35C8];
            objc_msgSend(v15, "countryCode");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "hk_error:format:", 100, CFSTR("Unexpected failure when evaluating eligibility for %@"), v15);
            v25 = (id)objc_claimAutoreleasedReturnValue();
            if (v25)
            {
LABEL_23:
              if (v28)
                *v28 = objc_retainAutorelease(v25);
              else
                _HKLogDroppedError();

              if (!v20)
                goto LABEL_27;
            }
            else
            {
LABEL_27:

            }
            v22 = 0;
            goto LABEL_29;
          }
          v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB66C8]), "initWithOnboardingCompletion:onboardingEligibility:", v15, v19);
          v10 = v17;
          objc_msgSend(v17, "addObject:", v21);

        }
        else
        {
          _HKInitializeLogging();
          v16 = self->_loggingCategory;
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            v37 = self;
            _os_log_impl(&dword_1B7802000, v16, OS_LOG_TYPE_DEFAULT, "[%{public}@] Onboarding completion found with older version than current", buf, 0xCu);
          }
        }
        if (v12 == ++v14)
        {
          v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
          if (v12)
            goto LABEL_4;
          break;
        }
      }
    }

    v22 = v10;
    v8 = v29;
LABEL_29:

  }
  else
  {
    _HKInitializeLogging();
    v23 = self->_loggingCategory;
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v37 = self;
      _os_log_impl(&dword_1B7802000, v23, OS_LOG_TYPE_DEFAULT, "[%{public}@] No onboarding completion found", buf, 0xCu);
    }
    v22 = (id)MEMORY[0x1E0C9AA60];
  }

  return v22;
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

- (int64_t)currentOnboardingVersion
{
  return self->_currentOnboardingVersion;
}

- (void)setCurrentOnboardingVersion:(int64_t)a3
{
  self->_currentOnboardingVersion = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loggingCategory, 0);
  objc_storeStrong((id *)&self->_disableAndExpiryProvider, 0);
  objc_storeStrong((id *)&self->_regionAvailabilityProvider, 0);
  objc_storeStrong((id *)&self->_pairedFeatureAttributesProvider, 0);
  objc_storeStrong((id *)&self->_pairedDeviceCapabilityProvider, 0);
  objc_storeStrong((id *)&self->_pairedDeviceCapability, 0);
  objc_storeStrong((id *)&self->_featureIdentifier, 0);
}

@end
