@implementation FCPrivateRecordSyncManager

- (id)initWithRecordID:(void *)a3 desiredKeys:(void *)a4 currentState:
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v22;
  void *v23;
  objc_super v24;
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  char *v28;
  __int16 v29;
  int v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (!a1)
    goto LABEL_10;
  if (!v7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "recordID != nil");
    *(_DWORD *)buf = 136315906;
    v26 = "-[FCPrivateRecordSyncManager initWithRecordID:desiredKeys:currentState:]";
    v27 = 2080;
    v28 = "FCPrivateRecordSyncManager.m";
    v29 = 1024;
    v30 = 36;
    v31 = 2114;
    v32 = v22;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (!v8)
    {
LABEL_5:
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "desiredKeys != nil");
        *(_DWORD *)buf = 136315906;
        v26 = "-[FCPrivateRecordSyncManager initWithRecordID:desiredKeys:currentState:]";
        v27 = 2080;
        v28 = "FCPrivateRecordSyncManager.m";
        v29 = 1024;
        v30 = 37;
        v31 = 2114;
        v32 = v23;
        _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

      }
    }
  }
  else if (!v8)
  {
    goto LABEL_5;
  }
  v24.receiver = a1;
  v24.super_class = (Class)FCPrivateRecordSyncManager;
  a1 = (id *)objc_msgSendSuper2(&v24, sel_init);
  if (a1)
  {
    v10 = objc_msgSend(v7, "copy");
    v11 = a1[1];
    a1[1] = (id)v10;

    v12 = objc_msgSend(v8, "copy");
    v13 = a1[3];
    a1[3] = (id)v12;

    v14 = objc_msgSend(v9, "copy");
    v15 = a1[4];
    a1[4] = (id)v14;

    if (!a1[4])
    {
      v16 = objc_alloc_init(MEMORY[0x1E0D62798]);
      v17 = a1[4];
      a1[4] = v16;

      objc_msgSend(v7, "recordName");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[4], "setRecordName:", v18);

      objc_msgSend(v7, "zoneID");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "zoneName");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[4], "setRecordZoneName:", v20);

    }
  }
LABEL_10:

  return a1;
}

- (FCPrivateRecordSyncManager)init
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Do not call method"));
    *(_DWORD *)buf = 136315906;
    v8 = "-[FCPrivateRecordSyncManager init]";
    v9 = 2080;
    v10 = "FCPrivateRecordSyncManager.m";
    v11 = 1024;
    v12 = 58;
    v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[FCPrivateRecordSyncManager init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

- (NSDate)lastCleanDate
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C99D68];
  if (self)
    self = (FCPrivateRecordSyncManager *)self->_currentState;
  -[FCPrivateRecordSyncManager lastCleanDate](self, "lastCleanDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dateWithPBDate:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v4;
}

- (BOOL)isDirty
{
  NTPBPrivateRecordSyncState *currentState;
  NTPBPrivateRecordSyncState *v4;
  void *v5;
  NTPBPrivateRecordSyncState *v6;
  NTPBPrivateRecordSyncState *v7;
  void *v8;
  double v9;
  double v10;
  NTPBPrivateRecordSyncState *v11;
  void *v12;
  double v13;
  _BOOL4 v14;
  NSObject *v15;
  objc_class *v16;
  void *v17;
  CKRecordID *recordID;
  CKRecordID *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  int v24;
  void *v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  const char *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  if (self)
    currentState = self->_currentState;
  else
    currentState = 0;
  v4 = currentState;
  -[NTPBPrivateRecordSyncState lastCleanDate](v4, "lastCleanDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    if (self)
      v6 = self->_currentState;
    else
      v6 = 0;
    v7 = v6;
    -[NTPBPrivateRecordSyncState lastDirtyDate](v7, "lastDirtyDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "timeIntervalSince1970");
    v10 = v9;
    if (self)
      v11 = self->_currentState;
    else
      v11 = 0;
    -[NTPBPrivateRecordSyncState lastCleanDate](v11, "lastCleanDate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "timeIntervalSince1970");
    v14 = v10 > v13;

  }
  else
  {
    v14 = 1;
  }

  v15 = (id)FCPrivateDataLog;
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v16 = (objc_class *)objc_opt_class();
    NSStringFromClass(v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (self)
      recordID = self->_recordID;
    else
      recordID = 0;
    v19 = recordID;
    -[CKRecordID recordName](v19, "recordName");
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = (void *)v20;
    v22 = " not";
    v24 = 138543874;
    v25 = v17;
    if (v14)
      v22 = "";
    v26 = 2114;
    v27 = v20;
    v28 = 2080;
    v29 = v22;
    _os_log_impl(&dword_1A1B90000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ for %{public}@ is discovering he is%s dirty on being asked", (uint8_t *)&v24, 0x20u);

  }
  return v14;
}

- (void)markAsDirty
{
  void *v3;
  NTPBPrivateRecordSyncState *currentState;

  objc_msgSend(MEMORY[0x1E0C99D68], "pbDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self)
    currentState = self->_currentState;
  else
    currentState = 0;
  -[NTPBPrivateRecordSyncState setLastDirtyDate:](currentState, "setLastDirtyDate:", v3);

  -[FCPrivateRecordSyncManager _stateDidChange]((uint64_t)self);
}

- (void)_stateDidChange
{
  id WeakRetained;
  id v3;

  if (a1)
  {
    v3 = (id)objc_msgSend(*(id *)(a1 + 32), "copy");
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 16));
    objc_msgSend(WeakRetained, "recordSyncManager:stateDidChange:", a1, v3);

  }
}

- (void)notifyObservers
{
  FCPrivateRecordSyncManager *v2;
  FCPrivateRecordSyncManager *v3;

  v2 = self;
  if (self)
    self = (FCPrivateRecordSyncManager *)objc_loadWeakRetained((id *)&self->_delegate);
  v3 = self;
  -[FCPrivateRecordSyncManager recordSyncManagerNotifyObservers:](self, "recordSyncManagerNotifyObservers:", v2);

}

- (BOOL)isAwaitingFirstSync
{
  void *v2;
  BOOL v3;

  if (self)
    self = (FCPrivateRecordSyncManager *)self->_currentState;
  -[FCPrivateRecordSyncManager lastCleanDate](self, "lastCleanDate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 == 0;

  return v3;
}

- (void)fetchChangesWithContext:(id)a3 qualityOfService:(int64_t)a4 completionHandler:(id)a5
{
  id v8;
  void *v9;
  id v10;
  void *v11;
  FCCKPrivateFetchRecordsOperation *v12;
  void *v13;
  id v14;
  void *v15;
  NSArray *desiredKeys;
  uint64_t v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  _QWORD v22[5];
  id v23;
  id v24;
  id v25[2];

  v25[1] = *(id *)MEMORY[0x1E0C80C00];
  v8 = a5;
  v9 = (void *)MEMORY[0x1E0C99D68];
  v10 = a3;
  objc_msgSend(v9, "pbDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_alloc_init(FCCKPrivateFetchRecordsOperation);
  if (self)
  {
    v25[0] = self->_recordID;
    v13 = (void *)MEMORY[0x1E0C99D20];
    v14 = v25[0];
    objc_msgSend(v13, "arrayWithObjects:count:", v25, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    -[FCCKPrivateFetchRecordsOperation setRecordIDs:](v12, "setRecordIDs:", v15);
    desiredKeys = self->_desiredKeys;
  }
  else
  {
    v25[0] = 0;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCCKPrivateFetchRecordsOperation setRecordIDs:](v12, "setRecordIDs:", v21);

    desiredKeys = 0;
  }
  -[FCCKPrivateFetchRecordsOperation setDesiredKeys:](v12, "setDesiredKeys:", desiredKeys);
  -[FCOperation setQualityOfService:](v12, "setQualityOfService:", a4);
  if (a4 == 9)
    v17 = -1;
  else
    v17 = a4 == 33 || a4 == 25;
  -[FCOperation setRelativePriority:](v12, "setRelativePriority:", v17);
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __89__FCPrivateRecordSyncManager_fetchChangesWithContext_qualityOfService_completionHandler___block_invoke;
  v22[3] = &unk_1E463B4B8;
  v22[4] = self;
  v23 = v11;
  v24 = v8;
  v18 = v8;
  v19 = v11;
  -[FCCKPrivateFetchRecordsOperation setFetchRecordsCompletionBlock:](v12, "setFetchRecordsCompletionBlock:", v22);
  objc_msgSend(v10, "privateDatabase");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  -[FCCKPrivateDatabase addOperation:]((uint64_t)v20, v12);
}

void __89__FCPrivateRecordSyncManager_fetchChangesWithContext_qualityOfService_completionHandler___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  _QWORD *v7;
  void *v8;
  _QWORD *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t);
  void *v19;
  uint64_t v20;
  id v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a2;
  if (objc_msgSend(v5, "fc_isCKUnknownItemError"))
  {
    v7 = (_QWORD *)a1[4];
    if (v7)
      v7 = (_QWORD *)v7[1];
    v22[0] = v7;
    v8 = (void *)MEMORY[0x1E0C99D20];
    v9 = v7;
    objc_msgSend(v8, "arrayWithObjects:count:", v22, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = 0;
  }
  else
  {
    v10 = 0;
    v11 = v5;
  }
  v16 = MEMORY[0x1E0C809B0];
  v17 = 3221225472;
  v18 = __89__FCPrivateRecordSyncManager_fetchChangesWithContext_qualityOfService_completionHandler___block_invoke_2;
  v19 = &unk_1E463AD10;
  v12 = (void *)a1[5];
  v20 = a1[4];
  v21 = v12;
  v13 = _Block_copy(&v16);
  v14 = a1[6];
  objc_msgSend(v6, "allValues", v16, v17, v18, v19, v20);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  (*(void (**)(uint64_t, void *, void *, _QWORD, void *, void *))(v14 + 16))(v14, v15, v10, 0, v13, v11);
}

void __89__FCPrivateRecordSyncManager_fetchChangesWithContext_qualityOfService_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v3 = *(_QWORD *)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  if (v3)
    v4 = *(void **)(v3 + 32);
  else
    v4 = 0;
  objc_msgSend(v4, "setLastCleanDate:", v2);
  -[FCPrivateRecordSyncManager _stateDidChange](*(_QWORD *)(a1 + 32));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentState, 0);
  objc_storeStrong((id *)&self->_desiredKeys, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_recordID, 0);
}

@end
