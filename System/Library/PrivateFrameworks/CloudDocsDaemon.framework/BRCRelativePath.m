@implementation BRCRelativePath

- (BRCRelativePath)init
{
  BRCRelativePath *v2;
  BRCRelativePath *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BRCRelativePath;
  v2 = -[BRCRelativePath init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_fd = -100;
    brc_mutex_init_recursive(&v2->_mutex.pthread);
  }
  return v3;
}

- (BRCRelativePath)initWithRootPath:(id)a3 session:(id)a4
{
  id v7;
  id v8;
  BRCRelativePath *v9;
  BRCRelativePath *v10;
  void *v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;

  v7 = a3;
  v8 = a4;
  if ((objc_msgSend(v7, "br_isAbsolutePath") & 1) != 0)
  {
    if (v8)
      goto LABEL_3;
    goto LABEL_9;
  }
  brc_bread_crumbs();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
    -[BRCRelativePath initWithRootPath:session:].cold.2();

  if (!v8)
  {
LABEL_9:
    brc_bread_crumbs();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
      -[BRCRelativePath initWithRootPath:session:].cold.1();

  }
LABEL_3:
  v9 = -[BRCRelativePath init](self, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_session, a4);
    objc_storeStrong((id *)&v10->_absolutePath, a3);
  }

  return v10;
}

- (id)_initWithPath:(id)a3 relativeToRoot:(id)a4
{
  id v7;
  id *v8;
  BRCRelativePath *v9;
  BRCRelativePath *v10;
  void *v11;
  uint64_t v12;
  NSString *relativePath;
  NSString *v14;
  uint64_t v15;
  void *v17;
  NSObject *v18;

  v7 = a3;
  v8 = (id *)a4;
  v9 = -[BRCRelativePath init](self, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_session, v8[34]);
    if (!v10->_session)
    {
      brc_bread_crumbs();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
        -[BRCRelativePath _initWithPath:relativeToRoot:].cold.1();

    }
    if (objc_msgSend(v7, "br_isAbsolutePath"))
    {
      objc_msgSend(v8, "absolutePath");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "br_pathRelativeToPath:", v11);
      v12 = objc_claimAutoreleasedReturnValue();
      relativePath = v10->_relativePath;
      v10->_relativePath = (NSString *)v12;

      if (-[NSString length](v10->_relativePath, "length"))
      {
LABEL_8:
        objc_storeStrong((id *)&v10->_basePath, a4);
        goto LABEL_9;
      }
      v14 = v10->_relativePath;
      v10->_relativePath = 0;

      v15 = 16;
    }
    else
    {
      v15 = 24;
    }
    objc_storeStrong((id *)((char *)&v10->super.isa + v15), a3);
    goto LABEL_8;
  }
LABEL_9:

  return v10;
}

- (BRCRelativePath)initWithAbsolutePath:(id)a3 session:(id)a4
{
  id v7;
  id v8;
  BRCRelativePath *v9;
  BRCRelativePath *v10;
  uint64_t v11;
  NSSet *roots;
  void *v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;

  v7 = a3;
  v8 = a4;
  v9 = -[BRCRelativePath init](self, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_session, a4);
    if (!v10->_session)
    {
      brc_bread_crumbs();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
        -[BRCRelativePath _initWithPath:relativeToRoot:].cold.1();

    }
    if ((objc_msgSend(v7, "br_isAbsolutePath") & 1) == 0)
    {
      brc_bread_crumbs();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
        -[BRCRelativePath initWithRootPath:session:].cold.2();

    }
    objc_storeStrong((id *)&v10->_absolutePath, a3);
    objc_msgSend(v8, "roots");
    v11 = objc_claimAutoreleasedReturnValue();
    roots = v10->_roots;
    v10->_roots = (NSSet *)v11;

  }
  return v10;
}

- (BRCRelativePath)initWithPath:(id)a3 appLibrary:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  BRCRelativePath *v12;

  v6 = a3;
  v7 = a4;
  if ((objc_msgSend(v6, "br_isAbsolutePath") & 1) == 0)
  {
    objc_msgSend(v7, "mangledID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "mangledIDString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringByAppendingPathComponent:", v6);
    v10 = objc_claimAutoreleasedReturnValue();

    v6 = (id)v10;
  }
  objc_msgSend(v7, "root");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[BRCRelativePath _initWithPath:relativeToRoot:](self, "_initWithPath:relativeToRoot:", v6, v11);

  return v12;
}

- (BRCRelativePath)initWithFileID:(unint64_t)a3 session:(id)a4
{
  return -[BRCRelativePath initWithFileID:root:session:](self, "initWithFileID:root:session:", a3, 0, a4);
}

- (BRCRelativePath)initWithFileID:(unint64_t)a3 root:(id)a4 session:(id)a5
{
  id v8;
  id v9;
  BRCRelativePath *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v19;
  NSObject *v20;
  void *v21;
  NSObject *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  if (!a3)
  {
    brc_bread_crumbs();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
      -[BRCRelativePath initWithFileID:root:session:].cold.2();

  }
  v10 = -[BRCRelativePath init](self, "init");
  if (v10)
  {
    if (v8)
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v8);
    else
      objc_msgSend(v9, "roots");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)&v10->_session, a5);
    if (!v10->_session)
    {
      brc_bread_crumbs();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
        -[BRCRelativePath _initWithPath:relativeToRoot:].cold.1();

    }
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v12 = v11;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v24;
      while (2)
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v24 != v15)
            objc_enumerationMutation(v12);
          v17 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
          if (objc_msgSend(v17, "fileID", (_QWORD)v23) == a3)
          {
            objc_storeStrong((id *)&v10->_basePath, v17);
            goto LABEL_17;
          }
        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
        if (v14)
          continue;
        break;
      }
    }
LABEL_17:

    v10->_fileID = a3;
    if (!v10->_basePath)
      objc_storeStrong((id *)&v10->_roots, v11);

  }
  return v10;
}

+ (int)locateByFileID:(unint64_t)a3 session:(id)a4
{
  id v5;
  void *v6;
  int v7;
  int v9;

  if (!a3)
    return 2;
  v5 = a4;
  v6 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithFileID:session:", a3, v5);

  v9 = 0;
  if (objc_msgSend(v6, "resolveMustExist:error:", 1, &v9))
    v7 = 0;
  else
    v7 = v9;

  return v7;
}

- (BRCRelativePath)pathWithChildAtPath:(id)a3
{
  id v4;
  id v5;
  void *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;

  v4 = a3;
  if (!-[BRCRelativePath exists](self, "exists"))
  {
    brc_bread_crumbs();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      -[BRCRelativePath pathWithChildAtPath:].cold.2();

  }
  if (!-[BRCRelativePath isUnixDir](self, "isUnixDir"))
  {
    brc_bread_crumbs();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      -[BRCRelativePath pathWithChildAtPath:].cold.1();

  }
  v5 = -[BRCRelativePath _initWithPath:relativeToRoot:]([BRCRelativePath alloc], "_initWithPath:relativeToRoot:", v4, self);

  return (BRCRelativePath *)v5;
}

- (id)pathOfPackageRoot
{
  BRCRelativePath *v3;
  BRCRelativePath *v4;
  void *v6;
  NSObject *v7;

  if (!-[BRCRelativePath isInPackage](self, "isInPackage"))
  {
    brc_bread_crumbs();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      -[BRCRelativePath pathOfPackageRoot].cold.1();

  }
  if (-[BRCRelativePath isInPackage](self, "isInPackage"))
  {
    v3 = self->_basePath;
    if (-[BRCRelativePath isPackageRoot](v3, "isPackageRoot"))
    {
      v4 = v3;
    }
    else
    {
      do
      {
        v4 = v3->_basePath;

        v3 = v4;
      }
      while (!-[BRCRelativePath isPackageRoot](v4, "isPackageRoot"));
    }
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (void)dealloc
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
  _os_log_debug_impl(&dword_1CBD43000, log, OS_LOG_TYPE_DEBUG, "[DEBUG] closing fd:%d%@", (uint8_t *)v4, 0x12u);
  OUTLINED_FUNCTION_2();
}

- (id)basePath
{
  brc_mutex *p_mutex;
  BRCRelativePath *v4;

  p_mutex = &self->_mutex;
  brc_mutex_lock(&self->_mutex.pthread);
  v4 = self->_basePath;
  brc_mutex_unlock(&p_mutex->pthread);
  return v4;
}

- (BRCRelativePath)root
{
  BRCRelativePath *v2;
  void *v3;
  BRCRelativePath *v4;
  void *v5;

  v2 = self;
  -[BRCRelativePath basePath](v2, "basePath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    do
    {
      -[BRCRelativePath basePath](v2, "basePath");
      v4 = (BRCRelativePath *)objc_claimAutoreleasedReturnValue();

      -[BRCRelativePath basePath](v4, "basePath");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      v2 = v4;
    }
    while (v5);
  }
  else
  {
    v4 = v2;
  }
  return v4;
}

- (NSURL)physicalURL
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C99E98];
  -[BRCRelativePath absolutePath](self, "absolutePath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fileURLWithPath:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v4;
}

- (id)logicalURLWithLogicalName:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;

  v4 = a3;
  -[BRCRelativePath absolutePath](self, "absolutePath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v4)
  {
    objc_msgSend(v5, "stringByDeletingLastPathComponent");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringByAppendingPathComponent:", v4);
    v9 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v9);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    v5 = (void *)v9;
  }
  else
  {
    v10 = v6;
  }
  _CFURLPromiseSetPhysicalURL();

  return v10;
}

- (id)logicalURL
{
  uint64_t v3;
  void *v4;
  void *v5;

  if (-[BRCRelativePath exists](self, "exists") && -[BRCRelativePath isFault](self, "isFault"))
  {
    -[BRCRelativePath logicalName](self, "logicalName");
    v3 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[BRCRelativePath filename](self, "filename");
    v3 = objc_claimAutoreleasedReturnValue();
  }
  v4 = (void *)v3;
  -[BRCRelativePath logicalURLWithLogicalName:](self, "logicalURLWithLogicalName:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)isDocument
{
  if (-[BRCRelativePath isInPackage](self, "isInPackage"))
    return 0;
  if (!-[BRCRelativePath isFile](self, "isFile"))
    return -[BRCRelativePath isPackageRoot](self, "isPackageRoot");
  if ((*((_BYTE *)self + 192) & 1) != 0)
    return 0;
  return !-[BRCRelativePath isSymLink](self, "isSymLink");
}

- (BOOL)isFault
{
  _BOOL4 v3;
  void *v4;
  char v5;

  v3 = -[BRCRelativePath isDocument](self, "isDocument");
  if (v3)
  {
    -[BRCRelativePath filename](self, "filename");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "br_isSideFaultName");

    LOBYTE(v3) = v5;
  }
  return v3;
}

- (BOOL)isBundle
{
  void *v4;
  NSObject *v5;

  if (!-[BRCRelativePath exists](self, "exists"))
  {
    brc_bread_crumbs();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      -[BRCRelativePath pathWithChildAtPath:].cold.2();

  }
  return (*((unsigned __int8 *)self + 191) >> 2) & 1;
}

- (BOOL)isUnixDir
{
  void *v4;
  NSObject *v5;

  if (!-[BRCRelativePath exists](self, "exists"))
  {
    brc_bread_crumbs();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      -[BRCRelativePath pathWithChildAtPath:].cold.2();

  }
  return (self->_mode & 0xF000) == 0x4000;
}

- (BOOL)isFile
{
  void *v4;
  NSObject *v5;

  if (!-[BRCRelativePath exists](self, "exists"))
  {
    brc_bread_crumbs();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      -[BRCRelativePath pathWithChildAtPath:].cold.2();

  }
  return (self->_mode & 0xF000) == 0x8000;
}

- (BOOL)isPackageRoot
{
  void *v4;
  NSObject *v5;

  if (!-[BRCRelativePath isResolved](self, "isResolved"))
  {
    brc_bread_crumbs();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      -[BRCRelativePath isPackageRoot].cold.1();

  }
  return (*((unsigned __int8 *)self + 191) >> 3) & 1;
}

- (BOOL)isInPackage
{
  void *v4;
  NSObject *v5;

  if (!-[BRCRelativePath isResolved](self, "isResolved"))
  {
    brc_bread_crumbs();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      -[BRCRelativePath isPackageRoot].cold.1();

  }
  return (*((unsigned __int8 *)self + 191) >> 1) & 1;
}

- (BOOL)isRoot
{
  return !self->_basePath && self->_roots == 0;
}

- (unsigned)type
{
  unsigned __int16 result;
  void *v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;

  if (!-[BRCRelativePath isResolved](self, "isResolved"))
  {
    brc_bread_crumbs();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      -[BRCRelativePath type].cold.2();

  }
  result = self->_type;
  if (!result)
  {
    brc_bread_crumbs();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      -[BRCRelativePath type].cold.1();

    return self->_type;
  }
  return result;
}

- (unsigned)itemScope
{
  void *v4;
  NSObject *v5;

  if (!-[BRCRelativePath isResolved](self, "isResolved"))
  {
    brc_bread_crumbs();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      -[BRCRelativePath type].cold.2();

  }
  return self->_itemScope;
}

- (BOOL)isResolved
{
  brc_mutex *p_mutex;
  void *v4;
  char v5;
  void *v6;
  NSObject *v7;
  BOOL v8;
  void *v9;
  char v10;
  void *v11;
  NSObject *v12;
  void *v14;
  NSObject *v15;

  p_mutex = &self->_mutex;
  brc_mutex_lock(&self->_mutex.pthread);
  if (!self->_absolutePath || !self->_relativePath || !self->_parentFileID)
  {
    if (!self->_basePath
      || (-[BRCRelativePath basePath](self, "basePath"),
          v9 = (void *)objc_claimAutoreleasedReturnValue(),
          v10 = objc_msgSend(v9, "isResolved"),
          v9,
          (v10 & 1) != 0))
    {
      v8 = 0;
      goto LABEL_19;
    }
    brc_bread_crumbs();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      -[BRCRelativePath isResolved].cold.1();
    v8 = 0;
LABEL_18:

    goto LABEL_19;
  }
  if (!-[BRCRelativePath isRoot](self, "isRoot"))
  {
    -[BRCRelativePath basePath](self, "basePath");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isResolved");

    if ((v5 & 1) == 0)
    {
      brc_bread_crumbs();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
        -[BRCRelativePath isResolved].cold.4();

    }
  }
  if ((-[NSString br_isAbsolutePath](self->_absolutePath, "br_isAbsolutePath") & 1) == 0)
  {
    brc_bread_crumbs();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
      -[BRCRelativePath isResolved].cold.3();

  }
  if (-[NSString br_isAbsolutePath](self->_relativePath, "br_isAbsolutePath"))
  {
    brc_bread_crumbs();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      -[BRCRelativePath isResolved].cold.2();
    v8 = 1;
    goto LABEL_18;
  }
  v8 = 1;
LABEL_19:
  brc_mutex_unlock(&p_mutex->pthread);
  return v8;
}

- (BOOL)isExcluded
{
  return *((_BYTE *)self + 191) & 1;
}

- (BOOL)isUnresolvableDueToProtection
{
  return (*((unsigned __int8 *)self + 192) >> 5) & 1;
}

- (BOOL)isSymLink
{
  void *v4;
  NSObject *v5;

  if (!-[BRCRelativePath isResolved](self, "isResolved"))
  {
    brc_bread_crumbs();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      -[BRCRelativePath isPackageRoot].cold.1();

  }
  return (self->_mode & 0xF000) == 40960;
}

- (BOOL)exists
{
  void *v4;
  NSObject *v5;

  if (!-[BRCRelativePath isResolved](self, "isResolved"))
  {
    brc_bread_crumbs();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      -[BRCRelativePath isPackageRoot].cold.1();

  }
  return self->_fileID != 0;
}

- (BRCAppLibrary)appLibrary
{
  void *v4;
  NSObject *v5;

  if (!-[BRCRelativePath isResolved](self, "isResolved"))
  {
    brc_bread_crumbs();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      -[BRCRelativePath type].cold.2();

  }
  return self->_appLibrary;
}

- (NSString)absolutePath
{
  brc_mutex *p_mutex;
  NSString *v4;
  void *v6;
  NSObject *v7;

  p_mutex = &self->_mutex;
  brc_mutex_lock(&self->_mutex.pthread);
  v4 = self->_absolutePath;
  if (!v4 && !-[BRCRelativePath isResolved](self, "isResolved"))
  {
    brc_bread_crumbs();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      -[BRCRelativePath type].cold.2();

  }
  brc_mutex_unlock(&p_mutex->pthread);
  return v4;
}

- (id)relativePath
{
  brc_mutex *p_mutex;
  NSString *v4;

  p_mutex = &self->_mutex;
  brc_mutex_lock(&self->_mutex.pthread);
  v4 = self->_relativePath;
  brc_mutex_unlock(&p_mutex->pthread);
  return v4;
}

- (NSString)pathRelativeToRoot
{
  brc_mutex *p_mutex;
  NSString *v4;
  BRCRelativePath *v5;
  uint64_t v6;
  BRCRelativePath *v7;
  void *v8;
  void *v10;
  NSObject *v11;

  if (!-[BRCRelativePath isResolved](self, "isResolved"))
  {
    brc_bread_crumbs();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      -[BRCRelativePath type].cold.2();

  }
  p_mutex = &self->_mutex;
  brc_mutex_lock(&self->_mutex.pthread);
  v4 = self->_relativePath;
  if (!-[BRCRelativePath isRoot](self, "isRoot"))
  {
    v5 = self->_basePath;
    if (-[BRCRelativePath isRoot](v5, "isRoot"))
    {
      v6 = (uint64_t)v4;
      v7 = v5;
    }
    else
    {
      do
      {
        -[BRCRelativePath relativePath](v5, "relativePath");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "stringByAppendingPathComponent:", v4);
        v6 = objc_claimAutoreleasedReturnValue();

        -[BRCRelativePath basePath](v5, "basePath");
        v7 = (BRCRelativePath *)objc_claimAutoreleasedReturnValue();

        v5 = v7;
        v4 = (NSString *)v6;
      }
      while (!-[BRCRelativePath isRoot](v7, "isRoot"));
    }

    v4 = (NSString *)v6;
  }
  brc_mutex_unlock(&p_mutex->pthread);
  return v4;
}

- (NSString)pathRelativeToPackageRoot
{
  brc_mutex *p_mutex;
  NSString *v4;
  BRCRelativePath *v5;
  NSString *v6;
  BRCRelativePath *v7;
  void *v8;
  void *v10;
  NSObject *v11;

  p_mutex = &self->_mutex;
  brc_mutex_lock(&self->_mutex.pthread);
  if (!-[BRCRelativePath isInPackage](self, "isInPackage"))
  {
    brc_bread_crumbs();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      -[BRCRelativePath pathOfPackageRoot].cold.1();

  }
  if (-[BRCRelativePath isInPackage](self, "isInPackage"))
  {
    v4 = self->_relativePath;
    v5 = self->_basePath;
    if (-[BRCRelativePath isPackageRoot](v5, "isPackageRoot"))
    {
      v6 = v4;
      v7 = v5;
    }
    else
    {
      do
      {
        -[BRCRelativePath relativePath](v5, "relativePath");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "stringByAppendingPathComponent:", v4);
        v6 = (NSString *)objc_claimAutoreleasedReturnValue();

        -[BRCRelativePath basePath](v5, "basePath");
        v7 = (BRCRelativePath *)objc_claimAutoreleasedReturnValue();

        v5 = v7;
        v4 = v6;
      }
      while (!-[BRCRelativePath isPackageRoot](v7, "isPackageRoot"));
    }
    brc_mutex_unlock(&p_mutex->pthread);

  }
  else
  {
    brc_mutex_unlock(&p_mutex->pthread);
    v6 = 0;
  }
  return v6;
}

- (NSString)filename
{
  brc_mutex *p_mutex;
  NSUInteger v4;
  uint64_t v5;
  void *v6;
  void *v8;
  NSObject *v9;

  p_mutex = &self->_mutex;
  brc_mutex_lock(&self->_mutex.pthread);
  if (!-[BRCRelativePath isResolved](self, "isResolved"))
  {
    brc_bread_crumbs();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      -[BRCRelativePath type].cold.2();

  }
  v4 = -[NSString length](self->_relativePath, "length");
  v5 = 24;
  if (!v4)
    v5 = 16;
  objc_msgSend(*(id *)((char *)&self->super.isa + v5), "lastPathComponent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  brc_mutex_unlock(&p_mutex->pthread);
  return (NSString *)v6;
}

- (NSString)logicalName
{
  void *v3;
  int v4;
  int fd;
  ssize_t v6;
  void *v7;
  void *v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  _BYTE value[766];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (-[BRCRelativePath isFault](self, "isFault")
    || (-[BRCRelativePath filename](self, "filename"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v4 = _CFURLIsPromiseName(),
        v3,
        v4))
  {
    if (!-[BRCRelativePath isFault](self, "isFault"))
    {
      brc_bread_crumbs();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
        -[BRCRelativePath logicalName].cold.2();

    }
    fd = self->_fd;
    if (fd < 0)
    {
      brc_bread_crumbs();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
        -[BRCRelativePath logicalName].cold.1();

      fd = self->_fd;
    }
    v6 = fgetxattr(fd, "com.apple.icloud.itemName", value, 0x2FEuLL, 0, 0);
    if (v6 < 0)
      return (NSString *)0;
    value[v6] = 0;
    objc_msgSend(MEMORY[0x1E0CB3940], "br_pathWithFileSystemRepresentation:", value);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[BRCRelativePath filename](self, "filename");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSString *)v7;
}

- (NSString)symlinkContent
{
  void *v4;
  NSObject *v5;

  if (!-[BRCRelativePath isSymLink](self, "isSymLink"))
  {
    brc_bread_crumbs();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      -[BRCRelativePath symlinkContent].cold.1();

  }
  return self->_symlinkContent;
}

- (unsigned)hardlinkCount
{
  void *v4;
  NSObject *v5;

  if (!-[BRCRelativePath exists](self, "exists"))
  {
    brc_bread_crumbs();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      -[BRCRelativePath pathWithChildAtPath:].cold.2();

  }
  return self->_nlink;
}

- (unint64_t)fileID
{
  void *v4;
  NSObject *v5;

  if (!-[BRCRelativePath exists](self, "exists"))
  {
    brc_bread_crumbs();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      -[BRCRelativePath pathWithChildAtPath:].cold.2();

  }
  return self->_fileID;
}

- (BRFileObjectID)fileObjectID
{
  void *v3;
  void *v5;
  NSObject *v6;

  if (!-[BRCRelativePath exists](self, "exists"))
  {
    brc_bread_crumbs();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      -[BRCRelativePath pathWithChildAtPath:].cold.2();

  }
  if (-[BRCRelativePath isDocument](self, "isDocument"))
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D10E68]), "initWithDocID:", self->_documentID);
  else
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D10E80]), "initWithFileID:", self->_fileID);
  return (BRFileObjectID *)v3;
}

- (unint64_t)parentFileID
{
  void *v4;
  NSObject *v5;

  if (!-[BRCRelativePath isResolved](self, "isResolved"))
  {
    brc_bread_crumbs();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      -[BRCRelativePath type].cold.2();

  }
  return self->_parentFileID;
}

- (BRFileObjectID)parentFileObjectID
{
  return (BRFileObjectID *)(id)objc_msgSend(objc_alloc(MEMORY[0x1E0D10E80]), "initWithFileID:", self->_parentFileID);
}

- (unsigned)documentID
{
  void *v4;
  NSObject *v5;

  if (!-[BRCRelativePath exists](self, "exists"))
  {
    brc_bread_crumbs();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      -[BRCRelativePath pathWithChildAtPath:].cold.2();

  }
  return self->_documentID;
}

- (int)deviceID
{
  void *v4;
  NSObject *v5;

  if (!-[BRCRelativePath isResolved](self, "isResolved"))
  {
    brc_bread_crumbs();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      -[BRCRelativePath type].cold.2();

  }
  return self->_deviceID;
}

- (int64_t)size
{
  void *v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;

  if (!-[BRCRelativePath exists](self, "exists"))
  {
    brc_bread_crumbs();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      -[BRCRelativePath pathWithChildAtPath:].cold.2();

  }
  if (!-[BRCRelativePath isFile](self, "isFile"))
  {
    brc_bread_crumbs();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      -[BRCRelativePath size].cold.1();

  }
  return self->_size;
}

- (int64_t)birthTime
{
  void *v4;
  NSObject *v5;

  if (!-[BRCRelativePath exists](self, "exists"))
  {
    brc_bread_crumbs();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      -[BRCRelativePath pathWithChildAtPath:].cold.2();

  }
  return self->_birthtime.tv_sec;
}

- (int64_t)modificationTime
{
  void *v4;
  NSObject *v5;

  if (!-[BRCRelativePath exists](self, "exists"))
  {
    brc_bread_crumbs();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      -[BRCRelativePath pathWithChildAtPath:].cold.2();

  }
  return self->_mtime.tv_sec;
}

- (unsigned)fsGenerationID
{
  void *v4;
  NSObject *v5;

  if (!-[BRCRelativePath exists](self, "exists"))
  {
    brc_bread_crumbs();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      -[BRCRelativePath pathWithChildAtPath:].cold.2();

  }
  return self->_fsGenerationID;
}

- (BRCGenerationID)generationID
{
  BRCGenerationID *generationID;
  BRCGenerationID *v4;
  BRCGenerationID *v5;
  void *v7;
  NSObject *v8;

  if (!-[BRCRelativePath exists](self, "exists"))
  {
    brc_bread_crumbs();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      -[BRCRelativePath pathWithChildAtPath:].cold.2();

  }
  generationID = self->_generationID;
  if (!generationID)
  {
    v4 = -[BRCGenerationID initWithRelativePath:]([BRCGenerationID alloc], "initWithRelativePath:", self);
    v5 = self->_generationID;
    self->_generationID = v4;

    generationID = self->_generationID;
  }
  return generationID;
}

- (BOOL)isWritable
{
  void *v4;
  NSObject *v5;

  if (!-[BRCRelativePath exists](self, "exists"))
  {
    brc_bread_crumbs();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      -[BRCRelativePath pathWithChildAtPath:].cold.2();

  }
  return (self->_mode >> 7) & 1;
}

- (BOOL)isExecutable
{
  void *v4;
  NSObject *v5;

  if (!-[BRCRelativePath exists](self, "exists"))
  {
    brc_bread_crumbs();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      -[BRCRelativePath pathWithChildAtPath:].cold.2();

  }
  return (self->_mode >> 6) & 1;
}

- (BOOL)isHiddenExtension
{
  void *v4;
  NSObject *v5;

  if (!-[BRCRelativePath exists](self, "exists"))
  {
    brc_bread_crumbs();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      -[BRCRelativePath pathWithChildAtPath:].cold.2();

  }
  return (self->_finderInfo[9] >> 4) & 1;
}

- (BOOL)isHiddenFile
{
  void *v4;
  NSObject *v5;

  if (!-[BRCRelativePath exists](self, "exists"))
  {
    brc_bread_crumbs();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      -[BRCRelativePath pathWithChildAtPath:].cold.2();

  }
  return (self->_finderInfo[8] >> 6) & 1;
}

- (BOOL)isBusy
{
  void *v4;
  NSObject *v5;

  if (!-[BRCRelativePath exists](self, "exists"))
  {
    brc_bread_crumbs();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      -[BRCRelativePath pathWithChildAtPath:].cold.2();

  }
  return (*((unsigned __int8 *)self + 191) >> 6) & 1;
}

- (BOOL)isFileWithFinderInfoAliasBit
{
  _BOOL4 v3;

  v3 = -[BRCRelativePath isFile](self, "isFile");
  if (v3)
    LOBYTE(v3) = *((char *)self + 191) < 0;
  return v3;
}

- (BOOL)isFinderAlias
{
  _BOOL4 v3;

  v3 = -[BRCRelativePath isFileWithFinderInfoAliasBit](self, "isFileWithFinderInfoAliasBit");
  if (v3)
    LOBYTE(v3) = (*((_BYTE *)self + 192) & 1) == 0;
  return v3;
}

- (BOOL)isBRAlias
{
  _BOOL4 v3;

  v3 = -[BRCRelativePath isFileWithFinderInfoAliasBit](self, "isFileWithFinderInfoAliasBit");
  if (v3)
    LOBYTE(v3) = *((_BYTE *)self + 192) & 1;
  return v3;
}

- (unsigned)fileType
{
  void *v4;
  NSObject *v5;

  if (!-[BRCRelativePath exists](self, "exists"))
  {
    brc_bread_crumbs();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      -[BRCRelativePath pathWithChildAtPath:].cold.2();

  }
  return bswap32(*(_DWORD *)self->_finderInfo);
}

- (BOOL)hasFinderTags
{
  void *v4;
  NSObject *v5;

  if (!-[BRCRelativePath exists](self, "exists"))
  {
    brc_bread_crumbs();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      -[BRCRelativePath pathWithChildAtPath:].cold.2();

  }
  return (*((unsigned __int8 *)self + 191) >> 5) & 1;
}

- (int)_resolveBasePath:(BOOL)a3
{
  BRCRelativePath *basePath;
  BRCRelativePath **p_basePath;
  BOOL v6;
  NSString *v7;
  NSString *relativePath;
  BRCRelativePath *v9;
  BOOL v10;
  BRCRelativePath *v11;
  void *v12;
  NSString **p_relativePath;
  void *v14;
  int v15;
  void *v16;
  NSObject *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  NSObject *v21;
  BRCRelativePath *v23;
  BRCRelativePath *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  NSObject *v29;
  BRCRelativePath *v30;
  BRCRelativePath *v31;
  NSString *v32;
  NSString *v33;
  void *v34;
  NSObject *v35;
  void *v36;
  NSObject *v37;
  BRCRelativePath *v38;
  void *v39;
  NSObject *v40;
  void *v41;
  NSObject *v42;
  NSString *v43;
  BRCRelativePath *v44;
  void *v45;
  NSObject *v46;
  void *v47;
  NSObject *v48;
  void *v49;
  NSObject *v50;
  BRCRelativePath *v51;
  int v52;
  uint8_t buf[4];
  BRCRelativePath *v54;
  __int16 v55;
  _BYTE v56[18];
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  if ((self->_fd & 0x80000000) == 0)
  {
    brc_bread_crumbs();
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v46 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_FAULT))
      -[BRCRelativePath _resolveBasePath:].cold.9();

  }
  p_basePath = &self->_basePath;
  basePath = self->_basePath;
  if (basePath)
  {
    v52 = 0;
    goto LABEL_4;
  }
  brc_bread_crumbs();
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v48 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v48, OS_LOG_TYPE_FAULT))
    -[BRCRelativePath _resolveBasePath:].cold.8();

  basePath = *p_basePath;
  v52 = 0;
  if (basePath)
  {
LABEL_4:
    while (basePath->_fd < 0)
    {
      v6 = -[BRCRelativePath isRoot](basePath, "isRoot", a3);
      basePath = *p_basePath;
      if (v6)
        break;
      if (-[BRCRelativePath isPackageRoot](basePath, "isPackageRoot"))
      {
        basePath = *p_basePath;
        break;
      }
      if (self->_relativePath)
      {
        -[NSString stringByAppendingPathComponent:](self->_basePath->_relativePath, "stringByAppendingPathComponent:");
        v7 = (NSString *)objc_claimAutoreleasedReturnValue();
        relativePath = self->_relativePath;
        self->_relativePath = v7;

      }
      objc_storeStrong((id *)&self->_basePath, (*p_basePath)->_basePath);
      basePath = *p_basePath;
    }
    if (-[BRCRelativePath resolveAndKeepOpenMustExist:error:](basePath, "resolveAndKeepOpenMustExist:error:", 1, &v52))
    {
      v9 = *p_basePath;
      if ((*p_basePath)->_fd < 0)
      {
        -[BRCRelativePath close](v9, "close");
        brc_bread_crumbs();
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
          -[BRCRelativePath _resolveBasePath:].cold.2();

        return 2;
      }
      else
      {
        v10 = -[BRCRelativePath isUnixDir](v9, "isUnixDir");
        v11 = *p_basePath;
        if (v10)
        {
          -[BRCRelativePath absolutePath](v11, "absolutePath");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          p_relativePath = &self->_relativePath;
          objc_msgSend(v12, "stringByAppendingPathComponent:", self->_relativePath);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (!objc_msgSend(v14, "br_isInPackage")
            || -[BRCRelativePath isPackageRoot](*p_basePath, "isPackageRoot")
            || -[BRCRelativePath isInPackage](*p_basePath, "isInPackage"))
          {
            v15 = 0;
          }
          else
          {
            v24 = *p_basePath;
            objc_msgSend(v14, "br_pathOfPackageRoot");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v12, "isEqualToString:", v25))
            {
              brc_bread_crumbs();
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              brc_default_log();
              v27 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v27, (os_log_type_t)0x90u))
                -[BRCRelativePath _resolveBasePath:].cold.4();

              brc_bread_crumbs();
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              brc_default_log();
              v29 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT))
                -[BRCRelativePath _resolveBasePath:].cold.3();

              v15 = 62;
            }
            else
            {
              v30 = -[BRCRelativePath initWithAbsolutePath:session:]([BRCRelativePath alloc], "initWithAbsolutePath:session:", v25, self->_session);
              v31 = self->_basePath;
              self->_basePath = v30;

              objc_msgSend(v14, "br_pathRelativeToPackageRoot");
              v32 = (NSString *)objc_claimAutoreleasedReturnValue();
              v33 = self->_relativePath;
              self->_relativePath = v32;

              -[BRCRelativePath resolveAndKeepOpenMustExist:error:](self->_basePath, "resolveAndKeepOpenMustExist:error:", 1, &v52);
              brc_bread_crumbs();
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              brc_default_log();
              v35 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
              {
                v43 = *p_relativePath;
                v44 = *p_basePath;
                *(_DWORD *)buf = 138412802;
                v54 = (BRCRelativePath *)v43;
                v55 = 2112;
                *(_QWORD *)v56 = v44;
                *(_WORD *)&v56[8] = 2112;
                *(_QWORD *)&v56[10] = v34;
                _os_log_debug_impl(&dword_1CBD43000, v35, OS_LOG_TYPE_DEBUG, "[DEBUG] new base for '%@' - %@%@", buf, 0x20u);
              }

              -[BRCRelativePath close](v24, "close");
              if (v52)
              {
                brc_bread_crumbs();
                v36 = (void *)objc_claimAutoreleasedReturnValue();
                brc_default_log();
                v37 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
                {
                  v51 = *p_basePath;
                  *(_DWORD *)buf = 138412802;
                  v54 = v51;
                  v55 = 1024;
                  *(_DWORD *)v56 = v52;
                  *(_WORD *)&v56[4] = 2112;
                  *(_QWORD *)&v56[6] = v36;
                  _os_log_debug_impl(&dword_1CBD43000, v37, OS_LOG_TYPE_DEBUG, "[DEBUG] can't resolve package root %@ %{errno}d%@", buf, 0x1Cu);
                }

                v15 = v52;
              }
              else
              {
                v38 = *p_basePath;
                if ((*p_basePath)->_fd < 0)
                {
                  -[BRCRelativePath close](v38, "close");
                  brc_bread_crumbs();
                  v39 = (void *)objc_claimAutoreleasedReturnValue();
                  brc_default_log();
                  v40 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
                    -[BRCRelativePath _resolveBasePath:].cold.5();

                  v15 = 2;
                }
                else if (-[BRCRelativePath isUnixDir](v38, "isUnixDir"))
                {
                  v15 = 0;
                }
                else
                {
                  -[BRCRelativePath close](*p_basePath, "close");
                  brc_bread_crumbs();
                  v41 = (void *)objc_claimAutoreleasedReturnValue();
                  brc_default_log();
                  v42 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
                    -[BRCRelativePath _resolveBasePath:].cold.6();

                  v15 = 20;
                }
              }
            }

          }
        }
        else
        {
          -[BRCRelativePath close](v11, "close");
          brc_bread_crumbs();
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v21 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
            -[BRCRelativePath _resolveBasePath:].cold.7();

          return 20;
        }
      }
    }
    else
    {
      brc_bread_crumbs();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        v23 = *p_basePath;
        *(_DWORD *)buf = 138412802;
        v54 = v23;
        v55 = 1024;
        *(_DWORD *)v56 = v52;
        *(_WORD *)&v56[4] = 2112;
        *(_QWORD *)&v56[6] = v16;
        _os_log_debug_impl(&dword_1CBD43000, v17, OS_LOG_TYPE_DEBUG, "[DEBUG] can't resolve base path %@ %{errno}d%@", buf, 0x1Cu);
      }

      return v52;
    }
  }
  else
  {
    brc_bread_crumbs();
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v50 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v50, (os_log_type_t)0x90u))
      -[BRCRelativePath _resolveBasePath:].cold.1();

    return 22;
  }
  return v15;
}

- (int)_resolvePathTypeAndContainer
{
  void *v3;
  id v4;
  BRCAccountSession *session;
  int v6;
  void *v8;
  NSObject *v9;
  id v10;

  v10 = 0;
  if (-[BRCRelativePath isInPackage](self, "isInPackage"))
  {
    -[BRCRelativePath pathOfPackageRoot](self, "pathOfPackageRoot");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    self->_type = objc_msgSend(v3, "type");
    self->_itemScope = objc_msgSend(v3, "itemScope");
    objc_msgSend(v3, "appLibrary");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    v10 = v4;

LABEL_6:
    -[BRCRelativePath setAppLibrary:](self, "setAppLibrary:", v4);
    v6 = 0;
    goto LABEL_7;
  }
  session = self->_session;
  if (!session)
  {
    brc_bread_crumbs();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      -[BRCRelativePath _initWithPath:relativeToRoot:].cold.1();

    session = self->_session;
  }
  v6 = -[BRCAccountSession resolvePathAdditionalMetadata:appLibrary:](session, "resolvePathAdditionalMetadata:appLibrary:", self, &v10);
  if (!v6)
  {
    v4 = v10;
    goto LABEL_6;
  }
LABEL_7:

  return v6;
}

- (BOOL)_resolveRootWhenExists:(BOOL)a3
{
  _BOOL4 v3;
  BOOL v5;
  id *p_basePath;
  NSString *absolutePath;
  NSString *v8;
  NSString *v9;
  NSSet *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  NSObject *v25;
  id v26;
  void *v27;
  NSObject *v28;
  NSString *v30;
  NSSet *roots;
  NSString *v32;
  NSString *v33;
  void *v34;
  NSObject *v35;
  void *v36;
  NSObject *v37;
  int v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint8_t buf[4];
  NSString *v44;
  __int16 v45;
  _BYTE v46[18];
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  if (!self->_roots)
    return 1;
  v3 = a3;
  if (-[BRCRelativePath isResolved](self, "isResolved"))
    return 1;
  if (self->_relativePath)
  {
    brc_bread_crumbs();
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_FAULT))
      -[BRCRelativePath _resolveRootWhenExists:].cold.4();

  }
  p_basePath = (id *)&self->_basePath;
  if (self->_basePath)
  {
    brc_bread_crumbs();
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_FAULT))
      -[BRCRelativePath _resolveRootWhenExists:].cold.3();

  }
  absolutePath = self->_absolutePath;
  if (v3)
  {
    v8 = absolutePath;
  }
  else
  {
    -[NSString br_realpath](absolutePath, "br_realpath");
    v8 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v10 = self->_roots;
  v11 = -[NSSet countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v40;
    while (2)
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v40 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
        objc_msgSend(v15, "absolutePath");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSString br_pathRelativeToPath:](v9, "br_pathRelativeToPath:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        if (v17)
        {
          objc_storeStrong((id *)&self->_basePath, v15);
          v38 = 0;
          if (-[BRCRelativePath _shouldKeepBasePathOpenWithoutOpenedFD](self, "_shouldKeepBasePathOpenWithoutOpenedFD")
            && (objc_msgSend(*p_basePath, "resolveAndKeepOpenMustExist:error:", 1, &v38) & 1) == 0)
          {
            brc_bread_crumbs();
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            brc_default_log();
            v19 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
            {
              v33 = (NSString *)*p_basePath;
              *(_DWORD *)buf = 138412802;
              v44 = v33;
              v45 = 1024;
              *(_DWORD *)v46 = v38;
              *(_WORD *)&v46[4] = 2112;
              *(_QWORD *)&v46[6] = v18;
              _os_log_debug_impl(&dword_1CBD43000, v19, OS_LOG_TYPE_DEBUG, "[DEBUG] can't open %@' %{errno}d%@", buf, 0x1Cu);
            }

            brc_bread_crumbs();
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            brc_default_log();
            v21 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
              -[BRCRelativePath _resolveRootWhenExists:].cold.1();

          }
          if ((objc_msgSend(*p_basePath, "resolveAndKeepOpenMustExist:error:", 1, &v38) & 1) == 0)
          {
            brc_bread_crumbs();
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            brc_default_log();
            v23 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
            {
              v32 = (NSString *)*p_basePath;
              *(_DWORD *)buf = 138412802;
              v44 = v32;
              v45 = 1024;
              *(_DWORD *)v46 = v38;
              *(_WORD *)&v46[4] = 2112;
              *(_QWORD *)&v46[6] = v22;
              _os_log_debug_impl(&dword_1CBD43000, v23, OS_LOG_TYPE_DEBUG, "[DEBUG] can't open %@' %{errno}d%@", buf, 0x1Cu);
            }

            brc_bread_crumbs();
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            brc_default_log();
            v25 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
              -[BRCRelativePath _resolveRootWhenExists:].cold.1();

          }
          goto LABEL_31;
        }
      }
      v12 = -[NSSet countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
      if (v12)
        continue;
      break;
    }
  }
LABEL_31:

  v26 = *p_basePath;
  v5 = *p_basePath != 0;
  if (!v26)
  {
    brc_bread_crumbs();
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
    {
      roots = self->_roots;
      v30 = self->_absolutePath;
      *(_DWORD *)buf = 138412802;
      v44 = v30;
      v45 = 2112;
      *(_QWORD *)v46 = roots;
      *(_WORD *)&v46[8] = 2112;
      *(_QWORD *)&v46[10] = v27;
      _os_log_debug_impl(&dword_1CBD43000, v28, OS_LOG_TYPE_DEBUG, "[DEBUG] resolved-path:'%@' outside of requested roots:'%@'%@", buf, 0x20u);
    }

  }
  return v5;
}

- (BOOL)_fixupRelativePath
{
  id *p_relativePath;
  NSString *relativePath;
  NSString *v5;
  BRCRelativePath *basePath;
  NSString *absolutePath;
  id v8;
  NSString *v9;
  NSString *v10;
  void *v11;
  NSObject *v12;
  NSString *v13;
  void *v14;
  BOOL v15;
  int v17;
  NSString *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  p_relativePath = (id *)&self->_relativePath;
  relativePath = self->_relativePath;
  if (!relativePath)
    relativePath = self->_absolutePath;
  v5 = relativePath;
  basePath = self->_basePath;
  if (basePath)
  {
    absolutePath = self->_absolutePath;
    -[BRCRelativePath absolutePath](basePath, "absolutePath");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    -[NSString br_pathRelativeToPath:](absolutePath, "br_pathRelativeToPath:", v8);
    v9 = (NSString *)objc_claimAutoreleasedReturnValue();
    v10 = self->_relativePath;
    self->_relativePath = v9;

  }
  else
  {
    v8 = *p_relativePath;
    *p_relativePath = &stru_1E8769030;
  }

  if (*p_relativePath)
    goto LABEL_12;
  brc_bread_crumbs();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = self->_absolutePath;
    -[BRCRelativePath absolutePath](self->_basePath, "absolutePath");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 138412802;
    v18 = v13;
    v19 = 2112;
    v20 = v14;
    v21 = 2112;
    v22 = v11;
    _os_log_impl(&dword_1CBD43000, v12, OS_LOG_TYPE_DEFAULT, "[NOTICE] resolved-path:'%@' outside of base path:'%@'%@", (uint8_t *)&v17, 0x20u);

  }
  if ((-[NSString br_isAbsolutePath](v5, "br_isAbsolutePath") & 1) == 0)
  {
    objc_storeStrong(p_relativePath, relativePath);
LABEL_12:
    v15 = 1;
    goto LABEL_13;
  }
  v15 = 0;
LABEL_13:

  return v15;
}

- (int)_resolveWhenExists
{
  int fd;
  int v4;
  void *v5;
  NSObject *v6;
  int v7;
  char *v8;
  int v9;
  BRCRelativePath *basePath;
  NSString *v11;
  int v12;
  NSString *v13;
  int v14;
  void *v15;
  NSObject *v16;
  int result;
  void *v18;
  NSObject *v19;
  const char *v20;
  unsigned __int16 v21;
  int busy;
  __int16 v23;
  time_t v24;
  time_t v25;
  timespec v26;
  unint64_t v27;
  int64_t v28;
  BOOL v29;
  unsigned int v30;
  NSString *v31;
  NSString *v32;
  __int128 v33;
  unsigned int v34;
  char v35;
  BRCRelativePath *v36;
  int v37;
  int v38;
  void *v39;
  NSObject *v40;
  int v41;
  void *v42;
  NSObject *v43;
  void *v44;
  NSObject *v45;
  int v46;
  int v47;
  int v48;
  NSString *relativePath;
  NSString *absolutePath;
  int v51;
  int v52;
  int v53;
  int v54;
  int v55;
  int v56;
  int v57;
  int v58;
  int v59;
  int v60;
  const char *v61;
  void *v62;
  NSObject *v63;
  BRCBookmark *v64;
  BRCBookmark *bookmark;
  void *v66;
  NSObject *v67;
  int v68;
  __int128 v69;
  uint64_t v70;
  uint8_t buf[4];
  _BYTE v72[40];
  __int16 v73;
  _BYTE v74[10];
  __int16 v75;
  int v76;
  __int16 v77;
  BRCRelativePath *v78;
  __int16 v79;
  void *v80;
  _OWORD v81[5];
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  uint64_t v109;

  v109 = *MEMORY[0x1E0C80C00];
  fd = self->_fd;
  if (fd < 0)
  {
    brc_bread_crumbs();
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v67 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v67, OS_LOG_TYPE_FAULT))
      -[BRCRelativePath logicalName].cold.1();

    fd = self->_fd;
  }
  v69 = xmmword_1CC066D58;
  v70 = 513;
  v107 = 0u;
  v108 = 0u;
  v105 = 0u;
  v106 = 0u;
  v103 = 0u;
  v104 = 0u;
  v101 = 0u;
  v102 = 0u;
  v99 = 0u;
  v100 = 0u;
  v97 = 0u;
  v98 = 0u;
  v95 = 0u;
  v96 = 0u;
  v93 = 0u;
  v94 = 0u;
  v91 = 0u;
  v92 = 0u;
  v89 = 0u;
  v90 = 0u;
  v87 = 0u;
  v88 = 0u;
  v85 = 0u;
  v86 = 0u;
  v83 = 0u;
  v84 = 0u;
  v82 = 0u;
  memset(v81, 0, sizeof(v81));
  if (fgetattrlist(fd, &v69, v81, 0x47CuLL, 0x20u) < 0)
  {
    v14 = *__error();
    brc_bread_crumbs();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, (os_log_type_t)0x90u))
    {
      v48 = self->_fd;
      relativePath = self->_relativePath;
      if (!relativePath)
        relativePath = self->_absolutePath;
      *(_DWORD *)buf = 67109890;
      *(_DWORD *)v72 = v48;
      *(_WORD *)&v72[4] = 2112;
      *(_QWORD *)&v72[6] = relativePath;
      *(_WORD *)&v72[14] = 1024;
      *(_DWORD *)&v72[16] = v14;
      *(_WORD *)&v72[20] = 2112;
      *(_QWORD *)&v72[22] = v15;
      _os_log_error_impl(&dword_1CBD43000, v16, (os_log_type_t)0x90u, "[ERROR] fgetattrlist(%d) at '%@' failed %{errno}d%@", buf, 0x22u);
    }

    *__error() = v14;
    return *__error();
  }
  else
  {
    v4 = WORD4(v81[4]) & 0xF000;
    if (v4 != 0x4000 && v4 != 0x8000 && v4 != 40960)
    {
      brc_bread_crumbs();
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v40 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
      {
        v51 = aPcDBLSW[WORD4(v81[4]) >> 12];
        *(_DWORD *)buf = 67111938;
        if ((WORD4(v81[4]) & 0x100) != 0)
          v52 = 114;
        else
          v52 = 45;
        *(_DWORD *)v72 = v51;
        *(_WORD *)&v72[4] = 1024;
        if ((BYTE8(v81[4]) & 0x80) != 0)
          v53 = 119;
        else
          v53 = 45;
        *(_DWORD *)&v72[6] = v52;
        *(_WORD *)&v72[10] = 1024;
        if ((BYTE8(v81[4]) & 0x40) != 0)
          v54 = 120;
        else
          v54 = 45;
        *(_DWORD *)&v72[12] = v53;
        if ((BYTE8(v81[4]) & 0x20) != 0)
          v55 = 114;
        else
          v55 = 45;
        *(_WORD *)&v72[16] = 1024;
        if ((BYTE8(v81[4]) & 0x10) != 0)
          v56 = 119;
        else
          v56 = 45;
        *(_DWORD *)&v72[18] = v54;
        if ((BYTE8(v81[4]) & 8) != 0)
          v57 = 120;
        else
          v57 = 45;
        *(_WORD *)&v72[22] = 1024;
        if ((BYTE8(v81[4]) & 4) != 0)
          v58 = 114;
        else
          v58 = 45;
        *(_DWORD *)&v72[24] = v55;
        if ((BYTE8(v81[4]) & 2) != 0)
          v59 = 119;
        else
          v59 = 45;
        *(_WORD *)&v72[28] = 1024;
        if ((BYTE8(v81[4]) & 1) != 0)
          v60 = 120;
        else
          v60 = 45;
        *(_DWORD *)&v72[30] = v56;
        *(_WORD *)&v72[34] = 1024;
        *(_DWORD *)&v72[36] = v57;
        v73 = 1024;
        *(_DWORD *)v74 = v58;
        *(_WORD *)&v74[4] = 1024;
        *(_DWORD *)&v74[6] = v59;
        v75 = 1024;
        v76 = v60;
        v77 = 2112;
        v78 = self;
        v79 = 2112;
        v80 = v39;
        _os_log_debug_impl(&dword_1CBD43000, v40, OS_LOG_TYPE_DEBUG, "[DEBUG] Inappropriate file type %c%c%c%c%c%c%c%c%c%c for %@%@", buf, 0x52u);
      }

      goto LABEL_41;
    }
    if (v4 != 40960 && !(_DWORD)v82 || BRCIsBusyDate(*((uint64_t *)&v81[0] + 1)))
    {
      brc_bread_crumbs();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        absolutePath = self->_relativePath;
        if (!absolutePath)
          absolutePath = self->_absolutePath;
        *(_DWORD *)buf = 138413570;
        *(_QWORD *)v72 = absolutePath;
        *(_WORD *)&v72[8] = 2048;
        *(_QWORD *)&v72[10] = *((_QWORD *)&v82 + 1);
        *(_WORD *)&v72[18] = 1024;
        *(_DWORD *)&v72[20] = DWORD1(v82);
        *(_WORD *)&v72[24] = 1024;
        *(_DWORD *)&v72[26] = v82;
        *(_WORD *)&v72[30] = 2048;
        *(_QWORD *)&v72[32] = *((_QWORD *)&v81[0] + 1);
        v73 = 2112;
        *(_QWORD *)v74 = v5;
        _os_log_debug_impl(&dword_1CBD43000, v6, OS_LOG_TYPE_DEBUG, "[DEBUG] Busy file at '%@' fileID:%llu docID:%u gen:%u bt:%llu%@", buf, 0x36u);
      }

      *((_BYTE *)self + 191) |= 0x40u;
    }
    v7 = BRCIsLegacyUbiquityFault(self->_fd, SBYTE12(v81[4]), SWORD4(v81[4]), (_DWORD *)&v81[2] + 2);
    v8 = (char *)&v83 + SDWORD2(v83) + 8;
    if (v7)
    {
      v9 = v7;
      basePath = self->_basePath;
      if (basePath && (v11 = self->_relativePath) != 0)
      {
        v12 = basePath->_fd;
        v13 = v11;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "br_pathWithFileSystemRepresentation:", (char *)&v83 + SDWORD2(v83) + 8);
        v13 = (NSString *)objc_claimAutoreleasedReturnValue();
        v12 = -1;
      }
      if ((BRCUnlinkAt(v12, v13, ((WORD4(v81[4]) & 0xF000) == 0x4000) << 7) & 0x80000000) != 0)
      {
        v41 = *__error();
        brc_bread_crumbs();
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v43 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v43, (os_log_type_t)0x90u))
        {
          v61 = "UF_COMPRESSED";
          *(_DWORD *)buf = 136315906;
          if (v9 == 2)
            v61 = "brok";
          *(_QWORD *)v72 = v61;
          *(_WORD *)&v72[8] = 2080;
          *(_QWORD *)&v72[10] = v8;
          *(_WORD *)&v72[18] = 1024;
          *(_DWORD *)&v72[20] = v41;
          *(_WORD *)&v72[24] = 2112;
          *(_QWORD *)&v72[26] = v42;
          _os_log_error_impl(&dword_1CBD43000, v43, (os_log_type_t)0x90u, "[ERROR] failed to unlink legacy ubiquity %s fault at '%s' %{errno}d%@", buf, 0x26u);
        }

        *__error() = v41;
      }
      else
      {
        brc_bread_crumbs();
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          v20 = "UF_COMPRESSED";
          *(_DWORD *)buf = 136315650;
          if (v9 == 2)
            v20 = "brok";
          *(_QWORD *)v72 = v20;
          *(_WORD *)&v72[8] = 2080;
          *(_QWORD *)&v72[10] = v8;
          *(_WORD *)&v72[18] = 2112;
          *(_QWORD *)&v72[20] = v18;
          _os_log_impl(&dword_1CBD43000, v19, OS_LOG_TYPE_DEFAULT, "[NOTICE] cleaned up legacy ubiquity %s fault at '%s'%@", buf, 0x20u);
        }

      }
      return 14;
    }
    self->_deviceID = DWORD1(v81[0]);
    self->_fileID = *((_QWORD *)&v82 + 1);
    v21 = WORD4(v81[4]);
    self->_flags = HIDWORD(v81[4]);
    *(int32x2_t *)&self->_documentID = vrev64_s32(*(int32x2_t *)&v82);
    self->_mode = v21;
    busy = BRCIsBusyDate(*((uint64_t *)&v81[0] + 1));
    v23 = WORD4(v81[4]);
    if (busy && (WORD4(v81[4]) & 0xF000) == 0x4000 && (*((_BYTE *)self + 191) & 0xA) == 0)
    {
      v24 = time(0);
      v25 = *((_QWORD *)&v81[1] + 1);
      if (v24 < *((uint64_t *)&v81[1] + 1))
        v25 = time(0);
      *((_QWORD *)&v81[0] + 1) = v25;
      v23 = WORD4(v81[4]);
    }
    v26 = *(timespec *)((char *)&v81[1] + 8);
    self->_birthtime = *(timespec *)((char *)v81 + 8);
    self->_mtime = v26;
    v27 = v83;
    v28 = *(_QWORD *)((char *)&v84 + 4);
    v29 = (v23 & 0xF000) == 0x8000;
    v30 = v84;
    if (!v29)
    {
      v28 = 0;
      v30 = 1;
    }
    self->_size = v28;
    self->_parentFileID = v27;
    self->_nlink = v30;
    objc_msgSend(MEMORY[0x1E0CB3940], "br_pathWithFileSystemRepresentation:", v8);
    v31 = (NSString *)objc_claimAutoreleasedReturnValue();
    v32 = self->_absolutePath;
    self->_absolutePath = v31;

    v33 = *(_OWORD *)((char *)&v81[3] + 8);
    *(_OWORD *)self->_finderInfo = *(_OWORD *)((char *)&v81[2] + 8);
    *(_OWORD *)&self->_finderInfo[16] = v33;
    v34 = LOBYTE(v81[3]);
    v35 = v81[3] & 0x80 | *((_BYTE *)self + 191) & 0x7F;
    *((_BYTE *)self + 191) = v35;
    if ((WORD4(v81[4]) & 0xF000) == 0x4000)
      *((_BYTE *)self + 191) = v35 & 0xFB | (v34 >> 3) & 4;
    if (!-[BRCRelativePath _resolveRootWhenExists:](self, "_resolveRootWhenExists:", 1))
      goto LABEL_41;
    v36 = self->_basePath;
    if (v36 && (v37 = DWORD1(v81[0]), v37 != -[BRCRelativePath deviceID](v36, "deviceID")))
    {
      brc_bread_crumbs();
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v45 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
      {
        v46 = -[BRCRelativePath deviceID](self->_basePath, "deviceID");
        *(_DWORD *)buf = 67109890;
        *(_DWORD *)v72 = v46;
        *(_WORD *)&v72[4] = 1024;
        *(_DWORD *)&v72[6] = DWORD1(v81[0]);
        *(_WORD *)&v72[10] = 2112;
        *(_QWORD *)&v72[12] = self;
        *(_WORD *)&v72[20] = 2112;
        *(_QWORD *)&v72[22] = v44;
        _os_log_impl(&dword_1CBD43000, v45, OS_LOG_TYPE_DEFAULT, "[NOTICE] root-dev:%d != dev:%d %@%@", buf, 0x22u);
      }

      return 18;
    }
    else
    {
      if ((BYTE1(v81[3]) & 0xE) != 0)
        LOBYTE(v38) = *((_BYTE *)self + 191) | 0x20;
      else
        v38 = *((_BYTE *)self + 191) & 0xDF | (32
                                             * (fgetxattr(self->_fd, "com.apple.metadata:_kMDItemUserTags", 0, 0, 0, 0) > 0));
      *((_BYTE *)self + 191) = v38;
      if (!-[BRCRelativePath _fixupRelativePath](self, "_fixupRelativePath"))
        return 33;
      result = -[BRCRelativePath _resolvePathTypeAndContainer](self, "_resolvePathTypeAndContainer");
      if (!result)
      {
        v47 = *((char *)self + 191);
        if ((v47 & 0x80000000) == 0)
          return 0;
        if ((v47 & 2) != 0)
        {
          brc_bread_crumbs();
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v63 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v63, OS_LOG_TYPE_DEBUG))
            -[BRCRelativePath _resolveWhenExists].cold.2();
          goto LABEL_98;
        }
        if ((WORD4(v81[4]) & 0xF000) == 0x4000)
        {
          brc_bread_crumbs();
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v63 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v63, OS_LOG_TYPE_DEBUG))
            -[BRCRelativePath _resolveWhenExists].cold.1();
LABEL_98:

          goto LABEL_41;
        }
        if (fgetxattr(self->_fd, "com.apple.clouddocs.security", 0, 0, 0, 0) == -1)
        {
          if (*__error() == 93)
          {
            result = 0;
            *((_BYTE *)self + 192) &= ~1u;
            return result;
          }
          brc_bread_crumbs();
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v63 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
          {
            v68 = *__error();
            *(_DWORD *)buf = 136315650;
            *(_QWORD *)v72 = v8;
            *(_WORD *)&v72[8] = 1024;
            *(_DWORD *)&v72[10] = v68;
            *(_WORD *)&v72[14] = 2112;
            *(_QWORD *)&v72[16] = v62;
            _os_log_impl(&dword_1CBD43000, v63, OS_LOG_TYPE_DEFAULT, "[WARNING] Can't read xattr at '%s' %{errno}d%@", buf, 0x1Cu);
          }
          goto LABEL_98;
        }
        *((_BYTE *)self + 192) |= 1u;
        v64 = -[BRCBookmark initWithRelpath:]([BRCBookmark alloc], "initWithRelpath:", self);
        bookmark = self->_bookmark;
        self->_bookmark = v64;

        if (self->_bookmark)
          return 0;
LABEL_41:
        *((_BYTE *)self + 191) |= 1u;
        return 45;
      }
    }
  }
  return result;
}

- (int)_resolveWhenDoesntExist
{
  BRCRelativePath *basePath;
  NSString *absolutePath;
  NSString **p_absolutePath;
  void *v6;
  void *v7;
  BRCRelativePath *v8;
  int v9;
  NSString *v10;
  NSString *v11;
  int v12;
  int fd;
  id v14;
  void *v15;
  NSObject *v16;
  int v17;
  uint64_t v18;
  char *v19;
  const char *v20;
  NSObject *v21;
  uint32_t v22;
  id v23;
  void *v24;
  NSString *v25;
  NSString *v26;
  uint64_t v28;
  char *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  NSObject *v33;
  __int128 v34;
  uint64_t v35;
  uint8_t buf[4];
  _BYTE v37[24];
  __int16 v38;
  _QWORD v39[2];
  _OWORD v40[2];
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  uint64_t v71;

  v71 = *MEMORY[0x1E0C80C00];
  if ((self->_fd & 0x80000000) == 0)
  {
    brc_bread_crumbs();
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_FAULT))
      -[BRCRelativePath _resolveBasePath:].cold.9();

  }
  basePath = self->_basePath;
  if (basePath && basePath->_fd < 0)
  {
    brc_bread_crumbs();
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_FAULT))
      -[BRCRelativePath _resolveWhenDoesntExist].cold.2();

  }
  if (-[BRCRelativePath _resolveRootWhenExists:](self, "_resolveRootWhenExists:", 0))
  {
    if (!self->_basePath || (p_absolutePath = &self->_relativePath, (absolutePath = self->_relativePath) == 0))
    {
      p_absolutePath = &self->_absolutePath;
      absolutePath = self->_absolutePath;
    }
    -[NSString stringByDeletingLastPathComponent](absolutePath, "stringByDeletingLastPathComponent");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSString lastPathComponent](*p_absolutePath, "lastPathComponent");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = self->_basePath;
    if (!v8)
    {
      v35 = 0;
      v34 = xmmword_1CC066D70;
      v69 = 0u;
      v70 = 0u;
      v67 = 0u;
      v68 = 0u;
      v65 = 0u;
      v66 = 0u;
      v63 = 0u;
      v64 = 0u;
      v61 = 0u;
      v62 = 0u;
      v59 = 0u;
      v60 = 0u;
      v57 = 0u;
      v58 = 0u;
      v55 = 0u;
      v56 = 0u;
      v53 = 0u;
      v54 = 0u;
      v51 = 0u;
      v52 = 0u;
      v49 = 0u;
      v50 = 0u;
      v47 = 0u;
      v48 = 0u;
      v45 = 0u;
      v46 = 0u;
      v43 = 0u;
      v44 = 0u;
      v41 = 0u;
      v42 = 0u;
      memset(v40, 0, sizeof(v40));
      goto LABEL_20;
    }
    if (self->_relativePath)
    {
      v9 = objc_msgSend(v6, "isEqualToString:", &stru_1E8769030);
      v8 = self->_basePath;
      if (v9)
      {
        self->_parentFileID = v8->_fileID;
        self->_deviceID = v8->_deviceID;
        -[NSString stringByAppendingPathComponent:](v8->_absolutePath, "stringByAppendingPathComponent:", self->_relativePath);
        v10 = (NSString *)objc_claimAutoreleasedReturnValue();
        v11 = self->_absolutePath;
        self->_absolutePath = v10;

        goto LABEL_23;
      }
      v35 = 0;
      v34 = xmmword_1CC066D70;
      v69 = 0u;
      v70 = 0u;
      v67 = 0u;
      v68 = 0u;
      v65 = 0u;
      v66 = 0u;
      v63 = 0u;
      v64 = 0u;
      v61 = 0u;
      v62 = 0u;
      v59 = 0u;
      v60 = 0u;
      v57 = 0u;
      v58 = 0u;
      v55 = 0u;
      v56 = 0u;
      v53 = 0u;
      v54 = 0u;
      v51 = 0u;
      v52 = 0u;
      v49 = 0u;
      v50 = 0u;
      v47 = 0u;
      v48 = 0u;
      v45 = 0u;
      v46 = 0u;
      v43 = 0u;
      v44 = 0u;
      v41 = 0u;
      v42 = 0u;
      memset(v40, 0, sizeof(v40));
      if (!v8)
        goto LABEL_20;
    }
    else
    {
      v35 = 0;
      v34 = xmmword_1CC066D70;
      v69 = 0u;
      v70 = 0u;
      v67 = 0u;
      v68 = 0u;
      v65 = 0u;
      v66 = 0u;
      v63 = 0u;
      v64 = 0u;
      v61 = 0u;
      v62 = 0u;
      v59 = 0u;
      v60 = 0u;
      v57 = 0u;
      v58 = 0u;
      v55 = 0u;
      v56 = 0u;
      v53 = 0u;
      v54 = 0u;
      v51 = 0u;
      v52 = 0u;
      v49 = 0u;
      v50 = 0u;
      v47 = 0u;
      v48 = 0u;
      v45 = 0u;
      v46 = 0u;
      v43 = 0u;
      v44 = 0u;
      v41 = 0u;
      v42 = 0u;
      memset(v40, 0, sizeof(v40));
    }
    if (self->_relativePath)
    {
      fd = v8->_fd;
      v14 = objc_retainAutorelease(v6);
      if (getattrlistat(fd, (const char *)objc_msgSend(v14, "br_fileSystemRepresentation", v34, v35), &v34, v40, 0x41CuLL, 0x21uLL) < 0)
      {
        v12 = *__error();
        brc_bread_crumbs();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        {
          v17 = self->_basePath->_fd;
          v18 = objc_msgSend(objc_retainAutorelease(v14), "br_fileSystemRepresentation");
          v19 = strerror(v12);
          *(_DWORD *)buf = 67110146;
          *(_DWORD *)v37 = v17;
          *(_WORD *)&v37[4] = 2080;
          *(_QWORD *)&v37[6] = v18;
          *(_WORD *)&v37[14] = 2080;
          *(_QWORD *)&v37[16] = v19;
          v38 = 1024;
          LODWORD(v39[0]) = v12;
          WORD2(v39[0]) = 2112;
          *(_QWORD *)((char *)v39 + 6) = v15;
          v20 = "[DEBUG] getattrlistat(%d, %s) failed with %s(%d)%@";
          v21 = v16;
          v22 = 44;
LABEL_34:
          _os_log_debug_impl(&dword_1CBD43000, v21, OS_LOG_TYPE_DEBUG, v20, buf, v22);
          goto LABEL_30;
        }
        goto LABEL_30;
      }
      goto LABEL_21;
    }
LABEL_20:
    v23 = objc_retainAutorelease(v6);
    if (getattrlist((const char *)objc_msgSend(v23, "fileSystemRepresentation", v34, v35), &v34, v40, 0x41CuLL, 0x21u) < 0)
    {
      v12 = *__error();
      brc_bread_crumbs();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        v28 = objc_msgSend(objc_retainAutorelease(v23), "fileSystemRepresentation");
        v29 = strerror(v12);
        *(_DWORD *)buf = 136315906;
        *(_QWORD *)v37 = v28;
        *(_WORD *)&v37[8] = 2080;
        *(_QWORD *)&v37[10] = v29;
        *(_WORD *)&v37[18] = 1024;
        *(_DWORD *)&v37[20] = v12;
        v38 = 2112;
        v39[0] = v15;
        v20 = "[DEBUG] getattrlist(%s) failed with %s(%d)%@";
        v21 = v16;
        v22 = 38;
        goto LABEL_34;
      }
LABEL_30:

LABEL_31:
      return v12;
    }
LABEL_21:
    if (DWORD2(v40[0]) == 2)
    {
      self->_parentFileID = *(_QWORD *)((char *)v40 + 12);
      self->_deviceID = DWORD1(v40[0]);
      objc_msgSend(MEMORY[0x1E0CB3940], "br_pathWithFileSystemRepresentation:", (char *)&v40[1] + SDWORD1(v40[1]) + 4);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "stringByAppendingPathComponent:", v7);
      v25 = (NSString *)objc_claimAutoreleasedReturnValue();
      v26 = self->_absolutePath;
      self->_absolutePath = v25;

LABEL_23:
      if (-[BRCRelativePath _fixupRelativePath](self, "_fixupRelativePath"))
        v12 = -[BRCRelativePath _resolvePathTypeAndContainer](self, "_resolvePathTypeAndContainer");
      else
        v12 = 33;
      goto LABEL_31;
    }
    brc_bread_crumbs();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      -[BRCRelativePath _resolveWhenDoesntExist].cold.1();
    v12 = 20;
    goto LABEL_30;
  }
  *((_BYTE *)self + 191) |= 1u;
  return 2;
}

- (int)_resolveSymlinkRelativeTo:(int)a3 path:(id)a4
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  void *v10;
  char *v11;
  unint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  int v20;
  __int128 v22;
  uint64_t v23;
  uint64_t v24;
  int v25;
  char v27[1024];
  char v28[1024];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a4;
  v25 = 0;
  v24 = 0;
  v22 = xmmword_1CC066D88;
  v23 = 0;
  objc_msgSend(v4, "pathComponents");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "reverseObjectEnumerator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allObjects");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "mutableCopy");

  if (!objc_msgSend(v8, "count"))
  {
LABEL_17:
    v17 = 0;
    goto LABEL_24;
  }
  v20 = 0;
  v9 = 0;
  while (1)
  {
    objc_msgSend(v8, "lastObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeLastObject");
    if (objc_msgSend(v10, "isEqualToString:", CFSTR("..")))
    {
      if (!v9)
        goto LABEL_18;
      do
        v11 = &v27[--v9];
      while (*(v11 - 1) != 47);
      v27[v9 - 1] = 0;
      goto LABEL_16;
    }
    v12 = v9
        + snprintf(&v27[v9 - 1], v9 - 1025, "/%s", (const char *)objc_msgSend(objc_retainAutorelease(v10), "fileSystemRepresentation"));
    if (v12 > 0x400)
    {
      v17 = 63;
      goto LABEL_23;
    }
    if (getattrlistat(a3, v27, &v22, &v24, 0xCuLL, 0x21uLL) < 0)
      goto LABEL_19;
    if (HIDWORD(v24) != self->_deviceID)
    {
      v17 = 18;
      goto LABEL_23;
    }
    if (v25 != 5)
    {
      v9 = v12;
      goto LABEL_16;
    }
    if (v20 > 31)
      break;
    if ((BRCReadlinkAt(a3, v27, v28, 1024) & 0x80000000) != 0)
    {
LABEL_19:
      v17 = *__error();
      goto LABEL_23;
    }
    if (v28[0] == 47)
    {
LABEL_18:
      v17 = 45;
      goto LABEL_23;
    }
    ++v20;
    v27[v9 - 1] = 0;
    objc_msgSend(MEMORY[0x1E0CB3940], "br_pathWithFileSystemRepresentation:", v28);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "pathComponents");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "reverseObjectEnumerator");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "allObjects");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObjectsFromArray:", v16);

    v4 = v13;
LABEL_16:

    if (!objc_msgSend(v8, "count"))
      goto LABEL_17;
  }
  v17 = 62;
LABEL_23:

LABEL_24:
  return v17;
}

- (BOOL)_resolveAndKeepOpenMustExist:(BOOL)a3 allowResolveInPkg:(BOOL)a4 error:(int *)a5
{
  int *p_openRefCount;
  int v7;
  BOOL v8;
  _BOOL8 v10;
  _BOOL4 v11;
  uint64_t v12;
  int v13;
  void *v14;
  void *v15;
  NSString *v16;
  id v17;
  NSString *relativePath;
  BRCRelativePath *basePath;
  int ProtectionStatus;
  NSString *absolutePath;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  int v28;
  unsigned int v29;
  void *v30;
  NSObject *v31;
  NSString *v32;
  const char *v33;
  NSObject *v34;
  uint32_t v35;
  unint64_t *p_fileID;
  void *v37;
  int v38;
  int v39;
  int v40;
  void *v41;
  NSObject *v42;
  NSString *v43;
  NSString *v44;
  int v45;
  int v46;
  void *v47;
  NSObject *v48;
  int v49;
  void *v50;
  NSObject *v51;
  NSString *v52;
  int v53;
  const char *v54;
  NSObject *v55;
  uint32_t v56;
  int v57;
  void *v58;
  NSObject *v59;
  BRCRelativePath *v60;
  char v61;
  char v62;
  char *v63;
  char v64;
  NSString *v65;
  BRCRelativePath *v66;
  unsigned int *v67;
  int v68;
  int v69;
  char v70;
  BRCRelativePath *v71;
  int v72;
  uint64_t v73;
  void *v74;
  NSObject *v75;
  BRCRelativePath *v76;
  void *v77;
  void *v78;
  NSObject *v79;
  char v80;
  void *v81;
  NSString *v82;
  NSString *symlinkContent;
  void *v84;
  char v85;
  void *v86;
  void *v87;
  NSString *v88;
  void *v89;
  void *v90;
  NSObject *v91;
  void *v92;
  NSObject *v93;
  void *v94;
  void *v95;
  uint64_t v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  NSObject *v102;
  int *v103;
  char *v104;
  void *v105;
  int v106;
  char v107;
  char v108;
  int v109;
  void *v110;
  NSObject *v111;
  int v112;
  char v113;
  int v115;
  unsigned int v116;
  id v117;
  void *v119;
  NSObject *v120;
  void *v121;
  NSObject *v122;
  unsigned int v123;
  void *v124;
  NSObject *v125;
  void *v126;
  NSObject *v127;
  int v128;
  int v129;
  void *v130;
  NSObject *v131;
  id v132;
  NSString *v133;
  int fd;
  NSString *v135;
  unint64_t v136;
  void *v137;
  NSObject *v138;
  unint64_t v139;
  NSString *v140;
  void *v141;
  NSObject *v142;
  void *v143;
  NSObject *v144;
  void *v145;
  NSObject *v146;
  BRCRelativePath *v147;
  void *v148;
  NSObject *v149;
  void *v150;
  NSObject *v151;
  void *v152;
  NSObject *v153;
  void *v154;
  NSObject *v155;
  void *v156;
  NSObject *v157;
  unsigned __int16 v158;
  char v159;
  void *v160;
  id *p_absolutePath;
  char v162;
  int v163;
  char v164;
  uint64_t v165;
  unsigned int v166;
  _QWORD v167[5];
  int v168;
  _BYTE v169[28];
  uint8_t buf[4];
  _BYTE v171[30];
  uint64_t v172;

  v172 = *MEMORY[0x1E0C80C00];
  v168 = 0;
  if ((self->_fd & 0x80000000) == 0)
  {
    p_openRefCount = &self->_openRefCount;
    do
      v7 = __ldaxr((unsigned int *)p_openRefCount);
    while (__stlxr(v7 + 1, (unsigned int *)p_openRefCount));
    if (v7 <= -2)
    {
      brc_bread_crumbs();
      v137 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v138 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v138, OS_LOG_TYPE_FAULT))
        -[BRCRelativePath _resolveAndKeepOpenMustExist:allowResolveInPkg:error:].cold.1();

    }
    return 1;
  }
  v10 = a4;
  v11 = a3;
  if (-[BRCRelativePath isResolved](self, "isResolved") && !-[BRCRelativePath exists](self, "exists") && v11)
  {
    v8 = 0;
    if (a5)
      *a5 = 2;
    return v8;
  }
  LODWORD(v12) = -[BRCRelativePath _shouldKeepBasePathOpen](self, "_shouldKeepBasePathOpen");
  if ((_DWORD)v12)
    -[BRCRelativePath resolveAndKeepOpenMustExist:error:](self->_basePath, "resolveAndKeepOpenMustExist:error:", 1, 0);
  if (!self->_basePath
    || (v13 = -[BRCRelativePath _resolveBasePath:](self, "_resolveBasePath:", v10), (v168 = v13) == 0))
  {
    relativePath = self->_relativePath;
    if (relativePath)
    {
      basePath = self->_basePath;
      if (basePath)
      {
        if (basePath->_fd < 0)
        {
          brc_bread_crumbs();
          v143 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v144 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v144, OS_LOG_TYPE_FAULT))
            -[BRCRelativePath _resolveAndKeepOpenMustExist:allowResolveInPkg:error:].cold.17();

          relativePath = self->_relativePath;
        }
        if (-[NSString length](relativePath, "length"))
        {
          buf[0] = 0;
          ProtectionStatus = BRCOpenAtAndGetProtectionStatus(self->_basePath->_fd, -[NSString fileSystemRepresentation](self->_relativePath, "fileSystemRepresentation"), 2129924, 0, buf);
          self->_fd = ProtectionStatus;
          if (buf[0])
            *((_BYTE *)self + 192) |= 0x10u;
        }
        else
        {
          ProtectionStatus = dup(self->_basePath->_fd);
          self->_fd = ProtectionStatus;
        }
        if (ProtectionStatus < 0)
        {
          if (*__error() <= 0)
          {
            brc_bread_crumbs();
            v150 = (void *)objc_claimAutoreleasedReturnValue();
            brc_default_log();
            v151 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v151, OS_LOG_TYPE_FAULT))
              -[BRCRelativePath _resolveAndKeepOpenMustExist:allowResolveInPkg:error:].cold.11();

          }
          v45 = *__error();
          if (!v45)
            v45 = 22;
          v168 = v45;
          if (v45 == 2)
          {
            brc_bread_crumbs();
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            brc_default_log();
            v31 = objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
              goto LABEL_48;
            v133 = self->_relativePath;
            fd = self->_basePath->_fd;
            *(_DWORD *)buf = 67109890;
            *(_DWORD *)v171 = fd;
            *(_WORD *)&v171[4] = 2112;
            *(_QWORD *)&v171[6] = v133;
            *(_WORD *)&v171[14] = 1024;
            *(_DWORD *)&v171[16] = v168;
            *(_WORD *)&v171[20] = 2112;
            *(_QWORD *)&v171[22] = v30;
            v33 = "[DEBUG] openat(%d, '%@') failed %{errno}d%@";
            v34 = v31;
            v35 = 34;
            goto LABEL_197;
          }
          v49 = *__error();
          brc_bread_crumbs();
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v51 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v51, (os_log_type_t)0x90u))
            goto LABEL_59;
          v52 = self->_relativePath;
          v53 = self->_basePath->_fd;
          *(_DWORD *)buf = 67109890;
          *(_DWORD *)v171 = v53;
          *(_WORD *)&v171[4] = 2112;
          *(_QWORD *)&v171[6] = v52;
          *(_WORD *)&v171[14] = 1024;
          *(_DWORD *)&v171[16] = v49;
          *(_WORD *)&v171[20] = 2112;
          *(_QWORD *)&v171[22] = v50;
          v54 = "[ERROR] openat(%d, '%@') failed %{errno}d%@";
          v55 = v51;
          v56 = 34;
LABEL_199:
          _os_log_error_impl(&dword_1CBD43000, v55, (os_log_type_t)0x90u, v54, buf, v56);
LABEL_59:

          *__error() = v49;
          goto LABEL_67;
        }
        goto LABEL_67;
      }
    }
    absolutePath = self->_absolutePath;
    if (absolutePath)
    {
      if ((-[NSString br_isAbsolutePath](absolutePath, "br_isAbsolutePath") & 1) == 0)
      {
        brc_bread_crumbs();
        v145 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v146 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v146, OS_LOG_TYPE_FAULT))
          -[BRCRelativePath _resolveAndKeepOpenMustExist:allowResolveInPkg:error:].cold.15();

      }
      v22 = -[NSString fileSystemRepresentation](self->_absolutePath, "fileSystemRepresentation");
      v28 = BRCOpenAt(0xFFFFFFFFLL, v22, 32772, v23, v24, v25, v26, v27, v158);
      self->_fd = v28;
      if (v28 < 0)
      {
        if (*__error() <= 0)
        {
          brc_bread_crumbs();
          v152 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v153 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v153, OS_LOG_TYPE_FAULT))
            -[BRCRelativePath _resolveAndKeepOpenMustExist:allowResolveInPkg:error:].cold.11();

        }
        v29 = *__error();
        if (!v29)
          v29 = 22;
        v168 = v29;
        if (v29 <= 2)
        {
          brc_bread_crumbs();
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v31 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
          {
LABEL_48:

            goto LABEL_67;
          }
          v32 = self->_absolutePath;
          *(_DWORD *)buf = 138412802;
          *(_QWORD *)v171 = v32;
          *(_WORD *)&v171[8] = 1024;
          *(_DWORD *)&v171[10] = v168;
          *(_WORD *)&v171[14] = 2112;
          *(_QWORD *)&v171[16] = v30;
          v33 = "[DEBUG] open('%@') failed %{errno}d%@";
          v34 = v31;
          v35 = 28;
LABEL_197:
          _os_log_debug_impl(&dword_1CBD43000, v34, OS_LOG_TYPE_DEBUG, v33, buf, v35);
          goto LABEL_48;
        }
        v49 = *__error();
        brc_bread_crumbs();
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v51 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v51, (os_log_type_t)0x90u))
          goto LABEL_59;
        v135 = self->_absolutePath;
        *(_DWORD *)buf = 138412802;
        *(_QWORD *)v171 = v135;
        *(_WORD *)&v171[8] = 1024;
        *(_DWORD *)&v171[10] = v49;
        *(_WORD *)&v171[14] = 2112;
        *(_QWORD *)&v171[16] = v50;
        v54 = "[ERROR] open('%@') failed %{errno}d%@";
        v55 = v51;
        v56 = 28;
        goto LABEL_199;
      }
LABEL_67:
      v60 = self->_basePath;
      if (v60)
      {
        v61 = *((_BYTE *)v60 + 191);
        if ((v61 & 2) != 0)
        {
          v63 = (char *)self + 191;
          v62 = *((_BYTE *)self + 191);
        }
        else
        {
          v63 = (char *)self + 191;
          v62 = *((_BYTE *)self + 191);
          if ((v61 & 8) == 0)
          {
            v64 = 0;
            goto LABEL_74;
          }
        }
        v64 = 2;
      }
      else
      {
        v64 = 0;
        v63 = (char *)self + 191;
        v62 = *((_BYTE *)self + 191);
      }
LABEL_74:
      *((_BYTE *)self + 191) = v64 | v62 & 0xFD;
      v65 = self->_relativePath;
      if (!v65)
        v65 = self->_absolutePath;
      v16 = v65;
      if (self->_fd < 0)
      {
        v69 = v168;
        v70 = v168 != 2 || v11;
        if ((v70 & 1) != 0)
        {
          self->_fd = -v168;
        }
        else
        {
          v69 = -[BRCRelativePath _resolveWhenDoesntExist](self, "_resolveWhenDoesntExist");
          v168 = v69;
        }
        v71 = self->_basePath;
        if (v71 && (*((_BYTE *)v71 + 191) & 0xA) == 0)
        {
          -[BRCRelativePath close](self->_basePath, "close");
          if (v168)
            goto LABEL_91;
        }
        else
        {
          LOBYTE(v12) = 1;
          if (v69)
            goto LABEL_91;
        }
      }
      else
      {
        v66 = self;
        v67 = (unsigned int *)&v66->_openRefCount;
        do
          v68 = __ldaxr(v67);
        while (__stlxr(v68 + 1, v67));
        if (v68 <= -2)
        {
          brc_bread_crumbs();
          v141 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v142 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v142, OS_LOG_TYPE_FAULT))
            -[BRCRelativePath _resolveAndKeepOpenMustExist:allowResolveInPkg:error:].cold.1();

        }
        v168 = -[BRCRelativePath _resolveWhenExists](v66, "_resolveWhenExists");
        if (v168)
        {
          -[BRCRelativePath _close](v66, "_close");
LABEL_91:
          v14 = 0;
          v15 = 0;
          v17 = 0;
          goto LABEL_153;
        }
      }
      v72 = -[NSString br_isAbsolutePath](v16, "br_isAbsolutePath");
      v73 = 24;
      if (v72)
        v73 = 16;
      v17 = *(id *)((char *)&self->super.isa + v73);
      if ((objc_msgSend(v17, "isEqualToString:", v16) & 1) == 0)
      {
        brc_bread_crumbs();
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v75 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v75, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412802;
          *(_QWORD *)v171 = v16;
          *(_WORD *)&v171[8] = 2112;
          *(_QWORD *)&v171[10] = self;
          *(_WORD *)&v171[18] = 2112;
          *(_QWORD *)&v171[20] = v74;
          _os_log_debug_impl(&dword_1CBD43000, v75, OS_LOG_TYPE_DEBUG, "[DEBUG] resolved '%@' to %@%@", buf, 0x20u);
        }

      }
      if ((*v63 & 2) != 0)
      {
        v80 = v12;
        -[BRCRelativePath pathOfPackageRoot](self, "pathOfPackageRoot");
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        self->_type = objc_msgSend(v81, "type");

      }
      else
      {
        v76 = self->_basePath;
        if (v76)
        {
          -[BRCRelativePath absolutePath](v76, "absolutePath");
          v77 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v77, "stringByAppendingPathComponent:", self->_relativePath);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          if ((self->_mode & 0xF000) == 0x4000
            && ((objc_msgSend(v14, "br_isPackageRoot") & 1) != 0
             || (self->_finderInfo[8] & 0x20) != 0 && (objc_msgSend(v14, "br_isInPackage") & 1) == 0))
          {
            objc_msgSend(v14, "lastPathComponent");
            v105 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v105, "br_pathExtension");
            v15 = (void *)objc_claimAutoreleasedReturnValue();

            v106 = objc_msgSend(v15, "brc_isBlacklistedPackageExtension");
            v107 = *v63;
            v80 = v12;
            if (v106)
              v108 = v107 & 0xF7;
            else
              v108 = v107 | 8;
            *v63 = v108;
LABEL_114:
            p_absolutePath = (id *)&self->_absolutePath;
            if ((self->_mode & 0xF000) != 0xA000)
              goto LABEL_120;
            if ((*v63 & 2) != 0)
            {
              -[BRCRelativePath pathOfPackageRoot](self, "pathOfPackageRoot");
              v84 = (void *)objc_claimAutoreleasedReturnValue();
              v167[0] = MEMORY[0x1E0C809B0];
              v167[1] = 3221225472;
              v167[2] = __72__BRCRelativePath__resolveAndKeepOpenMustExist_allowResolveInPkg_error___block_invoke;
              v167[3] = &unk_1E875EF40;
              v167[4] = self;
              v85 = objc_msgSend(v84, "performOnOpenFileDescriptor:error:", v167, &v168);

              if ((v85 & 1) != 0)
              {
LABEL_120:
                if (-[BRCRelativePath isPackageRoot](self->_basePath, "isPackageRoot"))
                {
                  -[BRCRelativePath filename](self->_basePath, "filename");
                  v86 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v86, "br_pathExtension");
                  v87 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v87)
                  {
                    v15 = v87;
                    if (!objc_msgSend(v87, "compare:options:", CFSTR("pkpass"), 1))
                      goto LABEL_130;
                  }
                  else
                  {
                    v15 = 0;
                  }
                }
                v88 = self->_relativePath;
                +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
                v89 = (void *)objc_claimAutoreleasedReturnValue();
                LODWORD(v88) = -[NSString br_isExcludedWithMaximumDepth:](v88, "br_isExcludedWithMaximumDepth:", objc_msgSend(v89, "maxRelativePathDepth"));

                if ((_DWORD)v88)
                {
                  brc_bread_crumbs();
                  v90 = (void *)objc_claimAutoreleasedReturnValue();
                  brc_default_log();
                  v91 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v91, OS_LOG_TYPE_DEBUG))
                    -[BRCRelativePath _resolveAndKeepOpenMustExist:allowResolveInPkg:error:].cold.2();

                  -[BRCRelativePath _close](self, "_close");
                  *((_BYTE *)self + 191) |= 1u;
                  v168 = 45;
                  goto LABEL_152;
                }
LABEL_130:
                if ((self->_fd & 0x80000000) == 0)
                {
                  LOBYTE(v12) = v80;
                  if (!-[BRCRelativePath isDocument](self, "isDocument") || self->_documentID)
                  {
LABEL_133:
                    if ((self->_fd & 0x80000000) == 0 && (*v63 & 0xC) == 8)
                    {
                      brc_bread_crumbs();
                      v92 = (void *)objc_claimAutoreleasedReturnValue();
                      brc_default_log();
                      v93 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v93, OS_LOG_TYPE_DEBUG))
                        -[BRCRelativePath _resolveAndKeepOpenMustExist:allowResolveInPkg:error:].cold.5();

                      +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
                      v94 = (void *)objc_claimAutoreleasedReturnValue();
                      if (objc_msgSend(v94, "shouldFixupBundleBitOnPackages"))
                      {
                        v162 = v12;
                        -[BRCRelativePath filename](self, "filename");
                        v95 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v95, "br_pathExtension");
                        v96 = objc_claimAutoreleasedReturnValue();

                        if (!v96)
                          goto LABEL_140;
                        objc_msgSend(v94, "extensionsSkippingBundleBitFixup");
                        v97 = (void *)objc_claimAutoreleasedReturnValue();
                        -[BRCRelativePath filename](self, "filename");
                        v98 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v98, "br_pathExtension");
                        v99 = v94;
                        v100 = (void *)objc_claimAutoreleasedReturnValue();
                        v159 = objc_msgSend(v97, "containsObject:", v100);

                        v94 = v99;
                        if ((v159 & 1) == 0)
                        {
LABEL_140:
                          *((_BYTE *)self + 191) |= 4u;
                          self->_finderInfo[8] |= 0x20u;
                          if (fsetxattr(self->_fd, "com.apple.FinderInfo", self->_finderInfo, 0x20uLL, 0, 0))
                          {
                            brc_bread_crumbs();
                            v101 = (void *)objc_claimAutoreleasedReturnValue();
                            brc_default_log();
                            v102 = objc_claimAutoreleasedReturnValue();
                            if (os_log_type_enabled(v102, OS_LOG_TYPE_DEFAULT))
                            {
                              v103 = __error();
                              v104 = strerror(*v103);
                              *(_DWORD *)buf = 138412802;
                              *(_QWORD *)v171 = self;
                              *(_WORD *)&v171[8] = 2080;
                              *(_QWORD *)&v171[10] = v104;
                              *(_WORD *)&v171[18] = 2112;
                              *(_QWORD *)&v171[20] = v101;
                              _os_log_impl(&dword_1CBD43000, v102, OS_LOG_TYPE_DEFAULT, "[WARNING] failed fixing up bundle bit at %@ - %s%@", buf, 0x20u);
                            }
                          }
                          else
                          {
                            brc_bread_crumbs();
                            v101 = (void *)objc_claimAutoreleasedReturnValue();
                            brc_default_log();
                            v102 = objc_claimAutoreleasedReturnValue();
                            if (os_log_type_enabled(v102, OS_LOG_TYPE_DEBUG))
                              -[BRCRelativePath _resolveAndKeepOpenMustExist:allowResolveInPkg:error:].cold.4();
                          }

                        }
                        LOBYTE(v12) = v162;
                      }
                      else
                      {
                        v96 = (uint64_t)v15;
                      }

                      v15 = (void *)v96;
                    }
                    goto LABEL_153;
                  }
                  if (-[BRCRelativePath isFault](self, "isFault"))
                  {
                    v115 = flock(self->_basePath->_fd, 6);
                    v116 = 0;
                    if (v115 < 0)
                    {
                      while (*__error() == 35 && v116 <= 9)
                      {
                        ++v116;
                        usleep(0x3E8u);
                        v115 = flock(self->_basePath->_fd, 6);
                        if ((v115 & 0x80000000) == 0)
                          goto LABEL_163;
                      }
                    }
                    else
                    {
LABEL_163:
                      if (!v115)
                      {
                        brc_bread_crumbs();
                        v160 = (void *)objc_claimAutoreleasedReturnValue();
                        brc_default_log();
                        v12 = objc_claimAutoreleasedReturnValue();
                        if (os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_DEFAULT))
                        {
                          v117 = *p_absolutePath;
                          *(_DWORD *)buf = 134218498;
                          *(double *)v171 = (double)v116 * 0.1;
                          *(_WORD *)&v171[8] = 2112;
                          *(_QWORD *)&v171[10] = v117;
                          *(_WORD *)&v171[18] = 2112;
                          *(_QWORD *)&v171[20] = v160;
                          _os_log_impl(&dword_1CBD43000, (os_log_t)v12, OS_LOG_TYPE_DEFAULT, "[WARNING] Waited for %f seconds before acquiring lock on the parent folder to re-check faults %@ docID%@", buf, 0x20u);
                        }

                        flock(self->_basePath->_fd, 8);
                        LOBYTE(v12) = v80;
                        goto LABEL_180;
                      }
                    }
                    if (*__error() != 35)
                    {
                      v163 = *__error();
                      brc_bread_crumbs();
                      v119 = (void *)objc_claimAutoreleasedReturnValue();
                      brc_default_log();
                      v120 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v120, OS_LOG_TYPE_FAULT))
                      {
                        v147 = self->_basePath;
                        *(_DWORD *)buf = 138412802;
                        *(_QWORD *)v171 = v147;
                        *(_WORD *)&v171[8] = 1024;
                        *(_DWORD *)&v171[10] = v163;
                        *(_WORD *)&v171[14] = 2112;
                        *(_QWORD *)&v171[16] = v119;
                        _os_log_fault_impl(&dword_1CBD43000, v120, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: Really unexpected flock(%@) error  %{errno}d%@", buf, 0x1Cu);
                      }

                    }
                    brc_bread_crumbs();
                    v121 = (void *)objc_claimAutoreleasedReturnValue();
                    brc_default_log();
                    v122 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v122, OS_LOG_TYPE_FAULT))
                    {
                      -[BRCRelativePath absolutePath](self->_basePath, "absolutePath");
                      v164 = v12;
                      v12 = objc_claimAutoreleasedReturnValue();
                      v140 = self->_absolutePath;
                      *(_DWORD *)buf = 138412802;
                      *(_QWORD *)v171 = v12;
                      *(_WORD *)&v171[8] = 2112;
                      *(_QWORD *)&v171[10] = v140;
                      *(_WORD *)&v171[18] = 2112;
                      *(_QWORD *)&v171[20] = v121;
                      _os_log_fault_impl(&dword_1CBD43000, v122, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: Failed to acquire exclusive lock on %@, will assign docID to fault %@ anyway%@", buf, 0x20u);

                      LOBYTE(v12) = v164;
                    }

                  }
LABEL_180:
                  *(_QWORD *)&v169[16] = 0;
                  *(_OWORD *)v169 = xmmword_1CC066DA0;
                  v166 = 0;
                  v165 = 0;
                  if (!BRCGetOrAllocateDocID(self->_fd)
                    || fgetattrlist(self->_fd, v169, &v165, 0xCuLL, 0x20u) < 0)
                  {
                    v128 = *__error();
                    if (!v128)
                      v128 = 2;
                    v168 = v128;
                    v129 = *__error();
                    brc_bread_crumbs();
                    v130 = (void *)objc_claimAutoreleasedReturnValue();
                    brc_default_log();
                    v131 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v131, (os_log_type_t)0x90u))
                    {
                      *(_DWORD *)buf = 138412802;
                      *(_QWORD *)v171 = self;
                      *(_WORD *)&v171[8] = 1024;
                      *(_DWORD *)&v171[10] = v129;
                      *(_WORD *)&v171[14] = 2112;
                      *(_QWORD *)&v171[16] = v130;
                      _os_log_error_impl(&dword_1CBD43000, v131, (os_log_type_t)0x90u, "[ERROR] failed allocating documentID for %@ %{errno}d%@", buf, 0x1Cu);
                    }

                    *__error() = v129;
                    -[BRCRelativePath _close](self, "_close");
                    *((_BYTE *)self + 191) |= 1u;
                    if ((*((_BYTE *)self + 192) & 0x10) != 0)
                      *((_BYTE *)self + 192) |= 0x20u;
                    goto LABEL_153;
                  }
                  v123 = v166;
                  self->_flags = HIDWORD(v165);
                  self->_documentID = v123;
                  if (!v123)
                  {
                    brc_bread_crumbs();
                    v124 = (void *)objc_claimAutoreleasedReturnValue();
                    brc_default_log();
                    v125 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v125, OS_LOG_TYPE_FAULT))
                      -[BRCRelativePath _resolveAndKeepOpenMustExist:allowResolveInPkg:error:].cold.6();

                    if (!self->_documentID)
                    {
                      brc_bread_crumbs();
                      v126 = (void *)objc_claimAutoreleasedReturnValue();
                      brc_default_log();
                      v127 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v127, (os_log_type_t)0x90u))
                        -[BRCRelativePath _resolveAndKeepOpenMustExist:allowResolveInPkg:error:].cold.3();

                      v168 = 45;
                      -[BRCRelativePath _close](self, "_close");
                      *((_BYTE *)self + 191) |= 1u;
                      goto LABEL_153;
                    }
                  }
                  goto LABEL_133;
                }
LABEL_152:
                LOBYTE(v12) = v80;
                goto LABEL_153;
              }
            }
            else
            {
              if (self->_fd < 0)
              {
                v109 = 9;
              }
              else
              {
                if ((BRCReadlinkAt(-1, (const char *)objc_msgSend(*p_absolutePath, "fileSystemRepresentation"), (char *)buf, 1024) & 0x80000000) == 0)
                {
                  objc_msgSend(MEMORY[0x1E0CB3940], "br_pathWithFileSystemRepresentation:", buf);
                  v82 = (NSString *)objc_claimAutoreleasedReturnValue();
                  symlinkContent = self->_symlinkContent;
                  self->_symlinkContent = v82;

                  v168 = 0;
                  goto LABEL_120;
                }
                v109 = *__error();
              }
              v168 = v109;
            }
            brc_bread_crumbs();
            v110 = (void *)objc_claimAutoreleasedReturnValue();
            brc_default_log();
            v111 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v111, OS_LOG_TYPE_DEBUG))
            {
              v132 = *p_absolutePath;
              *(_DWORD *)buf = 138412802;
              *(_QWORD *)v171 = v132;
              *(_WORD *)&v171[8] = 1024;
              *(_DWORD *)&v171[10] = v168;
              *(_WORD *)&v171[14] = 2112;
              *(_QWORD *)&v171[16] = v110;
              _os_log_debug_impl(&dword_1CBD43000, v111, OS_LOG_TYPE_DEBUG, "[DEBUG] resolved-path:'%@' symlink doesn't resolve %{errno}d%@", buf, 0x1Cu);
            }

            v168 = 45;
            -[BRCRelativePath _close](self, "_close");
            goto LABEL_152;
          }
          if (!v10 && objc_msgSend(v14, "br_isInPackage"))
          {
            brc_bread_crumbs();
            v78 = (void *)objc_claimAutoreleasedReturnValue();
            brc_default_log();
            v79 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v79, OS_LOG_TYPE_DEBUG))
              -[BRCRelativePath _resolveAndKeepOpenMustExist:allowResolveInPkg:error:].cold.7();

            -[BRCRelativePath _close](self, "_close");
            v15 = 0;
            *((_BYTE *)self + 191) |= 1u;
            v168 = 2;
            goto LABEL_153;
          }
          v80 = v12;
LABEL_113:
          v15 = 0;
          goto LABEL_114;
        }
        v80 = v12;
      }
      v14 = 0;
      goto LABEL_113;
    }
    p_fileID = &self->_fileID;
    if (!self->_fileID)
    {
      brc_bread_crumbs();
      v148 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v149 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v149, OS_LOG_TYPE_FAULT))
        -[BRCRelativePath _resolveAndKeepOpenMustExist:allowResolveInPkg:error:].cold.13();

    }
    -[BRCAccountSession volume](self->_session, "volume");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    self->_fd = BRCOpenByID(objc_msgSend(v37, "deviceID"), self->_fileID, 2129924);

    v38 = self->_fd;
    if (v38 < 0)
    {
      if (*__error() <= 0)
      {
        brc_bread_crumbs();
        v154 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v155 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v155, OS_LOG_TYPE_FAULT))
          -[BRCRelativePath _resolveAndKeepOpenMustExist:allowResolveInPkg:error:].cold.11();

      }
      v46 = *__error();
      if (!v46)
        v46 = 22;
      v168 = v46;
      if (v46 == 1)
      {
        brc_bread_crumbs();
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v48 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG))
          -[BRCRelativePath _resolveAndKeepOpenMustExist:allowResolveInPkg:error:].cold.10();
      }
      else
      {
        if (v46 != 2)
        {
          v57 = *__error();
          brc_bread_crumbs();
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v59 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v59, (os_log_type_t)0x90u))
          {
            v139 = *p_fileID;
            *(_DWORD *)buf = 134218498;
            *(_QWORD *)v171 = v139;
            *(_WORD *)&v171[8] = 1024;
            *(_DWORD *)&v171[10] = v57;
            *(_WORD *)&v171[14] = 2112;
            *(_QWORD *)&v171[16] = v58;
            _os_log_error_impl(&dword_1CBD43000, v59, (os_log_type_t)0x90u, "[ERROR] BRCOpenByID(%lld) failed %{errno}d%@", buf, 0x1Cu);
          }

          *__error() = v57;
          goto LABEL_66;
        }
        brc_bread_crumbs();
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v48 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG))
          -[BRCRelativePath _resolveAndKeepOpenMustExist:allowResolveInPkg:error:].cold.9();
      }

    }
    else
    {
      if (fcntl(v38, 50, buf) < 0)
      {
        if (*__error() <= 0)
        {
          brc_bread_crumbs();
          v156 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v157 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v157, OS_LOG_TYPE_FAULT))
            -[BRCRelativePath _resolveAndKeepOpenMustExist:allowResolveInPkg:error:].cold.11();

        }
        v39 = *__error();
        if (!v39)
          v39 = 22;
        v168 = v39;
        v40 = *__error();
        brc_bread_crumbs();
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v42 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v42, (os_log_type_t)0x90u))
        {
          v136 = *p_fileID;
          *(_DWORD *)v169 = 134218498;
          *(_QWORD *)&v169[4] = v136;
          *(_WORD *)&v169[12] = 1024;
          *(_DWORD *)&v169[14] = v40;
          *(_WORD *)&v169[18] = 2112;
          *(_QWORD *)&v169[20] = v41;
          _os_log_error_impl(&dword_1CBD43000, v42, (os_log_type_t)0x90u, "[ERROR] fcntl(%lld, F_GETPATH) failed %{errno}d%@", v169, 0x1Cu);
        }

        *__error() = v40;
        close(self->_fd);
        self->_fd = -1;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "br_pathWithFileSystemRepresentation:", buf);
      v43 = (NSString *)objc_claimAutoreleasedReturnValue();
      v44 = self->_absolutePath;
      self->_absolutePath = v43;

    }
LABEL_66:
    LOBYTE(v11) = 1;
    goto LABEL_67;
  }
  v14 = 0;
  v15 = 0;
  v16 = 0;
  v17 = 0;
  self->_fd = -v13;
LABEL_153:
  v112 = v168;
  if (a5)
    *a5 = v168;
  v113 = v12 ^ 1;
  if (!v112)
    v113 = 1;
  if ((v113 & 1) == 0)
  {
    -[BRCRelativePath close](self->_basePath, "close");
    v112 = v168;
  }
  v8 = v112 == 0;

  return v8;
}

uint64_t __72__BRCRelativePath__resolveAndKeepOpenMustExist_allowResolveInPkg_error___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  char v10[1024];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "pathRelativeToPackageRoot");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(*(id *)(a1 + 32), "_resolveSymlinkRelativeTo:path:", a2, v4);
  if (!(_DWORD)v5)
  {
    if ((BRCReadlinkAt(a2, (const char *)objc_msgSend(objc_retainAutorelease(v4), "fileSystemRepresentation"), v10, 1024) & 0x80000000) != 0)
    {
      v5 = *__error();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "br_pathWithFileSystemRepresentation:", v10);
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = *(_QWORD *)(a1 + 32);
      v8 = *(void **)(v7 + 48);
      *(_QWORD *)(v7 + 48) = v6;

      v5 = 0;
    }
  }

  return v5;
}

- (BOOL)resolveAndKeepOpenMustExist:(BOOL)a3 error:(int *)a4
{
  return -[BRCRelativePath resolveAndKeepOpenMustExist:allowResolveInPkg:error:](self, "resolveAndKeepOpenMustExist:allowResolveInPkg:error:", a3, 0, a4);
}

- (BOOL)resolveAndKeepOpenMustExist:(BOOL)a3 allowResolveInPkg:(BOOL)a4 error:(int *)a5
{
  _BOOL8 v6;
  _BOOL8 v7;
  brc_mutex *p_mutex;
  int *p_openRefCount;
  int v11;
  BOOL v12;
  void *v14;
  NSObject *v15;

  v6 = a4;
  v7 = a3;
  p_mutex = &self->_mutex;
  brc_mutex_lock(&self->_mutex.pthread);
  if (self->_fd < 0)
  {
    v12 = -[BRCRelativePath _resolveAndKeepOpenMustExist:allowResolveInPkg:error:](self, "_resolveAndKeepOpenMustExist:allowResolveInPkg:error:", v7, v6, a5);
  }
  else
  {
    p_openRefCount = &self->_openRefCount;
    do
      v11 = __ldaxr((unsigned int *)p_openRefCount);
    while (__stlxr(v11 + 1, (unsigned int *)p_openRefCount));
    if (v11 <= -2)
    {
      brc_bread_crumbs();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
        -[BRCRelativePath _resolveAndKeepOpenMustExist:allowResolveInPkg:error:].cold.1();

    }
    v12 = 1;
  }
  brc_mutex_unlock(&p_mutex->pthread);
  return v12;
}

- (id)refreshFromPathMustExist:(BOOL)a3
{
  _BOOL8 v3;
  _BOOL4 v5;
  BRCRelativePath *v6;
  void *v8;
  NSObject *v9;

  v3 = a3;
  -[BRCRelativePath close](self, "close");
  if ((self->_fd & 0x80000000) == 0)
  {
    brc_bread_crumbs();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      -[BRCRelativePath _resolveBasePath:].cold.9();

  }
  self->_parentFileID = 0;
  self->_fileID = 0;
  v5 = -[BRCRelativePath resolveAndKeepOpenMustExist:error:](self, "resolveAndKeepOpenMustExist:error:", v3, 0);
  v6 = 0;
  if (v5)
    v6 = self;
  return v6;
}

- (BOOL)_shouldKeepBasePathOpen
{
  return self->_fd < 0
      && -[BRCRelativePath _shouldKeepBasePathOpenWithoutOpenedFD](self, "_shouldKeepBasePathOpenWithoutOpenedFD");
}

- (BOOL)_shouldKeepBasePathOpenWithoutOpenedFD
{
  return -[BRCRelativePath isResolved](self, "isResolved")
      && !-[BRCRelativePath exists](self, "exists")
      && -[BRCRelativePath isInPackage](self, "isInPackage");
}

- (void)_close
{
  int *p_openRefCount;
  int v4;
  int v5;
  void *v6;
  NSObject *v7;

  if ((self->_fd & 0x80000000) == 0)
  {
    p_openRefCount = &self->_openRefCount;
    do
      v4 = __ldaxr((unsigned int *)p_openRefCount);
    while (__stlxr(v4 - 1, (unsigned int *)p_openRefCount));
    if (v4 <= 0)
    {
      brc_bread_crumbs();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
        -[BRCRelativePath _resolveAndKeepOpenMustExist:allowResolveInPkg:error:].cold.1();

    }
    else if (v4 == 1)
    {
      v5 = *__error();
      close(self->_fd);
      *__error() = v5;
      self->_fd = -100;
      -[BRCRelativePath close](self->_basePath, "close");
    }
  }
}

- (void)close
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: !self.isResolved || self.exists%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (BOOL)resolveMustExist:(BOOL)a3 error:(int *)a4
{
  _BOOL4 v5;

  v5 = -[BRCRelativePath resolveAndKeepOpenMustExist:error:](self, "resolveAndKeepOpenMustExist:error:", a3, a4);
  if (v5)
    -[BRCRelativePath close](self, "close");
  return v5;
}

- (BOOL)flock:(int)a3
{
  int fd;
  void *v7;
  NSObject *v8;

  fd = self->_fd;
  if (fd < 0)
  {
    brc_bread_crumbs();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      -[BRCRelativePath logicalName].cold.1();

    fd = self->_fd;
  }
  return flock(fd, a3) == 0;
}

- (BOOL)performOnOpenFileDescriptor:(id)a3 error:(int *)a4
{
  uint64_t (**v6)(id, _QWORD);
  int v7;
  BOOL v8;
  int v10;

  v6 = (uint64_t (**)(id, _QWORD))a3;
  v10 = 0;
  if (-[BRCRelativePath resolveAndKeepOpenMustExist:error:](self, "resolveAndKeepOpenMustExist:error:", 1, &v10))
  {
    v10 = v6[2](v6, self->_fd);
    -[BRCRelativePath close](self, "close");
  }
  v7 = v10;
  if (a4)
    *a4 = v10;
  v8 = v7 == 0;

  return v8;
}

- (BOOL)performOnOpenParentFileDescriptor:(id)a3 error:(int *)a4
{
  uint64_t (**v6)(id, _QWORD);
  BRCRelativePath *basePath;
  unint64_t parentFileID;
  uint64_t v9;
  BRCRelativePath *v10;
  int v11;
  id v12;
  BRCRelativePath *v13;
  void *v14;
  unsigned int *v15;
  uint64_t fd;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  int v26;
  NSObject *v27;
  NSObject *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  NSObject *v37;
  int v38;
  BOOL v39;
  void *v40;
  NSObject *v41;
  int v42;
  void *v43;
  NSObject *v44;
  NSString *absolutePath;
  NSString *relativePath;
  BRCRelativePath *v48;
  int v49;
  void *v50;
  NSObject *v51;
  void *v52;
  NSObject *v53;
  int v54;
  _BYTE v55[30];
  _WORD v56[15];

  *(_QWORD *)&v56[11] = *MEMORY[0x1E0C80C00];
  v6 = (uint64_t (**)(id, _QWORD))a3;
  if (!-[BRCRelativePath isResolved](self, "isResolved"))
  {
    brc_bread_crumbs();
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v51 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v51, OS_LOG_TYPE_FAULT))
      -[BRCRelativePath type].cold.2();

  }
  if (!self->_parentFileID)
  {
    brc_bread_crumbs();
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v53 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v53, OS_LOG_TYPE_FAULT))
      -[BRCRelativePath performOnOpenParentFileDescriptor:error:].cold.2();

  }
  basePath = self->_basePath;
  if (!basePath)
  {
    v13 = 0;
    v14 = 0;
    goto LABEL_15;
  }
  if (basePath->_fd <= 0)
  {
    -[BRCRelativePath root](self, "root");
    v15 = (unsigned int *)objc_claimAutoreleasedReturnValue();
    fd = v15[49];
    if ((int)fd < 1)
    {
      brc_bread_crumbs();
      v27 = objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, (os_log_type_t)0x90u))
      {
        v54 = 138412802;
        *(_QWORD *)v55 = v15;
        *(_WORD *)&v55[8] = 2112;
        *(_QWORD *)&v55[10] = self;
        *(_WORD *)&v55[18] = 2112;
        *(_QWORD *)&v55[20] = v27;
        _os_log_error_impl(&dword_1CBD43000, v28, (os_log_type_t)0x90u, "[ERROR] the root is closed!\n  root: %@\n  self: %@%@", (uint8_t *)&v54, 0x20u);
      }

      v13 = 0;
      v12 = 0;
LABEL_22:

      v26 = 1;
      v14 = v12;
LABEL_23:
      -[NSString stringByDeletingLastPathComponent](self->_absolutePath, "stringByDeletingLastPathComponent");
      v12 = (id)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v12, "length"))
      {
        v12 = objc_retainAutorelease(v12);
        v29 = (const char *)objc_msgSend(v12, "fileSystemRepresentation");
        v35 = BRCOpenAt(0xFFFFFFFFLL, v29, 33028, v30, v31, v32, v33, v34, v54);
        if ((v35 & 0x80000000) == 0)
        {
          v25 = v35;
          brc_bread_crumbs();
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v37 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
          {
            v54 = 138412802;
            *(_QWORD *)v55 = v12;
            *(_WORD *)&v55[8] = 1024;
            *(_DWORD *)&v55[10] = v25;
            *(_WORD *)&v55[14] = 2112;
            *(_QWORD *)&v55[16] = v36;
            _os_log_debug_impl(&dword_1CBD43000, v37, OS_LOG_TYPE_DEBUG, "[DEBUG] open('%@') succeeded, fd:%d%@", (uint8_t *)&v54, 0x1Cu);
          }

          v11 = v6[2](v6, v25);
          if (!v26)
            goto LABEL_29;
          goto LABEL_28;
        }
        brc_bread_crumbs();
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v44 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
          -[BRCRelativePath performOnOpenParentFileDescriptor:error:].cold.1((uint64_t)v12, (uint64_t)v43, v44);

        if (a4)
        {
          v39 = 0;
          v42 = *__error();
          goto LABEL_40;
        }
      }
      else
      {
        brc_bread_crumbs();
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v41 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
        {
          absolutePath = self->_absolutePath;
          relativePath = self->_relativePath;
          v48 = self->_basePath;
          v54 = 138413058;
          *(_QWORD *)v55 = absolutePath;
          *(_WORD *)&v55[8] = 2112;
          *(_QWORD *)&v55[10] = relativePath;
          *(_WORD *)&v55[18] = 2112;
          *(_QWORD *)&v55[20] = v48;
          *(_WORD *)&v55[28] = 2112;
          *(_QWORD *)v56 = v40;
          _os_log_debug_impl(&dword_1CBD43000, v41, OS_LOG_TYPE_DEBUG, "[DEBUG] empty parentPath for abs:%@ rel:%@ base:%@%@", (uint8_t *)&v54, 0x2Au);
        }

        if (a4)
        {
          v39 = 0;
          v42 = 22;
LABEL_40:
          *a4 = v42;
          goto LABEL_42;
        }
      }
      v39 = 0;
      goto LABEL_42;
    }
    -[BRCRelativePath pathRelativeToRoot](self, "pathRelativeToRoot");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "stringByDeletingLastPathComponent");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = (BRCRelativePath *)v15;
LABEL_12:
    if (objc_msgSend(v14, "length"))
    {
      v12 = objc_retainAutorelease(v14);
      v18 = (const char *)objc_msgSend(v12, "fileSystemRepresentation");
      v24 = BRCOpenAt(fd, v18, 33028, v19, v20, v21, v22, v23, v54);
      if ((v24 & 0x80000000) == 0)
      {
        LODWORD(v25) = v24;
        v11 = v6[2](v6, v24);
LABEL_28:
        v38 = *__error();
        close(v25);
        *__error() = v38;
        goto LABEL_29;
      }
      brc_bread_crumbs();
      v15 = (unsigned int *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
      {
        v49 = *__error();
        v54 = 67110146;
        *(_DWORD *)v55 = fd;
        *(_WORD *)&v55[4] = 2112;
        *(_QWORD *)&v55[6] = v12;
        *(_WORD *)&v55[14] = 2112;
        *(_QWORD *)&v55[16] = v13;
        *(_WORD *)&v55[24] = 1024;
        *(_DWORD *)&v55[26] = v49;
        v56[0] = 2112;
        *(_QWORD *)&v56[1] = v15;
        _os_log_debug_impl(&dword_1CBD43000, v27, OS_LOG_TYPE_DEBUG, "[DEBUG] openat(%d, '%@') failed, base:%@ %{errno}d%@", (uint8_t *)&v54, 0x2Cu);
      }
      goto LABEL_22;
    }
LABEL_15:
    v26 = 1;
    goto LABEL_23;
  }
  parentFileID = self->_parentFileID;
  v9 = -[BRCRelativePath fileID](basePath, "fileID");
  v10 = self->_basePath;
  if (parentFileID != v9)
  {
    v13 = v10;
    fd = self->_basePath->_fd;
    -[NSString stringByDeletingLastPathComponent](self->_relativePath, "stringByDeletingLastPathComponent");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if ((int)fd < 1)
      goto LABEL_15;
    goto LABEL_12;
  }
  if (v10->_fd < 0)
  {
    v13 = 0;
    v14 = 0;
    v26 = 0;
    goto LABEL_23;
  }
  v11 = ((uint64_t (*)(uint64_t (**)(id, _QWORD)))v6[2])(v6);
  v12 = 0;
  v13 = 0;
LABEL_29:
  if (a4)
    *a4 = v11;
  v39 = v11 == 0;
LABEL_42:

  return v39;
}

- (BOOL)isEqual:(id)a3
{
  BRCRelativePath *v4;
  BOOL v5;

  v4 = (BRCRelativePath *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[BRCRelativePath isEqualToRelativePath:](self, "isEqualToRelativePath:", v4);
  }

  return v5;
}

- (BOOL)isEqualToRelativePath:(id)a3
{
  BRCRelativePath *v4;
  BRCRelativePath *v5;
  BOOL v6;
  unint64_t v7;

  v4 = (BRCRelativePath *)a3;
  v5 = v4;
  if (self == v4)
  {
    v6 = 1;
  }
  else if (self->_basePath == v4->_basePath)
  {
    if (-[BRCRelativePath isResolved](self, "isResolved") && -[BRCRelativePath isResolved](v5, "isResolved"))
    {
      v7 = -[BRCRelativePath fileID](self, "fileID");
      v6 = v7 == -[BRCRelativePath fileID](v5, "fileID");
    }
    else
    {
      v6 = -[NSString isEqualToString:](self->_relativePath, "isEqualToString:", v5->_relativePath);
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (NSString)faultDisplayName
{
  void *v3;
  void *v4;
  void *v6;
  NSObject *v7;

  if (!-[BRCRelativePath isFault](self, "isFault"))
  {
    brc_bread_crumbs();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      -[BRCRelativePath logicalName].cold.2();

  }
  -[BRCRelativePath physicalURL](self, "physicalURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)_CFURLCopyLogicalNameOfPromiseAtURL();

  return (NSString *)v4;
}

- (BRCBookmark)bookmark
{
  void *v4;
  NSObject *v5;

  if (!-[BRCRelativePath isBRAlias](self, "isBRAlias"))
  {
    brc_bread_crumbs();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      -[BRCRelativePath bookmark].cold.1();

  }
  return self->_bookmark;
}

- (NSData)quarantineInfo
{
  return self->_quarantineInfo;
}

- (NSData)xattrs
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t fd;
  NSData *v8;
  id v9;
  NSData *xattrs;
  void *v11;
  NSObject *v12;
  void *v14;
  NSObject *v15;
  id v16;
  uint8_t buf[4];
  BRCRelativePath *v18;
  __int16 v19;
  id v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if ((*((_BYTE *)self + 192) & 4) == 0)
  {
    brc_mutex_lock(&self->_mutex.pthread);
    if ((*((_BYTE *)self + 192) & 4) == 0)
    {
      if (self->_fd < 0)
      {
        brc_bread_crumbs();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
          -[BRCRelativePath logicalName].cold.1();

      }
      -[BRCRelativePath appLibrary](self, "appLibrary");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "mangledID");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "maxXattrBlobSize");

      fd = self->_fd;
      v16 = 0;
      +[BRFieldXattrBlob loadXattrsFromFD:withMaximumSize:error:](BRFieldXattrBlob, "loadXattrsFromFD:withMaximumSize:error:", fd, v6, &v16);
      v8 = (NSData *)objc_claimAutoreleasedReturnValue();
      v9 = v16;
      xattrs = self->_xattrs;
      self->_xattrs = v8;

      if (v9)
      {
        brc_bread_crumbs();
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412802;
          v18 = self;
          v19 = 2112;
          v20 = v9;
          v21 = 2112;
          v22 = v11;
          _os_log_impl(&dword_1CBD43000, v12, OS_LOG_TYPE_DEFAULT, "[WARNING] Failed to resolve xattrs for %@: %@%@", buf, 0x20u);
        }

      }
      *((_BYTE *)self + 192) |= 4u;

    }
    brc_mutex_unlock(&self->_mutex.pthread);
  }
  return self->_xattrs;
}

- (NSString)sharedItemBookmark
{
  void *v3;
  void *v4;
  NSString *v5;
  NSString *sharedItemBookmark;

  if ((*((_BYTE *)self + 192) & 8) == 0)
  {
    brc_mutex_lock(&self->_mutex.pthread);
    if ((*((_BYTE *)self + 192) & 8) == 0)
    {
      BRCGetXattrValueForKeyOnFD(self->_fd, self->_absolutePath, CFSTR("com.apple.clouddocs.private.share-bookmark#B"));
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      if (v3)
      {
        v5 = v3;
      }
      else
      {
        BRCGetXattrValueForKeyOnFD(self->_fd, self->_absolutePath, CFSTR("com.apple.finder.copy.preserveinbackups.com.apple.clouddocs.private.share-bookmark#N"));
        v5 = (NSString *)objc_claimAutoreleasedReturnValue();
      }
      sharedItemBookmark = self->_sharedItemBookmark;
      self->_sharedItemBookmark = v5;

      *((_BYTE *)self + 192) |= 8u;
    }
    brc_mutex_unlock(&self->_mutex.pthread);
  }
  return self->_sharedItemBookmark;
}

- (NSString)itemSyncPausedByBundleID
{
  NSString *v3;
  NSString *itemSyncPausedByBundleID;

  if ((*((_BYTE *)self + 192) & 0x40) == 0)
  {
    brc_mutex_lock(&self->_mutex.pthread);
    if ((*((_BYTE *)self + 192) & 0x40) == 0)
    {
      BRCGetXattrValueForKeyOnFD(self->_fd, self->_absolutePath, CFSTR("com.apple.clouddocs.private.item-sync-paused-by-bundle-id#N"));
      v3 = (NSString *)objc_claimAutoreleasedReturnValue();
      itemSyncPausedByBundleID = self->_itemSyncPausedByBundleID;
      self->_itemSyncPausedByBundleID = v3;

      *((_BYTE *)self + 192) |= 0x40u;
    }
    brc_mutex_unlock(&self->_mutex.pthread);
  }
  return self->_itemSyncPausedByBundleID;
}

- (NSNumber)itemSyncPausedExpireTS
{
  void *v3;
  void *v4;
  NSNumber *v5;
  NSNumber *itemSyncPausedExpireTS;

  if ((*((char *)self + 192) & 0x80000000) == 0)
  {
    brc_mutex_lock(&self->_mutex.pthread);
    if ((*((char *)self + 192) & 0x80000000) == 0)
    {
      BRCGetXattrValueForKeyOnFD(self->_fd, self->_absolutePath, CFSTR("com.apple.clouddocs.private.item-sync-paused-expire-timestamp#N"));
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      if (v3)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v3, "longLongValue"));
        v5 = (NSNumber *)objc_claimAutoreleasedReturnValue();
        itemSyncPausedExpireTS = self->_itemSyncPausedExpireTS;
        self->_itemSyncPausedExpireTS = v5;
      }
      else
      {
        itemSyncPausedExpireTS = self->_itemSyncPausedExpireTS;
        self->_itemSyncPausedExpireTS = 0;
      }

      *((_BYTE *)self + 192) |= 0x80u;
    }
    brc_mutex_unlock(&self->_mutex.pthread);
  }
  return self->_itemSyncPausedExpireTS;
}

- (unint64_t)hash
{
  return -[NSString hash](self->_absolutePath, "hash");
}

- (unint64_t)parentHash
{
  void *v2;
  unint64_t v3;

  -[NSString stringByDeletingLastPathComponent](self->_absolutePath, "stringByDeletingLastPathComponent");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (id)description
{
  id v3;
  unint64_t mode;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSData *quarantineInfo;
  const __CFString *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t fsGenerationID;
  uint64_t v21;
  void *v22;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  if (!-[BRCRelativePath isResolved](self, "isResolved"))
  {
    v17 = (void *)MEMORY[0x1E0CB3940];
    if (self->_absolutePath)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("path:'%@' unresolved"), self->_absolutePath);
      v3 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[BRCRelativePath absolutePath](self->_basePath, "absolutePath");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "stringWithFormat:", CFSTR("path:'%@/%@' unresolved"), v18, self->_relativePath);
      v3 = (id)objc_claimAutoreleasedReturnValue();

    }
    return v3;
  }
  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  objc_msgSend(v3, "appendFormat:", CFSTR("path:'%@' parentFileID:%llu"), self->_absolutePath, self->_parentFileID);
  if (!-[BRCRelativePath exists](self, "exists"))
    return v3;
  objc_msgSend(v3, "appendFormat:", CFSTR(" fileID:%llu"), self->_fileID);
  objc_msgSend(v3, "appendFormat:", CFSTR(" size:%llu"), self->_size);
  objc_msgSend(v3, "appendFormat:", CFSTR(" mtime:%lu"), self->_mtime.tv_sec);
  mode = self->_mode;
  v5 = aPcDBLSW[mode >> 12];
  v6 = 120;
  if ((mode & 1) != 0)
    v7 = 120;
  else
    v7 = 45;
  v8 = 119;
  if ((mode & 2) != 0)
    v9 = 119;
  else
    v9 = 45;
  v26 = v9;
  if ((mode & 4) != 0)
    v10 = 114;
  else
    v10 = 45;
  if ((mode & 8) != 0)
    v11 = 120;
  else
    v11 = 45;
  v24 = v11;
  v25 = v10;
  if ((mode & 0x10) != 0)
    v12 = 119;
  else
    v12 = 45;
  if ((mode & 0x20) != 0)
    v13 = 114;
  else
    v13 = 45;
  if ((mode & 0x40) == 0)
    v6 = 45;
  if ((mode & 0x80) == 0)
    v8 = 45;
  if ((mode & 0x100) != 0)
    v14 = 114;
  else
    v14 = 45;
  objc_msgSend(v3, "appendFormat:", CFSTR(" mode:%c%c%c%c%c%c%c%c%c%c"), v5, v14, v8, v6, v13, v12, v24, v25, v26, v7);
  quarantineInfo = self->_quarantineInfo;
  if (quarantineInfo)
    objc_msgSend(v3, "appendFormat:", CFSTR(" quarantine:%u"), -[NSData br_qtnFlags](quarantineInfo, "br_qtnFlags"));
  if (-[BRCRelativePath isBRAlias](self, "isBRAlias"))
  {
    v16 = CFSTR(" br-alias");
LABEL_37:
    objc_msgSend(v3, "appendString:", v16);
    goto LABEL_38;
  }
  if (-[BRCRelativePath isFinderAlias](self, "isFinderAlias"))
  {
    v16 = CFSTR(" finder-alias");
    goto LABEL_37;
  }
LABEL_38:
  if (-[BRCRelativePath isDocument](self, "isDocument"))
    objc_msgSend(v3, "appendFormat:", CFSTR(" documentID:%u"), self->_documentID);
  LODWORD(v19) = self->_fd;
  if ((int)v19 < 0)
    v19 = 0xFFFFFFFFLL;
  else
    v19 = v19;
  fsGenerationID = self->_fsGenerationID;
  v21 = atomic_load((unsigned int *)&self->_openRefCount);
  objc_msgSend(v3, "appendFormat:", CFSTR(" generationID:%u fd:%d refs:%u"), fsGenerationID, v19, v21);
  -[BRCAppLibrary appLibraryID](self->_appLibrary, "appLibraryID");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" appLibrary:%@"), v22);

  return v3;
}

- (BRCAccountSession)session
{
  return self->_session;
}

- (void)setAppLibrary:(id)a3
{
  objc_storeStrong((id *)&self->_appLibrary, a3);
}

- (void)setType:(unsigned __int16)a3
{
  self->_type = a3;
}

- (void)setItemScope:(unsigned __int8)a3
{
  self->_itemScope = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemSyncPausedExpireTS, 0);
  objc_storeStrong((id *)&self->_itemSyncPausedByBundleID, 0);
  objc_storeStrong((id *)&self->_sharedItemBookmark, 0);
  objc_storeStrong((id *)&self->_xattrs, 0);
  objc_storeStrong((id *)&self->_quarantineInfo, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_appLibrary, 0);
  objc_storeStrong((id *)&self->_generationID, 0);
  objc_storeStrong((id *)&self->_symlinkContent, 0);
  objc_storeStrong((id *)&self->_bookmark, 0);
  objc_storeStrong((id *)&self->_basePath, 0);
  objc_storeStrong((id *)&self->_relativePath, 0);
  objc_storeStrong((id *)&self->_absolutePath, 0);
  objc_storeStrong((id *)&self->_roots, 0);
}

- (void)initWithRootPath:session:.cold.1()
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

- (void)initWithRootPath:session:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: path.br_isAbsolutePath%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_initWithPath:relativeToRoot:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: _session%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)initWithFileID:root:session:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: fileID != 0ULL%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)pathWithChildAtPath:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: self.isUnixDir%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)pathWithChildAtPath:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: self.exists%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)pathOfPackageRoot
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: self.isInPackage%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)isPackageRoot
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: [self isResolved]%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)type
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: self.isResolved%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)isResolved
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: self.isRoot || self.basePath.isResolved%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)logicalName
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: self.isFault%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)symlinkContent
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: self.isSymLink%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)size
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: self.isFile%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_resolveBasePath:.cold.1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_4_0();
  _os_log_error_impl(&dword_1CBD43000, v0, (os_log_type_t)0x90u, "[ERROR] no base path%@", v1, 0xCu);
  OUTLINED_FUNCTION_2();
}

- (void)_resolveBasePath:.cold.2()
{
  NSObject *v0;
  uint8_t v1[40];

  OUTLINED_FUNCTION_11_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_8_0(&dword_1CBD43000, v0, (uint64_t)v0, "[DEBUG] can't open base path %@ %{errno}d%@", v1);
}

- (void)_resolveBasePath:.cold.3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_1(&dword_1CBD43000, v0, v1, "[CRIT] UNREACHABLE: Detected unbound package resolution recursion for %@%@");
  OUTLINED_FUNCTION_2();
}

- (void)_resolveBasePath:.cold.4()
{
  uint64_t v0;
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  OUTLINED_FUNCTION_11_0(*MEMORY[0x1E0C80C00]);
  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4_1(&dword_1CBD43000, v1, v2, "[ERROR] relative package root path can not be equal to relative path = %@%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_2();
}

- (void)_resolveBasePath:.cold.5()
{
  NSObject *v0;
  uint8_t v1[40];

  OUTLINED_FUNCTION_11_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_8_0(&dword_1CBD43000, v0, (uint64_t)v0, "[DEBUG] can't open package root %@ %{errno}d%@", v1);
}

- (void)_resolveBasePath:.cold.6()
{
  uint64_t v0;
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  OUTLINED_FUNCTION_11_0(*MEMORY[0x1E0C80C00]);
  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v1, v2, "[DEBUG] package root %@ is not a directory%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_2();
}

- (void)_resolveBasePath:.cold.7()
{
  uint64_t v0;
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  OUTLINED_FUNCTION_11_0(*MEMORY[0x1E0C80C00]);
  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v1, v2, "[DEBUG] base path %@ is not a directory%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_2();
}

- (void)_resolveBasePath:.cold.8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: _basePath%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_resolveBasePath:.cold.9()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: _fd < 0%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_resolveRootWhenExists:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] UNREACHABLE: a root should always be openable%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_resolveRootWhenExists:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: !_basePath%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_resolveRootWhenExists:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: !_relativePath%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_resolveWhenExists
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] Inappropriate location or an alias at '%s'%@");
  OUTLINED_FUNCTION_2();
}

- (void)_resolveWhenDoesntExist
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: _basePath == nil || _basePath->_fd >= 0%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_resolveAndKeepOpenMustExist:allowResolveInPkg:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: value >= 0%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_resolveAndKeepOpenMustExist:allowResolveInPkg:error:.cold.2()
{
  uint64_t v0;
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  OUTLINED_FUNCTION_11_0(*MEMORY[0x1E0C80C00]);
  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v1, v2, "[DEBUG] resolved-path:'%@' is excluded%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_2();
}

- (void)_resolveAndKeepOpenMustExist:allowResolveInPkg:error:.cold.3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4_1(&dword_1CBD43000, v0, v1, "[ERROR] Exclude document for which we couldn't allocate a documentID for %@%@");
  OUTLINED_FUNCTION_2();
}

- (void)_resolveAndKeepOpenMustExist:allowResolveInPkg:error:.cold.4()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] fixed up bundle bit at %@%@");
  OUTLINED_FUNCTION_2();
}

- (void)_resolveAndKeepOpenMustExist:allowResolveInPkg:error:.cold.5()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] package without the bundle bit at %@%@");
  OUTLINED_FUNCTION_2();
}

- (void)_resolveAndKeepOpenMustExist:allowResolveInPkg:error:.cold.6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: _documentID > 0%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_resolveAndKeepOpenMustExist:allowResolveInPkg:error:.cold.7()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] absolute path is excluded because it is a package %@%@");
  OUTLINED_FUNCTION_2();
}

- (void)_resolveAndKeepOpenMustExist:allowResolveInPkg:error:.cold.9()
{
  uint64_t v0;
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  OUTLINED_FUNCTION_11_0(*MEMORY[0x1E0C80C00]);
  LODWORD(v3) = 134218242;
  *(_QWORD *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v1, v2, "[DEBUG] openbyid_np(%lld) failed: the file was unlinked%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_2();
}

- (void)_resolveAndKeepOpenMustExist:allowResolveInPkg:error:.cold.10()
{
  uint64_t v0;
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  OUTLINED_FUNCTION_11_0(*MEMORY[0x1E0C80C00]);
  LODWORD(v3) = 134218242;
  *(_QWORD *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v1, v2, "[DEBUG] openbyid_np(%lld) failed: the file still exists, but we don't have access to it%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_2();
}

- (void)_resolveAndKeepOpenMustExist:allowResolveInPkg:error:.cold.11()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: errno > 0%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_resolveAndKeepOpenMustExist:allowResolveInPkg:error:.cold.13()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: _fileID%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_resolveAndKeepOpenMustExist:allowResolveInPkg:error:.cold.15()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: _absolutePath.br_isAbsolutePath%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_resolveAndKeepOpenMustExist:allowResolveInPkg:error:.cold.17()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: _basePath->_fd >= 0%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)performOnOpenParentFileDescriptor:(NSObject *)a3 error:.cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  int v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  int v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v6 = *__error();
  v8 = 138412802;
  v9 = a1;
  v10 = 1024;
  v11 = v6;
  v12 = 2112;
  v13 = a2;
  OUTLINED_FUNCTION_8_0(&dword_1CBD43000, a3, v7, "[DEBUG] open('%@') failed %{errno}d%@", (uint8_t *)&v8);
}

- (void)performOnOpenParentFileDescriptor:error:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: _parentFileID > 0%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)bookmark
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: self.isBRAlias%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

@end
