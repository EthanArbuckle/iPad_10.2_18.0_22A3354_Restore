@implementation BRCItemToPathLookup

- (BRCItemToPathLookup)initWithItem:(id)a3
{
  id v5;
  BRCItemToPathLookup *v6;
  BRCItemToPathLookup *v7;
  uint64_t v8;
  BRCServerZone *serverZone;
  void *v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  objc_super v15;

  v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)BRCItemToPathLookup;
  v6 = -[BRCItemToPathLookup init](&v15, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_item, a3);
    objc_msgSend(v5, "serverZone");
    v8 = objc_claimAutoreleasedReturnValue();
    serverZone = v7->_serverZone;
    v7->_serverZone = (BRCServerZone *)v8;

    if (!v7->_item)
    {
      brc_bread_crumbs();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
        -[BRCItemToPathLookup initWithItem:].cold.2();

    }
    if (!v7->_serverZone)
    {
      brc_bread_crumbs();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
        -[BRCItemToPathLookup initWithItem:].cold.1();

    }
  }

  return v7;
}

- (BRCItemToPathLookup)initWithServerItem:(id)a3 cleanupFaults:(BOOL)a4
{
  id v7;
  BRCItemToPathLookup *v8;
  BRCItemToPathLookup *v9;
  uint64_t v10;
  BRCServerZone *serverZone;
  void *v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  objc_super v17;

  v7 = a3;
  v17.receiver = self;
  v17.super_class = (Class)BRCItemToPathLookup;
  v8 = -[BRCItemToPathLookup init](&v17, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_serverItem, a3);
    objc_msgSend(v7, "serverZone");
    v10 = objc_claimAutoreleasedReturnValue();
    serverZone = v9->_serverZone;
    v9->_serverZone = (BRCServerZone *)v10;

    v9->_cleanupFaults = a4;
    if (!v7)
    {
      brc_bread_crumbs();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
        -[BRCGlobalProgress didDeleteDocument:].cold.1();

    }
    if (!v9->_serverZone)
    {
      brc_bread_crumbs();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
        -[BRCItemToPathLookup initWithItem:].cold.1();

    }
  }

  return v9;
}

+ (id)lookupForItem:(id)a3
{
  id v3;
  BRCItemToPathLookup *v4;

  v3 = a3;
  v4 = -[BRCItemToPathLookup initWithItem:]([BRCItemToPathLookup alloc], "initWithItem:", v3);

  return v4;
}

+ (id)lookupForServerItem:(id)a3 cleanupFaults:(BOOL)a4
{
  _BOOL8 v4;
  id v5;
  BRCItemToPathLookup *v6;

  v4 = a4;
  v5 = a3;
  v6 = -[BRCItemToPathLookup initWithServerItem:cleanupFaults:]([BRCItemToPathLookup alloc], "initWithServerItem:cleanupFaults:", v5, v4);

  return v6;
}

- (BRCRelativePath)parentPath
{
  if ((*(_BYTE *)&self->_fetched & 8) == 0)
    -[BRCItemToPathLookup _fetchParent](self, "_fetchParent");
  return self->_parentPath;
}

- (BRCRelativePath)byPath
{
  if ((*(_BYTE *)&self->_fetched & 4) == 0)
    -[BRCItemToPathLookup _fetchByPath](self, "_fetchByPath");
  return self->_matchByPath;
}

- (BOOL)computeLogicalPath:(id *)a3 physicalPath:(id *)a4 isDirectory:(BOOL *)a5
{
  BRCLocalItem **p_item;
  void *v10;
  void *v11;
  void *v12;
  BOOL v13;
  BRCServerItem **p_serverItem;
  void *v15;
  void *v16;
  _BOOL4 v17;
  BRCLocalItem *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  NSObject *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v28;
  char v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;

  p_item = &self->_item;
  if (-[BRCLocalItem isFSRoot](self->_item, "isFSRoot"))
  {
    -[BRCLocalItem asFSRoot](*p_item, "asFSRoot");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "appLibrary");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "absolutePath");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = v12 != 0;
    if (v12)
    {
      if (a5)
        *a5 = 1;
      if (a3)
        objc_storeStrong(a3, v12);
    }
    else
    {
      brc_bread_crumbs();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
        -[BRCItemToPathLookup computeLogicalPath:physicalPath:isDirectory:].cold.1();

    }
LABEL_26:
    v25 = 0;
    v26 = 0;
    goto LABEL_27;
  }
  p_serverItem = &self->_serverItem;
  if (-[BRCServerItem isFSRoot](self->_serverItem, "isFSRoot"))
  {
    -[BRCServerItem appLibraryForRootItem](*p_serverItem, "appLibraryForRootItem");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "absolutePath");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = v16 != 0;
    if (v16)
    {
      if (a5)
        *a5 = 1;
      if (a3)
        objc_storeStrong(a3, v16);
    }
    else
    {
      brc_bread_crumbs();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
        -[BRCItemToPathLookup computeLogicalPath:physicalPath:isDirectory:].cold.1();

    }
    goto LABEL_26;
  }
  if (*p_item)
  {
    v17 = -[BRCLocalItem isDirectoryWithPackageName](*p_item, "isDirectoryWithPackageName");
    v18 = *p_item;
    if (!v17)
    {
      if (-[BRCLocalItem isFault](v18, "isFault") || -[BRCLocalItem isReserved](*p_item, "isReserved"))
      {
        -[BRCLocalItem st](*p_item, "st");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "logicalName");
        v20 = objc_claimAutoreleasedReturnValue();
LABEL_32:
        v25 = (void *)v20;

        if (-[BRCLocalItem isDirectory](*p_item, "isDirectory"))
          goto LABEL_33;
        p_serverItem = (BRCServerItem **)p_item;
LABEL_35:
        v29 = -[BRCServerItem isPackage](*p_serverItem, "isPackage");
        goto LABEL_36;
      }
      v18 = *p_item;
    }
    -[BRCLocalItem st](v18, "st");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "filename");
    v20 = objc_claimAutoreleasedReturnValue();
    goto LABEL_32;
  }
  -[BRCServerItem st](*p_serverItem, "st");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "representableName");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (!-[BRCServerItem isDirectory](*p_serverItem, "isDirectory"))
    goto LABEL_35;
LABEL_33:
  v29 = 1;
LABEL_36:
  -[BRCItemToPathLookup parentPath](self, "parentPath");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "absolutePath");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (a5)
    *a5 = v29;
  if (v26)
  {
    if (a3)
    {
      objc_msgSend(v26, "stringByAppendingPathComponent:", v25);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = *a3;
      *a3 = v31;

    }
    if (a4 && -[BRCLocalItem isFault](*p_item, "isFault"))
    {
      -[BRCLocalItem st](*p_item, "st");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "filename");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "stringByAppendingPathComponent:", v34);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = *a4;
      *a4 = v35;

    }
    v13 = 1;
  }
  else
  {
    v13 = 0;
  }
LABEL_27:

  return v13;
}

- (NSURL)coordinatedWriteURL
{
  void *v2;
  void *v3;
  unsigned __int8 v5;
  id v6;
  id v7;

  v6 = 0;
  v7 = 0;
  v5 = 0;
  v2 = 0;
  if (-[BRCItemToPathLookup computeLogicalPath:physicalPath:isDirectory:](self, "computeLogicalPath:physicalPath:isDirectory:", &v7, &v6, &v5))
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v7, v5);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v6, v5);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      _CFURLPromiseSetPhysicalURL();

    }
  }

  return (NSURL *)v2;
}

- (NSURL)coordinatedReadURL
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v8;
  NSObject *v9;

  if (!self->_item)
  {
    brc_bread_crumbs();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      -[BRCItemToPathLookup initWithItem:].cold.2();

  }
  -[BRCItemToPathLookup byFileSystemID](self, "byFileSystemID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[BRCLocalItem isFault](self->_item, "isFault"))
  {
    -[BRCLocalItem st](self->_item, "st");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "logicalName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "logicalURLWithLogicalName:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v3, "logicalURLWithLogicalName:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return (NSURL *)v6;
}

- (BRCAppLibrary)coordinatedURLAppLibrary
{
  void *v2;
  void *v3;

  -[BRCItemToPathLookup byFileSystemID](self, "byFileSystemID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (BRCAppLibrary *)v3;
}

- (BRCRelativePath)byFileSystemID
{
  void *item;
  id v4;
  uint64_t v5;
  BRCRelativePath *v6;

  item = self->_item;
  if (!item)
    item = self->_serverItem;
  v4 = item;
  if (objc_msgSend(v4, "isDocument"))
  {
    if ((*(_BYTE *)&self->_fetched & 2) == 0)
      -[BRCItemToPathLookup _fetchByDocumentID](self, "_fetchByDocumentID");
    v5 = 48;
  }
  else
  {
    if ((*(_BYTE *)&self->_fetched & 1) == 0)
      -[BRCItemToPathLookup _fetchByFileID](self, "_fetchByFileID");
    v5 = 40;
  }
  v6 = (BRCRelativePath *)*(id *)((char *)&self->super.isa + v5);

  return v6;
}

- (BOOL)fileSystemIDMayStillExist
{
  void *v3;
  BOOL v4;

  -[BRCItemToPathLookup byFileSystemID](self, "byFileSystemID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (objc_msgSend(v3, "exists") & 1) != 0 || self->_fileSystemIDMayStillExist;

  return v4;
}

- (void)_fetchParent
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] UNREACHABLE: asked the parent of a root item%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (BOOL)_fetchByFileID
{
  void *v3;
  void *v4;
  uint64_t v5;
  BRCRelativePath *matchByPath;
  BRCRelativePath *v7;
  void *matchByFileID;
  BOOL v9;
  BRCRelativePath *v10;
  BRCRelativePath *v11;
  BRCRelativePath *v12;
  BRCRelativePath **p_matchByFileID;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  BRCRelativePath *v18;
  uint64_t v19;
  void *v20;
  BRCRelativePath *v21;
  BRCRelativePath *v22;
  id v23;
  NSObject *v24;
  void *v25;
  NSObject *v26;
  int v28;

  *(_BYTE *)&self->_fetched |= 1u;
  -[BRCLocalItem st](self->_item, "st");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fileID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "unsignedLongLongValue");

  if (!v5)
    return 0;
  if (-[BRCRelativePath exists](self->_matchByPath, "exists")
    && -[BRCRelativePath fileID](self->_matchByPath, "fileID") == v5)
  {
    matchByPath = self->_matchByPath;
LABEL_8:
    v7 = matchByPath;
    matchByFileID = self->_matchByFileID;
    self->_matchByFileID = v7;
    goto LABEL_11;
  }
  if (-[BRCRelativePath exists](self->_matchByDocumentID, "exists")
    && -[BRCRelativePath fileID](self->_matchByDocumentID, "fileID") == v5)
  {
    matchByPath = self->_matchByDocumentID;
    goto LABEL_8;
  }
  v10 = [BRCRelativePath alloc];
  -[BRCServerZone session](self->_serverZone, "session");
  matchByFileID = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[BRCRelativePath initWithFileID:session:](v10, "initWithFileID:session:", v5, matchByFileID);
  v12 = self->_matchByFileID;
  self->_matchByFileID = v11;

LABEL_11:
  v28 = 0;
  p_matchByFileID = &self->_matchByFileID;
  v9 = 1;
  if (!-[BRCRelativePath resolveAndKeepOpenMustExist:error:](self->_matchByFileID, "resolveAndKeepOpenMustExist:error:", 1, &v28))
  {
    if (-[BRCRelativePath isUnresolvableDueToProtection](*p_matchByFileID, "isUnresolvableDueToProtection"))
    {
      brc_bread_crumbs();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        -[BRCItemToPathLookup _fetchByFileID].cold.3();

      self->_fileSystemIDMayStillExist = 1;
    }
    -[BRCLocalItem st](self->_item, "st");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "stagedFileID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (-[BRCLocalItem fromReadOnlyDB](self->_item, "fromReadOnlyDB") && objc_msgSend(v17, "longLongValue"))
    {
      v18 = [BRCRelativePath alloc];
      v19 = objc_msgSend(v17, "longLongValue");
      -[BRCServerZone session](self->_serverZone, "session");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = -[BRCRelativePath initWithFileID:session:](v18, "initWithFileID:session:", v19, v20);
      v22 = self->_matchByFileID;
      self->_matchByFileID = v21;

      if (-[BRCRelativePath resolveAndKeepOpenMustExist:error:](self->_matchByFileID, "resolveAndKeepOpenMustExist:error:", 1, &v28))
      {
        brc_bread_crumbs();
        v23 = (id)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
          -[BRCItemToPathLookup _fetchByFileID].cold.1();

        v9 = 1;
        goto LABEL_27;
      }
      if (-[BRCRelativePath isUnresolvableDueToProtection](*p_matchByFileID, "isUnresolvableDueToProtection"))
      {
        brc_bread_crumbs();
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
          -[BRCItemToPathLookup _fetchByFileID].cold.2();

        self->_fileSystemIDMayStillExist = 1;
      }
    }
    v9 = 0;
    v23 = *p_matchByFileID;
    *p_matchByFileID = 0;
LABEL_27:

  }
  return v9;
}

- (BOOL)_fetchByPath
{
  void *v3;
  BRCRelativePath **p_matchByFileID;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  BRCRelativePath *v13;
  BRCRelativePath *matchByPath;
  BRCRelativePath *v15;
  BRCRelativePath **p_matchByPath;
  BOOL v17;
  BRCLocalItem *item;
  void *v19;
  BRCRelativePath *v20;
  void *v21;
  id v22;
  uint64_t v23;
  BRCRelativePath *v24;
  BRCRelativePath *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  NSObject *v31;
  BRCRelativePath *v32;
  BRCRelativePath *parentPath;
  BRCRelativePath *v35;
  void *v36;
  void *v37;
  char v38;
  NSObject *v39;
  BRCServerItem *serverItem;
  int v41;
  uint8_t buf[4];
  BRCRelativePath *v43;
  __int16 v44;
  void *v45;
  __int16 v46;
  _QWORD v47[3];

  v47[2] = *MEMORY[0x1E0C80C00];
  *(_BYTE *)&self->_fetched |= 4u;
  -[BRCItemToPathLookup parentPath](self, "parentPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 0;
  p_matchByFileID = &self->_matchByFileID;
  if (-[BRCRelativePath parentFileID](self->_matchByFileID, "parentFileID") == self->_parentFileID)
  {
    -[BRCRelativePath filename](self->_matchByFileID, "filename");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCLocalItem st](self->_item, "st");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "filename");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v5, "isEqualToString:", v7);

    if ((v8 & 1) != 0)
      goto LABEL_6;
  }
  p_matchByFileID = &self->_matchByDocumentID;
  if (-[BRCRelativePath parentFileID](self->_matchByDocumentID, "parentFileID") == self->_parentFileID)
  {
    -[BRCRelativePath filename](self->_matchByDocumentID, "filename");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCLocalItem st](self->_item, "st");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "filename");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v9, "isEqualToString:", v11);

    if (v12)
    {
LABEL_6:
      v13 = *p_matchByFileID;
      matchByPath = self->_matchByPath;
      self->_matchByPath = v13;

    }
  }
  v41 = 0;
  p_matchByPath = &self->_matchByPath;
  v15 = self->_matchByPath;
  if (!v15)
  {
    item = self->_item;
    if (item)
    {
      -[BRCLocalItem st](item, "st");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "filename");
      v20 = (BRCRelativePath *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[BRCServerItem st](self->_serverItem, "st");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "logicalName");
      v22 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v23 = objc_msgSend(v22, "fileSystemRepresentation");

      objc_msgSend(MEMORY[0x1E0CB3940], "br_pathWithFileSystemRepresentation:", v23);
      v20 = (BRCRelativePath *)objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG)
        || (-[BRCServerItem st](self->_serverItem, "st"),
            v36 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend(v36, "logicalName"),
            v37 = (void *)objc_claimAutoreleasedReturnValue(),
            v38 = -[BRCRelativePath isEqualToString:](v20, "isEqualToString:", v37),
            v37,
            v36,
            (v38 & 1) != 0))
      {
LABEL_16:
        -[BRCRelativePath pathWithChildAtPath:](self->_parentPath, "pathWithChildAtPath:", v20);
        v24 = (BRCRelativePath *)objc_claimAutoreleasedReturnValue();
        v25 = self->_matchByPath;
        self->_matchByPath = v24;

        v17 = -[BRCRelativePath resolveAndKeepOpenMustExist:error:](self->_matchByPath, "resolveAndKeepOpenMustExist:error:", 0, &v41);
        if (!v17)
        {
          if (-[BRCRelativePath isUnresolvableDueToProtection](*p_matchByPath, "isUnresolvableDueToProtection"))
          {
            brc_bread_crumbs();
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            brc_default_log();
            v27 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
              -[BRCItemToPathLookup _fetchByPath].cold.1();

            self->_fileSystemIDMayStillExist = 1;
          }
          else
          {
            brc_bread_crumbs();
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            brc_default_log();
            v29 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v29, (os_log_type_t)0x90u))
            {
              parentPath = self->_parentPath;
              v35 = self->_matchByPath;
              *(_DWORD *)buf = 138413058;
              v43 = parentPath;
              v44 = 2112;
              v45 = v35;
              v46 = 1024;
              LODWORD(v47[0]) = v41;
              WORD2(v47[0]) = 2112;
              *(_QWORD *)((char *)v47 + 6) = v28;
              _os_log_error_impl(&dword_1CBD43000, v29, (os_log_type_t)0x90u, "[ERROR] parent %@ exists, but failed resolving child %@ %{errno}d%@", buf, 0x26u);
            }

            if (v41 != 45)
            {
              brc_bread_crumbs();
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              brc_default_log();
              v31 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v31, OS_LOG_TYPE_FAULT))
                -[BRCItemToPathLookup _fetchByPath].cold.2(&v41, (uint64_t)v30, v31);

            }
          }
          v32 = *p_matchByPath;
          *p_matchByPath = 0;

        }
        goto LABEL_28;
      }
      brc_bread_crumbs();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v39 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
      {
        serverItem = self->_serverItem;
        *(_DWORD *)buf = 138412802;
        v43 = v20;
        v44 = 2112;
        v45 = serverItem;
        v46 = 2112;
        v47[0] = v19;
        _os_log_debug_impl(&dword_1CBD43000, v39, OS_LOG_TYPE_DEBUG, "[DEBUG] sanitized server filename to %@ for %@%@", buf, 0x20u);
      }

    }
    goto LABEL_16;
  }
  if (!-[BRCRelativePath resolveAndKeepOpenMustExist:error:](v15, "resolveAndKeepOpenMustExist:error:", 0, &v41))
  {
    v17 = 0;
    v20 = *p_matchByPath;
    *p_matchByPath = 0;
LABEL_28:

    return v17;
  }
  return 1;
}

- (BOOL)_fetchByDocumentID
{
  int v3;
  void *v5;
  void *v6;
  BRCRelativePath **p_matchByFileID;
  BRCRelativePath *v8;
  void *matchByDocumentID;
  _BOOL4 v10;
  BRCRelativePath *v11;
  BRCRelativePath **p_matchByDocumentID;
  void *v13;
  NSObject *v14;
  BRCRelativePath *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  char v19;
  void *v20;
  void *v21;
  uint64_t v22;
  char v23;
  BRCRelativePath *v24;
  void *v25;
  BRCRelativePath *v26;
  BRCRelativePath *v27;
  void *v28;
  NSObject *v29;
  BRCRelativePath *v30;
  int v31;
  int v32;

  *(_BYTE *)&self->_fetched |= 2u;
  if (!-[BRCLocalItem isDocument](self->_item, "isDocument") || -[BRCLocalItem isReserved](self->_item, "isReserved"))
  {
    LOBYTE(v3) = 0;
    return v3;
  }
  -[BRCLocalItem st](self->_item, "st");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "documentID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v6, "unsignedIntValue");

  if (!v3)
    return v3;
  self->_fileSystemIDMayStillExist = 1;
  if ((*(_BYTE *)&self->_fetched & 1) == 0)
    -[BRCItemToPathLookup _fetchByFileID](self, "_fetchByFileID");
  p_matchByFileID = &self->_matchByFileID;
  if (-[BRCRelativePath isDocument](self->_matchByFileID, "isDocument"))
    goto LABEL_9;
  -[BRCItemToPathLookup byPath](self, "byPath");
  matchByDocumentID = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(matchByDocumentID, "exists"))
  {
LABEL_14:

    goto LABEL_15;
  }
  p_matchByFileID = &self->_matchByPath;
  v10 = -[BRCRelativePath isDocument](self->_matchByPath, "isDocument");

  if (v10)
  {
LABEL_9:
    if (-[BRCRelativePath documentID](*p_matchByFileID, "documentID") != v3)
      goto LABEL_15;
    v8 = *p_matchByFileID;
    matchByDocumentID = self->_matchByDocumentID;
    self->_matchByDocumentID = v8;
    goto LABEL_14;
  }
LABEL_15:
  p_matchByDocumentID = &self->_matchByDocumentID;
  v11 = self->_matchByDocumentID;
  if (v11)
  {
    v32 = 0;
    LOBYTE(v3) = -[BRCRelativePath resolveAndKeepOpenMustExist:error:](v11, "resolveAndKeepOpenMustExist:error:", 0, &v32);
    if ((v3 & 1) == 0)
    {
      if (-[BRCRelativePath isUnresolvableDueToProtection](*p_matchByDocumentID, "isUnresolvableDueToProtection"))
      {
        brc_bread_crumbs();
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
          -[BRCItemToPathLookup _fetchByDocumentID].cold.1();

        self->_fileSystemIDMayStillExist = 1;
      }
      v15 = *p_matchByDocumentID;
      *p_matchByDocumentID = 0;

    }
  }
  else
  {
    -[BRCServerZone session](self->_serverZone, "session");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "volume");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "deviceID");
    v18 = GSLibraryResolveDocumentId2();

    if (v18
      && (-[BRCLocalItem st](self->_item, "st"),
          v20 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v20, "fileID"),
          v21 = (void *)objc_claimAutoreleasedReturnValue(),
          v22 = objc_msgSend(v21, "unsignedLongLongValue"),
          v21,
          v20,
          v18 != v22))
    {
      v24 = [BRCRelativePath alloc];
      -[BRCServerZone session](self->_serverZone, "session");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = -[BRCRelativePath initWithFileID:session:](v24, "initWithFileID:session:", v18, v25);
      v27 = self->_matchByDocumentID;
      self->_matchByDocumentID = v26;

      v31 = 0;
      if (-[BRCRelativePath resolveAndKeepOpenMustExist:error:](self->_matchByDocumentID, "resolveAndKeepOpenMustExist:error:", 1, &v31)&& -[BRCRelativePath documentID](*p_matchByDocumentID, "documentID") == v3)
      {
        v19 = 1;
      }
      else
      {
        if (-[BRCRelativePath isUnresolvableDueToProtection](*p_matchByDocumentID, "isUnresolvableDueToProtection"))
        {
          brc_bread_crumbs();
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v29 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
            -[BRCItemToPathLookup _fetchByDocumentID].cold.1();

          self->_fileSystemIDMayStillExist = 1;
        }
        v30 = *p_matchByDocumentID;
        *p_matchByDocumentID = 0;

        v19 = 0;
      }
      v23 = 1;
    }
    else
    {
      v23 = 0;
    }
    LOBYTE(v3) = v23 & v19;
  }
  return v3;
}

- (void)closePaths
{
  BRCRelativePath *matchByFileID;
  BRCRelativePath *matchByPath;
  BRCRelativePath *matchByDocumentID;
  BRCRelativePath *v6;

  -[BRCRelativePath close](self->_matchByFileID, "close");
  matchByFileID = self->_matchByFileID;
  self->_matchByFileID = 0;

  -[BRCRelativePath close](self->_matchByPath, "close");
  matchByPath = self->_matchByPath;
  self->_matchByPath = 0;

  -[BRCRelativePath close](self->_matchByDocumentID, "close");
  matchByDocumentID = self->_matchByDocumentID;
  self->_matchByDocumentID = 0;

  -[BRCRelativePath close](self->_parentPath, "close");
  v6 = self->_matchByPath;
  self->_matchByPath = 0;

  self->_fetched = 0;
}

- (void)dealloc
{
  objc_super v3;

  -[BRCItemToPathLookup closePaths](self, "closePaths");
  v3.receiver = self;
  v3.super_class = (Class)BRCItemToPathLookup;
  -[BRCItemToPathLookup dealloc](&v3, sel_dealloc);
}

- (id)description
{
  void *v3;
  BRCLocalItem *item;
  BRCServerItem *serverItem;
  char fetched;
  __CFString *v7;
  char v8;
  BRCRelativePath *parentPath;
  BRCRelativePath *matchByPath;
  BRCRelativePath *matchByFileID;
  BRCRelativePath *matchByDocumentID;
  void *v13;
  void *v14;

  v3 = (void *)MEMORY[0x1E0CB3940];
  item = self->_item;
  serverItem = self->_serverItem;
  fetched = (char)self->_fetched;
  if ((fetched & 8) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_parentFileID);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v8 = (char)self->_fetched;
    if ((v8 & 8) != 0)
    {
      parentPath = self->_parentPath;
      if ((*(_BYTE *)&self->_fetched & 4) == 0)
        goto LABEL_10;
    }
    else
    {
      parentPath = (BRCRelativePath *)CFSTR("unfetched");
      if ((*(_BYTE *)&self->_fetched & 4) == 0)
        goto LABEL_10;
    }
LABEL_6:
    matchByPath = self->_matchByPath;
    if ((v8 & 1) == 0)
      goto LABEL_11;
    goto LABEL_7;
  }
  v7 = CFSTR("unfetched");
  v8 = (char)self->_fetched;
  parentPath = (BRCRelativePath *)CFSTR("unfetched");
  if ((v8 & 4) != 0)
    goto LABEL_6;
LABEL_10:
  matchByPath = (BRCRelativePath *)CFSTR("unfetched");
  if ((v8 & 1) == 0)
  {
LABEL_11:
    matchByFileID = (BRCRelativePath *)CFSTR("unfetched");
    if ((v8 & 2) == 0)
      goto LABEL_12;
LABEL_8:
    matchByDocumentID = self->_matchByDocumentID;
    goto LABEL_13;
  }
LABEL_7:
  matchByFileID = self->_matchByFileID;
  if ((v8 & 2) != 0)
    goto LABEL_8;
LABEL_12:
  matchByDocumentID = (BRCRelativePath *)CFSTR("unfetched");
LABEL_13:
  -[BRCServerZone clientZone](self->_serverZone, "clientZone");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("\n  localItem:         %@\n  serverItem:        %@\n  parentFileID:      %@\n  parentPath:        %@\n  matchByPath:       %@\n  matchByFileID:     %@\n  matchByDocumentID: %@\n  container:         %@"), item, serverItem, v7, parentPath, matchByPath, matchByFileID, matchByDocumentID, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if ((fetched & 8) != 0)
  return v14;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_matchByPath, 0);
  objc_storeStrong((id *)&self->_matchByDocumentID, 0);
  objc_storeStrong((id *)&self->_matchByFileID, 0);
  objc_storeStrong((id *)&self->_parentPath, 0);
  objc_storeStrong((id *)&self->_serverZone, 0);
  objc_storeStrong((id *)&self->_serverItem, 0);
  objc_storeStrong((id *)&self->_item, 0);
}

- (void)initWithItem:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: _serverZone%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)initWithItem:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: _item%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)computeLogicalPath:physicalPath:isDirectory:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_11_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_1CBD43000, v0, v1, "[CRIT] UNREACHABLE: there should be a logical path for %@%@");
  OUTLINED_FUNCTION_2();
}

- (void)_fetchByFileID
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_11_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] Can't resolve by fileID for %@ due to content protection%@");
  OUTLINED_FUNCTION_2();
}

- (void)_fetchByPath
{
  int v3;
  _DWORD v4[2];
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = *a1;
  v4[0] = 67109378;
  v4[1] = v3;
  v5 = 2112;
  v6 = a2;
  _os_log_fault_impl(&dword_1CBD43000, log, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: failed resolving child %{errno}d%@", (uint8_t *)v4, 0x12u);
  OUTLINED_FUNCTION_2();
}

- (void)_fetchByDocumentID
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_11_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] Can't fetch by documentID due to file protection for %@%@");
  OUTLINED_FUNCTION_2();
}

@end
