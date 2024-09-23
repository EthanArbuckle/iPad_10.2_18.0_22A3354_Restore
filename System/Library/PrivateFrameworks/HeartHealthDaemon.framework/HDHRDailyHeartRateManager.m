@implementation HDHRDailyHeartRateManager

- (HDHRDailyHeartRateManager)initWithProfile:(id)a3
{
  id v4;
  HDHRDailyHeartRateManager *v5;
  void *v6;
  NSObject *v7;
  objc_class *v8;
  void *v9;
  const char *v10;
  dispatch_queue_t v11;
  OS_dispatch_queue *queue;
  id WeakRetained;
  void *v14;
  uint64_t v15;
  NSMutableDictionary *restingHeartRateByActivityCacheIndex;
  uint64_t v17;
  NSMutableDictionary *walkingAverageHeartRateByActivityCacheIndex;
  objc_super v20;
  uint8_t buf[4];
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)HDHRDailyHeartRateManager;
  v5 = -[HDHRDailyHeartRateManager init](&v20, sel_init);
  if (v5)
  {
    _HKInitializeLogging();
    v6 = (void *)*MEMORY[0x1E0CB52E8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52E8], OS_LOG_TYPE_DEFAULT))
    {
      v7 = v6;
      v8 = (objc_class *)objc_opt_class();
      NSStringFromClass(v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v22 = v9;
      _os_log_impl(&dword_1CC29C000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] Initializing", buf, 0xCu);

    }
    objc_storeWeak((id *)&v5->_profile, v4);
    v10 = (const char *)HDDispatchQueueName();
    v11 = dispatch_queue_create(v10, 0);
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v11;

    WeakRetained = objc_loadWeakRetained((id *)&v5->_profile);
    objc_msgSend(WeakRetained, "healthDaemon");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "registerForDaemonReady:", v5);

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v15 = objc_claimAutoreleasedReturnValue();
    restingHeartRateByActivityCacheIndex = v5->_restingHeartRateByActivityCacheIndex;
    v5->_restingHeartRateByActivityCacheIndex = (NSMutableDictionary *)v15;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v17 = objc_claimAutoreleasedReturnValue();
    walkingAverageHeartRateByActivityCacheIndex = v5->_walkingAverageHeartRateByActivityCacheIndex;
    v5->_walkingAverageHeartRateByActivityCacheIndex = (NSMutableDictionary *)v17;

  }
  return v5;
}

- (void)dealloc
{
  id WeakRetained;
  objc_super v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_activityCacheInterface);
  objc_msgSend(WeakRetained, "removeActivityCacheObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)HDHRDailyHeartRateManager;
  -[HDHRDailyHeartRateManager dealloc](&v4, sel_dealloc);
}

- (void)daemonReady:(id)a3
{
  void *v4;
  NSObject *v5;
  objc_class *v6;
  void *v7;
  id WeakRetained;
  void *v9;
  id v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  _HKInitializeLogging();
  v4 = (void *)*MEMORY[0x1E0CB52E8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52E8], OS_LOG_TYPE_DEFAULT))
  {
    v5 = v4;
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543362;
    v12 = v7;
    _os_log_impl(&dword_1CC29C000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] Received daemon ready", (uint8_t *)&v11, 0xCu);

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "activityCacheInterface");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeWeak((id *)&self->_activityCacheInterface, v9);

  v10 = objc_loadWeakRetained((id *)&self->_activityCacheInterface);
  objc_msgSend(v10, "addActivityCacheObserver:", self);

}

- (void)activityCacheManager:(id)a3 changedHeartRateSummary:(id)a4 isToday:(BOOL)a5
{
  id v6;
  void *v7;
  NSObject *v8;
  objc_class *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *queue;
  id v15;
  _QWORD v16[4];
  id v17;
  HDHRDailyHeartRateManager *v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  _HKInitializeLogging();
  v7 = (void *)*MEMORY[0x1E0CB52E8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52E8], OS_LOG_TYPE_DEFAULT))
  {
    v8 = v7;
    v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v6, "activityCacheIndex"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "restingHeartRate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "walkingAverageHeartRate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v20 = v10;
    v21 = 2114;
    v22 = v11;
    v23 = 2112;
    v24 = v12;
    v25 = 2112;
    v26 = v13;
    _os_log_impl(&dword_1CC29C000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] Received heart rate summary (%{public}@) with resting: %@, walking: %@", buf, 0x2Au);

  }
  queue = self->_queue;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __82__HDHRDailyHeartRateManager_activityCacheManager_changedHeartRateSummary_isToday___block_invoke;
  v16[3] = &unk_1E87EFB30;
  v17 = v6;
  v18 = self;
  v15 = v6;
  dispatch_async(queue, v16);

}

void __82__HDHRDailyHeartRateManager_activityCacheManager_changedHeartRateSummary_isToday___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id *v9;
  id WeakRetained;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  id v15;

  v2 = objc_msgSend(*(id *)(a1 + 32), "activityCacheIndex");
  objc_msgSend(*(id *)(a1 + 32), "heartRateDateInterval");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "restingHeartRate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB6A70], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5D28]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_queue_replaceHeartRate:ofType:forCacheIndex:dateInterval:heartRateByCacheIndex:", v4, v5, v2, v15, *(_QWORD *)(*(_QWORD *)(a1 + 40) + 32));

  v6 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "walkingAverageHeartRate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB6A70], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5DB8]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_queue_replaceHeartRate:ofType:forCacheIndex:dateInterval:heartRateByCacheIndex:", v7, v8, v2, v15, *(_QWORD *)(*(_QWORD *)(a1 + 40) + 40));

  v9 = *(id **)(a1 + 40);
  WeakRetained = objc_loadWeakRetained(v9 + 2);
  objc_msgSend(WeakRetained, "currentActivityCache");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "cacheIndex");
  v13 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 16));
  objc_msgSend(v13, "yesterdayActivityCache");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_queue_cleanupValuesForTodayCacheIndex:yesterdayCacheIndex:", v12, objc_msgSend(v14, "cacheIndex"));

}

- (void)_queue_replaceHeartRate:(id)a3 ofType:(id)a4 forCacheIndex:(int64_t)a5 dateInterval:(id)a6 heartRateByCacheIndex:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  const char *v21;
  NSObject *v22;
  uint32_t v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  HDProfile **p_profile;
  id WeakRetained;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  void *v41;
  NSObject *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  HDHRDailyHeartRateManager *v47;
  int v48;
  void *v49;
  id v50;
  void *v51;
  id v52;
  void *v53;
  id v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  uint8_t buf[4];
  void *v59;
  __int16 v60;
  void *v61;
  __int16 v62;
  id v63;
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = a7;
  objc_msgSend(v13, "identifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12 && !objc_msgSend(v12, "_isZero"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a5);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = v15;
    objc_msgSend(v15, "objectForKeyedSubscript:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v12, "isEqual:", v25);

    if (v26)
    {
      _HKInitializeLogging();
      v27 = (void *)*MEMORY[0x1E0CB52E8];
      v15 = v53;
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52E8], OS_LOG_TYPE_DEFAULT))
        goto LABEL_16;
      v28 = (void *)MEMORY[0x1E0CB37E8];
      v19 = v27;
      objc_msgSend(v28, "numberWithLongLong:", a5);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v59 = v20;
      v60 = 2114;
      v61 = v16;
      v62 = 2112;
      v63 = v12;
      v21 = "[Daily HR] ignoring activity cache (%{public}@) for %{public}@ because value (%@) did not change";
      v22 = v19;
      v23 = 32;
      goto LABEL_5;
    }
    v56 = *MEMORY[0x1E0CB7238];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a5);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = v29;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v57, &v56, 1);
    v30 = objc_claimAutoreleasedReturnValue();

    v31 = (void *)MEMORY[0x1E0CB6A40];
    objc_msgSend(v14, "startDate");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = v14;
    objc_msgSend(v14, "endDate");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = (void *)v30;
    objc_msgSend(v31, "quantitySampleWithType:quantity:startDate:endDate:metadata:", v13, v12, v32, v33, v30);
    v34 = objc_claimAutoreleasedReturnValue();

    v47 = self;
    p_profile = &self->_profile;
    WeakRetained = objc_loadWeakRetained((id *)p_profile);
    objc_msgSend(WeakRetained, "dataManager");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = (void *)v34;
    v55 = v34;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v55, 1);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = objc_loadWeakRetained((id *)p_profile);
    objc_msgSend(v39, "dataProvenanceManager");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "defaultLocalDataProvenance");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = 0;
    v48 = objc_msgSend(v37, "insertDataObjects:withProvenance:creationDate:error:", v38, v41, &v54, CFAbsoluteTimeGetCurrent());
    v50 = v54;

    _HKInitializeLogging();
    v42 = *MEMORY[0x1E0CB52E8];
    if (v48)
    {
      v15 = v53;
      v43 = v49;
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52E8], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v59 = v16;
        v60 = 2112;
        v61 = v49;
        _os_log_impl(&dword_1CC29C000, v42, OS_LOG_TYPE_DEFAULT, "[Daily HR] saved new %{public}@: %@", buf, 0x16u);
      }
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a5);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "setObject:forKeyedSubscript:", v12, v44);

      objc_msgSend(v49, "UUID");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      -[HDHRDailyHeartRateManager _queue_deleteHeartRateOfType:forCacheIndex:replacementUUID:](v47, "_queue_deleteHeartRateOfType:forCacheIndex:replacementUUID:", v13, a5, v45);

      v46 = v50;
    }
    else
    {
      v15 = v53;
      v43 = v49;
      v46 = v50;
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
        -[HDHRDailyHeartRateManager _queue_replaceHeartRate:ofType:forCacheIndex:dateInterval:heartRateByCacheIndex:].cold.1();
    }

    v14 = v52;
  }
  else
  {
    _HKInitializeLogging();
    v17 = (void *)*MEMORY[0x1E0CB52E8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52E8], OS_LOG_TYPE_DEFAULT))
    {
      v18 = (void *)MEMORY[0x1E0CB37E8];
      v19 = v17;
      objc_msgSend(v18, "numberWithLongLong:", a5);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v59 = v20;
      v60 = 2114;
      v61 = v16;
      v21 = "[Daily HR] ignoring activity cache (%{public}@) with no value for %{public}@";
      v22 = v19;
      v23 = 22;
LABEL_5:
      _os_log_impl(&dword_1CC29C000, v22, OS_LOG_TYPE_DEFAULT, v21, buf, v23);

    }
  }
LABEL_16:

}

- (void)_queue_deleteHeartRateOfType:(id)a3 forCacheIndex:(int64_t)a4 replacementUUID:(id)a5
{
  id v8;
  id v9;
  void *v10;
  HDProfile **p_profile;
  id WeakRetained;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  void *v30;
  NSObject *v31;
  uint64_t v32;
  id v33;
  uint64_t v34;
  _QWORD v35[4];

  v35[3] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  HDSampleEntityPredicateForDataType();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  p_profile = &self->_profile;
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "metadataManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = *MEMORY[0x1E0CB7238];
  v15 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setWithObject:", v16);
  v17 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "predicateWithMetadataKey:allowedValues:", v14, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = (void *)MEMORY[0x1E0D29840];
  HDDataEntityPredicateForDataUUID();
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v19, "negatedPredicate:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = (void *)MEMORY[0x1E0D29840];
  v35[0] = v10;
  v35[1] = v18;
  v35[2] = v21;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 3);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "predicateMatchingAllPredicates:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v34 = 0;
  v25 = objc_loadWeakRetained((id *)p_profile);
  objc_msgSend(v25, "dataManager");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = HDSampleEntityClassForDataType();
  v28 = *MEMORY[0x1E0D29968];
  v33 = 0;
  LOBYTE(v32) = 0;
  LOBYTE(v17) = objc_msgSend(v26, "deleteDataObjectsOfClass:predicate:limit:deletedSampleCount:notifyObservers:generateDeletedObjects:userRequested:recursiveDeleteAuthorizationBlock:error:", v27, v24, v28, &v34, 1, 1, v32, 0, &v33);
  v29 = v33;

  _HKInitializeLogging();
  v30 = (void *)*MEMORY[0x1E0CB52E8];
  v31 = *MEMORY[0x1E0CB52E8];
  if ((v17 & 1) != 0)
  {
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
      -[HDHRDailyHeartRateManager _queue_deleteHeartRateOfType:forCacheIndex:replacementUUID:].cold.1(v30, v8, &v34);
  }
  else if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
  {
    -[HDHRDailyHeartRateManager _queue_deleteHeartRateOfType:forCacheIndex:replacementUUID:].cold.2(v30, v8, (uint64_t)v29);
  }

}

- (void)_queue_cleanupValuesForTodayCacheIndex:(int64_t)a3 yesterdayCacheIndex:(int64_t)a4
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  HDHRDailyHeartRateManager *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v15 = self;
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  -[NSMutableDictionary allKeys](self->_restingHeartRateByActivityCacheIndex, "allKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v19;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v19 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v10);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a3);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v11, "isEqualToNumber:", v12))
        {

        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a4);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v11, "isEqualToNumber:", v13);

          if ((v14 & 1) == 0)
            objc_msgSend(v16, "addObject:", v11);
        }
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v8);
  }

  -[NSMutableDictionary removeObjectsForKeys:](v15->_restingHeartRateByActivityCacheIndex, "removeObjectsForKeys:", v16);
  -[NSMutableDictionary removeObjectsForKeys:](v15->_walkingAverageHeartRateByActivityCacheIndex, "removeObjectsForKeys:", v16);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_walkingAverageHeartRateByActivityCacheIndex, 0);
  objc_storeStrong((id *)&self->_restingHeartRateByActivityCacheIndex, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_activityCacheInterface);
  objc_destroyWeak((id *)&self->_profile);
}

- (void)_queue_replaceHeartRate:ofType:forCacheIndex:dateInterval:heartRateByCacheIndex:.cold.1()
{
  uint64_t v0;
  NSObject *v1;
  uint8_t v2[14];
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2_3();
  v3 = v0;
  OUTLINED_FUNCTION_1_3(&dword_1CC29C000, v1, (uint64_t)v1, "[Daily HR] error saving new %{public}@: %@", v2);
}

- (void)_queue_deleteHeartRateOfType:(void *)a1 forCacheIndex:(void *)a2 replacementUUID:(_QWORD *)a3 .cold.1(void *a1, void *a2, _QWORD *a3)
{
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a1;
  objc_msgSend(a2, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138412546;
  v9 = v6;
  v10 = 2112;
  v11 = v7;
  _os_log_debug_impl(&dword_1CC29C000, v5, OS_LOG_TYPE_DEBUG, "[Daily HR] deleted %@ previous %@ heart rate sample(s)", (uint8_t *)&v8, 0x16u);

  OUTLINED_FUNCTION_2_0();
}

- (void)_queue_deleteHeartRateOfType:(void *)a1 forCacheIndex:(void *)a2 replacementUUID:(uint64_t)a3 .cold.2(void *a1, void *a2, uint64_t a3)
{
  NSObject *v5;
  void *v6;
  uint64_t v7;
  uint8_t v8[14];
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = a1;
  objc_msgSend(a2, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_3();
  v9 = a3;
  OUTLINED_FUNCTION_1_3(&dword_1CC29C000, v5, v7, "[Daily HR] error deleting %@ heart rate sample(s): %@", v8);

  OUTLINED_FUNCTION_2_0();
}

@end
