@implementation _HKWorkoutRouteStore

- (_HKWorkoutRouteStore)init
{
  _HKWorkoutRouteStore *v2;
  _HKWorkoutRouteStore *v3;
  uint64_t v4;
  OS_dispatch_queue *locationQueue;
  uint64_t v6;
  NSMutableDictionary *series;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)_HKWorkoutRouteStore;
  v2 = -[_HKWorkoutRouteStore init](&v9, sel_init);
  v3 = v2;
  if (v2)
  {
    HKCreateSerialDispatchQueue(v2, 0);
    v4 = objc_claimAutoreleasedReturnValue();
    locationQueue = v3->_locationQueue;
    v3->_locationQueue = (OS_dispatch_queue *)v4;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v6 = objc_claimAutoreleasedReturnValue();
    series = v3->_series;
    v3->_series = (NSMutableDictionary *)v6;

  }
  return v3;
}

- (BOOL)containsSameValuesAs:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  char v9;

  v4 = a3;
  -[_HKWorkoutRouteStore samples](self, "samples");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");
  if (v6 == objc_msgSend(v4, "count"))
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", v5);
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", v4);
    v9 = objc_msgSend(v7, "isEqualToSet:", v8);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (_HKWorkoutRouteStore)initWithHealthStore:(id)a3
{
  id v5;
  _HKWorkoutRouteStore *v6;
  uint64_t v7;
  NSMutableDictionary *locations;

  v5 = a3;
  v6 = -[_HKWorkoutRouteStore init](self, "init");
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v7 = objc_claimAutoreleasedReturnValue();
    locations = v6->_locations;
    v6->_locations = (NSMutableDictionary *)v7;

    objc_storeStrong((id *)&v6->_healthStore, a3);
  }

  return v6;
}

- (void)_setLocations:(id)a3 forUUID:(id)a4
{
  id v6;
  id v7;
  NSObject *locationQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  locationQueue = self->_locationQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46___HKWorkoutRouteStore__setLocations_forUUID___block_invoke;
  block[3] = &unk_1E37E6738;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_sync(locationQueue, block);

}

- (void)_queue_checkAndReturnIfLocationsLoaded
{
  int64_t v2;
  id v4;

  v2 = self->_loadingCount - 1;
  self->_loadingCount = v2;
  if (!v2 && self->_loadingCompletionBlock)
  {
    -[_HKWorkoutRouteStore _queue_locations](self, "_queue_locations");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "count"))
      (*((void (**)(void))self->_loadingCompletionBlock + 2))();

  }
}

- (void)setWorkoutRoutes:(id)a3
{
  id v4;
  NSObject *locationQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  locationQueue = self->_locationQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __41___HKWorkoutRouteStore_setWorkoutRoutes___block_invoke;
  v7[3] = &unk_1E37E6980;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(locationQueue, v7);

}

- (void)addWorkoutRoutes:(id)a3
{
  id v4;
  NSObject *locationQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  locationQueue = self->_locationQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __41___HKWorkoutRouteStore_addWorkoutRoutes___block_invoke;
  v7[3] = &unk_1E37E6980;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(locationQueue, v7);

}

- (void)_queue_addWorkoutRoutes:(id)a3
{
  id v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  NSMutableDictionary *series;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  NSMutableDictionary *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t buf[4];
  void *v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
  if (v5)
  {
    v7 = v5;
    v8 = *(_QWORD *)v21;
    *(_QWORD *)&v6 = 138412290;
    v19 = v6;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v21 != v8)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        series = self->_series;
        objc_msgSend(v10, "UUID", v19);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary objectForKeyedSubscript:](series, "objectForKeyedSubscript:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v13)
        {
          _HKInitializeLogging();
          v14 = (void *)HKLogWorkouts;
          if (os_log_type_enabled((os_log_t)HKLogWorkouts, OS_LOG_TYPE_DEFAULT))
          {
            v15 = v14;
            objc_msgSend(v10, "UUID");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v19;
            v25 = v16;
            _os_log_impl(&dword_19A0E6000, v15, OS_LOG_TYPE_DEFAULT, "[routes] Add routes %@ to workout route store.", buf, 0xCu);

          }
          v17 = self->_series;
          objc_msgSend(v10, "UUID");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary setObject:forKey:](v17, "setObject:forKey:", v10, v18);

        }
      }
      v7 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
    }
    while (v7);
  }

}

- (void)fetchAllLocationsWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id loadingCompletionBlock;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[_HKWorkoutRouteStore samples](self, "samples");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  self->_loadingCount = objc_msgSend(v5, "count");
  v6 = _Block_copy(v4);
  loadingCompletionBlock = self->_loadingCompletionBlock;
  self->_loadingCompletionBlock = v6;

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v14;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(v8);
        -[_HKWorkoutRouteStore _fetchAllLocationsFromSeriesSample:](self, "_fetchAllLocationsFromSeriesSample:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v12++), (_QWORD)v13);
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v10);
  }

}

- (void)_fetchAllLocationsFromSeriesSample:(id)a3
{
  id v4;
  void *v5;
  HKWorkoutRouteQuery *v6;
  id v7;
  id v8;
  HKWorkoutRouteQuery *v9;
  _QWORD v10[4];
  id v11;
  id v12;
  _HKWorkoutRouteStore *v13;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = [HKWorkoutRouteQuery alloc];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __59___HKWorkoutRouteStore__fetchAllLocationsFromSeriesSample___block_invoke;
  v10[3] = &unk_1E37F7E20;
  v11 = v4;
  v12 = v5;
  v13 = self;
  v7 = v5;
  v8 = v4;
  v9 = -[HKWorkoutRouteQuery initWithRoute:dataHandler:](v6, "initWithRoute:dataHandler:", v8, v10);
  -[HKHealthStore executeQuery:](self->_healthStore, "executeQuery:", v9);

}

- (id)samples
{
  NSObject *locationQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__60;
  v10 = __Block_byref_object_dispose__60;
  v11 = 0;
  locationQueue = self->_locationQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __31___HKWorkoutRouteStore_samples__block_invoke;
  v5[3] = &unk_1E37E6810;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(locationQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)_queue_locations
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSMutableDictionary *locations;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  -[NSMutableDictionary allValues](self->_series, "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sortedArrayUsingComparator:", &__block_literal_global_136);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        locations = self->_locations;
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v10), "UUID", (_QWORD)v15);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary objectForKeyedSubscript:](locations, "objectForKeyedSubscript:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v5, "addObjectsFromArray:", v13);
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_healthStore, 0);
  objc_storeStrong(&self->_loadingCompletionBlock, 0);
  objc_storeStrong((id *)&self->_locationQueue, 0);
  objc_storeStrong((id *)&self->_series, 0);
  objc_storeStrong((id *)&self->_locations, 0);
}

@end
