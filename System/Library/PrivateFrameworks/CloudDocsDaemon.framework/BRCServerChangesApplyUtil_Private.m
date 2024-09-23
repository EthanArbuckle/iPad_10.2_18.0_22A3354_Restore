@implementation BRCServerChangesApplyUtil_Private

+ (BOOL)itemUndergoingCZMToAnotherZone:(id)a3 si:(id)a4 clientZone:(id)a5 rank:(int64_t)a6 scheduler:(id)a7 zone:(id)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  int v17;
  BOOL v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  NSObject *v26;
  void *v27;
  int64_t v29;

  v13 = a4;
  v14 = a5;
  v15 = a7;
  v16 = a8;
  v17 = objc_msgSend(v13, "isDocument");
  v18 = 0;
  if (!a3 && v17)
  {
    v29 = a6;
    objc_msgSend(v14, "db");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "itemID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "clientZone");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "dbRowID");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)objc_msgSend(v19, "numberWithSQL:", CFSTR("SELECT 1 FROM client_items WHERE version_old_zone_item_id = %@ AND version_old_zone_rowid = %@"), v20, v22);
    v24 = objc_msgSend(v23, "BOOLValue");

    if (v24)
    {
      brc_bread_crumbs();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
        +[BRCServerChangesApplyUtil_Private itemUndergoingCZMToAnotherZone:si:clientZone:rank:scheduler:zone:].cold.1();

      objc_msgSend(v16, "dbRowID");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setState:forRank:zoneRowID:", 17, v29, v27);

      v18 = 1;
    }
    else
    {
      v18 = 0;
    }
  }

  return v18;
}

+ (BOOL)appLibraryUndergoingCZM:(id)a3 zone:(id)a4 rank:(int64_t)a5 parentID:(id)a6 scheduler:(id)a7 session:(id)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  char v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  BOOL v27;
  void *v29;

  v13 = a4;
  v14 = a6;
  v15 = a7;
  v16 = a8;
  if (a3)
    goto LABEL_10;
  if (!objc_msgSend(v14, "isNonDesktopRoot"))
    goto LABEL_10;
  if (!objc_msgSend(v13, "isCloudDocsZone"))
    goto LABEL_10;
  objc_msgSend(v14, "appLibraryRowID");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "clientZone");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "asPrivateClientZone");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "defaultAppLibrary");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "dbRowID");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v29, "isEqual:", v20);

  if ((v21 & 1) != 0)
    goto LABEL_10;
  objc_msgSend(v14, "appLibraryRowID");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "appLibraryByRowID:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v23, "state") & 0x200000) != 0)
  {

LABEL_10:
    v27 = 0;
    goto LABEL_11;
  }
  brc_bread_crumbs();
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
    +[BRCServerChangesApplyUtil_Private appLibraryUndergoingCZM:zone:rank:parentID:scheduler:session:].cold.1();

  objc_msgSend(v13, "dbRowID");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setState:forRank:zoneRowID:", 27, a5, v26);

  v27 = 1;
LABEL_11:

  return v27;
}

+ (BOOL)_handleApplyingDeletedUnlistedDirectoryIfNecessary:(id)a3 localItem:(id)a4 parent:(id)a5
{
  id v7;
  id v8;
  id v9;
  int v10;
  BOOL v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  int v29;
  id v30;
  __int16 v31;
  id v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = objc_msgSend(v9, "isDead");
  v11 = 0;
  if (v8 || !v10)
    goto LABEL_12;
  objc_msgSend(v9, "st");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "ckInfo");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v13, "hasDeletionChangeToken") & 1) == 0)
  {

    goto LABEL_11;
  }
  objc_msgSend(v7, "clientZone");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "clientZone");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v14, "isEqualToClientZone:", v15);

  if (!v16)
  {
LABEL_11:
    v11 = 0;
    v8 = 0;
    goto LABEL_12;
  }
  brc_bread_crumbs();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    v29 = 138412802;
    v30 = v7;
    v31 = 2112;
    v32 = v9;
    v33 = 2112;
    v34 = v17;
    _os_log_debug_impl(&dword_1CBD43000, v18, OS_LOG_TYPE_DEBUG, "[DEBUG] New item %@ older than a deleted directory %@ so marking dead%@", (uint8_t *)&v29, 0x20u);
  }

  objc_msgSend(v7, "serverZone");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v7, "newLocalItemWithServerZone:dbRowID:", v19, objc_msgSend(0, "dbRowID"));

  objc_msgSend(v8, "markDead");
  objc_msgSend(v9, "st");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "ckInfo");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "deletionChangeToken");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "isDocument"))
  {
    objc_msgSend(v8, "asDocument");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "currentVersion");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "ckInfo");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setDeletionChangeToken:", v22);

  }
  objc_msgSend(v8, "st");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "ckInfo");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setDeletionChangeToken:", v22);

  objc_msgSend(v8, "markNeedsUploadOrSyncingUp");
  objc_msgSend(v8, "saveToDB");

  v11 = 1;
LABEL_12:

  return v11;
}

+ (BOOL)serverItemWouldBeParentedToDeadFolder:(id)a3 si:(id)a4 rank:(int64_t)a5 scheduler:(id)a6 zone:(id)a7 diffs:(unint64_t)a8
{
  char v8;
  id v14;
  id v15;
  id v16;
  id v17;
  int v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  BOOL v29;
  void *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  __CFString *v37;
  void *v38;
  NSObject *v39;
  uint8_t buf[4];
  int64_t v41;
  __int16 v42;
  __CFString *v43;
  __int16 v44;
  void *v45;
  uint64_t v46;

  v8 = a8;
  v46 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = a6;
  v17 = a7;
  if (v14)
  {
    v18 = objc_msgSend(v14, "isReserved");
    if ((v8 & 0x20) == 0 && !v18)
      goto LABEL_23;
  }
  if (!objc_msgSend(v15, "isLive"))
    goto LABEL_23;
  objc_msgSend(v15, "parentLocalItemOnFS");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v19;
  if (v19 && (objc_msgSend(v19, "isAlmostDead") & 1) == 0)
  {
    objc_msgSend(v20, "fileID");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (v22)
      v21 = objc_msgSend(v20, "isReserved");
    else
      v21 = 1;

  }
  else
  {
    v21 = 1;
  }
  if ((objc_msgSend(a1, "_handleApplyingDeletedUnlistedDirectoryIfNecessary:localItem:parent:", v15, v14, v20) & 1) == 0)
  {
    if (v21)
    {
      if (v20)
        goto LABEL_17;
      if (!objc_msgSend(v15, "shouldBeGreedyForApply"))
        goto LABEL_17;
      objc_msgSend(v15, "clientZone");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "parentItemIDOnFS");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "serverItemByItemID:", v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      if (v25)
      {
LABEL_17:
        brc_bread_crumbs();
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
        {
          if (v20)
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" parent = %@"), v20);
            v37 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v37 = &stru_1E8769030;
          }
          *(_DWORD *)buf = 134218498;
          v41 = a5;
          v42 = 2112;
          v43 = v37;
          v44 = 2112;
          v45 = v26;
          _os_log_debug_impl(&dword_1CBD43000, v27, OS_LOG_TYPE_DEBUG, "[DEBUG] Apply Changes[%lld]: postponing rank (missing parent)%@%@", buf, 0x20u);
          if (v20)

        }
        if (objc_msgSend(v14, "isReserved"))
        {
          brc_bread_crumbs();
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v39 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v39, OS_LOG_TYPE_FAULT))
            +[BRCServerChangesApplyUtil_Private serverItemWouldBeParentedToDeadFolder:si:rank:scheduler:zone:diffs:].cold.2();

        }
        objc_msgSend(v17, "dbRowID");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setState:forRank:zoneRowID:", 21, a5, v28);
      }
      else
      {
        brc_bread_crumbs();
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v32 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
          +[BRCServerChangesApplyUtil_Private serverItemWouldBeParentedToDeadFolder:si:rank:scheduler:zone:diffs:].cold.1();

        objc_msgSend(v17, "dbRowID");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setState:forRank:zoneRowID:", 16, a5, v33);

        objc_msgSend(v15, "parentZoneOnFS");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "clientZone");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "parentItemIDOnFS");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = (id)objc_msgSend(v34, "fetchParentChainIfNecessaryWithParentItemID:isUserWaiting:", v35, 0);

      }
      goto LABEL_21;
    }

LABEL_23:
    v29 = 0;
    goto LABEL_24;
  }
LABEL_21:

  v29 = 1;
LABEL_24:

  return v29;
}

+ (BOOL)serverItemDeadWithNoLiveLocalItem:(id)a3 si:(id)a4 rank:(int64_t)a5 scheduler:(id)a6 clientZone:(id)a7 zone:(id)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  BOOL v22;

  v13 = a3;
  v14 = a4;
  v15 = a6;
  v16 = a7;
  v17 = a8;
  if ((!v14 || objc_msgSend(v14, "isDead"))
    && (!v13 || (objc_msgSend(v13, "isDead") & 1) != 0 || objc_msgSend(v13, "isReserved")))
  {
    objc_msgSend(v13, "markNeedsDeleteForRescheduleOfItem:", 0);
    if (objc_msgSend(v13, "isSharedToMeTopLevelItem"))
    {
      objc_msgSend(v13, "asSharedToMeTopLevelItem");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "insertTombstoneAliasRecordInZone:", 0);

    }
    objc_msgSend(v13, "saveToDBForServerEdit:keepAliases:", 1, 0);
    brc_bread_crumbs();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      +[BRCServerChangesApplyUtil_Private serverItemDeadWithNoLiveLocalItem:si:rank:scheduler:clientZone:zone:].cold.1();

    objc_msgSend(v17, "dbRowID");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setState:forRank:zoneRowID:", 0, a5, v21);

    objc_msgSend(v16, "didApplyTombstoneForRank:", a5);
    v22 = 1;
  }
  else
  {
    v22 = 0;
  }

  return v22;
}

+ (BOOL)localItemHasUnsyncedChanges:(id)a3 si:(id)a4 rank:(int64_t)a5 scheduler:(id)a6 clientZone:(id)a7 zone:(id)a8 isDeleteOfShareRoot:(BOOL)a9 session:(id)a10
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  NSObject *v22;
  BOOL v23;
  void *v24;
  NSObject *v25;
  void *v26;
  uint64_t v27;
  int v29;
  void *v30;
  NSObject *v31;
  void *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  NSObject *v42;
  uint64_t v43;
  void *v44;
  NSObject *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  void *v53;
  NSObject *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  int v61;
  const char *v62;
  void *v63;
  void *v64;
  char v65;
  NSObject *v66;
  void *v67;
  uint64_t v68;
  void *v69;
  int v70;
  uint8_t buf[4];
  id v72;
  __int16 v73;
  const char *v74;
  __int16 v75;
  void *v76;
  uint64_t v77;

  v77 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = a4;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v20 = a10;
  if (!a9)
  {
    if ((objc_msgSend(v15, "localDiffs") & 0x1000000000000000) != 0)
    {
      brc_bread_crumbs();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
        +[BRCServerChangesApplyUtil_Private localItemHasUnsyncedChanges:si:rank:scheduler:clientZone:zone:isDeleteOfShareRoot:session:].cold.6();

      objc_msgSend(v19, "dbRowID");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = v17;
      v27 = 22;
      goto LABEL_12;
    }
    if (+[BRCServerChangesApplyUtil shouldForceApplyContentForItem:](BRCServerChangesApplyUtil, "shouldForceApplyContentForItem:", v15))
    {
      brc_bread_crumbs();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
        +[BRCServerChangesApplyUtil_Private localItemHasUnsyncedChanges:si:rank:scheduler:clientZone:zone:isDeleteOfShareRoot:session:].cold.2();
      goto LABEL_4;
    }
    if (!v15 || (objc_msgSend(v15, "isIdleOrRejected") & 1) != 0)
    {
      v23 = 0;
      goto LABEL_15;
    }
    if ((objc_msgSend(v16, "isDead") & 1) != 0)
    {
      v29 = objc_msgSend(v15, "isDead");
      if ((objc_msgSend(v15, "isDirectory") & 1) == 0 && v29)
      {
        brc_bread_crumbs();
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v31 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
          +[BRCServerChangesApplyUtil_Private localItemHasUnsyncedChanges:si:rank:scheduler:clientZone:zone:isDeleteOfShareRoot:session:].cold.5();

        objc_msgSend(v15, "markNeedsDeleteForRescheduleOfItem:", 0);
        objc_msgSend(v15, "saveToDB");
LABEL_39:
        objc_msgSend(v18, "didApplyTombstoneForRank:", a5);
        objc_msgSend(v19, "dbRowID");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = v17;
        v27 = 0;
LABEL_12:
        objc_msgSend(v26, "setState:forRank:zoneRowID:", v27, a5, v21);
LABEL_13:
        v23 = 1;
        goto LABEL_14;
      }
      if ((objc_msgSend(v16, "isBRAlias") & v29) == 1)
      {
        brc_bread_crumbs();
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v42 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
          +[BRCServerChangesApplyUtil_Private localItemHasUnsyncedChanges:si:rank:scheduler:clientZone:zone:isDeleteOfShareRoot:session:].cold.3();

        goto LABEL_39;
      }
    }
    else
    {
      objc_msgSend(v15, "isDirectory");
      objc_msgSend(v16, "isBRAlias");
    }
    brc_bread_crumbs();
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
    {
      v61 = objc_msgSend(v16, "isDead");
      v62 = "";
      *(_DWORD *)buf = 138412802;
      v72 = v15;
      if (v61)
        v62 = "\n(dead in server truth)";
      v73 = 2080;
      v74 = v62;
      v75 = 2112;
      v76 = v32;
      _os_log_debug_impl(&dword_1CBD43000, v33, OS_LOG_TYPE_DEBUG, "[DEBUG] Suspending rank for item with conflicts: %@%s%@", buf, 0x20u);
    }

    objc_msgSend(v19, "dbRowID");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setState:forRank:zoneRowID:", 22, a5, v34);

    if (!v16)
    {
LABEL_50:
      if (objc_msgSend(v15, "isSharedToMeChildItem", v68))
      {
        objc_msgSend(v15, "st");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "ckInfo");
        v47 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v47)
        {
          v48 = objc_msgSend(v15, "localDiffs");
          objc_msgSend(v20, "syncUpScheduler");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "clientZone");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v50, "dbRowID");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          v52 = objc_msgSend(v49, "inFlightDiffsForItem:zoneRowID:", v15, v51) | v48;

          if (v52)
          {
            if ((v52 & 0xFEFFFFFFFFFFE5FFLL) == 0)
            {
              brc_bread_crumbs();
              v53 = (void *)objc_claimAutoreleasedReturnValue();
              brc_default_log();
              v54 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v54, OS_LOG_TYPE_DEBUG))
                +[BRCServerChangesApplyUtil_Private localItemHasUnsyncedChanges:si:rank:scheduler:clientZone:zone:isDeleteOfShareRoot:session:].cold.4();

              objc_msgSend(v16, "st");
              v55 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v55, "ckInfo");
              v56 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v15, "st");
              v57 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v57, "setCkInfo:", v56);

              objc_msgSend(v15, "saveToDBForServerEdit:keepAliases:", 1, 1);
              objc_msgSend(v20, "containerScheduler");
              v58 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v58, "scheduleSyncUpForSideCar");

            }
          }
        }
      }
      objc_msgSend(v15, "appLibrary");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v21, "state") & 4) != 0 || !objc_msgSend(v15, "needsSyncUp"))
        goto LABEL_13;
      objc_msgSend(v15, "clientZone");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v59, "isSyncBlocked"))
        goto LABEL_62;
      objc_msgSend(v15, "clientZone");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v60, "syncState") & 5) != 0)
      {

LABEL_62:
        goto LABEL_13;
      }
      objc_msgSend(v20, "syncUpScheduler");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      v70 = objc_msgSend(v63, "jobStateFor:", v15);

      if (v70 != 50)
      {
        v23 = 1;
        goto LABEL_15;
      }
      objc_msgSend(v15, "itemID");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v64, "isDocumentsFolder") & 1) == 0)
      {
        v65 = objc_msgSend(v15, "isSharedToMe");

        if ((v65 & 1) != 0)
        {
LABEL_73:
          objc_msgSend(v15, "clientZone");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "scheduleSyncUp");
          goto LABEL_13;
        }
        brc_bread_crumbs();
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v66 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v15, "clientZone");
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v72 = v67;
          v73 = 2112;
          v74 = (const char *)v64;
          _os_log_impl(&dword_1CBD43000, v66, OS_LOG_TYPE_DEFAULT, "[WARNING] client zone %@ forgot to sync up!%@", buf, 0x16u);

        }
      }

      goto LABEL_73;
    }
    objc_msgSend(v15, "st");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "ckInfo");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    if (v36 || (objc_msgSend(v19, "isPrivateZone") & 1) == 0)
    {
      if (!objc_msgSend(v15, "isDocument"))
      {
        if ((objc_msgSend(v15, "sharingOptions") & 0x7C) != 4)
        {

          goto LABEL_50;
        }
        v43 = objc_msgSend(v15, "localDiffs");

        if ((v43 & 0x1000000000000000) != 0)
          goto LABEL_50;
        goto LABEL_46;
      }
      v69 = v35;
      objc_msgSend(v15, "asDocument");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "currentVersion");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "ckInfo");
      v39 = objc_claimAutoreleasedReturnValue();
      if (v39)
      {
        v40 = (void *)v39;
        if ((objc_msgSend(v15, "sharingOptions") & 0x7C) != 4)
        {

          goto LABEL_50;
        }
        v68 = objc_msgSend(v15, "localDiffs");

        if ((v68 & 0x1000000000000000) != 0)
          goto LABEL_50;
        goto LABEL_46;
      }

      v35 = v69;
    }

LABEL_46:
    brc_bread_crumbs();
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v45 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412802;
      v72 = v15;
      v73 = 2112;
      v74 = (const char *)v16;
      v75 = 2112;
      v76 = v44;
      _os_log_debug_impl(&dword_1CBD43000, v45, OS_LOG_TYPE_DEBUG, "[DEBUG] Learning sharing options on local item %@ from %@%@", buf, 0x20u);
    }

    objc_msgSend(v15, "setSharingOptions:", objc_msgSend(v16, "sharingOptions"));
    objc_msgSend(v15, "saveToDBForServerEdit:keepAliases:", 1, 1);
    goto LABEL_50;
  }
  brc_bread_crumbs();
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    +[BRCServerChangesApplyUtil_Private localItemHasUnsyncedChanges:si:rank:scheduler:clientZone:zone:isDeleteOfShareRoot:session:].cold.1();
LABEL_4:

  v23 = 0;
LABEL_14:

LABEL_15:
  return v23;
}

+ (void)itemUndergoingCZMToAnotherZone:si:clientZone:rank:scheduler:zone:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] Apply Changes[%lld]: postponing rank (item CZM processing)%@");
  OUTLINED_FUNCTION_2();
}

+ (void)appLibraryUndergoingCZM:zone:rank:parentID:scheduler:session:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] Apply Changes[%lld]: postponing rank (ongoing cross-zone migration)%@");
  OUTLINED_FUNCTION_2();
}

+ (void)serverItemWouldBeParentedToDeadFolder:si:rank:scheduler:zone:diffs:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] Apply Changes[%lld]: postponing rank (missing parent while greedy)%@");
  OUTLINED_FUNCTION_2();
}

+ (void)serverItemWouldBeParentedToDeadFolder:si:rank:scheduler:zone:diffs:.cold.2()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_4_0();
  _os_log_fault_impl(&dword_1CBD43000, v0, OS_LOG_TYPE_FAULT, "[CRIT] Assertion failed: !li.isReserved%@", v1, 0xCu);
  OUTLINED_FUNCTION_2();
}

+ (void)serverItemDeadWithNoLiveLocalItem:si:rank:scheduler:clientZone:zone:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_1(&dword_1CBD43000, v0, v1, "[DEBUG] Dead item doesn't need any action%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

+ (void)localItemHasUnsyncedChanges:si:rank:scheduler:clientZone:zone:isDeleteOfShareRoot:session:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] Don't suspend delete of shared to me item %@%@");
  OUTLINED_FUNCTION_2();
}

+ (void)localItemHasUnsyncedChanges:si:rank:scheduler:clientZone:zone:isDeleteOfShareRoot:session:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] Not suspending download of an item that needs CZM processing %@%@");
  OUTLINED_FUNCTION_2();
}

+ (void)localItemHasUnsyncedChanges:si:rank:scheduler:clientZone:zone:isDeleteOfShareRoot:session:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_1(&dword_1CBD43000, v0, v1, "[DEBUG] Ignoring deletion of share alias with a locally dead item%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

+ (void)localItemHasUnsyncedChanges:si:rank:scheduler:clientZone:zone:isDeleteOfShareRoot:session:.cold.4()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] Learning structure etag on item with only side car diffs %@%@");
  OUTLINED_FUNCTION_2();
}

+ (void)localItemHasUnsyncedChanges:si:rank:scheduler:clientZone:zone:isDeleteOfShareRoot:session:.cold.5()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] Forcing deletion of item dead in both client and server truth %@%@");
  OUTLINED_FUNCTION_2();
}

+ (void)localItemHasUnsyncedChanges:si:rank:scheduler:clientZone:zone:isDeleteOfShareRoot:session:.cold.6()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] Suspending rank for item which needs an OOB sync ack %@%@");
  OUTLINED_FUNCTION_2();
}

@end
