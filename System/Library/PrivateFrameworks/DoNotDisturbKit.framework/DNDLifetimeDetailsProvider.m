@implementation DNDLifetimeDetailsProvider

- (DNDLifetimeDetailsProvider)init
{
  DNDLifetimeDetailsProvider *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *queue;
  NSObject *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *eventStoreQueue;
  NSObject *v9;
  dispatch_queue_t v10;
  OS_dispatch_queue *calloutQueue;
  NSObject *v12;
  DNDLifetimeDetailsProvider *v13;
  uint64_t v14;
  EKEventStore *eventStore;
  uint64_t v16;
  EKCalendarVisibilityManager *calendarVisibilityManager;
  __CFNotificationCenter *DarwinNotifyCenter;
  void *v19;
  _QWORD block[4];
  DNDLifetimeDetailsProvider *v22;
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)DNDLifetimeDetailsProvider;
  v2 = -[DNDLifetimeDetailsProvider init](&v23, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.donotdisturb.kit.LifetimeDetailsProvider", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = dispatch_queue_create("com.apple.donotdisturb.kit.LifetimeDetailsProvider.event-store", v6);
    eventStoreQueue = v2->_eventStoreQueue;
    v2->_eventStoreQueue = (OS_dispatch_queue *)v7;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = dispatch_queue_create("com.apple.donotdisturb.kit.LifetimeDetailsProvider.call-out", v9);
    calloutQueue = v2->_calloutQueue;
    v2->_calloutQueue = (OS_dispatch_queue *)v10;

    v12 = v2->_queue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __34__DNDLifetimeDetailsProvider_init__block_invoke;
    block[3] = &unk_24CF51578;
    v13 = v2;
    v22 = v13;
    dispatch_sync(v12, block);
    v14 = objc_msgSend(objc_alloc(MEMORY[0x24BDC74E8]), "initWithEKOptions:", 128);
    eventStore = v13->_eventStore;
    v13->_eventStore = (EKEventStore *)v14;

    -[EKEventStore requestFullAccessToEventsWithCompletion:](v13->_eventStore, "requestFullAccessToEventsWithCompletion:", &__block_literal_global_3);
    v16 = objc_msgSend(objc_alloc(MEMORY[0x24BDC74B8]), "initWithEventStore:visibilityChangedCallback:queue:", v13->_eventStore, &__block_literal_global_9, v2->_queue);
    calendarVisibilityManager = v13->_calendarVisibilityManager;
    v13->_calendarVisibilityManager = (EKCalendarVisibilityManager *)v16;

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v13, (CFNotificationCallback)DNDHandleSignificantTimeChange, CFSTR("SignificantTimeChangeNotification"), 0, CFNotificationSuspensionBehaviorCoalesce);
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addObserver:selector:name:object:", v13, sel__systemTimeChanged, *MEMORY[0x24BDBCBB8], 0);

  }
  return v2;
}

void __34__DNDLifetimeDetailsProvider_init__block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  v2 = objc_alloc(MEMORY[0x24BDBFA88]);
  objc_msgSend(MEMORY[0x24BDD1488], "dnd_locationBundle");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bundlePath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "initWithEffectiveBundlePath:delegate:onQueue:", v3, *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v4;

}

- (void)dealloc
{
  __CFNotificationCenter *DarwinNotifyCenter;
  void *v4;
  NSTimer *refreshTimer;
  objc_super v6;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, CFSTR("SignificantTimeChangeNotification"), 0);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:name:object:", self, *MEMORY[0x24BDBCBB8], 0);

  -[NSTimer invalidate](self->_refreshTimer, "invalidate");
  refreshTimer = self->_refreshTimer;
  self->_refreshTimer = 0;

  v6.receiver = self;
  v6.super_class = (Class)DNDLifetimeDetailsProvider;
  -[DNDLifetimeDetailsProvider dealloc](&v6, sel_dealloc);
}

- (void)requestLifetimeDetails
{
  uint64_t v3;
  NSObject *queue;
  NSObject *eventStoreQueue;
  _QWORD v6[4];
  id v7;
  id location;
  _QWORD block[5];

  v3 = MEMORY[0x24BDAC760];
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __52__DNDLifetimeDetailsProvider_requestLifetimeDetails__block_invoke;
  block[3] = &unk_24CF51578;
  block[4] = self;
  dispatch_async(queue, block);
  objc_initWeak(&location, self);
  eventStoreQueue = self->_eventStoreQueue;
  v6[0] = v3;
  v6[1] = 3221225472;
  v6[2] = __52__DNDLifetimeDetailsProvider_requestLifetimeDetails__block_invoke_2;
  v6[3] = &unk_24CF51728;
  objc_copyWeak(&v7, &location);
  dispatch_async(eventStoreQueue, v6);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

uint64_t __52__DNDLifetimeDetailsProvider_requestLifetimeDetails__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_requestLifetimeDetails");
}

void __52__DNDLifetimeDetailsProvider_requestLifetimeDetails__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_eventStoreQueue_requestRelevantEvent");
    WeakRetained = v2;
  }

}

- (void)resetLifetimeDetails
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __50__DNDLifetimeDetailsProvider_resetLifetimeDetails__block_invoke;
  block[3] = &unk_24CF51578;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __50__DNDLifetimeDetailsProvider_resetLifetimeDetails__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_requestLifetimeDetails");
}

- (void)startUpdatingLifetimeDetails
{
  if (!self->_monitoringLifetimes)
  {
    self->_monitoringLifetimes = 1;
    -[DNDLifetimeDetailsProvider requestLifetimeDetails](self, "requestLifetimeDetails");
    -[DNDLifetimeDetailsProvider _scheduleRefreshTimerIfNeeded](self, "_scheduleRefreshTimerIfNeeded");
  }
}

- (void)stopUpdatingLifetimeDetails
{
  if (self->_monitoringLifetimes)
  {
    self->_monitoringLifetimes = 0;
    -[NSTimer invalidate](self->_refreshTimer, "invalidate");
  }
}

- (id)lifetimeForLifetimeDetails:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  NSObject *queue;
  _QWORD block[6];
  uint64_t v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v5 = a3;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy_;
  v26 = __Block_byref_object_dispose_;
  v27 = 0;
  objc_msgSend(v5, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.donotdisturb.kit.lifetime.one-hour")))
  {
    objc_msgSend(MEMORY[0x24BE2D670], "lifetimeWithDuration:", 3600.0);
    v7 = objc_claimAutoreleasedReturnValue();
LABEL_3:
    v8 = (void *)v23[5];
    v23[5] = v7;

    goto LABEL_15;
  }
  if ((objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.donotdisturb.kit.lifetime.evening")) & 1) != 0
    || objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.donotdisturb.kit.lifetime.morning")))
  {
    objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 0;
    objc_msgSend(v9, "getHour:minute:second:nanosecond:fromDate:", &v21, 0, 0, 0, v10);
    if (v21 >= 4)
    {
      if ((unint64_t)v21 > 0x11)
      {
        objc_msgSend(v9, "dateBySettingHour:minute:second:ofDate:options:", 7, 0, 0, v10, 1);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "dateByAddingUnit:value:toDate:options:", 16, 1, v13, 0);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_14;
      }
      v11 = 19;
    }
    else
    {
      v11 = 7;
    }
    objc_msgSend(v9, "dateBySettingHour:minute:second:ofDate:options:", v11, 0, 0, v10, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_14:
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1508]), "initWithStartDate:endDate:", v10, v12);
    objc_msgSend(MEMORY[0x24BE2D670], "lifetimeWithDateInterval:", v14);
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = (void *)v23[5];
    v23[5] = v15;

    goto LABEL_15;
  }
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.donotdisturb.kit.lifetime.location")))
  {
    objc_msgSend(MEMORY[0x24BE2D670], "lifetimeWithCurrentLocation");
    v7 = objc_claimAutoreleasedReturnValue();
    goto LABEL_3;
  }
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.donotdisturb.kit.lifetime.event")))
  {
    queue = self->_queue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __63__DNDLifetimeDetailsProvider_lifetimeForLifetimeDetails_error___block_invoke;
    block[3] = &unk_24CF51750;
    block[4] = self;
    block[5] = &v22;
    dispatch_sync(queue, block);
  }
LABEL_15:
  v17 = (id)v23[5];

  _Block_object_dispose(&v22, 8);
  return v17;
}

void __63__DNDLifetimeDetailsProvider_lifetimeForLifetimeDetails_error___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "uniqueId");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v2 = (void *)MEMORY[0x24BE2D670];
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "occurrenceDate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "lifetimeUntilEndOfCalendarEventWithUniqueID:occurrenceDate:", v7, v3);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v4;

  }
}

- (id)lifetimeDetailsForAssertionDetails:(id)a3 error:(id *)a4
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v8;

  objc_msgSend(a3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.donotdisturb.kit.lifetime.one-hour")))
  {
    +[DNDLifetimeDetails lifetimeDetailsForOneHour](DNDLifetimeDetails, "lifetimeDetailsForOneHour");
    v5 = objc_claimAutoreleasedReturnValue();
LABEL_9:
    v6 = (void *)v5;
    goto LABEL_10;
  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.donotdisturb.kit.lifetime.evening")))
  {
    +[DNDLifetimeDetails lifetimeDetailsUntilEvening](DNDLifetimeDetails, "lifetimeDetailsUntilEvening");
    v5 = objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.donotdisturb.kit.lifetime.morning")))
  {
    +[DNDLifetimeDetails lifetimeDetailsUntilMorning](DNDLifetimeDetails, "lifetimeDetailsUntilMorning");
    v5 = objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.donotdisturb.kit.lifetime.location")))
  {
    +[DNDLifetimeDetails lifetimeDetailsForPlaceInference:](DNDLifetimeDetails, "lifetimeDetailsForPlaceInference:", 0);
    v5 = objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.donotdisturb.kit.lifetime.event")))
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[DNDLifetimeDetails lifetimeDetailsForEvent:relativeToDate:](DNDLifetimeDetails, "lifetimeDetailsForEvent:relativeToDate:", 0, v8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
LABEL_10:

  return v6;
}

- (void)lifetimeDetailsWithMetadataForAssertionDetails:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, uint64_t, _QWORD);
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  NSObject *eventStoreQueue;
  id v18;
  _QWORD v19[4];
  id v20;
  void (**v21)(id, uint64_t, _QWORD);
  id v22;
  id location;

  v6 = a3;
  v7 = (void (**)(id, uint64_t, _QWORD))a4;
  objc_msgSend(v6, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("com.apple.donotdisturb.kit.lifetime.one-hour")))
  {
    +[DNDLifetimeDetails lifetimeDetailsForOneHour](DNDLifetimeDetails, "lifetimeDetailsForOneHour");
    v9 = objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v8, "isEqualToString:", CFSTR("com.apple.donotdisturb.kit.lifetime.evening")))
  {
    +[DNDLifetimeDetails lifetimeDetailsUntilEvening](DNDLifetimeDetails, "lifetimeDetailsUntilEvening");
    v9 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!objc_msgSend(v8, "isEqualToString:", CFSTR("com.apple.donotdisturb.kit.lifetime.morning")))
      goto LABEL_9;
    +[DNDLifetimeDetails lifetimeDetailsUntilMorning](DNDLifetimeDetails, "lifetimeDetailsUntilMorning");
    v9 = objc_claimAutoreleasedReturnValue();
  }
  v10 = (void *)v9;
  if (v9)
  {
    v7[2](v7, v9, 0);

    goto LABEL_13;
  }
LABEL_9:
  objc_msgSend(v6, "lifetime");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "lifetimeType");

  if (v12 == 3)
  {
    +[DNDLifetimeDetails lifetimeDetailsForPlaceInference:](DNDLifetimeDetails, "lifetimeDetailsForPlaceInference:", self->_currentPlaceInference);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, (uint64_t)v13, 0);

  }
  else
  {
    objc_msgSend(v6, "lifetime");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "lifetimeType");

    if (v15 == 1)
    {
      objc_msgSend(v6, "lifetime");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_initWeak(&location, self);
      eventStoreQueue = self->_eventStoreQueue;
      v19[0] = MEMORY[0x24BDAC760];
      v19[1] = 3221225472;
      v19[2] = __95__DNDLifetimeDetailsProvider_lifetimeDetailsWithMetadataForAssertionDetails_completionHandler___block_invoke;
      v19[3] = &unk_24CF51778;
      objc_copyWeak(&v22, &location);
      v20 = v16;
      v21 = v7;
      v18 = v16;
      dispatch_async(eventStoreQueue, v19);

      objc_destroyWeak(&v22);
      objc_destroyWeak(&location);
    }
  }
LABEL_13:

}

void __95__DNDLifetimeDetailsProvider_lifetimeDetailsWithMetadataForAssertionDetails_completionHandler___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v8 = WeakRetained;
    objc_msgSend(WeakRetained, "_eventStoreQueue_eventForCalendarEventLifetime:", *(_QWORD *)(a1 + 32));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[DNDLifetimeDetails lifetimeDetailsForEvent:relativeToDate:](DNDLifetimeDetails, "lifetimeDetailsForEvent:relativeToDate:", v4, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
LABEL_5:
    v3 = v8;
    goto LABEL_6;
  }
  v7 = *(_QWORD *)(a1 + 40);
  if (v7)
  {
    v8 = 0;
    (*(void (**)(uint64_t, _QWORD, _QWORD))(v7 + 16))(v7, 0, 0);
    goto LABEL_5;
  }
LABEL_6:

}

- (void)_queue_rebuildAvailableLifetimeDetails
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  EKEvent *relevantEvent;
  void *v12;
  void *v13;
  void *v14;
  NSObject *calloutQueue;
  _QWORD block[4];
  id v17;
  DNDLifetimeDetailsProvider *v18;
  id v19;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[DNDLifetimeDetails lifetimeDetailsForOneHour](DNDLifetimeDetails, "lifetimeDetailsForOneHour");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v5);

  -[DNDLifetimeDetailsProvider _lifetimeDetailsUntilEveningOrMorningForDate:](self, "_lifetimeDetailsUntilEveningOrMorningForDate:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v6);

  v7 = (void *)MEMORY[0x24BDBFA88];
  objc_msgSend(MEMORY[0x24BDD1488], "dnd_locationBundle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bundlePath");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v7) = objc_msgSend(v7, "authorizationStatusForBundlePath:", v9);

  if ((_DWORD)v7 == 3)
  {
    +[DNDLifetimeDetails lifetimeDetailsForPlaceInference:](DNDLifetimeDetails, "lifetimeDetailsForPlaceInference:", self->_currentPlaceInference);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v10);

  }
  relevantEvent = self->_relevantEvent;
  if (relevantEvent)
  {
    +[DNDLifetimeDetails lifetimeDetailsForEvent:relativeToDate:](DNDLifetimeDetails, "lifetimeDetailsForEvent:relativeToDate:", relevantEvent, v3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v12);

  }
  v13 = (void *)objc_msgSend(v4, "copy");
  if (!-[NSArray isEqualToArray:](self->_availableLifetimeDetails, "isEqualToArray:", v13))
  {
    objc_storeStrong((id *)&self->_availableLifetimeDetails, v13);
    -[DNDLifetimeDetailsProvider delegate](self, "delegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      calloutQueue = self->_calloutQueue;
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __68__DNDLifetimeDetailsProvider__queue_rebuildAvailableLifetimeDetails__block_invoke;
      block[3] = &unk_24CF517A0;
      v17 = v14;
      v18 = self;
      v19 = v13;
      dispatch_async(calloutQueue, block);

    }
  }

}

uint64_t __68__DNDLifetimeDetailsProvider__queue_rebuildAvailableLifetimeDetails__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "lifetimeDetailsProvider:didUpdateAvailableLifetimeDetails:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (id)_lifetimeDetailsUntilEveningOrMorningForDate:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v7;

  v7 = 0;
  v3 = (void *)MEMORY[0x24BDBCE48];
  v4 = a3;
  objc_msgSend(v3, "currentCalendar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "getHour:minute:second:nanosecond:fromDate:", &v7, 0, 0, 0, v4);

  if ((unint64_t)(v7 - 4) > 0xD)
    +[DNDLifetimeDetails lifetimeDetailsUntilMorning](DNDLifetimeDetails, "lifetimeDetailsUntilMorning");
  else
    +[DNDLifetimeDetails lifetimeDetailsUntilEvening](DNDLifetimeDetails, "lifetimeDetailsUntilEvening");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)_requestRelevantLocationMetadata
{
  CLLocationManager *locationManager;
  _QWORD v3[5];

  locationManager = self->_locationManager;
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __62__DNDLifetimeDetailsProvider__requestRelevantLocationMetadata__block_invoke;
  v3[3] = &unk_24CF517C8;
  v3[4] = self;
  -[CLLocationManager _fetchPlaceInferencesWithFidelityPolicy:handler:](locationManager, "_fetchPlaceInferencesWithFidelityPolicy:handler:", 1, v3);
}

void __62__DNDLifetimeDetailsProvider__requestRelevantLocationMetadata__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = DNDLogLocation;
    if (os_log_type_enabled((os_log_t)DNDLogLocation, OS_LOG_TYPE_ERROR))
      __62__DNDLifetimeDetailsProvider__requestRelevantLocationMetadata__block_invoke_cold_1((uint64_t)v6, v7);
  }
  objc_msgSend(*(id *)(a1 + 32), "_queue_gotPlaceInferences:", v5);

}

- (void)_queue_gotPlaceInferences:(id)a3
{
  NSObject *queue;
  id v5;
  void *v6;
  _CLPlaceInference *v7;
  _CLPlaceInference *currentPlaceInference;

  queue = self->_queue;
  v5 = a3;
  dispatch_assert_queue_V2(queue);
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (_CLPlaceInference *)objc_msgSend(v6, "copy");
  currentPlaceInference = self->_currentPlaceInference;
  self->_currentPlaceInference = v7;

  -[DNDLifetimeDetailsProvider _queue_rebuildAvailableLifetimeDetails](self, "_queue_rebuildAvailableLifetimeDetails");
}

- (void)_queue_resetLifetimeDetails
{
  _CLPlaceInference *currentPlaceInference;
  EKEvent *relevantEvent;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[EKEventStore reset](self->_eventStore, "reset");
  currentPlaceInference = self->_currentPlaceInference;
  self->_currentPlaceInference = 0;

  relevantEvent = self->_relevantEvent;
  self->_relevantEvent = 0;

}

- (void)_queue_requestLifetimeDetails
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[DNDLifetimeDetailsProvider _queue_resetLifetimeDetails](self, "_queue_resetLifetimeDetails");
  -[DNDLifetimeDetailsProvider _queue_rebuildAvailableLifetimeDetails](self, "_queue_rebuildAvailableLifetimeDetails");
}

- (void)_eventStoreQueue_requestRelevantEvent
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  id v19;
  NSObject *queue;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD block[5];
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_eventStoreQueue);
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dateByAddingTimeInterval:", 900.0);
  v4 = objc_claimAutoreleasedReturnValue();
  -[EKCalendarVisibilityManager visibleCalendars](self->_calendarVisibilityManager, "visibleCalendars");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (void *)v4;
  -[EKEventStore predicateForEventsWithStartDate:endDate:calendars:](self->_eventStore, "predicateForEventsWithStartDate:endDate:calendars:", v3, v4);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKEventStore eventsMatchingPredicate:](self->_eventStore, "eventsMatchingPredicate:");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "bs_filter:", &__block_literal_global_27);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v29 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        objc_msgSend(v12, "startDate");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "timeIntervalSinceDate:", v3);
        v15 = fabs(v14);
        objc_msgSend(v6, "startDate");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "timeIntervalSinceDate:", v3);
        v18 = fabs(v17);

        if (v15 < v18)
        {
          v19 = v12;

          v6 = v19;
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    }
    while (v9);
  }

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __67__DNDLifetimeDetailsProvider__eventStoreQueue_requestRelevantEvent__block_invoke_2;
  block[3] = &unk_24CF515C0;
  block[4] = self;
  v27 = v6;
  v21 = v6;
  dispatch_async(queue, block);

}

BOOL __67__DNDLifetimeDetailsProvider__eventStoreQueue_requestRelevantEvent__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  _BOOL8 v3;

  v2 = a2;
  v3 = (objc_msgSend(v2, "isAllDay") & 1) == 0
    && objc_msgSend(v2, "participationStatus") != 3
    && objc_msgSend(v2, "status") != 3;

  return v3;
}

uint64_t __67__DNDLifetimeDetailsProvider__eventStoreQueue_requestRelevantEvent__block_invoke_2(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 80), *(id *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "_queue_rebuildAvailableLifetimeDetails");
}

- (id)_eventStoreQueue_eventForCalendarEventLifetime:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  _QWORD v14[4];
  id v15;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_eventStoreQueue);
  if ((objc_msgSend(v4, "isOnlyDuringEvent") & 1) != 0)
    objc_msgSend(v4, "occurrenceDate");
  else
    objc_msgSend(MEMORY[0x24BDBCE60], "now");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dateByAddingTimeInterval:", 900.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKCalendarVisibilityManager visibleCalendars](self->_calendarVisibilityManager, "visibleCalendars");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKEventStore predicateForEventsWithStartDate:endDate:calendars:](self->_eventStore, "predicateForEventsWithStartDate:endDate:calendars:", v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKEventStore eventsMatchingPredicate:](self->_eventStore, "eventsMatchingPredicate:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __77__DNDLifetimeDetailsProvider__eventStoreQueue_eventForCalendarEventLifetime___block_invoke;
  v14[3] = &unk_24CF51830;
  v15 = v4;
  v10 = v4;
  objc_msgSend(v9, "bs_filter:", v14);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "firstObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

uint64_t __77__DNDLifetimeDetailsProvider__eventStoreQueue_eventForCalendarEventLifetime___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "uniqueId");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "eventUniqueID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqualToString:", v4);

  return v5;
}

- (void)_scheduleRefreshTimerIfNeeded
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __59__DNDLifetimeDetailsProvider__scheduleRefreshTimerIfNeeded__block_invoke;
  block[3] = &unk_24CF51578;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __59__DNDLifetimeDetailsProvider__scheduleRefreshTimerIfNeeded__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_scheduleRefreshTimerIfNeeded");
}

- (void)_queue_scheduleRefreshTimerIfNeeded
{
  void *v3;
  NSTimer *refreshTimer;
  void *v5;
  char v6;
  NSTimer *v7;
  id v8;
  NSTimer *v9;
  NSTimer *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t);
  void *v15;
  id v16;
  id location;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[DNDLifetimeDetailsProvider _nextRefreshTimerFireDate](self, "_nextRefreshTimerFireDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  refreshTimer = self->_refreshTimer;
  if (!refreshTimer)
    goto LABEL_5;
  -[NSTimer fireDate](refreshTimer, "fireDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqual:", v3);

  if ((v6 & 1) == 0)
  {
    -[NSTimer invalidate](self->_refreshTimer, "invalidate");
    v7 = self->_refreshTimer;
    self->_refreshTimer = 0;

  }
  if (!self->_refreshTimer)
  {
LABEL_5:
    objc_initWeak(&location, self);
    v8 = objc_alloc(MEMORY[0x24BDBCF40]);
    v12 = MEMORY[0x24BDAC760];
    v13 = 3221225472;
    v14 = __65__DNDLifetimeDetailsProvider__queue_scheduleRefreshTimerIfNeeded__block_invoke;
    v15 = &unk_24CF51858;
    objc_copyWeak(&v16, &location);
    v9 = (NSTimer *)objc_msgSend(v8, "initWithFireDate:interval:repeats:block:", v3, 0, &v12, 0.0);
    v10 = self->_refreshTimer;
    self->_refreshTimer = v9;

    objc_msgSend(MEMORY[0x24BDBCF18], "currentRunLoop", v12, v13, v14, v15);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addTimer:forMode:", self->_refreshTimer, *MEMORY[0x24BDBCB80]);

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }

}

void __65__DNDLifetimeDetailsProvider__queue_scheduleRefreshTimerIfNeeded__block_invoke(uint64_t a1)
{
  _BYTE *WeakRetained;
  _BYTE *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "requestLifetimeDetails");
    WeakRetained = v2;
    if (v2[32])
    {
      objc_msgSend(v2, "_scheduleRefreshTimerIfNeeded");
      WeakRetained = v2;
    }
  }

}

- (id)_nextRefreshTimerFireDate
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v8;

  objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  objc_msgSend(v2, "getHour:minute:second:nanosecond:fromDate:", &v8, 0, 0, 0, v3);
  if (v8 > 3)
  {
    if ((unint64_t)v8 > 0x11)
    {
      objc_msgSend(v2, "dateBySettingHour:minute:second:ofDate:options:", 4, 0, 0, v3, 1);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "dateByAddingUnit:value:toDate:options:", 16, 1, v6, 0);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_7;
    }
    v4 = 18;
  }
  else
  {
    v4 = 4;
  }
  objc_msgSend(v2, "dateBySettingHour:minute:second:ofDate:options:", v4, 0, 0, v3, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:

  return v5;
}

- (void)_systemTimeChanged
{
  -[DNDLifetimeDetailsProvider requestLifetimeDetails](self, "requestLifetimeDetails");
  -[DNDLifetimeDetailsProvider _scheduleRefreshTimerIfNeeded](self, "_scheduleRefreshTimerIfNeeded");
}

- (NSArray)availableLifetimeDetails
{
  return self->_availableLifetimeDetails;
}

- (DNDLifetimeDetailsProviderDelegate)delegate
{
  return (DNDLifetimeDetailsProviderDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_availableLifetimeDetails, 0);
  objc_storeStrong((id *)&self->_relevantEvent, 0);
  objc_storeStrong((id *)&self->_calendarVisibilityManager, 0);
  objc_storeStrong((id *)&self->_eventStore, 0);
  objc_storeStrong((id *)&self->_currentPlaceInference, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);
  objc_storeStrong((id *)&self->_refreshTimer, 0);
  objc_storeStrong((id *)&self->_calloutQueue, 0);
  objc_storeStrong((id *)&self->_eventStoreQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __62__DNDLifetimeDetailsProvider__requestRelevantLocationMetadata__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_21314A000, a2, OS_LOG_TYPE_ERROR, "Error determining location: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end
