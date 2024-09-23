@implementation PFUbiquityMetadataFactory

+ (void)initialize
{
  objc_opt_self();
  if ((id)objc_opt_class() == a1)
  {
    _sharedFactory = objc_alloc_init(PFUbiquityMetadataFactory);
    objc_opt_self();
  }
}

+ (void)_invalidateStaticCaches
{

  _MergedGlobals_92 = 0;
}

- (PFUbiquityMetadataFactory)init
{
  PFUbiquityMetadataFactory *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PFUbiquityMetadataFactory;
  v2 = -[PFUbiquityMetadataFactory init](&v4, sel_init);
  if (v2)
  {
    v2->_rootLocationToPeerIDToEntry = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v2->_rootLocationToPeerIDToEntryLock = (NSRecursiveLock *)objc_alloc_init(MEMORY[0x1E0CB38E0]);
    v2->_cachedModel = 0;
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  self->_rootLocationToPeerIDToEntry = 0;
  self->_rootLocationToPeerIDToEntryLock = 0;

  self->_cachedModel = 0;
  v3.receiver = self;
  v3.super_class = (Class)PFUbiquityMetadataFactory;
  -[PFUbiquityMetadataFactory dealloc](&v3, sel_dealloc);
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PFUbiquityMetadataFactory;
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@\n\trootLocationToPeerIDToEntry: %@\n"), -[PFUbiquityMetadataFactory description](&v3, sel_description), self->_rootLocationToPeerIDToEntry);
}

- (id)newStackForLocalPeerID:(void *)a3 storeName:(void *)a4 andUbiquityRootLocation:(_QWORD *)a5 error:
{
  PFUbiquityMetadataFactoryEntry *v10;
  id *v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  uint64_t v22;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  int v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v22 = 0;
  objc_msgSend(*(id *)(a1 + 16), "lock");
  v10 = (PFUbiquityMetadataFactoryEntry *)(id)-[PFUbiquityMetadataFactory entryForLocalPeerID:storeName:andUbiquityRootLocation:](a1, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4);
  if (v10
    || (v10 = -[PFUbiquityMetadataFactory newMetadataEntryForLocalPeerID:storeName:andUbiquityRootLocation:error:](a1, a2, a3, a4, &v22)) != 0)
  {
    v11 = -[_PFUbiquityStack initWithMetadataEntry:]([_PFUbiquityStack alloc], v10);
    v12 = 1;
  }
  else
  {
    v12 = 0;
    v11 = 0;
  }
  objc_msgSend(*(id *)(a1 + 16), "unlock");

  if ((v12 & 1) == 0)
  {

    if (v22)
    {
      if (a5)
      {
        v11 = 0;
        *a5 = v22;
        return v11;
      }
    }
    else
    {
      v13 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
      _NSCoreDataLog(17, v13, v14, v15, v16, v17, v18, v19, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Metadata/PFUbiquityMetadataFactory.m");
      v20 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        v24 = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Metadata/PFUbiquityMetadataFactory.m";
        v25 = 1024;
        v26 = 113;
        _os_log_fault_impl(&dword_18A253000, v20, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
      }
    }
    return 0;
  }
  return v11;
}

- (uint64_t)entryForLocalPeerID:(uint64_t)a3 storeName:(uint64_t)a4 andUbiquityRootLocation:
{
  uint64_t v8;

  if (!a1)
    return 0;
  objc_msgSend(*(id *)(a1 + 16), "lock");
  v8 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 8), "objectForKey:", a4), "objectForKey:", a2), "objectForKey:", a3);
  objc_msgSend(*(id *)(a1 + 16), "unlock");
  return v8;
}

- (PFUbiquityMetadataFactoryEntry)newMetadataEntryForLocalPeerID:(void *)a3 storeName:(void *)a4 andUbiquityRootLocation:(_QWORD *)a5 error:
{
  void *v10;
  PFUbiquityMetadataFactoryEntry *v11;
  PFUbiquityMetadataFactoryEntry *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  id v22;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  int v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v22 = 0;
    if (objc_msgSend(a2, "length"))
    {
      if (objc_msgSend(a3, "length"))
      {
        v10 = +[PFUbiquityLocation createMetadataStoreFileLocationForLocalPeerID:storeName:andUbiquityRootLocation:]((uint64_t)PFUbiquityLocation, (uint64_t)a2, (uint64_t)a3, a4);
        v11 = -[PFUbiquityMetadataFactoryEntry initWithMetadataStoreFileLocation:]([PFUbiquityMetadataFactoryEntry alloc], "initWithMetadataStoreFileLocation:", v10);
        v12 = v11;
        if (v11)
        {
          if ((-[PFUbiquityMetadataFactoryEntry initializePersistentStoreCoordinator:]((uint64_t)v11, &v22) & 1) != 0)
          {
LABEL_17:

            return v12;
          }
          if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 0))
            NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@ unable to construct metadata entry.\n\tEntry: %@\n\tlocalPeerID: %@\n\trootLocation: %@\n\tError: %@\nuserInfo: %@"), "-[PFUbiquityMetadataFactory newMetadataEntryForLocalPeerID:storeName:andUbiquityRootLocation:error:]", 138, a1, v12, a2, a4, v22, objc_msgSend(v22, "userInfo"));

          v12 = 0;
        }
        if (v22)
        {
          if (a5)
            *a5 = v22;
        }
        else
        {
          v13 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
          _NSCoreDataLog(17, v13, v14, v15, v16, v17, v18, v19, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Metadata/PFUbiquityMetadataFactory.m");
          v20 = __pflogFaultLog;
          if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 136315394;
            v24 = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Metadata/PFUbiquityMetadataFactory.m";
            v25 = 1024;
            v26 = 146;
            _os_log_fault_impl(&dword_18A253000, v20, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
          }
        }
        goto LABEL_17;
      }
    }
  }
  return 0;
}

- (uint64_t)cacheEntryForLocalPeerID:(void *)a3 storeName:(void *)a4 andUbiquityRootLocation:(_QWORD *)a5 error:
{
  id v10;
  id v11;
  void *v12;
  id v13;
  PFUbiquityMetadataFactoryEntry *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  uint64_t v25;
  uint8_t buf[4];
  const char *v27;
  __int16 v28;
  int v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v25 = 0;
  objc_msgSend(*(id *)(a1 + 16), "lock");
  v10 = (id)objc_msgSend(*(id *)(a1 + 8), "objectForKey:", a4);
  if (!v10)
  {
    v11 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v12 = (void *)objc_msgSend(a4, "copy");
    objc_msgSend(*(id *)(a1 + 8), "setObject:forKey:", v11, v12);

    v10 = v11;
  }
  v13 = (id)objc_msgSend(v10, "objectForKey:", a2);
  if (!v13)
  {
    v13 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(v10, "setObject:forKey:", v13, a2);
  }
  v14 = (PFUbiquityMetadataFactoryEntry *)(id)objc_msgSend(v13, "objectForKey:", a3);
  if (!v14)
  {
    if (!*(_QWORD *)(a1 + 24))
      *(_QWORD *)(a1 + 24) = objc_msgSend((id)a1, "createMetadataModel");
    v14 = -[PFUbiquityMetadataFactory newMetadataEntryForLocalPeerID:storeName:andUbiquityRootLocation:error:](a1, a2, a3, a4, &v25);
    if (!v14)
    {
      v15 = 0;
      goto LABEL_12;
    }
    objc_msgSend(v13, "setObject:forKey:", v14, a3);
  }
  v15 = 1;
LABEL_12:
  objc_msgSend(*(id *)(a1 + 16), "unlock");
  if ((v15 & 1) == 0)
  {
    if (v25)
    {
      if (a5)
        *a5 = v25;
    }
    else
    {
      v16 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
      _NSCoreDataLog(17, v16, v17, v18, v19, v20, v21, v22, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Metadata/PFUbiquityMetadataFactory.m");
      v23 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        v27 = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Metadata/PFUbiquityMetadataFactory.m";
        v28 = 1024;
        v29 = 218;
        _os_log_fault_impl(&dword_18A253000, v23, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
      }
    }
  }

  return v15;
}

- (void)removeCachedCoordinatorsForLocalPeerID:(uint64_t)a3 storeName:(uint64_t)a4 andUbiquityRootLocation:
{
  id v8;
  void *v9;
  id v10;

  if (a1)
  {
    objc_msgSend(a1[2], "lock");
    v8 = (id)objc_msgSend((id)objc_msgSend(a1[1], "objectForKey:", a4), "objectForKey:", a2);
    objc_msgSend(v8, "removeObjectForKey:", a3);
    if (objc_msgSend(v8, "count"))
    {
      v9 = 0;
    }
    else
    {
      v10 = (id)objc_msgSend(a1[1], "objectForKey:", a4);
      objc_msgSend(v10, "removeObjectForKey:", a2);
      v9 = v10;
      if (!objc_msgSend(v10, "count"))
        objc_msgSend(a1[1], "removeObjectForKey:", a4);
    }
    if (!objc_msgSend(a1[1], "count"))
    {

      a1[3] = 0;
    }
    objc_msgSend(a1[2], "unlock");

  }
}

- (id)newMetadataManagedObjectModel
{
  void *v2;
  id v3;
  id v4;

  if (!a1)
    return 0;
  objc_msgSend(*(id *)(a1 + 16), "lock");
  v2 = *(void **)(a1 + 24);
  if (v2)
    v3 = v2;
  else
    v3 = (id)objc_msgSend((id)a1, "createMetadataModel");
  v4 = v3;
  objc_msgSend(*(id *)(a1 + 16), "unlock");
  return v4;
}

- (id)createMetadataModel
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__PFUbiquityMetadataFactory_createMetadataModel__block_invoke;
  block[3] = &unk_1E1EDD520;
  block[4] = self;
  if (qword_1ECD8DCF8 != -1)
    dispatch_once(&qword_1ECD8DCF8, block);
  return (id)_MergedGlobals_92;
}

void __48__PFUbiquityMetadataFactory_createMetadataModel__block_invoke(uint64_t a1)
{
  void *v2;
  objc_class *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_class *v8;
  uint64_t v9;
  void *v10;
  objc_class *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  objc_class *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  objc_class *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  objc_class *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  uint64_t v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;

  v2 = *(void **)(a1 + 32);
  v3 = (objc_class *)objc_opt_class();
  v76 = (void *)objc_msgSend(v2, "newEntityForName:", NSStringFromClass(v3));
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v5 = (void *)objc_msgSend(*(id *)(a1 + 32), "newAttributeNamed:attributeType:isOptional:isTransient:withDefaultValue:andMinValue:andMaxValue:", CFSTR("peerKey"), 700, 1, 0, 0, 0, 0);
  v6 = (void *)objc_msgSend(*(id *)(a1 + 32), "newAttributeNamed:attributeType:isOptional:isTransient:withDefaultValue:andMinValue:andMaxValue:", CFSTR("peerCode"), 700, 1, 0, 0, 0, 0);
  v77 = v4;
  objc_msgSend(v4, "addObject:", v5);
  objc_msgSend(v4, "addObject:", v6);

  v7 = *(void **)(a1 + 32);
  v8 = (objc_class *)objc_opt_class();
  v9 = objc_msgSend(v7, "newEntityForName:", NSStringFromClass(v8));
  v10 = *(void **)(a1 + 32);
  v11 = (objc_class *)objc_opt_class();
  v73 = (void *)objc_msgSend(v10, "newEntityForName:", NSStringFromClass(v11));
  v78 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithInteger:", 0);
  v12 = (void *)objc_msgSend(*(id *)(a1 + 32), "newAttributeNamed:attributeType:isOptional:isTransient:withDefaultValue:andMinValue:andMaxValue:", CFSTR("end"), 300, 1, 0, v78, v78, 0);
  v13 = (void *)objc_msgSend(*(id *)(a1 + 32), "newAttributeNamed:attributeType:isOptional:isTransient:withDefaultValue:andMinValue:andMaxValue:", CFSTR("start"), 300, 1, 0, v78, v78, 0);
  v14 = (void *)objc_msgSend(*(id *)(a1 + 32), "newAttributeNamed:attributeType:isOptional:isTransient:withDefaultValue:andMinValue:andMaxValue:", CFSTR("peerStart"), 300, 1, 0, v78, 0, 0);
  v15 = (void *)objc_msgSend(*(id *)(a1 + 32), "newAttributeNamed:attributeType:isOptional:isTransient:withDefaultValue:andMinValue:andMaxValue:", CFSTR("peerEnd"), 300, 1, 0, v78, 0, 0);
  v16 = (void *)objc_msgSend(*(id *)(a1 + 32), "newAttributeNamed:attributeType:isOptional:isTransient:withDefaultValue:andMinValue:andMaxValue:", CFSTR("peerEntityName"), 700, 1, 0, 0, 0, 0);
  v17 = (void *)objc_msgSend(*(id *)(a1 + 32), "newRelationshipNamed:withDestinationEntity:andInverseRelationship:isOptional:isToMany:andDeleteRule:", CFSTR("peer"), v76, 0, 1, 0, 1);
  v70 = (void *)objc_msgSend(*(id *)(a1 + 32), "newRelationshipNamed:withDestinationEntity:andInverseRelationship:isOptional:isToMany:andDeleteRule:", CFSTR("storeMetadata"), v73, 0, 1, 0, 1);
  v18 = (void *)v9;
  v75 = (void *)v9;
  v19 = (void *)objc_msgSend(*(id *)(a1 + 32), "newRelationshipNamed:withDestinationEntity:andInverseRelationship:isOptional:isToMany:andDeleteRule:", CFSTR("primaryKeyRanges"), v9, v17, 1, 1, 1);
  objc_msgSend(v77, "addObject:", v19);

  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:", v12, v13, v14, v15, v16, v17, v70, 0);
  objc_msgSend(v18, "setProperties:", v20);

  v21 = *(void **)(a1 + 32);
  v22 = (objc_class *)objc_opt_class();
  v23 = objc_msgSend(v21, "newEntityForName:", NSStringFromClass(v22));
  v24 = (void *)objc_msgSend(*(id *)(a1 + 32), "newAttributeNamed:attributeType:isOptional:isTransient:withDefaultValue:andMinValue:andMaxValue:", CFSTR("lastProcessedTransactionLogURL"), 700, 1, 0, 0, 0, 0);
  v25 = (void *)objc_msgSend(*(id *)(a1 + 32), "newAttributeNamed:attributeType:isOptional:isTransient:withDefaultValue:andMinValue:andMaxValue:", CFSTR("storeName"), 700, 1, 0, 0, 0, 0);
  v26 = (void *)objc_msgSend(*(id *)(a1 + 32), "newAttributeNamed:attributeType:isOptional:isTransient:withDefaultValue:andMinValue:andMaxValue:", CFSTR("transactionNumber"), 300, 1, 0, v78, 0, 0);
  v27 = (void *)objc_msgSend(*(id *)(a1 + 32), "newRelationshipNamed:withDestinationEntity:andInverseRelationship:isOptional:isToMany:andDeleteRule:", CFSTR("peer"), v76, 0, 1, 0, 1);
  v28 = (void *)v23;
  v29 = (void *)objc_msgSend(*(id *)(a1 + 32), "newRelationshipNamed:withDestinationEntity:andInverseRelationship:isOptional:isToMany:andDeleteRule:", CFSTR("localPeerStates"), v23, v27, 1, 1, 1);
  objc_msgSend(v77, "addObject:", v29);

  v68 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:", v24, v25, v26, v27, 0);
  v66 = (void *)objc_msgSend(*(id *)(a1 + 32), "newAttributeNamed:attributeType:isOptional:isTransient:withDefaultValue:andMinValue:andMaxValue:", CFSTR("storeIdentifier"), 700, 1, 0, 0, 0, 0);
  v30 = (void *)objc_msgSend(*(id *)(a1 + 32), "newAttributeNamed:attributeType:isOptional:isTransient:withDefaultValue:andMinValue:andMaxValue:", CFSTR("storeType"), 700, 1, 0, 0, 0, 0);
  v31 = (void *)objc_msgSend(*(id *)(a1 + 32), "newAttributeNamed:attributeType:isOptional:isTransient:withDefaultValue:andMinValue:andMaxValue:", CFSTR("storeURLString"), 700, 1, 0, 0, 0, 0);
  v32 = (void *)objc_msgSend(*(id *)(a1 + 32), "newAttributeNamed:attributeType:isOptional:isTransient:withDefaultValue:andMinValue:andMaxValue:", CFSTR("ubiquityName"), 700, 1, 0, 0, 0, 0);
  v33 = (void *)objc_msgSend(*(id *)(a1 + 32), "newAttributeNamed:attributeType:isOptional:isTransient:withDefaultValue:andMinValue:andMaxValue:", CFSTR("ubiquityRelativePath"), 700, 1, 0, 0, 0, 0);
  v34 = (void *)objc_msgSend(*(id *)(a1 + 32), "newAttributeNamed:attributeType:isOptional:isTransient:withDefaultValue:andMinValue:andMaxValue:", CFSTR("ubiquityRootURLString"), 700, 1, 0, 0, 0, 0);
  v35 = (void *)objc_msgSend(*(id *)(a1 + 32), "newAttributeNamed:attributeType:isOptional:isTransient:withDefaultValue:andMinValue:andMaxValue:", CFSTR("storeOptionsBinaryPlistData"), 1000, 1, 0, 0, 0, 0);
  v64 = (void *)objc_msgSend(*(id *)(a1 + 32), "newAttributeNamed:attributeType:isOptional:isTransient:withDefaultValue:andMinValue:andMaxValue:", CFSTR("modelVersionHashString"), 700, 1, 0, 0, 0, 0);
  v74 = v28;
  v36 = (void *)objc_msgSend(*(id *)(a1 + 32), "newRelationshipNamed:withDestinationEntity:andInverseRelationship:isOptional:isToMany:andDeleteRule:", CFSTR("peerStates"), v28, 0, 1, 1, 1);
  v37 = (void *)objc_msgSend(*(id *)(a1 + 32), "newRelationshipNamed:withDestinationEntity:andInverseRelationship:isOptional:isToMany:andDeleteRule:", CFSTR("primaryKeyRanges"), v75, v70, 1, 1, 1);
  v72 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:", v66, v30, v31, v32, v33, v34, v35, v64, v36, v37, 0);

  v38 = (void *)objc_msgSend(*(id *)(a1 + 32), "newRelationshipNamed:withDestinationEntity:andInverseRelationship:isOptional:isToMany:andDeleteRule:", CFSTR("storeMetadata"), v73, v36, 1, 0, 1);
  objc_msgSend(v68, "addObject:", v38);

  objc_msgSend(v74, "setProperties:", v68);
  v39 = *(void **)(a1 + 32);
  v40 = (objc_class *)objc_opt_class();
  v41 = (void *)objc_msgSend(v39, "newEntityForName:", NSStringFromClass(v40));
  v42 = (void *)objc_msgSend(*(id *)(a1 + 32), "newAttributeNamed:attributeType:isOptional:isTransient:withDefaultValue:andMinValue:andMaxValue:", CFSTR("peerID"), 700, 1, 0, 0, 0, 0);
  v43 = (void *)objc_msgSend(*(id *)(a1 + 32), "newAttributeNamed:attributeType:isOptional:isTransient:withDefaultValue:andMinValue:andMaxValue:", CFSTR("storeName"), 700, 1, 0, 0, 0, 0);
  v44 = (void *)objc_msgSend(*(id *)(a1 + 32), "newAttributeNamed:attributeType:isOptional:isTransient:withDefaultValue:andMinValue:andMaxValue:", CFSTR("transactionNumber"), 300, 1, 0, v78, 0, 0);
  v45 = (void *)objc_msgSend(*(id *)(a1 + 32), "newRelationshipNamed:withDestinationEntity:andInverseRelationship:isOptional:isToMany:andDeleteRule:", CFSTR("peer"), v76, 0, 1, 0, 1);
  v71 = v41;
  v46 = (void *)objc_msgSend(*(id *)(a1 + 32), "newRelationshipNamed:withDestinationEntity:andInverseRelationship:isOptional:isToMany:andDeleteRule:", CFSTR("remoteStates"), v41, v45, 1, 1, 1);
  objc_msgSend(v77, "addObject:", v46);

  v47 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:", v42, v43, v44, v45, 0);
  objc_msgSend(v41, "setProperties:", v47);

  v48 = *(void **)(a1 + 32);
  v49 = (objc_class *)objc_opt_class();
  v50 = objc_msgSend(v48, "newEntityForName:", NSStringFromClass(v49));
  v69 = (void *)objc_msgSend(*(id *)(a1 + 32), "newAttributeNamed:attributeType:isOptional:isTransient:withDefaultValue:andMinValue:andMaxValue:", CFSTR("globalIDStr"), 700, 0, 0, 0, 0, 0);
  v67 = (void *)objc_msgSend(*(id *)(a1 + 32), "newAttributeNamed:attributeType:isOptional:isTransient:withDefaultValue:andMinValue:andMaxValue:", CFSTR("localIDStr"), 700, 0, 0, 0, 0, 0);
  v65 = (void *)objc_msgSend(*(id *)(a1 + 32), "newAttributeNamed:attributeType:isOptional:isTransient:withDefaultValue:andMinValue:andMaxValue:", CFSTR("transactionDate"), 900, 1, 0, 0, 0, 0);
  v51 = (void *)objc_msgSend(*(id *)(a1 + 32), "newAttributeNamed:attributeType:isOptional:isTransient:withDefaultValue:andMinValue:andMaxValue:", CFSTR("transactionNumber"), 300, 0, 0, v78, 0, 0);
  v52 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithInt:", 3);
  v53 = (void *)objc_msgSend(*(id *)(a1 + 32), "newAttributeNamed:attributeType:isOptional:isTransient:withDefaultValue:andMinValue:andMaxValue:", CFSTR("transactionTypeNum"), 200, 0, 0, v78, v78, v52);

  v54 = (void *)objc_msgSend(*(id *)(a1 + 32), "newAttributeNamed:attributeType:isOptional:isTransient:withDefaultValue:andMinValue:andMaxValue:", CFSTR("transactionLogFilename"), 700, 1, 0, 0, 0, 0);
  v55 = (void *)objc_msgSend(*(id *)(a1 + 32), "newAttributeNamed:attributeType:isOptional:isTransient:withDefaultValue:andMinValue:andMaxValue:", CFSTR("knowledgeVectorString"), 700, 0, 0, 0, 0, 0);
  v56 = (void *)objc_msgSend(*(id *)(a1 + 32), "newRelationshipNamed:withDestinationEntity:andInverseRelationship:isOptional:isToMany:andDeleteRule:", CFSTR("actingPeer"), v76, 0, 1, 0, 1);
  v57 = (void *)objc_msgSend(*(id *)(a1 + 32), "newRelationshipNamed:withDestinationEntity:andInverseRelationship:isOptional:isToMany:andDeleteRule:", CFSTR("storeMetadata"), v73, 0, 1, 0, 1);
  v58 = v50;
  v63 = (void *)v50;
  v59 = (void *)objc_msgSend(*(id *)(a1 + 32), "newRelationshipNamed:withDestinationEntity:andInverseRelationship:isOptional:isToMany:andDeleteRule:", CFSTR("transactionEntries"), v50, v56, 1, 1, 1);
  objc_msgSend(v77, "addObject:", v59);

  v60 = (void *)objc_msgSend(*(id *)(a1 + 32), "newRelationshipNamed:withDestinationEntity:andInverseRelationship:isOptional:isToMany:andDeleteRule:", CFSTR("transactionEntries"), v58, v57, 1, 1, 1);
  objc_msgSend(v72, "addObject:", v60);

  v61 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:", v69, v67, v65, v53, v51, v54, v55, v56, v57, 0);
  objc_msgSend(v63, "setProperties:", v61);

  objc_msgSend(v76, "setProperties:", v77);
  objc_msgSend(v73, "setProperties:", v72);

  _MergedGlobals_92 = objc_alloc_init(NSManagedObjectModel);
  v62 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", v76, v75, v74, v71, v73, v63, 0);
  objc_msgSend((id)_MergedGlobals_92, "setEntities:", v62);

}

- (id)newEntityForName:(id)a3
{
  NSEntityDescription *v5;

  v5 = objc_alloc_init(NSEntityDescription);
  -[NSEntityDescription setName:](v5, "setName:", a3);
  -[NSEntityDescription setManagedObjectClassName:](v5, "setManagedObjectClassName:", a3);
  -[PFUbiquityMetadataFactory addModelingToolUserInfoToEntity:](self, "addModelingToolUserInfoToEntity:", v5);
  return v5;
}

- (id)newAttributeNamed:(id)a3 attributeType:(unint64_t)a4 isOptional:(BOOL)a5 isTransient:(BOOL)a6 withDefaultValue:(id)a7 andMinValue:(id)a8 andMaxValue:(id)a9
{
  _BOOL8 v11;
  _BOOL8 v12;
  NSAttributeDescription *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  id v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;

  v11 = a6;
  v12 = a5;
  v16 = objc_alloc_init(NSAttributeDescription);
  -[NSPropertyDescription setName:](v16, "setName:", a3);
  -[NSAttributeDescription setAttributeType:](v16, "setAttributeType:", a4);
  -[NSPropertyDescription setOptional:](v16, "setOptional:", v12);
  -[NSPropertyDescription setTransient:](v16, "setTransient:", v11);
  -[NSAttributeDescription setDefaultValue:](v16, "setDefaultValue:", a7);
  if (a8)
  {
    v17 = objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForEvaluatedObject");
    v18 = objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForConstantValue:", a8);
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3518]), "initWithLeftExpression:rightExpression:modifier:type:options:", v17, v18, 0, 3, 0);
    a8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v20 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithInteger:", 1620);
    objc_msgSend(v20, "addObject:", v21);

    objc_msgSend(a8, "addObject:", v19);
    if (!a9)
      goto LABEL_8;
LABEL_5:
    v22 = objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForEvaluatedObject");
    v23 = objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForConstantValue:", a9);
    v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3518]), "initWithLeftExpression:rightExpression:modifier:type:options:", v22, v23, 0, 1, 0);
    if (a8)
    {
      if (v20)
      {
LABEL_7:
        v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithInteger:", 1610);
        objc_msgSend(v20, "addObject:", v25);

        objc_msgSend(a8, "addObject:", v24);
        goto LABEL_8;
      }
    }
    else
    {
      a8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      if (v20)
        goto LABEL_7;
    }
    v20 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    goto LABEL_7;
  }
  v20 = 0;
  if (a9)
    goto LABEL_5;
LABEL_8:
  if (a8 && v20)
    -[NSPropertyDescription setValidationPredicates:withValidationWarnings:](v16, "setValidationPredicates:withValidationWarnings:", a8, v20);

  -[PFUbiquityMetadataFactory addModelingToolUserInfoToProperty:](self, "addModelingToolUserInfoToProperty:", v16);
  return v16;
}

- (id)newRelationshipNamed:(id)a3 withDestinationEntity:(id)a4 andInverseRelationship:(id)a5 isOptional:(BOOL)a6 isToMany:(BOOL)a7 andDeleteRule:(unint64_t)a8
{
  _BOOL4 v9;
  _BOOL8 v10;
  NSRelationshipDescription *v15;
  _BOOL8 v16;

  v9 = a7;
  v10 = a6;
  v15 = objc_alloc_init(NSRelationshipDescription);
  -[NSPropertyDescription setName:](v15, "setName:", a3);
  -[NSPropertyDescription setOptional:](v15, "setOptional:", v10);
  -[NSRelationshipDescription setDeleteRule:](v15, "setDeleteRule:", a8);
  -[NSRelationshipDescription setDestinationEntity:](v15, "setDestinationEntity:", a4);
  if (a5)
  {
    -[NSRelationshipDescription setInverseRelationship:](v15, "setInverseRelationship:", a5);
    objc_msgSend(a5, "setInverseRelationship:", v15);
  }
  v16 = !v9;
  -[NSRelationshipDescription setMinCount:](v15, "setMinCount:", v16);
  -[NSRelationshipDescription setMaxCount:](v15, "setMaxCount:", v16);
  -[PFUbiquityMetadataFactory addModelingToolUserInfoToProperty:](self, "addModelingToolUserInfoToProperty:", v15);
  return v15;
}

- (void)addModelingToolUserInfoToEntity:(id)a3
{
  id v4;

  v4 = objc_alloc_init(MEMORY[0x1E0C99D80]);
  objc_msgSend(a3, "setUserInfo:", v4);

}

@end
