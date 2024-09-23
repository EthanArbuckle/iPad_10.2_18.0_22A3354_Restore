@implementation DADownloadContext

- (DADownloadContext)initWithAttachmentUUID:(id)a3 accountID:(id)a4 queue:(id)a5 downloadProgressBlock:(id)a6 completionBlock:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  DADownloadContext *v19;
  DADownloadContext *v20;
  uint64_t v21;
  id progressBlock;
  uint64_t v23;
  id completionBlock;
  objc_super v26;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  if (!v13)
    -[DADownloadContext initWithAttachmentUUID:accountID:queue:downloadProgressBlock:completionBlock:].cold.1();
  if (!v14)
    -[DADownloadContext initWithAttachmentUUID:accountID:queue:downloadProgressBlock:completionBlock:].cold.2();
  v18 = v17;
  v26.receiver = self;
  v26.super_class = (Class)DADownloadContext;
  v19 = -[DADownloadContext init](&v26, sel_init);
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_attachmentUUID, a3);
    objc_storeStrong((id *)&v20->_accountID, a4);
    objc_storeStrong((id *)&v20->_queue, a5);
    v21 = objc_msgSend(v16, "copy");
    progressBlock = v20->_progressBlock;
    v20->_progressBlock = (id)v21;

    v23 = objc_msgSend(v18, "copy");
    completionBlock = v20->_completionBlock;
    v20->_completionBlock = (id)v23;

  }
  return v20;
}

- (void)updateProgressDownloadedByteCount:(int64_t)a3 totalByteCount:(int64_t)a4
{
  NSObject *v7;
  NSString *attachmentUUID;
  NSString *accountID;
  OS_dispatch_queue *queue;
  NSObject *v11;
  NSObject *v12;
  _QWORD block[7];
  uint8_t buf[4];
  NSString *v15;
  __int16 v16;
  NSString *v17;
  __int16 v18;
  int64_t v19;
  __int16 v20;
  int64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  DALoggingwithCategory(0);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    attachmentUUID = self->_attachmentUUID;
    accountID = self->_accountID;
    *(_DWORD *)buf = 138413058;
    v15 = attachmentUUID;
    v16 = 2112;
    v17 = accountID;
    v18 = 2048;
    v19 = a3;
    v20 = 2048;
    v21 = a4;
    _os_log_impl(&dword_1C1D11000, v7, OS_LOG_TYPE_DEBUG, "Download of attachment UUID %@ for accountID %@ progress: %lld bytes of %lld", buf, 0x2Au);
  }

  if (self->_progressBlock)
  {
    queue = self->_queue;
    if (queue)
    {
      v11 = queue;
    }
    else
    {
      dispatch_get_global_queue(0, 0);
      v11 = objc_claimAutoreleasedReturnValue();
    }
    v12 = v11;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __70__DADownloadContext_updateProgressDownloadedByteCount_totalByteCount___block_invoke;
    block[3] = &unk_1E7B9C8B8;
    block[4] = self;
    block[5] = a3;
    block[6] = a4;
    dispatch_async(v11, block);

  }
}

uint64_t __70__DADownloadContext_updateProgressDownloadedByteCount_totalByteCount___block_invoke(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1[4] + 32) + 16))(*(_QWORD *)(a1[4] + 32), *(_QWORD *)(a1[4] + 8), *(_QWORD *)(a1[4] + 16), a1[5], a1[6]);
}

- (void)finishedWithError:(id)a3
{
  id v4;
  NSObject *v5;
  NSString *attachmentUUID;
  NSString *accountID;
  OS_dispatch_queue *queue;
  OS_dispatch_queue *v9;
  NSObject *v10;
  _QWORD v11[5];
  id v12;
  uint8_t buf[4];
  NSString *v14;
  __int16 v15;
  NSString *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  DALoggingwithCategory(0);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    attachmentUUID = self->_attachmentUUID;
    accountID = self->_accountID;
    *(_DWORD *)buf = 138412546;
    v14 = attachmentUUID;
    v15 = 2112;
    v16 = accountID;
    _os_log_impl(&dword_1C1D11000, v5, OS_LOG_TYPE_DEBUG, "Download of attachment UUID %@ for account %@ completed.", buf, 0x16u);
  }

  if (self->_completionBlock)
  {
    queue = self->_queue;
    if (queue)
    {
      v9 = queue;
    }
    else
    {
      dispatch_get_global_queue(0, 0);
      v9 = (OS_dispatch_queue *)objc_claimAutoreleasedReturnValue();
    }
    v10 = v9;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __39__DADownloadContext_finishedWithError___block_invoke;
    v11[3] = &unk_1E7B9C8E0;
    v11[4] = self;
    v12 = v4;
    dispatch_async(v10, v11);

  }
}

uint64_t __39__DADownloadContext_finishedWithError___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) + 16))();
}

- (NSString)attachmentUUID
{
  return self->_attachmentUUID;
}

- (NSString)accountID
{
  return self->_accountID;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (id)progressBlock
{
  return self->_progressBlock;
}

- (id)completionBlock
{
  return self->_completionBlock;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong(&self->_progressBlock, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_accountID, 0);
  objc_storeStrong((id *)&self->_attachmentUUID, 0);
}

- (void)initWithAttachmentUUID:accountID:queue:downloadProgressBlock:completionBlock:.cold.1()
{
  __assert_rtn("-[DADownloadContext initWithAttachmentUUID:accountID:queue:downloadProgressBlock:completionBlock:]", "CDDADConnection.m", 183, "attachmentUUID");
}

- (void)initWithAttachmentUUID:accountID:queue:downloadProgressBlock:completionBlock:.cold.2()
{
  __assert_rtn("-[DADownloadContext initWithAttachmentUUID:accountID:queue:downloadProgressBlock:completionBlock:]", "CDDADConnection.m", 184, "accountID");
}

@end
