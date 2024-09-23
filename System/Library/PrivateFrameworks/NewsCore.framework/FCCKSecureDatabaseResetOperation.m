@implementation FCCKSecureDatabaseResetOperation

- (FCCKSecureDatabaseResetOperation)init
{
  FCCKSecureDatabaseResetOperation *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FCCKSecureDatabaseResetOperation;
  result = -[FCOperation init](&v3, sel_init);
  if (result)
  {
    result->_deleteZones = 1;
    result->_restoreSecureSentinel = 1;
    result->_restoreZoneContents = 1;
  }
  return result;
}

- (BOOL)validateOperation
{
  void *v3;
  _QWORD *v4;
  uint64_t v5;
  BOOL v6;
  void *v7;
  void *v9;
  int v10;
  const char *v11;
  __int16 v12;
  char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[FCCKSecureDatabaseResetOperation database](self, "database");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("zone reset operation requires a private database"));
    v10 = 136315906;
    v11 = "-[FCCKSecureDatabaseResetOperation validateOperation]";
    v12 = 2080;
    v13 = "FCCKSecureDatabaseResetOperation.m";
    v14 = 1024;
    v15 = 43;
    v16 = 2114;
    v17 = v7;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v10, 0x26u);

  }
  -[FCCKSecureDatabaseResetOperation database](self, "database");
  v4 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  if (v4 && (v5 = v4[5], v4, v5 > 0))
  {
    v6 = 1;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("zone reset is only valid when encryption is enabled"));
      v10 = 136315906;
      v11 = "-[FCCKSecureDatabaseResetOperation validateOperation]";
      v12 = 2080;
      v13 = "FCCKSecureDatabaseResetOperation.m";
      v14 = 1024;
      v15 = 47;
      v16 = 2114;
      v17 = v9;
      _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v10, 0x26u);

    }
    v6 = 0;
  }
  return v3 && v6;
}

- (void)performOperation
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  _QWORD v15[5];
  _QWORD v16[5];
  _QWORD v17[5];
  _QWORD v18[5];
  _QWORD v19[5];
  _QWORD v20[6];

  v3 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __52__FCCKSecureDatabaseResetOperation_performOperation__block_invoke;
  v20[3] = &unk_1E463D3A8;
  v20[4] = self;
  objc_msgSend(MEMORY[0x1E0D60AF0], "firstly:", v20);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  zalgo();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v3;
  v19[1] = 3221225472;
  v19[2] = __52__FCCKSecureDatabaseResetOperation_performOperation__block_invoke_2;
  v19[3] = &unk_1E463C7F0;
  v19[4] = self;
  objc_msgSend(v14, "thenOn:then:", v13, v19);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  zalgo();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v3;
  v18[1] = 3221225472;
  v18[2] = __52__FCCKSecureDatabaseResetOperation_performOperation__block_invoke_3;
  v18[3] = &unk_1E463C7F0;
  v18[4] = self;
  objc_msgSend(v4, "thenOn:then:", v5, v18);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  zalgo();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v3;
  v17[1] = 3221225472;
  v17[2] = __52__FCCKSecureDatabaseResetOperation_performOperation__block_invoke_4;
  v17[3] = &unk_1E463C7F0;
  v17[4] = self;
  objc_msgSend(v6, "thenOn:then:", v7, v17);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  zalgo();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v3;
  v16[1] = 3221225472;
  v16[2] = __52__FCCKSecureDatabaseResetOperation_performOperation__block_invoke_5;
  v16[3] = &unk_1E463C7F0;
  v16[4] = self;
  objc_msgSend(v8, "thenOn:then:", v9, v16);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  zalgo();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v3;
  v15[1] = 3221225472;
  v15[2] = __52__FCCKSecureDatabaseResetOperation_performOperation__block_invoke_6;
  v15[3] = &unk_1E463EA38;
  v15[4] = self;
  v12 = (id)objc_msgSend(v10, "errorOn:error:", v11, v15);

}

uint64_t __52__FCCKSecureDatabaseResetOperation_performOperation__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_deleteZones");
}

uint64_t __52__FCCKSecureDatabaseResetOperation_performOperation__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_recreateZones");
}

uint64_t __52__FCCKSecureDatabaseResetOperation_performOperation__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_restoreSecureSentinel");
}

uint64_t __52__FCCKSecureDatabaseResetOperation_performOperation__block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_restoreZoneContents");
}

uint64_t __52__FCCKSecureDatabaseResetOperation_performOperation__block_invoke_5(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "finishedPerformingOperationWithError:", 0);
  return 0;
}

uint64_t __52__FCCKSecureDatabaseResetOperation_performOperation__block_invoke_6(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishedPerformingOperationWithError:", a2);
}

- (void)operationWillFinishWithError:(id)a3
{
  void *v4;
  void (**v5)(_QWORD, _QWORD);
  id v6;

  v6 = a3;
  -[FCCKSecureDatabaseResetOperation resetCompletionHandler](self, "resetCompletionHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[FCCKSecureDatabaseResetOperation resetCompletionHandler](self, "resetCompletionHandler");
    v5 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id))v5)[2](v5, v6);

  }
}

- (id)_deleteZones
{
  id v3;
  _QWORD v5[5];

  if (-[FCCKSecureDatabaseResetOperation deleteZones](self, "deleteZones"))
  {
    v3 = objc_alloc(MEMORY[0x1E0D60AF0]);
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __48__FCCKSecureDatabaseResetOperation__deleteZones__block_invoke_2;
    v5[3] = &unk_1E463DAD0;
    v5[4] = self;
    return (id)objc_msgSend(v3, "initWithResolver:", v5);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D60AF0], "asVoid");
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

void __48__FCCKSecureDatabaseResetOperation__deleteZones__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  FCCKPrivateDeleteRecordZonesOperation *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, void *, void *);
  void *v16;
  id v17;
  id v18;

  v5 = a2;
  v6 = a3;
  v7 = objc_alloc_init(FCCKPrivateDeleteRecordZonesOperation);
  objc_msgSend(*(id *)(a1 + 32), "database");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCCKPrivateDatabaseOperation setDatabase:](v7, "setDatabase:", v8);

  objc_msgSend(*(id *)(a1 + 32), "_rawZoneIDsToDelete");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCCKPrivateDeleteRecordZonesOperation setRecordZoneIDsToDelete:](v7, "setRecordZoneIDsToDelete:", v9);

  -[FCCKPrivateDeleteRecordZonesOperation setSecureDatabaseOnly:](v7, "setSecureDatabaseOnly:", 1);
  -[FCCKPrivateDatabaseOperation setSkipPreflight:](v7, "setSkipPreflight:", 1);
  -[FCCKPrivateDatabaseOperation setHandleIdentityLoss:](v7, "setHandleIdentityLoss:", 0);
  v13 = MEMORY[0x1E0C809B0];
  v14 = 3221225472;
  v15 = __48__FCCKSecureDatabaseResetOperation__deleteZones__block_invoke_3;
  v16 = &unk_1E46404F0;
  v17 = v5;
  v18 = v6;
  v10 = v6;
  v11 = v5;
  -[FCCKPrivateDeleteRecordZonesOperation setDeleteRecordZonesCompletionBlock:](v7, "setDeleteRecordZonesCompletionBlock:", &v13);
  objc_msgSend(*(id *)(a1 + 32), "associateChildOperation:", v7, v13, v14, v15, v16);
  objc_msgSend(*(id *)(a1 + 32), "database");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCCKPrivateDatabase addOperation:]((uint64_t)v12, v7);

}

void __48__FCCKSecureDatabaseResetOperation__deleteZones__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void (*v7)(void);
  id v8;

  v8 = a2;
  v5 = a3;
  v6 = v5;
  if (!v5
    || (objc_msgSend(v5, "fc_isCKUnknownItemError") & 1) != 0
    || objc_msgSend(v6, "fc_isMissingZoneError"))
  {
    v7 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  else
  {
    v7 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  v7();

}

- (id)_recreateZones
{
  id v3;
  _QWORD v5[5];

  if (-[FCCKSecureDatabaseResetOperation deleteZones](self, "deleteZones"))
  {
    v3 = objc_alloc(MEMORY[0x1E0D60AF0]);
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __50__FCCKSecureDatabaseResetOperation__recreateZones__block_invoke_2;
    v5[3] = &unk_1E463DAD0;
    v5[4] = self;
    return (id)objc_msgSend(v3, "initWithResolver:", v5);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D60AF0], "asVoid");
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

void __50__FCCKSecureDatabaseResetOperation__recreateZones__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  FCCKPrivateSaveRecordZonesOperation *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t, uint64_t);
  void *v16;
  id v17;
  id v18;

  v5 = a2;
  v6 = a3;
  v7 = objc_alloc_init(FCCKPrivateSaveRecordZonesOperation);
  objc_msgSend(*(id *)(a1 + 32), "database");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCCKPrivateDatabaseOperation setDatabase:](v7, "setDatabase:", v8);

  objc_msgSend(*(id *)(a1 + 32), "_rawZonesToRecreate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCCKPrivateSaveRecordZonesOperation setRecordZonesToSave:](v7, "setRecordZonesToSave:", v9);

  -[FCCKPrivateDatabaseOperation setSkipPreflight:](v7, "setSkipPreflight:", 1);
  -[FCCKPrivateDatabaseOperation setHandleIdentityLoss:](v7, "setHandleIdentityLoss:", 0);
  v13 = MEMORY[0x1E0C809B0];
  v14 = 3221225472;
  v15 = __50__FCCKSecureDatabaseResetOperation__recreateZones__block_invoke_3;
  v16 = &unk_1E46404F0;
  v17 = v5;
  v18 = v6;
  v10 = v6;
  v11 = v5;
  -[FCCKPrivateSaveRecordZonesOperation setSaveRecordZonesCompletionBlock:](v7, "setSaveRecordZonesCompletionBlock:", &v13);
  objc_msgSend(*(id *)(a1 + 32), "associateChildOperation:", v7, v13, v14, v15, v16);
  objc_msgSend(*(id *)(a1 + 32), "database");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCCKPrivateDatabase addOperation:]((uint64_t)v12, v7);

}

uint64_t __50__FCCKSecureDatabaseResetOperation__recreateZones__block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  else
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)_restoreSecureSentinel
{
  id v3;
  _QWORD v5[5];

  if (-[FCCKSecureDatabaseResetOperation restoreSecureSentinel](self, "restoreSecureSentinel"))
  {
    v3 = objc_alloc(MEMORY[0x1E0D60AF0]);
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __58__FCCKSecureDatabaseResetOperation__restoreSecureSentinel__block_invoke_2;
    v5[3] = &unk_1E463DAD0;
    v5[4] = self;
    return (id)objc_msgSend(v3, "initWithResolver:", v5);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D60AF0], "asVoid");
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

void __58__FCCKSecureDatabaseResetOperation__restoreSecureSentinel__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *Property;
  const char *v9;
  void *v10;
  id v11;
  void *v12;
  FCCKPrivateSaveRecordsOperation *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t, uint64_t);
  void *v22;
  id v23;
  id v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = MEMORY[0x1E0C95048];
  objc_msgSend(*(id *)(a1 + 32), "database");
  Property = (void *)objc_claimAutoreleasedReturnValue();
  v10 = Property;
  if (Property)
    Property = objc_getProperty(Property, v9, 56, 1);
  v11 = Property;
  +[CKRecord secureSentinelRecordWithEncryptionKey:](v7, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_alloc_init(FCCKPrivateSaveRecordsOperation);
  objc_msgSend(*(id *)(a1 + 32), "database");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCCKPrivateDatabaseOperation setDatabase:](v13, "setDatabase:", v14);

  v25[0] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCCKPrivateSaveRecordsOperation setRecordsToSave:](v13, "setRecordsToSave:", v15);

  -[FCCKPrivateSaveRecordsOperation setSavePolicy:](v13, "setSavePolicy:", 0);
  -[FCCKPrivateDatabaseOperation setSkipPreflight:](v13, "setSkipPreflight:", 1);
  -[FCCKPrivateDatabaseOperation setHandleIdentityLoss:](v13, "setHandleIdentityLoss:", 0);
  v19 = MEMORY[0x1E0C809B0];
  v20 = 3221225472;
  v21 = __58__FCCKSecureDatabaseResetOperation__restoreSecureSentinel__block_invoke_3;
  v22 = &unk_1E46404F0;
  v23 = v5;
  v24 = v6;
  v16 = v6;
  v17 = v5;
  -[FCCKPrivateSaveRecordsOperation setSaveRecordsCompletionBlock:](v13, "setSaveRecordsCompletionBlock:", &v19);
  objc_msgSend(*(id *)(a1 + 32), "associateChildOperation:", v13, v19, v20, v21, v22);
  objc_msgSend(*(id *)(a1 + 32), "database");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCCKPrivateDatabase addOperation:]((uint64_t)v18, v13);

}

uint64_t __58__FCCKSecureDatabaseResetOperation__restoreSecureSentinel__block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  else
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)_restoreZoneContents
{
  id v3;
  _QWORD v5[5];

  if (-[FCCKSecureDatabaseResetOperation restoreZoneContents](self, "restoreZoneContents"))
  {
    v3 = objc_alloc(MEMORY[0x1E0D60AF0]);
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __56__FCCKSecureDatabaseResetOperation__restoreZoneContents__block_invoke_2;
    v5[3] = &unk_1E463DAD0;
    v5[4] = self;
    return (id)objc_msgSend(v3, "initWithResolver:", v5);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D60AF0], "asVoid");
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

void __56__FCCKSecureDatabaseResetOperation__restoreZoneContents__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  FCCKPrivateBatchedSaveRecordsOperation *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t, uint64_t);
  void *v15;
  id v16;
  id v17;

  v5 = a2;
  v6 = a3;
  v7 = objc_alloc_init(FCCKPrivateBatchedSaveRecordsOperation);
  objc_msgSend(*(id *)(a1 + 32), "database");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCCKPrivateBatchedSaveRecordsOperation setDatabase:](v7, "setDatabase:", v8);

  objc_msgSend(*(id *)(a1 + 32), "_rawRecordsToSave");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCCKPrivateBatchedSaveRecordsOperation setRecordsToSave:](v7, "setRecordsToSave:", v9);

  -[FCCKPrivateBatchedSaveRecordsOperation setSkipPreflight:](v7, "setSkipPreflight:", 1);
  -[FCCKPrivateBatchedSaveRecordsOperation setHandleIdentityLoss:](v7, "setHandleIdentityLoss:", 0);
  v12 = MEMORY[0x1E0C809B0];
  v13 = 3221225472;
  v14 = __56__FCCKSecureDatabaseResetOperation__restoreZoneContents__block_invoke_3;
  v15 = &unk_1E46404F0;
  v16 = v5;
  v17 = v6;
  v10 = v6;
  v11 = v5;
  -[FCCKPrivateBatchedSaveRecordsOperation setSaveRecordsCompletionBlock:](v7, "setSaveRecordsCompletionBlock:", &v12);
  objc_msgSend(*(id *)(a1 + 32), "associateChildOperation:", v7, v12, v13, v14, v15);
  -[FCOperation start](v7, "start");

}

uint64_t __56__FCCKSecureDatabaseResetOperation__restoreZoneContents__block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  else
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)_rawZoneIDsToDelete
{
  _QWORD *v3;
  void *v4;
  void *v5;
  _QWORD v7[5];

  -[FCCKSecureDatabaseResetOperation database](self, "database");
  v3 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  -[FCCKPrivateDatabase zoneIDsUsingSecureContainer](v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __55__FCCKSecureDatabaseResetOperation__rawZoneIDsToDelete__block_invoke;
  v7[3] = &unk_1E4643920;
  v7[4] = self;
  objc_msgSend(v4, "fc_arrayByTransformingWithBlock:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __55__FCCKSecureDatabaseResetOperation__rawZoneIDsToDelete__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  id v6;
  void *v7;

  v3 = a2;
  objc_msgSend(v3, "zoneName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0C94A30]);

  if (v5)
  {
    v6 = v3;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "database");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCCKPrivateDatabase _clientToServerRecordZoneID:](v7, v3);
    v6 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

- (id)_rawZonesToRecreate
{
  void *v2;
  void *v3;

  -[FCCKSecureDatabaseResetOperation _rawZoneIDsToDelete](self, "_rawZoneIDsToDelete");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fc_arrayByTransformingWithBlock:", &__block_literal_global_21);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __55__FCCKSecureDatabaseResetOperation__rawZonesToRecreate__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  char v4;
  void *v5;

  v2 = a2;
  objc_msgSend(v2, "zoneName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0C94A30]);

  if ((v4 & 1) != 0)
    v5 = 0;
  else
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C95088]), "initWithZoneID:", v2);

  return v5;
}

- (id)_rawRecordsToSave
{
  uint64_t v3;
  void *v4;
  void *v5;
  _QWORD v7[5];
  _QWORD v8[5];

  v3 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __53__FCCKSecureDatabaseResetOperation__rawRecordsToSave__block_invoke;
  v8[3] = &unk_1E463AA30;
  v8[4] = self;
  objc_msgSend(MEMORY[0x1E0C99D20], "fc_array:", v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v3;
  v7[1] = 3221225472;
  v7[2] = __53__FCCKSecureDatabaseResetOperation__rawRecordsToSave__block_invoke_2;
  v7[3] = &unk_1E4645F58;
  v7[4] = self;
  objc_msgSend(v4, "fc_arrayByTransformingWithBlock:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

void __53__FCCKSecureDatabaseResetOperation__rawRecordsToSave__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t i;
  void *v9;
  _QWORD *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  id obj;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v23 = a1;
  objc_msgSend(*(id *)(a1 + 32), "database");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v4)
    v6 = *(void **)(v4 + 184);
  else
    v6 = 0;
  v7 = v6;

  obj = v7;
  v24 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
  if (v24)
  {
    v22 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v24; ++i)
      {
        if (*(_QWORD *)v30 != v22)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        v25 = 0u;
        v26 = 0u;
        v27 = 0u;
        v28 = 0u;
        objc_msgSend(*(id *)(v23 + 32), "database");
        v10 = (_QWORD *)objc_claimAutoreleasedReturnValue();
        -[FCCKPrivateDatabase zoneIDsUsingSecureContainer](v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
        if (v12)
        {
          v13 = v12;
          v14 = *(_QWORD *)v26;
          do
          {
            for (j = 0; j != v13; ++j)
            {
              if (*(_QWORD *)v26 != v14)
                objc_enumerationMutation(v11);
              v16 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * j);
              objc_msgSend(v16, "zoneName");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              v18 = objc_msgSend(v9, "canHelpRestoreZoneName:", v17);

              if (v18)
              {
                objc_msgSend(v16, "zoneName");
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v9, "recordsForRestoringZoneName:", v19);
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v3, "addObjectsFromArray:", v20);

              }
            }
            v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
          }
          while (v13);
        }

      }
      v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    }
    while (v24);
  }

}

id __53__FCCKSecureDatabaseResetOperation__rawRecordsToSave__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "database");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCCKPrivateDatabase _clientToServerRecord:]((uint64_t)v4, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (FCCKPrivateDatabase)database
{
  return self->_database;
}

- (void)setDatabase:(id)a3
{
  objc_storeStrong((id *)&self->_database, a3);
}

- (BOOL)deleteZones
{
  return self->_deleteZones;
}

- (void)setDeleteZones:(BOOL)a3
{
  self->_deleteZones = a3;
}

- (BOOL)restoreSecureSentinel
{
  return self->_restoreSecureSentinel;
}

- (void)setRestoreSecureSentinel:(BOOL)a3
{
  self->_restoreSecureSentinel = a3;
}

- (BOOL)restoreZoneContents
{
  return self->_restoreZoneContents;
}

- (void)setRestoreZoneContents:(BOOL)a3
{
  self->_restoreZoneContents = a3;
}

- (id)resetCompletionHandler
{
  return self->_resetCompletionHandler;
}

- (void)setResetCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 384);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_resetCompletionHandler, 0);
  objc_storeStrong((id *)&self->_database, 0);
}

@end
