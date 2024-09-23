@implementation PFUbiquityMetadataFactoryEntry

- (PFUbiquityMetadataFactoryEntry)init
{
  PFUbiquityMetadataFactoryEntry *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PFUbiquityMetadataFactoryEntry;
  result = -[PFUbiquityMetadataFactoryEntry init](&v3, sel_init);
  if (result)
  {
    *(_OWORD *)&result->_store = 0u;
    *(_OWORD *)&result->_metadataStoreFileLocation = 0u;
  }
  return result;
}

- (PFUbiquityMetadataFactoryEntry)initWithMetadataStoreFileLocation:(id)a3
{
  PFUbiquityMetadataFactoryEntry *v4;
  PFUbiquityMetadataFactoryFilePresenter *v5;

  v4 = -[PFUbiquityMetadataFactoryEntry init](self, "init");
  if (v4)
  {
    v4->_metadataStoreFileLocation = (PFUbiquityLocation *)a3;
    v5 = -[PFUbiquityMetadataFactoryFilePresenter initWithMetadataStoreFileLocation:]([PFUbiquityMetadataFactoryFilePresenter alloc], "initWithMetadataStoreFileLocation:", a3);
    v4->_filePresenter = v5;
    objc_msgSend(MEMORY[0x1E0CB3600], "addFilePresenter:", v5);
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  objc_msgSend(MEMORY[0x1E0CB3600], "removeFilePresenter:", self->_filePresenter);

  self->_metadataStoreFileLocation = 0;
  self->_store = 0;
  self->_filePresenter = 0;

  self->_psc = 0;
  v3.receiver = self;
  v3.super_class = (Class)PFUbiquityMetadataFactoryEntry;
  -[PFUbiquityMetadataFactoryEntry dealloc](&v3, sel_dealloc);
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PFUbiquityMetadataFactoryEntry;
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@\n\tmetadataStoreFileLocation: %@\n\tpsc: %@\n\tstore: %@\n\tfilePresenter: %@\n"), -[PFUbiquityMetadataFactoryEntry description](&v3, sel_description), self->_metadataStoreFileLocation, self->_psc, self->_store, self->_filePresenter);
}

- (uint64_t)initializePersistentStoreCoordinator:(uint64_t)a1
{
  id v3;
  NSPersistentStoreCoordinator *v4;
  NSPersistentStoreCoordinator *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  PFUbiquityFileCoordinator *v12;
  char v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  NSPersistentStoreCoordinator *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  NSObject *v32;
  int v34;
  int v35;
  uint64_t v36;
  void *v38;
  NSPersistentStoreCoordinator *v39;
  void *v40;
  PFUbiquityFileCoordinator *v41;
  void *v42;
  uint64_t v43;
  _QWORD v44[7];
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  char v48;
  id v49;
  _BYTE buf[24];
  char v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v49 = 0;
  objc_opt_self();
  v3 = -[PFUbiquityMetadataFactory newMetadataManagedObjectModel](_sharedFactory);
  if (v3)
  {
    v4 = -[NSPersistentStoreCoordinator initWithManagedObjectModel:]([NSPersistentStoreCoordinator alloc], "initWithManagedObjectModel:", v3);
    *(_QWORD *)(a1 + 16) = v4;
    v5 = v4;

    v39 = v5;
  }
  else
  {
    v39 = 0;
  }
  v6 = *(_QWORD *)(a1 + 8);
  if (v6)
  {
    v7 = *(_QWORD *)(v6 + 32);
    v8 = *(_QWORD *)(v6 + 40);
    if (*(_DWORD *)(v6 + 24) != 1)
      v6 = *(_QWORD *)(v6 + 8);
  }
  else
  {
    v8 = 0;
    v7 = 0;
  }
  v9 = +[PFUbiquityLocation createMetadataPeerStoreLocationForLocalPeerID:storeName:andUbiquityRootLocation:]((uint64_t)PFUbiquityLocation, v7, v8, (void *)v6);
  v10 = -[PFUbiquityLocation createFullPath]((uint64_t)v9);
  v38 = -[PFUbiquityLocation createFullPath](*(_QWORD *)(a1 + 8));
  v40 = v10;
  v42 = v9;
  v11 = (void *)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  v51 = 0;
  v45 = 0;
  v46 = &v45;
  v47 = 0x2020000000;
  v48 = 0;
  v12 = +[PFUbiquityFileCoordinator newFileCoordinatorForUbiquityRootLocation:]((uint64_t)PFUbiquityFileCoordinator, (uint64_t)v9);
  v44[0] = MEMORY[0x1E0C809B0];
  v44[1] = 3221225472;
  v44[2] = __71__PFUbiquityMetadataFactoryEntry_initializePersistentStoreCoordinator___block_invoke;
  v44[3] = &unk_1E1EE1E18;
  v44[5] = &v45;
  v44[6] = buf;
  v44[4] = v11;
  v41 = v12;
  -[PFUbiquityFileCoordinator coordinateReadingItemAtLocation:options:retryOnError:error:byAccessor:](v12, (uint64_t)v9, 1, 0, &v49, (uint64_t)v44);
  if (!*((_BYTE *)v46 + 24))
  {
    if (objc_msgSend(v49, "code") == 4 || objc_msgSend(v49, "code") == 260)
    {
      v20 = (void *)objc_msgSend(v49, "domain");
      if (objc_msgSend(v20, "isEqualToString:", *MEMORY[0x1E0CB28A8]))
      {
        *(_BYTE *)(*(_QWORD *)&buf[8] + 24) = 0;
        v49 = 0;
        if (v3)
          goto LABEL_10;
      }
    }
LABEL_20:
    v14 = 0;
    v18 = 0;
    v16 = 0;
    v15 = 0;
    v13 = 1;
    goto LABEL_21;
  }
  if (!v3)
    goto LABEL_20;
LABEL_10:
  if (*(_BYTE *)(*(_QWORD *)&buf[8] + 24))
    goto LABEL_14;
  v13 = 1;
  if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 3))
    NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Creating file: %@"), "-[PFUbiquityMetadataFactoryEntry initializePersistentStoreCoordinator:]", 122, v10);
  if (objc_msgSend(v11, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v10, 1, 0, &v49))
  {
LABEL_14:
    v13 = 1;
    v14 = (void *)-[PFUbiquityLocation createFullURL](*(_QWORD *)(a1 + 8));
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", CFSTR("WAL"), CFSTR("journal_mode"), 0);
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithBool:", 1);
    v17 = objc_alloc(MEMORY[0x1E0C99D80]);
    v18 = (void *)objc_msgSend(v17, "initWithObjectsAndKeys:", v15, CFSTR("NSSQLitePragmasOption"), v16, CFSTR("NSSQLitePersistWALOption"), *MEMORY[0x1E0CB2AE0], CFSTR("NSPersistentStoreFileProtectionKey"), 0);
    v19 = objc_msgSend(*(id *)(a1 + 16), "addPersistentStoreWithType:configuration:URL:options:error:", CFSTR("SQLite"), 0, v14, v18, &v49);
    *(_QWORD *)(a1 + 24) = v19;
    if (v19)
      goto LABEL_15;
    if (!v49)
      goto LABEL_46;
    v43 = 0;
    v34 = objc_msgSend(*(id *)(a1 + 16), "destroyPersistentStoreAtURL:withType:options:error:", v14, CFSTR("SQLite"), v18, &v43);
    if (v43)
      v35 = v34;
    else
      v35 = 0;
    if (v35 == 1
      && +[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 0))
    {
      NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@\nError removing metaDataStore: %@"), "-[PFUbiquityMetadataFactoryEntry initializePersistentStoreCoordinator:]", 147, a1, v43);
    }
    v36 = objc_msgSend(*(id *)(a1 + 16), "addPersistentStoreWithType:configuration:URL:options:error:", CFSTR("SQLite"), 0, v14, v18, &v49);
    *(_QWORD *)(a1 + 24) = v36;
    if (v36)
    {
LABEL_15:
      v13 = 0;
    }
    else
    {
LABEL_46:
      if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 0))
        NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@\nTrouble adding the metadata store to the coordinator: %@\nuserInfo: %@"), "-[PFUbiquityMetadataFactoryEntry initializePersistentStoreCoordinator:]", 158, a1, v49, objc_msgSend(v49, "userInfo"));
    }
  }
  else
  {
    v14 = 0;
    v18 = 0;
    v16 = 0;
    v15 = 0;
  }
LABEL_21:
  _Block_object_dispose(&v45, 8);
  _Block_object_dispose(buf, 8);
  if ((v13 & 1) == 0)
  {
    v24 = 1;
    v23 = v38;
    v22 = v39;
    v21 = v42;
    goto LABEL_29;
  }
  v21 = v42;
  if (!v49)
  {
    v25 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
    v23 = v38;
    v22 = v39;
    _NSCoreDataLog(17, v25, v26, v27, v28, v29, v30, v31, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Metadata/PFUbiquityMetadataFactoryEntry.m");
    v32 = __pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Metadata/PFUbi"
                           "quityMetadataFactoryEntry.m";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 166;
      _os_log_fault_impl(&dword_18A253000, v32, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
    }
    goto LABEL_28;
  }
  v23 = v38;
  v22 = v39;
  if (!a2)
  {
LABEL_28:
    v24 = 0;
    goto LABEL_29;
  }
  v24 = 0;
  *a2 = v49;
LABEL_29:

  return v24;
}

uint64_t __71__PFUbiquityMetadataFactoryEntry_initializePersistentStoreCoordinator___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  result = objc_msgSend(*(id *)(a1 + 32), "fileExistsAtPath:", objc_msgSend(a2, "path"));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = result;
  return result;
}

@end
