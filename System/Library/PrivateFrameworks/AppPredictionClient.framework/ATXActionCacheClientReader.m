@implementation ATXActionCacheClientReader

- (ATXActionCacheClientReader)initWithData:(id)a3
{
  void *v4;
  ATXActionCacheClientReader *v5;

  ATXCacheFileSplitChunks();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[ATXActionCacheClientReader initWithChunks:](self, "initWithChunks:", v4);

  return v5;
}

- (ATXActionCacheClientReader)initWithChunks:(id)a3
{
  id v4;
  ATXActionCacheClientReader *v5;
  uint64_t v6;
  uint64_t v7;
  NSData *scoredActionsChunk;
  uint64_t v9;
  NSObject *p_super;
  uint64_t v11;
  objc_super v13;
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ATXActionCacheClientReader;
  v5 = -[ATXActionCacheClientReader init](&v13, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "count");
    if (v6 == -[ATXActionCacheClientReader chunkCount](v5, "chunkCount"))
    {
      objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
      v7 = objc_claimAutoreleasedReturnValue();
      scoredActionsChunk = v5->_scoredActionsChunk;
      v5->_scoredActionsChunk = (NSData *)v7;

      -[ATXActionCacheClientReader _getLockScreenPredictionIndices:](v5, "_getLockScreenPredictionIndices:", v4);
      v9 = objc_claimAutoreleasedReturnValue();
      p_super = &v5->_lockscreenPredictionIndices->super;
      v5->_lockscreenPredictionIndices = (NSIndexSet *)v9;
    }
    else
    {
      __atxlog_handle_default();
      p_super = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT))
      {
        v11 = objc_msgSend(v4, "count");
        *(_DWORD *)buf = 134218240;
        v15 = v11;
        v16 = 1024;
        v17 = 4;
        _os_log_impl(&dword_1A49EF000, p_super, OS_LOG_TYPE_DEFAULT, "Wrong number of chunks returned from cache. Cache had %lu chunks, expected %i (this may be due to a cache change)", buf, 0x12u);
      }
    }

  }
  return v5;
}

- (unint64_t)chunkCount
{
  return 4;
}

- (id)actionsWithConsumerSubType:(unsigned __int8)a3 limit:(int64_t)a4
{
  void *v5;
  void *v6;
  unint64_t v7;
  void *v8;
  NSObject *v9;

  if (self->_lockscreenPredictionIndices)
  {
    if (a3 == 22)
    {
      -[ATXActionCacheClientReader lockscreenPredictionIndicesUpToLimit:](self, "lockscreenPredictionIndicesUpToLimit:", a4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v5, "count"))
      {
        -[ATXActionCacheClientReader actionsWithLimit:shouldFilterRestrictedAppsAndRecentEngagements:](self, "actionsWithLimit:shouldFilterRestrictedAppsAndRecentEngagements:", objc_msgSend(v5, "lastIndex") + 1, 0);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = objc_msgSend(v5, "lastIndex");
        if (v7 >= objc_msgSend(v6, "count"))
        {
          __atxlog_handle_default();
          v9 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
            -[ATXActionCacheClientReader actionsWithConsumerSubType:limit:].cold.1(v5, v6, v9);

          v8 = (void *)MEMORY[0x1E0C9AA60];
        }
        else
        {
          objc_msgSend(v6, "objectsAtIndexes:", v5);
          v8 = (void *)objc_claimAutoreleasedReturnValue();
        }

      }
      else
      {
        v8 = (void *)MEMORY[0x1E0C9AA60];
      }

    }
    else
    {
      -[ATXActionCacheClientReader actionsWithLimit:shouldFilterRestrictedAppsAndRecentEngagements:](self, "actionsWithLimit:shouldFilterRestrictedAppsAndRecentEngagements:", a4, 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v8 = (void *)MEMORY[0x1E0C9AA60];
  }
  return v8;
}

- (id)lockscreenPredictionIndicesUpToLimit:(int64_t)a3
{
  NSIndexSet *v5;
  void *v6;
  NSIndexSet *lockscreenPredictionIndices;
  id v8;
  NSIndexSet *v9;
  _QWORD v11[4];
  id v12;
  int64_t v13;

  v5 = self->_lockscreenPredictionIndices;
  if (-[NSIndexSet count](self->_lockscreenPredictionIndices, "count") > a3)
  {
    v6 = (void *)objc_opt_new();
    lockscreenPredictionIndices = self->_lockscreenPredictionIndices;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __67__ATXActionCacheClientReader_lockscreenPredictionIndicesUpToLimit___block_invoke;
    v11[3] = &unk_1E4D57D78;
    v8 = v6;
    v12 = v8;
    v13 = a3;
    -[NSIndexSet enumerateIndexesUsingBlock:](lockscreenPredictionIndices, "enumerateIndexesUsingBlock:", v11);
    v9 = (NSIndexSet *)v8;

    v5 = v9;
  }
  return v5;
}

unint64_t __67__ATXActionCacheClientReader_lockscreenPredictionIndicesUpToLimit___block_invoke(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  unint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "count");
  if (result < *(_QWORD *)(a1 + 40))
    return objc_msgSend(*(id *)(a1 + 32), "addIndex:", a2);
  *a3 = 1;
  return result;
}

- (id)_predicateForInstalledAndNonEngagedPredictions:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v3 = a3;
  v4 = (void *)MEMORY[0x1E0CB3880];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __77__ATXActionCacheClientReader__predicateForInstalledAndNonEngagedPredictions___block_invoke;
  v8[3] = &unk_1E4D57DA0;
  v9 = v3;
  v5 = v3;
  objc_msgSend(v4, "predicateWithBlock:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

BOOL __77__ATXActionCacheClientReader__predicateForInstalledAndNonEngagedPredictions___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  _BOOL8 v4;
  void *v5;

  objc_msgSend(a2, "predictedItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:", v3) & 1) != 0)
  {
    v4 = 0;
  }
  else
  {
    objc_msgSend(v3, "bundleId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = +[ATXApplicationRecord isInstalledAndNotRestrictedForBundle:](ATXApplicationRecord, "isInstalledAndNotRestrictedForBundle:", v5);

  }
  return v4;
}

- (id)actionsWithLimit:(int64_t)a3 shouldFilterRestrictedAppsAndRecentEngagements:(BOOL)a4
{
  _BOOL4 v5;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  if (self->_scoredActionsChunk)
  {
    v5 = a4;
    +[ATXPredictionSetReader actionReader:](ATXPredictionSetReader, "actionReader:");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v8 = (void *)objc_opt_new();
      objc_msgSend(v8, "recentActions");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[ATXActionCacheClientReader _predicateForInstalledAndNonEngagedPredictions:](self, "_predicateForInstalledAndNonEngagedPredictions:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v10 = 0;
    }
    objc_msgSend(v7, "readScoredPredictionsWithLimit:filterPredicate:", a3, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = (void *)MEMORY[0x1E0C9AA60];
  }
  return v11;
}

- (id)_getLockScreenPredictionIndices:(id)a3
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t *Integer;
  void *v11;
  void *v13;
  uint64_t v14;

  v5 = a3;
  if ((unint64_t)objc_msgSend(v5, "count") <= 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ATXActionCacheClientReader.m"), 129, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("chunks.count >= 2"));

  }
  objc_msgSend(v5, "objectAtIndexedSubscript:", 1);
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v14 = objc_msgSend(v6, "bytes");
  v7 = objc_retainAutorelease(v6);
  v8 = objc_msgSend(v7, "bytes");
  v9 = v8 + objc_msgSend(v7, "length");
  Integer = ATXCacheReadInteger((unint64_t *)&v14, v9);
  v11 = (void *)objc_opt_new();
  if ((uint64_t)Integer >= 1)
  {
    do
    {
      objc_msgSend(v11, "addIndex:", ATXCacheReadInteger((unint64_t *)&v14, v9));
      Integer = (unint64_t *)((char *)Integer - 1);
    }
    while (Integer);
  }

  return v11;
}

- (NSIndexSet)lockscreenPredictionIndices
{
  return self->_lockscreenPredictionIndices;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lockscreenPredictionIndices, 0);
  objc_storeStrong((id *)&self->_scoredActionsChunk, 0);
}

- (void)actionsWithConsumerSubType:(NSObject *)a3 limit:.cold.1(void *a1, void *a2, NSObject *a3)
{
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v5 = 134218240;
  v6 = objc_msgSend(a1, "lastIndex");
  v7 = 2048;
  v8 = objc_msgSend(a2, "count");
  _os_log_error_impl(&dword_1A49EF000, a3, OS_LOG_TYPE_ERROR, "Index %lu out of bounds for predictions with count %lu", (uint8_t *)&v5, 0x16u);
}

@end
