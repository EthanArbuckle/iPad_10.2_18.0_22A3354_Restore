@implementation BRCSaltingBatchOperation

- (id)getOrGenerateChildBasehashSaltingKey
{
  void *v3;
  void *v4;
  int v5;
  NSDictionary *v6;
  NSDictionary *parentPluginFields;
  id v8;
  void *v9;
  const __CFString *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  -[BRCClientZone childBaseSaltForItemID:](self->_parentClientZone, "childBaseSaltForItemID:", self->_parentItemID);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "brc_generateBogusKey");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v3, "isEqualToData:", v4);

    if (v5)
    {
      v11 = CFSTR("br_bougusSaltingKey");
      v12[0] = MEMORY[0x1E0C9AAB0];
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
      v6 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
      parentPluginFields = self->_parentPluginFields;
      self->_parentPluginFields = v6;

    }
    v8 = v3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "brc_generateSaltingKey");
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;

  return v9;
}

- (BRCSaltingBatchOperation)initWithParentItem:(id)a3 sessionContext:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  BRCSaltingBatchOperation *v13;
  uint64_t v14;
  BRCItemID *parentItemID;
  uint64_t v16;
  CKRecord *appLibraryRootRecord;
  uint64_t v18;
  CKRecordID *parentRecordID;
  uint64_t v20;
  BRCClientZone *parentClientZone;
  void *v22;
  BRCSaltingBatchOperation *v23;
  void *v24;
  NSObject *v25;
  NSObject *v26;
  objc_super v28;

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    if ((objc_msgSend(v6, "isDirectory") & 1) != 0)
    {
      objc_msgSend(v6, "itemID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "debugItemIDStringWithVerbose:", 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(CFSTR("metadata-salting/"), "stringByAppendingString:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v6, "serverZone");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "metadataSyncContext");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v28.receiver = self;
      v28.super_class = (Class)BRCSaltingBatchOperation;
      v13 = -[_BRCOperation initWithName:syncContext:sessionContext:](&v28, sel_initWithName_syncContext_sessionContext_, v10, v12, v7);

      if (v13)
      {
        objc_msgSend(v6, "itemID");
        v14 = objc_claimAutoreleasedReturnValue();
        parentItemID = v13->_parentItemID;
        v13->_parentItemID = (BRCItemID *)v14;

        if (-[BRCItemID isNonDesktopRoot](v13->_parentItemID, "isNonDesktopRoot"))
        {
          objc_msgSend(v6, "folderAppLibraryRootRecord");
          v16 = objc_claimAutoreleasedReturnValue();
          appLibraryRootRecord = v13->_appLibraryRootRecord;
          v13->_appLibraryRootRecord = (CKRecord *)v16;

        }
        objc_msgSend(v6, "structureRecordID");
        v18 = objc_claimAutoreleasedReturnValue();
        parentRecordID = v13->_parentRecordID;
        v13->_parentRecordID = (CKRecordID *)v18;

        objc_msgSend(v6, "clientZone");
        v20 = objc_claimAutoreleasedReturnValue();
        parentClientZone = v13->_parentClientZone;
        v13->_parentClientZone = (BRCClientZone *)v20;

        +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v13->_batchSize = objc_msgSend(v22, "enhancedDrivePrivacyBasehashSaltingBatchSize");

      }
      self = v13;
      v23 = self;
      goto LABEL_14;
    }
  }
  else
  {
    brc_bread_crumbs();
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
      -[BRCGlobalProgress didDeleteDocument:].cold.1();

  }
  brc_bread_crumbs();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
    -[BRCSaltingBatchOperation initWithParentItem:sessionContext:].cold.1();

  v23 = 0;
LABEL_14:

  return v23;
}

- (void)_createCKOperationForRecords:(id)a3 completion:(id)a4
{
  id v6;
  objc_class *v7;
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t);
  void *v15;
  id v16;
  _QWORD v17[5];

  v6 = a4;
  v7 = (objc_class *)MEMORY[0x1E0C94F10];
  v8 = a3;
  v9 = (void *)objc_msgSend([v7 alloc], "initWithRecordsToSave:recordIDsToDelete:", v8, 0);

  objc_msgSend(v9, "setSavePolicy:", 0);
  objc_msgSend(v9, "setAtomic:", 1);
  v10 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __68__BRCSaltingBatchOperation__createCKOperationForRecords_completion___block_invoke;
  v17[3] = &unk_1E8767568;
  v17[4] = self;
  objc_msgSend(v9, "setPerRecordCompletionBlock:", v17);
  v12 = v10;
  v13 = 3221225472;
  v14 = __68__BRCSaltingBatchOperation__createCKOperationForRecords_completion___block_invoke_5;
  v15 = &unk_1E8761BA8;
  v16 = v6;
  v11 = v6;
  objc_msgSend(v9, "setModifyRecordsCompletionBlock:", &v12);
  -[_BRCOperation addSubOperation:](self, "addSubOperation:", v9, v12, v13, v14, v15);

}

void __68__BRCSaltingBatchOperation__createCKOperationForRecords_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  int v10;
  id v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v6 && (objc_msgSend(v6, "brc_isCloudKitAtomicFailure") & 1) == 0)
  {
    brc_bread_crumbs();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, (os_log_type_t)0x90u))
    {
      v10 = 138412802;
      v11 = v5;
      v12 = 2112;
      v13 = v7;
      v14 = 2112;
      v15 = v8;
      _os_log_error_impl(&dword_1CBD43000, v9, (os_log_type_t)0x90u, "[ERROR] Salting operation for recordID %@ with error %@%@", (uint8_t *)&v10, 0x20u);
    }

  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 512), "handleSaltingErrorIfNeeded:record:", v7, v5);

}

uint64_t __68__BRCSaltingBatchOperation__createCKOperationForRecords_completion___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_sendRecordBatch:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  _QWORD block[4];
  id v10;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "count"))
  {
    -[BRCSaltingBatchOperation _createCKOperationForRecords:completion:](self, "_createCKOperationForRecords:completion:", v6, v7);
  }
  else
  {
    -[_BRCOperation callbackQueue](self, "callbackQueue");
    v8 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __56__BRCSaltingBatchOperation__sendRecordBatch_completion___block_invoke;
    block[3] = &unk_1E875FD48;
    v10 = v7;
    dispatch_async(v8, block);

  }
}

uint64_t __56__BRCSaltingBatchOperation__sendRecordBatch_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)_createStructureRecordWithRecordID:(id)a3 serverItem:(id)a4
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v6, "isBRAlias"))
  {
    brc_bread_crumbs();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      -[BRCSaltingBatchOperation _createStructureRecordWithRecordID:serverItem:].cold.1();

    v9 = 0;
  }
  else
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C95048]), "initWithRecordType:recordID:", CFSTR("structure"), v5);
    objc_msgSend(v6, "st");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "ckInfo");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "serializeSystemFields:", v11);

  }
  return v9;
}

- (void)_saltChildRecordFields:(id)a3 serverItem:(id)a4 basehashSalt:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  _BOOL8 v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  id v30;
  const __CFString *v31;
  _QWORD v32[2];

  v32[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!v10)
  {
    brc_bread_crumbs();
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT))
      -[BRCSaltingBatchOperation _saltChildRecordFields:serverItem:basehashSalt:].cold.1();

  }
  if (-[BRCItemID isNonDesktopRoot](self->_parentItemID, "isNonDesktopRoot"))
  {
    -[BRCSyncContext session](self->super._syncContext, "session");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCItemID appLibraryRowID](self->_parentItemID, "appLibraryRowID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "appLibraryByRowID:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "isCloudDocsAppLibrary");

  }
  else
  {
    v14 = 0;
  }
  v15 = -[BRCItemID isDocumentsFolder](self->_parentItemID, "isDocumentsFolder");
  objc_msgSend(v9, "st");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "logicalName");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "serializeFilename:forCreation:basehashSalt:parentIDIsCloudDocsRoot:parentIDIsDocumentsFolder:", v17, 0, v10, v14, v15);
  v30 = 0;
  objc_msgSend(v17, "br_stringByDeletingPathBounceNo:andPathExtension:", 0, &v30);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v30;
  v31 = CFSTR("br_saltingUpdate");
  objc_msgSend(v18, "brc_SHA256");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = v20;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, &v31, 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setPluginFields:", v21);

  objc_msgSend(v9, "st");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "seralizeBirthtime:", objc_msgSend(v22, "birthtime"));

  objc_msgSend(v9, "st");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "logicalName");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "serializeSpecialIdentityForFilename:parentIDIsCloudDocsRoot:parentIDisDocumentsFolder:", v24, v14, v15);

  objc_msgSend(v9, "parentItemIDOnServer");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "serverZone");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "validatingDirectoryReferenceInZone:", v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v27, CFSTR("parent"));

}

- (id)_createStructureRecordForServerItem:(id)a3 salt:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v15;
  NSObject *v16;

  v6 = a3;
  v7 = a4;
  if (!v6)
  {
    brc_bread_crumbs();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
      -[BRCSaltingBatchOperation _createStructureRecordForServerItem:salt:].cold.1();

  }
  objc_msgSend(v6, "itemID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "st");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "type");
  -[BRCClientZone serverZone](self->_parentClientZone, "serverZone");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "structureRecordIDForItemType:zone:aliasTargetZoneIsShared:", v10, v11, objc_msgSend(v6, "aliasTargetIsShared"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[BRCSaltingBatchOperation _createStructureRecordWithRecordID:serverItem:](self, "_createStructureRecordWithRecordID:serverItem:", v12, v6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCSaltingBatchOperation _saltChildRecordFields:serverItem:basehashSalt:](self, "_saltChildRecordFields:serverItem:basehashSalt:", v13, v6, v7);

  return v13;
}

- (id)_createStructureRecordForParentItem
{
  CKRecord *appLibraryRootRecord;
  CKRecord *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;

  if (-[BRCItemID isNonDesktopRoot](self->_parentItemID, "isNonDesktopRoot"))
  {
    appLibraryRootRecord = self->_appLibraryRootRecord;
    if (!appLibraryRootRecord)
    {
      brc_bread_crumbs();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
        -[BRCSaltingBatchOperation _createStructureRecordForParentItem].cold.2();

      appLibraryRootRecord = self->_appLibraryRootRecord;
    }
    v4 = appLibraryRootRecord;
  }
  else
  {
    -[BRCClientZone serverItemByItemID:](self->_parentClientZone, "serverItemByItemID:", self->_parentItemID);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      brc_bread_crumbs();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
        -[BRCSaltingBatchOperation _createStructureRecordForServerItem:salt:].cold.1();

    }
    -[BRCSaltingBatchOperation _createStructureRecordWithRecordID:serverItem:](self, "_createStructureRecordWithRecordID:serverItem:", self->_parentRecordID, v5);
    v4 = (CKRecord *)objc_claimAutoreleasedReturnValue();

  }
  if (!v4)
  {
    brc_bread_crumbs();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      -[BRCSaltingBatchOperation _createStructureRecordForParentItem].cold.1();

  }
  -[CKRecord brc_fillWithChildBasehashSalt:](v4, "brc_fillWithChildBasehashSalt:", self->_childBaseSalt);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_parentSaltingState);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKRecord setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v6, CFSTR("saltingState"));

  if (self->_parentPluginFields)
  {
    -[CKRecord pluginFields](v4, "pluginFields");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      -[CKRecord pluginFields](v4, "pluginFields");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)objc_msgSend(v8, "mutableCopy");

    }
    else
    {
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", -[NSDictionary count](self->_parentPluginFields, "count"));
    }

    objc_msgSend(v9, "addEntriesFromDictionary:", self->_parentPluginFields);
    -[CKRecord setPluginFields:](v4, "setPluginFields:", v9);

  }
  return v4;
}

- (void)_updateRootItemInServerDB
{
  void *v3;
  NSData *childBaseSalt;
  void *v5;
  BRCItemID *parentItemID;
  void *v7;
  id v8;

  if (!-[BRCItemID isNonDesktopRoot](self->_parentItemID, "isNonDesktopRoot"))
  {
    -[BRCClientZone serverZone](self->_parentClientZone, "serverZone");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "db");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    childBaseSalt = self->_childBaseSalt;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_parentSaltingState);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    parentItemID = self->_parentItemID;
    -[BRCClientZone dbRowID](self->_parentClientZone, "dbRowID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "execute:", CFSTR("UPDATE server_items SET child_basehash_salt = %@,  salting_state = %@ WHERE item_id = %@ AND zone_rowid = %@ "), childBaseSalt, v5, parentItemID, v7);

  }
}

- (void)_updateRootItemInClientDB
{
  NSData *childBaseSalt;
  void *v4;
  void *v5;
  id v6;

  if (-[BRCItemID isNonDesktopRoot](self->_parentItemID, "isNonDesktopRoot"))
  {
    if (!self->_parentItemEncounteredValidationError)
    {
      -[BRCClientZone db](self->_parentClientZone, "db");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      childBaseSalt = self->_childBaseSalt;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_parentSaltingState);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      -[BRCItemID appLibraryRowID](self->_parentItemID, "appLibraryRowID");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "execute:", CFSTR("UPDATE app_libraries SET child_basehash_salt = %@,  salting_state = %@ WHERE rowid = %@ "), childBaseSalt, v4, v5);

    }
  }
}

- (id)_getWorkloop
{
  void *v2;
  void *v3;

  -[BRCClientZone session](self->_parentClientZone, "session");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "clientTruthWorkloop");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_updateServerTruthForItemID:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  if (objc_msgSend(v6, "isEqualToItemID:", self->_parentItemID))
  {
    -[BRCSaltingBatchOperation _updateRootItemInServerDB](self, "_updateRootItemInServerDB");
  }
  else
  {
    -[BRCClientZone serverZone](self->_parentClientZone, "serverZone");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "db");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "execute:", CFSTR("UPDATE server_items SET basehash_salt_validation_key = %@  WHERE item_id = %@"), self->_baseHashSaltValidationKey, v6);

  }
}

- (void)_buildRecordsWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[BRCSaltingBatchOperation _getWorkloop](self, "_getWorkloop");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __56__BRCSaltingBatchOperation__buildRecordsWithCompletion___block_invoke;
  v7[3] = &unk_1E875EAA8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __56__BRCSaltingBatchOperation__buildRecordsWithCompletion___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  int v24;
  uint64_t v25;
  void *v26;
  NSObject *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  const __CFString *v31;
  const __CFString *v32;
  const __CFString *v33;
  uint64_t v34;
  uint64_t v35;
  const __CFString *v36;
  void *v37;
  NSObject *v38;
  void *v39;
  NSObject *v40;
  int v41;
  uint8_t buf[4];
  uint64_t v43;
  __int16 v44;
  const __CFString *v45;
  __int16 v46;
  const __CFString *v47;
  __int16 v48;
  void *v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v2 = +[BRCFlatLevelSaltingEnumerator newEnumeratorForItemID:clientZone:](BRCFlatLevelSaltingEnumerator, "newEnumeratorForItemID:clientZone:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 520), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 512));
  objc_msgSend(*(id *)(a1 + 32), "getOrGenerateChildBasehashSaltingKey");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 568);
  *(_QWORD *)(v4 + 568) = v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 568), "brc_truncatedSHA256");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(v7 + 560);
  *(_QWORD *)(v7 + 560) = v6;

  v9 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 512), "saltingStateForItemID:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 520));
  if (v9 >= 3)
  {
    brc_bread_crumbs();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "operationID");
      v29 = objc_claimAutoreleasedReturnValue();
      v30 = (void *)v29;
      v31 = *(const __CFString **)(*(_QWORD *)(a1 + 32) + 528);
      v32 = CFSTR("fully salted");
      if ((_DWORD)v9 == -1)
        v32 = CFSTR("no server item");
      *(_DWORD *)buf = 138413058;
      v43 = v29;
      v44 = 2112;
      v45 = v31;
      v46 = 2112;
      v47 = v32;
      v48 = 2112;
      v49 = v10;
      _os_log_fault_impl(&dword_1CBD43000, v11, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: operation %@ is trying to salt record %@ while it is in %@ state%@", buf, 0x2Au);

    }
    v12 = (void *)MEMORY[0x1E0CB35C8];
    v13 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 528), "debugDescription");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v9);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "brc_errorInvalidParameter:value:", v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, _QWORD, void *))(v13 + 16))(v13, 0, 0, v16);

  }
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 504));
  objc_msgSend(v2, "nextObject");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    v41 = v9;
    v19 = 0;
    while (1)
    {
      v20 = *(_QWORD **)(a1 + 32);
      v21 = v20[63];
      if (v21 <= ++v19)
        break;
      objc_msgSend(v20, "_createStructureRecordForServerItem:salt:", v18, v20[71]);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (v22)
        objc_msgSend(v17, "addObject:", v22);

      objc_msgSend(v2, "nextObject");
      v23 = objc_claimAutoreleasedReturnValue();

      v18 = (void *)v23;
      if (!v23)
      {
        v24 = 3;
        goto LABEL_14;
      }
    }
    v24 = 2;
LABEL_14:
    *(_DWORD *)(*(_QWORD *)(a1 + 32) + 536) = v24;
    v25 = *(_QWORD *)(a1 + 32);
    if (*(_DWORD *)(v25 + 536) == v41)
    {
      if (v21 > v19)
        goto LABEL_24;
      objc_msgSend((id)v25, "_createStructureRecordForServerItem:salt:", v18, *(_QWORD *)(v25 + 568));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v28)
      {
        brc_bread_crumbs();
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v40 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_FAULT))
          -[BRCSaltingBatchOperation _createStructureRecordForParentItem].cold.1();

      }
      objc_msgSend(v17, "addObject:", v28);
      goto LABEL_23;
    }
    LODWORD(v9) = v41;
  }
  else
  {
    *(_DWORD *)(*(_QWORD *)(a1 + 32) + 536) = 3;
    if (*(_DWORD *)(*(_QWORD *)(a1 + 32) + 536) == (_DWORD)v9)
      goto LABEL_24;
  }
  brc_bread_crumbs();
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v27 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
  {
    if (v9 > 3)
      v33 = CFSTR("no server item");
    else
      v33 = off_1E87675D8[(int)v9];
    v34 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 528);
    v35 = *(int *)(*(_QWORD *)(a1 + 32) + 536);
    if (v35 > 3)
      v36 = CFSTR("no server item");
    else
      v36 = off_1E87675D8[v35];
    *(_DWORD *)buf = 138413058;
    v43 = v34;
    v44 = 2112;
    v45 = v33;
    v46 = 2112;
    v47 = v36;
    v48 = 2112;
    v49 = v26;
    _os_log_debug_impl(&dword_1CBD43000, v27, OS_LOG_TYPE_DEBUG, "[DEBUG] Moving salting parent record ID %@ from %@ to %@%@", buf, 0x2Au);
  }

  objc_msgSend(*(id *)(a1 + 32), "_createStructureRecordForParentItem");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v28)
  {
    brc_bread_crumbs();
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_FAULT))
      -[BRCSaltingBatchOperation _createStructureRecordForParentItem].cold.1();

  }
  objc_msgSend(v17, "insertObject:atIndex:", v28, 0);
LABEL_23:

LABEL_24:
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)finishWithResult:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  void (**metadataCompletionBlock)(id, uint64_t, BOOL, id);
  id v9;
  objc_super v10;

  v6 = a3;
  v7 = a4;
  metadataCompletionBlock = (void (**)(id, uint64_t, BOOL, id))self->_metadataCompletionBlock;
  if (metadataCompletionBlock)
  {
    metadataCompletionBlock[2](metadataCompletionBlock, objc_msgSend(v6, "BOOLValue"), self->_parentItemEncounteredValidationError, v7);
    v9 = self->_metadataCompletionBlock;
    self->_metadataCompletionBlock = 0;

  }
  v10.receiver = self;
  v10.super_class = (Class)BRCSaltingBatchOperation;
  -[_BRCOperation finishWithResult:error:](&v10, sel_finishWithResult_error_, v6, v7);

}

- (void)_updateSaltingInfoInServerDBWithRecords:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  BRCSaltingBatchOperation *v12;

  v4 = a3;
  -[BRCClientZone serverZone](self->_parentClientZone, "serverZone");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "db");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __68__BRCSaltingBatchOperation__updateSaltingInfoInServerDBWithRecords___block_invoke;
  v9[3] = &unk_1E8761D60;
  v10 = v4;
  v11 = v5;
  v12 = self;
  v7 = v5;
  v8 = v4;
  objc_msgSend(v6, "performWithFlags:action:", 25, v9);

}

uint64_t __68__BRCSaltingBatchOperation__updateSaltingInfoInServerDBWithRecords___block_invoke(id *a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v2 = a1[4];
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v16;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v16 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v6);
        objc_msgSend(v7, "recordID", (_QWORD)v15);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1[5], "session");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "brc_itemIDWithSession:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v7, "brc_oplockMergeEtag");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
        {

        }
        else
        {
          objc_msgSend(v7, "brc_updateDroppedReason");
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v12)
          {
            objc_msgSend(a1[6], "_updateServerTruthForItemID:", v10);
            goto LABEL_12;
          }
        }
        if (objc_msgSend(v10, "isEqualToItemID:", *((_QWORD *)a1[6] + 65)))
          *((_BYTE *)a1[6] + 576) = 1;
        *((_DWORD *)a1[6] + 134) = 2;
LABEL_12:

        ++v6;
      }
      while (v4 != v6);
      v13 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      v4 = v13;
    }
    while (v13);
  }

  return 1;
}

- (void)_updateSaltingInfoInClientDBWithRecords:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[BRCClientZone db](self->_parentClientZone, "db");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __68__BRCSaltingBatchOperation__updateSaltingInfoInClientDBWithRecords___block_invoke;
  v7[3] = &unk_1E875D8F0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "performWithFlags:action:", 25, v7);

}

uint64_t __68__BRCSaltingBatchOperation__updateSaltingInfoInClientDBWithRecords___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_updateRootItemInClientDB");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 512), "learnCKInfosFromSavedRecords:isOutOfBandModifyRecords:", *(_QWORD *)(a1 + 40), 1);
  return 1;
}

- (void)main
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __32__BRCSaltingBatchOperation_main__block_invoke;
  v2[3] = &unk_1E87675B8;
  v2[4] = self;
  -[BRCSaltingBatchOperation _buildRecordsWithCompletion:](self, "_buildRecordsWithCompletion:", v2);
}

uint64_t __32__BRCSaltingBatchOperation_main__block_invoke(uint64_t a1, uint64_t a2, char a3)
{
  void *v3;
  _QWORD v5[5];
  char v6;

  v3 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __32__BRCSaltingBatchOperation_main__block_invoke_2;
  v5[3] = &unk_1E8767590;
  v5[4] = v3;
  v6 = a3;
  return objc_msgSend(v3, "_sendRecordBatch:completion:", a2, v5);
}

void __32__BRCSaltingBatchOperation_main__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    brc_bread_crumbs();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, (os_log_type_t)0x90u))
      __32__BRCSaltingBatchOperation_main__block_invoke_2_cold_1();

    objc_msgSend(*(id *)(a1 + 32), "completedWithResult:error:", 0, v6);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_updateSaltingInfoInServerDBWithRecords:", v5);
    objc_msgSend(*(id *)(a1 + 32), "_updateSaltingInfoInClientDBWithRecords:", v5);
    v9 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 40));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "completedWithResult:error:", v10, 0);

  }
}

- (id)metadataCompletionBlock
{
  return self->_metadataCompletionBlock;
}

- (void)setMetadataCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 584);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_metadataCompletionBlock, 0);
  objc_storeStrong((id *)&self->_childBaseSalt, 0);
  objc_storeStrong((id *)&self->_baseHashSaltValidationKey, 0);
  objc_storeStrong((id *)&self->_appLibraryRootRecord, 0);
  objc_storeStrong((id *)&self->_parentPluginFields, 0);
  objc_storeStrong((id *)&self->_parentRecordID, 0);
  objc_storeStrong((id *)&self->_parentItemID, 0);
  objc_storeStrong((id *)&self->_parentClientZone, 0);
}

- (void)initWithParentItem:sessionContext:.cold.1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_1();
  _os_log_debug_impl(&dword_1CBD43000, v0, OS_LOG_TYPE_DEBUG, "[DEBUG] Salting batch operation is not allowed on %@%@", v1, 0x16u);
  OUTLINED_FUNCTION_2();
}

- (void)_createStructureRecordWithRecordID:serverItem:.cold.1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_1();
  _os_log_fault_impl(&dword_1CBD43000, v0, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: We can't salt alias items %@%@", v1, 0x16u);
  OUTLINED_FUNCTION_2();
}

- (void)_saltChildRecordFields:serverItem:basehashSalt:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: basehashSalt%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_createStructureRecordForServerItem:salt:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: si != nil%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_createStructureRecordForParentItem
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: _appLibraryRootRecord != nil%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __32__BRCSaltingBatchOperation_main__block_invoke_2_cold_1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_1CBD43000, v0, (os_log_type_t)0x90u, "[ERROR] failed sending salted records - %@%@", v1, 0x16u);
  OUTLINED_FUNCTION_2();
}

@end
