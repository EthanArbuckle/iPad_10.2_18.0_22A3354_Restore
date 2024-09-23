@implementation CPLEnginePushRepository

- (CPLEnginePushRepository)initWithEngineStore:(id)a3 name:(id)a4
{
  CPLEnginePushRepository *v4;
  NSObject *v5;
  dispatch_queue_t v6;
  OS_dispatch_queue *uploadRateQueue;
  NSObject *v8;
  dispatch_queue_t v9;
  OS_dispatch_queue *timingStatisticQueue;
  NSMutableDictionary *v11;
  NSMutableDictionary *timingStatistics;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)CPLEnginePushRepository;
  v4 = -[CPLEngineStorage initWithEngineStore:name:](&v14, sel_initWithEngineStore_name_, a3, a4);
  if (v4)
  {
    CPLCopyDefaultSerialQueueAttributes();
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = dispatch_queue_create("com.apple.cpl.uploadrate", v5);
    uploadRateQueue = v4->_uploadRateQueue;
    v4->_uploadRateQueue = (OS_dispatch_queue *)v6;

    CPLCopyDefaultSerialQueueAttributes();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = dispatch_queue_create("com.apple.cpl.timingstatistic", v8);
    timingStatisticQueue = v4->_timingStatisticQueue;
    v4->_timingStatisticQueue = (OS_dispatch_queue *)v9;

    v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    timingStatistics = v4->_timingStatistics;
    v4->_timingStatistics = v11;

  }
  return v4;
}

- (unint64_t)scopeType
{
  return 1;
}

- (id)_outgoingResources
{
  void *v2;
  void *v3;

  -[CPLEngineStorage engineStore](self, "engineStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "outgoingResources");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)notePushRepositoryStoredSomeChanges
{
  id v2;

  -[CPLEngineStorage engineStore](self, "engineStore");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "notePushRepositoryStoredSomeChanges");

}

- (BOOL)deleteRecordsForScopeIndex:(int64_t)a3 maxCount:(int64_t)a4 deletedCount:(int64_t *)a5 error:(id *)a6
{
  void *v11;
  id v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  BOOL v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  id v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  -[CPLEngineStorage platformObject](self, "platformObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0;
  LODWORD(a4) = objc_msgSend(v11, "deleteRecordsForScopeIndex:maxCount:deletedCount:discardedUploadIdentifiers:error:", a3, a4, a5, &v25, a6);
  v12 = v25;

  if ((_DWORD)a4)
  {
    if (objc_msgSend(v12, "count"))
    {
      -[CPLEnginePushRepository _outgoingResources](self, "_outgoingResources");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 0u;
      v22 = 0u;
      v23 = 0u;
      v24 = 0u;
      v14 = v12;
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
      if (v15)
      {
        v16 = v15;
        v17 = *(_QWORD *)v22;
        while (2)
        {
          for (i = 0; i != v16; ++i)
          {
            if (*(_QWORD *)v22 != v17)
              objc_enumerationMutation(v14);
            if (!objc_msgSend(v13, "deleteResourcesToUploadWithUploadIdentifier:error:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i), a6, (_QWORD)v21))
            {
              v19 = 0;
              goto LABEL_14;
            }
          }
          v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
          if (v16)
            continue;
          break;
        }
      }
      v19 = 1;
LABEL_14:

    }
    else
    {
      v19 = 1;
    }
  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (unint64_t)countOfChangesInScopeWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;

  v4 = a3;
  -[CPLEngineStorage platformObject](self, "platformObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countOfChangesInScopeWithIdentifier:", v4);

  return v6;
}

- (BOOL)hasChangesInScopeWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[CPLEngineStorage platformObject](self, "platformObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hasChangesInScopeWithIdentifier:", v4);

  return v6;
}

- (unint64_t)minimumPriorityForChangesInScopeWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;

  v4 = a3;
  -[CPLEngineStorage platformObject](self, "platformObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "minimumPriorityForChangesInScopeWithIdentifier:", v4);

  return v6;
}

- (BOOL)hasChangesWithPriorityLowerThanPriority:(unint64_t)a3 inScopeWithIdentifier:(id)a4
{
  id v6;
  void *v7;

  v6 = a4;
  -[CPLEngineStorage platformObject](self, "platformObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = objc_msgSend(v7, "hasChangesWithPriorityLowerThanPriority:inScopeWithIdentifier:", a3, v6);

  return a3;
}

- (BOOL)hasChangesWithPriorityGreaterThanPriority:(unint64_t)a3 inScopeWithIdentifier:(id)a4
{
  id v6;
  void *v7;

  v6 = a4;
  -[CPLEngineStorage platformObject](self, "platformObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = objc_msgSend(v7, "hasChangesWithPriorityGreaterThanPriority:inScopeWithIdentifier:", a3, v6);

  return a3;
}

- (BOOL)hasChangesWithScopeFilter:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[CPLEngineStorage platformObject](self, "platformObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hasChangesWithScopeFilter:", v4);

  return v6;
}

- (BOOL)storeChange:(id)a3 pushContext:(id)a4 error:(id *)a5
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  int v15;
  id v16;
  void *v17;
  char v18;
  BOOL v19;
  NSMutableDictionary *pushObservers;
  NSObject *v22;
  void *v23;
  void *v24;
  _QWORD v25[4];
  id v26;
  id v27;
  id v28;
  uint8_t buf[4];
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  if (!v10)
  {
    if (!_CPLSilentLogging)
    {
      __CPLStorageOSLogDomain_864();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v30 = v9;
        _os_log_impl(&dword_1B03C2000, v22, OS_LOG_TYPE_ERROR, "%@ should be pushed with push context", buf, 0xCu);
      }

    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/Storage/CPLEnginePushRepository.m");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v24, 123, CFSTR("%@ should be pushed with push context"), v9);

    abort();
  }
  v11 = v10;
  if (objc_msgSend(v9, "supportsResources"))
  {
    if (objc_msgSend(v9, "hasChangeType:", 8))
    {
      objc_msgSend(v11, "uploadIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v12)
      {
        objc_msgSend(v11, "pushContextAddingUploadIdentifier");
        v13 = objc_claimAutoreleasedReturnValue();

        v11 = (void *)v13;
      }
    }
  }
  -[CPLEngineStorage platformObject](self, "platformObject");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0;
  v15 = objc_msgSend(v14, "storeChange:pushContext:discardedUploadIdentifier:error:", v9, v11, &v28, a5);
  v16 = v28;

  if (!v15 || !v16)
  {
    if (!v15)
      goto LABEL_9;
LABEL_11:
    -[CPLBatchExtractionStrategy resetConditionallyFromNewIncomingChange:](self->_extractionStrategy, "resetConditionallyFromNewIncomingChange:", v9);
    pushObservers = self->_pushObservers;
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __57__CPLEnginePushRepository_storeChange_pushContext_error___block_invoke;
    v25[3] = &unk_1E60D7860;
    v26 = v9;
    v27 = v11;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](pushObservers, "enumerateKeysAndObjectsUsingBlock:", v25);
    -[CPLEnginePushRepository notePushRepositoryStoredSomeChanges](self, "notePushRepositoryStoredSomeChanges");

    v19 = 1;
    goto LABEL_12;
  }
  -[CPLEnginePushRepository _outgoingResources](self, "_outgoingResources");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "deleteResourcesToUploadWithUploadIdentifier:error:", v16, a5);

  if ((v18 & 1) != 0)
    goto LABEL_11;
LABEL_9:
  v19 = 0;
LABEL_12:

  return v19;
}

- (BOOL)reinjectChange:(id)a3 dequeueOrder:(int64_t)a4 overwrittenRecord:(BOOL *)a5 error:(id *)a6
{
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  id v17;
  void *v18;
  char v19;
  BOOL v20;
  NSObject *v21;
  NSObject *v23;
  void *v24;
  void *v25;
  id v26;
  uint8_t buf[4];
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  objc_msgSend(v11, "_pushContext");
  v12 = objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    if (!_CPLSilentLogging)
    {
      __CPLStorageOSLogDomain_864();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v28 = v11;
        _os_log_impl(&dword_1B03C2000, v23, OS_LOG_TYPE_ERROR, "%@ should come with a push context", buf, 0xCu);
      }

    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/Storage/CPLEnginePushRepository.m");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v25, 149, CFSTR("%@ should come with a push context"), v11);

    abort();
  }
  v13 = (void *)v12;
  if (objc_msgSend(v11, "supportsResources"))
  {
    if (objc_msgSend(v11, "hasChangeType:", 8))
    {
      objc_msgSend(v13, "uploadIdentifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v14)
      {
        if (!_CPLSilentLogging)
        {
          __CPLStorageOSLogDomain_864();
          v21 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v28 = v11;
            _os_log_impl(&dword_1B03C2000, v21, OS_LOG_TYPE_ERROR, "Trying to reinject %@ without an upload identifier", buf, 0xCu);
          }

        }
        if (a6)
        {
          +[CPLErrors cplErrorWithCode:description:](CPLErrors, "cplErrorWithCode:description:", 100, CFSTR("Trying to reinject a resourceful change without an upload identifier"));
          v17 = 0;
          v20 = 0;
          *a6 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_19;
        }
        v17 = 0;
        goto LABEL_18;
      }
    }
  }
  -[CPLEngineStorage platformObject](self, "platformObject");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0;
  v16 = objc_msgSend(v15, "reinjectChange:dequeueOrder:discardedUploadIdentifier:overwrittenRecord:error:", v11, a4, &v26, a5, a6);
  v17 = v26;

  if (v16 && v17)
  {
    -[CPLEnginePushRepository _outgoingResources](self, "_outgoingResources");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "deleteResourcesToUploadWithUploadIdentifier:error:", v17, a6);

    if ((v19 & 1) == 0)
      goto LABEL_18;
    goto LABEL_10;
  }
  if (!v16)
  {
LABEL_18:
    v20 = 0;
    goto LABEL_19;
  }
LABEL_10:
  -[CPLBatchExtractionStrategy resetConditionallyFromNewIncomingChange:](self->_extractionStrategy, "resetConditionallyFromNewIncomingChange:", v11);
  -[CPLEnginePushRepository notePushRepositoryStoredSomeChanges](self, "notePushRepositoryStoredSomeChanges");
  v20 = 1;
LABEL_19:

  return v20;
}

- (BOOL)hasSomeChangeWithScopedIdentifier:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[CPLEngineStorage platformObject](self, "platformObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hasSomeChangeWithScopedIdentifier:", v4);

  return v6;
}

- (BOOL)discardChangeWithScopedIdentifier:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  int v8;
  id v9;
  void *v10;
  id v12;

  v6 = a3;
  -[CPLEngineStorage platformObject](self, "platformObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  v8 = objc_msgSend(v7, "deleteChangeWithScopedIdentifier:discardedUploadIdentifier:error:", v6, &v12, a4);

  v9 = v12;
  if (v8 && v9)
  {
    -[CPLEnginePushRepository _outgoingResources](self, "_outgoingResources");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v8) = objc_msgSend(v10, "deleteResourcesToUploadWithUploadIdentifier:error:", v9, a4);

  }
  return v8;
}

- (BOOL)deleteAllChangesWithError:(id *)a3
{
  void *v4;

  -[CPLEngineStorage platformObject](self, "platformObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = objc_msgSend(v4, "deleteAllChangesWithError:", a3);

  return (char)a3;
}

- (BOOL)storeExtractedBatch:(id)a3 error:(id *)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  void *v12;
  unint64_t v13;
  char v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  char v21;
  NSObject *v23;
  void *v24;
  void *v25;
  uint8_t buf[4];
  unint64_t v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if (v7)
  {
    -[CPLEngineStorage engineStore](self, "engineStore");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "clientCacheIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "clientCacheIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v11 = v9;
      objc_msgSend(v7, "clientCacheIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (unint64_t)v12;
      if (v11 && v12)
      {
        v14 = objc_msgSend((id)v11, "isEqual:", v12);

        if ((v14 & 1) == 0)
          goto LABEL_6;
      }
      else
      {

        if (v11 | v13)
        {
LABEL_6:
          if (!_CPLSilentLogging)
          {
            __CPLStorageOSLogDomain_864();
            v15 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
            {
              objc_msgSend(v7, "clientCacheIdentifier");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              v27 = v11;
              v28 = 2112;
              v29 = v16;
              _os_log_impl(&dword_1B03C2000, v15, OS_LOG_TYPE_ERROR, "Trying to store extracted batch with the wrong client cache identifier (%@ vs. %@)", buf, 0x16u);

            }
          }
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/Storage/CPLEnginePushRepository.m");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "clientCacheIdentifier");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v18, 194, CFSTR("Trying to store extracted batch with the wrong client cache identifier (%@ vs. %@)"), v11, v19);

          abort();
        }
      }
    }
    else
    {
      if (!v9)
      {
        if (!_CPLSilentLogging)
        {
          __CPLStorageOSLogDomain_864();
          v23 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1B03C2000, v23, OS_LOG_TYPE_ERROR, "Trying to store an extracted batch but we don't have a client cache identifier", buf, 2u);
          }

        }
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/Storage/CPLEnginePushRepository.m");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v25, 198, CFSTR("Trying to store an extracted batch but we don't have a client cache identifier"));

        abort();
      }
      objc_msgSend(v7, "setClientCacheIdentifier:", v9);
    }

  }
  -[CPLEngineStorage platformObject](self, "platformObject");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "storeExtractedBatch:error:", v7, a4);

  return v21;
}

- (BOOL)reinjectExtractedBatch:(id)a3 overwrittenRecordIdentifiers:(id *)a4 error:(id *)a5
{
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  void *v30;
  void *v31;
  BOOL v32;
  NSObject *v33;
  NSObject *v35;
  void *v36;
  void *v37;
  id *v38;
  void *v39;
  id v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint8_t buf[16];
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  -[CPLEngineStorage engineStore](self, "engineStore");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "resourceStorage");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "fileStorage");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setTrackAllStoresAndDeletesUntilEndOfTransaction:", 1);

  objc_msgSend(v9, "clientCacheIdentifier");
  v13 = objc_claimAutoreleasedReturnValue();
  if (!v13)
  {
    if (!_CPLSilentLogging)
    {
      __CPLStorageOSLogDomain_864();
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B03C2000, v35, OS_LOG_TYPE_ERROR, "Can't re-inject an extracted batch without a client cache identifier", buf, 2u);
      }

    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/Storage/CPLEnginePushRepository.m");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v37, 214, CFSTR("Can't re-inject an extracted batch without a client cache identifier"));

    abort();
  }
  v14 = (void *)v13;
  -[CPLEngineStorage engineStore](self, "engineStore");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "clientCacheIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16 && (objc_msgSend(v14, "isEqual:", v16) & 1) != 0)
  {
    v38 = a4;
    v39 = v14;
    v17 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v40 = v9;
    objc_msgSend(v9, "batch");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "records");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "timeIntervalSinceReferenceDate");
    v22 = v21;
    v23 = objc_msgSend(v19, "count");

    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    v24 = v19;
    v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
    if (v25)
    {
      v26 = v25;
      v27 = v23 + (uint64_t)v22;
      v28 = *(_QWORD *)v42;
      while (2)
      {
        for (i = 0; i != v26; ++i)
        {
          if (*(_QWORD *)v42 != v28)
            objc_enumerationMutation(v24);
          v30 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
          buf[0] = 0;
          if (!-[CPLEnginePushRepository reinjectChange:dequeueOrder:overwrittenRecord:error:](self, "reinjectChange:dequeueOrder:overwrittenRecord:error:", v30, v27, buf, a5))
          {

            v32 = 0;
            *v38 = objc_retainAutorelease(v17);
            goto LABEL_21;
          }
          if (buf[0])
          {
            objc_msgSend(v30, "scopedIdentifier");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "addObject:", v31);

          }
          --v27;
        }
        v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
        if (v26)
          continue;
        break;
      }
    }

    *v38 = objc_retainAutorelease(v17);
    -[CPLEnginePushRepository notePushRepositoryStoredSomeChanges](self, "notePushRepositoryStoredSomeChanges");
    v32 = 1;
LABEL_21:

    v14 = v39;
    v9 = v40;
  }
  else
  {
    if (!_CPLSilentLogging)
    {
      __CPLStorageOSLogDomain_864();
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B03C2000, v33, OS_LOG_TYPE_ERROR, "Ignoring extracted batch for re-inject because a reset sync has happened after the extraction", buf, 2u);
      }

    }
    *a4 = (id)MEMORY[0x1E0C9AA60];
    v32 = 1;
  }

  return v32;
}

- (id)storedExtractedBatch
{
  void *v2;
  void *v3;

  -[CPLEngineStorage platformObject](self, "platformObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "storedExtractedBatch");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)reinjectChange:(id)a3 priority:(unint64_t)a4 error:(id *)a5
{
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  BOOL v15;
  NSObject *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  char v23;
  uint8_t buf[4];
  id v25;
  __int16 v26;
  unint64_t v27;
  __int16 v28;
  uint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  objc_msgSend(v9, "_pushContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    if (!_CPLSilentLogging)
    {
      __CPLStorageOSLogDomain_864();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v25 = v9;
        _os_log_impl(&dword_1B03C2000, v17, OS_LOG_TYPE_ERROR, "%@ should have a push context here", buf, 0xCu);
      }

    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/Storage/CPLEnginePushRepository.m");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v19, 254, CFSTR("%@ should have a push context here"), v9);

    abort();
  }
  v11 = v10;
  if (objc_msgSend(v10, "priority") > a4)
  {
    if (!_CPLSilentLogging)
    {
      __CPLStorageOSLogDomain_864();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412802;
        v25 = v9;
        v26 = 2048;
        v27 = a4;
        v28 = 2048;
        v29 = objc_msgSend(v11, "priority");
        _os_log_impl(&dword_1B03C2000, v20, OS_LOG_TYPE_ERROR, "Trying to re-inject %@ with priority %lu while its priority is already %lu", buf, 0x20u);
      }

    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/Storage/CPLEnginePushRepository.m");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v22, 255, CFSTR("Trying to re-inject %@ with priority %lu while its priority is already %lu"), v9, a4, objc_msgSend(v11, "priority"));

    abort();
  }
  v12 = (void *)objc_msgSend(v11, "copyContextWithPriority:", a4);
  objc_msgSend(v9, "_setPushContext:", v12);
  v13 = objc_msgSend(v9, "dequeueOrder");
  v23 = 0;
  if (!_CPLSilentLogging)
  {
    __CPLStorageOSLogDomain_864();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      v25 = v9;
      v26 = 2048;
      v27 = a4;
      v28 = 2048;
      v29 = objc_msgSend(v11, "priority");
      _os_log_impl(&dword_1B03C2000, v14, OS_LOG_TYPE_DEFAULT, "Re-injecting %@ with priority %lu (previously was %lu)", buf, 0x20u);
    }

  }
  v15 = -[CPLEnginePushRepository reinjectChange:dequeueOrder:overwrittenRecord:error:](self, "reinjectChange:dequeueOrder:overwrittenRecord:error:", v9, v13, &v23, a5);

  return v15;
}

- (BOOL)resetPriorityForScopeWithIdentifier:(id)a3 maxCount:(unint64_t)a4 hasMore:(BOOL *)a5 error:(id *)a6
{
  id v10;
  void *v11;

  v10 = a3;
  -[CPLEngineStorage platformObject](self, "platformObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a6) = objc_msgSend(v11, "resetPriorityForScopeWithIdentifier:maxCount:hasMore:error:", v10, a4, a5, a6);

  return (char)a6;
}

- (id)checkOutBatchStorageWithPriority:(unint64_t)a3 error:(id *)a4
{
  void *v6;
  void *v7;

  -[CPLEngineStorage platformObject](self, "platformObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "checkOutBatchStorageWithPriority:error:", a3, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)checkInBatchStorage:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;

  v6 = a3;
  -[CPLEngineStorage platformObject](self, "platformObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = objc_msgSend(v7, "checkInBatchStorage:error:", v6, a4);

  return (char)a4;
}

- (void)setExtractionStrategy:(id)a3
{
  CPLBatchExtractionStrategy *v5;
  CPLBatchExtractionStrategy *extractionStrategy;
  void *lastStrategyName;
  NSString *v8;
  NSString *v9;
  CPLBatchExtractionStrategy *v10;

  v5 = (CPLBatchExtractionStrategy *)a3;
  extractionStrategy = self->_extractionStrategy;
  if (extractionStrategy != v5)
  {
    v10 = v5;
    if (v5)
    {
      lastStrategyName = self->_lastStrategyName;
      self->_lastStrategyName = 0;
    }
    else
    {
      -[CPLBatchExtractionStrategy name](extractionStrategy, "name");
      lastStrategyName = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (NSString *)objc_msgSend(lastStrategyName, "copy");
      v9 = self->_lastStrategyName;
      self->_lastStrategyName = v8;

    }
    objc_storeStrong((id *)&self->_extractionStrategy, a3);
    v5 = v10;
  }

}

- (CPLBatchExtractionStrategy)extractionStrategy
{
  return self->_extractionStrategy;
}

- (id)changeWithScopedIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[CPLEngineStorage platformObject](self, "platformObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "changeWithScopedIdentifier:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)allChangesWithClass:(Class)a3 relatedScopedIdentifier:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a4;
  -[CPLEngineStorage platformObject](self, "platformObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "allChangesWithClass:relatedScopedIdentifier:", a3, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)allChangesWithScopeIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[CPLEngineStorage platformObject](self, "platformObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allChangesWithScopeIdentifier:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)hasChangesWithRelatedScopedIdentifier:(id)a3 class:(Class)a4
{
  id v6;
  void *v7;

  v6 = a3;
  -[CPLEngineStorage platformObject](self, "platformObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = objc_msgSend(v7, "hasChangesWithRelatedScopedIdentifier:class:", v6, a4);

  return (char)a4;
}

- (BOOL)hasAnyChangeWithRelatedScopedIdentifier:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[CPLEngineStorage platformObject](self, "platformObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hasAnyChangeWithRelatedScopedIdentifier:", v4);

  return v6;
}

- (void)updateApproximativeUploadRate:(double)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *uploadRateQueue;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[16];

  if (a3 > 0.0)
  {
    v15[6] = v6;
    v15[7] = v5;
    v15[14] = v3;
    v15[15] = v4;
    uploadRateQueue = self->_uploadRateQueue;
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __57__CPLEnginePushRepository_updateApproximativeUploadRate___block_invoke;
    v15[3] = &unk_1E60D6DF8;
    v15[4] = self;
    *(double *)&v15[5] = a3;
    dispatch_async(uploadRateQueue, v15);
    -[CPLEngineStorage engineStore](self, "engineStore");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "engineLibrary");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "scheduler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "predictor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", (uint64_t)a3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "updatePredictedValue:forType:", v14, CFSTR("uploadSpeed"));

  }
}

- (unint64_t)maximumResourceSizePerBatchForRemainingTime:(double)a3
{
  void *v5;
  void *v6;
  void *v7;
  char v8;
  unint64_t v9;
  NSObject *uploadRateQueue;
  _QWORD block[7];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;

  -[CPLEngineStorage engineStore](self, "engineStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "engineLibrary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "systemMonitor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v7, "isOnCellularOrUnknown"))
  {
    if (a3 < 10.0)
    {
      v9 = 10485760;
      goto LABEL_8;
    }
LABEL_7:
    v13 = 0;
    v14 = &v13;
    v15 = 0x2020000000;
    v16 = 0;
    uploadRateQueue = self->_uploadRateQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __71__CPLEnginePushRepository_maximumResourceSizePerBatchForRemainingTime___block_invoke;
    block[3] = &unk_1E60D7890;
    block[4] = self;
    block[5] = &v13;
    block[6] = fmin(a3, 120.0);
    dispatch_sync(uploadRateQueue, block);
    v9 = v14[3];
    _Block_object_dispose(&v13, 8);
    goto LABEL_8;
  }
  v8 = objc_msgSend(v7, "isDataBudgetOverriden");
  v9 = 10485760;
  if (a3 >= 10.0 && (v8 & 1) != 0)
    goto LABEL_7;
LABEL_8:

  return v9;
}

- (void)updateTimingStatisticForKey:(id)a3 duration:(double)a4 recordCount:(unint64_t)a5 error:(BOOL)a6 cancelled:(BOOL)a7
{
  id v12;
  NSObject *timingStatisticQueue;
  id v14;
  _QWORD block[5];
  id v16;
  double v17;
  unint64_t v18;
  BOOL v19;
  BOOL v20;

  v12 = a3;
  timingStatisticQueue = self->_timingStatisticQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __92__CPLEnginePushRepository_updateTimingStatisticForKey_duration_recordCount_error_cancelled___block_invoke;
  block[3] = &unk_1E60D78B8;
  block[4] = self;
  v16 = v12;
  v17 = a4;
  v18 = a5;
  v19 = a6;
  v20 = a7;
  v14 = v12;
  dispatch_sync(timingStatisticQueue, block);

}

- (id)_timingStatisticStatuses
{
  NSObject *timingStatisticQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__841;
  v10 = __Block_byref_object_dispose__842;
  v11 = 0;
  timingStatisticQueue = self->_timingStatisticQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __51__CPLEnginePushRepository__timingStatisticStatuses__block_invoke;
  v5[3] = &unk_1E60DC8A0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(timingStatisticQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (BOOL)getRelatedScopedIdentifier:(id *)a3 forRecordWithScopedIdentifier:(id)a4
{
  id v6;
  void *v7;

  v6 = a4;
  -[CPLEngineStorage platformObject](self, "platformObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = objc_msgSend(v7, "getRelatedScopedIdentifier:forRecordWithScopedIdentifier:", a3, v6);

  return (char)a3;
}

- (id)countPerFlagsForScopeWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[CPLEngineStorage platformObject](self, "platformObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "countPerFlagsForScopeWithIdentifier:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)scopedIdentifiersForChangesWithFlag:(int64_t)a3 forScopeWithIdentifier:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a4;
  -[CPLEngineStorage platformObject](self, "platformObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "scopedIdentifiersForChangesWithFlag:forScopeWithIdentifier:", a3, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)deleteSharingFlagsWithMaxCount:(unint64_t)a3 deletedCount:(unint64_t *)a4 error:(id *)a5
{
  void *v8;

  -[CPLEngineStorage platformObject](self, "platformObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a5) = objc_msgSend(v8, "deleteSharingFlagsWithMaxCount:deletedCount:error:", a3, a4, a5);

  return (char)a5;
}

- (id)contributorsUpdatesForScopeWithIdentifier:(id)a3 maxCount:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  -[CPLEngineStorage platformObject](self, "platformObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "contributorsUpdatesForScopeWithIdentifier:maxCount:", v6, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)acknowledgeContributorsUpdates:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;

  v6 = a3;
  -[CPLEngineStorage platformObject](self, "platformObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = objc_msgSend(v7, "acknowledgeContributorsUpdates:error:", v6, a4);

  return (char)a4;
}

- (void)addPushObserver:(id)a3 withIdentifier:(id)a4
{
  id v6;
  NSMutableDictionary *v7;
  NSMutableDictionary *pushObservers;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  if (!self->_pushObservers)
  {
    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    pushObservers = self->_pushObservers;
    self->_pushObservers = v7;

  }
  v9 = (void *)objc_msgSend(v11, "copy");
  v10 = (void *)MEMORY[0x1B5E08DC4]();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_pushObservers, "setObject:forKeyedSubscript:", v10, v6);

}

- (void)removePushObserverWithIdentifier:(id)a3
{
  -[NSMutableDictionary removeObjectForKey:](self->_pushObservers, "removeObjectForKey:", a3);
}

- (id)status
{
  void *v3;
  void *v4;
  CPLBatchExtractionStrategy *extractionStrategy;
  void *v6;
  void *v7;
  NSObject *uploadRateQueue;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD block[5];
  id v18;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)CPLEnginePushRepository;
  -[CPLEngineStorage status](&v19, sel_status);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  extractionStrategy = self->_extractionStrategy;
  if (extractionStrategy)
  {
    -[CPLBatchExtractionStrategy name](extractionStrategy, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPLBatchExtractionStrategy currentStepDescription](self->_extractionStrategy, "currentStepDescription");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendFormat:", CFSTR("\nCurrent strategy: %@ (step: %@)"), v6, v7);

  }
  else if (self->_lastStrategyName)
  {
    objc_msgSend(v4, "appendFormat:", CFSTR("\nLast strategy: %@"), self->_lastStrategyName);
  }
  uploadRateQueue = self->_uploadRateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __33__CPLEnginePushRepository_status__block_invoke;
  block[3] = &unk_1E60D6F88;
  block[4] = self;
  v9 = v4;
  v18 = v9;
  dispatch_sync(uploadRateQueue, block);
  objc_msgSend(MEMORY[0x1E0CB34E8], "stringFromByteCount:countStyle:", -[CPLEnginePushRepository maximumResourceSizePerBatchForRemainingTime:](self, "maximumResourceSizePerBatchForRemainingTime:", 3600.0), 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "appendFormat:", CFSTR("\nBatch max size: %@"), v10);

  -[CPLEnginePushRepository _timingStatisticStatuses](self, "_timingStatisticStatuses");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "count"))
  {
    objc_msgSend(v11, "componentsJoinedByString:", CFSTR("\n\t"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "appendFormat:", CFSTR("\nTiming stats:\n\t%@"), v12);

  }
  if (-[NSMutableDictionary count](self->_pushObservers, "count"))
  {
    -[NSMutableDictionary allKeys](self->_pushObservers, "allKeys");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "componentsJoinedByString:", CFSTR(", "));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "appendFormat:", CFSTR("\nObservers: %@"), v14);

  }
  v15 = v9;

  return v15;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pushObservers, 0);
  objc_storeStrong((id *)&self->_timingStatistics, 0);
  objc_storeStrong((id *)&self->_lastUploadRateUpdateDate, 0);
  objc_storeStrong((id *)&self->_timingStatisticQueue, 0);
  objc_storeStrong((id *)&self->_uploadRateQueue, 0);
  objc_storeStrong((id *)&self->_lastStrategyName, 0);
  objc_storeStrong((id *)&self->_extractionStrategy, 0);
  objc_storeStrong((id *)&self->_propertiesPerClass, 0);
}

void __33__CPLEnginePushRepository_status__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v3;
  void *v4;
  id v5;

  v1 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v1 + 80))
  {
    v3 = *(void **)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0CB34E8], "stringFromByteCount:countStyle:", (uint64_t)*(double *)(v1 + 96), 1);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    +[CPLDateFormatter stringFromDateAgo:now:](CPLDateFormatter, "stringFromDateAgo:now:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80), 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("\nLast approx. upload rate: %@/s - %@"), v5, v4);

  }
}

uint64_t __51__CPLEnginePushRepository__timingStatisticStatuses__block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[5];

  if (*(_QWORD *)(*(_QWORD *)(result + 32) + 88))
  {
    v1 = result;
    v2 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(*(_QWORD *)(result + 32) + 88), "count"));
    v3 = *(_QWORD *)(*(_QWORD *)(v1 + 40) + 8);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = v2;

    v5 = *(_QWORD *)(v1 + 40);
    v6 = *(void **)(*(_QWORD *)(v1 + 32) + 88);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __51__CPLEnginePushRepository__timingStatisticStatuses__block_invoke_2;
    v7[3] = &unk_1E60D78E0;
    v7[4] = v5;
    return objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v7);
  }
  return result;
}

void __51__CPLEnginePushRepository__timingStatisticStatuses__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  objc_class *v5;
  id v6;
  id v7;
  id v8;

  v4 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  v5 = (objc_class *)MEMORY[0x1E0CB3940];
  v6 = a3;
  v7 = a2;
  v8 = (id)objc_msgSend([v5 alloc], "initWithFormat:", CFSTR("%@: %@"), v7, v6);

  objc_msgSend(v4, "addObject:", v8);
}

void __92__CPLEnginePushRepository_updateTimingStatisticForKey_duration_recordCount_error_cancelled___block_invoke(uint64_t a1)
{
  void *v2;
  _CPLTimingStatistic *v3;
  id v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    v3 = objc_alloc_init(_CPLTimingStatistic);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "setObject:forKeyedSubscript:", v3, *(_QWORD *)(a1 + 40));
    v2 = v3;
  }
  v4 = v2;
  objc_msgSend(v2, "updateWithDuration:recordCount:error:cancelled:", *(_QWORD *)(a1 + 56), *(unsigned __int8 *)(a1 + 64), *(unsigned __int8 *)(a1 + 65), *(double *)(a1 + 48));

}

void *__71__CPLEnginePushRepository_maximumResourceSizePerBatchForRemainingTime___block_invoke(uint64_t a1)
{
  void *result;
  double v3;
  unint64_t v4;

  result = *(void **)(*(_QWORD *)(a1 + 32) + 80);
  if (result && (result = (void *)objc_msgSend(result, "timeIntervalSinceNow"), v3 >= -600.0))
  {
    v4 = (unint64_t)(*(double *)(*(_QWORD *)(a1 + 32) + 96) * *(double *)(a1 + 48));
    if (v4 >= 0x6400000)
      v4 = 104857600;
    if (v4 <= 0xA00000)
      v4 = 10485760;
  }
  else
  {
    v4 = 10485760;
  }
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v4;
  return result;
}

double __57__CPLEnginePushRepository_updateApproximativeUploadRate___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  double result;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 80);
  *(_QWORD *)(v3 + 80) = v2;

  result = *(double *)(a1 + 40);
  *(double *)(*(_QWORD *)(a1 + 32) + 96) = result;
  return result;
}

uint64_t __57__CPLEnginePushRepository_storeChange_pushContext_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(a3 + 16))(a3, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

@end
