@implementation MapsSuggestionsEngine

- (MapsSuggestionsEngine)initWithEntryManager:(id)a3 resourceDepot:(id)a4
{
  id v7;
  id v8;
  MapsSuggestionsEngine *v9;
  NSObject *v10;
  dispatch_queue_t v11;
  OS_dispatch_queue *optionsSerialQueue;
  MapsSuggestionsEngine *v13;
  NSObject *v14;
  const char *v15;
  objc_super v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  const char *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (!v8)
  {
    GEOFindOrCreateLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v19 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsEngine.m";
      v20 = 1024;
      v21 = 52;
      v22 = 2082;
      v23 = "-[MapsSuggestionsEngine initWithEntryManager:resourceDepot:]";
      v24 = 2082;
      v25 = "nil == (resourceDepot)";
      v15 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a resource depot";
LABEL_10:
      _os_log_impl(&dword_1A427D000, v14, OS_LOG_TYPE_ERROR, v15, buf, 0x26u);
    }
LABEL_11:

    v13 = 0;
    goto LABEL_12;
  }
  if (!v7)
  {
    GEOFindOrCreateLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v19 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsEngine.m";
      v20 = 1024;
      v21 = 53;
      v22 = 2082;
      v23 = "-[MapsSuggestionsEngine initWithEntryManager:resourceDepot:]";
      v24 = 2082;
      v25 = "nil == (entryManager)";
      v15 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires an EntryManager";
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  v17.receiver = self;
  v17.super_class = (Class)MapsSuggestionsEngine;
  v9 = -[MapsSuggestionsEngine init](&v17, sel_init);
  if (v9)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = dispatch_queue_create("com.apple.Maps.SuggestionsEngine", v10);
    optionsSerialQueue = v9->_optionsSerialQueue;
    v9->_optionsSerialQueue = (OS_dispatch_queue *)v11;

    objc_storeStrong((id *)&v9->_resourceDepot, a4);
    objc_storeStrong((id *)&v9->_entryManager, a3);
    v9->_mapType = 0;
  }
  self = v9;
  v13 = self;
LABEL_12:

  return v13;
}

- (NSString)uniqueName
{
  return (NSString *)objc_msgSend((id)objc_opt_class(), "description");
}

- (void)attachSink:(id)a3
{
  -[MapsSuggestionsManager attachSink:](self->_entryManager, "attachSink:", a3);
}

- (void)detachSink:(id)a3
{
  -[MapsSuggestionsManager detachSink:](self->_entryManager, "detachSink:", a3);
}

- (BOOL)topSuggestionsForSink:(id)a3 count:(unint64_t)a4 transportType:(int)a5 callback:(id)a6 onQueue:(id)a7
{
  return -[MapsSuggestionsManager topSuggestionsForSink:count:transportType:callback:onQueue:](self->_entryManager, "topSuggestionsForSink:count:transportType:callback:onQueue:", a3, a4, *(_QWORD *)&a5, a6, a7);
}

- (id)topSuggestionsForSink:(id)a3 count:(unint64_t)a4 transportType:(int)a5
{
  uint64_t v5;
  id v9;
  NSObject *v10;
  dispatch_queue_t v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  id v17;
  _QWORD v19[4];
  NSObject *v20;
  uint64_t *v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  uint64_t v38;
  uint64_t v39;

  v5 = *(_QWORD *)&a5;
  v39 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = dispatch_queue_create("MapsSuggestionsEngineSynced1", v10);

  v12 = dispatch_group_create();
  v29 = 0;
  v30 = &v29;
  v31 = 0x3032000000;
  v32 = __Block_byref_object_copy__5;
  v33 = __Block_byref_object_dispose__5;
  v34 = 0;
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__5;
  v27 = __Block_byref_object_dispose__5;
  v28 = 0;
  dispatch_group_enter(v12);
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __67__MapsSuggestionsEngine_topSuggestionsForSink_count_transportType___block_invoke;
  v19[3] = &unk_1E4BCECC8;
  v21 = &v29;
  v22 = &v23;
  v13 = v12;
  v20 = v13;
  -[MapsSuggestionsEngine topSuggestionsForSink:count:transportType:callback:onQueue:](self, "topSuggestionsForSink:count:transportType:callback:onQueue:", v9, a4, v5, v19, v11);
  dispatch_group_wait(v13, 0xFFFFFFFFFFFFFFFFLL);
  if (v24[5])
  {
    GEOFindOrCreateLog();
    v14 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v30[5];
      *(_DWORD *)buf = 138412546;
      v36 = v15;
      v37 = 2112;
      v38 = v16;
      _os_log_impl(&dword_1A427D000, v14, OS_LOG_TYPE_ERROR, "%@ received error: %@", buf, 0x16u);

    }
  }
  v17 = (id)v30[5];

  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v29, 8);

  return v17;
}

void __67__MapsSuggestionsEngine_topSuggestionsForSink_count_transportType___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v12 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;
  v11 = v6;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

- (BOOL)topSuggestionsFromStorageFile:(id)a3 sink:(id)a4 count:(unint64_t)a5 transportType:(int)a6 callback:(id)a7 onQueue:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  NSObject *v18;
  void *v19;
  NSObject *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  BOOL v26;
  _QWORD v28[4];
  id v29;
  id v30;
  MapsSuggestionsEngine *v31;
  id v32;
  id v33;
  id v34[2];
  int v35;
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  const char *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = a7;
  v17 = a8;
  GEOFindOrCreateLog();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    -[MapsSuggestionsEngine uniqueName](self, "uniqueName");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v37 = v19;
    v38 = 2080;
    v39 = "topSuggestionsFromStorageFileWithCallback";
    _os_log_impl(&dword_1A427D000, v18, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s BEGIN", buf, 0x16u);

  }
  GEOFindOrCreateLog();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v20))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A427D000, v20, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "topSuggestionsFromStorageFileWithCallback", ", buf, 2u);
  }

  if (!v14)
  {
    if (qword_1ED22EF30 != -1)
      dispatch_once(&qword_1ED22EF30, &__block_literal_global_7);
    v14 = (id)_MergedGlobals_33;
  }
  objc_initWeak((id *)buf, self);
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __97__MapsSuggestionsEngine_topSuggestionsFromStorageFile_sink_count_transportType_callback_onQueue___block_invoke;
  v28[3] = &unk_1E4BCECF0;
  objc_copyWeak(v34, (id *)buf);
  v21 = v14;
  v29 = v21;
  v22 = v15;
  v34[1] = (id)a5;
  v35 = a6;
  v30 = v22;
  v31 = self;
  v23 = v16;
  v33 = v23;
  v24 = v17;
  v32 = v24;
  dispatch_get_global_queue(0, 0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = -[MapsSuggestionsEngine loadStorageFromFile:callback:callbackQueue:](self, "loadStorageFromFile:callback:callbackQueue:", v21, v28, v25);

  objc_destroyWeak(v34);
  objc_destroyWeak((id *)buf);

  return v26;
}

void __97__MapsSuggestionsEngine_topSuggestionsFromStorageFile_sink_count_transportType_callback_onQueue___block_invoke(uint64_t a1, char a2)
{
  id WeakRetained;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  char *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  char *v16;
  NSObject *v17;
  char *v18;
  _QWORD v19[5];
  id v20;
  uint8_t buf[4];
  char *v22;
  __int16 v23;
  _WORD v24[17];

  *(_QWORD *)&v24[13] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  if (!WeakRetained)
  {
    GEOFindOrCreateLog();
    v14 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v22 = "MapsSuggestionsEngine.m";
      v23 = 1026;
      *(_DWORD *)v24 = 141;
      v24[2] = 2082;
      *(_QWORD *)&v24[3] = "-[MapsSuggestionsEngine topSuggestionsFromStorageFile:sink:count:transportType:callback:onQue"
                           "ue:]_block_invoke";
      _os_log_impl(&dword_1A427D000, v14, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
    }

    goto LABEL_19;
  }
  if ((a2 & 1) == 0)
  {
    GEOFindOrCreateLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v16 = *(char **)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      v22 = v16;
      _os_log_impl(&dword_1A427D000, v15, OS_LOG_TYPE_ERROR, "Could not read from %@", buf, 0xCu);
    }

    GEOFindOrCreateLog();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(WeakRetained, "uniqueName");
      v18 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v22 = v18;
      v23 = 2080;
      *(_QWORD *)v24 = "topSuggestionsFromStorageFileWithCallback";
      _os_log_impl(&dword_1A427D000, v17, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s FAIL", buf, 0x16u);

    }
    GEOFindOrCreateLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v14))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A427D000, v14, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "topSuggestionsFromStorageFileWithCallback", ", buf, 2u);
    }
LABEL_19:

    goto LABEL_20;
  }
  v5 = *(_QWORD *)(a1 + 80);
  v6 = *(unsigned int *)(a1 + 88);
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __97__MapsSuggestionsEngine_topSuggestionsFromStorageFile_sink_count_transportType_callback_onQueue___block_invoke_89;
  v19[3] = &unk_1E4BCDEE0;
  v7 = *(_QWORD *)(a1 + 40);
  v19[4] = *(_QWORD *)(a1 + 48);
  v20 = *(id *)(a1 + 64);
  if ((objc_msgSend(WeakRetained, "topSuggestionsForSink:count:transportType:callback:onQueue:", v7, v5, v6, v19, *(_QWORD *)(a1 + 56)) & 1) == 0)
  {
    v8 = objc_alloc(MEMORY[0x1E0CB3940]);
    objc_msgSend(*(id *)(a1 + 40), "uniqueName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (char *)objc_msgSend(v8, "initWithFormat:", CFSTR("Could not call topSuggestionsForSink:%@"), v9);

    GEOFindOrCreateLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v22 = v10;
      _os_log_impl(&dword_1A427D000, v11, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
    }

    v12 = *(_QWORD *)(a1 + 64);
    if (v12)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:reason:", -12, v10);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v12 + 16))(v12, 0, v13);

    }
  }

LABEL_20:
}

void __97__MapsSuggestionsEngine_topSuggestionsFromStorageFile_sink_count_transportType_callback_onQueue___block_invoke_89(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  int v11;
  void *v12;
  __int16 v13;
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  GEOFindOrCreateLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(*(id *)(a1 + 32), "uniqueName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138412546;
    v12 = v8;
    v13 = 2080;
    v14 = "topSuggestionsFromStorageFileWithCallback";
    _os_log_impl(&dword_1A427D000, v7, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s END", (uint8_t *)&v11, 0x16u);

  }
  GEOFindOrCreateLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v9))
  {
    LOWORD(v11) = 0;
    _os_signpost_emit_with_name_impl(&dword_1A427D000, v9, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "topSuggestionsFromStorageFileWithCallback", ", (uint8_t *)&v11, 2u);
  }

  v10 = *(_QWORD *)(a1 + 40);
  if (v10)
    (*(void (**)(uint64_t, id, id))(v10 + 16))(v10, v5, v6);

}

- (id)topSuggestionsFromStorageFile:(id)a3 sink:(id)a4 count:(unint64_t)a5 transportType:(int)a6
{
  uint64_t v6;
  id v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  dispatch_semaphore_t v15;
  id v16;
  NSObject *v17;
  void *v18;
  dispatch_time_t v19;
  NSObject *v20;
  void *v21;
  NSObject *v22;
  id v23;
  NSObject *v24;
  NSObject *v25;
  void *v26;
  NSObject *v27;
  uint64_t v29;
  uint64_t v30;
  void (*v31)(uint64_t, void *, void *);
  void *v32;
  NSObject *v33;
  _BYTE *v34;
  SEL v35;
  id location;
  uint8_t v37[4];
  void *v38;
  __int16 v39;
  const char *v40;
  _BYTE buf[24];
  uint64_t (*v42)(uint64_t, uint64_t);
  void (*v43)(uint64_t);
  id v44;
  uint64_t v45;

  v6 = *(_QWORD *)&a6;
  v45 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  objc_initWeak(&location, a4);
  GEOFindOrCreateLog();
  v12 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    -[MapsSuggestionsEngine uniqueName](self, "uniqueName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v13;
    *(_WORD *)&buf[12] = 2080;
    *(_QWORD *)&buf[14] = "topSuggestionsFromStorageFile";
    _os_log_impl(&dword_1A427D000, v12, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s BEGIN", buf, 0x16u);

  }
  GEOFindOrCreateLog();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v14))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A427D000, v14, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "topSuggestionsFromStorageFile", ", buf, 2u);
  }

  if (!v11)
  {
    if (qword_1ED22EF30 != -1)
      dispatch_once(&qword_1ED22EF30, &__block_literal_global_7);
    v11 = (id)_MergedGlobals_33;
  }
  if (-[MapsSuggestionsEngine loadStorageFromFile:](self, "loadStorageFromFile:", v11))
  {
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v42 = __Block_byref_object_copy__5;
    v43 = __Block_byref_object_dispose__5;
    v44 = 0;
    v15 = dispatch_semaphore_create(0);
    v16 = objc_loadWeakRetained(&location);
    v29 = MEMORY[0x1E0C809B0];
    v30 = 3221225472;
    v31 = __80__MapsSuggestionsEngine_topSuggestionsFromStorageFile_sink_count_transportType___block_invoke;
    v32 = &unk_1E4BCED18;
    v35 = a2;
    v17 = v15;
    v33 = v17;
    v34 = buf;
    dispatch_get_global_queue(17, 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[MapsSuggestionsEngine topSuggestionsForSink:count:transportType:callback:onQueue:](self, "topSuggestionsForSink:count:transportType:callback:onQueue:", v16, a5, v6, &v29, v18);

    v19 = dispatch_time(0, 1000000000);
    dispatch_semaphore_wait(v17, v19);
    GEOFindOrCreateLog();
    v20 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      -[MapsSuggestionsEngine uniqueName](self, "uniqueName", v29, v30, v31, v32, v33, v34, v35);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v37 = 138412546;
      v38 = v21;
      v39 = 2080;
      v40 = "topSuggestionsFromStorageFile";
      _os_log_impl(&dword_1A427D000, v20, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s END", v37, 0x16u);

    }
    GEOFindOrCreateLog();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v22))
    {
      *(_WORD *)v37 = 0;
      _os_signpost_emit_with_name_impl(&dword_1A427D000, v22, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "topSuggestionsFromStorageFile", ", v37, 2u);
    }

    v23 = *(id *)(*(_QWORD *)&buf[8] + 40);
    _Block_object_dispose(buf, 8);

  }
  else
  {
    GEOFindOrCreateLog();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v11;
      _os_log_impl(&dword_1A427D000, v24, OS_LOG_TYPE_ERROR, "Could not read from %@", buf, 0xCu);
    }

    GEOFindOrCreateLog();
    v25 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
    {
      -[MapsSuggestionsEngine uniqueName](self, "uniqueName");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v26;
      *(_WORD *)&buf[12] = 2080;
      *(_QWORD *)&buf[14] = "topSuggestionsFromStorageFile";
      _os_log_impl(&dword_1A427D000, v25, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s FAIL", buf, 0x16u);

    }
    GEOFindOrCreateLog();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v27))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A427D000, v27, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "topSuggestionsFromStorageFile", ", buf, 2u);
    }

    v23 = 0;
  }
  objc_destroyWeak(&location);

  return v23;
}

void __80__MapsSuggestionsEngine_topSuggestionsFromStorageFile_sink_count_transportType___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    GEOFindOrCreateLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(*(SEL *)(a1 + 48));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138412546;
      v13 = v8;
      v14 = 2112;
      v15 = v6;
      _os_log_impl(&dword_1A427D000, v7, OS_LOG_TYPE_ERROR, "%@ returned with error: %@", (uint8_t *)&v12, 0x16u);

    }
  }
  else if (v5)
  {
    v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithArray:", v5);
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v11 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v9;

  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

- (BOOL)oneShotTopSuggestionsForSink:(id)a3 count:(unint64_t)a4 transportType:(int)a5 callback:(id)a6 onQueue:(id)a7
{
  uint64_t v9;
  id v12;
  id v13;
  id v14;
  void *v15;
  char v16;
  NSObject *v17;
  const char *v18;
  int v20;
  const char *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  const char *v27;
  uint64_t v28;

  v9 = *(_QWORD *)&a5;
  v28 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a6;
  v14 = a7;
  v15 = v14;
  if (!v13)
  {
    GEOFindOrCreateLog();
    v17 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      goto LABEL_12;
    v20 = 136446978;
    v21 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsEngine.m";
    v22 = 1024;
    v23 = 221;
    v24 = 2082;
    v25 = "-[MapsSuggestionsEngine oneShotTopSuggestionsForSink:count:transportType:callback:onQueue:]";
    v26 = 2082;
    v27 = "nil == (callback)";
    v18 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a completion callback";
LABEL_11:
    _os_log_impl(&dword_1A427D000, v17, OS_LOG_TYPE_ERROR, v18, (uint8_t *)&v20, 0x26u);
    goto LABEL_12;
  }
  if (!v14)
  {
    GEOFindOrCreateLog();
    v17 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      goto LABEL_12;
    v20 = 136446978;
    v21 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsEngine.m";
    v22 = 1024;
    v23 = 222;
    v24 = 2082;
    v25 = "-[MapsSuggestionsEngine oneShotTopSuggestionsForSink:count:transportType:callback:onQueue:]";
    v26 = 2082;
    v27 = "nil == (callbackQueue)";
    v18 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a queue to call back on";
    goto LABEL_11;
  }
  if (!v12)
  {
    GEOFindOrCreateLog();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v20 = 136446978;
      v21 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsEngine.m";
      v22 = 1024;
      v23 = 223;
      v24 = 2082;
      v25 = "-[MapsSuggestionsEngine oneShotTopSuggestionsForSink:count:transportType:callback:onQueue:]";
      v26 = 2082;
      v27 = "nil == (sink)";
      v18 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a sink delegate";
      goto LABEL_11;
    }
LABEL_12:

    v16 = 0;
    goto LABEL_13;
  }
  v16 = -[MapsSuggestionsManager oneShotTopSuggestionsForSink:count:transportType:callback:onQueue:](self->_entryManager, "oneShotTopSuggestionsForSink:count:transportType:callback:onQueue:", v12, a4, v9, v13, v14);
LABEL_13:

  return v16;
}

- (void)addAdditionalFilter:(id)a3 forSink:(id)a4
{
  id v6;
  id v7;
  void *v8;
  MapsSuggestionsManager *entryManager;
  void *v10;
  NSObject *v11;
  const char *v12;
  int v13;
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  const char *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (!v6)
  {
    GEOFindOrCreateLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v13 = 136446978;
      v14 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsEngine.m";
      v15 = 1024;
      v16 = 234;
      v17 = 2082;
      v18 = "-[MapsSuggestionsEngine addAdditionalFilter:forSink:]";
      v19 = 2082;
      v20 = "nil == (filter)";
      v12 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires filter to add";
LABEL_8:
      _os_log_impl(&dword_1A427D000, v11, OS_LOG_TYPE_ERROR, v12, (uint8_t *)&v13, 0x26u);
    }
LABEL_9:

    goto LABEL_10;
  }
  if (!v7)
  {
    GEOFindOrCreateLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v13 = 136446978;
      v14 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsEngine.m";
      v15 = 1024;
      v16 = 235;
      v17 = 2082;
      v18 = "-[MapsSuggestionsEngine addAdditionalFilter:forSink:]";
      v19 = 2082;
      v20 = "nil == (sink)";
      v12 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires sink to add it for";
      goto LABEL_8;
    }
    goto LABEL_9;
  }
  entryManager = self->_entryManager;
  objc_msgSend(v7, "uniqueName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[MapsSuggestionsManager addAdditionalFilter:forSink:](entryManager, "addAdditionalFilter:forSink:", v6, v10);

LABEL_10:
}

- (void)removeAdditionalFilter:(id)a3 forSink:(id)a4
{
  id v6;
  id v7;
  void *v8;
  MapsSuggestionsManager *entryManager;
  void *v10;
  NSObject *v11;
  const char *v12;
  int v13;
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  const char *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (!v6)
  {
    GEOFindOrCreateLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v13 = 136446978;
      v14 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsEngine.m";
      v15 = 1024;
      v16 = 241;
      v17 = 2082;
      v18 = "-[MapsSuggestionsEngine removeAdditionalFilter:forSink:]";
      v19 = 2082;
      v20 = "nil == (filter)";
      v12 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires filter to remove";
LABEL_8:
      _os_log_impl(&dword_1A427D000, v11, OS_LOG_TYPE_ERROR, v12, (uint8_t *)&v13, 0x26u);
    }
LABEL_9:

    goto LABEL_10;
  }
  if (!v7)
  {
    GEOFindOrCreateLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v13 = 136446978;
      v14 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsEngine.m";
      v15 = 1024;
      v16 = 242;
      v17 = 2082;
      v18 = "-[MapsSuggestionsEngine removeAdditionalFilter:forSink:]";
      v19 = 2082;
      v20 = "nil == (sink)";
      v12 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires sink to remove it for";
      goto LABEL_8;
    }
    goto LABEL_9;
  }
  entryManager = self->_entryManager;
  objc_msgSend(v7, "uniqueName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[MapsSuggestionsManager removeAdditionalFilter:forSink:](entryManager, "removeAdditionalFilter:forSink:", v6, v10);

LABEL_10:
}

- (void)hintRefreshOfType:(int64_t)a3
{
  -[MapsSuggestionsManager hintRefreshOfType:](self->_entryManager, "hintRefreshOfType:", a3);
}

- (void)setMapType:(int)a3
{
  NSObject *optionsSerialQueue;
  _QWORD v4[5];
  int v5;

  optionsSerialQueue = self->_optionsSerialQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __36__MapsSuggestionsEngine_setMapType___block_invoke;
  v4[3] = &unk_1E4BCDCF8;
  v4[4] = self;
  v5 = a3;
  dispatch_sync(optionsSerialQueue, v4);
}

uint64_t __36__MapsSuggestionsEngine_setMapType___block_invoke(uint64_t result)
{
  uint64_t v1;
  int v2;

  v1 = *(_QWORD *)(result + 32);
  v2 = *(_DWORD *)(result + 40);
  if (*(_DWORD *)(v1 + 32) != v2)
  {
    *(_DWORD *)(v1 + 32) = v2;
    return objc_msgSend(*(id *)(*(_QWORD *)(result + 32) + 16), "setMapType:", *(unsigned int *)(*(_QWORD *)(result + 32) + 32));
  }
  return result;
}

- (void)setAutomobileOptions:(id)a3
{
  id v4;
  NSObject *optionsSerialQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  optionsSerialQueue = self->_optionsSerialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__MapsSuggestionsEngine_setAutomobileOptions___block_invoke;
  block[3] = &unk_1E4BCED40;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(optionsSerialQueue, block);

}

id *__46__MapsSuggestionsEngine_setAutomobileOptions___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id *result;
  void *v5;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v5 = *(void **)(v2 + 40);
  result = (id *)(v2 + 40);
  if (v5 != v3)
  {
    objc_storeStrong(result, v3);
    return (id *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setAutomobileOptions:", *(_QWORD *)(a1 + 40));
  }
  return result;
}

- (BOOL)saveStorageToFile:(id)a3 callback:(id)a4
{
  id v6;
  id v7;
  char v8;

  v6 = a3;
  v7 = a4;
  if (!v6)
  {
    if (qword_1ED22EF30 != -1)
      dispatch_once(&qword_1ED22EF30, &__block_literal_global_7);
    v6 = (id)_MergedGlobals_33;
  }
  v8 = -[MapsSuggestionsManager saveStorageToFile:callback:](self->_entryManager, "saveStorageToFile:callback:", v6, v7);

  return v8;
}

- (BOOL)loadStorageFromFile:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  if (!v4)
  {
    if (qword_1ED22EF30 != -1)
      dispatch_once(&qword_1ED22EF30, &__block_literal_global_7);
    v4 = (id)_MergedGlobals_33;
  }
  v5 = -[MapsSuggestionsManager loadStorageFromFile:](self->_entryManager, "loadStorageFromFile:", v4);

  return v5;
}

- (BOOL)loadStorageFromFile:(id)a3 callback:(id)a4 callbackQueue:(id)a5
{
  id v8;
  id v9;
  id v10;
  char v11;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!v8)
  {
    if (qword_1ED22EF30 != -1)
      dispatch_once(&qword_1ED22EF30, &__block_literal_global_7);
    v8 = (id)_MergedGlobals_33;
  }
  v11 = -[MapsSuggestionsManager loadStorageFromFile:callback:callbackQueue:](self->_entryManager, "loadStorageFromFile:callback:callbackQueue:", v8, v9, v10);

  return v11;
}

- (BOOL)removeEntry:(id)a3 behavior:(int64_t)a4 handler:(id)a5
{
  NSObject *v6;
  int v8;
  const char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    -[MapsSuggestionsManager removeEntry:behavior:handler:](self->_entryManager, "removeEntry:behavior:handler:", a3, a4, a5);
  }
  else
  {
    GEOFindOrCreateLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v8 = 136446978;
      v9 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsEngine.m";
      v10 = 1024;
      v11 = 315;
      v12 = 2082;
      v13 = "-[MapsSuggestionsEngine removeEntry:behavior:handler:]";
      v14 = 2082;
      v15 = "nil == (entry)";
      _os_log_impl(&dword_1A427D000, v6, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires entry", (uint8_t *)&v8, 0x26u);
    }

  }
  return a3 != 0;
}

- (void)feedbackForEntry:(id)a3 action:(int64_t)a4
{
  NSObject *v4;
  int v5;
  const char *v6;
  __int16 v7;
  int v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    -[MapsSuggestionsManager feedbackForEntry:action:](self->_entryManager, "feedbackForEntry:action:");
  }
  else
  {
    GEOFindOrCreateLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = 136446978;
      v6 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsEngine.m";
      v7 = 1024;
      v8 = 326;
      v9 = 2082;
      v10 = "-[MapsSuggestionsEngine feedbackForEntry:action:]";
      v11 = 2082;
      v12 = "nil == (entry)";
      _os_log_impl(&dword_1A427D000, v4, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires entry", (uint8_t *)&v5, 0x26u);
    }

  }
}

- (void)feedbackForMapItem:(id)a3 action:(int64_t)a4
{
  NSObject *v4;
  int v5;
  const char *v6;
  __int16 v7;
  int v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    -[MapsSuggestionsManager feedbackForMapItem:action:](self->_entryManager, "feedbackForMapItem:action:");
  }
  else
  {
    GEOFindOrCreateLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = 136446978;
      v6 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsEngine.m";
      v7 = 1024;
      v8 = 333;
      v9 = 2082;
      v10 = "-[MapsSuggestionsEngine feedbackForMapItem:action:]";
      v11 = 2082;
      v12 = "nil == (mapItem)";
      _os_log_impl(&dword_1A427D000, v4, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires mapItem", (uint8_t *)&v5, 0x26u);
    }

  }
}

- (void)feedbackForContact:(id)a3 action:(int64_t)a4
{
  NSObject *v4;
  int v5;
  const char *v6;
  __int16 v7;
  int v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    -[MapsSuggestionsManager feedbackForContact:action:](self->_entryManager, "feedbackForContact:action:");
  }
  else
  {
    GEOFindOrCreateLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = 136446978;
      v6 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsEngine.m";
      v7 = 1024;
      v8 = 341;
      v9 = 2082;
      v10 = "-[MapsSuggestionsEngine feedbackForContact:action:]";
      v11 = 2082;
      v12 = "nil == (contact)";
      _os_log_impl(&dword_1A427D000, v4, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires contact", (uint8_t *)&v5, 0x26u);
    }

  }
}

- (id)manager
{
  return self->_entryManager;
}

- (id)strategy
{
  return -[MapsSuggestionsManager strategy](self->_entryManager, "strategy");
}

- (id)oneSourceDelegate
{
  return self->_entryManager;
}

- (id)oneNetworkRequester
{
  return (id)-[MapsSuggestionsResourceDepot oneNetworkRequester](self->_resourceDepot, "oneNetworkRequester");
}

- (id)oneRoutine
{
  return (id)-[MapsSuggestionsResourceDepot oneRoutine](self->_resourceDepot, "oneRoutine");
}

- (id)onePortrait
{
  return (id)-[MapsSuggestionsResourceDepot onePortrait](self->_resourceDepot, "onePortrait");
}

- (id)oneEventKit
{
  return (id)-[MapsSuggestionsResourceDepot oneEventKit](self->_resourceDepot, "oneEventKit");
}

- (id)oneMapsSync
{
  return (id)-[MapsSuggestionsResourceDepot oneMapsSync](self->_resourceDepot, "oneMapsSync");
}

- (id)oneContacts
{
  return (id)-[MapsSuggestionsResourceDepot oneContacts](self->_resourceDepot, "oneContacts");
}

- (id)oneFlightUpdater
{
  return (id)-[MapsSuggestionsResourceDepot oneFlightUpdater](self->_resourceDepot, "oneFlightUpdater");
}

- (id)oneFavorites
{
  return (id)-[MapsSuggestionsResourceDepot oneFavorites](self->_resourceDepot, "oneFavorites");
}

- (id)oneUser
{
  return (id)-[MapsSuggestionsResourceDepot oneUser](self->_resourceDepot, "oneUser");
}

- (id)oneInsights
{
  return (id)-[MapsSuggestionsResourceDepot oneInsights](self->_resourceDepot, "oneInsights");
}

- (id)oneVirtualGarage
{
  return (id)-[MapsSuggestionsResourceDepot oneVirtualGarage](self->_resourceDepot, "oneVirtualGarage");
}

- (id)oneBiome
{
  return (id)-[MapsSuggestionsResourceDepot oneBiome](self->_resourceDepot, "oneBiome");
}

- (id)oneFindMy
{
  return (id)-[MapsSuggestionsResourceDepot oneFindMy](self->_resourceDepot, "oneFindMy");
}

- (id)oneFinanceKit
{
  return (id)-[MapsSuggestionsResourceDepot oneFinanceKit](self->_resourceDepot, "oneFinanceKit");
}

- (id)oneContactActivity
{
  return (id)-[MapsSuggestionsResourceDepot oneContactActivity](self->_resourceDepot, "oneContactActivity");
}

- (id)oneAppGuardian
{
  return (id)-[MapsSuggestionsResourceDepot oneAppGuardian](self->_resourceDepot, "oneAppGuardian");
}

- (int)mapType
{
  return self->_mapType;
}

- (GEOAutomobileOptions)automobileOptions
{
  return self->_automobileOptions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_automobileOptions, 0);
  objc_storeStrong((id *)&self->_optionsSerialQueue, 0);
  objc_storeStrong((id *)&self->_entryManager, 0);
  objc_storeStrong((id *)&self->_resourceDepot, 0);
}

@end
