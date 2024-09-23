@implementation HKLocationFetcher

- (HKLocationFetcher)initWithHealthStore:(id)a3
{
  id v5;
  HKLocationFetcher *v6;
  HKLocationFetcher *v7;
  uint64_t v8;
  _HKWorkoutRouteStore *routesStore;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HKLocationFetcher;
  v6 = -[HKLocationFetcher init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_healthStore, a3);
    v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB7060]), "initWithHealthStore:", v5);
    routesStore = v7->_routesStore;
    v7->_routesStore = (_HKWorkoutRouteStore *)v8;

  }
  return v7;
}

- (void)dealloc
{
  objc_super v3;

  if (self->_routesQuery)
    -[HKHealthStore stopQuery:](self->_healthStore, "stopQuery:");
  v3.receiver = self;
  v3.super_class = (Class)HKLocationFetcher;
  -[HKLocationFetcher dealloc](&v3, sel_dealloc);
}

- (_HKLocationShifter)shifter
{
  _HKLocationShifter *shifter;
  _HKLocationShifter *v4;
  _HKLocationShifter *v5;

  shifter = self->_shifter;
  if (!shifter)
  {
    v4 = (_HKLocationShifter *)objc_alloc_init(MEMORY[0x1E0CB6FC0]);
    v5 = self->_shifter;
    self->_shifter = v4;

    shifter = self->_shifter;
  }
  return shifter;
}

- (void)fetchLocationsFromWorkout:(id)a3 withSamplesHandler:(id)a4
{
  -[HKLocationFetcher fetchLocationsFromWorkout:applyThreshold:withSamplesHandler:](self, "fetchLocationsFromWorkout:applyThreshold:withSamplesHandler:", a3, 1, a4);
}

- (void)fetchLocationsFromWorkout:(id)a3 applyThreshold:(BOOL)a4 withSamplesHandler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  BOOL v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  _HKInitializeLogging();
  v10 = (void *)*MEMORY[0x1E0CB5380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_DEFAULT))
  {
    v11 = v10;
    objc_msgSend(v8, "startDate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v8, "workoutActivityType");
    objc_msgSend(v8, "UUID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v23 = v12;
    v24 = 2048;
    v25 = v13;
    v26 = 2114;
    v27 = v14;
    _os_log_impl(&dword_1D7813000, v11, OS_LOG_TYPE_DEFAULT, "[routes] Request route on day %@ for workout of type %zd %{public}@", buf, 0x20u);

  }
  objc_initWeak((id *)buf, self);
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __81__HKLocationFetcher_fetchLocationsFromWorkout_applyThreshold_withSamplesHandler___block_invoke;
  v17[3] = &unk_1E9C44480;
  v15 = v9;
  v19 = v15;
  objc_copyWeak(&v20, (id *)buf);
  v16 = v8;
  v18 = v16;
  v21 = a4;
  -[HKLocationFetcher fetchRoutesFromWorkout:withUpdateHandler:](self, "fetchRoutesFromWorkout:withUpdateHandler:", v16, v17);

  objc_destroyWeak(&v20);
  objc_destroyWeak((id *)buf);

}

void __81__HKLocationFetcher_fetchLocationsFromWorkout_applyThreshold_withSamplesHandler___block_invoke(uint64_t a1, void *a2, char a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  id v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  char v14;
  char v15;

  v5 = a2;
  if (v5)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    objc_msgSend(WeakRetained, "routesStore");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setWorkoutRoutes:", v5);

    v8 = objc_loadWeakRetained((id *)(a1 + 48));
    objc_msgSend(v8, "routesStore");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __81__HKLocationFetcher_fetchLocationsFromWorkout_applyThreshold_withSamplesHandler___block_invoke_2;
    v10[3] = &unk_1E9C44458;
    v11 = *(id *)(a1 + 32);
    v14 = a3;
    v15 = *(_BYTE *)(a1 + 56);
    objc_copyWeak(&v13, (id *)(a1 + 48));
    v12 = *(id *)(a1 + 40);
    objc_msgSend(v9, "fetchAllLocationsWithCompletion:", v10);

    objc_destroyWeak(&v13);
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

void __81__HKLocationFetcher_fetchLocationsFromWorkout_applyThreshold_withSamplesHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  HKLocationReadings *v4;
  NSObject *v5;
  id WeakRetained;
  int v7;
  HKLocationReadings *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = -[HKLocationReadings initWithLocations:workout:isSmoothed:]([HKLocationReadings alloc], "initWithLocations:workout:isSmoothed:", v3, *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 56));

  _HKInitializeLogging();
  v5 = *MEMORY[0x1E0CB5380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412290;
    v8 = v4;
    _os_log_impl(&dword_1D7813000, v5, OS_LOG_TYPE_DEFAULT, "[routes] Fetched location readings %@", (uint8_t *)&v7, 0xCu);
  }
  if (*(_BYTE *)(a1 + 57)
    && (!_shouldShowMapRoute(v4, 0) || -[HKLocationReadings count](v4, "count") < 1))
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    objc_msgSend(WeakRetained, "_handleAndShiftLocations:forWorkout:withSamplesHandler:", v4, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

  }
}

- (void)fetchLocationsFromWorkout:(id)a3 workoutActivity:(id)a4 samplesHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  _QWORD v25[4];
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  uint64_t v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_alloc(MEMORY[0x1E0CB3588]);
  objc_msgSend(v9, "startDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "endDate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v11, "initWithStartDate:endDate:", v12, v13);

  _HKInitializeLogging();
  v15 = (void *)*MEMORY[0x1E0CB5380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_DEFAULT))
  {
    v16 = v15;
    objc_msgSend(v8, "startDate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "workoutConfiguration");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "activityType");
    objc_msgSend(v8, "UUID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v32 = v17;
    v33 = 2112;
    v34 = v14;
    v35 = 2048;
    v36 = v19;
    v37 = 2114;
    v38 = v20;
    _os_log_impl(&dword_1D7813000, v16, OS_LOG_TYPE_DEFAULT, "[routes] Request route on day %@ (interval %@) for activity of type %zd and workout %{public}@", buf, 0x2Au);

  }
  objc_initWeak((id *)buf, self);
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __78__HKLocationFetcher_fetchLocationsFromWorkout_workoutActivity_samplesHandler___block_invoke;
  v25[3] = &unk_1E9C444F8;
  objc_copyWeak(&v30, (id *)buf);
  v21 = v10;
  v29 = v21;
  v22 = v8;
  v26 = v22;
  v23 = v9;
  v27 = v23;
  v24 = v14;
  v28 = v24;
  -[HKLocationFetcher fetchRoutesFromWorkout:withUpdateHandler:](self, "fetchRoutesFromWorkout:withUpdateHandler:", v22, v25);

  objc_destroyWeak(&v30);
  objc_destroyWeak((id *)buf);

}

void __78__HKLocationFetcher_fetchLocationsFromWorkout_workoutActivity_samplesHandler___block_invoke(uint64_t a1, void *a2, char a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  void (**v10)(_QWORD);
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  id WeakRetained;
  id obj;
  _QWORD v28[4];
  id v29;
  void *v30;
  void (**v31)(_QWORD);
  uint64_t *v32;
  _QWORD *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint64_t v38;
  os_unfair_lock_s *v39;
  uint64_t v40;
  void *v41;
  int v42;
  _QWORD aBlock[4];
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  _QWORD *v50;
  _QWORD *v51;
  char v52;
  _QWORD v53[3];
  uint64_t v54;
  _QWORD v55[5];
  id v56;
  _BYTE v57[128];
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  v24 = v5;
  if (WeakRetained && objc_msgSend(v5, "count"))
  {
    v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v55[0] = 0;
    v55[1] = v55;
    v55[2] = 0x3032000000;
    v55[3] = __Block_byref_object_copy__18;
    v55[4] = __Block_byref_object_dispose__18;
    v56 = 0;
    v53[0] = 0;
    v53[1] = v53;
    v53[2] = 0x2020000000;
    v54 = 0;
    v54 = objc_msgSend(v5, "count");
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __78__HKLocationFetcher_fetchLocationsFromWorkout_workoutActivity_samplesHandler___block_invoke_191;
    aBlock[3] = &unk_1E9C444A8;
    v50 = v53;
    v7 = v5;
    v44 = v7;
    v25 = v6;
    v45 = v25;
    v8 = *(id *)(a1 + 32);
    v52 = a3;
    v46 = v8;
    v51 = v55;
    v47 = *(id *)(a1 + 40);
    v9 = *(id *)(a1 + 56);
    v48 = WeakRetained;
    v49 = v9;
    v10 = (void (**)(_QWORD))_Block_copy(aBlock);
    v38 = 0;
    v39 = (os_unfair_lock_s *)&v38;
    v40 = 0x2810000000;
    v41 = &unk_1D7BC951A;
    v42 = 0;
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    obj = v7;
    v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v57, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v35;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v35 != v12)
            objc_enumerationMutation(obj);
          v14 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * v13);
          v15 = objc_alloc(MEMORY[0x1E0CB3588]);
          objc_msgSend(v14, "startDate");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "endDate");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = (void *)objc_msgSend(v15, "initWithStartDate:endDate:", v16, v17);

          objc_msgSend(v18, "intersectionWithDateInterval:", *(_QWORD *)(a1 + 48));
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "duration");
          if (v20 == 0.0)
          {
            os_unfair_lock_lock(v39 + 8);
            v10[2](v10);
            os_unfair_lock_unlock(v39 + 8);
          }
          else
          {
            v21 = objc_alloc(MEMORY[0x1E0CB6E70]);
            v28[0] = MEMORY[0x1E0C809B0];
            v28[1] = 3221225472;
            v28[2] = __78__HKLocationFetcher_fetchLocationsFromWorkout_workoutActivity_samplesHandler___block_invoke_2;
            v28[3] = &unk_1E9C444D0;
            v32 = &v38;
            v29 = v25;
            v30 = v14;
            v33 = v55;
            v31 = v10;
            v22 = (void *)objc_msgSend(v21, "initWithRoute:dateInterval:dataHandler:", v14, v19, v28);
            objc_msgSend(WeakRetained, "healthStore");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "executeQuery:", v22);

          }
          ++v13;
        }
        while (v11 != v13);
        v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v57, 16);
      }
      while (v11);
    }

    _Block_object_dispose(&v38, 8);
    _Block_object_dispose(v53, 8);
    _Block_object_dispose(v55, 8);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }

}

void __78__HKLocationFetcher_fetchLocationsFromWorkout_workoutActivity_samplesHandler___block_invoke_191(uint64_t a1)
{
  id v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  HKLocationReadings *v11;
  HKLocationReadings *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (!--*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24))
  {
    v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v3 = *(id *)(a1 + 32);
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v14;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v14 != v6)
            objc_enumerationMutation(v3);
          v8 = *(void **)(a1 + 40);
          objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v7), "UUID", (_QWORD)v13);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "objectForKeyedSubscript:", v9);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v2, "addObjectsFromArray:", v10);

          ++v7;
        }
        while (v5 != v7);
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v5);
    }

    v11 = -[HKLocationReadings initWithLocations:workout:isSmoothed:]([HKLocationReadings alloc], "initWithLocations:workout:isSmoothed:", v2, *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 96));
    v12 = v11;
    if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40)
      && -[HKLocationReadings count](v11, "count")
      && (_shouldShowMapRoute(v12, *(void **)(a1 + 56)) & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 64), "_handleAndShiftLocations:forWorkout:withSamplesHandler:", v12, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 72));
    }
    else
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
    }

  }
}

void __78__HKLocationFetcher_fetchLocationsFromWorkout_workoutActivity_samplesHandler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, int a4, void *a5)
{
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  id v16;

  v16 = a3;
  v8 = a5;
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 32));
  if (v16)
  {
    v9 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "UUID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", v10);
    v11 = (id)objc_claimAutoreleasedReturnValue();

    if (!v11)
    {
      v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v12 = *(void **)(a1 + 32);
      objc_msgSend(*(id *)(a1 + 40), "UUID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setObject:forKeyedSubscript:", v11, v13);

    }
    objc_msgSend(v11, "addObjectsFromArray:", v16);
  }
  else
  {
    v14 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v15 = v8;
    v11 = *(id *)(v14 + 40);
    *(_QWORD *)(v14 + 40) = v15;
  }

  if (a4)
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 32));

}

- (BOOL)_routesAreSmoothed:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  int v16;
  BOOL v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v3 = a3;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v21;
    v7 = *MEMORY[0x1E0CB55D8];
    v8 = *MEMORY[0x1E0CB7398];
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v21 != v6)
          objc_enumerationMutation(v3);
        v10 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_msgSend(v10, "metadata", (_QWORD)v20);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKeyedSubscript:", v7);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "integerValue");

        objc_msgSend(v10, "metadata");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "objectForKeyedSubscript:", v8);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "BOOLValue");

        if (v13 <= 1 && v16 == 0)
        {
          v18 = 0;
          goto LABEL_14;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      if (v5)
        continue;
      break;
    }
  }
  v18 = 1;
LABEL_14:

  return v18;
}

- (void)_handleAndShiftLocations:(id)a3 forWorkout:(id)a4 withSamplesHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)MEMORY[0x1E0CB6FC0];
  objc_msgSend(v8, "allValidLocations");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v11) = objc_msgSend(v11, "isShiftRequiredForLocations:", v12);

  if ((v11 & 1) != 0)
  {
    -[HKLocationFetcher shifter](self, "shifter");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "allValidLocations");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __76__HKLocationFetcher__handleAndShiftLocations_forWorkout_withSamplesHandler___block_invoke;
    v15[3] = &unk_1E9C43C50;
    v16 = v9;
    v17 = v8;
    v18 = v10;
    objc_msgSend(v13, "shiftLocations:withCompletion:", v14, v15);

  }
  else
  {
    (*((void (**)(id, id))v10 + 2))(v10, v8);
  }

}

void __76__HKLocationFetcher__handleAndShiftLocations_forWorkout_withSamplesHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  HKLocationReadings *v4;

  v3 = a2;
  v4 = -[HKLocationReadings initWithLocations:workout:isSmoothed:]([HKLocationReadings alloc], "initWithLocations:workout:isSmoothed:", v3, *(_QWORD *)(a1 + 32), objc_msgSend(*(id *)(a1 + 40), "isSmoothed"));

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (void)fetchRoutesFromWorkout:(id)a3 withUpdateHandler:(id)a4
{
  id v6;
  id v7;
  HKAnchoredObjectQuery *v8;
  HKAnchoredObjectQuery *routesQuery;
  HKAnchoredObjectQuery *v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void *);
  void *v16;
  id v17;
  id v18;
  id v19;
  id location;

  v6 = a3;
  v7 = a4;
  -[HKLocationFetcher _workoutRoutesQueryForWorkout:withUpdateHandler:](self, "_workoutRoutesQueryForWorkout:withUpdateHandler:", v6, v7);
  v8 = (HKAnchoredObjectQuery *)objc_claimAutoreleasedReturnValue();
  routesQuery = self->_routesQuery;
  self->_routesQuery = v8;

  objc_initWeak(&location, self);
  v10 = self->_routesQuery;
  v13 = MEMORY[0x1E0C809B0];
  v14 = 3221225472;
  v15 = __62__HKLocationFetcher_fetchRoutesFromWorkout_withUpdateHandler___block_invoke;
  v16 = &unk_1E9C44520;
  v11 = v7;
  v18 = v11;
  v12 = v6;
  v17 = v12;
  objc_copyWeak(&v19, &location);
  -[HKAnchoredObjectQuery setUpdateHandler:](v10, "setUpdateHandler:", &v13);
  -[HKHealthStore executeQuery:](self->_healthStore, "executeQuery:", self->_routesQuery, v13, v14, v15, v16);
  objc_destroyWeak(&v19);

  objc_destroyWeak(&location);
}

void __62__HKLocationFetcher_fetchRoutesFromWorkout_withUpdateHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6)
{
  id v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  id *v19;
  id WeakRetained;
  void *v21;
  id v22;
  void *v23;
  int v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v7 = a6;
  _HKInitializeLogging();
  if (v7)
  {
    v8 = *MEMORY[0x1E0CB5260];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5260], OS_LOG_TYPE_ERROR))
      __62__HKLocationFetcher_fetchRoutesFromWorkout_withUpdateHandler___block_invoke_cold_1((uint64_t)v7, v8, v9, v10, v11, v12, v13, v14);
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    v15 = (void *)*MEMORY[0x1E0CB5380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_DEFAULT))
    {
      v16 = *(void **)(a1 + 32);
      v17 = v15;
      objc_msgSend(v16, "UUID");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 138543362;
      v25 = v18;
      _os_log_impl(&dword_1D7813000, v17, OS_LOG_TYPE_DEFAULT, "[routes] Update called; run location series query for workout %{public}@",
        (uint8_t *)&v24,
        0xCu);

    }
    v19 = (id *)(a1 + 48);
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    objc_msgSend(WeakRetained, "_workoutRoutesQueryForWorkout:withUpdateHandler:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    v22 = objc_loadWeakRetained(v19);
    objc_msgSend(v22, "healthStore");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "executeQuery:", v21);

  }
}

- (id)_workoutRoutesQueryForWorkout:(id)a3 withUpdateHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  id location;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0CB6A78], "predicateForObjectsFromWorkout:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB6B00], "dataTypeWithCode:", 102);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v10 = objc_alloc(MEMORY[0x1E0CB62C0]);
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __69__HKLocationFetcher__workoutRoutesQueryForWorkout_withUpdateHandler___block_invoke;
  v15[3] = &unk_1E9C44548;
  v11 = v7;
  v17 = v11;
  objc_copyWeak(&v18, &location);
  v12 = v6;
  v16 = v12;
  v13 = (void *)objc_msgSend(v10, "initWithType:predicate:anchor:limit:resultsHandler:", v9, v8, 0, 0, v15);

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);

  return v13;
}

void __69__HKLocationFetcher__workoutRoutesQueryForWorkout_withUpdateHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, void *a6)
{
  id v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(void);
  id WeakRetained;
  void *v19;
  char v20;
  void *v21;
  NSObject *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  int v30;
  uint64_t v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a6;
  if (v9)
  {
    _HKInitializeLogging();
    v10 = *MEMORY[0x1E0CB5260];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5260], OS_LOG_TYPE_ERROR))
      __69__HKLocationFetcher__workoutRoutesQueryForWorkout_withUpdateHandler___block_invoke_cold_1((uint64_t)v9, v10, v11, v12, v13, v14, v15, v16);
    goto LABEL_4;
  }
  if (!objc_msgSend(v8, "count"))
  {
LABEL_4:
    v17 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
    goto LABEL_5;
  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "routesStore");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "containsSameValuesAs:", v8);

  if ((v20 & 1) != 0)
    goto LABEL_6;
  _HKInitializeLogging();
  v21 = (void *)*MEMORY[0x1E0CB5380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_DEFAULT))
  {
    v22 = v21;
    v23 = objc_msgSend(v8, "count");
    objc_msgSend(v8, "firstObject");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "UUID");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "UUID");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = 134218498;
    v31 = v23;
    v32 = 2112;
    v33 = v25;
    v34 = 2114;
    v35 = v26;
    _os_log_impl(&dword_1D7813000, v22, OS_LOG_TYPE_DEFAULT, "[routes] Fetched %zd new samples (first: %@) for workout %{public}@", (uint8_t *)&v30, 0x20u);

  }
  objc_msgSend(*(id *)(a1 + 32), "sourceRevision");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "source");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "_isAppleWatch");

  v29 = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(v29, "_routesAreSmoothed:", v8);

  v17 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
LABEL_5:
  v17();
LABEL_6:

}

- (void)setShifter:(id)a3
{
  objc_storeStrong((id *)&self->_shifter, a3);
}

- (_HKWorkoutRouteStore)routesStore
{
  return self->_routesStore;
}

- (void)setRoutesStore:(id)a3
{
  objc_storeStrong((id *)&self->_routesStore, a3);
}

- (HKHealthStore)healthStore
{
  return self->_healthStore;
}

- (void)setHealthStore:(id)a3
{
  objc_storeStrong((id *)&self->_healthStore, a3);
}

- (HKAnchoredObjectQuery)routesQuery
{
  return self->_routesQuery;
}

- (void)setRoutesQuery:(id)a3
{
  objc_storeStrong((id *)&self->_routesQuery, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_routesQuery, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
  objc_storeStrong((id *)&self->_routesStore, 0);
  objc_storeStrong((id *)&self->_shifter, 0);
}

void __62__HKLocationFetcher_fetchRoutesFromWorkout_withUpdateHandler___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_1D7813000, a2, a3, "[routes] An error occurred while updating series samples for workout. %@", a5, a6, a7, a8, 2u);
}

void __69__HKLocationFetcher__workoutRoutesQueryForWorkout_withUpdateHandler___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_1D7813000, a2, a3, "[routes] Could not fetch series samples for workout. %@", a5, a6, a7, a8, 2u);
}

@end
