@implementation CPLUploadComputeStatesScopeTask

- (CPLUploadComputeStatesScopeTask)initWithEngineLibrary:(id)a3 session:(id)a4 clientCacheIdentifier:(id)a5 scope:(id)a6 transportScope:(id)a7
{
  id v12;
  CPLUploadComputeStatesScopeTask *v13;
  NSObject *v14;
  dispatch_queue_t v15;
  OS_dispatch_queue *queue;
  CPLTransportScopeMapping *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  CPLTransportScopeMapping *transportScopeMapping;
  void *v22;
  CPLTransportScopeMapping *v23;
  void *v24;
  objc_super v26;

  v12 = a6;
  v26.receiver = self;
  v26.super_class = (Class)CPLUploadComputeStatesScopeTask;
  v13 = -[CPLEngineScopedTask initWithEngineLibrary:session:clientCacheIdentifier:scope:transportScope:](&v26, sel_initWithEngineLibrary_session_clientCacheIdentifier_scope_transportScope_, a3, a4, a5, v12, a7);
  if (v13)
  {
    CPLCopyDefaultSerialQueueAttributes();
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = dispatch_queue_create("engine.sync.uploadcomputestates", v14);
    queue = v13->_queue;
    v13->_queue = (OS_dispatch_queue *)v15;

    v17 = [CPLTransportScopeMapping alloc];
    -[CPLEngineSyncTask engineLibrary](v13, "engineLibrary");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "transport");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = -[CPLTransportScopeMapping initWithTranslator:](v17, "initWithTranslator:", v19);
    transportScopeMapping = v13->_transportScopeMapping;
    v13->_transportScopeMapping = (CPLTransportScopeMapping *)v20;

    -[CPLEngineScopedTask transportScope](v13, "transportScope");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v13->_transportScopeMapping;
    objc_msgSend(v12, "scopeIdentifier");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPLTransportScopeMapping setObject:forKeyedSubscript:](v23, "setObject:forKeyedSubscript:", v22, v24);

    v13->_taskItem = -1;
  }

  return v13;
}

- (BOOL)checkScopeIsValidInTransaction:(id)a3
{
  id v4;
  void *v5;
  int v6;
  NSObject *v7;
  id v8;
  void *v9;
  BOOL v10;
  void *v11;
  uint8_t v13[24];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[CPLEngineSyncTask session](self, "session");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "shouldDefer");

  if (v6)
  {
    if (!_CPLSilentLogging)
    {
      __CPLTaskOSLogDomain_1243();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v13 = 138412290;
        *(_QWORD *)&v13[4] = objc_opt_class();
        v8 = *(id *)&v13[4];
        _os_log_impl(&dword_1B03C2000, v7, OS_LOG_TYPE_DEFAULT, "Session for %@ has been deferred", v13, 0xCu);

      }
    }
    +[CPLErrors sessionHasBeenDeferredError](CPLErrors, "sessionHasBeenDeferredError", *(_OWORD *)v13);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setError:", v9);

    v10 = 0;
  }
  else
  {
    objc_msgSend(v4, "error");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v11 == 0;

  }
  return v10;
}

- (void)_uploadExtractedBatch
{
  void *v4;
  void *v5;
  CPLUploadComputeStatesAccumulator *computeStatesAccumulator;
  NSDictionary *knownRecords;
  void *v8;
  void *v9;
  CPLEngineTransportGroup *v10;
  CPLEngineTransportGroup *transportGroup;
  CFAbsoluteTime Current;
  NSDictionary *v13;
  void *v14;
  CPLEngineScope *sharedScope;
  CPLRecordTargetMapping *targetMapping;
  CPLTransportScopeMapping *transportScopeMapping;
  CPLEngineTransportUploadComputeStatesTask *v18;
  CPLEngineTransportUploadComputeStatesTask *uploadComputeStatesTask;
  CPLEngineTransportUploadComputeStatesTask *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v26[6];
  uint8_t buf[4];
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (-[CPLUploadComputeStatesAccumulator countOfCloudComputeStatesToUpload](self->_computeStatesAccumulator, "countOfCloudComputeStatesToUpload"))
  {
    -[CPLEngineScopedTask scope](self, "scope");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[CPLEngineSyncTask isCancelled](self, "isCancelled"))
    {
      +[CPLErrors operationCancelledError](CPLErrors, "operationCancelledError");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[CPLUploadComputeStatesScopeTask _uploadComputeStatesTaskDidFinishWithError:](self, "_uploadComputeStatesTaskDidFinishWithError:", v5);

    }
    else
    {
      -[CPLEngineSyncTask engineLibrary](self, "engineLibrary");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "transport");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v9, "createGroupForComputeStateUpload");
      v10 = (CPLEngineTransportGroup *)objc_claimAutoreleasedReturnValue();
      transportGroup = self->_transportGroup;
      self->_transportGroup = v10;

      Current = CFAbsoluteTimeGetCurrent();
      v13 = self->_knownRecords;
      -[CPLUploadComputeStatesAccumulator cloudComputeStatesToUpload](self->_computeStatesAccumulator, "cloudComputeStatesToUpload");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      sharedScope = self->_sharedScope;
      targetMapping = self->_targetMapping;
      transportScopeMapping = self->_transportScopeMapping;
      v26[0] = MEMORY[0x1E0C809B0];
      v26[1] = 3221225472;
      v26[2] = __56__CPLUploadComputeStatesScopeTask__uploadExtractedBatch__block_invoke;
      v26[3] = &unk_1E60D7990;
      v26[4] = self;
      *(CFAbsoluteTime *)&v26[5] = Current;
      objc_msgSend(v9, "uploadComputeStates:scope:sharedScope:targetMapping:transportScopeMapping:knownRecords:completionHandler:", v14, v4, sharedScope, targetMapping, transportScopeMapping, v13, v26);
      v18 = (CPLEngineTransportUploadComputeStatesTask *)objc_claimAutoreleasedReturnValue();
      uploadComputeStatesTask = self->_uploadComputeStatesTask;
      self->_uploadComputeStatesTask = v18;

      v20 = self->_uploadComputeStatesTask;
      if (!v20)
      {
        if (!_CPLSilentLogging)
        {
          __CPLTaskOSLogDomain_1243();
          v21 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          {
            -[CPLUploadComputeStatesAccumulator cloudComputeStatesToUpload](self->_computeStatesAccumulator, "cloudComputeStatesToUpload");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v28 = v22;
            _os_log_impl(&dword_1B03C2000, v21, OS_LOG_TYPE_ERROR, "Failed to create a task for %@", buf, 0xCu);

          }
        }
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/Upload Compute State Phase/CPLUploadComputeStatesTask.m");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[CPLUploadComputeStatesAccumulator cloudComputeStatesToUpload](self->_computeStatesAccumulator, "cloudComputeStatesToUpload");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v24, 145, CFSTR("Failed to create a task for %@"), v25);

        abort();
      }
      -[CPLEngineSyncTask launchTransportTask:withTransportGroup:](self, "launchTransportTask:withTransportGroup:", v20, self->_transportGroup);

    }
  }
  else
  {
    computeStatesAccumulator = self->_computeStatesAccumulator;
    self->_computeStatesAccumulator = 0;

    knownRecords = self->_knownRecords;
    self->_knownRecords = 0;

    -[CPLUploadComputeStatesScopeTask _getNextBatchAndUpload](self, "_getNextBatchAndUpload");
  }
}

- (void)_dropLocalComputeStates:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  uint8_t buf[4];
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    self->_countOfDroppedComputeStates += objc_msgSend(v4, "count");
    if (!_CPLSilentLogging)
    {
      __CPLTaskOSLogDomain_1243();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        v14 = v4;
        _os_log_impl(&dword_1B03C2000, v5, OS_LOG_TYPE_DEFAULT, "Dropping %lu compute states with no payload", buf, 0xCu);
      }

    }
    -[CPLEngineSyncTask engineLibrary](self, "engineLibrary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "store");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __59__CPLUploadComputeStatesScopeTask__dropLocalComputeStates___block_invoke;
    v10[3] = &unk_1E60DD810;
    v11 = v7;
    v12 = v4;
    v8 = v7;
    v9 = (id)objc_msgSend(v8, "performWriteTransactionWithBlock:completionHandler:", v10, &__block_literal_global_1299);

  }
}

- (void)_deleteTempFolderForPayloads
{
  void *v2;
  void *v3;
  void *v4;
  char v5;
  id v6;
  NSObject *v7;
  id v8;
  uint8_t buf[4];
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  -[CPLEngineSyncTask engineLibrary](self, "engineLibrary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "store");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "recordComputeStatePushQueue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  v5 = objc_msgSend(v4, "deleteTempUploadFolderWithError:", &v8);
  v6 = v8;

  if ((v5 & 1) == 0 && !_CPLSilentLogging)
  {
    __CPLTaskOSLogDomain_1243();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v10 = v6;
      _os_log_impl(&dword_1B03C2000, v7, OS_LOG_TYPE_ERROR, "Failed to remove temp folder: %@", buf, 0xCu);
    }

  }
}

- (void)_requestMissingPayloads
{
  void *v3;
  int v4;
  uint64_t v5;
  void *v6;
  NSProgress *v7;
  NSProgress *requestMissingPayloadsProgress;
  NSProgress *v9;
  void *v10;
  NSProgress *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  uint64_t v19;
  NSProgress *v20;
  NSObject *v21;
  id v22;
  _QWORD v23[5];
  id v24;
  id v25;
  id v26;
  _QWORD *v27;
  id v28;
  _QWORD v29[5];
  NSProgress *v30;
  _QWORD *v31;
  _QWORD v32[3];
  char v33;
  uint8_t buf[4];
  uint64_t v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[CPLEngineSyncTask session](self, "session");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "shouldDefer");

  if (v4)
  {
    +[CPLErrors sessionHasBeenDeferredError](CPLErrors, "sessionHasBeenDeferredError");
    v5 = objc_claimAutoreleasedReturnValue();
LABEL_5:
    -[CPLUploadComputeStatesScopeTask _uploadComputeStatesTaskDidFinishWithError:](self, "_uploadComputeStatesTaskDidFinishWithError:", v5, v5);

    return;
  }
  if (-[CPLEngineSyncTask isCancelled](self, "isCancelled"))
  {
    +[CPLErrors operationCancelledError](CPLErrors, "operationCancelledError");
    v5 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  -[CPLUploadComputeStatesAccumulator popNextBatchOfLocalComputeStatesNeedingPayload](self->_computeStatesAccumulator, "popNextBatchOfLocalComputeStatesNeedingPayload");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB38A8], "progressWithTotalUnitCount:", 1);
    v7 = (NSProgress *)objc_claimAutoreleasedReturnValue();
    requestMissingPayloadsProgress = self->_requestMissingPayloadsProgress;
    self->_requestMissingPayloadsProgress = v7;

    v32[0] = 0;
    v32[1] = v32;
    v32[2] = 0x2020000000;
    v33 = 0;
    v9 = self->_requestMissingPayloadsProgress;
    -[CPLEngineSyncTask session](self, "session");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __58__CPLUploadComputeStatesScopeTask__requestMissingPayloads__block_invoke;
    v29[3] = &unk_1E60D79D8;
    v29[4] = self;
    v11 = v9;
    v30 = v11;
    v31 = v32;
    objc_msgSend(v10, "addDeferHandler:", v29);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    -[CPLEngineSyncTask engineLibrary](self, "engineLibrary");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "store");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "recordComputeStatePushQueue");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = 0;
    objc_msgSend(v15, "createTempUploadFolderWithError:", &v28);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v28;

    if (v16)
    {
      if (!_CPLSilentLogging)
      {
        __CPLTaskOSLogDomain_1243();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          v19 = objc_msgSend(v6, "count");
          *(_DWORD *)buf = 134217984;
          v35 = v19;
          _os_log_impl(&dword_1B03C2000, v18, OS_LOG_TYPE_DEFAULT, "Requesting %lu payloads to client", buf, 0xCu);
        }

      }
      v20 = self->_requestMissingPayloadsProgress;
      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __58__CPLUploadComputeStatesScopeTask__requestMissingPayloads__block_invoke_20;
      v23[3] = &unk_1E60D7A28;
      v23[4] = self;
      v24 = v6;
      v25 = v16;
      v26 = v12;
      v27 = v32;
      -[NSProgress performAsCurrentWithPendingUnitCount:usingBlock:](v20, "performAsCurrentWithPendingUnitCount:usingBlock:", 1, v23);

    }
    else
    {
      if (!_CPLSilentLogging)
      {
        __CPLTaskOSLogDomain_1243();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v35 = (uint64_t)v17;
          _os_log_impl(&dword_1B03C2000, v21, OS_LOG_TYPE_ERROR, "Failed to create temp folder to get compute state payloads: %@", buf, 0xCu);
        }

      }
      -[CPLUploadComputeStatesScopeTask _uploadComputeStatesTaskDidFinishWithError:](self, "_uploadComputeStatesTaskDidFinishWithError:", v17);
    }

    _Block_object_dispose(v32, 8);
  }
  else
  {
    -[CPLUploadComputeStatesScopeTask _uploadExtractedBatch](self, "_uploadExtractedBatch");
  }

}

- (void)_getNextBatchAndUpload
{
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  _QWORD v9[5];
  _QWORD v10[5];
  id v11;
  id v12;
  SEL v13;

  -[CPLEngineScopedTask store](self, "store");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPLEngineScopedTask scope](self, "scope");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __57__CPLUploadComputeStatesScopeTask__getNextBatchAndUpload__block_invoke;
  v10[3] = &unk_1E60DD7E8;
  v10[4] = self;
  v11 = v4;
  v12 = v5;
  v13 = a2;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __57__CPLUploadComputeStatesScopeTask__getNextBatchAndUpload__block_invoke_3;
  v9[3] = &unk_1E60DD838;
  v9[4] = self;
  v6 = v5;
  v7 = v4;
  v8 = (id)objc_msgSend(v7, "performWriteTransactionWithBlock:completionHandler:", v10, v9);

}

- (void)_discardExtractedBatchAndGetNextBatch
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  _QWORD v7[5];
  _QWORD v8[5];
  id v9;

  -[CPLEngineScopedTask store](self, "store");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "recordComputeStatePushQueue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[4] = self;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __72__CPLUploadComputeStatesScopeTask__discardExtractedBatchAndGetNextBatch__block_invoke;
  v8[3] = &unk_1E60DD810;
  v8[4] = self;
  v9 = v4;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __72__CPLUploadComputeStatesScopeTask__discardExtractedBatchAndGetNextBatch__block_invoke_3;
  v7[3] = &unk_1E60DD838;
  v5 = v4;
  v6 = (id)objc_msgSend(v3, "performWriteTransactionWithBlock:completionHandler:", v8, v7);

}

- (void)_dropAllComputeStates
{
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  id v7;
  id v8;
  _QWORD v9[5];
  id v10;
  _QWORD *v11;
  _QWORD v12[5];
  id v13;
  id v14;
  _QWORD *v15;
  _QWORD v16[4];

  -[CPLEngineScopedTask store](self, "store");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPLEngineScopedTask scope](self, "scope");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x2020000000;
  v5 = MEMORY[0x1E0C809B0];
  v16[3] = 0;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __56__CPLUploadComputeStatesScopeTask__dropAllComputeStates__block_invoke;
  v12[3] = &unk_1E60D7B18;
  v12[4] = self;
  v6 = v3;
  v13 = v6;
  v14 = v4;
  v15 = v16;
  v9[0] = v5;
  v9[1] = 3221225472;
  v9[2] = __56__CPLUploadComputeStatesScopeTask__dropAllComputeStates__block_invoke_2;
  v9[3] = &unk_1E60DD280;
  v9[4] = self;
  v11 = v16;
  v7 = v14;
  v10 = v7;
  v8 = (id)objc_msgSend(v6, "performWriteTransactionWithBlock:completionHandler:", v12, v9);

  _Block_object_dispose(v16, 8);
}

- (void)launch
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  _QWORD v9[5];
  id v10;
  id v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CPLUploadComputeStatesScopeTask;
  -[CPLEngineSyncTask launch](&v12, sel_launch);
  -[CPLEngineScopedTask store](self, "store");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "scopes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPLEngineScopedTask scope](self, "scope");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __41__CPLUploadComputeStatesScopeTask_launch__block_invoke;
  v9[3] = &unk_1E60DD2A8;
  v9[4] = self;
  v10 = v4;
  v11 = v5;
  v6 = v5;
  v7 = v4;
  v8 = (id)objc_msgSend(v3, "performReadTransactionWithBlock:", v9);

}

- (void)cancel
{
  OS_dispatch_queue *queue;
  uint64_t v4;
  _QWORD *v5;
  NSObject *v6;
  dispatch_block_t v7;
  _QWORD v8[5];
  objc_super v9;
  _QWORD block[4];
  id v11;

  v9.receiver = self;
  v9.super_class = (Class)CPLUploadComputeStatesScopeTask;
  -[CPLEngineSyncTask cancel](&v9, sel_cancel);
  queue = self->_queue;
  v4 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __41__CPLUploadComputeStatesScopeTask_cancel__block_invoke;
  v8[3] = &unk_1E60D65B8;
  v8[4] = self;
  v5 = v8;
  block[0] = v4;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_1267;
  block[3] = &unk_1E60D71F8;
  v11 = v5;
  v6 = queue;
  v7 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v6, v7);

}

- (void)_uploadComputeStatesTaskDidFinishWithError:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[6];
  _QWORD v18[4];
  id v19;
  CPLUploadComputeStatesScopeTask *v20;
  id v21;
  id v22;
  SEL v23;
  __int128 buf;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!_CPLSilentLogging)
  {
    __CPLTaskOSLogDomain_1243();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v5;
      _os_log_impl(&dword_1B03C2000, v6, OS_LOG_TYPE_DEBUG, "Upload finished (error: %@)", (uint8_t *)&buf, 0xCu);
    }

  }
  -[CPLEngineSyncTask engineLibrary](self, "engineLibrary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "store");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "scopes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPLEngineScopedTask scope](self, "scope");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__1245;
  v27 = __Block_byref_object_dispose__1246;
  v11 = v5;
  v28 = v11;
  v12 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __78__CPLUploadComputeStatesScopeTask__uploadComputeStatesTaskDidFinishWithError___block_invoke;
  v18[3] = &unk_1E60D8B60;
  v13 = v8;
  v19 = v13;
  v20 = self;
  v23 = a2;
  v14 = v10;
  v21 = v14;
  v15 = v9;
  v22 = v15;
  v17[0] = v12;
  v17[1] = 3221225472;
  v17[2] = __78__CPLUploadComputeStatesScopeTask__uploadComputeStatesTaskDidFinishWithError___block_invoke_2_46;
  v17[3] = &unk_1E60DDB58;
  v17[4] = self;
  v17[5] = &buf;
  v16 = (id)objc_msgSend(v13, "performWriteTransactionWithBlock:completionHandler:", v18, v17);

  _Block_object_dispose(&buf, 8);
}

- (void)_updateComputeSyncUploadMetricsWithError:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CPLEngineSyncTask engineLibrary](self, "engineLibrary");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updateComputeSyncMetrics:silentDecryptionFailed:error:", 0, 0, v4);

}

- (void)taskDidFinishWithError:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v4 = a3;
  if (self->_didUploadSomeComputeStates)
  {
    -[CPLEngineSyncTask session](self, "session");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "requestSyncStateAtEndOfSyncSession:reschedule:", 4, v4 == 0);

  }
  v6.receiver = self;
  v6.super_class = (Class)CPLUploadComputeStatesScopeTask;
  -[CPLEngineSyncTask taskDidFinishWithError:](&v6, sel_taskDidFinishWithError_, v4);

}

- (id)taskIdentifier
{
  return CFSTR("engine.sync.uploadcomputestates");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharedScope, 0);
  objc_storeStrong((id *)&self->_knownRecords, 0);
  objc_storeStrong((id *)&self->_computeStatesAccumulator, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_requestMissingPayloadsProgress, 0);
  objc_storeStrong((id *)&self->_transportGroup, 0);
  objc_storeStrong((id *)&self->_uploadComputeStatesTask, 0);
  objc_storeStrong((id *)&self->_transportScopeMapping, 0);
  objc_storeStrong((id *)&self->_targetMapping, 0);
}

void __78__CPLUploadComputeStatesScopeTask__uploadComputeStatesTaskDidFinishWithError___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  void *v7;
  char v8;
  id v9;
  uint64_t v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  uint64_t v15;
  _QWORD v16[5];
  id v17;
  uint64_t v18;

  v11 = a2;
  objc_msgSend(*(id *)(a1 + 32), "recordComputeStatePushQueue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __78__CPLUploadComputeStatesScopeTask__uploadComputeStatesTaskDidFinishWithError___block_invoke_2;
  v16[3] = &unk_1E60D7B68;
  v16[4] = *(_QWORD *)(a1 + 40);
  v5 = v3;
  v6 = *(_QWORD *)(a1 + 64);
  v17 = v5;
  v18 = v6;
  objc_msgSend(v11, "do:", v16);
  if (objc_msgSend(*(id *)(a1 + 40), "isScopeValidInTransaction:", v11))
  {
    objc_msgSend(*(id *)(a1 + 48), "scopeIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v5, "hasChangesInScopeWithIdentifier:", v7);

    if ((v8 & 1) == 0 && *(_QWORD *)(*(_QWORD *)(a1 + 40) + 184) != -1)
    {
      v12[0] = v4;
      v12[1] = 3221225472;
      v12[2] = __78__CPLUploadComputeStatesScopeTask__uploadComputeStatesTaskDidFinishWithError___block_invoke_45;
      v12[3] = &unk_1E60DD160;
      v13 = *(id *)(a1 + 56);
      v9 = *(id *)(a1 + 48);
      v10 = *(_QWORD *)(a1 + 40);
      v14 = v9;
      v15 = v10;
      objc_msgSend(v11, "do:", v12);

    }
  }

}

void __78__CPLUploadComputeStatesScopeTask__uploadComputeStatesTaskDidFinishWithError___block_invoke_2_46(uint64_t a1, void *a2)
{
  id v3;
  _QWORD *v4;
  void *v5;
  _QWORD *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  uint8_t buf[4];
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_deleteTempFolderForPayloads");
  v4 = *(_QWORD **)(a1 + 32);
  if (v4[25])
  {
    objc_msgSend(v4, "session");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD **)(a1 + 32);
    v7 = v6[25];
    objc_msgSend(v6, "scope");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "scopeIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "noteSyncSessionInformation:", CFSTR("%lu compute states for %@ have been dropped"), v7, v9);

    v4 = *(_QWORD **)(a1 + 32);
  }
  if (v4[24])
  {
    objc_msgSend(v4, "session");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD **)(a1 + 32);
    v12 = v11[24];
    objc_msgSend(v11, "scope");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "scopeIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "noteSyncSessionInformation:", CFSTR("%lu compute states for %@ have been put aside"), v12, v14);

    v4 = *(_QWORD **)(a1 + 32);
  }
  if (v4[26])
  {
    objc_msgSend(v4, "session");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = *(_QWORD **)(a1 + 32);
    v17 = v16[26];
    objc_msgSend(v16, "scope");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "scopeIdentifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "noteSyncSessionInformation:", CFSTR("%lu compute state payloads for %@ has been requested and %lu have been provided"), v17, v19, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 216));

  }
  v20 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  if (!v20)
  {
    objc_msgSend(v3, "error");
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    if (v29)
    {
      v30 = *(void **)(a1 + 32);
      objc_msgSend(v3, "error");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "taskDidFinishWithError:", v31);

      goto LABEL_18;
    }
    v20 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  }
  if (objc_msgSend(v20, "isCPLThrottlingError"))
  {
    if (!_CPLSilentLogging)
    {
      __CPLTaskOSLogDomain_1243();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(*(id *)(a1 + 32), "scope");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "scopeIdentifier");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v33 = v23;
        _os_log_impl(&dword_1B03C2000, v21, OS_LOG_TYPE_DEFAULT, "Uploading compute states for %{public}@ has been throttled, we will likely need to retry that", buf, 0xCu);

      }
    }
    objc_msgSend(*(id *)(a1 + 32), "session");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "scope");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "scopeIdentifier");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "noteSyncSessionInformation:", CFSTR("Uploading compute states for %@ has been throttled"), v26);

    v27 = *(void **)(a1 + 32);
    v28 = 0;
  }
  else
  {
    v27 = *(void **)(a1 + 32);
    v28 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  }
  objc_msgSend(v27, "taskDidFinishWithError:", v28);
LABEL_18:

}

BOOL __78__CPLUploadComputeStatesScopeTask__uploadComputeStatesTaskDidFinishWithError___block_invoke_2(_QWORD *a1, _QWORD *a2)
{
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  _BOOL8 v10;
  _QWORD v12[4];
  id v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  char v27;

  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v27 = 1;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__1245;
  v22 = __Block_byref_object_dispose__1246;
  v23 = 0;
  v4 = (void *)a1[5];
  v5 = *(void **)(a1[4] + 152);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[2] = __78__CPLUploadComputeStatesScopeTask__uploadComputeStatesTaskDidFinishWithError___block_invoke_3;
  v12[3] = &unk_1E60D7B40;
  v12[1] = 3221225472;
  v15 = &v24;
  v6 = v4;
  v7 = a1[6];
  v16 = &v18;
  v17 = v7;
  v8 = a1[4];
  v13 = v6;
  v14 = v8;
  objc_msgSend(v5, "enumerateUploadedComputeStateWithBlock:", v12);
  v9 = *((unsigned __int8 *)v25 + 24);
  if (a2 && !*((_BYTE *)v25 + 24))
  {
    *a2 = objc_retainAutorelease((id)v19[5]);
    v9 = *((unsigned __int8 *)v25 + 24);
  }
  v10 = v9 != 0;

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v24, 8);
  return v10;
}

uint64_t __78__CPLUploadComputeStatesScopeTask__uploadComputeStatesTaskDidFinishWithError___block_invoke_45(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "setScope:hasCompletedUploadComputeStateTask:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 48) + 184), a2);
}

void __78__CPLUploadComputeStatesScopeTask__uploadComputeStatesTaskDidFinishWithError___block_invoke_3(_QWORD *a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  int v13;
  BOOL v14;
  NSObject *v15;
  uint64_t v16;
  const char *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  char v21;
  BOOL v22;
  uint64_t v23;
  NSObject *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  id v29;
  id obj;
  uint8_t buf[4];
  id v32;
  __int16 v33;
  uint64_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  objc_msgSend(v8, "fileStorageIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = (void *)a1[4];
    objc_msgSend(v8, "fileURL");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = *(_QWORD *)(a1[7] + 8);
    obj = *(id *)(v12 + 40);
    LOBYTE(v10) = objc_msgSend(v10, "releaseFileURL:forComputeState:error:", v11, v8, &obj);
    objc_storeStrong((id *)(v12 + 40), obj);
    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = (_BYTE)v10;

    v13 = *(unsigned __int8 *)(*(_QWORD *)(a1[6] + 8) + 24);
    if (*(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24))
      v14 = 0;
    else
      v14 = _CPLSilentLogging == 0;
    if (!v14)
      goto LABEL_19;
    __CPLTaskOSLogDomain_1243();
    v15 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      goto LABEL_18;
    v16 = *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40);
    *(_DWORD *)buf = 138412546;
    v32 = v7;
    v33 = 2112;
    v34 = v16;
    v17 = "Failed to release file for %@: %@";
    goto LABEL_17;
  }
  objc_msgSend(v7, "fileURL");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v18)
  {
    if (!_CPLSilentLogging)
    {
      __CPLTaskOSLogDomain_1243();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B03C2000, v24, OS_LOG_TYPE_ERROR, "Compute state with updated payload should have a file URL", buf, 2u);
      }

    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = a1[8];
    v27 = a1[5];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/Upload Compute State Phase/CPLUploadComputeStatesTask.m");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", v26, v27, v28, 626, CFSTR("Compute state with updated payload should have a file URL"));

    abort();
  }
  v19 = (void *)a1[4];
  v20 = *(_QWORD *)(a1[7] + 8);
  v29 = *(id *)(v20 + 40);
  v21 = objc_msgSend(v19, "updateFileURLForComputeState:error:", v7, &v29);
  objc_storeStrong((id *)(v20 + 40), v29);
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = v21;
  v13 = *(unsigned __int8 *)(*(_QWORD *)(a1[6] + 8) + 24);
  if (*(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24))
    v22 = 0;
  else
    v22 = _CPLSilentLogging == 0;
  if (v22)
  {
    __CPLTaskOSLogDomain_1243();
    v15 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
LABEL_18:

      v13 = *(unsigned __int8 *)(*(_QWORD *)(a1[6] + 8) + 24);
      goto LABEL_19;
    }
    v23 = *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40);
    *(_DWORD *)buf = 138412546;
    v32 = v7;
    v33 = 2112;
    v34 = v23;
    v17 = "Failed to update file for %@: %@";
LABEL_17:
    _os_log_impl(&dword_1B03C2000, v15, OS_LOG_TYPE_ERROR, v17, buf, 0x16u);
    goto LABEL_18;
  }
LABEL_19:
  if (!v13)
    *a4 = 1;

}

uint64_t __41__CPLUploadComputeStatesScopeTask_cancel__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "cancel");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 136), "cancel");
}

void __41__CPLUploadComputeStatesScopeTask_launch__block_invoke(id *a1, uint64_t a2)
{
  char v3;
  id v4;
  void *v5;
  id v6;
  id v7;
  char v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  NSObject *v14;
  id v15;
  NSObject *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  uint8_t buf[4];
  id v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v3 = objc_msgSend(a1[4], "isScopeValidInTransaction:", a2);
  v4 = a1[4];
  if ((v3 & 1) == 0)
  {
    +[CPLErrors operationCancelledError](CPLErrors, "operationCancelledError");
    v25 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_uploadComputeStatesTaskDidFinishWithError:");

    return;
  }
  objc_msgSend(a1[4], "session");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "isComputeStateTaskUploadEnabled"))
  {

    v9 = 0;
    goto LABEL_12;
  }
  v6 = a1[5];
  v7 = a1[6];
  v26 = 0;
  v8 = objc_msgSend(v6, "shouldDropAllUploadsForScope:dropReason:shouldQuarantineRecords:", v7, &v26, 0);
  v9 = v26;

  if ((v8 & 1) != 0)
  {
LABEL_12:
    if (!_CPLSilentLogging)
    {
      __CPLTaskOSLogDomain_1243();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        v17 = a1[6];
        *(_DWORD *)buf = 138412546;
        v28 = v17;
        v29 = 2112;
        v30 = v9;
        _os_log_impl(&dword_1B03C2000, v16, OS_LOG_TYPE_DEFAULT, "We must drop all compute states for %@: %@", buf, 0x16u);
      }

    }
    *((_QWORD *)a1[4] + 23) = objc_msgSend(a1[5], "uploadComputeStateTaskForScope:", a1[6]);
    objc_msgSend(a1[4], "_dropAllComputeStates");
    goto LABEL_17;
  }
  objc_msgSend(a1[4], "session");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "scopeIdentifiersExcludedFromPushToTransport");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[6], "scopeIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v11, "containsObject:", v12);

  if (v13)
  {
    if (!_CPLSilentLogging)
    {
      __CPLTaskOSLogDomain_1243();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v15 = a1[6];
        *(_DWORD *)buf = 138412290;
        v28 = v15;
        _os_log_impl(&dword_1B03C2000, v14, OS_LOG_TYPE_DEFAULT, "%@ is temporarily excluded from pushing to transport - won't upload any compute states for this scope", buf, 0xCu);
      }

    }
    objc_msgSend(a1[4], "_uploadComputeStatesTaskDidFinishWithError:", 0);
  }
  else
  {
    objc_msgSend(a1[5], "sharingScopeForScope:", a1[6]);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      objc_msgSend(a1[5], "transportScopeForScope:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (v19)
      {
        v20 = (void *)*((_QWORD *)a1[4] + 14);
        objc_msgSend(v18, "scopeIdentifier");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "setObject:forKeyedSubscript:", v19, v21);

        v22 = (void *)*((_QWORD *)a1[4] + 14);
        objc_msgSend(v18, "scopeIdentifier");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1[6], "scopeIdentifier");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "setSharedScopeIdentifier:forScopeWithIdentifier:", v23, v24);

      }
      objc_storeStrong((id *)a1[4] + 21, v18);

    }
    *((_QWORD *)a1[4] + 23) = objc_msgSend(a1[5], "uploadComputeStateTaskForScope:", a1[6]);
    objc_msgSend(a1[4], "_getNextBatchAndUpload");

  }
LABEL_17:

}

void __56__CPLUploadComputeStatesScopeTask__dropAllComputeStates__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  int v7;
  NSObject *v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD v13[4];
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint8_t buf[4];
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "isScopeValidInTransaction:", v3)
    && !objc_msgSend(*(id *)(a1 + 32), "isCancelled"))
  {
    objc_msgSend(*(id *)(a1 + 32), "session");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "shouldDefer");

    if (!v7)
    {
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __56__CPLUploadComputeStatesScopeTask__dropAllComputeStates__block_invoke_38;
      v13[3] = &unk_1E60DD918;
      v14 = *(id *)(a1 + 40);
      v10 = *(id *)(a1 + 48);
      v11 = *(_QWORD *)(a1 + 56);
      v12 = *(_QWORD *)(a1 + 32);
      v15 = v10;
      v16 = v12;
      v17 = v11;
      objc_msgSend(v3, "do:", v13);

      goto LABEL_5;
    }
    if (!_CPLSilentLogging)
    {
      __CPLTaskOSLogDomain_1243();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v19 = (id)objc_opt_class();
        v9 = v19;
        _os_log_impl(&dword_1B03C2000, v8, OS_LOG_TYPE_DEFAULT, "Session has been deferred. Stopping %@ now", buf, 0xCu);

      }
    }
    +[CPLErrors sessionHasBeenDeferredError](CPLErrors, "sessionHasBeenDeferredError");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[CPLErrors operationCancelledError](CPLErrors, "operationCancelledError");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  v5 = (void *)v4;
  objc_msgSend(v3, "setError:", v4);

LABEL_5:
}

void __56__CPLUploadComputeStatesScopeTask__dropAllComputeStates__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "error");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = *(void **)(a1 + 32);
    objc_msgSend(v3, "error");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_uploadComputeStatesTaskDidFinishWithError:", v6);

  }
  else if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    if (!_CPLSilentLogging)
    {
      __CPLTaskOSLogDomain_1243();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v8 = *(_QWORD *)(a1 + 40);
        v9 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
        v10 = 134218242;
        v11 = v9;
        v12 = 2112;
        v13 = v8;
        _os_log_impl(&dword_1B03C2000, v7, OS_LOG_TYPE_DEFAULT, "Dropped %ld compute states for %@", (uint8_t *)&v10, 0x16u);
      }

    }
    objc_msgSend(*(id *)(a1 + 32), "_dropAllComputeStates");
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_uploadComputeStatesTaskDidFinishWithError:", 0);
  }

}

uint64_t __56__CPLUploadComputeStatesScopeTask__dropAllComputeStates__block_invoke_38(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;
  void *v6;

  objc_msgSend(*(id *)(a1 + 32), "recordComputeStatePushQueue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "deleteRecordsForScopeIndex:maxCount:deletedCount:error:", objc_msgSend(*(id *)(a1 + 40), "localIndex"), 1000, *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24, a2))
  {
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24)
      || *(_QWORD *)(*(_QWORD *)(a1 + 48) + 184) == -1)
    {
      v5 = 1;
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "scopes");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v6, "setScope:hasCompletedUploadComputeStateTask:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 48) + 184), a2);

    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

void __72__CPLUploadComputeStatesScopeTask__discardExtractedBatchAndGetNextBatch__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  _QWORD v9[5];
  id v10;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  if ((objc_msgSend(v3, "isScopeValidInTransaction:", v4) & 1) != 0)
  {
    v5 = MEMORY[0x1E0C809B0];
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __72__CPLUploadComputeStatesScopeTask__discardExtractedBatchAndGetNextBatch__block_invoke_2;
    v9[3] = &unk_1E60DDA30;
    v6 = *(void **)(a1 + 40);
    v9[4] = *(_QWORD *)(a1 + 32);
    v10 = v6;
    objc_msgSend(v4, "do:", v9);
    v8[0] = v5;
    v8[1] = 3221225472;
    v8[2] = __72__CPLUploadComputeStatesScopeTask__discardExtractedBatchAndGetNextBatch__block_invoke_2_37;
    v8[3] = &unk_1E60DDB80;
    v8[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v4, "addCleanupBlock:", v8);

  }
  else
  {
    +[CPLErrors operationCancelledError](CPLErrors, "operationCancelledError");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setError:", v7);

  }
}

void __72__CPLUploadComputeStatesScopeTask__discardExtractedBatchAndGetNextBatch__block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_deleteTempFolderForPayloads");
  objc_msgSend(v9, "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = *(void **)(a1 + 32);
  if (v3)
  {
    objc_msgSend(v9, "error");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_uploadComputeStatesTaskDidFinishWithError:", v5);

  }
  else
  {
    v6 = objc_msgSend(*(id *)(a1 + 32), "isCancelled");
    v7 = *(void **)(a1 + 32);
    if (v6)
    {
      +[CPLErrors operationCancelledError](CPLErrors, "operationCancelledError");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "_uploadComputeStatesTaskDidFinishWithError:", v8);

    }
    else
    {
      objc_msgSend(v7, "_getNextBatchAndUpload");
    }
  }

}

BOOL __72__CPLUploadComputeStatesScopeTask__discardExtractedBatchAndGetNextBatch__block_invoke_2(uint64_t a1, _QWORD *a2)
{
  void *v3;
  void *v4;
  int v5;
  _BOOL8 v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;

  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 1;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__1245;
  v16 = __Block_byref_object_dispose__1246;
  v17 = 0;
  v3 = *(void **)(a1 + 40);
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 152);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __72__CPLUploadComputeStatesScopeTask__discardExtractedBatchAndGetNextBatch__block_invoke_35;
  v8[3] = &unk_1E60D7AF0;
  v10 = &v18;
  v9 = v3;
  v11 = &v12;
  objc_msgSend(v4, "enumerateUploadedComputeStateWithBlock:", v8);
  v5 = *((unsigned __int8 *)v19 + 24);
  if (a2 && !*((_BYTE *)v19 + 24))
  {
    *a2 = objc_retainAutorelease((id)v13[5]);
    v5 = *((unsigned __int8 *)v19 + 24);
  }
  v6 = v5 != 0;

  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v18, 8);
  return v6;
}

void __72__CPLUploadComputeStatesScopeTask__discardExtractedBatchAndGetNextBatch__block_invoke_2_37(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;

  if (!a2)
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 152);
    *(_QWORD *)(v3 + 152) = 0;

    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 160);
    *(_QWORD *)(v5 + 160) = 0;

  }
}

void __72__CPLUploadComputeStatesScopeTask__discardExtractedBatchAndGetNextBatch__block_invoke_35(_QWORD *a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  char v15;
  id v16;
  id obj;

  v7 = a2;
  v8 = a3;
  objc_msgSend(v8, "fileStorageIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = (void *)a1[4];
    objc_msgSend(v8, "fileURL");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = *(_QWORD *)(a1[6] + 8);
    obj = *(id *)(v12 + 40);
    LOBYTE(v10) = objc_msgSend(v10, "releaseFileURL:forComputeState:error:", v11, v8, &obj);
    objc_storeStrong((id *)(v12 + 40), obj);
    *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = (_BYTE)v10;

  }
  if (!*(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24)
    || (v13 = (void *)a1[4],
        v14 = *(_QWORD *)(a1[6] + 8),
        v16 = *(id *)(v14 + 40),
        v15 = objc_msgSend(v13, "removeComputeState:error:", v7, &v16),
        objc_storeStrong((id *)(v14 + 40), v16),
        (*(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = v15) == 0))
  {
    *a4 = 1;
  }

}

void __57__CPLUploadComputeStatesScopeTask__getNextBatchAndUpload__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  NSObject *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  id v30;
  _QWORD v31[4];
  id v32;
  id v33;
  uint64_t v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  _QWORD v42[4];
  id v43;
  id v44;
  uint64_t v45;
  id v46;
  id v47;
  id v48;
  uint8_t buf[16];

  v30 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "checkScopeIsValidInTransaction:"))
  {
    if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 152))
    {
      if (!_CPLSilentLogging)
      {
        __CPLTaskOSLogDomain_1243();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1B03C2000, v25, OS_LOG_TYPE_ERROR, "There should not be any compute states dequeued here", buf, 2u);
        }

      }
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = *(_QWORD *)(a1 + 56);
      v28 = *(_QWORD *)(a1 + 32);
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/Upload Compute State Phase/CPLUploadComputeStatesTask.m");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", v27, v28, v29, 278, CFSTR("There should not be any compute states dequeued here"));

      abort();
    }
    objc_msgSend(*(id *)(a1 + 40), "recordComputeStatePushQueue");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "idMapping");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "cloudCache");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "transactionClientCacheView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "transientPullRepository");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "ignoredRecords");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = MEMORY[0x1E0C809B0];
    v42[0] = MEMORY[0x1E0C809B0];
    v42[1] = 3221225472;
    v42[2] = __57__CPLUploadComputeStatesScopeTask__getNextBatchAndUpload__block_invoke_27;
    v42[3] = &unk_1E60D7A50;
    v10 = v3;
    v43 = v10;
    v11 = *(id *)(a1 + 48);
    v12 = *(_QWORD *)(a1 + 32);
    v44 = v11;
    v45 = v12;
    v13 = v6;
    v46 = v13;
    v14 = v4;
    v47 = v14;
    v15 = v5;
    v48 = v15;
    objc_msgSend(v30, "do:", v42);
    v31[0] = v9;
    v31[1] = 3221225472;
    v31[2] = __57__CPLUploadComputeStatesScopeTask__getNextBatchAndUpload__block_invoke_28;
    v31[3] = &unk_1E60D7AC8;
    v32 = v10;
    v16 = *(id *)(a1 + 48);
    v17 = *(_QWORD *)(a1 + 32);
    v18 = *(void **)(a1 + 40);
    v33 = v16;
    v34 = v17;
    v35 = v13;
    v36 = v14;
    v37 = v7;
    v38 = v8;
    v39 = v15;
    v40 = v18;
    v41 = v30;
    v19 = v15;
    v20 = v8;
    v21 = v7;
    v22 = v14;
    v23 = v13;
    v24 = v10;
    objc_msgSend(v41, "do:", v31);

  }
}

void __57__CPLUploadComputeStatesScopeTask__getNextBatchAndUpload__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  _QWORD *v7;
  NSObject *v8;
  id v9;
  dispatch_block_t v10;
  _QWORD v11[5];
  id v12;
  _QWORD block[4];
  id v14;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 144);
  v6 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __57__CPLUploadComputeStatesScopeTask__getNextBatchAndUpload__block_invoke_4;
  v11[3] = &unk_1E60D6F88;
  v11[4] = v4;
  v12 = v3;
  v7 = v11;
  block[0] = v6;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_1267;
  block[3] = &unk_1E60D71F8;
  v14 = v7;
  v8 = v5;
  v9 = v3;
  v10 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v8, v10);

}

void __57__CPLUploadComputeStatesScopeTask__getNextBatchAndUpload__block_invoke_4(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD *v5;
  void *v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "engineLibrary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scheduler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "willRunEngineElement:", CPLEngineElementUploadComputeStates);

  objc_msgSend(*(id *)(a1 + 40), "error");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = *(_QWORD **)(a1 + 32);
  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 40), "error");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_uploadComputeStatesTaskDidFinishWithError:", v7);

  }
  else
  {
    v6 = *(void **)(a1 + 32);
    if (v5[19])
      objc_msgSend(v6, "_requestMissingPayloads");
    else
      objc_msgSend(v6, "_uploadComputeStatesTaskDidFinishWithError:", 0);
  }
}

uint64_t __57__CPLUploadComputeStatesScopeTask__getNextBatchAndUpload__block_invoke_27(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  __objc2_meth_list **p_class_meths;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  __objc2_meth_list **v23;
  void *v24;
  void *v25;
  int v26;
  id v27;
  __int128 v29;
  id v30;
  id v31;
  char v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint8_t buf[4];
  void *v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "scopeIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "session");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 1;
  objc_msgSend(v2, "computeStatesToUploadWithScopeIdentifier:localState:maximumCount:", v3, 1, objc_msgSend(v4, "maximumComputeStatesToUploadPerBatch"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
  if (v8)
  {
    v10 = v8;
    v11 = 0;
    v12 = *(_QWORD *)v34;
    p_class_meths = &OBJC_PROTOCOL___CPLNetworkWatcherDelegate.class_meths;
    *(_QWORD *)&v9 = 138412290;
    v29 = v9;
    v30 = v7;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v34 != v12)
          objc_enumerationMutation(v7);
        v15 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
        v16 = *(void **)(a1 + 56);
        objc_msgSend(v15, "itemScopedIdentifier", v29);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v16) = objc_msgSend(v16, "hasRecordWithScopedIdentifier:", v17);

        if ((_DWORD)v16)
        {
          v32 = 0;
          v18 = *(void **)(a1 + 64);
          objc_msgSend(v15, "itemScopedIdentifier");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "cloudScopedIdentifierForLocalScopedIdentifier:isFinal:", v19, &v32);
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          if (v20 && objc_msgSend(*(id *)(a1 + 72), "hasRecordWithScopedIdentifier:", v20))
          {
            if (!*((_BYTE *)p_class_meths + 3376))
            {
              __CPLTaskOSLogDomain_1243();
              v21 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
              {
                objc_msgSend(v15, "itemScopedIdentifier");
                v22 = v11;
                v23 = p_class_meths;
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = v29;
                v38 = v24;
                _os_log_impl(&dword_1B03C2000, v21, OS_LOG_TYPE_DEFAULT, "Setting compute state for %@ back to pending as the record is now in the cloud cache", buf, 0xCu);

                p_class_meths = v23;
                v11 = v22;
                v7 = v30;
              }

            }
            v25 = *(void **)(a1 + 32);
            v31 = v11;
            v26 = objc_msgSend(v25, "updateLocalStateForComputeState:newLocalState:error:", v15, 0, &v31);
            v27 = v31;

            if (!v26)
            {

              v5 = 0;
              goto LABEL_21;
            }
            v11 = v27;
          }

        }
      }
      v10 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
      if (v10)
        continue;
      break;
    }
    v5 = 1;
    v27 = v11;
  }
  else
  {
    v27 = 0;
  }
LABEL_21:

  return v5;
}

uint64_t __57__CPLUploadComputeStatesScopeTask__getNextBatchAndUpload__block_invoke_28(uint64_t a1, _QWORD *a2)
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  NSObject *v22;
  NSObject *v23;
  void *v24;
  char v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  CPLRecordComputeState *v30;
  void *v31;
  CPLRecordComputeState *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  CPLRecordComputeState *v38;
  uint64_t v39;
  uint64_t v40;
  NSObject *v41;
  void *v42;
  char v43;
  CPLRecordComputeState *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  BOOL v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  uint64_t v56;
  NSObject *v58;
  _QWORD *v59;
  NSObject *v60;
  NSObject *v61;
  _QWORD *v62;
  id v63;
  uint64_t v64;
  void *v65;
  NSObject *v66;
  CPLRecordTargetMapping *obj;
  uint64_t v68;
  id v69;
  CPLUploadComputeStatesAccumulator *v70;
  uint64_t v71;
  void *v72;
  uint64_t v73;
  uint64_t v74;
  unint64_t v75;
  _QWORD v76[7];
  _QWORD v77[5];
  CPLUploadComputeStatesAccumulator *v78;
  id v79;
  id v80;
  id v81;
  id v82;
  char v83;
  id v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  uint8_t buf[4];
  void *v90;
  __int16 v91;
  id v92;
  _BYTE v93[128];
  uint64_t v94;

  v94 = *MEMORY[0x1E0C80C00];
  v4 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "scopeIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = a1;
  objc_msgSend(*(id *)(a1 + 48), "session");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "computeStatesToUploadWithScopeIdentifier:localState:maximumCount:", v5, 0, objc_msgSend(v7, "maximumComputeStatesToUploadPerBatch"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v70 = -[CPLUploadComputeStatesAccumulator initWithCapacity:maximumPayloadRequestsBatchSize:]([CPLUploadComputeStatesAccumulator alloc], "initWithCapacity:maximumPayloadRequestsBatchSize:", objc_msgSend(v8, "count"), 50);
  v65 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v8, "count"));
  obj = objc_alloc_init(CPLRecordTargetMapping);
  v85 = 0u;
  v86 = 0u;
  v87 = 0u;
  v88 = 0u;
  v9 = v8;
  v74 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v85, v93, 16);
  if (v74)
  {
    v62 = a2;
    v10 = 0;
    v75 = 0;
    v11 = 0;
    v12 = 0;
    v73 = *(_QWORD *)v86;
    v13 = v6;
    v63 = v9;
LABEL_3:
    v68 = v11;
    v14 = 0;
    while (1)
    {
      if (*(_QWORD *)v86 != v73)
        objc_enumerationMutation(v9);
      if (v75 > 0xA00000)
      {
        v11 = v68;
        goto LABEL_42;
      }
      v15 = *(void **)(*((_QWORD *)&v85 + 1) + 8 * v14);
      objc_msgSend(v15, "itemScopedIdentifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(*(id *)(v13 + 56), "hasRecordWithScopedIdentifier:", v16) & 1) == 0)
      {
        if (!_CPLSilentLogging)
        {
          __CPLTaskOSLogDomain_1243();
          v23 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v90 = v16;
            _os_log_impl(&dword_1B03C2000, v23, OS_LOG_TYPE_DEFAULT, "Dropping compute state for %@ as the record is not known from the client cache view", buf, 0xCu);
          }

        }
        v24 = *(void **)(v13 + 32);
        v84 = v10;
        v25 = objc_msgSend(v24, "removeComputeState:error:", v15, &v84);
        v26 = v84;

        if ((v25 & 1) == 0)
        {
          if (_CPLSilentLogging)
          {
            v59 = v62;
          }
          else
          {
            __CPLTaskOSLogDomain_1243();
            v58 = objc_claimAutoreleasedReturnValue();
            v59 = v62;
            if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412546;
              v90 = v16;
              v91 = 2112;
              v92 = v26;
              _os_log_impl(&dword_1B03C2000, v58, OS_LOG_TYPE_ERROR, "Failed to remove compute state for %@: %@", buf, 0x16u);
            }

          }
          goto LABEL_62;
        }
        ++v12;
        v10 = v26;
        goto LABEL_37;
      }
      v83 = 0;
      objc_msgSend(*(id *)(v13 + 64), "cloudScopedIdentifierForLocalScopedIdentifier:isFinal:", v16, &v83);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v17;
      if (!v17)
        break;
      v72 = v16;
      v19 = *(void **)(v13 + 72);
      v20 = (void *)objc_msgSend(v17, "copy");
      objc_msgSend(v19, "changeWithScopedIdentifier:", v20);
      v21 = objc_claimAutoreleasedReturnValue();

      if (-[NSObject isDelete](v21, "isDelete"))
      {
        v16 = v72;
        if (!_CPLSilentLogging)
        {
          __CPLTaskOSLogDomain_1243();
          v22 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v90 = v18;
            _os_log_impl(&dword_1B03C2000, v22, OS_LOG_TYPE_DEFAULT, "%@ appears to have been deleted - will need to check directly with the cloud", buf, 0xCu);
          }

        }
        v21 = 0;
      }
      else
      {
        v16 = v72;
        if (!v21)
        {
          objc_msgSend(*(id *)(v13 + 80), "recordWithScopedIdentifier:", v18);
          v21 = objc_claimAutoreleasedReturnValue();
          if (!v21)
          {
            objc_msgSend(*(id *)(v13 + 88), "recordWithScopedIdentifier:isFinal:", v18, 1);
            v21 = objc_claimAutoreleasedReturnValue();
            if (!v21)
              break;
          }
        }
        objc_msgSend(v65, "setObject:forKeyedSubscript:", v21, v18);
      }
      objc_msgSend(v15, "fileStorageIdentifier");
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      v71 = v12;
      if (v27)
      {
        v66 = v21;
        v28 = v18;
        v29 = *(void **)(v13 + 32);
        v81 = v10;
        objc_msgSend(v29, "retainFileURLForComputeState:error:", v15, &v81);
        v30 = (CPLRecordComputeState *)objc_claimAutoreleasedReturnValue();
        v26 = v81;

        if (!v30)
        {
          if (_CPLSilentLogging)
          {
            v59 = v62;
          }
          else
          {
            __CPLTaskOSLogDomain_1243();
            v61 = objc_claimAutoreleasedReturnValue();
            v59 = v62;
            if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412546;
              v90 = v16;
              v91 = 2112;
              v92 = v26;
              _os_log_impl(&dword_1B03C2000, v61, OS_LOG_TYPE_ERROR, "Failed to find compute state payload for %@: %@", buf, 0x16u);
            }

          }
          goto LABEL_60;
        }
        v31 = *(void **)(v13 + 32);
        v80 = v26;
        v64 = objc_msgSend(v31, "fileSizeForComputeStatePayloadFileURL:error:", v30, &v80);
        v69 = v80;

        objc_msgSend(v15, "setFileURL:", v30);
        v32 = [CPLRecordComputeState alloc];
        objc_msgSend(v15, "fileStorageIdentifier");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "version");
        v34 = v13;
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "adjustmentFingerprint");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "lastUpdatedDate");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = -[CPLRecordComputeState initWithItemScopedIdentifier:fileStorageIdentifier:version:fileURL:adjustmentFingerprint:lastUpdatedDate:](v32, "initWithItemScopedIdentifier:fileStorageIdentifier:version:fileURL:adjustmentFingerprint:lastUpdatedDate:", v28, v33, v35, v30, v36, v37);

        v39 = v34;
        v40 = v64;

        v9 = v63;
        -[CPLUploadComputeStatesAccumulator addLocalComputeStateToUpload:cloudComputeState:](v70, "addLocalComputeStateToUpload:cloudComputeState:", v15, v38);

        v18 = v28;
        v21 = v66;
      }
      else
      {
        v69 = v10;
        v44 = [CPLRecordComputeState alloc];
        objc_msgSend(v15, "version");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "adjustmentFingerprint");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "lastUpdatedDate");
        v39 = v13;
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = -[CPLRecordComputeState initWithItemScopedIdentifier:version:fileURL:adjustmentFingerprint:lastUpdatedDate:](v44, "initWithItemScopedIdentifier:version:fileURL:adjustmentFingerprint:lastUpdatedDate:", v18, v45, 0, v46, v47);

        -[CPLUploadComputeStatesAccumulator requestPayloadForLocalComputeState:cloudComputeState:](v70, "requestPayloadForLocalComputeState:cloudComputeState:", v15, v30);
        v40 = 10240;
      }

      v75 += v40;
      objc_msgSend(*(id *)(v39 + 96), "cloudCache");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "targetForRecordWithCloudScopedIdentifier:", v18);
      v49 = (void *)objc_claimAutoreleasedReturnValue();

      -[CPLRecordTargetMapping setTarget:forRecordWithScopedIdentifier:](obj, "setTarget:forRecordWithScopedIdentifier:", v49, v18);
      v13 = v39;
      v12 = v71;
      v16 = v72;
      v10 = v69;
LABEL_36:

LABEL_37:
      if (v74 == ++v14)
      {
        v11 = v68;
        v74 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v85, v93, 16);
        if (v74)
          goto LABEL_3;
        goto LABEL_42;
      }
    }
    if (!_CPLSilentLogging)
    {
      __CPLTaskOSLogDomain_1243();
      v41 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v90 = v16;
        _os_log_impl(&dword_1B03C2000, v41, OS_LOG_TYPE_DEFAULT, "Putting compute state for %@ aside as the record is not in the cloud cache yet", buf, 0xCu);
      }

    }
    v28 = v18;
    v42 = *(void **)(v13 + 32);
    v82 = v10;
    v43 = objc_msgSend(v42, "updateLocalStateForComputeState:newLocalState:error:", v15, 1, &v82);
    v26 = v82;

    if ((v43 & 1) == 0)
    {
      if (_CPLSilentLogging)
      {
        v59 = v62;
      }
      else
      {
        __CPLTaskOSLogDomain_1243();
        v60 = objc_claimAutoreleasedReturnValue();
        v59 = v62;
        v66 = v60;
        if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          v90 = v16;
          v91 = 2112;
          v92 = v26;
          _os_log_impl(&dword_1B03C2000, v60, OS_LOG_TYPE_ERROR, "Failed to put compute state for %@ aside: %@", buf, 0x16u);
        }
LABEL_60:

      }
LABEL_62:

      if (v59)
      {
        v26 = objc_retainAutorelease(v26);
        v56 = 0;
        *v59 = v26;
      }
      else
      {
        v56 = 0;
      }
      goto LABEL_48;
    }
    ++v68;
    v10 = v26;
    v18 = v28;
    goto LABEL_36;
  }
  v12 = 0;
  v11 = 0;
  v10 = 0;
  v13 = v6;
LABEL_42:
  v26 = v10;

  v50 = -[CPLUploadComputeStatesAccumulator hasEnqueuedComputeStatesToUpload](v70, "hasEnqueuedComputeStatesToUpload");
  v51 = MEMORY[0x1E0C809B0];
  if (v50 || v12 || v11)
  {
    v54 = *(void **)(v13 + 104);
    v77[0] = MEMORY[0x1E0C809B0];
    v77[1] = 3221225472;
    v77[2] = __57__CPLUploadComputeStatesScopeTask__getNextBatchAndUpload__block_invoke_33;
    v77[3] = &unk_1E60D7A78;
    v77[4] = *(_QWORD *)(v13 + 48);
    v78 = v70;
    v79 = v65;
    objc_msgSend(v54, "addCleanupBlock:", v77);
    objc_storeStrong((id *)(*(_QWORD *)(v13 + 48) + 104), obj);

  }
  else
  {
    v52 = *(_QWORD *)(v13 + 48);
    v53 = *(void **)(v52 + 104);
    *(_QWORD *)(v52 + 104) = 0;

  }
  v55 = *(void **)(v13 + 104);
  v76[0] = v51;
  v76[1] = 3221225472;
  v76[2] = __57__CPLUploadComputeStatesScopeTask__getNextBatchAndUpload__block_invoke_2;
  v76[3] = &unk_1E60D7AA0;
  v76[4] = *(_QWORD *)(v13 + 48);
  v76[5] = v11;
  v76[6] = v12;
  objc_msgSend(v55, "addCleanupBlock:", v76);
  v56 = 1;
LABEL_48:

  return v56;
}

void __57__CPLUploadComputeStatesScopeTask__getNextBatchAndUpload__block_invoke_33(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  if (!a2)
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 152), *(id *)(a1 + 40));
    v3 = objc_msgSend(*(id *)(a1 + 48), "copy");
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 160);
    *(_QWORD *)(v4 + 160) = v3;

  }
}

_QWORD *__57__CPLUploadComputeStatesScopeTask__getNextBatchAndUpload__block_invoke_2(_QWORD *result, uint64_t a2)
{
  if (!a2)
  {
    *(_QWORD *)(result[4] + 192) += result[5];
    *(_QWORD *)(result[4] + 200) += result[6];
  }
  return result;
}

void __58__CPLUploadComputeStatesScopeTask__requestMissingPayloads__block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  _QWORD *v7;
  NSObject *v8;
  dispatch_block_t v9;
  _QWORD v10[4];
  id v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD block[4];
  id v15;

  v2 = (void *)a1[5];
  v3 = *(void **)(a1[4] + 144);
  v10[2] = __58__CPLUploadComputeStatesScopeTask__requestMissingPayloads__block_invoke_2;
  v10[3] = &unk_1E60DC8F0;
  v4 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v5 = v2;
  v6 = a1[4];
  v11 = v5;
  v12 = v6;
  v13 = a1[6];
  v7 = v10;
  block[0] = v4;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_1267;
  block[3] = &unk_1E60D71F8;
  v15 = v7;
  v8 = v3;
  v9 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v8, v9);

}

void __58__CPLUploadComputeStatesScopeTask__requestMissingPayloads__block_invoke_20(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  _QWORD v7[5];
  id v8;
  uint64_t v9;

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 208) += objc_msgSend(*(id *)(a1 + 40), "count");
  objc_msgSend(*(id *)(a1 + 32), "engineLibrary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __58__CPLUploadComputeStatesScopeTask__requestMissingPayloads__block_invoke_2_21;
  v7[3] = &unk_1E60D7A00;
  v3 = *(_QWORD *)(a1 + 40);
  v7[4] = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 48);
  v5 = *(id *)(a1 + 56);
  v6 = *(_QWORD *)(a1 + 64);
  v8 = v5;
  v9 = v6;
  objc_msgSend(v2, "providePayloadForComputeStates:inFolderWithURL:completionHandler:", v3, v4, v7);

}

void __58__CPLUploadComputeStatesScopeTask__requestMissingPayloads__block_invoke_2_21(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  _QWORD *v15;
  NSObject *v16;
  id v17;
  id v18;
  dispatch_block_t v19;
  _QWORD v20[5];
  id v21;
  id v22;
  id v23;
  uint64_t v24;
  uint8_t buf[8];
  uint64_t v26;
  void (*v27)(uint64_t);
  void *v28;
  id v29;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v6 && objc_msgSend(v6, "isCPLErrorWithCode:", 255))
  {
    if (!_CPLSilentLogging)
    {
      __CPLTaskOSLogDomain_1243();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B03C2000, v8, OS_LOG_TYPE_ERROR, "Lazy compute state payloads are not implemented by client - dropping compute states", buf, 2u);
      }

    }
    v7 = 0;
    v5 = (id)MEMORY[0x1E0C9AA60];
  }
  v9 = a1[4];
  v10 = (void *)a1[5];
  v11 = *(void **)(v9 + 144);
  v20[2] = __58__CPLUploadComputeStatesScopeTask__requestMissingPayloads__block_invoke_22;
  v20[3] = &unk_1E60D7A28;
  v12 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[4] = v9;
  v13 = v10;
  v14 = a1[6];
  v21 = v13;
  v22 = v5;
  v23 = v7;
  v24 = v14;
  v15 = v20;
  *(_QWORD *)buf = v12;
  v26 = 3221225472;
  v27 = __cpl_dispatch_async_block_invoke_1267;
  v28 = &unk_1E60D71F8;
  v29 = v15;
  v16 = v11;
  v17 = v7;
  v18 = v5;
  v19 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, buf);
  dispatch_async(v16, v19);

}

void __58__CPLUploadComputeStatesScopeTask__requestMissingPayloads__block_invoke_22(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint8_t buf[4];
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 136), "setCompletedUnitCount:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 136), "totalUnitCount"));
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 136);
  *(_QWORD *)(v2 + 136) = 0;

  objc_msgSend(*(id *)(a1 + 32), "session");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeDeferHandler:", *(_QWORD *)(a1 + 40));

  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
  {
    v5 = *(void **)(a1 + 32);
    +[CPLErrors sessionHasBeenDeferredError](CPLErrors, "sessionHasBeenDeferredError");
    v16 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_uploadComputeStatesTaskDidFinishWithError:");

  }
  else
  {
    v6 = *(_QWORD *)(a1 + 48);
    if (v6)
    {
      if (!_CPLSilentLogging)
      {
        __CPLTaskOSLogDomain_1243();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          v8 = objc_msgSend(*(id *)(a1 + 48), "count");
          *(_DWORD *)buf = 134217984;
          v18 = v8;
          _os_log_impl(&dword_1B03C2000, v7, OS_LOG_TYPE_DEFAULT, "Client provided %lu payloads", buf, 0xCu);
        }

        v6 = *(_QWORD *)(a1 + 48);
      }
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 152), "localComputeStatesToDropAfterClientProvidedPayloadForLocalComputeStates:", v6);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)(*(_QWORD *)(a1 + 32) + 216) += objc_msgSend(*(id *)(a1 + 48), "count");
      objc_msgSend(*(id *)(a1 + 32), "_dropLocalComputeStates:", v9);
      objc_msgSend(*(id *)(a1 + 32), "_requestMissingPayloads");

    }
    else if ((objc_msgSend(*(id *)(a1 + 56), "isCPLOperationDeferredError") & 1) != 0
           || objc_msgSend(*(id *)(a1 + 56), "isCPLOperationCancelledError"))
    {
      objc_msgSend(*(id *)(a1 + 32), "_uploadComputeStatesTaskDidFinishWithError:", *(_QWORD *)(a1 + 56));
    }
    else
    {
      if (!_CPLSilentLogging)
      {
        __CPLTaskOSLogDomain_1243();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          v11 = *(_QWORD *)(a1 + 56);
          *(_DWORD *)buf = 138412290;
          v18 = v11;
          _os_log_impl(&dword_1B03C2000, v10, OS_LOG_TYPE_ERROR, "Failed to request payloads for compute states - will retry later: %@", buf, 0xCu);
        }

      }
      objc_msgSend(*(id *)(a1 + 32), "session");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "scope");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "scopeIdentifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "noteSyncSessionInformation:", CFSTR("Uploading compute states for %@ needs compute state payloads from client"), v14);

      objc_msgSend(*(id *)(a1 + 32), "session");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "requestSyncStateAtEndOfSyncSession:reschedule:", 12, 0);

      objc_msgSend(*(id *)(a1 + 32), "_uploadComputeStatesTaskDidFinishWithError:", 0);
    }
  }
}

uint64_t __58__CPLUploadComputeStatesScopeTask__requestMissingPayloads__block_invoke_2(uint64_t result)
{
  if (*(_QWORD *)(result + 32) == *(_QWORD *)(*(_QWORD *)(result + 40) + 136))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 48) + 8) + 24) = 1;
    return objc_msgSend(*(id *)(result + 32), "cancel");
  }
  return result;
}

void __59__CPLUploadComputeStatesScopeTask__dropLocalComputeStates___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "recordComputeStatePushQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __59__CPLUploadComputeStatesScopeTask__dropLocalComputeStates___block_invoke_2;
  v7[3] = &unk_1E60DDA30;
  v8 = *(id *)(a1 + 40);
  v9 = v5;
  v6 = v5;
  objc_msgSend(v4, "do:", v7);

}

void __59__CPLUploadComputeStatesScopeTask__dropLocalComputeStates___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  objc_msgSend(v2, "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3 && !_CPLSilentLogging)
  {
    __CPLTaskOSLogDomain_1243();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v2, "error");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = 138412290;
      v7 = v5;
      _os_log_impl(&dword_1B03C2000, v4, OS_LOG_TYPE_ERROR, "Failed to drop compute states with no payload: %@", (uint8_t *)&v6, 0xCu);

    }
  }

}

uint64_t __59__CPLUploadComputeStatesScopeTask__dropLocalComputeStates___block_invoke_2(uint64_t a1, _QWORD *a2)
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  int v13;
  uint64_t v14;
  id v16;
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
  v4 = *(id *)(a1 + 32);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v18;
    while (2)
    {
      v9 = 0;
      v10 = v7;
      do
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(v4);
        v11 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v9);
        v12 = *(void **)(a1 + 40);
        v16 = v10;
        v13 = objc_msgSend(v12, "removeComputeState:error:", v11, &v16);
        v7 = v16;

        if (!v13)
        {

          if (a2)
          {
            v7 = objc_retainAutorelease(v7);
            v14 = 0;
            *a2 = v7;
          }
          else
          {
            v14 = 0;
          }
          goto LABEL_15;
        }
        ++v9;
        v10 = v7;
      }
      while (v6 != v9);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v6)
        continue;
      break;
    }
  }
  else
  {
    v7 = 0;
  }

  v14 = 1;
LABEL_15:

  return v14;
}

void __56__CPLUploadComputeStatesScopeTask__uploadExtractedBatch__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  _QWORD *v10;
  NSObject *v11;
  id v12;
  id v13;
  dispatch_block_t v14;
  _QWORD v15[5];
  id v16;
  id v17;
  uint64_t v18;
  _QWORD block[4];
  id v20;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(v7 + 144);
  v9 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __56__CPLUploadComputeStatesScopeTask__uploadExtractedBatch__block_invoke_2;
  v15[3] = &unk_1E60D7028;
  v15[4] = v7;
  v16 = v6;
  v17 = v5;
  v18 = *(_QWORD *)(a1 + 40);
  v10 = v15;
  block[0] = v9;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_1267;
  block[3] = &unk_1E60D71F8;
  v20 = v10;
  v11 = v8;
  v12 = v5;
  v13 = v6;
  v14 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v11, v14);

}

uint64_t __56__CPLUploadComputeStatesScopeTask__uploadExtractedBatch__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  CFAbsoluteTime v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  CFAbsoluteTime v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 120);
  *(_QWORD *)(v2 + 120) = 0;

  objc_msgSend(*(id *)(a1 + 32), "_updateComputeSyncUploadMetricsWithError:", *(_QWORD *)(a1 + 40));
  v4 = *(_QWORD *)(a1 + 40);
  if (v4)
  {
    if (!_CPLSilentLogging)
    {
      __CPLTaskOSLogDomain_1243();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        v6 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 152), "countOfCloudComputeStatesToUpload");
        v7 = *(_QWORD *)(a1 + 40);
        v15 = 134218242;
        v16 = v6;
        v17 = 2112;
        v18 = v7;
        _os_log_impl(&dword_1B03C2000, v5, OS_LOG_TYPE_ERROR, "Failed to upload %lu compute states: %@", (uint8_t *)&v15, 0x16u);
      }

      v4 = *(_QWORD *)(a1 + 40);
    }
    return objc_msgSend(*(id *)(a1 + 32), "_uploadComputeStatesTaskDidFinishWithError:", v4);
  }
  else
  {
    if (!_CPLSilentLogging)
    {
      __CPLTaskOSLogDomain_1243();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v10 = objc_msgSend(*(id *)(a1 + 48), "count");
        v11 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 152), "countOfCloudComputeStatesToUpload");
        v12 = v11 - objc_msgSend(*(id *)(a1 + 48), "count");
        v13 = CFAbsoluteTimeGetCurrent() - *(double *)(a1 + 56);
        v14 = *(_QWORD *)(a1 + 48);
        v15 = 134218754;
        v16 = v10;
        v17 = 2048;
        v18 = v12;
        v19 = 2048;
        v20 = v13;
        v21 = 2114;
        v22 = v14;
        _os_log_impl(&dword_1B03C2000, v9, OS_LOG_TYPE_DEFAULT, "Uploaded %lu compute states (dropped %lu) successfully in %.1fs:\n%{public}@", (uint8_t *)&v15, 0x2Au);
      }

    }
    if (objc_msgSend(*(id *)(a1 + 48), "count"))
      *(_BYTE *)(*(_QWORD *)(a1 + 32) + 176) = 1;
    return objc_msgSend(*(id *)(a1 + 32), "_discardExtractedBatchAndGetNextBatch");
  }
}

@end
