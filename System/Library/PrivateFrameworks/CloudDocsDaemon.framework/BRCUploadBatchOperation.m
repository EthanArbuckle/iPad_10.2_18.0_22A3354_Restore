@implementation BRCUploadBatchOperation

- (BRCUploadBatchOperation)initWithSyncContext:(id)a3 sessionContext:(id)a4 clientZone:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  BRCUploadBatchOperation *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  objc_super v23;

  v8 = a3;
  v9 = a5;
  v10 = a4;
  objc_msgSend(v8, "contextIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("upload"), "stringByAppendingPathComponent:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "session");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "fsUploader");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "hasWorkGroup");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v23.receiver = self;
  v23.super_class = (Class)BRCUploadBatchOperation;
  v16 = -[BRCTransferBatchOperation initWithName:syncContext:sessionContext:group:](&v23, sel_initWithName_syncContext_sessionContext_group_, v12, v8, v10, v15);

  if (v16)
  {
    objc_storeStrong((id *)&v16->_clientZone, a5);
    -[_BRCOperation callbackQueue](v16, "callbackQueue");
    v17 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "session");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "fsUploader");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "uploadsDeadlineScheduler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "workloop");
    v21 = objc_claimAutoreleasedReturnValue();
    dispatch_set_target_queue(v17, v21);

  }
  return v16;
}

- (id)createActivity
{
  return _os_activity_create(&dword_1CBD43000, "upload", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
}

- (void)addItem:(id)a3 stageID:(id)a4 record:(id)a5 transferSize:(unint64_t)a6
{
  id v10;
  id v11;
  id v12;
  BRCUpload *v13;

  v10 = a5;
  v11 = a4;
  v12 = a3;
  v13 = -[BRCUpload initWithDocument:stageID:transferSize:]([BRCUpload alloc], "initWithDocument:stageID:transferSize:", v12, v11, a6);

  -[BRCUpload setRecord:](v13, "setRecord:", v10);
  -[BRCTransferBatchOperation addTransfer:](self, "addTransfer:", v13);

}

- (void)sendTransferCompletionCallBack:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  _QWORD block[4];
  id v16;
  id v17;
  id v18;
  uint8_t buf[4];
  id v20;
  __int16 v21;
  id v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[BRCUploadBatchOperation perUploadCompletionBlock](self, "perUploadCompletionBlock");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCSyncContext session](self->super.super._syncContext, "session");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v8)
  {
    objc_msgSend(v9, "clientDB");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "serialQueue");
    v12 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __64__BRCUploadBatchOperation_sendTransferCompletionCallBack_error___block_invoke;
    block[3] = &unk_1E8761190;
    v18 = v8;
    v16 = v6;
    v17 = v7;
    dispatch_sync(v12, block);

  }
  else
  {
    brc_bread_crumbs();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, (os_log_type_t)0x90u))
    {
      *(_DWORD *)buf = 138412802;
      v20 = v6;
      v21 = 2112;
      v22 = v7;
      v23 = 2112;
      v24 = v13;
      _os_log_error_impl(&dword_1CBD43000, v14, (os_log_type_t)0x90u, "[ERROR] No per upload completion block for %@, error %@%@", buf, 0x20u);
    }

  }
}

uint64_t __64__BRCUploadBatchOperation_sendTransferCompletionCallBack_error___block_invoke(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)_publishUploadProgress:(id)a3
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;

  v3 = a3;
  brc_bread_crumbs();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[BRCUploadBatchOperation _publishUploadProgress:].cold.1();

  objc_msgSend(v3, "progress");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "brc_publish");

  objc_msgSend(v3, "progress");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setProgressPublished:", objc_msgSend(v7, "isPublished"));

}

- (void)mainWithTransfers:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _BOOL4 v18;
  void *v19;
  void *v20;
  id obj;
  _QWORD v22[5];
  id v23;
  _QWORD v24[5];
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", -[BRCTransferBatchOperation itemsCount](self, "itemsCount"));
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  obj = v4;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v26 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        objc_msgSend(v10, "record");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "record");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "recordID");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v11, v13);

        -[BRCUploadBatchOperation _publishUploadProgress:](self, "_publishUploadProgress:", v10);
        -[BRCClientZone session](self->_clientZone, "session");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "analyticsReporter");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "itemID");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v24[0] = MEMORY[0x1E0C809B0];
        v24[1] = 3221225472;
        v24[2] = __45__BRCUploadBatchOperation_mainWithTransfers___block_invoke;
        v24[3] = &unk_1E87613A8;
        v24[4] = self;
        objc_msgSend(v15, "lookupFSEventToSyncUpEventByItemID:accessor:", v16, v24);

      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v7);
  }

  -[BRCUploadBatchOperation hash](self, "hash");
  kdebug_trace();
  -[BRCClientZone serverZone](self->_clientZone, "serverZone");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v17, "hasFetchedServerZoneState") & 1) != 0)
  {

LABEL_12:
    -[BRCUploadBatchOperation _uploadRecordsByID:](self, "_uploadRecordsByID:", v5);
    goto LABEL_13;
  }
  v18 = -[BRCClientZone isPrivateZone](self->_clientZone, "isPrivateZone");

  if (!v18)
    goto LABEL_12;
  -[BRCClientZone asPrivateClientZone](self->_clientZone, "asPrivateClientZone");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[_BRCOperation group](self, "group");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __45__BRCUploadBatchOperation_mainWithTransfers___block_invoke_2;
  v22[3] = &unk_1E875E948;
  v22[4] = self;
  v23 = v5;
  objc_msgSend(v19, "createCloudKitZoneWithGroup:completion:", v20, v22);

LABEL_13:
}

uint64_t __45__BRCUploadBatchOperation_mainWithTransfers___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "associateCKOperationsToEventMetric:", a2);
}

uint64_t __45__BRCUploadBatchOperation_mainWithTransfers___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v3;

  v3 = *(void **)(a1 + 32);
  if (a2)
    return objc_msgSend(v3, "completedWithResult:error:", 0, a2);
  else
    return objc_msgSend(v3, "_uploadRecordsByID:", *(_QWORD *)(a1 + 40));
}

- (void)_uploadRecordsByID:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  _QWORD v13[7];
  _QWORD v14[4];
  id v15;
  id v16;
  BRCUploadBatchOperation *v17;
  _QWORD *v18;
  _QWORD *v19;
  _QWORD v20[5];
  _QWORD v21[5];
  id v22;
  _QWORD v23[5];
  id v24;

  v4 = a3;
  -[BRCSyncContext session](self->super.super._syncContext, "session");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x3032000000;
  v23[3] = __Block_byref_object_copy__18;
  v23[4] = __Block_byref_object_dispose__18;
  v24 = 0;
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x3032000000;
  v21[3] = __Block_byref_object_copy__18;
  v21[4] = __Block_byref_object_dispose__18;
  v22 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v6 = objc_alloc(MEMORY[0x1E0C94F10]);
  objc_msgSend(v4, "allValues");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithRecordsToSave:recordIDsToDelete:", v7, 0);

  objc_msgSend(v8, "setShouldOnlySaveAssetContent:", 1);
  -[_BRCOperation callbackQueue](self, "callbackQueue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setCallbackQueue:", v9);

  objc_msgSend(v8, "setSavePolicy:", 0);
  objc_msgSend(v8, "setAtomic:", 0);
  v10 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __46__BRCUploadBatchOperation__uploadRecordsByID___block_invoke;
  v20[3] = &unk_1E87613D0;
  v20[4] = self;
  objc_msgSend(v8, "setPerRecordProgressBlock:", v20);
  v14[0] = v10;
  v14[1] = 3221225472;
  v14[2] = __46__BRCUploadBatchOperation__uploadRecordsByID___block_invoke_101;
  v14[3] = &unk_1E87613F8;
  v11 = v5;
  v15 = v11;
  v18 = v23;
  v19 = v21;
  v12 = v4;
  v16 = v12;
  v17 = self;
  objc_msgSend(v8, "setPerRecordCompletionBlock:", v14);
  v13[0] = v10;
  v13[1] = 3221225472;
  v13[2] = __46__BRCUploadBatchOperation__uploadRecordsByID___block_invoke_103;
  v13[3] = &unk_1E8761420;
  v13[4] = self;
  v13[5] = v23;
  v13[6] = v21;
  objc_msgSend(v8, "setModifyRecordsCompletionBlock:", v13);
  -[_BRCOperation addSubOperation:](self, "addSubOperation:", v8);

  _Block_object_dispose(v21, 8);
  _Block_object_dispose(v23, 8);

}

void __46__BRCUploadBatchOperation__uploadRecordsByID___block_invoke(uint64_t a1, void *a2, double a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  double v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (a3 < 0.0)
  {
    brc_bread_crumbs();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 134218242;
      v11 = a3;
      v12 = 2112;
      v13 = v6;
      _os_log_impl(&dword_1CBD43000, v7, OS_LOG_TYPE_DEFAULT, "[WARNING] Upload: Received negative progress from CK. progress [%f]%@", (uint8_t *)&v10, 0x16u);
    }

  }
  v8 = *(void **)(a1 + 32);
  objc_msgSend(v5, "recordID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setProgress:forRecordID:", v9, a3);

}

void __46__BRCUploadBatchOperation__uploadRecordsByID___block_invoke_101(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;

  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x1D17A6BE8]();
  objc_msgSend(v5, "recordID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "zoneID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)a1[4];
  objc_msgSend(v9, "zoneName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "ownerName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "serverZoneByName:ownerName:", v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 && objc_msgSend(v13, "shouldRecreateServerZoneAfterError:", v6))
  {
    brc_bread_crumbs();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      __46__BRCUploadBatchOperation__uploadRecordsByID___block_invoke_101_cold_1(v5, (uint64_t)v14, v15);

    objc_msgSend(v5, "recordID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "zoneID");
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = *(_QWORD *)(a1[7] + 8);
    v19 = *(void **)(v18 + 40);
    *(_QWORD *)(v18 + 40) = v17;

    v20 = (void *)a1[5];
    objc_msgSend(v5, "recordID");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "objectForKeyedSubscript:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = *(void **)(*(_QWORD *)(a1[8] + 8) + 40);
    objc_msgSend(v5, "recordID");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setObject:forKeyedSubscript:", v22, v24);

  }
  else
  {
    v25 = (void *)a1[6];
    objc_msgSend(v5, "recordID");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "finishedTransferForRecord:recordID:error:", v5, v26, v6);

  }
  objc_autoreleasePoolPop(v7);

}

void __46__BRCUploadBatchOperation__uploadRecordsByID___block_invoke_103(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  _QWORD v15[5];
  id v16;
  id location;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    if (!v9)
    {
      brc_bread_crumbs();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
        __46__BRCUploadBatchOperation__uploadRecordsByID___block_invoke_103_cold_1((uint64_t)v13, v14);

    }
    objc_initWeak(&location, *(id *)(a1 + 32));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 576), "asPrivateClientZone");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "group");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __46__BRCUploadBatchOperation__uploadRecordsByID___block_invoke_104;
    v15[3] = &unk_1E875FF28;
    objc_copyWeak(&v16, &location);
    v15[4] = *(_QWORD *)(a1 + 48);
    objc_msgSend(v11, "createCloudKitZoneWithGroup:completion:", v12, v15);

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "completedWithResult:error:", 0, v9);
  }
  objc_msgSend(*(id *)(a1 + 32), "hash");
  kdebug_trace();

}

void __46__BRCUploadBatchOperation__uploadRecordsByID___block_invoke_104(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (v3)
  {
    objc_msgSend(WeakRetained, "completedWithResult:error:", 0, v3);
  }
  else
  {
    brc_bread_crumbs();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      __46__BRCUploadBatchOperation__uploadRecordsByID___block_invoke_104_cold_1((uint64_t)v6, v7, v8, v9, v10, v11, v12, v13);

    objc_msgSend(v5, "_uploadRecordsByID:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));
  }

}

- (id)actionPrettyName
{
  return CFSTR("uploading");
}

- (void)finishWithResult:(id)a3 error:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BRCUploadBatchOperation;
  -[BRCTransferBatchOperation finishWithResult:error:](&v5, sel_finishWithResult_error_, a3, a4);
  -[BRCUploadBatchOperation setPerUploadCompletionBlock:](self, "setPerUploadCompletionBlock:", 0);
}

- (id)perUploadCompletionBlock
{
  return objc_getProperty(self, a2, 584, 1);
}

- (void)setPerUploadCompletionBlock:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 584);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_perUploadCompletionBlock, 0);
  objc_storeStrong((id *)&self->_clientZone, 0);
}

- (void)_publishUploadProgress:.cold.1()
{
  uint64_t v0;
  NSObject *v1;
  uint8_t v2[14];
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_4_3();
  v3 = v0;
  OUTLINED_FUNCTION_3_2(&dword_1CBD43000, v1, (uint64_t)v1, "[DEBUG] Publishing upload progress for %@%@", v2);
  OUTLINED_FUNCTION_2();
}

void __46__BRCUploadBatchOperation__uploadRecordsByID___block_invoke_101_cold_1(void *a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  uint64_t v6;
  uint8_t v7[14];
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "recordID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_3();
  v8 = a2;
  OUTLINED_FUNCTION_3_2(&dword_1CBD43000, a3, v6, "[DEBUG] ignoring zone not found error for %@ - we'll create at the end of the operation%@", v7);

}

void __46__BRCUploadBatchOperation__uploadRecordsByID___block_invoke_103_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_fault_impl(&dword_1CBD43000, a2, OS_LOG_TYPE_FAULT, "[CRIT] Assertion failed: modifyError%@", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_2();
}

void __46__BRCUploadBatchOperation__uploadRecordsByID___block_invoke_104_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_1(&dword_1CBD43000, a2, a3, "[DEBUG] zone was recreated, reuploading records%@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

@end
