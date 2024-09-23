@implementation MapsSuggestionsXPCActivityTimer

- (MapsSuggestionsXPCActivityTimer)initWithName:(id)a3 estimatedDownload:(unint64_t)a4 estimatedUpload:(unint64_t)a5 queue:(id)a6 block:(id)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  MapsSuggestionsXPCActivityTimer *v16;
  MapsSuggestionsXPCActivityTimer *v17;
  void *v18;
  id block;
  uint64_t v20;
  NSString *activityIdentifier;
  MapsSuggestionsXPCActivityTimer *v22;
  NSObject *v23;
  objc_super v25;
  uint8_t buf[4];
  const char *v27;
  __int16 v28;
  int v29;
  __int16 v30;
  const char *v31;
  __int16 v32;
  const char *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a6;
  v14 = a7;
  v15 = v14;
  if (!v12)
  {
    GEOFindOrCreateLog();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v27 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsXPCActivityTimer.mm";
      v28 = 1024;
      v29 = 41;
      v30 = 2082;
      v31 = "-[MapsSuggestionsXPCActivityTimer initWithName:estimatedDownload:estimatedUpload:queue:block:]";
      v32 = 2082;
      v33 = "nil == (name)";
      _os_log_impl(&dword_1A427D000, v23, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Name cannot be nil", buf, 0x26u);
    }
    goto LABEL_15;
  }
  if (!v13)
  {
    GEOFindOrCreateLog();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v27 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsXPCActivityTimer.mm";
      v28 = 1024;
      v29 = 42;
      v30 = 2082;
      v31 = "-[MapsSuggestionsXPCActivityTimer initWithName:estimatedDownload:estimatedUpload:queue:block:]";
      v32 = 2082;
      v33 = "nil == (queue)";
      _os_log_impl(&dword_1A427D000, v23, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Queue cannot be nil", buf, 0x26u);
    }
    goto LABEL_15;
  }
  if (!v14)
  {
    GEOFindOrCreateLog();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v27 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsXPCActivityTimer.mm";
      v28 = 1024;
      v29 = 43;
      v30 = 2082;
      v31 = "-[MapsSuggestionsXPCActivityTimer initWithName:estimatedDownload:estimatedUpload:queue:block:]";
      v32 = 2082;
      v33 = "nil == (block)";
      _os_log_impl(&dword_1A427D000, v23, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Block cannot be nil", buf, 0x26u);
    }
LABEL_15:

    v22 = 0;
    goto LABEL_16;
  }
  v25.receiver = self;
  v25.super_class = (Class)MapsSuggestionsXPCActivityTimer;
  v16 = -[MapsSuggestionsBaseTrigger initWithName:queue:](&v25, sel_initWithName_queue_, v12, v13);
  v17 = v16;
  if (v16)
  {
    v16->_estimatedDownloadInBytes = a4;
    v16->_estimatedUploadInBytes = a5;
    v18 = _Block_copy(v15);
    block = v17->_block;
    v17->_block = v18;

    objc_msgSend(CFSTR("com.apple."), "stringByAppendingString:", v12);
    v20 = objc_claimAutoreleasedReturnValue();
    activityIdentifier = v17->_activityIdentifier;
    v17->_activityIdentifier = (NSString *)v20;

  }
  self = v17;
  v22 = self;
LABEL_16:

  return v22;
}

- (MapsSuggestionsXPCActivityTimer)initWithName:(id)a3 queue:(id)a4 block:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t Integer;
  MapsSuggestionsXPCActivityTimer *v12;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  Integer = GEOConfigGetInteger();
  v12 = -[MapsSuggestionsXPCActivityTimer initWithName:estimatedDownload:estimatedUpload:queue:block:](self, "initWithName:estimatedDownload:estimatedUpload:queue:block:", v8, Integer, GEOConfigGetInteger(), v9, v10);

  return v12;
}

- (void)scheduleWithTimeInterval:(double)a3 leeway:(double)a4
{
  void *v6;
  NSObject *v7;
  _QWORD v8[4];
  id v9;
  id v10[2];
  id location;

  -[MapsSuggestionsBaseTrigger dispatchQueue](self, "dispatchQueue", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __67__MapsSuggestionsXPCActivityTimer_scheduleWithTimeInterval_leeway___block_invoke;
  v8[3] = &unk_1E4BCDDD0;
  objc_copyWeak(v10, &location);
  v10[1] = *(id *)&a3;
  v9 = v6;
  v7 = v6;
  dispatch_async(v7, v8);

  objc_destroyWeak(v10);
  objc_destroyWeak(&location);
}

void __67__MapsSuggestionsXPCActivityTimer_scheduleWithTimeInterval_leeway___block_invoke(uint64_t a1)
{
  id *v2;
  char *WeakRetained;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __CFString *v13;
  NSObject *v14;
  const __CFString *v15;
  id v16;
  _QWORD v17[4];
  id v18;
  uint8_t buf[4];
  char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  const char *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v2 = (id *)(a1 + 40);
  WeakRetained = (char *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    MapsSuggestionsNowWithOffset(*(double *)(a1 + 48));
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)*((_QWORD *)WeakRetained + 7);
    *((_QWORD *)WeakRetained + 7) = v4;

    GEOFindOrCreateLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v20 = WeakRetained;
      _os_log_impl(&dword_1A427D000, v6, OS_LOG_TYPE_DEBUG, "Scheduling Background Systems Task: %@", buf, 0xCu);
    }

    objc_msgSend(MEMORY[0x1E0D00E68], "sharedScheduler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "deregisterTaskWithIdentifier:", *((_QWORD *)WeakRetained + 5));

    v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0D00E40]), "initWithIdentifier:", *((_QWORD *)WeakRetained + 5));
    -[NSObject setScheduleAfter:](v8, "setScheduleAfter:", *(double *)(a1 + 48));
    -[NSObject setRequiresExternalPower:](v8, "setRequiresExternalPower:", 0);
    -[NSObject setPowerBudgeted:](v8, "setPowerBudgeted:", 1);
    -[NSObject setShouldWakeDevice:](v8, "setShouldWakeDevice:", 1);
    -[NSObject setPriority:](v8, "setPriority:", 2);
    -[NSObject setRequiresNetworkConnectivity:](v8, "setRequiresNetworkConnectivity:", 1);
    -[NSObject setRequiresInexpensiveNetworkConnectivity:](v8, "setRequiresInexpensiveNetworkConnectivity:", 0);
    -[NSObject setNetworkDownloadSize:](v8, "setNetworkDownloadSize:", *((_QWORD *)WeakRetained + 8));
    -[NSObject setNetworkUploadSize:](v8, "setNetworkUploadSize:", *((_QWORD *)WeakRetained + 9));
    objc_msgSend(MEMORY[0x1E0D00E68], "sharedScheduler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *((_QWORD *)WeakRetained + 5);
    v11 = *(_QWORD *)(a1 + 32);
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __67__MapsSuggestionsXPCActivityTimer_scheduleWithTimeInterval_leeway___block_invoke_83;
    v17[3] = &unk_1E4BCDDA8;
    objc_copyWeak(&v18, v2);
    objc_msgSend(v9, "registerForTaskWithIdentifier:usingQueue:launchHandler:", v10, v11, v17);

    objc_msgSend(MEMORY[0x1E0D00E68], "sharedScheduler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0;
    LOBYTE(v10) = objc_msgSend(v12, "submitTaskRequest:error:", v8, &v16);
    v13 = (__CFString *)v16;

    if ((v10 & 1) == 0)
    {
      GEOFindOrCreateLog();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        v15 = CFSTR("Unknown");
        if (v13)
          v15 = v13;
        *(_DWORD *)buf = 138412290;
        v20 = (char *)v15;
        _os_log_impl(&dword_1A427D000, v14, OS_LOG_TYPE_ERROR, "Failed to submit task with error: %@", buf, 0xCu);
      }

    }
    objc_destroyWeak(&v18);
  }
  else
  {
    GEOFindOrCreateLog();
    v8 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v20 = "MapsSuggestionsXPCActivityTimer.mm";
      v21 = 1026;
      v22 = 75;
      v23 = 2082;
      v24 = "-[MapsSuggestionsXPCActivityTimer scheduleWithTimeInterval:leeway:]_block_invoke";
      _os_log_impl(&dword_1A427D000, v8, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
    }

  }
}

void __67__MapsSuggestionsXPCActivityTimer_scheduleWithTimeInterval_leeway___block_invoke_83(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
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
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v6 = *((_QWORD *)WeakRetained + 4);
    if (v6)
      (*(void (**)(void))(v6 + 16))();
    objc_msgSend(v3, "setTaskCompleted");
  }
  else
  {
    GEOFindOrCreateLog();
    v7 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = 136446722;
      v9 = "MapsSuggestionsXPCActivityTimer.mm";
      v10 = 1026;
      v11 = 104;
      v12 = 2082;
      v13 = "-[MapsSuggestionsXPCActivityTimer scheduleWithTimeInterval:leeway:]_block_invoke";
      _os_log_impl(&dword_1A427D000, v7, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf1 went away in %{public}s", (uint8_t *)&v8, 0x1Cu);
    }

  }
}

- (void)scheduleWithTimeInterval:(double)a3 repeatAfter:(double)a4 leeway:(double)a5
{
  -[MapsSuggestionsXPCActivityTimer scheduleWithInterval:leeway:](self, "scheduleWithInterval:leeway:", (uint64_t)(a3 * 1000000000.0), (uint64_t)(a5 * 1000000000.0));
}

- (void)unschedule
{
  NSObject *v3;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  -[MapsSuggestionsBaseTrigger dispatchQueue](self, "dispatchQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __45__MapsSuggestionsXPCActivityTimer_unschedule__block_invoke;
  v4[3] = &unk_1E4BCDDF8;
  objc_copyWeak(&v5, &location);
  dispatch_async(v3, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __45__MapsSuggestionsXPCActivityTimer_unschedule__block_invoke(uint64_t a1)
{
  char *WeakRetained;
  NSObject *v2;
  NSObject *v3;
  int v4;
  char *v5;
  __int16 v6;
  int v7;
  __int16 v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  WeakRetained = (char *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    GEOFindOrCreateLog();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      v4 = 138412290;
      v5 = WeakRetained;
      _os_log_impl(&dword_1A427D000, v2, OS_LOG_TYPE_DEBUG, "Unscheduling XPC timer: %@", (uint8_t *)&v4, 0xCu);
    }

    objc_msgSend(MEMORY[0x1E0D00E68], "sharedScheduler");
    v3 = objc_claimAutoreleasedReturnValue();
    -[NSObject deregisterTaskWithIdentifier:](v3, "deregisterTaskWithIdentifier:", *((_QWORD *)WeakRetained + 5));
  }
  else
  {
    GEOFindOrCreateLog();
    v3 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v4 = 136446722;
      v5 = "MapsSuggestionsXPCActivityTimer.mm";
      v6 = 1026;
      v7 = 128;
      v8 = 2082;
      v9 = "-[MapsSuggestionsXPCActivityTimer unschedule]_block_invoke";
      _os_log_impl(&dword_1A427D000, v3, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v4, 0x1Cu);
    }

  }
}

- (void)scheduleWithInterval:(Duration)a3 leeway:(Duration)a4
{
  -[MapsSuggestionsXPCActivityTimer scheduleWithTimeInterval:leeway:](self, "scheduleWithTimeInterval:leeway:", (double)*(uint64_t *)&a3 / 1000000000.0, (double)*(uint64_t *)&a4 / 1000000000.0);
}

- (void)scheduleWithInterval:(Duration)a3 repeatAfter:(Duration)a4 leeway:(Duration)a5
{
  -[MapsSuggestionsXPCActivityTimer scheduleWithInterval:leeway:](self, "scheduleWithInterval:leeway:", *(_QWORD *)&a3, *(_QWORD *)&a5);
}

- (NSString)description
{
  void *v2;
  void *v3;

  -[MapsSuggestionsXPCActivityTimer objectForJSON](self, "objectForJSON");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromMapsSuggestionsJSON(v2, 1u);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (id)objectForJSON
{
  NSObject *v3;
  uint64_t v4;
  _QWORD *v5;
  _QWORD *v6;
  const char *label;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  _QWORD v14[2];
  id (*v15)(uint64_t);
  void *v16;
  MapsSuggestionsXPCActivityTimer *v17;
  _QWORD block[4];
  id v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  -[MapsSuggestionsBaseTrigger dispatchQueue](self, "dispatchQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v15 = __48__MapsSuggestionsXPCActivityTimer_objectForJSON__block_invoke;
  v16 = &unk_1E4BCDE20;
  v17 = self;
  v5 = v14;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__1;
  v25 = __Block_byref_object_dispose__1;
  v26 = 0;
  block[0] = v4;
  block[1] = 3221225472;
  block[2] = ___ZN3MSg26dispatch_sync_if_differentIU8__strongP12NSDictionaryEET_PU28objcproto17OS_dispatch_queue8NSObjectU13block_pointerFS4_vE_block_invoke;
  block[3] = &unk_1E4BCDE48;
  v20 = &v21;
  v6 = v5;
  v19 = v6;
  label = dispatch_queue_get_label(v3);
  if (label == dispatch_queue_get_label(0))
  {
    v9 = (void *)MEMORY[0x1A859CDD8]();
    v15((uint64_t)v6);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v22[5];
    v22[5] = v10;

    objc_autoreleasePoolPop(v9);
    v8 = v6;
  }
  else
  {
    dispatch_sync(v3, block);
    v8 = v19;
  }
  v12 = (id)v22[5];

  _Block_object_dispose(&v21, 8);
  return v12;
}

id __48__MapsSuggestionsXPCActivityTimer_objectForJSON__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  MSg *v8;
  void *v9;
  void *v10;
  _QWORD v12[3];
  _QWORD v13[4];

  v13[3] = *MEMORY[0x1E0C80C00];
  v12[0] = CFSTR("name");
  objc_msgSend(*(id *)(a1 + 32), "uniqueName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  MSg::jsonFor(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v3;
  v12[1] = CFSTR("activityIdentifier");
  MSg::jsonFor(*(void **)(*(_QWORD *)(a1 + 32) + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v4;
  v12[2] = CFSTR("firesInSec");
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(_QWORD *)(v5 + 56);
  if (v6)
  {
    v7 = MapsSuggestionsSecondsTo(*(void **)(v5 + 56));
    MSg::jsonFor(v8, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = &unk_1E4C09740;
  }
  v13[2] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_firesAt, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_activityIdentifier, 0);
  objc_storeStrong(&self->_block, 0);
}

@end
