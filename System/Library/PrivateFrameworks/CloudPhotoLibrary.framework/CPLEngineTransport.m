@implementation CPLEngineTransport

- (CPLEngineTransport)initWithEngineLibrary:(id)a3
{
  id v5;
  CPLEngineTransport *v6;
  CPLEngineTransport *v7;
  void *v8;
  uint64_t v9;
  CPLPlatformObject *platformObject;
  NSObject *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  objc_super v17;
  uint8_t buf[4];
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)CPLEngineTransport;
  v6 = -[CPLEngineTransport init](&v17, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeWeak((id *)&v6->_engineLibrary, v5);
    +[CPLPlatform currentPlatform](CPLPlatform, "currentPlatform");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "newPlatformImplementationForObject:", v7);
    platformObject = v7->_platformObject;
    v7->_platformObject = (CPLPlatformObject *)v9;

    if (!v7->_platformObject)
    {
      if (!_CPLSilentLogging)
      {
        __CPLGenericOSLogDomain();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          v13 = (void *)objc_opt_class();
          *(_DWORD *)buf = 138412290;
          v19 = v13;
          v14 = v13;
          _os_log_impl(&dword_1B03C2000, v12, OS_LOG_TYPE_ERROR, "No platform object specified for %@", buf, 0xCu);

        }
      }
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/CPLEngineTransport.m");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, v7, v16, 25, CFSTR("No platform object specified for %@"), objc_opt_class());

      abort();
    }
  }

  return v7;
}

- (NSArray)involvedProcesses
{
  void *v2;
  void *v3;

  -[CPLEngineTransport platformObject](self, "platformObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "involvedProcesses");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (Class)transportGroupClass
{
  void *v2;
  void *v3;

  -[CPLEngineTransport platformObject](self, "platformObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "transportGroupClass");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (Class)v3;
}

- (Class)userIdentifierClass
{
  void *v2;
  void *v3;

  -[CPLEngineTransport platformObject](self, "platformObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "userIdentifierClass");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (Class)v3;
}

- (CPLSharedRecordPropertyMapping)propertyMapping
{
  void *v2;
  void *v3;

  -[CPLEngineTransport platformObject](self, "platformObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "propertyMapping");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (CPLSharedRecordPropertyMapping *)v3;
}

- (id)acquireReschedulerTaskWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[CPLEngineTransport platformObject](self, "platformObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "acquireReschedulerTaskWithCompletionHandler:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)setupTaskUpdateDisabledFeatures:(BOOL)a3 completionHandler:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;

  v4 = a3;
  v6 = a4;
  -[CPLEngineTransport platformObject](self, "platformObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setupTaskUpdateDisabledFeatures:completionHandler:", v4, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)fetchRecordsTaskForRecordsWithScopedIdentifiers:(id)a3 targetMapping:(id)a4 transportScopeMapping:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  -[CPLEngineTransport platformObject](self, "platformObject");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "fetchRecordsTaskForRecordsWithScopedIdentifiers:targetMapping:transportScopeMapping:completionHandler:", v13, v12, v11, v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)uploadBatchTaskForBatch:(id)a3 scope:(id)a4 targetMapping:(id)a5 transportScopeMapping:(id)a6 progressHandler:(id)a7 completionHandler:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  _QWORD v24[4];
  id v25;

  v14 = a7;
  v15 = a8;
  v16 = a6;
  v17 = a5;
  v18 = a4;
  v19 = a3;
  -[CPLEngineTransport platformObject](self, "platformObject");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __122__CPLEngineTransport_uploadBatchTaskForBatch_scope_targetMapping_transportScopeMapping_progressHandler_completionHandler___block_invoke;
  v24[3] = &unk_1E60D81A0;
  v25 = v14;
  v21 = v14;
  objc_msgSend(v20, "uploadBatchTaskForBatch:scope:targetMapping:transportScopeMapping:progressHandler:completionHandler:", v19, v18, v17, v16, v24, v15);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

- (id)reshareRecordsTaskWithRecords:(id)a3 sourceScope:(id)a4 destinationScope:(id)a5 transportScopeMapping:(id)a6 completionHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;

  v12 = a7;
  v13 = a6;
  v14 = a5;
  v15 = a4;
  v16 = a3;
  -[CPLEngineTransport platformObject](self, "platformObject");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "reshareRecordsTaskWithRecords:sourceScope:destinationScope:transportScopeMapping:completionHandler:", v16, v15, v14, v13, v12);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (id)queryTaskForCursor:(id)a3 class:(Class)a4 scope:(id)a5 transportScopeMapping:(id)a6 progressHandler:(id)a7 completionHandler:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;

  v14 = a8;
  v15 = a7;
  v16 = a6;
  v17 = a5;
  v18 = a3;
  -[CPLEngineTransport platformObject](self, "platformObject");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "queryTaskForCursor:class:scope:transportScopeMapping:progressHandler:completionHandler:", v18, a4, v17, v16, v15, v14);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (id)downloadBatchTaskForSyncAnchor:(id)a3 scope:(id)a4 transportScopeMapping:(id)a5 currentScopeChange:(id)a6 progressHandler:(id)a7 completionHandler:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;

  v14 = a8;
  v15 = a7;
  v16 = a6;
  v17 = a5;
  v18 = a4;
  v19 = a3;
  -[CPLEngineTransport platformObject](self, "platformObject");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "downloadBatchTaskForSyncAnchor:scope:transportScopeMapping:currentScopeChange:progressHandler:completionHandler:", v19, v18, v17, v16, v15, v14);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

- (id)uploadComputeStates:(id)a3 scope:(id)a4 sharedScope:(id)a5 targetMapping:(id)a6 transportScopeMapping:(id)a7 knownRecords:(id)a8 completionHandler:(id)a9
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  void *v24;

  v16 = a9;
  v17 = a8;
  v18 = a7;
  v19 = a6;
  v20 = a5;
  v21 = a4;
  v22 = a3;
  -[CPLEngineTransport platformObject](self, "platformObject");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "uploadComputeStates:scope:sharedScope:targetMapping:transportScopeMapping:knownRecords:completionHandler:", v22, v21, v20, v19, v18, v17, v16);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

- (id)downloadComputeStatesWithScopedIdentifiers:(id)a3 scope:(id)a4 sharedScope:(id)a5 targetStorageURL:(id)a6 transportScopeMapping:(id)a7 completionHandler:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;

  v14 = a8;
  v15 = a7;
  v16 = a6;
  v17 = a5;
  v18 = a4;
  v19 = a3;
  -[CPLEngineTransport platformObject](self, "platformObject");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "downloadComputeStatesWithScopedIdentifiers:scope:sharedScope:targetStorageURL:transportScopeMapping:completionHandler:", v19, v18, v17, v16, v15, v14);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

- (id)fetchScopeListChangesForScopeListSyncAnchor:(id)a3 progressHandler:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[CPLEngineTransport platformObject](self, "platformObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "fetchScopeListChangesForScopeListSyncAnchor:progressHandler:completionHandler:", v10, v9, v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)deleteTransportScope:(id)a3 scope:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[CPLEngineTransport platformObject](self, "platformObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "deleteTransportScope:scope:completionHandler:", v10, v9, v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)updateTransportScope:(id)a3 scope:(id)a4 scopeChange:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  -[CPLEngineTransport platformObject](self, "platformObject");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "updateTransportScope:scope:scopeChange:completionHandler:", v13, v12, v11, v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)getScopeInfoWithTransportScope:(id)a3 scope:(id)a4 previousScopeChange:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  -[CPLEngineTransport platformObject](self, "platformObject");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "getScopeInfoWithTransportScope:scope:previousScopeChange:completionHandler:", v13, v12, v11, v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)getCurrentSyncAnchorWithTransportScope:(id)a3 scope:(id)a4 previousScopeChange:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  -[CPLEngineTransport platformObject](self, "platformObject");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "getCurrentSyncAnchorWithTransportScope:scope:previousScopeChange:completionHandler:", v13, v12, v11, v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)fetchTransportScopeForScope:(id)a3 transportScope:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[CPLEngineTransport platformObject](self, "platformObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "fetchTransportScopeForScope:transportScope:completionHandler:", v10, v9, v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)getStreamingURLTaskForResource:(id)a3 intent:(unint64_t)a4 hints:(id)a5 timeRange:(id *)a6 target:(id)a7 transportScopeMapping:(id)a8 clientBundleID:(id)a9 completionHandler:(id)a10
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  __int128 v24;
  void *v25;
  _OWORD v27[3];

  v17 = a10;
  v18 = a9;
  v19 = a8;
  v20 = a7;
  v21 = a5;
  v22 = a3;
  -[CPLEngineTransport platformObject](self, "platformObject");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = *(_OWORD *)&a6->var0.var3;
  v27[0] = *(_OWORD *)&a6->var0.var0;
  v27[1] = v24;
  v27[2] = *(_OWORD *)&a6->var1.var1;
  objc_msgSend(v23, "getStreamingURLTaskForResource:intent:hints:timeRange:target:transportScopeMapping:clientBundleID:completionHandler:", v22, a4, v21, v27, v20, v19, v18, v17);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  return v25;
}

- (id)resourceCheckTaskForResources:(id)a3 targetMapping:(id)a4 transportScopeMapping:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  -[CPLEngineTransport platformObject](self, "platformObject");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "resourceCheckTaskForResources:targetMapping:transportScopeMapping:completionHandler:", v13, v12, v11, v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)rampingRequestTaskForResourceType:(unint64_t)a3 numRequested:(unint64_t)a4 completionHandler:(id)a5
{
  id v8;
  void *v9;
  void *v10;

  v8 = a5;
  -[CPLEngineTransport platformObject](self, "platformObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "rampingRequestTaskForResourceType:numRequested:completionHandler:", a3, a4, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)resourcesDownloadTaskWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[CPLEngineTransport platformObject](self, "platformObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "resourcesDownloadTaskWithCompletionHandler:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)inMemoryDownloadTaskForResource:(id)a3 record:(id)a4 target:(id)a5 transportScopeMapping:(id)a6 clientBundleID:(id)a7 completionHandler:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;

  v14 = a8;
  v15 = a7;
  v16 = a6;
  v17 = a5;
  v18 = a4;
  v19 = a3;
  -[CPLEngineTransport platformObject](self, "platformObject");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "inMemoryDownloadTaskForResource:record:target:transportScopeMapping:clientBundleID:completionHandler:", v19, v18, v17, v16, v15, v14);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

- (id)createScopeTaskForScope:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  -[CPLEngineTransport platformObject](self, "platformObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "createScopeTaskForScope:completionHandler:", v7, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)updateShareTaskForScope:(id)a3 transportScope:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[CPLEngineTransport platformObject](self, "platformObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "updateShareTaskForScope:transportScope:completionHandler:", v10, v9, v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)fetchTaskForScopeWithShareURL:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  -[CPLEngineTransport platformObject](self, "platformObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "fetchTaskForScopeWithShareURL:completionHandler:", v7, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)acceptTaskForSharedScope:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  -[CPLEngineTransport platformObject](self, "platformObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "acceptTaskForSharedScope:completionHandler:", v7, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)fetchExistingSharedLibraryScopeTaskWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[CPLEngineTransport platformObject](self, "platformObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fetchExistingSharedLibraryScopeTaskWithCompletionHandler:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)startExitTaskFromSharedScope:(id)a3 transportScope:(id)a4 share:(id)a5 retentionPolicy:(int64_t)a6 exitSource:(int64_t)a7 completionHandler:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;

  v14 = a8;
  v15 = a5;
  v16 = a4;
  v17 = a3;
  -[CPLEngineTransport platformObject](self, "platformObject");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "startExitTaskFromSharedScope:transportScope:share:retentionPolicy:exitSource:completionHandler:", v17, v16, v15, a6, a7, v14);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (id)removeParticipantInSharedLibraryTaskFromSharedScope:(id)a3 transportScope:(id)a4 share:(id)a5 retentionPolicy:(int64_t)a6 exitSource:(int64_t)a7 userIdentifiersToRemove:(id)a8 participantIDsToRemove:(id)a9 completionHandler:(id)a10
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  void *v24;

  v17 = a10;
  v18 = a9;
  v19 = a8;
  v20 = a5;
  v21 = a4;
  v22 = a3;
  -[CPLEngineTransport platformObject](self, "platformObject");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "removeParticipantInSharedLibraryTaskFromSharedScope:transportScope:share:retentionPolicy:exitSource:userIdentifiersToRemove:participantIDsToRemove:completionHandler:", v22, v21, v20, a6, a7, v19, v18, v17);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

- (id)fixUpSparseRecordsTaskWithTasks:(id)a3 transportScopeMapping:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[CPLEngineTransport platformObject](self, "platformObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "fixUpSparseRecordsTaskWithTasks:transportScopeMapping:completionHandler:", v10, v9, v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)sharedLibraryServerRampTaskWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[CPLEngineTransport platformObject](self, "platformObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sharedLibraryServerRampTaskWithCompletionHandler:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)updateContributorsTaskWithSharedScope:(id)a3 contributorsUpdates:(id)a4 transportScopeMapping:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  -[CPLEngineTransport platformObject](self, "platformObject");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "updateContributorsTaskWithSharedScope:contributorsUpdates:transportScopeMapping:completionHandler:", v13, v12, v11, v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)cleanupStagedScope:(id)a3 stagingScope:(id)a4 destinationScope:(id)a5 transportScopeMapping:(id)a6 progressHandler:(id)a7 completionHandler:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;

  v14 = a8;
  v15 = a7;
  v16 = a6;
  v17 = a5;
  v18 = a4;
  v19 = a3;
  -[CPLEngineTransport platformObject](self, "platformObject");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "cleanupStagedScope:stagingScope:destinationScope:transportScopeMapping:progressHandler:completionHandler:", v19, v18, v17, v16, v15, v14);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

- (id)queryUserDetailsTaskForParticipants:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  -[CPLEngineTransport platformObject](self, "platformObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "queryUserDetailsTaskForParticipants:completionHandler:", v7, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)sendFeedbackTaskForMessages:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  -[CPLEngineTransport platformObject](self, "platformObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sendFeedbackTaskForMessages:completionHandler:", v7, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)bestErrorForUnderlyingError:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;

  v4 = a3;
  -[CPLEngineTransport platformObject](self, "platformObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v5, "bestErrorForUnderlyingError:", v4);
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = v4;
  }
  v7 = v6;

  return v7;
}

- (id)simpleDescriptionForSyncAnchor:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[CPLEngineTransport platformObject](self, "platformObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "simpleDescriptionForSyncAnchor:", v4);
  else
    objc_msgSend(v4, "base64EncodedStringWithOptions:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)simpleDescriptionForScopeListSyncAnchor:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[CPLEngineTransport platformObject](self, "platformObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "simpleDescriptionForScopeListSyncAnchor:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)getProposedStagingScopeIdentifier:(id *)a3 stagingTransportScope:(id *)a4 forScope:(id)a5 transportScope:(id)a6 transportUserIdentifier:(id)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;

  v12 = a7;
  v13 = a6;
  v14 = a5;
  -[CPLEngineTransport platformObject](self, "platformObject");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = objc_msgSend(v15, "getProposedStagingScopeIdentifier:stagingTransportScope:forScope:transportScope:transportUserIdentifier:", a3, a4, v14, v13, v12);

  return (char)a4;
}

- (void)getSystemBudgetsWithCompletionHandler:(id)a3
{
  void (**v4)(id, _QWORD, void *);
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, _QWORD, void *))a3;
  -[CPLEngineTransport platformObject](self, "platformObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v5, "getSystemBudgetsWithCompletionHandler:", v4);
  }
  else
  {
    v6 = (void *)MEMORY[0x1E0CB35C8];
    v10 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("getSystemBudgetsWithCompletionHandler is not implemented"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "errorWithDomain:code:userInfo:", CFSTR("CloudPhotoLibraryErrorDomain"), 255, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v4[2](v4, 0, v9);
  }

}

- (void)setShouldOverride:(BOOL)a3 forSystemBudgets:(unint64_t)a4
{
  _BOOL8 v5;
  id v6;

  v5 = a3;
  -[CPLEngineTransport platformObject](self, "platformObject");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v6, "setShouldOverride:forSystemBudgets:", v5, a4);

}

- (void)noteClientIsBeginningSignificantWork
{
  id v2;

  -[CPLEngineTransport platformObject](self, "platformObject");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v2, "noteClientIsBeginningSignificantWork");

}

- (void)noteClientIsEndingSignificantWork
{
  id v2;

  -[CPLEngineTransport platformObject](self, "platformObject");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v2, "noteClientIsEndingSignificantWork");

}

- (void)cancelBlockedTasksIncludingBackground:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[CPLEngineTransport platformObject](self, "platformObject");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cancelBlockedTasksIncludingBackground:", v3);

}

- (id)tentativeConcreteScopeForScope:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[CPLEngineTransport platformObject](self, "platformObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "tentativeConcreteScopeForScope:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)descriptionForTransportScope:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[CPLEngineTransport platformObject](self, "platformObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "descriptionForTransportScope:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)scopeNameForTransportScope:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[CPLEngineTransport platformObject](self, "platformObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "scopeNameForTransportScope:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)transportScopeForUpgradeFromScopeName:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[CPLEngineTransport platformObject](self, "platformObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "transportScopeForUpgradeFromScopeName:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)upgradeFlags:(id)a3 fromTransportScope:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[CPLEngineTransport platformObject](self, "platformObject");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "upgradeFlags:fromTransportScope:", v7, v6);

}

- (BOOL)isNewTransportScope:(id)a3 compatibleWithOldTransportScope:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;

  v6 = a4;
  v7 = a3;
  -[CPLEngineTransport platformObject](self, "platformObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isNewTransportScope:compatibleWithOldTransportScope:", v7, v6);

  return v9;
}

- (void)openWithCompletionHandler:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CPLEngineTransport platformObject](self, "platformObject");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "openWithCompletionHandler:", v4);

}

- (void)closeAndDeactivate:(BOOL)a3 completionHandler:(id)a4
{
  _BOOL8 v4;
  id v6;
  id v7;

  v4 = a3;
  v6 = a4;
  -[CPLEngineTransport platformObject](self, "platformObject");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "closeAndDeactivate:completionHandler:", v4, v6);

}

- (id)componentName
{
  void *v2;
  void *v3;

  -[CPLEngineTransport platformObject](self, "platformObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "componentName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)getStatusWithCompletionHandler:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  -[CPLEngineTransport platformObject](self, "platformObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[CPLEngineTransport platformObject](self, "platformObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "getStatusWithCompletionHandler:", v7);

  }
  else
  {
    (*((void (**)(id, _QWORD, _QWORD))v7 + 2))(v7, 0, 0);
  }

}

- (void)getStatusDictionaryWithCompletionHandler:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  -[CPLEngineTransport platformObject](self, "platformObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[CPLEngineTransport platformObject](self, "platformObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "getStatusDictionaryWithCompletionHandler:", v7);

  }
  else
  {
    (*((void (**)(id, _QWORD, _QWORD))v7 + 2))(v7, 0, 0);
  }

}

- (id)transportScopeFromConcreteScope:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[CPLEngineTransport platformObject](self, "platformObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "transportScopeFromConcreteScope:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)concreteScopeFromTransportScope:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[CPLEngineTransport platformObject](self, "platformObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "concreteScopeFromTransportScope:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)noteClientIsInForeground
{
  id v2;

  -[CPLEngineTransport platformObject](self, "platformObject");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "noteClientIsInForeground");

}

- (void)noteClientIsInBackground
{
  id v2;

  -[CPLEngineTransport platformObject](self, "platformObject");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "noteClientIsInBackground");

}

- (BOOL)isResourceDynamic:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[CPLEngineTransport platformObject](self, "platformObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isResourceDynamic:", v4);

  return v6;
}

- (void)findPersistedInitialSyncSession:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[CPLEngineTransport platformObject](self, "platformObject");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "findPersistedInitialSyncSession:completionHandler:", v7, v6);

}

- (void)dropPersistedInitialSyncSession
{
  id v2;

  -[CPLEngineTransport platformObject](self, "platformObject");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dropPersistedInitialSyncSession");

}

- (BOOL)shouldIgnoreScopeWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[CPLEngineTransport platformObject](self, "platformObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "shouldIgnoreScopeWithIdentifier:", v4);

  return v6;
}

- (id)createGroupForInitialUpload
{
  void *v2;
  void *v3;

  -[CPLEngineTransport platformObject](self, "platformObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "createGroupForInitialUpload");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)createGroupForResetSync
{
  void *v2;
  void *v3;

  -[CPLEngineTransport platformObject](self, "platformObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "createGroupForResetSync");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)createGroupForInitialDownload
{
  void *v2;
  void *v3;

  -[CPLEngineTransport platformObject](self, "platformObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "createGroupForInitialDownload");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)createGroupForPrefetch
{
  void *v2;
  void *v3;

  -[CPLEngineTransport platformObject](self, "platformObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "createGroupForPrefetch");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)createGroupForThumbnailPrefetch
{
  void *v2;
  void *v3;

  -[CPLEngineTransport platformObject](self, "platformObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "createGroupForThumbnailPrefetch");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)createGroupForNonDerivativePrefetch
{
  void *v2;
  void *v3;

  -[CPLEngineTransport platformObject](self, "platformObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "createGroupForNonDerivativePrefetch");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)createGroupForKeepOriginalsPrefetch
{
  void *v2;
  void *v3;

  -[CPLEngineTransport platformObject](self, "platformObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "createGroupForKeepOriginalsPrefetch");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)createGroupForMemoriesPrefetch
{
  void *v2;
  void *v3;

  -[CPLEngineTransport platformObject](self, "platformObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "createGroupForMemoriesPrefetch");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)createGroupForRecoveryDownload
{
  void *v2;
  void *v3;

  -[CPLEngineTransport platformObject](self, "platformObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "createGroupForRecoveryDownload");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)createGroupForWidgetPrefetch
{
  void *v2;
  void *v3;

  -[CPLEngineTransport platformObject](self, "platformObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "createGroupForWidgetPrefetch");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)createGroupForSetup
{
  void *v2;
  void *v3;

  -[CPLEngineTransport platformObject](self, "platformObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "createGroupForSetup");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)createGroupForTransportScopeDelete
{
  void *v2;
  void *v3;

  -[CPLEngineTransport platformObject](self, "platformObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "createGroupForTransportScopeDelete");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)createGroupForTransportScopeUpdate
{
  void *v2;
  void *v3;

  -[CPLEngineTransport platformObject](self, "platformObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "createGroupForTransportScopeUpdate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)createGroupForTransportScopeRefresh
{
  void *v2;
  void *v3;

  -[CPLEngineTransport platformObject](self, "platformObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "createGroupForTransportScopeRefresh");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)createGroupForFetchScopeListChanges
{
  void *v2;
  void *v3;

  -[CPLEngineTransport platformObject](self, "platformObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "createGroupForFetchScopeListChanges");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)createGroupForFeedback
{
  void *v2;
  void *v3;

  -[CPLEngineTransport platformObject](self, "platformObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "createGroupForFeedback");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)createGroupForLibraryStateCheck
{
  void *v2;
  void *v3;

  -[CPLEngineTransport platformObject](self, "platformObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "createGroupForLibraryStateCheck");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)createGroupForChangeUpload
{
  void *v2;
  void *v3;

  -[CPLEngineTransport platformObject](self, "platformObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "createGroupForChangeUpload");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)createGroupForChangeDownload
{
  void *v2;
  void *v3;

  -[CPLEngineTransport platformObject](self, "platformObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "createGroupForChangeDownload");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)createGroupForComputeStateUpload
{
  void *v2;
  void *v3;

  -[CPLEngineTransport platformObject](self, "platformObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "createGroupForComputeStateUpload");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)createGroupForComputeStateDownloadOnDemand
{
  void *v2;
  void *v3;

  -[CPLEngineTransport platformObject](self, "platformObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "createGroupForComputeStateDownloadOnDemand");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)createGroupForComputeStateDownloadPrefetch
{
  void *v2;
  void *v3;

  -[CPLEngineTransport platformObject](self, "platformObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "createGroupForComputeStateDownloadPrefetch");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)createGroupForFixUpTasks
{
  void *v2;
  void *v3;

  -[CPLEngineTransport platformObject](self, "platformObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "createGroupForFixUpTasks");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)createGroupForReshare
{
  void *v2;
  void *v3;

  -[CPLEngineTransport platformObject](self, "platformObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "createGroupForReshare");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)createGroupForStagedScopeCleanup
{
  void *v2;
  void *v3;

  -[CPLEngineTransport platformObject](self, "platformObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "createGroupForStagedScopeCleanup");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)createGroupForThumbnailsDownload
{
  void *v2;
  void *v3;

  -[CPLEngineTransport platformObject](self, "platformObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "createGroupForThumbnailsDownload");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)createGroupForResourcesDownload
{
  void *v2;
  void *v3;

  -[CPLEngineTransport platformObject](self, "platformObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "createGroupForResourcesDownload");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)createGroupForWidgetResourcesDownload
{
  void *v2;
  void *v3;

  -[CPLEngineTransport platformObject](self, "platformObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "createGroupForWidgetResourcesDownload");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)createGroupForDownloadWithIntent:(unint64_t)a3 priority:(unint64_t)a4
{
  void *v6;
  void *v7;

  -[CPLEngineTransport platformObject](self, "platformObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "createGroupForDownloadWithIntent:priority:", a3, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)createGroupForMovieStreamingWithIntent:(unint64_t)a3
{
  void *v4;
  void *v5;

  -[CPLEngineTransport platformObject](self, "platformObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "createGroupForMovieStreamingWithIntent:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)createGroupForAnalysisDownload
{
  void *v2;
  void *v3;

  -[CPLEngineTransport platformObject](self, "platformObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "createGroupForAnalysisDownload");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)createGroupForPruningCheck
{
  void *v2;
  void *v3;

  -[CPLEngineTransport platformObject](self, "platformObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "createGroupForPruningCheck");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)createGroupForPublishingMomentShare
{
  void *v2;
  void *v3;

  -[CPLEngineTransport platformObject](self, "platformObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "createGroupForPublishingMomentShare");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)createGroupForFetchingMomentShare
{
  void *v2;
  void *v3;

  -[CPLEngineTransport platformObject](self, "platformObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "createGroupForFetchingMomentShare");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)createGroupForAcceptingMomentShare
{
  void *v2;
  void *v3;

  -[CPLEngineTransport platformObject](self, "platformObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "createGroupForAcceptingMomentShare");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)createGroupForQueryUserIdentities
{
  void *v2;
  void *v3;

  -[CPLEngineTransport platformObject](self, "platformObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "createGroupForQueryUserIdentities");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)createGroupForPublishingLibraryShare
{
  void *v2;
  void *v3;

  -[CPLEngineTransport platformObject](self, "platformObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "createGroupForPublishingLibraryShare");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)createGroupForFetchingLibraryShare
{
  void *v2;
  void *v3;

  -[CPLEngineTransport platformObject](self, "platformObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "createGroupForFetchingLibraryShare");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)createGroupForAcceptingLibraryShare
{
  void *v2;
  void *v3;

  -[CPLEngineTransport platformObject](self, "platformObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "createGroupForAcceptingLibraryShare");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)createGroupForCleanupLibrary
{
  void *v2;
  void *v3;

  -[CPLEngineTransport platformObject](self, "platformObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "createGroupForCleanupLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)createGroupForExitSharedLibrary
{
  void *v2;
  void *v3;

  -[CPLEngineTransport platformObject](self, "platformObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "createGroupForExitSharedLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)createGroupForFetchingExistingSharedScope
{
  void *v2;
  void *v3;

  -[CPLEngineTransport platformObject](self, "platformObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "createGroupForFetchingExistingSharedScope");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)createGroupForSharedLibraryRampCheck
{
  void *v2;
  void *v3;

  -[CPLEngineTransport platformObject](self, "platformObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "createGroupForSharedLibraryRampCheck");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (CPLPlatformObject)platformObject
{
  return self->_platformObject;
}

- (CPLEngineLibrary)engineLibrary
{
  return (CPLEngineLibrary *)objc_loadWeakRetained((id *)&self->_engineLibrary);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_engineLibrary);
  objc_storeStrong((id *)&self->_platformObject, 0);
}

uint64_t __122__CPLEngineTransport_uploadBatchTaskForBatch_scope_targetMapping_transportScopeMapping_progressHandler_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

+ (id)platformImplementationProtocol
{
  void *v2;
  NSString *v3;
  void *v4;

  objc_msgSend((id)objc_opt_class(), "description");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingString:", CFSTR("Implementation"));
  v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  NSProtocolFromString(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
