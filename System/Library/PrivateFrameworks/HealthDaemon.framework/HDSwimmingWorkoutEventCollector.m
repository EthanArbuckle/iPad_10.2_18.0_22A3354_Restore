@implementation HDSwimmingWorkoutEventCollector

+ (BOOL)isAvailableInCurrentHardware
{
  if (_HDIsUnitTesting)
    return 1;
  else
    return HKCoreMotionSupportsSwimmingWorkoutSessions();
}

- (HDSwimmingWorkoutEventCollector)initWithProfile:(id)a3 delegate:(id)a4
{
  HDSwimmingWorkoutEventCollector *v4;
  uint64_t v5;
  OS_dispatch_queue *workoutEventQueue;
  void *v7;
  void *v8;
  uint64_t v9;
  CMSwimTracker *swimTracker;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)HDSwimmingWorkoutEventCollector;
  v4 = -[HDWorkoutEventCollector initWithProfile:delegate:](&v12, sel_initWithProfile_delegate_, a3, a4);
  if (v4)
  {
    HKCreateSerialDispatchQueue();
    v5 = objc_claimAutoreleasedReturnValue();
    workoutEventQueue = v4->_workoutEventQueue;
    v4->_workoutEventQueue = (OS_dispatch_queue *)v5;

    -[HDWorkoutEventCollector profile](v4, "profile");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "workoutManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "newCMSwimTracker");
    swimTracker = v4->_swimTracker;
    v4->_swimTracker = (CMSwimTracker *)v9;

  }
  return v4;
}

- (void)startWithSessionId:(id)a3
{
  id v4;
  NSObject *workoutEventQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  workoutEventQueue = self->_workoutEventQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__HDSwimmingWorkoutEventCollector_startWithSessionId___block_invoke;
  block[3] = &unk_1E6CE8080;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(workoutEventQueue, block);

}

void __54__HDSwimmingWorkoutEventCollector_startWithSessionId___block_invoke(uint64_t a1)
{
  _QWORD *v1;
  id v2;
  void *v3;
  NSObject *v4;
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  objc_super v12;
  _BYTE buf[24];
  void *v14;
  _QWORD *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD **)(a1 + 32);
  v2 = *(id *)(a1 + 40);
  if (v1)
  {
    _HKInitializeLogging();
    v3 = (void *)*MEMORY[0x1E0CB5380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_DEFAULT))
    {
      v4 = v3;
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = objc_opt_class();
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v2;
      v5 = *(id *)&buf[4];
      _os_log_impl(&dword_1B7802000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] Starting swim workout event collector for sessionID %@", buf, 0x16u);

    }
    v12.receiver = v1;
    v12.super_class = (Class)HDSwimmingWorkoutEventCollector;
    objc_msgSendSuper2(&v12, sel_startWithSessionId_, v2);
    v6 = objc_alloc(MEMORY[0x1E0CA56E0]);
    objc_msgSend(v1, "sessionId");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "initWithSessionId:", v7);
    v9 = (void *)v1[5];
    v1[5] = v8;

    v10 = (void *)v1[4];
    v11 = v1[5];
    *(_QWORD *)buf = MEMORY[0x1E0C809B0];
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = __71__HDSwimmingWorkoutEventCollector__queue_startCollectionWithSessionId___block_invoke;
    v14 = &unk_1E6CF3370;
    v15 = v1;
    objc_msgSend(v10, "startUpdatesFromRecord:handler:", v11, buf);
  }

}

- (void)stop
{
  NSObject *workoutEventQueue;
  _QWORD block[5];

  workoutEventQueue = self->_workoutEventQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__HDSwimmingWorkoutEventCollector_stop__block_invoke;
  block[3] = &unk_1E6CE80E8;
  block[4] = self;
  dispatch_sync(workoutEventQueue, block);
}

id __39__HDSwimmingWorkoutEventCollector_stop__block_invoke(id result)
{
  id *v1;
  void *v2;
  NSObject *v3;
  void *v4;
  id v5;
  void *v6;
  _BYTE v7[22];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v1 = (id *)*((_QWORD *)result + 4);
  if (v1)
  {
    _HKInitializeLogging();
    v2 = (void *)*MEMORY[0x1E0CB5380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_DEFAULT))
    {
      v3 = v2;
      v4 = (void *)objc_opt_class();
      v5 = v4;
      objc_msgSend(v1, "sessionId");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v7 = 138543618;
      *(_QWORD *)&v7[4] = v4;
      *(_WORD *)&v7[12] = 2112;
      *(_QWORD *)&v7[14] = v6;
      _os_log_impl(&dword_1B7802000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] Stopping swim workout event collector for sessionID: %@", v7, 0x16u);

    }
    objc_msgSend(v1[4], "stopUpdates");
    *(_QWORD *)v7 = v1;
    *(_QWORD *)&v7[8] = HDSwimmingWorkoutEventCollector;
    return objc_msgSendSuper2((objc_super *)v7, sel_stop);
  }
  return result;
}

+ (BOOL)supportsWorkoutActivityType:(unint64_t)a3
{
  return a3 == 46;
}

- (void)requestPendingEventsThroughDate:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *workoutEventQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  workoutEventQueue = self->_workoutEventQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __78__HDSwimmingWorkoutEventCollector_requestPendingEventsThroughDate_completion___block_invoke;
  block[3] = &unk_1E6CEA160;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(workoutEventQueue, block);

}

void __78__HDSwimmingWorkoutEventCollector_requestPendingEventsThroughDate_completion___block_invoke(id *a1)
{
  void *v2;
  uint64_t *v3;
  void *v4;
  void *v5;
  void (**v6)(id, uint64_t, _QWORD);
  NSObject *v7;
  id v8;
  _QWORD aBlock[4];
  id v10;
  id v11;
  id v12;
  id location[4];

  location[3] = *(id *)MEMORY[0x1E0C80C00];
  objc_msgSend(a1[4], "sessionId");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    v3 = (uint64_t *)(a1 + 4);
    objc_initWeak(location, a1[4]);
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __78__HDSwimmingWorkoutEventCollector_requestPendingEventsThroughDate_completion___block_invoke_2;
    aBlock[3] = &unk_1E6CF28D0;
    objc_copyWeak(&v12, location);
    v10 = a1[5];
    v11 = a1[6];
    v4 = _Block_copy(aBlock);
    -[HDSwimmingWorkoutEventCollector _queue_querySwimDataWithCompletion:](*v3, v4);

    objc_destroyWeak(&v12);
    objc_destroyWeak(location);
  }
  else
  {
    _HKInitializeLogging();
    v5 = (void *)*MEMORY[0x1E0CB5380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_ERROR))
    {
      v7 = v5;
      LODWORD(location[0]) = 138543362;
      *(id *)((char *)location + 4) = (id)objc_opt_class();
      v8 = *(id *)((char *)location + 4);
      _os_log_error_impl(&dword_1B7802000, v7, OS_LOG_TYPE_ERROR, "[%{public}@] Terminating request for collecting pending swim events as sessionId is nil", (uint8_t *)location, 0xCu);

    }
    v6 = (void (**)(id, uint64_t, _QWORD))a1[6];
    if (v6)
      v6[2](v6, 1, 0);
  }
}

void __78__HDSwimmingWorkoutEventCollector_requestPendingEventsThroughDate_completion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id WeakRetained;
  id v5;
  BOOL v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  double v12;
  void *v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  NSObject *v21;
  id v22;
  void *v23;
  id v24;
  uint8_t buf[4];
  id v26;
  __int16 v27;
  NSObject *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v24 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v5 = *(id *)(a1 + 32);
    if (v5)
      v6 = *((_QWORD *)WeakRetained + 7) == 0;
    else
      v6 = 1;
    if (v6)
      goto LABEL_18;
    v7 = (void *)*((_QWORD *)WeakRetained + 8);
    objc_msgSend(*((id *)WeakRetained + 6), "endDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v7) = objc_msgSend(v7, "isEqualToDate:", v8);

    if ((v7 & 1) != 0)
      goto LABEL_18;
    objc_msgSend(*((id *)WeakRetained + 6), "endDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9 || objc_msgSend(*((id *)WeakRetained + 7), "hk_isAfterDate:", v9))
    {
      v10 = v5;

      v9 = v10;
    }
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", *((_QWORD *)WeakRetained + 7), v9);
    objc_msgSend(v11, "duration");
    if (v12 == 0.0)
    {
      _HKInitializeLogging();
      v13 = (void *)*MEMORY[0x1E0CB5380];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_ERROR))
      {
LABEL_17:

LABEL_18:
        v23 = (void *)*((_QWORD *)WeakRetained + 7);
        *((_QWORD *)WeakRetained + 7) = 0;

        goto LABEL_19;
      }
      v14 = v13;
      v15 = (void *)objc_opt_class();
      v16 = *((_QWORD *)WeakRetained + 7);
      *(_DWORD *)buf = 138544130;
      v26 = v15;
      v27 = 2114;
      v28 = v16;
      v29 = 2114;
      v30 = v9;
      v31 = 2114;
      v32 = v5;
      v17 = v15;
      _os_log_error_impl(&dword_1B7802000, v14, OS_LOG_TYPE_ERROR, "[%{public}@] Dropping zero-duration segment created with start date: %{public}@, end date: %{public}@ and fallback end date: %{public}@", buf, 0x2Au);
    }
    else
    {
      v18 = objc_alloc(MEMORY[0x1E0CB7048]);
      objc_msgSend(WeakRetained, "sessionId");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v18, "initWithEventType:sessionId:dateInterval:metadata:", 9, v19, v11, 0);

      _HKInitializeLogging();
      v20 = (void *)*MEMORY[0x1E0CB5380];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_DEFAULT))
      {
        v21 = v20;
        *(_DWORD *)buf = 138543618;
        v26 = (id)objc_opt_class();
        v27 = 2114;
        v28 = v14;
        v22 = v26;
        _os_log_impl(&dword_1B7802000, v21, OS_LOG_TYPE_DEFAULT, "[%{public}@] Collection stopping: Adding workout segment event %{public}@", buf, 0x16u);

      }
      objc_msgSend(WeakRetained, "delegate");
      v17 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "receivedWorkoutEvent:", v14);
    }

    goto LABEL_17;
  }
LABEL_19:
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)_queue_querySwimDataWithCompletion:(uint64_t)a1
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  _QWORD v7[5];
  id v8;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    v5 = *(void **)(a1 + 32);
    v6 = *(_QWORD *)(a1 + 40);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __70__HDSwimmingWorkoutEventCollector__queue_querySwimDataWithCompletion___block_invoke;
    v7[3] = &unk_1E6CF28F8;
    v7[4] = a1;
    v8 = v3;
    objc_msgSend(v5, "querySwimUpdatesFromRecord:handler:", v6, v7);

  }
}

void __71__HDSwimmingWorkoutEventCollector__queue_startCollectionWithSessionId___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;

  v4 = a3;
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(NSObject **)(v5 + 72);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __71__HDSwimmingWorkoutEventCollector__queue_startCollectionWithSessionId___block_invoke_2;
  v8[3] = &unk_1E6CE8080;
  v9 = v4;
  v10 = v5;
  v7 = v4;
  dispatch_async(v6, v8);

}

void __71__HDSwimmingWorkoutEventCollector__queue_startCollectionWithSessionId___block_invoke_2(uint64_t a1)
{
  void *v1;
  void *v2;

  v2 = *(void **)(a1 + 32);
  v1 = *(void **)(a1 + 40);
  if (v2)
    -[HDSwimmingWorkoutEventCollector _queue_errorOccurred:](v1, v2);
  else
    -[HDSwimmingWorkoutEventCollector _queue_querySwimDataWithCompletion:]((uint64_t)v1, 0);
}

- (void)_queue_errorOccurred:(void *)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  id v10;
  int v11;
  id v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1)
  {
    _HKInitializeLogging();
    v4 = (void *)*MEMORY[0x1E0CB5380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_ERROR))
    {
      v9 = v4;
      v11 = 138543618;
      v12 = (id)objc_opt_class();
      v13 = 2114;
      v14 = v3;
      v10 = v12;
      _os_log_error_impl(&dword_1B7802000, v9, OS_LOG_TYPE_ERROR, "[%{public}@] Error getting swim data for lap events: %{public}@", (uint8_t *)&v11, 0x16u);

    }
    v5 = objc_alloc(MEMORY[0x1E0CB7048]);
    objc_msgSend(a1, "sessionId");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v5, "initWithSessionId:error:", v6, v3);

    objc_msgSend(a1, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "receivedWorkoutEvent:", v7);

  }
}

void __70__HDSwimmingWorkoutEventCollector__queue_querySwimDataWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  id v15;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(a1 + 40);
  v9 = *(NSObject **)(v7 + 72);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __70__HDSwimmingWorkoutEventCollector__queue_querySwimDataWithCompletion___block_invoke_2;
  v12[3] = &unk_1E6CE7E08;
  v12[4] = v7;
  v13 = v5;
  v14 = v6;
  v15 = v8;
  v10 = v6;
  v11 = v5;
  dispatch_async(v9, v12);

}

uint64_t __70__HDSwimmingWorkoutEventCollector__queue_querySwimDataWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  id v4;
  id v5;
  void *v6;
  int *v7;
  uint64_t v8;
  os_log_t *v9;
  uint64_t v10;
  void *v11;
  os_log_t v12;
  uint64_t v13;
  void *v14;
  uint64_t i;
  void *v16;
  os_log_t v17;
  NSObject *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  char v23;
  unint64_t v24;
  unint64_t v25;
  id v26;
  void *v27;
  unint64_t v28;
  uint64_t v29;
  os_log_t v30;
  NSObject *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  int v43;
  void *v44;
  _BOOL4 v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  void *v50;
  void *v51;
  void *v52;
  id v53;
  void *v54;
  void *v55;
  void *v56;
  NSObject *v57;
  void *v58;
  id v59;
  uint64_t v60;
  void *v61;
  void *v62;
  unint64_t v63;
  id v64;
  void *v65;
  int v66;
  void *v67;
  NSObject *v68;
  void *v69;
  void *v70;
  void *v71;
  id v72;
  void *v73;
  id v74;
  uint64_t v75;
  void *v76;
  double v77;
  os_log_t v78;
  NSObject *v79;
  void *v80;
  void *v81;
  void *v82;
  id v83;
  void *v84;
  void *v85;
  void *v86;
  id v87;
  void *v88;
  void *v89;
  uint64_t v90;
  void *v91;
  os_log_t v92;
  NSObject *v93;
  void *v94;
  id v95;
  void *v96;
  uint64_t result;
  NSObject *v98;
  void *v99;
  uint64_t v100;
  id v101;
  id v102;
  uint64_t v103;
  NSObject *log;
  id v105;
  uint64_t v106;
  uint64_t v107;
  unint64_t v108;
  id obj;
  void *v110;
  uint64_t v111;
  uint64_t v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  uint8_t v117[4];
  void *v118;
  __int16 v119;
  uint64_t v120;
  _QWORD v121[2];
  _QWORD v122[2];
  uint8_t buf[4];
  void *v124;
  __int16 v125;
  id v126;
  __int16 v127;
  void *v128;
  __int16 v129;
  void *v130;
  uint64_t v131;

  v1 = a1;
  v131 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(a1 + 48);
  v4 = *(id *)(a1 + 40);
  v5 = v3;
  v6 = v5;
  if (!v2)
    goto LABEL_58;
  if (v5)
  {
    -[HDSwimmingWorkoutEventCollector _queue_errorOccurred:]((void *)v2, v5);
    goto LABEL_58;
  }
  v7 = &OBJC_IVAR___HDDemoDataSleepSampleGenerator__nextSleepDurationSampleTime;
  v8 = objc_msgSend(*(id *)(v2 + 40), "recordId");
  v9 = (os_log_t *)MEMORY[0x1E0CB5380];
  if (!v8)
  {
    objc_msgSend(v4, "firstObject");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = *(void **)(v2 + 40);
    *(_QWORD *)(v2 + 40) = v10;

    _HKInitializeLogging();
    v12 = *v9;
    if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEBUG))
    {
      v98 = v12;
      v99 = (void *)objc_opt_class();
      v100 = *(_QWORD *)(v2 + 40);
      *(_DWORD *)v117 = 138543618;
      v118 = v99;
      v119 = 2112;
      v120 = v100;
      v101 = v99;
      _os_log_debug_impl(&dword_1B7802000, v98, OS_LOG_TYPE_DEBUG, "[%{public}@] Setting initial reference swim data to %@", v117, 0x16u);

    }
  }
  v103 = v1;
  if (!*(_QWORD *)(v2 + 56))
  {
    objc_msgSend(*(id *)(v2 + 40), "startDate");
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = *(void **)(v2 + 56);
    *(_QWORD *)(v2 + 56) = v13;

  }
  v115 = 0u;
  v116 = 0u;
  v113 = 0u;
  v114 = 0u;
  v102 = v4;
  obj = v4;
  v112 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v113, v117, 16);
  if (v112)
  {
    v111 = *(_QWORD *)v114;
    v107 = *MEMORY[0x1E0CB55C8];
    v106 = *MEMORY[0x1E0CB55A8];
    do
    {
      for (i = 0; i != v112; ++i)
      {
        if (*(_QWORD *)v114 != v111)
          objc_enumerationMutation(obj);
        v16 = *(void **)(*((_QWORD *)&v113 + 1) + 8 * i);
        _HKInitializeLogging();
        v17 = *v9;
        if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT))
        {
          v18 = v17;
          v19 = (void *)objc_opt_class();
          *(_DWORD *)buf = 138543618;
          v124 = v19;
          v125 = 2112;
          v126 = v16;
          v20 = v19;
          _os_log_impl(&dword_1B7802000, v18, OS_LOG_TYPE_DEFAULT, "[%{public}@] Processing swim data: %@", buf, 0x16u);

        }
        objc_msgSend(v16, "sessionId");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)v2, "sessionId");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v21, "isEqual:", v22);

        if ((v23 & 1) != 0)
        {
          v24 = objc_msgSend(v16, "lapCount");
          v25 = objc_msgSend(*(id *)(v2 + v7[193]), "lapCount");
          if (v24 > v25)
          {
            v26 = v16;
            v27 = (void *)MEMORY[0x1E0CB37E8];
            v28 = objc_msgSend(v26, "strokeType");
            v108 = v24;
            if (v28 >= 7)
            {
              objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "HKSwimmingStrokeStyle _HKSwimmingStrokeStyleFromCMSwimStrokeType(CMSwimStrokeType)");
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v36, "handleFailureInFunction:file:lineNumber:description:", v37, CFSTR("HDSwimmingWorkoutEventCollector.m"), 347, CFSTR("Invalid swimming stroke style"));

              v29 = 0;
            }
            else
            {
              v29 = qword_1B7F3EA70[v28];
            }
            objc_msgSend(v27, "numberWithInteger:", v29);
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v26, "isSWOLFValid"))
            {
              v39 = (void *)MEMORY[0x1E0CB37E8];
              objc_msgSend(v26, "SWOLF");
              objc_msgSend(v39, "numberWithDouble:");
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              v121[0] = v107;
              v121[1] = v106;
              v122[0] = v38;
              v122[1] = v40;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v122, v121, 2);
              v110 = (void *)objc_claimAutoreleasedReturnValue();

            }
            else
            {
              v121[0] = v107;
              v122[0] = v38;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v122, v121, 1);
              v110 = (void *)objc_claimAutoreleasedReturnValue();
            }
            objc_msgSend(v26, "endDate");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "startDate");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            v43 = objc_msgSend(v41, "hk_isBeforeDate:", v42);

            if (v43)
            {
              _HKInitializeLogging();
              v44 = (void *)*MEMORY[0x1E0CB52A8];
              v45 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52A8], OS_LOG_TYPE_FAULT);
              v9 = (os_log_t *)MEMORY[0x1E0CB5380];
              if (v45)
              {
                log = v44;
                v46 = (void *)objc_opt_class();
                v105 = v46;
                objc_msgSend(v26, "startDate");
                v47 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v26, "endDate");
                v48 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543874;
                v124 = v46;
                v125 = 2114;
                v126 = v47;
                v127 = 2114;
                v128 = v48;
                _os_log_fault_impl(&dword_1B7802000, log, OS_LOG_TYPE_FAULT, "[%{public}@] Out-of-order CMSwimData lap events: %{public}@, %{public}@", buf, 0x20u);

                v9 = (os_log_t *)MEMORY[0x1E0CB5380];
              }
            }
            else
            {
              v49 = objc_alloc(MEMORY[0x1E0CB3588]);
              objc_msgSend(v26, "startDate");
              v50 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v26, "endDate");
              v51 = (void *)objc_claimAutoreleasedReturnValue();
              v52 = (void *)objc_msgSend(v49, "initWithStartDate:endDate:", v50, v51);

              v53 = objc_alloc(MEMORY[0x1E0CB7048]);
              objc_msgSend((id)v2, "sessionId");
              v54 = (void *)objc_claimAutoreleasedReturnValue();
              v55 = (void *)objc_msgSend(v53, "initWithEventType:sessionId:dateInterval:metadata:", 5, v54, v52, v110);

              _HKInitializeLogging();
              v56 = (void *)*MEMORY[0x1E0CB5380];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_DEFAULT))
              {
                v57 = v56;
                v58 = (void *)objc_opt_class();
                *(_DWORD *)buf = 138543618;
                v124 = v58;
                v125 = 2112;
                v126 = v55;
                v59 = v58;
                _os_log_impl(&dword_1B7802000, v57, OS_LOG_TYPE_DEFAULT, "[%{public}@] Adding workout lap event: %@", buf, 0x16u);

              }
              v7 = &OBJC_IVAR___HDDemoDataSleepSampleGenerator__nextSleepDurationSampleTime;
              if (*(_BYTE *)(v2 + 80))
              {
                objc_msgSend(v26, "startDate");
                v60 = objc_claimAutoreleasedReturnValue();
                v61 = *(void **)(v2 + 56);
                *(_QWORD *)(v2 + 56) = v60;

                *(_BYTE *)(v2 + 80) = 0;
              }
              objc_msgSend((id)v2, "delegate");
              v62 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v62, "receivedWorkoutEvent:", v55);

              v9 = (os_log_t *)MEMORY[0x1E0CB5380];
            }

            v24 = v108;
          }
          v63 = objc_msgSend(v16, "segment");
          if (v63 <= objc_msgSend(*(id *)(v2 + v7[193]), "segment"))
          {
            if (v24 > v25)
              goto LABEL_53;
            goto LABEL_54;
          }
          v64 = v16;
          objc_msgSend(*(id *)(v2 + 48), "endDate");
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          v66 = objc_msgSend(v65, "hk_isBeforeDate:", *(_QWORD *)(v2 + 56));

          if (v66)
          {
            _HKInitializeLogging();
            v67 = (void *)*MEMORY[0x1E0CB52A8];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52A8], OS_LOG_TYPE_FAULT))
            {
              v68 = v67;
              v69 = (void *)objc_opt_class();
              v70 = *(void **)(v2 + 56);
              v71 = *(void **)(v2 + 48);
              v72 = v69;
              objc_msgSend(v71, "endDate");
              v73 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543874;
              v124 = v69;
              v125 = 2114;
              v126 = v70;
              v9 = (os_log_t *)MEMORY[0x1E0CB5380];
              v127 = 2114;
              v128 = v73;
              _os_log_fault_impl(&dword_1B7802000, v68, OS_LOG_TYPE_FAULT, "[%{public}@] Out-of-order CMSwimData segment events: %{public}@, %{public}@", buf, 0x20u);

              goto LABEL_51;
            }
LABEL_52:

LABEL_53:
            objc_storeStrong((id *)(v2 + v7[193]), v16);
LABEL_54:
            objc_storeStrong((id *)(v2 + 48), v16);
            continue;
          }
          v74 = objc_alloc(MEMORY[0x1E0CB3588]);
          v75 = *(_QWORD *)(v2 + 56);
          objc_msgSend(*(id *)(v2 + 48), "endDate");
          v76 = (void *)objc_claimAutoreleasedReturnValue();
          v68 = objc_msgSend(v74, "initWithStartDate:endDate:", v75, v76);

          -[NSObject duration](v68, "duration");
          if (v77 == 0.0)
          {
            _HKInitializeLogging();
            v78 = *v9;
            if (os_log_type_enabled(*v9, OS_LOG_TYPE_ERROR))
            {
              v79 = v78;
              v80 = (void *)objc_opt_class();
              v81 = *(void **)(v2 + 56);
              v82 = *(void **)(v2 + 48);
              v83 = v80;
              objc_msgSend(v82, "endDate");
              v84 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138544130;
              v124 = v80;
              v125 = 2114;
              v126 = v64;
              v127 = 2114;
              v128 = v81;
              v7 = &OBJC_IVAR___HDDemoDataSleepSampleGenerator__nextSleepDurationSampleTime;
              v129 = 2114;
              v130 = v84;
              _os_log_error_impl(&dword_1B7802000, v79, OS_LOG_TYPE_ERROR, "[%{public}@] Dropping zero-duration segment created from data: %{public}@ with start date: %{public}@ and end date: %{public}@", buf, 0x2Au);

              v9 = (os_log_t *)MEMORY[0x1E0CB5380];
              goto LABEL_50;
            }
          }
          else
          {
            if (objc_msgSend(v64, "isSegmentSWOLFValid"))
            {
              v85 = (void *)MEMORY[0x1E0CB37E8];
              objc_msgSend(v64, "segmentSWOLF");
              objc_msgSend(v85, "numberWithDouble:");
              v86 = (void *)objc_claimAutoreleasedReturnValue();
              v121[0] = v106;
              v122[0] = v86;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v122, v121, 1);
              v79 = objc_claimAutoreleasedReturnValue();

            }
            else
            {
              v79 = 0;
            }
            v87 = objc_alloc(MEMORY[0x1E0CB7048]);
            objc_msgSend((id)v2, "sessionId");
            v88 = (void *)objc_claimAutoreleasedReturnValue();
            v89 = (void *)objc_msgSend(v87, "initWithEventType:sessionId:dateInterval:metadata:", 9, v88, v68, v79);

            *(_BYTE *)(v2 + 80) = 1;
            objc_msgSend(v64, "endDate");
            v90 = objc_claimAutoreleasedReturnValue();
            v91 = *(void **)(v2 + 64);
            *(_QWORD *)(v2 + 64) = v90;

            _HKInitializeLogging();
            v92 = *v9;
            if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT))
            {
              v93 = v92;
              v94 = (void *)objc_opt_class();
              *(_DWORD *)buf = 138543618;
              v124 = v94;
              v125 = 2114;
              v126 = v89;
              v95 = v94;
              _os_log_impl(&dword_1B7802000, v93, OS_LOG_TYPE_DEFAULT, "[%{public}@] Adding workout segment event: %{public}@", buf, 0x16u);

              v9 = (os_log_t *)MEMORY[0x1E0CB5380];
            }
            objc_msgSend((id)v2, "delegate");
            v96 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v96, "receivedWorkoutEvent:", v89);

LABEL_50:
          }
LABEL_51:

          goto LABEL_52;
        }
        _HKInitializeLogging();
        v30 = *v9;
        if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT))
        {
          v31 = v30;
          v32 = (void *)objc_opt_class();
          v33 = v32;
          objc_msgSend(v16, "sessionId");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend((id)v2, "sessionId");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v124 = v32;
          v125 = 2112;
          v126 = v34;
          v127 = 2112;
          v128 = v35;
          _os_log_impl(&dword_1B7802000, v31, OS_LOG_TYPE_DEFAULT, "[%{public}@] Ignoring swim data with mismatched session id. Swim data session id: %@ [self sessionID]: %@", buf, 0x20u);

        }
      }
      v112 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v113, v117, 16);
    }
    while (v112);
  }

  v4 = v102;
  v1 = v103;
  v6 = 0;
LABEL_58:

  result = *(_QWORD *)(v1 + 56);
  if (result)
    return (*(uint64_t (**)(uint64_t, BOOL))(result + 16))(result, *(_QWORD *)(v1 + 48) == 0);
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workoutEventQueue, 0);
  objc_storeStrong((id *)&self->_prevSegmentEndDate, 0);
  objc_storeStrong((id *)&self->_currentSegmentStartDate, 0);
  objc_storeStrong((id *)&self->_lastSwimData, 0);
  objc_storeStrong((id *)&self->_referenceSwimData, 0);
  objc_storeStrong((id *)&self->_swimTracker, 0);
}

@end
