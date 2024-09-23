@implementation BRCServerChangesApplyUtil

+ (BOOL)shouldForceApplyContentForItem:(id)a3
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
  void *v12;
  BOOL v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
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
  void *v31;
  void *v32;
  int v33;
  void *v34;
  char v35;
  void *v37;
  void *v38;
  void *v39;
  char v40;
  void *v41;
  void *v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (!objc_msgSend(v3, "isFault"))
    goto LABEL_23;
  objc_msgSend(v3, "st");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stagedFileID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    goto LABEL_23;
  objc_msgSend(v3, "parentClientZone");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "itemIDsBlockedFromSyncForCZMProcessing");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "itemGlobalID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v7, "containsObject:", v8))
  {
    objc_msgSend(v3, "clientZone");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "parentsOfCZMFaults");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "itemID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {

      goto LABEL_6;
    }
    objc_msgSend(v3, "clientZone");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "parentsOfCZMFaults");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "st");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "parentID");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectForKeyedSubscript:");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      objc_msgSend(v3, "parentClientZone");
      v37 = v15;
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "clientZone");
      v38 = v14;
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = objc_msgSend(v17, "isEqualToClientZone:", v18);

      v14 = v38;
      v15 = v37;
    }
    else
    {
      v40 = 0;
    }

    if ((v40 & 1) != 0)
      goto LABEL_7;
    objc_msgSend(v3, "clientZone");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "parentsOfCZMFaults");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "count");

    if (v21)
    {
      objc_msgSend(v3, "clientZone");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "parentsOfCZMFaults");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "allKeys");
      v42 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v3, "setOfParentIDs");
      v43 = 0u;
      v44 = 0u;
      v45 = 0u;
      v46 = 0u;
      v24 = (id)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
      if (v25)
      {
        v26 = v25;
        v27 = *(_QWORD *)v44;
        while (2)
        {
          for (i = 0; i != v26; ++i)
          {
            if (*(_QWORD *)v44 != v27)
              objc_enumerationMutation(v24);
            v29 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * i);
            objc_msgSend(v29, "zoneRowID");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v3, "clientZone");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "dbRowID");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            v33 = objc_msgSend(v30, "br_isEqualToNumber:", v32);

            if (v33)
            {
              objc_msgSend(v29, "itemID");
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              v35 = objc_msgSend(v42, "containsObject:", v34);

              if ((v35 & 1) != 0)
              {

                goto LABEL_7;
              }
            }
          }
          v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
          if (v26)
            continue;
          break;
        }
      }

    }
LABEL_23:
    v13 = 0;
    goto LABEL_24;
  }
LABEL_6:

LABEL_7:
  v13 = 1;
LABEL_24:

  return v13;
}

+ (BOOL)checkEarlyExitsPriorToApplying:(id)a3 si:(id)a4 rank:(int64_t)a5 scheduler:(id)a6 zone:(id)a7 session:(id)a8 isDeleteOfShareRoot:(BOOL)a9 diffs:(unint64_t)a10 clientZone:(id)a11
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  BOOL v22;
  void *v24;
  uint64_t v25;

  v16 = a3;
  v17 = a4;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v21 = a11;
  LOBYTE(v25) = a9;
  if (+[BRCServerChangesApplyUtil_Private localItemHasUnsyncedChanges:si:rank:scheduler:clientZone:zone:isDeleteOfShareRoot:session:](BRCServerChangesApplyUtil_Private, "localItemHasUnsyncedChanges:si:rank:scheduler:clientZone:zone:isDeleteOfShareRoot:session:", v16, v17, a5, v18, v21, v19, v25, v20)|| +[BRCServerChangesApplyUtil_Private serverItemDeadWithNoLiveLocalItem:si:rank:scheduler:clientZone:zone:](BRCServerChangesApplyUtil_Private, "serverItemDeadWithNoLiveLocalItem:si:rank:scheduler:clientZone:zone:", v16, v17, a5, v18, v21, v19)
    || +[BRCServerChangesApplyUtil_Private serverItemWouldBeParentedToDeadFolder:si:rank:scheduler:zone:diffs:](BRCServerChangesApplyUtil_Private, "serverItemWouldBeParentedToDeadFolder:si:rank:scheduler:zone:diffs:", v16, v17, a5, v18, v19, a10))
  {
    v22 = 1;
  }
  else
  {
    objc_msgSend(v17, "parentItemIDOnFS");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = +[BRCServerChangesApplyUtil_Private appLibraryUndergoingCZM:zone:rank:parentID:scheduler:session:](BRCServerChangesApplyUtil_Private, "appLibraryUndergoingCZM:zone:rank:parentID:scheduler:session:", v16, v19, a5, v24, v18, v20)|| +[BRCServerChangesApplyUtil_Private itemUndergoingCZMToAnotherZone:si:clientZone:rank:scheduler:zone:](BRCServerChangesApplyUtil_Private, "itemUndergoingCZMToAnotherZone:si:clientZone:rank:scheduler:zone:", v16, v17, v21, a5, v18, v19);

  }
  return v22;
}

+ (BOOL)handleApplyChangesForUnliveServerItem:(id)a3 isDeleteOfShareRoot:(BOOL)a4 rank:(int64_t)a5 scheduler:(id)a6 zone:(id)a7 session:(id)a8
{
  _BOOL4 v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  NSObject *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  BOOL v22;
  void *v23;
  int v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  __CFString *v34;
  NSObject *v35;
  void *v36;
  const __CFString *v38;
  int64_t v39;
  _QWORD v40[4];
  id v41;
  uint8_t buf[4];
  id v43;
  __int16 v44;
  const __CFString *v45;
  __int16 v46;
  void *v47;
  uint64_t v48;

  v12 = a4;
  v48 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a6;
  v15 = a7;
  v16 = a8;
  brc_bread_crumbs();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    v38 = CFSTR("NO");
    *(_DWORD *)buf = 138412802;
    v43 = v13;
    v44 = 2112;
    if (v12)
      v38 = CFSTR("YES");
    v45 = v38;
    v46 = 2112;
    v47 = v17;
    _os_log_debug_impl(&dword_1CBD43000, v18, OS_LOG_TYPE_DEBUG, "[DEBUG] handleApplyChangesForUnliveServerItem for %@\ndelete share root: %@%@", buf, 0x20u);
  }

  if (objc_msgSend(v13, "isFSRoot"))
  {
    brc_bread_crumbs();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      +[BRCServerChangesApplyUtil handleApplyChangesForUnliveServerItem:isDeleteOfShareRoot:rank:scheduler:zone:session:].cold.1();

    objc_msgSend(v13, "markItemForgottenByServer");
    objc_msgSend(v13, "markForceNeedsSyncUp");
    objc_msgSend(v15, "dbRowID");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setState:forRank:zoneRowID:", 0, a5, v21);

    v22 = 1;
    objc_msgSend(v13, "saveToDBForServerEdit:keepAliases:", 1, 0);
  }
  else if (objc_msgSend(v13, "isDirectory")
         && (objc_msgSend(v13, "asDirectory"),
             v23 = (void *)objc_claimAutoreleasedReturnValue(),
             v24 = objc_msgSend(v23, "hasLiveChildren"),
             v23,
             v24))
  {
    brc_bread_crumbs();
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
      +[BRCServerChangesApplyUtil handleApplyChangesForUnliveServerItem:isDeleteOfShareRoot:rank:scheduler:zone:session:].cold.2();

    if (v12)
    {
      v39 = a5;
      objc_msgSend(v13, "db");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "itemID");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "clientZone");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "dbRowID");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = (void *)objc_msgSend(v27, "fetch:", CFSTR("SELECT rowid, zone_rowid, item_id, item_creator_id, item_sharing_options, item_side_car_ckinfo, item_parent_zone_rowid, item_localsyncupstate, item_local_diffs, item_notifs_rank, app_library_rowid, item_min_supported_os_rowid, item_user_visible, item_stat_ckinfo, item_state, item_type, item_mode, item_birthtime, item_lastusedtime, item_favoriterank,item_parent_id, item_filename, item_hidden_ext, item_finder_tags, item_xattr_signature, item_trash_put_back_path, item_trash_put_back_parent_id, item_alias_target, item_creator, item_doc_id, item_file_id, item_generation, item_localname, item_processing_stamp, item_staged_file_id, item_staged_generation, item_bouncedname, item_scope, item_tmpbounceno, version_name, version_ckinfo, version_mtime, version_size, version_thumb_size, version_thumb_signature, version_content_signature, version_xattr_signature, version_edited_since_shared, version_device, version_conflict_loser_etags, version_quarantine_info, version_uploaded_assets, version_upload_error, version_old_zone_item_id, version_old_zone_rowid, desired_version, item_live_conflict_loser_etags, item_thumb_live_signature, item_thumb_greedy, version_block_sync_until_bundle_id, version_block_sync_until_timestamp FROM client_items WHERE item_stat_ckinfo IS NULL AND item_parent_id = %@ AND zone_rowid = %@"), v28, v30);

      if (objc_msgSend(v31, "next"))
      {
        do
        {
          v32 = (void *)MEMORY[0x1D17A6BE8]();
          v40[0] = MEMORY[0x1E0C809B0];
          v40[1] = 3221225472;
          v40[2] = __115__BRCServerChangesApplyUtil_handleApplyChangesForUnliveServerItem_isDeleteOfShareRoot_rank_scheduler_zone_session___block_invoke;
          v40[3] = &unk_1E875E2C8;
          v41 = v16;
          objc_msgSend(v31, "object:", v40);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          brc_bread_crumbs();
          v34 = (__CFString *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v35 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412546;
            v43 = v13;
            v44 = 2112;
            v45 = v34;
            _os_log_debug_impl(&dword_1CBD43000, v35, OS_LOG_TYPE_DEBUG, "[DEBUG] Marking item unknown to server %@ as rejected%@", buf, 0x16u);
          }

          objc_msgSend(v33, "markForceRejected");
          objc_msgSend(v33, "saveToDB");

          objc_autoreleasePoolPop(v32);
        }
        while ((objc_msgSend(v31, "next") & 1) != 0);
      }

      a5 = v39;
    }
    objc_msgSend(v15, "dbRowID");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setState:forRank:zoneRowID:", 25, a5, v36);

    v22 = 1;
  }
  else
  {
    v22 = 0;
  }

  return v22;
}

id __115__BRCServerChangesApplyUtil_handleApplyChangesForUnliveServerItem_isDeleteOfShareRoot_rank_scheduler_zone_session___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = *(void **)(a1 + 32);
  v5 = a2;
  objc_msgSend(v4, "clientDB");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "newLocalItemFromPQLResultSet:db:error:", v5, v6, a3);

  return v7;
}

+ (BOOL)deletingShareRoot:(id)a3 localItem:(id)a4
{
  id v5;
  int v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = a4;
  v6 = objc_msgSend(a3, "isDead");
  if (a3 && !v6)
    goto LABEL_8;
  if ((objc_msgSend(v5, "isSharedToMeTopLevelItem") & 1) != 0)
  {
    v7 = 1;
    goto LABEL_9;
  }
  if (!objc_msgSend(v5, "isSharedToMeChildItem"))
  {
LABEL_8:
    v7 = 0;
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0C95070], "brc_fetchShareIDWithSharedItem:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "brc_shareItemID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "clientZone");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "serverItemByItemID:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
    v7 = objc_msgSend(v11, "isDead");
  else
    v7 = 1;

LABEL_9:
  return v7;
}

+ (BOOL)handleNonRevivedItemIfNecessary:(id)a3 si:(id)a4 rank:(int64_t)a5 scheduler:(id)a6 zone:(id)a7 hasInitialScanItemTypeMismatch:(BOOL *)a8
{
  id v13;
  id v14;
  id v15;
  BOOL v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  unsigned int v26;
  unsigned int v27;
  void *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  unsigned int v34;
  void *v35;
  NSObject *v36;
  void *v38;
  void *v39;
  uint8_t buf[4];
  void *v41;
  __int16 v42;
  id v43;
  __int16 v44;
  void *v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v13 = a4;
  v14 = a6;
  v15 = a7;
  if (!a3)
  {
    if (a8)
      *a8 = 0;
    objc_msgSend(v13, "parentItemIDOnFS");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "clientZone");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "st");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "logicalName");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "itemByParentID:andLogicalName:", v17, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (!objc_msgSend(v21, "isFromInitialScan"))
      goto LABEL_40;
    brc_bread_crumbs();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412802;
      v41 = v21;
      v42 = 2112;
      v43 = v13;
      v44 = 2112;
      v45 = v22;
      _os_log_debug_impl(&dword_1CBD43000, v23, OS_LOG_TYPE_DEBUG, "[DEBUG] Found a freshly scanned item from an initial scan that path matches: %@ for server item: %@%@", buf, 0x20u);
    }

    objc_msgSend(v21, "clientZone");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "clientZone");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v24, "isEqualToClientZone:", v25))
      goto LABEL_35;
    if (objc_msgSend(v21, "isFSRoot") && (objc_msgSend(v13, "isDirectory") & 1) != 0)
      goto LABEL_22;
    objc_msgSend(v21, "st");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v39, "type");
    objc_msgSend(v13, "st");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v38, "type");
    if (v26 != v27)
    {
      if (v26 > 0xA)
        goto LABEL_34;
      if (((1 << v26) & 0x611) == 0)
      {
        if (((1 << v26) & 0x106) != 0)
        {
LABEL_15:
          if (v27 > 8 || ((1 << v27) & 0x106) == 0)
          {
            if (v26 != 6)
              goto LABEL_34;
            goto LABEL_29;
          }
          goto LABEL_21;
        }
        if (v26 == 6)
        {
LABEL_29:
          v34 = v27;

          if (v34 != 6)
          {
LABEL_36:
            brc_bread_crumbs();
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            brc_default_log();
            v36 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
              +[BRCServerChangesApplyUtil handleNonRevivedItemIfNecessary:si:rank:scheduler:zone:hasInitialScanItemTypeMismatch:].cold.3();

            if (a8)
            {
              v16 = 0;
              *a8 = 1;
LABEL_41:

              goto LABEL_42;
            }
LABEL_40:
            v16 = 0;
            goto LABEL_41;
          }
LABEL_23:
          brc_bread_crumbs();
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v29 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
            +[BRCServerChangesApplyUtil handleNonRevivedItemIfNecessary:si:rank:scheduler:zone:hasInitialScanItemTypeMismatch:].cold.2();

          objc_msgSend(v13, "itemID");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "learnItemID:serverItem:path:markLost:", v30, v13, 0, 1);

          objc_msgSend(v21, "saveToDBForServerEdit:keepAliases:", 1, 0);
          brc_bread_crumbs();
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v32 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
            +[BRCServerChangesApplyUtil handleNonRevivedItemIfNecessary:si:rank:scheduler:zone:hasInitialScanItemTypeMismatch:].cold.1();

          objc_msgSend(v15, "dbRowID");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "setState:forRank:zoneRowID:", 22, a5, v33);

          v16 = 1;
          goto LABEL_41;
        }
LABEL_34:

LABEL_35:
        goto LABEL_36;
      }
      if (v27 > 0xA || ((1 << v27) & 0x611) == 0)
      {
        if (v26 - 1 < 2)
          goto LABEL_15;
        if (v26 == 6)
          goto LABEL_29;
        if (v26 == 8)
          goto LABEL_15;
        goto LABEL_34;
      }
    }
LABEL_21:

LABEL_22:
    goto LABEL_23;
  }
  v16 = 0;
LABEL_42:

  return v16;
}

+ (BOOL)handleEtagsChangesOnly:(id)a3 si:(id)a4 rank:(int64_t)a5 scheduler:(id)a6 zone:(id)a7 diffs:(unint64_t *)a8 needsSave:(BOOL *)a9
{
  id v14;
  id v15;
  id v16;
  id v17;
  unint64_t v18;
  void *v19;
  NSObject *v20;
  BOOL v21;
  void *v23;
  NSObject *v24;
  void *v25;

  v14 = a3;
  v15 = a4;
  v16 = a6;
  v17 = a7;
  if (!v14 || (objc_msgSend(v14, "isReserved") & 1) != 0)
    goto LABEL_9;
  v18 = *a8;
  if ((*a8 & 0x7FFF) == 1)
  {
    brc_bread_crumbs();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      +[BRCServerChangesApplyUtil handleEtagsChangesOnly:si:rank:scheduler:zone:diffs:needsSave:].cold.2();

    objc_msgSend(v14, "updateStructuralCKInfoFromServerItem:", v15);
    *a9 = 1;
    v18 = *a8 & 0xFFFFFFFFFFFFFFFELL;
    *a8 = v18;
  }
  if (v18 || (objc_msgSend(v14, "isDocument") & 1) != 0)
  {
LABEL_9:
    v21 = 0;
  }
  else
  {
    brc_bread_crumbs();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
      +[BRCServerChangesApplyUtil handleEtagsChangesOnly:si:rank:scheduler:zone:diffs:needsSave:].cold.1();

    objc_msgSend(v17, "dbRowID");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setState:forRank:zoneRowID:", 0, a5, v25);

    v21 = 1;
    if (a9)
      objc_msgSend(v14, "saveToDBForServerEdit:keepAliases:", 1, 0);
  }

  return v21;
}

+ (void)handleApplyChangesForUnliveServerItem:isDeleteOfShareRoot:rank:scheduler:zone:session:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_1(&dword_1CBD43000, v0, v1, "[DEBUG] the fs root was remotely deleted, we need to recreate it and reupload it%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

+ (void)handleApplyChangesForUnliveServerItem:isDeleteOfShareRoot:rank:scheduler:zone:session:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] Apply Changes[%lld]: postponing rank (live child)%@");
  OUTLINED_FUNCTION_2();
}

+ (void)handleNonRevivedItemIfNecessary:si:rank:scheduler:zone:hasInitialScanItemTypeMismatch:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] Suspending rank since freshly scanned means either same content or conflict: %@%@");
  OUTLINED_FUNCTION_2();
}

+ (void)handleNonRevivedItemIfNecessary:si:rank:scheduler:zone:hasInitialScanItemTypeMismatch:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_1(&dword_1CBD43000, v0, v1, "[DEBUG] Item type matches with the server item type%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

+ (void)handleNonRevivedItemIfNecessary:si:rank:scheduler:zone:hasInitialScanItemTypeMismatch:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_1(&dword_1CBD43000, v0, v1, "[DEBUG] Item type does not match with the server item type%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

+ (void)handleEtagsChangesOnly:si:rank:scheduler:zone:diffs:needsSave:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] Remove rank for item with no real changes: %@%@");
  OUTLINED_FUNCTION_2();
}

+ (void)handleEtagsChangesOnly:si:rank:scheduler:zone:diffs:needsSave:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] Accepting Structural Etag update for %@%@");
  OUTLINED_FUNCTION_2();
}

@end
