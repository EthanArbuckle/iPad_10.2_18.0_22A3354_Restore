@implementation BRCClientZone

- (id)directUnsaltedNonAliasItemsInServerTruthEnumeratorParentedTo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[5];

  v4 = a3;
  -[BRCClientZone db](self, "db");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCClientZone dbRowID](self, "dbRowID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "fetch:", CFSTR("SELECT zone_rowid, item_rank, item_origname, pcs_state, item_id, item_creator_id, item_sharing_options, item_side_car_ckinfo, item_stat_ckinfo, item_state, item_type, item_mode, item_birthtime, item_lastusedtime, item_favoriterank,item_parent_id, item_filename, item_hidden_ext, item_finder_tags, item_xattr_signature, item_trash_put_back_path, item_trash_put_back_parent_id, item_alias_target, item_creator, version_name, version_ckinfo, version_mtime, version_size, version_thumb_size, version_thumb_signature, version_content_signature, version_xattr_signature, version_edited_since_shared, version_device, version_conflict_loser_etags, version_quarantine_info, quota_used, recursive_child_count, shared_children_count, shared_alias_count, child_count FROM server_items WHERE item_parent_id = %@ AND basehash_salt_validation_key IS NULL AND item_type != 3 and zone_rowid = %@"), v4, v6);

  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __104__BRCClientZone_BRCBaseHashSaltAdditions__directUnsaltedNonAliasItemsInServerTruthEnumeratorParentedTo___block_invoke;
  v10[3] = &unk_1E875E2C8;
  v10[4] = self;
  objc_msgSend(v7, "enumerateObjects:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id __104__BRCClientZone_BRCBaseHashSaltAdditions__directUnsaltedNonAliasItemsInServerTruthEnumeratorParentedTo___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = *(void **)(a1 + 32);
  v5 = a2;
  objc_msgSend(v4, "session");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "newServerItemFromPQLResultSet:error:", v5, a3);

  return v7;
}

- (unsigned)saltingStateForItemID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned int v8;
  void *v9;
  void *v10;
  unsigned int v11;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v4 = a3;
  if (objc_msgSend(v4, "isNonDesktopRoot"))
  {
    if (!-[BRCClientZone isPrivateZone](self, "isPrivateZone"))
    {
      brc_bread_crumbs();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
        -[BRCClientZone(BRCBaseHashSaltAdditions) saltingStateForItemID:].cold.1((uint64_t)v13, v14, v15, v16, v17, v18, v19, v20);

    }
    -[BRCClientZone session](self, "session");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appLibraryRowID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "appLibraryByRowID:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!objc_msgSend(v7, "rootRecordCreated"))
    {
      v11 = -1;
      goto LABEL_9;
    }
    v8 = objc_msgSend(v7, "saltingState");
  }
  else
  {
    -[BRCClientZone db](self, "db");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCClientZone dbRowID](self, "dbRowID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v9, "numberWithSQL:", CFSTR("SELECT salting_state FROM server_items WHERE item_id = %@ AND zone_rowid = %@ LIMIT 1"), v4, v10);

    if (!v7)
      return -1;
    v8 = objc_msgSend(v7, "intValue");
  }
  v11 = v8;
LABEL_9:

  return v11;
}

- (id)childBaseSaltForItemID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "isNonDesktopRoot"))
  {
    if (!-[BRCClientZone isPrivateZone](self, "isPrivateZone"))
    {
      brc_bread_crumbs();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
        -[BRCClientZone(BRCBaseHashSaltAdditions) saltingStateForItemID:].cold.1((uint64_t)v15, v16, v17, v18, v19, v20, v21, v22);

    }
    -[BRCClientZone session](self, "session");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appLibraryRowID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appLibraryByRowID:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "childBasehashSalt");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[BRCClientZone db](self, "db");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCClientZone dbRowID](self, "dbRowID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v5, "dataWithSQL:", CFSTR("SELECT child_basehash_salt FROM server_items WHERE item_id = %@ AND zone_rowid = %@ LIMIT 1"), v4, v6);
  }

  brc_bread_crumbs();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v8, "brc_truncatedSHA256");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "brc_hexadecimalString");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "debugDescription");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v24 = v13;
    v25 = 2112;
    v26 = v14;
    v27 = 2112;
    v28 = v9;
    _os_log_debug_impl(&dword_1CBD43000, v10, OS_LOG_TYPE_DEBUG, "[DEBUG] Found child basehash salt %@ from database for %@%@", buf, 0x20u);

  }
  return v8;
}

- (void)cancelReset
{
  NSObject *v3;
  _QWORD block[5];

  if (self->_resetTimer)
  {
    -[BRCAccountSession resetQueue](self->_session, "resetQueue");
    v3 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __42__BRCClientZone_BRCZoneReset__cancelReset__block_invoke;
    block[3] = &unk_1E875D500;
    block[4] = self;
    dispatch_sync(v3, block);

  }
}

void __42__BRCClientZone_BRCZoneReset__cancelReset__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;

  v2 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 296);
  if (v2)
  {
    dispatch_source_cancel(v2);
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 296);
    *(_QWORD *)(v3 + 296) = 0;

  }
}

- (void)scheduleReset:(unint64_t)a3
{
  -[BRCClientZone scheduleReset:completionHandler:](self, "scheduleReset:completionHandler:", a3, 0);
}

- (void)scheduleReset:(unint64_t)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD v14[5];
  id v15;
  id v16;
  unint64_t v17;
  uint64_t v18[3];
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  BRCClientZone *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  -[BRCAccountSession resetQueue](self->_session, "resetQueue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  memset(v18, 0, sizeof(v18));
  __brc_create_section(0, (uint64_t)"-[BRCClientZone(BRCZoneReset) scheduleReset:completionHandler:]", 104, v18);
  brc_bread_crumbs();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    v12 = v18[0];
    v13 = BRCPrettyPrintEnum();
    *(_DWORD *)buf = 134218754;
    v20 = v12;
    v21 = 2080;
    v22 = v13;
    v23 = 2112;
    v24 = self;
    v25 = 2112;
    v26 = v8;
    _os_log_debug_impl(&dword_1CBD43000, v9, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx scheduling reset %s of %@%@", buf, 0x2Au);
  }

  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __63__BRCClientZone_BRCZoneReset__scheduleReset_completionHandler___block_invoke;
  v14[3] = &unk_1E8760110;
  v14[4] = self;
  v17 = a3;
  v10 = v6;
  v16 = v10;
  v11 = v7;
  v15 = v11;
  dispatch_async_with_logs_5(v11, v14);

  __brc_leave_section(v18);
}

void __63__BRCClientZone_BRCZoneReset__scheduleReset_completionHandler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  int v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  int64_t v16;
  unint64_t v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  NSObject *v23;
  dispatch_source_t v24;
  uint64_t v25;
  void *v26;
  NSObject *v27;
  dispatch_time_t v28;
  uint64_t v29;
  void *v30;
  id v31;
  _QWORD *v32;
  NSObject *v33;
  _QWORD *v34;
  void *v35;
  void *v36;
  dispatch_block_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  void *v41;
  NSObject *v42;
  _QWORD v43[5];
  id v44;
  uint64_t *v45;
  __int128 v46;
  uint64_t v47;
  __int128 v48;
  uint64_t v49;
  __int128 v50;
  uint64_t v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _QWORD block[8];
  uint64_t v57;
  uint64_t *v58;
  uint64_t v59;
  uint64_t (*v60)(uint64_t, uint64_t);
  void (*v61)(uint64_t);
  id v62;
  uint64_t v63;
  uint64_t *v64;
  uint64_t v65;
  uint64_t v66;
  uint8_t buf[4];
  uint64_t v68;
  __int16 v69;
  void *v70;
  __int16 v71;
  uint64_t v72;
  __int16 v73;
  void *v74;
  uint8_t v75[128];
  uint8_t v76[24];
  uint64_t v77;

  v77 = *MEMORY[0x1E0C80C00];
  v63 = 0;
  v64 = &v63;
  v65 = 0x2020000000;
  v66 = 0;
  v57 = 0;
  v58 = &v57;
  v59 = 0x3032000000;
  v60 = __Block_byref_object_copy__15;
  v61 = __Block_byref_object_dispose__15;
  v62 = 0;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "serialQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63__BRCClientZone_BRCZoneReset__scheduleReset_completionHandler___block_invoke_1;
  block[3] = &unk_1E8760CB0;
  block[4] = *(_QWORD *)(a1 + 32);
  block[5] = &v63;
  v4 = *(_QWORD *)(a1 + 56);
  block[6] = &v57;
  block[7] = v4;
  dispatch_sync(v2, block);

  if (v64[3])
  {
    brc_bread_crumbs();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      __63__BRCClientZone_BRCZoneReset__scheduleReset_completionHandler___block_invoke_cold_2(objc_msgSend((id)v58[5], "count"), (uint64_t)v5, v76, v6);

    v54 = 0u;
    v55 = 0u;
    v52 = 0u;
    v53 = 0u;
    v7 = (id)v58[5];
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v52, v75, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v53;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v53 != v9)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v52 + 1) + 8 * i), "waitUntilFinished");
        }
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v52, v75, 16);
      }
      while (v8);
    }

    v11 = objc_msgSend(*(id *)(a1 + 32), "isSharedZone");
    v12 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
    if (v11)
      objc_msgSend(v12, "sharedAppLibraryResetThrottle");
    else
      objc_msgSend(v12, "appLibraryResetThrottle");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "zoneName");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = +[BRCThrottle throttleHashFormat:](BRCThrottle, "throttleHashFormat:", CFSTR("%@~%d"), v15, v64[3]);

    v17 = objc_msgSend(v14, "nsecsToNextRetry:now:increment:", v16, brc_current_date_nsec(), 0);
    objc_msgSend(v14, "incrementRetryCount:", v16);
    if (v17)
    {
      if (v17 < 0x7FFFFFFFFFFFFFFFLL)
      {
        v48 = 0uLL;
        v49 = 0;
        __brc_create_section(0, (uint64_t)"-[BRCClientZone(BRCZoneReset) scheduleReset:completionHandler:]_block_invoke", 202, &v48);
        brc_bread_crumbs();
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
        {
          v38 = v48;
          brc_interval_from_nsec();
          v39 = *(_QWORD *)(a1 + 32);
          *(_DWORD *)buf = 134218754;
          v68 = v38;
          v69 = 2048;
          v70 = v40;
          v71 = 2112;
          v72 = v39;
          v73 = 2112;
          v74 = v22;
          _os_log_debug_impl(&dword_1CBD43000, v23, OS_LOG_TYPE_DEBUG, "[DEBUG] ┣%llx waiting %.3f secs to reset %@%@", buf, 0x2Au);
        }

        v50 = v48;
        v51 = v49;
        if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 296))
        {
          brc_bread_crumbs();
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v42 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v42, OS_LOG_TYPE_FAULT))
            __63__BRCClientZone_BRCZoneReset__scheduleReset_completionHandler___block_invoke_cold_1();

        }
        v24 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, *(dispatch_queue_t *)(a1 + 40));
        v25 = *(_QWORD *)(a1 + 32);
        v26 = *(void **)(v25 + 296);
        *(_QWORD *)(v25 + 296) = v24;

        v27 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 296);
        v28 = dispatch_time(0, v17);
        dispatch_source_set_timer(v27, v28, 0xFFFFFFFFFFFFFFFFLL, 0);
        v29 = *(_QWORD *)(a1 + 32);
        v30 = *(void **)(v29 + 296);
        v43[0] = v3;
        v43[1] = 3221225472;
        v43[2] = __63__BRCClientZone_BRCZoneReset__scheduleReset_completionHandler___block_invoke_5;
        v43[3] = &unk_1E8760CD8;
        v46 = v50;
        v47 = v51;
        v43[4] = v29;
        v45 = &v63;
        v44 = *(id *)(a1 + 48);
        v31 = v30;
        v32 = v43;
        v33 = v31;
        v34 = v32;
        v35 = v34;
        v36 = v34;
        if (*MEMORY[0x1E0D11070])
        {
          ((void (*)(_QWORD *))*MEMORY[0x1E0D11070])(v34);
          v36 = (void *)objc_claimAutoreleasedReturnValue();

        }
        v37 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_UTILITY, 0, v36);
        dispatch_source_set_event_handler(v33, v37);

        dispatch_resume(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 296));
      }
      else
      {
        brc_bread_crumbs();
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          v20 = *(_QWORD *)(a1 + 32);
          *(_DWORD *)buf = 138412546;
          v68 = v20;
          v69 = 2112;
          v70 = v18;
          _os_log_impl(&dword_1CBD43000, v19, OS_LOG_TYPE_DEFAULT, "[WARNING] giving up on resetting %@%@", buf, 0x16u);
        }

        v21 = *(_QWORD *)(a1 + 48);
        if (v21)
          (*(void (**)(void))(v21 + 16))();
      }
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "_reset:completionHandler:", v64[3], *(_QWORD *)(a1 + 48));
    }

  }
  else
  {
    v13 = *(_QWORD *)(a1 + 48);
    if (v13)
      (*(void (**)(void))(v13 + 16))();
  }
  _Block_object_dispose(&v57, 8);

  _Block_object_dispose(&v63, 8);
}

void __63__BRCClientZone_BRCZoneReset__scheduleReset_completionHandler___block_invoke_1(uint64_t a1)
{
  unsigned int v2;
  uint64_t v3;
  void *v4;
  void *v5;
  unsigned int v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  id v24;
  id v25;
  void *v26;
  _QWORD v27[6];
  int v28;
  uint64_t v29[3];
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t buf[4];
  uint64_t v35;
  __int16 v36;
  uint64_t v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  void *v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(*(id *)(a1 + 32), "state");
  if ((v2 & 0x20000) != 0)
    v3 = 3;
  else
    v3 = *(_QWORD *)(a1 + 56);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v3;
  if (objc_msgSend(*(id *)(a1 + 32), "isPrivateZone"))
  {
    objc_msgSend(*(id *)(a1 + 32), "asPrivateClientZone");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "defaultAppLibrary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "state");

  }
  else
  {
    v6 = 0;
  }
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) <= 2uLL)
    v7 = 256;
  else
    v7 = 131328;
  if (objc_msgSend(*(id *)(a1 + 32), "isPrivateZone"))
  {
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    objc_msgSend(*(id *)(a1 + 32), "asPrivateClientZone");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "appLibraries");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v30, v42, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v31;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v31 != v11)
            objc_enumerationMutation(v9);
          v13 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
          if ((v2 & 0x100) == 0)
            objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * i), "cancelFileCoordinators");
          objc_msgSend(v13, "setStateBits:", 8);
        }
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v30, v42, 16);
      }
      while (v10);
    }

  }
  memset(v29, 0, sizeof(v29));
  __brc_create_section(0, (uint64_t)"-[BRCClientZone(BRCZoneReset) scheduleReset:completionHandler:]_block_invoke", 138, v29);
  brc_bread_crumbs();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    v21 = v29[0];
    v22 = BRCPrettyPrintEnum();
    v23 = *(void **)(a1 + 32);
    *(_DWORD *)buf = 134218754;
    v35 = v21;
    v36 = 2080;
    v37 = v22;
    v38 = 2112;
    v39 = v23;
    v40 = 2112;
    v41 = v14;
    _os_log_debug_impl(&dword_1CBD43000, v15, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx reset %s of %@%@", buf, 0x2Au);
  }

  if ((v2 & 0x100) != 0)
  {
    brc_bread_crumbs();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      BRCClientZoneStatePrettyPrint(v2);
      v24 = (id)objc_claimAutoreleasedReturnValue();
      BRCAppLibraryStatePrettyPrint(v6);
      v25 = (id)objc_claimAutoreleasedReturnValue();
      BRCClientZoneStatePrettyPrint(v7 & ~v2);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      v35 = (uint64_t)v24;
      v36 = 2112;
      v37 = (uint64_t)v25;
      v38 = 2112;
      v39 = v26;
      v40 = 2112;
      v41 = v19;
      _os_log_debug_impl(&dword_1CBD43000, v20, OS_LOG_TYPE_DEBUG, "[DEBUG] zone is already resetting (zone:%@,appLibrary:%@) but adding (%@) for the next reset%@", buf, 0x2Au);

    }
    objc_msgSend(*(id *)(a1 + 32), "setStateBits:", v7);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
  }
  else
  {
    v16 = *(_QWORD *)(a1 + 32);
    v17 = *(void **)(v16 + 64);
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __63__BRCClientZone_BRCZoneReset__scheduleReset_completionHandler___block_invoke_2;
    v27[3] = &unk_1E8760C88;
    v28 = v7;
    v18 = *(_QWORD *)(a1 + 48);
    v27[4] = v16;
    v27[5] = v18;
    objc_msgSend(v17, "performWithFlags:action:", 16, v27);
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "saveClientZoneToDB:");
  __brc_leave_section(v29);
}

uint64_t __63__BRCClientZone_BRCZoneReset__scheduleReset_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  void *v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "setStateBits:", *(unsigned int *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "clearSyncStateBits:", 15);
  objc_msgSend(*(id *)(a1 + 32), "_cancelAllOperationsForReset");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  if (objc_msgSend(*(id *)(a1 + 32), "isPrivateZone"))
  {
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    objc_msgSend(*(id *)(a1 + 32), "asPrivateClientZone", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appLibraries");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v28, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v19;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v19 != v9)
            objc_enumerationMutation(v6);
          v11 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v10);
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "stageRegistry");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "forgetWatchedLockedFileIDsForAppLibrary:", v11);

          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v28, 16);
      }
      while (v8);
    }

  }
  brc_bread_crumbs();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    BRCClientZoneStatePrettyPrint(*(_DWORD *)(a1 + 48));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412802;
    v23 = v16;
    v24 = 2112;
    v25 = v17;
    v26 = 2112;
    v27 = v13;
    _os_log_debug_impl(&dword_1CBD43000, v14, OS_LOG_TYPE_DEBUG, "[DEBUG] flushing reset state (%@) for container %@%@", buf, 0x20u);

  }
  return 1;
}

void __63__BRCClientZone_BRCZoneReset__scheduleReset_completionHandler___block_invoke_5(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  __int128 v6;
  uint64_t v7;

  v6 = *(_OWORD *)(a1 + 56);
  v7 = *(_QWORD *)(a1 + 72);
  brc_bread_crumbs();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    __63__BRCClientZone_BRCZoneReset__scheduleReset_completionHandler___block_invoke_5_cold_1();

  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 296);
  *(_QWORD *)(v4 + 296) = 0;

  objc_msgSend(*(id *)(a1 + 32), "_reset:completionHandler:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24), *(_QWORD *)(a1 + 40), v6, v7);
  __brc_leave_section((uint64_t *)&v6);
}

- (void)_reset:(unint64_t)a3 completionHandler:(id)a4
{
  void (**v6)(_QWORD);
  NSObject *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  _QWORD v16[5];
  void (**v17)(_QWORD);
  _QWORD v18[5];
  void (**v19)(_QWORD);
  _QWORD v20[5];
  void (**v21)(_QWORD);
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = (void (**)(_QWORD))a4;
  -[BRCAccountSession resetQueue](self->_session, "resetQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  if (self->_activated)
  {
    brc_bread_crumbs();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      -[BRCClientZone mangledID](self, "mangledID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v23 = v10;
      v24 = 2080;
      v25 = BRCPrettyPrintEnum();
      v26 = 2112;
      v27 = v8;
      _os_log_impl(&dword_1CBD43000, v9, OS_LOG_TYPE_DEFAULT, "[NOTICE] resetting %@: %s%@", buf, 0x20u);

    }
    switch(a3)
    {
      case 4uLL:
        v16[0] = MEMORY[0x1E0C809B0];
        v16[1] = 3221225472;
        v16[2] = __56__BRCClientZone_BRCZoneReset___reset_completionHandler___block_invoke_3;
        v16[3] = &unk_1E875EAA8;
        v16[4] = self;
        v17 = v6;
        -[BRCClientZone _performAfterResetServerAndClientTruthsAndUnlinkDataAndPurgeTheZone:](self, "_performAfterResetServerAndClientTruthsAndUnlinkDataAndPurgeTheZone:", v16);
        v11 = v17;
        goto LABEL_14;
      case 3uLL:
        v18[0] = MEMORY[0x1E0C809B0];
        v18[1] = 3221225472;
        v18[2] = __56__BRCClientZone_BRCZoneReset___reset_completionHandler___block_invoke_2;
        v18[3] = &unk_1E875EAA8;
        v18[4] = self;
        v19 = v6;
        -[BRCClientZone _performAfterResetServerAndClientTruthsAndUnlinkData:](self, "_performAfterResetServerAndClientTruthsAndUnlinkData:", v18);
        v11 = v19;
        goto LABEL_14;
      case 2uLL:
        v20[0] = MEMORY[0x1E0C809B0];
        v20[1] = 3221225472;
        v20[2] = __56__BRCClientZone_BRCZoneReset___reset_completionHandler___block_invoke;
        v20[3] = &unk_1E875EAA8;
        v20[4] = self;
        v21 = v6;
        -[BRCClientZone _performResetAndWantsUnlink:clientTruthBlock:completionBlock:](self, "_performResetAndWantsUnlink:clientTruthBlock:completionBlock:", 0, 0, v20);
        v11 = v21;
LABEL_14:

        goto LABEL_18;
    }
    brc_bread_crumbs();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
      -[BRCClientZone(BRCZoneReset) _reset:completionHandler:].cold.2();

  }
  else
  {
    brc_bread_crumbs();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    brc_notifications_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      -[BRCClientZone(BRCZoneReset) _reset:completionHandler:].cold.1();

    if (v6)
      v6[2](v6);
  }
LABEL_18:

}

uint64_t __56__BRCClientZone_BRCZoneReset___reset_completionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_finishedReset:completionHandler:", 2, *(_QWORD *)(a1 + 40));
}

uint64_t __56__BRCClientZone_BRCZoneReset___reset_completionHandler___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_finishedReset:completionHandler:", 3, *(_QWORD *)(a1 + 40));
}

uint64_t __56__BRCClientZone_BRCZoneReset___reset_completionHandler___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_finishedReset:completionHandler:", 4, *(_QWORD *)(a1 + 40));
}

- (void)_removeTargetedAliasesWithCompletionBlock:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  BRCPQLConnection *db;
  uint64_t v11;
  NSObject *v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  BRCClientZone *v17;
  NSObject *v18;
  id v19;
  uint64_t v20;
  _QWORD v21[5];
  id v22;
  uint64_t v23;

  v4 = a3;
  -[BRCAccountSession resetQueue](self->_session, "resetQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);
  v6 = (void *)objc_opt_new();
  -[BRCClientZone mangledID](self, "mangledID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "aliasDeletionBatchSize");

  db = self->_db;
  v11 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __73__BRCClientZone_BRCZoneReset___removeTargetedAliasesWithCompletionBlock___block_invoke;
  v21[3] = &unk_1E875EF90;
  v21[4] = self;
  v22 = v6;
  v23 = v9;
  v15[0] = v11;
  v15[1] = 3221225472;
  v15[2] = __73__BRCClientZone_BRCZoneReset___removeTargetedAliasesWithCompletionBlock___block_invoke_8;
  v15[3] = &unk_1E8760D00;
  v16 = v22;
  v17 = self;
  v19 = v4;
  v20 = v9;
  v18 = v5;
  v12 = v5;
  v13 = v4;
  v14 = v22;
  -[BRCPQLConnection performWithFlags:action:whenFlushed:](db, "performWithFlags:action:whenFlushed:", 25, v21, v15);

}

uint64_t __73__BRCClientZone_BRCZoneReset___removeTargetedAliasesWithCompletionBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  NSObject *v25;
  uint64_t v26;
  void *v27;
  id v29;
  id obj;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint8_t buf[4];
  uint64_t v44;
  __int16 v45;
  void *v46;
  __int16 v47;
  void *v48;
  _BYTE v49[128];
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "isPrivateZone"))
  {
    v29 = v3;
    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    objc_msgSend(*(id *)(a1 + 32), "asPrivateClientZone");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appLibraries");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    obj = v5;
    v32 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v39, v50, 16);
    if (v32)
    {
      v31 = *(_QWORD *)v40;
      do
      {
        v6 = 0;
        do
        {
          if (*(_QWORD *)v40 != v31)
            objc_enumerationMutation(obj);
          v33 = v6;
          v7 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * v6);
          v35 = 0u;
          v36 = 0u;
          v37 = 0u;
          v38 = 0u;
          objc_msgSend(v7, "liveAliasesEnumeratorTargetingThisAppLibrary");
          v34 = (id)objc_claimAutoreleasedReturnValue();
          v8 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v35, v49, 16);
          if (v8)
          {
            v9 = v8;
            v10 = *(_QWORD *)v36;
            do
            {
              v11 = 0;
              do
              {
                if (*(_QWORD *)v36 != v10)
                  objc_enumerationMutation(v34);
                v12 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * v11);
                v13 = (void *)MEMORY[0x1D17A6BE8]();
                objc_msgSend(v12, "clientZone");
                v14 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v12, "itemID");
                v15 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v14, "serverItemByItemID:", v15);
                v16 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(v12, "st");
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v17, "fileID");
                v18 = (void *)objc_claimAutoreleasedReturnValue();

                if (v18)
                {
                  brc_bread_crumbs();
                  v19 = (void *)objc_claimAutoreleasedReturnValue();
                  brc_default_log();
                  v20 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
                  {
                    *(_DWORD *)buf = 138412546;
                    v44 = (uint64_t)v12;
                    v45 = 2112;
                    v46 = v19;
                    _os_log_debug_impl(&dword_1CBD43000, v20, OS_LOG_TYPE_DEBUG, "[DEBUG] scheduling unlink of %@%@", buf, 0x16u);
                  }

                  v21 = *(void **)(a1 + 40);
                  objc_msgSend(v12, "st");
                  v22 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v22, "fileID");
                  v23 = objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v21, "addObject:", v23);
                }
                else
                {
                  brc_bread_crumbs();
                  v22 = (void *)objc_claimAutoreleasedReturnValue();
                  brc_default_log();
                  v23 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
                  {
                    *(_DWORD *)buf = 138412546;
                    v44 = (uint64_t)v12;
                    v45 = 2112;
                    v46 = v22;
                    _os_log_fault_impl(&dword_1CBD43000, v23, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: live doc with no fileid: %@%@", buf, 0x16u);
                  }
                }

                objc_msgSend(v12, "markNeedsDeleteForRescheduleOfItem:", v16);
                objc_msgSend(v12, "saveToDB");

                objc_autoreleasePoolPop(v13);
                ++v11;
              }
              while (v9 != v11);
              v9 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v35, v49, 16);
            }
            while (v9);
          }

          brc_bread_crumbs();
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v25 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
          {
            v26 = objc_msgSend(*(id *)(a1 + 40), "count");
            v27 = *(void **)(a1 + 48);
            *(_DWORD *)buf = 134218498;
            v44 = v26;
            v45 = 2048;
            v46 = v27;
            v47 = 2112;
            v48 = v24;
            _os_log_debug_impl(&dword_1CBD43000, v25, OS_LOG_TYPE_DEBUG, "[DEBUG] deleted %lu aliases for reschedule for container reset (batch size %llu)%@", buf, 0x20u);
          }

          v6 = v33 + 1;
        }
        while (v33 + 1 != v32);
        v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v50, 16);
      }
      while (v32);
    }

    v3 = v29;
  }

  return 1;
}

void __73__BRCClientZone_BRCZoneReset___removeTargetedAliasesWithCompletionBlock___block_invoke_8(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  uint64_t v7;
  void *v8;
  int32_t v9;
  void *v10;
  NSObject *v11;
  int *v12;
  char *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  int64_t v17;
  unint64_t v18;
  dispatch_source_t v19;
  uint64_t v20;
  void *v21;
  NSObject *v22;
  dispatch_time_t v23;
  uint64_t v24;
  void *v25;
  NSObject *v26;
  _QWORD *v27;
  void *v28;
  void *v29;
  dispatch_block_t v30;
  void *v31;
  NSObject *v32;
  uint64_t v33;
  void *v34;
  NSObject *v35;
  void *v36;
  NSObject *v37;
  _QWORD v38[5];
  id v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint8_t buf[4];
  _BYTE v45[24];
  __int16 v46;
  void *v47;
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v41;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v41 != v5)
          objc_enumerationMutation(v2);
        v7 = objc_msgSend(*(id *)(*((_QWORD *)&v40 + 1) + 8 * i), "longLongValue");
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "volume");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "deviceID");

        if ((BRCUnlinkFileID(v9, v7) & 0x80000000) != 0)
        {
          brc_bread_crumbs();
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v11 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
          {
            v12 = __error();
            v13 = strerror(*v12);
            *(_DWORD *)buf = 67109890;
            *(_DWORD *)v45 = v9;
            *(_WORD *)&v45[4] = 2048;
            *(_QWORD *)&v45[6] = v7;
            *(_WORD *)&v45[14] = 2080;
            *(_QWORD *)&v45[16] = v13;
            v46 = 2112;
            v47 = v10;
            _os_log_impl(&dword_1CBD43000, v11, OS_LOG_TYPE_DEFAULT, "[WARNING] failed to unlink dev:%d fileID:%llu: %s%@", buf, 0x26u);
          }

        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
    }
    while (v4);
  }

  if ((unint64_t)objc_msgSend(*(id *)(a1 + 32), "count") >= *(_QWORD *)(a1 + 64))
  {
    v14 = *(_QWORD *)(a1 + 40);
    if (*(_QWORD *)(v14 + 296))
    {
      brc_bread_crumbs();
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_FAULT))
        __73__BRCClientZone_BRCZoneReset___removeTargetedAliasesWithCompletionBlock___block_invoke_8_cold_2();

      v14 = *(_QWORD *)(a1 + 40);
    }
    objc_msgSend(*(id *)(v14 + 8), "appLibraryAliasRemovalThrottle");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "zoneName");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = +[BRCThrottle throttleHashFormat:](BRCThrottle, "throttleHashFormat:", CFSTR("%@"), v16);

    v18 = objc_msgSend(v15, "nsecsToNextRetry:now:increment:", v17, brc_current_date_nsec(), 1);
    objc_msgSend(v15, "incrementRetryCount:", v17);
    if (v18 >= 0x7FFFFFFFFFFFFFFFLL)
    {
      brc_bread_crumbs();
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        v33 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)v45 = v33;
        *(_WORD *)&v45[8] = 2112;
        *(_QWORD *)&v45[10] = v31;
        _os_log_impl(&dword_1CBD43000, v32, OS_LOG_TYPE_DEFAULT, "[WARNING] giving up on resetting %@%@", buf, 0x16u);
      }

    }
    else
    {
      if (v18 <= 0xF4240)
        v18 = 1000000;
      if (*(_QWORD *)(*(_QWORD *)(a1 + 40) + 296))
      {
        brc_bread_crumbs();
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v37 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_FAULT))
          __63__BRCClientZone_BRCZoneReset__scheduleReset_completionHandler___block_invoke_cold_1();

      }
      v19 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, *(dispatch_queue_t *)(a1 + 48));
      v20 = *(_QWORD *)(a1 + 40);
      v21 = *(void **)(v20 + 296);
      *(_QWORD *)(v20 + 296) = v19;

      v22 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 296);
      v23 = dispatch_time(0, v18);
      dispatch_source_set_timer(v22, v23, 0xFFFFFFFFFFFFFFFFLL, 0);
      v24 = *(_QWORD *)(a1 + 40);
      v25 = *(void **)(v24 + 296);
      v38[0] = MEMORY[0x1E0C809B0];
      v38[1] = 3221225472;
      v38[2] = __73__BRCClientZone_BRCZoneReset___removeTargetedAliasesWithCompletionBlock___block_invoke_11;
      v38[3] = &unk_1E875EAA8;
      v38[4] = v24;
      v39 = *(id *)(a1 + 56);
      v26 = v25;
      v27 = v38;
      v28 = v27;
      v29 = v27;
      if (*MEMORY[0x1E0D11070])
      {
        ((void (*)(_QWORD *))*MEMORY[0x1E0D11070])(v27);
        v29 = (void *)objc_claimAutoreleasedReturnValue();

      }
      v30 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_UTILITY, 0, v29);
      dispatch_source_set_event_handler(v26, v30);

      dispatch_resume(*(dispatch_object_t *)(*(_QWORD *)(a1 + 40) + 296));
    }

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
}

uint64_t __73__BRCClientZone_BRCZoneReset___removeTargetedAliasesWithCompletionBlock___block_invoke_11(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 296);
  *(_QWORD *)(v2 + 296) = 0;

  return objc_msgSend(*(id *)(a1 + 32), "_removeTargetedAliasesWithCompletionBlock:", *(_QWORD *)(a1 + 40));
}

- (void)_resetAndDeleteServerTruthData
{
  BRCAccountSession *v3;
  void *v4;
  NSObject *v5;
  BRCAccountSession *v6;
  _QWORD block[5];
  BRCAccountSession *v8;

  v3 = self->_session;
  -[BRCServerZone db](self->_serverZone, "db");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "serialQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61__BRCClientZone_BRCZoneReset___resetAndDeleteServerTruthData__block_invoke;
  block[3] = &unk_1E875D470;
  block[4] = self;
  v8 = v3;
  v6 = v3;
  dispatch_sync(v5, block);

}

void __61__BRCClientZone_BRCZoneReset___resetAndDeleteServerTruthData__block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;

  brc_bread_crumbs();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    __61__BRCClientZone_BRCZoneReset___resetAndDeleteServerTruthData__block_invoke_cold_1();

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "resetServerTruth");
  objc_msgSend(*(id *)(a1 + 40), "stageRegistry");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeDatabaseObjectsForZone:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));

}

- (void)_deleteJobsMatchingServerZone
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[BRCAccountSession(LegacyAdditions) fsReader](self->_session, "fsReader");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "deleteJobsMatching:", self->_serverZone);

  -[BRCAccountSession applyScheduler](self->_session, "applyScheduler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "deleteNonRejectionJobsForZone:", self->_serverZone);

  -[BRCAccountSession fsUploader](self->_session, "fsUploader");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "deleteJobsMatching:", self->_serverZone);

  -[BRCAccountSession fsDownloader](self->_session, "fsDownloader");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "deleteJobsMatching:", self->_serverZone);

  -[BRCAccountSession syncUpScheduler](self->_session, "syncUpScheduler");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "deleteJobsMatching:", self->_serverZone);

}

- (void)_handleSoftResetOfLocalItem:(id)a3 wantsUnlink:(BOOL)a4
{
  _BOOL8 v4;
  id v5;
  int v6;
  void *v7;
  char v8;
  void *v9;
  NSObject *v10;
  void *v11;
  int v12;
  id v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v4 = a4;
  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "resetWhileKeepingClientItemsAndWantsUnlink:", v4);
  v6 = objc_msgSend(v5, "isFault");
  if ((v4 || v6)
    && (objc_msgSend(v5, "itemID"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "isDocumentsFolder"),
        v7,
        (v8 & 1) == 0))
  {
    objc_msgSend(v5, "markForceRejected");
    if (objc_msgSend(v5, "isSharedToMeTopLevelItem")
      && objc_msgSend(v5, "isDead")
      && (objc_msgSend(v5, "localDiffs") & 8) != 0)
    {
      brc_bread_crumbs();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v12 = 138412546;
        v13 = v5;
        v14 = 2112;
        v15 = v9;
        _os_log_impl(&dword_1CBD43000, v10, OS_LOG_TYPE_DEFAULT, "[WARNING] Found a top level item that still needs to delete its alias %@.  Inserting a tombstone%@", (uint8_t *)&v12, 0x16u);
      }

      objc_msgSend(v5, "asSharedToMeTopLevelItem");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "insertTombstoneAliasRecordInZone:", 0);

    }
  }
  else
  {
    if (objc_msgSend(v5, "isLive"))
      objc_msgSend(v5, "markLostClearGenerationID:backoffMode:", 0, 0);
    objc_msgSend(v5, "markForceNeedsSyncUp");
  }
  objc_msgSend(v5, "saveToDB");

}

- (void)_performSoftResetOnItems:(id)a3 wantsUnlink:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v4 = a4;
  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void *)objc_opt_new();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v12);
        v14 = (void *)MEMORY[0x1D17A6BE8](v9);
        if ((objc_msgSend(v7, "containsIndex:", objc_msgSend(v13, "dbRowID", (_QWORD)v15)) & 1) == 0)
        {
          objc_msgSend(v7, "addIndex:", objc_msgSend(v13, "dbRowID"));
          -[BRCClientZone _handleSoftResetOfLocalItem:wantsUnlink:](self, "_handleSoftResetOfLocalItem:wantsUnlink:", v13, v4);
        }
        objc_autoreleasePoolPop(v14);
        ++v12;
      }
      while (v10 != v12);
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      v10 = v9;
    }
    while (v9);
  }

}

- (void)_postSoftResetHandlingAndWantsUnlink:(BOOL)a3 completionBlock:(id)a4
{
  _BOOL4 v4;
  void (**v6)(_QWORD);
  void *v7;
  _QWORD v8[5];
  void (**v9)(_QWORD);

  v4 = a3;
  v6 = (void (**)(_QWORD))a4;
  -[BRCAccountSession resetQueue](self->_session, "resetQueue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __84__BRCClientZone_BRCZoneReset___postSoftResetHandlingAndWantsUnlink_completionBlock___block_invoke;
    v8[3] = &unk_1E875EAA8;
    v8[4] = self;
    v9 = v6;
    dispatch_async_with_logs_5(v7, v8);

  }
  else
  {
    v6[2](v6);
  }

}

uint64_t __84__BRCClientZone_BRCZoneReset___postSoftResetHandlingAndWantsUnlink_completionBlock___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_removeTargetedAliasesWithCompletionBlock:", *(_QWORD *)(a1 + 40));
}

- (BOOL)_deleteRelevantPackageItemsWithDB:(id)a3 error:(id *)a4
{
  id v6;
  char v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  const char *v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = objc_msgSend(v6, "executeWithSlowStatementRadar:sql:", CFSTR("<rdar://problem/23829401>"), CFSTR("DELETE FROM client_pkg_items WHERE item_doc_id IN (SELECT item_doc_id FROM client_items WHERE zone_rowid = %@ AND +item_type = 1 AND  HEX(SUBSTR(version_content_signature, 1, 1)) = '1B')"), self->_dbRowID);
  if ((v7 & 1) == 0)
  {
    brc_bread_crumbs();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, (os_log_type_t)0x90u))
      -[BRCClientZone(BRCZoneReset) _deleteRelevantPackageItemsWithDB:error:].cold.1();

    objc_msgSend(v6, "lastError");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      brc_bread_crumbs();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, (os_log_type_t)0x90u))
      {
        v14 = "(passed to caller)";
        *(_DWORD *)buf = 136315906;
        v16 = "-[BRCClientZone(BRCZoneReset) _deleteRelevantPackageItemsWithDB:error:]";
        v17 = 2080;
        if (!a4)
          v14 = "(ignored by caller)";
        v18 = v14;
        v19 = 2112;
        v20 = v10;
        v21 = 2112;
        v22 = v11;
        _os_log_error_impl(&dword_1CBD43000, v12, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
      }

    }
    if (a4)
      *a4 = objc_retainAutorelease(v10);

  }
  return v7;
}

- (BOOL)_performHardResetOnClientItemsAndWantsUnlink:(BOOL)a3 db:(id)a4 error:(id *)a5
{
  id v7;
  BOOL v8;
  void *v9;
  NSObject *v10;
  id v11;
  void *v12;
  NSObject *v13;
  const char *v14;
  void *v15;
  NSObject *v16;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  id v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  if (!-[BRCClientZone _deleteRelevantPackageItemsWithDB:error:](self, "_deleteRelevantPackageItemsWithDB:error:", v7, a5))
  {
LABEL_20:
    v8 = 0;
    goto LABEL_21;
  }
  if ((objc_msgSend(v7, "execute:", CFSTR("DELETE FROM client_items WHERE zone_rowid = %@"), self->_dbRowID) & 1) == 0)
  {
    brc_bread_crumbs();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, (os_log_type_t)0x90u))
      -[BRCClientZone(BRCZoneReset) _performHardResetOnClientItemsAndWantsUnlink:db:error:].cold.2();

    objc_msgSend(v7, "lastError");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    if (!v11)
      goto LABEL_17;
    brc_bread_crumbs();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v13, (os_log_type_t)0x90u))
      goto LABEL_16;
    v14 = "(passed to caller)";
    *(_DWORD *)buf = 136315906;
    v19 = "-[BRCClientZone(BRCZoneReset) _performHardResetOnClientItemsAndWantsUnlink:db:error:]";
    v20 = 2080;
    if (!a5)
      v14 = "(ignored by caller)";
    goto LABEL_24;
  }
  if ((objc_msgSend(v7, "executeWithSlowStatementRadar:sql:", CFSTR("<rdar://problem//26848061>"), CFSTR("DELETE FROM client_document_access WHERE item_rowid in (SELECT rowid FROM client_items WHERE zone_rowid = %@)"), self->_dbRowID) & 1) == 0)
  {
    brc_bread_crumbs();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, (os_log_type_t)0x90u))
      -[BRCClientZone(BRCZoneReset) _performHardResetOnClientItemsAndWantsUnlink:db:error:].cold.1();

    objc_msgSend(v7, "lastError");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    if (!v11)
      goto LABEL_17;
    brc_bread_crumbs();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v13, (os_log_type_t)0x90u))
    {
LABEL_16:

LABEL_17:
      if (a5)
      {
        v11 = objc_retainAutorelease(v11);
        *a5 = v11;
      }

      goto LABEL_20;
    }
    v14 = "(passed to caller)";
    *(_DWORD *)buf = 136315906;
    v19 = "-[BRCClientZone(BRCZoneReset) _performHardResetOnClientItemsAndWantsUnlink:db:error:]";
    v20 = 2080;
    if (!a5)
      v14 = "(ignored by caller)";
LABEL_24:
    v21 = v14;
    v22 = 2112;
    v23 = v11;
    v24 = 2112;
    v25 = v12;
    _os_log_error_impl(&dword_1CBD43000, v13, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
    goto LABEL_16;
  }
  v8 = 1;
LABEL_21:

  return v8;
}

- (BOOL)_postHardResetHandlingWithDB:(id)a3 completionBlock:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  BOOL v31;
  void *v32;
  void *v33;
  NSObject *v34;
  const char *v36;
  _QWORD v37[5];
  id v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  uint8_t v48[128];
  uint8_t buf[4];
  const char *v50;
  __int16 v51;
  const char *v52;
  __int16 v53;
  void *v54;
  __int16 v55;
  void *v56;
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (!-[BRCClientZone isPrivateZone](self, "isPrivateZone"))
  {
LABEL_14:
    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    -[BRCClientZone itemsParentedToThisZoneButLivingInAnOtherZone](self, "itemsParentedToThisZoneButLivingInAnOtherZone");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
    if (v22)
    {
      v23 = v22;
      v24 = *(_QWORD *)v40;
      do
      {
        for (i = 0; i != v23; ++i)
        {
          if (*(_QWORD *)v40 != v24)
            objc_enumerationMutation(v21);
          v26 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
          v27 = (void *)MEMORY[0x1D17A6BE8]();
          objc_msgSend(v26, "appLibrary");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "clearStateBits:", 0x40000);

          if (objc_msgSend(v26, "isLive"))
          {
            objc_msgSend(v26, "markLostClearGenerationID:backoffMode:", 0, 0);
            objc_msgSend(v26, "saveToDB");
          }
          objc_autoreleasePoolPop(v27);
        }
        v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
      }
      while (v23);
    }

    -[BRCAccountSession resetQueue](self->_session, "resetQueue");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v37[0] = MEMORY[0x1E0C809B0];
    v37[1] = 3221225472;
    v37[2] = __82__BRCClientZone_BRCZoneReset___postHardResetHandlingWithDB_completionBlock_error___block_invoke;
    v37[3] = &unk_1E875EAA8;
    v37[4] = self;
    v38 = v9;
    dispatch_async_with_logs_5(v29, v37);

    if (-[BRCClientZone isPrivateZone](self, "isPrivateZone"))
    {
      -[BRCClientZone asPrivateClientZone](self, "asPrivateClientZone");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "clearProblemReport");

    }
    v31 = 1;
    goto LABEL_32;
  }
  -[BRCClientZone asPrivateClientZone](self, "asPrivateClientZone");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "defaultAppLibrary");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "documentsFolderItemID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCClientZone dbRowID](self, "dbRowID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v8, "executeWithSlowStatementRadar:sql:", CFSTR("<rdar://problem//26848061>"), CFSTR("UPDATE client_items SET item_parent_id = %@ WHERE item_parent_zone_rowid != zone_rowid AND item_parent_zone_rowid = %@"), v12, v13);

  if ((v14 & 1) != 0)
  {
    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v44 = 0u;
    objc_msgSend(v10, "appLibraries");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v44;
      do
      {
        for (j = 0; j != v17; ++j)
        {
          if (*(_QWORD *)v44 != v18)
            objc_enumerationMutation(v15);
          v20 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * j);
          objc_msgSend(v20, "setStateBits:", 1310720);
          objc_msgSend(v20, "clearStateBits:", 4);
          -[BRCAccountSession saveAppLibraryToDB:](self->_session, "saveAppLibraryToDB:", v20);
          if ((objc_msgSend(v20, "includesDataScope") & 1) != 0)
            objc_msgSend(v20, "recreateDocumentsFolderIfNeededOnDisk");
          else
            -[BRCClientZone _mkdirAppLibraryIfNeeded:](self, "_mkdirAppLibraryIfNeeded:", v20);
        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
      }
      while (v17);
    }

    goto LABEL_14;
  }
  objc_msgSend(v8, "lastError");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  if (v32)
  {
    brc_bread_crumbs();
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, (os_log_type_t)0x90u))
    {
      v36 = "(passed to caller)";
      *(_DWORD *)buf = 136315906;
      v50 = "-[BRCClientZone(BRCZoneReset) _postHardResetHandlingWithDB:completionBlock:error:]";
      v51 = 2080;
      if (!a5)
        v36 = "(ignored by caller)";
      v52 = v36;
      v53 = 2112;
      v54 = v32;
      v55 = 2112;
      v56 = v33;
      _os_log_error_impl(&dword_1CBD43000, v34, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
    }

  }
  if (a5)
    *a5 = objc_retainAutorelease(v32);

  v31 = 0;
LABEL_32:

  return v31;
}

uint64_t __82__BRCClientZone_BRCZoneReset___postHardResetHandlingWithDB_completionBlock_error___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_removeTargetedAliasesWithCompletionBlock:", *(_QWORD *)(a1 + 40));
}

- (void)_performResetAndWantsUnlink:(BOOL)a3 clientTruthBlock:(id)a4 completionBlock:(id)a5
{
  _BOOL4 v6;
  id v8;
  id v9;
  BRCAccountSession *v10;
  NSObject *v11;
  NSObject *v12;
  id v13;
  id v14;
  void *v15;
  NSObject *v16;
  _QWORD v17[5];
  id v18;
  id v19;
  BOOL v20;

  v6 = a3;
  v8 = a4;
  v9 = a5;
  v10 = self->_session;
  -[BRCAccountSession resetQueue](v10, "resetQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v11);
  if (v6 && !-[BRCClientZone isSharedZone](self, "isSharedZone"))
  {
    brc_bread_crumbs();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
      -[BRCClientZone(BRCZoneReset) _performResetAndWantsUnlink:clientTruthBlock:completionBlock:].cold.1();

  }
  -[BRCClientZone _resetAndDeleteServerTruthData](self, "_resetAndDeleteServerTruthData");
  -[BRCPQLConnection serialQueue](self->_db, "serialQueue");
  v12 = objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __92__BRCClientZone_BRCZoneReset___performResetAndWantsUnlink_clientTruthBlock_completionBlock___block_invoke;
  v17[3] = &unk_1E8760D50;
  v17[4] = self;
  v18 = v8;
  v20 = v6;
  v19 = v9;
  v13 = v9;
  v14 = v8;
  dispatch_sync(v12, v17);

}

void __92__BRCClientZone_BRCZoneReset___performResetAndWantsUnlink_clientTruthBlock_completionBlock___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  _QWORD v5[5];
  id v6;
  id v7;
  char v8;

  v2 = *(void **)(a1 + 40);
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 64);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[2] = __92__BRCClientZone_BRCZoneReset___performResetAndWantsUnlink_clientTruthBlock_completionBlock___block_invoke_2;
  v5[3] = &unk_1E8760D28;
  v5[1] = 3221225472;
  v4 = v2;
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v4;
  v8 = *(_BYTE *)(a1 + 56);
  v7 = *(id *)(a1 + 48);
  objc_msgSend(v3, "performWithFlags:action:", 46, v5);

}

uint64_t __92__BRCClientZone_BRCZoneReset___performResetAndWantsUnlink_clientTruthBlock_completionBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  char v13;
  id v14;
  void *v15;
  uint64_t v16;
  char v17;
  id v18;
  uint64_t v19;
  void *v20;
  NSObject *v21;
  id v23;
  id v24;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 40);
  if (v4)
    (*(void (**)(void))(v4 + 16))();
  objc_msgSend(*(id *)(a1 + 32), "_deleteJobsMatchingServerZone");
  brc_bread_crumbs();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    __92__BRCClientZone_BRCZoneReset___performResetAndWantsUnlink_clientTruthBlock_completionBlock___block_invoke_2_cold_4();

  if (objc_msgSend(*(id *)(a1 + 32), "supportsKeepingClientItemsDuringReset"))
  {
    brc_bread_crumbs();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      __92__BRCClientZone_BRCZoneReset___performResetAndWantsUnlink_clientTruthBlock_completionBlock___block_invoke_2_cold_1();

    v9 = *(void **)(a1 + 32);
    objc_msgSend(v9, "_getRelevantClientTruthItemEnumerator");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_performSoftResetOnItems:wantsUnlink:", v10, *(unsigned __int8 *)(a1 + 56));

    objc_msgSend(*(id *)(a1 + 32), "_postSoftResetHandlingAndWantsUnlink:completionBlock:", *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 48));
    goto LABEL_12;
  }
  v11 = *(void **)(a1 + 32);
  v12 = *(unsigned __int8 *)(a1 + 56);
  v24 = 0;
  v13 = objc_msgSend(v11, "_performHardResetOnClientItemsAndWantsUnlink:db:error:", v12, v3, &v24);
  v14 = v24;
  if ((v13 & 1) == 0)
  {
    brc_bread_crumbs();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, (os_log_type_t)0x90u))
      __92__BRCClientZone_BRCZoneReset___performResetAndWantsUnlink_clientTruthBlock_completionBlock___block_invoke_2_cold_3((uint64_t)v14);
    goto LABEL_18;
  }
  v15 = *(void **)(a1 + 32);
  v16 = *(_QWORD *)(a1 + 48);
  v23 = v14;
  v17 = objc_msgSend(v15, "_postHardResetHandlingWithDB:completionBlock:error:", v3, v16, &v23);
  v18 = v23;

  if ((v17 & 1) == 0)
  {
    brc_bread_crumbs();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, (os_log_type_t)0x90u))
      __92__BRCClientZone_BRCZoneReset___performResetAndWantsUnlink_clientTruthBlock_completionBlock___block_invoke_2_cold_2((uint64_t)v18);
    v14 = v18;
LABEL_18:

    v19 = 0;
    goto LABEL_19;
  }

LABEL_12:
  v19 = 1;
LABEL_19:

  return v19;
}

- (void)_performAfterResetServerAndClientPrivateTruthsAndUnlinkData:(id)a3
{
  NSObject *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  id v24;
  id v25;
  id v26;
  id v27;
  void *v28;
  void *v29;
  id v30;
  BRCClientZone *v31;
  id v32;
  NSObject *v33;
  void *v34;
  _QWORD v35[4];
  id v36;
  BRCClientZone *v37;
  id v38;
  id v39;
  id v40;
  __int128 v41;
  uint64_t v42;
  __int128 v43;
  uint64_t v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE buf[24];
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v30 = a3;
  -[BRCAccountSession resetQueue](self->_session, "resetQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);
  v5 = objc_alloc_init(MEMORY[0x1E0CB3600]);
  v32 = objc_alloc_init(MEMORY[0x1E0CB3828]);
  v33 = v4;
  objc_msgSend(v32, "setUnderlyingQueue:", v4);
  v29 = v5;
  objc_msgSend(v5, "setPurposeIdentifier:", CFSTR("com.apple.bird"));
  v34 = (void *)objc_opt_new();
  if (-[BRCClientZone isPrivateZone](self, "isPrivateZone"))
  {
    -[BRCClientZone asPrivateClientZone](self, "asPrivateClientZone");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appLibraries");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "allObjects");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = (void *)MEMORY[0x1E0C9AA60];
  }
  v31 = self;
  if (-[BRCClientZone isPrivateZone](self, "isPrivateZone"))
  {
    -[BRCClientZone asPrivateClientZone](self, "asPrivateClientZone");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "appLibraryIDs");
    v28 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v47 = 0u;
  v48 = 0u;
  v46 = 0u;
  v45 = 0u;
  v10 = v8;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
  v12 = v34;
  if (v11)
  {
    v13 = v11;
    v14 = *(_QWORD *)v46;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v46 != v14)
          objc_enumerationMutation(v10);
        v16 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * i);
        objc_msgSend(v16, "url");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (v17)
        {
          objc_msgSend(MEMORY[0x1E0CB35F8], "writingIntentWithURL:options:", v17, 1);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "addObject:", v18);
          brc_bread_crumbs();
          v19 = objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(v17, "path");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            *(_QWORD *)&buf[4] = v21;
            *(_WORD *)&buf[12] = 2112;
            *(_QWORD *)&buf[14] = v19;
            _os_log_debug_impl(&dword_1CBD43000, v20, OS_LOG_TYPE_DEBUG, "[DEBUG] requesting coordinated deletion at '%@'%@", buf, 0x16u);

            v12 = v34;
          }

        }
        else
        {
          brc_bread_crumbs();
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            *(_QWORD *)&buf[4] = v16;
            *(_WORD *)&buf[12] = 2112;
            *(_QWORD *)&buf[14] = v18;
            _os_log_impl(&dword_1CBD43000, v19, OS_LOG_TYPE_DEFAULT, "[WARNING] Ignoring delete of app library with no URL %@%@", buf, 0x16u);
          }
        }

      }
      v13 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
    }
    while (v13);
  }

  v43 = 0uLL;
  v44 = 0;
  __brc_create_section(0, (uint64_t)"-[BRCClientZone(BRCZoneReset) _performAfterResetServerAndClientPrivateTruthsAndUnlinkData:]", 629, &v43);
  brc_bread_crumbs();
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    -[BRCClientZone(BRCZoneReset) _performAfterResetServerAndClientPrivateTruthsAndUnlinkData:].cold.1();

  *(_QWORD *)&buf[16] = v44;
  *(_OWORD *)buf = v43;
  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v35[2] = __91__BRCClientZone_BRCZoneReset___performAfterResetServerAndClientPrivateTruthsAndUnlinkData___block_invoke;
  v35[3] = &unk_1E8760DC8;
  v41 = v43;
  v42 = v44;
  v36 = v29;
  v37 = v31;
  v38 = v34;
  v39 = v28;
  v40 = v30;
  v24 = v30;
  v25 = v28;
  v26 = v34;
  v27 = v29;
  objc_msgSend(v27, "coordinateAccessWithIntents:queue:byAccessor:", v26, v32, v35);

}

void __91__BRCClientZone_BRCZoneReset___performAfterResetServerAndClientPrivateTruthsAndUnlinkData___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  NSObject *v14;
  id v15;
  id v16;
  id v17;
  __int128 v18;
  uint64_t v19;
  __int128 v20;
  uint64_t v21;

  v3 = a2;
  v20 = *(_OWORD *)(a1 + 72);
  v21 = *(_QWORD *)(a1 + 88);
  brc_bread_crumbs();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    __91__BRCClientZone_BRCZoneReset___performAfterResetServerAndClientPrivateTruthsAndUnlinkData___block_invoke_cold_2();

  if (v3)
  {
    brc_bread_crumbs();
    v6 = (id)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, (os_log_type_t)0x90u))
      __91__BRCClientZone_BRCZoneReset___performAfterResetServerAndClientPrivateTruthsAndUnlinkData___block_invoke_cold_1((uint64_t)v3);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "retainAccess");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *(id *)(*(_QWORD *)(a1 + 40) + 8);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __91__BRCClientZone_BRCZoneReset___performAfterResetServerAndClientPrivateTruthsAndUnlinkData___block_invoke_37;
    v11[3] = &unk_1E8760DA0;
    v10 = *(void **)(a1 + 48);
    v12 = *(id *)(a1 + 40);
    v13 = v10;
    v7 = v9;
    v14 = v7;
    v15 = *(id *)(a1 + 56);
    v18 = *(_OWORD *)(a1 + 72);
    v19 = *(_QWORD *)(a1 + 88);
    v16 = *(id *)(a1 + 32);
    v6 = v8;
    v17 = v6;
    objc_msgSend(v12, "_performResetAndWantsUnlink:clientTruthBlock:completionBlock:", 0, v11, *(_QWORD *)(a1 + 64));

  }
  __brc_leave_section((uint64_t *)&v20);

}

void __91__BRCClientZone_BRCZoneReset___performAfterResetServerAndClientPrivateTruthsAndUnlinkData___block_invoke_37(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  _QWORD v22[5];
  id v23;
  id v24;
  __int128 v25;
  uint64_t v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  brc_bread_crumbs();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    __91__BRCClientZone_BRCZoneReset___performAfterResetServerAndClientPrivateTruthsAndUnlinkData___block_invoke_37_cold_1();

  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v4 = *(id *)(a1 + 40);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v32;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v32 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * v8);
        objc_msgSend(*(id *)(a1 + 48), "diskReclaimer");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "URL");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "path");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "renameAndUnlinkInBackgroundItemAt:path:", 0xFFFFFFFFLL, v12);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    }
    while (v6);
  }

  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v13 = *(id *)(a1 + 40);
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v28;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v28 != v16)
          objc_enumerationMutation(v13);
        v18 = (void *)MEMORY[0x1E0CB3600];
        objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * v17), "URL");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "__itemAtURL:didDisappearWithPurposeID:", v19, CFSTR("com.apple.bird"));

        ++v17;
      }
      while (v15 != v17);
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
    }
    while (v15);
  }

  objc_msgSend(*(id *)(a1 + 48), "notificationManager");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __91__BRCClientZone_BRCZoneReset___performAfterResetServerAndClientPrivateTruthsAndUnlinkData___block_invoke_38;
  v22[3] = &unk_1E8760D78;
  v25 = *(_OWORD *)(a1 + 80);
  v26 = *(_QWORD *)(a1 + 96);
  v22[4] = *(_QWORD *)(a1 + 32);
  v21 = *(_QWORD *)(a1 + 56);
  v23 = *(id *)(a1 + 64);
  v24 = *(id *)(a1 + 72);
  objc_msgSend(v20, "invalidatePipeReceiversWatchingAppLibraryIDs:completionBlock:", v21, v22);

}

void __91__BRCClientZone_BRCZoneReset___performAfterResetServerAndClientPrivateTruthsAndUnlinkData___block_invoke_38(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  uint8_t buf[4];
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = *(_OWORD *)(a1 + 56);
  v6 = *(_QWORD *)(a1 + 72);
  brc_bread_crumbs();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v4 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 134218498;
    v8 = v5;
    v9 = 2112;
    v10 = v4;
    v11 = 2112;
    v12 = v2;
    _os_log_debug_impl(&dword_1CBD43000, v3, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx disconnected NSMDQ listeners for %@%@", buf, 0x20u);
  }

  objc_msgSend(*(id *)(a1 + 40), "releaseAccess:", *(_QWORD *)(a1 + 48));
  __brc_leave_section((uint64_t *)&v5);
}

- (void)_performAfterResetServerAndClientSharedTruthsAndUnlinkData:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;

  v4 = a3;
  if (!-[BRCClientZone isSharedZone](self, "isSharedZone"))
  {
    brc_bread_crumbs();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      -[BRCClientZone(BRCZoneReset) _performResetAndWantsUnlink:clientTruthBlock:completionBlock:].cold.1();

  }
  -[BRCClientZone _performResetAndWantsUnlink:clientTruthBlock:completionBlock:](self, "_performResetAndWantsUnlink:clientTruthBlock:completionBlock:", 1, 0, v4);

}

- (void)_performAfterResetServerAndClientTruthsAndUnlinkData:(id)a3
{
  id v4;

  v4 = a3;
  if (-[BRCClientZone isSharedZone](self, "isSharedZone"))
    -[BRCClientZone _performAfterResetServerAndClientSharedTruthsAndUnlinkData:](self, "_performAfterResetServerAndClientSharedTruthsAndUnlinkData:", v4);
  else
    -[BRCClientZone _performAfterResetServerAndClientPrivateTruthsAndUnlinkData:](self, "_performAfterResetServerAndClientPrivateTruthsAndUnlinkData:", v4);

}

- (void)_performAfterResetServerAndClientTruthsAndUnlinkDataAndPurgeTheZone:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __99__BRCClientZone_BRCZoneReset___performAfterResetServerAndClientTruthsAndUnlinkDataAndPurgeTheZone___block_invoke;
  v6[3] = &unk_1E875EAA8;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[BRCClientZone _performAfterResetServerAndClientTruthsAndUnlinkData:](self, "_performAfterResetServerAndClientTruthsAndUnlinkData:", v6);

}

void __99__BRCClientZone_BRCZoneReset___performAfterResetServerAndClientTruthsAndUnlinkDataAndPurgeTheZone___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[5];
  id v5;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "assertOnQueue");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "resetQueue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __99__BRCClientZone_BRCZoneReset___performAfterResetServerAndClientTruthsAndUnlinkDataAndPurgeTheZone___block_invoke_2;
  v4[3] = &unk_1E875EAA8;
  v3 = *(void **)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  dispatch_async_with_logs_5(v2, v4);

}

void __99__BRCClientZone_BRCZoneReset___performAfterResetServerAndClientTruthsAndUnlinkDataAndPurgeTheZone___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  _QWORD v4[5];
  id v5;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  v3 = *(void **)(v1 + 16);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __99__BRCClientZone_BRCZoneReset___performAfterResetServerAndClientTruthsAndUnlinkDataAndPurgeTheZone___block_invoke_3;
  v4[3] = &unk_1E875EAA8;
  v4[4] = v1;
  v5 = v2;
  objc_msgSend(v3, "deleteAllContentsOnServerWithCompletionBlock:", v4);

}

void __99__BRCClientZone_BRCZoneReset___performAfterResetServerAndClientTruthsAndUnlinkDataAndPurgeTheZone___block_invoke_3(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  _QWORD v5[5];
  id v6;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "serialQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v2);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "serialQueue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __99__BRCClientZone_BRCZoneReset___performAfterResetServerAndClientTruthsAndUnlinkDataAndPurgeTheZone___block_invoke_4;
  v5[3] = &unk_1E875EAA8;
  v4 = *(void **)(a1 + 40);
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v4;
  dispatch_async_with_logs_5(v3, v5);

}

void __99__BRCClientZone_BRCZoneReset___performAfterResetServerAndClientTruthsAndUnlinkDataAndPurgeTheZone___block_invoke_4(uint64_t a1)
{
  void *v1;
  void *v2;
  _QWORD v3[4];
  id v4;

  v1 = *(void **)(a1 + 40);
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 64);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __99__BRCClientZone_BRCZoneReset___performAfterResetServerAndClientTruthsAndUnlinkDataAndPurgeTheZone___block_invoke_5;
  v3[3] = &unk_1E8760DF0;
  v4 = v1;
  objc_msgSend(v2, "performWithFlags:action:", 8, v3);

}

uint64_t __99__BRCClientZone_BRCZoneReset___performAfterResetServerAndClientTruthsAndUnlinkDataAndPurgeTheZone___block_invoke_5(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return 1;
}

- (id)_cancelAllOperationsForReset
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  BRCFetchRecentAndFavoriteDocumentsOperation *v26;
  void *v27;
  NSObject *v28;
  BRCSyncUpOperation *v29;
  void *v30;
  NSObject *v31;
  BRCSyncUpOperation *syncUpOperation;
  NSError *lastSyncUpError;
  BRCSyncDownOperation *v34;
  void *v35;
  NSObject *v36;
  BRCSyncDownOperation *syncDownOperation;
  NSError *lastSyncDownError;
  BRCFetchRecentAndFavoriteDocumentsOperation *v39;
  void *v40;
  NSObject *v41;
  BRCFetchRecentAndFavoriteDocumentsOperation *fetchRecentsOperation;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  BRCFetchRecentAndFavoriteDocumentsOperation *v48;
  void *v49;
  NSObject *v50;
  id *p_isa;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  BRCFetchRecentAndFavoriteDocumentsOperation *v55;
  uint64_t v56;
  uint64_t v57;
  BRCFetchRecentAndFavoriteDocumentsOperation *v58;
  void *v59;
  NSObject *v60;
  void *v61;
  uint64_t v62;
  uint64_t v63;
  BRCFetchRecentAndFavoriteDocumentsOperation *v64;
  uint64_t v65;
  uint64_t v66;
  BRCFetchRecentAndFavoriteDocumentsOperation *v67;
  void *v68;
  NSObject *v69;
  void *v70;
  uint64_t v71;
  uint64_t v72;
  BRCFetchRecentAndFavoriteDocumentsOperation *v73;
  uint64_t v74;
  uint64_t v75;
  BRCFetchRecentAndFavoriteDocumentsOperation *v76;
  void *v77;
  NSObject *v78;
  id v79;
  uint64_t v80;
  uint64_t v81;
  id v82;
  uint64_t v83;
  uint64_t v84;
  void *v85;
  BRCClientZone *v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  _BYTE v116[128];
  _BYTE v117[128];
  _BYTE v118[128];
  _BYTE v119[128];
  uint8_t v120[128];
  uint8_t buf[4];
  BRCFetchRecentAndFavoriteDocumentsOperation *v122;
  __int16 v123;
  void *v124;
  _BYTE v125[128];
  _BYTE v126[128];
  uint64_t v127;

  v127 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v87 = self;
  if (-[BRCClientZone isSharedZone](self, "isSharedZone"))
  {
    -[BRCClientZone serverZone](self, "serverZone");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "asSharedZone");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "transferSyncContext");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "uploadStream");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "operations");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObjectsFromArray:", v8);

    objc_msgSend(v6, "downloadStream");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "operations");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObjectsFromArray:", v10);

  }
  else
  {
    v114 = 0u;
    v115 = 0u;
    v112 = 0u;
    v113 = 0u;
    -[BRCClientZone asPrivateClientZone](self, "asPrivateClientZone");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "appLibraries");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v112, v126, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v113;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v113 != v14)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v112 + 1) + 8 * i), "transferSyncContext");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "uploadStream");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "operations");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "addObjectsFromArray:", v18);

          objc_msgSend(v16, "downloadStream");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "operations");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "addObjectsFromArray:", v20);

        }
        v13 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v112, v126, 16);
      }
      while (v13);
    }
  }

  v110 = 0u;
  v111 = 0u;
  v108 = 0u;
  v109 = 0u;
  v21 = v3;
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v108, v125, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v109;
    do
    {
      for (j = 0; j != v23; ++j)
      {
        if (*(_QWORD *)v109 != v24)
          objc_enumerationMutation(v21);
        v26 = *(BRCFetchRecentAndFavoriteDocumentsOperation **)(*((_QWORD *)&v108 + 1) + 8 * j);
        brc_bread_crumbs();
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412546;
          v122 = v26;
          v123 = 2112;
          v124 = v27;
          _os_log_debug_impl(&dword_1CBD43000, v28, OS_LOG_TYPE_DEBUG, "[DEBUG] Cancelling operation %@%@", buf, 0x16u);
        }

        -[_BRCOperation cancel](v26, "cancel");
      }
      v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v108, v125, 16);
    }
    while (v23);
  }

  v29 = v87->_syncUpOperation;
  if (v29)
  {
    brc_bread_crumbs();
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
      -[BRCClientZone(BRCZoneReset) _cancelAllOperationsForReset].cold.3((uint64_t)v29);

    objc_msgSend(v21, "addObject:", v29);
    -[_BRCOperation cancel](v29, "cancel");
  }
  syncUpOperation = v87->_syncUpOperation;
  v87->_syncUpOperation = 0;

  lastSyncUpError = v87->_lastSyncUpError;
  v87->_lastSyncUpError = 0;

  v34 = v87->_syncDownOperation;
  if (v34)
  {
    brc_bread_crumbs();
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
      -[BRCClientZone(BRCZoneReset) _cancelAllOperationsForReset].cold.2((uint64_t)v34);

    objc_msgSend(v21, "addObject:", v34);
    -[_BRCOperation cancel](v34, "cancel");
  }
  syncDownOperation = v87->_syncDownOperation;
  v87->_syncDownOperation = 0;

  lastSyncDownError = v87->_lastSyncDownError;
  v87->_lastSyncDownError = 0;

  v39 = v87->_fetchRecentsOperation;
  if (v39)
  {
    brc_bread_crumbs();
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v41 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
      -[BRCClientZone(BRCZoneReset) _cancelAllOperationsForReset].cold.1((uint64_t)v39);

    objc_msgSend(v21, "addObject:", v39);
    -[_BRCOperation cancel](v39, "cancel");
  }
  fetchRecentsOperation = v87->_fetchRecentsOperation;
  v87->_fetchRecentsOperation = 0;

  v106 = 0u;
  v107 = 0u;
  v104 = 0u;
  v105 = 0u;
  -[NSMutableDictionary allValues](v87->_locateRecordOperations, "allValues");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v104, v120, 16);
  if (v44)
  {
    v45 = v44;
    v46 = *(_QWORD *)v105;
    do
    {
      v47 = 0;
      v48 = v39;
      do
      {
        if (*(_QWORD *)v105 != v46)
          objc_enumerationMutation(v43);
        v39 = (BRCFetchRecentAndFavoriteDocumentsOperation *)*(id *)(*((_QWORD *)&v104 + 1) + 8 * v47);

        brc_bread_crumbs();
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v50 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v50, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412546;
          v122 = v39;
          v123 = 2112;
          v124 = v49;
          _os_log_debug_impl(&dword_1CBD43000, v50, OS_LOG_TYPE_DEBUG, "[DEBUG] Cancelling operation %@%@", buf, 0x16u);
        }

        objc_msgSend(v21, "addObject:", v39);
        -[_BRCOperation cancel](v39, "cancel");
        ++v47;
        v48 = v39;
      }
      while (v45 != v47);
      v45 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v104, v120, 16);
    }
    while (v45);
  }

  p_isa = (id *)&v87->super.isa;
  -[NSMutableDictionary removeAllObjects](v87->_locateRecordOperations, "removeAllObjects");
  v102 = 0u;
  v103 = 0u;
  v100 = 0u;
  v101 = 0u;
  -[NSMutableDictionary allValues](v87->_fetchParentOperations, "allValues");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v100, v119, 16);
  if (v53)
  {
    v54 = v53;
    v55 = 0;
    v56 = *(_QWORD *)v101;
    do
    {
      v57 = 0;
      v58 = v55;
      do
      {
        if (*(_QWORD *)v101 != v56)
          objc_enumerationMutation(v52);
        v55 = (BRCFetchRecentAndFavoriteDocumentsOperation *)*(id *)(*((_QWORD *)&v100 + 1) + 8 * v57);

        brc_bread_crumbs();
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v60 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v60, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412546;
          v122 = v55;
          v123 = 2112;
          v124 = v59;
          _os_log_debug_impl(&dword_1CBD43000, v60, OS_LOG_TYPE_DEBUG, "[DEBUG] Cancelling operation %@%@", buf, 0x16u);
        }

        objc_msgSend(v21, "addObject:", v55);
        -[_BRCOperation cancel](v55, "cancel");
        ++v57;
        v58 = v55;
      }
      while (v54 != v57);
      v54 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v100, v119, 16);
    }
    while (v54);

    p_isa = (id *)&v87->super.isa;
  }

  objc_msgSend(p_isa[27], "removeAllObjects");
  v98 = 0u;
  v99 = 0u;
  v96 = 0u;
  v97 = 0u;
  objc_msgSend(p_isa[26], "allValues");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = objc_msgSend(v61, "countByEnumeratingWithState:objects:count:", &v96, v118, 16);
  if (v62)
  {
    v63 = v62;
    v64 = 0;
    v65 = *(_QWORD *)v97;
    do
    {
      v66 = 0;
      v67 = v64;
      do
      {
        if (*(_QWORD *)v97 != v65)
          objc_enumerationMutation(v61);
        v64 = (BRCFetchRecentAndFavoriteDocumentsOperation *)*(id *)(*((_QWORD *)&v96 + 1) + 8 * v66);

        brc_bread_crumbs();
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v69 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v69, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412546;
          v122 = v64;
          v123 = 2112;
          v124 = v68;
          _os_log_debug_impl(&dword_1CBD43000, v69, OS_LOG_TYPE_DEBUG, "[DEBUG] Cancelling operation %@%@", buf, 0x16u);
        }

        objc_msgSend(v21, "addObject:", v64);
        -[_BRCOperation cancel](v64, "cancel");
        ++v66;
        v67 = v64;
      }
      while (v63 != v66);
      v63 = objc_msgSend(v61, "countByEnumeratingWithState:objects:count:", &v96, v118, 16);
    }
    while (v63);

    p_isa = (id *)&v87->super.isa;
  }

  objc_msgSend(p_isa[26], "removeAllObjects");
  v94 = 0u;
  v95 = 0u;
  v92 = 0u;
  v93 = 0u;
  objc_msgSend(p_isa[25], "allValues");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v71 = objc_msgSend(v70, "countByEnumeratingWithState:objects:count:", &v92, v117, 16);
  if (v71)
  {
    v72 = v71;
    v73 = 0;
    v74 = *(_QWORD *)v93;
    do
    {
      v75 = 0;
      v76 = v73;
      do
      {
        if (*(_QWORD *)v93 != v74)
          objc_enumerationMutation(v70);
        v73 = (BRCFetchRecentAndFavoriteDocumentsOperation *)*(id *)(*((_QWORD *)&v92 + 1) + 8 * v75);

        brc_bread_crumbs();
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v78 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v78, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412546;
          v122 = v73;
          v123 = 2112;
          v124 = v77;
          _os_log_debug_impl(&dword_1CBD43000, v78, OS_LOG_TYPE_DEBUG, "[DEBUG] Cancelling operation %@%@", buf, 0x16u);
        }

        objc_msgSend(v21, "addObject:", v73);
        -[_BRCOperation cancel](v73, "cancel");
        ++v75;
        v76 = v73;
      }
      while (v72 != v75);
      v72 = objc_msgSend(v70, "countByEnumeratingWithState:objects:count:", &v92, v117, 16);
    }
    while (v72);

    p_isa = (id *)&v87->super.isa;
  }

  objc_msgSend(p_isa[25], "removeAllObjects");
  v90 = 0u;
  v91 = 0u;
  v88 = 0u;
  v89 = 0u;
  v79 = p_isa[24];
  v80 = objc_msgSend(v79, "countByEnumeratingWithState:objects:count:", &v88, v116, 16);
  if (v80)
  {
    v81 = v80;
    v82 = 0;
    v83 = *(_QWORD *)v89;
    do
    {
      v84 = 0;
      v85 = v82;
      do
      {
        if (*(_QWORD *)v89 != v83)
          objc_enumerationMutation(v79);
        v82 = *(id *)(*((_QWORD *)&v88 + 1) + 8 * v84);

        objc_msgSend(v82, "schedule");
        ++v84;
        v85 = v82;
      }
      while (v81 != v84);
      v81 = objc_msgSend(v79, "countByEnumeratingWithState:objects:count:", &v88, v116, 16);
    }
    while (v81);

  }
  objc_msgSend(p_isa[24], "removeAllObjects");
  objc_msgSend(p_isa, "_removeAllShareAcceptanceBlocks");
  return v21;
}

- (void)_mkdirAppLibraryIfNeeded:(id)a3
{
  BRCAccountSession *session;
  id v4;
  void *v5;
  uint64_t v6;

  v6 = 0;
  session = self->_session;
  v4 = a3;
  objc_msgSend(v4, "mangledID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCAccountSession createAppLibraryOnDisk:createdRoot:createdDocuments:rootFileID:](session, "createAppLibraryOnDisk:createdRoot:createdDocuments:rootFileID:", v5, 0, 0, &v6);

  objc_msgSend(v4, "setRootFileID:", v6);
}

- (void)_finishedReset:(unint64_t)a3 completionHandler:(id)a4
{
  id v6;
  BRCClientZone *v7;
  void *v8;
  NSObject *v9;
  int v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  void *v24;
  BRCClientZone *v25;
  NSObject *v26;
  BRCClientZone *v27;
  NSObject *v28;
  NSObject *v29;
  NSObject *v30;
  _QWORD block[4];
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint64_t v41[3];
  _BYTE v42[128];
  uint8_t v43[128];
  uint8_t buf[4];
  uint64_t v45;
  __int16 v46;
  BRCClientZone *v47;
  __int16 v48;
  BRCClientZone *v49;
  __int16 v50;
  void *v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  -[BRCPQLConnection assertOnQueue](self->_db, "assertOnQueue");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("reset %s"), BRCPrettyPrintEnum());
  v7 = (BRCClientZone *)objc_claimAutoreleasedReturnValue();
  memset(v41, 0, sizeof(v41));
  __brc_create_section(0, (uint64_t)"-[BRCClientZone(BRCZoneReset) _finishedReset:completionHandler:]", 824, v41);
  brc_bread_crumbs();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218754;
    v45 = v41[0];
    v46 = 2112;
    v47 = v7;
    v48 = 2112;
    v49 = self;
    v50 = 2112;
    v51 = v8;
    _os_log_debug_impl(&dword_1CBD43000, v9, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx finishing %@ of %@%@", buf, 0x2Au);
  }

  v10 = !-[BRCClientZone isSharedZone](self, "isSharedZone");
  if (a3 < 3)
    LOBYTE(v10) = 1;
  if ((v10 & 1) == 0)
    -[BRCClientZone _flushIdleBlocksIfNeeded](self, "_flushIdleBlocksIfNeeded");
  -[BRCAccountSession recentsEnumerator](self->_session, "recentsEnumerator");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "dropIndexForClientZone:", self);

  if (a3 <= 2)
    v12 = 256;
  else
    v12 = 131328;
  -[BRCClientZone clearStateBits:](self, "clearStateBits:", v12);
  if (-[BRCClientZone isPrivateZone](self, "isPrivateZone"))
  {
    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    -[BRCClientZone asPrivateClientZone](self, "asPrivateClientZone");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "appLibraries");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
    if (v15)
    {
      v16 = *(_QWORD *)v38;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v38 != v16)
            objc_enumerationMutation(v14);
          v18 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
          objc_msgSend(v18, "clearStateBits:", 503316482);
          objc_msgSend(v18, "scheduleDeepScanWithReason:", v7);
        }
        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
      }
      while (v15);
    }

  }
  if ((-[BRCClientZone state](self, "state") & 0x20000) != 0)
  {
    brc_bread_crumbs();
    v27 = (BRCClientZone *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412802;
      v45 = (uint64_t)v7;
      v46 = 2112;
      v47 = self;
      v48 = 2112;
      v49 = v27;
      _os_log_debug_impl(&dword_1CBD43000, v28, OS_LOG_TYPE_DEBUG, "[DEBUG] finished %@ of %@ but we still need to delete data%@", buf, 0x20u);
    }

    -[BRCClientZone scheduleResetServerAndClientTruthsForReason:](self, "scheduleResetServerAndClientTruthsForReason:", CFSTR("still-wants-data-unlinked"));
  }
  else
  {
    -[BRCClientZone clearSyncStateBits:](self, "clearSyncStateBits:", 63);
    -[BRCClientZone setStateBits:](self, "setStateBits:", 16);
    -[BRCClientZone scheduleSyncDown](self, "scheduleSyncDown");
    if (-[BRCClientZone isPrivateZone](self, "isPrivateZone"))
    {
      v35 = 0u;
      v36 = 0u;
      v33 = 0u;
      v34 = 0u;
      -[BRCClientZone asPrivateClientZone](self, "asPrivateClientZone");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "appLibraries");
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v33, v42, 16);
      if (v21)
      {
        v22 = *(_QWORD *)v34;
        do
        {
          for (j = 0; j != v21; ++j)
          {
            if (*(_QWORD *)v34 != v22)
              objc_enumerationMutation(v20);
            v24 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * j);
            objc_msgSend(v24, "setStateBits:", 2048);
            objc_msgSend(v24, "clearStateBits:", 134217730);
            -[BRCAccountSession saveAppLibraryToDB:](self->_session, "saveAppLibraryToDB:", v24);
          }
          v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v33, v42, 16);
        }
        while (v21);
      }

    }
    brc_bread_crumbs();
    v25 = (BRCClientZone *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412802;
      v45 = (uint64_t)v7;
      v46 = 2112;
      v47 = self;
      v48 = 2112;
      v49 = v25;
      _os_log_debug_impl(&dword_1CBD43000, v26, OS_LOG_TYPE_DEBUG, "[DEBUG] finished %@ of %@%@", buf, 0x20u);
    }

  }
  -[BRCAccountSession saveClientZoneToDB:](self->_session, "saveClientZoneToDB:", self);
  v29 = dispatch_group_create();
  if (v6)
  {
    -[BRCPQLConnection serialQueue](self->_db, "serialQueue");
    v30 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __64__BRCClientZone_BRCZoneReset___finishedReset_completionHandler___block_invoke;
    block[3] = &unk_1E875FD48;
    v32 = v6;
    dispatch_group_notify(v29, v30, block);

  }
  __brc_leave_section(v41);

}

uint64_t __64__BRCClientZone_BRCZoneReset___finishedReset_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)ownerName
{
  return (id)*MEMORY[0x1E0C94730];
}

- (id)asPrivateClientZone
{
  void *v2;
  NSObject *v3;

  brc_bread_crumbs();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    -[BRCClientZone asPrivateClientZone].cold.1();

  return 0;
}

- (id)asSharedClientZone
{
  void *v2;
  NSObject *v3;

  brc_bread_crumbs();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    -[BRCClientZone asSharedClientZone].cold.1();

  return 0;
}

- (BRCItemID)rootItemID
{
  void *v2;
  NSObject *v3;

  brc_bread_crumbs();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    -[BRCClientZone rootItemID].cold.1();

  return 0;
}

- (BRMangledID)mangledID
{
  return self->_mangledID;
}

- (BOOL)isPrivateZone
{
  return 0;
}

- (BOOL)isSharedZone
{
  return 0;
}

- (unsigned)syncUpBatchSize
{
  void *v3;
  void *v4;
  unsigned int v5;
  float syncUpBatchSizeMultiplier;
  unsigned int v7;

  -[BRCClientZone mangledID](self, "mangledID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "maxRecordCountInModifyRecordsOperation");

  syncUpBatchSizeMultiplier = self->_syncUpBatchSizeMultiplier;
  v7 = (float)(syncUpBatchSizeMultiplier * (float)v5);
  if (syncUpBatchSizeMultiplier >= 1.0)
    v7 = v5;
  if (v7 <= 2)
    return 2;
  else
    return v7;
}

- (void)_decreaseSyncUpBatchSizeAfterError
{
  void *v3;
  void *v4;
  float v5;
  float v6;

  -[BRCClientZone mangledID](self, "mangledID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "modifyRecordsCountMultiplicativeDecrease");
  v6 = v5;

  self->_syncUpBatchSizeMultiplier = v6 * self->_syncUpBatchSizeMultiplier;
}

- (void)_increaseSyncUpBatchSizeAfterSuccess
{
  void *v3;
  void *v4;
  float v5;
  float v6;
  float v7;

  if (self->_syncUpBatchSizeMultiplier < 1.0)
  {
    -[BRCClientZone mangledID](self, "mangledID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "modifyRecordsCountAdditiveIncreaseFraction");
    v6 = v5;

    v7 = v6 + self->_syncUpBatchSizeMultiplier;
    if (v7 > 1.0)
      v7 = 1.0;
    self->_syncUpBatchSizeMultiplier = v7;
  }
}

- (void)setNeedsSave:(BOOL)a3
{
  void *v5;
  NSObject *v6;

  if (self->_needsSave != a3)
  {
    if (a3)
    {
      -[BRCPQLConnection forceBatchStart](self->_db, "forceBatchStart");
      brc_bread_crumbs();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
        -[BRCClientZone setNeedsSave:].cold.1((uint64_t)self);

    }
    self->_needsSave = a3;
  }
}

- (BOOL)enhancedDrivePrivacyEnabled
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  char v8;
  _BOOL4 v9;

  -[BRCClientZone mangledID](self, "mangledID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "supportsEnhancedDrivePrivacy");

  if (v5)
  {
    -[BRCClientZone mangledID](self, "mangledID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "enhancedDrivePrivacyForced");

    if ((v8 & 1) != 0)
      LOBYTE(v9) = 1;
    else
      return (-[BRCClientZone state](self, "state") >> 22) & 1;
  }
  else
  {
    LOBYTE(v9) = 0;
  }
  return v9;
}

- (BRCClientZone)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[BRCClientZone init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("Don't call %@."), v5);

  return 0;
}

- (BRCClientZone)initWithMangledID:(id)a3 dbRowID:(id)a4 plist:(id)a5 session:(id)a6 initialCreation:(BOOL)a7
{
  _BOOL4 v7;
  id v13;
  id v14;
  id v15;
  id v16;
  BRCClientZone *v17;
  BRCClientZone *v18;
  uint64_t v19;
  BRCPQLConnection *db;
  uint64_t v21;
  NSString *zoneName;
  uint64_t v23;
  NSString *ownerName;
  uint64_t v25;
  brc_task_tracker *taskTracker;
  NSMutableArray *v27;
  NSMutableArray *syncDownDependencies;
  NSMutableArray *v29;
  NSMutableArray *currentSyncDownBarriers;
  uint64_t v31;
  NSMutableArray *blockedOperationsOnInitialSync;
  uint64_t v33;
  NSMutableDictionary *runningListOperations;
  uint64_t v35;
  NSMutableDictionary *recursiveListOperations;
  uint64_t v37;
  NSMutableDictionary *fetchParentOperations;
  uint64_t v39;
  NSMutableDictionary *locateRecordOperations;
  uint64_t v41;
  NSMutableArray *directoriesCreatedLastSyncUp;
  void *v43;
  void *v44;
  BRCThrottle *v45;
  BRCThrottle *serverStitchingOperationThrottle;
  void *v47;
  void *v48;
  BRCThrottle *v49;
  BRCThrottle *locateRecordsOperationThrottle;
  uint64_t v51;
  CKOperationGroup *syncDownGroup;
  objc_super v54;

  v7 = a7;
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v54.receiver = self;
  v54.super_class = (Class)BRCClientZone;
  v17 = -[BRCClientZone init](&v54, sel_init);
  v18 = v17;
  if (v17)
  {
    v17->_isInitialCreation = v7;
    objc_msgSend(v16, "clientDB");
    v19 = objc_claimAutoreleasedReturnValue();
    db = v18->_db;
    v18->_db = (BRCPQLConnection *)v19;

    objc_storeStrong((id *)&v18->_dbRowID, a4);
    objc_storeStrong((id *)&v18->_session, a6);
    objc_storeStrong((id *)&v18->_mangledID, a3);
    objc_msgSend(v13, "appLibraryOrZoneName");
    v21 = objc_claimAutoreleasedReturnValue();
    zoneName = v18->_zoneName;
    v18->_zoneName = (NSString *)v21;

    objc_msgSend(v13, "ownerName");
    v23 = objc_claimAutoreleasedReturnValue();
    ownerName = v18->_ownerName;
    v18->_ownerName = (NSString *)v23;

    brc_task_tracker_create("zone-tracker");
    v25 = objc_claimAutoreleasedReturnValue();
    taskTracker = v18->_taskTracker;
    v18->_taskTracker = (brc_task_tracker *)v25;

    v27 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    syncDownDependencies = v18->_syncDownDependencies;
    v18->_syncDownDependencies = v27;

    v18->_shouldShowiCloudDriveAppInstallationNotification = 1;
    v18->_syncUpBatchSizeMultiplier = 1.0;
    v29 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    currentSyncDownBarriers = v18->_currentSyncDownBarriers;
    v18->_currentSyncDownBarriers = v29;

    v31 = objc_opt_new();
    blockedOperationsOnInitialSync = v18->_blockedOperationsOnInitialSync;
    v18->_blockedOperationsOnInitialSync = (NSMutableArray *)v31;

    v33 = objc_opt_new();
    runningListOperations = v18->_runningListOperations;
    v18->_runningListOperations = (NSMutableDictionary *)v33;

    v35 = objc_opt_new();
    recursiveListOperations = v18->_recursiveListOperations;
    v18->_recursiveListOperations = (NSMutableDictionary *)v35;

    v37 = objc_opt_new();
    fetchParentOperations = v18->_fetchParentOperations;
    v18->_fetchParentOperations = (NSMutableDictionary *)v37;

    v39 = objc_opt_new();
    locateRecordOperations = v18->_locateRecordOperations;
    v18->_locateRecordOperations = (NSMutableDictionary *)v39;

    v41 = objc_opt_new();
    directoriesCreatedLastSyncUp = v18->_directoriesCreatedLastSyncUp;
    v18->_directoriesCreatedLastSyncUp = (NSMutableArray *)v41;

    +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", v13);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "serverStitchingThrottleParams");
    v44 = (void *)objc_claimAutoreleasedReturnValue();

    v45 = -[BRCThrottle initWithName:andParameters:]([BRCThrottle alloc], "initWithName:andParameters:", CFSTR("server-stitching-throttle"), v44);
    serverStitchingOperationThrottle = v18->_serverStitchingOperationThrottle;
    v18->_serverStitchingOperationThrottle = v45;

    +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", v13);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "locateRecordsThrottleParams");
    v48 = (void *)objc_claimAutoreleasedReturnValue();

    v49 = -[BRCThrottle initWithName:andParameters:]([BRCThrottle alloc], "initWithName:andParameters:", CFSTR("locate-records-throttle"), v48);
    locateRecordsOperationThrottle = v18->_locateRecordsOperationThrottle;
    v18->_locateRecordsOperationThrottle = v49;

    if (v7)
    {
      objc_msgSend(MEMORY[0x1E0C94F88], "br_syncDownInitial");
      v51 = objc_claimAutoreleasedReturnValue();
      syncDownGroup = v18->_syncDownGroup;
      v18->_syncDownGroup = (CKOperationGroup *)v51;

      -[BRCClientZone setNeedsSave:](v18, "setNeedsSave:", 1);
    }
    else
    {
      -[BRCClientZone updateWithPlist:](v18, "updateWithPlist:", v15);
    }
    -[BRCClientZone _recreateSyncBudgetsAndThrottlesIfNeeded](v18, "_recreateSyncBudgetsAndThrottlesIfNeeded");

  }
  return v18;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  if (self->_hasWorkDidUpdateObserver)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeObserver:", self->_hasWorkDidUpdateObserver);

  }
  v4.receiver = self;
  v4.super_class = (Class)BRCClientZone;
  -[BRCClientZone dealloc](&v4, sel_dealloc);
}

- (NSMutableDictionary)plist
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSMutableIndexSet *appliedTombstoneRanks;
  BRCSyncOperationThrottle *syncUpThrottle;
  BRCSyncBudgetThrottle *syncUpBudget;
  BRCSyncOperationBackoffRatio *syncUpBackoffRatio;
  BRCSyncOperationThrottle *syncDownThrottle;
  NSDate *lastSyncDownDate;
  NSString *osNameRequiredToSync;
  CKOperationGroup *syncDownGroup;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 12);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_state);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("state"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_requestID);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("requestID"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_lastInsertedRank);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("lastApplyRank"));

  appliedTombstoneRanks = self->_appliedTombstoneRanks;
  if (appliedTombstoneRanks)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", appliedTombstoneRanks, CFSTR("appliedTombstoneRanks"));
  syncUpThrottle = self->_syncUpThrottle;
  if (syncUpThrottle)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", syncUpThrottle, CFSTR("syncUpThrottle"));
  syncUpBudget = self->_syncUpBudget;
  if (syncUpBudget)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", syncUpBudget, CFSTR("syncUpBudget"));
  syncUpBackoffRatio = self->_syncUpBackoffRatio;
  if (syncUpBackoffRatio)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", syncUpBackoffRatio, CFSTR("syncUpBackoffRatio"));
  syncDownThrottle = self->_syncDownThrottle;
  if (syncDownThrottle)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", syncDownThrottle, CFSTR("syncDownThrottle"));
  lastSyncDownDate = self->_lastSyncDownDate;
  if (lastSyncDownDate)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", lastSyncDownDate, CFSTR("lastSyncDownDate"));
  osNameRequiredToSync = self->_osNameRequiredToSync;
  if (osNameRequiredToSync)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", osNameRequiredToSync, CFSTR("osNameRequiredToSync"));
  syncDownGroup = self->_syncDownGroup;
  if (syncDownGroup)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", syncDownGroup, CFSTR("syncDownGroup"));
  return (NSMutableDictionary *)v3;
}

- (void)_recreateSyncBudgetsAndThrottlesIfNeeded
{
  BRCSyncOperationThrottle *v3;
  BRCSyncOperationThrottle *syncUpThrottle;
  BRCSyncOperationThrottle *v5;
  BRCSyncOperationThrottle *syncDownThrottle;
  BRCSyncBudgetThrottle *v7;
  BRCSyncBudgetThrottle *syncUpBudget;
  BRCSyncOperationBackoffRatio *v9;
  BRCSyncOperationBackoffRatio *syncUpBackoffRatio;

  if (!self->_syncUpThrottle)
  {
    v3 = -[BRCSyncOperationThrottle initWithMangledID:isSyncDown:]([BRCSyncOperationThrottle alloc], "initWithMangledID:isSyncDown:", self->_mangledID, 0);
    syncUpThrottle = self->_syncUpThrottle;
    self->_syncUpThrottle = v3;

    -[BRCClientZone setNeedsSave:](self, "setNeedsSave:", 1);
  }
  if (!self->_syncDownThrottle)
  {
    v5 = -[BRCSyncOperationThrottle initWithMangledID:isSyncDown:]([BRCSyncOperationThrottle alloc], "initWithMangledID:isSyncDown:", self->_mangledID, 1);
    syncDownThrottle = self->_syncDownThrottle;
    self->_syncDownThrottle = v5;

    -[BRCClientZone setNeedsSave:](self, "setNeedsSave:", 1);
  }
  if (!self->_syncUpBudget)
  {
    v7 = objc_alloc_init(BRCSyncBudgetThrottle);
    syncUpBudget = self->_syncUpBudget;
    self->_syncUpBudget = v7;

    -[BRCClientZone setNeedsSave:](self, "setNeedsSave:", 1);
  }
  if (!self->_syncUpBackoffRatio)
  {
    v9 = objc_alloc_init(BRCSyncOperationBackoffRatio);
    syncUpBackoffRatio = self->_syncUpBackoffRatio;
    self->_syncUpBackoffRatio = v9;

    -[BRCClientZone setNeedsSave:](self, "setNeedsSave:", 1);
  }
}

- (void)updateWithPlist:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSMutableIndexSet *v9;
  NSMutableIndexSet *appliedTombstoneRanks;
  BRCSyncOperationThrottle *v11;
  BRCSyncOperationThrottle *syncUpThrottle;
  BRCSyncBudgetThrottle *v13;
  BRCSyncBudgetThrottle *syncUpBudget;
  BRCSyncOperationBackoffRatio *v15;
  BRCSyncOperationBackoffRatio *syncUpBackoffRatio;
  BRCSyncOperationThrottle *v17;
  BRCSyncOperationThrottle *syncDownThrottle;
  NSDate *v19;
  NSDate *lastSyncDownDate;
  NSString *v21;
  NSString *osNameRequiredToSync;
  CKOperationGroup *v23;
  CKOperationGroup *syncDownGroup;
  BRCSyncOperationThrottle *v25;
  void *v26;
  NSObject *v27;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("state"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  self->_state = objc_msgSend(v5, "unsignedIntValue");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("requestID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  self->_requestID = objc_msgSend(v6, "unsignedLongLongValue");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("lastApplyRank"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  self->_lastInsertedRank = objc_msgSend(v7, "longLongValue");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("appliedTombstoneRanks"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (NSMutableIndexSet *)objc_msgSend(v8, "mutableCopy");
  appliedTombstoneRanks = self->_appliedTombstoneRanks;
  self->_appliedTombstoneRanks = v9;

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("syncUpThrottle"));
  v11 = (BRCSyncOperationThrottle *)objc_claimAutoreleasedReturnValue();
  syncUpThrottle = self->_syncUpThrottle;
  self->_syncUpThrottle = v11;

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("syncUpBudget"));
  v13 = (BRCSyncBudgetThrottle *)objc_claimAutoreleasedReturnValue();
  syncUpBudget = self->_syncUpBudget;
  self->_syncUpBudget = v13;

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("syncUpBackoffRatio"));
  v15 = (BRCSyncOperationBackoffRatio *)objc_claimAutoreleasedReturnValue();
  syncUpBackoffRatio = self->_syncUpBackoffRatio;
  self->_syncUpBackoffRatio = v15;

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("syncDownThrottle"));
  v17 = (BRCSyncOperationThrottle *)objc_claimAutoreleasedReturnValue();
  syncDownThrottle = self->_syncDownThrottle;
  self->_syncDownThrottle = v17;

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("lastSyncDownDate"));
  v19 = (NSDate *)objc_claimAutoreleasedReturnValue();
  lastSyncDownDate = self->_lastSyncDownDate;
  self->_lastSyncDownDate = v19;

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("osNameRequiredToSync"));
  v21 = (NSString *)objc_claimAutoreleasedReturnValue();
  osNameRequiredToSync = self->_osNameRequiredToSync;
  self->_osNameRequiredToSync = v21;

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("syncDownGroup"));
  v23 = (CKOperationGroup *)objc_claimAutoreleasedReturnValue();

  syncDownGroup = self->_syncDownGroup;
  self->_syncDownGroup = v23;

  if (!self->_syncUpBudget || (v25 = self->_syncUpThrottle) == 0 || !self->_syncDownThrottle)
  {
    brc_bread_crumbs();
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
      -[BRCClientZone updateWithPlist:].cold.1();

    v25 = self->_syncUpThrottle;
  }
  -[BRCSyncOperationThrottle setMangledID:](v25, "setMangledID:", self->_mangledID);
  -[BRCSyncOperationThrottle setMangledID:](self->_syncDownThrottle, "setMangledID:", self->_mangledID);
}

- (void)associateWithServerZone:(id)a3
{
  -[BRCClientZone associateWithServerZone:offline:](self, "associateWithServerZone:offline:", a3, 0);
}

- (void)associateWithServerZone:(id)a3 offline:(BOOL)a4
{
  _BOOL8 v4;
  BRCServerZone *v6;
  void *v7;
  NSObject *v8;
  BRCServerZone *serverZone;
  BRCServerZone *v10;
  int v11;
  BRCClientZone *v12;
  __int16 v13;
  BRCServerZone *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v4 = a4;
  v17 = *MEMORY[0x1E0C80C00];
  v6 = (BRCServerZone *)a3;
  brc_bread_crumbs();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v11 = 138412802;
    v12 = self;
    v13 = 2112;
    v14 = v6;
    v15 = 2112;
    v16 = v7;
    _os_log_debug_impl(&dword_1CBD43000, v8, OS_LOG_TYPE_DEBUG, "[DEBUG] associating %@ with %@%@", (uint8_t *)&v11, 0x20u);
  }

  serverZone = self->_serverZone;
  self->_serverZone = v6;
  v10 = v6;

  -[BRCServerZone activateWithClientZone:offline:](v10, "activateWithClientZone:offline:", self, v4);
  if (v4)
    self->_activated = 1;
}

- (void)resume
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: !_activated%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __23__BRCClientZone_resume__block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  v2 = (void *)MEMORY[0x1D17A6BE8]();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_startSync");

  objc_autoreleasePoolPop(v2);
}

uint64_t __23__BRCClientZone_resume__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "fetchRecentAndFavoriteDocuments");
}

- (void)close
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: _activated%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

uint64_t __22__BRCClientZone_close__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t k;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t m;
  void *v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t n;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _BYTE v57[128];
  _BYTE v58[128];
  _BYTE v59[128];
  _BYTE v60[128];
  _BYTE v61[128];
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 104));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "cancel");
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 128));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "cancel");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "deleteAllContentsOperation");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "cancel");
  if (objc_msgSend(*(id *)(a1 + 32), "isPrivateZone"))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "applyScheduler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "asPrivateClientZone");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stopMonitoringFaultingForZone:", v6);

  }
  v55 = 0u;
  v56 = 0u;
  v53 = 0u;
  v54 = 0u;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 208), "allValues");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v53, v61, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v54;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v54 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * i);
        objc_msgSend(v12, "cancel");
        objc_msgSend(*(id *)(a1 + 40), "addObject:", v12);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v53, v61, 16);
    }
    while (v9);
  }

  v51 = 0u;
  v52 = 0u;
  v49 = 0u;
  v50 = 0u;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 200), "allValues");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v49, v60, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v50;
    do
    {
      for (j = 0; j != v15; ++j)
      {
        if (*(_QWORD *)v50 != v16)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * j);
        objc_msgSend(v18, "cancel");
        objc_msgSend(*(id *)(a1 + 40), "addObject:", v18);
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v49, v60, 16);
    }
    while (v15);
  }

  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 216), "allValues");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v45, v59, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v46;
    do
    {
      for (k = 0; k != v21; ++k)
      {
        if (*(_QWORD *)v46 != v22)
          objc_enumerationMutation(v19);
        v24 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * k);
        objc_msgSend(v24, "cancel");
        objc_msgSend(*(id *)(a1 + 40), "addObject:", v24);
      }
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v45, v59, 16);
    }
    while (v21);
  }

  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 224), "allValues");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v41, v58, 16);
  if (v26)
  {
    v27 = v26;
    v28 = *(_QWORD *)v42;
    do
    {
      for (m = 0; m != v27; ++m)
      {
        if (*(_QWORD *)v42 != v28)
          objc_enumerationMutation(v25);
        v30 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * m);
        objc_msgSend(v30, "cancel");
        objc_msgSend(*(id *)(a1 + 40), "addObject:", v30);
      }
      v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v41, v58, 16);
    }
    while (v27);
  }

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 232));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "cancel");
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v31 = *(id *)(*(_QWORD *)(a1 + 32) + 192);
  v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v37, v57, 16);
  if (v32)
  {
    v33 = v32;
    v34 = *(_QWORD *)v38;
    do
    {
      for (n = 0; n != v33; ++n)
      {
        if (*(_QWORD *)v38 != v34)
          objc_enumerationMutation(v31);
        objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * n), "schedule", (_QWORD)v37);
      }
      v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v37, v57, 16);
    }
    while (v33);
  }

  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 192), "removeAllObjects");
}

void __22__BRCClientZone_close__block_invoke_50(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "asPrivateClientZone", 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "appLibraries");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "close");
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (void)scheduleResetServerAndClientTruthsForReason:(id)a3
{
  -[BRCClientZone scheduleResetServerAndClientTruthsForReason:completionHandler:](self, "scheduleResetServerAndClientTruthsForReason:completionHandler:", a3, 0);
}

- (void)scheduleResetServerAndClientTruthsForReason:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  id v18;
  void *v19;
  uint8_t buf[4];
  id v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (scheduleResetServerAndClientTruthsForReason_completionHandler__onceToken != -1)
    dispatch_once(&scheduleResetServerAndClientTruthsForReason_completionHandler__onceToken, &__block_literal_global_27);
  +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", self->_mangledID);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "resetReasonsToTriggerTTR");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v9, "containsObject:", v6))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Zone Reset: %@"), v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCAccountSession tapToRadarManager](self->_session, "tapToRadarManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB35C8], "brc_errorZoneReset");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "requestTapToRadarWithTitle:description:keywords:attachments:sendFullLog:displayReason:triggerRootCause:", v10, v10, MEMORY[0x1E0C9AA60], MEMORY[0x1E0C9AA60], 0, CFSTR("it got to an invalid state"), v12);

  }
  if ((objc_msgSend((id)scheduleResetServerAndClientTruthsForReason_completionHandler__reasonsToIgnoreForABC, "containsObject:", v6) & 1) == 0)
  {
    brc_bread_crumbs();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      -[BRCClientZone scheduleResetServerAndClientTruthsForReason:completionHandler:].cold.1((uint64_t)v6);

  }
  brc_bread_crumbs();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v21 = v6;
    v22 = 2112;
    v23 = v15;
    _os_log_impl(&dword_1CBD43000, v16, OS_LOG_TYPE_DEFAULT, "[WARNING] Container needs server and client truths reset: %@%@", buf, 0x16u);
  }

  +[BRCEventsAnalytics sharedAnalytics](BRCEventsAnalytics, "sharedAnalytics");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "registerAndSendNewContainerResetWithOutcome:", v6);

  v18 = +[AppTelemetryTimeSeriesEvent newZoneResetEventWithZoneMangledID:enhancedDrivePrivacyEnabled:lastSyncDate:error:errorDescription:](AppTelemetryTimeSeriesEvent, "newZoneResetEventWithZoneMangledID:enhancedDrivePrivacyEnabled:lastSyncDate:error:errorDescription:", self->_mangledID, -[BRCClientZone enhancedDrivePrivacyEnabled](self, "enhancedDrivePrivacyEnabled"), self->_lastSyncDownDate, 0, v6);
  -[BRCAccountSession analyticsReporter](self->_session, "analyticsReporter");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "postReportForDefaultSubCategoryWithCategory:telemetryTimeEvent:", 8, v18);

  -[BRCClientZone scheduleReset:completionHandler:](self, "scheduleReset:completionHandler:", 2, v7);
}

void __79__BRCClientZone_scheduleResetServerAndClientTruthsForReason_completionHandler___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("crash-recovery"), CFSTR("ipc-com.apple.finder"), CFSTR("CKErrorInternalContainerReset"), CFSTR("CKErrorUserDeleteZone"), CFSTR("CKErrorZoneNotFound"), CFSTR("CKErrorSharedZoneNotFound"), CFSTR("still-wants-data-unlinked"), CFSTR("zone became healthy"), CFSTR("start-scan"), CFSTR("testing"), 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)scheduleResetServerAndClientTruthsForReason_completionHandler__reasonsToIgnoreForABC;
  scheduleResetServerAndClientTruthsForReason_completionHandler__reasonsToIgnoreForABC = v0;

}

- (BOOL)handleZoneLevelErrorIfNeeded:(id)a3 forItemCreation:(BOOL)a4
{
  id v5;
  int v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  void *v13;
  BRMangledID *mangledID;
  _BOOL8 v15;
  id v16;
  void *v17;
  BOOL v18;
  void *v19;
  NSObject *v20;
  BRCAccountSession *session;
  void *v22;
  NSObject *v23;
  id v25;
  id v26;
  BRCServerZone *serverZone;
  uint8_t buf[4];
  uint64_t v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  -[BRCPQLConnection assertOnQueue](self->_db, "assertOnQueue");
  v25 = 0;
  v26 = 0;
  v6 = objc_msgSend(v5, "brc_isCloudKitErrorUnsupportedOSForZoneAndGetMinimumSupported:", &v25);
  v7 = v25;
  v8 = v25;
  if (v6)
  {
    objc_storeStrong((id *)&self->_osNameRequiredToSync, v7);
    -[BRCClientZone setStateBits:](self, "setStateBits:", 0x200000);
  }
  v9 = objc_msgSend(v5, "brc_containerResetErrorForSharedZone:resetReason:", -[BRCClientZone isSharedZone](self, "isSharedZone"), &v26);
  if (v9)
  {
    v10 = v9;
    brc_bread_crumbs();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      v29 = v10;
      v30 = 2112;
      v31 = v11;
      _os_log_impl(&dword_1CBD43000, v12, OS_LOG_TYPE_DEFAULT, "[WARNING] Container needs reset - %lu%@", buf, 0x16u);
    }

    +[BRCEventsAnalytics sharedAnalytics](BRCEventsAnalytics, "sharedAnalytics");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "registerAndSendNewContainerResetWithOutcome:", v26);

    mangledID = self->_mangledID;
    v15 = -[BRCClientZone enhancedDrivePrivacyEnabled](self, "enhancedDrivePrivacyEnabled");
    v16 = +[AppTelemetryTimeSeriesEvent newZoneResetEventWithZoneMangledID:enhancedDrivePrivacyEnabled:lastSyncDate:error:errorDescription:](AppTelemetryTimeSeriesEvent, "newZoneResetEventWithZoneMangledID:enhancedDrivePrivacyEnabled:lastSyncDate:error:errorDescription:", mangledID, v15, self->_lastSyncDownDate, v5, v26);
    -[BRCAccountSession analyticsReporter](self->_session, "analyticsReporter");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "postReportForDefaultSubCategoryWithCategory:telemetryTimeEvent:", 8, v16);

    -[BRCClientZone scheduleReset:](self, "scheduleReset:", v10);
    v18 = 1;
  }
  else if (objc_msgSend(v5, "brc_isCloudKitErrorZoneMigrated"))
  {
    brc_bread_crumbs();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v29 = (uint64_t)v19;
      _os_log_impl(&dword_1CBD43000, v20, OS_LOG_TYPE_DEFAULT, "[WARNING] Server zone has been moved to cloud docs%@", buf, 0xCu);
    }

    session = self->_session;
    serverZone = self->_serverZone;
    v18 = 1;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &serverZone, 1);
    v16 = (id)objc_claimAutoreleasedReturnValue();
    -[BRCAccountSession scheduleZoneMovesToCloudDocs:](session, "scheduleZoneMovesToCloudDocs:", v16);
  }
  else
  {
    if (!objc_msgSend(v5, "brc_isCloudKitErrorNeedsPCSPrep"))
    {
      v18 = 0;
      goto LABEL_16;
    }
    brc_bread_crumbs();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v29 = (uint64_t)v22;
      _os_log_impl(&dword_1CBD43000, v23, OS_LOG_TYPE_DEFAULT, "[WARNING] Server tells us we need to redo PCS prep%@", buf, 0xCu);
    }

    -[BRCAccountSession containerScheduler](self->_session, "containerScheduler");
    v16 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "redoZonePCSPreperation");
    v18 = 0;
  }

LABEL_16:
  return v18;
}

- (BOOL)handleSaltingErrorIfNeeded:(id)a3 record:(id)a4
{
  return 0;
}

- (void)_bumpNotificationRankOnTopLevelFolderSharesInZone
{
  -[BRCPQLConnection execute:](self->_db, "execute:", CFSTR("UPDATE client_items SET item_notifs_rank = bump_notifs_rank() WHERE (item_sharing_options & 4) != 0 AND zone_rowid = %@ AND item_type IN (0, 9, 10)"), self->_dbRowID);
}

- (void)_bumpNotificationRankOnTopLevelFolderSharesParentedToZone
{
  -[BRCPQLConnection execute:](self->_db, "execute:", CFSTR("UPDATE client_items SET item_notifs_rank = bump_notifs_rank() WHERE (item_sharing_options & 4) != 0 AND item_parent_zone_rowid = %@ AND zone_rowid != item_parent_zone_rowid AND item_type IN (0, 9, 10)"), self->_dbRowID);
}

- (id)itemCountPendingUploadOrSyncUpAndReturnError:(id *)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[5];

  if (a3)
  {
    v5 = *a3;
    *a3 = 0;

  }
  -[BRCClientZone db](self, "db");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCServerZone dbRowID](self->_serverZone, "dbRowID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __62__BRCClientZone_itemCountPendingUploadOrSyncUpAndReturnError___block_invoke;
  v11[3] = &__block_descriptor_40_e48_v28__0__sqlite3_context__8i16___sqlite3_value_20l;
  v11[4] = a3;
  v8 = (void *)MEMORY[0x1D17A6DB0](v11);
  v9 = (void *)objc_msgSend(v6, "numberWithSQL:", CFSTR("SELECT COUNT(1) FROM client_items WHERE item_localsyncupstate IN (2, 3, 4) AND zone_rowid = %@  AND call_block(%p, version_upload_error, item_id)"), v7, v8);

  return v9;
}

void __62__BRCClientZone_itemCountPendingUploadOrSyncUpAndReturnError___block_invoke(uint64_t a1, sqlite3_context *a2, uint64_t a3, uint64_t a4)
{
  if (+[BRCItemID isDocumentsItemIDWithSQLiteValue:](BRCItemID, "isDocumentsItemIDWithSQLiteValue:", *(_QWORD *)(a4 + 8)))
  {
    sqlite3_result_int(a2, 0);
  }
  else
  {
    checkErrorIsRetriable(a2, (sqlite3_value **)a4, *(id **)(a1 + 32));
  }
}

- (id)sizeOfItemsNeedingSyncUpOrUploadAndReturnError:(id *)a3
{
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD v14[5];

  if (-[BRCClientZone isSyncBlocked](self, "isSyncBlocked"))
  {
    brc_bread_crumbs();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      -[BRCClientZone sizeOfItemsNeedingSyncUpOrUploadAndReturnError:].cold.1((uint64_t)self);
    v7 = 0;
  }
  else
  {
    -[BRCClientZone itemCountPendingUploadOrSyncUpAndReturnError:](self, "itemCountPendingUploadOrSyncUpAndReturnError:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v5, "intValue"))
    {
      v7 = 0;
      goto LABEL_8;
    }
    -[BRCClientZone db](self, "db");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCServerZone dbRowID](self->_serverZone, "dbRowID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __64__BRCClientZone_sizeOfItemsNeedingSyncUpOrUploadAndReturnError___block_invoke;
    v14[3] = &__block_descriptor_40_e48_v28__0__sqlite3_context__8i16___sqlite3_value_20l;
    v14[4] = a3;
    v10 = (void *)MEMORY[0x1D17A6DB0](v14);
    v6 = objc_msgSend(v8, "numberWithSQL:", CFSTR("SELECT SUM(version_size) FROM client_items WHERE item_localsyncupstate IN (2, 3, 4)   AND zone_rowid = %@   AND call_block(%p, version_upload_error)"), v9, v10);

    v11 = -[NSObject integerValue](v6, "integerValue");
    v12 = objc_msgSend(v5, "integerValue");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v11 + 100 * v12);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

LABEL_8:
  return v7;
}

void __64__BRCClientZone_sizeOfItemsNeedingSyncUpOrUploadAndReturnError___block_invoke(uint64_t a1, sqlite3_context *a2, uint64_t a3, sqlite3_value **a4)
{
  checkErrorIsRetriable(a2, a4, *(id **)(a1 + 32));
}

- (void)beginSyncBubbleActivityIfNecessary
{
  void *v3;
  NSObject *v4;
  UMUserSyncTask *bubbleSyncTask;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint8_t buf[4];
  BRCClientZone *v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  -[BRCPQLConnection assertOnQueue](self->_db, "assertOnQueue");
  if (self->_bubbleSyncTask)
  {
    brc_bread_crumbs();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      bubbleSyncTask = self->_bubbleSyncTask;
      *(_DWORD *)buf = 138412802;
      v12 = self;
      v13 = 2112;
      v14 = (uint64_t)bubbleSyncTask;
      v15 = 2112;
      v16 = v3;
      _os_log_impl(&dword_1CBD43000, v4, OS_LOG_TYPE_DEFAULT, "[WARNING] %@ - We already have a bubble sync task %@%@", buf, 0x20u);
    }
LABEL_8:

    goto LABEL_9;
  }
  -[BRCClientZone sizeOfItemsNeedingSyncUpOrUploadAndReturnError:](self, "sizeOfItemsNeedingSyncUpOrUploadAndReturnError:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v6 = (void *)MEMORY[0x1E0DC5F10];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Still %@ bytes need to sync to the server"), v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "taskWithName:reason:forBundleID:", CFSTR("com.apple.bird.uploads"), v7, self->_zoneName);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    brc_bread_crumbs();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      v12 = self;
      v13 = 2048;
      v14 = objc_msgSend(v3, "unsignedLongLongValue");
      v15 = 2112;
      v16 = v9;
      _os_log_impl(&dword_1CBD43000, v10, OS_LOG_TYPE_DEFAULT, "[NOTICE] %@ - shared iPad: needs to sync items in the sync bubble (sz:%llu)%@", buf, 0x20u);
    }

    objc_msgSend(v8, "setContentSize:", objc_msgSend(v3, "unsignedIntegerValue"));
    objc_msgSend(v8, "begin");
    v4 = self->_bubbleSyncTask;
    self->_bubbleSyncTask = (UMUserSyncTask *)v8;
    goto LABEL_8;
  }
LABEL_9:

}

- (void)registerAllItemsDidUploadTracker:(id)a3
{
  id v4;
  void *v5;
  NSMutableArray *allItemsDidUploadTrackers;
  NSMutableArray *v7;
  NSMutableArray *v8;
  id v9;

  v4 = a3;
  -[BRCPQLConnection assertOnQueue](self->_db, "assertOnQueue");
  v9 = 0;
  -[BRCClientZone sizeOfItemsNeedingSyncUpOrUploadAndReturnError:](self, "sizeOfItemsNeedingSyncUpOrUploadAndReturnError:", &v9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    allItemsDidUploadTrackers = self->_allItemsDidUploadTrackers;
    if (!allItemsDidUploadTrackers)
    {
      v7 = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 1);
      v8 = self->_allItemsDidUploadTrackers;
      self->_allItemsDidUploadTrackers = v7;

      allItemsDidUploadTrackers = self->_allItemsDidUploadTrackers;
    }
    -[NSMutableArray addObject:](allItemsDidUploadTrackers, "addObject:", v4);
  }
  else
  {
    objc_msgSend(v4, "clientZone:didFinishUploadingAllItemsWithError:", self, v9);
  }

}

- (void)unregisterAllItemsDidUploadTracker:(id)a3
{
  BRCPQLConnection *db;
  id v5;
  NSMutableArray *allItemsDidUploadTrackers;

  db = self->_db;
  v5 = a3;
  -[BRCPQLConnection assertOnQueue](db, "assertOnQueue");
  -[NSMutableArray removeObject:](self->_allItemsDidUploadTrackers, "removeObject:", v5);

  if (!-[NSMutableArray count](self->_allItemsDidUploadTrackers, "count"))
  {
    allItemsDidUploadTrackers = self->_allItemsDidUploadTrackers;
    self->_allItemsDidUploadTrackers = 0;

  }
}

- (BOOL)isCloudDocsZone
{
  _BOOL4 v3;

  v3 = -[BRCClientZone isPrivateZone](self, "isPrivateZone");
  if (v3)
    LOBYTE(v3) = -[NSString isEqualToString:](self->_zoneName, "isEqualToString:", *MEMORY[0x1E0D10DB0]);
  return v3;
}

- (void)disconnectNSMDQListenerAsync
{
  uint64_t v0;
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  OUTLINED_FUNCTION_11_0(*MEMORY[0x1E0C80C00]);
  LODWORD(v3) = 134218242;
  *(_QWORD *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v1, v2, "[DEBUG] ┣%llx disconnecting listener so that they gather again%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_2();
}

void __45__BRCClientZone_disconnectNSMDQListenerAsync__block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  uint8_t buf[4];
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = *(_OWORD *)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 56);
  brc_bread_crumbs();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v4 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 134218498;
    v8 = v5;
    v9 = 2112;
    v10 = v4;
    v11 = 2112;
    v12 = v2;
    _os_log_debug_impl(&dword_1CBD43000, v3, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx disconnected NSMDQ listeners for %@%@", buf, 0x20u);
  }

  __brc_leave_section((uint64_t *)&v5);
}

- (BOOL)isForeground
{
  void *v2;
  void *v3;
  char v4;

  -[BRCClientZone serverZone](self, "serverZone");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "metadataSyncContextIfExists");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isForeground");

  return v4;
}

- (void)_forDBUpgrade_setStateBits:(unsigned int)a3 clearStateBits:(unsigned int)a4
{
  unsigned int state;
  unsigned int v5;

  state = self->_state;
  v5 = (state | a3) & ~a4;
  if (state != v5)
  {
    -[BRCClientZone setNeedsSave:](self, "setNeedsSave:", 1);
    self->_state = v5;
  }
}

- (void)_fixupEnhancedDrivePrivacyState
{
  void *v3;
  void *v4;
  void *v5;
  unsigned int state;
  void *v7;
  NSObject *v8;
  unsigned int v9;
  void *v10;
  NSObject *v11;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[BRCClientZone mangledID](self, "mangledID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  state = self->_state;
  if ((state & 0x400000) != 0)
  {
    if (!objc_msgSend(v4, "supportsEnhancedDrivePrivacy"))
    {
      brc_bread_crumbs();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v12 = 138412546;
        v13 = v3;
        v14 = 2112;
        v15 = v10;
        _os_log_impl(&dword_1CBD43000, v11, OS_LOG_TYPE_DEFAULT, "[WARNING] Stripping enhanced drive privacy bit because it's not supported on %@%@", (uint8_t *)&v12, 0x16u);
      }

      v9 = self->_state & 0xFFBFFFFF;
      goto LABEL_13;
    }
    state = self->_state;
  }
  if ((state & 0x400000) == 0
    && objc_msgSend(v5, "supportsEnhancedDrivePrivacy")
    && objc_msgSend(v5, "enhancedDrivePrivacyForced"))
  {
    brc_bread_crumbs();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 138412546;
      v13 = v3;
      v14 = 2112;
      v15 = v7;
      _os_log_impl(&dword_1CBD43000, v8, OS_LOG_TYPE_DEFAULT, "[WARNING] Adding enhanced drive privacy bit because it's forced on %@%@", (uint8_t *)&v12, 0x16u);
    }

    v9 = self->_state | 0x400000;
LABEL_13:
    self->_state = v9;
    -[BRCClientZone setNeedsSave:](self, "setNeedsSave:", 1);
  }

}

- (unsigned)_activateState:(unsigned int)a3 origState:(unsigned int)a4
{
  unsigned int v7;
  void *v8;
  NSObject *v9;
  NSString *osNameRequiredToSync;
  unsigned int v11;
  void *v12;
  void *v13;
  BRCServerZone *serverZone;
  BRCAccountSession *v15;
  BRCAccountSession *session;
  void *v17;
  void *v18;
  void *v19;
  BRCItemGlobalID *v20;
  void *v22;
  _QWORD v23[4];
  BRCAccountSession *v24;
  uint8_t buf[4];
  BRCClientZone *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  -[BRCPQLConnection assertOnQueue](self->_db, "assertOnQueue");
  -[BRCClientZone _fixupEnhancedDrivePrivacyState](self, "_fixupEnhancedDrivePrivacyState");
  if (self->_state != a3)
  {
    -[BRCClientZone setNeedsSave:](self, "setNeedsSave:", 1);
    self->_state = a3;
  }
  if ((a3 & 0x100) != 0)
  {
    a3 &= ~0x10u;
    self->_state = a3;
  }
  v7 = a3 ^ a4;
  if (v7)
  {
    if (self->_needsSave)
    {
      brc_bread_crumbs();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        BRCPrettyPrintBitmapWithContext(a4, (uint64_t)&local_container_state_entries, 0);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v26 = self;
        v27 = 2112;
        v28 = v22;
        v29 = 2112;
        v30 = v8;
        _os_log_debug_impl(&dword_1CBD43000, v9, OS_LOG_TYPE_DEBUG, "[DEBUG] %@ state changed, was %@%@", buf, 0x20u);

      }
    }
    if ((v7 & 0x200000) != 0)
    {
      if ((self->_state & 0x200000) != 0)
      {
        -[BRCClientZone disconnectNSMDQListenerAsync](self, "disconnectNSMDQListenerAsync");
      }
      else
      {
        osNameRequiredToSync = self->_osNameRequiredToSync;
        self->_osNameRequiredToSync = 0;

      }
    }
    v11 = self->_state & 0x201000;
    if ((a4 & 0x201000) != v11)
    {
      -[BRCAccountSession applyScheduler](self->_session, "applyScheduler");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v12;
      serverZone = self->_serverZone;
      if (!v11)
      {
        objc_msgSend(v12, "repopulateJobsForZone:", serverZone);

        -[BRCClientZone scheduleSyncDown](self, "scheduleSyncDown");
        -[BRCClientZone scheduleSyncUp](self, "scheduleSyncUp");
        if ((v7 & 0x100) == 0)
          goto LABEL_21;
        goto LABEL_18;
      }
      objc_msgSend(v12, "deleteJobsMatching:", serverZone);

    }
    if ((v7 & 0x100) == 0)
      goto LABEL_21;
LABEL_18:
    if ((self->_state & 0x100) == 0)
      -[BRCClientZone fetchRecentAndFavoriteDocuments](self, "fetchRecentAndFavoriteDocuments");
LABEL_21:
    if ((v7 & 0x400000) == 0)
      goto LABEL_31;
    v15 = self->_session;
    if (-[BRCClientZone isCloudDocsZone](self, "isCloudDocsZone"))
    {
      session = self->_session;
      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __42__BRCClientZone__activateState_origState___block_invoke;
      v23[3] = &unk_1E875ED40;
      v24 = v15;
      -[BRCAccountSession enumeratePrivateClientZones:](session, "enumeratePrivateClientZones:", v23);
      v17 = v24;
    }
    else
    {
      if (!-[BRCClientZone isPrivateZone](self, "isPrivateZone"))
      {
LABEL_27:
        if (-[BRCClientZone isPrivateZone](self, "isPrivateZone"))
          -[BRCClientZone _bumpNotificationRankOnTopLevelFolderSharesParentedToZone](self, "_bumpNotificationRankOnTopLevelFolderSharesParentedToZone");
        else
          -[BRCClientZone _bumpNotificationRankOnTopLevelFolderSharesInZone](self, "_bumpNotificationRankOnTopLevelFolderSharesInZone");

        goto LABEL_31;
      }
      -[BRCClientZone asPrivateClientZone](self, "asPrivateClientZone");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "defaultAppLibrary");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "documentsFolderItemID");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      v20 = -[BRCItemGlobalID initWithZoneRowID:itemID:]([BRCItemGlobalID alloc], "initWithZoneRowID:itemID:", self->_dbRowID, v17);
      -[BRCAccountSession bumpNotificationRankOnItemGlobalID:](v15, "bumpNotificationRankOnItemGlobalID:", v20);

    }
    goto LABEL_27;
  }
LABEL_31:
  -[BRCClientZone _flushIdleBlocksIfNeeded](self, "_flushIdleBlocksIfNeeded");
  return v7;
}

uint64_t __42__BRCClientZone__activateState_origState___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  BRCItemGlobalID *v6;
  void *v7;
  BRCItemGlobalID *v8;

  v3 = a2;
  objc_msgSend(v3, "defaultAppLibrary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "documentsFolderItemID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = [BRCItemGlobalID alloc];
  objc_msgSend(v3, "dbRowID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[BRCItemGlobalID initWithZoneRowID:itemID:](v6, "initWithZoneRowID:itemID:", v7, v5);
  objc_msgSend(*(id *)(a1 + 32), "bumpNotificationRankOnItemGlobalID:", v8);

  return 1;
}

- (BOOL)setStateBits:(unsigned int)a3
{
  unsigned int state;
  BOOL v4;

  state = self->_state;
  v4 = (a3 & ~state) != 0;
  -[BRCClientZone _activateState:origState:](self, "_activateState:origState:", state | a3);
  return v4;
}

- (void)clearStateBits:(unsigned int)a3
{
  -[BRCClientZone _activateState:origState:](self, "_activateState:origState:", self->_state & ~a3);
}

- (BOOL)isSyncBlocked
{
  _BOOL4 v3;

  if ((-[BRCClientZone state](self, "state") & 0x201000) != 0)
    LOBYTE(v3) = 1;
  else
    return (-[BRCServerZone state](self->_serverZone, "state") >> 1) & 1;
  return v3;
}

- (BOOL)isSyncBlockedBecauseAppNotInstalled
{
  return (-[BRCClientZone state](self, "state") >> 12) & 1;
}

- (BOOL)isSyncBlockedBecauseOSNeedsUpgrade
{
  return (-[BRCClientZone state](self, "state") >> 21) & 1;
}

- (BOOL)isEqualToClientZone:(id)a3
{
  _QWORD *v4;
  void *v5;
  char v6;

  v4 = a3;
  objc_msgSend(v4, "mangledID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    v6 = -[BRMangledID isEqualToMangledID:](self->_mangledID, "isEqualToMangledID:", v4[7]);
  else
    v6 = 0;

  return v6;
}

- (unint64_t)hash
{
  return -[BRMangledID hash](self->_mangledID, "hash");
}

- (BOOL)isEqual:(id)a3
{
  BRCClientZone *v4;
  BOOL v5;

  v4 = (BRCClientZone *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0 && -[BRCClientZone isEqualToClientZone:](self, "isEqualToClientZone:", v4);
  }

  return v5;
}

- (NSString)description
{
  return (NSString *)-[BRCClientZone descriptionWithContext:](self, "descriptionWithContext:", 0);
}

- (id)descriptionWithContext:(id)a3
{
  id v4;
  void *v5;
  const __CFString *v6;
  uint64_t v7;
  void *v8;
  BRMangledID *mangledID;
  BRCZoneRowID *dbRowID;
  void *v11;
  void *v12;
  __CFString *v13;
  void *v14;
  void *v15;
  id v17;

  v4 = a3;
  -[BRCServerZone changeState](self->_serverZone, "changeState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[BRCClientZone isForeground](self, "isForeground"))
  {
    v6 = CFSTR("foreground");
    v7 = 7;
  }
  else
  {
    v6 = CFSTR("background");
    v7 = 2;
  }
  +[BRCDumpContext highlightedString:type:context:](BRCDumpContext, "highlightedString:type:context:", v6, v7, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_alloc(MEMORY[0x1E0CB3940]);
  mangledID = self->_mangledID;
  dbRowID = self->_dbRowID;
  BRCPrettyPrintBitmapWithContext(self->_state, (uint64_t)&local_container_state_entries, v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  BRCServerZoneStatePrettyPrintWithContext(-[BRCServerZone state](self->_serverZone, "state"), v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[BRCClientZone syncState](self, "syncState"))
  {
    BRCPrettyPrintBitmap();
    v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = CFSTR("idle");
  }
  objc_msgSend(v5, "descriptionWithContext:", v4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v17, "initWithFormat:", CFSTR("<%@[%@] %@ {client:%@ server:%@ sync:%@ %@ rid:%llu}>"), mangledID, dbRowID, v8, v11, v12, v13, v14, self->_requestID);

  return v15;
}

- (id)itemByDocumentID:(unsigned int)a3
{
  return -[BRCClientZone itemByDocumentID:db:](self, "itemByDocumentID:db:", *(_QWORD *)&a3, self->_db);
}

- (id)itemByDocumentID:(unsigned int)a3 db:(id)a4
{
  uint64_t v4;
  id v6;
  BRCZoneRowID *dbRowID;
  id v8;
  void *v9;
  _QWORD v11[5];
  id v12;

  v4 = *(_QWORD *)&a3;
  v6 = a4;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __37__BRCClientZone_itemByDocumentID_db___block_invoke;
  v11[3] = &unk_1E875E310;
  v11[4] = self;
  v12 = v6;
  dbRowID = self->_dbRowID;
  v8 = v6;
  v9 = (void *)objc_msgSend(v8, "fetchObject:sql:", v11, CFSTR("SELECT rowid, zone_rowid, item_id, item_creator_id, item_sharing_options, item_side_car_ckinfo, item_parent_zone_rowid, item_localsyncupstate, item_local_diffs, item_notifs_rank, app_library_rowid, item_min_supported_os_rowid, item_user_visible, item_stat_ckinfo, item_state, item_type, item_mode, item_birthtime, item_lastusedtime, item_favoriterank,item_parent_id, item_filename, item_hidden_ext, item_finder_tags, item_xattr_signature, item_trash_put_back_path, item_trash_put_back_parent_id, item_alias_target, item_creator, item_doc_id, item_file_id, item_generation, item_localname, item_processing_stamp, item_staged_file_id, item_staged_generation, item_bouncedname, item_scope, item_tmpbounceno, version_name, version_ckinfo, version_mtime, version_size, version_thumb_size, version_thumb_signature, version_content_signature, version_xattr_signature, version_edited_since_shared, version_device, version_conflict_loser_etags, version_quarantine_info, version_uploaded_assets, version_upload_error, version_old_zone_item_id, version_old_zone_rowid, desired_version, item_live_conflict_loser_etags, item_thumb_live_signature, item_thumb_greedy, version_block_sync_until_bundle_id, version_block_sync_until_timestamp FROM client_items WHERE (item_parent_zone_rowid = %@ OR zone_rowid = %@) AND item_doc_id = %u   AND +item_state IN (0, -1)   AND +item_type IN (1, 2, 8, 6, 7)"), dbRowID, dbRowID, v4);

  return v9;
}

id __37__BRCClientZone_itemByDocumentID_db___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;

  v5 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(v5, "session");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "newLocalItemFromPQLResultSet:db:error:", v6, *(_QWORD *)(a1 + 40), a3);

  return v8;
}

- (id)itemByFileID:(unint64_t)a3
{
  return -[BRCClientZone itemByFileID:db:](self, "itemByFileID:db:", a3, self->_db);
}

- (id)itemByFileID:(unint64_t)a3 db:(id)a4
{
  id v6;
  BRCZoneRowID *dbRowID;
  id v8;
  void *v9;
  _QWORD v11[5];
  id v12;

  v6 = a4;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __33__BRCClientZone_itemByFileID_db___block_invoke;
  v11[3] = &unk_1E875E310;
  v11[4] = self;
  v12 = v6;
  dbRowID = self->_dbRowID;
  v8 = v6;
  v9 = (void *)objc_msgSend(v8, "fetchObject:sql:", v11, CFSTR("SELECT rowid, zone_rowid, item_id, item_creator_id, item_sharing_options, item_side_car_ckinfo, item_parent_zone_rowid, item_localsyncupstate, item_local_diffs, item_notifs_rank, app_library_rowid, item_min_supported_os_rowid, item_user_visible, item_stat_ckinfo, item_state, item_type, item_mode, item_birthtime, item_lastusedtime, item_favoriterank,item_parent_id, item_filename, item_hidden_ext, item_finder_tags, item_xattr_signature, item_trash_put_back_path, item_trash_put_back_parent_id, item_alias_target, item_creator, item_doc_id, item_file_id, item_generation, item_localname, item_processing_stamp, item_staged_file_id, item_staged_generation, item_bouncedname, item_scope, item_tmpbounceno, version_name, version_ckinfo, version_mtime, version_size, version_thumb_size, version_thumb_signature, version_content_signature, version_xattr_signature, version_edited_since_shared, version_device, version_conflict_loser_etags, version_quarantine_info, version_uploaded_assets, version_upload_error, version_old_zone_item_id, version_old_zone_rowid, desired_version, item_live_conflict_loser_etags, item_thumb_live_signature, item_thumb_greedy, version_block_sync_until_bundle_id, version_block_sync_until_timestamp FROM client_items  WHERE (item_parent_zone_rowid = %@ OR zone_rowid = %@)     AND item_file_id = %lld    AND item_state IN (0, -1)"), dbRowID, dbRowID, a3);

  return v9;
}

id __33__BRCClientZone_itemByFileID_db___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;

  v5 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(v5, "session");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "newLocalItemFromPQLResultSet:db:error:", v6, *(_QWORD *)(a1 + 40), a3);

  return v8;
}

- (id)serverItemByParentID:(id)a3 andLogicalName:(id)a4
{
  return -[BRCClientZone serverItemByParentID:andLogicalName:db:](self, "serverItemByParentID:andLogicalName:db:", a3, a4, self->_db);
}

- (id)serverItemByParentID:(id)a3 andLogicalName:(id)a4 db:(id)a5
{
  BRCZoneRowID *dbRowID;
  _QWORD v7[5];

  v7[1] = 3221225472;
  v7[2] = __56__BRCClientZone_serverItemByParentID_andLogicalName_db___block_invoke;
  v7[3] = &unk_1E875E2C8;
  v7[4] = self;
  dbRowID = self->_dbRowID;
  v7[0] = MEMORY[0x1E0C809B0];
  return (id)objc_msgSend(a5, "fetchObject:sql:", v7, CFSTR("SELECT zone_rowid, item_rank, item_origname, pcs_state, item_id, item_creator_id, item_sharing_options, item_side_car_ckinfo, item_stat_ckinfo, item_state, item_type, item_mode, item_birthtime, item_lastusedtime, item_favoriterank,item_parent_id, item_filename, item_hidden_ext, item_finder_tags, item_xattr_signature, item_trash_put_back_path, item_trash_put_back_parent_id, item_alias_target, item_creator, version_name, version_ckinfo, version_mtime, version_size, version_thumb_size, version_thumb_signature, version_content_signature, version_xattr_signature, version_edited_since_shared, version_device, version_conflict_loser_etags, version_quarantine_info, quota_used, recursive_child_count, shared_children_count, shared_alias_count, child_count FROM server_items WHERE item_parent_id = %@ AND item_filename = %@ AND +zone_rowid = %@"), a3, a4, dbRowID);
}

id __56__BRCClientZone_serverItemByParentID_andLogicalName_db___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = *(void **)(a1 + 32);
  v5 = a2;
  objc_msgSend(v4, "session");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "newServerItemFromPQLResultSet:error:", v5, a3);

  return v7;
}

- (id)itemByParentID:(id)a3 andLogicalName:(id)a4
{
  return -[BRCClientZone itemByParentID:andLogicalName:db:](self, "itemByParentID:andLogicalName:db:", a3, a4, self->_db);
}

- (id)itemByParentID:(id)a3 andLogicalName:(id)a4 db:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  id v15;
  void *v16;
  BRCZoneRowID *dbRowID;
  _QWORD v19[5];
  id v20;
  uint8_t buf[4];
  id v22;
  __int16 v23;
  id v24;
  __int16 v25;
  BRCZoneRowID *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_msgSend(v10, "fetch:", CFSTR("SELECT rowid, zone_rowid, item_id, item_creator_id, item_sharing_options, item_side_car_ckinfo, item_parent_zone_rowid, item_localsyncupstate, item_local_diffs, item_notifs_rank, app_library_rowid, item_min_supported_os_rowid, item_user_visible, item_stat_ckinfo, item_state, item_type, item_mode, item_birthtime, item_lastusedtime, item_favoriterank,item_parent_id, item_filename, item_hidden_ext, item_finder_tags, item_xattr_signature, item_trash_put_back_path, item_trash_put_back_parent_id, item_alias_target, item_creator, item_doc_id, item_file_id, item_generation, item_localname, item_processing_stamp, item_staged_file_id, item_staged_generation, item_bouncedname, item_scope, item_tmpbounceno, version_name, version_ckinfo, version_mtime, version_size, version_thumb_size, version_thumb_signature, version_content_signature, version_xattr_signature, version_edited_since_shared, version_device, version_conflict_loser_etags, version_quarantine_info, version_uploaded_assets, version_upload_error, version_old_zone_item_id, version_old_zone_rowid, desired_version, item_live_conflict_loser_etags, item_thumb_live_signature, item_thumb_greedy, version_block_sync_until_bundle_id, version_block_sync_until_timestamp FROM client_items WHERE (item_parent_id = %@ AND item_filename = %@  AND item_state != -2 AND item_parent_zone_rowid = %@        AND item_bouncedname IS NULL)   OR  (item_parent_id = %@ AND item_bouncedname = %@ AND item_state != -2 AND item_parent_zone_rowid = %@)"), v8, v9, self->_dbRowID, v8, v9, self->_dbRowID);
  if ((objc_msgSend(v11, "next") & 1) != 0)
  {
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __50__BRCClientZone_itemByParentID_andLogicalName_db___block_invoke;
    v19[3] = &unk_1E875E310;
    v19[4] = self;
    v20 = v10;
    objc_msgSend(v11, "object:", v19);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "next"))
    {
      brc_bread_crumbs();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      {
        dbRowID = self->_dbRowID;
        *(_DWORD *)buf = 138413058;
        v22 = v8;
        v23 = 2112;
        v24 = v9;
        v25 = 2112;
        v26 = dbRowID;
        v27 = 2112;
        v28 = v13;
        _os_log_fault_impl(&dword_1CBD43000, v14, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: there should never be more than one match for that query (parentID: %@, name: %@, parentZoneID: %@)%@", buf, 0x2Au);
      }

    }
    objc_msgSend(v11, "close");
    v15 = v12;

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithSqliteCode:andMessage:", 12, CFSTR("item not found"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setLastError:", v16);

    v15 = 0;
  }

  return v15;
}

id __50__BRCClientZone_itemByParentID_andLogicalName_db___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;

  v5 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(v5, "session");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "newLocalItemFromPQLResultSet:db:error:", v6, *(_QWORD *)(a1 + 40), a3);

  return v8;
}

- (id)itemByParentID:(id)a3 andPhysicalName:(id)a4 db:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  id v15;
  void *v16;
  BRCZoneRowID *dbRowID;
  _QWORD v19[5];
  id v20;
  uint8_t buf[4];
  id v22;
  __int16 v23;
  id v24;
  __int16 v25;
  BRCZoneRowID *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_msgSend(v10, "fetch:", CFSTR("SELECT rowid, zone_rowid, item_id, item_creator_id, item_sharing_options, item_side_car_ckinfo, item_parent_zone_rowid, item_localsyncupstate, item_local_diffs, item_notifs_rank, app_library_rowid, item_min_supported_os_rowid, item_user_visible, item_stat_ckinfo, item_state, item_type, item_mode, item_birthtime, item_lastusedtime, item_favoriterank,item_parent_id, item_filename, item_hidden_ext, item_finder_tags, item_xattr_signature, item_trash_put_back_path, item_trash_put_back_parent_id, item_alias_target, item_creator, item_doc_id, item_file_id, item_generation, item_localname, item_processing_stamp, item_staged_file_id, item_staged_generation, item_bouncedname, item_scope, item_tmpbounceno, version_name, version_ckinfo, version_mtime, version_size, version_thumb_size, version_thumb_signature, version_content_signature, version_xattr_signature, version_edited_since_shared, version_device, version_conflict_loser_etags, version_quarantine_info, version_uploaded_assets, version_upload_error, version_old_zone_item_id, version_old_zone_rowid, desired_version, item_live_conflict_loser_etags, item_thumb_live_signature, item_thumb_greedy, version_block_sync_until_bundle_id, version_block_sync_until_timestamp FROM client_items WHERE (item_parent_id = %@ AND item_filename = %@ AND item_state != -2 AND item_parent_zone_rowid = %@        AND item_localname IS NULL)   OR  (item_parent_id = %@ AND item_localname = %@ AND item_state != -2 AND item_parent_zone_rowid = %@)"), v8, v9, self->_dbRowID, v8, v9, self->_dbRowID);
  if ((objc_msgSend(v11, "next") & 1) != 0)
  {
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __51__BRCClientZone_itemByParentID_andPhysicalName_db___block_invoke;
    v19[3] = &unk_1E875E310;
    v19[4] = self;
    v20 = v10;
    objc_msgSend(v11, "object:", v19);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "next"))
    {
      brc_bread_crumbs();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      {
        dbRowID = self->_dbRowID;
        *(_DWORD *)buf = 138413058;
        v22 = v8;
        v23 = 2112;
        v24 = v9;
        v25 = 2112;
        v26 = dbRowID;
        v27 = 2112;
        v28 = v13;
        _os_log_fault_impl(&dword_1CBD43000, v14, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: there should never be more than one match for that query (parentID: %@, name: %@, parentZoneID: %@)%@", buf, 0x2Au);
      }

    }
    objc_msgSend(v11, "close");
    v15 = v12;

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithSqliteCode:andMessage:", 12, CFSTR("item not found"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setLastError:", v16);

    v15 = 0;
  }

  return v15;
}

id __51__BRCClientZone_itemByParentID_andPhysicalName_db___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;

  v5 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(v5, "session");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "newLocalItemFromPQLResultSet:db:error:", v6, *(_QWORD *)(a1 + 40), a3);

  return v8;
}

- (id)itemByParentID:(id)a3 andPhysicalName:(id)a4
{
  return -[BRCClientZone itemByParentID:andPhysicalName:db:](self, "itemByParentID:andPhysicalName:db:", a3, a4, self->_db);
}

- (BOOL)existsByParentID:(id)a3 andLogicalName:(id)a4
{
  return -[BRCClientZone existsByParentID:andLogicalName:db:](self, "existsByParentID:andLogicalName:db:", a3, a4, self->_db);
}

- (BOOL)existsByParentID:(id)a3 andLogicalName:(id)a4 excludingItemID:(id)a5
{
  return -[BRCClientZone existsByParentID:andLogicalName:excludingItemID:db:](self, "existsByParentID:andLogicalName:excludingItemID:db:", a3, a4, a5, self->_db);
}

- (BOOL)existsByParentID:(id)a3 andLogicalName:(id)a4 db:(id)a5
{
  return -[BRCClientZone existsByParentID:andLogicalName:excludingItemID:db:](self, "existsByParentID:andLogicalName:excludingItemID:db:", a3, a4, 0, a5);
}

- (BOOL)existsByParentID:(id)a3 andLogicalName:(id)a4 excludingItemID:(id)a5 db:(id)a6
{
  void *v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  char v21;

  if (a5)
  {
    v11 = (void *)MEMORY[0x1E0DE81D0];
    v12 = a6;
    v13 = a4;
    v14 = a3;
    objc_msgSend(v11, "formatInjection:", CFSTR("AND item_id != %@"), a5);
  }
  else
  {
    v15 = (void *)MEMORY[0x1E0DE81E0];
    v16 = a6;
    v17 = a4;
    v18 = a3;
    objc_msgSend(v15, "rawInjection:length:", ", 0);
  }
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(a6, "numberWithSQL:", CFSTR("SELECT 1 FROM client_items WHERE ((item_parent_id = %@ AND item_filename = %@ AND item_parent_zone_rowid = %@ AND item_bouncedname IS NULL) OR (item_parent_id = %@ AND item_bouncedname = %@ AND item_parent_zone_rowid = %@)) AND item_state != 1 %@ LIMIT 1"), a3, a4, self->_dbRowID, a3, a4, self->_dbRowID, v19);

  v21 = objc_msgSend(v20, "BOOLValue");
  return v21;
}

- (BOOL)existsByParentID:(id)a3 andCaseInsensitiveLogicalName:(id)a4
{
  id v4;
  char v5;

  v4 = -[PQLConnection numberWithSQL:](self->_db, "numberWithSQL:", CFSTR("SELECT 1 FROM client_items WHERE ((item_parent_id = %@ AND item_filename = %@ COLLATE NOCASE AND item_parent_zone_rowid = %@ AND item_bouncedname IS NULL) OR (item_parent_id = %@ AND item_bouncedname = %@ COLLATE NOCASE AND item_parent_zone_rowid = %@)) AND item_state != 1 LIMIT 1"), a3, a4, self->_dbRowID, a3, a4, self->_dbRowID);
  v5 = objc_msgSend(v4, "BOOLValue");

  return v5;
}

- (char)serverItemTypeByItemID:(id)a3 db:(id)a4
{
  id v6;
  id v7;
  char v8;
  BRCAccountSession *session;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  BRCAccountSession *v15;
  void *v16;
  void *v17;
  int v18;

  v6 = a3;
  v7 = a4;
  if ((objc_msgSend(v6, "isSharedZoneRoot") & 1) != 0)
  {
    v8 = 4;
  }
  else if (objc_msgSend(v6, "isNonDesktopRoot"))
  {
    session = self->_session;
    objc_msgSend(v6, "appLibraryRowID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCAccountSession appLibraryByRowID:](session, "appLibraryByRowID:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "state");

    if ((v12 & 0x2000000) != 0)
      v8 = 4;
    else
      v8 = 9;
  }
  else
  {
    -[BRCClientZone dbRowID](self, "dbRowID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v7, "numberWithSQL:", CFSTR("SELECT item_type FROM server_items WHERE item_id = %@ AND zone_rowid = %@"), v6, v13);

    if (v14)
    {
      v8 = objc_msgSend(v14, "integerValue");
    }
    else if (objc_msgSend(v6, "isDocumentsFolder"))
    {
      v15 = self->_session;
      objc_msgSend(v6, "appLibraryRowID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[BRCAccountSession appLibraryByRowID:](v15, "appLibraryByRowID:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "state");

      if ((v18 & 0x4000000) != 0)
        v8 = 0;
      else
        v8 = 9;
    }
    else
    {
      v8 = -1;
    }

  }
  return v8;
}

- (id)itemsEnumeratorWithDB:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  v5 = (void *)objc_msgSend(v4, "fetch:", CFSTR("SELECT rowid, zone_rowid, item_id, item_creator_id, item_sharing_options, item_side_car_ckinfo, item_parent_zone_rowid, item_localsyncupstate, item_local_diffs, item_notifs_rank, app_library_rowid, item_min_supported_os_rowid, item_user_visible, item_stat_ckinfo, item_state, item_type, item_mode, item_birthtime, item_lastusedtime, item_favoriterank,item_parent_id, item_filename, item_hidden_ext, item_finder_tags, item_xattr_signature, item_trash_put_back_path, item_trash_put_back_parent_id, item_alias_target, item_creator, item_doc_id, item_file_id, item_generation, item_localname, item_processing_stamp, item_staged_file_id, item_staged_generation, item_bouncedname, item_scope, item_tmpbounceno, version_name, version_ckinfo, version_mtime, version_size, version_thumb_size, version_thumb_signature, version_content_signature, version_xattr_signature, version_edited_since_shared, version_device, version_conflict_loser_etags, version_quarantine_info, version_uploaded_assets, version_upload_error, version_old_zone_item_id, version_old_zone_rowid, desired_version, item_live_conflict_loser_etags, item_thumb_live_signature, item_thumb_greedy, version_block_sync_until_bundle_id, version_block_sync_until_timestamp FROM client_items WHERE zone_rowid = %@"), self->_dbRowID);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __39__BRCClientZone_itemsEnumeratorWithDB___block_invoke;
  v9[3] = &unk_1E875E310;
  v9[4] = self;
  v10 = v4;
  v6 = v4;
  objc_msgSend(v5, "enumerateObjects:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id __39__BRCClientZone_itemsEnumeratorWithDB___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;

  v5 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(v5, "session");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "newLocalItemFromPQLResultSet:db:error:", v6, *(_QWORD *)(a1 + 40), a3);

  return v8;
}

- (BOOL)hasItems
{
  id v2;
  char v3;

  v2 = -[PQLConnection numberWithSQL:](self->_db, "numberWithSQL:", CFSTR("SELECT 1 FROM client_items WHERE zone_rowid = %@ LIMIT 1"), self->_dbRowID);
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (id)itemsWithInFlightDiffsEnumerator
{
  id v3;
  void *v4;
  _QWORD v6[5];

  v3 = -[BRCPQLConnection fetch:](self->_db, "fetch:", CFSTR("SELECT li.rowid, li.zone_rowid, li.item_id, li.item_creator_id, li.item_sharing_options, li.item_side_car_ckinfo, li.item_parent_zone_rowid, li.item_localsyncupstate, li.item_local_diffs, li.item_notifs_rank, li.app_library_rowid, li.item_min_supported_os_rowid, li.item_user_visible, li.item_stat_ckinfo, li.item_state, li.item_type, li.item_mode, li.item_birthtime, li.item_lastusedtime, li.item_favoriterank,li.item_parent_id, li.item_filename, li.item_hidden_ext, li.item_finder_tags, li.item_xattr_signature, li.item_trash_put_back_path, li.item_trash_put_back_parent_id, li.item_alias_target, li.item_creator, li.item_doc_id, li.item_file_id, li.item_generation, li.item_localname, li.item_processing_stamp, li.item_staged_file_id, li.item_staged_generation, li.item_bouncedname, li.item_scope, li.item_tmpbounceno, li.version_name, li.version_ckinfo, li.version_mtime, li.version_size, li.version_thumb_size, li.version_thumb_signature, li.version_content_signature, li.version_xattr_signature, li.version_edited_since_shared, li.version_device, li.version_conflict_loser_etags, li.version_quarantine_info, li.version_uploaded_assets, li.version_upload_error, li.version_old_zone_item_id, li.version_old_zone_rowid, li.desired_version, li.item_live_conflict_loser_etags, li.item_thumb_live_signature, li.item_thumb_greedy, li.version_block_sync_until_bundle_id, li.version_block_sync_until_timestamp FROM client_items AS li INNER JOIN client_sync_up AS su ON su.throttle_id = li.rowid WHERE su.zone_rowid = %@   AND (su.in_flight_diffs BETWEEN -9223372036854775808 AND 9223372036854775807)   AND su.throttle_state != 0"), self->_dbRowID);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __49__BRCClientZone_itemsWithInFlightDiffsEnumerator__block_invoke;
  v6[3] = &unk_1E875E2C8;
  v6[4] = self;
  objc_msgSend(v3, "enumerateObjects:", v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __49__BRCClientZone_itemsWithInFlightDiffsEnumerator__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(v5, "session");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "session");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "clientDB");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v7, "newLocalItemFromPQLResultSet:db:error:", v6, v9, a3);

  return v10;
}

- (BOOL)hasItemsWithInFlightDiffs
{
  id v2;
  char v3;

  v2 = -[PQLConnection numberWithSQL:](self->_db, "numberWithSQL:", CFSTR("SELECT 1 FROM client_items AS li INNER JOIN client_sync_up AS su ON su.throttle_id = li.rowid WHERE su.zone_rowid = %@   AND (su.in_flight_diffs BETWEEN -9223372036854775808 AND 9223372036854775807)   AND su.throttle_state != 0 LIMIT 1"), self->_dbRowID);
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (id)documentsNotIdleEnumeratorWithStartingRowID:(unint64_t)a3 batchSize:(unint64_t)a4
{
  id v5;
  void *v6;
  _QWORD v8[5];

  v5 = -[BRCPQLConnection fetch:](self->_db, "fetch:", CFSTR("SELECT rowid, zone_rowid, item_id, item_creator_id, item_sharing_options, item_side_car_ckinfo, item_parent_zone_rowid, item_localsyncupstate, item_local_diffs, item_notifs_rank, app_library_rowid, item_min_supported_os_rowid, item_user_visible, item_stat_ckinfo, item_state, item_type, item_mode, item_birthtime, item_lastusedtime, item_favoriterank,item_parent_id, item_filename, item_hidden_ext, item_finder_tags, item_xattr_signature, item_trash_put_back_path, item_trash_put_back_parent_id, item_alias_target, item_creator, item_doc_id, item_file_id, item_generation, item_localname, item_processing_stamp, item_staged_file_id, item_staged_generation, item_bouncedname, item_scope, item_tmpbounceno, version_name, version_ckinfo, version_mtime, version_size, version_thumb_size, version_thumb_signature, version_content_signature, version_xattr_signature, version_edited_since_shared, version_device, version_conflict_loser_etags, version_quarantine_info, version_uploaded_assets, version_upload_error, version_old_zone_item_id, version_old_zone_rowid, desired_version, item_live_conflict_loser_etags, item_thumb_live_signature, item_thumb_greedy, version_block_sync_until_bundle_id, version_block_sync_until_timestamp FROM client_items WHERE zone_rowid = %@    AND item_type IN (1, 6)    AND (item_localsyncupstate IN(      2,        3,        4))   AND item_scope = 2   AND rowid > %lld ORDER BY rowid ASC LIMIT %lld"), self->_dbRowID, a3, a4);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __71__BRCClientZone_documentsNotIdleEnumeratorWithStartingRowID_batchSize___block_invoke;
  v8[3] = &unk_1E875E2C8;
  v8[4] = self;
  objc_msgSend(v5, "enumerateObjects:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __71__BRCClientZone_documentsNotIdleEnumeratorWithStartingRowID_batchSize___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(v5, "session");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "session");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "clientDB");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v7, "newLocalItemFromPQLResultSet:db:error:", v6, v9, a3);

  return v10;
}

- (void)enumerateFaultsAsyncWithBlock:(id)a3 batchSize:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  unint64_t v13;

  v6 = a3;
  -[BRCClientZone taskTracker](self, "taskTracker");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCClientZone db](self, "db");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "serialQueue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __57__BRCClientZone_enumerateFaultsAsyncWithBlock_batchSize___block_invoke;
  v11[3] = &unk_1E87629D0;
  v11[4] = self;
  v12 = v6;
  v13 = a4;
  v10 = v6;
  brc_task_tracker_async_with_logs(v7, v9, v11, &__block_literal_global_137_0);

}

uint64_t __57__BRCClientZone_enumerateFaultsAsyncWithBlock_batchSize___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_enumerateFaultsWithBlock:rowID:batchSize:", *(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 48));
}

- (void)_enumerateFaultsWithBlock:(id)a3 rowID:(unint64_t)a4 batchSize:(unint64_t)a5
{
  unsigned int (**v8)(id, void *);
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  unint64_t v20;
  _QWORD v21[5];
  unsigned int (**v22)(id, void *);
  unint64_t v23;
  unint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v8 = (unsigned int (**)(id, void *))a3;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v20 = a5;
  -[BRCClientZone _faultsEnumeratorFromRow:batchSize:](self, "_faultsEnumeratorFromRow:batchSize:", a4, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v10)
  {
    v11 = v10;
    v12 = 0;
    v13 = *(_QWORD *)v26;
    while (2)
    {
      v14 = 0;
      v15 = v12 + v11;
      do
      {
        if (*(_QWORD *)v26 != v13)
          objc_enumerationMutation(v9);
        v16 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v14);
        if (!v8[2](v8, v16))
        {
          v15 = v12 + v14;
          goto LABEL_12;
        }
        a4 = objc_msgSend(v16, "dbRowID");
        ++v14;
      }
      while (v11 != v14);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      v12 = v15;
      if (v11)
        continue;
      break;
    }
  }
  else
  {
    v15 = 0;
  }
LABEL_12:

  if (v15 == v20)
  {
    -[BRCClientZone taskTracker](self, "taskTracker");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCClientZone db](self, "db");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "serialQueue");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __59__BRCClientZone__enumerateFaultsWithBlock_rowID_batchSize___block_invoke;
    v21[3] = &unk_1E8762A18;
    v21[4] = self;
    v22 = v8;
    v23 = a4;
    v24 = v20;
    brc_task_tracker_async_with_logs(v17, v19, v21, &__block_literal_global_138);

  }
}

uint64_t __59__BRCClientZone__enumerateFaultsWithBlock_rowID_batchSize___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_enumerateFaultsWithBlock:rowID:batchSize:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

- (id)_faultsEnumeratorFromRow:(unint64_t)a3 batchSize:(unint64_t)a4
{
  BRCZoneRowID *dbRowID;
  BRCPQLConnection *v8;
  id v9;
  void *v10;
  _QWORD v12[5];

  dbRowID = self->_dbRowID;
  v8 = self->_db;
  v9 = -[BRCPQLConnection fetch:](v8, "fetch:", CFSTR("SELECT rowid, zone_rowid, item_id, item_creator_id, item_sharing_options, item_side_car_ckinfo, item_parent_zone_rowid, item_localsyncupstate, item_local_diffs, item_notifs_rank, app_library_rowid, item_min_supported_os_rowid, item_user_visible, item_stat_ckinfo, item_state, item_type, item_mode, item_birthtime, item_lastusedtime, item_favoriterank,item_parent_id, item_filename, item_hidden_ext, item_finder_tags, item_xattr_signature, item_trash_put_back_path, item_trash_put_back_parent_id, item_alias_target, item_creator, item_doc_id, item_file_id, item_generation, item_localname, item_processing_stamp, item_staged_file_id, item_staged_generation, item_bouncedname, item_scope, item_tmpbounceno, version_name, version_ckinfo, version_mtime, version_size, version_thumb_size, version_thumb_signature, version_content_signature, version_xattr_signature, version_edited_since_shared, version_device, version_conflict_loser_etags, version_quarantine_info, version_uploaded_assets, version_upload_error, version_old_zone_item_id, version_old_zone_rowid, desired_version, item_live_conflict_loser_etags, item_thumb_live_signature, item_thumb_greedy, version_block_sync_until_bundle_id, version_block_sync_until_timestamp FROM client_items WHERE zone_rowid = %@    AND rowid > %llu   AND item_type = 2 ORDER BY rowid LIMIT %lu"), dbRowID, a3, a4);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __52__BRCClientZone__faultsEnumeratorFromRow_batchSize___block_invoke;
  v12[3] = &unk_1E875E2C8;
  v12[4] = self;
  objc_msgSend(v9, "enumerateObjects:", v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

id __52__BRCClientZone__faultsEnumeratorFromRow_batchSize___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(v5, "session");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "session");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "clientDB");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v7, "newLocalItemFromPQLResultSet:db:error:", v6, v9, a3);

  return v10;
}

- (void)didClearOutOfQuota
{
  uint64_t v0;
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  OUTLINED_FUNCTION_11_0(*MEMORY[0x1E0C80C00]);
  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v1, v2, "[DEBUG] Sync: updated sync-up throttle: %@%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_2();
}

- (unsigned)syncState
{
  return atomic_load(&self->_syncState);
}

- (void)setSyncStateBits:(unsigned int)a3
{
  _BOOL4 v5;
  void *v6;
  NSObject *v7;
  unsigned int *p_syncState;
  unsigned int v9;
  unsigned int v10;
  void *v11;
  NSObject *v12;
  void *v13;
  BRMangledID *mangledID;
  uint64_t v15;
  unsigned int v16;
  uint64_t v17;
  void *v18;
  void *v20;
  NSObject *v21;
  __CFString *v22;
  int v23;
  BRCClientZone *v24;
  __int16 v25;
  __CFString *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = -[BRCClientZone isSyncBlocked](self, "isSyncBlocked");
  if ((a3 & 3) != 0 && v5)
  {
    brc_bread_crumbs();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      -[BRCClientZone setSyncStateBits:].cold.2();

    -[BRCClientZone clearSyncStateBits:](self, "clearSyncStateBits:", 3);
    a3 &= 0xFFFFFFFC;
  }
  p_syncState = &self->_syncState;
  do
  {
    v9 = __ldaxr(p_syncState);
    v10 = v9 | a3;
  }
  while (__stlxr(v9 | a3, p_syncState));
  -[BRCPQLConnection assertOnQueue](self->_db, "assertOnQueue");
  if (v9 != v10)
  {
    brc_bread_crumbs();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      if (v9)
      {
        BRCPrettyPrintBitmap();
        v22 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v22 = CFSTR("idle");
      }
      v23 = 138412802;
      v24 = self;
      v25 = 2112;
      v26 = v22;
      v27 = 2112;
      v28 = v11;
      _os_log_debug_impl(&dword_1CBD43000, v12, OS_LOG_TYPE_DEBUG, "[DEBUG] sync state changed: %@, was %@%@", (uint8_t *)&v23, 0x20u);

    }
    v13 = (void *)MEMORY[0x1E0D10E48];
    mangledID = self->_mangledID;
    v15 = *MEMORY[0x1E0D10B88];
    if ((v10 & 0xA) != 0)
      v16 = (2 * ((v10 & 5) != 0)) | 4;
    else
      v16 = 2 * ((v10 & 5) != 0);
    if (v16 <= 1)
      v17 = 1;
    else
      v17 = v16;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "postContainerStatusChangeNotificationWithID:key:value:", mangledID, v15, v18);

  }
  if ((v9 & 0xF) == 0 && (v10 & 0xF) != 0)
    -[BRCClientZone setStateBits:](self, "setStateBits:", 16);
  if ((v9 & 0x20) != 0 || (v10 & 0x20) == 0)
  {
    if ((v10 & 0x23) == 1)
    {
      brc_bread_crumbs();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
        -[BRCClientZone setSyncStateBits:].cold.1();

      -[BRCClientZone setSyncStateBits:](self, "setSyncStateBits:", 2);
    }
  }
  else
  {
    -[BRCClientZoneDelegate didInitialSyncDownForClientZone:](self->_delegate, "didInitialSyncDownForClientZone:", self);
  }
  if ((a3 & ~v9 & 3) != 0)
    -[BRCDeadlineSource signal](self->_syncDeadlineSource, "signal");
  -[BRCClientZone _flushIdleBlocksIfNeeded](self, "_flushIdleBlocksIfNeeded");
}

- (void)clearSyncStateBits:(unsigned int)a3
{
  unsigned int *p_syncState;
  unsigned int v5;
  unsigned int v6;
  int v7;
  void *v8;
  NSObject *v9;
  void *v10;
  BRMangledID *mangledID;
  uint64_t v12;
  unsigned int v13;
  uint64_t v14;
  void *v15;
  __CFString *v17;
  int v18;
  BRCClientZone *v19;
  __int16 v20;
  __CFString *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  p_syncState = &self->_syncState;
  v5 = ~a3;
  do
  {
    v6 = __ldaxr(p_syncState);
    v7 = v6 & v5;
  }
  while (__stlxr(v6 & v5, p_syncState));
  -[BRCPQLConnection assertOnQueue](self->_db, "assertOnQueue");
  if (v6 != v7)
  {
    brc_bread_crumbs();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      if (v6)
      {
        BRCPrettyPrintBitmap();
        v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v17 = CFSTR("idle");
      }
      v18 = 138412802;
      v19 = self;
      v20 = 2112;
      v21 = v17;
      v22 = 2112;
      v23 = v8;
      _os_log_debug_impl(&dword_1CBD43000, v9, OS_LOG_TYPE_DEBUG, "[DEBUG] %@ sync state changed, was %@%@", (uint8_t *)&v18, 0x20u);

    }
    v10 = (void *)MEMORY[0x1E0D10E48];
    mangledID = self->_mangledID;
    v12 = *MEMORY[0x1E0D10B88];
    if ((v7 & 0xA) != 0)
      v13 = (2 * ((v7 & 5) != 0)) | 4;
    else
      v13 = 2 * ((v7 & 5) != 0);
    if (v13 <= 1)
      v14 = 1;
    else
      v14 = v13;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "postContainerStatusChangeNotificationWithID:key:value:", mangledID, v12, v15);

  }
  if ((v6 & 0xF) != 0 && (v7 & 0xF) == 0)
    -[BRCClientZone clearStateBits:](self, "clearStateBits:", 16);
}

- (void)addSyncDownDependency:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  NSObject *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  id location;

  v4 = a3;
  objc_msgSend(v4, "completionBlock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, v4);
  v6 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __39__BRCClientZone_addSyncDownDependency___block_invoke;
  v13[3] = &unk_1E8762A60;
  v7 = v5;
  v13[4] = self;
  v14 = v7;
  objc_copyWeak(&v15, &location);
  objc_msgSend(v4, "setCompletionBlock:", v13);
  -[BRCAccountSession clientDB](self->_session, "clientDB");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "serialQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  v11[0] = v6;
  v11[1] = 3221225472;
  v11[2] = __39__BRCClientZone_addSyncDownDependency___block_invoke_2;
  v11[3] = &unk_1E875D470;
  v11[4] = self;
  v12 = v4;
  v10 = v4;
  dispatch_async(v9, v11);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

}

void __39__BRCClientZone_addSyncDownDependency___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id WeakRetained;

  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  v3 = *(void **)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(v3, "removeSyncDownDependency:", WeakRetained);

}

void __39__BRCClientZone_addSyncDownDependency___block_invoke_2(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 432), "addObject:", *(_QWORD *)(a1 + 40));
  brc_bread_crumbs();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    v6 = 138412802;
    v7 = v4;
    v8 = 2112;
    v9 = v5;
    v10 = 2112;
    v11 = v2;
    _os_log_debug_impl(&dword_1CBD43000, v3, OS_LOG_TYPE_DEBUG, "[DEBUG] added %@ as a sync-down dependency of %@%@", (uint8_t *)&v6, 0x20u);
  }

}

- (void)addOutOfBandOperation:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  NSObject *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  id location;

  v4 = a3;
  objc_msgSend(v4, "completionBlock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, v4);
  v6 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __39__BRCClientZone_addOutOfBandOperation___block_invoke;
  v13[3] = &unk_1E8762A60;
  v7 = v5;
  v13[4] = self;
  v14 = v7;
  objc_copyWeak(&v15, &location);
  objc_msgSend(v4, "setCompletionBlock:", v13);
  -[BRCAccountSession clientDB](self->_session, "clientDB");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "serialQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  v11[0] = v6;
  v11[1] = 3221225472;
  v11[2] = __39__BRCClientZone_addOutOfBandOperation___block_invoke_2;
  v11[3] = &unk_1E875D470;
  v11[4] = self;
  v12 = v4;
  v10 = v4;
  dispatch_async(v9, v11);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

}

void __39__BRCClientZone_addOutOfBandOperation___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id WeakRetained;

  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  v3 = *(void **)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(v3, "removeOutOfBandOperation:", WeakRetained);

}

void __39__BRCClientZone_addOutOfBandOperation___block_invoke_2(uint64_t a1)
{
  void *v1;
  NSObject *v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 448), "addObject:", *(_QWORD *)(a1 + 40));
  brc_bread_crumbs();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __39__BRCClientZone_addOutOfBandOperation___block_invoke_2_cold_1();

}

- (void)removeOutOfBandOperation:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  -[BRCAccountSession clientDB](self->_session, "clientDB");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "serialQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __42__BRCClientZone_removeOutOfBandOperation___block_invoke;
  v8[3] = &unk_1E875D470;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_async(v6, v8);

}

void __42__BRCClientZone_removeOutOfBandOperation___block_invoke(uint64_t a1)
{
  void *v1;
  NSObject *v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 448), "removeObject:", *(_QWORD *)(a1 + 40));
  brc_bread_crumbs();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __42__BRCClientZone_removeOutOfBandOperation___block_invoke_cold_1();

}

- (void)_cancelOutOfBandOperations
{
  NSMutableArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  -[BRCPQLConnection assertOnQueue](self->_db, "assertOnQueue");
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  v3 = self->_outOfBandSyncOperations;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "cancel", (_QWORD)v8);
      }
      while (v5 != v7);
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (void)removeSyncDownDependency:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  -[BRCAccountSession clientDB](self->_session, "clientDB");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "serialQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __42__BRCClientZone_removeSyncDownDependency___block_invoke;
  v8[3] = &unk_1E875D470;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_async(v6, v8);

}

void __42__BRCClientZone_removeSyncDownDependency___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 432), "removeObject:", *(_QWORD *)(a1 + 40));
  brc_bread_crumbs();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    v6 = 138412802;
    v7 = v4;
    v8 = 2112;
    v9 = v5;
    v10 = 2112;
    v11 = v2;
    _os_log_debug_impl(&dword_1CBD43000, v3, OS_LOG_TYPE_DEBUG, "[DEBUG] removed %@ as a sync-down dependency of %@%@", (uint8_t *)&v6, 0x20u);
  }

}

- (BOOL)_blockExistingOperationIfNecessary:(id)a3 onNewOperation:(id)a4 considerPriority:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  BOOL v10;
  int v11;
  int v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  NSObject *v20;
  int v22;
  id v23;
  __int16 v24;
  id v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v5 = a5;
  v28 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if ((-[NSMutableArray containsObject:](self->_blockedOperationsOnInitialSync, "containsObject:", v8) & 1) == 0)
  {
    if (v5)
    {
      v11 = objc_msgSend(v8, "nonDiscretionary");
      v12 = objc_msgSend(v9, "nonDiscretionary");
      if (v11)
      {
        if (!v12)
          goto LABEL_11;
      }
    }
    if ((objc_msgSend(v8, "isExecuting") & 1) != 0)
      goto LABEL_11;
    objc_msgSend(v8, "nextTryDate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "timeIntervalSinceNow");
    v15 = v14;
    +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "throttleThresholdToBlockExistingOpOnNewOp");
    v18 = v17;

    if (v15 <= v18)
    {
LABEL_11:
      v10 = 0;
      goto LABEL_12;
    }
    brc_bread_crumbs();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      v22 = 138412802;
      v23 = v8;
      v24 = 2112;
      v25 = v9;
      v26 = 2112;
      v27 = v19;
      _os_log_debug_impl(&dword_1CBD43000, v20, OS_LOG_TYPE_DEBUG, "[DEBUG] Existing op %@ is heavily throttled. Blocking execution on incoming op %@%@", (uint8_t *)&v22, 0x20u);
    }

    objc_msgSend(v8, "addDependency:", v9);
  }
  v10 = 1;
LABEL_12:

  return v10;
}

- (void)_blockSyncDownOnStitchingOperations
{
  uint64_t v0;
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  OUTLINED_FUNCTION_11_0(*MEMORY[0x1E0C80C00]);
  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v1, v2, "[DEBUG] Sync down has greater priority than %@%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_2();
}

- (id)syncDownImmediately
{
  void *v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  BRMangledID *mangledID;
  BRCClientZone *v9;
  BRCMigrationQueryOperation *v10;
  NSObject *v11;
  BRCSyncDownOperation *v12;
  BRCSyncDownOperation *syncDownOperation;
  void *v14;
  CKOperationGroup *syncDownGroup;
  NSMutableArray *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  NSObject *v22;
  void *v23;
  NSObject *v24;
  BRCSyncDownOperation *v25;
  id v27;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  id v33;
  uint64_t v34[3];
  uint8_t v35[128];
  uint8_t buf[4];
  uint64_t v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  void *v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  -[BRCPQLConnection assertOnQueue](self->_db, "assertOnQueue");
  memset(v34, 0, sizeof(v34));
  __brc_create_section(1, (uint64_t)"-[BRCClientZone syncDownImmediately]", 1670, v34);
  brc_bread_crumbs();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = v34[0];
    -[BRCClientZone mangledID](self, "mangledID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218498;
    v37 = v5;
    v38 = 2112;
    v39 = v6;
    v40 = 2112;
    v41 = v3;
    _os_log_impl(&dword_1CBD43000, v4, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@: starting sync down%@", buf, 0x20u);

  }
  if (self->_activated)
  {
    -[BRCAccountSession serverState](self->_session, "serverState");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    mangledID = self->_mangledID;
    v33 = 0;
    objc_msgSend(v7, "migrationQueryKeyForMangledID:continuationCursor:", mangledID, &v33);
    v28 = objc_claimAutoreleasedReturnValue();
    v27 = v33;

    v9 = self;
    objc_sync_enter(v9);
    if (v28)
      v10 = -[BRCMigrationQueryOperation initWithServerZone:migrationKey:continuationCursor:sessionContext:]([BRCMigrationQueryOperation alloc], "initWithServerZone:migrationKey:continuationCursor:sessionContext:", v9->_serverZone, v28, v27, self->_session);
    else
      v10 = -[BRCSyncDownOperation initDeltaSyncWithServerZone:sessionContext:]([BRCSyncDownOperation alloc], "initDeltaSyncWithServerZone:sessionContext:", v9->_serverZone, self->_session);
    syncDownOperation = v9->_syncDownOperation;
    v9->_syncDownOperation = &v10->super;

    -[BRCClientZone _blockSyncDownOnStitchingOperations](v9, "_blockSyncDownOnStitchingOperations");
    objc_sync_exit(v9);

    if (v9->_syncDownGroup)
    {
      -[_BRCOperation setGroup:](v9->_syncDownOperation, "setGroup:");
    }
    else
    {
      if (-[BRCServerZone hasFetchedServerZoneState](v9->_serverZone, "hasFetchedServerZoneState"))
        objc_msgSend(MEMORY[0x1E0C94F88], "br_syncDown");
      else
        objc_msgSend(MEMORY[0x1E0C94F88], "br_syncDownInitial");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[_BRCOperation setGroup:](v9->_syncDownOperation, "setGroup:", v14, v27);

    }
    if (v28)
    {
      syncDownGroup = v9->_syncDownGroup;
      v9->_syncDownGroup = 0;

    }
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v16 = v9->_syncDownDependencies;
    v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
    if (v17)
    {
      v18 = *(_QWORD *)v30;
      do
      {
        v19 = 0;
        do
        {
          if (*(_QWORD *)v30 != v18)
            objc_enumerationMutation(v16);
          v20 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * v19);
          brc_bread_crumbs();
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v22 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412546;
            v37 = v20;
            v38 = 2112;
            v39 = v21;
            _os_log_debug_impl(&dword_1CBD43000, v22, OS_LOG_TYPE_DEBUG, "[DEBUG] adding sync down dependency: %@%@", buf, 0x16u);
          }

          -[_BRCOperation addDependency:](v9->_syncDownOperation, "addDependency:", v20);
          ++v19;
        }
        while (v17 != v19);
        v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
      }
      while (v17);
    }

    -[NSMutableArray addObjectsFromArray:](v9->_currentSyncDownBarriers, "addObjectsFromArray:", v9->_nextSyncDownBarriers);
    -[NSMutableArray removeAllObjects](v9->_nextSyncDownBarriers, "removeAllObjects");
    -[BRCClientZone setSyncStateBits:](v9, "setSyncStateBits:", 8);
    -[BRCClientZone clearSyncStateBits:](v9, "clearSyncStateBits:", 2);
    -[BRCSyncOperationThrottle updateAfterSchedulingTask](v9->_syncDownThrottle, "updateAfterSchedulingTask");
    brc_bread_crumbs();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
      -[BRCClientZone syncDownImmediately].cold.2();

    -[BRCClientZone _cancelOutOfBandOperations](v9, "_cancelOutOfBandOperations");
    -[_BRCOperation schedule](v9->_syncDownOperation, "schedule");
    v25 = v9->_syncDownOperation;
    v9->_syncDeadlineSourceResumer = v25;
    v12 = v25;
    v11 = v28;
  }
  else
  {
    brc_bread_crumbs();
    v27 = (id)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      -[BRCClientZone syncDownImmediately].cold.1();
    v12 = 0;
  }

  __brc_leave_section(v34);
  return v12;
}

- (unsigned)_appLibrariesState
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  unsigned int v7;
  uint64_t v8;
  uint64_t i;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (!-[BRCClientZone isPrivateZone](self, "isPrivateZone"))
    return 0;
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[BRCClientZone asPrivateClientZone](self, "asPrivateClientZone", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appLibraries");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v4);
        v7 |= objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "state");
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)_startSync
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: _syncDownOperation == nil%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

BOOL __27__BRCClientZone__startSync__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  double v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  id v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  NSObject *v21;
  void *v22;
  double v23;
  _QWORD v25[5];
  id v26;
  id v27;
  id location;
  unint64_t v29;

  v3 = a2;
  brc_current_date_nsec();
  v29 = 0;
  v4 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(v4 + 8);
  v5 = *(_QWORD *)(v4 + 16);
  objc_msgSend(v6, "syncUpScheduler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v8) = *(_DWORD *)(a1 + 64);
  +[BRCSyncUpOperation syncUpOperationForZone:sessionContext:syncUpCallback:maxCost:retryAfter:](BRCSyncUpOperation, "syncUpOperationForZone:sessionContext:syncUpCallback:maxCost:retryAfter:", v5, v6, v7, &v29, v8);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v9;

  objc_msgSend(MEMORY[0x1E0C94F88], "br_syncUp");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setGroup:", v12);

  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 104), *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
  brc_current_date_nsec();
  v13 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 104);
  if (v13)
  {
    brc_bread_crumbs();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      __27__BRCClientZone__startSync__block_invoke_cold_1();

    objc_msgSend(*(id *)(a1 + 32), "setSyncStateBits:", 4);
    objc_initWeak(&location, *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __27__BRCClientZone__startSync__block_invoke_145;
    v25[3] = &unk_1E8762AB0;
    objc_copyWeak(&v27, &location);
    v25[4] = *(_QWORD *)(a1 + 32);
    v16 = v3;
    v26 = v16;
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setSyncUpCompletionBlock:", v25);
    objc_msgSend(v16, "forceBatchStart");
    objc_msgSend(v16, "makeNextFlushFullSync");

    objc_destroyWeak(&v27);
    objc_destroyWeak(&location);
  }
  else
  {
    if (v29 < 0x7FFFFFFFFFFFFFFFLL)
    {
      brc_bread_crumbs();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
        __27__BRCClientZone__startSync__block_invoke_cold_3();

      v19 = v29 + *(_QWORD *)(a1 + 56);
    }
    else
    {
      brc_bread_crumbs();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        __27__BRCClientZone__startSync__block_invoke_cold_2();

      objc_msgSend(*(id *)(a1 + 32), "clearSyncStateBits:", 1);
      v19 = 0x7FFFFFFFFFFFFFFFLL;
    }
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 88) = v19;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 88);
    v22 = *(void **)(*(_QWORD *)(a1 + 32) + 152);
    brc_interval_from_nsec();
    objc_msgSend(v22, "updateAfterSchedulingTaskWithMinimumDelay:", v23 * 10.0);
  }

  return v13 != 0;
}

void __27__BRCClientZone__startSync__block_invoke_145(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id WeakRetained;
  void *v11;
  char v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  char v23;
  id v24;
  _QWORD v25[4];
  id v26;
  id v27;
  id v28;
  id v29;
  char v30;
  char v31;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v24 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "createdAppLibraryNames");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v24, "encounteredErrorOnPCSChainedItem");
    v12 = objc_msgSend(v24, "throttledItemInBatch");
    v13 = objc_msgSend(v9, "brc_isCloudKitOutOfQuota");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "fsUploader");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "serverZone");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "ownerName");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
      objc_msgSend(v14, "ownerDidReceiveOutOfQuotaError:", v16);
    else
      objc_msgSend(v14, "scheduleQuotaFetchIfNeededForOwner:", v16);

    v17 = v23;
  }
  else
  {
    v17 = 0;
    v12 = 0;
    v11 = 0;
  }
  v18 = *(void **)(a1 + 40);
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __27__BRCClientZone__startSync__block_invoke_2;
  v25[3] = &unk_1E8762A88;
  v26 = v7;
  v27 = v8;
  v28 = v11;
  v29 = v9;
  v30 = v17;
  v31 = v12;
  v19 = v9;
  v20 = v11;
  v21 = v8;
  v22 = v7;
  objc_msgSend(v18, "performWithFlags:action:", 4, v25);

}

uint64_t __27__BRCClientZone__startSync__block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_syncUpOfRecords:createdAppLibraryNames:didFinishWithError:errorWasOnPCSChainedItem:throttledItemInBatch:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(unsigned __int8 *)(a1 + 64), *(unsigned __int8 *)(a1 + 65));
  return 1;
}

uint64_t __27__BRCClientZone__startSync__block_invoke_149(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;

  v2 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v2 + 104))
  {
    objc_msgSend(*(id *)(v2 + 152), "updateAfterSchedulingTask");
  }
  else
  {
    brc_bread_crumbs();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      __27__BRCClientZone__startSync__block_invoke_149_cold_2(a1);

    if ((objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "isCancelled") & 1) == 0)
    {
      brc_bread_crumbs();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
        __27__BRCClientZone__startSync__block_invoke_149_cold_1();

      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "cancel");
    }
  }
  objc_msgSend(*(id *)(a1 + 32), "_cancelOutOfBandOperations");
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "schedule");
}

- (void)scheduleSyncUp
{
  -[BRCPQLConnection assertOnQueue](self->_db, "assertOnQueue");
  -[BRCClientZone setSyncStateBits:](self, "setSyncStateBits:", 1);
  self->_syncUpRetryAfter = 0;
}

- (void)scheduleSyncDownWithGroup:(id)a3
{
  id v5;

  v5 = a3;
  -[BRCPQLConnection assertOnQueue](self->_db, "assertOnQueue");
  if (!self->_syncDownGroup)
    objc_storeStrong((id *)&self->_syncDownGroup, a3);
  -[BRCClientZone setSyncStateBits:](self, "setSyncStateBits:", 2);

}

- (void)scheduleSyncDown
{
  -[BRCClientZone scheduleSyncDownWithGroup:](self, "scheduleSyncDownWithGroup:", 0);
}

- (void)scheduleSyncDownFirst
{
  -[BRCPQLConnection assertOnQueue](self->_db, "assertOnQueue");
  -[BRCClientZone setSyncStateBits:](self, "setSyncStateBits:", 66);
}

- (void)scheduleSyncDownForOOBModifyRecordsAck
{
  -[BRCPQLConnection assertOnQueue](self->_db, "assertOnQueue");
  -[BRCClientZone setSyncStateBits:](self, "setSyncStateBits:", 194);
}

- (void)resetSyncBudgetAndThrottle
{
  NSError *lastSyncDownError;
  NSError *lastSyncUpError;

  -[BRCPQLConnection assertOnQueue](self->_db, "assertOnQueue");
  lastSyncDownError = self->_lastSyncDownError;
  self->_lastSyncDownError = 0;

  lastSyncUpError = self->_lastSyncUpError;
  self->_lastSyncUpError = 0;

  -[BRCSyncBudgetThrottle clear](self->_syncUpBudget, "clear");
  -[BRCSyncOperationThrottle clear](self->_syncUpThrottle, "clear");
  -[BRCSyncOperationBackoffRatio clear](self->_syncUpBackoffRatio, "clear");
  -[BRCSyncOperationThrottle clear](self->_syncDownThrottle, "clear");
  -[BRCDeadlineSource signal](self->_syncDeadlineSource, "signal");
}

- (void)clearSyncUpError
{
  NSError *lastSyncUpError;

  lastSyncUpError = self->_lastSyncUpError;
  self->_lastSyncUpError = 0;

}

- (void)prepareDirectoryForSyncUp:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  NSMutableArray *v7;
  NSMutableArray *directoriesCreatedLastSyncUp;
  void *v9;
  int v10;
  id v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((objc_msgSend(v4, "isKnownByServer") & 1) == 0
    && (objc_msgSend(v4, "localDiffs") & 0x400000000000000) == 0
    && (-[BRCServerZone state](self->_serverZone, "state") & 4) == 0)
  {
    brc_bread_crumbs();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 138412546;
      v11 = v4;
      v12 = 2112;
      v13 = v5;
      _os_log_impl(&dword_1CBD43000, v6, OS_LOG_TYPE_DEFAULT, "[NOTICE] Item %@ isn't known by the server so marking it as created by the current device%@", (uint8_t *)&v10, 0x16u);
    }

    v7 = self->_directoriesCreatedLastSyncUp;
    objc_sync_enter(v7);
    directoriesCreatedLastSyncUp = self->_directoriesCreatedLastSyncUp;
    objc_msgSend(v4, "itemID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](directoriesCreatedLastSyncUp, "addObject:", v9);

    objc_sync_exit(v7);
  }

}

- (id)directoryItemIDsCreatedLastSyncUp
{
  NSMutableArray *v3;
  void *v4;

  v3 = self->_directoriesCreatedLastSyncUp;
  objc_sync_enter(v3);
  if (-[NSMutableArray count](self->_directoriesCreatedLastSyncUp, "count"))
  {
    v4 = (void *)-[NSMutableArray copy](self->_directoriesCreatedLastSyncUp, "copy");
    -[NSMutableArray removeAllObjects](self->_directoriesCreatedLastSyncUp, "removeAllObjects");
  }
  else
  {
    v4 = 0;
  }
  objc_sync_exit(v3);

  return v4;
}

- (void)_markLatestSyncRequestFailed
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
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
  -[BRCClientZone itemsWithInFlightDiffsEnumerator](self, "itemsWithInFlightDiffsEnumerator", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * v7);
        -[BRCServerZone dbRowID](self->_serverZone, "dbRowID");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "markLatestSyncRequestFailedInZone:", v9);

        objc_msgSend(v8, "saveToDB");
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

  -[BRCClientZone _markRequestIDAcked](self, "_markRequestIDAcked");
}

- (void)_markRequestIDAcked
{
  -[BRCPQLConnection assertOnQueue](self->_db, "assertOnQueue");
  -[BRCClientZone setNeedsSave:](self, "setNeedsSave:", 1);
  self->_requestID |= 1uLL;
}

- (unint64_t)allocateSyncUpRequestID
{
  -[BRCPQLConnection assertOnQueue](self->_db, "assertOnQueue");
  -[BRCClientZone setNeedsSave:](self, "setNeedsSave:", 1);
  self->_requestID = (self->_requestID | 1) + 1;
  -[BRCClientZone setSyncStateBits:](self, "setSyncStateBits:", 256);
  return self->_requestID;
}

- (void)learnCKInfosFromSavedRecords:(id)a3 isOutOfBandModifyRecords:(BOOL)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  BRFieldCKInfo *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  BRFieldCKInfo *v22;
  BRFieldCKInfo *v23;
  void *v24;
  id v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  BRCClientZone *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  int v37;
  void *v38;
  NSObject *v39;
  BRCPQLConnection *v40;
  void *v41;
  int v42;
  void *v43;
  NSObject *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  NSObject *v48;
  BRCPQLConnection *v49;
  BRCClientZone *v50;
  void *v51;
  void *v52;
  NSObject *v53;
  BRCPQLConnection *v54;
  void *v55;
  NSObject *v56;
  BRCPQLConnection *v57;
  void *v58;
  BRCPQLConnection *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  uint64_t v65;
  uint64_t v66;
  int v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  _BOOL4 v74;
  BRFieldCKInfo *v75;
  BRCPQLConnection *db;
  uint64_t v77;
  void *v78;
  void *v79;
  void *v80;
  id obj;
  BRCClientZone *v82;
  uint64_t v83;
  _QWORD v84[4];
  BRFieldCKInfo *v85;
  _QWORD v86[4];
  BRFieldCKInfo *v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  uint8_t buf[4];
  void *v93;
  __int16 v94;
  void *v95;
  __int16 v96;
  void *v97;
  __int16 v98;
  void *v99;
  _BYTE v100[128];
  uint64_t v101;

  v74 = a4;
  v101 = *MEMORY[0x1E0C80C00];
  v88 = 0u;
  v89 = 0u;
  v90 = 0u;
  v91 = 0u;
  obj = a3;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v88, v100, 16);
  if (v5)
  {
    v6 = v5;
    v83 = *(_QWORD *)v89;
    v82 = self;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v89 != v83)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v88 + 1) + 8 * v7);
        v9 = (void *)MEMORY[0x1D17A6BE8]();
        v10 = -[BRFieldCKInfo initWithRecord:]([BRFieldCKInfo alloc], "initWithRecord:", v8);
        objc_msgSend(v8, "recordID");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "brc_itemIDWithSession:", self->_session);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v8, "brc_updateDroppedReason");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "brc_oplockMergeEtag");
        v14 = objc_claimAutoreleasedReturnValue();
        v15 = (void *)v14;
        if (v13)
        {
          brc_bread_crumbs();
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(v8, "recordID");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412802;
            v93 = v18;
            v94 = 2112;
            v95 = v13;
            v96 = 2112;
            v97 = v16;
            _os_log_debug_impl(&dword_1CBD43000, v17, OS_LOG_TYPE_DEBUG, "[DEBUG] Not learning anything about %@ because the update was dropped: %@%@", buf, 0x20u);

          }
LABEL_12:

          self = v82;
          goto LABEL_13;
        }
        if (v14)
        {
          brc_bread_crumbs();
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(v8, "recordID");
            v80 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "etag");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138413058;
            v93 = v80;
            v94 = 2112;
            v95 = v15;
            v96 = 2112;
            v97 = v29;
            v98 = 2112;
            v99 = v16;
            _os_log_debug_impl(&dword_1CBD43000, v17, OS_LOG_TYPE_DEBUG, "[DEBUG] Not learning anything about %@ because the server merged ETag %@ to produce %@%@", buf, 0x2Au);

          }
          goto LABEL_12;
        }
        if (v12)
        {
          if ((objc_msgSend(v12, "isNonDesktopRoot") & 1) == 0)
          {
            -[BRFieldCKInfo etag](v10, "etag");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = objc_msgSend(v19, "length");

            self = v82;
            if (v20)
            {
              v77 = v6;
              v21 = MEMORY[0x1E0C809B0];
              v86[0] = MEMORY[0x1E0C809B0];
              v86[1] = 3221225472;
              v86[2] = __71__BRCClientZone_learnCKInfosFromSavedRecords_isOutOfBandModifyRecords___block_invoke;
              v86[3] = &unk_1E875E1A8;
              v22 = v10;
              v87 = v22;
              v79 = (void *)MEMORY[0x1D17A6DB0](v86);
              v84[0] = v21;
              v84[1] = 3221225472;
              v84[2] = __71__BRCClientZone_learnCKInfosFromSavedRecords_isOutOfBandModifyRecords___block_invoke_152;
              v84[3] = &unk_1E875E1A8;
              v23 = v22;
              v85 = v23;
              v78 = (void *)MEMORY[0x1D17A6DB0](v84);
              objc_msgSend(v8, "recordType");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              LODWORD(v21) = objc_msgSend(v24, "isEqualToString:", CFSTR("structure"));

              v75 = v23;
              if ((_DWORD)v21)
              {
                v25 = -[PQLConnection numberWithSQL:](v82->_db, "numberWithSQL:", CFSTR("SELECT item_stat_ckinfo IS NULL FROM client_items  WHERE zone_rowid = %@ AND item_id = %@    AND item_type IN (1, 2, 8, 5, 6, 7)"), v82->_dbRowID, v12);
                brc_bread_crumbs();
                v71 = (void *)objc_claimAutoreleasedReturnValue();
                brc_default_log();
                v26 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
                {
                  -[BRFieldCKInfo etag](v23, "etag");
                  v70 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412802;
                  v93 = v12;
                  v94 = 2112;
                  v95 = v70;
                  v96 = 2112;
                  v97 = v71;
                  _os_log_debug_impl(&dword_1CBD43000, v26, OS_LOG_TYPE_DEBUG, "[DEBUG] Learn structural ETag for %@: %@%@", buf, 0x20u);

                }
                v72 = v25;
                v6 = v77;
                if (objc_msgSend(v25, "BOOLValue"))
                {
                  -[BRCClientZone itemByItemID:](v82, "itemByItemID:", v12);
                  v27 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v27, "st");
                  v28 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v28, "setCkInfo:", v75);

                  objc_msgSend(v27, "saveToDB");
                  goto LABEL_24;
                }
                self = v82;
                db = v82->_db;
                v34 = (void *)MEMORY[0x1D17A6DB0](v79);
                -[BRCPQLConnection execute:](db, "execute:", CFSTR("UPDATE client_items SET item_stat_ckinfo = call_block(%p, item_stat_ckinfo, version_old_zone_item_id IS NOT NULL) WHERE zone_rowid = %@ AND item_id = %@"), v34, v82->_dbRowID, v12);

                if (!-[BRCPQLConnection changes](v82->_db, "changes"))
                {
                  objc_msgSend(v8, "recordID");
                  v35 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v35, "recordName");
                  v36 = (void *)objc_claimAutoreleasedReturnValue();
                  v37 = objc_msgSend(v36, "hasPrefix:", CFSTR("documentStructure/"));

                  self = v82;
                  if (v37)
                  {
                    brc_bread_crumbs();
                    v38 = (void *)objc_claimAutoreleasedReturnValue();
                    brc_default_log();
                    v39 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 138412546;
                      v93 = v12;
                      v94 = 2112;
                      v95 = v38;
                      _os_log_impl(&dword_1CBD43000, v39, OS_LOG_TYPE_DEFAULT, "[WARNING] Couldn't locate the item to learn stat info for %@, checking to see if it has undergone a CZM%@", buf, 0x16u);
                    }

                    v40 = v82->_db;
                    v27 = (void *)MEMORY[0x1D17A6DB0](v78);
                    -[BRCPQLConnection execute:](v40, "execute:", CFSTR("UPDATE client_items SET item_stat_ckinfo = call_block(%p, item_stat_ckinfo) WHERE version_old_zone_rowid = %@ AND version_old_zone_item_id = %@"), v27, v82->_dbRowID, v12);
LABEL_24:

                    self = v82;
                  }
                }
LABEL_48:

              }
              else
              {
                objc_msgSend(v8, "recordType");
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                v31 = objc_msgSend(v30, "isEqualToString:", CFSTR("content"));

                if (v31)
                {
                  v32 = v82;
                  v6 = v77;
                  v67 = objc_msgSend(v8, "brc_currentUserOwnsLastEditorDeviceWithSessionContext:", v82->_session);
                  if (v67)
                  {
                    objc_msgSend(v8, "brc_lastEditorDeviceName");
                    v73 = (void *)objc_claimAutoreleasedReturnValue();
                    -[BRCAccountSession deviceKeyForName:db:](v82->_session, "deviceKeyForName:db:");
                    v33 = objc_claimAutoreleasedReturnValue();
                  }
                  else
                  {
                    -[BRCAccountSession cachedCurrentUserRecordName](v82->_session, "cachedCurrentUserRecordName");
                    v45 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v8, "brc_lastModifiedUserRecordNameWithCurrentUserRecordName:personNameComponents:", v45, 0);
                    v46 = objc_claimAutoreleasedReturnValue();

                    v68 = (void *)MEMORY[0x1E0CB37E8];
                    v73 = (void *)v46;
                    -[BRCAccountSession userKeyForOwnerName:db:](v82->_session, "userKeyForOwnerName:db:", v46, v82->_db);
                    v47 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v68, "numberWithLongLong:", -objc_msgSend(v47, "longLongValue"));
                    v33 = objc_claimAutoreleasedReturnValue();

                    v32 = v82;
                  }

                  v72 = (void *)v33;
                  if (v33)
                  {
                    brc_bread_crumbs();
                    v69 = (void *)objc_claimAutoreleasedReturnValue();
                    brc_default_log();
                    v48 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG))
                    {
                      -[BRFieldCKInfo etag](v75, "etag");
                      v61 = (void *)objc_claimAutoreleasedReturnValue();
                      if (v67)
                        objc_msgSend(v8, "brc_lastEditorDeviceName");
                      else
                        objc_msgSend(v8, "modifiedByDevice");
                      v64 = (void *)objc_claimAutoreleasedReturnValue();
                      *(_DWORD *)buf = 138413058;
                      v93 = v12;
                      v94 = 2112;
                      v95 = v61;
                      v96 = 2112;
                      v97 = v64;
                      v98 = 2112;
                      v99 = v69;
                      _os_log_debug_impl(&dword_1CBD43000, v48, OS_LOG_TYPE_DEBUG, "[DEBUG] Learn content ETag and Last Editor for %@: %@, %@%@", buf, 0x2Au);

                      v32 = v82;
                    }

                    v49 = v32->_db;
                    v50 = v32;
                    v51 = (void *)MEMORY[0x1D17A6DB0](v79);
                    -[BRCPQLConnection execute:](v49, "execute:", CFSTR("UPDATE client_items SET version_ckinfo = call_block(%p, version_ckinfo, version_old_zone_item_id IS NOT NULL), version_device = %@ WHERE zone_rowid = %@ AND item_id = %@"), v51, v72, v50->_dbRowID, v12);
                  }
                  else
                  {
                    brc_bread_crumbs();
                    v52 = (void *)objc_claimAutoreleasedReturnValue();
                    brc_default_log();
                    v53 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v53, OS_LOG_TYPE_DEBUG))
                    {
                      -[BRFieldCKInfo etag](v75, "etag");
                      v63 = (void *)objc_claimAutoreleasedReturnValue();
                      *(_DWORD *)buf = 138412802;
                      v93 = v12;
                      v94 = 2112;
                      v95 = v63;
                      v96 = 2112;
                      v97 = v52;
                      _os_log_debug_impl(&dword_1CBD43000, v53, OS_LOG_TYPE_DEBUG, "[DEBUG] Learn content ETag for %@: %@%@", buf, 0x20u);

                    }
                    v50 = v82;
                    v54 = v82->_db;
                    v51 = (void *)MEMORY[0x1D17A6DB0](v79);
                    -[BRCPQLConnection execute:](v54, "execute:", CFSTR("UPDATE client_items SET version_ckinfo = call_block(%p, version_ckinfo, version_old_zone_item_id IS NOT NULL) WHERE zone_rowid = %@ AND item_id = %@"), v51, v82->_dbRowID, v12, v66);
                  }

                  self = v50;
                  if (!-[BRCPQLConnection changes](v50->_db, "changes"))
                  {
                    brc_bread_crumbs();
                    v55 = (void *)objc_claimAutoreleasedReturnValue();
                    brc_default_log();
                    v56 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 138412546;
                      v93 = v12;
                      v94 = 2112;
                      v95 = v55;
                      _os_log_impl(&dword_1CBD43000, v56, OS_LOG_TYPE_DEFAULT, "[WARNING] Couldn't locate the item to learn version info for %@, checking to see if it has undergone a CZM%@", buf, 0x16u);
                    }

                    v57 = v82->_db;
                    v58 = (void *)MEMORY[0x1D17A6DB0](v78);
                    v59 = v57;
                    self = v82;
                    -[BRCPQLConnection execute:](v59, "execute:", CFSTR("UPDATE client_items SET version_ckinfo = call_block(%p, version_ckinfo) WHERE version_old_zone_rowid = %@ AND version_old_zone_item_id = %@"), v58, v82->_dbRowID, v12);

                  }
                  goto LABEL_48;
                }
                objc_msgSend(v8, "recordType");
                v41 = (void *)objc_claimAutoreleasedReturnValue();
                v42 = objc_msgSend(v41, "isEqualToString:", CFSTR("perParticipantMetadata"));

                self = v82;
                v6 = v77;
                if (v42)
                {
                  brc_bread_crumbs();
                  v43 = (void *)objc_claimAutoreleasedReturnValue();
                  brc_default_log();
                  v44 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
                  {
                    -[BRFieldCKInfo etag](v75, "etag");
                    v62 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138412802;
                    v93 = v12;
                    v94 = 2112;
                    v95 = v62;
                    v96 = 2112;
                    v97 = v43;
                    _os_log_debug_impl(&dword_1CBD43000, v44, OS_LOG_TYPE_DEBUG, "[DEBUG] Learn side-car ETag for %@: %@%@", buf, 0x20u);

                  }
                  self = v82;
                  -[BRCPQLConnection execute:](v82->_db, "execute:", CFSTR("UPDATE client_items SET item_side_car_ckinfo = %@ WHERE zone_rowid = %@ AND item_id = %@"), v75, v82->_dbRowID, v12);
                }
              }
              if (v74)
              {
                -[BRCClientZone itemByItemID:](self, "itemByItemID:", v12);
                v60 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v60, "scheduleSyncDownForOOBModifyRecordsAck");
                objc_msgSend(v60, "saveToDB");

                self = v82;
              }

              v16 = v87;
LABEL_13:

            }
          }
        }

        objc_autoreleasePoolPop(v9);
        ++v7;
      }
      while (v6 != v7);
      v65 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v88, v100, 16);
      v6 = v65;
    }
    while (v65);
  }

}

void __71__BRCClientZone_learnCKInfosFromSavedRecords_isOutOfBandModifyRecords___block_invoke(uint64_t a1, sqlite3_context *a2, int a3, uint64_t a4)
{
  id v7;
  void *v8;
  id v9;
  void *v10;
  NSObject *v11;

  if (a3 != 2)
  {
    brc_bread_crumbs();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      __71__BRCClientZone_learnCKInfosFromSavedRecords_isOutOfBandModifyRecords___block_invoke_cold_1();

  }
  if (sqlite3_value_int(*(sqlite3_value **)(a4 + 8)))
  {
    v7 = +[BRFieldCKInfo newFromSqliteValue:](BRFieldCKInfo, "newFromSqliteValue:", *(_QWORD *)a4);
    objc_msgSend(v7, "etagBeforeCrossZoneMove");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setEtagBeforeCrossZoneMove:", v8);

  }
  objc_msgSend(*(id *)(a1 + 32), "data");
  v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  sqlite3_result_blob(a2, (const void *)objc_msgSend(v9, "bytes"), objc_msgSend(v9, "length"), (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);

}

void __71__BRCClientZone_learnCKInfosFromSavedRecords_isOutOfBandModifyRecords___block_invoke_152(uint64_t a1, sqlite3_context *a2, int a3, _QWORD *a4)
{
  void *v7;
  NSObject *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  NSObject *v13;

  if (a3 != 1)
  {
    brc_bread_crumbs();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      __recursive_table_recreate_schema_block_invoke_cold_1();

  }
  brc_bread_crumbs();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    __71__BRCClientZone_learnCKInfosFromSavedRecords_isOutOfBandModifyRecords___block_invoke_152_cold_1();

  v9 = +[BRFieldCKInfo newFromSqliteValue:](BRFieldCKInfo, "newFromSqliteValue:", *a4);
  objc_msgSend(*(id *)(a1 + 32), "etag");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setEtagBeforeCrossZoneMove:", v10);

  objc_msgSend(v9, "data");
  v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  sqlite3_result_blob(a2, (const void *)objc_msgSend(v11, "bytes"), objc_msgSend(v11, "length"), (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);

}

- (void)_syncUpOfRecords:(id)a3 createdAppLibraryNames:(id)a4 didFinishWithError:(id)a5 errorWasOnPCSChainedItem:(BOOL)a6 throttledItemInBatch:(BOOL)a7
{
  _BOOL4 v7;
  id v12;
  id v13;
  __CFString *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  BRCSyncBudgetThrottle *syncUpBudget;
  BRCSyncUpOperation *syncUpOperation;
  void *v21;
  NSObject *v22;
  double v23;
  NSObject *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  unint64_t requestID;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  char v42;
  __CFString *v43;
  void *v44;
  double v45;
  NSObject *v46;
  uint64_t v47;
  float v48;
  float v49;
  uint64_t v50;
  const __CFString *v51;
  BRCSyncOperationThrottle *syncUpThrottle;
  unint64_t v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _QWORD v58[5];
  uint64_t v59[3];
  uint8_t v60[128];
  uint8_t buf[4];
  unint64_t v62;
  __int16 v63;
  BRCClientZone *v64;
  __int16 v65;
  double v66;
  __int16 v67;
  uint64_t v68;
  __int16 v69;
  const __CFString *v70;
  __int16 v71;
  void *v72;
  uint64_t v73;

  v7 = a7;
  v73 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = (__CFString *)a5;
  -[BRCPQLConnection assertOnQueue](self->_db, "assertOnQueue");
  memset(v59, 0, sizeof(v59));
  __brc_create_section(0, (uint64_t)"-[BRCClientZone _syncUpOfRecords:createdAppLibraryNames:didFinishWithError:errorWasOnPCSChainedItem:throttledItemInBatch:]", 2293, v59);
  brc_bread_crumbs();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    v47 = v59[0];
    -[BRCSyncUpOperation cost](self->_syncUpOperation, "cost");
    v49 = v48;
    v50 = objc_msgSend(v12, "count");
    *(_DWORD *)buf = 134219266;
    v51 = CFSTR("(successful)");
    v62 = v47;
    if (v14)
      v51 = v14;
    v63 = 2112;
    v64 = self;
    v65 = 2048;
    v66 = v49;
    v67 = 2048;
    v68 = v50;
    v69 = 2112;
    v70 = v51;
    v71 = 2112;
    v72 = v15;
    _os_log_debug_impl(&dword_1CBD43000, v16, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx Sync: completed sync up for %@, cost:%.1f, itemCount:%llu %@%@", buf, 0x3Eu);
  }

  if (!v14)
  {
    -[BRCAccountSession containerScheduler](self->_session, "containerScheduler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "syncUpBudget");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCSyncUpOperation cost](self->_syncUpOperation, "cost");
    objc_msgSend(v18, "consume:");

    syncUpBudget = self->_syncUpBudget;
    -[BRCSyncUpOperation cost](self->_syncUpOperation, "cost");
    -[BRCSyncBudgetThrottle consume:](syncUpBudget, "consume:");
    -[BRCClientZone _increaseSyncUpBatchSizeAfterSuccess](self, "_increaseSyncUpBatchSizeAfterSuccess");
  }
  syncUpOperation = self->_syncUpOperation;
  self->_syncUpOperation = 0;

  objc_storeStrong((id *)&self->_lastSyncUpError, a5);
  self->_lastSyncUpErrorWasOnChainedItem = a6;
  -[BRCSyncOperationBackoffRatio newSyncOperationWithError:](self->_syncUpBackoffRatio, "newSyncOperationWithError:", v14);
  if (-[__CFString brc_containsCloudKitErrorCode:](v14, "brc_containsCloudKitErrorCode:", 27))
  {
    brc_bread_crumbs();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      -[BRCClientZone _syncUpOfRecords:createdAppLibraryNames:didFinishWithError:errorWasOnPCSChainedItem:throttledItemInBatch:].cold.3();

    -[BRCClientZone _decreaseSyncUpBatchSizeAfterError](self, "_decreaseSyncUpBatchSizeAfterError");
  }
  if (v14)
  {
    if (-[__CFString brc_isResetError](v14, "brc_isResetError"))
    {
      brc_bread_crumbs();
      v23 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
      brc_default_log();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
        -[BRCClientZone _syncUpOfRecords:createdAppLibraryNames:didFinishWithError:errorWasOnPCSChainedItem:throttledItemInBatch:].cold.2((uint64_t)self);
    }
    else if (-[__CFString brc_isCloudKitErrorRequiringAssetRescan](v14, "brc_isCloudKitErrorRequiringAssetRescan"))
    {
      brc_bread_crumbs();
      v23 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
      brc_default_log();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
      {
        requestID = self->_requestID;
        *(_DWORD *)buf = 134218498;
        v62 = requestID;
        v63 = 2112;
        v64 = (BRCClientZone *)v14;
        v65 = 2112;
        v66 = v23;
        _os_log_debug_impl(&dword_1CBD43000, v24, OS_LOG_TYPE_DEBUG, "[DEBUG] Sync: requestID:%llu failed sending: %@%@", buf, 0x20u);
      }
    }
    else
    {
      brc_bread_crumbs();
      v23 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
      brc_default_log();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, (os_log_type_t)0x90u))
      {
        v53 = self->_requestID;
        *(_DWORD *)buf = 134218498;
        v62 = v53;
        v63 = 2112;
        v64 = (BRCClientZone *)v14;
        v65 = 2112;
        v66 = v23;
        _os_log_error_impl(&dword_1CBD43000, v24, (os_log_type_t)0x90u, "[ERROR] Sync: requestID:%llu failed sending: %@%@", buf, 0x20u);
      }
    }

    +[BRCAccountsManager sharedManager](BRCAccountsManager, "sharedManager");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "retrySyncBubbleLaterIfNeededWithError:", v14);

    if ((-[__CFString brc_isEverRetriable](v14, "brc_isEverRetriable") & 1) == 0)
      -[BRCClientZone recomputeAllItemsDidUploadState](self, "recomputeAllItemsDidUploadState");
    if ((-[__CFString brc_isResetError](v14, "brc_isResetError") & 1) != 0
      || !-[__CFString brc_isCloudKitErrorSafeToSyncUpWithoutSyncDown](v14, "brc_isCloudKitErrorSafeToSyncUpWithoutSyncDown"))
    {
      v34 = 19;
    }
    else
    {
      -[BRCClientZone _markLatestSyncRequestFailed](self, "_markLatestSyncRequestFailed");
      -[__CFString userInfo](v14, "userInfo");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "objectForKeyedSubscript:", *MEMORY[0x1E0C94940]);
      v38 = (void *)objc_claimAutoreleasedReturnValue();

      v58[0] = MEMORY[0x1E0C809B0];
      v58[1] = 3221225472;
      v58[2] = __122__BRCClientZone__syncUpOfRecords_createdAppLibraryNames_didFinishWithError_errorWasOnPCSChainedItem_throttledItemInBatch___block_invoke;
      v58[3] = &unk_1E8762B28;
      v58[4] = self;
      objc_msgSend(v38, "enumerateKeysAndObjectsUsingBlock:", v58);

      v34 = 1;
    }
    +[BRCAutoBugCaptureReporter sharedABCReporter](BRCAutoBugCaptureReporter, "sharedABCReporter");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "captureLogsForOperationType:ofSubtype:forError:", CFSTR("SyncHealth"), CFSTR("SyncUp"), v14);

  }
  else
  {
    brc_bread_crumbs();
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
      -[BRCClientZone _syncUpOfRecords:createdAppLibraryNames:didFinishWithError:errorWasOnPCSChainedItem:throttledItemInBatch:].cold.1((uint64_t)self);

    if (-[BRCClientZone isPrivateZone](self, "isPrivateZone"))
    {
      -[BRCClientZone asPrivateClientZone](self, "asPrivateClientZone");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "defaultAppLibrary");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "setStateBits:", 2);

    }
    v56 = 0u;
    v57 = 0u;
    v54 = 0u;
    v55 = 0u;
    v29 = v13;
    v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v54, v60, 16);
    if (v30)
    {
      v31 = *(_QWORD *)v55;
      do
      {
        v32 = 0;
        do
        {
          if (*(_QWORD *)v55 != v31)
            objc_enumerationMutation(v29);
          -[BRCAccountSession appLibraryByID:](self->_session, "appLibraryByID:", *(_QWORD *)(*((_QWORD *)&v54 + 1) + 8 * v32), (_QWORD)v54);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "setStateBits:", 2);

          ++v32;
        }
        while (v30 != v32);
        v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v54, v60, 16);
      }
      while (v30);
    }

    -[BRCClientZone learnCKInfosFromSavedRecords:isOutOfBandModifyRecords:](self, "learnCKInfosFromSavedRecords:isOutOfBandModifyRecords:", v12, 0);
    v34 = 18;
  }
  -[BRCClientZone setSyncStateBits:](self, "setSyncStateBits:", v34, (_QWORD)v54);
  -[BRCClientZone clearSyncStateBits:](self, "clearSyncStateBits:", 4);
  if (v7
    && (-[BRCClientZone mangledID](self, "mangledID"),
        v40 = (void *)objc_claimAutoreleasedReturnValue(),
        +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", v40),
        v41 = (void *)objc_claimAutoreleasedReturnValue(),
        v42 = objc_msgSend(v41, "treatPerItemThrottleAsOperationSuccess"),
        v41,
        v40,
        (v42 & 1) != 0))
  {
    v43 = 0;
  }
  else
  {
    v43 = v14;
  }
  -[BRCSyncOperationThrottle updateForError:](self->_syncUpThrottle, "updateForError:", v43);
  if (v14
    || (-[BRCClientZone syncDownImmediately](self, "syncDownImmediately"),
        v44 = (void *)objc_claimAutoreleasedReturnValue(),
        v44,
        !v44))
  {
    -[BRCDeadlineSource resume](self->_syncDeadlineSource, "resume");
    -[BRCDeadlineSource signal](self->_syncDeadlineSource, "signal");
  }
  -[BRCClientZone handleZoneLevelErrorIfNeeded:forItemCreation:](self, "handleZoneLevelErrorIfNeeded:forItemCreation:", v14, 1);
  brc_bread_crumbs();
  v45 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
  brc_default_log();
  v46 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
  {
    syncUpThrottle = self->_syncUpThrottle;
    *(_DWORD *)buf = 138412802;
    v62 = (unint64_t)syncUpThrottle;
    v63 = 2112;
    v64 = self;
    v65 = 2112;
    v66 = v45;
    _os_log_debug_impl(&dword_1CBD43000, v46, OS_LOG_TYPE_DEBUG, "[DEBUG] Sync: updated sync-up throttle: %@\n      and container state: %@%@", buf, 0x20u);
  }

  __brc_leave_section(v59);
}

void __122__BRCClientZone__syncUpOfRecords_createdAppLibraryNames_didFinishWithError_errorWasOnPCSChainedItem_throttledItemInBatch___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  _QWORD *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a2;
  v5 = a3;
  if (objc_msgSend(v5, "brc_isCloudKitOutOfQuota"))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = *(_QWORD **)(a1 + 32);
      objc_msgSend(v11, "brc_itemIDWithSession:", v6[1]);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "itemByItemID:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if ((objc_msgSend(v8, "isDead") & 1) == 0
        && objc_msgSend(v8, "needsSyncUp")
        && objc_msgSend(v8, "isDocument"))
      {
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "fsUploader");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "asDocument");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "finishedSyncingUpItem:withOutOfQuotaError:", v10, v5);

      }
    }
  }

}

- (NSArray)syncThrottles
{
  NSArray *syncThrottles;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  BRCSyncThrottle *v13;
  NSArray *v14;
  NSArray *v15;
  NSArray *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  -[BRCPQLConnection assertOnQueue](self->_db, "assertOnQueue");
  syncThrottles = self->_syncThrottles;
  if (syncThrottles)
    return syncThrottles;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[BRCClientZone mangledID](self, "mangledID", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "syncThrottles");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v18;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v18 != v11)
          objc_enumerationMutation(v8);
        v13 = -[BRCSyncThrottle initWithName:andParameters:]([BRCSyncThrottle alloc], "initWithName:andParameters:", CFSTR("defaultSyncThrottle"), *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v12));
        if (v13)
          objc_msgSend(v5, "addObject:", v13);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v10);
  }

  v14 = (NSArray *)objc_msgSend(v5, "copy");
  v15 = self->_syncThrottles;
  self->_syncThrottles = v14;

  v16 = self->_syncThrottles;
  return v16;
}

- (BOOL)_isIdle
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  char v12;
  void *v13;
  int v14;
  void *v15;
  int v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  int v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t buf[4];
  BRCClientZone *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  NSObject *v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  if (-[BRCClientZone isPrivateZone](self, "isPrivateZone"))
  {
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    -[BRCClientZone asPrivateClientZone](self, "asPrivateClientZone", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appLibraries");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v23, v33, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v24;
      while (2)
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v24 != v7)
            objc_enumerationMutation(v4);
          v9 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
          if ((objc_msgSend(v9, "state") & 4) != 0)
          {
            brc_bread_crumbs();
            v10 = objc_claimAutoreleasedReturnValue();
            brc_default_log();
            v11 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412802;
              v28 = self;
              v29 = 2112;
              v30 = v9;
              v31 = 2112;
              v32 = v10;
              _os_log_debug_impl(&dword_1CBD43000, v11, OS_LOG_TYPE_DEBUG, "[DEBUG] %@ isn't idle because %@ needs lost%@", buf, 0x20u);
            }

            goto LABEL_32;
          }
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v23, v33, 16);
        if (v6)
          continue;
        break;
      }
    }

  }
  if ((self->_state & 0x110) != 0)
  {
    brc_bread_crumbs();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      -[BRCClientZone _isIdle].cold.6((uint64_t)self);
LABEL_32:

    return 0;
  }
  v12 = atomic_load(&self->_syncState);
  if ((v12 & 0xF) != 0)
  {
    brc_bread_crumbs();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      -[BRCClientZone _isIdle].cold.5((uint64_t)self);
    goto LABEL_32;
  }
  -[BRCAccountSession fsDownloader](self->_session, "fsDownloader");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "haveActiveJobsMatching:", self->_serverZone);

  if (v14)
  {
    brc_bread_crumbs();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      -[BRCClientZone _isIdle].cold.1((uint64_t)self);
    goto LABEL_32;
  }
  -[BRCAccountSession fsUploader](self->_session, "fsUploader");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "haveActiveJobsMatching:", self->_serverZone);

  if (v16)
  {
    brc_bread_crumbs();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      -[BRCClientZone _isIdle].cold.2((uint64_t)self);
    goto LABEL_32;
  }
  -[BRCAccountSession(LegacyAdditions) fsReader](self->_session, "fsReader");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "haveActiveJobsMatching:", self->_serverZone);

  if (v18)
  {
    brc_bread_crumbs();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      -[BRCClientZone _isIdle].cold.3((uint64_t)self);
    goto LABEL_32;
  }
  -[BRCAccountSession applyScheduler](self->_session, "applyScheduler");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "deleteExpiredJobs");

  -[BRCAccountSession applyScheduler](self->_session, "applyScheduler");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "haveActiveJobsMatching:", self->_serverZone);

  if (v21)
  {
    brc_bread_crumbs();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      -[BRCClientZone _isIdle].cold.4((uint64_t)self);
    goto LABEL_32;
  }
  return 1;
}

- (void)_flushIdleBlocksIfNeeded
{
  NSObject *v0;
  id v1;
  void *v2;
  uint64_t v3;
  uint8_t v4[24];
  uint64_t v5;

  OUTLINED_FUNCTION_9_0();
  v5 = *MEMORY[0x1E0C80C00];
  objc_msgSend(v1, "mangledID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3_2(&dword_1CBD43000, v0, v3, "[DEBUG] %@ is still not idle%@", v4);

  OUTLINED_FUNCTION_6();
}

- (void)notifyClient:(id)a3 afterNextSyncDown:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  BRCClientZone *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  -[BRCPQLConnection serialQueue](self->_db, "serialQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__BRCClientZone_notifyClient_afterNextSyncDown___block_invoke;
  block[3] = &unk_1E875EB70;
  v12 = v6;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

void __48__BRCClientZone_notifyClient_afterNextSyncDown___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  _BYTE *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;

  brc_bread_crumbs();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    __48__BRCClientZone_notifyClient_afterNextSyncDown___block_invoke_cold_1(a1);

  v4 = *(_BYTE **)(a1 + 40);
  if (v4[76])
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "brc_errorLoggedOut");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(_BYTE **)(a1 + 40);
  }
  if (objc_msgSend(v4, "isSyncBlocked"))
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "brc_errorSyncBlocked");
    v6 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v6;
  }
  if (v5)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    v7 = *(void **)(*(_QWORD *)(a1 + 40) + 384);
    if (!v7)
    {
      v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v9 = *(_QWORD *)(a1 + 40);
      v10 = *(void **)(v9 + 384);
      *(_QWORD *)(v9 + 384) = v8;

      v7 = *(void **)(*(_QWORD *)(a1 + 40) + 384);
    }
    v11 = (void *)MEMORY[0x1D17A6DB0](*(_QWORD *)(a1 + 48));
    objc_msgSend(v7, "addObject:", v11);

  }
}

- (void)notifyClient:(id)a3 whenIdle:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[BRCPQLConnection serialQueue](self->_db, "serialQueue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __39__BRCClientZone_notifyClient_whenIdle___block_invoke;
  v11[3] = &unk_1E8762BC0;
  v12 = v6;
  v13 = v7;
  v11[4] = self;
  v9 = v6;
  v10 = v7;
  dispatch_async_with_logs_7(v8, v11);

}

void __39__BRCClientZone_notifyClient_whenIdle___block_invoke(id *a1)
{
  id *v2;
  void *v3;
  void (**v4)(id, _QWORD, uint64_t);
  uint64_t v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  id v12;
  _QWORD *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  _QWORD *v19;
  void *v20;
  id v21;
  _QWORD v22[4];
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  __int128 v28;
  uint64_t v29;
  __int128 v30;
  uint64_t v31;
  __int128 v32;
  uint64_t v33;
  _BYTE location[12];
  __int16 v35;
  void *v36;
  __int16 v37;
  id v38;
  __int16 v39;
  void *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v2 = a1 + 4;
  objc_msgSend(a1[4], "mangledID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!*((_BYTE *)*v2 + 76))
  {
    v4 = (void (**)(id, _QWORD, uint64_t))a1[6];
    objc_msgSend(MEMORY[0x1E0CB35C8], "brc_errorLoggedOut");
    v5 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  if (objc_msgSend(*v2, "isSyncBlocked"))
  {
    v4 = (void (**)(id, _QWORD, uint64_t))a1[6];
    objc_msgSend(MEMORY[0x1E0CB35C8], "brc_errorSyncBlocked");
    v5 = objc_claimAutoreleasedReturnValue();
LABEL_5:
    v6 = (void *)v5;
    v4[2](v4, 0, v5);

    goto LABEL_6;
  }
  if (objc_msgSend(a1[4], "_isIdle"))
  {
    brc_bread_crumbs();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      __39__BRCClientZone_notifyClient_whenIdle___block_invoke_cold_1();

    (*((void (**)(void))a1[6] + 2))();
  }
  else
  {
    v30 = 0uLL;
    v31 = 0;
    __brc_create_section(0, (uint64_t)"-[BRCClientZone notifyClient:whenIdle:]_block_invoke", 2514, &v30);
    brc_bread_crumbs();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      v21 = a1[5];
      *(_DWORD *)location = 134218754;
      *(_QWORD *)&location[4] = v30;
      v35 = 2112;
      v36 = v3;
      v37 = 2112;
      v38 = v21;
      v39 = 2112;
      v40 = v9;
      _os_log_debug_impl(&dword_1CBD43000, v10, OS_LOG_TYPE_DEBUG, "[DEBUG] ┣%llx waiting for %@ to be idle for %@ because it is busy%@", location, 0x2Au);
    }

    v32 = v30;
    v33 = v31;
    v11 = (void *)*((_QWORD *)a1[4] + 51);
    if (!v11)
    {
      v12 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v13 = a1[4];
      v14 = (void *)v13[51];
      v13[51] = v12;

      v11 = (void *)*((_QWORD *)a1[4] + 51);
    }
    v15 = MEMORY[0x1E0C809B0];
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __39__BRCClientZone_notifyClient_whenIdle___block_invoke_180;
    v24[3] = &unk_1E8762B50;
    v28 = v32;
    v29 = v33;
    v25 = v3;
    v26 = a1[5];
    v27 = a1[6];
    v16 = (void *)MEMORY[0x1D17A6DB0](v24);
    objc_msgSend(v11, "addObject:", v16);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak((id *)location, a1[4]);
    v22[0] = v15;
    v22[1] = 3221225472;
    v22[2] = __39__BRCClientZone_notifyClient_whenIdle___block_invoke_182;
    v22[3] = &unk_1E8762B98;
    objc_copyWeak(&v23, (id *)location);
    objc_msgSend(v17, "addObserverForName:object:queue:usingBlock:", CFSTR("BRCFSSchedulerBaseDidUpdateHasWorkNotification"), 0, 0, v22);
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = a1[4];
    v20 = (void *)v19[50];
    v19[50] = v18;

    objc_destroyWeak(&v23);
    objc_destroyWeak((id *)location);

  }
LABEL_6:

}

void __39__BRCClientZone_notifyClient_whenIdle___block_invoke_180(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  uint8_t buf[4];
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v8 = *(_OWORD *)(a1 + 56);
  v9 = *(_QWORD *)(a1 + 72);
  brc_bread_crumbs();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 134218754;
    v11 = v8;
    v12 = 2112;
    v13 = v6;
    v14 = 2112;
    v15 = v7;
    v16 = 2112;
    v17 = v4;
    _os_log_debug_impl(&dword_1CBD43000, v5, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx %@ is now idle, notifying %@%@", buf, 0x2Au);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  __brc_leave_section((uint64_t *)&v8);

}

void __39__BRCClientZone_notifyClient_whenIdle___block_invoke_182(uint64_t a1, void *a2)
{
  id v3;
  id *WeakRetained;
  id *v5;
  void *v6;
  id v7;
  int v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  NSObject *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  _QWORD block[5];
  id v26;
  id v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained[1], "personaIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isEqualToString:", CFSTR("__defaultPersonaID__")))
    {

    }
    else
    {
      objc_msgSend(v5[1], "personaIdentifier");
      v7 = (id)objc_claimAutoreleasedReturnValue();

      if (v7)
      {
        v8 = 0;
        goto LABEL_9;
      }
    }
    if (_block_invoke___personaOnceToken_0 != -1)
      dispatch_once(&_block_invoke___personaOnceToken_0, &__block_literal_global_185_0);
    v7 = (id)_block_invoke___personalPersona_0;
    v8 = 1;
LABEL_9:
    objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "currentPersona");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v27 = 0;
    objc_msgSend(v10, "userPersonaUniqueString");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11 == v7 || (objc_msgSend(v11, "isEqualToString:", v7) & 1) != 0)
    {
      v13 = 0;
    }
    else
    {
      if (voucher_process_can_use_arbitrary_personas())
      {
        v26 = 0;
        v15 = (void *)objc_msgSend(v10, "copyCurrentPersonaContextWithError:", &v26);
        v16 = v26;
        v17 = v27;
        v27 = v15;

        if (v16)
        {
          brc_bread_crumbs();
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, (os_log_type_t)0x90u))
            __39__BRCClientZone_notifyClient_whenIdle___block_invoke_182_cold_1((uint64_t)v16);

        }
        objc_msgSend(v10, "generateAndRestorePersonaContextWithPersonaUniqueString:", v7);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v13)
          goto LABEL_12;
        brc_bread_crumbs();
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, (os_log_type_t)0x90u))
        {
          objc_msgSend(v5[1], "personaIdentifier");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v29 = v22;
          v30 = 2112;
          v31 = v13;
          v32 = 2112;
          v33 = v20;
          _os_log_error_impl(&dword_1CBD43000, v21, (os_log_type_t)0x90u, "[ERROR] Can't adopt persona %@: %@%@", buf, 0x20u);

        }
      }
      else
      {
        if (!v8 || (objc_msgSend(v10, "isDataSeparatedPersona") & 1) != 0)
        {
          brc_bread_crumbs();
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v24 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
            -[_BRCOperation completedWithResult:error:].cold.2();

          objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 22, 0);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_12;
        }
        brc_bread_crumbs();
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
          -[_BRCOperation completedWithResult:error:].cold.3();
        v13 = 0;
      }

    }
LABEL_12:
    objc_msgSend(v5[8], "serialQueue");
    v14 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __39__BRCClientZone_notifyClient_whenIdle___block_invoke_188;
    block[3] = &unk_1E875D500;
    block[4] = v5;
    dispatch_async(v14, block);

    _BRRestorePersona();
  }

}

void __39__BRCClientZone_notifyClient_whenIdle___block_invoke_2()
{
  uint64_t v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x1E0DC5F00], "personaAttributesForPersonaType:", 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "userPersonaUniqueString");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_block_invoke___personalPersona_0;
  _block_invoke___personalPersona_0 = v0;

}

void __39__BRCClientZone_notifyClient_whenIdle___block_invoke_188(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4[3];

  memset(v4, 0, sizeof(v4));
  __brc_create_section(0, (uint64_t)"-[BRCClientZone notifyClient:whenIdle:]_block_invoke", 2541, v4);
  brc_bread_crumbs();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    __39__BRCClientZone_notifyClient_whenIdle___block_invoke_188_cold_1();

  objc_msgSend(*(id *)(a1 + 32), "_flushIdleBlocksIfNeeded");
  __brc_leave_section(v4);
}

- (void)syncDownOperation:(id)a3 didFinishWithError:(id)a4 status:(int64_t)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  BRCPQLConnection *db;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  int64_t v18;

  v8 = a3;
  v9 = a4;
  -[BRCAccountSession fsUploader](self->_session, "fsUploader");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCServerZone ownerName](self->_serverZone, "ownerName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "scheduleQuotaFetchIfNeededForOwner:", v11);

  db = self->_db;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __61__BRCClientZone_syncDownOperation_didFinishWithError_status___block_invoke;
  v15[3] = &unk_1E875EF68;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = a5;
  v13 = v9;
  v14 = v8;
  -[BRCPQLConnection performWithFlags:action:](db, "performWithFlags:action:", 9, v15);

}

uint64_t __61__BRCClientZone_syncDownOperation_didFinishWithError_status___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  int v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  void *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  NSObject *v41;
  id v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t j;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  NSObject *v51;
  uint64_t v53;
  uint64_t v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  _QWORD v59[5];
  id v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  _QWORD v65[4];
  id v66;
  _QWORD v67[5];
  uint8_t v68[128];
  uint8_t buf[4];
  void *v70;
  __int16 v71;
  void *v72;
  _BYTE v73[128];
  uint64_t v74;

  v74 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = (id *)(a1 + 32);
  if (*(_QWORD *)(v4 + 136) == *(_QWORD *)(a1 + 40))
  {
    v8 = *(void **)(v4 + 128);
    *(_QWORD *)(v4 + 128) = 0;

    *((_QWORD *)*v5 + 17) = 0;
    objc_msgSend(*((id *)*v5 + 23), "resume");
  }
  else
  {
    brc_bread_crumbs();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      __61__BRCClientZone_syncDownOperation_didFinishWithError_status___block_invoke_cold_2();

  }
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 144), *(id *)(a1 + 48));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 176), "updateForError:", *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "handleZoneLevelErrorIfNeeded:forItemCreation:", *(_QWORD *)(a1 + 48), 0);
  v9 = *(_QWORD *)(a1 + 56);
  objc_msgSend(*(id *)(a1 + 32), "mangledID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "onlyTreatCaughtUpAsConsistent");

  if (v12)
    v13 = 2;
  else
    v13 = 1;
  if (v9 > 2)
    goto LABEL_10;
  v32 = *(void **)(a1 + 48);
  if (v32)
  {
    if ((objc_msgSend(v32, "brc_isCloudKitCancellationError") & 1) == 0
      && (objc_msgSend(*(id *)(a1 + 48), "brc_isUserInitiatedRetriable") & 1) == 0)
    {
LABEL_10:
      v14 = *v5;
      v15 = MEMORY[0x1E0C809B0];
      v16 = (void *)*((_QWORD *)*v5 + 46);
      v67[0] = MEMORY[0x1E0C809B0];
      v67[1] = 3221225472;
      v67[2] = __61__BRCClientZone_syncDownOperation_didFinishWithError_status___block_invoke_190;
      v67[3] = &unk_1E8762BE8;
      v67[4] = v14;
      objc_msgSend(v16, "enumerateKeysAndObjectsUsingBlock:", v67);
      v17 = (void *)*((_QWORD *)*v5 + 46);
      *((_QWORD *)*v5 + 46) = 0;

      if ((objc_msgSend(*v5, "isSharedZone") & 1) == 0)
      {
        objc_msgSend(*v5, "asPrivateClientZone");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = (void *)*((_QWORD *)*v5 + 38);
        v65[0] = v15;
        v65[1] = 3221225472;
        v65[2] = __61__BRCClientZone_syncDownOperation_didFinishWithError_status___block_invoke_2;
        v65[3] = &unk_1E8762C10;
        v66 = v18;
        v20 = v18;
        objc_msgSend(v19, "enumerateKeysAndObjectsUsingBlock:", v65);

      }
      v21 = *(_QWORD *)(a1 + 32);
      v22 = *(void **)(v21 + 304);
      *(_QWORD *)(v21 + 304) = 0;

      if (*(_QWORD *)(a1 + 48))
      {
        v53 = v13;
        v54 = v9;
        v23 = (void *)objc_opt_new();
        v61 = 0u;
        v62 = 0u;
        v63 = 0u;
        v64 = 0u;
        v24 = *((id *)*v5 + 24);
        v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v61, v73, 16);
        if (v25)
        {
          v26 = v25;
          v27 = *(_QWORD *)v62;
          do
          {
            for (i = 0; i != v26; ++i)
            {
              if (*(_QWORD *)v62 != v27)
                objc_enumerationMutation(v24);
              v29 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * i);
              if (objc_msgSend(v29, "nonDiscretionary", v53, v54))
              {
                brc_bread_crumbs();
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                brc_default_log();
                v31 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138412546;
                  v70 = v29;
                  v71 = 2112;
                  v72 = v30;
                  _os_log_debug_impl(&dword_1CBD43000, v31, OS_LOG_TYPE_DEBUG, "[DEBUG] Failing op %@ because the sync down failed%@", buf, 0x16u);
                }

                objc_msgSend(v29, "completedWithResult:error:", 0, *(_QWORD *)(a1 + 48));
                objc_msgSend(v29, "cancel");
                objc_msgSend(v29, "schedule");
                objc_msgSend(v23, "addObject:", v29);
              }
            }
            v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v61, v73, 16);
          }
          while (v26);
        }

        v5 = (id *)(a1 + 32);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 192), "removeObjectsInArray:", v23);

        v13 = v53;
        v9 = v54;
      }
      goto LABEL_31;
    }
    if (*(_QWORD *)(a1 + 48))
      goto LABEL_31;
  }
  if (objc_msgSend(*((id *)*v5 + 46), "count"))
  {
    v33 = (void *)objc_opt_new();
    v34 = *v5;
    v35 = (void *)*((_QWORD *)*v5 + 46);
    v59[0] = MEMORY[0x1E0C809B0];
    v59[1] = 3221225472;
    v59[2] = __61__BRCClientZone_syncDownOperation_didFinishWithError_status___block_invoke_194;
    v59[3] = &unk_1E8762C38;
    v59[4] = v34;
    v60 = v33;
    v36 = v33;
    objc_msgSend(v35, "enumerateKeysAndObjectsUsingBlock:", v59);
    objc_msgSend(*((id *)*v5 + 46), "removeObjectsForKeys:", v36);

  }
LABEL_31:
  if (v9 <= v13)
  {
    LODWORD(v39) = 0;
    v38 = 8;
LABEL_39:
    v39 = v39 | 2;
    goto LABEL_40;
  }
  v37 = *(_QWORD *)(a1 + 48);
  if (!v37 && v9 <= 2)
  {
    if (objc_msgSend(*v5, "hasHighPriorityWatchers"))
      v38 = 8;
    else
      v38 = 344;
    LODWORD(v39) = 32;
    goto LABEL_39;
  }
  v39 = 32 * (v37 == 0);
  if (v37)
    v38 = 8;
  else
    v38 = 344;
  if (v9 < 3 || v37)
    goto LABEL_39;
LABEL_40:
  objc_msgSend(*v5, "clearSyncStateBits:", v38, v53, v54);
  objc_msgSend(*v5, "setSyncStateBits:", v39);
  objc_msgSend(*((id *)*v5 + 23), "signal");
  if (v9 > 2 || *(_QWORD *)(a1 + 48))
  {
    if (objc_msgSend(*((id *)*v5 + 49), "count"))
    {
      brc_bread_crumbs();
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v41 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v70 = v40;
        _os_log_impl(&dword_1CBD43000, v41, OS_LOG_TYPE_DEFAULT, "[NOTICE] signaling sync down waiters%@", buf, 0xCu);
      }

    }
    v57 = 0u;
    v58 = 0u;
    v55 = 0u;
    v56 = 0u;
    v42 = *((id *)*v5 + 49);
    v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v55, v68, 16);
    if (v43)
    {
      v44 = v43;
      v45 = *(_QWORD *)v56;
      do
      {
        for (j = 0; j != v44; ++j)
        {
          if (*(_QWORD *)v56 != v45)
            objc_enumerationMutation(v42);
          (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v55 + 1) + 8 * j) + 16))();
        }
        v44 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v55, v68, 16);
      }
      while (v44);
    }

    objc_msgSend(*((id *)*v5 + 49), "removeAllObjects");
  }
  +[BRCAccountsManager sharedManager](BRCAccountsManager, "sharedManager");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "retrySyncBubbleLaterIfNeededWithError:", *(_QWORD *)(a1 + 48));

  v48 = *(void **)(a1 + 48);
  if (v48)
  {
    if ((objc_msgSend(v48, "brc_isEverRetriable") & 1) == 0)
      objc_msgSend(*v5, "recomputeAllItemsDidUploadState");
    if (*(_QWORD *)(a1 + 48))
    {
      +[BRCAutoBugCaptureReporter sharedABCReporter](BRCAutoBugCaptureReporter, "sharedABCReporter");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "captureLogsForOperationType:ofSubtype:forError:", CFSTR("SyncHealth"), CFSTR("SyncDown"), *(_QWORD *)(a1 + 48));

    }
  }
  brc_bread_crumbs();
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v51 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG))
    __61__BRCClientZone_syncDownOperation_didFinishWithError_status___block_invoke_cold_1();

  return 1;
}

void __61__BRCClientZone_syncDownOperation_didFinishWithError_status___block_invoke_190(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10);
        objc_msgSend(*(id *)(a1 + 32), "serverItemByItemID:", v5);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, uint64_t))(v11 + 16))(v11, objc_msgSend(v12, "isLive"));

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

}

void __61__BRCClientZone_syncDownOperation_didFinishWithError_status___block_invoke_2(uint64_t a1, uint64_t a2, void (**a3)(_QWORD, _QWORD))
{
  void *v5;
  void (**v6)(_QWORD, _QWORD);
  void *v7;
  id v8;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(v5, "serverAliasByUnsaltedBookmarkData:", a2);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "itemID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *))a3)[2](v6, v7);

}

void __61__BRCClientZone_syncDownOperation_didFinishWithError_status___block_invoke_194(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  int v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v10);
        objc_msgSend(*(id *)(a1 + 32), "serverItemByItemID:", v5);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "isLive");

        if (v13)
          (*(void (**)(uint64_t, uint64_t))(v11 + 16))(v11, 1);
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }
  objc_msgSend(*(id *)(a1 + 40), "addObject:", v5);

}

- (void)_fixupMissingCrossMovedItems
{
  void *v3;
  NSObject *v4;
  int64_t v5;
  void *v6;
  uint8_t buf[4];
  int64_t v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  -[BRCPQLConnection executeWithSlowStatementRadar:sql:](self->_db, "executeWithSlowStatementRadar:sql:", CFSTR("<rdar://problem/26073809> _fixupMissingCrossMovedItems causes slow SQL assertions"), CFSTR("UPDATE client_items SET item_localsyncupstate = 1 WHERE zone_rowid = %@   AND item_localsyncupstate = 0   AND (item_local_diffs & 0x2000000000000000) != 0   AND NOT EXISTS (SELECT * FROM server_items WHERE server_items.item_id = client_items.item_id AND zone_rowid = %@)"), self->_dbRowID, self->_dbRowID);
  brc_bread_crumbs();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = -[BRCPQLConnection changes](self->_db, "changes");
    *(_DWORD *)buf = 134218242;
    v8 = v5;
    v9 = 2112;
    v10 = v3;
    _os_log_impl(&dword_1CBD43000, v4, OS_LOG_TYPE_DEFAULT, "[WARNING] marked %lld items rejected after cross zone move%@", buf, 0x16u);
  }

  if (-[BRCPQLConnection changes](self->_db, "changes"))
  {
    -[BRCAccountSession applyScheduler](self->_session, "applyScheduler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "repopulateJobsForZone:", self->_serverZone);

  }
}

- (void)listedUpToRank:(int64_t)a3
{
  self->_lastInsertedRank = a3;
  -[BRCClientZone setNeedsSave:](self, "setNeedsSave:", 1);
}

- (void)didSyncDownRequestID:(unint64_t)a3 maxApplyRank:(int64_t)a4 caughtUpWithServer:(BOOL)a5 syncDownDate:(id)a6
{
  unint64_t requestID;
  BOOL v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  NSMutableArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSMutableArray *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  void *v26;
  void *v27;
  uint64_t v28;
  char v29;
  uint64_t v30;
  uint64_t k;
  void *v32;
  void *v33;
  NSObject *v34;
  void *v35;
  NSObject *v36;
  int64_t v37;
  void *v38;
  NSObject *v39;
  void *v40;
  unint64_t v41;
  void *v42;
  NSObject *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  BRCClientZone *v48;
  int v49;
  int v50;
  BRCAccountSession *session;
  void *v52;
  void *v53;
  NSObject *v54;
  _BOOL4 v55;
  int v56;
  void *v57;
  int v58;
  int v59;
  void *v60;
  NSObject *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  BRCClientZone *v66;
  NSObject *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  int v72;
  void *v73;
  NSObject *v74;
  void *v75;
  void *v76;
  BRCClientZone *v77;
  NSObject *v78;
  void *v79;
  NSObject *v80;
  void *v81;
  void *v82;
  BRCItemToPathLookup *v83;
  void *v84;
  NSObject *v85;
  void *v86;
  NSObject *v87;
  uint64_t v88;
  void *v89;
  const char *v90;
  const char *v91;
  BRCItemToPathLookup *v92;
  void *v93;
  BRCItemToPathLookup *v94;
  int v95;
  void *v96;
  NSObject *v97;
  NSObject *v98;
  const char *v99;
  NSObject *v100;
  void *v101;
  NSObject *v102;
  void *v103;
  void *v104;
  uint64_t v105;
  void *v106;
  NSObject *v107;
  void *v108;
  NSObject *v109;
  unint64_t v110;
  __int16 v111;
  void *v112;
  void *v113;
  NSObject *v114;
  id v116;
  id obj;
  void *v119;
  _BOOL4 v120;
  uint64_t v121;
  uint64_t v123;
  _QWORD v124[4];
  BRCItemToPathLookup *v125;
  int v126;
  uint64_t v127[3];
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  uint8_t buf[4];
  unint64_t v145;
  __int16 v146;
  unint64_t v147;
  __int16 v148;
  BRCClientZone *v149;
  __int16 v150;
  uint64_t v151;
  __int16 v152;
  const char *v153;
  __int16 v154;
  const char *v155;
  __int16 v156;
  void *v157;
  _BYTE v158[128];
  _BYTE v159[128];
  _BYTE v160[128];
  _BYTE v161[128];
  uint64_t v162;

  v120 = a5;
  v162 = *MEMORY[0x1E0C80C00];
  v116 = a6;
  -[BRCAccountSession applyScheduler](self->_session, "applyScheduler");
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  requestID = self->_requestID;
  if (requestID)
    v9 = requestID >= a3;
  else
    v9 = 1;
  if (!v9)
  {
    brc_bread_crumbs();
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v114 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v114, OS_LOG_TYPE_FAULT))
      -[BRCClientZone didSyncDownRequestID:maxApplyRank:caughtUpWithServer:syncDownDate:].cold.4();

  }
  if (!self->_lastSyncDownDate)
    -[BRCClientZone scheduleSyncUp](self, "scheduleSyncUp");
  if (-[NSMutableArray count](self->_blockedOperationsOnInitialSync, "count"))
  {
    -[BRCServerZone changeState](self->_serverZone, "changeState");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "changeToken");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      -[NSMutableArray sortUsingComparator:](self->_blockedOperationsOnInitialSync, "sortUsingComparator:", &__block_literal_global_203);
    }
    else
    {
      brc_bread_crumbs();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v145 = (unint64_t)v12;
        _os_log_impl(&dword_1CBD43000, v13, OS_LOG_TYPE_DEFAULT, "[WARNING] The zone wasn't found on sync down so failing all blocked operations right away%@", buf, 0xCu);
      }

      v142 = 0u;
      v143 = 0u;
      v140 = 0u;
      v141 = 0u;
      v14 = self->_blockedOperationsOnInitialSync;
      v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v140, v161, 16);
      if (v15)
      {
        v16 = *(_QWORD *)v141;
        do
        {
          for (i = 0; i != v15; ++i)
          {
            if (*(_QWORD *)v141 != v16)
              objc_enumerationMutation(v14);
            v18 = *(void **)(*((_QWORD *)&v140 + 1) + 8 * i);
            v19 = (void *)MEMORY[0x1E0CB35C8];
            -[BRMangledID appLibraryOrZoneName](self->_mangledID, "appLibraryOrZoneName");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "brc_errorClientZoneNotFound:", v20);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "completedWithResult:error:", 0, v21);

            objc_msgSend(v18, "cancel");
          }
          v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v140, v161, 16);
        }
        while (v15);
      }

    }
    v138 = 0u;
    v139 = 0u;
    v136 = 0u;
    v137 = 0u;
    v22 = self->_blockedOperationsOnInitialSync;
    v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v136, v160, 16);
    if (v23)
    {
      v24 = *(_QWORD *)v137;
      do
      {
        for (j = 0; j != v23; ++j)
        {
          if (*(_QWORD *)v137 != v24)
            objc_enumerationMutation(v22);
          objc_msgSend(*(id *)(*((_QWORD *)&v136 + 1) + 8 * j), "schedule");
        }
        v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v136, v160, 16);
      }
      while (v23);
    }

    -[NSMutableArray removeAllObjects](self->_blockedOperationsOnInitialSync, "removeAllObjects");
  }
  self->_lastInsertedRank = a4;
  objc_storeStrong((id *)&self->_lastSyncDownDate, a6);
  -[BRCClientZone setNeedsSave:](self, "setNeedsSave:", 1);
  if (v120)
  {
    if (-[BRCClientZone isPrivateZone](self, "isPrivateZone"))
    {
      v134 = 0u;
      v135 = 0u;
      v132 = 0u;
      v133 = 0u;
      -[BRCClientZone asPrivateClientZone](self, "asPrivateClientZone");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "appLibraries");
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v132, v159, 16);
      if (v28)
      {
        v29 = 0;
        v30 = *(_QWORD *)v133;
        do
        {
          for (k = 0; k != v28; ++k)
          {
            if (*(_QWORD *)v133 != v30)
              objc_enumerationMutation(v27);
            v32 = *(void **)(*((_QWORD *)&v132 + 1) + 8 * k);
            if ((objc_msgSend(v32, "state") & 0x80000) != 0)
            {
              brc_bread_crumbs();
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              brc_default_log();
              v34 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412546;
                v145 = (unint64_t)v32;
                v146 = 2112;
                v147 = (unint64_t)v33;
                _os_log_debug_impl(&dword_1CBD43000, v34, OS_LOG_TYPE_DEBUG, "[DEBUG] Server Zone has caught up, so we can now re-scan to scrub for turds on %@%@", buf, 0x16u);
              }

              objc_msgSend(v32, "scheduleDeepScanWithReason:", CFSTR("Server zone has caught up"));
            }
            if ((objc_msgSend(v32, "state") & 0x400000) != 0)
            {
              objc_msgSend(v32, "clearStateBits:", 0x400000);
              v29 = 1;
            }
          }
          v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v132, v159, 16);
        }
        while (v28);

        if ((v29 & 1) != 0)
          -[BRCClientZone _fixupMissingCrossMovedItems](self, "_fixupMissingCrossMovedItems");
      }
      else
      {

      }
    }
    if ((-[BRCClientZone syncState](self, "syncState") & 0x82) == 0x80)
    {
      -[BRCPQLConnection execute:](self->_db, "execute:", CFSTR("UPDATE client_items SET item_local_diffs = (item_local_diffs & (~%lld)) WHERE zone_rowid = %@ AND (item_local_diffs & %lld) != 0"), 0x1000000000000000, self->_dbRowID, 0x1000000000000000);
      v37 = -[BRCPQLConnection changes](self->_db, "changes");
      brc_bread_crumbs();
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v39 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
        -[BRCClientZone didSyncDownRequestID:maxApplyRank:caughtUpWithServer:syncDownDate:].cold.3();

      -[BRCClientZone clearSyncStateBits:](self, "clearSyncStateBits:", 128);
      if (v37)
      {
        -[BRCAccountSession applyScheduler](self->_session, "applyScheduler");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "rescheduleSuspendedJobsMatching:inState:", self->_serverZone, 22);

      }
    }
    v41 = self->_requestID;
    if (v41 != a3 && v41)
    {
      if ((a3 | 1) == v41)
      {
        brc_bread_crumbs();
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v43 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
          -[BRCClientZone didSyncDownRequestID:maxApplyRank:caughtUpWithServer:syncDownDate:].cold.2();

      }
      else
      {
        brc_bread_crumbs();
        v108 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v109 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v109, OS_LOG_TYPE_DEFAULT))
        {
          v110 = self->_requestID;
          *(_DWORD *)buf = 134218754;
          v145 = a3;
          v146 = 2048;
          v147 = v110;
          v148 = 2112;
          v149 = self;
          v150 = 2112;
          v151 = (uint64_t)v108;
          _os_log_impl(&dword_1CBD43000, v109, OS_LOG_TYPE_DEFAULT, "[WARNING] Marking latest sync request failed because the requestIDs differ %llu vs %llu for %@\n%@", buf, 0x2Au);
        }

        if (self->_requestID < a3)
          self->_requestID = a3;
        -[BRCClientZone _markLatestSyncRequestFailed](self, "_markLatestSyncRequestFailed");
        v111 = atomic_load(&self->_syncState);
        if ((v111 & 0x100) != 0 && !self->_lastSyncUpError)
        {
          objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D10B70], 32, 0);
          v112 = (void *)objc_claimAutoreleasedReturnValue();
          -[BRCSyncOperationBackoffRatio newSyncOperationWithError:](self->_syncUpBackoffRatio, "newSyncOperationWithError:", v112);
          -[BRCSyncOperationThrottle updateForError:](self->_syncUpThrottle, "updateForError:", v112);

        }
      }
      goto LABEL_162;
    }
    if (!v41)
      self->_requestID = a3;
    v130 = 0u;
    v131 = 0u;
    v128 = 0u;
    v129 = 0u;
    -[BRCClientZone itemsWithInFlightDiffsEnumerator](self, "itemsWithInFlightDiffsEnumerator");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v123 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v128, v158, 16);
    if (v123)
    {
      v121 = *(_QWORD *)v129;
      do
      {
        v44 = 0;
        do
        {
          if (*(_QWORD *)v129 != v121)
            objc_enumerationMutation(obj);
          v45 = *(void **)(*((_QWORD *)&v128 + 1) + 8 * v44);
          v46 = (void *)MEMORY[0x1D17A6BE8]();
          objc_msgSend(v45, "itemID");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          -[BRCClientZone serverItemByItemID:](self, "serverItemByItemID:", v47);
          v48 = (BRCClientZone *)objc_claimAutoreleasedReturnValue();

          v49 = objc_msgSend(v45, "isSharedToMeTopLevelItem");
          if (v48)
            v50 = 0;
          else
            v50 = v49;
          if (v50 == 1)
          {
            session = self->_session;
            -[BRCClientZone serverZone](self, "serverZone");
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            -[BRCAccountSession serverAliasItemForSharedItem:inZone:](session, "serverAliasItemForSharedItem:inZone:", v45, v52);
            v48 = (BRCClientZone *)objc_claimAutoreleasedReturnValue();

          }
          brc_bread_crumbs();
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v54 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v54, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 134218754;
            v145 = a3;
            v146 = 2112;
            v147 = (unint64_t)v45;
            v148 = 2112;
            v149 = v48;
            v150 = 2112;
            v151 = (uint64_t)v53;
            _os_log_debug_impl(&dword_1CBD43000, v54, OS_LOG_TYPE_DEBUG, "[DEBUG] received item in request:%llu\n   local:  %@\n   server: %@\n%@", buf, 0x2Au);
          }

          if (objc_msgSend(v45, "isBRAlias"))
          {
            if (v48)
            {
              v55 = (objc_msgSend(v45, "diffAgainstServerItem:", v48) & 0x63) == 1;
              objc_msgSend(v119, "createApplyJobFromServerItem:localItem:state:kind:", v48, 0, 1, 2);
              if (v55)
                objc_msgSend(v45, "updateStructuralCKInfoFromServerItem:", v48);
              goto LABEL_109;
            }
            goto LABEL_114;
          }
          v56 = objc_msgSend(v45, "isSharedToMeTopLevelItem");
          if (v48)
          {
            if (v56 && -[BRCClientZone isBRAlias](v48, "isBRAlias"))
            {
              objc_msgSend(v45, "asSharedToMeTopLevelItem");
              v57 = (void *)objc_claimAutoreleasedReturnValue();
              v58 = objc_msgSend(v57, "diffAgainstServerAliasItem:", v48);

            }
            else
            {
              v58 = objc_msgSend(v45, "diffAgainstServerItem:", v48);
            }
            if ((objc_msgSend(v45, "localDiffs") & 0x1000000000000000) != 0)
            {
              v59 = 0;
            }
            else
            {
              if ((v58 & 0x7FFF) == 1)
                v59 = objc_msgSend(v45, "physicalNameNeedsRename") ^ 1;
              else
                v59 = 0;
              if ((v58 & 0x3FF0000) == 0x10000)
              {
                v72 = objc_msgSend(v45, "isDocument");
                goto LABEL_103;
              }
            }
            v72 = 0;
LABEL_103:
            brc_bread_crumbs();
            v73 = (void *)objc_claimAutoreleasedReturnValue();
            brc_default_log();
            v74 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v74, OS_LOG_TYPE_DEBUG))
            {
              BRCItemFieldsPrettyPrint();
              v88 = objc_claimAutoreleasedReturnValue();
              v89 = (void *)v88;
              *(_DWORD *)buf = 134219522;
              if (v59)
                v90 = "YES";
              else
                v90 = "NO";
              v145 = a3;
              if (v72)
                v91 = "YES";
              else
                v91 = "NO";
              v146 = 2112;
              v147 = (unint64_t)v45;
              v148 = 2112;
              v149 = v48;
              v150 = 2112;
              v151 = v88;
              v152 = 2080;
              v153 = v90;
              v154 = 2080;
              v155 = v91;
              v156 = 2112;
              v157 = v73;
              _os_log_debug_impl(&dword_1CBD43000, v74, OS_LOG_TYPE_DEBUG, "[DEBUG] item acknowledged in requestID:%llu\n   local:  %@\n   server: %@\n   diffs:  %@\n learning etag: structural:%s content:%s%@", buf, 0x48u);

            }
            objc_msgSend(v119, "createApplyJobFromServerItem:localItem:state:kind:", v48, 0, 1, 2);
            if ((v59 & 1) != 0)
            {
              objc_msgSend(v45, "updateStructuralCKInfoFromServerItem:", v48);
              if ((v72 & 1) == 0)
                goto LABEL_109;
            }
            else if (!v72)
            {
              goto LABEL_109;
            }
            objc_msgSend(v45, "asDocument");
            v75 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v75, "updateContentsCKInfoAndDeviceIDFromServerItem:", v48);

            goto LABEL_109;
          }
          if (!v56 || !-[BRCClientZone isPrivateZone](self, "isPrivateZone"))
          {
            memset(v127, 0, sizeof(v127));
            __brc_create_section(0, (uint64_t)"-[BRCClientZone didSyncDownRequestID:maxApplyRank:caughtUpWithServer:syncDownDate:]", 2889, v127);
            brc_bread_crumbs();
            v66 = (BRCClientZone *)objc_claimAutoreleasedReturnValue();
            brc_default_log();
            v67 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v67, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 134218498;
              v145 = v127[0];
              v146 = 2112;
              v147 = (unint64_t)v45;
              v148 = 2112;
              v149 = v66;
              _os_log_debug_impl(&dword_1CBD43000, v67, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx Resolving server-side folded path-match for: %@%@", buf, 0x20u);
            }

            objc_msgSend(v45, "st");
            v68 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v68, "parentID");
            v69 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v45, "st");
            v70 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v70, "logicalNameWithoutLocalBounce");
            v71 = (void *)objc_claimAutoreleasedReturnValue();
            -[BRCClientZone serverItemByParentID:andLogicalName:](self, "serverItemByParentID:andLogicalName:", v69, v71);
            v48 = (BRCClientZone *)objc_claimAutoreleasedReturnValue();

            if (v48)
            {
              if ((-[BRCClientZone canPathMatchMergeWithLocalItem:](v48, "canPathMatchMergeWithLocalItem:", v45) & 1) != 0)
              {
                if (objc_msgSend(v45, "isDead"))
                {
                  __brc_leave_section(v127);
LABEL_148:
                  objc_msgSend(v119, "createApplyJobFromServerItem:localItem:state:kind:", v48, 0, 1, 2);
LABEL_109:
                  -[BRCServerZone dbRowID](self->_serverZone, "dbRowID");
                  v76 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v45, "markLatestSyncRequestAcknowledgedInZone:", v76);

                  objc_msgSend(v45, "saveToDBForServerEdit:keepAliases:", 1, 0);
                  goto LABEL_117;
                }
                -[BRCClientZone itemID](v48, "itemID");
                v82 = (void *)objc_claimAutoreleasedReturnValue();
                -[BRCClientZone itemByItemID:](self, "itemByItemID:", v82);
                v83 = (BRCItemToPathLookup *)objc_claimAutoreleasedReturnValue();
                brc_bread_crumbs();
                v84 = (void *)objc_claimAutoreleasedReturnValue();
                brc_default_log();
                v85 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v85, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138412546;
                  v145 = (unint64_t)v48;
                  v146 = 2112;
                  v147 = (unint64_t)v84;
                  _os_log_debug_impl(&dword_1CBD43000, v85, OS_LOG_TYPE_DEBUG, "[DEBUG] Found a path-match in the server truth: %@%@", buf, 0x16u);
                }

                if (-[BRCItemToPathLookup isReserved](v83, "isReserved"))
                {
                  brc_bread_crumbs();
                  v86 = (void *)objc_claimAutoreleasedReturnValue();
                  brc_default_log();
                  v87 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v87, OS_LOG_TYPE_DEBUG))
                  {
                    *(_DWORD *)buf = 138412546;
                    v145 = (unint64_t)v83;
                    v146 = 2112;
                    v147 = (unint64_t)v86;
                    _os_log_debug_impl(&dword_1CBD43000, v87, OS_LOG_TYPE_DEBUG, "[DEBUG] killing local reserved item for the path-match: %@%@", buf, 0x16u);
                  }

                  -[BRCItemToPathLookup markDead](v83, "markDead");
                  -[BRCItemToPathLookup saveToDBForServerEdit:keepAliases:](v83, "saveToDBForServerEdit:keepAliases:", 1, 1);
                  goto LABEL_140;
                }
                if (v83)
                {
                  if (-[BRCItemToPathLookup isFault](v83, "isFault"))
                  {
                    v92 = -[BRCItemToPathLookup initWithItem:]([BRCItemToPathLookup alloc], "initWithItem:", v83);
                    v126 = 0;
                    -[BRCItemToPathLookup byPath](v92, "byPath");
                    v93 = (void *)objc_claimAutoreleasedReturnValue();
                    v124[0] = MEMORY[0x1E0C809B0];
                    v124[1] = 3221225472;
                    v124[2] = __83__BRCClientZone_didSyncDownRequestID_maxApplyRank_caughtUpWithServer_syncDownDate___block_invoke_211;
                    v124[3] = &unk_1E875EF40;
                    v94 = v83;
                    v125 = v94;
                    v95 = objc_msgSend(v93, "performOnOpenParentFileDescriptor:error:", v124, &v126);

                    if (v95)
                    {
                      brc_bread_crumbs();
                      v96 = (void *)objc_claimAutoreleasedReturnValue();
                      brc_default_log();
                      v97 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v97, OS_LOG_TYPE_DEBUG))
                      {
                        *(_DWORD *)buf = 138412546;
                        v145 = (unint64_t)v94;
                        v146 = 2112;
                        v147 = (unint64_t)v96;
                        v98 = v97;
                        v99 = "[DEBUG] path-match is known and is an unmodified fault on the file-system: %@%@";
                        goto LABEL_150;
                      }
                    }
                    else
                    {
                      brc_bread_crumbs();
                      v96 = (void *)objc_claimAutoreleasedReturnValue();
                      brc_default_log();
                      v97 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v97, OS_LOG_TYPE_DEBUG))
                      {
                        *(_DWORD *)buf = 138412546;
                        v145 = (unint64_t)v94;
                        v146 = 2112;
                        v147 = (unint64_t)v96;
                        v98 = v97;
                        v99 = "[DEBUG] path-match is known and is a fault on the file-system that moved, but still treati"
                              "ng it as if it were there: %@%@";
LABEL_150:
                        _os_log_debug_impl(&dword_1CBD43000, v98, OS_LOG_TYPE_DEBUG, v99, buf, 0x16u);
                      }
                    }

                    -[BRCItemToPathLookup markNeedsDeleteForRescheduleOfItem:](v94, "markNeedsDeleteForRescheduleOfItem:", 0);
                    -[BRCItemToPathLookup saveToDBForServerEdit:keepAliases:](v94, "saveToDBForServerEdit:keepAliases:", 1, 1);

                    -[BRCItemToPathLookup byFileSystemID](v92, "byFileSystemID");
                    v103 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v45, "learnItemID:serverItem:path:markLost:", v82, v48, v103, 1);

                    -[BRCItemToPathLookup closePaths](v92, "closePaths");
                  }
                  else
                  {
                    brc_bread_crumbs();
                    v101 = (void *)objc_claimAutoreleasedReturnValue();
                    brc_default_log();
                    v102 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v102, OS_LOG_TYPE_DEBUG))
                    {
                      *(_DWORD *)buf = 138412546;
                      v145 = (unint64_t)v83;
                      v146 = 2112;
                      v147 = (unint64_t)v101;
                      _os_log_debug_impl(&dword_1CBD43000, v102, OS_LOG_TYPE_DEBUG, "[DEBUG] path-match is known but live on the file-system: %@%@", buf, 0x16u);
                    }

                    v48 = 0;
                    v92 = v83;
                  }

                }
                else
                {
                  brc_bread_crumbs();
                  v83 = (BRCItemToPathLookup *)objc_claimAutoreleasedReturnValue();
                  brc_default_log();
                  v100 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v100, OS_LOG_TYPE_DEBUG))
                  {
                    objc_msgSend(v45, "itemID");
                    v104 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138412802;
                    v145 = (unint64_t)v82;
                    v146 = 2112;
                    v147 = (unint64_t)v104;
                    v148 = 2112;
                    v149 = (BRCClientZone *)v83;
                    _os_log_debug_impl(&dword_1CBD43000, v100, OS_LOG_TYPE_DEBUG, "[DEBUG] path-match is new, learn new item ID %@ instead of %@%@", buf, 0x20u);

                  }
LABEL_140:

                  objc_msgSend(v45, "learnItemID:serverItem:path:markLost:", v82, v48, 0, 1);
                }

                __brc_leave_section(v127);
                if (v48)
                  goto LABEL_148;
LABEL_114:
                brc_bread_crumbs();
                v79 = (void *)objc_claimAutoreleasedReturnValue();
                brc_default_log();
                v80 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v80, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138412290;
                  v145 = (unint64_t)v79;
                  _os_log_debug_impl(&dword_1CBD43000, v80, OS_LOG_TYPE_DEBUG, "[DEBUG] we couldn't find a suitable path-match, mark the item as rejected%@", buf, 0xCu);
                }

                -[BRCServerZone dbRowID](self->_serverZone, "dbRowID");
                v81 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v45, "markLatestSyncRequestRejectedInZone:", v81);

                objc_msgSend(v45, "saveToDBForServerEdit:keepAliases:", 1, 0);
                goto LABEL_117;
              }
              brc_bread_crumbs();
              v77 = (BRCClientZone *)objc_claimAutoreleasedReturnValue();
              brc_default_log();
              v78 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v78, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412802;
                v145 = (unint64_t)v48;
                v146 = 2112;
                v147 = (unint64_t)v45;
                v148 = 2112;
                v149 = v77;
                _os_log_impl(&dword_1CBD43000, v78, OS_LOG_TYPE_DEFAULT, "[WARNING] Can't merge %@ with %@%@", buf, 0x20u);
              }

            }
            __brc_leave_section(v127);
            goto LABEL_114;
          }
          brc_bread_crumbs();
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v61 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v61, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412546;
            v145 = (unint64_t)v45;
            v146 = 2112;
            v147 = (unint64_t)v60;
            _os_log_debug_impl(&dword_1CBD43000, v61, OS_LOG_TYPE_DEBUG, "[DEBUG] Alias was rejected when syncing up in private zone %@%@", buf, 0x16u);
          }

          -[BRCServerZone dbRowID](self->_serverZone, "dbRowID");
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "markLatestSyncRequestAcknowledgedInZone:", v62);

          objc_msgSend(v45, "saveToDBForServerEdit:keepAliases:", 1, 0);
          objc_msgSend(v45, "clientZone");
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "itemID");
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v63, "serverItemByItemID:", v64);
          v65 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v119, "createApplyJobFromServerItem:localItem:state:kind:", v65, v45, 1, 2);
LABEL_117:
          objc_autoreleasePoolPop(v46);
          ++v44;
        }
        while (v123 != v44);
        v105 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v128, v158, 16);
        v123 = v105;
      }
      while (v105);
    }

    brc_bread_crumbs();
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v107 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v107, OS_LOG_TYPE_DEBUG))
      -[BRCClientZone didSyncDownRequestID:maxApplyRank:caughtUpWithServer:syncDownDate:].cold.1();

    -[BRCClientZone scheduleSyncUp](self, "scheduleSyncUp");
    -[BRCClientZone _markRequestIDAcked](self, "_markRequestIDAcked");
    -[BRCClientZone recomputeAllItemsDidUploadState](self, "recomputeAllItemsDidUploadState");
  }
  else
  {
    brc_bread_crumbs();
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v145 = (unint64_t)v35;
      _os_log_impl(&dword_1CBD43000, v36, OS_LOG_TYPE_DEFAULT, "[WARNING] not enumerating in-flight items until we are caught up.%@", buf, 0xCu);
    }

  }
LABEL_162:

}

uint64_t __83__BRCClientZone_didSyncDownRequestID_maxApplyRank_caughtUpWithServer_syncDownDate___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  int v6;
  int v7;
  uint64_t v8;
  int v9;

  v4 = a2;
  v5 = a3;
  v6 = objc_msgSend(v4, "nonDiscretionary");
  v7 = objc_msgSend(v5, "nonDiscretionary");
  if (!v6 || v7)
  {
    v9 = objc_msgSend(v5, "nonDiscretionary");
    v8 = v9 & (objc_msgSend(v4, "nonDiscretionary") ^ 1);
  }
  else
  {
    v8 = -1;
  }

  return v8;
}

uint64_t __83__BRCClientZone_didSyncDownRequestID_maxApplyRank_caughtUpWithServer_syncDownDate___block_invoke_211(uint64_t a1, int a2)
{
  void *v3;
  void *v4;
  int v5;
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "st");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "filename");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = BRCUnlinkAt(a2, v4, 0);

  result = 0;
  if (v5 < 0)
    return *__error();
  return result;
}

- (BOOL)_crossZoneMoveDocumentsToZone:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  char v7;
  void *v8;
  NSObject *v9;
  BRCAccountSession *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  BRCAccountSession *v15;
  _QWORD v17[4];
  id v18;
  id v19;
  BRCClientZone *v20;
  BRCAccountSession *v21;
  id v22;
  uint64_t v23[3];
  uint8_t buf[4];
  uint64_t v25;
  __int16 v26;
  BRCClientZone *v27;
  __int16 v28;
  id v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[BRCClientZone isEqualToClientZone:](self, "isEqualToClientZone:", v4))
  {
    brc_bread_crumbs();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      -[BRCClientZone _crossZoneMoveDocumentsToZone:].cold.1();

    v7 = 0;
  }
  else
  {
    memset(v23, 0, sizeof(v23));
    __brc_create_section(0, (uint64_t)"-[BRCClientZone _crossZoneMoveDocumentsToZone:]", 3031, v23);
    brc_bread_crumbs();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218754;
      v25 = v23[0];
      v26 = 2112;
      v27 = self;
      v28 = 2112;
      v29 = v4;
      v30 = 2112;
      v31 = v8;
      _os_log_debug_impl(&dword_1CBD43000, v9, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx cross zone move documents from %@ to %@%@", buf, 0x2Au);
    }

    v10 = self->_session;
    -[BRCClientZone db](self, "db");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCClientZone asPrivateClientZone](self, "asPrivateClientZone");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __47__BRCClientZone__crossZoneMoveDocumentsToZone___block_invoke;
    v17[3] = &unk_1E8762CC0;
    v13 = v12;
    v18 = v13;
    v14 = v11;
    v19 = v14;
    v20 = self;
    v15 = v10;
    v21 = v15;
    v22 = v4;
    v7 = objc_msgSend(v14, "performWithFlags:action:", 24, v17);

    __brc_leave_section(v23);
  }

  return v7;
}

uint64_t __47__BRCClientZone__crossZoneMoveDocumentsToZone___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  void *v21;
  void *v22;
  BRCItemToPathLookup *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  NSObject *v48;
  uint64_t v49;
  void *v50;
  NSObject *v51;
  NSObject *v52;
  void *v53;
  void *v54;
  int v55;
  void *v56;
  void *v57;
  void *v58;
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
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  NSObject *v83;
  uint64_t v84;
  void *v85;
  NSObject *v86;
  void *v87;
  void *v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t k;
  void *v93;
  void *v94;
  char v95;
  void *v96;
  void *v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t m;
  void *v102;
  uint64_t v103;
  void *v104;
  NSObject *v105;
  NSObject *v106;
  void *v107;
  NSObject *v108;
  void *v109;
  NSObject *v110;
  void *v111;
  NSObject *v112;
  void *v114;
  void *v115;
  id v116;
  id *v117;
  id obj;
  id obja;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  _QWORD v128[5];
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  _QWORD v133[5];
  id v134;
  _QWORD v135[5];
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  _BYTE v144[128];
  uint8_t v145[128];
  uint8_t buf[4];
  uint64_t v147;
  __int16 v148;
  void *v149;
  __int16 v150;
  NSObject *v151;
  __int16 v152;
  void *v153;
  _BYTE v154[128];
  _BYTE v155[128];
  _BYTE v156[128];
  uint64_t v157;

  v157 = *MEMORY[0x1E0C80C00];
  v116 = a2;
  v140 = 0u;
  v141 = 0u;
  v142 = 0u;
  v143 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "itemsWithInFlightDiffsEnumerator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v140, v156, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v141;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v141 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v140 + 1) + 8 * i);
        v9 = (void *)MEMORY[0x1D17A6BE8]();
        objc_msgSend(*(id *)(a1 + 32), "serverZone");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "dbRowID");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "markLatestSyncRequestFailedInZone:", v11);

        objc_msgSend(v8, "saveToDB");
        objc_autoreleasePoolPop(v9);
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v140, v156, 16);
    }
    while (v5);
  }

  v12 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "dbRowID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v12, "fetch:", CFSTR("SELECT rowid, zone_rowid, item_id, item_creator_id, item_sharing_options, item_side_car_ckinfo, item_parent_zone_rowid, item_localsyncupstate, item_local_diffs, item_notifs_rank, app_library_rowid, item_min_supported_os_rowid, item_user_visible, item_stat_ckinfo, item_state, item_type, item_mode, item_birthtime, item_lastusedtime, item_favoriterank,item_parent_id, item_filename, item_hidden_ext, item_finder_tags, item_xattr_signature, item_trash_put_back_path, item_trash_put_back_parent_id, item_alias_target, item_creator, item_doc_id, item_file_id, item_generation, item_localname, item_processing_stamp, item_staged_file_id, item_staged_generation, item_bouncedname, item_scope, item_tmpbounceno, version_name, version_ckinfo, version_mtime, version_size, version_thumb_size, version_thumb_signature, version_content_signature, version_xattr_signature, version_edited_since_shared, version_device, version_conflict_loser_etags, version_quarantine_info, version_uploaded_assets, version_upload_error, version_old_zone_item_id, version_old_zone_rowid, desired_version, item_live_conflict_loser_etags, item_thumb_live_signature, item_thumb_greedy, version_block_sync_until_bundle_id, version_block_sync_until_timestamp FROM client_items WHERE zone_rowid = %@ AND item_type = 3 AND item_state IN (0, -1)"), v13);

  v138 = 0u;
  v139 = 0u;
  v136 = 0u;
  v137 = 0u;
  v135[0] = MEMORY[0x1E0C809B0];
  v135[1] = 3221225472;
  v135[2] = __47__BRCClientZone__crossZoneMoveDocumentsToZone___block_invoke_2;
  v135[3] = &unk_1E875E2C8;
  v117 = (id *)(a1 + 40);
  obj = v14;
  v135[4] = *(_QWORD *)(a1 + 48);
  objc_msgSend(v14, "enumerateObjects:", v135);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v136, v155, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v137;
    do
    {
      for (j = 0; j != v17; ++j)
      {
        if (*(_QWORD *)v137 != v18)
          objc_enumerationMutation(v15);
        v20 = *(void **)(*((_QWORD *)&v136 + 1) + 8 * j);
        v21 = (void *)MEMORY[0x1D17A6BE8]();
        objc_msgSend(v20, "asBRAlias");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v22, "isKnownByServer"))
        {
          v23 = -[BRCItemToPathLookup initWithItem:]([BRCItemToPathLookup alloc], "initWithItem:", v22);
          *(_DWORD *)buf = 0;
          -[BRCItemToPathLookup parentPath](v23, "parentPath");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v133[0] = MEMORY[0x1E0C809B0];
          v133[1] = 3221225472;
          v133[2] = __47__BRCClientZone__crossZoneMoveDocumentsToZone___block_invoke_3;
          v133[3] = &unk_1E875DEB8;
          v133[4] = *(_QWORD *)(a1 + 48);
          v134 = v22;
          objc_msgSend(v24, "performOnOpenFileDescriptor:error:", v133, buf);

          -[BRCItemToPathLookup closePaths](v23, "closePaths");
        }

        objc_autoreleasePoolPop(v21);
      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v136, v155, 16);
    }
    while (v17);
  }

  v25 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "dbRowID");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = (void *)objc_msgSend(v25, "fetch:", CFSTR("SELECT rowid, zone_rowid, item_id, item_creator_id, item_sharing_options, item_side_car_ckinfo, item_parent_zone_rowid, item_localsyncupstate, item_local_diffs, item_notifs_rank, app_library_rowid, item_min_supported_os_rowid, item_user_visible, item_stat_ckinfo, item_state, item_type, item_mode, item_birthtime, item_lastusedtime, item_favoriterank,item_parent_id, item_filename, item_hidden_ext, item_finder_tags, item_xattr_signature, item_trash_put_back_path, item_trash_put_back_parent_id, item_alias_target, item_creator, item_doc_id, item_file_id, item_generation, item_localname, item_processing_stamp, item_staged_file_id, item_staged_generation, item_bouncedname, item_scope, item_tmpbounceno, version_name, version_ckinfo, version_mtime, version_size, version_thumb_size, version_thumb_signature, version_content_signature, version_xattr_signature, version_edited_since_shared, version_device, version_conflict_loser_etags, version_quarantine_info, version_uploaded_assets, version_upload_error, version_old_zone_item_id, version_old_zone_rowid, desired_version, item_live_conflict_loser_etags, item_thumb_live_signature, item_thumb_greedy, version_block_sync_until_bundle_id, version_block_sync_until_timestamp FROM client_items WHERE zone_rowid = %@ AND item_type in (1, 2, 6, 7)"), v26);

  v131 = 0u;
  v132 = 0u;
  v129 = 0u;
  v130 = 0u;
  v128[0] = MEMORY[0x1E0C809B0];
  v128[1] = 3221225472;
  v128[2] = __47__BRCClientZone__crossZoneMoveDocumentsToZone___block_invoke_4;
  v128[3] = &unk_1E875E2C8;
  v128[4] = *(_QWORD *)(a1 + 48);
  v115 = v27;
  objc_msgSend(v27, "enumerateObjects:", v128);
  obja = (id)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v129, v154, 16);
  if (v28)
  {
    v29 = v28;
    v30 = *(_QWORD *)v130;
    do
    {
      v31 = 0;
      do
      {
        if (*(_QWORD *)v130 != v30)
          objc_enumerationMutation(obja);
        v32 = *(void **)(*((_QWORD *)&v129 + 1) + 8 * v31);
        v33 = (void *)MEMORY[0x1D17A6BE8]();
        brc_bread_crumbs();
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v35 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412546;
          v147 = (uint64_t)v32;
          v148 = 2112;
          v149 = v34;
          _os_log_debug_impl(&dword_1CBD43000, v35, OS_LOG_TYPE_DEBUG, "[DEBUG] cleaning up %@%@", buf, 0x16u);
        }

        objc_msgSend(v32, "asDocument");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 56), "fsUploader");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "cancelAndCleanupItemUpload:", v36);

        objc_msgSend(*(id *)(a1 + 56), "fsDownloader");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "cancelAndCleanupItemDownloads:", v36);

        objc_msgSend(v36, "currentVersion");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "uploadedAssets");
        v40 = (void *)objc_claimAutoreleasedReturnValue();

        if (v40 || objc_msgSend(v36, "needsUpload"))
        {
          objc_msgSend(v36, "markNeedsReading");
          objc_msgSend(v36, "saveToDB");
        }
        v41 = *(void **)(a1 + 40);
        objc_msgSend(*(id *)(a1 + 64), "dbRowID");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "execute:", CFSTR("UPDATE client_uploads SET zone_rowid = %@ WHERE throttle_id = %lld"), v42, objc_msgSend(v36, "dbRowID"));

        v43 = *(void **)(a1 + 40);
        objc_msgSend(*(id *)(a1 + 64), "dbRowID");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "execute:", CFSTR("UPDATE client_downloads SET zone_rowid = %@ WHERE throttle_id = %lld"), v44, objc_msgSend(v36, "dbRowID"));

        v45 = *(void **)(a1 + 40);
        objc_msgSend(*(id *)(a1 + 64), "dbRowID");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "execute:", CFSTR("UPDATE client_reader_throttle SET zone_rowid = %@ WHERE throttle_id = %lld"), v46, objc_msgSend(v36, "dbRowID"));

        if (objc_msgSend(v36, "needsReading") && objc_msgSend(*v117, "changes") <= 0)
        {
          brc_bread_crumbs();
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v48 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v48, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 138412290;
            v147 = (uint64_t)v47;
            _os_log_fault_impl(&dword_1CBD43000, v48, OS_LOG_TYPE_FAULT, "[CRIT] Assertion failed: !document.needsReading || db.changes > 0%@", buf, 0xCu);
          }

        }
        objc_autoreleasePoolPop(v33);
        ++v31;
      }
      while (v29 != v31);
      v49 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v129, v154, 16);
      v29 = v49;
    }
    while (v49);
  }

  objc_msgSend(v115, "error");
  v50 = (void *)objc_claimAutoreleasedReturnValue();

  if (v50)
  {
    brc_bread_crumbs();
    v51 = objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v52 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v52, OS_LOG_TYPE_FAULT))
      __47__BRCClientZone__crossZoneMoveDocumentsToZone___block_invoke_cold_7();
LABEL_101:
    v103 = 0;
    goto LABEL_102;
  }
  v53 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "dbRowID");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = objc_msgSend(v53, "execute:", CFSTR("DELETE FROM client_unapplied_table WHERE zone_rowid = %@"), v54);

  if (v55)
  {
    v56 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 64), "dbRowID");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "dbRowID");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = objc_msgSend(v56, "execute:", CFSTR("UPDATE client_sync_up SET zone_rowid = %@ WHERE zone_rowid = %@   AND throttle_state != 0"), v57, v58);

    if (v55)
    {
      v59 = *(void **)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 32), "dbRowID");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      v55 = objc_msgSend(v59, "execute:", CFSTR("DELETE FROM client_sync_up WHERE zone_rowid = %@   AND throttle_state = 0"), v60);

      if (v55)
      {
        v61 = *(void **)(a1 + 40);
        objc_msgSend(*(id *)(a1 + 32), "dbRowID");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        v55 = objc_msgSend(v61, "execute:", CFSTR("DELETE FROM client_uploads WHERE zone_rowid = %@"), v62);

      }
    }
  }
  if (!objc_msgSend(*v117, "changes"))
  {
    if (!v55)
      goto LABEL_45;
    goto LABEL_44;
  }
  brc_bread_crumbs();
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v108 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v108, OS_LOG_TYPE_FAULT))
    __47__BRCClientZone__crossZoneMoveDocumentsToZone___block_invoke_cold_4();

  if (v55)
  {
LABEL_44:
    v63 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "dbRowID");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = objc_msgSend(v63, "execute:", CFSTR("DELETE FROM client_downloads WHERE zone_rowid = %@"), v64);

  }
LABEL_45:
  if (!objc_msgSend(*v117, "changes"))
  {
    if (!v55)
      goto LABEL_48;
    goto LABEL_47;
  }
  brc_bread_crumbs();
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v110 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v110, OS_LOG_TYPE_FAULT))
    __47__BRCClientZone__crossZoneMoveDocumentsToZone___block_invoke_cold_4();

  if (v55)
  {
LABEL_47:
    v65 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "dbRowID");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = objc_msgSend(v65, "execute:", CFSTR("DELETE FROM client_reader_throttle WHERE zone_rowid = %@"), v66);

  }
LABEL_48:
  if (objc_msgSend(*v117, "changes"))
  {
    brc_bread_crumbs();
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v112 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v112, OS_LOG_TYPE_FAULT))
      __47__BRCClientZone__crossZoneMoveDocumentsToZone___block_invoke_cold_4();

    if (!v55)
      goto LABEL_99;
  }
  else if (!v55)
  {
    goto LABEL_99;
  }
  v67 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "dbRowID");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v67) = objc_msgSend(v67, "execute:", CFSTR("DELETE FROM client_items WHERE zone_rowid = %@ AND item_type = 3"), v68);

  if (!(_DWORD)v67)
    goto LABEL_99;
  v69 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 64), "dbRowID");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "dbRowID");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v69) = objc_msgSend(v69, "execute:", CFSTR("UPDATE client_items SET zone_rowid = %@,   item_stat_ckinfo = call_block(%p, item_stat_ckinfo),   version_ckinfo   = call_block(%p, version_ckinfo),   item_local_diffs = (item_local_diffs | %lld)  WHERE zone_rowid = %@"), v70, &__block_literal_global_238, &__block_literal_global_238, 0x2000000000000000, v71);

  if (!(_DWORD)v69)
    goto LABEL_99;
  v72 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 64), "dbRowID");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "dbRowID");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v72) = objc_msgSend(v72, "execute:", CFSTR("UPDATE client_items SET item_parent_zone_rowid = %@ WHERE item_parent_zone_rowid = %@"), v73, v74);

  if (!(_DWORD)v72)
    goto LABEL_99;
  v75 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "dbRowID");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v75) = objc_msgSend(v75, "execute:", CFSTR("UPDATE client_items SET version_old_zone_rowid = NULL, version_old_zone_item_id = NULL WHERE version_old_zone_rowid = %@"), v76);

  if (!(_DWORD)v75)
    goto LABEL_99;
  v77 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 64), "dbRowID");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "dbRowID");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v77) = objc_msgSend(v77, "execute:", CFSTR("UPDATE client_items SET version_old_zone_rowid = %@ WHERE version_old_zone_rowid = %@"), v78, v79);

  if (!(_DWORD)v77
    || (v80 = *(void **)(a1 + 40),
        objc_msgSend(*(id *)(a1 + 32), "dbRowID"),
        v81 = (void *)objc_claimAutoreleasedReturnValue(),
        LOBYTE(v80) = objc_msgSend(v80, "execute:", CFSTR("DELETE FROM client_zones WHERE rowid = %@"), v81),
        v81,
        (v80 & 1) == 0))
  {
LABEL_99:
    brc_bread_crumbs();
    v51 = objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v52 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v52, OS_LOG_TYPE_FAULT))
      __47__BRCClientZone__crossZoneMoveDocumentsToZone___block_invoke_cold_3();
    goto LABEL_101;
  }
  brc_bread_crumbs();
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v83 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v83, OS_LOG_TYPE_DEFAULT))
  {
    v84 = objc_msgSend(*(id *)(a1 + 40), "changes");
    v85 = *(void **)(a1 + 32);
    v86 = *(NSObject **)(a1 + 64);
    *(_DWORD *)buf = 134218754;
    v147 = v84;
    v148 = 2112;
    v149 = v85;
    v150 = 2112;
    v151 = v86;
    v152 = 2112;
    v153 = v82;
    _os_log_impl(&dword_1CBD43000, v83, OS_LOG_TYPE_DEFAULT, "[NOTICE] cross zone moved %lld items from %@ to %@!%@", buf, 0x2Au);
  }

  objc_msgSend(*(id *)(a1 + 64), "scheduleSyncUp");
  objc_msgSend(*(id *)(a1 + 64), "scheduleSyncDownFirst");
  objc_msgSend(*(id *)(a1 + 32), "appLibraries");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  v88 = (void *)objc_msgSend(v87, "copy");

  v126 = 0u;
  v127 = 0u;
  v124 = 0u;
  v125 = 0u;
  v51 = v88;
  v89 = -[NSObject countByEnumeratingWithState:objects:count:](v51, "countByEnumeratingWithState:objects:count:", &v124, v145, 16);
  if (v89)
  {
    v90 = v89;
    v91 = *(_QWORD *)v125;
    while (2)
    {
      for (k = 0; k != v90; ++k)
      {
        if (*(_QWORD *)v125 != v91)
          objc_enumerationMutation(v51);
        v93 = *(void **)(*((_QWORD *)&v124 + 1) + 8 * k);
        objc_msgSend(*(id *)(a1 + 32), "removeAppLibrary:", v93);
        objc_msgSend(v93, "associateWithClientZone:", *(_QWORD *)(a1 + 64));
        objc_msgSend(v93, "setStateBits:", 6291456);
        objc_msgSend(*(id *)(a1 + 64), "serverZone");
        v94 = (void *)objc_claimAutoreleasedReturnValue();
        v95 = objc_msgSend(v94, "state");

        if ((v95 & 0x20) != 0)
          objc_msgSend(v93, "setStateBits:", 369098752);
        else
          objc_msgSend(v93, "clearStateBits:", 369098752);
        objc_msgSend(v93, "scheduleDeepScanWithReason:", CFSTR("cross-zone move"));
        if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 8), "saveAppLibraryToDB:", v93) & 1) == 0)
        {
          brc_bread_crumbs();
          v104 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v105 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v105, (os_log_type_t)0x90u))
            __47__BRCClientZone__crossZoneMoveDocumentsToZone___block_invoke_cold_2();
          v52 = v51;
          goto LABEL_87;
        }
      }
      v90 = -[NSObject countByEnumeratingWithState:objects:count:](v51, "countByEnumeratingWithState:objects:count:", &v124, v145, 16);
      if (v90)
        continue;
      break;
    }
  }

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 64), "defaultAppLibrary");
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v96, "addObject:", v97);

  v122 = 0u;
  v123 = 0u;
  v120 = 0u;
  v121 = 0u;
  v52 = v96;
  v98 = -[NSObject countByEnumeratingWithState:objects:count:](v52, "countByEnumeratingWithState:objects:count:", &v120, v144, 16);
  if (v98)
  {
    v99 = v98;
    v100 = *(_QWORD *)v121;
    while (2)
    {
      for (m = 0; m != v99; ++m)
      {
        if (*(_QWORD *)v121 != v100)
          objc_enumerationMutation(v52);
        v102 = *(void **)(*((_QWORD *)&v120 + 1) + 8 * m);
        objc_msgSend(v102, "setStateBits:", 0x200000);
        if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 8), "saveAppLibraryToDB:", v102) & 1) == 0)
        {
          brc_bread_crumbs();
          v105 = objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v106 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v106, (os_log_type_t)0x90u))
          {
            objc_msgSend(*v117, "lastError");
            v114 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412802;
            v147 = (uint64_t)v102;
            v148 = 2112;
            v149 = v114;
            v150 = 2112;
            v151 = v105;
            _os_log_error_impl(&dword_1CBD43000, v106, (os_log_type_t)0x90u, "[ERROR] can't save cross zone move state for appLibrary %@: %@%@", buf, 0x20u);

          }
          v104 = v52;
          goto LABEL_87;
        }
      }
      v99 = -[NSObject countByEnumeratingWithState:objects:count:](v52, "countByEnumeratingWithState:objects:count:", &v120, v144, 16);
      if (v99)
        continue;
      break;
    }
  }

  if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 8), "saveClientZoneToDB:", *(_QWORD *)(a1 + 64)) & 1) == 0)
  {
    brc_bread_crumbs();
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v105 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v105, (os_log_type_t)0x90u))
      __47__BRCClientZone__crossZoneMoveDocumentsToZone___block_invoke_cold_1();
LABEL_87:

    goto LABEL_101;
  }
  v103 = 1;
LABEL_102:

  return v103;
}

id __47__BRCClientZone__crossZoneMoveDocumentsToZone___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(v5, "session");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "session");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "clientDB");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v7, "newLocalItemFromPQLResultSet:db:error:", v6, v9, a3);

  return v10;
}

uint64_t __47__BRCClientZone__crossZoneMoveDocumentsToZone___block_invoke_3(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "fileUnlinker");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "st");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "filename");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(a2) = objc_msgSend(v4, "renameAndUnlinkInBackgroundItemAt:path:", a2, v6);

  return (a2 - 1);
}

id __47__BRCClientZone__crossZoneMoveDocumentsToZone___block_invoke_4(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(v5, "session");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "session");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "clientDB");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v7, "newLocalItemFromPQLResultSet:db:error:", v6, v9, a3);

  return v10;
}

void __47__BRCClientZone__crossZoneMoveDocumentsToZone___block_invoke_237(uint64_t a1, sqlite3_context *a2, uint64_t a3, _QWORD *a4)
{
  id v5;
  id v6;

  v6 = +[BRFieldCKInfo newFromSqliteValue:](BRFieldCKInfo, "newFromSqliteValue:", *a4);
  objc_msgSend(v6, "markCrossZoneMoved");
  objc_msgSend(v6, "data");
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  sqlite3_result_blob(a2, (const void *)objc_msgSend(v5, "bytes"), objc_msgSend(v5, "length"), (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);

}

- (BOOL)_hasAllItemsDidUploadHandlers
{
  -[BRCPQLConnection assertOnQueue](self->_db, "assertOnQueue");
  return self->_bubbleSyncTask || self->_allItemsDidUploadTrackers != 0;
}

- (void)_allItemsDidUploadWithError:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  UMUserSyncTask *bubbleSyncTask;
  UMUserSyncTask *v8;
  NSMutableArray *allItemsDidUploadTrackers;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSMutableArray *v15;
  void *v16;
  NSObject *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t v22[128];
  uint8_t buf[4];
  id v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[BRCPQLConnection assertOnQueue](self->_db, "assertOnQueue");
  if (!-[BRCClientZone _hasAllItemsDidUploadHandlers](self, "_hasAllItemsDidUploadHandlers"))
  {
    brc_bread_crumbs();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
      -[BRCClientZone _allItemsDidUploadWithError:].cold.2();

  }
  if (v4)
  {
    brc_bread_crumbs();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v24 = v4;
      v25 = 2112;
      v26 = v5;
      _os_log_impl(&dword_1CBD43000, v6, OS_LOG_TYPE_DEFAULT, "[WARNING] shared iPad: calling the upload handler because sync is failing: %@%@", buf, 0x16u);
    }
  }
  else
  {
    brc_bread_crumbs();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      -[BRCClientZone _allItemsDidUploadWithError:].cold.1((uint64_t)self);
  }

  bubbleSyncTask = self->_bubbleSyncTask;
  if (bubbleSyncTask)
  {
    -[UMUserSyncTask end](bubbleSyncTask, "end");
    v8 = self->_bubbleSyncTask;
    self->_bubbleSyncTask = 0;

  }
  allItemsDidUploadTrackers = self->_allItemsDidUploadTrackers;
  if (allItemsDidUploadTrackers)
  {
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v10 = allItemsDidUploadTrackers;
    v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v19;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v19 != v13)
            objc_enumerationMutation(v10);
          objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v14++), "clientZone:didFinishUploadingAllItemsWithError:", self, v4, (_QWORD)v18);
        }
        while (v12 != v14);
        v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v12);
    }

    v15 = self->_allItemsDidUploadTrackers;
    self->_allItemsDidUploadTrackers = 0;

  }
}

- (void)recomputeAllItemsDidUploadState
{
  NSError *lastSyncDownError;
  NSError **p_lastSyncDownError;
  NSError *lastSyncUpError;
  NSError *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  NSError *v10;
  id v11;
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  BRCClientZone *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[BRCPQLConnection assertOnQueue](self->_db, "assertOnQueue");
  if (-[BRCClientZone _hasAllItemsDidUploadHandlers](self, "_hasAllItemsDidUploadHandlers"))
  {
    p_lastSyncDownError = &self->_lastSyncDownError;
    lastSyncDownError = self->_lastSyncDownError;
    if ((lastSyncDownError && !-[NSError brc_isEverRetriable](lastSyncDownError, "brc_isEverRetriable")
       || (p_lastSyncDownError = &self->_lastSyncUpError, (lastSyncUpError = self->_lastSyncUpError) != 0)
       && !-[NSError brc_isEverRetriable](lastSyncUpError, "brc_isEverRetriable"))
      && (v6 = *p_lastSyncDownError) != 0)
    {
      v10 = v6;
      -[BRCClientZone _allItemsDidUploadWithError:](self, "_allItemsDidUploadWithError:", v6);

    }
    else
    {
      v11 = 0;
      -[BRCClientZone itemCountPendingUploadOrSyncUpAndReturnError:](self, "itemCountPendingUploadOrSyncUpAndReturnError:", &v11);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v7, "intValue"))
      {
        brc_bread_crumbs();
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412802;
          v13 = v7;
          v14 = 2112;
          v15 = self;
          v16 = 2112;
          v17 = v8;
          _os_log_debug_impl(&dword_1CBD43000, v9, OS_LOG_TYPE_DEBUG, "[DEBUG] shared iPad: Still need to sync up %@ more items for sync bubble for %@%@", buf, 0x20u);
        }

      }
      else
      {
        -[BRCClientZone _allItemsDidUploadWithError:](self, "_allItemsDidUploadWithError:", v11);
      }

    }
  }
}

- (void)handleRootRecordDeletion
{
  BRCPQLConnection *db;
  _QWORD v3[5];

  db = self->_db;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __41__BRCClientZone_handleRootRecordDeletion__block_invoke;
  v3[3] = &unk_1E875D8C8;
  v3[4] = self;
  -[BRCPQLConnection performWithFlags:action:](db, "performWithFlags:action:", 17, v3);
}

uint64_t __41__BRCClientZone_handleRootRecordDeletion__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  if (objc_msgSend(*(id *)(a1 + 32), "isPrivateZone"))
  {
    objc_msgSend(*(id *)(a1 + 32), "asPrivateClientZone");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "defaultAppLibrary");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "clearStateBits:", 2);

  }
  if ((objc_msgSend(*(id *)(a1 + 32), "isCloudDocsZone") & 1) == 0)
  {
    v4 = *(void **)(a1 + 32);
    objc_msgSend(v4, "asPrivateClientZone");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "defaultAppLibrary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dbRowID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[BRCItemID documentsItemIDWithAppLibraryRowID:](BRCItemID, "documentsItemIDWithAppLibraryRowID:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "itemByItemID:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "markForceNeedsSyncUp");
    objc_msgSend(v9, "saveToDB");

  }
  return 1;
}

- (void)didGCTombstoneRanks:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[BRCPQLConnection serialQueue](self->_db, "serialQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __37__BRCClientZone_didGCTombstoneRanks___block_invoke;
  v7[3] = &unk_1E875D470;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __37__BRCClientZone_didGCTombstoneRanks___block_invoke(uint64_t a1)
{
  uint64_t result;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;

  result = objc_msgSend(*(id *)(a1 + 32), "activated");
  if ((_DWORD)result)
  {
    brc_bread_crumbs();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      __37__BRCClientZone_didGCTombstoneRanks___block_invoke_cold_1(a1);

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 264), "removeIndexes:", *(_QWORD *)(a1 + 40));
    if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 264), "count"))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v6 = *(void **)(v5 + 264);
      *(_QWORD *)(v5 + 264) = 0;

    }
    return objc_msgSend(*(id *)(a1 + 32), "setNeedsSave:", 1);
  }
  return result;
}

- (void)didApplyTombstoneForRank:(int64_t)a3
{
  NSMutableIndexSet *appliedTombstoneRanks;
  NSMutableIndexSet *v5;
  NSMutableIndexSet *v6;
  void *v7;
  NSObject *v8;

  if (a3 >= 1)
  {
    appliedTombstoneRanks = self->_appliedTombstoneRanks;
    if (appliedTombstoneRanks)
    {
      -[NSMutableIndexSet addIndex:](appliedTombstoneRanks, "addIndex:", a3);
    }
    else
    {
      v5 = (NSMutableIndexSet *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3788]), "initWithIndex:", a3);
      v6 = self->_appliedTombstoneRanks;
      self->_appliedTombstoneRanks = v5;

    }
    brc_bread_crumbs();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      -[BRCClientZone didApplyTombstoneForRank:].cold.1();

    -[BRCClientZone setNeedsSave:](self, "setNeedsSave:", 1);
  }
}

- (void)flushAppliedTombstones
{
  uint64_t v0;
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  OUTLINED_FUNCTION_15_1(*MEMORY[0x1E0C80C00]);
  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v1, v2, "[DEBUG] Signaling that tombstones can be collected in %@%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_2();
}

- (BOOL)hasCompletedInitialSyncDownOnce
{
  return self->_lastSyncDownDate != 0;
}

- (BOOL)_checkIfEnumeratorContainsNonDiscretionaryOp:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
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
  v3 = a3;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v9;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v3);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * i), "nonDiscretionary", (_QWORD)v8) & 1) != 0)
        {
          LOBYTE(v4) = 1;
          goto LABEL_11;
        }
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_11:

  return v4;
}

- (BOOL)_hasNonDiscretionaryServerStitchingOperation
{
  void *v3;
  BOOL v4;
  void *v5;
  void *v6;
  void *v7;

  -[NSMutableDictionary objectEnumerator](self->_runningListOperations, "objectEnumerator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[BRCClientZone _checkIfEnumeratorContainsNonDiscretionaryOp:](self, "_checkIfEnumeratorContainsNonDiscretionaryOp:", v3))
  {
    v4 = 1;
  }
  else
  {
    -[NSMutableDictionary objectEnumerator](self->_recursiveListOperations, "objectEnumerator");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[BRCClientZone _checkIfEnumeratorContainsNonDiscretionaryOp:](self, "_checkIfEnumeratorContainsNonDiscretionaryOp:", v5))
    {
      v4 = 1;
    }
    else
    {
      -[NSMutableDictionary objectEnumerator](self->_fetchParentOperations, "objectEnumerator");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[BRCClientZone _checkIfEnumeratorContainsNonDiscretionaryOp:](self, "_checkIfEnumeratorContainsNonDiscretionaryOp:", v6))
      {
        v4 = 1;
      }
      else
      {
        -[NSMutableDictionary objectEnumerator](self->_locateRecordOperations, "objectEnumerator");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v4 = -[BRCClientZone _checkIfEnumeratorContainsNonDiscretionaryOp:](self, "_checkIfEnumeratorContainsNonDiscretionaryOp:", v7);

      }
    }

  }
  return v4;
}

- (void)_registerOperation:(id)a3 throttler:(id)a4
{
  BRCServerZone *v6;
  BRCPQLConnection *db;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  NSError *v13;
  NSObject *v14;
  BRCServerZone *serverZone;
  int v16;
  _BOOL4 v17;
  void *v18;
  NSObject *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  char v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  NSError *lastSyncDownError;
  NSError *v34;
  void *v35;
  NSObject *v36;
  NSError *v37;
  void *v38;
  NSObject *v39;
  BRCServerZone *v40;
  int v41;
  BRCServerZone *v42;
  __int16 v43;
  BRCServerZone *v44;
  __int16 v45;
  NSError *v46;
  __int16 v47;
  void *v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v6 = (BRCServerZone *)a3;
  db = self->_db;
  v8 = a4;
  -[BRCPQLConnection assertOnQueue](db, "assertOnQueue");
  -[BRCServerZone setOperationThrottle:](v6, "setOperationThrottle:", v8);

  -[BRCServerZone mangledID](self->_serverZone, "mangledID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[BRCServerZone clientZone](self->_serverZone, "clientZone");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "isSyncBlockedBecauseAppNotInstalled"))
  {
    v12 = -[BRCServerZone nonDiscretionary](v6, "nonDiscretionary");

    if (v12)
    {
      brc_bread_crumbs();
      v13 = (NSError *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        serverZone = self->_serverZone;
        v41 = 138412802;
        v42 = serverZone;
        v43 = 2112;
        v44 = v6;
        v45 = 2112;
        v46 = v13;
        _os_log_impl(&dword_1CBD43000, v14, OS_LOG_TYPE_DEFAULT, "[WARNING] The zone %@ is blocked because the app isn't installed but we have a non-discretionary op %@. Unblocking the zone%@", (uint8_t *)&v41, 0x20u);
      }

      -[BRCClientZone clearStateBits:](self, "clearStateBits:", 4096);
    }
  }
  else
  {

  }
  if (self->_syncDownOperation)
  {
    v16 = -[BRCServerZone nonDiscretionary](v6, "nonDiscretionary");
    v17 = -[_BRCOperation nonDiscretionary](self->_syncDownOperation, "nonDiscretionary");
    if (v16 && !v17)
    {
      brc_bread_crumbs();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
        -[BRCClientZone _registerOperation:throttler:].cold.3();

      -[BRCSyncOperationThrottle graceNextRequest](self->_syncDownThrottle, "graceNextRequest");
      -[_BRCOperation cancel](self->_syncDownOperation, "cancel");
      -[BRCClientZone scheduleSyncDown](self, "scheduleSyncDown");
    }
    -[BRCServerZone addDependency:](v6, "addDependency:", self->_syncDownOperation);
  }
  if (!-[BRCClientZone isSharedZone](self, "isSharedZone")
    && -[BRCServerZone zoneCreationState](self->_serverZone, "zoneCreationState") == 2)
  {
    brc_bread_crumbs();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      -[BRCClientZone _registerOperation:throttler:].cold.2();

    v22 = (void *)MEMORY[0x1E0CB35C8];
    -[BRMangledID appLibraryOrZoneName](self->_mangledID, "appLibraryOrZoneName");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "brc_errorClientZoneNotFound:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCServerZone completedWithResult:error:](v6, "completedWithResult:error:", 0, v24);

    -[BRCServerZone cancel](v6, "cancel");
    goto LABEL_22;
  }
  -[BRCServerZone clientZone](self->_serverZone, "clientZone");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v25, "hasCompletedInitialSyncDownOnce") & 1) != 0)
  {

LABEL_22:
    -[BRCServerZone schedule](v6, "schedule");
    goto LABEL_23;
  }
  v26 = objc_msgSend(v10, "allowsDirectoryListBeforeInitialChangeToken");

  if ((v26 & 1) != 0)
    goto LABEL_22;
  objc_msgSend(v10, "throttleThresholdBeforeImmediatelyFailingNonDiscretionaryOp");
  v28 = v27;
  -[BRCSyncOperationThrottle nextTry](self->_syncDownThrottle, "nextTry");
  v30 = v29;
  brc_current_date_nsec();
  brc_interval_from_nsec();
  v32 = v31;
  if (-[BRCServerZone nonDiscretionary](v6, "nonDiscretionary")
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && !self->_syncDownOperation
    && v30 > v28 + v32)
  {
    lastSyncDownError = self->_lastSyncDownError;
    if (lastSyncDownError)
    {
      v34 = lastSyncDownError;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "brc_errorOperationCancelled");
      v34 = (NSError *)objc_claimAutoreleasedReturnValue();
    }
    v37 = v34;
    brc_bread_crumbs();
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v39 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      +[BRCDumpContext stringFromInterval:context:](BRCDumpContext, "stringFromInterval:context:", 0, v30 - v32);
      v40 = (BRCServerZone *)objc_claimAutoreleasedReturnValue();
      v41 = 138413058;
      v42 = v6;
      v43 = 2112;
      v44 = v40;
      v45 = 2112;
      v46 = v37;
      v47 = 2112;
      v48 = v38;
      _os_log_impl(&dword_1CBD43000, v39, OS_LOG_TYPE_DEFAULT, "[WARNING] Failing non-discretionary list operation %@ right away because we are heavily throttled (next try %@) %@%@", (uint8_t *)&v41, 0x2Au);

    }
    -[BRCServerZone completedWithResult:error:](v6, "completedWithResult:error:", 0, v37);
    -[BRCServerZone cancel](v6, "cancel");
    -[BRCServerZone schedule](v6, "schedule");

  }
  else
  {
    brc_bread_crumbs();
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
      -[BRCClientZone _registerOperation:throttler:].cold.1((uint64_t)v6);

    -[NSMutableArray addObject:](self->_blockedOperationsOnInitialSync, "addObject:", v6);
    -[BRCClientZone scheduleSyncDownFirst](self, "scheduleSyncDownFirst");
  }
LABEL_23:

}

- (void)_registerServerStitchingOperation:(id)a3
{
  -[BRCClientZone _registerOperation:throttler:](self, "_registerOperation:throttler:", a3, self->_serverStitchingOperationThrottle);
}

- (void)_registerListOperation:(id)a3 shareAcceptOperation:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  BOOL v14;
  NSMutableDictionary *runningListOperations;
  void *v16;
  void *v17;

  v6 = a3;
  v7 = a4;
  -[BRCPQLConnection assertOnQueue](self->_db, "assertOnQueue");
  brc_bread_crumbs();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    -[BRCClientZone _registerListOperation:shareAcceptOperation:].cold.2();

  -[BRCClientZone _registerServerStitchingOperation:](self, "_registerServerStitchingOperation:", v6);
  if (v7)
  {
    brc_bread_crumbs();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      -[BRCClientZone _registerListOperation:shareAcceptOperation:].cold.1((uint64_t)v7);

    objc_msgSend(v6, "addDependency:", v7);
  }
  -[BRCServerZone changeState](self->_serverZone, "changeState");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "changeToken");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {

  }
  else
  {
    v14 = -[BRCClientZone isSyncBlockedBecauseAppNotInstalled](self, "isSyncBlockedBecauseAppNotInstalled");

    if (!v14)
    {
      -[BRCServerZone clientZone](self->_serverZone, "clientZone");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "scheduleSyncDownFirst");

      goto LABEL_11;
    }
  }
  -[BRCClientZone _blockLowPriorityStitchingOperationsForOperation:](self, "_blockLowPriorityStitchingOperationsForOperation:", v6);
LABEL_11:
  runningListOperations = self->_runningListOperations;
  objc_msgSend(v6, "folderToList");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](runningListOperations, "setObject:forKeyedSubscript:", v6, v16);

}

- (id)cancelListOperationAndReschedule:(id)a3
{
  BRCPQLConnection *db;
  id v5;
  NSMutableDictionary *runningListOperations;
  void *v7;
  void *v8;
  void *v9;

  db = self->_db;
  v5 = a3;
  -[BRCPQLConnection assertOnQueue](db, "assertOnQueue");
  runningListOperations = self->_runningListOperations;
  objc_msgSend(v5, "folderToList");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary removeObjectForKey:](runningListOperations, "removeObjectForKey:", v7);

  objc_msgSend(v5, "folderToList");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCClientZone fetchDirectoryContentsIfNecessary:isUserWaiting:rescheduleApplyScheduler:](self, "fetchDirectoryContentsIfNecessary:isUserWaiting:rescheduleApplyScheduler:", v8, objc_msgSend(v5, "nonDiscretionary"), objc_msgSend(v5, "rescheduleApply"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "cancelToBeReplacedByOperation:", v9);
  return v9;
}

- (void)_blockLowPriorityStitchingOperationsForOperation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  int v13;
  int v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  void *v24;
  int v25;
  int v26;
  void *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  _BOOL4 v31;
  void *v32;
  NSObject *v33;
  void *v34;
  uint64_t v35;
  __int128 v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t k;
  void *v40;
  int v41;
  int v42;
  void *v43;
  NSObject *v44;
  void *v45;
  NSObject *v46;
  NSMutableDictionary *runningListOperations;
  void *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  __int128 v53;
  void *v54;
  BRCClientZone *v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  _BYTE v68[128];
  uint8_t v69[128];
  uint8_t buf[4];
  void *v71;
  __int16 v72;
  uint64_t v73;
  __int16 v74;
  void *v75;
  _BYTE v76[128];
  uint64_t v77;

  v77 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[BRCPQLConnection assertOnQueue](self->_db, "assertOnQueue");
  -[BRCServerZone changeState](self->_serverZone, "changeState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "changeToken");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v66 = 0u;
    v67 = 0u;
    v64 = 0u;
    v65 = 0u;
    -[NSMutableDictionary allValues](self->_fetchParentOperations, "allValues");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v64, v76, 16);
    v55 = self;
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v65;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v65 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v64 + 1) + 8 * i);
          if ((objc_msgSend(v12, "isCancelled") & 1) == 0)
          {
            v13 = objc_msgSend(v4, "nonDiscretionary");
            v14 = objc_msgSend(v12, "nonDiscretionary");
            if (v13)
            {
              if (!v14)
              {
                brc_bread_crumbs();
                v15 = (void *)objc_claimAutoreleasedReturnValue();
                brc_default_log();
                v16 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
                {
                  objc_msgSend(v12, "operationID");
                  v17 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v4, "operationID");
                  v18 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412802;
                  v71 = v17;
                  v72 = 2112;
                  v73 = (uint64_t)v18;
                  v74 = 2112;
                  v75 = v15;
                  _os_log_debug_impl(&dword_1CBD43000, v16, OS_LOG_TYPE_DEBUG, "[DEBUG] Blocking low-priority parent fetch operation %@ on %@%@", buf, 0x20u);

                  self = v55;
                }

                objc_msgSend(v12, "blockOnHighPriorityOperation:", v4);
              }
            }
          }
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v64, v76, 16);
      }
      while (v9);
    }

    v62 = 0u;
    v63 = 0u;
    v60 = 0u;
    v61 = 0u;
    -[NSMutableDictionary allValues](self->_locateRecordOperations, "allValues");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v60, v69, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v61;
      do
      {
        for (j = 0; j != v21; ++j)
        {
          if (*(_QWORD *)v61 != v22)
            objc_enumerationMutation(v19);
          v24 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * j);
          if ((objc_msgSend(v24, "isCancelled") & 1) == 0)
          {
            v25 = objc_msgSend(v4, "nonDiscretionary");
            v26 = objc_msgSend(v24, "nonDiscretionary");
            if (v25)
            {
              if (!v26)
              {
                brc_bread_crumbs();
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                brc_default_log();
                v28 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
                {
                  objc_msgSend(v24, "operationID");
                  v29 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v4, "operationID");
                  v30 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412802;
                  v71 = v29;
                  v72 = 2112;
                  v73 = (uint64_t)v30;
                  v74 = 2112;
                  v75 = v27;
                  _os_log_debug_impl(&dword_1CBD43000, v28, OS_LOG_TYPE_DEBUG, "[DEBUG] Blocking low-priority locate record operation %@ on %@%@", buf, 0x20u);

                  self = v55;
                }

                objc_msgSend(v24, "blockOnHighPriorityOperation:", v4);
              }
            }
          }
        }
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v60, v69, 16);
      }
      while (v21);
    }

    v31 = -[_BRCOperation nonDiscretionary](self->_fetchRecentsOperation, "nonDiscretionary");
    if (objc_msgSend(v4, "nonDiscretionary")
      && !v31
      && (-[BRCFetchRecentAndFavoriteDocumentsOperation isCancelled](self->_fetchRecentsOperation, "isCancelled") & 1) == 0
      && self->_fetchRecentsOperation)
    {
      brc_bread_crumbs();
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
      {
        -[_BRCOperation operationID](self->_fetchRecentsOperation, "operationID");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "operationID");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v71 = v51;
        v72 = 2112;
        v73 = (uint64_t)v52;
        v74 = 2112;
        v75 = v32;
        _os_log_debug_impl(&dword_1CBD43000, v33, OS_LOG_TYPE_DEBUG, "[DEBUG] Blocking low-priority fetch recents operation %@ on %@%@", buf, 0x20u);

        self = v55;
      }

      -[_BRCOperation blockOnHighPriorityOperation:](self->_fetchRecentsOperation, "blockOnHighPriorityOperation:", v4);
    }
    v58 = 0u;
    v59 = 0u;
    v56 = 0u;
    v57 = 0u;
    -[NSMutableDictionary allValues](self->_runningListOperations, "allValues");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v56, v68, 16);
    if (v35)
    {
      v37 = v35;
      v38 = *(_QWORD *)v57;
      *(_QWORD *)&v36 = 138412802;
      v53 = v36;
      do
      {
        for (k = 0; k != v37; ++k)
        {
          if (*(_QWORD *)v57 != v38)
            objc_enumerationMutation(v34);
          v40 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * k);
          if ((objc_msgSend(v40, "isCancelled", v53) & 1) == 0)
          {
            if ((objc_msgSend(v40, "hasObservers") & 1) != 0)
            {
              v41 = objc_msgSend(v4, "nonDiscretionary");
              v42 = objc_msgSend(v40, "nonDiscretionary");
              if (v41 && !v42)
              {
                brc_bread_crumbs();
                v43 = (void *)objc_claimAutoreleasedReturnValue();
                brc_default_log();
                v44 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
                {
                  objc_msgSend(v40, "operationID");
                  v54 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v4, "operationID");
                  v49 = objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = v53;
                  v71 = v54;
                  v72 = 2112;
                  v73 = v49;
                  v50 = (void *)v49;
                  v74 = 2112;
                  v75 = v43;
                  _os_log_debug_impl(&dword_1CBD43000, v44, OS_LOG_TYPE_DEBUG, "[DEBUG] Blocking low-priority list operation %@ on %@%@", buf, 0x20u);

                  self = v55;
                }

                objc_msgSend(v40, "blockOnHighPriorityOperation:", v4);
              }
            }
            else
            {
              brc_bread_crumbs();
              v45 = (void *)objc_claimAutoreleasedReturnValue();
              brc_default_log();
              v46 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412546;
                v71 = v40;
                v72 = 2112;
                v73 = (uint64_t)v45;
                _os_log_debug_impl(&dword_1CBD43000, v46, OS_LOG_TYPE_DEBUG, "[DEBUG] Removing list operation with no observers %@%@", buf, 0x16u);
              }

              objc_msgSend(v40, "cancel");
              runningListOperations = self->_runningListOperations;
              objc_msgSend(v40, "folderToList");
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSMutableDictionary removeObjectForKey:](runningListOperations, "removeObjectForKey:", v48);

            }
          }
        }
        v37 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v56, v68, 16);
      }
      while (v37);
    }

  }
}

- (void)_registerFetchParentChainOperation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;

  v4 = a3;
  -[BRCPQLConnection assertOnQueue](self->_db, "assertOnQueue");
  objc_msgSend(v4, "parentIDToList");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    brc_bread_crumbs();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      -[BRCClientZone _registerFetchParentChainOperation:].cold.2((uint64_t)v5);

    -[BRCClientZone _registerServerStitchingOperation:](self, "_registerServerStitchingOperation:", v4);
    -[BRCClientZone _blockLowPriorityStitchingOperationsForOperation:](self, "_blockLowPriorityStitchingOperationsForOperation:", v4);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_fetchParentOperations, "setObject:forKeyedSubscript:", v4, v5);
  }
  else
  {
    brc_bread_crumbs();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      -[BRCClientZone _registerFetchParentChainOperation:].cold.1((uint64_t)v4);

  }
}

- (id)cancelFetchParentChainOperationAndReschedule:(id)a3
{
  BRCPQLConnection *db;
  id v5;
  void *v6;
  void *v7;

  db = self->_db;
  v5 = a3;
  -[BRCPQLConnection assertOnQueue](db, "assertOnQueue");
  objc_msgSend(v5, "parentIDToList");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary removeObjectForKey:](self->_fetchParentOperations, "removeObjectForKey:", v6);
  -[BRCClientZone fetchParentChainIfNecessaryWithParentItemID:isUserWaiting:](self, "fetchParentChainIfNecessaryWithParentItemID:isUserWaiting:", v6, objc_msgSend(v5, "nonDiscretionary"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cancelToBeReplacedByOperation:", v7);

  return v7;
}

- (void)_registerLocateRecordOperation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;

  v4 = a3;
  -[BRCPQLConnection assertOnQueue](self->_db, "assertOnQueue");
  objc_msgSend(v4, "recordID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  brc_bread_crumbs();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[BRCClientZone _registerLocateRecordOperation:].cold.1((uint64_t)v5);

  -[BRCClientZone _registerOperation:throttler:](self, "_registerOperation:throttler:", v4, self->_locateRecordsOperationThrottle);
  -[BRCClientZone _blockLowPriorityStitchingOperationsForOperation:](self, "_blockLowPriorityStitchingOperationsForOperation:", v4);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_locateRecordOperations, "setObject:forKeyedSubscript:", v4, v5);

}

- (id)cancelLocateRecordOperationAndReschedule:(id)a3
{
  BRCPQLConnection *db;
  id v5;
  void *v6;
  void *v7;

  db = self->_db;
  v5 = a3;
  -[BRCPQLConnection assertOnQueue](db, "assertOnQueue");
  objc_msgSend(v5, "recordID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary removeObjectForKey:](self->_locateRecordOperations, "removeObjectForKey:", v6);
  -[BRCClientZone locateRecordIfNecessaryForRecordID:isUserWaiting:](self, "locateRecordIfNecessaryForRecordID:isUserWaiting:", v6, objc_msgSend(v5, "nonDiscretionary"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cancelToBeReplacedByOperation:", v7);

  return v7;
}

- (BOOL)_isSideSyncOperationBlockedWithName:(id)a3
{
  return -[BRCClientZone _isSideSyncOperationBlockedWithName:isWaitingOnShareAccept:](self, "_isSideSyncOperationBlockedWithName:isWaitingOnShareAccept:", a3, 0);
}

- (BOOL)_isSideSyncOperationBlockedWithName:(id)a3 isWaitingOnShareAccept:(BOOL)a4
{
  id v5;
  void *v6;
  NSObject *v7;
  BOOL v8;

  v5 = a3;
  if (self->_activated)
  {
    if (-[BRCClientZone isSyncBlockedBecauseOSNeedsUpgrade](self, "isSyncBlockedBecauseOSNeedsUpgrade"))
    {
      brc_bread_crumbs();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
        -[BRCClientZone _isSideSyncOperationBlockedWithName:isWaitingOnShareAccept:].cold.2((uint64_t)v5);
    }
    else if ((self->_state & 0x100) != 0)
    {
      brc_bread_crumbs();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
        -[BRCClientZone _isSideSyncOperationBlockedWithName:isWaitingOnShareAccept:].cold.4((uint64_t)v5);
    }
    else
    {
      if (-[BRCServerZone zoneCreationState](self->_serverZone, "zoneCreationState") != 2)
      {
        v8 = 0;
        goto LABEL_14;
      }
      brc_bread_crumbs();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
        -[BRCClientZone _isSideSyncOperationBlockedWithName:isWaitingOnShareAccept:].cold.3((uint64_t)v5);
    }
  }
  else
  {
    brc_bread_crumbs();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      -[BRCClientZone _isSideSyncOperationBlockedWithName:isWaitingOnShareAccept:].cold.1((uint64_t)v5);
  }

  v8 = 1;
LABEL_14:

  return v8;
}

- (id)fetchDirectoryContentsIfNecessary:(id)a3 isUserWaiting:(BOOL)a4 rescheduleApplyScheduler:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL8 v6;
  id v8;
  void *v9;
  void *v10;
  BRCListDirectoryContentsOperation *v11;
  BRCItemGlobalID *v12;
  BRCListDirectoryContentsOperation *v13;
  BRCListDirectoryContentsOperation *v14;
  NSObject *v15;
  id v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v21;
  int v22;
  void *v23;
  NSObject *v24;
  int v25;
  BRCAccountSession *session;
  void *v27;
  void *v28;
  BRCListDirectoryContentsOperation *v29;
  void *v30;
  NSObject *v31;
  id v32;
  void *v33;
  void *v34;
  NSObject *v35;
  BRCClientZone *v36;
  NSObject *v37;
  void *v38;
  void *v39;
  void *v40;
  _QWORD v41[4];
  id v42;
  id v43;
  id v44;
  id from;
  _BYTE location[12];
  __int16 v47;
  BRCClientZone *v48;
  __int16 v49;
  int v50;
  __int16 v51;
  void *v52;
  uint64_t v53;

  v5 = a5;
  v6 = a4;
  v53 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  -[BRCPQLConnection assertOnQueue](self->_db, "assertOnQueue");
  if (-[BRCClientZone isSharedZone](self, "isSharedZone"))
  {
    -[BRCClientZone asSharedClientZone](self, "asSharedClientZone");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "shareAcceptOperationForItemID:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }
  if (!-[BRCClientZone _isSideSyncOperationBlockedWithName:isWaitingOnShareAccept:](self, "_isSideSyncOperationBlockedWithName:isWaitingOnShareAccept:", CFSTR("list"), v10 != 0))
  {
    if (!v8)
    {
      brc_bread_crumbs();
      v12 = (BRCItemGlobalID *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
        -[BRCClientZone fetchDirectoryContentsIfNecessary:isUserWaiting:rescheduleApplyScheduler:].cold.1();

      goto LABEL_22;
    }
    v12 = -[BRCItemGlobalID initWithZoneRowID:itemID:]([BRCItemGlobalID alloc], "initWithZoneRowID:itemID:", self->_dbRowID, v8);
    if ((-[BRCServerZone state](self->_serverZone, "state") & 4) != 0)
    {
      if (v5)
      {
        v16 = -[PQLConnection numberWithSQL:](self->_db, "numberWithSQL:", CFSTR("SELECT item_type FROM client_items WHERE item_id = %@ AND zone_rowid = %@"), v8, self->_dbRowID);
        if (objc_msgSend(v16, "intValue") == 9)
        {
          -[BRCAccountSession applyScheduler](self->_session, "applyScheduler");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "rescheduleItemsParentedToItemGlobalID:", v12);

        }
      }
      brc_bread_crumbs();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
        -[BRCClientZone fetchDirectoryContentsIfNecessary:isUserWaiting:rescheduleApplyScheduler:].cold.4(v8, (uint64_t)v18, v19);

      goto LABEL_22;
    }
    -[NSMutableDictionary objectForKeyedSubscript:](self->_runningListOperations, "objectForKeyedSubscript:", v8);
    v13 = (BRCListDirectoryContentsOperation *)objc_claimAutoreleasedReturnValue();
    v11 = v13;
    if (v6 && v13)
    {
      if (!-[_BRCOperation nonDiscretionary](v13, "nonDiscretionary"))
      {
        v14 = v11;
        goto LABEL_29;
      }
    }
    else if (!v13)
    {
      v14 = 0;
LABEL_29:
      -[BRCServerZone failedListItemIDs](self->_serverZone, "failedListItemIDs");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "containsObject:", v8);

      if (v22)
      {
        brc_bread_crumbs();
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
          -[BRCClientZone fetchDirectoryContentsIfNecessary:isUserWaiting:rescheduleApplyScheduler:].cold.2(v8, (uint64_t)v23, v24);

LABEL_22:
        v11 = 0;
LABEL_23:

        goto LABEL_24;
      }
      v25 = -[BRCClientZone serverItemTypeByItemID:db:](self, "serverItemTypeByItemID:db:", v8, self->_db);
      if (v25 == -1)
        v25 = -[BRCClientZone itemTypeByItemID:db:](self, "itemTypeByItemID:db:", v8, self->_db);
      if (v25 - 9 >= 2 && v25 != 255)
      {
        if (v5)
        {
          v32 = -[PQLConnection numberWithSQL:](self->_db, "numberWithSQL:", CFSTR("SELECT item_type FROM client_items WHERE item_id = %@ AND zone_rowid = %@"), v8, self->_dbRowID);
          if (objc_msgSend(v32, "intValue") == 9)
          {
            -[BRCAccountSession applyScheduler](self->_session, "applyScheduler");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "rescheduleItemsParentedToItemGlobalID:", v12);

          }
        }
        brc_bread_crumbs();
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v35 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(v8, "debugItemIDString");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)location = 138413058;
          *(_QWORD *)&location[4] = v40;
          v47 = 2112;
          v48 = self;
          v49 = 1024;
          v50 = v25;
          v51 = 2112;
          v52 = v34;
          _os_log_debug_impl(&dword_1CBD43000, v35, OS_LOG_TYPE_DEBUG, "[DEBUG] Can't list item %@ in zone %@ which isn't a directory fault %d%@", location, 0x26u);

        }
        goto LABEL_22;
      }
      if (objc_msgSend(v8, "isDocumentsFolder"))
      {
        session = self->_session;
        objc_msgSend(v8, "appLibraryRowID");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        -[BRCAccountSession appLibraryByRowID:](session, "appLibraryByRowID:", v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        if ((objc_msgSend(v28, "includesDataScope") & 1) == 0)
        {
          brc_bread_crumbs();
          v36 = (BRCClientZone *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v37 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v28, "mangledID");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v38, "debugDescription");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)location = 138412546;
            *(_QWORD *)&location[4] = v39;
            v47 = 2112;
            v48 = v36;
            _os_log_impl(&dword_1CBD43000, v37, OS_LOG_TYPE_DEFAULT, "[WARNING] Got request to list documents directory of app library that don't have data scope. AppLibrary [%@].%@", location, 0x16u);

          }
          goto LABEL_22;
        }

      }
      v29 = -[BRCListDirectoryContentsOperation initWithItemID:sessionContext:zone:isUserWaiting:]([BRCListDirectoryContentsOperation alloc], "initWithItemID:sessionContext:zone:isUserWaiting:", v8, self->_session, self->_serverZone, v6);
      -[BRCListDirectoryContentsOperation setRescheduleApply:](v29, "setRescheduleApply:", -[BRCListDirectoryContentsOperation rescheduleApply](v14, "rescheduleApply") | v5);
      objc_initWeak((id *)location, self);
      if (v14)
      {
        brc_bread_crumbs();
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v31 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
          -[BRCClientZone fetchDirectoryContentsIfNecessary:isUserWaiting:rescheduleApplyScheduler:].cold.3((uint64_t)v14);

        -[BRCListDirectoryContentsOperation cancelToBeReplacedByOperation:](v14, "cancelToBeReplacedByOperation:", v29);
      }
      else
      {
        objc_initWeak(&from, v29);
        v41[0] = MEMORY[0x1E0C809B0];
        v41[1] = 3221225472;
        v41[2] = __90__BRCClientZone_fetchDirectoryContentsIfNecessary_isUserWaiting_rescheduleApplyScheduler___block_invoke;
        v41[3] = &unk_1E8762CE8;
        objc_copyWeak(&v43, (id *)location);
        objc_copyWeak(&v44, &from);
        v42 = v8;
        -[BRCListDirectoryContentsOperation addDirectoryListCompletionBlock:](v29, "addDirectoryListCompletionBlock:", v41);

        objc_destroyWeak(&v44);
        objc_destroyWeak(&v43);
        objc_destroyWeak(&from);
      }
      -[BRCClientZone _registerListOperation:shareAcceptOperation:](self, "_registerListOperation:shareAcceptOperation:", v29, v10);
      v11 = v29;
      objc_destroyWeak((id *)location);

      goto LABEL_23;
    }
    if (v5)
      -[BRCListDirectoryContentsOperation setRescheduleApply:](v11, "setRescheduleApply:", 1);
    goto LABEL_23;
  }
  v11 = 0;
LABEL_24:

  return v11;
}

void __90__BRCClientZone_fetchDirectoryContentsIfNecessary_isUserWaiting_rescheduleApplyScheduler___block_invoke(id *a1, void *a2)
{
  id v3;
  id WeakRetained;
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  _QWORD v14[5];
  id v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  id v19;
  __int16 v20;
  id v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(a1 + 5);
  v5 = objc_loadWeakRetained(a1 + 6);
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "db");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "serialQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __90__BRCClientZone_fetchDirectoryContentsIfNecessary_isUserWaiting_rescheduleApplyScheduler___block_invoke_2;
    v14[3] = &unk_1E875D470;
    v14[4] = WeakRetained;
    v15 = a1[4];
    dispatch_async(v7, v14);

  }
  if (v3)
  {
    brc_bread_crumbs();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(a1[4], "debugItemIDString");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      v17 = v10;
      v18 = 2112;
      v19 = v5;
      v20 = 2112;
      v21 = v3;
      v22 = 2112;
      v23 = v8;
      _os_log_impl(&dword_1CBD43000, v9, OS_LOG_TYPE_DEFAULT, "[WARNING] Failed listing directory %@ in %@ - %@%@", buf, 0x2Au);

    }
    objc_msgSend(WeakRetained, "handleZoneLevelErrorIfNeeded:forItemCreation:", v3, 0);
  }
  else
  {
    brc_bread_crumbs();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(a1[4], "debugItemIDString");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v17 = v13;
      v18 = 2112;
      v19 = v5;
      v20 = 2112;
      v21 = v11;
      _os_log_debug_impl(&dword_1CBD43000, v12, OS_LOG_TYPE_DEBUG, "[DEBUG] Finished listing contents of %@ in %@%@", buf, 0x20u);

    }
  }

}

uint64_t __90__BRCClientZone_fetchDirectoryContentsIfNecessary_isUserWaiting_rescheduleApplyScheduler___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 200), "removeObjectForKey:", *(_QWORD *)(a1 + 40));
}

- (id)fetchRecursiveDirectoryContentsIfNecessary:(id)a3 isUserWaiting:(BOOL)a4 rescheduleApply:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  id v8;
  BRCItemGlobalID *v9;
  BRCItemGlobalID *v10;
  BRCItemGlobalID *v11;
  NSObject *p_super;
  void *v13;
  NSObject *v14;
  BRCItemGlobalID *v16;
  void *v17;
  BRCAccountSession *session;
  void *v19;
  BRCRecursiveListDirectoryContentsOperation *v20;
  id v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _QWORD v40[4];
  id v41;
  id v42;
  id location;
  uint8_t v44[128];
  uint8_t buf[4];
  void *v46;
  __int16 v47;
  void *v48;
  uint64_t v49;

  v5 = a5;
  v6 = a4;
  v49 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  -[BRCPQLConnection assertOnQueue](self->_db, "assertOnQueue");
  if (-[BRCClientZone _isSideSyncOperationBlockedWithName:](self, "_isSideSyncOperationBlockedWithName:", CFSTR("list recursively")))
  {
    goto LABEL_2;
  }
  if (!v8)
  {
    brc_bread_crumbs();
    v11 = (BRCItemGlobalID *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    p_super = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_FAULT))
      -[BRCClientZone fetchRecursiveDirectoryContentsIfNecessary:isUserWaiting:rescheduleApply:].cold.1();
    goto LABEL_15;
  }
  if ((-[BRCServerZone state](self->_serverZone, "state") & 4) == 0)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_recursiveListOperations, "objectForKeyedSubscript:", v8);
    v10 = (BRCItemGlobalID *)objc_claimAutoreleasedReturnValue();
    v9 = v10;
    if (v6 && v10)
    {
      if ((-[BRCItemGlobalID nonDiscretionary](v10, "nonDiscretionary") & 1) == 0)
      {
        -[BRCItemGlobalID cancel](v9, "cancel");
LABEL_24:
        if (!objc_msgSend(v8, "isDocumentsFolder"))
        {
LABEL_27:
          v20 = -[BRCRecursiveListDirectoryContentsOperation initWithItemID:sessionContext:zone:isUserWaiting:]([BRCRecursiveListDirectoryContentsOperation alloc], "initWithItemID:sessionContext:zone:isUserWaiting:", v8, self->_session, self->_serverZone, v6);
          -[BRCRecursiveListDirectoryContentsOperation setRescheduleApply:](v20, "setRescheduleApply:", v5);
          objc_initWeak(&location, self);
          v40[0] = MEMORY[0x1E0C809B0];
          v40[1] = 3221225472;
          v40[2] = __90__BRCClientZone_fetchRecursiveDirectoryContentsIfNecessary_isUserWaiting_rescheduleApply___block_invoke;
          v40[3] = &unk_1E8762D10;
          objc_copyWeak(&v42, &location);
          v21 = v8;
          v41 = v21;
          -[_BRCOperation setFinishBlock:](v20, "setFinishBlock:", v40);
          -[NSMutableDictionary setObject:forKeyedSubscript:](self->_recursiveListOperations, "setObject:forKeyedSubscript:", v20, v21);
          if (v9)
          {
            brc_bread_crumbs();
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            brc_default_log();
            v23 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
            {
              objc_msgSend(v21, "debugItemIDString");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              -[BRCClientZone fetchRecursiveDirectoryContentsIfNecessary:isUserWaiting:rescheduleApply:].cold.4(v24, (uint64_t)v22, (uint64_t)buf);
            }

            v38 = 0u;
            v39 = 0u;
            v36 = 0u;
            v37 = 0u;
            -[BRCItemGlobalID dependencies](v9, "dependencies", 0);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
            if (v26)
            {
              v27 = *(_QWORD *)v37;
              do
              {
                v28 = 0;
                do
                {
                  if (*(_QWORD *)v37 != v27)
                    objc_enumerationMutation(v25);
                  -[_BRCOperation addDependency:](v20, "addDependency:", *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * v28++));
                }
                while (v26 != v28);
                v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
              }
              while (v26);
            }

            -[BRCAutoCancelOperation beginObservingChanges](v20, "beginObservingChanges");
            if (-[BRCItemGlobalID isExecuting](v9, "isExecuting"))
              -[_BRCOperation addDependency:](v20, "addDependency:", v9);
          }
          else
          {
            brc_bread_crumbs();
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            brc_default_log();
            v30 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
            {
              objc_msgSend(v21, "debugItemIDString");
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              -[BRCClientZone fetchRecursiveDirectoryContentsIfNecessary:isUserWaiting:rescheduleApply:].cold.3(v31, (uint64_t)v29, (uint64_t)buf);
            }

          }
          -[_BRCOperation schedule](v20, "schedule");
          v11 = v20;

          objc_destroyWeak(&v42);
          objc_destroyWeak(&location);
          p_super = &v9->super;
          v9 = v11;
          goto LABEL_16;
        }
        session = self->_session;
        objc_msgSend(v8, "appLibraryRowID");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[BRCAccountSession appLibraryByRowID:](session, "appLibraryByRowID:", v19);
        p_super = objc_claimAutoreleasedReturnValue();

        if ((-[NSObject includesDataScope](p_super, "includesDataScope") & 1) != 0)
        {

          goto LABEL_27;
        }
        brc_bread_crumbs();
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v33 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
        {
          -[NSObject mangledID](p_super, "mangledID");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "debugDescription");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v46 = v35;
          v47 = 2112;
          v48 = v32;
          _os_log_impl(&dword_1CBD43000, v33, OS_LOG_TYPE_DEFAULT, "[WARNING] Got request to rec-list documents directory of app library that don't have data scope. AppLibrary [%@].%@", buf, 0x16u);

        }
        v11 = v9;
LABEL_15:
        v9 = 0;
LABEL_16:

        goto LABEL_17;
      }
    }
    else if (!v10)
    {
      goto LABEL_24;
    }
    if (v5 && (-[BRCItemGlobalID rescheduleApply](v9, "rescheduleApply") & 1) == 0)
    {
      -[BRCItemGlobalID setRescheduleApply:](v9, "setRescheduleApply:", 1);
      v16 = -[BRCItemGlobalID initWithZoneRowID:itemID:]([BRCItemGlobalID alloc], "initWithZoneRowID:itemID:", self->_dbRowID, v8);
      -[BRCAccountSession applyScheduler](self->_session, "applyScheduler");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "rescheduleItemsRecursivelyUnderFolder:", v16);

    }
    brc_bread_crumbs();
    v11 = (BRCItemGlobalID *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    p_super = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEBUG))
      -[BRCClientZone fetchRecursiveDirectoryContentsIfNecessary:isUserWaiting:rescheduleApply:].cold.2(v8, (uint64_t)v11, p_super);
    goto LABEL_16;
  }
  if (v5)
  {
    v11 = -[BRCItemGlobalID initWithZoneRowID:itemID:]([BRCItemGlobalID alloc], "initWithZoneRowID:itemID:", self->_dbRowID, v8);
    brc_bread_crumbs();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      -[BRCClientZone fetchRecursiveDirectoryContentsIfNecessary:isUserWaiting:rescheduleApply:].cold.5((uint64_t)v11);

    -[BRCAccountSession applyScheduler](self->_session, "applyScheduler");
    p_super = objc_claimAutoreleasedReturnValue();
    -[NSObject rescheduleItemsRecursivelyUnderFolder:](p_super, "rescheduleItemsRecursivelyUnderFolder:", v11);
    goto LABEL_15;
  }
LABEL_2:
  v9 = 0;
LABEL_17:

  return v9;
}

void __90__BRCClientZone_fetchRecursiveDirectoryContentsIfNecessary_isUserWaiting_rescheduleApply___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  id WeakRetained;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  _QWORD v12[5];
  id v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  id v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v6 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "db");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "serialQueue");
    v8 = objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __90__BRCClientZone_fetchRecursiveDirectoryContentsIfNecessary_isUserWaiting_rescheduleApply___block_invoke_2;
    v12[3] = &unk_1E875D470;
    v12[4] = v6;
    v13 = *(id *)(a1 + 32);
    dispatch_async(v8, v12);

  }
  brc_bread_crumbs();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(*(id *)(a1 + 32), "debugItemIDString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v15 = v11;
    v16 = 2112;
    v17 = v4;
    v18 = 2112;
    v19 = v9;
    _os_log_debug_impl(&dword_1CBD43000, v10, OS_LOG_TYPE_DEBUG, "[DEBUG] Finished listing contents of %@ with error %@%@", buf, 0x20u);

  }
}

uint64_t __90__BRCClientZone_fetchRecursiveDirectoryContentsIfNecessary_isUserWaiting_rescheduleApply___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 208), "removeObjectForKey:", *(_QWORD *)(a1 + 40));
}

- (id)fetchParentChainIfNecessaryWithParentItemID:(id)a3 isUserWaiting:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  BRCFetchParentChainOperation *v7;
  BRCFetchParentChainOperation *v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  BRCFetchParentChainOperation *v13;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t);
  void *v18;
  id v19;
  id v20;
  uint8_t buf[4];
  BRCFetchParentChainOperation *v22;
  uint64_t v23;

  v4 = a4;
  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[BRCPQLConnection assertOnQueue](self->_db, "assertOnQueue");
  if (!-[BRCClientZone _isSideSyncOperationBlockedWithName:](self, "_isSideSyncOperationBlockedWithName:", CFSTR("fetch parent chain")))
  {
    if (!v6)
    {
      brc_bread_crumbs();
      v8 = (BRCFetchParentChainOperation *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
        -[BRCClientZone fetchParentChainIfNecessaryWithParentItemID:isUserWaiting:].cold.1();

      goto LABEL_11;
    }
    if (objc_msgSend(v6, "isNonDesktopRoot"))
    {
      brc_bread_crumbs();
      v8 = (BRCFetchParentChainOperation *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v22 = v8;
        _os_log_impl(&dword_1CBD43000, v9, OS_LOG_TYPE_DEFAULT, "[WARNING] Can't fetch parent chain of a root item%@", buf, 0xCu);
      }

LABEL_11:
      v7 = 0;
LABEL_21:

      goto LABEL_22;
    }
    -[NSMutableDictionary objectForKeyedSubscript:](self->_fetchParentOperations, "objectForKeyedSubscript:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v4 && v11)
    {
      if ((objc_msgSend(v11, "nonDiscretionary") & 1) == 0)
      {
LABEL_15:
        v13 = -[BRCFetchParentChainOperation initWithParentID:sessionContext:zone:isUserWaiting:]([BRCFetchParentChainOperation alloc], "initWithParentID:sessionContext:zone:isUserWaiting:", v6, self->_session, self->_serverZone, v4);
        objc_initWeak((id *)buf, self);
        if (v12)
        {
          objc_msgSend(v12, "cancelToBeReplacedByOperation:", v13);
        }
        else
        {
          v15 = MEMORY[0x1E0C809B0];
          v16 = 3221225472;
          v17 = __75__BRCClientZone_fetchParentChainIfNecessaryWithParentItemID_isUserWaiting___block_invoke;
          v18 = &unk_1E875E970;
          objc_copyWeak(&v20, (id *)buf);
          v19 = v6;
          -[BRCFetchParentChainOperation addFetchParentChainCompletionBlock:](v13, "addFetchParentChainCompletionBlock:", &v15);

          objc_destroyWeak(&v20);
        }
        -[BRCClientZone _registerFetchParentChainOperation:](self, "_registerFetchParentChainOperation:", v13, v15, v16, v17, v18);
        v8 = v13;
        objc_destroyWeak((id *)buf);

        v7 = v8;
        goto LABEL_21;
      }
    }
    else if (!v11)
    {
      goto LABEL_15;
    }
    v8 = v12;
    v7 = v8;
    goto LABEL_21;
  }
  v7 = 0;
LABEL_22:

  return v7;
}

void __75__BRCClientZone_fetchParentChainIfNecessaryWithParentItemID_isUserWaiting___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  NSObject *v5;
  _QWORD v6[5];
  id v7;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "db");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "serialQueue");
    v5 = objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __75__BRCClientZone_fetchParentChainIfNecessaryWithParentItemID_isUserWaiting___block_invoke_2;
    v6[3] = &unk_1E875D470;
    v6[4] = v3;
    v7 = *(id *)(a1 + 32);
    dispatch_async(v5, v6);

  }
}

uint64_t __75__BRCClientZone_fetchParentChainIfNecessaryWithParentItemID_isUserWaiting___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 216), "removeObjectForKey:", *(_QWORD *)(a1 + 40));
}

- (id)locateRecordIfNecessaryForRecordID:(id)a3 isUserWaiting:(BOOL)a4 maxOperationBackoff:(double)a5
{
  _BOOL8 v6;
  id v8;
  BRCLocateRecordOperation *v9;
  void *v10;
  BOOL v11;
  BRCLocateRecordOperation *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  BRCLocateRecordOperation *v16;
  _QWORD v18[4];
  id v19;
  id v20;
  id location;

  v6 = a4;
  v8 = a3;
  -[BRCPQLConnection assertOnQueue](self->_db, "assertOnQueue");
  if (!-[BRCClientZone _isSideSyncOperationBlockedWithName:](self, "_isSideSyncOperationBlockedWithName:", CFSTR("locate record")))
  {
    if (!v8)
    {
      brc_bread_crumbs();
      v12 = (BRCLocateRecordOperation *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
        -[BRCClientZone locateRecordIfNecessaryForRecordID:isUserWaiting:maxOperationBackoff:].cold.1();
      goto LABEL_10;
    }
    objc_msgSend(v8, "recordName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "hasPrefix:", CFSTR("shareAlias/")))
    {
      v11 = -[BRCClientZone isPrivateZone](self, "isPrivateZone");

      if (!v11)
      {
        brc_bread_crumbs();
        v12 = (BRCLocateRecordOperation *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
          -[BRCClientZone locateRecordIfNecessaryForRecordID:isUserWaiting:maxOperationBackoff:].cold.2();
LABEL_10:

        v9 = 0;
LABEL_21:

        goto LABEL_22;
      }
    }
    else
    {

    }
    -[NSMutableDictionary objectForKeyedSubscript:](self->_locateRecordOperations, "objectForKeyedSubscript:", v8);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v6 && v14)
    {
      if ((objc_msgSend(v14, "nonDiscretionary") & 1) == 0)
      {
LABEL_15:
        v16 = -[BRCLocateRecordOperation initWithRecordID:serverZone:isUserWaiting:maxBackoff:sessionContext:]([BRCLocateRecordOperation alloc], "initWithRecordID:serverZone:isUserWaiting:maxBackoff:sessionContext:", v8, self->_serverZone, v6, self->_session, a5);
        objc_initWeak(&location, self);
        if (v15)
        {
          objc_msgSend(v15, "cancelToBeReplacedByOperation:", v16);
        }
        else
        {
          v18[0] = MEMORY[0x1E0C809B0];
          v18[1] = 3221225472;
          v18[2] = __86__BRCClientZone_locateRecordIfNecessaryForRecordID_isUserWaiting_maxOperationBackoff___block_invoke;
          v18[3] = &unk_1E8762D38;
          objc_copyWeak(&v20, &location);
          v19 = v8;
          -[BRCLocateRecordOperation addLocateRecordCompletionBlock:](v16, "addLocateRecordCompletionBlock:", v18);

          objc_destroyWeak(&v20);
        }
        -[BRCClientZone _registerLocateRecordOperation:](self, "_registerLocateRecordOperation:", v16);
        v12 = v16;
        objc_destroyWeak(&location);

        v9 = v12;
        goto LABEL_21;
      }
    }
    else if (!v14)
    {
      goto LABEL_15;
    }
    v12 = v15;
    v9 = v12;
    goto LABEL_21;
  }
  v9 = 0;
LABEL_22:

  return v9;
}

void __86__BRCClientZone_locateRecordIfNecessaryForRecordID_isUserWaiting_maxOperationBackoff___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  NSObject *v5;
  _QWORD v6[5];
  id v7;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "db");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "serialQueue");
    v5 = objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __86__BRCClientZone_locateRecordIfNecessaryForRecordID_isUserWaiting_maxOperationBackoff___block_invoke_2;
    v6[3] = &unk_1E875D470;
    v6[4] = v3;
    v7 = *(id *)(a1 + 32);
    dispatch_async(v5, v6);

  }
}

uint64_t __86__BRCClientZone_locateRecordIfNecessaryForRecordID_isUserWaiting_maxOperationBackoff___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 224), "removeObjectForKey:", *(_QWORD *)(a1 + 40));
}

- (id)locateRecordIfNecessaryForRecordID:(id)a3 isUserWaiting:(BOOL)a4
{
  return -[BRCClientZone locateRecordIfNecessaryForRecordID:isUserWaiting:maxOperationBackoff:](self, "locateRecordIfNecessaryForRecordID:isUserWaiting:maxOperationBackoff:", a3, a4, 1.79769313e308);
}

- (void)clearAndRefetchRecentAndFavoriteDocuments
{
  void *v3;
  NSObject *v4;
  _QWORD block[5];

  -[BRCServerZone db](self->_serverZone, "db");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "serialQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__BRCClientZone_clearAndRefetchRecentAndFavoriteDocuments__block_invoke;
  block[3] = &unk_1E875D500;
  block[4] = self;
  dispatch_async(v4, block);

}

void __58__BRCClientZone_clearAndRefetchRecentAndFavoriteDocuments__block_invoke(uint64_t a1)
{
  NSObject *v2;
  _QWORD block[5];

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "clearStateBits:", 24);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "clientTruthWorkloop");
  v2 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__BRCClientZone_clearAndRefetchRecentAndFavoriteDocuments__block_invoke_2;
  block[3] = &unk_1E875D500;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(v2, block);

}

uint64_t __58__BRCClientZone_clearAndRefetchRecentAndFavoriteDocuments__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "fetchRecentAndFavoriteDocuments:", 1);
}

- (void)fetchRecentAndFavoriteDocuments
{
  -[BRCClientZone fetchRecentAndFavoriteDocuments:](self, "fetchRecentAndFavoriteDocuments:", 0);
}

- (void)fetchRecentAndFavoriteDocuments:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  BRCServerZone *serverZone;
  _BOOL4 v12;
  void *v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  char v34;
  BRCFetchRecentAndFavoriteDocumentsOperation *v35;
  BRCFetchRecentAndFavoriteDocumentsOperation *fetchRecentsOperation;
  void *v37;
  NSObject *v38;
  void *v39;
  NSObject *v40;
  void *v41;
  NSObject *v42;
  _QWORD v43[4];
  id v44;
  _QWORD v45[5];
  _QWORD v46[5];
  _QWORD v47[5];
  _QWORD block[5];
  uint8_t buf[4];
  BRCServerZone *v50;
  __int16 v51;
  void *v52;
  uint64_t v53;

  v3 = a3;
  v53 = *MEMORY[0x1E0C80C00];
  -[BRCPQLConnection assertOnQueue](self->_db, "assertOnQueue");
  -[BRCServerZone db](self->_serverZone, "db");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "serialQueue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[BRCServerZone changeState](self->_serverZone, "changeState");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "changeToken");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {

      goto LABEL_11;
    }
    v12 = -[BRCClientZone hasCompletedInitialSyncDownOnce](self, "hasCompletedInitialSyncDownOnce");

    if (!v12)
    {
LABEL_11:
      if (self->_fetchRecentsOperation)
      {
        brc_bread_crumbs();
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
          -[BRCClientZone fetchRecentAndFavoriteDocuments:].cold.8();

        if (v3)
        {
          brc_bread_crumbs();
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
            -[BRCClientZone fetchRecentAndFavoriteDocuments:].cold.7((uint64_t)self);

          self->_invokeFetchRecentsOperation = 1;
        }
      }
      else if (-[BRCServerZone hasFetchedRecentsAndFavorites](self->_serverZone, "hasFetchedRecentsAndFavorites"))
      {
        brc_bread_crumbs();
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
          -[BRCClientZone fetchRecentAndFavoriteDocuments:].cold.2();

      }
      else if ((-[BRCServerZone state](self->_serverZone, "state") & 4) != 0)
      {
        brc_bread_crumbs();
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
          -[BRCClientZone fetchRecentAndFavoriteDocuments:].cold.6();

        -[BRCServerZone db](self->_serverZone, "db");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "serialQueue");
        v30 = objc_claimAutoreleasedReturnValue();
        v47[0] = MEMORY[0x1E0C809B0];
        v47[1] = 3221225472;
        v47[2] = __49__BRCClientZone_fetchRecentAndFavoriteDocuments___block_invoke_270;
        v47[3] = &unk_1E875D500;
        v47[4] = self;
        dispatch_async(v30, v47);

      }
      else if (-[BRCClientZone isSharedZone](self, "isSharedZone"))
      {
        brc_bread_crumbs();
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
          -[BRCClientZone fetchRecentAndFavoriteDocuments:].cold.3();

        -[BRCServerZone db](self->_serverZone, "db");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "serialQueue");
        v26 = objc_claimAutoreleasedReturnValue();
        v46[0] = MEMORY[0x1E0C809B0];
        v46[1] = 3221225472;
        v46[2] = __49__BRCClientZone_fetchRecentAndFavoriteDocuments___block_invoke_271;
        v46[3] = &unk_1E875D500;
        v46[4] = self;
        dispatch_async(v26, v46);

      }
      else
      {
        -[BRCClientZone asPrivateClientZone](self, "asPrivateClientZone");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "defaultAppLibrary");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "containerMetadata");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = objc_msgSend(v33, "isDocumentScopePublic");

        if ((v34 & 1) != 0)
        {
          if (!-[BRCClientZone _isSideSyncOperationBlockedWithName:](self, "_isSideSyncOperationBlockedWithName:", CFSTR("fetch recents and favorites")))
          {
            v35 = -[BRCFetchRecentAndFavoriteDocumentsOperation initWithServerZone:sessionContext:]([BRCFetchRecentAndFavoriteDocumentsOperation alloc], "initWithServerZone:sessionContext:", self->_serverZone, self->_session);
            fetchRecentsOperation = self->_fetchRecentsOperation;
            self->_fetchRecentsOperation = v35;

            objc_initWeak((id *)buf, self);
            v43[0] = MEMORY[0x1E0C809B0];
            v43[1] = 3221225472;
            v43[2] = __49__BRCClientZone_fetchRecentAndFavoriteDocuments___block_invoke_2;
            v43[3] = &unk_1E8762D60;
            objc_copyWeak(&v44, (id *)buf);
            -[_BRCOperation setFinishBlock:](self->_fetchRecentsOperation, "setFinishBlock:", v43);
            brc_bread_crumbs();
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            brc_default_log();
            v38 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
              -[BRCClientZone fetchRecentAndFavoriteDocuments:].cold.4();

            -[BRCClientZone _registerServerStitchingOperation:](self, "_registerServerStitchingOperation:", self->_fetchRecentsOperation);
            objc_destroyWeak(&v44);
            objc_destroyWeak((id *)buf);
          }
        }
        else
        {
          brc_bread_crumbs();
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v40 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
            -[BRCClientZone fetchRecentAndFavoriteDocuments:].cold.5();

          -[BRCServerZone db](self->_serverZone, "db");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "serialQueue");
          v42 = objc_claimAutoreleasedReturnValue();
          v45[0] = MEMORY[0x1E0C809B0];
          v45[1] = 3221225472;
          v45[2] = __49__BRCClientZone_fetchRecentAndFavoriteDocuments___block_invoke_272;
          v45[3] = &unk_1E875D500;
          v45[4] = self;
          dispatch_async(v42, v45);

        }
      }
      return;
    }
    brc_bread_crumbs();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      -[BRCClientZone fetchRecentAndFavoriteDocuments:].cold.1();

    -[BRCServerZone db](self->_serverZone, "db");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "serialQueue");
    v16 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __49__BRCClientZone_fetchRecentAndFavoriteDocuments___block_invoke;
    block[3] = &unk_1E875D500;
    block[4] = self;
    dispatch_async(v16, block);

  }
  else
  {
    brc_bread_crumbs();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      serverZone = self->_serverZone;
      *(_DWORD *)buf = 138412546;
      v50 = serverZone;
      v51 = 2112;
      v52 = v9;
      _os_log_impl(&dword_1CBD43000, v10, OS_LOG_TYPE_DEFAULT, "[WARNING] Zone doesn't have a serial queue anymore %@%@", buf, 0x16u);
    }

  }
}

uint64_t __49__BRCClientZone_fetchRecentAndFavoriteDocuments___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setStateBits:", 24);
}

uint64_t __49__BRCClientZone_fetchRecentAndFavoriteDocuments___block_invoke_270(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setStateBits:", 24);
}

uint64_t __49__BRCClientZone_fetchRecentAndFavoriteDocuments___block_invoke_271(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setStateBits:", 24);
}

uint64_t __49__BRCClientZone_fetchRecentAndFavoriteDocuments___block_invoke_272(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setStateBits:", 24);
}

void __49__BRCClientZone_fetchRecentAndFavoriteDocuments___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  _QWORD *WeakRetained;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  _QWORD v13[5];
  id v14;
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  _QWORD *v18;
  __int16 v19;
  id v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "db");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "serialQueue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    brc_bread_crumbs();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      v12 = WeakRetained[29];
      *(_DWORD *)buf = 138413058;
      v16 = v12;
      v17 = 2112;
      v18 = WeakRetained;
      v19 = 2112;
      v20 = v4;
      v21 = 2112;
      v22 = v8;
      _os_log_debug_impl(&dword_1CBD43000, v9, OS_LOG_TYPE_DEBUG, "[DEBUG] Finished fetching recent documents (operation %@) for %@ - %@%@", buf, 0x2Au);
    }

    objc_msgSend(WeakRetained, "db");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "serialQueue");
    v11 = objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __49__BRCClientZone_fetchRecentAndFavoriteDocuments___block_invoke_276;
    v13[3] = &unk_1E875D470;
    v13[4] = WeakRetained;
    v14 = v4;
    dispatch_async(v11, v13);

  }
}

uint64_t __49__BRCClientZone_fetchRecentAndFavoriteDocuments___block_invoke_276(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t result;
  uint64_t v5;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 232);
  *(_QWORD *)(v2 + 232) = 0;

  if ((objc_msgSend(*(id *)(a1 + 40), "brc_isCloudKitCancellationError") & 1) != 0
    || (result = objc_msgSend(*(id *)(a1 + 40), "brc_isRetriable"), (_DWORD)result))
  {
    result = objc_msgSend(*(id *)(a1 + 32), "state");
    if ((result & 0x100) == 0)
    {
      result = objc_msgSend(*(id *)(a1 + 32), "activated");
      if ((_DWORD)result)
        *(_BYTE *)(*(_QWORD *)(a1 + 32) + 240) = 1;
    }
  }
  v5 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v5 + 240))
  {
    *(_BYTE *)(v5 + 240) = 0;
    return objc_msgSend(*(id *)(a1 + 32), "fetchRecentAndFavoriteDocuments");
  }
  return result;
}

- (BOOL)dumpStatusToContext:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  BRCAccountSession *v8;
  id v9;
  BRCAccountSession *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  void *v17;
  BOOL v18;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _QWORD v25[4];
  id v26;
  id v27;
  BRCClientZone *v28;
  BRCAccountSession *v29;
  id v30;
  _QWORD *v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t v36;
  _QWORD v37[3];
  char v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = objc_alloc_init(MEMORY[0x1E0CB3788]);
  v8 = self->_session;
  v37[0] = 0;
  v37[1] = v37;
  v37[2] = 0x2020000000;
  v38 = 1;
  v33 = 0;
  v34 = &v33;
  v35 = 0x2050000000;
  v36 = 0;
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __43__BRCClientZone_dumpStatusToContext_error___block_invoke;
  v25[3] = &unk_1E8762D88;
  v31 = v37;
  v20 = v6;
  v26 = v20;
  v9 = v7;
  v27 = v9;
  v28 = self;
  v10 = v8;
  v29 = v10;
  v30 = 0;
  v32 = &v33;
  v34[3] = (uint64_t)v25;
  if (-[BRCClientZone isPrivateZone](self, "isPrivateZone"))
  {
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    -[BRCClientZone asPrivateClientZone](self, "asPrivateClientZone");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "appLibraries");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v39, 16);
    if (v13)
    {
      v14 = *(_QWORD *)v22;
      while (2)
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v22 != v14)
            objc_enumerationMutation(v12);
          v16 = v34[3];
          objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * i), "rootItemID");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          LOBYTE(v16) = (*(uint64_t (**)(uint64_t, void *, _QWORD, const __CFString *, id *))(v16 + 16))(v16, v17, 0, CFSTR("/"), a4);

          if ((v16 & 1) == 0)
          {
            v18 = 0;
            goto LABEL_13;
          }
        }
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v39, 16);
        if (v13)
          continue;
        break;
      }
    }
    v18 = 1;
LABEL_13:

  }
  else
  {
    v18 = 1;
  }

  _Block_object_dispose(&v33, 8);
  _Block_object_dispose(v37, 8);

  return v18;
}

uint64_t __43__BRCClientZone_dumpStatusToContext_error___block_invoke(uint64_t a1, void *a2, int a3, void *a4, uint64_t a5)
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  _BOOL4 v31;
  void *v32;
  int v33;
  void *v34;
  int v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  __CFString *v41;
  void *v42;
  void *v43;
  id v44;
  void *v45;
  int v46;
  void *v47;
  void *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v55;
  id v56;
  void *v57;
  void (**v60)(void);
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  _QWORD v66[4];
  id v67;
  id v68;
  uint64_t v69;
  _QWORD *v70;
  _QWORD v71[3];
  char v72;

  v7 = a2;
  v8 = a4;
  v71[0] = 0;
  v71[1] = v71;
  v71[2] = 0x2020000000;
  v72 = 1;
  v66[0] = MEMORY[0x1E0C809B0];
  v66[1] = 3221225472;
  v66[2] = __43__BRCClientZone_dumpStatusToContext_error___block_invoke_2;
  v66[3] = &unk_1E87615F8;
  v69 = *(_QWORD *)(a1 + 72);
  v67 = *(id *)(a1 + 32);
  v70 = v71;
  v56 = v8;
  v68 = v56;
  v60 = (void (**)(void))MEMORY[0x1D17A6DB0](v66);
  objc_msgSend(*(id *)(a1 + 32), "db");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "fetch:", CFSTR("SELECT rowid, zone_rowid, item_id, item_creator_id, item_sharing_options, item_side_car_ckinfo, item_parent_zone_rowid, item_localsyncupstate, item_local_diffs, item_notifs_rank, app_library_rowid, item_min_supported_os_rowid, item_user_visible, item_stat_ckinfo, item_state, item_type, item_mode, item_birthtime, item_lastusedtime, item_favoriterank,item_parent_id, item_filename, item_hidden_ext, item_finder_tags, item_xattr_signature, item_trash_put_back_path, item_trash_put_back_parent_id, item_alias_target, item_creator, item_doc_id, item_file_id, item_generation, item_localname, item_processing_stamp, item_staged_file_id, item_staged_generation, item_bouncedname, item_scope, item_tmpbounceno, version_name, version_ckinfo, version_mtime, version_size, version_thumb_size, version_thumb_signature, version_content_signature, version_xattr_signature, version_edited_since_shared, version_device, version_conflict_loser_etags, version_quarantine_info, version_uploaded_assets, version_upload_error, version_old_zone_item_id, version_old_zone_rowid, desired_version, item_live_conflict_loser_etags, item_thumb_live_signature, item_thumb_greedy, version_block_sync_until_bundle_id, version_block_sync_until_timestamp     FROM client_items    WHERE item_parent_id = %@ ORDER BY item_filename"), v7);
  v55 = v7;

  v57 = v10;
  do
  {
    v11 = objc_msgSend(v10, "next");
    if (!v11)
      break;
    v12 = (void *)MEMORY[0x1D17A6BE8]();
    v13 = objc_msgSend(v10, "integerAtIndex:", 0);
    if ((objc_msgSend(*(id *)(a1 + 32), "isCancelled") & 1) != 0)
    {
      v14 = 1;
    }
    else if (objc_msgSend(*(id *)(a1 + 40), "containsIndex:", v13))
    {
      v60[2]();
      objc_msgSend(*(id *)(a1 + 32), "pushIndentation");
      v15 = *(void **)(a1 + 32);
      objc_msgSend(v10, "objectOfClass:atIndex:", objc_opt_class(), 2);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      +[BRCDumpContext stringFromItemID:context:](BRCDumpContext, "stringFromItemID:context:", v16, *(_QWORD *)(a1 + 32));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "writeLineWithFormat:", CFSTR("ERROR: item ID %@ seen twice"), v17);

      objc_msgSend(*(id *)(a1 + 32), "popIndentation");
      v14 = 2;
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 40), "addIndex:", v13);
      objc_msgSend(*(id *)(a1 + 48), "session");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "db");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (void *)objc_msgSend(v18, "newLocalItemFromPQLResultSet:db:error:", v10, v19, a5);

      if (v20)
      {
        objc_msgSend(*(id *)(a1 + 56), "fsReader");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "descriptionForItem:context:", v20, *(_QWORD *)(a1 + 32));
        v22 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(*(id *)(a1 + 56), "fsUploader");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "descriptionForItem:context:", v20, *(_QWORD *)(a1 + 32));
        v24 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(*(id *)(a1 + 56), "applyScheduler");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "descriptionForRejectedItem:context:", v20, *(_QWORD *)(a1 + 32));
        v26 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(*(id *)(a1 + 56), "fsDownloader");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "descriptionForItem:context:", v20, *(_QWORD *)(a1 + 32));
        v28 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(*(id *)(a1 + 56), "syncUpScheduler");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "descriptionForItem:context:", v20, *(_QWORD *)(a1 + 32));
        v30 = objc_claimAutoreleasedReturnValue();

        v64 = (void *)v24;
        v65 = (void *)v22;
        v62 = (void *)v28;
        v63 = (void *)v26;
        v61 = (void *)v30;
        v31 = (v22 | v24 | v26 | v28 | v30) != 0;
        if (objc_msgSend(v20, "syncUpState"))
        {
          objc_msgSend(v20, "appLibrary");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v32, "state") & 0x40000) != 0)
          {
            objc_msgSend(v20, "itemID");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            v33 = objc_msgSend(v34, "isDocumentsFolder") ^ 1;

          }
          else
          {
            v33 = 1;
          }

        }
        else
        {
          v33 = 0;
        }
        v35 = v33 | v31;
        if ((v33 | v31) == 1)
        {
          v60[2]();
          objc_msgSend(*(id *)(a1 + 32), "pushIndentation");
          objc_msgSend(v20, "clientZone");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = *(void **)(a1 + 48);

          if (v36 == v37)
          {
            v41 = &stru_1E8769030;
          }
          else
          {
            v38 = objc_alloc(MEMORY[0x1E0CB3940]);
            objc_msgSend(v20, "clientZone");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v39, "mangledID");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            v41 = (__CFString *)objc_msgSend(v38, "initWithFormat:", CFSTR("zone:%@ "), v40);

          }
          v42 = *(void **)(a1 + 32);
          objc_msgSend(v20, "descriptionWithContext:", v42);
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "writeLineWithFormat:", CFSTR("%@%@"), v41, v43);

        }
        if (v31)
        {
          v44 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
          v45 = v44;
          if (v65)
            objc_msgSend(v44, "appendFormat:", CFSTR(" reader{%@}"), v65);
          if (v64)
            objc_msgSend(v45, "appendFormat:", CFSTR(" upload{%@}"), v64);
          if (v63)
            objc_msgSend(v45, "appendFormat:", CFSTR(" rejected{%@}"), v63);
          if (v62)
            objc_msgSend(v45, "appendFormat:", CFSTR(" downloader{%@}"), v62);
          if (v61)
            objc_msgSend(v45, "appendFormat:", CFSTR(" sync-up{%@}"), v61);
          objc_msgSend(*(id *)(a1 + 32), "writeLineWithFormat:", CFSTR(">%@"), v45);

        }
        if (v35)
          objc_msgSend(*(id *)(a1 + 32), "popIndentation");
        v46 = objc_msgSend(v20, "isDirectory") ^ 1;
        if (a3 > 99)
          LOBYTE(v46) = 1;
        if ((v46 & 1) != 0)
          goto LABEL_39;
        v47 = *(void **)(a1 + 64);
        objc_msgSend(v20, "itemID");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v47) = objc_msgSend(v47, "containsObject:", v48);

        if ((v47 & 1) != 0)
          goto LABEL_39;
        v49 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24);
        objc_msgSend(v20, "itemID");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "st");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "filename");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "stringByAppendingPathComponent:", v52);
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v49) = (*(uint64_t (**)(uint64_t, void *, _QWORD, void *, uint64_t))(v49 + 16))(v49, v50, (a3 + 1), v53, a5);

        if ((_DWORD)v49)
LABEL_39:
          v14 = 0;
        else
          v14 = 1;

        v10 = v57;
      }
      else
      {
        v14 = 1;
      }

    }
    objc_autoreleasePoolPop(v12);
  }
  while ((v14 | 2) == 2);

  _Block_object_dispose(v71, 8);
  return v11 ^ 1u;
}

uint64_t __43__BRCClientZone_dumpStatusToContext_error___block_invoke_2(uint64_t result)
{
  uint64_t v1;

  v1 = result;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 48) + 8) + 24))
  {
    objc_msgSend(*(id *)(result + 32), "writeLineWithFormat:", CFSTR("Client Truth Unclean Items:"));
    result = objc_msgSend(*(id *)(v1 + 32), "writeLineWithFormat:", CFSTR("--------------------------"));
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v1 + 48) + 8) + 24) = 0;
  }
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v1 + 56) + 8) + 24))
  {
    result = objc_msgSend(*(id *)(v1 + 32), "writeLineWithFormat:", CFSTR("Under %@"), *(_QWORD *)(v1 + 40));
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v1 + 56) + 8) + 24) = 0;
  }
  return result;
}

- (BOOL)dumpTablesToContext:(id)a3 includeAllItems:(BOOL)a4 error:(id *)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id *v30;
  void *v31;
  NSObject *v32;
  const char *v34;
  void *v35;
  id *v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint8_t buf[4];
  const char *v46;
  __int16 v47;
  const char *v48;
  __int16 v49;
  void *v50;
  __int16 v51;
  void *v52;
  _BYTE v53[128];
  _BYTE v54[128];
  uint64_t v55;

  v6 = a4;
  v55 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  objc_msgSend(v8, "writeLineWithFormat:", CFSTR("client items"));
  objc_msgSend(v8, "writeLineWithFormat:", CFSTR("============"));
  -[BRCClientZone _dumpItemsToContext:includeAllItems:error:](self, "_dumpItemsToContext:includeAllItems:error:", v8, v6, a5);
  v9 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  -[BRCClientZone serverZone](self, "serverZone");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "metadataSyncContextIfExists");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
    objc_msgSend(v9, "addObject:", v11);
  if (-[BRCClientZone isPrivateZone](self, "isPrivateZone"))
  {
    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    -[BRCClientZone asPrivateClientZone](self, "asPrivateClientZone");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "appLibraries");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v41, v54, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v42;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v42 != v16)
            objc_enumerationMutation(v13);
          objc_msgSend(*(id *)(*((_QWORD *)&v41 + 1) + 8 * i), "transferSyncContextIfExists");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if (v18)
            objc_msgSend(v9, "addObject:", v18);

        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v41, v54, 16);
      }
      while (v15);
    }
  }
  else
  {
    objc_msgSend(v10, "asSharedZone");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "transferSyncContextIfExists");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
      objc_msgSend(v9, "addObject:", v13);
  }

  if ((unint64_t)objc_msgSend(v9, "count") > 1)
  {
    v35 = v10;
    v36 = a5;
    objc_msgSend(v8, "writeLineWithFormat:", CFSTR("scheduling sync contexts"));
    objc_msgSend(v8, "writeLineWithFormat:", CFSTR("========================"));
    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    v21 = v9;
    v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v37, v53, 16);
    if (v22)
    {
      v23 = v22;
      v24 = *(_QWORD *)v38;
      do
      {
        for (j = 0; j != v23; ++j)
        {
          if (*(_QWORD *)v38 != v24)
            objc_enumerationMutation(v21);
          v26 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * j);
          objc_msgSend(v26, "contextIdentifier");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "writeLineWithFormat:", CFSTR("+ %@"), v27);

          objc_msgSend(v8, "pushIndentation");
          objc_msgSend(v26, "dumpToContext:", v8);
          objc_msgSend(v8, "popIndentation");
        }
        v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v37, v53, 16);
      }
      while (v23);
    }

    objc_msgSend(v8, "writeLineWithFormat:", &stru_1E8769030);
    v10 = v35;
    a5 = v36;
  }
  else
  {
    objc_msgSend(v9, "anyObject");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "dumpToContext:", v8);

  }
  objc_msgSend(0, "error");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (v28)
  {
    objc_msgSend(0, "error");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (v29)
    {
      v30 = a5;
      brc_bread_crumbs();
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, (os_log_type_t)0x90u))
      {
        v34 = "(passed to caller)";
        *(_DWORD *)buf = 136315906;
        v46 = "-[BRCClientZone dumpTablesToContext:includeAllItems:error:]";
        v47 = 2080;
        if (!v30)
          v34 = "(ignored by caller)";
        v48 = v34;
        v49 = 2112;
        v50 = v29;
        v51 = 2112;
        v52 = v31;
        _os_log_error_impl(&dword_1CBD43000, v32, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
      }

      a5 = v30;
    }
    if (a5)
      *a5 = objc_retainAutorelease(v29);

  }
  return v28 == 0;
}

- (BOOL)_resetItemsTable
{
  void *v2;
  NSObject *v3;
  void *v4;
  const char *v5;
  int v6;
  void *v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  abc_report_panic_with_signature();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("implement this in subclass"));
  objc_claimAutoreleasedReturnValue();
  brc_bread_crumbs();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
  {
    brc_append_system_info_to_message();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138412546;
    v7 = v4;
    v8 = 2112;
    v9 = v2;
    _os_log_fault_impl(&dword_1CBD43000, v3, OS_LOG_TYPE_FAULT, "[CRIT] %@%@", (uint8_t *)&v6, 0x16u);

  }
  brc_append_system_info_to_message();
  v5 = (const char *)objc_msgSend(objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue()), "UTF8String");
  __assert_rtn("-[BRCClientZone _resetItemsTable]", "/Library/Caches/com.apple.xbs/Sources/CloudDocs_plugins/core/shared/containers/BRCClientZone.m", 4218, v5);
}

- (id)allItems
{
  id v3;
  void *v4;
  _QWORD v6[5];

  v3 = -[BRCPQLConnection fetch:](self->_db, "fetch:", CFSTR("SELECT rowid, zone_rowid, item_id, item_creator_id, item_sharing_options, item_side_car_ckinfo, item_parent_zone_rowid, item_localsyncupstate, item_local_diffs, item_notifs_rank, app_library_rowid, item_min_supported_os_rowid, item_user_visible, item_stat_ckinfo, item_state, item_type, item_mode, item_birthtime, item_lastusedtime, item_favoriterank,item_parent_id, item_filename, item_hidden_ext, item_finder_tags, item_xattr_signature, item_trash_put_back_path, item_trash_put_back_parent_id, item_alias_target, item_creator, item_doc_id, item_file_id, item_generation, item_localname, item_processing_stamp, item_staged_file_id, item_staged_generation, item_bouncedname, item_scope, item_tmpbounceno, version_name, version_ckinfo, version_mtime, version_size, version_thumb_size, version_thumb_signature, version_content_signature, version_xattr_signature, version_edited_since_shared, version_device, version_conflict_loser_etags, version_quarantine_info, version_uploaded_assets, version_upload_error, version_old_zone_item_id, version_old_zone_rowid, desired_version, item_live_conflict_loser_etags, item_thumb_live_signature, item_thumb_greedy, version_block_sync_until_bundle_id, version_block_sync_until_timestamp FROM client_items WHERE zone_rowid = %@"), self->_dbRowID);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __25__BRCClientZone_allItems__block_invoke;
  v6[3] = &unk_1E875E2C8;
  v6[4] = self;
  objc_msgSend(v3, "enumerateObjects:", v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __25__BRCClientZone_allItems__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(v5, "session");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "session");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "clientDB");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v7, "newLocalItemFromPQLResultSet:db:error:", v6, v9, a3);

  return v10;
}

- (id)allItemsSortedByDepthDescending:(BOOL)a3
{
  const char *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v13[5];

  if (a3)
  {
    v4 = "item_level DESC";
    v5 = 15;
  }
  else
  {
    v4 = "item_level ASC";
    v5 = 14;
  }
  objc_msgSend(MEMORY[0x1E0DE81E0], "rawInjection:length:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[BRCClientZone isSharedZone](self, "isSharedZone"))
  {
    objc_msgSend(MEMORY[0x1E0DE81E0], "rawInjection:length:", "(item_sharing_options & 4) != 0", 31);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = (void *)MEMORY[0x1E0DE81D0];
    -[BRCClientZone rootItemID](self, "rootItemID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "formatInjection:", CFSTR("item_parent_id = %@"), v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v10 = -[BRCPQLConnection fetch:](self->_db, "fetch:", &cfstr_WithRecursiveI_5, self->_dbRowID, v7, v6);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __49__BRCClientZone_allItemsSortedByDepthDescending___block_invoke;
  v13[3] = &unk_1E875E2C8;
  v13[4] = self;
  objc_msgSend(v10, "enumerateObjects:", v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

id __49__BRCClientZone_allItemsSortedByDepthDescending___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(v5, "session");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "session");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "clientDB");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v7, "newLocalItemFromPQLResultSet:db:error:", v6, v9, a3);

  return v10;
}

- (id)itemsParentedToThisZoneButLivingInAnOtherZone
{
  id v3;
  void *v4;
  _QWORD v6[5];

  v3 = -[BRCPQLConnection fetch:](self->_db, "fetch:", CFSTR("SELECT rowid, zone_rowid, item_id, item_creator_id, item_sharing_options, item_side_car_ckinfo, item_parent_zone_rowid, item_localsyncupstate, item_local_diffs, item_notifs_rank, app_library_rowid, item_min_supported_os_rowid, item_user_visible, item_stat_ckinfo, item_state, item_type, item_mode, item_birthtime, item_lastusedtime, item_favoriterank,item_parent_id, item_filename, item_hidden_ext, item_finder_tags, item_xattr_signature, item_trash_put_back_path, item_trash_put_back_parent_id, item_alias_target, item_creator, item_doc_id, item_file_id, item_generation, item_localname, item_processing_stamp, item_staged_file_id, item_staged_generation, item_bouncedname, item_scope, item_tmpbounceno, version_name, version_ckinfo, version_mtime, version_size, version_thumb_size, version_thumb_signature, version_content_signature, version_xattr_signature, version_edited_since_shared, version_device, version_conflict_loser_etags, version_quarantine_info, version_uploaded_assets, version_upload_error, version_old_zone_item_id, version_old_zone_rowid, desired_version, item_live_conflict_loser_etags, item_thumb_live_signature, item_thumb_greedy, version_block_sync_until_bundle_id, version_block_sync_until_timestamp FROM client_items WHERE item_parent_zone_rowid = %@ AND item_parent_zone_rowid != zone_rowid"), self->_dbRowID);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __62__BRCClientZone_itemsParentedToThisZoneButLivingInAnOtherZone__block_invoke;
  v6[3] = &unk_1E875E2C8;
  v6[4] = self;
  objc_msgSend(v3, "enumerateObjects:", v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __62__BRCClientZone_itemsParentedToThisZoneButLivingInAnOtherZone__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(v5, "session");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "session");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "clientDB");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v7, "newLocalItemFromPQLResultSet:db:error:", v6, v9, a3);

  return v10;
}

- (int64_t)serverRankByItemID:(id)a3
{
  return -[BRCClientZone serverRankByItemID:db:](self, "serverRankByItemID:db:", a3, self->_db);
}

- (id)serverItemByRank:(int64_t)a3
{
  BRCPQLConnection *db;
  _QWORD v5[5];

  db = self->_db;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __34__BRCClientZone_serverItemByRank___block_invoke;
  v5[3] = &unk_1E875E2C8;
  v5[4] = self;
  return -[BRCPQLConnection fetchObject:sql:](db, "fetchObject:sql:", v5, CFSTR("SELECT zone_rowid, item_rank, item_origname, pcs_state, item_id, item_creator_id, item_sharing_options, item_side_car_ckinfo, item_stat_ckinfo, item_state, item_type, item_mode, item_birthtime, item_lastusedtime, item_favoriterank,item_parent_id, item_filename, item_hidden_ext, item_finder_tags, item_xattr_signature, item_trash_put_back_path, item_trash_put_back_parent_id, item_alias_target, item_creator, version_name, version_ckinfo, version_mtime, version_size, version_thumb_size, version_thumb_signature, version_content_signature, version_xattr_signature, version_edited_since_shared, version_device, version_conflict_loser_etags, version_quarantine_info, quota_used, recursive_child_count, shared_children_count, shared_alias_count, child_count FROM server_items WHERE item_rank = %lld AND zone_rowid = %@"), a3, self->_dbRowID);
}

id __34__BRCClientZone_serverItemByRank___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = *(void **)(a1 + 32);
  v5 = a2;
  objc_msgSend(v4, "session");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "newServerItemFromPQLResultSet:error:", v5, a3);

  return v7;
}

- (int64_t)serverRankByItemID:(id)a3 db:(id)a4
{
  void *v4;
  int64_t v5;

  v4 = (void *)objc_msgSend(a4, "fetch:", CFSTR("SELECT item_rank FROM server_items WHERE item_id = %@ AND zone_rowid = %@"), a3, self->_dbRowID);
  if (objc_msgSend(v4, "next"))
  {
    v5 = objc_msgSend(v4, "longLongAtIndex:", 0);
    objc_msgSend(v4, "close");
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)serverItemByItemID:(id)a3
{
  return -[BRCClientZone serverItemByItemID:db:](self, "serverItemByItemID:db:", a3, self->_db);
}

- (id)serverItemByItemID:(id)a3 db:(id)a4
{
  _QWORD v5[5];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __39__BRCClientZone_serverItemByItemID_db___block_invoke;
  v5[3] = &unk_1E875E2C8;
  v5[4] = self;
  return (id)objc_msgSend(a4, "fetchObject:sql:", v5, CFSTR("SELECT zone_rowid, item_rank, item_origname, pcs_state, item_id, item_creator_id, item_sharing_options, item_side_car_ckinfo, item_stat_ckinfo, item_state, item_type, item_mode, item_birthtime, item_lastusedtime, item_favoriterank,item_parent_id, item_filename, item_hidden_ext, item_finder_tags, item_xattr_signature, item_trash_put_back_path, item_trash_put_back_parent_id, item_alias_target, item_creator, version_name, version_ckinfo, version_mtime, version_size, version_thumb_size, version_thumb_signature, version_content_signature, version_xattr_signature, version_edited_since_shared, version_device, version_conflict_loser_etags, version_quarantine_info, quota_used, recursive_child_count, shared_children_count, shared_alias_count, child_count FROM server_items WHERE item_id = %@ AND zone_rowid = %@"), a3, self->_dbRowID);
}

id __39__BRCClientZone_serverItemByItemID_db___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = *(void **)(a1 + 32);
  v5 = a2;
  objc_msgSend(v4, "session");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "newServerItemFromPQLResultSet:error:", v5, a3);

  return v7;
}

- (id)serverItemByRowID:(unint64_t)a3
{
  return -[BRCClientZone serverItemByRowID:db:](self, "serverItemByRowID:db:", a3, self->_db);
}

- (id)serverItemByRowID:(unint64_t)a3 db:(id)a4
{
  _QWORD v5[5];

  v5[1] = 3221225472;
  v5[2] = __38__BRCClientZone_serverItemByRowID_db___block_invoke;
  v5[3] = &unk_1E875E2C8;
  v5[4] = self;
  v5[0] = MEMORY[0x1E0C809B0];
  return (id)objc_msgSend(a4, "fetchObject:sql:", v5, CFSTR("SELECT zone_rowid, item_rank, item_origname, pcs_state, item_id, item_creator_id, item_sharing_options, item_side_car_ckinfo, item_stat_ckinfo, item_state, item_type, item_mode, item_birthtime, item_lastusedtime, item_favoriterank,item_parent_id, item_filename, item_hidden_ext, item_finder_tags, item_xattr_signature, item_trash_put_back_path, item_trash_put_back_parent_id, item_alias_target, item_creator, version_name, version_ckinfo, version_mtime, version_size, version_thumb_size, version_thumb_signature, version_content_signature, version_xattr_signature, version_edited_since_shared, version_device, version_conflict_loser_etags, version_quarantine_info, quota_used, recursive_child_count, shared_children_count, shared_alias_count, child_count FROM server_items WHERE rowid = %lld"), a3);
}

id __38__BRCClientZone_serverItemByRowID_db___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = *(void **)(a1 + 32);
  v5 = a2;
  objc_msgSend(v4, "session");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "newServerItemFromPQLResultSet:error:", v5, a3);

  return v7;
}

- (id)serverChildCountWithParentID:(id)a3 db:(id)a4
{
  return (id)objc_msgSend(a4, "numberWithSQL:", CFSTR("SELECT child_count FROM server_items WHERE item_id = %@ AND zone_rowid = %@"), a3, self->_dbRowID);
}

- (id)clientChildCountWithParentID:(id)a3 db:(id)a4
{
  return (id)objc_msgSend(a4, "numberWithSQL:", CFSTR("SELECT visible_child_count FROM client_items WHERE item_id = %@ AND zone_rowid = %@"), a3, self->_dbRowID);
}

- (BOOL)containsNonRejectedChildWithParentID:(id)a3 db:(id)a4
{
  void *v4;
  char v5;

  v4 = (void *)objc_msgSend(a4, "numberWithSQL:", CFSTR("SELECT 1 FROM client_items WHERE item_parent_id = %@ AND item_parent_zone_rowid = %@ AND item_user_visible = 1 AND item_localsyncupstate != 1 LIMIT 1"), a3, self->_dbRowID);
  v5 = objc_msgSend(v4, "BOOLValue");

  return v5;
}

- (id)serverQuotaUsageWithParentID:(id)a3 db:(id)a4
{
  return (id)objc_msgSend(a4, "numberWithSQL:", CFSTR("SELECT quota_used FROM server_items WHERE item_id = %@ AND zone_rowid = %@"), a3, self->_dbRowID);
}

- (id)serverHiddenChildCountWithParentID:(id)a3 db:(id)a4
{
  return (id)objc_msgSend(a4, "numberWithSQL:", CFSTR("SELECT COUNT(si.item_id) FROM server_items AS si LEFT JOIN client_unapplied_table AS cu ON si.item_rank = cu.throttle_id WHERE si.item_parent_id = %@ AND si.zone_rowid = %@ AND ((si.item_filename LIKE '.%%') OR (si.item_type = 3 AND cu.throttle_state = 24))"), a3, self->_dbRowID);
}

- (id)itemByItemID:(id)a3
{
  return -[BRCClientZone itemByItemID:db:](self, "itemByItemID:db:", a3, self->_db);
}

- (id)itemByItemID:(id)a3 db:(id)a4
{
  id v6;
  id v7;
  BRCItemGlobalID *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  v8 = -[BRCItemGlobalID initWithZoneRowID:itemID:]([BRCItemGlobalID alloc], "initWithZoneRowID:itemID:", self->_dbRowID, v7);

  -[BRCAccountSession itemByItemGlobalID:db:](self->_session, "itemByItemGlobalID:db:", v8, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)documentItemByItemID:(id)a3
{
  return -[BRCClientZone documentItemByItemID:db:](self, "documentItemByItemID:db:", a3, self->_db);
}

- (id)documentItemByItemID:(id)a3 db:(id)a4
{
  void *v4;
  void *v5;

  -[BRCClientZone itemByItemID:](self, "itemByItemID:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isDocument"))
  {
    objc_msgSend(v4, "asDocument");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)itemByRowID:(unint64_t)a3
{
  return -[BRCClientZone itemByRowID:db:](self, "itemByRowID:db:", a3, self->_db);
}

- (id)itemByRowID:(unint64_t)a3 db:(id)a4
{
  id v6;
  BRCZoneRowID *dbRowID;
  id v8;
  void *v9;
  _QWORD v11[5];
  id v12;

  v6 = a4;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __32__BRCClientZone_itemByRowID_db___block_invoke;
  v11[3] = &unk_1E875E310;
  v11[4] = self;
  v12 = v6;
  dbRowID = self->_dbRowID;
  v8 = v6;
  v9 = (void *)objc_msgSend(v8, "fetchObject:sql:", v11, CFSTR("SELECT rowid, zone_rowid, item_id, item_creator_id, item_sharing_options, item_side_car_ckinfo, item_parent_zone_rowid, item_localsyncupstate, item_local_diffs, item_notifs_rank, app_library_rowid, item_min_supported_os_rowid, item_user_visible, item_stat_ckinfo, item_state, item_type, item_mode, item_birthtime, item_lastusedtime, item_favoriterank,item_parent_id, item_filename, item_hidden_ext, item_finder_tags, item_xattr_signature, item_trash_put_back_path, item_trash_put_back_parent_id, item_alias_target, item_creator, item_doc_id, item_file_id, item_generation, item_localname, item_processing_stamp, item_staged_file_id, item_staged_generation, item_bouncedname, item_scope, item_tmpbounceno, version_name, version_ckinfo, version_mtime, version_size, version_thumb_size, version_thumb_signature, version_content_signature, version_xattr_signature, version_edited_since_shared, version_device, version_conflict_loser_etags, version_quarantine_info, version_uploaded_assets, version_upload_error, version_old_zone_item_id, version_old_zone_rowid, desired_version, item_live_conflict_loser_etags, item_thumb_live_signature, item_thumb_greedy, version_block_sync_until_bundle_id, version_block_sync_until_timestamp FROM client_items WHERE rowid = %lld AND zone_rowid = %@"), a3, dbRowID);

  return v9;
}

id __32__BRCClientZone_itemByRowID_db___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;

  v5 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(v5, "session");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "newLocalItemFromPQLResultSet:db:error:", v6, *(_QWORD *)(a1 + 40), a3);

  return v8;
}

- (id)directoryOrRootItemIDByFileID:(unint64_t)a3
{
  return -[BRCClientZone directoryOrRootItemIDByFileID:db:](self, "directoryOrRootItemIDByFileID:db:", a3, self->_db);
}

- (id)directoryOrRootItemIDByFileID:(unint64_t)a3 db:(id)a4
{
  return (id)objc_msgSend(a4, "itemIDWithSQL:", CFSTR("SELECT item_id FROM client_items  WHERE item_file_id = %lld    AND +item_type IN (0, 9, 10, 4)    AND item_state IN (0, -1)    AND zone_rowid = %@"), a3, self->_dbRowID);
}

- (BOOL)existsByItemID:(id)a3
{
  return -[BRCClientZone existsByItemID:db:](self, "existsByItemID:db:", a3, self->_db);
}

- (BOOL)existsByItemID:(id)a3 db:(id)a4
{
  return -[BRCClientZone itemTypeByItemID:db:](self, "itemTypeByItemID:db:", a3, a4) != -1;
}

- (char)itemTypeByItemID:(id)a3 db:(id)a4
{
  void *v4;
  void *v5;
  char v6;

  v4 = (void *)objc_msgSend(a4, "numberWithSQL:", CFSTR("SELECT item_type FROM client_items WHERE item_id = %@ AND zone_rowid = %@ LIMIT 1"), a3, self->_dbRowID);
  v5 = v4;
  if (v4)
    v6 = objc_msgSend(v4, "intValue");
  else
    v6 = -1;

  return v6;
}

- (BOOL)validateItemsLoggingToFile:(__sFILE *)a3 db:(id)a4
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  const char *v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a4;
  abc_report_panic_with_signature();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("must implement in subclass"));
  objc_claimAutoreleasedReturnValue();
  brc_bread_crumbs();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
  {
    brc_append_system_info_to_message();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138412546;
    v10 = v7;
    v11 = 2112;
    v12 = v5;
    _os_log_fault_impl(&dword_1CBD43000, v6, OS_LOG_TYPE_FAULT, "[CRIT] %@%@", (uint8_t *)&v9, 0x16u);

  }
  brc_append_system_info_to_message();
  v8 = (const char *)objc_msgSend(objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue()), "UTF8String");
  __assert_rtn("-[BRCClientZone validateItemsLoggingToFile:db:]", "/Library/Caches/com.apple.xbs/Sources/CloudDocs_plugins/core/shared/containers/BRCClientZone.m", 4415, v8);
}

- (BOOL)validateStructureLoggingToFile:(__sFILE *)a3 db:(id)a4
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  const char *v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a4;
  abc_report_panic_with_signature();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("must implement in subclass"));
  objc_claimAutoreleasedReturnValue();
  brc_bread_crumbs();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
  {
    brc_append_system_info_to_message();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138412546;
    v10 = v7;
    v11 = 2112;
    v12 = v5;
    _os_log_fault_impl(&dword_1CBD43000, v6, OS_LOG_TYPE_FAULT, "[CRIT] %@%@", (uint8_t *)&v9, 0x16u);

  }
  brc_append_system_info_to_message();
  v8 = (const char *)objc_msgSend(objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue()), "UTF8String");
  __assert_rtn("-[BRCClientZone validateStructureLoggingToFile:db:]", "/Library/Caches/com.apple.xbs/Sources/CloudDocs_plugins/core/shared/containers/BRCClientZone.m", 4420, v8);
}

- (void)_removeAllShareAcceptanceBlocks
{
  void *v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSMutableDictionary *downloadedBlockToPerformForItemID;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSMutableDictionary *onDiskBlockToPerformForItemID;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  NSMutableDictionary *syncDownBlockToPerformForItemID;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  NSMutableDictionary *locateBlocksToPerformForRecordID;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  NSMutableDictionary *syncDownBlockToPerformForBookmarkData;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  _BYTE v75[128];
  _BYTE v76[128];
  _BYTE v77[128];
  _BYTE v78[128];
  _BYTE v79[128];
  _BYTE v80[128];
  uint8_t v81[128];
  uint8_t buf[4];
  void *v83;
  uint64_t v84;

  v84 = *MEMORY[0x1E0C80C00];
  -[BRCPQLConnection assertOnQueue](self->_db, "assertOnQueue");
  brc_bread_crumbs();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v83 = v3;
    _os_log_impl(&dword_1CBD43000, v4, OS_LOG_TYPE_DEFAULT, "[WARNING] calling and removing all share acceptance blocks%@", buf, 0xCu);
  }

  v73 = 0u;
  v74 = 0u;
  v71 = 0u;
  v72 = 0u;
  -[NSMutableDictionary objectEnumerator](self->_downloadedBlockToPerformForItemID, "objectEnumerator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v71, v81, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v72;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v72 != v8)
          objc_enumerationMutation(v5);
        (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v71 + 1) + 8 * v9++) + 16))();
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v71, v81, 16);
    }
    while (v7);
  }

  downloadedBlockToPerformForItemID = self->_downloadedBlockToPerformForItemID;
  self->_downloadedBlockToPerformForItemID = 0;

  v69 = 0u;
  v70 = 0u;
  v67 = 0u;
  v68 = 0u;
  -[NSMutableDictionary objectEnumerator](self->_onDiskBlockToPerformForItemID, "objectEnumerator");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v67, v80, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v68;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v68 != v14)
          objc_enumerationMutation(v11);
        (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v67 + 1) + 8 * v15++) + 16))();
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v67, v80, 16);
    }
    while (v13);
  }

  onDiskBlockToPerformForItemID = self->_onDiskBlockToPerformForItemID;
  self->_onDiskBlockToPerformForItemID = 0;

  v65 = 0u;
  v66 = 0u;
  v63 = 0u;
  v64 = 0u;
  -[NSMutableDictionary objectEnumerator](self->_syncDownBlockToPerformForItemID, "objectEnumerator");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v63, v79, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v64;
    do
    {
      v21 = 0;
      do
      {
        if (*(_QWORD *)v64 != v20)
          objc_enumerationMutation(v17);
        v22 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * v21);
        v59 = 0u;
        v60 = 0u;
        v61 = 0u;
        v62 = 0u;
        v23 = v22;
        v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v59, v78, 16);
        if (v24)
        {
          v25 = v24;
          v26 = *(_QWORD *)v60;
          do
          {
            v27 = 0;
            do
            {
              if (*(_QWORD *)v60 != v26)
                objc_enumerationMutation(v23);
              (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v59 + 1) + 8 * v27++) + 16))();
            }
            while (v25 != v27);
            v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v59, v78, 16);
          }
          while (v25);
        }

        ++v21;
      }
      while (v21 != v19);
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v63, v79, 16);
    }
    while (v19);
  }

  syncDownBlockToPerformForItemID = self->_syncDownBlockToPerformForItemID;
  self->_syncDownBlockToPerformForItemID = 0;

  v57 = 0u;
  v58 = 0u;
  v55 = 0u;
  v56 = 0u;
  -[NSMutableDictionary objectEnumerator](self->_locateBlocksToPerformForRecordID, "objectEnumerator");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v55, v77, 16);
  if (v30)
  {
    v31 = v30;
    v32 = *(_QWORD *)v56;
    do
    {
      v33 = 0;
      do
      {
        if (*(_QWORD *)v56 != v32)
          objc_enumerationMutation(v29);
        v34 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * v33);
        v51 = 0u;
        v52 = 0u;
        v53 = 0u;
        v54 = 0u;
        v35 = v34;
        v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v51, v76, 16);
        if (v36)
        {
          v37 = v36;
          v38 = *(_QWORD *)v52;
          do
          {
            v39 = 0;
            do
            {
              if (*(_QWORD *)v52 != v38)
                objc_enumerationMutation(v35);
              (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v51 + 1) + 8 * v39++) + 16))();
            }
            while (v37 != v39);
            v37 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v51, v76, 16);
          }
          while (v37);
        }

        ++v33;
      }
      while (v33 != v31);
      v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v55, v77, 16);
    }
    while (v31);
  }

  locateBlocksToPerformForRecordID = self->_locateBlocksToPerformForRecordID;
  self->_locateBlocksToPerformForRecordID = 0;

  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  -[NSMutableDictionary objectEnumerator](self->_syncDownBlockToPerformForBookmarkData, "objectEnumerator", 0);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v47, v75, 16);
  if (v42)
  {
    v43 = v42;
    v44 = *(_QWORD *)v48;
    do
    {
      v45 = 0;
      do
      {
        if (*(_QWORD *)v48 != v44)
          objc_enumerationMutation(v41);
        (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * v45++) + 16))();
      }
      while (v43 != v45);
      v43 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v47, v75, 16);
    }
    while (v43);
  }

  syncDownBlockToPerformForBookmarkData = self->_syncDownBlockToPerformForBookmarkData;
  self->_syncDownBlockToPerformForBookmarkData = 0;

}

- (void)_removeOnDiskBlockToPerformForItemID:(id)a3
{
  BRCPQLConnection *db;
  id v5;
  NSMutableDictionary *onDiskBlockToPerformForItemID;

  db = self->_db;
  v5 = a3;
  -[BRCPQLConnection assertOnQueue](db, "assertOnQueue");
  -[NSMutableDictionary removeObjectForKey:](self->_onDiskBlockToPerformForItemID, "removeObjectForKey:", v5);

  if (!-[NSMutableDictionary count](self->_onDiskBlockToPerformForItemID, "count"))
  {
    onDiskBlockToPerformForItemID = self->_onDiskBlockToPerformForItemID;
    self->_onDiskBlockToPerformForItemID = 0;

  }
}

- (void)_removeDownloadedBlockToPerformForItemID:(id)a3
{
  BRCPQLConnection *db;
  id v5;
  NSMutableDictionary *downloadedBlockToPerformForItemID;

  db = self->_db;
  v5 = a3;
  -[BRCPQLConnection assertOnQueue](db, "assertOnQueue");
  -[NSMutableDictionary removeObjectForKey:](self->_downloadedBlockToPerformForItemID, "removeObjectForKey:", v5);

  if (!-[NSMutableDictionary count](self->_downloadedBlockToPerformForItemID, "count"))
  {
    downloadedBlockToPerformForItemID = self->_downloadedBlockToPerformForItemID;
    self->_downloadedBlockToPerformForItemID = 0;

  }
}

- (id)popOnDiskBlockForItemID:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v10;
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
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v10 = 138412546;
    v11 = v4;
    v12 = 2112;
    v13 = v5;
    _os_log_impl(&dword_1CBD43000, v6, OS_LOG_TYPE_INFO, "[INFO] popOnDiskBlockForItemID [%@]%@", (uint8_t *)&v10, 0x16u);
  }

  if (v4)
  {
    -[BRCPQLConnection assertOnQueue](self->_db, "assertOnQueue");
    -[NSMutableDictionary objectForKeyedSubscript:](self->_onDiskBlockToPerformForItemID, "objectForKeyedSubscript:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCClientZone _removeOnDiskBlockToPerformForItemID:](self, "_removeOnDiskBlockToPerformForItemID:", v4);
    v8 = (void *)MEMORY[0x1D17A6DB0](v7);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)popDownloadedBlockForItemID:(id)a3
{
  BRCPQLConnection *db;
  id v5;
  void *v6;
  void *v7;

  if (a3)
  {
    db = self->_db;
    v5 = a3;
    -[BRCPQLConnection assertOnQueue](db, "assertOnQueue");
    -[NSMutableDictionary objectForKeyedSubscript:](self->_downloadedBlockToPerformForItemID, "objectForKeyedSubscript:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCClientZone _removeDownloadedBlockToPerformForItemID:](self, "_removeDownloadedBlockToPerformForItemID:", v5);

    v7 = (void *)MEMORY[0x1D17A6DB0](v6);
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (void)performBlock:(id)a3 whenItemWithRecordIDIsOnDisk:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  _QWORD v18[5];
  id v19;
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  __int128 v24;
  uint64_t v25;
  __int128 v26;
  uint64_t v27;
  __int128 v28;
  uint64_t v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "brc_itemIDWithSession:", self->_session);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0uLL;
  v27 = 0;
  __brc_create_section(0, (uint64_t)"-[BRCClientZone performBlock:whenItemWithRecordIDIsOnDisk:]", 4502, &v26);
  brc_bread_crumbs();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218498;
    v31 = (void *)v26;
    v32 = 2112;
    v33 = v8;
    v34 = 2112;
    v35 = v9;
    _os_log_debug_impl(&dword_1CBD43000, v10, OS_LOG_TYPE_DEBUG, "[DEBUG] ┣%llx waiting for item %@ to be on disk%@", buf, 0x20u);
  }

  v28 = v26;
  v29 = v27;
  if (v6 && v8)
  {
    v11 = MEMORY[0x1E0C809B0];
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __59__BRCClientZone_performBlock_whenItemWithRecordIDIsOnDisk___block_invoke;
    v22[3] = &unk_1E8762DB0;
    v24 = v28;
    v25 = v29;
    v23 = v6;
    v12 = (void *)MEMORY[0x1D17A6DB0](v22);
    -[BRCAccountSession clientDB](self->_session, "clientDB");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "serialQueue");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v11;
    v18[1] = 3221225472;
    v18[2] = __59__BRCClientZone_performBlock_whenItemWithRecordIDIsOnDisk___block_invoke_361;
    v18[3] = &unk_1E875FE38;
    v18[4] = self;
    v19 = v8;
    v6 = v12;
    v21 = v6;
    v20 = v7;
    dispatch_async_with_logs_7(v14, v18);

    v15 = v23;
  }
  else
  {
    brc_bread_crumbs();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = (void *)MEMORY[0x1D17A6DB0](v6);
      *(_DWORD *)buf = 138412802;
      v31 = v17;
      v32 = 2112;
      v33 = v8;
      v34 = 2112;
      v35 = v15;
      _os_log_impl(&dword_1CBD43000, v16, OS_LOG_TYPE_DEFAULT, "[WARNING] %@ and %@ must be non nil to register action%@", buf, 0x20u);

    }
  }

}

void __59__BRCClientZone_performBlock_whenItemWithRecordIDIsOnDisk___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  NSObject *v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;

  v7 = *(_OWORD *)(a1 + 40);
  v8 = *(_QWORD *)(a1 + 56);
  brc_bread_crumbs();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    __59__BRCClientZone_performBlock_whenItemWithRecordIDIsOnDisk___block_invoke_cold_1();

  (*(void (**)(_QWORD, uint64_t, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), a2, v6);
  __brc_leave_section((uint64_t *)&v7);
}

void __59__BRCClientZone_performBlock_whenItemWithRecordIDIsOnDisk___block_invoke_361(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  void (**v6)(_QWORD, _QWORD);
  void *v7;
  NSObject *v8;
  const char *v9;
  NSObject *v10;
  uint32_t v11;
  void *v12;
  BRCItemToPathLookup *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  void *v23;
  _QWORD v24[5];
  id v25;
  id v26;
  void (**v27)(_QWORD, _QWORD);
  _QWORD v28[4];
  id v29;
  uint64_t v30;
  id v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "itemByItemID:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x1E0C809B0];
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __59__BRCClientZone_performBlock_whenItemWithRecordIDIsOnDisk___block_invoke_2;
  v28[3] = &unk_1E8762DD8;
  v4 = *(id *)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 32);
  v29 = v4;
  v30 = v5;
  v31 = *(id *)(a1 + 56);
  v6 = (void (**)(_QWORD, _QWORD))MEMORY[0x1D17A6DB0](v28);
  if ((objc_msgSend(*(id *)(a1 + 32), "state") & 0x100) != 0)
  {
    brc_bread_crumbs();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v12 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 138412802;
      v33 = v12;
      v34 = 2112;
      v35 = v2;
      v36 = 2112;
      v37 = v7;
      v9 = "[WARNING] %@ is resetting. Not waiting on faulting of %@%@";
      v10 = v8;
      v11 = 32;
      goto LABEL_7;
    }
LABEL_8:

    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    goto LABEL_9;
  }
  if (objc_msgSend(v2, "isAlmostDead"))
  {
    brc_bread_crumbs();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v33 = v2;
      v34 = 2112;
      v35 = v7;
      v9 = "[WARNING] %@ is dead, not waiting on faulting.%@";
      v10 = v8;
      v11 = 22;
LABEL_7:
      _os_log_impl(&dword_1CBD43000, v10, OS_LOG_TYPE_DEFAULT, v9, buf, v11);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
  if (v2)
  {
    if ((objc_msgSend(v2, "isOnDisk") & 1) == 0)
    {
      ((void (**)(_QWORD, void *))v6)[2](v6, v2);
      goto LABEL_9;
    }
    if (!objc_msgSend(v2, "isLost"))
    {
      brc_bread_crumbs();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        __59__BRCClientZone_performBlock_whenItemWithRecordIDIsOnDisk___block_invoke_361_cold_3((uint64_t)v2);
      goto LABEL_8;
    }
    v13 = -[BRCItemToPathLookup initWithItem:]([BRCItemToPathLookup alloc], "initWithItem:", v2);
    -[BRCItemToPathLookup byFileSystemID](v13, "byFileSystemID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      brc_bread_crumbs();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        __59__BRCClientZone_performBlock_whenItemWithRecordIDIsOnDisk___block_invoke_361_cold_2((uint64_t)v2);
    }
    else
    {
      brc_bread_crumbs();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        __59__BRCClientZone_performBlock_whenItemWithRecordIDIsOnDisk___block_invoke_361_cold_1((uint64_t)v2);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    -[BRCItemToPathLookup closePaths](v13, "closePaths");

  }
  else
  {
    brc_bread_crumbs();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      v19 = *(void **)(a1 + 40);
      *(_DWORD *)buf = 138412546;
      v33 = v19;
      v34 = 2112;
      v35 = v17;
      _os_log_impl(&dword_1CBD43000, v18, OS_LOG_TYPE_INFO, "[INFO] Local item not found. Wait for the item [%@] to be on disk.%@", buf, 0x16u);
    }

    v20 = *(void **)(a1 + 32);
    v24[0] = v3;
    v24[1] = 3221225472;
    v24[2] = __59__BRCClientZone_performBlock_whenItemWithRecordIDIsOnDisk___block_invoke_363;
    v24[3] = &unk_1E8762E28;
    v21 = *(id *)(a1 + 56);
    v22 = *(_QWORD *)(a1 + 32);
    v23 = *(void **)(a1 + 40);
    v26 = v21;
    v24[4] = v22;
    v25 = v23;
    v27 = v6;
    objc_msgSend(v20, "performBlock:whenLocatingCompletesForItemWithRecordID:", v24, *(_QWORD *)(a1 + 48));

  }
LABEL_9:

}

void __59__BRCClientZone_performBlock_whenItemWithRecordIDIsOnDisk___block_invoke_2(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  int v11;
  id v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  brc_bread_crumbs();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v10 = v3;
    if (!v3)
      v10 = (id)a1[4];
    v11 = 138412546;
    v12 = v10;
    v13 = 2112;
    v14 = v4;
    _os_log_debug_impl(&dword_1CBD43000, v5, OS_LOG_TYPE_DEBUG, "[DEBUG] Waiting for %@ to be available%@", (uint8_t *)&v11, 0x16u);
  }

  if (!*(_QWORD *)(a1[5] + 352))
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = a1[5];
    v8 = *(void **)(v7 + 352);
    *(_QWORD *)(v7 + 352) = v6;

  }
  v9 = (void *)MEMORY[0x1D17A6DB0](a1[6]);
  objc_msgSend(*(id *)(a1[5] + 352), "setObject:forKeyedSubscript:", v9, a1[4]);

}

void __59__BRCClientZone_performBlock_whenItemWithRecordIDIsOnDisk___block_invoke_363(uint64_t a1, char a2)
{
  void *v3;
  void *v4;
  _QWORD v5[5];
  id v6;
  id v7;
  id v8;

  if ((a2 & 1) != 0)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "clientTruthWorkloop");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __59__BRCClientZone_performBlock_whenItemWithRecordIDIsOnDisk___block_invoke_2_364;
    v5[3] = &unk_1E8762E00;
    v4 = *(void **)(a1 + 40);
    v5[4] = *(_QWORD *)(a1 + 32);
    v6 = v4;
    v7 = *(id *)(a1 + 48);
    v8 = *(id *)(a1 + 56);
    dispatch_async_with_logs_7(v3, v5);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
}

void __59__BRCClientZone_performBlock_whenItemWithRecordIDIsOnDisk___block_invoke_2_364(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  int v5;
  void *v6;
  __int16 v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "itemByItemID:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isOnDisk"))
  {
    brc_bread_crumbs();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = 138412546;
      v6 = v2;
      v7 = 2112;
      v8 = v3;
      _os_log_impl(&dword_1CBD43000, v4, OS_LOG_TYPE_DEFAULT, "[WARNING] %@ is on disk after syncing down and refreshing%@", (uint8_t *)&v5, 0x16u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }

}

- (void)performBlock:(id)a3 whenItemWithIDIsDownloaded:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  _QWORD v17[5];
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  __int128 v22;
  uint64_t v23;
  __int128 v24;
  uint64_t v25;
  __int128 v26;
  uint64_t v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  id v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v24 = 0uLL;
  v25 = 0;
  __brc_create_section(0, (uint64_t)"-[BRCClientZone performBlock:whenItemWithIDIsDownloaded:]", 4582, &v24);
  brc_bread_crumbs();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218498;
    v29 = (void *)v24;
    v30 = 2112;
    v31 = v7;
    v32 = 2112;
    v33 = v8;
    _os_log_debug_impl(&dword_1CBD43000, v9, OS_LOG_TYPE_DEBUG, "[DEBUG] ┣%llx waiting for item %@ to be downloaded%@", buf, 0x20u);
  }

  v26 = v24;
  v27 = v25;
  if (v6 && v7)
  {
    v10 = MEMORY[0x1E0C809B0];
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __57__BRCClientZone_performBlock_whenItemWithIDIsDownloaded___block_invoke;
    v20[3] = &unk_1E8762E50;
    v22 = v26;
    v23 = v27;
    v21 = v6;
    v11 = (void *)MEMORY[0x1D17A6DB0](v20);
    -[BRCAccountSession clientDB](self->_session, "clientDB");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "serialQueue");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = v10;
    v17[1] = 3221225472;
    v17[2] = __57__BRCClientZone_performBlock_whenItemWithIDIsDownloaded___block_invoke_365;
    v17[3] = &unk_1E875EB70;
    v17[4] = self;
    v18 = v7;
    v6 = v11;
    v19 = v6;
    dispatch_async_with_logs_7(v13, v17);

    v14 = v21;
  }
  else
  {
    brc_bread_crumbs();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = (void *)MEMORY[0x1D17A6DB0](v6);
      *(_DWORD *)buf = 138412802;
      v29 = v16;
      v30 = 2112;
      v31 = v7;
      v32 = 2112;
      v33 = v14;
      _os_log_impl(&dword_1CBD43000, v15, OS_LOG_TYPE_DEFAULT, "[WARNING] %@ and %@ must be non nil to register action%@", buf, 0x20u);

    }
  }

}

void __57__BRCClientZone_performBlock_whenItemWithIDIsDownloaded___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;

  v3 = a2;
  v7 = *(_OWORD *)(a1 + 40);
  v8 = *(_QWORD *)(a1 + 56);
  brc_bread_crumbs();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    __57__BRCClientZone_performBlock_whenItemWithIDIsDownloaded___block_invoke_cold_1();

  (*(void (**)(_QWORD, id, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), v3, v6);
  __brc_leave_section((uint64_t *)&v7);

}

void __57__BRCClientZone_performBlock_whenItemWithIDIsDownloaded___block_invoke_365(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  void (*v6)(void);
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  _QWORD block[5];
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "itemByItemID:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "asDocument");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(*(id *)(a1 + 32), "state") & 0x100) != 0)
  {
    brc_bread_crumbs();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 138412802;
      v23 = v9;
      v24 = 2112;
      v25 = v3;
      v26 = 2112;
      v27 = v7;
      _os_log_impl(&dword_1CBD43000, v8, OS_LOG_TYPE_DEFAULT, "[WARNING] %@ is resetting. Not waiting on download of %@%@", buf, 0x20u);
    }
    goto LABEL_16;
  }
  if ((objc_msgSend(v3, "hasLocalContent") & 1) != 0)
  {
    brc_bread_crumbs();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      __57__BRCClientZone_performBlock_whenItemWithIDIsDownloaded___block_invoke_365_cold_1((uint64_t)v3);

    v6 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
    goto LABEL_17;
  }
  +[BRCSystemResourcesManager manager](BRCSystemResourcesManager, "manager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isNetworkReachable");

  if ((v11 & 1) == 0)
  {
    brc_bread_crumbs();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      __57__BRCClientZone_performBlock_whenItemWithIDIsDownloaded___block_invoke_365_cold_2((uint64_t)v3);
LABEL_16:

    v6 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
LABEL_17:
    v6();
    goto LABEL_18;
  }
  brc_bread_crumbs();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    v20 = v3;
    if (!v3)
      v20 = *(void **)(a1 + 40);
    *(_DWORD *)buf = 138412546;
    v23 = v20;
    v24 = 2112;
    v25 = v12;
    _os_log_debug_impl(&dword_1CBD43000, v13, OS_LOG_TYPE_DEBUG, "[DEBUG] Waiting for %@ to be downloaded%@", buf, 0x16u);
  }

  if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 360))
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = *(_QWORD *)(a1 + 32);
    v16 = *(void **)(v15 + 360);
    *(_QWORD *)(v15 + 360) = v14;

  }
  v17 = (void *)MEMORY[0x1D17A6DB0](*(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 360), "setObject:forKeyedSubscript:", v17, *(_QWORD *)(a1 + 40));

  if (!v3)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "clientDB");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "serialQueue");
    v19 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __57__BRCClientZone_performBlock_whenItemWithIDIsDownloaded___block_invoke_366;
    block[3] = &unk_1E875D500;
    block[4] = *(_QWORD *)(a1 + 32);
    dispatch_async(v19, block);

  }
LABEL_18:

}

uint64_t __57__BRCClientZone_performBlock_whenItemWithIDIsDownloaded___block_invoke_366(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "scheduleSyncDown");
}

- (void)_prepareForForegroundSyncDown
{
  void *v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (-[_BRCOperation usesBackgroundSession](self->_syncDownOperation, "usesBackgroundSession"))
  {
    brc_bread_crumbs();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 138412290;
      v8 = v3;
      _os_log_impl(&dword_1CBD43000, v4, OS_LOG_TYPE_DEFAULT, "[WARNING] Cancelling sync down operation that uses a background session%@", (uint8_t *)&v7, 0xCu);
    }

    -[_BRCOperation cancel](self->_syncDownOperation, "cancel");
  }
  if (self->_syncUpOperation)
  {
    brc_bread_crumbs();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 138412290;
      v8 = v5;
      _os_log_impl(&dword_1CBD43000, v6, OS_LOG_TYPE_DEFAULT, "[WARNING] Cancelling sync up operation because we need to sync down now%@", (uint8_t *)&v7, 0xCu);
    }

    -[_BRCOperation cancel](self->_syncUpOperation, "cancel");
  }
  -[BRCClientZone scheduleSyncDownFirst](self, "scheduleSyncDownFirst");
  -[BRCDeadlineSource signal](self->_syncDeadlineSource, "signal");
}

- (BOOL)_shouldFailSyncDownWaitImmediately
{
  void *v3;
  char v4;
  void *v6;
  NSObject *v7;
  int v8;
  BRCClientZone *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if ((-[BRCClientZone state](self, "state") & 0x100) != 0)
  {
    brc_bread_crumbs();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 138412546;
      v9 = self;
      v10 = 2112;
      v11 = v6;
      _os_log_impl(&dword_1CBD43000, v7, OS_LOG_TYPE_DEFAULT, "[WARNING] %@ is resetting. Not waiting on sync down%@", (uint8_t *)&v8, 0x16u);
    }
  }
  else
  {
    +[BRCSystemResourcesManager manager](BRCSystemResourcesManager, "manager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isNetworkReachable");

    if ((v4 & 1) != 0)
      return 0;
    brc_bread_crumbs();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      -[BRCClientZone _shouldFailSyncDownWaitImmediately].cold.1((uint64_t)self);
  }

  return 1;
}

- (void)performBlock:(id)a3 whenSyncDownCompletesLookingForItemID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  NSObject *v17;
  void *v18;
  _QWORD v19[5];
  id v20;
  id v21;
  id v22;
  _QWORD v23[5];
  id v24;
  id v25;
  __int128 v26;
  uint64_t v27;
  __int128 v28;
  uint64_t v29;
  __int128 v30;
  uint64_t v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  id v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v28 = 0uLL;
  v29 = 0;
  __brc_create_section(0, (uint64_t)"-[BRCClientZone performBlock:whenSyncDownCompletesLookingForItemID:]", 4655, &v28);
  brc_bread_crumbs();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218498;
    v33 = (void *)v28;
    v34 = 2112;
    v35 = v7;
    v36 = 2112;
    v37 = v8;
    _os_log_debug_impl(&dword_1CBD43000, v9, OS_LOG_TYPE_DEBUG, "[DEBUG] ┣%llx waiting sync down to complete for item %@%@", buf, 0x20u);
  }

  v30 = v28;
  v31 = v29;
  if (v6 && v7)
  {
    v10 = MEMORY[0x1E0C809B0];
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __68__BRCClientZone_performBlock_whenSyncDownCompletesLookingForItemID___block_invoke;
    v23[3] = &unk_1E8762EA0;
    v26 = v30;
    v27 = v31;
    v11 = v6;
    v25 = v11;
    v23[4] = self;
    v12 = v7;
    v24 = v12;
    v13 = (void *)MEMORY[0x1D17A6DB0](v23);
    -[BRCAccountSession clientTruthWorkloop](self->_session, "clientTruthWorkloop");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v10;
    v19[1] = 3221225472;
    v19[2] = __68__BRCClientZone_performBlock_whenSyncDownCompletesLookingForItemID___block_invoke_368;
    v19[3] = &unk_1E8762E00;
    v19[4] = self;
    v20 = v12;
    v21 = v13;
    v22 = v11;
    v15 = v13;
    dispatch_async_with_logs_7(v14, v19);

    v16 = v25;
  }
  else
  {
    brc_bread_crumbs();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v18 = (void *)MEMORY[0x1D17A6DB0](v6);
      *(_DWORD *)buf = 138412802;
      v33 = v18;
      v34 = 2112;
      v35 = v7;
      v36 = 2112;
      v37 = v16;
      _os_log_impl(&dword_1CBD43000, v17, OS_LOG_TYPE_DEFAULT, "[WARNING] %@ and %@ must be non nil to register action%@", buf, 0x20u);

    }
  }

}

void __68__BRCClientZone_performBlock_whenSyncDownCompletesLookingForItemID___block_invoke(uint64_t a1, int a2)
{
  void *v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[5];
  id v12;
  id v13;
  __int128 v14;
  uint64_t v15;
  __int128 v16;
  uint64_t v17;

  if (a2)
  {
    v16 = *(_OWORD *)(a1 + 56);
    v17 = *(_QWORD *)(a1 + 72);
    brc_bread_crumbs();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      __68__BRCClientZone_performBlock_whenSyncDownCompletesLookingForItemID___block_invoke_cold_1();

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    if (objc_msgSend(*(id *)(a1 + 32), "_shouldFailSyncDownWaitImmediately"))
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
      return;
    }
    v16 = *(_OWORD *)(a1 + 56);
    v17 = *(_QWORD *)(a1 + 72);
    brc_bread_crumbs();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      __68__BRCClientZone_performBlock_whenSyncDownCompletesLookingForItemID___block_invoke_cold_2();

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "clientTruthWorkloop");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __68__BRCClientZone_performBlock_whenSyncDownCompletesLookingForItemID___block_invoke_367;
    v11[3] = &unk_1E8762E78;
    v14 = *(_OWORD *)(a1 + 56);
    v15 = *(_QWORD *)(a1 + 72);
    v8 = *(id *)(a1 + 48);
    v9 = *(_QWORD *)(a1 + 32);
    v10 = *(void **)(a1 + 40);
    v13 = v8;
    v11[4] = v9;
    v12 = v10;
    dispatch_async_with_logs_7(v7, v11);

  }
  __brc_leave_section((uint64_t *)&v16);
}

void __68__BRCClientZone_performBlock_whenSyncDownCompletesLookingForItemID___block_invoke_367(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t);
  void *v12;
  id v13;
  __int128 v14;
  uint64_t v15;

  v9 = MEMORY[0x1E0C809B0];
  v10 = 3221225472;
  v11 = __68__BRCClientZone_performBlock_whenSyncDownCompletesLookingForItemID___block_invoke_2;
  v12 = &unk_1E8762DB0;
  v14 = *(_OWORD *)(a1 + 56);
  v15 = *(_QWORD *)(a1 + 72);
  v13 = *(id *)(a1 + 48);
  v2 = (void *)MEMORY[0x1D17A6DB0](&v9);
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 368);
  if (!v3)
  {
    v4 = objc_opt_new();
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 368);
    *(_QWORD *)(v5 + 368) = v4;

    v3 = *(void **)(*(_QWORD *)(a1 + 32) + 368);
  }
  objc_msgSend(v3, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40), v9, v10, v11, v12);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    v7 = (void *)objc_opt_new();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 368), "setObject:forKeyedSubscript:", v7, *(_QWORD *)(a1 + 40));
  }
  v8 = (void *)MEMORY[0x1D17A6DB0](v2);
  objc_msgSend(v7, "addObject:", v8);

  objc_msgSend(*(id *)(a1 + 32), "_prepareForForegroundSyncDown");
}

void __68__BRCClientZone_performBlock_whenSyncDownCompletesLookingForItemID___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v4;
  NSObject *v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;

  v7 = *(_OWORD *)(a1 + 40);
  v8 = *(_QWORD *)(a1 + 56);
  brc_bread_crumbs();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    __68__BRCClientZone_performBlock_whenSyncDownCompletesLookingForItemID___block_invoke_2_cold_1();

  (*(void (**)(_QWORD, uint64_t, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), a2, v6);
  __brc_leave_section((uint64_t *)&v7);
}

void __68__BRCClientZone_performBlock_whenSyncDownCompletesLookingForItemID___block_invoke_368(uint64_t a1)
{
  void *v2;
  void *v3;
  void (*v4)(void);
  void *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "serverItemByItemID:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2 && objc_msgSend(v2, "isLive"))
  {
    v4 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
LABEL_6:
    v4();
    goto LABEL_14;
  }
  if (objc_msgSend(*(id *)(a1 + 32), "_shouldFailSyncDownWaitImmediately"))
  {
    v4 = *(void (**)(void))(*(_QWORD *)(a1 + 56) + 16);
    goto LABEL_6;
  }
  brc_bread_crumbs();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v14 = *(_QWORD *)(a1 + 32);
    v13 = *(_QWORD *)(a1 + 40);
    v15 = 138412802;
    v16 = v13;
    v17 = 2112;
    v18 = v14;
    v19 = 2112;
    v20 = v5;
    _os_log_debug_impl(&dword_1CBD43000, v6, OS_LOG_TYPE_DEBUG, "[DEBUG] Waiting for sync down for %@ in %@%@", (uint8_t *)&v15, 0x20u);
  }

  v7 = *(void **)(*(_QWORD *)(a1 + 32) + 368);
  if (!v7)
  {
    v8 = objc_opt_new();
    v9 = *(_QWORD *)(a1 + 32);
    v10 = *(void **)(v9 + 368);
    *(_QWORD *)(v9 + 368) = v8;

    v7 = *(void **)(*(_QWORD *)(a1 + 32) + 368);
  }
  objc_msgSend(v7, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    v11 = (void *)objc_opt_new();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 368), "setObject:forKeyedSubscript:", v11, *(_QWORD *)(a1 + 40));
  }
  v12 = (void *)MEMORY[0x1D17A6DB0](*(_QWORD *)(a1 + 48));
  objc_msgSend(v11, "addObject:", v12);

  objc_msgSend(*(id *)(a1 + 32), "_prepareForForegroundSyncDown");
LABEL_14:

}

- (void)_enumerateAndClearLocateBlocksForRecordID:(id)a3 exists:(BOOL)a4
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_locateBlocksToPerformForRecordID, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary removeObjectForKey:](self->_locateBlocksToPerformForRecordID, "removeObjectForKey:", v5);
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v13;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v7);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v11) + 16))(*(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v11));
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }

}

- (void)performBlock:(id)a3 whenLocatingCompletesForItemWithRecordID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  NSObject *v18;
  void *v19;
  _QWORD v20[5];
  id v21;
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;
  BRCClientZone *v26;
  id v27;
  id v28;
  __int128 v29;
  uint64_t v30;
  __int128 v31;
  uint64_t v32;
  __int128 v33;
  uint64_t v34;
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  id v40;
  __int16 v41;
  void *v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "brc_itemIDWithSession:", self->_session);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = 0uLL;
  v32 = 0;
  __brc_create_section(0, (uint64_t)"-[BRCClientZone performBlock:whenLocatingCompletesForItemWithRecordID:]", 4798, &v31);
  brc_bread_crumbs();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218754;
    v36 = (void *)v31;
    v37 = 2112;
    v38 = v8;
    v39 = 2112;
    v40 = v7;
    v41 = 2112;
    v42 = v9;
    _os_log_debug_impl(&dword_1CBD43000, v10, OS_LOG_TYPE_DEBUG, "[DEBUG] ┣%llx waiting to locate item [%@] with record ID [%@]%@", buf, 0x2Au);
  }

  v33 = v31;
  v34 = v32;
  if (v7 && v6 && v8)
  {
    v11 = MEMORY[0x1E0C809B0];
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __71__BRCClientZone_performBlock_whenLocatingCompletesForItemWithRecordID___block_invoke;
    v24[3] = &unk_1E8762EF0;
    v29 = v33;
    v30 = v34;
    v12 = v8;
    v25 = v12;
    v13 = v6;
    v28 = v13;
    v26 = self;
    v27 = v7;
    v14 = (void *)MEMORY[0x1D17A6DB0](v24);
    -[BRCAccountSession clientTruthWorkloop](self->_session, "clientTruthWorkloop");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = v11;
    v20[1] = 3221225472;
    v20[2] = __71__BRCClientZone_performBlock_whenLocatingCompletesForItemWithRecordID___block_invoke_378;
    v20[3] = &unk_1E8762E00;
    v20[4] = self;
    v21 = v12;
    v22 = v14;
    v23 = v13;
    v16 = v14;
    dispatch_async_with_logs_7(v15, v20);

    v17 = v25;
  }
  else
  {
    brc_bread_crumbs();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v19 = (void *)MEMORY[0x1D17A6DB0](v6);
      *(_DWORD *)buf = 138413058;
      v36 = v19;
      v37 = 2112;
      v38 = v8;
      v39 = 2112;
      v40 = v7;
      v41 = 2112;
      v42 = v17;
      _os_log_impl(&dword_1CBD43000, v18, OS_LOG_TYPE_DEFAULT, "[WARNING] %@, %@ and %@ must be non nil to register action%@", buf, 0x2Au);

    }
  }

}

void __71__BRCClientZone_performBlock_whenLocatingCompletesForItemWithRecordID___block_invoke(uint64_t a1, int a2, int a3)
{
  void *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  uint64_t v27;
  void *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  _QWORD v35[4];
  id v36;
  uint64_t v37;
  _QWORD v38[4];
  id v39;
  id v40;
  __int128 v41;
  uint64_t v42;
  __int128 v43;
  uint64_t v44;
  uint8_t buf[4];
  void *v46;
  __int16 v47;
  void *v48;
  __int16 v49;
  void *v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  if (a2 && (a3 & 1) == 0)
  {
    v43 = *(_OWORD *)(a1 + 64);
    v44 = *(_QWORD *)(a1 + 80);
    brc_bread_crumbs();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(*(id *)(a1 + 32), "debugItemIDString");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218498;
      v46 = (void *)v43;
      v47 = 2112;
      v48 = v30;
      v49 = 2112;
      v50 = v4;
      _os_log_debug_impl(&dword_1CBD43000, v5, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx Item [%@] already located. Execute block directly.%@", buf, 0x20u);

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    __brc_leave_section((uint64_t *)&v43);
    return;
  }
  if (a2 && a3)
  {
    +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "maxSyncPathDepth");

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "clientDB");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "fetch:", CFSTR(" WITH RECURSIVE item_parents (item_parent_id, zone_rowid, height) AS(    SELECT item_parent_id, zone_rowid, 0 FROM server_items      WHERE item_id = %@ AND zone_rowid = %@  UNION ALL     SELECT si.item_parent_id, si.zone_rowid, p.height + 1 FROM server_items AS si  INNER JOIN item_parents AS p where (si.item_id = p.item_parent_id)  LIMIT %u) SELECT item_parent_id FROM item_parents ORDER BY height DESC"), *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(a1 + 40) + 32), v7);

    if ((objc_msgSend(v9, "next") & 1) != 0)
    {
      objc_msgSend(v9, "objectOfClass:atIndex:", objc_opt_class(), 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v10, "isNonDesktopRoot") & 1) != 0 || objc_msgSend(v10, "isDocumentsFolder"))
      {
        v43 = *(_OWORD *)(a1 + 64);
        v44 = *(_QWORD *)(a1 + 80);
        brc_bread_crumbs();
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(*(id *)(a1 + 32), "debugItemIDString");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 134218498;
          v46 = (void *)v43;
          v47 = 2112;
          v48 = v34;
          v49 = 2112;
          v50 = v11;
          _os_log_debug_impl(&dword_1CBD43000, v12, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx Item [%@] already located. Parent chain confirmed. Execute block directly.%@", buf, 0x20u);

        }
        (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
        __brc_leave_section((uint64_t *)&v43);

        return;
      }

    }
    else
    {
      brc_bread_crumbs();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
        __71__BRCClientZone_performBlock_whenLocatingCompletesForItemWithRecordID___block_invoke_cold_1();

    }
  }
  v43 = *(_OWORD *)(a1 + 64);
  v44 = *(_QWORD *)(a1 + 80);
  brc_bread_crumbs();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(*(id *)(a1 + 32), "debugItemIDString");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218498;
    v46 = (void *)v43;
    v47 = 2112;
    v48 = v31;
    v49 = 2112;
    v50 = v15;
    _os_log_debug_impl(&dword_1CBD43000, v16, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx Need to locate item [%@]%@", buf, 0x20u);

  }
  v17 = MEMORY[0x1E0C809B0];
  v38[0] = MEMORY[0x1E0C809B0];
  v38[1] = 3221225472;
  v38[2] = __71__BRCClientZone_performBlock_whenLocatingCompletesForItemWithRecordID___block_invoke_371;
  v38[3] = &unk_1E8762EC8;
  v41 = *(_OWORD *)(a1 + 64);
  v42 = *(_QWORD *)(a1 + 80);
  v39 = *(id *)(a1 + 32);
  v40 = *(id *)(a1 + 56);
  v18 = (void *)MEMORY[0x1D17A6DB0](v38);
  v19 = *(void **)(*(_QWORD *)(a1 + 40) + 376);
  if (!v19)
  {
    v20 = objc_opt_new();
    v21 = *(_QWORD *)(a1 + 40);
    v22 = *(void **)(v21 + 376);
    *(_QWORD *)(v21 + 376) = v20;

    v19 = *(void **)(*(_QWORD *)(a1 + 40) + 376);
  }
  objc_msgSend(v19, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 48));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v23)
  {
    v23 = (void *)objc_opt_new();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 376), "setObject:forKeyedSubscript:", v23, *(_QWORD *)(a1 + 48));
  }
  v24 = (void *)MEMORY[0x1D17A6DB0](v18);
  objc_msgSend(v23, "addObject:", v24);

  objc_msgSend(*(id *)(a1 + 40), "locateRecordIfNecessaryForRecordID:isUserWaiting:", *(_QWORD *)(a1 + 48), 1);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (v25)
  {
    v35[0] = v17;
    v35[1] = 3221225472;
    v35[2] = __71__BRCClientZone_performBlock_whenLocatingCompletesForItemWithRecordID___block_invoke_372;
    v35[3] = &unk_1E875E868;
    v26 = *(id *)(a1 + 48);
    v27 = *(_QWORD *)(a1 + 40);
    v36 = v26;
    v37 = v27;
    objc_msgSend(v25, "addLocateRecordCompletionBlock:", v35);

  }
  else
  {
    brc_bread_crumbs();
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, (os_log_type_t)0x90u))
    {
      objc_msgSend(*(id *)(a1 + 32), "debugItemIDString");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = *(void **)(a1 + 48);
      *(_DWORD *)buf = 138412802;
      v46 = v32;
      v47 = 2112;
      v48 = v33;
      v49 = 2112;
      v50 = v28;
      _os_log_error_impl(&dword_1CBD43000, v29, (os_log_type_t)0x90u, "[ERROR] Fail to create LocateRecordOperation for item [%@] with record ID [%@] --> Fail all waiting blocks.%@", buf, 0x20u);

    }
    objc_msgSend(*(id *)(a1 + 40), "_enumerateAndClearLocateBlocksForRecordID:exists:", *(_QWORD *)(a1 + 48), 0);
  }

  __brc_leave_section((uint64_t *)&v43);
}

uint64_t __71__BRCClientZone_performBlock_whenLocatingCompletesForItemWithRecordID___block_invoke_371(uint64_t a1, int a2)
{
  __int128 *v3;
  void *v4;
  NSObject *v5;
  void *v7;
  void *v8;
  __int128 v9;
  uint64_t v10;
  uint8_t buf[4];
  uint64_t v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = (__int128 *)(a1 + 48);
  if (a2)
  {
    v9 = *v3;
    v10 = *(_QWORD *)(a1 + 64);
    brc_bread_crumbs();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(*(id *)(a1 + 32), "debugItemIDString");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218498;
      v12 = v9;
      v13 = 2112;
      v14 = v7;
      v15 = 2112;
      v16 = v4;
      _os_log_debug_impl(&dword_1CBD43000, v5, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx Item [%@] located successfully%@", buf, 0x20u);

    }
  }
  else
  {
    v9 = *v3;
    v10 = *(_QWORD *)(a1 + 64);
    brc_bread_crumbs();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(*(id *)(a1 + 32), "debugItemIDString");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218498;
      v12 = v9;
      v13 = 2112;
      v14 = v8;
      v15 = 2112;
      v16 = v4;
      _os_log_debug_impl(&dword_1CBD43000, v5, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx Item [%@] was not located%@", buf, 0x20u);

    }
  }

  __brc_leave_section((uint64_t *)&v9);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __71__BRCClientZone_performBlock_whenLocatingCompletesForItemWithRecordID___block_invoke_372(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  const __CFString *v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  const __CFString *v13;
  __int16 v14;
  id v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  brc_bread_crumbs();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = CFSTR("fail");
    v9 = *(_QWORD *)(a1 + 32);
    v10 = 138413058;
    if ((_DWORD)a2)
      v8 = CFSTR("success");
    v11 = v9;
    v12 = 2112;
    v13 = v8;
    v14 = 2112;
    v15 = v5;
    v16 = 2112;
    v17 = v6;
    _os_log_impl(&dword_1CBD43000, v7, OS_LOG_TYPE_INFO, "[INFO] Locate record ID [%@]: %@ with error %@%@", (uint8_t *)&v10, 0x2Au);
  }

  objc_msgSend(*(id *)(a1 + 40), "_enumerateAndClearLocateBlocksForRecordID:exists:", *(_QWORD *)(a1 + 32), a2);
}

void __71__BRCClientZone_performBlock_whenLocatingCompletesForItemWithRecordID___block_invoke_378(uint64_t a1)
{
  void *v2;
  void *v3;
  void (*v4)(void);
  void *v5;
  char v6;
  void *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "serverItemByItemID:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2 && objc_msgSend(v2, "isLive"))
  {
    v4 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
LABEL_13:
    v4();
    goto LABEL_14;
  }
  if ((objc_msgSend(*(id *)(a1 + 32), "state") & 0x100) != 0)
  {
    brc_bread_crumbs();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = *(_QWORD *)(a1 + 32);
      objc_msgSend(*(id *)(a1 + 40), "debugItemIDString");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138412802;
      v14 = v11;
      v15 = 2112;
      v16 = v12;
      v17 = 2112;
      v18 = v9;
      _os_log_impl(&dword_1CBD43000, v10, OS_LOG_TYPE_DEFAULT, "[WARNING] %@ is resetting. Not waiting to locate item [%@]%@", (uint8_t *)&v13, 0x20u);

    }
    goto LABEL_12;
  }
  +[BRCSystemResourcesManager manager](BRCSystemResourcesManager, "manager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isNetworkReachable");

  if ((v6 & 1) != 0)
  {
LABEL_12:
    v4 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
    goto LABEL_13;
  }
  brc_bread_crumbs();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    __71__BRCClientZone_performBlock_whenLocatingCompletesForItemWithRecordID___block_invoke_378_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
LABEL_14:

}

- (BOOL)hasHighPriorityWatchers
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = -[NSMutableDictionary count](self->_syncDownBlockToPerformForItemID, "count");
  v4 = -[NSMutableDictionary count](self->_locateBlocksToPerformForRecordID, "count") + v3;
  v5 = -[NSMutableDictionary count](self->_syncDownBlockToPerformForBookmarkData, "count");
  v6 = v4 + v5 + -[NSMutableDictionary count](self->_downloadedBlockToPerformForItemID, "count");
  return v6 + -[NSMutableDictionary count](self->_onDiskBlockToPerformForItemID, "count") != 0;
}

- (BOOL)removeItemOnDiskBlock:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  -[BRCAccountSession clientDB](self->_session, "clientDB");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "serialQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__BRCClientZone_removeItemOnDiskBlock___block_invoke;
  block[3] = &unk_1E875D528;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v7 = v4;
  dispatch_sync(v6, block);

  LOBYTE(v4) = *((_BYTE *)v13 + 24);
  _Block_object_dispose(&v12, 8);
  return (char)v4;
}

void __39__BRCClientZone_removeItemOnDiskBlock___block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "popOnDiskBlockForItemID:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v2 != 0;

}

- (BOOL)removeItemIsDownloadedBlock:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  -[BRCAccountSession clientDB](self->_session, "clientDB");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "serialQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__BRCClientZone_removeItemIsDownloadedBlock___block_invoke;
  block[3] = &unk_1E875D528;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v7 = v4;
  dispatch_sync(v6, block);

  LOBYTE(v4) = *((_BYTE *)v13 + 24);
  _Block_object_dispose(&v12, 8);
  return (char)v4;
}

void __45__BRCClientZone_removeItemIsDownloadedBlock___block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "popDownloadedBlockForItemID:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v2 != 0;

}

- (BOOL)removeSyncDownForItemIDBlock:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  -[BRCAccountSession clientDB](self->_session, "clientDB");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "serialQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__BRCClientZone_removeSyncDownForItemIDBlock___block_invoke;
  block[3] = &unk_1E875D528;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v7 = v4;
  dispatch_sync(v6, block);

  LOBYTE(v4) = *((_BYTE *)v13 + 24);
  _Block_object_dispose(&v12, 8);
  return (char)v4;
}

uint64_t __46__BRCClientZone_removeSyncDownForItemIDBlock___block_invoke(_QWORD *a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1[4] + 368), "objectForKeyedSubscript:", a1[5]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = v2 != 0;

  return objc_msgSend(*(id *)(a1[4] + 368), "removeObjectForKey:", a1[5]);
}

- (id)syncDownAnalyticsError
{
  void *v3;
  double v4;
  double v5;
  char v6;
  double v7;
  NSError *lastSyncDownError;
  void *v9;
  _BOOL8 v10;
  BRCErrorGrouping *v11;
  uint64_t v13;

  +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", self->_mangledID);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "syncDownDelayForFailure");
  v5 = v4;

  v6 = atomic_load(&self->_syncState);
  if ((v6 & 2) != 0
    && self->_lastSyncDownError
    && (-[BRCSyncOperationThrottle delay](self->_syncDownThrottle, "delay"), v7 > v5)
    && (lastSyncDownError = self->_lastSyncDownError,
        v13 = 0,
        -[NSError brc_telemetryReportableErrorWithRecordName:](lastSyncDownError, "brc_telemetryReportableErrorWithRecordName:", &v13), v9 = (void *)objc_claimAutoreleasedReturnValue(), v10 = -[BRCClientZone enhancedDrivePrivacyEnabled](self, "enhancedDrivePrivacyEnabled"), v9))
  {
    v11 = -[BRCErrorGrouping initWithError:pcsChained:enhancedDrivePrivacyEnabled:]([BRCErrorGrouping alloc], "initWithError:pcsChained:enhancedDrivePrivacyEnabled:", v9, 0, v10);

  }
  else
  {
    v11 = 0;
  }
  return v11;
}

- (id)syncUpAnalyticsError
{
  void *v3;
  double v4;
  double v5;
  char v6;
  double v7;
  NSError *lastSyncUpError;
  void *v9;
  _BOOL4 lastSyncUpErrorWasOnChainedItem;
  _BOOL8 v11;
  BRCErrorGrouping *v12;
  uint64_t v14;

  +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", self->_mangledID);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "syncUpDelayForFailure");
  v5 = v4;

  v6 = atomic_load(&self->_syncState);
  if ((v6 & 1) != 0
    && self->_lastSyncUpError
    && (-[BRCSyncOperationThrottle delay](self->_syncUpThrottle, "delay"), v7 > v5)
    && (lastSyncUpError = self->_lastSyncUpError,
        v14 = 0,
        -[NSError brc_telemetryReportableErrorWithRecordName:](lastSyncUpError, "brc_telemetryReportableErrorWithRecordName:", &v14), v9 = (void *)objc_claimAutoreleasedReturnValue(), lastSyncUpErrorWasOnChainedItem = self->_lastSyncUpErrorWasOnChainedItem, v11 = -[BRCClientZone enhancedDrivePrivacyEnabled](self, "enhancedDrivePrivacyEnabled"), v9))
  {
    v12 = -[BRCErrorGrouping initWithError:pcsChained:enhancedDrivePrivacyEnabled:]([BRCErrorGrouping alloc], "initWithError:pcsChained:enhancedDrivePrivacyEnabled:", v9, lastSyncUpErrorWasOnChainedItem, v11);

  }
  else
  {
    v12 = 0;
  }
  return v12;
}

- (void)networkReachabilityChanged:(BOOL)a3
{
  void *v4;
  _QWORD v5[5];

  if (!a3)
  {
    if (-[BRCClientZone hasHighPriorityWatchers](self, "hasHighPriorityWatchers"))
    {
      -[BRCPQLConnection serialQueue](self->_db, "serialQueue");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5[0] = MEMORY[0x1E0C809B0];
      v5[1] = 3221225472;
      v5[2] = __44__BRCClientZone_networkReachabilityChanged___block_invoke;
      v5[3] = &unk_1E875D500;
      v5[4] = self;
      dispatch_async_with_logs_7(v4, v5);

    }
  }
}

void __44__BRCClientZone_networkReachabilityChanged___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4[3];

  memset(v4, 0, sizeof(v4));
  __brc_create_section(0, (uint64_t)"-[BRCClientZone networkReachabilityChanged:]_block_invoke", 5009, v4);
  brc_bread_crumbs();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    __44__BRCClientZone_networkReachabilityChanged___block_invoke_cold_1();

  objc_msgSend(*(id *)(a1 + 32), "_removeAllShareAcceptanceBlocks");
  __brc_leave_section(v4);
}

- (int64_t)throttleHashWithItemID:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = a3;
  -[BRCClientZone mangledID](self, "mangledID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash");
  v7 = objc_msgSend(v4, "hash");

  return v7 ^ v6;
}

- (void)_appendToString:(id)a3 descriptionOfFieldNamed:(id)a4 inResultSet:(id)a5 pos:(int *)a6 containsSize:(BOOL)a7 context:(id)a8
{
  _BOOL4 v9;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;

  v9 = a7;
  v23 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a8;
  if (v9)
  {
    ++*a6;
    v16 = objc_msgSend(v14, "unsignedLongLongAtIndex:");
    ++*a6;
    v17 = objc_msgSend(v14, "unsignedLongLongAtIndex:");
  }
  else
  {
    v17 = 0;
    v16 = 0;
  }
  ++*a6;
  v18 = objc_msgSend(v14, "unsignedLongLongAtIndex:");
  ++*a6;
  v19 = objc_msgSend(v14, "unsignedLongLongAtIndex:");
  v20 = v19;
  if (v16 || v17 || v18 || v19)
  {
    if (v9)
    {
      +[BRCDumpContext stringFromByteCount:context:](BRCDumpContext, "stringFromByteCount:context:", v17, v15);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      +[BRCDumpContext stringFromByteCount:context:](BRCDumpContext, "stringFromByteCount:context:", v16, v15);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "appendFormat:", CFSTR("%@{needs:(count:%lld, size:%@) done:(count:%lld, size:%@)} "), v13, v20, v21, v18, v22);

    }
    else
    {
      objc_msgSend(v23, "appendFormat:", CFSTR("%@{needs:%lld done:%lld} "), v13, v19, v18);
    }
  }

}

- (void)_dumpRecursivePropertiesOfItemByRowID:(unint64_t)a3 context:(id)a4 depth:(int)a5
{
  uint64_t v5;
  id v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  int v21;

  v5 = *(_QWORD *)&a5;
  v8 = a4;
  objc_msgSend(v8, "db");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "fetch:", CFSTR("SELECT dir_faults_count, faults_count,needs_faulting_count, uploaded_size,needs_upload_size, uploaded_count,needs_upload_count, downloaded_size,needs_download_size, downloaded_count,needs_download_count, dl_unstaged_count,needs_dl_unstage_count, synced_up_count,needs_sync_up_count, over_quota_count, shared_by_me_count, shared_to_me_count, needs_delete_doc_count FROM item_recursive_properties  WHERE item_rowid = %llu"), a3);

  if (objc_msgSend(v10, "next"))
  {
    v11 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
    v12 = objc_msgSend(v10, "unsignedLongLongAtIndex:", 0);
    if (v12)
      objc_msgSend(v11, "appendFormat:", CFSTR("dir-faults:%lld "), v12);
    v13 = objc_msgSend(v10, "unsignedLongLongAtIndex:", 1);
    if (v13)
      objc_msgSend(v11, "appendFormat:", CFSTR("faults:%lld "), v13);
    v21 = 3;
    v14 = objc_msgSend(v10, "unsignedLongLongAtIndex:", 2);
    if (v14)
      objc_msgSend(v11, "appendFormat:", CFSTR("needs-faulting:%lld "), v14);
    -[BRCClientZone _appendToString:descriptionOfFieldNamed:inResultSet:pos:containsSize:context:](self, "_appendToString:descriptionOfFieldNamed:inResultSet:pos:containsSize:context:", v11, CFSTR("upload"), v10, &v21, 1, v8);
    -[BRCClientZone _appendToString:descriptionOfFieldNamed:inResultSet:pos:containsSize:context:](self, "_appendToString:descriptionOfFieldNamed:inResultSet:pos:containsSize:context:", v11, CFSTR("download"), v10, &v21, 1, v8);
    -[BRCClientZone _appendToString:descriptionOfFieldNamed:inResultSet:pos:containsSize:context:](self, "_appendToString:descriptionOfFieldNamed:inResultSet:pos:containsSize:context:", v11, CFSTR("unstage"), v10, &v21, 0, v8);
    -[BRCClientZone _appendToString:descriptionOfFieldNamed:inResultSet:pos:containsSize:context:](self, "_appendToString:descriptionOfFieldNamed:inResultSet:pos:containsSize:context:", v11, CFSTR("sync-up"), v10, &v21, 0, v8);
    ++v21;
    v15 = objc_msgSend(v10, "unsignedLongLongAtIndex:");
    if (v15)
      objc_msgSend(v11, "appendFormat:", CFSTR("quota:%lld "), v15);
    ++v21;
    v16 = objc_msgSend(v10, "unsignedLongLongAtIndex:");
    if (v16)
      objc_msgSend(v11, "appendFormat:", CFSTR("sbmc:%lld "), v16);
    ++v21;
    v17 = objc_msgSend(v10, "unsignedLongLongAtIndex:");
    if (v17)
      objc_msgSend(v11, "appendFormat:", CFSTR("stmc:%lld "), v17);
    ++v21;
    v18 = objc_msgSend(v10, "unsignedLongLongAtIndex:");
    if (v18)
      objc_msgSend(v11, "appendFormat:", CFSTR("nd:%lld "), v18);
    if (v21 != 19)
    {
      brc_bread_crumbs();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
        -[BRCClientZone _dumpRecursivePropertiesOfItemByRowID:context:depth:].cold.1();

    }
    if (objc_msgSend(v11, "length"))
      objc_msgSend(v8, "writeLineWithFormat:", CFSTR("%*s> %@"), v5, ", v11);

  }
}

- (BOOL)_dumpItemsToContext:(id)a3 includeAllItems:(BOOL)a4 error:(id *)a5
{
  id v8;
  id v9;
  BRCAccountSession *v10;
  id v11;
  void *v12;
  void *v13;
  unint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  uint64_t i;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  unint64_t v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t j;
  void *v36;
  void *v37;
  BOOL v38;
  BRCAccountSession *v40;
  id v41;
  BRCClientZone *v42;
  id obj;
  _QWORD v44[5];
  id v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _QWORD v54[4];
  id v55;
  id v56;
  BRCClientZone *v57;
  BRCAccountSession *v58;
  uint64_t *v59;
  uint64_t *v60;
  BOOL v61;
  uint64_t v62;
  uint64_t *v63;
  uint64_t v64;
  int v65;
  uint64_t v66;
  uint64_t *v67;
  uint64_t v68;
  uint64_t v69;
  _BYTE v70[128];
  _BYTE v71[128];
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = objc_alloc_init(MEMORY[0x1E0CB3788]);
  v10 = self->_session;
  v66 = 0;
  v67 = &v66;
  v68 = 0x2050000000;
  v69 = 0;
  v62 = 0;
  v63 = &v62;
  v64 = 0x2020000000;
  v65 = 0;
  v54[0] = MEMORY[0x1E0C809B0];
  v54[1] = 3221225472;
  v54[2] = __59__BRCClientZone__dumpItemsToContext_includeAllItems_error___block_invoke;
  v54[3] = &unk_1E8762F18;
  v11 = v8;
  v55 = v11;
  v59 = &v62;
  v61 = a4;
  v41 = v9;
  v56 = v41;
  v57 = self;
  v40 = v10;
  v58 = v40;
  v60 = &v66;
  v67[3] = (uint64_t)v54;
  v42 = self;
  if (-[BRCClientZone isPrivateZone](self, "isPrivateZone"))
  {
    -[BRCClientZone asPrivateClientZone](self, "asPrivateClientZone");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "appLibraries");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "count");

    v52 = 0u;
    v53 = 0u;
    v50 = 0u;
    v51 = 0u;
    -[BRCClientZone asPrivateClientZone](v42, "asPrivateClientZone");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "appLibraries");
    obj = (id)objc_claimAutoreleasedReturnValue();

    v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, v71, 16);
    if (v16)
    {
      v17 = *(_QWORD *)v51;
      v18 = 1;
      while (2)
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v51 != v17)
            objc_enumerationMutation(obj);
          v20 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * i);
          if (v14 >= 2)
          {
            if ((v18 & 1) == 0)
              objc_msgSend(v11, "writeLineWithFormat:", &stru_1E8769030);
            objc_msgSend(v20, "logName");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "dbRowID");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "writeLineWithFormat:", CFSTR("----------------------%@[%@]----------------------"), v21, v22);

            v18 = 0;
          }
          objc_msgSend(v20, "fetchRootItem");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "descriptionWithContext:", v11);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "writeLineWithFormat:", CFSTR("%@"), v24);

          *((_DWORD *)v63 + 6) = 0;
          v25 = v67[3];
          objc_msgSend(v23, "itemGlobalID");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          (*(void (**)(uint64_t, void *, _QWORD, id *))(v25 + 16))(v25, v26, 0, a5);

          LOBYTE(v25) = objc_msgSend(v11, "isCancelled");
          if ((v25 & 1) != 0)
          {
            v38 = 0;
            goto LABEL_31;
          }
        }
        v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, v71, 16);
        if (v16)
          continue;
        break;
      }
    }

  }
  objc_msgSend(v11, "writeLineWithFormat:", &stru_1E8769030);
  objc_msgSend(v11, "db");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  obj = (id)objc_msgSend(v27, "numberWithSQL:", CFSTR("SELECT COUNT(*) FROM client_items WHERE zone_rowid = %@"), v42->_dbRowID);

  v28 = objc_msgSend(obj, "unsignedIntegerValue");
  if (v28 > objc_msgSend(v41, "count"))
  {
    if (!-[BRCClientZone isSharedZone](v42, "isSharedZone"))
      objc_msgSend(v11, "writeLineWithFormat:", CFSTR("ORPHANED ITEMS:"));
    objc_msgSend(v11, "db");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = (void *)objc_msgSend(v29, "fetch:", CFSTR("SELECT rowid, zone_rowid, item_id, item_creator_id, item_sharing_options, item_side_car_ckinfo, item_parent_zone_rowid, item_localsyncupstate, item_local_diffs, item_notifs_rank, app_library_rowid, item_min_supported_os_rowid, item_user_visible, item_stat_ckinfo, item_state, item_type, item_mode, item_birthtime, item_lastusedtime, item_favoriterank,item_parent_id, item_filename, item_hidden_ext, item_finder_tags, item_xattr_signature, item_trash_put_back_path, item_trash_put_back_parent_id, item_alias_target, item_creator, item_doc_id, item_file_id, item_generation, item_localname, item_processing_stamp, item_staged_file_id, item_staged_generation, item_bouncedname, item_scope, item_tmpbounceno, version_name, version_ckinfo, version_mtime, version_size, version_thumb_size, version_thumb_signature, version_content_signature, version_xattr_signature, version_edited_since_shared, version_device, version_conflict_loser_etags, version_quarantine_info, version_uploaded_assets, version_upload_error, version_old_zone_item_id, version_old_zone_rowid, desired_version, item_live_conflict_loser_etags, item_thumb_live_signature, item_thumb_greedy, version_block_sync_until_bundle_id, version_block_sync_until_timestamp FROM client_items WHERE zone_rowid = %@ AND NOT indexset_contains(%p, rowid)"), v42->_dbRowID, v41);
    *((_DWORD *)v63 + 6) = 0;
    v46 = 0u;
    v47 = 0u;
    v48 = 0u;
    v49 = 0u;
    v44[0] = MEMORY[0x1E0C809B0];
    v44[1] = 3221225472;
    v44[2] = __59__BRCClientZone__dumpItemsToContext_includeAllItems_error___block_invoke_2;
    v44[3] = &unk_1E875E310;
    v44[4] = v42;
    v31 = v29;
    v45 = v31;
    objc_msgSend(v30, "enumerateObjects:", v44);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v46, v70, 16);
    if (v33)
    {
      v34 = *(_QWORD *)v47;
      while (2)
      {
        for (j = 0; j != v33; ++j)
        {
          if (*(_QWORD *)v47 != v34)
            objc_enumerationMutation(v32);
          v36 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * j);
          ++*((_DWORD *)v63 + 6);
          if ((objc_msgSend(v11, "shouldKeepDumpingWithItemCount:includeAllItems:") & 1) == 0)
          {

            v38 = 0;
            goto LABEL_30;
          }
          objc_msgSend(v36, "descriptionWithContext:", v11);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "writeLineWithFormat:", CFSTR("%@"), v37);

        }
        v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v46, v70, 16);
        if (v33)
          continue;
        break;
      }
    }

    objc_msgSend(v11, "writeLineWithFormat:", &stru_1E8769030);
    v38 = 1;
LABEL_30:

  }
  else
  {
    v38 = 1;
  }
LABEL_31:

  _Block_object_dispose(&v62, 8);
  _Block_object_dispose(&v66, 8);

  return v38;
}

uint64_t __59__BRCClientZone__dumpItemsToContext_includeAllItems_error___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  __CFString *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  int v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  id v47;
  uint64_t v48;
  unsigned int v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;

  v7 = a2;
  objc_msgSend(*(id *)(a1 + 32), "db");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "itemID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "zoneRowID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v8, "fetch:", CFSTR("SELECT ci.rowid, ci.zone_rowid, ci.item_id, ci.item_creator_id, ci.item_sharing_options, ci.item_side_car_ckinfo, ci.item_parent_zone_rowid, ci.item_localsyncupstate, ci.item_local_diffs, ci.item_notifs_rank, ci.app_library_rowid, ci.item_min_supported_os_rowid, ci.item_user_visible, ci.item_stat_ckinfo, ci.item_state, ci.item_type, ci.item_mode, ci.item_birthtime, ci.item_lastusedtime, ci.item_favoriterank,ci.item_parent_id, ci.item_filename, ci.item_hidden_ext, ci.item_finder_tags, ci.item_xattr_signature, ci.item_trash_put_back_path, ci.item_trash_put_back_parent_id, ci.item_alias_target, ci.item_creator, ci.item_doc_id, ci.item_file_id, ci.item_generation, ci.item_localname, ci.item_processing_stamp, ci.item_staged_file_id, ci.item_staged_generation, ci.item_bouncedname, ci.item_scope, ci.item_tmpbounceno, ci.version_name, ci.version_ckinfo, ci.version_mtime, ci.version_size, ci.version_thumb_size, ci.version_thumb_signature, ci.version_content_signature, ci.version_xattr_signature, ci.version_edited_since_shared, ci.version_device, ci.version_conflict_loser_etags, ci.version_quarantine_info, ci.version_uploaded_assets, ci.version_upload_error, ci.version_old_zone_item_id, ci.version_old_zone_rowid, ci.desired_version, ci.item_live_conflict_loser_etags, ci.item_thumb_live_signature, ci.item_thumb_greedy, ci.version_block_sync_until_bundle_id, ci.version_block_sync_until_timestamp     FROM client_items AS ci     LEFT JOIN item_recursive_properties AS rp      ON ci.rowid = rp.item_rowid    WHERE ci.item_parent_id = %@ AND ci.item_parent_zone_rowid = %@ ORDER BY (rp.needs_sync_up_count + rp.needs_upload_count + rp.needs_delete_doc_count + rp.needs_download_count + rp.needs_faulting_count) DESC"), v9, v10);

  if (objc_msgSend(v11, "next"))
  {
    v49 = a3 + 1;
    v52 = a3;
    v47 = v7;
    v48 = a3;
    v12 = a3;
    v54 = a3;
    v50 = a4;
    while (1)
    {
      v13 = (void *)MEMORY[0x1D17A6BE8]();
      v14 = *(void **)(a1 + 32);
      ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
      if (!objc_msgSend(v14, "shouldKeepDumpingWithItemCount:includeAllItems:"))
        break;
      v15 = objc_msgSend(v11, "integerAtIndex:", 0);
      if (objc_msgSend(*(id *)(a1 + 40), "containsIndex:", v15))
      {
        v16 = *(void **)(a1 + 32);
        objc_msgSend(v11, "objectOfClass:atIndex:", objc_opt_class(), 2);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        +[BRCDumpContext stringFromItemID:context:](BRCDumpContext, "stringFromItemID:context:", v17, *(_QWORD *)(a1 + 32));
        v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "writeLineWithFormat:", CFSTR("%*sERROR: item ID %@ seen twice"), v12, ", v18);
      }
      else
      {
        objc_msgSend(*(id *)(a1 + 40), "addIndex:", v15);
        objc_msgSend(*(id *)(a1 + 48), "session");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "db");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = (void *)objc_msgSend(v19, "newLocalItemFromPQLResultSet:db:error:", v11, v20, a4);

        if (!v17)
          goto LABEL_38;
        objc_msgSend(v17, "clientZone");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = *(void **)(a1 + 48);

        if (v21 == v22)
        {
          v18 = &stru_1E8769030;
        }
        else
        {
          v23 = objc_alloc(MEMORY[0x1E0CB3940]);
          objc_msgSend(v17, "clientZone");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "mangledID");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = (__CFString *)objc_msgSend(v23, "initWithFormat:", CFSTR("zone:%@ "), v25);

          v12 = v54;
        }
        v26 = *(void **)(a1 + 32);
        objc_msgSend(v17, "descriptionWithContext:", v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "writeLineWithFormat:", CFSTR("%*s%@%@"), v52, ", v18, v27);

        objc_msgSend(*(id *)(a1 + 48), "_dumpRecursivePropertiesOfItemByRowID:context:depth:", v15, *(_QWORD *)(a1 + 32), v12);
        if (objc_msgSend(*(id *)(a1 + 32), "liveDaemon"))
        {
          objc_msgSend(*(id *)(a1 + 56), "diskReclaimer");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "descriptionForItem:context:", v17, *(_QWORD *)(a1 + 32));
          v53 = objc_claimAutoreleasedReturnValue();

          objc_msgSend(*(id *)(a1 + 56), "fsReader");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "descriptionForItem:context:", v17, *(_QWORD *)(a1 + 32));
          v30 = objc_claimAutoreleasedReturnValue();

          v31 = (void *)v30;
          objc_msgSend(*(id *)(a1 + 56), "fsUploader");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "descriptionForItem:context:", v17, *(_QWORD *)(a1 + 32));
          v55 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(*(id *)(a1 + 56), "applyScheduler");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "descriptionForRejectedItem:context:", v17, *(_QWORD *)(a1 + 32));
          v34 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(*(id *)(a1 + 56), "fsDownloader");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "descriptionForItem:context:", v17, *(_QWORD *)(a1 + 32));
          v36 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(*(id *)(a1 + 56), "syncUpScheduler");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "descriptionForItem:context:", v17, *(_QWORD *)(a1 + 32));
          v38 = (void *)objc_claimAutoreleasedReturnValue();

          v39 = (void *)v53;
          if (v53 || v31 || v55 || v34 || v36 || v38)
          {
            v51 = v31;
            v40 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
            v41 = v40;
            if (v53)
              objc_msgSend(v40, "appendFormat:", CFSTR(" reclaimer{%@}"), v53);
            if (v51)
              objc_msgSend(v41, "appendFormat:", CFSTR(" reader{%@}"), v51);
            if (v55)
              objc_msgSend(v41, "appendFormat:", CFSTR(" upload{%@}"), v55);
            if (v34)
              objc_msgSend(v41, "appendFormat:", CFSTR(" rejected{%@}"), v34);
            if (v36)
              objc_msgSend(v41, "appendFormat:", CFSTR(" downloader{%@}"), v36);
            if (v38)
              objc_msgSend(v41, "appendFormat:", CFSTR(" sync-up{%@}"), v38);
            objc_msgSend(*(id *)(a1 + 32), "writeLineWithFormat:", CFSTR("%*s>%@"), v48, ", v41);

            v39 = (void *)v53;
            v31 = v51;
          }

          a4 = v50;
          v12 = v54;
        }
        v42 = objc_msgSend(v17, "isDirectory");
        if ((int)v12 <= 99)
        {
          if (v42)
          {
            v43 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
            objc_msgSend(v17, "itemGlobalID");
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            LOBYTE(v43) = (*(uint64_t (**)(uint64_t, void *, _QWORD, uint64_t))(v43 + 16))(v43, v44, v49, a4);

            if ((v43 & 1) == 0)
            {

LABEL_38:
              break;
            }
          }
        }
      }

      objc_autoreleasePoolPop(v13);
      if ((objc_msgSend(v11, "next") & 1) == 0)
      {
        v45 = 1;
        goto LABEL_40;
      }
    }
    objc_autoreleasePoolPop(v13);
    v45 = 0;
LABEL_40:
    v7 = v47;
  }
  else
  {
    v45 = 1;
  }

  return v45;
}

id __59__BRCClientZone__dumpItemsToContext_includeAllItems_error___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;

  v5 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(v5, "session");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "newLocalItemFromPQLResultSet:db:error:", v6, *(_QWORD *)(a1 + 40), a3);

  return v8;
}

- (BOOL)dumpActivityToContext:(id)a3 includeExpensiveActivity:(BOOL)a4 error:(id *)a5
{
  _BOOL4 v5;
  id v7;
  id v8;
  void *v9;
  void *v10;
  int v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t k;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t m;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  id v54;
  void *v55;
  id v56;
  void *v57;
  id v58;
  void *v59;
  id v60;
  unsigned int v61;
  const __CFString *v62;
  char v63;
  double v64;
  double v65;
  double v66;
  double v67;
  const __CFString *v68;
  __CFString *v69;
  uint64_t v70;
  __CFString *v71;
  uint64_t v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  NSError *lastSyncUpError;
  void *v79;
  NSError *lastSyncDownError;
  void *v81;
  void *syncUpOperation;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  double v89;
  double v90;
  double v91;
  void *v92;
  double v93;
  double v94;
  double v95;
  double v96;
  id v97;
  double v98;
  char v99;
  _BOOL4 v100;
  BRCClientZone *v101;
  void *v102;
  id obj;
  id obja;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  _QWORD v109[4];
  id v110;
  _QWORD v111[4];
  id v112;
  _QWORD v113[4];
  id v114;
  _QWORD v115[4];
  id v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  _BYTE v133[128];
  _BYTE v134[128];
  _BYTE v135[128];
  _BYTE v136[128];
  uint64_t v137;

  v5 = a4;
  v137 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if (!self->_activated)
    goto LABEL_93;
  v8 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v99 = -[BRCClientZone syncState](self, "syncState");
  brc_current_date_nsec();
  +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", self->_mangledID);
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[BRCClientZone isPrivateZone](self, "isPrivateZone"))
  {
    -[BRCClientZone asPrivateClientZone](self, "asPrivateClientZone");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "defaultAppLibrary");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isGreedy");
    v12 = CFSTR("(greedy)");
    if (!v11)
      v12 = &stru_1E8769030;
    objc_msgSend(v7, "writeLineWithFormat:", CFSTR("pending activity %@"), v12);

  }
  else
  {
    objc_msgSend(v7, "writeLineWithFormat:", CFSTR("pending activity %@"), &stru_1E8769030);
  }
  objc_msgSend(v7, "writeLineWithFormat:", CFSTR("================"));
  if (v5)
  {
    -[BRCAccountSession fsDownloader](self->_session, "fsDownloader");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "aggregateDescriptionForJobsMatching:context:", self->_serverZone, v7);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "writeLineWithFormat:", CFSTR("+ downloads:%@"), v14);

  }
  else
  {
    objc_msgSend(v7, "writeLineWithFormat:", CFSTR("+ downloads: not dumping"));
  }
  objc_msgSend(v7, "pushIndentation");
  v101 = self;
  v100 = v5;
  if (-[BRCClientZone isPrivateZone](self, "isPrivateZone"))
  {
    v131 = 0u;
    v132 = 0u;
    v129 = 0u;
    v130 = 0u;
    -[BRCClientZone asPrivateClientZone](self, "asPrivateClientZone");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "appLibraries");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    obj = v16;
    v107 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v129, v136, 16);
    if (v107)
    {
      v105 = *(_QWORD *)v130;
      do
      {
        for (i = 0; i != v107; ++i)
        {
          if (*(_QWORD *)v130 != v105)
            objc_enumerationMutation(obj);
          v18 = *(void **)(*((_QWORD *)&v129 + 1) + 8 * i);
          v125 = 0u;
          v126 = 0u;
          v127 = 0u;
          v128 = 0u;
          objc_msgSend(v18, "transferSyncContextIfExists");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "downloadStream");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "operations");
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v125, v135, 16);
          if (v22)
          {
            v23 = v22;
            v24 = *(_QWORD *)v126;
            do
            {
              for (j = 0; j != v23; ++j)
              {
                if (*(_QWORD *)v126 != v24)
                  objc_enumerationMutation(v21);
                v26 = *(void **)(*((_QWORD *)&v125 + 1) + 8 * j);
                objc_msgSend(v18, "logName");
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v26, "descriptionWithContext:", v7);
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v7, "writeLineWithFormat:", CFSTR("%@: %@"), v27, v28);

              }
              v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v125, v135, 16);
            }
            while (v23);
          }

        }
        v107 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v129, v136, 16);
      }
      while (v107);
    }

    self = v101;
    v5 = v100;
  }
  objc_msgSend(v7, "popIndentation");
  if (v5)
  {
    -[BRCAccountSession fsUploader](self->_session, "fsUploader");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "aggregateDescriptionForJobsMatching:context:", self->_serverZone, v7);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "writeLineWithFormat:", CFSTR("+ uploads:  %@"), v30);

  }
  else
  {
    objc_msgSend(v7, "writeLineWithFormat:", CFSTR("+ uploads:  not dumping"));
  }
  objc_msgSend(v7, "pushIndentation");
  -[BRCAccountSession fsUploader](self->_session, "fsUploader");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "thumbnailGenerationManager");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "writeLineWithFormat:", CFSTR("%@"), v32);

  if (-[BRCClientZone isPrivateZone](self, "isPrivateZone"))
  {
    v123 = 0u;
    v124 = 0u;
    v121 = 0u;
    v122 = 0u;
    -[BRCClientZone asPrivateClientZone](self, "asPrivateClientZone");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "appLibraries");
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    obja = v34;
    v108 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v121, v134, 16);
    if (v108)
    {
      v106 = *(_QWORD *)v122;
      do
      {
        for (k = 0; k != v108; ++k)
        {
          if (*(_QWORD *)v122 != v106)
            objc_enumerationMutation(obja);
          v36 = *(void **)(*((_QWORD *)&v121 + 1) + 8 * k);
          v117 = 0u;
          v118 = 0u;
          v119 = 0u;
          v120 = 0u;
          objc_msgSend(v36, "transferSyncContextIfExists");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "uploadStream");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "operations");
          v39 = (void *)objc_claimAutoreleasedReturnValue();

          v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v117, v133, 16);
          if (v40)
          {
            v41 = v40;
            v42 = *(_QWORD *)v118;
            do
            {
              for (m = 0; m != v41; ++m)
              {
                if (*(_QWORD *)v118 != v42)
                  objc_enumerationMutation(v39);
                v44 = *(void **)(*((_QWORD *)&v117 + 1) + 8 * m);
                objc_msgSend(v36, "logName");
                v45 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v44, "descriptionWithContext:", v7);
                v46 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v7, "writeLineWithFormat:", CFSTR("%@: %@"), v45, v46);

              }
              v41 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v117, v133, 16);
            }
            while (v41);
          }

        }
        v108 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v121, v134, 16);
      }
      while (v108);
    }

    self = v101;
    v5 = v100;
  }
  if (self->_allItemsDidUploadTrackers)
    objc_msgSend(v7, "writeLineWithFormat:", CFSTR("sync bubble waiting"));
  objc_msgSend(v7, "popIndentation");
  if (v5)
  {
    -[BRCAccountSession(LegacyAdditions) fsReader](self->_session, "fsReader");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "aggregateDescriptionForJobsMatching:context:", self->_serverZone, v7);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "writeLineWithFormat:", CFSTR("+ reader:   %@"), v48);

    -[BRCAccountSession applyScheduler](self->_session, "applyScheduler");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "aggregateDescriptionForJobsMatching:context:", self->_serverZone, v7);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "writeLineWithFormat:", CFSTR("+ apply:    %@"), v50);

  }
  else
  {
    objc_msgSend(v7, "writeLineWithFormat:", CFSTR("+ reader:   not dumping"));
    objc_msgSend(v7, "writeLineWithFormat:", CFSTR("+ apply:    not dumping"));
  }
  v51 = -[NSMutableDictionary count](self->_runningListOperations, "count");
  v52 = MEMORY[0x1E0C809B0];
  if (v51)
  {
    objc_msgSend(v7, "writeLineWithFormat:", CFSTR("+ list:"));
    objc_msgSend(v7, "pushIndentation");
    v53 = (void *)-[NSMutableDictionary copy](self->_runningListOperations, "copy");
    v115[0] = v52;
    v115[1] = 3221225472;
    v115[2] = __70__BRCClientZone_dumpActivityToContext_includeExpensiveActivity_error___block_invoke;
    v115[3] = &unk_1E8762F40;
    v54 = v7;
    v116 = v54;
    objc_msgSend(v53, "enumerateKeysAndObjectsUsingBlock:", v115);

    objc_msgSend(v54, "popIndentation");
  }
  if (-[NSMutableDictionary count](self->_recursiveListOperations, "count"))
  {
    objc_msgSend(v7, "writeLineWithFormat:", CFSTR("+ rec-list:"));
    objc_msgSend(v7, "pushIndentation");
    v55 = (void *)-[NSMutableDictionary copy](self->_recursiveListOperations, "copy");
    v113[0] = v52;
    v113[1] = 3221225472;
    v113[2] = __70__BRCClientZone_dumpActivityToContext_includeExpensiveActivity_error___block_invoke_2;
    v113[3] = &unk_1E8762F68;
    v56 = v7;
    v114 = v56;
    objc_msgSend(v55, "enumerateKeysAndObjectsUsingBlock:", v113);

    objc_msgSend(v56, "popIndentation");
  }
  if (-[NSMutableDictionary count](self->_fetchParentOperations, "count"))
  {
    objc_msgSend(v7, "writeLineWithFormat:", CFSTR("+ fetch-parent:"));
    objc_msgSend(v7, "pushIndentation");
    v57 = (void *)-[NSMutableDictionary copy](self->_fetchParentOperations, "copy");
    v111[0] = v52;
    v111[1] = 3221225472;
    v111[2] = __70__BRCClientZone_dumpActivityToContext_includeExpensiveActivity_error___block_invoke_3;
    v111[3] = &unk_1E8762F90;
    v58 = v7;
    v112 = v58;
    objc_msgSend(v57, "enumerateKeysAndObjectsUsingBlock:", v111);

    objc_msgSend(v58, "popIndentation");
  }
  if (-[NSMutableDictionary count](self->_locateRecordOperations, "count"))
  {
    objc_msgSend(v7, "writeLineWithFormat:", CFSTR("+ locate-record:"));
    objc_msgSend(v7, "pushIndentation");
    v59 = (void *)-[NSMutableDictionary copy](self->_locateRecordOperations, "copy");
    v109[0] = v52;
    v109[1] = 3221225472;
    v109[2] = __70__BRCClientZone_dumpActivityToContext_includeExpensiveActivity_error___block_invoke_4;
    v109[3] = &unk_1E8762FB8;
    v60 = v7;
    v110 = v60;
    objc_msgSend(v59, "enumerateKeysAndObjectsUsingBlock:", v109);

    objc_msgSend(v60, "popIndentation");
  }
  if (self->_fetchRecentsOperation)
  {
    objc_msgSend(v7, "writeLineWithFormat:", CFSTR("+ fetch-recents:"));
    objc_msgSend(v7, "pushIndentation");
    objc_msgSend(v7, "writeLineWithFormat:", CFSTR("%@"), self->_fetchRecentsOperation);
    objc_msgSend(v7, "popIndentation");
  }
  v61 = -[BRCClientZone _appLibrariesState](self, "_appLibrariesState");
  if (objc_msgSend(v7, "liveDaemon"))
  {
    if (self->_syncUpOperation)
    {
      v62 = CFSTR(" [sync-up running]");
      v63 = v99;
    }
    else
    {
      v63 = v99;
      if (!(self->_state & 0x100 | v61 & 0x80000) && (v99 & 0x71) == 0x21)
      {
        brc_interval_from_nsec();
        v65 = v64;
        -[BRCSyncOperationThrottle nextTry](self->_syncUpThrottle, "nextTry");
        if (v66 <= v65)
        {
          v68 = CFSTR("because of item ");
        }
        else
        {
          -[BRCSyncOperationThrottle nextTry](self->_syncUpThrottle, "nextTry");
          v65 = v67;
          v68 = &stru_1E8769030;
        }
        -[BRCSyncBudgetThrottle nextDateWithBudgetWithDefaults:](self->_syncUpBudget, "nextDateWithBudgetWithDefaults:", v102);
        if (v94 > v65)
        {
          -[BRCSyncBudgetThrottle nextDateWithBudgetWithDefaults:](self->_syncUpBudget, "nextDateWithBudgetWithDefaults:", v102);
          v65 = v95;
          v68 = CFSTR("for budget ");
        }
        brc_interval_from_nsec();
        if (v65 <= v96)
        {
          v69 = CFSTR(" [sync-up waiting to be scheduled]");
          v70 = 7;
        }
        else
        {
          v97 = objc_alloc(MEMORY[0x1E0CB3940]);
          brc_interval_from_nsec();
          v69 = (__CFString *)objc_msgSend(v97, "initWithFormat:", CFSTR(" [sync-up throttled %@(next-try:in %.01fs)]"), v68, v65 - v98);
          v70 = 3;
        }
        v63 = v99;
        goto LABEL_74;
      }
      v62 = CFSTR(" [sync-up waiting for sync down]");
    }
    if ((v63 & 1) != 0)
      v69 = (__CFString *)v62;
    else
      v69 = 0;
    if ((v63 & 1) != 0)
      v70 = 7;
    else
      v70 = 0;
LABEL_74:
    if (self->_syncDownOperation)
    {
      v71 = 0;
      v72 = 0;
    }
    else
    {
      v71 = 0;
      if ((self->_state & 0x100) != 0)
      {
        v72 = 0;
      }
      else
      {
        v72 = 0;
        if ((v63 & 2) != 0)
        {
          -[BRCSyncOperationThrottle nextTry](self->_syncDownThrottle, "nextTry");
          v90 = v89;
          brc_interval_from_nsec();
          if (v90 <= v91)
          {
            v71 = CFSTR(" [sync-down waiting to be scheduled]");
            v72 = 7;
          }
          else
          {
            v92 = (void *)MEMORY[0x1E0CB3940];
            brc_interval_from_nsec();
            objc_msgSend(v92, "stringWithFormat:", CFSTR(" [sync-down throttled (next-try:in %.01fs)]"), v90 - v93);
            v71 = (__CFString *)objc_claimAutoreleasedReturnValue();
            v72 = 3;
          }
        }
      }
    }
    if (v69)
    {
      +[BRCDumpContext highlightedString:type:context:](BRCDumpContext, "highlightedString:type:context:", v69, v70, v7);
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "appendString:", v73);

    }
    if (v71)
    {
      +[BRCDumpContext highlightedString:type:context:](BRCDumpContext, "highlightedString:type:context:", v71, v72, v7);
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "appendString:", v74);

    }
    objc_msgSend(v8, "appendFormat:", CFSTR(" [scheduling: %@]"), self->_syncDeadlineSource);
    objc_msgSend(v7, "writeLineWithFormat:", CFSTR("+ sync:      %@"), v8);
    -[BRCAccountSession syncUpScheduler](self->_session, "syncUpScheduler");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "aggregateDescriptionForJobsMatching:context:", self->_serverZone, v7);
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "writeLineWithFormat:", CFSTR("  up:        %@"), v76);

    -[BRCSyncBudgetThrottle debugDescriptionWithDefaults:](self->_syncUpBudget, "debugDescriptionWithDefaults:", v102);
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "writeLineWithFormat:", CFSTR("  up-budget: %@"), v77);

    lastSyncUpError = self->_lastSyncUpError;
    if (lastSyncUpError)
    {
      +[BRCDumpContext stringFromError:context:](BRCDumpContext, "stringFromError:context:", lastSyncUpError, v7);
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "writeLineWithFormat:", CFSTR("  up-error:  %@"), v79);

    }
    lastSyncDownError = self->_lastSyncDownError;
    if (lastSyncDownError)
    {
      +[BRCDumpContext stringFromError:context:](BRCDumpContext, "stringFromError:context:", lastSyncDownError, v7);
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "writeLineWithFormat:", CFSTR("  dn-error   %@"), v81);

    }
    syncUpOperation = self->_syncUpOperation;
    if (syncUpOperation || (syncUpOperation = self->_syncDownOperation) != 0)
    {
      objc_msgSend(syncUpOperation, "descriptionWithContext:", v7);
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "writeLineWithFormat:", CFSTR("  operation: %@"), v83);

    }
    -[BRCClientZone session](self, "session");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v84, "serverState");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCClientZone mangledID](self, "mangledID");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v85, "dumpMigrationQueriesForMangledID:", v86);
    v87 = (void *)objc_claimAutoreleasedReturnValue();

    if (v87)
      objc_msgSend(v7, "writeLineWithFormat:", CFSTR("+ migration: %@"), v87);

  }
  if (-[NSMutableSet count](self->_itemIDsBlockedFromSyncForCZMProcessing, "count"))
    objc_msgSend(v7, "writeLineWithFormat:", CFSTR("+ process-removal: %@"), self->_itemIDsBlockedFromSyncForCZMProcessing);

LABEL_93:
  return 1;
}

uint64_t __70__BRCClientZone_dumpActivityToContext_includeExpensiveActivity_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "writeLineWithFormat:", CFSTR("%@:%@"), a2, a3);
}

uint64_t __70__BRCClientZone_dumpActivityToContext_includeExpensiveActivity_error___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "writeLineWithFormat:", CFSTR("%@:%@"), a2, a3);
}

uint64_t __70__BRCClientZone_dumpActivityToContext_includeExpensiveActivity_error___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "writeLineWithFormat:", CFSTR("%@:%@"), a2, a3);
}

uint64_t __70__BRCClientZone_dumpActivityToContext_includeExpensiveActivity_error___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "writeLineWithFormat:", CFSTR("%@:%@"), a2, a3);
}

- (BOOL)shouldSyncMangledID:(id)a3
{
  id v4;
  void *v5;
  int v6;
  char v7;
  void *v8;
  char v9;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  char v16;
  void *v17;

  v4 = a3;
  +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "forceSyncOverride");

  if (v6 == 1)
    goto LABEL_7;
  if (v6 == 255)
  {
    v7 = 0;
    goto LABEL_8;
  }
  if (-[BRCClientZone isSharedZone](self, "isSharedZone")
    || (-[BRCAccountSession appLibraryByMangledID:](self->_session, "appLibraryByMangledID:", v4),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_msgSend(v8, "hasLocalChanges"),
        v8,
        (v9 & 1) != 0)
    || -[BRCClientZone _hasNonDiscretionaryServerStitchingOperation](self, "_hasNonDiscretionaryServerStitchingOperation"))
  {
LABEL_7:
    v7 = 1;
    goto LABEL_8;
  }
  objc_msgSend(v4, "appLibraryOrZoneName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCClientZone session](self, "session");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "appLibraryByMangledID:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "containerMetadata");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "isDocumentScopePublic");

  v16 = objc_msgSend(v11, "isEqualToString:", *MEMORY[0x1E0D10DB0]);
  v7 = 1;
  if ((v15 & 1) == 0 && (v16 & 1) == 0)
  {
    +[BRCCloudDocsAppsMonitor cloudDocsAppsMonitor](BRCCloudDocsAppsMonitor, "cloudDocsAppsMonitor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v17, "isApplicationInstalledForContainerID:", v11);

  }
LABEL_8:

  return v7;
}

- (float)syncUpBackoffDelay
{
  double v2;

  -[BRCSyncOperationThrottle delay](self->_syncUpThrottle, "delay");
  return v2;
}

- (float)syncUpBackoffRatio
{
  float result;

  -[BRCSyncOperationBackoffRatio backoffRatio](self->_syncUpBackoffRatio, "backoffRatio");
  return result;
}

- (void)resetSyncUpBackoffRatio
{
  -[BRCSyncOperationBackoffRatio clear](self->_syncUpBackoffRatio, "clear");
}

- (BOOL)isBusy
{
  return (self->_state & 0x100) != 0
      || (-[BRCClientZone _appLibrariesState](self, "_appLibrariesState") & 0x80000) != 0
      || (-[BRCClientZone syncState](self, "syncState") & 0xF) != 0;
}

- (BOOL)activated
{
  return self->_activated;
}

- (BRCClientZoneDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_delegate, a3);
}

- (BRCPQLConnection)db
{
  return self->_db;
}

- (BOOL)needsSave
{
  return self->_needsSave;
}

- (unsigned)state
{
  return self->_state;
}

- (BRCZoneRowID)dbRowID
{
  return self->_dbRowID;
}

- (void)setDbRowID:(id)a3
{
  objc_storeStrong((id *)&self->_dbRowID, a3);
}

- (NSString)zoneName
{
  return self->_zoneName;
}

- (unint64_t)currentRequestID
{
  return self->_requestID;
}

- (int64_t)lastInsertedRank
{
  return self->_lastInsertedRank;
}

- (BRCAccountSession)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
  objc_storeStrong((id *)&self->_session, a3);
}

- (BRCDeadlineSource)syncDeadlineSource
{
  return self->_syncDeadlineSource;
}

- (BRCServerZone)serverZone
{
  return self->_serverZone;
}

- (void)setServerZone:(id)a3
{
  objc_storeStrong((id *)&self->_serverZone, a3);
}

- (NSString)osNameRequiredToSync
{
  return self->_osNameRequiredToSync;
}

- (brc_task_tracker)taskTracker
{
  return self->_taskTracker;
}

- (NSDate)lastAttemptedSyncDownDate
{
  return self->_lastAttemptedSyncDownDate;
}

- (void)setLastAttemptedSyncDownDate:(id)a3
{
  objc_storeStrong((id *)&self->_lastAttemptedSyncDownDate, a3);
}

- (NSSet)itemIDsBlockedFromSyncForCZMProcessing
{
  return &self->_itemIDsBlockedFromSyncForCZMProcessing->super;
}

- (NSDictionary)parentsOfCZMFaults
{
  return &self->_parentsOfCZMFaults->super;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_osNameRequiredToSync, 0);
  objc_storeStrong((id *)&self->_syncThrottles, 0);
  objc_storeStrong((id *)&self->_taskTracker, 0);
  objc_storeStrong((id *)&self->_bubbleSyncTask, 0);
  objc_storeStrong((id *)&self->_outOfBandSyncOperations, 0);
  objc_storeStrong((id *)&self->_allItemsDidUploadTrackers, 0);
  objc_storeStrong((id *)&self->_syncDownDependencies, 0);
  objc_storeStrong((id *)&self->_syncDownGroup, 0);
  objc_storeStrong((id *)&self->_directoriesCreatedLastSyncUp, 0);
  objc_storeStrong((id *)&self->_nextIdleHandlers, 0);
  objc_storeStrong((id *)&self->_hasWorkDidUpdateObserver, 0);
  objc_storeStrong((id *)&self->_currentSyncDownBarriers, 0);
  objc_storeStrong((id *)&self->_nextSyncDownBarriers, 0);
  objc_storeStrong((id *)&self->_locateBlocksToPerformForRecordID, 0);
  objc_storeStrong((id *)&self->_syncDownBlockToPerformForItemID, 0);
  objc_storeStrong((id *)&self->_downloadedBlockToPerformForItemID, 0);
  objc_storeStrong((id *)&self->_onDiskBlockToPerformForItemID, 0);
  objc_storeStrong((id *)&self->_parentsOfCZMFaults, 0);
  objc_storeStrong((id *)&self->_blocksWaitingOnCrossZoneMoveProcessing, 0);
  objc_storeStrong((id *)&self->_itemsBlockedByAssociationForCZMProcessing, 0);
  objc_storeStrong((id *)&self->_itemIDsBlockedFromSyncForCZMProcessing, 0);
  objc_storeStrong((id *)&self->_syncDownBlockToPerformForBookmarkData, 0);
  objc_storeStrong((id *)&self->_resetTimer, 0);
  objc_storeStrong((id *)&self->_lastAttemptedSyncDownDate, 0);
  objc_storeStrong((id *)&self->_lastSyncDownDate, 0);
  objc_storeStrong((id *)&self->_appliedTombstoneRanks, 0);
  objc_storeStrong((id *)&self->_locateRecordsOperationThrottle, 0);
  objc_storeStrong((id *)&self->_serverStitchingOperationThrottle, 0);
  objc_storeStrong((id *)&self->_fetchRecentsOperation, 0);
  objc_storeStrong((id *)&self->_locateRecordOperations, 0);
  objc_storeStrong((id *)&self->_fetchParentOperations, 0);
  objc_storeStrong((id *)&self->_recursiveListOperations, 0);
  objc_storeStrong((id *)&self->_runningListOperations, 0);
  objc_storeStrong((id *)&self->_blockedOperationsOnInitialSync, 0);
  objc_storeStrong((id *)&self->_syncDeadlineSource, 0);
  objc_storeStrong((id *)&self->_syncDownThrottle, 0);
  objc_storeStrong((id *)&self->_syncUpBackoffRatio, 0);
  objc_storeStrong((id *)&self->_syncUpBudget, 0);
  objc_storeStrong((id *)&self->_syncUpThrottle, 0);
  objc_storeStrong((id *)&self->_lastSyncDownError, 0);
  objc_storeStrong((id *)&self->_syncDownOperation, 0);
  objc_storeStrong((id *)&self->_lastSyncUpError, 0);
  objc_storeStrong((id *)&self->_syncUpOperation, 0);
  objc_storeStrong((id *)&self->_readerThrottle, 0);
  objc_storeStrong((id *)&self->_db, 0);
  objc_storeStrong((id *)&self->_mangledID, 0);
  objc_storeStrong((id *)&self->_ownerName, 0);
  objc_storeStrong((id *)&self->_zoneName, 0);
  objc_storeStrong((id *)&self->_dbRowID, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_serverZone, 0);
  objc_storeStrong((id *)&self->_session, 0);
}

- (id)_refreshItemFromDB:(id)a3
{
  id v4;
  BRCAccountSession *session;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  NSObject *v13;
  int v15;
  id v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  session = self->_session;
  objc_msgSend(v4, "zoneRowID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCAccountSession serverZoneByRowID:](session, "serverZoneByRowID:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "clientZone");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "itemID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "itemByItemID:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v10, "isOnDisk") & 1) != 0)
  {
    v11 = v10;
  }
  else
  {
    brc_bread_crumbs();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v15 = 138412546;
      v16 = v4;
      v17 = 2112;
      v18 = v12;
      _os_log_impl(&dword_1CBD43000, v13, OS_LOG_TYPE_DEFAULT, "[WARNING] Couldn't find refreshed item for %@%@", (uint8_t *)&v15, 0x16u);
    }

    -[BRCClientZone _finishedProcessingItemThatMovedToThisZone:](self, "_finishedProcessingItemThatMovedToThisZone:", v4);
    v11 = 0;
  }

  return v11;
}

- (void)_removeItemFromCZMProcessingIfNotAssociated:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  NSObject *v8;

  v4 = a3;
  -[BRCPQLConnection assertOnQueue](self->_db, "assertOnQueue");
  -[NSMutableDictionary allValues](self->_itemsBlockedByAssociationForCZMProcessing, "allValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v4);

  if ((v6 & 1) == 0)
  {
    brc_bread_crumbs();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      -[BRCClientZone(LegacyAdditions) _removeItemFromCZMProcessingIfNotAssociated:].cold.1();

    -[NSMutableSet removeObject:](self->_itemIDsBlockedFromSyncForCZMProcessing, "removeObject:", v4);
  }

}

- (void)_finishedProcessingItemThatMovedToThisZone:(id)a3
{
  id v4;
  void *v5;
  NSMutableDictionary *parentsOfCZMFaults;
  void *v7;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSMutableArray *blocksWaitingOnCrossZoneMoveProcessing;
  NSMutableSet *itemIDsBlockedFromSyncForCZMProcessing;
  NSMutableDictionary *itemsBlockedByAssociationForCZMProcessing;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[BRCPQLConnection assertOnQueue](self->_db, "assertOnQueue");
  -[NSMutableDictionary objectForKeyedSubscript:](self->_itemsBlockedByAssociationForCZMProcessing, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary removeObjectForKey:](self->_itemsBlockedByAssociationForCZMProcessing, "removeObjectForKey:", v4);
  parentsOfCZMFaults = self->_parentsOfCZMFaults;
  objc_msgSend(v4, "itemID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary removeObjectForKey:](parentsOfCZMFaults, "removeObjectForKey:", v7);

  if (v5)
    -[BRCClientZone _removeItemFromCZMProcessingIfNotAssociated:](self, "_removeItemFromCZMProcessingIfNotAssociated:", v5);
  -[BRCClientZone _removeItemFromCZMProcessingIfNotAssociated:](self, "_removeItemFromCZMProcessingIfNotAssociated:", v4);
  if (!-[NSMutableSet count](self->_itemIDsBlockedFromSyncForCZMProcessing, "count"))
  {
    -[BRCClientZone scheduleSyncUp](self, "scheduleSyncUp");
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v8 = self->_blocksWaitingOnCrossZoneMoveProcessing;
    v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v17;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v17 != v11)
            objc_enumerationMutation(v8);
          (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v12) + 16))(*(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v12));
          ++v12;
        }
        while (v10 != v12);
        v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v10);
    }

    blocksWaitingOnCrossZoneMoveProcessing = self->_blocksWaitingOnCrossZoneMoveProcessing;
    self->_blocksWaitingOnCrossZoneMoveProcessing = 0;

    itemIDsBlockedFromSyncForCZMProcessing = self->_itemIDsBlockedFromSyncForCZMProcessing;
    self->_itemIDsBlockedFromSyncForCZMProcessing = 0;

    itemsBlockedByAssociationForCZMProcessing = self->_itemsBlockedByAssociationForCZMProcessing;
    self->_itemsBlockedByAssociationForCZMProcessing = 0;

  }
}

- (void)_removeItemAndProcessForCrossZoneMove:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t);
  void *v14;
  id v15;
  BRCClientZone *v16;

  v4 = a3;
  if (objc_msgSend(v4, "isAlmostDead"))
  {
    brc_bread_crumbs();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      -[BRCClientZone(LegacyAdditions) _removeItemAndProcessForCrossZoneMove:].cold.1();

    objc_msgSend(v4, "itemGlobalID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCClientZone _finishedProcessingItemThatMovedToThisZone:](self, "_finishedProcessingItemThatMovedToThisZone:", v7);

  }
  else
  {
    -[BRCClientZone db](self, "db");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = MEMORY[0x1E0C809B0];
    v12 = 3221225472;
    v13 = __72__BRCClientZone_LegacyAdditions___removeItemAndProcessForCrossZoneMove___block_invoke;
    v14 = &unk_1E8760018;
    v9 = v4;
    v15 = v9;
    v16 = self;
    objc_msgSend(v8, "groupInBatch:", &v11);

    objc_msgSend(v9, "itemGlobalID", v11, v12, v13, v14);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCClientZone _finishedProcessingItemThatMovedToThisZone:](self, "_finishedProcessingItemThatMovedToThisZone:", v10);

  }
}

void __72__BRCClientZone_LegacyAdditions___removeItemAndProcessForCrossZoneMove___block_invoke(uint64_t a1)
{
  BRCItemToPathLookup *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  char v19;
  void *v20;
  NSObject *v21;
  uint64_t v22;
  void *v23;
  int v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  int v32;
  uint64_t v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v2 = -[BRCItemToPathLookup initWithItem:]([BRCItemToPathLookup alloc], "initWithItem:", *(_QWORD *)(a1 + 32));
  -[BRCItemToPathLookup byFileSystemID](v2, "byFileSystemID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "appLibrary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mangledID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "timeoutForCZMProcessing");
  v8 = objc_msgSend(v6, "supportsServerSideAssetCopies");
  if (!v3)
  {
    if (objc_msgSend(*(id *)(a1 + 32), "isDocument"))
    {
      v9 = brc_current_date_nsec() / 1000000000;
      objc_msgSend(*(id *)(a1 + 32), "asDocument");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "currentVersion");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v9 - objc_msgSend(v11, "mtime");

      if (v12 < v7)
        goto LABEL_10;
    }
  }
  v13 = objc_msgSend(*(id *)(a1 + 32), "isDirectory");
  v14 = *(void **)(a1 + 32);
  if (v13)
  {
    objc_msgSend(v14, "asDirectory");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v15, "containsFault") ^ 1 | v8) != 1
      || (objc_msgSend(*(id *)(a1 + 32), "isFault") & 1) != 0)
    {

LABEL_10:
      -[BRCItemToPathLookup closePaths](v2, "closePaths");
      brc_bread_crumbs();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        v18 = *(_QWORD *)(a1 + 32);
        v32 = 138412546;
        v33 = v18;
        v34 = 2112;
        v35 = v16;
        _os_log_impl(&dword_1CBD43000, v17, OS_LOG_TYPE_DEFAULT, "[WARNING] State changed before we could remove %@. Aborting removal%@", (uint8_t *)&v32, 0x16u);
      }

      objc_msgSend(*(id *)(a1 + 32), "markLostWhenReplacedByItem:", 0);
      objc_msgSend(*(id *)(a1 + 32), "saveToDB");
      goto LABEL_13;
    }
    v19 = objc_msgSend(v3, "isFault");

    if ((v19 & 1) != 0)
      goto LABEL_10;
  }
  else if ((objc_msgSend(v14, "isFault") & 1) != 0 || objc_msgSend(v3, "isFault"))
  {
    goto LABEL_10;
  }
  brc_bread_crumbs();
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    v22 = *(_QWORD *)(a1 + 32);
    v32 = 138412546;
    v33 = v22;
    v34 = 2112;
    v35 = v20;
    _os_log_impl(&dword_1CBD43000, v21, OS_LOG_TYPE_DEFAULT, "[WARNING] Proceeding with removal of item which moved into a share %@%@", (uint8_t *)&v32, 0x16u);
  }

  if (objc_msgSend(*(id *)(a1 + 32), "isSharedToMeTopLevelItem"))
    objc_msgSend(v3, "performOnOpenFileDescriptor:error:", &__block_literal_global_28, 0);
  objc_msgSend(*(id *)(a1 + 32), "markRemovedFromFilesystemForServerEdit:", 0);
  objc_msgSend(*(id *)(a1 + 32), "moveAsideLocally");
  objc_msgSend(*(id *)(a1 + 32), "clientZone");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "isPrivateZone");

  if (v24)
  {
    v25 = *(void **)(a1 + 32);
    objc_msgSend(v25, "clientZone");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "asPrivateClientZone");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "defaultAppLibrary");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setAppLibrary:", v28);

  }
  objc_msgSend(*(id *)(a1 + 32), "markNeedsUploadOrSyncingUp");
  objc_msgSend(*(id *)(a1 + 32), "saveToDB");
  if (v3)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "fsReader");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "fseventAtPath:flags:", v3, 1);
  }
  else
  {
    brc_bread_crumbs();
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_FAULT))
      __72__BRCClientZone_LegacyAdditions___removeItemAndProcessForCrossZoneMove___block_invoke_cold_1();

    objc_msgSend(*(id *)(a1 + 32), "appLibrary");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "scheduleDeepScanWithReason:", CFSTR("No path to process fsevent on"));
  }

LABEL_13:
  -[BRCItemToPathLookup closePaths](v2, "closePaths");

}

uint64_t __72__BRCClientZone_LegacyAdditions___removeItemAndProcessForCrossZoneMove___block_invoke_2(int a1, int fd)
{
  uint64_t result;

  result = fremovexattr(fd, "com.apple.clouddocs.private.share-bookmark#B", 0);
  if ((_DWORD)result)
    return *__error();
  return result;
}

- (void)_startDownloadingItemForCrossZoneMoveIfNecessary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  NSObject *v9;
  dispatch_group_t v10;
  BRCAccountSession *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  BRCAccountSession *v15;
  NSObject *v16;
  id v17;
  NSObject *v18;
  uint64_t v19;
  char v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  uint64_t v27;
  NSObject *v28;
  BRCClientZone *v29;
  id obj;
  _QWORD block[4];
  id v32;
  BRCClientZone *v33;
  _QWORD v34[4];
  BRCAccountSession *v35;
  id v36;
  NSObject *v37;
  id v38;
  uint64_t *v39;
  uint64_t v40;
  _QWORD v41[4];
  id v42;

  v4 = a3;
  v40 = 0;
  v41[0] = &v40;
  v41[1] = 0x3032000000;
  v41[2] = __Block_byref_object_copy__27;
  v41[3] = __Block_byref_object_dispose__27;
  v42 = 0;
  objc_msgSend(v4, "itemGlobalID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isDirectory"))
  {
    objc_msgSend(v4, "asDirectory");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "containsFault");

    if (v7)
    {
      brc_bread_crumbs();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        -[BRCClientZone(LegacyAdditions) _startDownloadingItemForCrossZoneMoveIfNecessary:].cold.1();

      v10 = dispatch_group_create();
      v11 = self->_session;
      objc_msgSend(v4, "asDirectory");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "db");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = MEMORY[0x1E0C809B0];
      v34[0] = MEMORY[0x1E0C809B0];
      v34[1] = 3221225472;
      v34[2] = __83__BRCClientZone_LegacyAdditions___startDownloadingItemForCrossZoneMoveIfNecessary___block_invoke;
      v34[3] = &unk_1E8763098;
      v15 = v11;
      v35 = v15;
      v36 = v4;
      v39 = &v40;
      v16 = v10;
      v37 = v16;
      v17 = v5;
      v38 = v17;
      -[BRCAccountSession enumerateSideFaultsUnderParent:db:block:](v15, "enumerateSideFaultsUnderParent:db:block:", v12, v13, v34);

      -[BRCAccountSession clientTruthWorkloop](v15, "clientTruthWorkloop");
      v18 = objc_claimAutoreleasedReturnValue();
      block[0] = v14;
      block[1] = 3221225472;
      block[2] = __83__BRCClientZone_LegacyAdditions___startDownloadingItemForCrossZoneMoveIfNecessary___block_invoke_11;
      block[3] = &unk_1E875D470;
      v32 = v17;
      v33 = self;
      dispatch_group_notify(v16, v18, block);

LABEL_15:
      goto LABEL_16;
    }
  }
  if (objc_msgSend(v4, "isFault"))
  {
    v19 = v41[0];
    obj = *(id *)(v41[0] + 40);
    v20 = objc_msgSend(v4, "startDownloadInTask:options:etagIfLoser:stageFileName:error:", 0, 0, 0, 0, &obj);
    objc_storeStrong((id *)(v19 + 40), obj);
    if ((v20 & 1) != 0)
    {
      brc_bread_crumbs();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
        -[BRCClientZone(LegacyAdditions) _startDownloadingItemForCrossZoneMoveIfNecessary:].cold.2();

      objc_msgSend(v4, "clientZone");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = MEMORY[0x1E0C809B0];
      v28 = v5;
      v29 = self;
      objc_msgSend(v4, "itemID", v27, 3221225472, __83__BRCClientZone_LegacyAdditions___startDownloadingItemForCrossZoneMoveIfNecessary___block_invoke_13, &unk_1E87630C0);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "performBlock:whenItemWithIDIsDownloaded:", &v27, v24);

      v16 = v28;
    }
    else
    {
      brc_bread_crumbs();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, (os_log_type_t)0x90u))
        -[BRCClientZone(LegacyAdditions) _startDownloadingItemForCrossZoneMoveIfNecessary:].cold.3((uint64_t)v41);

      objc_msgSend(v4, "itemGlobalID");
      v16 = objc_claimAutoreleasedReturnValue();
      -[BRCClientZone _finishedProcessingItemThatMovedToThisZone:](self, "_finishedProcessingItemThatMovedToThisZone:", v16);
    }
    goto LABEL_15;
  }
  -[BRCClientZone _removeItemAndProcessForCrossZoneMove:](self, "_removeItemAndProcessForCrossZoneMove:", v4);
LABEL_16:

  _Block_object_dispose(&v40, 8);
}

void __83__BRCClientZone_LegacyAdditions___startDownloadingItemForCrossZoneMoveIfNecessary___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  int v17;
  void *v18;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  _QWORD v22[4];
  id v23;
  id obj;
  uint8_t buf[4];
  NSObject *v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(void **)(a1 + 32);
  objc_msgSend(v3, "zoneRowID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "serverZoneByRowID:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "clientZone");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "clientZone");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v8, "isPrivateZone"))
  {

    goto LABEL_6;
  }
  v9 = objc_msgSend(v7, "isSharedZone");

  if (!v9)
  {
LABEL_6:
    objc_msgSend(v7, "mangledID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", v12);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "itemID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "itemByItemID:", v13);
    v11 = objc_claimAutoreleasedReturnValue();

    if (-[NSObject isFault](v11, "isFault")
      && (objc_msgSend(v10, "supportsServerSideAssetCopies") & 1) == 0)
    {
      v16 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
      obj = *(id *)(v16 + 40);
      v17 = -[NSObject startDownloadInTask:options:etagIfLoser:stageFileName:error:](v11, "startDownloadInTask:options:etagIfLoser:stageFileName:error:", 0, 0, 0, 0, &obj);
      objc_storeStrong((id *)(v16 + 40), obj);
      if (v17)
      {
        dispatch_group_enter(*(dispatch_group_t *)(a1 + 48));
        -[NSObject clientZone](v11, "clientZone");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v22[0] = MEMORY[0x1E0C809B0];
        v22[1] = 3221225472;
        v22[2] = __83__BRCClientZone_LegacyAdditions___startDownloadingItemForCrossZoneMoveIfNecessary___block_invoke_7;
        v22[3] = &unk_1E8763070;
        v23 = *(id *)(a1 + 48);
        -[NSObject itemID](v11, "itemID", v22[0], 3221225472, __83__BRCClientZone_LegacyAdditions___startDownloadingItemForCrossZoneMoveIfNecessary___block_invoke_7, &unk_1E8763070);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "performBlock:whenItemWithIDIsDownloaded:", v22, v19);

        v14 = v23;
      }
      else
      {
        brc_bread_crumbs();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, (os_log_type_t)0x90u))
        {
          v21 = *(_QWORD *)(a1 + 56);
          *(_DWORD *)buf = 138412802;
          v26 = v11;
          v27 = 2112;
          v28 = v21;
          v29 = 2112;
          v30 = v14;
          _os_log_error_impl(&dword_1CBD43000, v20, (os_log_type_t)0x90u, "[ERROR] Failed to start downloading item %@ under %@%@", buf, 0x20u);
        }

      }
    }
    else
    {
      if ((-[NSObject isFault](v11, "isFault") & 1) != 0)
        goto LABEL_18;
      brc_bread_crumbs();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
        __83__BRCClientZone_LegacyAdditions___startDownloadingItemForCrossZoneMoveIfNecessary___block_invoke_cold_2();

    }
    goto LABEL_18;
  }
  brc_bread_crumbs();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    __83__BRCClientZone_LegacyAdditions___startDownloadingItemForCrossZoneMoveIfNecessary___block_invoke_cold_1();
LABEL_18:

}

void __83__BRCClientZone_LegacyAdditions___startDownloadingItemForCrossZoneMoveIfNecessary___block_invoke_7(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __83__BRCClientZone_LegacyAdditions___startDownloadingItemForCrossZoneMoveIfNecessary___block_invoke_11(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;

  brc_bread_crumbs();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    __83__BRCClientZone_LegacyAdditions___startDownloadingItemForCrossZoneMoveIfNecessary___block_invoke_11_cold_1(a1);

  objc_msgSend(*(id *)(a1 + 40), "_refreshItemFromDB:", *(_QWORD *)(a1 + 32));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    objc_msgSend(*(id *)(a1 + 40), "_removeItemAndProcessForCrossZoneMove:", v4);

}

void __83__BRCClientZone_LegacyAdditions___startDownloadingItemForCrossZoneMoveIfNecessary___block_invoke_13(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  NSObject *v4;
  id v5;
  int8x16_t v6;
  _QWORD block[4];
  int8x16_t v8;

  brc_bread_crumbs();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    __83__BRCClientZone_LegacyAdditions___startDownloadingItemForCrossZoneMoveIfNecessary___block_invoke_13_cold_1(a1);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "clientTruthWorkloop");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __83__BRCClientZone_LegacyAdditions___startDownloadingItemForCrossZoneMoveIfNecessary___block_invoke_14;
  block[3] = &unk_1E875D470;
  v6 = *(int8x16_t *)(a1 + 32);
  v5 = (id)v6.i64[0];
  v8 = vextq_s8(v6, v6, 8uLL);
  dispatch_async(v4, block);

}

void __83__BRCClientZone_LegacyAdditions___startDownloadingItemForCrossZoneMoveIfNecessary___block_invoke_14(uint64_t a1)
{
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "_refreshItemFromDB:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = v2;
    objc_msgSend(*(id *)(a1 + 32), "_removeItemAndProcessForCrossZoneMove:", v2);
    v2 = v3;
  }

}

- (void)itemCrossZoneMoved:(id)a3 withLookup:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSMutableDictionary *v10;
  NSMutableDictionary *parentsOfCZMFaults;
  void *v12;
  char v13;
  void *v14;
  NSObject *v15;
  NSMutableDictionary *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  NSObject *v23;
  int v24;
  void *v25;
  __int16 v26;
  id v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[BRCPQLConnection assertOnQueue](self->_db, "assertOnQueue");
  objc_msgSend(v7, "parentItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "itemGlobalID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    brc_bread_crumbs();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
      -[BRCClientZone(LegacyAdditions) itemCrossZoneMoved:withLookup:].cold.2();

  }
  if (!self->_parentsOfCZMFaults)
  {
    v10 = (NSMutableDictionary *)objc_opt_new();
    parentsOfCZMFaults = self->_parentsOfCZMFaults;
    self->_parentsOfCZMFaults = v10;

  }
  objc_msgSend(v6, "clientZone");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isEqualToClientZone:", self);

  if ((v13 & 1) == 0)
  {
    brc_bread_crumbs();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
      -[BRCClientZone(LegacyAdditions) itemCrossZoneMoved:withLookup:].cold.1();

  }
  brc_bread_crumbs();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v24 = 138412802;
    v25 = v9;
    v26 = 2112;
    v27 = v6;
    v28 = 2112;
    v29 = v14;
    _os_log_impl(&dword_1CBD43000, v15, OS_LOG_TYPE_DEFAULT, "[WARNING] An item moved into %@ and needs to be downloaded for czm %@.%@", (uint8_t *)&v24, 0x20u);
  }

  v16 = self->_parentsOfCZMFaults;
  objc_msgSend(v6, "itemID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](v16, "setObject:forKeyedSubscript:", v9, v17);

  objc_msgSend(v6, "st");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "relpathOfFSEvent");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "updateFilenameFromPath:", v19);

  -[BRCClientZone _startDownloadingItemForCrossZoneMoveIfNecessary:](self, "_startDownloadingItemForCrossZoneMoveIfNecessary:", v6);
}

- (void)itemMovedIntoShareInThisZone:(id)a3 associatedItemID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSMutableSet *v10;
  NSMutableSet *itemIDsBlockedFromSyncForCZMProcessing;
  void *v12;
  NSMutableDictionary *itemsBlockedByAssociationForCZMProcessing;
  NSMutableDictionary *v14;
  NSMutableDictionary *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  NSObject *v20;
  int v21;
  id v22;
  __int16 v23;
  id v24;
  __int16 v25;
  id v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[BRCPQLConnection assertOnQueue](self->_db, "assertOnQueue");
  if (objc_msgSend(v6, "isDocument"))
  {
    objc_msgSend(v6, "asDocument");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }
  if (objc_msgSend(v8, "supportsServerSideAssetCopies"))
  {
    objc_msgSend(v6, "parentItemOnFS");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "markCrossZoneMovedForServerAssetCopyWithParentItem:path:", v9, 0);

    objc_msgSend(v8, "saveToDB");
  }
  else
  {
    if (!self->_itemIDsBlockedFromSyncForCZMProcessing)
    {
      v10 = (NSMutableSet *)objc_opt_new();
      itemIDsBlockedFromSyncForCZMProcessing = self->_itemIDsBlockedFromSyncForCZMProcessing;
      self->_itemIDsBlockedFromSyncForCZMProcessing = v10;

    }
    objc_msgSend(v6, "itemGlobalID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      itemsBlockedByAssociationForCZMProcessing = self->_itemsBlockedByAssociationForCZMProcessing;
      if (!itemsBlockedByAssociationForCZMProcessing)
      {
        v14 = (NSMutableDictionary *)objc_opt_new();
        v15 = self->_itemsBlockedByAssociationForCZMProcessing;
        self->_itemsBlockedByAssociationForCZMProcessing = v14;

        itemsBlockedByAssociationForCZMProcessing = self->_itemsBlockedByAssociationForCZMProcessing;
      }
      -[NSMutableDictionary objectForKeyedSubscript:](itemsBlockedByAssociationForCZMProcessing, "objectForKeyedSubscript:", v12);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_itemsBlockedByAssociationForCZMProcessing, "setObject:forKeyedSubscript:", v7, v12);
      -[NSMutableSet addObject:](self->_itemIDsBlockedFromSyncForCZMProcessing, "addObject:", v7);
      if (v16 && (objc_msgSend(v16, "isEqualToItemGlobalID:", v7) & 1) == 0)
      {
        brc_bread_crumbs();
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          v21 = 138413058;
          v22 = v6;
          v23 = 2112;
          v24 = v16;
          v25 = 2112;
          v26 = v7;
          v27 = 2112;
          v28 = v17;
          _os_log_impl(&dword_1CBD43000, v18, OS_LOG_TYPE_DEFAULT, "[WARNING] Strange... We have multiple levels of associated item IDs for %@ - (%@ vs %@)%@", (uint8_t *)&v21, 0x2Au);
        }

        -[BRCClientZone _removeItemFromCZMProcessingIfNotAssociated:](self, "_removeItemFromCZMProcessingIfNotAssociated:", v16);
      }

    }
    if ((-[NSMutableSet containsObject:](self->_itemIDsBlockedFromSyncForCZMProcessing, "containsObject:", v12) & 1) == 0)
    {
      brc_bread_crumbs();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        v21 = 138412802;
        v22 = v6;
        v23 = 2112;
        v24 = v7;
        v25 = 2112;
        v26 = v19;
        _os_log_impl(&dword_1CBD43000, v20, OS_LOG_TYPE_DEFAULT, "[WARNING] An item moved into this zone and needs to be downloaded for czm %@. (reparented root item %@)%@", (uint8_t *)&v21, 0x20u);
      }

      -[NSMutableSet addObject:](self->_itemIDsBlockedFromSyncForCZMProcessing, "addObject:", v12);
      -[BRCClientZone _startDownloadingItemForCrossZoneMoveIfNecessary:](self, "_startDownloadingItemForCrossZoneMoveIfNecessary:", v6);
    }

  }
}

- (void)waitForCrossZoneMoveProcessingWithCompletion:(id)a3
{
  NSMutableArray *blocksWaitingOnCrossZoneMoveProcessing;
  NSMutableArray *v5;
  NSMutableArray *v6;
  void *v7;
  void (**v8)(void);

  v8 = (void (**)(void))a3;
  -[BRCPQLConnection assertOnQueue](self->_db, "assertOnQueue");
  if (-[NSMutableSet count](self->_itemIDsBlockedFromSyncForCZMProcessing, "count"))
  {
    blocksWaitingOnCrossZoneMoveProcessing = self->_blocksWaitingOnCrossZoneMoveProcessing;
    if (!blocksWaitingOnCrossZoneMoveProcessing)
    {
      v5 = (NSMutableArray *)objc_opt_new();
      v6 = self->_blocksWaitingOnCrossZoneMoveProcessing;
      self->_blocksWaitingOnCrossZoneMoveProcessing = v5;

      blocksWaitingOnCrossZoneMoveProcessing = self->_blocksWaitingOnCrossZoneMoveProcessing;
    }
    v7 = (void *)MEMORY[0x1D17A6DB0](v8);
    -[NSMutableArray addObject:](blocksWaitingOnCrossZoneMoveProcessing, "addObject:", v7);

  }
  else
  {
    v8[2]();
  }

}

- (id)reservedItemByParentID:(id)a3 andLogicalName:(id)a4
{
  return -[BRCClientZone reservedItemByParentID:andLogicalName:db:](self, "reservedItemByParentID:andLogicalName:db:", a3, a4, self->_db);
}

- (id)reservedItemByParentID:(id)a3 andLogicalName:(id)a4 db:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  id v15;
  void *v16;
  BRCZoneRowID *dbRowID;
  void *v19;
  NSObject *v20;
  _QWORD v21[5];
  id v22;
  uint8_t buf[4];
  id v24;
  __int16 v25;
  id v26;
  __int16 v27;
  BRCZoneRowID *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (_CFURLIsPromiseName())
  {
    brc_bread_crumbs();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
      -[BRCClientZone(LegacyAdditions) reservedItemByParentID:andLogicalName:db:].cold.1();

  }
  v11 = (void *)objc_msgSend(v10, "fetch:", CFSTR("SELECT rowid, zone_rowid, item_id, item_creator_id, item_sharing_options, item_side_car_ckinfo, item_parent_zone_rowid, item_localsyncupstate, item_local_diffs, item_notifs_rank, app_library_rowid, item_min_supported_os_rowid, item_user_visible, item_stat_ckinfo, item_state, item_type, item_mode, item_birthtime, item_lastusedtime, item_favoriterank,item_parent_id, item_filename, item_hidden_ext, item_finder_tags, item_xattr_signature, item_trash_put_back_path, item_trash_put_back_parent_id, item_alias_target, item_creator, item_doc_id, item_file_id, item_generation, item_localname, item_processing_stamp, item_staged_file_id, item_staged_generation, item_bouncedname, item_scope, item_tmpbounceno, version_name, version_ckinfo, version_mtime, version_size, version_thumb_size, version_thumb_signature, version_content_signature, version_xattr_signature, version_edited_since_shared, version_device, version_conflict_loser_etags, version_quarantine_info, version_uploaded_assets, version_upload_error, version_old_zone_item_id, version_old_zone_rowid, desired_version, item_live_conflict_loser_etags, item_thumb_live_signature, item_thumb_greedy, version_block_sync_until_bundle_id, version_block_sync_until_timestamp FROM client_items WHERE(item_parent_id = %@ AND item_filename = %@ AND +item_state = -2 AND item_parent_zone_rowid = %@ AND item_bouncedname IS NULL) OR(item_parent_id = %@ AND item_bouncedname = %@ AND +item_state = -2 AND item_parent_zone_rowid = %@)"), v8, v9, self->_dbRowID, v8, v9, self->_dbRowID);
  if ((objc_msgSend(v11, "next") & 1) != 0)
  {
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __75__BRCClientZone_LegacyAdditions__reservedItemByParentID_andLogicalName_db___block_invoke;
    v21[3] = &unk_1E875E310;
    v21[4] = self;
    v22 = v10;
    objc_msgSend(v11, "object:", v21);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "next"))
    {
      brc_bread_crumbs();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      {
        dbRowID = self->_dbRowID;
        *(_DWORD *)buf = 138413058;
        v24 = v8;
        v25 = 2112;
        v26 = v9;
        v27 = 2112;
        v28 = dbRowID;
        v29 = 2112;
        v30 = v13;
        _os_log_fault_impl(&dword_1CBD43000, v14, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: there should never be more than one match for that query (parentID: %@, name: %@, parentZoneID: %@)%@", buf, 0x2Au);
      }

    }
    objc_msgSend(v11, "close");
    v15 = v12;

    v16 = v15;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithSqliteCode:andMessage:", 12, CFSTR("item not found"));
    v15 = (id)objc_claimAutoreleasedReturnValue();
    -[BRCPQLConnection setLastError:](self->_db, "setLastError:", v15);
    v16 = 0;
  }

  return v16;
}

id __75__BRCClientZone_LegacyAdditions__reservedItemByParentID_andLogicalName_db___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;

  v5 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(v5, "session");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "newLocalItemFromPQLResultSet:db:error:", v6, *(_QWORD *)(a1 + 40), a3);

  return v8;
}

- (id)faultByParentID:(id)a3 andLogicalName:(id)a4
{
  return -[BRCClientZone faultByParentID:andLogicalName:db:](self, "faultByParentID:andLogicalName:db:", a3, a4, self->_db);
}

- (id)faultByParentID:(id)a3 andLogicalName:(id)a4 db:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  BRCZoneRowID *dbRowID;
  void *v18;
  NSObject *v19;
  _QWORD v20[5];
  id v21;
  uint8_t buf[4];
  id v23;
  __int16 v24;
  id v25;
  __int16 v26;
  BRCZoneRowID *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (_CFURLIsPromiseName())
  {
    brc_bread_crumbs();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
      -[BRCClientZone(LegacyAdditions) reservedItemByParentID:andLogicalName:db:].cold.1();

  }
  v11 = (void *)objc_msgSend(v10, "fetch:", CFSTR("SELECT rowid, zone_rowid, item_id, item_creator_id, item_sharing_options, item_side_car_ckinfo, item_parent_zone_rowid, item_localsyncupstate, item_local_diffs, item_notifs_rank, app_library_rowid, item_min_supported_os_rowid, item_user_visible, item_stat_ckinfo, item_state, item_type, item_mode, item_birthtime, item_lastusedtime, item_favoriterank,item_parent_id, item_filename, item_hidden_ext, item_finder_tags, item_xattr_signature, item_trash_put_back_path, item_trash_put_back_parent_id, item_alias_target, item_creator, item_doc_id, item_file_id, item_generation, item_localname, item_processing_stamp, item_staged_file_id, item_staged_generation, item_bouncedname, item_scope, item_tmpbounceno, version_name, version_ckinfo, version_mtime, version_size, version_thumb_size, version_thumb_signature, version_content_signature, version_xattr_signature, version_edited_since_shared, version_device, version_conflict_loser_etags, version_quarantine_info, version_uploaded_assets, version_upload_error, version_old_zone_item_id, version_old_zone_rowid, desired_version, item_live_conflict_loser_etags, item_thumb_live_signature, item_thumb_greedy, version_block_sync_until_bundle_id, version_block_sync_until_timestamp FROM client_items WHERE(item_parent_id = %@ AND item_filename = %@ AND +item_state != -2 AND +item_type IN (2, 7, 8) AND item_parent_zone_rowid = %@ AND item_bouncedname IS NULL) OR(item_parent_id = %@ AND item_bouncedname = %@ AND +item_state != -2 AND +item_type IN (2, 7, 8) AND item_parent_zone_rowid = %@)"), v8, v9, self->_dbRowID, v8, v9, self->_dbRowID);
  if ((objc_msgSend(v11, "next") & 1) != 0)
  {
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __68__BRCClientZone_LegacyAdditions__faultByParentID_andLogicalName_db___block_invoke;
    v20[3] = &unk_1E875E310;
    v20[4] = self;
    v21 = v10;
    objc_msgSend(v11, "object:", v20);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "next"))
    {
      brc_bread_crumbs();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      {
        dbRowID = self->_dbRowID;
        *(_DWORD *)buf = 138413058;
        v23 = v8;
        v24 = 2112;
        v25 = v9;
        v26 = 2112;
        v27 = dbRowID;
        v28 = 2112;
        v29 = v13;
        _os_log_fault_impl(&dword_1CBD43000, v14, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: there should never be more than one match for that query (parentID: %@, name: %@, parentZoneID: %@)%@", buf, 0x2Au);
      }

    }
    objc_msgSend(v11, "close");
    objc_msgSend(v12, "asDocument");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithSqliteCode:andMessage:", 12, CFSTR("item not found"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setLastError:", v12);
    v15 = 0;
  }

  return v15;
}

id __68__BRCClientZone_LegacyAdditions__faultByParentID_andLogicalName_db___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;

  v5 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(v5, "session");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "newLocalItemFromPQLResultSet:db:error:", v6, *(_QWORD *)(a1 + 40), a3);

  return v8;
}

- (id)faultByParentID:(id)a3 andPhysicalName:(id)a4
{
  return -[BRCClientZone faultByParentID:andPhysicalName:db:](self, "faultByParentID:andPhysicalName:db:", a3, a4, self->_db);
}

- (id)faultByParentID:(id)a3 andPhysicalName:(id)a4 db:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  BRCZoneRowID *dbRowID;
  void *v18;
  NSObject *v19;
  _QWORD v20[5];
  id v21;
  uint8_t buf[4];
  id v23;
  __int16 v24;
  id v25;
  __int16 v26;
  BRCZoneRowID *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!_CFURLIsPromiseName())
  {
    brc_bread_crumbs();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
      -[BRCClientZone(LegacyAdditions) faultByParentID:andPhysicalName:db:].cold.1();

  }
  v11 = (void *)objc_msgSend(v10, "fetch:", CFSTR("SELECT rowid, zone_rowid, item_id, item_creator_id, item_sharing_options, item_side_car_ckinfo, item_parent_zone_rowid, item_localsyncupstate, item_local_diffs, item_notifs_rank, app_library_rowid, item_min_supported_os_rowid, item_user_visible, item_stat_ckinfo, item_state, item_type, item_mode, item_birthtime, item_lastusedtime, item_favoriterank,item_parent_id, item_filename, item_hidden_ext, item_finder_tags, item_xattr_signature, item_trash_put_back_path, item_trash_put_back_parent_id, item_alias_target, item_creator, item_doc_id, item_file_id, item_generation, item_localname, item_processing_stamp, item_staged_file_id, item_staged_generation, item_bouncedname, item_scope, item_tmpbounceno, version_name, version_ckinfo, version_mtime, version_size, version_thumb_size, version_thumb_signature, version_content_signature, version_xattr_signature, version_edited_since_shared, version_device, version_conflict_loser_etags, version_quarantine_info, version_uploaded_assets, version_upload_error, version_old_zone_item_id, version_old_zone_rowid, desired_version, item_live_conflict_loser_etags, item_thumb_live_signature, item_thumb_greedy, version_block_sync_until_bundle_id, version_block_sync_until_timestamp FROM client_items WHERE(item_parent_id = %@ AND item_localname = %@ AND +item_state != -2 AND +item_type IN (2, 7, 8) AND item_parent_zone_rowid = %@)"), v8, v9, self->_dbRowID);
  if ((objc_msgSend(v11, "next") & 1) != 0)
  {
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __69__BRCClientZone_LegacyAdditions__faultByParentID_andPhysicalName_db___block_invoke;
    v20[3] = &unk_1E875E310;
    v20[4] = self;
    v21 = v10;
    objc_msgSend(v11, "object:", v20);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "next"))
    {
      brc_bread_crumbs();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      {
        dbRowID = self->_dbRowID;
        *(_DWORD *)buf = 138413058;
        v23 = v8;
        v24 = 2112;
        v25 = v9;
        v26 = 2112;
        v27 = dbRowID;
        v28 = 2112;
        v29 = v13;
        _os_log_fault_impl(&dword_1CBD43000, v14, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: there should never be more than one match for that query (parentID: %@, name: %@, parentZoneID: %@)%@", buf, 0x2Au);
      }

    }
    objc_msgSend(v11, "close");
    objc_msgSend(v12, "asDocument");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithSqliteCode:andMessage:", 12, CFSTR("item not found"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setLastError:", v12);
    v15 = 0;
  }

  return v15;
}

id __69__BRCClientZone_LegacyAdditions__faultByParentID_andPhysicalName_db___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;

  v5 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(v5, "session");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "newLocalItemFromPQLResultSet:db:error:", v6, *(_QWORD *)(a1 + 40), a3);

  return v8;
}

void __63__BRCClientZone_BRCZoneReset__scheduleReset_completionHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: !self->_resetTimer%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __63__BRCClientZone_BRCZoneReset__scheduleReset_completionHandler___block_invoke_cold_2(int a1, uint64_t a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 67109378;
  *((_DWORD *)buf + 1) = a1;
  *((_WORD *)buf + 4) = 2112;
  *(_QWORD *)(buf + 10) = a2;
  _os_log_debug_impl(&dword_1CBD43000, log, OS_LOG_TYPE_DEBUG, "[DEBUG] waiting for %u cancelled operations to finish%@", buf, 0x12u);
}

void __63__BRCClientZone_BRCZoneReset__scheduleReset_completionHandler___block_invoke_5_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_11_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] ┳%llx continuing reset%@");
  OUTLINED_FUNCTION_2();
}

void __73__BRCClientZone_BRCZoneReset___removeTargetedAliasesWithCompletionBlock___block_invoke_8_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: self->_resetTimer == nil%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __61__BRCClientZone_BRCZoneReset___resetAndDeleteServerTruthData__block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] deleting from server truth for %@%@");
  OUTLINED_FUNCTION_2();
}

void __92__BRCClientZone_BRCZoneReset___performResetAndWantsUnlink_clientTruthBlock_completionBlock___block_invoke_2_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] Keeping client items during reset%s%@");
  OUTLINED_FUNCTION_2();
}

void __92__BRCClientZone_BRCZoneReset___performResetAndWantsUnlink_clientTruthBlock_completionBlock___block_invoke_2_cold_2(uint64_t a1)
{
  NSObject *v1;
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412546;
  v3 = a1;
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_1CBD43000, v1, (uint64_t)v1, "[ERROR] Received the following error while doing the post hard reset phase - %@%@", (uint8_t *)&v2);
  OUTLINED_FUNCTION_2();
}

void __92__BRCClientZone_BRCZoneReset___performResetAndWantsUnlink_clientTruthBlock_completionBlock___block_invoke_2_cold_3(uint64_t a1)
{
  NSObject *v1;
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412546;
  v3 = a1;
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_1CBD43000, v1, (uint64_t)v1, "[ERROR] Received the following error while doing the hard reset phase - %@%@", (uint8_t *)&v2);
  OUTLINED_FUNCTION_2();
}

void __92__BRCClientZone_BRCZoneReset___performResetAndWantsUnlink_clientTruthBlock_completionBlock___block_invoke_2_cold_4()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_11_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] deleting from client truth for %@%@");
  OUTLINED_FUNCTION_2();
}

void __91__BRCClientZone_BRCZoneReset___performAfterResetServerAndClientPrivateTruthsAndUnlinkData___block_invoke_cold_1(uint64_t a1)
{
  NSObject *v1;
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412546;
  v3 = a1;
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_1CBD43000, v1, (uint64_t)v1, "[ERROR] Failed acquiring coordinated deletions - %@%@", (uint8_t *)&v2);
  OUTLINED_FUNCTION_2();
}

void __91__BRCClientZone_BRCZoneReset___performAfterResetServerAndClientPrivateTruthsAndUnlinkData___block_invoke_cold_2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_11_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] ┳%llx acquired coordinated disconnects%@");
  OUTLINED_FUNCTION_2();
}

void __91__BRCClientZone_BRCZoneReset___performAfterResetServerAndClientPrivateTruthsAndUnlinkData___block_invoke_37_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] disconnecting %@ on disk%@");
  OUTLINED_FUNCTION_2();
}

- (void)asPrivateClientZone
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] UNREACHABLE: -asPrivateClientZone called on a shared zone%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)asSharedClientZone
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] UNREACHABLE: -asSharedClientZone called on a private zone%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)rootItemID
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] UNREACHABLE: must be implemented in subclass%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)setNeedsSave:(uint64_t)a1 .cold.1(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v1, v2, "[DEBUG] container state now needs flush: %@%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_2();
}

- (void)updateWithPlist:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: _syncUpBudget && _syncUpThrottle && _syncDownThrottle%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)scheduleResetServerAndClientTruthsForReason:(uint64_t)a1 completionHandler:.cold.1(uint64_t a1)
{
  NSObject *v1;
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412546;
  v3 = a1;
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4_2(&dword_1CBD43000, v1, (uint64_t)v1, "[CRIT] UNREACHABLE: Container needs server and client truths reset: %@%@", (uint8_t *)&v2);
  OUTLINED_FUNCTION_2();
}

- (void)sizeOfItemsNeedingSyncUpOrUploadAndReturnError:(uint64_t)a1 .cold.1(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v1, v2, "[DEBUG] shared iPad: Not considering %@ for sync bubble tasks because sync is blocked%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_2();
}

- (void)setSyncStateBits:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_1(&dword_1CBD43000, v0, v1, "[DEBUG] Asking for sync up but we never synced down, do that first%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)setSyncStateBits:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_1(&dword_1CBD43000, v0, v1, "[DEBUG] Ignoring sync state change because sync is disabled for this container%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __39__BRCClientZone_addOutOfBandOperation___block_invoke_2_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  OUTLINED_FUNCTION_11_0(*MEMORY[0x1E0C80C00]);
  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v1, v2, "[DEBUG] added %@ as out of band sync operation%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_2();
}

void __42__BRCClientZone_removeOutOfBandOperation___block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  OUTLINED_FUNCTION_11_0(*MEMORY[0x1E0C80C00]);
  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v1, v2, "[DEBUG] removed %@ out of band sync operation%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_2();
}

- (void)syncDownImmediately
{
  uint64_t v0;
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  OUTLINED_FUNCTION_11_0(*MEMORY[0x1E0C80C00]);
  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v1, v2, "[DEBUG] Sync: updated sync-down throttle: %@%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_2();
}

void __27__BRCClientZone__startSync__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint8_t v3[24];
  uint64_t v4;

  OUTLINED_FUNCTION_9_0();
  v4 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)v1 + 104), "cost");
  OUTLINED_FUNCTION_17_0();
  OUTLINED_FUNCTION_3_2(&dword_1CBD43000, v0, v2, "[DEBUG] Sync: starting sync up with cost:%.1f%@", v3);
  OUTLINED_FUNCTION_3_0();
}

void __27__BRCClientZone__startSync__block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_1(&dword_1CBD43000, v0, v1, "[DEBUG] Sync: nothing to sync up%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __27__BRCClientZone__startSync__block_invoke_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint8_t v3[24];

  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_18_0(v1);
  brc_interval_from_nsec();
  OUTLINED_FUNCTION_17_0();
  OUTLINED_FUNCTION_3_2(&dword_1CBD43000, v0, v2, "[DEBUG] Sync: items to sync-up are throttled for another %.1fs%@", v3);
  OUTLINED_FUNCTION_3_0();
}

void __27__BRCClientZone__startSync__block_invoke_149_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] UNREACHABLE: Forcing cancel on sync op%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __27__BRCClientZone__startSync__block_invoke_149_cold_2(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v1, v2, "[DEBUG] Executing cancelled op %@ so operations waiting on it can proceed%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_2();
}

void __71__BRCClientZone_learnCKInfosFromSavedRecords_isOutOfBandModifyRecords___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: argc == 2%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __71__BRCClientZone_learnCKInfosFromSavedRecords_isOutOfBandModifyRecords___block_invoke_152_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_1(&dword_1CBD43000, v0, v1, "[DEBUG] Located ckinfo in previous zone%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_syncUpOfRecords:(uint64_t)a1 createdAppLibraryNames:didFinishWithError:errorWasOnPCSChainedItem:throttledItemInBatch:.cold.1(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 134218242;
  *(_QWORD *)((char *)&v3 + 4) = *(_QWORD *)(a1 + 488);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v1, v2, "[DEBUG] Sync: requestID:%llu succeeded%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_2();
}

- (void)_syncUpOfRecords:(uint64_t)a1 createdAppLibraryNames:didFinishWithError:errorWasOnPCSChainedItem:throttledItemInBatch:.cold.2(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 134218242;
  *(_QWORD *)((char *)&v3 + 4) = *(_QWORD *)(a1 + 488);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v1, v2, "[DEBUG] Sync: requestID:%llu cancelled%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_2();
}

- (void)_syncUpOfRecords:createdAppLibraryNames:didFinishWithError:errorWasOnPCSChainedItem:throttledItemInBatch:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_1(&dword_1CBD43000, v0, v1, "[DEBUG] decreasing sync-up batch size since server says we exceeded limits%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_isIdle
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v1, v2, "[DEBUG] %@ isn't idle because it's busy%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_2();
}

void __48__BRCClientZone_notifyClient_afterNextSyncDown___block_invoke_cold_1(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = *(_QWORD *)(a1 + 32);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v1, v2, "[DEBUG] Queueing sync barrier sync down for %@%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_2();
}

void __39__BRCClientZone_notifyClient_whenIdle___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_1(&dword_1CBD43000, v0, v1, "[DEBUG] Client zone is already idle%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __39__BRCClientZone_notifyClient_whenIdle___block_invoke_182_cold_1(uint64_t a1)
{
  NSObject *v1;
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412546;
  v3 = a1;
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_1CBD43000, v1, (uint64_t)v1, "[ERROR] won't restore persona: %@%@", (uint8_t *)&v2);
  OUTLINED_FUNCTION_2();
}

void __39__BRCClientZone_notifyClient_whenIdle___block_invoke_188_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  OUTLINED_FUNCTION_11_0(*MEMORY[0x1E0C80C00]);
  LODWORD(v3) = 134218242;
  *(_QWORD *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v1, v2, "[DEBUG] ┏%llx received did-update-has-work notification%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_2();
}

void __61__BRCClientZone_syncDownOperation_didFinishWithError_status___block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;

  OUTLINED_FUNCTION_11_0(*MEMORY[0x1E0C80C00]);
  v1 = *(_QWORD *)(v0 + 176);
  v4 = 138412802;
  v5 = v1;
  v6 = 2112;
  v7 = v0;
  v8 = 2112;
  v9 = v2;
  OUTLINED_FUNCTION_8_1(&dword_1CBD43000, v3, (uint64_t)v3, "[DEBUG] Sync: updated sync-down throttle: %@\n      and container state: %@%@", (uint8_t *)&v4);
}

void __61__BRCClientZone_syncDownOperation_didFinishWithError_status___block_invoke_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  OUTLINED_FUNCTION_11_0(*MEMORY[0x1E0C80C00]);
  LODWORD(v3) = 134218242;
  *(_QWORD *)((char *)&v3 + 4) = *(_QWORD *)(v0 + 136);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v1, v2, "[DEBUG] Not resuming sync token because %p is still in flight%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_2();
}

- (void)didSyncDownRequestID:maxApplyRank:caughtUpWithServer:syncDownDate:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] Sync: requestID:%llu acknowledged%@");
  OUTLINED_FUNCTION_2();
}

- (void)didSyncDownRequestID:maxApplyRank:caughtUpWithServer:syncDownDate:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] Sync: just a new sync down without new sync up since requestID:%llu%@");
  OUTLINED_FUNCTION_2();
}

- (void)didSyncDownRequestID:maxApplyRank:caughtUpWithServer:syncDownDate:.cold.3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] Updated %llu items to strip the oob-sync-ack bit%@");
  OUTLINED_FUNCTION_2();
}

- (void)didSyncDownRequestID:maxApplyRank:caughtUpWithServer:syncDownDate:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: _requestID == 0 || requestID <= _requestID%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_crossZoneMoveDocumentsToZone:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] UNREACHABLE: Not cross zone moving a zone to itself%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __47__BRCClientZone__crossZoneMoveDocumentsToZone___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint8_t v4[24];

  OUTLINED_FUNCTION_9_0();
  objc_msgSend((id)OUTLINED_FUNCTION_18_0(v1), "lastError");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3(&dword_1CBD43000, v0, v3, "[ERROR] can't save destination zone: %@%@", v4);

  OUTLINED_FUNCTION_6();
}

void __47__BRCClientZone__crossZoneMoveDocumentsToZone___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint8_t v4[24];

  OUTLINED_FUNCTION_9_0();
  objc_msgSend((id)OUTLINED_FUNCTION_18_0(v1), "lastError");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3(&dword_1CBD43000, v0, v3, "[ERROR] can't save cross zone move state: %@%@", v4);

  OUTLINED_FUNCTION_6();
}

void __47__BRCClientZone__crossZoneMoveDocumentsToZone___block_invoke_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint8_t v4[24];

  OUTLINED_FUNCTION_9_0();
  objc_msgSend((id)OUTLINED_FUNCTION_18_0(v1), "lastError");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_4_2(&dword_1CBD43000, v0, v3, "[CRIT] UNREACHABLE: can't cross move items! %@%@", v4);

  OUTLINED_FUNCTION_6();
}

void __47__BRCClientZone__crossZoneMoveDocumentsToZone___block_invoke_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: db.changes == 0%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __47__BRCClientZone__crossZoneMoveDocumentsToZone___block_invoke_cold_7()
{
  NSObject *v0;
  id v1;
  void *v2;
  uint64_t v3;
  uint8_t v4[24];
  uint64_t v5;

  OUTLINED_FUNCTION_9_0();
  v5 = *MEMORY[0x1E0C80C00];
  objc_msgSend(v1, "error");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_4_2(&dword_1CBD43000, v0, v3, "[CRIT] UNREACHABLE: can't prepare cross move items! %@%@", v4);

  OUTLINED_FUNCTION_6();
}

- (void)_allItemsDidUploadWithError:(uint64_t)a1 .cold.1(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v1, v2, "[DEBUG] shared iPad: Completed upload for all items for %@%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_2();
}

- (void)_allItemsDidUploadWithError:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: self._hasAllItemsDidUploadHandlers%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __37__BRCClientZone_didGCTombstoneRanks___block_invoke_cold_1(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = *(_QWORD *)(a1 + 40);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v1, v2, "[DEBUG] Tombstones with ranks are gone: %@%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_2();
}

- (void)didApplyTombstoneForRank:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] Marking tombstone rank %llu as applied%@");
  OUTLINED_FUNCTION_2();
}

- (void)_registerOperation:(uint64_t)a1 throttler:.cold.1(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v1, v2, "[DEBUG] Blocking server stitching op %@ until we fetch the initial change token%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_2();
}

- (void)_registerOperation:throttler:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_1(&dword_1CBD43000, v0, v1, "[DEBUG] The server zone hasn't been created yet so failing the operation right away%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_registerOperation:throttler:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_1(&dword_1CBD43000, v0, v1, "[DEBUG] op has priority over the sync down op so cancelling sync down and rescheduling%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_registerListOperation:(uint64_t)a1 shareAcceptOperation:.cold.1(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v1, v2, "[DEBUG] Blocking list on share accept %@%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_2();
}

- (void)_registerListOperation:shareAcceptOperation:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  int v6;
  uint64_t v7;
  const char *v8;
  int v9;
  void *v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  OUTLINED_FUNCTION_9_0();
  v3 = v2;
  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(v2, "folderToList");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "debugItemIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v3, "nonDiscretionary");
  v8 = "";
  v9 = 138412802;
  v10 = v5;
  if (v6)
    v8 = "non-";
  v11 = 2080;
  v12 = v8;
  v13 = 2112;
  v14 = v1;
  OUTLINED_FUNCTION_8_1(&dword_1CBD43000, v0, v7, "[DEBUG] Starting to list the contents of %@ (%sdiscretionary)%@", (uint8_t *)&v9);

}

- (void)_registerFetchParentChainOperation:(uint64_t)a1 .cold.1(uint64_t a1)
{
  NSObject *v1;
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412546;
  v3 = a1;
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4_2(&dword_1CBD43000, v1, (uint64_t)v1, "[CRIT] UNREACHABLE: unexpected nil parent itemID from operation %@%@", (uint8_t *)&v2);
  OUTLINED_FUNCTION_2();
}

- (void)_registerFetchParentChainOperation:(uint64_t)a1 .cold.2(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v1, v2, "[DEBUG] Starting to fetch parent chain of %@%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_2();
}

- (void)_registerLocateRecordOperation:(uint64_t)a1 .cold.1(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v1, v2, "[DEBUG] Starting to locate record for %@%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_2();
}

- (void)_isSideSyncOperationBlockedWithName:(uint64_t)a1 isWaitingOnShareAccept:.cold.1(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v1, v2, "[DEBUG] Can't %@ when not activated%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_2();
}

- (void)_isSideSyncOperationBlockedWithName:(uint64_t)a1 isWaitingOnShareAccept:.cold.2(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v1, v2, "[DEBUG] Can't %@ when sync needs os upgrade%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_2();
}

- (void)_isSideSyncOperationBlockedWithName:(uint64_t)a1 isWaitingOnShareAccept:.cold.3(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v1, v2, "[DEBUG] Can't %@ when the zone doesn't exist%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_2();
}

- (void)_isSideSyncOperationBlockedWithName:(uint64_t)a1 isWaitingOnShareAccept:.cold.4(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v1, v2, "[DEBUG] Can't %@ when resetting%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_2();
}

- (void)fetchDirectoryContentsIfNecessary:isUserWaiting:rescheduleApplyScheduler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] UNREACHABLE: no itemID passed to this list operation%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)fetchDirectoryContentsIfNecessary:(void *)a1 isUserWaiting:(uint64_t)a2 rescheduleApplyScheduler:(NSObject *)a3 .cold.2(void *a1, uint64_t a2, NSObject *a3)
{
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "debugItemIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7_2();
  OUTLINED_FUNCTION_3_2(&dword_1CBD43000, a3, v5, "[DEBUG] Can't list %@ because it had failed previously%@", v6);

  OUTLINED_FUNCTION_6();
}

- (void)fetchDirectoryContentsIfNecessary:(uint64_t)a1 isUserWaiting:rescheduleApplyScheduler:.cold.3(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v1, v2, "[DEBUG] Cancelling operation %@ because it is discretionary and we have non-discretionary work%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_2();
}

- (void)fetchDirectoryContentsIfNecessary:(void *)a1 isUserWaiting:(uint64_t)a2 rescheduleApplyScheduler:(NSObject *)a3 .cold.4(void *a1, uint64_t a2, NSObject *a3)
{
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "debugItemIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7_2();
  OUTLINED_FUNCTION_3_2(&dword_1CBD43000, a3, v5, "[DEBUG] Can't list changes on %@ when we have already completed full sync%@", v6);

  OUTLINED_FUNCTION_6();
}

- (void)fetchRecursiveDirectoryContentsIfNecessary:isUserWaiting:rescheduleApply:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] UNREACHABLE: no itemID passed to this recursive list operation%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)fetchRecursiveDirectoryContentsIfNecessary:(void *)a1 isUserWaiting:(uint64_t)a2 rescheduleApply:(NSObject *)a3 .cold.2(void *a1, uint64_t a2, NSObject *a3)
{
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "debugItemIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7_2();
  OUTLINED_FUNCTION_3_2(&dword_1CBD43000, a3, v5, "[DEBUG] Continue to recursive list the contents of %@%@", v6);

  OUTLINED_FUNCTION_6();
}

- (void)fetchRecursiveDirectoryContentsIfNecessary:(void *)a1 isUserWaiting:(uint64_t)a2 rescheduleApply:(uint64_t)a3 .cold.3(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint8_t *v5;
  NSObject *v6;

  OUTLINED_FUNCTION_10((uint64_t)a1, a2, a3, 5.778e-34);
  OUTLINED_FUNCTION_3_2(&dword_1CBD43000, v6, v4, "[DEBUG] Starting to recursive list the contents of %@%@", v5);

}

- (void)fetchRecursiveDirectoryContentsIfNecessary:(void *)a1 isUserWaiting:(uint64_t)a2 rescheduleApply:(uint64_t)a3 .cold.4(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint8_t *v5;
  NSObject *v6;

  OUTLINED_FUNCTION_10((uint64_t)a1, a2, a3, 5.778e-34);
  OUTLINED_FUNCTION_3_2(&dword_1CBD43000, v6, v4, "[DEBUG] Forcing %@ to list all changes because we cancelled an old version%@", v5);

}

- (void)fetchRecursiveDirectoryContentsIfNecessary:(uint64_t)a1 isUserWaiting:rescheduleApply:.cold.5(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v1, v2, "[DEBUG] We've completed full sync so just recursively rescheduling items under %@%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_2();
}

- (void)fetchParentChainIfNecessaryWithParentItemID:isUserWaiting:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] UNREACHABLE: no itemID passed to this parent chain%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)locateRecordIfNecessaryForRecordID:isUserWaiting:maxOperationBackoff:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] UNREACHABLE: no recordID passed to this locate operation%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)locateRecordIfNecessaryForRecordID:isUserWaiting:maxOperationBackoff:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] UNREACHABLE: Can't locate share alias record in a shared zone%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)fetchRecentAndFavoriteDocuments:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  OUTLINED_FUNCTION_15_1(*MEMORY[0x1E0C80C00]);
  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v1, v2, "[DEBUG] Zone doesn't exist so already have recent documents in %@%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_2();
}

- (void)fetchRecentAndFavoriteDocuments:.cold.2()
{
  uint64_t v0;
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  OUTLINED_FUNCTION_15_1(*MEMORY[0x1E0C80C00]);
  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v1, v2, "[DEBUG] Already fetched recent and favorite documents in %@%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_2();
}

- (void)fetchRecentAndFavoriteDocuments:.cold.3()
{
  uint64_t v0;
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  OUTLINED_FUNCTION_15_1(*MEMORY[0x1E0C80C00]);
  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v1, v2, "[DEBUG] Not fetching recents on a shared zone %@%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_2();
}

- (void)fetchRecentAndFavoriteDocuments:.cold.4()
{
  uint64_t v0;
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  OUTLINED_FUNCTION_11_0(*MEMORY[0x1E0C80C00]);
  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v1, v2, "[DEBUG] Staring to fetch recent documents %@%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_2();
}

- (void)fetchRecentAndFavoriteDocuments:.cold.5()
{
  uint64_t v0;
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  OUTLINED_FUNCTION_15_1(*MEMORY[0x1E0C80C00]);
  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v1, v2, "[DEBUG] Not fetching recents on a non-public zone %@%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_2();
}

- (void)fetchRecentAndFavoriteDocuments:.cold.6()
{
  uint64_t v0;
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  OUTLINED_FUNCTION_15_1(*MEMORY[0x1E0C80C00]);
  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v1, v2, "[DEBUG] Completed full sync so already have recent documents in %@%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_2();
}

- (void)fetchRecentAndFavoriteDocuments:(uint64_t)a1 .cold.7(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = *(_QWORD *)(a1 + 216);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v1, v2, "[DEBUG] _fetchRecentsOperation %@ is already running, will invoke the operation again after it finishes%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_2();
}

- (void)fetchRecentAndFavoriteDocuments:.cold.8()
{
  uint64_t v0;
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  OUTLINED_FUNCTION_15_1(*MEMORY[0x1E0C80C00]);
  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v1, v2, "[DEBUG] Already fetching recent documents in %@%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_2();
}

void __59__BRCClientZone_performBlock_whenItemWithRecordIDIsOnDisk___block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  OUTLINED_FUNCTION_11_0(*MEMORY[0x1E0C80C00]);
  LODWORD(v3) = 134218242;
  *(_QWORD *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v1, v2, "[DEBUG] ┳%llx done waiting for item to be on disk%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_2();
}

void __59__BRCClientZone_performBlock_whenItemWithRecordIDIsOnDisk___block_invoke_361_cold_1(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v1, v2, "[DEBUG] Could not locate lost item %@%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_2();
}

void __59__BRCClientZone_performBlock_whenItemWithRecordIDIsOnDisk___block_invoke_361_cold_2(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v1, v2, "[DEBUG] Lost item %@ is available%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_2();
}

void __59__BRCClientZone_performBlock_whenItemWithRecordIDIsOnDisk___block_invoke_361_cold_3(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v1, v2, "[DEBUG] Item %@ already available%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_2();
}

void __57__BRCClientZone_performBlock_whenItemWithIDIsDownloaded___block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  OUTLINED_FUNCTION_11_0(*MEMORY[0x1E0C80C00]);
  LODWORD(v3) = 134218242;
  *(_QWORD *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v1, v2, "[DEBUG] ┳%llx done waiting for item to be downloaded%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_2();
}

void __57__BRCClientZone_performBlock_whenItemWithIDIsDownloaded___block_invoke_365_cold_1(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v1, v2, "[DEBUG] Item %@ already downloaded%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_2();
}

void __57__BRCClientZone_performBlock_whenItemWithIDIsDownloaded___block_invoke_365_cold_2(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v1, v2, "[DEBUG] network is unreachable. Not waiting on download of %@%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_2();
}

- (void)_shouldFailSyncDownWaitImmediately
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v1, v2, "[DEBUG] network is unreachable. Not waiting on sync down of %@%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_2();
}

void __68__BRCClientZone_performBlock_whenSyncDownCompletesLookingForItemID___block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  OUTLINED_FUNCTION_11_0(*MEMORY[0x1E0C80C00]);
  LODWORD(v3) = 134218242;
  *(_QWORD *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v1, v2, "[DEBUG] ┳%llx done waiting for sync down to complete on first try%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_2();
}

void __68__BRCClientZone_performBlock_whenSyncDownCompletesLookingForItemID___block_invoke_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  OUTLINED_FUNCTION_11_0(*MEMORY[0x1E0C80C00]);
  LODWORD(v3) = 134218242;
  *(_QWORD *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v1, v2, "[DEBUG] ┳%llx Item failed first try waiting for sync down to complete... Retrying once...%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_2();
}

void __68__BRCClientZone_performBlock_whenSyncDownCompletesLookingForItemID___block_invoke_2_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  OUTLINED_FUNCTION_11_0(*MEMORY[0x1E0C80C00]);
  LODWORD(v3) = 134218242;
  *(_QWORD *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v1, v2, "[DEBUG] ┳%llx done waiting for sync down to complete after retry%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_2();
}

void __71__BRCClientZone_performBlock_whenLocatingCompletesForItemWithRecordID___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] UNREACHABLE: Item in server items table. We should get at least that item parent id%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __71__BRCClientZone_performBlock_whenLocatingCompletesForItemWithRecordID___block_invoke_378_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint8_t v4[24];

  OUTLINED_FUNCTION_9_0();
  objc_msgSend((id)OUTLINED_FUNCTION_18_0(v1), "debugItemIDString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3_2(&dword_1CBD43000, v0, v3, "[DEBUG] network is unreachable, don't try to locate item [%@]%@", v4);

  OUTLINED_FUNCTION_6();
}

void __44__BRCClientZone_networkReachabilityChanged___block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  OUTLINED_FUNCTION_11_0(*MEMORY[0x1E0C80C00]);
  LODWORD(v3) = 134218242;
  *(_QWORD *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v1, v2, "[DEBUG] ┏%llx Cancelling all share acceptance callbacks due to unreachable network%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_2();
}

- (void)_dumpRecursivePropertiesOfItemByRowID:context:depth:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: pos == ITEM_RECURSIVE_PROPERTIES_FIELDS_COUNT%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __72__BRCClientZone_LegacyAdditions___removeItemAndProcessForCrossZoneMove___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] UNREACHABLE: No path to process fsevent on%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __83__BRCClientZone_LegacyAdditions___startDownloadingItemForCrossZoneMoveIfNecessary___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] Not downloading item which is shared to me in a CZM'd folder - %@%@");
  OUTLINED_FUNCTION_2();
}

void __83__BRCClientZone_LegacyAdditions___startDownloadingItemForCrossZoneMoveIfNecessary___block_invoke_cold_2()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_1();
  _os_log_fault_impl(&dword_1CBD43000, v0, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: Couldn't find fault which we should have %@%@", v1, 0x16u);
  OUTLINED_FUNCTION_2();
}

void __83__BRCClientZone_LegacyAdditions___startDownloadingItemForCrossZoneMoveIfNecessary___block_invoke_11_cold_1(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = *(_QWORD *)(a1 + 32);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v1, v2, "[DEBUG] Sync: Finished waiting for download of children under %@%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_2();
}

void __83__BRCClientZone_LegacyAdditions___startDownloadingItemForCrossZoneMoveIfNecessary___block_invoke_13_cold_1(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = *(_QWORD *)(a1 + 32);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v1, v2, "[DEBUG] Sync: Finished waiting for download of %@%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_2();
}

@end
