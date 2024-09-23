@implementation ATXCloudKitClient

+ (ATXCloudKitClient)clientWithContainerIdentifier:(id)a3 useManatee:(BOOL)a4 callbackQueue:(id)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;

  v5 = a4;
  v8 = a5;
  v9 = a3;
  v10 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithContainerIdentifier:useManatee:callbackQueue:", v9, v5, v8);

  return (ATXCloudKitClient *)v10;
}

- (ATXCloudKitClient)initWithContainerIdentifier:(id)a3 useManatee:(BOOL)a4 callbackQueue:(id)a5
{
  _BOOL4 v5;
  objc_class *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  ATXCloudKitClient *v15;

  v5 = a4;
  v8 = (objc_class *)MEMORY[0x1E0C94C40];
  v9 = a5;
  v10 = a3;
  v11 = (void *)objc_msgSend([v8 alloc], "initWithContainerIdentifier:environment:", v10, 2);

  if (v5)
  {
    v12 = (void *)objc_opt_new();
    objc_msgSend(v12, "setMmcsEncryptionSupport:", 2);
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C94C28]), "initWithContainerID:options:", v11, v12);

  }
  else
  {
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C94C28]), "initWithContainerID:", v11);
  }
  objc_msgSend(v13, "privateCloudDatabase");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[ATXCloudKitClient initWithDatabase:inContainer:callbackQueue:](self, "initWithDatabase:inContainer:callbackQueue:", v14, v13, v9);

  return v15;
}

- (ATXCloudKitClient)initWithDatabase:(id)a3 inContainer:(id)a4 callbackQueue:(id)a5
{
  id v9;
  id v10;
  id v11;
  ATXCloudKitClient *v12;
  ATXCloudKitClient *v13;
  OS_dispatch_queue *v14;
  NSObject *callbackQueue;
  dispatch_queue_t v16;
  OS_dispatch_queue *v17;
  objc_super v19;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)ATXCloudKitClient;
  v12 = -[ATXCloudKitClient init](&v19, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_container, a4);
    objc_storeStrong((id *)&v13->_database, a3);
    if (v11)
    {
      v14 = (OS_dispatch_queue *)v11;
      callbackQueue = v13->_callbackQueue;
      v13->_callbackQueue = v14;
    }
    else
    {
      dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      callbackQueue = objc_claimAutoreleasedReturnValue();
      v16 = dispatch_queue_create("com.apple.duetexpertd.atxcloudkit", callbackQueue);
      v17 = v13->_callbackQueue;
      v13->_callbackQueue = (OS_dispatch_queue *)v16;

    }
  }

  return v13;
}

- (void)scheduleDatabaseOperation:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  objc_msgSend(v6, "setQueuePriority:", 0);
  objc_msgSend(v6, "setQualityOfService:", 17);
  if (self->_callbackQueue)
  {
    objc_msgSend(v6, "setCallbackQueue:");
  }
  else
  {
    objc_msgSend(v6, "callbackQueue");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setCallbackQueue:", v4);

  }
  objc_msgSend(v6, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTimeoutIntervalForResource:", 3600.0);

  -[CKDatabase addOperation:](self->_database, "addOperation:", v6);
}

- (void)fetchCurrentDeviceIDWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[ATXCloudKitClient container](self, "container");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __63__ATXCloudKitClient_fetchCurrentDeviceIDWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E82DAB88;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "fetchCurrentDeviceIDWithCompletionHandler:", v7);

}

void __63__ATXCloudKitClient_fetchCurrentDeviceIDWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 40);
  v8 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 24);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63__ATXCloudKitClient_fetchCurrentDeviceIDWithCompletionHandler___block_invoke_2;
  block[3] = &unk_1E82DFE00;
  v13 = v6;
  v14 = v7;
  v12 = v5;
  v9 = v6;
  v10 = v5;
  dispatch_async(v8, block);

}

uint64_t __63__ATXCloudKitClient_fetchCurrentDeviceIDWithCompletionHandler___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)fetchAccountInfoWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[ATXCloudKitClient container](self, "container");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __59__ATXCloudKitClient_fetchAccountInfoWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E82DFE28;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "accountInfoWithCompletionHandler:", v7);

}

void __59__ATXCloudKitClient_fetchAccountInfoWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 40);
  v8 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 24);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__ATXCloudKitClient_fetchAccountInfoWithCompletionHandler___block_invoke_2;
  block[3] = &unk_1E82DFE00;
  v13 = v6;
  v14 = v7;
  v12 = v5;
  v9 = v6;
  v10 = v5;
  dispatch_async(v8, block);

}

uint64_t __59__ATXCloudKitClient_fetchAccountInfoWithCompletionHandler___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)fetchRecordZone:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, void *, void *);
  void *v16;
  id v17;
  id v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = objc_alloc(MEMORY[0x1E0C94E08]);
  v19[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithRecordZoneIDs:", v9);

  v13 = MEMORY[0x1E0C809B0];
  v14 = 3221225472;
  v15 = __55__ATXCloudKitClient_fetchRecordZone_completionHandler___block_invoke;
  v16 = &unk_1E82DFE50;
  v17 = v6;
  v18 = v7;
  v11 = v6;
  v12 = v7;
  objc_msgSend(v10, "setFetchRecordZonesCompletionBlock:", &v13);
  -[ATXCloudKitClient scheduleDatabaseOperation:](self, "scheduleDatabaseOperation:", v10, v13, v14, v15, v16);

}

void __55__ATXCloudKitClient_fetchRecordZone_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;

  v6 = *(_QWORD *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v7 = a3;
  objc_msgSend(a2, "objectForKeyedSubscript:", v6);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "CKItemErrorForID:", *(_QWORD *)(a1 + 32));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  (*(void (**)(uint64_t, id, void *))(v5 + 16))(v5, v9, v8);
}

- (void)saveRecordZone:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, void *, uint64_t, void *);
  void *v16;
  id v17;
  id v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = objc_alloc(MEMORY[0x1E0C94EF0]);
  v19[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithRecordZonesToSave:recordZoneIDsToDelete:", v9, 0);

  v13 = MEMORY[0x1E0C809B0];
  v14 = 3221225472;
  v15 = __54__ATXCloudKitClient_saveRecordZone_completionHandler___block_invoke;
  v16 = &unk_1E82DFE78;
  v17 = v6;
  v18 = v7;
  v11 = v6;
  v12 = v7;
  objc_msgSend(v10, "setModifyRecordZonesCompletionBlock:", &v13);
  -[ATXCloudKitClient scheduleDatabaseOperation:](self, "scheduleDatabaseOperation:", v10, v13, v14, v15, v16);

}

void __54__ATXCloudKitClient_saveRecordZone_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v6 = *(_QWORD *)(a1 + 40);
  v7 = a4;
  objc_msgSend(a2, "firstObject");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "zoneID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "CKItemErrorForID:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  (*(void (**)(uint64_t, id, void *))(v6 + 16))(v6, v10, v9);
}

- (void)deleteRecordZone:(id)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, uint64_t, void *, void *);
  void *v16;
  id v17;
  id v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  objc_msgSend(a3, "zoneID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_alloc(MEMORY[0x1E0C94EF0]);
  v19[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithRecordZonesToSave:recordZoneIDsToDelete:", 0, v9);

  v13 = MEMORY[0x1E0C809B0];
  v14 = 3221225472;
  v15 = __56__ATXCloudKitClient_deleteRecordZone_completionHandler___block_invoke;
  v16 = &unk_1E82DFE78;
  v17 = v7;
  v18 = v6;
  v11 = v7;
  v12 = v6;
  objc_msgSend(v10, "setModifyRecordZonesCompletionBlock:", &v13);
  -[ATXCloudKitClient scheduleDatabaseOperation:](self, "scheduleDatabaseOperation:", v10, v13, v14, v15, v16);

}

void __56__ATXCloudKitClient_deleteRecordZone_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v6;
  id v7;
  void *v8;
  id v9;

  v6 = *(_QWORD *)(a1 + 40);
  v7 = a4;
  objc_msgSend(a3, "firstObject");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "CKItemErrorForID:", *(_QWORD *)(a1 + 32));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  (*(void (**)(uint64_t, BOOL, void *))(v6 + 16))(v6, v9 != 0, v8);
}

- (void)fetchRecords:(id)a3 inZone:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_opt_new();
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C95038]), "initWithQuery:", v10);

  objc_msgSend(v9, "zoneID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "setZoneID:", v13);
  v14 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __59__ATXCloudKitClient_fetchRecords_inZone_completionHandler___block_invoke;
  v21[3] = &unk_1E82DFEA0;
  v15 = v11;
  v22 = v15;
  objc_msgSend(v12, "setRecordMatchedBlock:", v21);
  v18[0] = v14;
  v18[1] = 3221225472;
  v18[2] = __59__ATXCloudKitClient_fetchRecords_inZone_completionHandler___block_invoke_2;
  v18[3] = &unk_1E82DFEC8;
  v19 = v15;
  v20 = v8;
  v16 = v15;
  v17 = v8;
  objc_msgSend(v12, "setQueryCompletionBlock:", v18);
  -[ATXCloudKitClient scheduleDatabaseOperation:](self, "scheduleDatabaseOperation:", v12);

}

void __59__ATXCloudKitClient_fetchRecords_inZone_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id v10;

  v10 = a2;
  v7 = a3;
  v8 = a4;
  if (v7)
  {
    v9 = *(id *)(a1 + 32);
    objc_sync_enter(v9);
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v7);
    objc_sync_exit(v9);

  }
}

uint64_t __59__ATXCloudKitClient_fetchRecords_inZone_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)saveRecord:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, void *, uint64_t, void *);
  void *v16;
  id v17;
  id v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = objc_alloc(MEMORY[0x1E0C94F10]);
  v19[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithRecordsToSave:recordIDsToDelete:", v9, 0);

  v13 = MEMORY[0x1E0C809B0];
  v14 = 3221225472;
  v15 = __50__ATXCloudKitClient_saveRecord_completionHandler___block_invoke;
  v16 = &unk_1E82DFE78;
  v17 = v6;
  v18 = v7;
  v11 = v6;
  v12 = v7;
  objc_msgSend(v10, "setModifyRecordsCompletionBlock:", &v13);
  -[ATXCloudKitClient scheduleDatabaseOperation:](self, "scheduleDatabaseOperation:", v10, v13, v14, v15, v16);

}

void __50__ATXCloudKitClient_saveRecord_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v6 = *(_QWORD *)(a1 + 40);
  v7 = a4;
  objc_msgSend(a2, "firstObject");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "recordID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "CKItemErrorForID:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  (*(void (**)(uint64_t, BOOL, void *))(v6 + 16))(v6, v10 != 0, v9);
}

- (CKContainer)container
{
  return self->_container;
}

- (void)setContainer:(id)a3
{
  objc_storeStrong((id *)&self->_container, a3);
}

- (CKDatabase)database
{
  return self->_database;
}

- (void)setDatabase:(id)a3
{
  objc_storeStrong((id *)&self->_database, a3);
}

- (OS_dispatch_queue)callbackQueue
{
  return self->_callbackQueue;
}

- (void)setCallbackQueue:(id)a3
{
  objc_storeStrong((id *)&self->_callbackQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_database, 0);
  objc_storeStrong((id *)&self->_container, 0);
}

@end
