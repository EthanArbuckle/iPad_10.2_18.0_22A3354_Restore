@implementation BRCTransferBatchOperation

- (BRCTransferBatchOperation)initWithName:(id)a3 syncContext:(id)a4 sessionContext:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  BRCTransferBatchOperation *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;

  v8 = a4;
  v9 = a5;
  v10 = a3;
  objc_msgSend(v8, "session");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "fsDownloader");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "hasWorkGroup");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "contextIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringByAppendingPathComponent:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = -[BRCTransferBatchOperation initWithName:syncContext:sessionContext:group:](self, "initWithName:syncContext:sessionContext:group:", v15, v8, v9, v13);
  if (v16)
  {
    -[_BRCOperation callbackQueue](v16, "callbackQueue");
    v17 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "session");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "fsDownloader");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "downloadsDeadlineScheduler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "workloop");
    v21 = objc_claimAutoreleasedReturnValue();
    dispatch_set_target_queue(v17, v21);

  }
  return v16;
}

- (id)fetchOperationForTransfers:(id)a3 traceCode:(int)a4
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  BOOL v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  NSObject *v24;
  void *v25;
  NSObject *v26;
  NSObject *v27;
  NSObject *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v33;
  NSObject *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  _QWORD v43[6];
  _QWORD v44[5];
  _QWORD v45[5];
  _QWORD block[6];
  int v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE buf[24];
  uint64_t (*v53)(uint64_t, uint64_t);
  void (*v54)(uint64_t);
  id v55;
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[BRCAccountsManager sharedManager](BRCAccountsManager, "sharedManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isInSyncBubble");

  if (v6)
  {
    brc_bread_crumbs();
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_FAULT))
      -[BRCTransferBatchOperation(Downloads) fetchOperationForTransfers:traceCode:].cold.1((uint64_t)v33, v34, v35, v36, v37, v38, v39, v40);

  }
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[BRCTransferBatchOperation itemsCount](self, "itemsCount"));
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", -[BRCTransferBatchOperation itemsCount](self, "itemsCount"));
  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  v9 = v4;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v48, v56, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v49;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v49 != v11)
          objc_enumerationMutation(v9);
        v13 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * i);
        objc_msgSend(v13, "recordID");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectForKey:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = v15 == 0;

        if (v16)
        {
          objc_msgSend(v13, "secondaryRecordID");
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          if (v20)
          {
            objc_msgSend(v13, "secondaryRecordID");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "addObject:", v21);

          }
          objc_msgSend(v13, "recordID");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "addObject:", v22);

          if ((objc_msgSend(v13, "progressPublished") & 1) == 0)
          {
            brc_bread_crumbs();
            v23 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
            brc_default_log();
            v24 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412802;
              *(_QWORD *)&buf[4] = self;
              *(_WORD *)&buf[12] = 2112;
              *(_QWORD *)&buf[14] = v13;
              *(_WORD *)&buf[22] = 2112;
              v53 = v23;
              _os_log_debug_impl(&dword_1CBD43000, v24, OS_LOG_TYPE_DEBUG, "[DEBUG] %@ - Publishing download progress for %@%@", buf, 0x20u);
            }

            objc_msgSend(v13, "progress");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "brc_publish");

            objc_msgSend(v13, "setProgressPublished:", 1);
          }
          objc_msgSend(v13, "etag");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "recordID");
          v18 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "setObject:forKeyedSubscript:", v17, v18);
        }
        else
        {
          brc_bread_crumbs();
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
          {
            objc_msgSend(v13, "recordID");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            *(_QWORD *)&buf[4] = v19;
            *(_WORD *)&buf[12] = 2112;
            *(_QWORD *)&buf[14] = v17;
            _os_log_fault_impl(&dword_1CBD43000, v18, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: We got two downloads for the same record ID: %@%@", buf, 0x16u);

          }
        }

      }
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v48, v56, 16);
    }
    while (v10);
  }

  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v53 = __Block_byref_object_copy__33;
  v54 = __Block_byref_object_dispose__33;
  v55 = 0;
  -[BRCTransferBatchOperation pendingGroup](self, "pendingGroup");
  v26 = objc_claimAutoreleasedReturnValue();
  dispatch_group_enter(v26);

  -[BRCTransferBatchOperation pendingGroup](self, "pendingGroup");
  v27 = objc_claimAutoreleasedReturnValue();
  -[_BRCOperation callbackQueue](self, "callbackQueue");
  v28 = objc_claimAutoreleasedReturnValue();
  v29 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __77__BRCTransferBatchOperation_Downloads__fetchOperationForTransfers_traceCode___block_invoke;
  block[3] = &unk_1E8763E60;
  block[4] = self;
  block[5] = buf;
  v47 = a4;
  dispatch_group_notify(v27, v28, block);

  -[BRCTransferBatchOperation hash](self, "hash");
  kdebug_trace();
  v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C94E18]), "initWithRecordIDs:", v7);
  objc_msgSend(v30, "setShouldFetchAssetContent:", 1);
  -[_BRCOperation callbackQueue](self, "callbackQueue");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setCallbackQueue:", v31);

  objc_msgSend(v30, "setRecordIDsToVersionETags:", v8);
  v45[0] = v29;
  v45[1] = 3221225472;
  v45[2] = __77__BRCTransferBatchOperation_Downloads__fetchOperationForTransfers_traceCode___block_invoke_2;
  v45[3] = &unk_1E8763E88;
  v45[4] = self;
  objc_msgSend(v30, "setPerRecordProgressBlock:", v45);
  v44[0] = v29;
  v44[1] = 3221225472;
  v44[2] = __77__BRCTransferBatchOperation_Downloads__fetchOperationForTransfers_traceCode___block_invoke_100;
  v44[3] = &unk_1E8763EB0;
  v44[4] = self;
  objc_msgSend(v30, "setPerRecordCompletionBlock:", v44);
  v43[0] = v29;
  v43[1] = 3221225472;
  v43[2] = __77__BRCTransferBatchOperation_Downloads__fetchOperationForTransfers_traceCode___block_invoke_104;
  v43[3] = &unk_1E8763ED8;
  v43[4] = self;
  v43[5] = buf;
  objc_msgSend(v30, "setFetchRecordsCompletionBlock:", v43);
  _Block_object_dispose(buf, 8);

  return v30;
}

uint64_t __77__BRCTransferBatchOperation_Downloads__fetchOperationForTransfers_traceCode___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "completedWithResult:error:", 0, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
  objc_msgSend(*(id *)(a1 + 32), "hash");
  return kdebug_trace();
}

void __77__BRCTransferBatchOperation_Downloads__fetchOperationForTransfers_traceCode___block_invoke_2(uint64_t a1, void *a2, double a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  double v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (a3 < 0.0)
  {
    brc_bread_crumbs();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(_QWORD *)(a1 + 32);
      v9 = 138412802;
      v10 = v8;
      v11 = 2048;
      v12 = a3;
      v13 = 2112;
      v14 = v6;
      _os_log_impl(&dword_1CBD43000, v7, OS_LOG_TYPE_DEFAULT, "[WARNING] %@ - Download: Received negative progress from CK. progress [%f]%@", (uint8_t *)&v9, 0x20u);
    }

  }
  objc_msgSend(*(id *)(a1 + 32), "setProgress:forRecordID:", v5, a3);

}

void __77__BRCTransferBatchOperation_Downloads__fetchOperationForTransfers_traceCode___block_invoke_100(uint64_t a1, void *a2, void *a3, void *a4)
{
  unint64_t v7;
  id v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (!(v7 | v9))
  {
    brc_bread_crumbs();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      __77__BRCTransferBatchOperation_Downloads__fetchOperationForTransfers_traceCode___block_invoke_100_cold_1((uint64_t)v10, v11, v12, v13, v14, v15, v16, v17);

    objc_msgSend(MEMORY[0x1E0CB35C8], "br_errorWithDomain:code:description:", *MEMORY[0x1E0D10C90], 15, CFSTR("unreachable: no record and no error"));
    v9 = objc_claimAutoreleasedReturnValue();
  }
  v18 = (void *)MEMORY[0x1D17A6BE8]();
  objc_msgSend(*(id *)(a1 + 32), "finishedTransferForRecord:recordID:error:", v7, v8, v9);
  objc_autoreleasePoolPop(v18);

}

void __77__BRCTransferBatchOperation_Downloads__fetchOperationForTransfers_traceCode___block_invoke_104(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  id v11;
  NSObject *v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  id v17;
  __int16 v18;
  id v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  brc_bread_crumbs();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v13 = *(_QWORD *)(a1 + 32);
    v14 = 138413058;
    v15 = v13;
    v16 = 2112;
    v17 = v5;
    v18 = 2112;
    v19 = v6;
    v20 = 2112;
    v21 = v7;
    _os_log_debug_impl(&dword_1CBD43000, v8, OS_LOG_TYPE_DEBUG, "[DEBUG] %@ - Finished records: %@, Error: %@%@", (uint8_t *)&v14, 0x2Au);
  }

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;
  v11 = v6;

  objc_msgSend(*(id *)(a1 + 32), "pendingGroup");
  v12 = objc_claimAutoreleasedReturnValue();

  dispatch_group_leave(v12);
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[_BRCOperation operationID](self, "operationID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@(%@)"), v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (unint64_t)itemsCount
{
  return self->_itemsCount;
}

- (BRCTransferBatchOperation)initWithName:(id)a3 syncContext:(id)a4 sessionContext:(id)a5 group:(id)a6
{
  BRCTransferBatchOperation *v6;
  NSMutableDictionary *v7;
  NSMutableDictionary *entriesByRecordID;
  NSMutableDictionary *v9;
  NSMutableDictionary *entriesByTransferID;
  dispatch_group_t v11;
  OS_dispatch_group *pendingGroup;
  NSObject *v13;
  dispatch_queue_t v14;
  OS_dispatch_queue *queue;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)BRCTransferBatchOperation;
  v6 = -[_BRCOperation initWithName:syncContext:sessionContext:group:](&v17, sel_initWithName_syncContext_sessionContext_group_, a3, a4, a5, a6);
  if (v6)
  {
    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    entriesByRecordID = v6->_entriesByRecordID;
    v6->_entriesByRecordID = v7;

    v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    entriesByTransferID = v6->_entriesByTransferID;
    v6->_entriesByTransferID = v9;

    v11 = dispatch_group_create();
    pendingGroup = v6->_pendingGroup;
    v6->_pendingGroup = (OS_dispatch_group *)v11;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = dispatch_queue_create("transfer-queue", v13);

    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v14;

  }
  return v6;
}

- (id)createActivity
{
  return _os_activity_create(&dword_1CBD43000, "BRCTransferBatchOperation/? (subclass activity missing)", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
}

- (void)mainWithTransfers:(id)a3
{
  void *v3;
  NSObject *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  brc_bread_crumbs();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
  {
    v5 = 138412290;
    v6 = v3;
    _os_log_fault_impl(&dword_1CBD43000, v4, OS_LOG_TYPE_FAULT, "[CRIT] API MISUSE: should be subclassed%@", (uint8_t *)&v5, 0xCu);
  }

}

- (void)main
{
  OS_dispatch_queue *queue;
  _QWORD v3[5];

  queue = self->_queue;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __33__BRCTransferBatchOperation_main__block_invoke;
  v3[3] = &unk_1E875D500;
  v3[4] = self;
  dispatch_async_with_logs_13(queue, v3);
}

void __33__BRCTransferBatchOperation_main__block_invoke(uint64_t a1)
{
  id *v2;
  id v3;

  if ((objc_msgSend(*(id *)(a1 + 32), "finishIfCancelled") & 1) == 0)
  {
    v2 = *(id **)(a1 + 32);
    objc_msgSend(v2[65], "objectEnumerator");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "mainWithTransfers:", v3);

  }
}

- (BOOL)shouldRetryForError:(id)a3
{
  return 0;
}

- (id)subclassableDescriptionWithContext:(id)a3
{
  id v4;
  double v5;
  double v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;

  v4 = a3;
  v5 = (double)-[BRCTransferBatchOperation doneSize](self, "doneSize") * 100.0;
  v6 = v5 / (double)-[BRCTransferBatchOperation totalSize](self, "totalSize");
  v7 = (void *)MEMORY[0x1E0CB3940];
  v8 = -[BRCTransferBatchOperation itemsCount](self, "itemsCount");
  +[BRCDumpContext stringFromByteCount:context:](BRCDumpContext, "stringFromByteCount:context:", self->_totalSize, v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "stringWithFormat:", CFSTR("records-left:%ld progress:%.1f%% size:%@"), v8, *(_QWORD *)&v6, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)_addTransfer:(id)a3
{
  NSMutableDictionary *entriesByRecordID;
  void *v5;
  NSMutableDictionary *entriesByTransferID;
  void *v7;
  void *v8;
  NSMutableDictionary *entriesBySecondaryRecordID;
  NSMutableDictionary *v10;
  NSMutableDictionary *v11;
  void *v12;
  id v13;

  v13 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  self->_totalSize += objc_msgSend(v13, "totalSize");
  entriesByRecordID = self->_entriesByRecordID;
  objc_msgSend(v13, "recordID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](entriesByRecordID, "setObject:forKeyedSubscript:", v13, v5);

  entriesByTransferID = self->_entriesByTransferID;
  objc_msgSend(v13, "transferID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](entriesByTransferID, "setObject:forKeyedSubscript:", v13, v7);

  ++self->_itemsCount;
  objc_msgSend(v13, "secondaryRecordID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    entriesBySecondaryRecordID = self->_entriesBySecondaryRecordID;
    if (!entriesBySecondaryRecordID)
    {
      v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      v11 = self->_entriesBySecondaryRecordID;
      self->_entriesBySecondaryRecordID = v10;

      entriesBySecondaryRecordID = self->_entriesBySecondaryRecordID;
    }
    objc_msgSend(v13, "secondaryRecordID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](entriesBySecondaryRecordID, "setObject:forKeyedSubscript:", v13, v12);

  }
}

- (void)addTransfer:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__BRCTransferBatchOperation_addTransfer___block_invoke;
  block[3] = &unk_1E875D470;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(queue, block);

}

uint64_t __41__BRCTransferBatchOperation_addTransfer___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_addTransfer:", *(_QWORD *)(a1 + 40));
}

- (void)_cancelTransferID:(id)a3
{
  BRCTransferBatchOperation *v4;
  void *v5;
  BRCTransferBatchOperation *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11[3];
  uint8_t buf[4];
  BRCTransferBatchOperation *v13;
  __int16 v14;
  BRCTransferBatchOperation *v15;
  __int16 v16;
  BRCTransferBatchOperation *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = (BRCTransferBatchOperation *)a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_entriesByTransferID, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    brc_bread_crumbs();
    v6 = (BRCTransferBatchOperation *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412802;
      v13 = self;
      v14 = 2112;
      v15 = v4;
      v16 = 2112;
      v17 = v6;
      _os_log_debug_impl(&dword_1CBD43000, v7, OS_LOG_TYPE_DEBUG, "[DEBUG] %@ - cancelling %@%@", buf, 0x20u);
    }

    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0C947D8], 20, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCTransferBatchOperation _finishedTransfer:error:](self, "_finishedTransfer:error:", v5, v8);
    if (!-[NSMutableDictionary count](self->_entriesByRecordID, "count"))
    {
      memset(v11, 0, sizeof(v11));
      __brc_create_section(0, (uint64_t)"-[BRCTransferBatchOperation _cancelTransferID:]", 128, v11);
      brc_bread_crumbs();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134218754;
        v13 = (BRCTransferBatchOperation *)v11[0];
        v14 = 2112;
        v15 = self;
        v16 = 2112;
        v17 = self;
        v18 = 2112;
        v19 = v9;
        _os_log_debug_impl(&dword_1CBD43000, v10, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx %@ - operation is now empty, cancelling %@%@", buf, 0x2Au);
      }

      -[_BRCOperation cancel](self, "cancel");
      __brc_leave_section(v11);
    }

  }
}

- (void)cancelTransferID:(id)a3
{
  id v4;
  OS_dispatch_queue *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __46__BRCTransferBatchOperation_cancelTransferID___block_invoke;
  v7[3] = &unk_1E875D470;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async_with_logs_13(queue, v7);

}

uint64_t __46__BRCTransferBatchOperation_cancelTransferID___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_cancelTransferID:", *(_QWORD *)(a1 + 40));
}

- (void)addAliasItem:(id)a3 toTransferWithID:(id)a4
{
  id v6;
  id v7;
  OS_dispatch_queue *queue;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __59__BRCTransferBatchOperation_addAliasItem_toTransferWithID___block_invoke;
  v11[3] = &unk_1E875D448;
  v11[4] = self;
  v12 = v7;
  v13 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_async_with_logs_13(queue, v11);

}

void __59__BRCTransferBatchOperation_addAliasItem_toTransferWithID___block_invoke(_QWORD *a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1[4] + 520), "objectForKeyedSubscript:", a1[5]);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "progress");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addAliasItem:", a1[6]);

}

- (double)progressForTransferID:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  double v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  double *v13;
  uint64_t v14;
  uint64_t v15;

  v4 = a3;
  v12 = 0;
  v13 = (double *)&v12;
  v14 = 0x2020000000;
  v15 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__BRCTransferBatchOperation_progressForTransferID___block_invoke;
  block[3] = &unk_1E87615A8;
  block[4] = self;
  v10 = v4;
  v11 = &v12;
  v6 = v4;
  dispatch_sync(queue, block);
  v7 = v13[3];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __51__BRCTransferBatchOperation_progressForTransferID___block_invoke(_QWORD *a1)
{
  void *v2;
  double v3;
  double v4;
  double v5;
  void *v6;

  objc_msgSend(*(id *)(a1[4] + 520), "objectForKeyedSubscript:", a1[5]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v6 = v2;
    v3 = (double)(unint64_t)objc_msgSend(v2, "doneSize");
    v4 = (double)(unint64_t)objc_msgSend(v6, "totalSize");
    v2 = v6;
    v5 = v3 / v4;
  }
  else
  {
    v5 = -1.0;
  }
  *(double *)(*(_QWORD *)(a1[6] + 8) + 24) = v5;

}

- (void)_setProgress:(double)a3 forTransfer:(id)a4
{
  id v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  NSObject *v17;
  int v18;
  BRCTransferBatchOperation *v19;
  __int16 v20;
  id v21;
  __int16 v22;
  double v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v7 = objc_msgSend(v6, "totalSize") * (unint64_t)(a3 * 1000.0) / 0x3E8;
  v8 = objc_msgSend(v6, "doneSize");
  v9 = v7 - v8;
  if (v7 > v8)
  {
    v10 = v8;
    objc_msgSend(v6, "setDoneSize:", v7);
    -[BRCTransferBatchOperation setDoneSize:](self, "setDoneSize:", v9 + -[BRCTransferBatchOperation doneSize](self, "doneSize"));
    objc_msgSend(v6, "progress");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (uint64_t)((double)objc_msgSend(v11, "totalUnitCount") * a3);

    objc_msgSend(v6, "progress");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "completedUnitCount");

    if (v14 < v12)
    {
      objc_msgSend(v6, "progress");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setCompletedUnitCount:", v12);

    }
    if ((a3 < 0.0 || os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
      && round((double)v7 / (double)(unint64_t)objc_msgSend(v6, "totalSize") * 1000.0) != round((double)v10/ (double)(unint64_t)objc_msgSend(v6, "totalSize")* 1000.0))
    {
      brc_bread_crumbs();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        v18 = 138413058;
        v19 = self;
        v20 = 2112;
        v21 = v6;
        v22 = 2048;
        v23 = a3 * 100.0;
        v24 = 2112;
        v25 = v16;
        _os_log_debug_impl(&dword_1CBD43000, v17, OS_LOG_TYPE_DEBUG, "[DEBUG] %@ - %@ progress %.1f%%%@", (uint8_t *)&v18, 0x2Au);
      }

    }
  }

}

- (void)setProgress:(double)a3 forRecordID:(id)a4
{
  id v6;
  NSObject *v7;
  NSObject *queue;
  id v9;
  _QWORD block[5];
  id v11;
  double v12;

  v6 = a4;
  -[_BRCOperation callbackQueue](self, "callbackQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__BRCTransferBatchOperation_setProgress_forRecordID___block_invoke;
  block[3] = &unk_1E875E038;
  block[4] = self;
  v11 = v6;
  v12 = a3;
  v9 = v6;
  dispatch_sync(queue, block);
  -[BRCTransferBatchOperation sendBatchProgressedCallback](self, "sendBatchProgressedCallback");

}

void __53__BRCTransferBatchOperation_setProgress_forRecordID___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 504), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = v2;
    objc_msgSend(*(id *)(a1 + 32), "_setProgress:forTransfer:", v2, *(double *)(a1 + 48));
    v2 = v3;
  }

}

- (void)_finishedTransfer:(id)a3 error:(id)a4
{
  id v6;
  __CFString *v7;
  NSMutableDictionary *entriesByRecordID;
  void *v9;
  NSMutableDictionary *entriesByTransferID;
  void *v11;
  NSMutableDictionary *entriesBySecondaryRecordID;
  void *v13;
  void *v14;
  NSObject *v15;
  const __CFString *v16;
  int v17;
  BRCTransferBatchOperation *v18;
  __int16 v19;
  id v20;
  __int16 v21;
  const __CFString *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (__CFString *)a4;
  if (!v7)
    -[BRCTransferBatchOperation _setProgress:forTransfer:](self, "_setProgress:forTransfer:", v6, 1.0);
  entriesByRecordID = self->_entriesByRecordID;
  objc_msgSend(v6, "recordID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary removeObjectForKey:](entriesByRecordID, "removeObjectForKey:", v9);

  entriesByTransferID = self->_entriesByTransferID;
  objc_msgSend(v6, "transferID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary removeObjectForKey:](entriesByTransferID, "removeObjectForKey:", v11);

  entriesBySecondaryRecordID = self->_entriesBySecondaryRecordID;
  objc_msgSend(v6, "secondaryRecordID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary removeObjectForKey:](entriesBySecondaryRecordID, "removeObjectForKey:", v13);

  brc_bread_crumbs();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    v16 = CFSTR("success");
    v17 = 138413058;
    if (v7)
      v16 = v7;
    v18 = self;
    v19 = 2112;
    v20 = v6;
    v21 = 2112;
    v22 = v16;
    v23 = 2112;
    v24 = v14;
    _os_log_debug_impl(&dword_1CBD43000, v15, OS_LOG_TYPE_DEBUG, "[DEBUG] %@ - done with %@: %@%@", (uint8_t *)&v17, 0x2Au);
  }

}

- (void)sendBatchProgressedCallback
{
  NSObject *v3;
  void (**didProgressBlock)(void);

  -[_BRCOperation callbackQueue](self, "callbackQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  didProgressBlock = (void (**)(void))self->_didProgressBlock;
  if (didProgressBlock)
    didProgressBlock[2]();
}

- (void)sendTransferCompletionCallBack:(id)a3 error:(id)a4
{
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  brc_bread_crumbs();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    -[BRCTransferBatchOperation sendTransferCompletionCallBack:error:].cold.1((uint64_t)v4, v5, v6, v7, v8, v9, v10, v11);

}

- (id)_finishedTransferForRecord:(id)a3 recordID:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  void *v13;
  NSMutableDictionary *entriesBySecondaryRecordID;
  void *v15;
  void *v16;
  NSMutableDictionary *entriesByRecordID;
  _BOOL4 v18;
  void *v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_entriesByRecordID, "objectForKeyedSubscript:", v9);
  v11 = objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v12 = (id)v11;
    -[NSMutableDictionary removeObjectForKey:](self->_entriesByRecordID, "removeObjectForKey:", v9);
    objc_msgSend(v12, "setRecord:", v8);
    objc_msgSend(v12, "secondaryRecordID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v13)
    {
      v18 = 1;
      goto LABEL_8;
    }
    entriesBySecondaryRecordID = self->_entriesBySecondaryRecordID;
    objc_msgSend(v12, "secondaryRecordID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](entriesBySecondaryRecordID, "objectForKeyedSubscript:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_entriesBySecondaryRecordID, "objectForKeyedSubscript:", v9);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    if (!v12)
      goto LABEL_10;
    -[NSMutableDictionary removeObjectForKey:](self->_entriesBySecondaryRecordID, "removeObjectForKey:", v9);
    objc_msgSend(v12, "setSecondaryRecord:", v8);
    entriesByRecordID = self->_entriesByRecordID;
    objc_msgSend(v12, "recordID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](entriesByRecordID, "objectForKeyedSubscript:", v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
  }
  v18 = v16 == 0;

LABEL_8:
  if (v10 || v18)
  {
    -[BRCTransferBatchOperation _finishedTransfer:error:](self, "_finishedTransfer:error:", v12, v10);
    v12 = v12;
    v19 = v12;
    goto LABEL_12;
  }
LABEL_10:
  v19 = 0;
LABEL_12:

  return v19;
}

- (void)finishedTransferForRecord:(id)a3 recordID:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  NSObject *v11;
  void *v12;
  NSObject *v13;
  NSObject *queue;
  id v15;
  id v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  uint64_t v18;
  void *v19;
  void *v20;
  _QWORD block[5];
  id v22;
  id v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  _BYTE *v25;
  _BYTE buf[24];
  uint64_t (*v27)(uint64_t, uint64_t);
  __int128 v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = (uint64_t (*)(uint64_t, uint64_t))a5;
  -[_BRCOperation callbackQueue](self, "callbackQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v11);

  brc_bread_crumbs();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138413058;
    *(_QWORD *)&buf[4] = self;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v9;
    *(_WORD *)&buf[22] = 2112;
    v27 = v10;
    LOWORD(v28) = 2112;
    *(_QWORD *)((char *)&v28 + 2) = v12;
    _os_log_debug_impl(&dword_1CBD43000, v13, OS_LOG_TYPE_DEBUG, "[DEBUG] %@ - Finished transfer for recordID: %@ with error: %@%@", buf, 0x2Au);
  }

  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v27 = __Block_byref_object_copy__41;
  *(_QWORD *)&v28 = __Block_byref_object_dispose__41;
  *((_QWORD *)&v28 + 1) = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __70__BRCTransferBatchOperation_finishedTransferForRecord_recordID_error___block_invoke;
  block[3] = &unk_1E87610A8;
  v25 = buf;
  block[4] = self;
  v15 = v8;
  v22 = v15;
  v16 = v9;
  v23 = v16;
  v17 = v10;
  v24 = v17;
  dispatch_sync(queue, block);
  v18 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40);
  if (v18)
  {
    -[BRCTransferBatchOperation sendTransferCompletionCallBack:error:](self, "sendTransferCompletionCallBack:error:", v18, v17);
    -[BRCTransferBatchOperation sendBatchProgressedCallback](self, "sendBatchProgressedCallback");
    v19 = *(void **)(*(_QWORD *)&buf[8] + 40);
  }
  else
  {
    v19 = 0;
  }
  if (objc_msgSend(v19, "progressPublished"))
  {
    objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "progress");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "brc_unpublish");

    objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "setProgressPublished:", 0);
  }

  _Block_object_dispose(buf, 8);
}

void __70__BRCTransferBatchOperation_finishedTransferForRecord_recordID_error___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_finishedTransferForRecord:recordID:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)actionPrettyName
{
  return CFSTR("transferring");
}

- (void)finishWithResult:(id)a3 error:(id)a4
{
  id v6;
  NSObject *queue;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  BRCTransferBatchOperation *v16;
  NSObject *v17;
  NSObject *v18;
  id v19;
  void *v20;
  NSObject *v21;
  NSObject *pendingGroup;
  NSObject *v23;
  id v24;
  id v25;
  id v26;
  uint64_t v27;
  id v28;
  _QWORD v29[5];
  id v30;
  id v31;
  __int128 v32;
  uint64_t v33;
  __int128 v34;
  uint64_t v35;
  __int128 v36;
  uint64_t v37;
  _QWORD v38[6];
  id v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _QWORD block[5];
  id v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t (*v50)(uint64_t, uint64_t);
  void (*v51)(uint64_t);
  id v52;
  uint8_t buf[4];
  void *v54;
  __int16 v55;
  BRCTransferBatchOperation *v56;
  __int16 v57;
  void *v58;
  _BYTE v59[128];
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v26 = a3;
  v6 = a4;
  v47 = 0;
  v48 = &v47;
  v49 = 0x3032000000;
  v50 = __Block_byref_object_copy__41;
  v51 = __Block_byref_object_dispose__41;
  v52 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__BRCTransferBatchOperation_finishWithResult_error___block_invoke;
  block[3] = &unk_1E875D528;
  v46 = &v47;
  block[4] = self;
  v28 = v6;
  v45 = v28;
  dispatch_sync(queue, block);
  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  objc_msgSend((id)v48[5], "objectEnumerator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v40, v59, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v41;
    v27 = *MEMORY[0x1E0D10C90];
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v41 != v10)
          objc_enumerationMutation(v8);
        v12 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * v11);
        v13 = (void *)MEMORY[0x1D17A6BE8]();
        objc_msgSend(v12, "recordID");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "brc_cloudKitErrorForRecordID:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v15)
        {
          brc_bread_crumbs();
          v16 = (BRCTransferBatchOperation *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 138412546;
            v54 = v12;
            v55 = 2112;
            v56 = v16;
            _os_log_fault_impl(&dword_1CBD43000, v17, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: Missing transfer error for record %@%@", buf, 0x16u);
          }

          objc_msgSend(MEMORY[0x1E0CB35C8], "br_errorWithDomain:code:description:", v27, 15, CFSTR("unreachable: Missing transfer error for record %@"), v12);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
        }
        v18 = self->_queue;
        v38[0] = MEMORY[0x1E0C809B0];
        v38[1] = 3221225472;
        v38[2] = __52__BRCTransferBatchOperation_finishWithResult_error___block_invoke_18;
        v38[3] = &unk_1E875D448;
        v38[4] = self;
        v38[5] = v12;
        v19 = v15;
        v39 = v19;
        dispatch_sync(v18, v38);
        -[BRCTransferBatchOperation sendTransferCompletionCallBack:error:](self, "sendTransferCompletionCallBack:error:", v12, v19);

        objc_autoreleasePoolPop(v13);
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v40, v59, 16);
    }
    while (v9);
  }

  -[BRCTransferBatchOperation sendBatchProgressedCallback](self, "sendBatchProgressedCallback");
  v34 = 0uLL;
  v35 = 0;
  __brc_create_section(0, (uint64_t)"-[BRCTransferBatchOperation finishWithResult:error:]", 322, &v34);
  brc_bread_crumbs();
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218498;
    v54 = (void *)v34;
    v55 = 2112;
    v56 = self;
    v57 = 2112;
    v58 = v20;
    _os_log_debug_impl(&dword_1CBD43000, v21, OS_LOG_TYPE_DEBUG, "[DEBUG] ┣%llx %@ - waiting for callback...%@", buf, 0x20u);
  }

  v36 = v34;
  v37 = v35;
  pendingGroup = self->_pendingGroup;
  -[_BRCOperation callbackQueue](self, "callbackQueue");
  v23 = objc_claimAutoreleasedReturnValue();
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __52__BRCTransferBatchOperation_finishWithResult_error___block_invoke_19;
  v29[3] = &unk_1E8760D78;
  v32 = v36;
  v33 = v37;
  v29[4] = self;
  v30 = v26;
  v31 = v28;
  v24 = v28;
  v25 = v26;
  dispatch_group_notify(pendingGroup, v23, v29);

  _Block_object_dispose(&v47, 8);
}

void __52__BRCTransferBatchOperation_finishWithResult_error___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  const __CFString *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  const char *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  NSObject *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  uint64_t v40;
  __int16 v41;
  uint64_t v42;
  __int16 v43;
  uint64_t v44;
  __int16 v45;
  void *v46;
  __int16 v47;
  void *v48;
  __int16 v49;
  void *v50;
  __int16 v51;
  void *v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 504), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  v5 = *(void **)(a1 + 40);
  if (v5 && (objc_msgSend(v5, "brc_isCloudKitCancellationError") & 1) == 0)
  {
    brc_bread_crumbs();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v17 = *(void **)(a1 + 32);
      objc_msgSend(v17, "actionPrettyName");
      v36 = objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(*(id *)(a1 + 32), "itemsCount");
      objc_msgSend(*(id *)(a1 + 32), "transferredObjectsPrettyName");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      +[BRCDumpContext stringFromByteCount:showActualByteCount:suffix:context:](BRCDumpContext, "stringFromByteCount:showActualByteCount:suffix:context:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 528), 0, 0, 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "syncContext");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "contextIdentifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = *(void **)(a1 + 40);
      *(_DWORD *)buf = 138414082;
      v38 = v17;
      v39 = 2112;
      v15 = (void *)v36;
      v40 = v36;
      v41 = 2048;
      v42 = v18;
      v43 = 2112;
      v44 = (uint64_t)v11;
      v45 = 2112;
      v46 = v12;
      v47 = 2112;
      v48 = v14;
      v49 = 2112;
      v50 = v19;
      v51 = 2112;
      v52 = v6;
      v16 = "[WARNING] %@ - failed %@ %ld %@ (%@) in %@: %@%@";
LABEL_10:
      _os_log_impl(&dword_1CBD43000, v7, OS_LOG_TYPE_DEFAULT, v16, buf, 0x52u);

    }
  }
  else
  {
    brc_bread_crumbs();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(void **)(a1 + 32);
      objc_msgSend(v8, "actionPrettyName");
      v34 = objc_claimAutoreleasedReturnValue();
      v35 = v6;
      if (objc_msgSend(*(id *)(a1 + 40), "brc_isCloudKitCancellationError"))
        v9 = CFSTR(" (cancelled)");
      else
        v9 = &stru_1E8769030;
      v10 = objc_msgSend(*(id *)(a1 + 32), "itemsCount");
      objc_msgSend(*(id *)(a1 + 32), "transferredObjectsPrettyName");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      +[BRCDumpContext stringFromByteCount:showActualByteCount:suffix:context:](BRCDumpContext, "stringFromByteCount:showActualByteCount:suffix:context:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 528), 0, 0, 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "syncContext");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "contextIdentifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138414082;
      v38 = v8;
      v39 = 2112;
      v15 = (void *)v34;
      v40 = v34;
      v41 = 2112;
      v42 = (uint64_t)v9;
      v6 = v35;
      v43 = 2048;
      v44 = v10;
      v45 = 2112;
      v46 = v11;
      v47 = 2112;
      v48 = v12;
      v49 = 2112;
      v50 = v14;
      v51 = 2112;
      v52 = v35;
      v16 = "[NOTICE] %@ - finished %@%@ %ld %@ (%@) in %@%@";
      goto LABEL_10;
    }
  }

  v20 = *(_QWORD *)(a1 + 32);
  v21 = *(void **)(v20 + 504);
  *(_QWORD *)(v20 + 504) = 0;

  v22 = *(_QWORD *)(a1 + 32);
  v23 = *(void **)(v22 + 520);
  *(_QWORD *)(v22 + 520) = 0;

  v24 = *(_QWORD *)(a1 + 32);
  v25 = *(void **)(v24 + 512);
  *(_QWORD *)(v24 + 512) = 0;

  if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "count") && !*(_QWORD *)(a1 + 40))
  {
    brc_bread_crumbs();
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
      __52__BRCTransferBatchOperation_finishWithResult_error___block_invoke_cold_1((uint64_t)v26, v27, v28, v29, v30, v31, v32, v33);

  }
}

uint64_t __52__BRCTransferBatchOperation_finishWithResult_error___block_invoke_18(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_finishedTransfer:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void __52__BRCTransferBatchOperation_finishWithResult_error___block_invoke_19(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  objc_super v7;
  __int128 v8;
  uint64_t v9;
  uint8_t buf[4];
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v8 = *(_OWORD *)(a1 + 56);
  v9 = *(_QWORD *)(a1 + 72);
  brc_bread_crumbs();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v6 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 134218498;
    v11 = v8;
    v12 = 2112;
    v13 = v6;
    v14 = 2112;
    v15 = v2;
    _os_log_debug_impl(&dword_1CBD43000, v3, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx %@ - callbacks finished%@", buf, 0x20u);
  }

  v4 = *(_QWORD *)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 48);
  v7.receiver = *(id *)(a1 + 32);
  v7.super_class = (Class)BRCTransferBatchOperation;
  objc_msgSendSuper2(&v7, sel_finishWithResult_error_, v4, v5);
  __brc_leave_section((uint64_t *)&v8);
}

- (id)transferredObjectsPrettyName
{
  return CFSTR("items");
}

- (unint64_t)doneSize
{
  return self->_doneSize;
}

- (void)setDoneSize:(unint64_t)a3
{
  self->_doneSize = a3;
}

- (unint64_t)totalSize
{
  return self->_totalSize;
}

- (void)setTotalSize:(unint64_t)a3
{
  self->_totalSize = a3;
}

- (id)didProgressBlock
{
  return objc_getProperty(self, a2, 560, 1);
}

- (void)setDidProgressBlock:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 560);
}

- (OS_dispatch_group)pendingGroup
{
  return self->_pendingGroup;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingGroup, 0);
  objc_storeStrong(&self->_didProgressBlock, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_entriesByTransferID, 0);
  objc_storeStrong((id *)&self->_entriesBySecondaryRecordID, 0);
  objc_storeStrong((id *)&self->_entriesByRecordID, 0);
}

void __77__BRCTransferBatchOperation_Downloads__fetchOperationForTransfers_traceCode___block_invoke_100_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, a2, a3, "[CRIT] UNREACHABLE: no record and no error%@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)sendTransferCompletionCallBack:(uint64_t)a3 error:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, a2, a3, "[CRIT] API MISUSE: implement in subclass%@", a5, a6, a7, a8, 2u);
}

void __52__BRCTransferBatchOperation_finishWithResult_error___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, a2, a3, "[CRIT] Assertion failed: entries.count == 0 || error%@", a5, a6, a7, a8, 2u);
}

@end
