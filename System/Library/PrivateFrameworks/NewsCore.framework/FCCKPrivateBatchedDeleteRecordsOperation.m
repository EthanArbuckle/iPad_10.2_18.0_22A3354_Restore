@implementation FCCKPrivateBatchedDeleteRecordsOperation

- (FCCKPrivateBatchedDeleteRecordsOperation)init
{
  FCCKPrivateBatchedDeleteRecordsOperation *v2;
  FCCKPrivateBatchedDeleteRecordsOperation *v3;
  NSMutableArray *v4;
  NSMutableArray *remainingBatchesOfRecordIDsToDelete;
  NSMutableArray *v6;
  NSMutableArray *resultDeletedRecordIDs;
  NSMutableDictionary *v8;
  NSMutableDictionary *resultErrorsByRecordID;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)FCCKPrivateBatchedDeleteRecordsOperation;
  v2 = -[FCOperation init](&v11, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_skipPreflight = 0;
    v2->_handleIdentityLoss = 1;
    v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    remainingBatchesOfRecordIDsToDelete = v3->_remainingBatchesOfRecordIDsToDelete;
    v3->_remainingBatchesOfRecordIDsToDelete = v4;

    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    resultDeletedRecordIDs = v3->_resultDeletedRecordIDs;
    v3->_resultDeletedRecordIDs = v6;

    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    resultErrorsByRecordID = v3->_resultErrorsByRecordID;
    v3->_resultErrorsByRecordID = v8;

  }
  return v3;
}

- (BOOL)validateOperation
{
  void *v3;
  void *v4;
  BOOL v5;
  void *v7;
  int v8;
  const char *v9;
  __int16 v10;
  char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[FCCKPrivateBatchedDeleteRecordsOperation database](self, "database");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("modify operation must have a database"));
    v8 = 136315906;
    v9 = "-[FCCKPrivateBatchedDeleteRecordsOperation validateOperation]";
    v10 = 2080;
    v11 = "FCCKPrivateBatchedDeleteRecordsOperation.m";
    v12 = 1024;
    v13 = 46;
    v14 = 2114;
    v15 = v7;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v8, 0x26u);

  }
  -[FCCKPrivateBatchedDeleteRecordsOperation database](self, "database");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4 != 0;

  return v5;
}

- (void)performOperation
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  -[FCCKPrivateBatchedDeleteRecordsOperation recordIDsToDelete](self, "recordIDsToDelete");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    -[FCCKPrivateBatchedDeleteRecordsOperation remainingBatchesOfRecordIDsToDelete](self, "remainingBatchesOfRecordIDsToDelete");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCCKPrivateBatchedDeleteRecordsOperation recordIDsToDelete](self, "recordIDsToDelete");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v6);

  }
  -[FCCKPrivateBatchedDeleteRecordsOperation _continueModifying](self, "_continueModifying");
}

- (void)operationWillFinishWithError:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void (**v12)(_QWORD, _QWORD, _QWORD);
  void *v13;
  uint64_t v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
  {
    -[FCCKPrivateBatchedDeleteRecordsOperation resultErrorsByRecordID](self, "resultErrorsByRecordID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "count");

    if (v6)
    {
      v7 = (void *)MEMORY[0x1E0CB35C8];
      v8 = *MEMORY[0x1E0C947D8];
      v14 = *MEMORY[0x1E0C94940];
      -[FCCKPrivateBatchedDeleteRecordsOperation resultErrorsByRecordID](self, "resultErrorsByRecordID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v15[0] = v9;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "errorWithDomain:code:userInfo:", v8, 2, v10);
      v4 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v4 = 0;
    }
  }
  -[FCCKPrivateBatchedDeleteRecordsOperation deleteRecordsCompletionBlock](self, "deleteRecordsCompletionBlock");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[FCCKPrivateBatchedDeleteRecordsOperation deleteRecordsCompletionBlock](self, "deleteRecordsCompletionBlock");
    v12 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    -[FCCKPrivateBatchedDeleteRecordsOperation resultDeletedRecordIDs](self, "resultDeletedRecordIDs");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, id))v12)[2](v12, v13, v4);

  }
}

- (void)_continueModifying
{
  void *v3;
  void *v4;
  FCCKPrivateDeleteRecordsOperation *v5;
  void *v6;
  _QWORD v7[5];

  -[FCCKPrivateBatchedDeleteRecordsOperation remainingBatchesOfRecordIDsToDelete](self, "remainingBatchesOfRecordIDsToDelete");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "count"))
  {
    v5 = objc_alloc_init(FCCKPrivateDeleteRecordsOperation);
    -[FCCKPrivateDeleteRecordsOperation setRecordIDsToDelete:](v5, "setRecordIDsToDelete:", v4);
    -[FCCKPrivateDatabaseOperation setSkipPreflight:](v5, "setSkipPreflight:", -[FCCKPrivateBatchedDeleteRecordsOperation skipPreflight](self, "skipPreflight"));
    -[FCCKPrivateDatabaseOperation setHandleIdentityLoss:](v5, "setHandleIdentityLoss:", -[FCCKPrivateBatchedDeleteRecordsOperation handleIdentityLoss](self, "handleIdentityLoss"));
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __62__FCCKPrivateBatchedDeleteRecordsOperation__continueModifying__block_invoke;
    v7[3] = &unk_1E463B408;
    v7[4] = self;
    -[FCCKPrivateDeleteRecordsOperation setDeleteRecordsCompletionBlock:](v5, "setDeleteRecordsCompletionBlock:", v7);
    -[FCOperation associateChildOperation:](self, "associateChildOperation:", v5);
    -[FCCKPrivateBatchedDeleteRecordsOperation database](self, "database");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCCKPrivateDatabase addOperation:]((uint64_t)v6, v5);

  }
  else
  {
    -[FCOperation finishedPerformingOperationWithError:](self, "finishedPerformingOperationWithError:", 0);
  }

}

void __62__FCCKPrivateBatchedDeleteRecordsOperation__continueModifying__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  unint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v25 = a2;
  v5 = a3;
  if (objc_msgSend(v5, "fc_isCKErrorWithCode:", 27))
  {
    v24 = a1;
    objc_msgSend(*(id *)(a1 + 32), "remainingBatchesOfRecordIDsToDelete");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "copy");
    objc_msgSend(v6, "removeAllObjects");
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v8 = v7;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v27 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
          v14 = (unint64_t)objc_msgSend(v13, "count") >> 1;
          objc_msgSend(v13, "subarrayWithRange:", 0, v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "subarrayWithRange:", v14, objc_msgSend(v13, "count") - v14);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "addObject:", v15);
          objc_msgSend(v6, "addObject:", v16);

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      }
      while (v10);
    }

    objc_msgSend(*(id *)(v24 + 32), "_continueModifying");
  }
  else if (v5 && objc_msgSend(v5, "code") != 2)
  {
    objc_msgSend(*(id *)(a1 + 32), "finishedPerformingOperationWithError:", v5);
  }
  else
  {
    if (v25)
    {
      objc_msgSend(*(id *)(a1 + 32), "resultDeletedRecordIDs");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "addObjectsFromArray:", v25);

    }
    objc_msgSend(*(id *)(a1 + 32), "remainingBatchesOfRecordIDsToDelete");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "count");

    if (v19)
    {
      objc_msgSend(*(id *)(a1 + 32), "remainingBatchesOfRecordIDsToDelete");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "fc_removeFirstObject");

    }
    objc_msgSend(v5, "userInfo");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "objectForKeyedSubscript:", *MEMORY[0x1E0C94940]);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      objc_msgSend(*(id *)(a1 + 32), "resultErrorsByRecordID");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "addEntriesFromDictionary:", v22);

    }
    objc_msgSend(*(id *)(a1 + 32), "_continueModifying");

  }
}

- (FCCKPrivateDatabase)database
{
  return self->_database;
}

- (void)setDatabase:(id)a3
{
  objc_storeStrong((id *)&self->_database, a3);
}

- (NSArray)recordIDsToDelete
{
  return self->_recordIDsToDelete;
}

- (void)setRecordIDsToDelete:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 384);
}

- (BOOL)skipPreflight
{
  return self->_skipPreflight;
}

- (void)setSkipPreflight:(BOOL)a3
{
  self->_skipPreflight = a3;
}

- (BOOL)handleIdentityLoss
{
  return self->_handleIdentityLoss;
}

- (void)setHandleIdentityLoss:(BOOL)a3
{
  self->_handleIdentityLoss = a3;
}

- (id)deleteRecordsCompletionBlock
{
  return self->_deleteRecordsCompletionBlock;
}

- (void)setDeleteRecordsCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 392);
}

- (NSMutableArray)remainingBatchesOfRecordIDsToDelete
{
  return self->_remainingBatchesOfRecordIDsToDelete;
}

- (void)setRemainingBatchesOfRecordIDsToDelete:(id)a3
{
  objc_storeStrong((id *)&self->_remainingBatchesOfRecordIDsToDelete, a3);
}

- (NSMutableArray)resultDeletedRecordIDs
{
  return self->_resultDeletedRecordIDs;
}

- (void)setResultDeletedRecordIDs:(id)a3
{
  objc_storeStrong((id *)&self->_resultDeletedRecordIDs, a3);
}

- (NSMutableDictionary)resultErrorsByRecordID
{
  return self->_resultErrorsByRecordID;
}

- (void)setResultErrorsByRecordID:(id)a3
{
  objc_storeStrong((id *)&self->_resultErrorsByRecordID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resultErrorsByRecordID, 0);
  objc_storeStrong((id *)&self->_resultDeletedRecordIDs, 0);
  objc_storeStrong((id *)&self->_remainingBatchesOfRecordIDsToDelete, 0);
  objc_storeStrong(&self->_deleteRecordsCompletionBlock, 0);
  objc_storeStrong((id *)&self->_recordIDsToDelete, 0);
  objc_storeStrong((id *)&self->_database, 0);
}

@end
