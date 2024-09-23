@implementation PFUbiquityTransactionLogMigrator

- (PFUbiquityTransactionLogMigrator)initWithSourceModel:(id)a3 destinationModel:(id)a4 mappingModel:(id)a5 localPeerID:(id)a6
{
  PFUbiquityTransactionLogMigrator *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)PFUbiquityTransactionLogMigrator;
  v10 = -[PFUbiquityTransactionLogMigrator init](&v12, sel_init);
  if (v10)
  {
    v10->_srcModel = (NSManagedObjectModel *)a3;
    v10->_dstModel = (NSManagedObjectModel *)a4;
    v10->_mappingModel = (NSMappingModel *)a5;
    v10->_localPeerID = (NSString *)a6;
    -[PFUbiquityTransactionLogMigrator populateMappingsByEntityName](v10, "populateMappingsByEntityName");
  }
  return v10;
}

- (void)dealloc
{
  objc_super v3;

  self->_localPeerID = 0;
  self->_mappingModel = 0;

  self->_srcModel = 0;
  self->_dstModel = 0;

  self->_mappingsByEntityName = 0;
  self->_removedEntities = 0;
  v3.receiver = self;
  v3.super_class = (Class)PFUbiquityTransactionLogMigrator;
  -[PFUbiquityTransactionLogMigrator dealloc](&v3, sel_dealloc);
}

- (void)populateMappingsByEntityName
{
  id v3;
  id v4;
  id v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v6 = -[NSMappingModel entityMappings](self->_mappingModel, "entityMappings");
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v20 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        v12 = objc_msgSend(v11, "sourceEntityName");
        v13 = objc_msgSend(v11, "mappingType");
        if ((unint64_t)(v13 - 4) < 2)
        {
          objc_msgSend(v4, "addObject:", v11);
          v14 = v3;
        }
        else
        {
          if (v13 == 2)
            continue;
          v14 = v5;
          if (v13 != 3)
          {
            v15 = *MEMORY[0x1E0C99768];
            v16 = (void *)MEMORY[0x1E0C99D80];
            if (objc_msgSend(v11, "name"))
              v17 = objc_msgSend(v11, "name");
            else
              v17 = objc_msgSend(MEMORY[0x1E0C99E38], "null");
            v18 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]((uint64_t)_NSCoreDataException, v15, 134110, (uint64_t)CFSTR("Unsupported entity mapping type"), (void *)objc_msgSend(v16, "dictionaryWithObjectsAndKeys:", v17, CFSTR("entityMapping"), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v11, "mappingType")), CFSTR("mappingType"), 0));
            objc_exception_throw(v18);
          }
        }
        objc_msgSend(v14, "addObject:", v12);
      }
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v8);
  }
  self->_mappingsByEntityName = (NSDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjects:forKeys:", v4, v3);

  self->_removedEntities = (NSSet *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", v5);
}

- (BOOL)migrateTransactionLogsForStoreName:(uint64_t)a3 andLocalPeerID:(void *)a4 atUbiquityRootLocation:(_QWORD *)a5 error:
{
  __objc2_class **p_superclass;
  id v10;
  __objc2_class **v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  _BOOL4 v20;
  int v21;
  void *v22;
  PFUbiquityTransactionLog *v23;
  PFUbiquityTransactionLog *v24;
  BOOL v25;
  PFUbiquityTransactionLog *v26;
  PFUbiquityTransactionLog *v27;
  const char *v28;
  PFUbiquityTransactionLog *v29;
  PFUbiquityLocation *v30;
  NSString *v31;
  PFUbiquitySaveSnapshot *v32;
  _QWORD *v33;
  PFUbiquitySaveSnapshot *v34;
  PFUbiquityLocation *transactionLogLocation;
  NSString *storeName;
  uint64_t v37;
  PFUbiquitySaveSnapshot *saveSnapshot;
  PFUbiquitySaveSnapshot *v39;
  NSDate *transactionDate;
  char *v41;
  void *v42;
  void *v43;
  _PFUbiquityMigrationContext *v44;
  const char *v45;
  void *v46;
  SEL v47;
  SEL v48;
  void *v49;
  void *v50;
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  _BOOL4 v56;
  _BOOL4 v57;
  uint64_t v58;
  void *v59;
  uint64_t v61;
  void *v62;
  void *v63;
  _QWORD *v64;
  id v65;
  uint64_t v66;
  uint64_t v67;
  id obj;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  _BYTE v73[128];
  uint64_t v74;

  v74 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    p_superclass = &OBJC_METACLASS____PFCachedNumber.superclass;
    v63 = +[PFUbiquityLocation createPeerStoreLocationForPeerID:andStoreName:withUbiquityRootLocation:]((uint64_t)PFUbiquityLocation, a3, a2, a4);
    v10 = +[PFUbiquityLocation createMapOfLocationsForOldManagedObjectModel:andNewManagedObjectModel:inUbiquityPeerStoreLocation:]((uint64_t)PFUbiquityLocation, *(void **)(a1 + 8), *(void **)(a1 + 16), (uint64_t)v63);
    v11 = &OBJC_METACLASS____PFCachedNumber.superclass;
    if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 2))
      NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Migrating %lu transaction log files for '%@' at '%@'"), "-[PFUbiquityTransactionLogMigrator migrateTransactionLogsForStoreName:andLocalPeerID:atUbiquityRootLocation:error:]", 121, objc_msgSend(v10, "count"), a2, a4);
    v61 = a2;
    v62 = a4;
    v71 = 0u;
    v72 = 0u;
    v69 = 0u;
    v70 = 0u;
    obj = (id)objc_msgSend(v10, "allKeys");
    v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v69, v73, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v70;
      v64 = a5;
      v65 = v10;
      v66 = *(_QWORD *)v70;
LABEL_6:
      v15 = 0;
      v67 = v13;
      while (1)
      {
        if (*(_QWORD *)v70 != v14)
          objc_enumerationMutation(obj);
        v16 = *(_QWORD *)(*((_QWORD *)&v69 + 1) + 8 * v15);
        v17 = objc_msgSend(v10, "objectForKey:", v16);
        v18 = (void *)v17;
        if (v17 && -[PFUbiquityLocation fileExistsAtLocationWithLocalPeerID:error:](v17, 0, 0))
        {
          if (objc_msgSend(v11 + 319, "canLogMessageAtLevel:", 2))
            NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Destination log file already exits in final location, skipping: %@"), "-[PFUbiquityTransactionLogMigrator migrateTransactionLogFromLocation:toLocation:error:]", 159, v18);
        }
        else
        {
          objc_opt_self();
          v19 = (void *)objc_msgSend(v18, "copy");
          objc_msgSend(v19, "setUbiquityLocationType:", 21);
          -[PFUbiquityLocation updateHash](v19);
          if (v19)
            v20 = -[PFUbiquityLocation fileExistsAtLocationWithLocalPeerID:error:]((uint64_t)v19, 0, 0);
          else
            v20 = 0;

          v21 = objc_msgSend(v11 + 319, "canLogMessageAtLevel:", 2);
          if (v20)
          {
            v14 = v66;
            v13 = v67;
            if (v21)
              NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Destination log file already exits in staging location, skipping: %@"), "-[PFUbiquityTransactionLogMigrator migrateTransactionLogFromLocation:toLocation:error:]", 166, v18);
          }
          else
          {
            if (v21)
              NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Migrating src transaction log %@ to %@"), "-[PFUbiquityTransactionLogMigrator migrateTransactionLogFromLocation:toLocation:error:]", 173, v16, v18);
            objc_opt_self();
            v22 = (void *)objc_msgSend(v18, "copy");
            objc_msgSend(v22, "setUbiquityLocationType:", 21);
            -[PFUbiquityLocation updateHash](v22);
            if (!v22 || !-[PFUbiquityLocation fileExistsAtLocationWithLocalPeerID:error:]((uint64_t)v22, 0, 0))
            {

              v26 = -[PFUbiquityTransactionLog initWithTransactionLogLocation:andLocalPeerID:]([PFUbiquityTransactionLog alloc], "initWithTransactionLogLocation:andLocalPeerID:", v16, *(_QWORD *)(a1 + 32));
              if (!-[PFUbiquityTransactionLog loadImportMetadataWithError:]((uint64_t)v26, a5)
                || !-[PFUbiquityTransactionLog loadInsertedObjectsDataWithError:]((uint64_t)v26, a5)
                || !-[PFUbiquityTransactionLog loadDeletedObjectsDataWithError:]((uint64_t)v26, a5)
                || !-[PFUbiquityTransactionLog loadUpdatedObjectsDataWithError:]((uint64_t)v26, a5))
              {
                goto LABEL_80;
              }
              v27 = -[PFUbiquityTransactionLog initWithTransactionLogLocation:andLocalPeerID:]([PFUbiquityTransactionLog alloc], "initWithTransactionLogLocation:andLocalPeerID:", v18, *(_QWORD *)(a1 + 32));
              v29 = v27;
              if (v26
                && ((v30 = v26->_transactionLogLocation) == 0 ? (v31 = 0) : (v31 = v30->_storeName),
                    (v32 = v26->_saveSnapshot) != 0))
              {
                v33 = (_QWORD *)-[NSMutableDictionary objectForKey:](v32->_storeNameToStoreSaveSnapshots, "objectForKey:", v31);
                if (v29)
                  goto LABEL_34;
LABEL_69:
                v34 = 0;
                if (!v26)
                  goto LABEL_70;
LABEL_35:
                transactionLogLocation = v26->_transactionLogLocation;
                if (!transactionLogLocation)
                  goto LABEL_70;
                storeName = transactionLogLocation->_storeName;
                if (v34)
                  goto LABEL_37;
LABEL_71:
                v37 = 0;
                if (!v29)
                  goto LABEL_72;
LABEL_38:
                saveSnapshot = v29->_saveSnapshot;
                if (v26)
                  goto LABEL_39;
LABEL_73:
                transactionDate = 0;
                if (!saveSnapshot)
                  goto LABEL_42;
              }
              else
              {
                v33 = 0;
                if (!v27)
                  goto LABEL_69;
LABEL_34:
                v34 = v29->_saveSnapshot;
                if (v26)
                  goto LABEL_35;
LABEL_70:
                storeName = 0;
                if (!v34)
                  goto LABEL_71;
LABEL_37:
                v37 = -[NSMutableDictionary objectForKey:](v34->_storeNameToStoreSaveSnapshots, "objectForKey:", storeName);
                if (v29)
                  goto LABEL_38;
LABEL_72:
                saveSnapshot = 0;
                if (!v26)
                  goto LABEL_73;
LABEL_39:
                v39 = v26->_saveSnapshot;
                if (!v39)
                  goto LABEL_73;
                transactionDate = v39->_transactionDate;
                if (!saveSnapshot)
                {
LABEL_42:
                  v41 = (char *)-[PFUbiquityTransactionLog transactionNumber](v26);
                  if (v33)
                  {
                    v42 = (void *)v33[14];
                    v43 = (void *)v33[2];
                  }
                  else
                  {
                    v42 = 0;
                    v43 = 0;
                  }
                  -[PFUbiquityStoreSaveSnapshot setTransactionNumber:peerStates:andPeerIDs:]((id *)v37, v41, v42, v43);
                  v44 = objc_alloc_init(_PFUbiquityMigrationContext);
                  v46 = v44;
                  if (v44)
                  {
                    objc_setProperty_nonatomic(v44, v45, v26, 8);
                    objc_setProperty_nonatomic(v46, v47, v33, 16);
                    objc_setProperty_nonatomic(v46, v48, (id)v37, 24);
                  }
                  if (v33)
                  {
                    v49 = (void *)objc_msgSend((id)a1, "createDestinationObjectsFromSourceObjects:migrationContext:", v33[11], v46);
                    v50 = (void *)objc_msgSend((id)a1, "createDestinationObjectsFromSourceObjects:migrationContext:", v33[12], v46);
                    v51 = v33[13];
                  }
                  else
                  {
                    v49 = (void *)objc_msgSend((id)a1, "createDestinationObjectsFromSourceObjects:migrationContext:", 0, v46);
                    v50 = (void *)objc_msgSend((id)a1, "createDestinationObjectsFromSourceObjects:migrationContext:", 0, v46);
                    v51 = 0;
                  }
                  v52 = (void *)objc_msgSend((id)a1, "createDestinationObjectsFromSourceObjects:migrationContext:", v51, v46);
                  if (v37)
                  {
                    v53 = *(void **)(v37 + 88);
                    if (v53 != v49)
                    {

                      *(_QWORD *)(v37 + 88) = objc_msgSend(v49, "mutableCopy");
                    }
                    v54 = *(void **)(v37 + 96);
                    if (v54 != v50)
                    {

                      *(_QWORD *)(v37 + 96) = objc_msgSend(v50, "mutableCopy");
                    }
                    v55 = *(void **)(v37 + 104);
                    if (v55 != v52)
                    {

                      *(_QWORD *)(v37 + 104) = objc_msgSend(v52, "mutableCopy");
                    }
                  }

                  if (v29 && (*(_BYTE *)(a1 + 56) & 1) != 0)
                    v29->_useTemporaryLogLocation = 1;
                  a5 = v64;
                  v56 = -[PFUbiquityTransactionLog writeToDiskWithError:andUpdateFilenameInTransactionEntries:]((uint64_t)v29, v64, 0);
                  v57 = +[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 2);
                  v10 = v65;
                  v14 = v66;
                  p_superclass = (__objc2_class **)(&OBJC_METACLASS____PFCachedNumber + 8);
                  if (!v56)
                  {
                    if (v57)
                      NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Destination log write failed with error %@"), "-[PFUbiquityTransactionLogMigrator migrateTransactionLogFromLocation:toLocation:error:]", 230, *v64);
                    goto LABEL_79;
                  }
                  if (v57)
                    NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Destination log written succesfully"), "-[PFUbiquityTransactionLogMigrator migrateTransactionLogFromLocation:toLocation:error:]", 224);
                  v13 = v67;
                  if (!-[PFUbiquityTransactionLog moveFileToPermanentLocationWithError:]((uint64_t)v29, v64))
                  {
                    if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 2))
                    {
                      NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Failed to move transaction log to permanent location: %@"), "-[PFUbiquityTransactionLogMigrator migrateTransactionLogFromLocation:toLocation:error:]", 227, *v64);
                    }
                    goto LABEL_79;
                  }

                  v11 = (__objc2_class **)(&OBJC_METACLASS____PFCachedNumber + 8);
                  goto LABEL_64;
                }
              }
              objc_setProperty_nonatomic(saveSnapshot, v28, transactionDate, 8);
              goto LABEL_42;
            }
            v23 = -[PFUbiquityTransactionLog initWithTransactionLogLocation:andLocalPeerID:]([PFUbiquityTransactionLog alloc], "initWithTransactionLogLocation:andLocalPeerID:", v22, *(_QWORD *)(a1 + 32));
            v24 = v23;
            v14 = v66;
            if ((*(_BYTE *)(a1 + 56) & 1) != 0)
            {

              v13 = v67;
            }
            else
            {
              v25 = -[PFUbiquityTransactionLog moveFileToPermanentLocationWithError:]((uint64_t)v23, a5);

              v13 = v67;
              if (!v25)
                goto LABEL_81;
            }
          }
        }
LABEL_64:
        if (v13 == ++v15)
        {
          v58 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v69, v73, 16);
          v13 = v58;
          if (v58)
            goto LABEL_6;
          break;
        }
      }
    }
    v46 = (void *)+[PFUbiquityLocation createVersionHashStringForModel:]((uint64_t)(p_superclass + 314), *(void **)(a1 + 8));
    v59 = (void *)+[PFUbiquityLocation createVersionHashStringForModel:]((uint64_t)(p_superclass + 314), *(void **)(a1 + 16));
    v26 = (PFUbiquityTransactionLog *)+[PFUbiquityLocation createBaselineLocation:forStoreName:andModelVersionHash:withUbiquityRootLocation:]((uint64_t)(p_superclass + 314), 10, v61, (uint64_t)v46, v62);
    v29 = (PFUbiquityTransactionLog *)+[PFUbiquityLocation createBaselineLocation:forStoreName:andModelVersionHash:withUbiquityRootLocation:]((uint64_t)(p_superclass + 314), 10, v61, (uint64_t)v46, v62);

LABEL_79:
    v26 = v29;
LABEL_80:

LABEL_81:
  }
  return a1 != 0;
}

- (uint64_t)createDestinationGlobalObjectIDFromSourceGlobalObjectID:(uint64_t)a1
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  PFUbiquityGlobalObjectID *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  if (!a1)
    return 0;
  v3 = *(void **)(a1 + 40);
  v4 = a2 ? a2[2] : 0;
  v5 = objc_msgSend((id)objc_msgSend(v3, "objectForKey:", v4), "destinationEntityName");
  if (!v5)
    return 0;
  v6 = v5;
  v7 = [PFUbiquityGlobalObjectID alloc];
  if (a2)
  {
    v8 = a2[1];
    v9 = a2[3];
    v10 = a2[4];
  }
  else
  {
    v9 = 0;
    v8 = 0;
    v10 = 0;
  }
  return (uint64_t)-[PFUbiquityGlobalObjectID initWithStoreName:entityName:primaryKey:andPeerID:](v7, "initWithStoreName:entityName:primaryKey:andPeerID:", v8, v6, v9, v10);
}

- (id)createDestinationObjectContentFromSourceObjectContent:(id)a3 withEntityMapping:(id)a4 migrationContext:(id)a5
{
  id v8;
  uint64_t v9;
  _QWORD *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _BOOL4 v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  id v37;
  id v38;
  void *v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  _QWORD *v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  char v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v53;
  id v54;
  void *v55;
  id obj;
  id obja;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  id v69;
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
  __int128 v80;
  __int128 v81;
  _BYTE v82[128];
  _BYTE v83[128];
  _BYTE v84[128];
  _BYTE v85[128];
  uint64_t v86;

  v86 = *MEMORY[0x1E0C80C00];
  v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v78 = 0u;
  v79 = 0u;
  v80 = 0u;
  v81 = 0u;
  v54 = a4;
  obj = (id)objc_msgSend(a4, "attributeMappings");
  v60 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v78, v85, 16);
  if (!v60)
    goto LABEL_35;
  v58 = *(_QWORD *)v79;
  do
  {
    v9 = 0;
    do
    {
      if (*(_QWORD *)v79 != v58)
        objc_enumerationMutation(obj);
      v10 = *(_QWORD **)(*((_QWORD *)&v78 + 1) + 8 * v9);
      v62 = v9;
      if (v10)
        v11 = (void *)v10[3];
      else
        v11 = 0;
      v12 = objc_msgSend(v10, "name");
      v74 = 0u;
      v75 = 0u;
      v76 = 0u;
      v77 = 0u;
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v74, v84, 16);
      if (v13)
      {
        v14 = v13;
        v15 = *(_QWORD *)v75;
        do
        {
          v16 = 0;
          do
          {
            if (*(_QWORD *)v75 != v15)
              objc_enumerationMutation(v11);
            v17 = *(_QWORD *)(*((_QWORD *)&v74 + 1) + 8 * v16);
            if (v17)
            {
              if (*(_QWORD *)(v17 + 24))
                v18 = *(_BYTE *)(v17 + 32) != 0;
              else
                v18 = 0;
              v19 = *(void **)(v17 + 8);
            }
            else
            {
              v18 = 0;
              v19 = 0;
            }
            v20 = objc_msgSend(v19, "expressionType");
            if (v20 == 3)
            {
              v21 = (void *)objc_msgSend(a3, "objectForKey:", objc_msgSend(v19, "keyPath"));
              if (!v21)
                goto LABEL_27;
            }
            else
            {
              if (v20 || v18 && objc_msgSend(v8, "objectForKey:", v12))
                goto LABEL_27;
              v21 = (void *)objc_msgSend(v19, "constantValue");
              if (!v21)
                goto LABEL_27;
            }
            v22 = v21;
            if ((objc_msgSend(v21, "isEqual:", objc_msgSend(MEMORY[0x1E0C99E38], "null")) & 1) == 0)
              objc_msgSend(v8, "setObject:forKey:", v22, v12);
LABEL_27:
            ++v16;
          }
          while (v14 != v16);
          v23 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v74, v84, 16);
          v14 = v23;
        }
        while (v23);
      }
      v9 = v62 + 1;
    }
    while (v62 + 1 != v60);
    v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v78, v85, 16);
    v60 = v24;
  }
  while (v24);
LABEL_35:
  if (a5)
    v25 = *((_QWORD *)a5 + 3);
  else
    v25 = 0;
  obja = -[NSDictionary objectForKey:](-[NSManagedObjectModel entitiesByName](self->_dstModel, "entitiesByName"), "objectForKey:", objc_msgSend(v54, "destinationEntityName"));
  v70 = 0u;
  v71 = 0u;
  v72 = 0u;
  v73 = 0u;
  v26 = (void *)objc_msgSend(v54, "relationshipMappings");
  v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v70, v83, 16);
  if (v27)
  {
    v28 = v27;
    v29 = *(_QWORD *)v71;
    v53 = *(_QWORD *)v71;
    v55 = v26;
    do
    {
      v30 = 0;
      v59 = v28;
      do
      {
        if (*(_QWORD *)v71 != v29)
          objc_enumerationMutation(v26);
        v31 = *(_QWORD **)(*((_QWORD *)&v70 + 1) + 8 * v30);
        if (v31)
          v32 = (void *)v31[3];
        else
          v32 = 0;
        v33 = objc_msgSend(v31, "name");
        v34 = objc_msgSend(v32, "objectAtIndex:", 0);
        if (v34)
          v35 = *(void **)(v34 + 8);
        else
          v35 = 0;
        if (objc_msgSend(v35, "expressionType") == 3)
        {
          v69 = 0;
          v36 = (void *)objc_msgSend(a3, "objectForKey:", objc_msgSend(v35, "keyPath"));
          v69 = v36;
          if (v36)
          {
            if ((objc_msgSend(v36, "isEqual:", objc_msgSend(MEMORY[0x1E0C99E38], "null")) & 1) == 0)
            {
              v61 = v33;
              v63 = v30;
              if ((objc_msgSend(v69, "isNSArray") & 1) != 0)
                v37 = v69;
              else
                v69 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:count:", &v69, 1);
              v38 = objc_alloc(MEMORY[0x1E0C99DE8]);
              v39 = (void *)objc_msgSend(v38, "initWithCapacity:", objc_msgSend(v69, "count"));
              v65 = 0u;
              v66 = 0u;
              v67 = 0u;
              v68 = 0u;
              v40 = v69;
              v41 = objc_msgSend(v69, "countByEnumeratingWithState:objects:count:", &v65, v82, 16);
              if (v41)
              {
                v42 = v41;
                v43 = *(_QWORD *)v66;
                do
                {
                  v44 = 0;
                  do
                  {
                    if (*(_QWORD *)v66 != v43)
                      objc_enumerationMutation(v40);
                    if (a5)
                      v45 = (_QWORD *)-[PFUbiquityStoreSaveSnapshot globalObjectIDFromCompressedObjectID:](*((_QWORD *)a5 + 2), *(void **)(*((_QWORD *)&v65 + 1) + 8 * v44));
                    else
                      v45 = 0;
                    v46 = -[PFUbiquityTransactionLogMigrator createDestinationGlobalObjectIDFromSourceGlobalObjectID:]((uint64_t)self, v45);
                    if (v46)
                    {
                      v47 = (void *)v46;
                      objc_msgSend(v39, "addObject:", -[PFUbiquityStoreSaveSnapshot compressedGlobalObjectIDFromGlobalObjectID:](v25, v46));

                    }
                    ++v44;
                  }
                  while (v42 != v44);
                  v48 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v65, v82, 16);
                  v42 = v48;
                }
                while (v48);
              }

              v49 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(obja, "propertiesByName"), "objectForKey:", v61), "isToMany");
              v50 = (uint64_t)v39;
              v29 = v53;
              v26 = v55;
              v28 = v59;
              v30 = v63;
              if ((v49 & 1) != 0)
              {
LABEL_68:
                objc_msgSend(v8, "setObject:forKey:", v50, v61);
              }
              else if (objc_msgSend(v39, "count", v39) == 1)
              {
                v50 = objc_msgSend(v39, "objectAtIndex:", 0);
                goto LABEL_68;
              }

            }
          }
        }
        ++v30;
      }
      while (v30 != v28);
      v51 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v70, v83, 16);
      v28 = v51;
    }
    while (v51);
  }
  return v8;
}

- (id)createDestinationObjectsFromSourceObjects:(id)a3 migrationContext:(id)a4
{
  id v7;
  void *v8;
  uint64_t v9;
  _QWORD v11[8];

  v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v8 = v7;
  if (a4)
    v9 = *((_QWORD *)a4 + 3);
  else
    v9 = 0;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __95__PFUbiquityTransactionLogMigrator_createDestinationObjectsFromSourceObjects_migrationContext___block_invoke;
  v11[3] = &unk_1E1EDFE68;
  v11[4] = a4;
  v11[5] = self;
  v11[6] = v9;
  v11[7] = v7;
  objc_msgSend(a3, "enumerateKeysAndObjectsUsingBlock:", v11);
  return v8;
}

void __95__PFUbiquityTransactionLogMigrator_createDestinationObjectsFromSourceObjects_migrationContext___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  id v12;

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
  {
    v6 = -[PFUbiquityStoreSaveSnapshot globalObjectIDFromCompressedObjectID:](*(_QWORD *)(v5 + 16), a2);
    v7 = (_QWORD *)v6;
    if (v6)
    {
      v8 = *(_QWORD *)(v6 + 16);
      goto LABEL_4;
    }
  }
  else
  {
    v7 = 0;
  }
  v8 = 0;
LABEL_4:
  v9 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 40), "objectForKey:", v8);
  if (v9)
  {
    v12 = (id)objc_msgSend(*(id *)(a1 + 40), "createDestinationObjectContentFromSourceObjectContent:withEntityMapping:migrationContext:", a3, v9, *(_QWORD *)(a1 + 32));
    v10 = (void *)-[PFUbiquityTransactionLogMigrator createDestinationGlobalObjectIDFromSourceGlobalObjectID:](*(_QWORD *)(a1 + 40), v7);
    v11 = -[PFUbiquityStoreSaveSnapshot compressedGlobalObjectIDFromGlobalObjectID:](*(_QWORD *)(a1 + 48), (uint64_t)v10);

    objc_msgSend(*(id *)(a1 + 56), "setObject:forKey:", v12, v11);
  }
}

@end
