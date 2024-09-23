@implementation FCCKPrivateFetchRecordZonesOperation

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
  v8.super_class = (Class)FCCKPrivateFetchRecordZonesOperation;
  v3 = -[FCCKPrivateDatabaseOperation validateOperation](&v8, sel_validateOperation);
  -[FCCKPrivateFetchRecordZonesOperation recordZoneIDs](self, "recordZoneIDs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (!v5 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("can't fetch an empty list of record zone IDs"));
    *(_DWORD *)buf = 136315906;
    v10 = "-[FCCKPrivateFetchRecordZonesOperation validateOperation]";
    v11 = 2080;
    v12 = "FCCKPrivateFetchRecordZonesOperation.m";
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
  FCCKPrivateFetchRecordZonesOperation *v12;

  v3 = objc_alloc_init(FCCKPrivateDatabaseCKOperationResults);
  v4 = -[FCCKPrivateDatabaseOperation skipPreflight](self, "skipPreflight");
  -[FCCKPrivateDatabaseOperation database](self, "database");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCCKPrivateFetchRecordZonesOperation recordZoneIDs](self, "recordZoneIDs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __56__FCCKPrivateFetchRecordZonesOperation_performOperation__block_invoke;
  v10[3] = &unk_1E463D360;
  v11 = v3;
  v12 = self;
  v8 = v3;
  -[FCCKPrivateDatabase enumeratePayloadsWithRecordIDs:records:zoneIDs:zones:options:payloadHandler:]((uint64_t)v5, 0, 0, v6, 0, v4, v10);

  v9[0] = v7;
  v9[1] = 3221225472;
  v9[2] = __56__FCCKPrivateFetchRecordZonesOperation_performOperation__block_invoke_3;
  v9[3] = &unk_1E463B408;
  v9[4] = self;
  -[FCCKPrivateDatabaseCKOperationResults notifyWhenFinishWithQoS:completionHandler:](v8, "notifyWhenFinishWithQoS:completionHandler:", -[FCCKPrivateFetchRecordZonesOperation qualityOfService](self, "qualityOfService"), v9);

}

void __56__FCCKPrivateFetchRecordZonesOperation_performOperation__block_invoke(uint64_t a1, void *a2)
{
  _QWORD *v3;
  id v4;
  void *v5;
  id v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, void *, void *);
  void *v12;
  id v13;
  id v14;

  v3 = a2;
  v4 = objc_alloc_init(MEMORY[0x1E0C94E08]);
  if (v3)
    v5 = (void *)v3[3];
  else
    v5 = 0;
  v6 = v5;
  objc_msgSend(v4, "setRecordZoneIDs:", v6);

  objc_msgSend(*(id *)(a1 + 32), "operationWillStart");
  v9 = MEMORY[0x1E0C809B0];
  v10 = 3221225472;
  v11 = __56__FCCKPrivateFetchRecordZonesOperation_performOperation__block_invoke_2;
  v12 = &unk_1E46446B8;
  v13 = *(id *)(a1 + 32);
  v14 = v3;
  v7 = v3;
  objc_msgSend(v4, "setFetchRecordZonesCompletionBlock:", &v9);
  if (v3)
    v8 = v7[5];
  else
    v8 = 0;
  objc_msgSend(*(id *)(a1 + 40), "runChildCKOperation:destination:", v4, v8, v9, v10, v11, v12);

}

void __56__FCCKPrivateFetchRecordZonesOperation_performOperation__block_invoke_2(uint64_t a1, void *a2, void *a3)
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
    v8 = *(void **)(v5 + 24);
  else
    v8 = 0;
  v10 = v8;
  objc_msgSend(v7, "allValues");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "operationDidFinishWithItemIDs:resultItems:error:", v10, v9, v6);
}

void __56__FCCKPrivateFetchRecordZonesOperation_performOperation__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;

  v6 = a3;
  objc_msgSend(a2, "fc_dictionaryWithKeyBlock:", &__block_literal_global_79);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setResultRecordZonesByZoneID:", v5);

  objc_msgSend(*(id *)(a1 + 32), "finishedPerformingOperationWithError:", v6);
}

uint64_t __56__FCCKPrivateFetchRecordZonesOperation_performOperation__block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "zoneID");
}

- (void)operationWillFinishWithError:(id)a3
{
  void *v4;
  void (**v5)(_QWORD, _QWORD, _QWORD);
  void *v6;
  id v7;

  v7 = a3;
  -[FCCKPrivateFetchRecordZonesOperation fetchRecordZonesCompletionBlock](self, "fetchRecordZonesCompletionBlock");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[FCCKPrivateFetchRecordZonesOperation fetchRecordZonesCompletionBlock](self, "fetchRecordZonesCompletionBlock");
    v5 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    -[FCCKPrivateFetchRecordZonesOperation resultRecordZonesByZoneID](self, "resultRecordZonesByZoneID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, id))v5)[2](v5, v6, v7);

  }
}

- (NSArray)recordZoneIDs
{
  return self->_recordZoneIDs;
}

- (void)setRecordZoneIDs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 384);
}

- (id)fetchRecordZonesCompletionBlock
{
  return self->_fetchRecordZonesCompletionBlock;
}

- (void)setFetchRecordZonesCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 392);
}

- (NSDictionary)resultRecordZonesByZoneID
{
  return self->_resultRecordZonesByZoneID;
}

- (void)setResultRecordZonesByZoneID:(id)a3
{
  objc_storeStrong((id *)&self->_resultRecordZonesByZoneID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resultRecordZonesByZoneID, 0);
  objc_storeStrong(&self->_fetchRecordZonesCompletionBlock, 0);
  objc_storeStrong((id *)&self->_recordZoneIDs, 0);
}

@end
