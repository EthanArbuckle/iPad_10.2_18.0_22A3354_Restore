@implementation FCCKPrivateSaveRecordZonesOperation

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
  v8.super_class = (Class)FCCKPrivateSaveRecordZonesOperation;
  v3 = -[FCCKPrivateDatabaseOperation validateOperation](&v8, sel_validateOperation);
  -[FCCKPrivateSaveRecordZonesOperation recordZonesToSave](self, "recordZonesToSave");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (!v5 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("can't save zones without zones to save"));
    *(_DWORD *)buf = 136315906;
    v10 = "-[FCCKPrivateSaveRecordZonesOperation validateOperation]";
    v11 = 2080;
    v12 = "FCCKPrivateSaveRecordZonesOperation.m";
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
  -[FCCKPrivateDatabaseOperation database](self, "database");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCCKPrivateSaveRecordZonesOperation recordZonesToSave](self, "recordZonesToSave");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __55__FCCKPrivateSaveRecordZonesOperation_performOperation__block_invoke;
  v10[3] = &unk_1E463D360;
  v10[4] = self;
  v11 = v3;
  v8 = v3;
  -[FCCKPrivateDatabase enumeratePayloadsWithRecordIDs:records:zoneIDs:zones:options:payloadHandler:]((uint64_t)v5, 0, 0, 0, v6, v4, v10);

  v9[0] = v7;
  v9[1] = 3221225472;
  v9[2] = __55__FCCKPrivateSaveRecordZonesOperation_performOperation__block_invoke_2_10;
  v9[3] = &unk_1E463B408;
  v9[4] = self;
  -[FCCKPrivateDatabaseCKOperationResults notifyWhenFinishWithQoS:completionHandler:](v8, "notifyWhenFinishWithQoS:completionHandler:", -[FCCKPrivateSaveRecordZonesOperation qualityOfService](self, "qualityOfService"), v9);

}

void __55__FCCKPrivateSaveRecordZonesOperation_performOperation__block_invoke(uint64_t a1, void *a2)
{
  _QWORD *v3;
  id v4;
  void *v5;
  id v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, void *, void *, void *);
  void *v12;
  id v13;
  id v14;

  v3 = a2;
  v4 = objc_alloc_init(MEMORY[0x1E0C94EF0]);
  if (v3)
    v5 = (void *)v3[4];
  else
    v5 = 0;
  v6 = v5;
  objc_msgSend(v4, "setRecordZonesToSave:", v6);

  -[CKDatabaseOperation setFc_canBypassEncryptionRequirement:](v4, objc_msgSend(*(id *)(a1 + 32), "canBypassEncryptionRequirement"));
  objc_msgSend(*(id *)(a1 + 40), "operationWillStart");
  v9 = MEMORY[0x1E0C809B0];
  v10 = 3221225472;
  v11 = __55__FCCKPrivateSaveRecordZonesOperation_performOperation__block_invoke_2;
  v12 = &unk_1E463D338;
  v13 = v3;
  v14 = *(id *)(a1 + 40);
  v7 = v3;
  objc_msgSend(v4, "setModifyRecordZonesCompletionBlock:", &v9);
  if (v3)
    v8 = v7[5];
  else
    v8 = 0;
  objc_msgSend(*(id *)(a1 + 32), "runChildCKOperation:destination:", v4, v8, v9, v10, v11, v12);

}

void __55__FCCKPrivateSaveRecordZonesOperation_performOperation__block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  _QWORD *v9;
  _QWORD *v10;
  void *v11;
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
  v8 = a2;
  if (objc_msgSend(a3, "count") && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("shouldn't have any deleted zones when saving zones"));
    v13 = 136315906;
    v14 = "-[FCCKPrivateSaveRecordZonesOperation performOperation]_block_invoke_2";
    v15 = 2080;
    v16 = "FCCKPrivateSaveRecordZonesOperation.m";
    v17 = 1024;
    v18 = 58;
    v19 = 2114;
    v20 = v12;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v13, 0x26u);

  }
  v9 = *(_QWORD **)(a1 + 32);
  if (v9)
    v9 = (_QWORD *)v9[4];
  v10 = v9;
  objc_msgSend(v10, "fc_arrayByTransformingWithBlock:", &__block_literal_global_185);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "operationDidFinishWithItemIDs:resultItems:error:", v11, v8, v7);
}

uint64_t __55__FCCKPrivateSaveRecordZonesOperation_performOperation__block_invoke_6(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "zoneID");
}

void __55__FCCKPrivateSaveRecordZonesOperation_performOperation__block_invoke_2_10(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(v5, "setResultSavedRecordZones:", a2);
  objc_msgSend(*(id *)(a1 + 32), "finishedPerformingOperationWithError:", v6);

}

- (void)operationWillFinishWithError:(id)a3
{
  void *v4;
  void (**v5)(_QWORD, _QWORD, _QWORD);
  void *v6;
  id v7;

  v7 = a3;
  -[FCCKPrivateSaveRecordZonesOperation saveRecordZonesCompletionBlock](self, "saveRecordZonesCompletionBlock");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[FCCKPrivateSaveRecordZonesOperation saveRecordZonesCompletionBlock](self, "saveRecordZonesCompletionBlock");
    v5 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    -[FCCKPrivateSaveRecordZonesOperation resultSavedRecordZones](self, "resultSavedRecordZones");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, id))v5)[2](v5, v6, v7);

  }
}

- (NSArray)recordZonesToSave
{
  return self->_recordZonesToSave;
}

- (void)setRecordZonesToSave:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 392);
}

- (BOOL)canBypassEncryptionRequirement
{
  return self->_canBypassEncryptionRequirement;
}

- (void)setCanBypassEncryptionRequirement:(BOOL)a3
{
  self->_canBypassEncryptionRequirement = a3;
}

- (id)saveRecordZonesCompletionBlock
{
  return self->_saveRecordZonesCompletionBlock;
}

- (void)setSaveRecordZonesCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 400);
}

- (NSArray)resultSavedRecordZones
{
  return self->_resultSavedRecordZones;
}

- (void)setResultSavedRecordZones:(id)a3
{
  objc_storeStrong((id *)&self->_resultSavedRecordZones, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resultSavedRecordZones, 0);
  objc_storeStrong(&self->_saveRecordZonesCompletionBlock, 0);
  objc_storeStrong((id *)&self->_recordZonesToSave, 0);
}

@end
