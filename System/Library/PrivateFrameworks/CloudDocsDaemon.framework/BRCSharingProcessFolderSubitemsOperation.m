@implementation BRCSharingProcessFolderSubitemsOperation

- (BOOL)shouldRetryForError:(id)a3
{
  return objc_msgSend(a3, "brc_isUserInitiatedRetriable");
}

- (BRCSharingProcessFolderSubitemsOperation)initWithItem:(id)a3 sessionContext:(id)a4 processType:(unint64_t)a5 maxSubitemsToFail:(unint64_t)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  BRCSharingProcessFolderSubitemsOperation *v17;
  void *v18;
  char v19;
  void *v20;
  uint64_t v21;
  BRCPrivateClientZone *rootClientZone;
  uint64_t v23;
  BRCItemID *rootItemID;
  void *v25;
  uint64_t v26;
  BRCALRowID *appLibraryRowID;
  uint64_t v28;
  NSMutableArray *shareIDsToDelete;
  uint64_t v30;
  NSMutableArray *sharedClientSubitems;
  uint64_t v32;
  NSMutableArray *sharedServerSubitems;
  uint64_t v34;
  NSMutableArray *aliasItemsToDelete;
  uint64_t v36;
  NSMutableArray *activeListOperations;
  void *v38;
  void *v39;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  char v48;
  objc_super v49;

  v10 = a3;
  v11 = a4;
  objc_msgSend(v10, "itemID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "debugItemIDString");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("sharing/clean-subitems"), "stringByAppendingPathComponent:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "serverZone");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "metadataSyncContext");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v49.receiver = self;
  v49.super_class = (Class)BRCSharingProcessFolderSubitemsOperation;
  v17 = -[_BRCOperation initWithName:syncContext:sessionContext:](&v49, sel_initWithName_syncContext_sessionContext_, v14, v16, v11);

  if (v17)
  {
    objc_msgSend(v10, "itemID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v18, "isDocumentsFolder") & 1) != 0)
    {
LABEL_3:

LABEL_5:
      v17->_isFSRoot = 1;
LABEL_6:
      v17->_alreadyHasShareID = (objc_msgSend(v10, "sharingOptions") & 4) != 0;
      v17->_rowID = objc_msgSend(v10, "dbRowID");
      objc_msgSend(v10, "clientZone");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "asPrivateClientZone");
      v21 = objc_claimAutoreleasedReturnValue();
      rootClientZone = v17->_rootClientZone;
      v17->_rootClientZone = (BRCPrivateClientZone *)v21;

      objc_msgSend(v10, "itemID");
      v23 = objc_claimAutoreleasedReturnValue();
      rootItemID = v17->_rootItemID;
      v17->_rootItemID = (BRCItemID *)v23;

      objc_msgSend(v10, "appLibrary");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "dbRowID");
      v26 = objc_claimAutoreleasedReturnValue();
      appLibraryRowID = v17->_appLibraryRowID;
      v17->_appLibraryRowID = (BRCALRowID *)v26;

      v28 = objc_opt_new();
      shareIDsToDelete = v17->_shareIDsToDelete;
      v17->_shareIDsToDelete = (NSMutableArray *)v28;

      v30 = objc_opt_new();
      sharedClientSubitems = v17->_sharedClientSubitems;
      v17->_sharedClientSubitems = (NSMutableArray *)v30;

      v32 = objc_opt_new();
      sharedServerSubitems = v17->_sharedServerSubitems;
      v17->_sharedServerSubitems = (NSMutableArray *)v32;

      v34 = objc_opt_new();
      aliasItemsToDelete = v17->_aliasItemsToDelete;
      v17->_aliasItemsToDelete = (NSMutableArray *)v34;

      v36 = objc_opt_new();
      activeListOperations = v17->_activeListOperations;
      v17->_activeListOperations = (NSMutableArray *)v36;

      +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v17->_batchSize = objc_msgSend(v38, "deleteShareIDBatchCount");

      v17->_failedSubitemsLeft = a6;
      v17->_processType = a5;
      objc_msgSend(MEMORY[0x1E0C94F88], "br_sharingMisc");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      -[_BRCOperation setGroup:](v17, "setGroup:", v39);

      goto LABEL_7;
    }
    v19 = objc_msgSend(v10, "isFSRoot");

    if ((v19 & 1) != 0)
      goto LABEL_5;
    objc_msgSend(v10, "st");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "parentID");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v41, "isNonDesktopRoot") & 1) != 0)
    {
      objc_msgSend(v10, "clientZone");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v42, "isCloudDocsZone") & 1) != 0)
      {
        objc_msgSend(v10, "st");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "filename");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v44, "isEqualToString:", *MEMORY[0x1E0D10DC8]) & 1) == 0)
        {
          objc_msgSend(v10, "st");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v46, "filename");
          v47 = v43;
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          v48 = objc_msgSend(v45, "isEqualToString:", *MEMORY[0x1E0D10DD8]);

          if ((v48 & 1) == 0)
            goto LABEL_6;
          goto LABEL_5;
        }

        goto LABEL_3;
      }

    }
    goto LABEL_6;
  }
LABEL_7:

  return v17;
}

- (void)_stopObservingListOperation
{
  BRCSharingProcessFolderSubitemsOperation *v2;
  NSMutableArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = self;
  objc_sync_enter(v2);
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v3 = v2->_activeListOperations;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "endObservingChangesWithDelegate:", v2, (_QWORD)v7);
      }
      while (v4 != v6);
      v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

  -[NSMutableArray removeAllObjects](v2->_activeListOperations, "removeAllObjects");
  objc_sync_exit(v2);

}

- (void)dealloc
{
  objc_super v3;

  -[BRCSharingProcessFolderSubitemsOperation _stopObservingListOperation](self, "_stopObservingListOperation");
  v3.receiver = self;
  v3.super_class = (Class)BRCSharingProcessFolderSubitemsOperation;
  -[_BRCOperation dealloc](&v3, sel_dealloc);
}

- (void)finishWithResult:(id)a3 error:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BRCSharingProcessFolderSubitemsOperation;
  -[_BRCFrameworkOperation finishWithResult:error:](&v5, sel_finishWithResult_error_, a3, a4);
  -[BRCSharingProcessFolderSubitemsOperation _stopObservingListOperation](self, "_stopObservingListOperation");
}

- (void)listOperation:(id)a3 wasReplacedByOperation:(id)a4
{
  id v6;
  BRCSharingProcessFolderSubitemsOperation *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  v7 = self;
  objc_sync_enter(v7);
  -[NSMutableArray removeObject:](v7->_activeListOperations, "removeObject:", v8);
  -[NSMutableArray addObject:](v7->_activeListOperations, "addObject:", v6);
  objc_sync_exit(v7);

}

- (id)createActivity
{
  return _os_activity_create(&dword_1CBD43000, "sharing/clean-subitems", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
}

- (void)removeSharedSubitemsWithCompletion:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  id v9;
  _QWORD v10[5];
  id v11;

  v4 = a3;
  brc_bread_crumbs();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[BRCSharingProcessFolderSubitemsOperation removeSharedSubitemsWithCompletion:].cold.1();

  -[BRCSyncContext session](self->super.super._syncContext, "session");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "clientTruthWorkloop");
  v8 = objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __79__BRCSharingProcessFolderSubitemsOperation_removeSharedSubitemsWithCompletion___block_invoke;
  v10[3] = &unk_1E875EAA8;
  v10[4] = self;
  v11 = v4;
  v9 = v4;
  dispatch_async(v8, v10);

}

void __79__BRCSharingProcessFolderSubitemsOperation_removeSharedSubitemsWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id obj;
  _QWORD v40[5];
  id v41;
  id v42;
  id v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  uint8_t v48[128];
  uint8_t buf[4];
  void *v50;
  __int16 v51;
  void *v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_opt_new();
  v38 = (void *)objc_opt_new();
  v36 = (void *)objc_opt_new();
  v3 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v3 + 528))
  {
    v4 = 0;
    v5 = 0;
    do
    {
      v6 = objc_msgSend(*(id *)(v3 + 576), "count", v36);
      v3 = *(_QWORD *)(a1 + 32);
      if (v5 >= v6)
        break;
      objc_msgSend(*(id *)(v3 + 576), "objectAtIndexedSubscript:", v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      brc_bread_crumbs();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(v7, "shareID");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v50 = v12;
        v51 = 2112;
        v52 = v8;
        _os_log_debug_impl(&dword_1CBD43000, v9, OS_LOG_TYPE_DEBUG, "[DEBUG] Removing shareID %@%@", buf, 0x16u);

      }
      objc_msgSend(v7, "shareID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "addObject:", v10);

      objc_msgSend(v7, "emptyRecord");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "addObject:", v11);

      objc_msgSend(v36, "addObject:", v7);
      v3 = *(_QWORD *)(a1 + 32);
      v4 += 2;
      ++v5;
    }
    while (v4 < *(_QWORD *)(v3 + 528));
  }
  else
  {
    v5 = 0;
  }
  objc_msgSend(*(id *)(v3 + 576), "removeObjectsInRange:", 0, v5, v36);
  v13 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 568), "count");
  v14 = *(_QWORD *)(a1 + 32);
  v15 = *(_QWORD *)(v14 + 528);
  v16 = objc_msgSend(*(id *)(v14 + 568), "count");
  v17 = *(_QWORD *)(a1 + 32);
  if (v13 >= v15 - v16)
  {
    v20 = *(_QWORD *)(v17 + 528);
    v21 = v20 - objc_msgSend(*(id *)(v17 + 576), "count");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 568), "subarrayWithRange:", 0, v21);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = a1;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 568), "removeObjectsInRange:", 0, v21);
  }
  else
  {
    v18 = (void *)objc_msgSend(*(id *)(v17 + 568), "copy");
    v19 = a1;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 568), "removeAllObjects");
  }
  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  obj = v18;
  v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v45;
    do
    {
      v25 = 0;
      do
      {
        if (*(_QWORD *)v45 != v24)
          objc_enumerationMutation(obj);
        v26 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * v25);
        brc_bread_crumbs();
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412546;
          v50 = v26;
          v51 = 2112;
          v52 = v27;
          _os_log_debug_impl(&dword_1CBD43000, v28, OS_LOG_TYPE_DEBUG, "[DEBUG] Removing alias record %@%@", buf, 0x16u);
        }

        objc_msgSend(*(id *)(*(_QWORD *)(v19 + 32) + 592), "serverZone");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "structureRecordIDForItemType:zone:aliasTargetZoneIsShared:", 3, v29, 1);
        v30 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v2, "addObject:", v30);
        ++v25;
      }
      while (v23 != v25);
      v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
    }
    while (v23);
  }

  if (objc_msgSend(v2, "count") || objc_msgSend(v38, "count"))
  {
    v31 = objc_alloc(MEMORY[0x1E0C94F10]);
    if (objc_msgSend(v38, "count"))
      v32 = v38;
    else
      v32 = 0;
    if (objc_msgSend(v2, "count"))
      v33 = v2;
    else
      v33 = 0;
    v34 = (void *)objc_msgSend(v31, "initWithRecordsToSave:recordIDsToDelete:", v32, v33);
    objc_msgSend(v34, "setAtomic:", 1);
    objc_msgSend(v34, "setSavePolicy:", 0);
    v40[0] = MEMORY[0x1E0C809B0];
    v40[1] = 3221225472;
    v40[2] = __79__BRCSharingProcessFolderSubitemsOperation_removeSharedSubitemsWithCompletion___block_invoke_308;
    v40[3] = &unk_1E8765CD0;
    v40[4] = *(_QWORD *)(v19 + 32);
    v35 = v37;
    v41 = v37;
    v42 = obj;
    v43 = *(id *)(v19 + 40);
    objc_msgSend(v34, "setModifyRecordsCompletionBlock:", v40);
    objc_msgSend(*(id *)(v19 + 32), "addSubOperation:", v34);

  }
  else
  {
    objc_msgSend(*(id *)(*(_QWORD *)(v19 + 32) + 592), "scheduleSyncDown");
    (*(void (**)(void))(*(_QWORD *)(v19 + 40) + 16))();
    v35 = v37;
  }

}

void __79__BRCSharingProcessFolderSubitemsOperation_removeSharedSubitemsWithCompletion___block_invoke_308(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  float v11;
  float v12;
  void *v13;
  NSObject *v14;
  void *v15;
  _QWORD v16[5];
  id v17;
  id v18;
  _QWORD block[4];
  id v20;
  id v21;

  v6 = a2;
  v7 = a4;
  brc_bread_crumbs();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    __79__BRCSharingProcessFolderSubitemsOperation_removeSharedSubitemsWithCompletion___block_invoke_308_cold_1();

  if (objc_msgSend(v7, "brc_containsCloudKitErrorCode:", 27))
  {
    +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "modifyRecordsCountMultiplicativeDecrease");
    v12 = v11;

    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 528) = (float)(v12
                                                                    * (float)*(unint64_t *)(*(_QWORD *)(a1 + 32)
                                                                                                 + 528));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 576), "addObjectsFromArray:", *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 568), "addObjectsFromArray:", *(_QWORD *)(a1 + 48));
    objc_msgSend(*(id *)(a1 + 32), "removeSharedSubitemsWithCompletion:", *(_QWORD *)(a1 + 56));
  }
  else
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 248), "session");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "clientTruthWorkloop");
    v14 = objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __79__BRCSharingProcessFolderSubitemsOperation_removeSharedSubitemsWithCompletion___block_invoke_309;
      block[3] = &unk_1E875F7C0;
      v21 = *(id *)(a1 + 56);
      v20 = v7;
      dispatch_async(v14, block);

      v15 = v21;
    }
    else
    {
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __79__BRCSharingProcessFolderSubitemsOperation_removeSharedSubitemsWithCompletion___block_invoke_2;
      v16[3] = &unk_1E875EB70;
      v16[4] = *(_QWORD *)(a1 + 32);
      v17 = v6;
      v18 = *(id *)(a1 + 56);
      dispatch_async(v14, v16);

      v15 = v17;
    }

  }
}

uint64_t __79__BRCSharingProcessFolderSubitemsOperation_removeSharedSubitemsWithCompletion___block_invoke_309(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __79__BRCSharingProcessFolderSubitemsOperation_removeSharedSubitemsWithCompletion___block_invoke_2(uint64_t *a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t);
  void *v8;
  uint64_t v9;
  id v10;

  objc_msgSend(*(id *)(a1[4] + 248), "session");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "clientDB");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v6 = 3221225472;
  v7 = __79__BRCSharingProcessFolderSubitemsOperation_removeSharedSubitemsWithCompletion___block_invoke_3;
  v8 = &unk_1E8760018;
  v4 = (void *)a1[5];
  v9 = a1[4];
  v10 = v4;
  objc_msgSend(v3, "groupInBatch:", &v5);

  objc_msgSend((id)a1[4], "removeSharedSubitemsWithCompletion:", a1[6], v5, v6, v7, v8, v9);
}

uint64_t __79__BRCSharingProcessFolderSubitemsOperation_removeSharedSubitemsWithCompletion___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 592), "learnCKInfosFromSavedRecords:isOutOfBandModifyRecords:", *(_QWORD *)(a1 + 40), 1);
}

- (BOOL)_completeAfterProcessingClientTruthIfNecessaryWithError:(id)a3
{
  BOOL v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  void *v13;
  NSObject *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD v20[5];
  id v21;
  id v22;
  id v23;
  id v24;
  _QWORD v25[4];
  id v26;
  id v27;
  id v28;

  if (!a3)
  {
    -[BRCClientZone dbRowID](self->_rootClientZone, "dbRowID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      if (!-[NSMutableArray count](self->_sharedClientSubitems, "count"))
      {
        v4 = 0;
        goto LABEL_9;
      }
      v6 = (void *)objc_opt_new();
      v7 = (void *)objc_opt_new();
      -[BRCSyncContext session](self->super.super._syncContext, "session");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "expensiveReadOnlyDB");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      v10 = MEMORY[0x1E0C809B0];
      v25[0] = MEMORY[0x1E0C809B0];
      v25[1] = 3221225472;
      v25[2] = __100__BRCSharingProcessFolderSubitemsOperation__completeAfterProcessingClientTruthIfNecessaryWithError___block_invoke;
      v25[3] = &unk_1E8765CF8;
      v26 = v5;
      v11 = v6;
      v27 = v11;
      v12 = v7;
      v28 = v12;
      v13 = (void *)MEMORY[0x1D17A6DB0](v25);
      objc_msgSend(v9, "serialQueue");
      v14 = objc_claimAutoreleasedReturnValue();
      v20[0] = v10;
      v20[1] = 3221225472;
      v20[2] = __100__BRCSharingProcessFolderSubitemsOperation__completeAfterProcessingClientTruthIfNecessaryWithError___block_invoke_2;
      v20[3] = &unk_1E8763DF0;
      v20[4] = self;
      v21 = v9;
      v23 = v12;
      v24 = v13;
      v22 = v11;
      v15 = v12;
      v16 = v11;
      v17 = v13;
      v18 = v9;
      dispatch_async(v14, v20);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "brc_errorInvalidParameter:value:", CFSTR("zoneRowID"), 0);
      v18 = (id)objc_claimAutoreleasedReturnValue();
      -[_BRCOperation completedWithResult:error:](self, "completedWithResult:error:", 0, v18);
    }

    v4 = 1;
LABEL_9:

    return v4;
  }
  -[_BRCOperation completedWithResult:error:](self, "completedWithResult:error:", 0, a3);
  return 1;
}

void __100__BRCSharingProcessFolderSubitemsOperation__completeAfterProcessingClientTruthIfNecessaryWithError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  id v10;

  v10 = a2;
  v5 = a3;
  if (v10)
  {
    objc_msgSend(v5, "clientZone");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dbRowID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "br_isEqualToNumber:", *(_QWORD *)(a1 + 32));

    v9 = 48;
    if (v8)
      v9 = 40;
    objc_msgSend(*(id *)(a1 + v9), "addObject:", v10);
  }

}

void __100__BRCSharingProcessFolderSubitemsOperation__completeAfterProcessingClientTruthIfNecessaryWithError___block_invoke_2(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  uint64_t v7;
  void *v8;
  void *v9;
  BRCItemToPathLookup *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 552);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v17 != v5)
          objc_enumerationMutation(v2);
        v7 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 248), "session", (_QWORD)v16);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "itemByItemGlobalID:db:", v7, *(_QWORD *)(a1 + 40));
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        if (v9)
        {
          v10 = -[BRCItemToPathLookup initWithItem:]([BRCItemToPathLookup alloc], "initWithItem:", v9);
          -[BRCItemToPathLookup coordinatedReadURL](v10, "coordinatedReadURL");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = v11;
          if (v11)
          {
            v13 = v11;
          }
          else
          {
            -[BRCItemToPathLookup coordinatedWriteURL](v10, "coordinatedWriteURL");
            v13 = (id)objc_claimAutoreleasedReturnValue();
          }
          v14 = v13;

          (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
        }

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v4);
  }

  objc_msgSend(MEMORY[0x1E0CB35C8], "brc_errorFolderHasSharedSubitemsWithSharedByMeURLs:sharedToMeURLs:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "completedWithResult:error:", 0, v15);

}

- (id)computeURLForItemID:(id)a3 rootURL:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  NSObject *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  char v22;
  NSObject *v23;
  NSObject *v24;
  NSObject *v25;
  const char *v26;
  void *v27;
  void *v28;
  NSObject *v30;
  id v31;
  void *v32;
  void *v33;
  id v34;
  id v35;
  id v36;
  uint8_t buf[4];
  id v38;
  __int16 v39;
  NSObject *v40;
  __int16 v41;
  void *v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v31 = a4;
  -[BRCSyncContext session](self->super.super._syncContext, "session");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "serverDB");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "assertOnQueue");
  -[BRCClientZone dbRowID](self->_rootClientZone, "dbRowID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCClientZone dbRowID](self->_rootClientZone, "dbRowID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = v6;
  v10 = (void *)objc_msgSend(v7, "fetch:", CFSTR("WITH RECURSIVE item_parents (item_filename, item_parent_id) AS(    SELECT item_filename, item_parent_id FROM server_items      WHERE zone_rowid = %@ AND item_id = %@  UNION ALL     SELECT si.item_filename, si.item_parent_id FROM server_items AS si INNER JOIN item_parents AS p      WHERE si.item_id = p.item_parent_id        AND si.zone_rowid = %@) SELECT item_filename FROM item_parents"), v8, v6, v9);

  v11 = (void *)objc_opt_new();
  if (objc_msgSend(v10, "next"))
  {
    while (1)
    {
      objc_msgSend(v10, "stringAtIndex:", 0);
      v12 = objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        v13 = (void *)v12;
        objc_msgSend(v11, "insertObject:atIndex:", v12, 0);
        goto LABEL_20;
      }
      if (objc_msgSend(v11, "count"))
      {
        brc_bread_crumbs();
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v30 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
          -[BRCSharingProcessFolderSubitemsOperation computeURLForItemID:rootURL:].cold.2();
        goto LABEL_27;
      }
      v14 = (void *)objc_msgSend(v7, "stringWithSQL:", CFSTR("SELECT item_alias_target FROM server_items WHERE item_id = %@ AND zone_rowid = %@"), v33, self->_rootClientZone);
      if (!v14)
      {
        brc_bread_crumbs();
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v30 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
          -[BRCSharingProcessFolderSubitemsOperation computeURLForItemID:rootURL:].cold.1();
LABEL_27:
        v27 = v31;

        v28 = 0;
        goto LABEL_22;
      }
      v15 = v14;
      v35 = 0;
      v36 = 0;
      v34 = 0;
      v16 = objc_msgSend(v14, "parseUnsaltedBookmarkDataWithItemID:mangledID:error:", &v36, &v35, &v34);
      v17 = v34;
      if ((v16 & 1) == 0)
      {
        brc_bread_crumbs();
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412802;
          v38 = v15;
          v39 = 2112;
          v40 = v17;
          v41 = 2112;
          v42 = v19;
          _os_log_impl(&dword_1CBD43000, v23, OS_LOG_TYPE_DEFAULT, "[WARNING] Couldn't parse unsalted bookmark data %@ - %@%@", buf, 0x20u);
        }
        goto LABEL_18;
      }
      objc_msgSend(v32, "serverZoneByMangledID:", v35);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v18;
      if (v18)
        break;
      brc_bread_crumbs();
      v23 = objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v38 = v35;
        v39 = 2112;
        v40 = v23;
        v25 = v24;
        v26 = "[WARNING] Couldn't find server zone for %@%@";
LABEL_16:
        _os_log_impl(&dword_1CBD43000, v25, OS_LOG_TYPE_DEFAULT, v26, buf, 0x16u);
      }
LABEL_17:

LABEL_18:
      v22 = 0;
      v13 = 0;
LABEL_19:

      if ((v22 & 1) == 0)
      {
        v28 = 0;
        v27 = v31;
        goto LABEL_22;
      }
LABEL_20:

      if ((objc_msgSend(v10, "next") & 1) == 0)
        goto LABEL_21;
    }
    v20 = v36;
    objc_msgSend(v18, "dbRowID");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v7, "stringWithSQL:", CFSTR("SELECT item_filename FROM server_items WHERE item_id = %@ AND zone_rowid = %@"), v20, v21);

    if (v13)
    {
      objc_msgSend(v11, "insertObject:atIndex:", v13, 0);
      v22 = 1;
      goto LABEL_19;
    }
    brc_bread_crumbs();
    v23 = objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v24 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      goto LABEL_17;
    *(_DWORD *)buf = 138412546;
    v38 = v36;
    v39 = 2112;
    v40 = v23;
    v25 = v24;
    v26 = "[WARNING] No filename found on alias target %@%@";
    goto LABEL_16;
  }
LABEL_21:
  objc_msgSend(v11, "componentsJoinedByString:", CFSTR("/"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v31;
  objc_msgSend(v31, "URLByAppendingPathComponent:", v13);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_22:

  return v28;
}

- (BOOL)_completeAfterProcessingServerTruthIfNecessaryWithError:(id)a3
{
  void *v4;
  NSObject *v5;
  id v6;
  uint64_t v7;
  _QWORD v9[5];
  id v10;

  if (a3)
  {
    -[_BRCOperation completedWithResult:error:](self, "completedWithResult:error:", 0, a3);
  }
  else
  {
    if (!-[NSMutableArray count](self->_sharedServerSubitems, "count"))
    {
      if (self->_processType == 2)
      {
        LOBYTE(v7) = 0;
        return v7;
      }
      v7 = -[NSMutableArray count](self->_aliasItemsToDelete, "count");
      if (!v7)
        return v7;
    }
    -[BRCSyncContext session](self->super.super._syncContext, "session");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "serverTruthWorkloop");
    v5 = objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __100__BRCSharingProcessFolderSubitemsOperation__completeAfterProcessingServerTruthIfNecessaryWithError___block_invoke;
    v9[3] = &unk_1E875D470;
    v9[4] = self;
    v10 = v4;
    v6 = v4;
    dispatch_async(v5, v9);

  }
  LOBYTE(v7) = 1;
  return v7;
}

void __100__BRCSharingProcessFolderSubitemsOperation__completeAfterProcessingServerTruthIfNecessaryWithError___block_invoke(uint64_t a1)
{
  void (**v2)(_QWORD, _QWORD);
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[7];
  _QWORD v8[5];
  id v9;
  _QWORD v10[5];
  id v11;

  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x3032000000;
  v10[3] = __Block_byref_object_copy__44;
  v10[4] = __Block_byref_object_dispose__44;
  v11 = (id)objc_opt_new();
  v8[0] = 0;
  v8[1] = v8;
  v8[2] = 0x3032000000;
  v8[3] = __Block_byref_object_copy__44;
  v8[4] = __Block_byref_object_dispose__44;
  v9 = (id)objc_opt_new();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __100__BRCSharingProcessFolderSubitemsOperation__completeAfterProcessingServerTruthIfNecessaryWithError___block_invoke_321;
  v7[3] = &unk_1E8765D20;
  v7[4] = *(_QWORD *)(a1 + 32);
  v7[5] = v10;
  v7[6] = v8;
  v2 = (void (**)(_QWORD, _QWORD))MEMORY[0x1D17A6DB0](v7);
  objc_msgSend(*(id *)(a1 + 40), "appLibraryByRowID:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 608));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(v3, "absolutePath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fileURLWithPath:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  ((void (**)(_QWORD, void *))v2)[2](v2, v6);
  _Block_object_dispose(v8, 8);

  _Block_object_dispose(v10, 8);
}

void __100__BRCSharingProcessFolderSubitemsOperation__completeAfterProcessingServerTruthIfNecessaryWithError___block_invoke_321(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v4 = *(id *)(*(_QWORD *)(a1 + 32) + 560);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v24;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v24 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
        objc_msgSend(*(id *)(a1 + 32), "computeURLForItemID:rootURL:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v8), v3);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addObject:", v10);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    }
    while (v6);
  }

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v11 = *(id *)(*(_QWORD *)(a1 + 32) + 568);
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v20;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v20 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
        objc_msgSend(*(id *)(a1 + 32), "computeURLForItemID:rootURL:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v15), v3, (_QWORD)v19);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "addObject:", v17);

        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
    }
    while (v13);
  }

  objc_msgSend(MEMORY[0x1E0CB35C8], "brc_errorFolderHasSharedSubitemsWithSharedByMeURLs:sharedToMeURLs:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "completedWithResult:error:", 0, v18);

}

- (void)processServerItemsUnderItemID:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  id v12;
  id v13;
  _QWORD block[5];
  id v15;
  id v16;

  v6 = a3;
  v7 = a4;
  brc_bread_crumbs();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    -[BRCSharingProcessFolderSubitemsOperation processServerItemsUnderItemID:completion:].cold.1();

  -[BRCSyncContext session](self->super.super._syncContext, "session");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "clientTruthWorkloop");
  v11 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __85__BRCSharingProcessFolderSubitemsOperation_processServerItemsUnderItemID_completion___block_invoke;
  block[3] = &unk_1E875EB70;
  block[4] = self;
  v15 = v6;
  v16 = v7;
  v12 = v7;
  v13 = v6;
  dispatch_async(v11, block);

}

void __85__BRCSharingProcessFolderSubitemsOperation_processServerItemsUnderItemID_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned __int8 v10;
  int v11;
  NSObject *v12;
  uint64_t v13;
  id v14;
  void (**v15)(_QWORD);
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  _BOOL4 v21;
  void *v22;
  NSObject *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  char v28;
  char v29;
  void *v30;
  NSObject *v31;
  void *v32;
  id v33;
  void *v34;
  NSObject *v35;
  void *v36;
  NSObject *v37;
  void *v38;
  NSObject *v39;
  void *v40;
  NSObject *group;
  _QWORD block[5];
  id v43;
  _QWORD *v44;
  _QWORD v45[5];
  NSObject *v46;
  void (**v47)(_QWORD);
  _QWORD *v48;
  id v49;
  _QWORD v50[4];
  NSObject *v51;
  uint64_t v52;
  id v53;
  _QWORD *v54;
  _QWORD v55[5];
  id v56;
  uint8_t buf[4];
  id v58;
  __int16 v59;
  void *v60;
  __int16 v61;
  void *v62;
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v2 = a1 + 32;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 248), "session");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "clientDB");
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(*(_QWORD *)v2 + 592), "dbRowID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(*(_QWORD *)v2 + 592), "dbRowID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v40, "fetch:", CFSTR("WITH RECURSIVE item_children_needing_fetching (item_id, item_type, item_sharing_options, shared_alias_count, shared_children_count) AS(    SELECT item_id, item_type, item_sharing_options, shared_alias_count, shared_children_count FROM server_items      WHERE zone_rowid = %@ AND item_id = %@ AND (IFNULL(shared_children_count + shared_alias_count, 1) > 0)  UNION ALL     SELECT ip.item_id, ip.item_type, ip.item_sharing_options, ip.shared_alias_count, ip.shared_children_count FROM server_items AS ip INNER JOIN item_children_needing_fetching AS p       WHERE ip.item_parent_id = p.item_id        AND ip.zone_rowid = %@        AND ip.item_type IN (0, 9, 10, 1, 2, 8, 3)        AND ((IFNULL(ip.shared_children_count + ip.shared_alias_count, 1) > 0)            OR (ip.item_sharing_options & 4)            OR ip.item_type = 3)) SELECT item_id, item_type, item_sharing_options FROM item_children_needing_fetching WHERE item_type = 3 OR (item_sharing_options & 4)       OR (item_type IN (9, 10) AND (IFNULL(shared_children_count + shared_alias_count, 1) > 0))"), v4, v5, v6);

  group = dispatch_group_create();
  v55[0] = 0;
  v55[1] = v55;
  v55[2] = 0x3032000000;
  v55[3] = __Block_byref_object_copy__44;
  v55[4] = __Block_byref_object_dispose__44;
  v56 = 0;
  while (objc_msgSend(v7, "next"))
  {
    v8 = (void *)MEMORY[0x1D17A6BE8]();
    objc_msgSend(v7, "objectOfClass:atIndex:", objc_opt_class(), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v7, "intAtIndex:", 1);
    v11 = objc_msgSend(v7, "intAtIndex:", 2);
    v50[0] = MEMORY[0x1E0C809B0];
    v50[1] = 3221225472;
    v50[2] = __85__BRCSharingProcessFolderSubitemsOperation_processServerItemsUnderItemID_completion___block_invoke_2;
    v50[3] = &unk_1E87615D0;
    v12 = group;
    v13 = *(_QWORD *)(a1 + 32);
    v51 = v12;
    v52 = v13;
    v14 = v9;
    v53 = v14;
    v54 = v55;
    v15 = (void (**)(_QWORD))MEMORY[0x1D17A6DB0](v50);
    v16 = v11;
    if ((v11 & 4) != 0)
    {
      v24 = *(_QWORD *)(a1 + 32);
      if ((v11 & 0x48) != 0 && *(_QWORD *)(v24 + 544) != 2)
      {
        brc_bread_crumbs();
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v35 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
        {
          v36 = *(void **)(a1 + 40);
          *(_DWORD *)buf = 138412802;
          v58 = v14;
          v59 = 2112;
          v60 = v36;
          v61 = 2112;
          v62 = v34;
          _os_log_impl(&dword_1CBD43000, v35, OS_LOG_TYPE_DEFAULT, "[WARNING] subitem %@ is already shared inside %@%@", buf, 0x20u);
        }

        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 560), "addObject:", v14);
        goto LABEL_31;
      }
      objc_msgSend(*(id *)(v24 + 592), "serverZone");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 592), "serverZone");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "dbRowID");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend((id)v24, "deleteShareInfoFromZone:zoneRowID:itemID:sharingOptions:itemsTable:", v25, v27, v14, v16, CFSTR("server_items"));

      if ((v28 & 1) != 0)
        goto LABEL_31;
    }
    else
    {
      if (v10 == 3)
      {
        v17 = *(_QWORD *)(a1 + 32);
        if (*(_QWORD *)(v17 + 544) != 2)
        {
          objc_msgSend(*(id *)(v17 + 592), "serverItemByItemID:", v14);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "aliasTargetItemID");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "aliasTargetClientZone");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = objc_msgSend(v20, "serverRankByItemID:", v19) == 0;

          if (!v21)
            goto LABEL_31;
          v17 = *(_QWORD *)(a1 + 32);
        }
        if ((objc_msgSend(*(id *)(v17 + 568), "containsObject:", v14) & 1) == 0)
        {
          brc_bread_crumbs();
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v23 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
          {
            v38 = *(void **)(*(_QWORD *)(a1 + 32) + 600);
            *(_DWORD *)buf = 138412802;
            v58 = v14;
            v59 = 2112;
            v60 = v38;
            v61 = 2112;
            v62 = v22;
            _os_log_debug_impl(&dword_1CBD43000, v23, OS_LOG_TYPE_DEBUG, "[DEBUG] Found shared-to-me alias to delete %@ in %@%@", buf, 0x20u);
          }

          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 568), "addObject:", v14);
        }
        goto LABEL_31;
      }
      if (v10 - 9 > 1)
      {
        brc_bread_crumbs();
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v37 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 138412546;
          v58 = v14;
          v59 = 2112;
          v60 = v32;
          _os_log_fault_impl(&dword_1CBD43000, v37, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: Huh?  We shouldn't be processing this item if it's not shared and not a directory fault %@%@", buf, 0x16u);
        }

LABEL_30:
LABEL_31:
        v29 = 1;
        goto LABEL_32;
      }
      brc_bread_crumbs();
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412546;
        v58 = v14;
        v59 = 2112;
        v60 = v30;
        _os_log_debug_impl(&dword_1CBD43000, v31, OS_LOG_TYPE_DEBUG, "[DEBUG] We need to fetch %@ before we can continue%@", buf, 0x16u);
      }

      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 592), "fetchDirectoryContentsIfNecessary:isUserWaiting:rescheduleApplyScheduler:", v14, 1, 0);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v32)
      {
        v15[2](v15);
        goto LABEL_30;
      }
      v33 = *(id *)(a1 + 32);
      objc_sync_enter(v33);
      if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 584), "containsObject:", v32) & 1) == 0)
      {
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 584), "addObject:", v32);
        objc_sync_exit(v33);

        dispatch_group_enter(v12);
        objc_initWeak((id *)buf, v32);
        v45[0] = MEMORY[0x1E0C809B0];
        v45[1] = 3221225472;
        v45[2] = __85__BRCSharingProcessFolderSubitemsOperation_processServerItemsUnderItemID_completion___block_invoke_329;
        v45[3] = &unk_1E8765D48;
        v45[4] = *(_QWORD *)(a1 + 32);
        objc_copyWeak(&v49, (id *)buf);
        v48 = v55;
        v47 = v15;
        v46 = v12;
        objc_msgSend(v32, "addDirectoryListCompletionBlock:", v45);
        objc_msgSend(v32, "beginObservingChangesWithDelegate:", *(_QWORD *)(a1 + 32));

        objc_destroyWeak(&v49);
        objc_destroyWeak((id *)buf);
        goto LABEL_30;
      }
      objc_sync_exit(v33);

    }
    v29 = 0;
LABEL_32:

    objc_autoreleasePoolPop(v8);
    if ((v29 & 1) == 0)
      goto LABEL_35;
  }
  objc_msgSend(*(id *)(a1 + 32), "callbackQueue");
  v39 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __85__BRCSharingProcessFolderSubitemsOperation_processServerItemsUnderItemID_completion___block_invoke_331;
  block[3] = &unk_1E8765D70;
  block[4] = *(_QWORD *)(a1 + 32);
  v43 = *(id *)(a1 + 48);
  v44 = v55;
  dispatch_group_notify(group, v39, block);

LABEL_35:
  _Block_object_dispose(v55, 8);

}

void __85__BRCSharingProcessFolderSubitemsOperation_processServerItemsUnderItemID_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  id v7;
  uint64_t v8;

  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __85__BRCSharingProcessFolderSubitemsOperation_processServerItemsUnderItemID_completion___block_invoke_3;
  v5[3] = &unk_1E875E768;
  v3 = *(_QWORD *)(a1 + 48);
  v2 = *(_QWORD *)(a1 + 56);
  v4 = *(void **)(a1 + 32);
  v6 = *(id *)(a1 + 40);
  v8 = v2;
  v7 = v4;
  objc_msgSend(v6, "processServerItemsUnderItemID:completion:", v3, v5);

}

void __85__BRCSharingProcessFolderSubitemsOperation_processServerItemsUnderItemID_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v4;
  uint64_t v5;
  id *v6;
  uint64_t v7;
  id v8;

  v8 = a2;
  if (v8)
  {
    v4 = *(id *)(a1 + 32);
    objc_sync_enter(v4);
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v7 = *(_QWORD *)(v5 + 40);
    v6 = (id *)(v5 + 40);
    if (!v7)
      objc_storeStrong(v6, a2);
    objc_sync_exit(v4);

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));

}

void __85__BRCSharingProcessFolderSubitemsOperation_processServerItemsUnderItemID_completion___block_invoke_329(uint64_t a1, void *a2)
{
  id v4;
  void *v5;
  id WeakRetained;
  id v7;
  uint64_t v8;
  id *v9;
  uint64_t v10;
  id v11;

  v11 = a2;
  v4 = *(id *)(a1 + 32);
  objc_sync_enter(v4);
  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 584);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  objc_msgSend(v5, "removeObject:", WeakRetained);

  objc_sync_exit(v4);
  if (v11)
  {
    v7 = *(id *)(a1 + 32);
    objc_sync_enter(v7);
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v10 = *(_QWORD *)(v8 + 40);
    v9 = (id *)(v8 + 40);
    if (!v10)
      objc_storeStrong(v9, a2);
    objc_sync_exit(v7);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));

}

void __85__BRCSharingProcessFolderSubitemsOperation_processServerItemsUnderItemID_completion___block_invoke_331(uint64_t a1)
{
  id obj;

  obj = *(id *)(a1 + 32);
  objc_sync_enter(obj);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  objc_sync_exit(obj);

}

- (void)processServerTruthWithCompletion:(id)a3
{
  -[BRCSharingProcessFolderSubitemsOperation processServerItemsUnderItemID:completion:](self, "processServerItemsUnderItemID:completion:", self->_rootItemID, a3);
}

- (BOOL)deleteShareInfoFromZone:(id)a3 zoneRowID:(id)a4 itemID:(id)a5 sharingOptions:(unint64_t)a6 itemsTable:(id)a7
{
  char v8;
  id v12;
  id v13;
  BRCSyncContext *syncContext;
  id v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  unsigned __int8 v24;
  char v25;
  id v26;
  void *v27;
  void *v28;
  uint64_t v29;
  NSObject *v30;
  BOOL v31;
  id v32;
  void *v33;
  void *v34;
  BRCShareDeleteInfo *v35;
  void *v36;
  NSObject *v37;
  const char *v39;
  char v40;
  void *v41;
  uint8_t buf[4];
  const char *v43;
  __int16 v44;
  void *v45;
  __int16 v46;
  void *v47;
  uint64_t v48;

  v8 = a6;
  v48 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a5;
  syncContext = self->super.super._syncContext;
  v15 = a7;
  v16 = a4;
  -[BRCSyncContext session](syncContext, "session");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "clientDB");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = objc_alloc(MEMORY[0x1E0C95070]);
  objc_msgSend(v12, "zoneID");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(v19, "initShareIDWithItemID:zoneID:", v13, v20);

  objc_msgSend(MEMORY[0x1E0DE81D8], "nameWithString:", v15);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = (void *)objc_msgSend(v18, "fetch:", CFSTR("SELECT item_type, item_stat_ckinfo, version_ckinfo from %@ WHERE item_id = %@ AND zone_rowid = %@"), v22, v13, v16);
  if (!objc_msgSend(v23, "next"))
  {
    brc_bread_crumbs();
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_FAULT))
      -[BRCSharingProcessFolderSubitemsOperation deleteShareInfoFromZone:zoneRowID:itemID:sharingOptions:itemsTable:].cold.2();
    goto LABEL_7;
  }
  v24 = objc_msgSend(v23, "intAtIndex:", 0);
  v25 = v24;
  if (v24 > 0xAu)
  {
LABEL_15:
    brc_bread_crumbs();
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_FAULT))
      -[BRCSharingProcessFolderSubitemsOperation deleteShareInfoFromZone:zoneRowID:itemID:sharingOptions:itemsTable:].cold.1(v25, (uint64_t)v28, v30);
LABEL_7:
    v31 = 0;
    goto LABEL_14;
  }
  v40 = v8;
  v41 = v18;
  if (((1 << v24) & 0x611) == 0)
  {
    if (((1 << v24) & 0x106) != 0)
    {
      v32 = objc_alloc(MEMORY[0x1E0C95048]);
      objc_msgSend(v12, "zoneID");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "contentsRecordIDInZoneID:", v27);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = (void *)objc_msgSend(v32, "initWithRecordType:recordID:", CFSTR("content"), v33);

      v29 = 2;
      goto LABEL_10;
    }
    goto LABEL_15;
  }
  v26 = objc_alloc(MEMORY[0x1E0C95048]);
  objc_msgSend(v13, "directoryStructureRecordIDInZone:", v12);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = (void *)objc_msgSend(v26, "initWithRecordType:recordID:", CFSTR("structure"), v27);
  v29 = 1;
LABEL_10:

  objc_msgSend(v23, "objectOfClass:atIndex:", objc_opt_class(), v29);
  v30 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "serializeSystemFields:", v30);
  v34 = v21;
  v35 = -[BRCShareDeleteInfo initWithShareID:emptyRecord:]([BRCShareDeleteInfo alloc], "initWithShareID:emptyRecord:", v21, v28);
  brc_bread_crumbs();
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v37 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
  {
    v39 = "full";
    *(_DWORD *)buf = 136315650;
    if ((v40 & 0x48) == 0)
      v39 = "empty";
    v43 = v39;
    v44 = 2112;
    v45 = v34;
    v46 = 2112;
    v47 = v36;
    _os_log_debug_impl(&dword_1CBD43000, v37, OS_LOG_TYPE_DEBUG, "[DEBUG] deleting %s shareID %@%@", buf, 0x20u);
  }

  if ((-[NSMutableArray containsObject:](self->_shareIDsToDelete, "containsObject:", v35) & 1) == 0)
    -[NSMutableArray addObject:](self->_shareIDsToDelete, "addObject:", v35);

  v31 = 1;
  v21 = v34;
  v18 = v41;
LABEL_14:

  return v31;
}

- (void)processClientTruthWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  id v16;

  v4 = a3;
  -[BRCSyncContext session](self->super.super._syncContext, "session");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "clientDB");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  brc_bread_crumbs();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[BRCSharingProcessFolderSubitemsOperation processClientTruthWithCompletion:].cold.1();

  objc_msgSend(v5, "clientTruthWorkloop");
  v9 = objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __77__BRCSharingProcessFolderSubitemsOperation_processClientTruthWithCompletion___block_invoke;
  v13[3] = &unk_1E875DDA0;
  v13[4] = self;
  v14 = v6;
  v15 = v5;
  v16 = v4;
  v10 = v4;
  v11 = v5;
  v12 = v6;
  dispatch_async(v9, v13);

}

void __77__BRCSharingProcessFolderSubitemsOperation_processClientTruthWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[5];
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 248), "session");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "itemByRowID:db:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 520), *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "asDirectory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  v5 = *(void **)(a1 + 48);
  v6 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __77__BRCSharingProcessFolderSubitemsOperation_processClientTruthWithCompletion___block_invoke_2;
  v11[3] = &unk_1E8765D98;
  v11[4] = *(_QWORD *)(a1 + 32);
  v7 = v4;
  v12 = v7;
  v13 = &v14;
  objc_msgSend(v5, "enumerateItemsWithShareIDUnderParent:block:", v7, v11);
  if (*((_BYTE *)v15 + 24))
  {
    v8 = *(void **)(*(_QWORD *)(a1 + 32) + 592);
    v9[0] = v6;
    v9[1] = 3221225472;
    v9[2] = __77__BRCSharingProcessFolderSubitemsOperation_processClientTruthWithCompletion___block_invoke_343;
    v9[3] = &unk_1E875FD48;
    v10 = *(id *)(a1 + 56);
    objc_msgSend(v8, "waitForCrossZoneMoveProcessingWithCompletion:", v9);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }

  _Block_object_dispose(&v14, 8);
}

void __77__BRCSharingProcessFolderSubitemsOperation_processClientTruthWithCompletion___block_invoke_2(_QWORD *a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;
  void *v8;
  void *v9;
  int v10;
  _QWORD *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  void *v23;
  NSObject *v24;
  int v25;
  id v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  if ((a3 & 4) == 0)
  {
    brc_bread_crumbs();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
      __77__BRCSharingProcessFolderSubitemsOperation_processClientTruthWithCompletion___block_invoke_2_cold_1();

  }
  if ((a3 & 0x48) != 0 && *(_QWORD *)(a1[4] + 544) != 2)
  {
    brc_bread_crumbs();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v20 = a1[5];
      v25 = 138412802;
      v26 = v7;
      v27 = 2112;
      v28 = v20;
      v29 = 2112;
      v30 = v18;
      _os_log_impl(&dword_1CBD43000, v19, OS_LOG_TYPE_DEFAULT, "[WARNING] subitem %@ is already shared inside %@%@", (uint8_t *)&v25, 0x20u);
    }

    objc_msgSend(*(id *)(a1[4] + 552), "addObject:", v7);
    v21 = a1[4];
    v22 = *(_QWORD *)(v21 + 536);
    *(_QWORD *)(v21 + 536) = v22 - 1;
    if (v22 <= 1)
      *a4 = 1;
  }
  else
  {
    objc_msgSend(v7, "zoneRowID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1[4] + 592), "dbRowID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "br_isEqualToNumber:", v9);

    v11 = (_QWORD *)a1[4];
    v12 = (void *)v11[74];
    if (v10)
    {
      objc_msgSend(v12, "serverZone");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "zoneRowID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "itemID");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "deleteShareInfoFromZone:zoneRowID:itemID:sharingOptions:itemsTable:", v13, v14, v15, a3, CFSTR("client_items"));

    }
    else
    {
      objc_msgSend(v12, "session");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "itemByItemGlobalID:", v7);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(*(id *)(a1[4] + 592), "itemMovedIntoShareInThisZone:associatedItemID:", v17, 0);
      *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 1;

    }
  }

}

uint64_t __77__BRCSharingProcessFolderSubitemsOperation_processClientTruthWithCompletion___block_invoke_343(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)main
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_15_0();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] Not processing child items on %@ because it already has a shareID%@");
  OUTLINED_FUNCTION_2();
}

uint64_t __48__BRCSharingProcessFolderSubitemsOperation_main__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  void *v4;
  _QWORD v5[5];

  result = objc_msgSend(*(id *)(a1 + 32), "_completeAfterProcessingClientTruthIfNecessaryWithError:", a2);
  if ((result & 1) == 0)
  {
    v4 = *(void **)(a1 + 32);
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __48__BRCSharingProcessFolderSubitemsOperation_main__block_invoke_2;
    v5[3] = &unk_1E875D850;
    v5[4] = v4;
    return objc_msgSend(v4, "processServerTruthWithCompletion:", v5);
  }
  return result;
}

uint64_t __48__BRCSharingProcessFolderSubitemsOperation_main__block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  void *v4;
  _QWORD v5[5];

  result = objc_msgSend(*(id *)(a1 + 32), "_completeAfterProcessingServerTruthIfNecessaryWithError:", a2);
  if ((result & 1) == 0)
  {
    v4 = *(void **)(a1 + 32);
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __48__BRCSharingProcessFolderSubitemsOperation_main__block_invoke_3;
    v5[3] = &unk_1E875D850;
    v5[4] = v4;
    return objc_msgSend(v4, "removeSharedSubitemsWithCompletion:", v5);
  }
  return result;
}

void __48__BRCSharingProcessFolderSubitemsOperation_main__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 592);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __48__BRCSharingProcessFolderSubitemsOperation_main__block_invoke_4;
  v7[3] = &unk_1E875D470;
  v7[4] = v4;
  v8 = v3;
  v6 = v3;
  objc_msgSend(v5, "waitForCrossZoneMoveProcessingWithCompletion:", v7);

}

uint64_t __48__BRCSharingProcessFolderSubitemsOperation_main__block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "completedWithResult:error:", 0, *(_QWORD *)(a1 + 40));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appLibraryRowID, 0);
  objc_storeStrong((id *)&self->_rootItemID, 0);
  objc_storeStrong((id *)&self->_rootClientZone, 0);
  objc_storeStrong((id *)&self->_activeListOperations, 0);
  objc_storeStrong((id *)&self->_shareIDsToDelete, 0);
  objc_storeStrong((id *)&self->_aliasItemsToDelete, 0);
  objc_storeStrong((id *)&self->_sharedServerSubitems, 0);
  objc_storeStrong((id *)&self->_sharedClientSubitems, 0);
}

- (void)removeSharedSubitemsWithCompletion:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] Removing shared subitems in op %@%@");
  OUTLINED_FUNCTION_2();
}

void __79__BRCSharingProcessFolderSubitemsOperation_removeSharedSubitemsWithCompletion___block_invoke_308_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] Remove share subitems batch completed with error - %@%@");
  OUTLINED_FUNCTION_2();
}

- (void)computeURLForItemID:rootURL:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] Can't find alias target for %@%@");
  OUTLINED_FUNCTION_2();
}

- (void)computeURLForItemID:rootURL:.cold.2()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_4_0();
  _os_log_debug_impl(&dword_1CBD43000, v0, OS_LOG_TYPE_DEBUG, "[DEBUG] an item in the path has a nil filename%@", v1, 0xCu);
  OUTLINED_FUNCTION_2();
}

- (void)processServerItemsUnderItemID:completion:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] Processing server truth in op %@%@");
  OUTLINED_FUNCTION_2();
}

- (void)deleteShareInfoFromZone:(os_log_t)log zoneRowID:itemID:sharingOptions:itemsTable:.cold.1(char a1, uint64_t a2, os_log_t log)
{
  _DWORD v3[2];
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3[0] = 67109378;
  v3[1] = a1;
  v4 = 2112;
  v5 = a2;
  _os_log_fault_impl(&dword_1CBD43000, log, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: Don't know how to unshare item of type %d%@", (uint8_t *)v3, 0x12u);
  OUTLINED_FUNCTION_2();
}

- (void)deleteShareInfoFromZone:zoneRowID:itemID:sharingOptions:itemsTable:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] UNREACHABLE: Can't locate the item type we are deleting?%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)processClientTruthWithCompletion:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] Processing client truth in op %@%@");
  OUTLINED_FUNCTION_2();
}

void __77__BRCSharingProcessFolderSubitemsOperation_processClientTruthWithCompletion___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: (options & BRCSharingItemHasShareID) != 0%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

@end
