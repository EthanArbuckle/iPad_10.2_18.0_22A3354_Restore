@implementation BRFieldXattrBlob

+ (id)loadXattrsFromFD:(int)a3 withMaximumSize:(unint64_t)a4 error:(id *)a5
{
  BRCLazyXattrsCollection *v8;
  BRCLazyXattrsCollection *v9;
  id v10;
  BRCLazyXattrsCollection *v11;
  void *v12;

  v8 = -[BRCLazyXattrsCollection initWithFD:sizeLimit:syncable:error:]([BRCLazyXattrsCollection alloc], "initWithFD:sizeLimit:syncable:error:", *(_QWORD *)&a3, a4, 1, a5);
  v9 = v8;
  if (v8 && -[BRCLazyXattrsCollection xattrNamesCount](v8, "xattrNamesCount"))
  {
    v10 = objc_alloc_init(MEMORY[0x1E0D82B98]);
    v11 = objc_retainAutorelease(v9);
    if (brc_pack_xattrs(a3, v10, a4, (uint64_t)-[BRCLazyXattrsCollection xattrNamesBegin](v11, "xattrNamesBegin"), -[BRCLazyXattrsCollection xattrNamesCount](v11, "xattrNamesCount"), a5))
    {
      objc_msgSend(v10, "data");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

+ (BOOL)loadXattrsFromURL:(id)a3 structuralBlob:(id *)a4 contentBlob:(id *)a5 localBlob:(id *)a6 withMaximumSize:(unint64_t)a7 error:(id *)a8
{
  id v14;
  uint64_t v15;
  int v16;
  char v17;
  void *v18;
  NSObject *v19;

  v14 = objc_retainAutorelease(a3);
  v15 = openat(-1, (const char *)objc_msgSend(v14, "fileSystemRepresentation"), 33028, 0);
  if ((v15 & 0x80000000) != 0)
  {
    brc_bread_crumbs();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, (os_log_type_t)0x90u))
      +[BRFieldXattrBlob(BRCStageAdditions) loadXattrsFromURL:structuralBlob:contentBlob:localBlob:withMaximumSize:error:].cold.1(v14, (uint64_t)v18, v19);

    if (a8)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "br_errorFromErrno");
      v17 = 0;
      *a8 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v17 = 0;
    }
  }
  else
  {
    v16 = v15;
    v17 = objc_msgSend(a1, "loadXattrsFromFD:structuralBlob:contentBlob:localBlob:withMaximumSize:error:", v15, a4, a5, a6, a7, a8);
    close(v16);
  }

  return v17;
}

+ (BOOL)loadXattrsFromFD:(int)a3 structuralBlob:(id *)a4 contentBlob:(id *)a5 localBlob:(id *)a6 withMaximumSize:(unint64_t)a7 error:(id *)a8
{
  BRCLazyXattrsCollection *v14;
  BRCLazyXattrsCollection *v15;
  unsigned int v16;
  id v17;
  BRCLazyXattrsCollection *v18;
  void *v19;
  id v20;
  unsigned int v21;
  id v22;
  BRCLazyXattrsCollection *v23;
  void *v24;
  id v25;
  BOOL v26;
  void *v28;
  NSObject *v29;

  v14 = -[BRCLazyXattrsCollection initWithFD:sizeLimit:syncable:error:]([BRCLazyXattrsCollection alloc], "initWithFD:sizeLimit:syncable:error:", *(_QWORD *)&a3, a7, 1, a8);
  v15 = v14;
  if (!v14)
  {
    v17 = 0;
    goto LABEL_13;
  }
  v16 = -[BRCLazyXattrsCollection structuralXattrNamesCount](v14, "structuralXattrNamesCount");
  v17 = 0;
  if (!a4 || !v16)
    goto LABEL_6;
  v17 = objc_alloc_init(MEMORY[0x1E0D82B98]);
  v18 = objc_retainAutorelease(v15);
  if (!brc_pack_xattrs(a3, v17, a7, (uint64_t)-[BRCLazyXattrsCollection structuralXattrNamesBegin](v18, "structuralXattrNamesBegin"), -[BRCLazyXattrsCollection structuralXattrNamesCount](v18, "structuralXattrNamesCount"), a8))
  {
LABEL_13:
    v26 = 0;
    goto LABEL_14;
  }
  objc_msgSend(v17, "data");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = *a4;
  *a4 = v19;

LABEL_6:
  v21 = -[BRCLazyXattrsCollection contentXattrNamesCount](v15, "contentXattrNamesCount");
  if (a5 && v21)
  {
    v22 = objc_alloc_init(MEMORY[0x1E0D82B98]);

    v23 = objc_retainAutorelease(v15);
    if (!brc_pack_xattrs(a3, v22, a7, (uint64_t)-[BRCLazyXattrsCollection contentXattrNamesBegin](v23, "contentXattrNamesBegin"), -[BRCLazyXattrsCollection contentXattrNamesCount](v23, "contentXattrNamesCount"), a8))
    {
      v26 = 0;
      v17 = v22;
      goto LABEL_14;
    }
    objc_msgSend(v22, "data");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = *a5;
    *a5 = v24;

    v17 = v22;
  }
  if (a6)
  {
    brc_bread_crumbs();
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT))
      +[BRFieldXattrBlob(BRCStageAdditions) loadXattrsFromFD:structuralBlob:contentBlob:localBlob:withMaximumSize:error:].cold.1((uint64_t)v28, v29);

  }
  v26 = 1;
LABEL_14:

  return v26;
}

+ (BOOL)removeXattrsOnFD:(int)a3 includingContentRelated:(BOOL)a4 error:(id *)a5
{
  _BOOL4 v5;
  BRCLazyXattrsCollection *v7;
  BRCLazyXattrsCollection *v8;
  BRCLazyXattrsCollection *v9;
  BRCLazyXattrsCollection *v10;
  const char **v11;
  unsigned int v12;

  v5 = a4;
  v7 = -[BRCLazyXattrsCollection initWithFD:sizeLimit:syncable:error:]([BRCLazyXattrsCollection alloc], "initWithFD:sizeLimit:syncable:error:", *(_QWORD *)&a3, -1, 1, a5);
  v8 = v7;
  if (v7)
  {
    v9 = objc_retainAutorelease(v7);
    v10 = v9;
    if (v5)
    {
      v11 = -[BRCLazyXattrsCollection xattrNamesBegin](v9, "xattrNamesBegin");
      v12 = -[BRCLazyXattrsCollection xattrNamesCount](v10, "xattrNamesCount");
    }
    else
    {
      v11 = -[BRCLazyXattrsCollection structuralXattrNamesBegin](v9, "structuralXattrNamesBegin");
      v12 = -[BRCLazyXattrsCollection structuralXattrNamesCount](v10, "structuralXattrNamesCount");
    }
    brc_remove_xattrs(a3, v11, v12);
  }

  return v8 != 0;
}

- (BOOL)applyToFileDescriptor:(int)a3 error:(id *)a4
{
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  id v13;
  const char *v14;
  void *v15;
  NSObject *v16;
  id v17;
  uint64_t v18;
  BOOL v19;
  void *v20;
  void *v21;
  NSObject *v22;
  const char *v24;
  id *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t buf[4];
  const char *v31;
  __int16 v32;
  uint64_t v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  void *v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v6 = self->_xattrs;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v26, v38, 16);
  if (v7)
  {
    v8 = v7;
    v25 = a4;
    v9 = *(_QWORD *)v27;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v27 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        objc_msgSend(v11, "value");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "name");
        v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v14 = (const char *)objc_msgSend(v13, "fileSystemRepresentation");

        brc_bread_crumbs();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        {
          v18 = objc_msgSend(v12, "length");
          *(_DWORD *)buf = 136315650;
          v31 = v14;
          v32 = 2048;
          v33 = v18;
          v34 = 2112;
          v35 = v15;
          _os_log_debug_impl(&dword_1CBD43000, v16, OS_LOG_TYPE_DEBUG, "[DEBUG] added xattr %s (%lld bytes)%@", buf, 0x20u);
        }

        v17 = objc_retainAutorelease(v12);
        if (fsetxattr(a3, v14, (const void *)objc_msgSend(v17, "bytes"), objc_msgSend(v17, "length"), 0, 0) < 0)
        {
          objc_msgSend(MEMORY[0x1E0CB35C8], "br_errorFromErrno");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          if (v20)
          {
            brc_bread_crumbs();
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            brc_default_log();
            v22 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v22, (os_log_type_t)0x90u))
            {
              v24 = "(passed to caller)";
              *(_DWORD *)buf = 136315906;
              v31 = "-[BRFieldXattrBlob(BRCStageAdditions) applyToFileDescriptor:error:]";
              v32 = 2080;
              if (!v25)
                v24 = "(ignored by caller)";
              v33 = (uint64_t)v24;
              v34 = 2112;
              v35 = v20;
              v36 = 2112;
              v37 = v21;
              _os_log_error_impl(&dword_1CBD43000, v22, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
            }

          }
          if (v25)
            *v25 = objc_retainAutorelease(v20);

          v19 = 0;
          goto LABEL_18;
        }

      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v26, v38, 16);
      if (v8)
        continue;
      break;
    }
  }
  v19 = 1;
LABEL_18:

  return v19;
}

- (id)shortDescription
{
  void *v3;
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t i;
  void *v10;
  void *v11;
  uint64_t v12;
  unint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(CFSTR("{"), "mutableCopy");
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v4 = self->_xattrs;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v20;
    v8 = "";
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v20 != v7)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        if ((unint64_t)objc_msgSend(v3, "length") >= 0x21)
        {
          objc_msgSend(v3, "appendString:", CFSTR(", ..."));
          goto LABEL_13;
        }
        objc_msgSend(v10, "name");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "length");
        v13 = objc_msgSend(v3, "length") + v12;

        if (v13 >= 0x21)
        {
          v15 = 32 - objc_msgSend(v3, "length");
          objc_msgSend(v10, "name");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "substringToIndex:", v15);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "appendFormat:", CFSTR("%s%@..."), v8, v17, (_QWORD)v19);

          goto LABEL_13;
        }
        objc_msgSend(v10, "name");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "appendFormat:", CFSTR("%s%@"), v8, v14, (_QWORD)v19);

        v8 = ", ";
      }
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      v8 = ", ";
      if (v6)
        continue;
      break;
    }
  }
LABEL_13:

  objc_msgSend(v3, "appendString:", CFSTR("}"));
  return v3;
}

- (void)clearXattrs
{
  -[NSMutableArray removeAllObjects](self->_xattrs, "removeAllObjects");
}

- (void)addXattrs:(id)a3
{
  id v4;
  NSMutableArray *xattrs;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  xattrs = self->_xattrs;
  v8 = v4;
  if (!xattrs)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_xattrs;
    self->_xattrs = v6;

    v4 = v8;
    xattrs = self->_xattrs;
  }
  -[NSMutableArray addObject:](xattrs, "addObject:", v4);

}

- (unint64_t)xattrsCount
{
  return -[NSMutableArray count](self->_xattrs, "count");
}

- (id)xattrsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_xattrs, "objectAtIndex:", a3);
}

+ (Class)xattrsType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)BRFieldXattrBlob;
  -[BRFieldXattrBlob description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRFieldXattrBlob dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSMutableArray count](self->_xattrs, "count"))
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_xattrs, "count"));
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v5 = self->_xattrs;
    v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v13;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v9), "dictionaryRepresentation", (_QWORD)v12);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", v10);

          ++v9;
        }
        while (v7 != v9);
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v7);
    }

    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("xattrs"));
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return BRFieldXattrBlobReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = self->_xattrs;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  void *v7;
  id v8;

  v8 = a3;
  if (-[BRFieldXattrBlob xattrsCount](self, "xattrsCount"))
  {
    objc_msgSend(v8, "clearXattrs");
    v4 = -[BRFieldXattrBlob xattrsCount](self, "xattrsCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[BRFieldXattrBlob xattrsAtIndex:](self, "xattrsAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addXattrs:", v7);

      }
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = self->_xattrs;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        v11 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v10), "copyWithZone:", a3, (_QWORD)v13);
        objc_msgSend(v5, "addXattrs:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSMutableArray *xattrs;
  char v6;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    xattrs = self->_xattrs;
    if ((unint64_t)xattrs | v4[1])
      v6 = -[NSMutableArray isEqual:](xattrs, "isEqual:");
    else
      v6 = 1;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  return -[NSMutableArray hash](self->_xattrs, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = *((id *)a3 + 1);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        -[BRFieldXattrBlob addXattrs:](self, "addXattrs:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++), (_QWORD)v9);
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (NSMutableArray)xattrs
{
  return self->_xattrs;
}

- (void)setXattrs:(id)a3
{
  objc_storeStrong((id *)&self->_xattrs, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xattrs, 0);
}

@end
