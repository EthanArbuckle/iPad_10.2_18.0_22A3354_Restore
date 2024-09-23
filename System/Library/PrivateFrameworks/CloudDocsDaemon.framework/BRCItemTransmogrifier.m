@implementation BRCItemTransmogrifier

- (BRCItemTransmogrifier)initWithSession:(id)a3
{
  id v5;
  BRCItemTransmogrifier *v6;
  BRCItemTransmogrifier *v7;
  BRCItemTransmogrifier *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)BRCItemTransmogrifier;
  v6 = -[BRCItemTransmogrifier init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_session, a3);
    v8 = v7;
  }

  return v7;
}

- (id)queue
{
  BRCItemTransmogrifier *v2;
  NSOperationQueue *queue;
  uint64_t v4;
  NSOperationQueue *v5;
  NSOperationQueue *v6;

  v2 = self;
  objc_sync_enter(v2);
  queue = v2->_queue;
  if (!queue)
  {
    v4 = objc_opt_new();
    v5 = v2->_queue;
    v2->_queue = (NSOperationQueue *)v4;

    -[NSOperationQueue setName:](v2->_queue, "setName:", CFSTR("com.apple.bird.transmogrifier"));
    -[NSOperationQueue setMaxConcurrentOperationCount:](v2->_queue, "setMaxConcurrentOperationCount:", 1);
    queue = v2->_queue;
  }
  v6 = queue;
  objc_sync_exit(v2);

  return v6;
}

- (BOOL)addOperation:(id)a3 forItem:(id)a4
{
  id v6;
  id v7;
  void *v8;
  BRCItemTransmogrifier *v9;
  NSMutableDictionary *pendingTransmogirifcations;
  void *v11;
  uint64_t v13;
  NSMutableDictionary *v14;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "itemGlobalID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = self;
  objc_sync_enter(v9);
  pendingTransmogirifcations = v9->_pendingTransmogirifcations;
  if (!pendingTransmogirifcations)
  {
    v13 = objc_opt_new();
    v14 = v9->_pendingTransmogirifcations;
    v9->_pendingTransmogirifcations = (NSMutableDictionary *)v13;

    pendingTransmogirifcations = v9->_pendingTransmogirifcations;
  }
  -[NSMutableDictionary objectForKeyedSubscript:](pendingTransmogirifcations, "objectForKeyedSubscript:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
    -[NSMutableDictionary setObject:forKeyedSubscript:](v9->_pendingTransmogirifcations, "setObject:forKeyedSubscript:", v6, v8);
  objc_sync_exit(v9);

  return v11 == 0;
}

- (void)removeOperationsForItemGlobalID:(id)a3
{
  BRCItemTransmogrifier *v4;
  id v5;

  v5 = a3;
  v4 = self;
  objc_sync_enter(v4);
  -[NSMutableDictionary removeObjectForKey:](v4->_pendingTransmogirifcations, "removeObjectForKey:", v5);
  objc_sync_exit(v4);

}

- (void)_finishDirectoryToPackageTransmogrification:(id)a3 relpath:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  id v14;
  void *v15;
  NSObject *v16;
  int v17;
  NSObject *v18;
  __int16 v19;
  id v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "db");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "assertOnQueue");

  objc_msgSend(v5, "serverZone");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "itemID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "db");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "itemByItemID:db:", v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v11, "isDead"))
  {
    brc_bread_crumbs();
    v12 = objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v17 = 138412290;
      v18 = v12;
      _os_log_impl(&dword_1CBD43000, v13, OS_LOG_TYPE_DEFAULT, "[NOTICE] Not finishing transmogrification because item is dead in the server thruth%@", (uint8_t *)&v17, 0xCu);
    }
  }
  else
  {
    objc_msgSend(v5, "itemParentGlobalID");
    v12 = objc_claimAutoreleasedReturnValue();
    v14 = +[BRCLocalItem newItemWithPath:parentGlobalID:](BRCLocalItem, "newItemWithPath:parentGlobalID:", v6, v12);
    objc_msgSend(v14, "asDocument");
    v13 = objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      brc_bread_crumbs();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        v17 = 138412802;
        v18 = v13;
        v19 = 2112;
        v20 = v6;
        v21 = 2112;
        v22 = v15;
        _os_log_debug_impl(&dword_1CBD43000, v16, OS_LOG_TYPE_DEBUG, "[DEBUG] creating new document %@ at %@%@", (uint8_t *)&v17, 0x20u);
      }

      -[NSObject markNeedsReading](v13, "markNeedsReading");
      objc_msgSend(v5, "markLostWhenReplacedByItem:", v13);
      objc_msgSend(v5, "saveToDB");
      -[NSObject saveToDB](v13, "saveToDB");
    }
  }

}

- (void)scheduleDirectoryToPackageTransmogrification:(id)a3 absolutePath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  BRCFileProvidingRequestOperation *v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  BRCAccountSession *v20;
  BRCAccountSession *v21;
  id v22;
  void *v23;
  _QWORD v24[4];
  id v25;
  BRCItemTransmogrifier *v26;
  BRCAccountSession *v27;
  id v28;
  __int128 v29;
  uint64_t v30;
  uint64_t v31;
  __int128 v32;
  uint64_t v33;
  _BYTE buf[24];
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "serverZone");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "itemID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "db");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "itemByItemID:db:", v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v11, "isDead"))
  {
    brc_bread_crumbs();
    v12 = (BRCFileProvidingRequestOperation *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v12;
      _os_log_impl(&dword_1CBD43000, v13, OS_LOG_TYPE_DEFAULT, "[NOTICE] Not scheduling transmogrification because item is dead in the server thruth%@", buf, 0xCu);
    }

  }
  else
  {
    v12 = -[BRCFileProvidingRequestOperation initWithDirectoryItem:]([BRCFileProvidingRequestOperation alloc], "initWithDirectoryItem:", v6);
    -[_BRCOperation setNonDiscretionary:](v12, "setNonDiscretionary:", 0);
    if (-[BRCItemTransmogrifier addOperation:forItem:](self, "addOperation:forItem:", v12, v6))
    {
      v32 = 0uLL;
      v33 = 0;
      __brc_create_section(0, (uint64_t)"-[BRCItemTransmogrifier scheduleDirectoryToPackageTransmogrification:absolutePath:]", 120, &v32);
      brc_bread_crumbs();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134218498;
        *(_QWORD *)&buf[4] = v32;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v6;
        *(_WORD *)&buf[22] = 2112;
        v35 = v14;
        _os_log_debug_impl(&dword_1CBD43000, v15, OS_LOG_TYPE_DEBUG, "[DEBUG] ┣%llx Start downloading nested items prior to transmogrificaiton of %@%@", buf, 0x20u);
      }

      *(_OWORD *)buf = v32;
      *(_QWORD *)&buf[16] = v33;
      objc_msgSend(v6, "itemGlobalID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "st");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "fileID");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "longLongValue");

      v20 = self->_session;
      v24[0] = MEMORY[0x1E0C809B0];
      v24[1] = 3221225472;
      v24[2] = __83__BRCItemTransmogrifier_scheduleDirectoryToPackageTransmogrification_absolutePath___block_invoke;
      v24[3] = &unk_1E8763408;
      v29 = *(_OWORD *)buf;
      v30 = *(_QWORD *)&buf[16];
      v25 = v16;
      v26 = self;
      v27 = v20;
      v28 = v7;
      v31 = v19;
      v21 = v20;
      v22 = v16;
      -[BRCFileProvidingRequestOperation addCompletionCallback:](v12, "addCompletionCallback:", v24);
      -[BRCAccountSession addMiscOperation:](self->_session, "addMiscOperation:", v12);
      -[BRCItemTransmogrifier queue](self, "queue");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "addOperation:", v12);

      v6 = 0;
    }
  }

}

BOOL __83__BRCItemTransmogrifier_scheduleDirectoryToPackageTransmogrification_absolutePath___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  _QWORD *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  _QWORD *v19;
  uint64_t v21;
  uint64_t v22;
  const char *label;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  __int128 v30;
  uint64_t v31;
  __int128 v32;
  uint64_t v33;
  _BYTE block[24];
  void *v35;
  NSObject *v36;
  id v37;
  __int128 v38;
  uint64_t v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v30 = *(_OWORD *)(a1 + 64);
  v31 = *(_QWORD *)(a1 + 80);
  brc_bread_crumbs();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    __83__BRCItemTransmogrifier_scheduleDirectoryToPackageTransmogrification_absolutePath___block_invoke_cold_1();

  if (v3)
  {
    brc_bread_crumbs();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      v21 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)block = 138412802;
      *(_QWORD *)&block[4] = v21;
      *(_WORD *)&block[12] = 2112;
      *(_QWORD *)&block[14] = v3;
      *(_WORD *)&block[22] = 2112;
      v35 = v6;
      _os_log_fault_impl(&dword_1CBD43000, v7, OS_LOG_TYPE_FAULT, "[CRIT] Failed to download items required for transmogrification of %@: error: %@%@", block, 0x20u);
    }

    objc_msgSend(*(id *)(a1 + 40), "removeOperationsForItemGlobalID:", *(_QWORD *)(a1 + 32));
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 48), "clientTruthWorkloop");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = MEMORY[0x1E0C809B0];
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __83__BRCItemTransmogrifier_scheduleDirectoryToPackageTransmogrification_absolutePath___block_invoke_4;
    v24[3] = &unk_1E87633E0;
    v25 = *(id *)(a1 + 32);
    v26 = *(id *)(a1 + 56);
    v10 = *(id *)(a1 + 48);
    v11 = *(_QWORD *)(a1 + 88);
    v12 = *(_QWORD *)(a1 + 40);
    v27 = v10;
    v28 = v12;
    v29 = v11;
    v13 = v8;
    v14 = v24;
    v15 = (void *)MEMORY[0x1D17A6BE8]();
    v32 = 0uLL;
    v33 = 0;
    __brc_create_section(0, (uint64_t)"dispatch_async_with_logs", 262, &v32);
    brc_bread_crumbs();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      v22 = v32;
      label = dispatch_queue_get_label(v13);
      *(_DWORD *)block = 134218498;
      *(_QWORD *)&block[4] = v22;
      *(_WORD *)&block[12] = 2080;
      *(_QWORD *)&block[14] = label;
      *(_WORD *)&block[22] = 2112;
      v35 = v16;
      _os_log_debug_impl(&dword_1CBD43000, v17, OS_LOG_TYPE_DEBUG, "[DEBUG] ┣%llx dispatching to %s%@", block, 0x20u);
    }

    v38 = v32;
    v39 = v33;
    *(_QWORD *)block = v9;
    *(_QWORD *)&block[8] = 3221225472;
    *(_QWORD *)&block[16] = __dispatch_async_with_logs_block_invoke_14;
    v35 = &unk_1E875D578;
    v18 = v13;
    v36 = v18;
    v19 = v14;
    v37 = v19;
    dispatch_async(v18, block);

    objc_autoreleasePoolPop(v15);
  }
  __brc_leave_section((uint64_t *)&v30);

  return v3 == 0;
}

void __83__BRCItemTransmogrifier_scheduleDirectoryToPackageTransmogrification_absolutePath___block_invoke_4(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  BRCRelativePath *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  BRCRelativePath *v10;
  int v11;
  uint8_t buf[4];
  BRCRelativePath *v13;
  __int16 v14;
  _BYTE v15[18];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  brc_bread_crumbs();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    __83__BRCItemTransmogrifier_scheduleDirectoryToPackageTransmogrification_absolutePath___block_invoke_4_cold_1();

  v4 = -[BRCRelativePath initWithAbsolutePath:session:]([BRCRelativePath alloc], "initWithAbsolutePath:session:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v11 = 0;
  if (-[BRCRelativePath resolveAndKeepOpenMustExist:error:](v4, "resolveAndKeepOpenMustExist:error:", 1, &v11))
  {
    if (-[BRCRelativePath isDocument](v4, "isDocument")
      && -[BRCRelativePath fileID](v4, "fileID") == *(_QWORD *)(a1 + 64))
    {
      objc_msgSend(*(id *)(a1 + 48), "itemByItemGlobalID:", *(_QWORD *)(a1 + 32));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "asDirectory");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(*(id *)(a1 + 56), "_finishDirectoryToPackageTransmogrification:relpath:", v6, v4);
    }
    else
    {
      brc_bread_crumbs();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v10 = *(BRCRelativePath **)(a1 + 32);
        *(_DWORD *)buf = 138412802;
        v13 = v10;
        v14 = 2112;
        *(_QWORD *)v15 = v4;
        *(_WORD *)&v15[8] = 2112;
        *(_QWORD *)&v15[10] = v6;
        _os_log_impl(&dword_1CBD43000, v9, OS_LOG_TYPE_DEFAULT, "[WARNING] Item %@ changed at relpath %@, abandoning transmogirifcation%@", buf, 0x20u);
      }

    }
    -[BRCRelativePath close](v4, "close");
  }
  else
  {
    brc_bread_crumbs();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      v13 = v4;
      v14 = 1024;
      *(_DWORD *)v15 = v11;
      *(_WORD *)&v15[4] = 2112;
      *(_QWORD *)&v15[6] = v7;
      _os_log_impl(&dword_1CBD43000, v8, OS_LOG_TYPE_DEFAULT, "[WARNING] Abandonding transmogrification since %@ can not be resolved, error %d%@", buf, 0x1Cu);
    }

  }
  objc_msgSend(*(id *)(a1 + 56), "removeOperationsForItemGlobalID:", *(_QWORD *)(a1 + 32));

}

- (double)_renameDelayForZone:(id)a3
{
  void *v3;
  double v4;

  objc_msgSend(a3, "zoneName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "hasPrefix:", CFSTR("brtest")))
    v4 = 45.0;
  else
    v4 = 600.0;

  return v4;
}

- (double)_renameItem:(id)a3
{
  BRCRelativePath *v4;
  BRCRelativePath *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  BRCRelativePath *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  char v23;
  void *v24;
  NSObject *v25;
  uint64_t v26;
  BRCRelativePath *v27;
  BRCRelativePath *v28;
  void *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  BRCRelativePath *v33;
  NSObject *v34;
  void *v36;
  void *v37;
  void *v38;
  BRCRelativePath *v39;
  void *v40;
  void *v41;
  char *v42;
  _QWORD v43[4];
  BRCRelativePath *v44;
  int v45;
  _QWORD v46[4];
  BRCRelativePath *v47;
  BRCRelativePath *v48;
  int __errnum;
  uint8_t buf[4];
  BRCRelativePath *v51;
  __int16 v52;
  _BYTE v53[18];
  __int16 v54;
  void *v55;
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v4 = (BRCRelativePath *)a3;
  __errnum = 0;
  v5 = [BRCRelativePath alloc];
  -[BRCRelativePath fileID](v4, "fileID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "longLongValue");
  -[BRCRelativePath session](v4, "session");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[BRCRelativePath initWithFileID:session:](v5, "initWithFileID:session:", v7, v8);

  if (!-[BRCRelativePath resolveAndKeepOpenMustExist:error:](v9, "resolveAndKeepOpenMustExist:error:", 1, &__errnum))
  {
    brc_bread_crumbs();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      v51 = v9;
      v52 = 1024;
      *(_DWORD *)v53 = __errnum;
      *(_WORD *)&v53[4] = 2112;
      *(_QWORD *)&v53[6] = v18;
      _os_log_impl(&dword_1CBD43000, v19, OS_LOG_TYPE_DEFAULT, "[WARNING] Can't resovle %@, error %d%@", buf, 0x1Cu);
    }

    goto LABEL_20;
  }
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", (double)-[BRCRelativePath modificationTime](v9, "modificationTime"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "timeIntervalSinceNow");
  v12 = v11;
  v13 = -v11;

  -[BRCRelativePath clientZone](v4, "clientZone");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCItemTransmogrifier _renameDelayForZone:](self, "_renameDelayForZone:", v14);
  v16 = v15;

  if (v16 <= v13)
  {
    -[BRCRelativePath filename](v9, "filename");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCRelativePath st](v4, "st");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "representableName");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v20, "isEqual:", v22);

    if ((v23 & 1) != 0)
    {
      brc_bread_crumbs();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
      {
        -[BRCRelativePath filename](v9, "filename");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        -[BRCRelativePath st](v4, "st");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "logicalNameWithoutLocalBounce");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138413058;
        v51 = v4;
        v52 = 2112;
        *(_QWORD *)v53 = v36;
        *(_WORD *)&v53[8] = 2112;
        *(_QWORD *)&v53[10] = v38;
        v54 = 2112;
        v55 = v24;
        _os_log_debug_impl(&dword_1CBD43000, v25, OS_LOG_TYPE_DEBUG, "[DEBUG] renaming item for transmogrify %@ (%@ -> %@)%@", buf, 0x2Au);

      }
      v26 = MEMORY[0x1E0C809B0];
      v46[0] = MEMORY[0x1E0C809B0];
      v46[1] = 3221225472;
      v46[2] = __37__BRCItemTransmogrifier__renameItem___block_invoke;
      v46[3] = &unk_1E875DEB8;
      v27 = v9;
      v47 = v27;
      v28 = v4;
      v48 = v28;
      if (-[BRCRelativePath performOnOpenParentFileDescriptor:error:](v27, "performOnOpenParentFileDescriptor:error:", v46, &__errnum))
      {
        -[BRCRelativePath db](v28, "db");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v43[0] = v26;
        v43[1] = 3221225472;
        v43[2] = __37__BRCItemTransmogrifier__renameItem___block_invoke_12;
        v43[3] = &unk_1E8763430;
        v44 = v28;
        v45 = __errnum;
        objc_msgSend(v29, "groupInBatch:", v43);

        v30 = v44;
      }
      else
      {
        brc_bread_crumbs();
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v34 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v34, (os_log_type_t)0x90u))
        {
          -[BRCRelativePath filename](v27, "filename");
          v39 = (BRCRelativePath *)objc_claimAutoreleasedReturnValue();
          -[BRCRelativePath st](v28, "st");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "logicalNameWithoutLocalBounce");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          v42 = strerror(__errnum);
          *(_DWORD *)buf = 138413058;
          v51 = v39;
          v52 = 2112;
          *(_QWORD *)v53 = v41;
          *(_WORD *)&v53[8] = 2080;
          *(_QWORD *)&v53[10] = v42;
          v54 = 2112;
          v55 = v30;
          _os_log_error_impl(&dword_1CBD43000, v34, (os_log_type_t)0x90u, "[ERROR] failed renaming for transmogrify from %@ to %@ (%s)%@", buf, 0x2Au);

        }
      }

      v33 = v27;
    }
    else
    {
      brc_bread_crumbs();
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v51 = v4;
        v52 = 2112;
        *(_QWORD *)v53 = v31;
        _os_log_impl(&dword_1CBD43000, v32, OS_LOG_TYPE_DEFAULT, "[WARNING] Item %@ have changed, abandoning rename%@", buf, 0x16u);
      }

      v33 = v9;
    }
    -[BRCRelativePath close](v33, "close");
LABEL_20:
    v17 = 0.0;
    goto LABEL_21;
  }
  -[BRCRelativePath close](v9, "close");
  v17 = v12 + v16;
LABEL_21:

  return v17;
}

uint64_t __37__BRCItemTransmogrifier__renameItem___block_invoke(uint64_t a1, int a2)
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  objc_msgSend(*(id *)(a1 + 32), "filename");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "st");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "logicalNameWithoutLocalBounce");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = BRCRenameAt(a2, v4, a2, v6, 0);

  return v7;
}

void __37__BRCItemTransmogrifier__renameItem___block_invoke_12(uint64_t a1)
{
  BRCRelativePath *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  BRCRelativePath *v6;
  void *v7;
  NSObject *v8;
  int v9;

  v2 = [BRCRelativePath alloc];
  objc_msgSend(*(id *)(a1 + 32), "fileID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "longLongValue");
  objc_msgSend(*(id *)(a1 + 32), "session");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[BRCRelativePath initWithFileID:session:](v2, "initWithFileID:session:", v4, v5);

  v9 = 0;
  if (-[BRCRelativePath resolveAndKeepOpenMustExist:error:](v6, "resolveAndKeepOpenMustExist:error:", 1, &v9))
  {
    objc_msgSend(*(id *)(a1 + 32), "session");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "fsReader");
    v8 = objc_claimAutoreleasedReturnValue();
    -[NSObject fseventAtPath:flags:](v8, "fseventAtPath:flags:", v6, 0);
  }
  else
  {
    brc_bread_crumbs();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, (os_log_type_t)0x90u))
      __37__BRCItemTransmogrifier__renameItem___block_invoke_12_cold_1(a1, (uint64_t)v7, v8);
  }

  -[BRCRelativePath close](v6, "close");
}

- (void)_renameItems
{
  uint64_t v3;
  __int128 v4;
  void *v5;
  BRCAccountSession *session;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  NSMutableArray *pendingRenames;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  double v18;
  void *v19;
  void *v20;
  __int128 v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  -[NSMutableArray firstObject](self->_pendingRenames, "firstObject");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v5 = (void *)v3;
    *(_QWORD *)&v4 = 138412546;
    v21 = v4;
    do
    {
      -[NSMutableArray removeObject:](self->_pendingRenames, "removeObject:", v5, v21);
      session = self->_session;
      objc_msgSend(v5, "zoneRowID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[BRCAccountSession serverZoneByRowID:](session, "serverZoneByRowID:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "clientZone");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v5, "itemID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "itemByItemID:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "asDirectory");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
      {
        -[BRCItemTransmogrifier _renameItem:](self, "_renameItem:", v12);
        pendingRenames = self->_pendingRenames;
        if (v13 > 0.0)
        {
          v18 = v13;
          -[NSMutableArray addObject:](pendingRenames, "addObject:", v5);
          objc_msgSend(v12, "db");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "serialQueue");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          -[BRCItemTransmogrifier _scheduleRenameAfter:onQueue:](self, "_scheduleRenameAfter:onQueue:", v20, v18);

          return;
        }
      }
      else
      {
        brc_bread_crumbs();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, (os_log_type_t)0x90u))
        {
          *(_DWORD *)buf = v21;
          v23 = v5;
          v24 = 2112;
          v25 = v15;
          _os_log_error_impl(&dword_1CBD43000, v16, (os_log_type_t)0x90u, "[ERROR] Can't find %@ in client truth%@", buf, 0x16u);
        }

        pendingRenames = self->_pendingRenames;
      }
      -[NSMutableArray firstObject](pendingRenames, "firstObject");
      v17 = objc_claimAutoreleasedReturnValue();

      v5 = (void *)v17;
    }
    while (v17);
  }
}

- (void)_scheduleRenameAfter:(double)a3 onQueue:(id)a4
{
  NSObject *v6;
  OS_dispatch_source *v7;
  OS_dispatch_source *pendingRenamesTimer;
  NSObject *v9;
  dispatch_time_t v10;
  OS_dispatch_source *v11;
  OS_dispatch_source *v12;
  _QWORD *v13;
  NSObject *v14;
  _QWORD *v15;
  void *v16;
  void *v17;
  dispatch_block_t v18;
  _QWORD v19[4];
  id v20;
  id location;

  v6 = a4;
  if (!self->_pendingRenamesTimer)
  {
    v7 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, v6);
    pendingRenamesTimer = self->_pendingRenamesTimer;
    self->_pendingRenamesTimer = v7;

    v9 = self->_pendingRenamesTimer;
    v10 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
    dispatch_source_set_timer(v9, v10, 0xFFFFFFFFFFFFFFFFLL, 0);
    objc_initWeak(&location, self);
    v11 = self->_pendingRenamesTimer;
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __54__BRCItemTransmogrifier__scheduleRenameAfter_onQueue___block_invoke;
    v19[3] = &unk_1E875DC98;
    objc_copyWeak(&v20, &location);
    v12 = v11;
    v13 = v19;
    v14 = v12;
    v15 = v13;
    v16 = v15;
    v17 = v15;
    if (*MEMORY[0x1E0D11070])
    {
      ((void (*)(_QWORD *))*MEMORY[0x1E0D11070])(v15);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

    }
    v18 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_UTILITY, 0, v17);
    dispatch_source_set_event_handler(v14, v18);

    dispatch_resume((dispatch_object_t)self->_pendingRenamesTimer);
    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
  }

}

void __54__BRCItemTransmogrifier__scheduleRenameAfter_onQueue___block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  void *v2;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = (void *)WeakRetained[2];
    WeakRetained[2] = 0;
    v3 = WeakRetained;

    objc_msgSend(v3, "_renameItems");
    WeakRetained = v3;
  }

}

- (void)scheduleBouncedDirectoryRename:(id)a3
{
  id v4;
  NSMutableArray *v5;
  NSMutableArray *pendingRenames;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  id v13;

  v4 = a3;
  v13 = v4;
  if (!self->_pendingRenames)
  {
    v5 = (NSMutableArray *)objc_opt_new();
    pendingRenames = self->_pendingRenames;
    self->_pendingRenames = v5;

    v4 = v13;
  }
  objc_msgSend(v4, "itemGlobalID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((-[NSMutableArray containsObject:](self->_pendingRenames, "containsObject:", v7) & 1) == 0)
  {
    -[NSMutableArray addObject:](self->_pendingRenames, "addObject:", v7);
    objc_msgSend(v13, "clientZone");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCItemTransmogrifier _renameDelayForZone:](self, "_renameDelayForZone:", v8);
    v10 = v9;
    objc_msgSend(v13, "db");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "serialQueue");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCItemTransmogrifier _scheduleRenameAfter:onQueue:](self, "_scheduleRenameAfter:onQueue:", v12, v10);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingTransmogirifcations, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_pendingRenames, 0);
  objc_storeStrong((id *)&self->_pendingRenamesTimer, 0);
  objc_storeStrong((id *)&self->_session, 0);
}

void __83__BRCItemTransmogrifier_scheduleDirectoryToPackageTransmogrification_absolutePath___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] ┳%llx Nested download finished%@");
}

void __83__BRCItemTransmogrifier_scheduleDirectoryToPackageTransmogrification_absolutePath___block_invoke_4_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] Finished downloading nested items needed for transmogrification of %@%@");
}

void __37__BRCItemTransmogrifier__renameItem___block_invoke_12_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  char *v5;
  int v6;
  char *v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = strerror(*(_DWORD *)(a1 + 40));
  v6 = 136315394;
  v7 = v5;
  v8 = 2112;
  v9 = a2;
  _os_log_error_impl(&dword_1CBD43000, a3, (os_log_type_t)0x90u, "[ERROR] failed opening after rename for transmogrify (%s)%@", (uint8_t *)&v6, 0x16u);
}

@end
