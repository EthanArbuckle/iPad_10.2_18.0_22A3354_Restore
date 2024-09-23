@implementation BRCLocalItem

- (NSString)bookmarkData
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[BRCItemID itemIDString](self->_itemID, "itemIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bookmarkDataWithItemResolutionString:serverZone:", v4, self->_serverZone);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (NSMutableSet)setOfAppLibraryIDsWithReverseAliases
{
  return 0;
}

- (BOOL)isReserved
{
  return -[BRCStatInfo state](self->_st, "state") == -2;
}

- (BOOL)isFault
{
  return 0;
}

- (BOOL)physicalNameNeedsRename
{
  void *v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  NSObject *v13;
  char v14;
  uint64_t v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (-[BRCLocalItem isDirectoryWithPackageName](self, "isDirectoryWithPackageName"))
  {
    -[BRCStatInfo representableName](self->_st, "representableName");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCLocalStatInfo physicalName](self->_st, "physicalName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v3, "isEqualToString:", v4);

    if ((v5 & 1) != 0)
      return 0;
  }
  if (-[BRCLocalItem isFault](self, "isFault"))
    return 0;
  -[BRCLocalStatInfo physicalName](self->_st, "physicalName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
    return 0;
  v16 = 0;
  -[BRCLocalStatInfo physicalName](self->_st, "physicalName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "br_stringByDeletingPathBounceNo:", &v16);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[BRCLocalStatInfo logicalName](self->_st, "logicalName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "br_stringByDeletingPathBounceNo:", &v16);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v8, "isEqualToString:", v10);
  if ((v11 & 1) == 0)
  {
    brc_bread_crumbs();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412802;
      v18 = v8;
      v19 = 2112;
      v20 = v10;
      v21 = 2112;
      v22 = v12;
      _os_log_debug_impl(&dword_1CBD43000, v13, OS_LOG_TYPE_DEBUG, "[DEBUG] Needs rename because local name %@ differs from real name %@%@", buf, 0x20u);
    }

  }
  v14 = v11 ^ 1;

  return v14;
}

- (BOOL)updateXattrInfoFromPath:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  char v12;
  _QWORD v14[5];
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v6 = a3;
  -[BRCServerZone mangledID](self->_serverZone, "mangledID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "maxXattrBlobSize");

  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__2;
  v22 = __Block_byref_object_dispose__2;
  v23 = 0;
  if (v9)
  {
    -[BRCAccountSession stageRegistry](self->_session, "stageRegistry");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __63__BRCLocalItem_LegacyAdditions__updateXattrInfoFromPath_error___block_invoke;
    v14[3] = &unk_1E875DE90;
    v16 = &v18;
    v17 = v9;
    v14[4] = self;
    v11 = v10;
    v15 = v11;
    v12 = objc_msgSend(v6, "performOnOpenFileDescriptor:error:", v14, 0);
    if (a4)
      *a4 = objc_retainAutorelease((id)v19[5]);

  }
  else
  {
    v12 = 1;
  }
  _Block_object_dispose(&v18, 8);

  return v12;
}

uint64_t __63__BRCLocalItem_LegacyAdditions__updateXattrInfoFromPath_error___block_invoke(uint64_t a1, uint64_t a2)
{
  int v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  BOOL v7;
  id *v8;
  uint64_t v9;
  id v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  uint64_t v14;
  id v15;
  void *v16;
  id *v17;
  uint64_t v18;
  id v19;
  id v20;
  NSObject *v21;
  id v22;
  void *v23;
  int v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  int v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  id v36;
  void *v37;
  void *v38;
  int v39;
  void *v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  BRCItemID *v45;
  void *v46;
  BRCItemID *v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  void *v52;
  void *v53;
  uint64_t v54;
  void *v55;
  uint64_t v56;
  void *v57;
  uint64_t v58;
  void *v59;
  void *v61;
  uint64_t v62;
  void *v63;
  uint64_t v64;
  NSObject *v65;
  void *v66;
  id obj;
  id v68;
  id v69;
  _BYTE buf[22];
  __int16 v71;
  id v72;
  uint64_t v73;

  v2 = a2;
  v73 = *MEMORY[0x1E0C80C00];
  v68 = 0;
  v69 = 0;
  v4 = *(_QWORD *)(a1 + 56);
  v5 = a1 + 48;
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  obj = *(id *)(v6 + 40);
  v7 = +[BRFieldXattrBlob loadXattrsFromFD:structuralBlob:contentBlob:localBlob:withMaximumSize:error:](BRFieldXattrBlob, "loadXattrsFromFD:structuralBlob:contentBlob:localBlob:withMaximumSize:error:", a2, &v69, &v68, 0, v4, &obj);
  objc_storeStrong((id *)(v6 + 40), obj);
  if (v7)
  {
    objc_msgSend(*(id *)(a1 + 32), "st");
    v8 = (id *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      if (!objc_msgSend(v69, "length"))
      {
        v15 = v8[10];
        v8[10] = 0;

        v11 = v8[11];
        v8[11] = 0;
LABEL_11:

        if (objc_msgSend(*(id *)(a1 + 32), "isDocument"))
        {
          objc_msgSend(*(id *)(a1 + 32), "asDocument");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "currentVersion");
          v17 = (id *)objc_claimAutoreleasedReturnValue();
          if (v17)
          {
            if (objc_msgSend(v68, "length"))
            {
              objc_msgSend(v68, "brc_signature");
              v18 = objc_claimAutoreleasedReturnValue();
              v19 = v17[8];
              v17[8] = (id)v18;

              objc_storeStrong(v17 + 9, v68);
              objc_msgSend(*(id *)(a1 + 40), "saveXattrBlob:forSignature:error:", v68, v17[8], *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
              brc_bread_crumbs();
              v20 = (id)objc_claimAutoreleasedReturnValue();
              brc_default_log();
              v21 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
              {
                objc_msgSend(v17[8], "brc_hexadecimalString");
                v63 = (void *)objc_claimAutoreleasedReturnValue();
                v64 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)v5 + 8) + 40);
                *(_DWORD *)buf = 138412802;
                *(_QWORD *)&buf[4] = v63;
                *(_WORD *)&buf[12] = 2112;
                *(_QWORD *)&buf[14] = v64;
                v71 = 2112;
                v72 = v20;
                _os_log_debug_impl(&dword_1CBD43000, v21, OS_LOG_TYPE_DEBUG, "[DEBUG] content xattr signature: %@ error:%@%@", buf, 0x20u);

              }
            }
            else
            {
              v22 = v17[8];
              v17[8] = 0;

              v20 = v17[9];
              v17[9] = 0;
            }
          }
          else
          {
            brc_bread_crumbs();
            v20 = (id)objc_claimAutoreleasedReturnValue();
            brc_default_log();
            v65 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v65, OS_LOG_TYPE_FAULT))
              __63__BRCLocalItem_LegacyAdditions__updateXattrInfoFromPath_error___block_invoke_cold_1();

          }
        }
        objc_msgSend(*(id *)(a1 + 32), "clientZone");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v23, "isPrivateZone");

        if (!v24)
          goto LABEL_37;
        brc_string_from_xattr(v2, "com.apple.trash.put-back.path#PS");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "st");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "setTrashPutBackPath:", v25);

        brc_string_from_xattr(v2, "com.apple.trash.put-back.icloud-parent-id#PS");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "pathComponents");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "parentClientZone");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = objc_msgSend(v29, "isPrivateZone");

        objc_msgSend(*(id *)(a1 + 32), "parentClientZone");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = v31;
        if (v30)
        {
          objc_msgSend(v31, "asPrivateClientZone");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "defaultAppLibrary");
          v34 = objc_claimAutoreleasedReturnValue();

          v35 = 0;
        }
        else
        {
          objc_msgSend(v31, "asSharedClientZone");
          v35 = objc_claimAutoreleasedReturnValue();
          v34 = 0;
        }

        if ((unint64_t)objc_msgSend(v28, "count") < 2)
        {
          if (objc_msgSend(v28, "count") != 1)
            goto LABEL_33;
          objc_msgSend(v28, "objectAtIndexedSubscript:", 0);
          v43 = objc_claimAutoreleasedReturnValue();
          v38 = v27;
        }
        else
        {
          v36 = objc_alloc(MEMORY[0x1E0D10E88]);
          objc_msgSend(v28, "objectAtIndexedSubscript:", 0);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v38 = (void *)objc_msgSend(v36, "initWithMangledString:", v37);

          if (v38)
          {
            v39 = objc_msgSend(v38, "isShared");
            v40 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
            if (v39)
            {
              objc_msgSend(v40, "sharedClientZoneByMangledID:", v38);
              v41 = objc_claimAutoreleasedReturnValue();
              v42 = (void *)v35;
              v35 = v41;
            }
            else
            {
              objc_msgSend(v40, "appLibraryByMangledID:", v38);
              v44 = objc_claimAutoreleasedReturnValue();
              v42 = (void *)v34;
              v34 = v44;
            }

          }
          objc_msgSend(v28, "objectAtIndexedSubscript:", 1);
          v43 = objc_claimAutoreleasedReturnValue();

        }
        v27 = (void *)v43;
LABEL_33:
        if (v27 && v34 | v35)
        {
          v45 = [BRCItemID alloc];
          objc_msgSend((id)v34, "dbRowID");
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend((id)v35, "dbRowID");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          v47 = -[BRCItemID initWithString:libraryRowID:sharedZoneRowID:](v45, "initWithString:libraryRowID:sharedZoneRowID:", v27, v66, v46);
          objc_msgSend(*(id *)(a1 + 32), "st");
          v48 = v35;
          v49 = v34;
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v50, "setTrashPutBackParentID:", v47);

          v34 = v49;
          v35 = v48;

        }
LABEL_37:
        if ((objc_msgSend(*(id *)(a1 + 32), "isFault") & 1) == 0)
        {
          *(_QWORD *)buf = 0;
          *(_QWORD *)&buf[8] = 0;
          BRGetLastUsedDate();
          v51 = *(_QWORD *)buf;
          objc_msgSend(*(id *)(a1 + 32), "st");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v52, "setLastUsedTime:", v51);

        }
        objc_msgSend(*(id *)(a1 + 32), "st");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        v54 = objc_msgSend(v53, "lastUsedTime");

        if (!v54)
        {
          brc_string_from_xattr(v2, "com.apple.last-used.time#PS");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          v56 = objc_msgSend(v55, "longLongValue");
          objc_msgSend(*(id *)(a1 + 32), "st");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v57, "setLastUsedTime:", v56);

        }
        brc_string_from_xattr(v2, "com.apple.favorite-rank.number#PS");
        v13 = objc_claimAutoreleasedReturnValue();
        v58 = -[NSObject longLongValue](v13, "longLongValue");
        objc_msgSend(*(id *)(a1 + 32), "st");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v59, "setFavoriteRank:", v58);

        v14 = 0;
        goto LABEL_42;
      }
      objc_msgSend(v69, "brc_signature");
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = v8[10];
      v8[10] = (id)v9;

      objc_storeStrong(v8 + 11, v69);
      objc_msgSend(*(id *)(a1 + 40), "saveXattrBlob:forSignature:error:", v69, v8[10], *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
      brc_bread_crumbs();
      v11 = (id)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(v8[10], "brc_hexadecimalString");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        v62 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)v5 + 8) + 40);
        *(_DWORD *)buf = 138412802;
        *(_QWORD *)&buf[4] = v61;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v62;
        v71 = 2112;
        v72 = v11;
        _os_log_debug_impl(&dword_1CBD43000, v12, OS_LOG_TYPE_DEBUG, "[DEBUG] structural xattr signature: %@ error:%@%@", buf, 0x20u);

      }
    }
    else
    {
      brc_bread_crumbs();
      v11 = (id)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
        __63__BRCLocalItem_LegacyAdditions__updateXattrInfoFromPath_error___block_invoke_cold_2();
    }

    goto LABEL_11;
  }
  brc_bread_crumbs();
  v8 = (id *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, (os_log_type_t)0x90u))
    __63__BRCLocalItem_LegacyAdditions__updateXattrInfoFromPath_error___block_invoke_cold_3();
  v14 = 0xFFFFFFFFLL;
LABEL_42:

  return v14;
}

- (BOOL)_isReadonlyShareChild
{
  return (-[BRCLocalItem sharingOptions](self, "sharingOptions") & 0x24) == 32;
}

- (void)_fixSpotlightAttributeIfNecessaryAtPath:(id)a3
{
  unint64_t sharingOptions;
  uint64_t v5;
  void *v6;
  id v7;

  v7 = a3;
  sharingOptions = self->_sharingOptions;
  if (sharingOptions != -[BRCLocalItem sharingOptions](self->_orig, "sharingOptions")
    && -[BRCLocalItem isOnDisk](self, "isOnDisk"))
  {
    v5 = (uint64_t)v7;
    if (v7)
    {
      v6 = 0;
    }
    else
    {
      +[BRCItemToPathLookup lookupForItem:](BRCItemToPathLookup, "lookupForItem:", self);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "byFileSystemID");
      v5 = objc_claimAutoreleasedReturnValue();
    }
    v7 = (id)v5;
    -[BRCLocalItem setOrRemoveSpotlightAttributeAt:](self, "setOrRemoveSpotlightAttributeAt:", v5);
    objc_msgSend(v6, "closePaths");

  }
}

- (BOOL)_checkZoneUpdateFromFSAtPath:(id)a3 parentGlobalID:(id)a4
{
  id v6;
  id v7;
  BRCAccountSession *session;
  void *v9;
  void *v10;
  char v11;
  BRCZoneRowID *parentZoneRowID;
  void *v13;
  BOOL v14;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  char v21;
  void *v22;
  NSObject *v23;
  int v24;
  BRCLocalItem *v25;
  __int16 v26;
  id v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!v7)
    goto LABEL_6;
  if (-[BRCLocalItem isSharedToMeTopLevelItem](self, "isSharedToMeTopLevelItem"))
  {
    session = self->_session;
    objc_msgSend(v7, "zoneRowID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCAccountSession serverZoneByRowID:](session, "serverZoneByRowID:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isPrivateZone");

    if ((v11 & 1) != 0)
      goto LABEL_6;
  }
  parentZoneRowID = self->_parentZoneRowID;
  objc_msgSend(v7, "zoneRowID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if ((-[BRCZoneRowID br_isEqualToNumber:](parentZoneRowID, "br_isEqualToNumber:", v13) & 1) != 0)
  {

LABEL_6:
    v14 = 1;
    goto LABEL_7;
  }
  if (-[BRCLocalItem isDocumentBeingCopiedToNewZone](self, "isDocumentBeingCopiedToNewZone"))
  {
    -[BRCLocalItem asDocument](self, "asDocument");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "currentVersion");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "previousItemGlobalID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "zoneRowID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "zoneRowID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "br_isEqualToNumber:", v20);

    if ((v21 & 1) != 0)
      goto LABEL_6;
  }
  else
  {

  }
  brc_bread_crumbs();
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
  {
    v24 = 138412802;
    v25 = self;
    v26 = 2112;
    v27 = v6;
    v28 = 2112;
    v29 = v22;
    _os_log_fault_impl(&dword_1CBD43000, v23, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: You can't cross move %@ to %@%@", (uint8_t *)&v24, 0x20u);
  }

  v14 = 0;
LABEL_7:

  return v14;
}

- (BOOL)_checkForSharedToMeItemInTrashWithPath:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  id v8;
  BOOL v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void *v14;
  id v15;
  id v16;
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[BRCLocalItem isSharedToMeTopLevelItem](self, "isSharedToMeTopLevelItem")
    && objc_msgSend(v4, "itemScope") == 3)
  {
    brc_bread_crumbs();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v18 = v5;
      _os_log_impl(&dword_1CBD43000, v6, OS_LOG_TYPE_DEFAULT, "[WARNING] Deleting shared to me top level item in the trash%@", buf, 0xCu);
    }

    -[BRCAccountSession fileUnlinker](self->_session, "fileUnlinker");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = MEMORY[0x1E0C809B0];
    v12 = 3221225472;
    v13 = __72__BRCLocalItem_LegacyAdditions___checkForSharedToMeItemInTrashWithPath___block_invoke;
    v14 = &unk_1E875DEB8;
    v15 = v7;
    v16 = v4;
    v8 = v7;
    objc_msgSend(v16, "performOnOpenParentFileDescriptor:error:", &v11, 0);
    -[BRCLocalItem markRemovedFromFilesystemForServerEdit:](self, "markRemovedFromFilesystemForServerEdit:", 0, v11, v12, v13, v14);

    v9 = 1;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

uint64_t __72__BRCLocalItem_LegacyAdditions___checkForSharedToMeItemInTrashWithPath___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;

  v3 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "filename");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "renameAndUnlinkInBackgroundItemAt:path:", a2, v4);

  return 0;
}

- (BOOL)updateLocationAndMetaFromFSAtPath:(id)a3 parentGlobalID:(id)a4
{
  id v6;
  id v7;
  BOOL v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  id v17;
  BRCLocalStatInfo *st;
  BRCItemID *itemID;
  _BOOL8 v20;
  NSNumber *v21;
  NSNumber *parentFileID;
  _BOOL4 v23;
  void *v24;
  void *v25;
  BOOL v26;
  void *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  unint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  char v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  NSObject *v42;
  void *v43;
  void *v44;
  void *v45;
  NSObject *v46;
  BOOL v48;
  NSObject *v49;
  void *v50;
  id v51;
  void *v52;
  id v53;
  uint8_t buf[4];
  BRCLocalItem *v55;
  __int16 v56;
  id v57;
  __int16 v58;
  void *v59;
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!-[BRCLocalItem _checkZoneUpdateFromFSAtPath:parentGlobalID:](self, "_checkZoneUpdateFromFSAtPath:parentGlobalID:", v6, v7))
  {
    v8 = 0;
    goto LABEL_46;
  }
  if (!-[BRCLocalItem _checkForSharedToMeItemInTrashWithPath:](self, "_checkForSharedToMeItemInTrashWithPath:", v6))
  {
    if (!v7)
      goto LABEL_10;
    objc_msgSend(v7, "zoneRowID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCClientZone dbRowID](self->_clientZone, "dbRowID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v9, "br_isEqualToNumber:", v10) & 1) == 0)
    {
      objc_msgSend(v7, "zoneRowID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v11, "br_isEqualToNumber:", self->_parentZoneRowID))
      {
        v48 = -[BRCLocalItem isSharedToMeTopLevelItem](self, "isSharedToMeTopLevelItem");

        if (!v48)
        {
          brc_bread_crumbs();
          v17 = (id)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v49 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v49, OS_LOG_TYPE_FAULT))
            -[BRCLocalItem(LegacyAdditions) updateLocationAndMetaFromFSAtPath:parentGlobalID:].cold.2();

          v8 = 0;
          goto LABEL_45;
        }
LABEL_10:
        if (-[BRCLocalItem isFault](self, "isFault")
          && (objc_msgSend(v6, "isFault") & 1) == 0
          && (-[BRCLocalItem fileID](self, "fileID"),
              v12 = (void *)objc_claimAutoreleasedReturnValue(),
              v13 = objc_msgSend(v12, "unsignedLongLongValue"),
              v14 = objc_msgSend(v6, "fileID"),
              v12,
              v13 == v14))
        {
          brc_bread_crumbs();
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 138412802;
            v55 = self;
            v56 = 2112;
            v57 = v6;
            v58 = 2112;
            v59 = v15;
            _os_log_fault_impl(&dword_1CBD43000, v16, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: Found a fault that was renamed to a file\n%@\n%@%@", buf, 0x20u);
          }

          BRCUnlinkFileID(objc_msgSend(v6, "deviceID"), objc_msgSend(v6, "fileID"));
          -[BRCClientZone serverItemByItemID:](self->_clientZone, "serverItemByItemID:", self->_itemID);
          v17 = (id)objc_claimAutoreleasedReturnValue();
          -[BRCLocalItem markNeedsDeleteForRescheduleOfItem:](self, "markNeedsDeleteForRescheduleOfItem:", v17);
        }
        else
        {
          st = self->_st;
          itemID = self->_itemID;
          if (-[BRCLocalItem isFault](self, "isFault"))
            v20 = -[BRCLocalItem isPackage](self, "isPackage");
          else
            v20 = 0;
          -[BRCLocalStatInfo updateLocationAndMetaFromFSAtPath:itemID:parentGlobalID:isPackageFault:readonlyShareChild:](st, "updateLocationAndMetaFromFSAtPath:itemID:parentGlobalID:isPackageFault:readonlyShareChild:", v6, itemID, v7, v20, -[BRCLocalItem _isReadonlyShareChild](self, "_isReadonlyShareChild"));
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v6, "parentFileID"));
          v21 = (NSNumber *)objc_claimAutoreleasedReturnValue();
          parentFileID = self->_parentFileID;
          self->_parentFileID = v21;

          v23 = -[BRCLocalItem isSharedToMeTopLevelItem](self, "isSharedToMeTopLevelItem");
          if (v7 && v23)
          {
            -[BRCLocalItem asSharedToMeTopLevelItem](self, "asSharedToMeTopLevelItem");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "zoneRowID");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "updateParentZoneRowID:", v25);

          }
          -[BRCLocalItem _updatePropagatedInfoFromFSAtPath:](self, "_updatePropagatedInfoFromFSAtPath:", v6);
          if (objc_msgSend(v6, "exists"))
          {
            v53 = 0;
            v26 = -[BRCLocalItem updateXattrInfoFromPath:error:](self, "updateXattrInfoFromPath:error:", v6, &v53);
            v17 = v53;
            if (!v26)
            {
              brc_bread_crumbs();
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              brc_default_log();
              v28 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v28, (os_log_type_t)0x90u))
                -[BRCLocalItem(LegacyAdditions) updateLocationAndMetaFromFSAtPath:parentGlobalID:].cold.1();

            }
          }
          else
          {
            v17 = 0;
          }
          if (-[BRCLocalItem isSharedToMe](self, "isSharedToMe") && -[BRCLocalItem isDocument](self, "isDocument"))
          {
            -[BRCLocalItem asDocument](self, "asDocument");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "currentVersion");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "setQuarantineInfo:", 0);

          }
          v31 = -[BRCLocalItem diffAgainstOriginalItem](self, "diffAgainstOriginalItem");
          -[BRCAppLibrary mangledID](self->_appLibrary, "mangledID");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", v32);
          v33 = (void *)objc_claimAutoreleasedReturnValue();

          if ((objc_msgSend(v33, "fieldsToMoveOutOfTrashMask") & v31) != 0
            && !-[BRCLocalItem isInTrashScope](self, "isInTrashScope"))
          {
            -[BRCClientZone serverItemByItemID:](self->_clientZone, "serverItemByItemID:", self->_itemID);
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "parentItemIDOnFS");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            if (v35)
            {
              -[BRCStatInfo parentID](self->_st, "parentID");
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              v37 = objc_msgSend(v36, "isEqualToItemID:", v35);

              if ((v37 & 1) == 0)
              {
                v51 = v17;
                objc_msgSend(v34, "parentZoneOnFS");
                v38 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v38, "clientZone");
                v39 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v39, "itemByItemID:", v35);
                v40 = (void *)objc_claimAutoreleasedReturnValue();

                v52 = v40;
                if (objc_msgSend(v40, "isInTrashScope"))
                {
                  brc_bread_crumbs();
                  v41 = (void *)objc_claimAutoreleasedReturnValue();
                  brc_default_log();
                  v42 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138412546;
                    v55 = self;
                    v56 = 2112;
                    v57 = v41;
                    _os_log_impl(&dword_1CBD43000, v42, OS_LOG_TYPE_DEFAULT, "[WARNING] Mtime changed when trying to trash an item. Forcing sync up of parentID for %@%@", buf, 0x16u);
                  }

                  self->_localDiffs |= 0x7FFFuLL;
                  objc_msgSend(v34, "st");
                  v43 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v43, "ckInfo");
                  v44 = (void *)objc_claimAutoreleasedReturnValue();
                  -[BRCStatInfo setCkInfo:](self->_st, "setCkInfo:", v44);

                }
                v17 = v51;
              }
            }

          }
          brc_bread_crumbs();
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v46 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
          {
            BRCItemFieldsPrettyPrint();
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412802;
            v55 = self;
            v56 = 2112;
            v57 = v50;
            v58 = 2112;
            v59 = v45;
            _os_log_debug_impl(&dword_1CBD43000, v46, OS_LOG_TYPE_DEBUG, "[DEBUG] updated item location: %@\ndiffs:(%@)%@", buf, 0x20u);

          }
        }
        v8 = 1;
LABEL_45:

        goto LABEL_46;
      }

    }
    goto LABEL_10;
  }
  v8 = 1;
LABEL_46:

  return v8;
}

- (void)learnItemID:(id)a3 serverItem:(id)a4 path:(id)a5 markLost:(BOOL)a6
{
  _BOOL4 v6;
  id v10;
  id v11;
  void *v12;
  NSObject *v13;
  int v14;
  id v15;
  __int16 v16;
  BRCLocalItem *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v6 = a6;
  v20 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a5;
  -[BRCLocalItem _learnItemID:serverItem:](self, "_learnItemID:serverItem:", v10, a4);
  if (v6)
    -[BRCLocalItem markLostClearGenerationID:backoffMode:](self, "markLostClearGenerationID:backoffMode:", 0, 0);
  -[BRCLocalItem _fixSpotlightAttributeIfNecessaryAtPath:](self, "_fixSpotlightAttributeIfNecessaryAtPath:", v11);
  brc_bread_crumbs();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    v14 = 138412802;
    v15 = v10;
    v16 = 2112;
    v17 = self;
    v18 = 2112;
    v19 = v12;
    _os_log_debug_impl(&dword_1CBD43000, v13, OS_LOG_TYPE_DEBUG, "[DEBUG] learned itemID %@ for %@%@", (uint8_t *)&v14, 0x20u);
  }

}

- (BOOL)updateFromFSAtPath:(id)a3 parentGlobalID:(id)a4
{
  id v6;
  id v7;
  _BOOL4 v8;
  BRCLocalStatInfo *st;
  BRCItemID *itemID;
  _BOOL8 v11;
  NSNumber *v12;
  NSNumber *parentFileID;
  _BOOL4 v14;
  void *v15;
  void *v16;
  BOOL v17;
  id v18;
  void *v19;
  NSObject *v20;
  void *v21;
  NSObject *v22;
  id v24;

  v6 = a3;
  v7 = a4;
  v8 = -[BRCLocalItem _checkZoneUpdateFromFSAtPath:parentGlobalID:](self, "_checkZoneUpdateFromFSAtPath:parentGlobalID:", v6, v7);
  if (v8
    && !-[BRCLocalItem _checkForSharedToMeItemInTrashWithPath:](self, "_checkForSharedToMeItemInTrashWithPath:", v6))
  {
    st = self->_st;
    itemID = self->_itemID;
    if (-[BRCLocalItem isFault](self, "isFault"))
      v11 = -[BRCLocalItem isPackage](self, "isPackage");
    else
      v11 = 0;
    -[BRCLocalStatInfo updateFromFSAtPath:itemID:parentGlobalID:isPackageFault:readonlyShareChild:](st, "updateFromFSAtPath:itemID:parentGlobalID:isPackageFault:readonlyShareChild:", v6, itemID, v7, v11, -[BRCLocalItem _isReadonlyShareChild](self, "_isReadonlyShareChild"));
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v6, "parentFileID"));
    v12 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    parentFileID = self->_parentFileID;
    self->_parentFileID = v12;

    v14 = -[BRCLocalItem isSharedToMeTopLevelItem](self, "isSharedToMeTopLevelItem");
    if (v7 && v14)
    {
      -[BRCLocalItem asSharedToMeTopLevelItem](self, "asSharedToMeTopLevelItem");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "zoneRowID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "updateParentZoneRowID:", v16);

    }
    -[BRCLocalItem _updatePropagatedInfoFromFSAtPath:](self, "_updatePropagatedInfoFromFSAtPath:", v6);
    if (objc_msgSend(v6, "exists"))
    {
      v24 = 0;
      v17 = -[BRCLocalItem updateXattrInfoFromPath:error:](self, "updateXattrInfoFromPath:error:", v6, &v24);
      v18 = v24;
      if (!v17)
      {
        brc_bread_crumbs();
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, (os_log_type_t)0x90u))
          -[BRCLocalItem(LegacyAdditions) updateFromFSAtPath:parentGlobalID:].cold.2();

      }
    }
    else
    {
      v18 = 0;
    }
    brc_bread_crumbs();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      -[BRCLocalItem(LegacyAdditions) updateFromFSAtPath:parentGlobalID:].cold.1();

  }
  return v8;
}

+ (id)newItemWithPath:(id)a3 parentGlobalID:(id)a4
{
  id v5;
  id v6;
  __objc2_class *v7;
  void *v8;
  NSObject *v9;
  void *v10;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "type") - 5 > 1)
  {
    brc_bread_crumbs();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      +[BRCLocalItem(LegacyAdditions) newItemWithPath:parentGlobalID:].cold.1();

    v10 = 0;
  }
  else
  {
    if (objc_msgSend(v5, "isSymLink"))
    {
      v7 = BRCSymlinkItem;
    }
    else if (objc_msgSend(v5, "isBRAlias"))
    {
      v7 = BRCAliasItem;
    }
    else if (objc_msgSend(v5, "isFinderAlias"))
    {
      v7 = BRCFinderBookmarkItem;
    }
    else if (objc_msgSend(v5, "isDocument"))
    {
      v7 = BRCDocumentItem;
    }
    else
    {
      v7 = BRCDirectoryItem;
    }
    v10 = (void *)objc_msgSend([v7 alloc], "_initWithRelativePath:parentGlobalID:", v5, v6);
  }

  return v10;
}

- (id)_initWithRelativePath:(id)a3 parentGlobalID:(id)a4
{
  id v6;
  id v7;
  BRCLocalItem *v8;
  void *v9;
  uint64_t v10;
  BRCPQLConnection *db;
  uint64_t v12;
  BRCAppLibrary *appLibrary;
  void *v14;
  BRCItemID **p_itemID;
  char v16;
  void *v17;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  BRCClientZone *v21;
  BRCClientZone *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  BRCItemID *v26;
  BRCItemID *v27;
  void *v28;
  uint64_t v29;
  BRCClientZone *v30;
  void *v31;
  __int16 v32;
  BRCItemID *v33;
  BRCItemID *itemID;
  void *v35;
  uint64_t v36;
  BRCClientZone *clientZone;
  void *v38;
  __int16 v39;
  void *v40;
  NSObject *v41;
  int v42;
  id v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  BRCZoneRowID *parentZoneRowID;
  void *ownerKey;
  BRCAccountSession *session;
  void *v52;
  uint64_t v53;
  BRCUserRowID *v54;
  BRCLocalStatInfo *v55;
  BRCLocalStatInfo *st;
  BOOL v57;
  void *v58;
  NSObject *v59;
  BRCLocalItem *v60;
  void *v62;
  NSObject *v63;
  void *v64;
  void *v65;
  id v66;
  id v67;
  objc_super v68;

  v6 = a3;
  v7 = a4;
  v68.receiver = self;
  v68.super_class = (Class)BRCLocalItem;
  v8 = -[BRCLocalItem init](&v68, sel_init);
  if (!v8)
    goto LABEL_36;
  objc_msgSend(v6, "appLibrary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "db");
  v10 = objc_claimAutoreleasedReturnValue();
  db = v8->_db;
  v8->_db = (BRCPQLConnection *)v10;

  objc_msgSend(v6, "appLibrary");
  v12 = objc_claimAutoreleasedReturnValue();
  appLibrary = v8->_appLibrary;
  v8->_appLibrary = (BRCAppLibrary *)v12;

  objc_msgSend(v6, "sharedItemBookmark");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v67 = 0;
  if ((-[BRCAppLibrary state](v8->_appLibrary, "state") & 0x800) == 0
    || (objc_msgSend(v6, "session"),
        v14 = (void *)objc_claimAutoreleasedReturnValue(),
        p_itemID = &v8->_itemID,
        v16 = objc_msgSend(v65, "parseBookmarkDataWithAccountSession:docID:itemID:mangledID:unsaltedBookmarkData:error:", v14, 0, &v8->_itemID, &v67, 0, 0), v14, (v16 & 1) == 0))
  {
    v33 = objc_alloc_init(BRCItemID);
    itemID = v8->_itemID;
    v8->_itemID = v33;

    +[BRCPathToItemLookup lookupForRelativePath:](BRCPathToItemLookup, "lookupForRelativePath:", v6);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "clientZone");
    v36 = objc_claimAutoreleasedReturnValue();
    clientZone = v8->_clientZone;
    v8->_clientZone = (BRCClientZone *)v36;

    -[BRCLocalItem appLibrary](v8, "appLibrary");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = objc_msgSend(v38, "state");

    if ((v39 & 0x800) != 0)
      v8->_localDiffs |= 0x8000000000000000;
LABEL_24:
    v8->_serverZone = (BRCServerZone *)-[BRCClientZone serverZone](v8->_clientZone, "serverZone", v64);
    objc_msgSend(v7, "zoneRowID");
    v48 = objc_claimAutoreleasedReturnValue();
    parentZoneRowID = v8->_parentZoneRowID;
    v8->_parentZoneRowID = (BRCZoneRowID *)v48;

    if (!v8->_appLibrary)
    {
      brc_bread_crumbs();
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v63 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v63, OS_LOG_TYPE_FAULT))
        -[BRCLocalItem(LegacyAdditions) _initWithRelativePath:parentGlobalID:].cold.2();

    }
    v8->_session = (BRCAccountSession *)(id)objc_msgSend(v6, "session");
    if (-[BRCServerZone isPrivateZone](v8->_serverZone, "isPrivateZone"))
    {
      ownerKey = v8->_ownerKey;
      v8->_ownerKey = (BRCUserRowID *)&unk_1E87D70A0;
    }
    else
    {
      session = v8->_session;
      -[BRCServerZone asSharedZone](v8->_serverZone, "asSharedZone");
      ownerKey = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(ownerKey, "ownerName");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      -[BRCAccountSession userKeyForOwnerName:db:](session, "userKeyForOwnerName:db:", v52, v8->_db);
      v53 = objc_claimAutoreleasedReturnValue();
      v54 = v8->_ownerKey;
      v8->_ownerKey = (BRCUserRowID *)v53;

    }
    v55 = -[BRCLocalStatInfo initWithRelativePath:itemID:parentGlobalID:]([BRCLocalStatInfo alloc], "initWithRelativePath:itemID:parentGlobalID:", v6, v8->_itemID, v7);
    st = v8->_st;
    v8->_st = v55;

    if (objc_msgSend(v6, "exists"))
    {
      v66 = 0;
      v57 = -[BRCLocalItem updateXattrInfoFromPath:error:](v8, "updateXattrInfoFromPath:error:", v6, &v66);
      v43 = v66;
      if (!v57)
      {
        brc_bread_crumbs();
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v59 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v59, (os_log_type_t)0x90u))
          -[BRCLocalItem(LegacyAdditions) _initWithRelativePath:parentGlobalID:].cold.1();

        v42 = 0;
        v8 = 0;
        goto LABEL_35;
      }
    }
    else
    {
      v43 = 0;
    }
    -[BRCLocalItem _updatePropagatedInfoFromFSAtPath:](v8, "_updatePropagatedInfoFromFSAtPath:", v6);
    -[BRCLocalItem setOrRemoveSpotlightAttributeAt:](v8, "setOrRemoveSpotlightAttributeAt:", v6);
    v42 = 1;
    goto LABEL_35;
  }
  brc_bread_crumbs();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    -[BRCLocalItem(LegacyAdditions) _initWithRelativePath:parentGlobalID:].cold.5();

  objc_msgSend(v6, "session");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "clientZoneByMangledID:", v67);
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = v8->_clientZone;
  v8->_clientZone = (BRCClientZone *)v20;

  v22 = v8->_clientZone;
  if (v22)
  {
    -[BRCClientZone itemByItemID:](v22, "itemByItemID:", *p_itemID);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v23;
    if (v23)
    {
      v8->_sharingOptions = objc_msgSend(v23, "sharingOptions");
      if (objc_msgSend(v24, "isOnDisk"))
      {
        brc_bread_crumbs();
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
          -[BRCLocalItem(LegacyAdditions) _initWithRelativePath:parentGlobalID:].cold.4();

        v26 = objc_alloc_init(BRCItemID);
        v27 = *p_itemID;
        *p_itemID = v26;

        +[BRCPathToItemLookup lookupForRelativePath:](BRCPathToItemLookup, "lookupForRelativePath:", v6);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "clientZone");
        v29 = objc_claimAutoreleasedReturnValue();
        v30 = v8->_clientZone;
        v8->_clientZone = (BRCClientZone *)v29;

        -[BRCLocalItem appLibrary](v8, "appLibrary");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = objc_msgSend(v31, "state");

        if ((v32 & 0x800) != 0)
          v8->_localDiffs |= 0x8000000000000000;
      }
      else
      {
        -[BRCClientZone serverItemByItemID:](v8->_clientZone, "serverItemByItemID:", *p_itemID);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "markNeedsDeleteForRescheduleOfItem:", v47);

        objc_msgSend(v24, "saveToDB");
      }
    }
    else
    {
      -[BRCClientZone serverItemByItemID:](v8->_clientZone, "serverItemByItemID:", *p_itemID);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = v44;
      if (v44)
        v46 = objc_msgSend(v44, "sharingOptions");
      else
        v46 = 68;
      v8->_sharingOptions = v46;

    }
    goto LABEL_24;
  }
  brc_bread_crumbs();
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v41 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v41, OS_LOG_TYPE_FAULT))
    -[BRCLocalItem(LegacyAdditions) _initWithRelativePath:parentGlobalID:].cold.3();

  v42 = 0;
  v43 = 0;
LABEL_35:

  if (!v42)
  {
    v60 = 0;
    goto LABEL_38;
  }
LABEL_36:
  v8 = v8;
  v60 = v8;
LABEL_38:

  return v60;
}

- (void)scanParentDirectory
{
  void *v3;
  void *v4;
  int v5;
  id v6;

  -[BRCLocalItem st](self, "st");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "parentID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isNonDesktopRoot");

  if (v5)
  {
    -[BRCLocalItem appLibrary](self, "appLibrary");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "scheduleDeepScanWithReason:", CFSTR("eexist at root"));
  }
  else
  {
    -[BRCLocalItem parentItemOnFS](self, "parentItemOnFS");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "markLostClearGenerationID:backoffMode:", 1, 1);
    objc_msgSend(v6, "saveToDB");
  }

}

- (id)fetchParentFileIDs
{
  id v3;
  id v4;
  id v5;
  _QWORD v7[4];
  id v8;
  BRCLocalItem *v9;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __51__BRCLocalItem_LegacyAdditions__fetchParentFileIDs__block_invoke;
  v7[3] = &unk_1E875DEE0;
  v4 = v3;
  v8 = v4;
  v9 = self;
  -[BRCLocalItem _ascendItemHierarchyWithBlock:](self, "_ascendItemHierarchyWithBlock:", v7);
  v5 = v4;

  return v5;
}

uint64_t __51__BRCLocalItem_LegacyAdditions__fetchParentFileIDs__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    if (objc_msgSend(*(id *)(a1 + 32), "containsObject:", v6))
    {
      brc_bread_crumbs();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
        __51__BRCLocalItem_LegacyAdditions__fetchParentFileIDs__block_invoke_cold_2();

      brc_bread_crumbs();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, (os_log_type_t)0x90u))
        __51__BRCLocalItem_LegacyAdditions__fetchParentFileIDs__block_invoke_cold_1();

      v11 = 0;
      goto LABEL_14;
    }
    objc_msgSend(*(id *)(a1 + 32), "insertObject:atIndex:", v6, 0);
  }
  objc_msgSend(v5, "itemID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isNonDesktopRoot");

  if (v13)
  {
    v14 = *(void **)(*(_QWORD *)(a1 + 40) + 8);
    objc_msgSend(v5, "itemID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "appLibraryRowID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "appLibraryByRowID:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v17, "fileID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
      objc_msgSend(*(id *)(a1 + 32), "insertObject:atIndex:", v18, 0);

  }
  v11 = 1;
LABEL_14:

  return v11;
}

- (BOOL)_contentXattrsHaveChangedAtRelativeAPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  _QWORD v9[7];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v4 = a3;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  -[BRCServerZone mangledID](self->_serverZone, "mangledID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "maxXattrBlobSize");

  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __74__BRCLocalItem_LegacyAdditions___contentXattrsHaveChangedAtRelativeAPath___block_invoke;
  v9[3] = &unk_1E875DF08;
  v9[4] = self;
  v9[5] = &v10;
  v9[6] = v7;
  objc_msgSend(v4, "performOnOpenFileDescriptor:error:", v9, 0);
  LOBYTE(self) = *((_BYTE *)v11 + 24);
  _Block_object_dispose(&v10, 8);

  return (char)self;
}

uint64_t __74__BRCLocalItem_LegacyAdditions___contentXattrsHaveChangedAtRelativeAPath___block_invoke(uint64_t a1, uint64_t a2)
{
  id *v4;
  uint64_t v5;
  BOOL v6;
  id v7;
  NSObject *v8;
  _QWORD *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  char v15;
  uint64_t v16;
  id v18;
  id v19;

  v19 = 0;
  if (objc_msgSend(*(id *)(a1 + 32), "isDocument"))
    v4 = &v19;
  else
    v4 = 0;
  v5 = *(_QWORD *)(a1 + 48);
  v18 = 0;
  v6 = +[BRFieldXattrBlob loadXattrsFromFD:structuralBlob:contentBlob:localBlob:withMaximumSize:error:](BRFieldXattrBlob, "loadXattrsFromFD:structuralBlob:contentBlob:localBlob:withMaximumSize:error:", a2, 0, v4, 0, v5, &v18);
  v7 = v18;
  if (!v6)
  {
    brc_bread_crumbs();
    v12 = (id)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, (os_log_type_t)0x90u))
      __74__BRCLocalItem_LegacyAdditions___contentXattrsHaveChangedAtRelativeAPath___block_invoke_cold_1();
    v16 = 0xFFFFFFFFLL;
    goto LABEL_18;
  }
  if (objc_msgSend(*(id *)(a1 + 32), "isDocument"))
  {
    objc_msgSend(*(id *)(a1 + 32), "asDocument");
    v8 = objc_claimAutoreleasedReturnValue();
    -[NSObject currentVersion](v8, "currentVersion");
    v9 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "brc_signature");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)v9[8];
    v12 = v10;
    v13 = v11;
    if (v12 == v13)
    {

    }
    else
    {
      v14 = v13;
      if (v13)
      {
        v15 = objc_msgSend(v12, "isEqual:", v13);

        if ((v15 & 1) != 0)
          goto LABEL_17;
      }
      else
      {

      }
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    }
LABEL_17:

    v16 = 0;
LABEL_18:

    goto LABEL_19;
  }
  v16 = 0;
LABEL_19:

  return v16;
}

- (BOOL)changedAtRelativePath:(id)a3 scanPackage:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  uint64_t v8;
  _BOOL4 v9;
  _BOOL4 v10;
  void *v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  BOOL v20;
  void *v22;
  unsigned int v23;
  int v24;
  BRCLocalItem *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  int v29;
  BRCLocalItem *v30;
  __int16 v31;
  uint64_t v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v4 = a4;
  v35 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[BRCLocalStatInfo fileID](self->_st, "fileID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "unsignedLongLongValue");

  v9 = -[BRCLocalItem fromReadOnlyDB](self, "fromReadOnlyDB");
  v10 = v9;
  if (v4 && v9)
  {
    brc_bread_crumbs();
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT))
      -[BRCLocalItem(LegacyAdditions) changedAtRelativePath:scanPackage:].cold.4();

  }
  if (-[BRCLocalItem needsReading](self, "needsReading"))
  {
    brc_bread_crumbs();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      -[BRCLocalItem(LegacyAdditions) changedAtRelativePath:scanPackage:].cold.1();
    goto LABEL_20;
  }
  if (!v8
    || (-[BRCLocalStatInfo generationID](self->_st, "generationID"),
        v13 = (void *)objc_claimAutoreleasedReturnValue(),
        v13,
        !v13))
  {
    brc_bread_crumbs();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      -[BRCLocalItem(LegacyAdditions) changedAtRelativePath:scanPackage:].cold.2();
    goto LABEL_20;
  }
  if ((objc_msgSend(v6, "exists") & 1) == 0)
  {
    brc_bread_crumbs();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      -[BRCLocalItem(LegacyAdditions) changedAtRelativePath:scanPackage:].cold.3();
    goto LABEL_20;
  }
  v14 = objc_msgSend(v6, "fileID");
  if (v8 != v14 && v10)
  {
    -[BRCLocalStatInfo stagedFileID](self->_st, "stagedFileID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "unsignedLongLongValue");
    v18 = objc_msgSend(v6, "fileID");

    if (v17 != v18)
      goto LABEL_14;
  }
  else if (v8 != v14)
  {
LABEL_14:
    brc_bread_crumbs();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      v29 = 134218498;
      v30 = (BRCLocalItem *)v8;
      v31 = 2048;
      v32 = objc_msgSend(v6, "fileID");
      v33 = 2112;
      v34 = v11;
      v19 = "[DEBUG] fileID (%llu) doesn't match (%llu)%@";
LABEL_28:
      _os_log_debug_impl(&dword_1CBD43000, v12, OS_LOG_TYPE_DEBUG, v19, (uint8_t *)&v29, 0x20u);
      goto LABEL_20;
    }
    goto LABEL_20;
  }
  -[BRCLocalStatInfo generationID](self->_st, "generationID");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v22, "isEqualToFSGenerationID:", objc_msgSend(v6, "fsGenerationID")) & 1) != 0)
  {

    goto LABEL_25;
  }
  if (!v10)
  {

    goto LABEL_34;
  }
  v23 = -[BRCLocalStatInfo stagedGenerationID](self->_st, "stagedGenerationID");
  v24 = objc_msgSend(v6, "fsGenerationID");

  if (v23 != v24)
  {
LABEL_34:
    brc_bread_crumbs();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      -[BRCLocalStatInfo generationID](self->_st, "generationID");
      v25 = (BRCLocalItem *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "generationID");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = 138412802;
      v30 = v25;
      v31 = 2112;
      v32 = (uint64_t)v26;
      v33 = 2112;
      v34 = v11;
      _os_log_debug_impl(&dword_1CBD43000, v12, OS_LOG_TYPE_DEBUG, "[DEBUG] genID (%@) doesn't match (%@)%@", (uint8_t *)&v29, 0x20u);

    }
    goto LABEL_20;
  }
LABEL_25:
  if (!-[BRCLocalItem _contentXattrsHaveChangedAtRelativeAPath:](self, "_contentXattrsHaveChangedAtRelativeAPath:", v6))
  {
    v20 = 0;
    goto LABEL_21;
  }
  brc_bread_crumbs();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    v29 = 138412802;
    v30 = self;
    v31 = 2112;
    v32 = (uint64_t)v6;
    v33 = 2112;
    v34 = v11;
    v19 = "[DEBUG] xatts signatures don't match between %@ and %@%@";
    goto LABEL_28;
  }
LABEL_20:

  v20 = 1;
LABEL_21:

  return v20;
}

- (void)updateFromFSAtPath:(id)a3
{
  -[BRCLocalItem updateFromFSAtPath:parentGlobalID:](self, "updateFromFSAtPath:parentGlobalID:", a3, 0);
}

- (BOOL)evictInTask:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  id v7;
  void *v8;
  NSObject *v9;
  char *v10;
  NSObject *v11;
  char *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  NSObject *v18;
  void *v19;
  int v20;
  char *v21;
  NSObject *v22;
  char *v23;
  BOOL v24;
  uint64_t v26;
  void *v27;
  char *v28;
  void *v29;
  void *v30;
  const char *v31;
  uint64_t v32[3];
  uint8_t buf[4];
  const char *v34;
  __int16 v35;
  const char *v36;
  __int16 v37;
  id v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  void *v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  memset(v32, 0, sizeof(v32));
  __brc_create_section(0, (uint64_t)"-[BRCLocalItem(LegacyAdditions) evictInTask:options:error:]", 1115, v32);
  brc_bread_crumbs();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    v26 = v32[0];
    -[BRCLocalItem appLibrary](self, "appLibrary");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "logName");
    v28 = (char *)objc_claimAutoreleasedReturnValue();
    -[BRCLocalItem itemID](self, "itemID");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    BRCPrettyPrintBitmap();
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134219010;
    v34 = (const char *)v26;
    v35 = 2112;
    v36 = v28;
    v37 = 2112;
    v38 = v29;
    v39 = 2112;
    v40 = v30;
    v41 = 2112;
    v42 = v8;
    _os_log_debug_impl(&dword_1CBD43000, v9, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx request to evict client item %@:%@ with options %@%@", buf, 0x34u);

  }
  if (-[BRCLocalItem isDead](self, "isDead"))
  {
    brc_bread_crumbs();
    v10 = (char *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      -[BRCLocalItem itemID](self, "itemID");
      v12 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v34 = v12;
      v35 = 2112;
      v36 = v10;
      _os_log_impl(&dword_1CBD43000, v11, OS_LOG_TYPE_DEFAULT, "[WARNING] ignoring eviction request for %@ because item is dead%@", buf, 0x16u);

    }
    v13 = (void *)MEMORY[0x1E0CB35C8];
    -[BRCLocalItem itemID](self, "itemID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "itemIDString");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "brc_errorItemNotFound:", v15);
    v16 = (id)objc_claimAutoreleasedReturnValue();

    if (!v16)
      goto LABEL_15;
    brc_bread_crumbs();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v18 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v18, (os_log_type_t)0x90u))
      goto LABEL_14;
    v31 = "(passed to caller)";
    *(_DWORD *)buf = 136315906;
    v34 = "-[BRCLocalItem(LegacyAdditions) evictInTask:options:error:]";
    v35 = 2080;
    if (!a5)
      v31 = "(ignored by caller)";
    goto LABEL_25;
  }
  -[BRCLocalItem appLibrary](self, "appLibrary");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "hasUbiquityClientsConnected");

  if (!v20)
  {
    v24 = 1;
    goto LABEL_19;
  }
  brc_bread_crumbs();
  v21 = (char *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    -[BRCLocalItem itemID](self, "itemID");
    v23 = (char *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v34 = v23;
    v35 = 2112;
    v36 = v21;
    _os_log_impl(&dword_1CBD43000, v22, OS_LOG_TYPE_DEFAULT, "[WARNING] ignoring eviction request for %@ because app library is used by a ubiquity client%@", buf, 0x16u);

  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "brc_errorCompatibilityIssue");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    brc_bread_crumbs();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v18 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v18, (os_log_type_t)0x90u))
    {
LABEL_14:

      goto LABEL_15;
    }
    v31 = "(passed to caller)";
    *(_DWORD *)buf = 136315906;
    v34 = "-[BRCLocalItem(LegacyAdditions) evictInTask:options:error:]";
    v35 = 2080;
    if (!a5)
      v31 = "(ignored by caller)";
LABEL_25:
    v36 = v31;
    v37 = 2112;
    v38 = v16;
    v39 = 2112;
    v40 = v17;
    _os_log_error_impl(&dword_1CBD43000, v18, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
    goto LABEL_14;
  }
LABEL_15:
  if (a5)
  {
    v16 = objc_retainAutorelease(v16);
    *a5 = v16;
  }

  v24 = 0;
LABEL_19:
  __brc_leave_section(v32);

  return v24;
}

- (void)markReserved
{
  void *v3;
  NSObject *v4;
  int v5;
  BRCLocalItem *v6;
  __int16 v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (-[BRCLocalItem isFSRoot](self, "isFSRoot"))
  {
    brc_bread_crumbs();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = 138412546;
      v6 = self;
      v7 = 2112;
      v8 = v3;
      _os_log_impl(&dword_1CBD43000, v4, OS_LOG_TYPE_DEFAULT, "[WARNING] Can't reserve an fsroot %@%@", (uint8_t *)&v5, 0x16u);
    }
  }
  else
  {
    -[BRCLocalStatInfo _markReserved](self->_st, "_markReserved");
    brc_bread_crumbs();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      -[BRCLocalItem(LegacyAdditions) markReserved].cold.1();
  }

}

- (void)fixupStagedItemAtStartup
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  int v13;
  void *v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  BRCRelativePath *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  char v40;
  void *v41;
  NSObject *v42;
  int v43;
  unsigned int v44;
  uint64_t v45[3];
  uint8_t buf[40];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  memset(v45, 0, sizeof(v45));
  __brc_create_section(0, (uint64_t)"-[BRCLocalItem(LegacyAdditions) fixupStagedItemAtStartup]", 1148, v45);
  brc_bread_crumbs();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218498;
    *(_QWORD *)&buf[4] = v45[0];
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = self;
    *(_WORD *)&buf[22] = 2112;
    *(_QWORD *)&buf[24] = v3;
    _os_log_debug_impl(&dword_1CBD43000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx fixing up staged item %@%@", buf, 0x20u);
  }

  v44 = 0;
  -[BRCLocalItem st](self, "st");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fileID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "unsignedLongLongValue");

  -[BRCAccountSession stageRegistry](self->_session, "stageRegistry");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCLocalItem st](self, "st");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stagedFileID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "unsignedLongLongValue");

  -[BRCLocalItem st](self, "st");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "stagedGenerationID");

  if ((objc_msgSend(v8, "existsInStage:generationID:", v11, &v44) & 1) == 0)
  {
    if (!objc_msgSend(v8, "existsInOldVersionStageOrGraveyard:", v11))
    {
      brc_bread_crumbs();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
        -[BRCLocalItem(LegacyAdditions) fixupStagedItemAtStartup].cold.6();

      if (objc_msgSend(v8, "existsInStage:generationID:", v7, &v44))
      {
        memset(buf, 0, 24);
        __brc_create_section(0, (uint64_t)"-[BRCLocalItem(LegacyAdditions) fixupStagedItemAtStartup]", 1190, buf);
        brc_bread_crumbs();
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
          -[BRCLocalItem(LegacyAdditions) fixupStagedItemAtStartup].cold.5();

        -[BRCLocalItem itemID](self, "itemID");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "moveFromStageToGraveyard:forItemID:", v7, v22);

        __brc_leave_section((uint64_t *)buf);
      }
      v23 = -[BRCRelativePath initWithFileID:session:]([BRCRelativePath alloc], "initWithFileID:session:", v11, self->_session);
      v43 = 0;
      if (-[BRCRelativePath resolveMustExist:error:](v23, "resolveMustExist:error:", 1, &v43))
      {
        -[BRCLocalItem st](self, "st");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "setItemScope:", -[BRCRelativePath itemScope](v23, "itemScope"));
      }
      else
      {
        brc_bread_crumbs();
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v30 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v30, (os_log_type_t)0x90u))
        {
          *(_DWORD *)buf = 138412802;
          *(_QWORD *)&buf[4] = v23;
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = v43;
          *(_WORD *)&buf[18] = 2112;
          *(_QWORD *)&buf[20] = v24;
          _os_log_error_impl(&dword_1CBD43000, v30, (os_log_type_t)0x90u, "[ERROR] Can't resolve path %@ %{errno}d%@", buf, 0x1Cu);
        }

      }
      -[BRCLocalItem markLiveFromStageWithPath:](self, "markLiveFromStageWithPath:", v23);
      -[BRCLocalItem markLostClearGenerationID:backoffMode:](self, "markLostClearGenerationID:backoffMode:", 0, 1);
      -[BRCAccountSession serverZoneByRowID:](self->_session, "serverZoneByRowID:", self->_parentZoneRowID);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "clientZone");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[BRCLocalItem st](self, "st");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "parentID");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      -[BRCLocalItem st](self, "st");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "logicalName");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "itemByParentID:andLogicalName:", v34, v36);
      v37 = (void *)objc_claimAutoreleasedReturnValue();

      if (v37)
      {
        objc_msgSend(v37, "itemID");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        -[BRCLocalItem itemID](self, "itemID");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = objc_msgSend(v38, "isEqualToItemID:", v39);

        if ((v40 & 1) == 0)
        {
          brc_bread_crumbs();
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v42 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            *(_QWORD *)&buf[4] = v37;
            *(_WORD *)&buf[12] = 2112;
            *(_QWORD *)&buf[14] = v41;
            _os_log_impl(&dword_1CBD43000, v42, OS_LOG_TYPE_DEFAULT, "[WARNING] We have a conflicting item %@ which needs to get bounced away%@", buf, 0x16u);
          }

          objc_msgSend(v37, "markLostWhenReplacedByItem:", self);
          objc_msgSend(v37, "saveToDB");
        }
      }

      goto LABEL_39;
    }
    brc_bread_crumbs();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      -[BRCLocalItem(LegacyAdditions) fixupStagedItemAtStartup].cold.4();
    goto LABEL_15;
  }
  if (v44 != v13)
  {
    if (v44 || -[BRCStatInfo type](self->_st, "type"))
    {
      brc_bread_crumbs();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412802;
        *(_QWORD *)&buf[4] = self;
        *(_WORD *)&buf[12] = 2048;
        *(_QWORD *)&buf[14] = v44;
        *(_WORD *)&buf[22] = 2112;
        *(_QWORD *)&buf[24] = v16;
        _os_log_fault_impl(&dword_1CBD43000, v17, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: item %@ was edited in stage (generationID = %lu)%@", buf, 0x20u);
      }
    }
    else
    {
      brc_bread_crumbs();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = self;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v16;
        _os_log_impl(&dword_1CBD43000, v17, OS_LOG_TYPE_DEFAULT, "[WARNING] Clearning staged item with zero generationID for item %@%@", buf, 0x16u);
      }
    }
LABEL_15:

    -[BRCLocalItem clearFromStage](self, "clearFromStage");
    goto LABEL_39;
  }
  if (-[BRCLocalItem isReserved](self, "isReserved"))
  {
    brc_bread_crumbs();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      -[BRCLocalItem(LegacyAdditions) fixupStagedItemAtStartup].cold.1();
LABEL_43:

    goto LABEL_40;
  }
  if ((objc_msgSend(v8, "existsInOldVersionStageOrGraveyard:", v7) & 1) == 0)
  {
    brc_bread_crumbs();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      -[BRCLocalItem(LegacyAdditions) fixupStagedItemAtStartup].cold.3();
    goto LABEL_43;
  }
  brc_bread_crumbs();
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
    -[BRCLocalItem(LegacyAdditions) fixupStagedItemAtStartup].cold.2();

  if (-[BRCLocalItem isDocument](self, "isDocument"))
  {
    -[BRCLocalItem st](self, "st");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "documentID");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "unsignedIntValue");

    objc_msgSend(v8, "transferDocumentID:fromOldVersionStage:toStage:", v29, v7, v11);
  }
  -[BRCLocalItem markReserved](self, "markReserved");
LABEL_39:
  -[BRCLocalItem saveToDB](self, "saveToDB");
LABEL_40:

  __brc_leave_section(v45);
}

- (void)_markLostWhenReplacedByItem:(id)a3 backoffMode:(unsigned __int8)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  void *v8;
  char v9;
  BRCLocalStatInfo *st;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  void *v22;
  char v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  int v32;
  BRCLocalItem *v33;
  __int16 v34;
  int v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  void *v39;
  uint64_t v40;

  v4 = a4;
  v40 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (!-[BRCLocalItem isDead](self, "isDead"))
  {
    if (!v6
      || (-[BRCLocalItem itemID](self, "itemID"),
          v7 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v6, "itemID"),
          v8 = (void *)objc_claimAutoreleasedReturnValue(),
          v9 = objc_msgSend(v7, "isEqualToItemID:", v8),
          v8,
          v7,
          (v9 & 1) == 0))
    {
      st = self->_st;
      -[BRCLocalItem appLibrary](self, "appLibrary");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[BRCLocalStatInfo _markLostAddingBackoffWithMode:appLibrary:](st, "_markLostAddingBackoffWithMode:appLibrary:", v4, v11);

      if (v6)
      {
        -[BRCStatInfo parentID](self->_st, "parentID");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "st");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "parentID");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v12, "isEqualToItemID:", v14);

        if (v15)
        {
          if (-[BRCLocalItem isFault](self, "isFault") && objc_msgSend(v6, "isFault"))
          {
            -[BRCLocalStatInfo logicalName](self->_st, "logicalName");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "st");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "logicalName");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = objc_msgSend(v16, "isEqualToString:", v18);

          }
          else
          {
            v19 = 0;
          }
          -[BRCLocalStatInfo filename](self->_st, "filename");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "st");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "filename");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = objc_msgSend(v20, "isEqualToString:", v22);

          if ((v23 & 1) != 0 || v19)
            -[BRCLocalItem moveAsideLocally](self, "moveAsideLocally");
        }
        -[BRCLocalStatInfo fileID](self->_st, "fileID");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "st");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "fileID");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = objc_msgSend(v24, "isEqual:", v26);

        if (v27)
        {
          -[BRCLocalStatInfo _clearFileID](self->_st, "_clearFileID");
          if (-[BRCLocalItem isDocument](self, "isDocument"))
          {
            -[BRCLocalItem asDocument](self, "asDocument");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "markNeedsReading");

          }
        }
      }
      brc_bread_crumbs();
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
      {
        -[BRCLocalItem diffAgainstOriginalItem](self, "diffAgainstOriginalItem");
        BRCItemFieldsPrettyPrint();
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = 138413058;
        v33 = self;
        v34 = 1024;
        v35 = v4;
        v36 = 2112;
        v37 = v31;
        v38 = 2112;
        v39 = v29;
        _os_log_debug_impl(&dword_1CBD43000, v30, OS_LOG_TYPE_DEBUG, "[DEBUG] item marked lost: %@\nbackoff mode:%d diffs:(%@)%@", (uint8_t *)&v32, 0x26u);

      }
    }
  }

}

- (void)markFound
{
  -[BRCLocalStatInfo _markFound](self->_st, "_markFound");
}

- (void)markLostWhenReplacedByItem:(id)a3
{
  -[BRCLocalItem _markLostWhenReplacedByItem:backoffMode:](self, "_markLostWhenReplacedByItem:backoffMode:", a3, 1);
}

- (void)markLostClearGenerationID:(BOOL)a3 backoffMode:(unsigned __int8)a4
{
  _BOOL4 v4;

  v4 = a3;
  -[BRCLocalItem _markLostWhenReplacedByItem:backoffMode:](self, "_markLostWhenReplacedByItem:backoffMode:", 0, a4);
  if (v4)
    -[BRCLocalStatInfo _clearGenerationID](self->_st, "_clearGenerationID");
}

- (void)markLostWithoutBackoff
{
  -[BRCLocalItem _markLostWhenReplacedByItem:backoffMode:](self, "_markLostWhenReplacedByItem:backoffMode:", 0, 0);
}

- (void)markLiveFromStageWithPath:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  BRCAppLibrary *v8;
  BRCAppLibrary *appLibrary;
  BRCLocalStatInfo *st;
  void *v11;
  void *v12;
  void *v13;
  int v14;

  v4 = a3;
  if (-[BRCLocalItem isFSRoot](self, "isFSRoot"))
  {
    brc_bread_crumbs();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      -[BRCLocalItem(LegacyAdditions) markLiveFromStageWithPath:].cold.1();

  }
  else
  {
    objc_msgSend(v4, "appLibrary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(v4, "appLibrary");
      v8 = (BRCAppLibrary *)objc_claimAutoreleasedReturnValue();
      appLibrary = self->_appLibrary;
      self->_appLibrary = v8;

    }
    st = self->_st;
    if (-[BRCLocalItem isDocument](self, "isDocument"))
    {
      -[BRCLocalItem asDocument](self, "asDocument");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "desiredVersion");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[BRCLocalStatInfo _markLiveFromStageAsFault:](st, "_markLiveFromStageAsFault:", objc_msgSend(v12, "isFault"));

    }
    else
    {
      -[BRCLocalStatInfo _markLiveFromStageAsFault:](st, "_markLiveFromStageAsFault:", 0);
    }
    -[BRCLocalItem orig](self, "orig");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "isReserved");

    if (v14)
      -[BRCLocalItem _updatePropagatedInfoFromFSAtPath:](self, "_updatePropagatedInfoFromFSAtPath:", v4);
  }

}

- (void)_setOrRemoveSmartFolderSpotlightAttributeAt:(id)a3
{
  id v4;
  int v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  int v17;
  void *v18;
  NSObject *v19;
  const char *v20;
  void *v21;
  void *v22;
  void *v23;
  const char *v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  const char *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  _QWORD v33[3];

  v33[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[BRCLocalItem isShared](self, "isShared") && (-[BRCLocalItem sharingOptions](self, "sharingOptions") & 4) != 0)
    v5 = !-[BRCLocalItem isDocumentBeingCopiedToNewZone](self, "isDocumentBeingCopiedToNewZone");
  else
    v5 = 0;
  objc_msgSend(v4, "physicalURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = BRCSetSharedSpotlightAttributeAtURL();

  if (v5 == v7)
    goto LABEL_16;
  if (v5)
  {
    if (-[BRCServerZone isPrivateZone](self->_serverZone, "isPrivateZone"))
    {
      v8 = 0;
    }
    else
    {
      +[BRCAccountSession userIdentityForKey:db:](BRCAccountSession, "userIdentityForKey:db:", self->_ownerKey, self->_db);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "nameComponentsAcceptUnknownUser:", 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "br_formattedName");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(v4, "physicalURL");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCServerZone isPrivateZone](self->_serverZone, "isPrivateZone");
    v16 = BRCSetSharedSpotlightAttributeAtURL();

    if ((v16 & 1) == 0)
      goto LABEL_14;
  }
  else
  {
    objc_msgSend(v4, "physicalURL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = BRCSetSharedSpotlightAttributeAtURL();

    if ((v10 & 1) == 0)
    {
LABEL_14:
      v17 = *__error();
      brc_bread_crumbs();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, (os_log_type_t)0x90u))
      {
        if (v5)
          v24 = "set";
        else
          v24 = "remove";
        objc_msgSend(v4, "physicalURL");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "path");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "fp_obfuscatedPath");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = 136315906;
        v29 = v24;
        v30 = 2112;
        v31 = v27;
        v32 = 1024;
        LODWORD(v33[0]) = v17;
        WORD2(v33[0]) = 2112;
        *(_QWORD *)((char *)v33 + 6) = v18;
        _os_log_error_impl(&dword_1CBD43000, v19, (os_log_type_t)0x90u, "[ERROR] Failed to %s the spotlight attribute at %@ %{errno}d%@", (uint8_t *)&v28, 0x26u);

      }
      *__error() = v17;
      goto LABEL_16;
    }
  }
  brc_bread_crumbs();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    if (v5)
      v20 = "set";
    else
      v20 = "remove";
    objc_msgSend(v4, "physicalURL");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "path");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "fp_obfuscatedPath");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = 136315650;
    v29 = v20;
    v30 = 2112;
    v31 = v23;
    v32 = 2112;
    v33[0] = v11;
    _os_log_debug_impl(&dword_1CBD43000, v12, OS_LOG_TYPE_DEBUG, "[DEBUG] %s the spotlight attribute at %@%@", (uint8_t *)&v28, 0x20u);

  }
LABEL_16:

}

- (BOOL)_computedUserVisibleStatusAtPath:(id)a3
{
  id v4;
  BOOL v5;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  _BOOL8 v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;

  v4 = a3;
  if (!-[BRCLocalItem isReserved](self, "isReserved") && !-[BRCLocalItem isDead](self, "isDead"))
  {
    if (!-[BRCLocalItem isDocument](self, "isDocument"))
      goto LABEL_8;
    -[BRCLocalItem asDocument](self, "asDocument");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "st");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "documentID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "unsignedLongLongValue");

    if (!v10)
    {
      brc_bread_crumbs();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, (os_log_type_t)0x90u))
        -[BRCLocalItem(LegacyAdditions) _computedUserVisibleStatusAtPath:].cold.1();

    }
    else
    {
LABEL_8:
      if (!objc_msgSend(v4, "exists") || (objc_msgSend(v4, "isHiddenFile") & 1) == 0)
      {
        objc_msgSend(v4, "absolutePath");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "stringByDeletingLastPathComponent");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "lastPathComponent");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        v14 = objc_msgSend(v4, "itemScope") == 2;
        -[BRCStatInfo parentID](self->_st, "parentID");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "isNonDesktopRoot");
        v17 = objc_msgSend(v4, "itemScope");
        -[BRCLocalStatInfo logicalName](self->_st, "logicalName");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[BRCLocalItem appLibrary](self, "appLibrary");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = +[BRCLocalItem computeUserVisibleStatusOfLiveItemWithParentVisible:parentIsNonDesktopRoot:parentScope:itemFilename:parentFilename:appLibrary:](BRCLocalItem, "computeUserVisibleStatusOfLiveItemWithParentVisible:parentIsNonDesktopRoot:parentScope:itemFilename:parentFilename:appLibrary:", v14, v16, v17, v18, v13, v19);

        goto LABEL_4;
      }
    }
  }
  v5 = 0;
LABEL_4:

  return v5;
}

- (void)_updatePropagatedInfoFromFSAtPath:(id)a3
{
  id v4;
  BRCAppLibrary *v5;
  BRCAppLibrary *appLibrary;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  uint64_t v11;
  int v12;
  void *v13;
  NSObject *v14;
  unint64_t sharingOptions;
  void *v16;
  NSObject *v17;
  unsigned __int16 v18;
  void *v19;
  NSObject *v20;
  _BOOL4 v21;
  BOOL v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  _QWORD v32[5];
  unsigned __int16 v33;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  uint64_t v37;
  __int16 v38;
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "appLibrary");
  v5 = (BRCAppLibrary *)objc_claimAutoreleasedReturnValue();
  appLibrary = self->_appLibrary;
  self->_appLibrary = v5;

  if (!self->_appLibrary)
  {
    brc_bread_crumbs();
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT))
      -[BRCLocalItem(LegacyAdditions) _initWithRelativePath:parentGlobalID:].cold.2();

  }
  -[BRCLocalStatInfo setItemScope:](self->_st, "setItemScope:", objc_msgSend(v4, "itemScope"));
  self->_isUserVisible = -[BRCLocalItem _computedUserVisibleStatusAtPath:](self, "_computedUserVisibleStatusAtPath:", v4);
  if (!-[BRCLocalItem isSharedToMeTopLevelItem](self, "isSharedToMeTopLevelItem")
    && !-[BRCLocalItem isFSRoot](self, "isFSRoot")
    && !-[BRCLocalItem hasShareIDAndIsOwnedByMe](self, "hasShareIDAndIsOwnedByMe"))
  {
    -[BRCClientZone db](self->_clientZone, "db");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCStatInfo parentID](self->_st, "parentID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v7, "fetch:", CFSTR("SELECT item_sharing_options FROM client_items WHERE item_id = %@ AND zone_rowid = %@"), v8, self->_parentZoneRowID);

    if (!objc_msgSend(v9, "next"))
      goto LABEL_26;
    v10 = objc_msgSend(v9, "unsignedLongAtIndex:", 0);
    v11 = v10 & 0x78;
    if ((self->_sharingOptions & 0x7C) == v11)
      goto LABEL_26;
    v12 = v10;
    brc_bread_crumbs();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      BRCPrettyPrintBitmap();
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      BRCPrettyPrintBitmap();
      *(_DWORD *)buf = 138412802;
      v35 = v31;
      v36 = 2112;
      v37 = objc_claimAutoreleasedReturnValue();
      v26 = (void *)v37;
      v38 = 2112;
      v39 = v13;
      _os_log_debug_impl(&dword_1CBD43000, v14, OS_LOG_TYPE_DEBUG, "[DEBUG] learning new sharing options %@ for %@%@", buf, 0x20u);

    }
    sharingOptions = self->_sharingOptions;
    if ((sharingOptions & 4) != 0)
    {
      brc_bread_crumbs();
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_FAULT))
        -[BRCLocalItem(LegacyAdditions) _updatePropagatedInfoFromFSAtPath:].cold.3();

      sharingOptions = self->_sharingOptions;
    }
    self->_sharingOptions = sharingOptions & 0xFFFFFFFFFFFFFF83 | v11;
    if (((-[BRCLocalItem sharingOptions](self->_orig, "sharingOptions") ^ v12) & 0x20) == 0)
      goto LABEL_26;
    brc_bread_crumbs();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      -[BRCLocalItem(LegacyAdditions) _updatePropagatedInfoFromFSAtPath:].cold.2();

    v18 = +[BRCStageRegistry computeItemModeFromStatInfo:isPackage:](BRCStageRegistry, "computeItemModeFromStatInfo:isPackage:", self->_st, -[BRCLocalItem isPackage](self, "isPackage"));
    *(_DWORD *)buf = 0;
    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v32[2] = __67__BRCLocalItem_LegacyAdditions___updatePropagatedInfoFromFSAtPath___block_invoke;
    v32[3] = &unk_1E875DF30;
    v33 = v18;
    v32[4] = self;
    if ((objc_msgSend(v4, "performOnOpenFileDescriptor:error:", v32, buf) & 1) == 0)
    {
      brc_bread_crumbs();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, (os_log_type_t)0x90u))
        -[BRCLocalItem(LegacyAdditions) _updatePropagatedInfoFromFSAtPath:].cold.1();

    }
    if (-[BRCLocalItem needsInsert](self, "needsInsert") || (self->_sharingOptions & 0x20) != 0)
      goto LABEL_26;
    v21 = -[BRCLocalItem isDocument](self, "isDocument");
    v22 = -[BRCLocalItem isKnownByServer](self, "isKnownByServer");
    if (v21)
    {
      if (v22)
      {
        -[BRCAccountSession(LegacyAdditions) fsWriter](self->_session, "fsWriter");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "physicalURL");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[BRCLocalItem asDocument](self, "asDocument");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "applyLocalEditIfNecessaryToURL:forItem:serverItem:forDelete:error:", v24, v25, 0, 0, 0);

      }
      else
      {
        -[BRCLocalItem asDocument](self, "asDocument");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "markForceUpload");
      }
    }
    else
    {
      if (v22)
      {
LABEL_26:

        goto LABEL_27;
      }
      -[BRCAccountSession syncUpScheduler](self->_session, "syncUpScheduler");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "rescheduleSuspendedJobsMatching:inState:", self, 52);
    }

    goto LABEL_26;
  }
LABEL_27:

}

uint64_t __67__BRCLocalItem_LegacyAdditions___updatePropagatedInfoFromFSAtPath___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  BOOL v9;

  if (fchmod(a2, *(_WORD *)(a1 + 40)))
    return *__error();
  objc_msgSend(*(id *)(a1 + 32), "st");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(*(id *)(a1 + 32), "isDocument");
  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "asDocument");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "currentVersion");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }
  objc_msgSend(*(id *)(a1 + 32), "clientZone");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = +[BRCStageRegistry applySharingReadonlyACLsToFD:statInfo:version:clientZone:sharingOptions:](BRCStageRegistry, "applySharingReadonlyACLsToFD:statInfo:version:clientZone:sharingOptions:", a2, v5, v7, v8, objc_msgSend(*(id *)(a1 + 32), "sharingOptions"));

  if (v6)
  {

  }
  if (!v9)
    return *__error();
  else
    return 0;
}

- (void)markRenamedUsingServerItem:(id)a3 toRelpath:(id)a4 logicalName:(id)a5 filename:(id)a6 origLogicalNameBeforeBounce:(id)a7 forContentApplyOnly:(BOOL)a8
{
  id v14;
  id v15;
  id v16;
  void *v17;
  NSObject *v18;
  BRCLocalStatInfo *st;
  void *v20;
  void *v21;
  BRCZoneRowID *v22;
  BRCZoneRowID *parentZoneRowID;
  NSNumber *v24;
  NSNumber *parentFileID;
  BRCLocalStatInfo *v26;
  id v27;
  id v28;
  id v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  id v34;
  id v35;
  uint64_t v36[3];
  uint8_t buf[4];
  uint64_t v38;
  __int16 v39;
  id v40;
  __int16 v41;
  id v42;
  __int16 v43;
  void *v44;
  __int16 v45;
  void *v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v34 = a6;
  v35 = a7;
  memset(v36, 0, sizeof(v36));
  __brc_create_section(0, (uint64_t)"-[BRCLocalItem(LegacyAdditions) markRenamedUsingServerItem:toRelpath:logicalName:filename:origLogicalNameBeforeBounce:forContentApplyOnly:]", 1493, v36);
  brc_bread_crumbs();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    v32 = v36[0];
    objc_msgSend(v14, "parentItemIDOnFS");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134219010;
    v38 = v32;
    v39 = 2112;
    v40 = v14;
    v41 = 2112;
    v42 = v15;
    v43 = 2112;
    v44 = v33;
    v45 = 2112;
    v46 = v17;
    _os_log_debug_impl(&dword_1CBD43000, v18, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx marking renamed from server item\n  server: %@\n  relpath: %@\n  parentID: %@\n%@", buf, 0x34u);

  }
  if (!a8)
  {
    st = self->_st;
    objc_msgSend(v14, "parentItemIDOnFS");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCLocalStatInfo _setParentID:](st, "_setParentID:", v20);

    objc_msgSend(v14, "parentZoneOnFS");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "dbRowID");
    v22 = (BRCZoneRowID *)objc_claimAutoreleasedReturnValue();
    parentZoneRowID = self->_parentZoneRowID;
    self->_parentZoneRowID = v22;

  }
  if (v15)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v15, "parentFileID"));
    v24 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    parentFileID = self->_parentFileID;
    self->_parentFileID = v24;

    -[BRCLocalItem _updatePropagatedInfoFromFSAtPath:](self, "_updatePropagatedInfoFromFSAtPath:", v15);
  }
  if (-[BRCStatInfo type](self->_st, "type") != 3)
  {
    v26 = self->_st;
    if (v34)
      v27 = v34;
    else
      v27 = v16;
    if (v35)
      v28 = v35;
    else
      v28 = v16;
    if (v35)
      v29 = v16;
    else
      v29 = 0;
    objc_msgSend(v14, "st");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "logicalName");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCLocalStatInfo setFilename:forcePhysicalName:forceBouncedLogicalName:serverName:](v26, "setFilename:forcePhysicalName:forceBouncedLogicalName:serverName:", v28, v27, v29, v31);

    if (!-[BRCLocalItem isReserved](self, "isReserved") && !-[BRCLocalItem isFault](self, "isFault"))
      -[BRCLocalItem markLostClearGenerationID:backoffMode:](self, "markLostClearGenerationID:backoffMode:", 0, 0);
  }
  __brc_leave_section(v36);

}

- (void)applyMetadataOnFileID:(unint64_t)a3 liveFD:(unint64_t)a4 sharingOptions:(unint64_t)a5
{
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  int v18;
  void *v19;
  NSObject *v20;
  void *v21;
  int v22;
  void *v23;
  NSObject *v24;
  BRCItemID *itemID;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  uint8_t buf[4];
  unint64_t v31;
  __int16 v32;
  _BYTE v33[14];
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  -[BRCAccountSession stageRegistry](self->_session, "stageRegistry");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!a3)
  {
    brc_bread_crumbs();
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT))
      -[BRCLocalItem(LegacyAdditions) applyMetadataOnFileID:liveFD:sharingOptions:].cold.1();

  }
  v10 = BRCOpenByID(objc_msgSend(v9, "deviceID"), a3, 2129924);
  if ((v10 & 0x80000000) != 0)
  {
    v18 = *__error();
    brc_bread_crumbs();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, (os_log_type_t)0x90u))
    {
      *(_DWORD *)buf = 134218754;
      v31 = a3;
      v32 = 2048;
      *(_QWORD *)v33 = a4;
      *(_WORD *)&v33[8] = 1024;
      *(_DWORD *)&v33[10] = v18;
      v34 = 2112;
      v35 = v19;
      _os_log_error_impl(&dword_1CBD43000, v20, (os_log_type_t)0x90u, "[ERROR] can't open %lld to set metadata for %lld %{errno}d%@", buf, 0x26u);
    }

    v21 = 0;
    *__error() = v18;
  }
  else
  {
    v11 = v10;
    v12 = 0xFFFFFFFFLL;
    if (a4
      && a4 != a3
      && (-[BRCAccountSession volume](self->_session, "volume"),
          v13 = (void *)objc_claimAutoreleasedReturnValue(),
          v12 = BRCOpenByID(objc_msgSend(v13, "deviceID"), a4, 2129924),
          v13,
          (v12 & 0x80000000) != 0))
    {
      v22 = *__error();
      brc_bread_crumbs();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, (os_log_type_t)0x90u))
      {
        *(_DWORD *)buf = 134218498;
        v31 = a4;
        v32 = 1024;
        *(_DWORD *)v33 = v22;
        *(_WORD *)&v33[4] = 2112;
        *(_QWORD *)&v33[6] = v23;
        _os_log_error_impl(&dword_1CBD43000, v24, (os_log_type_t)0x90u, "[ERROR] can't open live path %lld to set metadata %{errno}d%@", buf, 0x1Cu);
      }

      *__error() = v22;
      close(v11);
      v21 = 0;
    }
    else
    {
      if (-[BRCLocalItem isDocument](self, "isDocument"))
      {
        -[BRCLocalItem asDocument](self, "asDocument");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "desiredVersion");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = v15;
        if (v15)
        {
          v17 = v15;
        }
        else
        {
          objc_msgSend(v14, "currentVersion");
          v17 = (id)objc_claimAutoreleasedReturnValue();
        }
        v21 = v17;

      }
      else
      {
        v21 = 0;
      }
      itemID = self->_itemID;
      -[BRCLocalItem clientZone](self, "clientZone");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[BRCLocalItem st](self, "st");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "applyMetadataOnFileDescriptor:liveFileDescriptor:itemID:clientZone:statInfo:version:sharingOptions:", v11, v12, itemID, v26, v27, v21, a5);

      close(v11);
      if ((v12 & 0x80000000) == 0)
        close(v12);
    }
  }

}

- (void)beginBounceAndSaveToDBWithBounceNumber:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[BRCLocalStatInfo _generatedBouncedLogicalFilenameWithBounceNumber:](self->_st, "_generatedBouncedLogicalFilenameWithBounceNumber:", a3);
  if (-[BRCLocalItem isFault](self, "isFault"))
  {
    -[BRCLocalItem asDocument](self, "asDocument");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "st");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "logicalName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v4, "currentVersion");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "numberWithLongLong:", objc_msgSend(v8, "size"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stageFaultForCreation:name:size:isPackage:", 0, v6, v9, objc_msgSend(v4, "isPackage"));

  }
  -[BRCLocalItem saveToDB](self, "saveToDB");
  -[BRCPQLConnection flush](self->_db, "flush");
}

- (void)markBounceFinished
{
  -[BRCLocalStatInfo _migrateTmpBouncedNameToLocalName](self->_st, "_migrateTmpBouncedNameToLocalName");
  if (-[BRCLocalItem isFault](self, "isFault"))
    -[BRCLocalStatInfo _markLiveFromStageAsFault:](self->_st, "_markLiveFromStageAsFault:", 1);
  -[BRCLocalItem markLostClearGenerationID:backoffMode:](self, "markLostClearGenerationID:backoffMode:", 0, 0);
}

- (void)markBounceFailed
{
  -[BRCLocalStatInfo _clearTmpBouncedNumber](self->_st, "_clearTmpBouncedNumber");
  if (-[BRCLocalItem isFault](self, "isFault"))
    -[BRCLocalStatInfo _markClearedFromStage](self->_st, "_markClearedFromStage");
}

- (void)bounceReservedItemWithBounceNumber:(unint64_t)a3
{
  void *v5;
  NSObject *v6;

  if (!-[BRCLocalItem isReserved](self, "isReserved"))
  {
    brc_bread_crumbs();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      -[BRCLocalItem(LegacyAdditions) bounceReservedItemWithBounceNumber:].cold.1();

  }
  -[BRCLocalStatInfo _generatedBouncedLogicalFilenameWithBounceNumber:](self->_st, "_generatedBouncedLogicalFilenameWithBounceNumber:", a3);
  -[BRCLocalStatInfo _migrateTmpBouncedNameToLocalName](self->_st, "_migrateTmpBouncedNameToLocalName");
}

- (void)bouncePhysicalNameToRepresentableName
{
  -[BRCLocalStatInfo _bouncePhysicalNameToRepresentableName](self->_st, "_bouncePhysicalNameToRepresentableName");
}

- (void)bounceSourceItemWithServerLogicalName:(id)a3 bounceNumber:(unint64_t)a4
{
  id v6;
  void *v7;
  NSObject *v8;

  v6 = a3;
  if (!v6 || !a4)
  {
    brc_bread_crumbs();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      -[BRCLocalItem(LegacyAdditions) bounceSourceItemWithServerLogicalName:bounceNumber:].cold.1();

  }
  -[BRCStatInfo setLogicalName:](self->_st, "setLogicalName:", v6);
  -[BRCLocalStatInfo _generatedBouncedLogicalFilenameWithBounceNumber:](self->_st, "_generatedBouncedLogicalFilenameWithBounceNumber:", a4);
  -[BRCLocalStatInfo _migrateTmpBouncedNameToLocalName](self->_st, "_migrateTmpBouncedNameToLocalName");

}

- (void)clearFromStage
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;

  -[BRCLocalStatInfo stagedFileID](self->_st, "stagedFileID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    brc_bread_crumbs();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      -[BRCLocalItem(LegacyAdditions) clearFromStage].cold.1();

  }
  -[BRCAccountSession stageRegistry](self->_session, "stageRegistry");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCLocalStatInfo stagedFileID](self->_st, "stagedFileID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "moveFromStageToGraveyard:forItemID:", objc_msgSend(v5, "longLongValue"), self->_itemID);

  -[BRCLocalStatInfo _markClearedFromStage](self->_st, "_markClearedFromStage");
}

- (void)markMetadataLive
{
  -[BRCLocalStatInfo _markClearedFromStage](self->_st, "_markClearedFromStage");
}

- (void)markStagedWithFileID:(unint64_t)a3 generationID:(unsigned int)a4
{
  uint64_t v4;
  BRCLocalStatInfo *st;
  id v6;

  v4 = *(_QWORD *)&a4;
  st = self->_st;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[BRCLocalStatInfo _markStagedWithFileID:generationID:documentID:](st, "_markStagedWithFileID:generationID:documentID:", v6, v4, 0);

}

- (void)markStagedWithFileID:(unint64_t)a3 generationID:(unsigned int)a4 documentID:(unsigned int)a5
{
  uint64_t v5;
  uint64_t v6;
  BRCLocalStatInfo *st;
  void *v8;
  id v9;

  v5 = *(_QWORD *)&a5;
  v6 = *(_QWORD *)&a4;
  st = self->_st;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a3);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCLocalStatInfo _markStagedWithFileID:generationID:documentID:](st, "_markStagedWithFileID:generationID:documentID:", v9, v6, v8);

}

- (BOOL)learnStagedInfoFromDownloadStageID:(id)a3 error:(id *)a4
{
  BRCAccountSession *session;
  id v7;
  void *v8;
  uint64_t *v9;
  void *v10;
  int v11;
  uint64_t v13;
  uint64_t v14;

  v13 = 0;
  v14 = 0;
  session = self->_session;
  v7 = a3;
  -[BRCAccountSession stageRegistry](session, "stageRegistry");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[BRCLocalItem isReserved](self, "isReserved"))
    v9 = &v14;
  else
    v9 = 0;
  -[BRCLocalItem appLibrary](self, "appLibrary", v13);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v8, "rememberStagedDownloadWithID:gatherFileID:generationID:documentID:appLibrary:error:", v7, &v13, (char *)&v14 + 4, v9, v10, a4);

  if (v11)
  {
    if (-[BRCLocalItem isReserved](self, "isReserved"))
      -[BRCLocalItem markStagedWithFileID:generationID:documentID:](self, "markStagedWithFileID:generationID:documentID:", v13, HIDWORD(v14), v14);
    else
      -[BRCLocalItem markStagedWithFileID:generationID:](self, "markStagedWithFileID:generationID:", v13, HIDWORD(v14));
  }
  return v11;
}

- (unint64_t)diffAgainstServerAliasItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unint64_t v7;
  void *v9;
  NSObject *v10;

  v4 = a3;
  if (!-[BRCLocalItem isSharedToMeTopLevelItem](self, "isSharedToMeTopLevelItem"))
  {
    brc_bread_crumbs();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      -[BRCLocalItem(BRCSharedToMeTopLevel) diffAgainstServerAliasItem:].cold.1();

  }
  -[BRCLocalItem st](self, "st");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "st");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "diffAgainst:", v6);
  return v7;
}

- (id)sharedAliasItemID
{
  BRCItemID *itemID;
  void *v4;
  void *v5;
  void *v7;
  NSObject *v8;

  if (!-[BRCLocalItem isSharedToMeTopLevelItem](self, "isSharedToMeTopLevelItem"))
  {
    brc_bread_crumbs();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      -[BRCLocalItem(BRCSharedToMeTopLevel) diffAgainstServerAliasItem:].cold.1();

  }
  itemID = self->_itemID;
  -[BRCServerZone ownerName](self->_serverZone, "ownerName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCItemID derivedAliasItemIDWithOwnerName:](itemID, "derivedAliasItemIDWithOwnerName:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)structureRecordIDInZone:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v10;
  NSObject *v11;

  v4 = a3;
  if (!-[BRCLocalItem isSharedToMeTopLevelItem](self, "isSharedToMeTopLevelItem"))
  {
    brc_bread_crumbs();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      -[BRCLocalItem(BRCSharedToMeTopLevel) diffAgainstServerAliasItem:].cold.1();

  }
  -[BRCAccountSession serverAliasItemForSharedItem:inZone:](self->_session, "serverAliasItemForSharedItem:inZone:", self, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "itemID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "st");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "structureRecordIDForItemType:zone:aliasTargetZoneIsShared:", objc_msgSend(v7, "type"), v4, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)structureRecordBeingDeadInServerTruth:(BOOL)a3 shouldPCSChainStatus:(unsigned __int8)a4 inZone:(id)a5
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  unint64_t v11;
  unint64_t localDiffs;
  void *v13;
  void *v14;
  uint64_t v15;
  char v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  unint64_t v32;
  void *v33;
  void *v34;
  BRCItemID *itemID;
  BRCServerZone *serverZone;
  void *v37;
  char v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  _BOOL8 v47;
  void *v48;
  char v49;
  void *v50;
  void *v51;
  char v52;
  void *v53;
  void *v54;
  void *v55;
  int v56;
  void *v58;
  NSObject *v59;
  void *v60;
  NSObject *v61;
  void *v62;
  NSObject *v63;
  uint64_t v64;
  uint64_t v65;
  int v66;
  uint64_t v67;
  void *v69;
  void *v70;

  v6 = a5;
  if (!-[BRCLocalItem isSharedToMeTopLevelItem](self, "isSharedToMeTopLevelItem"))
  {
    brc_bread_crumbs();
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v59 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v59, OS_LOG_TYPE_FAULT))
      -[BRCLocalItem(BRCSharedToMeTopLevel) diffAgainstServerAliasItem:].cold.1();

  }
  if (!-[BRCServerZone isSharedZone](self->_serverZone, "isSharedZone"))
  {
    brc_bread_crumbs();
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v61 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v61, OS_LOG_TYPE_FAULT))
      -[BRCLocalItem(BRCSharedToMeTopLevel) structureRecordBeingDeadInServerTruth:shouldPCSChainStatus:inZone:].cold.3();

  }
  if ((objc_msgSend(v6, "isPrivateZone") & 1) == 0)
  {
    brc_bread_crumbs();
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v63 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v63, OS_LOG_TYPE_FAULT))
      -[BRCLocalItem(BRCSharedToMeTopLevel) structureRecordBeingDeadInServerTruth:shouldPCSChainStatus:inZone:].cold.2();

  }
  -[BRCAccountSession serverAliasItemForSharedItem:inZone:](self->_session, "serverAliasItemForSharedItem:inZone:", self, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "itemID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    v10 = v8;
  }
  else
  {
    -[BRCLocalItem sharedAliasItemID](self, "sharedAliasItemID");
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  v70 = v10;

  v11 = -[BRCLocalItem diffAgainstOriginalItem](self, "diffAgainstOriginalItem");
  localDiffs = self->_localDiffs;
  v69 = v7;
  if (v7)
  {
    -[BRCStatInfo ckInfo](self->_st, "ckInfo");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      v66 = 1;
      goto LABEL_17;
    }
  }
  -[BRCServerZone zoneName](self->_serverZone, "zoneName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = *MEMORY[0x1E0D10DB0];
  v16 = objc_msgSend(v14, "isEqualToString:", *MEMORY[0x1E0D10DB0]);

  if ((v16 & 1) != 0)
  {
    v66 = 0;
    goto LABEL_17;
  }
  v17 = objc_alloc(MEMORY[0x1E0D10E88]);
  -[BRCServerZone ownerName](self->_serverZone, "ownerName");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v17, "initWithZoneName:ownerName:", v15, v18);

  v20 = (void *)MEMORY[0x1E0CB3940];
  -[BRCItemID itemIDString](self->_itemID, "itemIDString");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "unsaltedBookmarkDataWithItemResolutionString:serverZoneMangledID:", v21, v19);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "clientZone");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "asPrivateClientZone");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "serverAliasByUnsaltedBookmarkData:", v22);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v25)
  {

    v66 = 0;
    v7 = v69;
LABEL_17:
    v32 = localDiffs | v11;
    objc_msgSend(v70, "structureRecordIDForItemType:zone:aliasTargetZoneIsShared:", 3, v6, 1);
    v67 = objc_claimAutoreleasedReturnValue();
    v29 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C95048]), "initWithRecordType:recordID:", CFSTR("structure"), v67);
    -[BRCStatInfo ckInfo](self->_st, "ckInfo");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCStatInfo parentID](self->_st, "parentID");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    itemID = self->_itemID;
    serverZone = self->_serverZone;
    BYTE2(v65) = a4;
    BYTE1(v65) = v7 == 0;
    LOBYTE(v65) = -[BRCLocalItem isDirectory](self, "isDirectory");
    +[BRCAliasItem fillStructureRecord:inZone:itemID:ckInfo:parentID:targetItemID:targetZone:diffs:isFolderShare:beingDeadInServerTruth:shouldPCSChainStatus:](BRCAliasItem, "fillStructureRecord:inZone:itemID:ckInfo:parentID:targetItemID:targetZone:diffs:isFolderShare:beingDeadInServerTruth:shouldPCSChainStatus:", v29, v6, v70, v33, v34, itemID, serverZone, v32, v65);

    if (!v66 || (v32 & 0x800) != 0)
    {
      -[BRCLocalItem st](self, "st");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "setLastUsedTime:", objc_msgSend(v37, "lastUsedTime"));

    }
    if ((v32 & 0x1000) != 0)
      v38 = 0;
    else
      v38 = v66;
    v28 = v69;
    if ((v38 & 1) == 0)
    {
      -[BRCLocalItem st](self, "st");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v39, "favoriteRank"))
      {
        v40 = (void *)MEMORY[0x1E0CB37E8];
        -[BRCLocalItem st](self, "st");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "numberWithLongLong:", objc_msgSend(v41, "favoriteRank"));
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "setObject:forKeyedSubscript:", v42, CFSTR("favoriteRank"));

      }
      else
      {
        objc_msgSend(v29, "setObject:forKeyedSubscript:", 0, CFSTR("favoriteRank"));
      }

    }
    if ((v32 & 0x40) != 0)
    {
      -[BRCLocalItem appLibrary](self, "appLibrary");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v43, "isCloudDocsAppLibrary"))
      {
        -[BRCLocalItem clientZone](self, "clientZone");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v44, "isCloudDocsZone"))
        {
          -[BRCLocalItem parentItemIDInZone](self, "parentItemIDInZone");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          v46 = objc_msgSend(v45, "isNonDesktopRoot");

          v28 = v69;
        }
        else
        {
          v46 = 0;
        }

      }
      else
      {
        v46 = 0;
      }
      v47 = v28 == 0;

      -[BRCLocalItem parentItemIDInZone](self, "parentItemIDInZone");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = objc_msgSend(v48, "isDocumentsFolder");

      -[BRCLocalItem st](self, "st");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "logicalName");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v64) = v49;
      v28 = v69;
      objc_msgSend(v29, "serializeFilename:forCreation:setExtension:inSharedAlias:basehashSaltIfNotShareAlias:parentIDIsCloudDocsRoot:parentIDIsDocumentsFolder:", v51, v47, 1, 1, 0, v46, v64);

    }
    if ((v32 & 0x200) != 0)
      v52 = 0;
    else
      v52 = v66;
    if ((v52 & 1) == 0)
    {
      -[BRCLocalItem st](self, "st");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "finderTags");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "serializeFinderTags:forCreation:", v54, v28 == 0);

    }
    -[BRCLocalItem serializeStructuralPluginHints:](self, "serializeStructuralPluginHints:", v29);
    -[BRCLocalItem session](self, "session");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = objc_msgSend(v29, "validateEnhancedDrivePrivacyFieldsWithSession:error:", v55, 0);

    if (v56)
    {
      v29 = v29;
      v31 = v29;
    }
    else
    {
      v31 = 0;
    }
    v30 = (void *)v67;
    goto LABEL_45;
  }
  brc_bread_crumbs();
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v27 = objc_claimAutoreleasedReturnValue();
  v28 = v69;
  if (os_log_type_enabled(v27, (os_log_type_t)0x90u))
    -[BRCLocalItem(BRCSharedToMeTopLevel) structureRecordBeingDeadInServerTruth:shouldPCSChainStatus:inZone:].cold.1();

  v29 = 0;
  v30 = 0;
  v31 = 0;
LABEL_45:

  return v31;
}

- (void)insertTombstoneAliasRecordInZone:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  _QWORD v17[4];
  NSObject *v18;
  id v19;
  BRCLocalItem *v20;

  v4 = a3;
  -[BRCAccountSession serverAliasItemForSharedItem:inZone:](self->_session, "serverAliasItemForSharedItem:inZone:", self, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "serverZone");
    v7 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "clientZone");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "itemID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "itemByItemID:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "asBRAlias");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v11, "isDead"))
    {
      brc_bread_crumbs();
      v12 = objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        -[BRCLocalItem(BRCSharedToMeTopLevel) insertTombstoneAliasRecordInZone:].cold.2();

    }
    else
    {
      if (v11)
      {
        brc_bread_crumbs();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
          -[BRCLocalItem(BRCSharedToMeTopLevel) insertTombstoneAliasRecordInZone:].cold.4();
      }
      else
      {
        brc_bread_crumbs();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
          -[BRCLocalItem(BRCSharedToMeTopLevel) insertTombstoneAliasRecordInZone:].cold.3();
      }

      -[BRCLocalItem db](self, "db");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __72__BRCLocalItem_BRCSharedToMeTopLevel__insertTombstoneAliasRecordInZone___block_invoke;
      v17[3] = &unk_1E875E088;
      v18 = v6;
      v7 = v7;
      v19 = v7;
      v20 = self;
      objc_msgSend(v16, "groupInBatch:", v17);

      v12 = v18;
    }
  }
  else
  {
    brc_bread_crumbs();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      -[BRCLocalItem(BRCSharedToMeTopLevel) insertTombstoneAliasRecordInZone:].cold.1();
    v7 = v4;
  }

}

void __72__BRCLocalItem_BRCSharedToMeTopLevel__insertTombstoneAliasRecordInZone___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v2 = (void *)objc_msgSend(*(id *)(a1 + 32), "newLocalItemWithServerZone:dbRowID:", *(_QWORD *)(a1 + 40), 0);
  objc_msgSend(v2, "asBRAlias");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 72), "ckInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "st");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCkInfo:", v3);

  objc_msgSend(v6, "st");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setItemScope:", 2);

  objc_msgSend(v6, "saveToDB");
  objc_msgSend(v6, "markDead");
  objc_msgSend(v6, "markNeedsUploadOrSyncingUpWithAliasTarget:", *(_QWORD *)(a1 + 48));
  objc_msgSend(v6, "saveToDB");

}

- (void)updateParentZoneRowID:(id)a3
{
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  int v19;
  BRCLocalItem *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((-[BRCPQLConnection isBatchSuspended](self->_db, "isBatchSuspended") & 1) != 0)
  {
    if (v5)
      goto LABEL_3;
LABEL_15:
    brc_bread_crumbs();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      -[BRCLocalItem(BRCSharedToMeTopLevel) updateParentZoneRowID:].cold.1();
    goto LABEL_17;
  }
  brc_bread_crumbs();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
    -[BRCLocalItem(BRCSharedToMeTopLevel) updateParentZoneRowID:].cold.4();

  if (!v5)
    goto LABEL_15;
LABEL_3:
  if ((-[BRCZoneRowID br_isEqualToNumber:](self->_parentZoneRowID, "br_isEqualToNumber:", v5) & 1) == 0)
  {
    brc_bread_crumbs();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v19 = 138412546;
      v20 = self;
      v21 = 2112;
      v22 = v6;
      _os_log_impl(&dword_1CBD43000, v7, OS_LOG_TYPE_DEFAULT, "[WARNING] Parent zone updated on %@, clearing ckinfo and inserting dead item%@", (uint8_t *)&v19, 0x16u);
    }

    -[BRCAccountSession serverZoneByRowID:](self->_session, "serverZoneByRowID:", self->_parentZoneRowID);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCLocalItem insertTombstoneAliasRecordInZone:](self, "insertTombstoneAliasRecordInZone:", v8);
    -[BRCAccountSession serverZoneByRowID:](self->_session, "serverZoneByRowID:", v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "clientZone");
    v10 = objc_claimAutoreleasedReturnValue();

    -[BRCAccountSession localAliasForSharedItem:inZone:](self->_session, "localAliasForSharedItem:inZone:", self, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
    {
      if ((objc_msgSend(v11, "isDead") & 1) == 0)
      {
        brc_bread_crumbs();
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
          -[BRCLocalItem(BRCSharedToMeTopLevel) updateParentZoneRowID:].cold.3();

      }
      brc_bread_crumbs();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        -[BRCLocalItem(BRCSharedToMeTopLevel) updateParentZoneRowID:].cold.2();

      objc_msgSend(v12, "markNeedsDeleteForRescheduleOfItem:", 0);
      objc_msgSend(v12, "saveToDB");
    }
    objc_storeStrong((id *)&self->_parentZoneRowID, a3);
    -[BRCStatInfo setCkInfo:](self->_st, "setCkInfo:", 0);

LABEL_17:
  }

}

- (BOOL)requiresShareAlias
{
  void *v3;
  uint64_t v4;
  int v5;
  BRCAccountSession *session;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  if (-[BRCStatInfo favoriteRank](self->_st, "favoriteRank")
    || -[BRCStatInfo lastUsedTime](self->_st, "lastUsedTime")
    || (-[BRCStatInfo finderTags](self->_st, "finderTags"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v4 = objc_msgSend(v3, "length"),
        v3,
        v4))
  {
    LOBYTE(v5) = 1;
  }
  else
  {
    session = self->_session;
    -[BRCLocalItem clientZone](self, "clientZone");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "asSharedClientZone");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCLocalItem st](self, "st");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "logicalName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "br_pathExtension");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "lowercaseString");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCAccountSession fallbackAppLibraryForClientZone:extension:](session, "fallbackAppLibraryForClientZone:extension:", v9, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    -[BRCStatInfo parentID](self->_st, "parentID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "documentsFolderItemID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v15, "isEqualToItemID:", v16) ^ 1;

  }
  return v5;
}

- (BRCAliasItem)asBRAlias
{
  void *v2;
  NSObject *v3;

  brc_bread_crumbs();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    -[BRCLocalItem asBRAlias].cold.1();

  return 0;
}

- (BRCDirectoryItem)asDirectory
{
  void *v2;
  NSObject *v3;

  brc_bread_crumbs();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    -[BRCLocalItem asDirectory].cold.1();

  return 0;
}

- (BRCDocumentItem)asDocument
{
  void *v2;
  NSObject *v3;

  brc_bread_crumbs();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    -[BRCLocalItem asDocument].cold.1();

  return 0;
}

- (BOOL)isShareableItem
{
  return 0;
}

- (BRCTopLevelShareable)asShareableItem
{
  void *v2;
  NSObject *v3;

  brc_bread_crumbs();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    -[BRCLocalItem asShareableItem].cold.1();

  return 0;
}

- (BRCFSRooted)asFSRoot
{
  BRCLocalItem *v3;
  void *v4;
  NSObject *v5;

  if (-[BRCLocalItem isDirectory](self, "isDirectory") && -[BRCLocalItem isFSRoot](self, "isFSRoot"))
  {
    v3 = self;
  }
  else
  {
    brc_bread_crumbs();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      -[BRCLocalItem asFSRoot].cold.1();

    v3 = 0;
  }
  return (BRCFSRooted *)v3;
}

- (BRCSymlinkItem)asSymlink
{
  void *v2;
  NSObject *v3;

  brc_bread_crumbs();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    -[BRCLocalItem asSymlink].cold.1();

  return 0;
}

- (BRCFinderBookmarkItem)asFinderBookmark
{
  void *v2;
  NSObject *v3;

  brc_bread_crumbs();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    -[BRCLocalItem asFinderBookmark].cold.1();

  return 0;
}

- (BRCShareAcceptationFault)asShareAcceptationFault
{
  void *v2;
  NSObject *v3;

  brc_bread_crumbs();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    -[BRCLocalItem asShareAcceptationFault].cold.1();

  return 0;
}

- (NSString)path
{
  NSString *v3;
  BRCItemToPathLookup *v4;
  void *v5;
  NSString *v6;
  NSString *path;
  uint64_t v8;
  uint64_t v9;
  NSString *v10;
  NSString *v11;

  if (self->_resolvedPath)
  {
    v3 = self->_path;
  }
  else
  {
    v4 = -[BRCItemToPathLookup initWithItem:]([BRCItemToPathLookup alloc], "initWithItem:", self);
    -[BRCItemToPathLookup byFileSystemID](v4, "byFileSystemID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "pathRelativeToRoot");
    v6 = (NSString *)objc_claimAutoreleasedReturnValue();
    path = self->_path;
    self->_path = v6;

    v8 = -[NSString rangeOfString:](self->_path, "rangeOfString:", CFSTR("/"));
    if (v9)
    {
      -[NSString substringFromIndex:](self->_path, "substringFromIndex:", v8 + v9);
      v10 = (NSString *)objc_claimAutoreleasedReturnValue();
      v11 = self->_path;
      self->_path = v10;

    }
    -[BRCItemToPathLookup closePaths](v4, "closePaths");
    self->_resolvedPath = 1;
    v3 = self->_path;

  }
  return v3;
}

- (NSString)logicalName
{
  return (NSString *)-[BRCLocalStatInfo logicalName](self->_st, "logicalName");
}

- (NSString)extension
{
  void *v2;
  void *v3;

  -[BRCLocalItem logicalName](self, "logicalName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "br_pathExtension");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)appLibraryID
{
  void *v2;
  void *v3;

  -[BRCLocalItem appLibrary](self, "appLibrary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appLibraryID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (BOOL)needsInsert
{
  return self->_dbRowID == 0;
}

- (BOOL)isFromInitialScan
{
  if ((self->_localDiffs & 0x8000000000000000) != 0)
    return !-[BRCLocalItem isKnownByServerOrInFlight](self, "isKnownByServerOrInFlight");
  else
    return 0;
}

- (BOOL)checkIsInDocumentsScopeWithParent:(id)a3
{
  id v4;
  NSNumber *isInDocumentScope;
  char v6;
  void *v7;
  char v8;
  NSNumber *v9;
  NSNumber *v10;
  void *v12;
  char v13;
  NSNumber *v14;
  NSNumber *v15;
  NSNumber *v16;
  void *v17;
  char v18;
  BRCItemGlobalID *v19;
  void *v20;
  void *v21;
  void *v22;
  BRCItemGlobalID *v23;
  _BOOL4 v24;
  NSNumber *v25;
  void *v26;
  BRCAccountSession *session;
  void *v28;

  v4 = a3;
  isInDocumentScope = self->_isInDocumentScope;
  if (!isInDocumentScope)
  {
    -[BRCLocalItem appLibrary](self, "appLibrary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "includesDataScope"))
    {
      v8 = objc_msgSend(v4, "isFSRoot");
      v9 = (NSNumber *)MEMORY[0x1E0C9AAA0];
      if ((v8 & 1) != 0)
      {
        v6 = 0;
      }
      else
      {
        -[BRCStatInfo parentID](self->_st, "parentID");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "isDocumentsFolder");

        v14 = (NSNumber *)MEMORY[0x1E0C9AAB0];
        if ((v13 & 1) == 0)
        {
          if (v4)
          {
            if (objc_msgSend(v4, "checkIsInDocumentsScopeWithParent:", 0))
              v15 = v14;
            else
              v15 = v9;
            v16 = v15;
          }
          else
          {
            -[BRCLocalItem clientZone](self, "clientZone");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = objc_msgSend(v17, "isSharedZone");

            v16 = (NSNumber *)MEMORY[0x1E0C9AAB0];
            if ((v18 & 1) == 0)
            {
              session = self->_session;
              -[BRCLocalItem itemGlobalID](self, "itemGlobalID");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              v19 = [BRCItemGlobalID alloc];
              objc_msgSend(v7, "defaultClientZone");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v28, "dbRowID");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v7, "dbRowID");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              +[BRCItemID documentsItemIDWithAppLibraryRowID:](BRCItemID, "documentsItemIDWithAppLibraryRowID:", v21);
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              v23 = -[BRCItemGlobalID initWithZoneRowID:itemID:](v19, "initWithZoneRowID:itemID:", v20, v22);
              v24 = -[BRCAccountSession globalID:isStrictChildOfGlobalID:](session, "globalID:isStrictChildOfGlobalID:", v26, v23);

              if (!v24)
                v16 = v9;
            }
          }
          v25 = self->_isInDocumentScope;
          self->_isInDocumentScope = v16;

          isInDocumentScope = self->_isInDocumentScope;
          goto LABEL_2;
        }
        v6 = 1;
        v9 = (NSNumber *)MEMORY[0x1E0C9AAB0];
      }
    }
    else
    {
      v6 = 1;
      v9 = (NSNumber *)MEMORY[0x1E0C9AAB0];
    }
    v10 = self->_isInDocumentScope;
    self->_isInDocumentScope = v9;

    goto LABEL_8;
  }
LABEL_2:
  v6 = -[NSNumber BOOLValue](isInDocumentScope, "BOOLValue");
LABEL_8:

  return v6;
}

- (BOOL)isInDocumentScope
{
  return -[BRCLocalStatInfo itemScope](self->_st, "itemScope") == 2;
}

- (BOOL)isInDocumentOrTrashScope
{
  return -[BRCLocalItem isInDocumentScope](self, "isInDocumentScope")
      || -[BRCLocalItem isInTrashScope](self, "isInTrashScope");
}

- (BOOL)isInDataScope
{
  return -[BRCLocalStatInfo itemScope](self->_st, "itemScope") == 1;
}

- (BOOL)isInTrashScope
{
  return -[BRCLocalStatInfo itemScope](self->_st, "itemScope") == 3;
}

- (unsigned)itemScope
{
  return -[BRCLocalStatInfo itemScope](self->_st, "itemScope");
}

- (NSNumber)parentFileID
{
  NSNumber *parentFileID;
  void *v4;
  NSNumber *v5;
  NSNumber *v6;

  parentFileID = self->_parentFileID;
  if (!parentFileID)
  {
    -[BRCLocalItem parentItemOnFS](self, "parentItemOnFS");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "fileID");
    v5 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    v6 = self->_parentFileID;
    self->_parentFileID = v5;

    parentFileID = self->_parentFileID;
  }
  return parentFileID;
}

- (BRFileObjectID)fileObjectID
{
  void *v2;
  unsigned int v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  id v9;
  void *v10;

  -[BRCLocalItem st](self, "st");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "type");
  if (v3 > 0xA)
  {
    brc_bread_crumbs();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      -[BRCLocalItem fileObjectID].cold.1();

    goto LABEL_7;
  }
  if (((1 << v3) & 0x639) == 0)
  {
LABEL_7:
    v9 = objc_alloc(MEMORY[0x1E0D10E68]);
    objc_msgSend(v2, "documentID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v9, "initWithDocID:", objc_msgSend(v5, "unsignedIntValue"));
    goto LABEL_8;
  }
  v4 = objc_alloc(MEMORY[0x1E0D10E80]);
  objc_msgSend(v2, "fileID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "initWithFileID:", objc_msgSend(v5, "unsignedLongLongValue"));
LABEL_8:
  v10 = (void *)v6;

  return (BRFileObjectID *)v10;
}

- (BRFileObjectID)parentFileObjectID
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc(MEMORY[0x1E0D10E80]);
  -[BRCLocalItem parentFileID](self, "parentFileID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithFileID:", objc_msgSend(v4, "unsignedLongLongValue"));

  return (BRFileObjectID *)v5;
}

- (NSNumber)fileID
{
  return -[BRCLocalStatInfo fileID](self->_st, "fileID");
}

- (void)_refreshAppLibraryFromParent
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_1(&dword_1CBD43000, v0, v1, "[CRIT] UNREACHABLE: hierarchy too deep to compute the app library root of %@%@");
  OUTLINED_FUNCTION_2();
}

- (BRCAppLibrary)appLibrary
{
  BRCAppLibrary *appLibrary;

  appLibrary = self->_appLibrary;
  if (!appLibrary)
  {
    -[BRCLocalItem _refreshAppLibraryFromParent](self, "_refreshAppLibraryFromParent");
    appLibrary = self->_appLibrary;
  }
  return appLibrary;
}

- (BRCClientZone)parentClientZone
{
  void *v2;
  void *v3;

  -[BRCAccountSession serverZoneByRowID:](self->_session, "serverZoneByRowID:", self->_parentZoneRowID);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "clientZone");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (BRCClientZone *)v3;
}

- (BOOL)isKnownByServer
{
  NSNumber *knownByServer;
  BRCItemID *itemID;
  BRCPQLConnection *db;
  void *v7;
  NSNumber *v8;
  NSNumber *v9;

  if (-[BRCLocalItem hasValidCKInfo](self, "hasValidCKInfo"))
    return 1;
  knownByServer = self->_knownByServer;
  if (!knownByServer)
  {
    itemID = self->_itemID;
    db = self->_db;
    -[BRCClientZone dbRowID](self->_clientZone, "dbRowID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[PQLConnection numberWithSQL:](db, "numberWithSQL:", CFSTR("SELECT 1 FROM server_items WHERE item_id = %@ AND zone_rowid = %@ LIMIT 1"), itemID, v7);
    v9 = self->_knownByServer;
    self->_knownByServer = v8;

    knownByServer = self->_knownByServer;
    if (!knownByServer)
    {
      self->_knownByServer = (NSNumber *)MEMORY[0x1E0C9AAA0];

      knownByServer = self->_knownByServer;
    }
  }
  return -[NSNumber BOOLValue](knownByServer, "BOOLValue");
}

- (BOOL)isKnownByServerOrInFlight
{
  void *v3;
  char v4;

  -[BRCAccountSession syncUpScheduler](self->_session, "syncUpScheduler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isItemInSyncUpAndInFlight:", self);

  return (v4 & 1) != 0 || -[BRCLocalItem isKnownByServer](self, "isKnownByServer");
}

- (BOOL)isDeadOrMissingInServerTruth
{
  BRCItemID *itemID;
  BRCPQLConnection *db;
  void *v4;
  id v5;

  itemID = self->_itemID;
  db = self->_db;
  -[BRCClientZone dbRowID](self->_clientZone, "dbRowID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[PQLConnection numberWithSQL:](db, "numberWithSQL:", CFSTR("SELECT 1 FROM server_items WHERE item_id = %@ AND item_state = 0 AND zone_rowid = %@ LIMIT 1"), itemID, v4);
  LOBYTE(itemID) = objc_msgSend(v5, "BOOLValue") ^ 1;

  return (char)itemID;
}

- (BRCItemID)serverPathMatchItemID
{
  id serverPathMatchID;
  BRCPQLConnection *db;
  BRCItemID *itemID;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;

  serverPathMatchID = self->_serverPathMatchID;
  if (!serverPathMatchID)
  {
    db = self->_db;
    itemID = self->_itemID;
    -[BRCStatInfo parentID](self->_st, "parentID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCLocalStatInfo logicalName](self->_st, "logicalName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCClientZone dbRowID](self->_clientZone, "dbRowID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[PQLConnection itemIDWithSQL:](db, "itemIDWithSQL:", CFSTR("SELECT item_id FROM server_items WHERE item_id != %@ AND item_parent_id = %@ AND item_filename = %@ AND +zone_rowid = %@"), itemID, v6, v7, v8);
    v10 = self->_serverPathMatchID;
    self->_serverPathMatchID = v9;

    serverPathMatchID = self->_serverPathMatchID;
    if (!serverPathMatchID)
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = self->_serverPathMatchID;
      self->_serverPathMatchID = v11;

      serverPathMatchID = self->_serverPathMatchID;
    }
  }
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v13 = (id)objc_claimAutoreleasedReturnValue();

  if (serverPathMatchID == v13)
    v14 = 0;
  else
    v14 = self->_serverPathMatchID;
  return (BRCItemID *)v14;
}

- (BOOL)isNewToServer:(BOOL *)a3
{
  void *v5;
  void *v6;
  void *v7;
  BOOL result;

  -[BRCLocalItem st](self, "st");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "ckInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "etag");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    result = -[BRCLocalItem isDeadOrMissingInServerTruth](self, "isDeadOrMissingInServerTruth");
    if (!a3)
      return result;
  }
  else
  {
    result = 1;
    if (!a3)
      return result;
  }
  *a3 = v7 == 0;
  return result;
}

- (BOOL)isLive
{
  return -[BRCStatInfo state](self->_st, "state") == 0;
}

- (BOOL)isDead
{
  return -[BRCStatInfo state](self->_st, "state") == 1;
}

- (BOOL)isAlmostDead
{
  int v3;

  v3 = -[BRCStatInfo state](self->_st, "state");
  if (v3 != 1)
    LOBYTE(v3) = -[BRCStatInfo state](self->_st, "state") == -3;
  return v3;
}

- (BOOL)isLost
{
  return -[BRCStatInfo state](self->_st, "state") == -1 || -[BRCStatInfo state](self->_st, "state") == -3;
}

- (BOOL)isOnDisk
{
  return !-[BRCStatInfo state](self->_st, "state") || -[BRCStatInfo state](self->_st, "state") == -1;
}

- (BOOL)isBRAlias
{
  return 0;
}

- (BOOL)isDirectory
{
  return 0;
}

- (BOOL)isDirectoryFault
{
  return 0;
}

- (BOOL)isDirectoryWithPackageName
{
  return 0;
}

- (BOOL)isPackage
{
  return 0;
}

- (BOOL)isDocument
{
  return 0;
}

- (BOOL)isZoneRoot
{
  return 0;
}

- (BOOL)isFSRoot
{
  return -[BRCStatInfo type](self->_st, "type") == 4;
}

- (BOOL)isSymLink
{
  return 0;
}

- (BOOL)isFinderBookmark
{
  return 0;
}

- (BOOL)isShareAcceptationFault
{
  return 0;
}

- (BOOL)isSharedToMe
{
  return -[BRCLocalItem isSharedToMeTopLevelItem](self, "isSharedToMeTopLevelItem")
      || -[BRCLocalItem isSharedToMeChildItem](self, "isSharedToMeChildItem");
}

- (BOOL)isSharedToMeTopLevelItem
{
  _BOOL4 v3;

  v3 = -[BRCClientZone isSharedZone](self->_clientZone, "isSharedZone");
  if (v3)
    return (LOBYTE(self->_sharingOptions) >> 2) & 1;
  return v3;
}

- (BOOL)isSharedToMeChildItem
{
  _BOOL4 v3;

  v3 = -[BRCClientZone isSharedZone](self->_clientZone, "isSharedZone");
  if (v3)
    LOBYTE(v3) = (self->_sharingOptions & 4) == 0;
  return v3;
}

- (BRCSharedToMeTopLevel)asSharedToMeTopLevelItem
{
  BRCLocalItem *v3;
  void *v4;
  NSObject *v5;

  if (-[BRCLocalItem isSharedToMeTopLevelItem](self, "isSharedToMeTopLevelItem"))
  {
    v3 = self;
  }
  else
  {
    brc_bread_crumbs();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      -[BRCLocalItem asSharedToMeTopLevelItem].cold.1();

    v3 = 0;
  }
  return (BRCSharedToMeTopLevel *)v3;
}

- (BOOL)isOwnedByMe
{
  return !-[BRCClientZone isSharedZone](self->_clientZone, "isSharedZone");
}

- (BOOL)isSharedByMe
{
  _BOOL4 v3;

  v3 = -[BRCLocalItem isOwnedByMe](self, "isOwnedByMe");
  if (v3)
    LOBYTE(v3) = -[BRCLocalItem isShared](self, "isShared");
  return v3;
}

- (BOOL)isShared
{
  return (self->_sharingOptions & 0x48) != 0;
}

- (BOOL)isTopLevelSharedItem
{
  return (self->_sharingOptions & 4) != 0 && -[BRCLocalItem isShared](self, "isShared");
}

- (BOOL)isChildSharedItem
{
  return (self->_sharingOptions & 4) == 0 && -[BRCLocalItem isShared](self, "isShared");
}

- (BOOL)hasShareIDAndIsOwnedByMe
{
  return 0;
}

- (NSString)collaborationIdentifierIfComputable
{
  return 0;
}

- (BOOL)isDocumentBeingCopiedToNewZone
{
  return 0;
}

- (BOOL)isCrossZoneMoveTombstone
{
  return 0;
}

- (BOOL)shouldUseEnhancedDrivePrivacyWhenNeedsPreserving:(BOOL)a3
{
  void *v3;
  char v4;

  if (!a3)
    return -[BRCClientZone enhancedDrivePrivacyEnabled](self->_clientZone, "enhancedDrivePrivacyEnabled");
  +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "supportsEnhancedDrivePrivacy");

  return v4;
}

- (void)inheritOSUpgradeNeededFromItem:(id)a3
{
  id *v4;
  NSNumber **p_minimumSupportedOSRowID;
  void *v6;
  NSObject *v7;
  void *v8;
  id v9;
  void *v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  int v14;
  void *v15;
  __int16 v16;
  id v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = (id *)a3;
  if (!v4[13])
  {
    brc_bread_crumbs();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      -[BRCLocalItem inheritOSUpgradeNeededFromItem:].cold.2();

  }
  p_minimumSupportedOSRowID = &self->_minimumSupportedOSRowID;
  if (self->_minimumSupportedOSRowID)
  {
    brc_bread_crumbs();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      -[BRCLocalItem inheritOSUpgradeNeededFromItem:].cold.1();

  }
  brc_bread_crumbs();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    -[BRCLocalItem itemID](self, "itemID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v4[13];
    v14 = 138412802;
    v15 = v8;
    v16 = 2112;
    v17 = v9;
    v18 = 2112;
    v19 = v6;
    _os_log_debug_impl(&dword_1CBD43000, v7, OS_LOG_TYPE_DEBUG, "[DEBUG] %@: inheriting %@ minimum supported OS%@", (uint8_t *)&v14, 0x20u);

  }
  objc_storeStrong((id *)p_minimumSupportedOSRowID, v4[13]);

}

- (BOOL)needsOSUpgradeToSyncUp
{
  return self->_minimumSupportedOSRowID != 0;
}

- (id)osNameNeededToSyncUp
{
  id v2;

  if (self->_minimumSupportedOSRowID)
    v2 = -[BRCPQLConnection fetchObjectOfClass:sql:](self->_db, "fetchObjectOfClass:sql:", objc_opt_class(), CFSTR("SELECT name FROM os_names WHERE rowid = %@"), self->_minimumSupportedOSRowID);
  else
    v2 = 0;
  return v2;
}

- (void)markNeedsOSUpgradeToSyncUpWithName:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  NSNumber *v9;
  NSNumber *minimumSupportedOSRowID;
  uint8_t buf[4];
  BRCLocalItem *v12;
  __int16 v13;
  id v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  brc_bread_crumbs();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    v12 = self;
    v13 = 2112;
    v14 = v4;
    v15 = 2112;
    v16 = v5;
    _os_log_debug_impl(&dword_1CBD43000, v6, OS_LOG_TYPE_DEBUG, "[DEBUG] %@ needs %@ to sync-up%@", buf, 0x20u);
  }

  if (!-[BRCPQLConnection execute:](self->_db, "execute:", CFSTR("INSERT OR IGNORE INTO os_names (name) VALUES (%@)"), v4))
  {
    brc_bread_crumbs();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      -[BRCLocalItem markNeedsOSUpgradeToSyncUpWithName:].cold.1();

  }
  v9 = -[PQLConnection numberWithSQL:](self->_db, "numberWithSQL:", CFSTR("SELECT rowid FROM os_names WHERE name = %@"), v4);
  minimumSupportedOSRowID = self->_minimumSupportedOSRowID;
  self->_minimumSupportedOSRowID = v9;

}

- (id)descriptionWithContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  BRCZoneRowID *parentZoneRowID;
  void *v14;
  BRFieldCKInfo *sideCarCKInfo;
  void *v16;
  void *v17;
  void *v18;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithCapacity:", 128);
  objc_msgSend(v5, "appendFormat:", CFSTR("r:%lld "), self->_dbRowID);
  if (v4)
  {
    +[BRCDumpContext stringFromItemID:context:](BRCDumpContext, "stringFromItemID:context:", self->_itemID, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR("i:%@ "), v6);
  }
  else
  {
    -[BRCClientZone mangledID](self->_clientZone, "mangledID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCItemID debugItemIDString](self->_itemID, "debugItemIDString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR("i:%@:%@ "), v6, v7);

  }
  -[BRCAppLibrary dbRowID](self->_appLibrary, "dbRowID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("al:%@ "), v8);

  if (-[BRCUserRowID BOOLValue](self->_ownerKey, "BOOLValue"))
    objc_msgSend(v5, "appendFormat:", CFSTR("o:%@ "), self->_ownerKey);
  if (self->_localDiffs)
  {
    BRCItemFieldsPrettyPrint();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR("ld{%@} "), v9);

  }
  BRCPrettyPrintEnumWithContext(self->_syncUpState, (uint64_t)&brc_sync_up_state_pretty_entries, v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("up:%@"), v10);

  if (self->_minimumSupportedOSRowID)
  {
    +[BRCDumpContext highlightedString:type:context:](BRCDumpContext, "highlightedString:type:context:", CFSTR("needs-os-upgrade"), 3, v4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR(" %@:%@"), v11, self->_minimumSupportedOSRowID);

  }
  objc_msgSend(v5, "appendFormat:", CFSTR(" uv:%d"), self->_isUserVisible);
  if (-[BRCLocalItem isDirectory](self, "isDirectory"))
  {
    -[BRCLocalItem asDirectory](self, "asDirectory");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR(" mt:%lld"), objc_msgSend(v12, "mtime"));

  }
  parentZoneRowID = self->_parentZoneRowID;
  -[BRCClientZone dbRowID](self->_clientZone, "dbRowID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(parentZoneRowID) = -[BRCZoneRowID br_isEqualToNumber:](parentZoneRowID, "br_isEqualToNumber:", v14);

  if ((parentZoneRowID & 1) == 0)
    objc_msgSend(v5, "appendFormat:", CFSTR(" pzone:%@"), self->_parentZoneRowID);
  sideCarCKInfo = self->_sideCarCKInfo;
  if (sideCarCKInfo)
  {
    -[BRFieldCKInfo etag](sideCarCKInfo, "etag");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR(" ppm:%@"), v16);

  }
  -[BRCLocalStatInfo descriptionWithContext:origName:](self->_st, "descriptionWithContext:origName:", v4, 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR(" st{%@"), v17);

  if (self->_parentFileID)
    objc_msgSend(v5, "appendFormat:", CFSTR(" pino:%@"), self->_parentFileID);
  objc_msgSend(v5, "appendString:", CFSTR("}"));
  if (self->_sharingOptions)
  {
    BRCPrettyPrintBitmap();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR(" sharing-options:{%@}"), v18);

  }
  return v5;
}

- (NSString)description
{
  return (NSString *)-[BRCLocalItem descriptionWithContext:](self, "descriptionWithContext:", 0);
}

- (NSString)debugDescription
{
  void *v3;
  uint64_t v4;
  BRCItemID *itemID;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  itemID = self->_itemID;
  -[BRCLocalStatInfo filename](self->_st, "filename");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p {ID : %@; name : %@}>"), v4, self, itemID, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (NSString)digestDescription
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[BRCLocalStatInfo filename](self->_st, "filename");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("\"%@\" id:%@"), v4, self->_itemID);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (id)_initWithServerItem:(id)a3 dbRowID:(unint64_t)a4
{
  id v6;
  BRCLocalItem *v7;
  BRCLocalItem *v8;
  uint64_t v9;
  BRCItemID *itemID;
  uint64_t v11;
  BRCUserRowID *ownerKey;
  void *v13;
  uint64_t v14;
  BRFieldCKInfo *sideCarCKInfo;
  uint64_t v16;
  BRCClientZone *clientZone;
  uint64_t v18;
  BRCPQLConnection *db;
  BRCLocalStatInfo *v20;
  void *v21;
  uint64_t v22;
  BRCLocalStatInfo *st;
  void *v24;
  void *v25;
  uint64_t v26;
  BRCZoneRowID *parentZoneRowID;
  uint64_t v28;
  BRCLocalItem *orig;
  objc_super v31;

  v6 = a3;
  v31.receiver = self;
  v31.super_class = (Class)BRCLocalItem;
  v7 = -[BRCLocalItem init](&v31, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_dbRowID = a4;
    objc_msgSend(v6, "itemID");
    v9 = objc_claimAutoreleasedReturnValue();
    itemID = v8->_itemID;
    v8->_itemID = (BRCItemID *)v9;

    objc_msgSend(v6, "ownerKey");
    v11 = objc_claimAutoreleasedReturnValue();
    ownerKey = v8->_ownerKey;
    v8->_ownerKey = (BRCUserRowID *)v11;

    objc_msgSend(v6, "sideCarInfo");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "ckInfo");
    v14 = objc_claimAutoreleasedReturnValue();
    sideCarCKInfo = v8->_sideCarCKInfo;
    v8->_sideCarCKInfo = (BRFieldCKInfo *)v14;

    v8->_sharingOptions = objc_msgSend(v6, "sharingOptions");
    v8->_serverZone = (BRCServerZone *)(id)objc_msgSend(v6, "serverZone");
    objc_msgSend(v6, "clientZone");
    v16 = objc_claimAutoreleasedReturnValue();
    clientZone = v8->_clientZone;
    v8->_clientZone = (BRCClientZone *)v16;

    -[BRCClientZone db](v8->_clientZone, "db");
    v18 = objc_claimAutoreleasedReturnValue();
    db = v8->_db;
    v8->_db = (BRCPQLConnection *)v18;

    v8->_session = (BRCAccountSession *)(id)objc_msgSend(v6, "session");
    v20 = [BRCLocalStatInfo alloc];
    objc_msgSend(v6, "st");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = -[BRCStatInfo initWithStatInfo:](v20, "initWithStatInfo:", v21);
    st = v8->_st;
    v8->_st = (BRCLocalStatInfo *)v22;

    objc_msgSend(v6, "parentItemIDOnFS");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCStatInfo setParentID:](v8->_st, "setParentID:", v24);

    objc_msgSend(v6, "parentZoneOnFS");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "dbRowID");
    v26 = objc_claimAutoreleasedReturnValue();
    parentZoneRowID = v8->_parentZoneRowID;
    v8->_parentZoneRowID = (BRCZoneRowID *)v26;

    v28 = -[BRCLocalItem copy](v8, "copy");
    orig = v8->_orig;
    v8->_orig = (BRCLocalItem *)v28;

  }
  return v8;
}

- (id)_initWithLocalItem:(id)a3
{
  id *v4;
  BRCLocalItem *v5;
  BRCLocalItem *v6;
  uint64_t v7;
  BRCLocalStatInfo *st;
  objc_super v10;

  v4 = (id *)a3;
  v10.receiver = self;
  v10.super_class = (Class)BRCLocalItem;
  v5 = -[BRCLocalItem init](&v10, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeStrong((id *)&v5->_clientZone, v4[3]);
    objc_storeStrong((id *)&v6->_db, v4[4]);
    objc_storeStrong((id *)&v6->_sideCarCKInfo, v4[20]);
    objc_storeStrong((id *)&v6->_appLibrary, v4[5]);
    v6->_serverZone = (BRCServerZone *)v4[2];
    v6->_session = (BRCAccountSession *)v4[1];
    v6->_dbRowID = (unint64_t)v4[15];
    objc_storeStrong((id *)&v6->_itemID, v4[6]);
    objc_storeStrong((id *)&v6->_parentFileID, v4[19]);
    v7 = objc_msgSend(v4[9], "copy");
    st = v6->_st;
    v6->_st = (BRCLocalStatInfo *)v7;

    objc_storeStrong((id *)&v6->_parentZoneRowID, v4[7]);
    v6->_syncUpState = *((_DWORD *)v4 + 20);
    objc_storeStrong((id *)&v6->_ownerKey, v4[8]);
    v6->_sharingOptions = (unint64_t)v4[17];
    objc_storeStrong((id *)&v6->_orig, v4[11]);
    v6->_localDiffs = (unint64_t)v4[12];
    objc_storeStrong((id *)&v6->_parentZoneRowID, v4[7]);
    objc_storeStrong((id *)&v6->_minimumSupportedOSRowID, v4[13]);
    v6->_isUserVisible = *((_BYTE *)v4 + 112);
  }

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "_initWithLocalItem:", self);
}

- (id)initFromPQLResultSet:(id)a3 error:(id *)a4
{
  void *v5;
  NSObject *v6;

  brc_bread_crumbs();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    -[BRCLocalItem initFromPQLResultSet:error:].cold.1();

  return 0;
}

- (id)_initFromPQLResultSet:(id)a3 session:(id)a4 db:(id)a5 error:(id *)a6
{
  id v9;
  BRCAccountSession *v10;
  id v11;
  BRCLocalItem *v12;
  BRCLocalItem *v13;
  void *v14;
  uint64_t v15;
  BRCClientZone *clientZone;
  uint64_t v17;
  BRCItemID *itemID;
  uint64_t v19;
  BRCUserRowID *ownerKey;
  uint64_t v21;
  BRFieldCKInfo *sideCarCKInfo;
  uint64_t v23;
  BRCZoneRowID *parentZoneRowID;
  void *v25;
  uint64_t v26;
  NSNumber *minimumSupportedOSRowID;
  BRCLocalStatInfo *v28;
  BRCLocalStatInfo *st;
  uint64_t v30;
  void *appLibrary;
  NSObject *v33;
  uint64_t v34;
  objc_super v35;

  v9 = a3;
  v10 = (BRCAccountSession *)a4;
  v11 = a5;
  v35.receiver = self;
  v35.super_class = (Class)BRCLocalItem;
  v12 = -[BRCLocalItem init](&v35, sel_init);
  v13 = v12;
  if (v12)
  {
    v12->_session = v10;
    v12->_dbRowID = objc_msgSend(v9, "unsignedLongAtIndex:", 0);
    objc_msgSend(v9, "numberAtIndex:", 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v13->_serverZone = (BRCServerZone *)-[BRCAccountSession serverZoneByRowID:](v10, "serverZoneByRowID:", v14);

    -[BRCServerZone clientZone](v13->_serverZone, "clientZone");
    v15 = objc_claimAutoreleasedReturnValue();
    clientZone = v13->_clientZone;
    v13->_clientZone = (BRCClientZone *)v15;

    objc_storeStrong((id *)&v13->_db, a5);
    objc_msgSend(v9, "objectOfClass:atIndex:", objc_opt_class(), 2);
    v17 = objc_claimAutoreleasedReturnValue();
    itemID = v13->_itemID;
    v13->_itemID = (BRCItemID *)v17;

    objc_msgSend(v9, "numberAtIndex:", 3);
    v19 = objc_claimAutoreleasedReturnValue();
    ownerKey = v13->_ownerKey;
    v13->_ownerKey = (BRCUserRowID *)v19;

    v13->_sharingOptions = objc_msgSend(v9, "integerAtIndex:", 4);
    objc_msgSend(v9, "objectOfClass:atIndex:", objc_opt_class(), 5);
    v21 = objc_claimAutoreleasedReturnValue();
    sideCarCKInfo = v13->_sideCarCKInfo;
    v13->_sideCarCKInfo = (BRFieldCKInfo *)v21;

    objc_msgSend(v9, "numberAtIndex:", 6);
    v23 = objc_claimAutoreleasedReturnValue();
    parentZoneRowID = v13->_parentZoneRowID;
    v13->_parentZoneRowID = (BRCZoneRowID *)v23;

    v13->_syncUpState = objc_msgSend(v9, "unsignedIntAtIndex:", 7);
    v13->_localDiffs = objc_msgSend(v9, "unsignedLongLongAtIndex:", 8);
    v13->_notifsRank = objc_msgSend(v9, "longLongAtIndex:", 9);
    objc_msgSend(v9, "numberAtIndex:", 10);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "numberAtIndex:", 11);
    v26 = objc_claimAutoreleasedReturnValue();
    minimumSupportedOSRowID = v13->_minimumSupportedOSRowID;
    v13->_minimumSupportedOSRowID = (NSNumber *)v26;

    v13->_isUserVisible = objc_msgSend(v9, "BOOLAtIndex:", 12);
    v28 = -[BRCLocalStatInfo initFromResultSet:pos:]([BRCLocalStatInfo alloc], "initFromResultSet:pos:", v9, 13);
    st = v13->_st;
    v13->_st = v28;

    if (v25)
    {
      -[BRCAccountSession appLibraryByRowID:](v10, "appLibraryByRowID:", v25);
      v30 = objc_claimAutoreleasedReturnValue();
      appLibrary = v13->_appLibrary;
      v13->_appLibrary = (BRCAppLibrary *)v30;
    }
    else
    {
      if (-[BRCLocalItem isReserved](v13, "isReserved"))
        goto LABEL_6;
      brc_bread_crumbs();
      v34 = objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_FAULT))
        -[BRCLocalItem _initFromPQLResultSet:session:db:error:].cold.1();

      appLibrary = (void *)v34;
    }

LABEL_6:
  }

  return v13;
}

- (id)initFromPQLResultSet:(id)a3 session:(id)a4 db:(id)a5 error:(id *)a6
{
  _QWORD *v6;
  _QWORD *v7;
  uint64_t v8;
  void *v9;

  v6 = -[BRCLocalItem _initFromPQLResultSet:session:db:error:](self, "_initFromPQLResultSet:session:db:error:", a3, a4, a5, a6);
  v7 = v6;
  if (v6)
  {
    v8 = objc_msgSend(v6, "copy");
    v9 = (void *)v7[11];
    v7[11] = v8;

  }
  return v7;
}

- (BOOL)validateLoggingToFile:(__sFILE *)a3
{
  return -[BRCStatInfo check:logToFile:](self->_st, "check:logToFile:", self->_itemID, a3);
}

- (BRCItemGlobalID)itemGlobalID
{
  BRCItemGlobalID *v3;
  void *v4;
  BRCItemGlobalID *v5;

  v3 = [BRCItemGlobalID alloc];
  -[BRCClientZone dbRowID](self->_clientZone, "dbRowID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[BRCItemGlobalID initWithZoneRowID:itemID:](v3, "initWithZoneRowID:itemID:", v4, self->_itemID);

  return v5;
}

- (id)itemParentGlobalID
{
  BRCItemGlobalID *v3;
  void *v4;
  void *v5;
  void *v6;
  BRCItemGlobalID *v7;

  v3 = [BRCItemGlobalID alloc];
  -[BRCLocalItem parentClientZone](self, "parentClientZone");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dbRowID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCStatInfo parentID](self->_st, "parentID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[BRCItemGlobalID initWithZoneRowID:itemID:](v3, "initWithZoneRowID:itemID:", v5, v6);

  return v7;
}

- (id)sideCarInfo
{
  BRCSideCarInfo *v3;
  void *v4;
  void *v5;
  NSObject *v6;

  if (-[BRCLocalItem isSharedToMeChildItem](self, "isSharedToMeChildItem"))
  {
    v3 = objc_alloc_init(BRCSideCarInfo);
    -[BRCSideCarInfo setLastUsedTime:](v3, "setLastUsedTime:", -[BRCStatInfo lastUsedTime](self->_st, "lastUsedTime"));
    -[BRCSideCarInfo setFavoriteRank:](v3, "setFavoriteRank:", -[BRCStatInfo favoriteRank](self->_st, "favoriteRank"));
    -[BRCStatInfo finderTags](self->_st, "finderTags");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCSideCarInfo setFinderTags:](v3, "setFinderTags:", v4);

    -[BRCSideCarInfo setCkInfo:](v3, "setCkInfo:", self->_sideCarCKInfo);
  }
  else
  {
    brc_bread_crumbs();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      -[BRCLocalItem sideCarInfo].cold.1();

    v3 = 0;
  }
  return v3;
}

- (id)parentItemIDInZone
{
  void *v3;
  int v4;
  BRCItemID *v5;
  void *v6;
  id v7;
  unsigned int v8;
  id v9;
  void *v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  BRCLocalItem *v14;
  void *v15;
  BRCClientZone *clientZone;
  void *v18;
  BRCClientZone *v19;
  void *v20;
  NSObject *v21;
  int v22;
  BRCLocalItem *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  BRCClientZone *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  -[BRCLocalItem itemID](self, "itemID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isNonDesktopRoot");

  if (v4)
  {
    brc_bread_crumbs();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
      -[BRCLocalItem parentItemIDInZone].cold.2();

  }
  if (!-[BRCLocalItem isSharedToMeTopLevelItem](self, "isSharedToMeTopLevelItem"))
  {
    -[BRCStatInfo parentID](self->_st, "parentID");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    if (v7)
      goto LABEL_4;
LABEL_9:
    brc_bread_crumbs();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      -[BRCLocalItem parentItemIDInZone].cold.1();

    goto LABEL_18;
  }
  v5 = [BRCItemID alloc];
  -[BRCServerZone dbRowID](self->_serverZone, "dbRowID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[BRCItemID _initAsZoneRootWithZoneRowID:](v5, "_initAsZoneRootWithZoneRowID:", v6);

  if (!v7)
    goto LABEL_9;
LABEL_4:
  if (!objc_msgSend(v7, "isNonDesktopRoot"))
  {
    v8 = -[BRCClientZone itemTypeByItemID:db:](self->_clientZone, "itemTypeByItemID:db:", v7, self->_db);
    if (v8 > 0xA || ((1 << v8) & 0x611) == 0)
    {
      if (v8 == 255)
      {
        brc_bread_crumbs();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
        {
          -[BRCItemID debugItemIDString](self->_itemID, "debugItemIDString");
          v14 = (BRCLocalItem *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "debugItemIDString");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          clientZone = self->_clientZone;
          v22 = 138413058;
          v23 = v14;
          v24 = 2112;
          v25 = v15;
          v26 = 2112;
          v27 = clientZone;
          v28 = 2112;
          v29 = v12;
          _os_log_fault_impl(&dword_1CBD43000, v13, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: orphan detected %@ under parent %@ in %@%@", (uint8_t *)&v22, 0x2Au);

        }
      }
      else
      {
        brc_bread_crumbs();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
        {
          objc_msgSend(v7, "debugItemIDString");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          BRCPrettyPrintEnumWithContext((int)v8, (uint64_t)&brc_item_type_pretty_entries, 0);
          v19 = (BRCClientZone *)objc_claimAutoreleasedReturnValue();
          v22 = 138413058;
          v23 = self;
          v24 = 2112;
          v25 = v18;
          v26 = 2112;
          v27 = v19;
          v28 = 2112;
          v29 = v12;
          _os_log_fault_impl(&dword_1CBD43000, v13, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: item parented to a document: %@ parented to %@ type %@%@", (uint8_t *)&v22, 0x2Au);

        }
      }

LABEL_18:
      v9 = 0;
      goto LABEL_19;
    }
  }
  v9 = v7;
LABEL_19:

  return v9;
}

- (id)parentItemOnFS
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  BRCLocalItem *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  BRCAccountSession *session;
  void *v13;
  void *v14;
  BRCItemID *v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  NSObject *v19;
  BRCLocalItem *v21;
  BRCItemID *v22;
  BRCItemID *itemID;
  int v24;
  BRCLocalItem *v25;
  __int16 v26;
  BRCItemID *v27;
  __int16 v28;
  NSObject *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  if (-[BRCLocalItem isFSRoot](self, "isFSRoot"))
  {
    brc_bread_crumbs();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
      -[BRCLocalItem parentItemOnFS].cold.1();
    v5 = 0;
  }
  else
  {
    -[BRCClientZone parentsOfCZMFaults](self->_clientZone, "parentsOfCZMFaults");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", self->_itemID);
    v7 = (BRCLocalItem *)objc_claimAutoreleasedReturnValue();

    if (v7 && !-[BRCPQLConnection isReadonly](self->_db, "isReadonly"))
    {
      brc_bread_crumbs();
      v10 = objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        itemID = self->_itemID;
        v24 = 138412802;
        v25 = v7;
        v26 = 2112;
        v27 = itemID;
        v28 = 2112;
        v29 = v10;
        _os_log_debug_impl(&dword_1CBD43000, v11, OS_LOG_TYPE_DEBUG, "[DEBUG] Using parent %@ for %@ because it's in the CZM fault list%@", (uint8_t *)&v24, 0x20u);
      }

      -[BRCLocalItem itemID](v7, "itemID");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      session = self->_session;
      -[BRCLocalItem zoneRowID](v7, "zoneRowID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[BRCAccountSession serverZoneByRowID:](session, "serverZoneByRowID:", v13);
      v4 = objc_claimAutoreleasedReturnValue();

    }
    else
    {
      -[BRCStatInfo parentID](self->_st, "parentID");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v3)
      {
        brc_bread_crumbs();
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
          -[BRCLocalItem parentItemOnFS].cold.2((uint64_t)v8, v9);

      }
      -[BRCAccountSession serverZoneByRowID:](self->_session, "serverZoneByRowID:", self->_parentZoneRowID);
      v4 = objc_claimAutoreleasedReturnValue();
    }
    -[NSObject clientZone](v4, "clientZone");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "itemByItemID:db:", v3, self->_db);
    v15 = (BRCItemID *)objc_claimAutoreleasedReturnValue();

    if (!v15)
    {
      brc_bread_crumbs();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
      {
        -[BRCItemID debugItemIDString](self->_itemID, "debugItemIDString");
        v21 = (BRCLocalItem *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "debugItemIDString");
        v22 = (BRCItemID *)objc_claimAutoreleasedReturnValue();
        v24 = 138413058;
        v25 = v21;
        v26 = 2112;
        v27 = v22;
        v28 = 2112;
        v29 = v4;
        v30 = 2112;
        v31 = v16;
        _os_log_fault_impl(&dword_1CBD43000, v17, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: orphan detected %@ under parent %@ in %@%@", (uint8_t *)&v24, 0x2Au);

      }
    }
    if (-[BRCItemID isDocument](v15, "isDocument"))
    {
      brc_bread_crumbs();
      v18 = objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
      {
        v24 = 138412802;
        v25 = self;
        v26 = 2112;
        v27 = v15;
        v28 = 2112;
        v29 = v18;
        _os_log_fault_impl(&dword_1CBD43000, v19, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: item parented to a document: %@ parented to %@%@", (uint8_t *)&v24, 0x20u);
      }

      v15 = 0;
    }
    -[BRCItemID asDirectory](v15, "asDirectory");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (void)_updateAppLibraryPristineStatesAfterMarkingDead
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_1(&dword_1CBD43000, v0, v1, "[DEBUG] remove documents folder%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_updateAppLibraryPristineStatesAfterCreationOrUpdate
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  id v10;

  if (!-[BRCLocalItem isFSRoot](self, "isFSRoot") && -[BRCLocalItem isLive](self, "isLive"))
  {
    -[BRCLocalItem appLibrary](self, "appLibrary");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      v10 = v3;
      -[BRCLocalItem appLibrary](self, "appLibrary");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "dbRowID");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      +[BRCItemID documentsItemIDWithAppLibraryRowID:](BRCItemID, "documentsItemIDWithAppLibraryRowID:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      -[BRCStatInfo parentID](self->_st, "parentID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v5) = objc_msgSend(v7, "isEqualToItemID:", v6);

      if ((_DWORD)v5)
      {
        objc_msgSend(v10, "didCreateDocumentScopedItem");
      }
      else if (!-[BRCItemID isEqualToItemID:](self->_itemID, "isEqualToItemID:", v6))
      {
        -[BRCStatInfo parentID](self->_st, "parentID");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "isNonDesktopRoot");

        if (v9)
          objc_msgSend(v10, "didCreateDataScopedItem");
      }

      v3 = v10;
    }

  }
}

- (unint64_t)metadataSyncUpMask:(BOOL)a3
{
  unint64_t v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  int v12;

  if (-[BRCLocalItem isSharedToMeTopLevelItem](self, "isSharedToMeTopLevelItem"))
    v5 = 33430122;
  else
    v5 = 33439742;
  if (!a3)
  {
    if (-[BRCLocalItem isDocument](self, "isDocument"))
    {
      -[BRCLocalItem asDocument](self, "asDocument");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "isPausedFromSync");

      if (v7)
        v5 &= 0x43FFEuLL;
    }
  }
  -[BRCClientZone mangledID](self->_clientZone, "mangledID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "stripBirthtimeFromSyncUpMaskOnDocuments");

  if (v10)
  {
    -[BRCLocalItem itemID](self, "itemID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isDocumentsFolder");

    if (v12)
      return v5 & 0x1FE3FEE;
  }
  return v5;
}

- (unint64_t)maskForDiffsToSyncUpForZone:(id)a3 sideCarZone:(BOOL)a4 whenClearing:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  unint64_t v8;
  id v9;
  void *v10;
  int v11;
  char v12;
  unint64_t v13;
  unint64_t v14;
  _BOOL4 v15;
  unint64_t v16;

  v5 = a5;
  v6 = a4;
  v8 = 0xFCFF00FFF3FF7FFFLL;
  v9 = a3;
  if (-[BRCLocalItem isDocument](self, "isDocument"))
  {
    -[BRCLocalItem asDocument](self, "asDocument");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isPausedFromSync");

    if (v11)
      v8 = 0xFCFF00FFF0047FFFLL;
  }
  if (-[BRCLocalItem isSharedToMeTopLevelItem](self, "isSharedToMeTopLevelItem"))
  {
    v12 = objc_msgSend(v9, "isPrivateZone");
    v13 = v8 & 0xFCFF00FFF2FB0002;
    if (v5)
      v13 = v8 & 0xFCFF00FFF3FF0002;
    if ((v12 & 1) != 0)
      v14 = 32765;
    else
      v14 = v13;
  }
  else
  {
    v15 = -[BRCLocalItem isSharedToMeChildItem](self, "isSharedToMeChildItem");
    v16 = v8 & 0xFCFF00FFF3FF65FFLL;
    if (v6)
      v16 = 6656;
    if (v15)
      v14 = v16;
    else
      v14 = v8;
  }

  return v14;
}

- (void)createSyncUpJob
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: _db.isBatchSuspended%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (id)unsaltedBookmarkData
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[BRCItemID itemIDString](self->_itemID, "itemIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCServerZone mangledID](self->_serverZone, "mangledID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unsaltedBookmarkDataWithItemResolutionString:serverZoneMangledID:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_syncZoneRowIDs
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _BOOL4 v8;
  uint64_t v9;
  void *v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  if (-[BRCLocalItem isSharedToMeTopLevelItem](self, "isSharedToMeTopLevelItem"))
  {
    -[BRCLocalItem clientZone](self, "clientZone");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "dbRowID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = v4;
    -[BRCLocalItem parentClientZone](self, "parentClientZone");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dbRowID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v17[1] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = -[BRCLocalItem isSharedToMeChildItem](self, "isSharedToMeChildItem");
    -[BRCLocalItem clientZone](self, "clientZone");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "dbRowID");
    v9 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)v9;
    if (v8)
    {
      v15 = v9;
      v16 = &unk_1E87D7208;
      v10 = (void *)MEMORY[0x1E0C99D20];
      v11 = &v15;
      v12 = 2;
    }
    else
    {
      v14 = v9;
      v10 = (void *)MEMORY[0x1E0C99D20];
      v11 = &v14;
      v12 = 1;
    }
    objc_msgSend(v10, "arrayWithObjects:count:", v11, v12, v14, v15, v16);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- (void)_updateSyncUpSchedulerWithDiffs:(unint64_t)a3
{
  BRCClientZone *clientZone;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  unsigned int syncUpState;
  void *v11;
  uint64_t v12;
  __int128 v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  BRCLocalItem *v18;
  void *v19;
  char v20;
  BRCLocalItem *v21;
  NSObject *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  NSObject *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint8_t buf[4];
  BRCLocalItem *v36;
  __int16 v37;
  BRCLocalItem *v38;
  __int16 v39;
  void *v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  if ((a3 & 0x20000000000000) == 0
    && (!-[BRCLocalItem isSharedToMe](self, "isSharedToMe") || self->_syncUpState != 4))
  {
    clientZone = self->_clientZone;
    -[BRCLocalItem clientZone](self->_orig, "clientZone");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(clientZone) = -[BRCClientZone isEqualToClientZone:](clientZone, "isEqualToClientZone:", v5);

    if ((clientZone & 1) != 0)
    {
      if (-[BRCLocalItem syncUpState](self->_orig, "syncUpState") == 4 && self->_syncUpState != 4)
      {
        brc_bread_crumbs();
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
          -[BRCLocalItem _updateSyncUpSchedulerWithDiffs:].cold.3();

        goto LABEL_40;
      }
      return;
    }
  }
  brc_bread_crumbs();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    -[BRCLocalItem _updateSyncUpSchedulerWithDiffs:].cold.2();

  syncUpState = self->_syncUpState;
  if (!syncUpState)
  {
    -[BRCAccountSession syncUpScheduler](self->_session, "syncUpScheduler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "deleteSyncUpJobsForItem:", self);
    goto LABEL_40;
  }
  if (syncUpState == 4)
  {
    -[BRCLocalItem createSyncUpJob](self, "createSyncUpJob");
    return;
  }
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  -[BRCLocalItem _syncZoneRowIDs](self, "_syncZoneRowIDs");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v31, v41, 16);
  if (!v12)
  {
    v15 = 0;
    goto LABEL_35;
  }
  v14 = v12;
  v15 = 0;
  v16 = *(_QWORD *)v32;
  *(_QWORD *)&v13 = 138412290;
  v30 = v13;
  do
  {
    v17 = 0;
    do
    {
      if (*(_QWORD *)v32 != v16)
        objc_enumerationMutation(v11);
      v18 = *(BRCLocalItem **)(*((_QWORD *)&v31 + 1) + 8 * v17);
      -[BRCAccountSession syncUpScheduler](self->_session, "syncUpScheduler", v30);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "isItemInSyncUpAndInFlight:inZone:", self, v18);

      if ((v20 & 1) != 0)
      {
        brc_bread_crumbs();
        v21 = (BRCLocalItem *)objc_claimAutoreleasedReturnValue();
        v15 = 1;
        brc_default_log();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412546;
          v36 = v18;
          v37 = 2112;
          v38 = v21;
          _os_log_debug_impl(&dword_1CBD43000, v22, OS_LOG_TYPE_DEBUG, "[DEBUG] Not finishing sync up because item is in-flight in %@%@", buf, 0x16u);
        }
LABEL_24:

        goto LABEL_28;
      }
      brc_bread_crumbs();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412802;
        v36 = self;
        v37 = 2112;
        v38 = v18;
        v39 = 2112;
        v40 = v23;
        _os_log_debug_impl(&dword_1CBD43000, v24, OS_LOG_TYPE_DEBUG, "[DEBUG] Finishing sync up for %@ in %@%@", buf, 0x20u);
      }

      -[BRCAccountSession syncUpScheduler](self->_session, "syncUpScheduler");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v25, "finishSyncUpForItem:inZone:success:", self, v18, 1);

      if (v26)
      {
        brc_bread_crumbs();
        v21 = (BRCLocalItem *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = v30;
          v36 = v21;
          _os_log_fault_impl(&dword_1CBD43000, v22, OS_LOG_TYPE_FAULT, "[CRIT] Assertion failed: syncUpDiffs == 0%@", buf, 0xCu);
        }
        goto LABEL_24;
      }
LABEL_28:
      ++v17;
    }
    while (v14 != v17);
    v27 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v31, v41, 16);
    v14 = v27;
  }
  while (v27);
LABEL_35:

  if (self->_syncUpState == 3 && (v15 & 1) == 0)
  {
    brc_bread_crumbs();
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
      -[BRCLocalItem _updateSyncUpSchedulerWithDiffs:].cold.1();

    -[BRCAccountSession fsUploader](self->_session, "fsUploader");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "rescheduleSuspendedJobsMatching:inState:", self, 31);
LABEL_40:

  }
}

- (void)_updateSharedZoneBoostingWithDiffs:(unint64_t)a3
{
  void *v5;
  void *v6;
  BRCAppLibrary *appLibrary;
  void *v8;
  BRCAppLibrary *v9;
  BRCAppLibrary *v10;
  void *v11;
  BRCAppLibrary *v12;
  id v13;

  if (-[BRCLocalItem isSharedToMeTopLevelItem](self, "isSharedToMeTopLevelItem"))
  {
    if ((a3 & 0x40000000000000) != 0
      && -[BRCLocalItem isOnDisk](self, "isOnDisk")
      && -[BRCLocalItem isOnDisk](self->_orig, "isOnDisk"))
    {
      -[BRCLocalItem appLibrary](self->_orig, "appLibrary");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[BRCServerZone asSharedZone](self->_serverZone, "asSharedZone");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "_removeTargetSharedServerZoneIfNecessary:", v6);

      appLibrary = self->_appLibrary;
      -[BRCLocalItem asSharedToMeTopLevelItem](self, "asSharedToMeTopLevelItem");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[BRCAppLibrary _addTargetSharedServerZoneForSharedItem:](appLibrary, "_addTargetSharedServerZoneForSharedItem:", v8);

    }
    if (-[BRCLocalItem isOnDisk](self, "isOnDisk")
      && (!-[BRCLocalItem isOnDisk](self->_orig, "isOnDisk") || -[BRCLocalItem needsInsert](self->_orig, "needsInsert")))
    {
      v9 = self->_appLibrary;
      -[BRCLocalItem asSharedToMeTopLevelItem](self, "asSharedToMeTopLevelItem");
      v13 = (id)objc_claimAutoreleasedReturnValue();
      -[BRCAppLibrary _addTargetSharedServerZoneForSharedItem:](v9, "_addTargetSharedServerZoneForSharedItem:", v13);
LABEL_16:

      return;
    }
    if (-[BRCLocalItem isOnDisk](self->_orig, "isOnDisk") && !-[BRCLocalItem isOnDisk](self, "isOnDisk"))
    {
      v12 = self->_appLibrary;
      -[BRCServerZone asSharedZone](self->_serverZone, "asSharedZone");
      v13 = (id)objc_claimAutoreleasedReturnValue();
      -[BRCAppLibrary _removeTargetSharedServerZoneIfNecessary:](v12, "_removeTargetSharedServerZoneIfNecessary:", v13);
      goto LABEL_16;
    }
  }
  else if (-[BRCLocalItem isSharedToMeTopLevelItem](self->_orig, "isSharedToMeTopLevelItem"))
  {
    v10 = self->_appLibrary;
    -[BRCLocalItem serverZone](self->_orig, "serverZone");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "asSharedZone");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCAppLibrary _removeTargetSharedServerZoneIfNecessary:](v10, "_removeTargetSharedServerZoneIfNecessary:", v11);

    goto LABEL_16;
  }
}

- (void)wasMarkedDead
{
  BRCItemID *itemID;
  void *v4;
  void *v5;
  id v6;

  -[BRCAccountSession applyScheduler](self->_session, "applyScheduler");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  itemID = self->_itemID;
  -[BRCLocalItem st](self->_orig, "st");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "parentID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "didReparentOrKillItemID:parentItemID:zone:", itemID, v5, self->_serverZone);

  -[BRCLocalItem _updateAppLibraryPristineStatesAfterMarkingDead](self, "_updateAppLibraryPristineStatesAfterMarkingDead");
}

- (BOOL)_insertInDB:(id)a3 dbRowID:(unint64_t)a4
{
  void *v7;
  NSObject *v8;

  if (!-[BRCLocalItem isReserved](self, "isReserved", a3) && !self->_appLibrary)
  {
    brc_bread_crumbs();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      -[BRCLocalItem _insertInDB:dbRowID:].cold.1();

  }
  self->_dbRowID = a4;
  -[BRCLocalItem _updateAppLibraryPristineStatesAfterCreationOrUpdate](self, "_updateAppLibraryPristineStatesAfterCreationOrUpdate");
  -[BRCLocalItem _updateSyncUpSchedulerWithDiffs:](self, "_updateSyncUpSchedulerWithDiffs:", 0xFCFF00FFF3FF7FFFLL);
  -[BRCLocalItem _updateSharedZoneBoostingWithDiffs:](self, "_updateSharedZoneBoostingWithDiffs:", 0);
  return 1;
}

- (BOOL)_updateInDB:(id)a3 diffs:(unint64_t)a4
{
  BRCClientZone *clientZone;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  BOOL v22;
  BRCItemDBRowIDAndZoneJobIdentifier *v23;
  unint64_t dbRowID;
  void *v25;
  void *v26;
  BRCItemDBRowIDAndZoneJobIdentifier *v27;
  void *v28;
  void *v29;
  BRCItemID *itemID;
  void *v31;
  void *v32;
  void *v33;
  int64_t v34;
  int64_t v35;
  void *v36;
  void *v37;
  void *v39;
  NSObject *v40;

  clientZone = self->_clientZone;
  -[BRCLocalItem clientZone](self->_orig, "clientZone", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(clientZone) = -[BRCClientZone isEqualToClientZone:](clientZone, "isEqualToClientZone:", v7);

  if ((clientZone & 1) == 0)
  {
    brc_bread_crumbs();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      -[BRCLocalItem _updateInDB:diffs:].cold.3();

    -[BRCLocalItem itemID](self, "itemID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCLocalItem orig](self, "orig");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "itemID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v10, "isEqualToItemID:", v12);

    if (v13)
    {
      brc_bread_crumbs();
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v40 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_FAULT))
        -[BRCLocalItem _updateInDB:diffs:].cold.2();

    }
    -[BRCStatInfo ckInfo](self->_st, "ckInfo");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "etag");
    v15 = objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      v16 = v15;
      -[BRCLocalItem st](self->_orig, "st");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "ckInfo");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "etagBeforeCrossZoneMove");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[BRCStatInfo ckInfo](self->_st, "ckInfo");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "etag");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v19, "isEqualToString:", v21) & 1) != 0)
      {

      }
      else
      {
        v22 = -[BRCLocalItem isDirectory](self, "isDirectory");

        if (v22)
        {
LABEL_13:
          v23 = [BRCItemDBRowIDAndZoneJobIdentifier alloc];
          dbRowID = self->_dbRowID;
          -[BRCLocalItem clientZone](self->_orig, "clientZone");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "dbRowID");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = -[BRCItemDBRowIDAndZoneJobIdentifier initWithItemDBRowID:zoneRowID:](v23, "initWithItemDBRowID:zoneRowID:", dbRowID, v26);

          -[BRCAccountSession syncUpScheduler](self->_session, "syncUpScheduler");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "deleteJobsMatching:", v27);

          goto LABEL_14;
        }
        brc_bread_crumbs();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
          -[BRCLocalItem _updateInDB:diffs:].cold.1();
      }

    }
    goto LABEL_13;
  }
LABEL_14:
  if (!-[BRCLocalItem isDead](self->_orig, "isDead") && -[BRCLocalItem isDead](self, "isDead"))
    -[BRCLocalItem wasMarkedDead](self, "wasMarkedDead");
  if ((a4 & 0x20) != 0)
  {
    -[BRCAccountSession applyScheduler](self->_session, "applyScheduler");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    itemID = self->_itemID;
    -[BRCLocalItem st](self->_orig, "st");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "parentID");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "didReparentOrKillItemID:parentItemID:zone:", itemID, v32, self->_serverZone);

  }
  if (!-[BRCLocalItem isRejected](self->_orig, "isRejected") && -[BRCLocalItem isRejected](self, "isRejected"))
  {
    -[BRCAccountSession applyScheduler](self->_session, "applyScheduler");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "createApplyJobFromServerItem:localItem:state:kind:", 0, self, 1, 0);

  }
  if (-[BRCLocalItem isIdleOrRejected](self, "isIdleOrRejected"))
  {
    if (!-[BRCLocalItem isIdleOrRejected](self->_orig, "isIdleOrRejected"))
    {
      v34 = -[BRCClientZone serverRankByItemID:](self->_clientZone, "serverRankByItemID:", self->_itemID);
      if (v34)
      {
        v35 = v34;
        -[BRCAccountSession applyScheduler](self->_session, "applyScheduler");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        -[BRCServerZone dbRowID](self->_serverZone, "dbRowID");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "rescheduleItemRank:zoneRowID:matchingState:", v35, v37, 22);

      }
    }
  }
  -[BRCLocalItem _updateSharedZoneBoostingWithDiffs:](self, "_updateSharedZoneBoostingWithDiffs:", a4);
  -[BRCLocalItem _updateSyncUpSchedulerWithDiffs:](self, "_updateSyncUpSchedulerWithDiffs:", a4);
  -[BRCLocalItem _updateAppLibraryPristineStatesAfterCreationOrUpdate](self, "_updateAppLibraryPristineStatesAfterCreationOrUpdate");
  return 1;
}

- (BOOL)_deleteFromDB:(id)a3 keepAliases:(BOOL)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int64_t v11;
  int64_t v12;
  void *v13;
  void *v14;
  BOOL v15;

  v5 = a3;
  v6 = v5;
  if (self->_dbRowID)
  {
    if (!objc_msgSend(v5, "execute:", CFSTR("DELETE FROM client_items WHERE rowid = %lld"), self->_dbRowID))
    {
      v15 = 0;
      goto LABEL_11;
    }
    if (!-[BRCLocalItem isDead](self->_orig, "isDead"))
      -[BRCLocalItem wasMarkedDead](self, "wasMarkedDead");
    -[BRCAccountSession(LegacyAdditions) fsReader](self->_session, "fsReader");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "deleteReadingJobForItem:", self);

    -[BRCAccountSession fsDownloader](self->_session, "fsDownloader");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "deleteDownloadingJobForItem:", self);

    -[BRCAccountSession fsUploader](self->_session, "fsUploader");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "deleteUploadingJobForItem:", self);

    -[BRCAccountSession syncUpScheduler](self->_session, "syncUpScheduler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "deleteSyncUpJobsForItem:", self);

    if (!-[BRCLocalItem isIdleOrRejected](self, "isIdleOrRejected"))
    {
      v11 = -[BRCClientZone serverRankByItemID:](self->_clientZone, "serverRankByItemID:", self->_itemID);
      if (v11)
      {
        v12 = v11;
        -[BRCAccountSession applyScheduler](self->_session, "applyScheduler");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[BRCServerZone dbRowID](self->_serverZone, "dbRowID");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "rescheduleItemRank:zoneRowID:matchingState:", v12, v14, 22);

      }
    }
    -[BRCLocalItem _updateSharedZoneBoostingWithDiffs:](self, "_updateSharedZoneBoostingWithDiffs:", 0);
    self->_dbRowID = 0;
  }
  v15 = 1;
LABEL_11:

  return v15;
}

- (BOOL)_isInterestingUpdateForNotifs
{
  return 0;
}

- (BOOL)_isInterestingUpdateForNotifsWithDiffs:(unint64_t)a3
{
  _BOOL4 v3;
  BOOL v6;
  BOOL v7;
  void *v8;
  int v9;
  int v10;

  if (self->_forceNotif)
    goto LABEL_2;
  if (-[BRCLocalItem isOnDisk](self, "isOnDisk") || (v3 = -[BRCLocalItem isOnDisk](self->_orig, "isOnDisk")))
  {
    if (-[BRCLocalItem needsInsert](self, "needsInsert") && -[BRCLocalItem isDead](self, "isDead"))
      goto LABEL_21;
    v6 = -[BRCLocalItem needsInsert](self, "needsInsert");
    LOBYTE(v3) = 1;
    if ((a3 & 0x80000000) == 0 && !v6)
    {
      if (-[BRCLocalItem isLost](self, "isLost"))
      {
        v7 = -[BRCLocalItem isOnDisk](self, "isOnDisk");
        if ((a3 & 0x80001040000060) == 0 && v7)
          goto LABEL_21;
      }
      if (-[BRCLocalItem isReserved](self->_orig, "isReserved") && -[BRCLocalItem isDead](self, "isDead"))
        goto LABEL_21;
      if ((a3 & 0x100000000) != 0)
      {
        if (-[BRCLocalItem isReserved](self->_orig, "isReserved"))
          goto LABEL_2;
      }
      else if (-[BRCLocalItem isDead](self, "isDead"))
      {
LABEL_21:
        LOBYTE(v3) = 0;
        return v3;
      }
      if (-[BRCLocalItem isDirectory](self, "isDirectory") && -[BRCLocalItem isAlmostDead](self->_orig, "isAlmostDead"))
        goto LABEL_21;
      if ((a3 & 0xF8001FF04A5A60) == 0)
      {
        -[BRCLocalItem orig](self, "orig");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "needsOSUpgradeToSyncUp");
        v10 = -[BRCLocalItem needsOSUpgradeToSyncUp](self, "needsOSUpgradeToSyncUp");

        if (v9 == v10)
        {
          LOBYTE(v3) = -[BRCLocalItem _isInterestingUpdateForNotifs](self, "_isInterestingUpdateForNotifs");
          return v3;
        }
      }
LABEL_2:
      LOBYTE(v3) = 1;
    }
  }
  return v3;
}

- (void)_ascendItemHierarchyWithBlock:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  BRCPQLConnection *db;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  BRCItemGlobalID *v14;
  uint64_t (**v15)(id, BRCItemGlobalID *, void *);

  v15 = (uint64_t (**)(id, BRCItemGlobalID *, void *))a3;
  -[BRCLocalItem appLibrary](self, "appLibrary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mangledID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "maxSyncPathDepth");

  db = self->_db;
  -[BRCStatInfo parentID](self->_st, "parentID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[BRCPQLConnection fetch:](db, "fetch:", CFSTR(" WITH RECURSIVE item_parents (item_id, zone_rowid, item_file_id) AS(    SELECT item_parent_id, item_parent_zone_rowid, item_file_id FROM client_items      WHERE item_id = %@ AND zone_rowid = %@  UNION ALL     SELECT li.item_parent_id, li.item_parent_zone_rowid, li.item_file_id FROM client_items AS li  INNER JOIN item_parents AS p USING (item_id, zone_rowid)      LIMIT %u) SELECT item_file_id, item_id, zone_rowid FROM item_parents"), v9, self->_parentZoneRowID, v7);

  if (objc_msgSend(v10, "next"))
  {
    while (1)
    {
      objc_msgSend(v10, "objectOfClass:atIndex:", objc_opt_class(), 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectOfClass:atIndex:", objc_opt_class(), 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectOfClass:atIndex:", objc_opt_class(), 2);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = -[BRCItemGlobalID initWithZoneRowID:itemID:]([BRCItemGlobalID alloc], "initWithZoneRowID:itemID:", v13, v12);
      if ((v15[2](v15, v14, v11) & 1) == 0)
        break;

      if (!objc_msgSend(v10, "next"))
        goto LABEL_6;
    }
    objc_msgSend(v10, "close");

  }
LABEL_6:

}

- (id)setOfParentIDs
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v8[4];
  id v9;

  v3 = objc_alloc(MEMORY[0x1E0C99E20]);
  -[BRCLocalItem itemGlobalID](self, "itemGlobalID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithObjects:", v4, 0);

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __30__BRCLocalItem_setOfParentIDs__block_invoke;
  v8[3] = &unk_1E8760E18;
  v6 = v5;
  v9 = v6;
  -[BRCLocalItem _ascendItemHierarchyWithBlock:](self, "_ascendItemHierarchyWithBlock:", v8);

  return v6;
}

uint64_t __30__BRCLocalItem_setOfParentIDs__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  int v4;
  void *v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;

  v3 = a2;
  v4 = objc_msgSend(*(id *)(a1 + 32), "containsObject:", v3);
  if (v4)
  {
    brc_bread_crumbs();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      __30__BRCLocalItem_setOfParentIDs__block_invoke_cold_2();

    brc_bread_crumbs();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, (os_log_type_t)0x90u))
      __51__BRCLocalItem_LegacyAdditions__fetchParentFileIDs__block_invoke_cold_1();

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);
  }

  return v4 ^ 1u;
}

- (BOOL)hasValidCKInfo
{
  void *v2;
  BOOL v3;

  -[BRCStatInfo ckInfo](self->_st, "ckInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (BOOL)isIWorkItem
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[BRCLocalStatInfo filename](self->_st, "filename");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "br_pathExtension");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[BRCClientZone mangledID](self->_clientZone, "mangledID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "iworkShareableExtensions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v8 = v7;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v8);
        if ((objc_msgSend(v4, "isEqualToString:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i), (_QWORD)v13) & 1) != 0)
        {
          LOBYTE(v9) = 1;
          goto LABEL_11;
        }
      }
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v9)
        continue;
      break;
    }
  }
LABEL_11:

  return v9;
}

- (void)_sendNotificationIfNeededWithDiffs:(unint64_t)a3 regather:(BOOL)a4
{
  _BOOL4 v4;
  void *v7;
  void *v8;
  _BOOL4 v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  _BOOL4 v17;
  BRCNotification *v18;
  BRCNotification *v19;
  void *v20;
  BRCNotification *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  int v32;
  BRCNotification *v33;
  __int16 v34;
  unint64_t v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v4 = a4;
  v38 = *MEMORY[0x1E0C80C00];
  -[BRCAccountSession notificationManager](self->_session, "notificationManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[BRCLocalItem isBRAlias](self, "isBRAlias"))
  {
    -[BRCLocalItem appLibrary](self, "appLibrary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "hasActiveAliasQueries"))
    {

    }
    else
    {
      v9 = -[BRCLocalItem isDead](self, "isDead");

      if (!v9)
        goto LABEL_38;
    }
  }
  if (!-[BRCLocalItem isZoneRoot](self, "isZoneRoot")
    && (-[BRCLocalItem isOnDisk](self, "isOnDisk") || -[BRCLocalItem isOnDisk](self->_orig, "isOnDisk")))
  {
    if (objc_msgSend(v7, "hasActiveAliasWatchers"))
    {
      -[BRCLocalItem setOfAppLibraryIDsWithReverseAliases](self, "setOfAppLibraryIDsWithReverseAliases");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = 0;
    }
    -[BRCLocalItem itemID](self, "itemID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isDocumentsFolder");

    if (v10)
      goto LABEL_16;
    -[BRCLocalItem appLibrary](self, "appLibrary");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v13, "hasActiveQueries") & 1) != 0)
    {
LABEL_15:

      goto LABEL_16;
    }
    -[BRCLocalItem orig](self, "orig");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "appLibrary");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v15, "hasActiveQueries"))
    {

      goto LABEL_15;
    }
    if (!-[BRCLocalItem isOnDisk](self, "isOnDisk"))
    {
      -[BRCLocalItem orig](self, "orig");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v12 |= objc_msgSend(v23, "isOnDisk");

    }
    if ((v12 & 1) != 0)
    {
LABEL_16:
      if (v4)
      {
        +[BRCNotification notificationGatheredFromItem:](BRCNotification, "notificationGatheredFromItem:", self);
        v16 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v17 = -[BRCLocalItem isBRAlias](self, "isBRAlias");
        v18 = [BRCNotification alloc];
        v19 = v18;
        if (v17)
        {
          -[BRCLocalItem asBRAlias](self, "asBRAlias");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = -[BRCNotification initWithAliasItem:itemDiffs:](v19, "initWithAliasItem:itemDiffs:", v20, a3);

          goto LABEL_22;
        }
        v16 = -[BRCNotification initWithLocalItem:itemDiffs:](v18, "initWithLocalItem:itemDiffs:", self, a3);
      }
      v21 = (BRCNotification *)v16;
LABEL_22:
      if ((-[BRCNotification isDead](v21, "isDead") & 1) != 0)
        goto LABEL_32;
      if (!v10)
      {
        -[BRCLocalItem appLibrary](self, "appLibrary");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v22, "hasActiveRecursiveQueries"))
        {

        }
        else
        {
          -[BRCLocalItem orig](self, "orig");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "appLibrary");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = objc_msgSend(v25, "hasActiveRecursiveQueries");

          if (!v26)
            goto LABEL_32;
        }
      }
      -[BRCLocalItem setOfParentIDs](self, "setOfParentIDs");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[BRCNotification setParentGlobalIDs:](v21, "setParentGlobalIDs:", v27);

LABEL_32:
      if (objc_msgSend(v7, "hasActiveAliasWatchers"))
      {
        -[BRCNotification setAppLibraryIDsWithReverseAliases:](v21, "setAppLibraryIDsWithReverseAliases:", v10);
        if (-[BRCLocalItem isDocument](self, "isDocument"))
        {
          -[BRCLocalItem asDocument](self, "asDocument");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "unsaltedBookmarkData");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          -[BRCNotification setUnsaltedBookmarkData:](v21, "setUnsaltedBookmarkData:", v29);

        }
      }
      brc_bread_crumbs();
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
      {
        v32 = 138412802;
        v33 = v21;
        v34 = 2048;
        v35 = -[BRCLocalItem notifsRank](self, "notifsRank");
        v36 = 2112;
        v37 = v30;
        _os_log_debug_impl(&dword_1CBD43000, v31, OS_LOG_TYPE_DEBUG, "[DEBUG] Queueing notification %@ for rank: %lld%@", (uint8_t *)&v32, 0x20u);
      }

      objc_msgSend(v7, "queueUpdate:", v21);
    }
  }
LABEL_38:

}

- (void)triggerNotificationIfNeeded
{
  if (!-[BRCLocalItem isDead](self, "isDead"))
    -[BRCLocalItem _sendNotificationIfNeededWithDiffs:regather:](self, "_sendNotificationIfNeededWithDiffs:regather:", 0, 1);
}

- (void)markForceNotify
{
  self->_forceNotif = 1;
}

- (NSError)syncUpError
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  if (-[BRCClientZone isSyncBlockedBecauseOSNeedsUpgrade](self->_clientZone, "isSyncBlockedBecauseOSNeedsUpgrade"))
  {
    -[BRCClientZone osNameRequiredToSync](self->_clientZone, "osNameRequiredToSync");
    v3 = objc_claimAutoreleasedReturnValue();
LABEL_5:
    v4 = (void *)v3;
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    _BRLocalizedStringWithFormat();
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = (void *)MEMORY[0x1E0CB35C8];
    v8 = *MEMORY[0x1E0CB28A8];
    v13 = *MEMORY[0x1E0CB2D50];
    v14[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "errorWithDomain:code:userInfo:", v8, 3328, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = v10;
    return (NSError *)v11;
  }
  if (-[BRCLocalItem needsOSUpgradeToSyncUp](self, "needsOSUpgradeToSyncUp"))
  {
    -[BRCLocalItem osNameNeededToSyncUp](self, "osNameNeededToSyncUp");
    v3 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  return (NSError *)0;
}

- (BOOL)fromReadOnlyDB
{
  BRCPQLConnection *db;
  BRCPQLConnection *v3;

  db = self->_db;
  -[BRCAccountSession readOnlyDB](self->_session, "readOnlyDB");
  v3 = (BRCPQLConnection *)objc_claimAutoreleasedReturnValue();
  LOBYTE(db) = db == v3;

  return (char)db;
}

- (unsigned)uploadStatus
{
  void *v3;
  char v4;
  unsigned __int16 v5;
  unint64_t localDiffs;
  void *v8;
  uint64_t v9;

  if (-[BRCLocalItem isIdleOrRejected](self, "isIdleOrRejected"))
    return 3;
  -[BRCLocalItem itemID](self, "itemID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isDocumentsFolder");

  if ((v4 & 1) != 0)
    return 3;
  if (-[BRCLocalItem syncUpState](self, "syncUpState") == 4)
  {
    v5 = 2;
    if (!-[BRCLocalItem isDeadOrMissingInServerTruth](self, "isDeadOrMissingInServerTruth"))
    {
      localDiffs = self->_localDiffs;
      -[BRCAccountSession syncUpScheduler](self->_session, "syncUpScheduler");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "inFlightDiffsForItem:", self) | localDiffs;

      if ((v9 & 0xEFFFFFFFFFFFF7FFLL) != 0)
        return 2;
      else
        return 3;
    }
  }
  else if (-[BRCLocalItem isDocument](self, "isDocument"))
  {
    return 1;
  }
  else
  {
    return 2;
  }
  return v5;
}

- (BOOL)_hasFieldChangesNotDiffed
{
  unint64_t localDiffs;
  int v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t notifsRank;

  localDiffs = self->_localDiffs;
  if (localDiffs != -[BRCLocalItem localDiffs](self->_orig, "localDiffs"))
    return 1;
  v4 = -[BRCStatInfo type](self->_st, "type");
  -[BRCLocalItem st](self->_orig, "st");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "type");

  if (v4 != v6)
    return 1;
  -[BRCLocalStatInfo processingStamp](self->_st, "processingStamp");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCLocalItem st](self->_orig, "st");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "processingStamp");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 != v9)
    return 1;
  notifsRank = self->_notifsRank;
  return notifsRank != -[BRCLocalItem notifsRank](self->_orig, "notifsRank");
}

- (void)_learnItemID:(id)a3 serverItem:(id)a4
{
  id v7;
  NSNumber *knownByServer;
  void *v9;
  BRCUserRowID *v10;
  BRCUserRowID *ownerKey;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a3;
  v7 = a4;
  knownByServer = self->_knownByServer;
  self->_knownByServer = 0;

  self->_localDiffs &= ~0x8000000000000000;
  objc_storeStrong((id *)&self->_itemID, a3);
  self->_sharingOptions = objc_msgSend(v7, "sharingOptions");
  objc_msgSend(v7, "ownerKey");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v7, "ownerKey");
    v10 = (BRCUserRowID *)objc_claimAutoreleasedReturnValue();
    ownerKey = self->_ownerKey;
    self->_ownerKey = v10;

  }
  objc_msgSend(v7, "st");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "creatorRowID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend(v7, "st");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "creatorRowID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCStatInfo setCreatorRowID:](self->_st, "setCreatorRowID:", v15);

  }
  -[BRCAccountSession applyScheduler](self->_session, "applyScheduler");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "rescheduleSuspendedJobsMatching:inState:", self->_serverZone, 22);

}

- (void)_restorePreviousGlobalID:(id)a3
{
  id v4;
  BRCAccountSession *session;
  void *v6;
  BRCClientZone *v7;
  BRCClientZone *clientZone;
  BRCClientZone *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  BRCClientZone *v14;
  void *v15;
  void *v16;
  BRCZoneRowID *v17;
  void *parentZoneRowID;
  BRCZoneRowID *v19;
  BRCZoneRowID *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  BRCZoneRowID *v25;
  BRCZoneRowID *v26;
  void *v27;

  v4 = a3;
  self->_dbRowID = 0;
  session = self->_session;
  objc_msgSend(v4, "zoneRowID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  self->_serverZone = (BRCServerZone *)-[BRCAccountSession serverZoneByRowID:](session, "serverZoneByRowID:", v6);

  -[BRCServerZone clientZone](self->_serverZone, "clientZone");
  v7 = (BRCClientZone *)objc_claimAutoreleasedReturnValue();
  clientZone = self->_clientZone;
  self->_clientZone = v7;

  v9 = self->_clientZone;
  objc_msgSend(v4, "itemID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCClientZone serverItemByItemID:](v9, "serverItemByItemID:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  brc_bread_crumbs();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    -[BRCLocalItem _restorePreviousGlobalID:].cold.1();

  if (objc_msgSend(v11, "isLive")
    && (objc_msgSend(v11, "isSharedToMeTopLevelItem") & 1) == 0
    && (v14 = self->_clientZone,
        objc_msgSend(v11, "parentItemIDOnServer"),
        v15 = (void *)objc_claimAutoreleasedReturnValue(),
        LODWORD(v14) = -[BRCClientZone existsByItemID:](v14, "existsByItemID:", v15),
        v15,
        (_DWORD)v14))
  {
    objc_msgSend(v11, "parentItemIDOnServer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCStatInfo setParentID:](self->_st, "setParentID:", v16);

    -[BRCClientZone dbRowID](self->_clientZone, "dbRowID");
    v17 = (BRCZoneRowID *)objc_claimAutoreleasedReturnValue();
    parentZoneRowID = self->_parentZoneRowID;
    self->_parentZoneRowID = v17;
  }
  else
  {
    if (-[BRCClientZone isPrivateZone](self->_clientZone, "isPrivateZone"))
    {
      -[BRCClientZone asPrivateClientZone](self->_clientZone, "asPrivateClientZone");
      parentZoneRowID = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(parentZoneRowID, "dbRowID");
      v19 = (BRCZoneRowID *)objc_claimAutoreleasedReturnValue();
      v20 = self->_parentZoneRowID;
      self->_parentZoneRowID = v19;

      objc_msgSend(parentZoneRowID, "defaultAppLibrary");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "rootItemID");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[BRCStatInfo setParentID:](self->_st, "setParentID:", v22);

    }
    else
    {
      -[BRCLocalItem appLibrary](self, "appLibrary");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "defaultClientZone");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "dbRowID");
      v25 = (BRCZoneRowID *)objc_claimAutoreleasedReturnValue();
      v26 = self->_parentZoneRowID;
      self->_parentZoneRowID = v25;

      -[BRCLocalItem appLibrary](self, "appLibrary");
      parentZoneRowID = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(parentZoneRowID, "rootItemID");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[BRCStatInfo setParentID:](self->_st, "setParentID:", v21);
    }

  }
  objc_msgSend(v4, "itemID");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCLocalItem learnItemID:serverItem:path:markLost:](self, "learnItemID:serverItem:path:markLost:", v27, v11, 0, 0);

  -[BRCLocalItem markMetadataLive](self, "markMetadataLive");
}

- (void)_markAsDeadTombstoneWithPreviousGlobalID:(id)a3
{
  BRCLocalStatInfo *st;
  id v5;
  void *v6;

  st = self->_st;
  v5 = a3;
  -[BRCLocalStatInfo _markClearedFromStage](st, "_markClearedFromStage");
  -[BRCLocalItem markDead](self, "markDead");
  -[BRCLocalItem _restorePreviousGlobalID:](self, "_restorePreviousGlobalID:", v5);

  -[BRCStatInfo ckInfo](self->_st, "ckInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "revertEtagsForOldZoneTombstone");

  self->_syncUpState = 4;
}

- (void)_cheapCheckSavingItem
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: self.asDocument.desiredVersion%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (BOOL)saveToDBAndValidateLocalDiffs
{
  void *v3;
  uint64_t v4;
  BOOL v5;
  void *v6;
  NSObject *v7;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[BRCLocalItem orig](self, "orig");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "localDiffs");

  v5 = -[BRCLocalItem saveToDB](self, "saveToDB");
  if ((-[BRCLocalItem localDiffs](self, "localDiffs") | v4) != v4)
  {
    brc_bread_crumbs();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      BRCItemFieldsPrettyPrint();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138412546;
      v11 = v9;
      v12 = 2112;
      v13 = v6;
      _os_log_fault_impl(&dword_1CBD43000, v7, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: Item got saved before sync up and a new local diff bit was added: %@%@", (uint8_t *)&v10, 0x16u);

    }
  }
  return v5;
}

- (BOOL)saveToDB
{
  return -[BRCLocalItem saveToDBForServerEdit:keepAliases:](self, "saveToDBForServerEdit:keepAliases:", 0, 0);
}

- (BOOL)saveToDBForServerEdit:(BOOL)a3 keepAliases:(BOOL)a4
{
  _BOOL4 v5;
  BRCAccountSession **p_session;
  void *v8;
  BRCAccountSession *v9;
  void *v10;
  NSObject *v11;
  BRCLocalItem *orig;
  char v13;
  void *v14;
  NSObject *v15;
  char v16;
  void *v17;
  NSObject *v18;
  BRCPQLConnection *db;
  unsigned int v21;
  void *v22;
  NSObject *v23;
  uint64_t v24;
  _QWORD v25[5];
  BRCAccountSession *v26;
  char v27;
  BOOL v28;
  uint64_t v29[3];
  uint8_t buf[4];
  uint64_t v31;
  __int16 v32;
  BRCLocalItem *v33;
  __int16 v34;
  _BOOL4 v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v5 = a3;
  v38 = *MEMORY[0x1E0C80C00];
  p_session = &self->_session;
  -[BRCAccountSession clientDB](self->_session, "clientDB");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "assertOnQueue");

  v9 = *p_session;
  memset(v29, 0, sizeof(v29));
  __brc_create_section(0, (uint64_t)"-[BRCLocalItem saveToDBForServerEdit:keepAliases:]", 2361, v29);
  brc_bread_crumbs();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218754;
    v31 = v29[0];
    v32 = 2112;
    v33 = self;
    v34 = 1024;
    v35 = v5;
    v36 = 2112;
    v37 = v10;
    _os_log_debug_impl(&dword_1CBD43000, v11, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx Saving item %@, serverUpdate = %d%@", buf, 0x26u);
  }

  orig = self->_orig;
  if (orig && !self->_syncUpState)
  {
    v21 = -[BRCLocalItem syncUpState](orig, "syncUpState");
    if (v21)
      v13 = 1;
    else
      v13 = v5;
    if (v21 && !v5)
    {
      brc_bread_crumbs();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
        -[BRCLocalItem saveToDBForServerEdit:keepAliases:].cold.3();

      v13 = 1;
    }
  }
  else
  {
    v13 = v5;
  }
  if (!self->_forceDeletedAlready)
  {
    -[BRCLocalStatInfo rawBouncedLogicalName](self->_st, "rawBouncedLogicalName");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      -[BRCLocalStatInfo physicalName](self->_st, "physicalName");
      v18 = objc_claimAutoreleasedReturnValue();
      if (!v18)
      {
        v24 = -[BRCLocalItem isDead](self, "isDead");

        if ((v24 & 1) != 0)
          goto LABEL_13;
        brc_bread_crumbs();
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
          -[BRCLocalItem saveToDBForServerEdit:keepAliases:].cold.1();
      }

    }
LABEL_13:
    db = self->_db;
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __50__BRCLocalItem_saveToDBForServerEdit_keepAliases___block_invoke;
    v25[3] = &unk_1E8760E40;
    v25[4] = self;
    v27 = v13;
    v26 = v9;
    v28 = a4;
    v16 = -[BRCPQLConnection groupInTransaction:](db, "groupInTransaction:", v25);

    goto LABEL_14;
  }
  brc_bread_crumbs();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    -[BRCLocalItem saveToDBForServerEdit:keepAliases:].cold.2();

  v16 = 1;
LABEL_14:
  __brc_leave_section(v29);

  return v16;
}

uint64_t __50__BRCLocalItem_saveToDBForServerEdit_keepAliases___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  BOOL v12;
  int v13;
  void *v14;
  char v15;
  NSObject *v16;
  void *v17;
  int v18;
  void *v19;
  NSObject *v20;
  _QWORD *v21;
  uint64_t v22;
  void *v23;
  NSObject *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  char v30;
  int v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  NSObject *v46;
  id v47;
  int v48;
  void *v49;
  uint64_t v50;
  const char *v51;
  void *v52;
  uint64_t v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  NSObject *v58;
  void *v59;
  void *v60;
  void *v61;
  NSObject *v62;
  void *v63;
  _QWORD *v64;
  void *v65;
  void *v66;
  void *v67;
  char *v68;
  NSObject *v69;
  void *v70;
  NSObject *v71;
  uint64_t v72;
  void *v73;
  id v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  NSObject *v79;
  _BYTE *v80;
  BOOL v81;
  int v82;
  void *v83;
  void *v84;
  uint64_t v85;
  uint64_t v86;
  NSObject *v87;
  uint64_t v88;
  _BYTE *v89;
  id v91;
  void *v92;
  int v93;
  const char *v94;
  const char *v95;
  char *v96;
  void *v97;
  void *v98;
  void *v99;
  uint64_t v100;
  void *v101;
  void *v102;
  void *v103;
  NSObject *v104;
  uint64_t v105;
  char v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  char v111;
  id v112;
  int v113;
  int v114;
  uint8_t buf[4];
  const char *v116;
  __int16 v117;
  id v118;
  __int16 v119;
  const char *v120;
  __int16 v121;
  const char *v122;
  __int16 v123;
  void *v124;
  uint64_t v125;

  v125 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (id *)(a1 + 32);
  v5 = objc_msgSend(*(id *)(a1 + 32), "diffAgainstOriginalItem");
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 96);
  if (objc_msgSend(*(id *)(a1 + 32), "isDirectory"))
  {
    if (*(_BYTE *)(a1 + 48))
    {
      objc_msgSend(*v4, "asDirectory");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "mtime");
      objc_msgSend(*v4, "orig");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "asDirectory");
      v10 = v6;
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v8 != objc_msgSend(v11, "mtime");

      v6 = v10;
      if (v12)
        v5 |= 0x4000uLL;
    }
  }
  if ((v5 & 0x100000000) != 0
    && objc_msgSend(*((id *)*v4 + 11), "isLost")
    && (objc_msgSend(*v4, "isLost") & 1) == 0)
  {
    v13 = objc_msgSend(*v4, "isDead") ^ 1;
  }
  else
  {
    v13 = 0;
  }
  if (objc_msgSend(*v4, "isDead"))
  {
    if (*((_BYTE *)*v4 + 185))
    {
      brc_bread_crumbs();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 1;
      brc_default_log();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        __50__BRCLocalItem_saveToDBForServerEdit_keepAliases___block_invoke_cold_15();
LABEL_25:

      goto LABEL_26;
    }
    objc_msgSend(*((id *)*v4 + 9), "processingStamp");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      brc_bread_crumbs();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        __50__BRCLocalItem_saveToDBForServerEdit_keepAliases___block_invoke_cold_14();
      v15 = 0;
      goto LABEL_25;
    }
    if (objc_msgSend(*v4, "isIdleOrRejected"))
    {
      brc_bread_crumbs();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 1;
      brc_default_log();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        __50__BRCLocalItem_saveToDBForServerEdit_keepAliases___block_invoke_cold_12();
      goto LABEL_25;
    }
    if ((objc_msgSend(*v4, "isKnownByServerOrInFlight") & 1) == 0)
    {
      brc_bread_crumbs();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 1;
      brc_default_log();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        __50__BRCLocalItem_saveToDBForServerEdit_keepAliases___block_invoke_cold_13();
      goto LABEL_25;
    }
  }
  v15 = 0;
LABEL_26:
  v18 = objc_msgSend(*v4, "isLost");
  if ((v5 & 0x40000000000000) != 0 && v18)
  {
    brc_bread_crumbs();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      __50__BRCLocalItem_saveToDBForServerEdit_keepAliases___block_invoke_cold_11();

    objc_msgSend(*v4, "markLostWithoutBackoff");
  }
  if (*((_QWORD *)*v4 + 13))
  {
    objc_msgSend(*v4, "orig");
    v21 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    v22 = v21[13];

    if (v22)
    {
      brc_bread_crumbs();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
        __50__BRCLocalItem_saveToDBForServerEdit_keepAliases___block_invoke_cold_10();

      if (v13 && (objc_msgSend(*v4, "isIdleOrRejected") & 1) == 0)
      {
        brc_bread_crumbs();
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
          __50__BRCLocalItem_saveToDBForServerEdit_keepAliases___block_invoke_cold_9();
        goto LABEL_42;
      }
      if ((v5 & 0x3FF7FFF) != 0)
      {
        brc_bread_crumbs();
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
          __50__BRCLocalItem_saveToDBForServerEdit_keepAliases___block_invoke_cold_8();
LABEL_42:

        v5 |= 0x8000000000000uLL;
        v27 = (void *)*((_QWORD *)*v4 + 13);
        *((_QWORD *)*v4 + 13) = 0;

        objc_msgSend(*((id *)*v4 + 3), "scheduleSyncUp");
      }
    }
  }
  if ((objc_msgSend(*v4, "isCrossZoneMoveTombstone") & 1) == 0
    && objc_msgSend(*v4, "_isInterestingUpdateForNotifsWithDiffs:", v5))
  {
    +[BRCPersistedState loadFromClientStateInSession:](BRCClientRanksPersistedState, "loadFromClientStateInSession:", *(_QWORD *)(a1 + 40));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 128) = objc_msgSend(v28, "allocateNotifRank");

    objc_msgSend(*(id *)(a1 + 32), "clientZone");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v29, "isSharedZone") & 1) == 0)
    {
      v30 = objc_msgSend(*((id *)*v4 + 11), "isFSRoot");

      if ((v30 & 1) != 0)
      {
LABEL_49:
        v113 = 1;
        goto LABEL_51;
      }
      objc_msgSend(*((id *)*v4 + 11), "parentFileID");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
    }

    goto LABEL_49;
  }
  v113 = 0;
LABEL_51:
  v114 = v13;
  if (*(_BYTE *)(a1 + 48))
    goto LABEL_67;
  v31 = objc_msgSend(*v4, "isSharedToMeChildItem");
  if ((v5 & 0x40) != 0)
  {
    if (v31)
    {
      objc_msgSend(*((id *)*v4 + 20), "etag");
      v32 = objc_claimAutoreleasedReturnValue();
      if (v32)
      {
        v33 = (void *)v32;
        v111 = v15;
        v112 = v3;
        objc_msgSend(*((id *)*v4 + 9), "logicalName");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "br_pathExtension");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*((id *)*v4 + 11), "st");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "logicalName");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "br_pathExtension");
        v38 = objc_claimAutoreleasedReturnValue();
        if (v35 == (void *)v38)
        {

        }
        else
        {
          v39 = (void *)v38;
          v105 = v6;
          objc_msgSend(*((id *)*v4 + 9), "logicalName");
          v110 = v33;
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "br_pathExtension");
          v109 = v35;
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*((id *)*v4 + 11), "st");
          v108 = v36;
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "logicalName");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "br_pathExtension");
          v107 = v34;
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          v106 = objc_msgSend(v41, "isEqualToString:", v44);

          if ((v106 & 1) == 0)
          {
            brc_bread_crumbs();
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            brc_default_log();
            v46 = objc_claimAutoreleasedReturnValue();
            v3 = v112;
            v6 = v105;
            v15 = v111;
            if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
              __50__BRCLocalItem_saveToDBForServerEdit_keepAliases___block_invoke_cold_7();

            if (objc_msgSend(*((id *)*v4 + 9), "favoriteRank"))
            {
              v5 |= 0x1000uLL;
            }
            else if (objc_msgSend(*((id *)*v4 + 9), "lastUsedTime"))
            {
              v5 |= 0x800uLL;
            }
            goto LABEL_66;
          }
          v3 = v112;
          v6 = v105;
        }
        v15 = v111;
      }
    }
  }
LABEL_66:
  *((_QWORD *)*v4 + 12) |= objc_msgSend(*v4, "metadataSyncUpMask:", 1) & v5;
LABEL_67:
  v47 = *v4;
  if ((v15 & 1) != 0)
  {
    v48 = objc_msgSend(v47, "_deleteFromDB:keepAliases:", v3, *(unsigned __int8 *)(a1 + 49));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "fileID");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = objc_msgSend(v49, "unsignedLongLongValue");
    v51 = "Deleted from DB";
    goto LABEL_89;
  }
  if (objc_msgSend(v47, "needsInsert"))
  {
    +[BRCPersistedState loadFromClientStateInSession:](BRCClientRanksPersistedState, "loadFromClientStateInSession:", *(_QWORD *)(a1 + 40));
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = objc_msgSend(v52, "allocateItemRowID");

    if (objc_msgSend(*(id *)(a1 + 32), "isSharedToMeChildItem"))
    {
      objc_msgSend(*((id *)*v4 + 1), "containerScheduler");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "sideCarSyncPersistedState");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "lastSyncDownDate");
      v56 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v56)
      {
        brc_bread_crumbs();
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v58 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v58, OS_LOG_TYPE_DEBUG))
          __50__BRCLocalItem_saveToDBForServerEdit_keepAliases___block_invoke_cold_5();

        objc_msgSend(*((id *)*v4 + 1), "containerScheduler");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C94F88], "br_syncDownInitial");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v59, "scheduleSyncDownForSideCarWithGroup:", v60);

      }
    }
    brc_bread_crumbs();
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v62 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v62, OS_LOG_TYPE_DEBUG))
      __50__BRCLocalItem_saveToDBForServerEdit_keepAliases___block_invoke_cold_4((uint64_t)v61, v53, v62);

    v48 = objc_msgSend(*v4, "_insertInDB:dbRowID:", v3, v53);
    v51 = "Inserted into DB";
    if ((v5 & 0x400000000) == 0)
    {
LABEL_78:
      if ((v48 & 1) == 0)
        goto LABEL_93;
LABEL_99:
      objc_msgSend(*v4, "_cheapCheckSavingItem");
      if (v114)
      {
        objc_msgSend(*v4, "appLibrary");
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        v74 = *v4;
        objc_msgSend(*v4, "orig");
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v75, "appLibrary");
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        if (v76)
        {
          objc_msgSend(v73, "didFindLostItem:oldAppLibrary:", v74, v76);
        }
        else
        {
          objc_msgSend(*v4, "appLibrary");
          v77 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v73, "didFindLostItem:oldAppLibrary:", v74, v77);

        }
      }
      brc_bread_crumbs();
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v79 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v79, OS_LOG_TYPE_DEBUG))
      {
        BRCItemFieldsPrettyPrint();
        v91 = (id)objc_claimAutoreleasedReturnValue();
        v92 = v91;
        v93 = *(unsigned __int8 *)(a1 + 48);
        *(_DWORD *)buf = 136316162;
        v116 = v51;
        if (v113)
          v94 = "YES";
        else
          v94 = "NO";
        v117 = 2112;
        if (v93)
          v95 = "YES";
        else
          v95 = "NO";
        v118 = v91;
        v119 = 2080;
        v120 = v94;
        v121 = 2080;
        v122 = v95;
        v123 = 2112;
        v124 = v78;
        _os_log_debug_impl(&dword_1CBD43000, v79, OS_LOG_TYPE_DEBUG, "[DEBUG] %s. changedFields:%@ sendNotif:%s serverUpdate:%s%@", buf, 0x34u);

      }
      if (v113)
      {
        objc_msgSend(*v4, "_sendNotificationIfNeededWithDiffs:regather:", v5, 0);
        v80 = *((id *)*v4 + 11);
        v81 = ((objc_msgSend(v80, "isAlmostDead") & 1) != 0 || (objc_msgSend(*v4, "isAlmostDead") & 1) == 0)
           && ((objc_msgSend(v80, "isDead") & 1) != 0 || (objc_msgSend(*v4, "isDead") & 1) == 0)
           && (!v80 || !v80[112] || *((_BYTE *)*v4 + 112) != 0);
        v82 = objc_msgSend(*v4, "_isIndexable");
        if (!v81 && v82)
        {
          objc_msgSend(v80, "fileObjectID");
          v83 = (void *)objc_claimAutoreleasedReturnValue();
          if (v83)
          {
            objc_msgSend(*((id *)*v4 + 1), "recentsEnumerator");
            v84 = (void *)objc_claimAutoreleasedReturnValue();
            v85 = *((_QWORD *)*v4 + 16);
            if ((objc_msgSend(*v4, "isAlmostDead") & 1) != 0)
              v86 = 0;
            else
              v86 = objc_msgSend(*v4, "isDead") ^ 1;
            objc_msgSend(v84, "dropItemWithFileObjectID:notifRank:itemIsLive:", v83, v85, v86);
          }
          else
          {
            if ((objc_msgSend(v80, "isDead") & 1) != 0
              || (objc_msgSend(v80, "isAlmostDead") & 1) != 0
              || objc_msgSend(v80, "isReserved"))
            {
              brc_bread_crumbs();
              v84 = (void *)objc_claimAutoreleasedReturnValue();
              brc_default_log();
              v87 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v87, OS_LOG_TYPE_DEBUG))
                __50__BRCLocalItem_saveToDBForServerEdit_keepAliases___block_invoke_cold_1(v4);
            }
            else
            {
              brc_bread_crumbs();
              v84 = (void *)objc_claimAutoreleasedReturnValue();
              brc_default_log();
              v87 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v87, OS_LOG_TYPE_FAULT))
                __50__BRCLocalItem_saveToDBForServerEdit_keepAliases___block_invoke_cold_2();
            }

          }
        }

      }
      v88 = objc_msgSend(*v4, "copy");
      v70 = (void *)*((_QWORD *)*v4 + 11);
      *((_QWORD *)*v4 + 11) = v88;
      v72 = 1;
      goto LABEL_131;
    }
  }
  else
  {
    if (!v5 && !objc_msgSend(*v4, "_hasFieldChangesNotDiffed"))
    {
      v51 = "Ignored";
      goto LABEL_99;
    }
    if (objc_msgSend(*v4, "isSharedToMeTopLevelItem") && (*((_WORD *)*v4 + 48) & 0x1A69) != 0)
    {
      objc_msgSend(*v4, "parentClientZone");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v63, "isPrivateZone") && (v64 = *v4, (*((_WORD *)*v4 + 48) & 0x1A60) == 0))
      {
        v98 = (void *)v64[1];
        objc_msgSend(*v4, "parentClientZone");
        v99 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v99, "serverZone");
        v100 = v6;
        v101 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v98, "serverAliasItemForSharedItem:inZone:", v64, v101);
        v102 = (void *)objc_claimAutoreleasedReturnValue();

        v6 = v100;
        if (!v102)
        {
          brc_bread_crumbs();
          v103 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v104 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v104, OS_LOG_TYPE_DEBUG))
            __50__BRCLocalItem_saveToDBForServerEdit_keepAliases___block_invoke_cold_6();

          *((_QWORD *)*v4 + 12) &= 0xFFFFFFFFFFFF8002;
        }
      }
      else
      {

      }
    }
    v48 = objc_msgSend(*v4, "_updateInDB:diffs:", v3, v5);
    v51 = "Saved into DB";
    if ((v5 & 0x400000000) == 0)
      goto LABEL_78;
  }
  objc_msgSend(*((id *)*v4 + 11), "st");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "fileID");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = objc_msgSend(v65, "unsignedLongLongValue");

LABEL_89:
  if (!v50)
  {
    if (!v48)
      goto LABEL_93;
    goto LABEL_99;
  }
  objc_msgSend(*(id *)(a1 + 40), "stageRegistry");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v50);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "forgetWatchedLockedFileID:", v67);

  if ((v48 & 1) != 0)
    goto LABEL_99;
LABEL_93:
  *((_QWORD *)*v4 + 12) = v6;
  brc_bread_crumbs();
  v68 = (char *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v69 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v69, (os_log_type_t)0x90u))
  {
    objc_msgSend(*v4, "itemID");
    v96 = (char *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "lastError");
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v116 = v96;
    v117 = 2112;
    v118 = v97;
    v119 = 2112;
    v120 = v68;
    _os_log_error_impl(&dword_1CBD43000, v69, (os_log_type_t)0x90u, "[ERROR] failed to save item %@ to DB: %@%@", buf, 0x20u);

  }
  brc_bread_crumbs();
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v71 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v71, OS_LOG_TYPE_FAULT))
    __50__BRCLocalItem_saveToDBForServerEdit_keepAliases___block_invoke_cold_3();

  v72 = 0;
LABEL_131:

  v89 = *v4;
  if (*((_BYTE *)*v4 + 185))
  {
    v89[186] = v72;
    v89 = *v4;
  }
  v89[187] = 0;

  return v72;
}

- (BOOL)_isIndexable
{
  return -[BRCLocalItem isDocument](self, "isDocument") || -[BRCLocalItem isDirectory](self, "isDirectory");
}

- (unint64_t)diffAgainstServerItem:(id)a3
{
  id v4;
  void *v5;
  BRCItemID *itemID;
  void *v7;
  BRCItemID *v8;
  BRCItemID *v9;
  BRCItemID *v10;
  BOOL v11;
  uint64_t v12;
  BRCUserRowID *ownerKey;
  void *v14;
  BRCUserRowID *v15;
  BRCUserRowID *v16;
  BRCUserRowID *v17;
  int v18;
  uint64_t v19;
  unint64_t sharingOptions;
  uint64_t v21;
  BRFieldCKInfo *sideCarCKInfo;
  void *v23;
  void *v24;
  BRFieldCKInfo *v25;
  BRFieldCKInfo *v26;
  BRFieldCKInfo *v27;
  int v28;
  uint64_t v29;
  BRCLocalStatInfo *st;
  void *v31;
  unint64_t v32;
  unint64_t v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  int v40;

  v4 = a3;
  v5 = v4;
  if (!v4)
  {
    if (-[BRCLocalItem isDocument](self, "isDocument"))
      v32 = 4093607935;
    else
      v32 = 4026564607;
    goto LABEL_30;
  }
  itemID = self->_itemID;
  objc_msgSend(v4, "itemID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = itemID;
  v9 = v7;
  if (v8 == v9)
  {

  }
  else
  {
    v10 = v9;
    if (!v9)
    {

LABEL_9:
      v12 = 0x80000000;
      goto LABEL_10;
    }
    v11 = -[BRCItemID isEqual:](v8, "isEqual:", v9);

    if (!v11)
      goto LABEL_9;
  }
  v12 = 0;
LABEL_10:
  ownerKey = self->_ownerKey;
  objc_msgSend(v5, "ownerKey");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = ownerKey;
  v16 = v14;
  v17 = v16;
  if (v15 == v16)
  {
    v18 = 0;
  }
  else if (v16)
  {
    v18 = -[BRCUserRowID isEqual:](v15, "isEqual:", v16) ^ 1;
  }
  else
  {
    v18 = 1;
  }

  if (v18)
    v19 = v12 | 0x20000000;
  else
    v19 = v12;
  sharingOptions = self->_sharingOptions;
  if (sharingOptions == objc_msgSend(v5, "sharingOptions"))
    v21 = v19;
  else
    v21 = v19 | 0x40000000;
  sideCarCKInfo = self->_sideCarCKInfo;
  objc_msgSend(v5, "sideCarInfo");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "ckInfo");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = sideCarCKInfo;
  v26 = v24;
  v27 = v26;
  if (v25 == v26)
  {
    v28 = 0;
  }
  else if (v26)
  {
    v28 = !-[BRFieldCKInfo isEqual:](v25, "isEqual:", v26);
  }
  else
  {
    v28 = 1;
  }

  if (v28)
    v29 = v21 | 0x100000000000000;
  else
    v29 = v21;
  st = self->_st;
  objc_msgSend(v5, "st");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = -[BRCStatInfo diffAgainst:](st, "diffAgainst:", v31) | v29;

LABEL_30:
  if (-[BRCLocalItem isSharedToMeTopLevelItem](self, "isSharedToMeTopLevelItem")
    && objc_msgSend(v5, "isSharedToMeTopLevelItem"))
  {
    v33 = v32 & 0xFFFFFFFFFFFFFFDFLL;
    -[BRCAccountSession serverAliasItemForSharedItem:db:](self->_session, "serverAliasItemForSharedItem:db:", self, self->_db);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    if (v34)
    {
      -[BRCLocalItem asSharedToMeTopLevelItem](self, "asSharedToMeTopLevelItem");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = objc_msgSend(v35, "diffAgainstServerAliasItem:", v34) & 0x20;

    }
    else
    {
      -[BRCLocalItem st](self, "st");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "parentID");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      -[BRCAppLibrary documentsFolderItemID](self->_appLibrary, "documentsFolderItemID");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = objc_msgSend(v38, "isEqualToItemID:", v39);

      if (v40)
        v36 = 0;
      else
        v36 = 32;
    }
    v32 = v36 | v33;

  }
  return v32;
}

- (unint64_t)diffAgainstLocalItem:(id)a3
{
  _QWORD *v4;
  _QWORD *v5;
  void *v6;
  BRCItemID *v7;
  BRCItemID *v8;
  BRCItemID *v9;
  BOOL v10;
  uint64_t v11;
  void *v12;
  BRCUserRowID *v13;
  BRCUserRowID *v14;
  BRCUserRowID *v15;
  char v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  void *v25;
  int v26;
  void *v27;
  NSNumber *v28;
  NSNumber *v29;
  NSNumber *v30;
  char v31;
  void *v32;
  BRFieldCKInfo *v33;
  BRFieldCKInfo *v34;
  BRFieldCKInfo *v35;
  BOOL v36;
  unint64_t v37;
  unint64_t v38;

  v4 = a3;
  v5 = v4;
  if (!v4)
  {
    v38 = 0xFF007FF3FF7FFFLL;
    goto LABEL_51;
  }
  v6 = (void *)v4[6];
  v7 = self->_itemID;
  v8 = v6;
  if (v7 == v8)
  {

    goto LABEL_7;
  }
  v9 = v8;
  if (v8)
  {
    v10 = -[BRCItemID isEqual:](v7, "isEqual:", v8);

    if (!v10)
      goto LABEL_9;
LABEL_7:
    v11 = 0;
    goto LABEL_10;
  }

LABEL_9:
  v11 = 0x80000000;
LABEL_10:
  v12 = (void *)v5[8];
  v13 = self->_ownerKey;
  v14 = v12;
  if (v13 == v14)
  {

    goto LABEL_17;
  }
  v15 = v14;
  if (!v14)
  {

    goto LABEL_16;
  }
  v16 = -[BRCUserRowID isEqual:](v13, "isEqual:", v14);

  if ((v16 & 1) == 0)
LABEL_16:
    v11 |= 0x20000000uLL;
LABEL_17:
  if (self->_sharingOptions == v5[17])
    v17 = v11;
  else
    v17 = v11 | 0x40000000;
  if (self->_syncUpState != *((_DWORD *)v5 + 20))
    v17 |= 0x20000000000000uLL;
  if (self->_isUserVisible == *((unsigned __int8 *)v5 + 112))
    v18 = v17;
  else
    v18 = v17 | 0x80000000000000;
  if ((v18 & 0x40000000000000) == 0)
  {
    -[BRCLocalItem appLibrary](self, "appLibrary");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "dbRowID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appLibrary");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "dbRowID");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v20;
    v24 = v22;
    v25 = v24;
    if (v23 == v24)
      v26 = 0;
    else
      v26 = v24 ? objc_msgSend(v23, "isEqual:", v24) ^ 1 : 1;

    if (v26)
      v18 |= 0x40000000000000uLL;
  }
  if ((v18 & 0x8000000000000) == 0)
  {
    v27 = (void *)v5[13];
    v28 = self->_minimumSupportedOSRowID;
    v29 = v27;
    if (v28 == v29)
    {

      goto LABEL_41;
    }
    v30 = v29;
    if (v29)
    {
      v31 = -[NSNumber isEqual:](v28, "isEqual:", v29);

      if ((v31 & 1) != 0)
        goto LABEL_41;
    }
    else
    {

    }
    v18 |= 0x8000000000000uLL;
  }
LABEL_41:
  v32 = (void *)v5[20];
  v33 = self->_sideCarCKInfo;
  v34 = v32;
  if (v33 == v34)
  {

  }
  else
  {
    v35 = v34;
    if (v34)
    {
      v36 = -[BRFieldCKInfo isEqual:](v33, "isEqual:", v34);

      if (v36)
        goto LABEL_48;
    }
    else
    {

    }
    v18 |= 0x100000000000000uLL;
  }
LABEL_48:
  v37 = -[BRCLocalStatInfo diffAgainstLocalInfo:](self->_st, "diffAgainstLocalInfo:", v5[9]);
  v38 = v37 | v18;
  if (((v37 | v18) & 8) != 0
    && !-[BRCLocalItem isSharedToMeTopLevelItem](self, "isSharedToMeTopLevelItem"))
  {
    v38 &= ~8uLL;
  }
LABEL_51:

  return v38;
}

- (unint64_t)diffAgainstOriginalItem
{
  if (self->_orig)
    return -[BRCLocalItem diffAgainstLocalItem:](self, "diffAgainstLocalItem:");
  else
    return 0xFF007FF3FF7FFFLL;
}

+ (BOOL)computeUserVisibleStatusOfLiveItemWithParentVisible:(BOOL)a3 parentIsNonDesktopRoot:(BOOL)a4 parentScope:(unsigned __int8)a5 itemFilename:(id)a6 parentFilename:(id)a7 appLibrary:(id)a8
{
  int v10;
  _BOOL4 v11;
  int v12;
  id v13;
  id v14;
  id v15;
  void *v17;
  NSObject *v18;
  void *v19;
  NSObject *v20;

  v10 = a5;
  v11 = a4;
  v12 = a3;
  v13 = a6;
  v14 = a7;
  v15 = a8;
  if ((objc_msgSend(v15, "supportsSpotlightIndexing") & 1) == 0)
  {
    if (objc_msgSend(v15, "isCloudDocsAppLibrary"))
    {
      brc_bread_crumbs();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
        +[BRCLocalItem computeUserVisibleStatusOfLiveItemWithParentVisible:parentIsNonDesktopRoot:parentScope:itemFilename:parentFilename:appLibrary:].cold.2();

    }
    goto LABEL_12;
  }
  if (v10 == 1 && v11 && (objc_msgSend(v13, "isEqualToString:", *MEMORY[0x1E0D10D98]) & 1) != 0)
    goto LABEL_10;
  if (v10 == 1 && v12)
  {
    brc_bread_crumbs();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
      +[BRCLocalItem computeUserVisibleStatusOfLiveItemWithParentVisible:parentIsNonDesktopRoot:parentScope:itemFilename:parentFilename:appLibrary:].cold.1();

  }
  if ((objc_msgSend(v13, "hasPrefix:", CFSTR(".")) & 1) != 0)
  {
LABEL_12:
    LOBYTE(v12) = 0;
    goto LABEL_13;
  }
  if (v10 == 2 && v11)
  {
LABEL_10:
    LOBYTE(v12) = 1;
    goto LABEL_13;
  }
  if (v10 == 3)
    LOBYTE(v12) = objc_msgSend(v14, "isEqualToString:", *MEMORY[0x1E0D10E00]);
LABEL_13:

  return v12;
}

- (NSDictionary)extendedAttributes
{
  void (**v3)(_QWORD, _QWORD);
  BRCLocalStatInfo *st;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__16;
  v18 = __Block_byref_object_dispose__16;
  v19 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __34__BRCLocalItem_extendedAttributes__block_invoke;
  v13[3] = &unk_1E8760E68;
  v13[4] = &v14;
  v3 = (void (**)(_QWORD, _QWORD))MEMORY[0x1D17A6DB0](v13);
  st = self->_st;
  -[BRCAccountSession stageRegistry](self->_session, "stageRegistry");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCStatInfo lazyXattrWithStageRegistry:](st, "lazyXattrWithStageRegistry:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *))v3)[2](v3, v6);

  if (-[BRCLocalItem isDocument](self, "isDocument"))
  {
    -[BRCLocalItem asDocument](self, "asDocument");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "currentVersion");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCAccountSession stageRegistry](self->_session, "stageRegistry");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "lazyXattrWithStageRegistry:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v3)[2](v3, v10);

  }
  if (objc_msgSend((id)v15[5], "count"))
    v11 = (id)v15[5];
  else
    v11 = 0;

  _Block_object_dispose(&v14, 8);
  return (NSDictionary *)v11;
}

void __34__BRCLocalItem_extendedAttributes__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  BRFieldXattrBlob *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    v4 = -[BRFieldXattrBlob initWithData:]([BRFieldXattrBlob alloc], "initWithData:", v3);
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    -[BRFieldXattrBlob xattrs](v4, "xattrs", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v15 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
          objc_msgSend(v10, "value");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
          objc_msgSend(v10, "name");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "setObject:forKeyedSubscript:", v11, v13);

        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v7);
    }

  }
}

- (void)markForceNeedsSyncUp
{
  self->_localDiffs |= 0x3FFEuLL;
  -[BRCLocalItem _markNeedsSyncingUp](self, "_markNeedsSyncingUp");
}

- (void)markForceRejected
{
  self->_syncUpState = 1;
}

- (void)markRejectedItemRemotelyRevived
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: _syncUpState == BRC_SUS_REJECTED%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (BOOL)forceNeedsSyncUpWithoutDiffs
{
  _BOOL4 v3;
  void *v4;
  NSObject *v5;

  v3 = -[BRCLocalItem hasShareIDAndIsOwnedByMe](self, "hasShareIDAndIsOwnedByMe");
  if (v3)
  {
    if ((-[BRCLocalItem sharingOptions](self, "sharingOptions") & 0x48) != 0)
    {
      v3 = -[BRCLocalItem isInTrashScope](self, "isInTrashScope");
      if (v3)
      {
        brc_bread_crumbs();
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v5 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
          -[BRCLocalItem forceNeedsSyncUpWithoutDiffs].cold.1();

        LOBYTE(v3) = 1;
      }
    }
    else
    {
      LOBYTE(v3) = 0;
    }
  }
  return v3;
}

- (void)_markNeedsSyncingUp
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_1(&dword_1CBD43000, v0, v1, "[DEBUG] Ignoring sync up request on item needing OOB_SYNC_ACK with no field changes%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)markNeedsUploadOrSyncingUp
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  unint64_t v11;
  void *v12;
  NSObject *v13;
  int v14;
  BRCLocalItem *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (!-[BRCLocalItem isRejected](self, "isRejected"))
  {
LABEL_17:
    -[BRCLocalItem _markNeedsSyncingUp](self, "_markNeedsSyncingUp");
    return;
  }
  if (-[BRCLocalItem isSharedToMeTopLevelItem](self, "isSharedToMeTopLevelItem"))
  {
    brc_bread_crumbs();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v14 = 138412546;
      v15 = self;
      v16 = 2112;
      v17 = v3;
      _os_log_impl(&dword_1CBD43000, v4, OS_LOG_TYPE_DEFAULT, "[WARNING] Not forcing sync up of share-to-me top level item %@%@", (uint8_t *)&v14, 0x16u);
    }

    self->_localDiffs = 0;
    return;
  }
  if (!-[BRCLocalItem isSharedToMeChildItem](self, "isSharedToMeChildItem"))
  {
LABEL_13:
    v11 = self->_localDiffs | -[BRCLocalItem diffAgainstOriginalItem](self, "diffAgainstOriginalItem");
    if ((v11 & -[BRCLocalItem metadataSyncUpMask:](self, "metadataSyncUpMask:", 0)) != 0)
    {
      brc_bread_crumbs();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v14 = 138412546;
        v15 = self;
        v16 = 2112;
        v17 = v12;
        _os_log_impl(&dword_1CBD43000, v13, OS_LOG_TYPE_DEFAULT, "[WARNING] Rejected item %@ has meaningful local diffs.  Forcing re-sync of all fields%@", (uint8_t *)&v14, 0x16u);
      }

      self->_localDiffs = 0xFF007FF3FF7FFFLL;
    }
    goto LABEL_17;
  }
  objc_msgSend(MEMORY[0x1E0C95070], "brc_fetchShareIDWithSharedItem:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "brc_shareItemID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCClientZone serverItemByItemID:](self->_clientZone, "serverItemByItemID:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7 && !objc_msgSend(v7, "isDead"))
  {

    goto LABEL_13;
  }
  brc_bread_crumbs();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v14 = 138412546;
    v15 = self;
    v16 = 2112;
    v17 = v9;
    _os_log_impl(&dword_1CBD43000, v10, OS_LOG_TYPE_DEFAULT, "[WARNING] Not forcing sync up of share-to-me child item with a dead root share %@%@", (uint8_t *)&v14, 0x16u);
  }

  self->_localDiffs = 0;
}

- (void)scheduleSyncDownForOOBModifyRecordsAck
{
  self->_localDiffs |= 0x1000000000000000uLL;
  -[BRCClientZone scheduleSyncDownForOOBModifyRecordsAck](self->_clientZone, "scheduleSyncDownForOOBModifyRecordsAck");
}

- (void)prepareForSyncUpSideCarZone
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: self.isReadAndUploaded || self.isKnownByServerOrInFlight%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)prepareForSyncUpInZone:(id)a3
{
  id v4;
  unint64_t v5;
  unint64_t localDiffs;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;

  v4 = a3;
  if ((-[BRCPQLConnection isBatchSuspended](self->_db, "isBatchSuspended") & 1) == 0)
  {
    brc_bread_crumbs();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      -[BRCLocalItem createSyncUpJob].cold.7();

  }
  if (!-[BRCLocalItem isReadAndUploaded](self, "isReadAndUploaded")
    && !-[BRCLocalItem isKnownByServerOrInFlight](self, "isKnownByServerOrInFlight"))
  {
    brc_bread_crumbs();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      -[BRCLocalItem prepareForSyncUpSideCarZone].cold.1();

  }
  v5 = -[BRCLocalItem maskForDiffsToSyncUpForZone:sideCarZone:whenClearing:](self, "maskForDiffsToSyncUpForZone:sideCarZone:whenClearing:", v4, 0, 1);
  localDiffs = self->_localDiffs;
  self->_localDiffs = localDiffs & ~v5;
  if (objc_msgSend(v4, "isPrivateZone")
    && -[BRCLocalItem isSharedToMeTopLevelItem](self, "isSharedToMeTopLevelItem"))
  {
    self->_localDiffs &= 0xFFFFFFFFFFFF8000;
  }
  v7 = localDiffs & v5;
  -[BRCAccountSession syncUpScheduler](self->_session, "syncUpScheduler");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dbRowID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "prepareItemForSyncUp:inFlightDiffs:inZone:", self, v7, v9);

}

- (void)markLatestSyncRequestFailedInZone:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  unsigned int syncUpState;
  int v8;
  BRCAccountSession *session;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;

  v4 = a3;
  if ((-[BRCPQLConnection isBatchSuspended](self->_db, "isBatchSuspended") & 1) == 0)
  {
    brc_bread_crumbs();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      -[BRCLocalItem createSyncUpJob].cold.7();

  }
  -[BRCAccountSession syncUpScheduler](self->_session, "syncUpScheduler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "finishSyncUpForItem:inZone:success:", self, v4, 0);

  syncUpState = self->_syncUpState;
  if (syncUpState >= 2)
  {
    self->_localDiffs |= v6;
    if (syncUpState == 4)
    {
      -[BRCLocalItem createSyncUpJob](self, "createSyncUpJob");
      v8 = objc_msgSend(v4, "br_isEqualToNumber:", &unk_1E87D7208);
      session = self->_session;
      if (v8)
      {
        -[BRCAccountSession containerScheduler](session, "containerScheduler");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "scheduleSyncUpForSideCar");
      }
      else
      {
        -[BRCAccountSession serverZoneByRowID:](session, "serverZoneByRowID:", v4);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "clientZone");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "scheduleSyncUp");

      }
    }
  }

}

- (void)markLatestSyncRequestRejectedInZone:(id)a3
{
  BRCPQLConnection *db;
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  unint64_t localDiffs;
  void *v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;

  db = self->_db;
  v5 = a3;
  if ((-[BRCPQLConnection isBatchSuspended](db, "isBatchSuspended") & 1) == 0)
  {
    brc_bread_crumbs();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      -[BRCLocalItem createSyncUpJob].cold.7();

  }
  -[BRCAccountSession syncUpScheduler](self->_session, "syncUpScheduler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "finishSyncUpForItem:inZone:success:", self, v5, 1);

  if (-[BRCItemID isDocumentsFolder](self->_itemID, "isDocumentsFolder"))
  {
    brc_bread_crumbs();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      -[BRCLocalItem markLatestSyncRequestRejectedInZone:].cold.1();

    -[BRCAppLibrary clearStateBits:](self->_appLibrary, "clearStateBits:", 0x4000000);
LABEL_10:
    self->_localDiffs = 0xFF007FF3FF7FFFLL;
    -[BRCLocalItem createSyncUpJob](self, "createSyncUpJob");
    return;
  }
  localDiffs = self->_localDiffs;
  if ((-[BRCLocalItem metadataSyncUpMask:](self, "metadataSyncUpMask:", 0) & localDiffs) != 0)
  {
    brc_bread_crumbs();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      -[BRCLocalItem markLatestSyncRequestRejectedInZone:].cold.2();

    goto LABEL_10;
  }
  self->_syncUpState = 1;
}

- (BOOL)markLatestSyncRequestAcknowledgedInZone:(id)a3
{
  BRCPQLConnection *db;
  id v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  NSObject *v10;
  void *v11;
  unint64_t localDiffs;
  unsigned int syncUpState;
  void *v14;
  NSObject *v15;
  void *v16;
  int v17;
  void *v18;
  void *v20;
  NSObject *v21;
  void *v22;
  NSObject *v23;

  db = self->_db;
  v5 = a3;
  if ((-[BRCPQLConnection isBatchSuspended](db, "isBatchSuspended") & 1) == 0)
  {
    brc_bread_crumbs();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
      -[BRCLocalItem createSyncUpJob].cold.7();

  }
  -[BRCAccountSession syncUpScheduler](self->_session, "syncUpScheduler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "finishSyncUpForItem:inZone:success:", self, v5, 1);

  -[BRCAccountSession syncUpScheduler](self->_session, "syncUpScheduler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isItemPendingSyncUp:", self);

  if (v8)
  {
    brc_bread_crumbs();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      -[BRCLocalItem markLatestSyncRequestAcknowledgedInZone:].cold.1();

    if (-[BRCLocalItem isSharedToMeChildItem](self, "isSharedToMeChildItem"))
    {
      -[BRCAccountSession containerScheduler](self->_session, "containerScheduler");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "scheduleSyncUpForSideCar");
LABEL_16:

    }
  }
  else
  {
    localDiffs = self->_localDiffs;
    if (((-[BRCLocalItem metadataSyncUpMask:](self, "metadataSyncUpMask:", 0) | 0x1000000000000000) & localDiffs) != 0)
    {
      syncUpState = self->_syncUpState;
      if (syncUpState == 4)
      {
        brc_bread_crumbs();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
          -[BRCLocalItem markLatestSyncRequestAcknowledgedInZone:].cold.2();

        -[BRCLocalItem createSyncUpJob](self, "createSyncUpJob");
      }
      else if (!syncUpState)
      {
        brc_bread_crumbs();
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
          -[BRCLocalItem markLatestSyncRequestAcknowledgedInZone:].cold.3();

      }
    }
    else
    {
      self->_syncUpState = 0;
    }
    -[BRCLocalItem appLibrary](self, "appLibrary");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "shouldEvictUploadedItems");

    if (v17)
    {
      -[BRCLocalItem appLibrary](self, "appLibrary");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "tracker");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[BRCLocalItem evictInTask:options:error:](self, "evictInTask:options:error:", v18, 5, 0);

      goto LABEL_16;
    }
  }
  return v8 ^ 1;
}

- (void)resetWhileKeepingClientItemsAndWantsUnlink:(BOOL)a3
{
  self->_orig->_syncUpState = 0;
  -[BRCLocalItem markItemForgottenByServer](self, "markItemForgottenByServer", a3);
  self->_localDiffs |= 0x400000000000000uLL;
}

- (void)markItemForgottenByServer
{
  NSNumber *knownByServer;

  knownByServer = self->_knownByServer;
  self->_knownByServer = 0;

  -[BRCStatInfo setCkInfo:](self->_st, "setCkInfo:", 0);
}

- (void)handleUnknownItemError
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  NSObject *v8;
  unint64_t sharingOptions;
  BRCItemID *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  -[BRCStatInfo ckInfo](self->_st, "ckInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 || !-[BRCLocalItem isSharedToMeChildItem](self, "isSharedToMeChildItem"))
  {

    goto LABEL_8;
  }
  -[BRCClientZone mangledID](self->_clientZone, "mangledID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "changeItemIDOnUnknownItem");

  if (!v6)
  {
LABEL_8:
    -[BRCLocalItem markItemForgottenByServer](self, "markItemForgottenByServer");
    goto LABEL_9;
  }
  brc_bread_crumbs();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 138412290;
    v12 = v7;
    _os_log_impl(&dword_1CBD43000, v8, OS_LOG_TYPE_DEFAULT, "[WARNING] Unknown item must need an itemID change%@", (uint8_t *)&v11, 0xCu);
  }

  sharingOptions = self->_sharingOptions;
  v10 = objc_alloc_init(BRCItemID);
  -[BRCLocalItem learnItemID:serverItem:path:markLost:](self, "learnItemID:serverItem:path:markLost:", v10, 0, 0, 0);

  self->_sharingOptions = sharingOptions;
  self->_localDiffs |= 0x8000000000000000;
LABEL_9:
  -[BRCClientZone scheduleSyncDownFirst](self->_clientZone, "scheduleSyncDownFirst");
}

- (void)markDead
{
  void *v3;
  _BOOL4 v4;
  BRCLocalStatInfo *st;
  void *v6;

  -[BRCLocalStatInfo stagedFileID](self->_st, "stagedFileID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    -[BRCLocalItem clearFromStage](self, "clearFromStage");
  v4 = -[BRCLocalItem isSharedToMeTopLevelItem](self, "isSharedToMeTopLevelItem");
  st = self->_st;
  if (v4)
  {
    -[BRCAppLibrary documentsFolderItemID](self->_appLibrary, "documentsFolderItemID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCLocalStatInfo _markDeadAsSharedTopLevelItemWithDocumentsItemID:](st, "_markDeadAsSharedTopLevelItemWithDocumentsItemID:", v6);

  }
  else
  {
    -[BRCLocalStatInfo _markDead](self->_st, "_markDead");
  }
  -[BRCLocalStatInfo _moveItemAsideWithUUIDString](self->_st, "_moveItemAsideWithUUIDString");
  self->_isUserVisible = 0;
}

- (void)markNeedsDeleteForRescheduleOfItem:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[BRCAccountSession applyScheduler](self->_session, "applyScheduler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[BRCLocalItem isDead](self, "isDead"))
    -[BRCLocalItem markDead](self, "markDead");
  self->_forceDelete = 1;
  if (v5)
    objc_msgSend(v4, "createApplyJobFromServerItem:localItem:state:kind:", v5, 0, 1, 1);

}

- (void)markNeedsDeleteWhenAlreadyDeadInServerTruth
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: self.isDead && self.isDeadOrMissingInServerTruth%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)markNeedsDeleteForItemIDTransfer
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: self.isDead%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)moveAsideLocally
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: _st.state == BRC_ITEM_STATE_TOMBSTONE || _st.state == BRC_ITEM_STATE_LOST || _st.state == BRC_ITEM_STATE_LOST_ZOMBIE%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)markRemovedFromFilesystemForServerEdit:(BOOL)a3
{
  BRCClientZone *clientZone;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;

  -[BRCLocalItem markDead](self, "markDead");
  if (!a3)
  {
    if (-[BRCLocalItem isSharedToMeChildItem](self, "isSharedToMeChildItem")
      && -[BRCLocalItem isKnownByServer](self, "isKnownByServer"))
    {
      clientZone = self->_clientZone;
      -[BRCLocalItem parentItemIDInZone](self, "parentItemIDInZone");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[BRCClientZone itemByItemID:](clientZone, "itemByItemID:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if ((objc_msgSend(v7, "isLost") & 1) == 0)
      {
        objc_msgSend(v7, "db");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "itemID");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "clientZone");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "dbRowID");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = (void *)objc_msgSend(v8, "numberWithSQL:", CFSTR("SELECT 1 FROM client_items WHERE item_parent_id = %@ AND item_parent_zone_rowid = %@ AND item_state = 0"), v9, v11);

        if (objc_msgSend(v12, "BOOLValue"))
        {
          brc_bread_crumbs();
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
            -[BRCLocalItem markRemovedFromFilesystemForServerEdit:].cold.1();

          objc_msgSend(v7, "markLostClearGenerationID:backoffMode:", 0, 1);
          objc_msgSend(v7, "saveToDB");
        }

      }
    }
    -[BRCLocalItem markNeedsUploadOrSyncingUp](self, "markNeedsUploadOrSyncingUp");
  }
}

- (void)updateStatMetadataFromServerItem:(id)a3
{
  BRCLocalStatInfo *st;
  id v4;

  st = self->_st;
  objc_msgSend(a3, "st");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[BRCLocalStatInfo _updateStatMeta:](st, "_updateStatMeta:", v4);

}

- (void)updateItemMetadataFromServerItem:(id)a3 appliedSharingPermission:(BOOL)a4
{
  id v6;
  void *v7;
  int sharingOptions;
  unint64_t v9;
  BRCZoneRowID *parentZoneRowID;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  BRCUserRowID *v18;
  BRCUserRowID *ownerKey;

  v6 = a3;
  v7 = v6;
  if (!a4
    && (sharingOptions = self->_sharingOptions,
        ((objc_msgSend(v6, "sharingOptions") ^ sharingOptions) & 0x20) != 0))
  {
    v9 = objc_msgSend(v7, "sharingOptions") ^ 0x20;
  }
  else
  {
    v9 = objc_msgSend(v7, "sharingOptions");
  }
  self->_sharingOptions = v9;
  if ((v9 & 4) == 0)
  {
    parentZoneRowID = self->_parentZoneRowID;
    -[BRCClientZone dbRowID](self->_clientZone, "dbRowID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(parentZoneRowID) = -[BRCZoneRowID br_isEqualToNumber:](parentZoneRowID, "br_isEqualToNumber:", v11);

    if ((_DWORD)parentZoneRowID)
    {
      brc_bread_crumbs();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        -[BRCLocalItem updateItemMetadataFromServerItem:appliedSharingPermission:].cold.1();

      -[BRCClientZone db](self->_clientZone, "db");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "parentItemIDOnFS");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[BRCClientZone dbRowID](self->_clientZone, "dbRowID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (void *)objc_msgSend(v14, "numberWithSQL:", CFSTR("SELECT item_sharing_options FROM client_items WHERE item_id = %@ AND zone_rowid = %@"), v15, v16);

      self->_sharingOptions = self->_sharingOptions & 0xFFFFFFFFFFFFFF83 | objc_msgSend(v17, "longLongValue") & 0x78;
    }
  }
  objc_msgSend(v7, "ownerKey");
  v18 = (BRCUserRowID *)objc_claimAutoreleasedReturnValue();
  ownerKey = self->_ownerKey;
  self->_ownerKey = v18;

  -[BRCLocalItem _fixSpotlightAttributeIfNecessaryAtPath:](self, "_fixSpotlightAttributeIfNecessaryAtPath:", 0);
}

- (id)computedDestinationFilenameFromServerItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;
  void *v15;

  v4 = a3;
  objc_msgSend(v4, "st");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "logicalName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCLocalItem st](self, "st");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "logicalNameWithoutLocalBounce");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v6, "isEqualToString:", v8))
  {

    goto LABEL_5;
  }
  objc_msgSend(v4, "parentItemIDOnFS");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCLocalItem st](self, "st");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "parentID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v9, "isEqualToItemID:", v11);

  if (!v12)
  {
LABEL_5:
    objc_msgSend(v4, "st");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "representableName");
    v14 = objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  -[BRCLocalItem st](self, "st");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "logicalName");
  v14 = objc_claimAutoreleasedReturnValue();
LABEL_6:
  v15 = (void *)v14;

  return v15;
}

- (void)updateStructuralCKInfoFromServerItem:(id)a3
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
  BRFieldCKInfo *v14;
  BRFieldCKInfo *sideCarCKInfo;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  NSObject *v22;
  int v23;
  void *v24;
  __int16 v25;
  id v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "st");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "ckInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  brc_bread_crumbs();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v6, "etag");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 138412802;
    v24 = v18;
    v25 = 2112;
    v26 = v4;
    v27 = 2112;
    v28 = v7;
    _os_log_debug_impl(&dword_1CBD43000, v8, OS_LOG_TYPE_DEBUG, "[DEBUG] updating st-etag:%@ from server item: %@%@", (uint8_t *)&v23, 0x20u);

  }
  if (!v4)
  {
    brc_bread_crumbs();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
      -[BRCLocalItem updateStructuralCKInfoFromServerItem:].cold.3();

  }
  if ((objc_msgSend(v4, "isSharedToMeTopLevelItem") & 1) == 0 && !v6)
  {
    brc_bread_crumbs();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
      -[BRCLocalItem updateStructuralCKInfoFromServerItem:].cold.2();

  }
  if (-[BRCLocalItem isDocumentBeingCopiedToNewZone](self, "isDocumentBeingCopiedToNewZone"))
  {
    -[BRCStatInfo ckInfo](self->_st, "ckInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "etagBeforeCrossZoneMove");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setEtagBeforeCrossZoneMove:", v10);

  }
  -[BRCLocalStatInfo _setCKInfo:](self->_st, "_setCKInfo:", v6);
  objc_msgSend(v4, "st");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "creatorRowID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCStatInfo setCreatorRowID:](self->_st, "setCreatorRowID:", v12);

  if (-[BRCLocalItem isSharedToMeChildItem](self, "isSharedToMeChildItem"))
  {
    objc_msgSend(v4, "sideCarInfo");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "ckInfo");
    v14 = (BRFieldCKInfo *)objc_claimAutoreleasedReturnValue();
    sideCarCKInfo = self->_sideCarCKInfo;
    self->_sideCarCKInfo = v14;

    brc_bread_crumbs();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      -[BRCLocalItem updateStructuralCKInfoFromServerItem:].cold.1();

  }
}

- (BOOL)needsReading
{
  return self->_syncUpState == 2;
}

- (BOOL)needsUpload
{
  return self->_syncUpState == 3;
}

- (BOOL)needsSyncUp
{
  return self->_syncUpState == 4;
}

- (BOOL)isReadAndUploaded
{
  unsigned int syncUpState;
  _BOOL4 v3;
  void *v4;
  NSObject *v5;

  syncUpState = self->_syncUpState;
  if (syncUpState >= 5)
  {
    brc_bread_crumbs();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      -[BRCLocalItem isReadAndUploaded].cold.1();

    LOBYTE(v3) = 0;
  }
  else
  {
    return (0x13u >> syncUpState) & 1;
  }
  return v3;
}

- (BOOL)isIdleOrRejected
{
  return self->_syncUpState < 2;
}

- (BOOL)isRejected
{
  return self->_syncUpState == 1;
}

- (BOOL)startDownloadInTask:(id)a3 options:(unint64_t)a4 etagIfLoser:(id)a5 stageFileName:(id)a6 error:(id *)a7
{
  int v10;
  id v12;
  id v13;
  id v14;
  void *v15;
  NSObject *v16;
  _BOOL4 v17;
  char *v18;
  NSObject *v19;
  char *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  const char *v31;
  void *v32;
  NSObject *v33;
  void *v34;
  char *v35;
  void *v36;
  uint64_t v37[3];
  uint8_t buf[4];
  const char *v39;
  __int16 v40;
  const char *v41;
  __int16 v42;
  void *v43;
  __int16 v44;
  uint64_t v45;
  __int16 v46;
  void *v47;
  uint64_t v48;

  v10 = a4;
  v48 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a5;
  v14 = a6;
  memset(v37, 0, sizeof(v37));
  __brc_create_section(0, (uint64_t)"-[BRCLocalItem startDownloadInTask:options:etagIfLoser:stageFileName:error:]", 3423, v37);
  brc_bread_crumbs();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    v28 = v37[0];
    -[BRCLocalItem appLibrary](self, "appLibrary");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "logName");
    v35 = (char *)objc_claimAutoreleasedReturnValue();
    -[BRCLocalItem itemID](self, "itemID");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    BRCPrettyPrintBitmap();
    v30 = objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134219010;
    v39 = (const char *)v28;
    v40 = 2112;
    v41 = v35;
    v42 = 2112;
    v43 = v29;
    v44 = 2112;
    v34 = (void *)v30;
    v45 = v30;
    v46 = 2112;
    v47 = v15;
    _os_log_debug_impl(&dword_1CBD43000, v16, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx request to download client item %@:%@ with options %@%@", buf, 0x34u);

  }
  if ((~v10 & 9) == 0)
  {
    brc_bread_crumbs();
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_FAULT))
      -[BRCLocalItem startDownloadInTask:options:etagIfLoser:stageFileName:error:].cold.1();

  }
  v17 = -[BRCLocalItem isDead](self, "isDead", v34);
  if (v17)
  {
    brc_bread_crumbs();
    v18 = (char *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      -[BRCLocalItem itemID](self, "itemID");
      v20 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v39 = v20;
      v40 = 2112;
      v41 = v18;
      _os_log_impl(&dword_1CBD43000, v19, OS_LOG_TYPE_DEFAULT, "[WARNING] ignoring download request for %@ because item is dead%@", buf, 0x16u);

    }
    v21 = (void *)MEMORY[0x1E0CB35C8];
    -[BRCLocalItem itemID](self, "itemID");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "itemIDString");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "brc_errorItemNotFound:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24)
    {
      brc_bread_crumbs();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, (os_log_type_t)0x90u))
      {
        v31 = "(passed to caller)";
        *(_DWORD *)buf = 136315906;
        v39 = "-[BRCLocalItem startDownloadInTask:options:etagIfLoser:stageFileName:error:]";
        v40 = 2080;
        if (!a7)
          v31 = "(ignored by caller)";
        v41 = v31;
        v42 = 2112;
        v43 = v24;
        v44 = 2112;
        v45 = (uint64_t)v25;
        _os_log_error_impl(&dword_1CBD43000, v26, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
      }

    }
    if (a7)
      *a7 = objc_retainAutorelease(v24);

  }
  __brc_leave_section(v37);

  return !v17;
}

- (unint64_t)dbRowID
{
  return self->_dbRowID;
}

- (BRCItemID)itemID
{
  return self->_itemID;
}

- (BRCUserRowID)ownerKey
{
  return self->_ownerKey;
}

- (BRCLocalStatInfo)st
{
  return self->_st;
}

- (unsigned)syncUpState
{
  return self->_syncUpState;
}

- (BRCLocalItem)orig
{
  return self->_orig;
}

- (unint64_t)localDiffs
{
  return self->_localDiffs;
}

- (unint64_t)notifsRank
{
  return self->_notifsRank;
}

- (BRCServerZone)serverZone
{
  return self->_serverZone;
}

- (BRCClientZone)clientZone
{
  return self->_clientZone;
}

- (BRCAccountSession)session
{
  return self->_session;
}

- (unint64_t)sharingOptions
{
  return self->_sharingOptions;
}

- (void)setSharingOptions:(unint64_t)a3
{
  self->_sharingOptions = a3;
}

- (void)setAppLibrary:(id)a3
{
  objc_storeStrong((id *)&self->_appLibrary, a3);
}

- (BRCPQLConnection)db
{
  return self->_db;
}

- (BOOL)isUserVisible
{
  return self->_isUserVisible;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong(&self->_serverPathMatchID, 0);
  objc_storeStrong((id *)&self->_isInDocumentScope, 0);
  objc_storeStrong((id *)&self->_sideCarCKInfo, 0);
  objc_storeStrong((id *)&self->_parentFileID, 0);
  objc_storeStrong((id *)&self->_knownByServer, 0);
  objc_storeStrong((id *)&self->_minimumSupportedOSRowID, 0);
  objc_storeStrong((id *)&self->_orig, 0);
  objc_storeStrong((id *)&self->_st, 0);
  objc_storeStrong((id *)&self->_ownerKey, 0);
  objc_storeStrong((id *)&self->_parentZoneRowID, 0);
  objc_storeStrong((id *)&self->_itemID, 0);
  objc_storeStrong((id *)&self->_appLibrary, 0);
  objc_storeStrong((id *)&self->_db, 0);
  objc_storeStrong((id *)&self->_clientZone, 0);
}

- (id)baseStructureRecord
{
  void *v3;
  NSObject *v4;
  void *v5;
  id v6;
  void *v7;

  if (-[BRCLocalItem isSharedToMeTopLevelItem](self, "isSharedToMeTopLevelItem"))
  {
    brc_bread_crumbs();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
      -[BRCLocalItem(CKConversions) baseStructureRecord].cold.1();

    v5 = 0;
  }
  else
  {
    v6 = objc_alloc(MEMORY[0x1E0C95048]);
    -[BRCLocalItem structureRecordID](self, "structureRecordID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v6, "initWithRecordType:recordID:", CFSTR("structure"), v7);

  }
  return v5;
}

- (id)structureRecordBeingDeadInServerTruth:(BOOL)a3 stageID:(id)a4 shouldPCSChainStatus:(unsigned __int8)a5 saltGetter:(id)a6 childBasehashSaltGetter:(id)a7
{
  uint64_t v9;
  _BOOL8 v10;
  id v12;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  unint64_t localDiffs;
  char v18;
  void *v19;
  void *v20;
  NSObject *v21;
  id v23;

  v9 = a5;
  v10 = a3;
  v12 = a4;
  v13 = a6;
  v14 = a7;
  if (-[BRCLocalItem isSharedToMeTopLevelItem](self, "isSharedToMeTopLevelItem"))
  {
    brc_bread_crumbs();
    v15 = (id)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
      -[BRCLocalItem(CKConversions) baseStructureRecord].cold.1();
LABEL_9:
    v19 = 0;
    goto LABEL_10;
  }
  -[BRCLocalItem baseStructureRecord](self, "baseStructureRecord");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  localDiffs = self->_localDiffs;
  v23 = 0;
  v18 = objc_msgSend(v15, "serializeStatInfo:diffs:stageID:deadInServerTruth:shouldPCSChainStatus:basehashSaltGetter:childBasehashSaltGetter:error:", self, localDiffs, v12, v10, v9, v13, v14, &v23);
  v16 = v23;
  if ((v18 & 1) == 0)
  {
    brc_bread_crumbs();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      -[BRCLocalItem(CKConversions) structureRecordBeingDeadInServerTruth:stageID:shouldPCSChainStatus:saltGetter:childBasehashSaltGetter:].cold.2();

    goto LABEL_9;
  }
  -[BRCLocalItem serializeStructuralPluginHints:](self, "serializeStructuralPluginHints:", v15);
  v15 = v15;
  v19 = v15;
LABEL_10:

  return v19;
}

- (id)sideCarRecordID
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;

  if (-[BRCLocalItem isSharedToMeChildItem](self, "isSharedToMeChildItem"))
  {
    -[BRCLocalItem itemID](self, "itemID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCLocalItem serverZone](self, "serverZone");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "asSharedZone");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "sideCarRecordIDWithZone:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    brc_bread_crumbs();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      -[BRCLocalItem(CKConversions) sideCarRecordID].cold.1();

    v6 = 0;
  }
  return v6;
}

- (id)baseSideCarRecord
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc(MEMORY[0x1E0C95048]);
  -[BRCLocalItem sideCarRecordID](self, "sideCarRecordID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithRecordType:recordID:", CFSTR("perParticipantMetadata"), v4);

  return v5;
}

- (void)serializeStructuralPluginHints:(id)a3
{
  id v4;
  _BOOL4 v5;
  void *v6;
  BRCLocalItem *v7;
  BRCLocalItem *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
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
  NSObject *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  char v29;
  void *v30;
  uint8_t buf[4];
  BRCLocalItem *v32;
  __int16 v33;
  BRCLocalItem *v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[BRCLocalItem isFromInitialScan](self, "isFromInitialScan");
  -[BRCLocalItem serverPathMatchItemID](self, "serverPathMatchItemID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[BRCClientZone itemByItemID:](self->_clientZone, "itemByItemID:", v6);
    v7 = (BRCLocalItem *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (!v7 || -[BRCLocalItem isReserved](v7, "isReserved"))
      goto LABEL_4;
    if (!-[BRCLocalItem isDead](v8, "isDead") && -[BRCLocalItem isFault](v8, "isFault"))
    {
      -[BRCLocalItem st](v8, "st");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "parentID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[BRCStatInfo parentID](self->_st, "parentID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v12, "isEqualToItemID:", v13) & 1) != 0)
      {
        -[BRCLocalItem st](v8, "st");
        v30 = v11;
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "logicalName");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[BRCLocalStatInfo logicalName](self->_st, "logicalName");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = objc_msgSend(v15, "isEqualToString:", v16);

        if ((v29 & 1) != 0)
        {
LABEL_4:
          v9 = 0;
          v10 = 0;
          goto LABEL_25;
        }
      }
      else
      {

      }
    }
    -[BRCLocalItem structureRecordID](v8, "structureRecordID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    brc_bread_crumbs();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412802;
      v32 = self;
      v33 = 2112;
      v34 = v8;
      v35 = 2112;
      v36 = v18;
      _os_log_debug_impl(&dword_1CBD43000, v19, OS_LOG_TYPE_DEBUG, "[DEBUG] path match info for %@ is %@%@", buf, 0x20u);
    }

    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C950C0]), "initWithRecordID:action:", v17, 0);
    -[BRCLocalItem st](v8, "st");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "ckInfo");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "etag");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      if (v10)
      {
LABEL_24:

LABEL_25:
        if (!v5)
          goto LABEL_26;
        goto LABEL_28;
      }
    }
    else
    {
      brc_bread_crumbs();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412802;
        v32 = v8;
        v33 = 2112;
        v34 = self;
        v35 = 2112;
        v36 = v22;
        _os_log_impl(&dword_1CBD43000, v23, OS_LOG_TYPE_DEFAULT, "[WARNING] we have no etag for %@\npath matching: %@%@", buf, 0x20u);
      }

      if (v10)
        goto LABEL_24;
    }
    brc_bread_crumbs();
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      v32 = v8;
      v33 = 2112;
      v34 = self;
      v35 = 2112;
      v36 = v24;
      _os_log_impl(&dword_1CBD43000, v25, OS_LOG_TYPE_DEFAULT, "[WARNING] we have no reference for %@\npath matching: %@%@", buf, 0x20u);
    }

    goto LABEL_24;
  }
  v9 = 0;
  v10 = 0;
  if (!v5)
  {
LABEL_26:
    if (!v10 || !v9)
      goto LABEL_37;
  }
LABEL_28:
  objc_msgSend(v4, "pluginFields");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (v26)
  {
    objc_msgSend(v4, "pluginFields");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = (void *)objc_msgSend(v27, "mutableCopy");

  }
  else
  {
    v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 3);
  }

  if (v5)
    objc_msgSend(v28, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("br_initialItem"));
  if (v10 && v9)
  {
    objc_msgSend(v28, "setObject:forKeyedSubscript:", v10, CFSTR("br_pathMatchID"));
    objc_msgSend(v28, "setObject:forKeyedSubscript:", v9, CFSTR("br_pathMatchEtag"));
  }
  objc_msgSend(v4, "setPluginFields:", v28);

LABEL_37:
}

- (id)structureRecordID
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  BRCServerZone *serverZone;
  void *v9;
  void *v10;

  if (-[BRCLocalItem isSharedToMeTopLevelItem](self, "isSharedToMeTopLevelItem"))
  {
    brc_bread_crumbs();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
      -[BRCLocalItem(CKConversions) structureRecordID].cold.1();

    v5 = 0;
  }
  else
  {
    -[BRCLocalItem itemID](self, "itemID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[BRCStatInfo type](self->_st, "type");
    serverZone = self->_serverZone;
    if (-[BRCLocalItem isBRAlias](self, "isBRAlias"))
    {
      -[BRCLocalItem asBRAlias](self, "asBRAlias");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "targetClientZone");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "structureRecordIDForItemType:zone:aliasTargetZoneIsShared:", v7, serverZone, objc_msgSend(v10, "isSharedZone"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(v6, "structureRecordIDForItemType:zone:aliasTargetZoneIsShared:", v7, serverZone, 1);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  return v5;
}

- (id)jobsDescription
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("r:%lld"), -[BRCLocalItem dbRowID](self, "dbRowID"));
}

- (id)matchingJobsWhereSQLClause
{
  return (id)objc_msgSend(MEMORY[0x1E0DE81D0], "formatInjection:", CFSTR("throttle_id = %lld"), -[BRCLocalItem dbRowID](self, "dbRowID"));
}

void __63__BRCLocalItem_LegacyAdditions__updateXattrInfoFromPath_error___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: cv%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __63__BRCLocalItem_LegacyAdditions__updateXattrInfoFromPath_error___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: st%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __63__BRCLocalItem_LegacyAdditions__updateXattrInfoFromPath_error___block_invoke_cold_3()
{
  uint64_t v0;
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  OUTLINED_FUNCTION_11_0(*MEMORY[0x1E0C80C00]);
  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = *(_QWORD *)(*(_QWORD *)(v0 + 8) + 40);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4_1(&dword_1CBD43000, v1, v2, "[ERROR] unable to load the xattrs: %@%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_2();
}

void __51__BRCLocalItem_LegacyAdditions__fetchParentFileIDs__block_invoke_cold_1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_4_0();
  _os_log_error_impl(&dword_1CBD43000, v0, (os_log_type_t)0x90u, "[ERROR] Encountered circular parenting chain%@", v1, 0xCu);
  OUTLINED_FUNCTION_2();
}

void __51__BRCLocalItem_LegacyAdditions__fetchParentFileIDs__block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] UNREACHABLE: Circular parenting chain%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __74__BRCLocalItem_LegacyAdditions___contentXattrsHaveChangedAtRelativeAPath___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4_1(&dword_1CBD43000, v0, v1, "[ERROR] unable to load the xattrs: %@%@");
  OUTLINED_FUNCTION_2();
}

- (void)asBRAlias
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] UNREACHABLE: -asBRAlias called on a non alias%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)asDirectory
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] UNREACHABLE: -asDirectory called on a non directory%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)asDocument
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] UNREACHABLE: -asDocument called on a non document%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)asShareableItem
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] UNREACHABLE: -asShareableItem called on a non shareable item%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)asFSRoot
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] UNREACHABLE: -asFSRoot called on a non root%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)asSymlink
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] UNREACHABLE: -asSymlink called on a non symlink%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)asFinderBookmark
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] UNREACHABLE: -asFinderBookmark called on a non symlink%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)asShareAcceptationFault
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] UNREACHABLE: -asShareAcceptationFault called on a non fault%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)fileObjectID
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] UNREACHABLE: unknown item type%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)asSharedToMeTopLevelItem
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_1(&dword_1CBD43000, v0, v1, "[CRIT] UNREACHABLE: Asked to get the top-level item of a non shared top level item: %@%@");
  OUTLINED_FUNCTION_2();
}

- (void)inheritOSUpgradeNeededFromItem:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: !_minimumSupportedOSRowID%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)inheritOSUpgradeNeededFromItem:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: parentItem->_minimumSupportedOSRowID%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)markNeedsOSUpgradeToSyncUpWithName:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] UNREACHABLE: can't add the OS NAME%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)initFromPQLResultSet:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] UNREACHABLE: Local items must be initialized with initFromPQLResultSet:container:error:%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_initFromPQLResultSet:session:db:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: self.isReserved%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)sideCarInfo
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] UNREACHABLE: Asked for side car info on an item that doesn't have side cars%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)parentItemIDInZone
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: !self.itemID.isNonDesktopRoot%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)parentItemOnFS
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(0, "debugItemIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_4_2(&dword_1CBD43000, a2, v4, "[CRIT] UNREACHABLE: item without parentID under parent %@%@", v5);

  OUTLINED_FUNCTION_6();
}

- (void)_updateSyncUpSchedulerWithDiffs:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] Rescheduling upload for %@%@");
  OUTLINED_FUNCTION_2();
}

- (void)_updateSyncUpSchedulerWithDiffs:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_1(&dword_1CBD43000, v0, v1, "[DEBUG] Detected sync up state change%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_updateSyncUpSchedulerWithDiffs:.cold.3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_1(&dword_1CBD43000, v0, v1, "[CRIT] UNREACHABLE: Didn't detect the local sync up state change for %@%@");
  OUTLINED_FUNCTION_2();
}

- (void)_insertInDB:dbRowID:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: self.isReserved || _appLibrary%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_updateInDB:diffs:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: _st.ckInfo.etag == nil || [_orig.st.ckInfo.etagBeforeCrossZoneMove isEqualToString:_st.ckInfo.etag] || self.isDirectory%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_updateInDB:diffs:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: ![self.itemID isEqualToItemID:self.orig.itemID]%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_updateInDB:diffs:.cold.3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] Deleting old zone sync up job for a CZM item: %@%@");
  OUTLINED_FUNCTION_2();
}

void __30__BRCLocalItem_setOfParentIDs__block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] UNREACHABLE: Circular parenting chain%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_restorePreviousGlobalID:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] Existing server item %@%@");
  OUTLINED_FUNCTION_2();
}

- (void)saveToDBForServerEdit:keepAliases:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_1(&dword_1CBD43000, v0, v1, "[CRIT] UNREACHABLE: if we have a bounced logical name we should always have a physical name for %@%@");
  OUTLINED_FUNCTION_2();
}

- (void)saveToDBForServerEdit:keepAliases:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_1(&dword_1CBD43000, v0, v1, "[DEBUG] Item is already force-deleted, skipping save%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)saveToDBForServerEdit:keepAliases:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_1(&dword_1CBD43000, v0, v1, "[DEBUG] overwriting serverUpdate to YES because the item is moving to IDLE%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __50__BRCLocalItem_saveToDBForServerEdit_keepAliases___block_invoke_cold_1(_QWORD *a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = *a1;
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v1, v2, "[DEBUG] not dropping already reserved/dead/almost dead item from the working set %@%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_2();
}

void __50__BRCLocalItem_saveToDBForServerEdit_keepAliases___block_invoke_cold_2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_1(&dword_1CBD43000, v0, v1, "[CRIT] UNREACHABLE: there should be a fileObjectID for %@%@");
  OUTLINED_FUNCTION_2();
}

void __50__BRCLocalItem_saveToDBForServerEdit_keepAliases___block_invoke_cold_3()
{
  NSObject *v0;
  id v1;
  void *v2;
  uint64_t v3;
  uint8_t v4[24];
  uint64_t v5;

  OUTLINED_FUNCTION_9_0();
  v5 = *MEMORY[0x1E0C80C00];
  objc_msgSend(v1, "lastError");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_4_2(&dword_1CBD43000, v0, v3, "[CRIT] UNREACHABLE: saving items should really always work: %@%@", v4);

  OUTLINED_FUNCTION_6();
}

void __50__BRCLocalItem_saveToDBForServerEdit_keepAliases___block_invoke_cold_4(uint64_t a1, uint64_t a2, NSObject *a3)
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 134218242;
  *(_QWORD *)&v3[4] = a2;
  *(_WORD *)&v3[12] = 2112;
  *(_QWORD *)&v3[14] = a1;
  OUTLINED_FUNCTION_0(&dword_1CBD43000, a2, a3, "[DEBUG] Inserting item with rowid = %llu%@", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16]);
  OUTLINED_FUNCTION_2();
}

void __50__BRCLocalItem_saveToDBForServerEdit_keepAliases___block_invoke_cold_5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_1(&dword_1CBD43000, v0, v1, "[DEBUG] We received our first shared to me child item, schedulding side car sync%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __50__BRCLocalItem_saveToDBForServerEdit_keepAliases___block_invoke_cold_6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_1(&dword_1CBD43000, v0, v1, "[DEBUG] we don't have a corresponding alias item, and the diffs do not require alias creation, dropping the diffs%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __50__BRCLocalItem_saveToDBForServerEdit_keepAliases___block_invoke_cold_7()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_1(&dword_1CBD43000, v0, v1, "[DEBUG] Forcing sync up of side car zone when item changed path extension%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __50__BRCLocalItem_saveToDBForServerEdit_keepAliases___block_invoke_cold_8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_1(&dword_1CBD43000, v0, v1, "[DEBUG] this item changed significantly%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __50__BRCLocalItem_saveToDBForServerEdit_keepAliases___block_invoke_cold_9()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_1(&dword_1CBD43000, v0, v1, "[DEBUG] item went out of lost state%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __50__BRCLocalItem_saveToDBForServerEdit_keepAliases___block_invoke_cold_10()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_1(&dword_1CBD43000, v0, v1, "[DEBUG] item with a minimum supported OS just changed, checking if we need to reattempt upload%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __50__BRCLocalItem_saveToDBForServerEdit_keepAliases___block_invoke_cold_11()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_1(&dword_1CBD43000, v0, v1, "[DEBUG] Telling new app library about lost state%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __50__BRCLocalItem_saveToDBForServerEdit_keepAliases___block_invoke_cold_12()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_1(&dword_1CBD43000, v0, v1, "[DEBUG] Deleting tombstone because it's synced up%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __50__BRCLocalItem_saveToDBForServerEdit_keepAliases___block_invoke_cold_13()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_1(&dword_1CBD43000, v0, v1, "[DEBUG] Deleting tombstone because it's no known to server%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __50__BRCLocalItem_saveToDBForServerEdit_keepAliases___block_invoke_cold_14()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_1(&dword_1CBD43000, v0, v1, "[DEBUG] Not deleting until we send the delete to children%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __50__BRCLocalItem_saveToDBForServerEdit_keepAliases___block_invoke_cold_15()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_1(&dword_1CBD43000, v0, v1, "[DEBUG] Force deletion has been asked, comply%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

+ (void)computeUserVisibleStatusOfLiveItemWithParentVisible:parentIsNonDesktopRoot:parentScope:itemFilename:parentFilename:appLibrary:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: parentScope != BRC_ITEM_SCOPE_DATA || !parentVisible%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

+ (void)computeUserVisibleStatusOfLiveItemWithParentVisible:parentIsNonDesktopRoot:parentScope:itemFilename:parentFilename:appLibrary:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: !appLibrary.isCloudDocsAppLibrary%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)forceNeedsSyncUpWithoutDiffs
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] Forcing sync up of shared item in the trash %@%@");
  OUTLINED_FUNCTION_2();
}

- (void)markLatestSyncRequestRejectedInZone:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_1(&dword_1CBD43000, v0, v1, "[CRIT] UNREACHABLE: Rejected item %@ is documents folder.  Force syncing on all%@");
  OUTLINED_FUNCTION_2();
}

- (void)markLatestSyncRequestRejectedInZone:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] Rejected item %@ has meaningful local diffs.  Forcing sync on all%@");
  OUTLINED_FUNCTION_2();
}

- (void)markLatestSyncRequestAcknowledgedInZone:.cold.1()
{
  NSObject *v0;
  id v1;
  void *v2;
  uint64_t v3;
  uint8_t v4[24];
  uint64_t v5;

  OUTLINED_FUNCTION_9_0();
  v5 = *MEMORY[0x1E0C80C00];
  objc_msgSend(v1, "itemID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3_2(&dword_1CBD43000, v0, v3, "[DEBUG] we are still syncing %@%@", v4);

  OUTLINED_FUNCTION_6();
}

- (void)markLatestSyncRequestAcknowledgedInZone:.cold.2()
{
  NSObject *v0;
  void *v1;
  uint64_t v2;
  uint8_t v3[24];
  uint64_t v4;

  OUTLINED_FUNCTION_9_0();
  v4 = *MEMORY[0x1E0C80C00];
  BRCItemFieldsPrettyPrint();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3_2(&dword_1CBD43000, v0, v2, "[DEBUG] we still have diffs to send: %@%@", v3);

  OUTLINED_FUNCTION_6();
}

- (void)markLatestSyncRequestAcknowledgedInZone:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: _syncUpState != BRC_SUS_IDLE%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)markRemovedFromFilesystemForServerEdit:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_1(&dword_1CBD43000, v0, v1, "[DEBUG] Shared to me child item was removed so bumping lost throttle on its parent%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)updateItemMetadataFromServerItem:appliedSharingPermission:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_1(&dword_1CBD43000, v0, v1, "[DEBUG] Learning parent sharing options because there is no shareID on this item%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)updateStructuralCKInfoFromServerItem:.cold.1()
{
  NSObject *v0;
  id *v1;
  void *v2;
  uint64_t v3;
  uint8_t v4[24];
  uint64_t v5;

  OUTLINED_FUNCTION_9_0();
  v5 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*v1, "etag");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3_2(&dword_1CBD43000, v0, v3, "[DEBUG] Also updating side car ckinfo:%@%@", v4);

  OUTLINED_FUNCTION_6();
}

- (void)updateStructuralCKInfoFromServerItem:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: ckInfo%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)updateStructuralCKInfoFromServerItem:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: serverItem%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)isReadAndUploaded
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] UNREACHABLE: invalid sync up state%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)startDownloadInTask:options:etagIfLoser:stageFileName:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: (options & BRCDownloadDiscretionary) == 0 || (options & BRCDownloadUserInitiated) == 0%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

@end
