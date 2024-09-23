@implementation BRCPathToItemLookup

- (BRCPathToItemLookup)initWithRelativePath:(id)a3 db:(id)a4
{
  id v7;
  id v8;
  BRCPathToItemLookup *v9;
  BRCPathToItemLookup *v10;
  BRCRelativePath *v11;
  BRCRelativePath *pathOfItem;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)BRCPathToItemLookup;
  v9 = -[BRCPathToItemLookup init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_relpathOfFSEvent, a3);
    if ((objc_msgSend(v7, "isInPackage") & 1) != 0)
    {
      objc_msgSend(v7, "pathOfPackageRoot");
      v11 = (BRCRelativePath *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = (BRCRelativePath *)v7;
    }
    pathOfItem = v10->_pathOfItem;
    v10->_pathOfItem = v11;

    objc_storeStrong((id *)&v10->_db, a4);
  }

  return v10;
}

- (BRCPathToItemLookup)initWithRelativePath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BRCPathToItemLookup *v7;

  v4 = a3;
  objc_msgSend(v4, "appLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "db");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[BRCPathToItemLookup initWithRelativePath:db:](self, "initWithRelativePath:db:", v4, v6);

  return v7;
}

+ (id)lookupForRelativePath:(id)a3
{
  id v3;
  BRCPathToItemLookup *v4;

  v3 = a3;
  v4 = -[BRCPathToItemLookup initWithRelativePath:]([BRCPathToItemLookup alloc], "initWithRelativePath:", v3);

  return v4;
}

- (void)setByFileID:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  unint64_t v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;

  v5 = a3;
  if ((*(_BYTE *)&self->_fetched & 1) != 0)
  {
    brc_bread_crumbs();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      -[BRCPathToItemLookup setByFileID:].cold.2();

  }
  objc_msgSend(v5, "st");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fileID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "unsignedLongLongValue");
  v9 = -[BRCRelativePath fileID](self->_pathOfItem, "fileID");

  if (v8 != v9)
  {
    brc_bread_crumbs();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
      -[BRCPathToItemLookup setByFileID:].cold.1();

  }
  objc_storeStrong((id *)&self->_matchByFileIDGlobally, a3);
  *(_BYTE *)&self->_fetched |= 1u;
  -[BRCLocalItem clientZone](self->_matchByFileIDGlobally, "clientZone");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCPathToItemLookup clientZone](self, "clientZone");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v10, "isEqualToClientZone:", v11);

  if (v12)
    objc_storeStrong((id *)&self->_matchByFileID, a3);

}

- (void)setByDocumentID:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  unsigned int v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;

  v5 = a3;
  if ((*(_BYTE *)&self->_fetched & 2) != 0)
  {
    brc_bread_crumbs();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      -[BRCPathToItemLookup setByDocumentID:].cold.3();

  }
  if ((objc_msgSend(v5, "isDocument") & 1) == 0)
  {
    brc_bread_crumbs();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
      -[BRCPathToItemLookup setByDocumentID:].cold.2();

  }
  objc_msgSend(v5, "st");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "documentID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "unsignedLongLongValue");
  v9 = -[BRCRelativePath documentID](self->_pathOfItem, "documentID");

  if (v8 != v9)
  {
    brc_bread_crumbs();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
      -[BRCPathToItemLookup setByDocumentID:].cold.1();

  }
  objc_storeStrong((id *)&self->_matchByDocumentIDGlobally, a3);
  *(_BYTE *)&self->_fetched |= 2u;
  -[BRCLocalItem clientZone](self->_matchByDocumentIDGlobally, "clientZone");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCPathToItemLookup clientZone](self, "clientZone");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v10, "isEqualToClientZone:", v11);

  if (v12)
    objc_storeStrong((id *)&self->_matchByDocumentID, a3);

}

- (BRCDirectoryItem)parentItem
{
  char fetched;
  BRCRelativePath *pathOfItem;
  void *v5;
  void *v6;
  BRCDirectoryItem *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  BRCDirectoryItem *v11;
  BRCDirectoryItem *parentItem;
  BRCDirectoryItem *v13;
  BRCDirectoryItem *v14;
  BRCDirectoryItem *v15;

  fetched = (char)self->_fetched;
  if ((fetched & 8) == 0)
  {
    pathOfItem = self->_pathOfItem;
    *(_BYTE *)&self->_fetched = fetched | 8;
    switch(-[BRCRelativePath type](pathOfItem, "type"))
    {
      case 3u:
        -[BRCRelativePath appLibrary](self->_pathOfItem, "appLibrary");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "defaultClientZone");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "fetchZoneRootItemInDB:", self->_db);
        v7 = (BRCDirectoryItem *)objc_claimAutoreleasedReturnValue();
        goto LABEL_10;
      case 4u:
        -[BRCRelativePath session](self->_pathOfItem, "session");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "cloudDocsClientZone");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "defaultAppLibrary");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "fetchRootItemInDB:", self->_db);
        v11 = (BRCDirectoryItem *)objc_claimAutoreleasedReturnValue();
        parentItem = self->_parentItem;
        self->_parentItem = v11;

        goto LABEL_11;
      case 5u:
        -[BRCRelativePath appLibrary](self->_pathOfItem, "appLibrary");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "fetchRootItemInDB:", self->_db);
        v13 = (BRCDirectoryItem *)objc_claimAutoreleasedReturnValue();
        v14 = self->_parentItem;
        self->_parentItem = v13;

        goto LABEL_12;
      case 6u:
        -[BRCRelativePath session](self->_pathOfItem, "session");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "globalItemByFileID:db:", -[BRCRelativePath parentFileID](self->_pathOfItem, "parentFileID"), self->_db);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "asDirectory");
        v7 = (BRCDirectoryItem *)objc_claimAutoreleasedReturnValue();
LABEL_10:
        v15 = self->_parentItem;
        self->_parentItem = v7;

LABEL_11:
LABEL_12:

        break;
      default:
        brc_bread_crumbs();
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
          -[BRCPathToItemLookup parentItem].cold.1((id *)&self->_pathOfItem, (uint64_t)v8, v9);

        break;
    }
  }
  return self->_parentItem;
}

- (BRCLocalItem)byFileID
{
  if ((*(_BYTE *)&self->_fetched & 1) == 0)
    -[BRCPathToItemLookup _fetchByFileID:](self, "_fetchByFileID:", 0);
  return self->_matchByFileID;
}

- (BRCLocalItem)byFileIDGlobally
{
  if ((*(_BYTE *)&self->_fetched & 1) == 0)
    -[BRCPathToItemLookup _fetchByFileID:](self, "_fetchByFileID:", 1);
  return self->_matchByFileIDGlobally;
}

- (BRCDocumentItem)byDocumentID
{
  if ((*(_BYTE *)&self->_fetched & 2) == 0)
    -[BRCPathToItemLookup _fetchByDocumentID:](self, "_fetchByDocumentID:", 0);
  return self->_matchByDocumentID;
}

- (BRCDocumentItem)byDocumentIDGlobally
{
  if ((*(_BYTE *)&self->_fetched & 2) == 0)
    -[BRCPathToItemLookup _fetchByDocumentID:](self, "_fetchByDocumentID:", 1);
  return self->_matchByDocumentIDGlobally;
}

- (BRCServerItem)serverByPath
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  BRCServerItem *v8;
  BRCServerItem *serverByPath;

  if ((*(_BYTE *)&self->_fetched & 0x20) == 0)
  {
    *(_BYTE *)&self->_fetched |= 0x20u;
    -[BRCPathToItemLookup parentItem](self, "parentItem");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      -[BRCPathToItemLookup parentItem](self, "parentItem");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "clientZone");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      if (-[BRCRelativePath type](self->_pathOfItem, "type") - 4 <= 2)
      {
        -[BRCLocalItem itemID](self->_parentItem, "itemID");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        -[BRCRelativePath filename](self->_pathOfItem, "filename");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "serverItemByParentID:andLogicalName:db:", v6, v7, self->_db);
        v8 = (BRCServerItem *)objc_claimAutoreleasedReturnValue();
        serverByPath = self->_serverByPath;
        self->_serverByPath = v8;

      }
    }
  }
  return self->_serverByPath;
}

- (BRCLocalItem)byPath
{
  if ((*(_BYTE *)&self->_fetched & 4) == 0)
    -[BRCPathToItemLookup _fetchByPath](self, "_fetchByPath");
  return self->_matchByPath;
}

- (BOOL)_fetchByPath
{
  void *v3;
  BRCLocalItem *v4;
  BRCLocalItem *matchByPath;

  *(_BYTE *)&self->_fetched |= 4u;
  -[BRCRelativePath filename](self->_pathOfItem, "filename");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCPathToItemLookup _byPathWithLastPathComponent:](self, "_byPathWithLastPathComponent:", v3);
  v4 = (BRCLocalItem *)objc_claimAutoreleasedReturnValue();
  matchByPath = self->_matchByPath;
  self->_matchByPath = v4;

  return self->_matchByPath != 0;
}

- (id)_byPathWithLastPathComponent:(id)a3
{
  id v4;
  void *v5;
  BRCLocalItem *matchByFileID;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  BRCDocumentItem *v13;
  BRCDocumentItem *v14;
  BRCDocumentItem *matchByDocumentID;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  unint64_t v21;
  void *v22;
  char v23;
  void *v24;
  void *v25;
  void *v27;
  NSObject *v28;

  v4 = a3;
  -[BRCPathToItemLookup parentItem](self, "parentItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v14 = 0;
    goto LABEL_21;
  }
  matchByFileID = self->_matchByFileID;
  if (matchByFileID)
  {
    -[BRCLocalItem st](matchByFileID, "st");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "parentID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCLocalItem itemID](self->_parentItem, "itemID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "isEqualToItemID:", v9))
    {
      -[BRCLocalItem st](self->_matchByFileID, "st");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "filename");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v11, "isEqualToString:", v4))
      {
        v12 = -[BRCLocalItem diffAgainstOriginalItem](self->_matchByFileID, "diffAgainstOriginalItem") & 0x1000000060;

        if (!v12)
        {
          v13 = (BRCDocumentItem *)self->_matchByFileID;
LABEL_15:
          v14 = v13;
          goto LABEL_21;
        }
        goto LABEL_10;
      }

    }
  }
LABEL_10:
  matchByDocumentID = self->_matchByDocumentID;
  if (matchByDocumentID)
  {
    -[BRCLocalItem st](matchByDocumentID, "st");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "parentID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCLocalItem itemID](self->_parentItem, "itemID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v17, "isEqualToItemID:", v18))
    {
      -[BRCLocalItem st](self->_matchByDocumentID, "st");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "filename");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v20, "isEqualToString:", v4))
      {
        v21 = -[BRCLocalItem diffAgainstOriginalItem](self->_matchByDocumentID, "diffAgainstOriginalItem") & 0x1000000060;

        if (v21)
        {
          v13 = self->_matchByDocumentID;
          goto LABEL_15;
        }
        goto LABEL_18;
      }

    }
  }
LABEL_18:
  if (-[BRCRelativePath type](self->_pathOfItem, "type") == 3)
  {
    -[BRCRelativePath appLibrary](self->_pathOfItem, "appLibrary");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "isiCloudDesktopAppLibrary");

    if ((v23 & 1) == 0)
    {
      brc_bread_crumbs();
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT))
        -[BRCPathToItemLookup _byPathWithLastPathComponent:].cold.1();

    }
  }
  -[BRCLocalItem clientZone](self->_parentItem, "clientZone");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCLocalItem itemID](self->_parentItem, "itemID");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "itemByParentID:andPhysicalName:db:", v25, v4, self->_db);
  v14 = (BRCDocumentItem *)objc_claimAutoreleasedReturnValue();

LABEL_21:
  return v14;
}

- (BOOL)_fetchByFileID:(BOOL)a3
{
  _BOOL4 v3;
  _BOOL4 v5;
  void *v6;
  void *v7;
  uint64_t v8;
  unint64_t v9;
  BRCDocumentItem *matchByDocumentID;
  void *v11;
  void *v12;
  uint64_t v13;
  unint64_t v14;
  void *v15;
  BRCLocalItem *v16;
  BRCLocalItem *matchByFileIDGlobally;
  BRCClientZone *v18;
  BRCClientZone *clientZone;
  void *v20;
  BRCLocalItem *v21;
  void *v22;
  NSObject *v23;
  BRCLocalItem *v24;
  unint64_t v25;
  int v27;
  BRCLocalItem *v28;
  __int16 v29;
  unint64_t v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v3 = a3;
  v33 = *MEMORY[0x1E0C80C00];
  *(_BYTE *)&self->_fetched |= 1u;
  v5 = -[BRCRelativePath exists](self->_pathOfItem, "exists");
  if (v5)
  {
    -[BRCLocalItem st](self->_matchByDocumentID, "st");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "fileID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "unsignedLongLongValue");
    if (v8 == -[BRCRelativePath fileID](self->_pathOfItem, "fileID"))
    {
      v9 = -[BRCLocalItem diffAgainstOriginalItem](self->_matchByDocumentID, "diffAgainstOriginalItem");

      if ((v9 & 0x400000000) == 0)
      {
        matchByDocumentID = self->_matchByDocumentID;
LABEL_9:
        objc_storeStrong((id *)&self->_matchByFileID, matchByDocumentID);
        objc_storeStrong((id *)&self->_matchByFileIDGlobally, self->_matchByFileID);
LABEL_19:
        LOBYTE(v5) = 1;
        return v5;
      }
    }
    else
    {

    }
    -[BRCLocalItem st](self->_matchByPath, "st");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "fileID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "unsignedLongLongValue");
    if (v13 == -[BRCRelativePath fileID](self->_pathOfItem, "fileID"))
    {
      v14 = -[BRCLocalItem diffAgainstOriginalItem](self->_matchByPath, "diffAgainstOriginalItem");

      if ((v14 & 0x400000000) == 0)
      {
        matchByDocumentID = (BRCDocumentItem *)self->_matchByPath;
        goto LABEL_9;
      }
    }
    else
    {

    }
    -[BRCRelativePath session](self->_pathOfItem, "session");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "globalItemByFileID:db:", -[BRCRelativePath fileID](self->_pathOfItem, "fileID"), self->_db);
    v16 = (BRCLocalItem *)objc_claimAutoreleasedReturnValue();
    matchByFileIDGlobally = self->_matchByFileIDGlobally;
    self->_matchByFileIDGlobally = v16;

    -[BRCPathToItemLookup _resolveClientZoneWhileFetchingFileID:fetchindDocID:](self, "_resolveClientZoneWhileFetchingFileID:fetchindDocID:", 1, 0);
    v18 = (BRCClientZone *)objc_claimAutoreleasedReturnValue();
    clientZone = self->_clientZone;
    self->_clientZone = v18;

    *(_BYTE *)&self->_fetched |= 0x80u;
    -[BRCLocalItem clientZone](self->_matchByFileIDGlobally, "clientZone");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v20, "isEqualToClientZone:", self->_clientZone)
      && -[BRCPathToItemLookup _shareIDMatchesParent:](self, "_shareIDMatchesParent:", self->_matchByFileIDGlobally))
    {
      v21 = self->_matchByFileIDGlobally;
    }
    else
    {
      v21 = 0;
    }
    objc_storeStrong((id *)&self->_matchByFileID, v21);

    if (self->_matchByFileID || v3 && self->_matchByFileIDGlobally)
    {
      brc_bread_crumbs();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      {
        v24 = self->_matchByFileIDGlobally;
        v25 = -[BRCRelativePath fileID](self->_pathOfItem, "fileID");
        v27 = 138412802;
        v28 = v24;
        v29 = 2048;
        v30 = v25;
        v31 = 2112;
        v32 = v22;
        _os_log_debug_impl(&dword_1CBD43000, v23, OS_LOG_TYPE_DEBUG, "[DEBUG] looked up %@ by fileID:%llu%@", (uint8_t *)&v27, 0x20u);
      }

      goto LABEL_19;
    }
    LOBYTE(v5) = 0;
  }
  return v5;
}

- (BOOL)_fetchByDocumentID:(BOOL)a3
{
  _BOOL4 v3;
  _BOOL4 v5;
  void *v6;
  void *v7;
  uint64_t v8;
  unint64_t v9;
  BRCLocalItem *matchByFileID;
  void *v11;
  void *v12;
  uint64_t v13;
  unint64_t v14;
  BRCDocumentItem *v15;
  BRCDocumentItem *matchByDocumentID;
  void *v17;
  BRCDocumentItem *v18;
  BRCDocumentItem *matchByDocumentIDGlobally;
  BRCClientZone *v20;
  BRCClientZone *clientZone;
  void *v22;
  BRCDocumentItem *v23;
  BRCDocumentItem *v24;

  v3 = a3;
  *(_BYTE *)&self->_fetched |= 2u;
  v5 = -[BRCRelativePath exists](self->_pathOfItem, "exists");
  if (v5)
  {
    v5 = -[BRCRelativePath isDocument](self->_pathOfItem, "isDocument");
    if (v5)
    {
      if (-[BRCLocalItem isDocument](self->_matchByFileID, "isDocument")
        && !-[BRCLocalItem isReserved](self->_matchByFileID, "isReserved"))
      {
        -[BRCLocalItem st](self->_matchByFileID, "st");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "documentID");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v7, "unsignedLongLongValue");
        if (v8 == -[BRCRelativePath documentID](self->_pathOfItem, "documentID"))
        {
          v9 = -[BRCLocalItem diffAgainstOriginalItem](self->_matchByFileID, "diffAgainstOriginalItem");

          if ((v9 & 0x200000000) == 0)
          {
            matchByFileID = self->_matchByFileID;
LABEL_14:
            -[BRCLocalItem asDocument](matchByFileID, "asDocument");
            v15 = (BRCDocumentItem *)objc_claimAutoreleasedReturnValue();
            matchByDocumentID = self->_matchByDocumentID;
            self->_matchByDocumentID = v15;

            objc_storeStrong((id *)&self->_matchByDocumentIDGlobally, self->_matchByDocumentID);
            LOBYTE(v5) = 1;
            return v5;
          }
        }
        else
        {

        }
      }
      if (-[BRCLocalItem isDocument](self->_matchByPath, "isDocument")
        && !-[BRCLocalItem isReserved](self->_matchByPath, "isReserved"))
      {
        -[BRCLocalItem st](self->_matchByPath, "st");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "documentID");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "unsignedLongLongValue");
        if (v13 == -[BRCRelativePath documentID](self->_pathOfItem, "documentID"))
        {
          v14 = -[BRCLocalItem diffAgainstOriginalItem](self->_matchByPath, "diffAgainstOriginalItem");

          if ((v14 & 0x200000000) == 0)
          {
            matchByFileID = self->_matchByPath;
            goto LABEL_14;
          }
        }
        else
        {

        }
      }
      -[BRCRelativePath session](self->_pathOfItem, "session");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "globalItemByDocumentID:db:", -[BRCRelativePath documentID](self->_pathOfItem, "documentID"), self->_db);
      v18 = (BRCDocumentItem *)objc_claimAutoreleasedReturnValue();
      matchByDocumentIDGlobally = self->_matchByDocumentIDGlobally;
      self->_matchByDocumentIDGlobally = v18;

      -[BRCPathToItemLookup _resolveClientZoneWhileFetchingFileID:fetchindDocID:](self, "_resolveClientZoneWhileFetchingFileID:fetchindDocID:", 0, 1);
      v20 = (BRCClientZone *)objc_claimAutoreleasedReturnValue();
      clientZone = self->_clientZone;
      self->_clientZone = v20;

      *(_BYTE *)&self->_fetched |= 0x80u;
      -[BRCLocalItem clientZone](self->_matchByDocumentIDGlobally, "clientZone");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v22, "isEqualToClientZone:", self->_clientZone)
        && -[BRCPathToItemLookup _shareIDMatchesParent:](self, "_shareIDMatchesParent:", self->_matchByDocumentIDGlobally))
      {
        v23 = self->_matchByDocumentIDGlobally;
      }
      else
      {
        v23 = 0;
      }
      objc_storeStrong((id *)&self->_matchByDocumentID, v23);

      v24 = self->_matchByDocumentID;
      LOBYTE(v5) = v24 != 0;
      if (!v24 && v3)
        LOBYTE(v5) = self->_matchByDocumentIDGlobally != 0;
    }
  }
  return v5;
}

- (BRCClientZone)clientZone
{
  if ((*(_BYTE *)&self->_fetched & 0x80000000) == 0)
    -[BRCPathToItemLookup _fetchClientZone](self, "_fetchClientZone");
  return self->_clientZone;
}

- (id)_resolveClientZoneWhileFetchingFileID:(BOOL)a3 fetchindDocID:(BOOL)a4
{
  _BOOL4 v5;
  void *v7;
  void *v8;
  BRCClientZone *v9;
  BRCClientZone *v10;
  BRCDocumentItem *v12;
  void *v13;
  void *v14;
  void *v15;

  if ((*(_BYTE *)&self->_fetched & 0x80000000) != 0)
  {
    v10 = self->_clientZone;
    return v10;
  }
  v5 = a4;
  -[BRCPathToItemLookup db](self, "db");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "assertOnQueue");

  if (-[BRCRelativePath type](self->_pathOfItem, "type") != 2
    && -[BRCRelativePath type](self->_pathOfItem, "type") != 1)
  {
    if (!-[BRCRelativePath exists](self->_pathOfItem, "exists"))
      goto LABEL_21;
    if (-[BRCRelativePath isDocument](self->_pathOfItem, "isDocument"))
    {
      if (v5)
      {
        v12 = self->_matchByDocumentIDGlobally;
      }
      else
      {
        -[BRCPathToItemLookup byDocumentIDGlobally](self, "byDocumentIDGlobally");
        v12 = (BRCDocumentItem *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      if (!-[BRCRelativePath isUnixDir](self->_pathOfItem, "isUnixDir"))
        goto LABEL_21;
      if (!a3)
      {
        -[BRCPathToItemLookup byFileIDGlobally](self, "byFileIDGlobally");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "asDirectory");
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_18;
      }
      -[BRCLocalItem asDirectory](self->_matchByFileIDGlobally, "asDirectory");
      v12 = (BRCDocumentItem *)objc_claimAutoreleasedReturnValue();
    }
    v8 = v12;
LABEL_18:
    if ((*(_BYTE *)&self->_fetched & 0x80000000) != 0)
    {
      v9 = self->_clientZone;
      goto LABEL_5;
    }
    if (objc_msgSend(v8, "isSharedToMeTopLevelItem"))
      goto LABEL_22;

LABEL_21:
    -[BRCPathToItemLookup parentItem](self, "parentItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "clientZone");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v13)
    {
      -[BRCRelativePath appLibrary](self->_pathOfItem, "appLibrary");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "defaultClientZone");
      v10 = (BRCClientZone *)objc_claimAutoreleasedReturnValue();

      goto LABEL_6;
    }
LABEL_22:
    objc_msgSend(v8, "clientZone");
    v9 = (BRCClientZone *)objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  -[BRCRelativePath appLibrary](self->_pathOfItem, "appLibrary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "defaultClientZone");
  v9 = (BRCClientZone *)objc_claimAutoreleasedReturnValue();
LABEL_5:
  v10 = v9;
LABEL_6:

  return v10;
}

- (BOOL)_shareIDMatchesParent:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;

  v4 = a3;
  if (objc_msgSend(v4, "isSharedToMeChildItem"))
  {
    objc_msgSend(MEMORY[0x1E0C95070], "brc_fetchShareIDWithSharedItem:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCPathToItemLookup parentItem](self, "parentItem");
    v6 = objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = (void *)v6;
      objc_msgSend(MEMORY[0x1E0C95070], "brc_fetchShareIDWithSharedItem:", v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        objc_msgSend(v5, "recordName");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "recordName");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v9, "isEqualToString:", v10);

      }
      else
      {
        v11 = 0;
      }

    }
    else
    {
      v11 = 1;
    }

  }
  else
  {
    v11 = 1;
  }

  return v11;
}

- (BOOL)_fetchClientZone
{
  BRCClientZone *v3;
  BRCClientZone *clientZone;

  -[BRCPathToItemLookup _resolveClientZoneWhileFetchingFileID:fetchindDocID:](self, "_resolveClientZoneWhileFetchingFileID:fetchindDocID:", 0, 0);
  v3 = (BRCClientZone *)objc_claimAutoreleasedReturnValue();
  clientZone = self->_clientZone;
  self->_clientZone = v3;

  *(_BYTE *)&self->_fetched |= 0x80u;
  return self->_clientZone != 0;
}

- (id)description
{
  void *v3;
  BRCRelativePath *pathOfItem;
  void *v5;
  char fetched;
  __CFString *v7;
  char v8;
  BRCLocalItem *matchByPath;
  BRCLocalItem *matchByFileID;
  BRCDocumentItem *matchByDocumentID;
  BRCPackageItem *packageItem;
  BRCServerItem *serverByPath;
  void *v14;

  v3 = (void *)MEMORY[0x1E0CB3940];
  pathOfItem = self->_pathOfItem;
  -[BRCRelativePath root](pathOfItem, "root");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  fetched = (char)self->_fetched;
  if ((fetched & 8) != 0)
  {
    -[BRCLocalItem itemID](self->_parentItem, "itemID");
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v8 = (char)self->_fetched;
    if ((v8 & 4) != 0)
    {
LABEL_3:
      matchByPath = self->_matchByPath;
      if ((v8 & 1) != 0)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  else
  {
    v7 = CFSTR("unfetched");
    v8 = (char)self->_fetched;
    if ((v8 & 4) != 0)
      goto LABEL_3;
  }
  matchByPath = (BRCLocalItem *)CFSTR("unfetched");
  if ((v8 & 1) != 0)
  {
LABEL_4:
    matchByFileID = self->_matchByFileID;
    if ((v8 & 2) != 0)
      goto LABEL_5;
    goto LABEL_11;
  }
LABEL_10:
  matchByFileID = (BRCLocalItem *)CFSTR("unfetched");
  if ((v8 & 2) != 0)
  {
LABEL_5:
    matchByDocumentID = self->_matchByDocumentID;
    if ((v8 & 0x40) != 0)
      goto LABEL_6;
LABEL_12:
    packageItem = (BRCPackageItem *)CFSTR("unfetched");
    if ((v8 & 0x10) != 0)
      goto LABEL_7;
    goto LABEL_13;
  }
LABEL_11:
  matchByDocumentID = (BRCDocumentItem *)CFSTR("unfetched");
  if ((v8 & 0x40) == 0)
    goto LABEL_12;
LABEL_6:
  packageItem = self->_packageItem;
  if ((v8 & 0x10) != 0)
  {
LABEL_7:
    serverByPath = self->_serverByPath;
    goto LABEL_14;
  }
LABEL_13:
  serverByPath = (BRCServerItem *)CFSTR("unfetched");
LABEL_14:
  objc_msgSend(v3, "stringWithFormat:", CFSTR("\n  itemPath:          %@\n  rootPath:          %@\n  parentID:          %@\n  matchByPath:       %@\n  matchByFileID:     %@\n  matchByDocumentID: %@\n  packageItem:       %@\n  serverItemByPath:  %@"), pathOfItem, v5, v7, matchByPath, matchByFileID, matchByDocumentID, packageItem, serverByPath);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if ((fetched & 8) != 0)

  return v14;
}

- (BRCRelativePath)relpathOfItem
{
  return self->_pathOfItem;
}

- (BRCRelativePath)relpathOfFSEvent
{
  return self->_relpathOfFSEvent;
}

- (BRCPQLConnection)db
{
  return self->_db;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_db, 0);
  objc_storeStrong((id *)&self->_clientZone, 0);
  objc_storeStrong((id *)&self->_matchByDocumentIDGlobally, 0);
  objc_storeStrong((id *)&self->_matchByFileIDGlobally, 0);
  objc_storeStrong((id *)&self->_parentItem, 0);
  objc_storeStrong((id *)&self->_packageItem, 0);
  objc_storeStrong((id *)&self->_serverByPath, 0);
  objc_storeStrong((id *)&self->_matchByPath, 0);
  objc_storeStrong((id *)&self->_matchByDocumentID, 0);
  objc_storeStrong((id *)&self->_matchByFileID, 0);
  objc_storeStrong((id *)&self->_relpathOfFSEvent, 0);
  objc_storeStrong((id *)&self->_pathOfItem, 0);
}

- (void)setByFileID:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: matchByFileID.st.fileID.unsignedLongLongValue == _pathOfItem.fileID%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)setByFileID:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: !_fetched.byFileID%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)setByDocumentID:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: matchByDocumentID.st.documentID.unsignedLongLongValue == _pathOfItem.documentID%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)setByDocumentID:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: matchByDocumentID.isDocument%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)setByDocumentID:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: !_fetched.byDocumentID%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)parentItem
{
  uint8_t v5[12];
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*a1, "type");
  BRCPrettyPrintEnum();
  OUTLINED_FUNCTION_4_0();
  v6 = 2112;
  v7 = a2;
  _os_log_fault_impl(&dword_1CBD43000, a3, OS_LOG_TYPE_FAULT, "[CRIT] API MISUSE: lookups should not be used on paths of type: %s%@", v5, 0x16u);
}

- (void)_byPathWithLastPathComponent:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: _pathOfItem.appLibrary.isiCloudDesktopAppLibrary%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

@end
