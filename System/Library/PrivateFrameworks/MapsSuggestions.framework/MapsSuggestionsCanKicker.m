@implementation MapsSuggestionsCanKicker

- (MapsSuggestionsCanKicker)initWithName:(id)a3 time:(double)a4 leeway:(double)a5 queue:(id)a6 block:(id)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  NSObject *v16;
  MapsSuggestionsCanKicker *v17;
  uint64_t v18;
  NSString *name;
  uint64_t v20;
  id block;
  MapsSuggestionsGCDTimer *v22;
  OS_dispatch_queue *targetQueue;
  uint64_t v24;
  MapsSuggestionsGCDTimer *timer;
  MapsSuggestionsCanKicker *v26;
  _QWORD v28[4];
  id v29;
  id v30;
  objc_super v31;
  uint8_t buf[4];
  const char *v33;
  __int16 v34;
  int v35;
  __int16 v36;
  const char *v37;
  __int16 v38;
  const char *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a6;
  v14 = a7;
  v15 = v14;
  if (!v12)
  {
    GEOFindOrCreateLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v33 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsCanKicker.m";
      v34 = 1024;
      v35 = 48;
      v36 = 2082;
      v37 = "-[MapsSuggestionsCanKicker initWithName:time:leeway:queue:block:]";
      v38 = 2082;
      v39 = "nil == (name)";
      _os_log_impl(&dword_1A427D000, v16, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a name", buf, 0x26u);
    }
    goto LABEL_23;
  }
  if (a4 < 0.0)
  {
    GEOFindOrCreateLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v33 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsCanKicker.m";
      v34 = 1024;
      v35 = 49;
      v36 = 2082;
      v37 = "-[MapsSuggestionsCanKicker initWithName:time:leeway:queue:block:]";
      v38 = 2082;
      v39 = "time < 0.0";
      _os_log_impl(&dword_1A427D000, v16, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a time in the future", buf, 0x26u);
    }
LABEL_23:

    v26 = 0;
    goto LABEL_24;
  }
  if (a5 < 0.0)
  {
    GEOFindOrCreateLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v33 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsCanKicker.m";
      v34 = 1024;
      v35 = 50;
      v36 = 2082;
      v37 = "-[MapsSuggestionsCanKicker initWithName:time:leeway:queue:block:]";
      v38 = 2082;
      v39 = "leeway < 0.0";
      _os_log_impl(&dword_1A427D000, v16, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a positive leeway", buf, 0x26u);
    }
    goto LABEL_23;
  }
  if (!v13)
  {
    GEOFindOrCreateLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v33 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsCanKicker.m";
      v34 = 1024;
      v35 = 51;
      v36 = 2082;
      v37 = "-[MapsSuggestionsCanKicker initWithName:time:leeway:queue:block:]";
      v38 = 2082;
      v39 = "nil == (queue)";
      _os_log_impl(&dword_1A427D000, v16, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a target queue to run the block on", buf, 0x26u);
    }
    goto LABEL_23;
  }
  if (!v14)
  {
    GEOFindOrCreateLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v33 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsCanKicker.m";
      v34 = 1024;
      v35 = 52;
      v36 = 2082;
      v37 = "-[MapsSuggestionsCanKicker initWithName:time:leeway:queue:block:]";
      v38 = 2082;
      v39 = "nil == (block)";
      _os_log_impl(&dword_1A427D000, v16, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a block", buf, 0x26u);
    }
    goto LABEL_23;
  }
  v31.receiver = self;
  v31.super_class = (Class)MapsSuggestionsCanKicker;
  v17 = -[MapsSuggestionsCanKicker init](&v31, sel_init);
  if (v17)
  {
    v18 = objc_msgSend(v12, "copy");
    name = v17->_name;
    v17->_name = (NSString *)v18;

    v17->_time = a4;
    v17->_leeway = a5;
    objc_storeStrong((id *)&v17->_targetQueue, a6);
    v20 = objc_msgSend(v15, "copy");
    block = v17->_block;
    v17->_block = (id)v20;

    v17->_count = 0;
    objc_initWeak((id *)buf, v17);
    v22 = [MapsSuggestionsGCDTimer alloc];
    targetQueue = v17->_targetQueue;
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __65__MapsSuggestionsCanKicker_initWithName_time_leeway_queue_block___block_invoke;
    v28[3] = &unk_1E4BCEB98;
    objc_copyWeak(&v30, (id *)buf);
    v29 = v15;
    v24 = -[MapsSuggestionsGCDTimer initWithName:queue:block:](v22, "initWithName:queue:block:", CFSTR("CanKickerTimer"), targetQueue, v28);
    timer = v17->_timer;
    v17->_timer = (MapsSuggestionsGCDTimer *)v24;

    objc_destroyWeak(&v30);
    objc_destroyWeak((id *)buf);
  }
  self = v17;
  v26 = self;
LABEL_24:

  return v26;
}

void __65__MapsSuggestionsCanKicker_initWithName_time_leeway_queue_block___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  _QWORD *v4;
  NSObject *v5;
  char *v6;
  uint64_t v7;
  NSObject *v8;
  int v9;
  char *v10;
  __int16 v11;
  _WORD v12[17];

  *(_QWORD *)&v12[13] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = WeakRetained;
    objc_sync_enter(v4);
    GEOFindOrCreateLog();
    v5 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v4, "uniqueName");
      v6 = (char *)objc_claimAutoreleasedReturnValue();
      v7 = v4[7];
      v9 = 138412546;
      v10 = v6;
      v11 = 2048;
      *(_QWORD *)v12 = v7;
      _os_log_impl(&dword_1A427D000, v5, OS_LOG_TYPE_DEBUG, "CanKicker{%@} executes block (after %lu kicks)!", (uint8_t *)&v9, 0x16u);

    }
    v4[7] = 0;
    objc_sync_exit(v4);

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    GEOFindOrCreateLog();
    v8 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = 136446722;
      v10 = "MapsSuggestionsCanKicker.m";
      v11 = 1026;
      *(_DWORD *)v12 = 67;
      v12[2] = 2082;
      *(_QWORD *)&v12[3] = "-[MapsSuggestionsCanKicker initWithName:time:leeway:queue:block:]_block_invoke";
      _os_log_impl(&dword_1A427D000, v8, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v9, 0x1Cu);
    }

  }
}

- (MapsSuggestionsCanKicker)initWithName:(id)a3 time:(double)a4 queue:(id)a5 block:(id)a6
{
  return -[MapsSuggestionsCanKicker initWithName:time:leeway:queue:block:](self, "initWithName:time:leeway:queue:block:", a3, a5, a6, a4, 1.0);
}

- (MapsSuggestionsCanKicker)initWithName:(id)a3 queue:(id)a4 block:(id)a5
{
  return -[MapsSuggestionsCanKicker initWithName:time:queue:block:](self, "initWithName:time:queue:block:", a3, a4, a5, 0.0);
}

- (void)dealloc
{
  MapsSuggestionsGCDTimer *timer;
  objc_super v4;

  -[MapsSuggestionsCanKicker cancel](self, "cancel");
  -[MapsSuggestionsGCDTimer unschedule](self->_timer, "unschedule");
  timer = self->_timer;
  self->_timer = 0;

  v4.receiver = self;
  v4.super_class = (Class)MapsSuggestionsCanKicker;
  -[MapsSuggestionsCanKicker dealloc](&v4, sel_dealloc);
}

- (void)cancel
{
  MapsSuggestionsCanKicker *v2;
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = self;
  objc_sync_enter(v2);
  GEOFindOrCreateLog();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    -[MapsSuggestionsCanKicker uniqueName](v2, "uniqueName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138412290;
    v6 = v4;
    _os_log_impl(&dword_1A427D000, v3, OS_LOG_TYPE_DEBUG, "CanKicker{%@} cancels", (uint8_t *)&v5, 0xCu);

  }
  -[MapsSuggestionsGCDTimer unschedule](v2->_timer, "unschedule");
  objc_sync_exit(v2);

}

- (void)_kickCan
{
  id *v1;
  NSObject *v2;
  void *v3;
  id v4;
  id v5;
  id v6;
  int v7;
  void *v8;
  __int16 v9;
  id v10;
  __int16 v11;
  id v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v1 = a1;
    objc_sync_enter(v1);
    v1[7] = (char *)v1[7] + 1;
    if (MapsSuggestionsLoggingIsVerbose_s_onceToken != -1)
      dispatch_once(&MapsSuggestionsLoggingIsVerbose_s_onceToken, &__block_literal_global_29);
    if (s_verbose)
    {
      GEOFindOrCreateLog();
      v2 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(v1, "uniqueName");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        v4 = v1[4];
        v5 = v1[5];
        v6 = v1[7];
        v7 = 138413058;
        v8 = v3;
        v9 = 2048;
        v10 = v4;
        v11 = 2048;
        v12 = v5;
        v13 = 2048;
        v14 = v6;
        _os_log_impl(&dword_1A427D000, v2, OS_LOG_TYPE_DEBUG, "CanKicker{%@} kicked with time=%.2f leeway=%.2f count=%lu", (uint8_t *)&v7, 0x2Au);

      }
    }
    objc_msgSend(v1[6], "scheduleWithTimeInterval:leeway:", *((double *)v1 + 4), *((double *)v1 + 5));
    objc_sync_exit(v1);

  }
}

- (void)kickCanByTime:(double)a3
{
  NSObject *v5;
  const char *v6;
  MapsSuggestionsCanKicker *v7;
  double time;
  double leeway;
  MapsSuggestionsCanKicker *v10;
  int v11;
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  const char *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (a3 <= 0.0)
  {
    GEOFindOrCreateLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v11 = 136446978;
      v12 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsCanKicker.m";
      v13 = 1024;
      v14 = 130;
      v15 = 2082;
      v16 = "-[MapsSuggestionsCanKicker kickCanByTime:]";
      v17 = 2082;
      v18 = "time <= 0.0";
      v6 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a time in the future.";
      goto LABEL_13;
    }
LABEL_14:

    return;
  }
  if (self->_leeway < 0.0)
  {
    GEOFindOrCreateLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v11 = 136446978;
      v12 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsCanKicker.m";
      v13 = 1024;
      v14 = 131;
      v15 = 2082;
      v16 = "-[MapsSuggestionsCanKicker kickCanByTime:]";
      v17 = 2082;
      v18 = "_leeway < 0.0";
      v6 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a positive leeway.";
LABEL_13:
      _os_log_impl(&dword_1A427D000, v5, OS_LOG_TYPE_ERROR, v6, (uint8_t *)&v11, 0x26u);
      goto LABEL_14;
    }
    goto LABEL_14;
  }
  v7 = self;
  objc_sync_enter(v7);
  v7->_time = a3;
  objc_sync_exit(v7);

  time = v7->_time;
  if (time <= 0.0)
  {
    GEOFindOrCreateLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v11 = 136446978;
      v12 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsCanKicker.m";
      v13 = 1024;
      v14 = 118;
      v15 = 2082;
      v16 = "-[MapsSuggestionsCanKicker kickCanByTime:leeway:]";
      v17 = 2082;
      v18 = "time <= 0.0";
      v6 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a time in the future.";
      goto LABEL_13;
    }
    goto LABEL_14;
  }
  leeway = self->_leeway;
  if (leeway < 0.0)
  {
    GEOFindOrCreateLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v11 = 136446978;
      v12 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsCanKicker.m";
      v13 = 1024;
      v14 = 119;
      v15 = 2082;
      v16 = "-[MapsSuggestionsCanKicker kickCanByTime:leeway:]";
      v17 = 2082;
      v18 = "leeway < 0.0";
      v6 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a positive leeway.";
      goto LABEL_13;
    }
    goto LABEL_14;
  }
  v10 = v7;
  objc_sync_enter(v10);
  v7->_time = time;
  self->_leeway = leeway;
  objc_sync_exit(v10);

  -[MapsSuggestionsCanKicker _kickCan](v10);
}

- (void)kickCanBySameTime
{
  NSObject *v2;
  int v3;
  const char *v4;
  __int16 v5;
  int v6;
  __int16 v7;
  const char *v8;
  __int16 v9;
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (self->_time <= 0.0)
  {
    GEOFindOrCreateLog();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      v3 = 136446978;
      v4 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsCanKicker.m";
      v5 = 1024;
      v6 = 141;
      v7 = 2082;
      v8 = "-[MapsSuggestionsCanKicker kickCanBySameTime]";
      v9 = 2082;
      v10 = "_time <= 0.0";
      _os_log_impl(&dword_1A427D000, v2, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Either use initialize with a time or call kicking method with a time.", (uint8_t *)&v3, 0x26u);
    }

  }
  else
  {
    -[MapsSuggestionsCanKicker _kickCan](self);
  }
}

- (NSString)uniqueName
{
  return self->_name;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong(&self->_block, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_targetQueue, 0);
}

@end
