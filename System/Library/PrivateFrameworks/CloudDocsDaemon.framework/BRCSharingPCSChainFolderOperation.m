@implementation BRCSharingPCSChainFolderOperation

- (BRCItemID)rootItemID
{
  return -[BRCServerItem itemID](self->_serverItem, "itemID");
}

- (BRCSharingPCSChainFolderOperation)initWithItem:(id)a3 sessionContext:(id)a4 syncUpCallback:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  BRCSharingPCSChainFolderOperation *v16;
  uint64_t v17;
  BRCAppLibrary *appLibrary;
  void *v19;
  void *v20;
  uint64_t v21;
  BRCServerItem *serverItem;
  void *v23;
  objc_super v25;

  v8 = a3;
  v9 = a5;
  v10 = a4;
  objc_msgSend(v8, "itemID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "debugItemIDString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("sharing/prepare-folder-pcs"), "stringByAppendingPathComponent:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "serverZone");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "metadataSyncContext");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v25.receiver = self;
  v25.super_class = (Class)BRCSharingPCSChainFolderOperation;
  v16 = -[_BRCOperation initWithName:syncContext:sessionContext:](&v25, sel_initWithName_syncContext_sessionContext_, v13, v15, v10);

  if (v16)
  {
    -[_BRCOperation setNonDiscretionary:](v16, "setNonDiscretionary:", 1);
    objc_msgSend(v8, "appLibrary");
    v17 = objc_claimAutoreleasedReturnValue();
    appLibrary = v16->_appLibrary;
    v16->_appLibrary = (BRCAppLibrary *)v17;

    objc_msgSend(v8, "clientZone");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "itemID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "serverItemByItemID:", v20);
    v21 = objc_claimAutoreleasedReturnValue();
    serverItem = v16->_serverItem;
    v16->_serverItem = (BRCServerItem *)v21;

    objc_msgSend(MEMORY[0x1E0C94F88], "br_sharingMisc");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[_BRCOperation setGroup:](v16, "setGroup:", v23);

    v16->_chainedRecordsCount = 0;
    objc_storeStrong((id *)&v16->_syncUpCallback, a5);
    -[BRCServerItem overrideCKInfoIfNecessaryForOutOfBandSyncOpWithLocalItem:](v16->_serverItem, "overrideCKInfoIfNecessaryForOutOfBandSyncOpWithLocalItem:", v8);
  }

  return v16;
}

- (id)createActivity
{
  return _os_activity_create(&dword_1CBD43000, "sharing/prepareFolderPCS", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
}

- (void)_performPCSChainBatch
{
  BRCPCSChainingOperation *v3;
  _QWORD v4[5];

  v3 = -[BRCPCSChainingOperation initWithRootItem:appLibrary:sessionContext:syncUpCallback:]([BRCPCSChainingOperation alloc], "initWithRootItem:appLibrary:sessionContext:syncUpCallback:", self->_serverItem, self->_appLibrary, self->super.super._sessionContext, self->_syncUpCallback);
  -[BRCPCSChainingOperation setCanSyncDownBeforeRetry:](v3, "setCanSyncDownBeforeRetry:", 1);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __58__BRCSharingPCSChainFolderOperation__performPCSChainBatch__block_invoke;
  v4[3] = &unk_1E8765CA8;
  v4[4] = self;
  -[BRCPCSChainingOperation setPcsChainCompletionBlock:](v3, "setPcsChainCompletionBlock:", v4);
  -[_BRCOperation addSubOperation:](self, "addSubOperation:", v3);

}

void __58__BRCSharingPCSChainFolderOperation__performPCSChainBatch__block_invoke(uint64_t a1, int a2, void *a3, uint64_t a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  _QWORD *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void *v18;
  id v19;
  uint64_t v20;

  v9 = a3;
  v10 = a5;
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 536) += a4;
  if (v10 || a2)
  {
    v13 = *(_QWORD **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", v13[67]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "completedWithResult:error:", v14, v10);

  }
  else if (v9)
  {
    v15 = MEMORY[0x1E0C809B0];
    v16 = 3221225472;
    v17 = __58__BRCSharingPCSChainFolderOperation__performPCSChainBatch__block_invoke_2;
    v18 = &unk_1E875E948;
    v11 = v9;
    v12 = *(_QWORD *)(a1 + 32);
    v19 = v11;
    v20 = v12;
    objc_msgSend(v11, "addPreFlushDirectoryListCompletionBlock:", &v15);
    objc_msgSend(v11, "beginObservingChangesWithDelegate:", 0, v15, v16, v17, v18);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_performPCSChainBatch");
  }

}

uint64_t __58__BRCSharingPCSChainFolderOperation__performPCSChainBatch__block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  int v5;

  if (!a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "folderToList");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 520), "itemID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v3, "isEqualToItemID:", v4) & 1) == 0)
    {

      goto LABEL_6;
    }
    v5 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 520), "isDirectoryFault");

    if (v5)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 520), "st");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setType:", 0);
LABEL_6:

    }
  }
  return objc_msgSend(*(id *)(a1 + 40), "_performPCSChainBatch");
}

- (void)main
{
  id v3;

  if (self->_serverItem)
  {
    -[BRCSharingPCSChainFolderOperation _performPCSChainBatch](self, "_performPCSChainBatch");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "brc_errorInvalidParameter:value:", CFSTR("serverItem"), 0);
    v3 = (id)objc_claimAutoreleasedReturnValue();
    -[_BRCOperation completedWithResult:error:](self, "completedWithResult:error:", 0, v3);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syncUpCallback, 0);
  objc_storeStrong((id *)&self->_appLibrary, 0);
  objc_storeStrong((id *)&self->_serverItem, 0);
}

@end
