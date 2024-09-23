@implementation BRCFSDownloader

- (BOOL)isDownloadingItem:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  v3 = a3;
  objc_msgSend(v3, "desiredVersion");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "wantsContent"))
  {
    objc_msgSend(v3, "db");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v3, "dbRowID");
    objc_msgSend(v4, "ckInfo");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "etag");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v5, "numberWithSQL:", CFSTR("SELECT transfer_operation IS NOT NULL FROM client_downloads WHERE throttle_id = %llu AND download_kind = %u AND download_etag = %@"), v6, 0, v8);

  }
  else
  {
    v9 = 0;
  }
  v10 = objc_msgSend(v9, "BOOLValue");

  return v10;
}

- (BOOL)hasAdditionsToApplyForItem:(id)a3 serverItem:(id)a4
{
  id v6;
  char v7;
  void *v8;
  void *v9;

  v6 = a3;
  if (-[BRCFSDownloader _hasLosersToDelete:serverItem:](self, "_hasLosersToDelete:serverItem:", v6, a4))
  {
    v7 = 1;
  }
  else
  {
    -[BRCAccountSession clientDB](self->super.super._session, "clientDB");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "numberWithSQL:", CFSTR("SELECT 1 FROM client_downloads WHERE throttle_id = %llu AND download_kind != %u AND transfer_queue = %@ LIMIT 1"), objc_msgSend(v6, "dbRowID"), 0, CFSTR("_done"));

    v7 = objc_msgSend(v9, "BOOLValue");
  }

  return v7;
}

- (void)rescheduleJobsForPendingDiskSpaceWithAvailableSpace:(unint64_t)a3
{
  BRCAccountSession *v3;
  void *v4;
  unint64_t v5;
  BOOL v6;
  unint64_t v7;
  NSObject *v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  BRCAccountSession *v14;
  void *v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  void *v34;
  uint64_t v35;
  unint64_t v36;
  id v37;
  void *v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _QWORD v47[4];
  BRCAccountSession *v48;
  NSObject *v49;
  id v50;
  uint64_t *v51;
  uint64_t v52;
  uint64_t *v53;
  uint64_t v54;
  unint64_t v55;
  _BYTE v56[128];
  uint8_t v57[128];
  uint8_t buf[4];
  uint64_t v59;
  __int16 v60;
  void *v61;
  __int16 v62;
  id v63;
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v52 = 0;
  v53 = &v52;
  v54 = 0x2020000000;
  v55 = a3;
  v3 = self->super.super._session;
  -[BRCAccountSession clientDB](v3, "clientDB");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = objc_msgSend(v4, "diskSpaceRequiredToReturnToGreedyState");

  v5 = v53[3];
  v6 = v5 >= v36;
  v7 = v5 - v36;
  if (v6)
  {
    v53[3] = v7;
    v11 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v12 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    -[BRCAccountSession clientDB](v3, "clientDB");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v47[0] = MEMORY[0x1E0C809B0];
    v47[1] = 3221225472;
    v47[2] = __88__BRCFSDownloader_LegacyAdditions__rescheduleJobsForPendingDiskSpaceWithAvailableSpace___block_invoke;
    v47[3] = &unk_1E875E998;
    v51 = &v52;
    v14 = v3;
    v48 = v14;
    v8 = v12;
    v49 = v8;
    v37 = v11;
    v50 = v37;
    v15 = (void *)MEMORY[0x1D17A6DB0](v47);
    objc_msgSend(v13, "execute:", CFSTR("UPDATE client_downloads SET throttle_state = 1 WHERE throttle_state = 43   AND call_block(%@, transfer_size, app_library_rowid, zone_rowid)"), v15);

    v16 = objc_msgSend(v38, "changes");
    if (v16)
    {
      v35 = v16;
      v45 = 0u;
      v46 = 0u;
      v43 = 0u;
      v44 = 0u;
      v17 = v37;
      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v43, v57, 16);
      if (v18)
      {
        v19 = *(_QWORD *)v44;
        do
        {
          v20 = 0;
          do
          {
            if (*(_QWORD *)v44 != v19)
              objc_enumerationMutation(v17);
            -[BRCAccountSession appLibraryByRowID:](v14, "appLibraryByRowID:", *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * v20));
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "transferSyncContext");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "downloadStream");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "signal");

            ++v20;
          }
          while (v18 != v20);
          v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v43, v57, 16);
        }
        while (v18);
      }

      v41 = 0u;
      v42 = 0u;
      v39 = 0u;
      v40 = 0u;
      v24 = v8;
      v25 = -[NSObject countByEnumeratingWithState:objects:count:](v24, "countByEnumeratingWithState:objects:count:", &v39, v56, 16);
      if (v25)
      {
        v26 = *(_QWORD *)v40;
        do
        {
          v27 = 0;
          do
          {
            if (*(_QWORD *)v40 != v26)
              objc_enumerationMutation(v24);
            -[BRCAccountSession serverZoneByRowID:](v14, "serverZoneByRowID:", *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * v27));
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "asSharedZone");
            v29 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v29, "transferSyncContext");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "downloadStream");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "signal");

            ++v27;
          }
          while (v25 != v27);
          v25 = -[NSObject countByEnumeratingWithState:objects:count:](v24, "countByEnumeratingWithState:objects:count:", &v39, v56, 16);
        }
        while (v25);
      }

      brc_bread_crumbs();
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
      {
        +[BRCDumpContext stringFromByteCount:showActualByteCount:suffix:context:](BRCDumpContext, "stringFromByteCount:showActualByteCount:suffix:context:", v53[3] + v36, 0, 0, 0);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218498;
        v59 = v35;
        v60 = 2112;
        v61 = v34;
        v62 = 2112;
        v63 = v32;
        _os_log_debug_impl(&dword_1CBD43000, v33, OS_LOG_TYPE_DEBUG, "[DEBUG] Downloader: scheduled %lld pending-disk throttles, which will still leave %@ of free disk space%@", buf, 0x20u);

      }
    }

  }
  else
  {
    brc_bread_crumbs();
    v37 = (id)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      +[BRCDumpContext stringFromByteCount:showActualByteCount:suffix:context:](BRCDumpContext, "stringFromByteCount:showActualByteCount:suffix:context:", v53[3], 0, 0, 0);
      v9 = (id)objc_claimAutoreleasedReturnValue();
      +[BRCDumpContext stringFromByteCount:showActualByteCount:suffix:context:](BRCDumpContext, "stringFromByteCount:showActualByteCount:suffix:context:", v36, 0, 0, 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v59 = (uint64_t)v9;
      v60 = 2112;
      v61 = v10;
      v62 = 2112;
      v63 = v37;
      _os_log_debug_impl(&dword_1CBD43000, v8, OS_LOG_TYPE_DEBUG, "[DEBUG] Downloader: not enough space to download anything (%@ < %@)%@", buf, 0x20u);

    }
  }

  _Block_object_dispose(&v52, 8);
}

void __88__BRCFSDownloader_LegacyAdditions__rescheduleJobsForPendingDiskSpaceWithAvailableSpace___block_invoke(uint64_t a1, sqlite3_context *a2, uint64_t a3, uint64_t a4)
{
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  BOOL v10;
  unint64_t v11;
  void *v12;
  void *v13;
  int v14;
  uint64_t v15;
  id v16;
  id v17;

  v7 = sqlite3_value_int64(*(sqlite3_value **)a4);
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v9 = *(_QWORD *)(v8 + 24);
  v10 = v9 > v7;
  v11 = v9 - v7;
  if (v10)
  {
    *(_QWORD *)(v8 + 24) = v11;
    v17 = (id)objc_msgSend(MEMORY[0x1E0CB37E8], "newFromSqliteValue:", *(_QWORD *)(a4 + 8));
    v12 = (void *)objc_msgSend(MEMORY[0x1E0CB37E8], "newFromSqliteValue:", *(_QWORD *)(a4 + 16));
    objc_msgSend(*(id *)(a1 + 32), "serverZoneByRowID:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "isSharedZone");

    v15 = 48;
    if (v14)
    {
      v15 = 40;
      v16 = v12;
    }
    else
    {
      v16 = v17;
    }
    objc_msgSend(*(id *)(a1 + v15), "addObject:", v16);
    sqlite3_result_int(a2, 1);

  }
  else
  {
    sqlite3_result_int(a2, 0);
  }
}

- (BOOL)shouldScheduleLosersEvictionForItem:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  char v7;
  void *v8;
  void *v9;

  v4 = a3;
  objc_msgSend(v4, "liveConflictLoserEtags");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6)
  {
    v7 = 1;
  }
  else
  {
    -[BRCAccountSession clientDB](self->super.super._session, "clientDB");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "numberWithSQL:", CFSTR("SELECT 1 FROM client_downloads  WHERE throttle_id = %lld AND download_kind = %d  LIMIT 1"), objc_msgSend(v4, "dbRowID"), 2);
    v7 = objc_msgSend(v9, "BOOLValue");

  }
  return v7;
}

- (void)evictLosersOnItem:(id)a3 atURL:(id)a4 applySchedulerState:(int *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t, void *);
  void *v21;
  id v22;
  id v23;
  _QWORD v24[2];
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  id v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (-[BRCFSDownloader shouldScheduleLosersEvictionForItem:](self, "shouldScheduleLosersEvictionForItem:", v8))
  {
    objc_msgSend(MEMORY[0x1E0D25D48], "manager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 0;
    objc_msgSend(v10, "permanentStorageForItemAtURL:allocateIfNone:error:", v9, 0, &v23);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v23;

    if (!v11)
    {
      brc_bread_crumbs();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, (os_log_type_t)0x90u))
      {
        objc_msgSend(v9, "path");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v26 = v17;
        v27 = 2112;
        v28 = v12;
        v29 = 2112;
        v30 = v13;
        _os_log_error_impl(&dword_1CBD43000, v14, (os_log_type_t)0x90u, "[ERROR] can't get permanent storage of %@: %@%@", buf, 0x20u);

      }
      if (a5)
        *a5 = 1;
    }
    v15 = *MEMORY[0x1E0D25D00];
    v24[0] = *MEMORY[0x1E0D25D30];
    v24[1] = v15;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = MEMORY[0x1E0C809B0];
    v19 = 3221225472;
    v20 = __80__BRCFSDownloader_LegacyAdditions__evictLosersOnItem_atURL_applySchedulerState___block_invoke;
    v21 = &unk_1E875D850;
    v22 = v9;
    objc_msgSend(v11, "removeAllAdditionsForNamespaces:completionHandler:", v16, &v18);
    objc_msgSend(v8, "setLiveConflictLoserEtags:", 0, v18, v19, v20, v21);
    -[BRCFSDownloader cancelAndCleanupItemDownload:kind:](self, "cancelAndCleanupItemDownload:kind:", v8, 2);

  }
  if (a5)
    *a5 = 0;

}

void __80__BRCFSDownloader_LegacyAdditions__evictLosersOnItem_atURL_applySchedulerState___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  int v6;
  id v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    brc_bread_crumbs();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 138412546;
      v7 = v3;
      v8 = 2112;
      v9 = v4;
      _os_log_impl(&dword_1CBD43000, v5, OS_LOG_TYPE_DEFAULT, "[WARNING] Failed to remove additions : %@%@", (uint8_t *)&v6, 0x16u);
    }
  }
  else
  {
    brc_bread_crumbs();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      __80__BRCFSDownloader_LegacyAdditions__evictLosersOnItem_atURL_applySchedulerState___block_invoke_cold_1(a1, (uint64_t)v4, v5);
  }

}

- (BOOL)_hasLosersToDelete:(id)a3 serverItem:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;
  void *v10;
  int v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  char v21;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint8_t buf[4];
  NSObject *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  NSObject *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(a4, "latestVersion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "conflictLoserEtags");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "liveConflictLoserEtags");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v8, "count") || (objc_msgSend(v8, "isSubsetOfSet:", v7) & 1) != 0)
    goto LABEL_3;
  objc_msgSend(v5, "resolvedConflictLoserEtags");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v8, "intersectsSet:", v10);

  if (v11)
  {
    brc_bread_crumbs();
    v12 = objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
LABEL_12:

      v9 = 1;
      goto LABEL_13;
    }
    objc_msgSend(v8, "allObjects");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "componentsJoinedByString:", CFSTR(", "));
    v15 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "resolvedConflictLoserEtags");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "allObjects");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "componentsJoinedByString:", CFSTR(", "));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v30 = v15;
    v31 = 2112;
    v32 = v18;
    v33 = 2112;
    v34 = v12;
    _os_log_debug_impl(&dword_1CBD43000, v13, OS_LOG_TYPE_DEBUG, "[DEBUG] resolved losers needing deletion: {%@}⋂{%@}%@", buf, 0x20u);

LABEL_11:
    goto LABEL_12;
  }
  v12 = objc_msgSend(v8, "mutableCopy");
  -[NSObject minusSet:](v12, "minusSet:", v7);
  objc_msgSend(v5, "currentVersion");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "conflictLoserEtags");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = -[NSObject isSubsetOfSet:](v12, "isSubsetOfSet:", v20);

  if ((v21 & 1) == 0)
  {
    brc_bread_crumbs();
    v13 = objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      -[NSObject allObjects](v12, "allObjects");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "componentsJoinedByString:", CFSTR(", "));
      v23 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "currentVersion");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "conflictLoserEtags");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "allObjects");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "componentsJoinedByString:", CFSTR(", "));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v30 = v23;
      v31 = 2112;
      v32 = v26;
      v33 = 2112;
      v34 = v13;
      _os_log_debug_impl(&dword_1CBD43000, v15, OS_LOG_TYPE_DEBUG, "[DEBUG] losers needing deletion: {%@}-{%@}%@", buf, 0x20u);

    }
    goto LABEL_11;
  }

LABEL_3:
  v9 = 0;
LABEL_13:

  return v9;
}

- (void)scheduleLosersDownloadForItem:(id)a3 serverItem:(id)a4 purgeStaleEntries:(BOOL)a5 applySchedulerState:(int *)a6
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  int v20;
  void *v21;
  NSObject *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  NSObject *v26;
  int v27;
  void *v28;
  NSObject *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  NSObject *v33;
  void *v34;
  NSObject *v35;
  void *v36;
  int v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t i;
  _BOOL4 v42;
  int v43;
  uint64_t v44;
  void *v45;
  char v47;
  id v48;
  void *v49;
  int v50;
  _BOOL4 v51;
  void *v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  uint64_t v57[3];
  uint64_t v58[3];
  uint8_t v59[128];
  uint8_t buf[4];
  uint64_t v61;
  __int16 v62;
  void *v63;
  __int16 v64;
  void *v65;
  __int16 v66;
  void *v67;
  uint64_t v68;

  v51 = a5;
  v68 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v48 = a4;
  objc_msgSend(v48, "latestVersion");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "conflictLoserEtags");
  v49 = (void *)objc_claimAutoreleasedReturnValue();

  v52 = (void *)objc_msgSend(v49, "mutableCopy");
  objc_msgSend(v8, "liveConflictLoserEtags");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "minusSet:", v10);

  objc_msgSend(v8, "resolvedConflictLoserEtags");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "minusSet:", v11);

  memset(v58, 0, sizeof(v58));
  __brc_create_section(0, (uint64_t)"-[BRCFSDownloader(LegacyAdditions) scheduleLosersDownloadForItem:serverItem:purgeStaleEntries:applySchedulerState:]", 205, v58);
  brc_bread_crumbs();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    v44 = v58[0];
    objc_msgSend(v8, "itemID");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218754;
    v61 = v44;
    v62 = 2112;
    v63 = v52;
    v64 = 2112;
    v65 = v45;
    v66 = 2112;
    v67 = v12;
    _os_log_debug_impl(&dword_1CBD43000, v13, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx scheduling download of losers %@ for item %@%@", buf, 0x2Au);

  }
  -[BRCAccountSession clientDB](self->super.super._session, "clientDB");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v14, "fetch:", CFSTR("SELECT transfer_queue, download_etag, throttle_state   FROM client_downloads  WHERE throttle_id = %lld AND download_kind = %d"), objc_msgSend(v8, "dbRowID"), 2);

  v50 = 0;
  v47 = 0;
  while (objc_msgSend(v15, "next"))
  {
    v16 = (void *)MEMORY[0x1D17A6BE8]();
    objc_msgSend(v15, "stringAtIndex:", 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "stringAtIndex:", 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v15, "intAtIndex:", 2);
    v20 = objc_msgSend(v17, "isEqualToString:", CFSTR("_done"));
    memset(v57, 0, sizeof(v57));
    __brc_create_section(0, (uint64_t)"-[BRCFSDownloader(LegacyAdditions) scheduleLosersDownloadForItem:serverItem:purgeStaleEntries:applySchedulerState:]", 218, v57);
    brc_bread_crumbs();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218498;
      v61 = v57[0];
      v62 = 2112;
      v63 = v18;
      v64 = 2112;
      v65 = v21;
      _os_log_debug_impl(&dword_1CBD43000, v22, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx download etag: %@%@", buf, 0x20u);
    }

    if (!objc_msgSend(v52, "containsObject:", v18))
    {
      brc_bread_crumbs();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v61 = (uint64_t)v25;
        _os_log_debug_impl(&dword_1CBD43000, v26, OS_LOG_TYPE_DEBUG, "[DEBUG] not interested in this download%@", buf, 0xCu);
      }

      if (v20 && !v51)
        goto LABEL_17;
LABEL_23:
      -[BRCFSDownloader cancelAndCleanupItemDownload:kind:etag:](self, "cancelAndCleanupItemDownload:kind:etag:", v8, 2, v18);
      goto LABEL_24;
    }
    if (!v19)
      goto LABEL_24;
    if (v19 != 41)
    {
      if ((v20 & v51) != 1)
      {
        if (v20)
        {
          brc_bread_crumbs();
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v31 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412546;
            v61 = (uint64_t)v18;
            v62 = 2112;
            v63 = v30;
            _os_log_debug_impl(&dword_1CBD43000, v31, OS_LOG_TYPE_DEBUG, "[DEBUG] we're done downloading %@%@", buf, 0x16u);
          }

          objc_msgSend(v52, "removeObject:", v18);
LABEL_17:
          v27 = 1;
        }
        else
        {
          objc_msgSend(v52, "removeObject:", v18);
          if (v19 == 42)
          {
            brc_bread_crumbs();
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            brc_default_log();
            v33 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v61 = (uint64_t)v32;
              _os_log_debug_impl(&dword_1CBD43000, v33, OS_LOG_TYPE_DEBUG, "[DEBUG] rescheduling winner%@", buf, 0xCu);
            }

            v47 = 1;
          }
          brc_bread_crumbs();
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v35 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v61 = (uint64_t)v34;
            _os_log_debug_impl(&dword_1CBD43000, v35, OS_LOG_TYPE_DEBUG, "[DEBUG] suspending apply for download%@", buf, 0xCu);
          }

          v27 = v50;
          if (!v50)
            v27 = 23;
        }
        v50 = v27;
        goto LABEL_24;
      }
      brc_bread_crumbs();
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT))
      {
        objc_msgSend(v8, "itemID");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v61 = (uint64_t)v18;
        v62 = 2112;
        v63 = v36;
        v64 = 2112;
        v65 = v28;
        _os_log_fault_impl(&dword_1CBD43000, v29, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: We thought we finished downloading loser etag %@ for %@ but it wasn't found, so rescheduling%@", buf, 0x20u);

      }
      goto LABEL_23;
    }
    brc_bread_crumbs();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412546;
      v61 = (uint64_t)v18;
      v62 = 2112;
      v63 = v23;
      _os_log_debug_impl(&dword_1CBD43000, v24, OS_LOG_TYPE_DEBUG, "[DEBUG] Not rescheduling download %@ which hit a permanent failure%@", buf, 0x16u);
    }

    objc_msgSend(v52, "removeObject:", v18);
LABEL_24:
    __brc_leave_section(v57);

    objc_autoreleasePoolPop(v16);
  }
  if ((v47 & 1) != 0)
    -[BRCFSDownloader rescheduleJobsPendingWinnerForItem:](self, "rescheduleJobsPendingWinnerForItem:", v8);
  if (objc_msgSend(v52, "count"))
  {
    v37 = v50;
    v55 = 0u;
    v56 = 0u;
    if (!v50)
      v37 = 23;
    v50 = v37;
    v53 = 0uLL;
    v54 = 0uLL;
    v38 = v52;
    v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v53, v59, 16);
    if (v39)
    {
      v40 = *(_QWORD *)v54;
      do
      {
        for (i = 0; i != v39; ++i)
        {
          if (*(_QWORD *)v54 != v40)
            objc_enumerationMutation(v38);
          -[BRCFSDownloader _createDownloadingJobForItem:state:kind:etag:userInitiated:stageFileName:error:](self, "_createDownloadingJobForItem:state:kind:etag:userInitiated:stageFileName:error:", v8, 1, 2, *(_QWORD *)(*((_QWORD *)&v53 + 1) + 8 * i), 0, 0, 0);
        }
        v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v53, v59, 16);
      }
      while (v39);
    }

  }
  v42 = -[BRCFSDownloader _hasLosersToDelete:serverItem:](self, "_hasLosersToDelete:serverItem:", v8, v48);
  if (a6)
  {
    v43 = v50;
    if (v42)
      v43 = 1;
    *a6 = v43;
  }
  __brc_leave_section(v58);

}

- (BOOL)applyLosersToItem:(id)a3 serverItem:(id)a4 atURL:(id)a5 applySchedulerState:(int *)a6 addedLosers:(id)a7 removedLosers:(id)a8
{
  id v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  NSObject *v33;
  NSObject *v34;
  const char *v35;
  uint32_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t j;
  char v40;
  void *v41;
  void *v42;
  NSObject *v43;
  id v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t k;
  void *v48;
  char v49;
  id v50;
  void *v51;
  NSObject *v52;
  void *v53;
  NSObject *v54;
  uint64_t v56;
  void *v57;
  void *v58;
  id v59;
  void *v60;
  NSObject *v61;
  void *v62;
  NSObject *v63;
  void *v65;
  id v66;
  id v67;
  void *v68;
  id v69;
  void *v70;
  id v71;
  id v72;
  void *v73;
  void *v74;
  id obj;
  id v76;
  id v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  _QWORD v83[4];
  id v84;
  id v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  id v90;
  id v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  uint64_t v96[3];
  id v97;
  _BYTE v98[128];
  uint8_t v99[128];
  uint8_t buf[4];
  uint64_t v101;
  __int16 v102;
  id v103;
  __int16 v104;
  id v105;
  __int16 v106;
  void *v107;
  _BYTE v108[128];
  uint64_t v109;

  v109 = *MEMORY[0x1E0C80C00];
  v76 = a3;
  v67 = a4;
  v66 = a5;
  v12 = a7;
  v13 = a8;
  v65 = v12;
  if (!v12)
  {
    v59 = v13;
    brc_bread_crumbs();
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v61 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v61, OS_LOG_TYPE_FAULT))
      -[BRCFSDownloader(LegacyAdditions) applyLosersToItem:serverItem:atURL:applySchedulerState:addedLosers:removedLosers:].cold.3();

    v13 = v59;
  }
  v74 = v13;
  if (!v13)
  {
    brc_bread_crumbs();
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v63 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v63, OS_LOG_TYPE_FAULT))
      -[BRCFSDownloader(LegacyAdditions) applyLosersToItem:serverItem:atURL:applySchedulerState:addedLosers:removedLosers:].cold.2();

  }
  objc_msgSend(MEMORY[0x1E0D25D48], "manager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v97 = 0;
  objc_msgSend(v14, "permanentStorageForItemAtURL:allocateIfNone:error:", v66, 0, &v97);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v97;

  if (v68)
  {
    memset(v96, 0, sizeof(v96));
    __brc_create_section(0, (uint64_t)"-[BRCFSDownloader(LegacyAdditions) applyLosersToItem:serverItem:atURL:applySchedulerState:addedLosers:removedLosers:]", 299, v96);
    brc_bread_crumbs();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      v56 = v96[0];
      objc_msgSend(v66, "path");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218498;
      v101 = v56;
      v102 = 2112;
      v103 = v57;
      v104 = 2112;
      v105 = v16;
      _os_log_debug_impl(&dword_1CBD43000, v17, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx discovering conflict losers which are live at %@%@", buf, 0x20u);

    }
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)MEMORY[0x1E0C99E20];
    objc_msgSend(v76, "currentVersion");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "conflictLoserEtags");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setWithSet:", v21);
    v73 = (void *)objc_claimAutoreleasedReturnValue();

    v72 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v71 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(v68, "enumeratorForAdditionsInNameSpace:withOptions:withoutOptions:ordering:", *MEMORY[0x1E0D25D30], 0, 0, 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "latestVersion");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "conflictLoserEtags");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "unionSet:", v24);

    objc_msgSend(v76, "resolvedConflictLoserEtags");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "minusSet:", v25);

    v94 = 0u;
    v95 = 0u;
    v92 = 0u;
    v93 = 0u;
    obj = v22;
    v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v92, v108, 16);
    if (v26)
    {
      v27 = *(_QWORD *)v93;
      do
      {
        for (i = 0; i != v26; ++i)
        {
          if (*(_QWORD *)v93 != v27)
            objc_enumerationMutation(obj);
          v29 = *(void **)(*((_QWORD *)&v92 + 1) + 8 * i);
          v90 = 0;
          v91 = 0;
          if ((objc_msgSend(v29, "brc_parseMangledID:itemID:etag:session:", 0, &v91, &v90, self->super.super._session) & 1) == 0)
          {
            brc_bread_crumbs();
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            brc_default_log();
            v33 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v33, (os_log_type_t)0x90u))
            {
              *(_DWORD *)buf = 138412546;
              v101 = (uint64_t)v29;
              v102 = 2112;
              v103 = v32;
              _os_log_error_impl(&dword_1CBD43000, v33, (os_log_type_t)0x90u, "[ERROR] invalid addition name for %@%@", buf, 0x16u);
            }
            goto LABEL_22;
          }
          v30 = v91;
          objc_msgSend(v76, "itemID");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          LOBYTE(v30) = objc_msgSend(v30, "isEqualToItemID:", v31);

          if ((v30 & 1) != 0)
          {
            if ((objc_msgSend(v73, "containsObject:", v90) & 1) != 0)
            {
              objc_msgSend(v72, "addObject:", v90);
              objc_msgSend(v71, "setObject:forKeyedSubscript:", v29, v90);
              goto LABEL_23;
            }
            brc_bread_crumbs();
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            brc_default_log();
            v33 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              v101 = (uint64_t)v90;
              v102 = 2112;
              v103 = v32;
              v34 = v33;
              v35 = "[WARNING] ETag %@ is no longer a loser%@";
              v36 = 22;
              goto LABEL_21;
            }
          }
          else
          {
            brc_bread_crumbs();
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            brc_default_log();
            v33 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138413058;
              v101 = (uint64_t)v91;
              v102 = 2112;
              v103 = v29;
              v104 = 2112;
              v105 = v76;
              v106 = 2112;
              v107 = v32;
              v34 = v33;
              v35 = "[WARNING] invalid itemID %@ (for %@ in %@)%@";
              v36 = 42;
LABEL_21:
              _os_log_impl(&dword_1CBD43000, v34, OS_LOG_TYPE_DEFAULT, v35, buf, v36);
            }
          }
LABEL_22:

          objc_msgSend(v18, "addObject:", v29);
LABEL_23:

        }
        v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v92, v108, 16);
      }
      while (v26);
    }

    objc_msgSend(v76, "liveConflictLoserEtags");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    v88 = 0u;
    v89 = 0u;
    v87 = 0u;
    v86 = 0u;
    v69 = v71;
    v37 = objc_msgSend(v69, "countByEnumeratingWithState:objects:count:", &v86, v99, 16);
    if (v37)
    {
      v38 = *(_QWORD *)v87;
      while (2)
      {
        for (j = 0; j != v37; ++j)
        {
          if (*(_QWORD *)v87 != v38)
            objc_enumerationMutation(v69);
          if ((objc_msgSend(v70, "containsObject:", *(_QWORD *)(*((_QWORD *)&v86 + 1) + 8 * j)) & 1) == 0)
          {

            v83[0] = MEMORY[0x1E0C809B0];
            v83[1] = 3221225472;
            v83[2] = __117__BRCFSDownloader_LegacyAdditions__applyLosersToItem_serverItem_atURL_applySchedulerState_addedLosers_removedLosers___block_invoke;
            v83[3] = &unk_1E875E9C0;
            v84 = v70;
            v85 = v65;
            objc_msgSend(v69, "enumerateKeysAndObjectsUsingBlock:", v83);

            v40 = 1;
            v41 = v84;
            goto LABEL_35;
          }
        }
        v37 = objc_msgSend(v69, "countByEnumeratingWithState:objects:count:", &v86, v99, 16);
        if (v37)
          continue;
        break;
      }
    }
    v40 = 0;
    v41 = v69;
LABEL_35:

    brc_bread_crumbs();
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v43 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
      -[BRCFSDownloader(LegacyAdditions) applyLosersToItem:serverItem:atURL:applySchedulerState:addedLosers:removedLosers:].cold.1();

    objc_msgSend(v76, "setLiveConflictLoserEtags:", v72);
    v81 = 0u;
    v82 = 0u;
    v79 = 0u;
    v80 = 0u;
    v44 = v18;
    v45 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v79, v98, 16);
    if (v45)
    {
      v46 = *(_QWORD *)v80;
      do
      {
        for (k = 0; k != v45; ++k)
        {
          if (*(_QWORD *)v80 != v46)
            objc_enumerationMutation(v44);
          v48 = *(void **)(*((_QWORD *)&v79 + 1) + 8 * k);
          v78 = v15;
          v49 = objc_msgSend(v48, "_br_markResolvedWithError:", &v78);
          v50 = v78;

          v15 = v50;
          if ((v49 & 1) != 0)
          {
            objc_msgSend(v74, "addObject:", v48);
            v40 = 1;
          }
          else
          {
            brc_bread_crumbs();
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            brc_default_log();
            v52 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v52, (os_log_type_t)0x90u))
            {
              *(_DWORD *)buf = 138412802;
              v101 = (uint64_t)v48;
              v102 = 2112;
              v103 = v15;
              v104 = 2112;
              v105 = v51;
              _os_log_error_impl(&dword_1CBD43000, v52, (os_log_type_t)0x90u, "[ERROR] can't remove conflict loser for %@: %@%@", buf, 0x20u);
            }

          }
        }
        v45 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v79, v98, 16);
      }
      while (v45);
    }

    -[BRCFSDownloader scheduleLosersDownloadForItem:serverItem:purgeStaleEntries:applySchedulerState:](self, "scheduleLosersDownloadForItem:serverItem:purgeStaleEntries:applySchedulerState:", v76, v67, 1, a6);
    __brc_leave_section(v96);
  }
  else
  {
    brc_bread_crumbs();
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v54 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v54, (os_log_type_t)0x90u))
    {
      objc_msgSend(v66, "path");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v101 = (uint64_t)v58;
      v102 = 2112;
      v103 = v15;
      v104 = 2112;
      v105 = v53;
      _os_log_error_impl(&dword_1CBD43000, v54, (os_log_type_t)0x90u, "[ERROR] can't get permanent storage of %@: %@%@", buf, 0x20u);

    }
    v40 = 0;
    if (a6)
      *a6 = 1;
  }

  return v40 & 1;
}

void __117__BRCFSDownloader_LegacyAdditions__applyLosersToItem_serverItem_atURL_applySchedulerState_addedLosers_removedLosers___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;

  v5 = a3;
  if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:", a2) & 1) == 0)
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v5);

}

- (id)generateThumbnailStageFileNameForItem:(id)a3 etag:(id)a4
{
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = a4;
  v7 = objc_msgSend(a3, "dbRowID");
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "UUIDString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("thumbnail-%lld-%@-%@"), v7, v6, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)_sendThumbnailsBatch:(id)a3 sizeHint:(int64_t)a4 maxRecordsCount:(unint64_t)a5
{
  id v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  BRCDownloadThumbnailsBatchOperation *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  BRCFSDownloader *v21;
  void *v22;
  BRCDownloadThumbnail *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  id v33;
  BRCFSDownloader *v34;
  _QWORD v35[5];
  id v36;
  id v37;
  uint8_t buf[4];
  uint64_t v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  void *v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  +[BRCAccountsManager sharedManager](BRCAccountsManager, "sharedManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isInSyncBubble");

  if (v9)
  {
    brc_bread_crumbs();
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_FAULT))
      -[BRCFSDownloader(LegacyAdditions) _sendThumbnailsBatch:sizeHint:maxRecordsCount:].cold.1();

  }
  objc_msgSend(v7, "syncContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  v12 = 0;
  v13 = 0;
  v14 = 0;
  v15 = 0;
  if (objc_msgSend(0, "itemsCount") >= a5)
    goto LABEL_17;
  v34 = self;
  v32 = v10;
  v12 = 0;
  v11 = 0;
  v16 = 0;
  v14 = 0;
  v15 = 0;
  v33 = v7;
  while (1)
  {
    v17 = v11;
    v18 = (void *)MEMORY[0x1D17A6BE8]();
    objc_msgSend(v7, "nextDocumentItem");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v11)
      break;
    objc_msgSend(v7, "stageID");
    v19 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "etag");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = v19;
    if (v19)
    {
      if (!v12)
        goto LABEL_9;
    }
    else
    {
      -[BRCFSDownloader generateThumbnailStageFileNameForItem:etag:](v34, "generateThumbnailStageFileNameForItem:etag:", v11, v13);
      v20 = objc_claimAutoreleasedReturnValue();
      if (!v12)
      {
LABEL_9:
        v12 = -[BRCDownloadThumbnailsBatchOperation initWithSyncContext:]([BRCDownloadThumbnailsBatchOperation alloc], "initWithSyncContext:", v32);
        -[_BRCOperation operationID](v12, "operationID");
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        v35[0] = MEMORY[0x1E0C809B0];
        v35[1] = 3221225472;
        v35[2] = __82__BRCFSDownloader_LegacyAdditions___sendThumbnailsBatch_sizeHint_maxRecordsCount___block_invoke;
        v35[3] = &unk_1E875E9E8;
        v21 = v34;
        v35[4] = v34;
        v36 = v32;
        v15 = v22;
        v37 = v15;
        -[BRCDownloadThumbnailsBatchOperation setPerDownloadCompletionBlock:](v12, "setPerDownloadCompletionBlock:", v35);

        goto LABEL_10;
      }
    }
    v21 = v34;
LABEL_10:
    v14 = (void *)v20;
    v23 = -[BRCDownloadThumbnail initWithDocument:stageID:etag:]([BRCDownloadThumbnail alloc], "initWithDocument:stageID:etag:", v11, v20, v13);
    objc_msgSend(MEMORY[0x1E0C94F88], "br_downloadThumbnails");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[_BRCOperation setGroup:](v12, "setGroup:", v24);

    -[BRCDownloadThumbnailsBatchOperation addDownload:](v12, "addDownload:", v23);
    -[BRCFSDownloader _willDownload:operationID:](v21, "_willDownload:operationID:", v23, v15);

    objc_autoreleasePoolPop(v18);
    v16 = v13;
    v7 = v33;
    if (-[BRCTransferBatchOperation itemsCount](v12, "itemsCount") >= a5)
    {
      if (v12)
        goto LABEL_12;
LABEL_16:
      v10 = v32;
      goto LABEL_17;
    }
  }
  objc_autoreleasePoolPop(v18);
  v13 = v16;
  if (!v12)
    goto LABEL_16;
LABEL_12:
  brc_bread_crumbs();
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v26 = objc_claimAutoreleasedReturnValue();
  v10 = v32;
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    v27 = -[BRCTransferBatchOperation itemsCount](v12, "itemsCount");
    objc_msgSend(v32, "contextIdentifier");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218498;
    v39 = v27;
    v40 = 2112;
    v41 = v28;
    v42 = 2112;
    v43 = v25;
    _os_log_impl(&dword_1CBD43000, v26, OS_LOG_TYPE_DEFAULT, "[NOTICE] downloading %ld thumbnails in %@%@", buf, 0x20u);

    v10 = v32;
  }

  objc_msgSend(v10, "downloadStream");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "addBatchOperation:", v12);

LABEL_17:
}

uint64_t __82__BRCFSDownloader_LegacyAdditions___sendThumbnailsBatch_sizeHint_maxRecordsCount___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_finishedDownload:syncContext:operationID:error:", a2, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), a3);
}

- (BOOL)hasThumbnailToApplyForItem:(id)a3
{
  BRCAccountSession *session;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;

  session = self->super.super._session;
  v4 = a3;
  -[BRCAccountSession clientDB](session, "clientDB");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "dbRowID");

  v7 = (void *)objc_msgSend(v5, "numberWithSQL:", CFSTR("SELECT 1 FROM client_downloads WHERE throttle_id = %llu AND download_kind = %u AND transfer_queue = %@ LIMIT 1"), v6, 1, CFSTR("_done"));
  LOBYTE(v5) = objc_msgSend(v7, "BOOLValue");

  return (char)v5;
}

- (void)scheduleThumbnailDownloadForItem:(id)a3 serverItem:(id)a4 applySchedulerState:(int *)a5
{
  id v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  int v21;
  int v22;
  int v23;
  int v24;
  int v25;
  void *v26;
  NSObject *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  NSObject *v31;
  uint64_t v32;
  void *v33;
  id v35;
  uint64_t v36[3];
  uint8_t buf[4];
  uint64_t v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  id v42;
  __int16 v43;
  id v44;
  __int16 v45;
  void *v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v35 = a4;
  memset(v36, 0, sizeof(v36));
  __brc_create_section(0, (uint64_t)"-[BRCFSDownloader(LegacyAdditions) scheduleThumbnailDownloadForItem:serverItem:applySchedulerState:]", 450, v36);
  brc_bread_crumbs();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    v32 = v36[0];
    objc_msgSend(v7, "itemID");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134219010;
    v38 = v32;
    v39 = 2112;
    v40 = v33;
    v41 = 2112;
    v42 = v7;
    v43 = 2112;
    v44 = v35;
    v45 = 2112;
    v46 = v8;
    _os_log_debug_impl(&dword_1CBD43000, v9, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx scheduling thumbnail download for %@\nlocal: %@\nserver: %@%@", buf, 0x34u);

  }
  v10 = objc_msgSend(v7, "dbRowID");
  objc_msgSend(v35, "latestVersion");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "hasThumbnail");

  if ((v12 & 1) != 0)
  {
    objc_msgSend(v35, "latestVersion");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "ckInfo");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "etag");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    -[BRCAccountSession clientDB](self->super.super._session, "clientDB");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v16, "fetch:", CFSTR("SELECT transfer_queue, download_etag, throttle_state FROM client_downloads  WHERE throttle_id = %lld AND download_kind = %u AND throttle_state != 0"), v10, 1);

    v18 = 23;
    while (objc_msgSend(v17, "next"))
    {
      objc_msgSend(v17, "stringAtIndex:", 0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "stringAtIndex:", 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v17, "intAtIndex:", 2);
      v22 = objc_msgSend(v15, "isEqualToString:", v20);
      if (v21 == 1)
        v23 = v22;
      else
        v23 = 0;
      if (v23 == 1)
      {
        v24 = objc_msgSend(v19, "isEqualToString:", CFSTR("_done"));
        if (v18 == 1)
          v25 = 1;
        else
          v25 = v24;
        if (v25)
          v18 = 1;

        brc_bread_crumbs();
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412546;
          v38 = (uint64_t)v20;
          v39 = 2112;
          v40 = v26;
          _os_log_debug_impl(&dword_1CBD43000, v27, OS_LOG_TYPE_DEBUG, "[DEBUG] existing throttle thumbnail with etag:%@%@", buf, 0x16u);
        }

        v15 = 0;
      }
      else
      {
        brc_bread_crumbs();
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412546;
          v38 = (uint64_t)v20;
          v39 = 2112;
          v40 = v28;
          _os_log_debug_impl(&dword_1CBD43000, v29, OS_LOG_TYPE_DEBUG, "[DEBUG] cancelling thumbnail throttle with etag:%@%@", buf, 0x16u);
        }

        -[BRCFSDownloader cancelAndCleanupItemDownload:kind:etag:](self, "cancelAndCleanupItemDownload:kind:etag:", v7, 1, v20);
      }

    }
    if (v15)
      -[BRCFSDownloader _createDownloadingJobForItem:state:kind:etag:userInitiated:stageFileName:error:](self, "_createDownloadingJobForItem:state:kind:etag:userInitiated:stageFileName:error:", v7, 1, 1, v15, 0, 0, 0);

  }
  else
  {
    brc_bread_crumbs();
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
      -[BRCFSDownloader(LegacyAdditions) scheduleThumbnailDownloadForItem:serverItem:applySchedulerState:].cold.1();

    -[BRCFSDownloader cancelAndCleanupItemDownload:kind:](self, "cancelAndCleanupItemDownload:kind:", v7, 1);
    v18 = 0;
  }
  if (a5)
    *a5 = v18;
  __brc_leave_section(v36);

}

- (BOOL)applyThumbnailToItem:(id)a3 serverItem:(id)a4 atURL:(id)a5 applySchedulerState:(int *)a6
{
  NSObject *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  void *v21;
  int v22;
  void *v23;
  int v24;
  void *v25;
  NSObject *v26;
  int v27;
  void *v28;
  NSObject *v29;
  void *v30;
  int v31;
  uint64_t v32;
  NSObject *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  NSObject *v41;
  void *v42;
  void *v43;
  void *v44;
  NSObject *v45;
  uint64_t v46;
  NSObject *v47;
  uint64_t v49;
  void *v50;
  NSObject *v51;
  NSObject *v52;
  NSObject *v53;
  int *v54;
  void *v55;
  void *v56;
  void *v57;
  BRCFSDownloader *v58;
  NSObject *log;
  os_log_t loga;
  id v61;
  id v62;
  id v63;
  uint64_t v64;
  uint64_t v65;
  uint8_t buf[4];
  os_log_t v67;
  __int16 v68;
  id v69;
  __int16 v70;
  uint64_t v71;
  __int16 v72;
  void *v73;
  uint64_t v74;

  v74 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  objc_msgSend(v11, "latestVersion");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "ckInfo");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "etag");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "latestVersion");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v14) = objc_msgSend(v16, "hasThumbnail");

  if ((_DWORD)v14)
  {
    -[BRCAccountSession clientDB](self->super.super._session, "clientDB");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(v17, "fetch:", CFSTR("SELECT throttle_state, transfer_queue, transfer_stage, transfer_record   FROM client_downloads  WHERE throttle_id = %lld AND download_kind = %u AND download_etag = %@"), -[NSObject dbRowID](v10, "dbRowID"), 1, v15);

    v19 = 0;
  }
  else
  {
    -[NSObject liveThumbnailSignature](v10, "liveThumbnailSignature");
    v20 = objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      v21 = (void *)v20;
      v63 = 0;
      v22 = objc_msgSend(MEMORY[0x1E0CD32B0], "removeAdditionsOnURL:error:", v12, &v63);
      v19 = v63;

      if (v22)
      {
        objc_msgSend(v11, "latestVersion");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject learnThumbnailSignatureFromLiveVersion:](v10, "learnThumbnailSignatureFromLiveVersion:", v23);

        v18 = 0;
        LOBYTE(v24) = 1;
        goto LABEL_13;
      }
      if (v19)
      {
        brc_bread_crumbs();
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, (os_log_type_t)0x90u))
        {
          *(_DWORD *)buf = 138412802;
          v67 = v10;
          v68 = 2112;
          v69 = v19;
          v70 = 2112;
          v71 = (uint64_t)v25;
          _os_log_error_impl(&dword_1CBD43000, v26, (os_log_type_t)0x90u, "[ERROR] Failed removing thumbnail from %@ - %@%@", buf, 0x20u);
        }

      }
    }
    else
    {
      v19 = 0;
    }
    v18 = 0;
  }
  LOBYTE(v24) = 0;
LABEL_13:
  if (!objc_msgSend(v18, "next"))
  {
    v27 = 0;
    if (!a6)
      goto LABEL_37;
    goto LABEL_36;
  }
  v58 = self;
  v61 = v12;
  v27 = objc_msgSend(v18, "intAtIndex:", 0);
  brc_bread_crumbs();
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v29 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
  {
    -[NSObject itemID](v10, "itemID");
    loga = (os_log_t)objc_claimAutoreleasedReturnValue();
    v49 = BRCPrettyPrintEnum();
    *(_DWORD *)buf = 138413058;
    v67 = loga;
    v68 = 2112;
    v69 = v15;
    v70 = 2080;
    v71 = v49;
    v72 = 2112;
    v73 = v28;
    _os_log_debug_impl(&dword_1CBD43000, v29, OS_LOG_TYPE_DEBUG, "[DEBUG] existing thumbnail for %@_%@ has state %s%@", buf, 0x2Au);

  }
  if (v27)
  {
    if (v27 == 1)
    {
      objc_msgSend(v18, "stringAtIndex:", 1);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_msgSend(v30, "isEqualToString:", CFSTR("_done"));

      if (v31)
      {
        v54 = a6;
        objc_msgSend(v18, "stringAtIndex:", 2);
        v32 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "unarchivedObjectOfClass:atIndex:", objc_opt_class(), 3);
        v33 = objc_claimAutoreleasedReturnValue();
        -[BRCAccountSession stageRegistry](v58->super.super._session, "stageRegistry");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v56 = (void *)v32;
        objc_msgSend(v34, "createURLForDownloadWithStageID:name:", v32, CFSTR("thumbnail"));
        v35 = objc_claimAutoreleasedReturnValue();

        v64 = *MEMORY[0x1E0C998A8];
        v65 = v35;
        v57 = (void *)v35;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v65, &v64, 1);
        v36 = objc_claimAutoreleasedReturnValue();
        v37 = (void *)MEMORY[0x1E0CD32B0];
        log = v33;
        -[NSObject objectForKeyedSubscript:](v33, "objectForKeyedSubscript:", CFSTR("thumbQLMetadata"));
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v62 = v19;
        v55 = (void *)v36;
        v24 = objc_msgSend(v37, "associateThumbnailImagesDictionary:serializedQuickLookMetadata:withDocumentAtURL:error:", v36, v38, v61, &v62);
        v39 = v62;

        if (v24)
        {
          brc_bread_crumbs();
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v41 = objc_claimAutoreleasedReturnValue();
          a6 = v54;
          if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
          {
            -[NSObject itemID](v10, "itemID");
            v52 = objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412802;
            v67 = v52;
            v68 = 2112;
            v69 = v15;
            v70 = 2112;
            v71 = (uint64_t)v40;
            _os_log_debug_impl(&dword_1CBD43000, v41, OS_LOG_TYPE_DEBUG, "[DEBUG] thumbnail for %@_%@ associated, notifying file coordinator%@", buf, 0x20u);

          }
          objc_msgSend(MEMORY[0x1E0CB3600], "__itemAtURL:didChangeWithPurposeID:", v61, CFSTR("com.apple.bird"));
          objc_msgSend(v11, "latestVersion");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject learnThumbnailSignatureFromLiveVersion:](v10, "learnThumbnailSignatureFromLiveVersion:", v42);
        }
        else
        {
          brc_bread_crumbs();
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v47 = objc_claimAutoreleasedReturnValue();
          a6 = v54;
          if (os_log_type_enabled(v47, (os_log_type_t)0x90u))
          {
            objc_msgSend(v57, "path");
            v53 = objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412802;
            v67 = v53;
            v68 = 2112;
            v69 = v39;
            v70 = 2112;
            v71 = (uint64_t)v42;
            _os_log_error_impl(&dword_1CBD43000, v47, (os_log_type_t)0x90u, "[ERROR] Failed to save thumbnail from %@: %@%@", buf, 0x20u);

          }
        }

        -[BRCFSDownloader cancelAndCleanupItemDownload:kind:etag:](v58, "cancelAndCleanupItemDownload:kind:etag:", v10, 1, v15);
        v27 = 0;
        v43 = v56;
        goto LABEL_34;
      }
      brc_bread_crumbs();
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      log = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG))
      {
        -[NSObject itemID](v10, "itemID");
        v50 = v43;
        v51 = objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v67 = v51;
        v68 = 2112;
        v69 = v15;
        v70 = 2112;
        v71 = (uint64_t)v50;
        _os_log_debug_impl(&dword_1CBD43000, log, OS_LOG_TYPE_DEBUG, "[DEBUG] thumbnail for %@_%@ still pending download%@", buf, 0x20u);

        v43 = v50;
      }
    }
    else
    {
      brc_bread_crumbs();
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      log = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG))
      {
        -[NSObject itemID](v10, "itemID");
        v44 = v43;
        v45 = objc_claimAutoreleasedReturnValue();
        v46 = BRCPrettyPrintEnum();
        *(_DWORD *)buf = 138413058;
        v67 = v45;
        v68 = 2112;
        v69 = v15;
        v70 = 2080;
        v71 = v46;
        v72 = 2112;
        v73 = v44;
        _os_log_debug_impl(&dword_1CBD43000, log, OS_LOG_TYPE_DEBUG, "[DEBUG] thumbnail for %@_%@ has state %s%@", buf, 0x2Au);

        v43 = v44;
      }
    }
    v27 = 23;
    v39 = v19;
LABEL_34:

    v19 = v39;
  }
  v12 = v61;
  if (a6)
LABEL_36:
    *a6 = v27;
LABEL_37:

  return v24;
}

- (BRCFSDownloader)initWithAccountSession:(id)a3
{
  id v4;
  BRCFSDownloader *v5;
  void *v6;
  void *v7;
  id v8;
  dispatch_workloop_t v9;
  BRCFairScheduler *v10;
  BRCFairScheduler *fairScheduler;
  BRCDeadlineScheduler *v12;
  BRCDeadlineScheduler *downloadsDeadlineScheduler;
  uint64_t v14;
  brc_task_tracker *tracker;
  NSMutableDictionary *v16;
  NSMutableDictionary *willRetryOperationProgress;
  void *v18;
  double v19;
  objc_super v21;

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)BRCFSDownloader;
  v5 = -[BRCFSSchedulerBase initWithSession:name:tableName:](&v21, sel_initWithSession_name_tableName_, v4, CFSTR("Downloader"), CFSTR("client_downloads"));
  if (v5)
  {
    objc_msgSend(v4, "personaIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    BRPersonaSpecificName();
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = objc_retainAutorelease(v7);
    v9 = dispatch_workloop_create((const char *)objc_msgSend(v8, "UTF8String"));
    v10 = -[BRCFairScheduler initWithWorkloop:name:]([BRCFairScheduler alloc], "initWithWorkloop:name:", v9, v8);
    fairScheduler = v5->_fairScheduler;
    v5->_fairScheduler = v10;

    v12 = -[BRCDeadlineScheduler initWithName:fairScheduler:]([BRCDeadlineScheduler alloc], "initWithName:fairScheduler:", CFSTR("com.apple.bird.downloader"), v5->_fairScheduler);
    downloadsDeadlineScheduler = v5->_downloadsDeadlineScheduler;
    v5->_downloadsDeadlineScheduler = v12;

    -[BRCDeadlineScheduler setCoalescingLeeway:](v5->_downloadsDeadlineScheduler, "setCoalescingLeeway:", 10000000);
    brc_task_tracker_create("com.apple.bird.download-tracker");
    v14 = objc_claimAutoreleasedReturnValue();
    tracker = v5->_tracker;
    v5->_tracker = (brc_task_tracker *)v14;

    v16 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    willRetryOperationProgress = v5->_willRetryOperationProgress;
    v5->_willRetryOperationProgress = v16;

    +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "downloadSizeRefreshInterval");
    v5->_activeDownloadSizeRefreshInterval = v19;

  }
  return v5;
}

- (void)resume
{
  void *v3;
  void *v4;
  objc_super v5;
  _QWORD v6[5];

  -[BRCAccountSession expensiveReadOnlyDB](self->super.super._session, "expensiveReadOnlyDB");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "serialQueue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __25__BRCFSDownloader_resume__block_invoke;
  v6[3] = &unk_1E875D500;
  v6[4] = self;
  dispatch_async_with_logs_4(v4, v6);
  -[BRCDeadlineScheduler resume](self->_downloadsDeadlineScheduler, "resume");
  -[BRCFairScheduler resume](self->_fairScheduler, "resume");
  v5.receiver = self;
  v5.super_class = (Class)BRCFSDownloader;
  -[BRCFSSchedulerBase resume](&v5, sel_resume);

}

void __25__BRCFSDownloader_resume__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "expensiveReadOnlyDB");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (id)objc_msgSend(v2, "fetch:", CFSTR("SELECT throttle_id   FROM client_downloads  WHERE throttle_state =1    AND download_kind = %d"), 0);

  if (objc_msgSend(v12, "next"))
  {
    do
    {
      v3 = (void *)MEMORY[0x1D17A6BE8]();
      v4 = objc_msgSend(v12, "longLongAtIndex:", 0);
      v5 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
      objc_msgSend(v5, "expensiveReadOnlyDB");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "itemByRowID:db:", v4, v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v7, "isDocument"))
      {
        objc_msgSend(v7, "st");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "stagedFileID");
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v9)
        {
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "globalProgress");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "asDocument");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "willScheduleDocumentForDownload:", v11);

        }
      }

      objc_autoreleasePoolPop(v3);
    }
    while ((objc_msgSend(v12, "next") & 1) != 0);
  }

}

- (void)suspend
{
  objc_super v3;

  -[BRCFairScheduler suspend](self->_fairScheduler, "suspend");
  -[BRCDeadlineScheduler suspend](self->_downloadsDeadlineScheduler, "suspend");
  v3.receiver = self;
  v3.super_class = (Class)BRCFSDownloader;
  -[BRCFSSchedulerBase suspend](&v3, sel_suspend);
}

- (void)close
{
  objc_super v3;

  -[BRCDeadlineScheduler close](self->_downloadsDeadlineScheduler, "close");
  -[BRCFairScheduler close](self->_fairScheduler, "close");
  v3.receiver = self;
  v3.super_class = (Class)BRCFSDownloader;
  -[BRCFSSchedulerBase close](&v3, sel_close);
}

- (void)_close
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BRCFSDownloader;
  -[BRCFSSchedulerBase _close](&v3, sel__close);
  brc_task_tracker_wait((uint64_t)self->_tracker);
}

- (void)cancel
{
  objc_super v3;

  -[BRCDeadlineScheduler cancel](self->_downloadsDeadlineScheduler, "cancel");
  v3.receiver = self;
  v3.super_class = (Class)BRCFSDownloader;
  -[BRCFSSchedulerBase cancel](&v3, sel_cancel);
  brc_task_tracker_cancel(self->_tracker);
}

- (void)_willDownload:(id)a3 operationID:(id)a4
{
  BRCAccountSession *session;
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;

  session = self->super.super._session;
  v6 = a4;
  v7 = a3;
  -[BRCAccountSession clientDB](session, "clientDB");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stageID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "transferID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v7, "kind");
  objc_msgSend(v7, "etag");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "execute:", CFSTR("UPDATE client_downloads SET  transfer_stage = %@, transfer_operation = %@ WHERE throttle_id = %@ AND download_kind = %u AND download_etag = %@"), v8, v6, v9, v10, v11);
}

- (unint64_t)_bumpThrottleForDownload:(id)a3 throttle:(id)a4
{
  id v6;
  id v7;
  BRCDownloadJobIdentifier *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  BRCDownloadJobIdentifier *v13;
  id v14;
  objc_super v16;

  v6 = a4;
  v7 = a3;
  v8 = [BRCDownloadJobIdentifier alloc];
  objc_msgSend(v7, "transferID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "unsignedLongLongValue");
  objc_msgSend(v7, "etag");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v7, "kind");

  v13 = -[BRCDownloadJobIdentifier initWithDBRowID:etag:kind:](v8, "initWithDBRowID:etag:kind:", v10, v11, v12);
  v16.receiver = self;
  v16.super_class = (Class)BRCFSDownloader;
  v14 = -[BRCFSSchedulerBase postponeJobID:withThrottle:](&v16, sel_postponeJobID_withThrottle_, v13, v6);

  return (unint64_t)v14;
}

- (id)descriptionForItem:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  _QWORD v14[4];
  id v15;
  BRCFSDownloader *v16;
  id v17;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0DE81E0], "rawInjection:length:", "ORDER BY download_kind, download_etag", 37);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DE81E0], "rawInjection:length:", "download_kind, download_etag, transfer_operation, transfer_queue, download_error, app_library_rowid", 99);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __46__BRCFSDownloader_descriptionForItem_context___block_invoke;
  v14[3] = &unk_1E87608C0;
  v15 = v7;
  v16 = self;
  v17 = v6;
  v10 = v6;
  v11 = v7;
  -[BRCFSSchedulerBase descriptionForJobsMatching:ordering:additionalColumns:additionalValuesHandler:context:](self, "descriptionForJobsMatching:ordering:additionalColumns:additionalValuesHandler:context:", v10, v8, v9, v14, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

void __46__BRCFSDownloader_descriptionForItem_context___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4, int a5)
{
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  id v26;

  v26 = a2;
  v9 = a3;
  objc_msgSend(v9, "intAtIndex:", a4);
  objc_msgSend(v9, "stringAtIndex:", (a4 + 1));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "uuidAtIndex:", (a4 + 2));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringAtIndex:", (a4 + 3));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringAtIndex:", (a4 + 4));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "numberAtIndex:", (a4 + 5));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = BRCPrettyPrintEnum();
  +[BRCDumpContext highlightedString:type:context:](BRCDumpContext, "highlightedString:type:context:", v10, 2, *(_QWORD *)(a1 + 32));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "appendFormat:", CFSTR("%s:%@"), v15, v16);

  if (!a5)
    goto LABEL_13;
  if ((objc_msgSend(v12, "isEqualToString:", CFSTR("_retry")) & 1) == 0)
  {
    if (!v11)
      goto LABEL_11;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "appLibraryByRowID:", v14);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "serverZone");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    +[BRCSyncContext transferContextForServerZone:appLibrary:](BRCSyncContext, "transferContextForServerZone:appLibrary:", v18, v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v19, "downloadStream");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(*(id *)(a1 + 48), "dbRowID"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "progressForTransferID:operationID:", v21, v11);
    v23 = v22;

    if (v23 >= 0.0)
      objc_msgSend(v26, "appendFormat:", CFSTR(" downloading:%.1f%%"), v23 * 100.0);
    else
      objc_msgSend(v26, "appendString:", CFSTR(" download:done/cancelled"));

    goto LABEL_10;
  }
  objc_msgSend(v26, "appendString:", CFSTR(" pending-retry"));
  if (v11)
  {
LABEL_10:
    objc_msgSend(v11, "UUIDString");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "appendFormat:", CFSTR(" op:%@"), v24);

  }
LABEL_11:
  if (v13)
  {
    +[BRCDumpContext highlightedString:type:context:](BRCDumpContext, "highlightedString:type:context:", v13, 3, *(_QWORD *)(a1 + 32));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "appendFormat:", CFSTR(" last-error:%@"), v25);

  }
LABEL_13:

}

- (BOOL)_createDownloadingJobForItem:(id)a3 state:(int)a4 kind:(int)a5 etag:(id)a6 userInitiated:(BOOL)a7 stageFileName:(id)a8 error:(id *)a9
{
  uint64_t v12;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  unsigned int v36;
  int v37;
  uint64_t v38;
  id v39;
  void *v40;
  BOOL v41;
  BOOL v42;
  void *v43;
  void *v44;
  void *v45;
  int v46;
  unint64_t activeDownloadsSize;
  void *v48;
  void *v49;
  uint64_t v50;
  id v51;
  void *v52;
  NSObject *v53;
  _BOOL4 v54;
  id v55;
  void *v56;
  NSObject *v57;
  BOOL v58;
  void *v59;
  void *v60;
  void *v62;
  unint64_t v63;
  BOOL v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  uint64_t v70;
  int v71;
  uint64_t v72;
  id v73;
  id v74;
  uint64_t v75;
  BOOL v76;
  void *v77;
  void *v78;
  unsigned int v79;
  BRCFSDownloader *v80;
  void *v81;
  id v82;
  BRCDownloadJobIdentifier *v83;
  void *v84;
  uint64_t v85;
  id v86;
  uint8_t buf[4];
  BRCDownloadJobIdentifier *v88;
  __int16 v89;
  void *v90;
  __int16 v91;
  unint64_t v92;
  __int16 v93;
  unint64_t v94;
  __int16 v95;
  void *v96;
  uint64_t v97;

  v12 = *(_QWORD *)&a5;
  v97 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = a6;
  v74 = a8;
  objc_msgSend(v15, "serverZone");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "appLibrary");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "syncContextUsedForTransfers");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  v82 = v16;
  v83 = -[BRCDownloadJobIdentifier initWithDBRowID:etag:kind:]([BRCDownloadJobIdentifier alloc], "initWithDBRowID:etag:kind:", objc_msgSend(v15, "dbRowID"), v16, v12);
  v80 = self;
  -[BRCAccountSession diskReclaimer](self->super.super._session, "diskReclaimer");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "accessTimestampForDocument:", v15);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "longLongValue");

  objc_msgSend(v15, "currentVersion");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "mtime");

  if (v20 <= v22)
    v23 = v22;
  else
    v23 = v20;
  v72 = v23;
  v85 = v12;
  v64 = (_DWORD)v12 == 0 && a7;
  v24 = 17;
  if (v64)
    v24 = 25;
  v70 = v24;
  if (!a7 && !objc_msgSend(v17, "hasFetchedRecentsAndFavorites"))
    a4 = 40;
  v79 = a4;
  objc_msgSend(v15, "currentVersion");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v25;
  v78 = v15;
  if ((_DWORD)v12 == 1)
    v27 = objc_msgSend(v25, "thumbnailSize");
  else
    v27 = objc_msgSend(v25, "size");
  v28 = v27;

  objc_msgSend(v84, "downloadThrottle");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DE81E0], "rawInjection:length:", "app_library_rowid, transfer_queue, transfer_size, transfer_record, transfer_stage, transfer_operation, download_kind, download_etag, download_priority, download_request_stamp, download_error, zone_rowid", 202);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = (void *)MEMORY[0x1E0DE81D0];
  objc_msgSend(v81, "dbRowID");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v84, "contextIdentifier");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "dbRowID");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "formatInjection:", CFSTR("%@, %@, %lld, %@, %@, %@, %u, %@, %ld, %lld, %@, %@"), v67, v66, v28, 0, v74, 0, v12, v82, v70, v72, 0, v69);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = (void *)MEMORY[0x1E0DE81D0];
  objc_msgSend(v81, "dbRowID");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v84, "contextIdentifier");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v77 = v17;
  objc_msgSend(v17, "dbRowID");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "formatInjection:", CFSTR("app_library_rowid = %@, transfer_queue = %@, download_priority = %ld, download_request_stamp = %lld, transfer_stage = %@ , zone_rowid = %@"), v32, v33, v70, v72, v74, v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  v86 = 0;
  v36 = v79;
  v37 = -[BRCFSSchedulerBase insertOrUpdateJobID:throttle:withState:insertedSQLColumn:insertedSQLValues:updatedSQLValues:error:](v80, "insertOrUpdateJobID:throttle:withState:insertedSQLColumn:insertedSQLValues:updatedSQLValues:error:", v83, v68, v79, v65, v30, v35, &v86);
  v75 = v38;
  v39 = v86;

  v40 = v39;
  if (a9)
    v41 = v39 == 0;
  else
    v41 = 1;
  v42 = v41;
  if (!v41)
  {
    v51 = v39;
    brc_bread_crumbs();
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v53 = objc_claimAutoreleasedReturnValue();
    v54 = os_log_type_enabled(v53, (os_log_type_t)0x90u);
    v43 = v78;
    if (v54)
      -[BRCFSDownloader _createDownloadingJobForItem:state:kind:etag:userInitiated:stageFileName:error:].cold.1((uint64_t)v51, (uint64_t)v52, v53);

    v55 = objc_retainAutorelease(v51);
    *a9 = v55;
    v45 = v81;
    v44 = v82;
LABEL_39:

    goto LABEL_40;
  }
  v43 = v78;
  v45 = v81;
  v44 = v82;
  v46 = v37;
  if (v79 != v37)
  {
    v76 = v42;
    v73 = v39;
    activeDownloadsSize = v80->_activeDownloadsSize;
    -[BRCAccountSession clientDB](v80->super.super._session, "clientDB");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = (void *)objc_msgSend(v48, "numberWithSQL:", CFSTR("SELECT transfer_size FROM client_downloads WHERE throttle_id = %lld AND download_kind = %u AND download_etag = %@"), objc_msgSend(v78, "dbRowID"), v85, v82);

    if (v79 == 1)
    {
      v50 = v80->_activeDownloadsSize + objc_msgSend(v49, "longLongValue");
      v42 = v76;
    }
    else
    {
      v42 = v76;
      if (v37 != 1)
      {
LABEL_29:
        v71 = v37;
        brc_bread_crumbs();
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v57 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v57, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(v78, "itemID");
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          v63 = v80->_activeDownloadsSize;
          *(_DWORD *)buf = 138413314;
          v88 = v83;
          v89 = 2112;
          v90 = v62;
          v91 = 2048;
          v92 = activeDownloadsSize;
          v93 = 2048;
          v94 = v63;
          v95 = 2112;
          v96 = v56;
          _os_log_debug_impl(&dword_1CBD43000, v57, OS_LOG_TYPE_DEBUG, "[DEBUG] Downloader[%@]: %@ (%llu -> %llu)%@", buf, 0x34u);

          v42 = v76;
        }

        v36 = v79;
        v46 = v71;
        v40 = v73;
        goto LABEL_32;
      }
      v50 = v80->_activeDownloadsSize - objc_msgSend(v49, "longLongValue");
    }
    v80->_activeDownloadsSize = v50;
    goto LABEL_29;
  }
LABEL_32:
  if (v36 == 1)
  {
    if (!(_DWORD)v85 && v46 != 1)
    {
      -[BRCAccountSession globalProgress](v80->super.super._session, "globalProgress");
      v58 = v42;
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v59, "willScheduleDocumentForDownload:", v78);

      v42 = v58;
    }
    objc_msgSend(v84, "downloadStream");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = v60;
    if (v64)
      objc_msgSend(v60, "forceSchedulingPendingInteractiveTransfers");
    else
      objc_msgSend(v60, "signalWithDeadline:", v75);
    goto LABEL_39;
  }
LABEL_40:

  return v42;
}

- (id)_sanitizeRecord:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_msgSend(v3, "copy");
  objc_msgSend(v4, "setTrackChanges:", 0);
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  objc_msgSend(v3, "allKeys", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v3, "objectForKeyedSubscript:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          objc_msgSend(v4, "setObject:forKeyedSubscript:", 0, v10);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  objc_msgSend(v4, "setTrackChanges:", 1);
  return v4;
}

- (void)_finishedDownload:(id)a3 syncContext:(id)a4 operationID:(id)a5 error:(id)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  char v17;
  id v18;
  BRCAccountSession *session;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const __CFString *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  int v38;
  id v39;
  void *v40;
  unint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  char v45;
  void *v46;
  void *v47;
  char v48;
  void *v49;
  unint64_t v50;
  void *v51;
  void *v52;
  NSMutableDictionary *willRetryOperationProgress;
  void *v54;
  void *v55;
  NSObject *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  uint64_t v62;
  void *v63;
  void *v64;
  void *v65;
  NSObject *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  NSObject *v72;
  id v73;
  uint64_t v74;
  id v75;
  void *v76;
  void *v77;
  _QWORD v78[5];
  id v79;
  id v80;
  id v81;
  id v82;
  id v83;
  id v84;
  uint64_t v85;
  int v86;
  int v87;
  char v88;
  _QWORD v89[5];
  id v90;
  id v91;
  id v92;
  id v93;
  int v94;
  int v95;
  _QWORD v96[4];
  id v97;
  id v98;
  uint64_t v99[3];
  uint8_t buf[4];
  uint64_t v101;
  __int16 v102;
  id v103;
  __int16 v104;
  uint64_t v105;
  __int16 v106;
  uint64_t v107;
  __int16 v108;
  const __CFString *v109;
  __int16 v110;
  void *v111;
  uint64_t v112;

  v112 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v75 = a4;
  v73 = a5;
  v11 = a6;
  +[BRCAccountsManager sharedManager](BRCAccountsManager, "sharedManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(a5) = objc_msgSend(v12, "isInSyncBubble");

  if ((_DWORD)a5)
  {
    brc_bread_crumbs();
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v72 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v72, OS_LOG_TYPE_FAULT))
      -[BRCFSDownloader _finishedDownload:syncContext:operationID:error:].cold.2();

  }
  objc_msgSend(v10, "clientZone");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stageID");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  v74 = objc_msgSend(v10, "kind");
  memset(v99, 0, sizeof(v99));
  __brc_create_section(0, (uint64_t)"-[BRCFSDownloader _finishedDownload:syncContext:operationID:error:]", 613, v99);
  brc_bread_crumbs();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    v22 = v99[0];
    objc_msgSend(v10, "transferID");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "kind");
    v24 = BRCPrettyPrintEnum();
    objc_msgSend(v10, "etag");
    v25 = objc_claimAutoreleasedReturnValue();
    v26 = (void *)v25;
    v27 = CFSTR("failed");
    *(_DWORD *)buf = 134219266;
    v101 = v22;
    v102 = 2112;
    if (!v11)
      v27 = CFSTR("done");
    v103 = v23;
    v104 = 2080;
    v105 = v24;
    v106 = 2112;
    v107 = v25;
    v108 = 2112;
    v109 = v27;
    v110 = 2112;
    v111 = v13;
    _os_log_debug_impl(&dword_1CBD43000, v14, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx Downloader[%@-%s-%@]: download %@%@", buf, 0x3Eu);

  }
  if (v76)
  {
    if (!v11 && v77)
      goto LABEL_8;
    -[BRCAccountSession stageRegistry](self->super.super._session, "stageRegistry");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "itemID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "cleanupStagedDownloadWithID:forItemID:", v76, v16);

  }
  if (!v77)
  {
    v18 = 0;
    goto LABEL_46;
  }
LABEL_8:
  if ((_DWORD)v74)
  {
    v17 = 0;
    v18 = 0;
    goto LABEL_20;
  }
  session = self->super.super._session;
  objc_msgSend(v10, "transferID");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCAccountSession itemByRowID:](session, "itemByRowID:", objc_msgSend(v20, "longLongValue"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "asDocument");
  v18 = (id)objc_claimAutoreleasedReturnValue();

  if (v11)
    goto LABEL_18;
  if ((objc_msgSend(v10, "requiresTwoPhase") & 1) == 0)
  {
    v98 = 0;
    objc_msgSend(v18, "learnStagedInfoFromDownloadStageID:error:", v76, &v98);
    v11 = v98;
LABEL_18:
    v17 = 0;
    goto LABEL_19;
  }
  v11 = 0;
  v17 = 1;
LABEL_19:
  objc_msgSend(v18, "desiredVersion");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setDownloadError:", v11);

LABEL_20:
  if (!v11)
  {
    -[BRCFSDownloader _clearDownloadErrorForDocument:](self, "_clearDownloadErrorForDocument:", v18);
    -[BRCAccountSession applyScheduler](self->super.super._session, "applyScheduler");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "itemID");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v77, "serverRankByItemID:", v35);

    -[BRCAccountSession clientDB](self->super.super._session, "clientDB");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    if ((_DWORD)v74)
      v38 = 1;
    else
      v38 = 20;
    v78[0] = MEMORY[0x1E0C809B0];
    v78[1] = 3221225472;
    v78[2] = __67__BRCFSDownloader__finishedDownload_syncContext_operationID_error___block_invoke_187;
    v78[3] = &unk_1E8760938;
    v78[4] = self;
    v79 = v10;
    v88 = v17;
    v80 = v75;
    v81 = v76;
    v86 = v74;
    v18 = v18;
    v82 = v18;
    v85 = v36;
    v87 = v38;
    v39 = v34;
    v83 = v39;
    v84 = v77;
    objc_msgSend(v37, "groupInBatch:", v78);

    v11 = 0;
    goto LABEL_46;
  }
  if ((objc_msgSend(v77, "handleZoneLevelErrorIfNeeded:forItemCreation:", v11, 0) & 1) != 0)
    goto LABEL_46;
  if (objc_msgSend(v11, "brc_isOutOfSpaceError"))
  {
    brc_bread_crumbs();
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
      -[BRCFSDownloader _finishedDownload:syncContext:operationID:error:].cold.1((uint64_t)v11);

    objc_msgSend(MEMORY[0x1E0CB35C8], "brc_errorWithDomain:code:underlyingError:", *MEMORY[0x1E0CB28A8], 640, v11);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "desiredVersion");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setDownloadError:", v31);

    objc_msgSend(v18, "saveToDB");
    v33 = 43;
  }
  else
  {
    v33 = 41;
  }
  if ((objc_msgSend(v11, "brc_isCloudKitCancellationError") & 1) != 0)
    goto LABEL_34;
  objc_msgSend(v75, "downloadThrottle");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = -[BRCFSDownloader _bumpThrottleForDownload:throttle:](self, "_bumpThrottleForDownload:throttle:", v10, v40);

  objc_msgSend(v18, "appLibrary");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "mangledID");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", v43);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v41) = v41 > objc_msgSend(v44, "downloadRetryCountForFailure");

  if (!(_DWORD)v41)
  {
LABEL_34:
    v45 = 0;
  }
  else
  {
    -[BRCFSDownloader _reportDownloadErrorForDocument:error:](self, "_reportDownloadErrorForDocument:error:", v18, v11);
    v45 = 1;
  }
  if ((objc_msgSend(v11, "brc_isCloudKitCancellationError") & 1) != 0
    || (objc_msgSend(v11, "brc_isRetriable") & 1) != 0
    || objc_msgSend(v11, "brc_isCloudKitAssetFileModified"))
  {
    objc_msgSend(v10, "progress");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v46, "completedUnitCount"))
    {
      objc_msgSend(v10, "progress");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = objc_msgSend(v47, "isFinished");

      if ((v48 & 1) != 0)
      {
LABEL_43:
        brc_bread_crumbs();
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v56 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138413058;
          v101 = (uint64_t)v10;
          v102 = 2112;
          v103 = v73;
          v104 = 2112;
          v105 = (uint64_t)v11;
          v106 = 2112;
          v107 = (uint64_t)v55;
          _os_log_debug_impl(&dword_1CBD43000, v56, OS_LOG_TYPE_DEBUG, "[DEBUG] Rescheduling %@ (%@) for retriable error: %@%@", buf, 0x2Au);
        }

        -[BRCAccountSession globalProgress](self->super.super._session, "globalProgress");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v57, "updateDownloadThrottleForDocument:toState:", v18, 1);

        -[BRCAccountSession clientDB](self->super.super._session, "clientDB");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        v96[0] = MEMORY[0x1E0C809B0];
        v96[1] = 3221225472;
        v96[2] = __67__BRCFSDownloader__finishedDownload_syncContext_operationID_error___block_invoke;
        v96[3] = &unk_1E875E1A8;
        v97 = v75;
        v59 = (void *)MEMORY[0x1D17A6DB0](v96);
        objc_msgSend(v11, "description");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "progress");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        v62 = objc_msgSend(v61, "completedUnitCount");
        objc_msgSend(v10, "transferID");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "etag");
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v58, "execute:", CFSTR("UPDATE client_downloads SET  transfer_operation = call_block(%@, next_retry_stamp), download_error = %@, unit_count_completed = %lld WHERE throttle_id = %@ AND download_kind = %u AND download_etag = %@"), v59, v60, v62, v63, v74, v64);

        goto LABEL_46;
      }
      objc_msgSend(v77, "mangledID");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", v49);
      v46 = (void *)objc_claimAutoreleasedReturnValue();

      v50 = -[NSMutableDictionary count](self->_willRetryOperationProgress, "count");
      if (v50 < objc_msgSend(v46, "downloadWillRetryProgressMaxCount"))
      {
        -[BRCAccountSession clientDB](self->super.super._session, "clientDB");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "assertOnQueue");

        objc_msgSend(v10, "progress");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        willRetryOperationProgress = self->_willRetryOperationProgress;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v18, "dbRowID"));
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKeyedSubscript:](willRetryOperationProgress, "setObject:forKeyedSubscript:", v52, v54);

        objc_msgSend(v10, "setProgressPublished:", 0);
      }
    }

    goto LABEL_43;
  }
  brc_bread_crumbs();
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v66 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v66, (os_log_type_t)0x90u))
  {
    objc_msgSend(v18, "st");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "displayName");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v101 = (uint64_t)v70;
    v102 = 2112;
    v103 = v11;
    v104 = 2112;
    v105 = (uint64_t)v65;
    _os_log_error_impl(&dword_1CBD43000, v66, (os_log_type_t)0x90u, "[ERROR] Got non recoverable error when downloading %@: %@%@", buf, 0x20u);

  }
  -[BRCAccountSession globalProgress](self->super.super._session, "globalProgress");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "updateDownloadThrottleForDocument:toState:", v18, v33);

  if ((v45 & 1) == 0)
    -[BRCFSDownloader _reportDownloadErrorForDocument:error:](self, "_reportDownloadErrorForDocument:error:", v18, v11);
  -[BRCAccountSession clientDB](self->super.super._session, "clientDB");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v89[0] = MEMORY[0x1E0C809B0];
  v89[1] = 3221225472;
  v89[2] = __67__BRCFSDownloader__finishedDownload_syncContext_operationID_error___block_invoke_183;
  v89[3] = &unk_1E8760910;
  v94 = v33;
  v89[4] = self;
  v90 = v10;
  v11 = v11;
  v91 = v11;
  v95 = v74;
  v18 = v18;
  v92 = v18;
  v93 = v77;
  objc_msgSend(v68, "groupInBatch:", v89);

LABEL_46:
  __brc_leave_section(v99);

}

void __67__BRCFSDownloader__finishedDownload_syncContext_operationID_error___block_invoke(uint64_t a1, sqlite3_context *a2, uint64_t a3, sqlite3_value **a4)
{
  sqlite3_int64 v6;
  void *v7;

  v6 = sqlite3_value_int64(*a4);
  objc_msgSend(*(id *)(a1 + 32), "downloadStream");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "signalWithDeadline:", v6);

  sqlite3_result_null(a2);
}

void __67__BRCFSDownloader__finishedDownload_syncContext_operationID_error___block_invoke_183(uint64_t a1, void *a2)
{
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t, sqlite3_context *, uint64_t, _QWORD *);
  void *v24;
  uint64_t v25;
  id v26;

  v21 = MEMORY[0x1E0C809B0];
  v22 = 3221225472;
  v23 = __67__BRCFSDownloader__finishedDownload_syncContext_operationID_error___block_invoke_2;
  v24 = &unk_1E87608E8;
  v4 = *(void **)(a1 + 40);
  v25 = *(_QWORD *)(a1 + 32);
  v5 = *(unsigned int *)(a1 + 72);
  v26 = v4;
  v6 = a2;
  v7 = (void *)MEMORY[0x1D17A6DB0](&v21);
  objc_msgSend(*(id *)(a1 + 48), "description");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "transferID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *(unsigned int *)(a1 + 76);
  objc_msgSend(*(id *)(a1 + 40), "etag");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "execute:", CFSTR("UPDATE client_downloads SET  throttle_state = %d, transfer_record = NULL, transfer_stage = call_block(%@, transfer_stage), transfer_operation = NULL, download_error = %@ WHERE throttle_id = %@ AND download_kind = %u AND download_etag = %@"), v5, v7, v8, v9, v10, v11, v21, v22, v23, v24, v25);

  if (objc_msgSend(*(id *)(a1 + 48), "brc_isCloudKitUnknownItemError")
    && (!objc_msgSend(*(id *)(a1 + 40), "kind")
     || objc_msgSend(*(id *)(a1 + 40), "kind") == 3))
  {
    brc_bread_crumbs();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      __67__BRCFSDownloader__finishedDownload_syncContext_operationID_error___block_invoke_183_cold_2();

    objc_msgSend(*(id *)(a1 + 56), "handleUnknownItemError");
  }
  if (*(_DWORD *)(a1 + 72) == 41 && objc_msgSend(*(id *)(a1 + 40), "kind") == 2)
  {
    brc_bread_crumbs();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      __67__BRCFSDownloader__finishedDownload_syncContext_operationID_error___block_invoke_183_cold_1();

    v16 = *(void **)(a1 + 64);
    objc_msgSend(*(id *)(a1 + 40), "itemID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v16, "serverRankByItemID:", v17);

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "applyScheduler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 64), "dbRowID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setState:andApplyKind:forRank:zoneRowID:", 1, 2, v18, v20);

  }
  objc_msgSend(*(id *)(a1 + 56), "saveToDB");

}

void __67__BRCFSDownloader__finishedDownload_syncContext_operationID_error___block_invoke_2(uint64_t a1, sqlite3_context *a2, uint64_t a3, _QWORD *a4)
{
  void *v6;
  void *v7;
  id v8;

  v8 = (id)objc_msgSend(MEMORY[0x1E0CB3940], "newFromSqliteValue:", *a4);
  if (v8)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "stageRegistry");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "itemID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "cleanupStagedDownloadWithID:forItemID:", v8, v7);

  }
  sqlite3_result_null(a2);

}

void __67__BRCFSDownloader__finishedDownload_syncContext_operationID_error___block_invoke_187(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  int v8;
  __CFString *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint8_t buf[4];
  uint64_t v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v3 = *(void **)(a1 + 32);
  v4 = *(void **)(a1 + 40);
  v5 = a2;
  objc_msgSend(v4, "record");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_sanitizeRecord:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = *(unsigned __int8 *)(a1 + 104);
  if (*(_BYTE *)(a1 + 104))
  {
    objc_msgSend(*(id *)(a1 + 48), "contextIdentifier");
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = CFSTR("_done");
  }
  v10 = *(_QWORD *)(a1 + 56);
  objc_msgSend(*(id *)(a1 + 40), "transferID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = *(unsigned int *)(a1 + 96);
  objc_msgSend(*(id *)(a1 + 40), "etag");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "execute:", CFSTR("UPDATE client_downloads SET  throttle_state = %d, transfer_queue = %@, transfer_record = %@, transfer_stage = %@, transfer_operation = NULL, download_error = NULL WHERE throttle_id = %@ AND download_kind = %u AND download_etag = %@"), 1, v9, v7, v10, v11, v12, v13);

  if (v8)
  objc_msgSend(*(id *)(a1 + 64), "saveToDB");
  if (*(_BYTE *)(a1 + 104))
  {
    objc_msgSend(*(id *)(a1 + 48), "downloadStream");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "signal");
LABEL_12:

    goto LABEL_13;
  }
  if (*(_QWORD *)(a1 + 88))
  {
    brc_bread_crumbs();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      v20 = *(_QWORD *)(a1 + 88);
      objc_msgSend(*(id *)(a1 + 40), "itemID");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218754;
      v23 = v20;
      v24 = 2112;
      v25 = v21;
      v26 = 2080;
      v27 = BRCPrettyPrintEnum();
      v28 = 2112;
      v29 = v15;
      _os_log_debug_impl(&dword_1CBD43000, v16, OS_LOG_TYPE_DEBUG, "[DEBUG] Apply Changes[%lld]: %@ state is %s%@", buf, 0x2Au);

    }
    v17 = *(unsigned int *)(a1 + 100);
    v18 = *(_QWORD *)(a1 + 88);
    v19 = *(void **)(a1 + 72);
    objc_msgSend(*(id *)(a1 + 80), "dbRowID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setState:andApplyKind:forRank:zoneRowID:", v17, 2, v18, v14);
    goto LABEL_12;
  }
LABEL_13:

}

- (void)rescheduleJobsPendingWinnerForItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;

  v4 = a3;
  -[BRCAccountSession clientDB](self->super.super._session, "clientDB");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "execute:", CFSTR("UPDATE client_downloads SET throttle_state = 1 WHERE throttle_state = %u AND throttle_id = %lld"), 42, objc_msgSend(v4, "dbRowID"));
  if (objc_msgSend(v5, "changes"))
  {
    brc_bread_crumbs();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      -[BRCFSDownloader rescheduleJobsPendingWinnerForItem:].cold.1();

    objc_msgSend(v4, "syncContextUsedForTransfers");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "downloadStream");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "signal");

  }
}

- (void)rescheduleJobsPendingRecentsAndFavoritesFetchInZone:(id)a3
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
  void *v15;

  v4 = a3;
  -[BRCAccountSession clientDB](self->super.super._session, "clientDB");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dbRowID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "execute:", CFSTR("UPDATE client_downloads SET throttle_state = 1 WHERE throttle_state = 40   AND throttle_state != 0   AND zone_rowid = %@"), v6);

  if (objc_msgSend(v5, "changes"))
  {
    brc_bread_crumbs();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      -[BRCFSDownloader rescheduleJobsPendingWinnerForItem:].cold.1();

    if (objc_msgSend(v4, "isSharedZone"))
    {
      objc_msgSend(v4, "metadataSyncContext");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "downloadStream");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "signal");

    }
    else
    {
      objc_msgSend(v4, "dbRowID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)objc_msgSend(v5, "fetch:", CFSTR("SELECT distinct app_library_rowid FROM client_downloads WHERE throttle_state = 1   AND throttle_state != 0   AND zone_rowid = %@"), v11);

      if (objc_msgSend(v9, "next"))
      {
        do
        {
          objc_msgSend(v9, "numberAtIndex:", 0);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          -[BRCAccountSession appLibraryByRowID:](self->super.super._session, "appLibraryByRowID:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "transferSyncContext");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "downloadStream");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "signal");

        }
        while ((objc_msgSend(v9, "next") & 1) != 0);
      }
    }

  }
}

- (void)_cancelJobs:(id)a3 state:(int)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *context;
  void *v35;
  uint64_t v36;
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  uint64_t v40;
  __int16 v41;
  void *v42;
  __int16 v43;
  void *v44;
  __int16 v45;
  void *v46;
  uint64_t v47;

  v29 = *(_QWORD *)&a4;
  v47 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (objc_msgSend(v5, "next"))
  {
    while (1)
    {
      context = (void *)MEMORY[0x1D17A6BE8]();
      objc_msgSend(v5, "numberAtIndex:", 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = objc_msgSend(v5, "intAtIndex:", 1);
      objc_msgSend(v5, "stringAtIndex:", 2);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "uuidAtIndex:", 3);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "stringAtIndex:", 4);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "numberAtIndex:", 5);
      v9 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "numberAtIndex:", 6);
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v5, "intAtIndex:", 7);
      v12 = objc_msgSend(v5, "longLongAtIndex:", 8);
      v33 = (void *)v9;
      -[BRCAccountSession appLibraryByRowID:](self->super.super._session, "appLibraryByRowID:", v9);
      v13 = objc_claimAutoreleasedReturnValue();
      v32 = (void *)v10;
      -[BRCAccountSession serverZoneByRowID:](self->super.super._session, "serverZoneByRowID:", v10);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = (void *)v13;
      +[BRCSyncContext transferContextForServerZone:appLibrary:](BRCSyncContext, "transferContextForServerZone:appLibrary:");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11 == 1)
      {
        brc_bread_crumbs();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        {
          v28 = BRCPrettyPrintEnum();
          *(_DWORD *)buf = 138413058;
          v38 = v6;
          v39 = 2080;
          v40 = v28;
          v41 = 2112;
          v42 = v35;
          v43 = 2112;
          v44 = v15;
          _os_log_debug_impl(&dword_1CBD43000, v16, OS_LOG_TYPE_DEBUG, "[DEBUG] Downloader[%@-%s-%@]: Cancelling download%@", buf, 0x2Au);
        }

        self->_activeDownloadsSize -= v12;
        if ((_DWORD)v36 == 3 || !(_DWORD)v36)
          break;
      }
      v19 = 0;
      if (v7)
        goto LABEL_10;
LABEL_11:
      if (v8)
      {
        if (!v19)
        {
          -[BRCAccountSession itemIDByRowID:](self->super.super._session, "itemIDByRowID:", objc_msgSend(v6, "unsignedIntegerValue"));
          v19 = (void *)objc_claimAutoreleasedReturnValue();
        }
        brc_bread_crumbs();
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
        {
          v27 = BRCPrettyPrintEnum();
          *(_DWORD *)buf = 138413314;
          v38 = v6;
          v39 = 2080;
          v40 = v27;
          v41 = 2112;
          v42 = v35;
          v43 = 2112;
          v44 = v8;
          v45 = 2112;
          v46 = v22;
          _os_log_debug_impl(&dword_1CBD43000, v23, OS_LOG_TYPE_DEBUG, "[DEBUG] Downloader[%@-%s-%@]: Cleaning up download stage: %@%@", buf, 0x34u);
        }

        -[BRCAccountSession stageRegistry](self->super.super._session, "stageRegistry");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "cleanupStagedDownloadWithID:forItemID:", v8, v19);

      }
      if (v14)
      {
        objc_msgSend(v5, "db");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "contextIdentifier");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "execute:", CFSTR("UPDATE client_downloads SET  throttle_state = %d, transfer_queue = %@, transfer_record = NULL, transfer_stage = NULL, transfer_operation = NULL, unit_count_completed = 0 WHERE throttle_id = %@ AND download_kind = %u AND download_etag = %@"), v29, v26, v6, v36, v35);

      }
      objc_autoreleasePoolPop(context);
      if ((objc_msgSend(v5, "next") & 1) == 0)
        goto LABEL_20;
    }
    -[BRCAccountSession itemByRowID:](self->super.super._session, "itemByRowID:", objc_msgSend(v6, "unsignedIntegerValue"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "asDocument");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v18, "itemID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCAccountSession globalProgress](self->super.super._session, "globalProgress");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "updateDownloadThrottleForDocument:toState:", v18, v29);

    if (!v7)
      goto LABEL_11;
LABEL_10:
    objc_msgSend(v14, "downloadStream");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "cancelTransferID:operationID:", v6, v7);

    goto LABEL_11;
  }
LABEL_20:
  objc_msgSend(v5, "close");

}

- (void)_finishDownloadCleanup:(id)a3
{
  void *v3;
  void *v4;
  void (**v5)(_QWORD, _QWORD);
  id v6;

  v6 = a3;
  objc_msgSend(v6, "clientZone");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "itemID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "popDownloadedBlockForItemID:", v4);
  v5 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

  if (v5)
    ((void (**)(_QWORD, id))v5)[2](v5, v6);

}

- (void)cancelAndCleanupItemDownload:(id)a3 kind:(int)a4 etag:(id)a5
{
  -[BRCFSDownloader cancelAndCleanupItemDownload:kind:etag:andNotifyDownloadTrackers:](self, "cancelAndCleanupItemDownload:kind:etag:andNotifyDownloadTrackers:", a3, *(_QWORD *)&a4, a5, 0);
}

- (void)cancelAndCleanupItemDownload:(id)a3 kind:(int)a4 etag:(id)a5 andNotifyDownloadTrackers:(BOOL)a6
{
  -[BRCFSDownloader cancelAndCleanupItemDownload:kind:etag:andNotifyDownloadTrackers:cancelReason:](self, "cancelAndCleanupItemDownload:kind:etag:andNotifyDownloadTrackers:cancelReason:", a3, *(_QWORD *)&a4, a5, a6, 0);
}

- (id)_getCancelErrorFromCancelReason:(int)a3
{
  void *v3;
  void *v4;
  NSObject *v5;

  if (a3 == 1)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "brc_errorRescheduleDownloadForMoreRecentServerVersion");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (a3)
  {
    brc_bread_crumbs();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      -[BRCFSDownloader _getCancelErrorFromCancelReason:].cold.1();

    objc_msgSend(MEMORY[0x1E0CB35C8], "brc_errorDownloadCancelled");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "brc_errorOperationCancelled");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (void)cancelAndCleanupItemDownload:(id)a3 kind:(int)a4 etag:(id)a5 andNotifyDownloadTrackers:(BOOL)a6 cancelReason:(int)a7
{
  uint64_t v7;
  _BOOL4 v8;
  uint64_t v10;
  id v12;
  id v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;

  v7 = *(_QWORD *)&a7;
  v8 = a6;
  v10 = *(_QWORD *)&a4;
  v12 = a3;
  v13 = a5;
  v14 = v13;
  if ((_DWORD)v7 != 1)
    goto LABEL_8;
  if (!v13)
  {
    if (!(_DWORD)v10)
      goto LABEL_8;
    goto LABEL_4;
  }
  brc_bread_crumbs();
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
    -[BRCFSDownloader cancelAndCleanupItemDownload:kind:etag:andNotifyDownloadTrackers:cancelReason:].cold.2();

  if ((_DWORD)v10)
  {
LABEL_4:
    if ((_DWORD)v10 != 3)
    {
      brc_bread_crumbs();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
        -[BRCFSDownloader cancelAndCleanupItemDownload:kind:etag:andNotifyDownloadTrackers:cancelReason:].cold.1();

    }
  }
LABEL_8:
  -[BRCAccountSession clientDB](self->super.super._session, "clientDB");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v17, "fetch:", CFSTR("SELECT throttle_id, download_kind, download_etag, transfer_operation, transfer_stage, app_library_rowid, zone_rowid, throttle_state, transfer_size FROM client_downloads WHERE throttle_id = %lld AND download_kind = %u AND download_etag = %@   AND throttle_state != 0"), objc_msgSend(v12, "dbRowID"), v10, v14);

  -[BRCFSDownloader _getCancelErrorFromCancelReason:](self, "_getCancelErrorFromCancelReason:", v7);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCFSDownloader _cancelJobs:state:](self, "_cancelJobs:state:", v18, 0);
  if ((_DWORD)v10 == 3 || !(_DWORD)v10)
  {
    -[BRCFSDownloader _finishDownloadCleanup:](self, "_finishDownloadCleanup:", v12);
    if (v8)
    {
      -[BRCAccountSession downloadTrackers](self->super.super._session, "downloadTrackers");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "document:didCompleteDownloadWithError:", v12, v19);

    }
  }

}

- (void)cancelAndCleanupItemDownload:(id)a3 kind:(int)a4
{
  uint64_t v4;
  void *v6;
  void *v7;
  id v8;

  v4 = *(_QWORD *)&a4;
  v8 = a3;
  -[BRCAccountSession clientDB](self->super.super._session, "clientDB");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "fetch:", CFSTR("SELECT throttle_id, download_kind, download_etag, transfer_operation, transfer_stage, app_library_rowid, zone_rowid, throttle_state, transfer_size FROM client_downloads WHERE throttle_id = %lld AND download_kind = %u   AND throttle_state != 0"), objc_msgSend(v8, "dbRowID"), v4);

  -[BRCFSDownloader _cancelJobs:state:](self, "_cancelJobs:state:", v7, 0);
  if ((_DWORD)v4 == 3 || !(_DWORD)v4)
    -[BRCFSDownloader _finishDownloadCleanup:](self, "_finishDownloadCleanup:", v8);

}

- (void)cancelAndCleanupItemDownloads:(id)a3
{
  BRCAccountSession *session;
  id v5;
  void *v6;
  id v7;

  session = self->super.super._session;
  v5 = a3;
  -[BRCAccountSession clientDB](session, "clientDB");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v6, "fetch:", CFSTR("SELECT throttle_id, download_kind, download_etag, transfer_operation, transfer_stage, app_library_rowid, zone_rowid, throttle_state, transfer_size FROM client_downloads WHERE throttle_id = %lld AND throttle_state != 0"), objc_msgSend(v5, "dbRowID"));

  -[BRCFSDownloader _cancelJobs:state:](self, "_cancelJobs:state:", v7, 0);
  -[BRCFSDownloader _finishDownloadCleanup:](self, "_finishDownloadCleanup:", v5);

}

- (void)addAliasItem:(id)a3 toDownloadingItem:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  uint8_t buf[4];
  id v16;
  __int16 v17;
  id v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[BRCAccountSession clientDB](self->super.super._session, "clientDB");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "fetchObjectOfClass:sql:", objc_opt_class(), CFSTR("SELECT transfer_operation    FROM client_downloads  WHERE throttle_id = %lld AND throttle_state == 1"), objc_msgSend(v7, "dbRowID"));

  if (v9)
  {
    brc_bread_crumbs();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412802;
      v16 = v6;
      v17 = 2112;
      v18 = v7;
      v19 = 2112;
      v20 = v10;
      _os_log_debug_impl(&dword_1CBD43000, v11, OS_LOG_TYPE_DEBUG, "[DEBUG] adding alias item %@ to currently transfering %@%@", buf, 0x20u);
    }

    objc_msgSend(v7, "syncContextUsedForTransfers");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "downloadStream");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v7, "dbRowID"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addAliasItem:toTransferWithID:operationID:", v6, v14, v9);

  }
}

- (void)deleteJobsMatching:(id)a3
{
  BRCAccountSession *session;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  session = self->super.super._session;
  v5 = a3;
  -[BRCAccountSession clientDB](session, "clientDB");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "matchingJobsWhereSQLClause");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "fetch:", CFSTR("SELECT throttle_id, download_kind, download_etag, transfer_operation, transfer_stage, app_library_rowid, zone_rowid, throttle_state, transfer_size FROM client_downloads WHERE %@ AND throttle_state > %d"), v7, 0);

  -[BRCFSDownloader _cancelJobs:state:](self, "_cancelJobs:state:", v8, 0);
  v9.receiver = self;
  v9.super_class = (Class)BRCFSDownloader;
  -[BRCFSSchedulerBase deleteJobsMatching:](&v9, sel_deleteJobsMatching_, v5);

}

- (void)updateContentDownloadForMetaOnlyChange:(id)a3 fromEtag:(id)a4 toEtag:(id)a5
{
  BRCAccountSession *session;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;

  session = self->super.super._session;
  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[BRCAccountSession clientDB](session, "clientDB");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "dbRowID");

  objc_msgSend(v12, "execute:", CFSTR("UPDATE client_downloads SET download_etag = %@ WHERE throttle_id = %lld AND download_etag = %@ AND download_kind = %d"), v8, v11, v9, 0);
}

- (unint64_t)sizeOfActiveDownloads
{
  void *v3;
  void *v4;
  double v5;
  void *v6;
  id v7;
  void *v8;
  NSObject *v9;
  unint64_t v10;
  unint64_t activeDownloadsSize;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t);
  void *v17;
  id v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  uint8_t buf[4];
  unint64_t v27;
  __int16 v28;
  uint64_t v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!self->_lastDownloadRefresh
    || (objc_msgSend(v3, "timeIntervalSinceDate:"), v5 > self->_activeDownloadSizeRefreshInterval))
  {
    -[BRCAccountSession clientDB](self->super.super._session, "clientDB");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 0;
    v21 = &v20;
    v22 = 0x3032000000;
    v23 = __Block_byref_object_copy__13;
    v24 = __Block_byref_object_dispose__13;
    v25 = 0;
    v14 = MEMORY[0x1E0C809B0];
    v15 = 3221225472;
    v16 = __40__BRCFSDownloader_sizeOfActiveDownloads__block_invoke;
    v17 = &unk_1E8760960;
    v19 = &v20;
    v7 = v6;
    v18 = v7;
    objc_msgSend(v7, "disableProfilingForQueriesInBlock:", &v14);
    objc_storeStrong((id *)&self->_lastDownloadRefresh, v4);
    brc_bread_crumbs();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      activeDownloadsSize = self->_activeDownloadsSize;
      v13 = objc_msgSend((id)v21[5], "longLongValue", v14, v15, v16, v17);
      *(_DWORD *)buf = 134218498;
      v27 = activeDownloadsSize;
      v28 = 2048;
      v29 = v13;
      v30 = 2112;
      v31 = v8;
      _os_log_debug_impl(&dword_1CBD43000, v9, OS_LOG_TYPE_DEBUG, "[DEBUG] Refreshed active download size %llu -> %llu%@", buf, 0x20u);
    }

    self->_activeDownloadsSize = objc_msgSend((id)v21[5], "longLongValue");
    _Block_object_dispose(&v20, 8);

  }
  v10 = self->_activeDownloadsSize;

  return v10;
}

void __40__BRCFSDownloader_sizeOfActiveDownloads__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(a1 + 32), "numberWithSQL:", CFSTR("SELECT SUM(transfer_size) FROM client_downloads WHERE throttle_state = 1"));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (BOOL)makeContentLive:(id)a3
{
  id v4;
  char v5;
  int v6;
  uint64_t v7;
  void *v8;
  char v9;
  BRCItemToPathLookup *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  _QWORD v19[4];
  id v20;
  BRCFSDownloader *v21;
  _QWORD v22[4];
  id v23;
  BRCFSDownloader *v24;
  id v25;
  id v26;

  v4 = a3;
  if ((objc_msgSend(v4, "isFault") & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    v6 = objc_msgSend(v4, "shouldHaveThumbnail");
    v7 = MEMORY[0x1E0C809B0];
    if (v6)
    {
      if ((objc_msgSend(v4, "shouldTransferThumbnail") & 1) == 0)
      {
        objc_msgSend(v4, "currentVersion");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "hasThumbnail");

        if ((v9 & 1) == 0)
        {
          v10 = -[BRCItemToPathLookup initWithItem:]([BRCItemToPathLookup alloc], "initWithItem:", v4);
          -[BRCItemToPathLookup coordinatedReadURL](v10, "coordinatedReadURL");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "itemID");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "clientZone");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (v11)
          {
            v14 = (void *)MEMORY[0x1E0CD32B0];
            v22[0] = v7;
            v22[1] = 3221225472;
            v22[2] = __35__BRCFSDownloader_makeContentLive___block_invoke;
            v22[3] = &unk_1E8760988;
            v23 = v11;
            v24 = self;
            v25 = v13;
            v26 = v12;
            objc_msgSend(v14, "noteCloudDocsDownloadedFileAtURL:completionHandler:", v23, v22);

            v15 = v23;
          }
          else
          {
            brc_bread_crumbs();
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            brc_default_log();
            v16 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v16, (os_log_type_t)0x90u))
              -[BRCFSDownloader makeContentLive:].cold.1((uint64_t)v4);

          }
          -[BRCItemToPathLookup closePaths](v10, "closePaths");

        }
      }
    }
    -[BRCAccountSession clientDB](self->super.super._session, "clientDB");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v7;
    v19[1] = 3221225472;
    v19[2] = __35__BRCFSDownloader_makeContentLive___block_invoke_222;
    v19[3] = &unk_1E875D8F0;
    v20 = v4;
    v21 = self;
    v5 = objc_msgSend(v17, "groupInTransaction:", v19);

  }
  return v5;
}

void __35__BRCFSDownloader_makeContentLive___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  id v18;
  uint64_t v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "domain");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0CD3368]))
    {
      v6 = objc_msgSend(v4, "code");

      if (v6 == 104)
      {
        brc_bread_crumbs();
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
          __35__BRCFSDownloader_makeContentLive___block_invoke_cold_1(a1, (uint64_t)v7, v8);
LABEL_10:

        goto LABEL_11;
      }
    }
    else
    {

    }
    brc_bread_crumbs();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, (os_log_type_t)0x90u))
    {
      objc_msgSend(*(id *)(a1 + 32), "path");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v21 = v15;
      v22 = 2112;
      v23 = v4;
      v24 = 2112;
      v25 = v7;
      _os_log_error_impl(&dword_1CBD43000, v8, (os_log_type_t)0x90u, "[ERROR] failed asking QL to generate a thumbnail at '%@': %@%@", buf, 0x20u);

    }
    goto LABEL_10;
  }
  v9 = *(_QWORD *)(a1 + 40);
  v10 = *(void **)(v9 + 72);
  objc_msgSend(*(id *)(v9 + 8), "clientDB");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "serialQueue");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __35__BRCFSDownloader_makeContentLive___block_invoke_220;
  v16[3] = &unk_1E875D448;
  v17 = *(id *)(a1 + 48);
  v13 = *(id *)(a1 + 56);
  v14 = *(_QWORD *)(a1 + 40);
  v18 = v13;
  v19 = v14;
  brc_task_tracker_async_with_logs(v10, v12, v16, 0);

  v7 = v17;
LABEL_11:

}

void __35__BRCFSDownloader_makeContentLive___block_invoke_220(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "itemByItemID:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    +[BRCItemToPathLookup lookupForItem:](BRCItemToPathLookup, "lookupForItem:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 8), "fsReader");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "byFileSystemID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "coordinatedReadURL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "thumbnailChangedForItem:relpath:url:error:", v2, v5, v6, 0);

    objc_msgSend(v3, "closePaths");
  }
  else
  {
    brc_bread_crumbs();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(_QWORD *)(a1 + 40);
      v9 = 138412546;
      v10 = v8;
      v11 = 2112;
      v12 = v3;
      _os_log_impl(&dword_1CBD43000, v7, OS_LOG_TYPE_DEFAULT, "[WARNING] li %@ disappeared while waiting for thumbnail generation%@", (uint8_t *)&v9, 0x16u);
    }

  }
}

uint64_t __35__BRCFSDownloader_makeContentLive___block_invoke_222(uint64_t a1, void *a2)
{
  id v3;
  id *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  NSObject *v9;
  void *v10;
  int v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  BRCPackageManifestReader *v17;
  BRCPackageManifestReader *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  BRCPackageItem *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  NSObject *v29;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint8_t v40[128];
  uint8_t buf[4];
  uint64_t v42;
  __int16 v43;
  void *v44;
  __int16 v45;
  void *v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (id *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 32), "st");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "documentID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v3, "execute:", CFSTR("DELETE FROM client_pkg_items WHERE item_doc_id = %@"), v6);

  if (!v7)
  {
    v16 = 0;
    v27 = 0;
    goto LABEL_21;
  }
  brc_bread_crumbs();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    v31 = objc_msgSend(v3, "changes");
    objc_msgSend(*v4, "fileObjectID");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218498;
    v42 = v31;
    v43 = 2112;
    v44 = v32;
    v45 = 2112;
    v46 = v8;
    _os_log_debug_impl(&dword_1CBD43000, v9, OS_LOG_TYPE_DEBUG, "[DEBUG] removed %lld items in pkg:%@%@", buf, 0x20u);

  }
  objc_msgSend(*v4, "desiredVersion");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isPackage");

  if (!v11)
    goto LABEL_19;
  v12 = objc_msgSend(*v4, "dbRowID");
  objc_msgSend(*v4, "desiredVersion");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "ckInfo");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "etag");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v3, "stringWithSQL:", CFSTR("SELECT transfer_stage FROM client_downloads  WHERE throttle_id = %lld AND download_kind = %d AND download_etag = %@    AND transfer_queue = '_done'"), v12, 0, v15);

  if (!v16)
  {
    brc_bread_crumbs();
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, (os_log_type_t)0x90u))
      __35__BRCFSDownloader_makeContentLive___block_invoke_222_cold_1((_QWORD *)(a1 + 32));

LABEL_19:
    v16 = 0;
LABEL_20:
    objc_msgSend(*(id *)(a1 + 40), "cancelAndCleanupItemDownload:kind:", *(_QWORD *)(a1 + 32), 0);
    v27 = 1;
    goto LABEL_21;
  }
  v35 = v3;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "stageRegistry");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "createURLForDownloadWithStageID:name:", v16, CFSTR("brpackage-extended"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[BRCPackageManifestReader initWithURL:]([BRCPackageManifestReader alloc], "initWithURL:", v33);
  -[BRCPackageManifestReader setItemClass:](v17, "setItemClass:", objc_opt_class());
  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v18 = v17;
  v19 = -[BRCPackageManifestReader countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v37;
    do
    {
      v22 = 0;
      do
      {
        if (*(_QWORD *)v37 != v21)
          objc_enumerationMutation(v18);
        v23 = *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * v22);
        v24 = (void *)MEMORY[0x1D17A6BE8]();
        v25 = -[BRCPackageItem initWithPBItem:forLocalItem:]([BRCPackageItem alloc], "initWithPBItem:forLocalItem:", v23, *(_QWORD *)(a1 + 32));
        -[BRCPackageItem saveToDBWithSession:](v25, "saveToDBWithSession:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8));

        objc_autoreleasePoolPop(v24);
        ++v22;
      }
      while (v20 != v22);
      v20 = -[BRCPackageManifestReader countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
    }
    while (v20);
  }

  -[BRCPackageManifestReader error](v18, "error");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v26)
  {
    v3 = v35;
    goto LABEL_20;
  }
  v27 = 0;
  v3 = v35;
LABEL_21:

  return v27;
}

- (BOOL)scheduleContentDownloadForItem:(id)a3 serverItem:(id)a4 options:(unint64_t)a5 etagIfLoser:(id)a6 stageFileName:(id)a7 error:(id *)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  BRCDownloadJobIdentifier *v24;
  int v25;
  void *v26;
  NSObject *v27;
  BOOL v28;
  void *v30;
  uint64_t v31;
  uint64_t v32[3];
  uint8_t buf[4];
  uint64_t v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  id v38;
  __int16 v39;
  id v40;
  __int16 v41;
  void *v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = a6;
  v17 = a7;
  memset(v32, 0, sizeof(v32));
  __brc_create_section(0, (uint64_t)"-[BRCFSDownloader scheduleContentDownloadForItem:serverItem:options:etagIfLoser:stageFileName:error:]", 1192, v32);
  brc_bread_crumbs();
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
  {
    v31 = v32[0];
    objc_msgSend(v14, "itemID");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134219010;
    v34 = v31;
    v35 = 2112;
    v36 = v30;
    v37 = 2112;
    v38 = v14;
    v39 = 2112;
    v40 = v15;
    v41 = 2112;
    v42 = v18;
    _os_log_debug_impl(&dword_1CBD43000, v19, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx scheduling content download for %@\nlocal: %@\nserver: %@%@", buf, 0x34u);

  }
  objc_msgSend(v15, "latestVersion");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "ckInfo");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "etag");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = +[BRCFSDownloaderUtil downloadKindWithEtagIfLoser:options:](BRCFSDownloaderUtil, "downloadKindWithEtagIfLoser:options:", v16, a5);
  v24 = -[BRCDownloadJobIdentifier initWithDBRowID:etag:kind:]([BRCDownloadJobIdentifier alloc], "initWithDBRowID:etag:kind:", objc_msgSend(v14, "dbRowID"), v22, v23);
  v25 = -[BRCFSSchedulerBase jobStateFor:](self, "jobStateFor:", v24);
  if (v25)
  {
    if (v25 == 1)
    {
      brc_bread_crumbs();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
        -[BRCFSDownloader scheduleContentDownloadForItem:serverItem:options:etagIfLoser:stageFileName:error:].cold.2();
LABEL_11:

      v28 = 1;
      goto LABEL_12;
    }
    if ((a5 & 8) == 0)
    {
      brc_bread_crumbs();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
        -[BRCFSDownloader scheduleContentDownloadForItem:serverItem:options:etagIfLoser:stageFileName:error:].cold.1();
      goto LABEL_11;
    }
  }
  v28 = -[BRCFSDownloader _createDownloadingJobForItem:state:kind:etag:userInitiated:stageFileName:error:](self, "_createDownloadingJobForItem:state:kind:etag:userInitiated:stageFileName:error:", v14, 1, v23, v22, (a5 >> 3) & 1, v17, a8);
LABEL_12:

  __brc_leave_section(v32);
  return v28;
}

- (void)performFirstSchedulingAfterStartupInDB:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  BRCAccountSession *session;
  void *v10;
  void *v11;
  BRCAccountSession *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "execute:", CFSTR("UPDATE client_downloads SET transfer_operation = NULL WHERE (transfer_operation >= '')"));
  if (objc_msgSend(v4, "changes"))
  {
    brc_bread_crumbs();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      -[BRCFSDownloader performFirstSchedulingAfterStartupInDB:].cold.1(v4, (uint64_t)v5, v6);

  }
  v7 = (void *)objc_msgSend(v4, "fetch:", CFSTR("SELECT app_library_rowid, zone_rowid, transfer_queue   FROM client_downloads  WHERE throttle_state = 1 GROUP BY app_library_rowid, zone_rowid, transfer_queue"));
  if (objc_msgSend(v7, "next"))
  {
    do
    {
      v8 = (void *)MEMORY[0x1D17A6BE8]();
      session = self->super.super._session;
      objc_msgSend(v7, "numberAtIndex:", 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[BRCAccountSession appLibraryByRowID:](session, "appLibraryByRowID:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v12 = self->super.super._session;
      objc_msgSend(v7, "numberAtIndex:", 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[BRCAccountSession serverZoneByRowID:](v12, "serverZoneByRowID:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v7, "stringAtIndex:", 2);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v15, "isEqualToString:", CFSTR("_prepare")) & 1) == 0
        && (objc_msgSend(v15, "isEqualToString:", CFSTR("_retry")) & 1) == 0)
      {
        brc_bread_crumbs();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(v7, "stringAtIndex:", 2);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v22 = v20;
          v23 = 2112;
          v24 = v16;
          _os_log_debug_impl(&dword_1CBD43000, v17, OS_LOG_TYPE_DEBUG, "[DEBUG] Kicking downloads for %@%@", buf, 0x16u);

        }
        +[BRCSyncContext transferContextForServerZone:appLibrary:](BRCSyncContext, "transferContextForServerZone:appLibrary:", v14, v11);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "downloadStream");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "signal");

      }
      objc_autoreleasePoolPop(v8);
    }
    while ((objc_msgSend(v7, "next") & 1) != 0);
  }

}

- (void)schedule
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  _QWORD v7[5];

  +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "readerScanBatchSize");

  objc_msgSend(MEMORY[0x1E0DE81D0], "formatInjection:", CFSTR("transfer_queue = '_retry' AND transfer_operation IS NULL"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DE81E0], "rawInjection:length:", "rowid, throttle_id, app_library_rowid, zone_rowid", 49);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __27__BRCFSDownloader_schedule__block_invoke;
  v7[3] = &unk_1E87609B0;
  v7[4] = self;
  -[BRCFSSchedulerBase scheduleWithBatchSize:whereSQLClause:columns:actionHandler:](self, "scheduleWithBatchSize:whereSQLClause:columns:actionHandler:", v4, v5, v6, v7);

}

void __27__BRCFSDownloader_schedule__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  objc_msgSend(v5, "numberAtIndex:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "numberAtIndex:", (a3 + 1));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "numberAtIndex:", (a3 + 2));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "numberAtIndex:", (a3 + 3));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "appLibraryByRowID:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "serverZoneByRowID:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[BRCSyncContext transferContextForServerZone:appLibrary:](BRCSyncContext, "transferContextForServerZone:appLibrary:", v10, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "contextIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend(v5, "db");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "contextIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "execute:", CFSTR("UPDATE client_downloads SET transfer_queue = %@ WHERE rowid = %@"), v14, v6);

    brc_bread_crumbs();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412802;
      v22 = v20;
      v23 = 2112;
      v24 = v12;
      v25 = 2112;
      v26 = v15;
      _os_log_debug_impl(&dword_1CBD43000, v16, OS_LOG_TYPE_DEBUG, "[DEBUG] Downloader[%@]: job has been put back in queue %@%@", buf, 0x20u);
    }

    objc_msgSend(v11, "downloadStream");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "signal");
  }
  else
  {
    brc_bread_crumbs();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138413058;
      v22 = v20;
      v23 = 2112;
      v24 = v7;
      v25 = 2112;
      v26 = v6;
      v27 = 2112;
      v28 = v18;
      _os_log_fault_impl(&dword_1CBD43000, v19, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: Downloader[%@]: failed to find app library with id %@, dropping the download %@%@", buf, 0x2Au);
    }

    objc_msgSend(v5, "db");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "execute:", CFSTR("DELETE FROM client_downloads WHERE rowid = %@"), v6);
  }

}

- (unint64_t)inFlightSize
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[BRCAccountSession syncContextProvider](self->super.super._session, "syncContextProvider", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allSyncContexts");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "downloadStream");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v6 += objc_msgSend(v9, "inFlightSize");

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)generateContentStageFileNameForItem:(id)a3 etag:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v18;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v6, "st");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "logicalName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "br_pathExtension");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v9, "length");
  v11 = (void *)MEMORY[0x1E0CB3940];
  v12 = objc_msgSend(v6, "dbRowID");

  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "UUIDString");
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)v14;
  if (v10)
    objc_msgSend(v11, "stringWithFormat:", CFSTR("content-%lld-%@-%@.%@"), v12, v5, v14, v9);
  else
    objc_msgSend(v11, "stringWithFormat:", CFSTR("content-%lld-%@-%@"), v12, v5, v14, v18);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (void)_sendContentsBatch:(id)a3 sizeHint:(int64_t)a4 maxRecordsCount:(unint64_t)a5 isLoserDownload:(BOOL)a6
{
  id v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  BRCDownloadContentsBatchOperation *v15;
  void *v16;
  void *v17;
  void *v18;
  BRCDownloadContentsBatchOperation *v19;
  void *v20;
  void *v21;
  void *v22;
  unint64_t v23;
  void *v24;
  uint64_t v25;
  BRCFSDownloader *v26;
  unint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  char v32;
  int v33;
  unint64_t v34;
  unint64_t v35;
  BRCDownloadJobIdentifier *v37;
  void *v38;
  NSObject *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  NSObject *v46;
  uint64_t v47;
  void *v48;
  NSObject *v49;
  void *v50;
  BRCDownloadContent *v51;
  uint64_t v52;
  BRCDownloadContent *v53;
  void *v54;
  char v55;
  NSMutableDictionary *willRetryOperationProgress;
  void *v57;
  void *v58;
  NSMutableDictionary *v59;
  void *v60;
  void *v61;
  BRCItemToPathLookup *v62;
  void *v63;
  void *v64;
  NSObject *v65;
  void *v66;
  NSObject *v67;
  void *v68;
  uint64_t v69;
  uint64_t v70;
  BRCDownloadContentsBatchOperation *v71;
  void *v72;
  NSObject *v73;
  void *v74;
  void *v75;
  uint64_t v76;
  uint64_t v77;
  void *v78;
  void *v79;
  uint64_t v80;
  void *v81;
  NSObject *v82;
  uint64_t v83;
  void *v84;
  void *v85;
  void *v86;
  NSObject *v87;
  uint64_t v88;
  uint64_t v89;
  int v90;
  _BOOL4 v91;
  void *v92;
  uint64_t v93;
  uint64_t v94;
  id v95;
  void *v96;
  unint64_t v97;
  uint64_t v98;
  BRCFSDownloader *v99;
  void *context;
  BRCDownloadContentsBatchOperation *v101;
  BRCDownloadContentsBatchOperation *v102;
  uint64_t v103;
  uint64_t v104;
  _QWORD v105[5];
  id v106;
  id v107;
  _QWORD v108[2];
  _QWORD v109[2];
  uint8_t buf[4];
  uint64_t v111;
  __int16 v112;
  unint64_t v113;
  __int16 v114;
  unint64_t v115;
  __int16 v116;
  unint64_t v117;
  __int16 v118;
  unint64_t v119;
  __int16 v120;
  unint64_t v121;
  __int16 v122;
  void *v123;
  uint64_t v124;

  v91 = a6;
  v124 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  +[BRCAccountsManager sharedManager](BRCAccountsManager, "sharedManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isInSyncBubble");

  if (v10)
  {
    brc_bread_crumbs();
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v87 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v87, OS_LOG_TYPE_FAULT))
      -[BRCFSDownloader _finishedDownload:syncContext:operationID:error:].cold.2();

  }
  objc_msgSend(v8, "syncContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "defaults");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v89 = objc_msgSend(v12, "minimumDiskSpaceRequiredToDownload");

  objc_msgSend(v11, "defaults");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v94 = objc_msgSend(v13, "minimumDiskSpaceRequiredToDownloadUserInitiated");

  v14 = 0;
  v15 = 0;
  v16 = 0;
  v17 = 0;
  v18 = 0;
  if (objc_msgSend(0, "itemsCount") >= a5)
    goto LABEL_69;
  v92 = v11;
  v93 = 0;
  v97 = a5;
  v19 = 0;
  v14 = 0;
  v95 = 0;
  v20 = 0;
  v18 = 0;
  v90 = 0;
  v88 = *MEMORY[0x1E0CB28A8];
  v99 = self;
  v96 = v8;
  while (1)
  {
    v21 = v14;
    v22 = (void *)MEMORY[0x1D17A6BE8]();
    objc_msgSend(v8, "nextDocumentItem");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v14)
      break;
    context = v22;
    objc_msgSend(v8, "stageID");
    v104 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "etag");
    v103 = objc_claimAutoreleasedReturnValue();

    v98 = objc_msgSend(v8, "completedUnitCount");
    v23 = -[BRCAccountSession availableDiskSpace](self->super.super._session, "availableDiskSpace");
    objc_msgSend(v14, "desiredVersion");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "size");

    v26 = self;
    v27 = -[BRCFSDownloader inFlightSize](self, "inFlightSize");
    v101 = v19;
    v28 = -[BRCTransferBatchOperation totalSize](v19, "totalSize");
    objc_msgSend(v14, "desiredVersion");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v29, "options") & 8) != 0)
    {

LABEL_9:
      v33 = 0;
      BYTE4(v93) = 1;
      v34 = v94;
      goto LABEL_10;
    }
    -[BRCAccountSession downloadTrackers](v26->super.super._session, "downloadTrackers");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "fileObjectID");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v30, "hasPendingTrackerForFileObjectID:", v31);

    if ((v32 & 1) != 0)
      goto LABEL_9;
    v90 |= objc_msgSend(v14, "isFault");
    v33 = 1;
    v34 = v89;
LABEL_10:
    v35 = v27 + v28 + v25;
    if (v23 >= v35 && v23 - v35 >= v34)
    {
      brc_bread_crumbs();
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v46 = objc_claimAutoreleasedReturnValue();
      v47 = v104;
      if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
      {
        v76 = objc_msgSend(v14, "dbRowID");
        v77 = BRCPrettyPrintEnum();
        *(_DWORD *)buf = 134219522;
        v111 = v76;
        v112 = 2080;
        v113 = v77;
        v114 = 2112;
        v115 = v103;
        v116 = 2048;
        v117 = v23;
        v118 = 2048;
        v119 = v35;
        v120 = 2048;
        v121 = v34;
        v122 = 2112;
        v123 = v45;
        _os_log_debug_impl(&dword_1CBD43000, v46, OS_LOG_TYPE_DEBUG, "[DEBUG] Downloader[%lld-%s-%@]: enough disk space to download (%llu available, %llu needed, %llu minimum)%@", buf, 0x48u);
      }

      v8 = v96;
      v19 = v101;
      v18 = (void *)v103;
      if (!v104)
      {
        brc_bread_crumbs();
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v49 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v111 = (uint64_t)v48;
          _os_log_debug_impl(&dword_1CBD43000, v49, OS_LOG_TYPE_DEBUG, "[DEBUG] No stage ID, createing a new one%@", buf, 0xCu);
        }

        -[BRCFSDownloader generateContentStageFileNameForItem:etag:](v99, "generateContentStageFileNameForItem:etag:", v14, v103);
        v47 = objc_claimAutoreleasedReturnValue();
      }
      self = v99;
      if (!v101)
      {
        v19 = -[BRCDownloadContentsBatchOperation initWithSyncContext:sessionContext:]([BRCDownloadContentsBatchOperation alloc], "initWithSyncContext:sessionContext:", v92, v99->super.super._session);
        -[_BRCOperation operationID](v19, "operationID");
        v50 = (void *)objc_claimAutoreleasedReturnValue();

        v105[0] = MEMORY[0x1E0C809B0];
        v105[1] = 3221225472;
        v105[2] = __79__BRCFSDownloader__sendContentsBatch_sizeHint_maxRecordsCount_isLoserDownload___block_invoke;
        v105[3] = &unk_1E87609D8;
        v105[4] = v99;
        v106 = v92;
        v95 = v50;
        v107 = v95;
        -[BRCDownloadContentsBatchOperation setPerDownloadCompletionBlock:](v19, "setPerDownloadCompletionBlock:", v105);

      }
      v51 = [BRCDownloadContent alloc];
      if (v91)
        v52 = v103;
      else
        v52 = 0;
      v104 = v47;
      v53 = -[BRCDownloadContent initWithDocument:stageID:etagIfLoser:downloadKind:](v51, "initWithDocument:stageID:etagIfLoser:downloadKind:", v14, v47, v52, objc_msgSend(v96, "kind"));
      v37 = (BRCDownloadJobIdentifier *)v53;
      if (v91
        || (-[BRCDownload etag](v53, "etag"),
            v54 = (void *)objc_claimAutoreleasedReturnValue(),
            v55 = objc_msgSend(v54, "isEqualToString:", v103),
            v54,
            (v55 & 1) != 0))
      {
        if ((-[BRCDownloadJobIdentifier requiresTwoPhase](v37, "requiresTwoPhase") & 1) == 0)
        {
          willRetryOperationProgress = v99->_willRetryOperationProgress;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v14, "dbRowID"));
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary objectForKeyedSubscript:](willRetryOperationProgress, "objectForKeyedSubscript:", v57);
          v58 = (void *)objc_claimAutoreleasedReturnValue();

          if (v58)
          {
            v102 = v19;
            v59 = v99->_willRetryOperationProgress;
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v14, "dbRowID"));
            v60 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMutableDictionary removeObjectForKey:](v59, "removeObjectForKey:", v60);

            -[BRCAccountSession globalProgress](v99->super.super._session, "globalProgress");
            v61 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v61, "addProgress:forDocument:inGroup:", v58, v14, 2);

            -[BRCDownloadJobIdentifier setProgressPublished:](v37, "setProgressPublished:", 1);
            v62 = -[BRCItemToPathLookup initWithItem:]([BRCItemToPathLookup alloc], "initWithItem:", v14);
            -[BRCItemToPathLookup coordinatedWriteURL](v62, "coordinatedWriteURL");
            v63 = (void *)objc_claimAutoreleasedReturnValue();
            brc_bread_crumbs();
            v64 = (void *)objc_claimAutoreleasedReturnValue();
            brc_default_log();
            v65 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v65, OS_LOG_TYPE_DEBUG))
            {
              objc_msgSend(v63, "path");
              v78 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412802;
              v111 = (uint64_t)v58;
              v112 = 2112;
              v113 = (unint64_t)v78;
              v114 = 2112;
              v115 = (unint64_t)v64;
              _os_log_debug_impl(&dword_1CBD43000, v65, OS_LOG_TYPE_DEBUG, "[DEBUG] Re-use progress %@ for %@%@", buf, 0x20u);

            }
            v19 = v102;
          }
          else
          {
            objc_msgSend(v14, "desiredVersion");
            v68 = (void *)objc_claimAutoreleasedReturnValue();
            v69 = objc_msgSend(v68, "size");

            v70 = v98;
            if (v98 > v69)
            {
              v71 = v19;
              brc_bread_crumbs();
              v72 = (void *)objc_claimAutoreleasedReturnValue();
              brc_default_log();
              v73 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v73, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                v111 = (uint64_t)v72;
                _os_log_impl(&dword_1CBD43000, v73, OS_LOG_TYPE_DEFAULT, "[WARNING] Completed unit count is greater than version size; ignoring value%@",
                  buf,
                  0xCu);
              }

              v70 = 0;
              v19 = v71;
            }
            v108[0] = CFSTR("BRCSizeInfoCompletedUnitCountKey");
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v70);
            v74 = (void *)objc_claimAutoreleasedReturnValue();
            v108[1] = CFSTR("BRCSizeInfoTotalUnitCountKey");
            v109[0] = v74;
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v69);
            v75 = (void *)objc_claimAutoreleasedReturnValue();
            v109[1] = v75;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v109, v108, 2);
            v62 = (BRCItemToPathLookup *)objc_claimAutoreleasedReturnValue();

            +[BRCProgress downloadProgressForDocument:sizeInfo:](BRCProgress, "downloadProgressForDocument:sizeInfo:", v14, v62);
            v58 = (void *)objc_claimAutoreleasedReturnValue();
          }

          -[BRCDownloadJobIdentifier setProgress:](v37, "setProgress:", v58);
          v18 = (void *)v103;
          self = v99;
        }
        -[BRCDownloadContentsBatchOperation addDownload:](v19, "addDownload:", v37);
        -[BRCFSDownloader _willDownload:operationID:](self, "_willDownload:operationID:", v37, v95);
        objc_msgSend(v14, "triggerNotificationIfNeeded");
      }
      else
      {
        brc_bread_crumbs();
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v67 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v67, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 138412802;
          v111 = (uint64_t)v37;
          v112 = 2112;
          v113 = v103;
          v114 = 2112;
          v115 = (unint64_t)v66;
          _os_log_fault_impl(&dword_1CBD43000, v67, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: item download %@ etag changed from %@%@", buf, 0x20u);
        }

        self = v99;
        -[BRCFSDownloader cancelAndCleanupItemDownload:kind:etag:](v99, "cancelAndCleanupItemDownload:kind:etag:", v14, 0, v103);
      }
    }
    else
    {
      if (((v33 | v93) & 1) != 0)
      {
        v37 = -[BRCDownloadJobIdentifier initWithDBRowID:etag:kind:]([BRCDownloadJobIdentifier alloc], "initWithDBRowID:etag:kind:", objc_msgSend(v14, "dbRowID"), v103, 0);
        brc_bread_crumbs();
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v39 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138413314;
          v111 = (uint64_t)v37;
          v112 = 2048;
          v113 = v23;
          v114 = 2048;
          v115 = v35;
          v116 = 2048;
          v117 = v34;
          v118 = 2112;
          v119 = (unint64_t)v38;
          _os_log_debug_impl(&dword_1CBD43000, v39, OS_LOG_TYPE_DEBUG, "[DEBUG] Downloader[%@]: not enough available disk space (%llu available, %llu needed, %llu minimum)%@", buf, 0x34u);
        }

        -[BRCFSSchedulerBase setState:forJobID:](v99, "setState:forJobID:", 43, v37);
        v40 = (void *)MEMORY[0x1E0CB35C8];
        +[BRCDumpContext stringFromByteCount:showActualByteCount:suffix:context:](BRCDumpContext, "stringFromByteCount:showActualByteCount:suffix:context:", v23, 0, 0, 0);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        +[BRCDumpContext stringFromByteCount:showActualByteCount:suffix:context:](BRCDumpContext, "stringFromByteCount:showActualByteCount:suffix:context:", v34 + v35, 0, 0, 0);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "br_errorWithDomain:code:description:", v88, 640, CFSTR("Not enough available disk space(have %@ need %@)"), v41, v42);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "desiredVersion");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "setDownloadError:", v43);

        self = v99;
        objc_msgSend(v14, "saveToDB");
      }
      else
      {
        self = v99;
        -[BRCAccountSession diskReclaimer](v99->super.super._session, "diskReclaimer");
        v37 = (BRCDownloadJobIdentifier *)objc_claimAutoreleasedReturnValue();
        -[BRCDownloadJobIdentifier requestPurgeSpace](v37, "requestPurgeSpace");
        LODWORD(v93) = 1;
      }
      v8 = v96;
      v19 = v101;
      v18 = (void *)v103;
    }

    objc_autoreleasePoolPop(context);
    v17 = (void *)v104;
    v20 = (void *)v104;
    if (-[BRCTransferBatchOperation itemsCount](v19, "itemsCount") >= v97)
      goto LABEL_51;
  }
  objc_autoreleasePoolPop(v22);
  v17 = v20;
LABEL_51:
  if (v19)
  {
    if (objc_msgSend(v8, "kind") == 3)
    {
      objc_msgSend(MEMORY[0x1E0C94F88], "br_downloadSpeculative");
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      if ((v93 & 0x100000000) == 0)
        goto LABEL_66;
LABEL_58:
      -[_BRCOperation setNonDiscretionary:](v19, "setNonDiscretionary:", 1);
      goto LABEL_66;
    }
    if ((v93 & 0x100000000) != 0)
    {
      objc_msgSend(MEMORY[0x1E0C94F88], "br_downloadUserInitiated");
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_58;
    }
    if ((v90 & 1) != 0)
    {
      if (-[BRCAccountSession hasOptimizeStorageEnabled](self->super.super._session, "hasOptimizeStorageEnabled"))
        objc_msgSend(MEMORY[0x1E0C94F88], "br_downloadOpportunistic");
      else
        objc_msgSend(MEMORY[0x1E0C94F88], "br_downloadOptimizeStorageOff");
      v80 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C94F88], "br_downloadUpdatedDocuments");
      v80 = objc_claimAutoreleasedReturnValue();
    }
    v79 = (void *)v80;
LABEL_66:
    -[_BRCOperation setGroup:](v19, "setGroup:", v79);
    brc_bread_crumbs();
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v15 = v19;
    v82 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v82, OS_LOG_TYPE_DEFAULT))
    {
      v83 = -[BRCTransferBatchOperation itemsCount](v15, "itemsCount");
      objc_msgSend(v92, "contextIdentifier");
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218498;
      v111 = v83;
      v112 = 2112;
      v113 = (unint64_t)v84;
      v114 = 2112;
      v115 = (unint64_t)v81;
      _os_log_impl(&dword_1CBD43000, v82, OS_LOG_TYPE_DEFAULT, "[NOTICE] downloading %ld documents in %@%@", buf, 0x20u);

    }
    v11 = v92;
    objc_msgSend(v92, "downloadStream");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v85, "addBatchOperation:", v15);

    v16 = v95;
  }
  else
  {
    v15 = 0;
    v16 = v95;
    v11 = v92;
  }
LABEL_69:

}

uint64_t __79__BRCFSDownloader__sendContentsBatch_sizeHint_maxRecordsCount_isLoserDownload___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_finishedDownload:syncContext:operationID:error:", a2, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), a3);
}

- (void)_postponeLoserForWinner:(int64_t)a3 etag:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint8_t buf[4];
  int64_t v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  id v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  -[BRCAccountSession clientDB](self->super.super._session, "clientDB");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "execute:", CFSTR("UPDATE client_downloads    SET throttle_state = %u  WHERE throttle_id = %lld AND download_kind = %u AND download_etag = %@"), 42, a3, 2, v6);

  brc_bread_crumbs();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218754;
    v11 = a3;
    v12 = 2080;
    v13 = BRCPrettyPrintEnum();
    v14 = 2112;
    v15 = v6;
    v16 = 2112;
    v17 = v8;
    _os_log_debug_impl(&dword_1CBD43000, v9, OS_LOG_TYPE_DEBUG, "[DEBUG] Downloader[%lld-%s-%@]: postpone because loser is more recent than live item%@", buf, 0x2Au);
  }

}

- (void)_sendLosersBatch:(id)a3 sizeHint:(int64_t)a4 maxRecordsCount:(unint64_t)a5
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  BRCDownloadVersionsBatchOperation *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  BRCDownloadVersionsBatchOperation *v17;
  id v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t v26;
  id v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  BRCDownloadVersion *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  NSObject *v41;
  void *v42;
  uint64_t v43;
  BRCDownloadVersionsBatchOperation *v44;
  id v45;
  void *v46;
  void *v47;
  BRCDownloadVersionsBatchOperation *v48;
  void *v49;
  void *v50;
  unint64_t v52;
  id v53;
  _QWORD v54[5];
  id v55;
  id v56;
  uint8_t buf[4];
  uint64_t v58;
  __int16 v59;
  void *v60;
  __int16 v61;
  void *v62;
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "syncContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_alloc_init(MEMORY[0x1E0CB3788]);
  v9 = 0;
  v10 = 0;
  v11 = 0;
  v12 = 0;
  v13 = 0;
  v52 = a5;
  if (objc_msgSend(0, "itemsCount") + 1 >= a5)
    goto LABEL_33;
  v49 = v7;
  v50 = v8;
  v10 = 0;
  v9 = 0;
  v11 = 0;
  v14 = 0;
  v13 = 0;
  v53 = v6;
  while (1)
  {
    v15 = v9;
    v16 = (void *)MEMORY[0x1D17A6BE8]();
    objc_msgSend(v6, "nextDocumentItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
      break;
    v17 = v10;
    v18 = v11;
    objc_msgSend(v6, "stageID");
    v19 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "etag");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "currentVersion");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "ckInfo");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "etag");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v20;
    v24 = objc_msgSend(v23, "length");
    v25 = objc_msgSend(v13, "length");
    if (v24 == v25)
    {
      v26 = objc_msgSend(v23, "compare:", v13);
    }
    else if (v24 < v25)
    {
      v26 = -1;
    }
    else
    {
      v26 = 1;
    }

    if (v26 <= 0)
    {
      -[BRCFSDownloader _postponeLoserForWinner:etag:](self, "_postponeLoserForWinner:etag:", objc_msgSend(v9, "dbRowID"), v13);
      v11 = v18;
      v10 = v17;
      v6 = v53;
LABEL_23:
      v12 = (void *)v19;
      goto LABEL_24;
    }
    v11 = v18;
    v6 = v53;
    v12 = (void *)v19;
    if (v19)
    {
      if (v17)
        goto LABEL_12;
    }
    else
    {
      v27 = objc_alloc(MEMORY[0x1E0CB3940]);
      v28 = objc_msgSend(v9, "dbRowID");
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "UUIDString");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)objc_msgSend(v27, "initWithFormat:", CFSTR("loser-%lld-%@"), v28, v30);

      v6 = v53;
      v11 = v18;
      if (v17)
      {
LABEL_12:
        v10 = v17;
        goto LABEL_16;
      }
    }
    v10 = -[BRCDownloadVersionsBatchOperation initWithSyncContext:forNonLocalVersion:]([BRCDownloadVersionsBatchOperation alloc], "initWithSyncContext:forNonLocalVersion:", v49, 0);
    -[_BRCOperation operationID](v10, "operationID");
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    v54[0] = MEMORY[0x1E0C809B0];
    v54[1] = 3221225472;
    v54[2] = __61__BRCFSDownloader__sendLosersBatch_sizeHint_maxRecordsCount___block_invoke;
    v54[3] = &unk_1E8760A00;
    v54[4] = self;
    v55 = v49;
    v11 = v31;
    v56 = v11;
    -[BRCDownloadVersionsBatchOperation setPerDownloadCompletionBlock:](v10, "setPerDownloadCompletionBlock:", v54);

LABEL_16:
    if ((objc_msgSend(v50, "containsIndex:", objc_msgSend(v9, "dbRowID")) & 1) == 0)
    {
      objc_msgSend(v50, "addIndex:", objc_msgSend(v9, "dbRowID"));
      v19 = (uint64_t)v12;
      v32 = -[BRCDownloadVersion initWithDocument:stageID:etag:isLoser:]([BRCDownloadVersion alloc], "initWithDocument:stageID:etag:isLoser:", v9, v12, v13, 1);
      -[BRCDownloadVersion storage](v32, "storage");
      v33 = (void *)objc_claimAutoreleasedReturnValue();

      if (v33)
      {
        -[BRCDownloadVersionsBatchOperation addDownload:](v10, "addDownload:", v32);
      }
      else
      {
        brc_bread_crumbs();
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v35 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v35, (os_log_type_t)0x90u))
        {
          objc_msgSend(v9, "itemID");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          -[BRCDownloadVersion gsError](v32, "gsError");
          v48 = v10;
          v37 = v11;
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v58 = (uint64_t)v36;
          v59 = 2112;
          v60 = v38;
          v61 = 2112;
          v62 = v34;
          _os_log_error_impl(&dword_1CBD43000, v35, (os_log_type_t)0x90u, "[ERROR] backing off: can't resolve storage for %@: %@%@", buf, 0x20u);

          v11 = v37;
          v10 = v48;

        }
        objc_msgSend(v9, "markLostClearGenerationID:backoffMode:", 0, 1);
        v6 = v53;
      }
      -[BRCFSDownloader _willDownload:operationID:](self, "_willDownload:operationID:", v32, v11);

      goto LABEL_23;
    }
LABEL_24:
    objc_autoreleasePoolPop(v16);
    v14 = v12;
    if (-[BRCTransferBatchOperation itemsCount](v10, "itemsCount") + 1 >= v52)
      goto LABEL_27;
  }
  objc_autoreleasePoolPop(v16);
  v12 = v14;
LABEL_27:
  if (v10)
  {
    objc_msgSend(MEMORY[0x1E0C94F88], "br_downloadConflictingVersions");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[_BRCOperation setGroup:](v10, "setGroup:", v39);

    brc_bread_crumbs();
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v41 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
    {
      v42 = v12;
      v43 = -[BRCTransferBatchOperation itemsCount](v10, "itemsCount");
      objc_msgSend(v49, "contextIdentifier");
      v44 = v10;
      v45 = v11;
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218498;
      v58 = v43;
      v12 = v42;
      v59 = 2112;
      v60 = v46;
      v61 = 2112;
      v62 = v40;
      _os_log_impl(&dword_1CBD43000, v41, OS_LOG_TYPE_DEFAULT, "[NOTICE] downloading %ld previous documents versions in %@%@", buf, 0x20u);

      v11 = v45;
      v10 = v44;
    }

    objc_msgSend(v49, "downloadStream");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "addBatchOperation:", v10);

    v7 = v49;
  }
  else
  {
    v7 = v49;
  }
  v8 = v50;
LABEL_33:

}

uint64_t __61__BRCFSDownloader__sendLosersBatch_sizeHint_maxRecordsCount___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_finishedDownload:syncContext:operationID:error:", a2, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), a3);
}

- (void)_transferStreamOfSyncContext:(id)a3 didBecomeReadyWithMaxRecordsCount:(unint64_t)a4 sizeHint:(unint64_t)a5 priority:(int64_t)a6
{
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  BRCFSDownloader *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  id v25;
  unint64_t v26;
  unint64_t v27;
  uint64_t v28;
  BRCFSDownloaderBatchEnumerator *v29;
  BRCFSDownloaderBatchEnumerator *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  BRCFSDownloader *v36;
  unint64_t v37;
  unint64_t v38;
  BRCFSDownloaderBatchEnumerator *v39;
  uint64_t v40;

  v10 = a3;
  -[BRCAccountSession clientDB](self->super.super._session, "clientDB");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "assertOnQueue");
  v40 = 0x7FFFFFFFFFFFFFFFLL;
  v12 = brc_current_date_nsec();
  if (-[BRCFSSchedulerBase isCancelled](self, "isCancelled"))
    goto LABEL_29;
  v36 = self;
  objc_msgSend(v10, "contextIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v11, "fetch:", CFSTR("  SELECT throttle_id, next_retry_stamp, download_kind, download_etag     FROM client_downloads    WHERE throttle_state = 1      AND transfer_queue = %@      AND transfer_operation IS NULL      AND download_priority >= %ld ORDER BY download_priority DESC, download_request_stamp DESC"), v13, a6);

  if (!objc_msgSend(v14, "next"))
  {
    v30 = 0;
    goto LABEL_26;
  }
  v37 = a4;
  v38 = a5;
  v39 = 0;
  v15 = v36;
  v34 = v11;
  v35 = v10;
  do
  {
    v16 = (void *)MEMORY[0x1D17A6BE8]();
    v17 = objc_msgSend(v14, "unsignedIntegerAtIndex:", 0);
    v18 = objc_msgSend(v14, "longLongAtIndex:", 1);
    v19 = objc_msgSend(v14, "intAtIndex:", 2);
    objc_msgSend(v14, "stringAtIndex:", 3);
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = (void *)v20;
    if (v18 <= v12)
    {
      if ((_DWORD)v19 == 2)
      {
        v23 = (void *)objc_msgSend(v11, "fetchObjectOfClass:sql:", objc_opt_class(), CFSTR("SELECT version_ckinfo FROM client_items WHERE rowid = %ld"), v17);
        objc_msgSend(v23, "etag");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = v21;
        v26 = objc_msgSend(v24, "length");
        v27 = objc_msgSend(v25, "length");
        if (v26 == v27)
        {
          v28 = objc_msgSend(v24, "compare:", v25);
        }
        else if (v26 < v27)
        {
          v28 = -1;
        }
        else
        {
          v28 = 1;
        }

        if (v28 <= 0)
        {
          v15 = v36;
          -[BRCFSDownloader _postponeLoserForWinner:etag:](v36, "_postponeLoserForWinner:etag:", v17, v25);

          v11 = v34;
          v10 = v35;
          goto LABEL_22;
        }

        v11 = v34;
        v10 = v35;
        v15 = v36;
      }
      objc_msgSend(v14, "close");
      v29 = -[BRCFSDownloaderBatchEnumerator initWithSyncContext:kind:now:retryQueueKick:]([BRCFSDownloaderBatchEnumerator alloc], "initWithSyncContext:kind:now:retryQueueKick:", v10, v19, v12, &v40);

      switch((int)v19)
      {
        case 0:
        case 3:
          -[BRCFSDownloader _sendContentsBatch:sizeHint:maxRecordsCount:isLoserDownload:](v15, "_sendContentsBatch:sizeHint:maxRecordsCount:isLoserDownload:", v29, v38, v37, 0);
          break;
        case 1:
          -[BRCFSDownloader _sendThumbnailsBatch:sizeHint:maxRecordsCount:](v15, "_sendThumbnailsBatch:sizeHint:maxRecordsCount:", v29, v38, v37);
          break;
        case 2:
          -[BRCFSDownloader _sendLosersBatch:sizeHint:maxRecordsCount:](v15, "_sendLosersBatch:sizeHint:maxRecordsCount:", v29, v38, v37);
          break;
        default:
          break;
      }
      v39 = v29;
    }
    else
    {
      v22 = v40;
      if (v40 >= v18)
        v22 = v18;
      v40 = v22;
      objc_msgSend(v11, "execute:", CFSTR("UPDATE client_downloads    SET transfer_queue = '_retry'  WHERE throttle_id = %ld AND download_kind = %u AND download_etag = %@"), v17, v19, v20);
    }
LABEL_22:

    objc_autoreleasePoolPop(v16);
  }
  while ((objc_msgSend(v14, "next") & 1) != 0);
  v30 = v39;
  if (v40 != 0x7FFFFFFFFFFFFFFFLL)
    -[BRCFSSchedulerBase signalWithDeadline:](v15, "signalWithDeadline:");
LABEL_26:
  objc_msgSend(v10, "contextIdentifier");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = (void *)objc_msgSend(v11, "numberWithSQL:", CFSTR("SELECT MIN(next_retry_stamp) FROM client_downloads   WHERE throttle_state = 1     AND transfer_queue = %@      AND transfer_operation IS NULL "), v31);

  if (v32)
  {
    objc_msgSend(v10, "downloadStream");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "signalWithDeadline:", objc_msgSend(v32, "longLongValue"));

  }
LABEL_29:

}

- (void)transferStreamOfSyncContext:(id)a3 didBecomeReadyWithMaxRecordsCount:(unint64_t)a4 sizeHint:(unint64_t)a5 priority:(int64_t)a6 completionBlock:(id)a7
{
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  _QWORD v18[5];
  id v19;
  id v20;
  unint64_t v21;
  unint64_t v22;
  int64_t v23;

  v12 = a3;
  v13 = a7;
  -[BRCAccountSession clientDB](self->super.super._session, "clientDB");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "serialQueue");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __115__BRCFSDownloader_transferStreamOfSyncContext_didBecomeReadyWithMaxRecordsCount_sizeHint_priority_completionBlock___block_invoke;
  v18[3] = &unk_1E8760A28;
  v18[4] = self;
  v19 = v12;
  v22 = a5;
  v23 = a6;
  v20 = v13;
  v21 = a4;
  v16 = v13;
  v17 = v12;
  dispatch_async_with_logs_4(v15, v18);

}

uint64_t __115__BRCFSDownloader_transferStreamOfSyncContext_didBecomeReadyWithMaxRecordsCount_sizeHint_priority_completionBlock___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_transferStreamOfSyncContext:didBecomeReadyWithMaxRecordsCount:sizeHint:priority:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (void)_reportDownloadErrorForDocument:(id)a3 error:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;

  v6 = a3;
  objc_msgSend(a4, "brc_telemetryReportableErrorWithRecordName:", 0);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  -[BRCAccountSession clientDB](self->super.super._session, "clientDB");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "dbRowID");

  objc_msgSend(v13, "domain");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v13, "code");
  objc_msgSend(v13, "brc_cloudKitErrorMessage");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "execute:", CFSTR("INSERT OR REPLACE INTO item_errors (item_rowid, error_domain, error_code, error_message, service) VALUES (%llu, %@, %ld, %@, %d)"), v8, v9, v10, v11, 2);

  +[BRCAutoBugCaptureReporter sharedABCReporter](BRCAutoBugCaptureReporter, "sharedABCReporter");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "captureLogsForOperationType:ofSubtype:forError:", CFSTR("SyncHealth"), CFSTR("Download"), v13);

}

- (void)_clearDownloadErrorForDocument:(id)a3
{
  BRCAccountSession *session;
  id v4;
  uint64_t v5;
  id v6;

  session = self->super.super._session;
  v4 = a3;
  -[BRCAccountSession clientDB](session, "clientDB");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "dbRowID");

  objc_msgSend(v6, "execute:", CFSTR("DELETE FROM item_errors WHERE item_rowid = %llu AND service = %d"), v5, 2);
}

- (unint64_t)recoverAndReportMissingJobs
{
  void *v3;
  void *v4;
  uint64_t v5;
  id (*v6)(uint64_t, void *, uint64_t);
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  id (*v14)(uint64_t, void *, uint64_t);
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  id v20;
  void *v21;
  uint64_t v23;
  _QWORD v24[5];

  -[BRCAccountSession clientDB](self->super.super._session, "clientDB");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "fetch:", CFSTR("SELECT ci.rowid, ci.zone_rowid, ci.item_id, ci.item_creator_id, ci.item_sharing_options, ci.item_side_car_ckinfo, ci.item_parent_zone_rowid, ci.item_localsyncupstate, ci.item_local_diffs, ci.item_notifs_rank, ci.app_library_rowid, ci.item_min_supported_os_rowid, ci.item_user_visible, ci.item_stat_ckinfo, ci.item_state, ci.item_type, ci.item_mode, ci.item_birthtime, ci.item_lastusedtime, ci.item_favoriterank,ci.item_parent_id, ci.item_filename, ci.item_hidden_ext, ci.item_finder_tags, ci.item_xattr_signature, ci.item_trash_put_back_path, ci.item_trash_put_back_parent_id, ci.item_alias_target, ci.item_creator, ci.item_doc_id, ci.item_file_id, ci.item_generation, ci.item_localname, ci.item_processing_stamp, ci.item_staged_file_id, ci.item_staged_generation, ci.item_bouncedname, ci.item_scope, ci.item_tmpbounceno, ci.version_name, ci.version_ckinfo, ci.version_mtime, ci.version_size, ci.version_thumb_size, ci.version_thumb_signature, ci.version_content_signature, ci.version_xattr_signature, ci.version_edited_since_shared, ci.version_device, ci.version_conflict_loser_etags, ci.version_quarantine_info, ci.version_uploaded_assets, ci.version_upload_error, ci.version_old_zone_item_id, ci.version_old_zone_rowid, ci.desired_version, ci.item_live_conflict_loser_etags, ci.item_thumb_live_signature, ci.item_thumb_greedy, ci.version_block_sync_until_bundle_id, ci.version_block_sync_until_timestamp FROM client_items AS ci WHERE ci.desired_version IS NOT NULL AND NOT EXISTS (SELECT 1 FROM client_downloads AS downloader WHERE ci.rowid = downloader.throttle_id AND downloader.throttle_state != 0)"));

  if (objc_msgSend(v4, "next"))
  {
    v23 = 0;
    v5 = MEMORY[0x1E0C809B0];
    v6 = __46__BRCFSDownloader_recoverAndReportMissingJobs__block_invoke;
    do
    {
      v7 = (void *)MEMORY[0x1D17A6BE8]();
      v24[0] = v5;
      v24[1] = 3221225472;
      v24[2] = v6;
      v24[3] = &unk_1E875E2C8;
      v24[4] = self;
      objc_msgSend(v4, "object:", v24);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "asDocument");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v9, "desiredVersion");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "wantsContent");

      if (v11)
      {
        objc_msgSend(v9, "clientZone");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "itemID");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "serverItemByItemID:", v13);
        v14 = v6;
        v15 = v5;
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        -[BRCFSDownloader scheduleContentDownloadForItem:serverItem:options:etagIfLoser:stageFileName:error:](self, "scheduleContentDownloadForItem:serverItem:options:etagIfLoser:stageFileName:error:", v9, v16, 0, 0, 0, 0);
        v23 = (v23 + 1);

        v5 = v15;
        v6 = v14;
      }

      objc_autoreleasePoolPop(v7);
    }
    while ((objc_msgSend(v4, "next") & 1) != 0);
    v17 = v23;
    if ((int)v23 >= 1)
    {
      brc_bread_crumbs();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
        -[BRCFSDownloader recoverAndReportMissingJobs].cold.1((uint64_t)v18, v23, v19);

      -[BRCFSDownloader schedule](self, "schedule");
    }
  }
  else
  {
    v17 = 0;
  }
  v20 = +[AppTelemetryTimeSeriesEvent newMissingDownloaderJobEventWithNumberMissing:](AppTelemetryTimeSeriesEvent, "newMissingDownloaderJobEventWithNumberMissing:", v17);
  -[BRCAccountSession analyticsReporter](self->super.super._session, "analyticsReporter");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "postReportForDefaultSubCategoryWithCategory:telemetryTimeEvent:", 8, v20);

  return (int)v17;
}

id __46__BRCFSDownloader_recoverAndReportMissingJobs__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v5 = a2;
  objc_msgSend(v4, "clientDB");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "newLocalItemFromPQLResultSet:db:error:", v5, v6, a3);

  return v7;
}

- (BRCDeadlineScheduler)downloadsDeadlineScheduler
{
  return self->_downloadsDeadlineScheduler;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_downloadsDeadlineScheduler, 0);
  objc_storeStrong((id *)&self->_willRetryOperationProgress, 0);
  objc_storeStrong((id *)&self->_lastDownloadRefresh, 0);
  objc_storeStrong((id *)&self->_fairScheduler, 0);
  objc_storeStrong((id *)&self->_tracker, 0);
}

void __80__BRCFSDownloader_LegacyAdditions__evictLosersOnItem_atURL_applySchedulerState___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  uint64_t v6;
  uint8_t v7[14];
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_3();
  v8 = a2;
  OUTLINED_FUNCTION_3_2(&dword_1CBD43000, a3, v6, "[DEBUG] removed additions from %@%@", v7);

}

- (void)_createDownloadingJobForItem:(os_log_t)log state:kind:etag:userInitiated:stageFileName:error:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  const char *v4;
  __int16 v5;
  const char *v6;
  __int16 v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = 136315906;
  v4 = "-[BRCFSDownloader _createDownloadingJobForItem:state:kind:etag:userInitiated:stageFileName:error:]";
  v5 = 2080;
  v6 = "(passed to caller)";
  v7 = 2112;
  v8 = a1;
  v9 = 2112;
  v10 = a2;
  _os_log_error_impl(&dword_1CBD43000, log, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", (uint8_t *)&v3, 0x2Au);
}

- (void)_finishedDownload:(uint64_t)a1 syncContext:operationID:error:.cold.1(uint64_t a1)
{
  NSObject *v1;
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412546;
  v3 = a1;
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_2(&dword_1CBD43000, v1, (uint64_t)v1, "[DEBUG] Got an out of space error %@%@", (uint8_t *)&v2);
  OUTLINED_FUNCTION_2();
}

- (void)_finishedDownload:syncContext:operationID:error:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: ![[BRCAccountsManager sharedManager] isInSyncBubble]%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __67__BRCFSDownloader__finishedDownload_syncContext_operationID_error___block_invoke_183_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_1(&dword_1CBD43000, v0, v1, "[DEBUG] We failed downloading a conflict loser so kicking the apply scheduler in case it was blocked for download%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __67__BRCFSDownloader__finishedDownload_syncContext_operationID_error___block_invoke_183_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_1(&dword_1CBD43000, v0, v1, "[DEBUG] The error is for an unknown item, check if the zone hasn't been wiped%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)rescheduleJobsPendingWinnerForItem:.cold.1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_3_2(&dword_1CBD43000, v0, (uint64_t)v0, "[DEBUG] Downloader: scheduling %lld suspended throttles%@", v1);
  OUTLINED_FUNCTION_2();
}

- (void)_getCancelErrorFromCancelReason:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] UNREACHABLE: New cancel reasons should be mapped to errors%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)cancelAndCleanupItemDownload:kind:etag:andNotifyDownloadTrackers:cancelReason:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: kind == BRCDownloadKindContent || kind == BRCDownloadKindSpeculative%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)cancelAndCleanupItemDownload:kind:etag:andNotifyDownloadTrackers:cancelReason:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: etag == nil%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)makeContentLive:(uint64_t)a1 .cold.1(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4_1(&dword_1CBD43000, v1, v2, "[ERROR] nil coordinated read url for %@%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_2();
}

void __35__BRCFSDownloader_makeContentLive___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3_2(&dword_1CBD43000, a3, v5, "[DEBUG] no pre-existing thumbnail at '%@'%@", v6);

}

void __35__BRCFSDownloader_makeContentLive___block_invoke_222_cold_1(_QWORD *a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = *a1;
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4_1(&dword_1CBD43000, v1, v2, "[ERROR] We should have a stageID for this item: %@%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_2();
}

- (void)scheduleContentDownloadForItem:serverItem:options:etagIfLoser:stageFileName:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_1(&dword_1CBD43000, v0, v1, "[DEBUG] no need to schedule anything, we're already attempting to download that same version%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)scheduleContentDownloadForItem:serverItem:options:etagIfLoser:stageFileName:error:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_1(&dword_1CBD43000, v0, v1, "[DEBUG] no need to schedule anything, we're already actively downloading that same etag%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)performFirstSchedulingAfterStartupInDB:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "changes");
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3_2(&dword_1CBD43000, a3, v4, "[DEBUG] Rescheduled %lld in-flight transfers because we have restarted%@", v5);
}

- (void)recoverAndReportMissingJobs
{
  _DWORD v3[2];
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3[0] = 67109378;
  v3[1] = a2;
  v4 = 2112;
  v5 = a1;
  _os_log_debug_impl(&dword_1CBD43000, log, OS_LOG_TYPE_DEBUG, "[DEBUG] Downloader: Recovered from %u missing download jobs%@", (uint8_t *)v3, 0x12u);
  OUTLINED_FUNCTION_2();
}

@end
