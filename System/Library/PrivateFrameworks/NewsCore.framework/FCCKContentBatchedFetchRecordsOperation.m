@implementation FCCKContentBatchedFetchRecordsOperation

- (BOOL)validateOperation
{
  FCCKContentDatabase *database;
  void *v5;
  int v6;
  const char *v7;
  __int16 v8;
  char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (!self || (database = self->_database) == 0)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("fetch operation must have a database"));
      v6 = 136315906;
      v7 = "-[FCCKContentBatchedFetchRecordsOperation validateOperation]";
      v8 = 2080;
      v9 = "FCCKContentBatchedFetchRecordsOperation.m";
      v10 = 1024;
      v11 = 49;
      v12 = 2114;
      v13 = v5;
      _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v6, 0x26u);

      if (self)
        goto LABEL_5;
    }
    else if (self)
    {
LABEL_5:
      database = self->_database;
      return database != 0;
    }
    database = 0;
  }
  return database != 0;
}

void __60__FCCKContentBatchedFetchRecordsOperation__continueFetching__block_invoke_4(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;

  v13 = a2;
  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v7)
  {
    v10 = *(_QWORD *)(a1 + 32);
    if (v8)
    {
      if (v10)
        v11 = *(void **)(v10 + 424);
      else
        v11 = 0;
      v12 = v9;
    }
    else
    {
      if (v10)
        v11 = *(void **)(v10 + 416);
      else
        v11 = 0;
      v12 = v13;
    }
    objc_msgSend(v11, "setObject:forKey:", v12, v7);
  }

}

- (void)setDatabase:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 368), a2);
}

- (FCCKContentBatchedFetchRecordsOperation)init
{
  FCCKContentBatchedFetchRecordsOperation *v2;
  FCThreadSafeMutableArray *v3;
  FCThreadSafeMutableArray *remainingRecordIDBatches;
  FCThreadSafeMutableDictionary *v5;
  FCThreadSafeMutableDictionary *recordsByRecordID;
  FCThreadSafeMutableDictionary *v7;
  FCThreadSafeMutableDictionary *errorsByRecordID;
  FCThreadSafeMutableArray *v9;
  FCThreadSafeMutableArray *allOperationErrors;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)FCCKContentBatchedFetchRecordsOperation;
  v2 = -[FCOperation init](&v12, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(FCThreadSafeMutableArray);
    remainingRecordIDBatches = v2->_remainingRecordIDBatches;
    v2->_remainingRecordIDBatches = v3;

    v5 = objc_alloc_init(FCThreadSafeMutableDictionary);
    recordsByRecordID = v2->_recordsByRecordID;
    v2->_recordsByRecordID = v5;

    v7 = objc_alloc_init(FCThreadSafeMutableDictionary);
    errorsByRecordID = v2->_errorsByRecordID;
    v2->_errorsByRecordID = v7;

    v9 = objc_alloc_init(FCThreadSafeMutableArray);
    allOperationErrors = v2->_allOperationErrors;
    v2->_allOperationErrors = v9;

  }
  return v2;
}

- (void)operationWillFinishWithError:(id)a3
{
  id v4;
  NSArray *recordIDs;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  FCThreadSafeMutableDictionary *recordsByRecordID;
  void *v13;
  FCThreadSafeMutableDictionary *errorsByRecordID;
  uint64_t v15;
  id fetchRecordsCompletionBlock;
  void (**v17)(id, void *, void *, id);
  FCThreadSafeMutableDictionary *v18;
  void *v19;
  FCThreadSafeMutableDictionary *v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    if (self)
      recordIDs = self->_recordIDs;
    else
      recordIDs = 0;
    v6 = recordIDs;
    v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v23;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v23 != v9)
            objc_enumerationMutation(v6);
          v11 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v10);
          if (self)
            recordsByRecordID = self->_recordsByRecordID;
          else
            recordsByRecordID = 0;
          -[FCThreadSafeMutableDictionary objectForKey:](recordsByRecordID, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v10), (_QWORD)v22);
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v13)
          {
            if (self)
              errorsByRecordID = self->_errorsByRecordID;
            else
              errorsByRecordID = 0;
            -[FCThreadSafeMutableDictionary setObject:forKey:](errorsByRecordID, "setObject:forKey:", v4, v11);
          }
          ++v10;
        }
        while (v8 != v10);
        v15 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
        v8 = v15;
      }
      while (v15);
    }

  }
  if (self)
  {
    fetchRecordsCompletionBlock = self->_fetchRecordsCompletionBlock;
    if (fetchRecordsCompletionBlock)
    {
      v17 = (void (**)(id, void *, void *, id))fetchRecordsCompletionBlock;
      v18 = self->_recordsByRecordID;
      -[FCThreadSafeMutableDictionary readOnlyDictionary](v18, "readOnlyDictionary");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = self->_errorsByRecordID;
      -[FCThreadSafeMutableDictionary readOnlyDictionary](v20, "readOnlyDictionary");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v17[2](v17, v19, v21, v4);

    }
  }

}

void __60__FCCKContentBatchedFetchRecordsOperation__continueFetching__block_invoke_7(uint64_t a1)
{
  -[FCCKContentBatchedFetchRecordsOperation _continueFetching](*(id **)(a1 + 32));
}

void __60__FCCKContentBatchedFetchRecordsOperation__continueFetching__block_invoke_6(uint64_t a1, uint64_t a2, void *a3)
{
  unint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;

  v13 = a3;
  if (objc_msgSend(v13, "fc_isCKErrorWithCode:", 27))
  {
    v4 = (unint64_t)objc_msgSend(*(id *)(a1 + 32), "count") >> 1;
    objc_msgSend(*(id *)(a1 + 32), "subarrayWithRange:", 0, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "subarrayWithRange:", v4, objc_msgSend(*(id *)(a1 + 32), "count") - v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1 + 40);
    if (v7)
      v8 = *(void **)(v7 + 408);
    else
      v8 = 0;
    objc_msgSend(v8, "addObject:", v5);
    v9 = *(_QWORD *)(a1 + 40);
    if (v9)
      v10 = *(void **)(v9 + 408);
    else
      v10 = 0;
    objc_msgSend(v10, "addObject:", v6);

  }
  else if (v13 && objc_msgSend(v13, "code") != 2)
  {
    v11 = *(_QWORD *)(a1 + 40);
    if (v11)
      v12 = *(void **)(v11 + 432);
    else
      v12 = 0;
    objc_msgSend(v12, "addObject:", v13);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));

}

void __60__FCCKContentBatchedFetchRecordsOperation__continueFetching__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  v6 = a2;
  v3 = objc_msgSend(v6, "copy");
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  objc_msgSend(v6, "removeAllObjects");
}

- (void)prepareOperation
{
  FCCKContentBatchedFetchRecordsOperation *v2;
  NSArray *v3;
  unint64_t maxBatchSize;
  _QWORD v5[5];

  v2 = self;
  if (self)
  {
    if (!self->_maxBatchSize)
      self->_maxBatchSize = 400;
    self = (FCCKContentBatchedFetchRecordsOperation *)self->_recordIDs;
  }
  if (-[FCCKContentBatchedFetchRecordsOperation count](self, "count"))
  {
    if (v2)
    {
      v3 = v2->_recordIDs;
      maxBatchSize = v2->_maxBatchSize;
    }
    else
    {
      v3 = 0;
      maxBatchSize = 0;
    }
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __59__FCCKContentBatchedFetchRecordsOperation_prepareOperation__block_invoke;
    v5[3] = &unk_1E4640710;
    v5[4] = v2;
    -[NSArray fc_visitSubarraysWithMaxCount:block:](v3, "fc_visitSubarraysWithMaxCount:block:", maxBatchSize, v5);

  }
}

uint64_t __59__FCCKContentBatchedFetchRecordsOperation_prepareOperation__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  void *v3;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    v3 = *(void **)(v2 + 408);
  else
    v3 = 0;
  return objc_msgSend(v3, "addObject:", a2);
}

void __60__FCCKContentBatchedFetchRecordsOperation__continueFetching__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    v3 = *(void **)(v2 + 432);
  else
    v3 = 0;
  objc_msgSend(v3, "firstObject");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "finishedPerformingOperationWithError:", v4);

}

- (void)_continueFetching
{
  id v2;
  uint64_t v3;
  dispatch_group_t v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  _QWORD block[5];
  _QWORD v9[5];
  NSObject *v10;
  _QWORD v11[5];
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  if (a1)
  {
    v13 = 0;
    v14 = &v13;
    v15 = 0x3032000000;
    v16 = __Block_byref_object_copy__64;
    v17 = __Block_byref_object_dispose__64;
    v18 = 0;
    v2 = a1[51];
    v3 = MEMORY[0x1E0C809B0];
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __60__FCCKContentBatchedFetchRecordsOperation__continueFetching__block_invoke;
    v12[3] = &unk_1E4640738;
    v12[4] = &v13;
    objc_msgSend(v2, "readWriteWithAccessor:", v12);

    if (objc_msgSend((id)v14[5], "count"))
    {
      v4 = dispatch_group_create();
      v5 = (void *)v14[5];
      v9[0] = v3;
      v9[1] = 3221225472;
      v9[2] = __60__FCCKContentBatchedFetchRecordsOperation__continueFetching__block_invoke_3;
      v9[3] = &unk_1E4640788;
      v9[4] = a1;
      v6 = v4;
      v10 = v6;
      objc_msgSend(v5, "enumerateObjectsUsingBlock:", v9);
      FCDispatchQueueForQualityOfService(objc_msgSend(a1, "qualityOfService"));
      v7 = objc_claimAutoreleasedReturnValue();
      block[0] = v3;
      block[1] = 3221225472;
      block[2] = __60__FCCKContentBatchedFetchRecordsOperation__continueFetching__block_invoke_7;
      block[3] = &unk_1E463AB18;
      block[4] = a1;
      dispatch_group_notify(v6, v7, block);

    }
    else
    {
      v11[0] = v3;
      v11[1] = 3221225472;
      v11[2] = __60__FCCKContentBatchedFetchRecordsOperation__continueFetching__block_invoke_2;
      v11[3] = &unk_1E463AB18;
      v11[4] = a1;
      __60__FCCKContentBatchedFetchRecordsOperation__continueFetching__block_invoke_2((uint64_t)v11);
    }
    _Block_object_dispose(&v13, 8);

  }
}

void __60__FCCKContentBatchedFetchRecordsOperation__continueFetching__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  FCCKContentFetchOperation *v4;
  FCCKContentFetchOperation *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  SEL v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t, uint64_t, void *);
  void *v21;
  id v22;
  uint64_t v23;
  id v24;
  uint64_t newValue;
  uint64_t v26;
  void (*v27)(uint64_t, void *, void *, void *);
  void *v28;
  uint64_t v29;

  v3 = a2;
  v4 = objc_alloc_init(FCCKContentFetchOperation);
  v5 = v4;
  v6 = *(_QWORD *)(a1 + 32);
  if (v6)
    v7 = *(void **)(v6 + 368);
  else
    v7 = 0;
  -[FCCKContentFetchOperation setDatabase:]((uint64_t)v4, v7);
  if (v5)
    objc_setProperty_nonatomic_copy(v5, v8, v3, 384);
  v9 = *(_QWORD *)(a1 + 32);
  if (v9)
    v10 = *(void **)(v9 + 384);
  else
    v10 = 0;
  v11 = MEMORY[0x1E0C809B0];
  if (v5)
  {
    objc_setProperty_nonatomic_copy(v5, v8, v10, 400);
    v12 = *(_QWORD *)(a1 + 32);
    newValue = v11;
    v26 = 3221225472;
    v27 = __60__FCCKContentBatchedFetchRecordsOperation__continueFetching__block_invoke_4;
    v28 = &unk_1E4648AB8;
    v29 = v12;
    objc_setProperty_nonatomic_copy(v5, v13, &newValue, 408);
  }
  else
  {
    newValue = MEMORY[0x1E0C809B0];
    v26 = 3221225472;
    v27 = __60__FCCKContentBatchedFetchRecordsOperation__continueFetching__block_invoke_4;
    v28 = &unk_1E4648AB8;
    v29 = v9;
  }
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 40));
  v18 = v11;
  v19 = 3221225472;
  v20 = __60__FCCKContentBatchedFetchRecordsOperation__continueFetching__block_invoke_6;
  v21 = &unk_1E4645498;
  v14 = *(_QWORD *)(a1 + 32);
  v15 = *(void **)(a1 + 40);
  v22 = v3;
  v23 = v14;
  v24 = v15;
  v17 = v3;
  if (v5)
    objc_setProperty_nonatomic_copy(v5, v16, &v18, 416);
  objc_msgSend(*(id *)(a1 + 32), "associateChildOperation:", v5, v18, v19, v20, v21);
  -[FCOperation start](v5, "start");

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allOperationErrors, 0);
  objc_storeStrong((id *)&self->_errorsByRecordID, 0);
  objc_storeStrong((id *)&self->_recordsByRecordID, 0);
  objc_storeStrong((id *)&self->_remainingRecordIDBatches, 0);
  objc_storeStrong(&self->_fetchRecordsCompletionBlock, 0);
  objc_storeStrong((id *)&self->_desiredKeys, 0);
  objc_storeStrong((id *)&self->_recordIDs, 0);
  objc_storeStrong((id *)&self->_database, 0);
}

@end
