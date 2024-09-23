@implementation BRCSyncUpEnumerator

- (BRCSyncUpEnumerator)initWithClientZone:(id)a3
{
  id v5;
  BRCSyncUpEnumerator *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSMutableDictionary *visitedItemIDsToDepthMap;
  NSMutableSet *v11;
  NSMutableSet *itemIDsLostOrThrottled;
  NSMutableSet *v13;
  NSMutableSet *itemIDsNeedingOSUpgrade;
  NSMutableSet *v15;
  NSMutableSet *itemIDsNeedingDirectoryFetch;
  NSMutableSet *v17;
  NSMutableSet *itemIDsWithChildrenBeingCopiedToNewZone;
  NSMutableSet *v19;
  NSMutableSet *chainedParentIDAllowlist;
  NSMutableArray *v21;
  NSMutableArray *itemsNeedingUnshare;
  NSMutableArray *v23;
  NSMutableArray *tooDeepItems;
  NSMutableIndexSet *v25;
  NSMutableIndexSet *returned;
  uint64_t v27;
  NSMutableArray *stack;
  objc_super v30;

  v5 = a3;
  v30.receiver = self;
  v30.super_class = (Class)BRCSyncUpEnumerator;
  v6 = -[BRCSyncUpEnumerator init](&v30, sel_init);
  if (v6)
  {
    objc_msgSend(v5, "mangledID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v6->_batchSize = objc_msgSend(v5, "syncUpBatchSize");
    v6->_maxDepth = objc_msgSend(v8, "maxSyncPathDepth");
    v6->_should2PhasePCSChain = objc_msgSend(v8, "should2PhasePCSChain");
    v6->_retryAfter = 0x7FFFFFFFFFFFFFFFLL;
    objc_storeStrong((id *)&v6->_clientZone, a3);
    v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", v6->_batchSize);
    visitedItemIDsToDepthMap = v6->_visitedItemIDsToDepthMap;
    v6->_visitedItemIDsToDepthMap = (NSMutableDictionary *)v9;

    v11 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    itemIDsLostOrThrottled = v6->_itemIDsLostOrThrottled;
    v6->_itemIDsLostOrThrottled = v11;

    v13 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    itemIDsNeedingOSUpgrade = v6->_itemIDsNeedingOSUpgrade;
    v6->_itemIDsNeedingOSUpgrade = v13;

    v15 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    itemIDsNeedingDirectoryFetch = v6->_itemIDsNeedingDirectoryFetch;
    v6->_itemIDsNeedingDirectoryFetch = v15;

    v17 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    itemIDsWithChildrenBeingCopiedToNewZone = v6->_itemIDsWithChildrenBeingCopiedToNewZone;
    v6->_itemIDsWithChildrenBeingCopiedToNewZone = v17;

    v19 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    chainedParentIDAllowlist = v6->_chainedParentIDAllowlist;
    v6->_chainedParentIDAllowlist = v19;

    v21 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    itemsNeedingUnshare = v6->_itemsNeedingUnshare;
    v6->_itemsNeedingUnshare = v21;

    v23 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    tooDeepItems = v6->_tooDeepItems;
    v6->_tooDeepItems = v23;

    v25 = (NSMutableIndexSet *)objc_alloc_init(MEMORY[0x1E0CB3788]);
    returned = v6->_returned;
    v6->_returned = v25;

    v27 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v6->_maxDepth);
    stack = v6->_stack;
    v6->_stack = (NSMutableArray *)v27;

    v6->_currentDepth = 0;
    v6->_stage = 0;

  }
  return v6;
}

- (void)invalidate
{
  PQLEnumeration *enumerator;

  -[PQLEnumeration close](self->_enumerator, "close");
  enumerator = self->_enumerator;
  self->_enumerator = 0;

}

- (id)_documentsOrAliasesNeedingSyncUpEnumerator
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[5];

  -[BRCClientZone db](self->_clientZone, "db");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCClientZone dbRowID](self->_clientZone, "dbRowID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "fetch:", CFSTR("SELECT li.rowid, li.zone_rowid, li.item_id, li.item_creator_id, li.item_sharing_options, li.item_side_car_ckinfo, li.item_parent_zone_rowid, li.item_localsyncupstate, li.item_local_diffs, li.item_notifs_rank, li.app_library_rowid, li.item_min_supported_os_rowid, li.item_user_visible, li.item_stat_ckinfo, li.item_state, li.item_type, li.item_mode, li.item_birthtime, li.item_lastusedtime, li.item_favoriterank,li.item_parent_id, li.item_filename, li.item_hidden_ext, li.item_finder_tags, li.item_xattr_signature, li.item_trash_put_back_path, li.item_trash_put_back_parent_id, li.item_alias_target, li.item_creator, li.item_doc_id, li.item_file_id, li.item_generation, li.item_localname, li.item_processing_stamp, li.item_staged_file_id, li.item_staged_generation, li.item_bouncedname, li.item_scope, li.item_tmpbounceno, li.version_name, li.version_ckinfo, li.version_mtime, li.version_size, li.version_thumb_size, li.version_thumb_signature, li.version_content_signature, li.version_xattr_signature, li.version_edited_since_shared, li.version_device, li.version_conflict_loser_etags, li.version_quarantine_info, li.version_uploaded_assets, li.version_upload_error, li.version_old_zone_item_id, li.version_old_zone_rowid, li.desired_version, li.item_live_conflict_loser_etags, li.item_thumb_live_signature, li.item_thumb_greedy, li.version_block_sync_until_bundle_id, li.version_block_sync_until_timestamp FROM client_items AS li  INNER JOIN client_sync_up AS su    ON su.throttle_id = li.rowid  WHERE         su.throttle_state = 50    AND su.zone_rowid = %@    AND su.in_flight_diffs IS NULL    AND li.item_type IN (1, 2, 8, 5, 6, 7, 3)    AND li.item_state = 0    AND li.item_localsyncupstate = 4    AND li.item_min_supported_os_rowid IS NULL ORDER BY su.retry_count ASC"), v4);

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __65__BRCSyncUpEnumerator__documentsOrAliasesNeedingSyncUpEnumerator__block_invoke;
  v8[3] = &unk_1E875E2C8;
  v8[4] = self;
  objc_msgSend(v5, "enumerateObjects:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __65__BRCSyncUpEnumerator__documentsOrAliasesNeedingSyncUpEnumerator__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  v6 = a2;
  objc_msgSend(v5, "session");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "session");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "clientDB");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v7, "newLocalItemFromPQLResultSet:db:error:", v6, v9, a3);

  return v10;
}

- (id)_liveDirectoriesNeedingSyncUpEnumerator
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[5];

  -[BRCClientZone db](self->_clientZone, "db");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCClientZone dbRowID](self->_clientZone, "dbRowID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "fetch:", CFSTR("SELECT li.rowid, li.zone_rowid, li.item_id, li.item_creator_id, li.item_sharing_options, li.item_side_car_ckinfo, li.item_parent_zone_rowid, li.item_localsyncupstate, li.item_local_diffs, li.item_notifs_rank, li.app_library_rowid, li.item_min_supported_os_rowid, li.item_user_visible, li.item_stat_ckinfo, li.item_state, li.item_type, li.item_mode, li.item_birthtime, li.item_lastusedtime, li.item_favoriterank,li.item_parent_id, li.item_filename, li.item_hidden_ext, li.item_finder_tags, li.item_xattr_signature, li.item_trash_put_back_path, li.item_trash_put_back_parent_id, li.item_alias_target, li.item_creator, li.item_doc_id, li.item_file_id, li.item_generation, li.item_localname, li.item_processing_stamp, li.item_staged_file_id, li.item_staged_generation, li.item_bouncedname, li.item_scope, li.item_tmpbounceno, li.version_name, li.version_ckinfo, li.version_mtime, li.version_size, li.version_thumb_size, li.version_thumb_signature, li.version_content_signature, li.version_xattr_signature, li.version_edited_since_shared, li.version_device, li.version_conflict_loser_etags, li.version_quarantine_info, li.version_uploaded_assets, li.version_upload_error, li.version_old_zone_item_id, li.version_old_zone_rowid, li.desired_version, li.item_live_conflict_loser_etags, li.item_thumb_live_signature, li.item_thumb_greedy, li.version_block_sync_until_bundle_id, li.version_block_sync_until_timestamp FROM client_items AS li  INNER JOIN client_sync_up AS su  ON su.throttle_id = li.rowid  WHERE         su.throttle_state = 50    AND su.zone_rowid = %@    AND su.in_flight_diffs IS NULL    AND li.item_type IN (0, 9, 10, 4)    AND (li.item_state = 0)    AND li.item_localsyncupstate = 4    AND li.item_min_supported_os_rowid IS NULL ORDER BY su.retry_count ASC"), v4);

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __62__BRCSyncUpEnumerator__liveDirectoriesNeedingSyncUpEnumerator__block_invoke;
  v8[3] = &unk_1E875E2C8;
  v8[4] = self;
  objc_msgSend(v5, "enumerateObjects:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __62__BRCSyncUpEnumerator__liveDirectoriesNeedingSyncUpEnumerator__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  v6 = a2;
  objc_msgSend(v5, "session");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "session");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "clientDB");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v7, "newLocalItemFromPQLResultSet:db:error:", v6, v9, a3);

  return v10;
}

- (id)_tombstoneLeavesNeedingSyncUpEnumerator
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[5];

  -[BRCClientZone db](self->_clientZone, "db");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCClientZone dbRowID](self->_clientZone, "dbRowID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "fetch:", CFSTR("SELECT li.rowid, li.zone_rowid, li.item_id, li.item_creator_id, li.item_sharing_options, li.item_side_car_ckinfo, li.item_parent_zone_rowid, li.item_localsyncupstate, li.item_local_diffs, li.item_notifs_rank, li.app_library_rowid, li.item_min_supported_os_rowid, li.item_user_visible, li.item_stat_ckinfo, li.item_state, li.item_type, li.item_mode, li.item_birthtime, li.item_lastusedtime, li.item_favoriterank,li.item_parent_id, li.item_filename, li.item_hidden_ext, li.item_finder_tags, li.item_xattr_signature, li.item_trash_put_back_path, li.item_trash_put_back_parent_id, li.item_alias_target, li.item_creator, li.item_doc_id, li.item_file_id, li.item_generation, li.item_localname, li.item_processing_stamp, li.item_staged_file_id, li.item_staged_generation, li.item_bouncedname, li.item_scope, li.item_tmpbounceno, li.version_name, li.version_ckinfo, li.version_mtime, li.version_size, li.version_thumb_size, li.version_thumb_signature, li.version_content_signature, li.version_xattr_signature, li.version_edited_since_shared, li.version_device, li.version_conflict_loser_etags, li.version_quarantine_info, li.version_uploaded_assets, li.version_upload_error, li.version_old_zone_item_id, li.version_old_zone_rowid, li.desired_version, li.item_live_conflict_loser_etags, li.item_thumb_live_signature, li.item_thumb_greedy, li.version_block_sync_until_bundle_id, li.version_block_sync_until_timestamp FROM client_items AS li  INNER JOIN client_sync_up AS su    ON su.throttle_id = li.rowid  WHERE         su.throttle_state = 50    AND su.zone_rowid = %@    AND su.in_flight_diffs IS NULL    AND li.item_state = 1    AND li.item_localsyncupstate = 4    AND NOT EXISTS(SELECT 1 FROM client_items AS ci                     WHERE li.item_id = ci.item_parent_id                      AND ci.zone_rowid = su.zone_rowid                      AND ci.item_state != -2)    AND li.item_min_supported_os_rowid IS NULL ORDER BY su.retry_count ASC"), v4);

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __62__BRCSyncUpEnumerator__tombstoneLeavesNeedingSyncUpEnumerator__block_invoke;
  v8[3] = &unk_1E875E2C8;
  v8[4] = self;
  objc_msgSend(v5, "enumerateObjects:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __62__BRCSyncUpEnumerator__tombstoneLeavesNeedingSyncUpEnumerator__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  v6 = a2;
  objc_msgSend(v5, "session");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "session");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "clientDB");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v7, "newLocalItemFromPQLResultSet:db:error:", v6, v9, a3);

  return v10;
}

- (void)_denyListDescendantStack:(id)a3 parentItem:(id)a4 andAddToSet:(id)a5 descendantBlock:(id)a6
{
  id v9;
  id v10;
  id v11;
  void (**v12)(id, void *);
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = (void (**)(id, void *))a6;
  if (objc_msgSend(v10, "isDirectory"))
  {
    objc_msgSend(v10, "itemID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObject:", v13);

  }
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v14 = v9;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v23 != v17)
          objc_enumerationMutation(v14);
        v19 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        if (objc_msgSend(v19, "isDirectory", (_QWORD)v22))
        {
          objc_msgSend(v19, "itemID");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "addObject:", v20);

        }
        if (v12)
        {
          objc_msgSend(v19, "itemID");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v12[2](v12, v21);

        }
      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v16);
  }

  objc_msgSend(v14, "removeAllObjects");
}

- (void)_denyListDescendantStack:(id)a3 parentItem:(id)a4 andAddToSet:(id)a5
{
  -[BRCSyncUpEnumerator _denyListDescendantStack:parentItem:andAddToSet:descendantBlock:](self, "_denyListDescendantStack:parentItem:andAddToSet:descendantBlock:", a3, a4, a5, 0);
}

- (BOOL)_denyListDescendantStackAndItemIfThrottledOrNeedsOSUpgrade:(id)a3 now:(unint64_t)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  BOOL v15;
  BOOL v16;
  void *v17;
  NSObject *v18;
  unint64_t retryAfter;
  unint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t buf[4];
  id v28;
  __int16 v29;
  unint64_t v30;
  __int16 v31;
  void *v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (objc_msgSend(v6, "needsOSUpgradeToSyncUp"))
  {
    brc_bread_crumbs();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      -[BRCSyncUpEnumerator _denyListDescendantStackAndItemIfThrottledOrNeedsOSUpgrade:now:].cold.1();

    -[BRCSyncUpEnumerator _denyListDescendantStack:parentItem:andAddToSet:](self, "_denyListDescendantStack:parentItem:andAddToSet:", self->_stack, v6, self->_itemIDsLostOrThrottled);
LABEL_23:
    v16 = 1;
  }
  else
  {
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    -[BRCClientZone syncThrottles](self->_clientZone, "syncThrottles");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v33, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v24;
      while (2)
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v24 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
          v22 = 0;
          if (objc_msgSend(v14, "matchesItem:nsecsToRetry:now:", v6, &v22, a4))
            v15 = v22 == 0;
          else
            v15 = 1;
          if (!v15)
          {
            brc_bread_crumbs();
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            brc_default_log();
            v18 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412802;
              v28 = v6;
              v29 = 2048;
              v30 = v22;
              v31 = 2112;
              v32 = v17;
              _os_log_debug_impl(&dword_1CBD43000, v18, OS_LOG_TYPE_DEBUG, "[DEBUG] Sync: denylist %@ and all dependents because %llu nsecs to retry%@", buf, 0x20u);
            }

            retryAfter = self->_retryAfter;
            if (retryAfter >= v22)
              retryAfter = v22;
            self->_retryAfter = retryAfter;
            -[BRCSyncUpEnumerator _denyListDescendantStack:parentItem:andAddToSet:](self, "_denyListDescendantStack:parentItem:andAddToSet:", self->_stack, v6, self->_itemIDsLostOrThrottled);

            goto LABEL_23;
          }
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v33, 16);
        if (v11)
          continue;
        break;
      }
    }

    v16 = 0;
  }

  return v16;
}

- (BOOL)isDenyListed:(id)a3
{
  id v4;
  char v5;

  v4 = a3;
  if ((-[NSMutableSet containsObject:](self->_itemIDsLostOrThrottled, "containsObject:", v4) & 1) != 0
    || (-[NSMutableSet containsObject:](self->_itemIDsNeedingOSUpgrade, "containsObject:", v4) & 1) != 0
    || (-[NSMutableSet containsObject:](self->_itemIDsWithChildrenBeingCopiedToNewZone, "containsObject:", v4) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    v5 = -[NSMutableSet containsObject:](self->_itemIDsNeedingDirectoryFetch, "containsObject:", v4);
  }

  return v5;
}

- (BOOL)shouldDenylistRemainingDeletionParentStackForItem:(id)a3
{
  id v4;
  NSMutableSet *itemIDsNeedingDirectoryFetch;
  void *v6;
  char v7;
  NSMutableSet *itemIDsWithChildrenBeingCopiedToNewZone;
  void *v9;

  v4 = a3;
  if (objc_msgSend(v4, "isDead"))
  {
    itemIDsNeedingDirectoryFetch = self->_itemIDsNeedingDirectoryFetch;
    objc_msgSend(v4, "itemID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((-[NSMutableSet containsObject:](itemIDsNeedingDirectoryFetch, "containsObject:", v6) & 1) != 0)
    {
      v7 = 1;
    }
    else
    {
      itemIDsWithChildrenBeingCopiedToNewZone = self->_itemIDsWithChildrenBeingCopiedToNewZone;
      objc_msgSend(v4, "itemID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = -[NSMutableSet containsObject:](itemIDsWithChildrenBeingCopiedToNewZone, "containsObject:", v9);

    }
  }
  else
  {
    v7 = 1;
  }

  return v7;
}

- (BOOL)handleItemForOSUpgrade:(id)a3 parentItemID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSMutableArray *stack;
  NSMutableSet *itemIDsNeedingOSUpgrade;
  BOOL v16;
  _QWORD v18[5];
  id v19;

  v6 = a3;
  v7 = a4;
  if ((objc_msgSend(v6, "needsOSUpgradeToSyncUp") & 1) != 0
    || -[NSMutableSet containsObject:](self->_itemIDsNeedingOSUpgrade, "containsObject:", v7))
  {
    brc_bread_crumbs();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      -[BRCSyncUpEnumerator handleItemForOSUpgrade:parentItemID:].cold.1();

    if (!objc_msgSend(v6, "needsOSUpgradeToSyncUp"))
    {
      objc_msgSend(v6, "parentItemIDInZone");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      if (v10 && (objc_msgSend(v10, "isNonDesktopRoot") & 1) == 0)
      {
        objc_msgSend(v6, "clientZone");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "itemByItemID:", v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v6, "inheritOSUpgradeNeededFromItem:", v13);
        objc_msgSend(v6, "saveToDB");

      }
      -[NSMutableArray removeLastObject](self->_stack, "removeLastObject");

    }
    stack = self->_stack;
    itemIDsNeedingOSUpgrade = self->_itemIDsNeedingOSUpgrade;
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __59__BRCSyncUpEnumerator_handleItemForOSUpgrade_parentItemID___block_invoke;
    v18[3] = &unk_1E87684E8;
    v18[4] = self;
    v19 = v6;
    -[BRCSyncUpEnumerator _denyListDescendantStack:parentItem:andAddToSet:descendantBlock:](self, "_denyListDescendantStack:parentItem:andAddToSet:descendantBlock:", stack, v19, itemIDsNeedingOSUpgrade, v18);

    v16 = 1;
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

void __59__BRCSyncUpEnumerator_handleItemForOSUpgrade_parentItemID___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "itemByItemID:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "needsOSUpgradeToSyncUp") & 1) == 0)
  {
    objc_msgSend(v3, "inheritOSUpgradeNeededFromItem:", *(_QWORD *)(a1 + 40));
    objc_msgSend(v3, "saveToDB");
  }

}

- (BOOL)_handleSharedItemWhichMovedToNewShare:(id)a3 rootItem:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  _BOOL4 v11;
  void *v12;
  NSObject *v13;
  const char *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  BOOL v19;
  BRCClientZone *clientZone;
  void *v21;
  NSObject *v22;
  int v24;
  id v25;
  __int16 v26;
  id v27;
  __int16 v28;
  const char *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if ((objc_msgSend(v6, "sharingOptions") & 4) == 0)
  {
    brc_bread_crumbs();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      -[BRCSyncUpEnumerator _handleSharedItemWhichMovedToNewShare:rootItem:].cold.1();

    goto LABEL_21;
  }
  objc_msgSend(v6, "clientZone");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "isEqualToClientZone:", self->_clientZone))
    v11 = -[BRCClientZone isPrivateZone](self->_clientZone, "isPrivateZone");
  else
    v11 = 0;

  brc_bread_crumbs();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = " in the same zone";
    v24 = 138413058;
    if (!v11)
      v14 = 0;
    v25 = v6;
    v26 = 2112;
    v27 = v7;
    v28 = 2080;
    v29 = v14;
    v30 = 2112;
    v31 = v12;
    _os_log_impl(&dword_1CBD43000, v13, OS_LOG_TYPE_DEFAULT, "[WARNING] item with shareID %@ is moving into a shared parent %@%s%@", (uint8_t *)&v24, 0x2Au);
  }

  if (!v11)
  {
    clientZone = self->_clientZone;
    objc_msgSend(v7, "itemGlobalID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCClientZone itemMovedIntoShareInThisZone:associatedItemID:](clientZone, "itemMovedIntoShareInThisZone:associatedItemID:", v6, v8);
LABEL_21:
    v19 = 1;
    goto LABEL_22;
  }
  objc_msgSend(v6, "clientZone");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "itemID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "serverItemByItemID:", v16);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v8, "sharingOptions") & 4) != 0)
  {
    brc_bread_crumbs();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      -[BRCSyncUpEnumerator _handleSharedItemWhichMovedToNewShare:rootItem:].cold.3();

    -[NSMutableArray addObject:](self->_itemsNeedingUnshare, "addObject:", v6);
    goto LABEL_21;
  }
  brc_bread_crumbs();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    -[BRCSyncUpEnumerator _handleSharedItemWhichMovedToNewShare:rootItem:].cold.2();

  objc_msgSend(v6, "updateItemMetadataFromServerItem:appliedSharingPermission:", v8, 0);
  objc_msgSend(v6, "saveToDBForServerEdit:keepAliases:", 1, 0);
  v19 = 0;
LABEL_22:

  return v19;
}

- (BOOL)_checkForSharesWithinSharesWithItem:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  NSObject *v22;
  NSMutableArray *itemsNeedingUnshare;
  void *v24;
  void *v25;
  _BOOL4 v26;
  NSObject *v27;
  uint64_t v28;
  uint64_t v29;
  void (*v30)(uint64_t, void *, uint64_t, _BYTE *);
  void *v31;
  id v32;
  uint64_t *v33;
  _QWORD v34[4];
  id v35;
  BRCSyncUpEnumerator *v36;
  id v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  char v42;
  uint8_t buf[4];
  id v44;
  __int16 v45;
  void *v46;
  _BYTE v47[24];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((objc_msgSend(v4, "isDead") & 1) != 0 || (objc_msgSend(v4, "isFSRoot") & 1) != 0)
  {
    v5 = 0;
    v6 = 0;
    goto LABEL_4;
  }
  if ((objc_msgSend(v4, "localDiffs") & 0x20) != 0 && (objc_msgSend(v4, "sharingOptions") & 4) != 0)
  {
    objc_msgSend(v4, "parentItemOnFS");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v5, "sharingOptions") & 0x48) != 0)
    {
      objc_msgSend(v4, "asShareableItem");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = -[BRCSyncUpEnumerator _handleSharedItemWhichMovedToNewShare:rootItem:](self, "_handleSharedItemWhichMovedToNewShare:rootItem:", v25, 0);

      if (v26)
      {
        brc_bread_crumbs();
        v10 = (id)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
          -[BRCSyncUpEnumerator _checkForSharesWithinSharesWithItem:].cold.2(v4, (uint64_t)v10, v27);

        v6 = 1;
        goto LABEL_34;
      }
    }
  }
  else
  {
    v5 = 0;
  }
  if ((objc_msgSend(v4, "localDiffs") & 0x20) != 0
    && -[BRCClientZone isPrivateZone](self->_clientZone, "isPrivateZone")
    && objc_msgSend(v4, "isDirectory"))
  {
    if (!v5)
    {
      objc_msgSend(v4, "parentItemOnFS");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    if ((objc_msgSend(v5, "sharingOptions") & 0x48) != 0)
    {
      -[BRCClientZone session](self->_clientZone, "session");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = 0;
      v40 = &v39;
      v41 = 0x2020000000;
      v42 = 0;
      objc_msgSend(v4, "asDirectory");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v34[0] = MEMORY[0x1E0C809B0];
      v34[1] = 3221225472;
      v34[2] = __59__BRCSyncUpEnumerator__checkForSharesWithinSharesWithItem___block_invoke;
      v34[3] = &unk_1E8768510;
      v10 = v8;
      v38 = &v39;
      v35 = v10;
      v36 = self;
      v11 = v4;
      v37 = v11;
      objc_msgSend(v10, "enumerateItemsWithShareIDUnderParent:block:", v9, v34);

      v6 = *((_BYTE *)v40 + 24) != 0;
      if (*((_BYTE *)v40 + 24))
      {
        brc_bread_crumbs();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(v11, "itemID");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          -[BRCSyncUpEnumerator _checkForSharesWithinSharesWithItem:].cold.1(v14, (uint64_t)v12, (uint64_t)v47, v13);
        }

      }
      _Block_object_dispose(&v39, 8);
LABEL_34:

      goto LABEL_20;
    }
  }
  v6 = 0;
LABEL_20:
  if ((objc_msgSend(v4, "sharingOptions") & 0x7C) == 4 && objc_msgSend(v4, "isDirectory"))
  {
    objc_msgSend(v4, "clientZone");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "itemID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "serverItemByItemID:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v17, "sharingOptions") & 0x7C) == 4)
    {
      -[BRCClientZone session](self->_clientZone, "session");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = 0;
      v40 = &v39;
      v41 = 0x2020000000;
      v42 = 0;
      objc_msgSend(v4, "asDirectory");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = MEMORY[0x1E0C809B0];
      v29 = 3221225472;
      v30 = __59__BRCSyncUpEnumerator__checkForSharesWithinSharesWithItem___block_invoke_13;
      v31 = &unk_1E8768538;
      v20 = v4;
      v32 = v20;
      v33 = &v39;
      objc_msgSend(v18, "enumerateItemsWithShareIDUnderParent:block:", v19, &v28);

      if (*((_BYTE *)v40 + 24))
      {
        brc_bread_crumbs();
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          v44 = v20;
          v45 = 2112;
          v46 = v21;
          _os_log_impl(&dword_1CBD43000, v22, OS_LOG_TYPE_DEFAULT, "[WARNING] Unsharing turd folder share %@ because it now has shared children%@", buf, 0x16u);
        }

        itemsNeedingUnshare = self->_itemsNeedingUnshare;
        objc_msgSend(v20, "asShareableItem", v28, v29, v30, v31);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableArray addObject:](itemsNeedingUnshare, "addObject:", v24);

        v6 = 1;
      }

      _Block_object_dispose(&v39, 8);
    }

  }
LABEL_4:

  return v6;
}

void __59__BRCSyncUpEnumerator__checkForSharesWithinSharesWithItem___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "itemByItemGlobalID:", a2);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "isDead") & 1) == 0)
  {
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    if (*(_BYTE *)(v3 + 24))
    {
      *(_BYTE *)(v3 + 24) = 1;
    }
    else
    {
      v4 = *(void **)(a1 + 40);
      objc_msgSend(v6, "asShareableItem");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = objc_msgSend(v4, "_handleSharedItemWhichMovedToNewShare:rootItem:", v5, *(_QWORD *)(a1 + 48));

    }
  }

}

void __59__BRCSyncUpEnumerator__checkForSharesWithinSharesWithItem___block_invoke_13(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  id v7;
  void *v8;
  char v9;

  v6 = *(void **)(a1 + 32);
  v7 = a2;
  objc_msgSend(v6, "itemGlobalID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToItemGlobalID:", v7);

  if ((v9 & 1) == 0)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }
}

- (BOOL)_checkIfParentNeedsRevivalWithParentItem:(id)a3 item:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  const char *v10;
  BOOL v11;
  BRCClientZone *clientZone;
  void *v13;
  int v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  int v22;
  id v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!objc_msgSend(v6, "isRejected"))
  {
    clientZone = self->_clientZone;
    objc_msgSend(v6, "clientZone");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[BRCClientZone isEqualToClientZone:](clientZone, "isEqualToClientZone:", v13)
      && objc_msgSend(v6, "isKnownByServer")
      && objc_msgSend(v6, "isIdleOrRejected"))
    {
      v14 = objc_msgSend(v6, "isDeadOrMissingInServerTruth");

      if (v14)
      {
        if ((objc_msgSend(v6, "isSharedToMeChildItem") & 1) != 0)
          goto LABEL_13;
        objc_msgSend(v6, "clientZone");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "isPrivateZone");

        if (v16)
        {
          objc_msgSend(v6, "clientZone");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "asPrivateClientZone");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "itemID");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v18, "pcsChainStateForItem:", v19) & 0xFFFFFFFE;

          if (v20 == 2)
          {
LABEL_13:
            brc_bread_crumbs();
            v8 = (void *)objc_claimAutoreleasedReturnValue();
            brc_default_log();
            v9 = objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
              goto LABEL_5;
            v22 = 138412546;
            v23 = v6;
            v24 = 2112;
            v25 = v8;
            v10 = "[WARNING] Parent item needs to be revived to sync up %@%@";
            goto LABEL_4;
          }
        }
      }
    }
    else
    {

    }
    v11 = 0;
    goto LABEL_17;
  }
  brc_bread_crumbs();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v22 = 138412546;
    v23 = v7;
    v24 = 2112;
    v25 = v8;
    v10 = "[WARNING] Parent item is rejected so we will reset if we try to sync up without syncing up the parent. Item: %@%@";
LABEL_4:
    _os_log_impl(&dword_1CBD43000, v9, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v22, 0x16u);
  }
LABEL_5:

  objc_msgSend(v6, "markForceNeedsSyncUp");
  objc_msgSend(v6, "saveToDB");
  v11 = 1;
LABEL_17:

  return v11;
}

- (BOOL)_handlePendingShareItemWithPendingDeleteChildren:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  BOOL v16;
  NSObject *v17;
  int v19;
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "appLibrary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mangledID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "preventSharingFolderWithPendingDelete");

  if ((v7 & 1) == 0)
  {
    brc_bread_crumbs();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      -[BRCSyncUpEnumerator _handlePendingShareItemWithPendingDeleteChildren:].cold.1((uint64_t)v12, v17);

    goto LABEL_13;
  }
  if (!objc_msgSend(v3, "isChildSharedItem"))
    goto LABEL_14;
  if (!objc_msgSend(v3, "isSharedByMe"))
    goto LABEL_14;
  if (!objc_msgSend(v3, "isDirectory"))
    goto LABEL_14;
  objc_msgSend(v3, "asDirectory");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "containsPendingDeleteDocuments");

  if (!v9)
    goto LABEL_14;
  objc_msgSend(v3, "clientZone");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "itemID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "serverItemByItemID:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v12, "isChildSharedItem") & 1) != 0)
  {
LABEL_13:

LABEL_14:
    v16 = 0;
    goto LABEL_15;
  }
  brc_bread_crumbs();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v3, "itemID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 138412546;
    v20 = v15;
    v21 = 2112;
    v22 = v13;
    _os_log_impl(&dword_1CBD43000, v14, OS_LOG_TYPE_DEFAULT, "[WARNING] Sync: denylist %@ until the delete of its child%@", (uint8_t *)&v19, 0x16u);

  }
  v16 = 1;
LABEL_15:

  return v16;
}

- (BOOL)_checkIfShouldDenylistForPathMatch:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  NSObject *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "isDirectory") && (objc_msgSend(v4, "isKnownByServerOrInFlight") & 1) == 0)
  {
    objc_msgSend(v4, "serverPathMatchItemID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      if (!-[BRCClientZone existsByItemID:](self->_clientZone, "existsByItemID:", v5))
      {
        -[BRCClientZone serverItemByItemID:](self->_clientZone, "serverItemByItemID:", v5);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = objc_msgSend(v6, "isBRAlias");

        if ((v7 & 1) == 0)
        {
          brc_bread_crumbs();
          v8 = objc_claimAutoreleasedReturnValue();
          LOBYTE(v9) = 1;
          brc_default_log();
          v10 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(v4, "itemID");
            v9 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = 138412802;
            v15 = v9;
            v16 = 2112;
            v17 = v5;
            v18 = 2112;
            v19 = v8;
            _os_log_debug_impl(&dword_1CBD43000, v10, OS_LOG_TYPE_DEBUG, "[DEBUG] Sync: denylist %@ because it's an unresolved path-match with %@%@", (uint8_t *)&v14, 0x20u);

            LOBYTE(v9) = 1;
          }
          goto LABEL_13;
        }
      }
    }

  }
  if ((objc_msgSend(v4, "localDiffs") & 0x1000000060) != 0)
  {
    objc_msgSend(v4, "serverPathMatchItemID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      LOBYTE(v9) = 0;
      goto LABEL_17;
    }
    -[BRCClientZone itemByItemID:](self->_clientZone, "itemByItemID:", v5);
    v8 = objc_claimAutoreleasedReturnValue();
    LODWORD(v9) = -[NSObject isLost](v8, "isLost");
    if (!(_DWORD)v9)
    {
LABEL_14:

LABEL_17:
      goto LABEL_18;
    }
    brc_bread_crumbs();
    v10 = objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v4, "itemID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138412802;
      v15 = v13;
      v16 = 2112;
      v17 = v5;
      v18 = 2112;
      v19 = v10;
      _os_log_debug_impl(&dword_1CBD43000, v11, OS_LOG_TYPE_DEBUG, "[DEBUG] Sync: denylist %@ because we have a lost item at the same path in the server truth - %@%@", (uint8_t *)&v14, 0x20u);

    }
LABEL_13:

    goto LABEL_14;
  }
  LOBYTE(v9) = 0;
LABEL_18:

  return (char)v9;
}

- (BOOL)_checkIfShouldDenylistForParentDirectoryFaultWithItem:(id)a3 needsDirFaultCheck:(BOOL *)a4
{
  id v6;
  void *v7;
  BOOL v8;
  void *v10;
  void *v11;
  BRCClientZone *clientZone;
  void *v13;
  int v14;
  void *v15;
  NSObject *v16;
  BRCClientZone *v17;
  void *v18;
  int v19;
  id v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[BRCClientZone serverZone](self->_clientZone, "serverZone");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "state") & 4) != 0
    || (objc_msgSend(v7, "hasFetchedServerZoneState") & 1) == 0
    || -[BRCClientZone isSharedZone](self->_clientZone, "isSharedZone")
    && objc_msgSend(v6, "isSharedToMeTopLevelItem"))
  {
    v8 = 0;
    *a4 = 0;
  }
  else
  {
    objc_msgSend(v6, "st");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "parentID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    clientZone = self->_clientZone;
    objc_msgSend(v6, "db");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[BRCClientZone serverItemTypeByItemID:db:](clientZone, "serverItemTypeByItemID:db:", v11, v13);

    if (v14 == 9)
    {
      brc_bread_crumbs();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        v19 = 138412546;
        v20 = v6;
        v21 = 2112;
        v22 = v15;
        _os_log_impl(&dword_1CBD43000, v16, OS_LOG_TYPE_DEFAULT, "[WARNING] denylist %@ because parent is a directory fault in the server truth%@", (uint8_t *)&v19, 0x16u);
      }

      v17 = self->_clientZone;
      v8 = 1;
      -[BRCClientZone fetchDirectoryContentsIfNecessary:isUserWaiting:rescheduleApplyScheduler:](v17, "fetchDirectoryContentsIfNecessary:isUserWaiting:rescheduleApplyScheduler:", v11, 0, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "beginObservingChangesWithDelegate:", 0);
      *a4 = 0;

    }
    else
    {
      v8 = 0;
      if (!(_BYTE)v14)
        *a4 = 0;
    }

  }
  return v8;
}

- (BOOL)_checkIfShouldDenylistForChildrenOfItemBeingCopiedToNewZone:(id)a3
{
  id v4;
  NSMutableSet *itemIDsWithChildrenBeingCopiedToNewZone;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  itemIDsWithChildrenBeingCopiedToNewZone = self->_itemIDsWithChildrenBeingCopiedToNewZone;
  objc_msgSend(v4, "itemID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(itemIDsWithChildrenBeingCopiedToNewZone) = -[NSMutableSet containsObject:](itemIDsWithChildrenBeingCopiedToNewZone, "containsObject:", v6);

  if ((itemIDsWithChildrenBeingCopiedToNewZone & 1) != 0)
  {
    v7 = 1;
  }
  else
  {
    -[BRCClientZone db](self->_clientZone, "db");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "itemID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCClientZone dbRowID](self->_clientZone, "dbRowID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v8, "numberWithSQL:", CFSTR("SELECT 1 FROM client_items AS ci INNER JOIN server_items AS si ON ci.version_old_zone_item_id = si.item_id AND ci.version_old_zone_rowid = si.zone_rowid  WHERE si.item_parent_id = %@ AND si.zone_rowid = %@ LIMIT 1"), v9, v10);

    v7 = objc_msgSend(v11, "BOOLValue");
  }

  return v7;
}

- (id)_nextLiveItem
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  NSMutableDictionary *visitedItemIDsToDepthMap;
  void *v9;
  uint64_t v10;
  PQLEnumeration *v11;
  __int128 v12;
  PQLEnumeration *v13;
  uint64_t v14;
  int *v15;
  uint64_t v16;
  PQLEnumeration *v17;
  void *v18;
  BOOL v19;
  void *v20;
  char v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  void *v26;
  id v27;
  int v28;
  char v29;
  void *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  int v34;
  BOOL v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  char v40;
  void *v41;
  id v42;
  void *v43;
  void *v44;
  NSObject *v45;
  unsigned int maxDepth;
  void *v47;
  NSObject *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  void *v52;
  void *v53;
  NSObject *v54;
  PQLEnumeration *v55;
  unint64_t v56;
  void *v57;
  void *v58;
  BRCClientZone *clientZone;
  void *v61;
  NSObject *v62;
  __int128 v63;
  uint64_t v64;
  PQLEnumeration *v65;
  uint64_t v66;
  char v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  uint8_t buf[4];
  _BYTE v73[28];
  _BYTE v74[128];
  uint64_t v75;

  v75 = *MEMORY[0x1E0C80C00];
  v3 = brc_current_date_nsec();
  -[NSMutableArray lastObject](self->_stack, "lastObject");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    do
    {
      v6 = (void *)MEMORY[0x1D17A6BE8]();
      ++self->_currentDepth;
      -[NSMutableArray removeLastObject](self->_stack, "removeLastObject");
      if (objc_msgSend(v5, "isDirectory"))
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_currentDepth);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        visitedItemIDsToDepthMap = self->_visitedItemIDsToDepthMap;
        objc_msgSend(v5, "itemID");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKeyedSubscript:](visitedItemIDsToDepthMap, "setObject:forKeyedSubscript:", v7, v9);

      }
      if ((-[NSMutableIndexSet containsIndex:](self->_returned, "containsIndex:", objc_msgSend(v5, "dbRowID")) & 1) == 0
        && objc_msgSend(v5, "syncUpState") == 4
        && !-[BRCSyncUpEnumerator _denyListDescendantStackAndItemIfThrottledOrNeedsOSUpgrade:now:](self, "_denyListDescendantStackAndItemIfThrottledOrNeedsOSUpgrade:now:", v5, v3))
      {
        -[NSMutableIndexSet addIndex:](self->_returned, "addIndex:", objc_msgSend(v5, "dbRowID"));
        v17 = v5;
        objc_autoreleasePoolPop(v6);
        v52 = v17;
        goto LABEL_71;
      }
      objc_autoreleasePoolPop(v6);
      -[NSMutableArray lastObject](self->_stack, "lastObject");
      v10 = objc_claimAutoreleasedReturnValue();

      v5 = (void *)v10;
    }
    while (v10);
  }
  self->_currentDepth = 0;
  if (-[NSMutableArray count](self->_stack, "count"))
  {
    brc_bread_crumbs();
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v62 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v62, OS_LOG_TYPE_FAULT))
      -[BRCSyncUpEnumerator _nextLiveItem].cold.1((uint64_t)v61, v62);

  }
  v70 = 0u;
  v71 = 0u;
  v68 = 0u;
  v69 = 0u;
  v11 = self->_enumerator;
  v66 = -[PQLEnumeration countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v68, v74, 16);
  if (!v66)
    goto LABEL_61;
  v13 = 0;
  v14 = *(_QWORD *)v69;
  v15 = &OBJC_IVAR___BRCSyncUpEnumerator__returned;
  *(_QWORD *)&v12 = 67109634;
  v63 = v12;
  v64 = *(_QWORD *)v69;
  v65 = v11;
LABEL_12:
  v16 = 0;
  while (1)
  {
    if (*(_QWORD *)v69 != v14)
      objc_enumerationMutation(v11);
    v17 = (PQLEnumeration *)*(id *)(*((_QWORD *)&v68 + 1) + 8 * v16);

    if ((objc_msgSend(*(id *)((char *)&self->super.super.isa + *v15), "containsIndex:", -[PQLEnumeration dbRowID](v17, "dbRowID")) & 1) != 0)
    {
      v13 = v17;
      goto LABEL_56;
    }
    -[PQLEnumeration itemID](v17, "itemID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = -[BRCSyncUpEnumerator isDenyListed:](self, "isDenyListed:", v18);

    if (!v19)
      break;
    v13 = v17;
LABEL_55:
    v15 = &OBJC_IVAR___BRCSyncUpEnumerator__returned;
LABEL_56:
    if (++v16 == v66)
    {
      v51 = -[PQLEnumeration countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v68, v74, 16);
      v66 = v51;
      if (!v51)
      {

LABEL_61:
        v52 = 0;
        v17 = v11;
        goto LABEL_71;
      }
      goto LABEL_12;
    }
  }
  while (2)
  {
    v67 = 0;
    -[PQLEnumeration itemID](v17, "itemID", v63);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "isDocumentsFolder") ^ 1;

    v67 = v21;
    -[PQLEnumeration clientZone](v17, "clientZone");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v22, "isEqualToClientZone:", self->_clientZone))
    {

    }
    else
    {
      -[PQLEnumeration parentClientZone](v17, "parentClientZone");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "isEqualToClientZone:", self->_clientZone);

      if (v24)
      {
        -[PQLEnumeration parentItemOnFS](v17, "parentItemOnFS");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "itemID");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = v25;
        goto LABEL_24;
      }
    }
    -[PQLEnumeration parentItemIDInZone](v17, "parentItemIDInZone");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 0;
LABEL_24:
    -[NSMutableArray addObject:](self->_stack, "addObject:", v17);
    if (-[NSMutableArray count](self->_stack, "count") >= (unint64_t)self->_maxDepth)
    {
      brc_bread_crumbs();
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v45 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
      {
        maxDepth = self->_maxDepth;
        *(_DWORD *)buf = v63;
        *(_DWORD *)v73 = maxDepth;
        *(_WORD *)&v73[4] = 2112;
        *(_QWORD *)&v73[6] = v17;
        *(_WORD *)&v73[14] = 2112;
        *(_QWORD *)&v73[16] = v44;
        _os_log_impl(&dword_1CBD43000, v45, OS_LOG_TYPE_DEFAULT, "[WARNING] max depth %u reached at %@%@", buf, 0x1Cu);
      }

      goto LABEL_53;
    }
    v28 = -[PQLEnumeration isLost](v17, "isLost");
    v29 = v28;
    if (v28)
    {
      brc_bread_crumbs();
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
      {
        -[PQLEnumeration itemID](v17, "itemID");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)v73 = v43;
        *(_WORD *)&v73[8] = 2112;
        *(_QWORD *)&v73[10] = v30;
        _os_log_debug_impl(&dword_1CBD43000, v31, OS_LOG_TYPE_DEBUG, "[DEBUG] Sync: denylist %@ because it's lost%@", buf, 0x16u);

      }
    }
    -[BRCClientZone itemIDsBlockedFromSyncForCZMProcessing](self->_clientZone, "itemIDsBlockedFromSyncForCZMProcessing");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[PQLEnumeration itemGlobalID](v17, "itemGlobalID");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend(v32, "containsObject:", v33);

    if (!v34)
    {
      if ((v29 & 1) != 0)
        goto LABEL_52;
      v35 = -[BRCSyncUpEnumerator _checkForSharesWithinSharesWithItem:](self, "_checkForSharesWithinSharesWithItem:", v17);
      if (!v35 && v67)
        v35 = -[BRCSyncUpEnumerator _checkIfShouldDenylistForParentDirectoryFaultWithItem:needsDirFaultCheck:](self, "_checkIfShouldDenylistForParentDirectoryFaultWithItem:needsDirFaultCheck:", v17, &v67);
      if (v35
        || -[BRCSyncUpEnumerator _checkIfShouldDenylistForPathMatch:](self, "_checkIfShouldDenylistForPathMatch:", v17)
        || -[NSMutableSet containsObject:](self->_itemIDsLostOrThrottled, "containsObject:", v26))
      {
        goto LABEL_52;
      }
      if (-[BRCSyncUpEnumerator handleItemForOSUpgrade:parentItemID:](self, "handleItemForOSUpgrade:parentItemID:", v17, v26)|| -[BRCSyncUpEnumerator _handlePendingShareItemWithPendingDeleteChildren:](self, "_handlePendingShareItemWithPendingDeleteChildren:", v17))
      {
        goto LABEL_53;
      }
      -[NSMutableDictionary objectForKey:](self->_visitedItemIDsToDepthMap, "objectForKey:", v26);
      v36 = (void *)objc_claimAutoreleasedReturnValue();

      if (v36)
      {
        -[NSMutableDictionary objectForKeyedSubscript:](self->_visitedItemIDsToDepthMap, "objectForKeyedSubscript:", v26);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        self->_currentDepth = objc_msgSend(v49, "intValue");

        goto LABEL_53;
      }
      if ((objc_msgSend(v26, "isNonDesktopRoot") & 1) != 0)
        goto LABEL_53;
      v37 = v27;
      if (!v27)
      {
        objc_msgSend(0, "clientZone");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        -[PQLEnumeration clientZone](v17, "clientZone");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = objc_msgSend(v38, "isEqualToClientZone:", v39);

        if ((v40 & 1) != 0)
          goto LABEL_62;
        if (!v26)
          goto LABEL_63;
        -[PQLEnumeration clientZone](v17, "clientZone");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "itemByItemID:", v26);
        v37 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v37)
        {
LABEL_62:

LABEL_63:
          brc_bread_crumbs();
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v54 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v54, OS_LOG_TYPE_FAULT))
          {
            clientZone = self->_clientZone;
            *(_DWORD *)buf = 138412802;
            *(_QWORD *)v73 = clientZone;
            *(_WORD *)&v73[8] = 2112;
            *(_QWORD *)&v73[10] = v17;
            *(_WORD *)&v73[18] = 2112;
            *(_QWORD *)&v73[20] = v53;
            _os_log_fault_impl(&dword_1CBD43000, v54, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: reset needed for %@ because of orphan %@%@", buf, 0x20u);
          }

          -[BRCClientZone scheduleResetServerAndClientTruthsForReason:](self->_clientZone, "scheduleResetServerAndClientTruthsForReason:", CFSTR("orphan.live"));
          v52 = 0;
          v55 = v65;
          goto LABEL_70;
        }
      }
      -[BRCSyncUpEnumerator _checkIfParentNeedsRevivalWithParentItem:item:](self, "_checkIfParentNeedsRevivalWithParentItem:item:", v37, v17);
      v42 = v37;

      v17 = (PQLEnumeration *)v42;
      continue;
    }
    break;
  }
  brc_bread_crumbs();
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v48 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG))
  {
    -[PQLEnumeration itemID](v17, "itemID");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)v73 = v50;
    *(_WORD *)&v73[8] = 2112;
    *(_QWORD *)&v73[10] = v47;
    _os_log_debug_impl(&dword_1CBD43000, v48, OS_LOG_TYPE_DEBUG, "[DEBUG] Sync: denylist %@ because it's already being processed for CZM%@", buf, 0x16u);

  }
LABEL_52:
  -[BRCSyncUpEnumerator _denyListDescendantStack:parentItem:andAddToSet:](self, "_denyListDescendantStack:parentItem:andAddToSet:", self->_stack, v17, self->_itemIDsLostOrThrottled);
LABEL_53:

  if (!-[NSMutableArray count](self->_stack, "count"))
  {
    v13 = v17;
    v14 = v64;
    v11 = v65;
    goto LABEL_55;
  }
  v55 = v65;
  if ((unint64_t)-[NSMutableArray count](self->_stack, "count") >= 2)
  {
    v56 = 1;
    do
    {
      -[NSMutableArray objectAtIndexedSubscript:](self->_stack, "objectAtIndexedSubscript:", v56);
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray objectAtIndexedSubscript:](self->_stack, "objectAtIndexedSubscript:", v56 - 1);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "checkIsInDocumentsScopeWithParent:", v58);

      ++v56;
    }
    while (v56 < -[NSMutableArray count](self->_stack, "count"));
  }
  -[BRCSyncUpEnumerator _nextLiveItem](self, "_nextLiveItem");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_70:

LABEL_71:
  return v52;
}

- (id)_nextTombstone
{
  void *v3;
  id v4;
  int *v5;
  int *v6;
  void *v7;
  void *v8;
  _BOOL4 v9;
  NSMutableArray *stack;
  void *v11;
  int *v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  NSObject *v34;
  NSMutableDictionary *v35;
  NSMutableDictionary *tombstonesEmbargo;
  void *v37;
  NSObject *v38;
  void *v39;
  void *v40;
  void *v41;
  NSObject *v42;
  void *v43;
  NSObject *v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  BOOL v49;
  void *v50;
  void *v51;
  void *v52;
  char v53;
  void *v54;
  _BOOL4 v55;
  void *v56;
  NSObject *v57;
  NSMutableSet *itemIDsWithChildrenBeingCopiedToNewZone;
  void *v59;
  void *v60;
  int v61;
  NSMutableSet *v62;
  void *v63;
  void *v64;
  char v65;
  void *v66;
  NSObject *v67;
  uint64_t v68;
  void *v69;
  NSObject *v70;
  NSMutableSet *itemIDsNeedingDirectoryFetch;
  void *v72;
  uint64_t v73;
  void *v74;
  char v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  NSObject *v80;
  NSObject *v81;
  unsigned int maxDepth;
  void *v83;
  NSObject *v84;
  void *v85;
  NSObject *v86;
  void *v87;
  void *v88;
  void *v89;
  NSObject *v90;
  NSMutableSet *v91;
  void *v92;
  uint64_t v93;
  unint64_t v94;
  void *v95;
  void *v96;
  void *v97;
  NSObject *v98;
  void *v99;
  NSObject *v100;
  void *v101;
  NSObject *v102;
  void *v103;
  NSObject *v104;
  BRCClientZone *clientZone;
  id v107;
  id v108;
  void *v109;
  uint64_t v110;
  void *v111;
  void *v112;
  char v113;
  id obj;
  uint64_t v115;
  uint64_t v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  uint8_t v121[128];
  uint8_t buf[4];
  _BYTE v123[28];
  uint64_t v124;

  v124 = *MEMORY[0x1E0C80C00];
  v110 = brc_current_date_nsec();
  v3 = 0;
  v4 = 0;
  v5 = &OBJC_IVAR___BRCSyncUpEnumerator__returned;
  v6 = &OBJC_IVAR___BRCSyncUpEnumerator__returned;
  while (2)
  {
    while (1)
    {
      v7 = v4;
      -[NSMutableArray firstObject](self->_stack, "firstObject");
      v4 = (id)objc_claimAutoreleasedReturnValue();

      if (!v4)
        break;
      v8 = (void *)MEMORY[0x1D17A6BE8]();
      v9 = -[BRCSyncUpEnumerator shouldDenylistRemainingDeletionParentStackForItem:](self, "shouldDenylistRemainingDeletionParentStackForItem:", v4);
      stack = self->_stack;
      if (v9)
      {
        -[NSMutableArray removeAllObjects](stack, "removeAllObjects");
        objc_autoreleasePoolPop(v8);
        break;
      }
      -[NSMutableArray removeObjectAtIndex:](stack, "removeObjectAtIndex:", 0);
      if (!objc_msgSend(v4, "isDirectory"))
        goto LABEL_37;
      objc_msgSend(v4, "itemID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_visitedItemIDsToDepthMap, "setObject:forKeyedSubscript:", &unk_1E87D7A78, v11);
      if (objc_msgSend(v4, "syncUpState") == 4)
      {
        v12 = v5;
        v13 = *v6;
        if ((objc_msgSend(*(id *)((char *)&self->super.super.isa + v13), "containsIndex:", objc_msgSend(v4, "dbRowID")) & 1) != 0)
        {
          v14 = 3;
          v5 = v12;
        }
        else
        {
          -[NSMutableDictionary objectForKeyedSubscript:](self->_tombstonesEmbargo, "objectForKeyedSubscript:", v11);
          v15 = objc_claimAutoreleasedReturnValue();

          v3 = (void *)v15;
          if (!v15)
          {
            -[BRCClientZone db](self->_clientZone, "db");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = *(uint64_t *)((char *)&self->super.super.isa + v13);
            -[BRCClientZone dbRowID](self->_clientZone, "dbRowID");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = objc_msgSend(v18, "numberWithSQL:", CFSTR("SELECT COUNT(*) FROM client_items  WHERE item_parent_id = %@     AND item_localsyncupstate = 4    AND NOT indexset_contains(%p, rowid)    AND zone_rowid = %@    AND item_state != -2"), v11, v19, v20);

            v111 = (void *)v21;
            if (!v21)
            {
              brc_bread_crumbs();
              v99 = (void *)objc_claimAutoreleasedReturnValue();
              brc_default_log();
              v100 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v100, OS_LOG_TYPE_FAULT))
              {
                *(_DWORD *)buf = 138412290;
                *(_QWORD *)v123 = v99;
                _os_log_fault_impl(&dword_1CBD43000, v100, OS_LOG_TYPE_FAULT, "[CRIT] Assertion failed: n%@", buf, 0xCu);
              }

            }
            -[BRCClientZone mangledID](self->_clientZone, "mangledID");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", v22);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = objc_msgSend(v23, "checkTombstoneEmbargoReparents");

            if (v24)
            {
              -[BRCClientZone db](self->_clientZone, "db");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              -[BRCClientZone dbRowID](self->_clientZone, "dbRowID");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              v27 = (void *)objc_msgSend(v25, "numberWithSQL:", CFSTR("SELECT COUNT(*) FROM server_items AS si INNER JOIN client_items AS ci USING (item_id, zone_rowid) WHERE si.item_parent_id = %@ AND si.zone_rowid = %@ AND ci.item_parent_id != si.item_parent_id AND ci.item_localsyncupstate != 0 AND NOT indexset_contains(%p, ci.rowid)"), v11, v26, *(Class *)((char *)&self->super.super.isa + v13));

              if (!v27)
              {
                brc_bread_crumbs();
                v101 = (void *)objc_claimAutoreleasedReturnValue();
                brc_default_log();
                v102 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v102, OS_LOG_TYPE_FAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  *(_QWORD *)v123 = v101;
                  _os_log_fault_impl(&dword_1CBD43000, v102, OS_LOG_TYPE_FAULT, "[CRIT] Assertion failed: reparentedOutCount%@", buf, 0xCu);
                }

              }
              v28 = v111;
              if (objc_msgSend(v27, "unsignedLongLongValue"))
              {
                brc_bread_crumbs();
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                brc_default_log();
                v30 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
                {
                  v31 = objc_msgSend(v27, "unsignedLongLongValue");
                  *(_DWORD *)buf = 138412802;
                  *(_QWORD *)v123 = v11;
                  *(_WORD *)&v123[8] = 2048;
                  *(_QWORD *)&v123[10] = v31;
                  *(_WORD *)&v123[18] = 2112;
                  *(_QWORD *)&v123[20] = v29;
                  _os_log_impl(&dword_1CBD43000, v30, OS_LOG_TYPE_DEFAULT, "[WARNING] Item %@ has %llu items with a new parent%@", buf, 0x20u);
                }

                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v27, "unsignedLongLongValue") + objc_msgSend(v111, "unsignedLongLongValue"));
                v32 = objc_claimAutoreleasedReturnValue();

                v28 = (void *)v32;
              }

            }
            else
            {
              v28 = v111;
            }
            if (!objc_msgSend(v28, "BOOLValue"))
            {

              v3 = 0;
LABEL_35:
              v5 = v12;
              goto LABEL_36;
            }
            if (!self->_tombstonesEmbargo)
            {
              v35 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
              tombstonesEmbargo = self->_tombstonesEmbargo;
              self->_tombstonesEmbargo = v35;

            }
            brc_bread_crumbs();
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            brc_default_log();
            v38 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412802;
              *(_QWORD *)v123 = v11;
              *(_WORD *)&v123[8] = 2112;
              *(_QWORD *)&v123[10] = v28;
              *(_WORD *)&v123[18] = 2112;
              *(_QWORD *)&v123[20] = v37;
              _os_log_debug_impl(&dword_1CBD43000, v38, OS_LOG_TYPE_DEBUG, "[DEBUG] Embargoing item %@: it has %@ unsynced children%@", buf, 0x20u);
            }

            -[NSMutableDictionary setObject:forKeyedSubscript:](self->_tombstonesEmbargo, "setObject:forKeyedSubscript:", v28, v11);
            v3 = v28;
            if (!v28)
              goto LABEL_35;
          }
          if (!objc_msgSend(v3, "integerValue"))
          {
            brc_bread_crumbs();
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            brc_default_log();
            v34 = objc_claimAutoreleasedReturnValue();
            v5 = v12;
            if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412546;
              *(_QWORD *)v123 = v11;
              *(_WORD *)&v123[8] = 2112;
              *(_QWORD *)&v123[10] = v33;
              _os_log_debug_impl(&dword_1CBD43000, v34, OS_LOG_TYPE_DEBUG, "[DEBUG] Item %@ is un-embargoed%@", buf, 0x16u);
            }

            -[NSMutableDictionary removeObjectForKey:](self->_tombstonesEmbargo, "removeObjectForKey:", v11);
LABEL_36:

LABEL_37:
            objc_msgSend(v4, "st");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v39, "parentID");
            v11 = (void *)objc_claimAutoreleasedReturnValue();

            -[NSMutableDictionary objectForKeyedSubscript:](self->_tombstonesEmbargo, "objectForKeyedSubscript:", v11);
            v40 = (void *)objc_claimAutoreleasedReturnValue();

            if (v40)
            {
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v40, "integerValue") - 1);
              v3 = (void *)objc_claimAutoreleasedReturnValue();

              brc_bread_crumbs();
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              brc_default_log();
              v42 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412802;
                *(_QWORD *)v123 = v11;
                *(_WORD *)&v123[8] = 2112;
                *(_QWORD *)&v123[10] = v3;
                *(_WORD *)&v123[18] = 2112;
                *(_QWORD *)&v123[20] = v41;
                _os_log_debug_impl(&dword_1CBD43000, v42, OS_LOG_TYPE_DEBUG, "[DEBUG] Embargoed item %@ has now %@ unreturned dead children left%@", buf, 0x20u);
              }

              -[NSMutableDictionary setObject:forKeyedSubscript:](self->_tombstonesEmbargo, "setObject:forKeyedSubscript:", v3, v11);
            }
            else
            {
              brc_bread_crumbs();
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              brc_default_log();
              v44 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412546;
                *(_QWORD *)v123 = v11;
                *(_WORD *)&v123[8] = 2112;
                *(_QWORD *)&v123[10] = v43;
                _os_log_debug_impl(&dword_1CBD43000, v44, OS_LOG_TYPE_DEBUG, "[DEBUG] item %@ isn't embargoed%@", buf, 0x16u);
              }

              v3 = 0;
            }
            v6 = &OBJC_IVAR___BRCSyncUpEnumerator__returned;
            if (-[BRCSyncUpEnumerator _denyListDescendantStackAndItemIfThrottledOrNeedsOSUpgrade:now:](self, "_denyListDescendantStackAndItemIfThrottledOrNeedsOSUpgrade:now:", v4, v110))
            {
              v14 = 4;
            }
            else
            {
              -[NSMutableIndexSet addIndex:](self->_returned, "addIndex:", objc_msgSend(v4, "dbRowID"));
              v108 = v4;
              v14 = 1;
            }
            goto LABEL_47;
          }
          brc_bread_crumbs();
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v17 = objc_claimAutoreleasedReturnValue();
          v5 = v12;
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412802;
            *(_QWORD *)v123 = v11;
            *(_WORD *)&v123[8] = 2112;
            *(_QWORD *)&v123[10] = v3;
            *(_WORD *)&v123[18] = 2112;
            *(_QWORD *)&v123[20] = v16;
            _os_log_debug_impl(&dword_1CBD43000, v17, OS_LOG_TYPE_DEBUG, "[DEBUG] Item %@ is embargoed: %@ unsynced children%@", buf, 0x20u);
          }

          -[NSMutableArray removeAllObjects](self->_stack, "removeAllObjects");
          v14 = 4;
          v6 = &OBJC_IVAR___BRCSyncUpEnumerator__returned;
        }
      }
      else
      {
        v14 = 3;
      }
LABEL_47:

      objc_autoreleasePoolPop(v8);
      if (v14 != 3)
      {
        if (v14 != 4)
        {
          v107 = v108;
          goto LABEL_144;
        }
        break;
      }
    }
    if (-[NSMutableArray count](self->_stack, "count"))
    {
      brc_bread_crumbs();
      v97 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v98 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v98, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)v123 = v97;
        _os_log_fault_impl(&dword_1CBD43000, v98, OS_LOG_TYPE_FAULT, "[CRIT] Assertion failed: _stack.count == 0%@", buf, 0xCu);
      }

    }
    v119 = 0u;
    v120 = 0u;
    v117 = 0u;
    v118 = 0u;
    obj = *(id *)((char *)&self->super.super.isa + v5[4]);
    v115 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v117, v121, 16);
    if (!v115)
    {
      v50 = 0;
      v107 = 0;
      v45 = v4;
      goto LABEL_143;
    }
    v112 = v3;
    v116 = *(_QWORD *)v118;
    v45 = v4;
    while (2)
    {
      v46 = 0;
LABEL_53:
      if (*(_QWORD *)v118 != v116)
        objc_enumerationMutation(obj);
      v4 = *(id *)(*((_QWORD *)&v117 + 1) + 8 * v46);

      v47 = *v6;
      if ((objc_msgSend(*(id *)((char *)&self->super.super.isa + v47), "containsIndex:", objc_msgSend(v4, "dbRowID")) & 1) != 0
        || (objc_msgSend(v4, "itemID"),
            v48 = (void *)objc_claimAutoreleasedReturnValue(),
            v49 = -[BRCSyncUpEnumerator isDenyListed:](self, "isDenyListed:", v48),
            v48,
            v49))
      {
LABEL_117:
        v45 = v4;
        if (++v46 == v115)
        {
          v93 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v117, v121, 16);
          v115 = v93;
          if (!v93)
          {
            v50 = 0;
            v107 = 0;
            v3 = v112;
            goto LABEL_143;
          }
          continue;
        }
        goto LABEL_53;
      }
      break;
    }
    -[NSMutableArray addObject:](self->_stack, "addObject:", v4);
    if (-[NSMutableArray count](self->_stack, "count") >= (unint64_t)self->_maxDepth)
    {
      v45 = 0;
LABEL_103:
      brc_bread_crumbs();
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v81 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT))
      {
        maxDepth = self->_maxDepth;
        *(_DWORD *)buf = 67109634;
        *(_DWORD *)v123 = maxDepth;
        *(_WORD *)&v123[4] = 2112;
        *(_QWORD *)&v123[6] = v4;
        *(_WORD *)&v123[14] = 2112;
        *(_QWORD *)&v123[16] = v52;
        _os_log_impl(&dword_1CBD43000, v81, OS_LOG_TYPE_DEFAULT, "[WARNING] max depth %u reached at %@%@", buf, 0x1Cu);
      }

LABEL_111:
      v6 = &OBJC_IVAR___BRCSyncUpEnumerator__returned;

      if (v45)
      {
        brc_bread_crumbs();
        v85 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v86 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v86, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(v45, "debugItemIDString");
          v88 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          *(_QWORD *)v123 = v88;
          *(_WORD *)&v123[8] = 2112;
          *(_QWORD *)&v123[10] = v85;
          _os_log_debug_impl(&dword_1CBD43000, v86, OS_LOG_TYPE_DEBUG, "[DEBUG] Fetching recursive contents of %@ because it is the highest dead parent dir-fault%@", buf, 0x16u);

        }
        -[BRCClientZone fetchRecursiveDirectoryContentsIfNecessary:isUserWaiting:rescheduleApply:](self->_clientZone, "fetchRecursiveDirectoryContentsIfNecessary:isUserWaiting:rescheduleApply:", v45, 0, 1);
        v87 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v87, "beginObservingChanges");

        v6 = &OBJC_IVAR___BRCSyncUpEnumerator__returned;
      }
      if (-[NSMutableArray count](self->_stack, "count"))
      {
        if ((unint64_t)-[NSMutableArray count](self->_stack, "count") >= 2)
        {
          v94 = 1;
          do
          {
            -[NSMutableArray objectAtIndexedSubscript:](self->_stack, "objectAtIndexedSubscript:", v94);
            v95 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMutableArray objectAtIndexedSubscript:](self->_stack, "objectAtIndexedSubscript:", v94 - 1);
            v96 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v95, "checkIsInDocumentsScopeWithParent:", v96);

            ++v94;
          }
          while (v94 < -[NSMutableArray count](self->_stack, "count"));
        }

        v3 = v112;
        v5 = &OBJC_IVAR___BRCSyncUpEnumerator__returned;
        continue;
      }

      goto LABEL_117;
    }
    break;
  }
  v45 = 0;
  v113 = 0;
  v50 = v4;
  while (1)
  {
    objc_msgSend(v50, "st");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "parentID");
    v52 = (void *)objc_claimAutoreleasedReturnValue();

    v53 = objc_msgSend(v50, "isLost");
    if (objc_msgSend(v50, "isDead") && objc_msgSend(v50, "isDirectory"))
    {
      if ((v113 & 1) != 0
        || (objc_msgSend(v50, "asDirectory"),
            v54 = (void *)objc_claimAutoreleasedReturnValue(),
            v55 = -[BRCSyncUpEnumerator _checkIfShouldDenylistForChildrenOfItemBeingCopiedToNewZone:](self, "_checkIfShouldDenylistForChildrenOfItemBeingCopiedToNewZone:", v54), v54, v55))
      {
        brc_bread_crumbs();
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v57 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v57, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412546;
          *(_QWORD *)v123 = v50;
          *(_WORD *)&v123[8] = 2112;
          *(_QWORD *)&v123[10] = v56;
          _os_log_debug_impl(&dword_1CBD43000, v57, OS_LOG_TYPE_DEBUG, "[DEBUG] denylist all deletes for item which has children being copied to a new zone %@%@", buf, 0x16u);
        }

        itemIDsWithChildrenBeingCopiedToNewZone = self->_itemIDsWithChildrenBeingCopiedToNewZone;
        objc_msgSend(v50, "itemID");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableSet addObject:](itemIDsWithChildrenBeingCopiedToNewZone, "addObject:", v59);

        v113 = 1;
        if (v45)
        {
LABEL_66:
          objc_msgSend(v50, "asDirectory");
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          v61 = objc_msgSend(v60, "isDirectoryFault");

          if (!v61)
          {
LABEL_80:
            itemIDsNeedingDirectoryFetch = self->_itemIDsNeedingDirectoryFetch;
            objc_msgSend(v50, "itemID");
            v72 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMutableSet addObject:](itemIDsNeedingDirectoryFetch, "addObject:", v72);

            goto LABEL_81;
          }
LABEL_72:
          if (objc_msgSend(v50, "isSharedToMeTopLevelItem"))
          {
            brc_bread_crumbs();
            v66 = (void *)objc_claimAutoreleasedReturnValue();
            brc_default_log();
            v67 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v67, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412546;
              *(_QWORD *)v123 = v50;
              *(_WORD *)&v123[8] = 2112;
              *(_QWORD *)&v123[10] = v66;
              _os_log_debug_impl(&dword_1CBD43000, v67, OS_LOG_TYPE_DEBUG, "[DEBUG] Highest parent dead fault is nil because it's a shared-to-me top level item - %@%@", buf, 0x16u);
            }

            v68 = 0;
          }
          else
          {
            brc_bread_crumbs();
            v69 = (void *)objc_claimAutoreleasedReturnValue();
            brc_default_log();
            v70 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v70, OS_LOG_TYPE_DEBUG))
            {
              objc_msgSend(v50, "itemID");
              v109 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v109, "itemIDString");
              v78 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              *(_QWORD *)v123 = v78;
              *(_WORD *)&v123[8] = 2112;
              *(_QWORD *)&v123[10] = v69;
              _os_log_debug_impl(&dword_1CBD43000, v70, OS_LOG_TYPE_DEBUG, "[DEBUG] Highest parent dead fault is %@%@", buf, 0x16u);

            }
            objc_msgSend(v50, "itemID");
            v68 = objc_claimAutoreleasedReturnValue();
          }

          v45 = (void *)v68;
          goto LABEL_80;
        }
      }
      else
      {
        v113 = 0;
        if (v45)
          goto LABEL_66;
      }
      v62 = self->_itemIDsNeedingDirectoryFetch;
      objc_msgSend(v50, "itemID");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[NSMutableSet containsObject:](v62, "containsObject:", v63))
      {

      }
      else
      {
        objc_msgSend(v50, "asDirectory");
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        v65 = objc_msgSend(v64, "containsDirFault");

        if ((v65 & 1) == 0)
        {
          v45 = 0;
          goto LABEL_81;
        }
      }
      goto LABEL_72;
    }
LABEL_81:
    if (objc_msgSend(v50, "isSharedToMeTopLevelItem")
      && objc_msgSend(v50, "isDirectory")
      && objc_msgSend(v50, "isAlmostDead")
      && -[BRCClientZone isSharedZone](self->_clientZone, "isSharedZone"))
    {
      brc_bread_crumbs();
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v90 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v90, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)v123 = v50;
        *(_WORD *)&v123[8] = 2112;
        *(_QWORD *)&v123[10] = v89;
        _os_log_debug_impl(&dword_1CBD43000, v90, OS_LOG_TYPE_DEBUG, "[DEBUG] denylist all children deletes when leaving top level folder share %@%@", buf, 0x16u);
      }

      -[BRCSyncUpEnumerator _denyListDescendantStack:parentItem:andAddToSet:](self, "_denyListDescendantStack:parentItem:andAddToSet:", self->_stack, v50, self->_itemIDsLostOrThrottled);
      if (!(v113 & 1 | ((objc_msgSend(v50, "isDead") & 1) == 0)))
      {
        v91 = self->_itemIDsWithChildrenBeingCopiedToNewZone;
        objc_msgSend(v50, "itemID");
        v92 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v91) = -[NSMutableSet containsObject:](v91, "containsObject:", v92);

        if ((v91 & 1) == 0)
        {
          objc_msgSend(*(id *)((char *)&self->super.super.isa + v47), "addIndex:", objc_msgSend(v50, "dbRowID"));
          v107 = v50;
          goto LABEL_142;
        }
      }
LABEL_110:
      v4 = v50;
      goto LABEL_111;
    }
    -[NSMutableDictionary objectForKey:](self->_visitedItemIDsToDepthMap, "objectForKey:", v52);
    v73 = objc_claimAutoreleasedReturnValue();
    if (v73 && (v74 = (void *)v73, v75 = objc_msgSend(v50, "isLost"), v74, (v75 & 1) == 0))
    {
      if ((objc_msgSend(v50, "isLive") & 1) != 0)
        goto LABEL_110;
      if ((objc_msgSend(v50, "isDead") & 1) == 0)
      {
        brc_bread_crumbs();
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v80 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v80, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)v123 = v79;
          _os_log_fault_impl(&dword_1CBD43000, v80, OS_LOG_TYPE_FAULT, "[CRIT] Assertion failed: item.isDead%@", buf, 0xCu);
        }

      }
    }
    else
    {
      if ((v53 & 1) != 0
        || -[NSMutableSet containsObject:](self->_itemIDsLostOrThrottled, "containsObject:", v52))
      {
        brc_bread_crumbs();
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v84 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v84, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412546;
          *(_QWORD *)v123 = v50;
          *(_WORD *)&v123[8] = 2112;
          *(_QWORD *)&v123[10] = v83;
          _os_log_debug_impl(&dword_1CBD43000, v84, OS_LOG_TYPE_DEBUG, "[DEBUG] denylisting %@ and its descendants%@", buf, 0x16u);
        }

        -[BRCSyncUpEnumerator _denyListDescendantStack:parentItem:andAddToSet:](self, "_denyListDescendantStack:parentItem:andAddToSet:", self->_stack, v50, self->_itemIDsLostOrThrottled);
        goto LABEL_110;
      }
      if (-[BRCSyncUpEnumerator handleItemForOSUpgrade:parentItemID:](self, "handleItemForOSUpgrade:parentItemID:", v50, v52))
      {
        goto LABEL_110;
      }
    }
    objc_msgSend(v50, "parentItemIDInZone");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v76, "isNonDesktopRoot"))
    {

      goto LABEL_110;
    }
    if (!v76)
      break;
    objc_msgSend(v50, "clientZone");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v77, "itemByItemID:", v76);
    v4 = (id)objc_claimAutoreleasedReturnValue();

    if (!v4)
      break;

    -[NSMutableArray addObject:](self->_stack, "addObject:", v4);
    v50 = v4;
    if (-[NSMutableArray count](self->_stack, "count") >= (unint64_t)self->_maxDepth)
      goto LABEL_103;
  }
  brc_bread_crumbs();
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v104 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v104, OS_LOG_TYPE_FAULT))
  {
    clientZone = self->_clientZone;
    *(_DWORD *)buf = 138412802;
    *(_QWORD *)v123 = clientZone;
    *(_WORD *)&v123[8] = 2112;
    *(_QWORD *)&v123[10] = v50;
    *(_WORD *)&v123[18] = 2112;
    *(_QWORD *)&v123[20] = v103;
    _os_log_fault_impl(&dword_1CBD43000, v104, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: reset needed for %@ because of orphan %@%@", buf, 0x20u);
  }

  -[BRCClientZone scheduleResetServerAndClientTruthsForReason:](self->_clientZone, "scheduleResetServerAndClientTruthsForReason:", CFSTR("orphan.tombstone"));
  v107 = 0;
LABEL_142:
  v3 = v112;

LABEL_143:
  v4 = v50;
LABEL_144:

  return v107;
}

- (id)nextObject
{
  int stage;
  void *v4;
  void *enumerator;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  PQLEnumeration *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  stage = self->_stage;
  if (stage <= 3)
  {
    do
    {
      if ((stage - 1) > 1)
      {
        if (stage == 3)
        {
          -[BRCSyncUpEnumerator _nextTombstone](self, "_nextTombstone");
          v4 = (void *)objc_claimAutoreleasedReturnValue();
          if (v4)
            return v4;
        }
      }
      else
      {
        -[BRCSyncUpEnumerator _nextLiveItem](self, "_nextLiveItem");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        if (v4)
          return v4;
      }
      stage = self->_stage + 1;
      self->_stage = stage;
      switch(stage)
      {
        case 0:
          brc_bread_crumbs();
          enumerator = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v6 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 138412290;
            v16 = enumerator;
            _os_log_fault_impl(&dword_1CBD43000, v6, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: Sync: shouldn't be here%@", buf, 0xCu);
          }
          goto LABEL_22;
        case 1:
          brc_bread_crumbs();
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v8 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v16 = v7;
            _os_log_debug_impl(&dword_1CBD43000, v8, OS_LOG_TYPE_DEBUG, "[DEBUG] Sync: enumerating documents needing sync up%@", buf, 0xCu);
          }

          -[BRCSyncUpEnumerator _documentsOrAliasesNeedingSyncUpEnumerator](self, "_documentsOrAliasesNeedingSyncUpEnumerator");
          v9 = (PQLEnumeration *)objc_claimAutoreleasedReturnValue();
          goto LABEL_19;
        case 2:
          brc_bread_crumbs();
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v11 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v16 = v10;
            _os_log_debug_impl(&dword_1CBD43000, v11, OS_LOG_TYPE_DEBUG, "[DEBUG] Sync: enumerating live or new directories%@", buf, 0xCu);
          }

          -[BRCSyncUpEnumerator _liveDirectoriesNeedingSyncUpEnumerator](self, "_liveDirectoriesNeedingSyncUpEnumerator");
          v9 = (PQLEnumeration *)objc_claimAutoreleasedReturnValue();
          goto LABEL_19;
        case 3:
          brc_bread_crumbs();
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v16 = v12;
            _os_log_debug_impl(&dword_1CBD43000, v13, OS_LOG_TYPE_DEBUG, "[DEBUG] Sync: enumerating tombstones%@", buf, 0xCu);
          }

          -[BRCSyncUpEnumerator _tombstoneLeavesNeedingSyncUpEnumerator](self, "_tombstoneLeavesNeedingSyncUpEnumerator");
          v9 = (PQLEnumeration *)objc_claimAutoreleasedReturnValue();
LABEL_19:
          enumerator = self->_enumerator;
          self->_enumerator = v9;
          goto LABEL_23;
        case 4:
          brc_bread_crumbs();
          enumerator = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v6 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v16 = enumerator;
            _os_log_debug_impl(&dword_1CBD43000, v6, OS_LOG_TYPE_DEBUG, "[DEBUG] Sync: done enumerating all stages%@", buf, 0xCu);
          }
LABEL_22:

LABEL_23:
          stage = self->_stage;
          break;
        default:
          break;
      }
    }
    while (stage < 4);
  }
  v4 = 0;
  return v4;
}

- (unsigned)batchSize
{
  return self->_batchSize;
}

- (unint64_t)retryAfter
{
  return self->_retryAfter;
}

- (NSMutableSet)chainedParentIDAllowlist
{
  return self->_chainedParentIDAllowlist;
}

- (NSMutableArray)itemsNeedingUnshare
{
  return self->_itemsNeedingUnshare;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemsNeedingUnshare, 0);
  objc_storeStrong((id *)&self->_chainedParentIDAllowlist, 0);
  objc_storeStrong((id *)&self->_tooDeepItems, 0);
  objc_storeStrong((id *)&self->_stack, 0);
  objc_storeStrong((id *)&self->_enumerator, 0);
  objc_storeStrong((id *)&self->_returned, 0);
  objc_storeStrong((id *)&self->_tombstonesEmbargo, 0);
  objc_storeStrong((id *)&self->_itemIDsWithChildrenBeingCopiedToNewZone, 0);
  objc_storeStrong((id *)&self->_itemIDsNeedingDirectoryFetch, 0);
  objc_storeStrong((id *)&self->_itemIDsNeedingOSUpgrade, 0);
  objc_storeStrong((id *)&self->_itemIDsLostOrThrottled, 0);
  objc_storeStrong((id *)&self->_visitedItemIDsToDepthMap, 0);
  objc_storeStrong((id *)&self->_clientZone, 0);
}

- (void)_denyListDescendantStackAndItemIfThrottledOrNeedsOSUpgrade:now:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] Sync: denylist %@ because it needs a newer OS to sync up%@");
  OUTLINED_FUNCTION_2();
}

- (void)handleItemForOSUpgrade:parentItemID:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] marking needs-upgrade %@ and its descendants%@");
  OUTLINED_FUNCTION_2();
}

- (void)_handleSharedItemWhichMovedToNewShare:rootItem:.cold.1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_1();
  _os_log_fault_impl(&dword_1CBD43000, v0, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: Unexpected item %@. Ignoring%@", v1, 0x16u);
  OUTLINED_FUNCTION_2();
}

- (void)_handleSharedItemWhichMovedToNewShare:rootItem:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] Just learning share property changes from %@%@");
  OUTLINED_FUNCTION_2();
}

- (void)_handleSharedItemWhichMovedToNewShare:rootItem:.cold.3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] We need to unshare %@%@");
  OUTLINED_FUNCTION_2();
}

- (void)_checkForSharesWithinSharesWithItem:(uint64_t)a3 .cold.1(void *a1, uint64_t a2, uint64_t a3, NSObject *a4)
{
  *(_DWORD *)a3 = 138412546;
  *(_QWORD *)(a3 + 4) = a1;
  *(_WORD *)(a3 + 12) = 2112;
  *(_QWORD *)(a3 + 14) = a2;
  OUTLINED_FUNCTION_3_2(&dword_1CBD43000, a4, a3, "[DEBUG] Sync: denylist %@ because it is moving into a share and has shared children%@", (uint8_t *)a3);

}

- (void)_checkForSharesWithinSharesWithItem:(NSObject *)a3 .cold.2(void *a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  uint64_t v6;
  int v7;
  void *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "itemID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138412546;
  v8 = v5;
  v9 = 2112;
  v10 = a2;
  OUTLINED_FUNCTION_3_2(&dword_1CBD43000, a3, v6, "[DEBUG] Sync: denylist %@ for item share-within-share processing%@", (uint8_t *)&v7);

}

- (void)_handlePendingShareItemWithPendingDeleteChildren:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_1CBD43000, a2, OS_LOG_TYPE_DEBUG, "[DEBUG] Not waiting for deletes because of a default%@", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_2();
}

- (void)_nextLiveItem
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_fault_impl(&dword_1CBD43000, a2, OS_LOG_TYPE_FAULT, "[CRIT] Assertion failed: _stack.count == 0%@", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_2();
}

@end
