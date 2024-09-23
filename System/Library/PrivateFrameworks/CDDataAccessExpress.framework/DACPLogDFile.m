@implementation DACPLogDFile

- (DACPLogDFile)initWithFolder:(id)a3 baseName:(id)a4
{
  id v7;
  id v8;
  DACPLogDFile *v9;
  DACPLogDFile *v10;
  uint64_t v11;
  NSString *UUID;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)DACPLogDFile;
  v9 = -[DACPLogDFile init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_folder, a3);
    objc_storeStrong((id *)&v10->_baseName, a4);
    objc_msgSend(MEMORY[0x1E0CB3940], "DACPLogMakeUUID");
    v11 = objc_claimAutoreleasedReturnValue();
    UUID = v10->_UUID;
    v10->_UUID = (NSString *)v11;

    v10->_fd = -1;
  }

  return v10;
}

- (id)_filePathsMatchingPattern:(id)a3
{
  id v4;
  void *v5;
  DIR *v6;
  DIR *v7;
  void *v8;
  uint64_t v9;
  dirent *v10;
  dirent *v11;
  id v12;
  _BYTE *v13;
  int v14;
  char *v15;
  int v16;
  int v18;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = opendir(-[NSString fileSystemRepresentation](self->_folder, "fileSystemRepresentation"));
  if (v6)
  {
    v7 = v6;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), self->_baseName, v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "length");
    v10 = readdir(v7);
    if (v10)
    {
      v11 = v10;
      do
      {
        if (v9 == v11->d_namlen)
        {
          v12 = objc_retainAutorelease(v8);
          v13 = (_BYTE *)objc_msgSend(v12, "UTF8String");
          v14 = v11->d_name[0];
          if (v11->d_name[0])
          {
            v15 = &v11->d_name[1];
            while (1)
            {
              v16 = *v13;
              if (v16 != 63 && (!*v13 || v14 != v16))
                break;
              ++v13;
              v18 = *v15++;
              v14 = v18;
              if (!v18)
                goto LABEL_14;
            }
          }
          else
          {
LABEL_14:
            if (!*v13)
            {

              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@/%s"), self->_folder, v11->d_name);
              v12 = (id)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v5, "addObject:", v12);
            }
          }

        }
        v11 = readdir(v7);
      }
      while (v11);
    }
    closedir(v7);

  }
  objc_msgSend(v5, "sortUsingComparator:", &__block_literal_global_2);

  return v5;
}

uint64_t __42__DACPLogDFile__filePathsMatchingPattern___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

- (id)_getLatestMatchingFilePath
{
  void *v2;
  void *v3;

  -[DACPLogDFile _filePathsMatchingPattern:](self, "_filePathsMatchingPattern:", CFSTR("_????_??_??_??_??_???????.log"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "count"))
  {
    objc_msgSend(v2, "lastObject");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (void)_openFileOutDidCreateNewFile:(BOOL *)a3 outNewFilePath:(id *)a4
{
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  const char *v11;
  id v12;
  NSObject *v13;
  id v14;
  NSObject *v15;
  NSObject *v16;
  int fd;
  id v18;
  void *v19;
  BOOL v20;
  uint8_t buf[4];
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  -[DACPLogDFile _getLatestMatchingFilePath](self, "_getLatestMatchingFilePath");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@/.%@"), self->_folder, self->_baseName);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_retainAutorelease(v8);
    v11 = (const char *)objc_msgSend(v10, "fileSystemRepresentation");
    v12 = objc_retainAutorelease(v9);
    if (link(v11, (const char *)objc_msgSend(v12, "fileSystemRepresentation")))
    {
      DALoggingwithCategory(0);
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1C1D11000, v13, OS_LOG_TYPE_ERROR, "The log file has been deleted before we had a chance to open it.", buf, 2u);
      }

    }
    else
    {
      v14 = objc_retainAutorelease(v10);
      self->_fd = open((const char *)objc_msgSend(v14, "fileSystemRepresentation"), 9);
      DALoggingwithCategory(0);
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v22 = v14;
        _os_log_impl(&dword_1C1D11000, v15, OS_LOG_TYPE_INFO, "Opened existing log file for writing: %@", buf, 0xCu);
      }

      DALoggingwithCategory(0);
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        fd = self->_fd;
        *(_DWORD *)buf = 67109120;
        LODWORD(v22) = fd;
        _os_log_impl(&dword_1C1D11000, v16, OS_LOG_TYPE_INFO, "FD: %d", buf, 8u);
      }

      if ((self->_fd & 0x80000000) == 0)
      {
        objc_storeStrong((id *)&self->_path, v14);
        -[DACPLogDFile _beginWatchingFile](self, "_beginWatchingFile");
      }
    }

    if (v12)
    {
      v18 = objc_retainAutorelease(v12);
      unlink((const char *)objc_msgSend(v18, "fileSystemRepresentation"));

    }
  }
  if (self->_fd < 0 || !-[NSString length](self->_path, "length"))
  {
    -[DACPLogDFile _startNewFile](self, "_startNewFile");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v19 != 0;
    if (!a3)
      goto LABEL_20;
    goto LABEL_19;
  }
  v19 = 0;
  v20 = 0;
  if (a3)
LABEL_19:
    *a3 = v20;
LABEL_20:
  if (a4)
    *a4 = objc_retainAutorelease(v19);

}

- (void)_beginWatchingFile
{
  NSObject *v3;
  NSString *path;
  int fd;
  uintptr_t v6;
  NSObject *v7;
  dispatch_source_t v8;
  NSString *v9;
  int v10;
  NSObject *v11;
  uint64_t v12;
  NSObject *v13;
  NSString *v14;
  _QWORD v15[4];
  int v16;
  _QWORD handler[4];
  NSString *v18;
  DACPLogDFile *v19;
  dispatch_source_t v20;
  uint8_t buf[4];
  dispatch_source_t v22;
  __int16 v23;
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  DALoggingwithCategory(0);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    path = self->_path;
    fd = self->_fd;
    *(_DWORD *)buf = 138412546;
    v22 = (dispatch_source_t)path;
    v23 = 1024;
    v24 = fd;
    _os_log_impl(&dword_1C1D11000, v3, OS_LOG_TYPE_INFO, "Watching file: %@, FD: %d", buf, 0x12u);
  }

  v6 = self->_fd;
  _fileOpsQueue();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = dispatch_source_create(MEMORY[0x1E0C80DE8], v6, 1uLL, v7);

  objc_storeStrong((id *)&self->_fileEventDispatchSource, v8);
  v9 = self->_path;
  v10 = self->_fd;
  DALoggingwithCategory(0);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    v22 = v8;
    _os_log_impl(&dword_1C1D11000, v11, OS_LOG_TYPE_INFO, "Created new dispatch source %p", buf, 0xCu);
  }

  v12 = MEMORY[0x1E0C809B0];
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __34__DACPLogDFile__beginWatchingFile__block_invoke;
  handler[3] = &unk_1E7B9CA58;
  v18 = v9;
  v19 = self;
  v20 = v8;
  v13 = v8;
  v14 = v9;
  dispatch_source_set_event_handler(v13, handler);
  v15[0] = v12;
  v15[1] = 3221225472;
  v15[2] = __34__DACPLogDFile__beginWatchingFile__block_invoke_18;
  v15[3] = &__block_descriptor_36_e5_v8__0l;
  v16 = v10;
  dispatch_source_set_cancel_handler(v13, v15);
  dispatch_resume(v13);

}

void __34__DACPLogDFile__beginWatchingFile__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  char v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  DALoggingwithCategory(0);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v8 = 138412290;
    v9 = v3;
    _os_log_impl(&dword_1C1D11000, v2, OS_LOG_TYPE_INFO, "Received file event for file %@", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "fileExistsAtPath:", *(_QWORD *)(a1 + 32));

  if ((v5 & 1) == 0)
  {
    DALoggingwithCategory(0);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = *(_QWORD *)(a1 + 32);
      v8 = 138412290;
      v9 = v7;
      _os_log_impl(&dword_1C1D11000, v6, OS_LOG_TYPE_INFO, "Log file has been deleted: %@", (uint8_t *)&v8, 0xCu);
    }

    if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "isEqualToString:", *(_QWORD *)(a1 + 32)))
    {
      objc_msgSend(*(id *)(a1 + 40), "_closeFileWithFileEventDispatchSource:", *(_QWORD *)(a1 + 48));
      *(_BYTE *)(*(_QWORD *)(a1 + 40) + 56) = 1;
    }
    else
    {
      dispatch_source_cancel(*(dispatch_source_t *)(a1 + 48));
    }
  }
}

uint64_t __34__DACPLogDFile__beginWatchingFile__block_invoke_18(uint64_t a1)
{
  NSObject *v2;
  int v3;
  _DWORD v5[2];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  DALoggingwithCategory(0);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = *(_DWORD *)(a1 + 32);
    v5[0] = 67109120;
    v5[1] = v3;
    _os_log_impl(&dword_1C1D11000, v2, OS_LOG_TYPE_INFO, "Closing FD %d", (uint8_t *)v5, 8u);
  }

  return close(*(_DWORD *)(a1 + 32));
}

- (void)_closeFileWithFileEventDispatchSource:(id)a3
{
  NSObject *v4;
  NSObject *v5;
  NSString *path;
  int fd;
  NSString *v8;
  int v9;
  NSString *v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if ((self->_fd & 0x80000000) == 0)
  {
    v4 = a3;
    DALoggingwithCategory(0);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      path = self->_path;
      fd = self->_fd;
      v9 = 138412546;
      v10 = path;
      v11 = 1024;
      v12 = fd;
      _os_log_impl(&dword_1C1D11000, v5, OS_LOG_TYPE_INFO, "Closing file at %@, FD %d", (uint8_t *)&v9, 0x12u);
    }

    dispatch_source_cancel(v4);
    self->_fd = -1;
    v8 = self->_path;
    self->_path = 0;

  }
}

- (id)_startNewFile
{
  void *v3;
  int v4;
  BOOL v5;
  NSObject *v6;
  void *v7;
  NSString *v8;
  char v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  NSString *v13;
  int v14;
  void *v15;
  NSString *v16;
  NSString *baseName;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  NSString *v22;
  NSString *path;
  NSObject *v24;
  NSObject *v25;
  NSString *v26;
  NSString *v27;
  NSString *v28;
  NSString *folder;
  NSString *v30;
  NSObject *v31;
  NSObject *v32;
  NSString *v34;
  NSObject *v35;
  int fd;
  void *v37;
  id v38;
  id v39;
  const char *v40;
  id v41;
  NSObject *v42;
  NSObject *v43;
  NSString *v44;
  const char *v45;
  NSString *v46;
  id v47;
  int v48;
  int *v49;
  char *v50;
  NSObject *v51;
  uint32_t v52;
  id v53;
  char v54;
  uint8_t v55[4];
  _BYTE v56[24];
  stat buf;
  uint64_t v58;
  void *v59;
  uint64_t v60;
  _QWORD v61[3];

  v61[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = 1;
  v4 = objc_msgSend(v3, "fileExistsAtPath:isDirectory:", self->_folder, &v54);
  if (v4)
    v5 = v54 == 0;
  else
    v5 = 0;
  if (v5)
  {
    DALoggingwithCategory(0);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      folder = self->_folder;
      buf.st_dev = 138412290;
      *(_QWORD *)&buf.st_mode = folder;
      _os_log_impl(&dword_1C1D11000, v6, OS_LOG_TYPE_ERROR, "The file at path %@ is not a directory.", (uint8_t *)&buf, 0xCu);
    }
    goto LABEL_32;
  }
  if ((v4 & 1) == 0)
  {
    v60 = *MEMORY[0x1E0CB2AA8];
    v61[0] = &unk_1E7BA4048;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v61, &v60, 1);
    v6 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = self->_folder;
    v53 = 0;
    v9 = objc_msgSend(v7, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v8, 1, v6, &v53);
    v10 = v53;

    DALoggingwithCategory(0);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if ((v9 & 1) == 0)
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        v30 = self->_folder;
        buf.st_dev = 138412546;
        *(_QWORD *)&buf.st_mode = v30;
        WORD2(buf.st_ino) = 2112;
        *(__darwin_ino64_t *)((char *)&buf.st_ino + 6) = (__darwin_ino64_t)v10;
        _os_log_impl(&dword_1C1D11000, v12, OS_LOG_TYPE_ERROR, "Cannot create directory %@. Error: %@", (uint8_t *)&buf, 0x16u);
      }

      goto LABEL_31;
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v13 = self->_folder;
      buf.st_dev = 138412290;
      *(_QWORD *)&buf.st_mode = v13;
      _os_log_impl(&dword_1C1D11000, v12, OS_LOG_TYPE_INFO, "Created directory at path: %@", (uint8_t *)&buf, 0xCu);
    }

  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@/.%@"), self->_folder, self->_baseName);
  v6 = objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "fileExistsAtPath:", v6) & 1) != 0)
    goto LABEL_13;
  v58 = *MEMORY[0x1E0CB2AA8];
  v59 = &unk_1E7BA4060;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v59, &v58, 1);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "createFileAtPath:contents:attributes:", v6, 0, v10) & 1) == 0)
  {
    DALoggingwithCategory(0);
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      buf.st_dev = 138412290;
      *(_QWORD *)&buf.st_mode = v6;
      _os_log_impl(&dword_1C1D11000, v32, OS_LOG_TYPE_ERROR, "Cannot create temporary linked file at %@", (uint8_t *)&buf, 0xCu);
    }

LABEL_31:
LABEL_32:
    v28 = 0;
    goto LABEL_33;
  }

LABEL_13:
  v6 = objc_retainAutorelease(v6);
  v14 = open((const char *)-[NSObject fileSystemRepresentation](v6, "fileSystemRepresentation"), 9);
  self->_fd = v14;
  if (v14 < 0)
  {
    DALoggingwithCategory(0);
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      buf.st_dev = 138412290;
      *(_QWORD *)&buf.st_mode = v6;
      _os_log_impl(&dword_1C1D11000, v31, OS_LOG_TYPE_ERROR, "Cannot create temporary linked file at %@", (uint8_t *)&buf, 0xCu);
    }

    goto LABEL_32;
  }
  v15 = (void *)MEMORY[0x1E0CB3940];
  v16 = self->_folder;
  baseName = self->_baseName;
  if (_fileDateFormatter_onceToken != -1)
    dispatch_once(&_fileDateFormatter_onceToken, &__block_literal_global_119);
  v18 = (void *)MEMORY[0x1E0C99D68];
  v19 = (id)_fileDateFormatter_formatter;
  objc_msgSend(v18, "date");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "stringFromDate:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stringWithFormat:", CFSTR("%@/%@_%@.log"), v16, baseName, v21);
  v22 = (NSString *)objc_claimAutoreleasedReturnValue();
  path = self->_path;
  self->_path = v22;

  v6 = objc_retainAutorelease(v6);
  LODWORD(v20) = link((const char *)-[NSObject fileSystemRepresentation](v6, "fileSystemRepresentation"), -[NSString fileSystemRepresentation](self->_path, "fileSystemRepresentation"));
  DALoggingwithCategory(0);
  v24 = objc_claimAutoreleasedReturnValue();
  v25 = v24;
  if ((_DWORD)v20)
  {
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      v26 = self->_path;
      buf.st_dev = 138412290;
      *(_QWORD *)&buf.st_mode = v26;
      _os_log_impl(&dword_1C1D11000, v25, OS_LOG_TYPE_ERROR, "Cannot link file to path %@", (uint8_t *)&buf, 0xCu);
    }

    v27 = self->_path;
    self->_path = 0;

    close(self->_fd);
    v28 = 0;
    self->_fd = -1;
    goto LABEL_33;
  }
  if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
  {
    v34 = self->_path;
    buf.st_dev = 138412290;
    *(_QWORD *)&buf.st_mode = v34;
    _os_log_impl(&dword_1C1D11000, v25, OS_LOG_TYPE_INFO, "Created new log file %@.", (uint8_t *)&buf, 0xCu);
  }

  DALoggingwithCategory(0);
  v35 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
  {
    fd = self->_fd;
    buf.st_dev = 67109120;
    *(_DWORD *)&buf.st_mode = fd;
    _os_log_impl(&dword_1C1D11000, v35, OS_LOG_TYPE_INFO, "FD: %d", (uint8_t *)&buf, 8u);
  }

  -[DACPLogDFile _beginWatchingFile](self, "_beginWatchingFile");
  v6 = objc_retainAutorelease(v6);
  unlink((const char *)-[NSObject fileSystemRepresentation](v6, "fileSystemRepresentation"));
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@/%@-latest.log"), self->_folder, self->_baseName);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  memset(&buf, 0, sizeof(buf));
  v38 = objc_retainAutorelease(v37);
  if (lstat((const char *)objc_msgSend(v38, "fileSystemRepresentation"), &buf))
  {
LABEL_41:
    -[NSString lastPathComponent](self->_path, "lastPathComponent");
    v39 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v40 = (const char *)objc_msgSend(v39, "fileSystemRepresentation");
    v41 = objc_retainAutorelease(v38);
    LODWORD(v40) = symlink(v40, (const char *)objc_msgSend(v41, "fileSystemRepresentation"));

    DALoggingwithCategory(0);
    v42 = objc_claimAutoreleasedReturnValue();
    v43 = v42;
    if ((_DWORD)v40)
    {
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
      {
        v44 = self->_path;
        *(_DWORD *)v55 = 138412290;
        *(_QWORD *)v56 = v44;
        v45 = "Could not create symlink to latest log file: %@";
LABEL_51:
        v51 = v43;
        v52 = 12;
        goto LABEL_52;
      }
    }
    else
    {
      if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
      {
        v46 = self->_path;
        *(_DWORD *)v55 = 138412546;
        *(_QWORD *)v56 = v41;
        *(_WORD *)&v56[8] = 2112;
        *(_QWORD *)&v56[10] = v46;
        _os_log_impl(&dword_1C1D11000, v43, OS_LOG_TYPE_INFO, "Created symlink link: %@. Destination: %@", v55, 0x16u);
      }

      v47 = objc_retainAutorelease(v41);
      if (!fchmodat(0, (const char *)objc_msgSend(v47, "fileSystemRepresentation"), 0x1FFu, 32))
        goto LABEL_54;
      DALoggingwithCategory(0);
      v43 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
      {
        v48 = *__error();
        v49 = __error();
        v50 = strerror(*v49);
        *(_DWORD *)v55 = 67109634;
        *(_DWORD *)v56 = v48;
        *(_WORD *)&v56[4] = 2080;
        *(_QWORD *)&v56[6] = v50;
        *(_WORD *)&v56[14] = 2112;
        *(_QWORD *)&v56[16] = v47;
        v45 = "Could not chmod symlink to latest log file. Error code: %d - message: %s. Symlink: %@";
        v51 = v43;
        v52 = 28;
LABEL_52:
        _os_log_impl(&dword_1C1D11000, v51, OS_LOG_TYPE_ERROR, v45, v55, v52);
        goto LABEL_53;
      }
    }
    goto LABEL_53;
  }
  if ((~buf.st_mode & 0xA000) == 0)
  {
    unlink((const char *)objc_msgSend(objc_retainAutorelease(v38), "fileSystemRepresentation"));
    goto LABEL_41;
  }
  DALoggingwithCategory(0);
  v43 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)v55 = 138412290;
    *(_QWORD *)v56 = v38;
    v45 = "The name of the symlink file clashes with an existing file: %@";
    goto LABEL_51;
  }
LABEL_53:

LABEL_54:
  if (self->_fileWasDeleted)
    self->_fileWasDeleted = 0;
  v28 = self->_path;

LABEL_33:
  return v28;
}

- (BOOL)logData:(id)a3 outDidCreateNewFile:(BOOL *)a4 outNewFilePath:(id *)a5
{
  id v8;
  int fd;
  id v10;
  id v11;
  BOOL v12;
  id v14;
  BOOL v15;

  v8 = a3;
  v15 = 0;
  fd = self->_fd;
  if (fd < 0)
  {
    v14 = 0;
    -[DACPLogDFile _openFileOutDidCreateNewFile:outNewFilePath:](self, "_openFileOutDidCreateNewFile:outNewFilePath:", &v15, &v14);
    v10 = v14;
    fd = self->_fd;
    if (fd < 0)
    {
      v12 = 0;
      goto LABEL_9;
    }
  }
  else
  {
    v10 = 0;
  }
  v11 = objc_retainAutorelease(v8);
  write(fd, (const void *)objc_msgSend(v11, "bytes"), objc_msgSend(v11, "length"));
  if (a4)
    *a4 = v15;
  if (a5)
  {
    v10 = objc_retainAutorelease(v10);
    *a5 = v10;
  }
  v12 = 1;
LABEL_9:

  return v12;
}

- (id)startNewFile
{
  OS_dispatch_source *fileEventDispatchSource;

  -[DACPLogDFile _closeFileWithFileEventDispatchSource:](self, "_closeFileWithFileEventDispatchSource:", self->_fileEventDispatchSource);
  fileEventDispatchSource = self->_fileEventDispatchSource;
  self->_fileEventDispatchSource = 0;

  return -[DACPLogDFile _startNewFile](self, "_startNewFile");
}

- (void)checkForMaximumFileSize:(int64_t)a3 wantsCompressed:(BOOL)a4 outDidCreateNewFile:(BOOL *)a5 outNewFilePath:(id *)a6
{
  _BOOL4 v8;
  id v11;
  NSObject *v12;
  NSString *path;
  void *v14;
  NSString *v15;
  void *v16;
  id v17;
  NSObject *v18;
  NSString *v19;
  id v20;
  OS_dispatch_source *fileEventDispatchSource;
  uint64_t v22;
  NSObject *v23;
  NSString *folder;
  void *v25;
  void *v26;
  NSString *v27;
  FILE *v28;
  FILE *v29;
  id v30;
  FILE *v31;
  int v32;
  int v33;
  NSObject *v34;
  NSObject *v35;
  NSObject *v36;
  void *v37;
  FILE *v38;
  void *v39;
  NSString *v40;
  id v41;
  id v42;
  id v43;
  BOOL v44;
  uint8_t buf[4];
  NSString *v46;
  __int16 v47;
  id v48;
  __int16 v49;
  NSObject *v50;
  uint64_t v51;

  v8 = a4;
  v51 = *MEMORY[0x1E0C80C00];
  v44 = 0;
  if ((self->_fd & 0x80000000) == 0)
  {
    v11 = 0;
LABEL_3:
    DALoggingwithCategory(0);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      path = self->_path;
      *(_DWORD *)buf = 138412290;
      v46 = path;
      _os_log_impl(&dword_1C1D11000, v12, OS_LOG_TYPE_INFO, "Checking size of log file at path %@", buf, 0xCu);
    }

    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = self->_path;
    v42 = 0;
    objc_msgSend(v14, "attributesOfItemAtPath:error:", v15, &v42);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v42;
    if (v17)
    {
      DALoggingwithCategory(0);
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        v19 = self->_path;
        *(_DWORD *)buf = 138412546;
        v46 = v19;
        v47 = 2112;
        v48 = v17;
        _os_log_impl(&dword_1C1D11000, v18, OS_LOG_TYPE_ERROR, "Cannot get attributes of file at path %@. Error: %@", buf, 0x16u);
      }

    }
    else
    {
      if ((a3 & 0x8000000000000000) == 0 && objc_msgSend(v16, "fileSize") > (unint64_t)a3)
      {
        v40 = self->_path;
        -[DACPLogDFile _closeFileWithFileEventDispatchSource:](self, "_closeFileWithFileEventDispatchSource:", self->_fileEventDispatchSource);
        fileEventDispatchSource = self->_fileEventDispatchSource;
        self->_fileEventDispatchSource = 0;

        -[DACPLogDFile _startNewFile](self, "_startNewFile");
        v22 = objc_claimAutoreleasedReturnValue();

        v44 = v22 != 0;
        if (v8)
        {
          getpid();
          proc_disable_cpumon();
          DALoggingwithCategory(0);
          v23 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v46 = v40;
            _os_log_impl(&dword_1C1D11000, v23, OS_LOG_TYPE_INFO, "Compressing file at %@", buf, 0xCu);
          }

          -[NSString stringByAppendingPathExtension:](v40, "stringByAppendingPathExtension:", CFSTR("gz"));
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          folder = self->_folder;
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(".%@"), self->_baseName);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSString stringByAppendingPathComponent:](folder, "stringByAppendingPathComponent:", v25);
          v26 = (void *)objc_claimAutoreleasedReturnValue();

          v27 = objc_retainAutorelease(v40);
          v28 = fopen(-[NSString fileSystemRepresentation](v27, "fileSystemRepresentation"), "r");
          if (v28)
          {
            v29 = v28;
            v30 = objc_retainAutorelease(v26);
            v31 = fopen((const char *)objc_msgSend(v30, "fileSystemRepresentation"), "w");
            if (v31)
            {
              v37 = v26;
              v38 = v31;
              v32 = CPFileCompressionZDeflate();
              if (v32)
              {
                v33 = v32;
                DALoggingwithCategory(0);
                v34 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 67109120;
                  LODWORD(v46) = v33;
                  _os_log_impl(&dword_1C1D11000, v34, OS_LOG_TYPE_ERROR, "Could not compress file. Status: %d", buf, 8u);
                }
                v26 = v37;
              }
              else
              {
                v41 = 0;
                objc_msgSend(v14, "moveItemAtPath:toPath:error:", v30, v39, &v41);
                v36 = v41;
                if (v36)
                {
                  DALoggingwithCategory(0);
                  v35 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 138412802;
                    v46 = (NSString *)v30;
                    v47 = 2112;
                    v48 = v39;
                    v49 = 2112;
                    v50 = v36;
                    _os_log_impl(&dword_1C1D11000, v35, OS_LOG_TYPE_ERROR, "Could not move compressed file from %@ to %@. Error: %@", buf, 0x20u);
                  }

                  v34 = v36;
                }
                else
                {
                  objc_msgSend(v14, "removeItemAtPath:error:", v27, 0);
                  v34 = 0;
                }
              }

              fclose(v38);
            }
            fclose(v29);
          }
          getpid();
          proc_set_cpumon_defaults();

        }
        v11 = (id)v22;
      }
      if (a5)
        *a5 = v44;
      if (a6)
      {
        v11 = objc_retainAutorelease(v11);
        *a6 = v11;
      }
    }

    goto LABEL_41;
  }
  v43 = 0;
  -[DACPLogDFile _openFileOutDidCreateNewFile:outNewFilePath:](self, "_openFileOutDidCreateNewFile:outNewFilePath:", &v44, &v43);
  v20 = v43;
  v11 = v20;
  if (!v44)
  {
    if (self->_fd < 0)
      goto LABEL_41;
    goto LABEL_3;
  }
  if (a5)
    *a5 = 1;
  if (a6)
  {
    v11 = objc_retainAutorelease(v20);
    *a6 = v11;
  }
LABEL_41:

}

- (void)cullFilesMaxFileCount:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_opt_new();
  -[DACPLogDFile _filePathsMatchingPattern:](self, "_filePathsMatchingPattern:", CFSTR("_????_??_??_??_??_???????.log"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObjectsFromArray:", v6);

  -[DACPLogDFile _filePathsMatchingPattern:](self, "_filePathsMatchingPattern:", CFSTR("_????_??_??_??_??_???????.log.gz"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObjectsFromArray:", v7);

  objc_msgSend(v5, "sortUsingComparator:", &__block_literal_global_34);
  if ((a3 & 0x8000000000000000) == 0 && objc_msgSend(v5, "count") > (unint64_t)a3)
  {
    objc_msgSend(v5, "subarrayWithRange:", 0, objc_msgSend(v5, "count") + ~a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v10 = v8;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v17 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
          if ((objc_msgSend(v15, "isEqualToString:", self->_path, (_QWORD)v16) & 1) == 0)
            objc_msgSend(v9, "removeItemAtPath:error:", v15, 0);
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v12);
    }

  }
}

uint64_t __38__DACPLogDFile_cullFilesMaxFileCount___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

- (NSString)folder
{
  return self->_folder;
}

- (NSString)baseName
{
  return self->_baseName;
}

- (NSString)UUID
{
  return self->_UUID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileEventDispatchSource, 0);
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_UUID, 0);
  objc_storeStrong((id *)&self->_baseName, 0);
  objc_storeStrong((id *)&self->_folder, 0);
}

@end
