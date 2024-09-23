@implementation FIUIWorkoutDataProvider

- (FIUIWorkoutDataProvider)initWithHealthStore:(id)a3
{
  return -[FIUIWorkoutDataProvider initWithHealthStore:shouldSortAscending:](self, "initWithHealthStore:shouldSortAscending:", a3, 1);
}

- (FIUIWorkoutDataProvider)initWithHealthStore:(id)a3 shouldSortAscending:(BOOL)a4
{
  id v7;
  FIUIWorkoutDataProvider *v8;
  FIUIWorkoutDataProvider *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)FIUIWorkoutDataProvider;
  v8 = -[FIUIWorkoutDataProvider init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_healthStore, a3);
    v9->_shouldSortAscending = a4;
    -[FIUIWorkoutDataProvider _commonInit](v9, "_commonInit");
  }

  return v9;
}

- (FIUIWorkoutDataProvider)init
{

  return 0;
}

- (void)_commonInit
{
  HKHealthStore *v3;
  HKHealthStore *healthStore;
  NSMutableArray *v5;
  NSMutableArray *updateHandlers;
  NSCalendar *v7;
  NSCalendar *gregorianCalendar;
  NSCalendar *v9;
  void *v10;
  NSCalendar *v11;
  NSCalendar *currentCalendar;
  void *v13;

  if (!self->_healthStore)
  {
    v3 = (HKHealthStore *)objc_alloc_init(MEMORY[0x24BDD3C40]);
    healthStore = self->_healthStore;
    self->_healthStore = v3;

  }
  v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
  updateHandlers = self->_updateHandlers;
  self->_updateHandlers = v5;

  objc_msgSend(MEMORY[0x24BDBCE48], "calendarWithIdentifier:", *MEMORY[0x24BDBCA18]);
  v7 = (NSCalendar *)objc_claimAutoreleasedReturnValue();
  gregorianCalendar = self->_gregorianCalendar;
  self->_gregorianCalendar = v7;

  v9 = self->_gregorianCalendar;
  objc_msgSend(MEMORY[0x24BDBCF38], "systemTimeZone");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSCalendar setTimeZone:](v9, "setTimeZone:", v10);

  objc_msgSend(MEMORY[0x24BDBCE48], "autoupdatingCurrentCalendar");
  v11 = (NSCalendar *)objc_claimAutoreleasedReturnValue();
  currentCalendar = self->_currentCalendar;
  self->_currentCalendar = v11;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addObserver:selector:name:object:", self, sel__timeZoneDidChange_, *MEMORY[0x24BDBCBC0], 0);

  self->_lock._os_unfair_lock_opaque = 0;
}

- (void)_timeZoneDidChange:(id)a3
{
  NSCalendar *gregorianCalendar;
  id v4;

  gregorianCalendar = self->_gregorianCalendar;
  objc_msgSend(MEMORY[0x24BDBCF38], "systemTimeZone", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[NSCalendar setTimeZone:](gregorianCalendar, "setTimeZone:", v4);

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)FIUIWorkoutDataProvider;
  -[FIUIWorkoutDataProvider dealloc](&v4, sel_dealloc);
}

- (BOOL)hasWorkouts
{
  FIUIWorkoutDataProvider *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = -[NSMutableDictionary count](v2->_workoutsByDay, "count") != 0;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (id)workoutsForDay:(id)a3
{
  uint64_t v4;
  os_unfair_lock_s *p_lock;
  NSMutableDictionary *workoutsByDay;
  void *v7;
  void *v8;
  void *v9;

  v4 = _HKCacheIndexFromDateComponents();
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  workoutsByDay = self->_workoutsByDay;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](workoutsByDay, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_lock);
  objc_msgSend(v8, "allSamples");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)allWorkouts
{
  os_unfair_lock_s *p_lock;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", -[NSMutableDictionary count](self->_workoutsByDay, "count"));
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[NSMutableDictionary allKeys](self->_workoutsByDay, "allKeys", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_workoutsByDay, "objectForKeyedSubscript:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "allSamples");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setObject:forKey:", v12, v10);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }

  os_unfair_lock_unlock(p_lock);
  v13 = (void *)objc_msgSend(v4, "copy");

  return v13;
}

- (void)startFetchingFromDate:(id)a3
{
  os_unfair_lock_s *p_lock;
  NSMutableDictionary *v5;
  NSMutableDictionary *workoutsByDay;
  id v7;

  p_lock = &self->_lock;
  v7 = a3;
  os_unfair_lock_lock(p_lock);
  v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
  workoutsByDay = self->_workoutsByDay;
  self->_workoutsByDay = v5;

  os_unfair_lock_unlock(p_lock);
  -[FIUIWorkoutDataProvider stopFetching](self, "stopFetching");
  -[FIUIWorkoutDataProvider _fetchAllWorkoutsFromDate:](self, "_fetchAllWorkoutsFromDate:", v7);

}

- (void)stopFetching
{
  if (self->_currentWorkoutAnchoredObjectQuery)
    -[HKHealthStore stopQuery:](self->_healthStore, "stopQuery:");
}

- (void)_fetchAllWorkoutsFromDate:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  HKAnchoredObjectQuery *v15;
  HKAnchoredObjectQuery *currentWorkoutAnchoredObjectQuery;
  _QWORD v17[4];
  id v18;
  id v19;
  _QWORD aBlock[4];
  id v21;
  id v22;
  id v23;
  id location;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v6 = MEMORY[0x24BDAC760];
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __53__FIUIWorkoutDataProvider__fetchAllWorkoutsFromDate___block_invoke;
  aBlock[3] = &unk_24CF31670;
  objc_copyWeak(&v23, &location);
  v7 = v4;
  v21 = v7;
  v8 = v5;
  v22 = v8;
  v9 = _Block_copy(aBlock);
  v17[0] = v6;
  v17[1] = 3221225472;
  v17[2] = __53__FIUIWorkoutDataProvider__fetchAllWorkoutsFromDate___block_invoke_196;
  v17[3] = &unk_24CF31698;
  objc_copyWeak(&v19, &location);
  v10 = v7;
  v18 = v10;
  v11 = _Block_copy(v17);
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("endDate >= %@"), v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_alloc(MEMORY[0x24BDD3920]);
  objc_msgSend(MEMORY[0x24BDD3DC0], "workoutType");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (HKAnchoredObjectQuery *)objc_msgSend(v13, "initWithType:predicate:anchor:limit:resultsHandler:", v14, v12, 0, 0, v9);
  currentWorkoutAnchoredObjectQuery = self->_currentWorkoutAnchoredObjectQuery;
  self->_currentWorkoutAnchoredObjectQuery = v15;

  -[HKAnchoredObjectQuery setUpdateHandler:](self->_currentWorkoutAnchoredObjectQuery, "setUpdateHandler:", v11);
  -[HKHealthStore executeQuery:](self->_healthStore, "executeQuery:", self->_currentWorkoutAnchoredObjectQuery);

  objc_destroyWeak(&v19);
  objc_destroyWeak(&v23);
  objc_destroyWeak(&location);

}

void __53__FIUIWorkoutDataProvider__fetchAllWorkoutsFromDate___block_invoke(id *a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, void *a6)
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD block[4];
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;

  v8 = a3;
  v9 = a6;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __53__FIUIWorkoutDataProvider__fetchAllWorkoutsFromDate___block_invoke_2;
  block[3] = &unk_24CF31648;
  objc_copyWeak(&v17, a1 + 6);
  v13 = v9;
  v14 = a1[4];
  v15 = v8;
  v16 = a1[5];
  v10 = v8;
  v11 = v9;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

  objc_destroyWeak(&v17);
}

void __53__FIUIWorkoutDataProvider__fetchAllWorkoutsFromDate___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained)
  {
    v3 = *(_QWORD *)(a1 + 32);
    _HKInitializeLogging();
    v4 = *MEMORY[0x24BDD2FA8];
    v5 = *MEMORY[0x24BDD2FA8];
    if (v3)
    {
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        __53__FIUIWorkoutDataProvider__fetchAllWorkoutsFromDate___block_invoke_2_cold_1(a1 + 32, v4, v6, v7, v8, v9, v10, v11);
      objc_msgSend(WeakRetained, "_retryQueryOnDidBecomeActiveWithDate:", *(_QWORD *)(a1 + 40));
    }
    else
    {
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        v12 = (void *)MEMORY[0x24BDD16E0];
        v13 = *(void **)(a1 + 48);
        v14 = v4;
        objc_msgSend(v12, "numberWithUnsignedInteger:", objc_msgSend(v13, "count"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = (void *)MEMORY[0x24BDD16E0];
        objc_msgSend(MEMORY[0x24BDBCE60], "date");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 56));
        objc_msgSend(v16, "numberWithDouble:");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = 138412546;
        v20 = v15;
        v21 = 2112;
        v22 = v18;
        _os_log_impl(&dword_21307C000, v14, OS_LOG_TYPE_DEFAULT, "FIUIWorkoutDataProvider - fetched %@ workouts in %@ seconds", (uint8_t *)&v19, 0x16u);

      }
      if (objc_msgSend(*(id *)(a1 + 48), "count"))
      {
        objc_msgSend(WeakRetained, "_handleAddedSamples:", *(_QWORD *)(a1 + 48));
        objc_msgSend(WeakRetained, "_runUpdateHandlers");
      }
    }
  }

}

void __53__FIUIWorkoutDataProvider__fetchAllWorkoutsFromDate___block_invoke_196(uint64_t a1, uint64_t a2, void *a3, void *a4, uint64_t a5, void *a6)
{
  id v9;
  id v10;
  id v11;
  id WeakRetained;
  NSObject *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  NSObject *v22;
  void *v23;
  _QWORD block[5];
  id v25;
  id v26;
  uint8_t buf[4];
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v11 = a6;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  _HKInitializeLogging();
  v13 = *MEMORY[0x24BDD2FA8];
  v14 = *MEMORY[0x24BDD2FA8];
  if (v11)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      __53__FIUIWorkoutDataProvider__fetchAllWorkoutsFromDate___block_invoke_196_cold_1((uint64_t)v11, v13, v15, v16, v17, v18, v19, v20);
    objc_msgSend(WeakRetained, "_retryQueryOnDidBecomeActiveWithDate:", *(_QWORD *)(a1 + 32));
  }
  else
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v21 = (void *)MEMORY[0x24BDD16E0];
      v22 = v13;
      objc_msgSend(v21, "numberWithUnsignedInteger:", objc_msgSend(v9, "count"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v28 = v23;
      _os_log_impl(&dword_21307C000, v22, OS_LOG_TYPE_DEFAULT, "FIUIWorkoutDataProvider - fetched %@ updated workouts", buf, 0xCu);

    }
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __53__FIUIWorkoutDataProvider__fetchAllWorkoutsFromDate___block_invoke_197;
    block[3] = &unk_24CF30628;
    block[4] = WeakRetained;
    v25 = v10;
    v26 = v9;
    dispatch_async(MEMORY[0x24BDAC9B8], block);

  }
}

uint64_t __53__FIUIWorkoutDataProvider__fetchAllWorkoutsFromDate___block_invoke_197(uint64_t result)
{
  uint64_t v1;
  NSObject *v2;
  uint8_t v3[16];

  if (!*(_QWORD *)(result + 32))
    return result;
  v1 = result;
  if (objc_msgSend(*(id *)(result + 40), "count"))
  {
    objc_msgSend(*(id *)(v1 + 32), "_handleRemovedObjects:", *(_QWORD *)(v1 + 40));
    if (!objc_msgSend(*(id *)(v1 + 48), "count"))
      goto LABEL_7;
  }
  else
  {
    result = objc_msgSend(*(id *)(v1 + 48), "count");
    if (!result)
      return result;
  }
  objc_msgSend(*(id *)(v1 + 32), "_handleAddedSamples:", *(_QWORD *)(v1 + 48));
LABEL_7:
  _HKInitializeLogging();
  v2 = *MEMORY[0x24BDD2FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FA8], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_21307C000, v2, OS_LOG_TYPE_DEFAULT, "FIUIWorkoutDataProvider - workouts did update. Running update handlers", v3, 2u);
  }
  return objc_msgSend(*(id *)(v1 + 32), "_runUpdateHandlers");
}

- (void)addUpdateHandler:(id)a3
{
  NSMutableArray *updateHandlers;
  id v4;

  updateHandlers = self->_updateHandlers;
  v4 = _Block_copy(a3);
  -[NSMutableArray addObject:](updateHandlers, "addObject:", v4);

}

- (void)_runUpdateHandlers
{
  NSMutableArray *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = self->_updateHandlers;
  v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v7 + 1) + 8 * v6) + 16))(*(_QWORD *)(*((_QWORD *)&v7 + 1) + 8 * v6));
        ++v6;
      }
      while (v4 != v6);
      v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (void)_handleAddedSamples:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  NSCalendar *gregorianCalendar;
  void *v13;
  void *v14;
  uint64_t v15;
  NSMutableDictionary *workoutsByDay;
  void *v17;
  id v18;
  void *v19;
  NSMutableDictionary *v20;
  void *v21;
  void *v22;
  os_unfair_lock_t lock;
  id obj;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  void *v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  obj = v4;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v26 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        objc_msgSend(v9, "sourceRevision", lock);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "productType");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "_setIsWatchWorkout:", objc_msgSend(v11, "containsString:", CFSTR("Watch")));

        gregorianCalendar = self->_gregorianCalendar;
        objc_msgSend(v9, "endDate");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSCalendar hk_activitySummaryDateComponentsFromDate:](gregorianCalendar, "hk_activitySummaryDateComponentsFromDate:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        v15 = _HKCacheIndexFromDateComponents();
        workoutsByDay = self->_workoutsByDay;
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", v15);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary objectForKeyedSubscript:](workoutsByDay, "objectForKeyedSubscript:", v17);
        v18 = (id)objc_claimAutoreleasedReturnValue();

        if (!v18)
        {
          v18 = objc_alloc_init(MEMORY[0x24BDD3FB8]);
          objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", CFSTR("endDate"), self->_shouldSortAscending);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "setSortDescriptor:", v19);

          v20 = self->_workoutsByDay;
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", v15);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary setObject:forKey:](v20, "setObject:forKey:", v18, v21);

        }
        v29 = v9;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v29, 1);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "insertSamples:", v22);

      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    }
    while (v6);
  }

  os_unfair_lock_unlock(lock);
}

- (void)_handleRemovedObjects:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  os_unfair_lock_s *p_lock;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v23;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v23 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * v10), "UUID");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    }
    while (v8);
  }

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[NSMutableDictionary allValues](self->_workoutsByDay, "allValues", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
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
        objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v17++), "removeSamplesWithUUIDs:", v5);
      }
      while (v15 != v17);
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
    }
    while (v15);
  }

  os_unfair_lock_unlock(p_lock);
}

- (void)_retryQueryOnDidBecomeActiveWithDate:(id)a3
{
  NSDate *v4;
  NSObject *v5;
  NSDate *retryDate;
  NSDate *v7;
  void *v8;
  uint8_t v9[16];

  v4 = (NSDate *)a3;
  _HKInitializeLogging();
  v5 = *MEMORY[0x24BDD2FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FA8], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_21307C000, v5, OS_LOG_TYPE_DEFAULT, "FIUIWorkoutDataProvider - will retry query on did become active", v9, 2u);
  }
  retryDate = self->_retryDate;
  self->_retryDate = v4;
  v7 = v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObserver:selector:name:object:", self, sel__retryQuery_, *MEMORY[0x24BEBDF88], 0);

}

- (void)_retryQuery:(id)a3
{
  NSObject *v4;
  void *v5;
  uint8_t v6[16];

  _HKInitializeLogging();
  v4 = *MEMORY[0x24BDD2FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FA8], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_21307C000, v4, OS_LOG_TYPE_DEFAULT, "FIUIWorkoutDataProvider - did become active; retrying query",
      v6,
      2u);
  }
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:name:object:", self, *MEMORY[0x24BEBDF88], 0);

  os_unfair_lock_lock(&self->_lock);
  -[NSMutableDictionary removeAllObjects](self->_workoutsByDay, "removeAllObjects");
  os_unfair_lock_unlock(&self->_lock);
  -[FIUIWorkoutDataProvider _fetchAllWorkoutsFromDate:](self, "_fetchAllWorkoutsFromDate:", self->_retryDate);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_retryDate, 0);
  objc_storeStrong((id *)&self->_currentCalendar, 0);
  objc_storeStrong((id *)&self->_gregorianCalendar, 0);
  objc_storeStrong((id *)&self->_currentWorkoutAnchoredObjectQuery, 0);
  objc_storeStrong((id *)&self->_updateHandlers, 0);
  objc_storeStrong((id *)&self->_workoutsByDay, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
}

void __53__FIUIWorkoutDataProvider__fetchAllWorkoutsFromDate___block_invoke_2_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_21307C000, a2, a3, "Error fetching workouts: %@", a5, a6, a7, a8, 2u);
}

void __53__FIUIWorkoutDataProvider__fetchAllWorkoutsFromDate___block_invoke_196_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_21307C000, a2, a3, "Error updating workouts: %@", a5, a6, a7, a8, 2u);
}

@end
