@implementation CKRecordID(BRCItemAdditions)

- (void)sqliteBind:()BRCItemAdditions index:
{
  id v6;

  objc_msgSend(a1, "sqliteRepresentation");
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  sqlite3_bind_text(a3, a4, (const char *)objc_msgSend(v6, "UTF8String"), -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);

}

+ (uint64_t)newFromSqliteValue:()BRCItemAdditions
{
  void *v4;
  uint64_t v5;
  void *v7;
  NSObject *v8;

  if (sqlite3_value_type(a3) == 3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", sqlite3_value_text(a3));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0C95070]), "initWithSqliteRepresentation:", v4);

    return v5;
  }
  else
  {
    if (sqlite3_value_type(a3) != 5)
    {
      brc_bread_crumbs();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
        +[CKRecordID(BRCItemAdditions) newFromSqliteValue:].cold.1();

    }
    return 0;
  }
}

+ (uint64_t)newFromSqliteStatement:()BRCItemAdditions atIndex:
{
  void *v6;
  uint64_t v7;
  void *v9;
  NSObject *v10;

  if (sqlite3_column_type(a3, iCol) == 3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", sqlite3_column_text(a3, iCol));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0C95070]), "initWithSqliteRepresentation:", v6);

    return v7;
  }
  else
  {
    if (sqlite3_column_type(a3, iCol) != 5)
    {
      brc_bread_crumbs();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
        +[CKRecordID(BRCItemAdditions) newFromSqliteStatement:atIndex:].cold.1();

    }
    return 0;
  }
}

- (uint64_t)brc_isAppLibraryRootRecordID
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "recordName");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "hasPrefix:", CFSTR("directory/appData_"));

  return v2;
}

- (id)brc_appLibraryRootZoneName
{
  void *v2;
  void *v3;
  void *v5;
  NSObject *v6;

  if ((objc_msgSend(a1, "brc_isAppLibraryRootRecordID") & 1) == 0)
  {
    brc_bread_crumbs();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      -[CKRecordID(BRCItemAdditions) brc_appLibraryRootZoneName].cold.1();

  }
  objc_msgSend(a1, "recordName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "substringFromIndex:", objc_msgSend(CFSTR("directory/appData_"), "length"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (uint64_t)brc_isAppLibraryDocumentsRecordID
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "recordName");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "hasPrefix:", CFSTR("directory/appDocuments_"));

  return v2;
}

- (id)brc_appLibraryDocumentsZoneName
{
  void *v2;
  void *v3;
  void *v5;
  NSObject *v6;

  if ((objc_msgSend(a1, "brc_isAppLibraryDocumentsRecordID") & 1) == 0)
  {
    brc_bread_crumbs();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      -[CKRecordID(BRCItemAdditions) brc_appLibraryDocumentsZoneName].cold.1();

  }
  objc_msgSend(a1, "recordName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "substringFromIndex:", objc_msgSend(CFSTR("directory/appDocuments_"), "length"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)brc_isZoneRootRecordID
{
  void *v1;
  void *v2;
  char v3;
  _BOOL8 v4;

  objc_msgSend(a1, "recordName");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 0;
  if (objc_msgSend(v1, "hasPrefix:", CFSTR("directory/")))
  {
    objc_msgSend(v1, "substringFromIndex:", objc_msgSend(CFSTR("directory/"), "length"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("root"));

    if ((v3 & 1) != 0)
      v4 = 1;
  }

  return v4;
}

- (BRCItemID)_itemIDWithLibraryRowID:()BRCItemAdditions session:
{
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  BRCItemID *v12;
  void *v13;
  void *v14;
  BRCItemID *v15;
  void *v16;
  uint64_t v17;
  __CFString *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  BRCItemID *v23;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  NSObject *v33;
  void *v34;
  NSObject *v35;

  v6 = a3;
  v7 = a4;
  objc_msgSend(a1, "recordName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "hasPrefix:", CFSTR("directory/appDocuments_")))
  {
    objc_msgSend(v8, "substringFromIndex:", objc_msgSend(CFSTR("directory/appDocuments_"), "length"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "appLibraryByID:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dbRowID");
    v11 = objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      v12 = -[BRCItemID initAsDocumentsWithAppLibraryRowID:]([BRCItemID alloc], "initAsDocumentsWithAppLibraryRowID:", v11);
    }
    else
    {
      brc_bread_crumbs();
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_FAULT))
        -[CKRecordID(BRCItemAdditions) _itemIDWithLibraryRowID:session:].cold.1();

      v12 = 0;
    }

    v6 = v11;
    goto LABEL_28;
  }
  if (objc_msgSend(v8, "hasPrefix:", CFSTR("directory/appData_")))
  {
    objc_msgSend(v8, "substringFromIndex:", objc_msgSend(CFSTR("directory/appData_"), "length"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "appLibraryByID:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v14)
    {
      brc_bread_crumbs();
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_FAULT))
        -[BRCItemID(CKConversions) structureRecordIDForItemType:zone:aliasTargetZoneIsShared:].cold.2();

    }
    objc_msgSend(v14, "rootItemID");
    v15 = (BRCItemID *)objc_claimAutoreleasedReturnValue();
LABEL_8:
    v12 = v15;
LABEL_26:

    goto LABEL_27;
  }
  if (objc_msgSend(v8, "hasPrefix:", CFSTR("directory/")))
  {
    objc_msgSend(a1, "zoneID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D10E88]), "initWithRecordZoneID:", v13);
    if (objc_msgSend(v14, "isShared"))
    {
      objc_msgSend(v7, "clientZoneByMangledID:", v14);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "dbRowID");
      v17 = objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v17 = 0;
    }
    objc_msgSend(v8, "substringFromIndex:", objc_msgSend(CFSTR("directory/"), "length"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v19;
    if (!(v6 | v17)
      && ((objc_msgSend(v19, "isEqualToString:", BRCItemIDZoneRoot) & 1) != 0
       || objc_msgSend(v20, "isEqualToString:", BRCItemIDDocuments)))
    {
      brc_bread_crumbs();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
        -[CKRecordID(BRCItemAdditions) _itemIDWithLibraryRowID:session:].cold.3();

    }
    v12 = -[BRCItemID initWithString:libraryRowID:sharedZoneRowID:]([BRCItemID alloc], "initWithString:libraryRowID:sharedZoneRowID:", v20, v6, v17);

    goto LABEL_26;
  }
  if (objc_msgSend(v8, "hasPrefix:", CFSTR("documentStructure/")))
  {
    v18 = CFSTR("documentStructure/");
LABEL_22:
    objc_msgSend(v8, "substringFromIndex:", -[__CFString length](v18, "length"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = -[BRCItemID initWithUUIDString:]([BRCItemID alloc], "initWithUUIDString:", v13);
LABEL_23:
    v12 = v23;
LABEL_27:

    goto LABEL_28;
  }
  if (objc_msgSend(v8, "hasPrefix:", CFSTR("documentContent/")))
  {
    v18 = CFSTR("documentContent/");
    goto LABEL_22;
  }
  if (objc_msgSend(v8, "hasPrefix:", CFSTR("alias/")))
  {
    objc_msgSend(v8, "substringFromIndex:", objc_msgSend(CFSTR("alias/"), "length"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      brc_bread_crumbs();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
        -[CKRecordID(BRCItemAdditions) _itemIDWithLibraryRowID:session:].cold.1();

    }
    goto LABEL_36;
  }
  if (objc_msgSend(v8, "hasPrefix:", CFSTR("shareAlias/")))
  {
    objc_msgSend(v8, "substringFromIndex:", objc_msgSend(CFSTR("shareAlias/"), "length"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_36:
    v23 = -[BRCItemID initWithAliasUUID:]([BRCItemID alloc], "initWithAliasUUID:", v13);
    goto LABEL_23;
  }
  if (objc_msgSend(v8, "hasPrefix:", CFSTR("symlink/")))
  {
    v18 = CFSTR("symlink/");
    goto LABEL_22;
  }
  if (objc_msgSend(v8, "hasPrefix:", CFSTR("finderBookmark/")))
  {
    v18 = CFSTR("finderBookmark/");
    goto LABEL_22;
  }
  if (objc_msgSend(v8, "hasPrefix:", CFSTR("ppm_")))
  {
    objc_msgSend(a1, "recordName");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "componentsSeparatedByString:", CFSTR("/"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v13, "count") != 2)
    {
      brc_bread_crumbs();
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_FAULT))
        -[CKRecordID(BRCItemAdditions) _itemIDWithLibraryRowID:session:].cold.5();

      v12 = 0;
      goto LABEL_27;
    }
    objc_msgSend(v13, "lastObject");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[BRCItemID initWithUUIDString:]([BRCItemID alloc], "initWithUUIDString:", v14);
    goto LABEL_8;
  }
  brc_bread_crumbs();
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v29 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT))
    -[CKRecordID(BRCItemAdditions) _itemIDWithLibraryRowID:session:].cold.6();

  v12 = 0;
LABEL_28:

  return v12;
}

- (id)brc_itemIDWithSession:()BRCItemAdditions
{
  id v4;
  void *v5;
  void *v7;
  NSObject *v8;
  const char *v9;
  id v10;

  v4 = a3;
  v10 = 0;
  objc_msgSend(a1, "brc_itemIDWithSession:error:", v4, &v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5 && v10)
  {
    abc_report_panic_with_signature();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("brc_itemIDWithSession: are not supposed to trigger an error: %@"), v10);
    objc_claimAutoreleasedReturnValue();
    brc_bread_crumbs();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      -[CKRecordID(BRCItemAdditions) brc_itemIDWithSession:].cold.1();

    brc_append_system_info_to_message();
    v9 = (const char *)objc_msgSend(objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue()), "UTF8String");
    __assert_rtn("-[CKRecordID(BRCItemAdditions) brc_itemIDWithSession:]", "/Library/Caches/com.apple.xbs/Sources/CloudDocs_plugins/core/shared/sync/records/CKRecord+BRCItemAdditions.m", 716, v9);
  }

  return v5;
}

- (void)brc_itemIDWithSession:()BRCItemAdditions error:
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v14;
  void *v15;
  uint64_t v16;

  v6 = a3;
  objc_msgSend(a1, "zoneID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "zoneName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0D11150]) & 1) != 0)
  {
    v9 = 0;
  }
  else
  {
    objc_msgSend(v7, "ownerName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isEqualToString:", *MEMORY[0x1E0C94730]);

    if (!v11)
    {
      v9 = 0;
      goto LABEL_7;
    }
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D10E88]), "initWithRecordZoneID:", v7);
    objc_msgSend(v6, "appLibraryByMangledID:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "dbRowID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v12)
    {
      if (v9)
      {
        if (!a4)
          goto LABEL_8;
        objc_msgSend(MEMORY[0x1E0CB35C8], "br_errorWithDomain:code:description:", *MEMORY[0x1E0D10C90], 1004, CFSTR("Found appLibrary %@ with invalid dbRowID for zoneID %@"), v9, v7);
      }
      else
      {
        if (!a4)
          goto LABEL_8;
        objc_msgSend(MEMORY[0x1E0CB35C8], "br_errorWithDomain:code:description:", *MEMORY[0x1E0D10C90], 1004, CFSTR("Can't find appLibrary corresponding to zoneID %@"), v7, v16);
      }
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = *a4;
      *a4 = (void *)v14;

      a4 = 0;
      goto LABEL_8;
    }
  }

LABEL_7:
  objc_msgSend(v9, "dbRowID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_itemIDWithLibraryRowID:session:", v8, v6);
  a4 = (void **)objc_claimAutoreleasedReturnValue();
LABEL_8:

  return a4;
}

- (uint64_t)brc_itemType
{
  void *v1;
  char v2;
  void *v4;
  NSObject *v5;

  objc_msgSend(a1, "recordName");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v1, "hasPrefix:", CFSTR("directory/")) & 1) != 0)
  {
    v2 = 0;
  }
  else if ((objc_msgSend(v1, "hasPrefix:", CFSTR("documentStructure/")) & 1) != 0
         || (objc_msgSend(v1, "hasPrefix:", CFSTR("documentContent/")) & 1) != 0)
  {
    v2 = 1;
  }
  else if ((objc_msgSend(v1, "hasPrefix:", CFSTR("alias/")) & 1) != 0
         || (objc_msgSend(v1, "hasPrefix:", CFSTR("shareAlias/")) & 1) != 0)
  {
    v2 = 3;
  }
  else if ((objc_msgSend(v1, "hasPrefix:", CFSTR("symlink/")) & 1) != 0)
  {
    v2 = 5;
  }
  else if ((objc_msgSend(v1, "hasPrefix:", CFSTR("finderBookmark/")) & 1) != 0)
  {
    v2 = 6;
  }
  else
  {
    brc_bread_crumbs();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      -[CKRecordID(BRCItemAdditions) brc_itemType].cold.1();

    v2 = -1;
  }

  return v2;
}

- (uint64_t)locateSideCarServerZone:()BRCItemAdditions withSession:
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  BRCItemID *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void **v27;
  BRCItemID *v28;
  void *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  objc_msgSend(a1, "recordName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "substringFromIndex:", objc_msgSend(CFSTR("ppm_"), "length") - 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "pathComponents");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectAtIndexedSubscript:", 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sharedServerZoneRowIDsByOwnerNamePrefix:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "count"))
  {
    v13 = -[BRCItemID initWithUUIDString:]([BRCItemID alloc], "initWithUUIDString:", v11);
    objc_msgSend(v6, "serverDB");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v14, "fetch:", CFSTR("SELECT zone_rowid FROM server_items WHERE item_id = %@"), v13);

    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    v29 = v15;
    objc_msgSend(v15, "enumerateObjectsOfClass:", objc_opt_class());
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    if (v17)
    {
      v18 = v17;
      v27 = a3;
      v28 = v13;
      v19 = *(_QWORD *)v31;
      while (2)
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v31 != v19)
            objc_enumerationMutation(v16);
          v21 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * i);
          if (objc_msgSend(v12, "containsObject:", v21))
          {
            objc_msgSend(v6, "serverZoneByRowID:", v21);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "asSharedZone");
            v24 = objc_claimAutoreleasedReturnValue();

            v25 = *v27;
            *v27 = (void *)v24;

            v22 = 1;
            goto LABEL_12;
          }
        }
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
        if (v18)
          continue;
        break;
      }
      v22 = 0;
LABEL_12:
      v13 = v28;
    }
    else
    {
      v22 = 0;
    }

  }
  else
  {
    v22 = 0;
  }

  return v22;
}

+ (void)newFromSqliteValue:()BRCItemAdditions .cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: sqlite3_value_type(value) == SQLITE_NULL%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

+ (void)newFromSqliteStatement:()BRCItemAdditions atIndex:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: sqlite3_column_type(stmt, index) == SQLITE_NULL%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)brc_appLibraryRootZoneName
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: self.brc_isAppLibraryRootRecordID%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)brc_appLibraryDocumentsZoneName
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: self.brc_isAppLibraryDocumentsRecordID%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_itemIDWithLibraryRowID:()BRCItemAdditions session:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: libraryRowID%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_itemIDWithLibraryRowID:()BRCItemAdditions session:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: libraryRowID || sharedZoneRowID || !([identifier isEqualToString:BRCItemIDZoneRoot] || [identifier isEqualToString:BRCItemIDDocuments])%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_itemIDWithLibraryRowID:()BRCItemAdditions session:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] UNREACHABLE: Corrupt side car file%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_itemIDWithLibraryRowID:()BRCItemAdditions session:.cold.6()
{
  NSObject *v0;
  id v1;
  uint64_t v2;
  uint8_t v3[24];

  OUTLINED_FUNCTION_9_0();
  objc_msgSend(OUTLINED_FUNCTION_11_2(v1), "UTF8String");
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_4_2(&dword_1CBD43000, v0, v2, "[CRIT] UNREACHABLE: attempt to extract an itemID from '%s'%@", v3);
  OUTLINED_FUNCTION_3_0();
}

- (void)brc_itemIDWithSession:()BRCItemAdditions .cold.1()
{
  NSObject *v0;
  void *v1;
  uint64_t v2;
  uint8_t v3[24];
  uint64_t v4;

  OUTLINED_FUNCTION_9_0();
  v4 = *MEMORY[0x1E0C80C00];
  brc_append_system_info_to_message();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_4_2(&dword_1CBD43000, v0, v2, "[CRIT] %@%@", v3);

  OUTLINED_FUNCTION_6();
}

- (void)brc_itemType
{
  NSObject *v0;
  id v1;
  uint64_t v2;
  uint8_t v3[24];

  OUTLINED_FUNCTION_9_0();
  objc_msgSend(OUTLINED_FUNCTION_11_2(v1), "UTF8String");
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_4_2(&dword_1CBD43000, v0, v2, "[CRIT] UNREACHABLE: attempt to extract an itemType from '%s'%@", v3);
  OUTLINED_FUNCTION_3_0();
}

@end
