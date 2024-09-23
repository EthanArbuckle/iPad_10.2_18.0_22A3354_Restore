@implementation HDCurrentActivitySummaryHelper

- (void)addObserver:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HKObserverSet registerObserver:](self->_observers, "registerObserver:", v4);
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __46__HDCurrentActivitySummaryHelper_addObserver___block_invoke;
  v7[3] = &unk_1E6CE8080;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

void __46__HDCurrentActivitySummaryHelper_addObserver___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v2 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v2 + 64))
  {
    v3 = (void *)objc_msgSend(*(id *)(v2 + 48), "copy");
    v4 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "copy");
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(_QWORD *)(a1 + 40);
    v7 = *(void **)(v5 + 80);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __46__HDCurrentActivitySummaryHelper_addObserver___block_invoke_2;
    v10[3] = &unk_1E6CF7940;
    v10[4] = v5;
    v11 = v3;
    v12 = v4;
    v8 = v4;
    v9 = v3;
    objc_msgSend(v7, "notifyObserver:handler:", v6, v10);

    v2 = *(_QWORD *)(a1 + 32);
  }
  -[HDCurrentActivitySummaryHelper _queue_didUpdateObservers](v2);
}

- (void)removeObserver:(id)a3
{
  NSObject *queue;
  _QWORD block[5];

  -[HKObserverSet unregisterObserver:](self->_observers, "unregisterObserver:", a3);
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__HDCurrentActivitySummaryHelper_removeObserver___block_invoke;
  block[3] = &unk_1E6CE80E8;
  block[4] = self;
  dispatch_async(queue, block);
}

void __49__HDCurrentActivitySummaryHelper_removeObserver___block_invoke(uint64_t a1)
{
  -[HDCurrentActivitySummaryHelper _queue_didUpdateObservers](*(_QWORD *)(a1 + 32));
}

- (void)_queue_updateTodayActivitySummary:(uint64_t)a1
{
  uint64_t v4;
  id v5;

  v5 = a2;
  v4 = -[HDCurrentActivitySummaryHelper _changedFieldsBetweenPreviousActivitySummary:andNewActivitySummary:](*(void **)(a1 + 48), v5);
  objc_storeStrong((id *)(a1 + 48), a2);
  -[HDCurrentActivitySummaryHelper _queue_alertObserversTodaySummaryUpdatedWithChangedFields:](a1, v4);

}

- (uint64_t)_changedFieldsBetweenPreviousActivitySummary:(void *)a1 andNewActivitySummary:(void *)a2
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  void *v27;
  int v28;
  void *v29;
  void *v30;
  int v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  int v36;
  int v37;
  uint64_t v38;
  int v40;
  int v41;
  int v42;
  int v43;
  int v44;
  int v45;
  int v46;
  int v47;
  int v48;

  v3 = a2;
  v4 = a1;
  objc_msgSend(v4, "activeEnergyBurnedGoal");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "activeEnergyBurnedGoal");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = objc_msgSend(v5, "isEqual:", v6);

  objc_msgSend(v4, "activeEnergyBurned");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "activeEnergyBurned");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = objc_msgSend(v7, "isEqual:", v8);

  objc_msgSend(v4, "appleMoveTimeGoal");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appleMoveTimeGoal");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = objc_msgSend(v9, "isEqual:", v10);

  objc_msgSend(v4, "appleMoveTime");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appleMoveTime");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = objc_msgSend(v11, "isEqual:", v12);

  objc_msgSend(v4, "exerciseTimeGoal");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exerciseTimeGoal");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = objc_msgSend(v13, "isEqual:", v14);

  objc_msgSend(v4, "appleExerciseTime");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appleExerciseTime");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = objc_msgSend(v15, "isEqual:", v16);

  objc_msgSend(v4, "standHoursGoal");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "standHoursGoal");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = objc_msgSend(v17, "isEqual:", v18);

  objc_msgSend(v4, "appleStandHours");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appleStandHours");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = objc_msgSend(v19, "isEqual:", v20);

  objc_msgSend(v4, "stepCount");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stepCount");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = objc_msgSend(v21, "isEqual:", v22);

  objc_msgSend(v4, "_deepBreathingDuration");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_deepBreathingDuration");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v23, "isEqual:", v24);

  objc_msgSend(v4, "_pushCount");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_pushCount");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v26, "isEqual:", v27);

  objc_msgSend(v4, "_flightsClimbed");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_flightsClimbed");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(v29, "isEqual:", v30);

  v32 = objc_msgSend(v4, "_wheelchairUse");
  v33 = objc_msgSend(v3, "_wheelchairUse");
  v34 = objc_msgSend(v4, "activityMoveMode");
  v35 = objc_msgSend(v3, "activityMoveMode");
  v36 = objc_msgSend(v4, "isPaused");

  v37 = objc_msgSend(v3, "isPaused");
  v38 = 16;
  if (v48)
    v38 = 0;
  if (!v47)
    v38 |= 2uLL;
  if (!v46)
    v38 |= 0x8000uLL;
  if (!v45)
    v38 |= 0x4000uLL;
  if (!v44)
    v38 |= 0x20uLL;
  if (!v43)
    v38 |= 4uLL;
  if (!v42)
    v38 |= 0x40uLL;
  if (!v41)
    v38 |= 8uLL;
  if (!v40)
    v38 |= 0x80uLL;
  if (!v25)
    v38 |= 0x400uLL;
  if (!v28)
    v38 |= 0x800uLL;
  if (!v31)
    v38 |= 0x1000uLL;
  if (v32 != v33)
    v38 |= 0x2000uLL;
  if (v34 != v35)
    v38 |= 0x10000uLL;
  if (v36 != v37)
    return v38 | 0x20000;
  else
    return v38;
}

- (void)_generateCacheIndexesWithTodayIndex:(uint64_t *)a3 yesterdayIndex:
{
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0C99D48], "calendarWithIdentifier:", *MEMORY[0x1E0C996C8]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E80], "systemTimeZone");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setTimeZone:", v7);

    if (*(_QWORD *)(a1 + 96))
      objc_msgSend(v6, "setTimeZone:");
    v8 = *(void **)(a1 + 88);
    if (v8)
    {
      v9 = v8;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v9 = (id)objc_claimAutoreleasedReturnValue();
    }
    v10 = v9;
    objc_msgSend(v6, "dateByAddingUnit:value:toDate:options:", 16, -1, v9, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    _HKInitializeLogging();
    v12 = *MEMORY[0x1E0CB5348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5348], OS_LOG_TYPE_INFO))
    {
      v17 = 138412802;
      v18 = a1;
      v19 = 2112;
      v20 = v10;
      v21 = 2112;
      v22 = v11;
      _os_log_impl(&dword_1B7802000, v12, OS_LOG_TYPE_INFO, "%@: Generating cache indices for today: %@, yesterday: %@", (uint8_t *)&v17, 0x20u);
    }
    objc_msgSend(v6, "hk_activitySummaryDateComponentsFromDate:", v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "hk_activitySummaryDateComponentsFromDate:", v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = _HKCacheIndexFromDateComponents();
    v16 = _HKCacheIndexFromDateComponents();
    if (a2)
      *a2 = v15;
    if (a3)
      *a3 = v16;

  }
}

- (HKActivitySummary)todayActivitySummary
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
  v9 = __Block_byref_object_copy__87;
  v10 = __Block_byref_object_dispose__87;
  v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __54__HDCurrentActivitySummaryHelper_todayActivitySummary__block_invoke;
  v5[3] = &unk_1E6CE8110;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (HKActivitySummary *)v3;
}

void __54__HDCurrentActivitySummaryHelper_todayActivitySummary__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 48));
}

- (HKActivitySummary)yesterdayActivitySummary
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
  v9 = __Block_byref_object_copy__87;
  v10 = __Block_byref_object_dispose__87;
  v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __58__HDCurrentActivitySummaryHelper_yesterdayActivitySummary__block_invoke;
  v5[3] = &unk_1E6CE8110;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (HKActivitySummary *)v3;
}

void __58__HDCurrentActivitySummaryHelper_yesterdayActivitySummary__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 56));
}

- (void)_queue_updateYesterdayActivitySummary:(uint64_t)a1
{
  uint64_t v4;
  id v5;

  v5 = a2;
  v4 = -[HDCurrentActivitySummaryHelper _changedFieldsBetweenPreviousActivitySummary:andNewActivitySummary:](*(void **)(a1 + 56), v5);
  objc_storeStrong((id *)(a1 + 56), a2);
  -[HDCurrentActivitySummaryHelper _queue_alertObserversYesterdaySummaryUpdatedWithChangedFields:](a1, v4);

}

- (BOOL)hasLoadedActivitySummaries
{
  NSObject *queue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __60__HDCurrentActivitySummaryHelper_hasLoadedActivitySummaries__block_invoke;
  v5[3] = &unk_1E6CE8110;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __60__HDCurrentActivitySummaryHelper_hasLoadedActivitySummaries__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 64);
  return result;
}

- (HDCurrentActivitySummaryHelper)initWithProfile:(id)a3
{
  id v4;
  HDCurrentActivitySummaryHelper *v5;
  HDCurrentActivitySummaryHelper *v6;
  uint64_t v7;
  OS_dispatch_queue *queue;
  id v9;
  objc_class *v10;
  void *v11;
  uint64_t v12;
  HKObserverSet *observers;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  NSArray *typesForDataCollection;
  __CFNotificationCenter *DarwinNotifyCenter;
  void *v23;
  objc_super v25;
  _QWORD v26[7];

  v26[6] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)HDCurrentActivitySummaryHelper;
  v5 = -[HDCurrentActivitySummaryHelper init](&v25, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_profile, v4);
    HKCreateSerialDispatchQueue();
    v7 = objc_claimAutoreleasedReturnValue();
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v7;

    _HKInitializeLogging();
    v9 = objc_alloc(MEMORY[0x1E0CB6988]);
    v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v9, "initWithName:loggingCategory:", v11, *MEMORY[0x1E0CB5348]);
    observers = v6->_observers;
    v6->_observers = (HKObserverSet *)v12;

    objc_msgSend(MEMORY[0x1E0CB6978], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5A48]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = v14;
    objc_msgSend(MEMORY[0x1E0CB6978], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5A58]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v26[1] = v15;
    objc_msgSend(MEMORY[0x1E0CB6978], "categoryTypeForIdentifier:", *MEMORY[0x1E0CB4880]);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v26[2] = v16;
    objc_msgSend(MEMORY[0x1E0CB6978], "briskMinuteDataType");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v26[3] = v17;
    objc_msgSend(MEMORY[0x1E0CB6A70], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5D78]);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v26[4] = v18;
    objc_msgSend(MEMORY[0x1E0CB6A70], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5C68]);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v26[5] = v19;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 6);
    v20 = objc_claimAutoreleasedReturnValue();
    typesForDataCollection = v6->_typesForDataCollection;
    v6->_typesForDataCollection = (NSArray *)v20;

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v6, (CFNotificationCallback)_significantTimeChange, CFSTR("SignificantTimeChangeNotification"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "addObserver:selector:name:object:", v6, sel__handleSignificantTimeChangeNotification_, *MEMORY[0x1E0C99690], 0);

  }
  return v6;
}

- (void)dealloc
{
  void *v3;
  __CFNotificationCenter *DarwinNotifyCenter;
  objc_super v5;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, CFSTR("SignificantTimeChangeNotification"), 0);
  v5.receiver = self;
  v5.super_class = (Class)HDCurrentActivitySummaryHelper;
  -[HDCurrentActivitySummaryHelper dealloc](&v5, sel_dealloc);
}

- (void)setDateOverride:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__HDCurrentActivitySummaryHelper_setDateOverride___block_invoke;
  block[3] = &unk_1E6CE8080;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(queue, block);

}

uint64_t __50__HDCurrentActivitySummaryHelper_setDateOverride___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 88), *(id *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "_handleSignificantTimeChangeNotification:", 0);
}

- (NSDate)dateOverride
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
  v9 = __Block_byref_object_copy__87;
  v10 = __Block_byref_object_dispose__87;
  v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __46__HDCurrentActivitySummaryHelper_dateOverride__block_invoke;
  v5[3] = &unk_1E6CE8110;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSDate *)v3;
}

void __46__HDCurrentActivitySummaryHelper_dateOverride__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 88));
}

- (void)setTimezoneOverride:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__HDCurrentActivitySummaryHelper_setTimezoneOverride___block_invoke;
  block[3] = &unk_1E6CE8080;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(queue, block);

}

uint64_t __54__HDCurrentActivitySummaryHelper_setTimezoneOverride___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 96), *(id *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "_handleSignificantTimeChangeNotification:", 0);
}

- (NSTimeZone)timezoneOverride
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
  v9 = __Block_byref_object_copy__87;
  v10 = __Block_byref_object_dispose__87;
  v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __50__HDCurrentActivitySummaryHelper_timezoneOverride__block_invoke;
  v5[3] = &unk_1E6CE8110;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSTimeZone *)v3;
}

void __50__HDCurrentActivitySummaryHelper_timezoneOverride__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 96));
}

- (void)_queue_setUpActivityQueryHelperOnlyIfUninitialized:(uint64_t)a1
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  HDActivitySummaryQueryHelper *v12;
  id WeakRetained;
  uint64_t v14;
  id *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, void *, uint64_t, uint64_t, void *);
  void *v20;
  uint64_t v21;
  id v22;
  _QWORD v23[2];
  uint8_t buf[4];
  uint64_t v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  uint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  if (a1 && (!a2 || !*(_QWORD *)(a1 + 16)))
  {
    -[HDCurrentActivitySummaryHelper _generateCacheIndexesWithTodayIndex:yesterdayIndex:](a1, (uint64_t *)(a1 + 32), (uint64_t *)(a1 + 40));
    _HKInitializeLogging();
    v3 = *MEMORY[0x1E0CB5348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5348], OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(_QWORD *)(a1 + 32);
      v5 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543874;
      v25 = a1;
      v26 = 2048;
      v27 = v4;
      v28 = 2048;
      v29 = v5;
      _os_log_impl(&dword_1B7802000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: Setting up new query helper with indices today: (%ld) and yesterday: (%ld)", buf, 0x20u);
    }
    objc_msgSend(MEMORY[0x1E0CB6EE8], "filterWithOperatorType:cacheIndex:", 4, *(_QWORD *)(a1 + 32));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB6EE8], "filterWithOperatorType:cacheIndex:", 4, *(_QWORD *)(a1 + 40));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)MEMORY[0x1E0CB6F30];
    v23[0] = v6;
    v23[1] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "orFilterWithSubfilters:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_initWeak((id *)buf, (id)a1);
    v17 = MEMORY[0x1E0C809B0];
    v18 = 3221225472;
    v19 = __85__HDCurrentActivitySummaryHelper__queue_setUpActivityQueryHelperOnlyIfUninitialized___block_invoke;
    v20 = &unk_1E6CEBC28;
    objc_copyWeak(&v22, (id *)buf);
    v21 = a1;
    v11 = _Block_copy(&v17);
    *(_BYTE *)(a1 + 64) = 0;
    objc_msgSend(*(id *)(a1 + 16), "stop", v17, v18, v19, v20);
    v12 = [HDActivitySummaryQueryHelper alloc];
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
    v14 = -[HDActivitySummaryQueryHelper initWithProfile:filter:batchedInitialResultsHandler:batchedUpdateHandler:](v12, "initWithProfile:filter:batchedInitialResultsHandler:batchedUpdateHandler:", WeakRetained, v10, v11, v11);
    v16 = *(void **)(a1 + 16);
    v15 = (id *)(a1 + 16);
    *v15 = (id)v14;

    objc_msgSend(*v15, "start");
    objc_destroyWeak(&v22);
    objc_destroyWeak((id *)buf);

  }
}

void __85__HDCurrentActivitySummaryHelper__queue_setUpActivityQueryHelperOnlyIfUninitialized___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v7;
  id v8;
  NSObject **WeakRetained;
  NSObject **v10;
  NSObject *v11;
  id v12;
  uint64_t v13;
  _QWORD v14[4];
  id v15;
  NSObject **v16;
  id v17;
  uint64_t v18;

  v7 = a2;
  v8 = a5;
  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 40));
  v10 = WeakRetained;
  if (WeakRetained)
  {
    v11 = WeakRetained[3];
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __85__HDCurrentActivitySummaryHelper__queue_setUpActivityQueryHelperOnlyIfUninitialized___block_invoke_2;
    v14[3] = &unk_1E6CECCA8;
    v15 = v8;
    v16 = v10;
    v12 = v7;
    v13 = *(_QWORD *)(a1 + 32);
    v17 = v12;
    v18 = v13;
    dispatch_async(v11, v14);

  }
}

void __85__HDCurrentActivitySummaryHelper__queue_setUpActivityQueryHelperOnlyIfUninitialized___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[4];
  uint64_t v26;
  __int16 v27;
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 32))
  {
    _HKInitializeLogging();
    v2 = *MEMORY[0x1E0CB5348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5348], OS_LOG_TYPE_ERROR))
    {
      v19 = *(_QWORD *)(a1 + 56);
      v20 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      v26 = v19;
      v27 = 2114;
      v28 = v20;
      _os_log_error_impl(&dword_1B7802000, v2, OS_LOG_TYPE_ERROR, "%{public}@: Error occurred, resetting query helper: %{public}@", buf, 0x16u);
    }
    v3 = *(_QWORD *)(a1 + 40);
    if (v3)
    {
      objc_msgSend(*(id *)(v3 + 16), "stop");
      v4 = *(void **)(v3 + 16);
      *(_QWORD *)(v3 + 16) = 0;

    }
  }
  else
  {
    v5 = *(_QWORD *)(a1 + 40);
    v6 = *(id *)(a1 + 48);
    v7 = v6;
    if (v5)
    {
      v23 = 0u;
      v24 = 0u;
      v21 = 0u;
      v22 = 0u;
      v8 = v6;
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, buf, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v22;
        do
        {
          v12 = 0;
          do
          {
            if (*(_QWORD *)v22 != v11)
              objc_enumerationMutation(v8);
            v13 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v12);
            v14 = (void *)MEMORY[0x1BCCACAC4](v9);
            objc_msgSend(v13, "_gregorianDateComponents", (_QWORD)v21);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = _HKCacheIndexFromDateComponents();

            if (v16 == *(_QWORD *)(v5 + 32))
            {
              -[HDCurrentActivitySummaryHelper _queue_updateTodayActivitySummary:](v5, v13);
            }
            else if (v16 == *(_QWORD *)(v5 + 40))
            {
              -[HDCurrentActivitySummaryHelper _queue_updateYesterdayActivitySummary:](v5, v13);
            }
            objc_autoreleasePoolPop(v14);
            ++v12;
          }
          while (v10 != v12);
          v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, buf, 16);
          v10 = v9;
        }
        while (v9);
      }

      if (!*(_BYTE *)(v5 + 64) && !objc_msgSend(v8, "count"))
      {
        -[HDCurrentActivitySummaryHelper _createEmptyActivitySummaryForIndex:](v5, *(_QWORD *)(v5 + 32));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[HDCurrentActivitySummaryHelper _queue_updateTodayActivitySummary:](v5, v17);

        -[HDCurrentActivitySummaryHelper _createEmptyActivitySummaryForIndex:](v5, *(_QWORD *)(v5 + 40));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[HDCurrentActivitySummaryHelper _queue_updateYesterdayActivitySummary:](v5, v18);

      }
      *(_BYTE *)(v5 + 64) = 1;
    }

  }
}

- (id)_createEmptyActivitySummaryForIndex:(uint64_t)a1
{
  id v3;

  if (a1)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0CB6278]);
    objc_msgSend(v3, "_setActivitySummaryIndex:", a2);
    objc_msgSend(v3, "_setDataLoading:", 1);
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (void)_queue_alertObserversTodaySummaryUpdatedWithChangedFields:(uint64_t)a1
{
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;
  uint64_t v9;

  if (a1)
  {
    v4 = (void *)objc_msgSend(*(id *)(a1 + 48), "copy");
    v5 = *(void **)(a1 + 80);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __92__HDCurrentActivitySummaryHelper__queue_alertObserversTodaySummaryUpdatedWithChangedFields___block_invoke;
    v7[3] = &unk_1E6CF7918;
    v7[4] = a1;
    v8 = v4;
    v9 = a2;
    v6 = v4;
    objc_msgSend(v5, "notifyObservers:", v7);

  }
}

- (void)_queue_alertObserversYesterdaySummaryUpdatedWithChangedFields:(uint64_t)a1
{
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;
  uint64_t v9;

  if (a1)
  {
    v4 = (void *)objc_msgSend(*(id *)(a1 + 56), "copy");
    v5 = *(void **)(a1 + 80);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __96__HDCurrentActivitySummaryHelper__queue_alertObserversYesterdaySummaryUpdatedWithChangedFields___block_invoke;
    v7[3] = &unk_1E6CF7918;
    v7[4] = a1;
    v8 = v4;
    v9 = a2;
    v6 = v4;
    objc_msgSend(v5, "notifyObservers:", v7);

  }
}

uint64_t __92__HDCurrentActivitySummaryHelper__queue_alertObserversTodaySummaryUpdatedWithChangedFields___block_invoke(_QWORD *a1, void *a2)
{
  return objc_msgSend(a2, "currentActivitySummaryHelper:didUpdateTodayActivitySummary:changedFields:", a1[4], a1[5], a1[6]);
}

uint64_t __96__HDCurrentActivitySummaryHelper__queue_alertObserversYesterdaySummaryUpdatedWithChangedFields___block_invoke(_QWORD *a1, void *a2)
{
  return objc_msgSend(a2, "currentActivitySummaryHelper:didUpdateYesterdayActivitySummary:changedFields:", a1[4], a1[5], a1[6]);
}

- (void)_queue_didUpdateObservers
{
  void *WeakRetained;
  id v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _QWORD v14[5];
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    if (objc_msgSend(*(id *)(a1 + 80), "count"))
    {
      if (*(_QWORD *)(a1 + 16))
        return;
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
      objc_msgSend(WeakRetained, "database");
      v3 = (id)objc_claimAutoreleasedReturnValue();
      v4 = *(_QWORD *)(a1 + 24);
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __59__HDCurrentActivitySummaryHelper__queue_didUpdateObservers__block_invoke;
      v14[3] = &unk_1E6CE80E8;
      v14[4] = a1;
      objc_msgSend(v3, "performWhenDataProtectedByFirstUnlockIsAvailableOnQueue:block:", v4, v14);
    }
    else
    {
      v5 = objc_loadWeakRetained((id *)(a1 + 8));
      objc_msgSend(v5, "dataCollectionManager");
      WeakRetained = (void *)objc_claimAutoreleasedReturnValue();

      v12 = 0u;
      v13 = 0u;
      v10 = 0u;
      v11 = 0u;
      v3 = *(id *)(a1 + 72);
      v6 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
      if (v6)
      {
        v7 = v6;
        v8 = *(_QWORD *)v11;
        do
        {
          v9 = 0;
          do
          {
            if (*(_QWORD *)v11 != v8)
              objc_enumerationMutation(v3);
            objc_msgSend(WeakRetained, "stopDataCollectionForType:observer:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9++), a1, (_QWORD)v10);
          }
          while (v7 != v9);
          v7 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
        }
        while (v7);
      }
    }

  }
}

void __59__HDCurrentActivitySummaryHelper__queue_didUpdateObservers__block_invoke(uint64_t a1)
{
  -[HDCurrentActivitySummaryHelper _queue_setUpActivityQueryHelperOnlyIfUninitialized:](*(_QWORD *)(a1 + 32), 1);
}

void __46__HDCurrentActivitySummaryHelper_addObserver___block_invoke_2(_QWORD *a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  id v5;

  v3 = a1[4];
  v4 = a1[5];
  v5 = a2;
  objc_msgSend(v5, "currentActivitySummaryHelper:didUpdateTodayActivitySummary:changedFields:", v3, v4, -1);
  objc_msgSend(v5, "currentActivitySummaryHelper:didUpdateYesterdayActivitySummary:changedFields:", a1[4], a1[6], -1);

}

- (void)_handleSignificantTimeChangeNotification:(id)a3
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __75__HDCurrentActivitySummaryHelper__handleSignificantTimeChangeNotification___block_invoke;
  block[3] = &unk_1E6CE80E8;
  block[4] = self;
  dispatch_async(queue, block);
}

void __75__HDCurrentActivitySummaryHelper__handleSignificantTimeChangeNotification___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  _BOOL4 v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  id WeakRetained;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD v15[5];
  _BYTE buf[24];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  if (!*(_QWORD *)(v2 + 16))
  {
    _HKInitializeLogging();
    v5 = *MEMORY[0x1E0CB5348];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5348], OS_LOG_TYPE_DEFAULT))
      return;
    v9 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    *(_QWORD *)&buf[4] = v9;
    v8 = "%{public}@: Significant time change occurred, query helper has not been set up yet";
    goto LABEL_7;
  }
  *(_QWORD *)buf = 0;
  -[HDCurrentActivitySummaryHelper _generateCacheIndexesWithTodayIndex:yesterdayIndex:](v2, (uint64_t *)buf, 0);
  v3 = *(_QWORD *)buf;
  v4 = *(_QWORD *)(v2 + 32);
  _HKInitializeLogging();
  v5 = *MEMORY[0x1E0CB5348];
  v6 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5348], OS_LOG_TYPE_DEFAULT);
  if (v3 == v4)
  {
    if (!v6)
      return;
    v7 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    *(_QWORD *)&buf[4] = v7;
    v8 = "%{public}@: Significant time change occurred, no date change";
LABEL_7:
    _os_log_impl(&dword_1B7802000, v5, OS_LOG_TYPE_DEFAULT, v8, buf, 0xCu);
    return;
  }
  if (v6)
  {
    v10 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    *(_QWORD *)&buf[4] = v10;
    _os_log_impl(&dword_1B7802000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: Significant time change occurred, date change occurred. Re-querying", buf, 0xCu);
  }
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(WeakRetained, "database");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = *(_QWORD *)(a1 + 32);
  v14 = *(_QWORD *)(v13 + 24);
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __75__HDCurrentActivitySummaryHelper__handleSignificantTimeChangeNotification___block_invoke_200;
  v15[3] = &unk_1E6CE80E8;
  v15[4] = v13;
  objc_msgSend(v12, "performWhenDataProtectedByFirstUnlockIsAvailableOnQueue:block:", v14, v15);

}

void __75__HDCurrentActivitySummaryHelper__handleSignificantTimeChangeNotification___block_invoke_200(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  -[HDCurrentActivitySummaryHelper _queue_setUpActivityQueryHelperOnlyIfUninitialized:](*(_QWORD *)(a1 + 32), 0);
  -[HDCurrentActivitySummaryHelper _createEmptyActivitySummaryForIndex:](*(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 48);
  *(_QWORD *)(v3 + 48) = v2;

  -[HDCurrentActivitySummaryHelper _createEmptyActivitySummaryForIndex:](*(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40));
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 56);
  *(_QWORD *)(v6 + 56) = v5;

  -[HDCurrentActivitySummaryHelper _queue_alertObserversTodaySummaryUpdatedWithChangedFields:](*(_QWORD *)(a1 + 32), -1);
  -[HDCurrentActivitySummaryHelper _queue_alertObserversYesterdaySummaryUpdatedWithChangedFields:](*(_QWORD *)(a1 + 32), -1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timezoneOverride, 0);
  objc_storeStrong((id *)&self->_dateOverride, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_typesForDataCollection, 0);
  objc_storeStrong((id *)&self->_yesterdaySummary, 0);
  objc_storeStrong((id *)&self->_todaySummary, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_queryHelper, 0);
  objc_destroyWeak((id *)&self->_profile);
}

@end
