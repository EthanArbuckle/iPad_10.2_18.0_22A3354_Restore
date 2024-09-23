@implementation PFUbiquityBaseline

- (PFUbiquityBaseline)init
{
  PFUbiquityBaseline *v2;
  PFUbiquityBaseline *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PFUbiquityBaseline;
  v2 = -[PFUbiquitySafeSaveFile init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_baselineStagingLocation = 0;
    v2->_metadata = 0;
    v2->_storeFilenameToData = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v3->_storeFilename = 0;
    v3->_storeName = 0;
    v3->_modelVersionHash = 0;
    v3->_model = 0;
    v3->_baselineArchive = 0;
    v3->_store = 0;
  }
  return v3;
}

- (PFUbiquityBaseline)initWithLocalPeerID:(id)a3 ubiquityRootLocation:(id)a4 forStoreWithName:(id)a5 andManagedObjectModel:(id)a6
{
  NSString *v11;
  void *v12;
  void *v13;
  PFUbiquityBaseline *v14;
  uint64_t v15;

  v11 = (NSString *)+[PFUbiquityLocation createVersionHashStringForModel:]((uint64_t)PFUbiquityLocation, a6);
  v12 = +[PFUbiquityLocation createBaselineLocation:forStoreName:andModelVersionHash:withUbiquityRootLocation:]((uint64_t)PFUbiquityLocation, 10, (uint64_t)a5, (uint64_t)v11, a4);
  v13 = +[PFUbiquityLocation createPeerBaselineFileSafeSaveLocationForLocalPeerID:andBaselineFileLocation:]((uint64_t)PFUbiquityLocation, a3, v12);
  v14 = -[PFUbiquitySafeSaveFile initWithPermanentLocation:safeSaveLocation:andLocalPeerID:](self, "initWithPermanentLocation:safeSaveLocation:andLocalPeerID:", v12, v13, a3);

  if (v14)
  {
    v14->_model = (NSManagedObjectModel *)a6;
    v14->_modelVersionHash = v11;
    v15 = objc_msgSend(a5, "copy");
    v14->_storeName = (NSString *)v15;
    v14->_baselineStagingLocation = (PFUbiquityLocation *)+[PFUbiquityLocation createBaselineStagingLocation:forStoreName:modelVersionHash:andFilename:withUbiquityRootLocation:]((uint64_t)PFUbiquityLocation, 30, v15, (uint64_t)v14->_modelVersionHash, 0, a4);
    v14->_baselineArchive = 0;
  }
  else
  {

  }
  return v14;
}

- (PFUbiquityBaseline)initWithBaselineLocation:(id)a3 andLocalPeerID:(id)a4
{
  id *v5;
  int v7;
  id v8;
  id v9;
  id *v10;
  PFUbiquityBaseline *v11;
  uint64_t *p_modelVersionHash;
  id v13;
  NSString *v14;

  v5 = (id *)a3;
  if (!a3)
  {
LABEL_5:
    v8 = 0;
    v9 = 0;
    goto LABEL_9;
  }
  v7 = *((_DWORD *)a3 + 6);
  if (v7 != 40)
  {
    if (v7 == 10)
    {
      v8 = a3;
      v9 = +[PFUbiquityLocation createPeerBaselineFileSafeSaveLocationForLocalPeerID:andBaselineFileLocation:]((uint64_t)PFUbiquityLocation, a4, v5);
      goto LABEL_9;
    }
    goto LABEL_5;
  }
  v9 = a3;
  v10 = v5;
  if (*((_DWORD *)v5 + 6) != 1)
    v10 = (id *)v5[1];
  v8 = +[PFUbiquityLocation createBaselineLocation:forStoreName:andModelVersionHash:withUbiquityRootLocation:]((uint64_t)PFUbiquityLocation, 10, (uint64_t)self->_storeName, (uint64_t)self->_modelVersionHash, v10);
LABEL_9:
  v11 = -[PFUbiquitySafeSaveFile initWithPermanentLocation:safeSaveLocation:andLocalPeerID:](self, "initWithPermanentLocation:safeSaveLocation:andLocalPeerID:", v5, v9, a4);

  if (v11)
  {
    if (v5)
    {
      p_modelVersionHash = (uint64_t *)&v11->_modelVersionHash;
      v11->_modelVersionHash = (NSString *)v5[6];
      v13 = v5[5];
    }
    else
    {
      v13 = 0;
      p_modelVersionHash = (uint64_t *)&v11->_modelVersionHash;
      v11->_modelVersionHash = 0;
    }
    v14 = (NSString *)v13;
    v11->_storeName = v14;
    if (v5 && *((_DWORD *)v5 + 6) != 1)
      v5 = (id *)v5[1];
    v11->_baselineStagingLocation = (PFUbiquityLocation *)+[PFUbiquityLocation createBaselineStagingLocation:forStoreName:modelVersionHash:andFilename:withUbiquityRootLocation:]((uint64_t)PFUbiquityLocation, 30, (uint64_t)v14, *p_modelVersionHash, 0, v5);
  }
  return v11;
}

- (void)dealloc
{
  objc_super v3;

  self->_baselineStagingLocation = 0;
  self->_metadata = 0;

  self->_storeFilename = 0;
  self->_storeFilenameToData = 0;

  self->_storeName = 0;
  self->_modelVersionHash = 0;

  self->_model = 0;
  self->_baselineArchive = 0;

  self->_store = 0;
  v3.receiver = self;
  v3.super_class = (Class)PFUbiquityBaseline;
  -[PFUbiquitySafeSaveFile dealloc](&v3, sel_dealloc);
}

- (id)description
{
  void *v3;
  id v4;
  NSString *storeName;
  NSString *modelVersionHash;
  PFUbiquityLocation *permanentLocation;
  objc_super v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v9.receiver = self;
  v9.super_class = (Class)PFUbiquityBaseline;
  v4 = -[PFUbiquitySafeSaveFile description](&v9, sel_description);
  if (self)
  {
    storeName = self->_storeName;
    modelVersionHash = self->_modelVersionHash;
    permanentLocation = self->super._permanentLocation;
  }
  else
  {
    modelVersionHash = 0;
    storeName = 0;
    permanentLocation = 0;
  }
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("%@\n\tstoreName: %@\n\tmodelVersionHash: %@\n\tbaselineArchiveLocation: %@\n"), v4, storeName, modelVersionHash, permanentLocation);
}

- (uint64_t)clearOutStagingLocationWithError:(uint64_t)a1
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  id v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = (void *)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v16 = 0;
  v5 = -[PFUbiquityLocation createFullPath](*(_QWORD *)(a1 + 88));
  if (objc_msgSend(v4, "fileExistsAtPath:", v5))
  {
    if (objc_msgSend(v4, "removeItemAtPath:error:", v5, &v16))
    {
      if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 3))
        NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@ Successfully removed contents of staging area."), "-[PFUbiquityBaseline clearOutStagingLocationWithError:]", 188, a1);
    }
    else
    {
      if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 0))
        NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@\nError while preparing for baseline roll: %@\nuserInfo: %@"), "-[PFUbiquityBaseline clearOutStagingLocationWithError:]", 190, a1, v16, objc_msgSend(v16, "userInfo"));
      v16 = 0;
    }
  }
  v6 = objc_msgSend(v4, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v5, 1, 0, &v16);
  if ((_DWORD)v6)
  {
    if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 3))
      NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@\nSuccessfully created staging directory: %@"), "-[PFUbiquityBaseline clearOutStagingLocationWithError:]", 198, a1, v5);
  }
  else
  {
    if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 0))
      NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@\nUnable to create staging directory path, failing now: %@\nError: %@\nuserInfo: %@\n"), "-[PFUbiquityBaseline clearOutStagingLocationWithError:]", 201, a1, v5, v16, objc_msgSend(v16, "userInfo"));
    if (v16)
    {
      if (a2)
        *a2 = v16;
    }
    else
    {
      v7 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
      _NSCoreDataLog(17, v7, v8, v9, v10, v11, v12, v13, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Baseline/PFUbiquityBaseline.m");
      v14 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        v18 = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Baseline/PFUbiquityBaseline.m";
        v19 = 1024;
        v20 = 202;
        _os_log_fault_impl(&dword_18A253000, v14, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
      }
    }
  }

  return v6;
}

- (BOOL)prepareForBaselineRollOfPersistentStore:(uint64_t)a3 andLocalPeerID:(_QWORD *)a4 error:
{
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  NSPersistentStoreCoordinator *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  PFUbiquityBaselineMetadata *v21;
  uint64_t v22;
  uint64_t v23;
  char v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  NSObject *v32;
  id v33;
  _BYTE buf[12];
  __int16 v35;
  int v36;
  _QWORD v37[2];
  _QWORD v38[3];

  v38[2] = *MEMORY[0x1E0C80C00];
  if (!result)
    return result;
  v7 = result;
  v33 = 0;
  v8 = (void *)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");

  *(_QWORD *)(v7 + 112) = 0;
  *(_QWORD *)(v7 + 152) = a2;
  v9 = (id)-[PFUbiquityLocation createFullURL](*(_QWORD *)(v7 + 88));
  if (objc_msgSend(v8, "fileExistsAtPath:", objc_msgSend(v9, "path")))
  {
    if ((-[PFUbiquityBaseline clearOutStagingLocationWithError:](v7, &v33) & 1) == 0)
      goto LABEL_33;
  }
  else if (!objc_msgSend(v8, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v9, 1, 0, &v33))
  {
    goto LABEL_33;
  }
  v10 = (id)objc_msgSend((id)objc_msgSend(a2, "URL"), "lastPathComponent");
  *(_QWORD *)(v7 + 112) = v10;
  v11 = (void *)objc_msgSend(v9, "URLByAppendingPathComponent:", v10);
  v12 = (void *)objc_msgSend(a2, "persistentStoreCoordinator");
  if (objc_msgSend(v12, "_replacePersistentStoreAtURL:destinationOptions:withPersistentStoreFromURL:sourceOptions:storeType:error:", v11, objc_msgSend(a2, "options"), objc_msgSend(a2, "URL"), objc_msgSend(a2, "options"), objc_msgSend(a2, "type"), &v33))
  {
    if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 3))
      NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@\nSuccessfully copied store to staging directory: %@"), "-[PFUbiquityBaseline prepareForBaselineRollOfPersistentStore:andLocalPeerID:error:]", 240, v7, v11);
    v13 = -[NSPersistentStoreCoordinator initWithManagedObjectModel:]([NSPersistentStoreCoordinator alloc], "initWithManagedObjectModel:", objc_msgSend(v12, "managedObjectModel"));
    if (v11)
    {
      v14 = objc_msgSend(a2, "type");
      v15 = objc_msgSend(a2, "configurationName");
      v37[0] = CFSTR("NSUbiquityImporterPrivateStoreKey");
      v16 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
      v37[1] = CFSTR("NSSQLitePragmasOption");
      v38[0] = v16;
      v38[1] = &unk_1E1F4B0D8;
      v17 = -[NSPersistentStoreCoordinator addPersistentStoreWithType:configuration:URL:options:error:](v13, "addPersistentStoreWithType:configuration:URL:options:error:", v14, v15, v11, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v38, v37, 2), &v33);
      if (v17)
      {
        v18 = (void *)v17;
        v19 = objc_msgSend((id)objc_msgSend(v11, "path"), "stringByAppendingString:", CFSTR("-wal"));
        v20 = objc_msgSend((id)objc_msgSend(v11, "path"), "stringByAppendingString:", CFSTR("-shm"));
        if (objc_msgSend(v8, "fileExistsAtPath:", v20))
        {
          if ((objc_msgSend(v8, "fileExistsAtPath:", v19) & 1) == 0)
          {
            *(_QWORD *)buf = 0;
            if ((objc_msgSend(v8, "removeItemAtPath:error:", v20, buf) & 1) == 0)
            {
              if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 0))
              {
                NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@\nError removing the orphaned -shm file: %@\n%@"), "-[PFUbiquityBaseline prepareForBaselineRollOfPersistentStore:andLocalPeerID:error:]", 257, v7, *(_QWORD *)buf, objc_msgSend(*(id *)buf, "userInfo"));
              }
            }
          }
        }

        *(_QWORD *)(v7 + 96) = 0;
        v21 = [PFUbiquityBaselineMetadata alloc];
        v22 = *(_QWORD *)(v7 + 8);
        if (v22)
        {
          if (*(_DWORD *)(v22 + 24) != 1)
            v22 = *(_QWORD *)(v22 + 8);
        }
        v23 = -[PFUbiquityBaselineMetadata initWithLocalPeerID:storeName:modelVersionHash:andUbiquityRootLocation:](v21, "initWithLocalPeerID:storeName:modelVersionHash:andUbiquityRootLocation:", a3, *(_QWORD *)(v7 + 120), *(_QWORD *)(v7 + 128), v22);
        *(_QWORD *)(v7 + 96) = v23;
        v24 = -[PFUbiquityBaselineMetadata gatherMetadataWithStore:andError:](v23, v18, (uint64_t)&v33);

        if ((v24 & 1) != 0)
          return 1;
        goto LABEL_33;
      }
    }
    else if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 0))
    {
      NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Unable to open staging store as URL is nil"), "-[PFUbiquityBaseline prepareForBaselineRollOfPersistentStore:andLocalPeerID:error:]", 248);
    }
    if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 0))
      NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@\nError connecting to the staged baseline store file: %@\n%@"), "-[PFUbiquityBaseline prepareForBaselineRollOfPersistentStore:andLocalPeerID:error:]", 267, v7, v33, objc_msgSend(v33, "userInfo"));

  }
  else if (objc_msgSend((id)objc_msgSend(v33, "domain"), "isEqualToString:", CFSTR("NSSQLiteErrorDomain"))&& objc_msgSend(v33, "code") == 5)
  {
    if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 2))
      NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@\nUnable to copy store file to staging directory: %@\nError: %@\nuserInfo: %@"), "-[PFUbiquityBaseline prepareForBaselineRollOfPersistentStore:andLocalPeerID:error:]", 274, v7, v11, v33, objc_msgSend(v33, "userInfo"));
  }
  else if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 0))
  {
    NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@\nUnable to copy store file to staging directory: %@\nError: %@\nuserInfo: %@"), "-[PFUbiquityBaseline prepareForBaselineRollOfPersistentStore:andLocalPeerID:error:]", 276, v7, v11, v33, objc_msgSend(v33, "userInfo"));
  }
LABEL_33:
  if (v33)
  {
    if (a4)
    {
      result = 0;
      *a4 = v33;
      return result;
    }
  }
  else
  {
    v25 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
    _NSCoreDataLog(17, v25, v26, v27, v28, v29, v30, v31, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Baseline/PFUbiquityBaseline.m");
    v32 = __pflogFaultLog;
    result = os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT);
    if (!result)
      return result;
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Baseline/PFUbiquityBaseline.m";
    v35 = 1024;
    v36 = 282;
    _os_log_fault_impl(&dword_18A253000, v32, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
  }
  return 0;
}

- (uint64_t)gatherContentsFromMigratedBaseline:(uint64_t)a3 withStoreFileURL:(_QWORD *)a4 error:
{
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  id v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  int v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v7 = result;
    v21 = 0;

    *(_QWORD *)(v7 + 144) = 0;
    objc_msgSend(*(id *)(v7 + 104), "removeAllObjects");
    v8 = *(void **)(v7 + 104);
    if (a2)
    {
      objc_msgSend(v8, "addEntriesFromDictionary:", a2[13]);

      v9 = (void *)a2[14];
    }
    else
    {
      objc_msgSend(v8, "addEntriesFromDictionary:", 0);

      v9 = 0;
    }
    *(_QWORD *)(v7 + 112) = v9;

    if (a2)
      v10 = (void *)a2[12];
    else
      v10 = 0;
    *(_QWORD *)(v7 + 96) = v10;
    v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithContentsOfURL:options:error:", a3, 2, &v21);
    if (v11)
    {
      v12 = (void *)v11;
      objc_msgSend(*(id *)(v7 + 104), "setObject:forKey:", v11, *(_QWORD *)(v7 + 112));

      return -[PFUbiquityBaseline constructBaselineArchive:](v7, a4);
    }
    if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 0))
      NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  No store file found at url: %@\nBaseline: %@\nError: %@\nuserInfo: %@\n"), "-[PFUbiquityBaseline gatherContentsFromMigratedBaseline:withStoreFileURL:error:]", 302, a3, a2, v21, objc_msgSend(v21, "userInfo"));
    if (v21)
    {
      if (a4)
      {
        result = 0;
        *a4 = v21;
        return result;
      }
      return 0;
    }
    v13 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
    _NSCoreDataLog(17, v13, v14, v15, v16, v17, v18, v19, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Baseline/PFUbiquityBaseline.m");
    v20 = __pflogFaultLog;
    result = os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT);
    if ((_DWORD)result)
    {
      *(_DWORD *)buf = 136315394;
      v23 = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Baseline/PFUbiquityBaseline.m";
      v24 = 1024;
      v25 = 303;
      _os_log_fault_impl(&dword_18A253000, v20, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
      return 0;
    }
  }
  return result;
}

- (BOOL)constructBaselineArchive:(uint64_t)a1
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  id v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  NSObject *v34;
  id v35;
  uint8_t buf[4];
  const char *v37;
  __int16 v38;
  int v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];

  *(_QWORD *)(a1 + 144) = 0;
  v4 = *(void **)(a1 + 136);
  v5 = *(_QWORD *)(a1 + 96);
  v6 = *(_QWORD *)(a1 + 104);
  v7 = *(void **)(a1 + 112);
  objc_opt_self();
  v35 = 0;
  v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v9 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
  v10 = objc_msgSend(v4, "_optimizedEncoding:", &v35);
  if (v10)
  {
    objc_msgSend(v8, "setObject:forKey:", v10, CFSTR("model"));
  }
  else if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 3))
  {
    NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Error getting data for optimized encoding: %@\nuserInfo: %@\nModel: %@"), "+[PFUbiquityBaseline createArchiveWithModel:metadata:storeFilenameToData:storeFilename:error:]", 1551, v35, objc_msgSend(v35, "userInfo"), v4);
  }
  v11 = objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v4, 1, 0);
  if (v11)
  {
    objc_msgSend(v8, "setObject:forKey:", v11, CFSTR("gcmodel"));
    objc_msgSend(v8, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v5, 1, 0), CFSTR("metadata"));
    objc_msgSend(v8, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v6, 1, 0), CFSTR("storeFilenameToData"));
    objc_msgSend(v8, "setObject:forKey:", objc_msgSend(v7, "dataUsingEncoding:", 4), CFSTR("storeFilename"));
    v12 = -[_PFZipFileArchive initWithEntryNames:contents:properties:options:]((uint64_t)[_PFZipFileArchive alloc], (void *)objc_msgSend(v8, "allKeys"), v8, 0);
    v13 = 1;
  }
  else
  {
    if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 3))
      NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Error getting data for regular encoding: %@\nuserInfo: %@\nModel: %@"), "+[PFUbiquityBaseline createArchiveWithModel:metadata:storeFilenameToData:storeFilename:error:]", 1560, v35, objc_msgSend(v35, "userInfo"), v4);
    v12 = 0;
    v13 = 0;
  }
  v14 = v35;

  objc_msgSend(v9, "drain");
  v15 = v35;
  v16 = 0;
  if ((v13 & 1) == 0)
  {
    v17 = v35;
    if (v35)
      goto LABEL_15;
    v18 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
    _NSCoreDataLog(17, v18, v19, v20, v21, v22, v23, v24, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Baseline/PFUbiquityBaseline.m");
    v25 = __pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315394;
      v37 = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Baseline/PFUbiquityBaseline.m";
      v38 = 1024;
      v39 = 1595;
      _os_log_fault_impl(&dword_18A253000, v25, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
    }
  }
  v17 = 0;
LABEL_15:
  *(_QWORD *)(a1 + 144) = v12;
  if (!v12)
  {
    if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 0))
      NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@\nUnable to crate compressed archive of baseline contents: %@\nuserInfo: %@"), "-[PFUbiquityBaseline constructBaselineArchive:]", 375, a1, v17, objc_msgSend(v17, "userInfo"));
    if (v17)
    {
      if (a2)
        *a2 = v17;
    }
    else
    {
      v27 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
      _NSCoreDataLog(17, v27, v28, v29, v30, v31, v32, v33, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Baseline/PFUbiquityBaseline.m");
      v34 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        v37 = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Baseline/PFUbiquityBaseline.m";
        v38 = 1024;
        v39 = 376;
        _os_log_fault_impl(&dword_18A253000, v34, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
      }
    }
  }
  return v12 != 0;
}

- (uint64_t)gatherContentsAndConstructArchiveWithError:(uint64_t)result
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  uint64_t v10;
  BOOL v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  NSObject *v29;
  uint64_t v31;
  char v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  id v37;
  uint8_t buf[4];
  const char *v39;
  __int16 v40;
  int v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v2 = result;
    v37 = 0;
    objc_msgSend(*(id *)(result + 104), "removeAllObjects");
    v31 = v2;
    v3 = -[PFUbiquityLocation createFullPath](*(_QWORD *)(v2 + 88));
    v4 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "subpathsAtPath:", v3);
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v33, v42, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v34;
      while (2)
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v34 != v7)
            objc_enumerationMutation(v4);
          v9 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
          if ((unint64_t)objc_msgSend((id)objc_msgSend(v9, "pathComponents"), "count") < 2)
          {
            v10 = objc_msgSend(v3, "stringByAppendingPathComponent:", v9);
            v32 = 0;
            if (objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "fileExistsAtPath:isDirectory:", v10, &v32))v11 = v32 == 0;
            else
              v11 = 0;
            if (v11)
            {
              v12 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithContentsOfFile:options:error:", v10, 2, &v37);
              if (!v12)
              {
                if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 0))
                {
                  NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Got nil data for staged store file at path: %@\nError: %@\nuserInfo: %@"), "-[PFUbiquityBaseline gatherContentsAndConstructArchiveWithError:]", 341, v10, v37, objc_msgSend(v37, "userInfo"));
                }
                if (v37)
                {
                  if (a2)
                    *a2 = v37;
                }
                else
                {
                  v14 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
                  _NSCoreDataLog(17, v14, v15, v16, v17, v18, v19, v20, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Baseline/PFUbiquityBaseline.m");
                  v21 = __pflogFaultLog;
                  if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
                  {
                    *(_DWORD *)buf = 136315394;
                    v39 = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Baseline/PFUbiquityBaseline.m";
                    v40 = 1024;
                    v41 = 342;
                    _os_log_fault_impl(&dword_18A253000, v21, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
                  }
                }

                return 0;
              }
              v13 = (void *)v12;
              objc_msgSend(*(id *)(v31 + 104), "setObject:forKey:", v12, v9);

            }
          }
          else if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 1))
          {
            NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Got more than one path component for subpath: %@ of baseline staging directory: %@"), "-[PFUbiquityBaseline gatherContentsAndConstructArchiveWithError:]", 329, v9, v3);
          }
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v33, v42, 16);
        if (v6)
          continue;
        break;
      }
    }

    if (-[PFUbiquityBaseline constructBaselineArchive:](v31, &v37))
      return 1;
    if (v37)
    {
      if (a2)
      {
        result = 0;
        *a2 = v37;
        return result;
      }
      return 0;
    }
    v22 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
    _NSCoreDataLog(17, v22, v23, v24, v25, v26, v27, v28, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Baseline/PFUbiquityBaseline.m");
    v29 = __pflogFaultLog;
    result = os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT);
    if ((_DWORD)result)
    {
      *(_DWORD *)buf = 136315394;
      v39 = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Baseline/PFUbiquityBaseline.m";
      v40 = 1024;
      v41 = 359;
      _os_log_fault_impl(&dword_18A253000, v29, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
      return 0;
    }
  }
  return result;
}

- (BOOL)loadFileFromLocation:(id)a3 error:(id *)a4
{
  id v6;
  PFUbiquityFileCoordinator *v7;
  PFUbiquityLocation *currentLocation;
  char v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  BOOL v13;
  PFUbiquityBaselineMetadata *v14;
  uint64_t v15;
  uint64_t v16;
  NSManagedObjectModel *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  __CFString *v22;
  void *v23;
  void *v24;
  PFUbiquityLocation *v25;
  uint64_t v26;
  id v27;
  id v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  NSObject *v37;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  _QWORD v42[8];
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  char v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  void (*v50)(uint64_t, uint64_t);
  void (*v51)(uint64_t);
  uint64_t v52;
  id v53;
  _BYTE buf[24];
  void (*v55)(uint64_t, uint64_t);
  void (*v56)(uint64_t);
  uint64_t v57;
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v53 = 0;

  self->_baselineArchive = 0;
  v6 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
  v47 = 0;
  v48 = &v47;
  v49 = 0x3052000000;
  v50 = __Block_byref_object_copy__47;
  v51 = __Block_byref_object_dispose__47;
  v52 = 0;
  v7 = +[PFUbiquityFileCoordinator newFileCoordinatorForUbiquityRootLocation:andLocalPeerID:]((uint64_t)PFUbiquityFileCoordinator, (uint64_t)self->super._currentLocation, (uint64_t)self->super._localPeerID);
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3052000000;
  v55 = __Block_byref_object_copy__47;
  v56 = __Block_byref_object_dispose__47;
  v57 = 0;
  v43 = 0;
  v44 = &v43;
  v45 = 0x2020000000;
  v46 = 0;
  currentLocation = self->super._currentLocation;
  v42[0] = MEMORY[0x1E0C809B0];
  v42[1] = 3221225472;
  v42[2] = __49__PFUbiquityBaseline_loadFileFromLocation_error___block_invoke;
  v42[3] = &unk_1E1EE1450;
  v42[6] = &v47;
  v42[7] = buf;
  v42[4] = self;
  v42[5] = &v43;
  -[PFUbiquityFileCoordinator coordinateReadingItemAtLocation:options:retryOnError:error:byAccessor:](v7, (uint64_t)currentLocation, 1, 1, &v53, (uint64_t)v42);

  if (*((_BYTE *)v44 + 24))
  {
    if (v48[5])
    {

      v9 = 0;
      self->_baselineArchive = (_PFZipFileArchive *)(id)v48[5];
      goto LABEL_9;
    }
    v10 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@\nCoordinated read of baseline archive file succeeded, but the file could not be read: %@\nError: %@\n"), self, self->super._currentLocation, *(_QWORD *)(*(_QWORD *)&buf[8] + 40));
    v11 = (void *)MEMORY[0x1E0CB35C8];
    v12 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", v10, *MEMORY[0x1E0CB2D50]);
    v53 = (id)objc_msgSend(v11, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134307, v12);
  }
  else if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 1))
  {
    NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@\nCoordinated read of baseline archive file: %@ did not succed: %@\nuserInfo: %@\n"), "-[PFUbiquityBaseline loadFileFromLocation:error:]", 434, self, self->super._currentLocation, v53, objc_msgSend(v53, "userInfo"));
  }
  v9 = 1;
LABEL_9:
  _Block_object_dispose(&v43, 8);
  _Block_object_dispose(buf, 8);
  if ((v9 & 1) != 0)
  {
LABEL_10:
    v13 = 0;
    goto LABEL_27;
  }

  self->_metadata = 0;
  v14 = (PFUbiquityBaselineMetadata *)(id)+[PFUbiquityBaseline metadataFromBaselineArchive:]((uint64_t)PFUbiquityBaseline, (uint64_t)self->_baselineArchive);
  self->_metadata = v14;
  if (!v14)
  {
    if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 1))
      NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Encountered baseline without any metadata in it's archive: %@"), "-[PFUbiquityBaseline loadFileFromLocation:error:]", 445, self);
    v23 = (void *)MEMORY[0x1E0CB35C8];
    v24 = (void *)MEMORY[0x1E0C99D80];
    v25 = self->super._currentLocation;
    if (!v25)
      v25 = (PFUbiquityLocation *)objc_msgSend(MEMORY[0x1E0C99E38], "null");
    goto LABEL_26;
  }

  self->_model = 0;
  v15 = -[_PFZipFileArchive contentsForEntryName:]((uint64_t)self->_baselineArchive, (uint64_t)CFSTR("gcmodel"));
  if (!v15)
  {
    if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 1))
      NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Encountered baseline without any model data in it's archive: %@"), "-[PFUbiquityBaseline loadFileFromLocation:error:]", 456, self);
    v23 = (void *)MEMORY[0x1E0CB35C8];
    v24 = (void *)MEMORY[0x1E0C99D80];
    v25 = self->super._currentLocation;
    if (!v25)
      v25 = (PFUbiquityLocation *)objc_msgSend(MEMORY[0x1E0C99E38], "null");
    goto LABEL_26;
  }
  v16 = objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v17 = (NSManagedObjectModel *)(id)+[_PFRoutines unarchiveCylicGraphObjectOfClasses:fromData:error:]((uint64_t)_PFRoutines, v16, v15, (uint64_t)&v53);
  self->_model = v17;
  if (!v17)
  {
    if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 0))
      NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Failed to decode model from archive: %@"), "-[PFUbiquityBaseline loadFileFromLocation:error:]", 464, v53);
    goto LABEL_10;
  }
  v18 = -[_PFZipFileArchive contentsForEntryName:]((uint64_t)self->_baselineArchive, (uint64_t)CFSTR("storeFilenameToData"));
  v19 = -[_PFZipFileArchive contentsForEntryName:]((uint64_t)self->_baselineArchive, (uint64_t)CFSTR("storeFilename"));
  v20 = v19;
  if (v18 | v19)
  {
    if (v18)
    {
      if (v19)
      {
        v39 = (void *)MEMORY[0x1E0CB3710];
        v40 = objc_opt_class();
        v41 = objc_msgSend(v39, "unarchivedDictionaryWithKeysOfClass:objectsOfClass:fromData:error:", v40, objc_opt_class(), v18, &v53);
        if (!v41)
          goto LABEL_10;
        -[NSMutableDictionary removeAllObjects](self->_storeFilenameToData, "removeAllObjects");
        -[NSMutableDictionary addEntriesFromDictionary:](self->_storeFilenameToData, "addEntriesFromDictionary:", v41);

        v22 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v20, 4);
        goto LABEL_40;
      }
      if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 1))
        NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Encountered baseline without any filename data in it's archive: %@"), "-[PFUbiquityBaseline loadFileFromLocation:error:]", 492, self);
      v23 = (void *)MEMORY[0x1E0CB35C8];
      v24 = (void *)MEMORY[0x1E0C99D80];
      v25 = self->super._currentLocation;
      if (!v25)
        v25 = (PFUbiquityLocation *)objc_msgSend(MEMORY[0x1E0C99E38], "null");
    }
    else
    {
      if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 1))
        NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Encountered baseline without any filenames data in it's archive: %@"), "-[PFUbiquityBaseline loadFileFromLocation:error:]", 488, self);
      v23 = (void *)MEMORY[0x1E0CB35C8];
      v24 = (void *)MEMORY[0x1E0C99D80];
      v25 = self->super._currentLocation;
      if (!v25)
        v25 = (PFUbiquityLocation *)objc_msgSend(MEMORY[0x1E0C99E38], "null");
    }
LABEL_26:
    v26 = objc_msgSend(v24, "dictionaryWithObject:forKey:", v25, CFSTR("offendingBaseline"));
    v13 = 0;
    v53 = (id)objc_msgSend(v23, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134307, v26);
    goto LABEL_27;
  }
  v21 = -[_PFZipFileArchive contentsForEntryName:]((uint64_t)self->_baselineArchive, (uint64_t)CFSTR("store"));
  if (!v21)
  {
    if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 1))
      NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Encountered baseline without any filenames data in it's archive: %@"), "-[PFUbiquityBaseline loadFileFromLocation:error:]", 483, self);
    v23 = (void *)MEMORY[0x1E0CB35C8];
    v24 = (void *)MEMORY[0x1E0C99D80];
    v25 = self->super._currentLocation;
    if (!v25)
      v25 = (PFUbiquityLocation *)objc_msgSend(MEMORY[0x1E0C99E38], "null");
    goto LABEL_26;
  }
  -[NSMutableDictionary removeAllObjects](self->_storeFilenameToData, "removeAllObjects");
  -[NSMutableDictionary setObject:forKey:](self->_storeFilenameToData, "setObject:forKey:", v21, CFSTR("baseline.store"));

  v22 = CFSTR("baseline.store");
LABEL_40:
  self->_storeFilename = (NSString *)v22;
  v13 = 1;
LABEL_27:

  v48[5] = 0;
  v27 = v53;
  objc_msgSend(v6, "drain");
  v28 = v53;
  v29 = 0;
  if (!v13)
  {
    if (v53)
    {
      if (a4)
        *a4 = v53;
    }
    else
    {
      v30 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
      _NSCoreDataLog(17, v30, v31, v32, v33, v34, v35, v36, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Baseline/PFUbiquityBaseline.m");
      v37 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        *(_QWORD *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Baseline/PFU"
                             "biquityBaseline.m";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 525;
        _os_log_fault_impl(&dword_18A253000, v37, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
      }
    }
  }
  _Block_object_dispose(&v47, 8);
  return v13;
}

id __49__PFUbiquityBaseline_loadFileFromLocation_error___block_invoke(_QWORD *a1, void *a2)
{
  id v4;
  _QWORD *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;

  v4 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
  *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = 1;
  *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40) = -[_PFZipFileArchive initWithPath:options:error:]([_PFZipFileArchive alloc], (void *)objc_msgSend(a2, "path"), 0, *(_QWORD *)(a1[7] + 8) + 40);
  if (!*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40)
    && objc_msgSend(*(id *)(*(_QWORD *)(a1[7] + 8) + 40), "code") == 4)
  {
    v5 = (_QWORD *)a1[4];
    if (v5)
    {
      v6 = (void *)v5[1];
      if ((void *)v5[3] == v6)
        v6 = (void *)v5[2];
    }
    else
    {
      v6 = 0;
    }
    -[PFUbiquitySafeSaveFile setCurrentLocation:](v5, v6);
    *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40) = 0;
    v7 = a1[4];
    if (v7)
      v8 = *(_QWORD *)(v7 + 24);
    else
      v8 = 0;
    v9 = -[PFUbiquityLocation createFullPath](v8);
    *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40) = -[_PFZipFileArchive initWithPath:options:error:]([_PFZipFileArchive alloc], v9, 0, *(_QWORD *)(a1[7] + 8) + 40);

  }
  v10 = *(id *)(*(_QWORD *)(a1[7] + 8) + 40);
  objc_msgSend(v4, "drain");
  return *(id *)(*(_QWORD *)(a1[7] + 8) + 40);
}

+ (uint64_t)metadataFromBaselineArchive:(uint64_t)a1
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;

  objc_opt_self();
  v3 = -[_PFZipFileArchive contentsForEntryName:](a2, (uint64_t)CFSTR("metadata"));
  v6 = 0;
  v4 = objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v3, &v6);
  if (v6 && +[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 0))
    NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Failed to baseline metadata: %@"), "+[PFUbiquityBaseline metadataFromBaselineArchive:]", 1533, v6);
  return v4;
}

- (BOOL)replaceLocalPersistentStoreAtURL:(uint64_t)a3 ofType:(uint64_t)a4 withOptions:(void *)a5 usingPersistentStoreCoordinator:(_QWORD *)a6 error:
{
  _BOOL8 v6;
  void *v7;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  char v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  NSObject *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  NSObject *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  uint64_t v52;
  id v53;
  uint64_t v54;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  NSObject *v64;
  void *v65;
  _QWORD *v66;
  _QWORD v70[12];
  uint64_t v71;
  uint64_t *v72;
  uint64_t v73;
  char v74;
  uint64_t v75;
  uint64_t *v76;
  uint64_t v77;
  void (*v78)(uint64_t, uint64_t);
  void (*v79)(uint64_t);
  uint64_t v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  uint64_t v85;
  uint8_t v86[4];
  const char *v87;
  __int16 v88;
  int v89;
  uint8_t buf[4];
  const char *v91;
  __int16 v92;
  int v93;
  uint64_t v94;

  v6 = 0;
  v94 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v7 = a5;
    if (a5)
    {
      v75 = 0;
      v76 = &v75;
      v77 = 0x3052000000;
      v78 = __Block_byref_object_copy__47;
      v79 = __Block_byref_object_dispose__47;
      v80 = 0;
      v71 = 0;
      v72 = &v71;
      v73 = 0x2020000000;
      v74 = 0;
      v85 = 0;
      if ((-[PFUbiquityBaseline clearOutStagingLocationWithError:](a1, &v85) & 1) != 0)
      {
        v83 = 0u;
        v84 = 0u;
        v81 = 0u;
        v82 = 0u;
        v10 = (void *)objc_msgSend(*(id *)(a1 + 104), "allKeys");
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v81, buf, 16);
        if (v11)
        {
          v12 = *(_QWORD *)v82;
          v65 = v7;
          v66 = a6;
          while (2)
          {
            for (i = 0; i != v11; ++i)
            {
              if (*(_QWORD *)v82 != v12)
                objc_enumerationMutation(v10);
              v14 = *(_QWORD *)(*((_QWORD *)&v81 + 1) + 8 * i);
              v15 = (void *)objc_msgSend(*(id *)(a1 + 104), "objectForKey:", v14);
              if (!v15)
              {
                v7 = v65;
                a6 = v66;
                if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 1))
                {
                  NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Encountered baseline without any file data in it's archive for file named: %@\nBaseline: %@"), "-[PFUbiquityBaseline unpackStoreFilesToStagingLocation:]", 551, v14, a1);
                }
                v28 = (void *)MEMORY[0x1E0CB35C8];
                v29 = (void *)MEMORY[0x1E0C99D80];
                v30 = *(_QWORD *)(a1 + 24);
                if (!v30)
                  v30 = objc_msgSend(MEMORY[0x1E0C99E38], "null");
                v31 = objc_msgSend(v29, "dictionaryWithObjectsAndKeys:", v30, CFSTR("offendingBaseline"), v14, CFSTR("offendingFilename"), 0);
                v32 = objc_msgSend(v28, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134307, v31);
                v85 = v32;
                if (v32)
                {
                  v18 = 0;
                  v19 = 0;
                  v80 = v32;
                  goto LABEL_37;
                }
                v33 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
                _NSCoreDataLog(17, v33, v34, v35, v36, v37, v38, v39, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Baseline/PFUbiquityBaseline.m");
                v40 = __pflogFaultLog;
                if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
                {
                  *(_DWORD *)v86 = 136315394;
                  v87 = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Baseline/PFUbiquityBaseline.m";
                  v88 = 1024;
                  v89 = 553;
                  _os_log_fault_impl(&dword_18A253000, v40, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", v86, 0x12u);
                }
                v18 = 0;
LABEL_36:
                v19 = 0;
                goto LABEL_37;
              }
              v16 = *(_QWORD *)(a1 + 8);
              if (v16 && *(_DWORD *)(v16 + 24) != 1)
                v16 = *(_QWORD *)(v16 + 8);
              v17 = +[PFUbiquityLocation createBaselineStagingLocation:forStoreName:modelVersionHash:andFilename:withUbiquityRootLocation:]((uint64_t)PFUbiquityLocation, 31, *(_QWORD *)(a1 + 120), *(_QWORD *)(a1 + 128), v14, (void *)v16);
              v18 = (void *)-[PFUbiquityLocation createFullURL]((uint64_t)v17);

              if ((objc_msgSend(v15, "writeToURL:options:error:", v18, 1, &v85) & 1) == 0)
              {
                if (v85)
                {
                  v19 = 0;
                  v80 = v85;
                  v7 = v65;
                  a6 = v66;
                  goto LABEL_37;
                }
                v41 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
                v7 = v65;
                a6 = v66;
                _NSCoreDataLog(17, v41, v42, v43, v44, v45, v46, v47, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Baseline/PFUbiquityBaseline.m");
                v48 = __pflogFaultLog;
                if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
                {
                  *(_DWORD *)v86 = 136315394;
                  v87 = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Baseline/PFUbiquityBaseline.m";
                  v88 = 1024;
                  v89 = 565;
                  _os_log_fault_impl(&dword_18A253000, v48, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", v86, 0x12u);
                }
                goto LABEL_36;
              }

            }
            v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v81, buf, 16);
            v18 = 0;
            v19 = 1;
            v7 = v65;
            a6 = v66;
            if (v11)
              continue;
            break;
          }
        }
        else
        {
          v18 = 0;
          v19 = 1;
        }
LABEL_37:

      }
      else if (v85)
      {
        v19 = 0;
        v80 = v85;
      }
      else
      {
        v20 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
        _NSCoreDataLog(17, v20, v21, v22, v23, v24, v25, v26, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Baseline/PFUbiquityBaseline.m");
        v27 = __pflogFaultLog;
        if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 136315394;
          v91 = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Baseline/PFUbiquityBaseline.m";
          v92 = 1024;
          v93 = 540;
          _os_log_fault_impl(&dword_18A253000, v27, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
        }
        v19 = 0;
      }
      v74 = v19;
      if (*((_BYTE *)v72 + 24))
      {
        v49 = *(_QWORD *)(a1 + 8);
        if (v49 && *(_DWORD *)(v49 + 24) != 1)
          v49 = *(_QWORD *)(v49 + 8);
        v50 = +[PFUbiquityLocation createBaselineStagingLocation:forStoreName:modelVersionHash:andFilename:withUbiquityRootLocation:]((uint64_t)PFUbiquityLocation, 31, *(_QWORD *)(a1 + 120), *(_QWORD *)(a1 + 128), *(_QWORD *)(a1 + 112), (void *)v49);
        v51 = (void *)-[PFUbiquityLocation createFullURL]((uint64_t)v50);
        v52 = objc_msgSend(v7, "persistentStoreForURL:", a2);
        v70[0] = MEMORY[0x1E0C809B0];
        v70[1] = 3221225472;
        v70[2] = __112__PFUbiquityBaseline_replaceLocalPersistentStoreAtURL_ofType_withOptions_usingPersistentStoreCoordinator_error___block_invoke;
        v70[3] = &unk_1E1EE1478;
        v70[4] = v52;
        v70[5] = a2;
        v70[6] = a4;
        v70[7] = v51;
        v70[10] = &v71;
        v70[11] = &v75;
        v70[8] = v7;
        v70[9] = a3;
        objc_msgSend(v7, "performBlockAndWait:", v70);
        v53 = (id)v76[5];
        if (a6)
        {
          v54 = v76[5];
          if (v54)
            *a6 = v54;
        }
        if (*((_BYTE *)v72 + 24)
          && (-[PFUbiquityBaseline clearOutStagingLocationWithError:](a1, v76 + 5) & 1) == 0
          && +[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 1))
        {
          NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Failed to clear out staging directory after store replacement: %@\nuserInfo: %@"), "-[PFUbiquityBaseline replaceLocalPersistentStoreAtURL:ofType:withOptions:usingPersistentStoreCoordinator:error:]", 624, v76[5], objc_msgSend((id)v76[5], "userInfo"));
        }

      }
      else
      {
        v56 = v76[5];
        if (v56)
        {
          if (a6)
            *a6 = v56;
        }
        else
        {
          v57 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
          _NSCoreDataLog(17, v57, v58, v59, v60, v61, v62, v63, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Baseline/PFUbiquityBaseline.m");
          v64 = __pflogFaultLog;
          if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 136315394;
            v91 = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Baseline/PFUbiquityBaseline.m";
            v92 = 1024;
            v93 = 586;
            _os_log_fault_impl(&dword_18A253000, v64, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
          }
        }
      }
      v6 = *((_BYTE *)v72 + 24) != 0;
      _Block_object_dispose(&v71, 8);
      _Block_object_dispose(&v75, 8);
    }
  }
  return v6;
}

id __112__PFUbiquityBaseline_replaceLocalPersistentStoreAtURL_ofType_withOptions_usingPersistentStoreCoordinator_error___block_invoke(uint64_t a1)
{
  id v2;

  if (*(_QWORD *)(a1 + 32) && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v2 = (id)objc_msgSend(*(id *)(a1 + 32), "identifier");
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = +[NSSQLCore _replacePersistentStoreAtURL:destinationOptions:withPersistentStoreFromURL:sourceOptions:error:](NSSQLCore, "_replacePersistentStoreAtURL:destinationOptions:withPersistentStoreFromURL:sourceOptions:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48), *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40);
    -[NSSQLCore resetExternalDataReferencesDirectories](*(id **)(a1 + 32));
    objc_msgSend(*(id *)(a1 + 32), "setIdentifier:", v2);

  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = objc_msgSend(*(id *)(a1 + 64), "_replacePersistentStoreAtURL:destinationOptions:withPersistentStoreFromURL:sourceOptions:storeType:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 72), *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40);
  }
  return *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40);
}

- (uint64_t)canReplaceStoreAtKnowledgeVector:(_QWORD *)a1
{
  uint64_t v3;
  id *v4;
  char v5;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  __objc2_class **p_superclass;
  void *v12;
  uint64_t v13;
  void *v14;
  id *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  int v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  PFUbiquityTransactionLog *v34;
  int v35;
  uint64_t v36;
  BOOL v37;
  uint64_t v38;
  uint64_t v39;
  int v40;
  int v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  int v45;
  PFUbiquityPeerReceipt *v46;
  PFUbiquityKnowledgeVector *kv;
  uint64_t v48;
  BOOL v49;
  int v50;
  uint64_t v51;
  int v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  id obj;
  void *v58;
  void *v59;
  uint64_t v60;
  uint64_t v61;
  void *v63;
  id *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  id v80;
  _BYTE v81[128];
  const __CFString *v82;
  uint64_t v83;
  _BYTE v84[128];
  _BYTE v85[128];
  uint64_t v86;

  v86 = *MEMORY[0x1E0C80C00];
  if (!a1)
  {
    v5 = 0;
    return v5 & 1;
  }
  v3 = a1[12];
  if (v3)
    v4 = *(id **)(v3 + 48);
  else
    v4 = 0;
  v64 = v4;
  if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 3))
    NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@\nChecking to see if it can replace store with knowledge vector: %@"), "-[PFUbiquityBaseline canReplaceStoreAtKnowledgeVector:]", 640, a1, a2);
  if (objc_msgSend(a2, "isEqual:", v4))
  {
    if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 3))
      NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@\nLocal store is current with the baseline"), "-[PFUbiquityBaseline canReplaceStoreAtKnowledgeVector:]", 642, a1);
LABEL_9:
    v5 = 0;
    goto LABEL_17;
  }
  if (!-[PFUbiquityKnowledgeVector isZeroVector]((uint64_t)a2))
  {
    if (-[PFUbiquityKnowledgeVector isAncestorOfKnowledgeVector:](a2, (uint64_t)v4))
    {
      if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 3))
        NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@\nLocal store is an ancestor of the baseline"), "-[PFUbiquityBaseline canReplaceStoreAtKnowledgeVector:]", 648, a1);
      goto LABEL_16;
    }
    if (-[PFUbiquityKnowledgeVector isAncestorOfKnowledgeVector:](v4, (uint64_t)a2))
    {
      if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 3))
        NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@\nBaseline is an ancestor of the local store"), "-[PFUbiquityBaseline canReplaceStoreAtKnowledgeVector:]", 651, a1);
      goto LABEL_9;
    }
    if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 2))
      NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@\nBeginning knowledge vector inspection"), "-[PFUbiquityBaseline canReplaceStoreAtKnowledgeVector:]", 654, a1);
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", a2, v4, 0);
    v8 = +[PFUbiquityKnowledgeVector createSetOfAllPeerIDsInKnowledgeVectors:]((uint64_t)PFUbiquityKnowledgeVector, v7);

    v56 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithInt:", 0);
    obj = v8;
    v68 = 0u;
    v69 = 0u;
    v70 = 0u;
    v71 = 0u;
    v61 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v68, v81, 16);
    if (!v61)
    {
LABEL_130:
      v5 = 0;
      goto LABEL_131;
    }
    v9 = 0;
    v10 = 0;
    v5 = 0;
    v60 = *(_QWORD *)v69;
    p_superclass = &OBJC_METACLASS____PFCachedNumber.superclass;
    v55 = *MEMORY[0x1E0C99768];
LABEL_27:
    v65 = 0;
    while (1)
    {
      if (*(_QWORD *)v69 != v60)
        objc_enumerationMutation(obj);
      v12 = *(void **)(*((_QWORD *)&v68 + 1) + 8 * v65);
      if (a2)
      {
        v13 = objc_msgSend(a2[1], "objectForKey:", *(_QWORD *)(*((_QWORD *)&v68 + 1) + 8 * v65));
        if (!v64)
        {
          v19 = v56;
          v63 = (void *)v13;
          if (!v13)
          {
            v19 = v9;
            v63 = v10;
          }
          goto LABEL_54;
        }
        v14 = (void *)v13;
        v15 = v64;
      }
      else
      {
        if (!v64)
        {
          v19 = v9;
          v63 = v10;
          p_superclass = (__objc2_class **)(&OBJC_METACLASS____PFCachedNumber + 8);
          goto LABEL_54;
        }
        v14 = 0;
        v15 = v64;
        p_superclass = (__objc2_class **)(&OBJC_METACLASS____PFCachedNumber + 8);
      }
      v16 = (void *)objc_msgSend(v15[1], "objectForKey:", v12);
      v17 = v16;
      if (v14 && v16)
      {
        v18 = objc_msgSend(v16, "compare:", v14);
        if (v18 == 1)
        {
          v21 = a1[12];
          if (v21)
            v22 = *(_QWORD *)(v21 + 16);
          else
            v22 = 0;
          v23 = objc_msgSend(v12, "isEqualToString:", v22);
          if (v23)
            v19 = 0;
          else
            v19 = v14;
          if (v23)
            v24 = 0;
          else
            v24 = v17;
          v63 = v24;
        }
        else
        {
          if (!v18)
            goto LABEL_44;
          v19 = v9;
          v63 = v10;
          if (v18 == -1)
          {
            v19 = v17;
            v63 = v14;
          }
        }
      }
      else
      {
        v19 = v56;
        if (v14)
        {
          v20 = v14;
        }
        else
        {
          v19 = v9;
          v20 = v10;
        }
        v63 = v20;
        if (!v14 && v16)
        {
LABEL_44:
          v10 = 0;
          v9 = 0;
          goto LABEL_117;
        }
      }
LABEL_54:
      v25 = v19;
      if (v19)
      {
        v10 = v63;
        if (v63)
        {
          v66 = objc_msgSend(v19, "integerValue");
          v26 = objc_msgSend(v63, "integerValue");
          if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 2))
            NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@\nNeed logs for peer %@ between %ld and %ld to adopt"), "-[PFUbiquityBaseline haveTransactionLogsForPeer:between:and:]", 727, a1, v12, v66, v26);
          v80 = 0;
          v27 = a1[1];
          if (v27 && *(_DWORD *)(v27 + 24) != 1)
            v27 = *(_QWORD *)(v27 + 8);
          v58 = v25;
          v28 = +[PFUbiquityLocation createPeerStoreVersionLocationForPeerID:storeName:andModelVersionHash:withUbiquityRootLocation:]((uint64_t)(p_superclass + 314), (uint64_t)v12, a1[15], a1[16], (void *)v27);
          v29 = +[PFUbiquityLocation createArrayOfSubLocationsAtLocation:error:]((uint64_t)(p_superclass + 314), (uint64_t)v28, (uint64_t)&v80);
          v59 = v28;
          v78 = 0u;
          v79 = 0u;
          v76 = 0u;
          v77 = 0u;
          v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v76, v85, 16);
          v67 = v26 - v66;
          if (v30)
          {
            v31 = *(_QWORD *)v77;
LABEL_63:
            v32 = 0;
            while (1)
            {
              if (*(_QWORD *)v77 != v31)
                objc_enumerationMutation(v29);
              v33 = *(_QWORD *)(*((_QWORD *)&v76 + 1) + 8 * v32);
              if (v33 && *(_DWORD *)(v33 + 24) == 22)
              {
                v34 = -[PFUbiquityTransactionLog initWithTransactionLogLocation:andLocalPeerID:]([PFUbiquityTransactionLog alloc], "initWithTransactionLogLocation:andLocalPeerID:", v33, a1[4]);
                v35 = -[PFUbiquityTransactionLog loadComparisonMetadataWithError:]((uint64_t)v34, &v80);
                if (v35)
                {
                  v36 = objc_msgSend(-[PFUbiquityTransactionLog transactionNumber](v34), "integerValue");
                  v37 = v36 > v66 && v36 <= v26;
                  v38 = v37;
                  v67 -= v38;
                }
                else if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 1))
                {
                  NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@\nUnable to load log: %@ while checking for baseline adoption: %@"), "-[PFUbiquityBaseline haveTransactionLogsForPeer:between:and:]", 754, a1, v33, v80);
                }

                if (!v35)
                  break;
              }
              if (v30 == ++v32)
              {
                v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v76, v85, 16);
                if (v30)
                  goto LABEL_63;
                break;
              }
            }
          }
          if (v67 < 1)
          {
            v52 = 1;
          }
          else
          {
            v74 = 0u;
            v75 = 0u;
            v72 = 0u;
            v73 = 0u;
            v39 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v72, v84, 16);
            if (v39)
            {
              v40 = 0;
              v41 = 0;
              v42 = *(_QWORD *)v73;
              do
              {
                v43 = 0;
                do
                {
                  if (*(_QWORD *)v73 != v42)
                    objc_enumerationMutation(v29);
                  v44 = *(_QWORD *)(*((_QWORD *)&v72 + 1) + 8 * v43);
                  if (v44)
                  {
                    v45 = *(_DWORD *)(v44 + 24);
                    if (v45 == 22)
                    {
                      v40 = 1;
                    }
                    else if (v45 == 32)
                    {
                      v46 = -[PFUbiquityPeerReceipt initWithLocalPeerID:andReceiptFileLocation:]([PFUbiquityPeerReceipt alloc], "initWithLocalPeerID:andReceiptFileLocation:", a1[4], v44);
                      if (v46)
                      {
                        kv = v46->_kv;
                        if (kv)
                          v46 = -[NSDictionary objectForKey:](kv->_kv, "objectForKey:", v12);
                        else
                          v46 = 0;
                      }
                      v48 = -[PFUbiquityPeerReceipt integerValue](v46, "integerValue");
                      if (v48)
                        v49 = v48 == v26;
                      else
                        v49 = 0;
                      v50 = v49;
                      v41 |= v50;
                    }
                  }
                  ++v43;
                }
                while (v39 != v43);
                v51 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v72, v84, 16);
                v39 = v51;
              }
              while (v51);
              if (!(v40 & 1 | ((v41 & 1) == 0)))
              {
                if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 3))
                {
                  NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  We are forked from baseline...force it"), "-[PFUbiquityBaseline haveTransactionLogsForPeer:between:and:]", 783);
                }
                v53 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unable to find missing transaction files"));
                v82 = CFSTR("PFUbiquitySetupDoFork");
                v83 = MEMORY[0x1E0C9AAB0];
                objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", v55, v53, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v83, &v82, 1)));
              }
              if ((v41 & v40 & 1) != 0
                && +[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 3))
              {
                NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  we found some logs but the peer is still behind...should we force fork??"), "-[PFUbiquityBaseline haveTransactionLogsForPeer:between:and:]", 788);
              }
            }
            if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 2))
            {
              NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@\nDidn't find all the required logs for baseline adoption, giving up"), "-[PFUbiquityBaseline haveTransactionLogsForPeer:between:and:]", 790, a1);
            }
            v52 = 0;
          }

          p_superclass = (__objc2_class **)(&OBJC_METACLASS____PFCachedNumber + 8);
          if (!v52)
            goto LABEL_130;
          v5 = 1;
          v10 = v63;
          v9 = v58;
          goto LABEL_117;
        }
      }
      else
      {
        v10 = v63;
      }
      v9 = v19;
LABEL_117:
      if (++v65 == v61)
      {
        v54 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v68, v81, 16);
        v61 = v54;
        if (!v54)
        {
LABEL_131:

          goto LABEL_17;
        }
        goto LABEL_27;
      }
    }
  }
  if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 3))
    NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@\nLocal store has a zero vector"), "-[PFUbiquityBaseline canReplaceStoreAtKnowledgeVector:]", 645, a1);
LABEL_16:
  v5 = 1;
LABEL_17:
  if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 3))
    NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@\nFinished check: %d"), "-[PFUbiquityBaseline canReplaceStoreAtKnowledgeVector:]", 721, a1, v5 & 1);
  return v5 & 1;
}

- (uint64_t)isUploaded:(uint64_t)a1
{
  void *v3;
  uint64_t v4;
  id v6;
  id v7;

  if (!a1)
    return 0;
  v3 = (void *)-[PFUbiquityLocation createFullURL](*(_QWORD *)(a1 + 24));
  v7 = 0;
  if (objc_msgSend(v3, "getResourceValue:forKey:error:", &v7, *MEMORY[0x1E0C99A38], a2)
    && objc_msgSend(v7, "BOOLValue")
    && (v6 = 0, objc_msgSend(v3, "getResourceValue:forKey:error:", &v6, *MEMORY[0x1E0C99B38], a2)))
  {
    v4 = objc_msgSend(v6, "BOOLValue");
  }
  else
  {
    v4 = 1;
  }

  return v4;
}

- (uint64_t)metadataMatchesCurrentMetadata:(uint64_t)a1
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v2 = *(_QWORD *)(a1 + 8);
    if (v2 && *(_DWORD *)(v2 + 24) != 1)
      v2 = *(_QWORD *)(v2 + 8);
    v3 = +[PFUbiquityBaseline metadataFromCurrentBaselineForStoreWithName:peerID:modelVersionHash:andUbiquityRootLocation:withError:]((uint64_t)PFUbiquityBaseline, *(_QWORD *)(a1 + 120), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 128), (void *)v2);
    if (v3)
      return objc_msgSend(*(id *)(a1 + 96), "isEqual:", v3);
    v5 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
    _NSCoreDataLog(17, v5, v6, v7, v8, v9, v10, v11, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Baseline/PFUbiquityBaseline.m");
    v12 = __pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315394;
      v14 = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Baseline/PFUbiquityBaseline.m";
      v15 = 1024;
      v16 = 842;
      _os_log_fault_impl(&dword_18A253000, v12, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
    }
  }
  return 0;
}

+ (uint64_t)metadataFromCurrentBaselineForStoreWithName:(uint64_t)a1 peerID:(uint64_t)a2 modelVersionHash:(uint64_t)a3 andUbiquityRootLocation:(uint64_t)a4 withError:(void *)a5
{
  void *v9;
  PFUbiquityFileCoordinator *v10;
  uint64_t v11;
  uint64_t v13;
  _QWORD v14[5];
  id v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  void (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  uint64_t v21;

  objc_opt_self();
  v9 = +[PFUbiquityLocation createCurrentBaselineLocation:forStoreName:peerID:andModelVersionHash:forFileNamed:withUbiquityRootLocation:]((uint64_t)PFUbiquityLocation, 7, a2, a3, a4, (uint64_t)CFSTR("baseline.meta"), a5);
  v16 = 0;
  v17 = &v16;
  v18 = 0x3052000000;
  v19 = __Block_byref_object_copy__47;
  v20 = __Block_byref_object_dispose__47;
  v21 = 0;
  v15 = 0;
  v10 = +[PFUbiquityFileCoordinator newFileCoordinatorForUbiquityRootLocation:]((uint64_t)PFUbiquityFileCoordinator, (uint64_t)v9);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __124__PFUbiquityBaseline_metadataFromCurrentBaselineForStoreWithName_peerID_modelVersionHash_andUbiquityRootLocation_withError___block_invoke;
  v14[3] = &unk_1E1EE0A98;
  v14[4] = &v16;
  -[PFUbiquityFileCoordinator coordinateReadingItemAtLocation:options:retryOnError:error:byAccessor:](v10, (uint64_t)v9, 1, 1, &v15, (uint64_t)v14);

  if (v15 || !v17[5])
  {
    if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 2))
      NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Didn't get baseline metadata back from metadata url: %@\nError: %@\nuserInfo: %@\n"), "+[PFUbiquityBaseline metadataFromCurrentBaselineForStoreWithName:peerID:modelVersionHash:andUbiquityRootLocation:withError:]", 1509, v9, v15, objc_msgSend(v15, "userInfo"));

    v11 = 0;
  }
  else
  {
    v13 = 0;
    v11 = objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v17[5], &v13);
    if (v13
      && +[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 0))
    {
      NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Failed to baseline metadata: %@"), "+[PFUbiquityBaseline metadataFromCurrentBaselineForStoreWithName:peerID:modelVersionHash:andUbiquityRootLocation:withError:]", 1519, v13);
    }

    v17[5] = 0;
  }
  _Block_object_dispose(&v16, 8);
  return v11;
}

+ (uint64_t)checkPeerReceiptsUnderRootLocation:(uint64_t)a3 forAgreementWithLocalPeerID:(uint64_t)a4 storeName:(uint64_t)a5 modelVersionHash:(_QWORD *)a6 error:
{
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  PFUbiquityPeerReceipt *v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  PFUbiquityPeerReceipt *v21;
  NSDate *writeDate;
  double v23;
  PFUbiquityLocation *permanentLocation;
  NSString *exportingPeerID;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v30;
  id *p_isa;
  void *v32;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint64_t v42;
  const __CFString *v43;
  void *v44;
  _BYTE v45[128];
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  objc_opt_self();
  v42 = 0;
  v32 = (void *)objc_opt_new();
  v9 = +[PFUbiquityLocation createArrayOfSubLocationsAtLocation:error:]((uint64_t)PFUbiquityLocation, a2, (uint64_t)&v42);
  if (!v9)
  {
    v10 = 0;
    v33 = 0;
LABEL_47:
    v13 = 0;
    goto LABEL_48;
  }
  v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v33 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
  if (v11)
  {
    v12 = 0;
    v13 = 0;
    v14 = *(_QWORD *)v39;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v39 != v14)
          objc_enumerationMutation(v9);
        v16 = *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * i);
        if (v16)
        {
          v17 = *(_DWORD *)(v16 + 24);
          if (v17 == 32)
          {
            if ((objc_msgSend(*(id *)(v16 + 32), "isEqualToString:", a3) & 1) != 0)
              v13 = (PFUbiquityPeerReceipt *)v16;
            else
              objc_msgSend(v10, "addObject:", v16);
          }
          else if (v17 == 15)
          {
            v12 += objc_msgSend(*(id *)(v16 + 32), "isEqualToString:", a3) ^ 1;
          }
        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
    }
    while (v11);
    if (v12)
      goto LABEL_21;
  }
  else
  {
    v13 = 0;
  }
  v12 = 0;
  if (!objc_msgSend(v10, "count"))
  {
    v13 = 0;
    goto LABEL_54;
  }
LABEL_21:
  if (objc_msgSend(v10, "count") != v12)
    goto LABEL_47;
  if (!v13)
    goto LABEL_54;
  v13 = -[PFUbiquityPeerReceipt initWithLocalPeerID:andReceiptFileLocation:]([PFUbiquityPeerReceipt alloc], "initWithLocalPeerID:andReceiptFileLocation:", a3, v13);
  if (-[PFUbiquitySafeSaveFile existsInCloud](v13)
    && v13
    && -[PFUbiquityPeerReceipt loadFileFromLocation:error:](v13, "loadFileFromLocation:error:", v13->super._currentLocation, &v42))
  {
    p_isa = (id *)&v13->_kv->super.isa;
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v18 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v34, v45, 16);
    if (v18)
    {
      v30 = *(_QWORD *)v35;
LABEL_28:
      v19 = v18;
      v20 = 0;
      while (1)
      {
        if (*(_QWORD *)v35 != v30)
          objc_enumerationMutation(v10);
        v21 = -[PFUbiquityPeerReceipt initWithLocalPeerID:andReceiptFileLocation:]([PFUbiquityPeerReceipt alloc], "initWithLocalPeerID:andReceiptFileLocation:", a3, *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * v20));
        if (!-[PFUbiquitySafeSaveFile existsInCloud](v21)
          || !-[PFUbiquitySafeSaveFile downloadLatestVersion:error:]((uint64_t)v21, 0, &v42)
          || !v21
          || !-[PFUbiquityPeerReceipt loadFileFromLocation:error:](v21, "loadFileFromLocation:error:", v21->super._currentLocation, &v42))
        {
          goto LABEL_49;
        }
        if ((-[PFUbiquityKnowledgeVector isAncestorOfKnowledgeVector:](p_isa, (uint64_t)v21->_kv) & 1) == 0
          && (objc_msgSend(p_isa, "isEqual:", v21->_kv) & 1) == 0)
        {
          objc_opt_self();
          writeDate = v21->_writeDate;
          if (!writeDate)
          {
            if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 1))
            {
              NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Receipt file has no write date: %@"), "+[PFUbiquityBaseline isPeerReceiptTooOld:]", 985, v21);
            }
            goto LABEL_49;
          }
          -[NSDate timeIntervalSinceNow](writeDate, "timeIntervalSinceNow");
          if (v23 >= -7776000.0)
            goto LABEL_49;
          permanentLocation = v21->super._permanentLocation;
          if (permanentLocation)
            exportingPeerID = permanentLocation->_exportingPeerID;
          else
            exportingPeerID = 0;
          objc_msgSend(v32, "addObject:", exportingPeerID);
        }

        if (v19 == ++v20)
        {
          v18 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v34, v45, 16);
          if (v18)
            goto LABEL_28;
          break;
        }
      }
    }
LABEL_54:
    v21 = 0;
    if (objc_msgSend(v32, "count"))
    {
      v27 = (void *)MEMORY[0x1E0CB35C8];
      v43 = CFSTR("offendingPeers");
      v44 = v32;
      v28 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v44, &v43, 1);
      v42 = objc_msgSend(v27, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134325, v28);
    }
    v26 = 1;
    goto LABEL_57;
  }
LABEL_48:
  v21 = 0;
LABEL_49:
  v26 = 0;
  if (a6 && v42)
  {
    v26 = 0;
    *a6 = v42;
  }
LABEL_57:

  return v26;
}

- (uint64_t)importBaselineForStoreAtURL:(uint64_t)a3 ofType:(uint64_t)a4 options:(uint64_t)a5 withLocalPeerID:(uint64_t)a6 stack:(void *)a7 andPersistentStoreCoordinator:(_QWORD *)a8 error:
{
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  NSObject *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  NSObject *v43;
  id v44;
  uint8_t buf[4];
  const char *v46;
  __int16 v47;
  int v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  if (!result)
    return result;
  v15 = result;
  v44 = 0;
  if (*(_QWORD *)(result + 144)
    || objc_msgSend((id)result, "loadFileFromLocation:error:", *(_QWORD *)(result + 24), &v44))
  {
    v16 = *(_QWORD *)(v15 + 96);
    if (v16)
    {
      v17 = *(void **)(v16 + 8);
      if (a6)
      {
LABEL_6:
        v18 = *(void **)(a6 + 8);
        goto LABEL_7;
      }
    }
    else
    {
      v17 = 0;
      if (a6)
        goto LABEL_6;
    }
    v18 = 0;
LABEL_7:
    v19 = (void *)+[PFUbiquityStoreMetadata metadataForStoreWithName:inManagedObjectContext:]((uint64_t)PFUbiquityStoreMetadata, v17, v18);
    -[PFUbiquityStoreMetadata loadFromBaselineMetadata:withLocalPeerID:](v19, *(_QWORD *)(v15 + 96), a5);
    objc_msgSend(v19, "setModelVersionHashString:", *(_QWORD *)(v15 + 128));
    if ((-[PFUbiquityBaseline makeCurrentBaselineWithError:](v15, &v44) & 1) != 0)
    {
      if (-[PFUbiquityBaseline replaceLocalPersistentStoreAtURL:ofType:withOptions:usingPersistentStoreCoordinator:error:](v15, a2, a3, a4, a7, &v44))
      {
        return 1;
      }
      goto LABEL_21;
    }
    if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 3))
      NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Error encountered making this baseline: %@ the current baseline: %@\nuserInfo: %@"), "-[PFUbiquityBaseline importBaselineForStoreAtURL:ofType:options:withLocalPeerID:stack:andPersistentStoreCoordinator:error:]", 1011, v15, v44, objc_msgSend(v44, "userInfo"));
    v20 = v44;
    if (!v44)
    {
      v21 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
      _NSCoreDataLog(17, v21, v22, v23, v24, v25, v26, v27, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Baseline/PFUbiquityBaseline.m");
      v28 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        v46 = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Baseline/PFUbiquityBaseline.m";
        v47 = 1024;
        v48 = 1012;
LABEL_31:
        _os_log_fault_impl(&dword_18A253000, v28, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
        goto LABEL_21;
      }
      goto LABEL_21;
    }
LABEL_18:
    if (a8)
      *a8 = v20;
    goto LABEL_21;
  }
  if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 0))
    NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Error initializing the baseline: %@\nError: %@\nuserInfo: %@"), "-[PFUbiquityBaseline importBaselineForStoreAtURL:ofType:options:withLocalPeerID:stack:andPersistentStoreCoordinator:error:]", 1015, v15, v44, objc_msgSend(v44, "userInfo"));
  v20 = v44;
  if (v44)
    goto LABEL_18;
  v29 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
  _NSCoreDataLog(17, v29, v30, v31, v32, v33, v34, v35, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Baseline/PFUbiquityBaseline.m");
  v28 = __pflogFaultLog;
  if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 136315394;
    v46 = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Baseline/PFUbiquityBaseline.m";
    v47 = 1024;
    v48 = 1016;
    goto LABEL_31;
  }
LABEL_21:
  if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 3))
    NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Error encountered making this baseline: %@ the current baseline: %@\nuserInfo: %@"), "-[PFUbiquityBaseline importBaselineForStoreAtURL:ofType:options:withLocalPeerID:stack:andPersistentStoreCoordinator:error:]", 1020, v15, v44, objc_msgSend(v44, "userInfo"));
  if (v44)
  {
    if (a8)
    {
      result = 0;
      *a8 = v44;
      return result;
    }
  }
  else
  {
    v36 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
    _NSCoreDataLog(17, v36, v37, v38, v39, v40, v41, v42, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Baseline/PFUbiquityBaseline.m");
    v43 = __pflogFaultLog;
    result = os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT);
    if (!(_DWORD)result)
      return result;
    *(_DWORD *)buf = 136315394;
    v46 = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Baseline/PFUbiquityBaseline.m";
    v47 = 1024;
    v48 = 1021;
    _os_log_fault_impl(&dword_18A253000, v43, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
  }
  return 0;
}

- (uint64_t)makeCurrentBaselineWithError:(uint64_t)a1
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  int v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  __CFString *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  NSObject *v37;
  void *v39;
  void *v41;
  id v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  id v47;
  uint8_t buf[4];
  const char *v49;
  __int16 v50;
  int v51;
  _BYTE v52[128];
  uint64_t v53;

  v2 = a1;
  v53 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return v2;
  v47 = 0;
  v42 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
  v3 = *(_QWORD *)(v2 + 8);
  if (v3)
  {
    v4 = *(_QWORD *)(v2 + 32);
    v5 = *(_QWORD *)(v3 + 40);
    v6 = *(_QWORD *)(v3 + 48);
    if (*(_DWORD *)(v3 + 24) != 1)
      v3 = *(_QWORD *)(v3 + 8);
  }
  else
  {
    v6 = 0;
    v5 = 0;
    v4 = *(_QWORD *)(v2 + 32);
  }
  v7 = +[PFUbiquityLocation createCurrentBaselineLocation:forStoreName:peerID:andModelVersionHash:forFileNamed:withUbiquityRootLocation:]((uint64_t)PFUbiquityLocation, 6, v5, v4, v6, 0, (void *)v3);
  v8 = (void *)-[PFUbiquityLocation createFullURL]((uint64_t)v7);
  v9 = -[PFUbiquityLocation createFullPath]((uint64_t)v7);

  v10 = (void *)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v11 = 1;
  if (objc_msgSend(v10, "fileExistsAtPath:", v9))
    v11 = objc_msgSend(v10, "removeItemAtURL:error:", v8, &v47);

  if (!v11)
  {
    if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 0))
    {
      v13 = v47;
      v14 = objc_msgSend(v47, "userInfo");
      v15 = 1135;
      v16 = CFSTR("%s(%d): CoreData: Ubiquity:  Error cleaning out current baseline directory: %@\nuserInfo: %@");
LABEL_16:
      NSLog((NSString *)v16, "-[PFUbiquityBaseline makeCurrentBaselineWithError:]", v15, v13, v14);
      v17 = 0;
      v18 = 0;
      v41 = 0;
      goto LABEL_39;
    }
LABEL_17:
    v17 = 0;
    v18 = 0;
    v41 = 0;
    goto LABEL_39;
  }
  if (!objc_msgSend(v10, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v8, 1, 0, &v47))
  {
    if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 0))
    {
      v13 = v47;
      v14 = objc_msgSend(v47, "userInfo");
      v15 = 1132;
      v16 = CFSTR("%s(%d): CoreData: Ubiquity:  Error attempting to create the directory for the current baseline: %@\nuserInfo: %@");
      goto LABEL_16;
    }
    goto LABEL_17;
  }
  if (objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", *(_QWORD *)(v2 + 96), 1, 0), "writeToURL:options:error:", objc_msgSend(v8, "URLByAppendingPathComponent:", CFSTR("baseline.meta")), 1, &v47)&& objc_msgSend((id)-[_PFZipFileArchive contentsForEntryName:](*(_QWORD *)(v2 + 144), (uint64_t)CFSTR("model")), "writeToURL:options:error:", objc_msgSend(v8, "URLByAppendingPathComponent:", CFSTR("baseline.model")), 1, &v47))
  {
    v12 = objc_msgSend((id)-[_PFZipFileArchive contentsForEntryName:](*(_QWORD *)(v2 + 144), (uint64_t)CFSTR("gcmodel")), "writeToURL:options:error:", objc_msgSend(v8, "URLByAppendingPathComponent:", CFSTR("baseline.gcmodel")), 1, &v47);
  }
  else
  {
    v12 = 0;
  }
  v19 = *(_QWORD *)(v2 + 8);
  if (v19 && *(_DWORD *)(v19 + 24) != 1)
    v19 = *(_QWORD *)(v19 + 8);
  v20 = +[PFUbiquityLocation createCurrentBaselineLocation:forStoreName:peerID:andModelVersionHash:forFileNamed:withUbiquityRootLocation:]((uint64_t)PFUbiquityLocation, 8, *(_QWORD *)(v2 + 120), *(_QWORD *)(v2 + 32), *(_QWORD *)(v2 + 128), 0, (void *)v19);
  v21 = -[PFUbiquityLocation createFullPath]((uint64_t)v20);
  v17 = (void *)-[PFUbiquityLocation createFullURL]((uint64_t)v20);
  v41 = v20;
  v39 = v21;
  if ((objc_msgSend(v10, "fileExistsAtPath:", v21) & 1) != 0)
  {
    v18 = v21;
    if (v12)
    {
LABEL_24:
      v45 = 0u;
      v46 = 0u;
      v43 = 0u;
      v44 = 0u;
      v22 = *(void **)(v2 + 104);
      v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v43, v52, 16);
      if (!v23)
      {
        v2 = 1;
        goto LABEL_40;
      }
      v24 = *(_QWORD *)v44;
LABEL_26:
      v25 = 0;
      while (1)
      {
        if (*(_QWORD *)v44 != v24)
          objc_enumerationMutation(v22);
        v26 = *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * v25);
        v27 = objc_msgSend(v17, "URLByAppendingPathComponent:", v26);
        if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 3))
          NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@\nMaking current: %@\n"), "-[PFUbiquityBaseline makeCurrentBaselineWithError:]", 1121, v2, v27);
        if (!objc_msgSend((id)objc_msgSend(*(id *)(v2 + 104), "objectForKey:", v26), "writeToURL:options:error:", v27, 1, &v47))goto LABEL_38;
        if (v23 == ++v25)
        {
          v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v43, v52, 16);
          if (v23)
            goto LABEL_26;
          v2 = 1;
          v18 = v39;
          goto LABEL_40;
        }
      }
    }
  }
  else
  {
    v18 = v21;
    if (objc_msgSend(v10, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v21, 1, 0, &v47))goto LABEL_24;
  }
  if (!+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 0))
  {
LABEL_38:
    v18 = v39;
    goto LABEL_39;
  }
  NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Error attempting to create the stores directory for the current baseline: %@\nuserInfo: %@"), "-[PFUbiquityBaseline makeCurrentBaselineWithError:]", 1129, v47, objc_msgSend(v47, "userInfo"));
  v18 = v21;
LABEL_39:
  v28 = v47;
  v2 = 0;
LABEL_40:
  objc_msgSend(v42, "drain");
  if ((v2 & 1) == 0)
  {
    v29 = v47;
    if (v47)
    {
      if (a2)
        *a2 = v47;
    }
    else
    {
      v30 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
      _NSCoreDataLog(17, v30, v31, v32, v33, v34, v35, v36, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Baseline/PFUbiquityBaseline.m");
      v37 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        v49 = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Baseline/PFUbiquityBaseline.m";
        v50 = 1024;
        v51 = 1153;
        _os_log_fault_impl(&dword_18A253000, v37, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
      }
    }
  }

  return v2;
}

- (BOOL)updateCurrentStoreIdentifier:(_QWORD *)a1 error:(uint64_t)a2
{
  NSPersistentStoreCoordinator *v4;
  NSPersistentStoreCoordinator *v5;
  id v6;
  void *v7;
  NSSaveChangesRequest *v8;
  id v10;

  if (a1)
  {
    v10 = 0;
    v4 = -[PFUbiquityBaseline _createPersistentStoreCoordinatorForCurrentBaseline:error:](a1, 0, &v10);
    v5 = v4;
    if (v4)
    {
      v6 = -[NSArray lastObject](-[NSPersistentStoreCoordinator persistentStores](v4, "persistentStores"), "lastObject");
      v7 = v6;
      if (v6)
      {
        objc_msgSend(v6, "setIdentifier:", a2);
        v8 = objc_alloc_init(NSSaveChangesRequest);
        objc_msgSend(v7, "executeRequest:withContext:error:", v8, 0, 0);

      }
      else if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 0))
      {
        NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Didn't get persistent store from the baseline coordinator: %@\n%@"), "-[PFUbiquityBaseline updateCurrentStoreIdentifier:error:]", 1044, v5, v10);
      }
    }

  }
  return a1 != 0;
}

- (NSPersistentStoreCoordinator)_createPersistentStoreCoordinatorForCurrentBaseline:(id *)a3 error:
{
  NSManagedObjectModel *v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  const __CFString **v17;
  uint64_t *v18;
  uint64_t v19;
  void *v21;
  _QWORD *v22;
  NSPersistentStoreCoordinator *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint64_t v29;
  const __CFString *v30;
  uint64_t v31;
  const __CFString *v32;
  uint64_t v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v29 = 0;
  v5 = -[PFUbiquityBaseline createManagedObjectModelFromCurrentBaseline](a1);
  if (v5)
    goto LABEL_3;
  if (-[PFUbiquitySafeSaveFile existsInCloud](a1)
    && objc_msgSend(a1, "loadFileFromLocation:error:", a1[3], a3)
    && -[PFUbiquityBaseline makeCurrentBaselineWithError:]((uint64_t)a1, a3))
  {
    v5 = -[PFUbiquityBaseline createManagedObjectModelFromCurrentBaseline](a1);
    if (v5)
    {
LABEL_3:
      v24 = -[NSPersistentStoreCoordinator initWithManagedObjectModel:]([NSPersistentStoreCoordinator alloc], "initWithManagedObjectModel:", v5);

      v6 = a1[1];
      if (v6 && *(_DWORD *)(v6 + 24) != 1)
        v6 = *(_QWORD *)(v6 + 8);
      v7 = +[PFUbiquityLocation createCurrentBaselineLocation:forStoreName:peerID:andModelVersionHash:forFileNamed:withUbiquityRootLocation:]((uint64_t)PFUbiquityLocation, 8, a1[15], a1[4], a1[16], 0, (void *)v6);
      v8 = +[PFUbiquityLocation createArrayOfSubLocationsAtLocation:error:]((uint64_t)PFUbiquityLocation, (uint64_t)v7, (uint64_t)&v29);
      v21 = v7;
      v27 = 0u;
      v28 = 0u;
      v25 = 0u;
      v26 = 0u;
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, v34, 16);
      if (v9)
      {
        v22 = a1;
        v10 = 0;
        v11 = *(_QWORD *)v26;
        do
        {
          v12 = 0;
          do
          {
            if (*(_QWORD *)v26 != v11)
              objc_enumerationMutation(v8);
            v13 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * v12);
            if (v13)
              v14 = *(void **)(v13 + 56);
            else
              v14 = 0;
            if (objc_msgSend(v14, "rangeOfString:", CFSTR("-wal")) == 0x7FFFFFFFFFFFFFFFLL)
            {
              v15 = v13 ? *(void **)(v13 + 56) : 0;
              if (objc_msgSend(v15, "rangeOfString:", CFSTR("-shm")) == 0x7FFFFFFFFFFFFFFFLL)
              {
                v16 = -[PFUbiquityLocation createFullURL](v13);
                if (v16)
                {
                  if (a2)
                  {
                    v32 = CFSTR("NSReadOnlyPersistentStoreOption");
                    v33 = MEMORY[0x1E0C9AAB0];
                    v17 = &v32;
                    v18 = &v33;
                  }
                  else
                  {
                    v30 = CFSTR("NSUbiquityImporterPrivateStoreKey");
                    v31 = MEMORY[0x1E0C9AAB0];
                    v17 = &v30;
                    v18 = &v31;
                  }
                  if (!-[NSPersistentStoreCoordinator addPersistentStoreWithType:configuration:URL:options:error:](v24, "addPersistentStoreWithType:configuration:URL:options:error:", CFSTR("SQLite"), 0, v16, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 1), &v29)&& +[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 0))
                  {
                    NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@\nUnable to open store file: %@\n%@"), "-[PFUbiquityBaseline _createPersistentStoreCoordinatorForCurrentBaseline:error:]", 1365, v22, v8, v29);
                  }
                  v10 = (void *)v16;
                }
                else
                {
                  v10 = 0;
                  if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 0))
                  {
                    NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@\nUnable to open store file: %@ as URL is nil"), "-[PFUbiquityBaseline _createPersistentStoreCoordinatorForCurrentBaseline:error:]", 1368, v22, v8);
                  }
                }
              }
            }
            ++v12;
          }
          while (v9 != v12);
          v19 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, v34, 16);
          v9 = v19;
        }
        while (v19);
      }
      else
      {
        v10 = 0;
      }
      goto LABEL_41;
    }
    v21 = 0;
    v10 = 0;
    v8 = 0;
  }
  else
  {
    v21 = 0;
    v10 = 0;
    v8 = 0;
  }
  v24 = 0;
LABEL_41:

  return v24;
}

- (BOOL)writeFileToLocation:(id)a3 error:(id *)a4
{
  NSString *localPeerID;
  PFUbiquityFileCoordinator *v8;
  uint64_t v9;
  void *v10;
  PFUbiquityFileCoordinator *v11;
  char v12;
  PFUbiquityLocation *permanentLocation;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  _QWORD v23[8];
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  void (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  uint64_t v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  char v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  char v37;
  id v38;
  uint8_t buf[4];
  const char *v40;
  __int16 v41;
  int v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v38 = 0;
  v34 = 0;
  v35 = &v34;
  v36 = 0x2020000000;
  v37 = 1;
  v30 = 0;
  v31 = &v30;
  v32 = 0x2020000000;
  v33 = 0;
  v24 = 0;
  v25 = &v24;
  v26 = 0x3052000000;
  v27 = __Block_byref_object_copy__47;
  v28 = __Block_byref_object_dispose__47;
  v29 = 0;
  if (self)
    localPeerID = self->super._localPeerID;
  else
    localPeerID = 0;
  v8 = +[PFUbiquityFileCoordinator newFileCoordinatorForUbiquityRootLocation:andLocalPeerID:]((uint64_t)PFUbiquityFileCoordinator, (uint64_t)a3, (uint64_t)localPeerID);
  v9 = -[PFUbiquityLocation createFullURL]((uint64_t)a3);
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __48__PFUbiquityBaseline_writeFileToLocation_error___block_invoke;
  v23[3] = &unk_1E1EE1450;
  v23[6] = &v34;
  v23[7] = &v24;
  v23[4] = self;
  v23[5] = &v30;
  -[PFUbiquityFileCoordinator coordinateWritingItemAtURL:options:error:byAccessor:](v8, "coordinateWritingItemAtURL:options:error:byAccessor:", v9, 8, &v38, v23);
  if (*((_BYTE *)v35 + 24))
  {
    v10 = (void *)v9;
    v11 = v8;
  }
  else
  {
    if (*((_BYTE *)v31 + 24))
      v38 = (id)v25[5];
    v10 = (void *)v9;
    v11 = v8;
    if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 1))
    {
      if (self)
        permanentLocation = self->super._permanentLocation;
      else
        permanentLocation = 0;
      NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Error attempting to write new baseline archive to url: %@, error: %@\nuserInfo: %@"), "-[PFUbiquityBaseline writeFileToLocation:error:]", 1212, permanentLocation, v38, objc_msgSend(v38, "userInfo"));
    }
    if (v38)
    {
      if (a4)
        *a4 = v38;
    }
    else
    {
      v15 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
      _NSCoreDataLog(17, v15, v16, v17, v18, v19, v20, v21, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Baseline/PFUbiquityBaseline.m");
      v22 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        v40 = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Baseline/PFUbiquityBaseline.m";
        v41 = 1024;
        v42 = 1213;
        _os_log_fault_impl(&dword_18A253000, v22, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
      }
    }
  }

  v12 = *((_BYTE *)v35 + 24);
  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v30, 8);
  _Block_object_dispose(&v34, 8);
  return v12;
}

void __48__PFUbiquityBaseline_writeFileToLocation_error___block_invoke(_QWORD *a1, void *a2)
{
  void *v4;
  uint64_t v5;
  void *v6;

  *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = 1;
  v4 = (void *)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v5 = objc_msgSend(a2, "URLByDeletingLastPathComponent");
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = objc_msgSend(v4, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v5, 1, 0, *(_QWORD *)(a1[7] + 8) + 40);
  if (!*(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24)
    && +[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 0))
  {
    NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Error creating directory for baseline file: %@\nError: %@\nuserInfo: %@"), "-[PFUbiquityBaseline writeFileToLocation:error:]_block_invoke", 1195, v5, *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40), objc_msgSend(*(id *)(*(_QWORD *)(a1[7] + 8) + 40), "userInfo"));
  }
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = -[_PFZipFileArchive writeToFile:options:error:](*(_QWORD *)(a1[4] + 144), (void *)objc_msgSend(a2, "path"), 1, *(_QWORD *)(a1[7] + 8) + 40);
  if (!*(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24))
  {
    if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 0))
    {
      v6 = *(void **)(*(_QWORD *)(a1[7] + 8) + 40);
      NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Error writing new baseline file to URL: %@\nError: %@\nuserInfo: %@"), "-[PFUbiquityBaseline writeFileToLocation:error:]_block_invoke", 1200, a2, v6, objc_msgSend(v6, "userInfo"));
    }
  }
}

- (BOOL)moveToPermanentLocation:(id *)a3
{
  BOOL v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  objc_super v14;
  void *v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v14.receiver = self;
  v14.super_class = (Class)PFUbiquityBaseline;
  v15 = 0;
  v4 = -[PFUbiquitySafeSaveFile moveToPermanentLocation:](&v14, sel_moveToPermanentLocation_, &v15);
  if (!v4)
  {
    if (v15)
    {
      if (a3)
        *a3 = v15;
    }
    else
    {
      v5 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
      _NSCoreDataLog(17, v5, v6, v7, v8, v9, v10, v11, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Baseline/PFUbiquityBaseline.m");
      v12 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        v17 = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Baseline/PFUbiquityBaseline.m";
        v18 = 1024;
        v19 = 1239;
        _os_log_fault_impl(&dword_18A253000, v12, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
      }
    }
  }
  return v4;
}

+ (uint64_t)removePeerSpecificIdentifiersFromStore:(uint64_t)a3 withLocalPeerID:
{
  id v5;
  _QWORD v7[7];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  uint64_t v13;

  objc_opt_self();
  v5 = (id)objc_msgSend(a2, "persistentStoreCoordinator");
  v8 = 0;
  v9 = &v8;
  v10 = 0x3052000000;
  v11 = __Block_byref_object_copy__47;
  v12 = __Block_byref_object_dispose__47;
  v13 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __77__PFUbiquityBaseline_removePeerSpecificIdentifiersFromStore_withLocalPeerID___block_invoke;
  v7[3] = &unk_1E1EDD138;
  v7[4] = a2;
  v7[5] = a3;
  v7[6] = &v8;
  objc_msgSend(v5, "performBlockAndWait:", v7);

  v9[5] = 0;
  _Block_object_dispose(&v8, 8);
  return 1;
}

void __77__PFUbiquityBaseline_removePeerSpecificIdentifiersFromStore_withLocalPeerID___block_invoke(uint64_t a1)
{
  void *v2;
  NSSaveChangesRequest *v3;

  if ((objc_msgSend(*(id *)(a1 + 32), "isReadOnly") & 1) == 0)
  {
    if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 2))
      NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Removing identifiers from: %@"), "+[PFUbiquityBaseline removePeerSpecificIdentifiersFromStore:withLocalPeerID:]_block_invoke", 1256, *(_QWORD *)(a1 + 32));
    v2 = (void *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "metadata"), "mutableCopy");
    objc_msgSend(v2, "removeObjectForKey:", CFSTR("com.apple.coredata.ubiquity.token"));
    objc_msgSend(v2, "removeObjectForKey:", CFSTR("PFUbiquitySetupContainerIdentifierKey"));
    objc_msgSend(v2, "removeObjectForKey:", CFSTR("PFUbiquitySetupStoreFilePeerIDKey"));
    objc_msgSend(*(id *)(a1 + 32), "setMetadata:", v2);

    v3 = objc_alloc_init(NSSaveChangesRequest);
    objc_msgSend(*(id *)(a1 + 32), "executeRequest:withContext:error:", v3, 0, 0);

    -[NSSQLCore setUbiquityTableValue:forKey:](*(_QWORD *)(a1 + 32), (uint64_t)&stru_1E1EE23F0, (uint64_t)CFSTR("containerId"));
    -[NSSQLCore setUbiquityTableValue:forKey:](*(_QWORD *)(a1 + 32), (uint64_t)CFSTR("NO"), (uint64_t)CFSTR("com.apple.coredata.ubiquity.localImportComplete"));
    if (!objc_msgSend(-[NSSQLCore fetchUbiquityKnowledgeVector](*(void **)(a1 + 32)), "objectForKey:", *(_QWORD *)(a1 + 40)))
    {
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithInt:", 0);
      -[NSSQLCore updateUbiquityKnowledgeForPeerWithID:andTransactionNumber:](*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));

      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = 0;
    }
  }
}

- (NSManagedObjectModel)createManagedObjectModelFromCurrentBaseline
{
  uint64_t v1;

  v1 = a1[1];
  if (v1 && *(_DWORD *)(v1 + 24) != 1)
    v1 = *(_QWORD *)(v1 + 8);
  return +[PFUbiquityBaseline createModelFromBaselineModelWithModelVersionHash:peerID:storeName:andUbiquityRootLocation:]((uint64_t)PFUbiquityBaseline, a1[16], a1[4], a1[15], (void *)v1);
}

- (id)createManagedObjectModel
{
  const __CFData *v2;
  void *v3;
  id v4;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;

  if (!a1)
    return 0;
  v9 = 0;
  v2 = (const __CFData *)objc_msgSend((id)-[_PFZipFileArchive contentsForEntryName:](*(_QWORD *)(a1 + 144), (uint64_t)CFSTR("model")), "mutableCopy");
  v8 = 0;
  +[NSManagedObjectModel _newModelFromOptimizedEncoding:error:]((uint64_t)NSManagedObjectModel, v2, (uint64_t *)&v8);
  v4 = v3;
  if (!v3)
  {
    if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 0))
      NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Got nil model for baseline: %@\nError: %@\nuserInfo: %@"), "-[PFUbiquityBaseline createManagedObjectModel]", 1422, a1, v8, objc_msgSend(v8, "userInfo"));
    v6 = -[_PFZipFileArchive contentsForEntryName:](*(_QWORD *)(a1 + 144), (uint64_t)CFSTR("gcmodel"));
    v7 = objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
    v4 = (id)+[_PFRoutines unarchiveCylicGraphObjectOfClasses:fromData:error:]((uint64_t)_PFRoutines, v7, v6, (uint64_t)&v9);
    if (v9 && +[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 0))
      NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Failed to read gc model data: %@"), "-[PFUbiquityBaseline createManagedObjectModel]", 1429, v9);
  }

  return v4;
}

+ (NSManagedObjectModel)createModelFromBaselineModelWithModelVersionHash:(uint64_t)a3 peerID:(uint64_t)a4 storeName:(void *)a5 andUbiquityRootLocation:
{
  void *v9;
  void *v10;
  NSManagedObjectModel *v11;
  void *v12;
  void *v13;

  objc_opt_self();
  objc_opt_self();
  v9 = +[PFUbiquityLocation createCurrentBaselineLocation:forStoreName:peerID:andModelVersionHash:forFileNamed:withUbiquityRootLocation:]((uint64_t)PFUbiquityLocation, 7, a4, a3, a2, (uint64_t)CFSTR("baseline.model"), a5);
  v10 = (void *)-[PFUbiquityLocation createFullURL]((uint64_t)v9);
  if (objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "fileExistsAtPath:", objc_msgSend(v10, "path")))
  {
    v11 = -[NSManagedObjectModel initWithContentsOfOptimizedURL:]([NSManagedObjectModel alloc], "initWithContentsOfOptimizedURL:", v10);
    if (v11)
      goto LABEL_8;
    if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 2))
      NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Couldn't load optimized model at url: %@"), "+[PFUbiquityBaseline createBaselineOptimizedModelForStoreName:peerID:modelVersionHash:andUbiquityRootLocation:]", 1454, v10);
  }
  else if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 2))
  {
    NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Cannot find optimized model at URL: %@.\nIt appears there is no current baseline."), "+[PFUbiquityBaseline createBaselineOptimizedModelForStoreName:peerID:modelVersionHash:andUbiquityRootLocation:]", 1457, v10);
  }
  v11 = 0;
LABEL_8:

  if (!v11)
  {
    objc_opt_self();
    v12 = +[PFUbiquityLocation createCurrentBaselineLocation:forStoreName:peerID:andModelVersionHash:forFileNamed:withUbiquityRootLocation:]((uint64_t)PFUbiquityLocation, 7, a4, a3, a2, (uint64_t)CFSTR("baseline.gcmodel"), a5);
    v13 = (void *)-[PFUbiquityLocation createFullURL]((uint64_t)v12);
    if (objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "fileExistsAtPath:", objc_msgSend(v13, "path")))
    {
      v11 = -[NSManagedObjectModel initWithContentsOfURL:]([NSManagedObjectModel alloc], "initWithContentsOfURL:", v13);
      if (v11)
      {
LABEL_16:

        return v11;
      }
      if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 0))
        NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Couldn't load model at url: %@"), "+[PFUbiquityBaseline createBaselineGCModelForStoreName:peerID:modelVersionHash:andUbiquityRootLocation:]", 1473, v13);
    }
    else if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 2))
    {
      NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Cannot find model at URL: %@.\nIt appears there is no current baseline."), "+[PFUbiquityBaseline createBaselineGCModelForStoreName:peerID:modelVersionHash:andUbiquityRootLocation:]", 1476, v13);
    }
    v11 = 0;
    goto LABEL_16;
  }
  return v11;
}

uint64_t __124__PFUbiquityBaseline_metadataFromCurrentBaselineForStoreWithName_peerID_modelVersionHash_andUbiquityRootLocation_withError___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithContentsOfURL:", a2);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = result;
  return result;
}

- (uint64_t)removeUnusedExternalDataReferences:(uint64_t)a1
{
  uint64_t v2;
  void *v3;
  void *v4;
  NSPersistentStoreCoordinator *v5;
  NSPersistentStoreCoordinator *v6;
  id v7;
  NSManagedObjectModel *v8;
  NSArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  id v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  NSObject *v28;
  uint64_t v29;
  PFUbiquityLocation *v30;
  id v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  BOOL v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  NSObject *v47;
  NSPersistentStoreCoordinator *v49;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  id v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  id v64;
  _BYTE v65[128];
  uint8_t v66[128];
  uint8_t buf[4];
  const char *v68;
  __int16 v69;
  int v70;
  uint64_t v71;

  v2 = a1;
  v71 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v55 = 0;
    v64 = 0;
    v3 = (void *)objc_opt_new();
    v4 = (void *)objc_opt_new();
    v5 = -[PFUbiquityBaseline _createPersistentStoreCoordinatorForCurrentBaseline:error:]((_QWORD *)v2, 1, &v64);
    v6 = v5;
    if (v5 && -[NSArray count](-[NSPersistentStoreCoordinator persistentStores](v5, "persistentStores"), "count") == 1)
    {
      v7 = -[NSArray lastObject](-[NSPersistentStoreCoordinator persistentStores](v6, "persistentStores"), "lastObject");
      v8 = -[NSPersistentStoreCoordinator managedObjectModel](v6, "managedObjectModel");
      v49 = v6;
      v62 = 0u;
      v63 = 0u;
      v60 = 0u;
      v61 = 0u;
      v9 = -[NSManagedObjectModel entities](v8, "entities");
      v10 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v60, buf, 16);
      if (v10)
      {
        v11 = *(_QWORD *)v61;
        do
        {
          v12 = 0;
          do
          {
            if (*(_QWORD *)v61 != v11)
              objc_enumerationMutation(v9);
            v13 = *(_QWORD *)(*((_QWORD *)&v60 + 1) + 8 * v12);
            if (v13)
            {
              if ((*(_BYTE *)(v13 + 120) & 4) != 0)
              {
                v14 = *(_QWORD *)(v13 + 72);
              }
              else
              {
                do
                {
                  v14 = v13;
                  v13 = objc_msgSend((id)v13, "superentity");
                }
                while (v13);
              }
            }
            else
            {
              v14 = 0;
            }
            objc_msgSend(v4, "addObject:", v14);
            ++v12;
          }
          while (v12 != v10);
          v15 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v60, buf, 16);
          v10 = v15;
        }
        while (v15);
      }
      v58 = 0u;
      v59 = 0u;
      v56 = 0u;
      v57 = 0u;
      v16 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v56, v66, 16);
      if (v16)
      {
        v17 = *(_QWORD *)v57;
        do
        {
          for (i = 0; i != v16; ++i)
          {
            if (*(_QWORD *)v57 != v17)
              objc_enumerationMutation(v4);
            v19 = -[NSSQLCore newFetchUUIDSForSubentitiesRootedAt:](v7, *(void **)(*((_QWORD *)&v56 + 1) + 8 * i));
            objc_msgSend(v3, "addObjectsFromArray:", v19);

          }
          v16 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v56, v66, 16);
        }
        while (v16);
      }
      v20 = v3;
      v6 = v49;
    }
    else
    {
      if (v64)
      {
        v55 = v64;
      }
      else
      {
        v21 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
        _NSCoreDataLog(17, v21, v22, v23, v24, v25, v26, v27, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Baseline/PFUbiquityBaseline.m");
        v28 = __pflogFaultLog;
        if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 136315394;
          v68 = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Baseline/PFUbiquityBaseline.m";
          v69 = 1024;
          v70 = 1633;
          _os_log_fault_impl(&dword_18A253000, v28, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
        }
      }
      v8 = 0;

      v20 = 0;
    }

    if (v20)
    {
      v29 = *(_QWORD *)(v2 + 8);
      if (v29 && *(_DWORD *)(v29 + 24) != 1)
        v29 = *(_QWORD *)(v29 + 8);
      v30 = +[PFUbiquityLocation createUbiquityExternalDataReferenceStoreLocationForStoreName:withUbiquityRootLocation:]((uint64_t)PFUbiquityLocation, *(_QWORD *)(v2 + 120), v29);
      v31 = +[PFUbiquityLocation createArrayOfSubLocationsAtLocation:error:]((uint64_t)PFUbiquityLocation, (uint64_t)v30, (uint64_t)&v55);
      v32 = v31;
      if (v31)
      {
        v53 = 0u;
        v54 = 0u;
        v51 = 0u;
        v52 = 0u;
        v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v51, v65, 16);
        if (!v33)
          goto LABEL_50;
        v34 = *(_QWORD *)v52;
        v35 = 1;
        do
        {
          v36 = 0;
          do
          {
            if (*(_QWORD *)v52 != v34)
              objc_enumerationMutation(v32);
            v37 = *(_QWORD *)(*((_QWORD *)&v51 + 1) + 8 * v36);
            if (v37)
              v38 = *(_QWORD *)(v37 + 56);
            else
              v38 = 0;
            if ((objc_msgSend(v20, "containsObject:", v38) & 1) == 0)
              v35 = -[PFUbiquityLocation removeFileAtLocation:error:](v37, *(_QWORD *)(v2 + 32), &v55);
            ++v36;
          }
          while (v33 != v36);
          v39 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v51, v65, 16);
          v33 = v39;
        }
        while (v39);
        if (v35)
        {
LABEL_50:
          v2 = 1;
LABEL_58:

          return v2;
        }
      }
    }
    else
    {
      v32 = 0;
      v30 = 0;
    }
    if (v55)
    {
      if (a2)
      {
        v2 = 0;
        *a2 = v55;
        goto LABEL_58;
      }
    }
    else
    {
      v40 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
      _NSCoreDataLog(17, v40, v41, v42, v43, v44, v45, v46, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Baseline/PFUbiquityBaseline.m");
      v47 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        v68 = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Baseline/PFUbiquityBaseline.m";
        v69 = 1024;
        v70 = 1677;
        _os_log_fault_impl(&dword_18A253000, v47, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
      }
    }
    v2 = 0;
    goto LABEL_58;
  }
  return v2;
}

@end
