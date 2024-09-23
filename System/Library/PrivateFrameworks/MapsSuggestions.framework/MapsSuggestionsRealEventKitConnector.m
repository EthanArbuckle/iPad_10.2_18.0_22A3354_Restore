@implementation MapsSuggestionsRealEventKitConnector

- (MapsSuggestionsRealEventKitConnector)init
{
  MapsSuggestionsRealEventKitConnector *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *queue;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MapsSuggestionsRealEventKitConnector;
  v2 = -[MapsSuggestionsRealEventKitConnector init](&v7, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("MapsSuggestionsRealEventKitConnectorQueue", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

  }
  return v2;
}

void __60__MapsSuggestionsRealEventKitConnector_calVisibilityManager__block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t);
  void *v16;
  id v17;
  id location;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  const char *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  objc_initWeak(&location, *(id *)(a1 + 32));
  GEOFindOrCreateLog();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(*(id *)(a1 + 32), "uniqueName");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v20 = v3;
    v21 = 2080;
    v22 = "EKCalendarVisibilityManagerInit";
    _os_log_impl(&dword_1A427D000, v2, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s BEGIN", buf, 0x16u);

  }
  GEOFindOrCreateLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A427D000, v4, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "EKCalendarVisibilityManagerInit", ", buf, 2u);
  }

  v13 = MEMORY[0x1E0C809B0];
  v14 = 3221225472;
  v15 = __60__MapsSuggestionsRealEventKitConnector_calVisibilityManager__block_invoke_8;
  v16 = &unk_1E4BCDFF8;
  objc_copyWeak(&v17, &location);
  v5 = _Block_copy(&v13);
  v6 = objc_alloc(MEMORY[0x1E0CAA018]);
  +[MapsSuggestionsSharedEventStore sharedEventStore](MapsSuggestionsSharedEventStore, "sharedEventStore", v13, v14, v15, v16);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "initWithEventStore:visibilityChangedCallback:queue:", v7, v5, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
  v9 = (void *)_MergedGlobals_41;
  _MergedGlobals_41 = v8;

  GEOFindOrCreateLog();
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(*(id *)(a1 + 32), "uniqueName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v20 = v11;
    v21 = 2080;
    v22 = "EKCalendarVisibilityManagerInit";
    _os_log_impl(&dword_1A427D000, v10, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s END", buf, 0x16u);

  }
  GEOFindOrCreateLog();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v12))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A427D000, v12, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "EKCalendarVisibilityManagerInit", ", buf, 2u);
  }

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

void __60__MapsSuggestionsRealEventKitConnector_calVisibilityManager__block_invoke_8(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  NSObject *v3;
  NSObject *v4;
  int v5;
  char *v6;
  __int16 v7;
  int v8;
  __int16 v9;
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  GEOFindOrCreateLog();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (WeakRetained)
  {
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v5) = 0;
      _os_log_impl(&dword_1A427D000, v3, OS_LOG_TYPE_DEBUG, "Received a visibility change callback from EKCalendarVisibilityManager", (uint8_t *)&v5, 2u);
    }

    objc_msgSend(WeakRetained, "_eventStoreDidChange:", 0);
  }
  else
  {
    v4 = v2;
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = 136446722;
      v6 = "MapsSuggestionsRealEventKitConnector.m";
      v7 = 1026;
      v8 = 50;
      v9 = 2082;
      v10 = "-[MapsSuggestionsRealEventKitConnector calVisibilityManager]_block_invoke";
      _os_log_impl(&dword_1A427D000, v4, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v5, 0x1Cu);
    }

  }
}

- (id)visibleCalendars
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  _QWORD block[5];
  uint8_t buf[4];
  const char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (self)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __60__MapsSuggestionsRealEventKitConnector_calVisibilityManager__block_invoke;
    block[3] = &unk_1E4BCEE50;
    block[4] = self;
    if (qword_1ED22F028 != -1)
      dispatch_once(&qword_1ED22F028, block);
    v2 = (void *)_MergedGlobals_41;
    if (_MergedGlobals_41)
    {
      v3 = (id)_MergedGlobals_41;
    }
    else
    {
      GEOFindOrCreateLog();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446978;
        v9 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/UT_Never/MapsSuggestionsRealEventKitConnector.m";
        v10 = 1024;
        v11 = 61;
        v12 = 2082;
        v13 = "-[MapsSuggestionsRealEventKitConnector calVisibilityManager]";
        v14 = 2082;
        v15 = "nil == (s_calVisibilityManager)";
        _os_log_impl(&dword_1A427D000, v4, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. EKCalendarVisibilityManager cannot be nil!", buf, 0x26u);
      }

    }
  }
  else
  {
    v2 = 0;
  }
  objc_msgSend(v2, "visibleCalendars");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)calendarsForEntityType:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  NSObject *v8;
  int v9;
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  const char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  +[MapsSuggestionsSharedEventStore sharedEventStore](MapsSuggestionsSharedEventStore, "sharedEventStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    +[MapsSuggestionsSharedEventStore sharedEventStore](MapsSuggestionsSharedEventStore, "sharedEventStore");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "calendarsForEntityType:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    return v6;
  }
  else
  {
    GEOFindOrCreateLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = 136446978;
      v10 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/UT_Never/MapsSuggestionsRealEventKitConnector.m";
      v11 = 1024;
      v12 = 75;
      v13 = 2082;
      v14 = "-[MapsSuggestionsRealEventKitConnector calendarsForEntityType:]";
      v15 = 2082;
      v16 = "nil == ([MapsSuggestionsSharedEventStore sharedEventStore])";
      _os_log_impl(&dword_1A427D000, v8, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. EKEventStore cannot be nil!", (uint8_t *)&v9, 0x26u);
    }

    return 0;
  }
}

- (id)predicateForEventsWithStartDate:(id)a3 endDate:(id)a4 calendars:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  +[MapsSuggestionsSharedEventStore sharedEventStore](MapsSuggestionsSharedEventStore, "sharedEventStore");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "predicateForEventsWithStartDate:endDate:calendars:", v9, v8, v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)eventsMatchingPredicate:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  +[MapsSuggestionsSharedEventStore sharedEventStore](MapsSuggestionsSharedEventStore, "sharedEventStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "eventsMatchingPredicate:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)eventWithIdentifier:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  +[MapsSuggestionsSharedEventStore sharedEventStore](MapsSuggestionsSharedEventStore, "sharedEventStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "eventWithIdentifier:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)removeEvent:(id)a3 span:(int64_t)a4 error:(id *)a5
{
  id v7;
  void *v8;

  v7 = a3;
  +[MapsSuggestionsSharedEventStore sharedEventStore](MapsSuggestionsSharedEventStore, "sharedEventStore");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a5) = objc_msgSend(v8, "removeEvent:span:error:", v7, a4, a5);

  return (char)a5;
}

- (void)startListeningForChanges
{
  id v3;
  id v4;

  v3 = +[MapsSuggestionsSharedEventStore sharedEventStore](MapsSuggestionsSharedEventStore, "sharedEventStore");
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:selector:name:object:", self, sel__eventStoreDidChange_, *MEMORY[0x1E0CA9F88], 0);

}

- (void)stopListeningForChanges
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0CA9F88], 0);

}

- (void)_eventStoreDidChange:(id)a3
{
  NSObject *queue;
  _QWORD v5[4];
  id v6;
  id location;

  objc_initWeak(&location, self);
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __61__MapsSuggestionsRealEventKitConnector__eventStoreDidChange___block_invoke;
  v5[3] = &unk_1E4BCDFF8;
  objc_copyWeak(&v6, &location);
  dispatch_async(queue, v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __61__MapsSuggestionsRealEventKitConnector__eventStoreDidChange___block_invoke(uint64_t a1)
{
  dispatch_queue_t *WeakRetained;
  dispatch_queue_t *v2;
  NSObject *v3;
  NSObject *v4;
  NSObject *v5;
  int v6;
  char *v7;
  __int16 v8;
  int v9;
  __int16 v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  WeakRetained = (dispatch_queue_t *)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    dispatch_assert_queue_V2(WeakRetained[1]);
    -[dispatch_queue_t delegate](v2, "delegate");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if (v3)
    {
      -[NSObject eventKitDidChange:](v3, "eventKitDidChange:", v2);
    }
    else
    {
      GEOFindOrCreateLog();
      v5 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        v6 = 136446722;
        v7 = "MapsSuggestionsRealEventKitConnector.m";
        v8 = 1026;
        v9 = 134;
        v10 = 2082;
        v11 = "-[MapsSuggestionsRealEventKitConnector _q_eventStoreDidChange]";
        _os_log_impl(&dword_1A427D000, v5, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongDelegate went away in %{public}s", (uint8_t *)&v6, 0x1Cu);
      }

    }
  }
  else
  {
    GEOFindOrCreateLog();
    v4 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v6 = 136446722;
      v7 = "MapsSuggestionsRealEventKitConnector.m";
      v8 = 1026;
      v9 = 125;
      v10 = 2082;
      v11 = "-[MapsSuggestionsRealEventKitConnector _eventStoreDidChange:]_block_invoke";
      _os_log_impl(&dword_1A427D000, v4, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v6, 0x1Cu);
    }

  }
}

- (NSString)uniqueName
{
  return (NSString *)objc_msgSend((id)objc_opt_class(), "description");
}

- (MapsSuggestionsEventKitConnectorDelegate)delegate
{
  return (MapsSuggestionsEventKitConnectorDelegate *)objc_loadWeakRetained((id *)&self->delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->delegate);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
