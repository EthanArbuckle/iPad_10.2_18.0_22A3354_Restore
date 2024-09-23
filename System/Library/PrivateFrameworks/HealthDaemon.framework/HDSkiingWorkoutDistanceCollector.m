@implementation HDSkiingWorkoutDistanceCollector

- (HDSkiingWorkoutDistanceCollector)initWithProfile:(id)a3
{
  id v4;
  HDSkiingWorkoutDistanceCollector *v5;
  void *v6;
  uint64_t v7;
  CMSkiTracker *skiTracker;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HDSkiingWorkoutDistanceCollector;
  v5 = -[HDAggregateDataCollector initWithProfile:](&v10, sel_initWithProfile_, v4);
  if (v5)
  {
    objc_msgSend(v4, "workoutManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "newCMSkiTracker");
    skiTracker = v5->_skiTracker;
    v5->_skiTracker = (CMSkiTracker *)v7;

  }
  return v5;
}

+ (id)observedType
{
  return (id)objc_msgSend(MEMORY[0x1E0CB6A70], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5C40]);
}

- (void)stopPerformingUpdatesWithErrorEncountered:(BOOL)a3
{
  _BOOL4 v3;
  CMSkiTracker *skiTracker;

  v3 = a3;
  -[CMSkiTracker stopUpdates](self->_skiTracker, "stopUpdates");
  if (v3)
  {
    skiTracker = self->_skiTracker;
    self->_skiTracker = 0;

  }
}

+ (Class)sensorDatumClass
{
  return (Class)objc_opt_class();
}

+ (id)domain
{
  return CFSTR("DISTANCE_DOWNHILL_SNOW_SPORTS_INGESTION");
}

- (void)beginUpdatesFromDatum:(id)a3 withHandler:(id)a4
{
  id v5;
  NSObject *v6;
  CMSkiTracker *skiTracker;
  id v8;
  _QWORD v9[4];
  id v10;
  uint8_t buf[16];

  v5 = a4;
  _HKInitializeLogging();
  v6 = *MEMORY[0x1E0CB52A8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52A8], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B7802000, v6, OS_LOG_TYPE_DEFAULT, "Registering for skiing distance updates", buf, 2u);
  }
  skiTracker = self->_skiTracker;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __70__HDSkiingWorkoutDistanceCollector_beginUpdatesFromDatum_withHandler___block_invoke;
  v9[3] = &unk_1E6CF3398;
  v10 = v5;
  v8 = v5;
  -[CMSkiTracker startUpdatesFromRecord:handler:](skiTracker, "startUpdatesFromRecord:handler:", 0, v9);

}

uint64_t __70__HDSkiingWorkoutDistanceCollector_beginUpdatesFromDatum_withHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, BOOL))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), a2 != 0);
}

- (void)fetchHistoricalSensorDataSinceDatum:(id)a3 databaseIdentifier:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  CMSkiTracker *skiTracker;
  _QWORD v13[4];
  id v14;
  uint8_t buf[4];
  id v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  _HKInitializeLogging();
  v11 = *MEMORY[0x1E0CB52A8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52A8], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543618;
    v16 = v8;
    v17 = 2114;
    v18 = v9;
    _os_log_impl(&dword_1B7802000, v11, OS_LOG_TYPE_INFO, "Fetching historical skiing distance data since datum: %{public}@ for database: %{public}@", buf, 0x16u);
  }
  skiTracker = self->_skiTracker;
  if (skiTracker)
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __102__HDSkiingWorkoutDistanceCollector_fetchHistoricalSensorDataSinceDatum_databaseIdentifier_completion___block_invoke;
    v13[3] = &unk_1E6CF3398;
    v14 = v10;
    -[CMSkiTracker querySkiUpdatesFromRecord:handler:](skiTracker, "querySkiUpdatesFromRecord:handler:", v8, v13);

  }
  else
  {
    (*((void (**)(id, _QWORD, _QWORD))v10 + 2))(v10, MEMORY[0x1E0C9AA60], 0);
  }

}

uint64_t __102__HDSkiingWorkoutDistanceCollector_fetchHistoricalSensorDataSinceDatum_databaseIdentifier_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)hkObjectsFromSensorData:(id)a3 baseSensorDatum:(id)a4 startDate:(id)a5 endDate:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  os_log_t *v19;
  int *v20;
  uint64_t v21;
  void *v22;
  NSObject *v23;
  unint64_t v24;
  double v25;
  double v26;
  double v27;
  double v28;
  uint64_t v29;
  os_log_t *v30;
  id v31;
  int *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  NSObject *v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  HDSkiingWorkoutDistanceCollector *v46;
  uint64_t v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  uint8_t v52[128];
  uint8_t buf[4];
  id v54;
  __int16 v55;
  id v56;
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (objc_msgSend(v10, "count"))
  {
    v41 = v13;
    v42 = v12;
    v43 = v11;
    v45 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    -[HDAggregateDataCollector _queue_lastReceivedSensorDatum](self, "_queue_lastReceivedSensorDatum");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = 0u;
    v49 = 0u;
    v50 = 0u;
    v51 = 0u;
    v44 = v10;
    v15 = v10;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v48, v52, 16);
    if (v16)
    {
      v17 = v16;
      v46 = self;
      v18 = *(_QWORD *)v49;
      v19 = (os_log_t *)MEMORY[0x1E0CB5380];
      v20 = &dword_1B7802000;
      do
      {
        v21 = 0;
        v47 = v17;
        do
        {
          if (*(_QWORD *)v49 != v18)
            objc_enumerationMutation(v15);
          v22 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * v21);
          _HKInitializeLogging();
          v23 = *v19;
          if (os_log_type_enabled(*v19, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v54 = v22;
            _os_log_impl(v20, v23, OS_LOG_TYPE_DEFAULT, "Processing ski distance data: %@", buf, 0xCu);
          }
          v24 = objc_msgSend(v22, "recordId");
          if (v24 > objc_msgSend(v14, "recordId"))
          {
            objc_msgSend(v22, "runDistance");
            v26 = v25;
            objc_msgSend(v14, "runDistance");
            v28 = v26 - v27;
            if (v28 > 2.22044605e-16)
            {
              v29 = v18;
              v30 = v19;
              v31 = v15;
              v32 = v20;
              objc_msgSend(v22, "startDate");
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v22, "endDate");
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              -[HDSkiingWorkoutDistanceCollector generateDownhillSnowSportsDistanceSampleForDistance:startDate:endDate:](v46, "generateDownhillSnowSportsDistanceSampleForDistance:startDate:endDate:", v33, v34, v28);
              v35 = (void *)objc_claimAutoreleasedReturnValue();

              if (v35)
                objc_msgSend(v45, "addObject:", v35);

              v20 = v32;
              v15 = v31;
              v19 = v30;
              v18 = v29;
              v17 = v47;
            }
            v36 = v22;

            v14 = v36;
          }
          ++v21;
        }
        while (v17 != v21);
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v48, v52, 16);
      }
      while (v17);
    }

    v11 = v43;
    v10 = v44;
    v13 = v41;
    v12 = v42;
  }
  else
  {
    _HKInitializeLogging();
    v37 = (void *)*MEMORY[0x1E0CB52A8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52A8], OS_LOG_TYPE_ERROR))
    {
      v39 = v37;
      *(_DWORD *)buf = 138412546;
      v54 = (id)objc_opt_class();
      v55 = 2112;
      v56 = v10;
      v40 = v54;
      _os_log_error_impl(&dword_1B7802000, v39, OS_LOG_TYPE_ERROR, "%@: Received ski data array (%@) with no elememts", buf, 0x16u);

    }
    v45 = (id)MEMORY[0x1E0C9AA60];
  }

  return v45;
}

- (id)generateDownhillSnowSportsDistanceSampleForDistance:(double)a3 startDate:(id)a4 endDate:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v18;
  id v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a5;
  if (objc_msgSend(v8, "hk_isBeforeDate:", v7))
  {
    _HKInitializeLogging();
    v9 = *MEMORY[0x1E0CB52A8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52A8], OS_LOG_TYPE_FAULT))
    {
      v18 = 138543618;
      v19 = v7;
      v20 = 2114;
      v21 = v8;
      _os_log_fault_impl(&dword_1B7802000, v9, OS_LOG_TYPE_FAULT, "Out-of-order CMSkiData samples: %{public}@, %{public}@", (uint8_t *)&v18, 0x16u);
    }
    v10 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB6A70], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5C40]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)MEMORY[0x1E0CB6A28];
    objc_msgSend(MEMORY[0x1E0CB6CD0], "meterUnit");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "quantityWithUnit:doubleValue:", v13, a3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = (void *)MEMORY[0x1E0CB6A40];
    objc_msgSend(MEMORY[0x1E0CB65C0], "localDevice");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "quantitySampleWithType:quantity:startDate:endDate:device:metadata:", v11, v14, v7, v8, v16, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v10;
}

- (BOOL)requiresSampleAggregation
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_skiTracker, 0);
}

@end
