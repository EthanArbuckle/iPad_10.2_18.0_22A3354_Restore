@implementation BRCTreeEnumerator

- (BRCTreeEnumerator)initWithSession:(id)a3
{
  id v5;
  BRCTreeEnumerator *v6;
  BRCTreeEnumerator *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BRCTreeEnumerator;
  v6 = -[BRCTreeEnumerator init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_session, a3);
    objc_storeStrong(&v7->_strongSelf, v7);
  }

  return v7;
}

- (BRCTreeEnumerator)initWithSession:(id)a3 tracker:(id)a4
{
  id v7;
  BRCTreeEnumerator *v8;
  BRCTreeEnumerator *v9;

  v7 = a4;
  v8 = -[BRCTreeEnumerator initWithSession:](self, "initWithSession:", a3);
  v9 = v8;
  if (v8)
    objc_storeStrong((id *)&v8->_tracker, a4);

  return v9;
}

- (BRCTreeEnumerator)initWithSession:(id)a3 group:(id)a4
{
  id v7;
  BRCTreeEnumerator *v8;
  BRCTreeEnumerator *v9;

  v7 = a4;
  v8 = -[BRCTreeEnumerator initWithSession:](self, "initWithSession:", a3);
  v9 = v8;
  if (v8)
    objc_storeStrong((id *)&v8->_group, a4);

  return v9;
}

- (void)cancel
{
  self->_isCancelled = 1;
}

- (void)_doneWithError:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id handler;
  NSMutableIndexSet *toVisit;
  NSMutableIndexSet *seen;
  NSObject *group;
  void (**completionHandler)(id, id);
  id strongSelf;

  v4 = a3;
  brc_bread_crumbs();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[BRCTreeEnumerator _doneWithError:].cold.1((uint64_t)v5, v6, v7, v8, v9, v10, v11, v12);

  handler = self->_handler;
  if (handler)
  {
    self->_handler = 0;

    toVisit = self->_toVisit;
    self->_toVisit = 0;

    seen = self->_seen;
    self->_seen = 0;

    group = self->_group;
    if (group)
      dispatch_group_leave(group);
    completionHandler = (void (**)(id, id))self->_completionHandler;
    if (completionHandler)
      completionHandler[2](completionHandler, v4);
  }
  strongSelf = self->_strongSelf;
  self->_strongSelf = 0;

}

- (void)enumerateBelow:(id)a3 appLibrary:(id)a4 recursively:(BOOL)a5 handler:(id)a6
{
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id handler;
  NSMutableIndexSet *v17;
  NSMutableIndexSet *seen;
  NSMutableIndexSet *v19;
  NSMutableIndexSet *toVisit;
  void *v21;
  NSObject *v22;
  NSObject *group;

  v11 = a3;
  v12 = a4;
  v13 = a6;
  if (!v11)
    -[BRCTreeEnumerator enumerateBelow:appLibrary:recursively:handler:].cold.1();
  v14 = v13;
  v15 = (void *)MEMORY[0x1D17A6DB0]();
  handler = self->_handler;
  self->_handler = v15;

  objc_storeStrong((id *)&self->_parentID, a3);
  objc_storeStrong((id *)&self->_appLibrary, a4);
  v17 = (NSMutableIndexSet *)objc_alloc_init(MEMORY[0x1E0CB3788]);
  seen = self->_seen;
  self->_seen = v17;

  v19 = (NSMutableIndexSet *)objc_alloc_init(MEMORY[0x1E0CB3788]);
  toVisit = self->_toVisit;
  self->_toVisit = v19;

  self->_isRecursive = a5;
  brc_bread_crumbs();
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    -[BRCTreeEnumerator enumerateBelow:appLibrary:recursively:handler:].cold.2();

  group = self->_group;
  if (group)
    dispatch_group_enter(group);
  -[BRCTreeEnumerator _scheduleAsync](self, "_scheduleAsync");

}

- (BOOL)finishIfCancelled
{
  _BOOL4 isCancelled;
  void *v4;

  isCancelled = self->_isCancelled;
  if (self->_isCancelled)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 3072, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCTreeEnumerator _doneWithError:](self, "_doneWithError:", v4);

  }
  return isCancelled;
}

- (void)_scheduleAsync
{
  uint64_t v3;
  void *v4;
  void *v5;
  brc_task_tracker *tracker;
  NSObject *v7;
  id v8;
  void *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  id v13;
  uint64_t v14;
  const char *label;
  _QWORD v16[5];
  __int128 v17;
  uint64_t v18;
  _BYTE block[24];
  void *v20;
  NSObject *v21;
  id v22;
  __int128 v23;
  uint64_t v24;
  uint64_t v25;

  v3 = MEMORY[0x1E0C809B0];
  v25 = *MEMORY[0x1E0C80C00];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __35__BRCTreeEnumerator__scheduleAsync__block_invoke;
  v16[3] = &unk_1E875D500;
  v16[4] = self;
  v4 = (void *)MEMORY[0x1D17A6DB0](v16, a2);
  -[BRCAccountSession clientTruthWorkloop](self->_session, "clientTruthWorkloop");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  tracker = self->_tracker;
  if (tracker)
  {
    brc_task_tracker_async_with_logs(tracker, v5, v4, 0);
  }
  else
  {
    v7 = v5;
    v8 = v4;
    v9 = (void *)MEMORY[0x1D17A6BE8]();
    v17 = 0uLL;
    v18 = 0;
    __brc_create_section(0, (uint64_t)"dispatch_async_with_logs", 262, &v17);
    brc_bread_crumbs();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      v14 = v17;
      label = dispatch_queue_get_label(v7);
      *(_DWORD *)block = 134218498;
      *(_QWORD *)&block[4] = v14;
      *(_WORD *)&block[12] = 2080;
      *(_QWORD *)&block[14] = label;
      *(_WORD *)&block[22] = 2112;
      v20 = v10;
      _os_log_debug_impl(&dword_1CBD43000, v11, OS_LOG_TYPE_DEBUG, "[DEBUG] ┣%llx dispatching to %s%@", block, 0x20u);
    }

    v23 = v17;
    v24 = v18;
    *(_QWORD *)block = v3;
    *(_QWORD *)&block[8] = 3221225472;
    *(_QWORD *)&block[16] = __dispatch_async_with_logs_block_invoke_21;
    v20 = &unk_1E875D578;
    v12 = v7;
    v21 = v12;
    v13 = v8;
    v22 = v13;
    dispatch_async(v12, block);

    objc_autoreleasePoolPop(v9);
  }

}

void __35__BRCTreeEnumerator__scheduleAsync__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;

  if ((objc_msgSend(*(id *)(a1 + 32), "finishIfCancelled") & 1) == 0)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "clientDB");
    v2 = (void *)objc_claimAutoreleasedReturnValue();

    if (v2)
    {
      v3 = *(_QWORD *)(a1 + 32);
      if (!*(_QWORD *)(v3 + 16))
      {
        brc_bread_crumbs();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
          __35__BRCTreeEnumerator__scheduleAsync__block_invoke_cold_2((uint64_t)v14, v15);

        v3 = *(_QWORD *)(a1 + 32);
      }
      objc_msgSend(*(id *)(v3 + 32), "mangledID");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(*(id *)(a1 + 32), "_iterate:", objc_msgSend(v5, "treeEnumeratorBatchSize"));
    }
    else
    {
      brc_bread_crumbs();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
        __35__BRCTreeEnumerator__scheduleAsync__block_invoke_cold_1((uint64_t)v6, v7, v8, v9, v10, v11, v12, v13);

      objc_msgSend(*(id *)(a1 + 32), "_doneWithError:", 0);
    }
  }
}

- (BOOL)_visitNewParent
{
  NSMutableIndexSet *i;
  uint64_t v4;
  void *v5;
  void *v7;
  uint64_t v8;
  BRCItemID **p_parentID;
  BRCItemID *parentID;
  void *v11;
  NSObject *v12;

  for (i = self->_toVisit; ; i = self->_toVisit)
  {
    if (!-[NSMutableIndexSet count](i, "count"))
    {
      -[BRCTreeEnumerator _doneWithError:](self, "_doneWithError:", 0);
      return 0;
    }
    v4 = -[NSMutableIndexSet firstIndex](self->_toVisit, "firstIndex");
    -[NSMutableIndexSet removeIndex:](self->_toVisit, "removeIndex:", v4);
    -[BRCAccountSession itemByRowID:](self->_session, "itemByRowID:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
      break;
  }
  v7 = v5;
  objc_msgSend(v5, "itemID");
  v8 = objc_claimAutoreleasedReturnValue();
  parentID = self->_parentID;
  p_parentID = &self->_parentID;
  *p_parentID = (BRCItemID *)v8;

  p_parentID[2] = 0;
  brc_bread_crumbs();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    -[BRCTreeEnumerator _visitNewParent].cold.1();

  return 1;
}

- (unint64_t)__iterate:(unint64_t)a3
{
  void *v5;
  void *v6;
  NSObject *v7;
  unint64_t rowID;
  BRCItemID *parentID;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  unint64_t v14;
  id v15;
  unint64_t v16;

  -[BRCAccountSession clientDB](self->_session, "clientDB");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  brc_bread_crumbs();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[BRCTreeEnumerator __iterate:].cold.1((uint64_t)self, (uint64_t)v6, v7);

  rowID = self->_rowID;
  parentID = self->_parentID;
  -[BRCAppLibrary dbRowID](self->_appLibrary, "dbRowID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v5, "fetch:", CFSTR("SELECT rowid, zone_rowid, item_id, item_creator_id, item_sharing_options, item_side_car_ckinfo, item_parent_zone_rowid, item_localsyncupstate, item_local_diffs, item_notifs_rank, app_library_rowid, item_min_supported_os_rowid, item_user_visible, item_stat_ckinfo, item_state, item_type, item_mode, item_birthtime, item_lastusedtime, item_favoriterank,item_parent_id, item_filename, item_hidden_ext, item_finder_tags, item_xattr_signature, item_trash_put_back_path, item_trash_put_back_parent_id, item_alias_target, item_creator, item_doc_id, item_file_id, item_generation, item_localname, item_processing_stamp, item_staged_file_id, item_staged_generation, item_bouncedname, item_scope, item_tmpbounceno, version_name, version_ckinfo, version_mtime, version_size, version_thumb_size, version_thumb_signature, version_content_signature, version_xattr_signature, version_edited_since_shared, version_device, version_conflict_loser_etags, version_quarantine_info, version_uploaded_assets, version_upload_error, version_old_zone_item_id, version_old_zone_rowid, desired_version, item_live_conflict_loser_etags, item_thumb_live_signature, item_thumb_greedy, version_block_sync_until_bundle_id, version_block_sync_until_timestamp FROM client_items WHERE rowid > %lld   AND item_parent_id = %@  AND app_library_rowid = %@  AND NOT indexset_contains(%p, rowid) ORDER BY rowid    LIMIT %ld"), rowID, parentID, v10, self->_seen, a3);

  if (objc_msgSend(v11, "next"))
  {
    do
    {
      v12 = (void *)MEMORY[0x1D17A6BE8]();
      v13 = -[BRCAccountSession newLocalItemFromPQLResultSet:db:error:](self->_session, "newLocalItemFromPQLResultSet:db:error:", v11, v5, 0);
      v14 = objc_msgSend(v13, "dbRowID");
      self->_rowID = v14;
      if ((-[NSMutableIndexSet containsIndex:](self->_seen, "containsIndex:", v14) & 1) == 0)
      {
        -[NSMutableIndexSet addIndex:](self->_seen, "addIndex:", self->_rowID);
        if (((objc_msgSend(v13, "isDirectory") & 1) != 0 || objc_msgSend(v13, "isFSRoot"))
          && self->_isRecursive)
        {
          -[NSMutableIndexSet addIndex:](self->_toVisit, "addIndex:", self->_rowID);
        }
        else
        {
          v15 = (id)(*((uint64_t (**)(void))self->_handler + 2))();
        }
      }

      objc_autoreleasePoolPop(v12);
    }
    while ((objc_msgSend(v11, "next") & 1) != 0);
  }
  v16 = objc_msgSend(v11, "rowNumber");

  return v16;
}

- (void)_iterate:(unint64_t)a3
{
  unint64_t v5;

  if (a3)
  {
    v5 = 0;
    while (1)
    {
      v5 += -[BRCTreeEnumerator __iterate:](self, "__iterate:", a3);
      if (v5 >= a3)
        break;
      if (!-[BRCTreeEnumerator _visitNewParent](self, "_visitNewParent"))
        return;
    }
  }
  -[BRCTreeEnumerator _scheduleAsync](self, "_scheduleAsync");
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong(&self->_strongSelf, 0);
  objc_storeStrong((id *)&self->_group, 0);
  objc_storeStrong((id *)&self->_tracker, 0);
  objc_storeStrong((id *)&self->_toVisit, 0);
  objc_storeStrong((id *)&self->_seen, 0);
  objc_storeStrong((id *)&self->_appLibrary, 0);
  objc_storeStrong((id *)&self->_parentID, 0);
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_session, 0);
}

- (void)_doneWithError:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_1(&dword_1CBD43000, a2, a3, "[DEBUG] done iterating%@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)enumerateBelow:appLibrary:recursively:handler:.cold.1()
{
  __assert_rtn("-[BRCTreeEnumerator enumerateBelow:appLibrary:recursively:handler:]", "BRCTreeEnumerator.m", 95, "parentID != nil");
}

- (void)enumerateBelow:appLibrary:recursively:handler:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] Starting enumerating under %@%@");
  OUTLINED_FUNCTION_2();
}

void __35__BRCTreeEnumerator__scheduleAsync__block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_1(&dword_1CBD43000, a2, a3, "[DEBUG] cancelling enumeration because container deactivated%@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

void __35__BRCTreeEnumerator__scheduleAsync__block_invoke_cold_2(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_fault_impl(&dword_1CBD43000, a2, OS_LOG_TYPE_FAULT, "[CRIT] Assertion failed: self->_handler%@", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_2();
}

- (void)_visitNewParent
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] visiting a new parent: %@%@");
  OUTLINED_FUNCTION_2();
}

- (void)__iterate:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 24);
  v4 = *(_QWORD *)(a1 + 40);
  v5 = 138412802;
  v6 = v3;
  v7 = 2048;
  v8 = v4;
  v9 = 2112;
  v10 = a2;
  _os_log_debug_impl(&dword_1CBD43000, log, OS_LOG_TYPE_DEBUG, "[DEBUG] continue iterating under parent %@, for _rowID > %ld%@", (uint8_t *)&v5, 0x20u);
}

@end
