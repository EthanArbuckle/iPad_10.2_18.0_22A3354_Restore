@implementation MessageListCellsController

- (void)reportMessageListCellMetrics
{
  -[MessageListCellsController _reportBlankCellMetrics]((os_unfair_lock_s *)self);
  -[MessageListCellsController _reportFlickeringCellMetrics]((uint64_t)self);
}

- (void)_reportFlickeringCellMetrics
{
  id v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  NSObject *v13;
  _QWORD v14[4];
  id v15;
  uint8_t buf[4];
  uint64_t v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v2 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 8));
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend((id)a1, "numberOfVisibleCells"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v3, CFSTR("numberOfVisibleCells"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend((id)a1, "numberOfFlickeringCells"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v4, CFSTR("numberOfFlickeringCells"));

    v5 = *(id *)(a1 + 80);
    v6 = (void *)objc_msgSend(v5, "copy");
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v6, CFSTR("duration"));

    v7 = *(id *)(a1 + 88);
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __58__MessageListCellsController__reportFlickeringCellMetrics__block_invoke;
    v14[3] = &unk_1E99E1378;
    v8 = v2;
    v15 = v8;
    objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", v14);

    objc_msgSend((id)a1, "setNumberOfVisibleCells:", 0);
    objc_msgSend((id)a1, "setNumberOfFlickeringCells:", 0);
    v9 = *(id *)(a1 + 80);
    objc_msgSend(v9, "removeAllObjects");

    v10 = *(id *)(a1 + 88);
    objc_msgSend(v10, "removeAllObjects");

    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 8));
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1E140]), "initWithEventName:collectionData:", CFSTR("com.apple.mail.messagelist.flicker"), v8);
    objc_msgSend((id)a1, "analyticsCollector");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "logOneTimeEvent:", v11);

    +[MessageListCellsController log](MessageListCellsController, "log");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      v17 = a1;
      v18 = 2114;
      v19 = v8;
      _os_log_impl(&dword_1D5522000, v13, OS_LOG_TYPE_DEFAULT, "%p: Report flickering cell metrics to CoreAnalytics %{public}@", buf, 0x16u);
    }

  }
}

- (void)setNumberOfVisibleCells:(int64_t)a3
{
  self->_numberOfVisibleCells = a3;
}

- (void)setNumberOfFlickeringCells:(int64_t)a3
{
  self->_numberOfFlickeringCells = a3;
}

- (int64_t)numberOfVisibleCells
{
  return self->_numberOfVisibleCells;
}

- (int64_t)numberOfFlickeringCells
{
  return self->_numberOfFlickeringCells;
}

- (void)_reportBlankCellMetrics
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  _QWORD v11[4];
  id v12;
  uint8_t buf[4];
  os_unfair_lock_s *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v2 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    os_unfair_lock_lock(a1 + 2);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[os_unfair_lock_s loadAttempts](a1, "loadAttempts"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v3, CFSTR("loadAttempts"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[os_unfair_lock_s loadFailures](a1, "loadFailures"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v4, CFSTR("loadFailures"));

    -[os_unfair_lock_s failureCodeCount](a1, "failureCodeCount");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __53__MessageListCellsController__reportBlankCellMetrics__block_invoke;
    v11[3] = &unk_1E99E1378;
    v6 = v2;
    v12 = v6;
    objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v11);

    -[os_unfair_lock_s setLoadAttempts:](a1, "setLoadAttempts:", 0);
    -[os_unfair_lock_s setLoadFailures:](a1, "setLoadFailures:", 0);
    -[os_unfair_lock_s failureCodeCount](a1, "failureCodeCount");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeAllObjects");

    os_unfair_lock_unlock(a1 + 2);
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1E140]), "initWithEventName:collectionData:", CFSTR("com.apple.mail.messagelist.loadingMessage"), v6);
    -[os_unfair_lock_s analyticsCollector](a1, "analyticsCollector");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "logOneTimeEvent:", v8);

    +[MessageListCellsController log](MessageListCellsController, "log");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      v14 = a1;
      v15 = 2114;
      v16 = v6;
      _os_log_impl(&dword_1D5522000, v10, OS_LOG_TYPE_DEFAULT, "%p: Report blank cell metrics to CoreAnalytics %{public}@", buf, 0x16u);
    }

  }
}

- (void)reportCellDidLoad:(BOOL)a3 error:(id)a4
{
  _BOOL4 v4;
  os_unfair_lock_s *p_analyticsLock;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v4 = a3;
  v16 = a4;
  p_analyticsLock = &self->_analyticsLock;
  os_unfair_lock_lock(&self->_analyticsLock);
  -[MessageListCellsController setLoadAttempts:](self, "setLoadAttempts:", -[MessageListCellsController loadAttempts](self, "loadAttempts") + 1);
  -[MessageListCellsController setLoadFailures:](self, "setLoadFailures:", -[MessageListCellsController loadFailures](self, "loadFailures") + !v4);
  if (v16)
  {
    -[MessageListCellsController failureCodeCount](self, "failureCodeCount");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v16, "code"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringValue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", v9);
    v10 = objc_claimAutoreleasedReturnValue();

    if (v10)
      v11 = (void *)v10;
    else
      v11 = &unk_1E9A01660;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v11, "integerValue") + 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[MessageListCellsController failureCodeCount](self, "failureCodeCount");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v16, "code"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringValue");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v12, v15);

  }
  os_unfair_lock_unlock(p_analyticsLock);

}

- (void)setLoadFailures:(int64_t)a3
{
  self->_loadFailures = a3;
}

- (void)setLoadAttempts:(int64_t)a3
{
  self->_loadAttempts = a3;
}

- (int64_t)loadFailures
{
  return self->_loadFailures;
}

- (int64_t)loadAttempts
{
  return self->_loadAttempts;
}

- (NSMutableDictionary)failureCodeCount
{
  return self->_failureCodeCount;
}

- (EMCoreAnalyticsCollector)analyticsCollector
{
  return self->_analyticsCollector;
}

+ (OS_os_log)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __33__MessageListCellsController_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_0 != -1)
    dispatch_once(&log_onceToken_0, block);
  return (OS_os_log *)(id)log_log_0;
}

void __33__MessageListCellsController_log__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)log_log_0;
  log_log_0 = (uint64_t)v1;

}

- (MessageListCellsController)init
{
  MessageListCellsController *v2;
  id v3;
  id v4;
  uint64_t v5;
  EFLocked *visibleItemIDs;
  NSMutableDictionary *v7;
  NSMutableDictionary *failureCodeCount;
  NSMutableArray *v9;
  NSMutableArray *rawFlickerDurations;
  NSMutableDictionary *v11;
  NSMutableDictionary *bucketedFlickerDurations;
  EMCoreAnalyticsCollector *v13;
  EMCoreAnalyticsCollector *analyticsCollector;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)MessageListCellsController;
  v2 = -[MessageListCellsController init](&v16, sel_init);
  if (v2)
  {
    v3 = objc_alloc(MEMORY[0x1E0D1EEF0]);
    v4 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v5 = objc_msgSend(v3, "initWithObject:", v4);
    visibleItemIDs = v2->_visibleItemIDs;
    v2->_visibleItemIDs = (EFLocked *)v5;

    v2->_loadAttempts = 0;
    v2->_loadFailures = 0;
    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    failureCodeCount = v2->_failureCodeCount;
    v2->_failureCodeCount = v7;

    v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    rawFlickerDurations = v2->_rawFlickerDurations;
    v2->_rawFlickerDurations = v9;

    v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    bucketedFlickerDurations = v2->_bucketedFlickerDurations;
    v2->_bucketedFlickerDurations = v11;

    v13 = (EMCoreAnalyticsCollector *)objc_alloc_init(MEMORY[0x1E0D1E138]);
    analyticsCollector = v2->_analyticsCollector;
    v2->_analyticsCollector = v13;

    v2->_analyticsLock._os_unfair_lock_opaque = 0;
  }
  return v2;
}

- (void)markItemIDsAsVisibleBeforeUpdate:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t);
  void *v15;
  id v16;
  _QWORD v17[4];
  id v18;
  _BYTE buf[12];
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[MessageListCellsController log](MessageListCellsController, "log");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218498;
    *(_QWORD *)&buf[4] = self;
    v20 = 2048;
    v21 = objc_msgSend(v4, "count");
    v22 = 2114;
    v23 = v4;
    _os_log_impl(&dword_1D5522000, v5, OS_LOG_TYPE_DEFAULT, "%p: Mark item %lu ids as visible before update: %{public}@", buf, 0x20u);
  }

  -[MessageListCellsController currentUpdateToken](self, "currentUpdateToken");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "cancel");

  -[MessageListCellsController visibleItemIDs](self, "visibleItemIDs");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __63__MessageListCellsController_markItemIDsAsVisibleBeforeUpdate___block_invoke;
  v17[3] = &unk_1E99E1300;
  v9 = v4;
  v18 = v9;
  objc_msgSend(v7, "performWhileLocked:", v17);

  *(_QWORD *)buf = 0xAAAAAAAAAAAAAAAALL;
  objc_initWeak((id *)buf, self);
  objc_msgSend(MEMORY[0x1E0D1F070], "mainThreadScheduler");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v8;
  v13 = 3221225472;
  v14 = __63__MessageListCellsController_markItemIDsAsVisibleBeforeUpdate___block_invoke_2;
  v15 = &unk_1E99E1328;
  objc_copyWeak(&v16, (id *)buf);
  objc_msgSend(v10, "afterDelay:performBlock:", &v12, 2.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[MessageListCellsController setCurrentUpdateToken:](self, "setCurrentUpdateToken:", v11, v12, v13, v14, v15);

  objc_destroyWeak(&v16);
  objc_destroyWeak((id *)buf);

}

void __63__MessageListCellsController_markItemIDsAsVisibleBeforeUpdate___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_msgSend(v3, "removeAllObjects");
  objc_msgSend(v3, "addObjectsFromArray:", *(_QWORD *)(a1 + 32));

}

void __63__MessageListCellsController_markItemIDsAsVisibleBeforeUpdate___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  id v3;
  _QWORD v4[5];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "visibleItemIDs");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __63__MessageListCellsController_markItemIDsAsVisibleBeforeUpdate___block_invoke_3;
    v4[3] = &unk_1E99E1300;
    v4[4] = v3;
    objc_msgSend(v2, "performWhileLocked:", v4);

    WeakRetained = v3;
  }

}

void __63__MessageListCellsController_markItemIDsAsVisibleBeforeUpdate___block_invoke_3(uint64_t a1, void *a2)
{
  os_unfair_lock_s *v3;
  id v4;

  v4 = a2;
  v3 = (os_unfair_lock_s *)(*(_QWORD *)(a1 + 32) + 8);
  os_unfair_lock_lock(v3);
  objc_msgSend(*(id *)(a1 + 32), "setNumberOfVisibleCells:", objc_msgSend(*(id *)(a1 + 32), "numberOfVisibleCells") + objc_msgSend(v4, "count"));
  os_unfair_lock_unlock(v3);
  objc_msgSend(v4, "removeAllObjects");

}

- (BOOL)wasItemRecentlyVisible:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v8[4];
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
  -[MessageListCellsController visibleItemIDs](self, "visibleItemIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __53__MessageListCellsController_wasItemRecentlyVisible___block_invoke;
  v8[3] = &unk_1E99E1350;
  v10 = &v11;
  v6 = v4;
  v9 = v6;
  objc_msgSend(v5, "performWhileLocked:", v8);

  LOBYTE(v5) = *((_BYTE *)v12 + 24);
  _Block_object_dispose(&v11, 8);

  return (char)v5;
}

void __53__MessageListCellsController_wasItemRecentlyVisible___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v3, "containsObject:", *(_QWORD *)(a1 + 32));
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
    objc_msgSend(v3, "removeObject:", *(_QWORD *)(a1 + 32));

}

- (void)reportFlickeringCell:(BOOL)a3 duration:(double)a4
{
  _BOOL4 v5;
  os_unfair_lock_s *p_analyticsLock;
  NSMutableArray *rawFlickerDurations;
  NSMutableArray *v9;
  void *v10;
  NSMutableDictionary *bucketedFlickerDurations;
  NSMutableDictionary *v12;
  NSMutableDictionary *v13;
  const __CFString *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  const __CFString *v20;

  v5 = a3;
  p_analyticsLock = &self->_analyticsLock;
  os_unfair_lock_lock(&self->_analyticsLock);
  -[MessageListCellsController setNumberOfVisibleCells:](self, "setNumberOfVisibleCells:", -[MessageListCellsController numberOfVisibleCells](self, "numberOfVisibleCells") + 1);
  if (v5)
  {
    -[MessageListCellsController setNumberOfFlickeringCells:](self, "setNumberOfFlickeringCells:", -[MessageListCellsController numberOfFlickeringCells](self, "numberOfFlickeringCells") + 1);
    if (self)
      rawFlickerDurations = self->_rawFlickerDurations;
    else
      rawFlickerDurations = 0;
    v9 = rawFlickerDurations;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](v9, "addObject:", v10);

    if (self)
      bucketedFlickerDurations = self->_bucketedFlickerDurations;
    else
      bucketedFlickerDurations = 0;
    v12 = bucketedFlickerDurations;
    v13 = v12;
    if (a4 >= 0.01)
    {
      if (a4 >= 0.02)
      {
        if (a4 >= 0.03)
        {
          if (a4 >= 0.04)
          {
            if (a4 >= 0.05)
            {
              if (a4 >= 0.1)
              {
                if (a4 >= 0.5)
                {
                  if (a4 >= 1.0)
                  {
                    if (a4 >= 1.5)
                      v14 = CFSTR("duration_1_5_to_2_0");
                    else
                      v14 = CFSTR("duration_1_0_to_1_5");
                  }
                  else
                  {
                    v14 = CFSTR("duration_0_5_to_1_0");
                  }
                }
                else
                {
                  v14 = CFSTR("duration_0_1_to_0_5");
                }
              }
              else
              {
                v14 = CFSTR("duration_0_05_to_0_1");
              }
            }
            else
            {
              v14 = CFSTR("duration_0_04_to_0_05");
            }
          }
          else
          {
            v14 = CFSTR("duration_0_03_to_0_04");
          }
        }
        else
        {
          v14 = CFSTR("duration_0_02_to_0_03");
        }
      }
      else
      {
        v14 = CFSTR("duration_0_01_to_0_02");
      }
    }
    else
    {
      v14 = CFSTR("duration_0_005_to_0_01");
    }
    -[NSMutableDictionary objectForKeyedSubscript:](v12, "objectForKeyedSubscript:", v14);
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = (void *)v15;
    v17 = &unk_1E9A01660;
    if (v15)
      v17 = (void *)v15;
    v18 = v17;

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v18, "integerValue") + 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (a4 >= 0.01)
    {
      if (a4 >= 0.02)
      {
        if (a4 >= 0.03)
        {
          if (a4 >= 0.04)
          {
            if (a4 >= 0.05)
            {
              if (a4 >= 0.1)
              {
                if (a4 >= 0.5)
                {
                  if (a4 >= 1.0)
                  {
                    if (a4 >= 1.5)
                      v20 = CFSTR("duration_1_5_to_2_0");
                    else
                      v20 = CFSTR("duration_1_0_to_1_5");
                  }
                  else
                  {
                    v20 = CFSTR("duration_0_5_to_1_0");
                  }
                }
                else
                {
                  v20 = CFSTR("duration_0_1_to_0_5");
                }
              }
              else
              {
                v20 = CFSTR("duration_0_05_to_0_1");
              }
            }
            else
            {
              v20 = CFSTR("duration_0_04_to_0_05");
            }
          }
          else
          {
            v20 = CFSTR("duration_0_03_to_0_04");
          }
        }
        else
        {
          v20 = CFSTR("duration_0_02_to_0_03");
        }
      }
      else
      {
        v20 = CFSTR("duration_0_01_to_0_02");
      }
    }
    else
    {
      v20 = CFSTR("duration_0_005_to_0_01");
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](v13, "setObject:forKeyedSubscript:", v19, v20);

  }
  os_unfair_lock_unlock(p_analyticsLock);
}

uint64_t __53__MessageListCellsController__reportBlankCellMetrics__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", a3, a2);
}

uint64_t __58__MessageListCellsController__reportFlickeringCellMetrics__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", a3, a2);
}

- (EFLocked)visibleItemIDs
{
  return self->_visibleItemIDs;
}

- (void)setVisibleItemIDs:(id)a3
{
  objc_storeStrong((id *)&self->_visibleItemIDs, a3);
}

- (EFCancelable)currentUpdateToken
{
  return self->_currentUpdateToken;
}

- (void)setCurrentUpdateToken:(id)a3
{
  objc_storeStrong((id *)&self->_currentUpdateToken, a3);
}

- (void)setFailureCodeCount:(id)a3
{
  objc_storeStrong((id *)&self->_failureCodeCount, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bucketedFlickerDurations, 0);
  objc_storeStrong((id *)&self->_rawFlickerDurations, 0);
  objc_storeStrong((id *)&self->_failureCodeCount, 0);
  objc_storeStrong((id *)&self->_analyticsCollector, 0);
  objc_storeStrong((id *)&self->_currentUpdateToken, 0);
  objc_storeStrong((id *)&self->_visibleItemIDs, 0);
}

@end
