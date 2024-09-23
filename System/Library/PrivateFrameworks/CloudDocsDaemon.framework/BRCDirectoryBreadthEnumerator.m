@implementation BRCDirectoryBreadthEnumerator

- (BRCDirectoryBreadthEnumerator)initWithParentPath:(id)a3 error:(int *)a4
{
  id v7;
  BRCDirectoryBreadthEnumerator *v8;
  id *v9;
  id v10;
  BRCDirectoryBreadthEnumerator *v11;
  int v12;
  void *v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD v26[4];
  id *v27;
  id v28;
  int v29;
  objc_super v30;
  uint8_t buf[4];
  id v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v30.receiver = self;
  v30.super_class = (Class)BRCDirectoryBreadthEnumerator;
  v8 = -[BRCDirectoryBreadthEnumerator init](&v30, sel_init);
  if (!v8)
    goto LABEL_7;
  v29 = 0;
  if ((objc_msgSend(v7, "resolveAndKeepOpenMustExist:error:", 1, &v29) & 1) == 0)
  {
    v12 = v29;
    if (a4)
      *a4 = v29;
    if (v12 == 45)
    {
      brc_bread_crumbs();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        -[BRCDirectoryBreadthEnumerator initWithParentPath:error:].cold.2((uint64_t)v13, v14);
    }
    else
    {
      brc_bread_crumbs();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v32 = v7;
        v33 = 2112;
        v34 = v13;
        _os_log_impl(&dword_1CBD43000, v14, OS_LOG_TYPE_DEFAULT, "[WARNING] Couldn't open parent path for breadth enumeration %@%@", buf, 0x16u);
      }
    }

    goto LABEL_20;
  }
  if ((objc_msgSend(v7, "isUnixDir") & 1) == 0)
  {
    brc_bread_crumbs();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
      -[BRCDirectoryBreadthEnumerator initWithParentPath:error:].cold.1((uint64_t)v18, v19, v20, v21, v22, v23, v24, v25);

  }
  if ((objc_msgSend(v7, "isExecutable") & 1) == 0)
  {
    brc_bread_crumbs();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v32 = v7;
      v33 = 2112;
      v34 = v15;
      _os_log_impl(&dword_1CBD43000, v16, OS_LOG_TYPE_DEFAULT, "[WARNING] cannot read content of %@%@", buf, 0x16u);
    }

    objc_msgSend(v7, "close");
    if (a4)
      *a4 = 8;
    goto LABEL_20;
  }
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __58__BRCDirectoryBreadthEnumerator_initWithParentPath_error___block_invoke;
  v26[3] = &unk_1E875DEB8;
  v9 = v8;
  v27 = v9;
  v10 = v7;
  v28 = v10;
  if ((objc_msgSend(v10, "performOnOpenFileDescriptor:error:", v26, a4) & 1) == 0)
  {
    objc_msgSend(v10, "close");

LABEL_20:
    v11 = 0;
    goto LABEL_21;
  }

  objc_storeStrong(v9 + 2, a3);
LABEL_7:
  v11 = v8;
LABEL_21:

  return v11;
}

uint64_t __58__BRCDirectoryBreadthEnumerator_initWithParentPath_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v9;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v9 = BRCOpenAt(a2, ".", 33028, a4, a5, a6, a7, a8, v14);
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) = fdopendir(v9);
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8))
    return 0;
  brc_bread_crumbs();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = *(_QWORD *)(a1 + 40);
    v14 = 138412546;
    v15 = v13;
    v16 = 2112;
    v17 = v11;
    _os_log_impl(&dword_1CBD43000, v12, OS_LOG_TYPE_DEFAULT, "[WARNING] Couldn't opendir parent path for breadth enumeration %@%@", (uint8_t *)&v14, 0x16u);
  }

  close(v9);
  return 9;
}

- (id)nextObjectWithIsDir:(BOOL *)a3 error:(int *)a4
{
  dirent *v7;
  dirent *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  BRCRelativePath *parentPath;
  void *v19;

  if (!self->_dir)
  {
    brc_bread_crumbs();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      -[BRCDirectoryBreadthEnumerator nextObjectWithIsDir:error:].cold.1((uint64_t)v10, v11, v12, v13, v14, v15, v16, v17);

    goto LABEL_12;
  }
  *__error() = 0;
  v7 = readdir((DIR *)self->_dir);
  if (!v7)
  {
LABEL_7:
    if (a4)
    {
      v9 = 0;
      *a4 = *__error();
      return v9;
    }
LABEL_12:
    v9 = 0;
    return v9;
  }
  v8 = v7;
  while (!strcmp(v8->d_name, ".") || !strcmp(v8->d_name, ".."))
  {
    v8 = readdir((DIR *)self->_dir);
    if (!v8)
      goto LABEL_7;
  }
  if (a3)
    *a3 = v8->d_type == 4;
  parentPath = self->_parentPath;
  objc_msgSend(MEMORY[0x1E0CB3940], "br_pathWithFileSystemRepresentation:", v8->d_name);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCRelativePath pathWithChildAtPath:](parentPath, "pathWithChildAtPath:", v19);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)dealloc
{
  $D3146017B65E73B7A250073618924F18 *dir;
  objc_super v4;

  dir = self->_dir;
  if (dir)
    closedir((DIR *)dir);
  -[BRCRelativePath close](self->_parentPath, "close");
  v4.receiver = self;
  v4.super_class = (Class)BRCDirectoryBreadthEnumerator;
  -[BRCDirectoryBreadthEnumerator dealloc](&v4, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parentPath, 0);
}

- (void)initWithParentPath:(uint64_t)a3 error:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, a2, a3, "[CRIT] Assertion failed: parentPath.isUnixDir%@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)initWithParentPath:(uint64_t)a1 error:(NSObject *)a2 .cold.2(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_1CBD43000, a2, OS_LOG_TYPE_DEBUG, "[DEBUG] ignoring excluded item in package%@", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_2();
}

- (void)nextObjectWithIsDir:(uint64_t)a3 error:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, a2, a3, "[CRIT] UNREACHABLE: no directory entry%@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

@end
