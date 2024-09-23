@implementation PFUbiquityImportContext

- (PFUbiquityImportContext)init
{
  char *v2;
  PFUbiquityImportContext *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PFUbiquityImportContext;
  v2 = -[PFUbiquityImportContext init](&v5, sel_init);
  v3 = (PFUbiquityImportContext *)v2;
  if (v2)
  {
    *((_QWORD *)v2 + 11) = 0;
    *(_OWORD *)(v2 + 8) = 0u;
    *(_OWORD *)(v2 + 24) = 0u;
    *(_OWORD *)(v2 + 40) = 0u;
    *(_OWORD *)(v2 + 56) = 0u;
    *((_QWORD *)v2 + 9) = 0;
    *((_QWORD *)v2 + 10) = objc_alloc_init(MEMORY[0x1E0C99E08]);
  }
  return v3;
}

- (PFUbiquityImportContext)initWithStoreName:(id)a3 andUbiquityRootLocation:(id)a4 withLocalPeerID:(id)a5
{
  PFUbiquityImportContext *v8;
  id *v9;
  id v10;

  v8 = -[PFUbiquityImportContext init](self, "init");
  if (v8)
  {
    objc_opt_self();
    v9 = -[PFUbiquityMetadataFactory newStackForLocalPeerID:storeName:andUbiquityRootLocation:error:](_sharedFactory, a5, a3, a4, 0);
    v8->_stack = (_PFUbiquityStack *)v9;
    if (v9)
      v10 = v9[1];
    else
      v10 = 0;
    v8->_storeMetadata = (PFUbiquityStoreMetadata *)(id)+[PFUbiquityStoreMetadata metadataForStoreWithName:inManagedObjectContext:]((uint64_t)PFUbiquityStoreMetadata, a3, v10);
  }
  return v8;
}

- (PFUbiquityImportContext)initWithStack:(id)a3 andStoreMetadata:(id)a4
{
  PFUbiquityImportContext *v6;

  v6 = -[PFUbiquityImportContext init](self, "init");
  if (v6)
  {
    v6->_stack = (_PFUbiquityStack *)a3;
    v6->_storeMetadata = (PFUbiquityStoreMetadata *)a4;
  }
  return v6;
}

- (void)dealloc
{
  SEL v3;
  SEL v4;
  SEL v5;
  SEL v6;
  SEL v7;
  SEL v8;
  SEL v9;
  objc_super v10;

  -[PFUbiquityImportContext setExportingPeerID:](self, 0);

  self->_stack = 0;
  self->_storeMetadata = 0;
  objc_setProperty_nonatomic(self, v3, 0, 32);
  objc_setProperty_nonatomic(self, v4, 0, 40);
  objc_setProperty_nonatomic(self, v5, 0, 56);
  objc_setProperty_nonatomic(self, v6, 0, 64);
  objc_setProperty_nonatomic(self, v7, 0, 72);
  objc_setProperty_nonatomic(self, v8, 0, 88);
  -[PFUbiquityImportContext setExportingPeerID:](self, 0);

  self->_globalIDToFetchedObject = 0;
  objc_setProperty_nonatomic(self, v9, 0, 96);
  v10.receiver = self;
  v10.super_class = (Class)PFUbiquityImportContext;
  -[PFUbiquityImportContext dealloc](&v10, sel_dealloc);
}

- (_QWORD)setExportingPeerID:(_QWORD *)result
{
  _QWORD *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;

  if (result)
  {
    v3 = result;
    v4 = (void *)result[6];
    if (v4 != a2)
    {

      v3[6] = a2;
      v5 = (void *)v3[6];
      if (v5)
      {
        v6 = v3[1];
        if (v6)
          v7 = *(void **)(v6 + 8);
        else
          v7 = 0;
        result = (id)+[PFUbiquityPeer peerForPeerID:inManagedObjectContext:createIfMissing:]((uint64_t)PFUbiquityPeer, v5, v7, 1);
      }
      else
      {
        result = 0;
      }
      v3[3] = result;
    }
  }
  return result;
}

- (_QWORD)setActingPeer:(_QWORD *)result
{
  _QWORD *v3;
  void *v4;
  id v5;
  _QWORD *v6;

  if (result)
  {
    v3 = result;
    v4 = (void *)result[3];
    if (v4 != a2)
    {

      v5 = a2;
      v3[3] = v5;
      result = (_QWORD *)objc_msgSend(v5, "peerKey");
      v6 = (_QWORD *)v3[6];
      if (result != v6)
      {

        result = (id)objc_msgSend((id)v3[3], "peerKey");
        v3[6] = result;
      }
    }
  }
  return result;
}

- (uint64_t)prefetchManagedObjectsInContext:(_QWORD *)a3 error:
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  uint64_t v19;
  NSFetchRequest *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t k;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  NSObject *v38;
  id obj;
  uint64_t v42;
  id v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  uint64_t v56;
  uint8_t buf[4];
  const char *v58;
  __int16 v59;
  int v60;
  _BYTE v61[128];
  _BYTE v62[128];
  _BYTE v63[128];
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v56 = 0;
  v43 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  v6 = *(void **)(a1 + 72);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v52, v63, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v53;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v53 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v52 + 1) + 8 * i);
        if (v11 && *(_QWORD *)(v11 + 48))
        {
          objc_msgSend(v5, "setObject:forKey:", *(_QWORD *)(*((_QWORD *)&v52 + 1) + 8 * i));
          v12 = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a2, "persistentStoreCoordinator"), "managedObjectModel"), "entitiesByName"), "objectForKey:", *(_QWORD *)(v11 + 16));
          if (v12)
          {
            if ((*(_BYTE *)(v12 + 120) & 4) != 0)
            {
              v13 = *(void **)(v12 + 72);
            }
            else
            {
              do
              {
                v13 = (void *)v12;
                v12 = objc_msgSend((id)v12, "superentity");
              }
              while (v12);
            }
            v14 = objc_msgSend(v13, "name");
            v15 = (id)objc_msgSend(v43, "objectForKey:", v14);
            if (!v15)
            {
              v15 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
              objc_msgSend(v43, "setObject:forKey:", v15, v14);

            }
            objc_msgSend(v15, "addObject:", *(_QWORD *)(v11 + 48));
          }
          else if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 1))
          {
            NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@ didn't get entity description back for entity named: %@\nMOC: %@\nPSC: %@"), "-[PFUbiquityImportContext prefetchManagedObjectsInContext:error:]", 143, a1, v11, a2, objc_msgSend(a2, "persistentStoreCoordinator"));
          }
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v52, v63, 16);
    }
    while (v8);
  }
  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  obj = (id)objc_msgSend(v43, "allKeys");
  v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v62, 16);
  if (v16)
  {
    v17 = v16;
    v42 = *(_QWORD *)v49;
    while (2)
    {
      for (j = 0; j != v17; ++j)
      {
        if (*(_QWORD *)v49 != v42)
          objc_enumerationMutation(obj);
        v19 = *(_QWORD *)(*((_QWORD *)&v48 + 1) + 8 * j);
        v20 = -[NSFetchRequest initWithEntityName:]([NSFetchRequest alloc], "initWithEntityName:", v19);
        v21 = (void *)objc_msgSend(v43, "objectForKey:", v19);
        if (objc_msgSend(v21, "count"))
          v22 = objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("SELF IN %@"), v21);
        else
          v22 = objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithValue:", 0);
        -[NSFetchRequest setPredicate:](v20, "setPredicate:", v22);
        v23 = (void *)objc_msgSend(a2, "executeFetchRequest:error:", v20, &v56);

        if (!v23)
        {
          v30 = 0;
          goto LABEL_43;
        }
        v46 = 0u;
        v47 = 0u;
        v44 = 0u;
        v45 = 0u;
        v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v44, v61, 16);
        if (v24)
        {
          v25 = v24;
          v26 = *(_QWORD *)v45;
          do
          {
            for (k = 0; k != v25; ++k)
            {
              if (*(_QWORD *)v45 != v26)
                objc_enumerationMutation(v23);
              v28 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * k);
              v29 = objc_msgSend(v5, "objectForKey:", objc_msgSend(v28, "objectID"));
              if (v29)
                objc_msgSend(*(id *)(a1 + 80), "setObject:forKey:", v28, v29);
            }
            v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v44, v61, 16);
          }
          while (v25);
        }
      }
      v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v62, 16);
      if (v17)
        continue;
      break;
    }
  }
  v30 = 1;
LABEL_43:

  if ((v30 & 1) == 0)
  {
    if (v56)
    {
      if (a3)
        *a3 = v56;
    }
    else
    {
      v31 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
      _NSCoreDataLog(17, v31, v32, v33, v34, v35, v36, v37, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Import/PFUbiquityImportContext.m");
      v38 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        v58 = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Import/PFUbiquityImportContext.m";
        v59 = 1024;
        v60 = 189;
        _os_log_fault_impl(&dword_18A253000, v38, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
      }
    }
  }
  return v30;
}

@end
