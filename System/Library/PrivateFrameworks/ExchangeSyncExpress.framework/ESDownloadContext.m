@implementation ESDownloadContext

- (ESDownloadContext)initWithAttachmentUUID:(id)a3 accountID:(id)a4 queue:(id)a5 downloadProgressBlock:(id)a6 completionBlock:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  ESDownloadContext *v19;
  ESDownloadContext *v20;
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
    -[ESDownloadContext initWithAttachmentUUID:accountID:queue:downloadProgressBlock:completionBlock:].cold.1();
  if (!v14)
    -[ESDownloadContext initWithAttachmentUUID:accountID:queue:downloadProgressBlock:completionBlock:].cold.2();
  v18 = v17;
  v26.receiver = self;
  v26.super_class = (Class)ESDownloadContext;
  v19 = -[ESDownloadContext init](&v26, sel_init);
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
  os_log_type_t v8;
  NSString *attachmentUUID;
  NSString *accountID;
  OS_dispatch_queue *queue;
  NSObject *v12;
  NSObject *v13;
  _QWORD block[7];
  uint8_t buf[4];
  NSString *v16;
  __int16 v17;
  NSString *v18;
  __int16 v19;
  int64_t v20;
  __int16 v21;
  int64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  DALoggingwithCategory();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = *(_BYTE *)(MEMORY[0x24BE2AD38] + 7);
  if (os_log_type_enabled(v7, v8))
  {
    attachmentUUID = self->_attachmentUUID;
    accountID = self->_accountID;
    *(_DWORD *)buf = 138413058;
    v16 = attachmentUUID;
    v17 = 2112;
    v18 = accountID;
    v19 = 2048;
    v20 = a3;
    v21 = 2048;
    v22 = a4;
    _os_log_impl(&dword_224A56000, v7, v8, "Download of attachment UUID %@ for accountID %@ progress: %lld bytes of %lld", buf, 0x2Au);
  }

  if (self->_progressBlock)
  {
    queue = self->_queue;
    if (queue)
    {
      v12 = queue;
    }
    else
    {
      dispatch_get_global_queue(0, 0);
      v12 = objc_claimAutoreleasedReturnValue();
    }
    v13 = v12;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __70__ESDownloadContext_updateProgressDownloadedByteCount_totalByteCount___block_invoke;
    block[3] = &unk_24ECAAFC8;
    block[4] = self;
    block[5] = a3;
    block[6] = a4;
    dispatch_async(v12, block);

  }
}

uint64_t __70__ESDownloadContext_updateProgressDownloadedByteCount_totalByteCount___block_invoke(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1[4] + 32) + 16))(*(_QWORD *)(a1[4] + 32), *(_QWORD *)(a1[4] + 8), *(_QWORD *)(a1[4] + 16), a1[5], a1[6]);
}

- (void)finishedWithError:(id)a3
{
  id v4;
  NSObject *v5;
  os_log_type_t v6;
  NSString *attachmentUUID;
  NSString *accountID;
  OS_dispatch_queue *queue;
  OS_dispatch_queue *v10;
  NSObject *v11;
  _QWORD v12[5];
  id v13;
  uint8_t buf[4];
  NSString *v15;
  __int16 v16;
  NSString *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  DALoggingwithCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_BYTE *)(MEMORY[0x24BE2AD38] + 7);
  if (os_log_type_enabled(v5, v6))
  {
    attachmentUUID = self->_attachmentUUID;
    accountID = self->_accountID;
    *(_DWORD *)buf = 138412546;
    v15 = attachmentUUID;
    v16 = 2112;
    v17 = accountID;
    _os_log_impl(&dword_224A56000, v5, v6, "Download of attachment UUID %@ for account %@ completed.", buf, 0x16u);
  }

  if (self->_completionBlock)
  {
    queue = self->_queue;
    if (queue)
    {
      v10 = queue;
    }
    else
    {
      dispatch_get_global_queue(0, 0);
      v10 = (OS_dispatch_queue *)objc_claimAutoreleasedReturnValue();
    }
    v11 = v10;
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __39__ESDownloadContext_finishedWithError___block_invoke;
    v12[3] = &unk_24ECAAFF0;
    v12[4] = self;
    v13 = v4;
    dispatch_async(v11, v12);

  }
}

uint64_t __39__ESDownloadContext_finishedWithError___block_invoke(uint64_t a1)
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
  __assert_rtn("-[ESDownloadContext initWithAttachmentUUID:accountID:queue:downloadProgressBlock:completionBlock:]", "ESDConnection.m", 183, "attachmentUUID");
}

- (void)initWithAttachmentUUID:accountID:queue:downloadProgressBlock:completionBlock:.cold.2()
{
  __assert_rtn("-[ESDownloadContext initWithAttachmentUUID:accountID:queue:downloadProgressBlock:completionBlock:]", "ESDConnection.m", 184, "accountID");
}

@end
