@implementation MSASAssetTransferer

- (void)_rereadPerformanceLoggingSetting
{
  void *v3;
  char v4;
  MMCSEngine *engine;
  id v6;

  MSPlatform();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    engine = self->_engine;
    MSPlatform();
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[MMCSEngine setIsMetricsGatheringEnabled:](engine, "setIsMetricsGatheringEnabled:", objc_msgSend(v6, "isPerformanceLoggingEnabled"));

  }
}

- (MSASAssetTransferer)initWithPersonID:(id)a3
{
  return -[MSASAssetTransferer initWithPersonID:eventQueue:](self, "initWithPersonID:eventQueue:", a3, 0);
}

- (MSASAssetTransferer)initWithPersonID:(id)a3 eventQueue:(id)a4
{
  id v7;
  id v8;
  MSASAssetTransferer *v9;
  dispatch_queue_t v10;
  OS_dispatch_queue *workQueue;
  dispatch_queue_t v12;
  OS_dispatch_queue *eventQueue;
  NSObject *v14;
  uint64_t v15;
  MSASAssetTransferer *v16;
  void *v17;
  id v18;
  MSASAssetTransferer *v19;
  id v20;
  _QWORD v22[4];
  MSASAssetTransferer *v23;
  _QWORD block[4];
  MSASAssetTransferer *v25;
  id v26;
  objc_super v27;

  v7 = a3;
  v8 = a4;
  v27.receiver = self;
  v27.super_class = (Class)MSASAssetTransferer;
  v9 = -[MSASAssetTransferer init](&v27, sel_init);
  if (v9)
  {
    v10 = dispatch_queue_create("MSASAssetTransferer work queue", 0);
    workQueue = v9->_workQueue;
    v9->_workQueue = (OS_dispatch_queue *)v10;

    if (v8)
      v12 = (dispatch_queue_t)v8;
    else
      v12 = dispatch_queue_create("MSASAssetTransferer event queue", 0);
    eventQueue = v9->_eventQueue;
    v9->_eventQueue = (OS_dispatch_queue *)v12;

    v14 = v9->_workQueue;
    v15 = MEMORY[0x1E0C809B0];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __51__MSASAssetTransferer_initWithPersonID_eventQueue___block_invoke;
    block[3] = &unk_1E95BCFC0;
    v16 = v9;
    v25 = v16;
    v26 = v7;
    dispatch_sync(v14, block);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_alloc_init(MEMORY[0x1E0CB3828]);
    v22[0] = v15;
    v22[1] = 3221225472;
    v22[2] = __51__MSASAssetTransferer_initWithPersonID_eventQueue___block_invoke_2;
    v22[3] = &unk_1E95BC268;
    v19 = v16;
    v23 = v19;
    v20 = (id)objc_msgSend(v17, "addObserverForName:object:queue:usingBlock:", CFSTR("MSPlatformPerformanceLoggingSettingDidChange"), 0, v18, v22);

    *(_QWORD *)&v19->_maxBatchCount = 0x30000000ALL;
    objc_storeStrong((id *)&v19->_personID, a3);

  }
  return v9;
}

- (void)setFocusAlbumGUID:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[MSASAssetTransferer workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __41__MSASAssetTransferer_setFocusAlbumGUID___block_invoke;
  v7[3] = &unk_1E95BCFC0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)setFocusAssetCollectionGUID:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[MSASAssetTransferer workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __51__MSASAssetTransferer_setFocusAssetCollectionGUID___block_invoke;
  v7[3] = &unk_1E95BCFC0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)setMaxMMCSTokenValidityTimeInterval:(double)a3
{
  NSObject *v5;
  _QWORD v6[6];

  -[MSASAssetTransferer workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __59__MSASAssetTransferer_setMaxMMCSTokenValidityTimeInterval___block_invoke;
  v6[3] = &unk_1E95BCF48;
  v6[4] = self;
  *(double *)&v6[5] = a3;
  dispatch_async(v5, v6);

}

- (void)stopCompletionBlock:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[MSASAssetTransferer workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __43__MSASAssetTransferer_stopCompletionBlock___block_invoke;
  v7[3] = &unk_1E95BCF98;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)workQueueStop
{
  -[MMCSEngine cancelAllOperations](self->_engine, "cancelAllOperations");
}

- (void)cancelCompletionBlock:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[MSASAssetTransferer workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __45__MSASAssetTransferer_cancelCompletionBlock___block_invoke;
  v7[3] = &unk_1E95BCF98;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)shutDownCompletionBlock:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[MSASAssetTransferer workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __47__MSASAssetTransferer_shutDownCompletionBlock___block_invoke;
  v7[3] = &unk_1E95BCF98;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)workQueueShutDownCompletionBlock:(id)a3
{
  id v4;
  void *v5;
  MMCSEngine *engine;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:", self);

  engine = self->_engine;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __56__MSASAssetTransferer_workQueueShutDownCompletionBlock___block_invoke;
  v8[3] = &unk_1E95BCF98;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  -[MMCSEngine shutDownCompletionBlock:](engine, "shutDownCompletionBlock:", v8);

}

- (void)retryOutstandingActivities
{
  NSObject *v3;
  _QWORD block[5];

  -[MSASAssetTransferer workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__MSASAssetTransferer_retryOutstandingActivities__block_invoke;
  block[3] = &unk_1E95BCED0;
  block[4] = self;
  dispatch_async(v3, block);

}

- (unint64_t)workQueueNextItemID
{
  void *v2;
  unint64_t v3;

  -[MSASAssetTransferer model](self, "model");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "nextMMCSItemID");

  return v3;
}

- (double)workQueueMaxMMCSTokenValidityTimeInterval
{
  return self->_maxMMCSTokenValidityTimeInterval;
}

- (id)_pathForPersonID:(id)a3
{
  id v3;

  v3 = a3;
  __assert_rtn("-[MSASAssetTransferer _pathForPersonID:]", "MSASAssetTransferer.m", 176, "0");
}

- (id)_missingURLError
{
  if (_missingURLError_onceToken != -1)
    dispatch_once(&_missingURLError_onceToken, &__block_literal_global_5618);
  return (id)_missingURLError_error;
}

- (id)_missingMMCSTokenError
{
  if (_missingMMCSTokenError_onceToken != -1)
    dispatch_once(&_missingMMCSTokenError_onceToken, &__block_literal_global_23_5615);
  return (id)_missingMMCSTokenError_error;
}

- (id)_MMCSTokenTooOldError
{
  if (_MMCSTokenTooOldError_onceToken != -1)
    dispatch_once(&_MMCSTokenTooOldError_onceToken, &__block_literal_global_26);
  return (id)_MMCSTokenTooOldError_error;
}

- (id)_canceledError
{
  if (_canceledError_onceToken_5607 != -1)
    dispatch_once(&_canceledError_onceToken_5607, &__block_literal_global_29_5608);
  return (id)_canceledError_error_5609;
}

- (void)_sendDidIdleNotification
{
  NSObject *v3;
  _QWORD block[5];

  -[MSASAssetTransferer eventQueue](self, "eventQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__MSASAssetTransferer__sendDidIdleNotification__block_invoke;
  block[3] = &unk_1E95BCED0;
  block[4] = self;
  dispatch_async(v3, block);

}

- (BOOL)MMCSEngine:(id)a3 shouldLogAtLogLevel:(int)a4
{
  uint64_t v4;
  void *v5;

  v4 = *(_QWORD *)&a4;
  MSASPlatform();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = objc_msgSend(v5, "shouldLogAtLevel:", v4);

  return v4;
}

- (void)MMCSEngine:(id)a3 logMessage:(id)a4 logLevel:(int)a5
{
  uint64_t v5;
  id v7;
  void *v8;
  id v9;

  v5 = *(_QWORD *)&a5;
  v7 = a4;
  MSASPlatform();
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[MSASAssetTransferer personID](self, "personID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "logLevel:personID:albumGUID:format:", v5, v8, 0, CFSTR("%@"), v7);

}

- (void)MMCSEngine:(id)a3 logPerformanceMetrics:(id)a4
{
  int v6;
  MSASAssetTransferer *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    v6 = 138543618;
    v7 = self;
    v8 = 2114;
    v9 = a4;
    _os_log_debug_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "%{public}@: %{public}@", (uint8_t *)&v6, 0x16u);
  }
}

- (id)delegate
{
  return objc_loadWeakRetained(&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak(&self->_delegate, a3);
}

- (NSString)personID
{
  return self->_personID;
}

- (void)setPersonID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (MMCSEngine)engine
{
  return self->_engine;
}

- (double)maxMMCSTokenValidityTimeInterval
{
  return self->_maxMMCSTokenValidityTimeInterval;
}

- (MSAlbumSharingDaemon)daemon
{
  return (MSAlbumSharingDaemon *)objc_loadWeakRetained((id *)&self->_daemon);
}

- (void)setDaemon:(id)a3
{
  objc_storeWeak((id *)&self->_daemon, a3);
}

- (MSASPersonModel)model
{
  return (MSASPersonModel *)objc_loadWeakRetained((id *)&self->_model);
}

- (void)setModel:(id)a3
{
  objc_storeWeak((id *)&self->_model, a3);
}

- (MSBackoffManager)backoffManager
{
  return (MSBackoffManager *)objc_loadWeakRetained((id *)&self->_backoffManager);
}

- (void)setBackoffManager:(id)a3
{
  objc_storeWeak((id *)&self->_backoffManager, a3);
}

- (int)maxBatchCount
{
  return self->_maxBatchCount;
}

- (void)setMaxBatchCount:(int)a3
{
  self->_maxBatchCount = a3;
}

- (int)maxRetryCount
{
  return self->_maxRetryCount;
}

- (void)setMaxRetryCount:(int)a3
{
  self->_maxRetryCount = a3;
}

- (NSString)focusAlbumGUID
{
  return self->_focusAlbumGUID;
}

- (NSString)focusAssetCollectionGUID
{
  return self->_focusAssetCollectionGUID;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setWorkQueue:(id)a3
{
  objc_storeStrong((id *)&self->_workQueue, a3);
}

- (OS_dispatch_queue)eventQueue
{
  return self->_eventQueue;
}

- (void)setEventQueue:(id)a3
{
  objc_storeStrong((id *)&self->_eventQueue, a3);
}

- (BOOL)hasShutDown
{
  return self->_hasShutDown;
}

- (void)setHasShutDown:(BOOL)a3
{
  self->_hasShutDown = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventQueue, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_focusAssetCollectionGUID, 0);
  objc_storeStrong((id *)&self->_focusAlbumGUID, 0);
  objc_destroyWeak((id *)&self->_backoffManager);
  objc_destroyWeak((id *)&self->_model);
  objc_destroyWeak((id *)&self->_daemon);
  objc_storeStrong((id *)&self->_engine, 0);
  objc_storeStrong((id *)&self->_personID, 0);
  objc_destroyWeak(&self->_delegate);
}

void __47__MSASAssetTransferer__sendDidIdleNotification__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("MSASAssetTransfererDidIdle"), *(_QWORD *)(a1 + 32));

}

void __37__MSASAssetTransferer__canceledError__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  __CFString *v3;

  v0 = (void *)MEMORY[0x1E0CB35C8];
  v3 = (__CFString *)MSCFCopyLocalizedString(CFSTR("ERROR_ASSET_TRANS_CANCELED"));
  objc_msgSend(v0, "MSErrorWithDomain:code:description:", CFSTR("MSASAssetTransferErrorDomain"), 3, v3);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)_canceledError_error_5609;
  _canceledError_error_5609 = v1;

}

void __44__MSASAssetTransferer__MMCSTokenTooOldError__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  __CFString *v3;

  v0 = (void *)MEMORY[0x1E0CB35C8];
  v3 = (__CFString *)MSCFCopyLocalizedString(CFSTR("ERROR_ASSET_TRANS_MMCS_TOKEN_TOO_OLD"));
  objc_msgSend(v0, "MSErrorWithDomain:code:description:", CFSTR("MSASAssetTransferErrorDomain"), 2, v3);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)_MMCSTokenTooOldError_error;
  _MMCSTokenTooOldError_error = v1;

}

void __45__MSASAssetTransferer__missingMMCSTokenError__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  __CFString *v3;

  v0 = (void *)MEMORY[0x1E0CB35C8];
  v3 = (__CFString *)MSCFCopyLocalizedString(CFSTR("ERROR_ASSET_TRANS_MISSING_MMCS_TOKEN"));
  objc_msgSend(v0, "MSErrorWithDomain:code:description:", CFSTR("MSASAssetTransferErrorDomain"), 1, v3);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)_missingMMCSTokenError_error;
  _missingMMCSTokenError_error = v1;

}

void __39__MSASAssetTransferer__missingURLError__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  __CFString *v3;

  v0 = (void *)MEMORY[0x1E0CB35C8];
  v3 = (__CFString *)MSCFCopyLocalizedString(CFSTR("ERROR_ASSET_TRANS_MISSING_URL"));
  objc_msgSend(v0, "MSErrorWithDomain:code:description:", CFSTR("MSASAssetTransferErrorDomain"), 0, v3);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)_missingURLError_error;
  _missingURLError_error = v1;

}

uint64_t __49__MSASAssetTransferer_retryOutstandingActivities__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "workQueueRetryOutstandingActivities");
}

void __56__MSASAssetTransferer_workQueueShutDownCompletionBlock___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  _QWORD v4[5];
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "workQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __56__MSASAssetTransferer_workQueueShutDownCompletionBlock___block_invoke_2;
  v4[3] = &unk_1E95BCF98;
  v3 = *(void **)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  dispatch_async(v2, v4);

}

void __56__MSASAssetTransferer_workQueueShutDownCompletionBlock___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  NSObject *v4;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = 0;

  if (*(_QWORD *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "eventQueue");
    v4 = objc_claimAutoreleasedReturnValue();
    dispatch_async(v4, *(dispatch_block_t *)(a1 + 40));

  }
}

void __47__MSASAssetTransferer_shutDownCompletionBlock___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  _QWORD v4[5];
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "setHasShutDown:", 1);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __47__MSASAssetTransferer_shutDownCompletionBlock___block_invoke_2;
  v4[3] = &unk_1E95BCF98;
  v2 = *(void **)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  objc_msgSend(v2, "workQueueShutDownCompletionBlock:", v4);

}

void __47__MSASAssetTransferer_shutDownCompletionBlock___block_invoke_2(uint64_t a1)
{
  NSObject *v2;

  if (*(_QWORD *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "eventQueue");
    v2 = objc_claimAutoreleasedReturnValue();
    dispatch_async(v2, *(dispatch_block_t *)(a1 + 40));

  }
}

void __45__MSASAssetTransferer_cancelCompletionBlock___block_invoke(uint64_t a1)
{
  NSObject *v2;

  objc_msgSend(*(id *)(a1 + 32), "workQueueCancel");
  if (*(_QWORD *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "eventQueue");
    v2 = objc_claimAutoreleasedReturnValue();
    dispatch_async(v2, *(dispatch_block_t *)(a1 + 40));

  }
}

void __43__MSASAssetTransferer_stopCompletionBlock___block_invoke(uint64_t a1)
{
  NSObject *v2;

  objc_msgSend(*(id *)(a1 + 32), "workQueueStop");
  if (*(_QWORD *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "eventQueue");
    v2 = objc_claimAutoreleasedReturnValue();
    dispatch_async(v2, *(dispatch_block_t *)(a1 + 40));

  }
}

double __59__MSASAssetTransferer_setMaxMMCSTokenValidityTimeInterval___block_invoke(uint64_t a1)
{
  double result;

  result = *(double *)(a1 + 40);
  *(double *)(*(_QWORD *)(a1 + 32) + 48) = result;
  return result;
}

void __51__MSASAssetTransferer_setFocusAssetCollectionGUID___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 88), *(id *)(a1 + 40));
}

void __41__MSASAssetTransferer_setFocusAlbumGUID___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 80), *(id *)(a1 + 40));
}

void __51__MSASAssetTransferer_initWithPersonID_eventQueue___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  MMCSEngine *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  _QWORD v19[4];
  _QWORD v20[5];

  v20[4] = *MEMORY[0x1E0C80C00];
  MSASPlatform();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    MSASPlatform();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "MMCSConcurrentConnectionsCount");

  }
  else
  {
    v5 = 1;
  }
  v19[0] = *MEMORY[0x1E0D46748];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *MEMORY[0x1E0D46738];
  v20[0] = v6;
  v20[1] = MEMORY[0x1E0C9AAB0];
  v8 = *MEMORY[0x1E0D46740];
  v19[1] = v7;
  v19[2] = v8;
  v19[3] = *MEMORY[0x1E0D46730];
  v20[2] = MEMORY[0x1E0C9AAB0];
  v20[3] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = [MMCSEngine alloc];
  v11 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(*(id *)(a1 + 32), "_pathForPersonID:", *(_QWORD *)(a1 + 40));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "fileURLWithPath:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  MSPlatform();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "appBundleInfoString");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[MMCSEngine initWithWorkPath:appIDHeader:dataClass:options:](v10, "initWithWorkPath:appIDHeader:dataClass:options:", v13, v15, CFSTR("com.apple.Dataclass.SharedStreams"), v9);
  v17 = *(_QWORD *)(a1 + 32);
  v18 = *(void **)(v17 + 40);
  *(_QWORD *)(v17 + 40) = v16;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "setDelegate:");
  objc_msgSend(*(id *)(a1 + 32), "_rereadPerformanceLoggingSetting");

}

void __51__MSASAssetTransferer_initWithPersonID_eventQueue___block_invoke_2(uint64_t a1)
{
  _QWORD *v1;
  NSObject *v2;
  _QWORD block[4];
  _QWORD *v4;

  v1 = *(_QWORD **)(a1 + 32);
  v2 = v1[12];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__MSASAssetTransferer_initWithPersonID_eventQueue___block_invoke_3;
  block[3] = &unk_1E95BCED0;
  v4 = v1;
  dispatch_async(v2, block);

}

uint64_t __51__MSASAssetTransferer_initWithPersonID_eventQueue___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_rereadPerformanceLoggingSetting");
}

@end
