@implementation CKRecordID(BRCShareIDAdditions)

- (id)initShareIDWithItemID:()BRCShareIDAdditions zoneID:
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  NSObject *v11;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "itemIDString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    a1 = (id)objc_msgSend(a1, "initWithRecordName:zoneID:", v8, v7);
    v9 = a1;
  }
  else
  {
    brc_bread_crumbs();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      -[CKRecordID(BRCShareIDAdditions) initShareIDWithItemID:zoneID:].cold.1();

    v9 = 0;
  }

  return v9;
}

- (uint64_t)initShareIDWithShareableItem:()BRCShareIDAdditions
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v4 = a3;
  objc_msgSend(v4, "itemID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "serverZone");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "zoneID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(a1, "initShareIDWithItemID:zoneID:", v5, v7);

  return v8;
}

- (uint64_t)initShareIDWithRecordID:()BRCShareIDAdditions serverZone:
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v6, "zoneID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "session");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(a1, "initShareIDWithRecordID:zoneID:session:", v7, v8, v9);
  return v10;
}

- (uint64_t)initShareIDWithRecordID:()BRCShareIDAdditions zoneID:session:
{
  id v8;
  void *v9;
  uint64_t v10;

  v8 = a4;
  objc_msgSend(a3, "brc_itemIDWithSession:", a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(a1, "initShareIDWithItemID:zoneID:", v9, v8);

  return v10;
}

- (id)brc_shareZoneName
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "zoneID");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "zoneName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (BRCItemID)brc_shareItemID
{
  void *v1;
  BRCItemID *v2;

  objc_msgSend(a1, "recordName");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = -[BRCItemID initWithUUIDString:]([BRCItemID alloc], "initWithUUIDString:", v1);

  return v2;
}

+ (id)brc_fetchShareIDWithSharedItem:()BRCShareIDAdditions
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  NSObject *v23;
  void *v24;
  id v25;
  void *v26;
  uint8_t buf[4];
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "db");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "assertOnQueue");

  if ((objc_msgSend(v3, "sharingOptions") & 4) != 0)
  {
    v25 = objc_alloc(MEMORY[0x1E0C95070]);
    objc_msgSend(v3, "asShareableItem");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (void *)objc_msgSend(v25, "initShareIDWithShareableItem:", v26);

  }
  else
  {
    if ((objc_msgSend(v3, "sharingOptions") & 0x48) == 0)
    {
      objc_msgSend(v3, "clientZone");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "isSharedZone");

      if (!v6)
      {
        v24 = 0;
        goto LABEL_14;
      }
      brc_bread_crumbs();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v29 = v7;
        _os_log_impl(&dword_1CBD43000, v8, OS_LOG_TYPE_DEFAULT, "[WARNING] No share options set on an item which is clearly shared%@", buf, 0xCu);
      }

    }
    objc_msgSend(v3, "appLibrary");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "mangledID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "maxSyncPathDepth");

    objc_msgSend(v3, "db");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "st");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "parentID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "clientZone");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "dbRowID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "clientZone");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "dbRowID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_msgSend(v13, "itemIDWithSQL:", CFSTR(" WITH RECURSIVE item_parents (item_id, item_sharing_options, item_parent_id) AS(         SELECT item_id, item_sharing_options, item_parent_id FROM client_items           WHERE item_id = %@ AND zone_rowid = %@       UNION ALL          SELECT li.item_id, li.item_sharing_options, li.item_parent_id FROM client_items AS li     INNER JOIN item_parents AS p WHERE li.zone_rowid = %@ AND p.item_parent_id = li.item_id          LIMIT %u)        SELECT item_id FROM item_parents WHERE (item_sharing_options & 4) != 0"), v15, v17, v19, v12);

    if (v20)
    {
      v21 = objc_alloc(MEMORY[0x1E0C95070]);
      objc_msgSend(v3, "serverZone");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "zoneID");
      v23 = objc_claimAutoreleasedReturnValue();
      v24 = (void *)objc_msgSend(v21, "initShareIDWithItemID:zoneID:", v20, v23);
    }
    else
    {
      brc_bread_crumbs();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, (os_log_type_t)0x90u))
        +[CKRecordID(BRCShareIDAdditions) brc_fetchShareIDWithSharedItem:].cold.1();
      v24 = 0;
    }

  }
LABEL_14:

  return v24;
}

- (id)brc_collaborationIdentifierWithCachedCurrentUserRecordName:()BRCShareIDAdditions
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  id v11;
  void *v12;
  void *v13;
  NSObject *v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(a1, "zoneID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "zoneName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "recordName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "zoneID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "ownerName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0C94730]);

  if ((v10 & 1) == 0)
  {
    objc_msgSend(a1, "zoneID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "ownerName");
    v11 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_5;
  }
  if (v4)
  {
    v11 = v4;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_%@_%@"), v6, v7, v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  brc_bread_crumbs();
  v11 = (id)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v17 = a1;
    v18 = 2112;
    v19 = v11;
    _os_log_impl(&dword_1CBD43000, v15, OS_LOG_TYPE_DEFAULT, "[WARNING] No collaboration identifier can be computed yet for %@%@", buf, 0x16u);
  }

  v13 = 0;
LABEL_6:

  return v13;
}

- (void)initShareIDWithItemID:()BRCShareIDAdditions zoneID:.cold.1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_1();
  _os_log_fault_impl(&dword_1CBD43000, v0, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: itemID %@ has no share name%@", v1, 0x16u);
}

+ (void)brc_fetchShareIDWithSharedItem:()BRCShareIDAdditions .cold.1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_1CBD43000, v0, (os_log_type_t)0x90u, "[ERROR] Couldn't find root share for %@%@", v1, 0x16u);
}

@end
