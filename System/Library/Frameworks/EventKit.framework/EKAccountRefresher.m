@implementation EKAccountRefresher

- (EKAccountRefresher)initWithEventStore:(id)a3
{
  id v5;
  EKAccountRefresher *v6;
  EKAccountRefresher *v7;
  void *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)EKAccountRefresher;
  v6 = -[EKAccountRefresher init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_eventStore, a3);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObserver:selector:name:object:", v7, sel__eventStoreChanged_, CFSTR("EKEventStoreChangedNotification"), v5);

  }
  return v7;
}

- (void)_eventStoreChanged:(id)a3
{
  id v4;
  _BOOL4 v5;
  _BOOL4 v6;
  int v7;
  _BOOL4 currentlySyncing;
  NSObject *v9;
  _BOOL4 v10;
  _BOOL4 v11;
  int v12;
  int v13;
  __int16 v14;
  int v15;
  __int16 v16;
  _BOOL4 v17;
  __int16 v18;
  _BOOL4 v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_refreshing)
  {
    v5 = -[EKAccountRefresher _areAnySourcesCurrentlySyncing](self, "_areAnySourcesCurrentlySyncing");
    v6 = -[EKAccountRefresher _areAnyCalendarsCurrentlySyncing](self, "_areAnyCalendarsCurrentlySyncing");
    v7 = v5 || v6;
    currentlySyncing = self->_currentlySyncing;
    v9 = EKLogHandle;
    v10 = os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEFAULT);
    if (currentlySyncing == (v5 || v6))
    {
      if (v10)
      {
        v12 = 67109632;
        v13 = v5 || v6;
        v14 = 1024;
        v15 = v5;
        v16 = 1024;
        v17 = v6;
        _os_log_impl(&dword_1A2318000, v9, OS_LOG_TYPE_DEFAULT, "-[EKAccountRefresher _eventStoreChanged], and _currentlySyncing is still %{BOOL}i (sources=%{BOOL}i; calendars=%{BOOL}i)",
          (uint8_t *)&v12,
          0x14u);
      }
    }
    else
    {
      if (v10)
      {
        v11 = self->_currentlySyncing;
        v12 = 67109888;
        v13 = v11;
        v14 = 1024;
        v15 = v5 || v6;
        v16 = 1024;
        v17 = v5;
        v18 = 1024;
        v19 = v6;
        _os_log_impl(&dword_1A2318000, v9, OS_LOG_TYPE_DEFAULT, "-[EKAccountRefresher _eventStoreChanged], and _currentlySyncing changed from %{BOOL}i to %{BOOL}i (sources=%{BOOL}i; calendars=%{BOOL}i)",
          (uint8_t *)&v12,
          0x1Au);
      }
      self->_currentlySyncing = v7;
      if (v7)
        -[EKAccountRefresher _syncDidStart](self, "_syncDidStart");
      else
        -[EKAccountRefresher _syncDidEnd](self, "_syncDidEnd");
    }
  }

}

- (void)_syncDidEnd
{
  if (-[EKAccountRefresher _allSourcesRefreshed](self, "_allSourcesRefreshed")
    && -[EKAccountRefresher _allCalendarsRefreshed](self, "_allCalendarsRefreshed"))
  {
    -[EKAccountRefresher _syncCompleted](self, "_syncCompleted");
  }
  else
  {
    -[EKAccountRefresher _beginSyncStartTimeout](self, "_beginSyncStartTimeout");
  }
}

- (BOOL)_allSourcesRefreshed
{
  NSArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  BOOL v9;
  NSObject *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint8_t buf[4];
  uint64_t v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v3 = self->_refreshingSources;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v12, v18, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i);
        if (!-[EKAccountRefresher sourceFinishedRefreshing:](self, "sourceFinishedRefreshing:", v8, (_QWORD)v12))
        {
          v10 = EKLogHandle;
          v9 = 0;
          if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v17 = v8;
            _os_log_impl(&dword_1A2318000, v10, OS_LOG_TYPE_DEFAULT, "%@ has not yet finished refreshing", buf, 0xCu);
            v9 = 0;
          }
          goto LABEL_12;
        }
      }
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v12, v18, 16);
      if (v5)
        continue;
      break;
    }
  }
  v9 = 1;
LABEL_12:

  return v9;
}

- (BOOL)_areAnySourcesCurrentlySyncing
{
  NSArray *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = self->_refreshingSources;
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v8;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v2);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * i), "isSyncing", (_QWORD)v7) & 1) != 0)
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

- (BOOL)_allCalendarsRefreshed
{
  NSArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  BOOL v9;
  NSObject *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint8_t buf[4];
  uint64_t v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v3 = self->_refreshingCalendars;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v12, v18, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i);
        if (!-[EKAccountRefresher calendarFinishedRefreshing:](self, "calendarFinishedRefreshing:", v8, (_QWORD)v12))
        {
          v10 = EKLogHandle;
          v9 = 0;
          if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v17 = v8;
            _os_log_impl(&dword_1A2318000, v10, OS_LOG_TYPE_DEFAULT, "%@ has not yet finished refreshing", buf, 0xCu);
            v9 = 0;
          }
          goto LABEL_12;
        }
      }
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v12, v18, 16);
      if (v5)
        continue;
      break;
    }
  }
  v9 = 1;
LABEL_12:

  return v9;
}

- (BOOL)_areAnyCalendarsCurrentlySyncing
{
  NSArray *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = self->_refreshingCalendars;
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v8;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v2);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * i), "isSyncing", (_QWORD)v7) & 1) != 0)
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

- (void)refresh
{
  NSObject *v2;
  NSDate *v4;
  NSDate *refreshStartDate;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  NSArray *refreshingSources;
  EKAccountRefresher *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint8_t buf[4];
  uint64_t v39;
  __int16 v40;
  uint64_t v41;
  _BYTE v42[128];
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  if (self->_refreshStartDate)
  {
    v2 = EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A2318000, v2, OS_LOG_TYPE_DEFAULT, "Calling -[EKAccountRefresher refresh] more than once is not supported.", buf, 2u);
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v4 = (NSDate *)objc_claimAutoreleasedReturnValue();
    refreshStartDate = self->_refreshStartDate;
    self->_refreshStartDate = v4;

    -[EKAccountRefresher _beginMaximumTimeElapsedTimeout](self, "_beginMaximumTimeElapsedTimeout");
    -[EKAccountRefresher _beginSyncStartTimeout](self, "_beginSyncStartTimeout");
    self->_refreshing = 1;
    objc_msgSend(MEMORY[0x1E0D1C3F8], "sharedConnection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "resetTimersAndWarnings");

    v29 = self;
    -[EKEventStore refreshEverythingIfNecessary:](self->_eventStore, "refreshEverythingIfNecessary:", 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "mutableCopy");

    v9 = (void *)objc_opt_new();
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v10 = v8;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v34, v43, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v35;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v35 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
          v30 = 0u;
          v31 = 0u;
          v32 = 0u;
          v33 = 0u;
          objc_msgSend(v15, "calendarsForEntityType:", 0);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v30, v42, 16);
          if (v17)
          {
            v18 = v17;
            v19 = *(_QWORD *)v31;
            do
            {
              for (j = 0; j != v18; ++j)
              {
                if (*(_QWORD *)v31 != v19)
                  objc_enumerationMutation(v16);
                v21 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * j);
                if (objc_msgSend(v21, "isSubscribed")
                  && (objc_msgSend(v21, "isSubscribedHolidayCalendar") & 1) == 0)
                {
                  objc_msgSend(v9, "addObject:", v21);
                }
              }
              v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v30, v42, 16);
            }
            while (v18);
          }

        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v34, v43, 16);
      }
      while (v12);
    }

    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_23);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "filterUsingPredicate:", v22);

    v23 = (void *)EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEFAULT))
    {
      v24 = v23;
      v25 = objc_msgSend(v10, "count");
      v26 = objc_msgSend(v9, "count");
      *(_DWORD *)buf = 134218240;
      v39 = v25;
      v40 = 2048;
      v41 = v26;
      _os_log_impl(&dword_1A2318000, v24, OS_LOG_TYPE_DEFAULT, "Started a refresh of %lu accounts and %lu subscribed calendars", buf, 0x16u);

    }
    objc_msgSend(v10, "allObjects");
    v27 = objc_claimAutoreleasedReturnValue();
    refreshingSources = v29->_refreshingSources;
    v29->_refreshingSources = (NSArray *)v27;

    objc_storeStrong((id *)&v29->_refreshingCalendars, v9);
    if (!-[NSArray count](v29->_refreshingSources, "count") && !-[NSArray count](v29->_refreshingCalendars, "count"))
      -[EKAccountRefresher _syncCompleted](v29, "_syncCompleted");

  }
}

BOOL __29__EKAccountRefresher_refresh__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "sourceType") != 4;
}

- (void)_refreshControlMaximumVisibleTimeElapsed
{
  NSObject *v3;
  uint8_t v4[16];

  if (self->_refreshing)
  {
    v3 = EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_1A2318000, v3, OS_LOG_TYPE_DEFAULT, "_refreshControlMaximumVisibleTimeElapsed; calling sync completed",
        v4,
        2u);
    }
    -[EKAccountRefresher _syncCompleted](self, "_syncCompleted");
    -[EKAccountRefresher _cancelSyncStartTimeout](self, "_cancelSyncStartTimeout");
  }
}

- (void)_syncStartTimeoutExpired
{
  NSObject *v3;
  uint8_t v4[16];

  if (self->_refreshing)
  {
    v3 = EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_1A2318000, v3, OS_LOG_TYPE_DEFAULT, "timed out waiting for sync to start; calling sync completed",
        v4,
        2u);
    }
    -[EKAccountRefresher _syncCompleted](self, "_syncCompleted");
    -[EKAccountRefresher _cancelMaximumTimeElapsedTimeout](self, "_cancelMaximumTimeElapsedTimeout");
  }
}

- (void)_beginSyncStartTimeout
{
  -[EKAccountRefresher performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__syncStartTimeoutExpired, 0, 5.0);
}

- (void)_cancelSyncStartTimeout
{
  objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__syncStartTimeoutExpired, 0);
}

- (void)_beginMaximumTimeElapsedTimeout
{
  -[EKAccountRefresher performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__refreshControlMaximumVisibleTimeElapsed, 0, 30.0);
}

- (void)_cancelMaximumTimeElapsedTimeout
{
  objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__refreshControlMaximumVisibleTimeElapsed, 0);
}

- (void)_syncCompleted
{
  void *v3;
  NSDate *refreshStartDate;
  NSObject *v5;
  double v6;
  id WeakRetained;
  int v8;
  double v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = (void *)EKLogHandle;
  if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEFAULT))
  {
    refreshStartDate = self->_refreshStartDate;
    v5 = v3;
    -[NSDate timeIntervalSinceNow](refreshStartDate, "timeIntervalSinceNow");
    v8 = 134217984;
    v9 = -v6;
    _os_log_impl(&dword_1A2318000, v5, OS_LOG_TYPE_DEFAULT, "Hiding sync spinner after %fs", (uint8_t *)&v8, 0xCu);

  }
  -[EKAccountRefresher _cancelSyncStartTimeout](self, "_cancelSyncStartTimeout");
  -[EKAccountRefresher _cancelMaximumTimeElapsedTimeout](self, "_cancelMaximumTimeElapsedTimeout");
  self->_refreshing = 0;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "accountRefreshFinished:", self);

}

- (BOOL)sourceFinishedRefreshing:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;

  if (!self->_refreshStartDate)
    return 0;
  objc_msgSend(a3, "lastSyncEndDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "laterDate:", self->_refreshStartDate);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6 == v5;

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)calendarFinishedRefreshing:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;

  if (!self->_refreshStartDate)
    return 0;
  objc_msgSend(a3, "lastSyncEndDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "laterDate:", self->_refreshStartDate);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6 == v5;

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)allAccountsOffline
{
  BOOL v2;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if (!self->_refreshing
    && self->_refreshStartDate
    && (-[NSArray count](self->_refreshingSources, "count") || -[NSArray count](self->_refreshingCalendars, "count")))
  {
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v4 = self->_refreshingSources;
    v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v21;
LABEL_8:
      v8 = 0;
      while (1)
      {
        if (*(_QWORD *)v21 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v8);
        if (!-[EKAccountRefresher sourceFinishedRefreshing:](self, "sourceFinishedRefreshing:", v9)
          || objc_msgSend(v9, "lastSyncError") != 3)
        {
          break;
        }
        if (v6 == ++v8)
        {
          v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
          if (v6)
            goto LABEL_8;
          goto LABEL_15;
        }
      }
    }
    else
    {
LABEL_15:

      v18 = 0u;
      v19 = 0u;
      v16 = 0u;
      v17 = 0u;
      v4 = self->_refreshingCalendars;
      v10 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
      if (!v10)
      {
        v2 = 1;
        goto LABEL_26;
      }
      v11 = v10;
      v12 = *(_QWORD *)v17;
LABEL_17:
      v13 = 0;
      while (1)
      {
        if (*(_QWORD *)v17 != v12)
          objc_enumerationMutation(v4);
        v14 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v13);
        if (!-[EKAccountRefresher calendarFinishedRefreshing:](self, "calendarFinishedRefreshing:", v14, (_QWORD)v16)
          || objc_msgSend(v14, "lastSyncError") != 3)
        {
          break;
        }
        if (v11 == ++v13)
        {
          v11 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
          v2 = 1;
          if (v11)
            goto LABEL_17;
          goto LABEL_26;
        }
      }
    }
    v2 = 0;
LABEL_26:

    return v2;
  }
  return 0;
}

- (EKAccountRefresherDelegate)delegate
{
  return (EKAccountRefresherDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)refreshing
{
  return self->_refreshing;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_refreshingCalendars, 0);
  objc_storeStrong((id *)&self->_refreshingSources, 0);
  objc_storeStrong((id *)&self->_refreshStartDate, 0);
  objc_storeStrong((id *)&self->_eventStore, 0);
}

@end
