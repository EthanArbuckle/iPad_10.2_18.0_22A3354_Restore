@implementation FCCKPrivateFetchRecordZoneChangesOperation

- (BOOL)validateOperation
{
  BOOL v3;
  void *v4;
  void *v6;
  objc_super v7;
  uint8_t buf[4];
  const char *v9;
  __int16 v10;
  char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v7.receiver = self;
  v7.super_class = (Class)FCCKPrivateFetchRecordZoneChangesOperation;
  v3 = -[FCCKPrivateDatabaseOperation validateOperation](&v7, sel_validateOperation);
  -[FCCKPrivateFetchRecordZoneChangesOperation recordZoneID](self, "recordZoneID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("can't fetch zone changes without a zone ID"));
    *(_DWORD *)buf = 136315906;
    v9 = "-[FCCKPrivateFetchRecordZoneChangesOperation validateOperation]";
    v10 = 2080;
    v11 = "FCCKPrivateFetchRecordZoneChangesOperation.m";
    v12 = 1024;
    v13 = 35;
    v14 = 2114;
    v15 = v6;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  return v4 && v3;
}

- (void)performOperation
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[5];
  _QWORD v19[5];
  id v20;
  id v21;
  uint64_t *v22;
  _QWORD v23[4];
  id v24;
  _QWORD v25[4];
  id v26;
  _QWORD v27[5];
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  _QWORD v35[2];

  v35[1] = *MEMORY[0x1E0C80C00];
  v28 = 0;
  v29 = &v28;
  if (-[FCCKPrivateDatabaseOperation skipPreflight](self, "skipPreflight"))
    v3 = 3;
  else
    v3 = 2;
  v30 = 0x2020000000;
  v31 = 0;
  -[FCCKPrivateDatabaseOperation database](self, "database");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCCKPrivateFetchRecordZoneChangesOperation recordZoneID](self, "recordZoneID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v35[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __62__FCCKPrivateFetchRecordZoneChangesOperation_performOperation__block_invoke;
  v27[3] = &unk_1E463F2A8;
  v27[4] = &v28;
  -[FCCKPrivateDatabase enumeratePayloadsWithRecordIDs:records:zoneIDs:zones:options:payloadHandler:]((uint64_t)v4, 0, 0, v6, 0, v3, v27);

  v8 = objc_alloc_init(MEMORY[0x1E0C94DE8]);
  -[FCCKPrivateFetchRecordZoneChangesOperation recordZoneID](self, "recordZoneID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v34, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setRecordZoneIDs:", v10);

  objc_msgSend(v8, "setFetchAllChanges:", -[FCCKPrivateFetchRecordZoneChangesOperation fetchAllChanges](self, "fetchAllChanges"));
  -[FCCKPrivateFetchRecordZoneChangesOperation recordZoneID](self, "recordZoneID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = v11;
  -[FCCKPrivateFetchRecordZoneChangesOperation _configurationForDestination:](self, "_configurationForDestination:", v29[3]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v33, &v32, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setConfigurationsByRecordZoneID:", v13);

  v25[0] = v7;
  v25[1] = 3221225472;
  v25[2] = __62__FCCKPrivateFetchRecordZoneChangesOperation_performOperation__block_invoke_9;
  v25[3] = &unk_1E463BBD8;
  v14 = (id)objc_opt_new();
  v26 = v14;
  objc_msgSend(v8, "setRecordChangedBlock:", v25);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v23[0] = v7;
  v23[1] = 3221225472;
  v23[2] = __62__FCCKPrivateFetchRecordZoneChangesOperation_performOperation__block_invoke_2;
  v23[3] = &unk_1E463F2D0;
  v15 = (id)objc_claimAutoreleasedReturnValue();
  v24 = v15;
  objc_msgSend(v8, "setRecordWithIDWasDeletedBlock:", v23);
  v19[0] = v7;
  v19[1] = 3221225472;
  v19[2] = __62__FCCKPrivateFetchRecordZoneChangesOperation_performOperation__block_invoke_3;
  v19[3] = &unk_1E463F2F8;
  v22 = &v28;
  v19[4] = self;
  v16 = v14;
  v20 = v16;
  v17 = v15;
  v21 = v17;
  objc_msgSend(v8, "setRecordZoneFetchCompletionBlock:", v19);
  v18[0] = v7;
  v18[1] = 3221225472;
  v18[2] = __62__FCCKPrivateFetchRecordZoneChangesOperation_performOperation__block_invoke_4;
  v18[3] = &unk_1E463EA38;
  v18[4] = self;
  objc_msgSend(v8, "setFetchRecordZoneChangesCompletionBlock:", v18);
  -[FCCKPrivateDatabaseOperation runChildCKOperation:destination:](self, "runChildCKOperation:destination:", v8, v29[3]);

  _Block_object_dispose(&v28, 8);
}

void __62__FCCKPrivateFetchRecordZoneChangesOperation_performOperation__block_invoke(uint64_t a1, void *a2)
{
  _QWORD *v3;
  uint64_t v4;
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
  v3 = a2;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24)
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("zone should only map to a single destination"));
    v6 = 136315906;
    v7 = "-[FCCKPrivateFetchRecordZoneChangesOperation performOperation]_block_invoke";
    v8 = 2080;
    v9 = "FCCKPrivateFetchRecordZoneChangesOperation.m";
    v10 = 1024;
    v11 = 58;
    v12 = 2114;
    v13 = v5;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v6, 0x26u);

    if (v3)
      goto LABEL_4;
LABEL_7:
    v4 = 0;
    goto LABEL_5;
  }
  if (!v3)
    goto LABEL_7;
LABEL_4:
  v4 = v3[5];
LABEL_5:
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v4;

}

uint64_t __62__FCCKPrivateFetchRecordZoneChangesOperation_performOperation__block_invoke_9(uint64_t result, uint64_t a2)
{
  if (a2)
    return objc_msgSend(*(id *)(result + 32), "addObject:", a2);
  return result;
}

uint64_t __62__FCCKPrivateFetchRecordZoneChangesOperation_performOperation__block_invoke_2(uint64_t result, uint64_t a2)
{
  if (a2)
    return objc_msgSend(*(id *)(result + 32), "addObject:", a2);
  return result;
}

void __62__FCCKPrivateFetchRecordZoneChangesOperation_performOperation__block_invoke_3(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5)
{
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  id v11;

  if (a3)
  {
    v7 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
    v8 = *(void **)(a1 + 32);
    v9 = a3;
    objc_msgSend(v8, "previousServerChangeToken");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[FCCKPrivateDatabaseServerChangeToken tokenByAddingCKToken:forDestination:toToken:](FCCKPrivateDatabaseServerChangeToken, "tokenByAddingCKToken:forDestination:toToken:", v9, v7, v10);
    v11 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = 0;
  }
  objc_msgSend(*(id *)(a1 + 32), "setResultChangedRecords:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "setResultDeletedRecordIDs:", *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "setResultServerChangeToken:", v11);
  objc_msgSend(*(id *)(a1 + 32), "setResultMoreComing:", a5);

}

uint64_t __62__FCCKPrivateFetchRecordZoneChangesOperation_performOperation__block_invoke_4(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishedPerformingOperationWithError:", a2);
}

- (void)operationWillFinishWithError:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void (**v17)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  id v18;

  v4 = a3;
  -[FCCKPrivateFetchRecordZoneChangesOperation resultServerChangeToken](self, "resultServerChangeToken");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[FCCKPrivateFetchRecordZoneChangesOperation resultMoreComing](self, "resultMoreComing");
  v18 = v4;
  -[FCCKPrivateFetchRecordZoneChangesOperation resultChangedRecords](self, "resultChangedRecords");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCCKPrivateFetchRecordZoneChangesOperation resultDeletedRecordIDs](self, "resultDeletedRecordIDs");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    if (!v5)
    {
      -[FCCKPrivateFetchRecordZoneChangesOperation previousServerChangeToken](self, "previousServerChangeToken");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v6 = objc_msgSend(v18, "fc_isMissingZoneError") ^ 1;
    v9 = v18;
    goto LABEL_15;
  }
  -[FCCKPrivateFetchRecordZoneChangesOperation previousServerChangeToken](self, "previousServerChangeToken");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "BOOLForKey:", CFSTR("simulate_expired_change_tokens")))
    {

LABEL_9:
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0C947D8], 21, MEMORY[0x1E0C9AA70]);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    }
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "BOOLForKey:", CFSTR("simulate_server_side_data_reset"));

    if (v12)
      goto LABEL_9;
    v9 = 0;
  }
LABEL_11:
  -[FCCKPrivateFetchRecordZoneChangesOperation previousServerChangeToken](self, "previousServerChangeToken");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "BOOLForKey:", CFSTR("simulate_server_side_data_reset"));

    if (v15)
    {

      v7 = (void *)MEMORY[0x1E0C9AA60];
      v8 = (void *)MEMORY[0x1E0C9AA60];
    }
  }
LABEL_15:
  -[FCCKPrivateFetchRecordZoneChangesOperation fetchRecordZoneChangesCompletionBlock](self, "fetchRecordZoneChangesCompletionBlock");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    -[FCCKPrivateFetchRecordZoneChangesOperation fetchRecordZoneChangesCompletionBlock](self, "fetchRecordZoneChangesCompletionBlock");
    v17 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, void *, void *, uint64_t, void *))v17)[2](v17, v7, v8, v5, v6, v9);

  }
}

- (id)_configurationForDestination:(int64_t)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = objc_alloc_init(MEMORY[0x1E0C94DD8]);
  -[FCCKPrivateFetchRecordZoneChangesOperation previousServerChangeToken](self, "previousServerChangeToken");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "changeTokenForDestination:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPreviousServerChangeToken:", v7);

  -[FCCKPrivateFetchRecordZoneChangesOperation desiredKeys](self, "desiredKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDesiredKeys:", v8);

  objc_msgSend(v5, "setFetchNewestChangesFirst:", -[FCCKPrivateFetchRecordZoneChangesOperation fetchNewestChangesFirst](self, "fetchNewestChangesFirst"));
  return v5;
}

- (CKRecordZoneID)recordZoneID
{
  return self->_recordZoneID;
}

- (void)setRecordZoneID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 392);
}

- (FCCKPrivateDatabaseServerChangeToken)previousServerChangeToken
{
  return self->_previousServerChangeToken;
}

- (void)setPreviousServerChangeToken:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 400);
}

- (NSArray)desiredKeys
{
  return self->_desiredKeys;
}

- (void)setDesiredKeys:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 408);
}

- (BOOL)fetchNewestChangesFirst
{
  return self->_fetchNewestChangesFirst;
}

- (void)setFetchNewestChangesFirst:(BOOL)a3
{
  self->_fetchNewestChangesFirst = a3;
}

- (BOOL)fetchAllChanges
{
  return self->_fetchAllChanges;
}

- (void)setFetchAllChanges:(BOOL)a3
{
  self->_fetchAllChanges = a3;
}

- (id)fetchRecordZoneChangesCompletionBlock
{
  return self->_fetchRecordZoneChangesCompletionBlock;
}

- (void)setFetchRecordZoneChangesCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 416);
}

- (NSArray)resultChangedRecords
{
  return self->_resultChangedRecords;
}

- (void)setResultChangedRecords:(id)a3
{
  objc_storeStrong((id *)&self->_resultChangedRecords, a3);
}

- (NSArray)resultDeletedRecordIDs
{
  return self->_resultDeletedRecordIDs;
}

- (void)setResultDeletedRecordIDs:(id)a3
{
  objc_storeStrong((id *)&self->_resultDeletedRecordIDs, a3);
}

- (FCCKPrivateDatabaseServerChangeToken)resultServerChangeToken
{
  return self->_resultServerChangeToken;
}

- (void)setResultServerChangeToken:(id)a3
{
  objc_storeStrong((id *)&self->_resultServerChangeToken, a3);
}

- (BOOL)resultMoreComing
{
  return self->_resultMoreComing;
}

- (void)setResultMoreComing:(BOOL)a3
{
  self->_resultMoreComing = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resultServerChangeToken, 0);
  objc_storeStrong((id *)&self->_resultDeletedRecordIDs, 0);
  objc_storeStrong((id *)&self->_resultChangedRecords, 0);
  objc_storeStrong(&self->_fetchRecordZoneChangesCompletionBlock, 0);
  objc_storeStrong((id *)&self->_desiredKeys, 0);
  objc_storeStrong((id *)&self->_previousServerChangeToken, 0);
  objc_storeStrong((id *)&self->_recordZoneID, 0);
}

@end
