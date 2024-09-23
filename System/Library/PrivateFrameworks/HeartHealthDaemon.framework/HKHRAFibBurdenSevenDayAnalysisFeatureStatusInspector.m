@implementation HKHRAFibBurdenSevenDayAnalysisFeatureStatusInspector

- (HKHRAFibBurdenSevenDayAnalysisFeatureStatusInspector)initWithOnboardingEligibilityDeterminer:(id)a3 breadcrumbManager:(id)a4
{
  id v7;
  id v8;
  HKHRAFibBurdenSevenDayAnalysisFeatureStatusInspector *v9;
  HKHRAFibBurdenSevenDayAnalysisFeatureStatusInspector *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HKHRAFibBurdenSevenDayAnalysisFeatureStatusInspector;
  v9 = -[HKHRAFibBurdenSevenDayAnalysisFeatureStatusInspector init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_onboardingEligibilityDeterminer, a3);
    objc_storeStrong((id *)&v10->_breadcrumbManager, a4);
  }

  return v10;
}

- (BOOL)shouldAllowAnalysisWithFeatureStatus:(id)a3
{
  id v4;
  void *v5;
  int v6;
  NSObject *v7;
  BOOL v8;
  uint64_t v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  HDFeatureAvailabilityOnboardingEligibilityDeterminer *onboardingEligibilityDeterminer;
  void *v22;
  id v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  void *v29;
  int v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v34;
  int v35;
  NSObject *v36;
  _BOOL4 v37;
  HDHRAFibBurdenSevenDayAnalysisBreadcrumbManaging *breadcrumbManager;
  const __CFString *v39;
  NSObject *v40;
  NSObject *v41;
  NSObject *v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  id v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  _BYTE v59[128];
  _BYTE v60[128];
  uint64_t v61;
  uint8_t buf[4];
  HKHRAFibBurdenSevenDayAnalysisFeatureStatusInspector *v63;
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CB4ED0]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "areAllRequirementsSatisfied");

  if (v6)
  {
    _HKInitializeLogging();
    HKHRAFibBurdenLogForCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v63 = self;
      _os_log_impl(&dword_1CC29C000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] Usage context supported, allowing analysis", buf, 0xCu);
    }

    v8 = 1;
  }
  else
  {
    v9 = *MEMORY[0x1E0D2FA00];
    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D2FA00]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "areAllRequirementsSatisfied");

    if ((v11 & 1) != 0)
    {
      -[HKHRAFibBurdenSevenDayAnalysisFeatureStatusInspector pairedDevices](self, "pairedDevices");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v12, "count"))
      {
        objc_msgSend(v4, "onboardingRecord");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "allOnboardingCompletionsRegardlessOfSupportedState");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        v57 = 0u;
        v58 = 0u;
        v55 = 0u;
        v56 = 0u;
        v15 = v12;
        v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v55, v60, 16);
        if (v16)
        {
          v17 = v16;
          v18 = *(_QWORD *)v56;
          v46 = v12;
          v48 = v15;
          v49 = v14;
          v44 = *(_QWORD *)v56;
          while (2)
          {
            v19 = 0;
            v45 = v17;
            do
            {
              if (*(_QWORD *)v56 != v18)
                objc_enumerationMutation(v15);
              v20 = *(_QWORD *)(*((_QWORD *)&v55 + 1) + 8 * v19);
              onboardingEligibilityDeterminer = self->_onboardingEligibilityDeterminer;
              v54 = 0;
              -[HDFeatureAvailabilityOnboardingEligibilityDeterminer onboardingEligibilitiesForDevice:onboardingCompletions:error:](onboardingEligibilityDeterminer, "onboardingEligibilitiesForDevice:onboardingCompletions:error:", v20, v14, &v54, v44);
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              v23 = v54;
              v8 = v23 == 0;
              if (v23)
              {
                v24 = v23;
                _HKInitializeLogging();
                HKHRAFibBurdenLogForCategory();
                v43 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
                  -[HKHRAFibBurdenSevenDayAnalysisFeatureStatusInspector shouldAllowAnalysisWithFeatureStatus:].cold.1((uint64_t)self, (uint64_t)v24, v43);

                -[HDHRAFibBurdenSevenDayAnalysisBreadcrumbManaging dropAnalysisResultBreadcrumbWithContext:](self->_breadcrumbManager, "dropAnalysisResultBreadcrumbWithContext:", CFSTR("Error determining onboarding eligibility"));
                v12 = v46;
LABEL_40:

                goto LABEL_41;
              }
              v52 = 0u;
              v53 = 0u;
              v50 = 0u;
              v51 = 0u;
              v47 = v22;
              v24 = v22;
              v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v50, v59, 16);
              if (v25)
              {
                v26 = v25;
                v27 = *(_QWORD *)v51;
                while (2)
                {
                  for (i = 0; i != v26; ++i)
                  {
                    if (*(_QWORD *)v51 != v27)
                      objc_enumerationMutation(v24);
                    objc_msgSend(*(id *)(*((_QWORD *)&v50 + 1) + 8 * i), "onboardingEligibility");
                    v29 = (void *)objc_claimAutoreleasedReturnValue();
                    v30 = objc_msgSend(v29, "isEligible");

                    if (v30)
                    {
                      _HKInitializeLogging();
                      HKHRAFibBurdenLogForCategory();
                      v41 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
                      {
                        *(_DWORD *)buf = 138543362;
                        v63 = self;
                        _os_log_impl(&dword_1CC29C000, v41, OS_LOG_TYPE_DEFAULT, "[%{public}@] At least one paired device has supported onboarding completion, allowing analysis", buf, 0xCu);
                      }

                      v12 = v46;
                      v22 = v47;
                      v15 = v48;
                      v14 = v49;
                      goto LABEL_40;
                    }
                  }
                  v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v50, v59, 16);
                  if (v26)
                    continue;
                  break;
                }
              }

              ++v19;
              v18 = v44;
              v15 = v48;
              v14 = v49;
            }
            while (v19 != v45);
            v17 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v55, v60, 16);
            v12 = v46;
            if (v17)
              continue;
            break;
          }
        }

        _HKInitializeLogging();
        HKHRAFibBurdenLogForCategory();
        v31 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v63 = self;
          _os_log_impl(&dword_1CC29C000, v31, OS_LOG_TYPE_DEFAULT, "[%{public}@] No paired devices had supported onboarding completion, not allowing analysis", buf, 0xCu);
        }

        -[HDHRAFibBurdenSevenDayAnalysisBreadcrumbManaging dropAnalysisResultBreadcrumbWithContext:](self->_breadcrumbManager, "dropAnalysisResultBreadcrumbWithContext:", CFSTR("No devices supported for onboarding completions"));
        v8 = 0;
LABEL_41:

      }
      else
      {
        _HKInitializeLogging();
        HKHRAFibBurdenLogForCategory();
        v40 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v63 = self;
          _os_log_impl(&dword_1CC29C000, v40, OS_LOG_TYPE_DEFAULT, "[%{public}@] No devices present, not allowing analysis", buf, 0xCu);
        }

        -[HDHRAFibBurdenSevenDayAnalysisBreadcrumbManaging dropAnalysisResultBreadcrumbWithContext:](self->_breadcrumbManager, "dropAnalysisResultBreadcrumbWithContext:", CFSTR("Analysis feature context allowed but no paired devices"));
        v8 = 0;
      }

    }
    else
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", v9);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "unsatisfiedRequirementIdentifiers");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v61 = *MEMORY[0x1E0CB4F58];
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v61, 1);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = objc_msgSend(v33, "isEqualToArray:", v34);

      _HKInitializeLogging();
      HKHRAFibBurdenLogForCategory();
      v36 = objc_claimAutoreleasedReturnValue();
      v37 = os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT);
      if (v35)
      {
        if (v37)
        {
          *(_DWORD *)buf = 138543362;
          v63 = self;
          _os_log_impl(&dword_1CC29C000, v36, OS_LOG_TYPE_DEFAULT, "[%{public}@] Analysis context not supported exclusively due to setting being toggled off, not allowing analysis", buf, 0xCu);
        }

        breadcrumbManager = self->_breadcrumbManager;
        v39 = CFSTR("Feature turned off");
      }
      else
      {
        if (v37)
        {
          *(_DWORD *)buf = 138543362;
          v63 = self;
          _os_log_impl(&dword_1CC29C000, v36, OS_LOG_TYPE_DEFAULT, "[%{public}@] Analysis context not supported, not allowing analysis", buf, 0xCu);
        }

        breadcrumbManager = self->_breadcrumbManager;
        v39 = CFSTR("Usage feature status not allowed");
      }
      -[HDHRAFibBurdenSevenDayAnalysisBreadcrumbManaging dropAnalysisResultBreadcrumbWithContext:](breadcrumbManager, "dropAnalysisResultBreadcrumbWithContext:", v39);
      v8 = 0;
    }
  }

  return v8;
}

- (id)pairedDevices
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0D51838], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D51838], "pairedDevicesSelectorBlock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getDevicesMatching:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_breadcrumbManager, 0);
  objc_storeStrong((id *)&self->_onboardingEligibilityDeterminer, 0);
}

- (void)shouldAllowAnalysisWithFeatureStatus:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138543618;
  v4 = a1;
  v5 = 2114;
  v6 = a2;
  _os_log_error_impl(&dword_1CC29C000, log, OS_LOG_TYPE_ERROR, "[%{public}@] Error when retrieving onboarding eligibility: %{public}@", (uint8_t *)&v3, 0x16u);
}

@end
