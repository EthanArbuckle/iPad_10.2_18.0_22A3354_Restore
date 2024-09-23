@implementation PFUbiquitySwitchboard

+ (void)initialize
{
  objc_opt_self();
  if ((id)objc_opt_class() == a1)
    _sharedSwitchboard = objc_alloc_init(PFUbiquitySwitchboard);
}

- (PFUbiquitySwitchboard)init
{
  PFUbiquitySwitchboard *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PFUbiquitySwitchboard;
  v2 = -[PFUbiquitySwitchboard init](&v4, sel_init);
  if (v2)
  {
    v2->_storeNameToLocalPeerIDToEntry = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v2->_rootLocationToLocalPeerIDToFilePresenters = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v2->_rootLocationToLocalPeerIDToPreviousEntries = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v2->_registrationLock = (NSRecursiveLock *)objc_alloc_init(MEMORY[0x1E0CB38E0]);
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "removeObserver:", self);

  self->_storeNameToLocalPeerIDToEntry = 0;
  self->_rootLocationToLocalPeerIDToFilePresenters = 0;

  self->_rootLocationToLocalPeerIDToPreviousEntries = 0;
  self->_registrationLock = 0;
  v3.receiver = self;
  v3.super_class = (Class)PFUbiquitySwitchboard;
  -[PFUbiquitySwitchboard dealloc](&v3, sel_dealloc);
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PFUbiquitySwitchboard;
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: \n\tstoreNameToEntry: %@\n\trootLocationToFilePresenter: %@\n"), -[PFUbiquitySwitchboard description](&v3, sel_description), self->_storeNameToLocalPeerIDToEntry, self->_rootLocationToLocalPeerIDToFilePresenters);
}

- (id)retainedEntryForStoreName:(uint64_t)a3 andLocalPeerID:
{
  id v6;

  if (!a1)
    return 0;
  objc_msgSend(*(id *)(a1 + 32), "lock");
  v6 = (id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 8), "objectForKey:", a2), "objectForKey:", a3);
  objc_msgSend(*(id *)(a1 + 32), "unlock");
  return v6;
}

- (uint64_t)filePresenterForUbiquityRootLocation:(uint64_t)a3 andLocalPeerID:
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  _OWORD v17[4];
  _OWORD v18[4];
  _BYTE v19[128];
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  objc_msgSend(a1[4], "lock");
  if (a2)
  {
    v6 = (void *)a2;
    if (*(_DWORD *)(a2 + 24) != 1)
      v6 = *(void **)(a2 + 8);
  }
  else
  {
    v6 = 0;
  }
  v7 = (void *)objc_msgSend(a1[2], "objectForKey:", v6);
  v8 = v7;
  if (a3)
  {
    v9 = (void *)objc_msgSend(v7, "objectForKey:", a3);
  }
  else
  {
    memset(v18, 0, sizeof(v18));
    if (!objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", v18, v20, 16))
      goto LABEL_11;
    v9 = (void *)objc_msgSend(v8, "objectForKey:", **((_QWORD **)&v18[0] + 1));
  }
  if (!v9 || (v10 = objc_msgSend(v9, "lastObject")) == 0)
  {
LABEL_11:
    v11 = (void *)objc_msgSend(a1[3], "objectForKey:", a2);
    v12 = v11;
    if (a3)
    {
      v13 = (void *)objc_msgSend(v11, "objectForKey:", a3);
    }
    else
    {
      memset(v17, 0, sizeof(v17));
      v13 = (void *)objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", v17, v19, 16);
      if (v13)
        v13 = (void *)objc_msgSend(v12, "objectForKey:", **((_QWORD **)&v17[0] + 1));
    }
    v14 = objc_msgSend((id)objc_msgSend(v13, "lastObject"), "nonretainedObjectValue");
    v10 = v14;
    if (!v14)
      goto LABEL_22;
    if ((objc_msgSend(v6, "isEqual:", *(_QWORD *)(v14 + 32)) & 1) != 0)
    {
      v15 = 48;
    }
    else
    {
      if (!objc_msgSend(v6, "isEqual:", *(_QWORD *)(v10 + 40)))
      {
        v10 = 0;
        goto LABEL_22;
      }
      v15 = 56;
    }
    v10 = *(_QWORD *)(v10 + v15);
LABEL_22:
    if (a3 && !v10)
      v10 = -[PFUbiquitySwitchboard filePresenterForUbiquityRootLocation:andLocalPeerID:](a1, a2, 0);
  }
  objc_msgSend(a1[4], "unlock");
  return v10;
}

- (BOOL)cacheFilePresenterForUbiquityRootLocation:(uint64_t)a3 andLocalPeerID:
{
  PFUbiquityFilePresenter *v6;
  id v7;
  id v8;

  if (a1)
  {
    objc_msgSend(*(id *)(a1 + 32), "lock");
    if (a2 && *(_DWORD *)(a2 + 24) != 1)
      a2 = *(_QWORD *)(a2 + 8);
    v6 = -[PFUbiquityFilePresenter initWithUbiquityRootLocation:localPeerID:storeName:processingQueue:]([PFUbiquityFilePresenter alloc], "initWithUbiquityRootLocation:localPeerID:storeName:processingQueue:", a2, a3, 0, 0);
    v7 = (id)objc_msgSend(*(id *)(a1 + 16), "objectForKey:", a2);
    v8 = (id)objc_msgSend(v7, "objectForKey:", a3);
    if (!v7)
    {
      v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      objc_msgSend(*(id *)(a1 + 16), "setObject:forKey:", v7, a2);

    }
    if (!v8)
    {
      v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      objc_msgSend(v7, "setObject:forKey:", v8, a3);

    }
    objc_msgSend(MEMORY[0x1E0CB3600], "addFilePresenter:", v6);
    objc_msgSend(v8, "addObject:", v6);

    objc_msgSend(*(id *)(a1 + 32), "unlock");
  }
  return a1 != 0;
}

- (void)removeFilePresenterCachedForUbiquityRootLocation:(uint64_t)a3 andLocalPeerID:
{
  uint64_t v4;
  _QWORD *v6;

  if (a1)
  {
    v4 = a2;
    if (a2 && *(_DWORD *)(a2 + 24) != 1)
      v4 = *(_QWORD *)(a2 + 8);
    objc_msgSend(*(id *)(a1 + 32), "lock");
    v6 = (id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 16), "objectForKey:", v4), "objectForKey:", a3), "lastObject");
    if (v6)
      -[PFUbiquitySwitchboard _removeFilePresenter:](a1, v6);
    objc_msgSend(*(id *)(a1 + 32), "unlock");

  }
}

- (void)_removeFilePresenter:(uint64_t)a1
{
  _QWORD *v4;
  uint64_t v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;

  if (a1)
  {
    objc_msgSend(*(id *)(a1 + 32), "lock");
    v4 = a2;
    objc_msgSend(MEMORY[0x1E0CB3600], "removeFilePresenter:", a2);
    if (a2)
      v5 = a2[1];
    else
      v5 = 0;
    v6 = (id)objc_msgSend(*(id *)(a1 + 16), "objectForKey:", v5);
    v7 = v6;
    if (a2)
      v8 = a2[2];
    else
      v8 = 0;
    v9 = (id)objc_msgSend(v6, "objectForKey:", v8);
    objc_msgSend(v9, "removeObject:", a2);
    if (!objc_msgSend(v9, "count"))
    {
      if (a2)
        v10 = a2[2];
      else
        v10 = 0;
      objc_msgSend(v7, "removeObjectForKey:", v10);
    }
    if (!objc_msgSend(v7, "count"))
    {
      if (a2)
        v11 = a2[1];
      else
        v11 = 0;
      objc_msgSend(*(id *)(a1 + 16), "removeObjectForKey:", v11);
    }
    objc_msgSend(*(id *)(a1 + 32), "unlock");

  }
}

- (void)_addFilePresenter:(uint64_t)a1
{
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;

  if (a1)
  {
    objc_msgSend(*(id *)(a1 + 32), "lock");
    objc_msgSend(MEMORY[0x1E0CB3600], "addFilePresenter:", a2);
    if (a2)
      v4 = *(_QWORD *)(a2 + 8);
    else
      v4 = 0;
    v5 = (id)objc_msgSend(*(id *)(a1 + 16), "objectForKey:", v4);
    if (!v5)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      if (a2)
        v6 = *(_QWORD *)(a2 + 8);
      else
        v6 = 0;
      objc_msgSend(*(id *)(a1 + 16), "setObject:forKey:", v5, v6);
    }
    if (a2)
      v7 = *(_QWORD *)(a2 + 16);
    else
      v7 = 0;
    v8 = (id)objc_msgSend(v5, "objectForKey:", v7);
    if (!v8)
    {
      v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      if (a2)
        v9 = *(_QWORD *)(a2 + 16);
      else
        v9 = 0;
      objc_msgSend(v5, "setObject:forKey:", v8, v9);
    }
    objc_msgSend(v8, "addObject:", a2);
    objc_msgSend(*(id *)(a1 + 32), "unlock");

  }
}

- (uint64_t)registerUbiquitizedPersistentStore:(uint64_t)a3 withURL:(uint64_t)a4 forLocalPeerID:(void *)a5 withLocalRootLocation:(uint64_t)a6 andUbiquityRootLocation:(uint64_t *)a7 error:
{
  uint64_t v7;
  uint64_t v13;
  id v14;
  uint64_t v15;
  PFUbiquitySwitchboardEntry *v16;
  uint64_t v17;
  char v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  PFUbiquitySwitchboardEntryMetadata *metadata;
  uint64_t stores;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  NSObject *v33;
  uint8_t buf[4];
  const char *v37;
  __int16 v38;
  int v39;
  _QWORD v40[2];
  _QWORD v41[2];
  _QWORD v42[3];

  v7 = a1;
  v42[2] = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v13 = objc_msgSend((id)objc_msgSend(a2, "options"), "objectForKey:", CFSTR("NSPersistentStoreUbiquitousContentNameKey"));
    objc_msgSend(*(id *)(v7 + 32), "lock");
    v14 = (id)objc_msgSend(*(id *)(v7 + 8), "objectForKey:", v13);
    if (!v14)
    {
      v14 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      objc_msgSend(*(id *)(v7 + 8), "setObject:forKey:", v14, v13);

    }
    v15 = objc_msgSend(v14, "objectForKey:", a4);
    v16 = (PFUbiquitySwitchboardEntry *)v15;
    if (v15)
    {
      if ((objc_msgSend(a5, "isEqual:", *(_QWORD *)(v15 + 40)) & 1) != 0)
      {
        v17 = 0;
        v18 = 1;
      }
      else
      {
        v19 = (void *)MEMORY[0x1E0CB35C8];
        v20 = *MEMORY[0x1E0CB2D50];
        v42[0] = CFSTR("All stores registered with the same NSPersistentStoreUbiquitousContentNameKey must use the same location on the file system.");
        v41[0] = v20;
        v41[1] = CFSTR("NSAffectedStoresErrorKey");
        v21 = (uint64_t)a2;
        if (!a2)
          v21 = objc_msgSend(MEMORY[0x1E0C99E38], "null");
        v40[0] = v21;
        metadata = v16->_metadata;
        if (!metadata || (stores = (uint64_t)metadata->_stores) == 0)
          stores = objc_msgSend(MEMORY[0x1E0C99E38], "null");
        v40[1] = stores;
        v42[1] = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v40, 2);
        v24 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v42, v41, 2);
        v25 = objc_msgSend(v19, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134311, v24);
        v18 = 0;
        v17 = v25;
      }
    }
    else
    {
      v16 = -[PFUbiquitySwitchboardEntry initWithLocalPeerID:storeName:withURL:ubiquityRootLocation:andLocalRootLocation:]([PFUbiquitySwitchboardEntry alloc], "initWithLocalPeerID:storeName:withURL:ubiquityRootLocation:andLocalRootLocation:", a4, v13, a3, a6, a5);
      objc_msgSend(v14, "setObject:forKey:", v16, a4);
      v17 = 0;

      v18 = 1;
    }
    -[PFUbiquitySwitchboardEntry registerPersistentStore:withStoreName:]((uint64_t)v16, a2, v13);
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "addObserver:selector:name:object:", v7, sel_coordinatorWillRemoveStore_, CFSTR("NSPersistentStoreCoordinatorWillRemoveStoreNotification"), a2);
    objc_msgSend(*(id *)(v7 + 32), "unlock");
    if ((v18 & 1) == 0)
    {
      if (v17)
      {
        if (a7)
        {
          v7 = 0;
          *a7 = v17;
          return v7;
        }
      }
      else
      {
        v26 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
        _NSCoreDataLog(17, v26, v27, v28, v29, v30, v31, v32, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/PFUbiquitySwitchboard.m");
        v33 = __pflogFaultLog;
        if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 136315394;
          v37 = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/PFUbiquitySwitchboard.m";
          v38 = 1024;
          v39 = 374;
          _os_log_fault_impl(&dword_18A253000, v33, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
        }
      }
      return 0;
    }
    return 1;
  }
  return v7;
}

- (uint64_t)unregisterCoordinator:(uint64_t)result
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  uint64_t v17;
  uint64_t v18;
  uint64_t k;
  id v20;
  void *v21;
  id v22;
  id obj;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  _BYTE v44[128];
  _BYTE v45[128];
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v3 = result;
    objc_msgSend(*(id *)(result + 32), "lock");
    v26 = v3;
    v20 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
    v22 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    obj = *(id *)(v3 + 8);
    v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v46, 16);
    if (v4)
    {
      v24 = *(_QWORD *)v40;
      do
      {
        v5 = 0;
        v25 = v4;
        do
        {
          if (*(_QWORD *)v40 != v24)
            objc_enumerationMutation(obj);
          v6 = *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * v5);
          v7 = (id)objc_msgSend(*(id *)(v3 + 8), "objectForKey:", v6, v20);
          v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          v37 = 0u;
          v38 = 0u;
          v35 = 0u;
          v36 = 0u;
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v35, v45, 16);
          if (v9)
          {
            v10 = *(_QWORD *)v36;
            do
            {
              for (i = 0; i != v9; ++i)
              {
                if (*(_QWORD *)v36 != v10)
                  objc_enumerationMutation(v7);
                v12 = *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * i);
                v13 = (id)objc_msgSend(v7, "objectForKey:", v12);
                -[PFUbiquitySwitchboardEntry unregisterPersistentStoreCoordinator:]((uint64_t)v13, a2);
                if (!v13 || !v13[9])
                {
                  -[PFUbiquitySwitchboardEntry entryWillBeRemovedFromSwitchboard]((uint64_t)v13);
                  objc_msgSend(v8, "addObject:", v12);
                }

              }
              v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v35, v45, 16);
            }
            while (v9);
          }
          v33 = 0u;
          v34 = 0u;
          v31 = 0u;
          v32 = 0u;
          v14 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v31, v44, 16);
          if (v14)
          {
            v15 = *(_QWORD *)v32;
            do
            {
              for (j = 0; j != v14; ++j)
              {
                if (*(_QWORD *)v32 != v15)
                  objc_enumerationMutation(v8);
                objc_msgSend(v7, "removeObjectForKey:", *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * j));
              }
              v14 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v31, v44, 16);
            }
            while (v14);
          }
          v3 = v26;
          if (!objc_msgSend(v7, "count"))
            objc_msgSend(v22, "addObject:", v6);

          ++v5;
        }
        while (v5 != v25);
        v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v46, 16);
      }
      while (v4);
    }
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v17 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v27, v43, 16, v20);
    if (v17)
    {
      v18 = *(_QWORD *)v28;
      do
      {
        for (k = 0; k != v17; ++k)
        {
          if (*(_QWORD *)v28 != v18)
            objc_enumerationMutation(v22);
          objc_msgSend(*(id *)(v26 + 8), "removeObjectForKey:", *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * k));
        }
        v17 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v27, v43, 16);
      }
      while (v17);
    }

    objc_msgSend(v21, "drain");
    return objc_msgSend(*(id *)(v26 + 32), "unlock");
  }
  return result;
}

- (id)createSetOfCoordinatorsForPersistentStoreName:(uint64_t)a1 andLocalPeerID:(uint64_t)a2 atUbiquityRootLocation:(uint64_t)a3
{
  id v4;
  id v5;

  if (!a1)
    return 0;
  v4 = -[PFUbiquitySwitchboard retainedEntryForStoreName:andLocalPeerID:](a1, a2, a3);
  v5 = -[PFUbiquitySwitchboardEntry createSetOfPersistentStoreCoordinatorsRegisteredForStoreName:]((uint64_t)v4, a2);

  return v5;
}

- (void)unregisterPersistentStore:(uint64_t)a3 inCoordinator:
{
  uint64_t v5;
  uint64_t v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v5 = objc_msgSend((id)objc_msgSend(a2, "options"), "objectForKey:", CFSTR("NSPersistentStoreUbiquitousContentNameKey"));
    if (v5)
    {
      v6 = v5;
      objc_msgSend(a2, "setReadOnly:", 1);
      objc_msgSend(*(id *)(a1 + 32), "lock");
      v7 = (id)objc_msgSend(*(id *)(a1 + 8), "objectForKey:", v6);
      v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v24 = 0u;
      v25 = 0u;
      v22 = 0u;
      v23 = 0u;
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
      if (v9)
      {
        v10 = *(_QWORD *)v23;
        do
        {
          for (i = 0; i != v9; ++i)
          {
            if (*(_QWORD *)v23 != v10)
              objc_enumerationMutation(v7);
            v12 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i);
            v13 = objc_msgSend(v7, "objectForKey:", v12);
            -[PFUbiquitySwitchboardEntry unregisterPersistentStore:inCoordinator:](v13, a2, a3);
            if (!v13 || !*(_QWORD *)(v13 + 72))
            {
              -[PFUbiquitySwitchboardEntry entryWillBeRemovedFromSwitchboard](v13);
              objc_msgSend(v8, "addObject:", v12);
            }
          }
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
        }
        while (v9);
      }
      v20 = 0u;
      v21 = 0u;
      v18 = 0u;
      v19 = 0u;
      v14 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
      if (v14)
      {
        v15 = *(_QWORD *)v19;
        do
        {
          for (j = 0; j != v14; ++j)
          {
            if (*(_QWORD *)v19 != v15)
              objc_enumerationMutation(v8);
            objc_msgSend(v7, "removeObjectForKey:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * j));
            if (!objc_msgSend(v7, "count"))
              objc_msgSend(*(id *)(a1 + 8), "removeObjectForKey:", v6);
          }
          v14 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
        }
        while (v14);
      }
      objc_msgSend(*(id *)(a1 + 32), "unlock");

      if ((_DWORD)v14)
        objc_exception_rethrow();
    }
    else if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 1))
    {
      NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@\nAsked to unregister non-ubiquitized store: %@"), "-[PFUbiquitySwitchboard unregisterPersistentStore:inCoordinator:]", 455, a1, a2);
    }
  }
}

- (void)coordinatorWillRemoveStore:(id)a3
{
  void *v4;

  v4 = (void *)objc_msgSend(a3, "object");
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "removeObserver:name:object:", self, CFSTR("NSPersistentStoreCoordinatorWillRemoveStoreNotification"), v4);
  -[PFUbiquitySwitchboard unregisterPersistentStore:inCoordinator:]((uint64_t)self, v4, objc_msgSend(v4, "persistentStoreCoordinator"));
}

- (void)_quietlyMoveEntryToPreviousEntries:(id *)a1
{
  _QWORD *v4;
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  id v15;
  id v16;
  uint64_t v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  id v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v4 = a2;
    objc_msgSend(a1[4], "lock");
    v5 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
    -[PFUbiquitySwitchboardEntry entryWillBeRemovedFromSwitchboard]((uint64_t)a2);
    v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    if (a2)
      v7 = a2[2];
    else
      v7 = 0;
    v8 = (id)objc_msgSend(a1[1], "objectForKey:", v7);
    v9 = v8;
    if (a2)
      v10 = a2[1];
    else
      v10 = 0;
    objc_msgSend(v8, "removeObjectForKey:", v10);
    if (!objc_msgSend(v9, "count"))
    {
      if (a2)
        v11 = a2[2];
      else
        v11 = 0;
      objc_msgSend(v6, "addObject:", v11);
    }

    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v12 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    if (v12)
    {
      v13 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v28 != v13)
            objc_enumerationMutation(v6);
          objc_msgSend(a1[1], "removeObjectForKey:", *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i));
        }
        v12 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      }
      while (v12);
    }

    objc_msgSend(a1[4], "lock");
    if (a2)
    {
      if (a2[4])
      {
        v15 = (id)objc_msgSend(a1[3], "objectForKey:");
        if (!v15)
        {
          v15 = objc_alloc_init(MEMORY[0x1E0C99E08]);
          objc_msgSend(a1[3], "setObject:forKey:");
        }
        v16 = (id)objc_msgSend(v15, "objectForKey:", a2[1]);
        if (!v16)
        {
          v16 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          objc_msgSend(v15, "setObject:forKey:", v16, a2[1]);
        }
      }
      else
      {
        v15 = 0;
        v16 = 0;
      }
      v17 = a2[5];
      v18 = v16;
    }
    else
    {
      v18 = 0;
      v15 = 0;
      v17 = 0;
    }
    v19 = (id)objc_msgSend(a1[3], "objectForKey:", v17);
    if (!v19)
    {
      v19 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      if (a2)
        v20 = a2[5];
      else
        v20 = 0;
      objc_msgSend(a1[3], "setObject:forKey:", v19, v20);
    }
    if (a2)
      v21 = a2[1];
    else
      v21 = 0;
    v22 = (id)objc_msgSend(v19, "objectForKey:", v21);
    v23 = v22;
    if (!v22)
    {
      v23 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      if (a2)
        v24 = a2[1];
      else
        v24 = 0;
      v22 = (id)objc_msgSend(v19, "setObject:forKey:", v23, v24);
    }
    v25 = (void *)MEMORY[0x18D76B4E4](v22);
    v26 = objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithNonretainedObject:", a2);
    objc_msgSend(v18, "addObject:", v26);
    objc_msgSend(v23, "addObject:", v26);
    objc_autoreleasePoolPop(v25);
    objc_msgSend(a1[4], "unlock");

    objc_msgSend(v5, "drain");
    objc_msgSend(a1[4], "unlock");

  }
}

- (void)removeEntryFromPreviousEntries:(uint64_t)a1
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  uint64_t v16;
  id v17;
  id v18;
  uint64_t v19;
  void *j;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    objc_msgSend(*(id *)(a1 + 32), "lock");
    if (a2 && a2[4])
    {
      v4 = (id)objc_msgSend(*(id *)(a1 + 24), "objectForKey:");
      v5 = (id)objc_msgSend(v4, "objectForKey:", a2[1]);
      v30 = 0u;
      v31 = 0u;
      v28 = 0u;
      v29 = 0u;
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
      if (v6)
      {
        v7 = *(_QWORD *)v29;
        while (2)
        {
          for (i = 0; i != v6; ++i)
          {
            if (*(_QWORD *)v29 != v7)
              objc_enumerationMutation(v5);
            v9 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
            if ((_QWORD *)objc_msgSend(v9, "nonretainedObjectValue") == a2)
            {
              v10 = v9;
              if (v10)
                objc_msgSend(v5, "removeObject:", v10);
              goto LABEL_15;
            }
          }
          v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
          if (v6)
            continue;
          break;
        }
      }
      v10 = 0;
LABEL_15:
      if (v5 && !objc_msgSend(v5, "count"))
        objc_msgSend(v4, "removeObjectForKey:", a2[1]);
      if (v4)
      {
        if (objc_msgSend(v4, "count"))
        {
          v11 = v5;
          v12 = v4;
        }
        else
        {
          v12 = v4;
          v11 = v5;
          objc_msgSend(*(id *)(a1 + 24), "removeObjectForKey:", a2[4]);
        }
      }
      else
      {
        v12 = 0;
        v11 = v5;
      }
    }
    else
    {
      v10 = 0;
      v11 = 0;
      v12 = 0;
    }

    if (a2)
      v13 = a2[5];
    else
      v13 = 0;
    v14 = (id)objc_msgSend(*(id *)(a1 + 24), "objectForKey:", v13);
    v15 = v14;
    if (a2)
      v16 = a2[1];
    else
      v16 = 0;
    v17 = (id)objc_msgSend(v14, "objectForKey:", v16);
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v18 = (id)objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
    if (v18)
    {
      v19 = *(_QWORD *)v25;
      while (2)
      {
        for (j = 0; j != v18; j = (char *)j + 1)
        {
          if (*(_QWORD *)v25 != v19)
            objc_enumerationMutation(v17);
          v21 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)j);
          if ((_QWORD *)objc_msgSend(v21, "nonretainedObjectValue") == a2)
          {
            v18 = v21;
            if (v18)
              objc_msgSend(v17, "removeObject:", v18);
            goto LABEL_39;
          }
        }
        v18 = (id)objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
        if (v18)
          continue;
        break;
      }
    }
LABEL_39:
    if (v17 && !objc_msgSend(v17, "count"))
    {
      if (a2)
        v22 = a2[1];
      else
        v22 = 0;
      objc_msgSend(v15, "removeObjectForKey:", v22);
    }
    if (v15 && !objc_msgSend(v15, "count"))
    {
      if (a2)
        v23 = a2[5];
      else
        v23 = 0;
      objc_msgSend(*(id *)(a1 + 24), "removeObjectForKey:", v23);
    }
    objc_msgSend(*(id *)(a1 + 32), "unlock");

  }
}

+ (void)ubiquitousExternalReferenceLocationForUUID:(void *)a3 inStore:
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  objc_opt_self();
  objc_opt_self();
  v5 = _sharedSwitchboard;
  if (_sharedSwitchboard
    && (v6 = objc_msgSend((id)objc_msgSend(a3, "options"), "objectForKey:", CFSTR("NSPersistentStoreUbiquitousContentNameKey"))) != 0)
  {
    v7 = v6;
    objc_msgSend(*(id *)(v5 + 32), "lock");
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithDictionary:copyItems:", objc_msgSend(*(id *)(v5 + 8), "objectForKey:", v7), 0);
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v9)
    {
      v10 = 0;
      v11 = *(_QWORD *)v21;
LABEL_5:
      v12 = 0;
      while (1)
      {
        if (*(_QWORD *)v21 != v11)
          objc_enumerationMutation(v8);
        v13 = objc_msgSend(v8, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v12));
        v14 = v13;
        if (!v10)
          v10 = v13;
        if (v13 && (v15 = *(_QWORD *)(v13 + 88)) != 0)
          v16 = *(void **)(v15 + 48);
        else
          v16 = 0;
        if ((objc_msgSend(v16, "containsObject:", a3) & 1) != 0)
          break;
        if (v9 == ++v12)
        {
          v17 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
          v9 = v17;
          if (!v17)
          {
            v14 = v10;
            break;
          }
          goto LABEL_5;
        }
      }
    }
    else
    {
      v14 = 0;
    }
    objc_msgSend(*(id *)(v5 + 32), "unlock");

    if (v14)
      v18 = *(void **)(v14 + 32);
    else
      v18 = 0;
  }
  else
  {
    v18 = 0;
  }
  return +[PFUbiquityLocation createUbiquityExternalDataReferenceFileLocationForUUID:andStore:withUbiquityRootLocation:]((uint64_t)PFUbiquityLocation, a2, a3, v18);
}

@end
