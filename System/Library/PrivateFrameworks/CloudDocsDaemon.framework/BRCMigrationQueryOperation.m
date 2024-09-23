@implementation BRCMigrationQueryOperation

+ (id)documentSharesMigrationKey
{
  return CFSTR("document-shares");
}

+ (id)folderSharesMigrationKey
{
  return CFSTR("folder-shares");
}

+ (id)folderShareAliasesMigrationKey
{
  return CFSTR("folder-share-aliases");
}

+ (id)allMigrationKeysOrdered
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[4];

  v8[3] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "documentSharesMigrationKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "folderSharesMigrationKey", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v4;
  objc_msgSend(a1, "folderShareAliasesMigrationKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[2] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BRCMigrationQueryOperation)initWithServerZone:(id)a3 migrationKey:(id)a4 continuationCursor:(id)a5 sessionContext:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  BRCMigrationQueryOperation *v16;
  NSMutableArray *v17;
  NSMutableArray *shareIDsToFetch;
  void *v19;
  objc_super v21;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  objc_msgSend(v11, "metadataSyncContext");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v21.receiver = self;
  v21.super_class = (Class)BRCMigrationQueryOperation;
  v16 = -[_BRCOperation initWithName:syncContext:sessionContext:](&v21, sel_initWithName_syncContext_sessionContext_, CFSTR("migration-query"), v15, v14);

  if (v16)
  {
    objc_storeStrong((id *)&v16->super._serverZone, a3);
    objc_storeStrong((id *)&v16->_migrationKey, a4);
    objc_storeStrong((id *)&v16->_continuationCursor, a5);
    v17 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    shareIDsToFetch = v16->_shareIDsToFetch;
    v16->_shareIDsToFetch = v17;

    objc_msgSend(MEMORY[0x1E0C94F88], "br_osUpgradeMigration");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[_BRCOperation setGroup:](v16, "setGroup:", v19);

  }
  return v16;
}

- (BOOL)shouldRetryForError:(id)a3
{
  return 0;
}

- (BOOL)_saveFetchedRecords:(id)a3 cursor:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  const char *v26;
  _QWORD v27[4];
  id v28;
  id v29;
  uint64_t *v30;
  _QWORD v31[5];
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  uint64_t *v37;
  id *v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t v42;
  uint8_t buf[4];
  const char *v44;
  __int16 v45;
  const char *v46;
  __int16 v47;
  void *v48;
  __int16 v49;
  void *v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  -[BRCServerZone session](self->super._serverZone, "session");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "serverState");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = 0;
  v40 = &v39;
  v41 = 0x2020000000;
  v42 = 0;
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithObjects:", self->super._serverZone, 0);
  objc_msgSend(v10, "serverDB");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = MEMORY[0x1E0C809B0];
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __63__BRCMigrationQueryOperation__saveFetchedRecords_cursor_error___block_invoke;
  v31[3] = &unk_1E8763578;
  v31[4] = self;
  v15 = v8;
  v32 = v15;
  v16 = v12;
  v33 = v16;
  v38 = a5;
  v17 = v11;
  v34 = v17;
  v18 = v9;
  v35 = v18;
  v37 = &v39;
  v19 = v10;
  v36 = v19;
  objc_msgSend(v13, "performWithFlags:action:", 9, v31);

  v20 = v40[3];
  if (v20)
  {
    objc_msgSend(v19, "clientDB");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = v14;
    v27[1] = 3221225472;
    v27[2] = __63__BRCMigrationQueryOperation__saveFetchedRecords_cursor_error___block_invoke_13;
    v27[3] = &unk_1E87635A0;
    v28 = v16;
    v29 = v19;
    v30 = &v39;
    objc_msgSend(v21, "performWithFlags:action:", 37, v27);

    v22 = v28;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "brc_errorSyncBlocked");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (v22)
    {
      brc_bread_crumbs();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, (os_log_type_t)0x90u))
      {
        v26 = "(passed to caller)";
        *(_DWORD *)buf = 136315906;
        v44 = "-[BRCMigrationQueryOperation _saveFetchedRecords:cursor:error:]";
        v45 = 2080;
        if (!a5)
          v26 = "(ignored by caller)";
        v46 = v26;
        v47 = 2112;
        v48 = v22;
        v49 = 2112;
        v50 = v23;
        _os_log_error_impl(&dword_1CBD43000, v24, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
      }

    }
    if (a5)
      objc_storeStrong(a5, v22);
  }

  _Block_object_dispose(&v39, 8);
  return v20 != 0;
}

uint64_t __63__BRCMigrationQueryOperation__saveFetchedRecords_cursor_error___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  char v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  void *v18;
  NSObject *v19;
  id *v20;
  const char *v22;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  id v28;
  uint8_t v29[128];
  uint8_t buf[4];
  const char *v31;
  __int16 v32;
  const char *v33;
  __int16 v34;
  id v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 40);
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 504);
  v4 = *(_QWORD *)(a1 + 48);
  v28 = 0;
  v5 = objc_msgSend(v3, "saveQueryRecords:zonesNeedingAllocRanks:error:", v2, v4, &v28);
  v6 = v28;
  v7 = v28;
  v8 = v7;
  if ((v5 & 1) != 0)
  {
    v9 = *(void **)(a1 + 56);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 504), "mangledID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "migrationQueryForMangledID:key:didUpdateWithCursor:", v10, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 512), *(_QWORD *)(a1 + 64));

    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v11 = *(id *)(a1 + 48);
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v25;
      while (2)
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v25 != v14)
            objc_enumerationMutation(v11);
          if (!objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * v15), "allocateRanksWhenCaughtUp:", 1, (_QWORD)v24))
          {

            goto LABEL_18;
          }
          ++v15;
        }
        while (v13 != v15);
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
        if (v13)
          continue;
        break;
      }
    }

    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = objc_msgSend(*(id *)(a1 + 56), "nextRank");
    v16 = objc_msgSend(*(id *)(a1 + 72), "saveServerZoneToDB:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 504));
  }
  else
  {
    v17 = v7;
    if (v17)
    {
      brc_bread_crumbs();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, (os_log_type_t)0x90u))
      {
        v22 = "(passed to caller)";
        v23 = *(_QWORD *)(a1 + 88);
        *(_DWORD *)buf = 136315906;
        v31 = "-[BRCMigrationQueryOperation _saveFetchedRecords:cursor:error:]_block_invoke";
        if (!v23)
          v22 = "(ignored by caller)";
        v32 = 2080;
        v33 = v22;
        v34 = 2112;
        v35 = v17;
        v36 = 2112;
        v37 = v18;
        _os_log_error_impl(&dword_1CBD43000, v19, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
      }

    }
    v20 = *(id **)(a1 + 88);
    if (v20)
      objc_storeStrong(v20, v6);

LABEL_18:
    v16 = 0;
  }

  return v16;
}

uint64_t __63__BRCMigrationQueryOperation__saveFetchedRecords_cursor_error___block_invoke_13(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v2);
        v7 = *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v6);
        objc_msgSend(*(id *)(a1 + 40), "applyScheduler", (_QWORD)v10);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "generatedRanksForZone:upToRank:", v7, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24));

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v4);
  }

  return 1;
}

- (BOOL)_updatedContinuationCursor:(id)a3 fetchedRecords:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  BRCServerZone *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  BOOL v16;
  void *v17;
  id v19;
  uint64_t v20;
  void *v21;
  _QWORD v22[4];
  id v23;
  BRCMigrationQueryOperation *v24;
  id v25;
  uint64_t *v26;
  id *v27;
  _QWORD v28[4];
  id v29;
  BRCServerZone *v30;
  BRCMigrationQueryOperation *v31;
  id v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  char v36;
  uint8_t buf[4];
  id v38;
  __int16 v39;
  uint64_t v40;
  __int16 v41;
  void *v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  -[BRCSyncContext session](self->super.super._syncContext, "session");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = self->super._serverZone;
  objc_msgSend(v10, "serverState");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = 0;
  v34 = &v33;
  v35 = 0x2020000000;
  v36 = 1;
  brc_bread_crumbs();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    prettyPrintQueryCursor(self->_continuationCursor);
    v19 = (id)objc_claimAutoreleasedReturnValue();
    prettyPrintQueryCursor(v8);
    v20 = objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v38 = v19;
    v39 = 2112;
    v21 = (void *)v20;
    v40 = v20;
    v41 = 2112;
    v42 = v13;
    _os_log_debug_impl(&dword_1CBD43000, v14, OS_LOG_TYPE_DEBUG, "[DEBUG] share-query progressed from cursor:%@ to cursor:%@%@", buf, 0x20u);

  }
  if (-[NSMutableArray count](self->_shareIDsToFetch, "count"))
  {
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C94E18]), "initWithRecordIDs:", self->_shareIDsToFetch);
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __78__BRCMigrationQueryOperation__updatedContinuationCursor_fetchedRecords_error___block_invoke_2;
    v22[3] = &unk_1E87635F0;
    v26 = &v33;
    v27 = a5;
    v23 = v9;
    v24 = self;
    v25 = v8;
    objc_msgSend(v15, "setFetchRecordsCompletionBlock:", v22);
    -[_BRCOperation addSubOperation:](self, "addSubOperation:", v15);
    objc_msgSend(v15, "waitUntilFinished");
    -[NSMutableArray removeAllObjects](self->_shareIDsToFetch, "removeAllObjects");
    v16 = *((_BYTE *)v34 + 24) != 0;

  }
  else
  {
    objc_msgSend(v10, "serverDB");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __78__BRCMigrationQueryOperation__updatedContinuationCursor_fetchedRecords_error___block_invoke;
    v28[3] = &unk_1E87635C8;
    v29 = v12;
    v30 = v11;
    v31 = self;
    v32 = v8;
    objc_msgSend(v17, "performWithFlags:action:", 1, v28);

    v16 = 1;
    v15 = v29;
  }

  _Block_object_dispose(&v33, 8);
  return v16;
}

uint64_t __78__BRCMigrationQueryOperation__updatedContinuationCursor_fetchedRecords_error___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "mangledID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "migrationQueryForMangledID:key:didUpdateWithCursor:", v3, *(_QWORD *)(*(_QWORD *)(a1 + 48) + 512), *(_QWORD *)(a1 + 56));

  return 1;
}

void __78__BRCMigrationQueryOperation__updatedContinuationCursor_fetchedRecords_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  NSObject *v10;
  id *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  uint64_t v16;
  char v17;
  id *v18;
  uint64_t v19;
  const char *v20;
  _BYTE obj[12];
  __int16 v22;
  const char *v23;
  __int16 v24;
  id v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = v6;
  if (v6)
  {
    v8 = v6;
    brc_bread_crumbs();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, (os_log_type_t)0x90u))
    {
      v19 = *(_QWORD *)(a1 + 64);
      *(_DWORD *)obj = 136315906;
      if (v19)
        v20 = "(passed to caller)";
      else
        v20 = "(ignored by caller)";
      *(_QWORD *)&obj[4] = "-[BRCMigrationQueryOperation _updatedContinuationCursor:fetchedRecords:error:]_block_invoke_2";
      v22 = 2080;
      v23 = v20;
      v24 = 2112;
      v25 = v8;
      v26 = 2112;
      v27 = v9;
      _os_log_error_impl(&dword_1CBD43000, v10, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", obj, 0x2Au);
    }

    v11 = *(id **)(a1 + 64);
    if (v11)
      objc_storeStrong(v11, a3);

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
  }
  else
  {
    *(_QWORD *)obj = 0;
    if (*(_QWORD *)(a1 + 32))
      v12 = *(void **)(a1 + 32);
    else
      v12 = (void *)MEMORY[0x1E0C9AA60];
    objc_msgSend(a2, "allValues", *(_QWORD *)obj);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "arrayByAddingObjectsFromArray:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = objc_msgSend(*(id *)(a1 + 40), "_saveFetchedRecords:cursor:error:", v14, *(_QWORD *)(a1 + 48), obj);
    v16 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    if (*(_BYTE *)(v16 + 24))
      v17 = v15;
    else
      v17 = 0;
    *(_BYTE *)(v16 + 24) = v17;
    if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
    {
      v18 = *(id **)(a1 + 64);
      if (v18)
        objc_storeStrong(v18, *(id *)obj);
    }

  }
}

- (void)_performQuery:(id)a3 recordFetchedBlock:(id)a4 cursorUpdatedBlock:(id)a5 desiredKeys:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  void *v14;
  void *v15;
  unsigned int v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  id v25;
  id v26;
  id v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  id v35;
  _QWORD v36[5];
  id v37;
  _QWORD v38[5];
  id v39;
  void *v40;
  _QWORD v41[4];
  id v42;
  void *v43;
  uint64_t v44[3];
  uint8_t buf[4];
  uint64_t v46;
  __int16 v47;
  uint64_t v48;
  __int16 v49;
  _QWORD v50[5];

  v50[2] = *MEMORY[0x1E0C80C00];
  v35 = a3;
  v12 = a4;
  v33 = a5;
  v13 = a6;
  v34 = a7;
  -[BRCServerZone mangledID](self->super._serverZone, "mangledID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = objc_msgSend(v15, "maxRecordCountInQuerySharedRecordsOperation");
  memset(v44, 0, sizeof(v44));
  __brc_create_section(0, (uint64_t)"-[BRCMigrationQueryOperation _performQuery:recordFetchedBlock:cursorUpdatedBlock:desiredKeys:completion:]", 178, v44);
  brc_bread_crumbs();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    v28 = v44[0];
    -[BRCServerZone zoneName](self->super._serverZone, "zoneName");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218754;
    v46 = v28;
    v47 = 2112;
    v48 = (uint64_t)v29;
    v49 = 1024;
    LODWORD(v50[0]) = v16;
    WORD2(v50[0]) = 2112;
    *(_QWORD *)((char *)v50 + 6) = v17;
    _os_log_debug_impl(&dword_1CBD43000, v18, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx query for %@ starting with batchSize:%u%@", buf, 0x26u);

  }
  if (self->_continuationCursor)
  {
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C95038]), "initWithCursor:", self->_continuationCursor);
    brc_bread_crumbs();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v19, "operationID");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      prettyPrintQueryCursor(self->_continuationCursor);
      v22 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v46 = (uint64_t)v32;
      v47 = 2112;
      v31 = (void *)v22;
      v48 = v22;
      v49 = 2112;
      v50[0] = v20;
      _os_log_debug_impl(&dword_1CBD43000, v21, OS_LOG_TYPE_DEBUG, "[DEBUG] created query %@ from cursor:%@%@", buf, 0x20u);

    }
  }
  else
  {
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C95038]), "initWithQuery:", v35);
    brc_bread_crumbs();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v19, "operationID");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v46 = (uint64_t)v30;
      v47 = 2112;
      v48 = (uint64_t)v35;
      v49 = 2112;
      v50[0] = v20;
      _os_log_debug_impl(&dword_1CBD43000, v21, OS_LOG_TYPE_DEBUG, "[DEBUG] created query %@ from query:%@%@", buf, 0x20u);

    }
  }

  objc_msgSend(v19, "setDesiredKeys:", v13);
  objc_msgSend(v19, "setResultsLimit:", v16);
  -[BRCServerZone zoneID](self->super._serverZone, "zoneID");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setZoneID:", v23);

  objc_msgSend(v19, "setShouldFetchAssetContent:", 0);
  objc_msgSend(v19, "setFetchAllResults:", 1);
  v24 = MEMORY[0x1E0C809B0];
  v41[0] = MEMORY[0x1E0C809B0];
  v41[1] = 3221225472;
  v41[2] = __105__BRCMigrationQueryOperation__performQuery_recordFetchedBlock_cursorUpdatedBlock_desiredKeys_completion___block_invoke;
  v41[3] = &unk_1E8763618;
  v25 = v12;
  v42 = v25;
  v43 = v19;
  objc_msgSend(v19, "setRecordFetchedBlock:", v41);
  v38[0] = v24;
  v38[1] = 3221225472;
  v38[2] = __105__BRCMigrationQueryOperation__performQuery_recordFetchedBlock_cursorUpdatedBlock_desiredKeys_completion___block_invoke_2;
  v38[3] = &unk_1E8763640;
  v40 = v19;
  v38[4] = self;
  v26 = v34;
  v39 = v26;
  objc_msgSend(v19, "setQueryCompletionBlock:", v38);
  v36[0] = v24;
  v36[1] = 3221225472;
  v36[2] = __105__BRCMigrationQueryOperation__performQuery_recordFetchedBlock_cursorUpdatedBlock_desiredKeys_completion___block_invoke_24;
  v36[3] = &unk_1E8763668;
  v36[4] = self;
  v27 = v33;
  v37 = v27;
  objc_msgSend(v19, "setQueryCursorFetchedBlock:", v36);
  -[_BRCOperation addSubOperation:](self, "addSubOperation:", v19);

  __brc_leave_section(v44);
}

uint64_t __105__BRCMigrationQueryOperation__performQuery_recordFetchedBlock_cursorUpdatedBlock_desiredKeys_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), a2);
}

void __105__BRCMigrationQueryOperation__performQuery_recordFetchedBlock_cursorUpdatedBlock_desiredKeys_completion___block_invoke_2(_QWORD *a1, void *a2, void *a3)
{
  id v6;
  __CFString *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  const __CFString *v11;
  uint64_t v12[3];
  uint8_t buf[4];
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  const __CFString *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a3;
  memset(v12, 0, sizeof(v12));
  __brc_create_section(0, (uint64_t)"-[BRCMigrationQueryOperation _performQuery:recordFetchedBlock:cursorUpdatedBlock:desiredKeys:completion:]_block_invoke_2", 201, v12);
  brc_bread_crumbs();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    v10 = a1[6];
    v11 = CFSTR("success");
    if (v7)
      v11 = v7;
    *(_DWORD *)buf = 134218754;
    v14 = v12[0];
    v15 = 2112;
    v16 = v10;
    v17 = 2112;
    v18 = v11;
    v19 = 2112;
    v20 = v8;
    _os_log_debug_impl(&dword_1CBD43000, v9, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx handling result of %@: %@%@", buf, 0x2Au);
  }

  objc_storeStrong((id *)(a1[4] + 520), a2);
  (*(void (**)(void))(a1[5] + 16))();
  __brc_leave_section(v12);

}

void __105__BRCMigrationQueryOperation__performQuery_recordFetchedBlock_cursorUpdatedBlock_desiredKeys_completion___block_invoke_24(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 520), a2);
  v4 = a2;
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)_performAfterQueryingForShareAliasesWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  _QWORD *v19;
  _QWORD v20[5];
  id v21;
  _QWORD *v22;
  _QWORD v23[4];
  id v24;
  _QWORD v25[5];
  id v26;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("brPrefix"), CFSTR("shareAlias/"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C95010]), "initWithRecordType:predicate:", CFSTR("RecordPrefixList"), v5);
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x3032000000;
  v25[3] = __Block_byref_object_copy__29;
  v25[4] = __Block_byref_object_dispose__29;
  v26 = 0;
  v7 = (void *)objc_opt_new();
  v8 = MEMORY[0x1E0C809B0];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __81__BRCMigrationQueryOperation__performAfterQueryingForShareAliasesWithCompletion___block_invoke;
  v23[3] = &unk_1E8763690;
  v9 = v7;
  v24 = v9;
  v10 = (void *)MEMORY[0x1D17A6DB0](v23);
  v20[0] = v8;
  v20[1] = 3221225472;
  v20[2] = __81__BRCMigrationQueryOperation__performAfterQueryingForShareAliasesWithCompletion___block_invoke_37;
  v20[3] = &unk_1E87636B8;
  v20[4] = self;
  v11 = v9;
  v21 = v11;
  v22 = v25;
  v12 = (void *)MEMORY[0x1D17A6DB0](v20);
  objc_msgSend(MEMORY[0x1E0C95048], "desiredKeysWithMask:", 185);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v8;
  v16[1] = 3221225472;
  v16[2] = __81__BRCMigrationQueryOperation__performAfterQueryingForShareAliasesWithCompletion___block_invoke_2;
  v16[3] = &unk_1E87636E0;
  v16[4] = self;
  v14 = v11;
  v17 = v14;
  v19 = v25;
  v15 = v4;
  v18 = v15;
  -[BRCMigrationQueryOperation _performQuery:recordFetchedBlock:cursorUpdatedBlock:desiredKeys:completion:](self, "_performQuery:recordFetchedBlock:cursorUpdatedBlock:desiredKeys:completion:", v6, v10, v12, v13, v16);

  _Block_object_dispose(v25, 8);
}

void __81__BRCMigrationQueryOperation__performAfterQueryingForShareAliasesWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  brc_bread_crumbs();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v6, "recordID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "etag");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "operationID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138413058;
    v13 = v9;
    v14 = 2112;
    v15 = v10;
    v16 = 2112;
    v17 = v11;
    v18 = 2112;
    v19 = v7;
    _os_log_debug_impl(&dword_1CBD43000, v8, OS_LOG_TYPE_DEBUG, "[DEBUG] fetched share alias record %@ with etag:%@ in query %@%@", (uint8_t *)&v12, 0x2Au);

  }
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v6);

}

uint64_t __81__BRCMigrationQueryOperation__performAfterQueryingForShareAliasesWithCompletion___block_invoke_37(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "_saveFetchedRecords:cursor:error:", *(_QWORD *)(a1 + 40), a2, *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  return objc_msgSend(*(id *)(a1 + 40), "removeAllObjects");
}

void __81__BRCMigrationQueryOperation__performAfterQueryingForShareAliasesWithCompletion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (!v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "_saveFetchedRecords:cursor:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 520), *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
    objc_msgSend(*(id *)(a1 + 40), "removeAllObjects");
    v4 = 0;
  }
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
    v4 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
  (*(void (**)(_QWORD, _QWORD, id))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), v4);

}

- (void)_performAfterQueryingForShareIDsOfFolders:(BOOL)a3 completion:(id)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  id v8;
  __CFString **v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  _QWORD v19[5];
  id v20;
  id v21;
  _QWORD *v22;
  _QWORD v23[5];
  id v24;
  _QWORD *v25;
  _QWORD v26[5];
  id v27;
  _QWORD v28[5];
  id v29;

  v4 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K != NULL"), *MEMORY[0x1E0C94A08]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_alloc(MEMORY[0x1E0C95010]);
  v9 = kBRRecordTypeStructure;
  if (!v4)
    v9 = kBRRecordTypeContent;
  v10 = (void *)objc_msgSend(v8, "initWithRecordType:predicate:", *v9, v7);
  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x3032000000;
  v28[3] = __Block_byref_object_copy__29;
  v28[4] = __Block_byref_object_dispose__29;
  v29 = 0;
  v11 = (void *)objc_opt_new();
  v12 = MEMORY[0x1E0C809B0];
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __83__BRCMigrationQueryOperation__performAfterQueryingForShareIDsOfFolders_completion___block_invoke;
  v26[3] = &unk_1E8763708;
  v26[4] = self;
  v13 = v11;
  v27 = v13;
  v14 = (void *)MEMORY[0x1D17A6DB0](v26);
  v23[0] = v12;
  v23[1] = 3221225472;
  v23[2] = __83__BRCMigrationQueryOperation__performAfterQueryingForShareIDsOfFolders_completion___block_invoke_43;
  v23[3] = &unk_1E87636B8;
  v23[4] = self;
  v15 = v13;
  v24 = v15;
  v25 = v28;
  v16 = (void *)MEMORY[0x1D17A6DB0](v23);
  v19[0] = v12;
  v19[1] = 3221225472;
  v19[2] = __83__BRCMigrationQueryOperation__performAfterQueryingForShareIDsOfFolders_completion___block_invoke_2;
  v19[3] = &unk_1E8763730;
  v22 = v28;
  v19[4] = self;
  v17 = v15;
  v20 = v17;
  v18 = v6;
  v21 = v18;
  -[BRCMigrationQueryOperation _performQuery:recordFetchedBlock:cursorUpdatedBlock:desiredKeys:completion:](self, "_performQuery:recordFetchedBlock:cursorUpdatedBlock:desiredKeys:completion:", v10, v14, v16, MEMORY[0x1E0C9AA60], v19);

  _Block_object_dispose(v28, 8);
}

void __83__BRCMigrationQueryOperation__performAfterQueryingForShareIDsOfFolders_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  id v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(v6, "recordID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 248), "session");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "brc_itemIDWithSession:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "addObject:", v6);
  if (v9)
  {
    brc_bread_crumbs();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v6, "recordID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "etag");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "operationID");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138413058;
      v21 = v16;
      v22 = 2112;
      v23 = v17;
      v24 = 2112;
      v25 = v18;
      v26 = 2112;
      v27 = v10;
      _os_log_debug_impl(&dword_1CBD43000, v11, OS_LOG_TYPE_DEBUG, "[DEBUG] fetched shared record %@ with etag:%@ in query %@%@", (uint8_t *)&v20, 0x2Au);

    }
    v12 = objc_alloc(MEMORY[0x1E0C95070]);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 504), "zoneID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v12, "initShareIDWithItemID:zoneID:", v9, v13);

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 528), "addObject:", v14);
  }
  else
  {
    brc_bread_crumbs();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
    {
      objc_msgSend(v5, "operationID");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138412802;
      v21 = v7;
      v22 = 2112;
      v23 = v19;
      v24 = 2112;
      v25 = v14;
      _os_log_fault_impl(&dword_1CBD43000, v15, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: unable to parse itemID from %@ in query %@%@", (uint8_t *)&v20, 0x20u);

    }
  }

}

uint64_t __83__BRCMigrationQueryOperation__performAfterQueryingForShareIDsOfFolders_completion___block_invoke_43(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  v3 = *(void **)(a1 + 32);
  v4 = *(void **)(a1 + 40);
  v5 = a2;
  v6 = (void *)objc_msgSend(v4, "copy");
  objc_msgSend(v3, "_updatedContinuationCursor:fetchedRecords:error:", v5, v6, *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
    objc_msgSend(*(id *)(a1 + 32), "cancel");
  return objc_msgSend(*(id *)(a1 + 40), "removeAllObjects");
}

void __83__BRCMigrationQueryOperation__performAfterQueryingForShareIDsOfFolders_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;

  v9 = a2;
  v5 = a3;
  if (!v5 && !*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
  {
    v6 = *(void **)(a1 + 32);
    v7 = (void *)objc_msgSend(*(id *)(a1 + 40), "copy");
    objc_msgSend(v6, "_updatedContinuationCursor:fetchedRecords:error:", 0, v7, *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);

  }
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
    v8 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
  else
    v8 = v5;
  (*(void (**)(_QWORD, _QWORD, id))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), v8);

}

- (void)main
{
  *(_DWORD *)buf = 136315394;
  *(_QWORD *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2112;
  *(_QWORD *)(buf + 14) = a2;
  _os_log_fault_impl(&dword_1CBD43000, log, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: unknown migration %s%@", buf, 0x16u);
}

uint64_t __34__BRCMigrationQueryOperation_main__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "completedWithResult:error:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 520), a3);
}

uint64_t __34__BRCMigrationQueryOperation_main__block_invoke_46(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "completedWithResult:error:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 520), a3);
}

- (void)finishWithResult:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  NSString *migrationKey;
  void *v15;
  objc_super v16;
  _QWORD block[5];
  uint64_t v18[3];
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  NSString *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  memset(v18, 0, sizeof(v18));
  __brc_create_section(0, (uint64_t)"-[BRCMigrationQueryOperation finishWithResult:error:]", 320, v18);
  brc_bread_crumbs();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    v13 = v18[0];
    migrationKey = self->_migrationKey;
    -[_BRCOperation operationID](self, "operationID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218754;
    v20 = v13;
    v21 = 2112;
    v22 = migrationKey;
    v23 = 2112;
    v24 = v15;
    v25 = 2112;
    v26 = v8;
    _os_log_debug_impl(&dword_1CBD43000, v9, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx migration-query '%@' %@ completed%@", buf, 0x2Au);

  }
  if (v7)
  {

    v6 = 0;
  }
  else
  {
    -[BRCSyncContext session](self->super.super._syncContext, "session");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "clientDB");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "serialQueue");
    v12 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __53__BRCMigrationQueryOperation_finishWithResult_error___block_invoke;
    block[3] = &unk_1E875D500;
    block[4] = self;
    dispatch_sync(v12, block);

  }
  v16.receiver = self;
  v16.super_class = (Class)BRCMigrationQueryOperation;
  -[BRCSyncDownOperation finishWithResult:error:](&v16, sel_finishWithResult_error_, v6, v7);
  __brc_leave_section(v18);

}

void __53__BRCMigrationQueryOperation_finishWithResult_error___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 504), "clientZone");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "scheduleSyncDown");

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shareIDsToFetch, 0);
  objc_storeStrong((id *)&self->_continuationCursor, 0);
  objc_storeStrong((id *)&self->_migrationKey, 0);
}

@end
