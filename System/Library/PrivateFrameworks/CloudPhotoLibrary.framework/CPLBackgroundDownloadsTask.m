@implementation CPLBackgroundDownloadsTask

- (CPLBackgroundDownloadsTask)initWithEngineLibrary:(id)a3 session:(id)a4
{
  CPLBackgroundDownloadsTask *v4;
  NSObject *v5;
  dispatch_queue_t v6;
  OS_dispatch_queue *lock;
  NSMutableArray *v8;
  NSMutableArray *transportTasks;
  void *v10;
  uint64_t v11;
  NSArray *intentsToDownload;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)CPLBackgroundDownloadsTask;
  v4 = -[CPLEngineSyncTask initWithEngineLibrary:session:](&v14, sel_initWithEngineLibrary_session_, a3, a4);
  if (v4)
  {
    CPLCopyDefaultSerialQueueAttributes();
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = dispatch_queue_create("com.apple.cpl.backgrounddownloads.lock", v5);
    lock = v4->_lock;
    v4->_lock = (OS_dispatch_queue *)v6;

    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    transportTasks = v4->_transportTasks;
    v4->_transportTasks = v8;

    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v4->_prioritizeNonDerivatives = objc_msgSend(v10, "BOOLForKey:", CFSTR("CPLPrioritizeNonDerivativesDownloads"));

    +[CPLResourceTransferTaskOptions intentsToBackgroundDownload](CPLResourceTransferTaskOptions, "intentsToBackgroundDownload");
    v11 = objc_claimAutoreleasedReturnValue();
    intentsToDownload = v4->_intentsToDownload;
    v4->_intentsToDownload = (NSArray *)v11;

    v4->_taskCountLock._os_unfair_lock_opaque = 0;
  }
  return v4;
}

- (void)_finishTaskLocked
{
  BOOL v3;
  NSObject *v4;
  unint64_t successfullyDownloadedResourcesCount;
  unint64_t failedDownloadedResourcesCount;
  NSError *badError;
  NSObject *v8;
  int v9;
  unint64_t v10;
  __int16 v11;
  unint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (self->_successfullyDownloadedResourcesCount)
  {
    if (_CPLSilentLogging)
      goto LABEL_12;
  }
  else
  {
    if (self->_failedDownloadedResourcesCount)
      v3 = _CPLSilentLogging == 0;
    else
      v3 = 0;
    if (!v3)
      goto LABEL_12;
  }
  __CPLTaskOSLogDomain_12581();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    successfullyDownloadedResourcesCount = self->_successfullyDownloadedResourcesCount;
    failedDownloadedResourcesCount = self->_failedDownloadedResourcesCount;
    v9 = 134218240;
    v10 = successfullyDownloadedResourcesCount;
    v11 = 2048;
    v12 = failedDownloadedResourcesCount;
    _os_log_impl(&dword_1B03C2000, v4, OS_LOG_TYPE_DEFAULT, "Successfully downloaded %lu resources in background (%lu failed)", (uint8_t *)&v9, 0x16u);
  }

LABEL_12:
  -[NSMutableArray removeAllObjects](self->_transportTasks, "removeAllObjects");
  badError = self->_badError;
  if (badError || self->_stopError)
  {
    if (!_CPLSilentLogging)
    {
      __CPLTaskOSLogDomain_12581();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(v9) = 0;
        _os_log_impl(&dword_1B03C2000, v8, OS_LOG_TYPE_DEBUG, "Some background downloads failed, we will need another pass on background downloads", (uint8_t *)&v9, 2u);
      }

      badError = self->_badError;
    }
    if (!badError)
      badError = self->_stopError;
  }
  else
  {
    badError = 0;
  }
  -[CPLBackgroundDownloadsTask taskDidFinishWithError:](self, "taskDidFinishWithError:", badError);
}

- (void)_getResourceTypesToDownload:(const unint64_t *)a3
{
  if (self->_prioritizeNonDerivatives)
    +[CPLResource getAllResourceTypesToDownloadPrioritizeNonDerivatives:](CPLResource, "getAllResourceTypesToDownloadPrioritizeNonDerivatives:", a3);
  else
    +[CPLResource getAllResourceTypesToDownload:](CPLResource, "getAllResourceTypesToDownload:", a3);
}

- (void)_launchNecessaryDownloadTasksWithTransaction:(id)a3
{
  id v4;
  _QWORD v5[5];

  v4 = a3;
  if (!-[CPLEngineSyncTask isCancelled](self, "isCancelled") && !self->_shouldStop)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __75__CPLBackgroundDownloadsTask__launchNecessaryDownloadTasksWithTransaction___block_invoke;
    v5[3] = &unk_1E60DD6D0;
    v5[4] = self;
    objc_msgSend(v4, "do:", v5);
    -[CPLBackgroundDownloadsTask _updateActiveDownloadTaskCount](self, "_updateActiveDownloadTaskCount");
  }

}

- (BOOL)_isErrorCountingForARetry:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isCPLOperationCancelledError") & 1) != 0
    || (objc_msgSend(v3, "isCPLErrorWithCode:", 81) & 1) != 0
    || (objc_msgSend(v3, "isCPLOperationDeferredError") & 1) != 0)
  {
    LOBYTE(v4) = 0;
  }
  else
  {
    v4 = objc_msgSend(v3, "isCPLThrottlingError") ^ 1;
  }

  return v4;
}

- (void)_completeBackgroundDownloadForResource:(id)a3 error:(id)a4 withTransaction:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  BOOL v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  _QWORD v26[4];
  id v27;
  id v28;
  id v29;
  _QWORD v30[4];
  id v31;
  id v32;
  id v33;
  id v34;
  BOOL v35;

  v19 = a3;
  v8 = a4;
  v9 = a5;
  -[CPLEngineSyncTask engineLibrary](self, "engineLibrary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "store");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "downloadQueue");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    if (+[CPLEngineResourceDownloadQueue shouldRetryDownloadOnError:](CPLEngineResourceDownloadQueue, "shouldRetryDownloadOnError:", v8))
    {
      v13 = -[CPLBackgroundDownloadsTask _isErrorCountingForARetry:](self, "_isErrorCountingForARetry:", v8);
      v30[0] = MEMORY[0x1E0C809B0];
      v30[1] = 3221225472;
      v30[2] = __91__CPLBackgroundDownloadsTask__completeBackgroundDownloadForResource_error_withTransaction___block_invoke;
      v30[3] = &unk_1E60DAB10;
      v31 = v12;
      v32 = v19;
      v35 = v13;
      v33 = v8;
      v34 = v10;
      objc_msgSend(v9, "do:", v30);

      v14 = v31;
    }
    else
    {
      v26[0] = MEMORY[0x1E0C809B0];
      v26[1] = 3221225472;
      v26[2] = __91__CPLBackgroundDownloadsTask__completeBackgroundDownloadForResource_error_withTransaction___block_invoke_26;
      v26[3] = &unk_1E60DD160;
      v27 = v12;
      v28 = v19;
      v29 = v10;
      objc_msgSend(v9, "do:", v26);

      v14 = v27;
    }
  }
  else
  {
    objc_msgSend(v11, "resourceStorage");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "identity");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "fileURL");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __91__CPLBackgroundDownloadsTask__completeBackgroundDownloadForResource_error_withTransaction___block_invoke_2;
    v20[3] = &unk_1E60DD208;
    v21 = v12;
    v22 = v19;
    v23 = v15;
    v24 = v17;
    v25 = v10;
    v18 = v17;
    v14 = v15;
    objc_msgSend(v9, "do:", v20);

  }
}

- (void)_enqueueTasksLocked
{
  NSObject *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v8[5];
  _QWORD v9[5];
  id v10;
  uint8_t buf[4];
  CPLBackgroundDownloadsTask *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_lock);
  if (-[CPLEngineSyncTask diskPressureState](self, "diskPressureState"))
  {
    self->_shouldStop = 1;
    if (!_CPLSilentLogging)
    {
      __CPLTaskOSLogDomain_12581();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v12 = self;
        _os_log_impl(&dword_1B03C2000, v3, OS_LOG_TYPE_DEFAULT, "System had not enough disk space to continue %@", buf, 0xCu);
      }

    }
    if (!-[NSMutableArray count](self->_transportTasks, "count"))
      -[CPLBackgroundDownloadsTask _finishTaskLocked](self, "_finishTaskLocked");
  }
  else
  {
    dispatch_suspend((dispatch_object_t)self->_lock);
    -[CPLEngineSyncTask engineLibrary](self, "engineLibrary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "store");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v8[4] = self;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __49__CPLBackgroundDownloadsTask__enqueueTasksLocked__block_invoke;
    v9[3] = &unk_1E60DD810;
    v9[4] = self;
    v10 = v5;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __49__CPLBackgroundDownloadsTask__enqueueTasksLocked__block_invoke_27;
    v8[3] = &unk_1E60DD838;
    v6 = v5;
    v7 = (id)objc_msgSend(v6, "performWriteTransactionWithBlock:completionHandler:", v9, v8);

  }
}

- (void)_updateActiveDownloadTaskCount
{
  NSMutableArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  os_unfair_lock_s *p_taskCountLock;
  _QWORD *v11;
  _QWORD v12[2];
  uint64_t (*v13)(uint64_t);
  void *v14;
  CPLBackgroundDownloadsTask *v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v3 = self->_transportTasks;
  v4 = 0;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v18;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v18 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v7), "downloadTasks");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "count");

        v4 += v9;
        ++v7;
      }
      while (v5 != v7);
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v5);
  }

  p_taskCountLock = &self->_taskCountLock;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v13 = __60__CPLBackgroundDownloadsTask__updateActiveDownloadTaskCount__block_invoke;
  v14 = &unk_1E60D6DF8;
  v15 = self;
  v16 = v4;
  v11 = v12;
  os_unfair_lock_lock(p_taskCountLock);
  v13((uint64_t)v11);
  os_unfair_lock_unlock(p_taskCountLock);

}

- (unint64_t)_activeTransferTaskCount
{
  os_unfair_lock_s *p_taskCountLock;
  _QWORD *v3;
  unint64_t v4;
  _QWORD v6[2];
  uint64_t (*v7)(uint64_t);
  void *v8;
  CPLBackgroundDownloadsTask *v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;

  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  p_taskCountLock = &self->_taskCountLock;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v7 = __54__CPLBackgroundDownloadsTask__activeTransferTaskCount__block_invoke;
  v8 = &unk_1E60D64C8;
  v9 = self;
  v10 = &v11;
  v3 = v6;
  os_unfair_lock_lock(p_taskCountLock);
  v7((uint64_t)v3);
  os_unfair_lock_unlock(p_taskCountLock);

  v4 = v12[3];
  _Block_object_dispose(&v11, 8);
  return v4;
}

- (unint64_t)_transportTaskCount
{
  os_unfair_lock_s *p_taskCountLock;
  _QWORD *v3;
  unint64_t v4;
  _QWORD v6[2];
  uint64_t (*v7)(uint64_t);
  void *v8;
  CPLBackgroundDownloadsTask *v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;

  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  p_taskCountLock = &self->_taskCountLock;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v7 = __49__CPLBackgroundDownloadsTask__transportTaskCount__block_invoke;
  v8 = &unk_1E60D64C8;
  v9 = self;
  v10 = &v11;
  v3 = v6;
  os_unfair_lock_lock(p_taskCountLock);
  v7((uint64_t)v3);
  os_unfair_lock_unlock(p_taskCountLock);

  v4 = v12[3];
  _Block_object_dispose(&v11, 8);
  return v4;
}

- (void)_downloadTask:(id)a3 didFinishWithErrorLocked:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _BOOL4 shouldStop;
  NSError *v10;
  NSError *stopError;
  uint64_t v12;
  NSError **p_stopError;
  int v14;
  NSError *badError;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  unint64_t v20;
  NSObject *v21;
  void *v22;
  NSObject *v23;
  int v24;
  uint64_t v25;
  __int16 v26;
  unint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  shouldStop = self->_shouldStop;
  if (v7)
  {
    if (objc_msgSend(v7, "isCPLOperationCancelledError"))
    {
      if (!self->_stopError)
      {
        +[CPLErrors operationCancelledError](CPLErrors, "operationCancelledError");
        v10 = (NSError *)objc_claimAutoreleasedReturnValue();
        stopError = self->_stopError;
        self->_stopError = v10;

      }
      goto LABEL_18;
    }
    if (objc_msgSend(v8, "isCPLOperationDeferredError"))
    {
      p_stopError = &self->_stopError;
      if (!self->_stopError)
      {
LABEL_17:
        objc_storeStrong((id *)p_stopError, a4);
        goto LABEL_18;
      }
      goto LABEL_18;
    }
    v14 = objc_msgSend(v8, "isCPLErrorWithCode:", 1000);
    badError = self->_badError;
    if (v14)
    {
      if (!badError)
      {
        if (!_CPLSilentLogging)
        {
          __CPLTaskOSLogDomain_12581();
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v6, "resource");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = 138412290;
            v25 = (uint64_t)v17;
            _os_log_impl(&dword_1B03C2000, v16, OS_LOG_TYPE_ERROR, "Downloading %@ in background failed because server is unavailable", (uint8_t *)&v24, 0xCu);

          }
        }
        p_stopError = &self->_badError;
        goto LABEL_17;
      }
LABEL_18:
      self->_shouldStop = 1;
      goto LABEL_19;
    }
    if (!badError)
    {
      if (!_CPLSilentLogging)
      {
        __CPLTaskOSLogDomain_12581();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v6, "resource");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = 138412546;
          v25 = (uint64_t)v22;
          v26 = 2112;
          v27 = (unint64_t)v8;
          _os_log_impl(&dword_1B03C2000, v21, OS_LOG_TYPE_ERROR, "Downloading %@ in background failed with error: %@", (uint8_t *)&v24, 0x16u);

        }
      }
      objc_storeStrong((id *)&self->_badError, a4);
    }
    if (objc_msgSend(v8, "isCPLThrottlingError") && !self->_prioritizeNonDerivatives)
    {
      if (!_CPLSilentLogging)
      {
        __CPLTaskOSLogDomain_12581();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v24) = 0;
          _os_log_impl(&dword_1B03C2000, v23, OS_LOG_TYPE_DEFAULT, "Downloads have been throttled, prioritizing non-derivatives", (uint8_t *)&v24, 2u);
        }

      }
      self->_prioritizeNonDerivatives = 1;
    }
    v12 = 128;
  }
  else
  {
    v12 = 120;
  }
  ++*(Class *)((char *)&self->super.super.isa + v12);
LABEL_19:
  -[CPLBackgroundDownloadsTask _updateActiveDownloadTaskCount](self, "_updateActiveDownloadTaskCount");
  if (!shouldStop && self->_shouldStop)
  {
    if (!_CPLSilentLogging)
    {
      __CPLTaskOSLogDomain_12581();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        v19 = -[NSMutableArray count](self->_transportTasks, "count");
        v20 = -[CPLBackgroundDownloadsTask _activeTransferTaskCount](self, "_activeTransferTaskCount");
        v24 = 134218240;
        v25 = v19;
        v26 = 2048;
        v27 = v20;
        _os_log_impl(&dword_1B03C2000, v18, OS_LOG_TYPE_DEFAULT, "Background downloads have been interrupted, waiting for %lu transport task groups to finish (%lu tasks total)", (uint8_t *)&v24, 0x16u);
      }

    }
    -[NSMutableArray makeObjectsPerformSelector:](self->_transportTasks, "makeObjectsPerformSelector:", sel_cancel);
  }

}

- (void)_transportTaskDidFinish:(id)a3
{
  id v4;
  NSObject *v5;
  OS_dispatch_queue *lock;
  uint64_t v7;
  _QWORD *v8;
  NSObject *v9;
  id v10;
  dispatch_block_t v11;
  _QWORD v12[5];
  id v13;
  __int128 buf;
  void (*v15)(uint64_t);
  void *v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!_CPLSilentLogging)
  {
    __CPLTaskOSLogDomain_12581();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v4;
      _os_log_impl(&dword_1B03C2000, v5, OS_LOG_TYPE_DEBUG, "Transport task %@ did finish", (uint8_t *)&buf, 0xCu);
    }

  }
  lock = self->_lock;
  v7 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __54__CPLBackgroundDownloadsTask__transportTaskDidFinish___block_invoke;
  v12[3] = &unk_1E60D6F88;
  v12[4] = self;
  v13 = v4;
  v8 = v12;
  *(_QWORD *)&buf = v7;
  *((_QWORD *)&buf + 1) = 3221225472;
  v15 = __cpl_dispatch_async_block_invoke_12578;
  v16 = &unk_1E60D71F8;
  v17 = v8;
  v9 = lock;
  v10 = v4;
  v11 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, &buf);
  dispatch_async(v9, v11);

}

- (void)launch
{
  OS_dispatch_queue *lock;
  uint64_t v4;
  _QWORD *v5;
  NSObject *v6;
  dispatch_block_t v7;
  _QWORD v8[5];
  objc_super v9;
  _QWORD block[4];
  id v11;

  -[CPLBackgroundDownloadsTask hash](self, "hash");
  kdebug_trace();
  v9.receiver = self;
  v9.super_class = (Class)CPLBackgroundDownloadsTask;
  -[CPLEngineSyncTask launch](&v9, sel_launch);
  lock = self->_lock;
  v4 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __36__CPLBackgroundDownloadsTask_launch__block_invoke;
  v8[3] = &unk_1E60D65B8;
  v8[4] = self;
  v5 = v8;
  block[0] = v4;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_12578;
  block[3] = &unk_1E60D71F8;
  v11 = v5;
  v6 = lock;
  v7 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v6, v7);

}

- (void)taskDidFinishWithError:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  -[CPLBackgroundDownloadsTask hash](self, "hash");
  kdebug_trace();
  v5.receiver = self;
  v5.super_class = (Class)CPLBackgroundDownloadsTask;
  -[CPLEngineSyncTask taskDidFinishWithError:](&v5, sel_taskDidFinishWithError_, v4);

}

- (void)cancel
{
  OS_dispatch_queue *lock;
  uint64_t v4;
  _QWORD *v5;
  NSObject *v6;
  dispatch_block_t v7;
  _QWORD v8[5];
  objc_super v9;
  _QWORD block[4];
  id v11;

  v9.receiver = self;
  v9.super_class = (Class)CPLBackgroundDownloadsTask;
  -[CPLEngineSyncTask cancel](&v9, sel_cancel);
  lock = self->_lock;
  v4 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __36__CPLBackgroundDownloadsTask_cancel__block_invoke;
  v8[3] = &unk_1E60D65B8;
  v8[4] = self;
  v5 = v8;
  block[0] = v4;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_12578;
  block[3] = &unk_1E60D71F8;
  v11 = v5;
  v6 = lock;
  v7 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v6, v7);

}

- (id)taskIdentifier
{
  return CFSTR("engine.sync.backgrounddownloads");
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[CPLBackgroundDownloadsTask taskIdentifier](self, "taskIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %@ [%lu resources using %lu tasks]>"), v4, v5, -[CPLBackgroundDownloadsTask _activeTransferTaskCount](self, "_activeTransferTaskCount"), -[CPLBackgroundDownloadsTask _transportTaskCount](self, "_transportTaskCount"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_intentsToDownload, 0);
  objc_storeStrong((id *)&self->_stopError, 0);
  objc_storeStrong((id *)&self->_badError, 0);
  objc_storeStrong((id *)&self->_transportTasks, 0);
  objc_storeStrong((id *)&self->_lock, 0);
}

void __36__CPLBackgroundDownloadsTask_cancel__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  if (!*(_QWORD *)(v2 + 104))
  {
    +[CPLErrors operationCancelledError](CPLErrors, "operationCancelledError");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 104);
    *(_QWORD *)(v4 + 104) = v3;

    v2 = *(_QWORD *)(a1 + 32);
  }
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v6 = *(id *)(v2 + 80);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v10++), "cancel", (_QWORD)v11);
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 88) = 1;
}

uint64_t __36__CPLBackgroundDownloadsTask_launch__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_enqueueTasksLocked");
}

void __54__CPLBackgroundDownloadsTask__transportTaskDidFinish___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v5[5];
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "engineLibrary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "store");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __54__CPLBackgroundDownloadsTask__transportTaskDidFinish___block_invoke_2;
  v5[3] = &unk_1E60D6F88;
  v4 = *(void **)(a1 + 40);
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v4;
  objc_msgSend(v3, "performBatchedWriteTransactionBarrierWithCompletionBlock:", v5);

}

void __54__CPLBackgroundDownloadsTask__transportTaskDidFinish___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  uint64_t v4;
  _QWORD *v5;
  NSObject *v6;
  dispatch_block_t v7;
  _QWORD v8[5];
  id v9;
  _QWORD block[4];
  id v11;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  v3 = *(void **)(v1 + 72);
  v4 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __54__CPLBackgroundDownloadsTask__transportTaskDidFinish___block_invoke_3;
  v8[3] = &unk_1E60D6F88;
  v8[4] = v1;
  v9 = v2;
  v5 = v8;
  block[0] = v4;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_12578;
  block[3] = &unk_1E60D71F8;
  v11 = v5;
  v6 = v3;
  v7 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v6, v7);

}

unint64_t __54__CPLBackgroundDownloadsTask__transportTaskDidFinish___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t result;
  char v5;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "removeObject:", *(_QWORD *)(a1 + 40));
  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "count");
  v3 = *(_QWORD *)(a1 + 32);
  if (!v2)
  {
    v5 = objc_msgSend((id)v3, "isCancelled");
    v3 = *(_QWORD *)(a1 + 32);
    if ((v5 & 1) != 0 || *(_BYTE *)(v3 + 88))
      return objc_msgSend((id)v3, "_finishTaskLocked");
  }
  result = objc_msgSend(*(id *)(v3 + 80), "count");
  if (result <= 2)
  {
    result = objc_msgSend(*(id *)(a1 + 32), "isCancelled");
    if ((result & 1) == 0)
    {
      result = *(_QWORD *)(a1 + 32);
      if (!*(_BYTE *)(result + 88))
        return objc_msgSend((id)result, "_enqueueTasksLocked");
    }
  }
  return result;
}

uint64_t __49__CPLBackgroundDownloadsTask__transportTaskCount__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 152);
  return result;
}

uint64_t __54__CPLBackgroundDownloadsTask__activeTransferTaskCount__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 144);
  return result;
}

uint64_t __60__CPLBackgroundDownloadsTask__updateActiveDownloadTaskCount__block_invoke(uint64_t a1)
{
  uint64_t result;

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 144) = *(_QWORD *)(a1 + 40);
  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "count");
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 152) = result;
  return result;
}

void __49__CPLBackgroundDownloadsTask__enqueueTasksLocked__block_invoke(uint64_t a1, void *a2)
{
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void *v9;
  uint64_t v10;
  id v11;

  v6 = MEMORY[0x1E0C809B0];
  v7 = 3221225472;
  v8 = __49__CPLBackgroundDownloadsTask__enqueueTasksLocked__block_invoke_2;
  v9 = &unk_1E60DDA30;
  v4 = *(void **)(a1 + 40);
  v10 = *(_QWORD *)(a1 + 32);
  v11 = v4;
  v5 = a2;
  objc_msgSend(v5, "do:", &v6);
  objc_msgSend(*(id *)(a1 + 32), "_launchNecessaryDownloadTasksWithTransaction:", v5, v6, v7, v8, v9, v10);

}

void __49__CPLBackgroundDownloadsTask__enqueueTasksLocked__block_invoke_27(uint64_t a1)
{
  NSObject *v2;
  uint8_t v3[16];

  if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "count"))
  {
    if (!_CPLSilentLogging)
    {
      __CPLTaskOSLogDomain_12581();
      v2 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)v3 = 0;
        _os_log_impl(&dword_1B03C2000, v2, OS_LOG_TYPE_DEBUG, "No more available background downloads", v3, 2u);
      }

    }
    objc_msgSend(*(id *)(a1 + 32), "_finishTaskLocked");
  }
  dispatch_resume(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 72));
}

uint64_t __49__CPLBackgroundDownloadsTask__enqueueTasksLocked__block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  NSObject *v5;
  void *v6;
  uint8_t v8[16];

  if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 113))
    return 1;
  if (!_CPLSilentLogging)
  {
    __CPLTaskOSLogDomain_12581();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_1B03C2000, v5, OS_LOG_TYPE_DEBUG, "Resetting all dequeued tasks", v8, 2u);
    }

  }
  objc_msgSend(*(id *)(a1 + 40), "downloadQueue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v6, "resetDequeuedBackgroundDownloadTasksWithError:", a2);

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 113) = 1;
  return v2;
}

uint64_t __91__CPLBackgroundDownloadsTask__completeBackgroundDownloadForResource_error_withTransaction___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  NSObject *v4;
  const __CFString *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  char v10;
  uint8_t buf[4];
  const __CFString *v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v10 = 0;
  v3 = objc_msgSend(*(id *)(a1 + 32), "reenqueueBackgroundDownloadTaskForResource:bumpRetryCount:didDiscard:error:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 64), &v10, a2);
  if ((_DWORD)v3)
  {
    if (!_CPLSilentLogging)
    {
      __CPLTaskOSLogDomain_12581();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      {
        if (v10)
        {
          v5 = CFSTR("Discarded");
        }
        else if (*(_BYTE *)(a1 + 64))
        {
          v5 = CFSTR("Bumped retry count");
        }
        else
        {
          v5 = CFSTR("Reenqueued");
        }
        v6 = *(_QWORD *)(a1 + 40);
        v7 = *(_QWORD *)(a1 + 48);
        *(_DWORD *)buf = 138412802;
        v12 = v5;
        v13 = 2112;
        v14 = v6;
        v15 = 2112;
        v16 = v7;
        _os_log_impl(&dword_1B03C2000, v4, OS_LOG_TYPE_DEBUG, "%@ %@ for background download (error: %@)", buf, 0x20u);
      }

    }
    if (v10)
    {
      objc_msgSend(*(id *)(a1 + 40), "identity");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setFileURL:", 0);

      objc_msgSend(*(id *)(a1 + 56), "notifyAttachedObjectsResourceDidFailBackgroundDownloadOfResource:", *(_QWORD *)(a1 + 40));
    }
  }
  return v3;
}

uint64_t __91__CPLBackgroundDownloadsTask__completeBackgroundDownloadForResource_error_withTransaction___block_invoke_26(id *a1, uint64_t a2)
{
  uint64_t v3;
  void *v4;

  v3 = objc_msgSend(a1[4], "removeBackgroundDownloadTaskForResource:error:", a1[5], a2);
  if ((_DWORD)v3)
  {
    objc_msgSend(a1[5], "identity");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setFileURL:", 0);

    objc_msgSend(a1[6], "notifyAttachedObjectsResourceDidFailBackgroundDownloadOfResource:", a1[5]);
  }
  return v3;
}

uint64_t __91__CPLBackgroundDownloadsTask__completeBackgroundDownloadForResource_error_withTransaction___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  void *v5;

  result = objc_msgSend(*(id *)(a1 + 32), "markBackgroundDownloadTaskForResourceAsSuceeded:error:", *(_QWORD *)(a1 + 40), a2);
  if ((_DWORD)result)
  {
    result = objc_msgSend(*(id *)(a1 + 48), "storeDownloadedResource:atURL:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56), a2);
    if ((_DWORD)result)
    {
      objc_msgSend(*(id *)(a1 + 40), "identity");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setFileURL:", 0);

      objc_msgSend(*(id *)(a1 + 64), "notifyAttachedObjectsResourceDidDownloadInBackground:", *(_QWORD *)(a1 + 40));
      return 1;
    }
  }
  return result;
}

uint64_t __75__CPLBackgroundDownloadsTask__launchNecessaryDownloadTasksWithTransaction___block_invoke(uint64_t a1, void **a2)
{
  id *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  id v17;
  CPLEngineResourceDownloadTask *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  id v22;
  CPLEngineResourceDownloadTask *v23;
  CPLResourceTransferTaskOptions *v24;
  void *v25;
  uint64_t v26;
  int v27;
  void *v28;
  void *v29;
  char v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  NSObject *v35;
  void *v36;
  NSObject *v37;
  void *v38;
  NSObject *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  NSObject *v44;
  NSObject *v45;
  char *v46;
  char *v47;
  void *v48;
  unint64_t v49;
  void *v50;
  void *v51;
  NSObject *v52;
  void *v53;
  uint64_t v54;
  void *v55;
  void *v56;
  void *v57;
  id v58;
  uint64_t v59;
  id obj;
  uint64_t v62;
  void *v63;
  void *v64;
  void *v65;
  uint64_t v66;
  uint64_t v67;
  id v69;
  _QWORD v70[5];
  id v71;
  id v72;
  id v73;
  id v74;
  _QWORD v75[4];
  id v76;
  _QWORD *v77;
  id v78;
  id v79;
  id v80;
  id v81;
  char v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  _QWORD v87[5];
  _QWORD v88[3];
  char v89;
  _QWORD *v90;
  uint8_t v91[128];
  uint8_t buf[4];
  uint64_t v93;
  __int16 v94;
  void *v95;
  uint64_t v96;

  v96 = *MEMORY[0x1E0C80C00];
  v2 = (id *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 32), "engineLibrary");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "store");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "downloadQueue");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "transport");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "resourceStorage");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "scheduler");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v90 = 0;
  objc_msgSend(*v2, "_getResourceTypesToDownload:", &v90);
  v88[0] = 0;
  v88[1] = v88;
  v88[2] = 0x2020000000;
  v89 = 0;
  objc_msgSend(v57, "transactionTransportScopeMapping");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = 0;
  v47 = 0;
  while (2)
  {
    if ((unint64_t)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "count") > 2)
      goto LABEL_70;
    v49 = +[CPLEngineResourceDownloadTask maximumResourceDownloadSizeForResourceType:](CPLEngineResourceDownloadTask, "maximumResourceDownloadSizeForResourceType:", *v90);
    v52 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3788]), "initWithIndexesInRange:", 0, objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 168), "count"));
    v54 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 176);
    while (-[NSObject count](v52, "count")
         && (unint64_t)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "count") <= 2)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 168), "objectAtIndexedSubscript:", v54);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v59 = objc_msgSend(v3, "unsignedIntegerValue");

      objc_msgSend(v63, "dequeueNextBackgroundDownloadTasksForResourceType:andIntent:maximumSize:maximumCount:error:", *v90, v59, v49, 200, a2);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v53 = v4;
      if (!v4)
      {
        if (!_CPLSilentLogging)
        {
          __CPLTaskOSLogDomain_12581();
          v39 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
          {
            +[CPLResource shortDescriptionForResourceType:](CPLResource, "shortDescriptionForResourceType:", *v90);
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            v41 = *a2;
            *(_DWORD *)buf = 138412546;
            v93 = (uint64_t)v40;
            v94 = 2112;
            v95 = v41;
            _os_log_impl(&dword_1B03C2000, v39, OS_LOG_TYPE_ERROR, "Failed to dequeue resources to download in background for %@: %@", buf, 0x16u);

          }
        }
        obj = 0;
LABEL_62:

        v42 = 0;
LABEL_63:

        goto LABEL_64;
      }
      if (objc_msgSend(v4, "count"))
      {
        if (!_CPLSilentLogging)
        {
          __CPLTaskOSLogDomain_12581();
          v5 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
          {
            v6 = objc_msgSend(v53, "count");
            +[CPLResource shortDescriptionForResourceType:](CPLResource, "shortDescriptionForResourceType:", *v90);
            v7 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 134218242;
            v93 = v6;
            v94 = 2112;
            v95 = v7;
            _os_log_impl(&dword_1B03C2000, v5, OS_LOG_TYPE_DEBUG, "Dequeued %lu resources (%@) to download in background", buf, 0x16u);

          }
        }
        v87[0] = MEMORY[0x1E0C809B0];
        v87[1] = 3221225472;
        v87[2] = __75__CPLBackgroundDownloadsTask__launchNecessaryDownloadTasksWithTransaction___block_invoke_8;
        v87[3] = &unk_1E60DA9E8;
        v87[4] = *(_QWORD *)(a1 + 32);
        objc_msgSend(v48, "resourcesDownloadTaskWithCompletionHandler:", v87);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        v58 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v85 = 0u;
        v86 = 0u;
        v83 = 0u;
        v84 = 0u;
        obj = v53;
        v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v83, v91, 16);
        if (v8)
        {
          v62 = 0;
          v67 = *(_QWORD *)v84;
          while (1)
          {
            v66 = v8;
            for (i = 0; i != v66; ++i)
            {
              if (*(_QWORD *)v84 != v67)
                objc_enumerationMutation(obj);
              v10 = *(void **)(*((_QWORD *)&v83 + 1) + 8 * i);
              v82 = 0;
              v11 = v10;
              objc_msgSend(v64, "createTempDestinationURLForResource:error:", v11, a2);
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              if (v12)
              {
                objc_msgSend(v11, "identity");
                v13 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v13, "setFileURL:", v12);

                v80 = 0;
                v81 = v11;
                v78 = 0;
                v79 = 0;
                objc_msgSend(v63, "cloudResourceForLocalResource:cloudRecord:target:shouldNotTrustCaches:allowUnsafeClientCache:transportScopeMapping:error:", &v81, &v80, &v79, &v82, 0, v65, &v78);
                v14 = (void *)objc_claimAutoreleasedReturnValue();
                v15 = v81;

                v16 = v80;
                v69 = v79;
                v17 = v78;
                if (v14)
                {
                  v18 = [CPLEngineResourceDownloadTask alloc];
                  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
                  v19 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v19, "UUIDString");
                  v20 = (void *)objc_claimAutoreleasedReturnValue();
                  v21 = MEMORY[0x1E0C809B0];
                  v75[0] = MEMORY[0x1E0C809B0];
                  v75[1] = 3221225472;
                  v75[2] = __75__CPLBackgroundDownloadsTask__launchNecessaryDownloadTasksWithTransaction___block_invoke_3;
                  v75[3] = &unk_1E60DAA70;
                  v77 = v88;
                  v76 = v56;
                  v70[0] = v21;
                  v70[1] = 3221225472;
                  v70[2] = __75__CPLBackgroundDownloadsTask__launchNecessaryDownloadTasksWithTransaction___block_invoke_4;
                  v70[3] = &unk_1E60DAAE8;
                  v70[4] = *(_QWORD *)(a1 + 32);
                  v71 = v57;
                  v22 = v15;
                  v72 = v22;
                  v73 = v55;
                  v74 = v12;
                  v23 = -[CPLEngineResourceDownloadTask initWithResource:taskIdentifier:target:launchHandler:cancelHandler:didStartHandler:progressHandler:completionHandler:](v18, "initWithResource:taskIdentifier:target:launchHandler:cancelHandler:didStartHandler:progressHandler:completionHandler:", v22, v20, v69, &__block_literal_global_12612, &__block_literal_global_13_12613, v75, 0, v70);

                  -[CPLEngineResourceDownloadTask associateCloudResource:ofRecord:](v23, "associateCloudResource:ofRecord:", v14, v16);
                  -[CPLEngineResourceDownloadTask setTransportScopeMapping:](v23, "setTransportScopeMapping:", v65);
                  v24 = -[CPLResourceTransferTaskOptions initWithIntent:priority:]([CPLResourceTransferTaskOptions alloc], "initWithIntent:priority:", v59, 2);
                  -[CPLResourceTransferTask setOptions:](v23, "setOptions:", v24);
                  objc_msgSend(v22, "identity");
                  v25 = (void *)objc_claimAutoreleasedReturnValue();
                  v26 = objc_msgSend(v25, "fileSize");

                  objc_msgSend(v58, "addObject:", v23);
                  v27 = 0;
                  v62 += v26;
                }
                else
                {
                  objc_msgSend(v15, "identity");
                  v29 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v29, "setFileURL:", 0);

                  if ((objc_msgSend(v63, "removeBackgroundDownloadTaskForResource:error:", v11, a2) & 1) != 0)
                  {
                    objc_msgSend(v50, "notifyAttachedObjectsResourceDidFailBackgroundDownloadOfResource:", v11);
                    v27 = 0;
                  }
                  else
                  {
                    v27 = 1;
                  }
                }

                v11 = v15;
LABEL_28:

                goto LABEL_29;
              }
              if (!_CPLSilentLogging)
              {
                __CPLTaskOSLogDomain_12581();
                v16 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
                {
                  v28 = *a2;
                  *(_DWORD *)buf = 138412546;
                  v93 = (uint64_t)v11;
                  v94 = 2112;
                  v95 = v28;
                  _os_log_impl(&dword_1B03C2000, v16, OS_LOG_TYPE_ERROR, "Unable to create a temporary URL for background download for %@: %@", buf, 0x16u);
                }
                v17 = 0;
                v27 = 1;
                goto LABEL_28;
              }
              v17 = 0;
              v27 = 1;
LABEL_29:

              if (v27)
              {

                v30 = 0;
                goto LABEL_41;
              }
            }
            v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v83, v91, 16);
            if (!v8)
              goto LABEL_38;
          }
        }
        v62 = 0;
LABEL_38:

        if (objc_msgSend(v58, "count"))
        {
          v33 = objc_msgSend(v58, "count");
          objc_msgSend(v51, "setDownloadTasks:", v58);
          objc_msgSend(v63, "createGroupForBackgroundDownloadsOfResourceType:transferIntent:transport:", *v90, v59, v48);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "setRoughCPLRecordCount:", objc_msgSend(v58, "count"));
          objc_msgSend(v34, "setRoughCPLDownloadEstimatedSize:", v62);
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "addObject:", v51);
          objc_msgSend(*(id *)(a1 + 32), "launchTransportTask:withTransportGroup:", v51, v34);

          v46 += v33;
          ++v47;
        }
        v54 = -[NSObject indexGreaterThanIndex:](v52, "indexGreaterThanIndex:", v54);
        v30 = 1;
LABEL_41:

        v32 = v54;
        if ((v30 & 1) == 0)
          goto LABEL_62;
      }
      else
      {
        v31 = -[NSObject indexGreaterThanIndex:](v52, "indexGreaterThanIndex:", v54);
        -[NSObject removeIndex:](v52, "removeIndex:", v54);
        v32 = v31;
      }
      v54 = v32;
      if (v32 == 0x7FFFFFFFFFFFFFFFLL)
        v54 = -[NSObject firstIndex](v52, "firstIndex");

    }
    if (-[NSObject count](v52, "count"))
    {
      *(_QWORD *)(*(_QWORD *)(a1 + 32) + 176) = v54;
LABEL_55:

      continue;
    }
    break;
  }
  if (*v90 != -1)
  {
    if (_CPLSilentLogging)
    {
      ++v90;
    }
    else
    {
      __CPLTaskOSLogDomain_12581();
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
      {
        +[CPLResource shortDescriptionForResourceType:](CPLResource, "shortDescriptionForResourceType:", *v90);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v93 = (uint64_t)v36;
        _os_log_impl(&dword_1B03C2000, v35, OS_LOG_TYPE_DEBUG, "No resources of type '%@' to download in background", buf, 0xCu);

      }
      ++v90;
      if (!_CPLSilentLogging)
      {
        __CPLTaskOSLogDomain_12581();
        v37 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
        {
          +[CPLResource shortDescriptionForResourceType:](CPLResource, "shortDescriptionForResourceType:", *v90);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v93 = (uint64_t)v38;
          _os_log_impl(&dword_1B03C2000, v37, OS_LOG_TYPE_DEBUG, "Will look for resources of type '%@'", buf, 0xCu);

        }
      }
    }
    goto LABEL_55;
  }
  if (!_CPLSilentLogging)
  {
    __CPLTaskOSLogDomain_12581();
    v44 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B03C2000, v44, OS_LOG_TYPE_DEBUG, "No more resources to download in background", buf, 2u);
    }

  }
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 176) = 0;

LABEL_70:
  v42 = 1;
  if (v47 && !_CPLSilentLogging)
  {
    __CPLTaskOSLogDomain_12581();
    v45 = objc_claimAutoreleasedReturnValue();
    v52 = v45;
    if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218240;
      v93 = (uint64_t)v47;
      v94 = 2048;
      v95 = v46;
      _os_log_impl(&dword_1B03C2000, v45, OS_LOG_TYPE_DEFAULT, "Launched %lu background download tasks (%lu resources)", buf, 0x16u);
    }
    v42 = 1;
    goto LABEL_63;
  }
LABEL_64:

  _Block_object_dispose(v88, 8);
  return v42;
}

uint64_t __75__CPLBackgroundDownloadsTask__launchNecessaryDownloadTasksWithTransaction___block_invoke_8(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_transportTaskDidFinish:", a2);
}

uint64_t __75__CPLBackgroundDownloadsTask__launchNecessaryDownloadTasksWithTransaction___block_invoke_3(uint64_t result)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(result + 40) + 8);
  if (!*(_BYTE *)(v1 + 24))
  {
    *(_BYTE *)(v1 + 24) = 1;
    return objc_msgSend(*(id *)(result + 32), "willRunEngineElement:", CPLEngineElementDownloadResourcesInBackground);
  }
  return result;
}

void __75__CPLBackgroundDownloadsTask__launchNecessaryDownloadTasksWithTransaction___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  _QWORD *v13;
  NSObject *v14;
  id v15;
  id v16;
  dispatch_block_t v17;
  _QWORD v18[4];
  id v19;
  uint64_t v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  _QWORD block[4];
  id v27;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (!v6)
  {
    if (objc_msgSend(*(id *)(a1 + 32), "isCancelled"))
    {
      +[CPLErrors operationCancelledError](CPLErrors, "operationCancelledError");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = 0;
    }
  }
  v8 = *(void **)(a1 + 40);
  v9 = *(void **)(*(_QWORD *)(a1 + 32) + 72);
  v10 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __75__CPLBackgroundDownloadsTask__launchNecessaryDownloadTasksWithTransaction___block_invoke_5;
  v18[3] = &unk_1E60DAAC0;
  v11 = v8;
  v12 = *(_QWORD *)(a1 + 32);
  v19 = v11;
  v20 = v12;
  v21 = *(id *)(a1 + 48);
  v22 = v7;
  v23 = v5;
  v24 = *(id *)(a1 + 56);
  v25 = *(id *)(a1 + 64);
  v13 = v18;
  block[0] = v10;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_12578;
  block[3] = &unk_1E60D71F8;
  v27 = v13;
  v14 = v9;
  v15 = v5;
  v16 = v7;
  v17 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v14, v17);

}

void __75__CPLBackgroundDownloadsTask__launchNecessaryDownloadTasksWithTransaction___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  id v3;

  v2 = a2;
  objc_msgSend(v2, "transportTask");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancelDownloadTask:", v2);

}

void __75__CPLBackgroundDownloadsTask__launchNecessaryDownloadTasksWithTransaction___block_invoke_5(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  _QWORD v4[5];
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD v9[5];
  id v10;
  id v11;

  v2 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __75__CPLBackgroundDownloadsTask__launchNecessaryDownloadTasksWithTransaction___block_invoke_6;
  v9[3] = &unk_1E60DD2A8;
  v3 = *(void **)(a1 + 32);
  v9[4] = *(_QWORD *)(a1 + 40);
  v10 = *(id *)(a1 + 48);
  v11 = *(id *)(a1 + 56);
  v4[0] = v2;
  v4[1] = 3221225472;
  v4[2] = __75__CPLBackgroundDownloadsTask__launchNecessaryDownloadTasksWithTransaction___block_invoke_7;
  v4[3] = &unk_1E60DAA98;
  v4[4] = *(_QWORD *)(a1 + 40);
  v5 = *(id *)(a1 + 64);
  v6 = *(id *)(a1 + 56);
  v7 = *(id *)(a1 + 72);
  v8 = *(id *)(a1 + 80);
  objc_msgSend(v3, "performBatchedWriteTransactionWithBlock:completionHandler:", v9, v4);

}

uint64_t __75__CPLBackgroundDownloadsTask__launchNecessaryDownloadTasksWithTransaction___block_invoke_6(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_completeBackgroundDownloadForResource:error:withTransaction:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), a2);
}

void __75__CPLBackgroundDownloadsTask__launchNecessaryDownloadTasksWithTransaction___block_invoke_7(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  _QWORD *v8;
  NSObject *v9;
  id v10;
  dispatch_block_t v11;
  _QWORD v12[5];
  id v13;
  id v14;
  id v15;
  _QWORD block[4];
  id v17;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  v6 = *(void **)(v4 + 72);
  v12[2] = __75__CPLBackgroundDownloadsTask__launchNecessaryDownloadTasksWithTransaction___block_invoke_8;
  v12[3] = &unk_1E60D6FB0;
  v7 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[4] = v4;
  v13 = v5;
  v14 = v3;
  v15 = *(id *)(a1 + 48);
  v8 = v12;
  block[0] = v7;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_12578;
  block[3] = &unk_1E60D71F8;
  v17 = v8;
  v9 = v6;
  v10 = v3;
  v11 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v9, v11);

  objc_msgSend(*(id *)(a1 + 56), "removeItemAtURL:error:", *(_QWORD *)(a1 + 64), 0);
}

void __75__CPLBackgroundDownloadsTask__launchNecessaryDownloadTasksWithTransaction___block_invoke_8(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 48), "error");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (id)v4;
  if (!v4)
    v4 = *(_QWORD *)(a1 + 56);
  objc_msgSend(v2, "_downloadTask:didFinishWithErrorLocked:", v3, v4);

}

@end
