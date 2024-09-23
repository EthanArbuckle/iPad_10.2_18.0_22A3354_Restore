@implementation BRCDocumentItem

- (NSData)liveThumbnailSignature
{
  return self->_liveThumbnailSignature;
}

- (void)setLiveThumbnailSignature:(id)a3
{
  objc_storeStrong((id *)&self->_liveThumbnailSignature, a3);
}

- (BOOL)shouldAutomaticallyDownloadThumbnail
{
  return self->_shouldAutomaticallyDownloadThumbnail;
}

- (NSSet)liveConflictLoserEtags
{
  return (NSSet *)self->_liveConflictLoserEtags;
}

- (void)setLiveConflictLoserEtags:(id)a3
{
  NSMutableSet *v4;
  NSMutableSet *liveConflictLoserEtags;

  v4 = (NSMutableSet *)objc_msgSend(a3, "mutableCopy");
  liveConflictLoserEtags = self->_liveConflictLoserEtags;
  self->_liveConflictLoserEtags = v4;

}

- (BOOL)isFault
{
  unsigned int v2;

  v2 = -[BRCStatInfo type](self->super._st, "type");
  return (v2 < 9) & (0x184u >> v2);
}

- (BOOL)isDownloadRequested
{
  if (self->_desiredVersion)
    return -[BRCDesiredVersion wantsContent](self->_desiredVersion, "wantsContent");
  else
    return !-[BRCDocumentItem isFault](self, "isFault");
}

- (BOOL)isDownloadRequestedForThumbnail
{
  if (self->_desiredVersion)
    return -[BRCDesiredVersion wantsContentForThumbnail](self->_desiredVersion, "wantsContentForThumbnail");
  else
    return !-[BRCDocumentItem isFault](self, "isFault");
}

- (BRCDesiredVersion)desiredVersion
{
  return self->_desiredVersion;
}

- (NSNumber)syncPausedExpireTS
{
  return self->_syncPausedExpireTS;
}

- (id)_initFromPQLResultSet:(id)a3 session:(id)a4 db:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v32;
  NSObject *v33;
  uint64_t v34;
  objc_super v35;

  v10 = a3;
  v35.receiver = self;
  v35.super_class = (Class)BRCDocumentItem;
  v11 = -[BRCLocalItem _initFromPQLResultSet:session:db:error:](&v35, sel__initFromPQLResultSet_session_db_error_, v10, a4, a5, a6);
  if (v11)
  {
    v12 = -[BRCLocalVersion initFromResultSet:pos:]([BRCLocalVersion alloc], "initFromResultSet:pos:", v10, 39);
    v13 = (void *)*((_QWORD *)v11 + 25);
    *((_QWORD *)v11 + 25) = v12;

    if (objc_msgSend(*((id *)v11 + 9), "isExecutable")
      && (objc_msgSend(v11, "isDead") & 1) == 0
      && objc_msgSend(*((id *)v11 + 25), "isPackage"))
    {
      *(_BYTE *)(*((_QWORD *)v11 + 9) + 26) &= ~2u;
    }
    objc_msgSend(v10, "unarchivedObjectOfClass:atIndex:", objc_opt_class(), 55);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = (void *)*((_QWORD *)v11 + 31);
    *((_QWORD *)v11 + 31) = v14;

    if (_allowedClassesForEtags_once != -1)
      dispatch_once(&_allowedClassesForEtags_once, &__block_literal_global_159);
    v16 = (id)_allowedClassesForEtags_allowedClasses;
    objc_msgSend(v10, "unarchivedObjectOfClasses:atIndex:", v16, 56);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v17
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("l"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "mutableCopy");
      v20 = (void *)*((_QWORD *)v11 + 28);
      *((_QWORD *)v11 + 28) = v19;

      objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("r"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "mutableCopy");
      v23 = (void *)*((_QWORD *)v11 + 26);
      *((_QWORD *)v11 + 26) = v22;
    }
    else
    {
      brc_bread_crumbs();
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_FAULT))
        -[BRCDocumentItem(LegacyAdditions) _initFromPQLResultSet:session:db:error:].cold.1();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v24 = 0;
          goto LABEL_13;
        }
      }
      v34 = objc_msgSend(v17, "mutableCopy");
      v23 = (void *)*((_QWORD *)v11 + 28);
      *((_QWORD *)v11 + 28) = v34;
      v21 = v17;
      v17 = 0;
    }
    v24 = v17;

    v17 = v21;
LABEL_13:

    objc_msgSend(v10, "dataAtIndex:", 57);
    v25 = objc_claimAutoreleasedReturnValue();
    v26 = (void *)*((_QWORD *)v11 + 32);
    *((_QWORD *)v11 + 32) = v25;

    *((_BYTE *)v11 + 216) = objc_msgSend(v10, "BOOLAtIndex:", 58);
    objc_msgSend(v10, "stringAtIndex:", 59);
    v27 = objc_claimAutoreleasedReturnValue();
    v28 = (void *)*((_QWORD *)v11 + 29);
    *((_QWORD *)v11 + 29) = v27;

    objc_msgSend(v10, "numberAtIndex:", 60);
    v29 = objc_claimAutoreleasedReturnValue();
    v30 = (void *)*((_QWORD *)v11 + 30);
    *((_QWORD *)v11 + 30) = v29;

  }
  return v11;
}

- (void)_updateLiveConflictLoserFromFSAtPath:(id)a3
{
  BRCDocumentItem *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  BRCDocumentItem *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  NSObject *v15;
  NSMutableSet *v16;
  NSMutableSet *liveConflictLoserEtags;
  NSObject *v18;
  id v19;
  void *v20;
  id v21;
  NSObject *v22;
  void *v23;
  id v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  id v30;
  uint64_t v31[3];
  uint8_t buf[4];
  uint64_t v33;
  __int16 v34;
  id v35;
  __int16 v36;
  BRCDocumentItem *v37;
  __int16 v38;
  void *v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v21 = a3;
  -[BRCLocalItem itemID](self, "itemID");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  memset(v31, 0, sizeof(v31));
  __brc_create_section(0, (uint64_t)"-[BRCDocumentItem(LegacyAdditions) _updateLiveConflictLoserFromFSAtPath:]", 199, v31);
  brc_bread_crumbs();
  v4 = (BRCDocumentItem *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218498;
    v33 = v31[0];
    v34 = 2112;
    v35 = v21;
    v36 = 2112;
    v37 = v4;
    _os_log_debug_impl(&dword_1CBD43000, v5, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx reading live conflict losers from %@%@", buf, 0x20u);
  }

  objc_msgSend(MEMORY[0x1E0D25D48], "manager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "physicalURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = 0;
  objc_msgSend(v6, "permanentStorageForItemAtURL:allocateIfNone:error:", v7, 0, &v30);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v30;

  if (v20)
  {
    objc_msgSend(v20, "enumeratorForAdditionsInNameSpace:withOptions:withoutOptions:ordering:", *MEMORY[0x1E0D25D30], 0, 0, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v22 = objc_claimAutoreleasedReturnValue();
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v9 = v8;
    v10 = -[BRCDocumentItem countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v26, v40, 16);
    if (!v10)
      goto LABEL_19;
    v11 = *(_QWORD *)v27;
    while (1)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v27 != v11)
          objc_enumerationMutation(v9);
        v13 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        v24 = 0;
        v25 = 0;
        if ((objc_msgSend(v13, "brc_parseMangledID:itemID:etag:session:", 0, &v25, &v24, self->super._session) & 1) != 0)
        {
          if ((objc_msgSend(v25, "isEqualToItemID:", v23) & 1) != 0)
          {
            -[NSObject addObject:](v22, "addObject:", v24);
            goto LABEL_17;
          }
          brc_bread_crumbs();
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138413058;
            v33 = (uint64_t)v23;
            v34 = 2112;
            v35 = v13;
            v36 = 2112;
            v37 = self;
            v38 = 2112;
            v39 = v14;
            _os_log_impl(&dword_1CBD43000, v15, OS_LOG_TYPE_DEFAULT, "[WARNING] invalid itemID %@ (for %@ in %@)%@", buf, 0x2Au);
          }
        }
        else
        {
          brc_bread_crumbs();
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, (os_log_type_t)0x90u))
          {
            *(_DWORD *)buf = 138412546;
            v33 = (uint64_t)v13;
            v34 = 2112;
            v35 = v14;
            _os_log_error_impl(&dword_1CBD43000, v15, (os_log_type_t)0x90u, "[ERROR] invalid addition name for %@%@", buf, 0x16u);
          }
        }

LABEL_17:
      }
      v10 = -[BRCDocumentItem countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v26, v40, 16);
      if (!v10)
      {
LABEL_19:

        v16 = (NSMutableSet *)-[NSObject count](v22, "count");
        if (v16)
          v16 = v22;
        liveConflictLoserEtags = self->_liveConflictLoserEtags;
        self->_liveConflictLoserEtags = v16;

        v18 = v22;
        goto LABEL_24;
      }
    }
  }
  brc_bread_crumbs();
  v9 = (BRCDocumentItem *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, (os_log_type_t)0x90u))
  {
    *(_DWORD *)buf = 138412802;
    v33 = (uint64_t)v21;
    v34 = 2112;
    v35 = v19;
    v36 = 2112;
    v37 = v9;
    _os_log_error_impl(&dword_1CBD43000, v18, (os_log_type_t)0x90u, "[ERROR] can't get permanent storage of %@: %@%@", buf, 0x20u);
  }
LABEL_24:

  __brc_leave_section(v31);
}

- (void)learnItemID:(id)a3 serverItem:(id)a4 path:(id)a5 markLost:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  id v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  NSObject *v19;
  BRCItemToPathLookup *v20;
  void *v21;
  objc_super v22;
  uint64_t v23[3];
  uint8_t buf[4];
  uint64_t v25;
  __int16 v26;
  id v27;
  __int16 v28;
  BRCDocumentItem *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v6 = a6;
  v32 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  memset(v23, 0, sizeof(v23));
  __brc_create_section(0, (uint64_t)"-[BRCDocumentItem(LegacyAdditions) learnItemID:serverItem:path:markLost:]", 242, v23);
  brc_bread_crumbs();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218754;
    v25 = v23[0];
    v26 = 2112;
    v27 = v10;
    v28 = 2112;
    v29 = self;
    v30 = 2112;
    v31 = v13;
    _os_log_debug_impl(&dword_1CBD43000, v14, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx learning itemID %@ for %@%@", buf, 0x2Au);
  }

  v22.receiver = self;
  v22.super_class = (Class)BRCDocumentItem;
  -[BRCLocalItem learnItemID:serverItem:path:markLost:](&v22, sel_learnItemID_serverItem_path_markLost_, v10, v11, v12, v6);
  if ((-[BRCLocalItem needsSyncUp](self, "needsSyncUp") || -[BRCLocalItem needsUpload](self, "needsUpload"))
    && -[BRCLocalItem isOnDisk](self, "isOnDisk")
    && !-[BRCDocumentItem isDocumentBeingCopiedToNewZone](self, "isDocumentBeingCopiedToNewZone"))
  {
    -[BRCDocumentItem markNeedsReading](self, "markNeedsReading");
  }
  objc_msgSend(v11, "latestVersion");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "editedSinceShared");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "BOOLValue");

  if (v17)
  {
    -[BRCVersion setEditedSinceShared:](self->_currentVersion, "setEditedSinceShared:", MEMORY[0x1E0C9AAB0]);
    brc_bread_crumbs();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      -[BRCDocumentItem(LegacyAdditions) learnItemID:serverItem:path:markLost:].cold.1();

  }
  if (v12
    || (v20 = -[BRCItemToPathLookup initWithItem:]([BRCItemToPathLookup alloc], "initWithItem:", self),
        -[BRCItemToPathLookup byFileSystemID](v20, "byFileSystemID"),
        v12 = (id)objc_claimAutoreleasedReturnValue(),
        -[BRCItemToPathLookup closePaths](v20, "closePaths"),
        v20,
        v12))
  {
    -[BRCDocumentItem _updateLiveConflictLoserFromFSAtPath:](self, "_updateLiveConflictLoserFromFSAtPath:", v12);
  }
  -[BRCAccountSession applyScheduler](self->super._session, "applyScheduler");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "rescheduleMissingTargetAliasesWithTarget:", self);

  __brc_leave_section(v23);
}

- (BOOL)updateFromFSAtPath:(id)a3 parentGlobalID:(id)a4
{
  id v6;
  id v7;
  BRCLocalVersion *currentVersion;
  BRCLocalVersion *v9;
  BRCLocalVersion *v10;
  BRCLocalVersion *v11;
  void *v12;
  BOOL v13;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  currentVersion = self->_currentVersion;
  if (currentVersion)
  {
    -[BRCLocalVersion _clearSignatures:isPackage:](currentVersion, "_clearSignatures:isPackage:", 3, objc_msgSend(v6, "isPackageRoot"));
  }
  else
  {
    v9 = -[BRCLocalVersion initForPackage:]([BRCLocalVersion alloc], "initForPackage:", objc_msgSend(v6, "isPackageRoot"));
    v10 = self->_currentVersion;
    self->_currentVersion = v9;

  }
  v11 = self->_currentVersion;
  -[BRCDocumentItem _filenameOverrideForPath:](self, "_filenameOverrideForPath:", v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCLocalVersion updateFromFSAtPath:filenameOverride:](v11, "updateFromFSAtPath:filenameOverride:", v6, v12);

  if (-[BRCLocalItem isShared](self, "isShared") && (-[BRCLocalItem sharingOptions](self, "sharingOptions") & 4) != 0)
    -[BRCLocalItem setOrRemoveSpotlightAttributeAt:](self, "setOrRemoveSpotlightAttributeAt:", v6);
  v15.receiver = self;
  v15.super_class = (Class)BRCDocumentItem;
  v13 = -[BRCLocalItem updateFromFSAtPath:parentGlobalID:](&v15, sel_updateFromFSAtPath_parentGlobalID_, v6, v7);

  return v13;
}

- (BOOL)updateLocationAndMetaFromFSAtPath:(id)a3 parentGlobalID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  BRCLocalVersion *currentVersion;
  BRCLocalVersion *v11;
  BRCLocalVersion *v12;
  BRCLocalVersion *v13;
  unint64_t v14;
  void *v15;
  BOOL v16;
  objc_super v18;

  v6 = a3;
  v7 = a4;
  if ((objc_msgSend(v6, "isFault") & 1) == 0)
  {
    if (-[BRCDocumentItem isFault](self, "isFault"))
    {
      brc_bread_crumbs();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        -[BRCDocumentItem(LegacyAdditions) updateLocationAndMetaFromFSAtPath:parentGlobalID:].cold.1();

      currentVersion = self->_currentVersion;
      self->_currentVersion = 0;

      -[BRCDocumentItem markNeedsReading](self, "markNeedsReading");
    }
    v11 = self->_currentVersion;
    if (!v11)
    {
      v12 = -[BRCLocalVersion initForPackage:]([BRCLocalVersion alloc], "initForPackage:", objc_msgSend(v6, "isPackageRoot"));
      v13 = self->_currentVersion;
      self->_currentVersion = v12;

      v11 = self->_currentVersion;
    }
    v14 = (self->super._sharingOptions >> 2) & 1;
    -[BRCDocumentItem _filenameOverrideForPath:](self, "_filenameOverrideForPath:", v6);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCLocalVersion updateLocationAndMetaFromFSAtPath:updateFilename:filenameOverride:](v11, "updateLocationAndMetaFromFSAtPath:updateFilename:filenameOverride:", v6, v14, v15);

  }
  v18.receiver = self;
  v18.super_class = (Class)BRCDocumentItem;
  v16 = -[BRCLocalItem updateLocationAndMetaFromFSAtPath:parentGlobalID:](&v18, sel_updateLocationAndMetaFromFSAtPath_parentGlobalID_, v6, v7);

  return v16;
}

- (BOOL)changedAtRelativePath:(id)a3 scanPackage:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  id v7;
  void *v8;
  _BOOL4 v9;
  void *v10;
  NSObject *v11;
  BOOL v12;
  void *v13;
  NSObject *v14;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  char v19;
  int64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  char v28;
  void *v29;
  void *v30;
  _BOOL4 v31;
  void *v32;
  BRCDocumentItem *v33;
  uint64_t v34;
  int64_t v35;
  uint64_t v36;
  void *v37;
  NSObject *v38;
  objc_super v39;
  uint64_t v40[3];
  uint8_t buf[4];
  uint64_t v42;
  __int16 v43;
  BRCDocumentItem *v44;
  __int16 v45;
  id v46;
  __int16 v47;
  void *v48;
  uint64_t v49;

  v4 = a4;
  v49 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if ((objc_msgSend(v6, "isInPackage") & 1) != 0)
  {
    objc_msgSend(v6, "pathOfPackageRoot");
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = v6;
  }
  v8 = v7;
  v9 = -[BRCLocalItem fromReadOnlyDB](self, "fromReadOnlyDB");
  memset(v40, 0, sizeof(v40));
  __brc_create_section(0, (uint64_t)"-[BRCDocumentItem(LegacyAdditions) changedAtRelativePath:scanPackage:]", 310, v40);
  brc_bread_crumbs();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218754;
    v42 = v40[0];
    v43 = 2112;
    v44 = self;
    v45 = 2112;
    v46 = v6;
    v47 = 2112;
    v48 = v10;
    _os_log_debug_impl(&dword_1CBD43000, v11, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx diffing item %@\nagainst %@%@", buf, 0x2Au);
  }

  if ((objc_msgSend(v8, "isDocument") & 1) == 0)
  {
    brc_bread_crumbs();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      -[BRCDocumentItem(LegacyAdditions) changedAtRelativePath:scanPackage:].cold.3();
    goto LABEL_11;
  }
  v39.receiver = self;
  v39.super_class = (Class)BRCDocumentItem;
  if (!-[BRCLocalItem changedAtRelativePath:scanPackage:](&v39, sel_changedAtRelativePath_scanPackage_, v8, v4))
  {
    if (-[BRCDocumentItem isFault](self, "isFault"))
    {
LABEL_13:
      brc_bread_crumbs();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        -[BRCDocumentItem(LegacyAdditions) changedAtRelativePath:scanPackage:].cold.1();
      v12 = 0;
      goto LABEL_16;
    }
    if ((objc_msgSend(v8, "isUnixDir") & 1) != 0
      || (v16 = objc_msgSend(v8, "size"), v16 == -[BRCVersion size](self->_currentVersion, "size"))
      || v9 && (v34 = objc_msgSend(v8, "size"), v34 == -[BRCVersion size](self->_desiredVersion, "size")))
    {
      -[BRCDocumentItem currentVersion](self, "currentVersion");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "mtime");
      v19 = v18 == objc_msgSend(v8, "modificationTime") || v9;
      if ((v19 & 1) != 0)
      {

      }
      else
      {
        v20 = -[BRCVersion mtime](self->_desiredVersion, "mtime");
        LODWORD(v20) = v20 == objc_msgSend(v8, "modificationTime");

        if ((_DWORD)v20)
        {
          brc_bread_crumbs();
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
          {
            -[BRCDocumentItem currentVersion](self, "currentVersion");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = objc_msgSend(v21, "mtime");
            v23 = objc_msgSend(v8, "modificationTime");
            *(_DWORD *)buf = 134218498;
            v42 = v22;
            v43 = 2048;
            v44 = (BRCDocumentItem *)v23;
            v45 = 2112;
            v46 = v13;
            _os_log_debug_impl(&dword_1CBD43000, v14, OS_LOG_TYPE_DEBUG, "[DEBUG] mtime changed from %llu to %llu%@", buf, 0x20u);

          }
          goto LABEL_11;
        }
      }
      objc_msgSend(v8, "generationID");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[BRCLocalStatInfo generationID](self->super._st, "generationID");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[BRCVersion contentSignature](self->_currentVersion, "contentSignature");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v24, "isEqualToGenerationID:orSignature:", v25, v26);
      v28 = v27;
      if (((v27 | !v9) & 1) == 0)
      {
        objc_msgSend(v8, "generationID");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = objc_msgSend(v29, "isEqualToFSGenerationID:", -[BRCLocalStatInfo stagedGenerationID](self->super._st, "stagedGenerationID"));

      }
      if ((v28 & 1) != 0)
      {
        if (v4 && ((objc_msgSend(v8, "isPackageRoot") ^ 1 | v9) & 1) == 0)
        {
          -[BRCLocalStatInfo documentID](self->super._st, "documentID");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = v30 == 0;

          if (v31)
          {
            brc_bread_crumbs();
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            brc_default_log();
            v38 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v38, OS_LOG_TYPE_FAULT))
              -[BRCDocumentItem(LegacyAdditions) changedAtRelativePath:scanPackage:].cold.2();

          }
          if (+[BRCPackageItem packageChangedAtRelativePath:](BRCPackageItem, "packageChangedAtRelativePath:", v6))
          {
            goto LABEL_8;
          }
        }
        goto LABEL_13;
      }
      brc_bread_crumbs();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        -[BRCLocalStatInfo generationID](self->super._st, "generationID");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "generationID");
        v33 = (BRCDocumentItem *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v42 = (uint64_t)v32;
        v43 = 2112;
        v44 = v33;
        v45 = 2112;
        v46 = v13;
        _os_log_debug_impl(&dword_1CBD43000, v14, OS_LOG_TYPE_DEBUG, "[DEBUG] generationID (%@) doesn't match (%@)%@", buf, 0x20u);

      }
    }
    else
    {
      brc_bread_crumbs();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        v35 = -[BRCVersion size](self->_currentVersion, "size");
        v36 = objc_msgSend(v6, "size");
        *(_DWORD *)buf = 134218754;
        v42 = v35;
        v43 = 2048;
        v44 = (BRCDocumentItem *)v36;
        v45 = 2112;
        v46 = v6;
        v47 = 2112;
        v48 = v13;
        _os_log_debug_impl(&dword_1CBD43000, v14, OS_LOG_TYPE_DEBUG, "[DEBUG] size changed from %llu to %llu at %@%@", buf, 0x2Au);
      }
    }
LABEL_11:
    v12 = 1;
LABEL_16:

    goto LABEL_17;
  }
LABEL_8:
  v12 = 1;
LABEL_17:
  __brc_leave_section(v40);

  return v12;
}

- (id)_filenameOverrideForPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  -[BRCLocalItem st](self, "st");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "rawBouncedLogicalName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "filename");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "isEqualToString:", v7))
  {
    -[BRCLocalItem st](self, "st");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "logicalNameWithoutLocalBounce");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)_initWithRelativePath:(id)a3 parentGlobalID:(id)a4
{
  id v6;
  _QWORD *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  objc_super v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v26.receiver = self;
  v26.super_class = (Class)BRCDocumentItem;
  v7 = -[BRCLocalItem _initWithRelativePath:parentGlobalID:](&v26, sel__initWithRelativePath_parentGlobalID_, v6, a4);
  if (v7)
  {
    v8 = -[BRCLocalVersion initForPackage:]([BRCLocalVersion alloc], "initForPackage:", objc_msgSend(v6, "isPackageRoot"));
    v9 = (void *)v7[25];
    v7[25] = v8;

    v10 = (void *)v7[25];
    objc_msgSend(v7, "_filenameOverrideForPath:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "updateFromFSAtPath:filenameOverride:", v6, v11);

    objc_msgSend(v7, "_updateLiveConflictLoserFromFSAtPath:", v6);
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    +[BRCDocumentItem reverseAliasEnumeratorWithRelativePath:](BRCDocumentItem, "reverseAliasEnumeratorWithRelativePath:", v6, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v23;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v23 != v15)
            objc_enumerationMutation(v12);
          objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * v16++), "updateOnDiskWithAliasTarget:forServerEdit:", v7, 0);
        }
        while (v14 != v16);
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
      }
      while (v14);
    }

    objc_msgSend(v6, "itemSyncPausedByBundleID");
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = (void *)v7[29];
    v7[29] = v17;

    objc_msgSend(v6, "itemSyncPausedExpireTS");
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = (void *)v7[30];
    v7[30] = v19;

  }
  return v7;
}

- (BOOL)updateXattrInfoFromPath:(id)a3 error:(id *)a4
{
  id v6;
  BRCLocalVersion *v7;
  BRCLocalVersion *currentVersion;
  BRCLocalVersion *v9;
  void *v10;
  BOOL v11;
  objc_super v13;

  v6 = a3;
  if (!self->_currentVersion)
  {
    v7 = -[BRCLocalVersion initForPackage:]([BRCLocalVersion alloc], "initForPackage:", objc_msgSend(v6, "isPackageRoot"));
    currentVersion = self->_currentVersion;
    self->_currentVersion = v7;

    v9 = self->_currentVersion;
    -[BRCDocumentItem _filenameOverrideForPath:](self, "_filenameOverrideForPath:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCLocalVersion updateFromFSAtPath:filenameOverride:](v9, "updateFromFSAtPath:filenameOverride:", v6, v10);

  }
  v13.receiver = self;
  v13.super_class = (Class)BRCDocumentItem;
  v11 = -[BRCLocalItem updateXattrInfoFromPath:error:](&v13, sel_updateXattrInfoFromPath_error_, v6, a4);

  return v11;
}

+ (id)reverseAliasEnumeratorWithRelativePath:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = a3;
  +[BRCPathToItemLookup lookupForRelativePath:](BRCPathToItemLookup, "lookupForRelativePath:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "clientZone");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "serverZone");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v6, "mangledID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "unsaltedBookmarkDataWithRelativePath:serverZoneMangledID:", v3, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "session");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  +[BRCDocumentItem reverseAliasEnumeratorWithUnsaltedBookmarkData:session:](BRCDocumentItem, "reverseAliasEnumeratorWithUnsaltedBookmarkData:session:", v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)anyReverseAliasInAppLibrary:(id)a3 toRelativePath:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v5 = a4;
  v6 = a3;
  +[BRCPathToItemLookup lookupForRelativePath:](BRCPathToItemLookup, "lookupForRelativePath:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "clientZone");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "serverZone");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v9, "mangledID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "unsaltedBookmarkDataWithRelativePath:serverZoneMangledID:", v5, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  +[BRCDocumentItem anyReverseAliasWithUnsaltedBookmarkData:inAppLibrary:](BRCDocumentItem, "anyReverseAliasWithUnsaltedBookmarkData:inAppLibrary:", v12, v6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (BOOL)evictInTask:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  id v8;
  BRCDesiredVersion *v9;
  void *v10;
  NSObject *v11;
  NSData *liveThumbnailSignature;
  _BOOL4 v13;
  _BOOL4 v14;
  void *v15;
  NSObject *v16;
  BOOL v17;
  BRCClientZone *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  int v22;
  void *v23;
  NSObject *v24;
  BRCClientZone *clientZone;
  void *v26;
  NSObject *v27;
  void *v28;
  NSObject *v29;
  void *v31;
  uint64_t v32;
  void *v33;
  int v34;
  void *v35;
  NSObject *v36;
  void *v37;
  NSObject *v38;
  const char *v39;
  void *v40;
  void *v41;
  void *v42;
  int v43;
  void *v44;
  NSObject *v45;
  BRCItemToPathLookup *v46;
  void *v47;
  void *v48;
  void *v49;
  BRCClientZone *v50;
  void *v51;
  NSObject *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  const char *v57;
  const char *v58;
  const char *v59;
  void *v60;
  NSObject *v61;
  _QWORD v62[5];
  uint64_t v63[3];
  objc_super v64;
  uint64_t v65;
  void *v66;
  uint8_t buf[4];
  const char *v68;
  __int16 v69;
  BRCDocumentItem *v70;
  __int16 v71;
  BRCClientZone *v72;
  __int16 v73;
  void *v74;
  uint64_t v75;

  v75 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v64.receiver = self;
  v64.super_class = (Class)BRCDocumentItem;
  if (-[BRCLocalItem evictInTask:options:error:](&v64, sel_evictInTask_options_error_, v8, a4, a5))
  {
    v9 = self->_desiredVersion;
    memset(v63, 0, sizeof(v63));
    __brc_create_section(0, (uint64_t)"-[BRCDocumentItem(LegacyAdditions) evictInTask:options:error:]", 420, v63);
    brc_bread_crumbs();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      clientZone = self->super._clientZone;
      *(_DWORD *)buf = 134218754;
      v68 = (const char *)v63[0];
      v69 = 2112;
      v70 = self;
      v71 = 2112;
      v72 = clientZone;
      v73 = 2112;
      v74 = v10;
      _os_log_debug_impl(&dword_1CBD43000, v11, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx evicting client item %@\nin %@%@", buf, 0x2Au);
    }

    if (-[BRCDocumentItem isEvictable](self, "isEvictable"))
    {
      if (((a4 | (4 * (_DWORD)a4)) & 4) != 0 && self->_shouldAutomaticallyDownloadThumbnail)
      {
        self->_shouldAutomaticallyDownloadThumbnail = 0;
        liveThumbnailSignature = self->_liveThumbnailSignature;
        self->_liveThumbnailSignature = 0;

        -[BRCLocalItem saveToDB](self, "saveToDB");
      }
      if ((a4 & 1) == 0)
        goto LABEL_42;
      v13 = -[BRCDocumentItem isFault](self, "isFault");
      if (v9)
        v14 = 0;
      else
        v14 = v13;
      if (v14)
      {
        brc_bread_crumbs();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
          -[BRCDocumentItem(LegacyAdditions) evictInTask:options:error:].cold.1();
LABEL_41:

LABEL_42:
        v17 = 1;
        goto LABEL_43;
      }
      if (v9 && !-[BRCDesiredVersion wantsContent](v9, "wantsContent"))
      {
        brc_bread_crumbs();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
          -[BRCDocumentItem(LegacyAdditions) evictInTask:options:error:].cold.7();
        goto LABEL_41;
      }
      if (-[BRCLocalItem isOnDisk](self, "isOnDisk"))
      {
        -[BRCLocalItem appLibrary](self, "appLibrary");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v21, "hasUbiquityClientsConnected");

        if (v22)
        {
          brc_bread_crumbs();
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v24 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
            -[BRCDocumentItem(LegacyAdditions) evictInTask:options:error:].cold.2();

          goto LABEL_23;
        }
        -[BRCLocalItem fileID](self, "fileID");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = objc_msgSend(v31, "unsignedLongLongValue");

        if (!v32)
        {
          brc_bread_crumbs();
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v61 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v61, OS_LOG_TYPE_FAULT))
            -[BRCDocumentItem(LegacyAdditions) evictInTask:options:error:].cold.5();

        }
        -[BRCAccountSession volume](self->super._session, "volume");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = BRCIsFileIDLocked(objc_msgSend(v33, "deviceID"), v32);

        if (!v34)
        {
          if (-[BRCDocumentItem isFault](self, "isFault"))
            goto LABEL_68;
          -[BRCAccountSession notificationManager](self->super._session, "notificationManager");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          -[BRCLocalItem st](self, "st");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "documentID");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          v43 = objc_msgSend(v40, "hasWatcherForDocumentID:", v42);

          if (!v43)
          {
LABEL_68:
            -[BRCAccountSession downloadTrackers](self->super._session, "downloadTrackers");
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 3072, 0);
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v53, "document:didCompleteDownloadWithError:", self, v54);

            -[BRCLocalItem appLibrary](self, "appLibrary");
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v55, "db");
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            v62[0] = MEMORY[0x1E0C809B0];
            v62[1] = 3221225472;
            v62[2] = __62__BRCDocumentItem_LegacyAdditions__evictInTask_options_error___block_invoke;
            v62[3] = &unk_1E8760A50;
            v62[4] = self;
            objc_msgSend(v56, "groupInBatch:", v62);

            goto LABEL_42;
          }
          brc_bread_crumbs();
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v45 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
            -[BRCDocumentItem(LegacyAdditions) evictInTask:options:error:].cold.4();

          v46 = -[BRCItemToPathLookup initWithItem:]([BRCItemToPathLookup alloc], "initWithItem:", self);
          -[BRCItemToPathLookup coordinatedReadURL](v46, "coordinatedReadURL");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          v48 = (void *)MEMORY[0x1E0CB35C8];
          v65 = *MEMORY[0x1E0CB3308];
          v66 = v47;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v66, &v65, 1);
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 255, v49);
          v50 = (BRCClientZone *)objc_claimAutoreleasedReturnValue();

          if (v50)
          {
            brc_bread_crumbs();
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            brc_default_log();
            v52 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v52, (os_log_type_t)0x90u))
            {
              v59 = "(passed to caller)";
              *(_DWORD *)buf = 136315906;
              v68 = "-[BRCDocumentItem(LegacyAdditions) evictInTask:options:error:]";
              v69 = 2080;
              if (!a5)
                v59 = "(ignored by caller)";
              v70 = (BRCDocumentItem *)v59;
              v71 = 2112;
              v72 = v50;
              v73 = 2112;
              v74 = v51;
              _os_log_error_impl(&dword_1CBD43000, v52, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
            }

          }
          if (a5)
            *a5 = objc_retainAutorelease(v50);

LABEL_23:
          v17 = 0;
LABEL_43:
          __brc_leave_section(v63);

          goto LABEL_44;
        }
        brc_bread_crumbs();
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v36 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
          -[BRCDocumentItem(LegacyAdditions) evictInTask:options:error:].cold.3();

        objc_msgSend(MEMORY[0x1E0CB35C8], "br_errorWithDomain:code:description:", *MEMORY[0x1E0CB28A8], 255, CFSTR("file is flocked"));
        v18 = (BRCClientZone *)objc_claimAutoreleasedReturnValue();
        if (v18)
        {
          brc_bread_crumbs();
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v38 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v38, (os_log_type_t)0x90u))
          {
            v58 = "(passed to caller)";
            *(_DWORD *)buf = 136315906;
            v68 = "-[BRCDocumentItem(LegacyAdditions) evictInTask:options:error:]";
            v69 = 2080;
            if (!a5)
              v58 = "(ignored by caller)";
            v70 = (BRCDocumentItem *)v58;
            v71 = 2112;
            v72 = v18;
            v73 = 2112;
            v74 = v37;
            _os_log_error_impl(&dword_1CBD43000, v38, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
          }

        }
        if (a5)
          *a5 = objc_retainAutorelease(v18);
      }
      else
      {
        brc_bread_crumbs();
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
          -[BRCDocumentItem(LegacyAdditions) evictInTask:options:error:].cold.6();

        objc_msgSend(MEMORY[0x1E0CB35C8], "br_errorWithDomain:code:description:", *MEMORY[0x1E0D10B70], 14, CFSTR("Item %@ is not on disk"), self);
        v18 = (BRCClientZone *)objc_claimAutoreleasedReturnValue();
        if (v18)
        {
          brc_bread_crumbs();
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v29 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v29, (os_log_type_t)0x90u))
          {
            v57 = "(passed to caller)";
            *(_DWORD *)buf = 136315906;
            v68 = "-[BRCDocumentItem(LegacyAdditions) evictInTask:options:error:]";
            v69 = 2080;
            if (!a5)
              v57 = "(ignored by caller)";
            v70 = (BRCDocumentItem *)v57;
            v71 = 2112;
            v72 = v18;
            v73 = 2112;
            v74 = v28;
            _os_log_error_impl(&dword_1CBD43000, v29, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
          }

        }
        if (a5)
          *a5 = objc_retainAutorelease(v18);
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "brc_errorNotInCloud:", 0);
      v18 = (BRCClientZone *)objc_claimAutoreleasedReturnValue();
      if (v18)
      {
        brc_bread_crumbs();
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, (os_log_type_t)0x90u))
        {
          v39 = "(passed to caller)";
          *(_DWORD *)buf = 136315906;
          v68 = "-[BRCDocumentItem(LegacyAdditions) evictInTask:options:error:]";
          v69 = 2080;
          if (!a5)
            v39 = "(ignored by caller)";
          v70 = (BRCDocumentItem *)v39;
          v71 = 2112;
          v72 = v18;
          v73 = 2112;
          v74 = v19;
          _os_log_error_impl(&dword_1CBD43000, v20, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
        }

      }
      if (a5)
        *a5 = objc_retainAutorelease(v18);
    }

    goto LABEL_23;
  }
  v17 = 0;
LABEL_44:

  return v17;
}

void __62__BRCDocumentItem_LegacyAdditions__evictInTask_options_error___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "serverItemByItemID:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  brc_bread_crumbs();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(*(id *)(a1 + 32), "appLibrary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412802;
    v8 = v2;
    v9 = 2112;
    v10 = v6;
    v11 = 2112;
    v12 = v3;
    _os_log_debug_impl(&dword_1CBD43000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] evicting server item %@\nin %@%@", (uint8_t *)&v7, 0x20u);

  }
  LOBYTE(v7) = 0;
  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "updateDesiredVersionWithServerItem:options:needsSave:", v2, 1, &v7);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "applyScheduler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "resetBackoffForServerItem:", v2);

    if ((_BYTE)v7)
      objc_msgSend(*(id *)(a1 + 32), "saveToDB");
  }

}

- (void)markLiveFromStageWithPath:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  uint64_t v10;
  void *v11;
  unint64_t v12;
  void *v13;
  NSObject *v14;
  BRCLocalVersion *v15;
  BRCLocalVersion *v16;
  NSObject *v17;
  BRCLocalVersion *v18;
  BRCLocalVersion *currentVersion;
  _BOOL4 v20;
  void *v21;
  NSObject *v22;
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)BRCDocumentItem;
  -[BRCLocalItem markLiveFromStageWithPath:](&v23, sel_markLiveFromStageWithPath_, a3);
  if (self->_desiredVersion)
  {
    -[BRCClientZone session](self->super._clientZone, "session");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "fsDownloader");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "makeContentLive:", self);

    -[BRCLocalVersion uploadError](self->_currentVersion, "uploadError");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCVersion editedSinceShared](self->_currentVersion, "editedSinceShared");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "BOOLValue");

    if ((v8 & 1) == 0)
    {
      if (-[BRCLocalItem isSharedToMe](self, "isSharedToMe") || -[BRCLocalItem isSharedByMe](self, "isSharedByMe"))
      {
        -[BRCVersion ckInfo](self->_currentVersion, "ckInfo");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "etag");
        v10 = objc_claimAutoreleasedReturnValue();
        if (v10)
        {
          v11 = (void *)v10;
          v12 = -[BRCVersion diffAgainst:](self->_currentVersion, "diffAgainst:", self->_desiredVersion) & 0x1A0000;

          if (v12)
          {
            brc_bread_crumbs();
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            brc_default_log();
            v14 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
              -[BRCDocumentItem(LegacyAdditions) markLiveFromStageWithPath:].cold.3();

            goto LABEL_10;
          }
        }
        else
        {

        }
      }
      v18 = -[BRCLocalVersion initWithVersion:]([BRCLocalVersion alloc], "initWithVersion:", self->_desiredVersion);
      currentVersion = self->_currentVersion;
      self->_currentVersion = v18;

      goto LABEL_16;
    }
LABEL_10:
    v15 = -[BRCLocalVersion initWithVersion:]([BRCLocalVersion alloc], "initWithVersion:", self->_desiredVersion);
    v16 = self->_currentVersion;
    self->_currentVersion = v15;

    -[BRCVersion setEditedSinceShared:](self->_currentVersion, "setEditedSinceShared:", MEMORY[0x1E0C9AAB0]);
LABEL_16:
    if (objc_msgSend(v6, "br_isCloudDocsErrorCode:", 43))
      -[BRCLocalVersion setUploadError:](self->_currentVersion, "setUploadError:", v6);
    v20 = -[BRCDocumentItem isFault](self, "isFault");
    if (v20 != -[BRCDesiredVersion isFault](self->_desiredVersion, "isFault"))
    {
      brc_bread_crumbs();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
        -[BRCDocumentItem(LegacyAdditions) markLiveFromStageWithPath:].cold.2();

    }
    if (-[BRCDocumentItem isFault](self, "isFault"))
      -[BRCDesiredVersion markLiveAsFault](self->_desiredVersion, "markLiveAsFault");
    goto LABEL_21;
  }
  brc_bread_crumbs();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
    -[BRCDocumentItem(LegacyAdditions) markLiveFromStageWithPath:].cold.1();

LABEL_21:
}

- (void)stageFaultForCreation:(BOOL)a3 name:(id)a4 size:(id)a5 isPackage:(BOOL)a6
{
  _BOOL8 v7;
  id v9;
  id v10;
  uint64_t *v11;
  NSObject *Properties;
  void *v13;
  void *v14;
  char v15;
  id v16;
  void *v17;
  NSObject *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;

  v7 = a3;
  v9 = a4;
  v10 = a5;
  v20 = 0;
  v21 = 0;
  if (v9)
  {
    if (v7)
      v11 = &v20;
    else
      v11 = 0;
    Properties = _CFURLPromiseCreateProperties();
    -[BRCAccountSession stageRegistry](self->super._session, "stageRegistry");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCLocalItem appLibrary](self, "appLibrary");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 0;
    v15 = objc_msgSend(v13, "makeSideFaultInStageGatherFileID:generationID:documentID:properties:inAppLibrary:forCreation:error:", &v21, (char *)&v20 + 4, v11, Properties, v14, v7, &v19);
    v16 = v19;

    if ((v15 & 1) != 0)
    {
      if (v7)
        -[BRCLocalItem markStagedWithFileID:generationID:documentID:](self, "markStagedWithFileID:generationID:documentID:", v21, HIDWORD(v20), v20);
      else
        -[BRCLocalItem markStagedWithFileID:generationID:](self, "markStagedWithFileID:generationID:", v21, HIDWORD(v20));
    }
    else
    {
      brc_bread_crumbs();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, (os_log_type_t)0x90u))
        -[BRCDocumentItem(LegacyAdditions) stageFaultForCreation:name:size:isPackage:].cold.2();

    }
  }
  else
  {
    brc_bread_crumbs();
    v16 = (id)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    Properties = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(Properties, (os_log_type_t)0x90u))
      -[BRCDocumentItem(LegacyAdditions) stageFaultForCreation:name:size:isPackage:].cold.1();
  }

}

- (void)stageFaultForCreation:(BOOL)a3 serverItem:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v4 = a3;
  v6 = a4;
  -[BRCLocalItem computedDestinationFilenameFromServerItem:](self, "computedDestinationFilenameFromServerItem:", v6);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v6, "latestVersion");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "numberWithLongLong:", objc_msgSend(v8, "size"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "latestVersion");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[BRCDocumentItem stageFaultForCreation:name:size:isPackage:](self, "stageFaultForCreation:name:size:isPackage:", v4, v11, v9, objc_msgSend(v10, "isPackage"));
}

- (int)updateDesiredVersionWithServerItem:(id)a3 options:(unsigned int)a4 needsSave:(BOOL *)a5
{
  uint64_t v6;
  id v8;

  v6 = *(_QWORD *)&a4;
  v8 = a3;
  LODWORD(a5) = -[BRCDocumentItem updateDesiredVersionWithServerItem:diffs:options:needsSave:](self, "updateDesiredVersionWithServerItem:diffs:options:needsSave:", v8, -[BRCDocumentItem diffAgainstServerItem:](self, "diffAgainstServerItem:", v8), v6, a5);

  return (int)a5;
}

- (int)updateDesiredVersionWithServerItem:(id)a3 diffs:(unint64_t)a4 options:(unsigned int)a5 needsSave:(BOOL *)a6
{
  uint64_t v6;
  _BOOL4 v8;
  int v9;
  void *v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  NSData *liveThumbnailSignature;
  void *v16;
  BRCDesiredVersion *desiredVersion;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  char v21;
  int v22;
  unint64_t v23;
  int v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  BRCDesiredVersion *v29;
  unint64_t sharingOptions;
  char v31;
  void *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  void *v36;
  int v37;
  void *v38;
  NSObject *v39;
  BRCLocalStatInfo *st;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  int v46;
  void *v47;
  NSObject *v48;
  void *v49;
  void *v50;
  BRCItemID *itemID;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  uint64_t v56;
  NSObject *v57;
  BRCDesiredVersion *v58;
  void *v59;
  uint64_t v60;
  void *v61;
  NSObject *v62;
  void *v63;
  unsigned int v64;
  uint64_t v65;
  BRCDesiredVersion *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  BRCDesiredVersion *v72;
  void *v73;
  void *v74;
  BRCDesiredVersion *v75;
  BRCDesiredVersion *v76;
  BRCDesiredVersion *v77;
  char v78;
  char v79;
  void *v80;
  void *v81;
  void *v82;
  BRCDesiredVersion *v83;
  void *v84;
  BRCDesiredVersion *v85;
  void *v86;
  void *v87;
  BRCDesiredVersion *v88;
  BRCDesiredVersion *v89;
  uint64_t v90;
  void *v91;
  NSObject *v92;
  BRCDesiredVersion *v93;
  BRCLocalVersion *currentVersion;
  void *v95;
  void *v96;
  BRCDesiredVersion *v97;
  BRCDesiredVersion *v98;
  void *v99;
  void *v100;
  BRCDesiredVersion *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  NSObject *v106;
  void *v107;
  BRCDesiredVersion *v108;
  BRCDesiredVersion *v109;
  uint64_t v110;
  id v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  int v116;
  void *v117;
  NSObject *v118;
  void *v119;
  NSObject *v120;
  void *v121;
  void *v122;
  void *v123;
  _BOOL4 v124;
  BOOL v125;
  unsigned int v126;
  void *v127;
  NSObject *v128;
  uint64_t v131;
  uint64_t v132;
  id v133;
  uint64_t v134;
  uint64_t v135;
  id v136;
  id v137;
  id v138;
  void *v139;
  const char *v140;
  const char *v141;
  void *v142;
  NSObject *v143;
  void *v144;
  NSObject *v145;
  void *v146;
  NSObject *v147;
  void *v148;
  NSObject *v149;
  int v150;
  unsigned int v151;
  unsigned int v152;
  void *v154;
  void *v156;
  _BOOL4 v157;
  void *v158;
  id v159;
  uint64_t v160[3];
  uint64_t v161;
  uint8_t buf[4];
  uint64_t v163;
  __int16 v164;
  uint64_t v165;
  __int16 v166;
  id v167;
  __int16 v168;
  BRCDocumentItem *v169;
  __int16 v170;
  uint64_t v171;
  __int16 v172;
  void *v173;
  uint64_t v174;

  v6 = *(_QWORD *)&a5;
  v174 = *MEMORY[0x1E0C80C00];
  v159 = a3;
  -[BRCAccountSession fsDownloader](self->super._session, "fsDownloader");
  v154 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v159, "latestVersion");
  v158 = (void *)objc_claimAutoreleasedReturnValue();
  v161 = 0;
  v157 = -[BRCLocalItem isReserved](self, "isReserved");
  v8 = -[BRCDocumentItem isPausedFromSync](self, "isPausedFromSync");
  -[BRCAccountSession applyScheduler](self->super._session, "applyScheduler");
  v156 = (void *)objc_claimAutoreleasedReturnValue();
  if (v157)
    v9 = 1;
  else
    v9 = 2;
  v152 = v9;
  if (!(_DWORD)v6)
  {
    brc_bread_crumbs();
    v142 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v143 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v143, OS_LOG_TYPE_FAULT))
      -[BRCDocumentItem(LegacyAdditions) updateDesiredVersionWithServerItem:diffs:options:needsSave:].cold.14();

  }
  memset(v160, 0, sizeof(v160));
  __brc_create_section(0, (uint64_t)"-[BRCDocumentItem(LegacyAdditions) updateDesiredVersionWithServerItem:diffs:options:needsSave:]", 621, v160);
  brc_bread_crumbs();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    v110 = v160[0];
    BRCPrettyPrintBitmap();
    v111 = (id)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134219010;
    v163 = v110;
    v164 = 2112;
    v165 = (uint64_t)v111;
    v166 = 2112;
    v167 = v159;
    v168 = 2112;
    v169 = self;
    v170 = 2112;
    v171 = (uint64_t)v10;
    _os_log_debug_impl(&dword_1CBD43000, v11, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx requesting to stage %@\n  server: %@\n   local: %@%@", buf, 0x34u);

  }
  if ((v6 & 4) != 0 && objc_msgSend(v158, "isSmallAndMostRecentClientsGenerateThumbnails"))
  {
    brc_bread_crumbs();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      -[BRCDocumentItem(LegacyAdditions) updateDesiredVersionWithServerItem:diffs:options:needsSave:].cold.13();

    v6 = v6 & 0xFFFFFFF9 | 2;
  }
  if (v157 || v8)
  {
    v151 = 0;
  }
  else
  {
    objc_msgSend(v158, "thumbnailSignature");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      liveThumbnailSignature = self->_liveThumbnailSignature;
      objc_msgSend(v158, "thumbnailSignature");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(liveThumbnailSignature) = -[NSData isEqualToData:](liveThumbnailSignature, "isEqualToData:", v16);

      v151 = (liveThumbnailSignature ^ 1) & (v6 >> 2);
    }
    else
    {
      v151 = 0;
    }

  }
  if ((v6 & 3) == 0)
  {
    desiredVersion = self->_desiredVersion;
    if (desiredVersion)
      v6 = -[BRCDesiredVersion options](desiredVersion, "options") & 3 | v6;
    if ((v6 & 3) == 0)
    {
      if (!-[BRCDocumentItem isFault](self, "isFault"))
      {
        v6 = v6 | 2;
        if (!v8)
          goto LABEL_30;
        goto LABEL_25;
      }
      v6 = v6 | 1;
    }
  }
  if (!v8)
    goto LABEL_30;
LABEL_25:
  if ((v6 & 2) == 0 || -[BRCDocumentItem isFault](self, "isFault"))
  {
    brc_bread_crumbs();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
      -[BRCDocumentItem(LegacyAdditions) updateDesiredVersionWithServerItem:diffs:options:needsSave:].cold.12();

  }
LABEL_30:
  if (v158)
  {
    v20 = 67043328;
    if (v8)
      v20 = 0x40000;
    v150 = v20 & a4;
    v21 = (v20 & a4 & 0x180000) != 0 || v157;
    if ((v21 & 1) != 0)
      goto LABEL_37;
    if ((v6 & 1) != 0)
    {
      if (!-[BRCDocumentItem isFault](self, "isFault"))
      {
LABEL_37:
        v22 = 0;
        goto LABEL_38;
      }
      -[BRCLocalStatInfo logicalNameWithoutLocalBounce](self->super._st, "logicalNameWithoutLocalBounce");
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v159, "st");
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v81, "logicalName");
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v80, "isEqualToString:", v82) & 1) != 0)
      {
        v22 = 1;
      }
      else
      {
        -[BRCLocalStatInfo rawBouncedLogicalName](self->super._st, "rawBouncedLogicalName");
        v112 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v159, "st");
        v113 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v113, "logicalName");
        v114 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v112, "isEqualToString:", v114);

      }
    }
    else if ((v6 & 2) != 0)
    {
      v22 = !-[BRCDocumentItem isFault](self, "isFault");
    }
    else
    {
      if ((v6 & 4) == 0)
      {
        brc_bread_crumbs();
        v146 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v147 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v147, OS_LOG_TYPE_FAULT))
          -[BRCDocumentItem(LegacyAdditions) updateDesiredVersionWithServerItem:diffs:options:needsSave:].cold.10();

      }
      v22 = 1;
    }
LABEL_38:
    v23 = -[BRCVersion diffAgainst:](self->_desiredVersion, "diffAgainst:", v158);
    if (v157)
    {
LABEL_39:
      v24 = 0;
      goto LABEL_40;
    }
    v24 = 0;
    v58 = self->_desiredVersion;
    if (v58 && (v23 & 0x180000) == 0)
    {
      if ((v6 & 1) != 0)
      {
        if (!-[BRCDesiredVersion isFault](v58, "isFault"))
          goto LABEL_39;
        -[BRCDesiredVersion serverName](self->_desiredVersion, "serverName");
        v102 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v159, "st");
        v103 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v103, "logicalName");
        v104 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v102, "isEqualToString:", v104);

      }
      else if ((v6 & 2) != 0)
      {
        v24 = !-[BRCDesiredVersion isFault](v58, "isFault");
      }
      else
      {
        if ((v6 & 4) == 0)
        {
          brc_bread_crumbs();
          v148 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v149 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v149, OS_LOG_TYPE_FAULT))
            -[BRCDocumentItem(LegacyAdditions) updateDesiredVersionWithServerItem:diffs:options:needsSave:].cold.10();

        }
        v24 = 1;
      }
    }
LABEL_40:
    if (v22)
    {
      brc_bread_crumbs();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
      {
        BRCItemFieldsPrettyPrint();
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        -[BRCDocumentItem(LegacyAdditions) updateDesiredVersionWithServerItem:diffs:options:needsSave:].cold.6(v27);
      }

      -[BRCLocalStatInfo stagedFileID](self->super._st, "stagedFileID");
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      if (v28)
      {
        -[BRCDocumentItem clearFromStage](self, "clearFromStage");
        *a6 = 1;
      }
      v29 = self->_desiredVersion;
      if (v29 && !-[BRCDesiredVersion isFault](v29, "isFault"))
        objc_msgSend(v154, "cancelAndCleanupItemDownload:kind:", self, 0);
      if ((v150 & 0x33B0000) == 0x10000)
      {
        -[BRCDocumentItem updateContentsCKInfoAndDeviceIDFromServerItem:](self, "updateContentsCKInfoAndDeviceIDFromServerItem:", v159);
        *a6 = 1;
      }
      sharingOptions = self->super._sharingOptions;
      v31 = objc_msgSend(v159, "sharingOptions") ^ sharingOptions;
      if ((v31 & 0x20) != 0)
      {
        brc_bread_crumbs();
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v33 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v163 = (uint64_t)v32;
          _os_log_impl(&dword_1CBD43000, v33, OS_LOG_TYPE_DEFAULT, "[WARNING] Force apply because we need to update the permissions%@", buf, 0xCu);
        }

      }
      -[BRCLocalStatInfo rawBouncedLogicalName](self->super._st, "rawBouncedLogicalName");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v159, "st");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "logicalName");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = objc_msgSend(v34, "isEqualToString:", v36);

      if (v37)
      {
        brc_bread_crumbs();
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v39 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
          -[BRCDocumentItem(LegacyAdditions) updateDesiredVersionWithServerItem:diffs:options:needsSave:].cold.5();

        st = self->super._st;
        objc_msgSend(v159, "st");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "logicalName");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        -[BRCLocalStatInfo physicalName](self->super._st, "physicalName");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v159, "st");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "logicalName");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        -[BRCLocalStatInfo setFilename:forcePhysicalName:forceBouncedLogicalName:serverName:](st, "setFilename:forcePhysicalName:forceBouncedLogicalName:serverName:", v42, v43, 0, v45);

        v46 = a4 & 0xFFFFFFBF;
      }
      else
      {
        v46 = a4;
      }
      v90 = v31 & 0x20;
      LODWORD(a4) = v46;
      if ((((v150 & 0x33A0000 | (unint64_t)(v46 & 0x7FFF) | v90) == 0) & ~v151) == 0)
      {
        brc_bread_crumbs();
        v91 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v92 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v92, OS_LOG_TYPE_DEBUG))
        {
          BRCItemFieldsPrettyPrint();
          v136 = (id)objc_claimAutoreleasedReturnValue();
          BRCItemFieldsPrettyPrint();
          v137 = (id)objc_claimAutoreleasedReturnValue();
          BRCItemFieldsPrettyPrint();
          v138 = (id)objc_claimAutoreleasedReturnValue();
          v139 = v138;
          *(_DWORD *)buf = 138413570;
          v140 = "yes";
          v163 = (uint64_t)v136;
          v164 = 2112;
          if (v90)
            v141 = "yes";
          else
            v141 = "no";
          v165 = (uint64_t)v137;
          if (!v151)
            v140 = "no";
          v166 = 2112;
          v167 = v138;
          v168 = 2080;
          v169 = (BRCDocumentItem *)v141;
          v170 = 2080;
          v171 = (uint64_t)v140;
          v172 = 2112;
          v173 = v91;
          _os_log_debug_impl(&dword_1CBD43000, v92, OS_LOG_TYPE_DEBUG, "[DEBUG] Proceeding with apply changes for metadata only update\ndiff w/ current: %@ / %@\ndiff w/ server-item: %@\nneeds permission for sharing update: %s\nneeds thumbnail: %s\n%@", buf, 0x3Eu);

        }
        v93 = [BRCDesiredVersion alloc];
        if (v8)
        {
          currentVersion = self->_currentVersion;
          objc_msgSend(v159, "st");
          v95 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v95, "logicalName");
          v96 = (void *)objc_claimAutoreleasedReturnValue();
          v97 = -[BRCDesiredVersion initWithServerVersion:serverName:](v93, "initWithServerVersion:serverName:", currentVersion, v96);
          v98 = self->_desiredVersion;
          self->_desiredVersion = v97;

          objc_msgSend(v158, "originalPOSIXName");
          v99 = (void *)objc_claimAutoreleasedReturnValue();
          v100 = (void *)objc_msgSend(v99, "copy");
          -[BRCVersion setOriginalPOSIXName:](self->_desiredVersion, "setOriginalPOSIXName:", v100);
        }
        else
        {
          objc_msgSend(v159, "st");
          v99 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v99, "logicalName");
          v100 = (void *)objc_claimAutoreleasedReturnValue();
          v108 = -[BRCDesiredVersion initWithServerVersion:serverName:](v93, "initWithServerVersion:serverName:", v158, v100);
          v109 = self->_desiredVersion;
          self->_desiredVersion = v108;

        }
        -[BRCDesiredVersion setOptions:](self->_desiredVersion, "setOptions:", v6);
        -[BRCLocalItem markStagedWithFileID:generationID:](self, "markStagedWithFileID:generationID:", 0, 0);
        v56 = 1;
        *a6 = 1;
        goto LABEL_133;
      }
      v101 = self->_desiredVersion;
      if (v101)
      {
        self->_desiredVersion = 0;

        *a6 = 1;
      }
      if ((v150 & 0x800000) == 0)
      {
        v56 = 0;
        goto LABEL_133;
      }
      objc_msgSend(v158, "conflictLoserEtags");
      v107 = (void *)objc_claimAutoreleasedReturnValue();
      -[BRCVersion setConflictLoserEtags:](self->_currentVersion, "setConflictLoserEtags:", v107);

      v56 = 0;
    }
    else
    {
      if (v24)
      {
        -[BRCLocalStatInfo stagedFileID](self->super._st, "stagedFileID");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        v60 = objc_msgSend(v59, "unsignedLongLongValue");

        brc_bread_crumbs();
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v62 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v62, OS_LOG_TYPE_DEBUG))
        {
          BRCItemFieldsPrettyPrint();
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          -[BRCDocumentItem(LegacyAdditions) updateDesiredVersionWithServerItem:diffs:options:needsSave:].cold.8(v63);
        }

        v64 = -[BRCDesiredVersion options](self->_desiredVersion, "options");
        v65 = ((v64 ^ v6) << 20) & 0x400000 | ((((v64 ^ v6) >> 1) & 1) << 23);
        v66 = self->_desiredVersion;
        if (v23 | v65)
        {
          -[BRCVersion ckInfo](v66, "ckInfo");
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v67, "etag");
          v68 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v159, "latestVersion");
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v69, "ckInfo");
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v70, "etag");
          v71 = (void *)objc_claimAutoreleasedReturnValue();

          v72 = [BRCDesiredVersion alloc];
          objc_msgSend(v159, "st");
          v73 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v73, "logicalName");
          v74 = (void *)objc_claimAutoreleasedReturnValue();
          v75 = -[BRCDesiredVersion initWithServerVersion:serverName:](v72, "initWithServerVersion:serverName:", v158, v74);
          v76 = self->_desiredVersion;
          self->_desiredVersion = v75;

          -[BRCDesiredVersion setOptions:](self->_desiredVersion, "setOptions:", v6);
          v77 = self->_desiredVersion;
          if (v77)
          {
            v78 = -[BRCDesiredVersion isFault](v77, "isFault");
            v79 = (v23 & 0x10000) != 0 ? v78 : 1;
            if ((v79 & 1) == 0)
            {
              if (v60)
                objc_msgSend(v154, "updateContentDownloadForMetaOnlyChange:fromEtag:toEtag:", self, v68, v71);
              else
                objc_msgSend(v154, "cancelAndCleanupItemDownload:kind:", self, 0);
            }
          }
          *a6 = 1;

        }
        else if (-[BRCDesiredVersion options](v66, "options") != (_DWORD)v6)
        {
          -[BRCDesiredVersion setOptions:](self->_desiredVersion, "setOptions:", v6);
          *a6 = 1;
        }
        if (v60)
        {
          -[BRCAccountSession stageRegistry](self->super._session, "stageRegistry");
          v115 = (void *)objc_claimAutoreleasedReturnValue();
          v116 = objc_msgSend(v115, "didFlushStagedFileID:", v60);

          if (v116)
          {
            brc_bread_crumbs();
            v117 = (void *)objc_claimAutoreleasedReturnValue();
            brc_default_log();
            v118 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v118, OS_LOG_TYPE_DEBUG))
              -[BRCDocumentItem(LegacyAdditions) updateDesiredVersionWithServerItem:diffs:options:needsSave:].cold.7();

            v56 = 1;
LABEL_133:
            if ((a4 & 0xF0000000) != 0)
            {
              brc_bread_crumbs();
              v119 = (void *)objc_claimAutoreleasedReturnValue();
              brc_default_log();
              v120 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v120, OS_LOG_TYPE_DEBUG))
              {
                BRCItemFieldsPrettyPrint();
                v121 = (void *)objc_claimAutoreleasedReturnValue();
                -[BRCDocumentItem(LegacyAdditions) updateDesiredVersionWithServerItem:diffs:options:needsSave:].cold.4(v121);
              }

              -[BRCLocalItem updateItemMetadataFromServerItem:appliedSharingPermission:](self, "updateItemMetadataFromServerItem:appliedSharingPermission:", v159, 0);
              *a6 = 1;
            }
            if (-[BRCDesiredVersion wantsContent](self->_desiredVersion, "wantsContent"))
            {
              if (!-[BRCDesiredVersion isFault](self->_desiredVersion, "isFault"))
              {
                -[BRCLocalItem st](self, "st");
                v122 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v122, "stagedFileID");
                v123 = (void *)objc_claimAutoreleasedReturnValue();
                v124 = v123 == 0;

                if (v124)
                {
                  if ((_DWORD)v56)
                    v56 = v56;
                  else
                    v56 = 23;
                  objc_msgSend(v154, "scheduleContentDownloadForItem:serverItem:options:etagIfLoser:stageFileName:error:", self, v159, v6, 0, 0, 0);
                }
              }
            }
            if (v157)
            {
              if ((v6 & 2) == 0)
              {
LABEL_146:
                if ((_DWORD)v56 == 23)
                {
                  brc_bread_crumbs();
                  v144 = (void *)objc_claimAutoreleasedReturnValue();
                  brc_default_log();
                  v145 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v145, OS_LOG_TYPE_FAULT))
                    -[BRCDocumentItem(LegacyAdditions) updateDesiredVersionWithServerItem:diffs:options:needsSave:].cold.3();

                  v56 = 23;
                  goto LABEL_166;
                }
              }
            }
            else
            {
              if (v151)
                objc_msgSend(v154, "scheduleThumbnailDownloadForItem:serverItem:applySchedulerState:", self, v159, (char *)&v161 + 4);
              else
                objc_msgSend(v154, "cancelAndCleanupItemDownload:kind:", self, 1);
              if ((v6 & 2) != 0)
              {
                objc_msgSend(v154, "scheduleLosersDownloadForItem:serverItem:purgeStaleEntries:applySchedulerState:", self, v159, 0, &v161);
              }
              else if ((v6 & 1) != 0 && objc_msgSend(v154, "shouldScheduleLosersEvictionForItem:", self))
              {
                LODWORD(v161) = 1;
              }
              if ((_DWORD)v56 == 1
                || (HIDWORD(v161) != 1 ? (v125 = (_DWORD)v56 == 0) : (v125 = 1),
                    !v125 ? (v126 = v56) : (v126 = HIDWORD(v161)),
                    v126 == 1))
              {
                v56 = 1;
                goto LABEL_166;
              }
              if ((_DWORD)v161 == 1 || v126 == 0)
                v56 = v161;
              else
                v56 = v126;
              if ((v6 & 2) == 0)
                goto LABEL_146;
            }
            if (!(_DWORD)v56)
            {
              objc_msgSend(v156, "setState:andApplyKind:forServerItem:localItem:", 0, v152, v159, self);
LABEL_167:
              brc_bread_crumbs();
              v127 = (void *)objc_claimAutoreleasedReturnValue();
              brc_default_log();
              v128 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v128, OS_LOG_TYPE_DEBUG))
              {
                v131 = objc_msgSend(v159, "rank");
                v132 = BRCPrettyPrintEnum();
                BRCPrettyPrintBitmap();
                v133 = (id)objc_claimAutoreleasedReturnValue();
                v134 = BRCPrettyPrintEnum();
                v135 = BRCPrettyPrintEnum();
                *(_DWORD *)buf = 134219266;
                v163 = v131;
                v164 = 2080;
                v165 = v132;
                v166 = 2112;
                v167 = v133;
                v168 = 2080;
                v169 = (BRCDocumentItem *)v134;
                v170 = 2080;
                v171 = v135;
                v172 = 2112;
                v173 = v127;
                _os_log_debug_impl(&dword_1CBD43000, v128, OS_LOG_TYPE_DEBUG, "[DEBUG] Apply Changes[%lld]: state:%s options:%@ (thumbnail:%s losers:%s)%@", buf, 0x3Eu);

              }
              goto LABEL_170;
            }
LABEL_166:
            objc_msgSend(v156, "createApplyJobFromServerItem:localItem:state:kind:", v159, 0, v56, v152);
            goto LABEL_167;
          }
        }
        else
        {
          if ((v6 & 1) == 0)
          {
            v56 = 23;
            goto LABEL_133;
          }
          -[BRCDocumentItem stageFaultForCreation:serverItem:](self, "stageFaultForCreation:serverItem:", v157, v159);
          *a6 = 1;
        }
        v56 = 20;
        goto LABEL_133;
      }
      v83 = self->_desiredVersion;
      if (v83 && !-[BRCDesiredVersion isFault](v83, "isFault"))
        objc_msgSend(v154, "cancelAndCleanupItemDownload:kind:", self, 0);
      -[BRCLocalStatInfo stagedFileID](self->super._st, "stagedFileID");
      v84 = (void *)objc_claimAutoreleasedReturnValue();

      if (v84)
        -[BRCDocumentItem clearFromStage](self, "clearFromStage");
      v85 = [BRCDesiredVersion alloc];
      objc_msgSend(v159, "st");
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v86, "logicalName");
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      v88 = -[BRCDesiredVersion initWithServerVersion:serverName:](v85, "initWithServerVersion:serverName:", v158, v87);
      v89 = self->_desiredVersion;
      self->_desiredVersion = v88;

      -[BRCDesiredVersion setOptions:](self->_desiredVersion, "setOptions:", v6);
      if ((v6 & 1) != 0)
      {
        -[BRCDocumentItem stageFaultForCreation:serverItem:](self, "stageFaultForCreation:serverItem:", v157, v159);
        v56 = 20;
      }
      else
      {
        v56 = 23;
      }
      if (v157)
      {
        brc_bread_crumbs();
        v105 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v106 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v106, OS_LOG_TYPE_DEBUG))
          -[BRCDocumentItem(LegacyAdditions) updateDesiredVersionWithServerItem:diffs:options:needsSave:].cold.9();

        v56 = 1;
      }
    }
    *a6 = 1;
    goto LABEL_133;
  }
  brc_bread_crumbs();
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v48 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v48, (os_log_type_t)0x90u))
    -[BRCDocumentItem(LegacyAdditions) updateDesiredVersionWithServerItem:diffs:options:needsSave:].cold.2();

  +[BRCEventsAnalytics sharedAnalytics](BRCEventsAnalytics, "sharedAnalytics");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "registerAndSendNewApplyFailureWithOutcome:", CFSTR("missing-version"));

  -[BRCClientZone asPrivateClientZone](self->super._clientZone, "asPrivateClientZone");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  itemID = self->super._itemID;
  objc_msgSend(v159, "serverZone");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "zoneID");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCItemID contentsRecordIDInZoneID:](itemID, "contentsRecordIDInZoneID:", v53);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "recordName");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "reportProblemWithType:recordName:", 4, v55);

  brc_bread_crumbs();
  v56 = objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v57 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v57, OS_LOG_TYPE_FAULT))
    -[BRCDocumentItem(LegacyAdditions) updateDesiredVersionWithServerItem:diffs:options:needsSave:].cold.1();

  LODWORD(v56) = 28;
  objc_msgSend(v156, "setState:andApplyKind:forServerItem:localItem:", 28, v152, v159, self);
LABEL_170:
  __brc_leave_section(v160);

  return v56;
}

- (void)clearDesiredVersion
{
  void *v3;
  NSObject *v4;
  void *v5;
  BRCDesiredVersion *desiredVersion;

  brc_bread_crumbs();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    -[BRCDocumentItem(LegacyAdditions) clearDesiredVersion].cold.1();

  if (!-[BRCDesiredVersion isFault](self->_desiredVersion, "isFault"))
  {
    -[BRCAccountSession fsDownloader](self->super._session, "fsDownloader");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "cancelAndCleanupItemDownload:kind:", self, 0);

  }
  desiredVersion = self->_desiredVersion;
  self->_desiredVersion = 0;

}

- (id)setOfAppLibraryIDsWithReverseAliases
{
  BRCPQLConnection *db;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  db = self->super._db;
  -[BRCLocalItem unsaltedBookmarkData](self, "unsaltedBookmarkData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[BRCPQLConnection fetch:](db, "fetch:", CFSTR("SELECT app_library_rowid FROM client_items WHERE item_alias_target = %@ AND item_type = 3"), v4);

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v16 = v5;
  objc_msgSend(v5, "enumerateObjectsOfClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(v6);
        v12 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
        if (!v9)
          v9 = objc_alloc_init(MEMORY[0x1E0C99E20]);
        -[BRCAccountSession appLibraryByRowID:](self->super._session, "appLibraryByRowID:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "appLibraryID");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addObject:", v14);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v8);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (id)anyReverseAliasWithUnsaltedBookmarkData:(id)a3 inAppLibrary:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  _QWORD v13[4];
  id v14;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v5, "session");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "clientDB");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __89__BRCDocumentItem_LegacyAdditions__anyReverseAliasWithUnsaltedBookmarkData_inAppLibrary___block_invoke;
  v13[3] = &unk_1E875E2C8;
  v14 = v7;
  v9 = v7;
  objc_msgSend(v5, "dbRowID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)objc_msgSend(v8, "fetchObject:sql:", v13, CFSTR("SELECT rowid, zone_rowid, item_id, item_creator_id, item_sharing_options, item_side_car_ckinfo, item_parent_zone_rowid, item_localsyncupstate, item_local_diffs, item_notifs_rank, app_library_rowid, item_min_supported_os_rowid, item_user_visible, item_stat_ckinfo, item_state, item_type, item_mode, item_birthtime, item_lastusedtime, item_favoriterank,item_parent_id, item_filename, item_hidden_ext, item_finder_tags, item_xattr_signature, item_trash_put_back_path, item_trash_put_back_parent_id, item_alias_target, item_creator, item_doc_id, item_file_id, item_generation, item_localname, item_processing_stamp, item_staged_file_id, item_staged_generation, item_bouncedname, item_scope, item_tmpbounceno, version_name, version_ckinfo, version_mtime, version_size, version_thumb_size, version_thumb_signature, version_content_signature, version_xattr_signature, version_edited_since_shared, version_device, version_conflict_loser_etags, version_quarantine_info, version_uploaded_assets, version_upload_error, version_old_zone_item_id, version_old_zone_rowid, desired_version, item_live_conflict_loser_etags, item_thumb_live_signature, item_thumb_greedy, version_block_sync_until_bundle_id, version_block_sync_until_timestamp FROM client_items WHERE item_alias_target = %@ AND item_type = 3 AND app_library_rowid = %@"), v6, v10);
  return v11;
}

id __89__BRCDocumentItem_LegacyAdditions__anyReverseAliasWithUnsaltedBookmarkData_inAppLibrary___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = *(void **)(a1 + 32);
  v5 = a2;
  objc_msgSend(v4, "clientDB");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "newLocalItemFromPQLResultSet:db:error:", v5, v6, a3);

  objc_msgSend(v7, "asBRAlias");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)reverseAliasEnumeratorWithUnsaltedBookmarkData:(id)a3 session:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v13[4];
  id v14;
  id v15;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v5, "clientDB");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "fetch:", CFSTR("SELECT rowid, zone_rowid, item_id, item_creator_id, item_sharing_options, item_side_car_ckinfo, item_parent_zone_rowid, item_localsyncupstate, item_local_diffs, item_notifs_rank, app_library_rowid, item_min_supported_os_rowid, item_user_visible, item_stat_ckinfo, item_state, item_type, item_mode, item_birthtime, item_lastusedtime, item_favoriterank,item_parent_id, item_filename, item_hidden_ext, item_finder_tags, item_xattr_signature, item_trash_put_back_path, item_trash_put_back_parent_id, item_alias_target, item_creator, item_doc_id, item_file_id, item_generation, item_localname, item_processing_stamp, item_staged_file_id, item_staged_generation, item_bouncedname, item_scope, item_tmpbounceno, version_name, version_ckinfo, version_mtime, version_size, version_thumb_size, version_thumb_signature, version_content_signature, version_xattr_signature, version_edited_since_shared, version_device, version_conflict_loser_etags, version_quarantine_info, version_uploaded_assets, version_upload_error, version_old_zone_item_id, version_old_zone_rowid, desired_version, item_live_conflict_loser_etags, item_thumb_live_signature, item_thumb_greedy, version_block_sync_until_bundle_id, version_block_sync_until_timestamp FROM client_items WHERE item_alias_target = %@ AND item_type = 3 AND item_state != 1"), v6);

  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __91__BRCDocumentItem_LegacyAdditions__reverseAliasEnumeratorWithUnsaltedBookmarkData_session___block_invoke;
  v13[3] = &unk_1E875E310;
  v14 = v5;
  v15 = v7;
  v9 = v7;
  v10 = v5;
  objc_msgSend(v8, "enumerateObjects:", v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

id __91__BRCDocumentItem_LegacyAdditions__reverseAliasEnumeratorWithUnsaltedBookmarkData_session___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (id)objc_msgSend(*(id *)(a1 + 32), "newLocalItemFromPQLResultSet:db:error:", a2, *(_QWORD *)(a1 + 40), a3);
}

- (id)reverseAliasEnumerator
{
  void *v3;
  void *v4;

  -[BRCLocalItem unsaltedBookmarkData](self, "unsaltedBookmarkData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[BRCDocumentItem reverseAliasEnumeratorWithUnsaltedBookmarkData:session:](BRCDocumentItem, "reverseAliasEnumeratorWithUnsaltedBookmarkData:session:", v3, self->super._session);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)anyReverseAliasInAppLibrary:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[BRCLocalItem unsaltedBookmarkData](self, "unsaltedBookmarkData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[BRCDocumentItem anyReverseAliasWithUnsaltedBookmarkData:inAppLibrary:](BRCDocumentItem, "anyReverseAliasWithUnsaltedBookmarkData:inAppLibrary:", v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)clearFromStage
{
  void *v3;
  objc_super v4;

  -[BRCAccountSession fsDownloader](self->super._session, "fsDownloader");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancelAndCleanupItemDownload:kind:", self, 0);

  v4.receiver = self;
  v4.super_class = (Class)BRCDocumentItem;
  -[BRCLocalItem clearFromStage](&v4, sel_clearFromStage);
}

- (BOOL)isPausedFromSync
{
  return self->_syncPausedByBundleID != 0;
}

- (BOOL)isResumingSync
{
  id v2;
  BOOL v3;

  v2 = -[PQLConnection numberWithSQL:](self->super._db, "numberWithSQL:", CFSTR("SELECT version_block_sync_until_resuming FROM client_items WHERE rowid = %llu"), self->super._dbRowID);
  v3 = objc_msgSend(v2, "integerValue") != 0;

  return v3;
}

- (void)resumeSyncComplete
{
  _BOOL4 v3;
  void *v4;
  NSObject *v5;
  const char *v6;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  BRCDocumentItem *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = -[BRCPQLConnection execute:](self->super._db, "execute:", CFSTR("UPDATE client_items SET version_block_sync_until_resuming = NULL WHERE rowid = %llu"), self->super._dbRowID);
  brc_bread_crumbs();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = "with failure";
    *(_DWORD *)buf = 136315650;
    if (v3)
      v6 = "successfully";
    v8 = v6;
    v9 = 2112;
    v10 = self;
    v11 = 2112;
    v12 = v4;
    _os_log_impl(&dword_1CBD43000, v5, OS_LOG_TYPE_INFO, "[INFO] Resume sync completed %s for item %@%@", buf, 0x20u);
  }

}

- (BOOL)pauseFromSyncWithTimeout:(double)a3 forBundleID:(id)a4 error:(id *)a5
{
  id v9;
  BRCItemToPathLookup *v10;
  void *v11;
  NSObject *v12;
  const char *v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  NSNumber *v21;
  NSNumber *syncPausedExpireTS;
  BRCItemToPathLookup *v23;
  void *v24;
  void *v25;
  BOOL v26;
  _QWORD v28[4];
  BRCItemToPathLookup *v29;
  BRCDocumentItem *v30;
  uint8_t buf[4];
  const char *v32;
  __int16 v33;
  const char *v34;
  __int16 v35;
  BRCItemToPathLookup *v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v9 = a4;
  if (-[BRCDocumentItem isFault](self, "isFault"))
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "brc_errorDocumentEvicted");
    v10 = (BRCItemToPathLookup *)objc_claimAutoreleasedReturnValue();
    if (!v10)
      goto LABEL_29;
    brc_bread_crumbs();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v12, (os_log_type_t)0x90u))
      goto LABEL_28;
    v13 = "(passed to caller)";
    *(_DWORD *)buf = 136315906;
    v32 = "-[BRCDocumentItem(LegacyAdditions) pauseFromSyncWithTimeout:forBundleID:error:]";
    v33 = 2080;
    if (!a5)
      v13 = "(ignored by caller)";
    goto LABEL_27;
  }
  if (self->_syncPausedByBundleID && (objc_msgSend(v9, "isEqualToString:") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "brc_errorItemAlreadyPausedFromSyncByBundleID:", self->_syncPausedByBundleID);
    v10 = (BRCItemToPathLookup *)objc_claimAutoreleasedReturnValue();
    if (!v10)
      goto LABEL_29;
    brc_bread_crumbs();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v12, (os_log_type_t)0x90u))
      goto LABEL_28;
    v13 = "(passed to caller)";
    *(_DWORD *)buf = 136315906;
    v32 = "-[BRCDocumentItem(LegacyAdditions) pauseFromSyncWithTimeout:forBundleID:error:]";
    v33 = 2080;
    if (!a5)
      v13 = "(ignored by caller)";
    goto LABEL_27;
  }
  if (a3 <= 0.0
    || (+[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0),
        v14 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v14, "maxPauseFileTimeout"),
        v16 = v15,
        v14,
        v16 < a3))
  {
    v17 = (void *)MEMORY[0x1E0CB35C8];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "brc_errorInvalidParameter:value:", CFSTR("timestamp"), v18);
    v10 = (BRCItemToPathLookup *)objc_claimAutoreleasedReturnValue();

    if (!v10)
      goto LABEL_29;
    brc_bread_crumbs();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v12, (os_log_type_t)0x90u))
      goto LABEL_28;
    v13 = "(passed to caller)";
    *(_DWORD *)buf = 136315906;
    v32 = "-[BRCDocumentItem(LegacyAdditions) pauseFromSyncWithTimeout:forBundleID:error:]";
    v33 = 2080;
    if (!a5)
      v13 = "(ignored by caller)";
    goto LABEL_27;
  }
  v19 = brc_interval_to_nsec();
  v20 = brc_current_date_nsec() + v19;
  if (-[BRCPQLConnection execute:](self->super._db, "execute:", CFSTR("UPDATE client_items SET version_block_sync_until_bundle_id = %@, version_block_sync_until_timestamp = %llu, version_block_sync_until_resuming = NULL WHERE rowid = %llu"), v9, v20, self->super._dbRowID))
  {
    objc_storeStrong((id *)&self->_syncPausedByBundleID, a4);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v20);
    v21 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    syncPausedExpireTS = self->_syncPausedExpireTS;
    self->_syncPausedExpireTS = v21;

    v23 = -[BRCItemToPathLookup initWithItem:]([BRCItemToPathLookup alloc], "initWithItem:", self);
    -[BRCItemToPathLookup byFileSystemID](v23, "byFileSystemID");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __79__BRCDocumentItem_LegacyAdditions__pauseFromSyncWithTimeout_forBundleID_error___block_invoke;
    v28[3] = &unk_1E875DEB8;
    v29 = v23;
    v30 = self;
    v10 = v23;
    objc_msgSend(v24, "performOnOpenFileDescriptor:error:", v28, 0);

    -[BRCItemToPathLookup closePaths](v10, "closePaths");
    -[BRCAccountSession autoResumeSyncTimerScheduler](self->super._session, "autoResumeSyncTimerScheduler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "reschedule");

    v26 = 1;
    goto LABEL_32;
  }
  -[BRCPQLConnection lastError](self->super._db, "lastError");
  v10 = (BRCItemToPathLookup *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    brc_bread_crumbs();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v12, (os_log_type_t)0x90u))
    {
LABEL_28:

      goto LABEL_29;
    }
    v13 = "(passed to caller)";
    *(_DWORD *)buf = 136315906;
    v32 = "-[BRCDocumentItem(LegacyAdditions) pauseFromSyncWithTimeout:forBundleID:error:]";
    v33 = 2080;
    if (!a5)
      v13 = "(ignored by caller)";
LABEL_27:
    v34 = v13;
    v35 = 2112;
    v36 = v10;
    v37 = 2112;
    v38 = v11;
    _os_log_error_impl(&dword_1CBD43000, v12, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
    goto LABEL_28;
  }
LABEL_29:
  if (a5)
  {
    v10 = objc_retainAutorelease(v10);
    v26 = 0;
    *a5 = v10;
  }
  else
  {
    v26 = 0;
  }
LABEL_32:

  return v26;
}

uint64_t __79__BRCDocumentItem_LegacyAdditions__pauseFromSyncWithTimeout_forBundleID_error___block_invoke(uint64_t a1, int a2)
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;

  v4 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(*(id *)(a1 + 32), "byFileSystemID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "physicalURL");
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v4, "stringWithUTF8String:", objc_msgSend(v6, "fileSystemRepresentation"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  BRCSetXattrValueForKeyOnFD(a2, v7, CFSTR("com.apple.clouddocs.private.item-sync-paused-by-bundle-id#N"), *(void **)(*(_QWORD *)(a1 + 40) + 232));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 240), "stringValue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  BRCSetXattrValueForKeyOnFD(a2, v7, CFSTR("com.apple.clouddocs.private.item-sync-paused-expire-timestamp#N"), v8);

  return 0;
}

- (BOOL)resumeSyncForBundleID:(id)a3 dropLocalChanges:(BOOL)a4 error:(id *)a5
{
  _BOOL4 v6;
  id v8;
  void *v9;
  BOOL v10;
  _BOOL4 v11;
  BRCPQLConnection *db;
  char v13;
  void *v14;
  NSObject *v15;
  char *v16;
  BRCPQLConnection *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  const char *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  const char *v27;
  _QWORD v28[5];
  BOOL v29;
  BOOL v30;
  _QWORD v31[5];
  BOOL v32;
  uint8_t buf[4];
  const char *v34;
  __int16 v35;
  _BYTE v36[18];
  __int16 v37;
  void *v38;
  uint64_t v39;

  v6 = a4;
  v39 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = v8;
  if (self->_syncPausedByBundleID)
  {
    if (!v8 || (objc_msgSend(v8, "isEqualToString:") & 1) != 0)
    {
      v10 = (self->super._localDiffs & 0x3FB0000) != 0;
      v11 = (self->super._localDiffs & 0x3FB0000) != 0 && v6;
      db = self->super._db;
      v31[0] = MEMORY[0x1E0C809B0];
      v31[1] = 3221225472;
      v31[2] = __81__BRCDocumentItem_LegacyAdditions__resumeSyncForBundleID_dropLocalChanges_error___block_invoke;
      v31[3] = &unk_1E875DC48;
      v32 = v11;
      v31[4] = self;
      v13 = -[BRCPQLConnection groupInTransaction:](db, "groupInTransaction:", v31);
      if ((v13 & 1) != 0)
      {
        brc_bread_crumbs();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          BRCItemFieldsPrettyPrint();
          v16 = (char *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v34 = v16;
          v35 = 1024;
          *(_DWORD *)v36 = v11;
          *(_WORD *)&v36[4] = 2112;
          *(_QWORD *)&v36[6] = v14;
          _os_log_impl(&dword_1CBD43000, v15, OS_LOG_TYPE_INFO, "[INFO] resumeSyncForBundleID: document local diffs: %@, trigger resuming: %d%@", buf, 0x1Cu);

        }
        v17 = self->super._db;
        v28[0] = MEMORY[0x1E0C809B0];
        v28[1] = 3221225472;
        v28[2] = __81__BRCDocumentItem_LegacyAdditions__resumeSyncForBundleID_dropLocalChanges_error___block_invoke_84;
        v28[3] = &unk_1E8760A78;
        v29 = v6;
        v30 = v10;
        v28[4] = self;
        -[BRCPQLConnection groupInBatch:](v17, "groupInBatch:", v28);
        if (v9)
        {
          -[BRCAccountSession autoResumeSyncTimerScheduler](self->super._session, "autoResumeSyncTimerScheduler");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "reschedule");

        }
      }
      else
      {
        -[BRCPQLConnection lastError](self->super._db, "lastError");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        if (v23)
        {
          brc_bread_crumbs();
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v25 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v25, (os_log_type_t)0x90u))
          {
            v27 = "(passed to caller)";
            *(_DWORD *)buf = 136315906;
            v34 = "-[BRCDocumentItem(LegacyAdditions) resumeSyncForBundleID:dropLocalChanges:error:]";
            v35 = 2080;
            if (!a5)
              v27 = "(ignored by caller)";
            *(_QWORD *)v36 = v27;
            *(_WORD *)&v36[8] = 2112;
            *(_QWORD *)&v36[10] = v23;
            v37 = 2112;
            v38 = v24;
            _os_log_error_impl(&dword_1CBD43000, v25, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
          }

        }
        if (a5)
          *a5 = objc_retainAutorelease(v23);

      }
      goto LABEL_29;
    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "brc_errorItemAlreadyPausedFromSyncByBundleID:", self->_syncPausedByBundleID);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      brc_bread_crumbs();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v21 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v21, (os_log_type_t)0x90u))
        goto LABEL_25;
      v22 = "(passed to caller)";
      *(_DWORD *)buf = 136315906;
      v34 = "-[BRCDocumentItem(LegacyAdditions) resumeSyncForBundleID:dropLocalChanges:error:]";
      v35 = 2080;
      if (!a5)
        v22 = "(ignored by caller)";
      goto LABEL_35;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "brc_errorItemNotPausedFromSync");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      brc_bread_crumbs();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v21 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v21, (os_log_type_t)0x90u))
      {
LABEL_25:

        goto LABEL_26;
      }
      v22 = "(passed to caller)";
      *(_DWORD *)buf = 136315906;
      v34 = "-[BRCDocumentItem(LegacyAdditions) resumeSyncForBundleID:dropLocalChanges:error:]";
      v35 = 2080;
      if (!a5)
        v22 = "(ignored by caller)";
LABEL_35:
      *(_QWORD *)v36 = v22;
      *(_WORD *)&v36[8] = 2112;
      *(_QWORD *)&v36[10] = v19;
      v37 = 2112;
      v38 = v20;
      _os_log_error_impl(&dword_1CBD43000, v21, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
      goto LABEL_25;
    }
  }
LABEL_26:
  if (a5)
    *a5 = objc_retainAutorelease(v19);

  v13 = 0;
LABEL_29:

  return v13;
}

uint64_t __81__BRCDocumentItem_LegacyAdditions__resumeSyncForBundleID_dropLocalChanges_error___block_invoke(uint64_t a1, void *a2)
{
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  BRCItemToPathLookup *v9;
  void *v10;
  uint64_t v11;
  BRCItemToPathLookup *v12;
  _QWORD v14[4];
  BRCItemToPathLookup *v15;
  uint64_t v16;

  if (*(_BYTE *)(a1 + 40))
    v3 = "1";
  else
    v3 = "NULL";
  v4 = objc_msgSend(a2, "execute:", CFSTR("UPDATE client_items SET version_block_sync_until_bundle_id = NULL, version_block_sync_until_timestamp = NULL, version_block_sync_until_resuming = %s WHERE rowid = %llu"), v3, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 120));
  if ((_DWORD)v4)
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 232);
    *(_QWORD *)(v5 + 232) = 0;

    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(void **)(v7 + 240);
    *(_QWORD *)(v7 + 240) = 0;

    v9 = -[BRCItemToPathLookup initWithItem:]([BRCItemToPathLookup alloc], "initWithItem:", *(_QWORD *)(a1 + 32));
    -[BRCItemToPathLookup byFileSystemID](v9, "byFileSystemID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __81__BRCDocumentItem_LegacyAdditions__resumeSyncForBundleID_dropLocalChanges_error___block_invoke_2;
    v14[3] = &unk_1E875DEB8;
    v11 = *(_QWORD *)(a1 + 32);
    v15 = v9;
    v16 = v11;
    v12 = v9;
    objc_msgSend(v10, "performOnOpenFileDescriptor:error:", v14, 0);

    -[BRCItemToPathLookup closePaths](v12, "closePaths");
  }
  return v4;
}

uint64_t __81__BRCDocumentItem_LegacyAdditions__resumeSyncForBundleID_dropLocalChanges_error___block_invoke_2(uint64_t a1, int a2)
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;

  v4 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(*(id *)(a1 + 32), "byFileSystemID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "physicalURL");
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v4, "stringWithUTF8String:", objc_msgSend(v6, "fileSystemRepresentation"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  BRCSetXattrValueForKeyOnFD(a2, v7, CFSTR("com.apple.clouddocs.private.item-sync-paused-by-bundle-id#N"), *(void **)(*(_QWORD *)(a1 + 40) + 232));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 240), "stringValue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  BRCSetXattrValueForKeyOnFD(a2, v7, CFSTR("com.apple.clouddocs.private.item-sync-paused-expire-timestamp#N"), v8);

  return 0;
}

void __81__BRCDocumentItem_LegacyAdditions__resumeSyncForBundleID_dropLocalChanges_error___block_invoke_84(uint64_t a1, void *a2)
{
  BRCItemToPathLookup *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  if (*(_BYTE *)(a1 + 40))
  {
    if (*(_BYTE *)(a1 + 41))
    {
      *(_QWORD *)(*(_QWORD *)(a1 + 32) + 96) = 0;
      *(_DWORD *)(*(_QWORD *)(a1 + 32) + 80) = 0;
      objc_msgSend(*(id *)(a1 + 32), "saveToDB");
    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "serverItemByItemID:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48));
    v3 = (BRCItemToPathLookup *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "applyScheduler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "createApplyJobFromServerItem:localItem:state:kind:", v3, *(_QWORD *)(a1 + 32), 1, 2);
  }
  else
  {
    v3 = -[BRCItemToPathLookup initWithItem:]([BRCItemToPathLookup alloc], "initWithItem:", *(_QWORD *)(a1 + 32));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "fsReader");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCItemToPathLookup byFileSystemID](v3, "byFileSystemID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "fseventAtPath:flags:", v5, 0);

  }
}

+ (id)nextPausedDocumentBatchEnumeratorWithBundleID:(id)a3 fromRowID:(unint64_t)a4 batchSize:(unsigned int)a5 session:(id)a6 db:(id)a7
{
  uint64_t v8;
  id v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  _QWORD v18[4];
  id v19;
  id v20;

  v8 = *(_QWORD *)&a5;
  v11 = a6;
  v12 = a7;
  v13 = (void *)objc_msgSend(v12, "fetch:", CFSTR("SELECT rowid, zone_rowid, item_id, item_creator_id, item_sharing_options, item_side_car_ckinfo, item_parent_zone_rowid, item_localsyncupstate, item_local_diffs, item_notifs_rank, app_library_rowid, item_min_supported_os_rowid, item_user_visible, item_stat_ckinfo, item_state, item_type, item_mode, item_birthtime, item_lastusedtime, item_favoriterank,item_parent_id, item_filename, item_hidden_ext, item_finder_tags, item_xattr_signature, item_trash_put_back_path, item_trash_put_back_parent_id, item_alias_target, item_creator, item_doc_id, item_file_id, item_generation, item_localname, item_processing_stamp, item_staged_file_id, item_staged_generation, item_bouncedname, item_scope, item_tmpbounceno, version_name, version_ckinfo, version_mtime, version_size, version_thumb_size, version_thumb_signature, version_content_signature, version_xattr_signature, version_edited_since_shared, version_device, version_conflict_loser_etags, version_quarantine_info, version_uploaded_assets, version_upload_error, version_old_zone_item_id, version_old_zone_rowid, desired_version, item_live_conflict_loser_etags, item_thumb_live_signature, item_thumb_greedy, version_block_sync_until_bundle_id, version_block_sync_until_timestamp FROM client_items WHERE rowid > %llu   AND version_block_sync_until_bundle_id = %@ ORDER BY rowid ASC LIMIT %u"), a4, a3, v8);
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __113__BRCDocumentItem_LegacyAdditions__nextPausedDocumentBatchEnumeratorWithBundleID_fromRowID_batchSize_session_db___block_invoke;
  v18[3] = &unk_1E875E310;
  v19 = v11;
  v20 = v12;
  v14 = v12;
  v15 = v11;
  objc_msgSend(v13, "enumerateObjects:", v18);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

id __113__BRCDocumentItem_LegacyAdditions__nextPausedDocumentBatchEnumeratorWithBundleID_fromRowID_batchSize_session_db___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (id)objc_msgSend(*(id *)(a1 + 32), "newLocalItemFromPQLResultSet:db:error:", a2, *(_QWORD *)(a1 + 40), a3);
}

+ (void)autoResumeSyncPausedDocumentsOnTimeoutWithSession:(id)a3
{
  _QWORD *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  _QWORD *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _QWORD v23[4];
  id v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  brc_bread_crumbs();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    +[BRCDocumentItem(LegacyAdditions) autoResumeSyncPausedDocumentsOnTimeoutWithSession:].cold.1();

  v6 = (void *)v3[18];
  v7 = brc_current_date_nsec();
  +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v6, "fetch:", CFSTR("SELECT rowid, zone_rowid, item_id, item_creator_id, item_sharing_options, item_side_car_ckinfo, item_parent_zone_rowid, item_localsyncupstate, item_local_diffs, item_notifs_rank, app_library_rowid, item_min_supported_os_rowid, item_user_visible, item_stat_ckinfo, item_state, item_type, item_mode, item_birthtime, item_lastusedtime, item_favoriterank,item_parent_id, item_filename, item_hidden_ext, item_finder_tags, item_xattr_signature, item_trash_put_back_path, item_trash_put_back_parent_id, item_alias_target, item_creator, item_doc_id, item_file_id, item_generation, item_localname, item_processing_stamp, item_staged_file_id, item_staged_generation, item_bouncedname, item_scope, item_tmpbounceno, version_name, version_ckinfo, version_mtime, version_size, version_thumb_size, version_thumb_signature, version_content_signature, version_xattr_signature, version_edited_since_shared, version_device, version_conflict_loser_etags, version_quarantine_info, version_uploaded_assets, version_upload_error, version_old_zone_item_id, version_old_zone_rowid, desired_version, item_live_conflict_loser_etags, item_thumb_live_signature, item_thumb_greedy, version_block_sync_until_bundle_id, version_block_sync_until_timestamp FROM client_items WHERE version_block_sync_until_timestamp IS NOT NULL AND version_block_sync_until_timestamp < %llu ORDER BY rowid ASC LIMIT %u"), v7, objc_msgSend(v8, "autoResumeSyncBatchSize"));

  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __86__BRCDocumentItem_LegacyAdditions__autoResumeSyncPausedDocumentsOnTimeoutWithSession___block_invoke;
  v23[3] = &unk_1E875E2C8;
  v10 = v3;
  v24 = v10;
  objc_msgSend(v9, "enumerateObjects:", v23);
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
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
        v16 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v15);
        v17 = (void *)MEMORY[0x1D17A6BE8]();
        v18 = 0;
        objc_msgSend(v16, "resumeSyncForBundleID:dropLocalChanges:error:", 0, 0, &v18);
        objc_autoreleasePoolPop(v17);
        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
    }
    while (v13);
  }

}

id __86__BRCDocumentItem_LegacyAdditions__autoResumeSyncPausedDocumentsOnTimeoutWithSession___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (id)objc_msgSend(*(id *)(a1 + 32), "newLocalItemFromPQLResultSet:db:error:", a2, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 144), a3);
}

- (void)learnThumbnailSignatureFromLiveVersion:(id)a3
{
  NSData *v4;
  NSData *liveThumbnailSignature;

  objc_msgSend(a3, "thumbnailSignature");
  v4 = (NSData *)objc_claimAutoreleasedReturnValue();
  liveThumbnailSignature = self->_liveThumbnailSignature;
  self->_liveThumbnailSignature = v4;

}

- (void)removeLiveConflictLoserEtag:(id)a3
{
  NSMutableSet *liveConflictLoserEtags;

  -[NSMutableSet removeObject:](self->_liveConflictLoserEtags, "removeObject:", a3);
  if (!-[NSMutableSet count](self->_liveConflictLoserEtags, "count"))
  {
    liveConflictLoserEtags = self->_liveConflictLoserEtags;
    self->_liveConflictLoserEtags = 0;

  }
}

- (NSNumber)fileIDForUpload
{
  return -[BRCLocalStatInfo fileID](self->super._st, "fileID");
}

- (BRCGenerationID)generationIDForUpload
{
  return -[BRCLocalStatInfo generationID](self->super._st, "generationID");
}

- (id)aliasItemID
{
  void *v3;
  BRCItemID *v4;
  BRCItemID *v5;
  void *v6;

  if (-[BRCLocalItem isSharedToMeTopLevelItem](self, "isSharedToMeTopLevelItem"))
  {
    -[BRCLocalItem asSharedToMeTopLevelItem](self, "asSharedToMeTopLevelItem");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "sharedAliasItemID");
    v4 = (BRCItemID *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[BRCLocalItem appLibrary](self, "appLibrary");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v3, "wasMovedToCloudDocs") & 1) != 0)
    {
      v4 = 0;
    }
    else
    {
      v5 = [BRCItemID alloc];
      -[BRCItemID itemIDString](self->super._itemID, "itemIDString");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = -[BRCItemID initWithAliasUUID:](v5, "initWithAliasUUID:", v6);

    }
  }

  return v4;
}

- (NSError)uploadError
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[BRCLocalItem syncUpError](self, "syncUpError");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[BRCDocumentItem currentVersion](self, "currentVersion");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "uploadError");
    v5 = (id)objc_claimAutoreleasedReturnValue();

  }
  return (NSError *)v5;
}

- (BOOL)isPackage
{
  unsigned int v3;
  void *v5;
  NSObject *v6;

  if (!-[BRCLocalItem isFinderBookmark](self, "isFinderBookmark"))
  {
    v3 = -[BRCStatInfo type](self->super._st, "type");
    if (v3 > 8 || ((1 << v3) & 0x106) == 0)
    {
      brc_bread_crumbs();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
        -[BRCDocumentItem isPackage].cold.1();

    }
  }
  return -[BRCVersion isPackage](self->_currentVersion, "isPackage");
}

- (BOOL)isDocument
{
  unsigned int v3;
  void *v5;
  NSObject *v6;

  if (!-[BRCLocalItem isFinderBookmark](self, "isFinderBookmark"))
  {
    v3 = -[BRCStatInfo type](self->super._st, "type");
    if (v3 > 8 || ((1 << v3) & 0x106) == 0)
    {
      brc_bread_crumbs();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
        -[BRCDocumentItem isPackage].cold.1();

    }
  }
  return 1;
}

- (BOOL)isShareableItem
{
  return 1;
}

- (id)collaborationIdentifierIfComputable
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  if (-[BRCDocumentItem isShareableItem](self, "isShareableItem"))
  {
    v3 = objc_alloc(MEMORY[0x1E0C95070]);
    -[BRCDocumentItem asShareableItem](self, "asShareableItem");
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

- (BOOL)hasLocalContent
{
  if (!-[BRCStatInfo state](self->super._st, "state") || -[BRCStatInfo state](self->super._st, "state") == -1)
    return !-[BRCDocumentItem isFault](self, "isFault");
  else
    return 0;
}

- (BOOL)isDocumentBeingCopiedToNewZone
{
  void *v2;
  BOOL v3;

  -[BRCLocalVersion previousItemGlobalID](self->_currentVersion, "previousItemGlobalID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (BOOL)isCrossZoneMoveTombstone
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;

  -[BRCLocalItem asDocument](self->super._orig, "asDocument");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[BRCLocalItem isDead](self, "isDead")
    || -[BRCDocumentItem isDocumentBeingCopiedToNewZone](self, "isDocumentBeingCopiedToNewZone")
    || (objc_msgSend(v3, "isDead") & 1) != 0
    || !objc_msgSend(v3, "isDocumentBeingCopiedToNewZone"))
  {
    v7 = 0;
  }
  else
  {
    -[BRCLocalItem itemGlobalID](self, "itemGlobalID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "currentVersion");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "previousItemGlobalID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v4, "isEqualToItemGlobalID:", v6);

  }
  return v7;
}

- (BOOL)isEvictable
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  __CFString *v10;
  __CFString *v11;
  void *v12;
  char v13;
  _BOOL4 v14;

  -[BRCLocalItem appLibrary](self, "appLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mangledID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[BRCLocalStatInfo logicalName](self->super._st, "logicalName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "br_pathExtension");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "lowercaseString");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  v10 = &stru_1E8769030;
  if (v8)
    v10 = (__CFString *)v8;
  v11 = v10;

  objc_msgSend(v5, "nonEvictableExtensions");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "containsObject:", v11);

  if ((v13 & 1) != 0 || !-[BRCLocalItem isIdleOrRejected](self, "isIdleOrRejected"))
    LOBYTE(v14) = 0;
  else
    v14 = !-[BRCDocumentItem isPausedFromSync](self, "isPausedFromSync");

  return v14;
}

+ (BOOL)isDocumentAutomaticallyEvictableWithExtension:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  BOOL v8;
  void *v9;
  __CFString *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "nonEvictableExtensions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "containsObject:", v3))
  {
    objc_msgSend(v4, "nonAutoEvictableExtensions");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "containsObject:", v3);

    if ((v7 & 1) != 0)
      goto LABEL_4;
    +[BRCUTITypeCache defaultCache](BRCUTITypeCache, "defaultCache");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "UTIForExtension:", v3);
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();

    if (!v10)
    {
      v8 = 1;
LABEL_27:

      goto LABEL_28;
    }
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    objc_msgSend(v4, "autoEvictableUTIs");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v26;
LABEL_8:
      v15 = 0;
      while (1)
      {
        if (*(_QWORD *)v26 != v14)
          objc_enumerationMutation(v11);
        if (UTTypeConformsTo(v10, *(CFStringRef *)(*((_QWORD *)&v25 + 1) + 8 * v15)))
          break;
        if (v13 == ++v15)
        {
          v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
          if (v13)
            goto LABEL_8;
          goto LABEL_14;
        }
      }
    }
    else
    {
LABEL_14:

      v23 = 0u;
      v24 = 0u;
      v21 = 0u;
      v22 = 0u;
      objc_msgSend(v4, "nonAutoEvictableUTIs", 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
      if (v16)
      {
        v17 = v16;
        v18 = *(_QWORD *)v22;
        while (2)
        {
          for (i = 0; i != v17; ++i)
          {
            if (*(_QWORD *)v22 != v18)
              objc_enumerationMutation(v11);
            if (UTTypeConformsTo(v10, *(CFStringRef *)(*((_QWORD *)&v21 + 1) + 8 * i)))
            {
              v8 = 0;
              goto LABEL_26;
            }
          }
          v17 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
          v8 = 1;
          if (v17)
            continue;
          goto LABEL_26;
        }
      }
    }
    v8 = 1;
LABEL_26:

    goto LABEL_27;
  }

LABEL_4:
  v8 = 0;
LABEL_28:

  return v8;
}

+ (BOOL)isDocumentAutomaticallyEvictableWithName:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "br_pathExtension");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lowercaseString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(a1) = objc_msgSend(a1, "isDocumentAutomaticallyEvictableWithExtension:", v5);
  return (char)a1;
}

- (BOOL)isAutomaticallyEvictable
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  BRCRelativePath *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  uint64_t v20;
  BRCDesiredVersion *desiredVersion;
  BOOL v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  if (!-[BRCDocumentItem isEvictable](self, "isEvictable"))
    return 0;
  if (!-[BRCDocumentItem hasLocalContent](self, "hasLocalContent"))
    return 0;
  if (self->_shouldAutomaticallyDownloadThumbnail)
  {
    -[BRCDocumentItem currentVersion](self, "currentVersion");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isSmallAndMostRecentClientsGenerateThumbnails");

    if ((v4 & 1) != 0)
      return 0;
  }
  v5 = (void *)objc_opt_class();
  -[BRCLocalStatInfo logicalName](self->super._st, "logicalName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v5) = objc_msgSend(v5, "isDocumentAutomaticallyEvictableWithName:", v6);

  if (!(_DWORD)v5)
    return 0;
  -[BRCLocalItem appLibrary](self, "appLibrary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "mangledID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "nonEvictablePathComponents");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "count"))
  {
    -[BRCLocalStatInfo fileID](self->super._st, "fileID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "unsignedLongLongValue");

    v13 = -[BRCRelativePath initWithFileID:session:]([BRCRelativePath alloc], "initWithFileID:session:", v12, self->super._session);
    if (-[BRCRelativePath resolveMustExist:error:](v13, "resolveMustExist:error:", 1, 0))
    {
      v26 = 0u;
      v27 = 0u;
      v24 = 0u;
      v25 = 0u;
      -[BRCRelativePath pathRelativeToRoot](v13, "pathRelativeToRoot", 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "pathComponents");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      if (v16)
      {
        v17 = v16;
        v18 = *(_QWORD *)v25;
        while (2)
        {
          for (i = 0; i != v17; ++i)
          {
            if (*(_QWORD *)v25 != v18)
              objc_enumerationMutation(v15);
            if ((objc_msgSend(v10, "containsObject:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i)) & 1) != 0)
            {

              v22 = 0;
              goto LABEL_25;
            }
          }
          v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
          if (v17)
            continue;
          break;
        }
      }

    }
  }
  v20 = objc_msgSend(v9, "minAutomaticallyEvictableFilesize");
  desiredVersion = self->_desiredVersion;
  v22 = desiredVersion && -[BRCVersion size](desiredVersion, "size") >= v20
     || -[BRCVersion size](self->_currentVersion, "size") >= v20;
LABEL_25:

  return v22;
}

- (BOOL)isVisibleIniCloudDrive
{
  int v3;
  void *v4;
  void *v5;
  void *v6;

  if (-[BRCLocalItem isInDocumentScope](self, "isInDocumentScope"))
  {
    if (-[BRCClientZone isSharedZone](self->super._clientZone, "isSharedZone"))
    {
      LOBYTE(v3) = 1;
    }
    else
    {
      -[BRCClientZone asPrivateClientZone](self->super._clientZone, "asPrivateClientZone");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "defaultAppLibrary");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v5, "containerMetadata");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "isDocumentScopePublic"))
        v3 = objc_msgSend(v6, "isCloudSyncTCCDisabled") ^ 1;
      else
        LOBYTE(v3) = 0;

    }
  }
  else
  {
    LOBYTE(v3) = 0;
  }
  return v3;
}

- (BOOL)hasShareIDAndIsOwnedByMe
{
  _BOOL4 v3;

  v3 = -[BRCLocalItem isOwnedByMe](self, "isOwnedByMe");
  if (v3)
    return (LOBYTE(self->super._sharingOptions) >> 2) & 1;
  return v3;
}

+ (BOOL)shouldDocumentBeGreedyWithName:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;

  objc_msgSend(a3, "br_pathExtension");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lowercaseString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "nonEvictableExtensions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "containsObject:", v4) & 1) != 0)
  {
    v7 = 1;
  }
  else
  {
    objc_msgSend(v5, "shouldBeGreedyExtensions");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v8, "containsObject:", v4);

  }
  return v7;
}

- (BOOL)shouldBeGreedy
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  NSObject *v10;
  char v11;
  void *v12;
  void *v13;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  NSObject *v28;
  void *v29;
  char v30;
  void *v31;
  int v32;
  uint64_t v33;
  __int16 v34;
  uint64_t v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  -[BRCLocalItem session](self, "session");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasOptimizeStorageEnabled");

  -[BRCLocalItem appLibrary](self, "appLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if ((v4 & 1) == 0)
  {
    v11 = objc_msgSend(v5, "isGreedy");

    if ((v11 & 1) != 0)
    {
      brc_bread_crumbs();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        -[BRCDocumentItem shouldBeGreedy].cold.3();
      goto LABEL_11;
    }
    brc_bread_crumbs();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      -[BRCDocumentItem shouldBeGreedy].cold.4();

    return 0;
  }
  objc_msgSend(v5, "appLibraryID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0D10CF8]);

  if (v8)
  {
    brc_bread_crumbs();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      -[BRCDocumentItem shouldBeGreedy].cold.1();
LABEL_11:

    return 1;
  }
  v12 = (void *)objc_opt_class();
  -[BRCLocalStatInfo logicalName](self->super._st, "logicalName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v12) = objc_msgSend(v12, "shouldDocumentBeGreedyWithName:", v13);

  if ((_DWORD)v12)
  {
    brc_bread_crumbs();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      -[BRCDocumentItem shouldBeGreedy].cold.2();
    goto LABEL_11;
  }
  -[BRCLocalItem appLibrary](self, "appLibrary");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "mangledID");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "maximumDocumentAgeToBeGreedy");
  v21 = v20;

  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", -v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "timeIntervalSince1970");
  v24 = (uint64_t)v23;

  -[BRCDocumentItem currentVersion](self, "currentVersion");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "mtime");

  if (v26 < v24)
  {
    brc_bread_crumbs();
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
    {
      -[BRCDocumentItem currentVersion](self, "currentVersion");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = 134218498;
      v33 = objc_msgSend(v31, "mtime");
      v34 = 2048;
      v35 = (uint64_t)(v21 / 86400.0);
      v36 = 2112;
      v37 = v27;
      _os_log_debug_impl(&dword_1CBD43000, v28, OS_LOG_TYPE_DEBUG, "[DEBUG] don't be greedy because document is too old (mtime: %lld; max age: %lld days)%@",
        (uint8_t *)&v32,
        0x20u);

    }
    return 0;
  }
  -[BRCLocalItem appLibrary](self, "appLibrary");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v29, "isGreedy");

  return v30;
}

- (BOOL)shouldHaveThumbnail
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  __CFString *v8;
  __CFString *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  BOOL v14;

  -[BRCLocalItem st](self, "st");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "logicalName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "br_pathExtension");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lowercaseString");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  v8 = &stru_1E8769030;
  if (v6)
    v8 = (__CFString *)v6;
  v9 = v8;

  -[BRCLocalItem appLibrary](self, "appLibrary");
  v10 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v10, "mangledID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "blacklistedThumbnailExtensions");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v10) = objc_msgSend(v13, "containsObject:", v9);
  v14 = (v10 & 1) == 0 && -[BRCLocalItem isInDocumentScope](self, "isInDocumentScope");

  return v14;
}

- (BOOL)shouldTransferThumbnail
{
  void *v3;
  int v4;

  if (-[BRCLocalItem isFinderBookmark](self, "isFinderBookmark")
    || -[BRCDocumentItem isDocumentBeingCopiedToNewZone](self, "isDocumentBeingCopiedToNewZone")
    || !-[BRCDocumentItem shouldHaveThumbnail](self, "shouldHaveThumbnail"))
  {
    LOBYTE(v4) = 0;
  }
  else
  {
    -[BRCDocumentItem currentVersion](self, "currentVersion");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isSmallAndMostRecentClientsGenerateThumbnails") ^ 1;

  }
  return v4;
}

- (unsigned)queryItemStatus
{
  unsigned int result;

  if (-[BRCLocalItem isDead](self, "isDead"))
    return 1;
  result = -[BRCDocumentItem isFault](self, "isFault");
  if (result)
  {
    if (-[BRCDesiredVersion wantsContent](self->_desiredVersion, "wantsContent"))
      return 2;
    else
      return 3;
  }
  return result;
}

- (unsigned)downloadStatus
{
  if (-[BRCLocalItem isReserved](self, "isReserved") || -[BRCDocumentItem isFault](self, "isFault"))
    return 1;
  if (-[BRCDesiredVersion wantsContent](self->_desiredVersion, "wantsContent"))
    return 2;
  return 3;
}

- (BOOL)_isInterestingUpdateForNotifs
{
  BRCLocalItem *v3;
  void *v4;
  void *v5;
  int v6;
  int v7;
  int v8;
  BOOL v9;
  char v10;
  void *v11;

  v3 = self->super._orig;
  -[BRCLocalItem currentVersion](v3, "currentVersion");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uploadError");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {

  }
  else
  {
    -[BRCLocalVersion uploadError](self->_currentVersion, "uploadError");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
LABEL_8:
      v10 = 1;
      goto LABEL_9;
    }
  }
  v6 = -[BRCLocalItem queryItemStatus](v3, "queryItemStatus");
  if (v6 != -[BRCDocumentItem queryItemStatus](self, "queryItemStatus"))
    goto LABEL_8;
  v7 = -[BRCLocalItem downloadStatus](v3, "downloadStatus");
  if (v7 != -[BRCDocumentItem downloadStatus](self, "downloadStatus"))
    goto LABEL_8;
  v8 = -[BRCLocalItem uploadStatus](v3, "uploadStatus");
  if (v8 != -[BRCLocalItem uploadStatus](self, "uploadStatus"))
    goto LABEL_8;
  v9 = -[NSMutableSet count](self->_liveConflictLoserEtags, "count") == 0;
  v10 = v9 ^ (-[BRCClientZone count](v3[1]._clientZone, "count") == 0);
LABEL_9:

  return v10;
}

- (id)descriptionWithContext:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSString *syncPausedByBundleID;
  void *v8;
  void *v9;
  void *v10;
  BRCLocalVersion *currentVersion;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSData *liveThumbnailSignature;
  const char *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  objc_super v29;

  v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)BRCDocumentItem;
  -[BRCLocalItem descriptionWithContext:](&v29, sel_descriptionWithContext_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_syncPausedByBundleID)
  {
    v6 = objc_alloc_init(MEMORY[0x1E0CB3578]);
    objc_msgSend(v6, "setDateStyle:", 1);
    objc_msgSend(v6, "setTimeStyle:", 2);
    syncPausedByBundleID = self->_syncPausedByBundleID;
    v8 = (void *)MEMORY[0x1E0C99D68];
    -[NSNumber longLongValue](self->_syncPausedExpireTS, "longLongValue");
    brc_interval_from_nsec();
    objc_msgSend(v8, "dateWithTimeIntervalSince1970:");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringFromDate:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR(" paused:{bundle:%@, till:%@}"), syncPausedByBundleID, v10);

  }
  currentVersion = self->_currentVersion;
  if (currentVersion)
  {
    -[BRCLocalVersion descriptionWithContext:](currentVersion, "descriptionWithContext:", v4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR(" ct{%@}"), v12);

  }
  if (-[BRCDesiredVersion wantsContent](self->_desiredVersion, "wantsContent")
    || -[BRCDesiredVersion wantsThumbnail](self->_desiredVersion, "wantsThumbnail"))
  {
    +[BRCDumpContext highlightedString:type:context:](BRCDumpContext, "highlightedString:type:context:", CFSTR("downloading{"), 7, v4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR(" %@"), v13);

    if (-[BRCDesiredVersion wantsContent](self->_desiredVersion, "wantsContent"))
    {
      objc_msgSend(v5, "appendString:", CFSTR("content"));
      if (-[BRCDesiredVersion wantsThumbnail](self->_desiredVersion, "wantsThumbnail"))
        objc_msgSend(v5, "appendString:", CFSTR("+"));
    }
    if (-[BRCDesiredVersion wantsThumbnail](self->_desiredVersion, "wantsThumbnail"))
      objc_msgSend(v5, "appendString:", CFSTR("thumbnail"));
    -[BRCDesiredVersion downloadError](self->_desiredVersion, "downloadError");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      -[BRCDesiredVersion downloadError](self->_desiredVersion, "downloadError");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "description");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      +[BRCDumpContext highlightedString:type:context:](BRCDumpContext, "highlightedString:type:context:", v16, 3, v4);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "appendFormat:", CFSTR(" (%@)"), v17);

    }
    -[BRCVersion ckInfo](self->_desiredVersion, "ckInfo");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "etag");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR("}:%@"), v19);

  }
  if (-[BRCDesiredVersion isFault](self->_desiredVersion, "isFault"))
  {
    +[BRCDumpContext highlightedString:type:context:](BRCDumpContext, "highlightedString:type:context:", CFSTR("faulting"), 7, v4);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR(" %@"), v20);

  }
  if (self->_shouldAutomaticallyDownloadThumbnail || self->_liveThumbnailSignature)
  {
    objc_msgSend(v5, "appendFormat:", CFSTR(" thumb{"));
    if (self->_shouldAutomaticallyDownloadThumbnail)
      objc_msgSend(v5, "appendString:", CFSTR("greedy"));
    liveThumbnailSignature = self->_liveThumbnailSignature;
    if (liveThumbnailSignature)
    {
      if (self->_shouldAutomaticallyDownloadThumbnail)
        v22 = " ";
      else
        v22 = "";
      if (-[NSData brc_signatureIsPendingPlaceHolder](liveThumbnailSignature, "brc_signatureIsPendingPlaceHolder"))
      {
        objc_msgSend(v5, "appendFormat:", CFSTR("%ssig:%@"), v22, CFSTR("<pending>"));
      }
      else
      {
        -[NSData brc_hexadecimalString](self->_liveThumbnailSignature, "brc_hexadecimalString");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "appendFormat:", CFSTR("%ssig:%@"), v22, v23);

      }
    }
    objc_msgSend(v5, "appendFormat:", CFSTR("}"));
  }
  if (-[NSMutableSet count](self->_liveConflictLoserEtags, "count"))
  {
    -[NSMutableSet allObjects](self->_liveConflictLoserEtags, "allObjects");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "componentsJoinedByString:", CFSTR(", "));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR(" live-losers:{%@}"), v25);

  }
  if (-[NSMutableSet count](self->_resolvedConflictLoserEtags, "count"))
  {
    -[NSMutableSet allObjects](self->_resolvedConflictLoserEtags, "allObjects");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "componentsJoinedByString:", CFSTR(", "));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR(" resolved-losers:{%@}"), v27);

  }
  return v5;
}

- (id)_initWithServerItem:(id)a3 dbRowID:(unint64_t)a4
{
  id v6;
  id v7;
  void *v8;
  BRCLocalVersion *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  void *v18;
  NSObject *v19;
  objc_super v20;

  v6 = a3;
  v20.receiver = self;
  v20.super_class = (Class)BRCDocumentItem;
  v7 = -[BRCLocalItem _initWithServerItem:dbRowID:](&v20, sel__initWithServerItem_dbRowID_, v6, a4);
  if (v7)
  {
    objc_msgSend(v6, "latestVersion");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      if ((objc_msgSend(v6, "isDocument") & 1) == 0)
      {
        brc_bread_crumbs();
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
          -[BRCDocumentItem _initWithServerItem:dbRowID:].cold.2();

      }
      v9 = [BRCLocalVersion alloc];
      objc_msgSend(v6, "latestVersion");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = -[BRCLocalVersion initWithVersion:](v9, "initWithVersion:", v10);
      v12 = (void *)*((_QWORD *)v7 + 25);
      *((_QWORD *)v7 + 25) = v11;

      v13 = objc_msgSend(*((id *)v7 + 25), "copy");
      v14 = *((_QWORD *)v7 + 11);
      v15 = *(void **)(v14 + 200);
      *(_QWORD *)(v14 + 200) = v13;
    }
    else
    {
      brc_bread_crumbs();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
        -[BRCDocumentItem _initWithServerItem:dbRowID:].cold.1();

    }
  }

  return v7;
}

- (id)_initWithLocalItem:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)BRCDocumentItem;
  v5 = -[BRCLocalItem _initWithLocalItem:](&v16, sel__initWithLocalItem_, v4);
  if (v5)
  {
    objc_msgSend(v4, "asDocument");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(*(id *)(v6 + 200), "copy");
    v8 = (void *)*((_QWORD *)v5 + 25);
    *((_QWORD *)v5 + 25) = v7;

    v9 = objc_msgSend(*(id *)(v6 + 248), "copy");
    v10 = (void *)*((_QWORD *)v5 + 31);
    *((_QWORD *)v5 + 31) = v9;

    *((_BYTE *)v5 + 216) = *(_BYTE *)(v6 + 216);
    objc_storeStrong((id *)v5 + 32, *(id *)(v6 + 256));
    v11 = objc_msgSend(*(id *)(v6 + 224), "mutableCopy");
    v12 = (void *)*((_QWORD *)v5 + 28);
    *((_QWORD *)v5 + 28) = v11;

    v13 = objc_msgSend(*(id *)(v6 + 208), "mutableCopy");
    v14 = (void *)*((_QWORD *)v5 + 26);
    *((_QWORD *)v5 + 26) = v13;

  }
  return v5;
}

- (BOOL)hasValidCKInfo
{
  _BOOL4 v3;
  uint64_t v4;
  void *v5;
  BOOL v6;
  void *v7;

  v3 = -[BRCLocalItem isTopLevelSharedItem](self, "isTopLevelSharedItem");
  -[BRCVersion ckInfo](self->_currentVersion, "ckInfo");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v3)
  {
    v6 = v4 != 0;
  }
  else if (v4)
  {
    -[BRCStatInfo ckInfo](self->super._st, "ckInfo");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v7 != 0;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (unint64_t)diffAgainstServerItem:(id)a3
{
  id v4;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  BRCLocalVersion *currentVersion;
  BRCLocalVersion *v12;
  NSMutableSet *resolvedConflictLoserEtags;
  void *v14;
  void *v15;
  void *v17;
  NSObject *v18;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)BRCDocumentItem;
  v5 = -[BRCLocalItem diffAgainstServerItem:](&v19, sel_diffAgainstServerItem_, v4);
  if (v4 && (objc_msgSend(v4, "isDocument") & 1) == 0)
  {
    brc_bread_crumbs();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
      -[BRCDocumentItem diffAgainstServerItem:].cold.1();

  }
  if (objc_msgSend(v4, "isDocument"))
  {
    if (self->_currentVersion)
    {
      objc_msgSend(v4, "latestVersion");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6)
      {
        objc_msgSend(v4, "latestVersion");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v5 |= -[BRCVersion diffAgainst:](self->_currentVersion, "diffAgainst:", v7);
        if (-[BRCClientZone isSharedZone](self->super._clientZone, "isSharedZone"))
          v5 &= ~0x1000000uLL;
        if ((v5 & 0x2000000) != 0)
        {
          -[BRCVersion editedSinceShared](self->_currentVersion, "editedSinceShared");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v8, "BOOLValue") & 1) != 0)
          {
            objc_msgSend(v7, "editedSinceShared");
            v9 = (void *)objc_claimAutoreleasedReturnValue();
            v10 = objc_msgSend(v9, "BOOLValue");

            if (!v10)
              v5 &= ~0x2000000uLL;
          }
          else
          {

          }
        }

        if ((v5 & 0x800000) != 0)
          goto LABEL_20;
LABEL_18:
        resolvedConflictLoserEtags = self->_resolvedConflictLoserEtags;
        objc_msgSend(v4, "latestVersion");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "conflictLoserEtags");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(resolvedConflictLoserEtags) = -[NSMutableSet intersectsSet:](resolvedConflictLoserEtags, "intersectsSet:", v15);

        if ((_DWORD)resolvedConflictLoserEtags)
          v5 |= 0x800000uLL;
        goto LABEL_20;
      }
      currentVersion = self->_currentVersion;
    }
    else
    {
      currentVersion = 0;
    }
    objc_msgSend(v4, "latestVersion");
    v12 = (BRCLocalVersion *)objc_claimAutoreleasedReturnValue();

    if (currentVersion != v12)
      v5 |= 0x3FF0000uLL;
    if ((v5 & 0x800000) == 0)
      goto LABEL_18;
  }
LABEL_20:

  return v5;
}

- (unint64_t)diffAgainstLocalItem:(id)a3
{
  id v4;
  unint64_t v5;
  _QWORD *v6;
  _QWORD *v7;
  void *v8;
  BRCLocalVersion *currentVersion;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  int v17;
  NSMutableSet *resolvedConflictLoserEtags;
  void *v19;
  NSMutableSet *v20;
  NSMutableSet *v21;
  NSMutableSet *v22;
  int v23;
  void *v24;
  NSString *v25;
  NSString *v26;
  NSString *v27;
  char v28;
  void *v29;
  NSNumber *v30;
  NSNumber *v31;
  NSNumber *v32;
  char v33;
  void *v35;
  NSObject *v36;
  objc_super v37;

  v4 = a3;
  v37.receiver = self;
  v37.super_class = (Class)BRCDocumentItem;
  v5 = -[BRCLocalItem diffAgainstLocalItem:](&v37, sel_diffAgainstLocalItem_, v4);
  if (v4 && (objc_msgSend(v4, "isDocument") & 1) == 0)
  {
    brc_bread_crumbs();
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_FAULT))
      -[BRCDocumentItem diffAgainstServerItem:].cold.1();

  }
  if (objc_msgSend(v4, "isDocument"))
  {
    objc_msgSend(v4, "asDocument");
    v6 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (self->_currentVersion)
    {
      objc_msgSend(v6, "currentVersion");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      currentVersion = self->_currentVersion;
      if (v8)
      {
        v10 = -[BRCLocalVersion diffAgainstLocalVersion:](currentVersion, "diffAgainstLocalVersion:", v7[25]) | v5;
        if ((v10 & 0x10000000000000) != 0)
          goto LABEL_20;
LABEL_13:
        -[BRCVersion ckInfo](self->_desiredVersion, "ckInfo");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "desiredVersion");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "ckInfo");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v11;
        v15 = v13;
        v16 = v15;
        if (v14 == v15)
        {
          v17 = 0;
        }
        else if (v15)
        {
          v17 = objc_msgSend(v14, "isEqual:", v15) ^ 1;
        }
        else
        {
          v17 = 1;
        }

        if (v17)
          v10 |= 0x10000000000000uLL;
LABEL_20:
        if ((v10 & 0x800000) == 0)
        {
          resolvedConflictLoserEtags = self->_resolvedConflictLoserEtags;
          objc_msgSend(v7, "resolvedConflictLoserEtags");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = resolvedConflictLoserEtags;
          v21 = v19;
          v22 = v21;
          if (v20 == v21)
            v23 = 0;
          else
            v23 = v21 ? -[NSMutableSet isEqual:](v20, "isEqual:", v21) ^ 1 : 1;

          if (v23)
            v10 |= 0x800000uLL;
        }
        if (-[BRCClientZone isSharedZone](self->super._clientZone, "isSharedZone"))
          v5 = v10 & 0xFFFFFFFFFEFFFFFFLL;
        else
          v5 = v10;
        if (-[BRCLocalItem isSharedToMeTopLevelItem](self, "isSharedToMeTopLevelItem"))
          v5 &= ~0x40000uLL;
        if ((v5 & 0x200000000000000) == 0)
        {
          v24 = (void *)v7[29];
          v25 = self->_syncPausedByBundleID;
          v26 = v24;
          if (v25 == v26)
          {

          }
          else
          {
            v27 = v26;
            if (!v26)
            {

              goto LABEL_46;
            }
            v28 = -[NSString isEqual:](v25, "isEqual:", v26);

            if ((v28 & 1) == 0)
            {
LABEL_46:
              v5 |= 0x200000000000000uLL;
              if ((v5 & 0x200000000000000) != 0)
                goto LABEL_50;
LABEL_40:
              v29 = (void *)v7[30];
              v30 = self->_syncPausedExpireTS;
              v31 = v29;
              if (v30 == v31)
              {

              }
              else
              {
                v32 = v31;
                if (v31)
                {
                  v33 = -[NSNumber isEqual:](v30, "isEqual:", v31);

                  if ((v33 & 1) != 0)
                    goto LABEL_50;
                }
                else
                {

                }
                v5 |= 0x200000000000000uLL;
              }
LABEL_50:

              goto LABEL_51;
            }
          }
        }
        if ((v5 & 0x200000000000000) != 0)
          goto LABEL_50;
        goto LABEL_40;
      }
    }
    else
    {
      currentVersion = 0;
    }
    if (currentVersion == (BRCLocalVersion *)v7[25])
      v10 = v5;
    else
      v10 = v5 | 0x7000003FF0000;
    if ((v10 & 0x10000000000000) != 0)
      goto LABEL_20;
    goto LABEL_13;
  }
LABEL_51:

  return v5;
}

- (BOOL)validateLoggingToFile:(__sFILE *)a3
{
  unsigned int v5;
  BRCLocalVersion *currentVersion;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)BRCDocumentItem;
  v5 = -[BRCLocalItem validateLoggingToFile:](&v8, sel_validateLoggingToFile_);
  currentVersion = self->_currentVersion;
  if (currentVersion)
  {
    if (v5)
      LOBYTE(v5) = -[BRCVersion check:logToFile:](currentVersion, "check:logToFile:", self->super._itemID, a3);
  }
  else if (!-[BRCLocalItem isDead](self, "isDead"))
  {
    fprintf(a3, "item %s is a live document without a version\n", -[BRCItemID UTF8String](self->super._itemID, "UTF8String"));
    LOBYTE(v5) = 0;
  }
  return v5;
}

- (void)clearVersionSignatures:(unint64_t)a3 isPackage:(BOOL)a4
{
  _BOOL8 v4;
  void *v7;
  NSObject *v8;

  v4 = a4;
  if (-[BRCDocumentItem isDocumentBeingCopiedToNewZone](self, "isDocumentBeingCopiedToNewZone"))
    -[BRCLocalVersion setUploadedAssets:](self->_currentVersion, "setUploadedAssets:", 0);
  if (!-[BRCDocumentItem isFault](self, "isFault"))
  {
    brc_bread_crumbs();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      -[BRCDocumentItem clearVersionSignatures:isPackage:].cold.1();

    -[BRCLocalVersion _clearSignatures:isPackage:](self->_currentVersion, "_clearSignatures:isPackage:", a3, v4);
  }
}

- (id)syncContextUsedForTransfers
{
  BRCServerZone *serverZone;
  void *v3;
  void *v4;

  serverZone = self->super._serverZone;
  -[BRCLocalItem appLibrary](self, "appLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[BRCSyncContext transferContextForServerZone:appLibrary:](BRCSyncContext, "transferContextForServerZone:appLibrary:", serverZone, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)updateContentsCKInfoAndDeviceIDFromServerItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  NSObject *v21;
  int v22;
  void *v23;
  __int16 v24;
  id v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "latestVersion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "ckInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  brc_bread_crumbs();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v6, "etag");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 138412802;
    v23 = v13;
    v24 = 2112;
    v25 = v4;
    v26 = 2112;
    v27 = v7;
    _os_log_debug_impl(&dword_1CBD43000, v8, OS_LOG_TYPE_DEBUG, "[DEBUG] updating ct-etag:%@ from server item: %@%@", (uint8_t *)&v22, 0x20u);

  }
  if (!v4)
  {
    brc_bread_crumbs();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
      -[BRCLocalItem updateStructuralCKInfoFromServerItem:].cold.3();

  }
  if ((objc_msgSend(v4, "isDocument") & 1) == 0)
  {
    brc_bread_crumbs();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
      -[BRCDocumentItem updateContentsCKInfoAndDeviceIDFromServerItem:].cold.3();

  }
  if (-[BRCDocumentItem isDocument](self, "isDocument"))
  {
    if (v6)
      goto LABEL_7;
    goto LABEL_19;
  }
  brc_bread_crumbs();
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
    -[BRCDocumentItem updateContentsCKInfoAndDeviceIDFromServerItem:].cold.2();

  if (!v6)
  {
LABEL_19:
    brc_bread_crumbs();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
      -[BRCLocalItem updateStructuralCKInfoFromServerItem:].cold.2();

  }
LABEL_7:
  if (-[BRCDocumentItem isDocumentBeingCopiedToNewZone](self, "isDocumentBeingCopiedToNewZone"))
  {
    -[BRCVersion ckInfo](self->_currentVersion, "ckInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "etagBeforeCrossZoneMove");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setEtagBeforeCrossZoneMove:", v10);

  }
  -[BRCVersion setCkInfo:](self->_currentVersion, "setCkInfo:", v6);
  objc_msgSend(v4, "latestVersion");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "lastEditorDeviceOrUserRowID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCVersion setLastEditorDeviceOrUserRowID:](self->_currentVersion, "setLastEditorDeviceOrUserRowID:", v12);

}

- (void)updateVersionMetadataFromServerItem:(id)a3 preventVersionDiffs:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  _BOOL4 v8;
  void *v9;
  uint64_t v10;
  void *v11;
  char v12;
  _BOOL4 v13;
  void *v14;
  uint64_t v15;
  void *v16;
  unint64_t v17;
  NSObject *v18;
  void *v19;
  NSObject *isa;
  void *v21;
  BRCLocalVersion *currentVersion;
  void *v23;
  void *v24;
  void *v25;
  BRCLocalVersion *v26;
  BRCLocalVersion *v27;
  BRCLocalVersion *v28;
  BRCLocalItem *orig;
  BRCLocalVersion *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  NSObject *v34;
  int v35;
  uint64_t v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  BRCLocalVersion *v40;
  __int16 v41;
  void *v42;
  uint64_t v43;

  v4 = a4;
  v43 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if ((objc_msgSend(v6, "isDocument") & 1) == 0)
  {
    brc_bread_crumbs();
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_FAULT))
      -[BRCDocumentItem updateContentsCKInfoAndDeviceIDFromServerItem:].cold.3();

  }
  objc_msgSend(v6, "latestVersion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    brc_bread_crumbs();
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_FAULT))
      -[BRCDocumentItem updateVersionMetadataFromServerItem:preventVersionDiffs:].cold.2();

  }
  v8 = -[BRCDocumentItem isPausedFromSync](self, "isPausedFromSync");
  objc_msgSend(v6, "latestVersion");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "diffAgainst:", self->_currentVersion);

  if ((v10 & 0x100000) != 0 && !v8 && !-[BRCDocumentItem isResumingSync](self, "isResumingSync"))
  {
    brc_bread_crumbs();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    isa = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(isa, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v6, "latestVersion");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      currentVersion = self->_currentVersion;
      v35 = 134218754;
      v36 = v10;
      v37 = 2112;
      v38 = v21;
      v39 = 2112;
      v40 = currentVersion;
      v41 = 2112;
      v42 = v19;
      _os_log_impl(&dword_1CBD43000, isa, OS_LOG_TYPE_DEFAULT, "[WARNING] We think this is a meta only update but it isn't (%llu)!\n latest-version: %@\n current-verions: %@%@", (uint8_t *)&v35, 0x2Au);

    }
    goto LABEL_28;
  }
  -[BRCVersion editedSinceShared](self->_currentVersion, "editedSinceShared");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "BOOLValue");

  if ((v12 & 1) != 0)
  {
    v13 = 1;
    goto LABEL_19;
  }
  if (-[BRCLocalItem isSharedToMe](self, "isSharedToMe") || -[BRCLocalItem isSharedByMe](self, "isSharedByMe"))
  {
    -[BRCVersion ckInfo](self->_currentVersion, "ckInfo");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "etag");
    v15 = objc_claimAutoreleasedReturnValue();
    v13 = v15 != 0;
    if (!v15)
    {
LABEL_15:

      goto LABEL_19;
    }
    v16 = (void *)v15;
    v17 = -[BRCDocumentItem diffAgainstServerItem:](self, "diffAgainstServerItem:", v6) & 0x1A0000;

    if (v17)
    {
      brc_bread_crumbs();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        -[BRCDocumentItem updateVersionMetadataFromServerItem:preventVersionDiffs:].cold.1();

      goto LABEL_15;
    }
  }
  v13 = 0;
LABEL_19:
  -[BRCLocalVersion uploadError](self->_currentVersion, "uploadError");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(v6, "latestVersion");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "originalPOSIXName");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (void *)objc_msgSend(v24, "copy");
    -[BRCVersion setOriginalPOSIXName:](self->_currentVersion, "setOriginalPOSIXName:", v25);

  }
  else
  {
    v26 = [BRCLocalVersion alloc];
    objc_msgSend(v6, "latestVersion");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = -[BRCLocalVersion initWithServerVersion:](v26, "initWithServerVersion:", v23);
    v24 = self->_currentVersion;
    self->_currentVersion = v27;
  }

  if (v13)
    -[BRCVersion setEditedSinceShared:](self->_currentVersion, "setEditedSinceShared:", MEMORY[0x1E0C9AAB0]);
  if (objc_msgSend(v19, "br_isCloudDocsErrorCode:", 43))
    -[BRCLocalVersion setUploadError:](self->_currentVersion, "setUploadError:", v19);
  if (v4)
  {
    v28 = self->_currentVersion;
    orig = self->super._orig;
    v30 = v28;
    isa = orig[1].super.isa;
    orig[1].super.isa = (Class)v30;
LABEL_28:

  }
}

- (void)markItemForgottenByServer
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BRCDocumentItem;
  -[BRCLocalItem markItemForgottenByServer](&v3, sel_markItemForgottenByServer);
  -[BRCVersion setCkInfo:](self->_currentVersion, "setCkInfo:", 0);
}

- (void)forceiWorkConflictEtag:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  int v8;
  BRCDocumentItem *v9;
  __int16 v10;
  id v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  brc_bread_crumbs();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v8 = 138412802;
    v9 = self;
    v10 = 2112;
    v11 = v4;
    v12 = 2112;
    v13 = v5;
    _os_log_debug_impl(&dword_1CBD43000, v6, OS_LOG_TYPE_DEBUG, "[DEBUG] forcing iwork conflict etag on %@ to be %@%@", (uint8_t *)&v8, 0x20u);
  }

  -[BRCDocumentItem markNeedsReading](self, "markNeedsReading");
  -[BRCVersion ckInfo](self->_currentVersion, "ckInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setEtag:", v4);

  self->super._localDiffs |= 0x4000000000000000uLL;
}

- (void)forceVersionConflictByClearkingCKInfo
{
  -[BRCVersion setCkInfo:](self->_currentVersion, "setCkInfo:", 0);
}

- (void)forceiWorkSharingInfoResend
{
  self->super._localDiffs |= 0x800000000000000uLL;
  -[BRCDocumentItem markNeedsReading](self, "markNeedsReading");
}

- (void)appDidResolveConflictLoserWithEtag:(id)a3
{
  id v4;
  uint64_t v5;
  BRCPQLConnection *db;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  if (-[BRCPQLConnection isBatchSuspended](self->super._db, "isBatchSuspended"))
    v5 = 4;
  else
    v5 = 20;
  db = self->super._db;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __54__BRCDocumentItem_appDidResolveConflictLoserWithEtag___block_invoke;
  v8[3] = &unk_1E875D8F0;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  -[BRCPQLConnection performWithFlags:action:](db, "performWithFlags:action:", v5, v8);

}

uint64_t __54__BRCDocumentItem_appDidResolveConflictLoserWithEtag___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  void *v3;
  int v4;
  void *v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;

  v2 = (_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "removeLiveConflictLoserEtag:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(*(v2 - 1) + 200), "conflictLoserEtags");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "containsObject:", *v2);

  if (v4)
  {
    brc_bread_crumbs();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      __54__BRCDocumentItem_appDidResolveConflictLoserWithEtag___block_invoke_cold_1();

    objc_msgSend(*(id *)(a1 + 32), "addResolvedConflictLoserEtag:", *(_QWORD *)(a1 + 40));
    if ((objc_msgSend(*(id *)(a1 + 32), "needsReading") & 1) == 0)
      objc_msgSend(*(id *)(a1 + 32), "markNeedsReading");
  }
  else
  {
    brc_bread_crumbs();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      __54__BRCDocumentItem_appDidResolveConflictLoserWithEtag___block_invoke_cold_2();

  }
  return objc_msgSend(*(id *)(a1 + 32), "saveToDB");
}

- (void)markDead
{
  BRCLocalVersion *v3;
  void *v4;
  void *v5;
  BRCLocalVersion *currentVersion;
  BRCLocalVersion *v7;
  NSMutableSet *liveConflictLoserEtags;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)BRCDocumentItem;
  -[BRCLocalItem markDead](&v10, sel_markDead);
  if (-[BRCDocumentItem isDocumentBeingCopiedToNewZone](self, "isDocumentBeingCopiedToNewZone"))
    -[BRCDocumentItem _insertTombstoneForPreviousZoneGlobalID](self, "_insertTombstoneForPreviousZoneGlobalID");
  v3 = -[BRCLocalVersion initForPackage:]([BRCLocalVersion alloc], "initForPackage:", -[BRCVersion isPackage](self->_currentVersion, "isPackage"));
  -[BRCVersion originalPOSIXName](self->_currentVersion, "originalPOSIXName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCVersion setOriginalPOSIXName:](v3, "setOriginalPOSIXName:", v4);

  -[BRCVersion ckInfo](self->_currentVersion, "ckInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCVersion setCkInfo:](v3, "setCkInfo:", v5);

  currentVersion = self->_currentVersion;
  self->_currentVersion = v3;
  v7 = v3;

  liveConflictLoserEtags = self->_liveConflictLoserEtags;
  self->_liveConflictLoserEtags = 0;

  -[BRCAccountSession fsDownloader](self->super._session, "fsDownloader");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "cancelAndCleanupItemDownloads:", self);
}

- (void)markNeedsReading
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: self.isOnDisk%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)markLatestSyncRequestRejectedInZone:(id)a3
{
  id v4;
  unint64_t localDiffs;
  void *v6;
  int v7;
  void *v8;
  NSObject *v9;
  objc_super v10;

  v4 = a3;
  localDiffs = self->super._localDiffs;
  if ((-[BRCLocalItem metadataSyncUpMask:](self, "metadataSyncUpMask:", 0) & localDiffs) == 0)
    -[BRCLocalVersion setUploadedAssets:](self->_currentVersion, "setUploadedAssets:", 0);
  v10.receiver = self;
  v10.super_class = (Class)BRCDocumentItem;
  -[BRCLocalItem markLatestSyncRequestRejectedInZone:](&v10, sel_markLatestSyncRequestRejectedInZone_, v4);
  if (self->super._syncUpState != 1)
    -[BRCDocumentItem markForceUpload](self, "markForceUpload");
  if (-[BRCDocumentItem isDocumentBeingCopiedToNewZone](self, "isDocumentBeingCopiedToNewZone"))
  {
    -[BRCClientZone dbRowID](self->super._clientZone, "dbRowID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v4, "br_isEqualToNumber:", v6);

    if (v7)
    {
      brc_bread_crumbs();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        -[BRCDocumentItem markLatestSyncRequestRejectedInZone:].cold.1();

      -[BRCDocumentItem _insertTombstoneForPreviousZoneGlobalID](self, "_insertTombstoneForPreviousZoneGlobalID");
    }
  }

}

- (BOOL)markLatestSyncRequestAcknowledgedInZone:(id)a3
{
  id v4;
  _BOOL4 v5;
  NSMutableSet *resolvedConflictLoserEtags;
  void *v7;
  int v8;
  void *v9;
  NSObject *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)BRCDocumentItem;
  v5 = -[BRCLocalItem markLatestSyncRequestAcknowledgedInZone:](&v12, sel_markLatestSyncRequestAcknowledgedInZone_, v4);
  if (v5)
  {
    resolvedConflictLoserEtags = self->_resolvedConflictLoserEtags;
    self->_resolvedConflictLoserEtags = 0;

    if ((self->super._localDiffs & 0x1FE0000) == 0
      || -[BRCDocumentItem isPausedFromSync](self, "isPausedFromSync") && (self->super._localDiffs & 0x40000) == 0)
    {
      -[BRCLocalVersion setUploadedAssets:](self->_currentVersion, "setUploadedAssets:", 0);
    }
    if (-[BRCDocumentItem isDocumentBeingCopiedToNewZone](self, "isDocumentBeingCopiedToNewZone"))
    {
      -[BRCClientZone dbRowID](self->super._clientZone, "dbRowID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v4, "br_isEqualToNumber:", v7);

      if (v8)
      {
        brc_bread_crumbs();
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
          -[BRCDocumentItem markLatestSyncRequestRejectedInZone:].cold.1();

        -[BRCDocumentItem _insertTombstoneForPreviousZoneGlobalID](self, "_insertTombstoneForPreviousZoneGlobalID");
      }
    }
  }

  return v5;
}

- (void)handleUnknownItemError
{
  objc_super v3;

  -[BRCVersion setCkInfo:](self->_currentVersion, "setCkInfo:", 0);
  v3.receiver = self;
  v3.super_class = (Class)BRCDocumentItem;
  -[BRCLocalItem handleUnknownItemError](&v3, sel_handleUnknownItemError);
}

- (void)markForceUpload
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] UNREACHABLE: trying to force upload of a fault%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)markForceNeedsSyncUp
{
  void *v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  objc_super v7;
  uint64_t v8[3];
  uint8_t buf[4];
  uint64_t v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  memset(v8, 0, sizeof(v8));
  __brc_create_section(0, (uint64_t)"-[BRCDocumentItem markForceNeedsSyncUp]", 1212, v8);
  brc_bread_crumbs();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = v8[0];
    -[BRCLocalItem itemID](self, "itemID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218498;
    v10 = v5;
    v11 = 2112;
    v12 = v6;
    v13 = 2112;
    v14 = v3;
    _os_log_debug_impl(&dword_1CBD43000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx marking force needs-syncup: %@%@", buf, 0x20u);

  }
  if (-[BRCDocumentItem isFault](self, "isFault"))
  {
    v7.receiver = self;
    v7.super_class = (Class)BRCDocumentItem;
    -[BRCLocalItem markForceNeedsSyncUp](&v7, sel_markForceNeedsSyncUp);
  }
  else
  {
    -[BRCDocumentItem markNeedsReading](self, "markNeedsReading");
  }
  __brc_leave_section(v8);
}

- (void)markUploadedWithRecord:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  _BOOL4 v7;
  __CFString **v8;
  void *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  void *v17;
  _BOOL4 v18;
  void *v19;
  BOOL v20;
  void *v21;
  BOOL v22;
  void *v23;
  BOOL v24;
  void *v25;
  NSObject *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  NSObject *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  int64_t v34;
  void *v35;
  NSObject *v36;
  void *v37;
  NSObject *v38;
  void *v39;
  NSObject *v40;
  void *v41;
  NSObject *v42;
  void *v43;
  NSObject *v44;
  void *v45;
  NSObject *v46;
  NSObject *v47;
  NSObject *v48;
  NSObject *v49;
  uint64_t v50[3];
  uint8_t buf[4];
  BRCDocumentItem *v52;
  __int16 v53;
  int64_t v54;
  __int16 v55;
  void *v56;
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  memset(v50, 0, sizeof(v50));
  __brc_create_section(0, (uint64_t)"-[BRCDocumentItem markUploadedWithRecord:]", 1230, v50);
  brc_bread_crumbs();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v31 = v50[0];
    -[BRCLocalItem itemID](self, "itemID");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218498;
    v52 = (BRCDocumentItem *)v31;
    v53 = 2112;
    v54 = (int64_t)v32;
    v55 = 2112;
    v56 = v5;
    _os_log_debug_impl(&dword_1CBD43000, v6, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx marking uploaded %@%@", buf, 0x20u);

  }
  if (self->super._syncUpState == 3)
  {
    if (!v4)
    {
      brc_bread_crumbs();
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_FAULT))
        -[BRCDocumentItem markUploadedWithRecord:].cold.10();

    }
    v7 = -[BRCLocalItem isFinderBookmark](self, "isFinderBookmark");
    v8 = kBRRecordKeyFinderBookmarkContent;
    if (!v7)
      v8 = kBRRecordKeyFileContent;
    objc_msgSend(v4, "objectForKeyedSubscript:", *v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("pkgSignature"));
    v49 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("thumb1024"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_msgSend(v9, "signature");
      v11 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = v49;
    }
    v12 = v11;
    objc_msgSend(v10, "signature");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      if (self->_currentVersion)
      {
        if ((objc_msgSend(v9, "isRereferencedAssetUpload") & 1) != 0)
          goto LABEL_14;
        v14 = objc_msgSend(v9, "size");
        if (v14 == -[BRCVersion size](self->_currentVersion, "size"))
          goto LABEL_14;
        brc_bread_crumbs();
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT))
        {
          v33 = objc_msgSend(v9, "size");
          v34 = -[BRCVersion size](self->_currentVersion, "size");
          *(_DWORD *)buf = 134218498;
          v52 = (BRCDocumentItem *)v33;
          v53 = 2048;
          v54 = v34;
          v55 = 2112;
          v56 = v27;
          _os_log_fault_impl(&dword_1CBD43000, v28, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: CK disagrees on the item size: %lld != %lld%@", buf, 0x20u);
        }
      }
      else
      {
        brc_bread_crumbs();
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT))
        {
          -[BRCLocalItem itemID](self, "itemID");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          -[BRCDocumentItem markUploadedWithRecord:].cold.1(v29, (uint64_t)v27, (uint64_t)buf, v28);
        }
      }

      -[BRCDocumentItem markNeedsReading](self, "markNeedsReading");
LABEL_37:

      v30 = v49;
      goto LABEL_38;
    }
LABEL_14:
    brc_bread_crumbs();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412802;
      v52 = self;
      v53 = 2112;
      v54 = (int64_t)v12;
      v55 = 2112;
      v56 = v15;
      _os_log_debug_impl(&dword_1CBD43000, v16, OS_LOG_TYPE_DEBUG, "[DEBUG] marking uploaded %@, signature:%@%@", buf, 0x20u);
    }

    if ((v9 != 0) == (v49 != 0))
    {
      brc_bread_crumbs();
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v38 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_FAULT))
        -[BRCDocumentItem markUploadedWithRecord:].cold.9();

    }
    if (!v12)
    {
      brc_bread_crumbs();
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v40 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_FAULT))
        -[BRCDocumentItem markUploadedWithRecord:].cold.8();

    }
    if (!self->_currentVersion)
    {
      brc_bread_crumbs();
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v42 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_FAULT))
        -[BRCDocumentItem markUploadedWithRecord:].cold.7();

    }
    -[BRCLocalStatInfo documentID](self->super._st, "documentID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17 == 0;

    if (v18)
    {
      brc_bread_crumbs();
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v44 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_FAULT))
        -[BRCDocumentItem markUploadedWithRecord:].cold.6();

    }
    -[BRCVersion contentSignature](self->_currentVersion, "contentSignature");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v19, "brc_signatureIsPendingPlaceHolder") & 1) == 0)
    {
      v20 = -[BRCDocumentItem isDocumentBeingCopiedToNewZone](self, "isDocumentBeingCopiedToNewZone");

      if (v20)
      {
LABEL_23:
        -[BRCVersion thumbnailSignature](self->_currentVersion, "thumbnailSignature");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v21, "brc_signatureIsPendingPlaceHolder") & 1) == 0)
        {
          v22 = -[BRCDocumentItem isDocumentBeingCopiedToNewZone](self, "isDocumentBeingCopiedToNewZone");

          if (v22)
            goto LABEL_26;
          brc_bread_crumbs();
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v48 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v48, OS_LOG_TYPE_FAULT))
            -[BRCDocumentItem markUploadedWithRecord:].cold.4();

        }
LABEL_26:
        -[BRCLocalVersion uploadedAssets](self->_currentVersion, "uploadedAssets");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = v23 == 0;

        if (!v24)
        {
          brc_bread_crumbs();
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v46 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v46, OS_LOG_TYPE_FAULT))
            -[BRCDocumentItem markUploadedWithRecord:].cold.3();

        }
        -[BRCLocalVersion setUploadError:](self->_currentVersion, "setUploadError:", 0);
        -[BRCVersion setContentSignature:](self->_currentVersion, "setContentSignature:", v12);
        -[BRCLocalVersion setUploadedAssets:](self->_currentVersion, "setUploadedAssets:", v4);
        -[BRCVersion setThumbnailSignature:](self->_currentVersion, "setThumbnailSignature:", v13);
        -[BRCVersion setThumbnailSize:](self->_currentVersion, "setThumbnailSize:", objc_msgSend(v10, "size"));
        objc_storeStrong((id *)&self->_liveThumbnailSignature, v13);
        -[BRCLocalItem _markNeedsSyncingUp](self, "_markNeedsSyncingUp");
        if (!-[BRCLocalItem needsSyncUp](self, "needsSyncUp"))
          -[BRCLocalVersion setUploadedAssets:](self->_currentVersion, "setUploadedAssets:", 0);
        brc_bread_crumbs();
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
          -[BRCDocumentItem markUploadedWithRecord:].cold.2();

        goto LABEL_37;
      }
      brc_bread_crumbs();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v47 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_FAULT))
        -[BRCDocumentItem markUploadedWithRecord:].cold.5();

    }
    goto LABEL_23;
  }
  brc_bread_crumbs();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v30 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_FAULT))
    -[BRCDocumentItem markUploadedWithRecord:].cold.11();
LABEL_38:

  __brc_leave_section(v50);
}

- (void)markNeedsUploadOrSyncingUp
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: self.needsUpload%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)markOverQuotaWithError:(id)a3
{
  BRCLocalVersion *currentVersion;
  id v5;

  currentVersion = self->_currentVersion;
  v5 = a3;
  -[BRCLocalVersion _clearSignatures:isPackage:](currentVersion, "_clearSignatures:isPackage:", 3, -[BRCVersion isPackage](currentVersion, "isPackage"));
  self->super._syncUpState = 3;
  -[BRCLocalVersion setUploadError:](self->_currentVersion, "setUploadError:", v5);

}

- (void)_markAsDeadTombstoneWithPreviousGlobalID
{
  void *v3;
  void *v4;
  objc_super v5;

  -[BRCLocalVersion previousItemGlobalID](self->_currentVersion, "previousItemGlobalID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCLocalVersion setPreviousItemGlobalID:](self->_currentVersion, "setPreviousItemGlobalID:", 0);
  -[BRCVersion ckInfo](self->_currentVersion, "ckInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "revertEtagsForOldZoneTombstone");

  v5.receiver = self;
  v5.super_class = (Class)BRCDocumentItem;
  -[BRCLocalItem _markAsDeadTombstoneWithPreviousGlobalID:](&v5, sel__markAsDeadTombstoneWithPreviousGlobalID_, v3);

}

- (void)_insertTombstoneForPreviousZoneGlobalID
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  int v16;
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if ((-[BRCPQLConnection isBatchSuspended](self->super._db, "isBatchSuspended") & 1) == 0)
  {
    brc_bread_crumbs();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
      -[BRCLocalItem createSyncUpJob].cold.7();

  }
  v3 = (void *)-[BRCDocumentItem copy](self, "copy");
  objc_msgSend(v3, "_markAsDeadTombstoneWithPreviousGlobalID");
  objc_msgSend(v3, "markNeedsUploadOrSyncingUp");
  objc_msgSend(v3, "clientZone");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "itemID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "existsByItemID:", v5);

  if (v6)
  {
    brc_bread_crumbs();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v3, "itemGlobalID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138412546;
      v17 = v9;
      v18 = 2112;
      v19 = v7;
      _os_log_impl(&dword_1CBD43000, v8, OS_LOG_TYPE_DEFAULT, "[WARNING] Not inserting dead tombstone because the item was already revived for %@%@", (uint8_t *)&v16, 0x16u);

    }
  }
  else
  {
    objc_msgSend(v3, "saveToDB");
  }
  -[BRCAccountSession applyScheduler](self->super._session, "applyScheduler");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "serverZone");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "rescheduleSuspendedJobsMatching:inState:", v11, 17);

  -[BRCLocalVersion setPreviousItemGlobalID:](self->_currentVersion, "setPreviousItemGlobalID:", 0);
  -[BRCStatInfo ckInfo](self->super._st, "ckInfo");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "clearCrossZoneMoveEtag");

  -[BRCVersion ckInfo](self->_currentVersion, "ckInfo");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "clearCrossZoneMoveEtag");

}

- (BOOL)supportsServerSideAssetCopies
{
  unint64_t localDiffs;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  _BOOL8 v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  BRCDocumentItem *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  localDiffs = self->super._localDiffs;
  if ((localDiffs & 0x180000) == 0)
  {
    -[BRCVersion contentSignature](self->_currentVersion, "contentSignature");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "brc_signatureIsValid");

    if ((v5 & 1) != 0)
    {
      -[BRCClientZone mangledID](self->super._clientZone, "mangledID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      LOBYTE(v6) = objc_msgSend(v7, "supportsServerSideAssetCopies");
      return (char)v6;
    }
    localDiffs = self->super._localDiffs;
  }
  -[BRCVersion contentSignature](self->_currentVersion, "contentSignature");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[BRCVersion contentSignature](self->_currentVersion, "contentSignature");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "brc_signatureIsValid");

  brc_bread_crumbs();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    v14 = v9 != 0;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", (localDiffs & 0x180000) != 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v11);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 138413314;
    v19 = v15;
    v20 = 2112;
    v21 = v16;
    v22 = 2112;
    v23 = v17;
    v24 = 2112;
    v25 = self;
    v26 = 2112;
    v27 = v12;
    _os_log_debug_impl(&dword_1CBD43000, v13, OS_LOG_TYPE_DEBUG, "[DEBUG] skip supportsServerSideAssetCopies: has local diffs [%@], content signature [%@] valid [%@] --> NO\n item: %@%@", (uint8_t *)&v18, 0x34u);

  }
  return 0;
}

- (void)markCrossZoneMovedForServerAssetCopyWithParentItem:(id)a3 path:(id)a4
{
  id v6;
  void *v7;
  BRCAccountSession *session;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  BRCZoneRowID *v14;
  BRCZoneRowID *parentZoneRowID;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  uint64_t v24;
  BRCDocumentItem *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  NSObject *v39;
  void *v40;
  void *v41;
  NSObject *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  BRCDocumentItem *v47;
  void *v48;
  NSObject *v49;
  void *v50;
  NSObject *v51;
  void *v52;
  uint64_t v53;
  id v54;
  void *v55;
  uint8_t buf[4];
  BRCDocumentItem *v57;
  __int16 v58;
  id v59;
  __int16 v60;
  void *v61;
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v54 = a4;
  if (!v6)
  {
    brc_bread_crumbs();
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v49 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v49, OS_LOG_TYPE_FAULT))
      -[BRCDocumentItem markCrossZoneMovedForServerAssetCopyWithParentItem:path:].cold.2();

  }
  if (!-[BRCDocumentItem supportsServerSideAssetCopies](self, "supportsServerSideAssetCopies"))
  {
    brc_bread_crumbs();
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v51 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v51, OS_LOG_TYPE_FAULT))
      -[BRCDocumentItem markCrossZoneMovedForServerAssetCopyWithParentItem:path:].cold.1();

  }
  -[BRCLocalItem itemGlobalID](self, "itemGlobalID");
  v53 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "itemGlobalID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  session = self->super._session;
  objc_msgSend(v7, "zoneRowID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCAccountSession serverZoneByRowID:](session, "serverZoneByRowID:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "clientZone");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[BRCLocalVersion previousItemGlobalID](self->_currentVersion, "previousItemGlobalID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "itemID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCStatInfo setParentID:](self->super._st, "setParentID:", v13);

  v52 = v7;
  objc_msgSend(v7, "zoneRowID");
  v14 = (BRCZoneRowID *)objc_claimAutoreleasedReturnValue();
  parentZoneRowID = self->super._parentZoneRowID;
  self->super._parentZoneRowID = v14;

  objc_storeStrong((id *)&self->super._clientZone, v11);
  self->super._serverZone = (BRCServerZone *)(id)objc_msgSend(v11, "serverZone");
  self->super._orig->_syncUpState = 0;
  v55 = v6;
  if (v12)
  {
    objc_msgSend(v12, "zoneRowID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "dbRowID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v16, "br_isEqualToNumber:", v17);

    if (v18)
    {
      objc_msgSend(v12, "itemID");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "serverItemByItemID:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      brc_bread_crumbs();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412802;
        v57 = self;
        v58 = 2112;
        v59 = v20;
        v60 = 2112;
        v61 = v21;
        _os_log_impl(&dword_1CBD43000, v22, OS_LOG_TYPE_DEFAULT, "[WARNING] Item moved back into its original zone %@ si: %@%@", buf, 0x20u);
      }

      -[BRCLocalVersion setPreviousItemGlobalID:](self->_currentVersion, "setPreviousItemGlobalID:", 0);
      -[BRCAccountSession syncUpScheduler](self->super._session, "syncUpScheduler");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "inFlightDiffsForItem:", self);

      if (v24)
      {
        brc_bread_crumbs();
        v25 = (BRCDocumentItem *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v57 = v25;
          _os_log_impl(&dword_1CBD43000, v26, OS_LOG_TYPE_DEFAULT, "[WARNING] Item has in-flight diffs in the current zone. We need to be sure to insert a tombstone%@", buf, 0xCu);
        }

        v27 = (void *)-[BRCDocumentItem copy](self, "copy");
        objc_msgSend(v27, "currentVersion");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "ckInfo");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "clearCrossZoneMoveEtag");

        objc_msgSend(v27, "st");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "ckInfo");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "clearCrossZoneMoveEtag");

        -[BRCLocalItem itemGlobalID](self->super._orig, "itemGlobalID");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "_restorePreviousGlobalID:", v32);

        objc_msgSend(v27, "markDead");
        objc_msgSend(v27, "markNeedsUploadOrSyncingUp");
      }
      else
      {
        v27 = 0;
      }
      -[BRCStatInfo ckInfo](self->super._st, "ckInfo");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "revertEtagsForOldZoneTombstone");

      -[BRCVersion ckInfo](self->_currentVersion, "ckInfo");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "revertEtagsForOldZoneTombstone");

      objc_msgSend(v12, "itemID");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = v54;
      -[BRCDocumentItem learnItemID:serverItem:path:markLost:](self, "learnItemID:serverItem:path:markLost:", v46, v20, v54, 0);

      -[BRCDocumentItem markNeedsUploadOrSyncingUp](self, "markNeedsUploadOrSyncingUp");
      v43 = v27;
      v36 = (void *)v53;
      if (!v24)
        goto LABEL_21;
LABEL_20:
      -[BRCLocalItem saveToDB](self, "saveToDB");
      objc_msgSend(v27, "saveToDB");
      v43 = v27;
      goto LABEL_21;
    }
    brc_bread_crumbs();
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v39 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v57 = self;
      v58 = 2112;
      v59 = v38;
      _os_log_impl(&dword_1CBD43000, v39, OS_LOG_TYPE_DEFAULT, "[WARNING] Item already has a previous zone so ignore the existing zone for %@%@", buf, 0x16u);
    }

    v36 = (void *)v53;
    v35 = v54;
  }
  else
  {
    brc_bread_crumbs();
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v34 = objc_claimAutoreleasedReturnValue();
    v35 = v54;
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      v57 = self;
      v58 = 2112;
      v59 = v11;
      v60 = 2112;
      v61 = v33;
      _os_log_impl(&dword_1CBD43000, v34, OS_LOG_TYPE_DEFAULT, "[WARNING] Item %@ moved into new zone which supports server side asset copies %@%@", buf, 0x20u);
    }

    v36 = (void *)v53;
    -[BRCLocalVersion setPreviousItemGlobalID:](self->_currentVersion, "setPreviousItemGlobalID:", v53);
    -[BRCStatInfo ckInfo](self->super._st, "ckInfo");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "markCrossZoneMoved");

    -[BRCVersion ckInfo](self->_currentVersion, "ckInfo");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "markCrossZoneMoved");
  }

  v40 = (void *)objc_opt_new();
  -[BRCDocumentItem learnItemID:serverItem:path:markLost:](self, "learnItemID:serverItem:path:markLost:", v40, 0, v35, 0);

  self->super._sharingOptions = objc_msgSend(v6, "sharingOptions") & 0x78;
  brc_bread_crumbs();
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v42 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
  {
    BRCPrettyPrintBitmap();
    v47 = (BRCDocumentItem *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v57 = v47;
    v58 = 2112;
    v59 = v6;
    v60 = 2112;
    v61 = v41;
    _os_log_debug_impl(&dword_1CBD43000, v42, OS_LOG_TYPE_DEBUG, "[DEBUG] learning sharing options %@ from parent %@%@", buf, 0x20u);

  }
  -[BRCDocumentItem markNeedsUploadOrSyncingUp](self, "markNeedsUploadOrSyncingUp");
  v27 = 0;
  v43 = 0;
  if (!v12)
    goto LABEL_20;
LABEL_21:

}

- (BOOL)contentRecordNeedsForceAllFieldsWhenDeadInServerTruth:(BOOL)a3
{
  int v5;
  _BOOL4 v6;
  unint64_t localDiffs;
  BOOL v8;
  void *v10;
  void *v11;

  if (-[BRCDocumentItem isPausedFromSync](self, "isPausedFromSync"))
  {
    v5 = 0x40000;
    if (a3)
      return 1;
  }
  else
  {
    v6 = -[BRCDocumentItem isResumingSync](self, "isResumingSync");
    v5 = 67043328;
    if (v6)
      v5 = 0x40000;
    if (a3)
      return 1;
  }
  localDiffs = self->super._localDiffs;
  if ((v5 & localDiffs & 0x800000) == 0 && (v5 & localDiffs & 0x100000) == 0)
  {
    -[BRCVersion ckInfo](self->_currentVersion, "ckInfo");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "etag");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v11 == 0;

    return v8;
  }
  return 1;
}

- (NSDictionary)conflictLoserState
{
  uint64_t v3;
  void *v4;
  NSMutableSet *liveConflictLoserEtags;
  NSMutableSet *resolvedConflictLoserEtags;
  void *v7;
  NSMutableSet **v8;
  const __CFString **v9;
  uint64_t v10;
  NSMutableSet *v11;
  const __CFString *v13;
  NSMutableSet *v14;
  const __CFString *v15;
  NSMutableSet *v16;
  _QWORD v17[2];
  _QWORD v18[3];

  v18[2] = *MEMORY[0x1E0C80C00];
  v3 = -[NSMutableSet count](self->_liveConflictLoserEtags, "count");
  v4 = (void *)-[NSMutableSet count](self->_resolvedConflictLoserEtags, "count");
  if (v3)
  {
    if (v4)
    {
      liveConflictLoserEtags = self->_liveConflictLoserEtags;
      v17[0] = CFSTR("l");
      v17[1] = CFSTR("r");
      resolvedConflictLoserEtags = self->_resolvedConflictLoserEtags;
      v18[0] = liveConflictLoserEtags;
      v18[1] = resolvedConflictLoserEtags;
      v7 = (void *)MEMORY[0x1E0C99D80];
      v8 = (NSMutableSet **)v18;
      v9 = (const __CFString **)v17;
      v10 = 2;
LABEL_8:
      objc_msgSend(v7, "dictionaryWithObjects:forKeys:count:", v8, v9, v10);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      return (NSDictionary *)v4;
    }
    v15 = CFSTR("l");
    v16 = self->_liveConflictLoserEtags;
    v7 = (void *)MEMORY[0x1E0C99D80];
    v8 = &v16;
    v9 = &v15;
LABEL_7:
    v10 = 1;
    goto LABEL_8;
  }
  if (v4)
  {
    v11 = self->_resolvedConflictLoserEtags;
    v13 = CFSTR("r");
    v14 = v11;
    v7 = (void *)MEMORY[0x1E0C99D80];
    v8 = &v14;
    v9 = &v13;
    goto LABEL_7;
  }
  return (NSDictionary *)v4;
}

- (void)addResolvedConflictLoserEtag:(id)a3
{
  NSMutableSet *resolvedConflictLoserEtags;
  NSMutableSet *v4;
  objc_class *v6;
  id v7;
  NSMutableSet *v8;
  NSMutableSet *v9;

  resolvedConflictLoserEtags = self->_resolvedConflictLoserEtags;
  if (resolvedConflictLoserEtags)
  {
    v9 = (NSMutableSet *)a3;
    -[NSMutableSet addObject:](resolvedConflictLoserEtags, "addObject:", v9);
    v4 = v9;
  }
  else
  {
    v6 = (objc_class *)MEMORY[0x1E0C99E20];
    v7 = a3;
    v8 = (NSMutableSet *)objc_msgSend([v6 alloc], "initWithObjects:", v7, 0);

    v4 = self->_resolvedConflictLoserEtags;
    self->_resolvedConflictLoserEtags = v8;
  }

}

- (void)_updateUploadJobIfNeededWithDiffs:(unint64_t)a3
{
  BRCClientZone *clientZone;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  unsigned int syncUpState;
  void *v15;
  _BOOL4 v16;
  _BOOL4 v17;
  BOOL v18;
  void *v19;
  NSObject *v20;
  void *v21;
  NSObject *v22;
  uint64_t v23[3];

  if (self->super._syncUpState == 3
    && (-[BRCLocalVersion shouldRecreateUploadJobGivenDiffs:](self->_currentVersion, "shouldRecreateUploadJobGivenDiffs:", a3)|| (clientZone = self->super._clientZone, -[BRCLocalItem clientZone](self->super._orig, "clientZone"), v6 = (void *)objc_claimAutoreleasedReturnValue(), LOBYTE(clientZone) = -[BRCClientZone isEqualToClientZone:](clientZone, "isEqualToClientZone:", v6), v6, (clientZone & 1) == 0)))
  {
    -[BRCAccountSession fsUploader](self->super._session, "fsUploader");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "cancelAndCleanupItemUpload:", self);

  }
  else if ((a3 & 0x20000000000000) == 0)
  {
    return;
  }
  memset(v23, 0, sizeof(v23));
  __brc_create_section(0, (uint64_t)"-[BRCDocumentItem _updateUploadJobIfNeededWithDiffs:]", 1667, v23);
  brc_bread_crumbs();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    -[BRCDocumentItem _updateUploadJobIfNeededWithDiffs:].cold.3();

  if ((-[BRCPQLConnection isBatchSuspended](self->super._db, "isBatchSuspended") & 1) == 0)
  {
    brc_bread_crumbs();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
      -[BRCLocalItem createSyncUpJob].cold.7();

  }
  -[BRCAccountSession syncUpScheduler](self->super._session, "syncUpScheduler");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCLocalItem serverZone](self, "serverZone");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "dbRowID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v10, "isItemInSyncUpAndInFlight:inZone:", self, v12);

  syncUpState = self->super._syncUpState;
  if (syncUpState == 3)
  {
    v16 = -[BRCDocumentItem isFault](self, "isFault");
    v17 = -[BRCLocalItem isDead](self, "isDead");
    if (v17 || !v16)
      v18 = !v17;
    else
      v18 = -[BRCDocumentItem isDocumentBeingCopiedToNewZone](self, "isDocumentBeingCopiedToNewZone");
    if (!v18)
    {
      brc_bread_crumbs();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
        -[BRCDocumentItem _updateUploadJobIfNeededWithDiffs:].cold.1();

    }
    -[BRCAccountSession fsUploader](self->super._session, "fsUploader");
    if (v13)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setState:forItem:", 31, self);
    }
    else
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "uploadItem:", self);
    }
  }
  else if (syncUpState == 4)
  {
    -[BRCAccountSession fsUploader](self->super._session, "fsUploader");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setState:forItem:", 31, self);
  }
  else
  {
    -[BRCAccountSession fsUploader](self->super._session, "fsUploader");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "cancelAndCleanupItemUpload:", self);
  }

  __brc_leave_section(v23);
}

- (void)_updateReadThrottleIfNeededForRowID:(unint64_t)a3 forCreation:(BOOL)a4
{
  uint64_t v5;
  void *v6;
  void *v7;
  NSObject *v8;
  id v9;

  if (self->super._syncUpState == 2)
  {
    if (-[BRCLocalItem isLost](self, "isLost", a3, a4))
      v5 = 10;
    else
      v5 = 1;
    -[BRCAccountSession(LegacyAdditions) fsReader](self->super._session, "fsReader");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "createReadingJobForItem:state:", self, v5);

    if ((-[BRCPQLConnection isBatchSuspended](self->super._db, "isBatchSuspended") & 1) == 0)
    {
      brc_bread_crumbs();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
        -[BRCLocalItem createSyncUpJob].cold.7();

    }
  }
  else
  {
    -[BRCAccountSession(LegacyAdditions) fsReader](self->super._session, "fsReader", a3, a4);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setState:forItem:", 0, self);

  }
}

- (BOOL)_nukePackageItemsFromDB:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  BOOL v10;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[BRCLocalItem orig](self, "orig");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "st");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "documentID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    if (!objc_msgSend(v4, "execute:", CFSTR("DELETE FROM client_pkg_items WHERE item_doc_id = %@"), v7))
    {
      v10 = 0;
      goto LABEL_9;
    }
    if (objc_msgSend(v4, "changes") >= 1)
    {
      brc_bread_crumbs();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        v12 = objc_msgSend(v4, "changes");
        -[BRCLocalItem st](self, "st");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "documentID");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218498;
        v18 = v12;
        v19 = 2112;
        v20 = v14;
        v21 = 2112;
        v22 = v8;
        _os_log_debug_impl(&dword_1CBD43000, v9, OS_LOG_TYPE_DEBUG, "[DEBUG] removed %lld items in pkg [%@]%@", buf, 0x20u);

      }
      if ((-[BRCPQLConnection isBatchSuspended](self->super._db, "isBatchSuspended") & 1) == 0)
      {
        brc_bread_crumbs();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
          -[BRCLocalItem createSyncUpJob].cold.7();

      }
    }
  }
  v10 = 1;
LABEL_9:

  return v10;
}

- (void)_updateRecursivePropertiesInDB:(id)a3 dbRowID:(unint64_t)a4 diffs:(unint64_t)a5
{
  id v8;
  void *v9;
  void *v10;
  NSObject *v11;
  unsigned int v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  _BOOL4 v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  _BOOL4 v33;
  void *v34;
  uint64_t v35;
  _BOOL4 v36;
  _BOOL8 v37;
  void *v38;
  unsigned int v39;
  uint64_t v40;
  _BOOL4 v41;
  uint64_t v42;
  _BOOL8 v43;
  void *v44;
  NSObject *v45;
  int v46;
  int v48;
  int v49;
  void *v50;
  BRCItemID *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  NSObject *v56;
  void *v57;
  NSObject *v58;
  BRCItemID *itemID;
  void *v60;
  NSObject *v61;
  _BOOL4 v62;
  _BOOL8 v63;
  _BOOL8 v64;
  _BOOL8 v65;
  uint64_t v66;
  uint64_t v67;
  _BOOL8 v68;
  uint64_t v69;
  _BOOL8 v70;
  uint64_t v71;
  uint64_t v72;
  _BOOL4 v73;
  _BOOL8 v74;
  uint64_t v75;
  uint64_t v76;
  unint64_t v77;
  void *v78;
  int64_t v79;
  uint64_t v80;
  uint8_t buf[4];
  BRCItemID *v82;
  __int16 v83;
  uint64_t v84;
  __int16 v85;
  _BOOL8 v86;
  __int16 v87;
  uint64_t v88;
  __int16 v89;
  uint64_t v90;
  __int16 v91;
  uint64_t v92;
  __int16 v93;
  _BOOL8 v94;
  __int16 v95;
  uint64_t v96;
  __int16 v97;
  _BOOL8 v98;
  __int16 v99;
  int64_t v100;
  __int16 v101;
  _BOOL8 v102;
  __int16 v103;
  uint64_t v104;
  __int16 v105;
  uint64_t v106;
  __int16 v107;
  _BOOL8 v108;
  __int16 v109;
  _BOOL8 v110;
  __int16 v111;
  uint64_t v112;
  __int16 v113;
  void *v114;
  uint64_t v115;

  v115 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  if ((objc_msgSend(v8, "isBatchSuspended") & 1) == 0)
  {
    brc_bread_crumbs();
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v61 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v61, OS_LOG_TYPE_FAULT))
      -[BRCDocumentItem _updateRecursivePropertiesInDB:dbRowID:diffs:].cold.4();

  }
  -[BRCLocalItem asDocument](self->super._orig, "asDocument");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[BRCLocalItem isReserved](self, "isReserved"))
  {
    if (!-[BRCLocalItem isReserved](self->super._orig, "isReserved"))
    {
      brc_bread_crumbs();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        -[BRCDocumentItem _updateRecursivePropertiesInDB:dbRowID:diffs:].cold.1();

      objc_msgSend(v8, "execute:", CFSTR("DELETE FROM item_recursive_properties WHERE item_rowid = %llu "), a4);
    }
  }
  else
  {
    if ((self->super._sharingOptions & 4) != 0
      || (-[BRCLocalItem sharingOptions](self->super._orig, "sharingOptions") & 4) != 0)
    {
      v12 = 1073741826;
    }
    else
    {
      v12 = 2;
    }
    if (((v12 | 0x32004000000000) & a5) != 0
      || (-[BRCLocalItem clientZone](self->super._orig, "clientZone"),
          v13 = (void *)objc_claimAutoreleasedReturnValue(),
          v14 = objc_msgSend(v13, "isEqualToClientZone:", self->super._clientZone),
          v13,
          (v14 & 1) == 0))
    {
      v73 = -[BRCDocumentItem isFault](self, "isFault");
      if (-[BRCDesiredVersion isFault](self->_desiredVersion, "isFault"))
        v72 = -[BRCDocumentItem isFault](self, "isFault") ^ 1;
      else
        v72 = 0;
      v77 = a4;
      if (-[BRCLocalItem needsUpload](self, "needsUpload"))
      {
        -[BRCDocumentItem currentVersion](self, "currentVersion");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v80 = objc_msgSend(v15, "size");

        v75 = 1;
      }
      else
      {
        v75 = 0;
        v80 = 0;
      }
      v78 = v9;
      if (-[BRCDesiredVersion wantsContent](self->_desiredVersion, "wantsContent")
        && (-[BRCLocalStatInfo stagedFileID](self->super._st, "stagedFileID"),
            v16 = (void *)objc_claimAutoreleasedReturnValue(),
            v16,
            !v16))
      {
        v79 = -[BRCVersion size](self->_desiredVersion, "size");
        v17 = 1;
      }
      else
      {
        v17 = 0;
        v79 = 0;
      }
      -[BRCLocalStatInfo stagedFileID](self->super._st, "stagedFileID");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (v18)
        v19 = 1;
      else
        v19 = v17;
      v71 = v19;
      v20 = -[BRCLocalItem needsSyncUp](self, "needsSyncUp");
      -[BRCLocalItem st](self->super._orig, "st");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "stagedFileID");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[BRCLocalStatInfo stagedFileID](self->super._st, "stagedFileID");
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      if (v22 == v23
        || (-[BRCLocalItem st](self->super._orig, "st"),
            v24 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend(v24, "stagedFileID"),
            v25 = (void *)objc_claimAutoreleasedReturnValue(),
            v25,
            v24,
            v25))
      {
        v26 = 0;
      }
      else
      {
        objc_msgSend(v78, "desiredVersion");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(v27, "size");

      }
      -[BRCLocalItem st](self->super._orig, "st");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "stagedFileID");
      v29 = objc_claimAutoreleasedReturnValue();
      if (v29)
      {
        v30 = (void *)v29;
        -[BRCLocalItem st](self, "st");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "stagedFileID");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v70 = v32 == 0;

      }
      else
      {

        v70 = 0;
      }
      v33 = -[BRCLocalItem needsUpload](self->super._orig, "needsUpload");
      if (v33 != -[BRCLocalItem needsUpload](self, "needsUpload")
        && -[BRCLocalItem needsUpload](self->super._orig, "needsUpload")
        && -[BRCLocalItem needsSyncUp](self, "needsSyncUp"))
      {
        objc_msgSend(v78, "currentVersion");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = objc_msgSend(v34, "size");

      }
      else
      {
        v35 = 0;
      }
      v36 = -[BRCLocalItem needsSyncUp](self->super._orig, "needsSyncUp");
      if (v36 == -[BRCLocalItem needsSyncUp](self, "needsSyncUp"))
        v69 = 0;
      else
        v69 = -[BRCLocalItem needsSyncUp](self->super._orig, "needsSyncUp");
      v37 = v73;
      v74 = v20;
      -[BRCDocumentItem uploadError](self, "uploadError");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = objc_msgSend(v38, "brc_isCloudKitOutOfQuota");

      v40 = v39;
      if ((self->super._sharingOptions & 4) != 0)
      {
        v41 = -[BRCServerZone isSharedZone](self->super._serverZone, "isSharedZone");
        v65 = !v41;
        v64 = v41;
      }
      else
      {
        v64 = 0;
        v65 = 0;
      }
      v62 = -[BRCLocalItem isAlmostDead](self, "isAlmostDead");
      v68 = v35 != 0;
      v42 = v75;
      if (v80)
        v42 = 1;
      v66 = v35;
      v67 = v42;
      v76 = v26;
      v43 = v26 != 0;
      brc_bread_crumbs();
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v45 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
      {
        itemID = self->super._itemID;
        *(_DWORD *)buf = 138416386;
        v82 = itemID;
        v83 = 2048;
        v84 = v72;
        v85 = 2048;
        v86 = v37;
        v87 = 2048;
        v88 = v39;
        v89 = 2048;
        v90 = v67;
        v91 = 2048;
        v92 = v80;
        v93 = 2048;
        v94 = v68;
        v95 = 2048;
        v96 = v66;
        v97 = 2048;
        v98 = v79 != 0;
        v99 = 2048;
        v100 = v79;
        v101 = 2048;
        v102 = v26 != 0;
        v103 = 2048;
        v104 = v26;
        v105 = 2048;
        v106 = v71;
        v107 = 2048;
        v108 = v70;
        v109 = 2048;
        v110 = v74;
        v111 = 2048;
        v112 = v69;
        v113 = 2112;
        v114 = v44;
        _os_log_debug_impl(&dword_1CBD43000, v45, OS_LOG_TYPE_DEBUG, "[DEBUG] updating recursive properties starting from document %@:\n fault:    {needs:%lld done:%lld}\n quota:    %lld\n upload:   {needs:(count:%lld size:%lld) done:(count:%lld size:%lld)}\n download: {needs:(count:%lld size:%lld) done:(count:%lld size:%lld)}\n unstage:  {needs:%lld done:%lld}\n sync-up:  {needs:%lld done:%lld}\n%@", buf, 0xACu);
      }
      v63 = v37;

      v46 = -[BRCStatInfo type](self->super._st, "type");
      if (v46 == 8 || v46 == 2)
        v48 = 1;
      else
        v48 = v46;
      if (v48 == 7)
        v49 = 6;
      else
        v49 = v48;
      -[BRCStatInfo parentID](self->super._st, "parentID");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = self->super._itemID;
      -[BRCClientZone dbRowID](self->super._clientZone, "dbRowID");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      -[BRCLocalItem parentClientZone](self, "parentClientZone");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "dbRowID");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v51) = objc_msgSend(v8, "execute:", CFSTR("INSERT OR IGNORE INTO item_recursive_properties (item_rowid, item_parent_id, item_id, zone_rowid, item_type, item_parent_zone_rowid) VALUES  (%lld, %@, %@, %@, %d, %@)"), v77, v50, v51, v52, v49, v54);

      if ((v51 & 1) != 0)
      {
        v9 = v78;
        if ((objc_msgSend(v8, "execute:", CFSTR("UPDATE item_recursive_properties SET  dir_faults_count = %lld, faults_count = %lld, needs_faulting_count = %lld, uploaded_size = %lld, needs_upload_size = %lld, uploaded_count = %lld, needs_upload_count = %lld, downloaded_size = %lld, needs_download_size = %lld, downloaded_count = %lld, needs_download_count = %lld, dl_unstaged_count = %lld, needs_dl_unstage_count = %lld, synced_up_count = %lld, needs_sync_up_count = %lld, over_quota_count = %lld, shared_by_me_count = %lld, shared_to_me_count = %lld, needs_delete_doc_count = %lld  WHERE item_rowid = %llu "), 0, v63, v72, v66, v80, v68, v67, v76, v79, v43, v79 != 0, v70, v71, v69, v74, v40,
                v65,
                v64,
                v62,
                v77) & 1) == 0)
        {
          brc_bread_crumbs();
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v56 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v56, OS_LOG_TYPE_FAULT))
            -[BRCDocumentItem _updateRecursivePropertiesInDB:dbRowID:diffs:].cold.2();

        }
      }
      else
      {
        brc_bread_crumbs();
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v58 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v58, OS_LOG_TYPE_FAULT))
          -[BRCDocumentItem _updateRecursivePropertiesInDB:dbRowID:diffs:].cold.2();

        v9 = v78;
      }
    }
  }

}

- (BOOL)_insertInDB:(id)a3 dbRowID:(unint64_t)a4
{
  BRCLocalStatInfo *st;
  const __CFString *logicalName;
  BRCDesiredVersion *desiredVersion;
  void *v8;
  void *v9;
  int v10;
  BOOL v11;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  int64_t v23;
  int64_t v24;
  int64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  unsigned int v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  const __CFString *v37;
  _BOOL4 v38;
  int64_t v39;
  int64_t v40;
  int64_t v41;
  int v42;
  int v43;
  int v44;
  _BOOL8 isUserVisible;
  NSNumber *minimumSupportedOSRowID;
  unint64_t notifsRank;
  uint64_t syncUpState;
  unint64_t localDiffs;
  BRCZoneRowID *parentZoneRowID;
  unint64_t sharingOptions;
  BRFieldCKInfo *sideCarCKInfo;
  BRCUserRowID *ownerKey;
  BRCItemID *itemID;
  int v55;
  void *v56;
  id v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  objc_super v75;

  v58 = a3;
  -[BRCClientZone dbRowID](self->super._clientZone, "dbRowID");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  itemID = self->super._itemID;
  ownerKey = self->super._ownerKey;
  sharingOptions = self->super._sharingOptions;
  sideCarCKInfo = self->super._sideCarCKInfo;
  parentZoneRowID = self->super._parentZoneRowID;
  localDiffs = self->super._localDiffs;
  notifsRank = self->super._notifsRank;
  syncUpState = self->super._syncUpState;
  -[BRCLocalItem appLibrary](self, "appLibrary");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "dbRowID");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  minimumSupportedOSRowID = self->super._minimumSupportedOSRowID;
  isUserVisible = self->super._isUserVisible;
  -[BRCStatInfo ckInfo](self->super._st, "ckInfo");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = -[BRCStatInfo state](self->super._st, "state");
  v44 = -[BRCStatInfo type](self->super._st, "type");
  v42 = -[BRCStatInfo mode](self->super._st, "mode");
  v40 = -[BRCStatInfo birthtime](self->super._st, "birthtime");
  v41 = -[BRCStatInfo lastUsedTime](self->super._st, "lastUsedTime");
  v39 = -[BRCStatInfo favoriteRank](self->super._st, "favoriteRank");
  -[BRCStatInfo parentID](self->super._st, "parentID");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  st = self->super._st;
  logicalName = (const __CFString *)st->super._logicalName;
  if (!logicalName)
    logicalName = &stru_1E8769030;
  v37 = logicalName;
  v38 = -[BRCStatInfo isHiddenExt](st, "isHiddenExt");
  -[BRCStatInfo finderTags](self->super._st, "finderTags");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCStatInfo xattrSignature](self->super._st, "xattrSignature");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCStatInfo trashPutBackPath](self->super._st, "trashPutBackPath");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCStatInfo trashPutBackParentID](self->super._st, "trashPutBackParentID");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCStatInfo aliasTarget](self->super._st, "aliasTarget");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCStatInfo creatorRowID](self->super._st, "creatorRowID");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCLocalStatInfo documentID](self->super._st, "documentID");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCLocalStatInfo fileID](self->super._st, "fileID");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCLocalStatInfo generationID](self->super._st, "generationID");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCLocalStatInfo physicalName](self->super._st, "physicalName");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCLocalStatInfo processingStamp](self->super._st, "processingStamp");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCLocalStatInfo stagedFileIDForDB](self->super._st, "stagedFileIDForDB");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = -[BRCLocalStatInfo stagedGenerationID](self->super._st, "stagedGenerationID");
  -[BRCLocalStatInfo rawBouncedLogicalName](self->super._st, "rawBouncedLogicalName");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = -[BRCLocalStatInfo itemScope](self->super._st, "itemScope");
  -[BRCLocalStatInfo tmpBouncedNo](self->super._st, "tmpBouncedNo");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCVersion originalPOSIXName](self->_currentVersion, "originalPOSIXName");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCVersion ckInfo](self->_currentVersion, "ckInfo");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = -[BRCVersion mtime](self->_currentVersion, "mtime");
  v24 = -[BRCVersion size](self->_currentVersion, "size");
  v23 = -[BRCVersion thumbnailSize](self->_currentVersion, "thumbnailSize");
  -[BRCVersion thumbnailSignature](self->_currentVersion, "thumbnailSignature");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCVersion contentSignature](self->_currentVersion, "contentSignature");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCVersion xattrSignature](self->_currentVersion, "xattrSignature");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCVersion editedSinceShared](self->_currentVersion, "editedSinceShared");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCVersion lastEditorDeviceOrUserRowID](self->_currentVersion, "lastEditorDeviceOrUserRowID");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCVersion conflictLoserEtags](self->_currentVersion, "conflictLoserEtags");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCVersion quarantineInfo](self->_currentVersion, "quarantineInfo");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCLocalVersion uploadedAssets](self->_currentVersion, "uploadedAssets");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCLocalVersion uploadError](self->_currentVersion, "uploadError");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCLocalVersion previousItemGlobalID](self->_currentVersion, "previousItemGlobalID");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "itemID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCLocalVersion previousItemGlobalID](self->_currentVersion, "previousItemGlobalID");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "zoneRowID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  desiredVersion = self->_desiredVersion;
  -[BRCDocumentItem conflictLoserState](self, "conflictLoserState");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCDocumentItem liveThumbnailSignature](self, "liveThumbnailSignature");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = objc_msgSend(v58, "execute:", CFSTR("INSERT INTO client_items(rowid, zone_rowid, item_id, item_creator_id, item_sharing_options, item_side_car_ckinfo, item_parent_zone_rowid, item_localsyncupstate, item_local_diffs, item_notifs_rank, app_library_rowid, item_min_supported_os_rowid, item_user_visible, item_stat_ckinfo, item_state, item_type, item_mode, item_birthtime, item_lastusedtime, item_favoriterank,item_parent_id, item_filename, item_hidden_ext, item_finder_tags, item_xattr_signature, item_trash_put_back_path, item_trash_put_back_parent_id, item_alias_target, item_creator, item_doc_id, item_file_id, item_generation, item_localname, item_processing_stamp, item_staged_file_id, item_staged_generation, item_bouncedname, item_scope, item_tmpbounceno, version_name, version_ckinfo, version_mtime, version_size, version_thumb_size, version_thumb_signature, version_content_signature, version_xattr_signature, version_edited_since_shared, version_device, version_conflict_loser_etags, version_quarantine_info, version_uploaded_assets, version_upload_error, version_old_zone_item_id, version_old_zone_rowid, desired_version, item_live_conflict_loser_etags, item_thumb_live_signature, item_thumb_greedy, version_block_sync_until_bundle_id, version_block_sync_until_timestamp) VALUES(%lld, %@, %@, %@, %ld, %@, %@, %d, %lld, %lld, %@, %@, %d, %@, %d, %d, %d, %lld, %lld, %lld, %@, %@, %d, %@, %@, %@, %@, %@, %@, %@, %@, %@, %@, %@, %@, %u, %@, %d, %@, %@, %@, %lld, %lld, %lld, %@, %@, %@, %@, %@, %@, %@, %@, %@, %@, %@, %@, %@, %@, %d, %@, %@)"), a4, v74, itemID, ownerKey, sharingOptions, sideCarCKInfo, parentZoneRowID, syncUpState, localDiffs, notifsRank, v73, minimumSupportedOSRowID, isUserVisible, v61, v43, v44,
          v42,
          v40,
          v41,
          v39,
          v72,
          v37,
          v38,
          v59,
          v70,
          v71,
          v69,
          v68,
          v67,
          v66,
          v60,
          v65,
          v64,
          v63,
          v62,
          v32,
          v36,
          v31,
          v35,
          v34,
          v33,
          v25,
          v24,
          v23,
          v20,
          v19,
          v30,
          v29,
          v27,
          v22,
          v21,
          v18,
          v17,
          v16,
          v15,
          desiredVersion,
          v14,
          v13,
          -[BRCDocumentItem shouldAutomaticallyDownloadThumbnail](self, "shouldAutomaticallyDownloadThumbnail"),
          self->_syncPausedByBundleID);

  if (v55)
  {
    v75.receiver = self;
    v75.super_class = (Class)BRCDocumentItem;
    v8 = v58;
    if (-[BRCLocalItem _insertInDB:dbRowID:](&v75, sel__insertInDB_dbRowID_, v58, a4)
      && (-[BRCAccountSession diskReclaimer](self->super._session, "diskReclaimer"),
          v9 = (void *)objc_claimAutoreleasedReturnValue(),
          v10 = objc_msgSend(v9, "documentWasCreated:", self),
          v9,
          v10))
    {
      v11 = 1;
      -[BRCDocumentItem _updateReadThrottleIfNeededForRowID:forCreation:](self, "_updateReadThrottleIfNeededForRowID:forCreation:", a4, 1);
      -[BRCDocumentItem _updateRecursivePropertiesInDB:dbRowID:diffs:](self, "_updateRecursivePropertiesInDB:dbRowID:diffs:", v58, a4, 0xFF007FF3FF7FFFLL);
    }
    else
    {
      v11 = 0;
    }
  }
  else
  {
    v11 = 0;
    v8 = v58;
  }

  return v11;
}

- (BOOL)_updateInDB:(id)a3 diffs:(unint64_t)a4
{
  void *v5;
  void *v6;
  BOOL v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  BRCDesiredVersion *desiredVersion;
  void *v14;
  BRCClientZone *clientZone;
  void *v16;
  void *v17;
  NSObject *v18;
  BRCItemDBRowIDAndZoneJobIdentifier *v19;
  unint64_t dbRowID;
  void *v21;
  void *v22;
  BRCItemDBRowIDAndZoneJobIdentifier *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  int v30;
  void *v31;
  BRCLocalStatInfo *st;
  const __CFString *logicalName;
  void *v34;
  void *v35;
  BRCDesiredVersion *v36;
  void *v37;
  void *v38;
  void *v39;
  int v40;
  void *v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t j;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t i;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  uint64_t v63;
  void *v64;
  NSObject *v65;
  void *v66;
  BOOL v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  _BOOL4 v74;
  BRCLocalItem *orig;
  BRCLocalItem *v76;
  void *v77;
  void *v79;
  void *v80;
  char v81;
  void *v82;
  NSObject *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  int64_t v90;
  int64_t v91;
  void *v92;
  int64_t v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  unsigned int v98;
  void *v99;
  uint64_t v100;
  void *v101;
  _BOOL4 v102;
  const __CFString *v103;
  int64_t v104;
  int64_t v105;
  int64_t v106;
  int v107;
  int v108;
  int v109;
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
  int v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  id v141;
  objc_super v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;
  __int128 v150;
  __int128 v151;
  uint8_t buf[4];
  uint64_t v153;
  __int16 v154;
  void *v155;
  __int16 v156;
  void *v157;
  _BYTE v158[128];
  _BYTE v159[128];
  uint64_t v160;

  v160 = *MEMORY[0x1E0C80C00];
  v141 = a3;
  if (!-[BRCDocumentItem isFault](self, "isFault"))
  {
    if (-[BRCLocalItem isFault](self->super._orig, "isFault"))
    {
      -[BRCLocalItem st](self, "st");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "documentID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
      {

LABEL_6:
        -[BRCLocalItem st](self->super._orig, "st");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "documentID");
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v9)
        {
          brc_bread_crumbs();
          v82 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v83 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v83, OS_LOG_TYPE_FAULT))
            -[BRCDocumentItem _updateInDB:diffs:].cold.2();

        }
        v10 = 1;
LABEL_9:
        if (-[BRCLocalItem isDocument](self->super._orig, "isDocument"))
        {
          -[BRCLocalItem asDocument](self->super._orig, "asDocument");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v11 = 0;
        }
        objc_msgSend(v11, "desiredVersion");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
        {
          desiredVersion = self->_desiredVersion;

          if (desiredVersion)
          {
            if (!v10)
            {
LABEL_16:

              goto LABEL_17;
            }
          }
          else
          {
            -[BRCDocumentItem currentVersion](self, "currentVersion");
            v79 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "desiredVersion");
            v80 = (void *)objc_claimAutoreleasedReturnValue();
            v81 = objc_msgSend(v79, "isEtagEqual:", v80);

            if ((v81 & 1) == 0)
              goto LABEL_16;
          }
        }
        else if ((v10 & 1) == 0)
        {
          goto LABEL_16;
        }
        -[BRCAccountSession downloadTrackers](self->super._session, "downloadTrackers");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "document:didCompleteDownloadWithError:", self, 0);

        goto LABEL_16;
      }
      v7 = -[BRCLocalItem isDead](self, "isDead");

      if (v7)
        goto LABEL_6;
    }
    v10 = 0;
    goto LABEL_9;
  }
LABEL_17:
  if ((a4 & 0x100000000) != 0 && -[BRCLocalItem isDead](self, "isDead"))
    -[BRCDocumentItem _nukePackageItemsFromDB:](self, "_nukePackageItemsFromDB:", v141);
  if (-[BRCDocumentItem isDocumentBeingCopiedToNewZone](self, "isDocumentBeingCopiedToNewZone")
    || -[BRCLocalItem isDocumentBeingCopiedToNewZone](self->super._orig, "isDocumentBeingCopiedToNewZone"))
  {
    clientZone = self->super._clientZone;
    -[BRCLocalItem clientZone](self->super._orig, "clientZone");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(clientZone) = -[BRCClientZone isEqualToClientZone:](clientZone, "isEqualToClientZone:", v16);

    if ((clientZone & 1) == 0)
    {
      brc_bread_crumbs();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        -[BRCDocumentItem _updateInDB:diffs:].cold.1();

      v19 = [BRCItemDBRowIDAndZoneJobIdentifier alloc];
      dbRowID = self->super._dbRowID;
      -[BRCLocalItem clientZone](self->super._orig, "clientZone");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "dbRowID");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = -[BRCItemDBRowIDAndZoneJobIdentifier initWithItemDBRowID:zoneRowID:](v19, "initWithItemDBRowID:zoneRowID:", dbRowID, v22);

      -[BRCAccountSession(LegacyAdditions) fsReader](self->super._session, "fsReader");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "deleteJobsMatching:", v23);

      -[BRCAccountSession fsDownloader](self->super._session, "fsDownloader");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "deleteJobsMatching:", v23);

      -[BRCAccountSession fsUploader](self->super._session, "fsUploader");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "deleteJobsMatching:", v23);

    }
  }
  -[BRCDocumentItem _updateUploadJobIfNeededWithDiffs:](self, "_updateUploadJobIfNeededWithDiffs:", a4);
  if ((a4 & 0x2010000) != 0)
  {
    -[BRCVersion conflictLoserEtags](self->_currentVersion, "conflictLoserEtags");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "count");

    if (v28)
    {
      -[BRCAccountSession fsDownloader](self->super._session, "fsDownloader");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "rescheduleJobsPendingWinnerForItem:", self);

    }
  }
  if (a4 != 0x100000000)
  {
    -[BRCClientZone dbRowID](self->super._clientZone, "dbRowID");
    v140 = (void *)objc_claimAutoreleasedReturnValue();
    itemID = self->super._itemID;
    ownerKey = self->super._ownerKey;
    sharingOptions = self->super._sharingOptions;
    sideCarCKInfo = self->super._sideCarCKInfo;
    parentZoneRowID = self->super._parentZoneRowID;
    localDiffs = self->super._localDiffs;
    notifsRank = self->super._notifsRank;
    syncUpState = self->super._syncUpState;
    -[BRCLocalItem appLibrary](self, "appLibrary");
    v121 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v121, "dbRowID");
    v139 = (void *)objc_claimAutoreleasedReturnValue();
    minimumSupportedOSRowID = self->super._minimumSupportedOSRowID;
    isUserVisible = self->super._isUserVisible;
    -[BRCStatInfo ckInfo](self->super._st, "ckInfo");
    v138 = (void *)objc_claimAutoreleasedReturnValue();
    v109 = -[BRCStatInfo state](self->super._st, "state");
    v107 = -[BRCStatInfo type](self->super._st, "type");
    v108 = -[BRCStatInfo mode](self->super._st, "mode");
    v106 = -[BRCStatInfo birthtime](self->super._st, "birthtime");
    v105 = -[BRCStatInfo lastUsedTime](self->super._st, "lastUsedTime");
    v104 = -[BRCStatInfo favoriteRank](self->super._st, "favoriteRank");
    -[BRCStatInfo parentID](self->super._st, "parentID");
    v126 = (void *)objc_claimAutoreleasedReturnValue();
    st = self->super._st;
    logicalName = (const __CFString *)st->super._logicalName;
    if (!logicalName)
      logicalName = &stru_1E8769030;
    v103 = logicalName;
    v102 = -[BRCStatInfo isHiddenExt](st, "isHiddenExt");
    -[BRCStatInfo finderTags](self->super._st, "finderTags");
    v136 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCStatInfo xattrSignature](self->super._st, "xattrSignature");
    v137 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCStatInfo trashPutBackPath](self->super._st, "trashPutBackPath");
    v135 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCStatInfo trashPutBackParentID](self->super._st, "trashPutBackParentID");
    v134 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCStatInfo aliasTarget](self->super._st, "aliasTarget");
    v133 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCStatInfo creatorRowID](self->super._st, "creatorRowID");
    v132 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCLocalStatInfo documentID](self->super._st, "documentID");
    v131 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCLocalStatInfo fileID](self->super._st, "fileID");
    v130 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCLocalStatInfo generationID](self->super._st, "generationID");
    v129 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCLocalStatInfo physicalName](self->super._st, "physicalName");
    v128 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCLocalStatInfo processingStamp](self->super._st, "processingStamp");
    v127 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCLocalStatInfo stagedFileIDForDB](self->super._st, "stagedFileIDForDB");
    v125 = (void *)objc_claimAutoreleasedReturnValue();
    v100 = -[BRCLocalStatInfo stagedGenerationID](self->super._st, "stagedGenerationID");
    -[BRCLocalStatInfo rawBouncedLogicalName](self->super._st, "rawBouncedLogicalName");
    v124 = (void *)objc_claimAutoreleasedReturnValue();
    v98 = -[BRCLocalStatInfo itemScope](self->super._st, "itemScope");
    -[BRCLocalStatInfo tmpBouncedNo](self->super._st, "tmpBouncedNo");
    v122 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCVersion originalPOSIXName](self->_currentVersion, "originalPOSIXName");
    v123 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCVersion ckInfo](self->_currentVersion, "ckInfo");
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    v93 = -[BRCVersion mtime](self->_currentVersion, "mtime");
    v91 = -[BRCVersion size](self->_currentVersion, "size");
    v90 = -[BRCVersion thumbnailSize](self->_currentVersion, "thumbnailSize");
    -[BRCVersion thumbnailSignature](self->_currentVersion, "thumbnailSignature");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCVersion contentSignature](self->_currentVersion, "contentSignature");
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCVersion xattrSignature](self->_currentVersion, "xattrSignature");
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCVersion editedSinceShared](self->_currentVersion, "editedSinceShared");
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCVersion lastEditorDeviceOrUserRowID](self->_currentVersion, "lastEditorDeviceOrUserRowID");
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCVersion conflictLoserEtags](self->_currentVersion, "conflictLoserEtags");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCVersion quarantineInfo](self->_currentVersion, "quarantineInfo");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCLocalVersion uploadedAssets](self->_currentVersion, "uploadedAssets");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCLocalVersion uploadError](self->_currentVersion, "uploadError");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCLocalVersion previousItemGlobalID](self->_currentVersion, "previousItemGlobalID");
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v94, "itemID");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCLocalVersion previousItemGlobalID](self->_currentVersion, "previousItemGlobalID");
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v92, "zoneRowID");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = self->_desiredVersion;
    -[BRCDocumentItem conflictLoserState](self, "conflictLoserState");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCDocumentItem liveThumbnailSignature](self, "liveThumbnailSignature");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v120 = objc_msgSend(v141, "execute:", CFSTR("UPDATE client_items SET  zone_rowid = %@, item_id = %@, item_creator_id = %@, item_sharing_options = %ld, item_side_car_ckinfo = %@, item_parent_zone_rowid = %@, item_localsyncupstate = %d, item_local_diffs = %llu, item_notifs_rank = %lld, app_library_rowid = %@, item_min_supported_os_rowid = %@, item_user_visible = %d, item_stat_ckinfo = %@, item_state = %d, item_type = %d, item_mode = %d, item_birthtime = %lld, item_lastusedtime = %lld, item_favoriterank = %lld, item_parent_id = %@, item_filename = %@, item_hidden_ext = %d, item_finder_tags = %@, item_xattr_signature = %@, item_trash_put_back_path = %@, item_trash_put_back_parent_id = %@, item_alias_target = %@, item_creator = %@, item_doc_id = %@, item_file_id = %@, item_generation = %@, item_localname = %@, item_processing_stamp = %@, item_staged_file_id = %@, item_staged_generation = %u, item_bouncedname = %@, item_scope = %d, item_tmpbounceno = %@, version_name = %@, version_ckinfo = %@, version_mtime = %lld, version_size = %lld, version_thumb_size = %lld, version_thumb_signature = %@, version_content_signature = %@, version_xattr_signature = %@, version_edited_since_shared = %@, version_device = %@, version_conflict_loser_etags = %@, version_quarantine_info = %@, version_uploaded_assets = %@, version_upload_error = %@, version_old_zone_item_id = %@, version_old_zone_rowid = %@, desired_version = %@, item_live_conflict_loser_etags = %@, item_thumb_live_signature = %@, item_thumb_greedy = %d, version_block_sync_until_bundle_id = %@, version_block_sync_until_timestamp = %@  WHERE rowid = %llu"), v140, itemID, ownerKey, sharingOptions, sideCarCKInfo, parentZoneRowID, syncUpState, localDiffs, notifsRank, v139, minimumSupportedOSRowID, isUserVisible, v138, v109, v107, v108,
             v106,
             v105,
             v104,
             v126,
             v103,
             v102,
             v136,
             v137,
             v135,
             v134,
             v133,
             v132,
             v131,
             v130,
             v129,
             v128,
             v127,
             v125,
             v100,
             v124,
             v98,
             v122,
             v123,
             v101,
             v93,
             v91,
             v90,
             v89,
             v99,
             v97,
             v96,
             v95,
             v88,
             v87,
             v86,
             v34,
             v35,
             v84,
             v36,
             v85,
             v37,
             -[BRCDocumentItem shouldAutomaticallyDownloadThumbnail](self, "shouldAutomaticallyDownloadThumbnail"),
             self->_syncPausedByBundleID,
             self->_syncPausedExpireTS);

    if (!v120)
      goto LABEL_76;
LABEL_35:
    if (-[BRCLocalItem isInTrashScope](self, "isInTrashScope")
      && !-[BRCLocalItem isInTrashScope](self->super._orig, "isInTrashScope"))
    {
      v151 = 0u;
      v150 = 0u;
      v149 = 0u;
      v148 = 0u;
      -[BRCLocalItem asDocument](self->super._orig, "asDocument");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "reverseAliasEnumerator");
      v42 = (void *)objc_claimAutoreleasedReturnValue();

      v48 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v148, v159, 16);
      if (v48)
      {
        v49 = v48;
        v50 = *(_QWORD *)v149;
        do
        {
          for (i = 0; i != v49; ++i)
          {
            if (*(_QWORD *)v149 != v50)
              objc_enumerationMutation(v42);
            objc_msgSend(*(id *)(*((_QWORD *)&v148 + 1) + 8 * i), "targetMovedToTrashOrDeleted");
          }
          v49 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v148, v159, 16);
        }
        while (v49);
      }
    }
    else
    {
      if ((a4 & 0x80000000) == 0)
      {
        if ((a4 & 1) == 0
          || (-[BRCLocalItem st](self->super._orig, "st"),
              v38 = (void *)objc_claimAutoreleasedReturnValue(),
              objc_msgSend(v38, "ckInfo"),
              v39 = (void *)objc_claimAutoreleasedReturnValue(),
              v39,
              v38,
              v39))
        {
          v40 = 1;
          goto LABEL_63;
        }
      }
      v147 = 0u;
      v146 = 0u;
      v144 = 0u;
      v145 = 0u;
      -[BRCLocalItem asDocument](self->super._orig, "asDocument");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "reverseAliasEnumerator");
      v42 = (void *)objc_claimAutoreleasedReturnValue();

      v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v144, v158, 16);
      if (v43)
      {
        v44 = v43;
        v45 = *(_QWORD *)v145;
        LOBYTE(v40) = 1;
        do
        {
          for (j = 0; j != v44; ++j)
          {
            if (*(_QWORD *)v145 != v45)
              objc_enumerationMutation(v42);
            if ((v40 & 1) != 0)
              v40 = objc_msgSend(*(id *)(*((_QWORD *)&v144 + 1) + 8 * j), "updateOnDiskWithAliasTarget:forServerEdit:", self, 1);
            else
              v40 = 0;
          }
          v44 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v144, v158, 16);
        }
        while (v44);
        goto LABEL_62;
      }
    }
    v40 = 1;
LABEL_62:

LABEL_63:
    if ((a4 & 0x40000000000000) != 0)
    {
      -[BRCLocalItem appLibrary](self, "appLibrary");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      -[BRCDocumentItem anyReverseAliasInAppLibrary:](self, "anyReverseAliasInAppLibrary:", v52);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "targetMovedToThisAppLibrary");

    }
    if (!v40)
      goto LABEL_76;
    -[BRCAccountSession diskReclaimer](self->super._session, "diskReclaimer");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "documentWasUpdated:diffs:", self, a4);

    -[BRCDesiredVersion downloadError](self->_desiredVersion, "downloadError");
    v55 = (void *)objc_claimAutoreleasedReturnValue();

    if (v55)
    {
      -[BRCAccountSession downloadTrackers](self->super._session, "downloadTrackers");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      -[BRCDesiredVersion downloadError](self->_desiredVersion, "downloadError");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "document:didCompleteDownloadWithError:", self, v57);

    }
    -[BRCDocumentItem _updateRecursivePropertiesInDB:dbRowID:diffs:](self, "_updateRecursivePropertiesInDB:dbRowID:diffs:", v141, self->super._dbRowID, a4);
    if ((a4 & 0x80000000) != 0
      || -[BRCLocalItem isReserved](self->super._orig, "isReserved") && !-[BRCLocalItem isReserved](self, "isReserved"))
    {
      -[BRCAccountSession applyScheduler](self->super._session, "applyScheduler");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      -[BRCLocalItem unsaltedBookmarkData](self, "unsaltedBookmarkData");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      v60 = (void *)objc_msgSend(v141, "fetch:", CFSTR("SELECT zone_rowid, item_rank FROM server_items WHERE item_alias_target = %@ AND item_type = 3"), v59);

      if (objc_msgSend(v60, "next"))
      {
        do
        {
          objc_msgSend(v60, "numberAtIndex:", 0);
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          -[BRCAccountSession serverZoneByRowID:](self->super._session, "serverZoneByRowID:", v61);
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          v63 = objc_msgSend(v60, "longLongAtIndex:", 1);
          brc_bread_crumbs();
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v65 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v65, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(v62, "zoneName");
            v66 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 134218498;
            v153 = v63;
            v154 = 2112;
            v155 = v66;
            v156 = 2112;
            v157 = v64;
            _os_log_debug_impl(&dword_1CBD43000, v65, OS_LOG_TYPE_DEBUG, "[DEBUG] Apply Changes[%lld]: Rescheduling reverse-alias in %@%@", buf, 0x20u);

          }
          objc_msgSend(v58, "setState:andApplyKind:forRank:zoneRowID:", 1, 1, v63, v61);

        }
        while ((objc_msgSend(v60, "next") & 1) != 0);
      }

    }
    -[BRCDocumentItem _updateReadThrottleIfNeededForRowID:forCreation:](self, "_updateReadThrottleIfNeededForRowID:forCreation:", self->super._dbRowID, 0);
    -[BRCLocalItem session](self, "session");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "globalProgress");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "didUpdateDocument:", self);

    -[BRCLocalVersion uploadError](self->_currentVersion, "uploadError");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCLocalItem asDocument](self->super._orig, "asDocument");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "currentVersion");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "uploadError");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    v74 = -[BRCDocumentItem _needsSyncBubbleRecomputeForError:origError:](self, "_needsSyncBubbleRecomputeForError:origError:", v70, v73);

    if (v74)
      -[BRCClientZone recomputeAllItemsDidUploadState](self->super._clientZone, "recomputeAllItemsDidUploadState");
    if (-[BRCDocumentItem isPackage](self, "isPackage") && -[BRCDocumentItem isFault](self, "isFault"))
    {
      orig = self->super._orig;
      if (!orig)
      {
LABEL_89:
        v143.receiver = self;
        v143.super_class = (Class)BRCDocumentItem;
        v67 = -[BRCLocalItem _updateInDB:diffs:](&v143, sel__updateInDB_diffs_, v141, a4);
        goto LABEL_90;
      }
      if (!-[BRCLocalItem isFault](orig, "isFault"))
        -[BRCDocumentItem _nukePackageItemsFromDB:](self, "_nukePackageItemsFromDB:", v141);
    }
    v76 = self->super._orig;
    if (v76 && !-[BRCLocalItem isOnDisk](v76, "isOnDisk") && -[BRCLocalItem isOnDisk](self, "isOnDisk"))
    {
      -[BRCAccountSession applyScheduler](self->super._session, "applyScheduler");
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v77, "rescheduleMissingTargetAliasesWithTarget:", self);

    }
    goto LABEL_89;
  }
  v30 = -[BRCStatInfo state](self->super._st, "state");
  -[BRCLocalStatInfo lostStamp](self->super._st, "lostStamp");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v30) = objc_msgSend(v141, "execute:", CFSTR("UPDATE client_items SET item_state = %d, item_processing_stamp = %@ WHERE rowid = %llu"), v30, v31, self->super._dbRowID);

  if ((v30 & 1) != 0)
    goto LABEL_35;
LABEL_76:
  v67 = 0;
LABEL_90:

  return v67;
}

- (BOOL)_needsSyncBubbleRecomputeForError:(id)a3 origError:(id)a4
{
  id v5;
  id v6;
  BOOL v7;
  void *v8;

  v5 = a3;
  v6 = a4;
  if (!v5
    || (objc_msgSend(v5, "brc_isEverRetriable") & 1) != 0
    || v6 && (objc_msgSend(v6, "brc_isEverRetriable") & 1) == 0)
  {
    +[BRCAccountsManager sharedManager](BRCAccountsManager, "sharedManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "retrySyncBubbleLaterIfNeededWithError:", v5);

    v7 = 0;
  }
  else
  {
    v7 = 1;
  }

  return v7;
}

- (BOOL)_deleteFromDB:(id)a3 keepAliases:(BOOL)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void (**v19)(_QWORD, _QWORD);
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void (**v26)(_QWORD, _QWORD);
  void *v27;
  void *v28;
  char v29;
  void *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v34;
  BOOL v35;
  void *v37;
  unsigned int v38;
  void *v39;
  objc_super v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint8_t buf[4];
  void *v46;
  _BYTE v47[128];
  uint64_t v48;

  v4 = a4;
  v48 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (-[BRCLocalItem isFault](self->super._orig, "isFault"))
  {
    -[BRCAccountSession downloadTrackers](self->super._session, "downloadTrackers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "document:didCompleteDownloadWithError:", self, 0);

  }
  if (!-[BRCDocumentItem _nukePackageItemsFromDB:](self, "_nukePackageItemsFromDB:", v6))
    goto LABEL_25;
  if (!self->super._dbRowID)
  {
    v35 = 1;
    goto LABEL_27;
  }
  if ((v4 & 1) == 0)
  {
    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    -[BRCDocumentItem reverseAliasEnumerator](self, "reverseAliasEnumerator");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v41, v47, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v42;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v42 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v41 + 1) + 8 * i), "targetMovedToTrashOrDeleted");
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v41, v47, 16);
      }
      while (v10);
    }

  }
  -[BRCAccountSession diskReclaimer](self->super._session, "diskReclaimer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "documentWasDeleted:", self);

  if (v14)
  {
    -[BRCLocalItem session](self, "session");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "globalProgress");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "didDeleteDocument:", self);

    -[BRCLocalItem clientZone](self, "clientZone");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCLocalItem itemID](self, "itemID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "popOnDiskBlockForItemID:", v18);
    v19 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

    if (v19)
      v19[2](v19, 0);
    -[BRCLocalItem clientZone](self, "clientZone");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCLocalItem itemID](self, "itemID");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "popDownloadedBlockForItemID:", v21);
    v22 = objc_claimAutoreleasedReturnValue();

    if (v22)
      (*(void (**)(uint64_t, BRCDocumentItem *))(v22 + 16))(v22, self);
    v39 = (void *)v22;
    if (-[BRCLocalItem isDocumentBeingCopiedToNewZone](self->super._orig, "isDocumentBeingCopiedToNewZone"))
    {
      -[BRCLocalItem clientZone](self, "clientZone");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "dbRowID");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[BRCLocalItem asDocument](self->super._orig, "asDocument");
      v38 = v4;
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "currentVersion");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "previousItemGlobalID");
      v26 = v19;
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "zoneRowID");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v23, "br_isEqualToNumber:", v28);

      v19 = v26;
      v4 = v38;

      if ((v29 & 1) == 0)
      {
        brc_bread_crumbs();
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v31 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v46 = v30;
          _os_log_impl(&dword_1CBD43000, v31, OS_LOG_TYPE_DEFAULT, "[WARNING] Deleted item was copied from another zone, insert tombstone in the old zone%@", buf, 0xCu);
        }

        -[BRCLocalItem asDocument](self->super._orig, "asDocument");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "_insertTombstoneForPreviousZoneGlobalID");

      }
    }
    -[BRCAccountSession fsDownloader](self->super._session, "fsDownloader");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "deleteDownloadingJobForItem:", self);

    -[BRCAccountSession fsUploader](self->super._session, "fsUploader");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "deleteUploadingJobForItem:", self);

    v40.receiver = self;
    v40.super_class = (Class)BRCDocumentItem;
    v35 = -[BRCLocalItem _deleteFromDB:keepAliases:](&v40, sel__deleteFromDB_keepAliases_, v6, v4);

  }
  else
  {
LABEL_25:
    v35 = 0;
  }
LABEL_27:

  return v35;
}

- (BOOL)startDownloadInTask:(id)a3 options:(unint64_t)a4 etagIfLoser:(id)a5 stageFileName:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
  _BOOL4 v15;
  BRCDesiredVersion *v16;
  BOOL v17;
  char v18;
  void *v19;
  void *v20;
  void *v21;
  BRCPQLConnection *db;
  void *v24;
  NSObject *v25;
  void *v26;
  int v27;
  _QWORD v28[7];
  _QWORD v29[3];
  char v30;
  objc_super v31;

  v12 = a3;
  v13 = a5;
  v14 = a6;
  v31.receiver = self;
  v31.super_class = (Class)BRCDocumentItem;
  v15 = -[BRCLocalItem startDownloadInTask:options:etagIfLoser:stageFileName:error:](&v31, sel_startDownloadInTask_options_etagIfLoser_stageFileName_error_, v12, a4, v13, v14, a7);
  if (v15)
  {
    v16 = self->_desiredVersion;
    v29[0] = 0;
    v29[1] = v29;
    v29[2] = 0x2020000000;
    v30 = 0;
    if ((a4 & 4) != 0)
    {
      if (!self->_shouldAutomaticallyDownloadThumbnail)
      {
        self->_shouldAutomaticallyDownloadThumbnail = 1;
        v30 = 1;
      }
    }
    else
    {
      if (!-[BRCDocumentItem isFault](self, "isFault"))
      {
        v17 = -[BRCLocalItem isReserved](self, "isReserved");
        v18 = v16 || v17;
        if ((v18 & 1) == 0)
        {
          brc_bread_crumbs();
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v25 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
            -[BRCDocumentItem startDownloadInTask:options:etagIfLoser:stageFileName:error:].cold.2();
          goto LABEL_21;
        }
      }
      -[BRCDesiredVersion downloadError](v16, "downloadError");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v19
        && -[BRCDesiredVersion wantsContent](v16, "wantsContent")
        && -[BRCDesiredVersion userInitiated](v16, "userInitiated"))
      {
        -[BRCLocalItem st](self, "st");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "stagedFileID");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if (v21)
        {

          goto LABEL_23;
        }
        -[BRCAccountSession fsDownloader](self->super._session, "fsDownloader");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = objc_msgSend(v26, "isDownloadingItem:", self);

        if (v27)
        {
LABEL_23:
          brc_bread_crumbs();
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v25 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
            -[BRCDocumentItem startDownloadInTask:options:etagIfLoser:stageFileName:error:].cold.1();
LABEL_21:

          goto LABEL_17;
        }
      }
      else
      {

      }
    }
    db = self->super._db;
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __79__BRCDocumentItem_startDownloadInTask_options_etagIfLoser_stageFileName_error___block_invoke;
    v28[3] = &unk_1E87610F8;
    v28[4] = self;
    v28[5] = v29;
    v28[6] = a4;
    -[BRCPQLConnection groupInBatch:](db, "groupInBatch:", v28);
LABEL_17:
    _Block_object_dispose(v29, 8);

  }
  return v15;
}

void __79__BRCDocumentItem_startDownloadInTask_options_etagIfLoser_stageFileName_error___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  _BYTE *v9;
  int v10;
  void *v11;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "serverItemByItemID:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = *(id *)(*(_QWORD *)(a1 + 32) + 248);
    objc_msgSend(v3, "downloadError");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      brc_bread_crumbs();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
        __79__BRCDocumentItem_startDownloadInTask_options_etagIfLoser_stageFileName_error___block_invoke_cold_1();

      objc_msgSend(v3, "setDownloadError:", 0);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    }
    v7 = *(_QWORD *)(a1 + 48);
    if ((v7 & 0x10) != 0)
      v8 = 18;
    else
      v8 = 2;
    if ((v7 & 4) != 0)
      v8 = 4;
    v9 = *(_BYTE **)(a1 + 32);
    if (v9[216])
      v10 = v8 | 4;
    else
      v10 = v8;
    objc_msgSend(*(id *)(a1 + 32), "updateDesiredVersionWithServerItem:options:needsSave:", v2, *(_DWORD *)(a1 + 48) & 8 | objc_msgSend(v9, "isReserved") | v10, *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "applyScheduler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "resetBackoffForServerItem:", v2);

  }
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
    objc_msgSend(*(id *)(a1 + 32), "saveToDB");

}

- (BRCLocalVersion)currentVersion
{
  return self->_currentVersion;
}

- (NSSet)resolvedConflictLoserEtags
{
  return &self->_resolvedConflictLoserEtags->super;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_liveThumbnailSignature, 0);
  objc_storeStrong((id *)&self->_desiredVersion, 0);
  objc_storeStrong((id *)&self->_syncPausedExpireTS, 0);
  objc_storeStrong((id *)&self->_syncPausedByBundleID, 0);
  objc_storeStrong((id *)&self->_liveConflictLoserEtags, 0);
  objc_storeStrong((id *)&self->_resolvedConflictLoserEtags, 0);
  objc_storeStrong((id *)&self->_currentVersion, 0);
}

- (id)documentRecordID
{
  BRCItemID *itemID;
  void *v3;
  void *v4;

  itemID = self->super._itemID;
  -[BRCServerZone zoneID](self->super._serverZone, "zoneID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCItemID contentsRecordIDInZoneID:](itemID, "contentsRecordIDInZoneID:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)baseRecord
{
  return -[BRCDocumentItem baseRecordClearAllFields:](self, "baseRecordClearAllFields:", 0);
}

- (id)baseRecordClearAllFields:(BOOL)a3
{
  _BOOL4 v3;
  _BOOL4 v5;
  __CFString *v6;
  objc_class *v7;
  __CFString *v8;
  id v9;
  void *v10;
  void *v11;

  v3 = a3;
  v5 = -[BRCLocalItem isFinderBookmark](self, "isFinderBookmark");
  v6 = CFSTR("content");
  if (v5)
    v6 = CFSTR("structure");
  v7 = (objc_class *)MEMORY[0x1E0C95048];
  v8 = v6;
  v9 = [v7 alloc];
  -[BRCDocumentItem documentRecordID](self, "documentRecordID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithRecordType:recordID:", v8, v10);

  if (v3)
  {
    objc_msgSend(v11, "setObject:forKeyedSubscript:", 0, CFSTR("fileContent"));
    objc_msgSend(v11, "setObject:forKeyedSubscript:", 0, CFSTR("bookmarkContent"));
    objc_msgSend(v11, "setObject:forKeyedSubscript:", 0, CFSTR("pkgSignature"));
    objc_msgSend(v11, "setObject:forKeyedSubscript:", 0, CFSTR("pkgContent"));
    objc_msgSend(v11, "setObject:forKeyedSubscript:", 0, CFSTR("pkgXattrs"));
    objc_msgSend(v11, "setObject:forKeyedSubscript:", 0, CFSTR("pkgManifest"));
    objc_msgSend(v11, "setObject:forKeyedSubscript:", 0, CFSTR("pkgSignature"));
    objc_msgSend(v11, "setObject:forKeyedSubscript:", 0, CFSTR("thumb1024"));
    objc_msgSend(v11, "setObject:forKeyedSubscript:", 0, CFSTR("thumbQLMetadata"));
  }
  return v11;
}

- (void)isPackage
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: self.isFinderBookmark || BRCItemTypeIsDocument(_st.type)%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)shouldBeGreedy
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_1(&dword_1CBD43000, v0, v1, "[DEBUG] don't be greedy because the app library is not greedy, even though optimize storage is disabled%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_initWithServerItem:dbRowID:.cold.1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4_2(&dword_1CBD43000, v0, (uint64_t)v0, "[CRIT] UNREACHABLE: document without a version:\n    %@\n\n   this typically indicates either of two problems:\n    - either we failed processing the last sync down and we\n      saved the structure record but not the contents record,\n    - or the server forgot to send us a contents record.%@", v1);
  OUTLINED_FUNCTION_2();
}

- (void)_initWithServerItem:dbRowID:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: item.isDocument%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)diffAgainstServerItem:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: !info || info.isDocument%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)clearVersionSignatures:isPackage:.cold.1()
{
  NSObject *v0;
  void *v1;
  uint64_t v2;
  uint8_t v3[24];
  uint64_t v4;

  OUTLINED_FUNCTION_9_0();
  v4 = *MEMORY[0x1E0C80C00];
  BRCPrettyPrintBitmap();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3_2(&dword_1CBD43000, v0, v2, "[DEBUG] Clearing signatures: %@%@", v3);

  OUTLINED_FUNCTION_6();
}

- (void)updateContentsCKInfoAndDeviceIDFromServerItem:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: self.isDocument%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)updateContentsCKInfoAndDeviceIDFromServerItem:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: serverItem.isDocument%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)updateVersionMetadataFromServerItem:preventVersionDiffs:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] Marking %@ as edited since shared because the item differs in edit mask%@");
  OUTLINED_FUNCTION_2();
}

- (void)updateVersionMetadataFromServerItem:preventVersionDiffs:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: serverItem.latestVersion%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __54__BRCDocumentItem_appDidResolveConflictLoserWithEtag___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] removing conflict loser with etag %@%@");
  OUTLINED_FUNCTION_2();
}

void __54__BRCDocumentItem_appDidResolveConflictLoserWithEtag___block_invoke_cold_2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] there is no conflict loser with etag %@%@");
  OUTLINED_FUNCTION_2();
}

- (void)markLatestSyncRequestRejectedInZone:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_1(&dword_1CBD43000, v0, v1, "[DEBUG] Clearing prev zone rowID and inserting tombstone for item which finished syncing to the new zone%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)markUploadedWithRecord:(uint64_t)a3 .cold.1(void *a1, uint64_t a2, uint64_t a3, NSObject *a4)
{
  *(_DWORD *)a3 = 138412546;
  *(_QWORD *)(a3 + 4) = a1;
  *(_WORD *)(a3 + 12) = 2112;
  *(_QWORD *)(a3 + 14) = a2;
  OUTLINED_FUNCTION_4_2(&dword_1CBD43000, a4, a3, "[CRIT] UNREACHABLE: no version on uploaded document %@%@", (uint8_t *)a3);

}

- (void)markUploadedWithRecord:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] item is now uploaded: %@%@");
  OUTLINED_FUNCTION_2();
}

- (void)markUploadedWithRecord:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: _currentVersion.uploadedAssets == nil%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)markUploadedWithRecord:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: _currentVersion.thumbnailSignature.brc_signatureIsPendingPlaceHolder || self.isDocumentBeingCopiedToNewZone%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)markUploadedWithRecord:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: _currentVersion.contentSignature.brc_signatureIsPendingPlaceHolder || self.isDocumentBeingCopiedToNewZone%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)markUploadedWithRecord:.cold.6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: _st.documentID%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)markUploadedWithRecord:.cold.7()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: _currentVersion%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)markUploadedWithRecord:.cold.8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: signature%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)markUploadedWithRecord:.cold.9()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: (fileAsset && !pkgSignature) || (!fileAsset && pkgSignature)%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)markUploadedWithRecord:.cold.10()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: record%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)markUploadedWithRecord:.cold.11()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] API MISUSE: state isn't needs-upload%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)markCrossZoneMovedForServerAssetCopyWithParentItem:path:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: self.supportsServerSideAssetCopies%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)markCrossZoneMovedForServerAssetCopyWithParentItem:path:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: parentItem%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_updateUploadJobIfNeededWithDiffs:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: !self.isDead && (!isFault || self.isDocumentBeingCopiedToNewZone)%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_updateUploadJobIfNeededWithDiffs:.cold.3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] ┏%llx updating upload jobs%@");
  OUTLINED_FUNCTION_2();
}

- (void)_updateRecursivePropertiesInDB:dbRowID:diffs:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_1(&dword_1CBD43000, v0, v1, "[DEBUG] Clearing recursive properties on item becoming reserved%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_updateRecursivePropertiesInDB:dbRowID:diffs:.cold.2()
{
  NSObject *v0;
  id v1;
  void *v2;
  uint64_t v3;
  uint8_t v4[24];
  uint64_t v5;

  OUTLINED_FUNCTION_9_0();
  v5 = *MEMORY[0x1E0C80C00];
  objc_msgSend(v1, "lastError");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_4_2(&dword_1CBD43000, v0, v3, "[CRIT] UNREACHABLE: can't update recursive properties: %@%@", v4);

  OUTLINED_FUNCTION_6();
}

- (void)_updateRecursivePropertiesInDB:dbRowID:diffs:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: db.isBatchSuspended%@", v2, v3, v4, v5, v6);
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
  OUTLINED_FUNCTION_3_1(&dword_1CBD43000, v0, v1, "[DEBUG] Updating zone info for a CZM item and deleting old zone jobs%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_updateInDB:diffs:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: _orig.st.documentID%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)startDownloadInTask:options:etagIfLoser:stageFileName:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_1(&dword_1CBD43000, v0, v1, "[DEBUG] nothing to do because download is already scheduled and there is no error%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)startDownloadInTask:options:etagIfLoser:stageFileName:error:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_1(&dword_1CBD43000, v0, v1, "[DEBUG] nothing to do because this document is already live and has no desired version%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __79__BRCDocumentItem_startDownloadInTask_options_etagIfLoser_stageFileName_error___block_invoke_cold_1()
{
  NSObject *v0;
  id v1;
  void *v2;
  uint64_t v3;
  uint8_t v4[24];
  uint64_t v5;

  OUTLINED_FUNCTION_9_0();
  v5 = *MEMORY[0x1E0C80C00];
  objc_msgSend(v1, "downloadError");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3_2(&dword_1CBD43000, v0, v3, "[DEBUG] clearing download error %@ since a download was explicitely requested%@", v4);

  OUTLINED_FUNCTION_6();
}

@end
