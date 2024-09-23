@implementation PFUbiquityMigrationManager

- (PFUbiquityMigrationManager)initWithDestinationModel:(id)a3 storeName:(id)a4 previousModelVersionHash:(id)a5 ubiquityRootLocation:(id)a6 localPeerID:(id)a7
{
  NSManagedObjectModel *v11;
  PFUbiquityMigrationManager *v12;

  v11 = +[PFUbiquityBaseline createModelFromBaselineModelWithModelVersionHash:peerID:storeName:andUbiquityRootLocation:]((uint64_t)PFUbiquityBaseline, (uint64_t)a5, (uint64_t)a7, (uint64_t)a4, a6);
  v12 = -[PFUbiquityMigrationManager initWithDestinationModel:sourceModel:ubiquityRootLocation:localPeerID:](self, "initWithDestinationModel:sourceModel:ubiquityRootLocation:localPeerID:", a3, v11, a6, a7);

  return v12;
}

- (PFUbiquityMigrationManager)initWithDestinationModel:(id)a3 sourceModel:(id)a4 ubiquityRootLocation:(id)a5 localPeerID:(id)a6
{
  PFUbiquityMigrationManager *v10;
  NSManagedObjectModel *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)PFUbiquityMigrationManager;
  v10 = -[PFUbiquityMigrationManager init](&v13, sel_init);
  if (v10)
  {
    v11 = (NSManagedObjectModel *)a4;
    v10->_sourceModel = v11;
    if (v11)
    {
      v10->_rootLocation = (PFUbiquityLocation *)a5;
      v10->_destinationModel = (NSManagedObjectModel *)a3;
      v10->_localPeerID = (NSString *)a6;
    }
    else
    {

      return 0;
    }
  }
  return v10;
}

- (void)dealloc
{
  objc_super v3;

  self->_rootLocation = 0;
  self->_destinationModel = 0;

  self->_sourceModel = 0;
  self->_localPeerID = 0;
  v3.receiver = self;
  v3.super_class = (Class)PFUbiquityMigrationManager;
  -[PFUbiquityMigrationManager dealloc](&v3, sel_dealloc);
}

- (uint64_t)migrateTransactionLogs:(uint64_t)a3 andBaselineIfNecessaryForStoreName:(uint64_t)a4 peerID:(_QWORD *)a5 error:
{
  void *v9;
  void *v10;
  void *v11;
  PFUbiquityTransactionLogMigrator *v12;
  BOOL v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  PFUbiquityBaseline *v22;
  int v23;
  int v24;
  void *v25;
  NSString *v26;
  char *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  NSMigrationManager *v31;
  uint64_t v32;
  _BOOL4 v33;
  int v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  NSObject *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  NSObject *v58;
  char v59;
  char v60;
  char *v62;
  uint64_t v63;
  __CFString *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  NSObject *v72;
  void *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  NSObject *v81;
  PFUbiquityBaseline *v83;
  NSMappingModel *v84;
  id v85;
  char v86;
  __CFString *v87;
  void *v88;
  uint8_t buf[4];
  const char *v90;
  __int16 v91;
  int v92;
  uint64_t v93;

  v93 = *MEMORY[0x1E0C80C00];
  if (!a1)
  {
    v60 = 0;
    return v60 & 1;
  }
  v85 = 0;
  v10 = (void *)a1[1];
  v9 = (void *)a1[2];
  v11 = (void *)a1[3];
  v84 = +[NSMappingModel inferredMappingModelForSourceModel:destinationModel:error:](NSMappingModel, "inferredMappingModelForSourceModel:destinationModel:error:", v9, v10, &v85);
  if (!v84)
  {
    if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 0))
      NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@\nError: %@"), "-[PFUbiquityMigrationManager migrateTransactionLogs:andBaselineIfNecessaryForStoreName:peerID:error:]", 78, CFSTR("Failed to migrate ubiquitous content, unable to create mapping model"), v85);
    v16 = (void *)MEMORY[0x1E0CB35C8];
    if (v85)
      v17 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", CFSTR("Failed to migrate ubiquitous content, unable to create mapping model"), CFSTR("reason"), v85, *MEMORY[0x1E0CB3388], 0);
    else
      v17 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", CFSTR("Failed to migrate ubiquitous content, unable to create mapping model"), CFSTR("reason"), 0);
    v35 = (void *)objc_msgSend(v16, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134060, v17);
    v85 = v35;
    if (v35)
      goto LABEL_43;
    v36 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
    _NSCoreDataLog(17, v36, v37, v38, v39, v40, v41, v42, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/PFUbiquityMigrationManager.m");
    v43 = __pflogFaultLog;
    if (!os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      goto LABEL_46;
    *(_DWORD *)buf = 136315394;
    v90 = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/PFUbiquityMigrationManager.m";
    v91 = 1024;
    v92 = 84;
    goto LABEL_80;
  }
  if (a2)
  {
    if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 2))
      NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Migrating transaction logs"), "-[PFUbiquityMigrationManager migrateTransactionLogs:andBaselineIfNecessaryForStoreName:peerID:error:]", 89);
    v12 = -[PFUbiquityTransactionLogMigrator initWithSourceModel:destinationModel:mappingModel:localPeerID:]([PFUbiquityTransactionLogMigrator alloc], "initWithSourceModel:destinationModel:mappingModel:localPeerID:", v9, v10, v84, a1[4]);
    v13 = -[PFUbiquityTransactionLogMigrator migrateTransactionLogsForStoreName:andLocalPeerID:atUbiquityRootLocation:error:]((uint64_t)v12, a3, a4, v11, &v85);

    if (!v13)
    {
      if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 0))
        NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@\nError: %@"), "-[PFUbiquityMigrationManager migrateTransactionLogs:andBaselineIfNecessaryForStoreName:peerID:error:]", 97, CFSTR("Failed to migrate ubiquitous content, unable to migrate transaction logs"), v85);
      v14 = (void *)MEMORY[0x1E0CB35C8];
      if (v85)
        v15 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", CFSTR("Failed to migrate ubiquitous content, unable to migrate transaction logs"), CFSTR("reason"), v85, *MEMORY[0x1E0CB3388], 0);
      else
        v15 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", CFSTR("Failed to migrate ubiquitous content, unable to migrate transaction logs"), CFSTR("reason"), 0);
      v35 = (void *)objc_msgSend(v14, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134060, v15);
      v85 = v35;
      if (v35)
      {
LABEL_43:
        if (a5)
          *a5 = v35;
        goto LABEL_46;
      }
      v44 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
      _NSCoreDataLog(17, v44, v45, v46, v47, v48, v49, v50, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/PFUbiquityMigrationManager.m");
      v43 = __pflogFaultLog;
      if (!os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
LABEL_46:
        v20 = 0;
        v21 = 0;
        v22 = 0;
        v83 = 0;
LABEL_47:
        v23 = 0;
        v86 = 0;
        goto LABEL_53;
      }
      *(_DWORD *)buf = 136315394;
      v90 = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/PFUbiquityMigrationManager.m";
      v91 = 1024;
      v92 = 103;
LABEL_80:
      _os_log_fault_impl(&dword_18A253000, v43, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
      goto LABEL_46;
    }
  }
  else if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 2))
  {
    NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Migrating baseline (if necessary)"), "-[PFUbiquityMigrationManager migrateTransactionLogs:andBaselineIfNecessaryForStoreName:peerID:error:]", 107);
  }
  v18 = +[PFUbiquityLocation createVersionHashStringForModel:]((uint64_t)PFUbiquityLocation, v9);
  v19 = (void *)+[PFUbiquityLocation createVersionHashStringForModel:]((uint64_t)PFUbiquityLocation, v10);
  v20 = (void *)v18;
  v83 = -[PFUbiquityBaseline initWithLocalPeerID:ubiquityRootLocation:forStoreWithName:andManagedObjectModel:]([PFUbiquityBaseline alloc], "initWithLocalPeerID:ubiquityRootLocation:forStoreWithName:andManagedObjectModel:", a1[4], v11, a3, v10);
  v21 = v19;
  if ((-[PFUbiquitySafeSaveFile existsInCloud](v83) & 1) != 0)
  {
    if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 3))
      NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Baseline exists in the cloud, the current baseline cache will be created if it is needed."), "-[PFUbiquityMigrationManager migrateTransactionLogs:andBaselineIfNecessaryForStoreName:peerID:error:]", 179);
    v22 = 0;
    goto LABEL_21;
  }
  if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 2))
    NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Missing baseline archive for the migration destination data model, need to migrate baseline archive from the source version"), "-[PFUbiquityMigrationManager migrateTransactionLogs:andBaselineIfNecessaryForStoreName:peerID:error:]", 117);
  v22 = -[PFUbiquityBaseline initWithLocalPeerID:ubiquityRootLocation:forStoreWithName:andManagedObjectModel:]([PFUbiquityBaseline alloc], "initWithLocalPeerID:ubiquityRootLocation:forStoreWithName:andManagedObjectModel:", a1[4], v11, a3, v9);
  v24 = -[PFUbiquitySafeSaveFile existsInCloud](v22);
  if (!v24)
  {
    if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 2))
      NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Failed to initialize src data model baseline: %@"), "-[PFUbiquityMigrationManager migrateTransactionLogs:andBaselineIfNecessaryForStoreName:peerID:error:]", 173, v85);
    if (v85)
    {
      if (a5)
        *a5 = v85;
    }
    else
    {
      v51 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
      _NSCoreDataLog(17, v51, v52, v53, v54, v55, v56, v57, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/PFUbiquityMigrationManager.m");
      v58 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        v90 = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/PFUbiquityMigrationManager.m";
        v91 = 1024;
        v92 = 174;
        _os_log_fault_impl(&dword_18A253000, v58, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
      }
    }
    goto LABEL_52;
  }
  if (!v22
    || !-[PFUbiquityBaseline loadFileFromLocation:error:](v22, "loadFileFromLocation:error:", v22->super._currentLocation, &v85))
  {
    if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 2))
      NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Missing baseline archive for the migration src data model, let the standard ubiquity awake/launch logic start a new baseline"), "-[PFUbiquityMigrationManager migrateTransactionLogs:andBaselineIfNecessaryForStoreName:peerID:error:]", 170);
LABEL_52:
    v23 = 0;
    v86 = v24 ^ 1;
    goto LABEL_53;
  }
  -[PFUbiquityBaselineMetadata _migrateToModelVersionHash:]((id *)&v22->_metadata->super.isa, v19);
  v25 = (void *)-[NSMutableDictionary objectForKey:](v22->_storeFilenameToData, "objectForKey:", v22->_storeFilename);
  v26 = -[NSString stringByAppendingPathComponent:](NSTemporaryDirectory(), "stringByAppendingPathComponent:", CFSTR("ubbaselinestoreXXXXXX"));
  v27 = (char *)malloc_type_malloc(-[NSString length](v26, "length"), 0x100004077774924uLL);
  strlcpy(v27, -[NSString fileSystemRepresentation](v26, "fileSystemRepresentation"), -[NSString length](v26, "length"));
  if (!mkdtemp(v27))
  {
    v85 = (id)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 512, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", CFSTR("Failed to create temp directory for migrating source baseline"), CFSTR("reason"), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *__error()), CFSTR("errno"), 0));
    if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 0))
      NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Failed to migrate baseline: %@"), "-[PFUbiquityMigrationManager migrateTransactionLogs:andBaselineIfNecessaryForStoreName:peerID:error:]", 132, v85);
    if (v85)
    {
      v62 = v27;
      if (a5)
        *a5 = v85;
    }
    else
    {
      v62 = v27;
      v65 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
      _NSCoreDataLog(17, v65, v66, v67, v68, v69, v70, v71, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/PFUbiquityMigrationManager.m");
      v72 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        v90 = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/PFUbiquityMigrationManager.m";
        v91 = 1024;
        v92 = 133;
        _os_log_fault_impl(&dword_18A253000, v72, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
      }
    }
    free(v62);
    goto LABEL_47;
  }
  v28 = (void *)objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v27, 4));
  v29 = objc_msgSend(v28, "URLByAppendingPathComponent:", CFSTR("src_baseline.store"));
  v30 = objc_msgSend(v28, "URLByAppendingPathComponent:", CFSTR("dst_baseline.store"));
  objc_msgSend(v25, "writeToURL:atomically:", v29, 0);
  v31 = -[NSMigrationManager initWithSourceModel:destinationModel:]([NSMigrationManager alloc], "initWithSourceModel:destinationModel:", v9, v10);
  v87 = CFSTR("NSUbiquityOptionsRemovedDuringAutomaticMigrationKey");
  v88 = &unk_1E1F4B858;
  v32 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v88, &v87, 1);
  v33 = -[NSMigrationManager migrateStoreFromURL:type:options:withMappingModel:toDestinationURL:destinationType:destinationOptions:error:](v31, "migrateStoreFromURL:type:options:withMappingModel:toDestinationURL:destinationType:destinationOptions:error:", v29, CFSTR("SQLite"), v32, v84, v30, CFSTR("SQLite"), v32, &v85);

  if (v33)
  {
    if (-[PFUbiquityBaseline gatherContentsFromMigratedBaseline:withStoreFileURL:error:]((uint64_t)v83, v22, v30, &v85))
    {
      if (-[PFUbiquitySafeSaveFile safeSaveFile:moveToPermanentLocation:error:]((uint64_t)v83, 0, 1, &v85))
      {
        v34 = -[PFUbiquityBaseline makeCurrentBaselineWithError:]((uint64_t)v83, &v85);
        goto LABEL_71;
      }
      if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 0))
      {
        v63 = 157;
        v64 = CFSTR("%s(%d): CoreData: Ubiquity:  Error writing out migrated baseline: %@\nError: %@");
        goto LABEL_69;
      }
    }
    else if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 0))
    {
      v63 = 160;
      v64 = CFSTR("%s(%d): CoreData: Ubiquity:  Error gathering contents for migrated baseline: %@\nError: %@");
LABEL_69:
      v34 = 0;
      NSLog((NSString *)v64, "-[PFUbiquityMigrationManager migrateTransactionLogs:andBaselineIfNecessaryForStoreName:peerID:error:]", v63, v83, v85);
      goto LABEL_71;
    }
  }
  v34 = 0;
LABEL_71:
  v73 = (void *)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  objc_msgSend(v73, "removeItemAtPath:error:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), v27), 0);
  free(v27);
  if (v34)
  {
LABEL_21:
    v23 = 1;
LABEL_53:
    v59 = 1;
    goto LABEL_54;
  }
  if (!v85)
  {
    v74 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
    _NSCoreDataLog(17, v74, v75, v76, v77, v78, v79, v80, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/PFUbiquityMigrationManager.m");
    v81 = __pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315394;
      v90 = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/PFUbiquityMigrationManager.m";
      v91 = 1024;
      v92 = 166;
      _os_log_fault_impl(&dword_18A253000, v81, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
    }
    goto LABEL_77;
  }
  if (!a5)
  {
LABEL_77:
    v59 = 0;
    goto LABEL_78;
  }
  v59 = 0;
  *a5 = v85;
LABEL_78:
  v23 = 1;
LABEL_54:

  v60 = v86;
  if (v23)
    v60 = v59;
  return v60 & 1;
}

@end
