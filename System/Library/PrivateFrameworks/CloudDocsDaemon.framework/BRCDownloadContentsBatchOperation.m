@implementation BRCDownloadContentsBatchOperation

- (BRCDownloadContentsBatchOperation)initWithSyncContext:(id)a3 sessionContext:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BRCDownloadContentsBatchOperation;
  return -[BRCTransferBatchOperation initWithName:syncContext:sessionContext:](&v5, sel_initWithName_syncContext_sessionContext_, CFSTR("dl-content"), a3, a4);
}

- (id)createActivity
{
  return _os_activity_create(&dword_1CBD43000, "dl-content", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
}

- (void)sendTransferCompletionCallBack:(id)a3 error:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  NSObject *v11;
  id v12;
  id v13;
  _QWORD block[4];
  id v15;
  id v16;
  BRCDownloadContentsBatchOperation *v17;
  id v18;

  v13 = a3;
  v6 = a4;
  -[BRCDownloadContentsBatchOperation perDownloadCompletionBlock](self, "perDownloadCompletionBlock");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = v13;
    -[BRCSyncContext session](self->super.super._syncContext, "session");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "clientDB");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "serialQueue");
    v11 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __74__BRCDownloadContentsBatchOperation_sendTransferCompletionCallBack_error___block_invoke;
    block[3] = &unk_1E875DDA0;
    v15 = v6;
    v16 = v8;
    v17 = self;
    v18 = v7;
    v12 = v8;
    dispatch_sync(v11, block);

  }
}

void __74__BRCDownloadContentsBatchOperation_sendTransferCompletionCallBack_error___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  v4 = *(id *)(a1 + 32);
  if (!v4)
  {
    v2 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 248), "session");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "_stageWithSession:error:", v3, &v4);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

}

- (void)mainWithTransfers:(id)a3
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  const __CFString *v23;
  uint64_t v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v20 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(v10, "desiredIndices");
        v11 = objc_claimAutoreleasedReturnValue();
        v12 = (void *)v11;
        if (v11)
        {
          v23 = CFSTR("pkgContent");
          v24 = v11;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "recordID");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "setObject:forKeyedSubscript:", v13, v14);

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
    }
    while (v7);
  }

  objc_msgSend(v5, "objectEnumerator");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCTransferBatchOperation fetchOperationForTransfers:traceCode:](self, "fetchOperationForTransfers:traceCode:", v15, 18);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C95048], "desiredKeysWithMask:", 4);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setDesiredKeys:", v17);

  if (objc_msgSend(v4, "count"))
    objc_msgSend(v16, "setDesiredPackageFileIndices:", v4);
  -[_BRCOperation addSubOperation:](self, "addSubOperation:", v16);

}

- (id)transferredObjectsPrettyName
{
  return CFSTR("documents");
}

- (id)actionPrettyName
{
  return CFSTR("downloading");
}

- (void)finishWithResult:(id)a3 error:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BRCDownloadContentsBatchOperation;
  -[BRCTransferBatchOperation finishWithResult:error:](&v5, sel_finishWithResult_error_, a3, a4);
  -[BRCDownloadContentsBatchOperation setPerDownloadCompletionBlock:](self, "setPerDownloadCompletionBlock:", 0);
}

- (id)perDownloadCompletionBlock
{
  return objc_getProperty(self, a2, 576, 1);
}

- (void)setPerDownloadCompletionBlock:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 576);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_perDownloadCompletionBlock, 0);
}

@end
