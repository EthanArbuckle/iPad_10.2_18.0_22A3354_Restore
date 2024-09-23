@implementation HDAWDSubmissionManager

- (HDAWDSubmissionManager)initWithProfile:(id)a3
{
  id v5;
  HDAWDSubmissionManager *v6;
  uint64_t v7;
  OS_dispatch_queue *queue;
  void *v9;
  NSMutableArray *v10;
  id WeakRetained;
  void *v12;
  void *v13;
  int v14;
  _HDAWDPeriodicAction *v15;
  __CFString *v16;
  __CFString *v17;
  _QWORD *v18;
  HDAWDSubmissionManager *v19;
  uint64_t v20;
  OS_dispatch_queue *v21;
  uint64_t v22;
  _HDAWDPeriodicAction *v23;
  uint64_t v24;
  OS_dispatch_queue *v25;
  uint64_t v26;
  HDProfile *profile;
  uint64_t v28;
  NSMutableDictionary *serverConnectionsByComponentId;
  uint64_t v30;
  NSMutableArray *actions;
  uint64_t v32;
  OS_dispatch_queue *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  NSMutableArray *v43;
  NSMutableArray *v44;
  void *v46;
  id obj;
  _QWORD v48[4];
  id v49;
  id location;
  objc_super v51;
  objc_super v52;

  v5 = a3;
  v51.receiver = self;
  v51.super_class = (Class)HDAWDSubmissionManager;
  v6 = -[HDAWDSubmissionManager init](&v51, sel_init);
  if (v6)
  {
    if (!v5)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, CFSTR("HDAWDSubmissionManager.m"), 448, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("profile"));

    }
    HKCreateSerialDispatchQueue();
    v7 = objc_claimAutoreleasedReturnValue();
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v7;

    objc_storeWeak((id *)&v6->_profile, v5);
    v6->_fitnessDailyCollectionEnabledNotifyToken = -1;
    objc_msgSend(MEMORY[0x1E0D29830], "sharedDiagnosticManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v6);

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v10 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained((id *)&v6->_profile);
    objc_msgSend(WeakRetained, "daemon");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "behavior");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "supportsAWDMetricSubmission");

    if (v14)
    {
      objc_initWeak(&location, v6);
      v15 = [_HDAWDPeriodicAction alloc];
      v48[0] = MEMORY[0x1E0C809B0];
      v48[1] = 3221225472;
      v48[2] = __42__HDAWDSubmissionManager_initWithProfile___block_invoke;
      v48[3] = &unk_1E6CF9B80;
      objc_copyWeak(&v49, &location);
      v16 = CFSTR("com.apple.healthd.awd-submission-manager.heart-daily-analytics");
      v17 = CFSTR("HDAWDSubmissionManager.HeartDailyAnalytics");
      obj = v5;
      v18 = v48;
      if (v15)
      {
        v52.receiver = v15;
        v52.super_class = (Class)_HDAWDPeriodicAction;
        v19 = -[HDAWDSubmissionManager init](&v52, sel_init);
        if (v19)
        {
          HKCreateSerialDispatchQueue();
          v20 = objc_claimAutoreleasedReturnValue();
          v21 = v19[1]._queue;
          v19[1]._queue = (OS_dispatch_queue *)v20;

          v22 = objc_msgSend(CFSTR("com.apple.healthd.awd-submission-manager.heart-daily-analytics"), "copy");
          v23 = (_HDAWDPeriodicAction *)*MEMORY[0x1E0C807B8];
          v24 = *MEMORY[0x1E0C807F0];
          v25 = v19[2]._queue;
          v19[2]._queue = (OS_dispatch_queue *)v22;

          v19->_fitnessDailyAction = v23;
          *(_QWORD *)&v19->_started = v24;
          LOBYTE(v19->_testHandler) = 1;
          *(int64x2_t *)&v19[1].super.isa = vdupq_n_s64(1uLL);
          v19[1]._serverConnectionsByComponentId = (NSMutableDictionary *)0x40C5180000000000;
          objc_msgSend(CFSTR("HDAWDSubmissionManager.HeartDailyAnalytics"), "stringByAppendingString:", CFSTR(".WaitingToRun"));
          v26 = objc_claimAutoreleasedReturnValue();
          profile = v19->_profile;
          v19->_profile = (HDProfile *)v26;

          objc_msgSend(CFSTR("HDAWDSubmissionManager.HeartDailyAnalytics"), "stringByAppendingString:", CFSTR(".LastSubmissionAttempt"));
          v28 = objc_claimAutoreleasedReturnValue();
          serverConnectionsByComponentId = v19->_serverConnectionsByComponentId;
          v19->_serverConnectionsByComponentId = (NSMutableDictionary *)v28;

          objc_msgSend(CFSTR("HDAWDSubmissionManager.HeartDailyAnalytics"), "stringByAppendingString:", CFSTR(".IntervalCounter"));
          v30 = objc_claimAutoreleasedReturnValue();
          actions = v19->_actions;
          v19->_actions = (NSMutableArray *)v30;

          objc_msgSend(CFSTR("HDAWDSubmissionManager.HeartDailyAnalytics"), "stringByAppendingString:", CFSTR(".LastProcessedDate"));
          v32 = objc_claimAutoreleasedReturnValue();
          v33 = v19->_queue;
          v19->_queue = (OS_dispatch_queue *)v32;

          objc_storeWeak((id *)&v19[1]._actions, obj);
          v34 = _Block_copy(v18);
          v35 = *(void **)&v19[1]._started;
          *(_QWORD *)&v19[1]._started = v34;

          objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v19[2].super.isa = (Class)objc_msgSend(v36, "integerForKey:", v19->_profile);

          objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v19[2]._serverConnectionsByComponentId = (NSMutableDictionary *)objc_msgSend(v37, "integerForKey:", v19->_actions);

          objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "objectForKey:", v19->_serverConnectionsByComponentId);
          v39 = (void *)objc_claimAutoreleasedReturnValue();

          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            objc_storeStrong((id *)&v19[2]._profile, v39);
          objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "objectForKey:", v19->_queue);
          v41 = (void *)objc_claimAutoreleasedReturnValue();

          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            objc_storeStrong((id *)&v19[2]._actions, v41);

        }
      }
      else
      {
        v19 = 0;
      }

      -[NSMutableArray addObject:](v10, "addObject:", v19);
      objc_storeStrong((id *)&v6->_actions, v10);
      v42 = objc_loadWeakRetained((id *)&v6->_profile);
      objc_msgSend(v42, "registerProfileReadyObserver:queue:", v6, v6->_queue);

      objc_destroyWeak(&v49);
      objc_destroyWeak(&location);
    }
    else
    {
      v43 = v6->_actions;
      v6->_actions = v10;
      v44 = v10;

      v10 = (NSMutableArray *)objc_loadWeakRetained((id *)&v6->_profile);
      -[NSMutableArray registerProfileReadyObserver:queue:](v10, "registerProfileReadyObserver:queue:", v6, v6->_queue);

    }
  }

  return v6;
}

BOOL __42__HDAWDSubmissionManager_initWithProfile___block_invoke(uint64_t a1, void *a2, int a3)
{
  id *v4;
  id v5;
  id *WeakRetained;
  NSObject **v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  NSObject *v13;
  id v14;
  const char *v15;
  NSObject *v16;
  uint32_t v17;
  void *v18;
  int v19;
  NSObject *v20;
  id v21;
  void *v22;
  id *v23;
  id v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  char v33;
  HDHeartDailyAnalyticsBuilder *v34;
  HDHeartDailyAnalyticsBuilder *v35;
  void *v36;
  id v37;
  void *v38;
  _BOOL8 v39;
  id v40;
  void *v41;
  void *v42;
  NSObject *v43;
  NSObject *v44;
  NSObject *v45;
  void *v47;
  id v48;
  uint64_t v49;
  void *v50;
  NSObject **v51;
  id *v52;
  HDHeartDailyAnalyticsBuilder *v53;
  id v54;
  void *v55;
  void *v56;
  id v57;
  _BYTE buf[24];
  void *v59;
  NSObject **v60;
  NSObject *v61;
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v4 = (id *)(a1 + 32);
  v5 = a2;
  WeakRetained = (id *)objc_loadWeakRetained(v4);
  v7 = (NSObject **)v5;
  if (!WeakRetained)
  {
    v39 = 0;
    goto LABEL_23;
  }
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D48], "hk_gregorianCalendarWithUTCTimeZone");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  HDHeartDailyAnalyticsProcessingIntervalForCurrentDateAndCalendar((uint64_t)v8, v56);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[_HDAWDPeriodicAction lastProcessedDate]((uint64_t)v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
    goto LABEL_14;
  objc_msgSend(v9, "startDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v10, "hk_isBeforeDate:", v11);

  if (v12)
  {
    _HKInitializeLogging();
    HKLogAnalytics();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = objc_opt_class();
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v10;
      v14 = *(id *)&buf[4];
      v15 = "[%{public}@] Skipping some prior days of HeartDailyAnalytics: last submission was %{public}@";
      v16 = v13;
      v17 = 22;
LABEL_12:
      _os_log_impl(&dword_1B7802000, v16, OS_LOG_TYPE_DEFAULT, v15, buf, v17);

      goto LABEL_13;
    }
    goto LABEL_13;
  }
  objc_msgSend(v9, "startDate");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v10, "hk_isAfterDate:", v18);

  if (!v19)
  {
LABEL_14:
    v55 = v10;
    v50 = v8;
    v51 = v7;
    v52 = WeakRetained;
    v53 = [HDHeartDailyAnalyticsBuilder alloc];
    v23 = WeakRetained + 1;
    v24 = objc_loadWeakRetained(WeakRetained + 1);
    v25 = objc_alloc(MEMORY[0x1E0C99EA0]);
    v26 = (void *)objc_msgSend(v25, "initWithSuiteName:", *MEMORY[0x1E0CB76F8]);
    objc_msgSend(MEMORY[0x1E0C99EA0], "hk_heartRhythmDefaults");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99EA0], "hk_remoteFeatureAvailabilityUserDefaults");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D51838], "sharedInstance");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v9;
    v31 = objc_loadWeakRetained(v23);
    objc_msgSend(v31, "notificationManager");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v32, "areHealthNotificationsAuthorized");
    BYTE1(v49) = HKImproveHealthAndActivityAnalyticsAllowed();
    LOBYTE(v49) = v33;
    v34 = -[HDHeartDailyAnalyticsBuilder initWithProfile:calendar:dateInterval:heartRateNotificationsUserDefaults:heartRhythmUserDefaults:remoteFeatureAvailabilityUserDefaults:pairedDeviceRegistry:areHealthNotificationsAuthorized:isHealthDataSubmissionAllowed:](v53, "initWithProfile:calendar:dateInterval:heartRateNotificationsUserDefaults:heartRhythmUserDefaults:remoteFeatureAvailabilityUserDefaults:pairedDeviceRegistry:areHealthNotificationsAuthorized:isHealthDataSubmissionAllowed:", v24, v56, v30, v26, v27, v28, v29, v49);

    v57 = 0;
    v35 = v34;
    -[HDHeartDailyAnalyticsBuilder heartDailyAnalyticsWithError:](v34, "heartDailyAnalyticsWithError:", &v57);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = v57;
    v38 = v37;
    v39 = v36 != 0;
    if (v36)
    {
      v54 = v37;
      v40 = objc_loadWeakRetained(v23);
      objc_msgSend(v40, "daemon");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "analyticsSubmissionCoordinator");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "heartDaily_reportHeartDailyAnalytics:", v36);

      objc_msgSend(v30, "endDate");
      v43 = (id)objc_claimAutoreleasedReturnValue();
      v44 = v43;
      v7 = v51;
      v9 = v30;
      if (v51)
      {
        v45 = v51[12];
        *(_QWORD *)buf = MEMORY[0x1E0C809B0];
        *(_QWORD *)&buf[8] = 3221225472;
        *(_QWORD *)&buf[16] = __45___HDAWDPeriodicAction_setLastProcessedDate___block_invoke;
        v59 = &unk_1E6CE8080;
        v60 = v51;
        v61 = v43;
        dispatch_async(v45, buf);

      }
      v8 = v50;
      v39 = v36 != 0;
      WeakRetained = v52;
      v38 = v54;
    }
    else
    {
      _HKInitializeLogging();
      HKLogAnalytics();
      v44 = objc_claimAutoreleasedReturnValue();
      WeakRetained = v52;
      if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
      {
        v47 = (void *)objc_opt_class();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v47;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v38;
        v48 = v47;
        _os_log_error_impl(&dword_1B7802000, v44, OS_LOG_TYPE_ERROR, "[%{public}@] Error building heart daily analytics: %{public}@", buf, 0x16u);

        v39 = 0;
      }
      v8 = v50;
      v7 = v51;
      v9 = v30;
    }

    v10 = v55;
    goto LABEL_22;
  }
  _HKInitializeLogging();
  HKLogAnalytics();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = objc_opt_class();
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v10;
    v21 = *(id *)&buf[4];
    _os_log_impl(&dword_1B7802000, v20, OS_LOG_TYPE_DEFAULT, "[%{public}@] Not yet time to submit HeartDailyAnalytics: last submission was %{public}@", buf, 0x16u);

  }
  if (a3)
  {
    _HKInitializeLogging();
    HKLogAnalytics();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v22 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v22;
      v14 = v22;
      v15 = "[%{public}@] This this is a forced submission, so we're submitting anyway";
      v16 = v13;
      v17 = 12;
      goto LABEL_12;
    }
LABEL_13:

    goto LABEL_14;
  }
  v39 = 0;
LABEL_22:

LABEL_23:
  return v39;
}

- (void)dealloc
{
  int fitnessDailyCollectionEnabledNotifyToken;
  id WeakRetained;
  void *v5;
  void *v6;
  objc_super v7;

  fitnessDailyCollectionEnabledNotifyToken = self->_fitnessDailyCollectionEnabledNotifyToken;
  if (fitnessDailyCollectionEnabledNotifyToken != -1)
    notify_cancel(fitnessDailyCollectionEnabledNotifyToken);
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "daemon");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "analyticsSubmissionCoordinator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObserver:", self);

  v7.receiver = self;
  v7.super_class = (Class)HDAWDSubmissionManager;
  -[HDAWDSubmissionManager dealloc](&v7, sel_dealloc);
}

- (id)_actions
{
  NSObject *v1;
  id v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  if (!a1)
    return 0;
  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__100;
  v9 = __Block_byref_object_dispose__100;
  v10 = 0;
  v1 = *(NSObject **)(a1 + 32);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __34__HDAWDSubmissionManager__actions__block_invoke;
  v4[3] = &unk_1E6CE8110;
  v4[4] = a1;
  v4[5] = &v5;
  dispatch_sync(v1, v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

void __34__HDAWDSubmissionManager__actions__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)profileDidBecomeReady:(id)a3
{
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  os_log_t *v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  void *v16;
  HDAWDSubmissionManager *v17;
  NSMutableArray *obj;
  id obja;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t v24[128];
  _BYTE buf[24];
  void *v26;
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v17 = self;
  v4 = self->_actions;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  obj = v4;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v21;
    v8 = (os_log_t *)MEMORY[0x1E0CB52C0];
    v9 = MEMORY[0x1E0C809B0];
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v21 != v7)
          objc_enumerationMutation(obj);
        v11 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i);
        if (v11)
        {
          _HKInitializeLogging();
          v12 = *v8;
          if (os_log_type_enabled(*v8, OS_LOG_TYPE_INFO))
          {
            v13 = *(_QWORD *)(v11 + 160);
            *(_DWORD *)buf = 138543618;
            *(_QWORD *)&buf[4] = v11;
            *(_WORD *)&buf[12] = 2114;
            *(_QWORD *)&buf[14] = v13;
            _os_log_impl(&dword_1B7802000, v12, OS_LOG_TYPE_INFO, "%{public}@: %{public}@ starting", buf, 0x16u);
          }
          v14 = *(NSObject **)(v11 + 96);
          *(_QWORD *)buf = v9;
          *(_QWORD *)&buf[8] = 3221225472;
          *(_QWORD *)&buf[16] = __29___HDAWDPeriodicAction_start__block_invoke;
          v26 = &unk_1E6CE80E8;
          v27 = v11;
          dispatch_sync(v14, buf);
        }
      }
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v6);
  }
  v17->_started = 1;

  obja = objc_loadWeakRetained((id *)&v17->_profile);
  objc_msgSend(obja, "daemon");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "analyticsSubmissionCoordinator");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addObserver:queue:", v17, v17->_queue);

}

- (id)diagnosticDescription
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  void (*v7)(uint64_t);
  id v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  id v14;
  void *v15;
  uint64_t v16;
  id obj;
  uint64_t v19;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void (*v29)(uint64_t);
  uint64_t *v30;
  uint64_t block;
  uint64_t p_block;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  uint64_t *v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v20 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  -[HDAWDSubmissionManager _actions]((uint64_t)self);
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v37, 16);
  if (v3)
  {
    v4 = v3;
    v19 = *(_QWORD *)v22;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v22 != v19)
          objc_enumerationMutation(obj);
        v6 = *(id *)(*((_QWORD *)&v21 + 1) + 8 * v5);
        v7 = (void (*)(uint64_t))v6;
        if (v6)
        {
          v8 = *((id *)v6 + 20);
          v25 = 0;
          v26 = (uint64_t)&v25;
          v27 = 0x2020000000;
          v28 = 0;
          v9 = *((_QWORD *)v7 + 12);
          v10 = MEMORY[0x1E0C809B0];
          block = MEMORY[0x1E0C809B0];
          p_block = 3221225472;
          v33 = (uint64_t)__39___HDAWDPeriodicAction_intervalCounter__block_invoke;
          v34 = (uint64_t (*)(uint64_t, uint64_t))&unk_1E6CE8110;
          v35 = v7;
          v36 = &v25;
          dispatch_sync(v9, &block);
          v11 = *(_QWORD *)(v26 + 24);
          _Block_object_dispose(&v25, 8);
          v12 = *((_QWORD *)v7 + 16);
          block = 0;
          p_block = (uint64_t)&block;
          v33 = 0x3032000000;
          v34 = __Block_byref_object_copy__100;
          v35 = __Block_byref_object_dispose__100;
          v36 = 0;
          v13 = *((_QWORD *)v7 + 12);
          v25 = v10;
          v26 = 3221225472;
          v27 = (uint64_t)__49___HDAWDPeriodicAction_lastSubmissionAttemptDate__block_invoke;
          v28 = &unk_1E6CE8110;
          v29 = v7;
          v30 = &block;
          dispatch_sync(v13, &v25);
          v14 = *(id *)(p_block + 40);
          _Block_object_dispose(&block, 8);

        }
        else
        {
          v12 = 0;
          v8 = 0;
          v11 = 0;
          v14 = 0;
        }
        -[_HDAWDPeriodicAction lastProcessedDate]((uint64_t)v7);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "appendFormat:", CFSTR("%@: counter:%ld waiting:%ld last:%@ processed:%@\n"), v8, v11, v12, v14, v15);

        ++v5;
      }
      while (v4 != v5);
      v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v37, 16);
      v4 = v16;
    }
    while (v16);
  }

  return v20;
}

- (BOOL)runTask:(id)a3 error:(id *)a4
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  void *v14;
  uint64_t v15;
  double *v16;
  void *v17;
  BOOL v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  -[HDAWDSubmissionManager _actions]((uint64_t)self);
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v26;
    while (2)
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v26 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD **)(*((_QWORD *)&v25 + 1) + 8 * v12);
        if (v13)
          v14 = (void *)v13[20];
        else
          v14 = 0;
        if ((objc_msgSend(v14, "isEqualToString:", v7) & 1) != 0)
        {
          v16 = v13;

          if (!v13)
            goto LABEL_17;
          if (((*(uint64_t (**)(void))(*((_QWORD *)v16 + 14) + 16))() & 1) != 0)
          {
            objc_msgSend(*((id *)v16 + 15), "didPerformActivityWithResult:minimumRetryInterval:activityStartDate:error:", 0, 0, 0, v16[10]);
            v17 = 0;
            v18 = 1;
            goto LABEL_27;
          }
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ activity %@ failed during forced execution"), objc_opt_class(), *((_QWORD *)v16 + 20), (_QWORD)v25);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:", 100, v21);
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(*((id *)v16 + 15), "didPerformActivityWithResult:minimumRetryInterval:activityStartDate:error:", 2, 0, v22, v16[10]);
          objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:format:", 100, CFSTR("Failed to complete task %@"), v7);
          v23 = (id)objc_claimAutoreleasedReturnValue();
          v17 = v23;
          if (v23)
          {
            if (a4)
            {
              v20 = objc_retainAutorelease(v23);
              v17 = v20;
              goto LABEL_23;
            }
            _HKLogDroppedError();
          }
          goto LABEL_26;
        }
        ++v12;
      }
      while (v10 != v12);
      v15 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      v10 = v15;
      if (v15)
        continue;
      break;
    }
  }

LABEL_17:
  objc_msgSend(MEMORY[0x1E0CB35C8], "hk_errorForInvalidArgument:class:selector:format:", CFSTR("@\"\"), objc_opt_class(), a2, CFSTR("AWD task '%@' not found"), v7);
  v19 = (id)objc_claimAutoreleasedReturnValue();
  v17 = v19;
  if (!v19)
    goto LABEL_25;
  if (!a4)
  {
    _HKLogDroppedError();
LABEL_25:
    v16 = 0;
    goto LABEL_26;
  }
  v20 = objc_retainAutorelease(v19);
  v17 = v20;
  v16 = 0;
LABEL_23:
  *a4 = v20;
LABEL_26:

  v18 = 0;
LABEL_27:

  return v18;
}

- (void)resetTask:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _QWORD block[5];
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HDAWDSubmissionManager _actions]((uint64_t)self);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v9);
        if (v10)
        {
          if ((objc_msgSend(*(id *)(v10 + 160), "isEqualToString:", v4) & 1) != 0)
          {
            v12 = *(NSObject **)(v10 + 96);
            block[0] = MEMORY[0x1E0C809B0];
            block[1] = 3221225472;
            block[2] = __29___HDAWDPeriodicAction_reset__block_invoke;
            block[3] = &unk_1E6CE80E8;
            block[4] = v10;
            dispatch_sync(v12, block);
            goto LABEL_15;
          }
        }
        else if ((objc_msgSend(0, "isEqualToString:", v4, (_QWORD)v13) & 1) != 0)
        {
          goto LABEL_15;
        }
        ++v9;
      }
      while (v7 != v9);
      v11 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
      v7 = v11;
    }
    while (v11);
  }
LABEL_15:

}

- (uint64_t)_countOfObjectsWithSQLQuery:(uint64_t)a1 database:(void *)a2 error:(void *)a3 bindingHandler:(uint64_t)a4
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;

  v7 = a2;
  v8 = a3;
  v9 = v8;
  if (a1)
  {
    v13 = 0;
    v14 = &v13;
    v15 = 0x2020000000;
    v16 = 0;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __84__HDAWDSubmissionManager__countOfObjectsWithSQLQuery_database_error_bindingHandler___block_invoke;
    v12[3] = &unk_1E6CE8540;
    v12[4] = &v13;
    if (objc_msgSend(v8, "executeSQL:error:bindingHandler:enumerationHandler:", v7, a4, 0, v12))
    {
      v10 = v14[3];
    }
    else
    {
      v10 = -1;
      v14[3] = -1;
    }
    _Block_object_dispose(&v13, 8);
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

uint64_t __84__HDAWDSubmissionManager__countOfObjectsWithSQLQuery_database_error_bindingHandler___block_invoke(uint64_t a1)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = HDSQLiteColumnAsInt64();
  return 0;
}

- (int64_t)_manuallyEnteredTypesCountWithTransaction:(id)a3 error:(id *)a4
{
  id v6;
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
  void *v17;
  void *v18;
  int64_t v19;
  void *v21;
  void *v22;
  void *v23;
  void *v24;

  v6 = a3;
  HDSourceEntityPredicateForSourceWithBundleIdentifier((uint64_t)CFSTR("com.apple.Health"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "unprotectedDatabase");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDSourceEntity sourcesWithPredicate:includeDeleted:database:error:](HDSourceEntity, "sourcesWithPredicate:includeDeleted:database:error:", v7, 0, v8, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v9, "hk_map:", &__block_literal_global_108);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "componentsJoinedByString:", CFSTR(", "));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v22 = (void *)MEMORY[0x1E0CB3940];
    +[HDSQLiteSchemaEntity disambiguatedDatabaseTable](HDSampleEntity, "disambiguatedDatabaseTable");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    +[HDSQLiteSchemaEntity disambiguatedDatabaseTable](HDDataEntity, "disambiguatedDatabaseTable");
    v23 = v6;
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v7;
    +[HDSQLiteSchemaEntity disambiguatedDatabaseTable](HDDataProvenanceEntity, "disambiguatedDatabaseTable");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[HDSQLiteSchemaEntity disambiguatedDatabaseTable](HDDataProvenanceEntity, "disambiguatedDatabaseTable");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[HDSQLiteSchemaEntity disambiguatedDatabaseTable](HDMetadataValueEntity, "disambiguatedDatabaseTable");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[HDSQLiteSchemaEntity disambiguatedDatabaseTable](HDMetadataKeyEntity, "disambiguatedDatabaseTable");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "stringWithFormat:", CFSTR("SELECT COUNT(DISTINCT %@) FROM %@ s INNER JOIN %@ o USING (%@) INNER JOIN %@ ON (o.%@ = %@.rowid) INNER JOIN %@ mv ON (mv.%@ = o.%@) INNER JOIN %@ mk ON (mk.rowid = mv.%@) WHERE (%@ in (%@)) AND mk.%@='%@' AND mv.%@ > 0"), CFSTR("data_type"), v21, v12, CFSTR("data_id"), v13, CFSTR("provenance"), v14, v15, CFSTR("object_id"), CFSTR("data_id"), v16, CFSTR("key_id"), CFSTR("data_provenances.source_id"), v11, CFSTR("key"), *MEMORY[0x1E0CB5608],
      CFSTR("numerical_value"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = v23;
    objc_msgSend(v23, "protectedDatabase");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = -[HDAWDSubmissionManager _countOfObjectsWithSQLQuery:database:error:bindingHandler:]((uint64_t)self, v17, v18, (uint64_t)a4);

    v7 = v24;
  }
  else
  {
    v19 = -1;
  }

  return v19;
}

uint64_t __74__HDAWDSubmissionManager__manuallyEnteredTypesCountWithTransaction_error___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(a2, "persistentID"));
}

- (int64_t)_nonAppleSourcesWithDataSince:(id)a3 transaction:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  int64_t v23;
  void *v25;
  void *v26;
  HDAWDSubmissionManager *v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = (void *)MEMORY[0x1E0D298B0];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%@ & %llu) == 0"), CFSTR("source_options"), 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = CFSTR("source_options");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "predicateWithSQL:overProperties:values:", v11, v12, MEMORY[0x1E0C9AA60]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "unprotectedDatabase");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDSourceEntity sourcesWithPredicate:includeDeleted:database:error:](HDSourceEntity, "sourcesWithPredicate:includeDeleted:database:error:", v13, 0, v14, a5);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    objc_msgSend(v15, "hk_map:", &__block_literal_global_360);
    v27 = self;
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "componentsJoinedByString:", CFSTR(", "));
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    v26 = (void *)MEMORY[0x1E0CB3940];
    +[HDSQLiteSchemaEntity disambiguatedDatabaseTable](HDDataEntity, "disambiguatedDatabaseTable");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    +[HDSQLiteSchemaEntity disambiguatedDatabaseTable](HDDataProvenanceEntity, "disambiguatedDatabaseTable");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    +[HDSQLiteSchemaEntity disambiguatedDatabaseTable](HDDataProvenanceEntity, "disambiguatedDatabaseTable");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "timeIntervalSinceReferenceDate");
    objc_msgSend(v26, "stringWithFormat:", CFSTR("SELECT COUNT(*) FROM(SELECT %@, COUNT(*) AS rows FROM %@ o  INNER JOIN %@ ON (o.%@ = %@.rowid)  WHERE (%@ in (%@))  AND o.%@ > %.0lf GROUP BY %@) WHERE rows > 0"), CFSTR("data_provenances.source_id"), v17, v18, CFSTR("provenance"), v19, CFSTR("data_provenances.source_id"), v25, CFSTR("creation_date"), v20, CFSTR("data_provenances.source_id"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "protectedDatabase");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = -[HDAWDSubmissionManager _countOfObjectsWithSQLQuery:database:error:bindingHandler:]((uint64_t)v27, v21, v22, (uint64_t)a5);

  }
  else
  {
    v23 = -1;
  }

  return v23;
}

uint64_t __74__HDAWDSubmissionManager__nonAppleSourcesWithDataSince_transaction_error___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(a2, "persistentID"));
}

- (int64_t)_int64ForKeyPrefix:(id)a3 profile:(id)a4 date:(id *)a5 error:(id *)a6
{
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v26;
  void *v27;
  _QWORD v28[3];

  v28[2] = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  if (a5)
  {
    if (a6)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDAWDSubmissionManager.m"), 749, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("date != NULL"));

    if (a6)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDAWDSubmissionManager.m"), 750, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("error != NULL"));

LABEL_3:
  v13 = v11;
  objc_msgSend(v13, "stringByAppendingString:", CFSTR("_DATE"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v13;
  v28[1] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDKeyValueEntity valuesForKeys:domain:category:profile:error:](HDUnprotectedKeyValueEntity, "valuesForKeys:domain:category:profile:error:", v15, CFSTR("DATABASE_SIZE"), 0, v12, a6);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    objc_msgSend(v16, "objectForKeyedSubscript:", v13);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (v17)
      v19 = objc_msgSend(v17, "longLongValue");
    else
      v19 = -1;
    objc_msgSend(v16, "objectForKeyedSubscript:", v14);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v21;
    if (v21)
    {
      v23 = (void *)MEMORY[0x1E0C99D68];
      objc_msgSend(v21, "doubleValue");
      objc_msgSend(v23, "dateWithTimeIntervalSinceReferenceDate:");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v20 = 0;
    }

  }
  else
  {
    v20 = 0;
    v19 = -1;
  }
  v24 = objc_retainAutorelease(v20);
  *a5 = v24;

  return v19;
}

- (BOOL)_setInt64:(int64_t)a3 keyPrefix:(id)a4 profile:(id)a5 date:(id)a6 error:(id *)a7
{
  void *v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  _QWORD v23[2];
  _QWORD v24[3];

  v24[2] = *MEMORY[0x1E0C80C00];
  v23[0] = a4;
  v11 = (void *)MEMORY[0x1E0CB37E8];
  v12 = a6;
  v13 = a5;
  v14 = a4;
  objc_msgSend(v11, "numberWithLongLong:", a3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v15;
  objc_msgSend(v14, "stringByAppendingString:", CFSTR("_DATE"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v23[1] = v16;
  v17 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v12, "timeIntervalSinceReferenceDate");
  v19 = v18;

  objc_msgSend(v17, "numberWithDouble:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v24[1] = v20;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 2);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a7) = +[HDKeyValueEntity setValuesWithDictionary:domain:category:profile:error:](HDUnprotectedKeyValueEntity, "setValuesWithDictionary:domain:category:profile:error:", v21, CFSTR("DATABASE_SIZE"), 0, v13, a7);

  return (char)a7;
}

- (id)_updateDeltaToInt64:(int64_t)a3 forKey:(id)a4 profile:(id)a5 currentDate:(id)a6 timeInterval:(double)a7 error:(id *)a8
{
  id v14;
  id v15;
  id v16;
  int64_t v17;
  id v18;
  void *v19;
  void *v20;
  double v21;
  BOOL v22;
  id v23;
  void *v24;
  id v26;
  id v27;

  v14 = a4;
  v15 = a5;
  v16 = a6;
  v27 = 0;
  v17 = -[HDAWDSubmissionManager _int64ForKeyPrefix:profile:date:error:](self, "_int64ForKeyPrefix:profile:date:error:", v14, v15, &v27, a8);
  v18 = v27;
  v19 = v18;
  v20 = 0;
  if ((v17 & 0x8000000000000000) == 0 && v18)
  {
    objc_msgSend(v16, "timeIntervalSinceDate:", v18);
    if (v21 <= a7 + -43200.0)
    {
      v20 = 0;
      if (v21 < a7 && v21 >= 0.0)
      {
        v20 = &unk_1E6DFCAB8;
        goto LABEL_11;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", (double)(a3 - v17) * a7 / v21);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  v26 = 0;
  v22 = -[HDAWDSubmissionManager _setInt64:keyPrefix:profile:date:error:](self, "_setInt64:keyPrefix:profile:date:error:", a3, v14, v15, v16, &v26);
  v23 = v26;
  if (!v22)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Saving new 'last' value for %@"), v14);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    _HKLogDroppedErrorWithReason();

  }
LABEL_11:

  return v20;
}

- (BOOL)aggregateDatabaseSizeStats:(id)a3
{
  id v4;
  id WeakRetained;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  void *v25;
  void *v26;
  id v27;
  id v29;
  id v30;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  v6 = HDDatabaseSizeInMB(WeakRetained);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", HDBucketedDatabaseSizeInMB(v6));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, CFSTR("totalDatabaseSize"));

  v8 = (void *)MEMORY[0x1E0CB37E8];
  v9 = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(v8, "numberWithLongLong:", HDDatabaseBucketedSizeInMBForDatabaseType(v9, 1, 0));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v10, CFSTR("unprotectedDatabaseSize"));

  v11 = (void *)MEMORY[0x1E0CB37E8];
  v12 = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(v11, "numberWithLongLong:", HDDatabaseBucketedSizeInMBForDatabaseType(v12, 1, 1));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v13, CFSTR("unprotectedDatabaseWALSize"));

  v14 = (void *)MEMORY[0x1E0CB37E8];
  v15 = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(v14, "numberWithLongLong:", HDDatabaseBucketedSizeInMBForDatabaseType(v15, 0, 0));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v16, CFSTR("protectedDatabaseSize"));

  v17 = (void *)MEMORY[0x1E0CB37E8];
  v18 = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(v17, "numberWithLongLong:", HDDatabaseBucketedSizeInMBForDatabaseType(v18, 0, 1));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v19, CFSTR("protectedDatabaseWALSize"));

  v20 = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = 0;
  -[HDAWDSubmissionManager _updateDeltaToInt64:forKey:profile:currentDate:timeInterval:error:](self, "_updateDeltaToInt64:forKey:profile:currentDate:timeInterval:error:", v6, CFSTR("LAST_MONTH_DATABASE_SIZE"), v20, v21, &v30, 2592000.0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v30;

  if (v22)
  {
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v22, CFSTR("lastMonthDatabaseSizeIncreaseMB"));
  }
  else if (v23)
  {
    _HKLogDroppedErrorWithReason();
  }
  v24 = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v23;
  -[HDAWDSubmissionManager _updateDeltaToInt64:forKey:profile:currentDate:timeInterval:error:](self, "_updateDeltaToInt64:forKey:profile:currentDate:timeInterval:error:", v6, CFSTR("LAST_WEEK_DATABASE_SIZE"), v24, v25, &v29, 604800.0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v29;

  if (v26)
  {
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v26, CFSTR("lastWeekDatabaseSizeIncreaseMB"));
  }
  else if (v27)
  {
    _HKLogDroppedErrorWithReason();
  }

  return 1;
}

- (void)reportDailyAnalyticsWithCoordinator:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  _BOOL4 v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  int v26;
  id v27;
  int v28;
  NSObject *v29;
  NSObject *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, void *, uint64_t);
  void *v34;
  HDAWDSubmissionManager *v35;
  id v36;
  id v37;
  id v38;
  uint8_t buf[4];
  HDAWDSubmissionManager *v40;
  __int16 v41;
  id v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "database");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[HDAWDSubmissionManager aggregateDatabaseSizeStats:](self, "aggregateDatabaseSizeStats:", v6);
  v10 = v6;
  if (self)
  {
    v11 = objc_loadWeakRetained((id *)&self->_profile);
    objc_msgSend(v11, "deviceContextManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = 0;
    objc_msgSend(v12, "numberOfDeviceContextsPerDeviceType:", &v38);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v38;

    if (v14)
    {
      _HKInitializeLogging();
      v15 = *MEMORY[0x1E0CB5370];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        v40 = self;
        v41 = 2114;
        v42 = v14;
        _os_log_error_impl(&dword_1B7802000, v15, OS_LOG_TYPE_ERROR, "%{public}@: Failed to get device contexts dictionary for healthd daily analytics: %{public}@", buf, 0x16u);
      }
    }
    objc_msgSend(v13, "objectForKeyedSubscript:", &unk_1E6DFCAD0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      objc_msgSend(v13, "objectForKeyedSubscript:", &unk_1E6DFCAD0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setObject:forKeyedSubscript:", v17, CFSTR("countPairediPhone"));

    }
    else
    {
      objc_msgSend(v10, "setObject:forKeyedSubscript:", &unk_1E6DFCAE8, CFSTR("countPairediPhone"));
    }

    objc_msgSend(v13, "objectForKeyedSubscript:", &unk_1E6DFCB00);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      objc_msgSend(v13, "objectForKeyedSubscript:", &unk_1E6DFCB00);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setObject:forKeyedSubscript:", v19, CFSTR("countPairediPad"));

    }
    else
    {
      objc_msgSend(v10, "setObject:forKeyedSubscript:", &unk_1E6DFCAE8, CFSTR("countPairediPad"));
    }

    objc_msgSend(v13, "objectForKeyedSubscript:", &unk_1E6DFCB18);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      objc_msgSend(v13, "objectForKeyedSubscript:", &unk_1E6DFCB18);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setObject:forKeyedSubscript:", v21, CFSTR("countPairedWatch"));

    }
    else
    {
      objc_msgSend(v10, "setObject:forKeyedSubscript:", &unk_1E6DFCAE8, CFSTR("countPairedWatch"));
    }

    objc_msgSend(v13, "objectForKeyedSubscript:", &unk_1E6DFCB30);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (v22)
    {
      objc_msgSend(v13, "objectForKeyedSubscript:", &unk_1E6DFCB30);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setObject:forKeyedSubscript:", v23, CFSTR("countPairedVisionPro"));

    }
    else
    {
      objc_msgSend(v10, "setObject:forKeyedSubscript:", &unk_1E6DFCAE8, CFSTR("countPairedVisionPro"));
    }

  }
  +[HDDatabaseTransactionContext contextForReadingProtectedData](HDDatabaseTransactionContext, "contextForReadingProtectedData");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = 0;
  v31 = MEMORY[0x1E0C809B0];
  v32 = 3221225472;
  v33 = __73__HDAWDSubmissionManager_reportDailyAnalyticsWithCoordinator_completion___block_invoke;
  v34 = &unk_1E6CE7950;
  v35 = self;
  v25 = v10;
  v36 = v25;
  v26 = objc_msgSend(v8, "performTransactionWithContext:error:block:inaccessibilityHandler:", v24, &v37, &v31, 0);
  v27 = v37;

  if (self && (v26 & v9 & 1) != 0)
  {
    (*((void (**)(id, id, _QWORD, _QWORD))v5 + 2))(v5, v25, 0, 0);
  }
  else
  {
    v28 = objc_msgSend(v27, "hk_isDatabaseAccessibilityError", v31, v32, v33, v34, v35);
    _HKInitializeLogging();
    v29 = *MEMORY[0x1E0CB52C0];
    v30 = *MEMORY[0x1E0CB52C0];
    if (v28)
    {
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v40 = self;
        v41 = 2114;
        v42 = v27;
        _os_log_impl(&dword_1B7802000, v29, OS_LOG_TYPE_DEFAULT, "%{public}@: Database inaccessible while computing usage metric, will retry: %{public}@", buf, 0x16u);
      }
    }
    else if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v40 = self;
      v41 = 2114;
      v42 = v27;
      _os_log_error_impl(&dword_1B7802000, v29, OS_LOG_TYPE_ERROR, "%{public}@: Failed queries for daily healthd metrics, will retry: %{public}@", buf, 0x16u);
    }
    (*((void (**)(id, _QWORD, uint64_t, id))v5 + 2))(v5, 0, 2, v27);
  }

}

uint64_t __73__HDAWDSubmissionManager_reportDailyAnalyticsWithCoordinator_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  uint64_t v32;
  void *v33;

  v5 = a2;
  v6 = objc_msgSend(*(id *)(a1 + 32), "_manuallyEnteredTypesCountWithTransaction:error:", v5, a3);
  if (v6 < 0)
    goto LABEL_18;
  v7 = v6;
  v8 = *(_QWORD *)(a1 + 32);
  if (!v8)
  {
    v14 = 0;
    goto LABEL_4;
  }
  v9 = (void *)MEMORY[0x1E0CB3940];
  v10 = v5;
  +[HDSQLiteSchemaEntity disambiguatedDatabaseTable](HDSourceEntity, "disambiguatedDatabaseTable");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringWithFormat:", CFSTR("SELECT COUNT(*) FROM %@ WHERE (%@ & %llu) == 0"), v11, CFSTR("source_options"), 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "unprotectedDatabase");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = -[HDAWDSubmissionManager _countOfObjectsWithSQLQuery:database:error:bindingHandler:](v8, v12, v13, a3);
  if (v14 < 0)
  {
LABEL_18:
    v30 = 0;
    goto LABEL_24;
  }
LABEL_4:
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "dateByAddingTimeInterval:", -604800.0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = objc_msgSend(*(id *)(a1 + 32), "_nonAppleSourcesWithDataSince:transaction:error:", v16, v5, a3);
  if (v17 < 0)
  {
    v30 = 0;
  }
  else
  {
    v32 = v17;
    v33 = v16;
    if (!*(_QWORD *)(a1 + 32))
      goto LABEL_20;
    v18 = *MEMORY[0x1E0D29620];
    v19 = v5;
    HDSourceEntityPredicateForAppleWatchSources();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "unprotectedDatabase");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    +[HDSQLiteEntity countValueForProperty:predicate:database:error:](HDSourceEntity, "countValueForProperty:predicate:database:error:", v18, v20, v21, a3);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v22, "integerValue") > 0);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      if (v23)
      {
        if (v7 >= 10)
          v24 = 10;
        else
          v24 = v7;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v25, CFSTR("manuallyEnteredTypesCount"));

        if (v14 >= 5)
          v26 = 5;
        else
          v26 = v14;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v27, CFSTR("thirdPartyAppCounts"));

        if (v32 >= 5)
          v28 = 5;
        else
          v28 = v32;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v28);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v29, CFSTR("thirdPartyAppsWroteDataCount"));

        objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v23, CFSTR("hasWatchSource"));
        v30 = 1;
      }
      else
      {
        v30 = 0;
      }
    }
    else
    {
LABEL_20:
      v30 = 0;
      v23 = 0;
    }
    v16 = v33;

  }
LABEL_24:

  return v30;
}

- (id)_activitySummaryForActivityCacheIndex:(int64_t)a3 error:(id *)a4
{
  HDActivitySummaryBuilder *v7;
  id WeakRetained;
  HDActivitySummaryBuilder *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v14[5];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v7 = [HDActivitySummaryBuilder alloc];
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  v9 = -[HDActivitySummaryBuilder initWithProfile:](v7, "initWithProfile:", WeakRetained);

  -[HDActivitySummaryBuilder setShouldIncludePrivateProperties:](v9, "setShouldIncludePrivateProperties:", 1);
  -[HDActivitySummaryBuilder setShouldIncludeStatistics:](v9, "setShouldIncludeStatistics:", 0);
  -[HDActivitySummaryBuilder setOrderByDateAscending:](v9, "setOrderByDateAscending:", 1);
  -[HDActivitySummaryBuilder setLimit:](v9, "setLimit:", 1);
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__100;
  v19 = __Block_byref_object_dispose__100;
  v20 = 0;
  HDActivityCacheEntityPredicateForCacheIndex(a3, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __70__HDAWDSubmissionManager__activitySummaryForActivityCacheIndex_error___block_invoke;
  v14[3] = &unk_1E6CF9C08;
  v14[4] = &v15;
  if (-[HDActivitySummaryBuilder enumerateActivitySummariesWithPredicate:error:handler:](v9, "enumerateActivitySummariesWithPredicate:error:handler:", v10, a4, v14))
  {
    v11 = (void *)v16[5];
  }
  else
  {
    v11 = 0;
  }
  v12 = v11;

  _Block_object_dispose(&v15, 8);
  return v12;
}

void __70__HDAWDSubmissionManager__activitySummaryForActivityCacheIndex_error___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  *a3 = 1;
}

- (HDProfile)profile
{
  return (HDProfile *)objc_loadWeakRetained((id *)&self->_profile);
}

- (id)testHandler
{
  return self->_testHandler;
}

- (void)setTestHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_testHandler, 0);
  objc_storeStrong((id *)&self->_fitnessDailyAction, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_actions, 0);
  objc_storeStrong((id *)&self->_serverConnectionsByComponentId, 0);
  objc_destroyWeak((id *)&self->_profile);
}

@end
