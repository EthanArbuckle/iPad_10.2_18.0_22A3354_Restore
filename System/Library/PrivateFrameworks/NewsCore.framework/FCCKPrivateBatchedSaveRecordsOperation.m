@implementation FCCKPrivateBatchedSaveRecordsOperation

- (FCCKPrivateBatchedSaveRecordsOperation)init
{
  FCCKPrivateBatchedSaveRecordsOperation *v2;
  FCCKPrivateBatchedSaveRecordsOperation *v3;
  NSMutableArray *v4;
  NSMutableArray *remainingBatchesOfRecordsToSave;
  NSMutableArray *v6;
  NSMutableArray *resultSavedRecords;
  NSMutableDictionary *v8;
  NSMutableDictionary *resultErrorsByRecordID;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)FCCKPrivateBatchedSaveRecordsOperation;
  v2 = -[FCOperation init](&v11, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_skipPreflight = 0;
    v2->_handleIdentityLoss = 1;
    v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    remainingBatchesOfRecordsToSave = v3->_remainingBatchesOfRecordsToSave;
    v3->_remainingBatchesOfRecordsToSave = v4;

    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    resultSavedRecords = v3->_resultSavedRecords;
    v3->_resultSavedRecords = v6;

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
  -[FCCKPrivateBatchedSaveRecordsOperation database](self, "database");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("modify operation must have a database"));
    v8 = 136315906;
    v9 = "-[FCCKPrivateBatchedSaveRecordsOperation validateOperation]";
    v10 = 2080;
    v11 = "FCCKPrivateBatchedSaveRecordsOperation.m";
    v12 = 1024;
    v13 = 50;
    v14 = 2114;
    v15 = v7;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v8, 0x26u);

  }
  -[FCCKPrivateBatchedSaveRecordsOperation database](self, "database");
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
  void *v7;
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  unint64_t v12;

  -[FCCKPrivateBatchedSaveRecordsOperation recordsToSave](self, "recordsToSave");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    -[FCCKPrivateBatchedSaveRecordsOperation remainingBatchesOfRecordsToSave](self, "remainingBatchesOfRecordsToSave");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCCKPrivateBatchedSaveRecordsOperation recordsToSave](self, "recordsToSave");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v6);

    -[FCCKPrivateBatchedSaveRecordsOperation remainingBatchesOfRecordsToSave](self, "remainingBatchesOfRecordsToSave");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count");

    if (v9 >= 0x191)
    {
      do
      {
        -[FCCKPrivateBatchedSaveRecordsOperation _subdivideRemainingBatches](self, "_subdivideRemainingBatches");
        -[FCCKPrivateBatchedSaveRecordsOperation remainingBatchesOfRecordsToSave](self, "remainingBatchesOfRecordsToSave");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "firstObject");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "count");

      }
      while (v12 > 0x190);
    }
  }
  -[FCCKPrivateBatchedSaveRecordsOperation _continueModifying](self, "_continueModifying");
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
    -[FCCKPrivateBatchedSaveRecordsOperation resultErrorsByRecordID](self, "resultErrorsByRecordID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "count");

    if (v6)
    {
      v7 = (void *)MEMORY[0x1E0CB35C8];
      v8 = *MEMORY[0x1E0C947D8];
      v14 = *MEMORY[0x1E0C94940];
      -[FCCKPrivateBatchedSaveRecordsOperation resultErrorsByRecordID](self, "resultErrorsByRecordID");
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
  -[FCCKPrivateBatchedSaveRecordsOperation saveRecordsCompletionBlock](self, "saveRecordsCompletionBlock");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[FCCKPrivateBatchedSaveRecordsOperation saveRecordsCompletionBlock](self, "saveRecordsCompletionBlock");
    v12 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    -[FCCKPrivateBatchedSaveRecordsOperation resultSavedRecords](self, "resultSavedRecords");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, id))v12)[2](v12, v13, v4);

  }
}

- (void)_continueModifying
{
  void *v3;
  void *v4;
  FCCKPrivateSaveRecordsOperation *v5;
  void *v6;
  _QWORD v7[5];

  -[FCCKPrivateBatchedSaveRecordsOperation remainingBatchesOfRecordsToSave](self, "remainingBatchesOfRecordsToSave");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "count"))
  {
    v5 = objc_alloc_init(FCCKPrivateSaveRecordsOperation);
    -[FCCKPrivateSaveRecordsOperation setRecordsToSave:](v5, "setRecordsToSave:", v4);
    -[FCCKPrivateSaveRecordsOperation setSavePolicy:](v5, "setSavePolicy:", -[FCCKPrivateBatchedSaveRecordsOperation savePolicy](self, "savePolicy"));
    -[FCCKPrivateDatabaseOperation setSkipPreflight:](v5, "setSkipPreflight:", -[FCCKPrivateBatchedSaveRecordsOperation skipPreflight](self, "skipPreflight"));
    -[FCCKPrivateDatabaseOperation setHandleIdentityLoss:](v5, "setHandleIdentityLoss:", -[FCCKPrivateBatchedSaveRecordsOperation handleIdentityLoss](self, "handleIdentityLoss"));
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __60__FCCKPrivateBatchedSaveRecordsOperation__continueModifying__block_invoke;
    v7[3] = &unk_1E463B408;
    v7[4] = self;
    -[FCCKPrivateSaveRecordsOperation setSaveRecordsCompletionBlock:](v5, "setSaveRecordsCompletionBlock:", v7);
    -[FCOperation associateChildOperation:](self, "associateChildOperation:", v5);
    -[FCCKPrivateBatchedSaveRecordsOperation database](self, "database");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCCKPrivateDatabase addOperation:]((uint64_t)v6, v5);

  }
  else
  {
    -[FCOperation finishedPerformingOperationWithError:](self, "finishedPerformingOperationWithError:", 0);
  }

}

void __60__FCCKPrivateBatchedSaveRecordsOperation__continueModifying__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a2;
  v5 = a3;
  if (objc_msgSend(v5, "fc_isCKErrorWithCode:", 27))
  {
    objc_msgSend(*(id *)(a1 + 32), "_subdivideRemainingBatches");
    objc_msgSend(*(id *)(a1 + 32), "_continueModifying");
  }
  else if (v5 && objc_msgSend(v5, "code") != 2)
  {
    objc_msgSend(*(id *)(a1 + 32), "finishedPerformingOperationWithError:", v5);
  }
  else
  {
    if (v13)
    {
      objc_msgSend(*(id *)(a1 + 32), "resultSavedRecords");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addObjectsFromArray:", v13);

    }
    objc_msgSend(*(id *)(a1 + 32), "remainingBatchesOfRecordsToSave");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count");

    if (v8)
    {
      objc_msgSend(*(id *)(a1 + 32), "remainingBatchesOfRecordsToSave");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "fc_removeFirstObject");

    }
    objc_msgSend(v5, "userInfo");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x1E0C94940]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_msgSend(*(id *)(a1 + 32), "resultErrorsByRecordID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addEntriesFromDictionary:", v11);

    }
    objc_msgSend(*(id *)(a1 + 32), "_continueModifying");

  }
}

- (void)_subdivideRemainingBatches
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  unint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  -[FCCKPrivateBatchedSaveRecordsOperation remainingBatchesOfRecordsToSave](self, "remainingBatchesOfRecordsToSave");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  -[FCCKPrivateBatchedSaveRecordsOperation remainingBatchesOfRecordsToSave](self, "remainingBatchesOfRecordsToSave");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeAllObjects");

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        v12 = (unint64_t)objc_msgSend(v11, "count", (_QWORD)v17) >> 1;
        objc_msgSend(v11, "subarrayWithRange:", 0, v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "subarrayWithRange:", v12, objc_msgSend(v11, "count") - v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[FCCKPrivateBatchedSaveRecordsOperation remainingBatchesOfRecordsToSave](self, "remainingBatchesOfRecordsToSave");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "addObject:", v13);

        -[FCCKPrivateBatchedSaveRecordsOperation remainingBatchesOfRecordsToSave](self, "remainingBatchesOfRecordsToSave");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "addObject:", v14);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v8);
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

- (NSArray)recordsToSave
{
  return self->_recordsToSave;
}

- (void)setRecordsToSave:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 384);
}

- (int64_t)savePolicy
{
  return self->_savePolicy;
}

- (void)setSavePolicy:(int64_t)a3
{
  self->_savePolicy = a3;
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

- (id)saveRecordsCompletionBlock
{
  return self->_saveRecordsCompletionBlock;
}

- (void)setSaveRecordsCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 400);
}

- (NSMutableArray)remainingBatchesOfRecordsToSave
{
  return self->_remainingBatchesOfRecordsToSave;
}

- (void)setRemainingBatchesOfRecordsToSave:(id)a3
{
  objc_storeStrong((id *)&self->_remainingBatchesOfRecordsToSave, a3);
}

- (NSMutableArray)resultSavedRecords
{
  return self->_resultSavedRecords;
}

- (void)setResultSavedRecords:(id)a3
{
  objc_storeStrong((id *)&self->_resultSavedRecords, a3);
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
  objc_storeStrong((id *)&self->_resultSavedRecords, 0);
  objc_storeStrong((id *)&self->_remainingBatchesOfRecordsToSave, 0);
  objc_storeStrong(&self->_saveRecordsCompletionBlock, 0);
  objc_storeStrong((id *)&self->_recordsToSave, 0);
  objc_storeStrong((id *)&self->_database, 0);
}

@end
