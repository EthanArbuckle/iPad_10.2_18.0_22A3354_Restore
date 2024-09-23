@implementation BRCURLToItemLookup

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  char var0;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "encodeInt32:forKey:", self->_hasFetched.value, CFSTR("fetched"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_url, CFSTR("url"));
  objc_msgSend(v5, "encodeObject:forKey:", self->__relpath, CFSTR("_relpath"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_parentRelpath, CFSTR("parentRelpath"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_parentItem, CFSTR("parentItemq "));
  objc_msgSend(v5, "encodeObject:forKey:", self->_filename, CFSTR("filename"));
  var0 = (char)self->_hasFetched.var0;
  if ((var0 & 0x10) != 0)
  {
    objc_msgSend(v5, "encodeObject:forKey:", self->_byIDLocalItem, CFSTR("byIDLocalItem"));
    objc_msgSend(v5, "encodeObject:forKey:", self->_byIDServerItem, CFSTR("byIDServerItem"));
    objc_msgSend(v5, "encodeInt64:forKey:", self->_byIDDiffs, CFSTR("byIDDiffs"));
    var0 = (char)self->_hasFetched.var0;
    if ((var0 & 4) == 0)
    {
LABEL_3:
      if ((var0 & 8) == 0)
        goto LABEL_4;
LABEL_9:
      objc_msgSend(v5, "encodeObject:forKey:", self->_faultedLocalItem, CFSTR("faultedLocalItem"));
      objc_msgSend(v5, "encodeObject:forKey:", self->_faultedServerItem, CFSTR("faultedServerItem"));
      objc_msgSend(v5, "encodeObject:forKey:", self->_faultedRelpath, CFSTR("faultedRelpath"));
      objc_msgSend(v5, "encodeInt64:forKey:", self->_faultedDiffs, CFSTR("faultedDiffs"));
      if ((*(_BYTE *)&self->_hasFetched.var0 & 0x20) == 0)
        goto LABEL_6;
      goto LABEL_5;
    }
  }
  else if ((*(_BYTE *)&self->_hasFetched.var0 & 4) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(v5, "encodeObject:forKey:", self->_byPathLocalItem, CFSTR("byPathLocalItem"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_byPathServerItem, CFSTR("byPathServerItem"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_byPathDiffs, CFSTR("byPathDiffs"));
  var0 = (char)self->_hasFetched.var0;
  if ((var0 & 8) != 0)
    goto LABEL_9;
LABEL_4:
  if ((var0 & 0x20) != 0)
  {
LABEL_5:
    objc_msgSend(v5, "encodeObject:forKey:", self->_reservedLocalItem, CFSTR("reservedLocalItem"));
    objc_msgSend(v5, "encodeObject:forKey:", self->_reservedServerItem, CFSTR("reservedServerItem"));
  }
LABEL_6:

}

- (BRCURLToItemLookup)initWithCoder:(id)a3
{
  id v4;
  BRCURLToItemLookup *v5;
  uint64_t v6;
  NSURL *url;
  uint64_t v8;
  BRCRelativePath *relpath;
  uint64_t v10;
  BRCRelativePath *parentRelpath;
  uint64_t v12;
  BRCLocalItem *parentItem;
  uint64_t v14;
  NSString *filename;
  char var0;
  uint64_t v17;
  BRCLocalItem *reservedLocalItem;
  uint64_t v19;
  BRCServerItem *reservedServerItem;
  uint64_t v22;
  BRCLocalItem *byIDLocalItem;
  uint64_t v24;
  BRCServerItem *byIDServerItem;
  uint64_t v26;
  BRCLocalItem *byPathLocalItem;
  uint64_t v28;
  BRCServerItem *byPathServerItem;
  uint64_t v30;
  BRCDocumentItem *faultedLocalItem;
  uint64_t v32;
  BRCServerItem *faultedServerItem;
  uint64_t v34;
  BRCRelativePath *faultedRelpath;

  v4 = a3;
  v5 = -[BRCURLToItemLookup init](self, "init");
  if (!v5)
    goto LABEL_7;
  v5->_hasFetched.value = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("fetched"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("url"));
  v6 = objc_claimAutoreleasedReturnValue();
  url = v5->_url;
  v5->_url = (NSURL *)v6;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_relpath"));
  v8 = objc_claimAutoreleasedReturnValue();
  relpath = v5->__relpath;
  v5->__relpath = (BRCRelativePath *)v8;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("parentRelpath"));
  v10 = objc_claimAutoreleasedReturnValue();
  parentRelpath = v5->_parentRelpath;
  v5->_parentRelpath = (BRCRelativePath *)v10;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("parentItem"));
  v12 = objc_claimAutoreleasedReturnValue();
  parentItem = v5->_parentItem;
  v5->_parentItem = (BRCLocalItem *)v12;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("filename"));
  v14 = objc_claimAutoreleasedReturnValue();
  filename = v5->_filename;
  v5->_filename = (NSString *)v14;

  var0 = (char)v5->_hasFetched.var0;
  if ((var0 & 0x10) != 0)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("byIDLocalItem"));
    v22 = objc_claimAutoreleasedReturnValue();
    byIDLocalItem = v5->_byIDLocalItem;
    v5->_byIDLocalItem = (BRCLocalItem *)v22;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("byIDServerItem"));
    v24 = objc_claimAutoreleasedReturnValue();
    byIDServerItem = v5->_byIDServerItem;
    v5->_byIDServerItem = (BRCServerItem *)v24;

    v5->_byIDDiffs = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("byIDDiffs"));
    var0 = (char)v5->_hasFetched.var0;
    if ((var0 & 4) == 0)
    {
LABEL_4:
      if ((var0 & 8) == 0)
        goto LABEL_5;
LABEL_10:
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("faultedLocalItem"));
      v30 = objc_claimAutoreleasedReturnValue();
      faultedLocalItem = v5->_faultedLocalItem;
      v5->_faultedLocalItem = (BRCDocumentItem *)v30;

      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("faultedServerItem"));
      v32 = objc_claimAutoreleasedReturnValue();
      faultedServerItem = v5->_faultedServerItem;
      v5->_faultedServerItem = (BRCServerItem *)v32;

      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("faultedRelpath"));
      v34 = objc_claimAutoreleasedReturnValue();
      faultedRelpath = v5->_faultedRelpath;
      v5->_faultedRelpath = (BRCRelativePath *)v34;

      v5->_faultedDiffs = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("faultedDiffs"));
      if ((*(_BYTE *)&v5->_hasFetched.var0 & 0x20) == 0)
        goto LABEL_7;
      goto LABEL_6;
    }
  }
  else if ((*(_BYTE *)&v5->_hasFetched.var0 & 4) == 0)
  {
    goto LABEL_4;
  }
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("byPathLocalItem"));
  v26 = objc_claimAutoreleasedReturnValue();
  byPathLocalItem = v5->_byPathLocalItem;
  v5->_byPathLocalItem = (BRCLocalItem *)v26;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("byPathServerItem"));
  v28 = objc_claimAutoreleasedReturnValue();
  byPathServerItem = v5->_byPathServerItem;
  v5->_byPathServerItem = (BRCServerItem *)v28;

  v5->_byPathDiffs = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("byPathDiffs"));
  var0 = (char)v5->_hasFetched.var0;
  if ((var0 & 8) != 0)
    goto LABEL_10;
LABEL_5:
  if ((var0 & 0x20) != 0)
  {
LABEL_6:
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("reservedLocalItem"));
    v17 = objc_claimAutoreleasedReturnValue();
    reservedLocalItem = v5->_reservedLocalItem;
    v5->_reservedLocalItem = (BRCLocalItem *)v17;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("reservedServerItem"));
    v19 = objc_claimAutoreleasedReturnValue();
    reservedServerItem = v5->_reservedServerItem;
    v5->_reservedServerItem = (BRCServerItem *)v19;

  }
LABEL_7:

  return v5;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  BRCRelativePath *relpath;
  void *v11;
  BRCRelativePath *v12;
  void *v13;
  BRCRelativePath *faultedRelpath;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithCapacity:", 1024);
  v4 = objc_opt_class();
  -[NSURL path](self->_url, "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByAbbreviatingWithTildeInPath");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if ((*(_BYTE *)&self->_hasFetched.var0 & 1) != 0)
  {
    -[BRCLocalItem itemID](self->_parentItem, "itemID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "debugItemIDString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("%@: %@\n parent (i:%@ n:'%@') %@"), v4, v7, v9, self->_filename, self->_parentRelpath);

  }
  else
  {
    objc_msgSend(v3, "appendFormat:", CFSTR("%@: %@\n parent (i:%@ n:'%@') %@"), v4, v6, CFSTR("unfetched"), self->_filename, self->_parentRelpath);
  }

  if ((*(_BYTE *)&self->_hasFetched.var0 & 0x10) != 0)
  {
    v17 = *(_OWORD *)&self->_byIDLocalItem;
    relpath = self->__relpath;
    BRCItemFieldsPrettyPrint();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("\n byID:\n  localItem:  %@\n  serverItem: %@\n  relpath:    %@\n  diffs:      %@"), v17, relpath, v11);

  }
  else
  {
    objc_msgSend(v3, "appendString:", CFSTR("\n byID: unfetched"));
  }
  if ((*(_BYTE *)&self->_hasFetched.var0 & 4) != 0)
  {
    v18 = *(_OWORD *)&self->_byPathLocalItem;
    v12 = self->__relpath;
    BRCItemFieldsPrettyPrint();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("\n byPath:\n  localItem:  %@\n  serverItem: %@\n  relpath:    %@\n  diffs:      %@"), v18, v12, v13);

  }
  else
  {
    objc_msgSend(v3, "appendString:", CFSTR("\n byPath: unfetched"));
  }
  if ((*(_BYTE *)&self->_hasFetched.var0 & 8) != 0)
  {
    v19 = *(_OWORD *)&self->_faultedLocalItem;
    faultedRelpath = self->_faultedRelpath;
    BRCItemFieldsPrettyPrint();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("\n fault:\n  localItem:  %@\n  serverItem: %@\n  relpath:    %@\n  diffs:      %@"), v19, faultedRelpath, v15);

  }
  else
  {
    objc_msgSend(v3, "appendString:", CFSTR("\n fault: unfetched"));
  }
  if ((*(_BYTE *)&self->_hasFetched.var0 & 0x20) != 0)
    objc_msgSend(v3, "appendFormat:", CFSTR("\n reserved:\n  localItem:  %@\n  serverItem: %@"), self->_reservedLocalItem, self->_reservedServerItem);
  else
    objc_msgSend(v3, "appendString:", CFSTR("\n reserved: unfetched"));
  return v3;
}

- (BRCURLToItemLookup)initWithURL:(id)a3 allowAppLibraryRoot:(BOOL)a4 session:(id)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;
  BRCURLToItemLookup *v11;

  v5 = a4;
  v8 = a5;
  v9 = a3;
  objc_msgSend(v8, "clientDB");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[BRCURLToItemLookup initWithURL:allowAppLibraryRoot:session:db:](self, "initWithURL:allowAppLibraryRoot:session:db:", v9, v5, v8, v10);

  return v11;
}

- (BRCURLToItemLookup)initWithURL:(id)a3 allowAppLibraryRoot:(BOOL)a4 session:(id)a5 db:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  NSObject *v23;
  NSObject *v24;
  void *v26;
  NSObject *v27;
  void *v28;
  NSObject *v29;
  uint64_t v30;
  objc_super v31;

  v11 = a3;
  v12 = a5;
  v13 = a6;
  if (v11)
  {
    if (v12)
      goto LABEL_3;
    goto LABEL_22;
  }
  brc_bread_crumbs();
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v27 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
    -[BRCURLToItemLookup initWithURL:allowAppLibraryRoot:session:db:].cold.5();

  if (!v12)
  {
LABEL_22:
    brc_bread_crumbs();
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT))
      -[BRCURLToItemLookup initWithURL:allowAppLibraryRoot:session:db:].cold.4();

  }
LABEL_3:
  v31.receiver = self;
  v31.super_class = (Class)BRCURLToItemLookup;
  v14 = -[BRCURLToItemLookup init](&v31, sel_init);
  if (v14)
  {
    objc_msgSend(v11, "path");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "stringByDeletingLastPathComponent");
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = (void *)*((_QWORD *)v14 + 10);
    *((_QWORD *)v14 + 10) = v16;

    objc_msgSend(v11, "lastPathComponent");
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = (void *)*((_QWORD *)v14 + 9);
    *((_QWORD *)v14 + 9) = v18;

    *((_BYTE *)v14 + 40) = a4;
    objc_storeStrong((id *)v14 + 4, a6);
    if (objc_msgSend(*((id *)v14 + 9), "br_isSideFaultName"))
    {
      *((_BYTE *)v14 + 16) |= 0x14u;
      v30 = 0;
      v20 = (void *)_CFURLCopyLogicalNameOfPromiseAtURL();
      v21 = v20;
      if (v20)
      {
        v22 = v20;
        v23 = *((_QWORD *)v14 + 9);
        *((_QWORD *)v14 + 9) = v22;
      }
      else
      {
        brc_bread_crumbs();
        v23 = objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, (os_log_type_t)0x90u))
          -[BRCURLToItemLookup initWithURL:allowAppLibraryRoot:session:db:].cold.1(&v30);

      }
    }
    else
    {
      if (*((_QWORD *)v14 + 9))
      {
LABEL_17:
        objc_storeStrong((id *)v14 + 6, a3);
        objc_storeStrong((id *)v14 + 1, a5);
        goto LABEL_18;
      }
      if (objc_msgSend(v11, "isFileReferenceURL"))
      {
        brc_bread_crumbs();
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
          -[BRCURLToItemLookup initWithURL:allowAppLibraryRoot:session:db:].cold.2((uint64_t)v11);
      }
      else
      {
        brc_bread_crumbs();
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, (os_log_type_t)0x90u))
          -[BRCURLToItemLookup initWithURL:allowAppLibraryRoot:session:db:].cold.3((uint64_t)v11);
      }
    }

    goto LABEL_17;
  }
LABEL_18:

  return (BRCURLToItemLookup *)v14;
}

- (BRCURLToItemLookup)initWithURL:(id)a3 session:(id)a4
{
  return -[BRCURLToItemLookup initWithURL:allowAppLibraryRoot:session:](self, "initWithURL:allowAppLibraryRoot:session:", a3, 0, a4);
}

- (BOOL)resolveAndKeepOpenWithError:(id *)a3
{
  BOOL v5;
  void *v6;
  void *v7;
  unsigned int v9;

  v9 = 0;
  v5 = 1;
  if (!-[BRCURLToItemLookup resolveParentAndKeepOpenMustExist:errcode:](self, "resolveParentAndKeepOpenMustExist:errcode:", 1, &v9))
  {
    if (!self->_allowAppLibraryRoot)
      goto LABEL_8;
    -[BRCURLToItemLookup relpath](self, "relpath");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    v5 = v6 != 0;
    if (v6)
    {
      if (!self->_allowAppLibraryRoot
        || objc_msgSend(v6, "type") != 2 && objc_msgSend(v7, "type") != 3)
      {

LABEL_8:
        if (!a3)
          return 0;
        objc_msgSend(MEMORY[0x1E0CB35C8], "br_errorWithPOSIXCode:", v9);
        v5 = 0;
        *a3 = (id)objc_claimAutoreleasedReturnValue();
        return v5;
      }
    }
    else if (a3)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "br_errorWithPOSIXCode:", v9);
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }

  }
  return v5;
}

- (BOOL)resolveParentAndKeepOpenMustExist:(BOOL)a3 errcode:(int *)a4
{
  _BOOL8 v5;
  NSString *parentPath;
  BRCRelativePath *v8;
  BRCRelativePath *parentRelpath;
  void *v11;
  NSObject *v12;

  v5 = a3;
  *(_BYTE *)&self->_hasFetched.var0 |= 0x40u;
  parentPath = self->_parentPath;
  if (parentPath)
  {
    -[BRCAccountSession resolvedOpenRelpathForPath:mustExist:allowResolveInPkg:errcode:](self->_session, "resolvedOpenRelpathForPath:mustExist:allowResolveInPkg:errcode:", parentPath, v5, 1, a4);
    v8 = (BRCRelativePath *)objc_claimAutoreleasedReturnValue();
    parentRelpath = self->_parentRelpath;
    self->_parentRelpath = v8;

    if (-[BRCRelativePath exists](self->_parentRelpath, "exists"))
    {
      if (!-[BRCRelativePath isUnixDir](self->_parentRelpath, "isUnixDir"))
      {
        brc_bread_crumbs();
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
          -[BRCURLToItemLookup resolveParentAndKeepOpenMustExist:errcode:].cold.1();

      }
    }
  }
  return self->_parentRelpath != 0;
}

- (void)closePaths
{
  -[BRCRelativePath close](self->__relpath, "close");
  -[BRCRelativePath close](self->_parentRelpath, "close");
  -[BRCRelativePath close](self->_faultedRelpath, "close");
}

- (BRCLocalItem)parentItem
{
  char var0;
  BRCRelativePath *parentRelpath;
  int v5;
  BRCLocalItem *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  BRCLocalItem *v12;
  BRCLocalItem *v13;
  void *v14;
  BRCLocalItem *v15;
  BRCLocalItem *parentItem;
  NSObject *v17;
  void *v19;
  NSObject *v20;
  void *v21;
  NSObject *v22;

  var0 = (char)self->_hasFetched.var0;
  if ((var0 & 0x40) != 0)
  {
    if ((*(_BYTE *)&self->_hasFetched.var0 & 1) != 0)
      return self->_parentItem;
  }
  else
  {
    brc_bread_crumbs();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
      -[BRCURLToItemLookup parentItem].cold.3();

    var0 = (char)self->_hasFetched.var0;
    if ((var0 & 1) != 0)
      return self->_parentItem;
  }
  parentRelpath = self->_parentRelpath;
  *(_BYTE *)&self->_hasFetched.var0 = var0 | 1;
  if (parentRelpath)
  {
    v5 = -[BRCRelativePath type](parentRelpath, "type");
    if ((v5 - 4) >= 3)
    {
      if ((v5 - 2) > 1)
      {
        brc_bread_crumbs();
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
          -[BRCURLToItemLookup parentItem].cold.1((id *)&self->_parentRelpath, (uint64_t)v7, v17);

      }
      else
      {
        -[BRCRelativePath appLibrary](self->_parentRelpath, "appLibrary");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v14)
        {
          brc_bread_crumbs();
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v22 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
            -[BRCURLToItemLookup parentItem].cold.2();

        }
        -[BRCRelativePath appLibrary](self->_parentRelpath, "appLibrary");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "fetchRootItemInDB:", self->_db);
        v15 = (BRCLocalItem *)objc_claimAutoreleasedReturnValue();
        parentItem = self->_parentItem;
        self->_parentItem = v15;

      }
    }
    else
    {
      -[BRCAccountSession globalItemByFileID:db:](self->_session, "globalItemByFileID:db:", -[BRCRelativePath fileID](self->_parentRelpath, "fileID"), self->_db);
      v6 = (BRCLocalItem *)objc_claimAutoreleasedReturnValue();
      v7 = self->_parentItem;
      self->_parentItem = v6;
    }
    goto LABEL_14;
  }
  -[BRCURLToItemLookup relpath](self, "relpath");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "type");

  if (v9 == 3)
  {
    -[BRCURLToItemLookup relpath](self, "relpath");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "appLibrary");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "defaultClientZone");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "fetchZoneRootItemInDB:", self->_db);
    v12 = (BRCLocalItem *)objc_claimAutoreleasedReturnValue();
    v13 = self->_parentItem;
    self->_parentItem = v12;

LABEL_14:
  }
  return self->_parentItem;
}

- (void)_fetchRelPath
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_1(&dword_1CBD43000, v0, v1, "[DEBUG] can't create the relpath to a non-existing fault%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)refreshByPathDiffs
{
  BRCLocalItem *byPathLocalItem;

  byPathLocalItem = self->_byPathLocalItem;
  if (byPathLocalItem)
  {
    if (self->_byPathServerItem)
      byPathLocalItem = -[BRCLocalItem diffAgainstServerItem:](byPathLocalItem, "diffAgainstServerItem:");
    else
      byPathLocalItem = 0;
  }
  self->_byPathDiffs = (unint64_t)byPathLocalItem;
}

- (void)_fetchPathMatch
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] UNREACHABLE: this is going to have unexpected effect to take this branch%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- ($9EE3FC84C9B3A82DF6438513DA0F9593)byPathMatch
{
  $9EE3FC84C9B3A82DF6438513DA0F9593 *result;
  unint64_t byPathDiffs;

  if ((*(_BYTE *)&self->_hasFetched.var0 & 4) == 0)
    -[BRCURLToItemLookup _fetchPathMatch](self, "_fetchPathMatch");
  retstr->var0 = self->_byPathLocalItem;
  retstr->var1 = self->_byPathServerItem;
  retstr->var2 = self->__relpath;
  result = self->_parentRelpath;
  byPathDiffs = self->_byPathDiffs;
  retstr->var3 = result;
  retstr->var4 = byPathDiffs;
  return result;
}

- (BRCLocalItem)byPathLocalItem
{
  if ((*(_BYTE *)&self->_hasFetched.var0 & 4) == 0)
    -[BRCURLToItemLookup _fetchPathMatch](self, "_fetchPathMatch");
  return self->_byPathLocalItem;
}

- (BRCRelativePath)byPathRelpath
{
  if ((*(_BYTE *)&self->_hasFetched.var0 & 4) == 0)
    -[BRCURLToItemLookup _fetchPathMatch](self, "_fetchPathMatch");
  return self->__relpath;
}

- (BRCServerItem)byPathServerItem
{
  if ((*(_BYTE *)&self->_hasFetched.var0 & 4) == 0)
    -[BRCURLToItemLookup _fetchPathMatch](self, "_fetchPathMatch");
  return self->_byPathServerItem;
}

- (unint64_t)byPathDiffs
{
  if ((*(_BYTE *)&self->_hasFetched.var0 & 4) == 0)
    -[BRCURLToItemLookup _fetchPathMatch](self, "_fetchPathMatch");
  return self->_byPathDiffs;
}

- (void)clearByPathItem
{
  BRCLocalItem *byPathLocalItem;
  BRCServerItem *byPathServerItem;
  id v5;

  byPathLocalItem = self->_byPathLocalItem;
  self->_byPathLocalItem = 0;

  byPathServerItem = self->_byPathServerItem;
  self->_byPathServerItem = 0;

  v5 = -[BRCRelativePath refreshFromPathMustExist:](self->__relpath, "refreshFromPathMustExist:", 0);
}

- (void)refreshByIDDiffs
{
  BRCLocalItem *byIDLocalItem;

  byIDLocalItem = self->_byIDLocalItem;
  if (byIDLocalItem)
  {
    if (self->_byIDServerItem)
      byIDLocalItem = -[BRCLocalItem diffAgainstServerItem:](byIDLocalItem, "diffAgainstServerItem:");
    else
      byIDLocalItem = 0;
  }
  self->_byIDDiffs = (unint64_t)byIDLocalItem;
}

- (void)_fetchIDMatch
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: _allowAppLibraryRoot%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- ($9EE3FC84C9B3A82DF6438513DA0F9593)byIDMatch
{
  $9EE3FC84C9B3A82DF6438513DA0F9593 *result;
  unint64_t byIDDiffs;

  if ((*(_BYTE *)&self->_hasFetched.var0 & 0x10) == 0)
    -[BRCURLToItemLookup _fetchIDMatch](self, "_fetchIDMatch");
  retstr->var0 = self->_byIDLocalItem;
  retstr->var1 = self->_byIDServerItem;
  retstr->var2 = self->__relpath;
  result = self->_parentRelpath;
  byIDDiffs = self->_byIDDiffs;
  retstr->var3 = result;
  retstr->var4 = byIDDiffs;
  return result;
}

- (BRCLocalItem)byIDLocalItem
{
  if ((*(_BYTE *)&self->_hasFetched.var0 & 0x10) == 0)
    -[BRCURLToItemLookup _fetchIDMatch](self, "_fetchIDMatch");
  return self->_byIDLocalItem;
}

- (BRCRelativePath)relpath
{
  if ((*(_BYTE *)&self->_hasFetched.var0 & 2) == 0)
    -[BRCURLToItemLookup _fetchRelPath](self, "_fetchRelPath");
  return self->__relpath;
}

- (BRCServerItem)byIDServerItem
{
  if ((*(_BYTE *)&self->_hasFetched.var0 & 0x10) == 0)
    -[BRCURLToItemLookup _fetchIDMatch](self, "_fetchIDMatch");
  return self->_byIDServerItem;
}

- (unint64_t)byIDDiffs
{
  if ((*(_BYTE *)&self->_hasFetched.var0 & 0x10) == 0)
    -[BRCURLToItemLookup _fetchIDMatch](self, "_fetchIDMatch");
  return self->_byIDDiffs;
}

- (void)clearByIDItem
{
  BRCLocalItem *byIDLocalItem;
  BRCServerItem *byIDServerItem;
  id v5;

  byIDLocalItem = self->_byIDLocalItem;
  self->_byIDLocalItem = 0;

  byIDServerItem = self->_byIDServerItem;
  self->_byIDServerItem = 0;

  v5 = -[BRCRelativePath refreshFromPathMustExist:](self->__relpath, "refreshFromPathMustExist:", 0);
}

- (void)refreshFaultedDiffs
{
  BRCDocumentItem *faultedLocalItem;

  faultedLocalItem = self->_faultedLocalItem;
  if (faultedLocalItem)
  {
    if (self->_faultedServerItem)
      faultedLocalItem = -[BRCDocumentItem diffAgainstServerItem:](faultedLocalItem, "diffAgainstServerItem:");
    else
      faultedLocalItem = 0;
  }
  self->_faultedDiffs = (unint64_t)faultedLocalItem;
}

- ($9EE3FC84C9B3A82DF6438513DA0F9593)faultedMatch
{
  $9EE3FC84C9B3A82DF6438513DA0F9593 *result;
  unint64_t faultedDiffs;

  if ((*(_BYTE *)&self->_hasFetched.var0 & 8) == 0)
    -[BRCURLToItemLookup _fetchFaultedMatch](self, "_fetchFaultedMatch");
  retstr->var0 = self->_faultedLocalItem;
  retstr->var1 = self->_faultedServerItem;
  retstr->var2 = self->_faultedRelpath;
  result = self->_parentRelpath;
  faultedDiffs = self->_faultedDiffs;
  retstr->var3 = result;
  retstr->var4 = faultedDiffs;
  return result;
}

- (void)_fetchFaultedMatch
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
  _os_log_fault_impl(&dword_1CBD43000, log, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: unexpected error when resolving a path %{errno}d%@", (uint8_t *)v4, 0x12u);
  OUTLINED_FUNCTION_2();
}

- (BRCRelativePath)faultedRelpath
{
  if ((*(_BYTE *)&self->_hasFetched.var0 & 8) == 0)
    -[BRCURLToItemLookup _fetchFaultedMatch](self, "_fetchFaultedMatch");
  return self->_faultedRelpath;
}

- (BRCServerItem)faultedServerItem
{
  if ((*(_BYTE *)&self->_hasFetched.var0 & 8) == 0)
    -[BRCURLToItemLookup _fetchFaultedMatch](self, "_fetchFaultedMatch");
  return self->_faultedServerItem;
}

- (BRCDocumentItem)faultedLocalItem
{
  if ((*(_BYTE *)&self->_hasFetched.var0 & 8) == 0)
    -[BRCURLToItemLookup _fetchFaultedMatch](self, "_fetchFaultedMatch");
  return self->_faultedLocalItem;
}

- (unint64_t)faultedDiffs
{
  if ((*(_BYTE *)&self->_hasFetched.var0 & 8) == 0)
    -[BRCURLToItemLookup _fetchFaultedMatch](self, "_fetchFaultedMatch");
  return self->_faultedDiffs;
}

- (void)clearFaultedItem
{
  BRCDocumentItem *faultedLocalItem;
  BRCServerItem *faultedServerItem;
  id v5;

  faultedLocalItem = self->_faultedLocalItem;
  self->_faultedLocalItem = 0;

  faultedServerItem = self->_faultedServerItem;
  self->_faultedServerItem = 0;

  v5 = -[BRCRelativePath refreshFromPathMustExist:](self->_faultedRelpath, "refreshFromPathMustExist:", 0);
}

- (unsigned)pathType
{
  void *v2;
  unsigned __int16 v3;

  -[BRCURLToItemLookup relpath](self, "relpath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "type");

  return v3;
}

- (void)_fetchReservedPathMatch
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_1(&dword_1CBD43000, v0, v1, "[DEBUG] can't fetch the reserved path-match with a non-existing fault%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- ($9EE3FC84C9B3A82DF6438513DA0F9593)reservedMatch
{
  $9EE3FC84C9B3A82DF6438513DA0F9593 *result;

  if ((*(_BYTE *)&self->_hasFetched.var0 & 0x20) == 0)
    -[BRCURLToItemLookup _fetchReservedPathMatch](self, "_fetchReservedPathMatch");
  retstr->var0 = self->_reservedLocalItem;
  result = self->_reservedServerItem;
  retstr->var1 = result;
  retstr->var2 = 0;
  retstr->var3 = 0;
  retstr->var4 = 0;
  return result;
}

- (BRCLocalItem)reservedLocalItem
{
  if ((*(_BYTE *)&self->_hasFetched.var0 & 0x20) == 0)
    -[BRCURLToItemLookup _fetchReservedPathMatch](self, "_fetchReservedPathMatch");
  return self->_reservedLocalItem;
}

- (BRCServerItem)reservedServerItem
{
  if ((*(_BYTE *)&self->_hasFetched.var0 & 0x20) == 0)
    -[BRCURLToItemLookup _fetchReservedPathMatch](self, "_fetchReservedPathMatch");
  return self->_reservedServerItem;
}

- (void)clearReservedItem
{
  BRCLocalItem *reservedLocalItem;
  BRCServerItem *reservedServerItem;

  reservedLocalItem = self->_reservedLocalItem;
  self->_reservedLocalItem = 0;

  reservedServerItem = self->_reservedServerItem;
  self->_reservedServerItem = 0;

}

- (BRCPQLConnection)db
{
  return self->_db;
}

- (NSURL)url
{
  return self->_url;
}

- (BRCAccountSession)session
{
  return self->_session;
}

- (BRCRelativePath)parentRelpath
{
  return self->_parentRelpath;
}

- (NSString)filename
{
  return self->_filename;
}

- (NSString)parentPath
{
  return self->_parentPath;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reservedServerItem, 0);
  objc_storeStrong((id *)&self->_reservedLocalItem, 0);
  objc_storeStrong((id *)&self->_faultedRelpath, 0);
  objc_storeStrong((id *)&self->_faultedServerItem, 0);
  objc_storeStrong((id *)&self->_faultedLocalItem, 0);
  objc_storeStrong((id *)&self->_byPathServerItem, 0);
  objc_storeStrong((id *)&self->_byPathLocalItem, 0);
  objc_storeStrong((id *)&self->_byIDServerItem, 0);
  objc_storeStrong((id *)&self->_byIDLocalItem, 0);
  objc_storeStrong((id *)&self->_parentPath, 0);
  objc_storeStrong((id *)&self->_filename, 0);
  objc_storeStrong((id *)&self->_parentItem, 0);
  objc_storeStrong((id *)&self->_parentRelpath, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_db, 0);
  objc_storeStrong((id *)&self->__relpath, 0);
  objc_storeStrong((id *)&self->_session, 0);
}

- (void)markPathMatchLostIfLocationDoesntMatch:(id *)a3
{
  id v4;
  id v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  int v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  const char *v16;
  NSObject *v17;
  uint32_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  int v22;
  void *v23;
  __int16 v24;
  _BYTE v25[18];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3->var0;
  v5 = a3->var2;
  if (objc_msgSend(v4, "isLive"))
  {
    if ((objc_msgSend(v5, "exists") & 1) == 0)
    {
      brc_bread_crumbs();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        -[BRCURLToItemLookup(BRCFSReader) markPathMatchLostIfLocationDoesntMatch:].cold.1();
      goto LABEL_9;
    }
    v6 = objc_msgSend(v4, "isDocument");
    objc_msgSend(v4, "st");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (!v6)
    {
      objc_msgSend(v7, "fileID");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "unsignedLongLongValue");
      v21 = objc_msgSend(v5, "fileID");

      if (v20 == v21)
        goto LABEL_10;
      brc_bread_crumbs();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v13 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        goto LABEL_9;
      objc_msgSend(v4, "st");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "fileID");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 138412802;
      v23 = v15;
      v24 = 2048;
      *(_QWORD *)v25 = objc_msgSend(v5, "fileID");
      *(_WORD *)&v25[8] = 2112;
      *(_QWORD *)&v25[10] = v12;
      v16 = "[DEBUG] Item file ID doesn't match: %@ != %lld%@";
      v17 = v13;
      v18 = 32;
      goto LABEL_14;
    }
    objc_msgSend(v7, "documentID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "unsignedLongLongValue");
    v11 = objc_msgSend(v5, "documentID");

    if (v10 != v11)
    {
      brc_bread_crumbs();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v13 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
LABEL_9:

        objc_msgSend(v4, "markLostClearGenerationID:backoffMode:", 0, 1);
        objc_msgSend(v4, "saveToDB");
        goto LABEL_10;
      }
      objc_msgSend(v4, "st");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "documentID");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 138412802;
      v23 = v15;
      v24 = 1024;
      *(_DWORD *)v25 = objc_msgSend(v5, "documentID");
      *(_WORD *)&v25[4] = 2112;
      *(_QWORD *)&v25[6] = v12;
      v16 = "[DEBUG] Item document ID doesn't match: %@ != %u%@";
      v17 = v13;
      v18 = 28;
LABEL_14:
      _os_log_debug_impl(&dword_1CBD43000, v17, OS_LOG_TYPE_DEBUG, v16, (uint8_t *)&v22, v18);

      goto LABEL_9;
    }
  }
LABEL_10:

}

- (void)handleReservedPathMatchesIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  unsigned int v23;
  void *v24;
  unsigned int v25;
  void *v26;
  int v27;
  void *v28;
  NSObject *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  int v36;
  void *v37;
  NSObject *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  __int16 v43;
  uint64_t v44[3];
  uint8_t buf[4];
  uint64_t v46;
  __int16 v47;
  void *v48;
  __int16 v49;
  void *v50;
  __int16 v51;
  void *v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  -[BRCURLToItemLookup reservedLocalItem](self, "reservedLocalItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCURLToItemLookup reservedServerItem](self, "reservedServerItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    if ((objc_msgSend(v3, "isBRAlias") & 1) != 0)
      goto LABEL_47;
    objc_msgSend(v3, "clientZone");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "isSharedZone"))
    {
      objc_msgSend(v3, "appLibrary");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v6, "state") & 0x800) != 0)
      {

LABEL_12:
        brc_bread_crumbs();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
          -[BRCURLToItemLookup(BRCFSReader) handleReservedPathMatchesIfNeeded].cold.3();

        -[BRCAccountSession applyScheduler](self->_session, "applyScheduler");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v4, "rank");
        objc_msgSend(v4, "serverZone");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "dbRowID");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setState:forRank:zoneRowID:", 22, v17, v19);

        -[BRCURLToItemLookup clearReservedItem](self, "clearReservedItem");
        goto LABEL_47;
      }
      objc_msgSend(v4, "parentZoneOnFS");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v7, "isPrivateZone") & 1) != 0)
      {
        objc_msgSend(v4, "parentZoneOnFS");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "asPrivateZone");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "clientZone");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "defaultAppLibrary");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = objc_msgSend(v11, "state");

        if ((v43 & 0x800) == 0)
        {
LABEL_17:
          -[BRCURLToItemLookup byPathLocalItem](self, "byPathLocalItem");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = v20;
          if (!v20)
          {
            -[BRCURLToItemLookup byPathRelpath](self, "byPathRelpath");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v27 = objc_msgSend(v26, "exists");

            if (v27)
            {
              brc_bread_crumbs();
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              brc_default_log();
              v29 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
                -[BRCURLToItemLookup(BRCFSReader) handleReservedPathMatchesIfNeeded].cold.2();

              objc_msgSend(v3, "scanParentDirectory");
              -[BRCAccountSession applyScheduler](self->_session, "applyScheduler");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              v31 = objc_msgSend(v4, "rank");
              objc_msgSend(v4, "serverZone");
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v32, "dbRowID");
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v30, "setState:forRank:zoneRowID:", 22, v31, v33);

              -[BRCURLToItemLookup clearReservedItem](self, "clearReservedItem");
            }
            goto LABEL_46;
          }
          objc_msgSend(v20, "st");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = objc_msgSend(v22, "type");
          objc_msgSend(v3, "st");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = objc_msgSend(v24, "type");
          if (v23 == v25)
            goto LABEL_38;
          if (v23 > 0xA)
            goto LABEL_45;
          if (((1 << v23) & 0x611) != 0)
          {
            if (v25 <= 0xA && ((1 << v25) & 0x611) != 0)
              goto LABEL_38;
            if (v23 - 1 >= 2)
            {
              if (v23 == 6)
                goto LABEL_37;
              if (v23 != 8)
                goto LABEL_45;
            }
          }
          else if (((1 << v23) & 0x106) == 0)
          {
            if (v23 != 6)
              goto LABEL_45;
            goto LABEL_37;
          }
          if (v25 <= 8 && ((1 << v25) & 0x106) != 0)
            goto LABEL_38;
          if (v23 != 6)
            goto LABEL_45;
LABEL_37:
          if (v25 == 6)
          {
LABEL_38:
            objc_msgSend(v21, "clientZone");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v3, "clientZone");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            v36 = objc_msgSend(v34, "isEqualToClientZone:", v35);

            if (v36
              && (objc_msgSend(v3, "isDirectory")
               && !objc_msgSend(v21, "isKnownByServerOrInFlight")
               || objc_msgSend(v21, "isFromInitialScan")))
            {
              memset(v44, 0, sizeof(v44));
              __brc_create_section(0, (uint64_t)"-[BRCURLToItemLookup(BRCFSReader) handleReservedPathMatchesIfNeeded]", 234, v44);
              brc_bread_crumbs();
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              brc_default_log();
              v38 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 134218754;
                v46 = v44[0];
                v47 = 2112;
                v48 = v21;
                v49 = 2112;
                v50 = v3;
                v51 = 2112;
                v52 = v37;
                _os_log_debug_impl(&dword_1CBD43000, v38, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx detected a path-match at apply-changes time with %@\nmatching %@%@", buf, 0x2Au);
              }

              objc_msgSend(v3, "markNeedsDeleteForRescheduleOfItem:", 0);
              objc_msgSend(v3, "saveToDBForServerEdit:keepAliases:", 0, 1);
              objc_msgSend(v3, "itemID");
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              -[BRCURLToItemLookup relpath](self, "relpath");
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "learnItemID:serverItem:path:markLost:", v39, v4, v40, 1);

              objc_msgSend(v21, "saveToDB");
              objc_msgSend(v21, "serverZone");
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v41, "clientZone");
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v42, "scheduleSyncUp");

              -[BRCURLToItemLookup clearReservedItem](self, "clearReservedItem");
              __brc_leave_section(v44);
            }
            goto LABEL_46;
          }
LABEL_45:

LABEL_46:
          goto LABEL_47;
        }
        goto LABEL_12;
      }

    }
    goto LABEL_17;
  }
  brc_bread_crumbs();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, (os_log_type_t)0x90u))
    -[BRCURLToItemLookup(BRCFSReader) handleReservedPathMatchesIfNeeded].cold.1();

  objc_msgSend(v3, "markRemovedFromFilesystemForServerEdit:", 0);
  objc_msgSend(v3, "saveToDB");
  -[BRCURLToItemLookup clearReservedItem](self, "clearReservedItem");
LABEL_47:

}

- (void)matchLookupItemsWithDisk
{
  void *v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9[3];
  _OWORD v10[2];
  uint64_t v11;
  _OWORD v12[2];
  uint64_t v13;
  id v14[4];
  uint64_t v15;
  uint8_t buf[4];
  uint64_t v17;
  __int16 v18;
  BRCURLToItemLookup *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v15 = 0;
  memset(v14, 0, sizeof(v14));
  -[BRCURLToItemLookup byPathMatch](self, "byPathMatch");
  v13 = 0;
  memset(v12, 0, sizeof(v12));
  -[BRCURLToItemLookup faultedMatch](self, "faultedMatch");
  v11 = 0;
  memset(v10, 0, sizeof(v10));
  -[BRCURLToItemLookup reservedMatch](self, "reservedMatch");
  memset(v9, 0, sizeof(v9));
  __brc_create_section(0, (uint64_t)"-[BRCURLToItemLookup(BRCFSReader) matchLookupItemsWithDisk]", 265, v9);
  brc_bread_crumbs();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218498;
    v17 = v9[0];
    v18 = 2112;
    v19 = self;
    v20 = 2112;
    v21 = v3;
    _os_log_debug_impl(&dword_1CBD43000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx match lookup with disk %@%@", buf, 0x20u);
  }

  if (v14[0])
  {
    brc_bread_crumbs();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      -[BRCURLToItemLookup(BRCFSReader) matchLookupItemsWithDisk].cold.2();

    -[BRCURLToItemLookup markPathMatchLostIfLocationDoesntMatch:](self, "markPathMatchLostIfLocationDoesntMatch:", v14);
  }
  if (*(_QWORD *)&v12[0])
  {
    brc_bread_crumbs();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      -[BRCURLToItemLookup(BRCFSReader) matchLookupItemsWithDisk].cold.1();

    -[BRCURLToItemLookup markPathMatchLostIfLocationDoesntMatch:](self, "markPathMatchLostIfLocationDoesntMatch:", v12);
  }
  if (*(_QWORD *)&v10[0])
    -[BRCURLToItemLookup handleReservedPathMatchesIfNeeded](self, "handleReservedPathMatchesIfNeeded");
  __brc_leave_section(v9);
  __destructor_8_s0_s8_s16_s24((id *)v10);
  __destructor_8_s0_s8_s16_s24((id *)v12);
  __destructor_8_s0_s8_s16_s24(v14);
}

- (BOOL)_bounceBouncesHiddenByFault:(id)a3
{
  return 1;
}

- (void)_clearNamespace:(unsigned __int8)a3
{
  if (a3)
  {
    if (a3 == 1)
    {
      -[BRCURLToItemLookup clearFaultedItem](self, "clearFaultedItem");
    }
    else if (a3 == 2)
    {
      -[BRCURLToItemLookup clearReservedItem](self, "clearReservedItem");
    }
  }
  else
  {
    -[BRCURLToItemLookup clearByPathItem](self, "clearByPathItem");
  }
}

- ($9EE3FC84C9B3A82DF6438513DA0F9593)_pathMatchInNamespace:(SEL)a3
{
  $9EE3FC84C9B3A82DF6438513DA0F9593 *result;
  void *v5;
  NSObject *v6;

  switch(a4)
  {
    case 0u:
      return -[BRCURLToItemLookup byPathMatch](self, "byPathMatch");
    case 1u:
      return -[BRCURLToItemLookup faultedMatch](self, "faultedMatch");
    case 2u:
      return -[BRCURLToItemLookup reservedMatch](self, "reservedMatch");
  }
  brc_bread_crumbs();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    -[BRCURLToItemLookup(BRCFSWriter) _pathMatchInNamespace:].cold.1();

  return result;
}

- (void)_moveMissingItemAsideInNamespace:(unsigned __int8)a3
{
  uint64_t v3;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  NSObject *v10;

  v3 = a3;
  if (a3)
  {
    if (a3 != 1)
    {
      if (a3 != 2)
        return;
      brc_bread_crumbs();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
        -[BRCURLToItemLookup(BRCFSWriter) _moveMissingItemAsideInNamespace:].cold.2();

    }
    -[BRCURLToItemLookup faultedLocalItem](self, "faultedLocalItem");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[BRCURLToItemLookup byPathLocalItem](self, "byPathLocalItem");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  v8 = (void *)v7;
  if (v7)
  {
    brc_bread_crumbs();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      -[BRCURLToItemLookup(BRCFSWriter) _moveMissingItemAsideInNamespace:].cold.1();

    if (objc_msgSend(v8, "isLive"))
      objc_msgSend(v8, "markLostClearGenerationID:backoffMode:", 0, 1);
    objc_msgSend(v8, "moveAsideLocally");
    objc_msgSend(v8, "saveToDB");
    -[BRCURLToItemLookup _clearNamespace:](self, "_clearNamespace:", v3);

  }
}

- (BOOL)_removeDirectory:(id)a3 atPath:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  __int128 v13;
  void *v14;
  int v15;
  void *v16;
  NSObject *v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  void *v21;
  NSObject *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  NSObject *v26;
  id v27;
  void *v28;
  NSObject *v29;
  BRCPathToItemLookup *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  NSObject *v36;
  char v37;
  void *v38;
  void *v39;
  NSObject *v40;
  void *v41;
  NSObject *v42;
  void *v43;
  NSObject *v44;
  const char *v46;
  const char *v47;
  const char *v48;
  const char *v49;
  const char *v50;
  void *v51;
  NSObject *v52;
  void *v53;
  NSObject *v54;
  void *v55;
  NSObject *v56;
  __int128 v57;
  _QWORD v58[4];
  id v59;
  BRCURLToItemLookup *v60;
  int v61;
  unsigned int v62;
  unsigned int v63;
  uint8_t buf[4];
  _BYTE v65[44];
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if ((objc_msgSend(v8, "isDirectory") & 1) == 0)
  {
    brc_bread_crumbs();
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v52 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v52, OS_LOG_TYPE_FAULT))
      -[BRCURLToItemLookup(BRCFSWriter) _removeDirectory:atPath:error:].cold.4();

  }
  if ((objc_msgSend(v9, "exists") & 1) == 0)
  {
    brc_bread_crumbs();
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v54 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v54, OS_LOG_TYPE_FAULT))
      -[BRCURLToItemLookup(BRCFSWriter) _removeDirectory:atPath:error:].cold.3();

  }
  if (objc_msgSend(v9, "isDocument"))
  {
    brc_bread_crumbs();
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v56 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v56, OS_LOG_TYPE_FAULT))
      -[BRCURLToItemLookup(BRCFSWriter) _removeDirectory:atPath:error:].cold.2();

  }
  v63 = 0;
  v10 = -[BRCDirectoryEnumerator initForEnumeratingBelow:recursive:error:]([BRCDirectoryEnumerator alloc], "initForEnumeratingBelow:recursive:error:", v9, 0, &v63);
  v11 = v10;
  if (!v10)
  {
    brc_bread_crumbs();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, (os_log_type_t)0x90u))
    {
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)v65 = v9;
      *(_WORD *)&v65[8] = 1024;
      *(_DWORD *)&v65[10] = v63;
      *(_WORD *)&v65[14] = 2112;
      *(_QWORD *)&v65[16] = v21;
      _os_log_error_impl(&dword_1CBD43000, v22, (os_log_type_t)0x90u, "[ERROR] failed opening %@ for scanning %{errno}d%@", buf, 0x1Cu);
    }

    brc_bread_crumbs();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
      -[BRCURLToItemLookup(BRCFSWriter) _removeDirectory:atPath:error:].cold.1();

    objc_msgSend(MEMORY[0x1E0CB35C8], "br_errorWithPOSIXCode:", v63);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      brc_bread_crumbs();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, (os_log_type_t)0x90u))
      {
        v46 = "(passed to caller)";
        *(_DWORD *)buf = 136315906;
        *(_QWORD *)v65 = "-[BRCURLToItemLookup(BRCFSWriter) _removeDirectory:atPath:error:]";
        *(_WORD *)&v65[8] = 2080;
        if (!a5)
          v46 = "(ignored by caller)";
        *(_QWORD *)&v65[10] = v46;
        *(_WORD *)&v65[18] = 2112;
        *(_QWORD *)&v65[20] = v14;
        *(_WORD *)&v65[28] = 2112;
        *(_QWORD *)&v65[30] = v25;
        _os_log_error_impl(&dword_1CBD43000, v26, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
      }

    }
    if (!a5)
      goto LABEL_61;
    v27 = objc_retainAutorelease(v14);
    goto LABEL_34;
  }
  objc_msgSend(v10, "nextObject");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v14 = (void *)v12;
    v15 = 0;
    *(_QWORD *)&v13 = 138412802;
    v57 = v13;
    while (1)
    {
      v62 = 0;
      if ((objc_msgSend(v14, "resolveAndKeepOpenMustExist:error:", 1, &v62, v57) & 1) != 0)
        break;
      if (objc_msgSend(v14, "isExcluded"))
      {
        brc_bread_crumbs();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 67109890;
          *(_DWORD *)v65 = v15;
          *(_WORD *)&v65[4] = 2112;
          *(_QWORD *)&v65[6] = v14;
          *(_WORD *)&v65[14] = 2112;
          *(_QWORD *)&v65[16] = v9;
          *(_WORD *)&v65[24] = 2112;
          *(_QWORD *)&v65[26] = v16;
          _os_log_debug_impl(&dword_1CBD43000, v17, OS_LOG_TYPE_DEBUG, "[DEBUG] excluded child %d: %@\nunder directory: %@%@", buf, 0x26u);
        }

        ++v15;
      }
      else
      {
        if (v62 != 2)
        {
          brc_bread_crumbs();
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v42 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v42, (os_log_type_t)0x90u))
          {
            *(_DWORD *)buf = 138413314;
            *(_QWORD *)v65 = v14;
            *(_WORD *)&v65[8] = 2112;
            *(_QWORD *)&v65[10] = v9;
            *(_WORD *)&v65[18] = 2112;
            *(_QWORD *)&v65[20] = v8;
            *(_WORD *)&v65[28] = 1024;
            *(_DWORD *)&v65[30] = v62;
            *(_WORD *)&v65[34] = 2112;
            *(_QWORD *)&v65[36] = v41;
            _os_log_error_impl(&dword_1CBD43000, v42, (os_log_type_t)0x90u, "[ERROR] can't resolve child: %@\nunder directory:     %@\nfor directory item:  %@\n %{errno}d%@", buf, 0x30u);
          }

          objc_msgSend(MEMORY[0x1E0CB35C8], "br_errorWithPOSIXCode:", v62);
          v30 = (BRCPathToItemLookup *)objc_claimAutoreleasedReturnValue();
          if (v30)
          {
            brc_bread_crumbs();
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            brc_default_log();
            v44 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v44, (os_log_type_t)0x90u))
            {
              v49 = "(passed to caller)";
              *(_DWORD *)buf = 136315906;
              *(_QWORD *)v65 = "-[BRCURLToItemLookup(BRCFSWriter) _removeDirectory:atPath:error:]";
              *(_WORD *)&v65[8] = 2080;
              if (!a5)
                v49 = "(ignored by caller)";
              *(_QWORD *)&v65[10] = v49;
              *(_WORD *)&v65[18] = 2112;
              *(_QWORD *)&v65[20] = v30;
              *(_WORD *)&v65[28] = 2112;
              *(_QWORD *)&v65[30] = v43;
              _os_log_error_impl(&dword_1CBD43000, v44, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
            }

          }
          if (a5)
          {
            v30 = objc_retainAutorelease(v30);
            *a5 = v30;
          }
          goto LABEL_60;
        }
        brc_bread_crumbs();
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = v57;
          *(_QWORD *)v65 = v14;
          *(_WORD *)&v65[8] = 2112;
          *(_QWORD *)&v65[10] = v9;
          *(_WORD *)&v65[18] = 2112;
          *(_QWORD *)&v65[20] = v18;
          _os_log_debug_impl(&dword_1CBD43000, v19, OS_LOG_TYPE_DEBUG, "[DEBUG] child disappeared: %@\nunder directory:   %@%@", buf, 0x20u);
        }

      }
      objc_msgSend(v11, "nextObject");
      v20 = objc_claimAutoreleasedReturnValue();

      v14 = (void *)v20;
      if (!v20)
        goto LABEL_28;
    }
    v30 = -[BRCPathToItemLookup initWithRelativePath:]([BRCPathToItemLookup alloc], "initWithRelativePath:", v14);
    -[BRCPathToItemLookup byPath](v30, "byPath");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    brc_bread_crumbs();
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138413058;
      *(_QWORD *)v65 = v8;
      *(_WORD *)&v65[8] = 2112;
      *(_QWORD *)&v65[10] = v9;
      *(_WORD *)&v65[18] = 2112;
      *(_QWORD *)&v65[20] = v30;
      *(_WORD *)&v65[28] = 2112;
      *(_QWORD *)&v65[30] = v32;
      _os_log_debug_impl(&dword_1CBD43000, v33, OS_LOG_TYPE_DEBUG, "[DEBUG] can't delete directory %@\nat %@\nbecause of child %@%@", buf, 0x2Au);
    }

    if (!v31)
    {
      objc_msgSend(v8, "markLostClearGenerationID:backoffMode:", 1, 1);
      objc_msgSend(v8, "saveToDB");
    }
    objc_msgSend(v14, "close");
    objc_msgSend(MEMORY[0x1E0CB35C8], "br_errorWithPOSIXCode:", 66);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    if (v34)
    {
      brc_bread_crumbs();
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, (os_log_type_t)0x90u))
      {
        v48 = "(passed to caller)";
        *(_DWORD *)buf = 136315906;
        *(_QWORD *)v65 = "-[BRCURLToItemLookup(BRCFSWriter) _removeDirectory:atPath:error:]";
        *(_WORD *)&v65[8] = 2080;
        if (!a5)
          v48 = "(ignored by caller)";
        *(_QWORD *)&v65[10] = v48;
        *(_WORD *)&v65[18] = 2112;
        *(_QWORD *)&v65[20] = v34;
        *(_WORD *)&v65[28] = 2112;
        *(_QWORD *)&v65[30] = v35;
        _os_log_error_impl(&dword_1CBD43000, v36, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
      }

    }
    if (a5)
      *a5 = objc_retainAutorelease(v34);

LABEL_60:
    goto LABEL_61;
  }
  v15 = 0;
LABEL_28:
  if (v63)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "br_errorWithPOSIXCode:");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      brc_bread_crumbs();
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, (os_log_type_t)0x90u))
      {
        v47 = "(passed to caller)";
        *(_DWORD *)buf = 136315906;
        *(_QWORD *)v65 = "-[BRCURLToItemLookup(BRCFSWriter) _removeDirectory:atPath:error:]";
        *(_WORD *)&v65[8] = 2080;
        if (!a5)
          v47 = "(ignored by caller)";
        *(_QWORD *)&v65[10] = v47;
        *(_WORD *)&v65[18] = 2112;
        *(_QWORD *)&v65[20] = v14;
        *(_WORD *)&v65[28] = 2112;
        *(_QWORD *)&v65[30] = v28;
        _os_log_error_impl(&dword_1CBD43000, v29, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
      }

    }
    if (!a5)
      goto LABEL_61;
    v27 = objc_retainAutorelease(v14);
    v14 = v27;
LABEL_34:
    *a5 = v27;
LABEL_61:

    v37 = 0;
    goto LABEL_62;
  }
  v62 = 0;
  v58[0] = MEMORY[0x1E0C809B0];
  v58[1] = 3221225472;
  v58[2] = __65__BRCURLToItemLookup_BRCFSWriter___removeDirectory_atPath_error___block_invoke;
  v58[3] = &unk_1E8765F70;
  v61 = v15;
  v59 = v9;
  v60 = self;
  v37 = objc_msgSend(v59, "performOnOpenParentFileDescriptor:error:", v58, &v62);
  if ((v37 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "br_errorWithPOSIXCode:", v62);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    if (v38)
    {
      brc_bread_crumbs();
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v40 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v40, (os_log_type_t)0x90u))
      {
        v50 = "(passed to caller)";
        *(_DWORD *)buf = 136315906;
        *(_QWORD *)v65 = "-[BRCURLToItemLookup(BRCFSWriter) _removeDirectory:atPath:error:]";
        *(_WORD *)&v65[8] = 2080;
        if (!a5)
          v50 = "(ignored by caller)";
        *(_QWORD *)&v65[10] = v50;
        *(_WORD *)&v65[18] = 2112;
        *(_QWORD *)&v65[20] = v38;
        *(_WORD *)&v65[28] = 2112;
        *(_QWORD *)&v65[30] = v39;
        _os_log_error_impl(&dword_1CBD43000, v40, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
      }

    }
    if (a5)
      *a5 = objc_retainAutorelease(v38);

  }
LABEL_62:

  return v37;
}

uint64_t __65__BRCURLToItemLookup_BRCFSWriter___removeDirectory_atPath_error___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  NSObject *v10;
  void *v11;
  int v12;
  void *v13;
  NSObject *v14;
  uint64_t v16;
  int v17;
  void *v18;
  int v19;
  int v20;
  _BYTE v21[14];
  __int16 v22;
  _DWORD v23[7];

  *(_QWORD *)&v23[5] = *MEMORY[0x1E0C80C00];
  if (!*(_DWORD *)(a1 + 48))
  {
    brc_bread_crumbs();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      __65__BRCURLToItemLookup_BRCFSWriter___removeDirectory_atPath_error___block_invoke_cold_1(a1);

    objc_msgSend(*(id *)(a1 + 32), "filename");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = BRCUnlinkAt(a2, v11, 128);

    if (!v12)
      return 0;
    brc_bread_crumbs();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(*(id *)(a1 + 32), "filename");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = *__error();
      v20 = 67109890;
      *(_DWORD *)v21 = a2;
      *(_WORD *)&v21[4] = 2112;
      *(_QWORD *)&v21[6] = v18;
      v22 = 1024;
      v23[0] = v19;
      LOWORD(v23[1]) = 2112;
      *(_QWORD *)((char *)&v23[1] + 2) = v13;
      _os_log_debug_impl(&dword_1CBD43000, v14, OS_LOG_TYPE_DEBUG, "[DEBUG] rmdirat(%d, '%@') failed %{errno}d%@", (uint8_t *)&v20, 0x22u);

    }
    return *__error();
  }
  brc_bread_crumbs();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v16 = *(_QWORD *)(a1 + 32);
    v17 = *(_DWORD *)(a1 + 48);
    v20 = 138412802;
    *(_QWORD *)v21 = v16;
    *(_WORD *)&v21[8] = 1024;
    *(_DWORD *)&v21[10] = v17;
    v22 = 2112;
    *(_QWORD *)v23 = v4;
    _os_log_debug_impl(&dword_1CBD43000, v5, OS_LOG_TYPE_DEBUG, "[DEBUG] removing %@ and its %d excluded children%@", (uint8_t *)&v20, 0x1Cu);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "diskReclaimer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "filename");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "renameAndUnlinkInBackgroundItemAt:path:", a2, v7);

  if ((v8 & 1) == 0)
    return *__error();
  return 0;
}

- (BOOL)_canUpdatePathMatch:(id *)a3 hasAdditionsToApply:(BOOL)a4
{
  _BOOL4 v4;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  void *v14;
  int v15;
  void *v16;
  NSObject *v17;
  int v18;
  void *v19;
  int v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  NSObject *v34;
  const char *v35;
  const char *v36;
  const char *v37;
  void *v38;
  unint64_t v39;
  BOOL v41;
  void *v43;
  void *v44;
  void *v45;
  NSObject *v46;
  int v47;
  uint8_t buf[4];
  const char *v49;
  __int16 v50;
  _BYTE v51[10];
  _BYTE v52[10];
  void *v53;
  uint64_t v54;

  v4 = a4;
  v54 = *MEMORY[0x1E0C80C00];
  v7 = a3->var0;
  -[BRCAccountSession stageRegistry](self->_session, "stageRegistry");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = 0;
  if (+[BRCFSWriter _isPathMatchIdle:](BRCFSWriter, "_isPathMatchIdle:", a3))
  {
    objc_msgSend(v7, "st");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stagedFileID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = objc_msgSend(v10, "unsignedLongLongValue");
    if (v11)
    {
      v12 = v11;
      if ((objc_msgSend(v7, "isReserved") & 1) == 0 && (objc_msgSend(v8, "didFlushStagedFileID:", v12) & 1) == 0)
      {
        brc_bread_crumbs();
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v32 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
          -[BRCURLToItemLookup(BRCFSWriter) _canUpdatePathMatch:hasAdditionsToApply:].cold.5();

        -[BRCAccountSession applyScheduler](self->_session, "applyScheduler");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "setState:forServerItem:localItem:", 20, a3->var1, a3->var0);

        goto LABEL_52;
      }
      if ((objc_msgSend(v8, "existsInStage:generationID:", v12, &v47) & 1) == 0)
      {
        brc_bread_crumbs();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
          -[BRCURLToItemLookup(BRCFSWriter) _canUpdatePathMatch:hasAdditionsToApply:].cold.4();
        goto LABEL_25;
      }
      v13 = v47;
      objc_msgSend(v7, "st");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "stagedGenerationID");

      if (v13 != v15)
      {
        brc_bread_crumbs();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
        {
          v18 = v47;
          objc_msgSend(v7, "st");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v19, "stagedGenerationID");
          *(_DWORD *)buf = 138413058;
          v49 = (const char *)v7;
          v50 = 1024;
          *(_DWORD *)v51 = v18;
          *(_WORD *)&v51[4] = 1024;
          *(_DWORD *)&v51[6] = v20;
          *(_WORD *)v52 = 2112;
          *(_QWORD *)&v52[2] = v16;
          _os_log_fault_impl(&dword_1CBD43000, v17, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: Stage tampering - item %@ was edited in stage (%u != %u)%@", buf, 0x22u);

        }
LABEL_25:

        objc_msgSend(v7, "clearFromStage");
        objc_msgSend(v7, "saveToDB");
        goto LABEL_52;
      }
LABEL_16:
      if (objc_msgSend(v7, "isDocument"))
      {
        objc_msgSend(v7, "asDocument");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "desiredVersion");
        v25 = objc_claimAutoreleasedReturnValue();
        v26 = (void *)v25;
        if (!v25 && !v4)
        {
          brc_bread_crumbs();
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v28 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v28, (os_log_type_t)0x90u))
            -[BRCURLToItemLookup(BRCFSWriter) _canUpdatePathMatch:hasAdditionsToApply:].cold.2();

          brc_bread_crumbs();
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v30 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_FAULT))
            -[BRCURLToItemLookup(BRCFSWriter) _canUpdatePathMatch:hasAdditionsToApply:].cold.1();
LABEL_51:

          goto LABEL_52;
        }
        if (v25)
        {
          objc_msgSend(a3->var1, "latestVersion");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          v39 = objc_msgSend(v38, "diffAgainst:", v26);

          if (objc_msgSend(v24, "isPausedFromSync") ? v39 & 0xFFFFFFFFFC04FFFFLL : v39)
          {
            brc_bread_crumbs();
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            brc_default_log();
            v30 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
            {
              objc_msgSend(a3->var1, "latestVersion");
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              BRCItemFieldsPrettyPrint();
              v44 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138413058;
              v49 = (const char *)v26;
              v50 = 2112;
              *(_QWORD *)v51 = v43;
              *(_WORD *)&v51[8] = 2112;
              *(_QWORD *)v52 = v44;
              *(_WORD *)&v52[8] = 2112;
              v53 = v29;
              _os_log_debug_impl(&dword_1CBD43000, v30, OS_LOG_TYPE_DEBUG, "[DEBUG] staged version is stale:\nstaged: %@\nserver: %@\ndiffs:  %@%@", buf, 0x2Au);

            }
            goto LABEL_51;
          }
        }

      }
      v41 = 1;
      goto LABEL_53;
    }
    if (v10)
    {
      if (!objc_msgSend(v7, "isDocument") || objc_msgSend(v7, "isReserved"))
      {
        brc_bread_crumbs();
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v46 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v46, OS_LOG_TYPE_FAULT))
          -[BRCURLToItemLookup(BRCFSWriter) _canUpdatePathMatch:hasAdditionsToApply:].cold.3();

      }
      goto LABEL_16;
    }
    if ((objc_msgSend(v7, "isReserved") & 1) == 0 && (!objc_msgSend(v7, "isDocument") || v4))
      goto LABEL_16;
    brc_bread_crumbs();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      if (objc_msgSend(v7, "isReserved"))
        v35 = "YES";
      else
        v35 = "NO";
      *(_DWORD *)buf = 136315906;
      if (objc_msgSend(v7, "isDocument"))
        v36 = "YES";
      else
        v36 = "NO";
      v49 = v35;
      if (v4)
        v37 = "YES";
      else
        v37 = "NO";
      v50 = 2080;
      *(_QWORD *)v51 = v36;
      *(_WORD *)&v51[8] = 2080;
      *(_QWORD *)v52 = v37;
      *(_WORD *)&v52[8] = 2112;
      v53 = v23;
      _os_log_impl(&dword_1CBD43000, v34, OS_LOG_TYPE_DEFAULT, "[WARNING] we probably shouldn't have asked coordination in the first place (reserved:%s document:%s additions:%s)%@", buf, 0x2Au);
    }

  }
  else
  {
    brc_bread_crumbs();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      -[BRCURLToItemLookup(BRCFSWriter) _canUpdatePathMatch:hasAdditionsToApply:].cold.6();

    -[BRCAccountSession applyScheduler](self->_session, "applyScheduler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setState:forServerItem:localItem:", 22, a3->var1, a3->var0);
  }

  v10 = 0;
LABEL_52:
  v41 = 0;
LABEL_53:

  return v41;
}

- (BOOL)_bouncePathMatchIfNecessaryWithLookup:(id)a3 localItem:(id)a4 serverItem:(id)a5 bounceNamespace:(unsigned __int8)a6 applyNamespace:(unsigned __int8)a7
{
  uint64_t v7;
  uint64_t v8;
  id v12;
  id v13;
  id v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  BOOL v21;
  __int128 v23;

  v7 = a7;
  v8 = a6;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  -[BRCAccountSession(LegacyAdditions) fsWriter](self->_session, "fsWriter", 0, 0, 0, 0, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "_computeURLMatchWithLookup:localItem:serverItem:bounceNamespace:applyNamespace:urlMatch:", v12, v13, v14, v8, v7, &v23);

  if (v16 == -1)
    goto LABEL_6;
  if (v16)
  {
    -[BRCAccountSession(LegacyAdditions) fsWriter](self->_session, "fsWriter");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "serverZone");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "clientZone");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v17, "bouncePathMatch:toApplyServerItem:clientZone:", &v23, v14, v19);

    if (v20)
    {
      objc_msgSend(v12, "_clearNamespace:", v8);
      goto LABEL_5;
    }
LABEL_6:
    v21 = 0;
    goto LABEL_7;
  }
LABEL_5:
  v21 = 1;
LABEL_7:
  __destructor_8_s0_s8_s16_s24((id *)&v23);

  return v21;
}

- (BOOL)copyItemAtURLToGenstore:(id)a3 forItem:(id)a4 error:(id *)a5
{
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
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
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  BOOL v32;
  dispatch_semaphore_t v33;
  NSObject *v34;
  void *v35;
  void *v36;
  id v38;
  void *v39;
  __int128 v40;
  id v41;
  _QWORD v42[4];
  NSObject *v43;
  uint64_t *v44;
  _BYTE *v45;
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  uint64_t (*v49)(uint64_t, uint64_t);
  void (*v50)(uint64_t);
  id v51;
  _BYTE buf[24];
  uint64_t (*v53)(uint64_t, uint64_t);
  void (*v54)(uint64_t);
  id v55;
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v41 = a3;
  v7 = a4;
  v8 = (void *)objc_opt_new();
  brc_bread_crumbs();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v7;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v9;
    _os_log_impl(&dword_1CBD43000, v10, OS_LOG_TYPE_DEFAULT, "[WARNING] Moving item to genstore as a readonly edit for %@%@", buf, 0x16u);
  }

  objc_msgSend(MEMORY[0x1E0D25D48], "manager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "permanentStorageForItemAtURL:allocateIfNone:error:", v41, 1, a5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(v7, "currentVersion");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "db");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "lastEditorDeviceDisplayNameWithDB:", v14);
    *((_QWORD *)&v40 + 1) = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "db");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "lastEditorUserIdentityWithDB:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "nameComponentsAcceptUnknownUser:", 1);
    *(_QWORD *)&v40 = objc_claimAutoreleasedReturnValue();

    v38 = (id)*MEMORY[0x1E0D25D00];
    objc_msgSend(v13, "originalPOSIXName");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "br_pathExtension");
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "itemID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "itemIDString");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(CFSTR("roedit_"), "stringByAppendingString:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v39, "length"))
    {
      objc_msgSend(v20, "stringByAppendingPathExtension:", v39);
      v21 = objc_claimAutoreleasedReturnValue();

      v20 = (void *)v21;
    }
    objc_msgSend(v13, "originalPOSIXName");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v22, *MEMORY[0x1E0D25CF0]);

    objc_msgSend(v7, "st");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "displayNameWithoutExtension:", objc_msgSend(v23, "isHiddenExt"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v24, *MEMORY[0x1E0D25CC0]);

    objc_msgSend(v8, "setObject:forKeyedSubscript:", v20, *MEMORY[0x1E0D25CD0]);
    objc_msgSend(v8, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D25CC8]);
    objc_msgSend(v8, "setObject:forKeyedSubscript:", &unk_1E87D79E8, *MEMORY[0x1E0D25CE0]);
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v38, *MEMORY[0x1E0D25CD8]);
    objc_msgSend(v8, "setObject:forKeyedSubscript:", &unk_1E87D7A00, *MEMORY[0x1E0D25CE8]);
    if (v40 != 0)
    {
      v25 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v26 = v25;
      if (*((_QWORD *)&v40 + 1))
        objc_msgSend(v25, "setObject:forKeyedSubscript:", *((_QWORD *)&v40 + 1), *MEMORY[0x1E0D10B78]);
      if ((_QWORD)v40)
      {
        objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", (_QWORD)v40, 1, 0);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "setObject:forKeyedSubscript:", v27, *MEMORY[0x1E0D10B80]);

      }
      objc_msgSend(v7, "currentVersion");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "ckInfo");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "etag");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setObject:forKeyedSubscript:", v30, CFSTR("etag"));

      objc_msgSend(v8, "setObject:forKeyedSubscript:", v26, *MEMORY[0x1E0D25CF8]);
    }
    objc_msgSend(v12, "prepareAdditionCreationWithItemAtURL:byMoving:creationInfo:error:", v41, 0, v8, a5);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = v31 != 0;
    if (v31)
    {
      v33 = dispatch_semaphore_create(0);
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x3032000000;
      v53 = __Block_byref_object_copy__55;
      v54 = __Block_byref_object_dispose__55;
      v55 = 0;
      v46 = 0;
      v47 = &v46;
      v48 = 0x3032000000;
      v49 = __Block_byref_object_copy__55;
      v50 = __Block_byref_object_dispose__55;
      v51 = 0;
      v42[0] = MEMORY[0x1E0C809B0];
      v42[1] = 3221225472;
      v42[2] = __73__BRCURLToItemLookup_BRCFSWriter__copyItemAtURLToGenstore_forItem_error___block_invoke;
      v42[3] = &unk_1E8767BB8;
      v44 = &v46;
      v45 = buf;
      v34 = v33;
      v43 = v34;
      objc_msgSend(v12, "createAdditionStagedAtURL:creationInfo:completionHandler:", v31, v8, v42);
      if (a5)
        *a5 = objc_retainAutorelease((id)v47[5]);
      dispatch_semaphore_wait(v34, 0xFFFFFFFFFFFFFFFFLL);
      v35 = (void *)MEMORY[0x1E0CB3600];
      objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "name");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "__itemAtURL:didGainVersionWithClientID:name:purposeID:", v41, v38, v36, 0);

      _Block_object_dispose(&v46, 8);
      _Block_object_dispose(buf, 8);

    }
  }
  else
  {
    v32 = 0;
  }

  return v32;
}

void __73__BRCURLToItemLookup_BRCFSWriter__copyItemAtURLToGenstore_forItem_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;

  v7 = a2;
  v6 = a3;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
  if (v7)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a2);
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

- (void)tryToUpdateItemInNamespace:(unsigned __int8)a3 withDstLookup:(id)a4
{
  NSObject *v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  NSObject *v22;
  NSObject *v23;
  int v24;
  int v25;
  int v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  int v34;
  BRCURLToItemLookup *v35;
  void *v36;
  char v37;
  char v38;
  char v39;
  void *v40;
  NSObject *v41;
  NSObject *v42;
  int v43;
  NSObject *v44;
  NSObject *v45;
  NSObject *v46;
  NSObject *v47;
  uint64_t v48;
  const __CFString *v49;
  void *v50;
  const __CFString *v51;
  id v52;
  uint64_t v53;
  void *v54;
  NSObject *v55;
  void *v56;
  void *v57;
  void *v58;
  uint64_t v59;
  void *v60;
  void *v61;
  void *v62;
  NSObject *v63;
  void *v64;
  void *v65;
  int v66;
  void *v67;
  NSObject *v68;
  NSObject *v69;
  NSObject *v70;
  NSObject *v71;
  int v72;
  int v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  int v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  NSObject *v86;
  NSObject *v87;
  void *v88;
  int v89;
  NSObject *v90;
  void *v91;
  void *v92;
  void *v93;
  int v94;
  void *v95;
  NSObject *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  BOOL v103;
  void *v104;
  NSObject *v105;
  NSObject *v106;
  NSObject *v107;
  id v108;
  int v109;
  NSObject *v110;
  NSObject *v111;
  uint64_t v112;
  void *v113;
  void *v114;
  uint64_t v115;
  void *v116;
  void *v117;
  void *v118;
  NSObject *v119;
  void *v120;
  char v121;
  NSObject *v122;
  uint64_t v123;
  void *v124;
  void *v125;
  void *v126;
  uint64_t v127;
  NSObject *v128;
  uint64_t v129;
  char v130;
  void *v131;
  void *v132;
  NSObject *v133;
  void *v134;
  uint64_t v135;
  NSObject *v136;
  void *v137;
  NSObject *v138;
  void *v139;
  NSObject *v140;
  void *v141;
  NSObject *v142;
  uint64_t v143;
  void *v144;
  NSObject *v145;
  void *v146;
  NSObject *v147;
  void *v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t i;
  void *v152;
  uint64_t v153;
  NSObject *v154;
  void *v155;
  NSObject *v156;
  id v157;
  void *v158;
  NSObject *v159;
  void *v160;
  void *v161;
  NSObject *v162;
  void *v163;
  int v164;
  NSObject *v165;
  NSObject *v166;
  void *v167;
  NSObject *v168;
  uint64_t v169;
  void *v170;
  unsigned int v171;
  NSObject *v172;
  _BOOL4 v173;
  NSObject *v174;
  BRCURLToItemLookup *v175;
  void *v176;
  unsigned int v177;
  void *v178;
  id v179;
  BRCURLToItemLookup *v180;
  NSObject *v181;
  __int128 v182;
  __int128 v183;
  __int128 v184;
  __int128 v185;
  uint64_t v186[3];
  _QWORD v187[4];
  NSObject *v188;
  NSObject *v189;
  NSObject *v190;
  NSObject *v191;
  id v192;
  NSObject *v193;
  uint64_t v194;
  NSObject *v195;
  NSObject *v196;
  NSObject *v197;
  id v198;
  uint64_t v199[3];
  __int128 v200;
  __int128 v201;
  uint64_t v202;
  uint8_t v203[128];
  uint8_t buf[4];
  NSObject *v205;
  __int16 v206;
  NSObject *v207;
  __int16 v208;
  _BYTE v209[18];
  __int16 v210;
  id v211;
  __int16 v212;
  void *v213;
  uint64_t v214;

  v177 = a3;
  v214 = *MEMORY[0x1E0C80C00];
  v179 = a4;
  -[BRCAccountSession stageRegistry](self->_session, "stageRegistry");
  v176 = (void *)objc_claimAutoreleasedReturnValue();
  v202 = 0;
  v200 = 0u;
  v201 = 0u;
  -[BRCURLToItemLookup _pathMatchInNamespace:](self, "_pathMatchInNamespace:", v177);
  v5 = 0;
  v181 = 0;
  if (-[NSObject isDocument](v5, "isDocument"))
  {
    -[NSObject asDocument](v5, "asDocument");
    v6 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  v180 = self;
  -[NSObject desiredVersion](v6, "desiredVersion");
  v178 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[NSObject isDead](v181, "isDead"))
  {
    v173 = +[BRCServerChangesApplyUtil shouldForceApplyContentForItem:](BRCServerChangesApplyUtil, "shouldForceApplyContentForItem:", v5);
    if (v173)
    {
      brc_bread_crumbs();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        -[BRCURLToItemLookup(BRCFSWriter) tryToUpdateItemInNamespace:withDstLookup:].cold.13();

      v202 &= 0x3FF0000u;
    }
    if (+[BRCFSWriter _shouldForceApplyMetadataForItem:](BRCFSWriter, "_shouldForceApplyMetadataForItem:", v5))
    {
      brc_bread_crumbs();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        -[BRCURLToItemLookup(BRCFSWriter) tryToUpdateItemInNamespace:withDstLookup:].cold.12();

      v202 &= 0xFFFFFFFFFC04FFFFLL;
    }
    if ((-[NSObject isReserved](v5, "isReserved") & 1) != 0)
      goto LABEL_17;
    v25 = -[NSObject isLive](v5, "isLive");
    if (v202)
      v26 = v25;
    else
      v26 = 0;
    if (v26 == 1)
    {
      if (v6)
      {
        -[BRCAccountSession fsDownloader](self->_session, "fsDownloader");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v171 = objc_msgSend(v27, "hasAdditionsToApplyForItem:serverItem:", v6, v181);

        goto LABEL_18;
      }
    }
    else
    {
      if (!v6)
        goto LABEL_65;
      -[BRCAccountSession fsDownloader](self->_session, "fsDownloader");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = objc_msgSend(v36, "hasAdditionsToApplyForItem:serverItem:", v6, v181);

      if ((v37 & 1) != 0)
      {
        v171 = 1;
LABEL_18:
        memset(v199, 0, sizeof(v199));
        __brc_create_section(0, (uint64_t)"-[BRCURLToItemLookup(BRCFSWriter) tryToUpdateItemInNamespace:withDstLookup:]", 1047, v199);
        brc_bread_crumbs();
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        {
          v48 = v199[0];
          v49 = (const __CFString *)v201;
          BRCItemFieldsPrettyPrint();
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          if (v49)
            v51 = v49;
          else
            v51 = &stru_1E8769030;
          v52 = v50;
          *(_DWORD *)buf = 134219266;
          v205 = v48;
          v206 = 2112;
          v207 = v5;
          v208 = 2112;
          *(_QWORD *)v209 = v181;
          *(_WORD *)&v209[8] = 2112;
          *(_QWORD *)&v209[10] = v51;
          v210 = 2112;
          v211 = v52;
          v212 = 2112;
          v213 = v13;
          _os_log_debug_impl(&dword_1CBD43000, v14, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx Trying to update pending-update item\nlocal  item: %@\nserver item: %@\npath       : %@\ndiffs      : %@%@", buf, 0x3Eu);

        }
        if ((v202 & 0x1000000060) == 0
          && !-[NSObject physicalNameNeedsRename](v5, "physicalNameNeedsRename"))
        {
          v24 = 0;
          v35 = v180;
          v175 = v180;
LABEL_44:
          if (!-[BRCURLToItemLookup _canUpdatePathMatch:hasAdditionsToApply:](v35, "_canUpdatePathMatch:hasAdditionsToApply:", &v200, v171))
          {
            brc_bread_crumbs();
            v41 = objc_claimAutoreleasedReturnValue();
            brc_default_log();
            v42 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
            {
              BRCPrettyPrintEnum();
              -[BRCURLToItemLookup(BRCFSWriter) tryToUpdateItemInNamespace:withDstLookup:].cold.8();
            }
            goto LABEL_132;
          }
          v38 = -[NSObject isReserved](v5, "isReserved");
          if (v178)
            v39 = 1;
          else
            v39 = v38;
          if ((v39 & 1) == 0 && (v202 & 0x1FE2000) == 0)
          {
            v169 = 0;
LABEL_85:
            if (!v173 && ((-[NSObject isReserved](v5, "isReserved") & 1) != 0 || (v202 & 0xF0007FFE) != 0))
            {
              -[NSObject updateStatMetadataFromServerItem:](v5, "updateStatMetadataFromServerItem:", v181);
              -[NSObject updateItemMetadataFromServerItem:appliedSharingPermission:](v5, "updateItemMetadataFromServerItem:appliedSharingPermission:", v181, 0);
            }
            v53 = v202;
            if ((v202 & 0x2000) != 0)
            {
              brc_bread_crumbs();
              v54 = (void *)objc_claimAutoreleasedReturnValue();
              brc_default_log();
              v55 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v55, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412802;
                v205 = v5;
                v206 = 2112;
                v207 = v181;
                v208 = 2112;
                *(_QWORD *)v209 = v54;
                _os_log_debug_impl(&dword_1CBD43000, v55, OS_LOG_TYPE_DEBUG, "[DEBUG] Got an update for symlink target: %@ -> %@. Creating a new symlink in the stage directory so we can swap with the old one%@", buf, 0x20u);
              }

              -[NSObject asSymlink](v5, "asSymlink");
              v56 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSObject symlinkTarget](v181, "symlinkTarget");
              v57 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v56, "updateSymlinkTarget:", v57);

              v53 = v202;
            }
            if ((v53 & 0x1000000060) == 0
              && (-[NSObject isReserved](v5, "isReserved") & 1) == 0
              && (!objc_msgSend(v178, "isFault") || -[NSObject isFault](v5, "isFault")))
            {
              if (!v178
                || !-[NSObject isFault](v5, "isFault")
                || ((v72 = objc_msgSend(v178, "isFault"), !v169) ? (v73 = 1) : (v73 = v72), v73 == 1))
              {
                if (!-[NSObject physicalNameNeedsRename](v5, "physicalNameNeedsRename"))
                {
LABEL_125:
                  -[BRCURLToItemLookup byPathRelpath](v175, "byPathRelpath");
                  v41 = objc_claimAutoreleasedReturnValue();
                  -[NSObject st](v5, "st");
                  v81 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v81, "filename");
                  v168 = objc_claimAutoreleasedReturnValue();

                  -[NSObject st](v5, "st");
                  v82 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v82, "logicalName");
                  v172 = objc_claimAutoreleasedReturnValue();
                  v164 = 0;
                  v166 = 0;
                  v167 = 0;
                  v42 = 0;
                  goto LABEL_149;
                }
                -[NSObject st](v5, "st");
                v74 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v74, "physicalName");
                v75 = (void *)objc_claimAutoreleasedReturnValue();
                -[NSObject st](v181, "st");
                v76 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v76, "logicalName");
                v77 = (void *)objc_claimAutoreleasedReturnValue();
                v78 = objc_msgSend(v75, "isEqualToString:", v77);

                if (v78)
                {
                  -[NSObject st](v181, "st");
                  v79 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v79, "logicalName");
                  v80 = (void *)objc_claimAutoreleasedReturnValue();
                  -[NSObject markRenamedUsingServerItem:toRelpath:logicalName:filename:origLogicalNameBeforeBounce:forContentApplyOnly:](v5, "markRenamedUsingServerItem:toRelpath:logicalName:filename:origLogicalNameBeforeBounce:forContentApplyOnly:", v181, 0, v80, 0, 0, v173);

                  goto LABEL_125;
                }
              }
            }
            if (objc_msgSend(v178, "isFault")
              && !-[BRCURLToItemLookup _bounceBouncesHiddenByFault:](v180, "_bounceBouncesHiddenByFault:", v5))
            {
              goto LABEL_104;
            }
            -[BRCAccountSession(LegacyAdditions) fsWriter](self->_session, "fsWriter");
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            v59 = objc_msgSend(v58, "computeSourceBounceNumberIfNecessaryWithLookup:localItem:serverItem:", v175, v5, v181);

            if (v59)
            {
              -[NSObject st](v181, "st");
              v60 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v60, "logicalName");
              v61 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSObject bounceSourceItemWithServerLogicalName:bounceNumber:](v5, "bounceSourceItemWithServerLogicalName:bounceNumber:", v61, v59);

              -[NSObject st](v5, "st");
              v62 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v62, "logicalName");
              v172 = objc_claimAutoreleasedReturnValue();

              if (objc_msgSend(v178, "isFault"))
              {
                -[NSObject br_sideFaultName](v172, "br_sideFaultName");
                v168 = (id)objc_claimAutoreleasedReturnValue();

              }
              else
              {
                v168 = v172;
              }
              -[BRCURLToItemLookup parentRelpath](v175, "parentRelpath");
              v64 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v64, "pathWithChildAtPath:", v168);
              v41 = objc_claimAutoreleasedReturnValue();

              if (objc_msgSend(v178, "isFault"))
              {
                -[NSObject asDocument](v5, "asDocument");
                v65 = (void *)objc_claimAutoreleasedReturnValue();
                v66 = -[NSObject isOnDisk](v5, "isOnDisk");
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v178, "size"));
                v67 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v65, "stageFaultForCreation:name:size:isPackage:", v66 ^ 1u, v172, v67, objc_msgSend(v178, "isPackage"));

                -[NSObject saveToDB](v5, "saveToDB");
                brc_bread_crumbs();
                v68 = objc_claimAutoreleasedReturnValue();
                brc_default_log();
                v69 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  v205 = v68;
                  _os_log_impl(&dword_1CBD43000, v69, OS_LOG_TYPE_DEFAULT, "[WARNING] We're bouncing an item becoming a fault at the source which needs to be re-staged.  Bailing out early to retry%@", buf, 0xCu);
                }
LABEL_128:

                v166 = 0;
                v167 = 0;
                v63 = 0;
                v42 = 0;
                goto LABEL_129;
              }
              if ((-[NSObject resolveMustExist:error:](v41, "resolveMustExist:error:", 0, 0) & 1) == 0)
              {
                brc_bread_crumbs();
                v68 = objc_claimAutoreleasedReturnValue();
                brc_default_log();
                v69 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412546;
                  v205 = v41;
                  v206 = 2112;
                  v207 = v68;
                  _os_log_impl(&dword_1CBD43000, v69, OS_LOG_TYPE_DEFAULT, "[WARNING] Failed to resolve bounced path %@%@", buf, 0x16u);
                }
                goto LABEL_128;
              }
              brc_bread_crumbs();
              v70 = objc_claimAutoreleasedReturnValue();
              brc_default_log();
              v71 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412546;
                v205 = v168;
                v206 = 2112;
                v207 = v70;
                _os_log_impl(&dword_1CBD43000, v71, OS_LOG_TYPE_DEFAULT, "[WARNING] Bouncing the source item because it's a shared to me top level item to %@%@", buf, 0x16u);
              }

LABEL_148:
              v42 = (id)v201;
              -[NSObject filename](v42, "filename");
              v166 = objc_claimAutoreleasedReturnValue();
              -[NSObject st](v5, "st");
              v82 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v82, "logicalName");
              v167 = (void *)objc_claimAutoreleasedReturnValue();
              v164 = 1;
LABEL_149:

              -[NSObject uploadError](v6, "uploadError");
              v88 = (void *)objc_claimAutoreleasedReturnValue();
              v89 = objc_msgSend(v88, "br_isCloudDocsErrorCode:", 43);

              if (v89)
              {
                if (v181)
                  v90 = v181;
                else
                  v90 = v6;
                if ((-[NSObject sharingOptions](v90, "sharingOptions") & 0x20) == 0)
                {
                  -[BRCAccountSession(LegacyAdditions) fsWriter](self->_session, "fsWriter");
                  v91 = (void *)objc_claimAutoreleasedReturnValue();
                  -[NSObject physicalURL](v41, "physicalURL");
                  v92 = (void *)objc_claimAutoreleasedReturnValue();
                  -[NSObject asDocument](v5, "asDocument");
                  v93 = (void *)objc_claimAutoreleasedReturnValue();
                  v94 = objc_msgSend(v91, "applyLocalEditIfNecessaryToURL:forItem:serverItem:forDelete:error:", v92, v93, v181, 0, 0);

                  if (v94)
                  {
                    brc_bread_crumbs();
                    v95 = (void *)objc_claimAutoreleasedReturnValue();
                    brc_default_log();
                    v96 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v96, OS_LOG_TYPE_DEBUG))
                      -[BRCURLToItemLookup(BRCFSWriter) tryToUpdateItemInNamespace:withDstLookup:].cold.2();

                    v63 = 0;
                    goto LABEL_129;
                  }
                }
                if (v169)
                {
                  if ((-[NSObject isFault](v5, "isFault") & 1) == 0
                    && (-[NSObject sharingOptions](v181, "sharingOptions") & 0x20) != 0)
                  {
                    -[NSObject asDocument](v5, "asDocument");
                    v161 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v161, "uploadError");
                    v158 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v158, "userInfo");
                    v97 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v97, "objectForKeyedSubscript:", CFSTR("inode"));
                    v98 = (void *)objc_claimAutoreleasedReturnValue();
                    -[NSObject st](v5, "st");
                    v99 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v99, "fileID");
                    v100 = (void *)objc_claimAutoreleasedReturnValue();
                    LODWORD(v157) = objc_msgSend(v98, "isEqual:", v100);

                    if ((v157 & 1) != 0)
                    {
                      -[BRCURLToItemLookup url](v175, "url");
                      v101 = (void *)objc_claimAutoreleasedReturnValue();
                      -[NSObject asDocument](v5, "asDocument");
                      v102 = (void *)objc_claimAutoreleasedReturnValue();
                      v198 = 0;
                      v103 = -[BRCURLToItemLookup copyItemAtURLToGenstore:forItem:error:](v180, "copyItemAtURLToGenstore:forItem:error:", v101, v102, &v198);
                      v63 = v198;

                      if (!v103)
                      {
                        brc_bread_crumbs();
                        v104 = (void *)objc_claimAutoreleasedReturnValue();
                        brc_default_log();
                        v105 = objc_claimAutoreleasedReturnValue();
                        if (os_log_type_enabled(v105, (os_log_type_t)0x90u))
                          -[BRCURLToItemLookup(BRCFSWriter) tryToUpdateItemInNamespace:withDstLookup:].cold.5();

                        goto LABEL_129;
                      }
LABEL_187:
                      -[BRCAccountSession volume](self->_session, "volume", v157);
                      v120 = (void *)objc_claimAutoreleasedReturnValue();
                      if (objc_msgSend(v120, "hasRenameSwap")
                        && (-[NSObject isReserved](v5, "isReserved") & 1) == 0)
                      {

                        if ((v164 & 1) == 0)
                        {
                          -[NSObject st](v5, "st");
                          v134 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v134, "fileID");
                          v135 = objc_claimAutoreleasedReturnValue();
                          -[NSObject applyMetadataOnFileID:liveFD:sharingOptions:](v5, "applyMetadataOnFileID:liveFD:sharingOptions:", v169, objc_msgSend((id)v135, "unsignedLongLongValue"), -[NSObject sharingOptions](v181, "sharingOptions"));

                          v197 = v63;
                          LOBYTE(v135) = objc_msgSend(v176, "makeItemLive:fromStage:bySwappingWith:fileName:error:", v5, v169, (_QWORD)v201, v168, &v197);
                          v136 = v197;

                          v63 = v136;
                          if ((v135 & 1) == 0)
                          {
                            brc_bread_crumbs();
                            v137 = (void *)objc_claimAutoreleasedReturnValue();
                            brc_default_log();
                            v138 = objc_claimAutoreleasedReturnValue();
                            if (os_log_type_enabled(v138, (os_log_type_t)0x90u))
                            {
                              *(_DWORD *)buf = 138413314;
                              v205 = v5;
                              v206 = 2112;
                              v207 = v201;
                              v208 = 2112;
                              *(_QWORD *)v209 = v168;
                              *(_WORD *)&v209[8] = 2112;
                              *(_QWORD *)&v209[10] = v136;
                              v210 = 2112;
                              v211 = v137;
                              _os_log_error_impl(&dword_1CBD43000, v138, (os_log_type_t)0x90u, "[ERROR] Failed to unstage %@ [%@] to %@: %@%@", buf, 0x34u);
                            }

                            goto LABEL_129;
                          }
                          goto LABEL_219;
                        }
                      }
                      else
                      {

                      }
                      if ((-[NSObject isReserved](v5, "isReserved") & 1) == 0)
                      {
                        v196 = v63;
                        v121 = objc_msgSend(v176, "moveOldVersionFromPath:error:", (_QWORD)v201, &v196);
                        v122 = v196;

                        v63 = v122;
                        if ((v121 & 1) == 0)
                        {
                          brc_bread_crumbs();
                          v139 = (void *)objc_claimAutoreleasedReturnValue();
                          brc_default_log();
                          v140 = objc_claimAutoreleasedReturnValue();
                          if (os_log_type_enabled(v140, (os_log_type_t)0x90u))
                          {
                            *(_DWORD *)buf = 138412802;
                            v205 = v201;
                            v206 = 2112;
                            v207 = v122;
                            v208 = 2112;
                            *(_QWORD *)v209 = v139;
                            _os_log_error_impl(&dword_1CBD43000, v140, (os_log_type_t)0x90u, "[ERROR] Failed to move %@ to graveyard: %@%@", buf, 0x20u);
                          }

                          goto LABEL_129;
                        }
                      }
                      if (v164
                        && (-[NSObject isReserved](v5, "isReserved") & 1) == 0
                        && -[NSObject isDocument](v5, "isDocument"))
                      {
                        -[NSObject st](v5, "st");
                        v163 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v163, "documentID");
                        v160 = (void *)objc_claimAutoreleasedReturnValue();
                        v123 = objc_msgSend(v160, "unsignedIntValue");
                        -[NSObject st](v5, "st");
                        v124 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v124, "fileID");
                        v125 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v176, "transferDocumentID:fromOldVersionStage:toStage:", v123, objc_msgSend(v125, "unsignedLongLongValue"), v169);

                      }
                      -[NSObject st](v5, "st");
                      v126 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v126, "fileID");
                      v127 = objc_claimAutoreleasedReturnValue();
                      -[NSObject applyMetadataOnFileID:liveFD:sharingOptions:](v5, "applyMetadataOnFileID:liveFD:sharingOptions:", v169, objc_msgSend((id)v127, "unsignedLongLongValue"), -[NSObject sharingOptions](v181, "sharingOptions"));

                      v195 = v63;
                      LOBYTE(v127) = objc_msgSend(v176, "moveFromStage:toPath:fileName:error:", v169, v41, v168, &v195);
                      v128 = v195;

                      v63 = v128;
                      if ((v127 & 1) == 0)
                      {
                        brc_bread_crumbs();
                        v132 = (void *)objc_claimAutoreleasedReturnValue();
                        brc_default_log();
                        v133 = objc_claimAutoreleasedReturnValue();
                        if (os_log_type_enabled(v133, (os_log_type_t)0x90u))
                        {
                          *(_DWORD *)buf = 138413314;
                          v205 = v5;
                          v206 = 2112;
                          v207 = v41;
                          v208 = 2112;
                          *(_QWORD *)v209 = v168;
                          *(_WORD *)&v209[8] = 2112;
                          *(_QWORD *)&v209[10] = v128;
                          v210 = 2112;
                          v211 = v132;
                          _os_log_error_impl(&dword_1CBD43000, v133, (os_log_type_t)0x90u, "[ERROR] Failed to unstage %@ [%@] to %@: %@%@", buf, 0x34u);
                        }

                        -[NSObject markReserved](v5, "markReserved");
                        -[NSObject saveToDB](v5, "saveToDB");
                        if (-[NSObject br_isPOSIXErrorCode:](v128, "br_isPOSIXErrorCode:", 17))
                          -[NSObject scanParentDirectory](v5, "scanParentDirectory");
                        goto LABEL_129;
                      }
                      if ((-[NSObject isReserved](v5, "isReserved") & 1) == 0)
                      {
                        v129 = objc_msgSend((id)v201, "fileID");
                        v130 = objc_msgSend(v178, "isFault");
                        if ((v130 & 1) != 0)
                        {
                          v131 = 0;
                        }
                        else
                        {
                          -[NSObject itemID](v5, "itemID");
                          v131 = (void *)objc_claimAutoreleasedReturnValue();
                        }
                        objc_msgSend(v176, "moveFromStageToGraveyard:forItemID:", v129, v131);
                        if ((v130 & 1) == 0)

                      }
                      if (((v24 | v164 ^ 1) & 1) == 0 && v42)
                      {
                        +[BRCFileCoordinator itemAtPath:logicalFilename:didMoveToPath:logicalFilename:hasContentUpdate:](BRCFileCoordinator, "itemAtPath:logicalFilename:didMoveToPath:logicalFilename:hasContentUpdate:", v42, v167, v41, v172, 1);
                        brc_bread_crumbs();
                        v141 = (void *)objc_claimAutoreleasedReturnValue();
                        brc_default_log();
                        v142 = objc_claimAutoreleasedReturnValue();
                        if (os_log_type_enabled(v142, OS_LOG_TYPE_DEBUG))
                        {
                          *(_DWORD *)buf = 138413314;
                          v205 = v42;
                          v206 = 2112;
                          v207 = v166;
                          v208 = 2112;
                          *(_QWORD *)v209 = v41;
                          *(_WORD *)&v209[8] = 2112;
                          *(_QWORD *)&v209[10] = v168;
                          v210 = 2112;
                          v211 = v141;
                          _os_log_debug_impl(&dword_1CBD43000, v142, OS_LOG_TYPE_DEBUG, "[DEBUG] renamed from %@ (%@)\n        to %@ (%@)%@", buf, 0x34u);
                        }
LABEL_224:

                        if (v164)
                          -[NSObject markRenamedUsingServerItem:toRelpath:logicalName:filename:origLogicalNameBeforeBounce:forContentApplyOnly:](v5, "markRenamedUsingServerItem:toRelpath:logicalName:filename:origLogicalNameBeforeBounce:forContentApplyOnly:", v181, v41, v172, v168, 0, v173);
                        -[NSObject markLiveFromStageWithPath:](v5, "markLiveFromStageWithPath:", v41);
                        goto LABEL_227;
                      }
LABEL_219:
                      if (-[NSObject isReserved](v5, "isReserved"))
                        +[BRCFileCoordinator itemDidAppearAtPath:logicalFilename:](BRCFileCoordinator, "itemDidAppearAtPath:logicalFilename:", v41, v172);
                      else
                        +[BRCFileCoordinator itemDidChangeAtPath:logicalFilename:](BRCFileCoordinator, "itemDidChangeAtPath:logicalFilename:", v41, v172);
                      brc_bread_crumbs();
                      v141 = (void *)objc_claimAutoreleasedReturnValue();
                      brc_default_log();
                      v142 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v142, OS_LOG_TYPE_DEBUG))
                        -[BRCURLToItemLookup(BRCFSWriter) tryToUpdateItemInNamespace:withDstLookup:].cold.4();
                      goto LABEL_224;
                    }
                    brc_bread_crumbs();
                    v118 = (void *)objc_claimAutoreleasedReturnValue();
                    brc_default_log();
                    v119 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v119, OS_LOG_TYPE_DEBUG))
                      -[BRCURLToItemLookup(BRCFSWriter) tryToUpdateItemInNamespace:withDstLookup:].cold.6();

                  }
LABEL_186:
                  v63 = 0;
                  goto LABEL_187;
                }
              }
              else if (v169)
              {
                goto LABEL_186;
              }
              if (!v164)
              {
                if ((v202 & 0x40000000) != 0 && -[NSObject isDirectory](v5, "isDirectory"))
                  -[NSObject markLostWhenReplacedByItem:](v5, "markLostWhenReplacedByItem:", 0);
                v112 = objc_msgSend((id)v201, "fileID");
                -[NSObject st](v5, "st");
                v113 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v113, "fileID");
                v114 = (void *)objc_claimAutoreleasedReturnValue();
                -[NSObject applyMetadataOnFileID:liveFD:sharingOptions:](v5, "applyMetadataOnFileID:liveFD:sharingOptions:", v112, objc_msgSend(v114, "unsignedLongLongValue"), -[NSObject sharingOptions](v181, "sharingOptions"));

                goto LABEL_182;
              }
              if ((v24 & 1) != 0)
              {
LABEL_181:
                v115 = objc_msgSend((id)v201, "fileID", v157);
                -[NSObject st](v5, "st");
                v116 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v116, "fileID");
                v117 = (void *)objc_claimAutoreleasedReturnValue();
                -[NSObject applyMetadataOnFileID:liveFD:sharingOptions:](v5, "applyMetadataOnFileID:liveFD:sharingOptions:", v115, objc_msgSend(v117, "unsignedLongLongValue"), -[NSObject sharingOptions](v181, "sharingOptions"));

                -[NSObject markRenamedUsingServerItem:toRelpath:logicalName:filename:origLogicalNameBeforeBounce:forContentApplyOnly:](v5, "markRenamedUsingServerItem:toRelpath:logicalName:filename:origLogicalNameBeforeBounce:forContentApplyOnly:", v181, v41, v172, v168, 0, v173);
LABEL_182:
                -[NSObject markMetadataLive](v5, "markMetadataLive");
                v63 = 0;
LABEL_227:
                v143 = -[NSObject sharingOptions](v5, "sharingOptions");
                if ((-[NSObject sharingOptions](v181, "sharingOptions") ^ v143) == 0x20)
                  -[NSObject updateItemMetadataFromServerItem:appliedSharingPermission:](v5, "updateItemMetadataFromServerItem:appliedSharingPermission:", v181, 1);
                if (!v173)
                  -[NSObject updateStructuralCKInfoFromServerItem:](v5, "updateStructuralCKInfoFromServerItem:", v181);
                -[BRCURLToItemLookup didApplyChangesAtPath:filename:li:si:](v175, "didApplyChangesAtPath:filename:li:si:", v41, v168, v5, v181);
                -[NSObject setOrRemoveSpotlightAttributeAt:](v5, "setOrRemoveSpotlightAttributeAt:", v41);
                brc_bread_crumbs();
                v144 = (void *)objc_claimAutoreleasedReturnValue();
                brc_default_log();
                v145 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v145, OS_LOG_TYPE_DEBUG))
                  -[BRCURLToItemLookup(BRCFSWriter) tryToUpdateItemInNamespace:withDstLookup:].cold.3();

                if (v6)
                {
                  memset(v186, 0, sizeof(v186));
                  __brc_create_section(0, (uint64_t)"-[BRCURLToItemLookup(BRCFSWriter) tryToUpdateItemInNamespace:withDstLookup:]", 1376, v186);
                  brc_bread_crumbs();
                  v146 = (void *)objc_claimAutoreleasedReturnValue();
                  brc_default_log();
                  v147 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v147, OS_LOG_TYPE_DEBUG))
                  {
                    v153 = v186[0];
                    -[NSObject itemID](v5, "itemID");
                    v154 = objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 134218498;
                    v205 = v153;
                    v206 = 2112;
                    v207 = v154;
                    v208 = 2112;
                    *(_QWORD *)v209 = v146;
                    _os_log_debug_impl(&dword_1CBD43000, v147, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx rewriting all aliases pointing to %@%@", buf, 0x20u);

                  }
                  v174 = v63;
                  v184 = 0u;
                  v185 = 0u;
                  v182 = 0u;
                  v183 = 0u;
                  -[NSObject reverseAliasEnumerator](v6, "reverseAliasEnumerator");
                  v148 = (void *)objc_claimAutoreleasedReturnValue();
                  v149 = objc_msgSend(v148, "countByEnumeratingWithState:objects:count:", &v182, v203, 16);
                  if (v149)
                  {
                    v150 = *(_QWORD *)v183;
                    do
                    {
                      for (i = 0; i != v149; ++i)
                      {
                        if (*(_QWORD *)v183 != v150)
                          objc_enumerationMutation(v148);
                        v152 = *(void **)(*((_QWORD *)&v182 + 1) + 8 * i);
                        objc_msgSend(v152, "rewriteOrDeleteAliasOnDiskWithTarget:", v6);
                        objc_msgSend(v152, "saveToDB");
                      }
                      v149 = objc_msgSend(v148, "countByEnumeratingWithState:objects:count:", &v182, v203, 16);
                    }
                    while (v149);
                  }

                  v63 = v174;
                  if (-[NSObject isResumingSync](v6, "isResumingSync"))
                    -[NSObject resumeSyncComplete](v6, "resumeSyncComplete");
                  __brc_leave_section(v186);
                }
                goto LABEL_129;
              }
              LODWORD(v186[0]) = 0;
              v187[0] = MEMORY[0x1E0C809B0];
              v187[1] = 3221225472;
              v187[2] = __76__BRCURLToItemLookup_BRCFSWriter__tryToUpdateItemInNamespace_withDstLookup___block_invoke;
              v187[3] = &unk_1E8767BE0;
              v162 = v42;
              v188 = v162;
              v106 = v41;
              v189 = v106;
              v107 = v166;
              v190 = v107;
              v165 = v168;
              v191 = v165;
              v108 = v167;
              v192 = v108;
              v159 = v172;
              v193 = v159;
              v194 = 0;
              -[NSObject performOnOpenParentFileDescriptor:error:](v106, "performOnOpenParentFileDescriptor:error:", v187, v186);
              v109 = v186[0];
              v157 = v108;
              if (LODWORD(v186[0]))
              {
                brc_bread_crumbs();
                v170 = (void *)objc_claimAutoreleasedReturnValue();
                brc_default_log();
                v110 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v110, (os_log_type_t)0x90u))
                {
                  v111 = v107;
                  *(_DWORD *)buf = 138413058;
                  v205 = v106;
                  v206 = 2112;
                  v207 = v165;
                  v208 = 1024;
                  *(_DWORD *)v209 = v186[0];
                  *(_WORD *)&v209[4] = 2112;
                  *(_QWORD *)&v209[6] = v170;
                  _os_log_error_impl(&dword_1CBD43000, v110, (os_log_type_t)0x90u, "[ERROR] failed renaming to %@ (name:'%@') %{errno}d%@", buf, 0x26u);
                  goto LABEL_179;
                }
              }
              else
              {
                brc_bread_crumbs();
                v170 = (void *)objc_claimAutoreleasedReturnValue();
                brc_default_log();
                v110 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v110, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138413314;
                  v205 = v162;
                  v206 = 2112;
                  v111 = v107;
                  v207 = v107;
                  v208 = 2112;
                  *(_QWORD *)v209 = v106;
                  *(_WORD *)&v209[8] = 2112;
                  *(_QWORD *)&v209[10] = v165;
                  v210 = 2112;
                  v211 = v170;
                  _os_log_debug_impl(&dword_1CBD43000, v110, OS_LOG_TYPE_DEBUG, "[DEBUG] renamed from %@ (name:'%@')\n        to %@ (name:'%@')%@", buf, 0x34u);
LABEL_179:

                  if (v109)
                  {
                    v63 = 0;
                    v42 = v162;
                    v172 = v159;
                    v166 = v111;
                    v167 = v157;
                    v168 = v165;
                    v41 = v106;
                    goto LABEL_129;
                  }
                  goto LABEL_181;
                }
              }
              v111 = v107;
              goto LABEL_179;
            }
            if (!-[BRCURLToItemLookup _bouncePathMatchIfNecessaryWithLookup:localItem:serverItem:bounceNamespace:applyNamespace:](v180, "_bouncePathMatchIfNecessaryWithLookup:localItem:serverItem:bounceNamespace:applyNamespace:", v175, v5, v181, 1, v177)|| !-[BRCURLToItemLookup _bouncePathMatchIfNecessaryWithLookup:localItem:serverItem:bounceNamespace:applyNamespace:](v180, "_bouncePathMatchIfNecessaryWithLookup:localItem:serverItem:bounceNamespace:applyNamespace:", v175, v5, v181, 0, v177))
            {
LABEL_104:
              v166 = 0;
              v167 = 0;
              v172 = 0;
              v63 = 0;
              v168 = 0;
              v42 = 0;
              v41 = 0;
LABEL_129:
              if (-[NSObject br_isPOSIXErrorCode:](v63, "br_isPOSIXErrorCode:", 1, v157))
              {
                -[BRCAccountSession applyScheduler](self->_session, "applyScheduler");
                v83 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v83, "setState:forServerItem:localItem:", 18, v181, v5);

              }
              -[BRCURLToItemLookup _clearNamespace:](v180, "_clearNamespace:", v177);

LABEL_132:
              v180 = v175;
LABEL_133:

              v175 = v180;
LABEL_134:

              __brc_leave_section(v199);
              v180 = v175;
              goto LABEL_135;
            }
            if (objc_msgSend(v178, "isFault"))
              -[BRCURLToItemLookup faultedRelpath](v175, "faultedRelpath");
            else
              -[BRCURLToItemLookup byPathRelpath](v175, "byPathRelpath");
            v41 = (id)objc_claimAutoreleasedReturnValue();

            if (v173)
            {
              -[NSObject st](v5, "st");
              v87 = objc_claimAutoreleasedReturnValue();
              -[NSObject logicalName](v87, "logicalName");
              v172 = (id)objc_claimAutoreleasedReturnValue();

            }
            else
            {
              -[NSObject computedDestinationFilenameFromServerItem:](v5, "computedDestinationFilenameFromServerItem:", v181);
              v87 = (id)objc_claimAutoreleasedReturnValue();
              v172 = v87;
            }

            if (v178)
            {
              if ((objc_msgSend(v178, "isFault") & 1) != 0)
              {
LABEL_142:
                -[NSObject br_sideFaultName](v172, "br_sideFaultName");
                v168 = objc_claimAutoreleasedReturnValue();
                goto LABEL_148;
              }
            }
            else if (-[NSObject isFault](v5, "isFault"))
            {
              goto LABEL_142;
            }
            if (-[NSObject isDirectory](v181, "isDirectory")
              && objc_msgSend(0, "br_isPackageRoot"))
            {
              -[NSObject br_representableDirectoryName](v172, "br_representableDirectoryName");
              v168 = objc_claimAutoreleasedReturnValue();
            }
            else
            {
              v172 = v172;
              v168 = v172;
            }
            goto LABEL_148;
          }
          -[NSObject st](v5, "st");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "stagedFileID");
          v41 = objc_claimAutoreleasedReturnValue();

          v169 = -[NSObject unsignedLongLongValue](v41, "unsignedLongLongValue");
          if (v169 && (objc_msgSend(v176, "didFlushStagedFileID:", v169) & 1) == 0)
          {
            brc_bread_crumbs();
            v44 = objc_claimAutoreleasedReturnValue();
            brc_default_log();
            v45 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v205 = v44;
              _os_log_impl(&dword_1CBD43000, v45, OS_LOG_TYPE_DEFAULT, "[WARNING] the staged fileID isn't yet flushed%@", buf, 0xCu);
            }

            if (!v178 || v41)
              goto LABEL_76;
          }
          else if (!v178 || v41)
          {
            if (v6 && !v169)
              -[NSObject updateVersionMetadataFromServerItem:preventVersionDiffs:](v6, "updateVersionMetadataFromServerItem:preventVersionDiffs:", v181, 0);

            goto LABEL_85;
          }
          brc_bread_crumbs();
          v46 = objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v47 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v205 = v46;
            _os_log_impl(&dword_1CBD43000, v47, OS_LOG_TYPE_DEFAULT, "[WARNING] nothing to do at that path, will need a new coordination%@", buf, 0xCu);
          }

LABEL_76:
          if (v171 && (-[NSObject isReserved](v5, "isReserved") & 1) == 0)
          {
            if (-[NSObject diffAgainstOriginalItem](v5, "diffAgainstOriginalItem"))
            {
              brc_bread_crumbs();
              v155 = (void *)objc_claimAutoreleasedReturnValue();
              brc_default_log();
              v156 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v156, OS_LOG_TYPE_FAULT))
                -[BRCURLToItemLookup(BRCFSWriter) tryToUpdateItemInNamespace:withDstLookup:].cold.7();

            }
            -[BRCURLToItemLookup didApplyChangesAtPath:filename:li:si:](v180, "didApplyChangesAtPath:filename:li:si:", (_QWORD)v201, 0, v5, v181);
          }
          goto LABEL_134;
        }
        objc_msgSend(v179, "filename");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject st](v181, "st");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "representableName");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v15, "isEqualToString:", v17) & 1) != 0)
        {
          objc_msgSend(v179, "parentItem");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "itemID");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject parentItemIDOnFS](v181, "parentItemIDOnFS");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = objc_msgSend(v19, "isEqualToItemID:", v20);

          if (v21)
          {
            v175 = (BRCURLToItemLookup *)v179;

            brc_bread_crumbs();
            v22 = objc_claimAutoreleasedReturnValue();
            brc_default_log();
            v23 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
            {
              -[BRCURLToItemLookup url](v175, "url");
              v84 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v84, "path");
              v85 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v85, "stringByAbbreviatingWithTildeInPath");
              v86 = objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              v205 = v86;
              v206 = 2112;
              v207 = v22;
              _os_log_debug_impl(&dword_1CBD43000, v23, OS_LOG_TYPE_DEBUG, "[DEBUG] Item is pending-rename to %@%@", buf, 0x16u);

            }
            v24 = 0;
LABEL_39:

            v35 = v180;
            goto LABEL_44;
          }
        }
        else
        {

        }
        if ((v202 & 0x20) == 0)
        {
          -[NSObject st](v5, "st");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "rawBouncedLogicalName");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          if (v29)
          {
            -[NSObject st](v5, "st");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "logicalName");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSObject st](v181, "st");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v32, "logicalName");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            v34 = objc_msgSend(v31, "isEqualToString:", v33);

            if (v34)
            {
              brc_bread_crumbs();
              v22 = objc_claimAutoreleasedReturnValue();
              brc_default_log();
              v23 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
                -[BRCURLToItemLookup(BRCFSWriter) tryToUpdateItemInNamespace:withDstLookup:].cold.10();
              v24 = 1;
              v175 = v180;
              goto LABEL_39;
            }
          }
          else
          {

          }
        }
        brc_bread_crumbs();
        v41 = objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v42 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
          -[BRCURLToItemLookup(BRCFSWriter) tryToUpdateItemInNamespace:withDstLookup:].cold.9();
        goto LABEL_133;
      }
      if (!v178 || (v43 = -[NSObject isFault](v5, "isFault"), v43 == objc_msgSend(v178, "isFault")))
      {
LABEL_65:
        if ((-[NSObject physicalNameNeedsRename](v5, "physicalNameNeedsRename") & 1) == 0)
        {
          brc_bread_crumbs();
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v8 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
          {
            BRCPrettyPrintEnum();
            -[BRCURLToItemLookup(BRCFSWriter) tryToUpdateItemInNamespace:withDstLookup:].cold.11();
          }
          goto LABEL_7;
        }
      }
    }
LABEL_17:
    v171 = 0;
    goto LABEL_18;
  }
  brc_bread_crumbs();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    BRCPrettyPrintEnum();
    -[BRCURLToItemLookup(BRCFSWriter) tryToUpdateItemInNamespace:withDstLookup:].cold.1();
  }
LABEL_7:

LABEL_135:
  __destructor_8_s0_s8_s16_s24((id *)&v200);

}

uint64_t __76__BRCURLToItemLookup_BRCFSWriter__tryToUpdateItemInNamespace_withDstLookup___block_invoke(uint64_t a1, int a2)
{
  uint64_t v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  uint64_t v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, int);
  void *v16;
  id v17;
  id v18;
  id v19;
  int v20;
  uint8_t buf[4];
  int v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  int v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  int v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = objc_msgSend(*(id *)(a1 + 32), "parentFileID");
  if (v4 != objc_msgSend(*(id *)(a1 + 40), "parentFileID"))
  {
    *(_DWORD *)buf = 0;
    v8 = *(void **)(a1 + 32);
    v13 = MEMORY[0x1E0C809B0];
    v14 = 3221225472;
    v15 = __76__BRCURLToItemLookup_BRCFSWriter__tryToUpdateItemInNamespace_withDstLookup___block_invoke_54;
    v16 = &unk_1E87639B8;
    v17 = *(id *)(a1 + 48);
    v20 = a2;
    v18 = *(id *)(a1 + 56);
    v19 = *(id *)(a1 + 32);
    objc_msgSend(v8, "performOnOpenParentFileDescriptor:error:", &v13, buf);
    v7 = *(unsigned int *)buf;

    if ((_DWORD)v7)
      return v7;
LABEL_7:
    +[BRCFileCoordinator itemAtPath:logicalFilename:didMoveToPath:logicalFilename:hasContentUpdate:](BRCFileCoordinator, "itemAtPath:logicalFilename:didMoveToPath:logicalFilename:hasContentUpdate:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80) != 0, v13, v14, v15, v16);
    return 0;
  }
  if (!BRCRenameAt(a2, *(void **)(a1 + 48), a2, *(void **)(a1 + 56), 0))
    goto LABEL_7;
  brc_bread_crumbs();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v11 = *(_QWORD *)(a1 + 48);
    v10 = *(_QWORD *)(a1 + 56);
    v12 = *__error();
    *(_DWORD *)buf = 67110402;
    v22 = a2;
    v23 = 2112;
    v24 = v11;
    v25 = 1024;
    v26 = a2;
    v27 = 2112;
    v28 = v10;
    v29 = 1024;
    v30 = v12;
    v31 = 2112;
    v32 = v5;
    _os_log_debug_impl(&dword_1CBD43000, v6, OS_LOG_TYPE_DEBUG, "[DEBUG] renameat(%d, '%@', %d, '%@') failed %{errno}d%@", buf, 0x32u);
  }

  return *__error();
}

uint64_t __76__BRCURLToItemLookup_BRCFSWriter__tryToUpdateItemInNamespace_withDstLookup___block_invoke_54(uint64_t a1, int a2)
{
  uint64_t result;
  void *v5;
  NSObject *v6;
  void *v7;
  int v8;
  uint64_t v9;
  int v10;
  _DWORD v11[2];
  __int16 v12;
  void *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  int v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  result = BRCRenameAt(a2, *(void **)(a1 + 32), *(_DWORD *)(a1 + 56), *(void **)(a1 + 40), 0);
  if ((_DWORD)result)
  {
    brc_bread_crumbs();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(*(id *)(a1 + 48), "absolutePath");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = *(_DWORD *)(a1 + 56);
      v9 = *(_QWORD *)(a1 + 40);
      v10 = *__error();
      v11[0] = 67110402;
      v11[1] = a2;
      v12 = 2112;
      v13 = v7;
      v14 = 1024;
      v15 = v8;
      v16 = 2112;
      v17 = v9;
      v18 = 1024;
      v19 = v10;
      v20 = 2112;
      v21 = v5;
      _os_log_debug_impl(&dword_1CBD43000, v6, OS_LOG_TYPE_DEBUG, "[DEBUG] renameat(%d, '%@', %d, '%@') failed %{errno}d%@", (uint8_t *)v11, 0x32u);

    }
    return *__error();
  }
  return result;
}

- (BOOL)trashItemIfNecessary:(id)a3 atURL:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  uint64_t v33;
  unint64_t v34;
  id v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  int v42;
  void *v43;
  void *v44;
  void *v45;
  NSObject *v46;
  void *v47;
  void *v48;
  char v49;
  void *v50;
  NSObject *v51;
  uint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  int v61;
  void *v62;
  NSObject *v63;
  void *v64;
  NSObject *v65;
  void *v66;
  void *v67;
  char v68;
  void *v69;
  NSObject *v70;
  char *v71;
  id v72;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  int v79;
  void *v80;
  BOOL v81;
  int v82;
  void *v83;
  NSObject *v84;
  int v85;
  void *v86;
  NSObject *v87;
  void *v88;
  void *v89;
  void *v90;
  uint64_t v91;
  void *v92;
  void *v93;
  id v94;
  void *v95;
  _BOOL4 v96;
  void *v97;
  uint64_t v98;
  id v99;
  void *v100;
  void *v101;
  void *v102;
  NSObject *v103;
  const char *v105;
  char *v106;
  char *v107;
  unsigned __int16 v108;
  id v109;
  id *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  id v118;
  void *v119;
  void *v120;
  void *v121;
  id v122;
  id v123;
  id v124;
  unint64_t v125;
  uint64_t v126[3];
  uint8_t buf[4];
  const char *v128;
  __int16 v129;
  _BYTE v130[18];
  __int16 v131;
  void *v132;
  __int16 v133;
  void *v134;
  uint64_t v135;

  v135 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v121 = v7;
  if (objc_msgSend(v7, "isDocument") && objc_msgSend(v7, "isOnDisk"))
  {
    v110 = a5;
    v113 = v8;
    if ((objc_msgSend(v7, "needsReading") & 1) == 0
      && (objc_msgSend(v7, "needsUpload") & 1) == 0
      && (objc_msgSend(v7, "localDiffs") & 0x180000) == 0)
    {
      -[BRCAccountSession syncUpScheduler](self->_session, "syncUpScheduler");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "inFlightDiffsForItem:", v7) & 0x180000;

      if (!v10)
      {
        objc_msgSend(v7, "asDocument");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "currentVersion");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "uploadError");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v57, "br_isCloudDocsErrorCode:", 43) & 1) == 0)
        {

          goto LABEL_70;
        }
        objc_msgSend(v121, "session");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v58, "fsWriter");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v121, "asDocument");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        v61 = objc_msgSend(v59, "applyLocalEditIfNecessaryToURL:forItem:serverItem:forDelete:error:", v113, v60, 0, 1, 0);

        if (!v61)
        {
LABEL_70:
          v49 = 0;
LABEL_71:
          v8 = v113;
          goto LABEL_72;
        }
        brc_bread_crumbs();
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v63 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          v128 = (const char *)v121;
          v129 = 2112;
          *(_QWORD *)v130 = v62;
          _os_log_impl(&dword_1CBD43000, v63, OS_LOG_TYPE_DEFAULT, "[WARNING] Applying readonly edit to move to trash for %@%@", buf, 0x16u);
        }

        v7 = v121;
      }
    }
    objc_msgSend(v7, "appLibrary");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "containerMetadata");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "trashURL");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      memset(v126, 0, sizeof(v126));
      __brc_create_section(0, (uint64_t)"-[BRCURLToItemLookup(BRCFSWriter) trashItemIfNecessary:atURL:error:]", 1419, v126);
      brc_bread_crumbs();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        v52 = v126[0];
        objc_msgSend(v121, "appLibrary");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "appLibraryID");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134219010;
        v128 = (const char *)v52;
        v129 = 2112;
        *(_QWORD *)v130 = v113;
        *(_WORD *)&v130[8] = 2112;
        *(_QWORD *)&v130[10] = v54;
        v131 = 2112;
        v132 = v13;
        v133 = 2112;
        v134 = v14;
        _os_log_debug_impl(&dword_1CBD43000, v15, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx trash item at %@ in %@ to %@%@", buf, 0x34u);

      }
      if ((objc_msgSend(v121, "sharingOptions") & 4) != 0)
      {
        v116 = 0;
        v50 = 0;
        v31 = 0;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0C95070], "brc_fetchShareIDWithSharedItem:", v121);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v121, "clientZone");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "brc_shareItemID");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "itemByItemID:", v18);
        v114 = (void *)objc_claimAutoreleasedReturnValue();
        v119 = v16;

        if (v114)
        {
          objc_msgSend(v114, "st");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "logicalNameWithoutLocalBounce");
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          v21 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(v114, "itemID");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "itemIDString");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v114, "clientZone");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "mangledID");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v114, "clientZone");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "session");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "accountDSID");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "bookmarkDataWithItemResolutionString:serverZoneMangledID:saltAccountDSID:", v23, v25, v28);
          v116 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v20, "brc_representableHFSFileNameWithSuffix:addedExtension:makeDotFile:", 0, 0, 0);
          v29 = (void *)objc_claimAutoreleasedReturnValue();

          v30 = v13;
          objc_msgSend(v30, "URLByAppendingPathComponent:", v29);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = v30;

          v125 = 0;
          objc_msgSend(v29, "br_stringByDeletingPathBounceNo:", &v125);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = v125;
          if (v125 <= 1)
            v33 = 1;
          v125 = v33;
          v34 = v33 + 1;
          if (v33 + 1 >= (unint64_t)(v33 + 1000))
          {
            v48 = v29;
          }
          else
          {
            while (1)
            {
              v35 = objc_retainAutorelease(v13);
              v36 = (const char *)objc_msgSend(v35, "fileSystemRepresentation");
              v42 = BRCOpenAt(0xFFFFFFFFLL, v36, 33028, v37, v38, v39, v40, v41, v108);
              if (v42 < 0)
                break;
              objc_msgSend(v35, "path");
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              BRCGetXattrValueForKeyOnFD(v42, v43, CFSTR("com.apple.clouddocs.private.recovered-bookmark#N"));
              v44 = (void *)objc_claimAutoreleasedReturnValue();

              close(v42);
              if (objc_msgSend(v44, "isEqualToString:", v116))
              {
                brc_bread_crumbs();
                v64 = (void *)objc_claimAutoreleasedReturnValue();
                brc_default_log();
                v65 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v65, OS_LOG_TYPE_DEBUG))
                  -[BRCURLToItemLookup(BRCFSWriter) trashItemIfNecessary:atURL:error:].cold.2();

                break;
              }
              brc_bread_crumbs();
              v45 = (void *)objc_claimAutoreleasedReturnValue();
              brc_default_log();
              v46 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412802;
                v128 = (const char *)v44;
                v129 = 2112;
                *(_QWORD *)v130 = v116;
                *(_WORD *)&v130[8] = 2112;
                *(_QWORD *)&v130[10] = v45;
                _os_log_debug_impl(&dword_1CBD43000, v46, OS_LOG_TYPE_DEBUG, "[DEBUG] Existing folder doesn't have the trash bookmark set, trying the next path (%@ vs %@)%@", buf, 0x20u);
              }

              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v34);
              v47 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v32, "br_representableHFSFileNameWithNumber:addedExtension:makeDotFile:", v47, 0, 0);
              v48 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v31, "URLByAppendingPathComponent:", v48);
              v13 = (void *)objc_claimAutoreleasedReturnValue();

              ++v34;
              v29 = v48;
              if (v34 >= v125 + 1000)
                goto LABEL_36;
            }
            v48 = v29;
            v13 = v35;
          }
LABEL_36:

        }
        else
        {
          brc_bread_crumbs();
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v51 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v51, OS_LOG_TYPE_FAULT))
            -[BRCURLToItemLookup(BRCFSWriter) trashItemIfNecessary:atURL:error:].cold.1();

          v116 = 0;
          v31 = 0;
        }

        v50 = v114;
      }
      objc_msgSend(v113, "br_logicalURL");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v111 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v66, "lastPathComponent");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      v124 = 0;
      v125 = 0;
      objc_msgSend(v67, "br_stringByDeletingPathBounceNo:andPathExtension:", &v125, &v124);
      v120 = (void *)objc_claimAutoreleasedReturnValue();
      v118 = v124;
      if (!v125)
        v125 = 1;
      v123 = 0;
      v68 = objc_msgSend(v111, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v13, 1, 0, &v123);
      v109 = v123;
      v115 = v50;
      v112 = v31;
      if ((v68 & 1) == 0)
      {
        brc_bread_crumbs();
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v70 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v13, "path");
          v71 = (char *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v128 = v71;
          v129 = 2112;
          *(_QWORD *)v130 = v109;
          *(_WORD *)&v130[8] = 2112;
          *(_QWORD *)&v130[10] = v69;
          _os_log_impl(&dword_1CBD43000, v70, OS_LOG_TYPE_DEFAULT, "[WARNING] can't create %@: %@%@", buf, 0x20u);

        }
      }
      if (v116)
      {
        v72 = objc_retainAutorelease(v13);
        v73 = (const char *)objc_msgSend(v72, "fileSystemRepresentation");
        v79 = BRCOpenAt(0xFFFFFFFFLL, v73, 33028, v74, v75, v76, v77, v78, v108);
        if (v79 < 0)
        {
          v85 = *__error();
          brc_bread_crumbs();
          v86 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v87 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v87, (os_log_type_t)0x90u))
          {
            objc_msgSend(v72, "path");
            v106 = (char *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412802;
            v128 = v106;
            v129 = 1024;
            *(_DWORD *)v130 = v85;
            *(_WORD *)&v130[4] = 2112;
            *(_QWORD *)&v130[6] = v86;
            _os_log_error_impl(&dword_1CBD43000, v87, (os_log_type_t)0x90u, "[ERROR] Failed to open the trash URL to set the recovery xattr at %@ %{errno}d%@", buf, 0x1Cu);

          }
          *__error() = v85;
        }
        else
        {
          objc_msgSend(v72, "path");
          v80 = (void *)objc_claimAutoreleasedReturnValue();
          v81 = BRCSetXattrValueForKeyOnFD(v79, v80, CFSTR("com.apple.clouddocs.private.recovered-bookmark#N"), v116);

          if (!v81)
          {
            v82 = *__error();
            brc_bread_crumbs();
            v83 = (void *)objc_claimAutoreleasedReturnValue();
            brc_default_log();
            v84 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v84, (os_log_type_t)0x90u))
            {
              objc_msgSend(v72, "path");
              v107 = (char *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412802;
              v128 = v107;
              v129 = 1024;
              *(_DWORD *)v130 = v82;
              *(_WORD *)&v130[4] = 2112;
              *(_QWORD *)&v130[6] = v83;
              _os_log_error_impl(&dword_1CBD43000, v84, (os_log_type_t)0x90u, "[ERROR] Failed to set the recovery xattr at %@ %{errno}d%@", buf, 0x1Cu);

            }
            *__error() = v82;
          }
          close(v79);
          v31 = v112;
        }
      }
      if (v31)
      {
        -[BRCAccountSession(LegacyAdditions) fsReader](self->_session, "fsReader");
        v88 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v88, "fseventOnURL:dbFlags:", v31, 0);

      }
      -[BRCAccountSession(LegacyAdditions) fsReader](self->_session, "fsReader");
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v89, "fseventOnURL:dbFlags:", v13, 16);

      v90 = 0;
      v91 = *MEMORY[0x1E0CB28A8];
      while (1)
      {
        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
        v92 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "URLByAppendingPathComponent:", v67);
        v93 = (void *)objc_claimAutoreleasedReturnValue();
        v122 = v90;
        v49 = objc_msgSend(v92, "br_movePromisedItemAtURL:toURL:error:", v66, v93, &v122);
        v94 = v122;

        if ((v49 & 1) != 0)
        {
          objc_msgSend(v13, "URLByAppendingPathComponent:", v67);
          v99 = (id)objc_claimAutoreleasedReturnValue();
          -[BRCAccountSession(LegacyAdditions) fsReader](self->_session, "fsReader");
          v100 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v99, "br_physicalURL");
          v101 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v100, "fseventOnURL:dbFlags:", v101, 0);

          goto LABEL_68;
        }
        objc_msgSend(v94, "domain");
        v95 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v95, "isEqualToString:", v91))
          break;
        v96 = objc_msgSend(v94, "code") == 516;

        if (!v96)
          goto LABEL_63;
        ++v125;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:");
        v97 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v120, "br_representableHFSFileNameWithNumber:addedExtension:makeDotFile:", v97, v118, 0);
        v98 = objc_claimAutoreleasedReturnValue();

        v67 = (void *)v98;
        v90 = v94;
      }

LABEL_63:
      v99 = v94;
      if (v99)
      {
        brc_bread_crumbs();
        v102 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v103 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v103, (os_log_type_t)0x90u))
        {
          v105 = "(passed to caller)";
          *(_DWORD *)buf = 136315906;
          v128 = "-[BRCURLToItemLookup(BRCFSWriter) trashItemIfNecessary:atURL:error:]";
          v129 = 2080;
          if (!v110)
            v105 = "(ignored by caller)";
          *(_QWORD *)v130 = v105;
          *(_WORD *)&v130[8] = 2112;
          *(_QWORD *)&v130[10] = v99;
          v131 = 2112;
          v132 = v102;
          _os_log_error_impl(&dword_1CBD43000, v103, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
        }

      }
      if (v110)
      {
        v99 = objc_retainAutorelease(v99);
        *v110 = v99;
      }
LABEL_68:

      __brc_leave_section(v126);
      goto LABEL_71;
    }
    goto LABEL_70;
  }
  v49 = 0;
LABEL_72:

  return v49;
}

- (BOOL)tryToDeleteItemInNamespace:(unsigned __int8)a3
{
  uint64_t v3;
  id v5;
  id v6;
  BOOL v7;
  void *v9;
  char v10;
  void *v11;
  NSObject *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  NSObject *v20;
  id v21;
  void *v22;
  NSObject *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  const __CFString *v33;
  void *v34;
  _BOOL4 v35;
  void *v36;
  NSObject *v37;
  BOOL v38;
  void *v39;
  NSObject *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  char v45;
  void *v46;
  NSObject *v47;
  id v48;
  id v49;
  id v50;
  _QWORD v51[4];
  id v52[5];
  uint64_t v53[3];
  unsigned int v54;
  __int128 v55;
  __int128 v56;
  uint64_t v57;
  uint8_t buf[4];
  uint64_t v59;
  __int16 v60;
  _BYTE v61[18];
  __int16 v62;
  const __CFString *v63;
  __int16 v64;
  void *v65;
  uint64_t v66;

  v3 = a3;
  v66 = *MEMORY[0x1E0C80C00];
  v57 = 0;
  v55 = 0u;
  v56 = 0u;
  -[BRCURLToItemLookup _pathMatchInNamespace:](self, "_pathMatchInNamespace:");
  v5 = 0;
  v6 = 0;
  v54 = 0;
  if (!v5 || (objc_msgSend(v5, "isAlmostDead") & 1) != 0 || (objc_msgSend(v6, "isLive") & 1) != 0)
    goto LABEL_4;
  objc_msgSend(v5, "clientZone");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "isPrivateZone"))
  {
    v10 = objc_msgSend(v5, "isLost");

    if ((v10 & 1) != 0)
      goto LABEL_4;
  }
  else
  {

  }
  if (!objc_msgSend(v5, "isShareAcceptationFault")
    || (objc_msgSend(v5, "isRejected") & 1) != 0
    || objc_msgSend(v6, "isDead"))
  {
    memset(v53, 0, sizeof(v53));
    __brc_create_section(0, (uint64_t)"-[BRCURLToItemLookup(BRCFSWriter) tryToDeleteItemInNamespace:]", 1543, v53);
    brc_bread_crumbs();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      v33 = (const __CFString *)v56;
      if (!(_QWORD)v56)
        v33 = &stru_1E8769030;
      *(_DWORD *)buf = 134219010;
      v59 = v53[0];
      v60 = 2112;
      *(_QWORD *)v61 = v5;
      *(_WORD *)&v61[8] = 2112;
      *(_QWORD *)&v61[10] = v6;
      v62 = 2112;
      v63 = v33;
      v64 = 2112;
      v65 = v11;
      _os_log_debug_impl(&dword_1CBD43000, v12, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx Trying to delete pending-delete item\nlocal  item: %@\nserver item: %@\npath       : %@%@", buf, 0x34u);
    }

    if (+[BRCFSWriter _isPathMatchIdle:](BRCFSWriter, "_isPathMatchIdle:", &v55))
      goto LABEL_27;
    v13 = objc_msgSend(v5, "isSharedToMeTopLevelItem");
    if (objc_msgSend(v5, "isSharedToMeChildItem"))
    {
      objc_msgSend(MEMORY[0x1E0C95070], "brc_fetchShareIDWithSharedItem:", v5);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "brc_shareItemID");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "clientZone");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "serverItemByItemID:", v15);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (v17)
      {
        v18 = objc_msgSend(v17, "isDead");

        if ((v18 & 1) != 0)
          goto LABEL_24;
LABEL_20:
        brc_bread_crumbs();
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
          -[BRCURLToItemLookup(BRCFSWriter) _canUpdatePathMatch:hasAdditionsToApply:].cold.6();
        goto LABEL_22;
      }

    }
    else if (!v13)
    {
      goto LABEL_20;
    }
LABEL_24:
    brc_bread_crumbs();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v59 = (uint64_t)v22;
      _os_log_impl(&dword_1CBD43000, v23, OS_LOG_TYPE_DEFAULT, "[WARNING] Shared to me item isn't idle but continuing with deletion anyway%@", buf, 0xCu);
    }

LABEL_27:
    if ((objc_msgSend(v5, "isReserved") & 1) != 0)
    {
LABEL_28:
      v21 = 0;
      goto LABEL_29;
    }
    if (objc_msgSend(v5, "isFault"))
    {
      v29 = (void *)v56;
      v51[0] = MEMORY[0x1E0C809B0];
      v51[1] = 3254779904;
      v51[2] = __62__BRCURLToItemLookup_BRCFSWriter__tryToDeleteItemInNamespace___block_invoke;
      v51[3] = &__block_descriptor_72_e8_32n23_8_8_s0_s8_s16_s24_t32w8_e8_i12__0i8l;
      __copy_constructor_8_8_s0_s8_s16_s24_t32w8(v52, (uint64_t)&v55);
      objc_msgSend(v29, "performOnOpenParentFileDescriptor:error:", v51, &v54);
      if (!v54)
      {
        __destructor_8_s0_s8_s16_s24(v52);
        goto LABEL_28;
      }
      brc_bread_crumbs();
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, (os_log_type_t)0x90u))
      {
        *(_DWORD *)buf = 138412802;
        v59 = v56;
        v60 = 1024;
        *(_DWORD *)v61 = v54;
        *(_WORD *)&v61[4] = 2112;
        *(_QWORD *)&v61[6] = v30;
        _os_log_error_impl(&dword_1CBD43000, v31, (os_log_type_t)0x90u, "[ERROR] failed removing fault at '%@' %{errno}d%@", buf, 0x1Cu);
      }

      objc_msgSend(MEMORY[0x1E0CB35C8], "br_errorWithPOSIXCode:", v54);
      v21 = (id)objc_claimAutoreleasedReturnValue();
      __destructor_8_s0_s8_s16_s24(v52);
      goto LABEL_64;
    }
    if ((objc_msgSend(v5, "isDocument") & 1) != 0 || objc_msgSend(v5, "isSymLink"))
    {
      if ((_DWORD)v3)
      {
        v32 = 0;
      }
      else
      {
        -[BRCURLToItemLookup url](self, "url");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v50 = 0;
        v35 = -[BRCURLToItemLookup trashItemIfNecessary:atURL:error:](self, "trashItemIfNecessary:atURL:error:", v5, v34, &v50);
        v21 = v50;

        if (v35)
        {
          brc_bread_crumbs();
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v37 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
            -[BRCURLToItemLookup(BRCFSWriter) tryToDeleteItemInNamespace:].cold.2();

          -[BRCURLToItemLookup _clearNamespace:](self, "_clearNamespace:", 0);
          goto LABEL_36;
        }
        v32 = v21;
      }
      -[BRCAccountSession stageRegistry](self->_session, "stageRegistry");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = v56;
      objc_msgSend(v5, "itemID");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = v32;
      v45 = objc_msgSend(v42, "moveToGraveyardFromPath:forItemID:error:", v43, v44, &v49);
      v21 = v49;

      if ((v45 & 1) != 0)
      {
LABEL_29:
        if ((objc_msgSend(v5, "isReserved") & 1) == 0)
        {
          v24 = v56;
          objc_msgSend(v5, "st");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "logicalName");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          +[BRCFileCoordinator itemDidDisappearAtPath:logicalFilename:](BRCFileCoordinator, "itemDidDisappearAtPath:logicalFilename:", v24, v26);

        }
        if (v6)
          objc_msgSend(v5, "updateStructuralCKInfoFromServerItem:", v6);
        objc_msgSend(v5, "markRemovedFromFilesystemForServerEdit:", 1);
        -[BRCURLToItemLookup didApplyChangesAtPath:filename:li:si:](self, "didApplyChangesAtPath:filename:li:si:", (_QWORD)v56, 0, v5, v6);
        brc_bread_crumbs();
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
          -[BRCURLToItemLookup(BRCFSWriter) tryToDeleteItemInNamespace:].cold.1();

        -[BRCURLToItemLookup _clearNamespace:](self, "_clearNamespace:", v3);
LABEL_36:
        v7 = 1;
LABEL_68:
        __brc_leave_section(v53);

        goto LABEL_5;
      }
      brc_bread_crumbs();
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v47 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412802;
        v59 = (uint64_t)v21;
        v60 = 2112;
        *(_QWORD *)v61 = v5;
        *(_WORD *)&v61[8] = 2112;
        *(_QWORD *)&v61[10] = v46;
        _os_log_impl(&dword_1CBD43000, v47, OS_LOG_TYPE_DEFAULT, "[WARNING] failed moving to graveyard with error %@: %@%@", buf, 0x20u);
      }

      goto LABEL_64;
    }
    if ((objc_msgSend((id)v56, "exists") & 1) != 0)
    {
      v48 = 0;
      v38 = -[BRCURLToItemLookup _removeDirectory:atPath:error:](self, "_removeDirectory:atPath:error:", v5, (_QWORD)v56, &v48);
      v21 = v48;
      if (v38)
        goto LABEL_29;
      brc_bread_crumbs();
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v40 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend((id)v56, "absolutePath");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v59 = (uint64_t)v41;
        v60 = 2112;
        *(_QWORD *)v61 = v21;
        *(_WORD *)&v61[8] = 2112;
        *(_QWORD *)&v61[10] = v39;
        _os_log_impl(&dword_1CBD43000, v40, OS_LOG_TYPE_DEFAULT, "[WARNING] failed removing dir at '%@': %@%@", buf, 0x20u);

      }
LABEL_64:
      if (!objc_msgSend(v21, "br_isPOSIXErrorCode:", 1))
      {
LABEL_67:
        v7 = 0;
        goto LABEL_68;
      }
      -[BRCAccountSession applyScheduler](self->_session, "applyScheduler");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setState:forServerItem:localItem:", 18, v6, v5);
LABEL_66:

      goto LABEL_67;
    }
    brc_bread_crumbs();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v59 = (uint64_t)v5;
      v60 = 2112;
      *(_QWORD *)v61 = v19;
      _os_log_impl(&dword_1CBD43000, v20, OS_LOG_TYPE_DEFAULT, "[WARNING] Can't remove an non-existant path for %@%@", buf, 0x16u);
    }
LABEL_22:

    v21 = 0;
    goto LABEL_66;
  }
LABEL_4:
  v7 = 0;
LABEL_5:

  __destructor_8_s0_s8_s16_s24((id *)&v55);
  return v7;
}

uint64_t __62__BRCURLToItemLookup_BRCFSWriter__tryToDeleteItemInNamespace___block_invoke(uint64_t a1, int a2)
{
  void *v3;
  int v4;
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 48), "filename");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = BRCUnlinkAt(a2, v3, 0);

  result = 0;
  if (v4 < 0)
    return *__error();
  return result;
}

- (BOOL)_applyOrDownloadThumbnailIfNecessary:(id)a3 si:(id)a4 url:(id)a5 updatedAddition:(BOOL *)a6 applySchedulerState:(int *)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  char v22;
  char v23;
  void *v25;
  int v26;
  void *v27;
  void *v28;
  id v29;
  id v30;
  void *v31;
  void *v32;
  int *v33;
  uint64_t v34;
  BOOL *v35;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  -[BRCAccountSession fsDownloader](self->_session, "fsDownloader");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "desiredVersion");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v16, "wantsThumbnail"))
    goto LABEL_7;
  v35 = a6;
  objc_msgSend(v12, "liveThumbnailSignature");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "thumbnailSignature");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v17;
  v20 = v18;
  if (v19 == v20)
  {

    goto LABEL_7;
  }
  v21 = v20;
  v33 = a7;
  if (v20)
  {
    v22 = objc_msgSend(v19, "isEqual:", v20);

    if ((v22 & 1) == 0)
      goto LABEL_10;
LABEL_7:
    v23 = 1;
    goto LABEL_8;
  }

LABEL_10:
  objc_msgSend(v12, "orig", v33);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "isReserved");

  if (v26)
  {
    if (objc_msgSend(v12, "isOnDisk") && objc_msgSend(v16, "wantsThumbnail"))
      objc_msgSend(v15, "scheduleThumbnailDownloadForItem:serverItem:applySchedulerState:", v12, v13, v34);
LABEL_20:
    v23 = 0;
    goto LABEL_8;
  }
  if (!objc_msgSend(v15, "applyThumbnailToItem:serverItem:atURL:applySchedulerState:", v12, v13, v14, v34))
  {
    if (objc_msgSend(v16, "wantsThumbnail"))
    {
      -[BRCAccountSession fsDownloader](self->_session, "fsDownloader");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "scheduleThumbnailDownloadForItem:serverItem:applySchedulerState:", v12, v13, v34);

    }
    goto LABEL_20;
  }
  v23 = 1;
  *v35 = 1;
  objc_msgSend(v12, "liveThumbnailSignature");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "thumbnailSignature");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v27;
  v30 = v28;
  v31 = v30;
  if (v29 != v30)
  {
    if (v30)
      v23 = objc_msgSend(v29, "isEqual:", v30);
    else
      v23 = 0;
  }

LABEL_8:
  return v23;
}

- (BOOL)_applyOrEvictLosersIfNecessary:(id)a3 si:(id)a4 url:(id)a5 addedLosers:(id)a6 removedLosers:(id)a7 updatedAddition:(BOOL *)a8 applySchedulerState:(int *)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  char v22;
  BOOL v23;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  -[BRCAccountSession fsDownloader](self->_session, "fsDownloader");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v15, "isFault")
    && (objc_msgSend(v15, "desiredVersion"),
        v21 = (void *)objc_claimAutoreleasedReturnValue(),
        v22 = objc_msgSend(v21, "wantsContent"),
        v21,
        (v22 & 1) == 0))
  {
    objc_msgSend(v20, "evictLosersOnItem:atURL:applySchedulerState:", v15, v17, a9);
  }
  else if (objc_msgSend(v20, "applyLosersToItem:serverItem:atURL:applySchedulerState:addedLosers:removedLosers:", v15, v16, v17, a9, v18, v19))
  {
    *a8 = 1;
  }
  v23 = *a9 == 0;

  return v23;
}

- (BOOL)_appliedOrDownloadContentIfNecessary:(id)a3 si:(id)a4 applySchedulerState:(int *)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  NSObject *v22;
  BOOL v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  int v30;
  void *v31;
  NSObject *v32;
  int v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  objc_msgSend(v8, "desiredVersion");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "downloadError");
  v11 = objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v12 = (void *)v11;
    objc_msgSend(v10, "downloadError");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v13, "brc_isOutOfSpaceError"))
    {

    }
    else
    {
      objc_msgSend(v9, "latestVersion");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v10, "isEtagEqual:", v14);

      if (v15)
      {
        brc_bread_crumbs();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          v34 = 138412290;
          v35 = v16;
          _os_log_impl(&dword_1CBD43000, v17, OS_LOG_TYPE_DEFAULT, "[WARNING] there is a download error, marking item applied and waiting for subsequent updates%@", (uint8_t *)&v34, 0xCu);
        }

        *a5 = 0;
        goto LABEL_18;
      }
    }
  }
  objc_msgSend(v8, "currentVersion");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "latestVersion");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v18, "isEtagEqual:", v19) & 1) != 0)
    v20 = 1;
  else
    v20 = objc_msgSend(v8, "isPausedFromSync");

  if (objc_msgSend(v8, "isFault") && objc_msgSend(v10, "wantsContent"))
  {
    if (objc_msgSend(v10, "isFault"))
    {
      brc_bread_crumbs();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
        -[BRCURLToItemLookup(BRCFSWriter) _appliedOrDownloadContentIfNecessary:si:applySchedulerState:].cold.3();

      objc_msgSend(v10, "setOptions:", objc_msgSend(v10, "options") & 0xFFFFFFFELL);
    }
LABEL_19:
    if (!v10)
    {
      v23 = 0;
      v30 = 1;
      goto LABEL_24;
    }
    objc_msgSend(v8, "st");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "stagedFileID");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (v25)
    {
      -[BRCAccountSession stageRegistry](self->_session, "stageRegistry");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "st");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "stagedFileID");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v26, "didFlushStagedFileID:", objc_msgSend(v28, "unsignedLongLongValue"));

      if (v29)
      {
        v23 = 0;
        v30 = 20;
LABEL_24:
        *a5 = v30;
        goto LABEL_33;
      }
      *a5 = 1;
      brc_bread_crumbs();
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_FAULT))
        -[BRCURLToItemLookup(BRCFSWriter) _appliedOrDownloadContentIfNecessary:si:applySchedulerState:].cold.2();
    }
    else
    {
      if (objc_msgSend(v10, "wantsContent"))
      {
        *a5 = 23;
        -[BRCAccountSession fsDownloader](self->_session, "fsDownloader");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "scheduleContentDownloadForItem:serverItem:options:etagIfLoser:stageFileName:error:", v8, v9, 0, 0, 0, 0);
LABEL_32:

        v23 = 0;
        goto LABEL_33;
      }
      brc_bread_crumbs();
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_FAULT))
        -[BRCURLToItemLookup(BRCFSWriter) _appliedOrDownloadContentIfNecessary:si:applySchedulerState:].cold.1();
    }

    goto LABEL_32;
  }
  if ((v20 & 1) == 0)
    goto LABEL_19;
LABEL_18:
  v23 = 1;
LABEL_33:

  return v23;
}

- (void)didApplyChangesAtPath:(id)a3 filename:(id)a4 li:(id)a5 si:(id)a6
{
  void *v6;
  void *v7;
  void *v8;
  id v13;
  id v14;
  int v15;
  void *v16;
  NSObject *v17;
  int v18;
  id v19;
  void *v20;
  void *v21;
  char v22;
  _BOOL4 v23;
  int v24;
  int v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  int v32;
  int v33;
  void *v34;
  void *v35;
  int v36;
  void *v37;
  _BOOL4 v38;
  void *v39;
  NSObject *v40;
  const char *v41;
  uint64_t v42;
  void *v43;
  NSObject *v44;
  int v45;
  void *v46;
  char *v47;
  NSObject *v48;
  void *v49;
  NSObject *v50;
  void *v51;
  NSObject *v52;
  void *v53;
  NSObject *v54;
  unsigned int v55;
  void *v57;
  NSObject *v58;
  unsigned int v59;
  void *v61;
  NSObject *v62;
  char *v63;
  NSObject *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  uint64_t v69;
  void *v70;
  void *v71;
  NSObject *v72;
  char *v73;
  NSObject *v74;
  uint64_t v75;
  id v76;
  void *v77;
  void *v78;
  void (**v79)(_QWORD, _QWORD);
  void *v80;
  int v81;
  void *v82;
  void *v83;
  void (**v84)(_QWORD, _QWORD);
  void *v85;
  BRCItemGlobalID *v86;
  void *v87;
  void *v88;
  void *v89;
  BRCItemGlobalID *v90;
  void *v91;
  uint64_t v92;
  id v93;
  void *v94;
  void *v95;
  uint64_t v96;
  const char *v97;
  const char *v98;
  const char *v99;
  const char *v100;
  const char *v101;
  const char *v102;
  const __CFString *v103;
  const __CFString *v104;
  const __CFString *v105;
  void *v106;
  NSObject *v107;
  void *v108;
  NSObject *v109;
  NSObject *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  int v116;
  _BOOL4 v117;
  void *v118;
  _BOOL4 v119;
  void *v120;
  _BOOL4 v121;
  void *v122;
  void *v123;
  void *v124;
  id v125;
  id v126;
  void *v127;
  void *v128;
  BRCURLToItemLookup *v129;
  _QWORD v130[4];
  id v131;
  id v132;
  id v133;
  _QWORD v134[4];
  id v135;
  char v136;
  unsigned int v137;
  uint64_t v138;
  uint64_t v139[3];
  char v140;
  uint8_t buf[4];
  uint64_t v142;
  __int16 v143;
  id v144;
  __int16 v145;
  uint64_t v146;
  __int16 v147;
  const char *v148;
  __int16 v149;
  const char *v150;
  __int16 v151;
  const char *v152;
  __int16 v153;
  void *v154;
  __int16 v155;
  id v156;
  __int16 v157;
  id v158;
  __int16 v159;
  void *v160;
  uint64_t v161;

  v161 = *MEMORY[0x1E0C80C00];
  v125 = a3;
  v126 = a4;
  v13 = a5;
  v14 = a6;
  v129 = self;
  -[BRCAccountSession fsDownloader](self->_session, "fsDownloader");
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
    v15 = objc_msgSend(v14, "isDead");
  else
    v15 = 1;
  v140 = 0;
  v127 = (void *)objc_opt_new();
  v128 = (void *)objc_opt_new();
  memset(v139, 0, sizeof(v139));
  __brc_create_section(0, (uint64_t)"-[BRCURLToItemLookup(BRCFSWriter) didApplyChangesAtPath:filename:li:si:]", 1737, v139);
  brc_bread_crumbs();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218498;
    v142 = v139[0];
    v143 = 2112;
    v144 = v13;
    v145 = 2112;
    v146 = (uint64_t)v16;
    _os_log_debug_impl(&dword_1CBD43000, v17, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx did apply changes for %@%@", buf, 0x20u);
  }

  if (v15)
  {
    v18 = objc_msgSend(v13, "isDead");
LABEL_44:
    v124 = 0;
    v42 = v18 ^ 1u;
    goto LABEL_88;
  }
  if ((objc_msgSend(v13, "isDocument") & 1) == 0)
  {
    v24 = objc_msgSend(v13, "isSharedToMeTopLevelItem");
    if (v24)
    {
      objc_msgSend(v13, "st");
      v123 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v123, "ckInfo");
      v120 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v120, "etag");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
      {
        v25 = 0;
      }
      else
      {
        objc_msgSend(v14, "st");
        v118 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v118, "ckInfo");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "etag");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v7)
        {

          v6 = 0;
          v18 = 1;
LABEL_43:

          goto LABEL_44;
        }
        v6 = 0;
        v25 = 1;
      }
    }
    else
    {
      v25 = 0;
    }
    objc_msgSend(v13, "st");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "st");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v26, "isEtagEqual:", v27);

    if (v25)
    {

      if ((v24 & 1) == 0)
        goto LABEL_44;
    }
    else if (!v24)
    {
      goto LABEL_44;
    }
    goto LABEL_43;
  }
  objc_msgSend(v13, "asDocument");
  v19 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "desiredVersion");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v138 = 0;
  v137 = 0;
  if (!v126
    || (objc_msgSend(v125, "filename"),
        v21 = (void *)objc_claimAutoreleasedReturnValue(),
        v22 = objc_msgSend(v126, "isEqualToString:", v21),
        v21,
        (v22 & 1) != 0))
  {
    objc_msgSend(v125, "physicalURL");
    v124 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = -[BRCURLToItemLookup _applyOrDownloadThumbnailIfNecessary:si:url:updatedAddition:applySchedulerState:](v129, "_applyOrDownloadThumbnailIfNecessary:si:url:updatedAddition:applySchedulerState:", v19, v14, v124, &v140, (char *)&v138 + 4);
    goto LABEL_23;
  }
  objc_msgSend(v125, "absolutePath");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "stringByDeletingLastPathComponent");
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v29, "stringByAppendingPathComponent:", v126);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v30)
  {
    objc_msgSend(v125, "absolutePath");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = v37 == 0;

    if (v38)
    {
      brc_bread_crumbs();
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v40 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412802;
        v142 = (uint64_t)v125;
        v143 = 2112;
        v144 = v126;
        v145 = 2112;
        v146 = (uint64_t)v39;
        v41 = "[CRIT] UNREACHABLE: Can't compose absolute path for %@ and filename %@ because path.absolutePath is nil%@";
        goto LABEL_155;
      }
    }
    else
    {
      brc_bread_crumbs();
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v40 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412802;
        v142 = (uint64_t)v125;
        v143 = 2112;
        v144 = v126;
        v145 = 2112;
        v146 = (uint64_t)v39;
        v41 = "[CRIT] UNREACHABLE: Can't compose absolute path for %@ and filename %@%@";
LABEL_155:
        _os_log_fault_impl(&dword_1CBD43000, v40, OS_LOG_TYPE_FAULT, v41, buf, 0x20u);
      }
    }

    goto LABEL_120;
  }
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v30, 0);
  v124 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = -[BRCURLToItemLookup _applyOrDownloadThumbnailIfNecessary:si:url:updatedAddition:applySchedulerState:](v129, "_applyOrDownloadThumbnailIfNecessary:si:url:updatedAddition:applySchedulerState:", v19, v14, v124, &v140, (char *)&v138 + 4);
LABEL_23:
  v121 = v23;
  v119 = -[BRCURLToItemLookup _appliedOrDownloadContentIfNecessary:si:applySchedulerState:](v129, "_appliedOrDownloadContentIfNecessary:si:applySchedulerState:", v19, v14, &v137);
  v117 = -[BRCURLToItemLookup _applyOrEvictLosersIfNecessary:si:url:addedLosers:removedLosers:updatedAddition:applySchedulerState:](v129, "_applyOrEvictLosersIfNecessary:si:url:addedLosers:removedLosers:updatedAddition:applySchedulerState:", v19, v14, v124, v127, v128, &v140, &v138);
  if (objc_msgSend(v20, "wantsContent"))
  {
    v116 = objc_msgSend(v19, "isOnDisk");
  }
  else
  {
    v31 = objc_msgSend(v20, "isFault");
    v116 = v31 ^ objc_msgSend(v19, "isFault") ^ 1;
  }
  v32 = objc_msgSend(v19, "isSharedToMeTopLevelItem");
  if (v32)
  {
    objc_msgSend(v19, "st");
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v115, "ckInfo");
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v114, "etag");
    v17 = objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      v33 = 0;
    }
    else
    {
      objc_msgSend(v14, "st");
      v112 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v112, "ckInfo");
      v113 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v113, "etag");
      v111 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v111)
      {

        v17 = 0;
        v36 = 1;
        goto LABEL_46;
      }
      v17 = 0;
      v33 = 1;
    }
  }
  else
  {
    v33 = 0;
  }
  objc_msgSend(v19, "st");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "st");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = objc_msgSend(v34, "isEtagEqual:", v35);

  if (v33)
  {

    if ((v32 & 1) == 0)
      goto LABEL_47;
LABEL_46:

    goto LABEL_47;
  }
  if (v32)
    goto LABEL_46;
LABEL_47:
  brc_bread_crumbs();
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v44 = objc_claimAutoreleasedReturnValue();
  v45 = v121 & v116 & v119;
  v18 = v45 & v36 & v117;
  if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
  {
    v97 = "no";
    *(_DWORD *)buf = 136317442;
    if (v18)
      v98 = "yes";
    else
      v98 = "no";
    v142 = (uint64_t)v98;
    v143 = 2080;
    if (v121)
      v99 = "yes";
    else
      v99 = "no";
    v144 = (id)v99;
    v145 = 2080;
    if (v116)
      v100 = "yes";
    else
      v100 = "no";
    v146 = (uint64_t)v100;
    if (v119)
      v101 = "yes";
    else
      v101 = "no";
    v147 = 2080;
    if (v36)
      v102 = "yes";
    else
      v102 = "no";
    v148 = v101;
    if (v117)
      v97 = "yes";
    v149 = 2080;
    v150 = v102;
    v151 = 2080;
    v152 = v97;
    v153 = 2112;
    v154 = v20;
    v155 = 2112;
    v156 = v19;
    v157 = 2112;
    v158 = v14;
    v159 = 2112;
    v160 = v43;
    _os_log_debug_impl(&dword_1CBD43000, v44, OS_LOG_TYPE_DEBUG, "[DEBUG] item application status\n applied: %s\n   thumbnail: %s\n       fault: %s\n     content: %s\n   structure: %s\n      losers: %s\n\n  desired: %@\n  current: %@\n   server: %@\n%@", buf, 0x66u);
  }

  if (v45)
  {
    objc_msgSend(v19, "clearDesiredVersion");
    v46 = v20;
    v20 = 0;
  }
  else
  {
    brc_bread_crumbs();
    v47 = (char *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v48 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG))
    {
      v103 = CFSTR("yes");
      if (v121)
        v104 = CFSTR("no");
      else
        v104 = CFSTR("yes");
      *(_DWORD *)buf = 138413058;
      v142 = (uint64_t)v104;
      if (v116)
        v105 = CFSTR("no");
      else
        v105 = CFSTR("yes");
      v143 = 2112;
      v144 = (id)v105;
      v145 = 2112;
      if (v119)
        v103 = CFSTR("no");
      v146 = (uint64_t)v103;
      v147 = 2112;
      v148 = v47;
      _os_log_debug_impl(&dword_1CBD43000, v48, OS_LOG_TYPE_DEBUG, "[DEBUG] Not fully applied: wantsThumb:%@ wantsFault:%@ wantsContent:%@%@", buf, 0x2Au);
    }

    if (!v20 || (objc_msgSend(v20, "wantsContent") & 1) != 0 || (objc_msgSend(v20, "wantsThumbnail") & 1) != 0)
      goto LABEL_55;
    brc_bread_crumbs();
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v110 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v110, OS_LOG_TYPE_FAULT))
      -[BRCURLToItemLookup(BRCFSWriter) didApplyChangesAtPath:filename:li:si:].cold.9();

  }
LABEL_55:
  if (HIDWORD(v138))
  {
    brc_bread_crumbs();
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v50 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v50, OS_LOG_TYPE_DEBUG))
      -[BRCURLToItemLookup(BRCFSWriter) didApplyChangesAtPath:filename:li:si:].cold.8();

    v42 = HIDWORD(v138);
    if (v121)
    {
      brc_bread_crumbs();
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v52 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v52, OS_LOG_TYPE_FAULT))
        -[BRCURLToItemLookup(BRCFSWriter) didApplyChangesAtPath:filename:li:si:].cold.7();

    }
  }
  else
  {
    v42 = 0;
  }
  if ((_DWORD)v138)
  {
    brc_bread_crumbs();
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v54 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v54, OS_LOG_TYPE_DEBUG))
      -[BRCURLToItemLookup(BRCFSWriter) didApplyChangesAtPath:filename:li:si:].cold.6();

    v55 = v138;
    if ((_DWORD)v138 != 1 && (_DWORD)v42 != 0)
      v55 = v42;
    if ((_DWORD)v42 == 1)
      v42 = 1;
    else
      v42 = v55;
    if (v117)
    {
      brc_bread_crumbs();
      v106 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v107 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v107, OS_LOG_TYPE_FAULT))
        -[BRCURLToItemLookup(BRCFSWriter) didApplyChangesAtPath:filename:li:si:].cold.5();

    }
  }
  if (v137)
  {
    brc_bread_crumbs();
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v58 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v58, OS_LOG_TYPE_DEBUG))
      -[BRCURLToItemLookup(BRCFSWriter) didApplyChangesAtPath:filename:li:si:].cold.4();

    v59 = v137;
    if (v137 != 1 && (_DWORD)v42 != 0)
      v59 = v42;
    if ((_DWORD)v42 == 1)
      v42 = 1;
    else
      v42 = v59;
    if (v119)
    {
      brc_bread_crumbs();
      v108 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v109 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v109, OS_LOG_TYPE_FAULT))
        -[BRCURLToItemLookup(BRCFSWriter) didApplyChangesAtPath:filename:li:si:].cold.3();

    }
  }

LABEL_88:
  if (v140)
  {
    brc_bread_crumbs();
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v62 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v62, OS_LOG_TYPE_DEBUG))
      -[BRCURLToItemLookup(BRCFSWriter) didApplyChangesAtPath:filename:li:si:].cold.2();

    objc_msgSend(v13, "markForceNotify");
  }
  brc_bread_crumbs();
  v63 = (char *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v64 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v64, OS_LOG_TYPE_DEBUG))
  {
    if (objc_msgSend(v13, "isRejected"))
      v92 = -objc_msgSend(v13, "dbRowID");
    else
      v92 = objc_msgSend(v14, "rank");
    objc_msgSend(v13, "itemID");
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v94, "debugItemIDString");
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    v96 = BRCPrettyPrintEnum();
    *(_DWORD *)buf = 134218754;
    v142 = v92;
    v143 = 2112;
    v144 = v95;
    v145 = 2080;
    v146 = v96;
    v147 = 2112;
    v148 = v63;
    _os_log_debug_impl(&dword_1CBD43000, v64, OS_LOG_TYPE_DEBUG, "[DEBUG] Apply Changes[%lld]: %@ state becomes %s%@", buf, 0x2Au);

  }
  objc_msgSend(v13, "st");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "fileID");
  v66 = (void *)objc_claimAutoreleasedReturnValue();

  -[BRCAccountSession applyScheduler](v129->_session, "applyScheduler");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v68 = v67;
  if (v66)
    v69 = 2;
  else
    v69 = 1;
  objc_msgSend(v67, "setState:andApplyKind:forServerItem:localItem:", v42, v69, v14, v13);

  if (!v18)
  {
    brc_bread_crumbs();
    v73 = (char *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v74 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v74, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v13, "diffAgainstServerItem:", v14);
      BRCItemFieldsPrettyPrint();
      v93 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      v142 = (uint64_t)v13;
      v143 = 2112;
      v144 = v14;
      v145 = 2112;
      v146 = (uint64_t)v93;
      v147 = 2112;
      v148 = v73;
      _os_log_debug_impl(&dword_1CBD43000, v74, OS_LOG_TYPE_DEBUG, "[DEBUG] we still have unapplied changes:\n  client item: %@\n  server item: %@\n  diffs: %@%@", buf, 0x2Au);

    }
    goto LABEL_107;
  }
  if (objc_msgSend(v13, "isDead"))
  {
    objc_msgSend(v13, "clientZone");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "didApplyTombstoneForRank:", objc_msgSend(v14, "rank"));

    if (objc_msgSend(v13, "isSharedToMeTopLevelItem"))
    {
      brc_bread_crumbs();
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v72 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v72, OS_LOG_TYPE_DEBUG))
        -[BRCURLToItemLookup(BRCFSWriter) didApplyChangesAtPath:filename:li:si:].cold.1();

      objc_msgSend(v13, "asSharedToMeTopLevelItem");
      v73 = (char *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v73, "insertTombstoneAliasRecordInZone:", 0);
      goto LABEL_107;
    }
  }
  else if (objc_msgSend(v13, "isDocument"))
  {
    objc_msgSend(v13, "asDocument");
    v73 = (char *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v122, "cancelAndCleanupItemDownloads:", v73);
LABEL_107:

  }
  -[BRCAccountSession clientDB](v129->_session, "clientDB");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v75 = MEMORY[0x1E0C809B0];
  v134[0] = MEMORY[0x1E0C809B0];
  v134[1] = 3221225472;
  v134[2] = __72__BRCURLToItemLookup_BRCFSWriter__didApplyChangesAtPath_filename_li_si___block_invoke;
  v134[3] = &unk_1E875DC48;
  v76 = v13;
  v135 = v76;
  v136 = v140;
  v130[0] = v75;
  v130[1] = 3221225472;
  v130[2] = __72__BRCURLToItemLookup_BRCFSWriter__didApplyChangesAtPath_filename_li_si___block_invoke_2;
  v130[3] = &unk_1E875E088;
  v131 = v127;
  v19 = v124;
  v132 = v19;
  v133 = v128;
  objc_msgSend(v20, "performWithFlags:action:whenFlushed:", 0, v134, v130);
  if (objc_msgSend(v76, "isOnDisk"))
  {
    objc_msgSend(v76, "clientZone");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "itemID");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v77, "popOnDiskBlockForItemID:", v78);
    v79 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

    if (v79)
      v79[2](v79, objc_msgSend(v76, "isOnDisk"));

  }
  if (objc_msgSend(v76, "isDocument"))
  {
    objc_msgSend(v76, "asDocument");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    v81 = objc_msgSend(v80, "hasLocalContent");

    if (v81)
    {
      objc_msgSend(v76, "clientZone");
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v76, "itemID");
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v82, "popDownloadedBlockForItemID:", v83);
      v84 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

      if (v84)
        ((void (**)(_QWORD, id))v84)[2](v84, v76);

    }
  }
  if (objc_msgSend(v76, "isShared"))
  {
    objc_msgSend(MEMORY[0x1E0C95070], "brc_fetchShareIDWithSharedItem:", v76);
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    v86 = [BRCItemGlobalID alloc];
    objc_msgSend(v76, "clientZone");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v87, "dbRowID");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v85, "brc_shareItemID");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    v90 = -[BRCItemGlobalID initWithZoneRowID:itemID:](v86, "initWithZoneRowID:itemID:", v88, v89);

    -[BRCAccountSession analyticsReporter](v129->_session, "analyticsReporter");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v91, "didApplyItemInsideSharedItemID:", v90);

  }
LABEL_120:

  __brc_leave_section(v139);
}

uint64_t __72__BRCURLToItemLookup_BRCFSWriter__didApplyChangesAtPath_filename_li_si___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "clientZone");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "parentsOfCZMFaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "itemID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    objc_msgSend(*(id *)(a1 + 32), "markLostWhenReplacedByItem:", 0);
  objc_msgSend(*(id *)(a1 + 32), "saveToDBForServerEdit:keepAliases:", 1, 0);
  if (*(_BYTE *)(a1 + 40))
    objc_msgSend(v3, "flushToMakeEditsVisibleToIPCReaders");

  return 1;
}

void __72__BRCURLToItemLookup_BRCFSWriter__didApplyChangesAtPath_filename_li_si___block_invoke_2(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint8_t v36[128];
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  void *v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v32, v41, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v33;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v33 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * v6);
        brc_bread_crumbs();
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(v7, "name");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v38 = v14;
          v39 = 2112;
          v40 = v8;
          _os_log_debug_impl(&dword_1CBD43000, v9, OS_LOG_TYPE_DEBUG, "[DEBUG] Found loser (sending didGainVersion %@)%@", buf, 0x16u);

        }
        v10 = (void *)MEMORY[0x1E0CB3600];
        v11 = *(_QWORD *)(a1 + 40);
        objc_msgSend(v7, "nameSpace");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "name");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "__itemAtURL:didGainVersionWithClientID:name:purposeID:", v11, v12, v13, 0);

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v32, v41, 16);
    }
    while (v4);
  }

  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v15 = *(id *)(a1 + 48);
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v29;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v29 != v18)
          objc_enumerationMutation(v15);
        v20 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * v19);
        brc_bread_crumbs();
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(v20, "name");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v38 = v27;
          v39 = 2112;
          v40 = v21;
          _os_log_debug_impl(&dword_1CBD43000, v22, OS_LOG_TYPE_DEBUG, "[DEBUG] Removed loser (sending didLoseVersion %@)%@", buf, 0x16u);

        }
        v23 = (void *)MEMORY[0x1E0CB3600];
        v24 = *(_QWORD *)(a1 + 40);
        objc_msgSend(v20, "nameSpace");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "name");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "__itemAtURL:didLoseVersionWithClientID:name:purposeID:", v24, v25, v26, 0);

        ++v19;
      }
      while (v17 != v19);
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
    }
    while (v17);
  }

}

- (void)initWithURL:(_QWORD *)a1 allowAppLibraryRoot:session:db:.cold.1(_QWORD *a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = *a1;
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4_1(&dword_1CBD43000, v1, v2, "[ERROR] can't extract logical name from fault name; %@%@",
    (_QWORD)v3,
    DWORD2(v3));
  OUTLINED_FUNCTION_2();
}

- (void)initWithURL:(uint64_t)a1 allowAppLibraryRoot:session:db:.cold.2(uint64_t a1)
{
  os_log_t v1;
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412546;
  v3 = a1;
  OUTLINED_FUNCTION_5();
  _os_log_debug_impl(&dword_1CBD43000, v1, OS_LOG_TYPE_DEBUG, "[DEBUG] can't extract filename from %@%@", (uint8_t *)&v2, 0x16u);
  OUTLINED_FUNCTION_2();
}

- (void)initWithURL:(uint64_t)a1 allowAppLibraryRoot:session:db:.cold.3(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4_1(&dword_1CBD43000, v1, v2, "[ERROR] can't extract filename from %@%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_2();
}

- (void)initWithURL:allowAppLibraryRoot:session:db:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: session%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)initWithURL:allowAppLibraryRoot:session:db:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: url%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)resolveParentAndKeepOpenMustExist:errcode:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: !_parentRelpath.exists || _parentRelpath.isUnixDir%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)parentItem
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: _hasFetched.parentPath%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __65__BRCURLToItemLookup_BRCFSWriter___removeDirectory_atPath_error___block_invoke_cold_1(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = *(_QWORD *)(a1 + 32);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v1, v2, "[DEBUG] removing empty directory  %@%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_2();
}

@end
