@implementation BRCLocateRecordOperation

- (BRCLocateRecordOperation)initWithRecordID:(id)a3 serverZone:(id)a4 isUserWaiting:(BOOL)a5 maxBackoff:(double)a6 sessionContext:(id)a7
{
  _BOOL8 v9;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  BRCLocateRecordOperation *v23;
  void *v24;
  uint64_t v25;
  NSMutableArray *locateRecordCompletionBlocks;
  objc_super v28;
  uint8_t buf[4];
  id v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v9 = a5;
  v35 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v15 = a7;
  objc_msgSend(v14, "session");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "brc_itemIDWithSession:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  brc_bread_crumbs();
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412802;
    v30 = v13;
    v31 = 2112;
    v32 = v17;
    v33 = 2112;
    v34 = v18;
    _os_log_impl(&dword_1CBD43000, v19, OS_LOG_TYPE_INFO, "[INFO] Request to locate record: [%@] of item [%@]%@", buf, 0x20u);
  }

  objc_msgSend(v17, "debugItemIDString");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("locate-record/"), "stringByAppendingString:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "metadataSyncContext");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v28.receiver = self;
  v28.super_class = (Class)BRCLocateRecordOperation;
  v23 = -[_BRCOperation initWithName:syncContext:sessionContext:](&v28, sel_initWithName_syncContext_sessionContext_, v21, v22, v15);

  if (v23)
  {
    objc_msgSend(MEMORY[0x1E0C94F88], "br_locateRecord");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[_BRCOperation setGroup:](v23, "setGroup:", v24);

    -[_BRCOperation setNonDiscretionary:](v23, "setNonDiscretionary:", v9);
    -[_BRCOperation setMaxBackoff:](v23, "setMaxBackoff:", a6);
    objc_storeStrong((id *)&v23->_recordID, a3);
    objc_storeStrong((id *)&v23->_structureRecordID, a3);
    objc_storeStrong((id *)&v23->_serverZone, a4);
    v25 = objc_opt_new();
    locateRecordCompletionBlocks = v23->_locateRecordCompletionBlocks;
    v23->_locateRecordCompletionBlocks = (NSMutableArray *)v25;

  }
  return v23;
}

- (BOOL)shouldRetryForError:(id)a3
{
  return objc_msgSend(a3, "brc_isUserInitiatedRetriable");
}

- (id)createActivity
{
  return _os_activity_create(&dword_1CBD43000, "sync/locate-record", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
}

- (void)_performAfterLocatingRecord:(id)a3
{
  id v4;
  id v5;
  void *v6;
  CKRecordID *recordID;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  id v20;
  void *v21;
  CKRecordID *v22;
  CKRecordID *structureRecordID;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  id v32;
  id v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  void (*v37)(uint64_t, void *, void *);
  void *v38;
  BRCLocateRecordOperation *v39;
  id v40;
  id v41;
  _QWORD v42[4];
  id v43;

  v4 = a3;
  v5 = -[BRCFetchRecordSubResourcesOperation initAndScheduleWithServerZone:parentOperation:pendingChangesStream:contentRecordsFetchedInline:sessionContext:]([BRCFetchRecordSubResourcesOperation alloc], "initAndScheduleWithServerZone:parentOperation:pendingChangesStream:contentRecordsFetchedInline:sessionContext:", self->_serverZone, self, 0, 1, self->super._sessionContext);
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", self->_recordID);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  recordID = self->_recordID;
  -[BRCServerZone session](self->_serverZone, "session");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKRecordID brc_itemIDWithSession:](recordID, "brc_itemIDWithSession:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[CKRecordID recordName](self->_recordID, "recordName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "hasPrefix:", CFSTR("documentStructure/"));

  if (v11)
  {
    objc_msgSend(v9, "itemIDString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(CFSTR("documentContent/"), "stringByAppendingString:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = objc_alloc(MEMORY[0x1E0C95070]);
    -[CKRecordID zoneID](self->_recordID, "zoneID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v14, "initWithRecordName:zoneID:", v13, v15);
    objc_msgSend(v6, "addObject:", v16);

LABEL_5:
    goto LABEL_6;
  }
  -[CKRecordID recordName](self->_recordID, "recordName");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "hasPrefix:", CFSTR("documentContent/"));

  if (v18)
  {
    objc_msgSend(v9, "itemIDString");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(CFSTR("documentStructure/"), "stringByAppendingString:", v19);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = objc_alloc(MEMORY[0x1E0C95070]);
    -[CKRecordID zoneID](self->_recordID, "zoneID");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (CKRecordID *)objc_msgSend(v20, "initWithRecordName:zoneID:", v13, v21);
    structureRecordID = self->_structureRecordID;
    self->_structureRecordID = v22;

    objc_msgSend(v6, "addObject:", self->_structureRecordID);
    goto LABEL_5;
  }
LABEL_6:
  if ((objc_msgSend(v9, "isDocumentsFolder") & 1) == 0 && objc_msgSend(v9, "isNonDesktopRoot"))
  {
    v24 = objc_alloc(MEMORY[0x1E0C95070]);
    objc_msgSend(v9, "itemIDString");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKRecordID zoneID](self->_recordID, "zoneID");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = (void *)objc_msgSend(v24, "initWithRecordName:zoneID:", v25, v26);
    objc_msgSend(v6, "addObject:", v27);

  }
  v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C94E18]), "initWithRecordIDs:", v6);
  objc_msgSend(v28, "setShouldFetchAssetContent:", 0);
  objc_msgSend(MEMORY[0x1E0C95048], "desiredKeysWithMask:", 185);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setDesiredKeys:", v29);

  objc_msgSend(v5, "callbackQueue");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setCallbackQueue:", v30);

  v31 = MEMORY[0x1E0C809B0];
  v42[0] = MEMORY[0x1E0C809B0];
  v42[1] = 3221225472;
  v42[2] = __56__BRCLocateRecordOperation__performAfterLocatingRecord___block_invoke;
  v42[3] = &unk_1E8763EB0;
  v32 = v5;
  v43 = v32;
  objc_msgSend(v28, "setPerRecordCompletionBlock:", v42);
  v35 = v31;
  v36 = 3221225472;
  v37 = __56__BRCLocateRecordOperation__performAfterLocatingRecord___block_invoke_7;
  v38 = &unk_1E8765AA0;
  v39 = self;
  v40 = v32;
  v41 = v4;
  v33 = v4;
  v34 = v32;
  objc_msgSend(v28, "setFetchRecordsCompletionBlock:", &v35);
  -[_BRCOperation addSubOperation:](self, "addSubOperation:", v28, v35, v36, v37, v38, v39);

}

void __56__BRCLocateRecordOperation__performAfterLocatingRecord___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  int v11;
  id v12;
  __int16 v13;
  id v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "addRecord:", a2);
  }
  else
  {
    brc_bread_crumbs();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      v11 = 138412802;
      v12 = v7;
      v13 = 2112;
      v14 = v8;
      v15 = 2112;
      v16 = v9;
      _os_log_debug_impl(&dword_1CBD43000, v10, OS_LOG_TYPE_DEBUG, "[DEBUG] record with id %@ encountered an error while locating - %@%@", (uint8_t *)&v11, 0x20u);
    }

  }
}

void __56__BRCLocateRecordOperation__performAfterLocatingRecord___block_invoke_7(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  uint64_t v16;
  id v17;
  id v18;

  v5 = a3;
  objc_msgSend(a2, "objectForKeyedSubscript:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 528));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __56__BRCLocateRecordOperation__performAfterLocatingRecord___block_invoke_2;
  v13[3] = &unk_1E875FE88;
  v14 = v5;
  v7 = *(void **)(a1 + 40);
  v8 = v7;
  v9 = *(_QWORD *)(a1 + 32);
  v15 = v8;
  v16 = v9;
  v10 = *(id *)(a1 + 48);
  v17 = v6;
  v18 = v10;
  v11 = v6;
  v12 = v5;
  objc_msgSend(v7, "notifyWhenRecordsAreFetchedAndFinish:", v13);

}

void __56__BRCLocateRecordOperation__performAfterLocatingRecord___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  const __CFString *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void (*v16)(void);
  void *v17;
  uint64_t *v18;
  void *v19;
  char isKindOfClass;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  uint8_t buf[4];
  uint64_t v36;
  __int16 v37;
  uint64_t v38;
  __int16 v39;
  void *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(*(id *)(a1 + 40), "records");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "count");

    if (!v3)
    {
      brc_bread_crumbs();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        v32 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 560);
        v33 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138412802;
        v36 = v32;
        v37 = 2112;
        v38 = v33;
        v39 = 2112;
        v40 = v14;
        _os_log_debug_impl(&dword_1CBD43000, v15, OS_LOG_TYPE_DEBUG, "[DEBUG] Failed to look up record %@ - %@%@", buf, 0x20u);
      }

      v16 = *(void (**)(void))(*(_QWORD *)(a1 + 64) + 16);
      goto LABEL_14;
    }
  }
  if ((objc_msgSend(*(id *)(a1 + 40), "saveRecordsWithQueryCursor:", 0) & 1) == 0)
  {
    v6 = *(_QWORD *)(a1 + 64);
    brc_bread_crumbs();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      __56__BRCLocateRecordOperation__performAfterLocatingRecord___block_invoke_2_cold_4();

    v9 = (void *)MEMORY[0x1E0CB35C8];
    v10 = *MEMORY[0x1E0D10C90];
    v11 = CFSTR("unreachable: Can't alloc ranks after fetching records");
    v12 = 15;
    goto LABEL_9;
  }
  objc_msgSend(*(id *)(a1 + 40), "error");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = *(_QWORD *)(a1 + 64);
    objc_msgSend(*(id *)(a1 + 40), "error");
    v34 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD))(v5 + 16))(v5, 0);

    return;
  }
  v18 = (uint64_t *)(a1 + 56);
  v17 = *(void **)(a1 + 56);
  if (!v17)
  {
    if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 536), "isSharedZone"))
    {
      brc_bread_crumbs();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
        __56__BRCLocateRecordOperation__performAfterLocatingRecord___block_invoke_2_cold_1();

      v16 = *(void (**)(void))(*(_QWORD *)(a1 + 64) + 16);
LABEL_14:
      v16();
      return;
    }
    v17 = (void *)*v18;
    if (*v18)
      goto LABEL_16;
    brc_bread_crumbs();
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
      __56__BRCLocateRecordOperation__performAfterLocatingRecord___block_invoke_2_cold_2((id *)(a1 + 48));

    v6 = *(_QWORD *)(a1 + 64);
    v9 = (void *)MEMORY[0x1E0CB35C8];
    v10 = *MEMORY[0x1E0D10B70];
    v11 = CFSTR("Could not locate record");
    v12 = 7;
LABEL_9:
    objc_msgSend(v9, "br_errorWithDomain:code:description:", v10, v12, v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v6 + 16))(v6, 0, v13);
    goto LABEL_10;
  }
LABEL_16:
  objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("parent"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13
    || !objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 536), "isSharedZone")
    || (objc_msgSend((id)*v18, "share"), v19 = (void *)objc_claimAutoreleasedReturnValue(), v19, !v19))
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    v21 = *(_QWORD *)(a1 + 64);
    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(v13, "recordID");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 536), "session");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "brc_itemIDWithSession:", v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *, _QWORD))(v21 + 16))(v21, v24, 0);

      goto LABEL_22;
    }
    brc_bread_crumbs();
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT))
      __56__BRCLocateRecordOperation__performAfterLocatingRecord___block_invoke_2_cold_3(v18, (uint64_t)v27, v28);

    objc_msgSend(MEMORY[0x1E0CB35C8], "br_errorWithDomain:code:description:", *MEMORY[0x1E0D10C90], 15, CFSTR("unreachable: parent isn't a reference %@"), *v18);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v21 + 16))(v21, 0, v29);

LABEL_10:
    return;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
LABEL_22:

  *(_QWORD *)(*(_QWORD *)(a1 + 48) + 504) = objc_msgSend(*(id *)(a1 + 40), "recordsFetched");
  *(_QWORD *)(*(_QWORD *)(a1 + 48) + 512) = objc_msgSend(*(id *)(a1 + 40), "recordsFetchedTotalMetadataSize");
  *(_QWORD *)(*(_QWORD *)(a1 + 48) + 520) = objc_msgSend(*(id *)(a1 + 40), "xattrsFetchedTotalSize");
}

- (void)main
{
  void *v1;
  os_log_t v2;
  os_log_type_t v3;
  const char *v4;
  uint8_t *v5;
  void *v6;

  objc_msgSend(*(id *)(a1 + 536), "mangledID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_2();
  _os_log_debug_impl(v1, v2, v3, v4, v5, 0x20u);

}

void __32__BRCLocateRecordOperation_main__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  NSObject *v16;
  id v17;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  _QWORD v21[4];
  id v22;
  uint64_t v23;
  uint8_t buf[4];
  uint64_t v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  id v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    brc_bread_crumbs();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = *(_QWORD *)(a1 + 32);
      v10 = *(_QWORD *)(v9 + 560);
      objc_msgSend(*(id *)(v9 + 536), "mangledID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      v25 = v10;
      v26 = 2112;
      v27 = v11;
      v28 = 2112;
      v29 = v6;
      v30 = 2112;
      v31 = v7;
      _os_log_impl(&dword_1CBD43000, v8, OS_LOG_TYPE_INFO, "[INFO] Locating recordID %@ in zone %@ --> Record not found. Error %@%@", buf, 0x2Au);

    }
    v12 = *(void **)(a1 + 32);
    v13 = MEMORY[0x1E0C9AAA0];
    v14 = v6;
  }
  else
  {
    if (v5)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 536), "session");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "clientTruthWorkloop");
      v16 = objc_claimAutoreleasedReturnValue();
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __32__BRCLocateRecordOperation_main__block_invoke_18;
      v21[3] = &unk_1E875D470;
      v17 = v5;
      v18 = *(_QWORD *)(a1 + 32);
      v22 = v17;
      v23 = v18;
      dispatch_async(v16, v21);

      goto LABEL_8;
    }
    brc_bread_crumbs();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      __32__BRCLocateRecordOperation_main__block_invoke_cold_1();

    v12 = *(void **)(a1 + 32);
    v13 = MEMORY[0x1E0C9AAB0];
    v14 = 0;
  }
  objc_msgSend(v12, "completedWithResult:error:", v13, v14);
LABEL_8:

}

void __32__BRCLocateRecordOperation_main__block_invoke_18(uint64_t a1)
{
  BRCFetchParentChainOperation *v2;
  void *v3;
  NSObject *v4;
  _QWORD v5[5];

  v2 = -[BRCFetchParentChainOperation initWithParentID:sessionContext:zone:isUserWaiting:]([BRCFetchParentChainOperation alloc], "initWithParentID:sessionContext:zone:isUserWaiting:", *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(a1 + 40) + 256), *(_QWORD *)(*(_QWORD *)(a1 + 40) + 536), objc_msgSend(*(id *)(a1 + 40), "nonDiscretionary"));
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __32__BRCLocateRecordOperation_main__block_invoke_2;
  v5[3] = &unk_1E875D850;
  v5[4] = *(_QWORD *)(a1 + 40);
  -[BRCFetchParentChainOperation addFetchParentChainCompletionBlock:](v2, "addFetchParentChainCompletionBlock:", v5);
  if (!v2)
  {
    brc_bread_crumbs();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
      __32__BRCLocateRecordOperation_main__block_invoke_18_cold_1();

  }
  objc_msgSend(*(id *)(a1 + 40), "addSubOperation:", v2);

}

void __32__BRCLocateRecordOperation_main__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  id v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    brc_bread_crumbs();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6 = *(_QWORD *)(a1 + 32);
      v7 = *(_QWORD *)(v6 + 560);
      objc_msgSend(*(id *)(v6 + 536), "mangledID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138413058;
      v13 = v7;
      v14 = 2112;
      v15 = v8;
      v16 = 2112;
      v17 = v3;
      v18 = 2112;
      v19 = v4;
      _os_log_impl(&dword_1CBD43000, v5, OS_LOG_TYPE_INFO, "[INFO] Locating recordID %@ in zone %@ --> Fetch parent chain failed with error %@%@", (uint8_t *)&v12, 0x2Au);

    }
    v9 = *(void **)(a1 + 32);
    v10 = MEMORY[0x1E0C9AAA0];
    v11 = v3;
  }
  else
  {
    v9 = *(void **)(a1 + 32);
    v10 = MEMORY[0x1E0C9AAB0];
    v11 = 0;
  }
  objc_msgSend(v9, "completedWithResult:error:", v10, v11);

}

- (void)finishWithResult:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  id v10;
  void *v11;
  void *v12;
  BRCLocateRecordOperation *v13;
  NSMutableArray *v14;
  NSMutableArray *locateRecordCompletionBlocks;
  NSMutableArray *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  objc_super v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v24.receiver = self;
  v24.super_class = (Class)BRCLocateRecordOperation;
  -[_BRCOperation finishWithResult:error:](&v24, sel_finishWithResult_error_, v6, v7);
  if (!v7 && -[_BRCOperation nonDiscretionary](self, "nonDiscretionary"))
  {
    brc_bread_crumbs();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      -[BRCLocateRecordOperation finishWithResult:error:].cold.1(self);

    -[_BRCOperation executionTimeInSec](self, "executionTimeInSec");
    v10 = +[AppTelemetryTimeSeriesEvent newQBSOperationPrformanceEventWithTime:type:recordsFetched:recordsFetchedTotalMetadataSize:xattrsFetchedTotalSize:](AppTelemetryTimeSeriesEvent, "newQBSOperationPrformanceEventWithTime:type:recordsFetched:recordsFetchedTotalMetadataSize:xattrsFetchedTotalSize:", CFSTR("BRCLocateRecordOperation"), self->_recordsFetched, self->_recordsFetchedTotalMetadataSize, self->_xattrsFetchedTotalSize);
    -[BRCServerZone session](self->_serverZone, "session");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "analyticsReporter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "postReportForDefaultSubCategoryWithCategory:telemetryTimeEvent:", 11, v10);

  }
  v13 = self;
  objc_sync_enter(v13);
  v13->_exists = objc_msgSend(v6, "isEqual:", MEMORY[0x1E0C9AAB0]);
  v14 = v13->_locateRecordCompletionBlocks;
  locateRecordCompletionBlocks = v13->_locateRecordCompletionBlocks;
  v13->_locateRecordCompletionBlocks = 0;

  objc_sync_exit(v13);
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v16 = v14;
  v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v17)
  {
    v18 = *(_QWORD *)v21;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v21 != v18)
          objc_enumerationMutation(v16);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v19) + 16))(*(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v19));
        ++v19;
      }
      while (v17 != v19);
      v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    }
    while (v17);
  }

}

- (void)addLocateRecordCompletionBlock:(id)a3
{
  id v4;
  BRCLocateRecordOperation *v5;
  NSMutableArray *locateRecordCompletionBlocks;
  void *v7;
  NSObject *v8;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  locateRecordCompletionBlocks = v5->_locateRecordCompletionBlocks;
  if (locateRecordCompletionBlocks)
  {
    v7 = (void *)MEMORY[0x1D17A6DB0](v4);
    -[NSMutableArray addObject:](locateRecordCompletionBlocks, "addObject:", v7);

  }
  else
  {
    -[_BRCOperation callbackQueue](v5, "callbackQueue");
    v8 = objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __59__BRCLocateRecordOperation_addLocateRecordCompletionBlock___block_invoke;
    v9[3] = &unk_1E875F7C0;
    v9[4] = v5;
    v10 = v4;
    dispatch_async(v8, v9);

  }
  objc_sync_exit(v5);

}

void __59__BRCLocateRecordOperation_addLocateRecordCompletionBlock___block_invoke(uint64_t a1)
{
  unsigned __int8 *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id v5;

  v3 = a1 + 32;
  v1 = *(unsigned __int8 **)(a1 + 32);
  v2 = *(_QWORD *)(v3 + 8);
  v4 = v1[544];
  objc_msgSend(v1, "error");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t, id))(v2 + 16))(v2, v4, v5);

}

- (void)cancelToBeReplacedByOperation:(id)a3
{
  id v4;
  BRCLocateRecordOperation *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  NSMutableArray *v10;
  NSMutableArray *locateRecordCompletionBlocks;
  NSMutableArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v5 = self;
    objc_sync_enter(v5);
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    -[BRCLocateRecordOperation dependencies](v5, "dependencies");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v21 != v8)
            objc_enumerationMutation(v6);
          objc_msgSend(v4, "addDependency:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i));
        }
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
      }
      while (v7);
    }

    v10 = v5->_locateRecordCompletionBlocks;
    locateRecordCompletionBlocks = v5->_locateRecordCompletionBlocks;
    v5->_locateRecordCompletionBlocks = 0;

    objc_sync_exit(v5);
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v12 = v10;
    v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
    if (v13)
    {
      v14 = *(_QWORD *)v17;
      do
      {
        for (j = 0; j != v13; ++j)
        {
          if (*(_QWORD *)v17 != v14)
            objc_enumerationMutation(v12);
          objc_msgSend(v4, "addLocateRecordCompletionBlock:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * j), (_QWORD)v16);
        }
        v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
      }
      while (v13);
    }

    -[_BRCOperation cancel](v5, "cancel");
    if (-[_BRCOperation isExecuting](v5, "isExecuting"))
      objc_msgSend(v4, "addDependency:", v5);

  }
  else
  {
    -[_BRCOperation cancel](self, "cancel");
  }

}

- (CKRecordID)recordID
{
  return self->_recordID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordID, 0);
  objc_storeStrong((id *)&self->_locateRecordCompletionBlocks, 0);
  objc_storeStrong((id *)&self->_serverZone, 0);
  objc_storeStrong((id *)&self->_structureRecordID, 0);
}

void __56__BRCLocateRecordOperation__performAfterLocatingRecord___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_1(&dword_1CBD43000, v0, v1, "[DEBUG] Located record in shared zone. No need to fetch the parent chain.%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __56__BRCLocateRecordOperation__performAfterLocatingRecord___block_invoke_2_cold_2(id *a1)
{
  void *v1;
  void *v2;
  void *v3;
  os_log_t v4;
  os_log_type_t v5;
  const char *v6;
  uint8_t *v7;

  objc_msgSend(*a1, "recordID");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "debugDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_2_2();
  _os_log_debug_impl(v3, v4, v5, v6, v7, 0x16u);

}

void __56__BRCLocateRecordOperation__performAfterLocatingRecord___block_invoke_2_cold_3(uint64_t *a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *a1;
  v4 = 138412546;
  v5 = v3;
  v6 = 2112;
  v7 = a2;
  _os_log_fault_impl(&dword_1CBD43000, log, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: parent isn't a reference %@%@", (uint8_t *)&v4, 0x16u);
  OUTLINED_FUNCTION_2();
}

void __56__BRCLocateRecordOperation__performAfterLocatingRecord___block_invoke_2_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] UNREACHABLE: Can't alloc ranks after fetching records%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __32__BRCLocateRecordOperation_main__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_1(&dword_1CBD43000, v0, v1, "[DEBUG] Record located. No need to fetch the parent chain.%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __32__BRCLocateRecordOperation_main__block_invoke_18_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: fetchParentChainOp%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)finishWithResult:(void *)a1 error:.cold.1(void *a1)
{
  void *v1;
  os_log_t v2;
  os_log_type_t v3;
  const char *v4;
  uint8_t *v5;

  objc_msgSend(a1, "executionTimeInSec");
  OUTLINED_FUNCTION_2_2();
  _os_log_debug_impl(v1, v2, v3, v4, v5, 0x3Eu);
}

@end
