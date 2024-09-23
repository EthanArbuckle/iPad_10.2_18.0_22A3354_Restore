@implementation BRCPrivateClientZone

- (BOOL)isPrivateZone
{
  return 1;
}

- (BRCPrivateServerZone)privateServerZone
{
  BRCServerZone *serverZone;
  void *v5;
  NSObject *v6;

  serverZone = self->super._serverZone;
  if (!serverZone)
  {
    brc_bread_crumbs();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      -[BRCPrivateClientZone privateServerZone].cold.1();

    serverZone = self->super._serverZone;
  }
  -[BRCServerZone asPrivateZone](serverZone, "asPrivateZone");
  return (BRCPrivateServerZone *)(id)objc_claimAutoreleasedReturnValue();
}

- (id)rootItemID
{
  void *v2;
  void *v3;

  -[BRCPrivateClientZone defaultAppLibrary](self, "defaultAppLibrary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "rootItemID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)fetchZoneRootItemInDB:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[BRCPrivateClientZone defaultAppLibrary](self, "defaultAppLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fetchRootItemInDB:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BRCAppLibrary)defaultAppLibrary
{
  BRCAppLibrary *defaultAppLibrary;
  void *v5;
  NSObject *v6;

  defaultAppLibrary = self->_defaultAppLibrary;
  if (!defaultAppLibrary)
  {
    brc_bread_crumbs();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      -[BRCPrivateClientZone defaultAppLibrary].cold.1();

    defaultAppLibrary = self->_defaultAppLibrary;
  }
  return defaultAppLibrary;
}

- (BOOL)hasDefaultAppLibrary
{
  return self->_defaultAppLibrary != 0;
}

- (void)registerPCSChainingOperation:(id)a3
{
  BRCPrivateClientZone *v4;
  NSMapTable *pcsChainFolderOperations;
  uint64_t v6;
  NSMapTable *v7;
  void *v8;
  id v9;

  v9 = a3;
  v4 = self;
  objc_sync_enter(v4);
  pcsChainFolderOperations = v4->_pcsChainFolderOperations;
  if (!pcsChainFolderOperations)
  {
    objc_msgSend(MEMORY[0x1E0CB3748], "weakToWeakObjectsMapTable");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = v4->_pcsChainFolderOperations;
    v4->_pcsChainFolderOperations = (NSMapTable *)v6;

    pcsChainFolderOperations = v4->_pcsChainFolderOperations;
  }
  objc_msgSend(v9, "rootItemID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMapTable setObject:forKey:](pcsChainFolderOperations, "setObject:forKey:", v9, v8);

  objc_sync_exit(v4);
}

- (id)pcsChainOperationForItemID:(id)a3
{
  id v4;
  BRCPrivateClientZone *v5;
  void *v6;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  -[NSMapTable objectForKey:](v5->_pcsChainFolderOperations, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v5);

  return v6;
}

- (NSSet)appLibraryIDs
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[BRCPrivateClientZone appLibraries](self, "appLibraries", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8), "appLibraryID");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  return (NSSet *)v3;
}

- (void)addAppLibrary:(id)a3
{
  -[BRCPrivateClientZone addAppLibrary:offline:](self, "addAppLibrary:offline:", a3, 1);
}

- (void)addAppLibrary:(id)a3 offline:(BOOL)a4
{
  void *v7;
  void *v8;
  int v9;
  id v10;

  v10 = a3;
  if (!a4)
    -[BRCPQLConnection assertOnQueue](self->super._db, "assertOnQueue");
  -[NSMutableSet addObject:](self->_appLibraries, "addObject:", v10);
  -[BRCClientZone zoneName](self, "zoneName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "appLibraryID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "isEqualToString:", v8);

  if (v9)
    objc_storeStrong((id *)&self->_defaultAppLibrary, a3);

}

- (void)removeAppLibrary:(id)a3
{
  BRCPQLConnection *db;
  id v5;

  db = self->super._db;
  v5 = a3;
  -[BRCPQLConnection assertOnQueue](db, "assertOnQueue");
  -[NSMutableSet removeObject:](self->_appLibraries, "removeObject:", v5);

}

- (BRCPrivateClientZone)initWithMangledID:(id)a3 dbRowID:(id)a4 plist:(id)a5 session:(id)a6 initialCreation:(BOOL)a7
{
  BRCPrivateClientZone *v7;
  NSMutableSet *v8;
  NSMutableSet *appLibraries;
  NSMutableArray *v10;
  NSMutableArray *zoneCreationCompletionBlocks;
  NSObject *v12;
  NSObject *v13;
  dispatch_queue_t v14;
  OS_dispatch_queue *createZoneQueue;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)BRCPrivateClientZone;
  v7 = -[BRCClientZone initWithMangledID:dbRowID:plist:session:initialCreation:](&v17, sel_initWithMangledID_dbRowID_plist_session_initialCreation_, a3, a4, a5, a6, a7);
  if (v7)
  {
    v8 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    appLibraries = v7->_appLibraries;
    v7->_appLibraries = v8;

    v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    zoneCreationCompletionBlocks = v7->_zoneCreationCompletionBlocks;
    v7->_zoneCreationCompletionBlocks = v10;

    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UNSPECIFIED, 0);
    v12 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_autorelease_frequency(v12, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = dispatch_queue_create("client-zone/zone-creation", v13);

    createZoneQueue = v7->_createZoneQueue;
    v7->_createZoneQueue = (OS_dispatch_queue *)v14;

  }
  return v7;
}

- (void)createCloudKitZoneWithGroup:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *createZoneQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  createZoneQueue = self->_createZoneQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63__BRCPrivateClientZone_createCloudKitZoneWithGroup_completion___block_invoke;
  block[3] = &unk_1E875EB70;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_sync(createZoneQueue, block);

}

uint64_t __63__BRCPrivateClientZone_createCloudKitZoneWithGroup_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_createCloudKitZoneWithGroup:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_createCloudKitZoneWithGroup:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  BRCCreateZoneAndSubscribeOperation *v10;
  BRCCreateZoneAndSubscribeOperation *createZoneOperation;
  NSMutableArray *zoneCreationCompletionBlocks;
  void *v13;
  uint64_t v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  __int128 v18;
  uint64_t v19;
  __int128 v20;
  uint64_t v21;
  __int128 v22;
  uint64_t v23;
  id location;
  uint8_t buf[4];
  uint64_t v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_createZoneQueue);
  if (!self->_createZoneOperation)
  {
    objc_initWeak(&location, self);
    v20 = 0uLL;
    v21 = 0;
    __brc_create_section(0, (uint64_t)"-[BRCPrivateClientZone _createCloudKitZoneWithGroup:completion:]", 172, &v20);
    brc_bread_crumbs();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      v14 = v20;
      -[BRCClientZone zoneName](self, "zoneName");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218498;
      v26 = v14;
      v27 = 2112;
      v28 = v15;
      v29 = 2112;
      v30 = v8;
      _os_log_debug_impl(&dword_1CBD43000, v9, OS_LOG_TYPE_DEBUG, "[DEBUG] ┣%llx scheduling zone creation operation for %@%@", buf, 0x20u);

    }
    v22 = v20;
    v23 = v21;
    v10 = -[BRCCreateZoneAndSubscribeOperation initWithServerZone:sessionContext:]([BRCCreateZoneAndSubscribeOperation alloc], "initWithServerZone:sessionContext:", self->super._serverZone, self->super._session);
    createZoneOperation = self->_createZoneOperation;
    self->_createZoneOperation = v10;

    -[_BRCOperation setGroup:](self->_createZoneOperation, "setGroup:", v6);
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __64__BRCPrivateClientZone__createCloudKitZoneWithGroup_completion___block_invoke;
    v16[3] = &unk_1E8762FE0;
    v18 = v22;
    v19 = v23;
    objc_copyWeak(&v17, &location);
    -[BRCCreateZoneAndSubscribeOperation setCreateZoneAndSubscribeCompletionBlock:](self->_createZoneOperation, "setCreateZoneAndSubscribeCompletionBlock:", v16);
    -[_BRCOperation schedule](self->_createZoneOperation, "schedule");
    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }
  zoneCreationCompletionBlocks = self->_zoneCreationCompletionBlocks;
  v13 = (void *)MEMORY[0x1D17A6DB0](v7);
  -[NSMutableArray addObject:](zoneCreationCompletionBlocks, "addObject:", v13);

}

void __64__BRCPrivateClientZone__createCloudKitZoneWithGroup_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  _QWORD *WeakRetained;
  NSObject *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  __int128 v11;
  uint64_t v12;
  uint8_t buf[4];
  uint64_t v14;
  __int16 v15;
  id v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v11 = *(_OWORD *)(a1 + 40);
  v12 = *(_QWORD *)(a1 + 56);
  brc_bread_crumbs();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218498;
    v14 = v11;
    v15 = 2112;
    v16 = v3;
    v17 = 2112;
    v18 = v4;
    _os_log_debug_impl(&dword_1CBD43000, v5, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx finished zone creation with error: %@%@", buf, 0x20u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v7 = WeakRetained[65];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __64__BRCPrivateClientZone__createCloudKitZoneWithGroup_completion___block_invoke_5;
  v9[3] = &unk_1E875D470;
  v9[4] = WeakRetained;
  v10 = v3;
  v8 = v3;
  dispatch_sync(v7, v9);

  __brc_leave_section((uint64_t *)&v11);
}

void __64__BRCPrivateClientZone__createCloudKitZoneWithGroup_completion___block_invoke_5(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 528), "copy");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 528), "removeAllObjects");
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = v2;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v7) + 16))(*(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v7));
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(void **)(v8 + 512);
  *(_QWORD *)(v8 + 512) = 0;

}

- (BOOL)dumpTablesToContext:(id)a3 includeAllItems:(BOOL)a4 error:(id *)a5
{
  _BOOL8 v6;
  id v8;
  BOOL v9;
  objc_super v11;

  v6 = a4;
  v8 = a3;
  v11.receiver = self;
  v11.super_class = (Class)BRCPrivateClientZone;
  v9 = -[BRCClientZone dumpTablesToContext:includeAllItems:error:](&v11, sel_dumpTablesToContext_includeAllItems_error_, v8, v6, a5);
  if (self->_zoneHealthState)
  {
    objc_msgSend(v8, "writeLineWithFormat:", CFSTR("%@"), self->_zoneHealthState);
    objc_msgSend(v8, "writeLineWithFormat:", &stru_1E8769030);
  }
  if (self->_problemReport)
  {
    objc_msgSend(v8, "writeLineWithFormat:", CFSTR("%@"), self->_problemReport);
    objc_msgSend(v8, "writeLineWithFormat:", &stru_1E8769030);
  }

  return v9;
}

- (void)setServerZone:(id)a3
{
  BRCServerZone *v4;
  BRCServerZone *serverZone;
  void *v6;
  NSObject *v7;

  v4 = (BRCServerZone *)a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    brc_bread_crumbs();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      -[BRCPrivateClientZone setServerZone:].cold.1();

  }
  serverZone = self->super._serverZone;
  self->super._serverZone = v4;

}

- (void)resume
{
  void *v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  const char *v7;
  objc_super v8;
  uint64_t v9[3];
  uint8_t buf[4];
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  BRCPrivateClientZone *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  memset(v9, 0, sizeof(v9));
  __brc_create_section(0, (uint64_t)"-[BRCPrivateClientZone resume]", 227, v9);
  brc_bread_crumbs();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    if (self->super._isInitialCreation)
      v7 = "Creating";
    else
      v7 = "Loading";
    *(_DWORD *)buf = 134218754;
    v11 = v9[0];
    v12 = 2080;
    v13 = v7;
    v14 = 2112;
    v15 = self;
    v16 = 2112;
    v17 = v3;
    _os_log_debug_impl(&dword_1CBD43000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx %s private container %@%@", buf, 0x2Au);
  }

  v8.receiver = self;
  v8.super_class = (Class)BRCPrivateClientZone;
  -[BRCClientZone resume](&v8, sel_resume);
  if (self->super._isInitialCreation)
    -[BRCPrivateClientZone recomputeAppSyncBlockState](self, "recomputeAppSyncBlockState");
  brc_bread_crumbs();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[BRCClientZone resume].cold.1();

  __brc_leave_section(v9);
}

- (void)close
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_1(&dword_1CBD43000, v0, v1, "[DEBUG] zoneCreationOp finished%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

uint64_t __29__BRCPrivateClientZone_close__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 512));
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "cancel");
}

- (id)plist
{
  void *v3;
  void *v4;
  BRCProblemReport *problemReport;
  BRCServerZoneHealthState *zoneHealthState;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)BRCPrivateClientZone;
  -[BRCClientZone plist](&v8, sel_plist);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  problemReport = self->_problemReport;
  if (problemReport)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", problemReport, CFSTR("problemReport"));
  zoneHealthState = self->_zoneHealthState;
  if (zoneHealthState)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", zoneHealthState, CFSTR("zoneHealthState"));
  return v4;
}

- (void)updateWithPlist:(id)a3
{
  id v4;
  BRCProblemReport *v5;
  BRCProblemReport *problemReport;
  BRCServerZoneHealthState *v7;
  BRCServerZoneHealthState *zoneHealthState;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)BRCPrivateClientZone;
  v4 = a3;
  -[BRCClientZone updateWithPlist:](&v9, sel_updateWithPlist_, v4);
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("problemReport"), v9.receiver, v9.super_class);
  v5 = (BRCProblemReport *)objc_claimAutoreleasedReturnValue();
  problemReport = self->_problemReport;
  self->_problemReport = v5;

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("zoneHealthState"));
  v7 = (BRCServerZoneHealthState *)objc_claimAutoreleasedReturnValue();

  zoneHealthState = self->_zoneHealthState;
  self->_zoneHealthState = v7;

}

- (void)clearProblemReport
{
  BRCProblemReport *problemReport;

  -[BRCPQLConnection assertOnQueue](self->super._db, "assertOnQueue");
  problemReport = self->_problemReport;
  self->_problemReport = 0;

  -[BRCClientZone setNeedsSave:](self, "setNeedsSave:", 1);
}

- (void)reportProblemWithType:(int)a3 recordName:(id)a4
{
  uint64_t v4;
  id v6;
  NSObject *v7;
  _QWORD block[5];
  id v9;
  int v10;

  v4 = *(_QWORD *)&a3;
  v6 = a4;
  if (shouldReportProblemToHealthZone(v4))
  {
    -[BRCPQLConnection serialQueue](self->super._db, "serialQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __57__BRCPrivateClientZone_reportProblemWithType_recordName___block_invoke;
    block[3] = &unk_1E8763008;
    block[4] = self;
    v10 = v4;
    v9 = v6;
    dispatch_async(v7, block);

  }
}

uint64_t __57__BRCPrivateClientZone_reportProblemWithType_recordName___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;
  void *v5;
  BRCProblemReport *v6;
  uint64_t v7;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 560);
  if (v3)
  {
    v4 = v3;
    v5 = *(void **)(v2 + 560);
    *(_QWORD *)(v2 + 560) = v4;
  }
  else
  {
    v6 = objc_alloc_init(BRCProblemReport);
    v7 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v7 + 560);
    *(_QWORD *)(v7 + 560) = v6;
  }

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 560), "addProblemWithType:recordName:", *(unsigned int *)(a1 + 48), *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "setNeedsSave:", 1);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "didChangeSyncStatusForZoneHealthForContainer:");
}

- (id)prepareProblemReportForSyncWithRequestID:(int64_t)a3
{
  void *v5;
  void *v6;

  -[BRCPQLConnection assertOnQueue](self->super._db, "assertOnQueue");
  if (-[BRCProblemReport needsSyncUp](self->_problemReport, "needsSyncUp"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCProblemReport setPendingRequestID:](self->_problemReport, "setPendingRequestID:", v5);

    v6 = (void *)-[BRCProblemReport copy](self->_problemReport, "copy");
    -[BRCProblemReport setNeedsSyncUp:](self->_problemReport, "setNeedsSyncUp:", 0);
    -[BRCClientZone setNeedsSave:](self, "setNeedsSave:", 1);
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (void)syncedDownZoneHealthRequestID:(int64_t)a3
{
  void *v5;
  void *v6;
  int64_t v7;
  void *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  int v12;
  BRCPrivateClientZone *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[BRCPQLConnection assertOnQueue](self->super._db, "assertOnQueue");
  -[BRCProblemReport pendingRequestID](self->_problemReport, "pendingRequestID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[BRCProblemReport pendingRequestID](self->_problemReport, "pendingRequestID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "longLongValue");

    if (v7 <= a3)
    {
      brc_bread_crumbs();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        -[BRCPrivateClientZone syncedDownZoneHealthRequestID:].cold.1();

      -[BRCProblemReport setPendingRequestID:](self->_problemReport, "setPendingRequestID:", 0);
    }
    else
    {
      brc_bread_crumbs();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v12 = 138412546;
        v13 = self;
        v14 = 2112;
        v15 = v8;
        _os_log_impl(&dword_1CBD43000, v9, OS_LOG_TYPE_DEFAULT, "[WARNING] problem report for %@ wasn't acked%@", (uint8_t *)&v12, 0x16u);
      }

      -[BRCProblemReport setPendingRequestID:](self->_problemReport, "setPendingRequestID:", 0);
      -[BRCProblemReport setNeedsSyncUp:](self->_problemReport, "setNeedsSyncUp:", 1);
    }
  }
  -[BRCClientZone setNeedsSave:](self, "setNeedsSave:", 1);
}

- (BOOL)resetFrequencyIsTooHigh
{
  void *v3;
  NSMutableArray *lastResets;
  unint64_t v5;
  void *v6;
  unint64_t v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  BOOL v20;
  NSMutableArray *v21;
  NSMutableArray *v22;
  int v24;
  uint64_t v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  lastResets = self->_lastResets;
  if (!lastResets)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", v3);
    v21 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    v22 = self->_lastResets;
    self->_lastResets = v21;

    goto LABEL_9;
  }
  -[NSMutableArray addObject:](lastResets, "addObject:", v3);
  v5 = -[NSMutableArray count](self->_lastResets, "count");
  +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "healthZoneMaxNumberOfResets");

  if (v5 <= v7)
  {
LABEL_9:
    v20 = 0;
    goto LABEL_10;
  }
  -[NSMutableArray objectAtIndex:](self->_lastResets, "objectAtIndex:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeIntervalSinceDate:", v8);
  v10 = v9;
  +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "healthZoneTimeIntervalForMaxNumberOfResets");
  v13 = v12;

  if (v10 >= v13)
  {
    -[NSMutableArray removeObjectAtIndex:](self->_lastResets, "removeObjectAtIndex:", 0);
    goto LABEL_9;
  }
  brc_bread_crumbs();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "healthZoneMaxNumberOfResets");
    +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "healthZoneTimeIntervalForMaxNumberOfResets");
    v24 = 134218498;
    v25 = v17;
    v26 = 2048;
    v27 = v19;
    v28 = 2112;
    v29 = v14;
    _os_log_impl(&dword_1CBD43000, v15, OS_LOG_TYPE_DEFAULT, "[WARNING] Zone has resetted more than %lu times during the last %f seconds%@", (uint8_t *)&v24, 0x20u);

  }
  -[NSMutableArray removeObjectAtIndex:](self->_lastResets, "removeObjectAtIndex:", 0);
  v20 = 1;
LABEL_10:

  return v20;
}

- (void)syncedDownZoneHealthState:(id)a3
{
  id v5;
  BRCServerZoneHealthState *v6;
  void *v7;
  NSObject *v8;
  BRCProblemReport *problemReport;
  BRCProblemReport *v10;
  BRCPrivateClientZone *v11;
  NSObject *v12;
  const char *v13;
  BRCPrivateClientZone *v14;
  NSObject *v15;
  BRCServerZoneHealthState *zoneHealthState;
  int v17;
  BRCPrivateClientZone *v18;
  __int16 v19;
  BRCServerZoneHealthState *v20;
  __int16 v21;
  BRCServerZoneHealthState *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  -[BRCPQLConnection assertOnQueue](self->super._db, "assertOnQueue");
  v6 = self->_zoneHealthState;
  objc_storeStrong((id *)&self->_zoneHealthState, a3);
  -[BRCClientZone setNeedsSave:](self, "setNeedsSave:", 1);
  brc_bread_crumbs();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    zoneHealthState = self->_zoneHealthState;
    v17 = 138413058;
    v18 = self;
    v19 = 2112;
    v20 = v6;
    v21 = 2112;
    v22 = zoneHealthState;
    v23 = 2112;
    v24 = v7;
    _os_log_debug_impl(&dword_1CBD43000, v8, OS_LOG_TYPE_DEBUG, "[DEBUG] zone-health changed for %@ previous %@ new %@%@", (uint8_t *)&v17, 0x2Au);
  }

  if (-[BRCServerZoneHealthState state](v6, "state") >= 1 && !objc_msgSend(v5, "state"))
  {
    problemReport = self->_problemReport;
    if (problemReport && -[BRCProblemReport shouldResetAfterFixingState](problemReport, "shouldResetAfterFixingState")
      || (self->super._state & 0x10000) != 0)
    {
      if (-[BRCPrivateClientZone resetFrequencyIsTooHigh](self, "resetFrequencyIsTooHigh"))
      {
        -[BRCPrivateClientZone reportProblemWithType:recordName:](self, "reportProblemWithType:recordName:", 19, 0);
      }
      else
      {
        brc_bread_crumbs();
        v14 = (BRCPrivateClientZone *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          v17 = 138412290;
          v18 = v14;
          _os_log_impl(&dword_1CBD43000, v15, OS_LOG_TYPE_DEFAULT, "[WARNING] We had a problem and the zone is healthy again, resetting the zone%@", (uint8_t *)&v17, 0xCu);
        }

        -[BRCClientZone scheduleResetServerAndClientTruthsForReason:](self, "scheduleResetServerAndClientTruthsForReason:", CFSTR("zone became healthy"));
      }
      goto LABEL_5;
    }
    v10 = self->_problemReport;
    if (v10 && !-[BRCProblemReport shouldResetAfterFixingState](v10, "shouldResetAfterFixingState"))
    {
      brc_bread_crumbs();
      v11 = (BRCPrivateClientZone *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v17 = 138412290;
        v18 = v11;
        v13 = "[WARNING] We had a problem and the zone is healthy again, no need to reset the zone%@";
        goto LABEL_20;
      }
    }
    else
    {
      brc_bread_crumbs();
      v11 = (BRCPrivateClientZone *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v17 = 138412290;
        v18 = v11;
        v13 = "[WARNING] Server told us the zone is healthy again, but we didn't have a problem%@";
LABEL_20:
        _os_log_impl(&dword_1CBD43000, v12, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)&v17, 0xCu);
      }
    }

  }
LABEL_5:

}

- (void)zoneHealthWasReset
{
  BRCServerZoneHealthState *zoneHealthState;

  -[BRCPQLConnection assertOnQueue](self->super._db, "assertOnQueue");
  zoneHealthState = self->_zoneHealthState;
  self->_zoneHealthState = 0;

  -[BRCProblemReport setNeedsSyncUp:](self->_problemReport, "setNeedsSyncUp:", 1);
  -[BRCClientZone setNeedsSave:](self, "setNeedsSave:", 1);
}

- (BOOL)zoneHealthNeedsSyncUp
{
  return -[BRCProblemReport needsSyncUp](self->_problemReport, "needsSyncUp");
}

- (BOOL)recomputeAppSyncBlockState
{
  void *v3;
  char v4;
  _BOOL4 v5;
  _BOOL4 v6;
  void *v7;
  int v8;
  void *v9;
  NSObject *v10;
  NSMutableSet *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  void *v16;
  NSObject *v17;
  void *v18;
  NSObject *v19;
  const char *v21;
  const char *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint64_t v27[3];
  uint8_t v28[128];
  uint8_t buf[4];
  uint64_t v30;
  __int16 v31;
  BRCPrivateClientZone *v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  +[BRCCloudDocsAppsMonitor cloudDocsAppsMonitor](BRCCloudDocsAppsMonitor, "cloudDocsAppsMonitor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasFetchedInitialApps");

  v5 = -[BRCClientZone isSyncBlockedBecauseAppNotInstalled](self, "isSyncBlockedBecauseAppNotInstalled");
  v6 = v5;
  if ((v4 & 1) != 0)
  {
    -[BRCClientZone mangledID](self, "mangledID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[BRCClientZone shouldSyncMangledID:](self, "shouldSyncMangledID:", v7);

  }
  else
  {
    v8 = !v5;
  }
  memset(v27, 0, sizeof(v27));
  __brc_create_section(0, (uint64_t)"-[BRCPrivateClientZone recomputeAppSyncBlockState]", 396, v27);
  brc_bread_crumbs();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218498;
    v30 = v27[0];
    v31 = 2112;
    v32 = self;
    v33 = 2112;
    v34 = v9;
    _os_log_debug_impl(&dword_1CBD43000, v10, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx recomputing app sync block state for %@%@", buf, 0x20u);
  }

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v11 = self->_appLibraries;
  v12 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v24;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v24 != v13)
          objc_enumerationMutation(v11);
        objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * v14++), "recomputeShouldEvictState", (_QWORD)v23);
      }
      while (v12 != v14);
      v12 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    }
    while (v12);
  }

  v15 = v6 ^ v8;
  if (((v6 ^ v8) & 1) != 0)
  {
    brc_bread_crumbs();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      v21 = "enabled";
      *(_DWORD *)buf = 136315650;
      if (v6)
        v21 = "disabled";
      v30 = (uint64_t)v21;
      v31 = 2112;
      v32 = self;
      v33 = 2112;
      v34 = v16;
      _os_log_debug_impl(&dword_1CBD43000, v17, OS_LOG_TYPE_DEBUG, "[DEBUG] sync remaining %s for %@%@", buf, 0x20u);
    }

  }
  else
  {
    brc_bread_crumbs();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      v22 = "disabled";
      *(_DWORD *)buf = 136315650;
      if (v8)
        v22 = "enabled";
      v30 = (uint64_t)v22;
      v31 = 2112;
      v32 = self;
      v33 = 2112;
      v34 = v18;
      _os_log_debug_impl(&dword_1CBD43000, v19, OS_LOG_TYPE_DEBUG, "[DEBUG] updating sync state to be %s for %@%@", buf, 0x20u);
    }

    if (v8)
      -[BRCClientZone clearStateBits:](self, "clearStateBits:", 4096);
    else
      -[BRCClientZone setStateBits:](self, "setStateBits:", 4096);
    -[BRCClientZone setNeedsSave:](self, "setNeedsSave:", 1, (_QWORD)v23);
  }
  __brc_leave_section(v27);
  return v15 ^ 1;
}

- (id)serverAliasByUnsaltedBookmarkData:(id)a3
{
  id v4;
  BRCPQLConnection *db;
  id v6;
  void *v8;
  NSObject *v9;
  _QWORD v10[5];

  v4 = a3;
  if (!v4)
  {
    brc_bread_crumbs();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      -[BRCPrivateClientZone serverAliasByUnsaltedBookmarkData:].cold.1();

  }
  db = self->super._db;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __58__BRCPrivateClientZone_serverAliasByUnsaltedBookmarkData___block_invoke;
  v10[3] = &unk_1E875E2C8;
  v10[4] = self;
  v6 = -[BRCPQLConnection fetchObject:sql:](db, "fetchObject:sql:", v10, CFSTR("SELECT zone_rowid, item_rank, item_origname, pcs_state, item_id, item_creator_id, item_sharing_options, item_side_car_ckinfo, item_stat_ckinfo, item_state, item_type, item_mode, item_birthtime, item_lastusedtime, item_favoriterank,item_parent_id, item_filename, item_hidden_ext, item_finder_tags, item_xattr_signature, item_trash_put_back_path, item_trash_put_back_parent_id, item_alias_target, item_creator, version_name, version_ckinfo, version_mtime, version_size, version_thumb_size, version_thumb_signature, version_content_signature, version_xattr_signature, version_edited_since_shared, version_device, version_conflict_loser_etags, version_quarantine_info, quota_used, recursive_child_count, shared_children_count, shared_alias_count, child_count FROM server_items WHERE item_filename = %@ AND item_type = 3 AND zone_rowid = %@"), v4, self->super._dbRowID);

  return v6;
}

id __58__BRCPrivateClientZone_serverAliasByUnsaltedBookmarkData___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = *(void **)(a1 + 32);
  v5 = a2;
  objc_msgSend(v4, "session");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "newServerItemFromPQLResultSet:error:", v5, a3);

  return v7;
}

- (BOOL)isDocumentScopePublic
{
  void *v2;
  void *v3;
  char v4;

  -[BRCPrivateClientZone defaultAppLibrary](self, "defaultAppLibrary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "containerMetadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isDocumentScopePublic");

  return v4;
}

- (BOOL)dumpActivityToContext:(id)a3 includeExpensiveActivity:(BOOL)a4 error:(id *)a5
{
  _BOOL8 v6;
  id v8;
  void *v9;
  _BOOL4 v10;
  uint64_t v11;
  uint64_t v12;
  const __CFString *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  objc_super v24;
  _BYTE v25[128];
  uint64_t v26;

  v6 = a4;
  v26 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  -[BRCPrivateClientZone privateServerZone](self, "privateServerZone");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v24.receiver = self;
  v24.super_class = (Class)BRCPrivateClientZone;
  v10 = -[BRCClientZone dumpActivityToContext:includeExpensiveActivity:error:](&v24, sel_dumpActivityToContext_includeExpensiveActivity_error_, v8, v6, a5);
  if (v10)
  {
    objc_msgSend(v9, "deleteAllContentsOperation");
    v11 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "deleteAllContentsOperationLastError");
    v12 = objc_claimAutoreleasedReturnValue();
    if (v11 | v12)
    {
      v13 = CFSTR("idle");
      if (v11)
        v13 = (const __CFString *)v11;
      objc_msgSend(v8, "writeLineWithFormat:", CFSTR("+ delete-content: %@"), v13);
      if (v12)
        objc_msgSend(v8, "writeLineWithFormat:", CFSTR("     (last-error: %@)"), v12);
    }
    if (-[NSMutableArray count](self->_faultsLiveBarriers, "count"))
      objc_msgSend(v8, "writeLineWithFormat:", CFSTR("+ barriers:  %ld"), -[NSMutableArray count](self->_faultsLiveBarriers, "count"));
    if (-[NSMapTable count](self->_pcsChainFolderOperations, "count"))
    {
      objc_msgSend(v8, "writeLineWithFormat:", CFSTR("+ pcs chain operation:"));
      objc_msgSend(v8, "pushIndentation");
      v22 = 0u;
      v23 = 0u;
      v20 = 0u;
      v21 = 0u;
      -[NSMapTable objectEnumerator](self->_pcsChainFolderOperations, "objectEnumerator");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
      if (v15)
      {
        v16 = v15;
        v17 = *(_QWORD *)v21;
        do
        {
          v18 = 0;
          do
          {
            if (*(_QWORD *)v21 != v17)
              objc_enumerationMutation(v14);
            objc_msgSend(v8, "writeLineWithFormat:", CFSTR("%@"), *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v18++));
          }
          while (v16 != v18);
          v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
        }
        while (v16);
      }

      objc_msgSend(v8, "popIndentation");
    }

  }
  return v10;
}

- (void)_checkResultSetIsEmpty:(id)a3 logToFile:(__sFILE *)a4 reason:(id)a5 result:(BOOL *)a6
{
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a5;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  objc_msgSend(v9, "enumerateObjectsOfClass:", objc_opt_class());
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v21 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        *a6 = 0;
        fprintf(a4, "itemID %s %s\n", (const char *)objc_msgSend(objc_retainAutorelease(v16), "UTF8String"), (const char *)objc_msgSend(objc_retainAutorelease(v10), "UTF8String"));
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v13);
  }

  objc_msgSend(v9, "error");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    *a6 = 0;
    objc_msgSend(v9, "error");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "description");
    v19 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    fprintf(a4, "SQL error: %s\n", (const char *)objc_msgSend(v19, "UTF8String"));

  }
}

- (BOOL)validateStructureLoggingToFile:(__sFILE *)a3 db:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  char v10;
  void *v11;
  id v12;
  BOOL v13;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;

  v6 = a4;
  v19 = 1;
  -[BRCPrivateClientZone defaultAppLibrary](self, "defaultAppLibrary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "rootItemID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  fprintf(a3, "client truth structure validation (%s)\n=================================\n", -[NSString UTF8String](self->super._zoneName, "UTF8String"));
  if ((objc_msgSend(v6, "execute:", CFSTR("DROP TABLE IF EXISTS items_checks")) & 1) != 0
    && (objc_msgSend(v6, "execute:", CFSTR("CREATE TABLE items_checks (item_id blob PRIMARY KEY, depth integer not null)")) & 1) != 0&& (objc_msgSend(v6, "execute:", CFSTR("CREATE INDEX items_checks__depth__idx ON items_checks (depth)")) & 1) != 0&& objc_msgSend(v6, "execute:", CFSTR("INSERT INTO items_checks (item_id, depth) VALUES (%@, 0)"), v8))
  {
    v9 = 0;
    while (objc_msgSend(v6, "changes"))
    {
      v10 = objc_msgSend(v6, "execute:", CFSTR("INSERT INTO items_checks    SELECT c.item_id, %lld      FROM items_checks AS p INNER JOIN client_items AS c ON (p.item_id = c.item_parent_id)     WHERE zone_rowid = %@ AND p.depth = %lld"), v9 + 1, self->super._dbRowID, v9);
      ++v9;
      if ((v10 & 1) == 0)
        goto LABEL_8;
    }
    v15 = (void *)objc_msgSend(v6, "fetch:", CFSTR("SELECT item_id FROM client_items WHERE zone_rowid = %@   AND item_id NOT IN(SELECT item_id FROM items_checks)"), self->super._dbRowID);
    -[BRCPrivateClientZone _checkResultSetIsEmpty:logToFile:reason:result:](self, "_checkResultSetIsEmpty:logToFile:reason:result:", v15, a3, CFSTR("is an orphan or part of a cycle"), &v19);
    v16 = (void *)objc_msgSend(v6, "fetch:", CFSTR("SELECT c.item_id      FROM client_items AS c INNER JOIN client_items AS p ON (c.item_parent_id = p.item_id)     WHERE c.item_state != 1 AND p.item_state = 1       AND c.zone_rowid = %@ AND p.zone_rowid = %@"), self->super._dbRowID, self->super._dbRowID);

    -[BRCPrivateClientZone _checkResultSetIsEmpty:logToFile:reason:result:](self, "_checkResultSetIsEmpty:logToFile:reason:result:", v16, a3, CFSTR("is a live item parented to a tombstone"), &v19);
    v17 = (void *)objc_msgSend(v6, "fetch:", CFSTR("SELECT c.item_id      FROM client_items AS c INNER JOIN client_items AS p ON (c.item_parent_id = p.item_id)     WHERE p.item_type IN (1, 2, 8, 5, 6, 7)       AND c.zone_rowid = %@ AND p.zone_rowid = %@"), self->super._dbRowID, self->super._dbRowID);

    -[BRCPrivateClientZone _checkResultSetIsEmpty:logToFile:reason:result:](self, "_checkResultSetIsEmpty:logToFile:reason:result:", v17, a3, CFSTR("is parented to a document"), &v19);
    v18 = (void *)objc_msgSend(v6, "fetch:", CFSTR("SELECT o.item_id       FROM client_items AS o  WHERE zone_rowid = %@ AND EXISTS(SELECT 1 FROM client_items AS n WHERE ((   n.item_parent_id = o.item_parent_id      AND item_filename = IFNULL(o.item_localname, o.item_filename)      AND item_localname IS NULL)  OR(   n.item_parent_id = o.item_parent_id      AND item_localname = IFNULL(o.item_localname, o.item_filename)) )  AND n.item_id != o.item_id  AND n.zone_rowid = %@)"), self->super._dbRowID, self->super._dbRowID);

    -[BRCPrivateClientZone _checkResultSetIsEmpty:logToFile:reason:result:](self, "_checkResultSetIsEmpty:logToFile:reason:result:", v18, a3, CFSTR("is parented to a document"), &v19);
    if (v19)
      fputs("OK\n", a3);
    fputc(10, a3);
    v13 = v19 != 0;

  }
  else
  {
LABEL_8:
    objc_msgSend(v6, "lastError");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "description");
    v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    fprintf(a3, "SQL error: %s\n", (const char *)objc_msgSend(v12, "UTF8String"));

    v13 = 0;
  }

  return v13;
}

- (BOOL)validateItemsLoggingToFile:(__sFILE *)a3 db:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  uint64_t i;
  BOOL v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  fprintf(a3, "local items checks (%s)\n===================\n", -[NSString UTF8String](self->super._zoneName, "UTF8String"));
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[BRCClientZone itemsEnumeratorWithDB:](self, "itemsEnumeratorWithDB:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (!v8)
  {

LABEL_11:
    fputs("OK\n", a3);
    v13 = 1;
    goto LABEL_12;
  }
  v9 = v8;
  v10 = *(_QWORD *)v16;
  v11 = 1;
  do
  {
    for (i = 0; i != v9; ++i)
    {
      if (*(_QWORD *)v16 != v10)
        objc_enumerationMutation(v7);
      v11 &= objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "validateLoggingToFile:", a3);
    }
    v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  }
  while (v9);

  if (v11)
    goto LABEL_11;
  v13 = 0;
LABEL_12:
  fputc(10, a3);

  return v13;
}

- (NSSet)appLibraries
{
  return &self->_appLibraries->super;
}

- (BRCServerZoneHealthState)zoneHealthState
{
  return self->_zoneHealthState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pcsChainFolderOperations, 0);
  objc_storeStrong((id *)&self->_defaultAppLibrary, 0);
  objc_storeStrong((id *)&self->_appLibraries, 0);
  objc_storeStrong((id *)&self->_lastResets, 0);
  objc_storeStrong((id *)&self->_problemReport, 0);
  objc_storeStrong((id *)&self->_zoneHealthState, 0);
  objc_storeStrong((id *)&self->_syncBarriers, 0);
  objc_storeStrong((id *)&self->_faultsLiveBarriers, 0);
  objc_storeStrong((id *)&self->_zoneCreationCompletionBlocks, 0);
  objc_storeStrong((id *)&self->_createZoneQueue, 0);
  objc_storeStrong((id *)&self->_createZoneOperation, 0);
}

- (unsigned)pcsChainStateForItem:(id)a3
{
  id v4;
  BRCAccountSession *session;
  void *v6;
  void *v7;
  unsigned int v8;
  void *v9;
  void *v10;

  v4 = a3;
  if (objc_msgSend(v4, "isNonDesktopRoot"))
  {
    session = self->super._session;
    objc_msgSend(v4, "appLibraryRowID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCAccountSession appLibraryByRowID:](session, "appLibraryByRowID:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v7, "state") & 0x8000000) != 0)
      v8 = 4;
    else
      v8 = 1;

  }
  else
  {
    -[BRCClientZone db](self, "db");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCClientZone dbRowID](self, "dbRowID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v9, "numberWithSQL:", CFSTR("SELECT pcs_state FROM server_items WHERE item_id = %@   AND zone_rowid = %@ LIMIT 1"), v4, v10);

    v8 = objc_msgSend(v6, "intValue");
  }

  return v8;
}

- (BOOL)parentIDHasLiveUnchainedChildren:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  -[BRCClientZone db](self, "db");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCClientZone dbRowID](self, "dbRowID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "fetch:", CFSTR("SELECT item_type, pcs_state FROM server_items WHERE item_id = %@ and zone_rowid = %@"), v4, v6);

  if (!objc_msgSend(v7, "next")
    || objc_msgSend(v7, "integerAtIndex:", 0) != 9
    || (v8 = 1, objc_msgSend(v7, "integerAtIndex:", 1) == 2))
  {
    -[BRCClientZone db](self, "db");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCClientZone dbRowID](self, "dbRowID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v9, "numberWithSQL:", CFSTR("SELECT 1 FROM server_items WHERE item_parent_id = %@   AND zone_rowid = %@   AND pcs_state NOT IN (2, 3)   AND item_state = 0 LIMIT 1"), v4, v10);

    v8 = objc_msgSend(v11, "BOOLValue");
  }

  return v8;
}

- (id)unchainedItemInfoInServerTruthEnumeratorParentedTo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  _QWORD v15[5];
  id v16;

  v4 = a3;
  -[BRCServerZone mangledID](self->super._serverZone, "mangledID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "pcsChainShareAliases");

  if (v7)
    objc_msgSend(MEMORY[0x1E0DE81E0], "rawInjection:length:", ", 0);
  else
    objc_msgSend(MEMORY[0x1E0DE81D0], "formatInjection:", CFSTR("AND NOT (item_type = 3 AND item_alias_target like '%%:\\_%%' ESCAPE '\\')"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCClientZone db](self, "db");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCClientZone dbRowID](self, "dbRowID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "fetch:", CFSTR("SELECT item_id, item_type, item_stat_ckinfo, version_ckinfo, pcs_state, item_alias_target FROM server_items WHERE item_parent_id = %@   AND zone_rowid = %@   AND pcs_state NOT IN (2, 3)   AND item_state = 0 %@"), v4, v10, v8);

  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __97__BRCPrivateClientZone_BRCPCSChainAdditions__unchainedItemInfoInServerTruthEnumeratorParentedTo___block_invoke;
  v15[3] = &unk_1E875E310;
  v15[4] = self;
  v16 = v4;
  v12 = v4;
  objc_msgSend(v11, "enumerateObjects:", v15);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

BRCPCSChainInfo *__97__BRCPrivateClientZone_BRCPCSChainAdditions__unchainedItemInfoInServerTruthEnumeratorParentedTo___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  char v6;
  void *v7;
  char v8;
  id v9;
  void *v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  BRCPCSChainInfo *v21;
  uint64_t v23;
  int v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  id v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "objectOfClass:atIndex:", objc_opt_class(), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 1;
  v6 = objc_msgSend(v3, "intAtIndex:", 1);
  objc_msgSend(v3, "objectOfClass:atIndex:", objc_opt_class(), 2);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectOfClass:atIndex:", objc_opt_class(), 3);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v3, "intAtIndex:", 4);
  if (v6 == 3)
  {
    objc_msgSend(v3, "stringAtIndex:", 5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 0;
    v28 = 0;
    v8 = objc_msgSend(v7, "parseUnsaltedBookmarkDataWithItemID:mangledID:error:", 0, &v28, &v27);
    v9 = v27;
    if ((v8 & 1) == 0)
    {
      brc_bread_crumbs();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412802;
        v30 = v7;
        v31 = 2112;
        v32 = v9;
        v33 = 2112;
        v34 = v10;
        _os_log_impl(&dword_1CBD43000, v11, OS_LOG_TYPE_DEFAULT, "[WARNING] Couldn't parse unsalted bookmark data %@ - %@%@", buf, 0x20u);
      }

    }
    if (v28)
    {
      v5 = objc_msgSend(v28, "isShared");
    }
    else
    {
      brc_bread_crumbs();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
        __97__BRCPrivateClientZone_BRCPCSChainAdditions__unchainedItemInfoInServerTruthEnumeratorParentedTo___block_invoke_cold_1();

    }
  }
  objc_msgSend(*(id *)(a1 + 32), "db");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "dbRowID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v14, "fetch:", CFSTR("SELECT item_stat_ckinfo, version_ckinfo FROM client_items WHERE item_id = %@  AND zone_rowid = %@  AND (item_local_diffs & %lld) != 0"), v4, v15, 0x1000000000000000);

  if (objc_msgSend(v16, "next"))
  {
    objc_msgSend(v16, "objectOfClass:atIndex:", objc_opt_class(), 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectOfClass:atIndex:", objc_opt_class(), 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    brc_bread_crumbs();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138413314;
      v30 = v26;
      v31 = 2112;
      v32 = v25;
      v33 = 2112;
      v34 = v17;
      v35 = 2112;
      v36 = v18;
      v37 = 2112;
      v38 = v19;
      _os_log_debug_impl(&dword_1CBD43000, v20, OS_LOG_TYPE_DEBUG, "[DEBUG] Overriding structural and content info from (%@, %@) -> (%@, %@) because the item is OOB sync%@", buf, 0x34u);
    }

  }
  else
  {
    v18 = v25;
    v17 = v26;
  }
  LODWORD(v23) = v24;
  v21 = -[BRCPCSChainInfo initWithItemID:parentID:structuralCKInfo:contentCKInfo:itemType:aliasTargetZoneIsShared:chainState:]([BRCPCSChainInfo alloc], "initWithItemID:parentID:structuralCKInfo:contentCKInfo:itemType:aliasTargetZoneIsShared:chainState:", v4, *(_QWORD *)(a1 + 40), v17, v18, v6, v5, v23);

  return v21;
}

- (id)resolveClashOfAlias:(id)a3 atPath:(id)a4 withAlias:(id)a5 atPath:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  id v22;
  NSObject *v23;
  id v24;
  _QWORD v26[4];
  id v27;
  uint64_t v28[3];
  uint8_t buf[4];
  uint64_t v30;
  __int16 v31;
  id v32;
  __int16 v33;
  id v34;
  __int16 v35;
  id v36;
  __int16 v37;
  id v38;
  __int16 v39;
  void *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  memset(v28, 0, sizeof(v28));
  __brc_create_section(0, (uint64_t)"-[BRCPrivateClientZone(LegacyAdditions) resolveClashOfAlias:atPath:withAlias:atPath:]", 25, v28);
  brc_bread_crumbs();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134219266;
    v30 = v28[0];
    v31 = 2112;
    v32 = v9;
    v33 = 2112;
    v34 = v10;
    v35 = 2112;
    v36 = v11;
    v37 = 2112;
    v38 = v12;
    v39 = 2112;
    v40 = v13;
    _os_log_debug_impl(&dword_1CBD43000, v14, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx Resolving alias clash:\n alias1: %@\nrelpath1: %@\n\n alias2: %@\nrelpath2:%@%@", buf, 0x3Eu);
  }

  brc_bread_crumbs();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    -[BRCPrivateClientZone(LegacyAdditions) resolveClashOfAlias:atPath:withAlias:atPath:].cold.4();

  objc_msgSend(v9, "markDead");
  objc_msgSend(v9, "saveToDB");
  if (!objc_msgSend(v12, "resolveMustExist:error:", 1, 0))
  {
    objc_msgSend(v10, "resolveMustExist:error:", 1, 0);
    brc_bread_crumbs();
    v22 = (id)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      -[BRCPrivateClientZone(LegacyAdditions) resolveClashOfAlias:atPath:withAlias:atPath:].cold.3();

    v19 = v10;
    goto LABEL_15;
  }
  brc_bread_crumbs();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    -[BRCPrivateClientZone(LegacyAdditions) resolveClashOfAlias:atPath:withAlias:atPath:].cold.2();

  v19 = v12;
  if (objc_msgSend(v10, "resolveMustExist:error:", 1, 0))
  {
    brc_bread_crumbs();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      -[BRCPrivateClientZone(LegacyAdditions) resolveClashOfAlias:atPath:withAlias:atPath:].cold.1();

    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __85__BRCPrivateClientZone_LegacyAdditions__resolveClashOfAlias_atPath_withAlias_atPath___block_invoke;
    v26[3] = &unk_1E875EF40;
    v27 = v10;
    objc_msgSend(v27, "performOnOpenParentFileDescriptor:error:", v26, 0);
    v22 = v27;
    v19 = v12;
LABEL_15:

  }
  v24 = v19;
  __brc_leave_section(v28);

  return v24;
}

uint64_t __85__BRCPrivateClientZone_LegacyAdditions__resolveClashOfAlias_atPath_withAlias_atPath___block_invoke(uint64_t a1, int a2)
{
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "filename");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  BRCUnlinkAt(a2, v3, 0);

  return 0;
}

- (void)signalFaultingWatchersWithError:(id)a3
{
  id v4;
  NSMutableArray *v5;
  NSMutableArray *faultsLiveBarriers;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = self->_faultsLiveBarriers;
  faultsLiveBarriers = self->_faultsLiveBarriers;
  self->_faultsLiveBarriers = 0;

  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v7 = v5;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v13;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v7);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v11) + 16))(*(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v11));
        ++v11;
      }
      while (v9 != v11);
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }

}

- (void)notifyClient:(id)a3 whenFaultingIsDone:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  BRCPrivateClientZone *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  -[BRCPQLConnection serialQueue](self->super._db, "serialQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __73__BRCPrivateClientZone_LegacyAdditions__notifyClient_whenFaultingIsDone___block_invoke;
  block[3] = &unk_1E875EB70;
  v12 = v6;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

void __73__BRCPrivateClientZone_LegacyAdditions__notifyClient_whenFaultingIsDone___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;

  brc_bread_crumbs();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    __73__BRCPrivateClientZone_LegacyAdditions__notifyClient_whenFaultingIsDone___block_invoke_cold_1(a1, (uint64_t)v2, v3);

  v4 = *(_QWORD *)(a1 + 40);
  if (*(_BYTE *)(v4 + 76))
  {
    v5 = *(void **)(v4 + 536);
    if (!v5)
    {
      v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v7 = *(_QWORD *)(a1 + 40);
      v8 = *(void **)(v7 + 536);
      *(_QWORD *)(v7 + 536) = v6;

      v5 = *(void **)(*(_QWORD *)(a1 + 40) + 536);
    }
    v9 = (void *)MEMORY[0x1D17A6DB0](*(_QWORD *)(a1 + 48));
    objc_msgSend(v5, "addObject:", v9);

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "applyScheduler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "monitorFaultingForZone:", *(_QWORD *)(a1 + 40));
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "brc_errorLoggedOut");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

- (void)privateServerZone
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: _serverZone%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)defaultAppLibrary
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: _defaultAppLibrary%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)setServerZone:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: [serverZone isKindOfClass:[BRCPrivateServerZone class]]%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)syncedDownZoneHealthRequestID:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_4_0();
  v3 = 2112;
  v4 = v0;
  _os_log_debug_impl(&dword_1CBD43000, v1, OS_LOG_TYPE_DEBUG, "[DEBUG] problem report for %@ completed%@", v2, 0x16u);
  OUTLINED_FUNCTION_2();
}

- (void)serverAliasByUnsaltedBookmarkData:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: unsaltedBookmarkData%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __97__BRCPrivateClientZone_BRCPCSChainAdditions__unchainedItemInfoInServerTruthEnumeratorParentedTo___block_invoke_cold_1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_1();
  _os_log_fault_impl(&dword_1CBD43000, v0, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: Can't locate target server zone from bookmark data %@%@", v1, 0x16u);
  OUTLINED_FUNCTION_2();
}

void __73__BRCPrivateClientZone_LegacyAdditions__notifyClient_whenFaultingIsDone___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 138412546;
  *(_QWORD *)&v3[4] = *(_QWORD *)(a1 + 32);
  *(_WORD *)&v3[12] = 2112;
  *(_QWORD *)&v3[14] = a2;
  OUTLINED_FUNCTION_0(&dword_1CBD43000, a2, a3, "[DEBUG] Queueing faults live barrier for %@%@", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16]);
  OUTLINED_FUNCTION_2();
}

@end
