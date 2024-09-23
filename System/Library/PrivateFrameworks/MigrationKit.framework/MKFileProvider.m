@implementation MKFileProvider

- (id)fetchRootPath
{
  NSString *rootPath;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  id v20;
  NSObject *v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  id v30;

  rootPath = self->_rootPath;
  if (rootPath)
    return rootPath;
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "containerURLForSecurityApplicationGroupIdentifier:", CFSTR("group.com.apple.FileProvider.LocalStorage"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v6, "URLByAppendingPathComponent:", CFSTR("File Provider Storage"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    +[MKLog log](MKLog, "log");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[MKFileProvider fetchRootPath].cold.3(v8, v9, v10, v11, v12, v13, v14, v15);

    v7 = 0;
  }
  objc_msgSend(v7, "path");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "fileExistsAtPath:", v16);

    if ((v18 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = 0;
      objc_msgSend(v19, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v16, 0, 0, &v30);
      v20 = v30;

      if (v20)
      {
        +[MKLog log](MKLog, "log");
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          -[MKFileProvider fetchRootPath].cold.2((uint64_t)self, (uint64_t)v20, v21);

      }
    }
    -[MKFileProvider setRootPath:](self, "setRootPath:", v16);
  }
  else
  {
    +[MKLog log](MKLog, "log");
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      -[MKFileProvider fetchRootPath].cold.1(v22, v23, v24, v25, v26, v27, v28, v29);

  }
  return v16;
}

- (NSString)rootPath
{
  return self->_rootPath;
}

- (void)setRootPath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rootPath, 0);
}

- (void)fetchRootPath
{
  OUTLINED_FUNCTION_0(&dword_21EC08000, a1, a3, "No Local File Storage container found.", a5, a6, a7, a8, 0);
}

@end
