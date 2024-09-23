@implementation BCSPathProvider

+ (id)sharedInstance
{
  if (_MergedGlobals_39 != -1)
    dispatch_once(&_MergedGlobals_39, &__block_literal_global_8);
  return (id)qword_253EC0A98;
}

void __33__BCSPathProvider_sharedInstance__block_invoke()
{
  BCSPathProvider *v0;
  void *v1;

  v0 = objc_alloc_init(BCSPathProvider);
  v1 = (void *)qword_253EC0A98;
  qword_253EC0A98 = (uint64_t)v0;

}

- (NSURL)documentsURL
{
  return (NSURL *)-[BCSPathProvider _setupStorageWithSearchPathDirectory:applyFileProtectionType:verificationToken:](self, "_setupStorageWithSearchPathDirectory:applyFileProtectionType:verificationToken:", 9, *MEMORY[0x24BDBCC18], &self->_documentsDirectoryFileProtectionLevelVerified);
}

- (NSURL)cachesURL
{
  return (NSURL *)-[BCSPathProvider _setupStorageWithSearchPathDirectory:applyFileProtectionType:verificationToken:](self, "_setupStorageWithSearchPathDirectory:applyFileProtectionType:verificationToken:", 13, *MEMORY[0x24BDBCC18], &self->_cachesDirectoryFileProtectionLevelVerified);
}

- (NSURL)tempURL
{
  void *v3;
  void (**v4)(void);
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDBCF48];
  -[BCSPathProvider temporaryDirectoryBuilder](self, "temporaryDirectoryBuilder");
  v4 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  v4[2]();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fileURLWithPath:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BCSPathProvider _setupStorageWithBaseFileURL:applyFileProtectionType:verificationToken:](self, "_setupStorageWithBaseFileURL:applyFileProtectionType:verificationToken:", v6, 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v7;
}

- (BCSPathProvider)init
{
  void *v3;
  BCSPathProvider *v4;

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[BCSPathProvider initWithFileManager:temporaryDirectoryBuilder:](self, "initWithFileManager:temporaryDirectoryBuilder:", v3, &__block_literal_global_5);

  return v4;
}

- (BCSPathProvider)initWithFileManager:(id)a3 temporaryDirectoryBuilder:(id)a4
{
  id v7;
  id v8;
  BCSPathProvider *v9;
  BCSPathProvider *v10;
  uint64_t v11;
  id temporaryDirectoryBuilder;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)BCSPathProvider;
  v9 = -[BCSPathProvider init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_fileManager, a3);
    v11 = MEMORY[0x20BD30274](v8);
    temporaryDirectoryBuilder = v10->_temporaryDirectoryBuilder;
    v10->_temporaryDirectoryBuilder = (id)v11;

  }
  return v10;
}

- (id)_setupStorageWithSearchPathDirectory:(unint64_t)a3 applyFileProtectionType:(id)a4 verificationToken:(BOOL *)a5
{
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  NSObject *v13;
  id v15;
  uint8_t buf[4];
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  -[BCSPathProvider fileManager](self, "fileManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  objc_msgSend(v9, "URLForDirectory:inDomain:appropriateForURL:create:error:", a3, 1, 0, 0, &v15);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v15;

  if (v10)
  {
    -[BCSPathProvider _setupStorageWithBaseFileURL:applyFileProtectionType:verificationToken:](self, "_setupStorageWithBaseFileURL:applyFileProtectionType:verificationToken:", v10, v8, a5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v11)
    {
      ABSLogCommon();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v17 = v11;
        _os_log_error_impl(&dword_20ACAD000, v13, OS_LOG_TYPE_ERROR, "Unable to determine directory from NSFileManager: %@", buf, 0xCu);
      }

    }
    v12 = 0;
  }

  return v12;
}

- (id)_setupStorageWithBaseFileURL:(id)a3 applyFileProtectionType:(id)a4 verificationToken:(BOOL *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  NSObject *v16;
  void *v17;
  char v18;
  id v19;
  NSObject *v20;
  uint64_t v21;
  int v22;
  id v23;
  NSObject *v24;
  NSObject *v25;
  void *v27;
  void *v28;
  id v29;
  id v30;
  uint8_t buf[4];
  id v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  if (v8)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "bundleIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "URLByAppendingPathComponent:isDirectory:", v11, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      -[BCSPathProvider fileManager](self, "fileManager");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "path");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v13, "fileExistsAtPath:", v14);

      if ((v15 & 1) == 0)
      {
        ABSLogCommon();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(v12, "path");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v32 = v27;
          _os_log_debug_impl(&dword_20ACAD000, v16, OS_LOG_TYPE_DEBUG, "Creating directory here: %@", buf, 0xCu);

        }
        -[BCSPathProvider fileManager](self, "fileManager");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = 0;
        v18 = objc_msgSend(v17, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v12, 1, 0, &v30);
        v19 = v30;

        if ((v18 & 1) == 0)
        {
          ABSLogCommon();
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v12, "path");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v32 = v28;
            v33 = 2112;
            v34 = v19;
            _os_log_error_impl(&dword_20ACAD000, v20, OS_LOG_TYPE_ERROR, "Error creating directory: %{public}@ - %@}", buf, 0x16u);

          }
          v12 = 0;
        }

      }
      if (v9 && v12 && (!a5 || !*a5))
      {
        v21 = *MEMORY[0x24BDBCC20];
        v29 = 0;
        v22 = objc_msgSend(v12, "setResourceValue:forKey:error:", v9, v21, &v29);
        v23 = v29;
        ABSLogCommon();
        v24 = objc_claimAutoreleasedReturnValue();
        v25 = v24;
        if (!v22 || v23)
        {
          if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v32 = v23;
            _os_log_error_impl(&dword_20ACAD000, v25, OS_LOG_TYPE_ERROR, "Failed to set the file protection level to class C on the caches directory, error: %@", buf, 0xCu);
          }

        }
        else
        {
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)buf = 0;
            _os_log_debug_impl(&dword_20ACAD000, v25, OS_LOG_TYPE_DEBUG, "Successfully set caches directory file protection level to class C", buf, 2u);
          }

          if (a5)
            *a5 = 1;
        }

      }
    }
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (NSURL)brandLogoCacheURL
{
  void *v2;
  void *v3;

  -[BCSPathProvider cachesURL](self, "cachesURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByAppendingPathComponent:isDirectory:", CFSTR("BrandLogos"), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v3;
}

- (BOOL)documentsDirectoryFileProtectionLevelVerified
{
  return self->_documentsDirectoryFileProtectionLevelVerified;
}

- (void)setDocumentsDirectoryFileProtectionLevelVerified:(BOOL)a3
{
  self->_documentsDirectoryFileProtectionLevelVerified = a3;
}

- (BOOL)cachesDirectoryFileProtectionLevelVerified
{
  return self->_cachesDirectoryFileProtectionLevelVerified;
}

- (void)setCachesDirectoryFileProtectionLevelVerified:(BOOL)a3
{
  self->_cachesDirectoryFileProtectionLevelVerified = a3;
}

- (BCSFileManagementProviding)fileManager
{
  return self->_fileManager;
}

- (void)setFileManager:(id)a3
{
  objc_storeStrong((id *)&self->_fileManager, a3);
}

- (id)temporaryDirectoryBuilder
{
  return self->_temporaryDirectoryBuilder;
}

- (void)setTemporaryDirectoryBuilder:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_temporaryDirectoryBuilder, 0);
  objc_storeStrong((id *)&self->_fileManager, 0);
}

@end
