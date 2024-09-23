@implementation EDSearchableIndexScheduler

void __70__EDSearchableIndexScheduler__xpcCriteriaBuilderBlockForActivityType___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  +[EDSearchableIndexScheduler log](EDSearchableIndexScheduler, "log");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(_QWORD *)(a1 + 40);
    v7 = 138543618;
    v8 = v5;
    v9 = 2048;
    v10 = v6;
    _os_log_impl(&dword_1D2F2C000, v4, OS_LOG_TYPE_DEFAULT, "Configuring %{public}@ actvitity with interval: %lld", (uint8_t *)&v7, 0x16u);
  }

  xpc_dictionary_set_int64(v3, (const char *)*MEMORY[0x1E0C807A8], *(_QWORD *)(a1 + 40));
  xpc_dictionary_set_string(v3, (const char *)*MEMORY[0x1E0C80878], (const char *)*MEMORY[0x1E0C80888]);
  xpc_dictionary_set_BOOL(v3, (const char *)*MEMORY[0x1E0C80898], 1);
  xpc_dictionary_set_int64(v3, (const char *)*MEMORY[0x1E0C80790], 0);
  xpc_dictionary_set_int64(v3, (const char *)*MEMORY[0x1E0C80760], 0);
  xpc_dictionary_set_BOOL(v3, (const char *)*MEMORY[0x1E0C80738], 1);
  xpc_dictionary_set_BOOL(v3, (const char *)*MEMORY[0x1E0C808A8], 1);

}

void __86__EDSearchableIndexScheduler_hasAvailableIndexingBudgetForSearchableIndexSchedulable___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  id v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "_deferActivitiesIfNecessary");
  objc_msgSend(*(id *)(a1 + 32), "budgetConfiguration");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "allowBacklogIndexingOnPower"))
  {
    objc_msgSend(*(id *)(a1 + 32), "schedulable");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "isPluggedIn");

  }
  else
  {
    v3 = 0;
  }

  if (*(_BYTE *)(a1 + 48))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "state");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v5, "hasAvailableIndexingBudget") | v3;

  }
}

- (void)searchableIndexSchedulable:(id)a3 didIndexForTime:(double)a4
{
  NSObject *v6;
  _QWORD v7[6];

  -[EDSearchableIndexScheduler indexingStateQueue](self, "indexingStateQueue", a3);
  v6 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __73__EDSearchableIndexScheduler_searchableIndexSchedulable_didIndexForTime___block_invoke;
  v7[3] = &unk_1E949B658;
  v7[4] = self;
  *(double *)&v7[5] = a4;
  dispatch_async(v6, v7);

}

- (EDSearchableIndexScheduler)initWithSchedulable:(id)a3 budgetConfiguration:(id)a4
{
  id v6;
  id v7;
  EDSearchableIndexScheduler *v8;
  EDSearchableIndexScheduler *v9;
  id v10;
  const char *v11;
  NSObject *v12;
  dispatch_queue_t v13;
  OS_dispatch_queue *indexingStateQueue;
  NSMutableDictionary *v15;
  NSMutableDictionary *activities;
  NSMutableDictionary *v17;
  NSMutableDictionary *tasks;
  void *v19;
  uint64_t v20;
  NSString *budgetTimeUserDefaultsKey;
  EDSearchableIndexSchedulerState *v22;
  uint64_t v23;
  EDSearchableIndexSchedulerState *state;
  NSObject *v25;
  void *v26;
  objc_super v28;
  uint8_t buf[4];
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v28.receiver = self;
  v28.super_class = (Class)EDSearchableIndexScheduler;
  v8 = -[EDSearchableIndexScheduler init](&v28, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_schedulable, v6);
    objc_storeStrong((id *)&v9->_budgetConfiguration, a4);
    objc_msgSend(CFSTR("com.apple.email.searchableIndex.scheduler"), "stringByAppendingString:", CFSTR(".indexingStateQueue"));
    v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v11 = (const char *)objc_msgSend(v10, "UTF8String");
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = dispatch_queue_create(v11, v12);
    indexingStateQueue = v9->_indexingStateQueue;
    v9->_indexingStateQueue = (OS_dispatch_queue *)v13;

    v15 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    activities = v9->_activities;
    v9->_activities = v15;

    v17 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    tasks = v9->_tasks;
    v9->_tasks = v17;

    objc_msgSend(v6, "indexName");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    +[EDSearchableIndexScheduler budgetTimeUserDefaultsKeyForIndexName:](EDSearchableIndexScheduler, "budgetTimeUserDefaultsKeyForIndexName:", v19);
    v20 = objc_claimAutoreleasedReturnValue();
    budgetTimeUserDefaultsKey = v9->_budgetTimeUserDefaultsKey;
    v9->_budgetTimeUserDefaultsKey = (NSString *)v20;

    v22 = [EDSearchableIndexSchedulerState alloc];
    -[EDSearchableIndexScheduler _budgetTimeFromUserDefaults](v9, "_budgetTimeFromUserDefaults");
    v23 = -[EDSearchableIndexSchedulerState initWithBudgetedTimeRemaining:](v22, "initWithBudgetedTimeRemaining:");
    state = v9->_state;
    v9->_state = (EDSearchableIndexSchedulerState *)v23;

    +[EDSearchableIndexScheduler log](EDSearchableIndexScheduler, "log");
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v7, "ef_publicDescription");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v30 = v26;
      _os_log_impl(&dword_1D2F2C000, v25, OS_LOG_TYPE_DEFAULT, "Initializing scheduler with budgetConfiguration:%{public}@", buf, 0xCu);

    }
  }

  return v9;
}

+ (OS_os_log)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __33__EDSearchableIndexScheduler_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_81 != -1)
    dispatch_once(&log_onceToken_81, block);
  return (OS_os_log *)(id)log_log_81;
}

- (double)_budgetTimeFromUserDefaults
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;

  -[EDSearchableIndexScheduler budgetTimeUserDefaultsKey](self, "budgetTimeUserDefaultsKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[EDSearchableIndexScheduler budgetConfiguration](self, "budgetConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "time");
  v8 = v7;

  if (v5)
  {
    objc_msgSend(v4, "doubleForKey:", v3);
    if (v9 < v8)
      v8 = v9;
  }

  return v8;
}

- (NSString)budgetTimeUserDefaultsKey
{
  return self->_budgetTimeUserDefaultsKey;
}

- (void)searchableIndexSchedulable:(id)a3 didGenerateImportantPowerEventWithIdentifier:(id)a4 eventData:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD block[5];
  id v13;
  id v14;

  v7 = a4;
  v8 = a5;
  -[EDSearchableIndexScheduler indexingStateQueue](self, "indexingStateQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __112__EDSearchableIndexScheduler_searchableIndexSchedulable_didGenerateImportantPowerEventWithIdentifier_eventData___block_invoke;
  block[3] = &unk_1E949B390;
  block[4] = self;
  v13 = v7;
  v14 = v8;
  v10 = v8;
  v11 = v7;
  dispatch_async(v9, block);

}

- (void)indexingDidResumeForSearchableIndexSchedulable:(id)a3
{
  NSObject *v4;
  _QWORD block[5];

  -[EDSearchableIndexScheduler indexingStateQueue](self, "indexingStateQueue", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __77__EDSearchableIndexScheduler_indexingDidResumeForSearchableIndexSchedulable___block_invoke;
  block[3] = &unk_1E949AEB8;
  block[4] = self;
  dispatch_async(v4, block);

}

- (void)_startScheduling
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0(&dword_1D2F2C000, v0, v1, "Failed to register task for search fast pass", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_registerActivityForType:(id)a3 builder:(id)a4 runner:(id)a5
{
  id v9;
  id v10;
  __CFString *v11;
  void *v12;
  id v13;

  v13 = a3;
  v9 = a4;
  v10 = a5;
  if ((objc_msgSend(v13, "isEqual:", CFSTR("budgeted")) & 1) != 0)
  {
    v11 = CFSTR("com.apple.email.searchableIndex.scheduler.budgeted");
  }
  else
  {
    if (!objc_msgSend(v13, "isEqual:", CFSTR("maintenance")))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EDSearchableIndexScheduler.m"), 277, CFSTR("Attempting to register unsupported activity type: %@"), v13);

      goto LABEL_7;
    }
    v11 = CFSTR("com.apple.email.searchableIndex.scheduler.maintenance");
  }
  -[__CFString UTF8String](v11, "UTF8String");
  ef_xpc_activity_register();
LABEL_7:

}

+ (id)activityTypes
{
  if (activityTypes_onceToken != -1)
    dispatch_once(&activityTypes_onceToken, &__block_literal_global_68);
  return (id)activityTypes_activityTypes;
}

- (id)_xpcCriteriaBuilderBlockForActivityType:(id)a3
{
  id v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[4];
  id v15;
  uint64_t v16;
  _QWORD aBlock[4];
  id v18;
  uint64_t v19;

  v5 = a3;
  -[EDSearchableIndexScheduler budgetConfiguration](self, "budgetConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "periodDuration");
  v8 = v7;
  if (objc_msgSend(v5, "isEqual:", CFSTR("budgeted")))
  {
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __70__EDSearchableIndexScheduler__xpcCriteriaBuilderBlockForActivityType___block_invoke;
    aBlock[3] = &unk_1E94A1260;
    v18 = v5;
    v19 = (uint64_t)v8;
    v9 = _Block_copy(aBlock);
    v10 = v18;
  }
  else
  {
    if (!objc_msgSend(v5, "isEqual:", CFSTR("maintenance")))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EDSearchableIndexScheduler.m"), 198, CFSTR("Attempting to find a criteria builder block indexing for an unsupported activity type: %@"), v5);

      v9 = 0;
      goto LABEL_7;
    }
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __70__EDSearchableIndexScheduler__xpcCriteriaBuilderBlockForActivityType___block_invoke_34;
    v14[3] = &unk_1E94A1260;
    v16 = (uint64_t)v8;
    v15 = v5;
    v9 = _Block_copy(v14);
    v10 = v15;
  }

LABEL_7:
  v12 = _Block_copy(v9);

  return v12;
}

- (EDSearchableIndexBudgetConfiguration)budgetConfiguration
{
  return self->_budgetConfiguration;
}

- (BOOL)hasAvailableIndexingBudgetForSearchableIndexSchedulable:(id)a3
{
  char v4;
  NSObject *v5;
  _QWORD block[6];
  char v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;

  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = -86;
  v4 = objc_msgSend((id)objc_opt_class(), "isTurboModeIndexingEnabled");
  -[EDSearchableIndexScheduler indexingStateQueue](self, "indexingStateQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __86__EDSearchableIndexScheduler_hasAvailableIndexingBudgetForSearchableIndexSchedulable___block_invoke;
  block[3] = &unk_1E94A1300;
  block[4] = self;
  block[5] = &v9;
  v8 = v4;
  dispatch_sync(v5, block);

  LOBYTE(self) = *((_BYTE *)v10 + 24);
  _Block_object_dispose(&v9, 8);
  return (char)self;
}

- (void)_deferActivitiesIfNecessary
{
  NSObject *v3;
  NSMutableDictionary *activities;
  _QWORD v5[5];

  -[EDSearchableIndexScheduler indexingStateQueue](self, "indexingStateQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  activities = self->_activities;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __57__EDSearchableIndexScheduler__deferActivitiesIfNecessary__block_invoke;
  v5[3] = &unk_1E94A12D8;
  v5[4] = self;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](activities, "enumerateKeysAndObjectsUsingBlock:", v5);
}

- (OS_dispatch_queue)indexingStateQueue
{
  return self->_indexingStateQueue;
}

+ (BOOL)isTurboModeIndexingEnabled
{
  return objc_msgSend(MEMORY[0x1E0D1E1A8], "preferenceEnabled:", 27);
}

+ (id)budgetTimeUserDefaultsKeyForIndexName:(id)a3
{
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), CFSTR("com.apple.email.searchableIndex.scheduler"), a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)_logIndexingPowerEventWithIdentifier:(id)a3 additionalEventData:(id)a4 usePersistentLog:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  os_log_type_t v15;
  int v16;
  id v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v5 = a5;
  v20 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  -[EDSearchableIndexScheduler state](self, "state");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "powerEventData");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "mutableCopy");

  if (objc_msgSend(v9, "count"))
    objc_msgSend(v12, "addEntriesFromDictionary:", v9);
  if (v5)
  {
    +[EDSearchableIndexScheduler log](EDSearchableIndexScheduler, "log");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v16 = 138543618;
      v17 = v8;
      v18 = 2114;
      v19 = v12;
      v14 = v13;
      v15 = OS_LOG_TYPE_DEFAULT;
LABEL_8:
      _os_log_impl(&dword_1D2F2C000, v14, v15, "%{public}@ : %{public}@", (uint8_t *)&v16, 0x16u);
    }
  }
  else
  {
    +[EDSearchableIndexScheduler log](EDSearchableIndexScheduler, "log");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      v16 = 138543618;
      v17 = v8;
      v18 = 2114;
      v19 = v12;
      v14 = v13;
      v15 = OS_LOG_TYPE_INFO;
      goto LABEL_8;
    }
  }

}

uint64_t __73__EDSearchableIndexScheduler_searchableIndexSchedulable_didIndexForTime___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;

  objc_msgSend(*(id *)(a1 + 32), "state");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "didIndexForTime:", *(double *)(a1 + 40));

  objc_msgSend(*(id *)(a1 + 32), "state");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "needsToStopBudgetedIndexing");

  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "_logIndexingPowerEventWithIdentifier:additionalEventData:usePersistentLog:", CFSTR("Indexing budget exhausted."), 0, 1);
    objc_msgSend(*(id *)(a1 + 32), "_stopIndexingForActivityType:shouldDeferIfPossible:", CFSTR("budgeted"), 0);
    objc_msgSend(*(id *)(a1 + 32), "budgetConfiguration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "time");
    v7 = v6;
    objc_msgSend(*(id *)(a1 + 32), "state");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setBudgetedTimeRemaining:", v7);

  }
  v9 = *(void **)(a1 + 32);
  objc_msgSend(v9, "state");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "budgetedTimeRemaining");
  objc_msgSend(v9, "_saveBudgetTimeToUserDefaults:");

  return objc_msgSend(*(id *)(a1 + 32), "_deferActivitiesIfNecessary");
}

uint64_t __77__EDSearchableIndexScheduler_indexingDidResumeForSearchableIndexSchedulable___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "budgetConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "numberOfItemsToIndexOnResume");
  objc_msgSend(*(id *)(a1 + 32), "state");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBudgetedItemCountRemaining:", v3);

  return objc_msgSend(*(id *)(a1 + 32), "_deferActivitiesIfNecessary");
}

uint64_t __112__EDSearchableIndexScheduler_searchableIndexSchedulable_didGenerateImportantPowerEventWithIdentifier_eventData___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_logIndexingPowerEventWithIdentifier:additionalEventData:usePersistentLog:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 1);
}

- (void)setScheduling:(BOOL)a3
{
  if (self->_scheduling != a3)
  {
    self->_scheduling = a3;
    if (a3)
      -[EDSearchableIndexScheduler _startScheduling](self, "_startScheduling");
    else
      -[EDSearchableIndexScheduler _stopScheduling](self, "_stopScheduling");
  }
}

void __43__EDSearchableIndexScheduler_activityTypes__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("budgeted"), CFSTR("maintenance"), 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)activityTypes_activityTypes;
  activityTypes_activityTypes = v0;

}

void __33__EDSearchableIndexScheduler_log__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)log_log_81;
  log_log_81 = (uint64_t)v1;

}

+ (NSSet)deferrableActivityTypes
{
  if (deferrableActivityTypes_onceToken != -1)
    dispatch_once(&deferrableActivityTypes_onceToken, &__block_literal_global_21);
  return (NSSet *)(id)deferrableActivityTypes_deferrableActivityTypes;
}

void __53__EDSearchableIndexScheduler_deferrableActivityTypes__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("budgeted"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)deferrableActivityTypes_deferrableActivityTypes;
  deferrableActivityTypes_deferrableActivityTypes = v0;

}

+ (id)taskTypes
{
  if (taskTypes_onceToken != -1)
    dispatch_once(&taskTypes_onceToken, &__block_literal_global_22_0);
  return (id)taskTypes_taskTypes;
}

void __39__EDSearchableIndexScheduler_taskTypes__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("fastpass"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)taskTypes_taskTypes;
  taskTypes_taskTypes = v0;

}

+ (BOOL)isDeferrableActivityType:(id)a3
{
  id v3;
  void *v4;
  char v5;

  v3 = a3;
  +[EDSearchableIndexScheduler deferrableActivityTypes](EDSearchableIndexScheduler, "deferrableActivityTypes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "containsObject:", v3);

  return v5;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[EDSearchableIndexScheduler _stopAllIndexingBacklogComplete:](self, "_stopAllIndexingBacklogComplete:", 0);
  -[EDSearchableIndexScheduler state](self, "state");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBudgetedItemCountRemaining:", 0);

  v4.receiver = self;
  v4.super_class = (Class)EDSearchableIndexScheduler;
  -[EDSearchableIndexScheduler dealloc](&v4, sel_dealloc);
}

- (id)_xpcActivityIdentifierForActivityType:(id)a3
{
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), CFSTR("com.apple.email.searchableIndex.scheduler"), a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

void __70__EDSearchableIndexScheduler__xpcCriteriaBuilderBlockForActivityType___block_invoke_34(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  int64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  int64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(_QWORD *)(a1 + 40);
  +[EDSearchableIndexScheduler log](EDSearchableIndexScheduler, "log");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = 3 * v4;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = *(_QWORD *)(a1 + 32);
    v8 = 138543618;
    v9 = v7;
    v10 = 2048;
    v11 = v6;
    _os_log_impl(&dword_1D2F2C000, v5, OS_LOG_TYPE_DEFAULT, "Configuring %{public}@ actvitity with interval: %lld", (uint8_t *)&v8, 0x16u);
  }

  xpc_dictionary_set_int64(v3, (const char *)*MEMORY[0x1E0C807A8], v6);
  xpc_dictionary_set_string(v3, (const char *)*MEMORY[0x1E0C80878], (const char *)*MEMORY[0x1E0C80880]);
  xpc_dictionary_set_BOOL(v3, (const char *)*MEMORY[0x1E0C80898], 1);
  xpc_dictionary_set_BOOL(v3, (const char *)*MEMORY[0x1E0C808A8], 1);

}

void __46__EDSearchableIndexScheduler__startScheduling__block_invoke(uint64_t a1)
{
  uint64_t v2;
  id v3;

  v2 = objc_msgSend(*(id *)(a1 + 40), "numberOfItemsToIndexOnResume");
  objc_msgSend(*(id *)(a1 + 32), "state");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBudgetedItemCountRemaining:", v2);

}

void __46__EDSearchableIndexScheduler__startScheduling__block_invoke_40(uint64_t a1, void *a2)
{
  _xpc_activity_s *v3;
  id WeakRetained;
  NSObject *v5;
  uint64_t v6;
  xpc_activity_state_t state;
  uint8_t v8[40];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if (!xpc_activity_set_state(v3, 4))
    {
      +[EDSearchableIndexScheduler log](EDSearchableIndexScheduler, "log");
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        v6 = *(_QWORD *)(a1 + 32);
        state = xpc_activity_get_state(v3);
        __46__EDSearchableIndexScheduler__startScheduling__block_invoke_40_cold_1(v6, v8, state, v5);
      }

    }
    objc_msgSend(WeakRetained, "beginIndexingForActivityType:activity:", *(_QWORD *)(a1 + 32), v3);
  }
  else
  {
    xpc_activity_set_state(v3, 5);
  }

}

void __46__EDSearchableIndexScheduler__startScheduling__block_invoke_42(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;
  NSObject *v6;
  uint8_t v7[16];

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    +[EDSearchableIndexScheduler log](EDSearchableIndexScheduler, "log");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1D2F2C000, v5, OS_LOG_TYPE_DEFAULT, "Search fast pass task started.", v7, 2u);
    }

    objc_msgSend(WeakRetained, "_beginIndexingForTaskType:task:", CFSTR("fastpass"), v3);
  }
  else
  {
    +[EDSearchableIndexScheduler log](EDSearchableIndexScheduler, "log");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __46__EDSearchableIndexScheduler__startScheduling__block_invoke_42_cold_1();

    objc_msgSend(v3, "setTaskCompleted");
  }

}

- (void)_stopScheduling
{
  NSObject *v3;
  _QWORD block[5];

  -[EDSearchableIndexScheduler indexingStateQueue](self, "indexingStateQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__EDSearchableIndexScheduler__stopScheduling__block_invoke;
  block[3] = &unk_1E949AEB8;
  block[4] = self;
  dispatch_sync(v3, block);

}

void __45__EDSearchableIndexScheduler__stopScheduling__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  uint8_t v5[16];

  objc_msgSend(*(id *)(a1 + 32), "_stopAllIndexingBacklogComplete:", 0);
  objc_msgSend(*(id *)(a1 + 32), "state");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setBudgetedItemCountRemaining:", 0);

  objc_msgSend(MEMORY[0x1E0D00E68], "sharedScheduler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "deregisterTaskWithIdentifier:", CFSTR("com.apple.email.search.FastPass"));

  +[EDSearchableIndexScheduler log](EDSearchableIndexScheduler, "log");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1D2F2C000, v4, OS_LOG_TYPE_DEFAULT, "_stopScheduling - deregistered search fast pass", v5, 2u);
  }

}

- (void)beginIndexingForActivityType:(id)a3 activity:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[EDSearchableIndexScheduler indexingStateQueue](self, "indexingStateQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __68__EDSearchableIndexScheduler_beginIndexingForActivityType_activity___block_invoke;
  block[3] = &unk_1E949B390;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

void __68__EDSearchableIndexScheduler_beginIndexingForActivityType_activity___block_invoke(uint64_t a1)
{
  void *v2;
  id *v3;
  _xpc_activity_s *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  const __CFString *v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "activities");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (id *)(a1 + 40);
  objc_msgSend(v2, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v4 = (_xpc_activity_s *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    +[EDSearchableIndexScheduler log](EDSearchableIndexScheduler, "log");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __68__EDSearchableIndexScheduler_beginIndexingForActivityType_activity___block_invoke_cold_1((uint64_t *)(a1 + 40), v5);

    xpc_activity_set_state(v4, 5);
    objc_msgSend(*(id *)(a1 + 32), "state");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "disableIndexingForActivityType:", *v3);

  }
  v7 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "activities");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, *v3);

  if (objc_msgSend(*v3, "isEqual:", CFSTR("maintenance")))
  {
    objc_msgSend(*(id *)(a1 + 32), "state");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setMaintenanceIndexingTime:", 0.0);

    objc_msgSend(*(id *)(a1 + 32), "budgetConfiguration");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "time");
    v12 = v11;
    objc_msgSend(*(id *)(a1 + 32), "state");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setBudgetedTimeRemaining:", v12);

    v14 = *(void **)(a1 + 32);
    objc_msgSend(v14, "state");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "budgetedTimeRemaining");
    objc_msgSend(v14, "_saveBudgetTimeToUserDefaults:");

  }
  objc_msgSend(*(id *)(a1 + 32), "_enableIndexingForActivityType:", *(_QWORD *)(a1 + 40));
  v17 = *(void **)(a1 + 32);
  v16 = *(_QWORD *)(a1 + 40);
  v19 = CFSTR("activityType");
  v20[0] = v16;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "_logIndexingPowerEventWithIdentifier:additionalEventData:usePersistentLog:", CFSTR("Enabled indexing."), v18, 1);

}

- (void)_beginIndexingForTaskType:(id)a3 task:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t);
  void *v18;
  id v19;
  id v20;
  id location;
  const __CFString *v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[EDSearchableIndexScheduler indexingStateQueue](self, "indexingStateQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  -[EDSearchableIndexScheduler tasks](self, "tasks");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    +[EDSearchableIndexScheduler log](EDSearchableIndexScheduler, "log");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[EDSearchableIndexScheduler _beginIndexingForTaskType:task:].cold.1((uint64_t)v6, (uint64_t)v10, v11);

    objc_msgSend(v10, "setTaskCompleted");
  }
  -[EDSearchableIndexScheduler tasks](self, "tasks");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v7, v6);

  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v15 = MEMORY[0x1E0C809B0];
  v16 = 3221225472;
  v17 = __61__EDSearchableIndexScheduler__beginIndexingForTaskType_task___block_invoke;
  v18 = &unk_1E949AD60;
  objc_copyWeak(&v20, &location);
  v13 = v6;
  v19 = v13;
  objc_msgSend(v7, "setExpirationHandler:", &v15);
  -[EDSearchableIndexScheduler _enableIndexingForTaskType:](self, "_enableIndexingForTaskType:", v13, v15, v16, v17, v18);
  v22 = CFSTR("taskType");
  v23[0] = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, &v22, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[EDSearchableIndexScheduler _logIndexingPowerEventWithIdentifier:additionalEventData:usePersistentLog:](self, "_logIndexingPowerEventWithIdentifier:additionalEventData:usePersistentLog:", CFSTR("Enabled indexing."), v14, 1);

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);

}

void __61__EDSearchableIndexScheduler__beginIndexingForTaskType_task___block_invoke(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  void *v4;
  NSObject *v5;
  _QWORD v6[5];
  id v7;
  uint8_t buf[16];

  +[EDSearchableIndexScheduler log](EDSearchableIndexScheduler, "log");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D2F2C000, v2, OS_LOG_TYPE_DEFAULT, "Search fast pass task expired.", buf, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "indexingStateQueue");
    v5 = objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __61__EDSearchableIndexScheduler__beginIndexingForTaskType_task___block_invoke_49;
    v6[3] = &unk_1E949B6D0;
    v6[4] = v4;
    v7 = *(id *)(a1 + 32);
    dispatch_async(v5, v6);

  }
}

uint64_t __61__EDSearchableIndexScheduler__beginIndexingForTaskType_task___block_invoke_49(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_stopIndexingForTaskType:requestRetry:backlogComplete:", *(_QWORD *)(a1 + 40), 1, 0);
}

- (void)_stopIndexingForActivityType:(id)a3 shouldDeferIfPossible:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[2];
  _QWORD v11[3];

  v4 = a4;
  v11[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (v4)
    v4 = +[EDSearchableIndexScheduler isDeferrableActivityType:](EDSearchableIndexScheduler, "isDeferrableActivityType:", v6);
  -[EDSearchableIndexScheduler _disableIndexingForActivityType:defer:](self, "_disableIndexingForActivityType:defer:", v6, v4);
  -[EDSearchableIndexScheduler activities](self, "activities");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeObjectForKey:", v6);

  v10[0] = CFSTR("activityType");
  v10[1] = CFSTR("deferred");
  v11[0] = v6;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[EDSearchableIndexScheduler _logIndexingPowerEventWithIdentifier:additionalEventData:usePersistentLog:](self, "_logIndexingPowerEventWithIdentifier:additionalEventData:usePersistentLog:", CFSTR("Stopped indexing."), v9, 1);

}

- (void)_stopIndexingForTaskType:(id)a3 requestRetry:(BOOL)a4 backlogComplete:(BOOL)a5
{
  _BOOL4 v6;
  __CFString *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  id v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  id v19;
  const __CFString *v20;
  __CFString *v21;
  uint8_t buf[4];
  __CFString *v23;
  uint64_t v24;

  v6 = a4;
  v24 = *MEMORY[0x1E0C80C00];
  v8 = (__CFString *)a3;
  -[EDSearchableIndexScheduler indexingStateQueue](self, "indexingStateQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v9);

  -[EDSearchableIndexScheduler tasks](self, "tasks");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[EDSearchableIndexScheduler _disableIndexingForTaskType:](self, "_disableIndexingForTaskType:", v8);
  -[EDSearchableIndexScheduler tasks](self, "tasks");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "removeObjectForKey:", v8);

  if (v11)
  {
    if (v6)
    {
      v19 = 0;
      v13 = objc_msgSend(v11, "setTaskExpiredWithRetryAfter:error:", &v19, 300.0);
      v14 = v19;
      if ((v13 & 1) != 0)
      {
        +[EDSearchableIndexScheduler log](EDSearchableIndexScheduler, "log");
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v23 = v8;
          _os_log_impl(&dword_1D2F2C000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ task requested more time", buf, 0xCu);
        }
      }
      else
      {
        +[EDSearchableIndexScheduler log](EDSearchableIndexScheduler, "log");
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          -[EDSearchableIndexScheduler _stopIndexingForTaskType:requestRetry:backlogComplete:].cold.1((uint64_t)v8, (uint64_t)v14, v15);
      }

    }
    else
    {
      if (v8 == CFSTR("fastpass") && !a5)
      {
        +[EDSearchableIndexScheduler log](EDSearchableIndexScheduler, "log");
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D2F2C000, v16, OS_LOG_TYPE_DEFAULT, "reportFeatureCheckpoint BGSystemTaskFeatureCheckpointPreviewAvailable for kSemanticSearchFeatureCode", buf, 2u);
        }

        objc_msgSend(MEMORY[0x1E0D00E58], "reportFeatureCheckpoint:forFeature:error:", 30, 301, 0);
      }
      +[EDSearchableIndexScheduler log](EDSearchableIndexScheduler, "log");
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v23 = v8;
        _os_log_impl(&dword_1D2F2C000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@ task completed", buf, 0xCu);
      }

      objc_msgSend(v11, "setTaskCompleted");
    }
  }
  v20 = CFSTR("taskType");
  v21 = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[EDSearchableIndexScheduler _logIndexingPowerEventWithIdentifier:additionalEventData:usePersistentLog:](self, "_logIndexingPowerEventWithIdentifier:additionalEventData:usePersistentLog:", CFSTR("Stopped indexing."), v18, 1);

}

- (void)deferIndexingForActivityType:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[EDSearchableIndexScheduler indexingStateQueue](self, "indexingStateQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __59__EDSearchableIndexScheduler_deferIndexingForActivityType___block_invoke;
  v7[3] = &unk_1E949B6D0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __59__EDSearchableIndexScheduler_deferIndexingForActivityType___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_stopIndexingForActivityType:shouldDeferIfPossible:", *(_QWORD *)(a1 + 40), 1);
}

void __57__EDSearchableIndexScheduler__deferActivitiesIfNecessary__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  _xpc_activity_s *v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (xpc_activity_should_defer(v6))
  {
    +[EDSearchableIndexScheduler log](EDSearchableIndexScheduler, "log");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 138412290;
      v9 = v5;
      _os_log_impl(&dword_1D2F2C000, v7, OS_LOG_TYPE_DEFAULT, "XPC Requested deferral of activity %@", (uint8_t *)&v8, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "_stopIndexingForActivityType:shouldDeferIfPossible:", v5, 1);
  }

}

- (void)_stopAllIndexingBacklogComplete:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  int v11;
  void *v12;
  char v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[16];
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];
  uint64_t v32;

  v3 = a3;
  v32 = *MEMORY[0x1E0C80C00];
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  +[EDSearchableIndexScheduler activityTypes](EDSearchableIndexScheduler, "activityTypes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v27;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v27 != v7)
          objc_enumerationMutation(v5);
        v9 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * v8);
        -[EDSearchableIndexScheduler state](self, "state");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isIndexingEnabledForActivityType:", v9);

        if (v11)
          -[EDSearchableIndexScheduler _stopIndexingForActivityType:shouldDeferIfPossible:](self, "_stopIndexingForActivityType:shouldDeferIfPossible:", v9, 0);
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    }
    while (v6);
  }

  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "em_userDefaults");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "BOOLForKey:", CFSTR("markedSemanticSearchAvailable"));

    +[EDSearchableIndexScheduler log](EDSearchableIndexScheduler, "log");
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if ((v13 & 1) != 0)
    {
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        -[EDSearchableIndexScheduler _stopAllIndexingBacklogComplete:].cold.1();
    }
    else
    {
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D2F2C000, v15, OS_LOG_TYPE_INFO, "reportFeatureCheckpoint BGSystemTaskFeatureCheckpointAvailable for kSemanticSearchFeatureCode", buf, 2u);
      }

      if (objc_msgSend(MEMORY[0x1E0D00E58], "reportFeatureCheckpoint:forFeature:error:", 50, 301, 0))
      {
        objc_msgSend(MEMORY[0x1E0C99EA0], "em_userDefaults");
        v15 = objc_claimAutoreleasedReturnValue();
        -[NSObject setBool:forKey:](v15, "setBool:forKey:", 1, CFSTR("markedSemanticSearchAvailable"));
      }
      else
      {
        +[EDSearchableIndexScheduler log](EDSearchableIndexScheduler, "log");
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          -[EDSearchableIndexScheduler _stopAllIndexingBacklogComplete:].cold.2();
      }
    }

  }
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  -[EDSearchableIndexScheduler tasks](self, "tasks", 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "allKeys");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v21, v30, 16);
  if (v18)
  {
    v19 = *(_QWORD *)v22;
    do
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v22 != v19)
          objc_enumerationMutation(v17);
        -[EDSearchableIndexScheduler _stopIndexingForTaskType:requestRetry:backlogComplete:](self, "_stopIndexingForTaskType:requestRetry:backlogComplete:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v20++), v3 ^ 1, v3);
      }
      while (v18 != v20);
      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v21, v30, 16);
    }
    while (v18);
  }

}

- (void)_periodicallyCheckForDeferralIfNecessary
{
  NSObject *v3;
  BOOL v4;
  dispatch_time_t v5;
  NSObject *v6;
  id v7;
  _QWORD block[4];
  id v9;
  id location;

  -[EDSearchableIndexScheduler indexingStateQueue](self, "indexingStateQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[EDSearchableIndexScheduler state](self, "state");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "isIndexingEnabledByActivities"))
  {
    v4 = -[EDSearchableIndexScheduler scheduledDeferralCheck](self, "scheduledDeferralCheck");

    if (!v4)
    {
      -[EDSearchableIndexScheduler setScheduledDeferralCheck:](self, "setScheduledDeferralCheck:", 1);
      location = (id)0xAAAAAAAAAAAAAAAALL;
      objc_initWeak(&location, self);
      v5 = dispatch_time(0, 3000000000);
      -[EDSearchableIndexScheduler indexingStateQueue](self, "indexingStateQueue");
      v6 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __70__EDSearchableIndexScheduler__periodicallyCheckForDeferralIfNecessary__block_invoke;
      block[3] = &unk_1E949C258;
      objc_copyWeak(&v9, &location);
      dispatch_after(v5, v6, block);

      objc_destroyWeak(&v9);
      objc_destroyWeak(&location);
    }
  }
  else
  {

  }
}

void __70__EDSearchableIndexScheduler__periodicallyCheckForDeferralIfNecessary__block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  uint8_t v3[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  +[EDSearchableIndexScheduler log](EDSearchableIndexScheduler, "log");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_1D2F2C000, v2, OS_LOG_TYPE_INFO, "Checking for XPC deferral", v3, 2u);
  }

  objc_msgSend(WeakRetained, "_deferActivitiesIfNecessary");
  objc_msgSend(WeakRetained, "setScheduledDeferralCheck:", 0);
  objc_msgSend(WeakRetained, "_periodicallyCheckForDeferralIfNecessary");

}

- (void)_enableIndexingForActivityType:(id)a3
{
  NSObject *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v11 = a3;
  -[EDSearchableIndexScheduler indexingStateQueue](self, "indexingStateQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  -[EDSearchableIndexScheduler state](self, "state");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isIndexingEnabledForActivityType:", v11);

  if ((v6 & 1) == 0)
  {
    -[EDSearchableIndexScheduler state](self, "state");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "enableIndexingForActivityType:", v11);

    -[EDSearchableIndexScheduler state](self, "state");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isDataSourceIndexingPermitted");
    -[EDSearchableIndexScheduler schedulable](self, "schedulable");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setDataSourceIndexingPermitted:", v9);

    -[EDSearchableIndexScheduler _periodicallyCheckForDeferralIfNecessary](self, "_periodicallyCheckForDeferralIfNecessary");
  }

}

- (void)_enableIndexingForTaskType:(id)a3
{
  NSObject *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v11 = a3;
  -[EDSearchableIndexScheduler indexingStateQueue](self, "indexingStateQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  -[EDSearchableIndexScheduler state](self, "state");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isIndexingEnabledForTaskType:", v11);

  if ((v6 & 1) == 0)
  {
    -[EDSearchableIndexScheduler state](self, "state");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "enableIndexingForTaskType:", v11);

    -[EDSearchableIndexScheduler state](self, "state");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isDataSourceIndexingPermitted");
    -[EDSearchableIndexScheduler schedulable](self, "schedulable");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setDataSourceIndexingPermitted:", v9);

  }
}

- (void)_disableIndexingForActivityType:(id)a3 defer:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  _xpc_activity_s *v14;
  xpc_activity_state_t v15;
  NSObject *v16;
  int v17;
  id v18;
  __int16 v19;
  xpc_activity_state_t state;
  __int16 v21;
  xpc_activity_state_t v22;
  uint64_t v23;

  v4 = a4;
  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[EDSearchableIndexScheduler state](self, "state");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isIndexingEnabledForActivityType:", v6);

  if (v8)
  {
    -[EDSearchableIndexScheduler state](self, "state");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "disableIndexingForActivityType:", v6);

    -[EDSearchableIndexScheduler state](self, "state");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isDataSourceIndexingPermitted");
    -[EDSearchableIndexScheduler schedulable](self, "schedulable");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setDataSourceIndexingPermitted:", v11);

    -[EDSearchableIndexScheduler activities](self, "activities");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKeyedSubscript:", v6);
    v14 = (_xpc_activity_s *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      v15 = v4 ? 3 : 5;
      if (!xpc_activity_set_state(v14, v15))
      {
        +[EDSearchableIndexScheduler log](EDSearchableIndexScheduler, "log");
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          v17 = 138543874;
          v18 = v6;
          v19 = 2048;
          state = xpc_activity_get_state(v14);
          v21 = 2048;
          v22 = v15;
          _os_log_error_impl(&dword_1D2F2C000, v16, OS_LOG_TYPE_ERROR, "Failed to transition %{public}@ from state %ld to state %ld.", (uint8_t *)&v17, 0x20u);
        }

      }
    }

  }
}

- (void)_disableIndexingForTaskType:(id)a3
{
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v11 = a3;
  -[EDSearchableIndexScheduler indexingStateQueue](self, "indexingStateQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  -[EDSearchableIndexScheduler state](self, "state");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isIndexingEnabledForTaskType:", v11);

  if (v6)
  {
    -[EDSearchableIndexScheduler state](self, "state");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "disableIndexingForTaskType:", v11);

    -[EDSearchableIndexScheduler state](self, "state");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isDataSourceIndexingPermitted");
    -[EDSearchableIndexScheduler schedulable](self, "schedulable");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setDataSourceIndexingPermitted:", v9);

  }
}

- (BOOL)isIndexingEnabledForActivityType:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  -[EDSearchableIndexScheduler indexingStateQueue](self, "indexingStateQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63__EDSearchableIndexScheduler_isIndexingEnabledForActivityType___block_invoke;
  block[3] = &unk_1E949BE18;
  v9 = v4;
  v10 = &v11;
  block[4] = self;
  v6 = v4;
  dispatch_sync(v5, block);

  LOBYTE(self) = *((_BYTE *)v12 + 24);
  _Block_object_dispose(&v11, 8);
  return (char)self;
}

void __63__EDSearchableIndexScheduler_isIndexingEnabledForActivityType___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "state");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v2, "isIndexingEnabledForActivityType:", *(_QWORD *)(a1 + 40));

}

- (BOOL)isIndexingEnabledForTaskType:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  -[EDSearchableIndexScheduler indexingStateQueue](self, "indexingStateQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__EDSearchableIndexScheduler_isIndexingEnabledForTaskType___block_invoke;
  block[3] = &unk_1E949BE18;
  v9 = v4;
  v10 = &v11;
  block[4] = self;
  v6 = v4;
  dispatch_sync(v5, block);

  LOBYTE(self) = *((_BYTE *)v12 + 24);
  _Block_object_dispose(&v11, 8);
  return (char)self;
}

void __59__EDSearchableIndexScheduler_isIndexingEnabledForTaskType___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "state");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v2, "isIndexingEnabledForTaskType:", *(_QWORD *)(a1 + 40));

}

- (int64_t)budgetedItemCountRemaining
{
  NSObject *v3;
  int64_t v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  -[EDSearchableIndexScheduler indexingStateQueue](self, "indexingStateQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __56__EDSearchableIndexScheduler_budgetedItemCountRemaining__block_invoke;
  v6[3] = &unk_1E949BE40;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

void __56__EDSearchableIndexScheduler_budgetedItemCountRemaining__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "state");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v2, "budgetedItemCountRemaining");

}

- (BOOL)isDataSourceIndexingPermitted
{
  EDSearchableIndexScheduler *v2;
  NSObject *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v2 = self;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  -[EDSearchableIndexScheduler indexingStateQueue](self, "indexingStateQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __59__EDSearchableIndexScheduler_isDataSourceIndexingPermitted__block_invoke;
  v5[3] = &unk_1E949BE40;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

void __59__EDSearchableIndexScheduler_isDataSourceIndexingPermitted__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "state");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v2, "isDataSourceIndexingPermitted");

}

- (double)otherIndexingTime
{
  NSObject *v3;
  double v4;
  _QWORD v6[6];
  uint64_t v7;
  double *v8;
  uint64_t v9;
  uint64_t v10;

  v7 = 0;
  v8 = (double *)&v7;
  v9 = 0x2020000000;
  v10 = 0;
  -[EDSearchableIndexScheduler indexingStateQueue](self, "indexingStateQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __47__EDSearchableIndexScheduler_otherIndexingTime__block_invoke;
  v6[3] = &unk_1E949BE40;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

void __47__EDSearchableIndexScheduler_otherIndexingTime__block_invoke(uint64_t a1)
{
  uint64_t v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "state");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "otherIndexingTime");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v2;

}

- (double)maintenanceIndexingTime
{
  NSObject *v3;
  double v4;
  _QWORD v6[6];
  uint64_t v7;
  double *v8;
  uint64_t v9;
  uint64_t v10;

  v7 = 0;
  v8 = (double *)&v7;
  v9 = 0x2020000000;
  v10 = 0;
  -[EDSearchableIndexScheduler indexingStateQueue](self, "indexingStateQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __53__EDSearchableIndexScheduler_maintenanceIndexingTime__block_invoke;
  v6[3] = &unk_1E949BE40;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

void __53__EDSearchableIndexScheduler_maintenanceIndexingTime__block_invoke(uint64_t a1)
{
  uint64_t v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "state");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "maintenanceIndexingTime");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v2;

}

- (double)budgetedTimeRemaining
{
  NSObject *v3;
  double v4;
  _QWORD v6[6];
  uint64_t v7;
  double *v8;
  uint64_t v9;
  uint64_t v10;

  v7 = 0;
  v8 = (double *)&v7;
  v9 = 0x2020000000;
  v10 = 0;
  -[EDSearchableIndexScheduler indexingStateQueue](self, "indexingStateQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __51__EDSearchableIndexScheduler_budgetedTimeRemaining__block_invoke;
  v6[3] = &unk_1E949BE40;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

void __51__EDSearchableIndexScheduler_budgetedTimeRemaining__block_invoke(uint64_t a1)
{
  uint64_t v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "state");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "budgetedTimeRemaining");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v2;

}

- (void)_saveBudgetTimeToUserDefaults:(double)a3
{
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[EDSearchableIndexScheduler budgetTimeUserDefaultsKey](self, "budgetTimeUserDefaultsKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDouble:forKey:", v5, a3);

}

- (void)searchableIndexSchedulable:(id)a3 didIndexItemCount:(int64_t)a4 lastItemDateReceived:(id)a5
{
  id v7;
  NSObject *v8;
  id v9;
  _QWORD block[4];
  id v11;
  EDSearchableIndexScheduler *v12;
  int64_t v13;

  v7 = a5;
  -[EDSearchableIndexScheduler indexingStateQueue](self, "indexingStateQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __96__EDSearchableIndexScheduler_searchableIndexSchedulable_didIndexItemCount_lastItemDateReceived___block_invoke;
  block[3] = &unk_1E949BCB8;
  v12 = self;
  v13 = a4;
  v11 = v7;
  v9 = v7;
  dispatch_async(v8, block);

}

uint64_t __96__EDSearchableIndexScheduler_searchableIndexSchedulable_didIndexItemCount_lastItemDateReceived___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  BOOL v9;
  _DWORD v11[2];
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  +[EDSearchableIndexScheduler log](EDSearchableIndexScheduler, "log");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD *)(a1 + 48);
    v4 = *(_QWORD *)(a1 + 32);
    v11[0] = 67109378;
    v11[1] = v3;
    v12 = 2112;
    v13 = v4;
    _os_log_impl(&dword_1D2F2C000, v2, OS_LOG_TYPE_INFO, "didIndexItemCount: %d lastItemDateReceived: %@", (uint8_t *)v11, 0x12u);
  }

  objc_msgSend(*(id *)(a1 + 40), "state");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "didIndexItemCount:", *(_QWORD *)(a1 + 48));

  objc_msgSend(*(id *)(a1 + 40), "state");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "isIndexingEnabledForTaskType:", CFSTR("fastpass")) & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "state");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "fastPassIndexedItemCount") >= 10000)
    {

LABEL_8:
      objc_msgSend(*(id *)(a1 + 40), "_stopIndexingForTaskType:requestRetry:backlogComplete:", CFSTR("fastpass"), 0, 0);
      return objc_msgSend(*(id *)(a1 + 40), "_deferActivitiesIfNecessary");
    }
    objc_msgSend(*(id *)(a1 + 32), "timeIntervalSinceNow");
    v9 = fabs(v8) < 2628000.0;

    if (!v9)
      goto LABEL_8;
  }
  else
  {

  }
  return objc_msgSend(*(id *)(a1 + 40), "_deferActivitiesIfNecessary");
}

- (void)indexingDidSuspendForSearchableIndexSchedulable:(id)a3
{
  NSObject *v4;
  _QWORD block[5];

  -[EDSearchableIndexScheduler indexingStateQueue](self, "indexingStateQueue", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __78__EDSearchableIndexScheduler_indexingDidSuspendForSearchableIndexSchedulable___block_invoke;
  block[3] = &unk_1E949AEB8;
  block[4] = self;
  dispatch_async(v4, block);

}

uint64_t __78__EDSearchableIndexScheduler_indexingDidSuspendForSearchableIndexSchedulable___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_deferActivitiesIfNecessary");
}

- (void)indexingDidFinishForSearchableIndexSchedulable:(id)a3 backlogComplete:(BOOL)a4
{
  NSObject *v6;
  _QWORD v7[5];
  BOOL v8;

  -[EDSearchableIndexScheduler indexingStateQueue](self, "indexingStateQueue", a3);
  v6 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __93__EDSearchableIndexScheduler_indexingDidFinishForSearchableIndexSchedulable_backlogComplete___block_invoke;
  v7[3] = &unk_1E94A0780;
  v7[4] = self;
  v8 = a4;
  dispatch_async(v6, v7);

}

uint64_t __93__EDSearchableIndexScheduler_indexingDidFinishForSearchableIndexSchedulable_backlogComplete___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_stopAllIndexingBacklogComplete:", *(unsigned __int8 *)(a1 + 40));
}

- (void)searchableIndexSchedulable:(id)a3 didGeneratePowerEventWithIdentifier:(id)a4 eventData:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD block[5];
  id v13;
  id v14;

  v7 = a4;
  v8 = a5;
  -[EDSearchableIndexScheduler indexingStateQueue](self, "indexingStateQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __103__EDSearchableIndexScheduler_searchableIndexSchedulable_didGeneratePowerEventWithIdentifier_eventData___block_invoke;
  block[3] = &unk_1E949B390;
  block[4] = self;
  v13 = v7;
  v14 = v8;
  v10 = v8;
  v11 = v7;
  dispatch_async(v9, block);

}

uint64_t __103__EDSearchableIndexScheduler_searchableIndexSchedulable_didGeneratePowerEventWithIdentifier_eventData___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_logIndexingPowerEventWithIdentifier:additionalEventData:usePersistentLog:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 0);
}

- (BOOL)isScheduling
{
  return self->_scheduling;
}

- (EDSearchableIndexSchedulable)schedulable
{
  return (EDSearchableIndexSchedulable *)objc_loadWeakRetained((id *)&self->_schedulable);
}

- (BOOL)scheduledDeferralCheck
{
  return self->_scheduledDeferralCheck;
}

- (void)setScheduledDeferralCheck:(BOOL)a3
{
  self->_scheduledDeferralCheck = a3;
}

- (void)setBudgetTimeUserDefaultsKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void)setIndexingStateQueue:(id)a3
{
  objc_storeStrong((id *)&self->_indexingStateQueue, a3);
}

- (EDSearchableIndexSchedulerState)state
{
  return self->_state;
}

- (void)setState:(id)a3
{
  objc_storeStrong((id *)&self->_state, a3);
}

- (NSMutableDictionary)activities
{
  return self->_activities;
}

- (void)setActivities:(id)a3
{
  objc_storeStrong((id *)&self->_activities, a3);
}

- (NSMutableDictionary)tasks
{
  return self->_tasks;
}

- (void)setTasks:(id)a3
{
  objc_storeStrong((id *)&self->_tasks, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tasks, 0);
  objc_storeStrong((id *)&self->_activities, 0);
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_indexingStateQueue, 0);
  objc_storeStrong((id *)&self->_budgetTimeUserDefaultsKey, 0);
  objc_storeStrong((id *)&self->_budgetConfiguration, 0);
  objc_destroyWeak((id *)&self->_schedulable);
}

void __46__EDSearchableIndexScheduler__startScheduling__block_invoke_40_cold_1(uint64_t a1, uint8_t *buf, uint64_t a3, os_log_t log)
{
  *(_DWORD *)buf = 138543874;
  *(_QWORD *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2048;
  *(_QWORD *)(buf + 14) = a3;
  *((_WORD *)buf + 11) = 1024;
  *((_DWORD *)buf + 6) = 4;
  _os_log_error_impl(&dword_1D2F2C000, log, OS_LOG_TYPE_ERROR, "Failed to transition %{public}@ from state %ld to state %d.", buf, 0x1Cu);
}

void __46__EDSearchableIndexScheduler__startScheduling__block_invoke_42_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0(&dword_1D2F2C000, v0, v1, "Marking search fast pass task completed, self is nil.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __68__EDSearchableIndexScheduler_beginIndexingForActivityType_activity___block_invoke_cold_1(uint64_t *a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = *a1;
  v3 = 138543362;
  v4 = v2;
  _os_log_error_impl(&dword_1D2F2C000, a2, OS_LOG_TYPE_ERROR, "Attempted to begin indexing an activity type (%{public}@) that is already active - marking old ACTIVITY as DONE", (uint8_t *)&v3, 0xCu);
  OUTLINED_FUNCTION_1_0();
}

- (void)_beginIndexingForTaskType:(NSObject *)a3 task:.cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 138543618;
  *(_QWORD *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 2112;
  *(_QWORD *)&v3[14] = a2;
  OUTLINED_FUNCTION_1_5(&dword_1D2F2C000, a2, a3, "Attempted to begin indexing a task type (%{public}@) that already has a task: %@", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16]);
  OUTLINED_FUNCTION_1_0();
}

- (void)_stopIndexingForTaskType:(uint64_t)a1 requestRetry:(uint64_t)a2 backlogComplete:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 138543618;
  *(_QWORD *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 2114;
  *(_QWORD *)&v3[14] = a2;
  OUTLINED_FUNCTION_1_5(&dword_1D2F2C000, a2, a3, "%{public}@ task expired with retry failed: %{public}@", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16]);
  OUTLINED_FUNCTION_1_0();
}

- (void)_stopAllIndexingBacklogComplete:.cold.1()
{
  os_log_t v0;
  uint8_t v1[16];

  OUTLINED_FUNCTION_2_1();
  _os_log_debug_impl(&dword_1D2F2C000, v0, OS_LOG_TYPE_DEBUG, "Already reported FeatureCheckpointAvailable", v1, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)_stopAllIndexingBacklogComplete:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0(&dword_1D2F2C000, v0, v1, "reportFeatureCheckpoint BGSystemTaskFeatureCheckpointAvailable for kSemanticSearchFeatureCode failed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
