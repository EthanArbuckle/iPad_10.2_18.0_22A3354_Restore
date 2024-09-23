@implementation HDWorkoutCondenser

- (HDWorkoutCondenser)initWithProfile:(id)a3
{
  id v4;
  HDWorkoutCondenser *v5;
  HDWorkoutCondenser *v6;
  uint64_t v7;
  OS_dispatch_queue *queue;
  void *v9;
  void *v10;
  int v11;
  const char *v12;
  NSObject *v13;
  uint64_t v14;
  int *v15;
  const char *v16;
  NSObject *v17;
  void *periodicActivity;
  HDPeriodicActivity *v19;
  uint64_t v20;
  _QWORD v22[4];
  int *v23;
  _QWORD handler[4];
  int *v25;
  objc_super v26;

  v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)HDWorkoutCondenser;
  v5 = -[HDWorkoutCondenser init](&v26, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_profile, v4);
    *(_OWORD *)&v6->_minimumSeriesSize = xmmword_1B7F56300;
    v6->_deletedSamplesThreshold = 30000;
    HKCreateSerialDispatchQueue();
    v7 = objc_claimAutoreleasedReturnValue();
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v7;

    objc_msgSend(MEMORY[0x1E0CB6F18], "sharedBehavior");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "features");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "workoutCondenseOnLock");

    if (v11)
    {
      v12 = (const char *)*MEMORY[0x1E0CB5A20];
      v13 = v6->_queue;
      v14 = MEMORY[0x1E0C809B0];
      handler[0] = MEMORY[0x1E0C809B0];
      handler[1] = 3221225472;
      handler[2] = __38__HDWorkoutCondenser_initWithProfile___block_invoke;
      handler[3] = &unk_1E6D0F770;
      v15 = v6;
      v25 = v15;
      notify_register_dispatch(v12, &v6->_onLockDBAvailableNotificationToken, v13, handler);
      v16 = (const char *)*MEMORY[0x1E0CB5A28];
      v17 = v6->_queue;
      v22[0] = v14;
      v22[1] = 3221225472;
      v22[2] = __38__HDWorkoutCondenser_initWithProfile___block_invoke_2;
      v22[3] = &unk_1E6D0F770;
      v23 = v15;
      notify_register_dispatch(v16, v15 + 12, v17, v22);

      periodicActivity = v25;
    }
    else
    {
      v19 = [HDPeriodicActivity alloc];
      v20 = -[HDPeriodicActivity initWithProfile:name:interval:delegate:loggingCategory:](v19, "initWithProfile:name:interval:delegate:loggingCategory:", v4, CFSTR("com.apple.healthd.HDWorkoutCondenser-activity"), v6, *MEMORY[0x1E0CB5380], (double)(uint64_t)*MEMORY[0x1E0C807B8]);
      periodicActivity = v6->_periodicActivity;
      v6->_periodicActivity = (HDPeriodicActivity *)v20;
    }

  }
  return v6;
}

void __38__HDWorkoutCondenser_initWithProfile___block_invoke(uint64_t a1, int a2)
{
  uint64_t v2;
  id WeakRetained;
  void *v4;
  objc_class *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  NSObject *v10;
  id v11;
  uint8_t buf[4];
  uint64_t v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  if (*(_DWORD *)(v2 + 44) == a2)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(v2 + 8));
    if (!*(_QWORD *)(v2 + 32))
    {
      WeakRetained = objc_loadWeakRetained((id *)(v2 + 80));
      objc_msgSend(WeakRetained, "database");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = (objc_class *)objc_opt_class();
      NSStringFromClass(v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 0;
      objc_msgSend(v4, "takeAccessibilityAssertionWithOwnerIdentifier:timeout:error:", v6, &v11, 300.0);
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = v11;
      v9 = *(void **)(v2 + 32);
      *(_QWORD *)(v2 + 32) = v7;

      if (!*(_QWORD *)(v2 + 32))
      {
        _HKInitializeLogging();
        v10 = *MEMORY[0x1E0CB5380];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          v13 = v2;
          v14 = 2114;
          v15 = v8;
          _os_log_error_impl(&dword_1B7802000, v10, OS_LOG_TYPE_ERROR, "%{public}@ unable to get accessibilityAssertion before lock: %{public}@", buf, 0x16u);
        }
      }

    }
  }
}

void __38__HDWorkoutCondenser_initWithProfile___block_invoke_2(uint64_t a1, int a2)
{
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  __int128 v5;
  void (*v6)(uint64_t, int, void *);
  void *v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  if (*(_DWORD *)(v2 + 48) == a2)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(v2 + 8));
    if (*(_QWORD *)(v2 + 32))
    {
      if (!*(_BYTE *)(v2 + 40))
      {
        _HKInitializeLogging();
        v3 = *MEMORY[0x1E0CB5380];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_DEFAULT))
        {
          LODWORD(v5) = 138543362;
          *(_QWORD *)((char *)&v5 + 4) = v2;
          _os_log_impl(&dword_1B7802000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ condense workouts onLock started", (uint8_t *)&v5, 0xCu);
        }
        v4 = MEMORY[0x1E0C809B0];
        *(_BYTE *)(v2 + 40) = 1;
        *(_QWORD *)&v5 = v4;
        *((_QWORD *)&v5 + 1) = 3221225472;
        v6 = __48__HDWorkoutCondenser__attemptOnLockCondensation__block_invoke;
        v7 = &unk_1E6CE77C8;
        v8 = v2;
        objc_msgSend((id)v2, "condenseWorkoutsForReason:workoutBatchLimit:completion:", 3, 2, &v5);
      }
    }
  }
}

- (void)dealloc
{
  objc_super v3;

  -[HDAssertion invalidate](self->_preparedDatabaseAccessibilityAssertion, "invalidate");
  -[HDAssertion invalidate](self->_onLockDatabaseAccessibilityAssertion, "invalidate");
  notify_cancel(self->_onLockDBAvailableNotificationToken);
  notify_cancel(self->_onLockDBUnavailableNotificationToken);
  v3.receiver = self;
  v3.super_class = (Class)HDWorkoutCondenser;
  -[HDWorkoutCondenser dealloc](&v3, sel_dealloc);
}

void __48__HDWorkoutCondenser__attemptOnLockCondensation__block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  _HKInitializeLogging();
  v6 = *MEMORY[0x1E0CB5380];
  v7 = *MEMORY[0x1E0CB5380];
  if (a2)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(_QWORD *)(a1 + 32);
      v12 = 138543362;
      v13 = v8;
      _os_log_impl(&dword_1B7802000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ condense workouts onLockCondensation finished", (uint8_t *)&v12, 0xCu);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    v11 = *(_QWORD *)(a1 + 32);
    v12 = 138543618;
    v13 = v11;
    v14 = 2114;
    v15 = v5;
    _os_log_error_impl(&dword_1B7802000, v6, OS_LOG_TYPE_ERROR, "%{public}@: onLockCondensation failed %{public}@", (uint8_t *)&v12, 0x16u);
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "invalidate");
  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(void **)(v9 + 32);
  *(_QWORD *)(v9 + 32) = 0;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 40) = 0;
}

- (void)condenseWorkoutsForReason:(int64_t)a3 workoutBatchLimit:(int64_t)a4 completion:(id)a5
{
  id v8;
  NSObject *queue;
  id v10;
  _QWORD v11[5];
  id v12;
  int64_t v13;
  int64_t v14;

  v8 = a5;
  queue = self->_queue;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __77__HDWorkoutCondenser_condenseWorkoutsForReason_workoutBatchLimit_completion___block_invoke;
  v11[3] = &unk_1E6D0F798;
  v13 = a4;
  v14 = a3;
  v11[4] = self;
  v12 = v8;
  v10 = v8;
  dispatch_async(queue, v11);

}

void __77__HDWorkoutCondenser_condenseWorkoutsForReason_workoutBatchLimit_completion___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  double Current;
  _HDWorkoutCondenserAnalyticsAccumulator *v8;
  uint64_t v9;
  uint64_t v10;
  id WeakRetained;
  void *v12;
  void *v13;
  char v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  objc_class *v19;
  void *v20;
  id v21;
  _HDWorkoutCondenserAnalyticsAccumulator *v22;
  NSObject *v23;
  id v24;
  HDMutableDatabaseTransactionContext *v25;
  id v26;
  void *v27;
  _HDWorkoutCondenserAnalyticsAccumulator *v28;
  char v29;
  uint64_t v30;
  NSObject *v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  double v33;
  double v34;
  NSObject *v35;
  NSObject *v36;
  uint64_t v37;
  _HDWorkoutCondenserAnalyticsAccumulator *v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  id v40;
  void *v41;
  BOOL v42;
  id v43;
  uint64_t v44;
  id v45;
  void *v46;
  void *v47;
  void *v48;
  int64_t workoutsToCondense;
  int64_t workoutsToRecondense;
  int64_t condensedWorkouts;
  int64_t processedWorkouts;
  int64_t createdSeries;
  int64_t deletedSamples;
  NSObject *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t (*v58)(uint64_t, uint64_t);
  void *v59;
  uint64_t v60;
  NSObject *v61;
  uint64_t (*v62)(uint64_t, uint64_t);
  HDTTRPromptController *v63;
  id v64;
  HDTTRPromptController *v65;
  void *v66;
  NSObject *v67;
  id v68;
  uint64_t v69;
  uint64_t v70;
  void *v71;
  void *v72;
  _HDWorkoutCondenserAnalyticsAccumulator *v73;
  id v74;
  id v75[5];
  id v76;
  _BYTE buf[24];
  uint64_t (*v78)(uint64_t, uint64_t);
  void (*v79)(uint64_t);
  _HDWorkoutCondenserAnalyticsAccumulator *v80;
  uint64_t v81;
  uint8_t v82[4];
  uint64_t v83;
  __int16 v84;
  id v85;
  uint64_t v86;

  v86 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0CB3940];
  v3 = a1[4];
  v4 = a1[6];
  HKStringFromWorkoutCondenserReason();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@: condense workouts (%ld, %@)"), v3, v4, v5);
  v71 = (void *)objc_claimAutoreleasedReturnValue();

  _HKInitializeLogging();
  v6 = *MEMORY[0x1E0CB5380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    *(_QWORD *)&buf[4] = v71;
    _os_log_impl(&dword_1B7802000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ started", buf, 0xCu);
  }
  Current = CFAbsoluteTimeGetCurrent();
  +[HKDaemonTransaction transactionWithOwner:activityName:](HDDaemonTransaction, "transactionWithOwner:activityName:", a1[4], CFSTR("condenseWorkouts"));
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_alloc_init(_HDWorkoutCondenserAnalyticsAccumulator);
  v9 = a1[4];
  v10 = a1[6];
  v74 = 0;
  v73 = v8;
  if (v9)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(v9 + 8));
    WeakRetained = objc_loadWeakRetained((id *)(v9 + 80));
    objc_msgSend(WeakRetained, "daemon");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "behavior");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "performsWorkoutCondensation");

    if ((v14 & 1) != 0)
    {
      v15 = *(id *)(v9 + 24);
      v16 = *(void **)(v9 + 24);
      *(_QWORD *)(v9 + 24) = 0;

      if (!v15)
      {
        v17 = objc_loadWeakRetained((id *)(v9 + 80));
        objc_msgSend(v17, "database");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = (objc_class *)objc_opt_class();
        NSStringFromClass(v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v75[0] = 0;
        objc_msgSend(v18, "takeAccessibilityAssertionWithOwnerIdentifier:timeout:error:", v20, v75, 300.0);
        v15 = (id)objc_claimAutoreleasedReturnValue();
        v21 = v75[0];

        if (!v15)
        {
          _HKInitializeLogging();
          v67 = *MEMORY[0x1E0CB5380];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138543362;
            *(_QWORD *)&buf[4] = v9;
            _os_log_impl(&dword_1B7802000, v67, OS_LOG_TYPE_INFO, "%{public}@ workout condenser cannot run without access to protected data", buf, 0xCu);
          }
          v68 = v21;
          v24 = v68;
          if (v68)
            v74 = objc_retainAutorelease(v68);

          v29 = 0;
          goto LABEL_9;
        }

      }
      v22 = v73;
      v23 = *(NSObject **)(v9 + 8);
      v24 = v15;
      dispatch_assert_queue_V2(v23);
      v25 = objc_alloc_init(HDMutableDatabaseTransactionContext);
      -[HDMutableDatabaseTransactionContext setCacheScope:](v25, "setCacheScope:", 1);
      -[HDMutableDatabaseTransactionContext addAccessibilityAssertion:](v25, "addAccessibilityAssertion:", v24);

      v26 = objc_loadWeakRetained((id *)(v9 + 80));
      objc_msgSend(v26, "database");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)buf = MEMORY[0x1E0C809B0];
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = __110__HDWorkoutCondenser__queue_condenseWorkoutsWithAccessibilityAssertion_batchLimit_analyticsAccumulator_error___block_invoke;
      v78 = (uint64_t (*)(uint64_t, uint64_t))&unk_1E6D0F810;
      v79 = (void (*)(uint64_t))v9;
      v81 = v10;
      v28 = v22;
      v80 = v28;
      v29 = objc_msgSend(v27, "performWithTransactionContext:error:block:", v25, &v74, buf);

      objc_msgSend(v24, "invalidate");
LABEL_9:
      buf[0] = v29;

      v30 = buf[0];
      goto LABEL_12;
    }
    _HKInitializeLogging();
    v31 = *MEMORY[0x1E0CB5380];
    v30 = 1;
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v9;
      _os_log_impl(&dword_1B7802000, v31, OS_LOG_TYPE_INFO, "%{public}@ workout condenser is not enabled", buf, 0xCu);
    }
  }
  else
  {
    v30 = 0;
  }
LABEL_12:

  v32 = (uint64_t (*)(uint64_t, uint64_t))v74;
  objc_msgSend(v72, "invalidate");
  v33 = CFAbsoluteTimeGetCurrent();
  _HKInitializeLogging();
  v34 = v33 - Current;
  v35 = *MEMORY[0x1E0CB5380];
  v36 = *MEMORY[0x1E0CB5380];
  if ((_DWORD)v30)
  {
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v71;
      *(_WORD *)&buf[12] = 2048;
      *(double *)&buf[14] = v34;
      _os_log_impl(&dword_1B7802000, v35, OS_LOG_TYPE_DEFAULT, "%{public}@ finished in %0.4f s, Success", buf, 0x16u);
    }
  }
  else if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543874;
    *(_QWORD *)&buf[4] = v71;
    *(_WORD *)&buf[12] = 2048;
    *(double *)&buf[14] = v34;
    *(_WORD *)&buf[22] = 2114;
    v78 = v32;
    _os_log_error_impl(&dword_1B7802000, v35, OS_LOG_TYPE_ERROR, "%{public}@ finished in %0.4f s, Error: %{public}@", buf, 0x20u);
  }
  v37 = a1[4];
  v69 = a1[6];
  v70 = a1[7];
  v38 = v73;
  v39 = v32;
  if (v37)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(v37 + 8));
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v78 = __Block_byref_object_copy__197;
    v79 = __Block_byref_object_dispose__197;
    v80 = 0;
    v40 = objc_loadWeakRetained((id *)(v37 + 80));
    objc_msgSend(v40, "database");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v76 = 0;
    v75[0] = (id)MEMORY[0x1E0C809B0];
    v75[1] = (id)3221225472;
    v75[2] = __112__HDWorkoutCondenser__queue_submitAnalyticEventForReason_batchSize_success_duration_analyticsAccumulator_error___block_invoke;
    v75[3] = &unk_1E6CEE6D0;
    v75[4] = buf;
    v42 = +[HDHealthEntity performReadTransactionWithHealthDatabase:error:block:](HDSourceEntity, "performReadTransactionWithHealthDatabase:error:block:", v41, &v76, v75);
    v43 = v76;

    if (v42)
    {
      v44 = objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "integerValue");
      v45 = objc_loadWeakRetained((id *)(v37 + 80));
      objc_msgSend(v45, "daemon");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "analyticsSubmissionCoordinator");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = v47;
      if (v38)
      {
        workoutsToCondense = v38->_workoutsToCondense;
        workoutsToRecondense = v38->_workoutsToRecondense;
        condensedWorkouts = v38->_condensedWorkouts;
        processedWorkouts = v38->_processedWorkouts;
        createdSeries = v38->_createdSeries;
        deletedSamples = v38->_deletedSamples;
      }
      else
      {
        createdSeries = 0;
        condensedWorkouts = 0;
        workoutsToCondense = 0;
        workoutsToRecondense = 0;
        processedWorkouts = 0;
        deletedSamples = 0;
      }
      objc_msgSend(v47, "workout_reportWorkoutCondenserEventWithReason:batchSize:hasWatchSource:duration:success:error:workoutsToCondense:workoutsToRecondense:condensedWorkouts:processedWorkouts:createdSeries:deletedSamples:", v70, v69, v44 > 0, v30, v39, workoutsToCondense, v34, workoutsToRecondense, condensedWorkouts, processedWorkouts, createdSeries, deletedSamples);

    }
    else
    {
      _HKInitializeLogging();
      v55 = *MEMORY[0x1E0CB5380];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v82 = 138543618;
        v83 = v37;
        v84 = 2114;
        v85 = v43;
        _os_log_error_impl(&dword_1B7802000, v55, OS_LOG_TYPE_ERROR, "%{public}@: Unable to determine if profile has any watch sources: %{public}@", v82, 0x16u);
      }
    }

    _Block_object_dispose(buf, 8);
  }

  v56 = a1[4];
  v57 = a1[7];
  v58 = v39;
  if (v56)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(v56 + 8));
    if (v57)
    {
      v59 = *(void **)(v56 + 16);
      if ((_DWORD)v30)
        objc_msgSend(v59, "didPerformActivityWithResult:minimumRetryInterval:activityStartDate:error:", 0, 0, 0, (double)(uint64_t)*MEMORY[0x1E0C807B8]);
      else
        objc_msgSend(v59, "didPerformActivityWithResult:minimumRetryInterval:activityStartDate:error:", 2, 0, v58, 0.0);
    }
  }

  v60 = a1[4];
  if (v60)
  {
    v61 = *(NSObject **)(v60 + 8);
    v62 = v58;
    dispatch_assert_queue_V2(v61);
    v63 = [HDTTRPromptController alloc];
    v64 = objc_loadWeakRetained((id *)(v60 + 80));
    v65 = -[HDTTRPromptController initWithProfile:domainName:loggingCategory:](v63, "initWithProfile:domainName:loggingCategory:", v64, CFSTR("HDWorkoutCondenser"), *MEMORY[0x1E0CB5380]);

    -[HDTTRPromptController setMinimumPromptInterval:](v65, "setMinimumPromptInterval:", 604800.0);
    -[HDTTRPromptController setMaximumErrorCount:](v65, "setMaximumErrorCount:", 10);
    -[HDTTRPromptController setNotificationTitle:](v65, "setNotificationTitle:", CFSTR("Health Unable to Compress Older Workouts"));
    -[HDTTRPromptController setNotificationMessage:](v65, "setNotificationMessage:", CFSTR("Health has run into a number of errors while attempting to compress your older workouts"));
    -[HDTTRPromptController setRadarTitle:](v65, "setRadarTitle:", CFSTR("[Database Efficiency] Workout Condenser Problem Detected"));
    -[HDTTRPromptController setRadarDescription:](v65, "setRadarDescription:", CFSTR("The workout condenser has failed multiple times since last success"));
    HKStringFromWorkoutCondenserReason();
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDTTRPromptController promptIfRequiredForReason:success:error:](v65, "promptIfRequiredForReason:success:error:", v66, v30, v62);

  }
  (*(void (**)(void))(a1[5] + 16))();

}

- (BOOL)condenseWorkout:(id)a3 error:(id *)a4
{
  id v6;
  _HDWorkoutCondenserAnalyticsAccumulator *v7;
  id WeakRetained;
  id *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  BOOL v19;
  void *v20;
  void *v21;
  void *v22;
  id v24;

  v6 = a3;
  v7 = objc_alloc_init(_HDWorkoutCondenserAnalyticsAccumulator);
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  +[_HDWorkoutCondensationConfiguration configurationWithProfile:minimumSeriesSize:maximumSeriesSize:deletedSampleThreshold:analyticsAccumulator:error:]((uint64_t)_HDWorkoutCondensationConfiguration, WeakRetained, self->_minimumSeriesSize, self->_maximumSeriesSize, self->_deletedSamplesThreshold, v7, (uint64_t)a4);
  v9 = (id *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    HDDataEntityPredicateForObjectsFromAppleWatchSources(1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)MEMORY[0x1E0D29890];
    objc_msgSend(v6, "UUID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    HDDataEntityPredicateForDataUUID();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "compoundPredicateWithPredicate:otherPredicate:", v13, v10);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = objc_loadWeakRetained(v9 + 1);
    objc_msgSend(v15, "database");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 0;
    +[HDHealthEntity anyWithPredicate:healthDatabase:error:](HDWorkoutEntity, "anyWithPredicate:healthDatabase:error:", v14, v16, &v24);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v24;

    if (v17)
    {
      v19 = +[HDWorkoutCondenser _condenseAndUpdateWorkout:configuration:error:]((uint64_t)HDWorkoutCondenser, v17, v9, a4);
LABEL_13:

      goto LABEL_14;
    }
    if (v18)
    {
      v18 = v18;
    }
    else
    {
      v20 = (void *)MEMORY[0x1E0CB35C8];
      objc_msgSend(v6, "sourceRevision");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "hk_error:format:", 100, CFSTR("Unable to locate 1st Party Apple Watch workout entity for condensation with workout %@ from source %@"), v6, v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      v18 = v22;
      if (!v18)
      {
LABEL_12:
        v19 = 0;
        goto LABEL_13;
      }
    }
    if (a4)
      *a4 = objc_retainAutorelease(v18);
    else
      _HKLogDroppedError();

    goto LABEL_12;
  }
  v19 = 0;
LABEL_14:

  return v19;
}

+ (BOOL)_condenseAndUpdateWorkout:(void *)a3 configuration:(_QWORD *)a4 error:
{
  id v6;
  id *v7;
  uint64_t v8;
  void *v9;
  id WeakRetained;
  void *v11;
  id v12;
  id v13;
  id v14;
  double *v15;
  uint64_t v16;
  double v17;
  double v18;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  id v22;
  _BOOL8 v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  void *v28;
  id v29;
  id v30;
  double *v31;
  int v32;
  id v33;
  id *v34;
  id v35;
  void *v36;
  id v37;
  _BOOL4 v38;
  id v39;
  id v40;
  uint64_t v41;
  void *v42;
  NSObject *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  id v49;
  id v50;
  void *v51;
  id *v52;
  id obj;
  _QWORD *v54;
  void *v55;
  id v56[6];
  id v57;
  id v58;
  double *v59;
  uint64_t v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  _BYTE buf[24];
  void *v66;
  _BYTE v67[10];
  __int16 v68;
  void *v69;
  uint64_t v70;

  v70 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a3;
  v8 = objc_opt_self();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v6, "persistentID"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    WeakRetained = objc_loadWeakRetained(v7 + 1);
  else
    WeakRetained = 0;
  v56[0] = 0;
  +[HDDataEntity objectWithID:encodingOptions:profile:error:](HDWorkoutEntity, "objectWithID:encodingOptions:profile:error:", v9, 0, WeakRetained, v56);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v56[0];

  if (v11)
  {
    v54 = a4;
    v13 = v11;
    v14 = v6;
    v15 = v7;
    v16 = objc_opt_self();
    v55 = v13;
    objc_msgSend(v13, "duration");
    if (v7)
      v18 = v15[3];
    else
      v18 = 0.0;
    v50 = v12;
    v51 = v11;
    v52 = v7;
    if (v17 >= v18)
    {
      v49 = v6;
      v63 = 0u;
      v64 = 0u;
      v61 = 0u;
      v62 = 0u;
      objc_msgSend((id)objc_opt_class(), "condensableQuantityTypes");
      obj = (id)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v61, buf, 16);
      if (v24)
      {
        v25 = v24;
        v26 = *(_QWORD *)v62;
        while (2)
        {
          for (i = 0; i != v25; ++i)
          {
            if (*(_QWORD *)v62 != v26)
              objc_enumerationMutation(obj);
            v28 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * i);
            v56[1] = (id)MEMORY[0x1E0C809B0];
            v56[2] = (id)3221225472;
            v56[3] = __66__HDWorkoutCondenser__condenseWorkout_entity_configuration_error___block_invoke;
            v56[4] = &unk_1E6CF13C0;
            v60 = v16;
            v56[5] = v28;
            v29 = v55;
            v57 = v29;
            v30 = v14;
            v58 = v30;
            v31 = v15;
            v59 = v31;
            v32 = HKWithAutoreleasePool();

            if (!v32)
            {

              v23 = 0;
              v6 = v49;
              goto LABEL_30;
            }
          }
          v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v61, buf, 16);
          if (v25)
            continue;
          break;
        }
      }

      v6 = v49;
      v7 = v52;
    }
    else
    {

    }
    v33 = v14;
    v34 = v15;
    objc_opt_self();
    if (v7)
      v35 = objc_loadWeakRetained(v34 + 1);
    else
      v35 = 0;
    objc_msgSend(v35, "database", v49);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)buf = MEMORY[0x1E0C809B0];
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = __76__HDWorkoutCondenser__updateCondenserVersionForWorkout_configuration_error___block_invoke;
    v66 = &unk_1E6CEBC00;
    *(_QWORD *)v67 = v33;
    v37 = v33;
    v38 = +[HDHealthEntity performWriteTransactionWithHealthDatabase:error:block:](HDWorkoutEntity, "performWriteTransactionWithHealthDatabase:error:block:", v36, v54, buf);

    if (v38)
    {
      v39 = v6;
      v40 = v55;
      v41 = objc_opt_self();
      _HKInitializeLogging();
      v42 = (void *)*MEMORY[0x1E0CB5380];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_INFO))
      {
        v43 = v42;
        objc_msgSend(v40, "workoutActivityType");
        _HKWorkoutActivityNameForActivityType();
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "duration");
        HKDiagnosticStringFromDuration();
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "_creationDate");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        HKDiagnosticStringFromDate();
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544386;
        *(_QWORD *)&buf[4] = v41;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v40;
        *(_WORD *)&buf[22] = 2114;
        v66 = v44;
        *(_WORD *)v67 = 2114;
        *(_QWORD *)&v67[2] = v45;
        v68 = 2114;
        v69 = v47;
        _os_log_impl(&dword_1B7802000, v43, OS_LOG_TYPE_INFO, "%{public}@: condensed workout: %{public}@, type: %{public}@, duration: %{public}@, added: %{public}@", buf, 0x34u);

      }
      v23 = 1;
      v6 = v39;
    }
    else
    {
      v23 = 0;
    }
LABEL_30:
    v11 = v51;
    v7 = v52;
    v12 = v50;
  }
  else
  {
    _HKInitializeLogging();
    v19 = (void *)*MEMORY[0x1E0CB5380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_INFO))
    {
      v20 = v19;
      v21 = objc_msgSend(v6, "persistentID");
      *(_DWORD *)buf = 138543874;
      *(_QWORD *)&buf[4] = v8;
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = v21;
      *(_WORD *)&buf[22] = 2114;
      v66 = v12;
      _os_log_impl(&dword_1B7802000, v20, OS_LOG_TYPE_INFO, "%{public}@: failed to lookup workout with persistentID %lld: %{public}@", buf, 0x20u);

    }
    v22 = v12;
    v23 = v22 == 0;
    if (v22)
    {
      if (a4)
        *a4 = objc_retainAutorelease(v22);
      else
        _HKLogDroppedError();
    }

  }
  return v23;
}

- (id)condensedWorkoutsWithError:(id *)a3
{
  id v5;
  id WeakRetained;
  id v7;
  void *v8;
  id v9;
  _QWORD v11[4];
  id v12;

  v5 = objc_alloc_init(MEMORY[0x1E0CB6458]);
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __49__HDWorkoutCondenser_condensedWorkoutsWithError___block_invoke;
  v11[3] = &unk_1E6D0F7C0;
  v12 = v5;
  v7 = v5;
  LODWORD(a3) = +[HDWorkoutEntity enumerateCondensedWorkoutsWithPredicate:profile:error:handler:](HDWorkoutEntity, "enumerateCondensedWorkoutsWithPredicate:profile:error:handler:", 0, WeakRetained, a3, v11);

  if ((_DWORD)a3)
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;

  return v9;
}

uint64_t __49__HDWorkoutCondenser_condensedWorkoutsWithError___block_invoke(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "addWorkouts:", a2);
  return 1;
}

- (id)condensableWorkoutsWithError:(id *)a3
{
  void *v5;
  HDProfile **p_profile;
  id WeakRetained;
  void *v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  _BOOL4 v13;
  void *v14;
  id v15;
  _QWORD v17[4];
  id v18;
  id v19;

  v5 = (void *)objc_opt_class();
  p_profile = &self->_profile;
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(v5, "workoutEntitiesRequiringCondensationWithProfile:limit:allowRecondensation:error:", WeakRetained, 0, 0, a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = objc_alloc_init(MEMORY[0x1E0CB6458]);
    v10 = objc_loadWeakRetained((id *)p_profile);
    objc_msgSend(v10, "database");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __51__HDWorkoutCondenser_condensableWorkoutsWithError___block_invoke;
    v17[3] = &unk_1E6CE7950;
    v18 = v8;
    v19 = v9;
    v12 = v9;
    v13 = +[HDHealthEntity performReadTransactionWithHealthDatabase:error:block:](HDWorkoutEntity, "performReadTransactionWithHealthDatabase:error:block:", v11, a3, v17);

    if (v13)
      v14 = v12;
    else
      v14 = 0;
    v15 = v14;

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

uint64_t __51__HDWorkoutCondenser_condensableWorkoutsWithError___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = *(id *)(a1 + 32);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    while (2)
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v10), "codableCondensedWorkoutWithTransaction:error:", v5, a3, (_QWORD)v15);
        v11 = objc_claimAutoreleasedReturnValue();
        if (!v11)
        {
          v13 = 0;
          goto LABEL_11;
        }
        v12 = (void *)v11;
        objc_msgSend(*(id *)(a1 + 40), "addWorkouts:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v8)
        continue;
      break;
    }
  }
  v13 = 1;
LABEL_11:

  return v13;
}

- (void)setMinimumSeriesSize:(int64_t)a3
{
  self->_minimumSeriesSize = a3;
}

- (void)setMaximumSeriesSize:(int64_t)a3
{
  self->_maximumSeriesSize = a3;
}

- (void)setDeletedSamplesThreshold:(int64_t)a3
{
  self->_deletedSamplesThreshold = a3;
}

+ (id)workoutEntitiesRequiringCondensationWithProfile:(id)a3 limit:(int64_t)a4 allowRecondensation:(BOOL)a5 error:(id *)a6
{
  return +[HDWorkoutCondenser _workoutEntitiesRequiringCondensationWithProfile:limit:allowRecondensation:analyticsAccumulator:error:]((uint64_t)a1, a3, a4, a5, 0, (uint64_t)a6);
}

+ (id)_workoutEntitiesRequiringCondensationWithProfile:(uint64_t)a3 limit:(char)a4 allowRecondensation:(void *)a5 analyticsAccumulator:(uint64_t)a6 error:
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  void *v30;
  void *v31;
  _QWORD v32[4];
  id v33;
  id v34;
  id v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  char v39;
  _QWORD v40[6];

  v40[4] = *MEMORY[0x1E0C80C00];
  v7 = a5;
  v8 = a2;
  v9 = objc_opt_self();
  HDDataEntityPredicateForObjectsFromAppleWatchSources(1);
  v10 = objc_claimAutoreleasedReturnValue();
  HDWorkoutEntityPredicateForWorkoutCondenserVersionLessThan(5);
  v11 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", -10368000.0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  HDDataEntityPredicateForCreationDate(3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  HDWorkoutEntityPredicateForDuration(6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)MEMORY[0x1E0D29840];
  v30 = (void *)v11;
  v31 = (void *)v10;
  v40[0] = v10;
  v40[1] = v11;
  v40[2] = v13;
  v40[3] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v40, 4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "predicateMatchingAllPredicates:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  HDWorkoutEntityPredicateForWorkoutCondenserVersionEqualTo(5);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v8, "database");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __124__HDWorkoutCondenser__workoutEntitiesRequiringCondensationWithProfile_limit_allowRecondensation_analyticsAccumulator_error___block_invoke;
  v32[3] = &unk_1E6D0F838;
  v37 = v9;
  v38 = a3;
  v33 = v17;
  v34 = v7;
  v21 = v19;
  v39 = a4;
  v35 = v21;
  v36 = v18;
  v22 = v18;
  v23 = v7;
  v24 = v17;
  LODWORD(v10) = +[HDHealthEntity performReadTransactionWithHealthDatabase:error:block:](HDWorkoutEntity, "performReadTransactionWithHealthDatabase:error:block:", v20, a6, v32);

  if ((_DWORD)v10)
    v25 = v21;
  else
    v25 = 0;

  return v25;
}

+ (id)seriesSyncIdentifierForEntity:(id)a3 workout:(id)a4 transaction:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  _QWORD v16[4];
  id v17;
  uint64_t *v18;
  id v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__197;
  v24 = __Block_byref_object_dispose__197;
  v25 = 0;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __78__HDWorkoutCondenser_seriesSyncIdentifierForEntity_workout_transaction_error___block_invoke;
  v16[3] = &unk_1E6D0F7E8;
  v18 = &v20;
  v19 = a1;
  v13 = v11;
  v17 = v13;
  if ((objc_msgSend(v10, "startTimeEndTimeCountForSeriesWithTransaction:error:handler:", v12, a6, v16) & 1) != 0)
    v14 = (id)v21[5];
  else
    v14 = 0;

  _Block_object_dispose(&v20, 8);
  return v14;
}

void __78__HDWorkoutCondenser_seriesSyncIdentifierForEntity_workout_transaction_error___block_invoke(uint64_t a1, uint64_t a2, double a3, double a4)
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;

  v8 = *(id *)(a1 + 32);
  objc_opt_self();
  v9 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v8, "UUID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "UUIDString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringWithFormat:", CFSTR("%ld:%@:%.5f:%.5f:%lld"), 5, v11, *(_QWORD *)&a3, *(_QWORD *)&a4, a2);
  v12 = objc_claimAutoreleasedReturnValue();

  v13 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v14 = *(void **)(v13 + 40);
  *(_QWORD *)(v13 + 40) = v12;

}

uint64_t __110__HDWorkoutCondenser__queue_condenseWorkoutsWithAccessibilityAssertion_batchLimit_analyticsAccumulator_error___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained;
  void *v5;
  id v6;
  void *v7;
  id v8;
  id *v9;
  uint64_t v10;
  double Current;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  double v16;
  _QWORD *v17;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  id v21;
  void *v22;
  uint64_t v23;
  double v24;
  NSObject *v25;
  void *v27;
  id obj;
  id *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint64_t v34;
  double *v35;
  uint64_t v36;
  uint64_t v37;
  uint8_t buf[4];
  uint64_t v39;
  __int16 v40;
  uint64_t v41;
  __int16 v42;
  double v43;
  __int16 v44;
  double v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 80));
  +[HDWorkoutCondenser _workoutEntitiesRequiringCondensationWithProfile:limit:allowRecondensation:analyticsAccumulator:error:]((uint64_t)HDWorkoutCondenser, WeakRetained, *(_QWORD *)(a1 + 48), 1, *(void **)(a1 + 40), a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    if (objc_msgSend(v5, "count"))
    {
      v6 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 80));
      +[_HDWorkoutCondensationConfiguration configurationWithProfile:minimumSeriesSize:maximumSeriesSize:deletedSampleThreshold:analyticsAccumulator:error:]((uint64_t)_HDWorkoutCondensationConfiguration, v6, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72), *(void **)(a1 + 40), a2);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      v7 = v27;
      if (v27)
      {
        v8 = v5;
        v9 = v27;
        v10 = objc_opt_self();
        Current = CFAbsoluteTimeGetCurrent();
        v34 = 0;
        v35 = (double *)&v34;
        v36 = 0x2020000000;
        v37 = 0;
        v30 = 0u;
        v31 = 0u;
        v32 = 0u;
        v33 = 0u;
        obj = v8;
        v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v46, 16);
        if (v12)
        {
          v13 = *(_QWORD *)v31;
          while (2)
          {
            for (i = 0; i != v12; ++i)
            {
              if (*(_QWORD *)v31 != v13)
                objc_enumerationMutation(obj);
              v29 = v9;
              v15 = HKWithAutoreleasePool();
              if ((v15 & 1) == 0)
                goto LABEL_27;
              v16 = CFAbsoluteTimeGetCurrent() - Current;
              if (v16 > 180.0)
              {
                _HKInitializeLogging();
                v18 = *MEMORY[0x1E0CB5380];
                if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_DEFAULT))
                {
                  v19 = *((_QWORD *)v35 + 3);
                  *(_DWORD *)buf = 138543874;
                  v39 = v10;
                  v40 = 2048;
                  v41 = v19;
                  v42 = 2048;
                  v43 = v16;
                  _os_log_impl(&dword_1B7802000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@: end with early success due to timeout, condensed %ld workouts in %0.4f s", buf, 0x20u);
                }
                goto LABEL_27;
              }
              v17 = v9[7];
              if (v17)
                v17 = (_QWORD *)v17[7];
              if ((uint64_t)v17 >= (uint64_t)v9[6])
              {
                _HKInitializeLogging();
                v20 = (void *)*MEMORY[0x1E0CB5380];
                if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_DEFAULT))
                {
                  v21 = v9[7];
                  v22 = v21;
                  if (v21)
                    v23 = *((_QWORD *)v21 + 7);
                  else
                    v23 = 0;
                  v24 = v35[3];
                  *(_DWORD *)buf = 138544130;
                  v39 = v10;
                  v40 = 2048;
                  v41 = v23;
                  v42 = 2048;
                  v43 = v24;
                  v44 = 2048;
                  v45 = v16;
                  v25 = v20;
                  _os_log_impl(&dword_1B7802000, v25, OS_LOG_TYPE_DEFAULT, "%{public}@: end with early success due number of deleted samples (%ld), condensed %ld workouts in %0.4f s", buf, 0x2Au);

                }
LABEL_27:

                goto LABEL_28;
              }

            }
            v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v46, 16);
            v15 = 1;
            if (v12)
              continue;
            break;
          }
        }
        else
        {
          v15 = 1;
        }
LABEL_28:

        _Block_object_dispose(&v34, 8);
        v7 = v27;
      }
      else
      {
        v15 = 0;
      }

    }
    else
    {
      v15 = 1;
    }
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

uint64_t __124__HDWorkoutCondenser__workoutEntitiesRequiringCondensationWithProfile_limit_allowRecondensation_analyticsAccumulator_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  NSObject *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  int v31;
  uint64_t v32;
  __int16 v33;
  uint64_t v34;
  __int16 v35;
  uint64_t v36;
  __int16 v37;
  uint64_t v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = *(void **)(a1 + 32);
  v7 = *(_QWORD *)(a1 + 64);
  v8 = *(_QWORD *)(a1 + 72);
  HDSampleEntityOrderingTermsForOldness();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDWorkoutCondenser _workoutEntitiesRequiringCondensationWithPredicate:limit:orderingTerms:transaction:error:](v7, v6, v8, v9, v5, a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
    goto LABEL_16;
  v11 = objc_msgSend(v10, "count");
  v12 = *(_QWORD *)(a1 + 40);
  if (v12)
    *(_QWORD *)(v12 + 16) = v11;
  objc_msgSend(*(id *)(a1 + 48), "addObjectsFromArray:", v10);
  if (!*(_BYTE *)(a1 + 80))
    goto LABEL_13;
  if (!*(_QWORD *)(a1 + 72))
  {
    v15 = 0;
LABEL_9:
    v17 = *(void **)(a1 + 56);
    v16 = *(_QWORD *)(a1 + 64);
    HDWorkoutEntityOrderingTermsForCondenserDate();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    +[HDWorkoutCondenser _workoutEntitiesRequiringCondensationWithPredicate:limit:orderingTerms:transaction:error:](v16, v17, v15, v18, v5, a3);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      v20 = objc_msgSend(v19, "count");
      v21 = *(_QWORD *)(a1 + 40);
      if (v21)
        *(_QWORD *)(v21 + 24) = v20;
      objc_msgSend(*(id *)(a1 + 48), "addObjectsFromArray:", v19);

      goto LABEL_13;
    }
LABEL_16:
    v29 = 0;
    goto LABEL_17;
  }
  v13 = objc_msgSend(*(id *)(a1 + 48), "count");
  v14 = *(_QWORD *)(a1 + 72);
  if (v13 < v14)
  {
    v15 = v14 - objc_msgSend(*(id *)(a1 + 48), "count");
    goto LABEL_9;
  }
LABEL_13:
  _HKInitializeLogging();
  v22 = (void *)*MEMORY[0x1E0CB5380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_DEFAULT))
  {
    v23 = *(_QWORD *)(a1 + 64);
    v24 = *(void **)(a1 + 48);
    v25 = v22;
    v26 = objc_msgSend(v24, "count");
    v27 = objc_msgSend(v10, "count");
    v28 = objc_msgSend(*(id *)(a1 + 48), "count");
    v31 = 138544130;
    v32 = v23;
    v33 = 2048;
    v34 = v26;
    v35 = 2048;
    v36 = v27;
    v37 = 2048;
    v38 = v28 - objc_msgSend(v10, "count");
    _os_log_impl(&dword_1B7802000, v25, OS_LOG_TYPE_DEFAULT, "%{public}@ %ld workouts requiring condensation (%ld uncondensed, %ld recondensable)", (uint8_t *)&v31, 0x2Au);

  }
  v29 = 1;
LABEL_17:

  return v29;
}

+ (id)_workoutEntitiesRequiringCondensationWithPredicate:(uint64_t)a3 limit:(void *)a4 orderingTerms:(void *)a5 transaction:(uint64_t)a6 error:
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  _QWORD v20[4];
  id v21;

  v10 = a5;
  v11 = a4;
  v12 = a2;
  objc_opt_self();
  v13 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v10, "databaseForEntityClass:", objc_opt_class());
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  +[HDSQLiteEntity queryWithDatabase:predicate:limit:orderingTerms:groupBy:](HDWorkoutEntity, "queryWithDatabase:predicate:limit:orderingTerms:groupBy:", v14, v12, a3, v11, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __111__HDWorkoutCondenser__workoutEntitiesRequiringCondensationWithPredicate_limit_orderingTerms_transaction_error___block_invoke;
  v20[3] = &unk_1E6CE9FC0;
  v21 = v13;
  v16 = v13;
  if (objc_msgSend(v15, "enumeratePersistentIDsAndProperties:error:enumerationHandler:", 0, a6, v20))
    v17 = v16;
  else
    v17 = 0;
  v18 = v17;

  return v18;
}

uint64_t __111__HDWorkoutCondenser__workoutEntitiesRequiringCondensationWithPredicate_limit_orderingTerms_transaction_error___block_invoke(uint64_t a1, uint64_t a2)
{
  HDWorkoutEntity *v3;

  v3 = -[HDSQLiteEntity initWithPersistentID:]([HDWorkoutEntity alloc], "initWithPersistentID:", a2);
  if (v3)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

  return 1;
}

BOOL __60__HDWorkoutCondenser__condenseWorkouts_configuration_error___block_invoke(_QWORD *a1, _QWORD *a2)
{
  void *v4;
  NSObject **v5;
  NSObject *v6;
  double Current;
  uint64_t v8;
  _BYTE *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  _BOOL8 v13;
  id v14;
  double v15;
  NSObject *v16;
  _BOOL4 v17;
  id v18;
  uint64_t v19;
  _QWORD *v20;
  id v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  double v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: condense workout %ld"), a1[7], *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _HKInitializeLogging();
  v5 = (NSObject **)MEMORY[0x1E0CB5380];
  v6 = *MEMORY[0x1E0CB5380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    v24 = v4;
    _os_log_impl(&dword_1B7802000, v6, OS_LOG_TYPE_INFO, "%{public}@ started", buf, 0xCu);
  }
  Current = CFAbsoluteTimeGetCurrent();
  v8 = a1[4];
  if (v8)
  {
    v9 = *(id *)(v8 + 56);
    if (v9)
    {
      v9[8] = 0;

    }
  }
  v10 = a1[7];
  v12 = (void *)a1[4];
  v11 = (void *)a1[5];
  v22 = 0;
  v13 = +[HDWorkoutCondenser _condenseAndUpdateWorkout:configuration:error:](v10, v11, v12, &v22);
  v14 = v22;
  v15 = CFAbsoluteTimeGetCurrent() - Current;
  _HKInitializeLogging();
  v16 = *v5;
  v17 = os_log_type_enabled(v16, OS_LOG_TYPE_INFO);
  if (v13)
  {
    if (v17)
    {
      *(_DWORD *)buf = 138543618;
      v24 = v4;
      v25 = 2048;
      v26 = v15;
      _os_log_impl(&dword_1B7802000, v16, OS_LOG_TYPE_INFO, "%{public}@ finished in %0.4f s, Success", buf, 0x16u);
    }
  }
  else
  {
    if (v17)
    {
      *(_DWORD *)buf = 138543874;
      v24 = v4;
      v25 = 2048;
      v26 = v15;
      v27 = 2114;
      v28 = v14;
      _os_log_impl(&dword_1B7802000, v16, OS_LOG_TYPE_INFO, "%{public}@ finished in %0.4f s, Error: %{public}@", buf, 0x20u);
    }
    v18 = v14;
    if (v18)
    {
      if (a2)
        *a2 = objc_retainAutorelease(v18);
      else
        _HKLogDroppedError();
    }

  }
  v19 = a1[4];
  if (v19)
  {
    v20 = *(id *)(v19 + 56);
    if (v20)
    {
      ++v20[4];

    }
  }
  ++*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24);

  return v13;
}

BOOL __66__HDWorkoutCondenser__condenseWorkout_entity_configuration_error___block_invoke(uint64_t a1, _QWORD *a2)
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  id *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  id WeakRetained;
  void *v38;
  uint64_t v39;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  void *v49;
  id v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  uint64_t v55;
  void *v56;
  void *v57;
  uint64_t v58;
  void *v59;
  id v60;
  void *v61;
  id v62;
  void *v63;
  uint64_t v64;
  void *v65;
  void *v66;
  os_log_t *v67;
  NSObject *v68;
  double Current;
  uint64_t v70;
  id v71;
  void *v72;
  uint64_t v73;
  void *v74;
  id v75;
  _BOOL8 v76;
  id v77;
  double v78;
  NSObject *v79;
  id v80;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  id v89;
  id v90;
  _QWORD *v91;
  void *v92;
  uint64_t v93;
  void *v94;
  _QWORD v95[5];
  id v96;
  id v97;
  id v98;
  id v99;
  uint64_t v100;
  id v101;
  _BYTE buf[24];
  __int128 v103;
  _QWORD v104[2];
  _QWORD v105[2];
  _QWORD v106[3];
  _QWORD v107[5];

  v107[3] = *MEMORY[0x1E0C80C00];
  v4 = *(void **)(a1 + 56);
  v5 = *(void **)(a1 + 40);
  v6 = *(void **)(a1 + 48);
  v7 = *(id *)(a1 + 32);
  v8 = v5;
  v9 = v6;
  v10 = v4;
  objc_opt_self();
  if (objc_msgSend(v7, "code") == 5)
  {
    v91 = a2;
    v11 = (void *)MEMORY[0x1E0D29838];
    v90 = v7;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v7, "code"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "predicateWithProperty:value:comparisonType:influenceIndexUsage:", CFSTR("data_type"), v12, 1, 1);
    v93 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "startDate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "dateByAddingTimeInterval:", -600.0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    HDSampleEntityPredicateForStartDate(5);
    v15 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "endDate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "dateByAddingTimeInterval:", 600.0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    HDSampleEntityPredicateForStartDate(3);
    v18 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "endDate");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "dateByAddingTimeInterval:", 600.0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    HDSampleEntityPredicateForEndDate(3);
    v21 = objc_claimAutoreleasedReturnValue();

    v22 = (void *)MEMORY[0x1E0D29840];
    v94 = (void *)v15;
    v107[0] = v15;
    v107[1] = v18;
    v87 = (void *)v21;
    v88 = (void *)v18;
    v107[2] = v21;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v107, 3);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "predicateMatchingAllPredicates:", v23);
    v92 = (void *)objc_claimAutoreleasedReturnValue();

    v89 = v9;
    HDAssociationEntityPredicateForChildObjectsWhereAssocationExistsWithParentObject(objc_msgSend(v9, "persistentID"), 1);
    v24 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "startDate");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    HDSampleEntityPredicateForStartDate(6);
    v26 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "endDate");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    HDSampleEntityPredicateForStartDate(3);
    v28 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "endDate");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    HDSampleEntityPredicateForEndDate(3);
    v30 = objc_claimAutoreleasedReturnValue();

    v31 = (void *)MEMORY[0x1E0D29840];
    v84 = (void *)v28;
    v85 = (void *)v26;
    v106[0] = v26;
    v106[1] = v28;
    v83 = (void *)v30;
    v106[2] = v30;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v106, 3);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "predicateMatchingAllPredicates:", v32);
    v33 = objc_claimAutoreleasedReturnValue();

    v34 = (void *)MEMORY[0x1E0D29840];
    v86 = (void *)v24;
    v105[0] = v24;
    v105[1] = v33;
    v82 = (void *)v33;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v105, 2);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "predicateMatchingAnyPredicates:", v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
      WeakRetained = objc_loadWeakRetained(v10 + 1);
    else
      WeakRetained = 0;
    objc_msgSend(WeakRetained, "metadataManager");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = *MEMORY[0x1E0CB7298];
    objc_msgSend(v38, "predicateWithMetadataKey:exists:", *MEMORY[0x1E0CB7298], 0);
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
      v41 = objc_loadWeakRetained(v10 + 1);
    else
      v41 = 0;
    objc_msgSend(v41, "metadataManager");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "predicateWithMetadataKey:value:operatorType:", v39, &unk_1E6DFE828, 4);
    v43 = (void *)objc_claimAutoreleasedReturnValue();

    v44 = (void *)MEMORY[0x1E0D29840];
    v104[0] = v40;
    v104[1] = v43;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v104, 2);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "predicateMatchingAnyPredicates:", v45);
    v46 = (void *)objc_claimAutoreleasedReturnValue();

    v47 = (void *)MEMORY[0x1E0D29840];
    *(_QWORD *)buf = v93;
    *(_QWORD *)&buf[8] = v92;
    if (v10)
      v48 = v10[2];
    else
      v48 = 0;
    *(_QWORD *)&buf[16] = v48;
    *(_QWORD *)&v103 = v36;
    *((_QWORD *)&v103 + 1) = v46;
    v49 = (void *)MEMORY[0x1E0C99D20];
    v50 = v48;
    objc_msgSend(v49, "arrayWithObjects:count:", buf, 5);
    v51 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v47, "predicateMatchingAllPredicates:", v51);
    v52 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = v90;
    a2 = v91;
    v53 = v88;
    v9 = v89;
    v54 = (void *)v93;
  }
  else
  {
    HDAssociationEntityPredicateForChildObjectsAssociatedWithParentObject(objc_msgSend(v9, "persistentID"));
    v55 = objc_claimAutoreleasedReturnValue();
    v56 = (void *)MEMORY[0x1E0D29838];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v7, "code"));
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "predicateWithProperty:value:comparisonType:influenceIndexUsage:", CFSTR("data_type"), v57, 1, 0);
    v58 = objc_claimAutoreleasedReturnValue();

    v59 = (void *)MEMORY[0x1E0D29840];
    v94 = (void *)v58;
    *(_QWORD *)buf = v58;
    if (v10)
      v60 = v10[2];
    else
      v60 = 0;
    *(_QWORD *)&buf[8] = v60;
    *(_QWORD *)&buf[16] = v55;
    v61 = (void *)MEMORY[0x1E0C99D20];
    v62 = v60;
    objc_msgSend(v61, "arrayWithObjects:count:", buf, 3);
    v53 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v59, "predicateMatchingAllPredicates:", v53);
    v54 = (void *)v55;
    v52 = (void *)objc_claimAutoreleasedReturnValue();
  }

  v63 = (void *)MEMORY[0x1E0CB3940];
  v64 = *(_QWORD *)(a1 + 64);
  objc_msgSend(*(id *)(a1 + 40), "UUID");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "stringWithFormat:", CFSTR("%@: condense workout (%@) samples with quantity type %@"), v64, v65, *(_QWORD *)(a1 + 32));
  v66 = (void *)objc_claimAutoreleasedReturnValue();

  _HKInitializeLogging();
  v67 = (os_log_t *)MEMORY[0x1E0CB5380];
  v68 = *MEMORY[0x1E0CB5380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    *(_QWORD *)&buf[4] = v66;
    _os_log_impl(&dword_1B7802000, v68, OS_LOG_TYPE_INFO, "%{public}@ started", buf, 0xCu);
  }
  Current = CFAbsoluteTimeGetCurrent();
  v70 = *(_QWORD *)(a1 + 56);
  if (v70)
    v71 = objc_loadWeakRetained((id *)(v70 + 8));
  else
    v71 = 0;
  objc_msgSend(v71, "database");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  v95[0] = MEMORY[0x1E0C809B0];
  v95[2] = __66__HDWorkoutCondenser__condenseWorkout_entity_configuration_error___block_invoke_224;
  v95[3] = &unk_1E6D00180;
  v73 = *(_QWORD *)(a1 + 32);
  v74 = *(void **)(a1 + 40);
  v100 = *(_QWORD *)(a1 + 64);
  v101 = 0;
  v95[4] = v73;
  v95[1] = 3221225472;
  v96 = v74;
  v97 = *(id *)(a1 + 48);
  v75 = v52;
  v98 = v75;
  v99 = *(id *)(a1 + 56);
  v76 = +[HDHealthEntity performWriteTransactionWithHealthDatabase:error:block:](HDQuantitySampleSeriesEntity, "performWriteTransactionWithHealthDatabase:error:block:", v72, &v101, v95);
  v77 = v101;

  v78 = CFAbsoluteTimeGetCurrent();
  _HKInitializeLogging();
  v79 = *v67;
  if (os_log_type_enabled(*v67, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138544130;
    *(_QWORD *)&buf[4] = v66;
    *(_WORD *)&buf[12] = 2048;
    *(double *)&buf[14] = v78 - Current;
    *(_WORD *)&buf[22] = 1024;
    LODWORD(v103) = v76;
    WORD2(v103) = 2114;
    *(_QWORD *)((char *)&v103 + 6) = v77;
    _os_log_impl(&dword_1B7802000, v79, OS_LOG_TYPE_INFO, "%{public}@ finished in %0.4f s, (%{BOOL}d, %{public}@)", buf, 0x26u);
  }
  if (!v76)
  {
    v80 = v77;
    if (v80)
    {
      if (a2)
        *a2 = objc_retainAutorelease(v80);
      else
        _HKLogDroppedError();
    }

  }
  return v76;
}

uint64_t __66__HDWorkoutCondenser__condenseWorkout_entity_configuration_error___block_invoke_224(uint64_t a1, void *a2, _QWORD *a3)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  NSObject *v17;
  double Current;
  id v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  double v30;
  void *v31;
  id v32;
  id v33;
  id v34;
  id v35;
  void *v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  uint64_t (*v38)(uint64_t, uint64_t);
  _QWORD *v39;
  BOOL v40;
  id v41;
  id v42;
  uint64_t v43;
  double v44;
  void *v45;
  uint64_t v46;
  unsigned __int8 *v47;
  int v48;
  _QWORD *v49;
  _BYTE *v50;
  id v51;
  id v52;
  id v53;
  id v54;
  id v55;
  id v56;
  id v57;
  id v58;
  id v59;
  id v60;
  uint64_t v61;
  uint64_t v62;
  id v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  double *v67;
  uint64_t v68;
  double v69;
  double v70;
  double v71;
  void *v72;
  uint64_t v73;
  id v74;
  double v75;
  void *v76;
  id v77;
  _QWORD *v78;
  id v79;
  id v80;
  id v81;
  id v82;
  uint64_t v83;
  void *v84;
  char v85;
  NSObject *v86;
  void *v87;
  NSObject *v89;
  void *v90;
  id v91;
  __int128 *v92;
  id v93;
  id v94;
  void *v95;
  __int128 *v96;
  uint64_t v97;
  uint64_t *v98;
  id v99;
  _QWORD *v100;
  void *v101;
  id v102;
  id v103;
  id v105;
  id v106;
  id v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  _QWORD v112[4];
  uint64_t v113;
  double *v114;
  uint64_t v115;
  unint64_t v116;
  id v117;
  id *v118;
  uint64_t v119;
  uint64_t (*v120)(uint64_t, uint64_t);
  void (*v121)(uint64_t);
  id v122;
  uint64_t v123;
  uint64_t *v124;
  uint64_t v125;
  uint64_t (*v126)(uint64_t, uint64_t);
  void (*v127)(uint64_t);
  id v128;
  uint64_t v129;
  uint64_t *v130;
  uint64_t v131;
  char v132;
  _BYTE buf[24];
  double v134;
  __int128 v135;
  uint64_t *v136;
  __int128 *v137;
  id v138;
  id v139;
  id v140;
  id v141;
  uint64_t *v142;
  _QWORD *v143;
  id *v144;
  uint64_t *v145;
  uint64_t v146;
  uint64_t v147;

  v147 = *MEMORY[0x1E0C80C00];
  v4 = *(void **)(a1 + 40);
  v6 = *(void **)(a1 + 48);
  v5 = *(void **)(a1 + 56);
  v7 = *(void **)(a1 + 64);
  v8 = *(id *)(a1 + 32);
  v103 = v4;
  v9 = v5;
  v10 = v7;
  v11 = a2;
  v12 = v6;
  objc_opt_self();
  v13 = v12;
  v14 = v9;
  v15 = v10;
  v16 = v11;
  v105 = v8;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: checking if workoutEntity (%@) requires processing for quantity type %@"), objc_opt_self(), v13, v105);
  v101 = (void *)objc_claimAutoreleasedReturnValue();

  _HKInitializeLogging();
  v17 = *MEMORY[0x1E0CB5380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543362;
    *(_QWORD *)&buf[4] = v101;
    _os_log_debug_impl(&dword_1B7802000, v17, OS_LOG_TYPE_DEBUG, "%{public}@ started", buf, 0xCu);
  }
  Current = CFAbsoluteTimeGetCurrent();
  v19 = v13;
  v20 = v15;
  v106 = v16;
  v107 = v14;
  objc_opt_self();
  objc_msgSend(MEMORY[0x1E0D29880], "isNullPredicateWithProperty:", CFSTR("hfd_key"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D29840], "compoundPredicateWithPredicate:otherPredicate:", v107, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v106, "protectedDatabase");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = *MEMORY[0x1E0D29620];
  *(_QWORD *)buf = 0;
  +[HDSQLiteEntity countValueForProperty:predicate:database:error:](HDQuantitySampleSeriesEntity, "countValueForProperty:predicate:database:error:", v24, v22, v23, buf);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = *(id *)buf;

  if (!v25)
  {
    if (v26)
    {
      v26 = v26;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:format:", 100, CFSTR("Error getting count of single value samples associated with workout entity %lld"), objc_msgSend(v19, "persistentID"));
      v26 = (id)objc_claimAutoreleasedReturnValue();
      if (!v26)
      {
LABEL_16:
        v29 = 0;
        goto LABEL_17;
      }
    }
    if (a3)
      *a3 = objc_retainAutorelease(v26);
    else
      _HKLogDroppedError();

    goto LABEL_16;
  }
  v27 = objc_msgSend(v25, "integerValue");
  if (v20)
    v28 = *((_QWORD *)v20 + 4);
  else
    v28 = 0;
  if (v27 >= v28)
    v29 = 1;
  else
    v29 = 2;
LABEL_17:

  v30 = CFAbsoluteTimeGetCurrent();
  _HKInitializeLogging();
  v31 = (void *)*MEMORY[0x1E0CB5380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_DEBUG))
  {
    v86 = v31;
    HKStringFromFailableBooleanResult();
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    *(_QWORD *)&buf[4] = v101;
    *(_WORD *)&buf[12] = 2048;
    *(double *)&buf[14] = v30 - Current;
    *(_WORD *)&buf[22] = 2048;
    v134 = v30 - Current;
    LOWORD(v135) = 2112;
    *(_QWORD *)((char *)&v135 + 2) = v87;
    _os_log_debug_impl(&dword_1B7802000, v86, OS_LOG_TYPE_DEBUG, "%{public}@ finished single value samples check in %0.5f (total %0.5f): %@", buf, 0x2Au);

  }
  if (v29 >= 2)
  {
    v32 = v19;
    v33 = v107;
    v34 = v20;
    v35 = v106;
    objc_opt_self();
    v129 = 0;
    v130 = &v129;
    v131 = 0x2020000000;
    v132 = 0;
    *(_QWORD *)&v108 = 0;
    *((_QWORD *)&v108 + 1) = &v108;
    v109 = 0x2020000000uLL;
    v123 = 0;
    v124 = &v123;
    v125 = 0x2020000000;
    v126 = 0;
    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "timeIntervalSinceReferenceDate");
    v38 = v37;

    v126 = v38;
    v117 = 0;
    *(_QWORD *)buf = MEMORY[0x1E0C809B0];
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = __114__HDWorkoutCondenser__hasSamplesThatOverlapInTimeWithEntity_enumerationPredicate_configuration_transaction_error___block_invoke;
    v134 = COERCE_DOUBLE(&unk_1E6D0F888);
    *((_QWORD *)&v135 + 1) = &v123;
    v136 = &v129;
    v137 = &v108;
    v39 = v34;
    *(_QWORD *)&v135 = v39;
    v40 = +[HDQuantitySampleValueEnumerator orderedQuantityValuesBySeriesForPredicate:transaction:options:error:handler:](HDQuantitySampleValueEnumerator, "orderedQuantityValuesBySeriesForPredicate:transaction:options:error:handler:", v33, v35, 0, &v117, buf);
    v41 = v117;
    v42 = v41;
    if (v40)
    {
      if (v39)
        v43 = v39[4];
      else
        v43 = 0;
      if (*(_QWORD *)(*((_QWORD *)&v108 + 1) + 24) >= v43)
      {
        if (*((_BYTE *)v130 + 24))
          v29 = 1;
        else
          v29 = 2;
      }
      else
      {
        v29 = 2;
      }
LABEL_35:

      _Block_object_dispose(&v123, 8);
      _Block_object_dispose(&v108, 8);
      _Block_object_dispose(&v129, 8);

      v44 = CFAbsoluteTimeGetCurrent();
      _HKInitializeLogging();
      v45 = (void *)*MEMORY[0x1E0CB5380];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_DEBUG))
      {
        v89 = v45;
        HKStringFromFailableBooleanResult();
        v90 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        *(_QWORD *)&buf[4] = v101;
        *(_WORD *)&buf[12] = 2048;
        *(double *)&buf[14] = v44 - v30;
        *(_WORD *)&buf[22] = 2048;
        v134 = v44 - Current;
        LOWORD(v135) = 2112;
        *(_QWORD *)((char *)&v135 + 2) = v90;
        _os_log_debug_impl(&dword_1B7802000, v89, OS_LOG_TYPE_DEBUG, "%{public}@ finished overlapping samples check in %0.5f (total %0.5f): %@", buf, 0x2Au);

      }
      goto LABEL_37;
    }
    if (v41)
    {
      v42 = v41;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:format:", 100, CFSTR("Error while enumerating samples associated with workout entity %lld to find overlaps"), objc_msgSend(v32, "persistentID"));
      v42 = (id)objc_claimAutoreleasedReturnValue();
      if (!v42)
      {
LABEL_34:

        v29 = 0;
        goto LABEL_35;
      }
    }
    if (a3)
    {
      v42 = objc_retainAutorelease(v42);
      *a3 = v42;
    }
    else
    {
      _HKLogDroppedError();
    }
    goto LABEL_34;
  }
LABEL_37:

  if (!v29)
  {
    v46 = 0;
    goto LABEL_76;
  }
  if (v29 != 2)
  {
    if (v20)
    {
      v47 = (unsigned __int8 *)*((id *)v20 + 7);
      if (!v47 || (v48 = v47[8], v47, !v48))
      {
        v49 = *((id *)v20 + 7);
        if (v49)
        {
          ++v49[5];

        }
        v50 = *((id *)v20 + 7);
        if (v50)
        {
          v50[8] = 1;

        }
      }
    }
    v51 = v105;
    v52 = v103;
    v102 = v107;
    v53 = v20;
    v54 = v106;
    v97 = objc_opt_self();
    v123 = 0;
    v124 = &v123;
    v125 = 0x3032000000;
    v126 = __Block_byref_object_copy__197;
    v127 = __Block_byref_object_dispose__197;
    v128 = 0;
    v117 = 0;
    v118 = &v117;
    v119 = 0x3032000000;
    v120 = __Block_byref_object_copy__197;
    v121 = __Block_byref_object_dispose__197;
    v122 = 0;
    v113 = 0;
    v114 = (double *)&v113;
    v115 = 0x2020000000;
    v116 = 0xFFEFFFFFFFFFFFFFLL;
    v112[0] = 0;
    v112[1] = v112;
    v112[2] = 0x2020000000;
    v112[3] = 0x8010000000000000;
    v55 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v56 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v57 = objc_alloc_init(MEMORY[0x1E0C99DF0]);
    v58 = objc_alloc_init(MEMORY[0x1E0C99DF0]);
    *(_QWORD *)buf = MEMORY[0x1E0C809B0];
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = __104__HDWorkoutCondenser__processSamplesWithQuantityType_workout_predicate_configuration_transaction_error___block_invoke;
    v134 = COERCE_DOUBLE(&unk_1E6D0F8B0);
    v142 = &v123;
    v146 = v97;
    v100 = v53;
    *(_QWORD *)&v135 = v100;
    v59 = v54;
    *((_QWORD *)&v135 + 1) = v59;
    v98 = (uint64_t *)v57;
    v136 = v98;
    v96 = (__int128 *)v58;
    v137 = v96;
    v99 = v55;
    v138 = v99;
    v60 = v56;
    v139 = v60;
    v143 = v112;
    v144 = &v117;
    v93 = v51;
    v140 = v93;
    v145 = &v113;
    v94 = v52;
    v95 = v59;
    v141 = v94;
    if (!+[HDQuantitySampleValueEnumerator orderedQuantityValuesForPredicate:transaction:options:error:handler:](HDQuantitySampleValueEnumerator, "orderedQuantityValuesForPredicate:transaction:options:error:handler:", v102, v59, 0, a3, buf))goto LABEL_74;
    v61 = objc_msgSend(v60, "count");
    v62 = objc_msgSend(v99, "count");
    if (!v20 || (unint64_t)(v62 + v61) >= v100[4])
    {
      v110 = 0u;
      v111 = 0u;
      v108 = 0u;
      v109 = 0u;
      v63 = v99;
      v64 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v108, &v129, 16);
      if (v64)
      {
        v65 = *(_QWORD *)v109;
        do
        {
          v66 = 0;
          do
          {
            if (*(_QWORD *)v109 != v65)
              objc_enumerationMutation(v63);
            v67 = *(double **)(*((_QWORD *)&v108 + 1) + 8 * v66);
            if (!objc_msgSend(v60, "count"))
            {
              if (v67)
                v68 = *((_QWORD *)v67 + 4);
              else
                v68 = 0;
              *((_QWORD *)v114 + 3) = v68;
            }
            if (v67)
            {
              v70 = v67[5];
              v69 = v67[6];
              v71 = v67[4];
            }
            else
            {
              v69 = 0.0;
              v71 = 0.0;
              v70 = 0.0;
            }
            objc_msgSend(MEMORY[0x1E0CB6478], "datumWithStartTime:value:endTime:", v71, v69, v70);
            v72 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v60, "addObject:", v72);

            ++v66;
          }
          while (v64 != v66);
          v73 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v108, &v129, 16);
          v64 = v73;
        }
        while (v73);
      }

      objc_msgSend(v63, "removeAllObjects");
      v74 = v118[5];
      v75 = v114[3];
      v76 = (void *)v124[5];
      v91 = v94;
      v77 = v93;
      v92 = v96;
      v78 = v100;
      v79 = v95;
      v80 = v76;
      v81 = v60;
      v82 = v74;
      v83 = objc_opt_self();
      +[HDWorkoutCondenser _insertValuesForSeries:quantityType:startTime:values:provenance:configuration:transaction:countOut:error:](v75, v83, v82, v77, v81, v80, v78, v79, 0, (uint64_t)a3);
      v84 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v84)
      {

        goto LABEL_74;
      }
      v85 = +[HDWorkoutCondenser _finishSeries:quantityType:workout:UUIDDataToDelete:configuration:transaction:error:](v83, v84, v77, v91, v92, v78, v79);

      if ((v85 & 1) == 0)
      {
LABEL_74:
        v46 = 0;
        goto LABEL_75;
      }
      objc_msgSend(v92, "setLength:", 0);
    }
    if (!objc_msgSend(v98, "hk_countOfUUIDs")
      || +[HDWorkoutCondenser _deleteSamplesWithUUIDData:configuration:error:](v97, v98, v100, (uint64_t)a3))
    {
      v46 = 1;
LABEL_75:

      _Block_object_dispose(v112, 8);
      _Block_object_dispose(&v113, 8);
      _Block_object_dispose(&v117, 8);

      _Block_object_dispose(&v123, 8);
      goto LABEL_76;
    }
    goto LABEL_74;
  }
  v46 = 1;
LABEL_76:

  return v46;
}

uint64_t __114__HDWorkoutCondenser__hasSamplesThatOverlapInTimeWithEntity_enumerationPredicate_configuration_transaction_error___block_invoke(_QWORD *a1, double a2, double a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v10;
  double v11;

  if (a2 + 0.00000011920929 < *(double *)(*(_QWORD *)(a1[5] + 8) + 24))
    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 1;
  *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 24) += a8;
  v8 = a1[4];
  if (v8)
    v8 = *(_QWORD *)(v8 + 32);
  if (*(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 24) >= v8 && *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24))
    return 0;
  v10 = *(_QWORD *)(a1[5] + 8);
  v11 = *(double *)(v10 + 24);
  if (v11 <= a3)
    v11 = a3;
  *(double *)(v10 + 24) = v11;
  return 1;
}

uint64_t __104__HDWorkoutCondenser__processSamplesWithQuantityType_workout_predicate_configuration_transaction_error___block_invoke(uint64_t a1, uint64_t a2, double a3, double a4, double a5, double a6, double a7, uint64_t a8, const unsigned __int8 *a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
  HDQuantitySampleEntity *v20;
  void *v21;
  void *v22;
  HDQuantitySampleEntity *v23;
  id *v24;
  id v25;
  void *v26;
  void *v27;
  id WeakRetained;
  void *v29;
  void *v30;
  id v31;
  id *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  _HDWorkoutCondenserBufferDatum *v36;
  _BYTE *v37;
  _BYTE *v38;
  int v39;
  id *v40;
  void *v41;
  double *v42;
  id v43;
  double *v44;
  double *v45;
  double *v46;
  double v47;
  double v48;
  unint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  unint64_t v53;
  _QWORD *v54;
  double v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  void *v59;
  _QWORD *v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  uint64_t v64;
  uint64_t v65;
  double v66;
  double v67;
  double v68;
  double v69;
  void *v70;
  void *v71;
  double v73;
  double v74;
  uint64_t v75;
  void *v76;
  double *v77;
  id *v78;
  uint64_t v79;
  objc_super v80;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40))
  {
    v20 = -[HDSQLiteEntity initWithPersistentID:]([HDQuantitySampleEntity alloc], "initWithPersistentID:", a2);
    v21 = *(void **)(a1 + 32);
    v22 = *(void **)(a1 + 40);
    v23 = v20;
    v24 = v21;
    v25 = v22;
    objc_opt_self();
    objc_msgSend(v25, "protectedDatabase");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDSQLiteEntity valueForProperty:database:](v23, "valueForProperty:database:", CFSTR("provenance"), v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v78 = v24;
    v79 = a13;
    if (v27)
    {
      if (v24)
        WeakRetained = objc_loadWeakRetained(v24 + 1);
      else
        WeakRetained = 0;
      objc_msgSend(WeakRetained, "dataProvenanceManager");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "originProvenanceForPersistentID:transaction:error:", v27, v25, a13);
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      if (v30)
        v31 = v30;

      v32 = v78;
    }
    else
    {
      v32 = v24;
      objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a13, 100, CFSTR("Unable to get %@ for persistentID %lld"), CFSTR("provenance"), -[HDSQLiteEntity persistentID](v23, "persistentID"));
      v30 = 0;
    }

    v33 = *(_QWORD *)(*(_QWORD *)(a1 + 96) + 8);
    v34 = *(void **)(v33 + 40);
    *(_QWORD *)(v33 + 40) = v30;

    v35 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40);
    a13 = v79;
    if (!v35)
      return 0;
  }
  v36 = [_HDWorkoutCondenserBufferDatum alloc];
  if (v36
    && (v80.receiver = v36,
        v80.super_class = (Class)_HDWorkoutCondenserBufferDatum,
        (v37 = objc_msgSendSuper2(&v80, sel_init)) != 0))
  {
    v38 = v37;
    *((double *)v37 + 4) = a6;
    *((double *)v37 + 5) = a7;
    *((double *)v37 + 6) = a5;
    uuid_copy(v37 + 8, a9);
    v38[24] = a11 > 1;
    if (a11 >= 2)
    {
      v39 = 0;
      v40 = (id *)(a1 + 48);
      goto LABEL_17;
    }
    v39 = 0;
  }
  else
  {
    v38 = 0;
    v39 = 1;
  }
  v40 = (id *)(a1 + 56);
LABEL_17:
  objc_msgSend(*v40, "hk_appendUUIDBytes:", a9);
  v41 = *(void **)(a1 + 64);
  v42 = v38;
  v43 = v41;
  objc_opt_self();
  objc_msgSend(v43, "lastObject");
  v44 = (double *)objc_claimAutoreleasedReturnValue();
  v45 = v44;
  if (v44)
  {
    if (v39)
    {
      if (v44[4] != 0.0)
        goto LABEL_25;
      v77 = v44;
      goto LABEL_54;
    }
    if (v42[4] == v44[4])
    {
      v46 = v44;
      if (v42[4] != v45[4])
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v76, "handleFailureInMethod:object:file:lineNumber:description:", sel_shouldReplaceDatum_, v42, CFSTR("HDWorkoutCondenser.m"), 1458, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_startTime == anotherDatum->_startTime"));

      }
      v47 = v42[5];
      v48 = v46[5];
      if (v47 < v48)
        goto LABEL_23;
      if (v47 <= v48)
      {
        v73 = v42[6];
        v74 = v46[6];
        if (v73 < v74)
        {
LABEL_23:

LABEL_24:
          objc_msgSend(v43, "removeLastObject");
          goto LABEL_25;
        }
        if (v73 <= v74)
        {
          v75 = HKCompareUUIDBytes();

          if (v75 == -1)
            goto LABEL_26;
          goto LABEL_24;
        }
      }
LABEL_54:

      goto LABEL_26;
    }
  }
LABEL_25:
  objc_msgSend(v43, "addObject:", v42);
LABEL_26:

  v49 = objc_msgSend(*(id *)(a1 + 64), "count");
  v50 = *(_QWORD *)(a1 + 32);
  if (!v50 || v49 >= *(_QWORD *)(v50 + 32))
  {
    objc_msgSend(*(id *)(a1 + 64), "firstObject");
    v52 = objc_claimAutoreleasedReturnValue();
    v53 = objc_msgSend(*(id *)(a1 + 72), "count");
    v54 = *(_QWORD **)(a1 + 32);
    if (v54 && v53 < v54[5])
      goto LABEL_41;
    v55 = v52 ? *(double *)(v52 + 32) + 0.00000011920929 : 0.00000011920929;
    if (v55 < *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 24))
      goto LABEL_41;
    v80.receiver = 0;
    +[HDWorkoutCondenser _insertValuesForSeries:quantityType:startTime:values:provenance:configuration:transaction:countOut:error:](*(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 120) + 8) + 24), *(_QWORD *)(a1 + 128), *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 40), *(void **)(a1 + 80), *(void **)(a1 + 72), *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40), v54, *(void **)(a1 + 40), &v80, a13);
    v56 = objc_claimAutoreleasedReturnValue();
    v57 = *(_QWORD *)(*(_QWORD *)(a1 + 112) + 8);
    v58 = *(void **)(v57 + 40);
    *(_QWORD *)(v57 + 40) = v56;

    v59 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 40);
    if (v59)
    {
      v60 = *(_QWORD **)(a1 + 32);
      if (v60)
        v61 = v60[5];
      else
        v61 = 0;
      if ((uint64_t)v80.receiver < v61)
        goto LABEL_40;
      if (+[HDWorkoutCondenser _finishSeries:quantityType:workout:UUIDDataToDelete:configuration:transaction:error:](*(_QWORD *)(a1 + 128), v59, *(void **)(a1 + 80), *(void **)(a1 + 88), *(void **)(a1 + 56), v60, *(void **)(a1 + 40)))
      {
        v62 = *(_QWORD *)(*(_QWORD *)(a1 + 112) + 8);
        v63 = *(void **)(v62 + 40);
        *(_QWORD *)(v62 + 40) = 0;

        objc_msgSend(*(id *)(a1 + 56), "setLength:", 0);
LABEL_40:
        objc_msgSend(*(id *)(a1 + 72), "removeAllObjects");
LABEL_41:
        if (!objc_msgSend(*(id *)(a1 + 72), "count"))
        {
          if (v52)
          {
            *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 120) + 8) + 24) = *(_QWORD *)(v52 + 32);
            v64 = *(_QWORD *)(v52 + 40);
          }
          else
          {
            *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 120) + 8) + 24) = 0;
            v64 = 0;
          }
          *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 24) = v64;
        }
        v65 = *(_QWORD *)(*(_QWORD *)(a1 + 104) + 8);
        v66 = *(double *)(v65 + 24);
        if (v52)
        {
          if (v66 < *(double *)(v52 + 40))
            v66 = *(double *)(v52 + 40);
          *(double *)(v65 + 24) = v66;
          v68 = *(double *)(v52 + 40);
          v67 = *(double *)(v52 + 48);
          v69 = *(double *)(v52 + 32);
        }
        else
        {
          v67 = 0.0;
          if (v66 < 0.0)
            v66 = 0.0;
          *(double *)(v65 + 24) = v66;
          v69 = 0.0;
          v68 = 0.0;
        }
        v70 = *(void **)(a1 + 72);
        objc_msgSend(MEMORY[0x1E0CB6478], "datumWithStartTime:value:endTime:", v69, v67, v68);
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v70, "addObject:", v71);

        objc_msgSend(*(id *)(a1 + 64), "removeObjectAtIndex:", 0);
        v51 = 1;
        goto LABEL_50;
      }
    }
    v51 = 0;
LABEL_50:

    goto LABEL_51;
  }
  v51 = 1;
LABEL_51:

  return v51;
}

+ (id)_insertValuesForSeries:(void *)a3 quantityType:(void *)a4 startTime:(void *)a5 values:(void *)a6 provenance:(void *)a7 configuration:(void *)a8 transaction:(_QWORD *)a9 countOut:(uint64_t)a10 error:
{
  uint64_t v16;
  id WeakRetained;
  id v18;
  id v19;
  id *v20;
  id v21;
  uint64_t v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  HDSourceEntity *v33;
  void *v34;
  HDSourceEntity *v35;
  HDDeviceEntity *v36;
  void *v37;
  HDDeviceEntity *v38;
  void *v39;
  int v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  NSObject *v48;
  uint64_t v49;
  uint64_t v50;
  id v51;
  id *v52;
  id v53;
  void *v55;
  id v56;
  void *v57;
  uint8_t buf[4];
  uint64_t v59;
  __int16 v60;
  uint64_t v61;
  __int16 v62;
  uint64_t v63;
  uint64_t v64;

  v16 = a10;
  v64 = *MEMORY[0x1E0C80C00];
  WeakRetained = a3;
  v56 = a4;
  v18 = a5;
  v19 = a6;
  v20 = a7;
  v21 = a8;
  v22 = objc_opt_self();
  v55 = v19;
  if (!WeakRetained)
  {
    v51 = v21;
    _HKInitializeLogging();
    v23 = (void *)*MEMORY[0x1E0CB5380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_INFO))
    {
      v24 = v23;
      *(_DWORD *)buf = 138543874;
      v59 = v22;
      v60 = 2114;
      v61 = (uint64_t)v56;
      v62 = 2048;
      v63 = objc_msgSend(v18, "count");
      _os_log_impl(&dword_1B7802000, v24, OS_LOG_TYPE_INFO, "%{public}@: create series quantityType %{public}@ with %lu values", buf, 0x20u);

    }
    v52 = v20;
    v53 = v18;
    v50 = v22;
    if (v20)
      WeakRetained = objc_loadWeakRetained(v20 + 1);
    else
      WeakRetained = 0;
    v25 = (void *)objc_msgSend(v56, "dataObjectClass");
    v26 = (void *)MEMORY[0x1E0CB6A28];
    objc_msgSend(v56, "canonicalUnit");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "quantityWithUnit:doubleValue:", v27, 0.0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", a1);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "_unfrozenQuantitySampleWithQuantityType:quantity:startDate:device:", v56, v28, v29, 0);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(WeakRetained, "dataManager");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = v30;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v57, 1);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = [HDSourceEntity alloc];
    objc_msgSend(v19, "sourceID");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = -[HDSQLiteEntity initWithPersistentID:](v33, "initWithPersistentID:", objc_msgSend(v34, "longLongValue"));
    v36 = [HDDeviceEntity alloc];
    objc_msgSend(v19, "deviceID");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = -[HDSQLiteEntity initWithPersistentID:](v36, "initWithPersistentID:", objc_msgSend(v37, "longLongValue"));
    objc_msgSend(v19, "sourceVersion");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = objc_msgSend(v31, "insertDataObjects:sourceEntity:deviceEntity:sourceVersion:creationDate:error:", v32, v35, v38, v39, a10, CFAbsoluteTimeGetCurrent());

    if (!v40)
    {
      v46 = 0;
      v20 = v52;
      v18 = v53;
      v21 = v51;
      goto LABEL_18;
    }
    objc_msgSend(v30, "UUID");
    v41 = objc_claimAutoreleasedReturnValue();

    WeakRetained = (id)v41;
    v20 = v52;
    v18 = v53;
    v22 = v50;
    v21 = v51;
    v16 = a10;
  }
  objc_msgSend(v21, "protectedDatabase");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  HDDataEntityPredicateForDataUUID();
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDDataEntity anyInDatabase:predicate:error:](HDQuantitySampleSeriesEntity, "anyInDatabase:predicate:error:", v42, v43, v16);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v30)
    goto LABEL_16;
  _HKInitializeLogging();
  v44 = (void *)*MEMORY[0x1E0CB5380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_DEBUG))
  {
    v48 = v44;
    v49 = objc_msgSend(v18, "count");
    *(_DWORD *)buf = 138543618;
    v59 = v22;
    v60 = 2048;
    v61 = v49;
    _os_log_debug_impl(&dword_1B7802000, v48, OS_LOG_TYPE_DEBUG, "%{public}@: insert %lu values into series", buf, 0x16u);

  }
  if (!objc_msgSend(v30, "insertValues:transaction:error:", v18, v21, v16))
  {
LABEL_16:
    v46 = 0;
    goto LABEL_18;
  }
  if (!a9)
    goto LABEL_15;
  objc_msgSend(v30, "countForSeriesWithTransaction:error:", v21, v16);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = v45;
  if (v45)
  {
    *a9 = objc_msgSend(v45, "integerValue");

LABEL_15:
    WeakRetained = WeakRetained;
    v46 = WeakRetained;
  }
LABEL_18:

  return v46;
}

+ (uint64_t)_finishSeries:(uint64_t)a1 quantityType:(void *)a2 workout:(void *)a3 UUIDDataToDelete:(void *)a4 configuration:(void *)a5 transaction:(void *)a6 error:(void *)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  uint64_t v24;
  void *v26;
  void *v27;
  void *v28;
  void *v29;

  v12 = a2;
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  objc_opt_self();
  v26 = v16;
  v29 = v15;
  v27 = v12;
  v28 = v13;
  v18 = v15;
  v19 = v14;
  v20 = v13;
  v21 = v12;
  v22 = v17;
  v23 = v16;
  v24 = HKWithAutoreleasePool();

  return v24;
}

+ (uint64_t)_deleteSamplesWithUUIDData:(void *)a3 configuration:(uint64_t)a4 error:
{
  id v6;
  id *v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  _QWORD *v11;
  HDDataDeletionConfiguration *v12;
  id WeakRetained;
  void *v14;
  uint64_t v15;
  int v17;
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a3;
  v8 = objc_opt_self();
  v9 = objc_msgSend(v6, "hk_countOfUUIDs");
  _HKInitializeLogging();
  v10 = *MEMORY[0x1E0CB5380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_DEBUG))
  {
    v17 = 138543618;
    v18 = v8;
    v19 = 2048;
    v20 = v9;
    _os_log_debug_impl(&dword_1B7802000, v10, OS_LOG_TYPE_DEBUG, "%{public}@: delete %ld condensed samples", (uint8_t *)&v17, 0x16u);
    if (!v7)
      goto LABEL_5;
  }
  else if (!v7)
  {
    goto LABEL_5;
  }
  v11 = v7[7];
  if (v11)
  {
    v11[7] += v9;

  }
LABEL_5:
  v12 = objc_alloc_init(HDDataDeletionConfiguration);
  -[HDDataDeletionConfiguration setFailIfNotFound:](v12, "setFailIfNotFound:", 0);
  -[HDDataDeletionConfiguration setPreserveExactStartAndEndDates:](v12, "setPreserveExactStartAndEndDates:", 1);
  if (v7)
    WeakRetained = objc_loadWeakRetained(v7 + 1);
  else
    WeakRetained = 0;
  objc_msgSend(WeakRetained, "dataManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "deleteObjectsWithUUIDCollection:configuration:error:", v6, v12, a4);

  return v15;
}

uint64_t __106__HDWorkoutCondenser__finishSeries_quantityType_workout_UUIDDataToDelete_configuration_transaction_error___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  id WeakRetained;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  os_log_t *v21;
  void *v22;
  void *v23;
  os_log_t v24;
  void *v25;
  void *v26;
  void *v27;
  _BOOL4 v28;
  id v29;
  uint64_t v30;
  _QWORD *v31;
  uint64_t v33;
  void *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  NSObject *v40;
  void *v41;
  void *v42;
  id v43;
  id v44;
  void *v45;
  _BYTE buf[22];
  __int16 v47;
  void *v48;
  __int16 v49;
  void *v50;
  _QWORD v51[3];

  v51[2] = *MEMORY[0x1E0C80C00];
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
    WeakRetained = objc_loadWeakRetained((id *)(v4 + 8));
  else
    WeakRetained = 0;
  objc_msgSend(*(id *)(a1 + 40), "protectedDatabase");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  HDDataEntityPredicateForDataUUID();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDDataEntity anyInDatabase:predicate:error:](HDQuantitySampleSeriesEntity, "anyInDatabase:predicate:error:", v6, v7, a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v43 = WeakRetained;
    v9 = *(void **)(a1 + 64);
    v10 = *(void **)(a1 + 40);
    v11 = *(id *)(a1 + 56);
    v12 = v10;
    v13 = v9;
    v14 = v8;
    objc_msgSend((id)objc_opt_self(), "seriesSyncIdentifierForEntity:workout:transaction:error:", v14, v13, v12, a2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      v16 = (void *)MEMORY[0x1E0C99E08];
      v17 = *MEMORY[0x1E0CB55D8];
      v51[0] = *MEMORY[0x1E0CB55D0];
      v51[1] = v17;
      *(_QWORD *)buf = v15;
      *(_QWORD *)&buf[8] = &unk_1E6DFE840;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, v51, 2);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "dictionaryWithDictionary:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v11, "code") == 5)
        objc_msgSend(v19, "setObject:forKeyedSubscript:", &unk_1E6DFE828, *MEMORY[0x1E0CB7298]);
    }
    else
    {
      v19 = 0;
    }
    WeakRetained = v43;

    if (v19)
    {
      _HKInitializeLogging();
      v21 = (os_log_t *)MEMORY[0x1E0CB5380];
      v22 = (void *)*MEMORY[0x1E0CB5380];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_DEBUG))
      {
        v33 = *(_QWORD *)(a1 + 80);
        v34 = *(void **)(a1 + 64);
        v35 = v22;
        objc_msgSend(v34, "UUID");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = *(void **)(a1 + 48);
        *(_DWORD *)buf = 138544130;
        *(_QWORD *)&buf[4] = v33;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v36;
        v47 = 2114;
        v48 = v37;
        v49 = 2114;
        v50 = v19;
        _os_log_debug_impl(&dword_1B7802000, v35, OS_LOG_TYPE_DEBUG, "%{public}@: workout (%{public}@) freeze series %{public}@ with metadata: %{public}@", buf, 0x2Au);

      }
      +[HDQuantitySampleSeriesEntity freezeSeriesWithIdentifier:metadata:endDate:profile:error:](HDQuantitySampleSeriesEntity, "freezeSeriesWithIdentifier:metadata:endDate:profile:error:", *(_QWORD *)(a1 + 48), v19, 0, v43, a2);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if (v23)
      {
        _HKInitializeLogging();
        v24 = *v21;
        if (os_log_type_enabled(*v21, OS_LOG_TYPE_DEBUG))
        {
          v38 = *(_QWORD *)(a1 + 80);
          v39 = *(void **)(a1 + 64);
          v40 = v24;
          objc_msgSend(v39, "UUID");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "frozenIdentifier");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          *(_QWORD *)&buf[4] = v38;
          *(_WORD *)&buf[12] = 2114;
          *(_QWORD *)&buf[14] = v41;
          v47 = 2114;
          v48 = v42;
          _os_log_debug_impl(&dword_1B7802000, v40, OS_LOG_TYPE_DEBUG, "%{public}@: workout (%{public}@) associate series %{public}@", buf, 0x20u);

        }
        objc_msgSend(v23, "frozenIdentifier");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = v25;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v45, 1);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 64), "UUID");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = 0;
        v28 = +[HDAssociationEntity associateSampleUUIDs:withSampleUUID:type:destinationSubObjectReference:lastInsertedEntityID:profile:error:](HDAssociationEntity, "associateSampleUUIDs:withSampleUUID:type:destinationSubObjectReference:lastInsertedEntityID:profile:error:", v26, v27, 0, 0, &v44, v43, a2);
        v29 = v44;

        if (v28)
        {
          v30 = *(_QWORD *)(a1 + 32);
          if (v30)
          {
            v31 = *(id *)(v30 + 56);
            if (v31)
            {
              ++v31[6];

            }
          }
          v20 = +[HDWorkoutCondenser _deleteSamplesWithUUIDData:configuration:error:](*(_QWORD *)(a1 + 80), *(void **)(a1 + 72), *(void **)(a1 + 32), a2);
        }
        else
        {
          v20 = 0;
        }
        WeakRetained = v43;

      }
      else
      {
        v20 = 0;
      }

    }
    else
    {
      v20 = 0;
    }

  }
  else
  {
    v20 = 0;
  }

  return v20;
}

uint64_t __76__HDWorkoutCondenser__updateCondenserVersionForWorkout_configuration_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;

  v4 = *(void **)(a1 + 32);
  v5 = (void *)MEMORY[0x1E0C99D68];
  v6 = a2;
  objc_msgSend(v5, "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v4, "updateCondenserVersion:date:transaction:error:", 5, v7, v6, a3);

  return v8;
}

+ (id)condensableQuantityTypes
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  _QWORD v29[27];

  v29[25] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB6A70], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5A48]);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = v28;
  objc_msgSend(MEMORY[0x1E0CB6A70], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5A88]);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v29[1] = v27;
  objc_msgSend(MEMORY[0x1E0CB6A70], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5C38]);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v29[2] = v26;
  objc_msgSend(MEMORY[0x1E0CB6A70], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5C68]);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v29[3] = v25;
  objc_msgSend(MEMORY[0x1E0CB6A70], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5C70]);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v29[4] = v24;
  objc_msgSend(MEMORY[0x1E0CB6A70], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5CB0]);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v29[5] = v23;
  objc_msgSend(MEMORY[0x1E0CB6A70], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5D38]);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v29[6] = v22;
  objc_msgSend(MEMORY[0x1E0CB6A70], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5D40]);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v29[7] = v21;
  objc_msgSend(MEMORY[0x1E0CB6A70], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5D48]);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v29[8] = v20;
  objc_msgSend(MEMORY[0x1E0CB6A70], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5D50]);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v29[9] = v19;
  objc_msgSend(MEMORY[0x1E0CB6A70], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5D58]);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v29[10] = v18;
  objc_msgSend(MEMORY[0x1E0CB6A70], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5D78]);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v29[11] = v17;
  objc_msgSend(MEMORY[0x1E0CB6A70], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5AE8]);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v29[12] = v16;
  objc_msgSend(MEMORY[0x1E0CB6A70], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5AF0]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v29[13] = v15;
  objc_msgSend(MEMORY[0x1E0CB6A70], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5AD8]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v29[14] = v14;
  objc_msgSend(MEMORY[0x1E0CB6A70], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5D98]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v29[15] = v2;
  objc_msgSend(MEMORY[0x1E0CB6A70], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5DD0]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v29[16] = v3;
  objc_msgSend(MEMORY[0x1E0CB6A70], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5C50]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v29[17] = v4;
  objc_msgSend(MEMORY[0x1E0CB6A70], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5C48]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v29[18] = v5;
  objc_msgSend(MEMORY[0x1E0CB6A70], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5C30]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v29[19] = v6;
  objc_msgSend(MEMORY[0x1E0CB6A70], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5C58]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v29[20] = v7;
  objc_msgSend(MEMORY[0x1E0CB6A70], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5C40]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v29[21] = v8;
  objc_msgSend(MEMORY[0x1E0CB6A70], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5AD0]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v29[22] = v9;
  objc_msgSend(MEMORY[0x1E0CB6A70], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5CF8]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v29[23] = v10;
  objc_msgSend(MEMORY[0x1E0CB6A70], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5D30]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v29[24] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 25);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  return v13;
}

BOOL __112__HDWorkoutCondenser__queue_submitAnalyticEventForReason_batchSize_success_duration_analyticsAccumulator_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;

  v5 = *MEMORY[0x1E0D29620];
  v6 = a2;
  HDSourceEntityPredicateForAppleWatchSources();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "unprotectedDatabase");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  +[HDSQLiteEntity countValueForProperty:predicate:database:error:](HDSourceEntity, "countValueForProperty:predicate:database:error:", v5, v7, v8, a3);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v9;

  return *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) != 0;
}

- (void)periodicActivity:(id)a3 configureXPCActivityCriteria:(id)a4
{
  const char *v4;
  xpc_object_t xdict;

  v4 = (const char *)*MEMORY[0x1E0C80738];
  xdict = a4;
  xpc_dictionary_set_BOOL(xdict, v4, 1);
  xpc_dictionary_set_string(xdict, (const char *)*MEMORY[0x1E0C80878], (const char *)*MEMORY[0x1E0C80888]);
  xpc_dictionary_set_BOOL(xdict, (const char *)*MEMORY[0x1E0C808B0], 1);

}

- (void)performPeriodicActivity:(id)a3 completion:(id)a4
{
  id v5;
  uint64_t v6;
  NSObject *queue;
  NSObject *v8;
  id v9;
  void *v10;
  id WeakRetained;
  void *v12;
  void *v13;
  _QWORD v14[5];
  id v15;
  _QWORD block[5];
  uint8_t buf[4];
  HDWorkoutCondenser *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  v6 = MEMORY[0x1E0C809B0];
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__HDWorkoutCondenser_performPeriodicActivity_completion___block_invoke;
  block[3] = &unk_1E6CE80E8;
  block[4] = self;
  dispatch_sync(queue, block);
  _HKInitializeLogging();
  v8 = *MEMORY[0x1E0CB5380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    v18 = self;
    _os_log_impl(&dword_1B7802000, v8, OS_LOG_TYPE_INFO, "%{public}@: maintenance operation enqueued", buf, 0xCu);
  }
  v14[0] = v6;
  v14[1] = 3221225472;
  v14[2] = __57__HDWorkoutCondenser_performPeriodicActivity_completion___block_invoke_266;
  v14[3] = &unk_1E6CF9B58;
  v14[4] = self;
  v15 = v5;
  v9 = v5;
  +[HDMaintenanceOperation maintenanceOperationWithName:asynchronousBlock:](HDMaintenanceOperation, "maintenanceOperationWithName:asynchronousBlock:", CFSTR("Workout Condensing"), v14);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "daemon");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "maintenanceWorkCoordinator");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "enqueueMaintenanceOperation:", v10);

}

void __57__HDWorkoutCondenser_performPeriodicActivity_completion___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  objc_class *v4;
  void *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  id v12;
  uint8_t buf[4];
  uint64_t v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "invalidate");
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 80));
  objc_msgSend(WeakRetained, "database");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  objc_msgSend(v3, "takeAccessibilityAssertionWithOwnerIdentifier:timeout:error:", v5, &v12, 300.0);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v12;
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(void **)(v8 + 24);
  *(_QWORD *)(v8 + 24) = v6;

  if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 24))
  {
    _HKInitializeLogging();
    v10 = *MEMORY[0x1E0CB5380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_INFO))
    {
      v11 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      v14 = v11;
      v15 = 2114;
      v16 = v7;
      _os_log_impl(&dword_1B7802000, v10, OS_LOG_TYPE_INFO, "%{public}@ unable to get accessibilityAssertion before enqueing maintenance operation: %{public}@", buf, 0x16u);
    }
  }

}

void __57__HDWorkoutCondenser_performPeriodicActivity_completion___block_invoke_266(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;
  uint8_t buf[4];
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _HKInitializeLogging();
  v4 = *MEMORY[0x1E0CB5380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_INFO))
  {
    v5 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    v13 = v5;
    _os_log_impl(&dword_1B7802000, v4, OS_LOG_TYPE_INFO, "%{public}@: maintenance operation running", buf, 0xCu);
  }
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __57__HDWorkoutCondenser_performPeriodicActivity_completion___block_invoke_267;
  v8[3] = &unk_1E6CF7528;
  v6 = *(void **)(a1 + 40);
  v9 = *(id *)(a1 + 32);
  v10 = v3;
  v11 = v6;
  v7 = v3;
  objc_msgSend(v9, "condenseWorkoutsForReason:workoutBatchLimit:completion:", 0, 500, v8);

}

void __57__HDWorkoutCondenser_performPeriodicActivity_completion___block_invoke_267(_QWORD *a1, uint64_t a2, void *a3)
{
  uint64_t v4;
  void (*v5)(uint64_t);
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  int v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a1[5];
  v5 = *(void (**)(uint64_t))(v4 + 16);
  v6 = a3;
  v5(v4);
  _HKInitializeLogging();
  v7 = *MEMORY[0x1E0CB5380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_INFO))
  {
    v8 = a1[4];
    v11 = 138543362;
    v12 = v8;
    _os_log_impl(&dword_1B7802000, v7, OS_LOG_TYPE_INFO, "%{public}@: maintenance operation finished", (uint8_t *)&v11, 0xCu);
  }
  objc_msgSend(*(id *)(a1[4] + 24), "invalidate");
  v9 = a1[4];
  v10 = *(void **)(v9 + 24);
  *(_QWORD *)(v9 + 24) = 0;

  (*(void (**)(double))(a1[6] + 16))(0.0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_analyticsAccumulator, 0);
  objc_destroyWeak((id *)&self->_profile);
  objc_storeStrong((id *)&self->_onLockDatabaseAccessibilityAssertion, 0);
  objc_storeStrong((id *)&self->_preparedDatabaseAccessibilityAssertion, 0);
  objc_storeStrong((id *)&self->_periodicActivity, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
