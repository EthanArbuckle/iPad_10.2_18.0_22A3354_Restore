@implementation MapsSuggestionsPredictor

+ (id)sharedPredictor
{
  if (_MergedGlobals_40 != -1)
    dispatch_once(&_MergedGlobals_40, &__block_literal_global_18);
  return (id)qword_1ED22F018;
}

void __43__MapsSuggestionsPredictor_sharedPredictor__block_invoke()
{
  MapsSuggestionsPredictor *v0;
  void *v1;

  v0 = objc_alloc_init(MapsSuggestionsPredictor);
  v1 = (void *)qword_1ED22F018;
  qword_1ED22F018 = (uint64_t)v0;

}

- (MapsSuggestionsPredictor)init
{
  MapsSuggestionsPredictor *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *queue;
  OS_dispatch_source *closeTimer;
  NSXPCConnection *connection;
  MapsSuggestionsSignalPackCache *v8;
  MapsSuggestionsSignalPackCache *signalPackCache;
  NSObject *v10;
  int BOOL;
  const __CFString *v12;
  objc_super v14;
  uint8_t buf[4];
  const __CFString *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v14.receiver = self;
  v14.super_class = (Class)MapsSuggestionsPredictor;
  v2 = -[MapsSuggestionsPredictor init](&v14, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("MapsSuggestionsPredictorQueue", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    closeTimer = v2->_closeTimer;
    v2->_closeTimer = 0;

    connection = v2->_connection;
    v2->_connection = 0;

    v8 = objc_alloc_init(MapsSuggestionsSignalPackCache);
    signalPackCache = v2->_signalPackCache;
    v2->_signalPackCache = v8;

    GEOFindOrCreateLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      BOOL = GEOConfigGetBOOL();
      v12 = CFSTR("NO");
      if (BOOL)
        v12 = CFSTR("YES");
      *(_DWORD *)buf = 138412290;
      v16 = v12;
      _os_log_impl(&dword_1A427D000, v10, OS_LOG_TYPE_DEBUG, "Are we collecting CarPlay Analytics? %@", buf, 0xCu);
    }

  }
  return v2;
}

- (void)dealloc
{
  OS_dispatch_queue *queue;
  objc_super v4;

  -[MapsSuggestionsPredictor _unscheduleCloseConnection]((uint64_t)self);
  -[MapsSuggestionsPredictor _closeConnection](self);
  queue = self->_queue;
  self->_queue = 0;

  v4.receiver = self;
  v4.super_class = (Class)MapsSuggestionsPredictor;
  -[MapsSuggestionsPredictor dealloc](&v4, sel_dealloc);
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
    -[MapsSuggestionsPredictor _unscheduleCloseConnection]((uint64_t)a1);
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

- (BOOL)predictedTransportModeForDestinationEntry:(id)a3 originCoordinate:(CLLocationCoordinate2D)a4 handler:(id)a5
{
  CLLocationDegrees longitude;
  CLLocationDegrees latitude;
  id v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  char *v13;
  NSObject *v14;
  NSObject *v15;
  char *v16;
  NSObject *queue;
  BOOL v18;
  NSObject *v19;
  _QWORD block[4];
  id v22;
  id v23;
  id v24[3];
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  _BYTE v28[14];
  __int16 v29;
  const char *v30;
  uint64_t v31;

  longitude = a4.longitude;
  latitude = a4.latitude;
  v31 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a5;
  if (!v10)
  {
    GEOFindOrCreateLog();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v26 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsPredictor.m";
      v27 = 1024;
      *(_DWORD *)v28 = 74;
      *(_WORD *)&v28[4] = 2082;
      *(_QWORD *)&v28[6] = "-[MapsSuggestionsPredictor predictedTransportModeForDestinationEntry:originCoordinate:handler:]";
      v29 = 2082;
      v30 = "nil == (handler)";
      _os_log_impl(&dword_1A427D000, v19, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a handler", buf, 0x26u);
    }

    goto LABEL_16;
  }
  GEOFindOrCreateLog();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (!v9)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v26 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsPredictor.m";
      v27 = 1024;
      *(_DWORD *)v28 = 75;
      *(_WORD *)&v28[4] = 2082;
      *(_QWORD *)&v28[6] = "-[MapsSuggestionsPredictor predictedTransportModeForDestinationEntry:originCoordinate:handler:]";
      v29 = 2082;
      v30 = "nil == (entry)";
      _os_log_impl(&dword_1A427D000, v12, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires an MSg entry", buf, 0x26u);
    }

LABEL_16:
    v18 = 0;
    goto LABEL_17;
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    -[MapsSuggestionsPredictor uniqueName](self, "uniqueName");
    v13 = (char *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v26 = v13;
    v27 = 2080;
    *(_QWORD *)v28 = "predictedTransportModeForDestinationEntry";
    _os_log_impl(&dword_1A427D000, v12, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s BEGIN", buf, 0x16u);

  }
  GEOFindOrCreateLog();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v14))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A427D000, v14, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "predictedTransportModeForDestinationEntry", ", buf, 2u);
  }

  GEOFindOrCreateLog();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v9, "uniqueIdentifier");
    v16 = (char *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v26 = v16;
    _os_log_impl(&dword_1A427D000, v15, OS_LOG_TYPE_DEBUG, "Predicting transport type for Entry %@", buf, 0xCu);

  }
  objc_initWeak((id *)buf, self);
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __95__MapsSuggestionsPredictor_predictedTransportModeForDestinationEntry_originCoordinate_handler___block_invoke;
  block[3] = &unk_1E4BCFE28;
  objc_copyWeak(v24, (id *)buf);
  v22 = v9;
  v24[1] = *(id *)&latitude;
  v24[2] = *(id *)&longitude;
  v23 = v10;
  dispatch_async(queue, block);

  objc_destroyWeak(v24);
  objc_destroyWeak((id *)buf);
  v18 = 1;
LABEL_17:

  return v18;
}

void __95__MapsSuggestionsPredictor_predictedTransportModeForDestinationEntry_originCoordinate_handler___block_invoke(uint64_t a1)
{
  id *v2;
  id *WeakRetained;
  id *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;
  uint8_t buf[4];
  char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  const char *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v2 = (id *)(a1 + 48);
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    -[MapsSuggestionsPredictor _openConnectionIfNecessary]((uint64_t)WeakRetained);
    objc_msgSend(v4[2], "remoteObjectProxy");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "data");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    NSDataFromCLLocationCoordinate(*(double *)(a1 + 56), *(double *)(a1 + 64));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __95__MapsSuggestionsPredictor_predictedTransportModeForDestinationEntry_originCoordinate_handler___block_invoke_21;
    v9[3] = &unk_1E4BCFE00;
    objc_copyWeak(&v12, v2);
    v11 = *(id *)(a1 + 40);
    v10 = *(id *)(a1 + 32);
    objc_msgSend(v5, "predictedTransportModeForDestinationEntryData:originCoordinateData:handler:", v6, v7, v9);

    -[MapsSuggestionsPredictor _scheduleCloseConnection]((dispatch_queue_t *)v4);
    objc_destroyWeak(&v12);
  }
  else
  {
    GEOFindOrCreateLog();
    v8 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v14 = "MapsSuggestionsPredictor.m";
      v15 = 1026;
      v16 = 82;
      v17 = 2082;
      v18 = "-[MapsSuggestionsPredictor predictedTransportModeForDestinationEntry:originCoordinate:handler:]_block_invoke";
      _os_log_impl(&dword_1A427D000, v8, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
    }

  }
}

- (void)_openConnectionIfNecessary
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  id v21;
  id location;

  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 8));
  if (!*(_QWORD *)(a1 + 16))
  {
    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE733788);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
    objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v3, sel_predictedTransportModeForDestinationEntryData_originCoordinateData_handler_, 0, 1);

    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
    objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v4, sel_predictedTransportModeForDestinationEntryData_originCoordinateData_handler_, 1, 1);

    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
    objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v5, sel_predictedTransportModeForDestinationEntryData_originCoordinateData_handler_, 2, 1);

    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
    objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_predictedTransportModeForDestinationEntryData_originCoordinateData_handler_, 0, 0);

    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
    objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v7, sel_predictedTransportModeForDestinationEntryData_originCoordinateData_handler_, 1, 0);

    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
    objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v8, sel_predictedTransportModeForDestinationMapItemData_originCoordinateData_handler_, 0, 1);

    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
    objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v9, sel_predictedTransportModeForDestinationMapItemData_originCoordinateData_handler_, 1, 1);

    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
    objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v10, sel_predictedTransportModeForDestinationMapItemData_originCoordinateData_handler_, 2, 1);

    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
    objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v11, sel_predictedTransportModeForDestinationMapItemData_originCoordinateData_handler_, 0, 0);

    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
    objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v12, sel_predictedTransportModeForDestinationMapItemData_originCoordinateData_handler_, 1, 0);

    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.maps.destinationd.predictions"), 0);
    objc_msgSend(v13, "setRemoteObjectInterface:", v2);
    objc_initWeak(&location, (id)a1);
    v14 = MEMORY[0x1E0C809B0];
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __54__MapsSuggestionsPredictor__openConnectionIfNecessary__block_invoke;
    v20[3] = &unk_1E4BCDFF8;
    objc_copyWeak(&v21, &location);
    objc_msgSend(v13, "setInvalidationHandler:", v20);
    v18[0] = v14;
    v18[1] = 3221225472;
    v18[2] = __54__MapsSuggestionsPredictor__openConnectionIfNecessary__block_invoke_38;
    v18[3] = &unk_1E4BCDFF8;
    objc_copyWeak(&v19, &location);
    objc_msgSend(v13, "setInterruptionHandler:", v18);
    v16[0] = v14;
    v16[1] = 3221225472;
    v16[2] = __54__MapsSuggestionsPredictor__openConnectionIfNecessary__block_invoke_40;
    v16[3] = &unk_1E4BCE048;
    objc_copyWeak(&v17, &location);
    v15 = (id)objc_msgSend(v13, "remoteObjectProxyWithErrorHandler:", v16);
    objc_storeStrong((id *)(a1 + 16), v13);
    objc_msgSend(v13, "resume");
    objc_destroyWeak(&v17);
    objc_destroyWeak(&v19);
    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);

  }
}

void __95__MapsSuggestionsPredictor_predictedTransportModeForDestinationEntry_originCoordinate_handler___block_invoke_21(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  char *v9;
  id WeakRetained;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  char *v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  char *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  char *v22;
  id v23;
  uint8_t buf[4];
  char *v25;
  __int16 v26;
  _WORD v27[17];

  *(_QWORD *)&v27[13] = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    if (v7 && !v9)
    {
      v23 = 0;
      NSDataToMapsSuggestionsTransportModes(v7, (uint64_t)&v23);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v23;
      if (v12)
      {
        (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
        GEOFindOrCreateLog();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(WeakRetained, "uniqueName");
          v14 = (char *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v25 = v14;
          v26 = 2080;
          *(_QWORD *)v27 = "predictedTransportModeForDestinationEntry";
          _os_log_impl(&dword_1A427D000, v13, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s END", buf, 0x16u);

        }
        GEOFindOrCreateLog();
        v15 = objc_claimAutoreleasedReturnValue();
        if (!os_signpost_enabled(v15))
          goto LABEL_23;
        *(_WORD *)buf = 0;
      }
      else
      {
        +[MapsSuggestionsSignalPack signalPackFromData:](MapsSuggestionsSignalPack, "signalPackFromData:", v8);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "geoMapItem");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(WeakRetained, "storeSignalPack:forMapItem:andEntry:", v19, v20, *(_QWORD *)(a1 + 32));

        (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
        GEOFindOrCreateLog();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(WeakRetained, "uniqueName");
          v22 = (char *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v25 = v22;
          v26 = 2080;
          *(_QWORD *)v27 = "predictedTransportModeForDestinationEntry";
          _os_log_impl(&dword_1A427D000, v21, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s END", buf, 0x16u);

        }
        GEOFindOrCreateLog();
        v15 = objc_claimAutoreleasedReturnValue();
        if (!os_signpost_enabled(v15))
          goto LABEL_23;
        *(_WORD *)buf = 0;
      }
      _os_signpost_emit_with_name_impl(&dword_1A427D000, v15, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "predictedTransportModeForDestinationEntry", ", buf, 2u);
LABEL_23:

      goto LABEL_24;
    }
    GEOFindOrCreateLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v25 = v9;
      _os_log_impl(&dword_1A427D000, v16, OS_LOG_TYPE_ERROR, "Error when predicting TransportType for Entry: %@", buf, 0xCu);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    GEOFindOrCreateLog();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(WeakRetained, "uniqueName");
      v18 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v25 = v18;
      v26 = 2080;
      *(_QWORD *)v27 = "predictedTransportModeForDestinationEntry";
      _os_log_impl(&dword_1A427D000, v17, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s FAIL", buf, 0x16u);

    }
    GEOFindOrCreateLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v12))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A427D000, v12, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "predictedTransportModeForDestinationEntry", ", buf, 2u);
    }
  }
  else
  {
    GEOFindOrCreateLog();
    v12 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v25 = "MapsSuggestionsPredictor.m";
      v26 = 1026;
      *(_DWORD *)v27 = 86;
      v27[2] = 2082;
      *(_QWORD *)&v27[3] = "-[MapsSuggestionsPredictor predictedTransportModeForDestinationEntry:originCoordinate:handler:]_block_invoke";
      _os_log_impl(&dword_1A427D000, v12, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf2 went away in %{public}s", buf, 0x1Cu);
    }

  }
LABEL_24:

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
    v13[2] = __54__MapsSuggestionsPredictor__initCloseTimerIfNecessary__block_invoke;
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

- (void)storeSignalPack:(id)a3 forMapItem:(id)a4 andEntry:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *queue;
  id v12;
  id v13;
  id v14;
  _QWORD block[4];
  id v16;
  id v17;
  id v18;
  id v19;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64__MapsSuggestionsPredictor_storeSignalPack_forMapItem_andEntry___block_invoke;
  block[3] = &unk_1E4BCFE50;
  objc_copyWeak(&v19, &location);
  v16 = v9;
  v17 = v8;
  v18 = v10;
  v12 = v10;
  v13 = v8;
  v14 = v9;
  dispatch_async(queue, block);

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
}

void __64__MapsSuggestionsPredictor_storeSignalPack_forMapItem_andEntry___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v3;
  uint64_t v4;
  NSObject *v5;
  int v6;
  char *v7;
  __int16 v8;
  int v9;
  __int16 v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = *(_QWORD *)(a1 + 32);
    if (v4)
      objc_msgSend(WeakRetained[4], "insertMapItem:signalPack:entry:", v4, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  }
  else
  {
    GEOFindOrCreateLog();
    v5 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = 136446722;
      v7 = "MapsSuggestionsPredictor.m";
      v8 = 1026;
      v9 = 123;
      v10 = 2082;
      v11 = "-[MapsSuggestionsPredictor storeSignalPack:forMapItem:andEntry:]_block_invoke";
      _os_log_impl(&dword_1A427D000, v5, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v6, 0x1Cu);
    }

  }
}

- (BOOL)predictedTransportModeForDestinationMapItem:(id)a3 originCoordinate:(CLLocationCoordinate2D)a4 handler:(id)a5
{
  CLLocationDegrees longitude;
  CLLocationDegrees latitude;
  id v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  char *v13;
  NSObject *v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  void *v19;
  NSObject *queue;
  BOOL v21;
  NSObject *v22;
  _QWORD block[4];
  id v25;
  id v26;
  id v27[3];
  uint8_t buf[4];
  const char *v29;
  __int16 v30;
  _BYTE v31[14];
  __int16 v32;
  const char *v33;
  uint64_t v34;

  longitude = a4.longitude;
  latitude = a4.latitude;
  v34 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a5;
  if (!v10)
  {
    GEOFindOrCreateLog();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v29 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsPredictor.m";
      v30 = 1024;
      *(_DWORD *)v31 = 136;
      *(_WORD *)&v31[4] = 2082;
      *(_QWORD *)&v31[6] = "-[MapsSuggestionsPredictor predictedTransportModeForDestinationMapItem:originCoordinate:handler:]";
      v32 = 2082;
      v33 = "nil == (handler)";
      _os_log_impl(&dword_1A427D000, v22, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a handler", buf, 0x26u);
    }

    goto LABEL_16;
  }
  GEOFindOrCreateLog();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (!v9)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v29 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsPredictor.m";
      v30 = 1024;
      *(_DWORD *)v31 = 137;
      *(_WORD *)&v31[4] = 2082;
      *(_QWORD *)&v31[6] = "-[MapsSuggestionsPredictor predictedTransportModeForDestinationMapItem:originCoordinate:handler:]";
      v32 = 2082;
      v33 = "nil == (mapItem)";
      _os_log_impl(&dword_1A427D000, v12, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a mapItem", buf, 0x26u);
    }

LABEL_16:
    v21 = 0;
    goto LABEL_17;
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    -[MapsSuggestionsPredictor uniqueName](self, "uniqueName");
    v13 = (char *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v29 = v13;
    v30 = 2080;
    *(_QWORD *)v31 = "predictedTransportModeForDestinationMapItem";
    _os_log_impl(&dword_1A427D000, v12, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s BEGIN", buf, 0x16u);

  }
  GEOFindOrCreateLog();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v14))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A427D000, v14, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "predictedTransportModeForDestinationMapItem", ", buf, 2u);
  }

  GEOFindOrCreateLog();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v9, "coordinate");
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%+.8f, %+.8f"), v16, v17);
    v18 = (char *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addressDictionary");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v29 = v18;
    v30 = 2112;
    *(_QWORD *)v31 = v19;
    _os_log_impl(&dword_1A427D000, v15, OS_LOG_TYPE_DEBUG, "Predicting transport type for mapItem %@, %@", buf, 0x16u);

  }
  objc_initWeak((id *)buf, self);
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __97__MapsSuggestionsPredictor_predictedTransportModeForDestinationMapItem_originCoordinate_handler___block_invoke;
  block[3] = &unk_1E4BCFE28;
  objc_copyWeak(v27, (id *)buf);
  v25 = v9;
  v27[1] = *(id *)&latitude;
  v27[2] = *(id *)&longitude;
  v26 = v10;
  dispatch_async(queue, block);

  objc_destroyWeak(v27);
  objc_destroyWeak((id *)buf);
  v21 = 1;
LABEL_17:

  return v21;
}

void __97__MapsSuggestionsPredictor_predictedTransportModeForDestinationMapItem_originCoordinate_handler___block_invoke(uint64_t a1)
{
  id *v2;
  id *WeakRetained;
  id *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;
  uint8_t buf[4];
  char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  const char *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v2 = (id *)(a1 + 48);
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    -[MapsSuggestionsPredictor _openConnectionIfNecessary]((uint64_t)WeakRetained);
    objc_msgSend(v4[2], "remoteObjectProxy");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "data");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    NSDataFromCLLocationCoordinate(*(double *)(a1 + 56), *(double *)(a1 + 64));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __97__MapsSuggestionsPredictor_predictedTransportModeForDestinationMapItem_originCoordinate_handler___block_invoke_26;
    v9[3] = &unk_1E4BCFE00;
    objc_copyWeak(&v12, v2);
    v11 = *(id *)(a1 + 40);
    v10 = *(id *)(a1 + 32);
    objc_msgSend(v5, "predictedTransportModeForDestinationMapItemData:originCoordinateData:handler:", v6, v7, v9);

    -[MapsSuggestionsPredictor _scheduleCloseConnection]((dispatch_queue_t *)v4);
    objc_destroyWeak(&v12);
  }
  else
  {
    GEOFindOrCreateLog();
    v8 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v14 = "MapsSuggestionsPredictor.m";
      v15 = 1026;
      v16 = 144;
      v17 = 2082;
      v18 = "-[MapsSuggestionsPredictor predictedTransportModeForDestinationMapItem:originCoordinate:handler:]_block_invoke";
      _os_log_impl(&dword_1A427D000, v8, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
    }

  }
}

void __97__MapsSuggestionsPredictor_predictedTransportModeForDestinationMapItem_originCoordinate_handler___block_invoke_26(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  char *v9;
  id WeakRetained;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  char *v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  char *v18;
  void *v19;
  NSObject *v20;
  char *v21;
  id v22;
  uint8_t buf[4];
  char *v24;
  __int16 v25;
  _WORD v26[17];

  *(_QWORD *)&v26[13] = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    if (v7 && !v9)
    {
      v22 = 0;
      NSDataToMapsSuggestionsTransportModes(v7, (uint64_t)&v22);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v22;
      if (v12)
      {
        (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
        GEOFindOrCreateLog();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(WeakRetained, "uniqueName");
          v14 = (char *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v24 = v14;
          v25 = 2080;
          *(_QWORD *)v26 = "predictedTransportModeForDestinationMapItem";
          _os_log_impl(&dword_1A427D000, v13, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s FAIL", buf, 0x16u);

        }
        GEOFindOrCreateLog();
        v15 = objc_claimAutoreleasedReturnValue();
        if (!os_signpost_enabled(v15))
          goto LABEL_23;
        *(_WORD *)buf = 0;
      }
      else
      {
        +[MapsSuggestionsSignalPack signalPackFromData:](MapsSuggestionsSignalPack, "signalPackFromData:", v8);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(WeakRetained, "storeSignalPack:forMapItem:andEntry:", v19, *(_QWORD *)(a1 + 32), 0);

        (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
        GEOFindOrCreateLog();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(WeakRetained, "uniqueName");
          v21 = (char *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v24 = v21;
          v25 = 2080;
          *(_QWORD *)v26 = "predictedTransportModeForDestinationMapItem";
          _os_log_impl(&dword_1A427D000, v20, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s END", buf, 0x16u);

        }
        GEOFindOrCreateLog();
        v15 = objc_claimAutoreleasedReturnValue();
        if (!os_signpost_enabled(v15))
          goto LABEL_23;
        *(_WORD *)buf = 0;
      }
      _os_signpost_emit_with_name_impl(&dword_1A427D000, v15, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "predictedTransportModeForDestinationMapItem", ", buf, 2u);
LABEL_23:

      goto LABEL_24;
    }
    GEOFindOrCreateLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v24 = v9;
      _os_log_impl(&dword_1A427D000, v16, OS_LOG_TYPE_ERROR, "Error when predicting TransportType for Entry: %@", buf, 0xCu);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    GEOFindOrCreateLog();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(WeakRetained, "uniqueName");
      v18 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v24 = v18;
      v25 = 2080;
      *(_QWORD *)v26 = "predictedTransportModeForDestinationMapItem";
      _os_log_impl(&dword_1A427D000, v17, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s FAIL", buf, 0x16u);

    }
    GEOFindOrCreateLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v12))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A427D000, v12, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "predictedTransportModeForDestinationMapItem", ", buf, 2u);
    }
  }
  else
  {
    GEOFindOrCreateLog();
    v12 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v24 = "MapsSuggestionsPredictor.m";
      v25 = 1026;
      *(_DWORD *)v26 = 149;
      v26[2] = 2082;
      *(_QWORD *)&v26[3] = "-[MapsSuggestionsPredictor predictedTransportModeForDestinationMapItem:originCoordinate:handl"
                           "er:]_block_invoke";
      _os_log_impl(&dword_1A427D000, v12, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf2 went away in %{public}s", buf, 0x1Cu);
    }

  }
LABEL_24:

}

void __74__MapsSuggestionsPredictor__overrideTempPredictedTransportModeForCarPlay___block_invoke(uint64_t a1)
{
  int *WeakRetained;
  float v3;
  NSObject *v4;
  char *v5;
  NSObject *v6;
  int v7;
  char *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  WeakRetained = (int *)objc_loadWeakRetained((id *)(a1 + 40));
  if (!WeakRetained)
  {
    GEOFindOrCreateLog();
    v6 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = 136446722;
      v8 = "MapsSuggestionsPredictor.m";
      v9 = 1026;
      v10 = 187;
      v11 = 2082;
      v12 = "-[MapsSuggestionsPredictor _overrideTempPredictedTransportModeForCarPlay:]_block_invoke";
      _os_log_impl(&dword_1A427D000, v6, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v7, 0x1Cu);
    }

    goto LABEL_13;
  }
  if (objc_msgSend(*(id *)(a1 + 32), "hasType:", 20))
  {
    objc_msgSend(*(id *)(a1 + 32), "valueForSignalType:", 20);
    if (v3 != 0.0)
    {
      if (WeakRetained[10])
      {
        GEOFindOrCreateLog();
        v4 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
        {
          MapsSuggestionsLocalizedStringFromGEOTransportType(WeakRetained[10]);
          v5 = (char *)objc_claimAutoreleasedReturnValue();
          v7 = 138412290;
          v8 = v5;
          _os_log_impl(&dword_1A427D000, v4, OS_LOG_TYPE_DEBUG, "_tempPredictedTransportMode is not GEOTransportType_AUTOMOBILE. It is %@. Fixing it.", (uint8_t *)&v7, 0xCu);

        }
      }
      WeakRetained[10] = 0;
      GEOFindOrCreateLog();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(v7) = 0;
        _os_log_impl(&dword_1A427D000, v6, OS_LOG_TYPE_DEBUG, "Forcing _tempPredictedTransportMode to be GEOTransportType_AUTOMOBILE", (uint8_t *)&v7, 2u);
      }
LABEL_13:

    }
  }

}

- (void)captureActualTransportationMode:(int)a3 originMapItem:(id)a4 destinationMapItem:(id)a5
{
  id v8;
  id v9;
  NSObject *queue;
  NSObject *v11;
  const char *v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  int v17;
  _BYTE location[12];
  __int16 v19;
  int v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  const char *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  if (!v9)
  {
    GEOFindOrCreateLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)location = 136446978;
      *(_QWORD *)&location[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsPredictor.m";
      v19 = 1024;
      v20 = 225;
      v21 = 2082;
      v22 = "-[MapsSuggestionsPredictor captureActualTransportationMode:originMapItem:destinationMapItem:]";
      v23 = 2082;
      v24 = "nil == (destinationMapItem)";
      v12 = "At %{public}s:%d, %{public}s forbids: %{public}s. destinationMapItem cannot be nil";
LABEL_8:
      _os_log_impl(&dword_1A427D000, v11, OS_LOG_TYPE_ERROR, v12, location, 0x26u);
    }
LABEL_9:

    goto LABEL_10;
  }
  if (!v8)
  {
    GEOFindOrCreateLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)location = 136446978;
      *(_QWORD *)&location[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsPredictor.m";
      v19 = 1024;
      v20 = 226;
      v21 = 2082;
      v22 = "-[MapsSuggestionsPredictor captureActualTransportationMode:originMapItem:destinationMapItem:]";
      v23 = 2082;
      v24 = "nil == (originMapItem)";
      v12 = "At %{public}s:%d, %{public}s forbids: %{public}s. originMapItem cannot be nil";
      goto LABEL_8;
    }
    goto LABEL_9;
  }
  objc_initWeak((id *)location, self);
  queue = self->_queue;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __93__MapsSuggestionsPredictor_captureActualTransportationMode_originMapItem_destinationMapItem___block_invoke;
  v13[3] = &unk_1E4BCFEC8;
  objc_copyWeak(&v16, (id *)location);
  v14 = v9;
  v15 = v8;
  v17 = a3;
  dispatch_async(queue, v13);

  objc_destroyWeak(&v16);
  objc_destroyWeak((id *)location);
LABEL_10:

}

void __93__MapsSuggestionsPredictor_captureActualTransportationMode_originMapItem_destinationMapItem___block_invoke(uint64_t a1)
{
  id *v2;
  id *WeakRetained;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  id v15;
  NSObject *v16;
  _QWORD v17[4];
  id v18;
  uint64_t v19;
  _QWORD *v20;
  _BYTE *v21;
  id v22;
  int v23;
  _QWORD v24[4];
  NSObject *v25;
  _QWORD *v26;
  _BYTE *v27;
  id v28;
  _QWORD v29[3];
  char v30;
  _BYTE buf[32];
  void (*v32)(uint64_t);
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v2 = (id *)(a1 + 48);
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  v4 = (uint64_t)WeakRetained;
  if (WeakRetained)
  {
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    *(_QWORD *)&buf[24] = __Block_byref_object_copy__9;
    v32 = __Block_byref_object_dispose__9;
    objc_msgSend(WeakRetained[4], "signalPackForMapItem:", *(_QWORD *)(a1 + 32));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = (id)objc_msgSend(v5, "mutableCopy");

    v29[0] = 0;
    v29[1] = v29;
    v29[2] = 0x2020000000;
    v30 = 0;
    v6 = dispatch_group_create();
    objc_msgSend(*(id *)(a1 + 40), "coordinate");
    NSDataFromCLLocationCoordinate(v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    dispatch_group_enter(v6);
    -[MapsSuggestionsPredictor _openConnectionIfNecessary](v4);
    objc_msgSend(*(id *)(v4 + 16), "remoteObjectProxy");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "data");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = MEMORY[0x1E0C809B0];
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __93__MapsSuggestionsPredictor_captureActualTransportationMode_originMapItem_destinationMapItem___block_invoke_29;
    v24[3] = &unk_1E4BCFE78;
    objc_copyWeak(&v28, v2);
    v26 = v29;
    v13 = v6;
    v25 = v13;
    v27 = buf;
    objc_msgSend(v10, "predictedTransportModeForDestinationMapItemData:originCoordinateData:handler:", v11, v9, v24);

    v14 = *(NSObject **)(v4 + 8);
    v17[0] = v12;
    v17[1] = 3221225472;
    v17[2] = __93__MapsSuggestionsPredictor_captureActualTransportationMode_originMapItem_destinationMapItem___block_invoke_31;
    v17[3] = &unk_1E4BCFEA0;
    objc_copyWeak(&v22, v2);
    v20 = v29;
    v15 = *(id *)(a1 + 32);
    v23 = *(_DWORD *)(a1 + 56);
    v21 = buf;
    v18 = v15;
    v19 = v4;
    dispatch_group_notify(v13, v14, v17);

    objc_destroyWeak(&v22);
    objc_destroyWeak(&v28);

    _Block_object_dispose(v29, 8);
    _Block_object_dispose(buf, 8);

  }
  else
  {
    GEOFindOrCreateLog();
    v16 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      *(_QWORD *)&buf[4] = "MapsSuggestionsPredictor.m";
      *(_WORD *)&buf[12] = 1026;
      *(_DWORD *)&buf[14] = 230;
      *(_WORD *)&buf[18] = 2082;
      *(_QWORD *)&buf[20] = "-[MapsSuggestionsPredictor captureActualTransportationMode:originMapItem:destinationMapItem:]_block_invoke";
      _os_log_impl(&dword_1A427D000, v16, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
    }

  }
}

void __93__MapsSuggestionsPredictor_captureActualTransportationMode_originMapItem_destinationMapItem___block_invoke_29(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  _QWORD *WeakRetained;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  id v20;
  NSObject *v21;
  id v22;
  id location;
  _BYTE buf[32];
  id v25;
  id v26[3];

  v26[2] = *(id *)MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    +[MapsSuggestionsSignalPack signalPackFromData:](MapsSuggestionsMutableSignalPack, "signalPackFromData:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "mutableCopy");

    if (v9 || !v12)
    {
      GEOFindOrCreateLog();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v9;
        _os_log_impl(&dword_1A427D000, v15, OS_LOG_TYPE_ERROR, "Could not submit analytics because either the incomingSignalPack is nil for this mapItem OR because of this error: %@", buf, 0xCu);
      }

      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    }
    else
    {
      if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
        goto LABEL_15;
      -[NSObject mergeIntoSignalPack:](v12, "mergeIntoSignalPack:");
      GEOFindOrCreateLog();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A427D000, v13, OS_LOG_TYPE_DEBUG, "Merged incomingSignalPack into the cached signalPack for this mapItem", buf, 2u);
      }

      v14 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
      if (!v14)
      {
LABEL_15:
        v16 = -[NSObject mutableCopy](v12, "mutableCopy");
        v17 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
        v18 = *(void **)(v17 + 40);
        *(_QWORD *)(v17 + 40) = v16;

        GEOFindOrCreateLog();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A427D000, v19, OS_LOG_TYPE_DEBUG, "Made a copy of incomingSignalpack and assigned to signalPack", buf, 2u);
        }

        v14 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
      }
      v20 = v14;
      objc_initWeak(&location, WeakRetained);
      v21 = WeakRetained[1];
      *(_QWORD *)buf = MEMORY[0x1E0C809B0];
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = __74__MapsSuggestionsPredictor__overrideTempPredictedTransportModeForCarPlay___block_invoke;
      *(_QWORD *)&buf[24] = &unk_1E4BCDB40;
      objc_copyWeak(v26, &location);
      v22 = v20;
      v25 = v22;
      dispatch_async(v21, buf);

      objc_destroyWeak(v26);
      objc_destroyWeak(&location);

    }
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  }
  else
  {
    GEOFindOrCreateLog();
    v12 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      *(_QWORD *)&buf[4] = "MapsSuggestionsPredictor.m";
      *(_WORD *)&buf[12] = 1026;
      *(_DWORD *)&buf[14] = 252;
      *(_WORD *)&buf[18] = 2082;
      *(_QWORD *)&buf[20] = "-[MapsSuggestionsPredictor captureActualTransportationMode:originMapItem:destinationMapItem:]_block_invoke";
      _os_log_impl(&dword_1A427D000, v12, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf2 went away in %{public}s", buf, 0x1Cu);
    }

  }
}

void __93__MapsSuggestionsPredictor_captureActualTransportationMode_originMapItem_destinationMapItem___block_invoke_31(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  NSObject *v4;
  char *v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  char *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  char *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  uint64_t v21;
  void *v22;
  id v23;
  float v24;
  id v25;
  float v26;
  id v27;
  float v28;
  id v29;
  float v30;
  id v31;
  float v32;
  id v33;
  float v34;
  id v35;
  float v36;
  id v37;
  float v38;
  id v39;
  float v40;
  id v41;
  float v42;
  int v43;
  int v44;
  id v45;
  float v46;
  id v47;
  void *v48;
  float v49;
  void *v50;
  float v51;
  float v52;
  id v53;
  float v54;
  void *v55;
  float v56;
  float v57;
  id v58;
  float v59;
  void *v60;
  float v61;
  float v62;
  id v63;
  uint64_t v64;
  float v65;
  void *v66;
  float v67;
  float v68;
  id v69;
  float v70;
  NSObject *v71;
  void *v72;
  float v73;
  float v74;
  id v75;
  float v76;
  void *v77;
  float v78;
  float v79;
  id v80;
  float v81;
  void *v82;
  id v83;
  float v84;
  void *v85;
  unsigned int v86;
  id v87;
  float v88;
  void *v89;
  unsigned int v90;
  int v91;
  int v92;
  unint64_t v93;
  int v94;
  id v95;
  float v96;
  id v97;
  float v98;
  void *v99;
  id v100;
  float v101;
  void *v102;
  id v103;
  float v104;
  void *v105;
  NSObject *v106;
  char *v107;
  void *v108;
  uint64_t v109;
  uint64_t v110;
  id v111;
  uint64_t v112;
  uint64_t v113;
  void *v114;
  int v115;
  unsigned int v116;
  void *v117;
  void *v118;
  unsigned int v119;
  void *v120;
  void *v121;
  void *v122;
  int v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  uint8_t buf[4];
  char *v142;
  __int16 v143;
  _BYTE v144[18];
  uint64_t v145;

  v145 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
    {
      GEOFindOrCreateLog();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(*(id *)(a1 + 32), "shortAddress");
        v5 = (char *)objc_claimAutoreleasedReturnValue();
        v6 = v5;
        if (!v5)
        {
          objc_msgSend(*(id *)(a1 + 32), "coordinate");
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%+.8f, %+.8f"), v7, v8);
          v6 = (char *)objc_claimAutoreleasedReturnValue();
        }
        *(_DWORD *)buf = 138412290;
        v142 = v6;
        _os_log_impl(&dword_1A427D000, v4, OS_LOG_TYPE_ERROR, "Error generating a signalPack for mapItem \"%@", buf, 0xCu);
        if (!v5)

      }
    }
    else
    {
      if (*((_DWORD *)WeakRetained + 10) == 4)
      {
        GEOFindOrCreateLog();
        v9 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(*(id *)(a1 + 32), "shortAddress");
          v10 = (char *)objc_claimAutoreleasedReturnValue();
          v11 = v10;
          if (!v10)
          {
            objc_msgSend(*(id *)(a1 + 32), "coordinate");
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%+.8f, %+.8f"), v12, v13);
            v11 = (char *)objc_claimAutoreleasedReturnValue();
          }
          *(_DWORD *)buf = 138412290;
          v142 = v11;
          _os_log_impl(&dword_1A427D000, v9, OS_LOG_TYPE_ERROR, "Predicted transport mode is UNKNOWN. \"%@", buf, 0xCu);
          if (!v10)

        }
      }
      GEOFindOrCreateLog();
      v14 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        MapsSuggestionsLocalizedStringFromGEOTransportType(*(_DWORD *)(a1 + 72));
        v15 = (char *)(id)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v142 = v15;
        _os_log_impl(&dword_1A427D000, v14, OS_LOG_TYPE_DEBUG, "Captured the Actual Transportation Mode %@", buf, 0xCu);

      }
      MapsSuggestionsCurrentBestLocation();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "coordinate");
      v18 = v17;
      v20 = v19;

      v21 = objc_msgSend(objc_alloc(MEMORY[0x1E0D27140]), "initWithLatitude:longitude:", v18, v20);
      v22 = (void *)MEMORY[0x1E0D263E8];
      v23 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
      if (objc_msgSend(v23, "hasType:", 7))
      {
        objc_msgSend(v23, "valueForSignalType:", 7);
        MapsSuggestionsBucketizedValueForType(7, v24);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:");
        v140 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v140 = 0;
      }

      v25 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
      if (objc_msgSend(v25, "hasType:", 8))
      {
        objc_msgSend(v25, "valueForSignalType:", 8);
        MapsSuggestionsBucketizedValueForType(8, v26);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:");
        v139 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v139 = 0;
      }

      v27 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
      if (objc_msgSend(v27, "hasType:", 9))
      {
        objc_msgSend(v27, "valueForSignalType:", 9);
        MapsSuggestionsBucketizedValueForType(9, v28);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:");
        v138 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v138 = 0;
      }

      v29 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
      if (objc_msgSend(v29, "hasType:", 5))
      {
        objc_msgSend(v29, "valueForSignalType:", 5);
        MapsSuggestionsBucketizedValueForType(5, v30);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:");
        v137 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v137 = 0;
      }

      v31 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
      if (objc_msgSend(v31, "hasType:", 3))
      {
        objc_msgSend(v31, "valueForSignalType:", 3);
        MapsSuggestionsBucketizedValueForType(3, v32);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:");
        v136 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v136 = 0;
      }

      v33 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
      if (objc_msgSend(v33, "hasType:", 2))
      {
        objc_msgSend(v33, "valueForSignalType:", 2);
        MapsSuggestionsBucketizedValueForType(2, v34);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:");
        v132 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v132 = 0;
      }

      v35 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
      if (objc_msgSend(v35, "hasType:", 4))
      {
        objc_msgSend(v35, "valueForSignalType:", 4);
        MapsSuggestionsBucketizedValueForType(4, v36);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:");
        v135 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v135 = 0;
      }

      v37 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
      if (objc_msgSend(v37, "hasType:", 6))
      {
        objc_msgSend(v37, "valueForSignalType:", 6);
        MapsSuggestionsBucketizedValueForType(6, v38);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:");
        v131 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v131 = 0;
      }

      v39 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
      if (objc_msgSend(v39, "hasType:", 10))
      {
        objc_msgSend(v39, "valueForSignalType:", 10);
        MapsSuggestionsBucketizedValueForType(10, v40);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:");
        v130 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v130 = 0;
      }

      v41 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
      if (objc_msgSend(v41, "hasType:", 23))
      {
        objc_msgSend(v41, "valueForSignalType:", 23);
        MapsSuggestionsBucketizedValueForType(23, v42);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:");
        v129 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v129 = 0;
      }

      v43 = *(_DWORD *)(a1 + 72) - 1;
      if (v43 > 5)
        v44 = 1;
      else
        v44 = dword_1A43B3408[v43];
      v123 = v44;
      v45 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
      if (objc_msgSend(v45, "hasType:", 11))
      {
        objc_msgSend(v45, "valueForSignalType:", 11);
        MapsSuggestionsBucketizedValueForType(11, v46);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:");
        v128 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v128 = 0;
      }

      v47 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
      v48 = v22;
      if (objc_msgSend(v47, "hasType:", 16))
      {
        objc_msgSend(v47, "valueForSignalType:", 16);
        MapsSuggestionsBucketizedValueForType(16, v49);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v50 = 0;
      }

      objc_msgSend(v50, "floatValue");
      v52 = v51;
      v53 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
      if (objc_msgSend(v53, "hasType:", 14))
      {
        objc_msgSend(v53, "valueForSignalType:", 14);
        MapsSuggestionsBucketizedValueForType(14, v54);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v55 = 0;
      }

      objc_msgSend(v55, "floatValue");
      v57 = v56;
      v58 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
      if (objc_msgSend(v58, "hasType:", 18))
      {
        objc_msgSend(v58, "valueForSignalType:", 18);
        MapsSuggestionsBucketizedValueForType(18, v59);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v60 = 0;
      }

      objc_msgSend(v60, "floatValue");
      v62 = v61;
      v63 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
      v64 = v21;
      if (objc_msgSend(v63, "hasType:", 17))
      {
        objc_msgSend(v63, "valueForSignalType:", 17);
        MapsSuggestionsBucketizedValueForType(17, v65);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:");
        v66 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v66 = 0;
      }

      v124 = v66;
      objc_msgSend(v66, "floatValue");
      v68 = v67;
      v69 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
      if (objc_msgSend(v69, "hasType:", 13))
      {
        objc_msgSend(v69, "valueForSignalType:", 13);
        MapsSuggestionsBucketizedValueForType(13, v70);
        v71 = v64;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:");
        v72 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v71 = v64;
        v72 = 0;
      }

      objc_msgSend(v72, "floatValue");
      v74 = v73;
      v75 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
      v127 = v50;
      if (objc_msgSend(v75, "hasType:", 15))
      {
        objc_msgSend(v75, "valueForSignalType:", 15);
        MapsSuggestionsBucketizedValueForType(15, v76);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:");
        v77 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v77 = 0;
      }

      v121 = v77;
      objc_msgSend(v77, "floatValue");
      v79 = v78;
      v80 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
      if (objc_msgSend(v80, "hasType:", 1))
      {
        objc_msgSend(v80, "valueForSignalType:", 1);
        MapsSuggestionsBucketizedValueForType(1, v81);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:");
        v82 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v82 = 0;
      }

      v119 = objc_msgSend(v82, "intValue");
      v83 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
      v133 = v48;
      v122 = v72;
      if (objc_msgSend(v83, "hasType:", 27))
      {
        objc_msgSend(v83, "valueForSignalType:", 27);
        MapsSuggestionsBucketizedValueForType(27, v84);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:");
        v85 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v85 = 0;
      }

      v86 = objc_msgSend(v85, "intValue");
      v87 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
      v125 = v60;
      if (objc_msgSend(v87, "hasType:", 21))
      {
        objc_msgSend(v87, "valueForSignalType:", 21);
        MapsSuggestionsBucketizedValueForType(21, v88);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:");
        v89 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v89 = 0;
      }

      v90 = objc_msgSend(v89, "intValue");
      v91 = *(_DWORD *)(*(_QWORD *)(a1 + 40) + 40) - 1;
      v117 = v89;
      v116 = v90;
      if (v91 > 5)
        v92 = 1;
      else
        v92 = dword_1A43B3408[v91];
      v115 = v92;
      v93 = GEOGetUserTransportTypePreference();
      if (v93 < 5)
        v94 = v93 + 1;
      else
        v94 = 0;
      v95 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
      if (objc_msgSend(v95, "hasType:", 12))
      {
        objc_msgSend(v95, "valueForSignalType:", 12);
        MapsSuggestionsBucketizedValueForType(12, v96);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:");
        v114 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v114 = 0;
      }

      v97 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
      v126 = v55;
      if (objc_msgSend(v97, "hasType:", 20))
      {
        objc_msgSend(v97, "valueForSignalType:", 20);
        MapsSuggestionsBucketizedValueForType(20, v98);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:");
        v99 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v99 = 0;
      }

      v100 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
      v134 = v3;
      v120 = v82;
      v118 = v85;
      if (objc_msgSend(v100, "hasType:", 39))
      {
        objc_msgSend(v100, "valueForSignalType:", 39);
        MapsSuggestionsBucketizedValueForType(39, v101);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:");
        v102 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v102 = 0;
      }

      v103 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
      if (objc_msgSend(v103, "hasType:", 38))
      {
        objc_msgSend(v103, "valueForSignalType:", 38);
        MapsSuggestionsBucketizedValueForType(38, v104);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:");
        v105 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v105 = 0;
      }

      v4 = v71;
      LODWORD(v113) = v94;
      LODWORD(v112) = v123;
      objc_msgSend(v133, "capturePredExTrainingWithChanceOfPrecipitation:chanceOfRain:chanceOfSnow:endTime:durationUntilEventEnd:durationUntilEventStart:startTime:temperature:timeOfDay:timeSinceBackgrounded:actualTransportMode:dayOfWeek:distanceFromHereToHome:distanceFromHereToOrigin:distanceFromHereToParkedCar:distanceFromHereToWork:distanceFromHere:distanceFromOriginToDestination:entryType:weatherType:mapType:predictedTransportMode:preferredTransportMode:isTourist:isCarplayConnected:isTransitPossible:userLocation:isVehicleBluetoothConnected:weatherAqi:", v140, v139, v138, v137, v136, v132, v135, v131, v130, v129, v112, v128, __PAIR64__((int)v57, (int)v52),
        __PAIR64__((int)v68, (int)v62),
        __PAIR64__((int)v79, (int)v74),
        __PAIR64__(v86, v119),
        __PAIR64__(v115, v116),
        v113,
        v114,
        v99,
        0,
        v71,
        v102,
        v105);

      GEOFindOrCreateLog();
      v106 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v106, OS_LOG_TYPE_INFO))
      {
        v107 = *(char **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
        objc_msgSend(*(id *)(a1 + 32), "shortAddress");
        v108 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "coordinate");
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%+.8f, %+.8f"), v109, v110);
        v111 = (id)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v142 = v107;
        v143 = 2112;
        *(_QWORD *)v144 = v108;
        *(_WORD *)&v144[8] = 2112;
        *(_QWORD *)&v144[10] = v111;
        _os_log_impl(&dword_1A427D000, v106, OS_LOG_TYPE_INFO, "Submitted analytics for Transport Mode Prediction %@ to %@ at %@", buf, 0x20u);

      }
      v3 = v134;
    }
  }
  else
  {
    GEOFindOrCreateLog();
    v4 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v142 = "MapsSuggestionsPredictor.m";
      v143 = 1026;
      *(_DWORD *)v144 = 286;
      *(_WORD *)&v144[4] = 2082;
      *(_QWORD *)&v144[6] = "-[MapsSuggestionsPredictor captureActualTransportationMode:originMapItem:destinationMapItem:]_block_invoke";
      _os_log_impl(&dword_1A427D000, v4, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf2 went away in %{public}s", buf, 0x1Cu);
    }

  }
}

- (void)capturePredictedTransportationMode:(int)a3
{
  NSObject *queue;
  _QWORD block[4];
  id v7;
  int v8;
  id location;

  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63__MapsSuggestionsPredictor_capturePredictedTransportationMode___block_invoke;
  block[3] = &unk_1E4BCFEF0;
  objc_copyWeak(&v7, &location);
  v8 = a3;
  dispatch_async(queue, block);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __63__MapsSuggestionsPredictor_capturePredictedTransportationMode___block_invoke(uint64_t a1)
{
  _DWORD *WeakRetained;
  NSObject *v3;
  NSObject *v4;
  char *v5;
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
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (WeakRetained)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      MapsSuggestionsLocalizedStringFromGEOTransportType(*(_DWORD *)(a1 + 40));
      v5 = (char *)objc_claimAutoreleasedReturnValue();
      v7 = 138412290;
      v8 = v5;
      _os_log_impl(&dword_1A427D000, v4, OS_LOG_TYPE_DEBUG, "Captured the Predicted Transportation Mode %@", (uint8_t *)&v7, 0xCu);

    }
    WeakRetained[10] = *(_DWORD *)(a1 + 40);
  }
  else
  {
    v6 = v3;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = 136446722;
      v8 = "MapsSuggestionsPredictor.m";
      v9 = 1026;
      v10 = 341;
      v11 = 2082;
      v12 = "-[MapsSuggestionsPredictor capturePredictedTransportationMode:]_block_invoke";
      _os_log_impl(&dword_1A427D000, v6, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v7, 0x1Cu);
    }

  }
}

- (void)cancelCapturingAnalytics
{
  NSObject *queue;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  queue = self->_queue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __52__MapsSuggestionsPredictor_cancelCapturingAnalytics__block_invoke;
  v4[3] = &unk_1E4BCDFF8;
  objc_copyWeak(&v5, &location);
  dispatch_async(queue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __52__MapsSuggestionsPredictor_cancelCapturingAnalytics__block_invoke(uint64_t a1)
{
  _DWORD *WeakRetained;
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
      _os_log_impl(&dword_1A427D000, v3, OS_LOG_TYPE_DEBUG, "Cancelled capturing analytics for PTM", (uint8_t *)&v5, 2u);
    }

    WeakRetained[10] = 4;
  }
  else
  {
    v4 = v2;
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = 136446722;
      v6 = "MapsSuggestionsPredictor.m";
      v7 = 1026;
      v8 = 351;
      v9 = 2082;
      v10 = "-[MapsSuggestionsPredictor cancelCapturingAnalytics]_block_invoke";
      _os_log_impl(&dword_1A427D000, v4, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v5, 0x1Cu);
    }

  }
}

- (NSString)uniqueName
{
  return (NSString *)objc_msgSend((id)objc_opt_class(), "description");
}

void __54__MapsSuggestionsPredictor__openConnectionIfNecessary__block_invoke(uint64_t a1)
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
    block[2] = __54__MapsSuggestionsPredictor__openConnectionIfNecessary__block_invoke_37;
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
      v9 = "MapsSuggestionsPredictor.m";
      v10 = 1026;
      v11 = 384;
      v12 = 2082;
      v13 = "-[MapsSuggestionsPredictor _openConnectionIfNecessary]_block_invoke";
      _os_log_impl(&dword_1A427D000, v5, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
    }

  }
}

void __54__MapsSuggestionsPredictor__openConnectionIfNecessary__block_invoke_37(uint64_t a1)
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

    -[MapsSuggestionsPredictor _unscheduleCloseConnection]((uint64_t)WeakRetained);
  }
  else
  {
    v6 = v2;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = 136446722;
      v8 = "MapsSuggestionsPredictor.m";
      v9 = 1026;
      v10 = 386;
      v11 = 2082;
      v12 = "-[MapsSuggestionsPredictor _openConnectionIfNecessary]_block_invoke";
      _os_log_impl(&dword_1A427D000, v6, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: innerStrongSelf went away in %{public}s", (uint8_t *)&v7, 0x1Cu);
    }

  }
}

void __54__MapsSuggestionsPredictor__openConnectionIfNecessary__block_invoke_38(uint64_t a1)
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
    block[2] = __54__MapsSuggestionsPredictor__openConnectionIfNecessary__block_invoke_39;
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
      v9 = "MapsSuggestionsPredictor.m";
      v10 = 1026;
      v11 = 394;
      v12 = 2082;
      v13 = "-[MapsSuggestionsPredictor _openConnectionIfNecessary]_block_invoke";
      _os_log_impl(&dword_1A427D000, v5, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
    }

  }
}

void __54__MapsSuggestionsPredictor__openConnectionIfNecessary__block_invoke_39(uint64_t a1)
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

    -[MapsSuggestionsPredictor _closeConnection](WeakRetained);
  }
  else
  {
    v5 = v2;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = 136446722;
      v7 = "MapsSuggestionsPredictor.m";
      v8 = 1026;
      v9 = 396;
      v10 = 2082;
      v11 = "-[MapsSuggestionsPredictor _openConnectionIfNecessary]_block_invoke";
      _os_log_impl(&dword_1A427D000, v5, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: innerStrongSelf went away in %{public}s", (uint8_t *)&v6, 0x1Cu);
    }

  }
}

void __54__MapsSuggestionsPredictor__openConnectionIfNecessary__block_invoke_40(uint64_t a1, void *a2)
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
    v9[2] = __54__MapsSuggestionsPredictor__openConnectionIfNecessary__block_invoke_41;
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
      v13 = "MapsSuggestionsPredictor.m";
      v14 = 1026;
      v15 = 403;
      v16 = 2082;
      v17 = "-[MapsSuggestionsPredictor _openConnectionIfNecessary]_block_invoke";
      _os_log_impl(&dword_1A427D000, v8, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
    }

  }
}

void __54__MapsSuggestionsPredictor__openConnectionIfNecessary__block_invoke_41(uint64_t a1)
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

    -[MapsSuggestionsPredictor _closeConnection](WeakRetained);
  }
  else
  {
    v7 = v3;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = 136446722;
      v9 = "MapsSuggestionsPredictor.m";
      v10 = 1026;
      *(_DWORD *)v11 = 405;
      v11[2] = 2082;
      *(_QWORD *)&v11[3] = "-[MapsSuggestionsPredictor _openConnectionIfNecessary]_block_invoke";
      _os_log_impl(&dword_1A427D000, v7, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: innerStrongSelf went away in %{public}s", (uint8_t *)&v8, 0x1Cu);
    }

  }
}

void __54__MapsSuggestionsPredictor__initCloseTimerIfNecessary__block_invoke(uint64_t a1)
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
    -[MapsSuggestionsPredictor _closeConnection](WeakRetained);
  }
  else
  {
    GEOFindOrCreateLog();
    v3 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v4 = 136446722;
      v5 = "MapsSuggestionsPredictor.m";
      v6 = 1026;
      v7 = 456;
      v8 = 2082;
      v9 = "-[MapsSuggestionsPredictor _initCloseTimerIfNecessary]_block_invoke";
      _os_log_impl(&dword_1A427D000, v3, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v4, 0x1Cu);
    }

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signalPackCache, 0);
  objc_storeStrong((id *)&self->_closeTimer, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
