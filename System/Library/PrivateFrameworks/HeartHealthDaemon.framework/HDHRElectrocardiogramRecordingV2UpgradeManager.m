@implementation HDHRElectrocardiogramRecordingV2UpgradeManager

- (HDHRElectrocardiogramRecordingV2UpgradeManager)initWithProfile:(id)a3 v1FeatureAvailabilityManager:(id)a4 v2FeatureAvailabilityManager:(id)a5 analyticsSubmissionManager:(id)a6
{
  objc_class *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  objc_class *v16;
  void *v17;
  void *v18;
  HDHRElectrocardiogramRecordingV2UpgradeManager *v19;

  v10 = (objc_class *)MEMORY[0x1E0D29550];
  v11 = a6;
  v12 = a5;
  v13 = a4;
  v14 = a3;
  v15 = [v10 alloc];
  v16 = (objc_class *)objc_opt_class();
  NSStringFromClass(v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v15, "initWithProfile:debugIdentifier:delegate:", v14, v17, 0);

  v19 = -[HDHRElectrocardiogramRecordingV2UpgradeManager initWithProfile:v1FeatureAvailabilityManager:v2FeatureAvailabilityManager:analyticsSubmissionManager:protectedDataOperation:](self, "initWithProfile:v1FeatureAvailabilityManager:v2FeatureAvailabilityManager:analyticsSubmissionManager:protectedDataOperation:", v14, v13, v12, v11, v18);
  return v19;
}

- (HDHRElectrocardiogramRecordingV2UpgradeManager)initWithProfile:(id)a3 v1FeatureAvailabilityManager:(id)a4 v2FeatureAvailabilityManager:(id)a5 analyticsSubmissionManager:(id)a6 protectedDataOperation:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  HDHRElectrocardiogramRecordingV2UpgradeManager *v17;
  HDHRElectrocardiogramRecordingV2UpgradeManager *v18;
  objc_super v20;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v20.receiver = self;
  v20.super_class = (Class)HDHRElectrocardiogramRecordingV2UpgradeManager;
  v17 = -[HDHRElectrocardiogramRecordingV2UpgradeManager init](&v20, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeWeak((id *)&v17->_profile, v12);
    objc_storeStrong((id *)&v18->_protectedDataOperation, a7);
    objc_storeStrong((id *)&v18->_v1FeatureAvailabilityManager, a4);
    objc_storeStrong((id *)&v18->_v2FeatureAvailabilityManager, a5);
    objc_storeStrong((id *)&v18->_analyticsSubmissionManager, a6);
    -[HDProtectedDataOperation setDelegate:](v18->_protectedDataOperation, "setDelegate:", v18);
    -[HDProtectedDataOperation requestWorkWithPriority:error:](v18->_protectedDataOperation, "requestWorkWithPriority:error:", 2, 0);
  }

  return v18;
}

- (void)doWorkWithCompletion:(uint64_t)a1
{
  void (**v3)(id, uint64_t, _QWORD);
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  char v24;
  void *v25;
  _BOOL4 v26;
  NSObject *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  NSObject *v37;
  void *v38;
  id v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  NSObject *v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  _QWORD v49[5];
  id v50;
  void (**v51)(id, uint64_t, _QWORD);
  id v52;
  id v53;
  id v54;
  uint8_t buf[4];
  void *v56;
  __int16 v57;
  void *v58;
  __int16 v59;
  void *v60;
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 32);
    v54 = 0;
    objc_msgSend(v4, "featureOnboardingRecordWithError:", &v54);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v54;
    v7 = v6;
    if (v5)
    {
      if (objc_msgSend(v5, "isOnboardingPresent"))
      {
        _HKInitializeLogging();
        v8 = (void *)*MEMORY[0x1E0CB52F0];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52F0], OS_LOG_TYPE_DEFAULT))
        {
          v9 = v8;
          v10 = (void *)objc_opt_class();
          *(_DWORD *)buf = 138543362;
          v56 = v10;
          v11 = v10;
          _os_log_impl(&dword_1CC29C000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] Already onboarded to ECG2", buf, 0xCu);

        }
        -[HDHRElectrocardiogramRecordingV2UpgradeManager _reportAnalyticsEventForCountryCode:eventType:errorCategory:errorDetail:](a1, 0, (void *)*MEMORY[0x1E0D291F8], CFSTR("v2_eligibility"), CFSTR("already_onboarded"));
        v3[2](v3, 1, 0);
      }
      else
      {
        v16 = *(void **)(a1 + 24);
        v53 = v7;
        objc_msgSend(v16, "featureOnboardingRecordWithError:", &v53);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = v53;

        if (v17)
        {
          if ((objc_msgSend(v17, "isOnboardingPresent") & 1) != 0)
          {
            objc_msgSend(v17, "onboardingCompletion");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "countryCode");
            v20 = (void *)objc_claimAutoreleasedReturnValue();

            if (v20)
            {
              v21 = *(void **)(a1 + 32);
              v52 = v18;
              objc_msgSend(v21, "onboardingEligibilityForCountryCode:error:", v20, &v52);
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              v23 = v52;

              if (v22)
              {
                v24 = objc_msgSend(v22, "isEligible");
                _HKInitializeLogging();
                v25 = (void *)*MEMORY[0x1E0CB52F0];
                v26 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52F0], OS_LOG_TYPE_DEFAULT);
                if ((v24 & 1) != 0)
                {
                  if (v26)
                  {
                    v27 = v25;
                    v28 = (void *)objc_opt_class();
                    *(_DWORD *)buf = 138543618;
                    v56 = v28;
                    v57 = 2114;
                    v58 = v20;
                    v29 = v28;
                    _os_log_impl(&dword_1CC29C000, v27, OS_LOG_TYPE_DEFAULT, "[%{public}@] Beginning ECG2 upgrade in country: %{public}@", buf, 0x16u);

                  }
                  v30 = *(void **)(a1 + 32);
                  -[HDHRElectrocardiogramRecordingV2UpgradeManager _v1featureSettingsUponBackgroundDelivery](a1);
                  v31 = (void *)objc_claimAutoreleasedReturnValue();
                  v49[0] = MEMORY[0x1E0C809B0];
                  v49[1] = 3221225472;
                  v49[2] = __71__HDHRElectrocardiogramRecordingV2UpgradeManager_doWorkWithCompletion___block_invoke;
                  v49[3] = &unk_1E87EF8B0;
                  v49[4] = a1;
                  v50 = v20;
                  v51 = v3;
                  objc_msgSend(v30, "setCurrentOnboardingVersionCompletedForCountryCode:countryCodeProvenance:date:settings:completion:", v50, 3, 0, v31, v49);

                }
                else
                {
                  if (v26)
                  {
                    v44 = v25;
                    v45 = (void *)objc_opt_class();
                    v48 = v45;
                    objc_msgSend(v22, "ineligibilityReasonsDescription");
                    v46 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138543874;
                    v56 = v45;
                    v57 = 2114;
                    v58 = v20;
                    v59 = 2114;
                    v60 = v46;
                    _os_log_impl(&dword_1CC29C000, v44, OS_LOG_TYPE_DEFAULT, "[%{public}@] Cannot upgrade to ECG2 in ECG1 country: %{public}@: %{public}@", buf, 0x20u);

                  }
                  objc_msgSend(v22, "ineligibilityReasonsDescription");
                  v47 = (void *)objc_claimAutoreleasedReturnValue();
                  -[HDHRElectrocardiogramRecordingV2UpgradeManager _reportAnalyticsEventForCountryCode:eventType:errorCategory:errorDetail:](a1, v20, (void *)*MEMORY[0x1E0D291F8], CFSTR("eligibility"), v47);

                  v3[2](v3, 0, 0);
                }
              }
              else
              {
                v40 = (void *)MEMORY[0x1E0CB3940];
                objc_msgSend(v23, "domain");
                v41 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v23, "code"));
                v42 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v40, "stringWithFormat:", CFSTR("%@_%@"), v41, v42);
                v43 = (void *)objc_claimAutoreleasedReturnValue();
                -[HDHRElectrocardiogramRecordingV2UpgradeManager _reportAnalyticsEventForCountryCode:eventType:errorCategory:errorDetail:](a1, v20, (void *)*MEMORY[0x1E0D291F8], CFSTR("eligibility"), v43);

                ((void (**)(id, uint64_t, id))v3)[2](v3, 0, v23);
              }
            }
            else
            {
              -[HDHRElectrocardiogramRecordingV2UpgradeManager _reportAnalyticsEventForCountryCode:eventType:errorCategory:errorDetail:](a1, 0, (void *)*MEMORY[0x1E0D291F8], CFSTR("eligibility"), CFSTR("location_unavailable"));
              objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:", 109, CFSTR("Cannot upgrade V1 user to V2 as no country code exists"));
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              ((void (**)(id, uint64_t, void *))v3)[2](v3, 1, v22);
              v23 = v18;
            }

            v18 = v23;
          }
          else
          {
            _HKInitializeLogging();
            v36 = (void *)*MEMORY[0x1E0CB52F0];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52F0], OS_LOG_TYPE_DEFAULT))
            {
              v37 = v36;
              v38 = (void *)objc_opt_class();
              *(_DWORD *)buf = 138543362;
              v56 = v38;
              v39 = v38;
              _os_log_impl(&dword_1CC29C000, v37, OS_LOG_TYPE_DEFAULT, "[%{public}@] Cannot upgrade to ECG2 as not onboarded to ECG1", buf, 0xCu);

            }
            -[HDHRElectrocardiogramRecordingV2UpgradeManager _reportAnalyticsEventForCountryCode:eventType:errorCategory:errorDetail:](a1, 0, (void *)*MEMORY[0x1E0D291F8], CFSTR("v1_eligibility"), CFSTR("not_onboarded"));
            v3[2](v3, 1, 0);
          }
        }
        else
        {
          v32 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(v18, "domain");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v18, "code"));
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "stringWithFormat:", CFSTR("%@_%@"), v33, v34);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          -[HDHRElectrocardiogramRecordingV2UpgradeManager _reportAnalyticsEventForCountryCode:eventType:errorCategory:errorDetail:](a1, 0, (void *)*MEMORY[0x1E0D291F8], CFSTR("v1_eligibility"), v35);

          ((void (**)(id, uint64_t, id))v3)[2](v3, 0, v18);
        }

        v7 = v18;
      }
    }
    else
    {
      v12 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v6, "domain");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v7, "code"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "stringWithFormat:", CFSTR("%@_%@"), v13, v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[HDHRElectrocardiogramRecordingV2UpgradeManager _reportAnalyticsEventForCountryCode:eventType:errorCategory:errorDetail:](a1, 0, (void *)*MEMORY[0x1E0D291F8], CFSTR("v2_eligibility"), v15);

      ((void (**)(id, uint64_t, void *))v3)[2](v3, 0, v7);
    }

  }
}

- (id)_v1featureSettingsUponBackgroundDelivery
{
  id v1;
  uint64_t v2;
  void *v3;
  void *v4;
  _QWORD v6[2];
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v1 = objc_alloc(MEMORY[0x1E0CB6720]);
  v2 = *MEMORY[0x1E0CB4D70];
  v6[0] = *MEMORY[0x1E0CB4D78];
  v6[1] = v2;
  v7[0] = MEMORY[0x1E0C9AAB0];
  v7[1] = MEMORY[0x1E0C9AAA0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v1, "initWithDictionary:", v3);

  return v4;
}

void __71__HDHRElectrocardiogramRecordingV2UpgradeManager_doWorkWithCompletion___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v5 = a3;
  if (a2)
  {
    v6 = *(_QWORD *)(a1 + 32);
    if (v6)
      -[HDHRElectrocardiogramRecordingV2UpgradeManager _reportAnalyticsEventForCountryCode:eventType:errorCategory:errorDetail:](v6, *(void **)(a1 + 40), (void *)*MEMORY[0x1E0D291F0], 0, 0);
  }
  else
  {
    _HKInitializeLogging();
    v7 = (void *)*MEMORY[0x1E0CB52F0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52F0], OS_LOG_TYPE_ERROR))
      __71__HDHRElectrocardiogramRecordingV2UpgradeManager_doWorkWithCompletion___block_invoke_cold_1(a1, v7);
    v8 = *(_QWORD *)(a1 + 32);
    v9 = *(void **)(a1 + 40);
    v10 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v5, "domain");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v5, "code"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringWithFormat:", CFSTR("%@_%@"), v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
      -[HDHRElectrocardiogramRecordingV2UpgradeManager _reportAnalyticsEventForCountryCode:eventType:errorCategory:errorDetail:](v8, v9, (void *)*MEMORY[0x1E0D291F8], CFSTR("save"), v13);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

- (void)performWorkForOperation:(id)a3 profile:(id)a4 databaseAccessibilityAssertion:(id)a5 completion:(id)a6
{
  id v7;
  id v8;
  _QWORD v9[5];
  id v10;

  v7 = a6;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __124__HDHRElectrocardiogramRecordingV2UpgradeManager_performWorkForOperation_profile_databaseAccessibilityAssertion_completion___block_invoke;
  v9[3] = &unk_1E87EF6C8;
  v9[4] = self;
  v10 = v7;
  v8 = v7;
  -[HDHRElectrocardiogramRecordingV2UpgradeManager doWorkWithCompletion:]((uint64_t)self, v9);

}

uint64_t __124__HDHRElectrocardiogramRecordingV2UpgradeManager_performWorkForOperation_profile_databaseAccessibilityAssertion_completion___block_invoke(uint64_t a1, int a2)
{
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(WeakRetained, "daemon");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "nanoRegistryDeviceCapabilityProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  v8 = *(_QWORD *)(a1 + 32);
  if (a2)
    objc_msgSend(v6, "unregisterObserver:", v8);
  else
    objc_msgSend(v6, "registerObserver:queue:", v8, 0);

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)pairedDeviceCapabilitiesDidUpdate:(id)a3
{
  HDProtectedDataOperation *protectedDataOperation;
  int v4;
  id v5;
  NSObject *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  uint8_t buf[4];
  void *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  protectedDataOperation = self->_protectedDataOperation;
  v10 = 0;
  v4 = -[HDProtectedDataOperation requestWorkWithPriority:error:](protectedDataOperation, "requestWorkWithPriority:error:", 2, &v10);
  v5 = v10;
  _HKInitializeLogging();
  HKLogInfrastructure();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (void *)objc_opt_class();
    if (v4)
      v8 = 0;
    else
      v8 = v5;
    *(_DWORD *)buf = 138543618;
    v12 = v7;
    v13 = 2114;
    v14 = v8;
    v9 = v7;
    _os_log_impl(&dword_1CC29C000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Requested a chance to upgrade due to nano pairing changes (error: %{public}@)", buf, 0x16u);

  }
}

- (void)_reportAnalyticsEventForCountryCode:(void *)a3 eventType:(void *)a4 errorCategory:(void *)a5 errorDetail:
{
  objc_class *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  char v18;
  id v19;
  void *v20;
  id v21;

  if (a1)
  {
    v9 = (objc_class *)MEMORY[0x1E0D29418];
    v10 = a5;
    v11 = a4;
    v12 = a3;
    v13 = a2;
    v14 = [v9 alloc];
    if (v13)
      v15 = 3;
    else
      v15 = 0;
    v16 = (void *)objc_msgSend(v14, "initWithFeatureIdentifier:eventType:countryCode:countryCodeProvenance:errorCategory:errorDetail:", *MEMORY[0x1E0CB5018], v12, v13, v15, v11, v10);

    v17 = *(void **)(a1 + 40);
    v21 = 0;
    v18 = objc_msgSend(v17, "submitEvent:error:", v16, &v21);
    v19 = v21;
    if ((v18 & 1) == 0)
    {
      _HKInitializeLogging();
      v20 = (void *)*MEMORY[0x1E0CB52F0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52F0], OS_LOG_TYPE_ERROR))
        -[HDHRElectrocardiogramRecordingV2UpgradeManager _reportAnalyticsEventForCountryCode:eventType:errorCategory:errorDetail:].cold.1(v20);
    }

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_analyticsSubmissionManager, 0);
  objc_storeStrong((id *)&self->_v2FeatureAvailabilityManager, 0);
  objc_storeStrong((id *)&self->_v1FeatureAvailabilityManager, 0);
  objc_storeStrong((id *)&self->_protectedDataOperation, 0);
  objc_destroyWeak((id *)&self->_profile);
}

void __71__HDHRElectrocardiogramRecordingV2UpgradeManager_doWorkWithCompletion___block_invoke_cold_1(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  v3 = a2;
  v4 = (void *)OUTLINED_FUNCTION_3_0();
  v5 = OUTLINED_FUNCTION_0_0(v4);
  OUTLINED_FUNCTION_1_0(&dword_1CC29C000, v6, v7, "[%{public}@] Error saving ECGV2 Upgrade: %{public}@", v8, v9, v10, v11, v12);

  OUTLINED_FUNCTION_2_0();
}

- (void)_reportAnalyticsEventForCountryCode:(void *)a1 eventType:errorCategory:errorDetail:.cold.1(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  v2 = a1;
  v3 = (void *)OUTLINED_FUNCTION_3_0();
  v4 = OUTLINED_FUNCTION_0_0(v3);
  OUTLINED_FUNCTION_1_0(&dword_1CC29C000, v5, v6, "[%{public}@] Failed to submit analytics event: %{public}@", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_2_0();
}

@end
