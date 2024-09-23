@implementation HKWorkoutRouteStore

uint64_t __46___HKWorkoutRouteStore__setLocations_forUUID___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setObject:forKey:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  return objc_msgSend(*(id *)(a1 + 32), "_queue_checkAndReturnIfLocationsLoaded");
}

uint64_t __41___HKWorkoutRouteStore_setWorkoutRoutes___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "removeAllObjects");
  return objc_msgSend(*(id *)(a1 + 32), "_queue_addWorkoutRoutes:", *(_QWORD *)(a1 + 40));
}

uint64_t __41___HKWorkoutRouteStore_addWorkoutRoutes___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_addWorkoutRoutes:", *(_QWORD *)(a1 + 40));
}

void __59___HKWorkoutRouteStore__fetchAllLocationsFromSeriesSample___block_invoke(uint64_t a1, void *a2, void *a3, int a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  _DWORD v20[2];
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v9 = a2;
  v10 = a3;
  v11 = a5;
  if (v11)
  {
    _HKInitializeLogging();
    v12 = HKLogWorkouts;
    if (os_log_type_enabled((os_log_t)HKLogWorkouts, OS_LOG_TYPE_ERROR))
      __59___HKWorkoutRouteStore__fetchAllLocationsFromSeriesSample___block_invoke_cold_1(a1, (uint64_t)v11, v12);
  }
  objc_msgSend(*(id *)(a1 + 40), "addObjectsFromArray:", v10);
  if (a4)
  {
    _HKInitializeLogging();
    v13 = (void *)HKLogWorkouts;
    if (os_log_type_enabled((os_log_t)HKLogWorkouts, OS_LOG_TYPE_DEFAULT))
    {
      v14 = *(void **)(a1 + 40);
      v15 = v13;
      LODWORD(v14) = objc_msgSend(v14, "count");
      objc_msgSend(*(id *)(a1 + 32), "UUID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v20[0] = 67109378;
      v20[1] = (_DWORD)v14;
      v21 = 2112;
      v22 = v16;
      _os_log_impl(&dword_19A0E6000, v15, OS_LOG_TYPE_DEFAULT, "[routes] Fetched %d locations for series: %@. ", (uint8_t *)v20, 0x12u);

    }
    v18 = *(_QWORD *)(a1 + 40);
    v17 = *(void **)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 32), "UUID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "_setLocations:forUUID:", v18, v19);

  }
}

void __31___HKWorkoutRouteStore_samples__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "allValues");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

uint64_t __40___HKWorkoutRouteStore__queue_locations__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "startDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "startDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

void __59___HKWorkoutRouteStore__fetchAllLocationsFromSeriesSample___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = 138412546;
  v5 = v3;
  v6 = 2112;
  v7 = a2;
  _os_log_error_impl(&dword_19A0E6000, log, OS_LOG_TYPE_ERROR, "[routes] Error occurred while querying locations for series %@: %@", (uint8_t *)&v4, 0x16u);
}

@end
