@implementation BRCAliasItem

- (BOOL)isBRAlias
{
  void *v3;
  NSObject *v4;

  if (-[BRCStatInfo type](self->super._st, "type") != 3)
  {
    brc_bread_crumbs();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
      -[BRCAliasItem isBRAlias].cold.1((uint64_t)v3, v4);

  }
  return 1;
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
  void *v13;
  unsigned int v14;
  void *v15;
  BOOL v16;
  int64_t v18;
  void *v19;
  void *v20;
  _BOOL4 v21;
  const __CFString *v22;
  int64_t v23;
  int64_t v24;
  int v25;
  int v26;
  int v27;
  _BOOL8 isUserVisible;
  NSNumber *minimumSupportedOSRowID;
  unint64_t notifsRank;
  uint64_t syncUpState;
  unint64_t localDiffs;
  BRCZoneRowID *parentZoneRowID;
  BRFieldCKInfo *sideCarCKInfo;
  unint64_t sharingOptions;
  BRCUserRowID *ownerKey;
  BRCItemID *itemID;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  objc_super v50;

  v49 = a3;
  -[BRCServerZone dbRowID](self->super._serverZone, "dbRowID");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  itemID = self->super._itemID;
  ownerKey = self->super._ownerKey;
  sharingOptions = self->super._sharingOptions;
  sideCarCKInfo = self->super._sideCarCKInfo;
  parentZoneRowID = self->super._parentZoneRowID;
  localDiffs = self->super._localDiffs;
  notifsRank = self->super._notifsRank;
  syncUpState = self->super._syncUpState;
  -[BRCLocalItem appLibrary](self, "appLibrary");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "dbRowID");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  minimumSupportedOSRowID = self->super._minimumSupportedOSRowID;
  isUserVisible = self->super._isUserVisible;
  -[BRCStatInfo ckInfo](self->super._st, "ckInfo");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = -[BRCStatInfo state](self->super._st, "state");
  v26 = -[BRCStatInfo type](self->super._st, "type");
  v25 = -[BRCStatInfo mode](self->super._st, "mode");
  v23 = -[BRCStatInfo birthtime](self->super._st, "birthtime");
  v18 = -[BRCStatInfo lastUsedTime](self->super._st, "lastUsedTime");
  v24 = -[BRCStatInfo favoriteRank](self->super._st, "favoriteRank");
  -[BRCStatInfo parentID](self->super._st, "parentID");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  st = self->super._st;
  logicalName = (const __CFString *)st->super._logicalName;
  if (!logicalName)
    logicalName = &stru_1E8769030;
  v22 = logicalName;
  v21 = -[BRCStatInfo isHiddenExt](st, "isHiddenExt");
  -[BRCStatInfo finderTags](self->super._st, "finderTags");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCStatInfo xattrSignature](self->super._st, "xattrSignature");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCStatInfo trashPutBackPath](self->super._st, "trashPutBackPath");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCStatInfo trashPutBackParentID](self->super._st, "trashPutBackParentID");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCStatInfo aliasTarget](self->super._st, "aliasTarget");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCStatInfo creatorRowID](self->super._st, "creatorRowID");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCLocalStatInfo documentID](self->super._st, "documentID");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCLocalStatInfo fileID](self->super._st, "fileID");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
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
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[BRCLocalStatInfo itemScope](self->super._st, "itemScope");
  -[BRCLocalStatInfo tmpBouncedNo](self->super._st, "tmpBouncedNo");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v49, "execute:", CFSTR("INSERT INTO client_items(rowid, zone_rowid, item_id, item_creator_id, item_sharing_options, item_side_car_ckinfo, item_parent_zone_rowid, item_localsyncupstate, item_local_diffs, item_notifs_rank, app_library_rowid, item_min_supported_os_rowid, item_user_visible, item_stat_ckinfo, item_state, item_type, item_mode, item_birthtime, item_lastusedtime, item_favoriterank,item_parent_id, item_filename, item_hidden_ext, item_finder_tags, item_xattr_signature, item_trash_put_back_path, item_trash_put_back_parent_id, item_alias_target, item_creator, item_doc_id, item_file_id, item_generation, item_localname, item_processing_stamp, item_staged_file_id, item_staged_generation, item_bouncedname, item_scope, item_tmpbounceno) VALUES(%lld, %@, %@, %@, %ld, %@, %@, %d, %lld, %lld, %@, %@, %d, %@, %d, %d, %d, %lld, %lld, %lld, %@, %@, %d, %@, %@, %@, %@, %@, %@, %@, %@, %@, %@, %@, %@, %u, %@, %d, %@)"), a4, v47, itemID, ownerKey, sharingOptions, sideCarCKInfo, parentZoneRowID, syncUpState, localDiffs, notifsRank, v46, minimumSupportedOSRowID, isUserVisible, v48, v27, v26,
                       v25,
                       v23,
                       v18,
                       v24,
                       v45,
                       v22,
                       v21,
                       v7,
                       v44,
                       v43,
                       v42,
                       v41,
                       v40,
                       v20,
                       v19,
                       v8,
                       v9,
                       v10,
                       v11,
                       v12,
                       v13,
                       v14,
                       v15))
  {
    v50.receiver = self;
    v50.super_class = (Class)BRCAliasItem;
    v16 = -[BRCLocalItem _insertInDB:dbRowID:](&v50, sel__insertInDB_dbRowID_, v49, a4);
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (BOOL)_updateInDB:(id)a3 diffs:(unint64_t)a4
{
  void *v5;
  int v6;
  void *v7;
  BRCLocalStatInfo *st;
  const __CFString *logicalName;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  unsigned int v14;
  void *v15;
  BOOL v16;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _BOOL4 v24;
  const __CFString *v25;
  int64_t v26;
  int64_t v27;
  int64_t v28;
  int v29;
  int v30;
  NSNumber *minimumSupportedOSRowID;
  _BOOL8 isUserVisible;
  unint64_t sharingOptions;
  unint64_t notifsRank;
  uint64_t syncUpState;
  unint64_t localDiffs;
  BRCZoneRowID *parentZoneRowID;
  BRCUserRowID *ownerKey;
  BRCItemID *itemID;
  BRFieldCKInfo *sideCarCKInfo;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  objc_super v50;

  v49 = a3;
  -[BRCClientZone dbRowID](self->super._clientZone, "dbRowID");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  itemID = self->super._itemID;
  ownerKey = self->super._ownerKey;
  sharingOptions = self->super._sharingOptions;
  sideCarCKInfo = self->super._sideCarCKInfo;
  parentZoneRowID = self->super._parentZoneRowID;
  localDiffs = self->super._localDiffs;
  notifsRank = self->super._notifsRank;
  syncUpState = self->super._syncUpState;
  -[BRCLocalItem appLibrary](self, "appLibrary");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "dbRowID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  minimumSupportedOSRowID = self->super._minimumSupportedOSRowID;
  isUserVisible = self->super._isUserVisible;
  -[BRCStatInfo ckInfo](self->super._st, "ckInfo");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[BRCStatInfo state](self->super._st, "state");
  v30 = -[BRCStatInfo type](self->super._st, "type");
  v29 = -[BRCStatInfo mode](self->super._st, "mode");
  v28 = -[BRCStatInfo birthtime](self->super._st, "birthtime");
  v27 = -[BRCStatInfo lastUsedTime](self->super._st, "lastUsedTime");
  v26 = -[BRCStatInfo favoriteRank](self->super._st, "favoriteRank");
  -[BRCStatInfo parentID](self->super._st, "parentID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  st = self->super._st;
  logicalName = (const __CFString *)st->super._logicalName;
  if (!logicalName)
    logicalName = &stru_1E8769030;
  v25 = logicalName;
  v24 = -[BRCStatInfo isHiddenExt](st, "isHiddenExt");
  -[BRCStatInfo finderTags](self->super._st, "finderTags");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCStatInfo xattrSignature](self->super._st, "xattrSignature");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCStatInfo trashPutBackPath](self->super._st, "trashPutBackPath");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCStatInfo trashPutBackParentID](self->super._st, "trashPutBackParentID");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCStatInfo aliasTarget](self->super._st, "aliasTarget");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCStatInfo creatorRowID](self->super._st, "creatorRowID");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCLocalStatInfo documentID](self->super._st, "documentID");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCLocalStatInfo fileID](self->super._st, "fileID");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCLocalStatInfo generationID](self->super._st, "generationID");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCLocalStatInfo physicalName](self->super._st, "physicalName");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCLocalStatInfo processingStamp](self->super._st, "processingStamp");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCLocalStatInfo stagedFileIDForDB](self->super._st, "stagedFileIDForDB");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[BRCLocalStatInfo stagedGenerationID](self->super._st, "stagedGenerationID");
  -[BRCLocalStatInfo rawBouncedLogicalName](self->super._st, "rawBouncedLogicalName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[BRCLocalStatInfo itemScope](self->super._st, "itemScope");
  -[BRCLocalStatInfo tmpBouncedNo](self->super._st, "tmpBouncedNo");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v49, "execute:", CFSTR("UPDATE client_items SET  zone_rowid = %@, item_id = %@, item_creator_id = %@, item_sharing_options = %ld, item_side_car_ckinfo = %@, item_parent_zone_rowid = %@, item_localsyncupstate = %d, item_local_diffs = %llu, item_notifs_rank = %lld, app_library_rowid = %@, item_min_supported_os_rowid = %@, item_user_visible = %d, item_stat_ckinfo = %@, item_state = %d, item_type = %d, item_mode = %d, item_birthtime = %lld, item_lastusedtime = %lld, item_favoriterank = %lld, item_parent_id = %@, item_filename = %@, item_hidden_ext = %d, item_finder_tags = %@, item_xattr_signature = %@, item_trash_put_back_path = %@, item_trash_put_back_parent_id = %@, item_alias_target = %@, item_creator = %@, item_doc_id = %@, item_file_id = %@, item_generation = %@, item_localname = %@, item_processing_stamp = %@, item_staged_file_id = %@, item_staged_generation = %u, item_bouncedname = %@, item_scope = %d, item_tmpbounceno = %@  WHERE rowid = %llu"), v47, itemID, ownerKey, sharingOptions, sideCarCKInfo, parentZoneRowID, syncUpState, localDiffs, notifsRank, v5, minimumSupportedOSRowID, isUserVisible, v48, v6, v30, v29,
                       v28,
                       v27,
                       v26,
                       v7,
                       v25,
                       v24,
                       v46,
                       v45,
                       v44,
                       v43,
                       v42,
                       v23,
                       v22,
                       v21,
                       v20,
                       v19,
                       v10,
                       v11,
                       v12,
                       v13,
                       v14,
                       v15,
                       self->super._dbRowID))
  {
    v50.receiver = self;
    v50.super_class = (Class)BRCAliasItem;
    v16 = -[BRCLocalItem _updateInDB:diffs:](&v50, sel__updateInDB_diffs_, v49, a4);
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (BRCClientZone)targetClientZone
{
  BRCAccountSession *session;
  void *v3;
  void *v4;

  session = self->super._session;
  -[BRCStatInfo _aliasTargetMangledID](self->super._st, "_aliasTargetMangledID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCAccountSession clientZoneByMangledID:](session, "clientZoneByMangledID:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (BRCClientZone *)v4;
}

- (BRCItemID)targetItemID
{
  return (BRCItemID *)-[BRCStatInfo _aliasTargetItemID](self->super._st, "_aliasTargetItemID");
}

- (void)markNeedsUploadOrSyncingUp
{
  -[BRCAliasItem markNeedsUploadOrSyncingUpWithAliasTarget:](self, "markNeedsUploadOrSyncingUpWithAliasTarget:", 0);
}

- (void)markNeedsUploadOrSyncingUpWithAliasTarget:(id)a3
{
  id v4;

  v4 = a3;
  if (-[BRCLocalItem isDead](self, "isDead") || (objc_msgSend(v4, "isKnownByServer") & 1) != 0)
    -[BRCLocalItem _markNeedsSyncingUp](self, "_markNeedsSyncingUp");
  else
    self->super._syncUpState = 3;

}

- (void)markLatestSyncRequestRejectedInZone:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  objc_super v7;

  self->super._localDiffs = 0;
  v4 = a3;
  brc_bread_crumbs();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[BRCAliasItem markLatestSyncRequestRejectedInZone:].cold.1((uint64_t)v5, v6);

  v7.receiver = self;
  v7.super_class = (Class)BRCAliasItem;
  -[BRCLocalItem markLatestSyncRequestRejectedInZone:](&v7, sel_markLatestSyncRequestRejectedInZone_, v4);

}

- (BOOL)updateXattrInfoFromPath:(id)a3 error:(id *)a4
{
  return 1;
}

- (BOOL)changedAtRelativePath:(id)a3 scanPackage:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  NSObject *v8;
  char v9;
  char v10;
  void *v11;
  NSObject *v12;
  objc_super v14;
  uint64_t v15[3];
  uint8_t buf[4];
  uint64_t v17;
  __int16 v18;
  BRCAliasItem *v19;
  __int16 v20;
  id v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v4 = a4;
  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  memset(v15, 0, sizeof(v15));
  __brc_create_section(0, (uint64_t)"-[BRCAliasItem(LegacyAdditions) changedAtRelativePath:scanPackage:]", 28, v15);
  brc_bread_crumbs();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218754;
    v17 = v15[0];
    v18 = 2112;
    v19 = self;
    v20 = 2112;
    v21 = v6;
    v22 = 2112;
    v23 = v7;
    _os_log_debug_impl(&dword_1CBD43000, v8, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx diffing item %@\nagainst %@%@", buf, 0x2Au);
  }

  v9 = objc_msgSend(v6, "isBRAlias");
  if ((v9 & 1) == 0)
  {
    brc_bread_crumbs();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      -[BRCAliasItem(LegacyAdditions) changedAtRelativePath:scanPackage:].cold.2();
    goto LABEL_10;
  }
  v14.receiver = self;
  v14.super_class = (Class)BRCAliasItem;
  if (!-[BRCLocalItem changedAtRelativePath:scanPackage:](&v14, sel_changedAtRelativePath_scanPackage_, v6, v4))
  {
    brc_bread_crumbs();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      -[BRCAliasItem(LegacyAdditions) changedAtRelativePath:scanPackage:].cold.1();
LABEL_10:

    v10 = v9 ^ 1;
    goto LABEL_11;
  }
  v10 = 1;
LABEL_11:
  __brc_leave_section(v15);

  return v10;
}

- (BRCAppLibrary)targetAppLibrary
{
  BRCAccountSession *session;
  void *v3;
  void *v4;

  session = self->super._session;
  -[BRCStatInfo _aliasTargetMangledID](self->super._st, "_aliasTargetMangledID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCAccountSession appLibraryByMangledID:](session, "appLibraryByMangledID:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (BRCAppLibrary *)v4;
}

- (void)learnTarget:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  char v9;
  uint64_t v10[3];
  uint8_t buf[4];
  uint64_t v12;
  __int16 v13;
  id v14;
  __int16 v15;
  BRCAliasItem *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  memset(v10, 0, sizeof(v10));
  __brc_create_section(0, (uint64_t)"-[BRCAliasItem(LegacyAdditions) learnTarget:]", 49, v10);
  brc_bread_crumbs();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218754;
    v12 = v10[0];
    v13 = 2112;
    v14 = v4;
    v15 = 2112;
    v16 = self;
    v17 = 2112;
    v18 = v5;
    _os_log_debug_impl(&dword_1CBD43000, v6, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx learning target %@ for %@%@", buf, 0x2Au);
  }

  -[BRCLocalItem appLibrary](self, "appLibrary");
  v7 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appLibrary");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v7 == v8)
  {
    v9 = objc_msgSend(v4, "isSharedToMe");

    if ((v9 & 1) != 0)
      goto LABEL_6;
    brc_bread_crumbs();
    v7 = objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      -[BRCAliasItem(LegacyAdditions) learnTarget:].cold.1();
  }

LABEL_6:
  -[BRCStatInfo _updateAliasTarget:](self->super._st, "_updateAliasTarget:", v4);
  __brc_leave_section(v10);

}

- (void)rewriteOrDeleteAliasOnDiskWithTarget:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  BRCRelativePath *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  NSObject *v15;
  BRCRelativePath *v16;
  BRCBookmark *v17;
  void *v18;
  uint64_t v19;
  BRCBookmark *v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  BOOL v25;
  void *v26;
  NSObject *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  NSObject *v31;
  id v32;
  id v33;
  uint64_t v34[3];
  int v35;
  uint8_t buf[4];
  uint64_t v37;
  __int16 v38;
  _BYTE v39[18];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "appLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "db");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "assertOnQueue");

  v35 = 0;
  -[BRCLocalStatInfo fileID](self->super._st, "fileID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (BRCRelativePath *)objc_msgSend(v7, "unsignedLongLongValue");

  memset(v34, 0, sizeof(v34));
  __brc_create_section(0, (uint64_t)"-[BRCAliasItem(LegacyAdditions) rewriteOrDeleteAliasOnDiskWithTarget:]", 64, v34);
  brc_bread_crumbs();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218498;
    v37 = v34[0];
    v38 = 2112;
    *(_QWORD *)v39 = self;
    *(_WORD *)&v39[8] = 2112;
    *(_QWORD *)&v39[10] = v9;
    _os_log_debug_impl(&dword_1CBD43000, v10, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx rewriting alias on disk: %@%@", buf, 0x20u);
  }

  if (v8)
    v8 = -[BRCRelativePath initWithFileID:session:]([BRCRelativePath alloc], "initWithFileID:session:", v8, self->super._session);
  if (!-[BRCRelativePath resolveMustExist:error:](v8, "resolveMustExist:error:", 0, &v35))
  {
    brc_bread_crumbs();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      v37 = (uint64_t)v8;
      v38 = 1024;
      *(_DWORD *)v39 = v35;
      *(_WORD *)&v39[4] = 2112;
      *(_QWORD *)&v39[6] = v14;
      _os_log_impl(&dword_1CBD43000, v15, OS_LOG_TYPE_DEFAULT, "[WARNING] can't resolve %@ %{errno}d%@", buf, 0x1Cu);
    }

    goto LABEL_11;
  }
  -[BRCRelativePath appLibrary](v8, "appLibrary");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appLibrary");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v11, "isEqualToAppLibrary:", v12);

  if (v13)
  {
    -[BRCAliasItem targetMovedToThisAppLibrary](self, "targetMovedToThisAppLibrary");
    goto LABEL_12;
  }
  v16 = -[BRCRelativePath initWithFileID:session:]([BRCRelativePath alloc], "initWithFileID:session:", -[BRCRelativePath parentFileID](v8, "parentFileID"), self->super._session);
  v17 = [BRCBookmark alloc];
  -[BRCRelativePath appLibrary](v8, "appLibrary");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCLocalItem session](self, "session");
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = -[BRCBookmark initWithTarget:owningAppLibrary:path:session:](v17, "initWithTarget:owningAppLibrary:path:session:", v4, v18, 0, v19);

  v33 = 0;
  LOBYTE(v19) = -[BRCBookmark resolveWithError:](v20, "resolveWithError:", &v33);
  v21 = v33;
  if ((v19 & 1) != 0)
  {
    if (-[BRCRelativePath resolveAndKeepOpenMustExist:error:](v16, "resolveAndKeepOpenMustExist:error:", 1, &v35))
    {
      -[BRCRelativePath filename](v8, "filename");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = v21;
      -[BRCBookmark writeUnderParent:name:error:](v20, "writeUnderParent:name:error:", v16, v22, &v32);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v32;

      v25 = v23 != 0;
      if (v23)
      {
        -[BRCLocalItem updateFromFSAtPath:](self, "updateFromFSAtPath:", v23);
      }
      else
      {
        brc_bread_crumbs();
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v31 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          v37 = (uint64_t)v24;
          v38 = 2112;
          *(_QWORD *)v39 = v30;
          _os_log_impl(&dword_1CBD43000, v31, OS_LOG_TYPE_DEFAULT, "[WARNING] can't write bookmark %@%@", buf, 0x16u);
        }

      }
      -[BRCRelativePath close](v16, "close");
    }
    else
    {
      brc_bread_crumbs();
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412802;
        v37 = (uint64_t)v16;
        v38 = 1024;
        *(_DWORD *)v39 = v35;
        *(_WORD *)&v39[4] = 2112;
        *(_QWORD *)&v39[6] = v28;
        _os_log_impl(&dword_1CBD43000, v29, OS_LOG_TYPE_DEFAULT, "[WARNING] can't resolve parent %@ %{errno}d%@", buf, 0x1Cu);
      }

      v23 = 0;
      v25 = 0;
      v24 = v21;
    }

    v21 = v24;
  }
  else
  {
    brc_bread_crumbs();
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412802;
      v37 = (uint64_t)v21;
      v38 = 2112;
      *(_QWORD *)v39 = v4;
      *(_WORD *)&v39[8] = 2112;
      *(_QWORD *)&v39[10] = v26;
      _os_log_debug_impl(&dword_1CBD43000, v27, OS_LOG_TYPE_DEBUG, "[DEBUG] Grabbing the bookmark data fails with: %@\nMarking the target lost: %@%@", buf, 0x20u);
    }

    objc_msgSend(v4, "markLostClearGenerationID:backoffMode:", 0, 1);
    v25 = 0;
  }
  -[BRCRelativePath close](v8, "close");

  if (!v25)
LABEL_11:
    -[BRCLocalItem markLostClearGenerationID:backoffMode:](self, "markLostClearGenerationID:backoffMode:", 0, 1);
LABEL_12:
  __brc_leave_section(v34);

}

- (BOOL)updateOnDiskWithAliasTarget:(id)a3 forServerEdit:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  BRCItemID *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  BRCRelativePath *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  BRCRelativePath *v17;
  void *v18;
  BRCRelativePath *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  char v23;
  char v24;
  void *v26;
  NSObject *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30[3];
  uint8_t buf[4];
  uint64_t v32;
  __int16 v33;
  BRCItemID *v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  id v38;
  __int16 v39;
  void *v40;
  uint64_t v41;

  v4 = a4;
  v41 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = self->super._itemID;
  objc_msgSend(v6, "aliasItemID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  memset(v30, 0, sizeof(v30));
  __brc_create_section(0, (uint64_t)"-[BRCAliasItem(LegacyAdditions) updateOnDiskWithAliasTarget:forServerEdit:]", 117, v30);
  brc_bread_crumbs();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    v28 = v30[0];
    -[BRCClientZone mangledID](self->super._clientZone, "mangledID");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134219010;
    v32 = v28;
    v33 = 2112;
    v34 = v7;
    v35 = 2112;
    v36 = v29;
    v37 = 2112;
    v38 = v6;
    v39 = 2112;
    v40 = v9;
    _os_log_debug_impl(&dword_1CBD43000, v10, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx Updating alias %@ in %@ with new target: %@%@", buf, 0x34u);

  }
  if ((objc_msgSend(v8, "isEqualToItemID:", v7) & 1) != 0)
    goto LABEL_18;
  -[BRCLocalStatInfo fileID](self->super._st, "fileID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (BRCRelativePath *)objc_msgSend(v11, "unsignedLongLongValue");

  if (v12)
    v12 = -[BRCRelativePath initWithFileID:session:]([BRCRelativePath alloc], "initWithFileID:session:", v12, self->super._session);
  if (!v8)
  {
LABEL_17:
    -[BRCAliasItem learnTarget:](self, "learnTarget:", v6);
    -[BRCAliasItem rewriteOrDeleteAliasOnDiskWithTarget:](self, "rewriteOrDeleteAliasOnDiskWithTarget:", v6);

LABEL_18:
    -[BRCAliasItem markNeedsUploadOrSyncingUpWithAliasTarget:](self, "markNeedsUploadOrSyncingUpWithAliasTarget:", v6);
    v24 = -[BRCLocalItem saveToDBForServerEdit:keepAliases:](self, "saveToDBForServerEdit:keepAliases:", v4, 0);
    goto LABEL_19;
  }
  -[BRCClientZone itemByItemID:](self->super._clientZone, "itemByItemID:", v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (!v13)
  {
    -[BRCLocalItem appLibrary](self, "appLibrary");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "wasMovedToCloudDocs");

    if ((v23 & 1) == 0)
      -[BRCLocalItem learnItemID:serverItem:path:markLost:](self, "learnItemID:serverItem:path:markLost:", v8, 0, 0, 0);
    goto LABEL_17;
  }
  objc_msgSend(v13, "st");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "fileID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (BRCRelativePath *)objc_msgSend(v16, "unsignedLongLongValue");

  if (v17)
    v17 = -[BRCRelativePath initWithFileID:session:]([BRCRelativePath alloc], "initWithFileID:session:", v17, self->super._session);
  -[BRCClientZone asPrivateClientZone](self->super._clientZone, "asPrivateClientZone");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "resolveClashOfAlias:atPath:withAlias:atPath:", self, v12, v14, v17);
  v19 = (BRCRelativePath *)objc_claimAutoreleasedReturnValue();

  if (v19 == v17)
  {
    v24 = 1;
  }
  else
  {
    if (-[BRCRelativePath exists](v19, "exists"))
    {
      brc_bread_crumbs();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
        -[BRCAliasItem(LegacyAdditions) updateOnDiskWithAliasTarget:forServerEdit:].cold.1();

      -[BRCLocalItem updateFromFSAtPath:](self, "updateFromFSAtPath:", v17);
    }
    else
    {
      brc_bread_crumbs();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
        -[BRCAliasItem(LegacyAdditions) updateOnDiskWithAliasTarget:forServerEdit:].cold.2();

    }
    objc_msgSend(v14, "markLostClearGenerationID:backoffMode:", 0, 1);
    v24 = objc_msgSend(v14, "saveToDB");
  }

LABEL_19:
  __brc_leave_section(v30);

  return v24;
}

- (void)_removeAliasAndMarkDead
{
  void *v3;
  BRCRelativePath *v4;
  _QWORD v5[5];

  -[BRCLocalStatInfo fileID](self->super._st, "fileID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (BRCRelativePath *)objc_msgSend(v3, "unsignedLongLongValue");

  if (v4)
  {
    v4 = -[BRCRelativePath initWithFileID:session:]([BRCRelativePath alloc], "initWithFileID:session:", v4, self->super._session);
    if (-[BRCRelativePath resolveMustExist:error:](v4, "resolveMustExist:error:", 1, 0))
    {
      v5[0] = MEMORY[0x1E0C809B0];
      v5[1] = 3221225472;
      v5[2] = __56__BRCAliasItem_LegacyAdditions___removeAliasAndMarkDead__block_invoke;
      v5[3] = &unk_1E875EF40;
      v5[4] = self;
      -[BRCRelativePath performOnOpenParentFileDescriptor:error:](v4, "performOnOpenParentFileDescriptor:error:", v5, 0);
    }
  }
  -[BRCLocalItem markDead](self, "markDead");
  -[BRCAliasItem markNeedsUploadOrSyncingUp](self, "markNeedsUploadOrSyncingUp");
  -[BRCLocalItem saveToDBForServerEdit:keepAliases:](self, "saveToDBForServerEdit:keepAliases:", 1, 0);

}

uint64_t __56__BRCAliasItem_LegacyAdditions___removeAliasAndMarkDead__block_invoke(uint64_t a1, int a2)
{
  void *v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "st");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "filename");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  BRCUnlinkAt(a2, v4, 0);

  return 0;
}

- (void)targetMovedToTrashOrDeleted
{
  void *v3;
  NSObject *v4;
  BRCItemID *itemID;
  uint64_t v6;
  void *v7;
  uint64_t v8[3];
  uint8_t buf[4];
  uint64_t v10;
  __int16 v11;
  BRCItemID *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  memset(v8, 0, sizeof(v8));
  __brc_create_section(0, (uint64_t)"-[BRCAliasItem(LegacyAdditions) targetMovedToTrashOrDeleted]", 187, v8);
  brc_bread_crumbs();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    itemID = self->super._itemID;
    v6 = v8[0];
    -[BRCClientZone mangledID](self->super._clientZone, "mangledID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218754;
    v10 = v6;
    v11 = 2112;
    v12 = itemID;
    v13 = 2112;
    v14 = v7;
    v15 = 2112;
    v16 = v3;
    _os_log_debug_impl(&dword_1CBD43000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx Deleting alias %@ in %@ because target is dead%@", buf, 0x2Au);

  }
  -[BRCAliasItem _removeAliasAndMarkDead](self, "_removeAliasAndMarkDead");
  __brc_leave_section(v8);
}

- (void)targetMovedToThisAppLibrary
{
  void *v3;
  NSObject *v4;
  BRCItemID *itemID;
  uint64_t v6;
  void *v7;
  uint64_t v8[3];
  uint8_t buf[4];
  uint64_t v10;
  __int16 v11;
  BRCItemID *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  memset(v8, 0, sizeof(v8));
  __brc_create_section(0, (uint64_t)"-[BRCAliasItem(LegacyAdditions) targetMovedToThisAppLibrary]", 194, v8);
  brc_bread_crumbs();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    itemID = self->super._itemID;
    v6 = v8[0];
    -[BRCClientZone mangledID](self->super._clientZone, "mangledID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218754;
    v10 = v6;
    v11 = 2112;
    v12 = itemID;
    v13 = 2112;
    v14 = v7;
    v15 = 2112;
    v16 = v3;
    _os_log_debug_impl(&dword_1CBD43000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx Deleting alias %@ in %@ because target moved to this app library%@", buf, 0x2Au);

  }
  -[BRCAliasItem _removeAliasAndMarkDead](self, "_removeAliasAndMarkDead");
  __brc_leave_section(v8);
}

- (id)targetDocument
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[BRCAliasItem targetItemID](self, "targetItemID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCAliasItem targetClientZone](self, "targetClientZone");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "itemByItemID:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "asDocument");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)evictInTask:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  id v8;
  void *v9;
  char v10;
  objc_super v12;

  v8 = a3;
  v12.receiver = self;
  v12.super_class = (Class)BRCAliasItem;
  if (-[BRCLocalItem evictInTask:options:error:](&v12, sel_evictInTask_options_error_, v8, a4, a5))
  {
    -[BRCAliasItem targetDocument](self, "targetDocument");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "evictInTask:options:error:", v8, a4, a5);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)startDownloadInTask:(id)a3 options:(unint64_t)a4 etagIfLoser:(id)a5 stageFileName:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  char v16;
  objc_super v18;

  v12 = a3;
  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)BRCAliasItem;
  if (-[BRCLocalItem startDownloadInTask:options:etagIfLoser:stageFileName:error:](&v18, sel_startDownloadInTask_options_etagIfLoser_stageFileName_error_, v12, a4, v13, v14, a7))
  {
    -[BRCAliasItem targetDocument](self, "targetDocument");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "startDownloadInTask:options:etagIfLoser:stageFileName:error:", v12, a4, v13, v14, a7);

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

+ (id)targetReferenceWithItemID:(id)a3 targetZone:(id)a4 isFolderShare:(BOOL)a5
{
  id v7;
  id v8;
  void *v9;
  __CFString *v10;
  int v11;
  __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v7 = a3;
  v8 = a4;
  objc_msgSend(v8, "zoneID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (a5)
  {
    v10 = CFSTR("directory/");
  }
  else
  {
    v11 = objc_msgSend(v8, "isSharedZone");
    v10 = CFSTR("documentStructure/");
    if (v11)
      v10 = CFSTR("documentContent/");
  }
  v12 = v10;
  objc_msgSend(v7, "itemIDString");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[__CFString stringByAppendingString:](v12, "stringByAppendingString:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C95070]), "initWithRecordName:zoneID:", v14, v9);
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C950C0]), "initWithRecordID:action:", v15, 0);

  return v16;
}

+ (void)fillStructureRecord:(id)a3 inZone:(id)a4 itemID:(id)a5 ckInfo:(id)a6 parentID:(id)a7 targetItemID:(id)a8 targetZone:(id)a9 diffs:(unint64_t)a10 isFolderShare:(BOOL)a11 beingDeadInServerTruth:(BOOL)a12 shouldPCSChainStatus:(unsigned __int8)a13
{
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  _BOOL4 v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v33;

  v33 = a3;
  v18 = a4;
  v19 = a5;
  v20 = a6;
  v21 = a7;
  v22 = a8;
  v23 = a9;
  if (a12)
  {
    v24 = 1;
  }
  else
  {
    objc_msgSend(v20, "etag");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v25 == 0;

  }
  if ((a13 & 0x2C) != 0 || (a10 & 0x20) != 0 || v24)
  {
    objc_msgSend(v21, "validatingDirectoryReferenceInZone:", v18);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setObject:forKeyedSubscript:", v26, CFSTR("parent"));

    if ((a13 & 0x3C) != 0)
    {
      objc_msgSend(v21, "pcsChainParentReferenceInZone:", v18);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "setParent:", v27);

    }
  }
  if (v24)
  {
    if (objc_msgSend(v23, "isPrivateZone"))
      v28 = v22;
    else
      v28 = v19;
    objc_msgSend(v28, "itemIDString");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "brc_SHA256");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setObject:forKeyedSubscript:", v30, CFSTR("basehash"));

    objc_msgSend(a1, "targetReferenceWithItemID:targetZone:isFolderShare:", v22, v23, a11);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setObject:forKeyedSubscript:", v31, CFSTR("target"));

  }
  if (!a12)
    objc_msgSend(v33, "serializeSystemFields:", v20);

}

- (id)structureRecordBeingDeadInServerTruth:(BOOL)a3 stageID:(id)a4 shouldPCSChainStatus:(unsigned __int8)a5
{
  void *v6;
  void *v7;
  BRCServerZone *serverZone;
  BRCItemID *itemID;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v16;

  -[BRCLocalItem baseStructureRecord](self, "baseStructureRecord", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_opt_class();
  serverZone = self->super._serverZone;
  itemID = self->super._itemID;
  -[BRCStatInfo ckInfo](self->super._st, "ckInfo");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCStatInfo parentID](self->super._st, "parentID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCAliasItem targetItemID](self, "targetItemID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCAliasItem targetClientZone](self, "targetClientZone");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "serverZone");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  BYTE2(v16) = a5;
  BYTE1(v16) = a3;
  LOBYTE(v16) = 0;
  objc_msgSend(v7, "fillStructureRecord:inZone:itemID:ckInfo:parentID:targetItemID:targetZone:diffs:isFolderShare:beingDeadInServerTruth:shouldPCSChainStatus:", v6, serverZone, itemID, v10, v11, v12, v14, self->super._localDiffs | -[BRCLocalItem diffAgainstOriginalItem](self, "diffAgainstOriginalItem"), v16);

  return v6;
}

- (void)isBRAlias
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_fault_impl(&dword_1CBD43000, a2, OS_LOG_TYPE_FAULT, "[CRIT] Assertion failed: _st.type == BRC_ITEM_TYPE_ALIAS%@", (uint8_t *)&v2, 0xCu);
}

- (void)markLatestSyncRequestRejectedInZone:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_1CBD43000, a2, OS_LOG_TYPE_DEBUG, "[DEBUG] Forcing rejection of alias item%@", (uint8_t *)&v2, 0xCu);
}

@end
