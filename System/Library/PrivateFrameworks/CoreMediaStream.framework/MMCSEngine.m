@implementation MMCSEngine

- (BOOL)hasOutstandingActivity
{
  return 0;
}

- (MMCSEngine)initWithWorkPath:(id)a3 appIDHeader:(id)a4 dataClass:(id)a5 options:(id)a6 modes:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  MMCSEngine *v18;
  MMCSEngine *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  NSThread *workThread;
  objc_super v25;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v25.receiver = self;
  v25.super_class = (Class)MMCSEngine;
  v18 = -[MMCSEngine init](&v25, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_workPathURL, a3);
    v19->_engineClientContext.version = 2;
    v19->_engineClientContext.context = v19;
    v19->_engineClientContext.getFileDescriptorAndContentTypeFromItemCallback = _getFileDescriptorAndContentTypeFromItemCallback;
    v19->_engineClientContext.getItemProgressCallback = _getItemProgressCallback_5107;
    v19->_engineClientContext.getItemDoneCallback = _getItemDoneCallback_5108;
    v19->_engineClientContext.putItemProgressCallback = _putItemProgressCallback_5109;
    v19->_engineClientContext.putItemDoneCallback = _putItemDoneCallback_5110;
    v19->_engineClientContext.requestCompletedCallback = _requestCompletedCallback_5111;
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v20;
    if (v13)
      objc_msgSend(v20, "setObject:forKey:", v13, CFSTR("workPathURL"));
    if (v14)
      objc_msgSend(v21, "setObject:forKey:", v14, CFSTR("appIDHeader"));
    if (v15)
      objc_msgSend(v21, "setObject:forKey:", v15, CFSTR("dataClass"));
    if (v16)
      objc_msgSend(v21, "setObject:forKey:", v16, CFSTR("options"));
    if (v17)
      objc_msgSend(v21, "setObject:forKey:", v17, CFSTR("modes"));
    v22 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3978]), "initWithTarget:selector:object:", v19, sel_threadMain_, v21);
    workThread = v19->_workThread;
    v19->_workThread = (NSThread *)v22;

    -[NSThread start](v19->_workThread, "start");
  }

  return v19;
}

- (MMCSEngine)initWithWorkPath:(id)a3 appIDHeader:(id)a4 dataClass:(id)a5 options:(id)a6
{
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  MMCSEngine *v17;

  v10 = (void *)MEMORY[0x1E0C99D20];
  v11 = *MEMORY[0x1E0C99748];
  v12 = a6;
  v13 = a5;
  v14 = a4;
  v15 = a3;
  objc_msgSend(v10, "arrayWithObject:", v11);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[MMCSEngine initWithWorkPath:appIDHeader:dataClass:options:modes:](self, "initWithWorkPath:appIDHeader:dataClass:options:modes:", v15, v14, v13, v12, v16);

  return v17;
}

- (void)performBlock:(id)a3
{
  (*((void (**)(id))a3 + 2))(a3);
}

- (void)performBlockOnWorkThread:(id)a3 waitUntilDone:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  void *v7;
  int v8;
  NSThread *workThread;
  uint64_t v10;
  void (**v11)(void);

  v4 = a4;
  v6 = (void *)MEMORY[0x1E0CB3978];
  v11 = (void (**)(void))a3;
  objc_msgSend(v6, "currentThread");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqual:", self->_workThread);

  if (v8)
  {
    v11[2]();
  }
  else
  {
    workThread = self->_workThread;
    v10 = objc_msgSend(v11, "copy");

    -[MMCSEngine performSelector:onThread:withObject:waitUntilDone:](self, "performSelector:onThread:withObject:waitUntilDone:", sel_performBlock_, workThread, v10, v4);
    v11 = (void (**)(void))v10;
  }

}

- (void)performBlockOnWorkThread:(id)a3
{
  -[MMCSEngine performBlockOnWorkThread:waitUntilDone:](self, "performBlockOnWorkThread:waitUntilDone:", a3, 0);
}

- (void)threadMain:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSMutableDictionary *v7;
  NSMutableDictionary *itemIDToAssetMap;
  OS_dispatch_queue *v9;
  OS_dispatch_queue *itemIDToAssetMapQueue;
  NSMutableArray *v11;
  NSMutableArray *requestorContexts;
  OS_dispatch_queue *v13;
  OS_dispatch_queue *reqestorContextQueue;
  OS_dispatch_queue *v15;
  OS_dispatch_queue *autoItemIDDictionaryQueue;
  NSTimer *v17;
  NSTimer *threadKeepAliveTimer;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  char v23;
  uint8_t v24[16];

  v4 = a3;
  v5 = (void *)MEMORY[0x1D8255C20]();
  objc_msgSend(MEMORY[0x1E0C99E58], "currentRunLoop");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "getCFRunLoop");
  objc_msgSend(v4, "objectForKey:", CFSTR("modes"));
  objc_msgSend(v4, "objectForKey:", CFSTR("workPathURL"));
  objc_msgSend(v4, "objectForKey:", CFSTR("appIDHeader"));
  objc_msgSend(v4, "objectForKey:", CFSTR("dataClass"));
  objc_msgSend(v4, "objectForKey:", CFSTR("options"));
  self->_engine = (_mmcs_engine *)MMCSEngineCreate();

  if (self->_engine)
  {
    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    itemIDToAssetMap = self->_itemIDToAssetMap;
    self->_itemIDToAssetMap = v7;

    v9 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.MMCSKit.itemIDToAssetMapQueue", 0);
    itemIDToAssetMapQueue = self->_itemIDToAssetMapQueue;
    self->_itemIDToAssetMapQueue = v9;

    v11 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    requestorContexts = self->_requestorContexts;
    self->_requestorContexts = v11;

    v13 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.MMCSKit.requestorContextQueue", 0);
    reqestorContextQueue = self->_reqestorContextQueue;
    self->_reqestorContextQueue = v13;

    v15 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.MMCSKit.autoItemIDDictionaryQueue", 0);
    autoItemIDDictionaryQueue = self->_autoItemIDDictionaryQueue;
    self->_autoItemIDDictionaryQueue = v15;

    objc_msgSend(MEMORY[0x1E0C99E88], "timerWithTimeInterval:target:selector:userInfo:repeats:", self, sel__doNothingTimerHandler_, 0, 1, 10000000.0);
    v17 = (NSTimer *)objc_claimAutoreleasedReturnValue();
    threadKeepAliveTimer = self->_threadKeepAliveTimer;
    self->_threadKeepAliveTimer = v17;

    objc_msgSend(MEMORY[0x1E0C99E58], "currentRunLoop");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addTimer:forMode:", self->_threadKeepAliveTimer, *MEMORY[0x1E0C99860]);

    if (!-[MMCSEngine isDone](self, "isDone"))
    {
      v20 = *MEMORY[0x1E0C99748];
      do
      {
        objc_msgSend(MEMORY[0x1E0C99E58], "currentRunLoop");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v21, "runMode:beforeDate:", v20, v22);

        if ((v23 & 1) == 0)
          -[MMCSEngine setIsDone:](self, "setIsDone:", 1);
      }
      while (!-[MMCSEngine isDone](self, "isDone"));
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v24 = 0;
    _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Could not create MMCS Engine!", v24, 2u);
  }
  objc_autoreleasePoolPop(v5);

}

- (void)setIsMetricsGatheringEnabled:(BOOL)a3
{
  _QWORD v3[5];
  BOOL v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __43__MMCSEngine_setIsMetricsGatheringEnabled___block_invoke;
  v3[3] = &unk_1E95BBD60;
  v4 = a3;
  v3[4] = self;
  -[MMCSEngine performBlockOnWorkThread:](self, "performBlockOnWorkThread:", v3);
}

- (BOOL)_getFileDescriptorAndContentTypeFromItemID:(unint64_t)a3 outFD:(int *)a4 outItemType:(id *)a5 outError:(id *)a6
{
  void *v11;
  void *v12;
  int v13;
  int v14;
  id v15;
  id v16;
  uint8_t buf[4];
  _BYTE v19[24];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134217984;
    *(_QWORD *)v19 = a3;
    _os_log_debug_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "Getting file descriptor for itemID %lld", buf, 0xCu);
  }
  -[MMCSEngine _assetWithItemID:](self, "_assetWithItemID:", a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    v13 = objc_msgSend(v11, "MMCSOpenNewFileDescriptor");
    if (v13 != -1)
    {
      v14 = v13;
      objc_msgSend(v12, "MMCSItemType");
      v15 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "MMCSErrorWithDomain:code:description:", CFSTR("kMMCSKitErrorDomain"), 1, CFSTR("ERROR_CANNOT_GET_FD_P_ASSET"), v12);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "MMCSErrorWithDomain:code:description:", CFSTR("kMMCSKitErrorDomain"), 0, CFSTR("ERROR_CANNOT_FIND_ASSET_P_ITEMID"), a3);
  }
  v16 = (id)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218242;
      *(_QWORD *)v19 = a3;
      *(_WORD *)&v19[8] = 2114;
      *(_QWORD *)&v19[10] = v16;
      _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Could not get file descriptor for itemID %lld. Error: %{public}@", buf, 0x16u);
      if (a6)
        goto LABEL_11;
    }
    else if (a6)
    {
LABEL_11:
      v16 = objc_retainAutorelease(v16);
      v15 = 0;
      *a6 = v16;
      goto LABEL_23;
    }
    v15 = 0;
LABEL_23:
    v14 = -1;
    if (!a4)
      goto LABEL_20;
    goto LABEL_19;
  }
  v15 = 0;
  v14 = -1;
LABEL_13:
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109634;
    *(_DWORD *)v19 = v14;
    *(_WORD *)&v19[4] = 2048;
    *(_QWORD *)&v19[6] = a3;
    *(_WORD *)&v19[14] = 2114;
    *(_QWORD *)&v19[16] = v15;
    _os_log_debug_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "Got file descriptor %d for itemID %lld. UTI: %{public}@", buf, 0x1Cu);
  }
  v16 = 0;
  if (a5 && v15)
  {
    v15 = objc_retainAutorelease(v15);
    v16 = 0;
    *a5 = v15;
  }
  if (a4)
LABEL_19:
    *a4 = v14;
LABEL_20:

  return v14 != -1;
}

- (void)_getItemProgressItemID:(unint64_t)a3 state:(int)a4 progress:(double)a5 requestorContext:(id)a6 error:(id)a7
{
  uint64_t v8;
  void *v11;
  _BOOL4 v12;
  void *v13;
  NSObject *v14;
  const char *v15;
  uint32_t v16;
  id WeakRetained;
  double v18;
  int v19;
  double v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v8 = *(_QWORD *)&a4;
  v25 = *MEMORY[0x1E0C80C00];
  -[MMCSEngine _assetWithItemID:](self, "_assetWithItemID:", a3, *(_QWORD *)&a4, a6, a7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v12 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
    if (a5 == -1.0)
    {
      if (v12)
      {
        +[MMCSEngine logStringForGetItemState:](MMCSEngine, "logStringForGetItemState:", v8);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = 138543618;
        v20 = *(double *)&v13;
        v21 = 2048;
        v22 = v11;
        v14 = MEMORY[0x1E0C81028];
        v15 = "Get item progress state: %{public}@ asset: %p";
        v16 = 22;
        goto LABEL_11;
      }
    }
    else if (v12)
    {
      +[MMCSEngine logStringForGetItemState:](MMCSEngine, "logStringForGetItemState:", v8);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 134218498;
      v20 = a5;
      v21 = 2114;
      v22 = v13;
      v23 = 2048;
      v24 = v11;
      v14 = MEMORY[0x1E0C81028];
      v15 = "Get item progress: %f state: %{public}@ asset: %p";
      v16 = 32;
LABEL_11:
      _os_log_debug_impl(&dword_1D3E94000, v14, OS_LOG_TYPE_DEBUG, v15, (uint8_t *)&v19, v16);

    }
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    *(float *)&v18 = a5;
    objc_msgSend(WeakRetained, "MMCSEngine:didMakeGetProgress:state:onAsset:", self, v8, v11, v18);

    goto LABEL_9;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v19 = 134217984;
    v20 = *(double *)&a3;
    _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Get item progress: Could not get asset for item ID %lld. Ignoring.", (uint8_t *)&v19, 0xCu);
  }
LABEL_9:

}

- (void)_getItemDoneItemID:(unint64_t)a3 path:(id)a4 requestorContext:(id)a5 error:(id)a6
{
  id v9;
  id v10;
  void *v11;
  id WeakRetained;
  int v13;
  unint64_t v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v9 = a4;
  v10 = a6;
  -[MMCSEngine _assetWithItemID:](self, "_assetWithItemID:", a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    if (v10)
    {
      if ((objc_msgSend(v10, "MMCSIsAuthorizationError") & 1) == 0
        && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        v13 = 138543618;
        v14 = (unint64_t)v10;
        v15 = 2114;
        v16 = v11;
        _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Get item failed. Error: %{public}@\nAsset: %{public}@", (uint8_t *)&v13, 0x16u);
      }
    }
    else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      v13 = 138543618;
      v14 = (unint64_t)v11;
      v15 = 2112;
      v16 = v9;
      _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Get item completed. Asset: %{public}@. Path: %@", (uint8_t *)&v13, 0x16u);
    }
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "MMCSEngine:didFinishGettingAsset:path:error:", self, v11, v9, v10);

  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v13 = 134217984;
    v14 = a3;
    _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Get item done: Could not get asset for item ID %lld.", (uint8_t *)&v13, 0xCu);
  }

}

- (void)_putItemProgressItemID:(unint64_t)a3 state:(int)a4 progress:(double)a5 requestorContext:(id)a6 error:(id)a7
{
  uint64_t v8;
  void *v11;
  _BOOL4 v12;
  void *v13;
  NSObject *v14;
  const char *v15;
  uint32_t v16;
  id WeakRetained;
  double v18;
  int v19;
  double v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v8 = *(_QWORD *)&a4;
  v25 = *MEMORY[0x1E0C80C00];
  -[MMCSEngine _assetWithItemID:](self, "_assetWithItemID:", a3, *(_QWORD *)&a4, a6, a7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v12 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
    if (a5 == -1.0)
    {
      if (v12)
      {
        +[MMCSEngine logStringForPutItemState:](MMCSEngine, "logStringForPutItemState:", v8);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = 138543618;
        v20 = *(double *)&v13;
        v21 = 2048;
        v22 = v11;
        v14 = MEMORY[0x1E0C81028];
        v15 = "Put item progress state: %{public}@ asset: %p";
        v16 = 22;
        goto LABEL_11;
      }
    }
    else if (v12)
    {
      +[MMCSEngine logStringForPutItemState:](MMCSEngine, "logStringForPutItemState:", v8);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 134218498;
      v20 = a5;
      v21 = 2114;
      v22 = v13;
      v23 = 2048;
      v24 = v11;
      v14 = MEMORY[0x1E0C81028];
      v15 = "Put item progress: %f state: %{public}@ asset: %p";
      v16 = 32;
LABEL_11:
      _os_log_debug_impl(&dword_1D3E94000, v14, OS_LOG_TYPE_DEBUG, v15, (uint8_t *)&v19, v16);

    }
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    *(float *)&v18 = a5;
    objc_msgSend(WeakRetained, "MMCSEngine:didMakePutProgress:state:onAsset:", self, v8, v11, v18);

    goto LABEL_9;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v19 = 134217984;
    v20 = *(double *)&a3;
    _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Put item progress: Could not get asset for item ID %lld. Ignoring.", (uint8_t *)&v19, 0xCu);
  }
LABEL_9:

}

- (void)_putItemDoneItemID:(unint64_t)a3 requestorContext:(id)a4 putReceipt:(id)a5 error:(id)a6
{
  id v9;
  id v10;
  void *v11;
  id WeakRetained;
  int v13;
  unint64_t v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v9 = a5;
  v10 = a6;
  -[MMCSEngine _assetWithItemID:](self, "_assetWithItemID:", a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    if (v10)
    {
      if ((objc_msgSend(v10, "MMCSIsAuthorizationError") & 1) == 0
        && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        v13 = 138543618;
        v14 = (unint64_t)v10;
        v15 = 2114;
        v16 = v11;
        _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Put item failed. Error: %{public}@\nAsset: %{public}@", (uint8_t *)&v13, 0x16u);
      }
    }
    else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      v13 = 138543362;
      v14 = (unint64_t)v11;
      _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Put item completed. Asset: %{public}@", (uint8_t *)&v13, 0xCu);
    }
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "MMCSEngine:didFinishPuttingAsset:putReceipt:error:", self, v11, v9, v10);

  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v13 = 134217984;
    v14 = a3;
    _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Put item done: Could not get asset for item ID %lld.", (uint8_t *)&v13, 0xCu);
  }

}

- (void)_requestCompletedRequestorContext:(id)a3
{
  id v4;
  id WeakRetained;
  char v6;
  uint64_t RequestMetrics;
  void *v8;
  id v9;
  id v10;
  int v11;
  _DWORD v12[2];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    LOWORD(v12[0]) = 0;
    _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Request completed.", (uint8_t *)v12, 2u);
  }
  if (-[MMCSEngine isMetricsGatheringEnabled](self, "isMetricsGatheringEnabled"))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v6 = objc_opt_respondsToSelector();

    if ((v6 & 1) != 0)
    {
      RequestMetrics = MMCSEngineGetRequestMetrics();
      v8 = (void *)MEMORY[0x1D8255938](RequestMetrics);
      v9 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v9, "MMCSEngine:logPerformanceMetrics:", self, v8);

    }
  }
  if (!objc_msgSend(v4, "type"))
  {
    v10 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v10, "didFinishGettingAllAssets");
    goto LABEL_10;
  }
  if (objc_msgSend(v4, "type") == 1)
  {
    v10 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v10, "didFinishPuttingAllAssets");
LABEL_10:

    goto LABEL_13;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v11 = objc_msgSend(v4, "type");
    v12[0] = 67109120;
    v12[1] = v11;
    _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Unknown requestor context type %d found at request completion. Ignoring.", (uint8_t *)v12, 8u);
  }
LABEL_13:
  -[MMCSEngine _removeRequestorContext:](self, "_removeRequestorContext:", v4);

}

- (void)cancelOperationsWithContext:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  MMCSEngine *v8;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __42__MMCSEngine_cancelOperationsWithContext___block_invoke;
  v6[3] = &unk_1E95BCFC0;
  v7 = v4;
  v8 = self;
  v5 = v4;
  -[MMCSEngine performBlockOnWorkThread:waitUntilDone:](self, "performBlockOnWorkThread:waitUntilDone:", v6, 1);

}

- (void)cancelAllOperations
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __33__MMCSEngine_cancelAllOperations__block_invoke;
  v2[3] = &unk_1E95BCED0;
  v2[4] = self;
  -[MMCSEngine performBlockOnWorkThread:waitUntilDone:](self, "performBlockOnWorkThread:waitUntilDone:", v2, 1);
}

- (void)shutDownCompletionBlock:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __38__MMCSEngine_shutDownCompletionBlock___block_invoke;
  v6[3] = &unk_1E95BCF98;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[MMCSEngine performBlockOnWorkThread:](self, "performBlockOnWorkThread:", v6);

}

- (BOOL)isActive
{
  char v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __22__MMCSEngine_isActive__block_invoke;
  v4[3] = &unk_1E95BCEF8;
  v4[4] = self;
  v4[5] = &v5;
  -[MMCSEngine performBlockOnWorkThread:waitUntilDone:](self, "performBlockOnWorkThread:waitUntilDone:", v4, 1);
  v2 = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (void)registerAssetForUpload:(id)a3 completionBlock:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __53__MMCSEngine_registerAssetForUpload_completionBlock___block_invoke;
  v10[3] = &unk_1E95BC528;
  v10[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[MMCSEngine performBlockOnWorkThread:](self, "performBlockOnWorkThread:", v10);

}

- (void)reregisterAssetForUpload:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __39__MMCSEngine_reregisterAssetForUpload___block_invoke;
  v6[3] = &unk_1E95BCFC0;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[MMCSEngine performBlockOnWorkThread:](self, "performBlockOnWorkThread:", v6);

}

- (void)reregisterAssetForDownload:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __41__MMCSEngine_reregisterAssetForDownload___block_invoke;
  v6[3] = &unk_1E95BCFC0;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[MMCSEngine performBlockOnWorkThread:](self, "performBlockOnWorkThread:", v6);

}

- (void)registerAssets:(id)a3 forDownloadCompletionBlock:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  MMCSEngine *v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __56__MMCSEngine_registerAssets_forDownloadCompletionBlock___block_invoke;
  v10[3] = &unk_1E95BC528;
  v11 = v6;
  v12 = self;
  v13 = v7;
  v8 = v7;
  v9 = v6;
  -[MMCSEngine performBlockOnWorkThread:](self, "performBlockOnWorkThread:", v10);

}

- (void)unregisterAsset:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  MMCSEngine *v8;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __30__MMCSEngine_unregisterAsset___block_invoke;
  v6[3] = &unk_1E95BCFC0;
  v7 = v4;
  v8 = self;
  v5 = v4;
  -[MMCSEngine performBlockOnWorkThread:](self, "performBlockOnWorkThread:", v6);

}

- (void)unregisterAssets:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  MMCSEngine *v8;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __31__MMCSEngine_unregisterAssets___block_invoke;
  v6[3] = &unk_1E95BCFC0;
  v7 = v4;
  v8 = self;
  v5 = v4;
  -[MMCSEngine performBlockOnWorkThread:](self, "performBlockOnWorkThread:", v6);

}

- (void)getAssets:(id)a3 requestURL:(id)a4 DSID:(id)a5 options:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  MMCSEngine *v20;
  id v21;
  id v22;
  id v23;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __48__MMCSEngine_getAssets_requestURL_DSID_options___block_invoke;
  v18[3] = &unk_1E95BCE80;
  v19 = v10;
  v20 = self;
  v21 = v11;
  v22 = v12;
  v23 = v13;
  v14 = v13;
  v15 = v12;
  v16 = v11;
  v17 = v10;
  -[MMCSEngine performBlockOnWorkThread:](self, "performBlockOnWorkThread:", v18);

}

- (void)putAssets:(id)a3 requestURL:(id)a4 DSID:(id)a5 options:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  MMCSEngine *v20;
  id v21;
  id v22;
  id v23;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __48__MMCSEngine_putAssets_requestURL_DSID_options___block_invoke;
  v18[3] = &unk_1E95BCE80;
  v19 = v10;
  v20 = self;
  v21 = v11;
  v22 = v12;
  v23 = v13;
  v14 = v13;
  v15 = v12;
  v16 = v11;
  v17 = v10;
  -[MMCSEngine performBlockOnWorkThread:](self, "performBlockOnWorkThread:", v18);

}

- (void)_registerAsset:(id)a3
{
  id v4;
  NSObject *itemIDToAssetMapQueue;
  id v6;
  _QWORD block[4];
  id v8;
  MMCSEngine *v9;

  v4 = a3;
  itemIDToAssetMapQueue = self->_itemIDToAssetMapQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __29__MMCSEngine__registerAsset___block_invoke;
  block[3] = &unk_1E95BCFC0;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_sync(itemIDToAssetMapQueue, block);

}

- (id)_assetWithItemID:(unint64_t)a3
{
  NSObject *itemIDToAssetMapQueue;
  id v4;
  _QWORD block[7];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__5042;
  v11 = __Block_byref_object_dispose__5043;
  v12 = 0;
  itemIDToAssetMapQueue = self->_itemIDToAssetMapQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __31__MMCSEngine__assetWithItemID___block_invoke;
  block[3] = &unk_1E95BBD88;
  block[4] = self;
  block[5] = &v7;
  block[6] = a3;
  dispatch_sync(itemIDToAssetMapQueue, block);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (void)_removeAssetForItemID:(unint64_t)a3
{
  NSObject *itemIDToAssetMapQueue;
  _QWORD v4[6];

  itemIDToAssetMapQueue = self->_itemIDToAssetMapQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __36__MMCSEngine__removeAssetForItemID___block_invoke;
  v4[3] = &unk_1E95BCF48;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(itemIDToAssetMapQueue, v4);
}

- (void)_registerRequestorContext:(id)a3
{
  id v4;
  NSObject *reqestorContextQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  reqestorContextQueue = self->_reqestorContextQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__MMCSEngine__registerRequestorContext___block_invoke;
  block[3] = &unk_1E95BCFC0;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(reqestorContextQueue, block);

}

- (void)_removeRequestorContext:(id)a3
{
  id v4;
  NSObject *reqestorContextQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  reqestorContextQueue = self->_reqestorContextQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__MMCSEngine__removeRequestorContext___block_invoke;
  block[3] = &unk_1E95BCFC0;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(reqestorContextQueue, block);

}

- (void)_initItemIDPersistence
{
  NSURL *v3;
  NSURL *autoItemIDPersistenceURL;
  NSMutableDictionary *v5;
  NSMutableDictionary *autoItemIDDictionary;

  if (!self->_autoItemIDPersistenceURL)
  {
    -[NSURL URLByAppendingPathComponent:](self->_workPathURL, "URLByAppendingPathComponent:", CFSTR("nextItemID.plist"));
    v3 = (NSURL *)objc_claimAutoreleasedReturnValue();
    autoItemIDPersistenceURL = self->_autoItemIDPersistenceURL;
    self->_autoItemIDPersistenceURL = v3;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithContentsOfURL:", self->_autoItemIDPersistenceURL);
    v5 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    autoItemIDDictionary = self->_autoItemIDDictionary;
    self->_autoItemIDDictionary = v5;

  }
}

- (unint64_t)_nextItemID
{
  NSObject *autoItemIDDictionaryQueue;
  unint64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  autoItemIDDictionaryQueue = self->_autoItemIDDictionaryQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __25__MMCSEngine__nextItemID__block_invoke;
  v5[3] = &unk_1E95BCEF8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(autoItemIDDictionaryQueue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (MMCSEngineDelegate)delegate
{
  return (MMCSEngineDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)autoGenerateItemID
{
  return self->_autoGenerateItemID;
}

- (void)setAutoGenerateItemID:(BOOL)a3
{
  self->_autoGenerateItemID = a3;
}

- (BOOL)isMetricsGatheringEnabled
{
  return self->_isMetricsGatheringEnabled;
}

- (NSThread)workThread
{
  return self->_workThread;
}

- (void)setWorkThread:(id)a3
{
  objc_storeStrong((id *)&self->_workThread, a3);
}

- (NSTimer)threadKeepAliveTimer
{
  return self->_threadKeepAliveTimer;
}

- (void)setThreadKeepAliveTimer:(id)a3
{
  objc_storeStrong((id *)&self->_threadKeepAliveTimer, a3);
}

- (BOOL)isDone
{
  return self->_isDone;
}

- (void)setIsDone:(BOOL)a3
{
  self->_isDone = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_threadKeepAliveTimer, 0);
  objc_storeStrong((id *)&self->_workThread, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_autoItemIDDictionaryQueue, 0);
  objc_storeStrong((id *)&self->_autoItemIDPersistenceURL, 0);
  objc_storeStrong((id *)&self->_autoItemIDDictionary, 0);
  objc_storeStrong((id *)&self->_reqestorContextQueue, 0);
  objc_storeStrong((id *)&self->_requestorContexts, 0);
  objc_storeStrong((id *)&self->_itemIDToAssetMapQueue, 0);
  objc_storeStrong((id *)&self->_itemIDToAssetMap, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_dataClass, 0);
  objc_storeStrong((id *)&self->_appIDHeader, 0);
  objc_storeStrong((id *)&self->_workPathURL, 0);
}

uint64_t __25__MMCSEngine__nextItemID__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_initItemIDPersistence");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 144), "objectForKey:", CFSTR("nextItemID"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v2, "unsignedLongLongValue");

  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 144);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) + 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("nextItemID"));

  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 144), "writeToURL:atomically:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 152), 1);
}

uint64_t __38__MMCSEngine__removeRequestorContext___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 128), "removeObject:", *(_QWORD *)(a1 + 40));
}

uint64_t __40__MMCSEngine__registerRequestorContext___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 128), "addObject:", *(_QWORD *)(a1 + 40));
}

void __36__MMCSEngine__removeAssetForItemID___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(*(_QWORD *)(a1 + 32) + 112);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 40));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "removeObjectForKey:", v2);

}

void __31__MMCSEngine__assetWithItemID___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  v2 = *(void **)(a1[4] + 112);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a1[6]);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", v6);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1[5] + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __29__MMCSEngine__registerAsset___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(*(id *)(a1 + 32), "MMCSItemID"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 112), "objectForKey:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3
    && (objc_msgSend(v3, "MMCSHash"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(*(id *)(a1 + 32), "MMCSHash"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = MSObjectsAreEquivalent(v5, v6),
        v6,
        v5,
        !v7))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v12 = *(_QWORD *)(a1 + 32);
      v13 = 138543618;
      v14 = v12;
      v15 = 2114;
      v16 = v4;
      _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Attempting to register two different assets under the same MMCS ID. Rejecting.\nNew asset: %{public}@\nOld asset: %{public}@", (uint8_t *)&v13, 0x16u);
    }
  }
  else
  {
    v9 = a1 + 32;
    v8 = *(void **)(a1 + 32);
    v10 = *(void **)(*(_QWORD *)(v9 + 8) + 112);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v8, "MMCSItemID"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKey:", v8, v11);

  }
}

void __48__MMCSEngine_putAssets_requestURL_DSID_options___block_invoke(uint64_t a1)
{
  uint64_t v2;
  _BOOL4 v3;
  _QWORD *v4;
  _DWORD *v5;
  _QWORD *v6;
  _QWORD *v7;
  uint64_t i;
  void *v9;
  id v10;
  id v11;
  const char *v12;
  size_t v13;
  char *v14;
  id v15;
  id WeakRetained;
  uint64_t v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  uint64_t v24;
  id v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  void *v37;
  uint8_t v38[128];
  uint8_t buf[4];
  uint64_t v40;
  __int16 v41;
  uint64_t v42;
  __int16 v43;
  uint64_t v44;
  __int16 v45;
  uint64_t v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(*(id *)(a1 + 32), "count");
  v3 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO);
  if (v2)
  {
    if (v3)
    {
      *(_DWORD *)buf = 134217984;
      v40 = v2;
      _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Begin putting %lu assets.", buf, 0xCu);
    }
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    {
      v27 = *(_QWORD *)(a1 + 32);
      v28 = *(_QWORD *)(a1 + 48);
      v29 = *(_QWORD *)(a1 + 56);
      v30 = *(_QWORD *)(a1 + 64);
      *(_DWORD *)buf = 138544130;
      v40 = v27;
      v41 = 2114;
      v42 = v28;
      v43 = 2112;
      v44 = v29;
      v45 = 2114;
      v46 = v30;
      _os_log_debug_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "Assets: %{public}@\nURL: %{public}@\nDSID: %@\nOptions: %{public}@\n", buf, 0x2Au);
    }
    +[MMCSRequestorContext contextWithEngine:type:](MMCSRequestorContext, "contextWithEngine:type:", *(_QWORD *)(a1 + 40), 1);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = malloc_type_malloc(8 * v2, 0x100004000313F17uLL);
    v5 = malloc_type_malloc(4 * v2, 0x100004052888210uLL);
    v6 = malloc_type_malloc(8 * v2, 0x10040436913F5uLL);
    v7 = malloc_type_malloc(8 * v2, 0x10040436913F5uLL);
    for (i = 0; i != v2; ++i)
    {
      objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:", i);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v4[i] = objc_msgSend(v9, "MMCSItemID");
      v5[i] = objc_msgSend(v9, "MMCSItemFlags");
      objc_msgSend(v9, "MMCSHash");
      v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v6[i] = objc_msgSend(v10, "bytes");

      objc_msgSend(v9, "MMCSAccessHeader");
      v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v12 = (const char *)objc_msgSend(v11, "cStringUsingEncoding:", 4);

      if (v12)
      {
        v13 = strlen(v12);
        v14 = (char *)malloc_type_malloc(v13 + 1, 0x17A50F74uLL);
        v7[i] = v14;
        strcpy(v14, v12);
      }
      else
      {
        v7[i] = 0;
      }

    }
    v15 = v32;
    objc_msgSend(v32, "setCount:", v2);
    objc_msgSend(v32, "setItemIDs:", v4);
    objc_msgSend(v32, "setItemFlags:", v5);
    objc_msgSend(v32, "setSignatures:", v6);
    objc_msgSend(v32, "setAuthTokens:", v7);
    objc_msgSend(*(id *)(a1 + 40), "_registerRequestorContext:", v32);
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 176));
    objc_msgSend(WeakRetained, "MMCSEngine:didCreateRequestorContext:forAssets:", *(_QWORD *)(a1 + 40), v32, *(_QWORD *)(a1 + 32));

    v37 = 0;
    objc_msgSend(v32, "itemIDs");
    objc_msgSend(v32, "signatures");
    v17 = objc_msgSend(v32, "authTokens");
    v31 = objc_msgSend(v32, "itemFlags");
    if (!MMCSPutItems())
    {
      v18 = v37;
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v40 = (uint64_t)v37;
        _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Put items failed with error: %{public}@", buf, 0xCu);
      }
      v35 = 0u;
      v36 = 0u;
      v33 = 0u;
      v34 = 0u;
      v19 = *(id *)(a1 + 32);
      v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v33, v38, 16, v17, v31, &v37);
      if (v20)
      {
        v21 = v20;
        v22 = *(_QWORD *)v34;
        do
        {
          for (j = 0; j != v21; ++j)
          {
            if (*(_QWORD *)v34 != v22)
              objc_enumerationMutation(v19);
            v24 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * j);
            v25 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 176));
            objc_msgSend(v25, "MMCSEngine:didFinishPuttingAsset:putReceipt:error:", *(_QWORD *)(a1 + 40), v24, 0, v18);

          }
          v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
        }
        while (v21);
      }

      v26 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 176));
      objc_msgSend(v26, "didFinishPuttingAllAssets");

      v15 = v32;
    }
  }
  else
  {
    if (v3)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Put assets called with zero assets.", buf, 2u);
    }
    v15 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 176));
    objc_msgSend(v15, "didFinishPuttingAllAssets");
  }

}

void __48__MMCSEngine_getAssets_requestURL_DSID_options___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  _QWORD *v4;
  _QWORD *v5;
  _QWORD *v6;
  uint64_t i;
  void *v8;
  id v9;
  id v10;
  const char *v11;
  size_t v12;
  char *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  uint64_t v20;
  id WeakRetained;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  void *v32;
  uint8_t v33[128];
  uint8_t buf[4];
  uint64_t v35;
  __int16 v36;
  uint64_t v37;
  __int16 v38;
  uint64_t v39;
  __int16 v40;
  uint64_t v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    v2 = objc_msgSend(*(id *)(a1 + 32), "count");
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      v35 = v2;
      _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Begin getting %lu assets.", buf, 0xCu);
    }
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    {
      v23 = *(_QWORD *)(a1 + 32);
      v24 = *(_QWORD *)(a1 + 48);
      v25 = *(_QWORD *)(a1 + 56);
      v26 = *(_QWORD *)(a1 + 64);
      *(_DWORD *)buf = 138544130;
      v35 = v23;
      v36 = 2114;
      v37 = v24;
      v38 = 2112;
      v39 = v25;
      v40 = 2114;
      v41 = v26;
      _os_log_debug_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "Assets: %{public}@\nURL: %{public}@\nDSID: %@\nOptions:%{public}@", buf, 0x2Au);
    }
    +[MMCSRequestorContext contextWithEngine:type:](MMCSRequestorContext, "contextWithEngine:type:", *(_QWORD *)(a1 + 40), 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = malloc_type_malloc(8 * v2, 0x100004000313F17uLL);
    v5 = malloc_type_malloc(8 * v2, 0x10040436913F5uLL);
    v6 = malloc_type_malloc(8 * v2, 0x10040436913F5uLL);
    if (v2)
    {
      for (i = 0; i != v2; ++i)
      {
        objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:", i);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v4[i] = objc_msgSend(v8, "MMCSItemID");
        objc_msgSend(v8, "MMCSHash");
        v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v5[i] = objc_msgSend(v9, "bytes");

        objc_msgSend(v8, "MMCSAccessHeader");
        v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v11 = (const char *)objc_msgSend(v10, "cStringUsingEncoding:", 4);

        if (v11)
        {
          v12 = strlen(v11);
          v13 = (char *)malloc_type_malloc(v12 + 1, 0xA4839243uLL);
          v6[i] = v13;
          strcpy(v13, v11);
        }
        else
        {
          v6[i] = 0;
        }

      }
    }
    objc_msgSend(v3, "setCount:", v2);
    objc_msgSend(v3, "setItemIDs:", v4);
    objc_msgSend(v3, "setSignatures:", v5);
    objc_msgSend(v3, "setAuthTokens:", v6);
    objc_msgSend(*(id *)(a1 + 40), "_registerRequestorContext:", v3);
    v32 = 0;
    objc_msgSend(v3, "itemIDs");
    objc_msgSend(v3, "signatures");
    v27 = objc_msgSend(v3, "authTokens");
    if (!MMCSGetItems())
    {
      v14 = v32;
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v35 = (uint64_t)v32;
        _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Get Items failed with error: %{public}@", buf, 0xCu);
      }
      v30 = 0u;
      v31 = 0u;
      v28 = 0u;
      v29 = 0u;
      v15 = *(id *)(a1 + 32);
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v28, v33, 16, v27, &v32);
      if (v16)
      {
        v17 = v16;
        v18 = *(_QWORD *)v29;
        do
        {
          for (j = 0; j != v17; ++j)
          {
            if (*(_QWORD *)v29 != v18)
              objc_enumerationMutation(v15);
            v20 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * j);
            WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 176));
            objc_msgSend(WeakRetained, "MMCSEngine:didFinishGettingAsset:path:error:", *(_QWORD *)(a1 + 40), v20, 0, v14);

          }
          v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
        }
        while (v17);
      }

      v22 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 176));
      objc_msgSend(v22, "didFinishGettingAllAssets");

    }
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Get assets called with zero assets.", buf, 2u);
    }
    v3 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 176));
    objc_msgSend(v3, "didFinishGettingAllAssets");
  }

}

void __31__MMCSEngine_unregisterAssets___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  unint64_t v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint8_t buf[4];
  void *v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v2 = malloc_type_malloc(8 * objc_msgSend(*(id *)(a1 + 32), "count"), 0x100004000313F17uLL);
  if (objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    v3 = 0;
    do
    {
      objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:", v3);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v2[v3] = objc_msgSend(v4, "MMCSItemID");

      ++v3;
    }
    while (v3 < objc_msgSend(*(id *)(a1 + 32), "count"));
  }
  if ((unint64_t)objc_msgSend(*(id *)(a1 + 32), "count") >> 32)
    __assert_rtn("-[MMCSEngine unregisterAssets:]_block_invoke", "MMCSEngine.m", 563, "count <= UINT32_MAX");
  v12 = v2;
  MMCSUnregisterFiles();
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = *(id *)(a1 + 32);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    v9 = MEMORY[0x1E0C81028];
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v10);
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138543362;
          v18 = v11;
          _os_log_debug_impl(&dword_1D3E94000, v9, OS_LOG_TYPE_DEBUG, "Unregistered asset: %{public}@", buf, 0xCu);
        }
        objc_msgSend(*(id *)(a1 + 40), "_removeAssetForItemID:", objc_msgSend(v11, "MMCSItemID"));
        ++v10;
      }
      while (v7 != v10);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v19, 16);
    }
    while (v7);
  }

  free(v12);
}

uint64_t __30__MMCSEngine_unregisterAsset___block_invoke(uint64_t a1)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = 138543362;
    v5 = v3;
    _os_log_debug_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "Unregistered asset: %{public}@", (uint8_t *)&v4, 0xCu);
  }
  objc_msgSend(*(id *)(a1 + 32), "MMCSItemID");
  MMCSUnregisterFile();
  return objc_msgSend(*(id *)(a1 + 40), "_removeAssetForItemID:", objc_msgSend(*(id *)(a1 + 32), "MMCSItemID"));
}

uint64_t __56__MMCSEngine_registerAssets_forDownloadCompletionBlock___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  _BYTE *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint8_t buf[4];
  void *v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v19, 16);
  if (v3)
  {
    v5 = v3;
    v6 = *(_QWORD *)v14;
    v7 = MEMORY[0x1E0C81028];
    *(_QWORD *)&v4 = 138543362;
    v12 = v4;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(v2);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v8);
        v10 = *(_BYTE **)(a1 + 40);
        if (v10[168])
        {
          objc_msgSend(v9, "setMMCSItemID:", objc_msgSend(v10, "_nextItemID"));
          v10 = *(_BYTE **)(a1 + 40);
        }
        objc_msgSend(v10, "_registerAsset:", v9, v12, (_QWORD)v13);
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = v12;
          v18 = v9;
          _os_log_debug_impl(&dword_1D3E94000, v7, OS_LOG_TYPE_DEBUG, "Registered asset for download: %{public}@ ", buf, 0xCu);
        }
        ++v8;
      }
      while (v5 != v8);
      v5 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v19, 16);
    }
    while (v5);
  }

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

uint64_t __41__MMCSEngine_reregisterAssetForDownload___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_registerAsset:", *(_QWORD *)(a1 + 40));
}

uint64_t __39__MMCSEngine_reregisterAssetForUpload___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_registerAsset:", *(_QWORD *)(a1 + 40));
}

void __53__MMCSEngine_registerAssetForUpload_completionBlock___block_invoke(uint64_t a1)
{
  _BYTE *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t buf[4];
  uint64_t v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = *(_BYTE **)(a1 + 32);
  if (v2[168])
  {
    objc_msgSend(*(id *)(a1 + 40), "setMMCSItemID:", objc_msgSend(v2, "_nextItemID"));
    v2 = *(_BYTE **)(a1 + 32);
  }
  objc_msgSend(v2, "_registerAsset:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 40), "MMCSItemID");
  MMCSRegisterFile();
  objc_msgSend(*(id *)(a1 + 32), "_removeAssetForItemID:", objc_msgSend(*(id *)(a1 + 40), "MMCSItemID"));
  objc_msgSend(MEMORY[0x1E0CB35C8], "MMCSErrorWithDomain:code:description:", CFSTR("kMMCSKitErrorDomain"), 2, CFSTR("ERROR_CANNOT_REGISTER_FILE"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v5 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      v7 = v5;
      v8 = 2114;
      v9 = v3;
      _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Could not register asset: %{public}@\nError: %{public}@", buf, 0x16u);
    }
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    {
      v4 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543362;
      v7 = v4;
      _os_log_debug_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "Registered asset for upload: %{public}@", buf, 0xCu);
    }
    v3 = 0;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

uint64_t __22__MMCSEngine_isActive__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = MMCSEngineIsActive();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = (_DWORD)result != 0;
  return result;
}

uint64_t __38__MMCSEngine_shutDownCompletionBlock___block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  void *v4;
  _QWORD block[5];

  v2 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v2 + 40))
  {
    MMCSEngineCancelRequests();
    MMCSEngineDestroy();
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) = 0;
    v2 = *(_QWORD *)(a1 + 32);
  }
  v3 = *(NSObject **)(v2 + 160);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__MMCSEngine_shutDownCompletionBlock___block_invoke_2;
  block[3] = &unk_1E95BCED0;
  block[4] = v2;
  dispatch_sync(v3, block);
  objc_msgSend(*(id *)(a1 + 32), "threadKeepAliveTimer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "invalidate");

  objc_msgSend(*(id *)(a1 + 32), "setThreadKeepAliveTimer:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setIsDone:", 1);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __38__MMCSEngine_shutDownCompletionBlock___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 152);
  *(_QWORD *)(v2 + 152) = 0;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 144);
  *(_QWORD *)(v4 + 144) = 0;

}

uint64_t __33__MMCSEngine_cancelAllOperations__block_invoke()
{
  return MMCSEngineCancelRequests();
}

void __42__MMCSEngine_cancelOperationsWithContext___block_invoke(uint64_t a1)
{
  uint8_t v1[16];

  if (*(_QWORD *)(a1 + 32))
  {
    MMCSEngineCancelRequests();
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v1 = 0;
    _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Cancel operations: Could not find context. Ignoring", v1, 2u);
  }
}

void __43__MMCSEngine_setIsMetricsGatheringEnabled___block_invoke(uint64_t a1)
{
  id WeakRetained;
  char v3;
  id v4;
  const __CFString *v5;
  id v6;

  if (*(unsigned __int8 *)(a1 + 40) != *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 169))
  {
    MMCSEngineSetMetricsEnabled();
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 169) = *(_BYTE *)(a1 + 40);
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 176));
    v3 = objc_opt_respondsToSelector();

    if ((v3 & 1) != 0)
    {
      v4 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 176));
      v6 = v4;
      if (*(_BYTE *)(a1 + 40))
        v5 = CFSTR("Performance logging enabled.");
      else
        v5 = CFSTR("Performance logging disabled.");
      objc_msgSend(v4, "MMCSEngine:logPerformanceMetrics:", *(_QWORD *)(a1 + 32), v5);

    }
  }
}

+ (id)logStringForGetItemState:(int)a3
{
  if (a3 > 5)
    return CFSTR("Unknown");
  else
    return off_1E95BBDA8[a3];
}

+ (id)logStringForPutItemState:(int)a3
{
  if (a3 > 7)
    return CFSTR("Unknown");
  else
    return off_1E95BBDD8[a3];
}

@end
