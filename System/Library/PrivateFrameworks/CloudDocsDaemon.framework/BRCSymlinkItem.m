@implementation BRCSymlinkItem

- (void)readTargetFromRelativePathAndSyncUp:(id)a3
{
  id v4;
  NSString **p_symlinkTarget;
  NSString *symlinkTarget;
  void *v7;
  NSString *v8;
  NSString *v9;
  NSString *v10;
  char v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  NSString *v15;
  void *v16;
  NSObject *v17;

  v4 = a3;
  p_symlinkTarget = &self->_symlinkTarget;
  symlinkTarget = self->_symlinkTarget;
  objc_msgSend(v4, "symlinkContent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = symlinkTarget;
  v9 = v7;
  if (v8 == v9)
  {

  }
  else
  {
    v10 = v9;
    if (!v9)
    {

LABEL_10:
      objc_msgSend(v4, "symlinkContent");
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = *p_symlinkTarget;
      *p_symlinkTarget = (NSString *)v14;

      brc_bread_crumbs();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        -[BRCSymlinkItem(LegacyAdditions) readTargetFromRelativePathAndSyncUp:].cold.2((uint64_t *)&self->_symlinkTarget, (uint64_t)v16, v17);

      -[BRCLocalItem markNeedsUploadOrSyncingUp](self, "markNeedsUploadOrSyncingUp");
      goto LABEL_13;
    }
    v11 = -[NSString isEqual:](v8, "isEqual:", v9);

    if ((v11 & 1) == 0)
      goto LABEL_10;
  }
  brc_bread_crumbs();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    -[BRCSymlinkItem(LegacyAdditions) readTargetFromRelativePathAndSyncUp:].cold.1((uint64_t)v12, v13);

LABEL_13:
}

- (BOOL)isSymLink
{
  return 1;
}

- (id)_initWithServerItem:(id)a3 dbRowID:(unint64_t)a4
{
  id v6;
  _QWORD *v7;
  uint64_t v8;
  void *v9;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)BRCSymlinkItem;
  v7 = -[BRCLocalItem _initWithServerItem:dbRowID:](&v11, sel__initWithServerItem_dbRowID_, v6, a4);
  if (v7)
  {
    objc_msgSend(v6, "symlinkTarget");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v7[25];
    v7[25] = v8;

  }
  return v7;
}

- (id)_initWithLocalItem:(id)a3
{
  id v4;
  _QWORD *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)BRCSymlinkItem;
  v5 = -[BRCLocalItem _initWithLocalItem:](&v10, sel__initWithLocalItem_, v4);
  if (v5)
  {
    objc_msgSend(v4, "asSymlink");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "symlinkTarget");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v5[25];
    v5[25] = v7;

  }
  return v5;
}

- (id)_initFromPQLResultSet:(id)a3 session:(id)a4 db:(id)a5 error:(id *)a6
{
  id v10;
  _QWORD *v11;
  uint64_t v12;
  void *v13;
  objc_super v15;

  v10 = a3;
  v15.receiver = self;
  v15.super_class = (Class)BRCSymlinkItem;
  v11 = -[BRCLocalItem _initFromPQLResultSet:session:db:error:](&v15, sel__initFromPQLResultSet_session_db_error_, v10, a4, a5, a6);
  if (v11)
  {
    objc_msgSend(v10, "objectOfClass:atIndex:", objc_opt_class(), 39);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)v11[25];
    v11[25] = v12;

  }
  return v11;
}

- (id)descriptionWithContext:(id)a3
{
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)BRCSymlinkItem;
  -[BRCLocalItem descriptionWithContext:](&v7, sel_descriptionWithContext_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSString fp_obfuscatedPath](self->_symlinkTarget, "fp_obfuscatedPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR(" target:'%@'"), v5);

  return v4;
}

- (unint64_t)diffAgainstServerItem:(id)a3
{
  id v4;
  unint64_t v5;
  NSString *symlinkTarget;
  void *v7;
  NSString *v8;
  NSString *v9;
  NSString *v10;
  int v11;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  objc_super v21;

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)BRCSymlinkItem;
  v5 = -[BRCLocalItem diffAgainstServerItem:](&v21, sel_diffAgainstServerItem_, v4);
  if (v4 && (objc_msgSend(v4, "isSymLink") & 1) == 0)
  {
    brc_bread_crumbs();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      -[BRCSymlinkItem diffAgainstServerItem:].cold.1((uint64_t)v13, v14, v15, v16, v17, v18, v19, v20);

  }
  if (objc_msgSend(v4, "isSymLink") && (v5 & 0x2000) == 0)
  {
    symlinkTarget = self->_symlinkTarget;
    objc_msgSend(v4, "symlinkTarget");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = symlinkTarget;
    v9 = v7;
    v10 = v9;
    if (v8 == v9)
    {
      v11 = 0;
    }
    else if (v9)
    {
      v11 = -[NSString isEqual:](v8, "isEqual:", v9) ^ 1;
    }
    else
    {
      v11 = 1;
    }

    if (v11)
      v5 |= 0x2000uLL;
  }

  return v5;
}

- (unint64_t)diffAgainstLocalItem:(id)a3
{
  id v4;
  unint64_t v5;
  void *v6;
  void *v7;
  NSString *symlinkTarget;
  void *v9;
  NSString *v10;
  NSString *v11;
  NSString *v12;
  int v13;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  objc_super v23;

  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)BRCSymlinkItem;
  v5 = -[BRCLocalItem diffAgainstLocalItem:](&v23, sel_diffAgainstLocalItem_, v4);
  if (v4 && (objc_msgSend(v4, "isSymLink") & 1) == 0)
  {
    brc_bread_crumbs();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
      -[BRCSymlinkItem diffAgainstServerItem:].cold.1((uint64_t)v15, v16, v17, v18, v19, v20, v21, v22);

  }
  if (objc_msgSend(v4, "isSymLink"))
  {
    objc_msgSend(v4, "asSymlink");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if ((v5 & 0x2000) == 0)
    {
      symlinkTarget = self->_symlinkTarget;
      objc_msgSend(v6, "symlinkTarget");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = symlinkTarget;
      v11 = v9;
      v12 = v11;
      if (v10 == v11)
      {
        v13 = 0;
      }
      else if (v11)
      {
        v13 = -[NSString isEqual:](v10, "isEqual:", v11) ^ 1;
      }
      else
      {
        v13 = 1;
      }

      if (v13)
        v5 |= 0x2000uLL;
    }

  }
  else
  {
    v5 |= 0x2000uLL;
  }

  return v5;
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
  BOOL v15;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSNumber *minimumSupportedOSRowID;
  _BOOL4 v22;
  void *v23;
  const __CFString *v24;
  int64_t v25;
  int64_t v26;
  int v27;
  int64_t v28;
  int v29;
  int v30;
  _BOOL8 isUserVisible;
  unint64_t notifsRank;
  uint64_t syncUpState;
  unint64_t localDiffs;
  BRCZoneRowID *parentZoneRowID;
  BRFieldCKInfo *sideCarCKInfo;
  unint64_t sharingOptions;
  BRCUserRowID *ownerKey;
  BRCItemID *itemID;
  int v40;
  void *v41;
  void *v43;
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
  -[BRCClientZone dbRowID](self->super._clientZone, "dbRowID");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
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
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  minimumSupportedOSRowID = self->super._minimumSupportedOSRowID;
  isUserVisible = self->super._isUserVisible;
  -[BRCStatInfo ckInfo](self->super._st, "ckInfo");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = -[BRCStatInfo state](self->super._st, "state");
  v29 = -[BRCStatInfo type](self->super._st, "type");
  v27 = -[BRCStatInfo mode](self->super._st, "mode");
  v28 = -[BRCStatInfo birthtime](self->super._st, "birthtime");
  v26 = -[BRCStatInfo lastUsedTime](self->super._st, "lastUsedTime");
  v25 = -[BRCStatInfo favoriteRank](self->super._st, "favoriteRank");
  -[BRCStatInfo parentID](self->super._st, "parentID");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  st = self->super._st;
  logicalName = (const __CFString *)st->super._logicalName;
  if (!logicalName)
    logicalName = &stru_1E8769030;
  v24 = logicalName;
  v22 = -[BRCStatInfo isHiddenExt](st, "isHiddenExt");
  -[BRCStatInfo finderTags](self->super._st, "finderTags");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCStatInfo xattrSignature](self->super._st, "xattrSignature");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCStatInfo trashPutBackPath](self->super._st, "trashPutBackPath");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCStatInfo trashPutBackParentID](self->super._st, "trashPutBackParentID");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCStatInfo aliasTarget](self->super._st, "aliasTarget");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCStatInfo creatorRowID](self->super._st, "creatorRowID");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCLocalStatInfo documentID](self->super._st, "documentID");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
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
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[BRCLocalStatInfo itemScope](self->super._st, "itemScope");
  -[BRCLocalStatInfo tmpBouncedNo](self->super._st, "tmpBouncedNo");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCSymlinkItem symlinkTarget](self, "symlinkTarget");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = objc_msgSend(v51, "execute:", CFSTR("INSERT INTO client_items(rowid, zone_rowid, item_id, item_creator_id, item_sharing_options, item_side_car_ckinfo, item_parent_zone_rowid, item_localsyncupstate, item_local_diffs, item_notifs_rank, app_library_rowid, item_min_supported_os_rowid, item_user_visible, item_stat_ckinfo, item_state, item_type, item_mode, item_birthtime, item_lastusedtime, item_favoriterank,item_parent_id, item_filename, item_hidden_ext, item_finder_tags, item_xattr_signature, item_trash_put_back_path, item_trash_put_back_parent_id, item_alias_target, item_creator, item_doc_id, item_file_id, item_generation, item_localname, item_processing_stamp, item_staged_file_id, item_staged_generation, item_bouncedname, item_scope, item_tmpbounceno, version_name) VALUES(%lld, %@, %@, %@, %ld, %@, %@, %d, %lld, %lld, %@, %@, %d, %@, %d, %d, %d, %lld, %lld, %lld, %@, %@, %d, %@, %@, %@, %@, %@, %@, %@, %@, %@, %@, %@, %@, %u, %@, %d, %@, %@)"), a4, v50, itemID, ownerKey, sharingOptions, sideCarCKInfo, parentZoneRowID, syncUpState, localDiffs, notifsRank, v49, minimumSupportedOSRowID, isUserVisible, v47, v30, v29,
          v27,
          v28,
          v26,
          v25,
          v48,
          v24,
          v22,
          v45,
          v46,
          v43,
          v44,
          v23,
          v20,
          v19,
          v7,
          v8,
          v9,
          v10,
          v11,
          v12,
          v13,
          v14,
          v18,
          v17);

  if (v40)
  {
    v52.receiver = self;
    v52.super_class = (Class)BRCSymlinkItem;
    v15 = -[BRCLocalItem _insertInDB:dbRowID:](&v52, sel__insertInDB_dbRowID_, v51, a4);
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (BOOL)_updateInDB:(id)a3 diffs:(unint64_t)a4
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
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  unint64_t localDiffs;
  _BOOL4 v23;
  void *v24;
  const __CFString *v25;
  void *v26;
  int64_t v27;
  int64_t v28;
  int64_t v29;
  int v30;
  int v31;
  int v32;
  _BOOL8 isUserVisible;
  NSNumber *minimumSupportedOSRowID;
  unint64_t notifsRank;
  uint64_t syncUpState;
  BRCZoneRowID *parentZoneRowID;
  BRFieldCKInfo *sideCarCKInfo;
  unint64_t sharingOptions;
  BRCUserRowID *ownerKey;
  BRCItemID *itemID;
  int v42;
  void *v43;
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
  -[BRCClientZone dbRowID](self->super._clientZone, "dbRowID");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  itemID = self->super._itemID;
  ownerKey = self->super._ownerKey;
  sharingOptions = self->super._sharingOptions;
  sideCarCKInfo = self->super._sideCarCKInfo;
  parentZoneRowID = self->super._parentZoneRowID;
  localDiffs = self->super._localDiffs;
  notifsRank = self->super._notifsRank;
  syncUpState = self->super._syncUpState;
  -[BRCLocalItem appLibrary](self, "appLibrary");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "dbRowID");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  minimumSupportedOSRowID = self->super._minimumSupportedOSRowID;
  isUserVisible = self->super._isUserVisible;
  -[BRCStatInfo ckInfo](self->super._st, "ckInfo");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = -[BRCStatInfo state](self->super._st, "state");
  v32 = -[BRCStatInfo type](self->super._st, "type");
  v30 = -[BRCStatInfo mode](self->super._st, "mode");
  v29 = -[BRCStatInfo birthtime](self->super._st, "birthtime");
  v28 = -[BRCStatInfo lastUsedTime](self->super._st, "lastUsedTime");
  v27 = -[BRCStatInfo favoriteRank](self->super._st, "favoriteRank");
  -[BRCStatInfo parentID](self->super._st, "parentID");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  st = self->super._st;
  logicalName = (const __CFString *)st->super._logicalName;
  if (!logicalName)
    logicalName = &stru_1E8769030;
  v25 = logicalName;
  v23 = -[BRCStatInfo isHiddenExt](st, "isHiddenExt");
  -[BRCStatInfo finderTags](self->super._st, "finderTags");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCStatInfo xattrSignature](self->super._st, "xattrSignature");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCStatInfo trashPutBackPath](self->super._st, "trashPutBackPath");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCStatInfo trashPutBackParentID](self->super._st, "trashPutBackParentID");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCStatInfo aliasTarget](self->super._st, "aliasTarget");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCStatInfo creatorRowID](self->super._st, "creatorRowID");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCLocalStatInfo documentID](self->super._st, "documentID");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
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
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[BRCLocalStatInfo itemScope](self->super._st, "itemScope");
  -[BRCLocalStatInfo tmpBouncedNo](self->super._st, "tmpBouncedNo");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCSymlinkItem symlinkTarget](self, "symlinkTarget");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = objc_msgSend(v51, "execute:", CFSTR("UPDATE client_items SET  zone_rowid = %@, item_id = %@, item_creator_id = %@, item_sharing_options = %ld, item_side_car_ckinfo = %@, item_parent_zone_rowid = %@, item_localsyncupstate = %d, item_local_diffs = %llu, item_notifs_rank = %lld, app_library_rowid = %@, item_min_supported_os_rowid = %@, item_user_visible = %d, item_stat_ckinfo = %@, item_state = %d, item_type = %d, item_mode = %d, item_birthtime = %lld, item_lastusedtime = %lld, item_favoriterank = %lld, item_parent_id = %@, item_filename = %@, item_hidden_ext = %d, item_finder_tags = %@, item_xattr_signature = %@, item_trash_put_back_path = %@, item_trash_put_back_parent_id = %@, item_alias_target = %@, item_creator = %@, item_doc_id = %@, item_file_id = %@, item_generation = %@, item_localname = %@, item_processing_stamp = %@, item_staged_file_id = %@, item_staged_generation = %u, item_bouncedname = %@, item_scope = %d, item_tmpbounceno = %@, version_name = %@  WHERE rowid = %llu"), v50, itemID, ownerKey, sharingOptions, sideCarCKInfo, parentZoneRowID, syncUpState, localDiffs, notifsRank, v47, minimumSupportedOSRowID, isUserVisible, v49, v31, v32, v30,
          v29,
          v28,
          v27,
          v48,
          v25,
          v23,
          v46,
          v45,
          v44,
          v26,
          v24,
          v21,
          v20,
          v7,
          v8,
          v9,
          v10,
          v11,
          v12,
          v19,
          v13,
          v18,
          v17,
          self->super._dbRowID);

  if (v42)
  {
    v52.receiver = self;
    v52.super_class = (Class)BRCSymlinkItem;
    v14 = -[BRCLocalItem _updateInDB:diffs:](&v52, sel__updateInDB_diffs_, v51, a4);
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (void)updateSymlinkTarget:(id)a3
{
  objc_storeStrong((id *)&self->_symlinkTarget, a3);
}

- (NSString)symlinkTarget
{
  return self->_symlinkTarget;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_symlinkTarget, 0);
}

- (void)diffAgainstServerItem:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, a2, a3, "[CRIT] Assertion failed: !info || info.isSymLink%@", a5, a6, a7, a8, 2u);
}

@end
