@implementation FCCKPrivateFetchRecordsOperation

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
  v8.super_class = (Class)FCCKPrivateFetchRecordsOperation;
  v3 = -[FCCKPrivateDatabaseOperation validateOperation](&v8, sel_validateOperation);
  -[FCCKPrivateFetchRecordsOperation recordIDs](self, "recordIDs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (!v5 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("can't fetch an empty list of record IDs"));
    *(_DWORD *)buf = 136315906;
    v10 = "-[FCCKPrivateFetchRecordsOperation validateOperation]";
    v11 = 2080;
    v12 = "FCCKPrivateFetchRecordsOperation.m";
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
  FCCKPrivateFetchRecordsOperation *v12;

  v3 = objc_alloc_init(FCCKPrivateDatabaseCKOperationResults);
  if (-[FCCKPrivateDatabaseOperation skipPreflight](self, "skipPreflight"))
    v4 = 3;
  else
    v4 = 2;
  -[FCCKPrivateDatabaseOperation database](self, "database");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCCKPrivateFetchRecordsOperation recordIDs](self, "recordIDs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __52__FCCKPrivateFetchRecordsOperation_performOperation__block_invoke;
  v10[3] = &unk_1E463D360;
  v11 = v3;
  v12 = self;
  v8 = v3;
  -[FCCKPrivateDatabase enumeratePayloadsWithRecordIDs:records:zoneIDs:zones:options:payloadHandler:]((uint64_t)v5, v6, 0, 0, 0, v4, v10);

  v9[0] = v7;
  v9[1] = 3221225472;
  v9[2] = __52__FCCKPrivateFetchRecordsOperation_performOperation__block_invoke_3;
  v9[3] = &unk_1E463B408;
  v9[4] = self;
  -[FCCKPrivateDatabaseCKOperationResults notifyWhenFinishWithQoS:completionHandler:](v8, "notifyWhenFinishWithQoS:completionHandler:", -[FCCKPrivateFetchRecordsOperation qualityOfService](self, "qualityOfService"), v9);

}

void __52__FCCKPrivateFetchRecordsOperation_performOperation__block_invoke(uint64_t a1, void *a2)
{
  _QWORD *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, void *, void *);
  void *v13;
  id v14;
  id v15;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "operationWillStart");
  v4 = objc_alloc_init(MEMORY[0x1E0C94E18]);
  if (v3)
    v5 = (void *)v3[1];
  else
    v5 = 0;
  v6 = v5;
  objc_msgSend(v4, "setRecordIDs:", v6);

  objc_msgSend(*(id *)(a1 + 40), "desiredKeys");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDesiredKeys:", v7);

  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __52__FCCKPrivateFetchRecordsOperation_performOperation__block_invoke_2;
  v13 = &unk_1E46446B8;
  v14 = *(id *)(a1 + 32);
  v15 = v3;
  v8 = v3;
  objc_msgSend(v4, "setFetchRecordsCompletionBlock:", &v10);
  if (v3)
    v9 = v8[5];
  else
    v9 = 0;
  objc_msgSend(*(id *)(a1 + 40), "runChildCKOperation:destination:", v4, v9, v10, v11, v12, v13);

}

void __52__FCCKPrivateFetchRecordsOperation_performOperation__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  uint64_t v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v4 = *(void **)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v6 = a3;
  v7 = a2;
  if (v5)
    v8 = *(void **)(v5 + 8);
  else
    v8 = 0;
  v10 = v8;
  objc_msgSend(v7, "allValues");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "operationDidFinishWithItemIDs:resultItems:error:", v10, v9, v6);
}

void __52__FCCKPrivateFetchRecordsOperation_performOperation__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;

  v6 = a3;
  objc_msgSend(a2, "fc_dictionaryWithKeyBlock:", &__block_literal_global_90);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setResultRecordsByRecordID:", v5);

  objc_msgSend(*(id *)(a1 + 32), "finishedPerformingOperationWithError:", v6);
}

uint64_t __52__FCCKPrivateFetchRecordsOperation_performOperation__block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "recordID");
}

- (void)operationWillFinishWithError:(id)a3
{
  void *v4;
  void (**v5)(_QWORD, _QWORD, _QWORD);
  void *v6;
  id v7;

  v7 = a3;
  -[FCCKPrivateFetchRecordsOperation fetchRecordsCompletionBlock](self, "fetchRecordsCompletionBlock");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[FCCKPrivateFetchRecordsOperation fetchRecordsCompletionBlock](self, "fetchRecordsCompletionBlock");
    v5 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    -[FCCKPrivateFetchRecordsOperation resultRecordsByRecordID](self, "resultRecordsByRecordID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, id))v5)[2](v5, v6, v7);

  }
}

- (NSArray)recordIDs
{
  return self->_recordIDs;
}

- (void)setRecordIDs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 384);
}

- (NSArray)desiredKeys
{
  return self->_desiredKeys;
}

- (void)setDesiredKeys:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 392);
}

- (id)fetchRecordsCompletionBlock
{
  return self->_fetchRecordsCompletionBlock;
}

- (void)setFetchRecordsCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 400);
}

- (NSDictionary)resultRecordsByRecordID
{
  return self->_resultRecordsByRecordID;
}

- (void)setResultRecordsByRecordID:(id)a3
{
  objc_storeStrong((id *)&self->_resultRecordsByRecordID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resultRecordsByRecordID, 0);
  objc_storeStrong(&self->_fetchRecordsCompletionBlock, 0);
  objc_storeStrong((id *)&self->_desiredKeys, 0);
  objc_storeStrong((id *)&self->_recordIDs, 0);
}

@end
