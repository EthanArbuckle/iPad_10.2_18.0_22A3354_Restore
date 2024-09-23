@implementation FCCKPrivateSaveRecordsOperation

- (BOOL)validateOperation
{
  BOOL v3;
  void *v4;
  uint64_t v5;
  void *v7;
  objc_super v8;
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
  v8.receiver = self;
  v8.super_class = (Class)FCCKPrivateSaveRecordsOperation;
  v3 = -[FCCKPrivateDatabaseOperation validateOperation](&v8, sel_validateOperation);
  -[FCCKPrivateSaveRecordsOperation recordsToSave](self, "recordsToSave");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (!v5 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("can't save records without records to save"));
    *(_DWORD *)buf = 136315906;
    v10 = "-[FCCKPrivateSaveRecordsOperation validateOperation]";
    v11 = 2080;
    v12 = "FCCKPrivateSaveRecordsOperation.m";
    v13 = 1024;
    v14 = 27;
    v15 = 2114;
    v16 = v7;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  return v5 && v3;
}

- (void)performOperation
{
  FCCKPrivateDatabaseCKOperationResults *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  FCCKPrivateDatabaseCKOperationResults *v8;
  _QWORD v9[5];
  _QWORD v10[4];
  FCCKPrivateDatabaseCKOperationResults *v11;
  FCCKPrivateSaveRecordsOperation *v12;

  v3 = objc_alloc_init(FCCKPrivateDatabaseCKOperationResults);
  if (-[FCCKPrivateDatabaseOperation skipPreflight](self, "skipPreflight"))
    v4 = 3;
  else
    v4 = 2;
  -[FCCKPrivateDatabaseOperation database](self, "database");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCCKPrivateSaveRecordsOperation recordsToSave](self, "recordsToSave");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __51__FCCKPrivateSaveRecordsOperation_performOperation__block_invoke;
  v10[3] = &unk_1E463D360;
  v11 = v3;
  v12 = self;
  v8 = v3;
  -[FCCKPrivateDatabase enumeratePayloadsWithRecordIDs:records:zoneIDs:zones:options:payloadHandler:]((uint64_t)v5, 0, v6, 0, 0, v4, v10);

  v9[0] = v7;
  v9[1] = 3221225472;
  v9[2] = __51__FCCKPrivateSaveRecordsOperation_performOperation__block_invoke_4;
  v9[3] = &unk_1E463B408;
  v9[4] = self;
  -[FCCKPrivateDatabaseCKOperationResults notifyWhenFinishWithQoS:completionHandler:](v8, "notifyWhenFinishWithQoS:completionHandler:", -[FCCKPrivateSaveRecordsOperation qualityOfService](self, "qualityOfService"), v9);

}

void __51__FCCKPrivateSaveRecordsOperation_performOperation__block_invoke(uint64_t a1, void *a2)
{
  _QWORD *v3;
  id v4;
  void *v5;
  id v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, void *, uint64_t, void *);
  void *v12;
  id v13;
  id v14;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "operationWillStart");
  v4 = objc_alloc_init(MEMORY[0x1E0C94F10]);
  if (v3)
    v5 = (void *)v3[2];
  else
    v5 = 0;
  v6 = v5;
  objc_msgSend(v4, "setRecordsToSave:", v6);

  objc_msgSend(v4, "setSavePolicy:", objc_msgSend(*(id *)(a1 + 40), "savePolicy"));
  objc_msgSend(v4, "setAtomic:", 0);
  -[CKDatabaseOperation setFc_canBypassEncryptionRequirement:](v4, objc_msgSend(*(id *)(a1 + 40), "canBypassEncryptionRequirement"));
  v9 = MEMORY[0x1E0C809B0];
  v10 = 3221225472;
  v11 = __51__FCCKPrivateSaveRecordsOperation_performOperation__block_invoke_2;
  v12 = &unk_1E463D338;
  v13 = v3;
  v14 = *(id *)(a1 + 32);
  v7 = v3;
  objc_msgSend(v4, "setModifyRecordsCompletionBlock:", &v9);
  if (v3)
    v8 = v7[5];
  else
    v8 = 0;
  objc_msgSend(*(id *)(a1 + 40), "runChildCKOperation:destination:", v4, v8, v9, v10, v11, v12);

}

void __51__FCCKPrivateSaveRecordsOperation_performOperation__block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;

  v6 = *(_QWORD *)(a1 + 32);
  v7 = a4;
  v8 = a2;
  if (v6)
    v9 = *(void **)(v6 + 16);
  else
    v9 = 0;
  v10 = v9;
  objc_msgSend(v10, "fc_arrayByTransformingWithBlock:", &__block_literal_global_143);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "operationDidFinishWithItemIDs:resultItems:error:", v11, v8, v7);
}

uint64_t __51__FCCKPrivateSaveRecordsOperation_performOperation__block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "recordID");
}

void __51__FCCKPrivateSaveRecordsOperation_performOperation__block_invoke_4(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(v5, "setResultSavedRecords:", a2);
  objc_msgSend(*(id *)(a1 + 32), "finishedPerformingOperationWithError:", v6);

}

- (void)operationWillFinishWithError:(id)a3
{
  void *v4;
  void (**v5)(_QWORD, _QWORD, _QWORD);
  void *v6;
  id v7;

  v7 = a3;
  -[FCCKPrivateSaveRecordsOperation saveRecordsCompletionBlock](self, "saveRecordsCompletionBlock");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[FCCKPrivateSaveRecordsOperation saveRecordsCompletionBlock](self, "saveRecordsCompletionBlock");
    v5 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    -[FCCKPrivateSaveRecordsOperation resultSavedRecords](self, "resultSavedRecords");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, id))v5)[2](v5, v6, v7);

  }
}

- (NSArray)recordsToSave
{
  return self->_recordsToSave;
}

- (void)setRecordsToSave:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 392);
}

- (int64_t)savePolicy
{
  return self->_savePolicy;
}

- (void)setSavePolicy:(int64_t)a3
{
  self->_savePolicy = a3;
}

- (BOOL)canBypassEncryptionRequirement
{
  return self->_canBypassEncryptionRequirement;
}

- (void)setCanBypassEncryptionRequirement:(BOOL)a3
{
  self->_canBypassEncryptionRequirement = a3;
}

- (id)saveRecordsCompletionBlock
{
  return self->_saveRecordsCompletionBlock;
}

- (void)setSaveRecordsCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 408);
}

- (NSArray)resultSavedRecords
{
  return self->_resultSavedRecords;
}

- (void)setResultSavedRecords:(id)a3
{
  objc_storeStrong((id *)&self->_resultSavedRecords, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resultSavedRecords, 0);
  objc_storeStrong(&self->_saveRecordsCompletionBlock, 0);
  objc_storeStrong((id *)&self->_recordsToSave, 0);
}

@end
