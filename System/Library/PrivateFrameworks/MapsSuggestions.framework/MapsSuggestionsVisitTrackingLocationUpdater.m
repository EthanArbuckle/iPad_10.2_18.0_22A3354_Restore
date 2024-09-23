@implementation MapsSuggestionsVisitTrackingLocationUpdater

- (id)initDecoratingLocationUpdater:(id)a3
{
  id v5;
  MapsSuggestionsVisitTrackingLocationUpdater *v6;
  void *v7;
  dispatch_queue_t v8;
  OS_dispatch_queue *innerQueue;
  NSString *v10;
  NSString *name;
  CLVisit *currentVisit;
  MapsSuggestionsObservers *v13;
  OS_dispatch_queue *v14;
  uint64_t v15;
  MapsSuggestionsObservers *locationObservers;
  MapsSuggestionsObservers *v17;
  OS_dispatch_queue *v18;
  uint64_t v19;
  MapsSuggestionsObservers *visitObservers;
  double v21;
  dispatch_queue_t v23;
  NSString *v24;
  objc_super v25;

  v5 = a3;
  v25.receiver = self;
  v25.super_class = (Class)MapsSuggestionsVisitTrackingLocationUpdater;
  v6 = -[MapsSuggestionsVisitTrackingLocationUpdater init](&v25, sel_init);
  if (v6)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    MSg::Queue::Queue(&v23, CFSTR("MapsSuggestionsVisitTrackingLocationUpdaterQueue"), v7);
    v8 = v23;
    v23 = 0;
    innerQueue = v6->_queue._innerQueue;
    v6->_queue._innerQueue = (OS_dispatch_queue *)v8;

    v10 = v24;
    v24 = 0;
    name = v6->_queue._name;
    v6->_queue._name = v10;

    objc_storeStrong((id *)&v6->_wrappedLocationUpdater, a3);
    currentVisit = v6->_currentVisit;
    v6->_currentVisit = 0;

    v13 = [MapsSuggestionsObservers alloc];
    v14 = v6->_queue._innerQueue;
    v15 = -[MapsSuggestionsObservers initWithCallbackQueue:name:](v13, "initWithCallbackQueue:name:", v14, CFSTR("MapsSuggestionsVisitTrackingLocationUpdaterLocationObservers"));
    locationObservers = v6->_locationObservers;
    v6->_locationObservers = (MapsSuggestionsObservers *)v15;

    v17 = [MapsSuggestionsObservers alloc];
    v18 = v6->_queue._innerQueue;
    v19 = -[MapsSuggestionsObservers initWithCallbackQueue:name:](v17, "initWithCallbackQueue:name:", v18, CFSTR("MapsSuggestionsVisitTrackingLocationUpdaterVisitObservers"));
    visitObservers = v6->_visitObservers;
    v6->_visitObservers = (MapsSuggestionsObservers *)v19;

    GEOConfigGetDouble();
    v6->_distanceBuffer = v21;
  }

  return v6;
}

- (void)dealloc
{
  MapsSuggestionsObservers *locationObservers;
  MapsSuggestionsObservers *visitObservers;
  OS_dispatch_queue *innerQueue;
  NSString *name;
  objc_super v7;

  locationObservers = self->_locationObservers;
  self->_locationObservers = 0;

  visitObservers = self->_visitObservers;
  self->_visitObservers = 0;

  innerQueue = self->_queue._innerQueue;
  self->_queue._innerQueue = 0;

  name = self->_queue._name;
  self->_queue._name = 0;

  v7.receiver = self;
  v7.super_class = (Class)MapsSuggestionsVisitTrackingLocationUpdater;
  -[MapsSuggestionsVisitTrackingLocationUpdater dealloc](&v7, sel_dealloc);
}

- (NSString)uniqueName
{
  return (NSString *)objc_msgSend((id)objc_opt_class(), "description");
}

- (id)restartLocationUpdatesForDelegate:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[MapsSuggestionsVisitTrackingLocationUpdater stopLocationUpdatesForDelegate:](self, "stopLocationUpdatesForDelegate:", v4);
  -[MapsSuggestionsVisitTrackingLocationUpdater startLocationUpdatesForDelegate:](self, "startLocationUpdatesForDelegate:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)startLocationUpdatesForDelegate:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  _QWORD *v8;
  NSObject *innerQueue;
  _QWORD *v10;
  id v11;
  NSObject *v12;
  _QWORD v14[5];
  id v15;
  id v16;
  id location;
  _QWORD block[4];
  id v19;
  _BYTE *v20;
  _BYTE buf[40];
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    GEOFindOrCreateLog();
    v5 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v4, "uniqueName");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v6;
      _os_log_impl(&dword_1A427D000, v5, OS_LOG_TYPE_DEBUG, "VisitTrackingLocationUpdater startLocationUpdatesForDelegate:%@", buf, 0xCu);

    }
    objc_initWeak(&location, self);
    v7 = MEMORY[0x1E0C809B0];
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __79__MapsSuggestionsVisitTrackingLocationUpdater_startLocationUpdatesForDelegate___block_invoke;
    v14[3] = &unk_1E4BD0C98;
    v14[4] = self;
    v15 = v4;
    objc_copyWeak(&v16, &location);
    v8 = v14;
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    *(_QWORD *)&buf[24] = __Block_byref_object_copy__17;
    *(_QWORD *)&buf[32] = __Block_byref_object_dispose__17;
    v22 = 0;
    innerQueue = self->_queue._innerQueue;
    block[0] = v7;
    block[1] = 3221225472;
    block[2] = ___ZNK3MSg5Queue4syncIU8__strongP10CLLocationEET_U13block_pointerFS5_vE_block_invoke;
    block[3] = &unk_1E4BCDE48;
    v19 = v8;
    v20 = buf;
    v10 = v8;
    dispatch_sync(innerQueue, block);
    v11 = *(id *)(*(_QWORD *)&buf[8] + 40);

    _Block_object_dispose(buf, 8);
    objc_destroyWeak(&v16);

    objc_destroyWeak(&location);
  }
  else
  {
    GEOFindOrCreateLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      *(_QWORD *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsVisitTrackingLocationUpdater.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 107;
      *(_WORD *)&buf[18] = 2082;
      *(_QWORD *)&buf[20] = "-[MapsSuggestionsVisitTrackingLocationUpdater startLocationUpdatesForDelegate:]";
      *(_WORD *)&buf[28] = 2082;
      *(_QWORD *)&buf[30] = "nil == (delegate)";
      _os_log_impl(&dword_1A427D000, v12, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a delegate", buf, 0x26u);
    }

    v11 = 0;
  }

  return v11;
}

id __79__MapsSuggestionsVisitTrackingLocationUpdater_startLocationUpdatesForDelegate___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;
  _QWORD v6[4];
  id v7;

  v2 = *(_QWORD *)(a1 + 40);
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __79__MapsSuggestionsVisitTrackingLocationUpdater_startLocationUpdatesForDelegate___block_invoke_2;
  v6[3] = &unk_1E4BCE1D8;
  objc_copyWeak(&v7, (id *)(a1 + 48));
  objc_msgSend(v3, "registerObserver:handler:", v2, v6);
  if (objc_msgSend(*(id *)(a1 + 40), "conformsToProtocol:", &unk_1EE7206D8))
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "registerObserver:handler:", *(_QWORD *)(a1 + 40), 0);
  v4 = *(id *)(*(_QWORD *)(a1 + 32) + 32);
  objc_destroyWeak(&v7);
  return v4;
}

void __79__MapsSuggestionsVisitTrackingLocationUpdater_startLocationUpdatesForDelegate___block_invoke_2(uint64_t a1, int a2)
{
  id WeakRetained;
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  int v8;
  char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    if (a2)
    {
      objc_msgSend(*((id *)WeakRetained + 3), "startLocationUpdatesForDelegate:", WeakRetained);
      v5 = objc_claimAutoreleasedReturnValue();
      v6 = (void *)v4[4];
      v4[4] = v5;

    }
  }
  else
  {
    GEOFindOrCreateLog();
    v7 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = 136446722;
      v9 = "MapsSuggestionsVisitTrackingLocationUpdater.mm";
      v10 = 1026;
      v11 = 115;
      v12 = 2082;
      v13 = "-[MapsSuggestionsVisitTrackingLocationUpdater startLocationUpdatesForDelegate:]_block_invoke_2";
      _os_log_impl(&dword_1A427D000, v7, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v8, 0x1Cu);
    }

  }
}

- (void)stopLocationUpdatesForDelegate:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSObject *innerQueue;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  uint8_t buf[4];
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  GEOFindOrCreateLog();
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v4, "uniqueName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v13 = v6;
    _os_log_impl(&dword_1A427D000, v5, OS_LOG_TYPE_DEBUG, "VisitTrackingLocationUpdater stopLocationUpdatesForDelegate:%@", buf, 0xCu);

  }
  objc_initWeak((id *)buf, self);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __78__MapsSuggestionsVisitTrackingLocationUpdater_stopLocationUpdatesForDelegate___block_invoke;
  v9[3] = &unk_1E4BCE618;
  objc_copyWeak(&v11, (id *)buf);
  v10 = v4;
  innerQueue = self->_queue._innerQueue;
  v8 = v4;
  dispatch_async(innerQueue, v9);

  objc_destroyWeak(&v11);
  objc_destroyWeak((id *)buf);
}

void __78__MapsSuggestionsVisitTrackingLocationUpdater_stopLocationUpdatesForDelegate___block_invoke(uint64_t a1)
{
  id *v2;
  id *WeakRetained;
  id *v4;
  id v5;
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
    v5 = WeakRetained[6];
    v6 = *(_QWORD *)(a1 + 32);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __78__MapsSuggestionsVisitTrackingLocationUpdater_stopLocationUpdatesForDelegate___block_invoke_66;
    v8[3] = &unk_1E4BCE1D8;
    objc_copyWeak(&v9, v2);
    objc_msgSend(v5, "unregisterObserver:handler:", v6, v8);
    if (objc_msgSend(*(id *)(a1 + 32), "conformsToProtocol:", &unk_1EE7206D8))
      objc_msgSend(v4[7], "unregisterObserver:handler:", *(_QWORD *)(a1 + 32), 0);
    objc_destroyWeak(&v9);
  }
  else
  {
    GEOFindOrCreateLog();
    v7 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v11 = "MapsSuggestionsVisitTrackingLocationUpdater.mm";
      v12 = 1026;
      v13 = 135;
      v14 = 2082;
      v15 = "-[MapsSuggestionsVisitTrackingLocationUpdater stopLocationUpdatesForDelegate:]_block_invoke";
      _os_log_impl(&dword_1A427D000, v7, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
    }

  }
}

void __78__MapsSuggestionsVisitTrackingLocationUpdater_stopLocationUpdatesForDelegate___block_invoke_66(uint64_t a1, int a2)
{
  id *WeakRetained;
  id *v4;
  NSObject *v5;
  int v6;
  char *v7;
  __int16 v8;
  int v9;
  __int16 v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    if (a2)
      objc_msgSend(WeakRetained[3], "stopLocationUpdatesForDelegate:", WeakRetained);
  }
  else
  {
    GEOFindOrCreateLog();
    v5 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = 136446722;
      v7 = "MapsSuggestionsVisitTrackingLocationUpdater.mm";
      v8 = 1026;
      v9 = 137;
      v10 = 2082;
      v11 = "-[MapsSuggestionsVisitTrackingLocationUpdater stopLocationUpdatesForDelegate:]_block_invoke";
      _os_log_impl(&dword_1A427D000, v5, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf2 went away in %{public}s", (uint8_t *)&v6, 0x1Cu);
    }

  }
}

- (void)didUpdateLocation:(id)a3
{
  id v4;
  NSObject *innerQueue;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65__MapsSuggestionsVisitTrackingLocationUpdater_didUpdateLocation___block_invoke;
  block[3] = &unk_1E4BCE618;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  innerQueue = self->_queue._innerQueue;
  v6 = v4;
  dispatch_async(innerQueue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __65__MapsSuggestionsVisitTrackingLocationUpdater_didUpdateLocation___block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  char *v8;
  uint64_t v9;
  NSObject *v10;
  _QWORD v11[4];
  NSObject *v12;
  uint8_t buf[4];
  char *v14;
  __int16 v15;
  _WORD v16[17];

  *(_QWORD *)&v16[13] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = objc_msgSend(*(id *)(a1 + 32), "copy");
    v4 = (void *)WeakRetained[4];
    WeakRetained[4] = v3;

    v5 = (void *)WeakRetained[6];
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __65__MapsSuggestionsVisitTrackingLocationUpdater_didUpdateLocation___block_invoke_68;
    v11[3] = &unk_1E4BD0440;
    v12 = *(id *)(a1 + 32);
    objc_msgSend(v5, "callBlock:", v11);
    v6 = WeakRetained[5];
    if (v6
      && +[MapsSuggestionsVisitTrackingLocationUpdater _isDefinitelyOutsideOfVisit:location:allowingBuffer:](MapsSuggestionsVisitTrackingLocationUpdater, "_isDefinitelyOutsideOfVisit:location:allowingBuffer:", v6, *(_QWORD *)(a1 + 32), *((double *)WeakRetained + 8)))
    {
      GEOFindOrCreateLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        v8 = (char *)WeakRetained[5];
        v9 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138412546;
        v14 = v8;
        v15 = 2112;
        *(_QWORD *)v16 = v9;
        _os_log_impl(&dword_1A427D000, v7, OS_LOG_TYPE_INFO, "DETECTED EXIT (visit=%@ location=%@)", buf, 0x16u);
      }

      objc_msgSend(WeakRetained, "didLeaveVisit:", WeakRetained[5]);
    }
    v10 = v12;
  }
  else
  {
    GEOFindOrCreateLog();
    v10 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v14 = "MapsSuggestionsVisitTrackingLocationUpdater.mm";
      v15 = 1026;
      *(_DWORD *)v16 = 155;
      v16[2] = 2082;
      *(_QWORD *)&v16[3] = "-[MapsSuggestionsVisitTrackingLocationUpdater didUpdateLocation:]_block_invoke";
      _os_log_impl(&dword_1A427D000, v10, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
    }

  }
}

void __65__MapsSuggestionsVisitTrackingLocationUpdater_didUpdateLocation___block_invoke_68(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  int v7;
  void *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (MapsSuggestionsLoggingIsVerbose_s_onceToken != -1)
    dispatch_once(&MapsSuggestionsLoggingIsVerbose_s_onceToken, &__block_literal_global_29);
  if (s_verbose)
  {
    GEOFindOrCreateLog();
    v4 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v3, "uniqueName");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = *(_QWORD *)(a1 + 32);
      v7 = 138412546;
      v8 = v5;
      v9 = 2112;
      v10 = v6;
      _os_log_impl(&dword_1A427D000, v4, OS_LOG_TYPE_DEBUG, "CALLING{%@} didUpdateLocation:%@", (uint8_t *)&v7, 0x16u);

    }
  }
  objc_msgSend(v3, "didUpdateLocation:", *(_QWORD *)(a1 + 32));

}

- (void)didLoseLocationPermission
{
  _QWORD v3[4];
  id v4;
  id location;

  objc_initWeak(&location, self);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __72__MapsSuggestionsVisitTrackingLocationUpdater_didLoseLocationPermission__block_invoke;
  v3[3] = &unk_1E4BCDDF8;
  objc_copyWeak(&v4, &location);
  dispatch_async((dispatch_queue_t)self->_queue._innerQueue, v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __72__MapsSuggestionsVisitTrackingLocationUpdater_didLoseLocationPermission__block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  void *v3;
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
  if (WeakRetained)
  {
    GEOFindOrCreateLog();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v5) = 0;
      _os_log_impl(&dword_1A427D000, v2, OS_LOG_TYPE_DEBUG, "Wiping latest location", (uint8_t *)&v5, 2u);
    }

    v3 = (void *)*((_QWORD *)WeakRetained + 4);
    *((_QWORD *)WeakRetained + 4) = 0;

    objc_msgSend(*((id *)WeakRetained + 7), "callBlock:", &__block_literal_global_27);
  }
  else
  {
    GEOFindOrCreateLog();
    v4 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = 136446722;
      v6 = "MapsSuggestionsVisitTrackingLocationUpdater.mm";
      v7 = 1026;
      v8 = 180;
      v9 = 2082;
      v10 = "-[MapsSuggestionsVisitTrackingLocationUpdater didLoseLocationPermission]_block_invoke";
      _os_log_impl(&dword_1A427D000, v4, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v5, 0x1Cu);
    }

  }
}

void __72__MapsSuggestionsVisitTrackingLocationUpdater_didLoseLocationPermission__block_invoke_71(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  GEOFindOrCreateLog();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v2, "uniqueName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138412290;
    v6 = v4;
    _os_log_impl(&dword_1A427D000, v3, OS_LOG_TYPE_DEBUG, "CALLING{%@} didLoseLocationPermission", (uint8_t *)&v5, 0xCu);

  }
  objc_msgSend(v2, "didLoseLocationPermission");

}

- (void)didEnterVisit:(id)a3
{
  id v4;
  NSObject *innerQueue;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61__MapsSuggestionsVisitTrackingLocationUpdater_didEnterVisit___block_invoke;
  block[3] = &unk_1E4BCE618;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  innerQueue = self->_queue._innerQueue;
  v6 = v4;
  dispatch_async(innerQueue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __61__MapsSuggestionsVisitTrackingLocationUpdater_didEnterVisit___block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  _QWORD *v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  NSObject *v9;
  uint8_t buf[4];
  char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    if (WeakRetained[5])
    {
      GEOFindOrCreateLog();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446978;
        v11 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsVisitTrackingLocationUpdater.mm";
        v12 = 1024;
        v13 = 197;
        v14 = 2082;
        v15 = "-[MapsSuggestionsVisitTrackingLocationUpdater didEnterVisit:]_block_invoke";
        v16 = 2082;
        v17 = "nil != strongSelf->_currentVisit";
        _os_log_impl(&dword_1A427D000, v4, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. We were already in a Visit! CoreRoutine says that is not possible!", buf, 0x26u);
      }
    }
    else
    {
      v5 = objc_msgSend(*(id *)(a1 + 32), "copy");
      v6 = (void *)v3[5];
      v3[5] = v5;

      v7 = (void *)v3[7];
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __61__MapsSuggestionsVisitTrackingLocationUpdater_didEnterVisit___block_invoke_74;
      v8[3] = &unk_1E4BD0D00;
      v9 = *(id *)(a1 + 32);
      objc_msgSend(v7, "callBlock:", v8);
      v4 = v9;
    }
  }
  else
  {
    GEOFindOrCreateLog();
    v4 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v11 = "MapsSuggestionsVisitTrackingLocationUpdater.mm";
      v12 = 1026;
      v13 = 196;
      v14 = 2082;
      v15 = "-[MapsSuggestionsVisitTrackingLocationUpdater didEnterVisit:]_block_invoke";
      _os_log_impl(&dword_1A427D000, v4, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
    }

  }
}

void __61__MapsSuggestionsVisitTrackingLocationUpdater_didEnterVisit___block_invoke_74(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  int v7;
  void *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  GEOFindOrCreateLog();
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v3, "uniqueName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 32);
    v7 = 138412546;
    v8 = v5;
    v9 = 2112;
    v10 = v6;
    _os_log_impl(&dword_1A427D000, v4, OS_LOG_TYPE_DEBUG, "CALLING{%@} didEnterVisit:%@", (uint8_t *)&v7, 0x16u);

  }
  objc_msgSend(v3, "didEnterVisit:", *(_QWORD *)(a1 + 32));

}

- (void)didLeaveVisit:(id)a3
{
  id v4;
  NSObject *innerQueue;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61__MapsSuggestionsVisitTrackingLocationUpdater_didLeaveVisit___block_invoke;
  block[3] = &unk_1E4BCE618;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  innerQueue = self->_queue._innerQueue;
  v6 = v4;
  dispatch_async(innerQueue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __61__MapsSuggestionsVisitTrackingLocationUpdater_didLeaveVisit___block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  _QWORD *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  char *v7;
  _QWORD v8[4];
  NSObject *v9;
  uint8_t buf[4];
  char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = (void *)WeakRetained[5];
    if (v4)
    {
      WeakRetained[5] = 0;

      v5 = (void *)v3[7];
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __61__MapsSuggestionsVisitTrackingLocationUpdater_didLeaveVisit___block_invoke_75;
      v8[3] = &unk_1E4BD0D00;
      v9 = *(id *)(a1 + 32);
      objc_msgSend(v5, "callBlock:", v8);
      v6 = v9;
    }
    else
    {
      GEOFindOrCreateLog();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        v7 = *(char **)(a1 + 32);
        *(_DWORD *)buf = 138412290;
        v11 = v7;
        _os_log_impl(&dword_1A427D000, v6, OS_LOG_TYPE_INFO, "IGNORED LATE EXIT (visit=%@)", buf, 0xCu);
      }
    }
  }
  else
  {
    GEOFindOrCreateLog();
    v6 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v11 = "MapsSuggestionsVisitTrackingLocationUpdater.mm";
      v12 = 1026;
      v13 = 213;
      v14 = 2082;
      v15 = "-[MapsSuggestionsVisitTrackingLocationUpdater didLeaveVisit:]_block_invoke";
      _os_log_impl(&dword_1A427D000, v6, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
    }

  }
}

void __61__MapsSuggestionsVisitTrackingLocationUpdater_didLeaveVisit___block_invoke_75(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  int v7;
  void *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  GEOFindOrCreateLog();
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v3, "uniqueName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 32);
    v7 = 138412546;
    v8 = v5;
    v9 = 2112;
    v10 = v6;
    _os_log_impl(&dword_1A427D000, v4, OS_LOG_TYPE_DEBUG, "CALLING{%@} didLeaveVisit:%@", (uint8_t *)&v7, 0x16u);

  }
  objc_msgSend(v3, "didLeaveVisit:", *(_QWORD *)(a1 + 32));

}

+ (BOOL)_isDefinitelyOutsideOfVisit:(id)a3 location:(id)a4 allowingBuffer:(double)a5
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  BOOL v18;
  NSObject *v19;
  uint64_t v21;
  uint64_t v22;
  __int128 buf;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (!MapsSuggestionsIsValidVisit(v7))
  {
    GEOFindOrCreateLog();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v7;
      _os_log_impl(&dword_1A427D000, v19, OS_LOG_TYPE_ERROR, "Cannot use invalid visit: %@", (uint8_t *)&buf, 0xCu);
    }
    goto LABEL_9;
  }
  if (!MapsSuggestionsIsValidLocation(v8))
  {
    GEOFindOrCreateLog();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v8;
      _os_log_impl(&dword_1A427D000, v19, OS_LOG_TYPE_ERROR, "Cannot use invalid location: %@", (uint8_t *)&buf, 0xCu);
    }
LABEL_9:

    v18 = 0;
    goto LABEL_10;
  }
  objc_msgSend(v7, "coordinate");
  *(_QWORD *)&buf = v9;
  *((_QWORD *)&buf + 1) = v10;
  objc_msgSend(v8, "coordinate");
  v21 = v11;
  v22 = v12;
  CLLocationCoordinate2DGetDistanceFrom();
  v14 = v13;
  objc_msgSend(v8, "horizontalAccuracy", v21, v22);
  v16 = v15;
  objc_msgSend(v7, "horizontalAccuracy");
  v18 = v14 > v16 + v17 + a5;
LABEL_10:

  return v18;
}

- (void)awaitQueue
{
  dispatch_barrier_sync((dispatch_queue_t)self->_queue._innerQueue, &__block_literal_global_76);
}

void __57__MapsSuggestionsVisitTrackingLocationUpdater_awaitQueue__block_invoke()
{
  NSLog(CFSTR("_queue ran"));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visitObservers, 0);
  objc_storeStrong((id *)&self->_locationObservers, 0);
  objc_storeStrong((id *)&self->_currentVisit, 0);
  objc_storeStrong((id *)&self->_latestLocation, 0);
  objc_storeStrong((id *)&self->_wrappedLocationUpdater, 0);

}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = 0;
  return self;
}

@end
