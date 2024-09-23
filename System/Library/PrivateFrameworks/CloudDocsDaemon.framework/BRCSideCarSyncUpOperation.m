@implementation BRCSideCarSyncUpOperation

- (BRCSideCarSyncUpOperation)initWithSession:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  BRCSideCarSyncUpOperation *v8;
  objc_super v10;

  v5 = a3;
  objc_msgSend(v5, "syncContextProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sideCarSyncContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10.receiver = self;
  v10.super_class = (Class)BRCSideCarSyncUpOperation;
  v8 = -[_BRCOperation initWithName:syncContext:sessionContext:](&v10, sel_initWithName_syncContext_sessionContext_, CFSTR("side-car.sync-up"), v7, v5);

  if (v8)
    objc_storeStrong((id *)&v8->_session, a3);

  return v8;
}

- (BOOL)shouldPerformAnotherBatch
{
  return self->_shouldPerformAnotherBatch;
}

- (BOOL)shouldRetryForError:(id)a3
{
  return 0;
}

- (id)createActivity
{
  return _os_activity_create(&dword_1CBD43000, "sync/side-car-sync-up", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
}

- (void)_markItemsFailedSync
{
  NSObject *v3;
  _QWORD block[5];

  -[BRCAccountSession clientTruthWorkloop](self->_session, "clientTruthWorkloop");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__BRCSideCarSyncUpOperation__markItemsFailedSync__block_invoke;
  block[3] = &unk_1E875D500;
  block[4] = self;
  dispatch_async_and_wait(v3, block);

}

void __49__BRCSideCarSyncUpOperation__markItemsFailedSync__block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[5];

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 504), "clientDB");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __49__BRCSideCarSyncUpOperation__markItemsFailedSync__block_invoke_2;
  v3[3] = &unk_1E875D8C8;
  v3[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v2, "performWithFlags:action:", 4, v3);

}

uint64_t __49__BRCSideCarSyncUpOperation__markItemsFailedSync__block_invoke_2(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 504), "itemsWithSideCarInFlightDiffsEnumerator", 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v9;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v9 != v4)
          objc_enumerationMutation(v1);
        v6 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * i);
        objc_msgSend(v6, "markLatestSyncRequestFailedInZone:", &unk_1E87D7160);
        objc_msgSend(v6, "saveToDBForServerEdit:keepAliases:", 1, 1);
      }
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v3);
  }

  return 1;
}

- (void)_syncUpRecordBatchWithModifiedRecords:(id)a3 deletedRecordIDs:(id)a4 recordIDToZoneMap:(id)a5 requestID:(unint64_t)a6
{
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  id v22;
  void *v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD v31[5];
  id v32;
  _QWORD v33[5];
  id v34;
  id v35;
  id v36;
  id v37[2];
  id location;
  void *v39;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v39 = (void *)a6;
  v13 = objc_msgSend(v10, "count");
  if (v13 + objc_msgSend(v11, "count"))
  {
    if (!a6)
    {
      brc_bread_crumbs();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
        -[BRCSideCarSyncUpOperation _syncUpRecordBatchWithModifiedRecords:deletedRecordIDs:recordIDToZoneMap:requestID:].cold.2((uint64_t)v23, v24, v25, v26, v27, v28, v29, v30);

    }
    brc_bread_crumbs();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      -[BRCSideCarSyncUpOperation _syncUpRecordBatchWithModifiedRecords:deletedRecordIDs:recordIDToZoneMap:requestID:].cold.1((uint64_t)v14, a6, v15);

    v16 = objc_alloc(MEMORY[0x1E0C94F10]);
    objc_msgSend(v11, "allKeys");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(v16, "initWithRecordsToSave:recordIDsToDelete:", v10, v17);

    objc_msgSend(v18, "setRecordIDsToDeleteToEtags:", v11);
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &v39, 8);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setClientChangeTokenData:", v19);

    objc_initWeak(&location, v18);
    v20 = MEMORY[0x1E0C809B0];
    v33[0] = MEMORY[0x1E0C809B0];
    v33[1] = 3221225472;
    v33[2] = __112__BRCSideCarSyncUpOperation__syncUpRecordBatchWithModifiedRecords_deletedRecordIDs_recordIDToZoneMap_requestID___block_invoke;
    v33[3] = &unk_1E875F930;
    objc_copyWeak(v37, &location);
    v33[4] = self;
    v34 = v10;
    v35 = v11;
    v36 = v12;
    v37[1] = v39;
    objc_msgSend(v18, "setModifyRecordsCompletionBlock:", v33);
    -[BRCAccountSession clientTruthWorkloop](self->_session, "clientTruthWorkloop");
    v21 = objc_claimAutoreleasedReturnValue();
    v31[0] = v20;
    v31[1] = 3221225472;
    v31[2] = __112__BRCSideCarSyncUpOperation__syncUpRecordBatchWithModifiedRecords_deletedRecordIDs_recordIDToZoneMap_requestID___block_invoke_13;
    v31[3] = &unk_1E875D470;
    v31[4] = self;
    v32 = v18;
    v22 = v18;
    dispatch_async(v21, v31);

    objc_destroyWeak(v37);
    objc_destroyWeak(&location);
  }
  else
  {
    -[_BRCOperation completedWithResult:error:](self, "completedWithResult:error:", 0, 0);
  }

}

void __112__BRCSideCarSyncUpOperation__syncUpRecordBatchWithModifiedRecords_deletedRecordIDs_recordIDToZoneMap_requestID___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id WeakRetained;
  void *v11;
  NSObject *v12;
  void *v13;
  BRCCreateZoneAndSubscribeOperation *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  NSObject *v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(uint64_t);
  void *v26;
  id v27;
  id v28;
  _QWORD v29[5];
  id v30;
  id v31;
  id v32;
  id v33[2];
  _BYTE location[12];
  __int16 v35;
  id v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (objc_msgSend(v9, "brc_isCloudKitErrorImplyingZoneNeedsCreation"))
  {
    brc_bread_crumbs();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)location = 138412802;
      *(_QWORD *)&location[4] = WeakRetained;
      v35 = 2112;
      v36 = v9;
      v37 = 2112;
      v38 = v11;
      _os_log_debug_impl(&dword_1CBD43000, v12, OS_LOG_TYPE_DEBUG, "[DEBUG] We need to create the side car zone on %@ - %@%@", location, 0x20u);
    }

    objc_msgSend(MEMORY[0x1E0C95098], "brc_sideCarZoneID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak((id *)location, *(id *)(a1 + 32));
    v14 = -[BRCCreateZoneAndSubscribeOperation initWithSession:zoneID:]([BRCCreateZoneAndSubscribeOperation alloc], "initWithSession:zoneID:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 504), v13);
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __112__BRCSideCarSyncUpOperation__syncUpRecordBatchWithModifiedRecords_deletedRecordIDs_recordIDToZoneMap_requestID___block_invoke_7;
    v29[3] = &unk_1E875F908;
    objc_copyWeak(v33, (id *)location);
    v15 = *(void **)(a1 + 40);
    v29[4] = *(_QWORD *)(a1 + 32);
    v30 = v15;
    v31 = *(id *)(a1 + 48);
    v16 = *(id *)(a1 + 56);
    v17 = *(void **)(a1 + 72);
    v32 = v16;
    v33[1] = v17;
    -[BRCCreateZoneAndSubscribeOperation setCreateZoneAndSubscribeCompletionBlock:](v14, "setCreateZoneAndSubscribeCompletionBlock:", v29);
    objc_msgSend(*(id *)(a1 + 32), "addSubOperation:", v14);

    objc_destroyWeak(v33);
    objc_destroyWeak((id *)location);

  }
  else
  {
    if (v9)
    {
      brc_bread_crumbs();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, (os_log_type_t)0x90u))
      {
        *(_DWORD *)location = 138412802;
        *(_QWORD *)&location[4] = WeakRetained;
        v35 = 2112;
        v36 = v9;
        v37 = 2112;
        v38 = v18;
        _os_log_error_impl(&dword_1CBD43000, v19, (os_log_type_t)0x90u, "[ERROR] Failed syncing up side cars on %@ - %@%@", location, 0x20u);
      }

      objc_msgSend(*(id *)(a1 + 32), "_markItemsFailedSync");
    }
    else
    {
      brc_bread_crumbs();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)location = 138412802;
        *(_QWORD *)&location[4] = v7;
        v35 = 2112;
        v36 = WeakRetained;
        v37 = 2112;
        v38 = v20;
        _os_log_debug_impl(&dword_1CBD43000, v21, OS_LOG_TYPE_DEBUG, "[DEBUG] finished side car sync up: %@, op: %@%@", location, 0x20u);
      }

      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 504), "clientTruthWorkloop");
      v22 = objc_claimAutoreleasedReturnValue();
      v23 = MEMORY[0x1E0C809B0];
      v24 = 3221225472;
      v25 = __112__BRCSideCarSyncUpOperation__syncUpRecordBatchWithModifiedRecords_deletedRecordIDs_recordIDToZoneMap_requestID___block_invoke_10;
      v26 = &unk_1E875D470;
      v27 = v7;
      v28 = *(id *)(a1 + 56);
      dispatch_async_and_wait(v22, &v23);

    }
    objc_msgSend(*(id *)(a1 + 32), "completedWithResult:error:", 0, v9, v23, v24, v25, v26);
  }

}

void __112__BRCSideCarSyncUpOperation__syncUpRecordBatchWithModifiedRecords_deletedRecordIDs_recordIDToZoneMap_requestID___block_invoke_7(uint64_t a1, void *a2)
{
  id WeakRetained;
  id v4;

  v4 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "_markItemsFailedSync");
    objc_msgSend(WeakRetained, "completedWithResult:error:", 0, v4);
  }
  else
  {
    objc_msgSend(WeakRetained, "_syncUpRecordBatchWithModifiedRecords:deletedRecordIDs:recordIDToZoneMap:requestID:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 72));
  }

}

void __112__BRCSideCarSyncUpOperation__syncUpRecordBatchWithModifiedRecords_deletedRecordIDs_recordIDToZoneMap_requestID___block_invoke_10(uint64_t a1)
{
  id v2;
  uint64_t v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  void *v21;
  uint8_t buf[4];
  void *v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v17, v24, 16);
  if (v3)
  {
    v5 = v3;
    v6 = *(_QWORD *)v18;
    *(_QWORD *)&v4 = 138412290;
    v16 = v4;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v18 != v6)
          objc_enumerationMutation(v2);
        v8 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v7);
        v9 = *(void **)(a1 + 40);
        objc_msgSend(v8, "recordID", v16, (_QWORD)v17);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectForKeyedSubscript:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v11)
        {
          brc_bread_crumbs();
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = v16;
            v23 = v13;
            _os_log_fault_impl(&dword_1CBD43000, v14, OS_LOG_TYPE_FAULT, "[CRIT] Assertion failed: clientZone%@", buf, 0xCu);
          }

        }
        v21 = v8;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v21, 1);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "learnCKInfosFromSavedRecords:isOutOfBandModifyRecords:", v12, 0);

        ++v7;
      }
      while (v5 != v7);
      v15 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v17, v24, 16);
      v5 = v15;
    }
    while (v15);
  }

}

void __112__BRCSideCarSyncUpOperation__syncUpRecordBatchWithModifiedRecords_deletedRecordIDs_recordIDToZoneMap_requestID___block_invoke_13(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[5];
  id v5;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 504), "clientDB");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __112__BRCSideCarSyncUpOperation__syncUpRecordBatchWithModifiedRecords_deletedRecordIDs_recordIDToZoneMap_requestID___block_invoke_2;
  v4[3] = &unk_1E875D470;
  v3 = *(void **)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  objc_msgSend(v2, "scheduleFlushWithCheckpoint:whenFlushed:", 0, v4);

}

uint64_t __112__BRCSideCarSyncUpOperation__syncUpRecordBatchWithModifiedRecords_deletedRecordIDs_recordIDToZoneMap_requestID___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "addSubOperation:", *(_QWORD *)(a1 + 40));
}

- (void)fakeSyncForItem:(id)a3 itemRank:(unint64_t)a4
{
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  objc_msgSend(v8, "prepareForSyncUpSideCarZone");
  objc_msgSend(v8, "markLatestSyncRequestAcknowledgedInZone:", &unk_1E87D7160);
  objc_msgSend(v8, "saveToDBForServerEdit:keepAliases:", 1, 1);
  if (a4)
  {
    -[BRCAccountSession applyScheduler](self->_session, "applyScheduler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "serverZone");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "didMarkSyncIdleForServerRank:zone:", a4, v7);

  }
}

- (void)main
{
  BRCAccountSession *v3;
  NSObject *v4;
  BRCAccountSession *v5;
  _QWORD v6[4];
  BRCAccountSession *v7;
  BRCSideCarSyncUpOperation *v8;

  v3 = self->_session;
  -[BRCAccountSession clientTruthWorkloop](v3, "clientTruthWorkloop");
  v4 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __33__BRCSideCarSyncUpOperation_main__block_invoke;
  v6[3] = &unk_1E875D470;
  v7 = v3;
  v8 = self;
  v5 = v3;
  dispatch_async(v4, v6);

}

void __33__BRCSideCarSyncUpOperation_main__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  int8x16_t v4;
  _QWORD v5[4];
  int8x16_t v6;

  objc_msgSend(*(id *)(a1 + 32), "clientDB");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __33__BRCSideCarSyncUpOperation_main__block_invoke_2;
  v5[3] = &unk_1E875D8F0;
  v4 = *(int8x16_t *)(a1 + 32);
  v3 = (id)v4.i64[0];
  v6 = vextq_s8(v4, v4, 8uLL);
  objc_msgSend(v2, "performWithFlags:action:", 12, v5);

}

uint64_t __33__BRCSideCarSyncUpOperation_main__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  unsigned int v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  __int16 v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  NSObject *v41;
  char v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  NSObject *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  uint64_t v62;
  void *v63;
  NSObject *v64;
  void *v65;
  NSObject *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v71;
  NSObject *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  void *v80;
  void *v81;
  uint64_t v82;
  id v83;
  unsigned int v84;
  void *v85;
  void *v86;
  uint64_t v87;
  void *v88;
  unint64_t v89;
  void *v90;
  uint8_t buf[4];
  void *v92;
  __int16 v93;
  void *v94;
  uint64_t v95;

  v95 = *MEMORY[0x1E0C80C00];
  v83 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_itemsNeedingSyncUpEnumerator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[BRCUserDefaults defaultsForSideCar](BRCUserDefaults, "defaultsForSideCar");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v85, "maxRecordCountInModifyRecordsOperation");
  v5 = (void *)objc_opt_new();
  v6 = (void *)objc_opt_new();
  v86 = (void *)objc_opt_new();
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 512) = 1;
  v7 = objc_msgSend(v5, "count");
  v90 = v6;
  if (objc_msgSend(v6, "count") + v7 < (unint64_t)v4)
  {
    v89 = v4;
    v82 = a1;
    v88 = v5;
    do
    {
      v8 = (void *)MEMORY[0x1D17A6BE8]();
      objc_msgSend(v3, "nextObject");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v9)
      {
        *(_BYTE *)(*(_QWORD *)(a1 + 32) + 512) = 0;
        objc_autoreleasePoolPop(v8);
        break;
      }
      v10 = v9;
      objc_msgSend(v9, "sideCarInfo");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v10, "localDiffs");
      objc_msgSend(v11, "ckInfo");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "etag");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if ((objc_msgSend(v10, "isDead") & 1) != 0
        || (v12 & 0x1A00) != 0 && v14 && (objc_msgSend(v11, "hasfieldsToSync") & 1) == 0)
      {
        objc_msgSend(v10, "sideCarInfo");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "ckInfo");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "etag");
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v17)
        {
          brc_bread_crumbs();
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v29 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v92 = v28;
            _os_log_debug_impl(&dword_1CBD43000, v29, OS_LOG_TYPE_DEBUG, "[DEBUG] Faking sync for side car info delete which isn't known to the server%@", buf, 0xCu);
          }

          objc_msgSend(*(id *)(a1 + 32), "fakeSyncForItem:itemRank:", v10, 0);
          goto LABEL_43;
        }
        brc_bread_crumbs();
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412546;
          v92 = v10;
          v93 = 2112;
          v94 = v18;
          _os_log_debug_impl(&dword_1CBD43000, v19, OS_LOG_TYPE_DEBUG, "[DEBUG] Deleting side-car record for %@%@", buf, 0x16u);
        }

        objc_msgSend(v10, "sideCarRecordID");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v17, v20);
        goto LABEL_42;
      }
      objc_msgSend(*(id *)(a1 + 40), "clientDB");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "itemID");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "clientZone");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "dbRowID");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (void *)objc_msgSend(v21, "fetch:", CFSTR("SELECT item_state, item_side_car_ckinfo, item_rank FROM server_items WHERE item_id = %@ AND zone_rowid = %@"), v22, v24);

      if (objc_msgSend(v17, "next"))
      {
        v25 = objc_msgSend(v17, "intAtIndex:", 0);
        objc_msgSend(v17, "objectOfClass:atIndex:", objc_opt_class(), 1);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v87 = objc_msgSend(v17, "unsignedLongLongAtIndex:", 2);
        objc_msgSend(v26, "etag");
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v17, "close");
        if ((objc_msgSend(v11, "hasfieldsToSync") & 1) == 0)
        {
          v5 = v88;
LABEL_27:
          v39 = v87;
LABEL_29:
          brc_bread_crumbs();
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v41 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412546;
            v92 = v10;
            v93 = 2112;
            v94 = v40;
            _os_log_debug_impl(&dword_1CBD43000, v41, OS_LOG_TYPE_DEBUG, "[DEBUG] Faking sync of side-car record for %@%@", buf, 0x16u);
          }

          objc_msgSend(*(id *)(a1 + 32), "fakeSyncForItem:itemRank:", v10, v39);
          goto LABEL_32;
        }
        v5 = v88;
        if (v25 == 1 && (objc_msgSend(v10, "isKnownByServer") & 1) != 0)
          goto LABEL_27;
        objc_msgSend(v10, "baseSideCarRecord");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if (v27)
          goto LABEL_24;
        v84 = 1;
      }
      else
      {
        objc_msgSend(v10, "itemID");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "serverZone");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "asSharedZone");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "sideCarRecordNameWithZone:", v32);
        v33 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(*(id *)(a1 + 40), "clientDB");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = (void *)objc_msgSend(v34, "fetchObjectOfClass:sql:", objc_opt_class(), CFSTR("SELECT item_side_car_ckinfo FROM side_car_lookahead WHERE record_name = %@"), v33);

        objc_msgSend(v35, "etag");
        v36 = (void *)objc_claimAutoreleasedReturnValue();

        if (!objc_msgSend(v11, "hasfieldsToSync"))
        {
          v39 = 0;
          v5 = v88;
          goto LABEL_29;
        }
        objc_msgSend(v10, "baseSideCarRecord");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v87 = 0;
        if (v36)
        {
          v5 = v88;
LABEL_24:
          objc_msgSend(v11, "ckInfo");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "etag");
          v38 = (void *)objc_claimAutoreleasedReturnValue();

          v84 = 0;
          if (v38)
            goto LABEL_39;
          goto LABEL_34;
        }
        v84 = 1;
        v5 = v88;
      }
LABEL_34:
      v42 = objc_msgSend(v85, "useShareReferenceOnSideCar");
      objc_msgSend(MEMORY[0x1E0C95070], "brc_fetchShareIDWithSharedItem:", v10);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = v43;
      if ((v42 & 1) == 0)
      {
        v81 = v3;
        objc_msgSend(v43, "brc_shareItemID");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v45)
        {
          brc_bread_crumbs();
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v66 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v66, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 138412290;
            v92 = v65;
            _os_log_fault_impl(&dword_1CBD43000, v66, OS_LOG_TYPE_FAULT, "[CRIT] Assertion failed: itemID%@", buf, 0xCu);
          }

        }
        objc_msgSend(v10, "serverZone");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "ownerName");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "derivedAliasItemIDWithOwnerName:", v47);
        v80 = v45;
        v48 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v10, "appLibrary");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "defaultClientZone");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "serverZone");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "structureRecordIDForItemType:zone:aliasTargetZoneIsShared:", 3, v51, 1);
        v79 = objc_claimAutoreleasedReturnValue();

        v44 = (void *)v79;
        v3 = v81;
        v5 = v88;
      }
      if (v44)
      {
        v52 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C950C0]), "initWithRecordID:action:", v44, 0);
        objc_msgSend(v20, "setObject:forKeyedSubscript:", v52, CFSTR("shareReference"));

LABEL_39:
        v53 = v3;
        brc_bread_crumbs();
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v55 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v55, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412546;
          v92 = v10;
          v93 = 2112;
          v94 = v54;
          _os_log_debug_impl(&dword_1CBD43000, v55, OS_LOG_TYPE_DEBUG, "[DEBUG] Syncing up side-car record for %@%@", buf, 0x16u);
        }

        objc_msgSend(v10, "st");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "logicalName");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v57, "br_pathExtension");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "serializeSideCarInfo:filenameExtension:diffs:deadInServerTruth:", v11, v58, objc_msgSend(v10, "localDiffs"), v84);

        objc_msgSend(v90, "addObject:", v20);
        objc_msgSend(v10, "clientZone");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v59, "asSharedClientZone");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "recordID");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v86, "setObject:forKeyedSubscript:", v60, v61);

        v3 = v53;
        a1 = v82;
        v5 = v88;
LABEL_42:

        objc_msgSend(v10, "prepareForSyncUpSideCarZone");
        objc_msgSend(v10, "saveToDB");
        goto LABEL_43;
      }
      brc_bread_crumbs();
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v64 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v64, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412546;
        v92 = v10;
        v93 = 2112;
        v94 = v63;
        _os_log_fault_impl(&dword_1CBD43000, v64, OS_LOG_TYPE_FAULT, "[CRIT] Unable to compute reference recordID for %@%@", buf, 0x16u);
      }

      a1 = v82;
      objc_msgSend(*(id *)(v82 + 32), "fakeSyncForItem:itemRank:", v10, v87);

LABEL_32:
LABEL_43:

      objc_autoreleasePoolPop(v8);
      v62 = objc_msgSend(v5, "count");
    }
    while (objc_msgSend(v90, "count") + v62 < v89);
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 248), "session");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "containerScheduler");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "sideCarSyncPersistedState");
  v69 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v69)
  {
    brc_bread_crumbs();
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v72 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v72, OS_LOG_TYPE_FAULT))
      __33__BRCSideCarSyncUpOperation_main__block_invoke_2_cold_1((uint64_t)v71, v72, v73, v74, v75, v76, v77, v78);

  }
  objc_msgSend(*(id *)(a1 + 32), "_syncUpRecordBatchWithModifiedRecords:deletedRecordIDs:recordIDToZoneMap:requestID:", v90, v5, v86, objc_msgSend(v69, "allocateNextRequestID"));

  return 1;
}

- (id)_itemsNeedingSyncUpEnumerator
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[5];

  -[BRCAccountSession clientDB](self->_session, "clientDB");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "fetch:", CFSTR("SELECT li.rowid, li.zone_rowid, li.item_id, li.item_creator_id, li.item_sharing_options, li.item_side_car_ckinfo, li.item_parent_zone_rowid, li.item_localsyncupstate, li.item_local_diffs, li.item_notifs_rank, li.app_library_rowid, li.item_min_supported_os_rowid, li.item_user_visible, li.item_stat_ckinfo, li.item_state, li.item_type, li.item_mode, li.item_birthtime, li.item_lastusedtime, li.item_favoriterank,li.item_parent_id, li.item_filename, li.item_hidden_ext, li.item_finder_tags, li.item_xattr_signature, li.item_trash_put_back_path, li.item_trash_put_back_parent_id, li.item_alias_target, li.item_creator, li.item_doc_id, li.item_file_id, li.item_generation, li.item_localname, li.item_processing_stamp, li.item_staged_file_id, li.item_staged_generation, li.item_bouncedname, li.item_scope, li.item_tmpbounceno, li.version_name, li.version_ckinfo, li.version_mtime, li.version_size, li.version_thumb_size, li.version_thumb_signature, li.version_content_signature, li.version_xattr_signature, li.version_edited_since_shared, li.version_device, li.version_conflict_loser_etags, li.version_quarantine_info, li.version_uploaded_assets, li.version_upload_error, li.version_old_zone_item_id, li.version_old_zone_rowid, li.desired_version, li.item_live_conflict_loser_etags, li.item_thumb_live_signature, li.item_thumb_greedy, li.version_block_sync_until_bundle_id, li.version_block_sync_until_timestamp FROM client_items AS li  INNER JOIN client_sync_up AS su    ON su.throttle_id = li.rowid  WHERE         su.throttle_state = 50    AND su.throttle_state != 0    AND su.zone_rowid = %@    AND su.in_flight_diffs IS NULL    AND li.item_stat_ckinfo IS NOT NULL    AND li.item_localsyncupstate = 4    AND li.item_min_supported_os_rowid IS NULL"), &unk_1E87D7160);

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __58__BRCSideCarSyncUpOperation__itemsNeedingSyncUpEnumerator__block_invoke;
  v7[3] = &unk_1E875E2C8;
  v7[4] = self;
  objc_msgSend(v4, "enumerateObjects:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __58__BRCSideCarSyncUpOperation__itemsNeedingSyncUpEnumerator__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 504);
  v5 = a2;
  objc_msgSend(v4, "clientDB");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "newLocalItemFromPQLResultSet:db:error:", v5, v6, a3);

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_session, 0);
}

- (void)_syncUpRecordBatchWithModifiedRecords:(os_log_t)log deletedRecordIDs:recordIDToZoneMap:requestID:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 134218242;
  v4 = a2;
  v5 = 2112;
  v6 = a1;
  _os_log_debug_impl(&dword_1CBD43000, log, OS_LOG_TYPE_DEBUG, "[DEBUG] Syncing up side car records with request %llu%@", (uint8_t *)&v3, 0x16u);
  OUTLINED_FUNCTION_2();
}

- (void)_syncUpRecordBatchWithModifiedRecords:(uint64_t)a3 deletedRecordIDs:(uint64_t)a4 recordIDToZoneMap:(uint64_t)a5 requestID:(uint64_t)a6 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, a2, a3, "[CRIT] Assertion failed: requestID%@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

void __33__BRCSideCarSyncUpOperation_main__block_invoke_2_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, a2, a3, "[CRIT] Assertion failed: state%@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

@end
