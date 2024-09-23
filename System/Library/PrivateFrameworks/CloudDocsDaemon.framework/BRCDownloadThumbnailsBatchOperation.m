@implementation BRCDownloadThumbnailsBatchOperation

- (BRCDownloadThumbnailsBatchOperation)initWithSyncContext:(id)a3
{
  id v4;
  void *v5;
  BRCDownloadThumbnailsBatchOperation *v6;
  objc_super v8;

  v4 = a3;
  objc_msgSend(v4, "session");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8.receiver = self;
  v8.super_class = (Class)BRCDownloadThumbnailsBatchOperation;
  v6 = -[BRCTransferBatchOperation initWithName:syncContext:sessionContext:](&v8, sel_initWithName_syncContext_sessionContext_, CFSTR("dl-thumbnail"), v4, v5);

  return v6;
}

- (id)createActivity
{
  return _os_activity_create(&dword_1CBD43000, "dl-thumbnail", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
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
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  id v19;

  v6 = a3;
  v7 = a4;
  -[BRCDownloadThumbnailsBatchOperation perDownloadCompletionBlock](self, "perDownloadCompletionBlock");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = v6;
    -[BRCSyncContext session](self->super.super._syncContext, "session");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      -[BRCSyncContext session](self->super.super._syncContext, "session");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 0;
      objc_msgSend(v9, "_stageWithSession:error:", v11, &v19);
      v7 = v19;

    }
    objc_msgSend(v10, "clientDB");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "serialQueue");
    v13 = objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __76__BRCDownloadThumbnailsBatchOperation_sendTransferCompletionCallBack_error___block_invoke;
    v15[3] = &unk_1E8761190;
    v18 = v8;
    v16 = v9;
    v7 = v7;
    v17 = v7;
    v14 = v9;
    dispatch_sync(v13, v15);

  }
}

uint64_t __76__BRCDownloadThumbnailsBatchOperation_sendTransferCompletionCallBack_error___block_invoke(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)mainWithTransfers:(id)a3
{
  void *v4;
  id v5;

  -[BRCTransferBatchOperation fetchOperationForTransfers:traceCode:](self, "fetchOperationForTransfers:traceCode:", a3, 16);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C95048], "desiredKeysWithMask:", 16);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDesiredKeys:", v4);

  -[_BRCOperation addSubOperation:](self, "addSubOperation:", v5);
}

- (id)transferredObjectsPrettyName
{
  return CFSTR("thumbnails");
}

- (id)actionPrettyName
{
  return CFSTR("downloading");
}

- (void)finishWithResult:(id)a3 error:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BRCDownloadThumbnailsBatchOperation;
  -[BRCTransferBatchOperation finishWithResult:error:](&v5, sel_finishWithResult_error_, a3, a4);
  -[BRCDownloadThumbnailsBatchOperation setPerDownloadCompletionBlock:](self, "setPerDownloadCompletionBlock:", 0);
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
