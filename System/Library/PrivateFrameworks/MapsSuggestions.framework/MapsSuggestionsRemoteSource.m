@implementation MapsSuggestionsRemoteSource

- (void)_q_openConnectionIfNecessary
{
  NSObject *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;
  id location;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  const char *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 32));
  if (!*(_QWORD *)(a1 + 24))
  {
    GEOFindOrCreateLog();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend((id)a1, "uniqueName");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v23 = v3;
      v24 = 2080;
      v25 = "openingConnection";
      _os_log_impl(&dword_1A427D000, v2, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s BEGIN", buf, 0x16u);

    }
    GEOFindOrCreateLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v4))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A427D000, v4, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "openingConnection", ", buf, 2u);
    }

    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE733728);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
    objc_msgSend(v5, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_feedbackForMapItem_action_, 0, 0);

    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
    objc_msgSend(v5, "setClasses:forSelector:argumentIndex:ofReply:", v7, sel_feedbackForContact_action_, 0, 0);

    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE720A70);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
    objc_msgSend(v8, "setClasses:forSelector:argumentIndex:ofReply:", v9, sel_addOrUpdateSuggestionEntriesData_sourceNameData_handler_, 0, 0);

    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
    objc_msgSend(v8, "setClasses:forSelector:argumentIndex:ofReply:", v10, sel_addOrUpdateSuggestionEntriesData_sourceNameData_handler_, 1, 0);

    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.maps.destinationd.sources"), 0);
    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE733728);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setRemoteObjectInterface:", v12);

    objc_msgSend(v11, "setExportedInterface:", v8);
    objc_msgSend(v11, "setExportedObject:", a1);
    objc_initWeak(&location, (id)a1);
    v13 = MEMORY[0x1E0C809B0];
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __59__MapsSuggestionsRemoteSource__q_openConnectionIfNecessary__block_invoke;
    v19[3] = &unk_1E4BCDFF8;
    objc_copyWeak(&v20, &location);
    objc_msgSend(v11, "setInvalidationHandler:", v19);
    v17[0] = v13;
    v17[1] = 3221225472;
    v17[2] = __59__MapsSuggestionsRemoteSource__q_openConnectionIfNecessary__block_invoke_156;
    v17[3] = &unk_1E4BCDFF8;
    objc_copyWeak(&v18, &location);
    objc_msgSend(v11, "setInterruptionHandler:", v17);
    objc_storeStrong((id *)(a1 + 24), v11);
    objc_msgSend(v11, "resume");
    GEOFindOrCreateLog();
    v14 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend((id)a1, "uniqueName");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v23 = v15;
      v24 = 2080;
      v25 = "openingConnection";
      _os_log_impl(&dword_1A427D000, v14, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s END", buf, 0x16u);

    }
    GEOFindOrCreateLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v16))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A427D000, v16, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "openingConnection", ", buf, 2u);
    }

    objc_destroyWeak(&v18);
    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);

  }
}

void __59__MapsSuggestionsRemoteSource__q_openConnectionIfNecessary__block_invoke(uint64_t a1)
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
    v4 = WeakRetained[4];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __59__MapsSuggestionsRemoteSource__q_openConnectionIfNecessary__block_invoke_154;
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
      v9 = "MapsSuggestionsRemoteSource.m";
      v10 = 1026;
      v11 = 88;
      v12 = 2082;
      v13 = "-[MapsSuggestionsRemoteSource _q_openConnectionIfNecessary]_block_invoke";
      _os_log_impl(&dword_1A427D000, v5, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
    }

  }
}

void __59__MapsSuggestionsRemoteSource__q_openConnectionIfNecessary__block_invoke_154(uint64_t a1)
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
      v4 = (char *)WeakRetained[3];
      v7 = 138412290;
      v8 = v4;
      _os_log_impl(&dword_1A427D000, v3, OS_LOG_TYPE_DEBUG, "XPC connection {%@} became invalid", (uint8_t *)&v7, 0xCu);
    }

    v5 = (void *)WeakRetained[3];
    WeakRetained[3] = 0;

    *((_BYTE *)WeakRetained + 40) = 0;
  }
  else
  {
    v6 = v2;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = 136446722;
      v8 = "MapsSuggestionsRemoteSource.m";
      v9 = 1026;
      v10 = 90;
      v11 = 2082;
      v12 = "-[MapsSuggestionsRemoteSource _q_openConnectionIfNecessary]_block_invoke";
      _os_log_impl(&dword_1A427D000, v6, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: innerStrongSelf went away in %{public}s", (uint8_t *)&v7, 0x1Cu);
    }

  }
}

void __59__MapsSuggestionsRemoteSource__q_openConnectionIfNecessary__block_invoke_156(uint64_t a1)
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
    v4 = WeakRetained[4];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __59__MapsSuggestionsRemoteSource__q_openConnectionIfNecessary__block_invoke_157;
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
      v9 = "MapsSuggestionsRemoteSource.m";
      v10 = 1026;
      v11 = 98;
      v12 = 2082;
      v13 = "-[MapsSuggestionsRemoteSource _q_openConnectionIfNecessary]_block_invoke";
      _os_log_impl(&dword_1A427D000, v5, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
    }

  }
}

void __59__MapsSuggestionsRemoteSource__q_openConnectionIfNecessary__block_invoke_157(uint64_t a1)
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
      v4 = (char *)WeakRetained[3];
      v6 = 138412290;
      v7 = v4;
      _os_log_impl(&dword_1A427D000, v3, OS_LOG_TYPE_DEBUG, "XPC connection {%@} got interrupted", (uint8_t *)&v6, 0xCu);
    }

    -[MapsSuggestionsRemoteSource _q_closeConnection]((uint64_t)WeakRetained);
  }
  else
  {
    v5 = v2;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = 136446722;
      v7 = "MapsSuggestionsRemoteSource.m";
      v8 = 1026;
      v9 = 100;
      v10 = 2082;
      v11 = "-[MapsSuggestionsRemoteSource _q_openConnectionIfNecessary]_block_invoke";
      _os_log_impl(&dword_1A427D000, v5, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: innerStrongSelf went away in %{public}s", (uint8_t *)&v6, 0x1Cu);
    }

  }
}

- (void)_q_closeConnection
{
  NSObject *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  int v9;
  void *v10;
  __int16 v11;
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    GEOFindOrCreateLog();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend((id)a1, "uniqueName");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138412546;
      v10 = v3;
      v11 = 2080;
      v12 = "_q_closeConnection";
      _os_log_impl(&dword_1A427D000, v2, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s BEGIN", (uint8_t *)&v9, 0x16u);

    }
    GEOFindOrCreateLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v4))
    {
      LOWORD(v9) = 0;
      _os_signpost_emit_with_name_impl(&dword_1A427D000, v4, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "_q_closeConnection", ", (uint8_t *)&v9, 2u);
    }

    objc_msgSend(*(id *)(a1 + 24), "setInterruptionHandler:", 0);
    objc_msgSend(*(id *)(a1 + 24), "setInvalidationHandler:", 0);
    objc_msgSend(*(id *)(a1 + 24), "invalidate");
    v5 = *(void **)(a1 + 24);
    *(_QWORD *)(a1 + 24) = 0;

    *(_BYTE *)(a1 + 40) = 0;
    GEOFindOrCreateLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend((id)a1, "uniqueName");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138412546;
      v10 = v7;
      v11 = 2080;
      v12 = "_q_closeConnection";
      _os_log_impl(&dword_1A427D000, v6, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s END", (uint8_t *)&v9, 0x16u);

    }
    GEOFindOrCreateLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v8))
    {
      LOWORD(v9) = 0;
      _os_signpost_emit_with_name_impl(&dword_1A427D000, v8, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "_q_closeConnection", ", (uint8_t *)&v9, 2u);
    }

  }
}

+ (BOOL)isEnabled
{
  return GEOConfigGetBOOL();
}

+ (unint64_t)disposition
{
  return 2;
}

- (id)initFromResourceDepot:(id)a3 name:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  MapsSuggestionsRemoteSource *v10;
  NSObject *v11;
  dispatch_queue_t v12;
  OS_dispatch_queue *queue;
  MapsSuggestionsRemoteSource *v14;
  NSObject *v15;
  const char *v16;
  objc_super v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  const char *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!v6)
  {
    GEOFindOrCreateLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v20 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsRemoteSource.m";
      v21 = 1024;
      v22 = 147;
      v23 = 2082;
      v24 = "-[MapsSuggestionsRemoteSource initFromResourceDepot:name:]";
      v25 = 2082;
      v26 = "nil == (resourceDepot)";
      v16 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a resource depot to buid!";
LABEL_10:
      _os_log_impl(&dword_1A427D000, v15, OS_LOG_TYPE_ERROR, v16, buf, 0x26u);
    }
LABEL_11:

    v14 = 0;
    goto LABEL_12;
  }
  objc_msgSend(v6, "oneSourceDelegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    GEOFindOrCreateLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v20 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsRemoteSource.m";
      v21 = 1024;
      v22 = 148;
      v23 = 2082;
      v24 = "-[MapsSuggestionsRemoteSource initFromResourceDepot:name:]";
      v25 = 2082;
      v26 = "nil == (resourceDepot.oneSourceDelegate)";
      v16 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires one SourceDelegate!";
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  objc_msgSend(v6, "oneSourceDelegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v18.receiver = self;
  v18.super_class = (Class)MapsSuggestionsRemoteSource;
  v10 = -[MapsSuggestionsBaseSource initWithDelegate:name:](&v18, sel_initWithDelegate_name_, v9, v7);

  if (v10)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = dispatch_queue_create("MapsSuggestionsXPCSourceQueue", v11);
    queue = v10->_queue;
    v10->_queue = (OS_dispatch_queue *)v12;

  }
  self = v10;
  v14 = self;
LABEL_12:

  return v14;
}

- (void)dealloc
{
  NSXPCConnection *connection;
  OS_dispatch_queue *queue;
  objc_super v5;

  -[MapsSuggestionsRemoteSource _q_closeConnection]((uint64_t)self);
  connection = self->_connection;
  self->_connection = 0;

  queue = self->_queue;
  self->_queue = 0;

  v5.receiver = self;
  v5.super_class = (Class)MapsSuggestionsRemoteSource;
  -[MapsSuggestionsRemoteSource dealloc](&v5, sel_dealloc);
}

- (void)start
{
  NSObject *v3;
  void *v4;
  NSObject *v5;
  OS_dispatch_queue *v6;
  uint64_t v7;
  OS_dispatch_queue *v8;
  void *v9;
  id v10;
  NSObject *v11;
  _QWORD block[4];
  OS_dispatch_queue *v13;
  id v14;
  id v15;
  _QWORD aBlock[4];
  OS_dispatch_queue *v17;
  id v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  const char *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  GEOFindOrCreateLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    -[MapsSuggestionsBaseSource uniqueName](self, "uniqueName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v20 = v4;
    v21 = 2080;
    v22 = "start";
    _os_log_impl(&dword_1A427D000, v3, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s BEGIN", buf, 0x16u);

  }
  GEOFindOrCreateLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A427D000, v5, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "start", ", buf, 2u);
  }

  objc_initWeak((id *)buf, self);
  v6 = self->_queue;
  v7 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __36__MapsSuggestionsRemoteSource_start__block_invoke;
  aBlock[3] = &unk_1E4BCFA30;
  v8 = v6;
  v17 = v8;
  objc_copyWeak(&v18, (id *)buf);
  v9 = _Block_copy(aBlock);
  block[0] = v7;
  block[1] = 3221225472;
  block[2] = __36__MapsSuggestionsRemoteSource_start__block_invoke_170;
  block[3] = &unk_1E4BCFA58;
  objc_copyWeak(&v15, (id *)buf);
  v13 = v8;
  v14 = v9;
  v10 = v9;
  v11 = v8;
  dispatch_async(v11, block);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&v18);

  objc_destroyWeak((id *)buf);
}

void __36__MapsSuggestionsRemoteSource_start__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  _QWORD block[4];
  id v7;
  uint8_t buf[4];
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  GEOFindOrCreateLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v9 = v3;
    _os_log_impl(&dword_1A427D000, v4, OS_LOG_TYPE_ERROR, "start failed with error: %@", buf, 0xCu);
  }

  v5 = *(NSObject **)(a1 + 32);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __36__MapsSuggestionsRemoteSource_start__block_invoke_167;
  block[3] = &unk_1E4BCDFF8;
  objc_copyWeak(&v7, (id *)(a1 + 40));
  dispatch_async(v5, block);
  objc_destroyWeak(&v7);

}

void __36__MapsSuggestionsRemoteSource_start__block_invoke_167(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  NSObject *v3;
  char *v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  int v8;
  char *v9;
  __int16 v10;
  _WORD v11[17];

  *(_QWORD *)&v11[13] = *MEMORY[0x1E0C80C00];
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
      v8 = 138412546;
      v9 = v4;
      v10 = 2080;
      *(_QWORD *)v11 = "QoS";
      _os_log_impl(&dword_1A427D000, v3, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s FAIL", (uint8_t *)&v8, 0x16u);

    }
    GEOFindOrCreateLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v5))
    {
      LOWORD(v8) = 0;
      _os_signpost_emit_with_name_impl(&dword_1A427D000, v5, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "QoS", ", (uint8_t *)&v8, 2u);
    }

    v6 = (void *)*((_QWORD *)WeakRetained + 3);
    *((_QWORD *)WeakRetained + 3) = 0;

    *((_BYTE *)WeakRetained + 40) = 0;
  }
  else
  {
    v7 = v2;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = 136446722;
      v9 = "MapsSuggestionsRemoteSource.m";
      v10 = 1026;
      *(_DWORD *)v11 = 176;
      v11[2] = 2082;
      *(_QWORD *)&v11[3] = "-[MapsSuggestionsRemoteSource start]_block_invoke";
      _os_log_impl(&dword_1A427D000, v7, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelfErrorHandler went away in %{public}s", (uint8_t *)&v8, 0x1Cu);
    }

  }
}

void __36__MapsSuggestionsRemoteSource_start__block_invoke_170(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  id v4;
  NSObject *v5;
  NSObject *v6;
  char *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  char *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t);
  void *v16;
  NSObject *v17;
  id v18;
  uint8_t buf[4];
  char *v20;
  __int16 v21;
  _WORD v22[17];

  *(_QWORD *)&v22[13] = *MEMORY[0x1E0C80C00];
  v2 = (id *)(a1 + 48);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    -[MapsSuggestionsRemoteSource _q_openConnectionIfNecessary]((uint64_t)WeakRetained);
    if (*((_BYTE *)v4 + 40))
    {
      GEOFindOrCreateLog();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A427D000, v5, OS_LOG_TYPE_DEBUG, "WARNING: already started. Doing it again from the same XPC peer might confuse the daemon.", buf, 2u);
      }
    }
    else
    {
      *((_BYTE *)v4 + 40) = 1;
      GEOFindOrCreateLog();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(v4, "uniqueName");
        v7 = (char *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v20 = v7;
        v21 = 2080;
        *(_QWORD *)v22 = "QoS";
        _os_log_impl(&dword_1A427D000, v6, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s BEGIN", buf, 0x16u);

      }
      GEOFindOrCreateLog();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_signpost_enabled(v8))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1A427D000, v8, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "QoS", ", buf, 2u);
      }

      objc_msgSend(*((id *)v4 + 3), "remoteObjectProxyWithErrorHandler:", *(_QWORD *)(a1 + 40));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = MEMORY[0x1E0C809B0];
      v14 = 3221225472;
      v15 = __36__MapsSuggestionsRemoteSource_start__block_invoke_171;
      v16 = &unk_1E4BCEE28;
      v17 = *(id *)(a1 + 32);
      objc_copyWeak(&v18, v2);
      objc_msgSend(v9, "startMonitoringWithHandler:", &v13);

      GEOFindOrCreateLog();
      v10 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(v4, "uniqueName", v13, v14, v15, v16);
        v11 = (char *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v20 = v11;
        v21 = 2080;
        *(_QWORD *)v22 = "start";
        _os_log_impl(&dword_1A427D000, v10, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s END", buf, 0x16u);

      }
      GEOFindOrCreateLog();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_signpost_enabled(v12))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1A427D000, v12, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "start", ", buf, 2u);
      }

      objc_destroyWeak(&v18);
      v5 = v17;
    }
  }
  else
  {
    GEOFindOrCreateLog();
    v5 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v20 = "MapsSuggestionsRemoteSource.m";
      v21 = 1026;
      *(_DWORD *)v22 = 184;
      v22[2] = 2082;
      *(_QWORD *)&v22[3] = "-[MapsSuggestionsRemoteSource start]_block_invoke";
      _os_log_impl(&dword_1A427D000, v5, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
    }

  }
}

void __36__MapsSuggestionsRemoteSource_start__block_invoke_171(uint64_t a1)
{
  NSObject *v1;
  _QWORD block[4];
  id v3;

  v1 = *(NSObject **)(a1 + 32);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __36__MapsSuggestionsRemoteSource_start__block_invoke_2;
  block[3] = &unk_1E4BCDFF8;
  objc_copyWeak(&v3, (id *)(a1 + 40));
  dispatch_async(v1, block);
  objc_destroyWeak(&v3);
}

void __36__MapsSuggestionsRemoteSource_start__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  NSObject *v3;
  char *v4;
  NSObject *v5;
  int v6;
  char *v7;
  __int16 v8;
  _WORD v9[17];

  *(_QWORD *)&v9[13] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    -[MapsSuggestionsRemoteSource _q_closeConnection]((uint64_t)WeakRetained);
    GEOFindOrCreateLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v2, "uniqueName");
      v4 = (char *)objc_claimAutoreleasedReturnValue();
      v6 = 138412546;
      v7 = v4;
      v8 = 2080;
      *(_QWORD *)v9 = "QoS";
      _os_log_impl(&dword_1A427D000, v3, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s END", (uint8_t *)&v6, 0x16u);

    }
    GEOFindOrCreateLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v5))
    {
      LOWORD(v6) = 0;
      _os_signpost_emit_with_name_impl(&dword_1A427D000, v5, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "QoS", ", (uint8_t *)&v6, 2u);
    }
  }
  else
  {
    GEOFindOrCreateLog();
    v5 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = 136446722;
      v7 = "MapsSuggestionsRemoteSource.m";
      v8 = 1026;
      *(_DWORD *)v9 = 201;
      v9[2] = 2082;
      *(_QWORD *)&v9[3] = "-[MapsSuggestionsRemoteSource start]_block_invoke_2";
      _os_log_impl(&dword_1A427D000, v5, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf2 went away in %{public}s", (uint8_t *)&v6, 0x1Cu);
    }

  }
}

- (void)stop
{
  NSObject *v3;
  void *v4;
  NSObject *v5;
  NSObject *queue;
  _QWORD block[4];
  id v8;
  uint8_t buf[4];
  void *v10;
  __int16 v11;
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  GEOFindOrCreateLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    -[MapsSuggestionsBaseSource uniqueName](self, "uniqueName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v10 = v4;
    v11 = 2080;
    v12 = "stop";
    _os_log_impl(&dword_1A427D000, v3, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s BEGIN", buf, 0x16u);

  }
  GEOFindOrCreateLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A427D000, v5, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "stop", ", buf, 2u);
  }

  objc_initWeak((id *)buf, self);
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__MapsSuggestionsRemoteSource_stop__block_invoke;
  block[3] = &unk_1E4BCDFF8;
  objc_copyWeak(&v8, (id *)buf);
  dispatch_async(queue, block);
  objc_destroyWeak(&v8);
  objc_destroyWeak((id *)buf);
}

void __35__MapsSuggestionsRemoteSource_stop__block_invoke(uint64_t a1)
{
  id *v1;
  id *WeakRetained;
  id *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  char *v10;
  NSObject *v11;
  _QWORD v12[4];
  id v13;
  _QWORD aBlock[4];
  id v15;
  uint8_t buf[4];
  char *v17;
  __int16 v18;
  _WORD v19[17];

  *(_QWORD *)&v19[13] = *MEMORY[0x1E0C80C00];
  v1 = (id *)(a1 + 32);
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    if (*((_BYTE *)WeakRetained + 40))
    {
      *((_BYTE *)WeakRetained + 40) = 0;
      -[MapsSuggestionsRemoteSource _q_openConnectionIfNecessary]((uint64_t)WeakRetained);
      v4 = MEMORY[0x1E0C809B0];
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __35__MapsSuggestionsRemoteSource_stop__block_invoke_173;
      aBlock[3] = &unk_1E4BCE048;
      objc_copyWeak(&v15, v1);
      v5 = _Block_copy(aBlock);
      objc_msgSend(v3[3], "remoteObjectProxyWithErrorHandler:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v12[0] = v4;
      v12[1] = 3221225472;
      v12[2] = __35__MapsSuggestionsRemoteSource_stop__block_invoke_174;
      v12[3] = &unk_1E4BCDFF8;
      objc_copyWeak(&v13, v1);
      objc_msgSend(v6, "stopMonitoringWithHandler:", v12);

      objc_destroyWeak(&v13);
      objc_destroyWeak(&v15);
    }
    else
    {
      GEOFindOrCreateLog();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A427D000, v8, OS_LOG_TYPE_DEBUG, "WARNING: already stopped.", buf, 2u);
      }

      GEOFindOrCreateLog();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(v3, "uniqueName");
        v10 = (char *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v17 = v10;
        v18 = 2080;
        *(_QWORD *)v19 = "stop";
        _os_log_impl(&dword_1A427D000, v9, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s END", buf, 0x16u);

      }
      GEOFindOrCreateLog();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_signpost_enabled(v11))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1A427D000, v11, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "stop", ", buf, 2u);
      }

    }
  }
  else
  {
    GEOFindOrCreateLog();
    v7 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v17 = "MapsSuggestionsRemoteSource.m";
      v18 = 1026;
      *(_DWORD *)v19 = 216;
      v19[2] = 2082;
      *(_QWORD *)&v19[3] = "-[MapsSuggestionsRemoteSource stop]_block_invoke";
      _os_log_impl(&dword_1A427D000, v7, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
    }

  }
}

void __35__MapsSuggestionsRemoteSource_stop__block_invoke_173(uint64_t a1, void *a2)
{
  char *v3;
  NSObject *v4;
  id WeakRetained;
  NSObject *v6;
  NSObject *v7;
  char *v8;
  NSObject *v9;
  int v10;
  char *v11;
  __int16 v12;
  _WORD v13[17];

  *(_QWORD *)&v13[13] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  GEOFindOrCreateLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v10 = 138412290;
    v11 = v3;
    _os_log_impl(&dword_1A427D000, v4, OS_LOG_TYPE_ERROR, "stop failed with error: %@", (uint8_t *)&v10, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  GEOFindOrCreateLog();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (WeakRetained)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(WeakRetained, "uniqueName");
      v8 = (char *)objc_claimAutoreleasedReturnValue();
      v10 = 138412546;
      v11 = v8;
      v12 = 2080;
      *(_QWORD *)v13 = "stop";
      _os_log_impl(&dword_1A427D000, v7, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s FAIL", (uint8_t *)&v10, 0x16u);

    }
    GEOFindOrCreateLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v9))
    {
      LOWORD(v10) = 0;
      _os_signpost_emit_with_name_impl(&dword_1A427D000, v9, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "stop", ", (uint8_t *)&v10, 2u);
    }
  }
  else
  {
    v9 = v6;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = 136446722;
      v11 = "MapsSuggestionsRemoteSource.m";
      v12 = 1026;
      *(_DWORD *)v13 = 230;
      v13[2] = 2082;
      *(_QWORD *)&v13[3] = "-[MapsSuggestionsRemoteSource stop]_block_invoke";
      _os_log_impl(&dword_1A427D000, v9, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelfErrorHandler went away in %{public}s", (uint8_t *)&v10, 0x1Cu);
    }

  }
}

void __35__MapsSuggestionsRemoteSource_stop__block_invoke_174(uint64_t a1)
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
      *(_QWORD *)v9 = "stop";
      _os_log_impl(&dword_1A427D000, v3, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s END", (uint8_t *)&v6, 0x16u);

    }
    GEOFindOrCreateLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v5))
    {
      LOWORD(v6) = 0;
      _os_signpost_emit_with_name_impl(&dword_1A427D000, v5, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "stop", ", (uint8_t *)&v6, 2u);
    }
  }
  else
  {
    v5 = v2;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = 136446722;
      v7 = "MapsSuggestionsRemoteSource.m";
      v8 = 1026;
      *(_DWORD *)v9 = 235;
      v9[2] = 2082;
      *(_QWORD *)&v9[3] = "-[MapsSuggestionsRemoteSource stop]_block_invoke";
      _os_log_impl(&dword_1A427D000, v5, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf2 went away in %{public}s", (uint8_t *)&v6, 0x1Cu);
    }

  }
}

- (double)updateSuggestionEntriesWithHandler:(id)a3
{
  double result;

  -[MapsSuggestionsRemoteSource updateSuggestionEntriesOfType:handler:](self, "updateSuggestionEntriesOfType:handler:", 0, a3);
  return result;
}

- (double)updateSuggestionEntriesOfType:(int64_t)a3 handler:(id)a4
{
  void (**v6)(_QWORD);
  void *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  NSObject *queue;
  id v12;
  _QWORD v14[4];
  id v15;
  void (**v16)(_QWORD);
  id v17[2];
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  const char *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = (void (**)(_QWORD))a4;
  if (a3 && !-[MapsSuggestionsRemoteSource canProduceEntriesOfType:](self, "canProduceEntriesOfType:", a3))
  {
    if (v6)
      v6[2](v6);
  }
  else
  {
    NSStringFromMapsSuggestionsEntryType(a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    GEOFindOrCreateLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      -[MapsSuggestionsBaseSource uniqueName](self, "uniqueName");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v19 = v9;
      v20 = 2080;
      v21 = "updateSuggestionEntriesOfType:";
      _os_log_impl(&dword_1A427D000, v8, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s BEGIN", buf, 0x16u);

    }
    GEOFindOrCreateLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v10))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A427D000, v10, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "updateSuggestionEntriesOfType:", ", buf, 2u);
    }

    objc_initWeak((id *)buf, self);
    queue = self->_queue;
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __69__MapsSuggestionsRemoteSource_updateSuggestionEntriesOfType_handler___block_invoke;
    v14[3] = &unk_1E4BCFAA8;
    objc_copyWeak(v17, (id *)buf);
    v15 = v7;
    v16 = v6;
    v17[1] = (id)a3;
    v12 = v7;
    dispatch_async(queue, v14);

    objc_destroyWeak(v17);
    objc_destroyWeak((id *)buf);
  }

  return 0.0;
}

void __69__MapsSuggestionsRemoteSource_updateSuggestionEntriesOfType_handler___block_invoke(uint64_t a1)
{
  id *v2;
  id *WeakRetained;
  id *v4;
  _BOOL4 v5;
  NSObject *v6;
  NSObject *v7;
  char *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  NSObject *v17;
  char *v18;
  NSObject *v19;
  _QWORD v20[4];
  id v21;
  id v22;
  _QWORD aBlock[4];
  id v24;
  id v25;
  uint8_t buf[4];
  char *v27;
  __int16 v28;
  _BYTE v29[18];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v2 = (id *)(a1 + 48);
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    v5 = *((_BYTE *)WeakRetained + 40) == 0;
    GEOFindOrCreateLog();
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v5)
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A427D000, v7, OS_LOG_TYPE_ERROR, "Cannot update if we haven't been started.", buf, 2u);
      }

      v16 = *(_QWORD *)(a1 + 40);
      if (v16)
        (*(void (**)(void))(v16 + 16))();
      GEOFindOrCreateLog();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(v4, "uniqueName");
        v18 = (char *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v27 = v18;
        v28 = 2080;
        *(_QWORD *)v29 = "updateSuggestionEntriesOfType:";
        _os_log_impl(&dword_1A427D000, v17, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s FAIL", buf, 0x16u);

      }
      GEOFindOrCreateLog();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_signpost_enabled(v19))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1A427D000, v19, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "updateSuggestionEntriesOfType:", ", buf, 2u);
      }

    }
    else
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(v4, "uniqueName");
        v8 = (char *)objc_claimAutoreleasedReturnValue();
        v9 = *(_QWORD *)(a1 + 32);
        NSStringFromMapsSuggestionsCurrentBestLocation();
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v27 = v8;
        v28 = 2112;
        *(_QWORD *)v29 = v9;
        *(_WORD *)&v29[8] = 2112;
        *(_QWORD *)&v29[10] = v10;
        _os_log_impl(&dword_1A427D000, v7, OS_LOG_TYPE_DEBUG, "{MSgDebug} UPDATING SOURCE{%@} for TYPE{%@} at LATLONG{%@}", buf, 0x20u);

      }
      -[MapsSuggestionsRemoteSource _q_openConnectionIfNecessary]((uint64_t)v4);
      v11 = MEMORY[0x1E0C809B0];
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __69__MapsSuggestionsRemoteSource_updateSuggestionEntriesOfType_handler___block_invoke_176;
      aBlock[3] = &unk_1E4BCDB68;
      objc_copyWeak(&v25, v2);
      v24 = *(id *)(a1 + 40);
      v12 = _Block_copy(aBlock);
      objc_msgSend(v4[3], "remoteObjectProxyWithErrorHandler:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = *(_QWORD *)(a1 + 56);
      v20[0] = v11;
      v20[1] = 3221225472;
      v20[2] = __69__MapsSuggestionsRemoteSource_updateSuggestionEntriesOfType_handler___block_invoke_177;
      v20[3] = &unk_1E4BCEB98;
      objc_copyWeak(&v22, v2);
      v21 = *(id *)(a1 + 40);
      objc_msgSend(v13, "forceEarlyUpdateForType:handler:", v14, v20);

      objc_destroyWeak(&v22);
      objc_destroyWeak(&v25);
    }
  }
  else
  {
    GEOFindOrCreateLog();
    v15 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v27 = "MapsSuggestionsRemoteSource.m";
      v28 = 1026;
      *(_DWORD *)v29 = 261;
      *(_WORD *)&v29[4] = 2082;
      *(_QWORD *)&v29[6] = "-[MapsSuggestionsRemoteSource updateSuggestionEntriesOfType:handler:]_block_invoke";
      _os_log_impl(&dword_1A427D000, v15, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
    }

  }
}

void __69__MapsSuggestionsRemoteSource_updateSuggestionEntriesOfType_handler___block_invoke_176(uint64_t a1, void *a2)
{
  char *v3;
  NSObject *v4;
  id WeakRetained;
  uint64_t v6;
  NSObject *v7;
  char *v8;
  NSObject *v9;
  int v10;
  char *v11;
  __int16 v12;
  _WORD v13[17];

  *(_QWORD *)&v13[13] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  GEOFindOrCreateLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v10 = 138412290;
    v11 = v3;
    _os_log_impl(&dword_1A427D000, v4, OS_LOG_TYPE_ERROR, "updateSuggestionEntriesOfType: failed with error: %@", (uint8_t *)&v10, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v6 = *(_QWORD *)(a1 + 32);
    if (v6)
      (*(void (**)(void))(v6 + 16))();
    GEOFindOrCreateLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(WeakRetained, "uniqueName");
      v8 = (char *)objc_claimAutoreleasedReturnValue();
      v10 = 138412546;
      v11 = v8;
      v12 = 2080;
      *(_QWORD *)v13 = "updateSuggestionEntriesOfType:";
      _os_log_impl(&dword_1A427D000, v7, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s FAIL", (uint8_t *)&v10, 0x16u);

    }
    GEOFindOrCreateLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v9))
    {
      LOWORD(v10) = 0;
      _os_signpost_emit_with_name_impl(&dword_1A427D000, v9, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "updateSuggestionEntriesOfType:", ", (uint8_t *)&v10, 2u);
    }
  }
  else
  {
    GEOFindOrCreateLog();
    v9 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = 136446722;
      v11 = "MapsSuggestionsRemoteSource.m";
      v12 = 1026;
      *(_DWORD *)v13 = 274;
      v13[2] = 2082;
      *(_QWORD *)&v13[3] = "-[MapsSuggestionsRemoteSource updateSuggestionEntriesOfType:handler:]_block_invoke";
      _os_log_impl(&dword_1A427D000, v9, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelfErrorHandler went away in %{public}s", (uint8_t *)&v10, 0x1Cu);
    }

  }
}

void __69__MapsSuggestionsRemoteSource_updateSuggestionEntriesOfType_handler___block_invoke_177(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  NSObject *v4;
  char *v5;
  NSObject *v6;
  int v7;
  char *v8;
  __int16 v9;
  _WORD v10[17];

  *(_QWORD *)&v10[13] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = *(_QWORD *)(a1 + 32);
    if (v3)
      (*(void (**)(void))(v3 + 16))();
    GEOFindOrCreateLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(WeakRetained, "uniqueName");
      v5 = (char *)objc_claimAutoreleasedReturnValue();
      v7 = 138412546;
      v8 = v5;
      v9 = 2080;
      *(_QWORD *)v10 = "updateSuggestionEntriesOfType:";
      _os_log_impl(&dword_1A427D000, v4, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s END", (uint8_t *)&v7, 0x16u);

    }
    GEOFindOrCreateLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v6))
    {
      LOWORD(v7) = 0;
      _os_signpost_emit_with_name_impl(&dword_1A427D000, v6, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "updateSuggestionEntriesOfType:", ", (uint8_t *)&v7, 2u);
    }
  }
  else
  {
    GEOFindOrCreateLog();
    v6 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = 136446722;
      v8 = "MapsSuggestionsRemoteSource.m";
      v9 = 1026;
      *(_DWORD *)v10 = 280;
      v10[2] = 2082;
      *(_QWORD *)&v10[3] = "-[MapsSuggestionsRemoteSource updateSuggestionEntriesOfType:handler:]_block_invoke";
      _os_log_impl(&dword_1A427D000, v6, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf2 went away in %{public}s", (uint8_t *)&v7, 0x1Cu);
    }

  }
}

- (BOOL)canProduceEntriesOfType:(int64_t)a3
{
  _BOOL4 v3;
  NSObject *v4;
  int v6;
  const char *v7;
  __int16 v8;
  int v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if ((unint64_t)a3 >= 0x19)
  {
    GEOFindOrCreateLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v6 = 136446978;
      v7 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsRemoteSource.m";
      v8 = 1024;
      v9 = 334;
      v10 = 2082;
      v11 = "-[MapsSuggestionsRemoteSource canProduceEntriesOfType:]";
      v12 = 2082;
      v13 = "YES";
      _os_log_impl(&dword_1A427D000, v4, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Detected an unsupported MapsSuggestionsEntryType!", (uint8_t *)&v6, 0x26u);
    }

    LOBYTE(v3) = 0;
  }
  else
  {
    return (0x1FFFDBEu >> a3) & 1;
  }
  return v3;
}

- (BOOL)removeEntry:(id)a3 behavior:(int64_t)a4 handler:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  NSObject *queue;
  id v14;
  id v15;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20[2];
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  const char *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  GEOFindOrCreateLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    -[MapsSuggestionsBaseSource uniqueName](self, "uniqueName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v22 = v11;
    v23 = 2080;
    v24 = "removeEntry:behavior:";
    _os_log_impl(&dword_1A427D000, v10, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s BEGIN", buf, 0x16u);

  }
  GEOFindOrCreateLog();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v12))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A427D000, v12, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "removeEntry:behavior:", ", buf, 2u);
  }

  objc_initWeak((id *)buf, self);
  queue = self->_queue;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __60__MapsSuggestionsRemoteSource_removeEntry_behavior_handler___block_invoke;
  v17[3] = &unk_1E4BCFAA8;
  objc_copyWeak(v20, (id *)buf);
  v18 = v8;
  v19 = v9;
  v20[1] = (id)a4;
  v14 = v9;
  v15 = v8;
  dispatch_async(queue, v17);

  objc_destroyWeak(v20);
  objc_destroyWeak((id *)buf);
  return 1;
}

void __60__MapsSuggestionsRemoteSource_removeEntry_behavior_handler___block_invoke(uint64_t a1)
{
  id *v2;
  id *WeakRetained;
  id *v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  _QWORD v11[4];
  id v12;
  id v13;
  _QWORD aBlock[4];
  id v15;
  id v16;
  uint8_t buf[4];
  char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  const char *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v2 = (id *)(a1 + 48);
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    if (!*((_BYTE *)WeakRetained + 40))
    {
      GEOFindOrCreateLog();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A427D000, v5, OS_LOG_TYPE_ERROR, "Cannot removeEntry if we haven't been started. Still continuing.", buf, 2u);
      }

    }
    -[MapsSuggestionsRemoteSource _q_openConnectionIfNecessary]((uint64_t)v4);
    objc_msgSend(*(id *)(a1 + 32), "data");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __60__MapsSuggestionsRemoteSource_removeEntry_behavior_handler___block_invoke_180;
    aBlock[3] = &unk_1E4BCDB68;
    objc_copyWeak(&v16, v2);
    v15 = *(id *)(a1 + 40);
    v8 = _Block_copy(aBlock);
    objc_msgSend(v4[3], "remoteObjectProxyWithErrorHandler:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(a1 + 56);
    v11[0] = v7;
    v11[1] = 3221225472;
    v11[2] = __60__MapsSuggestionsRemoteSource_removeEntry_behavior_handler___block_invoke_181;
    v11[3] = &unk_1E4BCFA80;
    v12 = *(id *)(a1 + 40);
    objc_copyWeak(&v13, v2);
    objc_msgSend(v9, "removeEntryData:behavior:handler:", v6, v10, v11);

    objc_destroyWeak(&v13);
    objc_destroyWeak(&v16);
  }
  else
  {
    GEOFindOrCreateLog();
    v6 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v18 = "MapsSuggestionsRemoteSource.m";
      v19 = 1026;
      v20 = 345;
      v21 = 2082;
      v22 = "-[MapsSuggestionsRemoteSource removeEntry:behavior:handler:]_block_invoke";
      _os_log_impl(&dword_1A427D000, v6, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
    }

  }
}

void __60__MapsSuggestionsRemoteSource_removeEntry_behavior_handler___block_invoke_180(uint64_t a1, void *a2)
{
  char *v3;
  NSObject *v4;
  id WeakRetained;
  uint64_t v6;
  NSObject *v7;
  char *v8;
  NSObject *v9;
  int v10;
  char *v11;
  __int16 v12;
  _WORD v13[17];

  *(_QWORD *)&v13[13] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  GEOFindOrCreateLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v10 = 138412290;
    v11 = v3;
    _os_log_impl(&dword_1A427D000, v4, OS_LOG_TYPE_ERROR, "removeEntry:behavior: failed with error: %@", (uint8_t *)&v10, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v6 = *(_QWORD *)(a1 + 32);
    if (v6)
      (*(void (**)(void))(v6 + 16))();
    GEOFindOrCreateLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(WeakRetained, "uniqueName");
      v8 = (char *)objc_claimAutoreleasedReturnValue();
      v10 = 138412546;
      v11 = v8;
      v12 = 2080;
      *(_QWORD *)v13 = "removeEntry:behavior:";
      _os_log_impl(&dword_1A427D000, v7, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s FAIL", (uint8_t *)&v10, 0x16u);

    }
    GEOFindOrCreateLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v9))
    {
      LOWORD(v10) = 0;
      _os_signpost_emit_with_name_impl(&dword_1A427D000, v9, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "removeEntry:behavior:", ", (uint8_t *)&v10, 2u);
    }
  }
  else
  {
    GEOFindOrCreateLog();
    v9 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = 136446722;
      v11 = "MapsSuggestionsRemoteSource.m";
      v12 = 1026;
      *(_DWORD *)v13 = 354;
      v13[2] = 2082;
      *(_QWORD *)&v13[3] = "-[MapsSuggestionsRemoteSource removeEntry:behavior:handler:]_block_invoke";
      _os_log_impl(&dword_1A427D000, v9, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelfErrorHandler went away in %{public}s", (uint8_t *)&v10, 0x1Cu);
    }

  }
}

void __60__MapsSuggestionsRemoteSource_removeEntry_behavior_handler___block_invoke_181(uint64_t a1)
{
  uint64_t v2;
  id WeakRetained;
  NSObject *v4;
  NSObject *v5;
  char *v6;
  NSObject *v7;
  int v8;
  char *v9;
  __int16 v10;
  _WORD v11[17];

  *(_QWORD *)&v11[13] = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  GEOFindOrCreateLog();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (WeakRetained)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(WeakRetained, "uniqueName");
      v6 = (char *)objc_claimAutoreleasedReturnValue();
      v8 = 138412546;
      v9 = v6;
      v10 = 2080;
      *(_QWORD *)v11 = "removeEntry:behavior:";
      _os_log_impl(&dword_1A427D000, v5, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s END", (uint8_t *)&v8, 0x16u);

    }
    GEOFindOrCreateLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v7))
    {
      LOWORD(v8) = 0;
      _os_signpost_emit_with_name_impl(&dword_1A427D000, v7, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "removeEntry:behavior:", ", (uint8_t *)&v8, 2u);
    }
  }
  else
  {
    v7 = v4;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = 136446722;
      v9 = "MapsSuggestionsRemoteSource.m";
      v10 = 1026;
      *(_DWORD *)v11 = 361;
      v11[2] = 2082;
      *(_QWORD *)&v11[3] = "-[MapsSuggestionsRemoteSource removeEntry:behavior:handler:]_block_invoke";
      _os_log_impl(&dword_1A427D000, v7, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf2 went away in %{public}s", (uint8_t *)&v8, 0x1Cu);
    }

  }
}

- (void)feedbackForEntry:(id)a3 action:(int64_t)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  NSObject *queue;
  id v11;
  _QWORD block[4];
  id v13;
  id v14[2];
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  const char *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  GEOFindOrCreateLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    -[MapsSuggestionsBaseSource uniqueName](self, "uniqueName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v16 = v8;
    v17 = 2080;
    v18 = "feedbackForEntryData";
    _os_log_impl(&dword_1A427D000, v7, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s BEGIN", buf, 0x16u);

  }
  GEOFindOrCreateLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A427D000, v9, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "feedbackForEntryData", ", buf, 2u);
  }

  objc_initWeak((id *)buf, self);
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__MapsSuggestionsRemoteSource_feedbackForEntry_action___block_invoke;
  block[3] = &unk_1E4BCFAD0;
  objc_copyWeak(v14, (id *)buf);
  v13 = v6;
  v14[1] = (id)a4;
  v11 = v6;
  dispatch_async(queue, block);

  objc_destroyWeak(v14);
  objc_destroyWeak((id *)buf);
}

void __55__MapsSuggestionsRemoteSource_feedbackForEntry_action___block_invoke(uint64_t a1)
{
  id *v2;
  id *WeakRetained;
  id *v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  char *v10;
  NSObject *v11;
  _QWORD aBlock[4];
  id v13;
  uint8_t buf[4];
  char *v15;
  __int16 v16;
  _WORD v17[17];

  *(_QWORD *)&v17[13] = *MEMORY[0x1E0C80C00];
  v2 = (id *)(a1 + 40);
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    if (!*((_BYTE *)WeakRetained + 40))
    {
      GEOFindOrCreateLog();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A427D000, v5, OS_LOG_TYPE_DEBUG, "We haven't been started, but processing feedbackForEntry", buf, 2u);
      }

    }
    -[MapsSuggestionsRemoteSource _q_openConnectionIfNecessary]((uint64_t)v4);
    objc_msgSend(*(id *)(a1 + 32), "data");
    v6 = objc_claimAutoreleasedReturnValue();
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __55__MapsSuggestionsRemoteSource_feedbackForEntry_action___block_invoke_183;
    aBlock[3] = &unk_1E4BCE048;
    objc_copyWeak(&v13, v2);
    v7 = _Block_copy(aBlock);
    objc_msgSend(v4[3], "remoteObjectProxyWithErrorHandler:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "feedbackForEntryData:action:", v6, *(_QWORD *)(a1 + 48));

    GEOFindOrCreateLog();
    v9 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v4, "uniqueName");
      v10 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v15 = v10;
      v16 = 2080;
      *(_QWORD *)v17 = "feedbackForEntryData";
      _os_log_impl(&dword_1A427D000, v9, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s END", buf, 0x16u);

    }
    GEOFindOrCreateLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v11))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A427D000, v11, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "feedbackForEntryData", ", buf, 2u);
    }

    objc_destroyWeak(&v13);
  }
  else
  {
    GEOFindOrCreateLog();
    v6 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v15 = "MapsSuggestionsRemoteSource.m";
      v16 = 1026;
      *(_DWORD *)v17 = 375;
      v17[2] = 2082;
      *(_QWORD *)&v17[3] = "-[MapsSuggestionsRemoteSource feedbackForEntry:action:]_block_invoke";
      _os_log_impl(&dword_1A427D000, v6, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
    }

  }
}

void __55__MapsSuggestionsRemoteSource_feedbackForEntry_action___block_invoke_183(uint64_t a1, void *a2)
{
  char *v3;
  NSObject *v4;
  id WeakRetained;
  NSObject *v6;
  NSObject *v7;
  char *v8;
  NSObject *v9;
  int v10;
  char *v11;
  __int16 v12;
  _WORD v13[17];

  *(_QWORD *)&v13[13] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  GEOFindOrCreateLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v10 = 138412290;
    v11 = v3;
    _os_log_impl(&dword_1A427D000, v4, OS_LOG_TYPE_ERROR, "feedbackForEntryData failed with error: %@", (uint8_t *)&v10, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  GEOFindOrCreateLog();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (WeakRetained)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(WeakRetained, "uniqueName");
      v8 = (char *)objc_claimAutoreleasedReturnValue();
      v10 = 138412546;
      v11 = v8;
      v12 = 2080;
      *(_QWORD *)v13 = "feedbackForEntryData";
      _os_log_impl(&dword_1A427D000, v7, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s FAIL", (uint8_t *)&v10, 0x16u);

    }
    GEOFindOrCreateLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v9))
    {
      LOWORD(v10) = 0;
      _os_signpost_emit_with_name_impl(&dword_1A427D000, v9, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "feedbackForEntryData", ", (uint8_t *)&v10, 2u);
    }
  }
  else
  {
    v9 = v6;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = 136446722;
      v11 = "MapsSuggestionsRemoteSource.m";
      v12 = 1026;
      *(_DWORD *)v13 = 384;
      v13[2] = 2082;
      *(_QWORD *)&v13[3] = "-[MapsSuggestionsRemoteSource feedbackForEntry:action:]_block_invoke";
      _os_log_impl(&dword_1A427D000, v9, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelfErrorHandler went away in %{public}s", (uint8_t *)&v10, 0x1Cu);
    }

  }
}

- (void)feedbackForMapItem:(id)a3 action:(int64_t)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  NSObject *queue;
  id v11;
  _QWORD block[4];
  id v13;
  id v14[2];
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  const char *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  GEOFindOrCreateLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    -[MapsSuggestionsBaseSource uniqueName](self, "uniqueName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v16 = v8;
    v17 = 2080;
    v18 = "feedbackForMapItem";
    _os_log_impl(&dword_1A427D000, v7, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s BEGIN", buf, 0x16u);

  }
  GEOFindOrCreateLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A427D000, v9, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "feedbackForMapItem", ", buf, 2u);
  }

  objc_initWeak((id *)buf, self);
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__MapsSuggestionsRemoteSource_feedbackForMapItem_action___block_invoke;
  block[3] = &unk_1E4BCFAD0;
  objc_copyWeak(v14, (id *)buf);
  v13 = v6;
  v14[1] = (id)a4;
  v11 = v6;
  dispatch_async(queue, block);

  objc_destroyWeak(v14);
  objc_destroyWeak((id *)buf);
}

void __57__MapsSuggestionsRemoteSource_feedbackForMapItem_action___block_invoke(uint64_t a1)
{
  id *v2;
  id *WeakRetained;
  id *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  char *v9;
  NSObject *v10;
  NSObject *v11;
  _QWORD aBlock[4];
  id v13;
  uint8_t buf[4];
  char *v15;
  __int16 v16;
  _WORD v17[17];

  *(_QWORD *)&v17[13] = *MEMORY[0x1E0C80C00];
  v2 = (id *)(a1 + 40);
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    if (!*((_BYTE *)WeakRetained + 40))
    {
      GEOFindOrCreateLog();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A427D000, v5, OS_LOG_TYPE_DEBUG, "We haven't been started, but processing feedbackForMapItem", buf, 2u);
      }

    }
    -[MapsSuggestionsRemoteSource _q_openConnectionIfNecessary]((uint64_t)v4);
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __57__MapsSuggestionsRemoteSource_feedbackForMapItem_action___block_invoke_185;
    aBlock[3] = &unk_1E4BCE048;
    objc_copyWeak(&v13, v2);
    v6 = _Block_copy(aBlock);
    objc_msgSend(v4[3], "remoteObjectProxyWithErrorHandler:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "feedbackForMapItem:action:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));

    GEOFindOrCreateLog();
    v8 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v4, "uniqueName");
      v9 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v15 = v9;
      v16 = 2080;
      *(_QWORD *)v17 = "feedbackForMapItem";
      _os_log_impl(&dword_1A427D000, v8, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s END", buf, 0x16u);

    }
    GEOFindOrCreateLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v10))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A427D000, v10, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "feedbackForMapItem", ", buf, 2u);
    }

    objc_destroyWeak(&v13);
  }
  else
  {
    GEOFindOrCreateLog();
    v11 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v15 = "MapsSuggestionsRemoteSource.m";
      v16 = 1026;
      *(_DWORD *)v17 = 400;
      v17[2] = 2082;
      *(_QWORD *)&v17[3] = "-[MapsSuggestionsRemoteSource feedbackForMapItem:action:]_block_invoke";
      _os_log_impl(&dword_1A427D000, v11, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
    }

  }
}

void __57__MapsSuggestionsRemoteSource_feedbackForMapItem_action___block_invoke_185(uint64_t a1, void *a2)
{
  char *v3;
  NSObject *v4;
  id WeakRetained;
  NSObject *v6;
  NSObject *v7;
  char *v8;
  NSObject *v9;
  int v10;
  char *v11;
  __int16 v12;
  _WORD v13[17];

  *(_QWORD *)&v13[13] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  GEOFindOrCreateLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v10 = 138412290;
    v11 = v3;
    _os_log_impl(&dword_1A427D000, v4, OS_LOG_TYPE_ERROR, "feedbackForMapItem failed with error: %@", (uint8_t *)&v10, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  GEOFindOrCreateLog();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (WeakRetained)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(WeakRetained, "uniqueName");
      v8 = (char *)objc_claimAutoreleasedReturnValue();
      v10 = 138412546;
      v11 = v8;
      v12 = 2080;
      *(_QWORD *)v13 = "feedbackForMapItem";
      _os_log_impl(&dword_1A427D000, v7, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s FAIL", (uint8_t *)&v10, 0x16u);

    }
    GEOFindOrCreateLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v9))
    {
      LOWORD(v10) = 0;
      _os_signpost_emit_with_name_impl(&dword_1A427D000, v9, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "feedbackForMapItem", ", (uint8_t *)&v10, 2u);
    }
  }
  else
  {
    v9 = v6;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = 136446722;
      v11 = "MapsSuggestionsRemoteSource.m";
      v12 = 1026;
      *(_DWORD *)v13 = 408;
      v13[2] = 2082;
      *(_QWORD *)&v13[3] = "-[MapsSuggestionsRemoteSource feedbackForMapItem:action:]_block_invoke";
      _os_log_impl(&dword_1A427D000, v9, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelfErrorHandler went away in %{public}s", (uint8_t *)&v10, 0x1Cu);
    }

  }
}

- (void)feedbackForContact:(id)a3 action:(int64_t)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  NSObject *queue;
  id v11;
  _QWORD block[4];
  id v13;
  id v14[2];
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  const char *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  GEOFindOrCreateLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    -[MapsSuggestionsBaseSource uniqueName](self, "uniqueName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v16 = v8;
    v17 = 2080;
    v18 = "feedbackForContact";
    _os_log_impl(&dword_1A427D000, v7, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s BEGIN", buf, 0x16u);

  }
  GEOFindOrCreateLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A427D000, v9, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "feedbackForContact", ", buf, 2u);
  }

  objc_initWeak((id *)buf, self);
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__MapsSuggestionsRemoteSource_feedbackForContact_action___block_invoke;
  block[3] = &unk_1E4BCFAD0;
  objc_copyWeak(v14, (id *)buf);
  v13 = v6;
  v14[1] = (id)a4;
  v11 = v6;
  dispatch_async(queue, block);

  objc_destroyWeak(v14);
  objc_destroyWeak((id *)buf);
}

void __57__MapsSuggestionsRemoteSource_feedbackForContact_action___block_invoke(uint64_t a1)
{
  id *v2;
  id *WeakRetained;
  id *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  char *v9;
  NSObject *v10;
  NSObject *v11;
  _QWORD aBlock[4];
  id v13;
  uint8_t buf[4];
  char *v15;
  __int16 v16;
  _WORD v17[17];

  *(_QWORD *)&v17[13] = *MEMORY[0x1E0C80C00];
  v2 = (id *)(a1 + 40);
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    if (!*((_BYTE *)WeakRetained + 40))
    {
      GEOFindOrCreateLog();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A427D000, v5, OS_LOG_TYPE_DEBUG, "We haven't been started, but processing feedbackForContact", buf, 2u);
      }

    }
    -[MapsSuggestionsRemoteSource _q_openConnectionIfNecessary]((uint64_t)v4);
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __57__MapsSuggestionsRemoteSource_feedbackForContact_action___block_invoke_187;
    aBlock[3] = &unk_1E4BCE048;
    objc_copyWeak(&v13, v2);
    v6 = _Block_copy(aBlock);
    objc_msgSend(v4[3], "remoteObjectProxyWithErrorHandler:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "feedbackForContact:action:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));

    GEOFindOrCreateLog();
    v8 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v4, "uniqueName");
      v9 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v15 = v9;
      v16 = 2080;
      *(_QWORD *)v17 = "feedbackForContact";
      _os_log_impl(&dword_1A427D000, v8, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s END", buf, 0x16u);

    }
    GEOFindOrCreateLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v10))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A427D000, v10, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "feedbackForContact", ", buf, 2u);
    }

    objc_destroyWeak(&v13);
  }
  else
  {
    GEOFindOrCreateLog();
    v11 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v15 = "MapsSuggestionsRemoteSource.m";
      v16 = 1026;
      *(_DWORD *)v17 = 424;
      v17[2] = 2082;
      *(_QWORD *)&v17[3] = "-[MapsSuggestionsRemoteSource feedbackForContact:action:]_block_invoke";
      _os_log_impl(&dword_1A427D000, v11, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
    }

  }
}

void __57__MapsSuggestionsRemoteSource_feedbackForContact_action___block_invoke_187(uint64_t a1, void *a2)
{
  char *v3;
  NSObject *v4;
  id WeakRetained;
  NSObject *v6;
  NSObject *v7;
  char *v8;
  NSObject *v9;
  int v10;
  char *v11;
  __int16 v12;
  _WORD v13[17];

  *(_QWORD *)&v13[13] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  GEOFindOrCreateLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v10 = 138412290;
    v11 = v3;
    _os_log_impl(&dword_1A427D000, v4, OS_LOG_TYPE_ERROR, "feedbackForContact failed with error: %@", (uint8_t *)&v10, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  GEOFindOrCreateLog();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (WeakRetained)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(WeakRetained, "uniqueName");
      v8 = (char *)objc_claimAutoreleasedReturnValue();
      v10 = 138412546;
      v11 = v8;
      v12 = 2080;
      *(_QWORD *)v13 = "feedbackForContact";
      _os_log_impl(&dword_1A427D000, v7, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s FAIL", (uint8_t *)&v10, 0x16u);

    }
    GEOFindOrCreateLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v9))
    {
      LOWORD(v10) = 0;
      _os_signpost_emit_with_name_impl(&dword_1A427D000, v9, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "feedbackForContact", ", (uint8_t *)&v10, 2u);
    }
  }
  else
  {
    v9 = v6;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = 136446722;
      v11 = "MapsSuggestionsRemoteSource.m";
      v12 = 1026;
      *(_DWORD *)v13 = 432;
      v13[2] = 2082;
      *(_QWORD *)&v13[3] = "-[MapsSuggestionsRemoteSource feedbackForContact:action:]_block_invoke";
      _os_log_impl(&dword_1A427D000, v9, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelfErrorHandler went away in %{public}s", (uint8_t *)&v10, 0x1Cu);
    }

  }
}

- (void)Debug_updateGraph
{
  NSObject *v3;
  void *v4;
  NSObject *v5;
  NSObject *queue;
  _QWORD block[4];
  id v8;
  uint8_t buf[4];
  void *v10;
  __int16 v11;
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  GEOFindOrCreateLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    -[MapsSuggestionsBaseSource uniqueName](self, "uniqueName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v10 = v4;
    v11 = 2080;
    v12 = "Debug_updateGraph";
    _os_log_impl(&dword_1A427D000, v3, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s BEGIN", buf, 0x16u);

  }
  GEOFindOrCreateLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A427D000, v5, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "Debug_updateGraph", ", buf, 2u);
  }

  objc_initWeak((id *)buf, self);
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__MapsSuggestionsRemoteSource_Debug_updateGraph__block_invoke;
  block[3] = &unk_1E4BCDFF8;
  objc_copyWeak(&v8, (id *)buf);
  dispatch_async(queue, block);
  objc_destroyWeak(&v8);
  objc_destroyWeak((id *)buf);
}

void __48__MapsSuggestionsRemoteSource_Debug_updateGraph__block_invoke(uint64_t a1)
{
  id *v1;
  id *WeakRetained;
  id *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  NSObject *v7;
  _QWORD v8[4];
  id v9;
  _QWORD aBlock[4];
  id v11;
  uint8_t buf[4];
  char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v1 = (id *)(a1 + 32);
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    -[MapsSuggestionsRemoteSource _q_openConnectionIfNecessary]((uint64_t)WeakRetained);
    v4 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __48__MapsSuggestionsRemoteSource_Debug_updateGraph__block_invoke_189;
    aBlock[3] = &unk_1E4BCE048;
    objc_copyWeak(&v11, v1);
    v5 = _Block_copy(aBlock);
    objc_msgSend(v3[3], "remoteObjectProxyWithErrorHandler:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = v4;
    v8[1] = 3221225472;
    v8[2] = __48__MapsSuggestionsRemoteSource_Debug_updateGraph__block_invoke_190;
    v8[3] = &unk_1E4BCEB28;
    objc_copyWeak(&v9, v1);
    objc_msgSend(v6, "updateGraphWithHandler:", v8);

    objc_destroyWeak(&v9);
    objc_destroyWeak(&v11);
  }
  else
  {
    GEOFindOrCreateLog();
    v7 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v13 = "MapsSuggestionsRemoteSource.m";
      v14 = 1026;
      v15 = 447;
      v16 = 2082;
      v17 = "-[MapsSuggestionsRemoteSource Debug_updateGraph]_block_invoke";
      _os_log_impl(&dword_1A427D000, v7, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
    }

  }
}

void __48__MapsSuggestionsRemoteSource_Debug_updateGraph__block_invoke_189(uint64_t a1, void *a2)
{
  char *v3;
  NSObject *v4;
  id WeakRetained;
  NSObject *v6;
  NSObject *v7;
  char *v8;
  NSObject *v9;
  int v10;
  char *v11;
  __int16 v12;
  _WORD v13[17];

  *(_QWORD *)&v13[13] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  GEOFindOrCreateLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v10 = 138412290;
    v11 = v3;
    _os_log_impl(&dword_1A427D000, v4, OS_LOG_TYPE_ERROR, "Debug_updateGraph failed with error: %@", (uint8_t *)&v10, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  GEOFindOrCreateLog();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (WeakRetained)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(WeakRetained, "uniqueName");
      v8 = (char *)objc_claimAutoreleasedReturnValue();
      v10 = 138412546;
      v11 = v8;
      v12 = 2080;
      *(_QWORD *)v13 = "Debug_updateGraph";
      _os_log_impl(&dword_1A427D000, v7, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s FAIL", (uint8_t *)&v10, 0x16u);

    }
    GEOFindOrCreateLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v9))
    {
      LOWORD(v10) = 0;
      _os_signpost_emit_with_name_impl(&dword_1A427D000, v9, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "Debug_updateGraph", ", (uint8_t *)&v10, 2u);
    }
  }
  else
  {
    v9 = v6;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = 136446722;
      v11 = "MapsSuggestionsRemoteSource.m";
      v12 = 1026;
      *(_DWORD *)v13 = 452;
      v13[2] = 2082;
      *(_QWORD *)&v13[3] = "-[MapsSuggestionsRemoteSource Debug_updateGraph]_block_invoke";
      _os_log_impl(&dword_1A427D000, v9, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelfErrorHandler went away in %{public}s", (uint8_t *)&v10, 0x1Cu);
    }

  }
}

void __48__MapsSuggestionsRemoteSource_Debug_updateGraph__block_invoke_190(uint64_t a1, char a2)
{
  id WeakRetained;
  NSObject *v4;
  NSObject *v5;
  _BOOL4 v6;
  char *v7;
  NSObject *v8;
  char *v9;
  int v10;
  char *v11;
  __int16 v12;
  _WORD v13[17];

  *(_QWORD *)&v13[13] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  GEOFindOrCreateLog();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (WeakRetained)
  {
    v6 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);
    if ((a2 & 1) != 0)
    {
      if (v6)
      {
        objc_msgSend(WeakRetained, "uniqueName");
        v7 = (char *)objc_claimAutoreleasedReturnValue();
        v10 = 138412546;
        v11 = v7;
        v12 = 2080;
        *(_QWORD *)v13 = "Debug_updateGraph";
        _os_log_impl(&dword_1A427D000, v5, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s END", (uint8_t *)&v10, 0x16u);

      }
      GEOFindOrCreateLog();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_signpost_enabled(v8))
      {
        LOWORD(v10) = 0;
LABEL_14:
        _os_signpost_emit_with_name_impl(&dword_1A427D000, v8, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "Debug_updateGraph", ", (uint8_t *)&v10, 2u);
      }
    }
    else
    {
      if (v6)
      {
        objc_msgSend(WeakRetained, "uniqueName");
        v9 = (char *)objc_claimAutoreleasedReturnValue();
        v10 = 138412546;
        v11 = v9;
        v12 = 2080;
        *(_QWORD *)v13 = "Debug_updateGraph";
        _os_log_impl(&dword_1A427D000, v5, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s FAIL", (uint8_t *)&v10, 0x16u);

      }
      GEOFindOrCreateLog();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_signpost_enabled(v8))
      {
        LOWORD(v10) = 0;
        goto LABEL_14;
      }
    }
  }
  else
  {
    v8 = v4;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v10 = 136446722;
      v11 = "MapsSuggestionsRemoteSource.m";
      v12 = 1026;
      *(_DWORD *)v13 = 457;
      v13[2] = 2082;
      *(_QWORD *)&v13[3] = "-[MapsSuggestionsRemoteSource Debug_updateGraph]_block_invoke";
      _os_log_impl(&dword_1A427D000, v8, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf2 went away in %{public}s", (uint8_t *)&v10, 0x1Cu);
    }

  }
}

- (void)addOrUpdateSuggestionEntriesData:(id)a3 sourceNameData:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NSObject *queue;
  id v13;
  NSObject *v14;
  _QWORD v15[4];
  id v16;
  _QWORD block[4];
  id v18;
  id v19;
  id v20;
  id location[5];

  location[4] = *(id *)MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_initWeak(location, self);
  MapsSuggestionsEntriesFromNSData(v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __87__MapsSuggestionsRemoteSource_addOrUpdateSuggestionEntriesData_sourceNameData_handler___block_invoke;
  block[3] = &unk_1E4BCE020;
  objc_copyWeak(&v20, location);
  v18 = v9;
  v19 = v11;
  v13 = v11;
  dispatch_async(queue, block);

  objc_destroyWeak(&v20);
  if (v10)
  {
    v14 = self->_queue;
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __87__MapsSuggestionsRemoteSource_addOrUpdateSuggestionEntriesData_sourceNameData_handler___block_invoke_193;
    v15[3] = &unk_1E4BCED88;
    v16 = v10;
    dispatch_async(v14, v15);

  }
  objc_destroyWeak(location);

}

void __87__MapsSuggestionsRemoteSource_addOrUpdateSuggestionEntriesData_sourceNameData_handler___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  int v8;
  char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", *(_QWORD *)(a1 + 32), 4);
    objc_msgSend(WeakRetained, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (*(_QWORD *)(a1 + 40))
      v6 = *(_QWORD *)(a1 + 40);
    else
      v6 = MEMORY[0x1E0C9AA60];
    objc_msgSend(v4, "addOrUpdateSuggestionEntries:source:", v6, v3);

  }
  else
  {
    GEOFindOrCreateLog();
    v7 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = 136446722;
      v9 = "MapsSuggestionsRemoteSource.m";
      v10 = 1026;
      v11 = 479;
      v12 = 2082;
      v13 = "-[MapsSuggestionsRemoteSource addOrUpdateSuggestionEntriesData:sourceNameData:handler:]_block_invoke";
      _os_log_impl(&dword_1A427D000, v7, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v8, 0x1Cu);
    }

  }
}

uint64_t __87__MapsSuggestionsRemoteSource_addOrUpdateSuggestionEntriesData_sourceNameData_handler___block_invoke_193(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
