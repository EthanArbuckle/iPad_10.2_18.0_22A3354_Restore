@implementation FCCKPrivateDeleteRecordZonesOperation

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
  v8.super_class = (Class)FCCKPrivateDeleteRecordZonesOperation;
  v3 = -[FCCKPrivateDatabaseOperation validateOperation](&v8, sel_validateOperation);
  -[FCCKPrivateDeleteRecordZonesOperation recordZoneIDsToDelete](self, "recordZoneIDsToDelete");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (!v5 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("can't delete zones without zone IDs to delete"));
    *(_DWORD *)buf = 136315906;
    v10 = "-[FCCKPrivateDeleteRecordZonesOperation validateOperation]";
    v11 = 2080;
    v12 = "FCCKPrivateDeleteRecordZonesOperation.m";
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
  _QWORD v10[5];
  FCCKPrivateDatabaseCKOperationResults *v11;

  v3 = objc_alloc_init(FCCKPrivateDatabaseCKOperationResults);
  v4 = -[FCCKPrivateDatabaseOperation skipPreflight](self, "skipPreflight");
  if (-[FCCKPrivateDeleteRecordZonesOperation secureDatabaseOnly](self, "secureDatabaseOnly"))
    v4 |= 4uLL;
  -[FCCKPrivateDatabaseOperation database](self, "database");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCCKPrivateDeleteRecordZonesOperation recordZoneIDsToDelete](self, "recordZoneIDsToDelete");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __57__FCCKPrivateDeleteRecordZonesOperation_performOperation__block_invoke;
  v10[3] = &unk_1E463D360;
  v10[4] = self;
  v11 = v3;
  v8 = v3;
  -[FCCKPrivateDatabase enumeratePayloadsWithRecordIDs:records:zoneIDs:zones:options:payloadHandler:]((uint64_t)v5, 0, 0, v6, 0, v4, v10);

  v9[0] = v7;
  v9[1] = 3221225472;
  v9[2] = __57__FCCKPrivateDeleteRecordZonesOperation_performOperation__block_invoke_11;
  v9[3] = &unk_1E463B408;
  v9[4] = self;
  -[FCCKPrivateDatabaseCKOperationResults notifyWhenFinishWithQoS:completionHandler:](v8, "notifyWhenFinishWithQoS:completionHandler:", -[FCCKPrivateDeleteRecordZonesOperation qualityOfService](self, "qualityOfService"), v9);

}

void __57__FCCKPrivateDeleteRecordZonesOperation_performOperation__block_invoke(uint64_t a1, void *a2)
{
  _QWORD *v3;
  id v4;
  char v5;
  void *v6;
  id v7;
  _QWORD *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, void *, void *, void *);
  void *v14;
  id v15;
  id v16;
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
  v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "secureDatabaseOnly"))
  {
    if (v3 && v3[5] == 3)
    {
      v4 = objc_alloc_init(MEMORY[0x1E0C94EF0]);
LABEL_8:
      v5 = 0;
      v6 = (void *)v3[3];
      goto LABEL_9;
    }
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("this delete-zones operation should only go to the secure database"));
      *(_DWORD *)buf = 136315906;
      v18 = "-[FCCKPrivateDeleteRecordZonesOperation performOperation]_block_invoke";
      v19 = 2080;
      v20 = "FCCKPrivateDeleteRecordZonesOperation.m";
      v21 = 1024;
      v22 = 54;
      v23 = 2114;
      v24 = v10;
      _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    }
  }
  v4 = objc_alloc_init(MEMORY[0x1E0C94EF0]);
  if (v3)
    goto LABEL_8;
  v6 = 0;
  v5 = 1;
LABEL_9:
  v7 = v6;
  objc_msgSend(v4, "setRecordZoneIDsToDelete:", v7);

  objc_msgSend(*(id *)(a1 + 40), "operationWillStart");
  v11 = MEMORY[0x1E0C809B0];
  v12 = 3221225472;
  v13 = __57__FCCKPrivateDeleteRecordZonesOperation_performOperation__block_invoke_6;
  v14 = &unk_1E463D338;
  v15 = *(id *)(a1 + 40);
  v16 = v3;
  v8 = v3;
  objc_msgSend(v4, "setModifyRecordZonesCompletionBlock:", &v11);
  if ((v5 & 1) != 0)
    v9 = 0;
  else
    v9 = v8[5];
  objc_msgSend(*(id *)(a1 + 32), "runChildCKOperation:destination:", v4, v9, v11, v12, v13, v14);

}

void __57__FCCKPrivateDeleteRecordZonesOperation_performOperation__block_invoke_6(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  _QWORD *v9;
  void *v10;
  _QWORD *v11;
  void *v12;
  int v13;
  const char *v14;
  __int16 v15;
  char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a3;
  if (objc_msgSend(a2, "count") && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("shouldn't have any saved zones when deleting zones"));
    v13 = 136315906;
    v14 = "-[FCCKPrivateDeleteRecordZonesOperation performOperation]_block_invoke";
    v15 = 2080;
    v16 = "FCCKPrivateDeleteRecordZonesOperation.m";
    v17 = 1024;
    v18 = 63;
    v19 = 2114;
    v20 = v12;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v13, 0x26u);

  }
  v10 = *(void **)(a1 + 32);
  v9 = *(_QWORD **)(a1 + 40);
  if (v9)
    v9 = (_QWORD *)v9[3];
  v11 = v9;
  objc_msgSend(v10, "operationDidFinishWithItemIDs:resultItems:error:", v11, v8, v7);

}

void __57__FCCKPrivateDeleteRecordZonesOperation_performOperation__block_invoke_11(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(v5, "setResultDeletedRecordZoneIDs:", a2);
  objc_msgSend(*(id *)(a1 + 32), "finishedPerformingOperationWithError:", v6);

}

- (void)operationWillFinishWithError:(id)a3
{
  void *v4;
  void (**v5)(_QWORD, _QWORD, _QWORD);
  void *v6;
  id v7;

  v7 = a3;
  -[FCCKPrivateDeleteRecordZonesOperation deleteRecordZonesCompletionBlock](self, "deleteRecordZonesCompletionBlock");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[FCCKPrivateDeleteRecordZonesOperation deleteRecordZonesCompletionBlock](self, "deleteRecordZonesCompletionBlock");
    v5 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    -[FCCKPrivateDeleteRecordZonesOperation resultDeletedRecordZoneIDs](self, "resultDeletedRecordZoneIDs");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, id))v5)[2](v5, v6, v7);

  }
}

- (NSArray)recordZoneIDsToDelete
{
  return self->_recordZoneIDsToDelete;
}

- (void)setRecordZoneIDsToDelete:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 392);
}

- (BOOL)secureDatabaseOnly
{
  return self->_secureDatabaseOnly;
}

- (void)setSecureDatabaseOnly:(BOOL)a3
{
  self->_secureDatabaseOnly = a3;
}

- (id)deleteRecordZonesCompletionBlock
{
  return self->_deleteRecordZonesCompletionBlock;
}

- (void)setDeleteRecordZonesCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 400);
}

- (NSArray)resultDeletedRecordZoneIDs
{
  return self->_resultDeletedRecordZoneIDs;
}

- (void)setResultDeletedRecordZoneIDs:(id)a3
{
  objc_storeStrong((id *)&self->_resultDeletedRecordZoneIDs, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resultDeletedRecordZoneIDs, 0);
  objc_storeStrong(&self->_deleteRecordZonesCompletionBlock, 0);
  objc_storeStrong((id *)&self->_recordZoneIDsToDelete, 0);
}

@end
