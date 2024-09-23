@implementation DBManager

+ (int64_t)versionForManagedObjectModel:(id)a3
{
  void *v3;
  void *v4;
  int64_t v5;
  void *v6;
  void *v7;
  NSObject *v8;
  int v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "versionIdentifiers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count") == 1)
  {
    objc_msgSend(v3, "anyObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "integerValue");

  }
  else
  {
    +[CHLogServer sharedInstance](CHLogServer, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "logHandleForDomain:", "ch.dbm");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = v7;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 134218240;
      v11 = v3;
      v12 = 2048;
      v13 = objc_msgSend(v3, "count");
      _os_log_impl(&dword_1B3FA4000, v8, OS_LOG_TYPE_DEFAULT, "Either version indentifier set is nil (%p) or has count not equal to 1 (%lu)", (uint8_t *)&v10, 0x16u);
    }

    v5 = 0;
  }

  return v5;
}

- (void)removeDataStoreAtLocation:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  char v8;
  NSObject *v9;
  NSObject *v10;
  id v11;
  uint8_t buf[4];
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    -[DBManager fPersistentStoreCoordinator](self, "fPersistentStoreCoordinator");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "persistentStoreForURL:", v4);
    v6 = objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[DBManager fPersistentStoreCoordinator](self, "fPersistentStoreCoordinator");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 0;
      v8 = objc_msgSend(v7, "removePersistentStore:error:", v6, &v11);
      v9 = v11;

      if ((v8 & 1) == 0)
      {
        -[CHLogger logHandle](self, "logHandle");
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          -[DBManager removeDataStoreAtLocation:].cold.2();

      }
    }
    else
    {
      -[CHLogger logHandle](self, "logHandle");
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v13 = v4;
        _os_log_impl(&dword_1B3FA4000, v9, OS_LOG_TYPE_DEFAULT, "Persistent store at URL %{public}@ is not present", buf, 0xCu);
      }
    }

  }
  else
  {
    -[CHLogger logHandle](self, "logHandle");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[DBManager addDataStoreAtLocation:isEncrypted:].cold.1();
  }

}

- (BOOL)addDataStoreAtLocation:(id)a3 isEncrypted:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  char DirectoryAtPath;
  void *v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  BOOL v15;
  NSObject *v16;
  id v18;

  v4 = a4;
  v6 = a3;
  if (v6)
  {
    objc_msgSend((id)objc_opt_class(), "persistentStoreOptionsWithURL:isEncrypted:", v6, v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "URLByDeletingLastPathComponent");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    getDBDirCreateOptions();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    DirectoryAtPath = createDirectoryAtPath(v8, v9);

    if ((DirectoryAtPath & 1) != 0)
    {
      -[DBManager fPersistentStoreCoordinator](self, "fPersistentStoreCoordinator");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = *MEMORY[0x1E0C979E8];
      v18 = 0;
      objc_msgSend(v11, "addPersistentStoreWithType:configuration:URL:options:error:", v12, 0, v6, v7, &v18);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v18;

      if (v13)
      {
        v15 = 1;
LABEL_14:

        goto LABEL_15;
      }
      -[CHLogger logHandle](self, "logHandle");
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        -[DBManager addDataStoreAtLocation:isEncrypted:].cold.2();
    }
    else
    {
      -[CHLogger logHandle](self, "logHandle");
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        -[DBManager addDataStoreAtLocation:isEncrypted:].cold.3();
      v14 = 0;
    }

    v15 = 0;
    goto LABEL_14;
  }
  -[CHLogger logHandle](self, "logHandle");
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    -[DBManager addDataStoreAtLocation:isEncrypted:].cold.1();
  v15 = 0;
LABEL_15:

  return v15;
}

- (id)createManagedObjectContext
{
  id v3;

  -[DBManager fPersistentStoreCoordinator](self, "fPersistentStoreCoordinator");
  v3 = (id)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0C97B88]);
    objc_msgSend(v3, "setPersistentStoreCoordinator:", self->fPersistentStoreCoordinator);
  }
  return v3;
}

- (NSPersistentStoreCoordinator)fPersistentStoreCoordinator
{
  return self->fPersistentStoreCoordinator;
}

+ (id)persistentStoreOptionsWithURL:(id)a3 isEncrypted:(BOOL)a4
{
  _BOOL4 v4;
  void *v5;
  void *v6;
  _QWORD *v7;
  void *v8;

  v4 = a4;
  +[CHPersistentStoreDescription persistentStoreDescriptionWithURL:](CHPersistentStoreDescription, "persistentStoreDescriptionWithURL:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  v7 = (_QWORD *)MEMORY[0x1E0CB2AE0];
  if (v4)
    v7 = (_QWORD *)MEMORY[0x1E0CB2AC0];
  objc_msgSend(v5, "setOption:forKey:", *v7, *MEMORY[0x1E0C97940]);
  objc_msgSend(v6, "options");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (int64_t)isDataStoreAtURLInitialized:(id)a3 withModelAtURL:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  int64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  id v22;
  uint8_t buf[4];
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (v5 && v6)
  {
    v8 = *MEMORY[0x1E0C979E8];
    v22 = 0;
    objc_msgSend(MEMORY[0x1E0C97C00], "metadataForPersistentStoreOfType:URL:error:", v8, v5, &v22);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v22;
    v11 = v10;
    if (!v9)
    {
      v16 = -[NSObject code](v10, "code");
      +[CHLogServer sharedInstance](CHLogServer, "sharedInstance");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "logHandleForDomain:", "ch.dbm");
      v13 = objc_claimAutoreleasedReturnValue();

      if (v16 == 260)
      {
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v24 = v5;
          _os_log_impl(&dword_1B3FA4000, v13, OS_LOG_TYPE_DEFAULT, "Data store at path %{public}@ does not exist", buf, 0xCu);
        }
      }
      else if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        +[DBManager isDataStoreAtURLInitialized:withModelAtURL:].cold.2();
      }
      v14 = 1;
      goto LABEL_23;
    }
    v12 = objc_msgSend(objc_alloc(MEMORY[0x1E0C97B98]), "initWithContentsOfURL:", v7);
    v13 = v12;
    if (v12)
    {
      if ((-[NSObject isConfiguration:compatibleWithStoreMetadata:](v12, "isConfiguration:compatibleWithStoreMetadata:", 0, v9) & 1) != 0)
      {
        v14 = 0;
LABEL_23:

        goto LABEL_24;
      }
      +[CHLogServer sharedInstance](CHLogServer, "sharedInstance");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "logHandleForDomain:", "ch.dbm");
      v19 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v24 = v5;
        _os_log_impl(&dword_1B3FA4000, v19, OS_LOG_TYPE_DEFAULT, "Destination store at location %{public}@ is not compatible with newer version, migration required", buf, 0xCu);
      }
      v14 = 2;
    }
    else
    {
      +[CHLogServer sharedInstance](CHLogServer, "sharedInstance");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "logHandleForDomain:", "ch.dbm");
      v19 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        +[DBManager isDataStoreAtURLInitialized:withModelAtURL:].cold.3();
      v14 = 3;
    }

    goto LABEL_23;
  }
  +[CHLogServer sharedInstance](CHLogServer, "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "logHandleForDomain:", "ch.dbm");
  v11 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    +[DBManager isDataStoreAtURLInitialized:withModelAtURL:].cold.1();
  v14 = 3;
LABEL_24:

  return v14;
}

+ (id)instanceWithModelURL:(id)a3
{
  id v3;
  DBManager *v4;
  void *v5;
  void *v6;
  DBManager *v7;
  void *v8;
  NSObject *v9;

  v3 = a3;
  v4 = objc_alloc_init(DBManager);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97B98]), "initWithContentsOfURL:", v3);

  +[DBManager getPersistentCoordinatorWithModel:](DBManager, "getPersistentCoordinatorWithModel:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[DBManager setFPersistentStoreCoordinator:](v4, "setFPersistentStoreCoordinator:", v6);
    v7 = v4;
  }
  else
  {
    +[CHLogServer sharedInstance](CHLogServer, "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "logHandleForDomain:", "ch.dbm");
    v9 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      +[DBManager instanceWithModelURL:].cold.1();

    v7 = 0;
  }

  return v7;
}

- (void)setFPersistentStoreCoordinator:(id)a3
{
  objc_storeStrong((id *)&self->fPersistentStoreCoordinator, a3);
}

- (DBManager)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)DBManager;
  return -[CHLogger initWithDomain:](&v3, sel_initWithDomain_, "ch.dbm");
}

+ (id)getManagedObjectModelFromDB:(id)a3 orModelURL:(id)a4
{
  unint64_t v5;
  unint64_t v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  NSObject *v11;
  id v13;
  uint8_t buf[4];
  unint64_t v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = (unint64_t)a3;
  v6 = (unint64_t)a4;
  v7 = (void *)v6;
  if (v5 | v6)
  {
    if (v6)
    {
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97B98]), "initWithContentsOfURL:", v6);
      v9 = 0;
      if (!v8)
        goto LABEL_10;
    }
    else
    {
      if (!v5)
      {
        v9 = 0;
LABEL_10:
        +[CHLogServer sharedInstance](CHLogServer, "sharedInstance");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "logHandleForDomain:", "ch.dbm");
        v11 = objc_claimAutoreleasedReturnValue();

        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543874;
          v15 = v5;
          v16 = 2114;
          v17 = v7;
          v18 = 2114;
          v19 = v9;
          _os_log_error_impl(&dword_1B3FA4000, v11, OS_LOG_TYPE_ERROR, "Couldn't get managedObjectModel from db at %{public}@ or model at %{public}@: %{public}@", buf, 0x20u);
        }

        v8 = 0;
        goto LABEL_13;
      }
      v13 = 0;
      objc_msgSend(MEMORY[0x1E0C97BF8], "cachedModelForPersistentStoreWithURL:options:error:", v5, 0, &v13);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v13;
      if (!v8)
        goto LABEL_10;
    }
LABEL_13:

    goto LABEL_14;
  }
  v8 = 0;
LABEL_14:

  return v8;
}

+ (id)getPersistentCoordinatorWithModel:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;

  v3 = a3;
  if (v3)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97C00]), "initWithManagedObjectModel:", v3);
  }
  else
  {
    +[CHLogServer sharedInstance](CHLogServer, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "logHandleForDomain:", "ch.dbm");
    v6 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      +[DBManager getPersistentCoordinatorWithModel:].cold.1();

    v4 = 0;
  }

  return v4;
}

+ (id)sourceMetadataForDBAtLocation:(id)a3 withOptions:(id)a4
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  BOOL v10;
  void *v11;
  NSObject *v12;
  id v13;
  id v15;

  v5 = a3;
  v6 = *MEMORY[0x1E0C979E8];
  v15 = 0;
  objc_msgSend(MEMORY[0x1E0C97C00], "metadataForPersistentStoreOfType:URL:options:error:", v6, v5, a4, &v15);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v15;
  v9 = v8;
  if (v7)
    v10 = v8 == 0;
  else
    v10 = 0;
  if (v10)
  {
    v13 = v7;
  }
  else
  {
    +[CHLogServer sharedInstance](CHLogServer, "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "logHandleForDomain:", "ch.dbm");
    v12 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      +[DBManager sourceMetadataForDBAtLocation:withOptions:].cold.1();

    v13 = 0;
  }

  return v13;
}

+ (id)modelForDBMetadata:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  uint8_t buf[16];

  v3 = a3;
  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0C99D20];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "arrayWithObjects:", v5, 0);
    v6 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C97B98], "mergedModelFromBundles:forStoreMetadata:", v6, v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      +[CHLogServer sharedInstance](CHLogServer, "sharedInstance");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "logHandleForDomain:", "ch.dbm");
      v9 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B3FA4000, v9, OS_LOG_TYPE_DEFAULT, "Failed to look up the managed object model for the source meta data", buf, 2u);
      }

    }
  }
  else
  {
    +[CHLogServer sharedInstance](CHLogServer, "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "logHandleForDomain:", "ch.dbm");
    v6 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      +[DBManager modelForDBMetadata:].cold.1();
    v7 = 0;
  }

  return v7;
}

+ (int64_t)versionForDBAtLocation:(id)a3
{
  void *v3;
  void *v4;
  int64_t v5;

  +[DBManager sourceMetadataForDBAtLocation:withOptions:](DBManager, "sourceMetadataForDBAtLocation:withOptions:", a3, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[DBManager modelForDBMetadata:](DBManager, "modelForDBMetadata:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    v5 = +[DBManager versionForManagedObjectModel:](DBManager, "versionForManagedObjectModel:", v4);
  else
    v5 = -1;

  return v5;
}

+ (int64_t)mapToDBMErrorCode:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int64_t v8;

  v3 = a3;
  v4 = v3;
  if (v3
    && objc_msgSend(v3, "code") == 134110
    && (objc_msgSend(v4, "userInfo"), v5 = (void *)objc_claimAutoreleasedReturnValue(), v5, v5))
  {
    objc_msgSend(v4, "userInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0CB3388]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      if (objc_msgSend(v7, "code") == 134111)
        v8 = 4;
      else
        v8 = 3;
    }
    else
    {
      v8 = 3;
    }

  }
  else
  {
    v8 = 3;
  }

  return v8;
}

+ (id)migrateDataStoreAtLocation:(id)a3 withGetDestinationModel:(id)a4 isEncrypted:(BOOL)a5
{
  _BOOL8 v5;
  id v7;
  void (**v8)(id, uint64_t);
  DBMigrationResult *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  _BOOL4 v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  NSObject *v23;
  uint64_t v24;
  void *v25;
  NSObject *v26;
  int v27;
  void *v28;
  NSObject *v29;
  _BOOL4 v30;
  void *v31;
  DBMigrationResult *v32;
  id v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  NSObject *v38;
  uint64_t v39;
  void *v40;
  NSObject *v41;
  void *v42;
  void *v43;
  void *v44;
  int v45;
  void *v46;
  char v47;
  void *v48;
  void *v49;
  NSObject *v50;
  BOOL v51;
  void *v52;
  NSObject *v53;
  void *v54;
  void *v55;
  NSObject *v56;
  void *v58;
  NSObject *v59;
  id v60;
  void *v61;
  void *v62;
  void *v63;
  void (**v64)(id, uint64_t);
  uint64_t v65;
  uint64_t v66;
  _BOOL4 v67;
  void *v68;
  id v69;
  id v70;
  uint8_t buf[4];
  uint64_t v72;
  __int16 v73;
  uint64_t v74;
  uint64_t v75;

  v5 = a5;
  v75 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = (void (**)(id, uint64_t))a4;
  v9 = -[DBMigrationResult initWithErrorCode:andDBVersion:]([DBMigrationResult alloc], "initWithErrorCode:andDBVersion:", 3, -1);
  +[DBManager persistentStoreOptionsWithURL:isEncrypted:](DBManager, "persistentStoreOptionsWithURL:isEncrypted:", v7, v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[DBManager sourceMetadataForDBAtLocation:withOptions:](DBManager, "sourceMetadataForDBAtLocation:withOptions:", v7, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  +[CHLogServer sharedInstance](CHLogServer, "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "logHandleForDomain:", "ch.dbm");
  v13 = objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v67 = v5;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B3FA4000, v13, OS_LOG_TYPE_DEFAULT, "Completed migration step 1: Fetching source metadata", buf, 2u);
    }

    +[DBManager modelForDBMetadata:](DBManager, "modelForDBMetadata:", v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[CHLogServer sharedInstance](CHLogServer, "sharedInstance");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "logHandleForDomain:", "ch.dbm");
    v16 = objc_claimAutoreleasedReturnValue();

    v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
    if (v14)
    {
      if (v17)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B3FA4000, v16, OS_LOG_TYPE_DEFAULT, "Completed migration step 2: Fetching source model", buf, 2u);
      }

      v18 = +[DBManager versionForManagedObjectModel:](DBManager, "versionForManagedObjectModel:", v14);
      +[CHLogServer sharedInstance](CHLogServer, "sharedInstance");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "logHandleForDomain:", "ch.dbm");
      v16 = objc_claimAutoreleasedReturnValue();

      if (v18 > 0)
      {
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1B3FA4000, v16, OS_LOG_TYPE_DEFAULT, "Completed migration step 3: Fetching source version", buf, 2u);
        }

        v66 = v18;
        v8[2](v8, v18);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(objc_alloc(MEMORY[0x1E0C97B98]), "initWithContentsOfURL:", v20);
        +[CHLogServer sharedInstance](CHLogServer, "sharedInstance");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "logHandleForDomain:", "ch.dbm");
        v23 = objc_claimAutoreleasedReturnValue();

        v68 = (void *)v21;
        if (v21)
        {
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1B3FA4000, v23, OS_LOG_TYPE_DEFAULT, "Completed migration step 4: Fetching temp model", buf, 2u);
          }

          v24 = +[DBManager versionForManagedObjectModel:](DBManager, "versionForManagedObjectModel:", v21);
          +[CHLogServer sharedInstance](CHLogServer, "sharedInstance");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "logHandleForDomain:", "ch.dbm");
          v26 = objc_claimAutoreleasedReturnValue();

          if (v24 > 0)
          {
            v64 = v8;
            if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1B3FA4000, v26, OS_LOG_TYPE_DEFAULT, "Completed migration step 5: Fetching temp version", buf, 2u);
            }

            +[DBManager migrationDirectoryFromSourceURL:](DBManager, "migrationDirectoryFromSourceURL:", v7);
            v65 = objc_claimAutoreleasedReturnValue();
            v27 = objc_msgSend(v68, "isConfiguration:compatibleWithStoreMetadata:", 0, v11);
            +[CHLogServer sharedInstance](CHLogServer, "sharedInstance");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "logHandleForDomain:", "ch.dbm");
            v29 = objc_claimAutoreleasedReturnValue();

            v30 = os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT);
            if (v27)
            {
              v8 = v64;
              if (v30)
              {
                *(_DWORD *)buf = 138543362;
                v72 = (uint64_t)v7;
                _os_log_impl(&dword_1B3FA4000, v29, OS_LOG_TYPE_DEFAULT, "Destination store at location %{public}@ is compatible with newer version; no migration required",
                  buf,
                  0xCu);
              }

              v31 = (void *)v65;
              +[DBManager deleteDirectoryAtLocation:](DBManager, "deleteDirectoryAtLocation:", v65);
              -[DBMigrationResult setDbVersion:](v9, "setDbVersion:", v24);
              -[DBMigrationResult setErrorCode:](v9, "setErrorCode:", 0);
              v32 = v9;
              v33 = 0;
              goto LABEL_63;
            }
            if (v30)
            {
              *(_DWORD *)buf = 134218240;
              v72 = v66;
              v73 = 2048;
              v74 = v24;
              _os_log_impl(&dword_1B3FA4000, v29, OS_LOG_TYPE_DEFAULT, "Completed migration step 6: Stores were incompatible. Beginning migration from version %ld to version %ld", buf, 0x16u);
            }

            v34 = (void *)MEMORY[0x1E0C99D20];
            objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "arrayWithObjects:", v35, 0);
            v36 = objc_claimAutoreleasedReturnValue();

            v62 = (void *)v36;
            objc_msgSend(MEMORY[0x1E0C97BA0], "mappingModelFromBundles:forSourceModel:destinationModel:", v36, v14, v68);
            v63 = (void *)objc_claimAutoreleasedReturnValue();
            if (v63)
            {
              v33 = 0;
            }
            else
            {
              +[CHLogServer sharedInstance](CHLogServer, "sharedInstance");
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v37, "logHandleForDomain:", "ch.dbm");
              v38 = objc_claimAutoreleasedReturnValue();

              if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_1B3FA4000, v38, OS_LOG_TYPE_DEFAULT, "Failed to look for the mapping bundle in the framework bundle, now inferring automatically", buf, 2u);
              }

              v70 = 0;
              objc_msgSend(MEMORY[0x1E0C97BA0], "inferredMappingModelForSourceModel:destinationModel:error:", v14, v68, &v70);
              v39 = objc_claimAutoreleasedReturnValue();
              v33 = v70;
              v63 = (void *)v39;
              if (!v39)
              {
                +[CHLogServer sharedInstance](CHLogServer, "sharedInstance");
                v58 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v58, "logHandleForDomain:", "ch.dbm");
                v59 = objc_claimAutoreleasedReturnValue();

                v31 = (void *)v65;
                if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_1B3FA4000, v59, OS_LOG_TYPE_DEFAULT, "Failed to infer the mapping model automatically", buf, 2u);
                }

                v32 = v9;
                v8 = v64;
                v54 = v62;
                goto LABEL_62;
              }
            }
            +[CHLogServer sharedInstance](CHLogServer, "sharedInstance");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v40, "logHandleForDomain:", "ch.dbm");
            v41 = objc_claimAutoreleasedReturnValue();

            if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1B3FA4000, v41, OS_LOG_TYPE_DEFAULT, "Completed migration step 7: Fetching mapping model", buf, 2u);
            }

            +[DBManager migrationStoreURLIn:fromSourceURL:andModelURL:](DBManager, "migrationStoreURLIn:fromSourceURL:andModelURL:", v65, v7, v20);
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v42, "path");
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            v45 = objc_msgSend(v43, "fileExistsAtPath:", v44);

            v61 = v42;
            if (v45)
            {
              objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
              v46 = (void *)objc_claimAutoreleasedReturnValue();
              v69 = v33;
              v47 = objc_msgSend(v46, "removeItemAtURL:error:", v42, &v69);
              v60 = v69;

              if ((v47 & 1) == 0)
              {
                +[CHLogServer sharedInstance](CHLogServer, "sharedInstance");
                v55 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v55, "logHandleForDomain:", "ch.dbm");
                v56 = objc_claimAutoreleasedReturnValue();

                v31 = (void *)v65;
                v54 = v62;
                if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
                  +[DBManager migrateDataStoreAtLocation:withGetDestinationModel:isEncrypted:].cold.6();

                v32 = v9;
                v8 = v64;
                goto LABEL_60;
              }
              v48 = v42;
            }
            else
            {
              v60 = v33;
              v48 = v42;
            }
            +[CHLogServer sharedInstance](CHLogServer, "sharedInstance");
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v49, "logHandleForDomain:", "ch.dbm");
            v50 = objc_claimAutoreleasedReturnValue();

            if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1B3FA4000, v50, OS_LOG_TYPE_DEFAULT, "Completed migration step 8: Fetching tempURL", buf, 2u);
            }

            v51 = +[DBManager performMigrationFrom:sourceModel:toDestinationURL:destinationModel:mappingModel:isEncrypted:](DBManager, "performMigrationFrom:sourceModel:toDestinationURL:destinationModel:mappingModel:isEncrypted:", v7, v14, v48, v68, v63, v67);
            +[CHLogServer sharedInstance](CHLogServer, "sharedInstance");
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v52, "logHandleForDomain:", "ch.dbm");
            v53 = objc_claimAutoreleasedReturnValue();

            if (!v51)
            {
              v31 = (void *)v65;
              if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
                +[DBManager migrateDataStoreAtLocation:withGetDestinationModel:isEncrypted:].cold.5();

              -[DBMigrationResult setDbVersion:](v9, "setDbVersion:", v66);
              -[DBMigrationResult setErrorCode:](v9, "setErrorCode:", +[DBManager mapToDBMErrorCode:](DBManager, "mapToDBMErrorCode:", v60));
              v32 = v9;
              v33 = v60;
              v8 = v64;
              v54 = v62;
              goto LABEL_61;
            }
            v31 = (void *)v65;
            if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1B3FA4000, v53, OS_LOG_TYPE_DEFAULT, "Completed migration step 9: Performing migration", buf, 2u);
            }

            v8 = v64;
            +[DBManager migrateDataStoreAtLocation:withGetDestinationModel:isEncrypted:](DBManager, "migrateDataStoreAtLocation:withGetDestinationModel:isEncrypted:", v7, v64, v67);
            v32 = (DBMigrationResult *)objc_claimAutoreleasedReturnValue();
            v54 = v62;
LABEL_60:
            v33 = v60;
LABEL_61:

LABEL_62:
LABEL_63:

            goto LABEL_64;
          }
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
            +[DBManager migrateDataStoreAtLocation:withGetDestinationModel:isEncrypted:].cold.4();

        }
        else
        {
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
            +[DBManager migrateDataStoreAtLocation:withGetDestinationModel:isEncrypted:].cold.3();

        }
        v32 = v9;
        v33 = 0;
LABEL_64:

        goto LABEL_65;
      }
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        +[DBManager migrateDataStoreAtLocation:withGetDestinationModel:isEncrypted:].cold.2();
    }
    else if (v17)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B3FA4000, v16, OS_LOG_TYPE_DEFAULT, "Failed to look up the managed object model for the source meta data", buf, 2u);
    }

    v32 = v9;
    v33 = 0;
LABEL_65:

    goto LABEL_66;
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    +[DBManager migrateDataStoreAtLocation:withGetDestinationModel:isEncrypted:].cold.1();

  v32 = v9;
LABEL_66:

  return v32;
}

+ (BOOL)performMigrationFrom:(id)a3 sourceModel:(id)a4 toDestinationURL:(id)a5 destinationModel:(id)a6 mappingModel:(id)a7 isEncrypted:(BOOL)a8
{
  _BOOL8 v8;
  id v13;
  id v14;
  id v15;
  id v16;
  objc_class *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  uint64_t v23;
  char v24;
  id v25;
  void *v26;
  NSObject *v27;
  BOOL v28;
  void *v29;
  id v31;
  uint8_t buf[4];
  id v33;
  __int16 v34;
  id v35;
  __int16 v36;
  id v37;
  __int16 v38;
  void *v39;
  uint64_t v40;

  v8 = a8;
  v40 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v17 = (objc_class *)MEMORY[0x1E0C97BB0];
  v18 = a4;
  v19 = (void *)objc_msgSend([v17 alloc], "initWithSourceModel:destinationModel:", v18, v15);

  +[DBManager persistentStoreOptionsWithURL:isEncrypted:](DBManager, "persistentStoreOptionsWithURL:isEncrypted:", v14, v8);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  +[CHLogServer sharedInstance](CHLogServer, "sharedInstance");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "logHandleForDomain:", "ch.dbm");
  v22 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138544130;
    v33 = v13;
    v34 = 2114;
    v35 = v14;
    v36 = 2114;
    v37 = v16;
    v38 = 2114;
    v39 = v20;
    _os_log_impl(&dword_1B3FA4000, v22, OS_LOG_TYPE_DEFAULT, "Migrating from %{public}@ to %{public}@ with mapping model %{public}@ and options %{public}@", buf, 0x2Au);
  }

  v23 = *MEMORY[0x1E0C979E8];
  v31 = 0;
  v24 = objc_msgSend(v19, "migrateStoreFromURL:type:options:withMappingModel:toDestinationURL:destinationType:destinationOptions:error:", v13, v23, 0, v16, v14, v23, v20, &v31);
  v25 = v31;
  +[CHLogServer sharedInstance](CHLogServer, "sharedInstance");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "logHandleForDomain:", "ch.dbm");
  v27 = objc_claimAutoreleasedReturnValue();

  if ((v24 & 1) == 0)
  {
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      +[DBManager migrateDataStoreAtLocation:withGetDestinationModel:isEncrypted:].cold.5();
    goto LABEL_12;
  }
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v33 = v13;
    v34 = 2114;
    v35 = v14;
    _os_log_impl(&dword_1B3FA4000, v27, OS_LOG_TYPE_DEFAULT, "Replacing source DB at %{public}@ with migrated DB at %{public}@", buf, 0x16u);
  }

  if (!+[DBManager moveDBAtLocation:toLocation:withModel:](DBManager, "moveDBAtLocation:toLocation:withModel:", v14, v13, v15))
  {
    +[CHLogServer sharedInstance](CHLogServer, "sharedInstance");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "logHandleForDomain:", "ch.dbm");
    v27 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      +[DBManager performMigrationFrom:sourceModel:toDestinationURL:destinationModel:mappingModel:isEncrypted:].cold.1();
LABEL_12:

    v28 = 0;
    goto LABEL_13;
  }
  v28 = 1;
LABEL_13:

  return v28;
}

+ (id)migrationDirectoryFromSourceURL:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  NSObject *v9;
  id v10;
  id v12;

  objc_msgSend(a3, "URLByDeletingLastPathComponent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URLByAppendingPathComponent:isDirectory:", CFSTR("Migration"), 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "path");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  objc_msgSend(v5, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v6, 1, 0, &v12);
  v7 = v12;

  if (v7)
  {
    +[CHLogServer sharedInstance](CHLogServer, "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "logHandleForDomain:", "ch.dbm");
    v9 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      +[DBManager migrationDirectoryFromSourceURL:].cold.1();

    v10 = 0;
  }
  else
  {
    v10 = v4;
  }

  return v10;
}

+ (BOOL)deleteDirectoryAtLocation:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  NSObject *v8;
  id v10;

  v3 = (void *)MEMORY[0x1E0CB3620];
  v4 = a3;
  objc_msgSend(v3, "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  objc_msgSend(v5, "removeItemAtURL:error:", v4, &v10);

  v6 = v10;
  if (v6)
  {
    +[CHLogServer sharedInstance](CHLogServer, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "logHandleForDomain:", "ch.dbm");
    v8 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      +[DBManager deleteDirectoryAtLocation:].cold.1();

  }
  return v6 == 0;
}

+ (id)migrationStoreURLIn:(id)a3 fromSourceURL:(id)a4 andModelURL:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  id v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a5;
  v9 = a3;
  objc_msgSend(v7, "path");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "pathExtension");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "stringByDeletingPathExtension");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "lastPathComponent");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "stringByDeletingPathExtension");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@.%@"), v12, v14, v11);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "URLByAppendingPathComponent:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  +[CHLogServer sharedInstance](CHLogServer, "sharedInstance");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "logHandleForDomain:", "ch.dbm");
  v18 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    v21 = v16;
    v22 = 2114;
    v23 = v7;
    v24 = 2114;
    v25 = v14;
    _os_log_impl(&dword_1B3FA4000, v18, OS_LOG_TYPE_DEFAULT, "Got destinationURL %{public}@ from sourceURL %{public}@ and modelName %{public}@", buf, 0x20u);
  }

  return v16;
}

+ (BOOL)destroyDBAtLocation:(id)a3 withModelAtLocation:(id)a4
{
  id v5;
  void *v6;
  BOOL v7;

  v5 = a3;
  +[DBManager getManagedObjectModelFromDB:orModelURL:](DBManager, "getManagedObjectModelFromDB:orModelURL:", v5, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = +[DBManager destroyDBAtLocation:withModel:](DBManager, "destroyDBAtLocation:withModel:", v5, v6);

  return v7;
}

+ (BOOL)destroyDBAtLocation:(id)a3 withModel:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  char v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  id v18;

  v5 = a3;
  v6 = a4;
  +[DBManager getPersistentCoordinatorWithModel:](DBManager, "getPersistentCoordinatorWithModel:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)MEMORY[0x1E0C99D80];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dictionaryWithObjectsAndKeys:", v9, *MEMORY[0x1E0C97990], 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = *MEMORY[0x1E0C979E8];
    v18 = 0;
    v12 = objc_msgSend(v7, "_destroyPersistentStoreAtURL:withType:options:error:", v5, v11, v10, &v18);
    v13 = v18;
    if ((v12 & 1) == 0)
    {
      +[CHLogServer sharedInstance](CHLogServer, "sharedInstance");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "logHandleForDomain:", "ch.dbm");
      v15 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        +[DBManager destroyDBAtLocation:withModel:].cold.2();

    }
  }
  else
  {
    +[CHLogServer sharedInstance](CHLogServer, "sharedInstance");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "logHandleForDomain:", "ch.dbm");
    v13 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      +[DBManager destroyDBAtLocation:withModel:].cold.1();
    v12 = 0;
  }

  return v12;
}

+ (BOOL)moveDBAtLocation:(id)a3 toLocation:(id)a4 withModelAtLocation:(id)a5
{
  id v7;
  id v8;
  void *v9;
  BOOL v10;

  v7 = a4;
  v8 = a3;
  +[DBManager getManagedObjectModelFromDB:orModelURL:](DBManager, "getManagedObjectModelFromDB:orModelURL:", v8, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = +[DBManager moveDBAtLocation:toLocation:withModel:](DBManager, "moveDBAtLocation:toLocation:withModel:", v8, v7, v9);

  return v10;
}

+ (BOOL)moveDBAtLocation:(id)a3 toLocation:(id)a4 withModel:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  char v13;
  id v14;
  BOOL v15;
  void *v16;
  NSObject *v17;
  void *v18;
  id v20;
  uint8_t buf[4];
  id v22;
  __int16 v23;
  id v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  +[DBManager getPersistentCoordinatorWithModel:](DBManager, "getPersistentCoordinatorWithModel:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (!v10)
  {
    +[CHLogServer sharedInstance](CHLogServer, "sharedInstance");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "logHandleForDomain:", "ch.dbm");
    v17 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      +[DBManager moveDBAtLocation:toLocation:withModel:].cold.1();
    v14 = 0;
    goto LABEL_9;
  }
  v12 = *MEMORY[0x1E0C979E8];
  v20 = 0;
  v13 = objc_msgSend(v10, "_replacePersistentStoreAtURL:destinationOptions:withPersistentStoreFromURL:sourceOptions:storeType:error:", v8, 0, v7, 0, v12, &v20);
  v14 = v20;
  if ((v13 & 1) == 0)
  {
    +[CHLogServer sharedInstance](CHLogServer, "sharedInstance");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "logHandleForDomain:", "ch.dbm");
    v17 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543874;
      v22 = v7;
      v23 = 2114;
      v24 = v8;
      v25 = 2114;
      v26 = v14;
      _os_log_error_impl(&dword_1B3FA4000, v17, OS_LOG_TYPE_ERROR, "Failed to copy data store src: %{public}@ dst: %{public}@ error: %{public}@", buf, 0x20u);
    }
LABEL_9:

    v15 = 0;
    goto LABEL_10;
  }
  v15 = 1;
LABEL_10:

  return v15;
}

+ (id)entityDescriptionHavingName:(id)a3 forContext:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;

  v5 = a3;
  objc_msgSend(a4, "persistentStoreCoordinator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "managedObjectModel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v7, "entitiesByName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKey:", v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    +[CHLogServer sharedInstance](CHLogServer, "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "logHandleForDomain:", "ch.dbm");
    v11 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      +[DBManager entityDescriptionHavingName:forContext:].cold.1();

    v9 = 0;
  }

  return v9;
}

+ (void)setPropertyValue:(id)a3 forKey:(id)a4 forContext:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;

  v7 = a3;
  v8 = a4;
  objc_msgSend(a5, "persistentStoreCoordinator");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    objc_msgSend(v9, "persistentStores");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "firstObject");
    v12 = objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      objc_msgSend(v10, "metadataForPersistentStore:", v12);
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = v13;
      if (v13)
      {
        v15 = -[NSObject mutableCopy](v13, "mutableCopy");
        -[NSObject setObject:forKey:](v15, "setObject:forKey:", v7, v8);
        objc_msgSend(v10, "setMetadata:forPersistentStore:", v15, v12);
      }
      else
      {
        +[CHLogServer sharedInstance](CHLogServer, "sharedInstance");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "logHandleForDomain:", "ch.dbm");
        v15 = objc_claimAutoreleasedReturnValue();

        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          +[DBManager setPropertyValue:forKey:forContext:].cold.3();
      }

    }
    else
    {
      +[CHLogServer sharedInstance](CHLogServer, "sharedInstance");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "logHandleForDomain:", "ch.dbm");
      v14 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        +[DBManager setPropertyValue:forKey:forContext:].cold.2();
    }

  }
  else
  {
    +[CHLogServer sharedInstance](CHLogServer, "sharedInstance");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "logHandleForDomain:", "ch.dbm");
    v12 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      +[DBManager setPropertyValue:forKey:forContext:].cold.1();
  }

}

+ (id)getPropertyValueForKey:(id)a3 forContext:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;

  v5 = a3;
  objc_msgSend(a4, "persistentStoreCoordinator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "persistentStores");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "firstObject");
    v9 = objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(v7, "metadataForPersistentStore:", v9);
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = v10;
      if (v10)
      {
        -[NSObject valueForKey:](v10, "valueForKey:", v5);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_14:

        goto LABEL_15;
      }
      +[CHLogServer sharedInstance](CHLogServer, "sharedInstance");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "logHandleForDomain:", "ch.dbm");
      v16 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        +[DBManager setPropertyValue:forKey:forContext:].cold.3();

    }
    else
    {
      +[CHLogServer sharedInstance](CHLogServer, "sharedInstance");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "logHandleForDomain:", "ch.dbm");
      v11 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        +[DBManager setPropertyValue:forKey:forContext:].cold.2();
    }
    v12 = 0;
    goto LABEL_14;
  }
  +[CHLogServer sharedInstance](CHLogServer, "sharedInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "logHandleForDomain:", "ch.dbm");
  v9 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    +[DBManager setPropertyValue:forKey:forContext:].cold.1();
  v12 = 0;
LABEL_15:

  return v12;
}

+ (BOOL)makeDatabaseAtURLClassCDataProtected:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  DBManager *v6;
  void *v7;
  BOOL v8;

  v3 = a3;
  +[DBManager sourceMetadataForDBAtLocation:withOptions:](DBManager, "sourceMetadataForDBAtLocation:withOptions:", v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[DBManager modelForDBMetadata:](DBManager, "modelForDBMetadata:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = objc_alloc_init(DBManager);
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97C00]), "initWithManagedObjectModel:", v5);
    -[DBManager setFPersistentStoreCoordinator:](v6, "setFPersistentStoreCoordinator:", v7);

    v8 = -[DBManager addDataStoreAtLocation:isEncrypted:](v6, "addDataStoreAtLocation:isEncrypted:", v3, 1);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (BOOL)replacePersistentStore:(id)a3 withURL:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  char v9;
  id v10;
  void *v11;
  NSObject *v12;
  id v14;
  uint8_t buf[4];
  id v16;
  __int16 v17;
  id v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_opt_new();
  v8 = *MEMORY[0x1E0C979E8];
  v14 = 0;
  v9 = objc_msgSend(v7, "_replacePersistentStoreAtURL:destinationOptions:withPersistentStoreFromURL:sourceOptions:storeType:error:", v5, 0, v6, 0, v8, &v14);
  v10 = v14;
  if ((v9 & 1) == 0)
  {
    +[CHLogServer sharedInstance](CHLogServer, "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "logHandleForDomain:", "ch.dbm");
    v12 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543874;
      v16 = v5;
      v17 = 2114;
      v18 = v6;
      v19 = 2114;
      v20 = v10;
      _os_log_error_impl(&dword_1B3FA4000, v12, OS_LOG_TYPE_ERROR, "Could not replace persistent data store at %{public}@ with %{public}@: %{public}@", buf, 0x20u);
    }

  }
  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->fPersistentStoreCoordinator, 0);
}

+ (void)getPersistentCoordinatorWithModel:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1B3FA4000, v0, v1, "Failed to created coordinator because no model was provided", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

+ (void)isDataStoreAtURLInitialized:withModelAtURL:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_1B3FA4000, v0, v1, "Invalid value dbURL: %{public}@ or modelURL: %{public}@");
  OUTLINED_FUNCTION_3();
}

+ (void)isDataStoreAtURLInitialized:withModelAtURL:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_1B3FA4000, v0, v1, "Unexpected error: %{public}@ when querying meta data for database: %{public}@, treating as data store not initialized");
  OUTLINED_FUNCTION_3();
}

+ (void)isDataStoreAtURLInitialized:withModelAtURL:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1B3FA4000, v0, v1, "Failed to get the destination managed object model", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

+ (void)instanceWithModelURL:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1B3FA4000, v0, v1, "Failed to create peristent coordinator for persistent store", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

+ (void)sourceMetadataForDBAtLocation:withOptions:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_1B3FA4000, v0, v1, "Failed to get metadata for source datastore at %{public}@: %{public}@");
  OUTLINED_FUNCTION_3();
}

+ (void)modelForDBMetadata:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1B3FA4000, v0, v1, "Failed to get model because no metadata was provided", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

+ (void)migrateDataStoreAtLocation:withGetDestinationModel:isEncrypted:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1B3FA4000, v0, v1, "Failed to get metadata for source data store: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

+ (void)migrateDataStoreAtLocation:withGetDestinationModel:isEncrypted:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1B3FA4000, v0, v1, "Failed to get the source version from sourceModel: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

+ (void)migrateDataStoreAtLocation:withGetDestinationModel:isEncrypted:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1B3FA4000, v0, v1, "Failed to get the destination managed object model from: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

+ (void)migrateDataStoreAtLocation:withGetDestinationModel:isEncrypted:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1B3FA4000, v0, v1, "Failed to get the destination version from tempModel: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

+ (void)migrateDataStoreAtLocation:withGetDestinationModel:isEncrypted:.cold.5()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_1B3FA4000, v0, v1, "Failed to migrate the store at location: %{public}@ with error %{public}@");
  OUTLINED_FUNCTION_3();
}

+ (void)migrateDataStoreAtLocation:withGetDestinationModel:isEncrypted:.cold.6()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_1B3FA4000, v0, v1, "Failed to delete data store at path: %{public}@. Error: %{public}@");
  OUTLINED_FUNCTION_3();
}

+ (void)performMigrationFrom:sourceModel:toDestinationURL:destinationModel:mappingModel:isEncrypted:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_1B3FA4000, v0, v1, "Failed to copy data store src: %{public}@ dst: %{public}@");
  OUTLINED_FUNCTION_3();
}

+ (void)migrationDirectoryFromSourceURL:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1B3FA4000, v0, v1, "Error creating migration directory: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

+ (void)deleteDirectoryAtLocation:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1B3FA4000, v0, v1, "Error removing migration directory: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

+ (void)destroyDBAtLocation:withModel:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_1B3FA4000, v0, v1, "Couldn't get the coordinator for db at %{public}@ and model at %{public}@");
  OUTLINED_FUNCTION_3();
}

+ (void)destroyDBAtLocation:withModel:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_1B3FA4000, v0, v1, "Failed to remove store at URL: %{public}@ with error %{public}@");
  OUTLINED_FUNCTION_3();
}

+ (void)moveDBAtLocation:toLocation:withModel:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_1B3FA4000, v0, v1, "Couldn't get the coordinator for source db at %{public}@ and model at %{public}@");
  OUTLINED_FUNCTION_3();
}

- (void)addDataStoreAtLocation:isEncrypted:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1B3FA4000, v0, v1, "Database location is nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)addDataStoreAtLocation:isEncrypted:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_1B3FA4000, v0, v1, "Failed to add the store at location %{public}@ with error %{public}@");
  OUTLINED_FUNCTION_3();
}

- (void)addDataStoreAtLocation:isEncrypted:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1B3FA4000, v0, v1, "Failed to create directory at path: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)removeDataStoreAtLocation:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_1B3FA4000, v0, v1, "Failed to remove persistent store at URL: %{public}@ with error: %{public}@");
  OUTLINED_FUNCTION_3();
}

+ (void)entityDescriptionHavingName:forContext:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1B3FA4000, v0, v1, "Managed object does not exist", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

+ (void)setPropertyValue:forKey:forContext:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1B3FA4000, v0, v1, "Coordinator not set", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

+ (void)setPropertyValue:forKey:forContext:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1B3FA4000, v0, v1, "Persistent store not found", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

+ (void)setPropertyValue:forKey:forContext:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1B3FA4000, v0, v1, "No meta data properties dict found", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

@end
