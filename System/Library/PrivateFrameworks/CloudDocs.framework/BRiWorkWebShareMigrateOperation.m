@implementation BRiWorkWebShareMigrateOperation

- (BRiWorkWebShareMigrateOperation)initWithURL:(id)a3
{
  id v4;
  BRiWorkWebShareMigrateOperation *v5;
  id v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)BRiWorkWebShareMigrateOperation;
  v5 = -[BROperation init](&v8, sel_init);
  if (v5)
  {
    v6 = objc_alloc_init(MEMORY[0x1E0CB3828]);
    -[BRiWorkWebShareMigrateOperation setOperationQueue:](v5, "setOperationQueue:", v6);

    -[BRiWorkWebShareMigrateOperation setUrl:](v5, "setUrl:", v4);
  }

  return v5;
}

- (void)_migrateShare
{
  NSURL *url;
  _BOOL4 BadgingSharingState;
  id v5;
  void *v6;
  BOOL v7;
  id v9;
  __int16 v10;

  v10 = 0;
  url = self->_url;
  v9 = 0;
  BadgingSharingState = BRiWorkSharingGetBadgingSharingState(url, (_BYTE *)&v10 + 1, (BOOL *)&v10, &v9);
  v5 = v9;
  v6 = v5;
  if (HIBYTE(v10))
    v7 = !BadgingSharingState;
  else
    v7 = 1;
  if (!v7 && v5 == 0)
    -[BRiWorkWebShareMigrateOperation _startSharingReadWrite:](self, "_startSharingReadWrite:", (_BYTE)v10 == 0);
  -[BROperation completedWithResult:error:](self, "completedWithResult:error:", 0, v6);

}

- (void)_startSharingReadWrite:(BOOL)a3
{
  _BOOL4 v3;
  NSURL *url;
  void *v6;
  BRShareCreateShareOperation *v7;
  BRShareCreateShareOperation *v8;
  BOOL v9;
  uint64_t v10;
  BRShareSaveOperation *v11;
  void *v12;
  BRShareSaveOperation *v13;
  NSObject *v14;
  NSObject *v15;
  _QWORD v16[5];
  BRShareCreateShareOperation *v17;

  v3 = a3;
  url = self->_url;
  v17 = 0;
  BRSharingCreateShareForItemAtURL(url, &v17);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v17;
  v8 = v7;
  if (v6)
    v9 = v7 == 0;
  else
    v9 = 0;
  if (!v9)
    -[BROperation completedWithResult:error:](self, "completedWithResult:error:", 0, v7);
  if (v3)
    v10 = 3;
  else
    v10 = 2;
  objc_msgSend(v6, "setPublicPermission:", v10);
  v11 = [BRShareSaveOperation alloc];
  -[BRiWorkWebShareMigrateOperation url](self, "url");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[BRShareSaveOperation initWithShare:fileURL:](v11, "initWithShare:fileURL:", v6, v12);

  -[BROperation callbackQueue](v13, "callbackQueue");
  v14 = objc_claimAutoreleasedReturnValue();
  -[BROperation callbackQueue](self, "callbackQueue");
  v15 = objc_claimAutoreleasedReturnValue();
  dispatch_set_target_queue(v14, v15);

  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __58__BRiWorkWebShareMigrateOperation__startSharingReadWrite___block_invoke;
  v16[3] = &unk_1E3DA4C20;
  v16[4] = self;
  -[BRShareSaveOperation setShareSaveCompletionBlock:](v13, "setShareSaveCompletionBlock:", v16);
  -[BROperation setNonDiscretionary:](v13, "setNonDiscretionary:", -[BROperation nonDiscretionary](self, "nonDiscretionary"));
  -[NSOperationQueue addOperation:](self->_operationQueue, "addOperation:", v13);

}

uint64_t __58__BRiWorkWebShareMigrateOperation__startSharingReadWrite___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "completedWithResult:error:", a2, a3);
}

- (void)_copyShare
{
  BRShareCopyOperation *v3;
  _QWORD v4[5];

  v3 = -[BRShareCopyOperation initWithURL:]([BRShareCopyOperation alloc], "initWithURL:", self->_url);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __45__BRiWorkWebShareMigrateOperation__copyShare__block_invoke;
  v4[3] = &unk_1E3DA4C48;
  v4[4] = self;
  -[BRShareCopyOperation setRootShareCopyCompletionBlock:](v3, "setRootShareCopyCompletionBlock:", v4);
  -[BROperation setNonDiscretionary:](v3, "setNonDiscretionary:", -[BROperation nonDiscretionary](self, "nonDiscretionary"));
  -[NSOperationQueue addOperation:](self->_operationQueue, "addOperation:", v3);

}

uint64_t __45__BRiWorkWebShareMigrateOperation__copyShare__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "completedWithResult:error:", a2);
}

- (void)main
{
  id v0;
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_7_0();
  objc_msgSend(v0, "url");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "path");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_19CBF0000, v3, v4, "[DEBUG] migrating share for '%@'%@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_0();
}

- (void)finishWithResult:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  objc_super v10;

  v6 = a3;
  v7 = a4;
  -[BRiWorkWebShareMigrateOperation shareMigrationCompletionBlock](self, "shareMigrationCompletionBlock");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v8)
  {
    (*(void (**)(uint64_t, id, id))(v8 + 16))(v8, v6, v7);
    -[BRiWorkWebShareMigrateOperation setShareMigrationCompletionBlock:](self, "setShareMigrationCompletionBlock:", 0);
  }

  v10.receiver = self;
  v10.super_class = (Class)BRiWorkWebShareMigrateOperation;
  -[BROperation finishWithResult:error:](&v10, sel_finishWithResult_error_, v6, v7);

}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
  objc_storeStrong((id *)&self->_url, a3);
}

- (NSOperationQueue)operationQueue
{
  return self->_operationQueue;
}

- (void)setOperationQueue:(id)a3
{
  objc_storeStrong((id *)&self->_operationQueue, a3);
}

- (id)shareMigrationCompletionBlock
{
  return objc_getProperty(self, a2, 312, 1);
}

- (void)setShareMigrationCompletionBlock:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 312);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_shareMigrationCompletionBlock, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

@end
