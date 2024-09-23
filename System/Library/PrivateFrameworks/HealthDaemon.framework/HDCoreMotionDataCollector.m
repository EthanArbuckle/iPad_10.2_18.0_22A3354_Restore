@implementation HDCoreMotionDataCollector

- (HDCoreMotionDataCollector)initWithProfile:(id)a3
{
  id v4;
  HDCoreMotionDataCollector *v5;
  HDCoreMotionDataCollector *v6;
  uint64_t v7;
  OS_dispatch_queue *queue;
  HKDataCollectorState *v9;
  HKDataCollectorState *state;
  NSMutableDictionary *v11;
  NSMutableDictionary *lastCMDatumByType;
  void *v13;
  void *v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)HDCoreMotionDataCollector;
  v5 = -[HDCoreMotionDataCollector init](&v16, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_profile, v4);
    HKCreateSerialDispatchQueue();
    v7 = objc_claimAutoreleasedReturnValue();
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v7;

    v9 = (HKDataCollectorState *)objc_alloc_init(MEMORY[0x1E0CB6578]);
    state = v6->_state;
    v6->_state = v9;

    v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    lastCMDatumByType = v6->_lastCMDatumByType;
    v6->_lastCMDatumByType = v11;

    objc_msgSend(MEMORY[0x1E0D29830], "sharedDiagnosticManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObject:", v6);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObserver:selector:name:object:", v6, sel__accessToFitnessDataDidChange_, CFSTR("HDDataCollectionAccessToFitnessDataDidChangeNotification"), 0);

  }
  return v6;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)HDCoreMotionDataCollector;
  -[HDCoreMotionDataCollector dealloc](&v4, sel_dealloc);
}

- (void)registerWithAggregators
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__HDCoreMotionDataCollector_registerWithAggregators__block_invoke;
  block[3] = &unk_1E6CE80E8;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __52__HDCoreMotionDataCollector_registerWithAggregators__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  HDDataCollectorMultiplexer *v5;
  void *v6;
  void *v7;
  id WeakRetained;
  uint64_t v9;
  uint64_t v10;
  void *v11;

  objc_msgSend(*(id *)(a1 + 32), "collectedTypes");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 8);
  *(_QWORD *)(v3 + 8) = v2;

  v5 = [HDDataCollectorMultiplexer alloc];
  v6 = *(void **)(a1 + 32);
  objc_msgSend(v6, "persistentIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 64));
  v9 = -[HDDataCollectorMultiplexer initForCollector:identifier:profile:types:](v5, "initForCollector:identifier:profile:types:", v6, v7, WeakRetained, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
  v10 = *(_QWORD *)(a1 + 32);
  v11 = *(void **)(v10 + 16);
  *(_QWORD *)(v10 + 16) = v9;

  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "registerForCollectionWithState:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40));
}

- (void)queue_recomputeCurrentState
{
  unint64_t v3;
  id WeakRetained;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  HKDataCollectorState *state;
  NSObject *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  int64_t v15;
  HDCoreMotionDataSource *v16;
  HDCoreMotionDataSource *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  char v27;
  const __CFString *v28;
  void *v29;
  char v30;
  void *v31;
  char v32;
  void *v33;
  char v34;
  void *v35;
  char v36;
  void *v37;
  char v38;
  void *v39;
  id v40;
  void *v41;
  id v42;
  _BOOL4 v43;
  void *v44;
  id v45;
  id v46;
  void *v47;
  NSObject *v48;
  NSObject *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  NSObject *v53;
  int64_t errorCount;
  HDCoreMotionDataSource *dataSource;
  id v56;
  NSObject *v57;
  void *v58;
  HDDataCollectorMultiplexer *multiplexer;
  NSObject *v60;
  void *v61;
  NSObject *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  NSSet *obj;
  uint64_t v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  id v77;
  uint64_t v78;
  uint64_t *v79;
  uint64_t v80;
  uint64_t (*v81)(uint64_t, uint64_t);
  void (*v82)(uint64_t);
  id v83;
  _BYTE buf[24];
  void *v85;
  id v86;
  id v87[11];
  _BYTE v88[24];
  void *v89;
  __CFString *v90;
  HDCoreMotionDataCollector *v91;
  id v92;
  id v93;
  uint64_t *v94;
  uint64_t v95;

  v95 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[HDDataCollectorMultiplexer mergedConfiguration](self->_multiplexer, "mergedConfiguration");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = -[HDCoreMotionDataCollector queue_targetCollectionTypeForRequestedCollectionType:](self, "queue_targetCollectionTypeForRequestedCollectionType:", objc_msgSend(v67, "collectionType"));
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "dataCollectionManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hasAccessToFitnessData");

  if (!v6)
    v3 = 0;
  if (v3 != -[HKDataCollectorState collectionType](self->_state, "collectionType"))
  {
    v65 = v3;
    _HKInitializeLogging();
    v7 = (void *)*MEMORY[0x1E0CB52A8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52A8], OS_LOG_TYPE_DEBUG))
    {
      v57 = v7;
      -[HDCoreMotionDataCollector diagnosticDescription](self, "diagnosticDescription");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = self;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v58;
      _os_log_debug_impl(&dword_1B7802000, v57, OS_LOG_TYPE_DEBUG, "%{public}@: %{public}@", buf, 0x16u);

    }
    _HKInitializeLogging();
    v8 = (void *)*MEMORY[0x1E0CB52A8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52A8], OS_LOG_TYPE_DEBUG))
    {
      multiplexer = self->_multiplexer;
      v60 = v8;
      -[HDDataCollectorMultiplexer diagnosticDescription](multiplexer, "diagnosticDescription");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      *(_QWORD *)&buf[4] = self;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = multiplexer;
      *(_WORD *)&buf[22] = 2114;
      v85 = v61;
      _os_log_debug_impl(&dword_1B7802000, v60, OS_LOG_TYPE_DEBUG, "%{public}@: %{public}@ %{public}@", buf, 0x20u);

    }
    _HKInitializeLogging();
    v9 = (void *)*MEMORY[0x1E0CB52A8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52A8], OS_LOG_TYPE_DEFAULT))
    {
      state = self->_state;
      v11 = v9;
      -[HKDataCollectorState collectionType](state, "collectionType");
      HKDataCollectionTypeToString();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      HKDataCollectionTypeToString();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      *(_QWORD *)&buf[4] = self;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v12;
      *(_WORD *)&buf[22] = 2114;
      v85 = v13;
      _os_log_impl(&dword_1B7802000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: Transitioning collection type from %{public}@ -> %{public}@", buf, 0x20u);

    }
    if (v65)
    {
      if (self->_errorCount < 3)
      {
        if (self->_dataSource
          || (-[HDCoreMotionDataCollector queue_newDataSource](self, "queue_newDataSource"),
              v16 = (HDCoreMotionDataSource *)objc_claimAutoreleasedReturnValue(),
              v17 = self->_dataSource,
              self->_dataSource = v16,
              v17,
              self->_dataSource))
        {
          dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
          v75 = 0u;
          v76 = 0u;
          v73 = 0u;
          v74 = 0u;
          obj = self->_quantityTypes;
          v18 = -[NSSet countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v73, buf, 16);
          if (v18)
          {
            v72 = *(_QWORD *)v74;
            v69 = *MEMORY[0x1E0CB5A48];
            v70 = *MEMORY[0x1E0CB5A88];
            v68 = *MEMORY[0x1E0CB5D78];
            v66 = *MEMORY[0x1E0CB5D18];
            v64 = *MEMORY[0x1E0CB5C68];
            v63 = *MEMORY[0x1E0CB5C90];
            do
            {
              v19 = 0;
              do
              {
                if (*(_QWORD *)v74 != v72)
                  objc_enumerationMutation(obj);
                v20 = *(void **)(*((_QWORD *)&v73 + 1) + 8 * v19);
                -[NSMutableDictionary objectForKeyedSubscript:](self->_lastCMDatumByType, "objectForKeyedSubscript:", v20);
                v21 = (id)objc_claimAutoreleasedReturnValue();
                if (!v21)
                {
                  v22 = v20;
                  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
                  -[HDDataCollectorMultiplexer lastDatumForType:](self->_multiplexer, "lastDatumForType:", v22);
                  v23 = (void *)objc_claimAutoreleasedReturnValue();
                  -[HDCoreMotionDataCollector _coreMotionDatumFromSensorDatum:](self, v23);
                  v24 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v24)
                  {
                    v21 = v24;
                  }
                  else
                  {
                    v77 = 0;
                    v25 = v22;
                    objc_msgSend(v25, "identifier");
                    v26 = (void *)objc_claimAutoreleasedReturnValue();
                    v27 = objc_msgSend(v26, "isEqualToString:", v70);

                    v28 = CFSTR("BASAL_ENERGY_INGESTION");
                    if ((v27 & 1) != 0)
                      goto LABEL_32;
                    objc_msgSend(v25, "identifier");
                    v29 = (void *)objc_claimAutoreleasedReturnValue();
                    v30 = objc_msgSend(v29, "isEqualToString:", v69);

                    v28 = CFSTR("ACTIVE_ENERGY_INGESTION");
                    if ((v30 & 1) != 0)
                      goto LABEL_32;
                    objc_msgSend(v25, "identifier");
                    v31 = (void *)objc_claimAutoreleasedReturnValue();
                    v32 = objc_msgSend(v31, "isEqualToString:", v68);

                    v28 = CFSTR("STEP_INGESTION");
                    if ((v32 & 1) != 0)
                      goto LABEL_32;
                    objc_msgSend(v25, "identifier");
                    v33 = (void *)objc_claimAutoreleasedReturnValue();
                    v34 = objc_msgSend(v33, "isEqualToString:", v66);

                    v28 = CFSTR("VULCAN_INGESTION");
                    if ((v34 & 1) != 0)
                      goto LABEL_32;
                    objc_msgSend(v25, "identifier");
                    v35 = (void *)objc_claimAutoreleasedReturnValue();
                    v36 = objc_msgSend(v35, "isEqualToString:", v64);

                    v28 = CFSTR("DISTANCE_INGESTION");
                    if ((v36 & 1) != 0
                      || (objc_msgSend(v25, "identifier"),
                          v37 = (void *)objc_claimAutoreleasedReturnValue(),
                          v38 = objc_msgSend(v37, "isEqualToString:", v63),
                          v37,
                          v28 = CFSTR("FLIGHTS_INGESTION"),
                          (v38 & 1) != 0))
                    {
LABEL_32:

                      objc_msgSend(v25, "canonicalUnit");
                      v39 = (void *)objc_claimAutoreleasedReturnValue();
                      v78 = 0;
                      v79 = &v78;
                      v80 = 0x3032000000;
                      v81 = __Block_byref_object_copy__96;
                      v82 = __Block_byref_object_dispose__96;
                      v83 = 0;
                      v40 = objc_loadWeakRetained((id *)&self->_profile);
                      objc_msgSend(v40, "database");
                      v41 = (void *)objc_claimAutoreleasedReturnValue();
                      *(_QWORD *)v88 = MEMORY[0x1E0C809B0];
                      *(_QWORD *)&v88[8] = 3221225472;
                      *(_QWORD *)&v88[16] = __72__HDCoreMotionDataCollector__migrateDataCollectionContextForType_error___block_invoke;
                      v89 = &unk_1E6CF8FC0;
                      v90 = (__CFString *)v28;
                      v91 = self;
                      v42 = v39;
                      v92 = v42;
                      v94 = &v78;
                      v93 = v25;
                      v43 = +[HDHealthEntity performWriteTransactionWithHealthDatabase:error:block:](HDUnprotectedKeyValueEntity, "performWriteTransactionWithHealthDatabase:error:block:", v41, &v77, v88);

                      if (v43)
                        v44 = (void *)v79[5];
                      else
                        v44 = 0;
                      v45 = v44;

                      _Block_object_dispose(&v78, 8);
                    }
                    else
                    {

                      objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", &v77, 3, CFSTR("Unable to migrate %@: unknown domain for migration."), v25);
                      v45 = 0;
                    }

                    v46 = v77;
                    -[HDCoreMotionDataCollector _coreMotionDatumFromSensorDatum:](self, v45);
                    v47 = (void *)objc_claimAutoreleasedReturnValue();

                    if (v47)
                    {
                      _HKInitializeLogging();
                      v48 = *MEMORY[0x1E0CB52A8];
                      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52A8], OS_LOG_TYPE_DEFAULT))
                      {
                        *(_DWORD *)v88 = 138543618;
                        *(_QWORD *)&v88[4] = self;
                        *(_WORD *)&v88[12] = 2114;
                        *(_QWORD *)&v88[14] = v25;
                        _os_log_impl(&dword_1B7802000, v48, OS_LOG_TYPE_DEFAULT, "%{public}@: Successfully migrated data collection context for %{public}@", v88, 0x16u);
                      }
                    }
                    else if (v46)
                    {
                      _HKInitializeLogging();
                      v49 = *MEMORY[0x1E0CB52A8];
                      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52A8], OS_LOG_TYPE_ERROR))
                      {
                        *(_DWORD *)v88 = 138543874;
                        *(_QWORD *)&v88[4] = self;
                        *(_WORD *)&v88[12] = 2114;
                        *(_QWORD *)&v88[14] = v25;
                        *(_WORD *)&v88[22] = 2114;
                        v89 = v46;
                        _os_log_error_impl(&dword_1B7802000, v49, OS_LOG_TYPE_ERROR, "%{public}@: Failed to migrate data collection context for %{public}@: %{public}@", v88, 0x20u);
                      }
                    }
                    v21 = v47;

                  }
                  if (v21)
                    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_lastCMDatumByType, "setObject:forKeyedSubscript:", v21, v22);
                }

                ++v19;
              }
              while (v18 != v19);
              v50 = -[NSSet countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v73, buf, 16);
              v18 = v50;
            }
            while (v50);
          }

          -[NSMutableDictionary allValues](self->_lastCMDatumByType, "allValues");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v51, "hk_firstSortedObjectWithComparison:", &__block_literal_global_204_2);
          v52 = (void *)objc_claimAutoreleasedReturnValue();

          _HKInitializeLogging();
          v53 = *MEMORY[0x1E0CB52A8];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52A8], OS_LOG_TYPE_DEFAULT))
          {
            errorCount = self->_errorCount;
            *(_DWORD *)buf = 138543874;
            *(_QWORD *)&buf[4] = self;
            *(_WORD *)&buf[12] = 2112;
            *(_QWORD *)&buf[14] = v52;
            *(_WORD *)&buf[22] = 2048;
            v85 = (void *)errorCount;
            _os_log_impl(&dword_1B7802000, v53, OS_LOG_TYPE_DEFAULT, "%{public}@: Beginning CM streaming with last datum %@ (current error count: %ld).", buf, 0x20u);
          }
          objc_initWeak((id *)v88, self);
          -[HDCoreMotionDataCollector _queue_updateCollectionType:]((uint64_t)self, v65);
          dataSource = self->_dataSource;
          *(_QWORD *)buf = MEMORY[0x1E0C809B0];
          *(_QWORD *)&buf[8] = 3221225472;
          *(_QWORD *)&buf[16] = __73__HDCoreMotionDataCollector__queue_beginUpdatesWithTargetCollectionType___block_invoke_205;
          v85 = &unk_1E6CF8F98;
          objc_copyWeak(v87, (id *)v88);
          v56 = v52;
          v86 = v56;
          -[HDCoreMotionDataSource hd_beginStreamingFromDatum:handler:](dataSource, "hd_beginStreamingFromDatum:handler:", v56, buf);

          objc_destroyWeak(v87);
          objc_destroyWeak((id *)v88);

        }
        else
        {
          _HKInitializeLogging();
          v62 = *MEMORY[0x1E0CB52A8];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52A8], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            *(_QWORD *)&buf[4] = self;
            _os_log_impl(&dword_1B7802000, v62, OS_LOG_TYPE_DEFAULT, "%{public}@: Failed to create a new data source; will not begin updates.",
              buf,
              0xCu);
          }
        }
      }
      else
      {
        _HKInitializeLogging();
        v14 = *MEMORY[0x1E0CB52A8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52A8], OS_LOG_TYPE_DEFAULT))
        {
          v15 = self->_errorCount;
          *(_DWORD *)buf = 138543618;
          *(_QWORD *)&buf[4] = self;
          *(_WORD *)&buf[12] = 2048;
          *(_QWORD *)&buf[14] = v15;
          _os_log_impl(&dword_1B7802000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@: Reached retry limit of %ld while attempting to begin streaming; will try again on next configuration change.",
            buf,
            0x16u);
        }
        -[HDCoreMotionDataCollector unitTest_retriesExhausted](self, "unitTest_retriesExhausted");
      }
    }
    else
    {
      -[HDCoreMotionDataSource hd_stopStreaming](self->_dataSource, "hd_stopStreaming");
      -[HDCoreMotionDataCollector _queue_updateCollectionType:]((uint64_t)self, 0);
    }
  }

}

- (void)_queue_updateCollectionType:(uint64_t)a1
{
  uint64_t v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 56));
    if (objc_msgSend(*(id *)(a1 + 40), "collectionType") != a2)
    {
      objc_msgSend(*(id *)(a1 + 40), "cloneWithNewType:", a2);
      v4 = objc_claimAutoreleasedReturnValue();
      v5 = *(void **)(a1 + 40);
      *(_QWORD *)(a1 + 40) = v4;

      v14 = 0u;
      v15 = 0u;
      v12 = 0u;
      v13 = 0u;
      v6 = *(id *)(a1 + 8);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v7)
      {
        v8 = v7;
        v9 = *(_QWORD *)v13;
        do
        {
          v10 = 0;
          do
          {
            if (*(_QWORD *)v13 != v9)
              objc_enumerationMutation(v6);
            objc_msgSend(*(id *)(a1 + 16), "aggregatorForType:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v10), (_QWORD)v12);
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "dataCollector:didChangeState:", a1, *(_QWORD *)(a1 + 40));

            ++v10;
          }
          while (v8 != v10);
          v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        }
        while (v8);
      }

    }
  }
}

- (id)_coreMotionDatumFromSensorDatum:(void *)a1
{
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  id v8;
  uint8_t buf[4];
  void *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "resumeContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v8 = 0;
    objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_msgSend(a1, "coreMotionDatumClass"), v3, &v8);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v8;
    if (!v4)
    {
      _HKInitializeLogging();
      v6 = *MEMORY[0x1E0CB52A8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52A8], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        v10 = a1;
        v11 = 2114;
        v12 = v5;
        _os_log_error_impl(&dword_1B7802000, v6, OS_LOG_TYPE_ERROR, "%{public}@: Failed to decode datum resume context: %{public}@", buf, 0x16u);
      }
    }

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

BOOL __66__HDCoreMotionDataCollector__queue_forwardCoreMotionData_forType___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  _BOOL8 v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  void *v16;
  int v18;
  uint64_t v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "hd_sourceID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  v6 = *(void **)(a1 + 32);
  if (v4 == v6)
  {

    goto LABEL_6;
  }
  if (v6)
  {
    objc_msgSend(v3, "hd_sourceID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqual:", *(_QWORD *)(a1 + 32));

    if (!v8)
      goto LABEL_8;
LABEL_6:
    v9 = objc_msgSend(v3, "hd_compare:", *(_QWORD *)(a1 + 40)) == 1;
    goto LABEL_11;
  }

LABEL_8:
  _HKInitializeLogging();
  v10 = (void *)*MEMORY[0x1E0CB52A8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52A8], OS_LOG_TYPE_DEFAULT))
  {
    v13 = a1 + 40;
    v11 = *(void **)(a1 + 40);
    v12 = *(_QWORD *)(v13 + 8);
    v14 = v10;
    objc_msgSend(v11, "hd_sourceID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "hd_sourceID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 138543874;
    v19 = v12;
    v20 = 2114;
    v21 = v15;
    v22 = 2114;
    v23 = v16;
    _os_log_impl(&dword_1B7802000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@: CM database reset detected (Source ID %{public}@ -> %{public}@", (uint8_t *)&v18, 0x20u);

  }
  v9 = 1;
LABEL_11:

  return v9;
}

double __66__HDCoreMotionDataCollector__queue_forwardCoreMotionData_forType___block_invoke_195(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  void *v18;
  int v20;
  uint64_t v21;
  __int16 v22;
  double v23;
  __int16 v24;
  double v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "queue_differenceFromDatum:toDatum:type:", v5, v6, *(_QWORD *)(a1 + 40));
  v8 = v7;
  objc_msgSend(v6, "hd_datestamp");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hd_datestamp");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "timeIntervalSinceDate:", v10);
  v12 = v11;

  if (v12 <= 14400.0)
  {
    v14 = v8;
  }
  else
  {
    _HKInitializeLogging();
    v13 = (void *)*MEMORY[0x1E0CB52A8];
    v14 = 0.0;
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52A8], OS_LOG_TYPE_ERROR))
    {
      v15 = *(_QWORD *)(a1 + 32);
      v16 = v13;
      objc_msgSend(v5, "hd_datestamp");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "hd_datestamp");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138544386;
      v21 = v15;
      v22 = 2048;
      v23 = v8;
      v24 = 2048;
      v25 = v12;
      v26 = 2114;
      v27 = v17;
      v28 = 2114;
      v29 = v18;
      _os_log_error_impl(&dword_1B7802000, v16, OS_LOG_TYPE_ERROR, "%{public}@: Dropping value %lf covering unexpectedly long gap (%lfs from %{public}@ to %{public}@)", (uint8_t *)&v20, 0x34u);

    }
  }

  return v14;
}

id __66__HDCoreMotionDataCollector__queue_forwardCoreMotionData_forType___block_invoke_197(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  int v8;
  id v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  int v16;
  id v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v5 = a3;
  objc_msgSend(v4, "hd_datestamp");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hd_datestamp");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "hk_isBeforeOrEqualToDate:", v7);

  if (v8)
  {
    v9 = objc_alloc(MEMORY[0x1E0CB3588]);
    v10 = v4;
  }
  else
  {
    _HKInitializeLogging();
    v11 = *MEMORY[0x1E0CB52A8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52A8], OS_LOG_TYPE_ERROR))
    {
      v16 = 138412546;
      v17 = v4;
      v18 = 2112;
      v19 = v5;
      _os_log_error_impl(&dword_1B7802000, v11, OS_LOG_TYPE_ERROR, "Received out-of-date-order samples %@, %@; creating instantaneous datum to account for adjustment.",
        (uint8_t *)&v16,
        0x16u);
    }
    v9 = objc_alloc(MEMORY[0x1E0CB3588]);
    v10 = v5;
  }
  objc_msgSend(v10, "hd_datestamp");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hd_datestamp");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v9, "initWithStartDate:endDate:", v12, v13);

  return v14;
}

void __75__HDCoreMotionDataCollector__didReceiveCoreMotionData_startingDatum_error___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  os_log_t *v5;
  void *v6;
  NSObject *v7;
  os_signpost_id_t v8;
  os_log_t v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t j;
  void *v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  NSObject *v33;
  void *v34;
  uint64_t v35;
  NSObject *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t i;
  void *v47;
  void *v48;
  NSObject *v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  os_signpost_id_t v54;
  void *v55;
  id obj;
  uint64_t v57;
  uint64_t v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  _QWORD v63[4];
  id v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  _QWORD v69[5];
  id v70;
  uint8_t v71[8];
  uint64_t v72;
  BOOL (*v73)(uint64_t, void *);
  void *v74;
  id v75;
  id v76;
  uint64_t v77;
  uint8_t v78[128];
  uint8_t buf[4];
  uint64_t v80;
  __int16 v81;
  uint64_t v82;
  uint64_t v83;

  v83 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  if (!v2)
  {
    objc_msgSend(*(id *)(a1 + 48), "domain");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v34, "isEqualToString:", *MEMORY[0x1E0CA5580]))
    {
      v35 = objc_msgSend(*(id *)(a1 + 48), "code");

      if (v35 == 107)
      {
        _HKInitializeLogging();
        v36 = *MEMORY[0x1E0CB52A8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52A8], OS_LOG_TYPE_DEFAULT))
        {
          v37 = *(_QWORD *)(a1 + 40);
          *(_DWORD *)buf = 138543362;
          v80 = v37;
          _os_log_impl(&dword_1B7802000, v36, OS_LOG_TYPE_DEFAULT, "%{public}@: Received invalid parameter error", buf, 0xCu);
        }
        *(_QWORD *)(*(_QWORD *)(a1 + 40) + 48) = 0;
        v38 = *(void **)(*(_QWORD *)(a1 + 40) + 24);
        v63[0] = MEMORY[0x1E0C809B0];
        v63[1] = 3221225472;
        v63[2] = __75__HDCoreMotionDataCollector__didReceiveCoreMotionData_startingDatum_error___block_invoke_201;
        v63[3] = &unk_1E6CF8F30;
        v64 = *(id *)(a1 + 56);
        objc_msgSend(v38, "keysOfEntriesPassingTest:", v63);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = *(void **)(*(_QWORD *)(a1 + 40) + 24);
        objc_msgSend(v39, "allObjects");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "removeObjectsForKeys:", v41);

        v61 = 0u;
        v62 = 0u;
        v59 = 0u;
        v60 = 0u;
        v42 = v39;
        v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v59, v78, 16);
        if (v43)
        {
          v44 = v43;
          v45 = *(_QWORD *)v60;
          do
          {
            for (i = 0; i != v44; ++i)
            {
              if (*(_QWORD *)v60 != v45)
                objc_enumerationMutation(v42);
              v47 = *(void **)(*(_QWORD *)(a1 + 40) + 16);
              objc_msgSend(v47, "aggregatorForType:", *(_QWORD *)(*((_QWORD *)&v59 + 1) + 8 * i));
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v47, "setLastSensorDatum:forAggregator:", 0, v48);

            }
            v44 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v59, v78, 16);
          }
          while (v44);
        }

LABEL_50:
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "hd_stopStreaming");
        v50 = *(_QWORD *)(a1 + 40);
        v51 = *(void **)(v50 + 32);
        *(_QWORD *)(v50 + 32) = 0;

        -[HDCoreMotionDataCollector _queue_updateCollectionType:](*(_QWORD *)(a1 + 40), 0);
        objc_msgSend(*(id *)(a1 + 40), "queue_recomputeCurrentState");
        return;
      }
    }
    else
    {

    }
    _HKInitializeLogging();
    v49 = *MEMORY[0x1E0CB52A8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52A8], OS_LOG_TYPE_ERROR))
    {
      v52 = *(_QWORD *)(a1 + 40);
      v53 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)buf = 138543618;
      v80 = v52;
      v81 = 2114;
      v82 = v53;
      _os_log_error_impl(&dword_1B7802000, v49, OS_LOG_TYPE_ERROR, "%{public}@: Received error: %{public}@", buf, 0x16u);
    }
    ++*(_QWORD *)(*(_QWORD *)(a1 + 40) + 48);
    goto LABEL_50;
  }
  v3 = *(_QWORD *)(a1 + 40);
  v4 = v2;
  if (v3)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(v3 + 56));
    if (objc_msgSend(v4, "count"))
    {
      v55 = v4;
      _HKInitializeLogging();
      v5 = (os_log_t *)MEMORY[0x1E0CB52A8];
      v6 = (void *)*MEMORY[0x1E0CB52A8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52A8], OS_LOG_TYPE_DEFAULT))
      {
        v7 = v6;
        *(_DWORD *)buf = 138543618;
        v80 = v3;
        v81 = 2048;
        v82 = objc_msgSend(v55, "count");
        _os_log_impl(&dword_1B7802000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: Received %ld core motion datums", buf, 0x16u);

      }
      v8 = _HKLogSignpostIDGenerate();
      _HKInitializeLogging();
      v9 = *v5;
      if (os_signpost_enabled(*v5))
      {
        v10 = v9;
        v11 = v10;
        if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
        {
          v12 = objc_msgSend(v55, "count");
          v13 = *(_QWORD *)(v3 + 8);
          *(_DWORD *)buf = 134218242;
          v80 = v12;
          v81 = 2114;
          v82 = v13;
          _os_signpost_emit_with_name_impl(&dword_1B7802000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v8, "core-motion-data-unpack", "count=%ld, types=%{public}@", buf, 0x16u);
        }

      }
      v54 = v8;
      v67 = 0u;
      v68 = 0u;
      v65 = 0u;
      v66 = 0u;
      obj = *(id *)(v3 + 8);
      v14 = v55;
      v58 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v65, buf, 16);
      if (v58)
      {
        v57 = *(_QWORD *)v66;
        do
        {
          for (j = 0; j != v58; ++j)
          {
            if (*(_QWORD *)v66 != v57)
              objc_enumerationMutation(obj);
            v16 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * j);
            v17 = v14;
            v18 = v16;
            dispatch_assert_queue_V2(*(dispatch_queue_t *)(v3 + 56));
            if (objc_msgSend(v17, "count"))
            {
              objc_msgSend(*(id *)(v3 + 24), "objectForKeyedSubscript:", v18);
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              if (!v19)
              {
                objc_msgSend(*(id *)(v3 + 16), "lastDatumForType:", v18);
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                -[HDCoreMotionDataCollector _coreMotionDatumFromSensorDatum:]((void *)v3, v20);
                v19 = (void *)objc_claimAutoreleasedReturnValue();

              }
              objc_msgSend(v17, "firstObject");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "hd_unitForType:", v18);
              v22 = (void *)objc_claimAutoreleasedReturnValue();

              if (v19)
              {
                objc_msgSend(v19, "hd_sourceID");
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                *(_QWORD *)v71 = MEMORY[0x1E0C809B0];
                v72 = 3221225472;
                v73 = __66__HDCoreMotionDataCollector__queue_forwardCoreMotionData_forType___block_invoke;
                v74 = &unk_1E6CF8EA0;
                v75 = v23;
                v76 = v19;
                v77 = v3;
                v24 = v23;
                objc_msgSend(v17, "hk_filter:", v71);
                v25 = objc_claimAutoreleasedReturnValue();

                v17 = (id)v25;
              }
              if (objc_msgSend(v17, "count"))
              {
                v69[0] = MEMORY[0x1E0C809B0];
                v69[1] = 3221225472;
                v69[2] = __66__HDCoreMotionDataCollector__queue_forwardCoreMotionData_forType___block_invoke_195;
                v69[3] = &unk_1E6CF8EC8;
                v69[4] = v3;
                v26 = v18;
                v70 = v26;
                +[HDQuantityDatum quantityDataForDifferencesInData:baseDatum:unit:differenceHandler:intervalHandler:](HDQuantityDatum, "quantityDataForDifferencesInData:baseDatum:unit:differenceHandler:intervalHandler:", v17, v19, v22, v69, &__block_literal_global_102);
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend(v27, "count"))
                {
                  objc_msgSend(*(id *)(v3 + 16), "aggregatorForType:", v26);
                  v28 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(MEMORY[0x1E0CB65C0], "localDevice");
                  v29 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v28, "dataCollector:didCollectSensorData:device:options:", v3, v27, v29, 0);

                  v14 = v55;
                }
                objc_msgSend(v17, "lastObject");
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(*(id *)(v3 + 24), "setObject:forKeyedSubscript:", v30, v26);

              }
            }

          }
          v58 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v65, buf, 16);
        }
        while (v58);
      }

      _HKInitializeLogging();
      v31 = (void *)*MEMORY[0x1E0CB52A8];
      v4 = v14;
      if (os_signpost_enabled((os_log_t)*MEMORY[0x1E0CB52A8]))
      {
        v32 = v31;
        v33 = v32;
        if (v54 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v32))
        {
          *(_WORD *)v71 = 0;
          _os_signpost_emit_with_name_impl(&dword_1B7802000, v33, OS_SIGNPOST_INTERVAL_END, v54, "core-motion-data-unpack", ", v71, 2u);
        }

        v4 = v55;
      }
    }
  }

}

uint64_t __75__HDCoreMotionDataCollector__didReceiveCoreMotionData_startingDatum_error___block_invoke_201(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "isEqual:", *(_QWORD *)(a1 + 32));
}

uint64_t __73__HDCoreMotionDataCollector__queue_beginUpdatesWithTargetCollectionType___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hd_compare:");
}

void __73__HDCoreMotionDataCollector__queue_beginUpdatesWithTargetCollectionType___block_invoke_205(uint64_t a1, void *a2, void *a3)
{
  id *v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  _QWORD *WeakRetained;
  _QWORD block[4];
  id v15;
  _QWORD *v16;
  id v17;
  id v18;

  v5 = (id *)(a1 + 40);
  v6 = a3;
  v7 = a2;
  WeakRetained = objc_loadWeakRetained(v5);
  v8 = *(void **)(a1 + 32);
  v9 = v7;
  v10 = v8;
  v11 = v6;
  if (WeakRetained)
  {
    v12 = WeakRetained[7];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __75__HDCoreMotionDataCollector__didReceiveCoreMotionData_startingDatum_error___block_invoke;
    block[3] = &unk_1E6CECCA8;
    v15 = v9;
    v16 = WeakRetained;
    v17 = v11;
    v18 = v10;
    dispatch_async(v12, block);

  }
}

- (void)_accessToFitnessDataDidChange:(id)a3
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__HDCoreMotionDataCollector__accessToFitnessDataDidChange___block_invoke;
  block[3] = &unk_1E6CE80E8;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __59__HDCoreMotionDataCollector__accessToFitnessDataDidChange___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "queue_recomputeCurrentState");
}

- (Class)coreMotionDatumClass
{
  objc_opt_class();
  NSRequestConcreteImplementation();
  return 0;
}

- (id)collectedTypes
{
  objc_opt_class();
  NSRequestConcreteImplementation();
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "set");
}

- (id)queue_newDataSource
{
  objc_opt_class();
  NSRequestConcreteImplementation();
  return 0;
}

- (double)queue_differenceFromDatum:(id)a3 toDatum:(id)a4 type:(id)a5
{
  objc_opt_class();
  NSRequestConcreteImplementation();
  return 0.0;
}

- (id)persistentIdentifier
{
  objc_opt_class();
  NSRequestConcreteImplementation();
  return 0;
}

- (unint64_t)queue_targetCollectionTypeForRequestedCollectionType:(unint64_t)a3
{
  if (a3 > 2)
    return 0;
  else
    return qword_1B7F40F68[a3];
}

- (void)beginCollectionForDataAggregator:(id)a3 lastPersistedSensorDatum:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __87__HDCoreMotionDataCollector_beginCollectionForDataAggregator_lastPersistedSensorDatum___block_invoke;
  block[3] = &unk_1E6CE7FB8;
  block[4] = self;
  v12 = v7;
  v13 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_async(queue, block);

}

uint64_t __87__HDCoreMotionDataCollector_beginCollectionForDataAggregator_lastPersistedSensorDatum___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  _HKInitializeLogging();
  v2 = *MEMORY[0x1E0CB52A8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52A8], OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    v5 = *(_QWORD *)(a1 + 48);
    v7 = 138543874;
    v8 = v3;
    v9 = 2112;
    v10 = v4;
    v11 = 2114;
    v12 = v5;
    _os_log_impl(&dword_1B7802000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@: Received last sensor datum %@ from %{public}@", (uint8_t *)&v7, 0x20u);
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setLastSensorDatum:forAggregator:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  return objc_msgSend(*(id *)(a1 + 32), "queue_recomputeCurrentState");
}

- (void)dataAggregator:(id)a3 wantsCollectionWithConfiguration:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __77__HDCoreMotionDataCollector_dataAggregator_wantsCollectionWithConfiguration___block_invoke;
  block[3] = &unk_1E6CE7FB8;
  block[4] = self;
  v12 = v7;
  v13 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_async(queue, block);

}

uint64_t __77__HDCoreMotionDataCollector_dataAggregator_wantsCollectionWithConfiguration___block_invoke(uint64_t a1)
{
  os_log_t *v2;
  NSObject *v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v2 = (os_log_t *)MEMORY[0x1E0CB52A8];
  if (*(uint64_t *)(*(_QWORD *)(a1 + 32) + 48) >= 1)
  {
    _HKInitializeLogging();
    v3 = *v2;
    if (os_log_type_enabled(*v2, OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(_QWORD *)(a1 + 32);
      v10 = 138543362;
      v11 = v4;
      _os_log_impl(&dword_1B7802000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: Resetting error count on configuration change.", (uint8_t *)&v10, 0xCu);
    }
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48) = 0;
  }
  _HKInitializeLogging();
  v5 = *v2;
  if (os_log_type_enabled(*v2, OS_LOG_TYPE_DEFAULT))
  {
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(_QWORD *)(a1 + 40);
    v8 = *(_QWORD *)(a1 + 48);
    v10 = 138543874;
    v11 = v6;
    v12 = 2114;
    v13 = v7;
    v14 = 2114;
    v15 = v8;
    _os_log_impl(&dword_1B7802000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: Received updated configuration %{public}@ from %{public}@", (uint8_t *)&v10, 0x20u);
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setConfiguration:forAggregator:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  return objc_msgSend(*(id *)(a1 + 32), "queue_recomputeCurrentState");
}

- (id)sourceForDataAggregator:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB6C18], "_localDeviceSource", a3);
}

- (id)identifierForDataAggregator:(id)a3
{
  return -[HDDataCollectorMultiplexer identifierForAggregator:](self->_multiplexer, "identifierForAggregator:", a3);
}

- (Class)sensorDatumClassForAggregator:(id)a3
{
  return (Class)objc_opt_class();
}

- (id)diagnosticDescription
{
  id v3;

  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  objc_msgSend(v3, "appendString:", CFSTR("Diagnostic Description:\n"));
  objc_msgSend(v3, "appendFormat:", CFSTR("\tstate: %@\n"), self->_state);
  objc_msgSend(v3, "appendFormat:", CFSTR("\terrorCount: %ld\n"), self->_errorCount);
  objc_msgSend(v3, "appendFormat:", CFSTR("\tdataSource: %@\n"), self->_dataSource);
  objc_msgSend(v3, "appendFormat:", CFSTR("\tquantityTypes: %@\n"), self->_quantityTypes);
  objc_msgSend(v3, "appendFormat:", CFSTR("\tlastCMDatumByType: %@\n"), self->_lastCMDatumByType);
  return v3;
}

uint64_t __72__HDCoreMotionDataCollector__migrateDataCollectionContextForType_error___block_invoke(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  HDKeyValueDomain *v5;
  uint64_t v6;
  id WeakRetained;
  HDKeyValueDomain *v8;
  void *v9;
  id v10;
  void *v11;
  HDQuantityDatum *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  id v20;
  void *v21;
  HDKeyValueDomain *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  HDKeyValueDomain *v27;
  id *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  _QWORD *v33;
  void *v34;
  id v35;

  v5 = [HDKeyValueDomain alloc];
  v6 = *(_QWORD *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 64));
  v8 = -[HDKeyValueDomain initWithCategory:domainName:profile:](v5, "initWithCategory:domainName:profile:", 0, v6, WeakRetained);

  v35 = 0;
  -[HDKeyValueDomain dataForKey:error:](v8, "dataForKey:error:", CFSTR("context"), &v35);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v35;
  v11 = v10;
  if (!v9)
  {
    if (!v10)
    {
      v31 = 1;
      goto LABEL_10;
    }
    if (a3)
    {
      v31 = 0;
      *a3 = objc_retainAutorelease(v10);
      goto LABEL_10;
    }
    _HKLogDroppedError();
LABEL_9:
    v31 = 0;
    goto LABEL_10;
  }
  if (!-[HDKeyValueDomain setData:forKey:error:](v8, "setData:forKey:error:", 0, CFSTR("context"), a3))
    goto LABEL_9;
  objc_msgSend(MEMORY[0x1E0CB6A28], "quantityWithUnit:doubleValue:", *(_QWORD *)(a1 + 48), 0.0);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = [HDQuantityDatum alloc];
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_alloc(MEMORY[0x1E0CB3588]);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v14, "initWithStartDate:duration:", v15, 0.0);
  v17 = -[HDQuantityDatum initWithIdentifier:dateInterval:resumeContext:quantity:](v12, "initWithIdentifier:dateInterval:resumeContext:quantity:", v13, v16, v9, v34);
  v18 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v19 = *(void **)(v18 + 40);
  *(_QWORD *)(v18 + 40) = v17;

  v20 = objc_alloc_init(MEMORY[0x1E0C99DF0]);
  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36F8]), "initForWritingWithMutableData:", v20);
  objc_msgSend(v21, "encodeObject:forKey:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), CFSTR("sensor_datum"));
  objc_msgSend(v21, "finishEncoding");
  v22 = [HDKeyValueDomain alloc];
  v23 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(*(id *)(a1 + 56), "identifier");
  v33 = a3;
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "stringWithFormat:", CFSTR("DATA_AGGREGATION-%@"), v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 64));
  v27 = -[HDKeyValueDomain initWithCategory:domainName:profile:](v22, "initWithCategory:domainName:profile:", 0, v25, v26);

  v28 = *(id **)(a1 + 40);
  objc_msgSend(v28[2], "aggregatorForType:", *(_QWORD *)(a1 + 56));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "identifierForDataAggregator:", v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  v31 = -[HDKeyValueDomain setData:forKey:error:](v27, "setData:forKey:error:", v20, v30, v33);
LABEL_10:

  return v31;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (HDProfile)profile
{
  return (HDProfile *)objc_loadWeakRetained((id *)&self->_profile);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_profile);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_lastCMDatumByType, 0);
  objc_storeStrong((id *)&self->_multiplexer, 0);
  objc_storeStrong((id *)&self->_quantityTypes, 0);
}

@end
