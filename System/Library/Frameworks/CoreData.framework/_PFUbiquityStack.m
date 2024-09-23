@implementation _PFUbiquityStack

- (_PFUbiquityStack)init
{
  return 0;
}

- (id)initWithMetadataEntry:(void *)a1
{
  id *v3;
  id v4;
  _QWORD *v5;
  uint64_t v6;
  _QWORD *v7;
  void *v8;
  NSManagedObjectContext *v9;
  _QWORD *v10;
  uint64_t v11;
  _QWORD *v12;
  id v13;
  objc_super v15;
  objc_super v16;

  if (!a1)
    return 0;
  v16.receiver = a1;
  v16.super_class = (Class)_PFUbiquityStack;
  v3 = (id *)objc_msgSendSuper2(&v16, sel_init);
  if (v3)
  {
    if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 3))
    {
      v15.receiver = v3;
      v15.super_class = (Class)_PFUbiquityStack;
      v4 = objc_msgSendSuper2(&v15, sel_description);
      NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Initializing stack(%@) with metadata entry: %@"), "-[_PFUbiquityStack initWithMetadataEntry:]", 71, v4, a2);
    }
    v3[2] = a2;
    if (a2)
    {
      v5 = (_QWORD *)a2[1];
      if (v5)
        v5 = (_QWORD *)v5[4];
      v3[3] = v5;
      v6 = a2[1];
      if (v6 && *(_DWORD *)(v6 + 24) != 1)
        v6 = *(_QWORD *)(v6 + 8);
      v3[4] = (id)v6;
      v7 = (_QWORD *)a2[1];
      if (v7)
        v7 = (_QWORD *)v7[5];
      v3[5] = v7;
      v8 = (void *)a2[1];
    }
    else
    {
      v3[3] = 0;
      v3[4] = 0;
      v8 = 0;
      v3[5] = 0;
    }
    v3[6] = v8;
    if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 3))
      NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Setting up metadataMOC for stack: %@"), "-[_PFUbiquityStack initWithMetadataEntry:]", 88, v3);
    v9 = -[NSManagedObjectContext initWithConcurrencyType:]([NSManagedObjectContext alloc], "initWithConcurrencyType:", 3);
    v3[1] = v9;
    -[NSManagedObjectContext setMergePolicy:](v9, "setMergePolicy:", NSMergeByPropertyObjectTrumpMergePolicy);
    v10 = v3[2];
    if (v10)
      v11 = v10[2];
    else
      v11 = 0;
    objc_msgSend(v3[1], "setPersistentStoreCoordinator:", v11);
    v12 = v3[1];
    if (v12)
    {
      v12[5] &= ~0x100000uLL;
      v13 = v3[1];
    }
    else
    {
      v13 = 0;
    }
    objc_msgSend(v13, "setUndoManager:", 0);
    objc_msgSend(v3[1], "_setDelegate:", v3);
    if (!objc_msgSend((id)objc_msgSend(v3[1], "persistentStoreCoordinator"), "managedObjectModel"))
      __break(1u);
  }
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  self->_localPeerID = 0;
  self->_ubiquityRootURL = 0;

  self->_storeName = 0;
  self->_metadataStoreFileLocation = 0;

  self->_metadataMOC = 0;
  self->_metadataEntry = 0;
  v3.receiver = self;
  v3.super_class = (Class)_PFUbiquityStack;
  -[_PFUbiquityStack dealloc](&v3, sel_dealloc);
}

- (id)description
{
  void *v3;
  id v4;
  NSString *localPeerID;
  PFUbiquityLocation *ubiquityRootURL;
  PFUbiquityLocation *metadataStoreFileLocation;
  objc_super v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v9.receiver = self;
  v9.super_class = (Class)_PFUbiquityStack;
  v4 = -[_PFUbiquityStack description](&v9, sel_description);
  if (self)
  {
    localPeerID = self->_localPeerID;
    ubiquityRootURL = self->_ubiquityRootURL;
    metadataStoreFileLocation = self->_metadataStoreFileLocation;
  }
  else
  {
    ubiquityRootURL = 0;
    localPeerID = 0;
    metadataStoreFileLocation = 0;
  }
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: \n\tlocalPeerID: %@\n\tubiquityRootURL: %@\n\tmetadataContainerURL: %@\n"), v4, localPeerID, ubiquityRootURL, metadataStoreFileLocation);
}

- (uint64_t)purgeAndInitializeMetadataStoreFileWithError:(uint64_t)result
{
  uint64_t v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  int v14;
  PFUbiquityMetadataFactoryEntry *v15;
  NSManagedObjectContext *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
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
  uint8_t buf[4];
  const char *v31;
  __int16 v32;
  int v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  if (!result)
    return result;
  v3 = result;
  v29 = 0;

  *(_QWORD *)(v3 + 8) = 0;
  v4 = *(_QWORD *)(v3 + 16);
  if (!v4)
    return 1;
  v5 = (id)objc_msgSend(*(id *)(v4 + 24), "options");
  v6 = *(_QWORD *)(v3 + 16);
  if (v6)
    v7 = *(void **)(v6 + 24);
  else
    v7 = 0;
  v8 = (id)objc_msgSend(v7, "URL");
  objc_opt_self();
  v9 = -[PFUbiquityMetadataFactory entryForLocalPeerID:storeName:andUbiquityRootLocation:](_sharedFactory, *(_QWORD *)(v3 + 24), *(_QWORD *)(v3 + 40), *(_QWORD *)(v3 + 32));
  objc_opt_self();
  -[PFUbiquityMetadataFactory removeCachedCoordinatorsForLocalPeerID:storeName:andUbiquityRootLocation:]((id *)_sharedFactory, *(_QWORD *)(v3 + 24), *(_QWORD *)(v3 + 40), *(_QWORD *)(v3 + 32));
  v10 = -[PFUbiquityLocation createFullPath](*(_QWORD *)(v3 + 48));
  v11 = objc_msgSend(v10, "stringByDeletingLastPathComponent");

  if (objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "fileExistsAtPath:", v11))
  {
    v12 = *(_QWORD *)(v3 + 16);
    if (v12)
      v13 = *(void **)(v12 + 16);
    else
      v13 = 0;
    v14 = objc_msgSend(v13, "_destroyPersistentStoreAtURL:withType:options:error:", v8, CFSTR("SQLite"), v5, &v29);

    *(_QWORD *)(v3 + 16) = 0;
  }
  else
  {
    v14 = 1;
  }

  if (v14)
  {
    if (!v9)
    {
      objc_opt_self();
      v15 = -[PFUbiquityMetadataFactory newMetadataEntryForLocalPeerID:storeName:andUbiquityRootLocation:error:](_sharedFactory, *(void **)(v3 + 24), *(void **)(v3 + 40), *(void **)(v3 + 32), &v29);
LABEL_15:
      *(_QWORD *)(v3 + 16) = v15;
      if (v15)
      {
        if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 3))
          NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Setting up metadataMOC for stack: %@"), "-[_PFUbiquityStack purgeAndInitializeMetadataStoreFileWithError:]", 175, v3);
        v16 = -[NSManagedObjectContext initWithConcurrencyType:]([NSManagedObjectContext alloc], "initWithConcurrencyType:", 3);
        *(_QWORD *)(v3 + 8) = v16;
        -[NSManagedObjectContext setMergePolicy:](v16, "setMergePolicy:", NSMergeByPropertyObjectTrumpMergePolicy);
        v17 = *(_QWORD *)(v3 + 16);
        if (v17)
          v18 = *(_QWORD *)(v17 + 16);
        else
          v18 = 0;
        objc_msgSend(*(id *)(v3 + 8), "setPersistentStoreCoordinator:", v18);
        v19 = *(_QWORD *)(v3 + 8);
        if (v19)
        {
          *(_QWORD *)(v19 + 40) &= ~0x100000uLL;
          v20 = *(void **)(v3 + 8);
        }
        else
        {
          v20 = 0;
        }
        objc_msgSend(v20, "setUndoManager:", 0);
        objc_msgSend(*(id *)(v3 + 8), "_setDelegate:", v3);
        return 1;
      }
      goto LABEL_24;
    }
    objc_opt_self();
    if (-[PFUbiquityMetadataFactory cacheEntryForLocalPeerID:storeName:andUbiquityRootLocation:error:](_sharedFactory, *(void **)(v3 + 24), *(void **)(v3 + 40), *(void **)(v3 + 32), &v29))
    {
      objc_opt_self();
      v15 = (PFUbiquityMetadataFactoryEntry *)(id)-[PFUbiquityMetadataFactory entryForLocalPeerID:storeName:andUbiquityRootLocation:](_sharedFactory, *(_QWORD *)(v3 + 24), *(_QWORD *)(v3 + 40), *(_QWORD *)(v3 + 32));
      goto LABEL_15;
    }
  }
LABEL_24:
  if (v29)
  {
    if (a2)
      *a2 = v29;
  }
  else
  {
    v21 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
    _NSCoreDataLog(17, v21, v22, v23, v24, v25, v26, v27, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/_PFUbiquityStack.m");
    v28 = __pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315394;
      v31 = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/_PFUbiquityStack.m";
      v32 = 1024;
      v33 = 187;
      _os_log_fault_impl(&dword_18A253000, v28, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
    }
  }
  return 0;
}

- (PFUbiquityKnowledgeVector)createMetadataStoreKnowledgeVector:(uint64_t)a1
{
  uint64_t v3;
  NSExpressionDescription *v4;
  NSFetchRequest *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  BOOL v14;
  PFUbiquityKnowledgeVector *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint64_t v30;
  uint8_t buf[4];
  const char *v32;
  __int16 v33;
  int v34;
  _BYTE v35[128];
  _QWORD v36[4];

  v36[2] = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v30 = 0;
  v3 = objc_msgSend(MEMORY[0x1E0CB35D0], "expressionWithFormat:", CFSTR("max:(transactionNumber)"));
  v4 = objc_alloc_init(NSExpressionDescription);
  -[NSPropertyDescription setName:](v4, "setName:", CFSTR("max"));
  -[NSExpressionDescription setExpression:](v4, "setExpression:", v3);
  -[NSExpressionDescription setExpressionResultType:](v4, "setExpressionResultType:", 300);
  v5 = -[NSFetchRequest initWithEntityName:]([NSFetchRequest alloc], "initWithEntityName:", CFSTR("PFUbiquityTransactionEntry"));
  -[NSFetchRequest setResultType:](v5, "setResultType:", 2);
  v36[0] = CFSTR("actingPeer.peerKey");
  v36[1] = v4;
  -[NSFetchRequest setPropertiesToFetch:](v5, "setPropertiesToFetch:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 2));
  -[NSFetchRequest setPropertiesToGroupBy:](v5, "setPropertiesToGroupBy:", &unk_1E1F52500);

  v6 = (void *)objc_msgSend(*(id *)(a1 + 8), "executeFetchRequest:error:", v5, &v30);
  if (v6)
  {
    v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v26, v35, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v27 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
          v12 = objc_msgSend(v11, "objectForKey:", CFSTR("actingPeer.peerKey"));
          v13 = objc_msgSend(v11, "objectForKey:", CFSTR("max"));
          if (v12)
            v14 = v13 == 0;
          else
            v14 = 1;
          if (!v14)
            objc_msgSend(v7, "setObject:forKey:", v13, v12);
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v26, v35, 16);
      }
      while (v8);
    }
    if (v7)
    {
      v15 = -[PFUbiquityKnowledgeVector initWithKnowledgeVectorDictionary:]([PFUbiquityKnowledgeVector alloc], "initWithKnowledgeVectorDictionary:", v7);
      if (v15)
        goto LABEL_27;
    }
  }
  else
  {
    if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 2))
      NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Error getting knowledge vector from metadata store: %@"), "-[_PFUbiquityStack createMetadataStoreKnowledgeVector:]", 278, v30);
    v7 = 0;
  }
  if (!v30)
  {
    v16 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
    _NSCoreDataLog(17, v16, v17, v18, v19, v20, v21, v22, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/_PFUbiquityStack.m");
    v23 = __pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315394;
      v32 = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/_PFUbiquityStack.m";
      v33 = 1024;
      v34 = 282;
      _os_log_fault_impl(&dword_18A253000, v23, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
    }
    goto LABEL_26;
  }
  if (!a2)
  {
LABEL_26:
    v15 = 0;
    goto LABEL_27;
  }
  v15 = 0;
  *a2 = v30;
LABEL_27:

  return v15;
}

- (PFUbiquityKnowledgeVector)createMinMetadataStoreKnowledgeVector:(uint64_t)a1
{
  uint64_t v3;
  NSExpressionDescription *v4;
  NSFetchRequest *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  BOOL v14;
  PFUbiquityKnowledgeVector *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint64_t v30;
  uint8_t buf[4];
  const char *v32;
  __int16 v33;
  int v34;
  _BYTE v35[128];
  _QWORD v36[4];

  v36[2] = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v30 = 0;
  v3 = objc_msgSend(MEMORY[0x1E0CB35D0], "expressionWithFormat:", CFSTR("min:(transactionNumber)"));
  v4 = objc_alloc_init(NSExpressionDescription);
  -[NSPropertyDescription setName:](v4, "setName:", CFSTR("min"));
  -[NSExpressionDescription setExpression:](v4, "setExpression:", v3);
  -[NSExpressionDescription setExpressionResultType:](v4, "setExpressionResultType:", 300);
  v5 = -[NSFetchRequest initWithEntityName:]([NSFetchRequest alloc], "initWithEntityName:", CFSTR("PFUbiquityTransactionEntry"));
  -[NSFetchRequest setResultType:](v5, "setResultType:", 2);
  v36[0] = CFSTR("actingPeer.peerKey");
  v36[1] = v4;
  -[NSFetchRequest setPropertiesToFetch:](v5, "setPropertiesToFetch:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 2));
  -[NSFetchRequest setPropertiesToGroupBy:](v5, "setPropertiesToGroupBy:", &unk_1E1F52518);

  v6 = (void *)objc_msgSend(*(id *)(a1 + 8), "executeFetchRequest:error:", v5, &v30);
  if (v6)
  {
    v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v26, v35, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v27;
      while (2)
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v27 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
          v12 = objc_msgSend(v11, "objectForKey:", CFSTR("actingPeer.peerKey"));
          v13 = objc_msgSend(v11, "objectForKey:", CFSTR("min"));
          if (v12)
            v14 = v13 == 0;
          else
            v14 = 1;
          if (v14)
          {

            goto LABEL_20;
          }
          objc_msgSend(v7, "setObject:forKey:", v13, v12);
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v26, v35, 16);
        if (v8)
          continue;
        break;
      }
    }
    if (v7)
    {
      v15 = -[PFUbiquityKnowledgeVector initWithKnowledgeVectorDictionary:]([PFUbiquityKnowledgeVector alloc], "initWithKnowledgeVectorDictionary:", v7);
      if (v15)
        goto LABEL_27;
    }
  }
  else
  {
    if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 2))
      NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Error getting knowledge vector from metadata store: %@"), "-[_PFUbiquityStack createMinMetadataStoreKnowledgeVector:]", 333, v30);
LABEL_20:
    v7 = 0;
  }
  if (!v30)
  {
    v16 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
    _NSCoreDataLog(17, v16, v17, v18, v19, v20, v21, v22, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/_PFUbiquityStack.m");
    v23 = __pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315394;
      v32 = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/_PFUbiquityStack.m";
      v33 = 1024;
      v34 = 337;
      _os_log_fault_impl(&dword_18A253000, v23, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
    }
    goto LABEL_26;
  }
  if (!a2)
  {
LABEL_26:
    v15 = 0;
    goto LABEL_27;
  }
  v15 = 0;
  *a2 = v30;
LABEL_27:

  return v15;
}

@end
