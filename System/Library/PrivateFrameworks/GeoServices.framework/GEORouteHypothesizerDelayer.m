@implementation GEORouteHypothesizerDelayer

+ (void)checkin
{
  if (BackgroundSystemTasksLibraryCore())
  {
    if (checkin_onceToken != -1)
      dispatch_once(&checkin_onceToken, &__block_literal_global_46);
  }
}

void __38__GEORouteHypothesizerDelayer_checkin__block_invoke()
{
  void *v0;
  char v1;
  NSObject *v2;
  uint64_t v3;
  uint8_t buf[4];
  const __CFString *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(getBGSystemTaskSchedulerClass(), "sharedScheduler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = 0;
  v1 = objc_msgSend(v0, "cancelTaskRequestWithIdentifier:error:", CFSTR("com.apple.navd.delayHypothesisTask"), &v3);

  if ((v1 & 1) == 0)
  {
    GEOFindOrCreateLog("com.apple.GeoServices", "GEORouteHypothesizer");
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v5 = CFSTR("com.apple.navd.delayHypothesisTask");
      _os_log_impl(&dword_1885A9000, v2, OS_LOG_TYPE_ERROR, "Unable to cancel task request for %@ ", buf, 0xCu);
    }

  }
}

- (GEORouteHypothesizerDelayer)init
{
  GEORouteHypothesizerDelayer *v2;
  __int128 v3;
  uint64_t v4;
  geo_isolater *isolater;
  void *v6;
  char v7;
  NSObject *v8;
  _QWORD v10[4];
  GEORouteHypothesizerDelayer *v11;
  CFBinaryHeapCallBacks callBacks;
  objc_super v13;
  uint8_t buf[4];
  const __CFString *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v13.receiver = self;
  v13.super_class = (Class)GEORouteHypothesizerDelayer;
  v2 = -[GEORouteHypothesizerDelayer init](&v13, sel_init);
  if (v2)
  {
    v3 = *(_OWORD *)(MEMORY[0x1E0C9B330] + 16);
    *(_OWORD *)&callBacks.version = *MEMORY[0x1E0C9B330];
    *(_OWORD *)&callBacks.release = v3;
    callBacks.compare = (CFComparisonResult (__cdecl *)(const void *, const void *, void *))GEORouteHypothesizerDelayerCompare;
    v2->_minHeap = CFBinaryHeapCreate(0, 0, &callBacks, 0);
    v4 = geo_isolater_create();
    isolater = v2->_isolater;
    v2->_isolater = (geo_isolater *)v4;

    if (BackgroundSystemTasksLibraryCore())
    {
      objc_msgSend(getBGSystemTaskSchedulerClass(), "sharedScheduler");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __35__GEORouteHypothesizerDelayer_init__block_invoke;
      v10[3] = &unk_1E1C06D38;
      v11 = v2;
      v7 = objc_msgSend(v6, "registerForTaskWithIdentifier:usingQueue:launchHandler:", CFSTR("com.apple.navd.delayHypothesisTask"), 0, v10);

      if ((v7 & 1) == 0)
      {
        GEOFindOrCreateLog("com.apple.GeoServices", "GEORouteHypothesizer");
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v15 = CFSTR("com.apple.navd.delayHypothesisTask");
          _os_log_impl(&dword_1885A9000, v8, OS_LOG_TYPE_ERROR, "Failed to register %@", buf, 0xCu);
        }

      }
    }
  }
  return v2;
}

uint64_t __35__GEORouteHypothesizerDelayer_init__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_startValidHypothesizers:", a2);
}

- (void)_startValidHypothesizers:(id)a3
{
  id v3;
  id v4;

  v4 = a3;
  v3 = v4;
  geo_isolate_sync();

}

void __56__GEORouteHypothesizerDelayer__startValidHypothesizers___block_invoke(uint64_t a1)
{
  CFIndex Count;
  NSObject *v3;
  void *v4;
  void *v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  int v13;
  CFIndex v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  Count = CFBinaryHeapGetCount(*(CFBinaryHeapRef *)(*(_QWORD *)(a1 + 32) + 8));
  GEOFindOrCreateLog("com.apple.GeoServices", "GEORouteHypothesizer");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v13 = 134217984;
    v14 = Count;
    _os_log_impl(&dword_1885A9000, v3, OS_LOG_TYPE_DEBUG, "Delayer fired.  Heap size is %ld", (uint8_t *)&v13, 0xCu);
  }

  if (Count)
  {
    CFBinaryHeapGetMinimum(*(CFBinaryHeapRef *)(*(_QWORD *)(a1 + 32) + 8));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "willBeginHypothesizingInterval");
    objc_msgSend(v5, "dateByAddingTimeInterval:", -v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      do
      {
        objc_msgSend(v4, "plannedDestination");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "arrivalDate");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "compare:", v7);

        if (v10 == 1)
          break;
        objc_msgSend(v4, "_performDelayedStart");
        CFBinaryHeapRemoveMinimumValue(*(CFBinaryHeapRef *)(*(_QWORD *)(a1 + 32) + 8));
        if (!CFBinaryHeapGetCount(*(CFBinaryHeapRef *)(*(_QWORD *)(a1 + 32) + 8)))
        {

          v4 = 0;
          break;
        }
        v11 = objc_retainAutoreleasedReturnValue((id)CFBinaryHeapGetMinimum(*(CFBinaryHeapRef *)(*(_QWORD *)(a1 + 32)
                                                                                               + 8)));

        v4 = v11;
      }
      while (v11);
    }
    objc_msgSend(*(id *)(a1 + 40), "setTaskCompleted");
    objc_msgSend(*(id *)(a1 + 32), "_setNextHypothesizer:", v4);
    GEOFindOrCreateLog("com.apple.GeoServices", "GEORouteHypothesizer");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v13) = 0;
      _os_log_impl(&dword_1885A9000, v12, OS_LOG_TYPE_DEBUG, "Finished after delayer fired.", (uint8_t *)&v13, 2u);
    }

  }
}

- (void)_setNextHypothesizer:(id)a3
{
  GEORouteHypothesizer *v5;
  GEORouteHypothesizer **p_nextHypothesizer;
  GEORouteHypothesizer *nextHypothesizer;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  char v18;
  __CFString *v19;
  NSObject *v20;
  NSObject *v21;
  void *v22;
  const __CFString *v23;
  id v24;
  uint8_t buf[4];
  double v26;
  __int16 v27;
  double v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = (GEORouteHypothesizer *)a3;
  if (BackgroundSystemTasksLibraryCore())
  {
    nextHypothesizer = self->_nextHypothesizer;
    p_nextHypothesizer = &self->_nextHypothesizer;
    if (nextHypothesizer != v5)
    {
      objc_storeStrong((id *)p_nextHypothesizer, a3);
      if (*p_nextHypothesizer)
      {
        -[GEORouteHypothesizer plannedDestination](*p_nextHypothesizer, "plannedDestination");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "arrivalDate");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[GEORouteHypothesizer willBeginHypothesizingInterval](*p_nextHypothesizer, "willBeginHypothesizingInterval");
        objc_msgSend(v9, "dateByAddingTimeInterval:");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "timeIntervalSinceNow");
        v12 = v11 + randomJitterForHypothesisWakeup();

        +[GEONavdDefaults sharedInstance](GEONavdDefaults, "sharedInstance");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "maximumRefreshIntervalLeeway");
        v15 = v14;

        v16 = (void *)objc_msgSend(objc_alloc((Class)getBGNonRepeatingSystemTaskRequestClass()), "initWithIdentifier:", CFSTR("com.apple.navd.delayHypothesisTask"));
        objc_msgSend(v16, "setPriority:", 2);
        objc_msgSend(v16, "setRequiresExternalPower:", 0);
        objc_msgSend(v16, "setShouldWakeDevice:", 1);
        objc_msgSend(v16, "setScheduleAfter:", v12);
        objc_msgSend(v16, "setTrySchedulingBefore:", v12 + v15);
        objc_msgSend(getBGSystemTaskSchedulerClass(), "sharedScheduler");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = 0;
        v18 = objc_msgSend(v17, "submitTaskRequest:error:", v16, &v24);
        v19 = (__CFString *)v24;

        GEOFindOrCreateLog("com.apple.GeoServices", "GEORouteHypothesizer");
        v20 = objc_claimAutoreleasedReturnValue();
        v21 = v20;
        if ((v18 & 1) != 0)
        {
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
          {
            -[GEORouteHypothesizer plannedDestination](*p_nextHypothesizer, "plannedDestination");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 134218499;
            v26 = v12;
            v27 = 2048;
            v28 = v15;
            v29 = 2113;
            v30 = v22;
            _os_log_impl(&dword_1885A9000, v21, OS_LOG_TYPE_DEBUG, "Scheduling task with delay %f and leeway %f based on destination %{private}@", buf, 0x20u);

          }
        }
        else if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          v23 = CFSTR("Unknown");
          if (v19)
            v23 = v19;
          *(_DWORD *)buf = 138412290;
          v26 = *(double *)&v23;
          _os_log_impl(&dword_1885A9000, v21, OS_LOG_TYPE_ERROR, "Failed to submit nonrepeating task with error: %@", buf, 0xCu);
        }

      }
    }
  }

}

- (void)delayStartOfHypothesizer:(id)a3
{
  id v3;
  id v4;

  v4 = a3;
  v3 = v4;
  geo_isolate_sync();

}

void __56__GEORouteHypothesizerDelayer_delayStartOfHypothesizer___block_invoke(uint64_t a1)
{
  const void *v1;
  id v3;

  v1 = *(const void **)(a1 + 32);
  if (v1)
  {
    CFBinaryHeapAddValue(*(CFBinaryHeapRef *)(*(_QWORD *)(a1 + 40) + 8), v1);
    CFBinaryHeapGetMinimum(*(CFBinaryHeapRef *)(*(_QWORD *)(a1 + 40) + 8));
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "_setNextHypothesizer:", v3);

  }
}

- (void)dealloc
{
  void *v3;
  char v4;
  NSObject *v5;
  objc_super v6;
  uint8_t buf[4];
  const __CFString *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (BackgroundSystemTasksLibraryCore())
  {
    objc_msgSend(getBGSystemTaskSchedulerClass(), "sharedScheduler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "deregisterTaskWithIdentifier:", CFSTR("com.apple.navd.delayHypothesisTask"));

    if ((v4 & 1) == 0)
    {
      GEOFindOrCreateLog("com.apple.GeoServices", "GEORouteHypothesizer");
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v8 = CFSTR("com.apple.navd.delayHypothesisTask");
        _os_log_impl(&dword_1885A9000, v5, OS_LOG_TYPE_ERROR, "Failed to deregister %@", buf, 0xCu);
      }

    }
    CFRelease(self->_minHeap);
  }
  v6.receiver = self;
  v6.super_class = (Class)GEORouteHypothesizerDelayer;
  -[GEORouteHypothesizerDelayer dealloc](&v6, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_isolater, 0);
  objc_storeStrong((id *)&self->_nextHypothesizer, 0);
}

@end
