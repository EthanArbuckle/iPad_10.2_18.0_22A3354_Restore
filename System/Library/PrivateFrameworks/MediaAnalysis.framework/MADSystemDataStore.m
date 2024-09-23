@implementation MADSystemDataStore

+ (id)defaultDatabasePath
{
  uid_t v2;
  passwd *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v8;
  const char *v9;
  uint8_t *v10;
  __int16 v11;
  uint8_t buf[2];

  v2 = getuid();
  v3 = getpwuid(v2);
  if (!v3)
  {
    if ((int)MediaAnalysisLogLevel() < 3 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      return 0;
    v11 = 0;
    v8 = MEMORY[0x1E0C81028];
    v9 = "[MADSystemDataStore] Failed to query user info";
    v10 = (uint8_t *)&v11;
    goto LABEL_10;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v3->pw_dir);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "stringByAppendingPathComponent:", CFSTR("Library/MediaAnalysis/MediaAnalysis.sqlite"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    return v6;
  }
  if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    v8 = MEMORY[0x1E0C81028];
    v9 = "[MADSystemDataStore] Failed to query user home directory";
    v10 = buf;
LABEL_10:
    _os_log_impl(&dword_1B6C4A000, v8, OS_LOG_TYPE_ERROR, v9, v10, 2u);
  }
  return 0;
}

- (MADSystemDataStore)initWithManagedObjectModel:(id)a3
{
  id v4;
  MADSystemDataStore *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  id v15;
  void *v16;
  uint64_t v17;
  id v18;
  id v19;
  void *v20;
  int v21;
  uint64_t v22;
  NSManagedObjectContext *managedObjectContext;
  MADSystemDataStore *v24;
  MADSystemDataStore *v25;
  void *v27;
  id v28;
  id v29;
  objc_super v30;
  uint64_t v31;
  void *v32;
  uint8_t buf[4];
  id v34;
  _QWORD v35[4];
  _QWORD v36[6];

  v36[4] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)MADSystemDataStore;
  v5 = -[MADSystemDataStore init](&v30, sel_init);
  if (v5)
  {
    v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97C00]), "initWithManagedObjectModel:", v4);
    v6 = *MEMORY[0x1E0C97868];
    v35[0] = *MEMORY[0x1E0C978D0];
    v35[1] = v6;
    v36[0] = MEMORY[0x1E0C9AAB0];
    v36[1] = MEMORY[0x1E0C9AAB0];
    v7 = *MEMORY[0x1E0C97940];
    v35[2] = *MEMORY[0x1E0C979E0];
    v35[3] = v7;
    v8 = *MEMORY[0x1E0CB2AC0];
    v36[2] = &unk_1E6B76B20;
    v36[3] = v8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v36, v35, 4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "defaultDatabasePath");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
      if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[MADSystemDataStore] Failed to determine database path", buf, 2u);
      }

      goto LABEL_27;
    }
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringByDeletingLastPathComponent");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v11, "fileExistsAtPath:", v12) & 1) == 0)
    {
      if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v34 = v12;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[MADSystemDataStore] Creating %@", buf, 0xCu);
      }
      v31 = *MEMORY[0x1E0CB2AA8];
      v32 = &unk_1E6B72DB8;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v32, &v31, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = 0;
      v14 = objc_msgSend(v11, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v12, 1, v13, &v29);
      v15 = v29;

      if ((v14 & 1) == 0)
      {
        if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v34 = v15;
          _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to create MediaAnalysis directory for database (%@)", buf, 0xCu);
        }

        goto LABEL_27;
      }

    }
    if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v34 = v10;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[MADSystemDataStore] Opening %@", buf, 0xCu);
    }
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v10, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = *MEMORY[0x1E0C979E8];
    v28 = 0;
    v18 = (id)objc_msgSend(v27, "addPersistentStoreWithType:configuration:URL:options:error:", v17, 0, v16, v9, &v28);
    v19 = v28;
    v20 = v19;
    if (v19)
    {
      v21 = objc_msgSend(v19, "code");
      if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v34 = v20;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to create database (%@)", buf, 0xCu);
      }
    }
    else
    {
      v22 = objc_msgSend(objc_alloc(MEMORY[0x1E0C97B88]), "initWithConcurrencyType:", 1);
      managedObjectContext = v5->_managedObjectContext;
      v5->_managedObjectContext = (NSManagedObjectContext *)v22;

      -[NSManagedObjectContext setPersistentStoreCoordinator:](v5->_managedObjectContext, "setPersistentStoreCoordinator:", v27);
      -[NSManagedObjectContext setMergePolicy:](v5->_managedObjectContext, "setMergePolicy:", *MEMORY[0x1E0C978C8]);
      v21 = 0;
    }

    if (!v21)
      goto LABEL_22;
LABEL_27:
    v24 = 0;
    goto LABEL_28;
  }
LABEL_22:
  v24 = v5;
LABEL_28:
  v25 = v24;

  return v25;
}

+ (id)systemDataStore
{
  if (+[MADSystemDataStore systemDataStore]::once != -1)
    dispatch_once(&+[MADSystemDataStore systemDataStore]::once, &__block_literal_global_35);
  return (id)+[MADSystemDataStore systemDataStore]::database;
}

void __37__MADSystemDataStore_systemDataStore__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  MADSystemDataStore *v4;
  void *v5;
  os_log_type_t v6;
  NSObject *v7;
  const char *v8;
  int v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.MediaAnalysis"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  if (v0
    || (objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.mediaanalysisd")),
        (v0 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    objc_msgSend(v0, "pathForResource:ofType:", CFSTR("SystemDataStore"), CFSTR("momd"));
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v1)
    {
      if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        v9 = 138412290;
        v10 = 0;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[MADSystemDataStore] Missing model definition (%@)", (uint8_t *)&v9, 0xCu);
      }
      goto LABEL_23;
    }
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97B98]), "initWithContentsOfURL:", v2);
    if (v3)
    {
      v4 = -[MADSystemDataStore initWithManagedObjectModel:]([MADSystemDataStore alloc], "initWithManagedObjectModel:", v3);
      v5 = (void *)+[MADSystemDataStore systemDataStore]::database;
      +[MADSystemDataStore systemDataStore]::database = (uint64_t)v4;

      if (+[MADSystemDataStore systemDataStore]::database)
      {
        if ((int)MediaAnalysisLogLevel() < 5)
          goto LABEL_22;
        v6 = OS_LOG_TYPE_DEFAULT;
        if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
          goto LABEL_22;
        LOWORD(v9) = 0;
        v7 = MEMORY[0x1E0C81028];
        v8 = "[MADSystemDataStore] Successfully opened MediaAnalysis CoreData";
      }
      else
      {
        if ((int)MediaAnalysisLogLevel() < 3)
          goto LABEL_22;
        v6 = OS_LOG_TYPE_ERROR;
        if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          goto LABEL_22;
        LOWORD(v9) = 0;
        v7 = MEMORY[0x1E0C81028];
        v8 = "[MADSystemDataStore] Failed to open MediaAnalysis CoreData";
      }
    }
    else
    {
      if ((int)MediaAnalysisLogLevel() < 3)
        goto LABEL_22;
      v6 = OS_LOG_TYPE_ERROR;
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        goto LABEL_22;
      LOWORD(v9) = 0;
      v7 = MEMORY[0x1E0C81028];
      v8 = "[MADSystemDataStore] Failed to load embedding model";
    }
    _os_log_impl(&dword_1B6C4A000, v7, v6, v8, (uint8_t *)&v9, 2u);
LABEL_22:

LABEL_23:
    return;
  }
  if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    LOWORD(v9) = 0;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[MADSystemDataStore] Failed to load bundle", (uint8_t *)&v9, 2u);
  }
}

- (id)managedObjectContext
{
  return self->_managedObjectContext;
}

- (void)rollbackAndResetContext
{
  uint8_t v3[16];

  -[NSManagedObjectContext rollback](self->_managedObjectContext, "rollback");
  -[NSManagedObjectContext reset](self->_managedObjectContext, "reset");
  if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[MADSystemDataStore] Roll back and reset context", v3, 2u);
  }
}

- (BOOL)commitChangesOrRollback:(id *)a3
{
  NSManagedObjectContext *managedObjectContext;
  BOOL v5;
  id v6;
  id v8;
  uint8_t buf[4];
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  managedObjectContext = self->_managedObjectContext;
  v8 = 0;
  v5 = -[NSManagedObjectContext save:](managedObjectContext, "save:", &v8);
  v6 = v8;
  if (v5)
  {
    if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[MADSystemDataStore] Committed changes", buf, 2u);
    }
  }
  else
  {
    if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v10 = v6;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[MADSystemDataStore] Failed to commit changes (%@)", buf, 0xCu);
    }
    if (a3)
      *a3 = (id)objc_msgSend(v6, "copy");
  }

  return v5;
}

- (BOOL)commitChangesOrRollbackAndResetContext:(id *)a3
{
  NSManagedObjectContext *managedObjectContext;
  BOOL v6;
  id v7;
  id v9;
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  managedObjectContext = self->_managedObjectContext;
  v9 = 0;
  v6 = -[NSManagedObjectContext save:](managedObjectContext, "save:", &v9);
  v7 = v9;
  if (v6)
  {
    if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[MADSystemDataStore] Committed changes", buf, 2u);
    }
    -[NSManagedObjectContext reset](self->_managedObjectContext, "reset");
  }
  else
  {
    if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v11 = v7;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[MADSystemDataStore] Failed to commit changes (%@)", buf, 0xCu);
    }
    -[MADSystemDataStore rollbackAndResetContext](self, "rollbackAndResetContext");
    if (a3)
      *a3 = (id)objc_msgSend(v7, "copy");
  }

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_managedObjectContext, 0);
}

@end
