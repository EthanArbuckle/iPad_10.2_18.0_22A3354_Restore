@implementation BRCDownloadVersionsBatchOperation

- (BRCDownloadVersionsBatchOperation)initWithSyncContext:(id)a3 forNonLocalVersion:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  BRCDownloadVersionsBatchOperation *v8;
  BOOL v9;
  NSMutableDictionary *v10;
  NSMutableDictionary *readers;
  objc_super v13;

  v4 = a4;
  v6 = a3;
  objc_msgSend(v6, "session");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13.receiver = self;
  v13.super_class = (Class)BRCDownloadVersionsBatchOperation;
  v8 = -[BRCTransferBatchOperation initWithName:syncContext:sessionContext:](&v13, sel_initWithName_syncContext_sessionContext_, CFSTR("dl-version"), v6, v7);

  if (v8)
    v9 = !v4;
  else
    v9 = 1;
  if (!v9)
  {
    v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    readers = v8->_readers;
    v8->_readers = v10;

    -[_BRCOperation setNonDiscretionary:](v8, "setNonDiscretionary:", 1);
  }
  return v8;
}

- (id)createActivity
{
  return _os_activity_create(&dword_1CBD43000, "dl-version", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
}

- (void)addDownload:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[5];

  v4 = a3;
  -[BRCTransferBatchOperation addTransfer:](self, "addTransfer:", v4);
  -[BRCSyncContext session](self->super.super._syncContext, "session");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "analyticsReporter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fileObjectID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __49__BRCDownloadVersionsBatchOperation_addDownload___block_invoke;
  v8[3] = &unk_1E8763F50;
  v8[4] = self;
  objc_msgSend(v6, "lookupUserDownloadEventByFileObjectID:accessor:", v7, v8);

}

uint64_t __49__BRCDownloadVersionsBatchOperation_addDownload___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "associateCKOperationsToEventMetric:", a2);
}

- (void)sendTransferCompletionCallBack:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  id v19;
  id *v20;
  id v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  NSObject *v26;
  id v27;
  id v28;
  id *v29;
  _QWORD v30[4];
  id v31;
  id v32;
  id v33;
  _QWORD v34[4];
  id v35;
  _QWORD v36[2];
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  _QWORD block[4];
  id v43;
  id v44;
  id v45;

  v6 = a3;
  v7 = a4;
  -[BRCDownloadVersionsBatchOperation perDownloadCompletionBlock](self, "perDownloadCompletionBlock");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = v6;
    -[BRCSyncContext session](self->super.super._syncContext, "session");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v7)
    {
      objc_msgSend(v10, "clientDB");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "serialQueue");
      v13 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __74__BRCDownloadVersionsBatchOperation_sendTransferCompletionCallBack_error___block_invoke;
      block[3] = &unk_1E8761190;
      v45 = v8;
      v43 = v9;
      v44 = v7;
      dispatch_sync(v13, block);

    }
    else
    {
      v41 = 0;
      v40 = 0;
      objc_msgSend(v9, "_stageWithSession:creationInfo:error:", v10, &v41, &v40);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v40;
      if (v14)
      {
        -[BRCTransferBatchOperation pendingGroup](self, "pendingGroup");
        v16 = objc_claimAutoreleasedReturnValue();
        dispatch_group_enter(v16);

        objc_msgSend(v9, "storage");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = v41;
        v34[0] = MEMORY[0x1E0C809B0];
        v34[1] = 3221225472;
        v34[2] = __74__BRCDownloadVersionsBatchOperation_sendTransferCompletionCallBack_error___block_invoke_120;
        v34[3] = &unk_1E8763F78;
        v29 = &v35;
        v28 = v15;
        v18 = v14;
        v19 = v14;
        v35 = v19;
        v20 = (id *)v36;
        v36[0] = v41;
        v36[1] = self;
        v37 = v11;
        v39 = v8;
        v38 = v9;
        v21 = v19;
        v14 = v18;
        v15 = v28;
        objc_msgSend(v17, "createAdditionStagedAtURL:creationInfo:completionHandler:", v21, v27, v34);

        v22 = v37;
      }
      else
      {
        brc_bread_crumbs();
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, (os_log_type_t)0x90u))
          -[BRCDownloadVersionsBatchOperation sendTransferCompletionCallBack:error:].cold.1((uint64_t)v15);

        objc_msgSend(v11, "clientDB");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "serialQueue");
        v26 = objc_claimAutoreleasedReturnValue();
        v30[1] = 3221225472;
        v30[2] = __74__BRCDownloadVersionsBatchOperation_sendTransferCompletionCallBack_error___block_invoke_2;
        v30[3] = &unk_1E8761190;
        v29 = &v33;
        v30[0] = MEMORY[0x1E0C809B0];
        v33 = v8;
        v20 = &v31;
        v31 = v9;
        v32 = v15;
        dispatch_sync(v26, v30);

        v22 = v32;
      }

    }
  }

}

uint64_t __74__BRCDownloadVersionsBatchOperation_sendTransferCompletionCallBack_error___block_invoke(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __74__BRCDownloadVersionsBatchOperation_sendTransferCompletionCallBack_error___block_invoke_120(id *a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  NSObject *v13;
  NSObject *v14;
  _QWORD *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  NSObject *v19;
  _QWORD *v20;
  NSObject *v21;
  const char *label;
  uint64_t v23;
  id v24;
  _QWORD v25[4];
  id v26;
  id v27;
  id v28;
  __int128 v29;
  uint64_t v30;
  _BYTE block[24];
  void *v32;
  NSObject *v33;
  id v34;
  __int128 v35;
  uint64_t v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v24 = a2;
  v5 = a3;
  if (!v5)
  {
    brc_bread_crumbs();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      __74__BRCDownloadVersionsBatchOperation_sendTransferCompletionCallBack_error___block_invoke_120_cold_1((uint64_t)a1, (uint64_t)v6, v7);

  }
  objc_msgSend(a1[6], "pendingGroup");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[7], "clientDB");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "serialQueue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1E0C809B0];
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __74__BRCDownloadVersionsBatchOperation_sendTransferCompletionCallBack_error___block_invoke_121;
  v25[3] = &unk_1E8761190;
  v28 = a1[9];
  v26 = a1[8];
  v12 = v5;
  v27 = v12;
  v13 = v8;
  v14 = v10;
  v15 = v25;
  v16 = (void *)MEMORY[0x1D17A6BE8]();
  v29 = 0uLL;
  v30 = 0;
  __brc_create_section(0, (uint64_t)"dispatch_group_async_with_logs", 293, &v29);
  brc_bread_crumbs();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    v23 = v29;
    label = dispatch_queue_get_label(v14);
    *(_DWORD *)block = 134218498;
    *(_QWORD *)&block[4] = v23;
    *(_WORD *)&block[12] = 2080;
    *(_QWORD *)&block[14] = label;
    *(_WORD *)&block[22] = 2112;
    v32 = v17;
    _os_log_debug_impl(&dword_1CBD43000, v18, OS_LOG_TYPE_DEBUG, "[DEBUG] ┣%llx dispatching to %s%@", block, 0x20u);
  }

  v35 = v29;
  v36 = v30;
  *(_QWORD *)block = v11;
  *(_QWORD *)&block[8] = 3221225472;
  *(_QWORD *)&block[16] = __dispatch_group_async_with_logs_block_invoke_0;
  v32 = &unk_1E875D578;
  v19 = v14;
  v33 = v19;
  v20 = v15;
  v34 = v20;
  dispatch_group_async(v13, v19, block);

  objc_autoreleasePoolPop(v16);
  objc_msgSend(a1[6], "pendingGroup");
  v21 = objc_claimAutoreleasedReturnValue();
  dispatch_group_leave(v21);

}

uint64_t __74__BRCDownloadVersionsBatchOperation_sendTransferCompletionCallBack_error___block_invoke_121(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

uint64_t __74__BRCDownloadVersionsBatchOperation_sendTransferCompletionCallBack_error___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)mainWithTransfers:(id)a3
{
  void *v4;
  id v5;

  -[BRCTransferBatchOperation fetchOperationForTransfers:traceCode:](self, "fetchOperationForTransfers:traceCode:", a3, 20);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C95048], "desiredKeysWithMask:", 53);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDesiredKeys:", v4);

  -[_BRCOperation addSubOperation:](self, "addSubOperation:", v5);
}

- (void)addReaderID:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD block[5];
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  -[_BRCOperation callbackQueue](self, "callbackQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_activate(v8);

  -[_BRCOperation callbackQueue](self, "callbackQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __67__BRCDownloadVersionsBatchOperation_addReaderID_completionHandler___block_invoke;
  block[3] = &unk_1E8762BC0;
  v13 = v6;
  v14 = v7;
  block[4] = self;
  v10 = v6;
  v11 = v7;
  dispatch_sync(v9, block);

}

void __67__BRCDownloadVersionsBatchOperation_addReaderID_completionHandler___block_invoke(uint64_t a1)
{
  int v2;
  uint64_t v3;
  void *v4;
  id v5;

  v2 = objc_msgSend(*(id *)(a1 + 32), "isFinished");
  v3 = *(_QWORD *)(a1 + 48);
  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "error");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "brc_wrappedError");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v4);

  }
  else
  {
    v5 = (id)MEMORY[0x1D17A6DB0](*(_QWORD *)(a1 + 48));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 576), "setObject:forKeyedSubscript:");
  }

}

- (void)cancelReaderID:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  -[_BRCOperation callbackQueue](self, "callbackQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__BRCDownloadVersionsBatchOperation_cancelReaderID___block_invoke;
  block[3] = &unk_1E875D470;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(v5, block);

}

void __52__BRCDownloadVersionsBatchOperation_cancelReaderID___block_invoke(uint64_t a1)
{
  void (**v2)(id, void *);
  uint64_t v3;
  id *v4;
  void *v5;
  void (**v6)(id, void *);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 576), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v2 = (void (**)(id, void *))objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v6 = v2;
    v3 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 576), "count");
    v4 = *(id **)(a1 + 32);
    if (v3 == 1)
    {
      objc_msgSend(v4, "cancel");
    }
    else
    {
      objc_msgSend(v4[72], "removeObjectForKey:", *(_QWORD *)(a1 + 40));
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 3072, 0);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6[2](v6, v5);

    }
    v2 = v6;
  }

}

- (id)transferredObjectsPrettyName
{
  return CFSTR("previous documents versions");
}

- (id)actionPrettyName
{
  return CFSTR("downloading");
}

- (void)finishWithResult:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  objc_super v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[NSMutableDictionary objectEnumerator](self->_readers, "objectEnumerator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v17;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v12);
        objc_msgSend(v7, "brc_wrappedError");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, void *))(v13 + 16))(v13, v14);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v10);
  }

  -[NSMutableDictionary removeAllObjects](self->_readers, "removeAllObjects");
  v15.receiver = self;
  v15.super_class = (Class)BRCDownloadVersionsBatchOperation;
  -[BRCTransferBatchOperation finishWithResult:error:](&v15, sel_finishWithResult_error_, v6, v7);
  -[BRCDownloadVersionsBatchOperation setPerDownloadCompletionBlock:](self, "setPerDownloadCompletionBlock:", 0);

}

- (id)perDownloadCompletionBlock
{
  return objc_getProperty(self, a2, 584, 1);
}

- (void)setPerDownloadCompletionBlock:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 584);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_perDownloadCompletionBlock, 0);
  objc_storeStrong((id *)&self->_readers, 0);
}

- (void)sendTransferCompletionCallBack:(uint64_t)a1 error:.cold.1(uint64_t a1)
{
  os_log_t v1;
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412546;
  v3 = a1;
  OUTLINED_FUNCTION_5();
  _os_log_error_impl(&dword_1CBD43000, v1, (os_log_type_t)0x90u, "[ERROR] Unable to stage item in Genstore: %@%@", (uint8_t *)&v2, 0x16u);
  OUTLINED_FUNCTION_2();
}

void __74__BRCDownloadVersionsBatchOperation_sendTransferCompletionCallBack_error___block_invoke_120_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5 = 138412802;
  v6 = v3;
  v7 = 2112;
  v8 = v4;
  v9 = 2112;
  v10 = a2;
  _os_log_debug_impl(&dword_1CBD43000, log, OS_LOG_TYPE_DEBUG, "[DEBUG] Created addition staged at URL: %@, creation info: %@%@", (uint8_t *)&v5, 0x20u);
}

@end
