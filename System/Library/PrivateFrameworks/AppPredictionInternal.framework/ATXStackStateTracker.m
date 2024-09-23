@implementation ATXStackStateTracker

void __47__ATXStackStateTracker_initTrackerInDirectory___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "persistInternalState");

}

void __44__ATXStackStateTracker_persistInternalState__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  int v7;
  int v8;
  int v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint8_t buf[8];
  id v28;

  v3 = a2;
  v4 = (void *)MEMORY[0x1CAA48B6C]();
  v28 = 0;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v3, 0, &v28);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v28;
  objc_autoreleasePoolPop(v4);
  if (!v5)
  {
    __atxlog_handle_blending();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      __44__ATXStackStateTracker_persistInternalState__block_invoke_cold_1((uint64_t)v6, v12, v13, v14, v15, v16, v17, v18);

    goto LABEL_12;
  }
  v7 = open((const char *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "UTF8String"), 514, 384);
  if (v7 == -1)
  {
    __atxlog_handle_blending();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      __44__ATXStackStateTracker_persistInternalState__block_invoke_cold_2();

LABEL_12:
    LOBYTE(v9) = 0;
    goto LABEL_17;
  }
  v8 = v7;
  v9 = ATXCacheFileWrite();
  __atxlog_handle_blending();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v9)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C9A3B000, v11, OS_LOG_TYPE_DEFAULT, "ATXStackStateTracker: Done persisting internal state.", buf, 2u);
    }
  }
  else if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    __44__ATXStackStateTracker_persistInternalState__block_invoke_cold_3(v11, v20, v21, v22, v23, v24, v25, v26);
  }

  if ((v8 & 0x80000000) == 0)
    close(v8);
LABEL_17:
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v9;

}

- (BOOL)persistInternalState
{
  ATXStackStateTracker *v2;
  _PASLock *internalStateLock;
  uint64_t v4;
  NSObject *queue;
  _QWORD block[5];
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;

  v2 = self;
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  internalStateLock = self->_internalStateLock;
  v4 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __44__ATXStackStateTracker_persistInternalState__block_invoke;
  v8[3] = &unk_1E82E42C8;
  v8[4] = v2;
  v8[5] = &v9;
  -[_PASLock runWithLockAcquired:](internalStateLock, "runWithLockAcquired:", v8);
  queue = v2->_queue;
  block[0] = v4;
  block[1] = 3221225472;
  block[2] = __44__ATXStackStateTracker_persistInternalState__block_invoke_164;
  block[3] = &unk_1E82DAC38;
  block[4] = v2;
  dispatch_async(queue, block);
  LOBYTE(v2) = *((_BYTE *)v10 + 24);
  _Block_object_dispose(&v9, 8);
  return (char)v2;
}

- (ATXStackStateTracker)init
{
  void *v3;
  ATXStackStateTracker *v4;

  objc_msgSend(MEMORY[0x1E0CF94D8], "appPredictionCacheDirectory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[ATXStackStateTracker initTrackerInDirectory:](self, "initTrackerInDirectory:", v3);

  return v4;
}

+ (ATXStackStateTracker)sharedInstance
{
  if (sharedInstance__pasOnceToken17 != -1)
    dispatch_once(&sharedInstance__pasOnceToken17, &__block_literal_global_136);
  return (ATXStackStateTracker *)(id)sharedInstance__pasExprOnceResult_24;
}

void __38__ATXStackStateTracker_sharedInstance__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x1CAA48B6C]();
  v1 = objc_opt_new();
  v2 = (void *)sharedInstance__pasExprOnceResult_24;
  sharedInstance__pasExprOnceResult_24 = v1;

  objc_autoreleasePoolPop(v0);
}

- (id)initTrackerInDirectory:(id)a3
{
  id v4;
  ATXStackStateTracker *v5;
  void *v6;
  uint64_t v7;
  NSString *path;
  NSObject *v9;
  NSObject *v10;
  dispatch_queue_t v11;
  OS_dispatch_queue *queue;
  id v13;
  OS_dispatch_queue *v14;
  uint64_t v15;
  _PASSimpleCoalescingTimer *coalescedPersistInternalStateOperation;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t);
  void *v21;
  id v22;
  id location;
  objc_super v24;

  v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)ATXStackStateTracker;
  v5 = -[ATXStackStateTracker init](&v24, sel_init);
  if (v5)
  {
    v6 = (void *)os_transaction_create();
    objc_msgSend(v4, "stringByAppendingPathComponent:", CFSTR("ATXStackStates"));
    v7 = objc_claimAutoreleasedReturnValue();
    path = v5->_path;
    v5->_path = (NSString *)v7;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v9 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v9, QOS_CLASS_BACKGROUND, 0);
    v10 = objc_claimAutoreleasedReturnValue();

    v11 = dispatch_queue_create("ATXStackStateTracker", v10);
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v11;

    objc_initWeak(&location, v5);
    v13 = objc_alloc(MEMORY[0x1E0D81618]);
    v14 = v5->_queue;
    v18 = MEMORY[0x1E0C809B0];
    v19 = 3221225472;
    v20 = __47__ATXStackStateTracker_initTrackerInDirectory___block_invoke;
    v21 = &unk_1E82DB988;
    objc_copyWeak(&v22, &location);
    v15 = objc_msgSend(v13, "initWithQueue:operation:", v14, &v18);
    coalescedPersistInternalStateOperation = v5->_coalescedPersistInternalStateOperation;
    v5->_coalescedPersistInternalStateOperation = (_PASSimpleCoalescingTimer *)v15;

    -[ATXStackStateTracker loadInternalState](v5, "loadInternalState", v18, v19, v20, v21);
    -[ATXStackStateTracker updateStackRotationEvents](v5, "updateStackRotationEvents");
    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);

  }
  return v5;
}

- (id)jsonRepresentation
{
  _PASLock *internalStateLock;
  id v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__53;
  v10 = __Block_byref_object_dispose__53;
  v11 = 0;
  internalStateLock = self->_internalStateLock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __42__ATXStackStateTracker_jsonRepresentation__block_invoke;
  v5[3] = &unk_1E82E4250;
  v5[4] = &v6;
  -[_PASLock runWithLockAcquired:](internalStateLock, "runWithLockAcquired:", v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __42__ATXStackStateTracker_jsonRepresentation__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(a2, "stackStateByStackId");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v6, "copy");
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (BOOL)stackIsStale:(id)a3
{
  id v4;
  _PASLock *internalStateLock;
  id v6;
  _QWORD v8[4];
  id v9;
  ATXStackStateTracker *v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  internalStateLock = self->_internalStateLock;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __37__ATXStackStateTracker_stackIsStale___block_invoke;
  v8[3] = &unk_1E82E4278;
  v6 = v4;
  v9 = v6;
  v10 = self;
  v11 = &v12;
  -[_PASLock runWithLockAcquired:](internalStateLock, "runWithLockAcquired:", v8);
  LOBYTE(self) = *((_BYTE *)v13 + 24);

  _Block_object_dispose(&v12, 8);
  return (char)self;
}

void __37__ATXStackStateTracker_stackIsStale___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v3 = a2;
  __atxlog_handle_blending();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    __37__ATXStackStateTracker_stackIsStale___block_invoke_cold_3(a1, v3, v4);

  if ((objc_msgSend(*(id *)(a1 + 40), "stackWasCreatedALongTimeAgo:", *(_QWORD *)(a1 + 32)) & 1) != 0)
  {
    if (!objc_msgSend(*(id *)(a1 + 40), "lastStackRotationWasALongTimeAgoForStackId:", *(_QWORD *)(a1 + 32)))
    {
      v12 = 0;
      goto LABEL_13;
    }
    __atxlog_handle_blending();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      __37__ATXStackStateTracker_stackIsStale___block_invoke_cold_1(a1 + 32, v5, v6, v7, v8, v9, v10, v11);
    v12 = 1;
  }
  else
  {
    __atxlog_handle_blending();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      __37__ATXStackStateTracker_stackIsStale___block_invoke_cold_2(a1 + 32, v5, v13, v14, v15, v16, v17, v18);
    v12 = 0;
  }

LABEL_13:
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v12;

}

- (BOOL)mostRecentRotationOfStackIsSystemInitiated:(id)a3
{
  id v4;
  _PASLock *internalStateLock;
  id v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  internalStateLock = self->_internalStateLock;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __67__ATXStackStateTracker_mostRecentRotationOfStackIsSystemInitiated___block_invoke;
  v8[3] = &unk_1E82E42A0;
  v6 = v4;
  v9 = v6;
  v10 = &v11;
  -[_PASLock runWithLockAcquired:](internalStateLock, "runWithLockAcquired:", v8);
  LOBYTE(internalStateLock) = *((_BYTE *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)internalStateLock;
}

void __67__ATXStackStateTracker_mostRecentRotationOfStackIsSystemInitiated___block_invoke(uint64_t a1, void *a2)
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
  char v13;
  id v14;

  objc_msgSend(a2, "stackStateByStackId");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
  v14 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "lastStackRotationEvent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reason");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringForATXHomeScreenStackChangeReason();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isEqualToString:", v6) & 1) == 0)
  {
    objc_msgSend(v14, "lastStackRotationEvent");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "reason");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringForATXHomeScreenStackChangeReason();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v8, "isEqualToString:", v9) & 1) == 0)
    {
      objc_msgSend(v14, "lastStackRotationEvent");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "reason");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringForATXHomeScreenStackChangeReason();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v11, "isEqualToString:", v12);

      if ((v13 & 1) == 0)
        goto LABEL_6;
      goto LABEL_5;
    }

  }
LABEL_5:
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
LABEL_6:

}

- (BOOL)lastStackRotationWasALongTimeAgoForStackId:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  BOOL v10;

  -[ATXStackStateTracker lastStackRotationEvent:](self, "lastStackRotationEvent:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "date");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "timeIntervalSinceNow");
    v7 = v6;
    objc_msgSend(MEMORY[0x1E0D80CD0], "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "maxAgeOfStackSuggestionToConsiderStaleInSeconds");
    v10 = v7 < -v9;

  }
  else
  {
    v10 = 1;
  }

  return v10;
}

- (BOOL)stackWasCreatedALongTimeAgo:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  BOOL v10;

  -[ATXStackStateTracker stackCreationEvent:](self, "stackCreationEvent:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "date");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "timeIntervalSinceNow");
    v7 = v6;
    objc_msgSend(MEMORY[0x1E0D80CD0], "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "maxAgeOfStackSuggestionToConsiderStaleInSeconds");
    v10 = v7 < -v9;

  }
  else
  {
    v10 = 1;
  }

  return v10;
}

- (BOOL)lastUserScrollWasALongTimeAgoForStackId:(id)a3
{
  id v4;
  _PASLock *internalStateLock;
  id v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  internalStateLock = self->_internalStateLock;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __64__ATXStackStateTracker_lastUserScrollWasALongTimeAgoForStackId___block_invoke;
  v8[3] = &unk_1E82E42A0;
  v6 = v4;
  v9 = v6;
  v10 = &v11;
  -[_PASLock runWithLockAcquired:](internalStateLock, "runWithLockAcquired:", v8);
  LOBYTE(internalStateLock) = *((_BYTE *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)internalStateLock;
}

void __64__ATXStackStateTracker_lastUserScrollWasALongTimeAgoForStackId___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  uint64_t v12;
  id v13;

  objc_msgSend(a2, "stackStateByStackId");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lastUserScrollStackRotationEvent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "date");
  v13 = (id)objc_claimAutoreleasedReturnValue();

  v6 = v13;
  if (v13)
  {
    objc_msgSend(v13, "timeIntervalSinceNow");
    v8 = v7;
    objc_msgSend(MEMORY[0x1E0D80CD0], "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "maxAgeOfStackSuggestionToConsiderStaleInSeconds");
    v11 = -v10;

    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    *(_BYTE *)(v12 + 24) = v8 < v11;
    v6 = v13;
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  }

}

- (BOOL)lastStalenessRotationWasALongTimeAgoForStackId:(id)a3
{
  id v4;
  _PASLock *internalStateLock;
  id v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  internalStateLock = self->_internalStateLock;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __71__ATXStackStateTracker_lastStalenessRotationWasALongTimeAgoForStackId___block_invoke;
  v8[3] = &unk_1E82E42A0;
  v6 = v4;
  v9 = v6;
  v10 = &v11;
  -[_PASLock runWithLockAcquired:](internalStateLock, "runWithLockAcquired:", v8);
  LOBYTE(internalStateLock) = *((_BYTE *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)internalStateLock;
}

void __71__ATXStackStateTracker_lastStalenessRotationWasALongTimeAgoForStackId___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  uint64_t v11;
  id v12;

  objc_msgSend(a2, "stackStateByStackId");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dateOfLastStalenessRotation");
  v12 = (id)objc_claimAutoreleasedReturnValue();

  v5 = v12;
  if (v12)
  {
    objc_msgSend(v12, "timeIntervalSinceNow");
    v7 = v6;
    objc_msgSend(MEMORY[0x1E0D80CD0], "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "maxAgeOfStackSuggestionToConsiderStaleInSeconds");
    v10 = -v9;

    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    *(_BYTE *)(v11 + 24) = v7 < v10;
    v5 = v12;
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  }

}

- (id)topWidgetUniqueIdOfStack:(id)a3
{
  id v4;
  _PASLock *internalStateLock;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__53;
  v16 = __Block_byref_object_dispose__53;
  v17 = 0;
  internalStateLock = self->_internalStateLock;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __49__ATXStackStateTracker_topWidgetUniqueIdOfStack___block_invoke;
  v9[3] = &unk_1E82E42A0;
  v6 = v4;
  v10 = v6;
  v11 = &v12;
  -[_PASLock runWithLockAcquired:](internalStateLock, "runWithLockAcquired:", v9);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __49__ATXStackStateTracker_topWidgetUniqueIdOfStack___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  NSObject *v24;

  v3 = a2;
  objc_msgSend(v3, "stackStateByStackId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (uint64_t *)(a1 + 32);
  objc_msgSend(v4, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "lastStackShownEvent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {

LABEL_4:
    objc_msgSend(v6, "lastStackShownEvent");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "date");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      v12 = v10;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
      v12 = (id)objc_claimAutoreleasedReturnValue();
    }
    v13 = v12;

    objc_msgSend(v6, "lastStackRotationEvent");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "date");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v15)
    {
      v17 = v15;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
      v17 = (id)objc_claimAutoreleasedReturnValue();
    }
    v18 = v17;

    objc_msgSend(v13, "laterDate:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13 == v19)
      objc_msgSend(v6, "lastStackShownEvent");
    else
      objc_msgSend(v6, "lastStackRotationEvent");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "widgetUniqueId");
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v23 = *(void **)(v22 + 40);
    *(_QWORD *)(v22 + 40) = v21;

    goto LABEL_14;
  }
  objc_msgSend(v6, "lastStackRotationEvent");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    goto LABEL_4;
  __atxlog_handle_blending();
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    __49__ATXStackStateTracker_topWidgetUniqueIdOfStack___block_invoke_cold_1(v5, v3, v24);

LABEL_14:
}

- (id)stackStateForStackId:(id)a3
{
  id v4;
  _PASLock *internalStateLock;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__53;
  v16 = __Block_byref_object_dispose__53;
  v17 = 0;
  internalStateLock = self->_internalStateLock;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __45__ATXStackStateTracker_stackStateForStackId___block_invoke;
  v9[3] = &unk_1E82E42C8;
  v11 = &v12;
  v6 = v4;
  v10 = v6;
  -[_PASLock runWithLockAcquired:](internalStateLock, "runWithLockAcquired:", v9);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __45__ATXStackStateTracker_stackStateForStackId___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(a2, "stackStateByStackId");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (id)stackCreationEvent:(id)a3
{
  void *v3;
  void *v4;

  -[ATXStackStateTracker stackStateForStackId:](self, "stackStateForStackId:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stackCreationEvent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)lastStackRotationEvent:(id)a3
{
  void *v3;
  void *v4;

  -[ATXStackStateTracker stackStateForStackId:](self, "stackStateForStackId:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lastStackRotationEvent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)lastStackShownEvent:(id)a3
{
  void *v3;
  void *v4;

  -[ATXStackStateTracker stackStateForStackId:](self, "stackStateForStackId:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lastStackShownEvent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)lastUserScrollStackRotationEvent:(id)a3
{
  void *v3;
  void *v4;

  -[ATXStackStateTracker stackStateForStackId:](self, "stackStateForStackId:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lastUserScrollStackRotationEvent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)layoutForLastStalenessRotation:(id)a3
{
  void *v3;
  void *v4;

  -[ATXStackStateTracker stackStateForStackId:](self, "stackStateForStackId:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layoutForLastStalenessRotation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)setLayoutForLastStalenessRotation:(id)a3 stackId:(id)a4 date:(id)a5
{
  id v8;
  id v9;
  id v10;
  _PASLock *internalStateLock;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  ATXStackStateTracker *v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  internalStateLock = self->_internalStateLock;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __71__ATXStackStateTracker_setLayoutForLastStalenessRotation_stackId_date___block_invoke;
  v15[3] = &unk_1E82E42F0;
  v16 = v9;
  v17 = v8;
  v18 = v10;
  v19 = self;
  v12 = v10;
  v13 = v8;
  v14 = v9;
  -[_PASLock runWithLockAcquired:](internalStateLock, "runWithLockAcquired:", v15);

}

void __71__ATXStackStateTracker_setLayoutForLastStalenessRotation_stackId_date___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  objc_msgSend(v9, "stackStateByStackId");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    v5 = (void *)objc_opt_new();
    objc_msgSend(v9, "stackStateByStackId");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v5, *(_QWORD *)(a1 + 32));

  }
  objc_msgSend(v9, "stackStateByStackId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setLayoutForLastStalenessRotation:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v8, "setDateOfLastStalenessRotation:", *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 56), "coalescedPersistInternalState");

}

- (id)lastThreeUserVisitDatesOfPage:(unint64_t)a3
{
  _PASLock *internalStateLock;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__53;
  v11 = __Block_byref_object_dispose__53;
  v12 = 0;
  internalStateLock = self->_internalStateLock;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __54__ATXStackStateTracker_lastThreeUserVisitDatesOfPage___block_invoke;
  v6[3] = &unk_1E82E4318;
  v6[4] = &v7;
  v6[5] = a3;
  -[_PASLock runWithLockAcquired:](internalStateLock, "runWithLockAcquired:", v6);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __54__ATXStackStateTracker_lastThreeUserVisitDatesOfPage___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  objc_msgSend(a2, "lastThreeUserVisitDatesOfPages");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

- (void)updateStackRotationEvents
{
  OUTLINED_FUNCTION_3(&dword_1C9A3B000, a1, a3, "Timed out getting current SuggestionsWidget and AppPredictionPanel layouts.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_4();
}

void __49__ATXStackStateTracker_updateStackRotationEvents__block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;

  v7 = a3;
  v8 = a4;
  if (v8)
  {
    __atxlog_handle_blending();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      __49__ATXStackStateTracker_updateStackRotationEvents__block_invoke_cold_1((uint64_t)v8, v9, v10, v11, v12, v13, v14, v15);

    objc_msgSend(*(id *)(a1 + 32), "setCurrentSuggestionsWidgetLayouts:", 0);
    v16 = *(void **)(a1 + 32);
    v17 = 0;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "setCurrentSuggestionsWidgetLayouts:", a2);
    v16 = *(void **)(a1 + 32);
    v17 = v7;
  }
  objc_msgSend(v16, "setCurrentAppPredictionPanelLayouts:", v17);
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));

}

- (void)updateStackRotationEventsByQueryingBiome
{
  -[_PASLock runWithLockAcquired:](self->_internalStateLock, "runWithLockAcquired:", &__block_literal_global_147);
}

void __64__ATXStackStateTracker_updateStackRotationEventsByQueryingBiome__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, void *);
  void *v20;
  id v21;
  id v22;
  _QWORD v23[5];
  _QWORD v24[4];
  id v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;

  v2 = a2;
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__53;
  v30 = __Block_byref_object_dispose__53;
  v31 = 0;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSinceNow:", -43200.0);
  v4 = (void *)objc_opt_new();
  objc_msgSend(v3, "timeIntervalSinceReferenceDate");
  objc_msgSend(v4, "genericEventPublisherFromStartTime:consumerSubType:", 34);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)objc_opt_new();
  v7 = MEMORY[0x1E0C809B0];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __64__ATXStackStateTracker_updateStackRotationEventsByQueryingBiome__block_invoke_2;
  v24[3] = &unk_1E82DF748;
  v8 = v3;
  v25 = v8;
  objc_msgSend(v5, "filterWithIsIncluded:", v24);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bookmark");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bookmark");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v7;
  v23[1] = 3221225472;
  v23[2] = __64__ATXStackStateTracker_updateStackRotationEventsByQueryingBiome__block_invoke_151;
  v23[3] = &unk_1E82E43A8;
  v23[4] = &v26;
  v17 = v7;
  v18 = 3221225472;
  v19 = __64__ATXStackStateTracker_updateStackRotationEventsByQueryingBiome__block_invoke_153;
  v20 = &unk_1E82DCD98;
  v12 = v2;
  v21 = v12;
  v13 = v6;
  v22 = v13;
  v14 = (id)objc_msgSend(v9, "sinkWithBookmark:completion:receiveInput:", v11, v23, &v17);

  v15 = objc_alloc(MEMORY[0x1E0CF94A0]);
  v16 = (void *)objc_msgSend(v15, "initWithURLPath:versionNumber:bookmark:metadata:", 0, &unk_1E83CD2E8, v27[5], 0, v17, v18, v19, v20);
  objc_msgSend(v12, "setBookmark:", v16);

  _Block_object_dispose(&v26, 8);
}

uint64_t __64__ATXStackStateTracker_updateStackRotationEventsByQueryingBiome__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  char isKindOfClass;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  int v14;
  uint64_t v15;
  id v16;
  void *v17;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  void *v22;
  void *v23;
  int v24;
  int v25;
  void *v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "eventBody");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v3, "eventBody");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "homeScreenEvent");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
      goto LABEL_16;
    objc_msgSend(v7, "eventTypeString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
      goto LABEL_16;
    v9 = *(void **)(a1 + 32);
    objc_msgSend(v7, "date");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "earlierDate:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "date");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11 == v12)
    {
      v16 = objc_alloc(MEMORY[0x1E0C99D68]);
      objc_msgSend(v3, "timestamp");
      v17 = (void *)objc_msgSend(v16, "initWithTimeIntervalSinceReferenceDate:");
      __atxlog_handle_blending();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v7, "date");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = *(_QWORD *)(a1 + 32);
        v25 = 138543874;
        v26 = v19;
        v27 = 2114;
        v28 = v20;
        v29 = 2114;
        v30 = v17;
        _os_log_impl(&dword_1C9A3B000, v18, OS_LOG_TYPE_DEFAULT, "Encountered a BiomeEvent that has a date before the queryStartDate. ATXHomeScreenEvent Date: %{public}@, Query Start Date: %{public}@, Biome Event Date: %{public}@", (uint8_t *)&v25, 0x20u);

      }
      goto LABEL_16;
    }
    objc_msgSend(v7, "eventTypeString");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v13, "isEqualToString:", CFSTR("Unknown")) & 1) != 0)
    {
      v14 = 0;
LABEL_7:

      objc_msgSend(v7, "stackId");
      v15 = objc_claimAutoreleasedReturnValue();

      if (!v15)
      {
LABEL_17:

        goto LABEL_18;
      }
      if (v14 == 3)
      {
        objc_msgSend(v7, "reason");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringForATXHomeScreenStackChangeReason();
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v22, "isEqualToString:", v23);

        v15 = v24 ^ 1u;
        goto LABEL_17;
      }
      v15 = 1;
      if (v14 == 14 || v14 == 16)
        goto LABEL_17;
LABEL_16:
      v15 = 0;
      goto LABEL_17;
    }
    if ((objc_msgSend(v13, "isEqualToString:", CFSTR("HomeScreenPageShown")) & 1) == 0)
    {
      if ((objc_msgSend(v13, "isEqualToString:", CFSTR("HomeScreenDisappeared")) & 1) != 0)
      {
        v14 = 2;
        goto LABEL_7;
      }
      if ((objc_msgSend(v13, "isEqualToString:", CFSTR("StackChanged")) & 1) != 0)
      {
        v14 = 3;
        goto LABEL_7;
      }
      if ((objc_msgSend(v13, "isEqualToString:", CFSTR("WidgetTapped")) & 1) != 0)
      {
        v14 = 4;
        goto LABEL_7;
      }
      if ((objc_msgSend(v13, "isEqualToString:", CFSTR("WidgetLongLook")) & 1) != 0)
      {
        v14 = 5;
        goto LABEL_7;
      }
      if ((objc_msgSend(v13, "isEqualToString:", CFSTR("WidgetUserFeedback")) & 1) != 0)
      {
        v14 = 6;
        goto LABEL_7;
      }
      if ((objc_msgSend(v13, "isEqualToString:", CFSTR("UserStackConfigChanged")) & 1) != 0)
      {
        v14 = 7;
        goto LABEL_7;
      }
      if ((objc_msgSend(v13, "isEqualToString:", CFSTR("DeviceLocked")) & 1) != 0)
      {
        v14 = 8;
        goto LABEL_7;
      }
      if ((objc_msgSend(v13, "isEqualToString:", CFSTR("DeviceUnlocked")) & 1) != 0)
      {
        v14 = 9;
        goto LABEL_7;
      }
      if ((objc_msgSend(v13, "isEqualToString:", CFSTR("PinnedWidgetAdded")) & 1) != 0)
      {
        v14 = 10;
        goto LABEL_7;
      }
      if ((objc_msgSend(v13, "isEqualToString:", CFSTR("PinnedWidgetDeleted")) & 1) != 0)
      {
        v14 = 11;
        goto LABEL_7;
      }
      if ((objc_msgSend(v13, "isEqualToString:", CFSTR("SpecialPageAppeared")) & 1) == 0)
      {
        if ((objc_msgSend(v13, "isEqualToString:", CFSTR("SpecialPageDisappeared")) & 1) != 0)
        {
          v14 = 13;
        }
        else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("StackShown")) & 1) != 0)
        {
          v14 = 14;
        }
        else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("StackDisappeared")) & 1) != 0)
        {
          v14 = 15;
        }
        else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("StackCreated")) & 1) != 0)
        {
          v14 = 16;
        }
        else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("StackDeleted")) & 1) != 0)
        {
          v14 = 17;
        }
        else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("WidgetAddedToStack")) & 1) != 0)
        {
          v14 = 18;
        }
        else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("WidgetRemovedFromStack")) & 1) != 0)
        {
          v14 = 19;
        }
        else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("StackVisibilityChanged")) & 1) != 0)
        {
          v14 = 20;
        }
        else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("AppAdded")) & 1) != 0)
        {
          v14 = 21;
        }
        else if (objc_msgSend(v13, "isEqualToString:", CFSTR("AppRemoved")))
        {
          v14 = 22;
        }
        else
        {
          v14 = 0;
        }
        goto LABEL_7;
      }
    }

    v15 = 1;
    goto LABEL_17;
  }
  v15 = 0;
LABEL_18:

  return v15;
}

void __64__ATXStackStateTracker_updateStackRotationEventsByQueryingBiome__block_invoke_151(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;

  v5 = a2;
  v6 = a3;
  if (objc_msgSend(v5, "state") == 1)
  {
    __atxlog_handle_blending();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      __64__ATXStackStateTracker_updateStackRotationEventsByQueryingBiome__block_invoke_151_cold_1(v5, v7);

  }
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v6;

}

void __64__ATXStackStateTracker_updateStackRotationEventsByQueryingBiome__block_invoke_153(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  char isKindOfClass;
  void *v6;
  void *v7;
  id v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  NSObject *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  int v42;
  const __CFString *v43;
  void *v44;
  void *v45;
  int v46;
  void *v47;
  void *v48;
  int v49;
  void *v50;
  void *v51;
  int v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  uint64_t v58;
  uint8_t buf[4];
  void *v60;
  __int16 v61;
  void *v62;
  __int16 v63;
  void *v64;
  __int16 v65;
  void *v66;
  __int16 v67;
  void *v68;
  __int16 v69;
  void *v70;
  __int16 v71;
  const __CFString *v72;
  uint64_t v73;

  v73 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "eventBody");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v3, "eventBody");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "homeScreenEvent");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "eventTypeString");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v8, "isEqualToString:", CFSTR("Unknown")) & 1) != 0)
    {
      v9 = 0;
    }
    else
    {
      if ((objc_msgSend(v8, "isEqualToString:", CFSTR("HomeScreenPageShown")) & 1) != 0)
      {

        v10 = *(void **)(a1 + 32);
        objc_msgSend(v7, "metadata");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "pageIndex");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "date");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "updateLastThreeUserVisitDatesIfNecessaryForPage:date:", v12, v13);
LABEL_6:

LABEL_7:
LABEL_71:

        goto LABEL_72;
      }
      if ((objc_msgSend(v8, "isEqualToString:", CFSTR("HomeScreenDisappeared")) & 1) != 0)
      {
        v9 = 2;
      }
      else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("StackChanged")) & 1) != 0)
      {
        v9 = 3;
      }
      else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("WidgetTapped")) & 1) != 0)
      {
        v9 = 4;
      }
      else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("WidgetLongLook")) & 1) != 0)
      {
        v9 = 5;
      }
      else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("WidgetUserFeedback")) & 1) != 0)
      {
        v9 = 6;
      }
      else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("UserStackConfigChanged")) & 1) != 0)
      {
        v9 = 7;
      }
      else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("DeviceLocked")) & 1) != 0)
      {
        v9 = 8;
      }
      else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("DeviceUnlocked")) & 1) != 0)
      {
        v9 = 9;
      }
      else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("PinnedWidgetAdded")) & 1) != 0)
      {
        v9 = 10;
      }
      else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("PinnedWidgetDeleted")) & 1) != 0)
      {
        v9 = 11;
      }
      else
      {
        if ((objc_msgSend(v8, "isEqualToString:", CFSTR("SpecialPageAppeared")) & 1) != 0)
        {

          objc_msgSend(v7, "metadata");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "pageIndex");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v15, "unsignedIntegerValue");

          if (v16 != 2)
          {
LABEL_72:

            goto LABEL_73;
          }
          v17 = *(void **)(a1 + 32);
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *MEMORY[0x1E0CF9338]);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "date");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "updateLastThreeUserVisitDatesIfNecessaryForPage:date:", v11, v12);
          goto LABEL_7;
        }
        if ((objc_msgSend(v8, "isEqualToString:", CFSTR("SpecialPageDisappeared")) & 1) != 0)
        {
          v9 = 13;
        }
        else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("StackShown")) & 1) != 0)
        {
          v9 = 14;
        }
        else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("StackDisappeared")) & 1) != 0)
        {
          v9 = 15;
        }
        else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("StackCreated")) & 1) != 0)
        {
          v9 = 16;
        }
        else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("StackDeleted")) & 1) != 0)
        {
          v9 = 17;
        }
        else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("WidgetAddedToStack")) & 1) != 0)
        {
          v9 = 18;
        }
        else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("WidgetRemovedFromStack")) & 1) != 0)
        {
          v9 = 19;
        }
        else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("StackVisibilityChanged")) & 1) != 0)
        {
          v9 = 20;
        }
        else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("AppAdded")) & 1) != 0)
        {
          v9 = 21;
        }
        else if (objc_msgSend(v8, "isEqualToString:", CFSTR("AppRemoved")))
        {
          v9 = 22;
        }
        else
        {
          v9 = 0;
        }
      }
    }

    objc_msgSend(*(id *)(a1 + 32), "stackStateByStackId");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stackId");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "objectForKeyedSubscript:", v19);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v11)
    {
      v11 = (void *)objc_opt_new();
      objc_msgSend(*(id *)(a1 + 32), "stackStateByStackId");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "stackId");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setObject:forKeyedSubscript:", v11, v21);

    }
    if (v9 == 14)
    {
      __atxlog_handle_blending();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v7, "stackId");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "date");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "stackId");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "eventTypeString");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "widgetBundleId");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "reason");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544642;
        v60 = v30;
        v61 = 2114;
        v62 = v31;
        v63 = 2112;
        v64 = v32;
        v65 = 2112;
        v66 = v33;
        v67 = 2112;
        v68 = v34;
        v69 = 2114;
        v70 = v35;
        _os_log_impl(&dword_1C9A3B000, v29, OS_LOG_TYPE_DEFAULT, "Found a stack shown event for stack %{public}@: %{public}@ - %@: %@ - %@ - %{public}@", buf, 0x3Eu);

      }
      objc_msgSend(v11, "setLastStackShownEvent:", v7);
      goto LABEL_71;
    }
    if (v9 == 16)
    {
      __atxlog_handle_blending();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v7, "stackId");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "date");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "stackId");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "eventTypeString");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "widgetBundleId");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "reason");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544642;
        v60 = v23;
        v61 = 2114;
        v62 = v24;
        v63 = 2112;
        v64 = v25;
        v65 = 2112;
        v66 = v26;
        v67 = 2112;
        v68 = v27;
        v69 = 2114;
        v70 = v28;
        _os_log_impl(&dword_1C9A3B000, v22, OS_LOG_TYPE_DEFAULT, "Found a stack creation event for stack %{public}@: %{public}@ - %@: %@ - %@ - %{public}@", buf, 0x3Eu);

      }
      objc_msgSend(v11, "setStackCreationEvent:", v7);
      goto LABEL_71;
    }
    __atxlog_handle_blending();
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v7, "stackId");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "date");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "stackId");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "eventTypeString");
      v58 = a1;
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "widgetBundleId");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "reason");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "metadata");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "isStalenessRotation");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = objc_msgSend(v41, "BOOLValue");
      *(_DWORD *)buf = 138544898;
      v43 = CFSTR("NO");
      v60 = v57;
      v61 = 2114;
      if (v42)
        v43 = CFSTR("YES");
      v62 = v55;
      v63 = 2112;
      v64 = v37;
      v65 = 2112;
      v66 = v38;
      v67 = 2112;
      v68 = v39;
      v69 = 2114;
      v70 = v40;
      v71 = 2114;
      v72 = v43;
      _os_log_impl(&dword_1C9A3B000, v36, OS_LOG_TYPE_DEFAULT, "Found a stack rotation event for stack %{public}@: %{public}@ - %@: %@ - %@ - %{public}@ - isStalenessRotation %{public}@", buf, 0x48u);

      a1 = v58;
    }

    objc_msgSend(v11, "setLastStackRotationEvent:", v7);
    objc_msgSend(v7, "reason");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringForATXHomeScreenStackChangeReason();
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = objc_msgSend(v44, "isEqualToString:", v45);

    if (v46)
    {
      objc_msgSend(v11, "setLastUserScrollStackRotationEvent:", v7);
      goto LABEL_71;
    }
    objc_msgSend(v7, "reason");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringForATXHomeScreenStackChangeReason();
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = objc_msgSend(v47, "isEqualToString:", v48);

    if (!v49)
      goto LABEL_71;
    objc_msgSend(v7, "metadata");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "isStalenessRotation");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = objc_msgSend(v51, "BOOLValue");

    if (!v52)
      goto LABEL_71;
    objc_msgSend(v7, "date");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setDateOfLastStalenessRotation:", v53);

    objc_msgSend(v7, "blendingCacheId");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = *(void **)(a1 + 40);
    objc_msgSend(v7, "stackId");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "setObject:forKeyedSubscript:", v12, v13);
    goto LABEL_6;
  }
LABEL_73:

}

- (id)_blendingCacheIdToStackIdMap:(id)a3
{
  id v3;
  void *v4;
  id v5;
  _QWORD v7[4];
  id v8;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __53__ATXStackStateTracker__blendingCacheIdToStackIdMap___block_invoke;
  v7[3] = &unk_1E82E43D0;
  v5 = v4;
  v8 = v5;
  objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v7);

  return v5;
}

void __53__ATXStackStateTracker__blendingCacheIdToStackIdMap___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;

  v7 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    v6 = (void *)objc_opt_new();
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v6, v5);
  }
  objc_msgSend(v6, "addObject:", v7);

}

- (void)cleanupOldDataWithHomeScreenPages:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  _PASLock *internalStateLock;
  id v21;
  NSObject *v22;
  id obj;
  uint64_t v25;
  _QWORD v26[4];
  id v27;
  ATXStackStateTracker *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint8_t buf[16];
  _BYTE v38[128];
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  __atxlog_handle_blending();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C9A3B000, v4, OS_LOG_TYPE_DEFAULT, "Cleaning up state in ATXStackStateTracker...", buf, 2u);
  }

  v5 = (void *)objc_opt_new();
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  obj = v3;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
  if (v6)
  {
    v7 = v6;
    v25 = *(_QWORD *)v34;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v34 != v25)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * v8);
        v10 = (void *)MEMORY[0x1CAA48B6C]();
        v29 = 0u;
        v30 = 0u;
        v31 = 0u;
        v32 = 0u;
        objc_msgSend(v9, "config");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "stacks");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v29, v38, 16);
        if (v13)
        {
          v14 = v13;
          v15 = *(_QWORD *)v30;
          do
          {
            v16 = 0;
            do
            {
              if (*(_QWORD *)v30 != v15)
                objc_enumerationMutation(v12);
              v17 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * v16);
              v18 = (void *)MEMORY[0x1CAA48B6C]();
              objc_msgSend(v17, "identifier");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v5, "addObject:", v19);

              objc_autoreleasePoolPop(v18);
              ++v16;
            }
            while (v14 != v16);
            v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v29, v38, 16);
          }
          while (v14);
        }

        objc_autoreleasePoolPop(v10);
        ++v8;
      }
      while (v8 != v7);
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
    }
    while (v7);
  }

  internalStateLock = self->_internalStateLock;
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __58__ATXStackStateTracker_cleanupOldDataWithHomeScreenPages___block_invoke;
  v26[3] = &unk_1E82E43F8;
  v27 = v5;
  v28 = self;
  v21 = v5;
  -[_PASLock runWithLockAcquired:](internalStateLock, "runWithLockAcquired:", v26);
  __atxlog_handle_blending();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C9A3B000, v22, OS_LOG_TYPE_DEFAULT, "Done cleaning up state in ATXStackStateTracker.", buf, 2u);
  }

}

void __58__ATXStackStateTracker_cleanupOldDataWithHomeScreenPages___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = objc_alloc(MEMORY[0x1E0C99E20]);
  objc_msgSend(v3, "stackStateByStackId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "initWithArray:", v6);

  objc_msgSend(v7, "minusSet:", *(_QWORD *)(a1 + 32));
  __atxlog_handle_blending();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v14 = 138412290;
    v15 = (uint64_t)v7;
    _os_log_impl(&dword_1C9A3B000, v8, OS_LOG_TYPE_DEFAULT, "Removing entries for the following stacks from ATXStackStateTracker: %@", (uint8_t *)&v14, 0xCu);
  }

  objc_msgSend(v3, "stackStateByStackId");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "allObjects");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "removeObjectsForKeys:", v10);

  __atxlog_handle_blending();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v3, "stackStateByStackId");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "count");
    v14 = 134217984;
    v15 = v13;
    _os_log_impl(&dword_1C9A3B000, v11, OS_LOG_TYPE_DEFAULT, "Entries for %lu stacks remain in ATXStackStateTracker", (uint8_t *)&v14, 0xCu);

  }
  objc_msgSend(*(id *)(a1 + 40), "coalescedPersistInternalState");

}

- (void)handleSigterm
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__ATXStackStateTracker_handleSigterm__block_invoke;
  block[3] = &unk_1E82DAC38;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __37__ATXStackStateTracker_handleSigterm__block_invoke(uint64_t result)
{
  uint64_t v1;

  v1 = *(_QWORD *)(result + 32);
  if (*(_QWORD *)(v1 + 8))
    return objc_msgSend(*(id *)(v1 + 24), "runImmediately");
  return result;
}

- (void)_persistInternalStateImmediatelyOnSigterm
{
  ATXSigtermListener *v3;
  ATXSigtermListener *sigtermListener;

  if (!self->_sigtermListener)
  {
    objc_msgSend(MEMORY[0x1E0CF94F8], "sharedInstance");
    v3 = (ATXSigtermListener *)objc_claimAutoreleasedReturnValue();
    sigtermListener = self->_sigtermListener;
    self->_sigtermListener = v3;

    -[ATXSigtermListener registerObserver:](self->_sigtermListener, "registerObserver:", self);
  }
}

- (void)coalescedPersistInternalState
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__ATXStackStateTracker_coalescedPersistInternalState__block_invoke;
  block[3] = &unk_1E82DAC38;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __53__ATXStackStateTracker_coalescedPersistInternalState__block_invoke(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = *(_QWORD **)(a1 + 32);
  if (!v2[1])
  {
    v3 = os_transaction_create();
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 8);
    *(_QWORD *)(v4 + 8) = v3;

    v2 = *(_QWORD **)(a1 + 32);
  }
  objc_msgSend(v2, "_persistInternalStateImmediatelyOnSigterm");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "runAfterDelaySeconds:coalescingBehavior:", 0, 10.0);
}

void __44__ATXStackStateTracker_persistInternalState__block_invoke_164(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 8);
  *(_QWORD *)(v1 + 8) = 0;

}

- (BOOL)loadInternalState
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  BOOL v8;
  BOOL v9;
  _PASLock *v10;
  _PASLock *v11;
  NSObject *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _PASLock *v21;
  NSObject *v22;
  id v23;
  _PASLock *v24;
  _PASLock *internalStateLock;
  id v27;
  uint8_t buf[4];
  const char *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1CAA48B6C](self, a2);
  -[ATXStackStateTracker dataFromDisk](self, "dataFromDisk");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)MEMORY[0x1CAA48B6C]();
    v27 = 0;
    objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v4, &v27);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v27;
    objc_autoreleasePoolPop(v5);
    if (v7)
      v8 = 1;
    else
      v8 = v6 == 0;
    v9 = !v8;
    if (v8)
    {
      __atxlog_handle_blending();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        -[ATXStackStateTracker loadInternalState].cold.2((uint64_t)v7, (uint64_t)v6, v22);

      v23 = objc_alloc(MEMORY[0x1E0D815F0]);
      v12 = objc_opt_new();
      v24 = (_PASLock *)objc_msgSend(v23, "initWithGuardedData:", v12);
      internalStateLock = self->_internalStateLock;
      self->_internalStateLock = v24;

    }
    else
    {
      v10 = (_PASLock *)objc_msgSend(objc_alloc(MEMORY[0x1E0D815F0]), "initWithGuardedData:", v6);
      v11 = self->_internalStateLock;
      self->_internalStateLock = v10;

      __atxlog_handle_blending();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446210;
        v29 = "-[ATXStackStateTracker loadInternalState]";
        _os_log_impl(&dword_1C9A3B000, v12, OS_LOG_TYPE_DEFAULT, "%{public}s: Success", buf, 0xCu);
      }
    }

  }
  else
  {
    __atxlog_handle_blending();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[ATXStackStateTracker loadInternalState].cold.1(v13, v14, v15, v16, v17, v18, v19, v20);

    v7 = (id)objc_opt_new();
    v21 = (_PASLock *)objc_msgSend(objc_alloc(MEMORY[0x1E0D815F0]), "initWithGuardedData:", v7);
    v9 = 0;
    v6 = self->_internalStateLock;
    self->_internalStateLock = v21;
  }

  objc_autoreleasePoolPop(v3);
  return v9;
}

- (id)dataFromDisk
{
  NSString **p_path;
  NSObject *v3;
  int v4;
  int v5;
  id v6;
  int v7;
  NSObject *v8;
  NSObject *v9;
  NSString *v10;
  int *v11;
  char *v12;
  stat v14;
  _BYTE buf[12];
  __int16 v16;
  char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  memset(&v14.st_size, 0, 48);
  p_path = &self->_path;
  if (!lstat(-[NSString fileSystemRepresentation](self->_path, "fileSystemRepresentation", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0), &v14)&& v14.st_size > 0x200000)
  {
    __atxlog_handle_blending();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
      -[ATXStackStateTracker dataFromDisk].cold.1(v3);

LABEL_16:
    v6 = 0;
    return v6;
  }
  v4 = open(-[NSString UTF8String](*p_path, "UTF8String"), 0);
  if (v4 == -1)
  {
    v7 = *__error();
    __atxlog_handle_blending();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v7 == 2)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v10 = *p_path;
        v11 = __error();
        v12 = strerror(*v11);
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v10;
        v16 = 2082;
        v17 = v12;
        _os_log_impl(&dword_1C9A3B000, v9, OS_LOG_TYPE_DEFAULT, "Stack state tracker file at path %{public}@ exists but we were unable to read it. Error: %{public}s", buf, 0x16u);
      }
    }
    else if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      -[ATXStackStateTracker dataFromDisk].cold.2();
    }

    goto LABEL_16;
  }
  v5 = v4;
  *(_QWORD *)buf = 0;
  ATXCacheFileRead();
  if ((v5 & 0x80000000) == 0)
    close(v5);
  v6 = *(id *)buf;

  return v6;
}

- (NSDictionary)currentSuggestionsWidgetLayouts
{
  return self->_currentSuggestionsWidgetLayouts;
}

- (void)setCurrentSuggestionsWidgetLayouts:(id)a3
{
  objc_storeStrong((id *)&self->_currentSuggestionsWidgetLayouts, a3);
}

- (NSDictionary)currentAppPredictionPanelLayouts
{
  return self->_currentAppPredictionPanelLayouts;
}

- (void)setCurrentAppPredictionPanelLayouts:(id)a3
{
  objc_storeStrong((id *)&self->_currentAppPredictionPanelLayouts, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentAppPredictionPanelLayouts, 0);
  objc_storeStrong((id *)&self->_currentSuggestionsWidgetLayouts, 0);
  objc_storeStrong((id *)&self->_sigtermListener, 0);
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_internalStateLock, 0);
  objc_storeStrong((id *)&self->_coalescedPersistInternalStateOperation, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
}

void __37__ATXStackStateTracker_stackIsStale___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_3(&dword_1C9A3B000, a2, a3, "Stack %{public}@ is stale because no rotations have happened recently.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

void __37__ATXStackStateTracker_stackIsStale___block_invoke_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_3(&dword_1C9A3B000, a2, a3, "Stack %{public}@ is not stale because it was created recently.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

void __37__ATXStackStateTracker_stackIsStale___block_invoke_cold_3(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = *(_QWORD *)(a1 + 32);
  objc_msgSend(a2, "stackStateByStackId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138543618;
  v9 = v5;
  v10 = 2114;
  v11 = v7;
  _os_log_debug_impl(&dword_1C9A3B000, a3, OS_LOG_TYPE_DEBUG, "Stack state for stackId %{public}@:\n%{public}@", (uint8_t *)&v8, 0x16u);

}

void __49__ATXStackStateTracker_topWidgetUniqueIdOfStack___block_invoke_cold_1(uint64_t *a1, void *a2, NSObject *a3)
{
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  int v8;
  const char *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = *a1;
  objc_msgSend(a2, "stackStateByStackId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 136315650;
  v9 = "-[ATXStackStateTracker topWidgetUniqueIdOfStack:]_block_invoke";
  v10 = 2114;
  v11 = v4;
  v12 = 2112;
  v13 = v6;
  OUTLINED_FUNCTION_2_7(&dword_1C9A3B000, a3, v7, "%s: Failed for stack %{public}@. internalState.stackStateByStackId has entry for stacks %@", (uint8_t *)&v8);

  OUTLINED_FUNCTION_16();
}

void __49__ATXStackStateTracker_updateStackRotationEvents__block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, a2, a3, "Error getting current SuggestionsWidget and AppPredictionPanel layouts: %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

void __64__ATXStackStateTracker_updateStackRotationEventsByQueryingBiome__block_invoke_151_cold_1(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v3;
  _os_log_fault_impl(&dword_1C9A3B000, a2, OS_LOG_TYPE_FAULT, "Biome query for HomeScreen UI events completed with failure. Error: %@", (uint8_t *)&v4, 0xCu);

}

void __44__ATXStackStateTracker_persistInternalState__block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, a2, a3, "ATXStackStateTracker: Couldn't persist internal state due to error: %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

void __44__ATXStackStateTracker_persistInternalState__block_invoke_cold_2()
{
  int *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  __error();
  v0 = __error();
  strerror(*v0);
  OUTLINED_FUNCTION_4_7();
  OUTLINED_FUNCTION_3_11(&dword_1C9A3B000, v1, v2, "ATXStackStateTracker: Couldn't persist internal state - unable to create cache file at path %{public}@: [%i] %{public}s", v3, v4, v5, v6, 2u);
  OUTLINED_FUNCTION_16();
}

void __44__ATXStackStateTracker_persistInternalState__block_invoke_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_1C9A3B000, a1, a3, "ATXStackStateTracker: Couldn't persist internal state due to ATXCacheFileWrite failure.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_4();
}

- (void)loadInternalState
{
  int v3;
  const char *v4;
  __int16 v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = 136446722;
  v4 = "-[ATXStackStateTracker loadInternalState]";
  v5 = 2112;
  v6 = a1;
  v7 = 2112;
  v8 = a2;
  OUTLINED_FUNCTION_2_7(&dword_1C9A3B000, a3, (uint64_t)a3, "%{public}s: Using empty internal state because loadInternalState failed (unarchiveErr %@, internalState %@)", (uint8_t *)&v3);
}

- (void)dataFromDisk
{
  int *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  __error();
  v0 = __error();
  strerror(*v0);
  OUTLINED_FUNCTION_4_7();
  OUTLINED_FUNCTION_3_11(&dword_1C9A3B000, v1, v2, "No stack state tracker file found at path %{public}@: [%{public}i] %{public}s", v3, v4, v5, v6, 2u);
  OUTLINED_FUNCTION_16();
}

@end
