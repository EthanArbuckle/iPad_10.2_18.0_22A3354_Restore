@implementation FIUIActivityDataProvider

- (FIUIActivityDataProvider)init
{
  FIUIActivityDataProvider *v2;
  uint64_t v3;
  HKUnit *kcalUnit;
  uint64_t v5;
  HKUnit *minuteUnit;
  uint64_t v7;
  HKUnit *countUnit;
  NSObject *v9;
  dispatch_queue_t v10;
  OS_dispatch_queue *queue;
  NSObject *v12;
  FIUIActivityDataProvider *v13;
  dispatch_queue_t v14;
  OS_dispatch_queue *subscriber_queue;
  uint64_t v16;
  NSHashTable *subscribers;
  void *v18;
  FIFitnessAppsStateObserver *v19;
  FIFitnessAppsStateObserver *fitnessAppsStateObserver;
  _QWORD block[4];
  FIUIActivityDataProvider *v23;
  objc_super v24;

  v24.receiver = self;
  v24.super_class = (Class)FIUIActivityDataProvider;
  v2 = -[FIUIActivityDataProvider init](&v24, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDD4048], "kilocalorieUnit");
    v3 = objc_claimAutoreleasedReturnValue();
    kcalUnit = v2->_kcalUnit;
    v2->_kcalUnit = (HKUnit *)v3;

    objc_msgSend(MEMORY[0x24BDD4048], "minuteUnit");
    v5 = objc_claimAutoreleasedReturnValue();
    minuteUnit = v2->_minuteUnit;
    v2->_minuteUnit = (HKUnit *)v5;

    objc_msgSend(MEMORY[0x24BDD4048], "countUnit");
    v7 = objc_claimAutoreleasedReturnValue();
    countUnit = v2->_countUnit;
    v2->_countUnit = (HKUnit *)v7;

    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = dispatch_queue_create("com.apple.nanolifestyle.activity.cacheaccess", v9);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v10;

    v12 = v2->_queue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __32__FIUIActivityDataProvider_init__block_invoke;
    block[3] = &unk_24CF30600;
    v13 = v2;
    v23 = v13;
    dispatch_async(v12, block);
    v14 = dispatch_queue_create("com.apple.nanolifestyle.activity.subscriberaccess", v9);
    subscriber_queue = v13->_subscriber_queue;
    v13->_subscriber_queue = (OS_dispatch_queue *)v14;

    objc_msgSend(MEMORY[0x24BDD15C0], "weakObjectsHashTable");
    v16 = objc_claimAutoreleasedReturnValue();
    subscribers = v13->_subscribers;
    v13->_subscribers = (NSHashTable *)v16;

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addObserver:selector:name:object:", v13, sel__handleTimeChange, *MEMORY[0x24BEBDFF0], 0);
    objc_msgSend(v18, "addObserver:selector:name:object:", v13, sel__handleTimeChange, *MEMORY[0x24BDBC9E8], 0);
    v19 = (FIFitnessAppsStateObserver *)objc_alloc_init(MEMORY[0x24BE32800]);
    fitnessAppsStateObserver = v13->_fitnessAppsStateObserver;
    v13->_fitnessAppsStateObserver = v19;

    -[FIFitnessAppsStateObserver setDelegate:](v13->_fitnessAppsStateObserver, "setDelegate:", v13);
    v13->_areFitnessAppsRestricted = -[FIFitnessAppsStateObserver areFitnessAppsRestricted](v13->_fitnessAppsStateObserver, "areFitnessAppsRestricted");

  }
  return v2;
}

void __32__FIUIActivityDataProvider_init__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDD3C40], "fiui_sharedHealthStoreForCarousel");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 8);
  *(_QWORD *)(v3 + 8) = v2;

}

- (void)dealloc
{
  void *v3;
  FIFitnessAppsStateObserver *fitnessAppsStateObserver;
  objc_super v5;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  fitnessAppsStateObserver = self->_fitnessAppsStateObserver;
  self->_fitnessAppsStateObserver = 0;

  v5.receiver = self;
  v5.super_class = (Class)FIUIActivityDataProvider;
  -[FIUIActivityDataProvider dealloc](&v5, sel_dealloc);
}

+ (id)sharedModel
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __39__FIUIActivityDataProvider_sharedModel__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedModel_onceToken != -1)
    dispatch_once(&sharedModel_onceToken, block);
  return (id)sharedModel___sharedModel;
}

void __39__FIUIActivityDataProvider_sharedModel__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedModel___sharedModel;
  sharedModel___sharedModel = v0;

}

- (void)addSubscriber:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  NSObject *subscriber_queue;
  id v8;
  id v9;
  _QWORD block[5];
  id v11;
  id v12;
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  _HKInitializeLogging();
  v6 = *MEMORY[0x24BDD2FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FA8], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v14 = v5;
    _os_log_impl(&dword_21307C000, v6, OS_LOG_TYPE_DEFAULT, "Timeline model adding subscriber: %@", buf, 0xCu);
  }
  subscriber_queue = self->_subscriber_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __42__FIUIActivityDataProvider_addSubscriber___block_invoke;
  block[3] = &unk_24CF30628;
  block[4] = self;
  v11 = v4;
  v12 = v5;
  v8 = v5;
  v9 = v4;
  dispatch_async(subscriber_queue, block);

}

void __42__FIUIActivityDataProvider_addSubscriber___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  _QWORD v10[5];
  _QWORD block[6];
  __int128 buf;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "containsObject:", *(_QWORD *)(a1 + 40)) & 1) == 0)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "anyObject");
    v2 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "addObject:", *(_QWORD *)(a1 + 40));
    _HKInitializeLogging();
    v3 = *MEMORY[0x24BDD2FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FA8], OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(_QWORD *)(a1 + 48);
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v4;
      _os_log_impl(&dword_21307C000, v3, OS_LOG_TYPE_DEFAULT, "Timeline model: Subscriber <%@> added.", (uint8_t *)&buf, 0xCu);
    }
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v13 = 0x3032000000;
    v14 = __Block_byref_object_copy__1;
    v15 = __Block_byref_object_dispose__1;
    v16 = 0;
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(NSObject **)(v5 + 48);
    v7 = MEMORY[0x24BDAC760];
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __42__FIUIActivityDataProvider_addSubscriber___block_invoke_194;
    block[3] = &unk_24CF31C20;
    block[4] = v5;
    block[5] = &buf;
    dispatch_sync(v6, block);
    objc_msgSend(*(id *)(a1 + 32), "_broadcastCurrentModelUpdate:toSubscriber:", *(_QWORD *)(*((_QWORD *)&buf + 1) + 40), *(_QWORD *)(a1 + 40));
    if (!v2)
    {
      v8 = *(_QWORD *)(a1 + 32);
      v9 = *(NSObject **)(v8 + 48);
      v10[0] = v7;
      v10[1] = 3221225472;
      v10[2] = __42__FIUIActivityDataProvider_addSubscriber___block_invoke_2;
      v10[3] = &unk_24CF30600;
      v10[4] = v8;
      dispatch_async(v9, v10);
    }
    _Block_object_dispose(&buf, 8);

  }
}

void __42__FIUIActivityDataProvider_addSubscriber___block_invoke_194(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_queue_activityDataModelFromCurrentActivitySummary");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

uint64_t __42__FIUIActivityDataProvider_addSubscriber___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  _HKInitializeLogging();
  v2 = *MEMORY[0x24BDD2FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FA8], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_21307C000, v2, OS_LOG_TYPE_DEFAULT, "Timeline model: First subscriber added to activity data provider, starting queries", v4, 2u);
  }
  return objc_msgSend(*(id *)(a1 + 32), "_queue_startQueries");
}

- (void)removeSubscriber:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *subscriber_queue;
  _QWORD block[5];
  uint8_t buf[4];
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  _HKInitializeLogging();
  v5 = *MEMORY[0x24BDD2FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FA8], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v9 = v4;
    _os_log_impl(&dword_21307C000, v5, OS_LOG_TYPE_DEFAULT, "Timeline model removing subscriber: %@", buf, 0xCu);
  }
  subscriber_queue = self->_subscriber_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __45__FIUIActivityDataProvider_removeSubscriber___block_invoke;
  block[3] = &unk_24CF30600;
  block[4] = self;
  dispatch_async(subscriber_queue, block);

}

void __45__FIUIActivityDataProvider_removeSubscriber___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  NSObject *v4;
  _QWORD block[5];

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "anyObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2)
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(NSObject **)(v3 + 48);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __45__FIUIActivityDataProvider_removeSubscriber___block_invoke_2;
    block[3] = &unk_24CF30600;
    block[4] = v3;
    dispatch_async(v4, block);
  }
}

uint64_t __45__FIUIActivityDataProvider_removeSubscriber___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  _HKInitializeLogging();
  v2 = *MEMORY[0x24BDD2FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FA8], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_21307C000, v2, OS_LOG_TYPE_DEFAULT, "Timeline model: Last subscriber removed from activity data provider, stopping queries", v4, 2u);
  }
  return objc_msgSend(*(id *)(a1 + 32), "_queue_stopQueriesPreservingExistingGoals:", 0);
}

- (id)switcherActivityDataModel
{
  NSObject *queue;
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
  v9 = __Block_byref_object_copy__1;
  v10 = __Block_byref_object_dispose__1;
  v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __53__FIUIActivityDataProvider_switcherActivityDataModel__block_invoke;
  v5[3] = &unk_24CF31C20;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __53__FIUIActivityDataProvider_switcherActivityDataModel__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_queue_activityDataModelFromCurrentActivitySummary");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)getCurrentActivityDataModelWithHandler:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __67__FIUIActivityDataProvider_getCurrentActivityDataModelWithHandler___block_invoke;
  v7[3] = &unk_24CF31C48;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

void __67__FIUIActivityDataProvider_getCurrentActivityDataModelWithHandler___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "_queue_activityDataModelFromCurrentActivitySummary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __67__FIUIActivityDataProvider_getCurrentActivityDataModelWithHandler___block_invoke_2;
  v5[3] = &unk_24CF30588;
  v3 = *(id *)(a1 + 40);
  v6 = v2;
  v7 = v3;
  v4 = v2;
  dispatch_async(MEMORY[0x24BDAC9B8], v5);

}

uint64_t __67__FIUIActivityDataProvider_getCurrentActivityDataModelWithHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (id)_currentActivitySummaryQueryCollectionIntervalsOverride
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[4];
  _QWORD v9[5];

  v9[4] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD3DC0], "quantityTypeForIdentifier:", *MEMORY[0x24BDD3340]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v2;
  v9[0] = &unk_24CF50420;
  objc_msgSend(MEMORY[0x24BDD3DC0], "quantityTypeForIdentifier:", *MEMORY[0x24BDD3350]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v3;
  v9[1] = &unk_24CF50420;
  objc_msgSend(MEMORY[0x24BDD3DC0], "quantityTypeForIdentifier:", *MEMORY[0x24BDD3348]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[2] = v4;
  v9[2] = &unk_24CF50420;
  objc_msgSend(MEMORY[0x24BDD3DC0], "categoryTypeForIdentifier:", *MEMORY[0x24BDD2858]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[3] = v5;
  v9[3] = &unk_24CF50420;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, v8, 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)_queue_restartQueriesIfQueryInUse:(id)a3
{
  _BOOL8 v4;

  v4 = self->_queue_currentActivityCacheQuery == a3 || self->_queue_currentActivitySummaryQuery == a3;
  -[FIUIActivityDataProvider _queue_restartQueriesPreservingExistingGoals:](self, "_queue_restartQueriesPreservingExistingGoals:", v4);
}

- (void)_queue_restartQueriesPreservingExistingGoals:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  uint8_t v6[16];

  v3 = a3;
  _HKInitializeLogging();
  v5 = *MEMORY[0x24BDD2FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FA8], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_21307C000, v5, OS_LOG_TYPE_DEFAULT, "Timeline model restarting queries", v6, 2u);
  }
  -[FIUIActivityDataProvider _queue_stopQueriesPreservingExistingGoals:](self, "_queue_stopQueriesPreservingExistingGoals:", v3);
  -[FIUIActivityDataProvider _queue_startQueries](self, "_queue_startQueries");
}

- (BOOL)_loadingStateForActivitySummary:(id)a3
{
  id v3;
  void *v4;
  NSObject *v5;
  _DWORD v7[2];
  __int16 v8;
  id v9;
  __int16 v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  _HKInitializeLogging();
  v4 = (void *)*MEMORY[0x24BDD2FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FA8], OS_LOG_TYPE_DEFAULT))
  {
    v5 = v4;
    v7[0] = 67109634;
    v7[1] = v3 == 0;
    v8 = 2112;
    v9 = v3;
    v10 = 1024;
    v11 = objc_msgSend(v3, "_isDataLoading");
    _os_log_impl(&dword_21307C000, v5, OS_LOG_TYPE_DEFAULT, "databaseLoading?:%u activitySummary:%@ [activitySummary _isDataLoading]:%u", (uint8_t *)v7, 0x18u);

  }
  return v3 == 0;
}

- (BOOL)_isPausedForActivitySummary:(id)a3
{
  return objc_msgSend(a3, "paused");
}

- (id)_queue_activityDataModelFromCurrentActivitySummary
{
  HKActivitySummary *v3;
  FIUIActivityDataModel *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  NSArray *v25;
  NSArray *queue_currentActiveEnergyChartData;
  NSArray *queue_currentMoveTimeChartData;
  NSArray *queue_currentExerciseChartData;
  NSArray *queue_currentStandChartData;
  void *v30;

  v3 = self->_queue_currentActivitySummary;
  v4 = objc_alloc_init(FIUIActivityDataModel);
  -[HKActivitySummary activeEnergyBurned](v3, "activeEnergyBurned");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKActivitySummary activeEnergyBurnedGoal](v3, "activeEnergyBurnedGoal");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKActivitySummary appleMoveMinutes](v3, "appleMoveMinutes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "doubleValueForUnit:", self->_minuteUnit);
  v9 = v8;

  -[HKActivitySummary appleMoveMinutesGoal](v3, "appleMoveMinutesGoal");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "doubleValueForUnit:", self->_minuteUnit);
  v12 = v11;

  -[HKActivitySummary appleExerciseTime](v3, "appleExerciseTime");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "doubleValueForUnit:", self->_minuteUnit);
  v15 = v14;

  -[HKActivitySummary appleExerciseTimeGoal](v3, "appleExerciseTimeGoal");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "doubleValueForUnit:", self->_minuteUnit);
  v18 = v17;

  -[HKActivitySummary appleStandHours](v3, "appleStandHours");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "doubleValueForUnit:", self->_countUnit);
  v21 = v20;

  -[HKActivitySummary appleStandHoursGoal](v3, "appleStandHoursGoal");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "doubleValueForUnit:", self->_countUnit);
  v24 = v23;

  -[FIUIActivityDataModel setActivityMoveMode:](v4, "setActivityMoveMode:", -[HKActivitySummary _activityMoveMode](v3, "_activityMoveMode"));
  -[FIUIActivityDataModel setActiveEnergyTotal:](v4, "setActiveEnergyTotal:", v5);
  -[FIUIActivityDataModel setActiveEnergyGoal:](v4, "setActiveEnergyGoal:", v6);
  -[FIUIActivityDataModel setAppleMoveTimeTotal:](v4, "setAppleMoveTimeTotal:", v9);
  -[FIUIActivityDataModel setAppleMoveTimeGoal:](v4, "setAppleMoveTimeGoal:", v12);
  -[FIUIActivityDataModel setAppleExerciseTimeTotal:](v4, "setAppleExerciseTimeTotal:", v15);
  -[FIUIActivityDataModel setAppleExerciseTimeGoal:](v4, "setAppleExerciseTimeGoal:", v18);
  -[FIUIActivityDataModel setAppleStandHoursTotal:](v4, "setAppleStandHoursTotal:", (uint64_t)v21);
  -[FIUIActivityDataModel setAppleStandHoursGoal:](v4, "setAppleStandHoursGoal:", (uint64_t)v24);
  -[FIUIActivityDataModel setWheelchairUser:](v4, "setWheelchairUser:", -[HKActivitySummary _wheelchairUse](v3, "_wheelchairUse") == 2);
  -[FIUIActivityDataModel setPaused:](v4, "setPaused:", -[FIUIActivityDataProvider _isPausedForActivitySummary:](self, "_isPausedForActivitySummary:", v3));
  v25 = (NSArray *)MEMORY[0x24BDBD1A8];
  if (self->_queue_currentActiveEnergyChartData)
    queue_currentActiveEnergyChartData = self->_queue_currentActiveEnergyChartData;
  else
    queue_currentActiveEnergyChartData = (NSArray *)MEMORY[0x24BDBD1A8];
  -[FIUIActivityDataModel setActiveEnergyChartData:](v4, "setActiveEnergyChartData:", queue_currentActiveEnergyChartData);
  if (self->_queue_currentMoveTimeChartData)
    queue_currentMoveTimeChartData = self->_queue_currentMoveTimeChartData;
  else
    queue_currentMoveTimeChartData = v25;
  -[FIUIActivityDataModel setAppleMoveTimeChartData:](v4, "setAppleMoveTimeChartData:", queue_currentMoveTimeChartData);
  if (self->_queue_currentExerciseChartData)
    queue_currentExerciseChartData = self->_queue_currentExerciseChartData;
  else
    queue_currentExerciseChartData = v25;
  -[FIUIActivityDataModel setAppleExerciseTimeChartData:](v4, "setAppleExerciseTimeChartData:", queue_currentExerciseChartData);
  if (self->_queue_currentStandChartData)
    queue_currentStandChartData = self->_queue_currentStandChartData;
  else
    queue_currentStandChartData = v25;
  -[FIUIActivityDataModel setAppleStandHourChartData:](v4, "setAppleStandHourChartData:", queue_currentStandChartData);
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[FIUIActivityDataModel setDate:](v4, "setDate:", v30);

  -[FIUIActivityDataModel setDatabaseLoading:](v4, "setDatabaseLoading:", -[FIUIActivityDataProvider _loadingStateForActivitySummary:](self, "_loadingStateForActivitySummary:", v3));
  -[FIUIActivityDataModel setAreFitnessAppsRestricted:](v4, "setAreFitnessAppsRestricted:", self->_areFitnessAppsRestricted);

  return v4;
}

- (void)_queue_updateCurrentActivitySummaryWithSummary:(id)a3
{
  id v4;
  void *v5;
  _BOOL4 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  HKActivitySummary *queue_currentActivitySummary;
  void *v15;
  int v16;
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
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint8_t buf[4];
  HKActivitySummary *v34;
  __int16 v35;
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HKActivitySummary activeEnergyBurnedGoal](self->_queue_currentActivitySummary, "activeEnergyBurnedGoal");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKActivitySummary activeEnergyBurned](self->_queue_currentActivitySummary, "activeEnergyBurned");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKActivitySummary appleMoveMinutesGoal](self->_queue_currentActivitySummary, "appleMoveMinutesGoal");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKActivitySummary appleMoveMinutes](self->_queue_currentActivitySummary, "appleMoveMinutes");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKActivitySummary appleExerciseTimeGoal](self->_queue_currentActivitySummary, "appleExerciseTimeGoal");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKActivitySummary appleExerciseTime](self->_queue_currentActivitySummary, "appleExerciseTime");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKActivitySummary appleStandHoursGoal](self->_queue_currentActivitySummary, "appleStandHoursGoal");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKActivitySummary appleStandHours](self->_queue_currentActivitySummary, "appleStandHours");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[HKActivitySummary paused](self->_queue_currentActivitySummary, "paused");
  objc_msgSend(v4, "activeEnergyBurnedGoal");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "activeEnergyBurned");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appleMoveMinutesGoal");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appleMoveMinutes");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appleExerciseTimeGoal");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appleExerciseTime");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appleStandHoursGoal");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appleStandHours");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[FIUIActivityDataProvider _isPausedForActivitySummary:](self, "_isPausedForActivitySummary:", v4);
  v7 = -[HKActivitySummary _activitySummaryIndex](self->_queue_currentActivitySummary, "_activitySummaryIndex");
  v8 = objc_msgSend(v4, "_activitySummaryIndex");
  v9 = -[HKActivitySummary _activityMoveMode](self->_queue_currentActivitySummary, "_activityMoveMode");
  v10 = objc_msgSend(v4, "_activityMoveMode");
  v11 = -[HKActivitySummary _wheelchairUse](self->_queue_currentActivitySummary, "_wheelchairUse");
  v12 = objc_msgSend(v4, "_wheelchairUse");
  if (v7 == v8
    && v9 == v10
    && v11 == v12
    && ((v16 ^ v6) & 1) == 0
    && objc_msgSend(v18, "isEqual:", v5)
    && objc_msgSend(v32, "isEqual:", v31)
    && objc_msgSend(v30, "isEqual:", v29)
    && objc_msgSend(v28, "isEqual:", v27)
    && objc_msgSend(v26, "isEqual:", v25)
    && objc_msgSend(v24, "isEqual:", v23)
    && objc_msgSend(v22, "isEqual:", v21)
    && objc_msgSend(v20, "isEqual:", v19))
  {
    _HKInitializeLogging();
    v13 = *MEMORY[0x24BDD2FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FA8], OS_LOG_TYPE_DEFAULT))
    {
      queue_currentActivitySummary = self->_queue_currentActivitySummary;
      *(_DWORD *)buf = 138412546;
      v34 = queue_currentActivitySummary;
      v35 = 2112;
      v36 = v4;
      _os_log_impl(&dword_21307C000, v13, OS_LOG_TYPE_DEFAULT, "New activity summary (%@) has same values as existing (%@), skipping update", buf, 0x16u);
    }
  }
  else
  {
    objc_storeStrong((id *)&self->_queue_currentActivitySummary, a3);
    -[FIUIActivityDataProvider _queue_activityDataModelFromCurrentActivitySummary](self, "_queue_activityDataModelFromCurrentActivitySummary");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[FIUIActivityDataProvider _broadcastCurrentModelUpdateToSubscribers:](self, "_broadcastCurrentModelUpdateToSubscribers:", v15);

  }
}

- (void)_queue_updateChartStatisticsWithStatisticsQueryResult:(id)a3
{
  id v4;
  NSArray *v5;
  NSArray *queue_currentActiveEnergyChartData;
  NSArray *v7;
  NSArray *queue_currentMoveTimeChartData;
  NSArray *v9;
  NSArray *queue_currentExerciseChartData;
  NSArray *v11;
  NSArray *queue_currentStandChartData;
  id v13;

  v4 = a3;
  objc_msgSend(v4, "activeEnergyResults");
  v5 = (NSArray *)objc_claimAutoreleasedReturnValue();
  queue_currentActiveEnergyChartData = self->_queue_currentActiveEnergyChartData;
  self->_queue_currentActiveEnergyChartData = v5;

  objc_msgSend(v4, "appleMoveTimeResults");
  v7 = (NSArray *)objc_claimAutoreleasedReturnValue();
  queue_currentMoveTimeChartData = self->_queue_currentMoveTimeChartData;
  self->_queue_currentMoveTimeChartData = v7;

  objc_msgSend(v4, "appleExerciseTimeResults");
  v9 = (NSArray *)objc_claimAutoreleasedReturnValue();
  queue_currentExerciseChartData = self->_queue_currentExerciseChartData;
  self->_queue_currentExerciseChartData = v9;

  objc_msgSend(v4, "appleStandHourResults");
  v11 = (NSArray *)objc_claimAutoreleasedReturnValue();

  queue_currentStandChartData = self->_queue_currentStandChartData;
  self->_queue_currentStandChartData = v11;

  -[FIUIActivityDataProvider _queue_activityDataModelFromCurrentActivitySummary](self, "_queue_activityDataModelFromCurrentActivitySummary");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  -[FIUIActivityDataProvider _broadcastCurrentModelUpdateToSubscribers:](self, "_broadcastCurrentModelUpdateToSubscribers:", v13);

}

- (void)_handleTimeChange
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_21307C000, log, OS_LOG_TYPE_DEBUG, "Timeline model does not have subscribers, nothing to do", v1, 2u);
}

void __45__FIUIActivityDataProvider__handleTimeChange__block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "anyObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v2 != 0;

}

void __45__FIUIActivityDataProvider__handleTimeChange__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  NSObject *v5;
  uint8_t v6[16];
  uint8_t buf[16];

  objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 120) && objc_msgSend(v2, "isDateInToday:"))
  {
    _HKInitializeLogging();
    v4 = *MEMORY[0x24BDD2FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FA8], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21307C000, v4, OS_LOG_TYPE_DEFAULT, "Timeline model has subscribers, but date didn't change, so *not* restarting everything.", buf, 2u);
    }
  }
  else
  {
    _HKInitializeLogging();
    v5 = *MEMORY[0x24BDD2FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FA8], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_21307C000, v5, OS_LOG_TYPE_DEFAULT, "Timeline model has subscribers, and the date has changed, so restarting everything", v6, 2u);
    }
    objc_msgSend(*(id *)(a1 + 32), "_queue_restartQueriesPreservingExistingGoals:", 1);
  }

}

- (void)_broadcastCurrentModelUpdateToSubscribers:(id)a3
{
  id v4;
  NSObject *subscriber_queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  subscriber_queue = self->_subscriber_queue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __70__FIUIActivityDataProvider__broadcastCurrentModelUpdateToSubscribers___block_invoke;
  v7[3] = &unk_24CF305D8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(subscriber_queue, v7);

}

void __70__FIUIActivityDataProvider__broadcastCurrentModelUpdateToSubscribers___block_invoke(uint64_t a1)
{
  id v2;
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
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 112);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
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
        objc_msgSend(*(id *)(a1 + 32), "_broadcastCurrentModelUpdate:toSubscriber:", *(_QWORD *)(a1 + 40), *(_QWORD *)(*((_QWORD *)&v7 + 1) + 8 * v6++), (_QWORD)v7);
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (void)_broadcastCurrentModelUpdate:(id)a3 toSubscriber:(id)a4
{
  objc_msgSend(a4, "activityDataProviderCurrentDataModelUpdated:", a3);
}

- (void)fitnessAppsStateObserver:(id)a3 restrictedStateDidChange:(int64_t)a4
{
  id v5;

  self->_areFitnessAppsRestricted = a4 == 1;
  -[FIUIActivityDataProvider _queue_activityDataModelFromCurrentActivitySummary](self, "_queue_activityDataModelFromCurrentActivitySummary", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[FIUIActivityDataProvider _broadcastCurrentModelUpdateToSubscribers:](self, "_broadcastCurrentModelUpdateToSubscribers:", v5);

}

- (void)_setCurrentDate:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __44__FIUIActivityDataProvider__setCurrentDate___block_invoke;
  block[3] = &unk_24CF305D8;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(queue, block);

}

void __44__FIUIActivityDataProvider__setCurrentDate___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 120), *(id *)(a1 + 40));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fitnessAppsStateObserver, 0);
  objc_storeStrong((id *)&self->_currentDate, 0);
  objc_storeStrong((id *)&self->_subscribers, 0);
  objc_storeStrong((id *)&self->_subscriber_queue, 0);
  objc_storeStrong((id *)&self->_queue_currentStandChartData, 0);
  objc_storeStrong((id *)&self->_queue_currentExerciseChartData, 0);
  objc_storeStrong((id *)&self->_queue_currentMoveTimeChartData, 0);
  objc_storeStrong((id *)&self->_queue_currentActiveEnergyChartData, 0);
  objc_storeStrong((id *)&self->_queue_currentActivityCacheQuery, 0);
  objc_storeStrong((id *)&self->_queue_currentActivitySummary, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_queue_currentActivitySummaryQuery, 0);
  objc_storeStrong((id *)&self->_countUnit, 0);
  objc_storeStrong((id *)&self->_minuteUnit, 0);
  objc_storeStrong((id *)&self->_kcalUnit, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
}

@end
