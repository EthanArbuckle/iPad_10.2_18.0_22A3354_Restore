@implementation MKMapsSuggestionsPredictor

- (id)NSDataToMKMapsSuggestionsTransportModes:(id)a3 error:(id *)a4
{
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;

  v5 = (void *)MEMORY[0x1E0C99E60];
  v6 = a3;
  v7 = objc_opt_class();
  objc_msgSend(v5, "setWithObjects:", v7, objc_opt_class(), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClasses:fromData:error:", v8, v6, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)sharedPredictor
{
  if (_MergedGlobals_142 != -1)
    dispatch_once(&_MergedGlobals_142, &__block_literal_global_39);
  return (id)qword_1ECE2D9B8;
}

void __45__MKMapsSuggestionsPredictor_sharedPredictor__block_invoke()
{
  MKMapsSuggestionsPredictor *v0;
  void *v1;

  v0 = objc_alloc_init(MKMapsSuggestionsPredictor);
  v1 = (void *)qword_1ECE2D9B8;
  qword_1ECE2D9B8 = (uint64_t)v0;

}

- (MKMapsSuggestionsPredictor)init
{
  MKMapsSuggestionsPredictor *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *queue;
  OS_dispatch_source *closeTimer;
  NSXPCConnection *connection;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MKMapsSuggestionsPredictor;
  v2 = -[MKMapsSuggestionsPredictor init](&v9, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("MKMapsSuggestionsPredictorQueue", v3);
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

  -[MKMapsSuggestionsPredictor _unscheduleCloseConnection](self, "_unscheduleCloseConnection");
  -[MKMapsSuggestionsPredictor _closeConnection](self, "_closeConnection");
  queue = self->_queue;
  self->_queue = 0;

  v4.receiver = self;
  v4.super_class = (Class)MKMapsSuggestionsPredictor;
  -[MKMapsSuggestionsPredictor dealloc](&v4, sel_dealloc);
}

- (BOOL)transportModeForDestinationMapItemData:(id)a3 originCoordinateData:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *queue;
  BOOL v12;
  NSObject *v13;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  id v19;
  _BYTE location[12];
  __int16 v21;
  const char *v22;
  __int16 v23;
  const char *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!v10)
  {
    GEOFindOrCreateLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)location = 136446722;
      *(_QWORD *)&location[4] = "-[MKMapsSuggestionsPredictor transportModeForDestinationMapItemData:originCoordinateData:handler:]";
      v21 = 2082;
      v22 = "handler == nil";
      v23 = 2082;
      v24 = "Requires a handler";
LABEL_8:
      _os_log_impl(&dword_18B0B0000, v13, OS_LOG_TYPE_ERROR, "%{public}s forbids: %{public}s. %{public}s", location, 0x20u);
    }
LABEL_9:

    v12 = 0;
    goto LABEL_10;
  }
  if (!v8)
  {
    GEOFindOrCreateLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)location = 136446722;
      *(_QWORD *)&location[4] = "-[MKMapsSuggestionsPredictor transportModeForDestinationMapItemData:originCoordinateData:handler:]";
      v21 = 2082;
      v22 = "mapItemData == nil";
      v23 = 2082;
      v24 = "Requires a mapItem data object";
      goto LABEL_8;
    }
    goto LABEL_9;
  }
  objc_initWeak((id *)location, self);
  queue = self->_queue;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __98__MKMapsSuggestionsPredictor_transportModeForDestinationMapItemData_originCoordinateData_handler___block_invoke;
  v15[3] = &unk_1E20DA6F8;
  objc_copyWeak(&v19, (id *)location);
  v16 = v8;
  v17 = v9;
  v18 = v10;
  dispatch_async(queue, v15);

  objc_destroyWeak(&v19);
  objc_destroyWeak((id *)location);
  v12 = 1;
LABEL_10:

  return v12;
}

void __98__MKMapsSuggestionsPredictor_transportModeForDestinationMapItemData_originCoordinateData_handler___block_invoke(uint64_t a1)
{
  id *v2;
  id *WeakRetained;
  id *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v2 = (id *)(a1 + 56);
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "_openConnectionIfNecessary");
    objc_msgSend(v4[2], "remoteObjectProxy");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(_QWORD *)(a1 + 40);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __98__MKMapsSuggestionsPredictor_transportModeForDestinationMapItemData_originCoordinateData_handler___block_invoke_15;
    v9[3] = &unk_1E20DA6D0;
    objc_copyWeak(&v12, v2);
    v11 = *(id *)(a1 + 48);
    v10 = *(id *)(a1 + 32);
    objc_msgSend(v5, "predictedTransportModeForDestinationMapItemData:originCoordinateData:handler:", v6, v7, v9);

    objc_msgSend(v4, "_scheduleCloseConnection");
    objc_destroyWeak(&v12);
  }
  else
  {
    GEOFindOrCreateLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v14 = "-[MKMapsSuggestionsPredictor transportModeForDestinationMapItemData:originCoordinateData:handler:]_block_invoke";
      v15 = 1024;
      v16 = 196;
      _os_log_impl(&dword_18B0B0000, v8, OS_LOG_TYPE_ERROR, "strongSelf went away in %s line %d", buf, 0x12u);
    }

  }
}

void __98__MKMapsSuggestionsPredictor_transportModeForDestinationMapItemData_originCoordinateData_handler___block_invoke_15(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id WeakRetained;
  void *v11;
  void *v12;
  NSObject *v13;
  void (*v14)(void);
  void *v15;
  char v16;
  void *v17;
  id v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  int v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v11 = WeakRetained;
  if (WeakRetained)
  {
    v18 = 0;
    objc_msgSend(WeakRetained, "NSDataToMKMapsSuggestionsTransportModes:error:", v7, &v18);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v18;
    if (v13)
    {
      v14 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
    }
    else
    {
      objc_msgSend(v11, "signalPackCacheInterface");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_opt_respondsToSelector();

      if ((v16 & 1) != 0)
      {
        objc_msgSend(v11, "signalPackCacheInterface");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "storeSignalPackData:forMapItemData:", v8, *(_QWORD *)(a1 + 32));

      }
      v14 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
    }
    v14();

  }
  else
  {
    GEOFindOrCreateLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v20 = "-[MKMapsSuggestionsPredictor transportModeForDestinationMapItemData:originCoordinateData:handler:]_block_invoke";
      v21 = 1024;
      v22 = 200;
      _os_log_impl(&dword_18B0B0000, v13, OS_LOG_TYPE_ERROR, "strongSelf2 went away in %s line %d", buf, 0x12u);
    }
  }

}

- (BOOL)transportModeForDestinationEntryData:(id)a3 originCoordinateData:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NSObject *queue;
  BOOL v13;
  NSObject *v14;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  id v20;
  _BYTE location[12];
  __int16 v22;
  const char *v23;
  __int16 v24;
  const char *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v10;
  if (!v8)
  {
    GEOFindOrCreateLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      goto LABEL_12;
    *(_DWORD *)location = 136446722;
    *(_QWORD *)&location[4] = "-[MKMapsSuggestionsPredictor transportModeForDestinationEntryData:originCoordinateData:handler:]";
    v22 = 2082;
    v23 = "entryData == nil";
    v24 = 2082;
    v25 = "Requires MSg Entry NSData";
LABEL_11:
    _os_log_impl(&dword_18B0B0000, v14, OS_LOG_TYPE_ERROR, "%{public}s forbids: %{public}s. %{public}s", location, 0x20u);
    goto LABEL_12;
  }
  if (!v9)
  {
    GEOFindOrCreateLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      goto LABEL_12;
    *(_DWORD *)location = 136446722;
    *(_QWORD *)&location[4] = "-[MKMapsSuggestionsPredictor transportModeForDestinationEntryData:originCoordinateData:handler:]";
    v22 = 2082;
    v23 = "coordinateData == nil";
    v24 = 2082;
    v25 = "Requires coordinates NSData";
    goto LABEL_11;
  }
  if (!v10)
  {
    GEOFindOrCreateLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)location = 136446722;
      *(_QWORD *)&location[4] = "-[MKMapsSuggestionsPredictor transportModeForDestinationEntryData:originCoordinateData:handler:]";
      v22 = 2082;
      v23 = "handler == nil";
      v24 = 2082;
      v25 = "Handler cannot be nil";
      goto LABEL_11;
    }
LABEL_12:

    v13 = 0;
    goto LABEL_13;
  }
  objc_initWeak((id *)location, self);
  queue = self->_queue;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __96__MKMapsSuggestionsPredictor_transportModeForDestinationEntryData_originCoordinateData_handler___block_invoke;
  v16[3] = &unk_1E20DA6F8;
  objc_copyWeak(&v20, (id *)location);
  v17 = v8;
  v18 = v9;
  v19 = v11;
  dispatch_async(queue, v16);

  objc_destroyWeak(&v20);
  objc_destroyWeak((id *)location);
  v13 = 1;
LABEL_13:

  return v13;
}

void __96__MKMapsSuggestionsPredictor_transportModeForDestinationEntryData_originCoordinateData_handler___block_invoke(uint64_t a1)
{
  id *v2;
  id *WeakRetained;
  id *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v2 = (id *)(a1 + 56);
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "_openConnectionIfNecessary");
    objc_msgSend(v4[2], "remoteObjectProxy");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(_QWORD *)(a1 + 40);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __96__MKMapsSuggestionsPredictor_transportModeForDestinationEntryData_originCoordinateData_handler___block_invoke_23;
    v9[3] = &unk_1E20DA6D0;
    objc_copyWeak(&v12, v2);
    v11 = *(id *)(a1 + 48);
    v10 = *(id *)(a1 + 32);
    objc_msgSend(v5, "predictedTransportModeForDestinationEntryData:originCoordinateData:handler:", v6, v7, v9);

    objc_msgSend(v4, "_scheduleCloseConnection");
    objc_destroyWeak(&v12);
  }
  else
  {
    GEOFindOrCreateLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v14 = "-[MKMapsSuggestionsPredictor transportModeForDestinationEntryData:originCoordinateData:handler:]_block_invoke";
      v15 = 1024;
      v16 = 234;
      _os_log_impl(&dword_18B0B0000, v8, OS_LOG_TYPE_ERROR, "strongSelf went away in %s line %d", buf, 0x12u);
    }

  }
}

void __96__MKMapsSuggestionsPredictor_transportModeForDestinationEntryData_originCoordinateData_handler___block_invoke_23(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id WeakRetained;
  void *v11;
  void *v12;
  NSObject *v13;
  void (*v14)(void);
  void *v15;
  char v16;
  void *v17;
  id v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  int v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v11 = WeakRetained;
  if (WeakRetained)
  {
    v18 = 0;
    objc_msgSend(WeakRetained, "NSDataToMKMapsSuggestionsTransportModes:error:", v7, &v18);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v18;
    if (v13)
    {
      v14 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
    }
    else
    {
      objc_msgSend(v11, "signalPackCacheInterface");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_opt_respondsToSelector();

      if ((v16 & 1) != 0)
      {
        objc_msgSend(v11, "signalPackCacheInterface");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "storeSignalPackData:forEntryData:", v8, *(_QWORD *)(a1 + 32));

      }
      v14 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
    }
    v14();

  }
  else
  {
    GEOFindOrCreateLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v20 = "-[MKMapsSuggestionsPredictor transportModeForDestinationEntryData:originCoordinateData:handler:]_block_invoke";
      v21 = 1024;
      v22 = 238;
      _os_log_impl(&dword_18B0B0000, v13, OS_LOG_TYPE_ERROR, "strongSelf2 went away in %s line %d", buf, 0x12u);
    }
  }

}

- (BOOL)_openConnectionIfNecessary
{
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
  void *v14;
  uint64_t v15;
  id v16;
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  id v21;
  _QWORD v22[4];
  id v23;
  id location;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!self->_connection)
  {
    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE0798C0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setClasses:forSelector:argumentIndex:ofReply:", v4, sel_predictedTransportModeForDestinationEntryData_originCoordinateData_handler_, 0, 1);

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setClasses:forSelector:argumentIndex:ofReply:", v5, sel_predictedTransportModeForDestinationEntryData_originCoordinateData_handler_, 1, 1);

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_predictedTransportModeForDestinationEntryData_originCoordinateData_handler_, 2, 1);

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setClasses:forSelector:argumentIndex:ofReply:", v7, sel_predictedTransportModeForDestinationEntryData_originCoordinateData_handler_, 0, 0);

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setClasses:forSelector:argumentIndex:ofReply:", v8, sel_predictedTransportModeForDestinationEntryData_originCoordinateData_handler_, 1, 0);

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setClasses:forSelector:argumentIndex:ofReply:", v9, sel_predictedTransportModeForDestinationMapItemData_originCoordinateData_handler_, 0, 1);

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setClasses:forSelector:argumentIndex:ofReply:", v10, sel_predictedTransportModeForDestinationMapItemData_originCoordinateData_handler_, 1, 1);

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setClasses:forSelector:argumentIndex:ofReply:", v11, sel_predictedTransportModeForDestinationMapItemData_originCoordinateData_handler_, 2, 1);

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setClasses:forSelector:argumentIndex:ofReply:", v12, sel_predictedTransportModeForDestinationMapItemData_originCoordinateData_handler_, 0, 0);

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setClasses:forSelector:argumentIndex:ofReply:", v13, sel_predictedTransportModeForDestinationMapItemData_originCoordinateData_handler_, 1, 0);

    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.maps.destinationd.predictions"), 0);
    objc_msgSend(v14, "setRemoteObjectInterface:", v3);
    objc_initWeak(&location, self);
    v15 = MEMORY[0x1E0C809B0];
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __56__MKMapsSuggestionsPredictor__openConnectionIfNecessary__block_invoke;
    v22[3] = &unk_1E20D8A58;
    objc_copyWeak(&v23, &location);
    objc_msgSend(v14, "setInvalidationHandler:", v22);
    v20[0] = v15;
    v20[1] = 3221225472;
    v20[2] = __56__MKMapsSuggestionsPredictor__openConnectionIfNecessary__block_invoke_29;
    v20[3] = &unk_1E20D8A58;
    objc_copyWeak(&v21, &location);
    objc_msgSend(v14, "setInterruptionHandler:", v20);
    v18[0] = v15;
    v18[1] = 3221225472;
    v18[2] = __56__MKMapsSuggestionsPredictor__openConnectionIfNecessary__block_invoke_31;
    v18[3] = &unk_1E20D8D18;
    objc_copyWeak(&v19, &location);
    v16 = (id)objc_msgSend(v14, "remoteObjectProxyWithErrorHandler:", v18);
    objc_storeStrong((id *)&self->_connection, v14);
    objc_msgSend(v14, "resume");
    objc_destroyWeak(&v19);
    objc_destroyWeak(&v21);
    objc_destroyWeak(&v23);
    objc_destroyWeak(&location);

  }
  return 1;
}

void __56__MKMapsSuggestionsPredictor__openConnectionIfNecessary__block_invoke(uint64_t a1)
{
  id *v1;
  NSObject **WeakRetained;
  NSObject **v3;
  NSObject *v4;
  NSObject *v5;
  _QWORD block[4];
  id v7;
  uint8_t buf[4];
  const char *v9;
  __int16 v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v1 = (id *)(a1 + 32);
  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 32));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = WeakRetained[1];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __56__MKMapsSuggestionsPredictor__openConnectionIfNecessary__block_invoke_28;
    block[3] = &unk_1E20D8A58;
    objc_copyWeak(&v7, v1);
    dispatch_async(v4, block);
    objc_destroyWeak(&v7);
  }
  else
  {
    GEOFindOrCreateLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v9 = "-[MKMapsSuggestionsPredictor _openConnectionIfNecessary]_block_invoke";
      v10 = 1024;
      v11 = 280;
      _os_log_impl(&dword_18B0B0000, v5, OS_LOG_TYPE_ERROR, "strongSelf went away in %s line %d", buf, 0x12u);
    }

  }
}

void __56__MKMapsSuggestionsPredictor__openConnectionIfNecessary__block_invoke_28(uint64_t a1)
{
  _QWORD *WeakRetained;
  NSObject *v2;
  NSObject *v3;
  const char *v4;
  void *v5;
  int v6;
  const char *v7;
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  GEOFindOrCreateLog();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (WeakRetained)
  {
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      v4 = (const char *)WeakRetained[2];
      v6 = 138412290;
      v7 = v4;
      _os_log_impl(&dword_18B0B0000, v3, OS_LOG_TYPE_DEBUG, "XPC connection {%@} became invalid", (uint8_t *)&v6, 0xCu);
    }

    v5 = (void *)WeakRetained[2];
    WeakRetained[2] = 0;

    objc_msgSend(WeakRetained, "_unscheduleCloseConnection");
  }
  else
  {
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      v6 = 136315394;
      v7 = "-[MKMapsSuggestionsPredictor _openConnectionIfNecessary]_block_invoke";
      v8 = 1024;
      v9 = 282;
      _os_log_impl(&dword_18B0B0000, v3, OS_LOG_TYPE_ERROR, "innerStrongSelf went away in %s line %d", (uint8_t *)&v6, 0x12u);
    }

  }
}

void __56__MKMapsSuggestionsPredictor__openConnectionIfNecessary__block_invoke_29(uint64_t a1)
{
  id *v1;
  NSObject **WeakRetained;
  NSObject **v3;
  NSObject *v4;
  NSObject *v5;
  _QWORD block[4];
  id v7;
  uint8_t buf[4];
  const char *v9;
  __int16 v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v1 = (id *)(a1 + 32);
  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 32));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = WeakRetained[1];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __56__MKMapsSuggestionsPredictor__openConnectionIfNecessary__block_invoke_30;
    block[3] = &unk_1E20D8A58;
    objc_copyWeak(&v7, v1);
    dispatch_async(v4, block);
    objc_destroyWeak(&v7);
  }
  else
  {
    GEOFindOrCreateLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v9 = "-[MKMapsSuggestionsPredictor _openConnectionIfNecessary]_block_invoke";
      v10 = 1024;
      v11 = 290;
      _os_log_impl(&dword_18B0B0000, v5, OS_LOG_TYPE_ERROR, "strongSelf went away in %s line %d", buf, 0x12u);
    }

  }
}

void __56__MKMapsSuggestionsPredictor__openConnectionIfNecessary__block_invoke_30(uint64_t a1)
{
  _QWORD *WeakRetained;
  NSObject *v2;
  NSObject *v3;
  const char *v4;
  int v5;
  const char *v6;
  __int16 v7;
  int v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  GEOFindOrCreateLog();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (WeakRetained)
  {
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      v4 = (const char *)WeakRetained[2];
      v5 = 138412290;
      v6 = v4;
      _os_log_impl(&dword_18B0B0000, v3, OS_LOG_TYPE_DEBUG, "XPC connection {%@} got interrupted", (uint8_t *)&v5, 0xCu);
    }

    objc_msgSend(WeakRetained, "_closeConnection");
  }
  else
  {
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      v5 = 136315394;
      v6 = "-[MKMapsSuggestionsPredictor _openConnectionIfNecessary]_block_invoke";
      v7 = 1024;
      v8 = 292;
      _os_log_impl(&dword_18B0B0000, v3, OS_LOG_TYPE_ERROR, "innerStrongSelf went away in %s line %d", (uint8_t *)&v5, 0x12u);
    }

  }
}

void __56__MKMapsSuggestionsPredictor__openConnectionIfNecessary__block_invoke_31(uint64_t a1, void *a2)
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
  const char *v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (id *)(a1 + 32);
  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 32));
  v6 = WeakRetained;
  if (WeakRetained)
  {
    v7 = WeakRetained[1];
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __56__MKMapsSuggestionsPredictor__openConnectionIfNecessary__block_invoke_32;
    v9[3] = &unk_1E20D8970;
    objc_copyWeak(&v11, v4);
    v10 = v3;
    dispatch_async(v7, v9);

    objc_destroyWeak(&v11);
  }
  else
  {
    GEOFindOrCreateLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v13 = "-[MKMapsSuggestionsPredictor _openConnectionIfNecessary]_block_invoke";
      v14 = 1024;
      v15 = 299;
      _os_log_impl(&dword_18B0B0000, v8, OS_LOG_TYPE_ERROR, "strongSelf went away in %s line %d", buf, 0x12u);
    }

  }
}

void __56__MKMapsSuggestionsPredictor__openConnectionIfNecessary__block_invoke_32(uint64_t a1)
{
  _QWORD *WeakRetained;
  NSObject *v3;
  NSObject *v4;
  const char *v5;
  uint64_t v6;
  int v7;
  const char *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  GEOFindOrCreateLog();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (WeakRetained)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      v5 = (const char *)WeakRetained[2];
      v6 = *(_QWORD *)(a1 + 32);
      v7 = 138412546;
      v8 = v5;
      v9 = 2112;
      v10 = v6;
      _os_log_impl(&dword_18B0B0000, v4, OS_LOG_TYPE_DEBUG, "XPC connection {%@} got error: %@", (uint8_t *)&v7, 0x16u);
    }

    objc_msgSend(WeakRetained, "_closeConnection");
  }
  else
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v7 = 136315394;
      v8 = "-[MKMapsSuggestionsPredictor _openConnectionIfNecessary]_block_invoke";
      v9 = 1024;
      LODWORD(v10) = 301;
      _os_log_impl(&dword_18B0B0000, v4, OS_LOG_TYPE_ERROR, "innerStrongSelf went away in %s line %d", (uint8_t *)&v7, 0x12u);
    }

  }
}

- (void)_closeConnection
{
  NSXPCConnection *connection;
  NSXPCConnection *v4;

  connection = self->_connection;
  if (connection)
  {
    self->_connection = 0;
    v4 = connection;

    -[NSXPCConnection setInterruptionHandler:](v4, "setInterruptionHandler:", 0);
    -[NSXPCConnection setInvalidationHandler:](v4, "setInvalidationHandler:", 0);
    -[NSXPCConnection invalidate](v4, "invalidate");

  }
  -[MKMapsSuggestionsPredictor _unscheduleCloseConnection](self, "_unscheduleCloseConnection");
}

- (void)_initCloseTimerIfNecessary
{
  NSObject *v3;
  OS_dispatch_source *v4;
  OS_dispatch_source *closeTimer;
  NSObject *v6;
  _QWORD handler[4];
  id v8;
  id buf[2];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!self->_closeTimer)
  {
    GEOFindOrCreateLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_18B0B0000, v3, OS_LOG_TYPE_DEBUG, "Re-initializing the _closeTimer", (uint8_t *)buf, 2u);
    }

    objc_initWeak(buf, self);
    v4 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, (dispatch_queue_t)self->_queue);
    closeTimer = self->_closeTimer;
    self->_closeTimer = v4;

    dispatch_source_set_timer((dispatch_source_t)self->_closeTimer, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0);
    v6 = self->_closeTimer;
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __56__MKMapsSuggestionsPredictor__initCloseTimerIfNecessary__block_invoke;
    handler[3] = &unk_1E20D8A58;
    objc_copyWeak(&v8, buf);
    dispatch_source_set_event_handler(v6, handler);
    dispatch_resume((dispatch_object_t)self->_closeTimer);
    objc_destroyWeak(&v8);
    objc_destroyWeak(buf);
  }
}

void __56__MKMapsSuggestionsPredictor__initCloseTimerIfNecessary__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "_closeConnection");
  }
  else
  {
    GEOFindOrCreateLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v4 = 136315394;
      v5 = "-[MKMapsSuggestionsPredictor _initCloseTimerIfNecessary]_block_invoke";
      v6 = 1024;
      v7 = 348;
      _os_log_impl(&dword_18B0B0000, v3, OS_LOG_TYPE_ERROR, "strongSelf went away in %s line %d", (uint8_t *)&v4, 0x12u);
    }

  }
}

- (void)_scheduleCloseConnection
{
  NSObject *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  NSObject *closeTimer;
  dispatch_time_t v9;
  uint8_t v10[16];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  GEOFindOrCreateLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_18B0B0000, v3, OS_LOG_TYPE_DEBUG, "_scheduleCloseConnection", v10, 2u);
  }

  -[MKMapsSuggestionsPredictor _initCloseTimerIfNecessary](self, "_initCloseTimerIfNecessary");
  GEOConfigGetDouble();
  v5 = v4;
  GEOConfigGetDouble();
  v7 = v6;
  closeTimer = self->_closeTimer;
  v9 = dispatch_time(0, (uint64_t)(v5 * 1000000000.0));
  dispatch_source_set_timer(closeTimer, v9, 0xFFFFFFFFFFFFFFFFLL, (unint64_t)(v7 * 1000000000.0));
}

- (void)_unscheduleCloseConnection
{
  NSObject *v3;
  NSObject *closeTimer;
  OS_dispatch_source *v5;
  uint8_t v6[16];

  GEOFindOrCreateLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_18B0B0000, v3, OS_LOG_TYPE_DEBUG, "_unscheduleCloseConnection", v6, 2u);
  }

  closeTimer = self->_closeTimer;
  if (closeTimer)
  {
    dispatch_source_set_timer(closeTimer, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0);
    dispatch_source_cancel((dispatch_source_t)self->_closeTimer);
    v5 = self->_closeTimer;
    self->_closeTimer = 0;

  }
}

- (MKMapsSuggestionsSignalPackCacheInterface)signalPackCacheInterface
{
  return self->_signalPackCacheInterface;
}

- (void)setSignalPackCacheInterface:(id)a3
{
  objc_storeStrong((id *)&self->_signalPackCacheInterface, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signalPackCacheInterface, 0);
  objc_storeStrong((id *)&self->_closeTimer, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
