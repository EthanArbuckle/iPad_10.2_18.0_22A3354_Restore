@implementation BRCShareAcceptationDirectoryFault

- (BRCShareAcceptationDirectoryFault)initWithFilename:(id)a3 itemID:(id)a4 parentIDWhenSubitem:(id)a5 appLibrary:(id)a6 clientZone:(id)a7 sharingOptions:(unint64_t)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  BRCShareAcceptationDirectoryFault *v19;
  BRCShareAcceptationDirectoryFault *v20;
  BRCLocalStatInfo *v21;
  BRCLocalStatInfo *st;
  id v23;
  void *v24;
  uint64_t v25;
  BRCZoneRowID *parentZoneRowID;
  uint64_t v27;
  BRCPQLConnection *db;
  BRCAccountSession *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  BRCUserRowID *ownerKey;
  void *v34;
  double v35;
  uint64_t v37;
  id v38;
  objc_super v39;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v39.receiver = self;
  v39.super_class = (Class)BRCShareAcceptationDirectoryFault;
  v19 = -[BRCShareAcceptationDirectoryFault init](&v39, sel_init);
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->super.super._itemID, a4);
    v21 = -[BRCLocalStatInfo initAsShareAcceptFaultWithName:mode:isDirectory:]([BRCLocalStatInfo alloc], "initAsShareAcceptFaultWithName:mode:isDirectory:", v14, (a8 & 0x20) == 0, 1);
    st = v20->super.super._st;
    v20->super.super._st = v21;

    v38 = v15;
    if (v16)
    {
      v23 = v16;
      v37 = 0;
    }
    else
    {
      objc_msgSend(v17, "documentsFolderItemID");
      v23 = (id)objc_claimAutoreleasedReturnValue();
      v37 = 4;
    }
    -[BRCStatInfo setParentID:](v20->super.super._st, "setParentID:", v23);
    objc_msgSend(v17, "defaultClientZone");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "dbRowID");
    v25 = objc_claimAutoreleasedReturnValue();
    parentZoneRowID = v20->super.super._parentZoneRowID;
    v20->super.super._parentZoneRowID = (BRCZoneRowID *)v25;

    -[BRCLocalItem setAppLibrary:](v20, "setAppLibrary:", v17);
    objc_storeStrong((id *)&v20->super.super._clientZone, a7);
    v20->super.super._serverZone = (BRCServerZone *)-[BRCClientZone serverZone](v20->super.super._clientZone, "serverZone");
    -[BRCClientZone db](v20->super.super._clientZone, "db");
    v27 = objc_claimAutoreleasedReturnValue();
    db = v20->super.super._db;
    v20->super.super._db = (BRCPQLConnection *)v27;

    v29 = (BRCAccountSession *)(id)objc_msgSend(v17, "session");
    v20->super.super._session = v29;
    objc_msgSend(v18, "ownerName");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCAccountSession clientDB](v20->super.super._session, "clientDB");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCAccountSession userKeyForOwnerName:db:](v29, "userKeyForOwnerName:db:", v30, v31);
    v32 = objc_claimAutoreleasedReturnValue();
    ownerKey = v20->super.super._ownerKey;
    v20->super.super._ownerKey = (BRCUserRowID *)v32;

    -[BRCStatInfo setBirthtime:](v20->super.super._st, "setBirthtime:", time(0));
    -[BRCLocalStatInfo setItemScope:](v20->super.super._st, "setItemScope:", 2);
    -[BRCStatInfo setState:](v20->super.super._st, "setState:", 4294967294);
    -[BRCStatInfo setHiddenExt:](v20->super.super._st, "setHiddenExt:", 1);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "timeIntervalSince1970");
    -[BRCStatInfo setLastUsedTime:](v20->super.super._st, "setLastUsedTime:", (uint64_t)v35);

    -[BRCDirectoryItem setMtime:](v20, "setMtime:", -[BRCStatInfo lastUsedTime](v20->super.super._st, "lastUsedTime"));
    v20->super.super._sharingOptions = v37 | a8;
    v20->super.super._isUserVisible = 1;

    v15 = v38;
  }

  return v20;
}

- (BOOL)isShareAcceptationFault
{
  return 1;
}

- (void)markLiveFromStageAsShareAcceptationFault
{
  void *v3;
  uint64_t v4;
  void *v5;

  -[BRCLocalStatInfo stagedFileID](self->super.super._st, "stagedFileID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "unsignedLongLongValue");
  -[BRCLocalStatInfo fileID](self->super.super._st, "fileID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCLocalItem applyMetadataOnFileID:liveFD:sharingOptions:](self, "applyMetadataOnFileID:liveFD:sharingOptions:", v4, objc_msgSend(v5, "unsignedLongLongValue"), -[BRCLocalItem sharingOptions](self, "sharingOptions"));

  -[BRCLocalStatInfo _markLiveFromStageAsType:](self->super.super._st, "_markLiveFromStageAsType:", 10);
}

- (void)stageShareAcceptationFaultWithName:(id)a3
{
  void *v4;
  char v5;
  id v6;
  void *v7;
  NSObject *v8;
  id v9;
  unsigned int v10;
  uint64_t v11;

  v11 = 0;
  v10 = 0;
  -[BRCAccountSession stageRegistry](self->super.super._session, "stageRegistry", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  v5 = objc_msgSend(v4, "makeDirectoryInStageGatherFileID:generationID:error:", &v11, &v10, &v9);
  v6 = v9;

  if ((v5 & 1) != 0)
  {
    -[BRCLocalItem markStagedWithFileID:generationID:](self, "markStagedWithFileID:generationID:", v11, v10);
  }
  else
  {
    brc_bread_crumbs();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, (os_log_type_t)0x90u))
      -[BRCShareAcceptationDirectoryFault stageShareAcceptationFaultWithName:].cold.1();

  }
}

- (void)deleteShareAcceptationFault
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  BRCItemToPathLookup *v7;

  if (-[BRCShareAcceptationDirectoryFault isShareAcceptationFault](self, "isShareAcceptationFault"))
  {
    v7 = -[BRCItemToPathLookup initWithItem:]([BRCItemToPathLookup alloc], "initWithItem:", self);
    -[BRCItemToPathLookup byFileSystemID](v7, "byFileSystemID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "isFault"))
    {
      -[BRCAccountSession diskReclaimer](self->super.super._session, "diskReclaimer");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "renameAndUnlinkInBackgroundItemAtRelpath:", v3);

    }
    -[BRCItemToPathLookup closePaths](v7, "closePaths");
    -[BRCLocalItem markDead](self, "markDead");
    -[BRCLocalItem saveToDB](self, "saveToDB");

  }
  else
  {
    brc_bread_crumbs();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      -[BRCShareAcceptationDocumentFault deleteShareAcceptationFault].cold.1();

  }
}

- (void)markNeedsTransformIntoNormalFault
{
  -[BRCStatInfo setType:](self->super.super._st, "setType:", 9);
}

- (BOOL)_updateInDB:(id)a3 diffs:(unint64_t)a4
{
  id v6;
  unsigned int v7;
  int v8;
  char v9;
  BRCItemID *itemID;
  void *v12;
  objc_super v14;

  v6 = a3;
  v14.receiver = self;
  v14.super_class = (Class)BRCShareAcceptationDirectoryFault;
  v7 = -[BRCDirectoryItem _updateInDB:diffs:](&v14, sel__updateInDB_diffs_, v6, a4);
  v8 = -[BRCStatInfo type](self->super.super._st, "type");
  if (v8 == 9)
    v9 = 0;
  else
    v9 = v7;
  if (v8 == 9 && v7 != 0)
  {
    itemID = self->super.super._itemID;
    -[BRCClientZone dbRowID](self->super.super._clientZone, "dbRowID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v6, "execute:", CFSTR("UPDATE client_items SET item_type = 9 WHERE item_id = %@ AND zone_rowid = %@ AND item_type = 10"), itemID, v12);

  }
  return v9;
}

- (void)stageShareAcceptationFaultWithName:.cold.1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_1CBD43000, v0, (os_log_type_t)0x90u, "[ERROR] Failed to create directory in stage %@%@", v1, 0x16u);
  OUTLINED_FUNCTION_2();
}

@end
