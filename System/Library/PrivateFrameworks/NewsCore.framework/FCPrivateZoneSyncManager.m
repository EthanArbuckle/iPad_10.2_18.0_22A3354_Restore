@implementation FCPrivateZoneSyncManager

- (id)initWithRecordZoneID:(void *)a3 desiredKeys:(char)a4 requiresBatchedSync:(void *)a5 currentState:
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  id v17;
  id v18;
  id v19;
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
  v9 = a2;
  v10 = a3;
  v11 = a5;
  if (!a1)
    goto LABEL_10;
  if (!v9 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "recordZoneID != nil");
    *(_DWORD *)buf = 136315906;
    v26 = "-[FCPrivateZoneSyncManager initWithRecordZoneID:desiredKeys:requiresBatchedSync:currentState:]";
    v27 = 2080;
    v28 = "FCPrivateZoneSyncManager.m";
    v29 = 1024;
    v30 = 39;
    v31 = 2114;
    v32 = v22;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (!v10)
    {
LABEL_5:
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "desiredKeys != nil");
        *(_DWORD *)buf = 136315906;
        v26 = "-[FCPrivateZoneSyncManager initWithRecordZoneID:desiredKeys:requiresBatchedSync:currentState:]";
        v27 = 2080;
        v28 = "FCPrivateZoneSyncManager.m";
        v29 = 1024;
        v30 = 40;
        v31 = 2114;
        v32 = v23;
        _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

      }
    }
  }
  else if (!v10)
  {
    goto LABEL_5;
  }
  v24.receiver = a1;
  v24.super_class = (Class)FCPrivateZoneSyncManager;
  a1 = (id *)objc_msgSendSuper2(&v24, sel_init);
  if (a1)
  {
    v12 = objc_msgSend(v9, "copy");
    v13 = a1[2];
    a1[2] = (id)v12;

    v14 = objc_msgSend(v10, "copy");
    v15 = a1[4];
    a1[4] = (id)v14;

    *((_BYTE *)a1 + 8) = a4;
    v16 = objc_msgSend(v11, "copy");
    v17 = a1[5];
    a1[5] = (id)v16;

    if (!a1[5])
    {
      v18 = objc_alloc_init(MEMORY[0x1E0D627A0]);
      v19 = a1[5];
      a1[5] = v18;

      objc_msgSend(v9, "zoneName");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[5], "setZoneName:", v20);

    }
  }
LABEL_10:

  return a1;
}

- (FCPrivateZoneSyncManager)init
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
    v8 = "-[FCPrivateZoneSyncManager init]";
    v9 = 2080;
    v10 = "FCPrivateZoneSyncManager.m";
    v11 = 1024;
    v12 = 61;
    v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[FCPrivateZoneSyncManager init]");
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
    self = (FCPrivateZoneSyncManager *)self->_currentState;
  -[FCPrivateZoneSyncManager lastCleanDate](self, "lastCleanDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dateWithPBDate:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v4;
}

- (BOOL)isDirty
{
  NTPBPrivateZoneSyncState *currentState;
  NTPBPrivateZoneSyncState *v4;
  void *v5;
  NTPBPrivateZoneSyncState *v6;
  NTPBPrivateZoneSyncState *v7;
  void *v8;
  double v9;
  double v10;
  NTPBPrivateZoneSyncState *v11;
  void *v12;
  double v13;
  BOOL v14;

  if (self)
    currentState = self->_currentState;
  else
    currentState = 0;
  v4 = currentState;
  -[NTPBPrivateZoneSyncState lastCleanDate](v4, "lastCleanDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    if (self)
      v6 = self->_currentState;
    else
      v6 = 0;
    v7 = v6;
    -[NTPBPrivateZoneSyncState lastDirtyDate](v7, "lastDirtyDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "timeIntervalSince1970");
    v10 = v9;
    if (self)
      v11 = self->_currentState;
    else
      v11 = 0;
    -[NTPBPrivateZoneSyncState lastCleanDate](v11, "lastCleanDate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "timeIntervalSince1970");
    v14 = v10 > v13;

  }
  else
  {
    v14 = 1;
  }

  return v14;
}

- (void)markAsDirty
{
  void *v3;
  NTPBPrivateZoneSyncState *currentState;

  objc_msgSend(MEMORY[0x1E0C99D68], "pbDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self)
    currentState = self->_currentState;
  else
    currentState = 0;
  -[NTPBPrivateZoneSyncState setLastDirtyDate:](currentState, "setLastDirtyDate:", v3);

  -[FCPrivateZoneSyncManager _stateDidChange]((id *)&self->super.isa);
}

- (void)_stateDidChange
{
  void *v2;
  void *v3;
  NSObject *v4;
  objc_class *v5;
  void *v6;
  id v7;
  void *v8;
  id WeakRetained;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v2 = (void *)objc_msgSend(a1[5], "copy");
    v3 = (void *)FCPrivateDataLog;
    if (os_log_type_enabled((os_log_t)FCPrivateDataLog, OS_LOG_TYPE_DEFAULT))
    {
      v4 = v3;
      v5 = (objc_class *)objc_opt_class();
      NSStringFromClass(v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = a1[2];
      objc_msgSend(v7, "zoneName");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543874;
      v11 = v6;
      v12 = 2114;
      v13 = v8;
      v14 = 2114;
      v15 = v2;
      _os_log_impl(&dword_1A1B90000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ for zone %{public}@ did change his state to %{public}@", (uint8_t *)&v10, 0x20u);

    }
    WeakRetained = objc_loadWeakRetained(a1 + 3);
    objc_msgSend(WeakRetained, "zoneSyncManager:stateDidChange:", a1, v2);

  }
}

- (void)notifyObservers
{
  FCPrivateZoneSyncManager *v2;
  FCPrivateZoneSyncManager *v3;

  v2 = self;
  if (self)
    self = (FCPrivateZoneSyncManager *)objc_loadWeakRetained((id *)&self->_delegate);
  v3 = self;
  -[FCPrivateZoneSyncManager zoneSyncManagerNotifyObservers:](self, "zoneSyncManagerNotifyObservers:", v2);

}

- (BOOL)isAwaitingFirstSync
{
  void *v2;
  BOOL v3;

  if (self)
    self = (FCPrivateZoneSyncManager *)self->_currentState;
  -[FCPrivateZoneSyncManager lastCleanDate](self, "lastCleanDate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 == 0;

  return v3;
}

- (void)fetchChangesWithContext:(id)a3 qualityOfService:(int64_t)a4 completionHandler:(id)a5
{
  id v8;
  CKRecordZoneID *recordZoneID;
  CKRecordZoneID *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  NTPBPrivateZoneSyncState *currentState;
  NTPBPrivateZoneSyncState *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  objc_class *v21;
  void *v22;
  NSArray *v23;
  char v24;
  id v25;
  _QWORD v26[5];
  id v27;
  id v28;
  id v29;
  _QWORD v30[6];
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  if (self)
    recordZoneID = self->_recordZoneID;
  else
    recordZoneID = 0;
  v10 = recordZoneID;
  v11 = a3;
  -[CKRecordZoneID zoneName](v10, "zoneName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "recordZoneWithName:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "pbDate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (self)
      currentState = self->_currentState;
    else
      currentState = 0;
    v16 = currentState;
    -[NTPBPrivateZoneSyncState changeToken](v16, "changeToken");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v17, 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v18 = 0;
    }
    v19 = (void *)FCPrivateDataLog;
    if (os_log_type_enabled((os_log_t)FCPrivateDataLog, OS_LOG_TYPE_DEFAULT))
    {
      v20 = v19;
      v21 = (objc_class *)objc_opt_class();
      NSStringFromClass(v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v32 = v22;
      v33 = 2114;
      v34 = v12;
      v35 = 2114;
      v36 = v17;
      _os_log_impl(&dword_1A1B90000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@ for zone %{public}@ will fetch changes with token %{public}@", buf, 0x20u);

    }
    if (self)
    {
      v23 = self->_desiredKeys;
      v24 = !self->_requiresBatchedSync;
    }
    else
    {
      v23 = 0;
      v24 = 1;
    }
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __87__FCPrivateZoneSyncManager_fetchChangesWithContext_qualityOfService_completionHandler___block_invoke_15;
    v26[3] = &unk_1E4645FA8;
    v26[4] = self;
    v27 = v12;
    v28 = v14;
    v29 = v8;
    v25 = v14;
    -[FCCKRecordZone fetchChangesWithChangeToken:desiredKeys:fetchAllChanges:qualityOfService:completion:]((uint64_t)v13, v18, v23, v24, a4, v26);

  }
  else
  {
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __87__FCPrivateZoneSyncManager_fetchChangesWithContext_qualityOfService_completionHandler___block_invoke;
    v30[3] = &unk_1E463B2D0;
    v30[4] = v12;
    v30[5] = v8;
    __87__FCPrivateZoneSyncManager_fetchChangesWithContext_qualityOfService_completionHandler___block_invoke((uint64_t)v30);
  }

}

void __87__FCPrivateZoneSyncManager_fetchChangesWithContext_qualityOfService_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0CB35C8], "fc_unknownRecordZoneErrorWithZoneName:", *(_QWORD *)(a1 + 32));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, _QWORD, _QWORD, void *, id))(v1 + 16))(v1, MEMORY[0x1E0C9AA60], MEMORY[0x1E0C9AA60], 0, &__block_literal_global_114, v2);

}

void __87__FCPrivateZoneSyncManager_fetchChangesWithContext_qualityOfService_completionHandler___block_invoke_15(uint64_t a1, int a2, void *a3, void *a4, uint64_t a5, void *a6, int a7)
{
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  NSObject *v18;
  objc_class *v19;
  void *v20;
  uint64_t v21;
  const char *v22;
  const char *v23;
  id v24;
  uint64_t v25;
  id v26;
  void *v27;
  uint64_t v28;
  void *v29;
  _QWORD aBlock[4];
  id v31;
  uint64_t v32;
  id v33;
  id v34;
  char v35;
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  uint64_t v39;
  __int16 v40;
  const char *v41;
  __int16 v42;
  const char *v43;
  __int16 v44;
  void *v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v15 = a6;
  if (v15)
  {
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v15, 1, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v16 = 0;
  }
  v17 = (void *)FCPrivateDataLog;
  if (os_log_type_enabled((os_log_t)FCPrivateDataLog, OS_LOG_TYPE_DEFAULT))
  {
    v18 = v17;
    v19 = (objc_class *)objc_opt_class();
    NSStringFromClass(v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = *(_QWORD *)(a1 + 40);
    v22 = "un";
    *(_DWORD *)buf = 138544386;
    v23 = "";
    v37 = v20;
    v38 = 2112;
    if (a2)
      v22 = "";
    v39 = v21;
    v40 = 2080;
    if (!a7)
      v23 = " no";
    v41 = v22;
    v42 = 2080;
    v43 = v23;
    v44 = 2114;
    v45 = v16;
    _os_log_impl(&dword_1A1B90000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@ for zone %@ fetched changes %ssuccessfully with%s more changes to fetch and token %{public}@", buf, 0x34u);

  }
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __87__FCPrivateZoneSyncManager_fetchChangesWithContext_qualityOfService_completionHandler___block_invoke_20;
  aBlock[3] = &unk_1E4645F80;
  v24 = v15;
  v25 = *(_QWORD *)(a1 + 32);
  v31 = v24;
  v32 = v25;
  v26 = v16;
  v33 = v26;
  v35 = a7;
  v34 = *(id *)(a1 + 48);
  v27 = _Block_copy(aBlock);
  v28 = *(_QWORD *)(a1 + 56);
  if (a2)
  {
    (*(void (**)(uint64_t, id, id, uint64_t, void *, _QWORD))(v28 + 16))(v28, v13, v14, a5, v27, 0);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("FCErrorDomain"), 16, 0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id, id, uint64_t, void *, void *))(v28 + 16))(v28, v13, v14, a5, v27, v29);

  }
}

void __87__FCPrivateZoneSyncManager_fetchChangesWithContext_qualityOfService_completionHandler___block_invoke_20(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  if (*(_QWORD *)(a1 + 32))
  {
    v3 = *(_QWORD *)(a1 + 40);
    v2 = *(_QWORD *)(a1 + 48);
    if (v3)
      v4 = *(void **)(v3 + 40);
    else
      v4 = 0;
  }
  else
  {
    v5 = *(_QWORD *)(a1 + 40);
    if (v5)
      v4 = *(void **)(v5 + 40);
    else
      v4 = 0;
    v2 = 0;
  }
  objc_msgSend(v4, "setChangeToken:", v2);
  if (!*(_BYTE *)(a1 + 64))
  {
    v6 = *(_QWORD *)(a1 + 40);
    if (v6)
      v7 = *(void **)(v6 + 40);
    else
      v7 = 0;
    objc_msgSend(v7, "setLastCleanDate:", *(_QWORD *)(a1 + 56));
  }
  -[FCPrivateZoneSyncManager _stateDidChange](*(id **)(a1 + 40));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentState, 0);
  objc_storeStrong((id *)&self->_desiredKeys, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_recordZoneID, 0);
}

@end
