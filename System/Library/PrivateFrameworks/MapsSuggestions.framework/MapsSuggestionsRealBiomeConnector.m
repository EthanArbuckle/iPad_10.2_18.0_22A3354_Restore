@implementation MapsSuggestionsRealBiomeConnector

- (MapsSuggestionsRealBiomeConnector)init
{
  MapsSuggestionsRealBiomeConnector *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *queue;
  double v6;
  uint64_t v7;
  BMBiomeScheduler *smartRepliesScheduler;
  uint64_t v9;
  BMBiomeScheduler *findMyScheduler;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)MapsSuggestionsRealBiomeConnector;
  v2 = -[MapsSuggestionsRealBiomeConnector init](&v12, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("MapsSuggestionsRealBiomeConnector", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    GEOConfigGetDouble();
    v2->_lookbackDuration = v6;
    v2->_maxEvents = GEOConfigGetInteger();
    v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0D025E0]), "initWithIdentifier:targetQueue:", CFSTR("com.apple.maps.destinationd_smartReplies"), v2->_queue);
    smartRepliesScheduler = v2->_smartRepliesScheduler;
    v2->_smartRepliesScheduler = (BMBiomeScheduler *)v7;

    v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0D025E0]), "initWithIdentifier:targetQueue:", CFSTR("com.apple.maps.destinationd_findMy"), v2->_queue);
    findMyScheduler = v2->_findMyScheduler;
    v2->_findMyScheduler = (BMBiomeScheduler *)v9;

  }
  return v2;
}

- (BOOL)getSmartRepliesStreamsWithHandler:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int64_t v9;
  NSObject *queue;
  id v11;
  _QWORD block[4];
  id v14;
  id v15;
  id v16;
  _BYTE *v17;
  int64_t v18;
  _BYTE buf[40];
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  GEOFindOrCreateLog();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A427D000, v6, OS_LOG_TYPE_DEBUG, "Querying Biome+SmartReplies for events", buf, 2u);
    }

    MapsSuggestionsNowWithOffset(-self->_lookbackDuration);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    MapsSuggestionsNow();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = self->_maxEvents & ~(self->_maxEvents >> 63);
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    *(_QWORD *)&buf[24] = __Block_byref_object_copy__11;
    *(_QWORD *)&buf[32] = __Block_byref_object_dispose__11;
    v20 = 0;
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __71__MapsSuggestionsRealBiomeConnector_getSmartRepliesStreamsWithHandler___block_invoke;
    block[3] = &unk_1E4BD0170;
    v14 = v7;
    v15 = v8;
    v17 = buf;
    v18 = v9;
    v16 = v4;
    v11 = v8;
    v6 = v7;
    dispatch_async(queue, block);

    _Block_object_dispose(buf, 8);
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136446978;
    *(_QWORD *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsRealBiomeConnector.m";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 69;
    *(_WORD *)&buf[18] = 2082;
    *(_QWORD *)&buf[20] = "-[MapsSuggestionsRealBiomeConnector getSmartRepliesStreamsWithHandler:]";
    *(_WORD *)&buf[28] = 2082;
    *(_QWORD *)&buf[30] = "nil == (handler)";
    _os_log_impl(&dword_1A427D000, v6, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Handler cannot be nil", buf, 0x26u);
  }

  return v4 != 0;
}

void __71__MapsSuggestionsRealBiomeConnector_getSmartRepliesStreamsWithHandler___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, void *);
  void *v19;
  id v20;
  _QWORD v21[5];
  uint8_t buf[4];
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  BiomeLibrary();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "Maps");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "Suggestions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "RecentConversationsIntent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026F0]), "initWithStartDate:endDate:maxEvents:lastN:reversed:", a1[4], a1[5], a1[8], 0, 0);
  objc_msgSend(v5, "publisherWithOptions:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v7, "filterWithIsIncluded:", &__block_literal_global_20);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __71__MapsSuggestionsRealBiomeConnector_getSmartRepliesStreamsWithHandler___block_invoke_3;
  v21[3] = &unk_1E4BD0120;
  v21[4] = a1[7];
  v16 = MEMORY[0x1E0C809B0];
  v17 = 3221225472;
  v18 = __71__MapsSuggestionsRealBiomeConnector_getSmartRepliesStreamsWithHandler___block_invoke_16;
  v19 = &unk_1E4BD0148;
  v10 = v8;
  v20 = v10;
  v11 = (id)objc_msgSend(v9, "sinkWithCompletion:receiveInput:", v21, &v16);

  GEOFindOrCreateLog();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    v13 = objc_msgSend(v10, "count", v16, v17, v18, v19);
    *(_DWORD *)buf = 134217984;
    v23 = v13;
    _os_log_impl(&dword_1A427D000, v12, OS_LOG_TYPE_INFO, "Sending %lu SmartReplies Streams", buf, 0xCu);
  }

  v14 = a1[6];
  v15 = (void *)objc_msgSend(v10, "copy");
  (*(void (**)(uint64_t, void *, _QWORD))(v14 + 16))(v14, v15, *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40));

}

BOOL __71__MapsSuggestionsRealBiomeConnector_getSmartRepliesStreamsWithHandler___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "eventBody");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && objc_msgSend(v2, "actionType") == 18;

  return v3;
}

void __71__MapsSuggestionsRealBiomeConnector_getSmartRepliesStreamsWithHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (objc_msgSend(v3, "state") == 1)
  {
    v4 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      v7 = *(void **)(v6 + 40);
      *(_QWORD *)(v6 + 40) = v5;

      v4 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    }
    objc_msgSend(v3, "error");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "copy");
    objc_msgSend(v4, "addObject:", v9);

    GEOFindOrCreateLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v3, "error");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "localizedDescription");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138412290;
      v14 = v12;
      _os_log_impl(&dword_1A427D000, v10, OS_LOG_TYPE_ERROR, "Error while processing Stream: %@", (uint8_t *)&v13, 0xCu);

    }
  }

}

void __71__MapsSuggestionsRealBiomeConnector_getSmartRepliesStreamsWithHandler___block_invoke_16(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  char isKindOfClass;
  void *v6;
  void *v7;
  id v8;

  v3 = a2;
  if (v3)
  {
    v8 = v3;
    objc_msgSend(v3, "eventBody");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    v3 = v8;
    if ((isKindOfClass & 1) != 0)
    {
      v6 = *(void **)(a1 + 32);
      objc_msgSend(v8, "eventBody");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addObject:", v7);

      v3 = v8;
    }
  }

}

- (BOOL)registerForSmartRepliesUpdatesWithHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *queue;
  id v10;
  NSObject *v11;
  _QWORD block[4];
  id v14;
  id v15;
  _BYTE *v16;
  id v17;
  id location;
  _BYTE buf[40];
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    BiomeLibrary();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "Maps");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "Suggestions");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "RecentConversationsIntent");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    *(_QWORD *)&buf[24] = __Block_byref_object_copy__11;
    *(_QWORD *)&buf[32] = __Block_byref_object_dispose__11;
    v20 = 0;
    objc_initWeak(&location, self);
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __79__MapsSuggestionsRealBiomeConnector_registerForSmartRepliesUpdatesWithHandler___block_invoke;
    block[3] = &unk_1E4BD01E0;
    objc_copyWeak(&v17, &location);
    v14 = v8;
    v15 = v4;
    v16 = buf;
    v10 = v8;
    dispatch_async(queue, block);

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
    _Block_object_dispose(buf, 8);

  }
  else
  {
    GEOFindOrCreateLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      *(_QWORD *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsRealBiomeConnector.m";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 110;
      *(_WORD *)&buf[18] = 2082;
      *(_QWORD *)&buf[20] = "-[MapsSuggestionsRealBiomeConnector registerForSmartRepliesUpdatesWithHandler:]";
      *(_WORD *)&buf[28] = 2082;
      *(_QWORD *)&buf[30] = "nil == (handler)";
      _os_log_impl(&dword_1A427D000, v11, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Handler cannot be nil", buf, 0x26u);
    }

  }
  return v4 != 0;
}

void __79__MapsSuggestionsRealBiomeConnector_registerForSmartRepliesUpdatesWithHandler___block_invoke(uint64_t a1)
{
  id *v2;
  _QWORD *WeakRetained;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  _QWORD v13[5];
  id v14;
  _QWORD v15[5];
  uint8_t buf[4];
  char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  const char *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v2 = (id *)(a1 + 56);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    v4 = objc_msgSend(*(id *)(a1 + 40), "copy");
    v5 = (void *)WeakRetained[7];
    WeakRetained[7] = v4;

    if (!WeakRetained[6])
    {
      objc_msgSend(*(id *)(a1 + 32), "DSLPublisher");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "subscribeOn:", WeakRetained[5]);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "filterWithIsIncluded:", &__block_literal_global_20);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v15[0] = MEMORY[0x1E0C809B0];
      v15[2] = __79__MapsSuggestionsRealBiomeConnector_registerForSmartRepliesUpdatesWithHandler___block_invoke_2;
      v15[3] = &unk_1E4BD0120;
      v9 = *(_QWORD *)(a1 + 48);
      v15[1] = 3221225472;
      v15[4] = v9;
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __79__MapsSuggestionsRealBiomeConnector_registerForSmartRepliesUpdatesWithHandler___block_invoke_21;
      v13[3] = &unk_1E4BD01B8;
      objc_copyWeak(&v14, v2);
      v13[4] = *(_QWORD *)(a1 + 48);
      objc_msgSend(v8, "sinkWithCompletion:receiveInput:", v15, v13);
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = (void *)WeakRetained[6];
      WeakRetained[6] = v10;

      objc_destroyWeak(&v14);
    }
  }
  else
  {
    GEOFindOrCreateLog();
    v12 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v17 = "MapsSuggestionsRealBiomeConnector.m";
      v18 = 1026;
      v19 = 117;
      v20 = 2082;
      v21 = "-[MapsSuggestionsRealBiomeConnector registerForSmartRepliesUpdatesWithHandler:]_block_invoke";
      _os_log_impl(&dword_1A427D000, v12, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
    }

  }
}

BOOL __79__MapsSuggestionsRealBiomeConnector_registerForSmartRepliesUpdatesWithHandler___block_invoke_19(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "eventBody");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && objc_msgSend(v2, "actionType") == 18;

  return v3;
}

void __79__MapsSuggestionsRealBiomeConnector_registerForSmartRepliesUpdatesWithHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (objc_msgSend(v3, "state") == 1)
  {
    v4 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      v7 = *(void **)(v6 + 40);
      *(_QWORD *)(v6 + 40) = v5;

      v4 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    }
    objc_msgSend(v3, "error");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "copy");
    objc_msgSend(v4, "addObject:", v9);

    GEOFindOrCreateLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v3, "error");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "localizedDescription");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138412290;
      v14 = v12;
      _os_log_impl(&dword_1A427D000, v10, OS_LOG_TYPE_ERROR, "Error while processing Stream: %@", (uint8_t *)&v13, 0xCu);

    }
  }

}

void __79__MapsSuggestionsRealBiomeConnector_registerForSmartRepliesUpdatesWithHandler___block_invoke_21(uint64_t a1, void *a2)
{
  id v3;
  _QWORD *WeakRetained;
  void *v5;
  char isKindOfClass;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  void *v10;
  uint8_t buf[4];
  char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  const char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (!WeakRetained)
  {
    GEOFindOrCreateLog();
    v9 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v12 = "MapsSuggestionsRealBiomeConnector.m";
      v13 = 1026;
      v14 = 128;
      v15 = 2082;
      v16 = "-[MapsSuggestionsRealBiomeConnector registerForSmartRepliesUpdatesWithHandler:]_block_invoke";
      _os_log_impl(&dword_1A427D000, v9, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf2 went away in %{public}s", buf, 0x1Cu);
    }
    v8 = v9;
    goto LABEL_8;
  }
  if (v3)
  {
    objc_msgSend(v3, "eventBody");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      v7 = WeakRetained[7];
      objc_msgSend(v3, "eventBody");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v8;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v10, 1);
      v9 = objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, NSObject *, _QWORD))(v7 + 16))(v7, v9, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));
LABEL_8:

    }
  }

}

- (void)unregisterSmartRepliesUpdates
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__MapsSuggestionsRealBiomeConnector_unregisterSmartRepliesUpdates__block_invoke;
  block[3] = &unk_1E4BCEE50;
  block[4] = self;
  dispatch_sync(queue, block);
}

void *__66__MapsSuggestionsRealBiomeConnector_unregisterSmartRepliesUpdates__block_invoke(uint64_t a1)
{
  void *result;

  result = *(void **)(*(_QWORD *)(a1 + 32) + 48);
  if (result)
    return (void *)objc_msgSend(result, "cancel");
  return result;
}

- (BOOL)getFindMyStreamsWithHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int64_t maxEvents;
  NSObject *v8;
  NSObject *queue;
  id v10;
  id v11;
  NSObject *v12;
  _QWORD block[4];
  id v15;
  id v16;
  id v17;
  _BYTE *v18;
  uint64_t v19;
  uint8_t buf[16];
  _BYTE v21[40];
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    MapsSuggestionsNowWithOffset(-self->_lookbackDuration);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    MapsSuggestionsNow();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    maxEvents = self->_maxEvents;
    *(_QWORD *)v21 = 0;
    *(_QWORD *)&v21[8] = v21;
    *(_QWORD *)&v21[16] = 0x3032000000;
    *(_QWORD *)&v21[24] = __Block_byref_object_copy__11;
    *(_QWORD *)&v21[32] = __Block_byref_object_dispose__11;
    v22 = 0;
    GEOFindOrCreateLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A427D000, v8, OS_LOG_TYPE_DEBUG, "Querying Biome+FindMy for events", buf, 2u);
    }

    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __65__MapsSuggestionsRealBiomeConnector_getFindMyStreamsWithHandler___block_invoke;
    block[3] = &unk_1E4BD0170;
    v15 = v5;
    v16 = v6;
    v18 = v21;
    v19 = maxEvents & ~(maxEvents >> 63);
    v17 = v4;
    v10 = v6;
    v11 = v5;
    dispatch_async(queue, block);

    _Block_object_dispose(v21, 8);
  }
  else
  {
    GEOFindOrCreateLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v21 = 136446978;
      *(_QWORD *)&v21[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsRealBiomeConnector.m";
      *(_WORD *)&v21[12] = 1024;
      *(_DWORD *)&v21[14] = 151;
      *(_WORD *)&v21[18] = 2082;
      *(_QWORD *)&v21[20] = "-[MapsSuggestionsRealBiomeConnector getFindMyStreamsWithHandler:]";
      *(_WORD *)&v21[28] = 2082;
      *(_QWORD *)&v21[30] = "nil == (handler)";
      _os_log_impl(&dword_1A427D000, v12, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Handler cannot be nil", v21, 0x26u);
    }

  }
  return v4 != 0;
}

void __65__MapsSuggestionsRealBiomeConnector_getFindMyStreamsWithHandler___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, void *);
  void *v18;
  id v19;
  _QWORD v20[5];
  uint8_t buf[4];
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  BiomeLibrary();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "FindMy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ContactActivity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026F0]), "initWithStartDate:endDate:maxEvents:lastN:reversed:", a1[4], a1[5], a1[8], 0, 0);
  objc_msgSend(v4, "publisherWithOptions:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v6, "filterWithIsIncluded:", &__block_literal_global_23);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __65__MapsSuggestionsRealBiomeConnector_getFindMyStreamsWithHandler___block_invoke_3;
  v20[3] = &unk_1E4BD0120;
  v20[4] = a1[7];
  v15 = MEMORY[0x1E0C809B0];
  v16 = 3221225472;
  v17 = __65__MapsSuggestionsRealBiomeConnector_getFindMyStreamsWithHandler___block_invoke_25;
  v18 = &unk_1E4BD0148;
  v9 = v7;
  v19 = v9;
  v10 = (id)objc_msgSend(v8, "sinkWithCompletion:receiveInput:", v20, &v15);

  GEOFindOrCreateLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v12 = objc_msgSend(v9, "count", v15, v16, v17, v18);
    *(_DWORD *)buf = 134217984;
    v22 = v12;
    _os_log_impl(&dword_1A427D000, v11, OS_LOG_TYPE_INFO, "Sending %lu FindMy Streams", buf, 0xCu);
  }

  v13 = a1[6];
  v14 = (void *)objc_msgSend(v9, "copy");
  (*(void (**)(uint64_t, void *, _QWORD))(v13 + 16))(v13, v14, *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40));

}

BOOL __65__MapsSuggestionsRealBiomeConnector_getFindMyStreamsWithHandler___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "eventBody");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && objc_msgSend(v2, "actionType") != 0;

  return v3;
}

void __65__MapsSuggestionsRealBiomeConnector_getFindMyStreamsWithHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (objc_msgSend(v3, "state") == 1)
  {
    v4 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      v7 = *(void **)(v6 + 40);
      *(_QWORD *)(v6 + 40) = v5;

      v4 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    }
    objc_msgSend(v3, "error");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "copy");
    objc_msgSend(v4, "addObject:", v9);

    GEOFindOrCreateLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v3, "error");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "localizedDescription");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138412290;
      v14 = v12;
      _os_log_impl(&dword_1A427D000, v10, OS_LOG_TYPE_ERROR, "Error while processing Stream: %@", (uint8_t *)&v13, 0xCu);

    }
  }

}

void __65__MapsSuggestionsRealBiomeConnector_getFindMyStreamsWithHandler___block_invoke_25(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  char isKindOfClass;
  void *v6;
  void *v7;
  id v8;

  v3 = a2;
  if (v3)
  {
    v8 = v3;
    objc_msgSend(v3, "eventBody");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    v3 = v8;
    if ((isKindOfClass & 1) != 0)
    {
      v6 = *(void **)(a1 + 32);
      objc_msgSend(v8, "eventBody");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addObject:", v7);

      v3 = v8;
    }
  }

}

- (BOOL)registerForFindMyUpdatesWithHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *queue;
  id v9;
  NSObject *v10;
  _QWORD block[4];
  id v13;
  id v14;
  id v15;
  _BYTE location[12];
  __int16 v17;
  int v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  const char *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    BiomeLibrary();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "FindMy");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "ContactActivity");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_initWeak((id *)location, self);
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __73__MapsSuggestionsRealBiomeConnector_registerForFindMyUpdatesWithHandler___block_invoke;
    block[3] = &unk_1E4BCFA58;
    objc_copyWeak(&v15, (id *)location);
    v13 = v7;
    v14 = v4;
    v9 = v7;
    dispatch_async(queue, block);

    objc_destroyWeak(&v15);
    objc_destroyWeak((id *)location);
  }
  else
  {
    GEOFindOrCreateLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)location = 136446978;
      *(_QWORD *)&location[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsRealBiomeConnector.m";
      v17 = 1024;
      v18 = 192;
      v19 = 2082;
      v20 = "-[MapsSuggestionsRealBiomeConnector registerForFindMyUpdatesWithHandler:]";
      v21 = 2082;
      v22 = "nil == (handler)";
      _os_log_impl(&dword_1A427D000, v10, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Handler cannot be nil", location, 0x26u);
    }

  }
  return v4 != 0;
}

void __73__MapsSuggestionsRealBiomeConnector_registerForFindMyUpdatesWithHandler___block_invoke(id *a1)
{
  _QWORD *WeakRetained;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  _QWORD v11[6];
  _QWORD v12[5];
  _BYTE buf[32];
  void (*v14)(uint64_t);
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained(a1 + 6);
  if (WeakRetained)
  {
    v3 = objc_msgSend(a1[5], "copy");
    v4 = (void *)WeakRetained[11];
    WeakRetained[11] = v3;

    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    *(_QWORD *)&buf[24] = __Block_byref_object_copy__11;
    v14 = __Block_byref_object_dispose__11;
    v15 = 0;
    if (!WeakRetained[10])
    {
      objc_msgSend(a1[4], "DSLPublisher");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "subscribeOn:", WeakRetained[9]);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "filterWithIsIncluded:", &__block_literal_global_27);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __73__MapsSuggestionsRealBiomeConnector_registerForFindMyUpdatesWithHandler___block_invoke_2;
      v12[3] = &unk_1E4BD0120;
      v12[4] = buf;
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __73__MapsSuggestionsRealBiomeConnector_registerForFindMyUpdatesWithHandler___block_invoke_28;
      v11[3] = &unk_1E4BD0248;
      v11[4] = WeakRetained;
      v11[5] = buf;
      objc_msgSend(v7, "sinkWithCompletion:receiveInput:", v12, v11);
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = (void *)WeakRetained[10];
      WeakRetained[10] = v8;

    }
    _Block_object_dispose(buf, 8);

  }
  else
  {
    GEOFindOrCreateLog();
    v10 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      *(_QWORD *)&buf[4] = "MapsSuggestionsRealBiomeConnector.m";
      *(_WORD *)&buf[12] = 1026;
      *(_DWORD *)&buf[14] = 198;
      *(_WORD *)&buf[18] = 2082;
      *(_QWORD *)&buf[20] = "-[MapsSuggestionsRealBiomeConnector registerForFindMyUpdatesWithHandler:]_block_invoke";
      _os_log_impl(&dword_1A427D000, v10, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
    }

  }
}

BOOL __73__MapsSuggestionsRealBiomeConnector_registerForFindMyUpdatesWithHandler___block_invoke_26(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "eventBody");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && objc_msgSend(v2, "actionType") != 0;

  return v3;
}

void __73__MapsSuggestionsRealBiomeConnector_registerForFindMyUpdatesWithHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (objc_msgSend(v3, "state") == 1)
  {
    v4 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      v7 = *(void **)(v6 + 40);
      *(_QWORD *)(v6 + 40) = v5;

      v4 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    }
    objc_msgSend(v3, "error");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "copy");
    objc_msgSend(v4, "addObject:", v9);

    GEOFindOrCreateLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v3, "error");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "localizedDescription");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138412290;
      v14 = v12;
      _os_log_impl(&dword_1A427D000, v10, OS_LOG_TYPE_ERROR, "Error while processing Stream: %@", (uint8_t *)&v13, 0xCu);

    }
  }

}

void __73__MapsSuggestionsRealBiomeConnector_registerForFindMyUpdatesWithHandler___block_invoke_28(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  char isKindOfClass;
  uint64_t v7;
  void *v8;
  void *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "eventBody");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 88);
      objc_msgSend(v4, "eventBody");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v10[0] = v8;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *, _QWORD))(v7 + 16))(v7, v9, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));

    }
  }

}

- (void)unregisterFindMyUpdates
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__MapsSuggestionsRealBiomeConnector_unregisterFindMyUpdates__block_invoke;
  block[3] = &unk_1E4BCEE50;
  block[4] = self;
  dispatch_sync(queue, block);
}

void *__60__MapsSuggestionsRealBiomeConnector_unregisterFindMyUpdates__block_invoke(uint64_t a1)
{
  void *result;

  result = *(void **)(*(_QWORD *)(a1 + 32) + 80);
  if (result)
    return (void *)objc_msgSend(result, "cancel");
  return result;
}

- (NSString)uniqueName
{
  return self->uniqueName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->uniqueName, 0);
  objc_storeStrong(&self->_findMyUpdateHandler, 0);
  objc_storeStrong((id *)&self->_findMySink, 0);
  objc_storeStrong((id *)&self->_findMyScheduler, 0);
  objc_storeStrong(&self->_smartRepliesUpdateHandler, 0);
  objc_storeStrong((id *)&self->_smartRepliesSink, 0);
  objc_storeStrong((id *)&self->_smartRepliesScheduler, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
