@implementation HKHRAFibBurdenSevenDayAnalysisScheduler

- (HKHRAFibBurdenSevenDayAnalysisScheduler)initWithProfile:(id)a3 featureStatusManager:(id)a4 onboardingEligibilityDeterminer:(id)a5 analyzer:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  HDHRAFibBurdenSevenDayAnalysisBreadcrumbManager *v14;
  HKHRAFibBurdenSevenDayAnalysisFeatureStatusInspector *v15;
  HKHRDatabaseAnalysisSchedulerImpl *v16;
  void *v17;
  HKHRDatabaseAnalysisSchedulerImpl *v18;
  HKHRAFibBurdenSevenDayAnalysisManager *v19;
  HKHRAFibBurdenSevenDayAnalysisSchedulerXPCAlarm *v20;
  void *v21;
  HKHRAFibBurdenSevenDayAnalysisScheduler *v22;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v14 = -[HDHRAFibBurdenSevenDayAnalysisBreadcrumbManager initWithProfile:]([HDHRAFibBurdenSevenDayAnalysisBreadcrumbManager alloc], "initWithProfile:", v13);
  v15 = -[HKHRAFibBurdenSevenDayAnalysisFeatureStatusInspector initWithOnboardingEligibilityDeterminer:breadcrumbManager:]([HKHRAFibBurdenSevenDayAnalysisFeatureStatusInspector alloc], "initWithOnboardingEligibilityDeterminer:breadcrumbManager:", v11, v14);

  v16 = [HKHRDatabaseAnalysisSchedulerImpl alloc];
  HKHRAFibBurdenLogForCategory();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  HKHRAFibBurdenSevenDayAnalysisMaximumXPCDelay();
  v18 = -[HKHRDatabaseAnalysisSchedulerImpl initWithProfile:identifier:loggingCategory:maximumDelay:retryDelay:breadcrumbManager:](v16, "initWithProfile:identifier:loggingCategory:maximumDelay:retryDelay:breadcrumbManager:", v13, CFSTR("HKHRAFibBurdenSevenDayAnalysisSchedulerIdentifier"), v17, v14);

  v19 = -[HKHRAFibBurdenSevenDayAnalysisManager initWithProfile:analyzer:]([HKHRAFibBurdenSevenDayAnalysisManager alloc], "initWithProfile:analyzer:", v13, v10);
  v20 = -[HKHRAFibBurdenSevenDayAnalysisSchedulerXPCAlarm initWithProfile:]([HKHRAFibBurdenSevenDayAnalysisSchedulerXPCAlarm alloc], "initWithProfile:", v13);
  objc_msgSend(MEMORY[0x1E0D294B8], "hdhr_aFibBurdenProtectedSyncedDomainForProfile:", v13);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = -[HKHRAFibBurdenSevenDayAnalysisScheduler initWithProfile:analysisManager:featureStatusManager:featureStatusInspector:alarm:scheduler:breadcrumbManager:syncedKeyValueDomain:](self, "initWithProfile:analysisManager:featureStatusManager:featureStatusInspector:alarm:scheduler:breadcrumbManager:syncedKeyValueDomain:", v13, v19, v12, v15, v20, v18, v14, v21);

  return v22;
}

- (HKHRAFibBurdenSevenDayAnalysisScheduler)initWithProfile:(id)a3 analysisManager:(id)a4 featureStatusManager:(id)a5 featureStatusInspector:(id)a6 alarm:(id)a7 scheduler:(id)a8 breadcrumbManager:(id)a9 syncedKeyValueDomain:(id)a10
{
  id v16;
  id v17;
  HKHRAFibBurdenSevenDayAnalysisScheduler *v18;
  HKHRAFibBurdenSevenDayAnalysisScheduler *v19;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id obj;
  objc_super v27;

  obj = a3;
  v25 = a4;
  v24 = a5;
  v23 = a6;
  v22 = a7;
  v21 = a8;
  v16 = a9;
  v17 = a10;
  v27.receiver = self;
  v27.super_class = (Class)HKHRAFibBurdenSevenDayAnalysisScheduler;
  v18 = -[HKHRAFibBurdenSevenDayAnalysisScheduler init](&v27, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeWeak((id *)&v18->_profile, obj);
    objc_storeStrong((id *)&v19->_analysisManager, a4);
    objc_storeStrong((id *)&v19->_featureStatusManager, a5);
    objc_storeStrong((id *)&v19->_featureStatusInspector, a6);
    objc_storeStrong((id *)&v19->_alarm, a7);
    objc_storeStrong((id *)&v19->_scheduler, a8);
    objc_storeStrong((id *)&v19->_breadcrumbManager, a9);
    objc_storeStrong((id *)&v19->_syncedKeyValueDomain, a10);
    -[HKHRAFibBurdenSevenDayAnalysisSchedulerAlarm setDelegate:](v19->_alarm, "setDelegate:", v19, v21, v22, v23, v24, v25);
    -[HKHRDatabaseAnalysisScheduler setDelegate:](v19->_scheduler, "setDelegate:", v19);
  }

  return v19;
}

- (void)initialAnalysisAlarmDidFireWithAlarm:(id)a3
{
  -[HDHRAFibBurdenSevenDayAnalysisBreadcrumbManaging dropBreadcrumb:](self->_breadcrumbManager, "dropBreadcrumb:", 0);
  -[HKHRDatabaseAnalysisScheduler scheduleAnalysis](self->_scheduler, "scheduleAnalysis");
}

- (void)analysisSchedulerDidFire:(id)a3 completion:(id)a4
{
  void (**v5)(id, _QWORD, id);
  HKFeatureStatusManager *featureStatusManager;
  void *v7;
  id v8;
  void *v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;

  v5 = (void (**)(id, _QWORD, id))a4;
  featureStatusManager = self->_featureStatusManager;
  v13 = 0;
  -[HKFeatureStatusManager featureStatusWithError:](featureStatusManager, "featureStatusWithError:", &v13);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v13;
  if (v7)
  {
    if (-[HKHRAFibBurdenSevenDayAnalysisScheduler _shouldAllowFeatureStatus:](self, "_shouldAllowFeatureStatus:", v7))
    {
      v12 = v8;
      -[HKHRAFibBurdenSevenDayAnalysisScheduler _performAnalysisWithFeatureStatus:error:](self, "_performAnalysisWithFeatureStatus:error:", v7, &v12);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v12;

      -[HKHRAFibBurdenSevenDayAnalysisScheduler _logAnalysisResult:error:](self, "_logAnalysisResult:error:", objc_msgSend(v9, "result"), v10);
      -[HKHRAFibBurdenSevenDayAnalysisScheduler _reportAnalysisResultsToDelegate:featureStatus:](self, "_reportAnalysisResultsToDelegate:featureStatus:", v9, v7);
      -[HKHRAFibBurdenSevenDayAnalysisScheduler _saveLastAnalysisCompletedDateForResult:](self, "_saveLastAnalysisCompletedDateForResult:", v9);
      v5[2](v5, -[HKHRAFibBurdenSevenDayAnalysisScheduler _determineIfAnotherAnalysisRunIsNecessaryWithAnalysisResult:](self, "_determineIfAnotherAnalysisRunIsNecessaryWithAnalysisResult:", objc_msgSend(v9, "result")), v10);

      v8 = v10;
    }
    else
    {
      v5[2](v5, 0, 0);
    }
  }
  else
  {
    _HKInitializeLogging();
    HKHRAFibBurdenLogForCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[HKHRAFibBurdenSevenDayAnalysisScheduler analysisSchedulerDidFire:completion:].cold.1();

    -[HDHRAFibBurdenSevenDayAnalysisBreadcrumbManaging dropAnalysisResultBreadcrumbWithContext:](self->_breadcrumbManager, "dropAnalysisResultBreadcrumbWithContext:", CFSTR("Failed to retrieve feature status"));
    v5[2](v5, 1, v8);
  }

}

- (void)_forceAnalysis
{
  NSObject *v3;
  int v4;
  HKHRAFibBurdenSevenDayAnalysisScheduler *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  _HKInitializeLogging();
  HKHRAFibBurdenLogForCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138543362;
    v5 = self;
    _os_log_impl(&dword_1CC29C000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] Analysis forced.", (uint8_t *)&v4, 0xCu);
  }

  -[HKHRDatabaseAnalysisScheduler forceAnalysis](self->_scheduler, "forceAnalysis");
}

- (BOOL)_shouldAllowFeatureStatus:(id)a3
{
  return -[HKHRAFibBurdenSevenDayAnalysisFeatureStatusInspecting shouldAllowAnalysisWithFeatureStatus:](self->_featureStatusInspector, "shouldAllowAnalysisWithFeatureStatus:", a3);
}

- (id)_performAnalysisWithFeatureStatus:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  void (**v8)(_QWORD);
  NSObject *v9;
  os_signpost_id_t v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  NSObject *v19;
  NSObject *v20;
  id v21;
  void *v22;
  _QWORD v24[5];
  id v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  uint8_t buf[4];
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = __Block_byref_object_copy_;
  v31 = __Block_byref_object_dispose_;
  v32 = 0;
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __83__HKHRAFibBurdenSevenDayAnalysisScheduler__performAnalysisWithFeatureStatus_error___block_invoke;
  v24[3] = &unk_1E87EF3E0;
  v24[4] = self;
  v7 = v6;
  v25 = v7;
  v26 = &v27;
  v8 = (void (**)(_QWORD))MEMORY[0x1D17A8B4C](v24);
  HKHRAFibBurdenLogForCategory();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = _HKLogSignpostIDGenerate();
  objc_msgSend(MEMORY[0x1E0CB6F18], "sharedBehavior");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "showSensitiveLogItems");

  if (v12)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    HKHRAFibBurdenPreviousWeekDayIndexRange();

    NSStringFromHKDayIndexRange();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    _HKInitializeLogging();
    if (os_signpost_enabled(v9))
    {
      v16 = v9;
      v17 = v16;
      if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
      {
        *(_DWORD *)buf = 138412290;
        v34 = v15;
        _os_signpost_emit_with_name_impl(&dword_1CC29C000, v17, OS_SIGNPOST_INTERVAL_BEGIN, v10, "afib-burden-analysis", "dayIndexRange=%@", buf, 0xCu);
      }

    }
    v8[2](v8);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    _HKInitializeLogging();
    if (os_signpost_enabled(v9))
    {
      v19 = v9;
      v20 = v19;
      if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
      {
        *(_DWORD *)buf = 138412290;
        v34 = v15;
        _os_signpost_emit_with_name_impl(&dword_1CC29C000, v20, OS_SIGNPOST_INTERVAL_END, v10, "afib-burden-analysis", "dayIndexRange=%@", buf, 0xCu);
      }

    }
  }
  else
  {
    v8[2](v8);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v21 = (id)v28[5];
  v22 = v21;
  if (v21)
  {
    if (a4)
      *a4 = objc_retainAutorelease(v21);
    else
      _HKLogDroppedError();
  }

  _Block_object_dispose(&v27, 8);
  return v18;
}

id __83__HKHRAFibBurdenSevenDayAnalysisScheduler__performAnalysisWithFeatureStatus_error___block_invoke(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id obj;

  v2 = a1[4];
  v1 = a1[5];
  v3 = *(void **)(v2 + 16);
  v4 = *(_QWORD *)(v2 + 56);
  v5 = *(_QWORD *)(a1[6] + 8);
  obj = *(id *)(v5 + 40);
  objc_msgSend(v3, "analyzePreviousCalendarWeekWithFeatureStatus:shouldSaveSampleToDatabase:breadcrumbManager:error:", v1, 1, v4, &obj);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v5 + 40), obj);
  return v6;
}

- (void)_logAnalysisResult:(int64_t)a3 error:(id)a4
{
  id v6;
  NSObject *v7;
  const char *v8;
  NSObject *v9;
  uint32_t v10;
  int v11;
  HKHRAFibBurdenSevenDayAnalysisScheduler *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  switch(a3)
  {
    case 0:
      _HKInitializeLogging();
      HKHRAFibBurdenLogForCategory();
      v7 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        goto LABEL_16;
      v11 = 138412290;
      v12 = self;
      v8 = "[%@] Burden analysis run and sample created";
      goto LABEL_14;
    case 1:
      _HKInitializeLogging();
      HKHRAFibBurdenLogForCategory();
      v7 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        goto LABEL_16;
      v11 = 138412546;
      v12 = self;
      v13 = 2112;
      v14 = v6;
      v8 = "[%@] Burden analysis run, no sample created due to infrastructure error: %@";
      v9 = v7;
      v10 = 22;
      goto LABEL_15;
    case 2:
      _HKInitializeLogging();
      HKHRAFibBurdenLogForCategory();
      v7 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        goto LABEL_16;
      v11 = 138412290;
      v12 = self;
      v8 = "[%@] Burden analysis run, no sample created as there was not enough time since last sample";
      goto LABEL_14;
    case 3:
      _HKInitializeLogging();
      HKHRAFibBurdenLogForCategory();
      v7 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        goto LABEL_16;
      v11 = 138412290;
      v12 = self;
      v8 = "[%@] Burden analysis run, no sample created as there was not enough tachograms for the previous seven days";
      goto LABEL_14;
    case 4:
      _HKInitializeLogging();
      HKHRAFibBurdenLogForCategory();
      v7 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        goto LABEL_16;
      v11 = 138412290;
      v12 = self;
      v8 = "[%@] Burden analysis run, no sample created as there was not enough days in previous seven days with minimum "
           "tachogram threshold";
      goto LABEL_14;
    case 5:
      _HKInitializeLogging();
      HKHRAFibBurdenLogForCategory();
      v7 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        goto LABEL_16;
      v11 = 138412290;
      v12 = self;
      v8 = "[%@] Burden analysis run, no sample created as there was not enough segments";
LABEL_14:
      v9 = v7;
      v10 = 12;
LABEL_15:
      _os_log_impl(&dword_1CC29C000, v9, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v11, v10);
LABEL_16:

LABEL_17:
      return;
    default:
      goto LABEL_17;
  }
}

- (BOOL)_determineIfAnotherAnalysisRunIsNecessaryWithAnalysisResult:(int64_t)a3
{
  return a3 == 1;
}

- (void)_reportAnalysisResultsToDelegate:(id)a3 featureStatus:(id)a4
{
  id v6;
  uint64_t v7;
  id WeakRetained;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  v7 = objc_msgSend(v10, "result");
  if ((unint64_t)(v7 - 3) < 3)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "sevenDayAnalysisScheduler:didSuccessfullyCompleteAnalysisWithSample:onboardedWithinAnalysisInterval:featureStatus:", self, 0, objc_msgSend(v10, "onboardedWithinAnalysisInterval"), v6);
LABEL_5:

    goto LABEL_6;
  }
  if (!v7)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v10, "sampleCreated");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "sevenDayAnalysisScheduler:didSuccessfullyCompleteAnalysisWithSample:onboardedWithinAnalysisInterval:featureStatus:", self, v9, objc_msgSend(v10, "onboardedWithinAnalysisInterval"), v6);

    goto LABEL_5;
  }
LABEL_6:

}

- (void)_saveLastAnalysisCompletedDateForResult:(id)a3
{
  unint64_t v4;
  NSObject *v5;
  HDKeyValueDomain *syncedKeyValueDomain;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  id v11;
  uint8_t buf[4];
  HKHRAFibBurdenSevenDayAnalysisScheduler *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = objc_msgSend(a3, "result");
  if (v4 <= 5)
  {
    if (((1 << v4) & 0x39) != 0)
    {
      _HKInitializeLogging();
      HKHRAFibBurdenLogForCategory();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v13 = self;
        _os_log_impl(&dword_1CC29C000, v5, OS_LOG_TYPE_DEFAULT, "[%@] Saving analysis completed date", buf, 0xCu);
      }

      syncedKeyValueDomain = self->_syncedKeyValueDomain;
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = *MEMORY[0x1E0D2FA80];
      v11 = 0;
      -[HDKeyValueDomain setDate:forKey:error:](syncedKeyValueDomain, "setDate:forKey:error:", v7, v8, &v11);
      v9 = v11;

      if (v9)
      {
        _HKInitializeLogging();
        HKHRAFibBurdenLogForCategory();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          -[HKHRAFibBurdenSevenDayAnalysisScheduler _saveLastAnalysisCompletedDateForResult:].cold.1();

      }
      notify_post((const char *)*MEMORY[0x1E0D2FA78]);
    }
    else
    {
      _HKInitializeLogging();
      HKHRAFibBurdenLogForCategory();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v13 = self;
        _os_log_impl(&dword_1CC29C000, v9, OS_LOG_TYPE_DEFAULT, "[%@] Skipping save analysis completed date - analysis not completed", buf, 0xCu);
      }
    }

  }
}

- (HKHRAFibBurdenSevenDayAnalysisSchedulerDelegate)delegate
{
  return (HKHRAFibBurdenSevenDayAnalysisSchedulerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_syncedKeyValueDomain, 0);
  objc_storeStrong((id *)&self->_breadcrumbManager, 0);
  objc_storeStrong((id *)&self->_scheduler, 0);
  objc_storeStrong((id *)&self->_alarm, 0);
  objc_storeStrong((id *)&self->_featureStatusInspector, 0);
  objc_storeStrong((id *)&self->_featureStatusManager, 0);
  objc_storeStrong((id *)&self->_analysisManager, 0);
  objc_destroyWeak((id *)&self->_profile);
}

- (void)analysisSchedulerDidFire:completion:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CC29C000, v0, v1, "[%@] Error when getting initial feature status: %@");
}

- (void)_saveLastAnalysisCompletedDateForResult:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CC29C000, v0, v1, "[%@] Error when saving analysis date: %@");
}

@end
