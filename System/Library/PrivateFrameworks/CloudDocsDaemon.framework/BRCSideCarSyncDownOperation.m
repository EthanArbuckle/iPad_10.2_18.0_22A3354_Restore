@implementation BRCSideCarSyncDownOperation

- (BRCSideCarSyncDownOperation)initWithSession:(id)a3 changeToken:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  BRCSideCarSyncDownOperation *v11;
  objc_super v13;

  v7 = a4;
  v8 = a3;
  objc_msgSend(v8, "syncContextProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sideCarSyncContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13.receiver = self;
  v13.super_class = (Class)BRCSideCarSyncDownOperation;
  v11 = -[_BRCOperation initWithName:syncContext:sessionContext:](&v13, sel_initWithName_syncContext_sessionContext_, CFSTR("side-car-sync"), v10, v8);

  if (v11)
    objc_storeStrong((id *)&v11->_serverChangeToken, a4);

  return v11;
}

- (BOOL)shouldRetryForError:(id)a3
{
  return 0;
}

- (id)createActivity
{
  return _os_activity_create(&dword_1CBD43000, "sync/side-car-fetch", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
}

- (void)_createZone
{
  void *v3;
  BRCCreateZoneAndSubscribeOperation *v4;
  void *v5;
  BRCCreateZoneAndSubscribeOperation *v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t, void *);
  void *v10;
  id v11;
  id location;

  objc_msgSend(MEMORY[0x1E0C95098], "brc_sideCarZoneID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v4 = [BRCCreateZoneAndSubscribeOperation alloc];
  -[BRCSyncContext session](self->super._syncContext, "session");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[BRCCreateZoneAndSubscribeOperation initWithSession:zoneID:](v4, "initWithSession:zoneID:", v5, v3);

  v7 = MEMORY[0x1E0C809B0];
  v8 = 3221225472;
  v9 = __42__BRCSideCarSyncDownOperation__createZone__block_invoke;
  v10 = &unk_1E875D738;
  objc_copyWeak(&v11, &location);
  -[BRCCreateZoneAndSubscribeOperation setCreateZoneAndSubscribeCompletionBlock:](v6, "setCreateZoneAndSubscribeCompletionBlock:", &v7);
  -[_BRCOperation addSubOperation:](self, "addSubOperation:", v6, v7, v8, v9, v10);
  objc_destroyWeak(&v11);

  objc_destroyWeak(&location);
}

void __42__BRCSideCarSyncDownOperation__createZone__block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  id v5;

  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (v5)
    objc_msgSend(WeakRetained, "completedWithResult:error:", 0, v5);
  else
    objc_msgSend(WeakRetained, "_createSyncDownOperation");

}

- (void)_saveChangedRecords:(id)a3 deletedRecords:(id)a4 serverChangeToken:(id)a5 clientChangeToken:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  id v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  id v25;
  id v26;
  id v27;
  id v28;
  _QWORD v29[4];
  id v30;
  id v31;
  id v32;
  _QWORD *v33;
  uint64_t v34;
  _QWORD v35[4];
  id v36;
  id v37;
  id v38;
  id v39;
  BRCSideCarSyncDownOperation *v40;
  _QWORD *v41;
  _QWORD v42[4];
  uint8_t buf[4];
  id v44;
  __int16 v45;
  id v46;
  __int16 v47;
  id v48;
  __int16 v49;
  uint64_t v50;
  __int16 v51;
  void *v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v28 = a5;
  v12 = a6;
  v42[0] = 0;
  v42[1] = v42;
  v42[2] = 0x2020000000;
  v42[3] = 0;
  -[BRCSyncContext session](self->super._syncContext, "session");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_opt_new();
  if (objc_msgSend(v12, "length") == 8)
    v15 = *(_QWORD *)objc_msgSend(objc_retainAutorelease(v12), "bytes");
  else
    v15 = 0;
  brc_bread_crumbs();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138413314;
    v44 = v10;
    v45 = 2112;
    v46 = v11;
    v47 = 2112;
    v48 = v28;
    v49 = 2048;
    v50 = v15;
    v51 = 2112;
    v52 = v16;
    _os_log_debug_impl(&dword_1CBD43000, v17, OS_LOG_TYPE_DEBUG, "[DEBUG] Saving side car changed records %@\ndeleted record %@\nserver change token %@\nrequestID %llu%@", buf, 0x34u);
  }

  objc_msgSend(v13, "serverDB");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = MEMORY[0x1E0C809B0];
  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v35[2] = __102__BRCSideCarSyncDownOperation__saveChangedRecords_deletedRecords_serverChangeToken_clientChangeToken___block_invoke;
  v35[3] = &unk_1E875D760;
  v20 = v10;
  v36 = v20;
  v21 = v13;
  v37 = v21;
  v22 = v14;
  v38 = v22;
  v23 = v11;
  v39 = v23;
  v40 = self;
  v41 = v42;
  objc_msgSend(v18, "performWithFlags:action:", 9, v35);

  objc_msgSend(v21, "clientDB");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = v19;
  v29[1] = 3221225472;
  v29[2] = __102__BRCSideCarSyncDownOperation__saveChangedRecords_deletedRecords_serverChangeToken_clientChangeToken___block_invoke_14;
  v29[3] = &unk_1E875D788;
  v25 = v21;
  v30 = v25;
  v34 = v15;
  v26 = v28;
  v31 = v26;
  v27 = v22;
  v32 = v27;
  v33 = v42;
  objc_msgSend(v24, "performWithFlags:action:", 37, v29);

  _Block_object_dispose(v42, 8);
}

uint64_t __102__BRCSideCarSyncDownOperation__saveChangedRecords_deletedRecords_serverChangeToken_clientChangeToken___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  NSObject *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t j;
  void *v39;
  uint64_t v40;
  void *v41;
  NSObject *v42;
  id v44;
  void *v45;
  uint64_t v46;
  id obj;
  uint64_t v48;
  uint64_t v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  id v58;
  id v59;
  id v60;
  id v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  _BYTE v66[128];
  uint8_t v67[128];
  uint8_t buf[4];
  void *v69;
  __int16 v70;
  void *v71;
  _BYTE v72[128];
  uint64_t v73;

  v73 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v62 = 0u;
  v63 = 0u;
  v64 = 0u;
  v65 = 0u;
  obj = *(id *)(a1 + 32);
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v62, v72, 16);
  v45 = v3;
  v49 = a1;
  if (v4)
  {
    v5 = v4;
    v48 = *(_QWORD *)v63;
    do
    {
      v6 = 0;
      v46 = v5;
      do
      {
        if (*(_QWORD *)v63 != v48)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * v6);
        objc_msgSend(v7, "recordID");
        v8 = objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)v8, "brc_itemIDWithSession:", *(_QWORD *)(a1 + 40));
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        v60 = 0;
        v61 = 0;
        v58 = 0;
        v59 = 0;
        LOBYTE(v8) = objc_msgSend(v7, "deserializeSideCarInfo:error:", &v61, &v58);
        v10 = v58;
        if ((v8 & 1) != 0)
        {
          if (objc_msgSend(v61, "favoriteRank"))
          {
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v61, "favoriteRank"));
            v11 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v11 = 0;
          }
          if (objc_msgSend(v61, "lastUsedTime"))
          {
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v61, "lastUsedTime"));
            v12 = objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v12 = 0;
          }
          objc_msgSend(v61, "finderTags");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v7, "locateSideCarServerZone:shareRecordName:withSession:", &v60, &v59, *(_QWORD *)(a1 + 40)) & 1) != 0)
          {
            objc_msgSend(v61, "ckInfo");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v60, "dbRowID");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v3, "execute:", CFSTR("UPDATE server_items SET item_favoriterank = %@, item_lastusedtime = %@, item_finder_tags = %@, item_side_car_ckinfo = %@, item_rank = NULL WHERE zone_rowid = %@ AND item_id = %@"), v11, v12, v13, v14, v15, v9);

            if (objc_msgSend(v3, "changes"))
            {
              a1 = v49;
              objc_msgSend(*(id *)(v49 + 48), "addObject:", v60);
LABEL_24:

              v5 = v46;
              goto LABEL_25;
            }
LABEL_19:
            objc_msgSend(v7, "recordID");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "recordName");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = v59;
            objc_msgSend(v61, "ckInfo");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v44 = v18;
            v3 = v45;
            objc_msgSend(v45, "execute:", CFSTR("INSERT OR REPLACE INTO side_car_lookahead (record_name, root_alias_record_name, item_favoriterank, item_lastusedtime, item_side_car_ckinfo, item_finder_tags) VALUES (%@, %@, %@, %@, %@, %@)"), v17, v44, v11, v12, v19, v13);

          }
          else
          {
            if (v59)
              goto LABEL_19;
            brc_bread_crumbs();
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            brc_default_log();
            v21 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 138412546;
              v69 = v7;
              v70 = 2112;
              v71 = v20;
              _os_log_fault_impl(&dword_1CBD43000, v21, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: Couldn't parse alias record name for %@%@", buf, 0x16u);
            }

          }
          a1 = v49;
          goto LABEL_24;
        }
        brc_bread_crumbs();
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 138412546;
          v69 = v7;
          v70 = 2112;
          v71 = v11;
          _os_log_fault_impl(&dword_1CBD43000, v12, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: Couldn't deserialize side car info on %@%@", buf, 0x16u);
        }
LABEL_25:

        ++v6;
      }
      while (v5 != v6);
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v62, v72, 16);
    }
    while (v5);
  }

  v56 = 0u;
  v57 = 0u;
  v54 = 0u;
  v55 = 0u;
  v22 = *(id *)(a1 + 56);
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v54, v67, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v55;
    do
    {
      for (i = 0; i != v24; ++i)
      {
        if (*(_QWORD *)v55 != v25)
          objc_enumerationMutation(v22);
        v27 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * i);
        objc_msgSend(*(id *)(*(_QWORD *)(v49 + 64) + 248), "session");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "brc_itemIDWithSession:", v28);
        v29 = (void *)objc_claimAutoreleasedReturnValue();

        v61 = 0;
        if ((objc_msgSend(v27, "locateSideCarServerZone:withSession:", &v61, *(_QWORD *)(v49 + 40)) & 1) != 0)
        {
          objc_msgSend(v61, "dbRowID");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "execute:", CFSTR("UPDATE server_items SET item_favoriterank = NULL, item_lastusedtime = NULL, item_finder_tags = NULL, item_side_car_ckinfo = NULL, item_rank = NULL WHERE zone_rowid = %@ AND item_id = %@"), v30, v29);

          if (objc_msgSend(v3, "changes"))
          {
            objc_msgSend(*(id *)(v49 + 48), "addObject:", v61);
          }
          else
          {
            objc_msgSend(v27, "recordName");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v3, "execute:", CFSTR("DELETE FROM side_car_lookahead WHERE record_name = %@"), v33);

          }
        }
        else
        {
          brc_bread_crumbs();
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v32 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412546;
            v69 = v27;
            v70 = 2112;
            v71 = v31;
            _os_log_debug_impl(&dword_1CBD43000, v32, OS_LOG_TYPE_DEBUG, "[DEBUG] Ignoring deleted recordID where we couldn't locate the server zone %@%@", buf, 0x16u);
          }

        }
      }
      v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v54, v67, 16);
    }
    while (v24);
  }

  if (objc_msgSend(*(id *)(v49 + 48), "count"))
  {
    v52 = 0u;
    v53 = 0u;
    v50 = 0u;
    v51 = 0u;
    v34 = *(id *)(v49 + 48);
    v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v50, v66, 16);
    if (v35)
    {
      v36 = v35;
      v37 = *(_QWORD *)v51;
      while (2)
      {
        for (j = 0; j != v36; ++j)
        {
          if (*(_QWORD *)v51 != v37)
            objc_enumerationMutation(v34);
          v39 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * j);
          if ((objc_msgSend(v39, "allocateRanksWhenCaughtUp:", 1) & 1) == 0)
          {
            brc_bread_crumbs();
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            brc_default_log();
            v42 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v42, OS_LOG_TYPE_FAULT))
              __102__BRCSideCarSyncDownOperation__saveChangedRecords_deletedRecords_serverChangeToken_clientChangeToken___block_invoke_cold_1();

            v40 = 0;
            goto LABEL_54;
          }
          objc_msgSend(*(id *)(v49 + 40), "saveServerZoneToDB:", v39);
        }
        v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v50, v66, 16);
        if (v36)
          continue;
        break;
      }
    }

    objc_msgSend(*(id *)(v49 + 40), "serverState");
    v34 = (id)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v49 + 72) + 8) + 24) = objc_msgSend(v34, "nextRank");
    v40 = 1;
LABEL_54:

  }
  else
  {
    v40 = 1;
  }

  return v40;
}

uint64_t __102__BRCSideCarSyncDownOperation__saveChangedRecords_deletedRecords_serverChangeToken_clientChangeToken___block_invoke_14(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  uint64_t v20;
  void *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint8_t v32[128];
  uint8_t buf[4];
  uint64_t v34;
  __int16 v35;
  uint64_t v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "containerScheduler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sideCarSyncPersistedState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = *(_QWORD *)(a1 + 64);
  v5 = objc_msgSend(v3, "requestID");
  if (v4 == v5)
  {
    brc_bread_crumbs();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      __102__BRCSideCarSyncDownOperation__saveChangedRecords_deletedRecords_serverChangeToken_clientChangeToken___block_invoke_14_cold_1((_QWORD *)(a1 + 64), (uint64_t)v6, v7);
  }
  else
  {
    brc_bread_crumbs();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(_QWORD *)(a1 + 64);
      *(_DWORD *)buf = 134218498;
      v34 = v8;
      v35 = 2048;
      v36 = objc_msgSend(v3, "requestID");
      v37 = 2112;
      v38 = v6;
      _os_log_impl(&dword_1CBD43000, v7, OS_LOG_TYPE_DEFAULT, "[WARNING] Marking sync request in side care zone as failed because requestIDs differ %lld vs %lld%@", buf, 0x20u);
    }
  }

  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "itemsWithSideCarInFlightDiffsEnumerator");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v28 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        if (v4 == v5)
          objc_msgSend(v14, "markLatestSyncRequestAcknowledgedInZone:", &unk_1E87D7088);
        else
          objc_msgSend(v14, "markLatestSyncRequestFailedInZone:", &unk_1E87D7088);
        objc_msgSend(v14, "saveToDBForServerEdit:keepAliases:", 1, 1);
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    }
    while (v11);
  }

  objc_msgSend(v3, "updateWithServerChangeToken:requestID:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 64));
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v15 = *(id *)(a1 + 48);
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v24;
    do
    {
      for (j = 0; j != v17; ++j)
      {
        if (*(_QWORD *)v24 != v18)
          objc_enumerationMutation(v15);
        v20 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * j);
        objc_msgSend(*(id *)(a1 + 32), "applyScheduler", (_QWORD)v23);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "generatedRanksForZone:upToRank:", v20, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24));

      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
    }
    while (v17);
  }

  return 1;
}

- (void)_createSyncDownOperation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  _QWORD v22[5];
  _QWORD v23[5];
  id v24;
  id v25;
  _QWORD v26[5];
  id v27;
  id v28;
  _QWORD v29[4];
  id v30;
  id v31;
  _QWORD v32[4];
  id v33;
  id v34;
  void *v35;
  void *v36;
  _QWORD v37[2];

  v37[1] = *MEMORY[0x1E0C80C00];
  +[BRCUserDefaults defaultsForSideCar](BRCUserDefaults, "defaultsForSideCar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setPreviousServerChangeToken:", self->_serverChangeToken);
  objc_msgSend(v4, "setResultsLimit:", objc_msgSend(v3, "maxRecordCountInFetchRecordsOperation"));
  objc_msgSend(MEMORY[0x1E0C95048], "desiredKeysWithMask:", 185);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDesiredKeys:", v5);

  objc_msgSend(MEMORY[0x1E0C95098], "brc_sideCarZoneID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc(MEMORY[0x1E0C94DE8]);
  v37[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = v6;
  v36 = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v36, &v35, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v7, "initWithRecordZoneIDs:configurationsByRecordZoneID:", v8, v9);

  objc_msgSend(v10, "setShouldFetchAssetContents:", 0);
  objc_msgSend(v10, "setFetchAllChanges:", objc_msgSend(v3, "shouldFetchAllChanges"));
  v11 = (void *)objc_opt_new();
  v12 = (void *)objc_opt_new();
  v13 = MEMORY[0x1E0C809B0];
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __55__BRCSideCarSyncDownOperation__createSyncDownOperation__block_invoke;
  v32[3] = &unk_1E875D7B0;
  v14 = v12;
  v33 = v14;
  v15 = v11;
  v34 = v15;
  objc_msgSend(v10, "setRecordChangedBlock:", v32);
  v29[0] = v13;
  v29[1] = 3221225472;
  v29[2] = __55__BRCSideCarSyncDownOperation__createSyncDownOperation__block_invoke_24;
  v29[3] = &unk_1E875D7D8;
  v16 = v14;
  v30 = v16;
  v17 = v15;
  v31 = v17;
  objc_msgSend(v10, "setRecordWithIDWasDeletedBlock:", v29);
  v26[0] = v13;
  v26[1] = 3221225472;
  v26[2] = __55__BRCSideCarSyncDownOperation__createSyncDownOperation__block_invoke_26;
  v26[3] = &unk_1E875D800;
  v26[4] = self;
  v18 = v17;
  v27 = v18;
  v19 = v16;
  v28 = v19;
  objc_msgSend(v10, "setRecordZoneChangeTokensUpdatedBlock:", v26);
  v23[0] = v13;
  v23[1] = 3221225472;
  v23[2] = __55__BRCSideCarSyncDownOperation__createSyncDownOperation__block_invoke_2;
  v23[3] = &unk_1E875D828;
  v23[4] = self;
  v24 = v18;
  v25 = v19;
  v20 = v19;
  v21 = v18;
  objc_msgSend(v10, "setRecordZoneFetchCompletionBlock:", v23);
  v22[0] = v13;
  v22[1] = 3221225472;
  v22[2] = __55__BRCSideCarSyncDownOperation__createSyncDownOperation__block_invoke_3;
  v22[3] = &unk_1E875D850;
  v22[4] = self;
  objc_msgSend(v10, "setFetchRecordZoneChangesCompletionBlock:", v22);
  -[_BRCOperation addSubOperation:](self, "addSubOperation:", v10);

}

void __55__BRCSideCarSyncDownOperation__createSyncDownOperation__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
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

  v3 = a2;
  objc_msgSend(v3, "recordType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("perParticipantMetadata"));

  if ((v5 & 1) != 0)
  {
    v6 = *(void **)(a1 + 32);
    objc_msgSend(v3, "recordID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v6) = objc_msgSend(v6, "containsObject:", v7);

    if ((_DWORD)v6)
    {
      brc_bread_crumbs();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
        __55__BRCSideCarSyncDownOperation__createSyncDownOperation__block_invoke_cold_2();

    }
    v8 = *(void **)(a1 + 40);
    objc_msgSend(v3, "recordID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      brc_bread_crumbs();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
        __55__BRCSideCarSyncDownOperation__createSyncDownOperation__block_invoke_cold_1();

    }
    v11 = *(void **)(a1 + 40);
    objc_msgSend(v3, "recordID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v3, v12);

    v13 = *(void **)(a1 + 32);
    objc_msgSend(v3, "recordID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "removeObject:", v14);
  }
  else
  {
    brc_bread_crumbs();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      __55__BRCSideCarSyncDownOperation__createSyncDownOperation__block_invoke_cold_3(v3, (uint64_t)v14, v15);

  }
}

void __55__BRCSideCarSyncDownOperation__createSyncDownOperation__block_invoke_24(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;

  v5 = a2;
  v6 = a3;
  if ((objc_msgSend(v6, "isEqualToString:", CFSTR("perParticipantMetadata")) & 1) != 0)
  {
    if (objc_msgSend(*(id *)(a1 + 32), "containsObject:", v5))
    {
      brc_bread_crumbs();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
        __55__BRCSideCarSyncDownOperation__createSyncDownOperation__block_invoke_24_cold_2();

    }
    objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      brc_bread_crumbs();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
        __55__BRCSideCarSyncDownOperation__createSyncDownOperation__block_invoke_24_cold_1();

    }
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", 0, v5);
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);
  }
  else
  {
    brc_bread_crumbs();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      __55__BRCSideCarSyncDownOperation__createSyncDownOperation__block_invoke_24_cold_3();

  }
}

uint64_t __55__BRCSideCarSyncDownOperation__createSyncDownOperation__block_invoke_26(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;

  v6 = *(void **)(a1 + 32);
  v7 = *(void **)(a1 + 40);
  v8 = a4;
  v9 = a3;
  objc_msgSend(v7, "allValues");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_saveChangedRecords:deletedRecords:serverChangeToken:clientChangeToken:", v10, *(_QWORD *)(a1 + 48), v9, v8);

  objc_msgSend(*(id *)(a1 + 40), "removeAllObjects");
  return objc_msgSend(*(id *)(a1 + 48), "removeAllObjects");
}

uint64_t __55__BRCSideCarSyncDownOperation__createSyncDownOperation__block_invoke_2(uint64_t result, uint64_t a2, void *a3, void *a4, uint64_t a5, uint64_t a6)
{
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;

  if (!a6)
  {
    v7 = result;
    v8 = *(void **)(result + 32);
    v9 = *(void **)(result + 40);
    v10 = a4;
    v11 = a3;
    objc_msgSend(v9, "allValues");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_saveChangedRecords:deletedRecords:serverChangeToken:clientChangeToken:", v12, *(_QWORD *)(v7 + 48), v11, v10);

    objc_msgSend(*(id *)(v7 + 40), "removeAllObjects");
    return objc_msgSend(*(id *)(v7 + 48), "removeAllObjects");
  }
  return result;
}

void __55__BRCSideCarSyncDownOperation__createSyncDownOperation__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;

  v3 = a2;
  brc_bread_crumbs();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    __55__BRCSideCarSyncDownOperation__createSyncDownOperation__block_invoke_3_cold_1();

  objc_msgSend(*(id *)(a1 + 32), "completedWithResult:error:", 0, v3);
}

- (void)main
{
  if (self->_serverChangeToken)
    -[BRCSideCarSyncDownOperation _createSyncDownOperation](self, "_createSyncDownOperation");
  else
    -[BRCSideCarSyncDownOperation _createZone](self, "_createZone");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverChangeToken, 0);
}

void __102__BRCSideCarSyncDownOperation__saveChangedRecords_deletedRecords_serverChangeToken_clientChangeToken___block_invoke_cold_1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_1();
  _os_log_fault_impl(&dword_1CBD43000, v0, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: failed to alloc ranks when syncing down side cars for %@%@", v1, 0x16u);
  OUTLINED_FUNCTION_2();
}

void __102__BRCSideCarSyncDownOperation__saveChangedRecords_deletedRecords_serverChangeToken_clientChangeToken___block_invoke_14_cold_1(_QWORD *a1, uint64_t a2, NSObject *a3)
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 134218242;
  *(_QWORD *)&v3[4] = *a1;
  *(_WORD *)&v3[12] = 2112;
  *(_QWORD *)&v3[14] = a2;
  OUTLINED_FUNCTION_0(&dword_1CBD43000, a2, a3, "[DEBUG] Succeeded in syncing up the side car zone with requestID %lld%@", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16]);
  OUTLINED_FUNCTION_2();
}

void __55__BRCSideCarSyncDownOperation__createSyncDownOperation__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: sideCarRecordsByRecordID[record.recordID] == nil%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __55__BRCSideCarSyncDownOperation__createSyncDownOperation__block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: ![deletedRecordIDs containsObject:record.recordID]%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __55__BRCSideCarSyncDownOperation__createSyncDownOperation__block_invoke_cold_3(void *a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "recordType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412546;
  v7 = v5;
  v8 = 2112;
  v9 = a2;
  _os_log_debug_impl(&dword_1CBD43000, a3, OS_LOG_TYPE_DEBUG, "[DEBUG] Ignoring record of unknown type %@%@", (uint8_t *)&v6, 0x16u);

}

void __55__BRCSideCarSyncDownOperation__createSyncDownOperation__block_invoke_24_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: sideCarRecordsByRecordID[recordID] == nil%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __55__BRCSideCarSyncDownOperation__createSyncDownOperation__block_invoke_24_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: ![deletedRecordIDs containsObject:recordID]%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __55__BRCSideCarSyncDownOperation__createSyncDownOperation__block_invoke_24_cold_3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] Ignoring record of unknown type %@%@");
  OUTLINED_FUNCTION_2();
}

void __55__BRCSideCarSyncDownOperation__createSyncDownOperation__block_invoke_3_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] Finished syncing down side cars - %@%@");
  OUTLINED_FUNCTION_2();
}

@end
