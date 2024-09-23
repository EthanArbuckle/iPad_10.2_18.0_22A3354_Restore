@implementation MSDPreferencesFile

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global);
  return (id)sharedInstance_sharedInstance;
}

void __36__MSDPreferencesFile_sharedInstance__block_invoke()
{
  MSDPreferencesFile *v0;
  void *v1;

  v0 = objc_alloc_init(MSDPreferencesFile);
  v1 = (void *)sharedInstance_sharedInstance;
  sharedInstance_sharedInstance = (uint64_t)v0;

}

- (MSDPreferencesFile)init
{
  MSDPreferencesFile *v2;
  MSDPreferencesFile *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MSDPreferencesFile;
  v2 = -[MSDPreferencesFile init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[MSDPreferencesFile populateCache](v2, "populateCache");
  return v3;
}

+ (id)preferencesFilePath
{
  void *v2;
  void *v3;

  +[MSDPreferencesFile preferencesFileUrl](MSDPreferencesFile, "preferencesFileUrl");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "path");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (BOOL)preferencesFileExists
{
  void *v2;
  void *v3;
  char v4;

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[MSDPreferencesFile preferencesFilePath](MSDPreferencesFile, "preferencesFilePath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "fileExistsAtPath:", v3);

  return v4;
}

- (void)reload
{
  MSDPreferencesFile *obj;

  obj = self;
  objc_sync_enter(obj);
  -[MSDPreferencesFile populateCache](obj, "populateCache");
  objc_sync_exit(obj);

}

- (id)objectForKey:(id)a3
{
  id v4;
  MSDPreferencesFile *v5;
  void *v6;
  void *v7;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v4 = a3;
  if (v4)
  {
    v5 = self;
    objc_sync_enter(v5);
    -[MSDPreferencesFile cache](v5, "cache");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_sync_exit(v5);
  }
  else
  {
    defaultLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[MSDPreferencesFile objectForKey:].cold.1(v9, v10, v11, v12, v13, v14, v15, v16);

    v7 = 0;
  }

  return v7;
}

- (BOOL)setObject:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  MSDPreferencesFile *v10;
  void *v11;
  void *v12;
  BOOL v13;
  const char *v14;
  int v16;
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (!v6 || !v7)
  {
    defaultLogHandle();
    v10 = (MSDPreferencesFile *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v10->super, OS_LOG_TYPE_DEFAULT))
    {
      v16 = 136446210;
      v17 = "-[MSDPreferencesFile setObject:forKey:]";
      v14 = "%{public}s - Both object and key must be non-nil.";
LABEL_13:
      _os_log_impl(&dword_22A6E6000, &v10->super, OS_LOG_TYPE_DEFAULT, v14, (uint8_t *)&v16, 0xCu);
    }
LABEL_14:
    v13 = 0;
    goto LABEL_15;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    defaultLogHandle();
    v10 = (MSDPreferencesFile *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v10->super, OS_LOG_TYPE_DEFAULT))
    {
      v16 = 136446210;
      v17 = "-[MSDPreferencesFile setObject:forKey:]";
      v14 = "%{public}s - Key must be of type NSString.";
      goto LABEL_13;
    }
    goto LABEL_14;
  }
  if ((objc_msgSend(MEMORY[0x24BDD1770], "propertyList:isValidForFormat:", v6, 100) & 1) == 0)
    -[MSDPreferencesFile raiseInvalidPropertyListObjectExceptionForObject:](self, "raiseInvalidPropertyListObjectExceptionForObject:", v6);
  defaultLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    -[MSDPreferencesFile setObject:forKey:].cold.1((uint64_t)v8, (uint64_t)v6, v9);

  v10 = self;
  objc_sync_enter(v10);
  -[MSDPreferencesFile cache](v10, "cache");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSDPreferencesFile deepCopy:](v10, "deepCopy:", v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKey:", v12, v8);

  v13 = -[MSDPreferencesFile saveCache](v10, "saveCache");
  objc_sync_exit(v10);
LABEL_15:

  return v13;
}

- (BOOL)removeObjectForKey:(id)a3
{
  id v4;
  MSDPreferencesFile *v5;
  void *v6;
  BOOL v7;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v4 = a3;
  if (v4)
  {
    v5 = self;
    objc_sync_enter(v5);
    -[MSDPreferencesFile cache](v5, "cache");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeObjectForKey:", v4);

    v7 = -[MSDPreferencesFile saveCache](v5, "saveCache");
    objc_sync_exit(v5);

  }
  else
  {
    defaultLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[MSDPreferencesFile removeObjectForKey:].cold.1(v9, v10, v11, v12, v13, v14, v15, v16);

    v7 = 0;
  }

  return v7;
}

- (BOOL)removeObjectsForKeys:(id)a3
{
  id v4;
  MSDPreferencesFile *v5;
  void *v6;
  BOOL v7;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v4 = a3;
  if (v4)
  {
    v5 = self;
    objc_sync_enter(v5);
    -[MSDPreferencesFile cache](v5, "cache");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeObjectsForKeys:", v4);

    v7 = -[MSDPreferencesFile saveCache](v5, "saveCache");
    objc_sync_exit(v5);

  }
  else
  {
    defaultLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[MSDPreferencesFile removeObjectsForKeys:].cold.1(v9, v10, v11, v12, v13, v14, v15, v16);

    v7 = 0;
  }

  return v7;
}

- (void)populateCache
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  id v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  if (!+[MSDPreferencesFile preferencesFileExists](MSDPreferencesFile, "preferencesFileExists"))
  {
LABEL_7:
    v5 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    -[MSDPreferencesFile setCache:](self, "setCache:", v5);
    goto LABEL_8;
  }
  v3 = (void *)MEMORY[0x24BDBCE70];
  +[MSDPreferencesFile preferencesFileUrl](MSDPreferencesFile, "preferencesFileUrl");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  objc_msgSend(v3, "dictionaryWithContentsOfURL:error:", v4, &v10);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = v10;

  if (!v5)
  {
    defaultLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      +[MSDPreferencesFile preferencesFilePath](MSDPreferencesFile, "preferencesFilePath");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136446722;
      v12 = "-[MSDPreferencesFile populateCache]";
      v13 = 2114;
      v14 = v9;
      v15 = 2114;
      v16 = v6;
      _os_log_impl(&dword_22A6E6000, v8, OS_LOG_TYPE_DEFAULT, "%{public}s - Failed to read preferences file:  %{public}@ - Error:  %{public}@", buf, 0x20u);

    }
    goto LABEL_7;
  }

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithDictionary:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSDPreferencesFile setCache:](self, "setCache:", v7);

LABEL_8:
}

- (BOOL)saveCache
{
  void *v2;
  void *v3;
  char v4;
  id v5;
  NSObject *v6;
  void *v7;
  id v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  -[MSDPreferencesFile cache](self, "cache");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[MSDPreferencesFile preferencesFileUrl](MSDPreferencesFile, "preferencesFileUrl");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  v4 = objc_msgSend(v2, "writeToURL:error:", v3, &v9);
  v5 = v9;

  if ((v4 & 1) == 0)
  {
    defaultLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      +[MSDPreferencesFile preferencesFilePath](MSDPreferencesFile, "preferencesFilePath");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136446722;
      v11 = "-[MSDPreferencesFile saveCache]";
      v12 = 2114;
      v13 = v7;
      v14 = 2114;
      v15 = v5;
      _os_log_impl(&dword_22A6E6000, v6, OS_LOG_TYPE_DEFAULT, "%{public}s - Failed to save preferences file:  %{public}@ - Error:  %{public}@", buf, 0x20u);

    }
  }

  return v4;
}

- (void)raiseInvalidPropertyListObjectExceptionForObject:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint8_t buf[4];
  const char *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = a3;
  objc_msgSend(v3, "stringWithFormat:", CFSTR("Object %@ of type %@ is not a valid property list object."), v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", CFSTR("InvalidPropertyListObject"), v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  defaultLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v9 = "-[MSDPreferencesFile raiseInvalidPropertyListObjectExceptionForObject:]";
    v10 = 2114;
    v11 = v6;
    _os_log_impl(&dword_22A6E6000, v7, OS_LOG_TYPE_DEFAULT, "%{public}s - Exception:  %{public}@", buf, 0x16u);
  }

  objc_msgSend(v6, "raise");
}

+ (id)preferencesFileUrl
{
  if (preferencesFileUrl_onceToken != -1)
    dispatch_once(&preferencesFileUrl_onceToken, &__block_literal_global_10);
  return (id)preferencesFileUrl_fileUrl;
}

void __40__MSDPreferencesFile_preferencesFileUrl__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  id v3;

  objc_msgSend(CFSTR("/private/var/mnt/com.apple.mobilestoredemo.storage/com.apple.mobilestoredemo.blob/Metadata"), "stringByAppendingPathComponent:", CFSTR("com.apple.MobileStoreDemo"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringByAppendingPathExtension:", CFSTR("plist"));
  v3 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:isDirectory:", v3, 0);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)preferencesFileUrl_fileUrl;
  preferencesFileUrl_fileUrl = v1;

}

- (id)deepCopy:(id)a3
{
  return (id)(id)CFPropertyListCreateDeepCopy((CFAllocatorRef)*MEMORY[0x24BDBD240], a3, 0);
}

- (NSMutableDictionary)cache
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void)setCache:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cache, 0);
}

- (void)objectForKey:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_22A6E6000, a1, a3, "%{public}s - Key is nil.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)setObject:(os_log_t)log forKey:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 138543618;
  v4 = a1;
  v5 = 2114;
  v6 = a2;
  _os_log_debug_impl(&dword_22A6E6000, log, OS_LOG_TYPE_DEBUG, "Setting preference %{public}@:%{public}@", (uint8_t *)&v3, 0x16u);
  OUTLINED_FUNCTION_1();
}

- (void)removeObjectForKey:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_22A6E6000, a1, a3, "%{public}s - Key is nil.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)removeObjectsForKeys:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_22A6E6000, a1, a3, "%{public}s - Keys array pointer is nil.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

@end
