@implementation BRCDirectoryItem

- (BOOL)containsFault
{
  id v2;
  char v3;

  v2 = -[PQLConnection numberWithSQL:](self->super._db, "numberWithSQL:", CFSTR("SELECT faults_count FROM item_recursive_properties WHERE item_rowid = %llu"), self->super._dbRowID);
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (BOOL)containsPendingDownload
{
  id v2;
  char v3;

  v2 = -[PQLConnection numberWithSQL:](self->super._db, "numberWithSQL:", CFSTR("SELECT 1 FROM item_recursive_properties WHERE item_rowid = %llu AND (needs_download_count != 0 OR needs_dl_unstage_count != 0)"), self->super._dbRowID);
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (BOOL)updateFromFSAtPath:(id)a3 parentGlobalID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  BOOL v12;
  void *v13;
  void *v15;
  NSObject *v16;
  objc_super v17;

  v6 = a3;
  v7 = a4;
  if (_relocationCheck(self, v7))
  {
    if (objc_msgSend(v6, "type") == 3)
    {
      objc_msgSend(v6, "appLibrary");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v8, "isiCloudDesktopAppLibrary") & 1) == 0)
      {
        brc_bread_crumbs();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
          -[BRCDirectoryItem(LegacyAdditions) updateFromFSAtPath:parentGlobalID:].cold.2();

      }
      if (!-[BRCLocalItem isFSRoot](self, "isFSRoot"))
      {
        objc_msgSend(v8, "fetchRootItem");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
        {
          brc_bread_crumbs();
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v11 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
            -[BRCDirectoryItem(LegacyAdditions) updateFromFSAtPath:parentGlobalID:].cold.1();

        }
        -[BRCStatInfo setType:](self->super._st, "setType:", 4);

      }
      objc_msgSend(v8, "updateFromFSAtPath:", v6);
    }
    else
    {
      if (!-[BRCLocalItem isFSRoot](self, "isFSRoot"))
      {
LABEL_16:
        v17.receiver = self;
        v17.super_class = (Class)BRCDirectoryItem;
        v12 = -[BRCLocalItem updateFromFSAtPath:parentGlobalID:](&v17, sel_updateFromFSAtPath_parentGlobalID_, v6, v7);
        goto LABEL_17;
      }
      -[BRCLocalItem appLibrary](self, "appLibrary");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[BRCStatInfo setType:](self->super._st, "setType:", 0);
      if (objc_msgSend(v8, "isiCloudDesktopAppLibrary"))
      {
        objc_msgSend(v6, "appLibrary");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "fsrootDidMoveToPath:", v6);

      }
    }

    goto LABEL_16;
  }
  v12 = 0;
LABEL_17:

  return v12;
}

- (BOOL)updateLocationAndMetaFromFSAtPath:(id)a3 parentGlobalID:(id)a4
{
  id v6;
  id v7;
  BOOL v8;
  objc_super v10;

  v6 = a3;
  v7 = a4;
  if (_relocationCheck(self, v7))
  {
    v10.receiver = self;
    v10.super_class = (Class)BRCDirectoryItem;
    v8 = -[BRCLocalItem updateLocationAndMetaFromFSAtPath:parentGlobalID:](&v10, sel_updateLocationAndMetaFromFSAtPath_parentGlobalID_, v6, v7);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)_initWithRelativePath:(id)a3 parentGlobalID:(id)a4
{
  id v6;
  _QWORD *v7;
  objc_super v9;

  v6 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BRCDirectoryItem;
  v7 = -[BRCLocalItem _initWithRelativePath:parentGlobalID:](&v9, sel__initWithRelativePath_parentGlobalID_, v6, a4);
  if (v7)
    v7[25] = objc_msgSend(v6, "modificationTime");

  return v7;
}

- (BOOL)hasLostChildren
{
  BRCPQLConnection *db;
  BRCItemID *itemID;
  void *v4;
  id v5;

  db = self->super._db;
  itemID = self->super._itemID;
  -[BRCClientZone dbRowID](self->super._clientZone, "dbRowID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[PQLConnection numberWithSQL:](db, "numberWithSQL:", CFSTR("SELECT 1 FROM client_items WHERE item_parent_id = %@    AND item_state IN (-1, -3)   AND item_parent_zone_rowid = %@ LIMIT 1"), itemID, v4);

  LOBYTE(v4) = objc_msgSend(v5, "BOOLValue");
  return (char)v4;
}

- (BOOL)hasPendingLostChildren
{
  BRCPQLConnection *db;
  void *v4;
  id v5;

  db = self->super._db;
  -[BRCClientZone dbRowID](self->super._clientZone, "dbRowID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[PQLConnection numberWithSQL:](db, "numberWithSQL:", CFSTR("SELECT 1 FROM mark_children_lost_progress WHERE zone_rowid = %@ AND item_parent_id = %@ LIMIT 1"), v4, self->super._itemID);

  LOBYTE(db) = objc_msgSend(v5, "BOOLValue");
  return (char)db;
}

- (BOOL)markChildrenLost
{
  void *v3;
  BRCItemID *itemID;
  BRCClientZone *clientZone;
  void *v6;

  -[BRCLocalItem appLibrary](self, "appLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  itemID = self->super._itemID;
  clientZone = self->super._clientZone;
  -[BRCLocalItem fileID](self, "fileID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(itemID) = objc_msgSend(v3, "markChildrenLostForItemID:inZone:fileID:", itemID, clientZone, v6);

  return (char)itemID;
}

- (BOOL)_markChildrenLostForDeadParent
{
  BRCDirectoryItem *v2;
  void *v3;

  v2 = self;
  -[BRCLocalItem appLibrary](self, "appLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = objc_msgSend(v3, "markChildrenLostForItemID:inZone:fileID:", v2->super._itemID, v2->super._clientZone, 0);

  return (char)v2;
}

- (void)_markLostDirectoryAsAlmostDead
{
  void *v3;
  NSObject *v4;

  if (!-[BRCLocalItem isLost](self, "isLost"))
  {
    brc_bread_crumbs();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
      -[BRCDirectoryItem(LegacyAdditions) _markLostDirectoryAsAlmostDead].cold.1();

  }
  -[BRCLocalItem _removeSharedSpotlightAttributesIfNecessary](self, "_removeSharedSpotlightAttributesIfNecessary");
  -[BRCLocalStatInfo _markAlmostDead](self->super._st, "_markAlmostDead");
  self->super._isUserVisible = 0;
}

- (void)markRemovedFromFilesystemForServerEdit:(BOOL)a3
{
  void *v4;
  BOOL v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v11;
  objc_super v12;

  if (a3)
  {
    if (-[BRCLocalItem isReserved](self, "isReserved"))
    {
      -[BRCLocalItem markLostWhenReplacedByItem:](self, "markLostWhenReplacedByItem:", 0);
      -[BRCLocalItem moveAsideLocally](self, "moveAsideLocally");
      -[BRCDirectoryItem _markLostDirectoryAsAlmostDead](self, "_markLostDirectoryAsAlmostDead");
    }
    else
    {
      -[BRCLocalItem markRemovedFromFilesystemForServerEdit:](&v11, sel_markRemovedFromFilesystemForServerEdit_, 1, self, BRCDirectoryItem, v12.receiver, v12.super_class);
    }
    return;
  }
  if (-[BRCDirectoryItem containsDirFault](self, "containsDirFault"))
  {
    -[BRCStatInfo ckInfo](self->super._st, "ckInfo");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "hasDeletionChangeToken"))
    {
LABEL_10:

      goto LABEL_11;
    }
    v5 = -[BRCLocalItem isSharedToMeTopLevelItem](self, "isSharedToMeTopLevelItem");

    if (!v5)
    {
      brc_bread_crumbs();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
        -[BRCDirectoryItem(LegacyAdditions) markRemovedFromFilesystemForServerEdit:].cold.1((uint64_t)self, (uint64_t)v6, v7);

      -[BRCServerZone changeState](self->super._serverZone, "changeState");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "changeToken");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "data");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[BRCStatInfo ckInfo](self->super._st, "ckInfo");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setDeletionChangeToken:", v9);

      goto LABEL_10;
    }
  }
LABEL_11:
  if (-[BRCDirectoryItem hasPendingLostChildren](self, "hasPendingLostChildren")
    || -[BRCDirectoryItem _markChildrenLostForDeadParent](self, "_markChildrenLostForDeadParent")
    || -[BRCDirectoryItem hasLostChildren](self, "hasLostChildren")
    || -[BRCLocalItem isSharedToMeChildItem](self, "isSharedToMeChildItem")
    && !-[BRCLocalItem isAlmostDead](self, "isAlmostDead"))
  {
    -[BRCLocalItem markLostClearGenerationID:backoffMode:](self, "markLostClearGenerationID:backoffMode:", 1, 2);
    -[BRCDirectoryItem _markLostDirectoryAsAlmostDead](self, "_markLostDirectoryAsAlmostDead");
  }
  else
  {
    -[BRCLocalItem markRemovedFromFilesystemForServerEdit:](&v12, sel_markRemovedFromFilesystemForServerEdit_, 0, v11.receiver, v11.super_class, self, BRCDirectoryItem);
  }
}

- (BOOL)changedAtRelativePath:(id)a3 scanPackage:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  BOOL v11;
  objc_super v13;
  uint64_t v14[3];
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  BRCDirectoryItem *v18;
  __int16 v19;
  id v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v4 = a4;
  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  memset(v14, 0, sizeof(v14));
  __brc_create_section(0, (uint64_t)"-[BRCDirectoryItem(LegacyAdditions) changedAtRelativePath:scanPackage:]", 196, v14);
  brc_bread_crumbs();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218754;
    v16 = v14[0];
    v17 = 2112;
    v18 = self;
    v19 = 2112;
    v20 = v6;
    v21 = 2112;
    v22 = v7;
    _os_log_debug_impl(&dword_1CBD43000, v8, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx diffing item %@\nagainst %@%@", buf, 0x2Au);
  }

  if ((objc_msgSend(v6, "isDocument") & 1) != 0 || objc_msgSend(v6, "isBRAlias"))
  {
    brc_bread_crumbs();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      -[BRCDirectoryItem(LegacyAdditions) changedAtRelativePath:scanPackage:].cold.1();
    v11 = 1;
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)BRCDirectoryItem;
    if (-[BRCLocalItem changedAtRelativePath:scanPackage:](&v13, sel_changedAtRelativePath_scanPackage_, v6, v4))
    {
      v11 = 1;
      goto LABEL_9;
    }
    brc_bread_crumbs();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      -[BRCDirectoryItem(LegacyAdditions) changedAtRelativePath:scanPackage:].cold.2();
    v11 = 0;
  }

LABEL_9:
  __brc_leave_section(v14);

  return v11;
}

- (BOOL)evictInTask:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  id v8;
  _BOOL4 v9;
  BRCTreeEnumerator *v10;
  BRCItemID *itemID;
  void *v12;
  _QWORD v14[4];
  id v15;
  unint64_t v16;
  objc_super v17;

  v8 = a3;
  v17.receiver = self;
  v17.super_class = (Class)BRCDirectoryItem;
  v9 = -[BRCLocalItem evictInTask:options:error:](&v17, sel_evictInTask_options_error_, v8, a4, a5);
  if (v9)
  {
    v10 = -[BRCTreeEnumerator initWithSession:tracker:]([BRCTreeEnumerator alloc], "initWithSession:tracker:", self->super._session, v8);
    itemID = self->super._itemID;
    -[BRCLocalItem appLibrary](self, "appLibrary");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __63__BRCDirectoryItem_LegacyAdditions__evictInTask_options_error___block_invoke;
    v14[3] = &unk_1E875D940;
    v15 = v8;
    v16 = a4;
    -[BRCTreeEnumerator enumerateBelow:appLibrary:recursively:handler:](v10, "enumerateBelow:appLibrary:recursively:handler:", itemID, v12, 1, v14);

  }
  return v9;
}

uint64_t __63__BRCDirectoryItem_LegacyAdditions__evictInTask_options_error___block_invoke(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "evictInTask:options:error:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), 0);
  return 0;
}

- (BOOL)startDownloadInTask:(id)a3 options:(unint64_t)a4 etagIfLoser:(id)a5 stageFileName:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  NSObject *v16;
  _BOOL4 v17;
  void *v18;
  void *v19;
  void *v20;
  BRCTreeEnumerator *v21;
  BRCItemID *itemID;
  void *v23;
  uint64_t v24;
  id v25;
  void *v27;
  NSObject *v28;
  _QWORD v29[4];
  id v30;
  unint64_t v31;
  _QWORD v32[4];
  id v33;
  id v34;
  unint64_t v35;
  objc_super v36;

  v12 = a3;
  v13 = a5;
  v14 = a6;
  if (!v14)
  {
    if (v12)
      goto LABEL_6;
    goto LABEL_3;
  }
  brc_bread_crumbs();
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v28 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT))
    -[BRCDirectoryItem(LegacyAdditions) startDownloadInTask:options:etagIfLoser:stageFileName:error:].cold.2();

  if (!v12)
  {
LABEL_3:
    brc_bread_crumbs();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
      -[BRCDirectoryItem(LegacyAdditions) startDownloadInTask:options:etagIfLoser:stageFileName:error:].cold.1();

  }
LABEL_6:
  v36.receiver = self;
  v36.super_class = (Class)BRCDirectoryItem;
  v17 = -[BRCLocalItem startDownloadInTask:options:etagIfLoser:stageFileName:error:](&v36, sel_startDownloadInTask_options_etagIfLoser_stageFileName_error_, v12, a4, v13, v14, a7);
  if (v17)
  {
    -[BRCLocalItem appLibrary](self, "appLibrary");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "transferSyncContext");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "downloadStream");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if ((a4 & 8) != 0)
      objc_msgSend(v20, "startSchedulingMultipleItemsInteractively");
    v21 = -[BRCTreeEnumerator initWithSession:tracker:]([BRCTreeEnumerator alloc], "initWithSession:tracker:", self->super._session, v12);
    itemID = self->super._itemID;
    -[BRCLocalItem appLibrary](self, "appLibrary");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = MEMORY[0x1E0C809B0];
    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v32[2] = __97__BRCDirectoryItem_LegacyAdditions__startDownloadInTask_options_etagIfLoser_stageFileName_error___block_invoke;
    v32[3] = &unk_1E875D968;
    v33 = v12;
    v35 = a4;
    v34 = v14;
    -[BRCTreeEnumerator enumerateBelow:appLibrary:recursively:handler:](v21, "enumerateBelow:appLibrary:recursively:handler:", itemID, v23, 1, v32);

    v29[0] = v24;
    v29[1] = 3221225472;
    v29[2] = __97__BRCDirectoryItem_LegacyAdditions__startDownloadInTask_options_etagIfLoser_stageFileName_error___block_invoke_2;
    v29[3] = &unk_1E875D990;
    v30 = v20;
    v31 = a4;
    v25 = v20;
    -[BRCTreeEnumerator setCompletionHandler:](v21, "setCompletionHandler:", v29);

  }
  return v17;
}

uint64_t __97__BRCDirectoryItem_LegacyAdditions__startDownloadInTask_options_etagIfLoser_stageFileName_error___block_invoke(_QWORD *a1, void *a2)
{
  objc_msgSend(a2, "startDownloadInTask:options:etagIfLoser:stageFileName:error:", a1[4], a1[6], 0, a1[5], 0);
  return 0;
}

uint64_t __97__BRCDirectoryItem_LegacyAdditions__startDownloadInTask_options_etagIfLoser_stageFileName_error___block_invoke_2(uint64_t result)
{
  if ((*(_BYTE *)(result + 40) & 8) != 0)
    return objc_msgSend(*(id *)(result + 32), "endSchedulingMultipleItemsInteractively");
  return result;
}

- (id)folderRootStructureRecord
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;

  if (-[BRCDirectoryItem isDirectory](self, "isDirectory"))
  {
    -[BRCLocalItem itemID](self, "itemID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "structureRecordIDForItemType:zone:aliasTargetZoneIsShared:", -[BRCStatInfo type](self->super._st, "type"), self->super._serverZone, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C95048]), "initWithRecordType:recordID:", CFSTR("structure"), v4);
  }
  else
  {
    brc_bread_crumbs();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      -[BRCDirectoryItem(CKConversions) folderRootStructureRecord].cold.1();

    v5 = 0;
  }
  return v5;
}

- (id)folderAppLibraryRootRecord
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  -[BRCLocalItem clientZone](self, "clientZone");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isPrivateZone") & 1) == 0)
  {

    goto LABEL_5;
  }
  -[BRCLocalItem appLibrary](self, "appLibrary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "wasMovedToCloudDocs");

  if (!v5)
  {
LABEL_5:
    v12 = (void *)MEMORY[0x1E0C95048];
    -[BRCLocalItem structureRecordID](self, "structureRecordID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "zoneID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "rootDirectoryRecordForZoneID:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  v6 = (void *)MEMORY[0x1E0C95048];
  -[BRCLocalItem appLibrary](self, "appLibrary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "mangledID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCLocalItem structureRecordID](self, "structureRecordID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "zoneID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "rootAppLibraryRecordForAppLibraryID:zoneID:", v8, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_6:
  return v11;
}

- (BOOL)isDirectory
{
  unsigned int v2;
  void *v4;
  NSObject *v5;

  v2 = -[BRCStatInfo type](self->super._st, "type");
  if (v2 > 0xA || ((1 << v2) & 0x611) == 0)
  {
    brc_bread_crumbs();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      -[BRCDirectoryItem isDirectory].cold.1();

  }
  return 1;
}

- (BOOL)isDirectoryFault
{
  unsigned int v3;
  void *v5;
  NSObject *v6;
  BOOL v7;
  void *v8;

  v3 = -[BRCStatInfo type](self->super._st, "type");
  if (v3 > 0xA || ((1 << v3) & 0x611) == 0)
  {
    brc_bread_crumbs();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      -[BRCDirectoryItem isDirectory].cold.1();

  }
  if ((-[BRCStatInfo type](self->super._st, "type") - 9) < 2u)
    return 1;
  if (!-[BRCLocalItem isFSRoot](self, "isFSRoot"))
    return 0;
  -[BRCLocalItem appLibrary](self, "appLibrary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (objc_msgSend(v8, "state") & 0x2000000) == 0;

  return v7;
}

- (BOOL)isDirectoryWithPackageName
{
  unsigned int v3;
  void *v5;
  NSObject *v6;
  void *v7;
  char v8;

  v3 = -[BRCStatInfo type](self->super._st, "type");
  if (v3 > 0xA || ((1 << v3) & 0x611) == 0)
  {
    brc_bread_crumbs();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      -[BRCDirectoryItem isDirectory].cold.1();

  }
  -[BRCLocalStatInfo logicalNameWithoutLocalBounce](self->super._st, "logicalNameWithoutLocalBounce");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "br_isPackageRoot");

  return v8;
}

- (unint64_t)diffAgainstServerItem:(id)a3
{
  id v4;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  unint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  int64_t v14;
  unint64_t v15;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)BRCDirectoryItem;
  v5 = -[BRCLocalItem diffAgainstServerItem:](&v17, sel_diffAgainstServerItem_, v4);
  if (-[BRCDirectoryItem isDirectoryWithPackageName](self, "isDirectoryWithPackageName"))
  {
    -[BRCLocalStatInfo logicalName](self->super._st, "logicalName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "st");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "logicalName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v6, "isEqualToString:", v8) & ((v5 & 0x40) != 0);

    v10 = v5 & 0xFFFFFFFFFFFFFFBFLL;
    if ((v9 & 1) != 0)
      v5 &= ~0x40uLL;
  }
  else
  {
    v10 = v5 & 0xFFFFFFFFFFFFFFBFLL;
  }
  if (-[BRCDirectoryItem isDirectoryWithPackageName](self, "isDirectoryWithPackageName"))
  {
    -[BRCLocalStatInfo logicalNameWithoutLocalBounce](self->super._st, "logicalNameWithoutLocalBounce");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "st");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "logicalName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v11, "isEqualToString:", v13) & 1) != 0)
    {

      if ((v5 & 0x40) != 0)
        v5 = v10;
    }
    else
    {

    }
  }
  v14 = -[BRCDirectoryItem mtime](self, "mtime");
  if (v14 == objc_msgSend(v4, "directoryMtime"))
    v15 = v5;
  else
    v15 = v5 | 0x4000;

  return v15;
}

- (unint64_t)diffAgainstLocalItem:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)BRCDirectoryItem;
  return -[BRCLocalItem diffAgainstLocalItem:](&v4, sel_diffAgainstLocalItem_, a3);
}

- (BOOL)hasShareIDAndIsOwnedByMe
{
  _BOOL4 v3;

  v3 = -[BRCLocalItem isOwnedByMe](self, "isOwnedByMe");
  if (v3)
    return (LOBYTE(self->super._sharingOptions) >> 2) & 1;
  return v3;
}

- (id)_initFromPQLResultSet:(id)a3 session:(id)a4 db:(id)a5 error:(id *)a6
{
  id v10;
  _QWORD *v11;
  objc_super v13;

  v10 = a3;
  v13.receiver = self;
  v13.super_class = (Class)BRCDirectoryItem;
  v11 = -[BRCLocalItem _initFromPQLResultSet:session:db:error:](&v13, sel__initFromPQLResultSet_session_db_error_, v10, a4, a5, a6);
  if (v11)
    v11[25] = objc_msgSend(v10, "longLongAtIndex:", 41);

  return v11;
}

- (id)_initWithServerItem:(id)a3 dbRowID:(unint64_t)a4
{
  id v6;
  _QWORD *v7;
  objc_super v9;

  v6 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BRCDirectoryItem;
  v7 = -[BRCLocalItem _initWithServerItem:dbRowID:](&v9, sel__initWithServerItem_dbRowID_, v6, a4);
  if (v7)
    v7[25] = objc_msgSend(v6, "directoryMtime");

  return v7;
}

- (id)_initWithLocalItem:(id)a3
{
  id v4;
  _QWORD *v5;
  _QWORD *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)BRCDirectoryItem;
  v5 = -[BRCLocalItem _initWithLocalItem:](&v8, sel__initWithLocalItem_, v4);
  if (v5)
  {
    objc_msgSend(v4, "asDirectory");
    v6 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    v5[25] = v6[25];

  }
  return v5;
}

- (void)updateItemMetadataFromServerItem:(id)a3 appliedSharingPermission:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  int64_t v7;
  objc_super v8;

  v4 = a4;
  v8.receiver = self;
  v8.super_class = (Class)BRCDirectoryItem;
  v6 = a3;
  -[BRCLocalItem updateItemMetadataFromServerItem:appliedSharingPermission:](&v8, sel_updateItemMetadataFromServerItem_appliedSharingPermission_, v6, v4);
  v7 = objc_msgSend(v6, "directoryMtime", v8.receiver, v8.super_class);

  self->_mtime = v7;
}

- (void)_learnItemID:(id)a3 serverItem:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)BRCDirectoryItem;
  -[BRCLocalItem _learnItemID:serverItem:](&v14, sel__learnItemID_serverItem_, v6, v7);
  if (v7)
  {
    -[BRCLocalItem st](self, "st");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "st");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setType:", objc_msgSend(v9, "type"));

LABEL_8:
    goto LABEL_9;
  }
  if (objc_msgSend(v6, "isDocumentsFolder"))
  {
    -[BRCLocalItem appLibrary](self, "appLibrary");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "state");

    -[BRCLocalItem st](self, "st");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v12;
    if ((v11 & 0x4000000) != 0)
      v13 = 0;
    else
      v13 = 9;
    objc_msgSend(v12, "setType:", v13);
    goto LABEL_8;
  }
LABEL_9:

}

- (BOOL)isAppLibraryTrashFolder
{
  void *v3;
  int v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  char v9;
  BOOL v10;

  -[BRCLocalStatInfo logicalName](self->super._st, "logicalName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D10E00]);

  if (!v4)
    return 0;
  -[BRCLocalItem appLibrary](self, "appLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isCloudDocsAppLibrary");

  -[BRCStatInfo parentID](self->super._st, "parentID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
    v9 = objc_msgSend(v7, "isNonDesktopRoot");
  else
    v9 = objc_msgSend(v7, "isDocumentsFolder");
  v10 = v9;

  return v10;
}

- (id)descriptionWithContext:(id)a3
{
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)BRCDirectoryItem;
  -[BRCLocalItem descriptionWithContext:](&v7, sel_descriptionWithContext_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  if (self->_childItemCount)
    objc_msgSend(v5, "appendFormat:", CFSTR(" ch:%@"), self->_childItemCount);
  return v5;
}

- (BOOL)possiblyContainsSharedItem
{
  id v3;
  char v4;
  BRCPQLConnection *db;
  BRCItemID *itemID;
  void *v7;
  id v8;

  v3 = -[BRCPQLConnection fetch:](self->super._db, "fetch:", CFSTR("SELECT shared_by_me_count | shared_to_me_count, dir_faults_count FROM item_recursive_properties WHERE item_rowid = %llu"), self->super._dbRowID);
  if (!objc_msgSend(v3, "next"))
    goto LABEL_6;
  if ((objc_msgSend(v3, "BOOLAtIndex:", 0) & 1) == 0)
  {
    if (objc_msgSend(v3, "BOOLAtIndex:", 1))
    {
      db = self->super._db;
      itemID = self->super._itemID;
      -[BRCClientZone dbRowID](self->super._clientZone, "dbRowID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = -[PQLConnection numberWithSQL:](db, "numberWithSQL:", CFSTR("SELECT IFNULL(shared_children_count, 0) | IFNULL(shared_alias_count, 0) FROM server_items WHERE item_id = %@ AND zone_rowid = %@"), itemID, v7);

      v4 = objc_msgSend(v8, "BOOLValue");
      goto LABEL_7;
    }
LABEL_6:
    v4 = 0;
    goto LABEL_7;
  }
  v4 = 1;
LABEL_7:

  return v4;
}

- (BOOL)isSharedByMeOrContainsSharedByMeItem
{
  id v3;
  char v4;
  BRCPQLConnection *db;
  BRCItemID *itemID;
  void *v7;
  id v8;

  v3 = -[BRCPQLConnection fetch:](self->super._db, "fetch:", CFSTR("SELECT shared_by_me_count, dir_faults_count FROM item_recursive_properties WHERE item_rowid = %llu"), self->super._dbRowID);
  if (!objc_msgSend(v3, "next"))
    goto LABEL_6;
  if ((objc_msgSend(v3, "BOOLAtIndex:", 0) & 1) == 0)
  {
    if (objc_msgSend(v3, "BOOLAtIndex:", 1))
    {
      db = self->super._db;
      itemID = self->super._itemID;
      -[BRCClientZone dbRowID](self->super._clientZone, "dbRowID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = -[PQLConnection numberWithSQL:](db, "numberWithSQL:", CFSTR("SELECT shared_children_count FROM server_items WHERE item_id = %@ AND zone_rowid = %@"), itemID, v7);

      v4 = objc_msgSend(v8, "BOOLValue");
      goto LABEL_7;
    }
LABEL_6:
    v4 = 0;
    goto LABEL_7;
  }
  v4 = 1;
LABEL_7:

  return v4;
}

- (BOOL)isSharedToMeOrContainsSharedToMeItem
{
  id v3;
  char v4;
  BRCPQLConnection *db;
  BRCItemID *itemID;
  void *v7;
  id v8;

  v3 = -[BRCPQLConnection fetch:](self->super._db, "fetch:", CFSTR("SELECT shared_to_me_count, dir_faults_count FROM item_recursive_properties WHERE item_rowid = %llu"), self->super._dbRowID);
  if (!objc_msgSend(v3, "next"))
    goto LABEL_6;
  if ((objc_msgSend(v3, "BOOLAtIndex:", 0) & 1) == 0)
  {
    if (objc_msgSend(v3, "BOOLAtIndex:", 1))
    {
      db = self->super._db;
      itemID = self->super._itemID;
      -[BRCClientZone dbRowID](self->super._clientZone, "dbRowID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = -[PQLConnection numberWithSQL:](db, "numberWithSQL:", CFSTR("SELECT shared_alias_count FROM server_items WHERE item_id = %@ AND zone_rowid = %@"), itemID, v7);

      v4 = objc_msgSend(v8, "BOOLValue");
      goto LABEL_7;
    }
LABEL_6:
    v4 = 0;
    goto LABEL_7;
  }
  v4 = 1;
LABEL_7:

  return v4;
}

- (BOOL)containsOverQuotaItems
{
  id v2;
  char v3;

  v2 = -[PQLConnection numberWithSQL:](self->super._db, "numberWithSQL:", CFSTR("SELECT over_quota_count FROM item_recursive_properties WHERE item_rowid = %llu"), self->super._dbRowID);
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (BOOL)containsDirFault
{
  id v4;
  char v5;

  if (-[BRCDirectoryItem isDirectoryFault](self, "isDirectoryFault"))
    return 1;
  v4 = -[PQLConnection numberWithSQL:](self->super._db, "numberWithSQL:", CFSTR("SELECT dir_faults_count FROM item_recursive_properties WHERE item_rowid = %llu"), self->super._dbRowID);
  v5 = objc_msgSend(v4, "BOOLValue");

  return v5;
}

- (BOOL)containsPendingUploadOrSyncUp
{
  id v2;
  char v3;

  v2 = -[PQLConnection numberWithSQL:](self->super._db, "numberWithSQL:", CFSTR("SELECT 1 FROM item_recursive_properties WHERE item_rowid = %llu AND (needs_sync_up_count != 0 OR needs_upload_count != 0)"), self->super._dbRowID);
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (BOOL)containsPendingDeleteDocuments
{
  BRCPQLConnection *db;
  unint64_t dbRowID;
  void *v4;
  id v5;

  db = self->super._db;
  dbRowID = self->super._dbRowID;
  -[BRCClientZone dbRowID](self->super._clientZone, "dbRowID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[PQLConnection numberWithSQL:](db, "numberWithSQL:", CFSTR("WITH RECURSIVE pending_delete_children (item_id, item_type, needs_delete_doc_count) AS(    SELECT item_id, item_type, needs_delete_doc_count FROM item_recursive_properties      WHERE item_rowid = %llu AND needs_delete_doc_count != 0  UNION ALL     SELECT ip.item_id, ip.item_type, ip.needs_delete_doc_count FROM item_recursive_properties AS ip INNER JOIN pending_delete_children AS p WHERE ip.item_parent_id = p.item_id AND ip.zone_rowid = %@ AND ip.needs_delete_doc_count != 0) SELECT 1 FROM pending_delete_children AS pdc WHERE pdc.needs_delete_doc_count != 0 AND pdc.item_type IN (1, 2, 8) LIMIT 1"), dbRowID, v4);

  LOBYTE(v4) = objc_msgSend(v5, "BOOLValue");
  return (char)v4;
}

- (void)transformIntoFSRoot
{
  self->super._st->super._type = 4;
}

- (BOOL)hasDeadChildren
{
  BRCPQLConnection *db;
  BRCItemID *itemID;
  void *v4;
  id v5;

  db = self->super._db;
  itemID = self->super._itemID;
  -[BRCClientZone dbRowID](self->super._clientZone, "dbRowID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[PQLConnection numberWithSQL:](db, "numberWithSQL:", CFSTR("SELECT 1 FROM client_items WHERE item_parent_id = %@ AND item_state = 1 AND item_parent_zone_rowid = %@ LIMIT 1"), itemID, v4);

  LOBYTE(v4) = objc_msgSend(v5, "BOOLValue");
  return (char)v4;
}

- (BOOL)hasLiveChildren
{
  void *v3;
  BRCItemID *itemID;
  void *v5;
  void *v6;

  -[BRCClientZone db](self->super._clientZone, "db");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  itemID = self->super._itemID;
  -[BRCClientZone dbRowID](self->super._clientZone, "dbRowID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "numberWithSQL:", CFSTR("SELECT 1 FROM client_items WHERE item_parent_id = %@    AND item_state IN (0, -1)   AND item_parent_zone_rowid = %@ LIMIT 1"), itemID, v5);

  LOBYTE(v5) = objc_msgSend(v6, "BOOLValue");
  return (char)v5;
}

- (id)_serverChildItemCount
{
  BRCClientZone *clientZone;
  BRCItemID *itemID;
  void *v5;
  void *v6;
  BRCClientZone *v7;
  BRCItemID *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  void *v15;
  int v17;
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  BRCDirectoryItem *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  clientZone = self->super._clientZone;
  itemID = self->super._itemID;
  -[BRCLocalItem db](self, "db");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCClientZone serverChildCountWithParentID:db:](clientZone, "serverChildCountWithParentID:db:", itemID, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = self->super._clientZone;
    v8 = self->super._itemID;
    -[BRCLocalItem db](self, "db");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCClientZone serverHiddenChildCountWithParentID:db:](v7, "serverHiddenChildCountWithParentID:db:", v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = objc_msgSend(v6, "longLongValue");
    v12 = v11 - objc_msgSend(v10, "longLongValue");
    if (v12 < 0)
    {
      brc_bread_crumbs();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      {
        v17 = 138413058;
        v18 = v6;
        v19 = 2112;
        v20 = v10;
        v21 = 2112;
        v22 = self;
        v23 = 2112;
        v24 = v13;
        _os_log_fault_impl(&dword_1CBD43000, v14, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: server count %@ minus hidden count %@ is less than 0 for %@%@", (uint8_t *)&v17, 0x2Au);
      }

      v12 = 0;
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v12);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v15 = 0;
  }
  return v15;
}

- (id)childItemCount
{
  NSNumber *v3;
  void *childItemCount;
  BRCClientZone *clientZone;
  BRCItemID *itemID;
  NSNumber *v7;
  NSNumber *v8;

  if (!self->_childItemCount)
  {
    if (-[BRCDirectoryItem isDirectoryFault](self, "isDirectoryFault"))
    {
      -[BRCDirectoryItem _serverChildItemCount](self, "_serverChildItemCount");
      v3 = (NSNumber *)objc_claimAutoreleasedReturnValue();
      childItemCount = self->_childItemCount;
      self->_childItemCount = v3;
    }
    else
    {
      clientZone = self->super._clientZone;
      itemID = self->super._itemID;
      -[BRCLocalItem db](self, "db");
      childItemCount = (void *)objc_claimAutoreleasedReturnValue();
      -[BRCClientZone clientChildCountWithParentID:db:](clientZone, "clientChildCountWithParentID:db:", itemID, childItemCount);
      v7 = (NSNumber *)objc_claimAutoreleasedReturnValue();
      v8 = self->_childItemCount;
      self->_childItemCount = v7;

    }
  }
  return self->_childItemCount;
}

- (id)serverQuotaUsage
{
  BRCClientZone *clientZone;
  BRCItemID *itemID;
  void *v4;
  void *v5;

  clientZone = self->super._clientZone;
  itemID = self->super._itemID;
  -[BRCLocalItem db](self, "db");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCClientZone serverQuotaUsageWithParentID:db:](clientZone, "serverQuotaUsageWithParentID:db:", itemID, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)clientZonesChildrenNeedingSyncUpAreIn
{
  BRCPQLConnection *db;
  BRCItemID *itemID;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  id v17;
  id obj;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[4];
  uint64_t v26;
  __int16 v27;
  void *v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v20 = (void *)objc_opt_new();
  db = self->super._db;
  itemID = self->super._itemID;
  -[BRCClientZone dbRowID](self->super._clientZone, "dbRowID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[BRCPQLConnection fetch:](db, "fetch:", CFSTR("SELECT DISTINCT zone_rowid FROM client_items WHERE item_parent_id = %@   AND item_parent_zone_rowid = %@    AND item_localsyncupstate = 4   AND item_state IN (0, -1, 1)"), itemID, v5);

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  objc_msgSend(v6, "enumerateObjectsOfClass:", objc_opt_class());
  obj = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v22 != v9)
          objc_enumerationMutation(obj);
        v11 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i);
        -[BRCAccountSession serverZoneByRowID:](self->super._session, "serverZoneByRowID:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "clientZone");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
        {
          objc_msgSend(v20, "addObject:", v13);
        }
        else
        {
          brc_bread_crumbs();
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 138412546;
            v26 = v11;
            v27 = 2112;
            v28 = v14;
            _os_log_fault_impl(&dword_1CBD43000, v15, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: Can't find clientZone for zoneID %@%@", buf, 0x16u);
          }

        }
      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
    }
    while (v8);
  }

  if (objc_msgSend(v20, "count"))
    v16 = v20;
  else
    v16 = 0;
  v17 = v16;

  return v17;
}

- (void)_retryPostponedIfNeededForDiffs:(unint64_t)a3
{
  int v3;
  void *v5;
  char v6;
  id v7;

  v3 = a3;
  if (-[BRCLocalItem isDead](self, "isDead"))
  {
    if (-[BRCLocalItem isKnownByServerOrInFlight](self, "isKnownByServerOrInFlight"))
      return;
LABEL_8:
    -[BRCAccountSession applyScheduler](self->super._session, "applyScheduler");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "didCreateMissingParentID:zone:", self->super._itemID, self->super._serverZone);

    return;
  }
  if (v3 < 0)
    goto LABEL_8;
  if (-[BRCLocalItem isOnDisk](self, "isOnDisk"))
  {
    -[BRCLocalItem orig](self, "orig");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isOnDisk");

    if ((v6 & 1) == 0)
    {
      if (-[BRCLocalItem isKnownByServerOrInFlight](self, "isKnownByServerOrInFlight"))
        goto LABEL_8;
    }
  }
}

- (BOOL)_repopulateRecursivePropertiesIfNecessary
{
  BRCPQLConnection *db;
  BRCItemID *itemID;
  void *v5;
  id v6;
  BOOL v7;

  db = self->super._db;
  itemID = self->super._itemID;
  -[BRCClientZone dbRowID](self->super._clientZone, "dbRowID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[BRCPQLConnection fetch:](db, "fetch:", CFSTR("SELECT SUM(dir_faults_count), SUM(faults_count), SUM(needs_faulting_count), SUM(uploaded_size), SUM(needs_upload_size), SUM(uploaded_count), SUM(needs_upload_count), SUM(downloaded_size), SUM(needs_download_size), SUM(downloaded_count), SUM(needs_download_count), SUM(dl_unstaged_count), SUM(needs_dl_unstage_count), SUM(synced_up_count), SUM(needs_sync_up_count), SUM(over_quota_count), SUM(shared_by_me_count), SUM(shared_to_me_count), SUM(needs_delete_doc_count) FROM item_recursive_properties WHERE item_parent_id = %@ AND item_parent_zone_rowid = %@"), itemID, v5);

  if (objc_msgSend(v6, "next"))
    v7 = -[BRCPQLConnection execute:](self->super._db, "execute:", CFSTR("UPDATE item_recursive_properties SET  dir_faults_count = %lld, faults_count = %lld, needs_faulting_count = %lld, uploaded_size = %lld, needs_upload_size = %lld, uploaded_count = %lld, needs_upload_count = %lld, downloaded_size = %lld, needs_download_size = %lld, downloaded_count = %lld, needs_download_count = %lld, dl_unstaged_count = %lld, needs_dl_unstage_count = %lld, synced_up_count = %lld, needs_sync_up_count = %lld, over_quota_count = %lld, shared_by_me_count = %lld, shared_to_me_count = %lld, needs_delete_doc_count = %lld  WHERE item_rowid = %llu "), objc_msgSend(v6, "unsignedLongLongAtIndex:", 0)+ -[BRCDirectoryItem isDirectoryFault](self, "isDirectoryFault"), objc_msgSend(v6, "unsignedLongLongAtIndex:", 1), objc_msgSend(v6, "unsignedLongLongAtIndex:", 2), objc_msgSend(v6, "unsignedLongLongAtIndex:", 3), objc_msgSend(v6, "unsignedLongLongAtIndex:", 4), objc_msgSend(v6, "unsignedLongLongAtIndex:", 5), objc_msgSend(v6, "unsignedLongLongAtIndex:", 6), objc_msgSend(v6, "unsignedLongLongAtIndex:", 7), objc_msgSend(v6, "unsignedLongLongAtIndex:", 8), objc_msgSend(v6, "unsignedLongLongAtIndex:", 9), objc_msgSend(v6, "unsignedLongLongAtIndex:", 10), objc_msgSend(v6, "unsignedLongLongAtIndex:", 11), objc_msgSend(v6, "unsignedLongLongAtIndex:", 12), objc_msgSend(v6, "unsignedLongLongAtIndex:", 13), objc_msgSend(v6, "unsignedLongLongAtIndex:", 14),
           objc_msgSend(v6, "unsignedLongLongAtIndex:", 15),
           objc_msgSend(v6, "unsignedLongLongAtIndex:", 16)
         + -[BRCDirectoryItem hasShareIDAndIsOwnedByMe](self, "hasShareIDAndIsOwnedByMe"),
           objc_msgSend(v6, "unsignedLongLongAtIndex:", 17)
         + -[BRCLocalItem isSharedToMeTopLevelItem](self, "isSharedToMeTopLevelItem"),
           objc_msgSend(v6, "unsignedLongLongAtIndex:", 18),
           self->super._dbRowID);
  else
    v7 = 1;

  return v7;
}

- (BOOL)_insertRecursiveProperties
{
  void *v3;
  void *v4;
  int v5;
  BRCPQLConnection *db;
  unint64_t dbRowID;
  BRCItemID *itemID;
  int v9;
  void *v10;
  BOOL v11;

  -[BRCStatInfo parentID](self->super._st, "parentID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[BRCItemID isDocumentsFolder](self->super._itemID, "isDocumentsFolder")
    || (-[BRCLocalStatInfo logicalName](self->super._st, "logicalName"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5 = objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0D10E00]),
        v4,
        v5))
  {

    v3 = 0;
  }
  db = self->super._db;
  dbRowID = self->super._dbRowID;
  itemID = self->super._itemID;
  v9 = -[BRCStatInfo type](self->super._st, "type");
  -[BRCClientZone dbRowID](self->super._clientZone, "dbRowID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(db) = -[BRCPQLConnection execute:](db, "execute:", CFSTR("INSERT OR REPLACE INTO item_recursive_properties (item_rowid, item_id, item_parent_id, item_type, zone_rowid, item_parent_zone_rowid) VALUES (%llu, %@, %@, %u, %@, %@)"), dbRowID, itemID, v3, v9, v10, self->super._parentZoneRowID);

  if ((_DWORD)db)
    v11 = -[BRCDirectoryItem _repopulateRecursivePropertiesIfNecessary](self, "_repopulateRecursivePropertiesIfNecessary");
  else
    v11 = 0;

  return v11;
}

- (BOOL)_updateRecursiveProperties
{
  int v3;
  void *v4;
  int v5;
  _BOOL4 v6;
  void *v7;
  int v8;
  void *v9;
  unsigned int v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  int v14;
  NSObject *v15;
  int sharingOptions;
  void *v17;
  const char *v18;
  void *v19;
  const char *v20;
  void *v22;
  NSObject *v23;

  v3 = -[BRCStatInfo type](self->super._st, "type");
  -[BRCLocalItem st](self->super._orig, "st");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "type");

  if (v3 == v5)
  {
    v6 = 1;
    goto LABEL_17;
  }
  if ((-[BRCStatInfo type](self->super._st, "type") - 9) <= 1u)
  {
    -[BRCLocalItem st](self->super._orig, "st");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "type");

    if (!v8)
    {
      v11 = -[BRCPQLConnection execute:](self->super._db, "execute:", CFSTR("UPDATE item_recursive_properties SET item_type = %d, dir_faults_count = dir_faults_count + 1 WHERE item_rowid = %llu"), -[BRCStatInfo type](self->super._st, "type"), self->super._dbRowID);
      goto LABEL_16;
    }
  }
  if (!-[BRCStatInfo type](self->super._st, "type"))
  {
    -[BRCLocalItem st](self->super._orig, "st");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (objc_msgSend(v9, "type") - 9);

    if (v10 <= 1)
    {
      v11 = -[BRCPQLConnection execute:](self->super._db, "execute:", CFSTR("UPDATE item_recursive_properties SET item_type = %d, dir_faults_count = dir_faults_count - 1 WHERE item_rowid = %llu"), -[BRCStatInfo type](self->super._st, "type"), self->super._dbRowID);
LABEL_16:
      v6 = v11;
      goto LABEL_17;
    }
  }
  v6 = -[BRCPQLConnection execute:](self->super._db, "execute:", CFSTR("UPDATE item_recursive_properties SET item_type = %d WHERE item_rowid = %llu"), -[BRCStatInfo type](self->super._st, "type"), self->super._dbRowID);
  if (-[BRCStatInfo type](self->super._st, "type") == 4)
    goto LABEL_17;
  -[BRCLocalItem st](self->super._orig, "st");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "type") != 4)
  {
    -[BRCLocalItem st](self->super._orig, "st");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "type");

    if (v14 == 10)
      goto LABEL_17;
    brc_bread_crumbs();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
      -[BRCDirectoryItem _updateRecursiveProperties].cold.2();

  }
LABEL_17:
  sharingOptions = self->super._sharingOptions;
  if (((-[BRCLocalItem sharingOptions](self->super._orig, "sharingOptions") ^ sharingOptions) & 4) != 0)
  {
    if ((-[BRCPQLConnection isBatchSuspended](self->super._db, "isBatchSuspended") & 1) == 0)
    {
      brc_bread_crumbs();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
        -[BRCLocalItem createSyncUpJob].cold.7();

    }
    if ((self->super._sharingOptions & 4) != 0)
    {
      if (-[BRCServerZone isSharedZone](self->super._serverZone, "isSharedZone"))
        v20 = "shared_to_me_count = shared_to_me_count + 1";
      else
        v20 = "shared_by_me_count = shared_by_me_count + 1";
      objc_msgSend(MEMORY[0x1E0DE81E0], "rawInjection:length:", v20, 43);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v6)
      {
        LOBYTE(v6) = 0;
        goto LABEL_31;
      }
    }
    else
    {
      -[BRCLocalItem serverZone](self->super._orig, "serverZone");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v17, "isSharedZone"))
        v18 = "shared_to_me_count = shared_to_me_count - 1";
      else
        v18 = "shared_by_me_count = shared_by_me_count - 1";
      objc_msgSend(MEMORY[0x1E0DE81E0], "rawInjection:length:", v18, 43);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v6)
        goto LABEL_31;
    }
    LOBYTE(v6) = -[BRCPQLConnection execute:](self->super._db, "execute:", CFSTR("UPDATE item_recursive_properties SET %@ WHERE item_rowid = %llu"), v19, self->super._dbRowID);
LABEL_31:

  }
  return v6;
}

- (BOOL)_recomputeChildItemCount
{
  BRCPQLConnection *db;
  void *v4;
  void *v5;

  db = self->super._db;
  -[BRCLocalItem itemID](self, "itemID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCClientZone dbRowID](self->super._clientZone, "dbRowID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(db) = -[BRCPQLConnection execute:](db, "execute:", CFSTR("UPDATE client_items AS parent SET visible_child_count = (SELECT COUNT(*) FROM client_items AS child WHERE child.item_parent_id = parent.item_id AND child.item_parent_zone_rowid = parent.zone_rowid AND (child.item_user_visible = 1 OR (child.item_scope == 3 AND child.item_filename != \".Trash\"))) WHERE parent.item_id = %@ AND parent.zone_rowid = %@"), v4, v5);

  return (char)db;
}

- (BOOL)_insertInDB:(id)a3 dbRowID:(unint64_t)a4
{
  BRCLocalStatInfo *st;
  const __CFString *logicalName;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  unsigned int v13;
  BOOL v14;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _BOOL4 v22;
  const __CFString *v23;
  int64_t v24;
  int64_t v25;
  int64_t v26;
  int v27;
  unint64_t sharingOptions;
  int v29;
  int v30;
  _BOOL8 isUserVisible;
  NSNumber *minimumSupportedOSRowID;
  unint64_t notifsRank;
  uint64_t syncUpState;
  unint64_t localDiffs;
  BRCUserRowID *ownerKey;
  BRCZoneRowID *parentZoneRowID;
  BRFieldCKInfo *sideCarCKInfo;
  BRCItemID *itemID;
  int64_t mtime;
  int v41;
  void *v42;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  id v51;
  objc_super v52;

  v51 = a3;
  -[BRCDirectoryItem _retryPostponedIfNeededForDiffs:](self, "_retryPostponedIfNeededForDiffs:", 0xFF007FF3FF7FFFLL);
  -[BRCClientZone dbRowID](self->super._clientZone, "dbRowID");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  mtime = self->_mtime;
  itemID = self->super._itemID;
  ownerKey = self->super._ownerKey;
  sharingOptions = self->super._sharingOptions;
  sideCarCKInfo = self->super._sideCarCKInfo;
  parentZoneRowID = self->super._parentZoneRowID;
  localDiffs = self->super._localDiffs;
  notifsRank = self->super._notifsRank;
  syncUpState = self->super._syncUpState;
  -[BRCLocalItem appLibrary](self, "appLibrary");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "dbRowID");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  minimumSupportedOSRowID = self->super._minimumSupportedOSRowID;
  isUserVisible = self->super._isUserVisible;
  -[BRCStatInfo ckInfo](self->super._st, "ckInfo");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = -[BRCStatInfo state](self->super._st, "state");
  v29 = -[BRCStatInfo type](self->super._st, "type");
  v27 = -[BRCStatInfo mode](self->super._st, "mode");
  v26 = -[BRCStatInfo birthtime](self->super._st, "birthtime");
  v25 = -[BRCStatInfo lastUsedTime](self->super._st, "lastUsedTime");
  v24 = -[BRCStatInfo favoriteRank](self->super._st, "favoriteRank");
  -[BRCStatInfo parentID](self->super._st, "parentID");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  st = self->super._st;
  logicalName = (const __CFString *)st->super._logicalName;
  if (!logicalName)
    logicalName = &stru_1E8769030;
  v23 = logicalName;
  v22 = -[BRCStatInfo isHiddenExt](st, "isHiddenExt");
  -[BRCStatInfo finderTags](self->super._st, "finderTags");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCStatInfo xattrSignature](self->super._st, "xattrSignature");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCStatInfo trashPutBackPath](self->super._st, "trashPutBackPath");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCStatInfo trashPutBackParentID](self->super._st, "trashPutBackParentID");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCStatInfo aliasTarget](self->super._st, "aliasTarget");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCStatInfo creatorRowID](self->super._st, "creatorRowID");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCLocalStatInfo documentID](self->super._st, "documentID");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCLocalStatInfo fileID](self->super._st, "fileID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCLocalStatInfo generationID](self->super._st, "generationID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCLocalStatInfo physicalName](self->super._st, "physicalName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCLocalStatInfo processingStamp](self->super._st, "processingStamp");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCLocalStatInfo stagedFileIDForDB](self->super._st, "stagedFileIDForDB");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[BRCLocalStatInfo stagedGenerationID](self->super._st, "stagedGenerationID");
  -[BRCLocalStatInfo rawBouncedLogicalName](self->super._st, "rawBouncedLogicalName");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[BRCLocalStatInfo itemScope](self->super._st, "itemScope");
  -[BRCLocalStatInfo tmpBouncedNo](self->super._st, "tmpBouncedNo");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = objc_msgSend(v51, "execute:", CFSTR("INSERT INTO client_items(rowid, zone_rowid, version_mtime, visible_child_count, item_id, item_creator_id, item_sharing_options, item_side_car_ckinfo, item_parent_zone_rowid, item_localsyncupstate, item_local_diffs, item_notifs_rank, app_library_rowid, item_min_supported_os_rowid, item_user_visible, item_stat_ckinfo, item_state, item_type, item_mode, item_birthtime, item_lastusedtime, item_favoriterank,item_parent_id, item_filename, item_hidden_ext, item_finder_tags, item_xattr_signature, item_trash_put_back_path, item_trash_put_back_parent_id, item_alias_target, item_creator, item_doc_id, item_file_id, item_generation, item_localname, item_processing_stamp, item_staged_file_id, item_staged_generation, item_bouncedname, item_scope, item_tmpbounceno) VALUES(%lld, %@, %lld, 0, %@, %@, %ld, %@, %@, %d, %lld, %lld, %@, %@, %d, %@, %d, %d, %d, %lld, %lld, %lld, %@, %@, %d, %@, %@, %@, %@, %@, %@, %@, %@, %@, %@, %@, %@, %u, %@, %d, %@)"), a4, v50, mtime, itemID, ownerKey, sharingOptions, sideCarCKInfo, parentZoneRowID, syncUpState, localDiffs, notifsRank, v49, minimumSupportedOSRowID, isUserVisible, v48, v30,
          v29,
          v27,
          v26,
          v25,
          v24,
          v47,
          v23,
          v22,
          v46,
          v45,
          v44,
          v21,
          v20,
          v19,
          v18,
          v7,
          v8,
          v9,
          v10,
          v11,
          v12,
          v17,
          v13,
          v16);

  v14 = v41
     && (v52.receiver = self,
         v52.super_class = (Class)BRCDirectoryItem,
         -[BRCLocalItem _insertInDB:dbRowID:](&v52, sel__insertInDB_dbRowID_, v51, a4))
     && -[BRCDirectoryItem _insertRecursiveProperties](self, "_insertRecursiveProperties")
     && -[BRCDirectoryItem _recomputeChildItemCount](self, "_recomputeChildItemCount");

  return v14;
}

- (BOOL)_updateInDB:(id)a3 diffs:(unint64_t)a4
{
  id v6;
  void *v7;
  BRCItemID *itemID;
  void *v9;
  uint64_t v10;
  BRCDirectoryItem *v11;
  void *v12;
  BRCDirectoryItem *v13;
  void *v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  BRCDirectoryItem *v20;
  void *v21;
  char v22;
  int v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  BRCDirectoryItem *v36;
  NSObject *v37;
  void *v38;
  int sharingOptions;
  char v40;
  int v41;
  BRCDirectoryItem *v42;
  void *v43;
  BRCLocalStatInfo *st;
  const __CFString *logicalName;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  unsigned int v52;
  void *v53;
  _BOOL4 v54;
  BOOL v55;
  void *v57;
  BRCItemID *v58;
  BRCDirectoryItem *v59;
  void *v60;
  NSObject *v61;
  void *v62;
  NSObject *v63;
  void *v64;
  void *v65;
  void *v66;
  _BOOL4 v67;
  const __CFString *v68;
  int64_t v69;
  int64_t v70;
  int64_t v71;
  int v72;
  int v73;
  _BOOL8 isUserVisible;
  int v75;
  NSNumber *minimumSupportedOSRowID;
  unint64_t notifsRank;
  uint64_t syncUpState;
  unint64_t localDiffs;
  unint64_t v80;
  BRCZoneRowID *parentZoneRowID;
  BRFieldCKInfo *sideCarCKInfo;
  BRCUserRowID *ownerKey;
  BRCItemID *v84;
  int v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  int v94;
  void *v95;
  void *v96;
  unint64_t v97;
  void *v98;
  id obj;
  id obja;
  objc_super v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  uint8_t v106[128];
  uint8_t buf[4];
  uint64_t v108;
  __int16 v109;
  void *v110;
  __int16 v111;
  BRCItemID *v112;
  __int16 v113;
  void *v114;
  uint64_t v115;

  v115 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = v6;
  v97 = a4;
  if ((a4 & 0x80000000) == 0)
    goto LABEL_7;
  if ((objc_msgSend(v6, "isBatchSuspended") & 1) == 0)
  {
    v59 = self;
    brc_bread_crumbs();
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v61 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v61, OS_LOG_TYPE_FAULT))
      -[BRCDirectoryItem _updateInDB:diffs:].cold.1();

    self = v59;
  }
  itemID = self->super._itemID;
  -[BRCClientZone dbRowID](self->super._clientZone, "dbRowID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCLocalItem itemID](self->super._orig, "itemID");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = self;
  v12 = (void *)v10;
  v13 = v11;
  -[BRCClientZone dbRowID](v11->super._clientZone, "dbRowID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v7, "execute:", CFSTR("UPDATE client_items   SET item_parent_id = %@,       item_parent_zone_rowid = %@ WHERE item_parent_id = %@   AND item_parent_zone_rowid = %@"), itemID, v9, v12, v14);

  v16 = objc_msgSend(v7, "changes");
  if (v16 < 1)
  {
    self = v13;
    if (v15)
      goto LABEL_7;
LABEL_14:
    v23 = 0;
    if ((a4 & 0x40000000) == 0)
      goto LABEL_29;
    goto LABEL_27;
  }
  v17 = v16;
  brc_bread_crumbs();
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v19 = objc_claimAutoreleasedReturnValue();
  self = v13;
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
  {
    -[BRCLocalItem itemID](v13->super._orig, "itemID");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = v13->super._itemID;
    *(_DWORD *)buf = 134218754;
    v108 = v17;
    v109 = 2112;
    v110 = v57;
    v111 = 2112;
    v112 = v58;
    v113 = 2112;
    v114 = v18;
    _os_log_debug_impl(&dword_1CBD43000, v19, OS_LOG_TYPE_DEBUG, "[DEBUG] Updated %llu items from parent %@ to %@%@", buf, 0x2Au);

  }
  if ((v15 & 1) == 0)
    goto LABEL_14;
LABEL_7:
  if (!-[BRCLocalItem isAlmostDead](self, "isAlmostDead"))
  {
    v23 = 1;
    if ((a4 & 0x40000000) == 0)
      goto LABEL_29;
    goto LABEL_27;
  }
  v20 = self;
  -[BRCLocalItem orig](self, "orig");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "isAlmostDead");

  if ((v22 & 1) != 0)
  {
    v23 = 1;
    self = v20;
    if ((a4 & 0x40000000) == 0)
      goto LABEL_29;
    goto LABEL_27;
  }
  if ((objc_msgSend(v7, "isBatchSuspended") & 1) == 0)
  {
    brc_bread_crumbs();
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v63 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v63, OS_LOG_TYPE_FAULT))
      -[BRCDirectoryItem _updateInDB:diffs:].cold.1();

  }
  -[BRCLocalItem itemID](v20, "itemID");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCClientZone dbRowID](v20->super._clientZone, "dbRowID");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v96 = v7;
  v94 = objc_msgSend(v7, "execute:", CFSTR("DELETE FROM client_items WHERE item_parent_id = %@   AND item_parent_zone_rowid = %@   AND item_state = -2"), v24, v25);

  -[BRCClientZone db](v20->super._clientZone, "db");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCLocalItem itemID](v20, "itemID");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCClientZone dbRowID](v20->super._clientZone, "dbRowID");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = (void *)objc_msgSend(v26, "fetch:", CFSTR("SELECT si.rowid FROM server_items AS si INNER JOIN client_unapplied_table AS ap ON si.item_rank = ap.throttle_id WHERE si.item_parent_id = %@   AND si.zone_rowid = %@   AND si.item_type = 3   AND ap.throttle_state = 24"), v27, v28);

  self = v20;
  v104 = 0u;
  v105 = 0u;
  v102 = 0u;
  v103 = 0u;
  v92 = v29;
  objc_msgSend(v29, "enumerateObjectsOfClass:", objc_opt_class());
  obj = (id)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v102, v106, 16);
  if (v30)
  {
    v31 = v30;
    v32 = *(_QWORD *)v103;
    do
    {
      v33 = 0;
      do
      {
        if (*(_QWORD *)v103 != v32)
          objc_enumerationMutation(obj);
        -[BRCClientZone serverItemByRowID:](self->super._clientZone, "serverItemByRowID:", objc_msgSend(*(id *)(*((_QWORD *)&v102 + 1) + 8 * v33), "longLongValue"));
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        brc_bread_crumbs();
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v36 = self;
        v37 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412546;
          v108 = (uint64_t)v34;
          v109 = 2112;
          v110 = v35;
          _os_log_debug_impl(&dword_1CBD43000, v37, OS_LOG_TYPE_DEBUG, "[DEBUG] Inserting tombstone for alias %@ which is pending target%@", buf, 0x16u);
        }

        v38 = (void *)objc_msgSend(v34, "newLocalItemWithServerZone:dbRowID:", v36->super._serverZone, 0);
        objc_msgSend(v38, "markDead");
        objc_msgSend(v38, "markForceNeedsSyncUp");
        objc_msgSend(v38, "saveToDB");

        ++v33;
        self = v36;
      }
      while (v31 != v33);
      v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v102, v106, 16);
    }
    while (v31);
  }

  v7 = v96;
  v23 = v94;
  if ((a4 & 0x40000000) != 0)
  {
LABEL_27:
    sharingOptions = self->super._sharingOptions;
    if (((-[BRCLocalItem sharingOptions](self->super._orig, "sharingOptions") ^ sharingOptions) & 0x7CLL) != 0)
      -[BRCLocalItem markLostClearGenerationID:backoffMode:](self, "markLostClearGenerationID:backoffMode:", 0, 0);
  }
LABEL_29:
  -[BRCDirectoryItem _retryPostponedIfNeededForDiffs:](self, "_retryPostponedIfNeededForDiffs:", a4);
  v40 = v23 ^ 1;
  if (a4 != 0x100000000)
    v40 = 1;
  if ((v40 & 1) != 0)
  {
    if (!v23)
      goto LABEL_45;
    -[BRCClientZone dbRowID](self->super._clientZone, "dbRowID");
    obja = (id)objc_claimAutoreleasedReturnValue();
    v84 = self->super._itemID;
    ownerKey = self->super._ownerKey;
    v80 = self->super._sharingOptions;
    sideCarCKInfo = self->super._sideCarCKInfo;
    parentZoneRowID = self->super._parentZoneRowID;
    localDiffs = self->super._localDiffs;
    notifsRank = self->super._notifsRank;
    syncUpState = self->super._syncUpState;
    -[BRCLocalItem appLibrary](self, "appLibrary");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v86, "dbRowID");
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    minimumSupportedOSRowID = self->super._minimumSupportedOSRowID;
    isUserVisible = self->super._isUserVisible;
    -[BRCStatInfo ckInfo](self->super._st, "ckInfo");
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    v75 = -[BRCStatInfo state](self->super._st, "state");
    v73 = -[BRCStatInfo type](self->super._st, "type");
    v72 = -[BRCStatInfo mode](self->super._st, "mode");
    v71 = -[BRCStatInfo birthtime](self->super._st, "birthtime");
    v70 = -[BRCStatInfo lastUsedTime](self->super._st, "lastUsedTime");
    v69 = -[BRCStatInfo favoriteRank](self->super._st, "favoriteRank");
    -[BRCStatInfo parentID](self->super._st, "parentID");
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    st = self->super._st;
    logicalName = (const __CFString *)st->super._logicalName;
    if (!logicalName)
      logicalName = &stru_1E8769030;
    v68 = logicalName;
    v67 = -[BRCStatInfo isHiddenExt](st, "isHiddenExt");
    -[BRCStatInfo finderTags](self->super._st, "finderTags");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCStatInfo xattrSignature](self->super._st, "xattrSignature");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCStatInfo trashPutBackPath](self->super._st, "trashPutBackPath");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCStatInfo trashPutBackParentID](self->super._st, "trashPutBackParentID");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCStatInfo aliasTarget](self->super._st, "aliasTarget");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCStatInfo creatorRowID](self->super._st, "creatorRowID");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCLocalStatInfo documentID](self->super._st, "documentID");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCLocalStatInfo fileID](self->super._st, "fileID");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCLocalStatInfo generationID](self->super._st, "generationID");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCLocalStatInfo physicalName](self->super._st, "physicalName");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCLocalStatInfo processingStamp](self->super._st, "processingStamp");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCLocalStatInfo stagedFileIDForDB](self->super._st, "stagedFileIDForDB");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = -[BRCLocalStatInfo stagedGenerationID](self->super._st, "stagedGenerationID");
    -[BRCLocalStatInfo rawBouncedLogicalName](self->super._st, "rawBouncedLogicalName");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = self;
    v52 = -[BRCLocalStatInfo itemScope](self->super._st, "itemScope");
    -[BRCLocalStatInfo tmpBouncedNo](v42->super._st, "tmpBouncedNo");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v85 = objc_msgSend(v7, "execute:", CFSTR("UPDATE client_items SET zone_rowid = %@, item_id = %@, item_creator_id = %@, item_sharing_options = %ld, item_side_car_ckinfo = %@, item_parent_zone_rowid = %@, item_localsyncupstate = %d, item_local_diffs = %llu, item_notifs_rank = %lld, app_library_rowid = %@, item_min_supported_os_rowid = %@, item_user_visible = %d, item_stat_ckinfo = %@, item_state = %d, item_type = %d, item_mode = %d, item_birthtime = %lld, item_lastusedtime = %lld, item_favoriterank = %lld, item_parent_id = %@, item_filename = %@, item_hidden_ext = %d, item_finder_tags = %@, item_xattr_signature = %@, item_trash_put_back_path = %@, item_trash_put_back_parent_id = %@, item_alias_target = %@, item_creator = %@, item_doc_id = %@, item_file_id = %@, item_generation = %@, item_localname = %@, item_processing_stamp = %@, item_staged_file_id = %@, item_staged_generation = %u, item_bouncedname = %@, item_scope = %d, item_tmpbounceno = %@, version_mtime = %lld  WHERE rowid = %llu"), obja, v84, ownerKey, v80, sideCarCKInfo, parentZoneRowID, syncUpState, localDiffs, notifsRank, v98, minimumSupportedOSRowID, isUserVisible, v95, v75, v73, v72,
            v71,
            v70,
            v69,
            v93,
            v68,
            v67,
            v91,
            v90,
            v89,
            v88,
            v87,
            v66,
            v65,
            v64,
            v46,
            v47,
            v48,
            v49,
            v50,
            v51,
            v52,
            v53,
            v42->_mtime,
            v42->super._dbRowID);

    a4 = v97;
    if (!v85)
      goto LABEL_45;
  }
  else
  {
    v41 = -[BRCStatInfo state](self->super._st, "state");
    -[BRCLocalStatInfo lostStamp](self->super._st, "lostStamp");
    v42 = self;
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v41) = objc_msgSend(v7, "execute:", CFSTR("UPDATE client_items SET item_state = %d, item_processing_stamp = %@ WHERE rowid = %llu"), v41, v43, v42->super._dbRowID);

    if ((v41 & 1) == 0)
      goto LABEL_45;
  }
  v101.receiver = v42;
  v101.super_class = (Class)BRCDirectoryItem;
  if (!-[BRCLocalItem _updateInDB:diffs:](&v101, sel__updateInDB_diffs_, v7, a4))
  {
LABEL_45:
    v55 = 0;
    goto LABEL_46;
  }
  v54 = -[BRCDirectoryItem _updateRecursiveProperties](v42, "_updateRecursiveProperties");
  v55 = (a4 & 0x80000000) == 0 && v54;
  if ((a4 & 0x80000000) != 0 && v54)
    v55 = -[BRCDirectoryItem _recomputeChildItemCount](v42, "_recomputeChildItemCount");
LABEL_46:

  return v55;
}

- (BOOL)_deleteFromDB:(id)a3 keepAliases:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  BOOL v7;
  BRCItemID *itemID;
  void *v9;
  int v10;
  void *v11;
  BRCItemID *v12;
  void *v13;
  BOOL v14;
  void *v15;
  NSObject *v16;
  objc_super v18;
  _QWORD v19[4];
  BOOL v20;

  v4 = a4;
  v6 = a3;
  v7 = -[BRCLocalItem isSharedToMeTopLevelItem](self, "isSharedToMeTopLevelItem")
    || -[BRCLocalItem isSharedToMeChildItem](self, "isSharedToMeChildItem");
  itemID = self->super._itemID;
  -[BRCClientZone dbRowID](self->super._clientZone, "dbRowID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v6, "execute:", CFSTR("DELETE FROM client_items WHERE item_parent_id = %@ AND item_parent_zone_rowid = %@ AND item_state = -2"), itemID, v9);

  if (self->_needsDeleteForItemIDTransfer)
  {
    if ((-[BRCPQLConnection isInTransaction](self->super._db, "isInTransaction") & 1) != 0)
    {
      if (!v10)
      {
LABEL_14:
        v14 = 0;
        goto LABEL_15;
      }
    }
    else
    {
      brc_bread_crumbs();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
        -[BRCDirectoryItem _deleteFromDB:keepAliases:].cold.1();

      if ((v10 & 1) == 0)
        goto LABEL_14;
    }
  }
  else
  {
    if (!v10)
      goto LABEL_14;
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __46__BRCDirectoryItem__deleteFromDB_keepAliases___block_invoke;
    v19[3] = &__block_descriptor_33_e48_v28__0__sqlite3_context__8i16___sqlite3_value_20l;
    v20 = v7;
    v11 = (void *)MEMORY[0x1D17A6DB0](v19);
    v12 = self->super._itemID;
    -[BRCClientZone dbRowID](self->super._clientZone, "dbRowID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v12) = objc_msgSend(v6, "execute:", CFSTR("UPDATE client_items SET item_parent_id = call_block(%@, item_state, app_library_rowid, zone_rowid, rowid),     item_localname = call_block(%@) WHERE item_parent_id = %@   AND item_parent_zone_rowid = %@"), v11, &__block_literal_global_58, v12, v13);

    if ((v12 & 1) == 0)
      goto LABEL_14;
  }
  v18.receiver = self;
  v18.super_class = (Class)BRCDirectoryItem;
  v14 = -[BRCLocalItem _deleteFromDB:keepAliases:](&v18, sel__deleteFromDB_keepAliases_, v6, v4);
LABEL_15:

  return v14;
}

void __46__BRCDirectoryItem__deleteFromDB_keepAliases___block_invoke(uint64_t a1, sqlite3_context *a2, uint64_t a3, sqlite3_value **a4)
{
  void *v7;
  NSObject *v8;
  char v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  char v13;
  int v14;

  brc_bread_crumbs();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    __46__BRCDirectoryItem__deleteFromDB_keepAliases___block_invoke_cold_2((uint64_t)a4, (uint64_t)v7, v8);

  if (sqlite3_value_int(*a4) != 1)
  {
    brc_bread_crumbs();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      __46__BRCDirectoryItem__deleteFromDB_keepAliases___block_invoke_cold_1();

  }
  if (*(_BYTE *)(a1 + 32))
    v9 = 5;
  else
    v9 = 1;
  v10 = 2;
  if (!*(_BYTE *)(a1 + 32))
    v10 = 1;
  v13 = v9;
  v14 = sqlite3_value_int(a4[v10]);
  sqlite3_result_blob(a2, &v13, 5, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
}

void __46__BRCDirectoryItem__deleteFromDB_keepAliases___block_invoke_87(uint64_t a1, sqlite3_context *a2)
{
  _BYTE v3[37];
  uuid_t out;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  memset(out, 0, sizeof(out));
  memset(v3, 0, sizeof(v3));
  uuid_generate_random(out);
  uuid_unparse(out, v3);
  sqlite3_result_text(a2, v3, 36, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
}

- (void)prepareForSyncUpInZone:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BRCDirectoryItem;
  v4 = a3;
  -[BRCLocalItem prepareForSyncUpInZone:](&v6, sel_prepareForSyncUpInZone_, v4);
  objc_msgSend(v4, "clientZone", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "prepareDirectoryForSyncUp:", self);
}

- (BOOL)isShareableItem
{
  int v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v9;
  char v10;

  if ((self->super._sharingOptions & 4) != 0)
  {
    LOBYTE(v3) = 1;
    return v3;
  }
  if (!-[BRCItemID isDocumentsFolder](self->super._itemID, "isDocumentsFolder"))
  {
    -[BRCLocalItem clientZone](self, "clientZone");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "isCloudDocsZone"))
    {
      -[BRCLocalItem st](self, "st");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "parentID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v6, "isNonDesktopRoot") & 1) != 0)
      {
        -[BRCLocalStatInfo logicalName](self->super._st, "logicalName");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0D10DC8]) & 1) != 0)
        {

          LOBYTE(v3) = 0;
LABEL_12:

          return v3;
        }
        -[BRCLocalStatInfo logicalName](self->super._st, "logicalName");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0D10DD8]);

        if ((v10 & 1) != 0)
          goto LABEL_3;
LABEL_11:
        -[BRCLocalItem appLibrary](self, "appLibrary");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "mangledID");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", v5);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v3 = objc_msgSend(v6, "isBlacklistedFromFolderSharing") ^ 1;
        goto LABEL_12;
      }

    }
    goto LABEL_11;
  }
LABEL_3:
  LOBYTE(v3) = 0;
  return v3;
}

- (id)asShareableItem
{
  BRCDirectoryItem *v3;
  void *v4;
  NSObject *v5;

  if (-[BRCDirectoryItem isShareableItem](self, "isShareableItem"))
  {
    v3 = self;
  }
  else
  {
    brc_bread_crumbs();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      -[BRCDirectoryItem asShareableItem].cold.1();

    v3 = 0;
  }
  return v3;
}

- (id)collaborationIdentifierIfComputable
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  if (-[BRCDirectoryItem isShareableItem](self, "isShareableItem"))
  {
    v3 = objc_alloc(MEMORY[0x1E0C95070]);
    -[BRCDirectoryItem asShareableItem](self, "asShareableItem");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v3, "initShareIDWithShareableItem:", v4);

    -[BRCLocalItem session](self, "session");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "cachedCurrentUserRecordNameIfExists");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "brc_collaborationIdentifierWithCachedCurrentUserRecordName:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (void)markNeedsDeleteForItemIDTransfer
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BRCDirectoryItem;
  -[BRCLocalItem markNeedsDeleteForItemIDTransfer](&v3, sel_markNeedsDeleteForItemIDTransfer);
  self->_needsDeleteForItemIDTransfer = 1;
}

- (BOOL)isCrossZoneMoveTombstone
{
  return 0;
}

- (int64_t)mtime
{
  return self->_mtime;
}

- (void)setMtime:(int64_t)a3
{
  self->_mtime = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_childItemCount, 0);
}

- (void)isDirectory
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: BRCItemTypeIsDirectory(_st.type)%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_updateRecursiveProperties
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: _st.type == BRC_ITEM_TYPE_FS_ROOT || _orig.st.type == BRC_ITEM_TYPE_FS_ROOT || _orig.st.type == BRC_ITEM_TYPE_DIRECTORY_SHARE_ACCEPT_FAULT%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_updateInDB:diffs:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: [db isBatchSuspended]%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_deleteFromDB:keepAliases:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: _db.isInTransaction%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __46__BRCDirectoryItem__deleteFromDB_keepAliases___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: sqlite3_value_int(argv[0]) == BRC_ITEM_STATE_TOMBSTONE%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __46__BRCDirectoryItem__deleteFromDB_keepAliases___block_invoke_cold_2(uint64_t a1, uint64_t a2, NSObject *a3)
{
  int v5;
  _DWORD v6[2];
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v5 = sqlite3_value_int(*(sqlite3_value **)(a1 + 24));
  v6[0] = 67109378;
  v6[1] = v5;
  v7 = 2112;
  v8 = a2;
  _os_log_debug_impl(&dword_1CBD43000, a3, OS_LOG_TYPE_DEBUG, "[DEBUG] _deleteFromDB: Updating item parent id for item rowid: %d%@", (uint8_t *)v6, 0x12u);
}

- (void)asShareableItem
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] UNREACHABLE: asShareableItem called on a non-shareable item%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

@end
