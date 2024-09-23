@implementation FCStreamingResults

- (FCStreamingResults)initWithStream:(id)a3
{
  id v5;
  FCStreamingResults *v6;
  FCStreamingResults *v7;
  NSMutableArray *v8;
  NSMutableArray *results;
  FCAsyncSerialQueue *v10;
  FCAsyncSerialQueue *serialQueue;
  uint64_t v12;
  NSHashTable *observers;
  void *v15;
  objc_super v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "stream != nil");
    *(_DWORD *)buf = 136315906;
    v18 = "-[FCStreamingResults initWithStream:]";
    v19 = 2080;
    v20 = "FCStreamingResults.m";
    v21 = 1024;
    v22 = 33;
    v23 = 2114;
    v24 = v15;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v16.receiver = self;
  v16.super_class = (Class)FCStreamingResults;
  v6 = -[FCStreamingResults init](&v16, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_underlyingStream, a3);
    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    results = v7->_results;
    v7->_results = v8;

    v10 = objc_alloc_init(FCAsyncSerialQueue);
    serialQueue = v7->_serialQueue;
    v7->_serialQueue = v10;

    objc_msgSend(MEMORY[0x1E0CB3690], "hashTableWithOptions:", 517);
    v12 = objc_claimAutoreleasedReturnValue();
    observers = v7->_observers;
    v7->_observers = (NSHashTable *)v12;

  }
  return v7;
}

- (FCStreamingResults)init
{
  void *v3;
  FCStreamingResults *v4;

  v3 = (void *)objc_opt_new();
  v4 = -[FCStreamingResults initWithStream:](self, "initWithStream:", v3);

  return v4;
}

- (FCStreamingResults)initWithResults:(id)a3 followedByStream:(id)a4
{
  id v6;
  id v7;
  FCStreamingResults *v8;
  FCStreamingResults *v9;
  void *v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!v7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "stream != nil");
    *(_DWORD *)buf = 136315906;
    v13 = "-[FCStreamingResults initWithResults:followedByStream:]";
    v14 = 2080;
    v15 = "FCStreamingResults.m";
    v16 = 1024;
    v17 = 48;
    v18 = 2114;
    v19 = v11;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v8 = -[FCStreamingResults initWithStream:](self, "initWithStream:", v7);
  v9 = v8;
  if (v6 && v8)
    -[NSMutableArray addObjectsFromArray:](v8->_results, "addObjectsFromArray:", v6);

  return v9;
}

- (BOOL)isFinished
{
  void *v2;
  char v3;

  -[FCStreamingResults underlyingStream](self, "underlyingStream");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isFinished");

  return v3;
}

- (unint64_t)count
{
  void *v3;
  unint64_t v4;

  objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
  -[FCStreamingResults results](self, "results");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  return v4;
}

- (_NSRange)range
{
  NSUInteger v3;
  NSUInteger v4;
  _NSRange result;

  objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
  v3 = -[FCStreamingResults count](self, "count");
  v4 = 0;
  result.length = v3;
  result.location = v4;
  return result;
}

- (id)objectAtIndex:(unint64_t)a3
{
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
  -[FCStreamingResults results](self, "results");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6 <= a3)
  {
    v8 = 0;
  }
  else
  {
    -[FCStreamingResults results](self, "results");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectAtIndex:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

- (id)objectAtIndexedSubscript:(unint64_t)a3
{
  objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
  return -[FCStreamingResults objectAtIndex:](self, "objectAtIndex:", a3);
}

- (id)objectsInRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  void *v6;
  void *v7;

  length = a3.length;
  location = a3.location;
  objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
  -[FCStreamingResults results](self, "results");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "subarrayWithRange:", location, length);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)array
{
  objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
  return -[FCStreamingResults results](self, "results");
}

- (void)fetchObjectsUpToCount:(unint64_t)a3
{
  -[FCStreamingResults fetchObjectsUpToCount:qualityOfService:completion:](self, "fetchObjectsUpToCount:qualityOfService:completion:", a3, 9, 0);
}

- (void)fetchObjectsUpToCount:(unint64_t)a3 qualityOfService:(int64_t)a4
{
  -[FCStreamingResults fetchObjectsUpToCount:qualityOfService:completion:](self, "fetchObjectsUpToCount:qualityOfService:completion:", a3, a4, 0);
}

- (void)fetchObjectsUpToCount:(unint64_t)a3 completion:(id)a4
{
  -[FCStreamingResults fetchObjectsUpToCount:qualityOfService:completion:](self, "fetchObjectsUpToCount:qualityOfService:completion:", a3, 9, a4);
}

- (void)fetchObjectsUpToCount:(unint64_t)a3 qualityOfService:(int64_t)a4 completion:(id)a5
{
  -[FCStreamingResults fetchObjectsUpToCount:qualityOfService:batchSize:completion:](self, "fetchObjectsUpToCount:qualityOfService:batchSize:completion:", a3, a4, a3, a5);
}

- (void)fetchAllObjectsWithBatchSize:(unint64_t)a3 qualityOfService:(int64_t)a4 completion:(id)a5
{
  -[FCStreamingResults fetchObjectsUpToCount:qualityOfService:batchSize:completion:](self, "fetchObjectsUpToCount:qualityOfService:batchSize:completion:", -1, a4, a3, a5);
}

- (void)fetchObjectsUpToCount:(unint64_t)a3 qualityOfService:(int64_t)a4 batchSize:(unint64_t)a5 completion:(id)a6
{
  id v10;
  void *v11;
  id v12;
  _QWORD v13[5];
  id v14;
  unint64_t v15;
  unint64_t v16;
  int64_t v17;

  v10 = a6;
  -[FCStreamingResults serialQueue](self, "serialQueue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __82__FCStreamingResults_fetchObjectsUpToCount_qualityOfService_batchSize_completion___block_invoke;
  v13[3] = &unk_1E4645450;
  v15 = a3;
  v16 = a5;
  v17 = a4;
  v13[4] = self;
  v14 = v10;
  v12 = v10;
  objc_msgSend(v11, "enqueueBlockForMainThread:", v13);

}

void __82__FCStreamingResults_fetchObjectsUpToCount_qualityOfService_batchSize_completion___block_invoke(uint64_t a1, void *a2)
{
  void (**v3)(_QWORD);
  unint64_t v4;
  unint64_t v5;
  void *v6;
  char v7;
  uint64_t v8;
  unint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  id v15;
  _QWORD v16[5];
  id v17;
  void (**v18)(_QWORD);
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  v3 = a2;
  v4 = objc_msgSend(*(id *)(a1 + 32), "count");
  if (*(_QWORD *)(a1 + 48) <= v4
    || (v5 = v4,
        objc_msgSend(*(id *)(a1 + 32), "underlyingStream"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v6, "isFinished"),
        v6,
        (v7 & 1) != 0))
  {
    v8 = *(_QWORD *)(a1 + 40);
    if (v8)
      (*(void (**)(uint64_t, _QWORD))(v8 + 16))(v8, 0);
    v3[2](v3);
  }
  else
  {
    if (*(_QWORD *)(a1 + 48) - v5 >= *(_QWORD *)(a1 + 56))
      v9 = *(_QWORD *)(a1 + 56);
    else
      v9 = *(_QWORD *)(a1 + 48) - v5;
    objc_msgSend(*(id *)(a1 + 32), "underlyingStream");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(a1 + 56);
    v12 = *(_QWORD *)(a1 + 64);
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __82__FCStreamingResults_fetchObjectsUpToCount_qualityOfService_batchSize_completion___block_invoke_2;
    v16[3] = &unk_1E4645428;
    v13 = *(void **)(a1 + 40);
    v16[4] = *(_QWORD *)(a1 + 32);
    v14 = *(_QWORD *)(a1 + 48);
    v19 = v5;
    v20 = v14;
    v21 = v12;
    v22 = v11;
    v17 = v13;
    v18 = v3;
    v15 = (id)objc_msgSend(v10, "fetchMoreResultsWithLimit:qualityOfService:callbackQueue:completionHandler:", v9, v12, MEMORY[0x1E0C80D38], v16);

  }
}

void __82__FCStreamingResults_fetchObjectsUpToCount_qualityOfService_batchSize_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  int v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  id v31;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  uint8_t v42[128];
  uint8_t buf[4];
  const char *v44;
  __int16 v45;
  char *v46;
  __int16 v47;
  int v48;
  __int16 v49;
  void *v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v31 = a3;
  objc_msgSend(*(id *)(a1 + 32), "results");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");
  v8 = *(_QWORD *)(a1 + 56);

  if (v7 != v8 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("async results are out of sync"));
    *(_DWORD *)buf = 136315906;
    v44 = "-[FCStreamingResults fetchObjectsUpToCount:qualityOfService:batchSize:completion:]_block_invoke_2";
    v45 = 2080;
    v46 = "FCStreamingResults.m";
    v47 = 1024;
    v48 = 154;
    v49 = 2114;
    v50 = v30;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  objc_msgSend(*(id *)(a1 + 32), "results");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObjectsFromArray:", v5);

  v10 = *(_QWORD *)(a1 + 56);
  v32 = v5;
  v11 = objc_msgSend(v5, "count");
  objc_msgSend(*(id *)(a1 + 32), "observers");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v12, "copy");

  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v14 = v13;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v38;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v38 != v17)
          objc_enumerationMutation(v14);
        v19 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v19, "results:didFetchObjectsInRange:", *(_QWORD *)(a1 + 32), v10, v11);
      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
    }
    while (v16);
  }

  objc_msgSend(*(id *)(a1 + 32), "underlyingStream");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "isFinished");

  if (v21)
  {
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    v22 = v14;
    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
    if (v23)
    {
      v24 = v23;
      v25 = *(_QWORD *)v34;
      do
      {
        for (j = 0; j != v24; ++j)
        {
          if (*(_QWORD *)v34 != v25)
            objc_enumerationMutation(v22);
          v27 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * j);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v27, "resultsDidFinish:", *(_QWORD *)(a1 + 32));
        }
        v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
      }
      while (v24);
    }

  }
  if (v31)
  {
    v28 = *(_QWORD *)(a1 + 40);
    v29 = v32;
    if (v28)
      (*(void (**)(uint64_t, id))(v28 + 16))(v28, v31);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "fetchObjectsUpToCount:qualityOfService:batchSize:completion:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 40));
    v29 = v32;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

- (void)addObserver:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
  if (v4)
  {
    -[FCStreamingResults observers](self, "observers");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "containsObject:", v4);

    if (v6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%p is already an observer"), v4);
      *(_DWORD *)buf = 136315906;
      v10 = "-[FCStreamingResults addObserver:]";
      v11 = 2080;
      v12 = "FCStreamingResults.m";
      v13 = 1024;
      v14 = 208;
      v15 = 2114;
      v16 = v8;
      _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    }
    -[FCStreamingResults observers](self, "observers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v4);
  }
  else
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      goto LABEL_8;
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "observer != nil");
    *(_DWORD *)buf = 136315906;
    v10 = "-[FCStreamingResults addObserver:]";
    v11 = 2080;
    v12 = "FCStreamingResults.m";
    v13 = 1024;
    v14 = 204;
    v15 = 2114;
    v16 = v7;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }

LABEL_8:
}

- (void)removeObserver:(id)a3
{
  id v4;
  void *v5;
  uint8_t buf[4];
  const char *v7;
  __int16 v8;
  char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
  if (v4)
  {
    -[FCStreamingResults observers](self, "observers");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeObject:", v4);
  }
  else
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      goto LABEL_5;
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "observer != nil");
    *(_DWORD *)buf = 136315906;
    v7 = "-[FCStreamingResults removeObserver:]";
    v8 = 2080;
    v9 = "FCStreamingResults.m";
    v10 = 1024;
    v11 = 217;
    v12 = 2114;
    v13 = v5;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }

LABEL_5:
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
  objc_storeStrong((id *)&self->_observers, a3);
}

- (FCStreaming)underlyingStream
{
  return self->_underlyingStream;
}

- (NSMutableArray)results
{
  return self->_results;
}

- (FCAsyncSerialQueue)serialQueue
{
  return self->_serialQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_results, 0);
  objc_storeStrong((id *)&self->_underlyingStream, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

@end
