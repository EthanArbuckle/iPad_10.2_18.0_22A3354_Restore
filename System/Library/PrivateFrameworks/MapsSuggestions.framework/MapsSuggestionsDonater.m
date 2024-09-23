@implementation MapsSuggestionsDonater

- (MapsSuggestionsDonater)init
{
  MapsSuggestionsDonater *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *queue;
  OS_dispatch_source *closeTimer;
  NSXPCConnection *connection;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MapsSuggestionsDonater;
  v2 = -[MapsSuggestionsDonater init](&v9, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("MapsSuggestionsDonaterQueue", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    closeTimer = v2->_closeTimer;
    v2->_closeTimer = 0;

    connection = v2->_connection;
    v2->_connection = 0;

  }
  return v2;
}

- (void)dealloc
{
  OS_dispatch_queue *queue;
  objc_super v4;

  -[MapsSuggestionsDonater _unscheduleCloseConnection]((uint64_t)self);
  -[MapsSuggestionsDonater _closeConnection](self);
  queue = self->_queue;
  self->_queue = 0;

  v4.receiver = self;
  v4.super_class = (Class)MapsSuggestionsDonater;
  -[MapsSuggestionsDonater dealloc](&v4, sel_dealloc);
}

- (void)_unscheduleCloseConnection
{
  NSObject *v2;
  NSObject *v3;
  void *v4;
  uint8_t v5[16];

  if (a1)
  {
    GEOFindOrCreateLog();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_1A427D000, v2, OS_LOG_TYPE_DEBUG, "_unscheduleCloseConnection", v5, 2u);
    }

    v3 = *(NSObject **)(a1 + 24);
    if (v3)
    {
      dispatch_source_set_timer(v3, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0);
      dispatch_source_cancel(*(dispatch_source_t *)(a1 + 24));
      v4 = *(void **)(a1 + 24);
      *(_QWORD *)(a1 + 24) = 0;

    }
  }
}

- (void)_closeConnection
{
  NSObject *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  int v10;
  void *v11;
  __int16 v12;
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    GEOFindOrCreateLog();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(a1, "uniqueName");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138412546;
      v11 = v3;
      v12 = 2080;
      v13 = "_closeConnection";
      _os_log_impl(&dword_1A427D000, v2, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s BEGIN", (uint8_t *)&v10, 0x16u);

    }
    GEOFindOrCreateLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v4))
    {
      LOWORD(v10) = 0;
      _os_signpost_emit_with_name_impl(&dword_1A427D000, v4, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "_closeConnection", ", (uint8_t *)&v10, 2u);
    }

    v5 = (void *)a1[2];
    if (v5)
    {
      a1[2] = 0;
      v6 = v5;

      objc_msgSend(v6, "setInterruptionHandler:", 0);
      objc_msgSend(v6, "setInvalidationHandler:", 0);
      objc_msgSend(v6, "invalidate");

    }
    -[MapsSuggestionsDonater _unscheduleCloseConnection]((uint64_t)a1);
    GEOFindOrCreateLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(a1, "uniqueName");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138412546;
      v11 = v8;
      v12 = 2080;
      v13 = "_closeConnection";
      _os_log_impl(&dword_1A427D000, v7, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s END", (uint8_t *)&v10, 0x16u);

    }
    GEOFindOrCreateLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v9))
    {
      LOWORD(v10) = 0;
      _os_signpost_emit_with_name_impl(&dword_1A427D000, v9, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "_closeConnection", ", (uint8_t *)&v10, 2u);
    }

  }
}

- (BOOL)donateETA:(id)a3 entry:(id)a4
{
  char *v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  char *v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  NSObject *queue;
  id v16;
  BOOL v17;
  NSObject *v18;
  _QWORD block[4];
  id v21;
  id v22;
  id v23;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  _BYTE v27[14];
  __int16 v28;
  const char *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = (char *)a3;
  v7 = a4;
  if (!v6)
  {
    GEOFindOrCreateLog();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v25 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsDonater.m";
      v26 = 1024;
      *(_DWORD *)v27 = 82;
      *(_WORD *)&v27[4] = 2082;
      *(_QWORD *)&v27[6] = "-[MapsSuggestionsDonater donateETA:entry:]";
      v28 = 2082;
      v29 = "nil == (eta)";
      _os_log_impl(&dword_1A427D000, v18, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires an ETA", buf, 0x26u);
    }

    goto LABEL_16;
  }
  GEOFindOrCreateLog();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (!v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v25 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsDonater.m";
      v26 = 1024;
      *(_DWORD *)v27 = 83;
      *(_WORD *)&v27[4] = 2082;
      *(_QWORD *)&v27[6] = "-[MapsSuggestionsDonater donateETA:entry:]";
      v28 = 2082;
      v29 = "nil == (entry)";
      _os_log_impl(&dword_1A427D000, v9, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a suggestions entry", buf, 0x26u);
    }

LABEL_16:
    v17 = 0;
    goto LABEL_17;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    -[MapsSuggestionsDonater uniqueName](self, "uniqueName");
    v10 = (char *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v25 = v10;
    v26 = 2080;
    *(_QWORD *)v27 = "donateETA:entry:";
    _os_log_impl(&dword_1A427D000, v9, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s BEGIN", buf, 0x16u);

  }
  GEOFindOrCreateLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v11))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A427D000, v11, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "donateETA:entry:", ", buf, 2u);
  }

  GEOFindOrCreateLog();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v7, "uniqueIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v25 = v6;
    v26 = 2112;
    *(_QWORD *)v27 = v13;
    _os_log_impl(&dword_1A427D000, v12, OS_LOG_TYPE_DEBUG, "Donating ETA %@ for Entry %@", buf, 0x16u);

  }
  objc_msgSend(v6, "data");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak((id *)buf, self);
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__MapsSuggestionsDonater_donateETA_entry___block_invoke;
  block[3] = &unk_1E4BCE020;
  objc_copyWeak(&v23, (id *)buf);
  v21 = v14;
  v22 = v7;
  v16 = v14;
  dispatch_async(queue, block);

  objc_destroyWeak(&v23);
  objc_destroyWeak((id *)buf);
  v17 = 1;
LABEL_17:

  return v17;
}

void __42__MapsSuggestionsDonater_donateETA_entry___block_invoke(uint64_t a1)
{
  id *v2;
  id *WeakRetained;
  id *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  _QWORD v9[4];
  id v10;
  uint8_t buf[4];
  char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  const char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v2 = (id *)(a1 + 48);
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    -[MapsSuggestionsDonater _openConnectionIfNecessary]((uint64_t)WeakRetained);
    objc_msgSend(v4[2], "remoteObjectProxy");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 32);
    MapsSuggestionsDestinationKey(*(void **)(a1 + 40));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __42__MapsSuggestionsDonater_donateETA_entry___block_invoke_87;
    v9[3] = &unk_1E4BCDFF8;
    objc_copyWeak(&v10, v2);
    objc_msgSend(v5, "donateETAData:destinationKey:handler:", v6, v7, v9);

    -[MapsSuggestionsDonater _scheduleCloseConnection]((dispatch_queue_t *)v4);
    objc_destroyWeak(&v10);
  }
  else
  {
    GEOFindOrCreateLog();
    v8 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v12 = "MapsSuggestionsDonater.m";
      v13 = 1026;
      v14 = 92;
      v15 = 2082;
      v16 = "-[MapsSuggestionsDonater donateETA:entry:]_block_invoke";
      _os_log_impl(&dword_1A427D000, v8, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
    }

  }
}

- (void)_openConnectionIfNecessary
{
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, void *);
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;
  id location;

  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 8));
  if (!*(_QWORD *)(a1 + 16))
  {
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.maps.destinationd.donations"), 0);
    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE733668);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setRemoteObjectInterface:", v3);

    objc_msgSend(v2, "setExportedObject:", a1);
    objc_initWeak(&location, (id)a1);
    v4 = MEMORY[0x1E0C809B0];
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __52__MapsSuggestionsDonater__openConnectionIfNecessary__block_invoke;
    v13[3] = &unk_1E4BCDFF8;
    objc_copyWeak(&v14, &location);
    objc_msgSend(v2, "setInvalidationHandler:", v13);
    v11[0] = v4;
    v11[1] = 3221225472;
    v11[2] = __52__MapsSuggestionsDonater__openConnectionIfNecessary__block_invoke_154;
    v11[3] = &unk_1E4BCDFF8;
    objc_copyWeak(&v12, &location);
    objc_msgSend(v2, "setInterruptionHandler:", v11);
    v6 = v4;
    v7 = 3221225472;
    v8 = __52__MapsSuggestionsDonater__openConnectionIfNecessary__block_invoke_156;
    v9 = &unk_1E4BCE048;
    objc_copyWeak(&v10, &location);
    v5 = (id)objc_msgSend(v2, "remoteObjectProxyWithErrorHandler:", &v6);
    objc_storeStrong((id *)(a1 + 16), v2);
    objc_msgSend(v2, "resume", v6, v7, v8, v9);
    objc_destroyWeak(&v10);
    objc_destroyWeak(&v12);
    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);

  }
}

void __42__MapsSuggestionsDonater_donateETA_entry___block_invoke_87(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  NSObject *v3;
  char *v4;
  NSObject *v5;
  int v6;
  char *v7;
  __int16 v8;
  _WORD v9[17];

  *(_QWORD *)&v9[13] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  GEOFindOrCreateLog();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (WeakRetained)
  {
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(WeakRetained, "uniqueName");
      v4 = (char *)objc_claimAutoreleasedReturnValue();
      v6 = 138412546;
      v7 = v4;
      v8 = 2080;
      *(_QWORD *)v9 = "donateETA:entry:";
      _os_log_impl(&dword_1A427D000, v3, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s END", (uint8_t *)&v6, 0x16u);

    }
    GEOFindOrCreateLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v5))
    {
      LOWORD(v6) = 0;
      _os_signpost_emit_with_name_impl(&dword_1A427D000, v5, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "donateETA:entry:", ", (uint8_t *)&v6, 2u);
    }
  }
  else
  {
    v5 = v2;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = 136446722;
      v7 = "MapsSuggestionsDonater.m";
      v8 = 1026;
      *(_DWORD *)v9 = 97;
      v9[2] = 2082;
      *(_QWORD *)&v9[3] = "-[MapsSuggestionsDonater donateETA:entry:]_block_invoke";
      _os_log_impl(&dword_1A427D000, v5, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf2 went away in %{public}s", (uint8_t *)&v6, 0x1Cu);
    }

  }
}

- (void)_scheduleCloseConnection
{
  NSObject *v2;
  NSObject *v3;
  dispatch_source_t v4;
  dispatch_queue_t v5;
  NSObject *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  NSObject *v11;
  dispatch_time_t v12;
  _QWORD v13[4];
  id v14;
  id location;

  dispatch_assert_queue_V2(a1[1]);
  GEOFindOrCreateLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(v13[0]) = 0;
    _os_log_impl(&dword_1A427D000, v2, OS_LOG_TYPE_DEBUG, "_scheduleCloseConnection", (uint8_t *)v13, 2u);
  }

  dispatch_assert_queue_V2(a1[1]);
  if (!a1[3])
  {
    GEOFindOrCreateLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v13[0]) = 0;
      _os_log_impl(&dword_1A427D000, v3, OS_LOG_TYPE_DEBUG, "Re-initializing the _closeTimer", (uint8_t *)v13, 2u);
    }

    objc_initWeak(&location, a1);
    v4 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, a1[1]);
    v5 = a1[3];
    a1[3] = v4;

    dispatch_source_set_timer(a1[3], 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0);
    v6 = a1[3];
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __52__MapsSuggestionsDonater__initCloseTimerIfNecessary__block_invoke;
    v13[3] = &unk_1E4BCDFF8;
    objc_copyWeak(&v14, &location);
    dispatch_source_set_event_handler(v6, v13);
    dispatch_resume(a1[3]);
    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
  GEOConfigGetDouble();
  v8 = v7;
  GEOConfigGetDouble();
  v10 = v9;
  v11 = a1[3];
  v12 = dispatch_time(0, (uint64_t)(v8 * 1000000000.0));
  dispatch_source_set_timer(v11, v12, 0xFFFFFFFFFFFFFFFFLL, (unint64_t)(v10 * 1000000000.0));
}

- (BOOL)donateSignalPack:(id)a3
{
  char *v4;
  NSObject *v5;
  NSObject *v6;
  char *v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  NSObject *queue;
  id v12;
  _QWORD v14[4];
  id v15;
  id v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  _BYTE v20[14];
  __int16 v21;
  const char *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = (char *)a3;
  GEOFindOrCreateLog();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      -[MapsSuggestionsDonater uniqueName](self, "uniqueName");
      v7 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v18 = v7;
      v19 = 2080;
      *(_QWORD *)v20 = "donateSignalPack";
      _os_log_impl(&dword_1A427D000, v6, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s BEGIN", buf, 0x16u);

    }
    GEOFindOrCreateLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v8))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A427D000, v8, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "donateSignalPack", ", buf, 2u);
    }

    GEOFindOrCreateLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v18 = v4;
      _os_log_impl(&dword_1A427D000, v9, OS_LOG_TYPE_DEBUG, "Donating SignalPack %@", buf, 0xCu);
    }

    objc_msgSend(v4, "data");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak((id *)buf, self);
    queue = self->_queue;
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __43__MapsSuggestionsDonater_donateSignalPack___block_invoke;
    v14[3] = &unk_1E4BCDB40;
    objc_copyWeak(&v16, (id *)buf);
    v15 = v10;
    v12 = v10;
    dispatch_async(queue, v14);

    objc_destroyWeak(&v16);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v18 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsDonater.m";
      v19 = 1024;
      *(_DWORD *)v20 = 107;
      *(_WORD *)&v20[4] = 2082;
      *(_QWORD *)&v20[6] = "-[MapsSuggestionsDonater donateSignalPack:]";
      v21 = 2082;
      v22 = "nil == (signalPack)";
      _os_log_impl(&dword_1A427D000, v6, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. signalPack should not be nil", buf, 0x26u);
    }

  }
  return v4 != 0;
}

void __43__MapsSuggestionsDonater_donateSignalPack___block_invoke(uint64_t a1)
{
  id *v2;
  id *WeakRetained;
  id *v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  _QWORD v8[4];
  id v9;
  uint8_t buf[4];
  char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v2 = (id *)(a1 + 40);
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    -[MapsSuggestionsDonater _openConnectionIfNecessary]((uint64_t)WeakRetained);
    objc_msgSend(v4[2], "remoteObjectProxy");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 32);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __43__MapsSuggestionsDonater_donateSignalPack___block_invoke_91;
    v8[3] = &unk_1E4BCDFF8;
    objc_copyWeak(&v9, v2);
    objc_msgSend(v5, "donateSignalPackData:handler:", v6, v8);

    -[MapsSuggestionsDonater _scheduleCloseConnection]((dispatch_queue_t *)v4);
    objc_destroyWeak(&v9);
  }
  else
  {
    GEOFindOrCreateLog();
    v7 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v11 = "MapsSuggestionsDonater.m";
      v12 = 1026;
      v13 = 116;
      v14 = 2082;
      v15 = "-[MapsSuggestionsDonater donateSignalPack:]_block_invoke";
      _os_log_impl(&dword_1A427D000, v7, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
    }

  }
}

void __43__MapsSuggestionsDonater_donateSignalPack___block_invoke_91(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  NSObject *v3;
  char *v4;
  NSObject *v5;
  int v6;
  char *v7;
  __int16 v8;
  _WORD v9[17];

  *(_QWORD *)&v9[13] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  GEOFindOrCreateLog();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (WeakRetained)
  {
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(WeakRetained, "uniqueName");
      v4 = (char *)objc_claimAutoreleasedReturnValue();
      v6 = 138412546;
      v7 = v4;
      v8 = 2080;
      *(_QWORD *)v9 = "donateSignalPack";
      _os_log_impl(&dword_1A427D000, v3, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s END", (uint8_t *)&v6, 0x16u);

    }
    GEOFindOrCreateLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v5))
    {
      LOWORD(v6) = 0;
      _os_signpost_emit_with_name_impl(&dword_1A427D000, v5, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "donateSignalPack", ", (uint8_t *)&v6, 2u);
    }
  }
  else
  {
    v5 = v2;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = 136446722;
      v7 = "MapsSuggestionsDonater.m";
      v8 = 1026;
      *(_DWORD *)v9 = 120;
      v9[2] = 2082;
      *(_QWORD *)&v9[3] = "-[MapsSuggestionsDonater donateSignalPack:]_block_invoke";
      _os_log_impl(&dword_1A427D000, v5, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf2 went away in %{public}s", (uint8_t *)&v6, 0x1Cu);
    }

  }
}

- (BOOL)donateFlightLookupWithFlightNumber:(id)a3 departureAirportCode:(id)a4 departureTime:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  char *v16;
  __CFString *v17;
  const char *v18;
  BOOL v19;
  NSObject *v20;
  id v22;
  _QWORD v23[3];
  _QWORD v24[3];
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  int v28;
  __int16 v29;
  const char *v30;
  __int16 v31;
  const char *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = v9;
  if (!v7)
  {
    GEOFindOrCreateLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      goto LABEL_15;
    *(_DWORD *)buf = 136446978;
    v26 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsDonater.m";
    v27 = 1024;
    v28 = 133;
    v29 = 2082;
    v30 = "-[MapsSuggestionsDonater donateFlightLookupWithFlightNumber:departureAirportCode:departureTime:]";
    v31 = 2082;
    v32 = "nil == (fullFlightNumber)";
    v18 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a full flight number";
LABEL_14:
    _os_log_impl(&dword_1A427D000, v13, OS_LOG_TYPE_ERROR, v18, buf, 0x26u);
    goto LABEL_15;
  }
  if (!v8)
  {
    GEOFindOrCreateLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      goto LABEL_15;
    *(_DWORD *)buf = 136446978;
    v26 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsDonater.m";
    v27 = 1024;
    v28 = 134;
    v29 = 2082;
    v30 = "-[MapsSuggestionsDonater donateFlightLookupWithFlightNumber:departureAirportCode:departureTime:]";
    v31 = 2082;
    v32 = "nil == (departureAirportCode)";
    v18 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a departure airport IATA code";
    goto LABEL_14;
  }
  if (!v9)
  {
    GEOFindOrCreateLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v26 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsDonater.m";
      v27 = 1024;
      v28 = 135;
      v29 = 2082;
      v30 = "-[MapsSuggestionsDonater donateFlightLookupWithFlightNumber:departureAirportCode:departureTime:]";
      v31 = 2082;
      v32 = "nil == (departureTime)";
      v18 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a scheduled departure time";
      goto LABEL_14;
    }
LABEL_15:
    v19 = 0;
    goto LABEL_21;
  }
  v23[0] = CFSTR("fullFlightNumber");
  v23[1] = CFSTR("departureAirportCode");
  v24[0] = v7;
  v24[1] = v8;
  v23[2] = CFSTR("departureTimeSince1970");
  v11 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v9, "timeIntervalSince1970");
  objc_msgSend(v11, "numberWithDouble:");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v24[2] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 3);
  v13 = objc_claimAutoreleasedReturnValue();

  GEOFindOrCreateLog();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    v22 = 0;
    objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v13, 0, &v22);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (char *)v22;
    if (v16 || !v15)
    {
      GEOFindOrCreateLog();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v26 = v16;
        _os_log_impl(&dword_1A427D000, v20, OS_LOG_TYPE_ERROR, "Failed to encode to JSON: %@", buf, 0xCu);
      }

      v17 = &stru_1E4BDFC28;
    }
    else
    {
      v17 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v15, 4);
    }

    *(_DWORD *)buf = 138412290;
    v26 = (const char *)v17;
    _os_log_impl(&dword_1A427D000, v14, OS_LOG_TYPE_DEBUG, "Donated: %@", buf, 0xCu);

  }
  v19 = 1;
LABEL_21:

  return v19;
}

- (NSString)uniqueName
{
  return (NSString *)objc_msgSend((id)objc_opt_class(), "description");
}

void __52__MapsSuggestionsDonater__openConnectionIfNecessary__block_invoke(uint64_t a1)
{
  id *v1;
  NSObject **WeakRetained;
  NSObject **v3;
  NSObject *v4;
  NSObject *v5;
  _QWORD block[4];
  id v7;
  uint8_t buf[4];
  char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v1 = (id *)(a1 + 32);
  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 32));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = WeakRetained[1];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __52__MapsSuggestionsDonater__openConnectionIfNecessary__block_invoke_153;
    block[3] = &unk_1E4BCDFF8;
    objc_copyWeak(&v7, v1);
    dispatch_async(v4, block);
    objc_destroyWeak(&v7);
  }
  else
  {
    GEOFindOrCreateLog();
    v5 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v9 = "MapsSuggestionsDonater.m";
      v10 = 1026;
      v11 = 176;
      v12 = 2082;
      v13 = "-[MapsSuggestionsDonater _openConnectionIfNecessary]_block_invoke";
      _os_log_impl(&dword_1A427D000, v5, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
    }

  }
}

void __52__MapsSuggestionsDonater__openConnectionIfNecessary__block_invoke_153(uint64_t a1)
{
  _QWORD *WeakRetained;
  NSObject *v2;
  NSObject *v3;
  char *v4;
  void *v5;
  NSObject *v6;
  int v7;
  char *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  GEOFindOrCreateLog();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (WeakRetained)
  {
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      v4 = (char *)WeakRetained[2];
      v7 = 138412290;
      v8 = v4;
      _os_log_impl(&dword_1A427D000, v3, OS_LOG_TYPE_DEBUG, "XPC connection {%@} became invalid", (uint8_t *)&v7, 0xCu);
    }

    v5 = (void *)WeakRetained[2];
    WeakRetained[2] = 0;

    -[MapsSuggestionsDonater _unscheduleCloseConnection]((uint64_t)WeakRetained);
  }
  else
  {
    v6 = v2;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = 136446722;
      v8 = "MapsSuggestionsDonater.m";
      v9 = 1026;
      v10 = 178;
      v11 = 2082;
      v12 = "-[MapsSuggestionsDonater _openConnectionIfNecessary]_block_invoke";
      _os_log_impl(&dword_1A427D000, v6, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: innerStrongSelf went away in %{public}s", (uint8_t *)&v7, 0x1Cu);
    }

  }
}

void __52__MapsSuggestionsDonater__openConnectionIfNecessary__block_invoke_154(uint64_t a1)
{
  id *v1;
  NSObject **WeakRetained;
  NSObject **v3;
  NSObject *v4;
  NSObject *v5;
  _QWORD block[4];
  id v7;
  uint8_t buf[4];
  char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v1 = (id *)(a1 + 32);
  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 32));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = WeakRetained[1];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __52__MapsSuggestionsDonater__openConnectionIfNecessary__block_invoke_155;
    block[3] = &unk_1E4BCDFF8;
    objc_copyWeak(&v7, v1);
    dispatch_async(v4, block);
    objc_destroyWeak(&v7);
  }
  else
  {
    GEOFindOrCreateLog();
    v5 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v9 = "MapsSuggestionsDonater.m";
      v10 = 1026;
      v11 = 186;
      v12 = 2082;
      v13 = "-[MapsSuggestionsDonater _openConnectionIfNecessary]_block_invoke";
      _os_log_impl(&dword_1A427D000, v5, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
    }

  }
}

void __52__MapsSuggestionsDonater__openConnectionIfNecessary__block_invoke_155(uint64_t a1)
{
  _QWORD *WeakRetained;
  NSObject *v2;
  NSObject *v3;
  char *v4;
  NSObject *v5;
  int v6;
  char *v7;
  __int16 v8;
  int v9;
  __int16 v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  GEOFindOrCreateLog();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (WeakRetained)
  {
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      v4 = (char *)WeakRetained[2];
      v6 = 138412290;
      v7 = v4;
      _os_log_impl(&dword_1A427D000, v3, OS_LOG_TYPE_DEBUG, "XPC connection {%@} got interrupted", (uint8_t *)&v6, 0xCu);
    }

    -[MapsSuggestionsDonater _closeConnection](WeakRetained);
  }
  else
  {
    v5 = v2;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = 136446722;
      v7 = "MapsSuggestionsDonater.m";
      v8 = 1026;
      v9 = 188;
      v10 = 2082;
      v11 = "-[MapsSuggestionsDonater _openConnectionIfNecessary]_block_invoke";
      _os_log_impl(&dword_1A427D000, v5, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: innerStrongSelf went away in %{public}s", (uint8_t *)&v6, 0x1Cu);
    }

  }
}

void __52__MapsSuggestionsDonater__openConnectionIfNecessary__block_invoke_156(uint64_t a1, void *a2)
{
  id v3;
  id *v4;
  NSObject **WeakRetained;
  NSObject **v6;
  NSObject *v7;
  NSObject *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  uint8_t buf[4];
  char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (id *)(a1 + 32);
  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 32));
  v6 = WeakRetained;
  if (WeakRetained)
  {
    v7 = WeakRetained[1];
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __52__MapsSuggestionsDonater__openConnectionIfNecessary__block_invoke_157;
    v9[3] = &unk_1E4BCDB40;
    objc_copyWeak(&v11, v4);
    v10 = v3;
    dispatch_async(v7, v9);

    objc_destroyWeak(&v11);
  }
  else
  {
    GEOFindOrCreateLog();
    v8 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v13 = "MapsSuggestionsDonater.m";
      v14 = 1026;
      v15 = 195;
      v16 = 2082;
      v17 = "-[MapsSuggestionsDonater _openConnectionIfNecessary]_block_invoke";
      _os_log_impl(&dword_1A427D000, v8, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
    }

  }
}

void __52__MapsSuggestionsDonater__openConnectionIfNecessary__block_invoke_157(uint64_t a1)
{
  _QWORD *WeakRetained;
  NSObject *v3;
  NSObject *v4;
  char *v5;
  uint64_t v6;
  NSObject *v7;
  int v8;
  char *v9;
  __int16 v10;
  _WORD v11[17];

  *(_QWORD *)&v11[13] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  GEOFindOrCreateLog();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (WeakRetained)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      v5 = (char *)WeakRetained[2];
      v6 = *(_QWORD *)(a1 + 32);
      v8 = 138412546;
      v9 = v5;
      v10 = 2112;
      *(_QWORD *)v11 = v6;
      _os_log_impl(&dword_1A427D000, v4, OS_LOG_TYPE_DEBUG, "XPC connection {%@} got error: %@", (uint8_t *)&v8, 0x16u);
    }

    -[MapsSuggestionsDonater _closeConnection](WeakRetained);
  }
  else
  {
    v7 = v3;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = 136446722;
      v9 = "MapsSuggestionsDonater.m";
      v10 = 1026;
      *(_DWORD *)v11 = 197;
      v11[2] = 2082;
      *(_QWORD *)&v11[3] = "-[MapsSuggestionsDonater _openConnectionIfNecessary]_block_invoke";
      _os_log_impl(&dword_1A427D000, v7, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: innerStrongSelf went away in %{public}s", (uint8_t *)&v8, 0x1Cu);
    }

  }
}

void __52__MapsSuggestionsDonater__initCloseTimerIfNecessary__block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  void *v2;
  NSObject *v3;
  int v4;
  char *v5;
  __int16 v6;
  int v7;
  __int16 v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    -[MapsSuggestionsDonater _closeConnection](WeakRetained);
  }
  else
  {
    GEOFindOrCreateLog();
    v3 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v4 = 136446722;
      v5 = "MapsSuggestionsDonater.m";
      v6 = 1026;
      v7 = 248;
      v8 = 2082;
      v9 = "-[MapsSuggestionsDonater _initCloseTimerIfNecessary]_block_invoke";
      _os_log_impl(&dword_1A427D000, v3, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v4, 0x1Cu);
    }

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_closeTimer, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
