@implementation HDActiveDataAggregator

- (HDActiveDataAggregator)initWithDataCollectionManager:(id)a3
{
  id v4;
  HDActiveDataAggregator *v5;
  NSLock *v6;
  NSLock *aggregationLock;
  NSMutableDictionary *v8;
  NSMutableDictionary *currentAggregationStates;
  id v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  uint64_t v15;
  _HKDelayedOperation *delayedAggregationOperation;
  _QWORD v18[4];
  id v19;
  id location;
  objc_super v21;

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)HDActiveDataAggregator;
  v5 = -[HDDataAggregator initWithDataCollectionManager:](&v21, sel_initWithDataCollectionManager_, v4);
  if (v5)
  {
    v6 = (NSLock *)objc_alloc_init(MEMORY[0x1E0CB3740]);
    aggregationLock = v5->_aggregationLock;
    v5->_aggregationLock = v6;

    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    currentAggregationStates = v5->_currentAggregationStates;
    v5->_currentAggregationStates = v8;

    objc_initWeak(&location, v5);
    v10 = objc_alloc(MEMORY[0x1E0CB6F80]);
    -[HDDataAggregator dataCollectionManager](v5, "dataCollectionManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "sharedDelayedAggregationQueue");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDActiveDataAggregator aggregationInterval](v5, "aggregationInterval");
    v14 = v13;
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __56__HDActiveDataAggregator_initWithDataCollectionManager___block_invoke;
    v18[3] = &unk_1E6CECE78;
    objc_copyWeak(&v19, &location);
    v15 = objc_msgSend(v10, "initWithMode:queue:delay:block:", 1, v12, v18, v14);
    delayedAggregationOperation = v5->_delayedAggregationOperation;
    v5->_delayedAggregationOperation = (_HKDelayedOperation *)v15;

    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }

  return v5;
}

void __56__HDActiveDataAggregator_initWithDataCollectionManager___block_invoke(uint64_t a1)
{
  CFAbsoluteTime Current;
  NSObject *v2;
  void *v3;
  id WeakRetained;
  _QWORD v5[5];
  __int128 buf;
  void (*v7)(uint64_t, int, void *);
  void *v8;
  id v9;
  CFAbsoluteTime v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    Current = CFAbsoluteTimeGetCurrent();
    _HKInitializeLogging();
    v2 = *MEMORY[0x1E0CB52A8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52A8], OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138543362;
      *(_QWORD *)((char *)&buf + 4) = WeakRetained;
      _os_log_impl(&dword_1B7802000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@: Reconsidering aggregation for old data.", (uint8_t *)&buf, 0xCu);
    }
    objc_msgSend(WeakRetained, "dataCollectionManager", WeakRetained);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __55__HDActiveDataAggregator__reconsiderDelayedAggregation__block_invoke;
    v5[3] = &unk_1E6CF56E0;
    v5[4] = WeakRetained;
    *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
    *((_QWORD *)&buf + 1) = 3221225472;
    v7 = __55__HDActiveDataAggregator__reconsiderDelayedAggregation__block_invoke_3;
    v8 = &unk_1E6CF5708;
    v9 = WeakRetained;
    v10 = Current;
    objc_msgSend(v3, "performSaveWithMaximumLatency:block:completion:", v5, &buf, 60.0);

  }
}

- (void)_aggregateForCollector:(void *)a3 device:(void *)a4 requestedAggregationDate:(uint64_t)a5 mode:(uint64_t)a6 options:
{
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  NSObject **v19;
  os_signpost_id_t v20;
  NSObject *v21;
  NSObject *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  BOOL v28;
  id v29;
  os_log_t *v30;
  void *v31;
  NSObject *v32;
  NSObject *v33;
  NSObject *v34;
  id v35;
  void *v36;
  id v37;
  id v38;
  _QWORD v39[4];
  id v40;
  _QWORD v41[4];
  id v42;
  id v43;
  _QWORD aBlock[5];
  id v45;
  id v46;
  id v47;
  uint64_t v48;
  uint64_t v49;
  uint8_t buf[4];
  id v51;
  __int16 v52;
  id v53;
  __int16 v54;
  id v55;
  __int16 v56;
  uint64_t v57;
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v11 = a2;
  v12 = a3;
  v13 = a4;
  if (a1)
  {
    v14 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __94__HDActiveDataAggregator__aggregateForCollector_device_requestedAggregationDate_mode_options___block_invoke;
    aBlock[3] = &unk_1E6CF4878;
    aBlock[4] = a1;
    v38 = v11;
    v15 = v11;
    v45 = v15;
    v16 = v12;
    v46 = v16;
    v35 = v13;
    v17 = v13;
    v47 = v17;
    v48 = a5;
    v49 = a6;
    v18 = _Block_copy(aBlock);
    v19 = (NSObject **)MEMORY[0x1E0CB52A8];
    v20 = _HKLogSignpostIDGenerate();
    _HKInitializeLogging();
    v21 = *v19;
    if (os_signpost_enabled(v21))
    {
      v22 = v21;
      v23 = v22;
      if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
      {
        *(_DWORD *)buf = 138544130;
        v51 = v15;
        v52 = 2114;
        v53 = v16;
        v54 = 2114;
        v55 = v17;
        v56 = 2048;
        v57 = a5;
        _os_signpost_emit_with_name_impl(&dword_1B7802000, v23, OS_SIGNPOST_INTERVAL_BEGIN, v20, "active-aggregation-for-collector", "collector=%{public}@, device=%{public}@, aggregationDate=%{public}@, mode=%ld", buf, 0x2Au);
      }

    }
    v37 = v12;
    objc_msgSend(a1, "dataCollectionManager", v35);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "profile");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "database");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = 0;
    v41[0] = v14;
    v41[1] = 3221225472;
    v41[2] = __94__HDActiveDataAggregator__aggregateForCollector_device_requestedAggregationDate_mode_options___block_invoke_191;
    v41[3] = &unk_1E6CF1650;
    v42 = v18;
    v39[0] = v14;
    v39[1] = 3221225472;
    v39[2] = __94__HDActiveDataAggregator__aggregateForCollector_device_requestedAggregationDate_mode_options___block_invoke_2_193;
    v39[3] = &unk_1E6CEEAB8;
    v27 = v42;
    v40 = v27;
    v28 = +[HDHealthEntity performWriteTransactionWithHealthDatabase:error:block:inaccessibilityHandler:](HDDataEntity, "performWriteTransactionWithHealthDatabase:error:block:inaccessibilityHandler:", v26, &v43, v41, v39);
    v29 = v43;

    _HKInitializeLogging();
    v30 = (os_log_t *)MEMORY[0x1E0CB52A8];
    v31 = (void *)*MEMORY[0x1E0CB52A8];
    if (os_signpost_enabled((os_log_t)*MEMORY[0x1E0CB52A8]))
    {
      v32 = v31;
      v33 = v32;
      if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v32))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1B7802000, v33, OS_SIGNPOST_INTERVAL_END, v20, "active-aggregation-for-collector", ", buf, 2u);
      }

    }
    if (!v28 && (HKIsUnitTesting() & 1) == 0)
    {
      _HKInitializeLogging();
      v34 = *v30;
      if (os_log_type_enabled(*v30, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        v51 = a1;
        v52 = 2114;
        v53 = v29;
        _os_log_error_impl(&dword_1B7802000, v34, OS_LOG_TYPE_ERROR, "%{public}@: Failed to perform outer write transaction for aggregation and persistence: %{public}@", buf, 0x16u);
      }
    }

    v12 = v37;
    v11 = v38;
    v13 = v36;
  }

}

void __94__HDActiveDataAggregator__aggregateForCollector_device_requestedAggregationDate_mode_options___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  __int128 v11;

  v2 = *(void **)(a1 + 40);
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 64);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[2] = __94__HDActiveDataAggregator__aggregateForCollector_device_requestedAggregationDate_mode_options___block_invoke_2;
  v6[3] = &unk_1E6CF4878;
  v6[1] = 3221225472;
  v7 = v2;
  v4 = *(id *)(a1 + 48);
  v5 = *(_QWORD *)(a1 + 32);
  v8 = v4;
  v9 = v5;
  v10 = *(id *)(a1 + 56);
  v11 = *(_OWORD *)(a1 + 64);
  objc_msgSend(v3, "hk_withLock:", v6);

}

void __94__HDActiveDataAggregator__aggregateForCollector_device_requestedAggregationDate_mode_options___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  char *v11;
  char *v12;
  BOOL v13;
  os_log_t *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  id v23;
  NSObject *v24;
  NSObject *v25;
  NSObject *v26;
  uint64_t v27;
  void *v28;
  char *v29;
  uint64_t v30;
  NSObject *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  double Current;
  double v37;
  double v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  double v45;
  double v46;
  double v47;
  double v48;
  void *v49;
  void *v50;
  void *v51;
  double v52;
  double v53;
  void *v54;
  double v55;
  double v56;
  os_log_t v57;
  uint64_t v58;
  NSObject *v59;
  void *v60;
  uint64_t v61;
  void *v62;
  const char *v63;
  void *v64;
  NSObject *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  void *v70;
  _QWORD block[6];
  id v72;
  id v73;
  uint8_t buf[4];
  uint64_t v75;
  __int16 v76;
  uint64_t v77;
  __int16 v78;
  const char *v79;
  __int16 v80;
  double v81;
  uint64_t v82;

  v82 = *MEMORY[0x1E0C80C00];
  +[_HDAggregationStateKey keyForCollector:device:aggregator:]((uint64_t)_HDAggregationStateKey, *(void **)(a1 + 32), *(void **)(a1 + 40), *(void **)(a1 + 48));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 72), "objectForKeyedSubscript:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v6 = *(void **)(a1 + 48);
  v7 = *(_QWORD *)(a1 + 56);
  v8 = *(_QWORD *)(a1 + 64);
  v9 = *(_QWORD *)(a1 + 72);
  v73 = 0;
  objc_msgSend(v6, "aggregateForState:collector:device:requestedAggregationDate:mode:options:error:", v3, v4, v5, v7, v8, v9, &v73);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (char *)v73;
  v12 = v11;
  if (v10)
    v13 = 1;
  else
    v13 = v11 == 0;
  v14 = (os_log_t *)MEMORY[0x1E0CB52A8];
  if (!v13)
  {
    _HKInitializeLogging();
    v15 = *v14;
    if (os_log_type_enabled(*v14, OS_LOG_TYPE_FAULT))
    {
      v66 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)buf = 138543874;
      v75 = v66;
      v76 = 2112;
      v77 = (uint64_t)v3;
      v78 = 2114;
      v79 = v12;
      _os_log_fault_impl(&dword_1B7802000, v15, OS_LOG_TYPE_FAULT, "%{public}@: (rdar://63497174) Failed to aggregate with state %@: %{public}@", buf, 0x20u);
    }
  }
  objc_msgSend(v10, "persistenceHandler");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    objc_msgSend(*(id *)(a1 + 32), "sourceForDataAggregator:", *(_QWORD *)(a1 + 48));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      v70 = v2;
      v18 = *(void **)(a1 + 48);
      v19 = *(_QWORD *)(a1 + 32);
      objc_msgSend(v10, "consumedSensorData");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = *(_QWORD *)(a1 + 40);
      v72 = 0;
      objc_msgSend(v10, "persistenceHandler");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v21) = objc_msgSend(v18, "persistForCollector:usedDatums:source:device:error:persistenceHandler:", v19, v20, v17, v21, &v72, v22);
      v23 = v72;

      v14 = (os_log_t *)MEMORY[0x1E0CB52A8];
      _HKInitializeLogging();
      v24 = *v14;
      v25 = *v14;
      if ((_DWORD)v21)
      {
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          v68 = *(_QWORD *)(a1 + 48);
          v26 = v24;
          objc_msgSend(v10, "consumedSensorData");
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = objc_msgSend(v69, "count");
          objc_msgSend(v10, "consumedSensorData");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "lastObject");
          v29 = (char *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v75 = v68;
          v76 = 2048;
          v77 = v27;
          v78 = 2112;
          v79 = v29;
          _os_log_impl(&dword_1B7802000, v26, OS_LOG_TYPE_DEFAULT, "%{public}@: Persisted, consuming %ld datums with last datum: %@.", buf, 0x20u);

          v14 = (os_log_t *)MEMORY[0x1E0CB52A8];
        }
        objc_msgSend(v10, "aggregationState");
        v30 = objc_claimAutoreleasedReturnValue();

        v2 = v70;
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 72), "setObject:forKeyedSubscript:", v30, v70);
        v3 = (void *)v30;
      }
      else
      {
        if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
        {
          v67 = *(_QWORD *)(a1 + 48);
          *(_DWORD *)buf = 138543618;
          v75 = v67;
          v76 = 2114;
          v77 = (uint64_t)v12;
          _os_log_fault_impl(&dword_1B7802000, v24, OS_LOG_TYPE_FAULT, "%{public}@: (rdar://63497174) Failed to persist aggregated objects: %{public}@", buf, 0x16u);
        }
        v2 = v70;
      }

    }
    else
    {
      _HKInitializeLogging();
      v31 = *v14;
      if (os_log_type_enabled(*v14, OS_LOG_TYPE_FAULT))
      {
        v32 = *(_QWORD *)(a1 + 32);
        v33 = *(_QWORD *)(a1 + 48);
        *(_DWORD *)buf = 138543618;
        v75 = v32;
        v76 = 2114;
        v77 = v33;
        _os_log_fault_impl(&dword_1B7802000, v31, OS_LOG_TYPE_FAULT, "Collector %{public}@ failed to return source for aggregator %{public}@", buf, 0x16u);
      }
    }

  }
  objc_msgSend(v3, "unaggregatedSensorData");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v34, "count"))
  {

  }
  else
  {
    objc_msgSend(v3, "openSeries");
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v35)
      goto LABEL_34;
  }
  Current = CFAbsoluteTimeGetCurrent();
  objc_msgSend(*(id *)(a1 + 48), "aggregationInterval");
  v38 = v37;
  objc_msgSend(v3, "unaggregatedSensorData");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = objc_msgSend(v39, "count");

  if (v40)
  {
    objc_msgSend(v3, "unaggregatedSensorData");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "firstObject");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "dateInterval");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "endDate");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "timeIntervalSinceReferenceDate");
    v46 = v45;
    objc_msgSend(*(id *)(a1 + 48), "aggregationInterval");
    v48 = v46 + v47 - Current;

    if (v48 < v38)
      v38 = v48;
  }
  objc_msgSend(v3, "openSeries");
  v49 = (void *)objc_claimAutoreleasedReturnValue();

  if (v49)
  {
    objc_msgSend(v3, "openSeries");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "startDate");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "timeIntervalSinceReferenceDate");
    v53 = v52;
    objc_msgSend(*(id *)(a1 + 48), "configuration");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "maximumSeriesDuration");
    v56 = v53 + v55 - Current;

    if (v56 < v38)
      v38 = v56;
  }
  _HKInitializeLogging();
  v57 = *v14;
  if (os_log_type_enabled(*v14, OS_LOG_TYPE_INFO))
  {
    v58 = *(_QWORD *)(a1 + 48);
    v59 = v57;
    objc_msgSend(v3, "unaggregatedSensorData");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = objc_msgSend(v60, "count");
    objc_msgSend(v3, "openSeries");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v63 = "has";
    *(_DWORD *)buf = 138544130;
    v75 = v58;
    v76 = 2048;
    if (!v62)
      v63 = "no";
    v77 = v61;
    v78 = 2080;
    v79 = v63;
    v80 = 2048;
    v81 = v38;
    _os_log_impl(&dword_1B7802000, v59, OS_LOG_TYPE_INFO, "%{public}@: Incomplete aggregation (%ld remaining datums, %s open series); accumulating and will reconsider in %0.2lfs",
      buf,
      0x2Au);

  }
  objc_msgSend(*(id *)(a1 + 48), "dataCollectionManager");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "sharedDelayedAggregationQueue");
  v65 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __94__HDActiveDataAggregator__aggregateForCollector_device_requestedAggregationDate_mode_options___block_invoke_189;
  block[3] = &unk_1E6CE8058;
  block[4] = *(_QWORD *)(a1 + 48);
  *(double *)&block[5] = v38;
  dispatch_async(v65, block);

LABEL_34:
}

uint64_t __94__HDActiveDataAggregator__aggregateForCollector_device_requestedAggregationDate_mode_options___block_invoke_189(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "executeWithDelay:", *(double *)(a1 + 40));
}

uint64_t __94__HDActiveDataAggregator__aggregateForCollector_device_requestedAggregationDate_mode_options___block_invoke_191(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return 1;
}

uint64_t __94__HDActiveDataAggregator__aggregateForCollector_device_requestedAggregationDate_mode_options___block_invoke_2_193(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return 1;
}

uint64_t __55__HDActiveDataAggregator__reconsiderDelayedAggregation__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  double v4;
  void *v5;

  v1 = *(void **)(a1 + 32);
  v2 = (void *)MEMORY[0x1E0C99D68];
  objc_msgSend(v1, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "collectionLatency");
  objc_msgSend(v2, "dateWithTimeIntervalSinceNow:", -v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDActiveDataAggregator _requestAggregationThroughDate:mode:options:completion:](v1, v5, 0, 0, &__block_literal_global_81);

  return 1;
}

- (void)_requestAggregationThroughDate:(uint64_t)a3 mode:(uint64_t)a4 options:(void *)a5 completion:
{
  id v9;
  void (**v10)(id, uint64_t, _QWORD);
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v9 = a2;
  v10 = a5;
  if (a1)
  {
    objc_msgSend(a1, "allCollectors");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v18;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v18 != v14)
            objc_enumerationMutation(v11);
          objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v15), "collector");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          -[HDActiveDataAggregator _aggregateForAllDevicesForCollector:date:mode:options:]((id *)a1, v16, v9, a3, a4);

          ++v15;
        }
        while (v13 != v15);
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v13);
    }
    v10[2](v10, 1, 0);

  }
}

void __55__HDActiveDataAggregator__reconsiderDelayedAggregation__block_invoke_3(uint64_t a1, int a2, void *a3)
{
  id v5;
  void *v6;
  _BOOL4 v7;
  uint64_t v8;
  NSObject *v9;
  CFAbsoluteTime v10;
  const char *v11;
  NSObject *v12;
  uint32_t v13;
  uint64_t v14;
  CFAbsoluteTime v15;
  int v16;
  uint64_t v17;
  __int16 v18;
  CFAbsoluteTime v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  _HKInitializeLogging();
  v6 = (void *)*MEMORY[0x1E0CB52A8];
  v7 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52A8], OS_LOG_TYPE_DEFAULT);
  if (a2)
  {
    if (v7)
    {
      v8 = *(_QWORD *)(a1 + 32);
      v9 = v6;
      v10 = CFAbsoluteTimeGetCurrent() - *(double *)(a1 + 40);
      v16 = 138543618;
      v17 = v8;
      v18 = 2048;
      v19 = v10;
      v11 = "%{public}@: Finished reconsidering with latency %0.2lfs.";
      v12 = v9;
      v13 = 22;
LABEL_6:
      _os_log_impl(&dword_1B7802000, v12, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v16, v13);

    }
  }
  else if (v7)
  {
    v14 = *(_QWORD *)(a1 + 32);
    v9 = v6;
    v15 = CFAbsoluteTimeGetCurrent() - *(double *)(a1 + 40);
    v16 = 138543874;
    v17 = v14;
    v18 = 2048;
    v19 = v15;
    v20 = 2114;
    v21 = v5;
    v11 = "%{public}@: Failed aggregation reconsideration after %0.2lfs: %{public}@";
    v12 = v9;
    v13 = 32;
    goto LABEL_6;
  }

}

- (void)registerDataCollector:(id)a3 state:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  objc_super v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v18 = a4;
  v19 = v6;
  objc_msgSend(v6, "identifierForDataAggregator:", self);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  -[HDDataAggregator allCollectors](self, "allCollectors");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v22 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        objc_msgSend(v13, "collector");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "identifierForDataAggregator:", self);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v15, "isEqualToString:", v7))
        {
          objc_msgSend(v13, "collector");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          -[HDActiveDataAggregator _aggregateForAllDevicesForCollector:date:mode:options:]((id *)&self->super.super.isa, v16, v17, 0, 3);

        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v10);
  }

  v20.receiver = self;
  v20.super_class = (Class)HDActiveDataAggregator;
  -[HDDataAggregator registerDataCollector:state:](&v20, sel_registerDataCollector_state_, v19, v18);

}

- (void)_aggregateForAllDevicesForCollector:(void *)a3 date:(uint64_t)a4 mode:(uint64_t)a5 options:
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v9 = a2;
  v10 = a3;
  if (a1)
  {
    objc_msgSend(a1[8], "lock");
    objc_msgSend(a1[9], "allKeys");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "hk_map:", &__block_literal_global_214_1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1[8], "unlock");
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v13 = v12;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v19;
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v19 != v16)
            objc_enumerationMutation(v13);
          -[HDActiveDataAggregator _aggregateForCollector:device:requestedAggregationDate:mode:options:](a1, v9, *(void **)(*((_QWORD *)&v18 + 1) + 8 * v17++), v10, a4, a5);
        }
        while (v15 != v17);
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v15);
    }

  }
}

- (void)unregisterDataCollector:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  objc_super v7;

  v4 = (void *)MEMORY[0x1E0C99D68];
  v5 = a3;
  objc_msgSend(v4, "distantFuture");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDActiveDataAggregator _aggregateForAllDevicesForCollector:date:mode:options:]((id *)&self->super.super.isa, v5, v6, 0, 3);

  v7.receiver = self;
  v7.super_class = (Class)HDActiveDataAggregator;
  -[HDDataAggregator unregisterDataCollector:](&v7, sel_unregisterDataCollector_, v5);

}

- (void)dataCollector:(id)a3 didCollectSensorData:(id)a4 device:(id)a5 options:(unint64_t)a6
{
  id v10;
  id v11;
  id v12;
  objc_class *v13;
  uint64_t v14;
  void *v15;
  NSLock *aggregationLock;
  id v17;
  id v18;
  id v19;
  CFAbsoluteTime Current;
  void *v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  uint64_t v27;
  _QWORD v28[6];
  _QWORD v29[5];
  id v30;
  id v31;
  _QWORD v32[4];
  id v33;
  id v34;
  HDActiveDataAggregator *v35;
  id v36;
  id v37;
  uint64_t *v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t (*v43)(uint64_t, uint64_t);
  void (*v44)(uint64_t);
  id v45;
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  char v49;
  _QWORD aBlock[6];
  objc_super v51;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v51.receiver = self;
  v51.super_class = (Class)HDActiveDataAggregator;
  -[HDDataAggregator dataCollector:didCollectSensorData:device:options:](&v51, sel_dataCollector_didCollectSensorData_device_options_, v10, v11, v12, a6);
  if ((a6 & 1) == 0)
  {
    v13 = -[HDActiveDataAggregator sensorDatumClass](self, "sensorDatumClass");
    v14 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __76__HDActiveDataAggregator_dataCollector_didCollectSensorData_device_options___block_invoke;
    aBlock[3] = &unk_1E6CF5730;
    aBlock[4] = self;
    aBlock[5] = v13;
    v15 = _Block_copy(aBlock);
    v46 = 0;
    v47 = &v46;
    v48 = 0x2020000000;
    v49 = 1;
    v40 = 0;
    v41 = &v40;
    v42 = 0x3032000000;
    v43 = __Block_byref_object_copy__74;
    v44 = __Block_byref_object_dispose__74;
    v45 = 0;
    aggregationLock = self->_aggregationLock;
    v32[0] = v14;
    v32[1] = 3221225472;
    v32[2] = __76__HDActiveDataAggregator_dataCollector_didCollectSensorData_device_options___block_invoke_205;
    v32[3] = &unk_1E6CF5798;
    v17 = v10;
    v33 = v17;
    v18 = v12;
    v34 = v18;
    v35 = self;
    v36 = v11;
    v19 = v15;
    v37 = v19;
    v38 = &v40;
    v39 = &v46;
    -[NSLock hk_withLock:](aggregationLock, "hk_withLock:", v32);
    if (*((_BYTE *)v47 + 24))
    {
      Current = CFAbsoluteTimeGetCurrent();
      -[HDDataAggregator dataCollectionManager](self, "dataCollectionManager");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[HDDataAggregator configuration](self, "configuration");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "collectionLatency");
      v24 = v23;
      objc_msgSend((id)v41[5], "timeIntervalSinceNow");
      v26 = v24 + v25;
      v27 = MEMORY[0x1E0C809B0];
      v29[0] = MEMORY[0x1E0C809B0];
      v29[1] = 3221225472;
      v29[2] = __76__HDActiveDataAggregator_dataCollector_didCollectSensorData_device_options___block_invoke_3;
      v29[3] = &unk_1E6CF57C0;
      v29[4] = self;
      v30 = v17;
      v31 = v18;
      v28[0] = v27;
      v28[1] = 3221225472;
      v28[2] = __76__HDActiveDataAggregator_dataCollector_didCollectSensorData_device_options___block_invoke_4;
      v28[3] = &unk_1E6CF5708;
      v28[4] = self;
      *(CFAbsoluteTime *)&v28[5] = Current;
      objc_msgSend(v21, "performSaveWithMaximumLatency:block:completion:", v29, v28, v26);

    }
    _Block_object_dispose(&v40, 8);

    _Block_object_dispose(&v46, 8);
  }

}

uint64_t __76__HDActiveDataAggregator_dataCollector_didCollectSensorData_device_options___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  int v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  NSObject *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = objc_msgSend(*(id *)(a1 + 32), "doesDatumPredateDatabaseObliteration:", v3);
    if (v4)
    {
      _HKInitializeLogging();
      v5 = *MEMORY[0x1E0CB52A8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52A8], OS_LOG_TYPE_DEBUG))
      {
        v14 = *(void **)(a1 + 32);
        v15 = 138543362;
        v16 = v14;
        _os_log_debug_impl(&dword_1B7802000, v5, OS_LOG_TYPE_DEBUG, "%{public}@: Rejecting sensor datum from pre-obliteration", (uint8_t *)&v15, 0xCu);
      }
    }
    v6 = v4 ^ 1u;
  }
  else
  {
    _HKInitializeLogging();
    v7 = (void *)*MEMORY[0x1E0CB52A8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52A8], OS_LOG_TYPE_ERROR))
    {
      v9 = v7;
      v10 = (void *)objc_opt_class();
      v11 = *(void **)(a1 + 32);
      v12 = v10;
      v15 = 138543618;
      v16 = v10;
      v17 = 2114;
      v18 = (id)objc_msgSend(v11, "sensorDatumClass");
      v13 = v18;
      _os_log_error_impl(&dword_1B7802000, v9, OS_LOG_TYPE_ERROR, "Rejecting sensor datum of unexpected class %{public}@ (expected %{public}@)", (uint8_t *)&v15, 0x16u);

    }
    v6 = 0;
  }

  return v6;
}

void __76__HDActiveDataAggregator_dataCollector_didCollectSensorData_device_options___block_invoke_205(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;

  +[_HDAggregationStateKey keyForCollector:device:aggregator:]((uint64_t)_HDAggregationStateKey, *(void **)(a1 + 32), *(void **)(a1 + 40), *(void **)(a1 + 48));
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 72), "objectForKeyedSubscript:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    objc_msgSend(*(id *)(a1 + 48), "initialAggregationState");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 72), "setObject:forKeyedSubscript:", v2, v12);
  }
  objc_msgSend(v2, "unaggregatedSensorData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dateInterval");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "endDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "hk_addObjectsFromArray:passingTest:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
  objc_msgSend(v3, "sortUsingComparator:", &__block_literal_global_207_0);
  objc_msgSend(v3, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dateInterval");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "endDate");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v9;

  if (objc_msgSend(v6, "isEqualToDate:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40)))
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = 0;

}

uint64_t __76__HDActiveDataAggregator_dataCollector_didCollectSensorData_device_options___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v4, "dateInterval");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "endDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dateInterval");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "endDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v7, "compare:", v9);

  if (!v10)
  {
    objc_msgSend(v4, "dateInterval");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "startDate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dateInterval");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "startDate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v12, "compare:", v14);

  }
  return v10;
}

uint64_t __76__HDActiveDataAggregator_dataCollector_didCollectSensorData_device_options___block_invoke_3(void **a1)
{
  -[HDActiveDataAggregator _aggregateForCollector:device:requestedAggregationDate:mode:options:](a1[4], a1[5], a1[6], 0, 1, 0);
  return 1;
}

void __76__HDActiveDataAggregator_dataCollector_didCollectSensorData_device_options___block_invoke_4(uint64_t a1, int a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  NSObject *v9;
  CFAbsoluteTime v10;
  uint64_t v11;
  CFAbsoluteTime v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  CFAbsoluteTime v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  _HKInitializeLogging();
  v6 = (void *)*MEMORY[0x1E0CB52A8];
  v7 = *MEMORY[0x1E0CB52A8];
  if (!a2)
  {
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      goto LABEL_6;
    v11 = *(_QWORD *)(a1 + 32);
    v9 = v6;
    v12 = CFAbsoluteTimeGetCurrent() - *(double *)(a1 + 40);
    v13 = 138543874;
    v14 = v11;
    v15 = 2048;
    v16 = v12;
    v17 = 2114;
    v18 = v5;
    _os_log_error_impl(&dword_1B7802000, v9, OS_LOG_TYPE_ERROR, "%{public}@: Save failed after %0.2lfs: %{public}@", (uint8_t *)&v13, 0x20u);
    goto LABEL_4;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = *(_QWORD *)(a1 + 32);
    v9 = v6;
    v10 = CFAbsoluteTimeGetCurrent() - *(double *)(a1 + 40);
    v13 = 138543618;
    v14 = v8;
    v15 = 2048;
    v16 = v10;
    _os_log_impl(&dword_1B7802000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: Finished save with latency %0.2lfs.", (uint8_t *)&v13, 0x16u);
LABEL_4:

  }
LABEL_6:

}

- (id)configurationForCollector:(id)a3
{
  double v4;
  double v5;
  void *v6;
  uint64_t v7;
  void *v8;

  -[HDActiveDataAggregator aggregationInterval](self, "aggregationInterval", a3);
  v5 = v4;
  -[HDDataAggregator configuration](self, "configuration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "hasActiveWorkout"))
    v7 = 2;
  else
    v7 = 1;
  +[HDDataCollectorConfiguration configurationWithType:interval:latency:](HDDataCollectorConfiguration, "configurationWithType:interval:latency:", v7, v5, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)didPersistObjects:(id)a3 lastDatum:(id)a4 collector:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  BOOL v14;
  objc_super v16;
  uint8_t buf[4];
  HDActiveDataAggregator *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (!v11)
  {
    _HKInitializeLogging();
    v13 = *MEMORY[0x1E0CB52A8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52A8], OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138543362;
      v18 = self;
      _os_log_fault_impl(&dword_1B7802000, v13, OS_LOG_TYPE_FAULT, "%{public}@: Persisted objects with a nil last datum.", buf, 0xCu);
    }
  }
  v16.receiver = self;
  v16.super_class = (Class)HDActiveDataAggregator;
  v14 = -[HDDataAggregator didPersistObjects:lastDatum:collector:error:](&v16, sel_didPersistObjects_lastDatum_collector_error_, v10, v11, v12, a6);

  return v14;
}

- (double)aggregationIntervalForCollector:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;

  v4 = a3;
  -[HDActiveDataAggregator aggregationInterval](self, "aggregationInterval");
  v6 = v5;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v4, "preferredAggregationIntervalForAggregator:", self);
    if (v6 >= v7 && v7 >= 0.0)
      v6 = v7;
  }

  return v6;
}

- (Class)sensorDatumClass
{
  objc_opt_class();
  NSRequestConcreteImplementation();
  return 0;
}

- (id)aggregateForState:(id)a3 collector:(id)a4 device:(id)a5 requestedAggregationDate:(id)a6 mode:(int64_t)a7 options:(unint64_t)a8 error:(id *)a9
{
  objc_opt_class();
  NSRequestConcreteImplementation();
  return 0;
}

- (double)aggregationInterval
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;

  -[HDDataAggregator configuration](self, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDDataAggregator objectType](self, "objectType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "code");
  HKDefaultAggregationIntervalForType();
  v6 = v5;

  objc_msgSend(v3, "aggregationInterval");
  if (v7 > 0.0)
  {
    v8 = v7;
    if (((objc_msgSend(v3, "hasForegroundObserver") & 1) != 0 || objc_msgSend(v3, "hasActiveWorkout"))
      && v8 < v6)
    {
      v6 = v8;
    }
  }

  return v6;
}

id __80__HDActiveDataAggregator__aggregateForAllDevicesForCollector_date_mode_options___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
    return *(id *)(a2 + 16);
  else
    return 0;
}

- (void)requestAggregationThroughDate:(id)a3 mode:(int64_t)a4 options:(unint64_t)a5 completion:(id)a6
{
  id v9;
  id v10;
  objc_super v11;
  _QWORD v12[4];
  HDActiveDataAggregator *v13;
  id v14;
  id v15;
  int64_t v16;
  unint64_t v17;

  v12[1] = 3221225472;
  v12[2] = __80__HDActiveDataAggregator_requestAggregationThroughDate_mode_options_completion___block_invoke;
  v12[3] = &unk_1E6CF5828;
  v13 = self;
  v14 = a3;
  v15 = a6;
  v16 = a4;
  v17 = a5;
  v11.receiver = v13;
  v11.super_class = (Class)HDActiveDataAggregator;
  v12[0] = MEMORY[0x1E0C809B0];
  v9 = v14;
  v10 = v15;
  -[HDDataAggregator requestAggregationThroughDate:mode:options:completion:](&v11, sel_requestAggregationThroughDate_mode_options_completion_, v9, a4, a5, v12);

}

void __80__HDActiveDataAggregator_requestAggregationThroughDate_mode_options_completion___block_invoke(uint64_t a1, char a2)
{
  if ((a2 & 1) != 0)
    -[HDActiveDataAggregator _requestAggregationThroughDate:mode:options:completion:](*(void **)(a1 + 32), *(void **)(a1 + 40), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(void **)(a1 + 48));
  else
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (void)recomputeCollectorConfiguration
{
  void *v3;
  NSObject *v4;
  _QWORD block[5];
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HDActiveDataAggregator;
  -[HDDataAggregator recomputeCollectorConfiguration](&v6, sel_recomputeCollectorConfiguration);
  -[HDDataAggregator dataCollectionManager](self, "dataCollectionManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sharedDelayedAggregationQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__HDActiveDataAggregator_recomputeCollectorConfiguration__block_invoke;
  block[3] = &unk_1E6CE80E8;
  block[4] = self;
  dispatch_async(v4, block);

}

uint64_t __57__HDActiveDataAggregator_recomputeCollectorConfiguration__block_invoke(uint64_t a1)
{
  _QWORD *v1;
  void *v2;

  v1 = *(_QWORD **)(a1 + 32);
  v2 = (void *)v1[10];
  objc_msgSend(v1, "aggregationInterval");
  return objc_msgSend(v2, "executeWithDelay:");
}

- (id)initialAggregationState
{
  HDDataAggregationState *v2;
  id v3;
  HDDataAggregationState *v4;

  v2 = [HDDataAggregationState alloc];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v4 = -[HDDataAggregationState initWithRemainingSensorData:](v2, "initWithRemainingSensorData:", v3);

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delayedAggregationOperation, 0);
  objc_storeStrong((id *)&self->_currentAggregationStates, 0);
  objc_storeStrong((id *)&self->_aggregationLock, 0);
}

@end
