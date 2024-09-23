@implementation FCCKContentBatchedRefreshRecordsOperation

- (void)_continueRefreshing
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
    v16 = __Block_byref_object_copy__59;
    v17 = __Block_byref_object_dispose__59;
    v18 = 0;
    v2 = a1[53];
    v3 = MEMORY[0x1E0C809B0];
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __64__FCCKContentBatchedRefreshRecordsOperation__continueRefreshing__block_invoke;
    v12[3] = &unk_1E4640738;
    v12[4] = &v13;
    objc_msgSend(v2, "readWriteWithAccessor:", v12);

    if (objc_msgSend((id)v14[5], "count"))
    {
      v4 = dispatch_group_create();
      v5 = (void *)v14[5];
      v9[0] = v3;
      v9[1] = 3221225472;
      v9[2] = __64__FCCKContentBatchedRefreshRecordsOperation__continueRefreshing__block_invoke_3;
      v9[3] = &unk_1E4640788;
      v9[4] = a1;
      v6 = v4;
      v10 = v6;
      objc_msgSend(v5, "enumerateObjectsUsingBlock:", v9);
      FCDispatchQueueForQualityOfService(objc_msgSend(a1, "qualityOfService"));
      v7 = objc_claimAutoreleasedReturnValue();
      block[0] = v3;
      block[1] = 3221225472;
      block[2] = __64__FCCKContentBatchedRefreshRecordsOperation__continueRefreshing__block_invoke_6;
      block[3] = &unk_1E463AB18;
      block[4] = a1;
      dispatch_group_notify(v6, v7, block);

    }
    else
    {
      v11[0] = v3;
      v11[1] = 3221225472;
      v11[2] = __64__FCCKContentBatchedRefreshRecordsOperation__continueRefreshing__block_invoke_2;
      v11[3] = &unk_1E463AB18;
      v11[4] = a1;
      __64__FCCKContentBatchedRefreshRecordsOperation__continueRefreshing__block_invoke_2((uint64_t)v11);
    }
    _Block_object_dispose(&v13, 8);

  }
}

- (BOOL)validateOperation
{
  FCCKContentBatchedRefreshRecordsOperation *v2;
  NSArray *recordIDs;
  FCCKContentDatabase *v4;
  FCCKContentDatabase *v5;
  void *v7;
  void *v8;
  int v9;
  const char *v10;
  __int16 v11;
  char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v2 = self;
  v17 = *MEMORY[0x1E0C80C00];
  if (self && self->_database)
    goto LABEL_5;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("refresh operation must have a database"));
    v9 = 136315906;
    v10 = "-[FCCKContentBatchedRefreshRecordsOperation validateOperation]";
    v11 = 2080;
    v12 = "FCCKContentBatchedRefreshRecordsOperation.m";
    v13 = 1024;
    v14 = 55;
    v15 = 2114;
    v16 = v7;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v9, 0x26u);

    if (v2)
      goto LABEL_5;
LABEL_14:
    recordIDs = 0;
    goto LABEL_6;
  }
  if (!v2)
    goto LABEL_14;
LABEL_5:
  recordIDs = v2->_recordIDs;
LABEL_6:
  if (!-[NSArray count](recordIDs, "count") && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("refresh operation must have record IDs"));
    v9 = 136315906;
    v10 = "-[FCCKContentBatchedRefreshRecordsOperation validateOperation]";
    v11 = 2080;
    v12 = "FCCKContentBatchedRefreshRecordsOperation.m";
    v13 = 1024;
    v14 = 56;
    v15 = 2114;
    v16 = v8;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v9, 0x26u);

    if (!v2)
      return (char)v2;
  }
  else if (!v2)
  {
    return (char)v2;
  }
  v4 = v2->_database;
  if (v4)
  {
    v5 = v4;
    LOBYTE(v2) = -[NSArray count](v2->_recordIDs, "count") != 0;

  }
  else
  {
    LOBYTE(v2) = 0;
  }
  return (char)v2;
}

- (void)prepareOperation
{
  NSArray *recordIDs;
  uint64_t v3;
  _QWORD v4[5];

  if (self)
  {
    recordIDs = self->_recordIDs;
    if (self->_canaryRecordID)
      v3 = 399;
    else
      v3 = 400;
  }
  else
  {
    recordIDs = 0;
    v3 = 400;
  }
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __61__FCCKContentBatchedRefreshRecordsOperation_prepareOperation__block_invoke;
  v4[3] = &unk_1E4640710;
  v4[4] = self;
  -[NSArray fc_visitSubarraysWithMaxCount:block:](recordIDs, "fc_visitSubarraysWithMaxCount:block:", v3, v4);
}

void __64__FCCKContentBatchedRefreshRecordsOperation__continueRefreshing__block_invoke_4(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a2;
  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8)
    {
      if (objc_msgSend(v8, "code") != 11 && objc_msgSend(v9, "code") != 2003)
      {
        objc_msgSend(*(id *)(a1 + 48), "setObject:forKey:", v9, v7);
        goto LABEL_8;
      }
      v10 = *(void **)(a1 + 40);
    }
    else
    {
      v10 = *(void **)(a1 + 32);
    }
    objc_msgSend(v10, "addObject:", v7);
  }
LABEL_8:

}

- (void)setDatabase:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 376), a2);
}

- (FCCKContentBatchedRefreshRecordsOperation)init
{
  FCCKContentBatchedRefreshRecordsOperation *v2;
  FCThreadSafeMutableArray *v3;
  FCThreadSafeMutableArray *remainingRecordIDBatches;
  FCThreadSafeMutableSet *v5;
  FCThreadSafeMutableSet *refreshedRecordIDs;
  FCThreadSafeMutableDictionary *v7;
  FCThreadSafeMutableDictionary *updatedRecordsByRecordID;
  FCThreadSafeMutableSet *v9;
  FCThreadSafeMutableSet *deletedRecordIDs;
  FCThreadSafeMutableDictionary *v11;
  FCThreadSafeMutableDictionary *errorsByRecordID;
  FCThreadSafeMutableArray *v13;
  FCThreadSafeMutableArray *allOperationErrors;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)FCCKContentBatchedRefreshRecordsOperation;
  v2 = -[FCOperation init](&v16, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(FCThreadSafeMutableArray);
    remainingRecordIDBatches = v2->_remainingRecordIDBatches;
    v2->_remainingRecordIDBatches = v3;

    v5 = objc_alloc_init(FCThreadSafeMutableSet);
    refreshedRecordIDs = v2->_refreshedRecordIDs;
    v2->_refreshedRecordIDs = v5;

    v7 = objc_alloc_init(FCThreadSafeMutableDictionary);
    updatedRecordsByRecordID = v2->_updatedRecordsByRecordID;
    v2->_updatedRecordsByRecordID = v7;

    v9 = objc_alloc_init(FCThreadSafeMutableSet);
    deletedRecordIDs = v2->_deletedRecordIDs;
    v2->_deletedRecordIDs = v9;

    v11 = objc_alloc_init(FCThreadSafeMutableDictionary);
    errorsByRecordID = v2->_errorsByRecordID;
    v2->_errorsByRecordID = v11;

    v13 = objc_alloc_init(FCThreadSafeMutableArray);
    allOperationErrors = v2->_allOperationErrors;
    v2->_allOperationErrors = v13;

  }
  return v2;
}

- (void)operationWillFinishWithError:(id)a3
{
  id refreshRecordsCompletionBlock;
  void (**v5)(id, void *, void *, void *, id);
  FCThreadSafeMutableSet *v6;
  void *v7;
  FCThreadSafeMutableDictionary *v8;
  void *v9;
  FCThreadSafeMutableSet *v10;
  void *v11;
  id v12;

  v12 = a3;
  if (self)
  {
    refreshRecordsCompletionBlock = self->_refreshRecordsCompletionBlock;
    if (refreshRecordsCompletionBlock)
    {
      v5 = (void (**)(id, void *, void *, void *, id))refreshRecordsCompletionBlock;
      v6 = self->_refreshedRecordIDs;
      -[FCThreadSafeMutableSet allObjects](v6, "allObjects");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = self->_updatedRecordsByRecordID;
      -[FCThreadSafeMutableDictionary readOnlyDictionary](v8, "readOnlyDictionary");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = self->_deletedRecordIDs;
      -[FCThreadSafeMutableSet allObjects](v10, "allObjects");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v5[2](v5, v7, v9, v11, v12);

    }
  }

}

uint64_t __64__FCCKContentBatchedRefreshRecordsOperation__continueRefreshing__block_invoke_6(uint64_t a1)
{
  return -[FCCKContentBatchedRefreshRecordsOperation _continueRefreshing](*(_QWORD *)(a1 + 32));
}

void __64__FCCKContentBatchedRefreshRecordsOperation__continueRefreshing__block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  id *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  unint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  void *v36;
  id v37;

  v37 = a2;
  v5 = a3;
  v6 = *(_QWORD *)(a1 + 32);
  if (!v6 || !*(_BYTE *)(v6 + 368))
  {
    v12 = (id *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 40), "unionSet:", *(_QWORD *)(a1 + 48));
    goto LABEL_9;
  }
  v7 = *(id *)(v6 + 408);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)(a1 + 32);
    v10 = v9 ? *(_QWORD *)(v9 + 408) : 0;
    v11 = objc_msgSend(*(id *)(a1 + 40), "containsObject:", v10);

    if ((v11 & 1) == 0)
    {
      v12 = (id *)(a1 + 48);
LABEL_9:
      objc_msgSend(*v12, "removeAllObjects");
    }
  }
  v13 = *(_QWORD *)(a1 + 32);
  if (v13)
  {
    if (!*(_QWORD *)(v13 + 408))
    {
LABEL_20:
      v21 = *(void **)(v13 + 432);
      goto LABEL_21;
    }
    objc_msgSend(*(id *)(a1 + 48), "removeObject:");
    v14 = *(_QWORD *)(a1 + 32);
    if (v14)
      v15 = *(_QWORD *)(v14 + 408);
    else
      v15 = 0;
    objc_msgSend(*(id *)(a1 + 40), "removeObject:", v15);
    v16 = *(_QWORD *)(a1 + 32);
    if (v16)
      v17 = *(_QWORD *)(v16 + 408);
    else
      v17 = 0;
    objc_msgSend(*(id *)(a1 + 56), "removeObjectForKey:", v17);
    v18 = *(_QWORD *)(a1 + 32);
    if (v18)
      v19 = *(_QWORD *)(v18 + 408);
    else
      v19 = 0;
    objc_msgSend(v37, "fc_dictionaryByRemovingObjectForKey:", v19);
    v20 = objc_claimAutoreleasedReturnValue();

    v13 = *(_QWORD *)(a1 + 32);
    if (v13)
    {
      v37 = (id)v20;
      goto LABEL_20;
    }
    v21 = 0;
    v37 = (id)v20;
  }
  else
  {
    v21 = 0;
  }
LABEL_21:
  objc_msgSend(v21, "unionSet:", *(_QWORD *)(a1 + 40));
  v22 = *(_QWORD *)(a1 + 32);
  if (v22)
    v23 = *(void **)(v22 + 456);
  else
    v23 = 0;
  objc_msgSend(v23, "addEntriesFromDictionary:", *(_QWORD *)(a1 + 56));
  v24 = *(_QWORD *)(a1 + 32);
  if (v24)
    v25 = *(void **)(v24 + 448);
  else
    v25 = 0;
  objc_msgSend(v25, "unionSet:", *(_QWORD *)(a1 + 48));
  if (objc_msgSend(v5, "fc_isCKErrorWithCode:", 27))
  {
    v26 = (unint64_t)objc_msgSend(*(id *)(a1 + 64), "count") >> 1;
    objc_msgSend(*(id *)(a1 + 64), "subarrayWithRange:", 0, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 64), "subarrayWithRange:", v26, objc_msgSend(*(id *)(a1 + 64), "count") - v26);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = *(_QWORD *)(a1 + 32);
    if (v29)
      v30 = *(void **)(v29 + 424);
    else
      v30 = 0;
    objc_msgSend(v30, "addObject:", v27);
    v31 = *(_QWORD *)(a1 + 32);
    if (v31)
      v32 = *(void **)(v31 + 424);
    else
      v32 = 0;
    objc_msgSend(v32, "addObject:", v28);

  }
  else if (v5 && objc_msgSend(v5, "code") != 2)
  {
    v35 = *(_QWORD *)(a1 + 32);
    if (v35)
      v36 = *(void **)(v35 + 464);
    else
      v36 = 0;
    objc_msgSend(v36, "addObject:", v5);
  }
  else
  {
    v33 = *(_QWORD *)(a1 + 32);
    if (v33)
      v34 = *(void **)(v33 + 440);
    else
      v34 = 0;
    objc_msgSend(v34, "addEntriesFromDictionary:", v37);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 72));

}

void __64__FCCKContentBatchedRefreshRecordsOperation__continueRefreshing__block_invoke(uint64_t a1, void *a2)
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

uint64_t __61__FCCKContentBatchedRefreshRecordsOperation_prepareOperation__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  void *v3;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    v3 = *(void **)(v2 + 424);
  else
    v3 = 0;
  return objc_msgSend(v3, "addObject:", a2);
}

void __64__FCCKContentBatchedRefreshRecordsOperation__continueRefreshing__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    v3 = *(void **)(v2 + 464);
  else
    v3 = 0;
  objc_msgSend(v3, "firstObject");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "finishedPerformingOperationWithError:", v4);

}

void __64__FCCKContentBatchedRefreshRecordsOperation__continueRefreshing__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  FCCKContentFetchOperation *v9;
  FCCKContentFetchOperation *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  id v24;
  id v25;
  const char *v26;
  id v27;
  void *v28;
  id v29;
  id v30;
  id v31;
  const char *v32;
  id v33;
  _QWORD v34[5];
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  _QWORD newValue[4];
  id v41;
  id v42;
  id v43;

  v3 = a2;
  v4 = v3;
  v5 = *(_QWORD *)(a1 + 32);
  v6 = v3;
  if (v5)
  {
    v7 = *(void **)(v5 + 408);
    v6 = v3;
    if (v7)
    {
      v8 = v7;
      objc_msgSend(v4, "arrayByAddingObject:", v8);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  v9 = objc_alloc_init(FCCKContentFetchOperation);
  v10 = v9;
  v11 = *(_QWORD *)(a1 + 32);
  if (v11)
    v12 = *(void **)(v11 + 376);
  else
    v12 = 0;
  -[FCCKContentFetchOperation setDatabase:]((uint64_t)v9, v12);
  if (v10)
    objc_setProperty_nonatomic_copy(v10, v13, v6, 384);
  v14 = *(_QWORD *)(a1 + 32);
  if (v14)
    v15 = *(void **)(v14 + 392);
  else
    v15 = 0;
  objc_msgSend(v15, "fc_subdictionaryForKeys:", v4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCCKContentFetchOperation setRecordIDsToETags:]((uint64_t)v10, v16);

  v18 = *(_QWORD *)(a1 + 32);
  if (v18)
  {
    v19 = *(void **)(v18 + 400);
    if (!v10)
      goto LABEL_13;
    goto LABEL_12;
  }
  v19 = 0;
  if (v10)
LABEL_12:
    objc_setProperty_nonatomic_copy(v10, v17, v19, 400);
LABEL_13:
  objc_msgSend(MEMORY[0x1E0C99E20], "set", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = MEMORY[0x1E0C809B0];
  newValue[0] = MEMORY[0x1E0C809B0];
  newValue[1] = 3221225472;
  newValue[2] = __64__FCCKContentBatchedRefreshRecordsOperation__continueRefreshing__block_invoke_4;
  newValue[3] = &unk_1E4647E90;
  v24 = v20;
  v41 = v24;
  v25 = v21;
  v42 = v25;
  v27 = v22;
  v43 = v27;
  if (v10)
    objc_setProperty_nonatomic_copy(v10, v26, newValue, 408);
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 40));
  v34[0] = v23;
  v34[1] = 3221225472;
  v34[2] = __64__FCCKContentBatchedRefreshRecordsOperation__continueRefreshing__block_invoke_5;
  v34[3] = &unk_1E4647EB8;
  v28 = *(void **)(a1 + 40);
  v34[4] = *(_QWORD *)(a1 + 32);
  v35 = v24;
  v36 = v25;
  v37 = v27;
  v38 = v4;
  v39 = v28;
  v29 = v4;
  v30 = v27;
  v31 = v25;
  v33 = v24;
  if (v10)
    objc_setProperty_nonatomic_copy(v10, v32, v34, 416);
  objc_msgSend(*(id *)(a1 + 32), "associateChildOperation:", v10);
  -[FCOperation start](v10, "start");

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allOperationErrors, 0);
  objc_storeStrong((id *)&self->_errorsByRecordID, 0);
  objc_storeStrong((id *)&self->_deletedRecordIDs, 0);
  objc_storeStrong((id *)&self->_updatedRecordsByRecordID, 0);
  objc_storeStrong((id *)&self->_refreshedRecordIDs, 0);
  objc_storeStrong((id *)&self->_remainingRecordIDBatches, 0);
  objc_storeStrong(&self->_refreshRecordsCompletionBlock, 0);
  objc_storeStrong((id *)&self->_canaryRecordID, 0);
  objc_storeStrong((id *)&self->_desiredKeys, 0);
  objc_storeStrong((id *)&self->_changeTagsByRecordID, 0);
  objc_storeStrong((id *)&self->_recordIDs, 0);
  objc_storeStrong((id *)&self->_database, 0);
}

@end
