@implementation CPLUploadComputeStatesAccumulator

- (CPLUploadComputeStatesAccumulator)initWithCapacity:(unint64_t)a3 maximumPayloadRequestsBatchSize:(unint64_t)a4
{
  CPLUploadComputeStatesAccumulator *v6;
  CPLUploadComputeStatesAccumulator *v7;
  uint64_t v8;
  NSMutableDictionary *localComputeStatesToUpload;
  uint64_t v10;
  NSMutableDictionary *cloudComputeStatesToUpload;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)CPLUploadComputeStatesAccumulator;
  v6 = -[CPLUploadComputeStatesAccumulator init](&v13, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_capacity = a3;
    v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", v6->_capacity);
    localComputeStatesToUpload = v7->_localComputeStatesToUpload;
    v7->_localComputeStatesToUpload = (NSMutableDictionary *)v8;

    v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", v7->_capacity);
    cloudComputeStatesToUpload = v7->_cloudComputeStatesToUpload;
    v7->_cloudComputeStatesToUpload = (NSMutableDictionary *)v10;

    v7->_maximumPayloadRequestsBatchSize = a4;
  }
  return v7;
}

- (void)addLocalComputeStateToUpload:(id)a3 cloudComputeState:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "itemScopedIdentifier");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_localComputeStatesToUpload, "setObject:forKeyedSubscript:", v7, v8);

  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_cloudComputeStatesToUpload, "setObject:forKeyedSubscript:", v6, v8);
}

- (void)requestPayloadForLocalComputeState:(id)a3 cloudComputeState:(id)a4
{
  id v7;
  void *v8;
  NSMutableDictionary *currentBatchOfComputeStatesNeedingPayload;
  NSMutableDictionary *v10;
  NSMutableDictionary *v11;
  NSMutableDictionary *v12;
  NSMutableDictionary *v13;
  id v14;
  unint64_t capacity;
  unint64_t maximumPayloadRequestsBatchSize;
  uint64_t v17;
  NSMutableArray *v18;
  NSMutableArray *batchedLocalComputeStatesNeedingPayload;
  NSMutableDictionary *v20;
  NSMutableDictionary *cloudComputeStatesNeedingPayload;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  id v26;
  uint8_t buf[16];

  v26 = a3;
  v7 = a4;
  if (self->_batchEnumerator)
  {
    if (!_CPLSilentLogging)
    {
      __CPLGenericOSLogDomain();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B03C2000, v23, OS_LOG_TYPE_ERROR, "Trying to enqueue compute states while we are already enumerating batches", buf, 2u);
      }

    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/Upload Compute State Phase/CPLUploadComputeStatesAccumulator.m");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v25, 52, CFSTR("Trying to enqueue compute states while we are already enumerating batches"));

    abort();
  }
  v8 = v7;
  currentBatchOfComputeStatesNeedingPayload = self->_currentBatchOfComputeStatesNeedingPayload;
  if (currentBatchOfComputeStatesNeedingPayload)
  {
    if (-[NSMutableDictionary count](currentBatchOfComputeStatesNeedingPayload, "count") >= self->_maximumPayloadRequestsBatchSize)
    {
      v10 = (NSMutableDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", self->_maximumPayloadRequestsBatchSize);
      v11 = self->_currentBatchOfComputeStatesNeedingPayload;
      self->_currentBatchOfComputeStatesNeedingPayload = v10;

      -[NSMutableArray addObject:](self->_batchedLocalComputeStatesNeedingPayload, "addObject:", self->_currentBatchOfComputeStatesNeedingPayload);
    }
  }
  else
  {
    v12 = (NSMutableDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", self->_maximumPayloadRequestsBatchSize);
    v13 = self->_currentBatchOfComputeStatesNeedingPayload;
    self->_currentBatchOfComputeStatesNeedingPayload = v12;

    v14 = objc_alloc(MEMORY[0x1E0C99DE8]);
    capacity = self->_capacity;
    maximumPayloadRequestsBatchSize = self->_maximumPayloadRequestsBatchSize;
    if (maximumPayloadRequestsBatchSize > capacity)
      v17 = 1;
    else
      v17 = capacity / maximumPayloadRequestsBatchSize;
    v18 = (NSMutableArray *)objc_msgSend(v14, "initWithCapacity:", v17);
    batchedLocalComputeStatesNeedingPayload = self->_batchedLocalComputeStatesNeedingPayload;
    self->_batchedLocalComputeStatesNeedingPayload = v18;

    -[NSMutableArray addObject:](self->_batchedLocalComputeStatesNeedingPayload, "addObject:", self->_currentBatchOfComputeStatesNeedingPayload);
    v20 = (NSMutableDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", self->_maximumPayloadRequestsBatchSize);
    cloudComputeStatesNeedingPayload = self->_cloudComputeStatesNeedingPayload;
    self->_cloudComputeStatesNeedingPayload = v20;

  }
  objc_msgSend(v26, "itemScopedIdentifier");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_currentBatchOfComputeStatesNeedingPayload, "setObject:forKeyedSubscript:", v26, v22);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_cloudComputeStatesNeedingPayload, "setObject:forKeyedSubscript:", v8, v22);

}

- (BOOL)hasEnqueuedComputeStatesToUpload
{
  return -[NSMutableDictionary count](self->_cloudComputeStatesToUpload, "count")
      || -[NSMutableDictionary count](self->_cloudComputeStatesNeedingPayload, "count") != 0;
}

- (id)popNextBatchOfLocalComputeStatesNeedingPayload
{
  NSEnumerator *batchEnumerator;
  NSEnumerator *v4;
  NSEnumerator *v5;
  NSMutableDictionary *v6;
  NSMutableDictionary *currentBatchOfComputeStatesNeedingPayload;

  batchEnumerator = self->_batchEnumerator;
  if (!batchEnumerator)
  {
    -[NSMutableArray objectEnumerator](self->_batchedLocalComputeStatesNeedingPayload, "objectEnumerator");
    v4 = (NSEnumerator *)objc_claimAutoreleasedReturnValue();
    v5 = self->_batchEnumerator;
    self->_batchEnumerator = v4;

    batchEnumerator = self->_batchEnumerator;
  }
  -[NSEnumerator nextObject](batchEnumerator, "nextObject");
  v6 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
  currentBatchOfComputeStatesNeedingPayload = self->_currentBatchOfComputeStatesNeedingPayload;
  self->_currentBatchOfComputeStatesNeedingPayload = v6;

  return (id)-[NSMutableDictionary allValues](self->_currentBatchOfComputeStatesNeedingPayload, "allValues");
}

- (id)localComputeStatesToDropAfterClientProvidedPayloadForLocalComputeStates:(id)a3
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  NSObject *v20;
  void *v21;
  void *v22;
  const __CFString *v23;
  void *v24;
  SEL v25;
  CPLUploadComputeStatesAccumulator *v26;
  void *v27;
  uint64_t v28;
  NSObject *v29;
  NSObject *v30;
  void *v31;
  SEL v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint8_t buf[4];
  void *v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!self->_batchEnumerator)
  {
    if (!_CPLSilentLogging)
    {
      __CPLGenericOSLogDomain();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B03C2000, v29, OS_LOG_TYPE_ERROR, "Trying to update payload of compute states without having started enumerating the batches", buf, 2u);
      }

    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/Upload Compute State Phase/CPLUploadComputeStatesAccumulator.m");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = CFSTR("Trying to update payload of compute states without having started enumerating the batches");
    v24 = v21;
    v25 = a2;
    v26 = self;
    v27 = v22;
    v28 = 84;
LABEL_29:
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", v25, v26, v27, v28, v23, v31);

    abort();
  }
  if (!self->_currentBatchOfComputeStatesNeedingPayload)
  {
    if (!_CPLSilentLogging)
    {
      __CPLGenericOSLogDomain();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B03C2000, v30, OS_LOG_TYPE_ERROR, "Trying to update payload without a batch", buf, 2u);
      }

    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/Upload Compute State Phase/CPLUploadComputeStatesAccumulator.m");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = CFSTR("Trying to update payload without a batch");
    v24 = v21;
    v25 = a2;
    v26 = self;
    v27 = v22;
    v28 = 85;
    goto LABEL_29;
  }
  v32 = a2;
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v34 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
        objc_msgSend(v11, "fileURL");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
        {
          objc_msgSend(v11, "itemScopedIdentifier");
          v13 = objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary objectForKeyedSubscript:](self->_currentBatchOfComputeStatesNeedingPayload, "objectForKeyedSubscript:", v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = v14;
          if (v14)
          {
            objc_msgSend(v14, "setFileURL:", v12);
            -[NSMutableDictionary objectForKeyedSubscript:](self->_cloudComputeStatesNeedingPayload, "objectForKeyedSubscript:", v13);
            v16 = objc_claimAutoreleasedReturnValue();
            if (!v16)
            {
              if (!_CPLSilentLogging)
              {
                __CPLGenericOSLogDomain();
                v20 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412290;
                  v38 = v15;
                  _os_log_impl(&dword_1B03C2000, v20, OS_LOG_TYPE_ERROR, "Missing cloud compute state for %@", buf, 0xCu);
                }

              }
              objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/Upload Compute State Phase/CPLUploadComputeStatesAccumulator.m");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              v31 = v15;
              v23 = CFSTR("Missing cloud compute state for %@");
              v24 = v21;
              v25 = v32;
              v26 = self;
              v27 = v22;
              v28 = 100;
              goto LABEL_29;
            }
            v17 = v16;
            -[NSObject setFileURL:](v16, "setFileURL:", v12);
            -[CPLUploadComputeStatesAccumulator addLocalComputeStateToUpload:cloudComputeState:](self, "addLocalComputeStateToUpload:cloudComputeState:", v15, v17);
            -[NSMutableDictionary removeObjectForKey:](self->_currentBatchOfComputeStatesNeedingPayload, "removeObjectForKey:", v13);
LABEL_18:

          }
          else if (!_CPLSilentLogging)
          {
            __CPLBatchOSLogDomain();
            v17 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v38 = v11;
              _os_log_impl(&dword_1B03C2000, v17, OS_LOG_TYPE_ERROR, "Client provided a file URL for an unknown %@", buf, 0xCu);
            }
            goto LABEL_18;
          }

          goto LABEL_20;
        }
        if (_CPLSilentLogging)
          goto LABEL_21;
        __CPLBatchOSLogDomain();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v38 = v11;
          _os_log_impl(&dword_1B03C2000, v13, OS_LOG_TYPE_ERROR, "Client provided no file URL for %@", buf, 0xCu);
        }
LABEL_20:

LABEL_21:
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
    }
    while (v8);
  }

  -[NSMutableDictionary allValues](self->_currentBatchOfComputeStatesNeedingPayload, "allValues");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (unint64_t)countOfCloudComputeStatesToUpload
{
  return -[NSMutableDictionary count](self->_cloudComputeStatesToUpload, "count");
}

- (NSArray)cloudComputeStatesToUpload
{
  return (NSArray *)-[NSMutableDictionary allValues](self->_cloudComputeStatesToUpload, "allValues");
}

- (void)enumerateUploadedComputeStateWithBlock:(id)a3
{
  id v4;
  NSMutableDictionary *localComputeStatesToUpload;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  localComputeStatesToUpload = self->_localComputeStatesToUpload;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __76__CPLUploadComputeStatesAccumulator_enumerateUploadedComputeStateWithBlock___block_invoke;
  v7[3] = &unk_1E60D7B90;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](localComputeStatesToUpload, "enumerateKeysAndObjectsUsingBlock:", v7);

}

- (unint64_t)maximumPayloadRequestsBatchSize
{
  return self->_maximumPayloadRequestsBatchSize;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_batchEnumerator, 0);
  objc_storeStrong((id *)&self->_currentBatchOfComputeStatesNeedingPayload, 0);
  objc_storeStrong((id *)&self->_batchedLocalComputeStatesNeedingPayload, 0);
  objc_storeStrong((id *)&self->_cloudComputeStatesNeedingPayload, 0);
  objc_storeStrong((id *)&self->_cloudComputeStatesToUpload, 0);
  objc_storeStrong((id *)&self->_localComputeStatesToUpload, 0);
}

void __76__CPLUploadComputeStatesAccumulator_enumerateUploadedComputeStateWithBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  uint64_t v6;
  void *v7;
  id v8;
  id v9;

  v6 = *(_QWORD *)(a1 + 40);
  v7 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  v8 = a3;
  objc_msgSend(v7, "objectForKeyedSubscript:", a2);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, id, uint64_t))(v6 + 16))(v6, v8, v9, a4);

}

@end
