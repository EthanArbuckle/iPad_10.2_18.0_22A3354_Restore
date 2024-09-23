@implementation CallDBMetaInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dbInfoPrefFile, 0);
}

- (int64_t)readDatabaseVersion:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  int64_t v9;

  v3 = a3;
  v4 = (void *)MEMORY[0x1E0C99D80];
  -[CallDBMetaInfo dbInfoPrefFile](self, "dbInfoPrefFile");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dictionaryWithContentsOfURL:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    if (v3)
      v7 = CFSTR("DatabaseVersionTemp");
    else
      v7 = CFSTR("DatabaseVersionPerm");
    objc_msgSend(v6, "objectForKey:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      v9 = objc_msgSend(v8, "integerValue");
    else
      v9 = 0;

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (NSURL)dbInfoPrefFile
{
  return (NSURL *)objc_getProperty(self, a2, 8, 1);
}

- (CallDBMetaInfo)initWithURL:(id)a3
{
  id v4;
  CallDBMetaInfo *v5;
  uint64_t v6;
  NSURL *dbInfoPrefFile;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CallDBMetaInfo;
  v5 = -[CallDBMetaInfo init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "URLByAppendingPathComponent:", CFSTR("com.apple.callhistory.databaseInfo.plist"));
    v6 = objc_claimAutoreleasedReturnValue();
    dbInfoPrefFile = v5->_dbInfoPrefFile;
    v5->_dbInfoPrefFile = (NSURL *)v6;

  }
  return v5;
}

- (void)writeDatabaseVersion:(int64_t)a3 isTemp:(BOOL)a4
{
  _BOOL4 v4;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  char v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v4 = a4;
  v7 = (void *)MEMORY[0x1E0C99D80];
  -[CallDBMetaInfo dbInfoPrefFile](self, "dbInfoPrefFile");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dictionaryWithContentsOfURL:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(v9, "mutableCopy");

  if (!v10)
    v10 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    v12 = CFSTR("DatabaseVersionTemp");
  else
    v12 = CFSTR("DatabaseVersionPerm");
  objc_msgSend(v10, "setObject:forKey:", v11, v12);
  -[CallDBMetaInfo dbInfoPrefFile](self, "dbInfoPrefFile");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v10, "writeToURL:atomically:", v13, 1);

  if ((v14 & 1) == 0)
  {
    +[CHLogServer sharedInstance](CHLogServer, "sharedInstance");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "logHandleForDomain:", "CHDBMetaInfoDomain");
    v16 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[CallDBMetaInfo writeDatabaseVersion:isTemp:].cold.1(v16, v17, v18, v19, v20, v21, v22, v23);

  }
}

- (BOOL)validateInfo:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  NSURL **p_dbInfoPrefFile;
  void *v7;
  char v8;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  p_dbInfoPrefFile = &self->_dbInfoPrefFile;
  -[NSURL path](self->_dbInfoPrefFile, "path");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "isReadableFileAtPath:", v7);

  if ((v8 & 1) != 0)
    return -[CallDBMetaInfo readDatabaseVersion:](self, "readDatabaseVersion:", v3) == 34;
  +[CHLogServer sharedInstance](CHLogServer, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "logHandleForDomain:", "ch.calldbm");
  v11 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    -[CallDBMetaInfo validateInfo:].cold.1((uint64_t)p_dbInfoPrefFile, v11, v12, v13, v14, v15, v16, v17);

  return 0;
}

- (void)setDbInfoPrefFile:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void)writeDatabaseVersion:(uint64_t)a3 isTemp:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1B3FA4000, a1, a3, "Failed to synchronize preference domain: %{public}@", a5, a6, a7, a8, 2u);
}

- (void)validateInfo:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1B3FA4000, a2, a3, "File at path: %{public}@ is not readable", a5, a6, a7, a8, 2u);
}

@end
