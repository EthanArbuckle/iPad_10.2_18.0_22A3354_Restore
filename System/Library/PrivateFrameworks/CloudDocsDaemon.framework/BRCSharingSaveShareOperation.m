@implementation BRCSharingSaveShareOperation

- (BRCSharingSaveShareOperation)initWithShare:(id)a3 zone:(id)a4 sessionContext:(id)a5
{
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  BRCSharingSaveShareOperation *v16;
  objc_super v18;

  v8 = (void *)MEMORY[0x1E0C94F88];
  v9 = a5;
  v10 = a4;
  v11 = a3;
  objc_msgSend(v8, "br_sharingMisc");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[_BRCOperation setGroup:](self, "setGroup:", v12);

  objc_msgSend(v11, "recordID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "recordName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("sharing/save-share"), "stringByAppendingPathComponent:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v18.receiver = self;
  v18.super_class = (Class)BRCSharingSaveShareOperation;
  v16 = -[BRCSharingModifyShareOperation initWithName:zone:share:sessionContext:](&v18, sel_initWithName_zone_share_sessionContext_, v15, v10, v11, v9);

  return v16;
}

- (id)createActivity
{
  return _os_activity_create(&dword_1CBD43000, "sharing/save-share", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
}

- (void)performAfterUnsharingParentShareTurdIfNecessary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  BRCItemID *itemID;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  _QWORD v22[5];
  id v23;
  void *v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[BRCServerZone mangledID](self->super._serverZone, "mangledID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "maxSyncPathDepth");

  -[BRCServerZone clientZone](self->super._serverZone, "clientZone");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "db");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  itemID = self->super._itemID;
  -[BRCServerZone dbRowID](self->super._serverZone, "dbRowID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCServerZone dbRowID](self->super._serverZone, "dbRowID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v9, "itemIDWithSQL:", CFSTR(" WITH RECURSIVE item_parents (item_id, item_sharing_options, item_parent_id) AS(         SELECT item_id, item_sharing_options, item_parent_id FROM server_items           WHERE item_id = %@ AND zone_rowid = %@       UNION ALL          SELECT li.item_id, li.item_sharing_options, li.item_parent_id FROM server_items AS li     INNER JOIN item_parents AS p WHERE li.zone_rowid = %@ AND p.item_parent_id = li.item_id          LIMIT %u)        SELECT item_id FROM item_parents WHERE (item_sharing_options & %lu) == 4 AND item_id != %@ "), itemID, v11, v12, v7, 124, self->super._itemID);

  if (v13)
  {
    brc_bread_crumbs();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v26 = v13;
      v27 = 2112;
      v28 = v14;
      _os_log_impl(&dword_1CBD43000, v15, OS_LOG_TYPE_DEFAULT, "[WARNING] Unsharing turd folder share %@%@", buf, 0x16u);
    }

    v16 = objc_alloc(MEMORY[0x1E0C95070]);
    -[BRCServerZone zoneID](self->super._serverZone, "zoneID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(v16, "initShareIDWithItemID:zoneID:", v13, v17);

    v19 = objc_alloc(MEMORY[0x1E0C94F10]);
    v24 = v18;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v24, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)objc_msgSend(v19, "initWithRecordsToSave:recordIDsToDelete:", 0, v20);

    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __80__BRCSharingSaveShareOperation_performAfterUnsharingParentShareTurdIfNecessary___block_invoke;
    v22[3] = &unk_1E8761BF8;
    v22[4] = self;
    v23 = v4;
    objc_msgSend(v21, "setModifyRecordsCompletionBlock:", v22);
    -[_BRCOperation addSubOperation:](self, "addSubOperation:", v21);

  }
  else
  {
    (*((void (**)(id, BRCSharingSaveShareOperation *, _QWORD))v4 + 2))(v4, self, 0);
  }

}

uint64_t __80__BRCSharingSaveShareOperation_performAfterUnsharingParentShareTurdIfNecessary___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), a4);
}

- (void)main
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] UNREACHABLE: no share record%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __36__BRCSharingSaveShareOperation_main__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  id v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  int v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  int v39;
  void *v40;
  char v41;
  id v42;
  void *v43;
  void *v44;
  void *v45;
  NSObject *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  uint64_t v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  uint64_t v67;
  void *v68;
  NSObject *v69;
  void *v70;
  void *v71;
  NSObject *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  int v80;
  int v81;
  void *v82;
  id v83;
  id v84;
  void *v85;
  void *v86;
  void *v87;
  _QWORD v88[5];
  id v89;
  id v90;
  id v91;
  char v92;
  uint8_t buf[4];
  id v94;
  __int16 v95;
  void *v96;
  __int16 v97;
  void *v98;
  uint64_t v99;

  v99 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
  {
    v7 = *(id *)(*(_QWORD *)(a1 + 32) + 536);
    v8 = *(id *)(*(_QWORD *)(a1 + 32) + 520);
    objc_msgSend(v8, "clientZone");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 528), "isKnownToServer") & 1) != 0)
      v10 = 0;
    else
      v10 = objc_msgSend(v9, "isPrivateZone");
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObject:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 528));
    objc_msgSend(v9, "itemByItemID:", v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "serverItemByItemID:", v7);
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v12, "isShareableItem") & 1) == 0)
    {
      v20 = *(void **)(a1 + 32);
      objc_msgSend(MEMORY[0x1E0CB35C8], "brc_errorItemNotShareable");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "completedWithResult:error:", 0, v21);

      goto LABEL_77;
    }
    v80 = v10;
    v85 = v9;
    v86 = v11;
    v84 = v8;
    v13 = objc_msgSend(v12, "localDiffs");
    objc_msgSend(*(id *)(a1 + 32), "syncContext");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "session");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "syncUpScheduler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "inFlightDiffsForItem:", v12);

    if ((objc_msgSend(v12, "sharingOptions") & 0x48) != 0 && (objc_msgSend(v12, "sharingOptions") & 4) == 0)
    {
      v18 = *(void **)(a1 + 32);
      objc_msgSend(MEMORY[0x1E0CB35C8], "brc_errorItemAlreadyPartOfAShare");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "completedWithResult:error:", 0, v19);

LABEL_12:
      v8 = v84;
      v9 = v85;
LABEL_13:
      v11 = v86;
LABEL_77:

      goto LABEL_78;
    }
    v83 = v7;
    objc_msgSend(v12, "appLibrary");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "mangledID");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "preventSharingFolderWithPendingDelete");

    if (v25)
    {
      if (objc_msgSend(v12, "isDirectory"))
      {
        if ((objc_msgSend(v12, "isShared") & 1) == 0)
        {
          objc_msgSend(v12, "asDirectory");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = objc_msgSend(v26, "containsPendingDeleteDocuments");

          if (v27)
          {
            v28 = *(void **)(a1 + 32);
            objc_msgSend(MEMORY[0x1E0CB35C8], "brc_errorNotInCloud:", 0);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "completedWithResult:error:", 0, v29);

            v7 = v83;
            goto LABEL_12;
          }
        }
      }
    }
    v30 = v17 | v13;
    if (objc_msgSend(v12, "isDirectory")
      && (objc_msgSend(v12, "isSharedToMeTopLevelItem") & 1) == 0
      && objc_msgSend(v87, "pcsChainState") != 2
      && objc_msgSend(v87, "pcsChainState") != 3
      && (v30 & 0x1000000000000000) == 0)
    {
      v44 = *(void **)(a1 + 32);
      brc_bread_crumbs();
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v46 = objc_claimAutoreleasedReturnValue();
      v7 = v83;
      v9 = v85;
      if (os_log_type_enabled(v46, OS_LOG_TYPE_FAULT))
        __36__BRCSharingSaveShareOperation_main__block_invoke_cold_2(v12, (uint64_t)v45, v46);

      v47 = (void *)MEMORY[0x1E0CB35C8];
      v48 = *MEMORY[0x1E0D10C90];
      objc_msgSend(v12, "itemID");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "br_errorWithDomain:code:description:", v48, 15, CFSTR("unreachable: directory %@ isn't pcs chained"), v49);
      v50 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v44, "completedWithResult:error:", 0, v50);
      v8 = v84;
      goto LABEL_13;
    }
    if (objc_msgSend(v12, "isInTrashScope"))
    {
      v31 = *(void **)(a1 + 32);
      objc_msgSend(MEMORY[0x1E0CB35C8], "brc_errorItemInTrash");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "completedWithResult:error:", 0, v32);

    }
    v7 = v83;
    if (!v87 || (v30 & 0x40) != 0)
      v33 = v12;
    else
      v33 = v87;
    objc_msgSend(v33, "st");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "logicalName");
    v35 = objc_claimAutoreleasedReturnValue();

    v79 = (void *)v35;
    if (objc_msgSend(v12, "isDocument"))
    {
      objc_msgSend(v12, "asDocument");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "currentVersion");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "originalPOSIXName");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v38, "isEqualToString:", v35) & 1) != 0)
      {
        v39 = 0;
      }
      else
      {
        objc_msgSend(v12, "clientZone");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = objc_msgSend(v40, "isPrivateZone");

      }
    }
    else
    {
      v39 = 0;
    }
    v41 = v39 | v80;
    if ((v39 | v80) == 1)
    {
      v81 = v39;
      v42 = *(id *)(*(_QWORD *)(a1 + 32) + 544);
      v11 = v86;
      if (!v42)
      {
        if ((objc_msgSend(v12, "isDocument") & 1) != 0)
        {
          objc_msgSend(v12, "asDocument");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "baseRecord");
        }
        else
        {
          objc_msgSend(v12, "asDirectory");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "folderRootStructureRecord");
        }
        v42 = (id)objc_claimAutoreleasedReturnValue();

        if (!v42)
        {
          brc_bread_crumbs();
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v69 = objc_claimAutoreleasedReturnValue();
          v7 = v83;
          if (os_log_type_enabled(v69, (os_log_type_t)0x90u))
          {
            *(_DWORD *)buf = 138412802;
            v94 = v83;
            v95 = 2112;
            v96 = v12;
            v97 = 2112;
            v98 = v68;
            _os_log_error_impl(&dword_1CBD43000, v69, (os_log_type_t)0x90u, "[ERROR] Couldn't get base record for %@, %@%@", buf, 0x20u);
          }

          v70 = *(void **)(a1 + 32);
          brc_bread_crumbs();
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v72 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v72, OS_LOG_TYPE_FAULT))
            __36__BRCSharingSaveShareOperation_main__block_invoke_cold_1();

          objc_msgSend(MEMORY[0x1E0CB35C8], "br_errorWithDomain:code:description:", *MEMORY[0x1E0D10C90], 15, CFSTR("unreachable: couldn't get base record"));
          v73 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v70, "completedWithResult:error:", 0, v73);

          v9 = v85;
          goto LABEL_76;
        }
      }
      objc_msgSend(v42, "routingKey");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      if (v51)
      {
        objc_msgSend(v42, "setRoutingKey:", v51);
      }
      else
      {
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 528), "routingKey");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "setRoutingKey:", v52);

      }
      objc_msgSend(v42, "baseToken");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      if (v53)
      {
        objc_msgSend(v42, "setBaseToken:", v53);
      }
      else
      {
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 528), "baseToken");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "setBaseToken:", v54);

      }
      objc_msgSend(v42, "mutableEncryptedPublicSharingKeyData");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      if (v55)
      {
        objc_msgSend(v42, "setMutableEncryptedPublicSharingKeyData:", v55);
      }
      else
      {
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 528), "publicSharingIdentity");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "setMutableEncryptedPublicSharingKeyData:", v56);

      }
      if (objc_msgSend(v12, "isDocument"))
      {
        objc_msgSend(v12, "asDocument");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v57, "currentVersion");
      }
      else
      {
        objc_msgSend(v12, "asDirectory");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v57, "st");
      }
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "ckInfo");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "serializeSystemFields:", v59);

      if (v81)
      {
        +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        v61 = objc_msgSend(v60, "supportsEnhancedDrivePrivacy");

        if ((_DWORD)v61)
        {
          objc_msgSend(v85, "asPrivateClientZone");
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v62, "childBaseSaltForItemID:", v83);
          v63 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v12, "appLibrary");
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v64, "isCloudDocsAppLibrary"))
          {
            objc_msgSend(v12, "clientZone");
            v65 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v65, "isCloudDocsZone"))
            {
              objc_msgSend(v12, "parentItemIDInZone");
              v82 = v64;
              v66 = (void *)objc_claimAutoreleasedReturnValue();
              v67 = objc_msgSend(v66, "isNonDesktopRoot");

              v64 = v82;
            }
            else
            {
              v67 = 0;
            }

          }
          else
          {
            v67 = 0;
          }

          objc_msgSend(v12, "parentItemIDInZone");
          v74 = (void *)objc_claimAutoreleasedReturnValue();
          v61 = objc_msgSend(v74, "isDocumentsFolder");

        }
        else
        {
          v63 = 0;
          v67 = 0;
        }
        objc_msgSend(v42, "serializeFilename:forCreation:setExtension:basehashSalt:parentIDIsCloudDocsRoot:parentIDIsDocumentsFolder:", v79, 0, 0, v63, v67, v61);

        v11 = v86;
      }
      objc_msgSend(v11, "addObject:", v42);

      v7 = v83;
    }
    v75 = *(void **)(*(_QWORD *)(a1 + 32) + 528);
    objc_msgSend(v12, "st");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "logicalName");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "brc_updateWithLogicalName:isFolder:", v77, objc_msgSend(v12, "isDirectory"));

    v78 = *(void **)(a1 + 32);
    v88[0] = MEMORY[0x1E0C809B0];
    v88[1] = 3221225472;
    v88[2] = __36__BRCSharingSaveShareOperation_main__block_invoke_123;
    v88[3] = &unk_1E8765B90;
    v88[4] = v78;
    v92 = v41;
    v11 = v86;
    v89 = v86;
    v90 = v12;
    v9 = v85;
    v91 = v85;
    objc_msgSend(v78, "performAfterUnsharingParentShareTurdIfNecessary:", v88);

LABEL_76:
    v8 = v84;
    goto LABEL_77;
  }
  brc_bread_crumbs();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, (os_log_type_t)0x90u))
    __36__BRCSharingSaveShareOperation_main__block_invoke_cold_3();

  objc_msgSend(*(id *)(a1 + 32), "completedWithResult:error:", 0, v4);
LABEL_78:

}

void __36__BRCSharingSaveShareOperation_main__block_invoke_123(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  id v12;
  uint64_t v13;
  NSObject *v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, void *, uint64_t, void *);
  void *v19;
  id v20;
  uint64_t v21;
  id v22;
  id v23;
  id v24;
  char v25;
  uint8_t buf[4];
  id v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    brc_bread_crumbs();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v27 = v6;
      v28 = 2112;
      v29 = v7;
      _os_log_impl(&dword_1CBD43000, v8, OS_LOG_TYPE_DEFAULT, "[WARNING] Failed to unshare turd - %@%@", buf, 0x16u);
    }

  }
  brc_bread_crumbs();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    __36__BRCSharingSaveShareOperation_main__block_invoke_123_cold_1(a1, (uint64_t)v9, v10);

  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C94F10]), "initWithRecordsToSave:recordIDsToDelete:", *(_QWORD *)(a1 + 40), 0);
  objc_msgSend(v11, "setSavePolicy:", 0);
  objc_msgSend(v11, "setAtomic:", 1);
  objc_initWeak((id *)buf, v11);
  v16 = MEMORY[0x1E0C809B0];
  v17 = 3221225472;
  v18 = __36__BRCSharingSaveShareOperation_main__block_invoke_128;
  v19 = &unk_1E8765B68;
  objc_copyWeak(&v24, (id *)buf);
  v12 = *(id *)(a1 + 40);
  v13 = *(_QWORD *)(a1 + 32);
  v20 = v12;
  v21 = v13;
  v25 = *(_BYTE *)(a1 + 64);
  v22 = *(id *)(a1 + 48);
  v23 = *(id *)(a1 + 56);
  objc_msgSend(v11, "setModifyRecordsCompletionBlock:", &v16);
  objc_msgSend(v11, "callbackQueue", v16, v17, v18, v19);
  v14 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "callbackQueue");
  v15 = objc_claimAutoreleasedReturnValue();
  dispatch_set_target_queue(v14, v15);

  objc_msgSend(*(id *)(a1 + 32), "addSubOperation:", v11);
  objc_destroyWeak(&v24);
  objc_destroyWeak((id *)buf);

}

void __36__BRCSharingSaveShareOperation_main__block_invoke_128(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  id WeakRetained;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  char v29;
  void *v30;
  void *v31;
  void *v32;
  char v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  NSObject *v38;
  _QWORD *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  NSObject *v45;
  _QWORD v46[4];
  id v47;
  id v48;
  void *v49;
  uint8_t buf[4];
  id v51;
  __int16 v52;
  void *v53;
  __int16 v54;
  void *v55;
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  v9 = v7;
  v10 = objc_msgSend(v6, "count");
  v11 = objc_msgSend(*(id *)(a1 + 32), "count");
  v12 = v9;
  if (!v9)
  {
    v12 = 0;
    if (v10 != v11)
    {
      brc_bread_crumbs();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
        __36__BRCSharingSaveShareOperation_main__block_invoke_128_cold_4();

      objc_msgSend(MEMORY[0x1E0CB35C8], "br_errorWithDomain:code:description:", *MEMORY[0x1E0D10C90], 15, CFSTR("unreachable: got an unexpected number of shares saved"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  if (v12)
  {
    brc_bread_crumbs();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, (os_log_type_t)0x90u))
    {
      *(_DWORD *)buf = 138412802;
      v51 = WeakRetained;
      v52 = 2112;
      v53 = v12;
      v54 = 2112;
      v55 = v15;
      _os_log_error_impl(&dword_1CBD43000, v16, (os_log_type_t)0x90u, "[ERROR] failed saving share %@: %@%@", buf, 0x20u);
    }

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 528), "recordID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "brc_cloudKitErrorForRecordID:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (*(_BYTE *)(a1 + 72) && objc_msgSend(v18, "brc_containsCloudKitInternalErrorCode:", 2024))
    {
      objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "recordID");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "brc_cloudKitErrorForRecordID:", v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v21, "brc_isStaleRecordUpdateError"))
      {
        objc_msgSend(*(id *)(a1 + 48), "clientZone");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "scheduleSyncDown");

      }
    }
    else
    {
      v21 = v18;
    }
    objc_msgSend(*(id *)(a1 + 40), "completedWithResult:error:", 0, v21);

    goto LABEL_31;
  }
  brc_bread_crumbs();
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
    __36__BRCSharingSaveShareOperation_main__block_invoke_128_cold_3();

  if (*(_BYTE *)(a1 + 72))
  {
    objc_msgSend(v6, "objectAtIndexedSubscript:", 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "recordType");
    v26 = objc_claimAutoreleasedReturnValue();
    if ((-[NSObject isEqualToString:](v26, "isEqualToString:", CFSTR("content")) & 1) == 0)
    {
      objc_msgSend(v6, "objectAtIndexedSubscript:", 1);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "recordType");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v28, "isEqualToString:", CFSTR("structure"));

      if ((v29 & 1) != 0)
      {
LABEL_23:
        objc_msgSend(*(id *)(a1 + 56), "db");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v46[0] = MEMORY[0x1E0C809B0];
        v46[1] = 3221225472;
        v46[2] = __36__BRCSharingSaveShareOperation_main__block_invoke_131;
        v46[3] = &unk_1E8760018;
        v47 = *(id *)(a1 + 56);
        v48 = v6;
        objc_msgSend(v30, "groupInBatch:", v46);

        goto LABEL_24;
      }
      brc_bread_crumbs();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
        __36__BRCSharingSaveShareOperation_main__block_invoke_128_cold_2();
    }

    goto LABEL_23;
  }
LABEL_24:
  objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "recordType");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(v32, "isEqualToString:", *MEMORY[0x1E0C94A20]);

  if ((v33 & 1) == 0)
  {
    brc_bread_crumbs();
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v45 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_FAULT))
      __36__BRCSharingSaveShareOperation_main__block_invoke_128_cold_1();

  }
  objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
  v34 = objc_claimAutoreleasedReturnValue();
  v35 = *(_QWORD *)(a1 + 40);
  v36 = *(void **)(v35 + 528);
  *(_QWORD *)(v35 + 528) = v34;

  objc_msgSend(*(id *)(a1 + 56), "scheduleSyncDownFirst");
  brc_bread_crumbs();
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v38 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
  {
    v43 = *(void **)(*(_QWORD *)(a1 + 40) + 528);
    *(_DWORD *)buf = 138412546;
    v51 = v43;
    v52 = 2112;
    v53 = v37;
    _os_log_debug_impl(&dword_1CBD43000, v38, OS_LOG_TYPE_DEBUG, "[DEBUG] Saved share %@%@", buf, 0x16u);
  }

  v39 = *(_QWORD **)(a1 + 40);
  v40 = v39[66];
  if (*(_BYTE *)(a1 + 72))
  {
    objc_msgSend(v6, "lastObject");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = v41;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v49, 1);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "_updateDBAndSyncDownIfNeededWithShare:recordsToLearnCKInfo:", v40, v42);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "_updateDBAndSyncDownIfNeededWithShare:recordsToLearnCKInfo:", v39[66], 0);
  }
  objc_msgSend(*(id *)(a1 + 40), "completedWithResult:error:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 528), 0);
LABEL_31:

}

void __36__BRCSharingSaveShareOperation_main__block_invoke_131(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  v1 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "learnCKInfosFromSavedRecords:isOutOfBandModifyRecords:", v3, 1);

}

void __36__BRCSharingSaveShareOperation_main__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] UNREACHABLE: couldn't get base record%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __36__BRCSharingSaveShareOperation_main__block_invoke_cold_2(void *a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "itemID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412546;
  v7 = v5;
  v8 = 2112;
  v9 = a2;
  _os_log_fault_impl(&dword_1CBD43000, a3, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: directory %@ isn't pcs chained%@", (uint8_t *)&v6, 0x16u);

}

void __36__BRCSharingSaveShareOperation_main__block_invoke_cold_3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4_1(&dword_1CBD43000, v0, v1, "[ERROR] Failed with baseTokenError=%@%@");
  OUTLINED_FUNCTION_2();
}

void __36__BRCSharingSaveShareOperation_main__block_invoke_123_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  void *v3;
  id v7;
  int v8;
  __CFString *v9;
  void *v10;
  uint64_t v11;
  uint8_t buf[4];
  id v13;
  __int16 v14;
  __CFString *v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 528), "debugDescription");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v8 = *(unsigned __int8 *)(a1 + 64);
  if (*(_BYTE *)(a1 + 64))
  {
    v10 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringWithFormat:", CFSTR(" and %@"), v3);
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = &stru_1E8769030;
  }
  v11 = *(_QWORD *)(a1 + 32);
  *(_DWORD *)buf = 138413058;
  v13 = v7;
  v14 = 2112;
  v15 = v9;
  v16 = 2112;
  v17 = v11;
  v18 = 2112;
  v19 = a2;
  _os_log_debug_impl(&dword_1CBD43000, a3, OS_LOG_TYPE_DEBUG, "[DEBUG] Saving %@%@ for share op %@%@", buf, 0x2Au);
  if (v8)
  {

  }
}

void __36__BRCSharingSaveShareOperation_main__block_invoke_128_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: [save[0].recordType isEqualToString:CKRecordTypeShare]%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __36__BRCSharingSaveShareOperation_main__block_invoke_128_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: [save[1].recordType isEqualToString:kBRRecordTypeContent] || [save[1].recordType isEqualToString:kBRRecordTypeStructure]%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __36__BRCSharingSaveShareOperation_main__block_invoke_128_cold_3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] finished saving share %@%@");
  OUTLINED_FUNCTION_2();
}

void __36__BRCSharingSaveShareOperation_main__block_invoke_128_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] UNREACHABLE: got an unexpected number of shares saved%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

@end
