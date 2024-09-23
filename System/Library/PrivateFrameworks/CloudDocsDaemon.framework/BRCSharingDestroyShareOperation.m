@implementation BRCSharingDestroyShareOperation

- (id)shareID
{
  return (id)-[CKShare recordID](self->super._share, "recordID");
}

- (BRCSharingDestroyShareOperation)initWithShare:(id)a3 zone:(id)a4 sessionContext:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  BRCSharingDestroyShareOperation *v14;
  void *v15;
  objc_super v17;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  objc_msgSend(v10, "recordID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "recordName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("sharing/destroy-share"), "stringByAppendingPathComponent:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v17.receiver = self;
  v17.super_class = (Class)BRCSharingDestroyShareOperation;
  v14 = -[BRCSharingModifyShareOperation initWithName:zone:share:sessionContext:](&v17, sel_initWithName_zone_share_sessionContext_, v13, v9, v10, v8);

  objc_msgSend(MEMORY[0x1E0C94F88], "br_sharingMisc");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[_BRCOperation setGroup:](v14, "setGroup:", v15);

  return v14;
}

- (id)createActivity
{
  return _os_activity_create(&dword_1CBD43000, "sharing/destroy-share", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
}

- (void)main
{
  void *v3;
  void *v4;
  NSObject *v5;
  _QWORD block[5];

  -[BRCServerZone session](self->super._serverZone, "session");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "clientDB");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "serialQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__BRCSharingDestroyShareOperation_main__block_invoke;
  block[3] = &unk_1E875D500;
  block[4] = self;
  dispatch_async(v5, block);

}

void __39__BRCSharingDestroyShareOperation_main__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t, void *, void *, void *);
  void *v24;
  uint64_t v25;
  id v26;
  id location;
  void *v28;
  _QWORD v29[2];

  v29[1] = *MEMORY[0x1E0C80C00];
  v2 = a1 + 32;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 528), "recordID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "brc_shareItemID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(*(_QWORD *)v2 + 520), "clientZone");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "itemByItemID:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(*(id *)(*(_QWORD *)v2 + 520), "isPrivateZone") & 1) != 0)
  {
    if (objc_msgSend(v6, "isDocument"))
    {
      objc_msgSend(v6, "asDocument");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "baseRecord");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v6, "asDocument");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "currentVersion");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "ckInfo");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "serializeSystemFields:", v11);

    }
    else
    {
      objc_msgSend(v6, "asDirectory");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "folderRootStructureRecord");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v6, "st");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "ckInfo");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "serializeSystemFields:", v10);
    }

    v12 = objc_alloc(MEMORY[0x1E0C94F10]);
    if (v8)
    {
      v29[0] = v8;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 0;
      goto LABEL_9;
    }
  }
  else
  {
    v12 = objc_alloc(MEMORY[0x1E0C94F10]);
    v8 = 0;
  }
  v14 = 0;
  v15 = 1;
LABEL_9:
  objc_msgSend(*(id *)(a1 + 32), "shareID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v28, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v12, "initWithRecordsToSave:recordIDsToDelete:", v14, v17);

  if ((v15 & 1) == 0)
  objc_initWeak(&location, v18);
  objc_msgSend(v18, "setAtomic:", 1);
  objc_msgSend(v18, "setSavePolicy:", 0);
  v21 = MEMORY[0x1E0C809B0];
  v22 = 3221225472;
  v23 = __39__BRCSharingDestroyShareOperation_main__block_invoke_2;
  v24 = &unk_1E8765BB8;
  objc_copyWeak(&v26, &location);
  v25 = *(_QWORD *)(a1 + 32);
  objc_msgSend(v18, "setModifyRecordsCompletionBlock:", &v21);
  objc_msgSend(v18, "callbackQueue", v21, v22, v23, v24);
  v19 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "callbackQueue");
  v20 = objc_claimAutoreleasedReturnValue();
  dispatch_set_target_queue(v19, v20);

  objc_msgSend(*(id *)(a1 + 32), "addSubOperation:", v18);
  objc_destroyWeak(&v26);
  objc_destroyWeak(&location);

}

void __39__BRCSharingDestroyShareOperation_main__block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id WeakRetained;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  __int16 v27;
  id v28;
  __int16 v29;
  id v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a4;
  v9 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v11 = objc_msgSend(v9, "count");

  if (!v8 && !v11)
  {
    brc_bread_crumbs();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      __39__BRCSharingDestroyShareOperation_main__block_invoke_2_cold_1();

    objc_msgSend(MEMORY[0x1E0CB35C8], "br_errorWithDomain:code:description:", *MEMORY[0x1E0D10C90], 15, CFSTR("unreachable: got an unexpected number of shares deleted"));
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (v8)
  {
    brc_bread_crumbs();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, (os_log_type_t)0x90u))
    {
      objc_msgSend(*(id *)(a1 + 32), "shareID");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 138413058;
      v26 = v23;
      v27 = 2112;
      v28 = v8;
      v29 = 2112;
      v30 = WeakRetained;
      v31 = 2112;
      v32 = v14;
      _os_log_error_impl(&dword_1CBD43000, v15, (os_log_type_t)0x90u, "[ERROR] failed to destroy share %@: %@ in %@%@", (uint8_t *)&v25, 0x2Au);

    }
    v16 = *(void **)(a1 + 32);
    objc_msgSend(v16, "shareID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "brc_cloudKitErrorForRecordID:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "completedWithResult:error:", 0, v18);

  }
  else
  {
    brc_bread_crumbs();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(*(id *)(a1 + 32), "shareID");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 138412802;
      v26 = v24;
      v27 = 2112;
      v28 = WeakRetained;
      v29 = 2112;
      v30 = v19;
      _os_log_debug_impl(&dword_1CBD43000, v20, OS_LOG_TYPE_DEBUG, "[DEBUG] destroyed share %@ in %@%@", (uint8_t *)&v25, 0x20u);

    }
    v21 = *(_QWORD *)(a1 + 32);
    v22 = *(void **)(v21 + 528);
    *(_QWORD *)(v21 + 528) = 0;

    objc_msgSend(*(id *)(a1 + 32), "_updateDBAndSyncDownIfNeededWithShare:recordsToLearnCKInfo:", 0, v7);
    objc_msgSend(*(id *)(a1 + 32), "completedWithResult:error:", MEMORY[0x1E0C9AAB0], 0);
  }

}

void __39__BRCSharingDestroyShareOperation_main__block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] UNREACHABLE: got an unexpected number of shares deleted%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

@end
