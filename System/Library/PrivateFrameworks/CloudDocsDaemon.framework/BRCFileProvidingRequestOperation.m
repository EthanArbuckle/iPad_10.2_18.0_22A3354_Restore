@implementation BRCFileProvidingRequestOperation

- (BOOL)isRecursive
{
  return self->_isRecursive;
}

- (void)setIsRecursive:(BOOL)a3
{
  self->_isRecursive = a3;
}

- (BOOL)wantsCurrentVersion
{
  return self->_wantsCurrentVersion;
}

- (void)setWantsCurrentVersion:(BOOL)a3
{
  self->_wantsCurrentVersion = a3;
}

- (BRCFileProvidingRequestOperation)initWithURL:(id)a3 readingOptions:(unint64_t)a4 client:(id)a5 session:(id)a6
{
  id v11;
  id v12;
  BRCFileProvidingRequestOperation *v13;
  BRCFileProvidingRequestOperation *v14;
  uint64_t v15;
  NSMutableSet *trackerFileObjects;
  NSMutableSet *v17;
  NSMutableSet *appLibrariesMonitored;

  v11 = a3;
  v12 = a5;
  v13 = -[BRCFileProvidingRequestOperation initWithName:session:readingOptions:](self, "initWithName:session:readingOptions:", CFSTR("coordinated-read"), a6, a4);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_url, a3);
    objc_storeStrong((id *)&v14->_client, a5);
    v15 = objc_opt_new();
    trackerFileObjects = v14->_trackerFileObjects;
    v14->_trackerFileObjects = (NSMutableSet *)v15;

    v17 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    appLibrariesMonitored = v14->_appLibrariesMonitored;
    v14->_appLibrariesMonitored = v17;

    -[_BRCFrameworkOperation setIgnoreMissingRemoteClientProxy:](v14, "setIgnoreMissingRemoteClientProxy:", 1);
  }

  return v14;
}

- (BRCFileProvidingRequestOperation)initWithDirectoryItem:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  BRCFileProvidingRequestOperation *v8;
  uint64_t v9;
  NSMutableSet *trackerFileObjects;

  v5 = a3;
  objc_msgSend(v5, "appLibrary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "session");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[BRCFileProvidingRequestOperation initWithName:session:readingOptions:](self, "initWithName:session:readingOptions:", CFSTR("recursive-download"), v7, 0);

  if (v8)
  {
    objc_storeStrong((id *)&v8->_directoryItem, a3);
    v9 = objc_opt_new();
    trackerFileObjects = v8->_trackerFileObjects;
    v8->_trackerFileObjects = (NSMutableSet *)v9;

    -[_BRCFrameworkOperation setIgnoreMissingRemoteClientProxy:](v8, "setIgnoreMissingRemoteClientProxy:", 1);
  }

  return v8;
}

- (void)_provideDirectoryContents:(id)a3 appLibrary:(id)a4
{
  id v6;
  id v7;
  BRCFileProvidingRequestOperation *v8;
  BRCTreeEnumerator *v9;
  BRCTreeEnumerator *treeEnumerator;
  uint64_t v11;
  BRCTreeEnumerator *v12;
  _BOOL8 isRecursive;
  _QWORD v14[5];
  _QWORD v15[4];
  id v16;
  id location;

  v6 = a3;
  v7 = a4;
  v8 = self;
  objc_sync_enter(v8);
  if (-[_BRCOperation finishIfCancelled](v8, "finishIfCancelled"))
  {
    objc_sync_exit(v8);

  }
  else
  {
    v9 = -[BRCTreeEnumerator initWithSession:]([BRCTreeEnumerator alloc], "initWithSession:", v8->_session);
    treeEnumerator = v8->_treeEnumerator;
    v8->_treeEnumerator = v9;

    v8->_isStillEnumeratingDirectory = 1;
    objc_sync_exit(v8);

    objc_initWeak(&location, v8);
    v11 = MEMORY[0x1E0C809B0];
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __90__BRCFileProvidingRequestOperation_LegacyAdditions___provideDirectoryContents_appLibrary___block_invoke;
    v15[3] = &unk_1E875D738;
    objc_copyWeak(&v16, &location);
    -[BRCTreeEnumerator setCompletionHandler:](v8->_treeEnumerator, "setCompletionHandler:", v15);
    v12 = v8->_treeEnumerator;
    isRecursive = v8->_isRecursive;
    v14[0] = v11;
    v14[1] = 3221225472;
    v14[2] = __90__BRCFileProvidingRequestOperation_LegacyAdditions___provideDirectoryContents_appLibrary___block_invoke_2;
    v14[3] = &unk_1E875E920;
    v14[4] = v8;
    -[BRCTreeEnumerator enumerateBelow:appLibrary:recursively:handler:](v12, "enumerateBelow:appLibrary:recursively:handler:", v6, v7, isRecursive, v14);
    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }

}

void __90__BRCFileProvidingRequestOperation_LegacyAdditions___provideDirectoryContents_appLibrary___block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  _BYTE *obj;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  obj = objc_loadWeakRetained(v2);
  objc_sync_enter(obj);
  obj[552] = 0;
  objc_sync_exit(obj);

  objc_msgSend(obj, "_finishAfterWaitingForDocumentsWithID:withEtagIfLoser:error:", 0, 0, v3);
}

id __90__BRCFileProvidingRequestOperation_LegacyAdditions___provideDirectoryContents_appLibrary___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;

  v3 = a2;
  if (objc_msgSend(v3, "isReserved"))
  {
    brc_bread_crumbs();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      __90__BRCFileProvidingRequestOperation_LegacyAdditions___provideDirectoryContents_appLibrary___block_invoke_2_cold_1();

    v6 = (void *)MEMORY[0x1E0CB35C8];
    objc_msgSend(v3, "itemID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "itemIDString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "brc_errorNotOnDisk:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_11;
  }
  if (!objc_msgSend(v3, "isDocument"))
  {
LABEL_10:
    v9 = 0;
    goto LABEL_11;
  }
  objc_msgSend(v3, "asDocument");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "st");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "documentID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(*(id *)(a1 + 32), "_provideDocument:", v10);
LABEL_9:

    goto LABEL_10;
  }
  if ((objc_msgSend(v10, "isDead") & 1) != 0)
    goto LABEL_9;
  brc_bread_crumbs();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
    __90__BRCFileProvidingRequestOperation_LegacyAdditions___provideDirectoryContents_appLibrary___block_invoke_2_cold_2();

  v16 = (void *)MEMORY[0x1E0CB35C8];
  objc_msgSend(v10, "itemID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "itemIDString");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "brc_errorNotOnDisk:", v18);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_11:
  return v9;
}

- (void)_provideDirectoryRecursively:(id)a3
{
  id v4;
  BRCFileProvidingRequestOperation *v5;
  void *v6;
  void *v7;
  void *v8;
  id WeakRetained;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id location;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  objc_msgSend(v4, "clientZone");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "itemID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fetchRecursiveDirectoryContentsIfNecessary:isUserWaiting:rescheduleApply:", v7, -[_BRCOperation nonDiscretionary](v5, "nonDiscretionary"), 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v8, "beginObservingChanges");
    objc_initWeak(&location, v5);
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __82__BRCFileProvidingRequestOperation_LegacyAdditions___provideDirectoryRecursively___block_invoke;
    v14[3] = &unk_1E875E970;
    objc_copyWeak(&v16, &location);
    v15 = v4;
    objc_msgSend(v8, "addRecursiveDirectoryListCompletionBlock:", v14);
    WeakRetained = objc_loadWeakRetained((id *)&v5->_recursiveList);

    if (WeakRetained)
    {
      brc_bread_crumbs();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
        -[BRCFileProvidingRequestOperation(LegacyAdditions) _provideDirectoryRecursively:].cold.1();

    }
    objc_storeWeak((id *)&v5->_recursiveList, v8);

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
  else
  {
    objc_msgSend(v4, "itemID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appLibrary");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCFileProvidingRequestOperation _provideDirectoryContents:appLibrary:](v5, "_provideDirectoryContents:appLibrary:", v10, v11);

  }
  objc_sync_exit(v5);

}

void __82__BRCFileProvidingRequestOperation_LegacyAdditions___provideDirectoryRecursively___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id *WeakRetained;
  id *v5;
  void *v6;
  _QWORD v7[5];
  id v8;

  v3 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    objc_storeWeak(WeakRetained + 71, 0);
    if (v3)
    {
      objc_msgSend(v5, "completedWithResult:error:", 0, v3);
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "appLibrary");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __82__BRCFileProvidingRequestOperation_LegacyAdditions___provideDirectoryRecursively___block_invoke_2;
      v7[3] = &unk_1E875E948;
      v7[4] = v5;
      v8 = *(id *)(a1 + 32);
      objc_msgSend(v6, "notifyClient:whenFaultingIsDone:", CFSTR("recursive-provide"), v7);

    }
  }

}

void __82__BRCFileProvidingRequestOperation_LegacyAdditions___provideDirectoryRecursively___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  char v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = a2;
  if (v3)
  {
    +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "ignoreFaultingErrorsDuringDirectoryProviding");

    if ((v5 & 1) == 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "completedWithResult:error:", 0, v3);
      goto LABEL_8;
    }
    brc_bread_crumbs();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      __82__BRCFileProvidingRequestOperation_LegacyAdditions___provideDirectoryRecursively___block_invoke_2_cold_1();

  }
  v8 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "itemID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "appLibrary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_provideDirectoryContents:appLibrary:", v9, v10);

LABEL_8:
}

- (void)_provideFlatDirectoryStructure:(id)a3
{
  id v4;
  BRCFileProvidingRequestOperation *v5;
  void *v6;
  void *v7;
  void *v8;
  id WeakRetained;
  void *v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id location;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  objc_msgSend(v4, "clientZone");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "itemID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fetchDirectoryContentsIfNecessary:isUserWaiting:rescheduleApplyScheduler:", v7, 1, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v8, "beginObservingChangesWithDelegate:", v5);
    objc_initWeak(&location, v5);
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __84__BRCFileProvidingRequestOperation_LegacyAdditions___provideFlatDirectoryStructure___block_invoke;
    v14[3] = &unk_1E875E970;
    objc_copyWeak(&v16, &location);
    v15 = v4;
    objc_msgSend(v8, "addDirectoryListCompletionBlock:", v14);
    WeakRetained = objc_loadWeakRetained((id *)&v5->_listOp);

    if (WeakRetained)
    {
      brc_bread_crumbs();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
        -[BRCFileProvidingRequestOperation(LegacyAdditions) _provideFlatDirectoryStructure:].cold.2();

    }
    objc_storeWeak((id *)&v5->_listOp, v8);

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
  else
  {
    brc_bread_crumbs();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      -[BRCFileProvidingRequestOperation(LegacyAdditions) _provideFlatDirectoryStructure:].cold.1();

    -[_BRCOperation completedWithResult:error:](v5, "completedWithResult:error:", 0, 0);
  }

  objc_sync_exit(v5);
}

void __84__BRCFileProvidingRequestOperation_LegacyAdditions___provideFlatDirectoryStructure___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id *WeakRetained;
  id *v5;
  void *v6;
  _QWORD v7[5];

  v3 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (WeakRetained)
    objc_storeWeak(WeakRetained + 70, 0);
  if (v3)
  {
    objc_msgSend(v5, "completedWithResult:error:", 0, v3);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "appLibrary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __84__BRCFileProvidingRequestOperation_LegacyAdditions___provideFlatDirectoryStructure___block_invoke_2;
    v7[3] = &unk_1E875D850;
    v7[4] = v5;
    objc_msgSend(v6, "notifyClient:whenFaultingIsDone:", CFSTR("flat-provide"), v7);

  }
}

void __84__BRCFileProvidingRequestOperation_LegacyAdditions___provideFlatDirectoryStructure___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  NSObject *v7;

  v3 = a2;
  if (v3)
  {
    +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "ignoreFaultingErrorsDuringDirectoryProviding");

    if (v5)
    {
      brc_bread_crumbs();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
        __84__BRCFileProvidingRequestOperation_LegacyAdditions___provideFlatDirectoryStructure___block_invoke_2_cold_1();

      v3 = 0;
    }
  }
  objc_msgSend(*(id *)(a1 + 32), "completedWithResult:error:", 0, v3);

}

- (void)_provideURL
{
  NSURL *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  BRCURLToItemLookup *v7;
  BOOL v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  id v21;
  uint64_t v22[3];
  uint8_t buf[4];
  uint64_t v24;
  __int16 v25;
  id v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  if (self->_directoryItem)
  {
    brc_bread_crumbs();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
      -[BRCFileProvidingRequestOperation(LegacyAdditions) _provideURL].cold.3();

  }
  v3 = self->_url;
  -[BRCAccountSession clientDB](self->_session, "clientDB");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "assertOnQueue");

  memset(v22, 0, sizeof(v22));
  __brc_create_section(0, (uint64_t)"-[BRCFileProvidingRequestOperation(LegacyAdditions) _provideURL]", 198, v22);
  brc_bread_crumbs();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v16 = v22[0];
    -[NSURL path](v3, "path");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218498;
    v24 = v16;
    v25 = 2112;
    v26 = v17;
    v27 = 2112;
    v28 = v5;
    _os_log_debug_impl(&dword_1CBD43000, v6, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx coordinated read for %@%@", buf, 0x20u);

  }
  v7 = -[BRCURLToItemLookup initWithURL:allowAppLibraryRoot:session:]([BRCURLToItemLookup alloc], "initWithURL:allowAppLibraryRoot:session:", v3, 1, self->_session);
  v21 = 0;
  v8 = -[BRCURLToItemLookup resolveAndKeepOpenWithError:](v7, "resolveAndKeepOpenWithError:", &v21);
  v9 = v21;
  if (!v8)
  {
    brc_bread_crumbs();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      -[NSURL path](v3, "path");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v24 = (uint64_t)v18;
      v25 = 2112;
      v26 = v9;
      v27 = 2112;
      v28 = v12;
      _os_log_debug_impl(&dword_1CBD43000, v13, OS_LOG_TYPE_DEBUG, "[DEBUG] can't resolve the parent, granting the read %@: %@%@", buf, 0x20u);

    }
    goto LABEL_12;
  }
  -[BRCURLToItemLookup byIDLocalItem](v7, "byIDLocalItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    -[BRCURLToItemLookup faultedLocalItem](v7, "faultedLocalItem");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
      brc_bread_crumbs();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        -[BRCFileProvidingRequestOperation(LegacyAdditions) _provideURL].cold.1();
LABEL_12:

      -[BRCURLToItemLookup closePaths](v7, "closePaths");
      -[_BRCOperation completedWithResult:error:](self, "completedWithResult:error:", 0, 0);
      v10 = 0;
      goto LABEL_13;
    }
  }
  if (objc_msgSend(v10, "isDocument"))
  {
    objc_msgSend(v10, "asDocument");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCFileProvidingRequestOperation _provideDocument:](self, "_provideDocument:", v11);
LABEL_9:

    -[BRCURLToItemLookup closePaths](v7, "closePaths");
    goto LABEL_13;
  }
  if (objc_msgSend(v10, "isDirectory"))
  {
    if (-[BRCFileProvidingRequestOperation isRecursive](self, "isRecursive"))
    {
      objc_msgSend(v10, "asDirectory");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[BRCFileProvidingRequestOperation _provideDirectoryRecursively:](self, "_provideDirectoryRecursively:", v11);
    }
    else
    {
      objc_msgSend(v10, "asDirectory");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[BRCFileProvidingRequestOperation _provideFlatDirectoryStructure:](self, "_provideFlatDirectoryStructure:", v11);
    }
    goto LABEL_9;
  }
  brc_bread_crumbs();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    -[BRCFileProvidingRequestOperation(LegacyAdditions) _provideURL].cold.2();

  -[BRCURLToItemLookup closePaths](v7, "closePaths");
  -[_BRCOperation completedWithResult:error:](self, "completedWithResult:error:", 0, 0);
LABEL_13:

  __brc_leave_section(v22);
}

- (void)addCompletionCallback:(id)a3
{
  BRCFileProvidingRequestOperation *v4;
  NSMutableArray *callbacks;
  uint64_t v6;
  NSMutableArray *v7;
  void *v8;
  id v9;

  v9 = a3;
  v4 = self;
  objc_sync_enter(v4);
  callbacks = v4->_callbacks;
  if (!callbacks)
  {
    v6 = objc_opt_new();
    v7 = v4->_callbacks;
    v4->_callbacks = (NSMutableArray *)v6;

    callbacks = v4->_callbacks;
  }
  v8 = (void *)MEMORY[0x1D17A6DB0](v9);
  -[NSMutableArray addObject:](callbacks, "addObject:", v8);

  objc_sync_exit(v4);
}

- (NSSet)trackedFileObjects
{
  BRCFileProvidingRequestOperation *v2;
  void *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = (void *)-[NSMutableSet copy](v2->_trackerFileObjects, "copy");
  objc_sync_exit(v2);

  return (NSSet *)v3;
}

- (BRCFileProvidingRequestOperation)initWithName:(id)a3 session:(id)a4 readingOptions:(unint64_t)a5
{
  id v9;
  BRCFileProvidingRequestOperation *v10;
  BRCFileProvidingRequestOperation *v11;
  NSObject *v12;
  BOOL v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  objc_super v20;

  v9 = a4;
  v20.receiver = self;
  v20.super_class = (Class)BRCFileProvidingRequestOperation;
  v10 = -[_BRCOperation initWithName:](&v20, sel_initWithName_, a3);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_session, a4);
    if (initWithName_session_readingOptions__onceToken != -1)
      dispatch_once(&initWithName_session_readingOptions__onceToken, &__block_literal_global_33);
    -[_BRCOperation callbackQueue](v11, "callbackQueue");
    v12 = objc_claimAutoreleasedReturnValue();
    dispatch_set_target_queue(v12, (dispatch_queue_t)initWithName_session_readingOptions__queue);

    v13 = (a5 & 0x40000) == 0;
    v14 = (a5 & 0x40000) >> 18;
    v15 = (a5 >> 17) & 1;
    v11->_isRecursive = v15;
    v16 = v13;
    -[_BRCOperation setNonDiscretionary:](v11, "setNonDiscretionary:", v16);
    -[BRCAccountSession analyticsReporter](v11->_session, "analyticsReporter");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[_BRCOperation operationID](v11, "operationID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "createUserDownloadEventForOperationID:isRecursive:isForBackup:", v18, v15, v14);

  }
  return v11;
}

void __72__BRCFileProvidingRequestOperation_initWithName_session_readingOptions___block_invoke()
{
  NSObject *v0;
  dispatch_queue_t v1;
  void *v2;
  NSObject *v3;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_queue_attr_make_with_autorelease_frequency(v3, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = dispatch_queue_create("provide-request-queue", v0);

  v2 = (void *)initWithName_session_readingOptions__queue;
  initWithName_session_readingOptions__queue = (uint64_t)v1;

}

- (BRCFileProvidingRequestOperation)initWithDocumentItem:(id)a3 client:(id)a4 session:(id)a5
{
  id v9;
  id v10;
  BRCFileProvidingRequestOperation *v11;
  BRCFileProvidingRequestOperation *v12;
  uint64_t v13;
  NSMutableSet *trackerFileObjects;

  v9 = a3;
  v10 = a4;
  v11 = -[BRCFileProvidingRequestOperation initWithName:session:readingOptions:](self, "initWithName:session:readingOptions:", CFSTR("document-download"), a5, 0);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_documentItem, a3);
    objc_storeStrong((id *)&v12->_client, a4);
    v13 = objc_opt_new();
    trackerFileObjects = v12->_trackerFileObjects;
    v12->_trackerFileObjects = (NSMutableSet *)v13;

    -[_BRCFrameworkOperation setIgnoreMissingRemoteClientProxy:](v12, "setIgnoreMissingRemoteClientProxy:", 1);
  }

  return v12;
}

- (void)cancel
{
  BRCFileProvidingRequestOperation *v3;
  id WeakRetained;
  id v5;
  NSSet *v6;
  NSSet *trackedVersionsToCancel;
  NSSet *v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)BRCFileProvidingRequestOperation;
  -[_BRCOperation cancel](&v10, sel_cancel);
  v3 = self;
  objc_sync_enter(v3);
  WeakRetained = objc_loadWeakRetained((id *)&v3->_listOp);
  objc_msgSend(WeakRetained, "endObservingChangesWithDelegate:", v3);

  objc_storeWeak((id *)&v3->_listOp, 0);
  v5 = objc_loadWeakRetained((id *)&v3->_recursiveList);
  objc_msgSend(v5, "endObservingChanges");

  objc_storeWeak((id *)&v3->_recursiveList, 0);
  -[BRCTreeEnumerator cancel](v3->_treeEnumerator, "cancel");
  v6 = (NSSet *)-[NSMutableSet copy](v3->_trackerFileObjects, "copy");
  trackedVersionsToCancel = v3->_trackedVersionsToCancel;
  v3->_trackedVersionsToCancel = v6;
  v8 = v6;

  objc_sync_exit(v3);
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 3072, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCFileProvidingRequestOperation _detachAllTrackedDocID:error:](v3, "_detachAllTrackedDocID:error:", v8, v9);

}

- (void)_detachAllTrackedDocID:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "count"))
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v8 = v6;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v17 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
          objc_msgSend(v13, "fileObjectID", (_QWORD)v16);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "etagIfLoser");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[BRCFileProvidingRequestOperation downloadTrackedForFileObjectID:withEtagIfLoser:didFinishWithError:](self, "downloadTrackedForFileObjectID:withEtagIfLoser:didFinishWithError:", v14, v15, v7);

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v10);
    }

  }
  else
  {
    -[BRCFileProvidingRequestOperation downloadTrackedForFileObjectID:withEtagIfLoser:didFinishWithError:](self, "downloadTrackedForFileObjectID:withEtagIfLoser:didFinishWithError:", 0, 0, v7);
  }

}

- (void)_provideDocument:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  char v11;
  id v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  NSObject *v17;
  void *v18;
  BRCFileProvidingRequestOperation *v19;
  char v20;
  int v21;
  void *v22;
  NSObject *v23;
  void *v24;
  char v25;
  NSMutableSet *trackerFileObjects;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  _QWORD v33[4];
  id v34;
  id v35;
  id v36;
  uint8_t buf[4];
  id v38;
  __int16 v39;
  id v40;
  __int16 v41;
  void *v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "fileObjectID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[_BRCOperation nonDiscretionary](self, "nonDiscretionary"))
  {
    -[BRCAccountSession diskReclaimer](self->_session, "diskReclaimer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "didAccessDocument:", v4);

  }
  if (objc_msgSend(v4, "downloadStatus") == 3)
  {
    brc_bread_crumbs();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      -[BRCFileProvidingRequestOperation _provideDocument:].cold.1();
LABEL_6:

    -[BRCFileProvidingRequestOperation _finishAfterWaitingForDocumentsWithID:withEtagIfLoser:error:](self, "_finishAfterWaitingForDocumentsWithID:withEtagIfLoser:error:", 0, 0, 0);
    goto LABEL_36;
  }
  if (!-[BRCFileProvidingRequestOperation wantsCurrentVersion](self, "wantsCurrentVersion")
    && objc_msgSend(v4, "downloadStatus") == 2)
  {
    brc_bread_crumbs();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      -[BRCFileProvidingRequestOperation _provideDocument:].cold.3();
    goto LABEL_6;
  }
  if (self->_client)
  {
    objc_msgSend(v4, "appLibrary");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9 && (-[NSMutableSet containsObject:](self->_appLibrariesMonitored, "containsObject:", v9) & 1) == 0)
    {
      -[NSMutableSet addObject:](self->_appLibrariesMonitored, "addObject:", v9);
      -[BRCXPCClient addAppLibrary:](self->_client, "addAppLibrary:", v9);
    }

  }
  objc_msgSend(v4, "appLibrary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "cancelWriteCoordinatorForItem:", v4);

  v36 = 0;
  v11 = objc_msgSend(v4, "startDownloadInTask:options:etagIfLoser:stageFileName:error:", 0, 0, 0, 0, &v36);
  v12 = v36;
  if ((v11 & 1) == 0)
  {
    brc_bread_crumbs();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412802;
      v38 = v4;
      v39 = 2112;
      v40 = v12;
      v41 = 2112;
      v42 = v22;
      _os_log_debug_impl(&dword_1CBD43000, v23, OS_LOG_TYPE_DEBUG, "[DEBUG] Failed to start downloading item %@: %@%@", buf, 0x20u);
    }

    -[BRCFileProvidingRequestOperation _finishAfterWaitingForDocumentsWithID:withEtagIfLoser:error:](self, "_finishAfterWaitingForDocumentsWithID:withEtagIfLoser:error:", 0, 0, v12);
    goto LABEL_35;
  }
  +[BRCSystemResourcesManager manager](BRCSystemResourcesManager, "manager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCAccountSession volume](self->_session, "volume");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v13, "hasEnoughSpaceForDevice:", objc_msgSend(v14, "deviceID"));

  if ((v15 & 1) == 0)
  {
    brc_bread_crumbs();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      -[BRCFileProvidingRequestOperation _provideDocument:].cold.2();

    -[BRCAccountSession diskReclaimer](self->_session, "diskReclaimer");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "requestPurgeSpace");

  }
  v19 = self;
  objc_sync_enter(v19);
  v20 = -[BRCFileProvidingRequestOperation isCancelled](v19, "isCancelled");
  if ((v20 & 1) != 0)
  {
    v21 = 0;
  }
  else
  {
    +[BRCSystemResourcesManager manager](BRCSystemResourcesManager, "manager");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "isNetworkReachable");

    if ((v25 & 1) != 0)
    {
      trackerFileObjects = v19->_trackerFileObjects;
      +[BRCTrackedVersion trackedVersionFor:withEtagIfLoser:kind:](BRCTrackedVersion, "trackedVersionFor:withEtagIfLoser:kind:", v5, 0, -[BRCFileProvidingRequestOperation kind](v19, "kind"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableSet addObject:](trackerFileObjects, "addObject:", v27);

      -[BRCAccountSession analyticsReporter](self->_session, "analyticsReporter");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[_BRCOperation operationID](v19, "operationID");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v33[0] = MEMORY[0x1E0C809B0];
      v33[1] = 3221225472;
      v33[2] = __53__BRCFileProvidingRequestOperation__provideDocument___block_invoke;
      v33[3] = &unk_1E87637A0;
      v34 = v5;
      v35 = v4;
      objc_msgSend(v28, "lookupUserDownloadEventByOperationID:accessor:", v29, v33);

      v30 = v34;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 4355, 0);
      v31 = objc_claimAutoreleasedReturnValue();
      v30 = v12;
      v12 = (id)v31;
    }

    v21 = 0;
    if (!v19->_isMonitoringReachability && !v12)
    {
      v21 = 1;
      v19->_isMonitoringReachability = 1;
    }
  }
  objc_sync_exit(v19);

  if (v12)
  {
    -[BRCFileProvidingRequestOperation _finishAfterWaitingForDocumentsWithID:withEtagIfLoser:error:](v19, "_finishAfterWaitingForDocumentsWithID:withEtagIfLoser:error:", v5, 0, v12);
LABEL_35:

    goto LABEL_36;
  }
  if ((v20 & 1) == 0)
  {
    -[BRCAccountSession downloadTrackers](self->_session, "downloadTrackers");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "addDownloadTracker:forFileObjectID:withEtagIfLoser:", v19, v5, 0);

    if (v21)
    {
      +[BRCSystemResourcesManager manager](BRCSystemResourcesManager, "manager");
      v12 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addReachabilityObserver:", v19);
      goto LABEL_35;
    }
  }
LABEL_36:

}

void __53__BRCFileProvidingRequestOperation__provideDocument___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;

  v3 = a2;
  objc_msgSend(v3, "fileObjectIDs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", *(_QWORD *)(a1 + 32));

  objc_msgSend(v3, "setItemCount:", objc_msgSend(v3, "itemCount") + 1);
  objc_msgSend(*(id *)(a1 + 40), "currentVersion");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTotalContentSize:", objc_msgSend(v3, "totalContentSize") + objc_msgSend(v5, "size"));

}

- (void)_provideItem
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: _url == nil%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)listOperation:(id)a3 wasReplacedByOperation:(id)a4
{
  BRCListDirectoryContentsOperation **p_listOp;
  id v7;
  id WeakRetained;
  id obj;

  obj = a4;
  p_listOp = &self->_listOp;
  v7 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_listOp);

  if (WeakRetained == v7)
    objc_storeWeak((id *)p_listOp, obj);

}

- (void)main
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: _url != nil || _directoryItem != nil || _documentItem != nil%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __40__BRCFileProvidingRequestOperation_main__block_invoke(uint64_t a1)
{
  _QWORD *v1;
  void *v2;
  NSObject *v3;
  void *v4;

  v1 = (_QWORD *)(a1 + 32);
  if (objc_msgSend(*(id *)(a1 + 32), "finishIfCancelled"))
  {
    brc_bread_crumbs();
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      __40__BRCFileProvidingRequestOperation_main__block_invoke_cold_1(v1);

  }
  else
  {
    v4 = (void *)*v1;
    if (*(_QWORD *)(*v1 + 528))
      objc_msgSend(v4, "_provideURL");
    else
      objc_msgSend(v4, "_provideItem");
  }
}

- (void)networkReachabilityChanged:(BOOL)a3
{
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  uint64_t v11[3];

  if (!a3)
  {
    memset(v11, 0, sizeof(v11));
    __brc_create_section(0, (uint64_t)"-[BRCFileProvidingRequestOperation networkReachabilityChanged:]", 333, v11);
    brc_bread_crumbs();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      -[BRCFileProvidingRequestOperation networkReachabilityChanged:].cold.1(v11);

    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 4355, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[_BRCOperation callbackQueue](self, "callbackQueue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __63__BRCFileProvidingRequestOperation_networkReachabilityChanged___block_invoke;
    v9[3] = &unk_1E875D470;
    v9[4] = self;
    v8 = v6;
    v10 = v8;
    dispatch_async_with_logs_9(v7, v9);

    __brc_leave_section(v11);
  }
}

void __63__BRCFileProvidingRequestOperation_networkReachabilityChanged___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "trackedFileObjects");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_detachAllTrackedDocID:error:", v3, *(_QWORD *)(a1 + 40));

}

- (void)_finishAfterWaitingForDocumentsWithID:(id)a3 withEtagIfLoser:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  BRCFileProvidingRequestOperation *v10;
  id *p_lastDownloadError;
  id *v12;
  id v13;
  void *v14;
  uint64_t v15;
  id v16;

  v16 = a3;
  v8 = a4;
  v9 = a5;
  v10 = self;
  objc_sync_enter(v10);
  if (v10->_isFinished)
    goto LABEL_4;
  if (v10->_isStillEnumeratingDirectory)
  {
    objc_storeStrong((id *)&v10->_lastDownloadError, a5);
LABEL_4:
    objc_sync_exit(v10);

LABEL_5:
    goto LABEL_6;
  }
  p_lastDownloadError = (id *)&v10->_lastDownloadError;
  if (v9)
    objc_storeStrong(p_lastDownloadError, a5);
  else
    v9 = *p_lastDownloadError;
  objc_sync_exit(v10);

  v12 = v10;
  objc_sync_enter(v12);
  if (v16)
  {
    v13 = v12[74];
    +[BRCTrackedVersion trackedVersionFor:withEtagIfLoser:kind:](BRCTrackedVersion, "trackedVersionFor:withEtagIfLoser:kind:", v16, v8, objc_msgSend(v12, "kind"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "removeObject:", v14);

  }
  v15 = objc_msgSend(v12[74], "count");
  objc_sync_exit(v12);

  if (!v15 || v9)
  {
    v10->_isFinished = 1;
    objc_msgSend(v12, "completedWithResult:error:", 0, v9);
    goto LABEL_5;
  }
LABEL_6:

}

- (BOOL)shouldRetryForError:(id)a3
{
  return 0;
}

- (int)kind
{
  return 0;
}

- (void)finishWithResult:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  BOOL v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  NSObject *v17;
  id v18;
  void *v19;
  NSObject *v20;
  void *v21;
  NSObject *v22;
  NSMutableSet *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  void *v27;
  void *v28;
  BRCFileProvidingRequestOperation *v29;
  NSMutableArray *v30;
  NSMutableArray *callbacks;
  NSMutableArray *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  objc_super v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _QWORD v45[5];
  _QWORD v46[5];
  _QWORD block[5];
  id v48;
  uint64_t *v49;
  uint64_t v50;
  uint64_t *v51;
  uint64_t v52;
  char v53;
  _QWORD v54[4];
  id v55;
  BRCFileProvidingRequestOperation *v56;
  _BYTE v57[128];
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v7)
  {
    brc_bread_crumbs();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      -[BRCFileProvidingRequestOperation finishWithResult:error:].cold.2();
  }
  else
  {
    brc_bread_crumbs();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      -[BRCFileProvidingRequestOperation finishWithResult:error:].cold.1();
  }
  v10 = v7 == 0;

  -[BRCAccountSession analyticsReporter](self->_session, "analyticsReporter");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[_BRCOperation operationID](self, "operationID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x1E0C809B0];
  v54[0] = MEMORY[0x1E0C809B0];
  v54[1] = 3221225472;
  v54[2] = __59__BRCFileProvidingRequestOperation_finishWithResult_error___block_invoke;
  v54[3] = &unk_1E87637A0;
  v14 = v7;
  v55 = v14;
  v56 = self;
  objc_msgSend(v11, "lookupUserDownloadEventByOperationID:accessor:", v12, v54);

  if (v10)
  {
    -[BRCAccountSession clientDB](self->_session, "clientDB");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "serialQueue");
    v22 = objc_claimAutoreleasedReturnValue();
    v45[0] = v13;
    v45[1] = 3221225472;
    v45[2] = __59__BRCFileProvidingRequestOperation_finishWithResult_error___block_invoke_2_14;
    v45[3] = &unk_1E875D500;
    v45[4] = self;
    dispatch_sync(v22, v45);

  }
  else if (-[BRCFileProvidingRequestOperation isCancelled](self, "isCancelled"))
  {
    v50 = 0;
    v51 = &v50;
    v52 = 0x2020000000;
    v53 = 0;
    brc_task_tracker_create("cancellation");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCAccountSession clientDB](self->_session, "clientDB");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "serialQueue");
    v17 = objc_claimAutoreleasedReturnValue();
    block[0] = v13;
    block[1] = 3221225472;
    block[2] = __59__BRCFileProvidingRequestOperation_finishWithResult_error___block_invoke_2;
    block[3] = &unk_1E87615A8;
    block[4] = self;
    v18 = v15;
    v48 = v18;
    v49 = &v50;
    dispatch_sync(v17, block);

    brc_task_tracker_wait((uint64_t)v18);
    if (*((_BYTE *)v51 + 24))
    {
      -[BRCAccountSession clientDB](self->_session, "clientDB");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "serialQueue");
      v20 = objc_claimAutoreleasedReturnValue();
      v46[0] = v13;
      v46[1] = 3221225472;
      v46[2] = __59__BRCFileProvidingRequestOperation_finishWithResult_error___block_invoke_13;
      v46[3] = &unk_1E875D500;
      v46[4] = self;
      dispatch_sync(v20, v46);

    }
    _Block_object_dispose(&v50, 8);
  }
  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  v23 = self->_appLibrariesMonitored;
  v24 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v41, v58, 16);
  if (v24)
  {
    v25 = *(_QWORD *)v42;
    do
    {
      for (i = 0; i != v24; ++i)
      {
        if (*(_QWORD *)v42 != v25)
          objc_enumerationMutation(v23);
        -[BRCXPCClient removeAppLibrary:](self->_client, "removeAppLibrary:", *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * i));
      }
      v24 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v41, v58, 16);
    }
    while (v24);
  }

  +[BRCSystemResourcesManager manager](BRCSystemResourcesManager, "manager");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "removeReachabilityObserver:", self);

  -[BRCAccountSession downloadTrackers](self->_session, "downloadTrackers");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "removeDownloadTracker:", self);

  v29 = self;
  objc_sync_enter(v29);
  v30 = v29->_callbacks;
  callbacks = v29->_callbacks;
  v29->_callbacks = 0;

  objc_sync_exit(v29);
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v32 = v30;
  v33 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v32, "countByEnumeratingWithState:objects:count:", &v37, v57, 16);
  if (v33)
  {
    v34 = *(_QWORD *)v38;
LABEL_21:
    v35 = 0;
    while (1)
    {
      if (*(_QWORD *)v38 != v34)
        objc_enumerationMutation(v32);
      if (!(*(unsigned int (**)(void))(*(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * v35) + 16))())
        break;
      if (v33 == ++v35)
      {
        v33 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v32, "countByEnumeratingWithState:objects:count:", &v37, v57, 16);
        if (v33)
          goto LABEL_21;
        break;
      }
    }
  }

  v36.receiver = v29;
  v36.super_class = (Class)BRCFileProvidingRequestOperation;
  -[_BRCFrameworkOperation finishWithResult:error:](&v36, sel_finishWithResult_error_, v6, v14);

}

void __59__BRCFileProvidingRequestOperation_finishWithResult_error___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setEndTime:", v3);

  objc_msgSend(v7, "setDidSucceed:", *(_QWORD *)(a1 + 32) == 0);
  v4 = objc_msgSend(v7, "itemCount");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 576), "analyticsReporter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
    objc_msgSend(v5, "submitEventMetric:", v7);
  else
    objc_msgSend(v5, "forgetEventMetric:", v7);

}

void __59__BRCFileProvidingRequestOperation_finishWithResult_error___block_invoke_2(uint64_t a1)
{
  id v2;
  id v3;
  void *v4;
  NSObject *v5;
  id v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  void *v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v2 = *(id *)(a1 + 32);
  objc_sync_enter(v2);
  v3 = *(id *)(*(_QWORD *)(a1 + 32) + 616);
  objc_sync_exit(v2);

  brc_bread_crumbs();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    __59__BRCFileProvidingRequestOperation_finishWithResult_error___block_invoke_2_cold_1();

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v6 = v3;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
  if (v7)
  {
    v9 = v7;
    v10 = *(_QWORD *)v21;
    *(_QWORD *)&v8 = 138412546;
    v19 = v8;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v21 != v10)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        v13 = *(void **)(*(_QWORD *)(a1 + 32) + 576);
        objc_msgSend(v12, "fileObjectID", v19, (_QWORD)v20);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "itemByFileObjectID:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v15, "isFault"))
        {
          brc_bread_crumbs();
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(v12, "fileObjectID");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v19;
            v25 = v18;
            v26 = 2112;
            v27 = v16;
            _os_log_debug_impl(&dword_1CBD43000, v17, OS_LOG_TYPE_DEBUG, "[DEBUG] evicting %@ because it's a fault and its download was cancelled%@", buf, 0x16u);

          }
          objc_msgSend(v15, "evictInTask:options:error:", *(_QWORD *)(a1 + 40), 1, 0);
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
        }

      }
      v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
    }
    while (v9);
  }

}

void __59__BRCFileProvidingRequestOperation_finishWithResult_error___block_invoke_13(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 576), "clientDB");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "flushToMakeEditsVisibleToIPCReaders");

}

void __59__BRCFileProvidingRequestOperation_finishWithResult_error___block_invoke_2_14(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 576), "clientDB");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "flushToMakeEditsVisibleToIPCReaders");

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastDownloadError, 0);
  objc_storeStrong((id *)&self->_callbacks, 0);
  objc_storeStrong((id *)&self->_trackedVersionsToCancel, 0);
  objc_storeStrong((id *)&self->_documentItem, 0);
  objc_storeStrong((id *)&self->_appLibrariesMonitored, 0);
  objc_storeStrong((id *)&self->_trackerFileObjects, 0);
  objc_storeStrong((id *)&self->_client, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_destroyWeak((id *)&self->_recursiveList);
  objc_destroyWeak((id *)&self->_listOp);
  objc_storeStrong((id *)&self->_treeEnumerator, 0);
  objc_storeStrong((id *)&self->_directoryItem, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

void __90__BRCFileProvidingRequestOperation_LegacyAdditions___provideDirectoryContents_appLibrary___block_invoke_2_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] Item '%@' isn't on disk yet, failing the coordination%@");
  OUTLINED_FUNCTION_2();
}

void __90__BRCFileProvidingRequestOperation_LegacyAdditions___provideDirectoryContents_appLibrary___block_invoke_2_cold_2()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_1();
  _os_log_fault_impl(&dword_1CBD43000, v0, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: Huh? %@ doesn't have a document id...%@", v1, 0x16u);
  OUTLINED_FUNCTION_2();
}

void __82__BRCFileProvidingRequestOperation_LegacyAdditions___provideDirectoryRecursively___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_1(&dword_1CBD43000, v0, v1, "[DEBUG] Ignoring faulting error for recursive provide%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __84__BRCFileProvidingRequestOperation_LegacyAdditions___provideFlatDirectoryStructure___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_1(&dword_1CBD43000, v0, v1, "[DEBUG] Ignoring faulting error for flat provide%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_provideDocument:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] %@ is already current%@");
  OUTLINED_FUNCTION_2();
}

- (void)_provideDocument:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] We don't have enough space on disk to download %@.  Let's try to free some%@");
  OUTLINED_FUNCTION_2();
}

- (void)_provideDocument:.cold.3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] %@ is already downloaded%@");
  OUTLINED_FUNCTION_2();
}

void __40__BRCFileProvidingRequestOperation_main__block_invoke_cold_1(_QWORD *a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = *a1;
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v1, v2, "[DEBUG] %@ was cancelled%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_2();
}

- (void)networkReachabilityChanged:(_QWORD *)a1 .cold.1(_QWORD *a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 134218242;
  *(_QWORD *)((char *)&v3 + 4) = *a1;
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v1, v2, "[DEBUG] ┏%llx network becomes not reachable, finishing the providing request%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_2();
}

- (void)finishWithResult:error:.cold.1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_4_0();
  _os_log_debug_impl(&dword_1CBD43000, v0, OS_LOG_TYPE_DEBUG, "[DEBUG] granting coordinated read%@", v1, 0xCu);
  OUTLINED_FUNCTION_2();
}

- (void)finishWithResult:error:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] failing coordinated read with %@%@");
  OUTLINED_FUNCTION_2();
}

void __59__BRCFileProvidingRequestOperation_finishWithResult_error___block_invoke_2_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] we were cancelled, cancelling docIDs %@%@");
  OUTLINED_FUNCTION_2();
}

@end
