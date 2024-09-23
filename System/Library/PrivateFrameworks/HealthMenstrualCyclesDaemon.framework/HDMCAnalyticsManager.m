@implementation HDMCAnalyticsManager

- (HDMCAnalyticsManager)initWithProfile:(id)a3 analysisManager:(id)a4 heartRateFeatureAvailabilityManager:(id)a5 deviationDetectionFeatureAvailabilityManager:(id)a6 wristTemperatureInputFeatureAvailabilityManager:(id)a7 pregnancyManager:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  HDMCAnalyticsManager *v18;
  HDMCAnalyticsManager *v19;
  id WeakRetained;
  id v22;
  id obj;
  objc_super v24;

  obj = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v22 = a8;
  v24.receiver = self;
  v24.super_class = (Class)HDMCAnalyticsManager;
  v18 = -[HDMCAnalyticsManager init](&v24, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeWeak((id *)&v18->_profile, obj);
    objc_storeStrong((id *)&v19->_analysisManager, a4);
    objc_storeStrong((id *)&v19->_heartRateFeatureAvailabilityManager, a5);
    objc_storeStrong((id *)&v19->_deviationDetectionFeatureAvailabilityManager, a6);
    objc_storeStrong((id *)&v19->_wristTemperatureInputFeatureAvailabilityManager, a7);
    objc_storeStrong((id *)&v19->_pregnancyManager, a8);
    WeakRetained = objc_loadWeakRetained((id *)&v19->_profile);
    objc_msgSend(WeakRetained, "registerProfileReadyObserver:queue:", v19, 0);

  }
  return v19;
}

- (void)profileDidBecomeReady:(id)a3
{
  void *v4;
  void *v5;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "daemon");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "analyticsSubmissionCoordinator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObserver:queue:", self, 0);

}

- (void)reportDailyAnalyticsWithCoordinator:(id)a3 completion:(id)a4
{
  id v5;
  _BOOL8 v6;
  void *v7;
  uint64_t v8;
  os_log_t *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  os_log_t v17;
  NSObject *v18;
  void *v19;
  id v20;
  int v21;
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  v6 = +[HDMCDailyAnalytics shouldSubmit](HDMCDailyAnalytics, "shouldSubmit");
  objc_msgSend(MEMORY[0x24BDBCF50], "hkmc_menstrualCyclesDefaults");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hkmc_analyticsDebugModeEnabled");

  _HKInitializeLogging();
  v9 = (os_log_t *)MEMORY[0x24BDD3030];
  v10 = (void *)*MEMORY[0x24BDD3030];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_DEFAULT))
  {
    v11 = v10;
    v12 = (void *)objc_opt_class();
    v13 = (void *)MEMORY[0x24BDD16E0];
    v14 = v12;
    objc_msgSend(v13, "numberWithBool:", v6);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v8);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 138543874;
    v22 = v12;
    v23 = 2114;
    v24 = v15;
    v25 = 2114;
    v26 = v16;
    _os_log_impl(&dword_21961B000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] Received daily analytics trigger. metricsEnabled: %{public}@, inDebugMode: %{public}@", (uint8_t *)&v21, 0x20u);

  }
  if (v6 | v8)
  {
    -[HDMCAnalyticsManager _submitAnalyticsWithCompletion:](self, "_submitAnalyticsWithCompletion:", v5);
  }
  else
  {
    _HKInitializeLogging();
    v17 = *v9;
    if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT))
    {
      v18 = v17;
      v19 = (void *)objc_opt_class();
      v21 = 138543362;
      v22 = v19;
      v20 = v19;
      _os_log_impl(&dword_21961B000, v18, OS_LOG_TYPE_DEFAULT, "[%{public}@] Skipping analytics submission", (uint8_t *)&v21, 0xCu);

    }
    (*((void (**)(id, _QWORD, _QWORD, _QWORD))v5 + 2))(v5, 0, 0, 0);
  }

}

- (void)_submitAnalyticsWithCompletion:(id)a3
{
  id v4;
  void *v5;
  os_signpost_id_t v6;
  NSObject *v7;
  _BOOL4 v8;
  NSObject *v9;
  NSObject *v10;
  os_log_t *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  HDMCAnalysisManager *analysisManager;
  uint64_t v20;
  os_log_t v21;
  NSObject *v22;
  void *v23;
  id v24;
  HDMCDailyAnalytics *v25;
  id WeakRetained;
  HDMCDailyAnalytics *v27;
  _BOOL4 v28;
  id v29;
  NSObject *v30;
  _BOOL4 v31;
  NSObject *v32;
  NSObject *v33;
  os_log_t v34;
  NSObject *v35;
  void *v36;
  id v37;
  NSObject *v38;
  _BOOL4 v39;
  NSObject *v40;
  NSObject *v41;
  os_log_t v42;
  NSObject *v43;
  NSObject *v44;
  os_log_t v45;
  id v46;
  id v47;
  uint8_t buf[4];
  void *v49;
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  _HKLogPersistedSignposts();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = _HKLogSignpostIDGenerate();

  _HKInitializeLogging();
  _HKLogPersistedSignposts();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_signpost_enabled(v7);

  if (v8)
  {
    _HKLogPersistedSignposts();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_21961B000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v6, "menstrual-cycles-daily-analytics", ", buf, 2u);
    }

  }
  _HKInitializeLogging();
  v11 = (os_log_t *)MEMORY[0x24BDD3030];
  v12 = (void *)*MEMORY[0x24BDD3030];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_DEFAULT))
  {
    v13 = v12;
    v14 = (void *)objc_opt_class();
    *(_DWORD *)buf = 138543362;
    v49 = v14;
    v15 = v14;
    _os_log_impl(&dword_21961B000, v13, OS_LOG_TYPE_DEFAULT, "[%{public}@] Beginning analytics submission", buf, 0xCu);

  }
  -[HDMCAnalysisManager currentAnalysis](self->_analysisManager, "currentAnalysis");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "cycles");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    v18 = 0;
  }
  else
  {
    analysisManager = self->_analysisManager;
    v47 = 0;
    -[HDMCAnalysisManager _analyzeWithForceIncludeCycles:forceAnalyzeCompleteHistory:error:](analysisManager, "_analyzeWithForceIncludeCycles:forceAnalyzeCompleteHistory:error:", 1, 0, &v47);
    v20 = objc_claimAutoreleasedReturnValue();
    v18 = v47;

    v16 = (void *)v20;
  }
  _HKInitializeLogging();
  if (v16)
  {
    v21 = *v11;
    if (os_log_type_enabled(*v11, OS_LOG_TYPE_DEFAULT))
    {
      v22 = v21;
      v23 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543362;
      v49 = v23;
      v24 = v23;
      _os_log_impl(&dword_21961B000, v22, OS_LOG_TYPE_DEFAULT, "[%{public}@] Finished running analysis", buf, 0xCu);

    }
    v25 = [HDMCDailyAnalytics alloc];
    WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
    v27 = -[HDMCDailyAnalytics initWithProfile:analysis:heartRateFeatureAvailabilityManager:deviationDetectionFeatureAvailabilityManager:wristTemperatureInputFeatureAvailabilityManager:pregnancyManager:](v25, "initWithProfile:analysis:heartRateFeatureAvailabilityManager:deviationDetectionFeatureAvailabilityManager:wristTemperatureInputFeatureAvailabilityManager:pregnancyManager:", WeakRetained, v16, self->_heartRateFeatureAvailabilityManager, self->_deviationDetectionFeatureAvailabilityManager, self->_wristTemperatureInputFeatureAvailabilityManager, self->_pregnancyManager);

    v46 = v18;
    v28 = -[HDMCDailyAnalytics submitMetricWithError:](v27, "submitMetricWithError:", &v46);
    v29 = v46;

    _HKInitializeLogging();
    _HKLogPersistedSignposts();
    v30 = objc_claimAutoreleasedReturnValue();
    v31 = os_signpost_enabled(v30);

    if (v28)
    {
      if (v31)
      {
        _HKLogPersistedSignposts();
        v32 = objc_claimAutoreleasedReturnValue();
        v33 = v32;
        if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v32))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_21961B000, v33, OS_SIGNPOST_INTERVAL_END, v6, "menstrual-cycles-daily-analytics", ", buf, 2u);
        }

      }
      _HKInitializeLogging();
      v34 = *v11;
      if (os_log_type_enabled(*v11, OS_LOG_TYPE_DEFAULT))
      {
        v35 = v34;
        v36 = (void *)objc_opt_class();
        *(_DWORD *)buf = 138543362;
        v49 = v36;
        v37 = v36;
        _os_log_impl(&dword_21961B000, v35, OS_LOG_TYPE_DEFAULT, "[%{public}@] Metric submission succeeded", buf, 0xCu);

      }
      (*((void (**)(id, _QWORD, _QWORD, _QWORD))v4 + 2))(v4, 0, 0, 0);
    }
    else
    {
      if (v31)
      {
        _HKLogPersistedSignposts();
        v43 = objc_claimAutoreleasedReturnValue();
        v44 = v43;
        if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v43))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_21961B000, v44, OS_SIGNPOST_INTERVAL_END, v6, "menstrual-cycles-daily-analytics", ", buf, 2u);
        }

      }
      _HKInitializeLogging();
      v45 = *v11;
      if (os_log_type_enabled(*v11, OS_LOG_TYPE_ERROR))
        -[HDMCAnalyticsManager _submitAnalyticsWithCompletion:].cold.2(v45);
      (*((void (**)(id, _QWORD, uint64_t, id))v4 + 2))(v4, 0, 2, v29);
    }

    v18 = v29;
  }
  else
  {
    _HKLogPersistedSignposts();
    v38 = objc_claimAutoreleasedReturnValue();
    v39 = os_signpost_enabled(v38);

    if (v39)
    {
      _HKLogPersistedSignposts();
      v40 = objc_claimAutoreleasedReturnValue();
      v41 = v40;
      if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v40))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_21961B000, v41, OS_SIGNPOST_INTERVAL_END, v6, "menstrual-cycles-daily-analytics", ", buf, 2u);
      }

    }
    _HKInitializeLogging();
    v42 = *v11;
    if (os_log_type_enabled(*v11, OS_LOG_TYPE_ERROR))
      -[HDMCAnalyticsManager _submitAnalyticsWithCompletion:].cold.1(v42);
    (*((void (**)(id, _QWORD, uint64_t, id))v4 + 2))(v4, 0, 2, v18);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pregnancyManager, 0);
  objc_storeStrong((id *)&self->_wristTemperatureInputFeatureAvailabilityManager, 0);
  objc_storeStrong((id *)&self->_deviationDetectionFeatureAvailabilityManager, 0);
  objc_storeStrong((id *)&self->_heartRateFeatureAvailabilityManager, 0);
  objc_destroyWeak((id *)&self->_profile);
  objc_storeStrong((id *)&self->_analysisManager, 0);
}

- (void)_submitAnalyticsWithCompletion:(void *)a1 .cold.1(void *a1)
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
  v3 = (void *)OUTLINED_FUNCTION_3();
  v4 = OUTLINED_FUNCTION_0(v3);
  OUTLINED_FUNCTION_1(&dword_21961B000, v5, v6, "[%{public}@] Analysis failed with error: %{public}@", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_2();
}

- (void)_submitAnalyticsWithCompletion:(void *)a1 .cold.2(void *a1)
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
  v3 = (void *)OUTLINED_FUNCTION_3();
  v4 = OUTLINED_FUNCTION_0(v3);
  OUTLINED_FUNCTION_1(&dword_21961B000, v5, v6, "[%{public}@] Metric submission failed with error: %{public}@", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_2();
}

@end
