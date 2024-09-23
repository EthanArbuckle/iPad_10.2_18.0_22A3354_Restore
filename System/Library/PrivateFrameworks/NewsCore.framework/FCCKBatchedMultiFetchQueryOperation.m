@implementation FCCKBatchedMultiFetchQueryOperation

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
      v7 = "-[FCCKBatchedMultiFetchQueryOperation validateOperation]";
      v8 = 2080;
      v9 = "FCCKBatchedMultiFetchQueryOperation.m";
      v10 = 1024;
      v11 = 50;
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

- (void)setRecordSpecs:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 392), a2);
}

- (void)setRecordIDs:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 384), a2);
}

- (void)setDatabase:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 376), a2);
}

- (void)setKnownRecordIDsToEtags:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 408), a2);
}

void __56__FCCKBatchedMultiFetchQueryOperation__continueFetching__block_invoke_5(uint64_t a1)
{
  -[FCCKBatchedMultiFetchQueryOperation _continueFetching](*(id **)(a1 + 32));
}

- (void)operationWillFinishWithError:(id)a3
{
  id queryCompletionHandler;
  void (**v5)(id, void *, void *, id);
  FCThreadSafeMutableArray *v6;
  void *v7;
  FCThreadSafeMutableSet *v8;
  void *v9;
  id v10;

  v10 = a3;
  if (self)
  {
    queryCompletionHandler = self->_queryCompletionHandler;
    if (queryCompletionHandler)
    {
      v5 = (void (**)(id, void *, void *, id))queryCompletionHandler;
      v6 = self->_resultRecords;
      -[FCThreadSafeMutableArray readOnlyArray](v6, "readOnlyArray");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = self->_resultMissingRecordIDs;
      -[FCThreadSafeMutableSet readOnlySet](v8, "readOnlySet");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v5[2](v5, v7, v9, v10);

    }
  }

}

- (FCCKBatchedMultiFetchQueryOperation)init
{
  FCCKBatchedMultiFetchQueryOperation *v2;
  FCThreadSafeMutableArray *v3;
  FCThreadSafeMutableArray *remainingRecordIDBatches;
  FCThreadSafeMutableArray *v5;
  FCThreadSafeMutableArray *resultRecords;
  FCThreadSafeMutableSet *v7;
  FCThreadSafeMutableSet *resultMissingRecordIDs;
  FCThreadSafeMutableArray *v9;
  FCThreadSafeMutableArray *allErrors;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)FCCKBatchedMultiFetchQueryOperation;
  v2 = -[FCOperation init](&v12, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(FCThreadSafeMutableArray);
    remainingRecordIDBatches = v2->_remainingRecordIDBatches;
    v2->_remainingRecordIDBatches = v3;

    v5 = objc_alloc_init(FCThreadSafeMutableArray);
    resultRecords = v2->_resultRecords;
    v2->_resultRecords = v5;

    v7 = objc_alloc_init(FCThreadSafeMutableSet);
    resultMissingRecordIDs = v2->_resultMissingRecordIDs;
    v2->_resultMissingRecordIDs = v7;

    v9 = objc_alloc_init(FCThreadSafeMutableArray);
    allErrors = v2->_allErrors;
    v2->_allErrors = v9;

  }
  return v2;
}

void __56__FCCKBatchedMultiFetchQueryOperation__continueFetching__block_invoke_4(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  unint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  id v23;

  v23 = a2;
  v7 = a3;
  v8 = a4;
  if (objc_msgSend(v8, "fc_isCKErrorWithCode:", 27))
  {
    v9 = (unint64_t)objc_msgSend(*(id *)(a1 + 32), "count") >> 1;
    objc_msgSend(*(id *)(a1 + 32), "subarrayWithRange:", 0, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "subarrayWithRange:", v9, objc_msgSend(*(id *)(a1 + 32), "count") - v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = *(_QWORD *)(a1 + 40);
    if (v12)
      v13 = *(void **)(v12 + 456);
    else
      v13 = 0;
    objc_msgSend(v13, "addObject:", v10);
    v14 = *(_QWORD *)(a1 + 40);
    if (v14)
      v15 = *(void **)(v14 + 456);
    else
      v15 = 0;
    objc_msgSend(v15, "addObject:", v11);

  }
  else if (v8 && objc_msgSend(v8, "code") != 2)
  {
    v21 = *(_QWORD *)(a1 + 40);
    if (v21)
      v22 = *(void **)(v21 + 480);
    else
      v22 = 0;
    objc_msgSend(v22, "addObject:", v8);
  }
  else
  {
    v16 = *(_QWORD *)(a1 + 40);
    if (v16
      && ((v17 = *(_QWORD *)(v16 + 440)) == 0
       || ((*(void (**)(uint64_t, _QWORD, id, id))(v17 + 16))(v17, *(_QWORD *)(a1 + 32), v23, v7),
           (v16 = *(_QWORD *)(a1 + 40)) != 0)))
    {
      v18 = *(void **)(v16 + 464);
    }
    else
    {
      v18 = 0;
    }
    objc_msgSend(v18, "addObjectsFromArray:", v23);
    v19 = *(_QWORD *)(a1 + 40);
    if (v19)
      v20 = *(void **)(v19 + 472);
    else
      v20 = 0;
    objc_msgSend(v20, "unionSet:", v7);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));

}

void __56__FCCKBatchedMultiFetchQueryOperation__continueFetching__block_invoke(uint64_t a1, void *a2)
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
  NSArray *v3;
  void *v4;
  uint64_t v5;
  unint64_t maxBatchSize;
  _QWORD v7[5];

  if (self)
  {
    if (!self->_maxBatchSize)
      self->_maxBatchSize = 500;
    v3 = self->_recordIDs;
    v4 = v3;
    if (self->_edgeCacheHint)
    {
      -[NSArray sortedArrayUsingSelector:](v3, "sortedArrayUsingSelector:", sel_caseInsensitiveCompare_);
      v5 = objc_claimAutoreleasedReturnValue();

      v4 = (void *)v5;
    }
    maxBatchSize = self->_maxBatchSize;
  }
  else
  {
    v4 = 0;
    maxBatchSize = 0;
  }
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __55__FCCKBatchedMultiFetchQueryOperation_prepareOperation__block_invoke;
  v7[3] = &unk_1E4640710;
  v7[4] = self;
  objc_msgSend(v4, "fc_visitSubarraysWithMaxCount:block:", maxBatchSize, v7);

}

uint64_t __55__FCCKBatchedMultiFetchQueryOperation_prepareOperation__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  void *v3;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    v3 = *(void **)(v2 + 456);
  else
    v3 = 0;
  return objc_msgSend(v3, "addObject:", a2);
}

void __56__FCCKBatchedMultiFetchQueryOperation__continueFetching__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  FCCKMultiFetchQueryOperation *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  BOOL v16;
  int v17;
  void *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  id v22;
  _QWORD newValue[4];
  id v24;
  uint64_t v25;
  id v26;

  v3 = a2;
  v4 = objc_alloc_init(FCCKMultiFetchQueryOperation);
  v5 = (uint64_t)v4;
  v6 = *(_QWORD *)(a1 + 32);
  if (v6)
    v7 = *(void **)(v6 + 376);
  else
    v7 = 0;
  -[FCCKMultiFetchQueryOperation setDatabase:]((uint64_t)v4, v7);
  -[FCCKMultiFetchQueryOperation setRecordIDs:](v5, v3);
  v8 = *(_QWORD *)(a1 + 32);
  if (v8)
    v9 = *(void **)(v8 + 392);
  else
    v9 = 0;
  -[FCCKMultiFetchQueryOperation setRecordSpecs:](v5, v9);
  v10 = *(_QWORD *)(a1 + 32);
  if (v10)
    v11 = *(void **)(v10 + 408);
  else
    v11 = 0;
  objc_msgSend(v11, "fc_subdictionaryForKeys:", v3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCCKMultiFetchQueryOperation setKnownRecordIDsToEtags:](v5, v12);

  v14 = *(_QWORD *)(a1 + 32);
  if (v14)
  {
    v15 = *(void **)(v14 + 416);
    if (!v5)
      goto LABEL_10;
    goto LABEL_9;
  }
  v15 = 0;
  if (v5)
  {
LABEL_9:
    objc_setProperty_nonatomic_copy((id)v5, v13, v15, 408);
    v14 = *(_QWORD *)(a1 + 32);
  }
LABEL_10:
  if (v14)
  {
    v16 = *(_BYTE *)(v14 + 368) != 0;
    if (!v5)
      goto LABEL_13;
    goto LABEL_12;
  }
  v16 = 0;
  if (v5)
  {
LABEL_12:
    *(_BYTE *)(v5 + 368) = v16;
    v14 = *(_QWORD *)(a1 + 32);
  }
LABEL_13:
  if (v14)
  {
    v17 = *(_DWORD *)(v14 + 372);
    if (!v5)
      goto LABEL_16;
    goto LABEL_15;
  }
  v17 = 0;
  if (v5)
  {
LABEL_15:
    *(_DWORD *)(v5 + 372) = v17;
    v14 = *(_QWORD *)(a1 + 32);
  }
LABEL_16:
  if (v14)
  {
    v18 = *(void **)(v14 + 432);
    if (!v5)
      goto LABEL_19;
    goto LABEL_18;
  }
  v18 = 0;
  if (v5)
LABEL_18:
    objc_setProperty_nonatomic_copy((id)v5, v13, v18, 424);
LABEL_19:
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 40));
  newValue[0] = MEMORY[0x1E0C809B0];
  newValue[1] = 3221225472;
  newValue[2] = __56__FCCKBatchedMultiFetchQueryOperation__continueFetching__block_invoke_4;
  newValue[3] = &unk_1E4640760;
  v19 = *(_QWORD *)(a1 + 32);
  v20 = *(void **)(a1 + 40);
  v24 = v3;
  v25 = v19;
  v26 = v20;
  v22 = v3;
  if (v5)
    objc_setProperty_nonatomic_copy((id)v5, v21, newValue, 432);
  objc_msgSend(*(id *)(a1 + 32), "associateChildOperation:", v5);
  objc_msgSend((id)v5, "start");

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
    v16 = __Block_byref_object_copy__28;
    v17 = __Block_byref_object_dispose__28;
    v18 = 0;
    v2 = a1[57];
    v3 = MEMORY[0x1E0C809B0];
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __56__FCCKBatchedMultiFetchQueryOperation__continueFetching__block_invoke;
    v12[3] = &unk_1E4640738;
    v12[4] = &v13;
    objc_msgSend(v2, "readWriteWithAccessor:", v12);

    if (objc_msgSend((id)v14[5], "count"))
    {
      v4 = dispatch_group_create();
      v5 = (void *)v14[5];
      v9[0] = v3;
      v9[1] = 3221225472;
      v9[2] = __56__FCCKBatchedMultiFetchQueryOperation__continueFetching__block_invoke_3;
      v9[3] = &unk_1E4640788;
      v9[4] = a1;
      v6 = v4;
      v10 = v6;
      objc_msgSend(v5, "enumerateObjectsUsingBlock:", v9);
      FCDispatchQueueForQualityOfService(objc_msgSend(a1, "qualityOfService"));
      v7 = objc_claimAutoreleasedReturnValue();
      block[0] = v3;
      block[1] = 3221225472;
      block[2] = __56__FCCKBatchedMultiFetchQueryOperation__continueFetching__block_invoke_5;
      block[3] = &unk_1E463AB18;
      block[4] = a1;
      dispatch_group_notify(v6, v7, block);

    }
    else
    {
      v11[0] = v3;
      v11[1] = 3221225472;
      v11[2] = __56__FCCKBatchedMultiFetchQueryOperation__continueFetching__block_invoke_2;
      v11[3] = &unk_1E463AB18;
      v11[4] = a1;
      __56__FCCKBatchedMultiFetchQueryOperation__continueFetching__block_invoke_2((uint64_t)v11);
    }
    _Block_object_dispose(&v13, 8);

  }
}

void __56__FCCKBatchedMultiFetchQueryOperation__continueFetching__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    v3 = *(void **)(v2 + 480);
  else
    v3 = 0;
  objc_msgSend(v3, "firstObject");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "finishedPerformingOperationWithError:", v4);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allErrors, 0);
  objc_storeStrong((id *)&self->_resultMissingRecordIDs, 0);
  objc_storeStrong((id *)&self->_resultRecords, 0);
  objc_storeStrong((id *)&self->_remainingRecordIDBatches, 0);
  objc_storeStrong(&self->_queryCompletionHandler, 0);
  objc_storeStrong(&self->_batchCompletionHandler, 0);
  objc_storeStrong(&self->_networkActivityBlock, 0);
  objc_storeStrong((id *)&self->_networkEvents, 0);
  objc_storeStrong((id *)&self->_edgeCacheHint, 0);
  objc_storeStrong((id *)&self->_knownRecordIDsToEtags, 0);
  objc_storeStrong((id *)&self->_recordSpecs, 0);
  objc_storeStrong((id *)&self->_recordIDs, 0);
  objc_storeStrong((id *)&self->_database, 0);
}

@end
