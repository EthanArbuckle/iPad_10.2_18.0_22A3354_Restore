@implementation PFUbiquitySwitchboardEntry

- (PFUbiquitySwitchboardEntry)init
{
  return 0;
}

- (PFUbiquitySwitchboardEntry)initWithLocalPeerID:(id)a3 storeName:(id)a4 withURL:(id)a5 ubiquityRootLocation:(id)a6 andLocalRootLocation:(id)a7
{
  id v12;
  id v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)PFUbiquitySwitchboardEntry;
  v12 = -[PFUbiquitySwitchboardEntry init](&v15, sel_init);
  if (v12)
  {
    *((_QWORD *)v12 + 1) = a3;
    *((_QWORD *)v12 + 2) = a4;
    *((_QWORD *)v12 + 3) = objc_msgSend(a5, "copy");
    v13 = a7;
    *((_QWORD *)v12 + 4) = 0;
    *((_QWORD *)v12 + 5) = v13;
    *((_QWORD *)v12 + 8) = 0;
    *((_QWORD *)v12 + 9) = 0;
    *((_QWORD *)v12 + 10) = objc_alloc_init(MEMORY[0x1E0C99E08]);
    *((_QWORD *)v12 + 11) = 0;
    *((_QWORD *)v12 + 14) = dispatch_queue_create("com.apple.coredata.ubiquity.entry.pq", 0);
    *((_QWORD *)v12 + 7) = -[PFUbiquityFilePresenter initWithUbiquityRootLocation:localPeerID:storeName:processingQueue:]([PFUbiquityFilePresenter alloc], "initWithUbiquityRootLocation:localPeerID:storeName:processingQueue:", *((_QWORD *)v12 + 5), a3, *((_QWORD *)v12 + 2), *((_QWORD *)v12 + 14));
    *((_WORD *)v12 + 48) = 0;
    *((_QWORD *)v12 + 13) = 0;
    objc_opt_self();
    -[PFUbiquitySwitchboard _addFilePresenter:](_sharedSwitchboard, *((_QWORD *)v12 + 7));
    -[PFUbiquitySwitchboardEntry setUbiquityRootLocation:]((uint64_t)v12, a6);
  }
  return (PFUbiquitySwitchboardEntry *)v12;
}

- (void)setUbiquityRootLocation:(uint64_t)a1
{
  uint64_t v4;
  id v5;

  if (a1 && *(void **)(a1 + 32) != a2)
  {
    if (*(_QWORD *)(a1 + 48))
    {
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "removeObserver:name:object:", a1, CFSTR("PFUbiquityFilePresenterBaselineFileChangedNotification"), *(_QWORD *)(a1 + 48));
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "removeObserver:name:object:", a1, CFSTR("PFUbiquityFilePresenterDiscoveredLogLocationsNotification"), *(_QWORD *)(a1 + 48));
      objc_opt_self();
      -[PFUbiquitySwitchboard _removeFilePresenter:](_sharedSwitchboard, *(_QWORD **)(a1 + 48));

      *(_QWORD *)(a1 + 48) = 0;
    }
    v4 = *(_QWORD *)(a1 + 64);
    if (v4)
    {
      -[PFUbiquityContainerMonitor stopMonitor](v4);

      *(_QWORD *)(a1 + 64) = 0;
    }

    v5 = a2;
    *(_QWORD *)(a1 + 32) = v5;
    if (v5)
    {
      *(_QWORD *)(a1 + 48) = -[PFUbiquityFilePresenter initWithUbiquityRootLocation:localPeerID:storeName:processingQueue:]([PFUbiquityFilePresenter alloc], "initWithUbiquityRootLocation:localPeerID:storeName:processingQueue:", a2, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 112));
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "addObserver:selector:name:object:", a1, sel_filePresenterWasNotifiedTransactionLogs_, CFSTR("PFUbiquityFilePresenterDiscoveredLogLocationsNotification"), *(_QWORD *)(a1 + 48));
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "addObserver:selector:name:object:", a1, sel_filePresenterNoticedBaselineFileChange_, CFSTR("PFUbiquityFilePresenterBaselineFileChangedNotification"), *(_QWORD *)(a1 + 48));
      objc_opt_self();
      -[PFUbiquitySwitchboard _addFilePresenter:](_sharedSwitchboard, *(_QWORD *)(a1 + 48));
      *(_QWORD *)(a1 + 64) = -[PFUbiquityContainerMonitor initWithProcessingQueue:localPeerID:storeName:andUbiquityRootLocation:]([PFUbiquityContainerMonitor alloc], "initWithProcessingQueue:localPeerID:storeName:andUbiquityRootLocation:", *(_QWORD *)(a1 + 112), *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 32));
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "addObserver:selector:name:object:", a1, sel_containerIdentifierChanged_, CFSTR("PFUbiquityContainerMonitorDidChangeContainerIdentifierNotification"), *(_QWORD *)(a1 + 64));
    }
    -[PFUbiquitySwitchboardEntryMetadata setUbiquityRootLocation:](*(_QWORD *)(a1 + 88), a2);
  }
}

- (void)dealloc
{
  SEL v3;
  objc_super v4;

  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "removeObserver:", self);
  objc_opt_self();
  -[PFUbiquitySwitchboard removeEntryFromPreviousEntries:](_sharedSwitchboard, self);
  if (self->_fp)
  {
    objc_opt_self();
    -[PFUbiquitySwitchboard _removeFilePresenter:](_sharedSwitchboard, &self->_fp->super.isa);
  }
  if (self->_localFP)
  {
    objc_opt_self();
    -[PFUbiquitySwitchboard _removeFilePresenter:](_sharedSwitchboard, &self->_localFP->super.isa);
  }
  dispatch_release((dispatch_object_t)self->_privateQueue);

  self->_fp = 0;
  self->_localFP = 0;

  self->_registeredCoordinators = 0;
  self->_localPeerID = 0;

  self->_storeName = 0;
  self->_storeURL = 0;

  self->_ubiquityRootLocation = 0;
  self->_localRootLocation = 0;
  objc_setProperty_nonatomic(self, v3, 0, 88);

  self->_monitor = 0;
  self->_finishingSetupAssistant = 0;
  v4.receiver = self;
  v4.super_class = (Class)PFUbiquitySwitchboardEntry;
  -[PFUbiquitySwitchboardEntry dealloc](&v4, sel_dealloc);
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PFUbiquitySwitchboardEntry;
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: \n\tlocalPeerID: %@\n\tubiquityRootURL: %@\n\tregisteredCoordinators: %@\n"), -[PFUbiquitySwitchboardEntry description](&v3, sel_description), self->_localPeerID, self->_ubiquityRootLocation, self->_registeredCoordinators);
}

- (void)registerPersistentStore:(uint64_t)a3 withStoreName:
{
  uint64_t v6;
  id v7;
  _PFWeakReference *v8;
  uint64_t v9;
  PFUbiquitySwitchboardEntryMetadata *v10;
  SEL v11;
  NSPersistentStoreCoordinator *v12;
  id *v13;
  uint64_t v14;
  PFUbiquitySwitchboardCacheWrapper *v15;
  SEL v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  if (a1)
  {
    v6 = objc_msgSend(a2, "persistentStoreCoordinator");
    v7 = (id)objc_msgSend(*(id *)(a1 + 80), "valueForKey:", a3);
    if (!v7)
    {
      v7 = objc_alloc_init(MEMORY[0x1E0C99E20]);
      objc_msgSend(*(id *)(a1 + 80), "setObject:forKey:");
    }
    objc_msgSend(MEMORY[0x1E0CB3600], "addFilePresenter:", a2);
    v8 = -[_PFWeakReference initWithObject:]([_PFWeakReference alloc], "initWithObject:", v6);
    if ((objc_msgSend(v7, "containsObject:", v8) & 1) != 0)
      goto LABEL_22;
    objc_msgSend(v7, "addObject:", v8);
    v9 = *(_QWORD *)(a1 + 88);
    if (!v9
      && (v10 = -[PFUbiquitySwitchboardEntryMetadata initWithLocalPeerID:ubiquityRootLocation:localRootLocation:storeName:andPrivateQueue:]([PFUbiquitySwitchboardEntryMetadata alloc], "initWithLocalPeerID:ubiquityRootLocation:localRootLocation:storeName:andPrivateQueue:", *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 112)), objc_setProperty_nonatomic((id)a1, v11, v10, 88), v10, (v9 = *(_QWORD *)(a1 + 88)) == 0)|| (*(id *)(v9 + 40), *(_QWORD *)(v9 + 40) = +[PFUbiquityLocation createVersionHashStringForModel:]((uint64_t)PFUbiquityLocation, (void *)objc_msgSend((id)objc_msgSend(a2, "persistentStoreCoordinator"), "managedObjectModel")), objc_msgSend(*(id *)(v9 + 48), "addObject:", a2), *(_BYTE *)(v9 + 105)))
    {
LABEL_20:
      v18 = *(_QWORD *)(a1 + 64);
      ++*(_QWORD *)(a1 + 72);
      if (!v18)
      {
        *(_QWORD *)(a1 + 64) = -[PFUbiquityContainerMonitor initWithProcessingQueue:localPeerID:storeName:andUbiquityRootLocation:]([PFUbiquityContainerMonitor alloc], "initWithProcessingQueue:localPeerID:storeName:andUbiquityRootLocation:", *(_QWORD *)(a1 + 112), *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 32));
        objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "addObserver:selector:name:object:", a1, sel_containerIdentifierChanged_, CFSTR("PFUbiquityContainerMonitorDidChangeContainerIdentifierNotification"), *(_QWORD *)(a1 + 64));
      }
LABEL_22:

      return;
    }
    if (*(_QWORD *)(v9 + 72))
    {
LABEL_17:
      v17 = *(_QWORD *)(v9 + 80);
      if (v17)
        -[_PFUbiquityRecordsExporter beginWatchingForChangesFromStore:](v17, (uint64_t)a2);
      else
        *(_QWORD *)(v9 + 80) = -[_PFUbiquityRecordsExporter initWithLocalPeerID:forStoreName:ubiquityRootLocation:localRootLocation:andProcessingQueue:]([_PFUbiquityRecordsExporter alloc], *(void **)(v9 + 8), *(void **)(v9 + 16), *(void **)(v9 + 24), *(void **)(v9 + 32), *(NSObject **)(v9 + 112));
      goto LABEL_20;
    }
    v19 = 0;
    v12 = +[_PFUbiquityRecordsImporter createPrivateCoordinatorAndStoreForStore:atURL:error:]((uint64_t)_PFUbiquityRecordsImporter, a2, 0, &v19);
    *(_QWORD *)(v9 + 56) = v12;
    v13 = (id *)(v9 + 56);
    if (v12)
    {
      v14 = -[NSArray lastObject](-[NSPersistentStoreCoordinator persistentStores](v12, "persistentStores"), "lastObject");
      *(_QWORD *)(v9 + 64) = v14;
      if (v14)
      {
LABEL_11:
        *(_QWORD *)(v9 + 72) = -[_PFUbiquityRecordsImporter initWithLocalPeerID:ubiquityRootLocation:storeName:andPrivateStore:]([_PFUbiquityRecordsImporter alloc], *(_QWORD *)(v9 + 8), *(_QWORD *)(v9 + 24), *(void **)(v9 + 16), *(void **)(v9 + 64));
LABEL_16:
        v15 = -[PFUbiquitySwitchboardCacheWrapper initWithStoreName:privateStore:forLocalPeerID:andUbiquityRootLocation:]([PFUbiquitySwitchboardCacheWrapper alloc], "initWithStoreName:privateStore:forLocalPeerID:andUbiquityRootLocation:", *(_QWORD *)(v9 + 16), *(_QWORD *)(v9 + 64), *(_QWORD *)(v9 + 8), *(_QWORD *)(v9 + 24));
        objc_setProperty_nonatomic((id)v9, v16, v15, 88);

        goto LABEL_17;
      }
    }
    else if (*(_QWORD *)(v9 + 64))
    {
      goto LABEL_11;
    }
    if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 0))
      NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Error while trying to create the import coordinator: %@"), "-[PFUbiquitySwitchboardEntryMetadata addPersistentStore:]", 856, v19);

    *v13 = 0;
    *(_QWORD *)(v9 + 64) = 0;
    goto LABEL_16;
  }
}

- (uint64_t)unregisterPersistentStoreCoordinator:(uint64_t)result
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v3 = result;
    v10 = 0u;
    v11 = 0u;
    v8 = 0u;
    v9 = 0u;
    v4 = (void *)objc_msgSend(a2, "persistentStores", 0);
    result = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    if (result)
    {
      v5 = result;
      v6 = *(_QWORD *)v9;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v9 != v6)
            objc_enumerationMutation(v4);
          -[PFUbiquitySwitchboardEntry unregisterPersistentStore:inCoordinator:](v3, *(void **)(*((_QWORD *)&v8 + 1) + 8 * v7++), (uint64_t)a2);
        }
        while (v5 != v7);
        result = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
        v5 = result;
      }
      while (result);
    }
  }
  return result;
}

- (void)unregisterPersistentStore:(uint64_t)a3 inCoordinator:
{
  uint64_t v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  uint64_t v12;
  NSObject *global_queue;
  _QWORD block[5];
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v6 = objc_msgSend((id)objc_msgSend(a2, "options"), "objectForKey:", CFSTR("NSPersistentStoreUbiquitousContentNameKey"));
    if (v6)
    {
      v7 = (id)objc_msgSend(*(id *)(a1 + 80), "objectForKey:", v6);
      v17 = 0u;
      v18 = 0u;
      v15 = 0u;
      v16 = 0u;
      v8 = (id)objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v8)
      {
        v9 = *(_QWORD *)v16;
        while (2)
        {
          for (i = 0; i != v8; i = (char *)i + 1)
          {
            if (*(_QWORD *)v16 != v9)
              objc_enumerationMutation(v7);
            v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
            if (objc_msgSend(v11, "hash") == a3)
            {
              v8 = v11;
              if (v8)
              {
                objc_msgSend(v7, "removeObject:", v8);
                objc_msgSend(MEMORY[0x1E0CB3600], "removeFilePresenter:", a2);
                v12 = *(_QWORD *)(a1 + 88);
                if (v12)
                {
                  objc_msgSend(MEMORY[0x1E0CB3600], "removeFilePresenter:", a2);
                  objc_msgSend(*(id *)(v12 + 48), "removeObject:", a2);
                  if (!objc_msgSend(*(id *)(v12 + 48), "count"))
                    -[PFUbiquitySwitchboardEntryMetadata tearDown]((uint64_t *)v12);
                }
                --*(_QWORD *)(a1 + 72);
                if (!objc_msgSend(v7, "count"))
                {
                  if (*(_QWORD *)(a1 + 32))
                  {
                    global_queue = dispatch_get_global_queue(0, 0);
                    block[0] = MEMORY[0x1E0C809B0];
                    block[1] = 3221225472;
                    block[2] = __70__PFUbiquitySwitchboardEntry_unregisterPersistentStore_inCoordinator___block_invoke;
                    block[3] = &unk_1E1EDD520;
                    block[4] = a1;
                    dispatch_async(global_queue, block);
                  }
                }
              }
              goto LABEL_20;
            }
          }
          v8 = (id)objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
          if (v8)
            continue;
          break;
        }
      }
    }
    else
    {
      v7 = 0;
      v8 = 0;
    }
LABEL_20:

  }
}

uint64_t __70__PFUbiquitySwitchboardEntry_unregisterPersistentStore_inCoordinator___block_invoke(uint64_t a1)
{
  id v2;

  v2 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
  objc_opt_self();
  -[PFUbiquityMetadataFactory removeCachedCoordinatorsForLocalPeerID:storeName:andUbiquityRootLocation:]((id *)_sharedFactory, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32));
  return objc_msgSend(v2, "drain");
}

- (id)createSetOfPersistentStoreCoordinatorsRegisteredForStoreName:(uint64_t)a1
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id Weak;
  id v12;
  uint64_t v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v4 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v5 = (void *)objc_msgSend(*(id *)(a1 + 80), "objectForKey:", a2);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v9);
        if (v10)
          Weak = objc_loadWeak((id *)(v10 + 8));
        else
          Weak = 0;
        v12 = Weak;
        if (v12)
          objc_msgSend(v4, "addObject:", v12);

        ++v9;
      }
      while (v7 != v9);
      v13 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      v7 = v13;
    }
    while (v13);
  }
  return v4;
}

- (uint64_t)createSetOfActiveStoreNames
{
  if (result)
    return objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", objc_msgSend(*(id *)(result + 80), "allKeys"));
  return result;
}

- (void)entryWillBeRemovedFromSwitchboard
{
  uint64_t v2;
  uint64_t *v3;
  SEL v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "removeObserver:", a1);
    -[PFUbiquityContainerMonitor stopMonitor](*(_QWORD *)(a1 + 64));
    v2 = *(_QWORD *)(a1 + 104);
    if (v2)
    {
      *(_BYTE *)(v2 + 313) = 1;
      -[PFUbiquitySwitchboardEntry setupFinished](a1);
    }
    v3 = (uint64_t *)*(id *)(a1 + 88);
    objc_setProperty_nonatomic((id)a1, v4, 0, 88);
    -[PFUbiquitySwitchboardEntryMetadata tearDown](v3);
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    if (v3)
      v5 = (void *)v3[6];
    else
      v5 = 0;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v11;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v11 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(MEMORY[0x1E0CB3600], "removeFilePresenter:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i), (_QWORD)v10);
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v7);
    }

  }
}

- (void)setupFinished
{
  os_unfair_lock_s *v2;
  id v3;

  if (a1)
  {
    v2 = (os_unfair_lock_s *)(a1 + 100);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 100));
    *(_WORD *)(a1 + 96) = 1;
    v3 = *(id *)(a1 + 104);
    *(_QWORD *)(a1 + 104) = 0;
    os_unfair_lock_unlock(v2);

  }
}

- (void)filePresenterWasNotifiedTransactionLogs:(id)a3
{
  PFUbiquitySwitchboardEntry *v5;
  id v6;
  PFUbiquitySwitchboardEntryMetadata *metadata;
  void *v8;
  PFUbiquitySwitchboardEntryMetadata *v9;
  PFUbiquitySwitchboardEntryMetadata *v10;
  _PFUbiquityRecordsImporter *importer;
  _PFUbiquityRecordsImporter *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  OS_dispatch_queue *privateQueue;
  PFUbiquityContainerMonitor *monitor;
  uint64_t v21;
  PFUbiquitySwitchboardEntryMetadata *v22;
  void *v23;
  id v24;
  uint64_t v25;
  void *v26;
  id v27;
  uint64_t ubiquityRootLocation;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  uint64_t i;
  uint64_t v34;
  void *v35;
  void *v36;
  id obj;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint64_t v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v5 = self;
  v6 = (id)objc_msgSend((id)objc_msgSend(a3, "userInfo"), "objectForKey:", CFSTR("PFLogLocationsKey"));
  if (self)
    metadata = self->_metadata;
  else
    metadata = 0;
  v8 = v6;
  v9 = metadata;
  v10 = v9;
  if (v9)
  {
    importer = v9->_importer;
    if (importer)
      importer = (_PFUbiquityRecordsImporter *)importer->_schedulingContext;
  }
  else
  {
    importer = 0;
  }
  v12 = importer;
  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  v13 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
  if (v13)
  {
    v14 = *(_QWORD *)v44;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v44 != v14)
          objc_enumerationMutation(v8);
        v16 = *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * v15);
        if (v16)
          v17 = *(void **)(v16 + 40);
        else
          v17 = 0;
        if (objc_msgSend(v17, "isEqualToString:", self->_storeName))
          -[PFUbiquityRecordsImporterSchedulingContext addPendingLogLocation:]((uint64_t)v12, v16);
        ++v15;
      }
      while (v13 != v15);
      v18 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
      v13 = v18;
    }
    while (v18);
  }
  v42 = 0;
  if (v12)
    privateQueue = v12->_privateQueue;
  else
    privateQueue = 0;
  if (!-[OS_dispatch_queue count](privateQueue, "count"))
    goto LABEL_50;
  monitor = self->_monitor;
  if (!monitor || monitor->_containerState != 1 || monitor->_monitorState != 1)
    goto LABEL_50;
  if (v10)
    v21 = (uint64_t)v10->_importer;
  else
    v21 = 0;
  if (!-[_PFUbiquityRecordsImporter schedulePendingLogs:error:](v21, 0, &v42))
  {
    if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 0))
    {
      v36 = 0;
      NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@\nScheduling encountered an error: %@"), "-[PFUbiquitySwitchboardEntry filePresenterWasNotifiedTransactionLogs:]", 359, self, v42);
      v29 = 0;
      goto LABEL_51;
    }
LABEL_50:
    v36 = 0;
    v29 = 0;
    goto LABEL_51;
  }
  if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 3))
  {
    v22 = self->_metadata;
    if (v22)
      v22 = (PFUbiquitySwitchboardEntryMetadata *)v22->_importer;
    NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@\nScheduled logs for importer: %@\n"), "-[PFUbiquitySwitchboardEntry filePresenterWasNotifiedTransactionLogs:]", 342, self, v22);
  }
  if (v12)
    v23 = *(void **)&v12->_isMonitoring;
  else
    v23 = 0;
  if (!objc_msgSend(v23, "count"))
    goto LABEL_50;
  v24 = objc_alloc(MEMORY[0x1E0C99E60]);
  if (v12)
    v25 = *(_QWORD *)&v12->_isMonitoring;
  else
    v25 = 0;
  v26 = (void *)objc_msgSend(v24, "initWithSet:copyItems:", v25, 0);
  v27 = objc_alloc(MEMORY[0x1E0C99D80]);
  if (v12)
    ubiquityRootLocation = (uint64_t)v12->_ubiquityRootLocation;
  else
    ubiquityRootLocation = 0;
  v29 = (void *)objc_msgSend(v27, "initWithDictionary:copyItems:", ubiquityRootLocation, 0);
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  obj = v26;
  v30 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v38, v47, 16);
  if (v30)
  {
    v31 = v29;
    v32 = *(_QWORD *)v39;
    while (2)
    {
      for (i = 0; i != v30; ++i)
      {
        if (*(_QWORD *)v39 != v32)
          objc_enumerationMutation(obj);
        v34 = *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * i);
        v35 = (void *)objc_msgSend(v31, "objectForKey:", v34);
        if (objc_msgSend(v35, "code") != 134320)
        {
          v29 = v31;
          if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 0))
            NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Unable to import transaction log: %@\n%@\n%@"), "-[PFUbiquitySwitchboardEntry filePresenterWasNotifiedTransactionLogs:]", 353, v34, v35, objc_msgSend(v35, "userInfo"));
          goto LABEL_54;
        }
      }
      v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v47, 16);
      if (v30)
        continue;
      break;
    }
    v29 = v31;
  }
LABEL_54:
  v36 = obj;
LABEL_51:

}

void __70__PFUbiquitySwitchboardEntry_filePresenterWasNotifiedTransactionLogs___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  NSSaveChangesRequest *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2 && (v3 = *(_QWORD *)(v2 + 88)) != 0)
    v4 = *(void **)(v3 + 64);
  else
    v4 = 0;
  v12 = (id)objc_msgSend((id)objc_msgSend(v4, "metadata"), "mutableCopy");
  objc_msgSend(v12, "setObject:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("PFUbiquitySetupCheckForFork"));
  v5 = *(_QWORD *)(a1 + 32);
  if (v5 && (v6 = *(_QWORD *)(v5 + 88)) != 0)
    v7 = *(void **)(v6 + 64);
  else
    v7 = 0;
  objc_msgSend(v7, "setMetadata:", v12);
  v8 = objc_alloc_init(NSSaveChangesRequest);
  v9 = *(_QWORD *)(a1 + 32);
  if (v9 && (v10 = *(_QWORD *)(v9 + 88)) != 0)
    v11 = *(void **)(v10 + 64);
  else
    v11 = 0;
  objc_msgSend(v11, "executeRequest:withContext:error:", v8, 0, 0);

}

void __70__PFUbiquitySwitchboardEntry_filePresenterWasNotifiedTransactionLogs___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  NSSaveChangesRequest *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2 && (v3 = *(_QWORD *)(v2 + 88)) != 0)
    v4 = *(void **)(v3 + 64);
  else
    v4 = 0;
  v12 = (id)objc_msgSend((id)objc_msgSend(v4, "metadata"), "mutableCopy");
  objc_msgSend(v12, "setObject:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("PFUbiquitySetupDoFork"));
  v5 = *(_QWORD *)(a1 + 32);
  if (v5 && (v6 = *(_QWORD *)(v5 + 88)) != 0)
    v7 = *(void **)(v6 + 64);
  else
    v7 = 0;
  objc_msgSend(v7, "setMetadata:", v12);
  v8 = objc_alloc_init(NSSaveChangesRequest);
  v9 = *(_QWORD *)(a1 + 32);
  if (v9 && (v10 = *(_QWORD *)(v9 + 88)) != 0)
    v11 = *(void **)(v10 + 64);
  else
    v11 = 0;
  objc_msgSend(v11, "executeRequest:withContext:error:", v8, 0, 0);

}

- (void)filePresenterNoticedBaselineFileChange:(id)a3
{
  uint64_t v4;
  PFUbiquitySwitchboardEntryMetadata *metadata;
  void *v6;
  int v7;
  PFUbiquitySwitchboardEntryMetadata *v8;
  PFUbiquitySwitchboardEntryMetadata *v9;

  v4 = objc_msgSend((id)objc_msgSend(a3, "userInfo"), "objectForKey:", CFSTR("PFBaselineLocationKey"));
  if (self)
    metadata = self->_metadata;
  else
    metadata = 0;
  v9 = metadata;
  if (v4)
    v6 = *(void **)(v4 + 40);
  else
    v6 = 0;
  v7 = objc_msgSend(v6, "isEqualToString:", self->_storeName);
  v8 = v9;
  if (v7 && v9)
  {
    -[_PFUbiquityRecordsImporter scheduleBaselineRollResponseOperationForBaselineAtLocation:]((uint64_t)v9->_importer, v4);
    v8 = v9;
  }

}

- (void)containerIdentifierChanged:(id)a3
{
  PFUbiquitySwitchboardEntry *v5;
  PFUbiquitySwitchboardEntryMetadata *metadata;
  PFUbiquitySwitchboardCacheWrapper *cacheWrapper;
  uint64_t transactionHistoryCache;
  PFUbiquitySwitchboardCacheWrapper *v9;
  uint64_t transactionLogCache;
  id v11;
  NSMutableSet *stores;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  NSURL *v21;
  NSMutableSet *v22;
  id v23;
  uint64_t v24;
  id v25;
  void *v26;
  NSPersistentStoreCoordinator *v27;
  void *v28;
  void *v29;
  PFUbiquityContainerMonitor *monitor;
  NSObject *currentIdentityToken;
  void *v32;
  PFUbiquityContainerMonitor *v33;
  PFUbiquityContainerIdentifier *containerIdentifier;
  uint64_t uuidString;
  uint64_t v36;
  uint64_t v37;
  uint64_t j;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  id v42;
  uint64_t v43;
  _QWORD *v44;
  _QWORD *v45;
  uint64_t v46;
  void *v47;
  id v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t k;
  id v54;
  NSURL *v55;
  void *v56;
  id v57;
  NSPersistentStoreCoordinator *v58;
  id v59;
  PFUbiquitySwitchboardEntryMetadata *v60;
  uint64_t v61;
  id v62;
  PFUbiquitySwitchboardEntry *v63;
  uint64_t v64;
  void *v65;
  uint64_t v66;
  NSURL *v67;
  id obj;
  id v69;
  _QWORD v70[2];
  void (*v71)(uint64_t);
  void *v72;
  id v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  _QWORD block[2];
  void (*v79)(uint64_t);
  void *v80;
  id v81;
  void *v82;
  _QWORD v83[11];
  uint64_t v84;
  uint64_t *v85;
  uint64_t v86;
  void (*v87)(uint64_t, uint64_t);
  void (*v88)(uint64_t);
  uint64_t v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  _QWORD v94[2];
  void (*v95)(_QWORD *);
  void *v96;
  id v97;
  uint64_t v98;
  uint64_t *v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  uint64_t v104;
  uint64_t *v105;
  uint64_t v106;
  void (*v107)(uint64_t, uint64_t);
  void (*v108)(uint64_t);
  id v109;
  uint64_t v110;
  _BYTE v111[128];
  uint64_t v112;
  uint64_t v113;
  _QWORD v114[2];
  _QWORD v115[2];
  uint64_t v116;
  uint64_t v117;
  _QWORD v118[3];
  _QWORD v119[3];
  _BYTE v120[128];
  _BYTE v121[128];
  uint64_t v122;

  v122 = *MEMORY[0x1E0C80C00];
  v110 = 0;
  v57 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
  v64 = objc_msgSend((id)objc_msgSend(a3, "userInfo"), "objectForKey:");
  v104 = 0;
  v105 = &v104;
  v106 = 0x3052000000;
  v107 = __Block_byref_object_copy__43;
  v108 = __Block_byref_object_dispose__43;
  v109 = 0;
  v109 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v5 = self;
  v63 = self;
  if (self)
    metadata = self->_metadata;
  else
    metadata = 0;
  v60 = metadata;
  -[PFUbiquitySwitchboardEntryMetadata setUseLocalStorage:]((uint64_t)v60, 1u);
  if (v60 && (cacheWrapper = v60->_cacheWrapper) != 0)
    transactionHistoryCache = (uint64_t)cacheWrapper->_transactionHistoryCache;
  else
    transactionHistoryCache = 0;
  if (!-[PFUbiquityTransactionHistoryCache purgeCacheAndWritePendingEntries:error:](transactionHistoryCache, 0)
    && +[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 0))
  {
    NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Error purging transaction history cache after account change: %@"), "-[PFUbiquitySwitchboardEntry containerIdentifierChanged:]", 465, v110);
  }
  if (v60 && (v9 = v60->_cacheWrapper) != 0)
    transactionLogCache = (uint64_t)v9->_transactionLogCache;
  else
    transactionLogCache = 0;
  -[PFUbiquityTransactionLogCache removeLogsCachedForStoreNamed:withUbiquityRootLocation:](transactionLogCache, (uint64_t)self->_storeName, (uint64_t)self->_ubiquityRootLocation);
  v69 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v11 = objc_alloc(MEMORY[0x1E0C99E60]);
  if (v60)
    stores = v60->_stores;
  else
    stores = 0;
  v102 = 0u;
  v103 = 0u;
  v100 = 0u;
  v101 = 0u;
  obj = (id)objc_msgSend(v11, "initWithSet:copyItems:", stores, 0);
  v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v100, v121, 16);
  if (!v13)
    goto LABEL_26;
  v66 = 0;
  v14 = 0;
  v15 = *(_QWORD *)v101;
  do
  {
    for (i = 0; i != v13; ++i)
    {
      if (*(_QWORD *)v101 != v15)
        objc_enumerationMutation(obj);
      v17 = *(void **)(*((_QWORD *)&v100 + 1) + 8 * i);
      v18 = objc_msgSend(v17, "persistentStoreCoordinator");
      if (v18)
      {
        v19 = objc_msgSend((id)objc_msgSend(v17, "metadata"), "objectForKey:", CFSTR("PFUbiquitySetupOriginalStoreURLAbsoluteStringKey"));
        if (v19)
        {
          v20 = v17;
          v66 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initWithString:", v19);
          v14 = v20;
        }
        objc_msgSend(v69, "addObject:", v18);
      }
    }
    v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v100, v121, 16);
  }
  while (v13);
  v21 = (NSURL *)v66;
  if (!v14)
  {
LABEL_26:
    if (v60)
      v22 = v60->_stores;
    else
      v22 = 0;
    v23 = (id)-[NSMutableSet anyObject](v22, "anyObject");
    v21 = v63->_storeURL;
    v14 = v23;
  }
  v24 = objc_msgSend((id)objc_msgSend(v14, "identifier"), "copy");
  v59 = (id)objc_msgSend(v14, "persistentStoreCoordinator");
  v65 = (void *)v24;
  v67 = v21;
  v25 = (id)objc_msgSend(v14, "options");
  if (!v59)
  {
    v58 = 0;
    v59 = 0;
LABEL_68:
    v62 = 0;
    goto LABEL_69;
  }
  v26 = v25;
  v27 = -[NSPersistentStoreCoordinator initWithManagedObjectModel:]([NSPersistentStoreCoordinator alloc], "initWithManagedObjectModel:", objc_msgSend(v59, "managedObjectModel"));
  objc_opt_self();
  -[PFUbiquitySwitchboard _quietlyMoveEntryToPreviousEntries:]((id *)_sharedSwitchboard, v63);
  v58 = v27;
  if (objc_msgSend(v26, "objectForKey:", CFSTR("PFSetupLocalPeerIDOverride")))
  {
    v28 = (void *)objc_msgSend(v26, "mutableCopy");
    v29 = v28;
    monitor = v63->_monitor;
    if (monitor)
      currentIdentityToken = monitor->_currentIdentityToken;
    else
      currentIdentityToken = 0;
    objc_msgSend(v28, "setObject:forKey:", currentIdentityToken, CFSTR("NSUbiquityIdentityTokenOverrideKey"));

  }
  else
  {
    v29 = v26;
  }
  v32 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v29);
  objc_msgSend(v32, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1), CFSTR("PFUbiquitySetupSynchronousSideLoadKey"));
  v33 = v63->_monitor;
  if (v33)
  {
    containerIdentifier = v33->_containerIdentifier;
    if (containerIdentifier)
    {
      uuidString = (uint64_t)containerIdentifier->_uuidString;
      if (uuidString)
        +[PFUbiquitySetupAssistant setContainerIdentifierUUID:forIdentityToken:forStoreName:]((uint64_t)PFUbiquitySetupAssistant, uuidString, v33->_currentIdentityToken, (uint64_t)v63->_storeName);
    }
  }
  v61 = -[NSPersistentStoreCoordinator addPersistentStoreWithType:configuration:URL:options:error:](v58, "addPersistentStoreWithType:configuration:URL:options:error:", objc_msgSend(v14, "type"), objc_msgSend(v14, "configurationName"), v67, v32, &v110);
  if (!v61)
  {
    if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 0))
    {
      v62 = 0;
      NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Error loading new temporary coordinator after account change with options { %@ } and URL %@ and error = %@"), "-[PFUbiquitySwitchboardEntry containerIdentifierChanged:]", 526, v29, v67, v110);
      goto LABEL_69;
    }
    goto LABEL_68;
  }

  objc_opt_self();
  v62 = -[PFUbiquitySwitchboard retainedEntryForStoreName:andLocalPeerID:](_sharedSwitchboard, (uint64_t)v63->_storeName, (uint64_t)v63->_localPeerID);
  if (objc_msgSend(v69, "count"))
  {
    v94[0] = MEMORY[0x1E0C809B0];
    v94[1] = 3221225472;
    v95 = (void (*)(_QWORD *))__57__PFUbiquitySwitchboardEntry_containerIdentifierChanged___block_invoke;
    v96 = &unk_1E1EDD138;
    v97 = obj;
    v98 = v64;
    v99 = &v104;
    if (pthread_main_np()
      || (objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3898], "processInfo"), "processName"), "isEqualToString:", CFSTR("kbd")) & 1) != 0|| objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3898], "processInfo"), "processName"), "isEqualToString:", CFSTR("keyboardservicesd")))
    {
      v95(v94);
    }
    else
    {
      dispatch_sync(MEMORY[0x1E0C80D38], v94);
    }
    v92 = 0u;
    v93 = 0u;
    v90 = 0u;
    v91 = 0u;
    v36 = objc_msgSend(v69, "countByEnumeratingWithState:objects:count:", &v90, v120, 16);
    if (v36)
    {
      v37 = *(_QWORD *)v91;
      do
      {
        for (j = 0; j != v36; ++j)
        {
          if (*(_QWORD *)v91 != v37)
            objc_enumerationMutation(v69);
          v39 = *(void **)(*((_QWORD *)&v90 + 1) + 8 * j);
          v40 = objc_msgSend(v39, "persistentStoreForIdentifier:", v65);
          v41 = v40;
          if (v40)
          {
            v84 = 0;
            v85 = &v84;
            v86 = 0x3052000000;
            v87 = __Block_byref_object_copy__43;
            v88 = __Block_byref_object_dispose__43;
            v89 = 0;
            v83[0] = MEMORY[0x1E0C809B0];
            v83[1] = 3221225472;
            v83[2] = __57__PFUbiquitySwitchboardEntry_containerIdentifierChanged___block_invoke_2;
            v83[3] = &unk_1E1EE1250;
            v83[4] = v40;
            v83[5] = v61;
            v83[6] = v110;
            v83[7] = v65;
            v83[8] = v62;
            v83[9] = v63;
            v83[10] = &v84;
            objc_msgSend(v39, "performBlockAndWait:", v83);
            v42 = (id)v85[5];
            if (v110 && v85[5])
              v110 = v85[5];
            if (v64)
            {
              v118[0] = CFSTR("added");
              v117 = v41;
              v119[0] = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v117, 1);
              v118[1] = CFSTR("removed");
              v116 = v41;
              v43 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v116, 1);
              v118[2] = CFSTR("NSPersistentStoreUbiquitousTransitionTypeKey");
              v44 = v118;
              v45 = v119;
              v46 = 3;
              v119[1] = v43;
              v119[2] = v64;
            }
            else
            {
              v114[0] = CFSTR("added");
              v113 = v41;
              v115[0] = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v113, 1);
              v114[1] = CFSTR("removed");
              v112 = v41;
              v115[1] = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v112, 1);
              v44 = v114;
              v45 = v115;
              v46 = 2;
            }
            v47 = (void *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v45, v44, v46);
            v48 = v39;
            objc_msgSend(v47, "copy");
            objc_msgSend((id)v105[5], "removeObject:", v39);
            block[0] = MEMORY[0x1E0C809B0];
            block[1] = 3221225472;
            v79 = __57__PFUbiquitySwitchboardEntry_containerIdentifierChanged___block_invoke_3;
            v80 = &unk_1E1EDD430;
            v81 = v48;
            v82 = v47;
            if ((objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3898], "processInfo"), "processName"), "isEqualToString:", CFSTR("kbd")) & 1) != 0|| objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3898], "processInfo"), "processName"), "isEqualToString:", CFSTR("keyboardservicesd")))
            {
              v79((uint64_t)block);
            }
            else
            {
              dispatch_async(MEMORY[0x1E0C80D38], block);
            }
            _Block_object_dispose(&v84, 8);
          }
        }
        v36 = objc_msgSend(v69, "countByEnumeratingWithState:objects:count:", &v90, v120, 16);
      }
      while (v36);
    }

    v58 = 0;
    obj = 0;
    v69 = 0;
  }
LABEL_69:
  if (v105[5])
  {
    v76 = 0u;
    v77 = 0u;
    v74 = 0u;
    v75 = 0u;
    v49 = (void *)v105[5];
    v50 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v74, v111, 16);
    if (v50)
    {
      v51 = *(_QWORD *)v75;
      v52 = MEMORY[0x1E0C809B0];
      do
      {
        for (k = 0; k != v50; ++k)
        {
          if (*(_QWORD *)v75 != v51)
            objc_enumerationMutation(v49);
          v54 = *(id *)(*((_QWORD *)&v74 + 1) + 8 * k);
          v70[0] = v52;
          v70[1] = 3221225472;
          v71 = __57__PFUbiquitySwitchboardEntry_containerIdentifierChanged___block_invoke_4;
          v72 = &unk_1E1EDD520;
          v73 = v54;
          if ((objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3898], "processInfo"), "processName"), "isEqualToString:", CFSTR("kbd")) & 1) != 0|| objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3898], "processInfo"), "processName"), "isEqualToString:", CFSTR("keyboardservicesd")))
          {
            v71((uint64_t)v70);
          }
          else
          {
            dispatch_async(MEMORY[0x1E0C80D38], v70);
          }
        }
        v50 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v74, v111, 16);
      }
      while (v50);
    }
    objc_msgSend((id)v105[5], "removeAllObjects");
    v55 = v67;
    v56 = (void *)v105[5];
  }
  else
  {
    v56 = 0;
    v55 = v67;
  }

  v105[5] = 0;
  objc_msgSend(v57, "drain");

  _Block_object_dispose(&v104, 8);
}

uint64_t __57__PFUbiquitySwitchboardEntry_containerIdentifierChanged___block_invoke(_QWORD *a1)
{
  uint64_t result;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  _QWORD *v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const __CFString *v17;
  id obj;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  void *v23;
  void *v24;
  _QWORD v25[2];
  _QWORD v26[2];
  void *v27;
  void *v28;
  _QWORD v29[3];
  _QWORD v30[3];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  obj = (id)a1[4];
  result = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v31, 16);
  if (result)
  {
    v3 = result;
    v4 = *(_QWORD *)v20;
    v17 = CFSTR("NSPersistentStoreUbiquitousTransitionTypeKey");
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v20 != v4)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v5);
        v7 = objc_msgSend(v6, "persistentStoreCoordinator", v17);
        if (v7)
        {
          v8 = v7;
          if (a1[5])
          {
            v28 = v6;
            v29[0] = CFSTR("added");
            v30[0] = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v28, 1);
            v29[1] = CFSTR("removed");
            v27 = v6;
            v9 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v27, 1);
            v29[2] = v17;
            v10 = a1[5];
            v30[1] = v9;
            v30[2] = v10;
            v11 = (void *)MEMORY[0x1E0C99D80];
            v12 = v30;
            v13 = v29;
            v14 = 3;
          }
          else
          {
            v24 = v6;
            v25[0] = CFSTR("added");
            v15 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v24, 1);
            v25[1] = CFSTR("removed");
            v26[0] = v15;
            v23 = v6;
            v26[1] = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v23, 1);
            v11 = (void *)MEMORY[0x1E0C99D80];
            v12 = v26;
            v13 = v25;
            v14 = 2;
          }
          v16 = objc_msgSend(v11, "dictionaryWithObjects:forKeys:count:", v12, v13, v14);
          objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "addObject:", v8);
          objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotificationName:object:userInfo:", CFSTR("NSPersistentStoreCoordinatorStoresWillChangeNotification"), v8, v16);
        }
        ++v5;
      }
      while (v3 != v5);
      result = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v31, 16);
      v3 = result;
    }
    while (result);
  }
  return result;
}

id __57__PFUbiquitySwitchboardEntry_containerIdentifierChanged___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setURL:", objc_msgSend(*(id *)(a1 + 40), "URL"));
  objc_msgSend(*(id *)(a1 + 32), "setReadOnly:", 0);
  if ((objc_msgSend(*(id *)(a1 + 32), "loadMetadata:", *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40) & 1) == 0
    && +[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 0))
  {
    NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Error loading new store metadata after account change: %@"), "-[PFUbiquitySwitchboardEntry containerIdentifierChanged:]_block_invoke_2", 571, *(_QWORD *)(a1 + 48));
  }
  if ((objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "identifier"), "isEqual:", *(_QWORD *)(a1 + 56)) & 1) == 0)
    -[NSPersistentStore _resetObjectIDFactoriesForStoreUUIDChange](*(void ****)(a1 + 32));
  -[PFUbiquitySwitchboardEntry registerPersistentStore:withStoreName:](*(_QWORD *)(a1 + 64), *(void **)(a1 + 32), *(_QWORD *)(*(_QWORD *)(a1 + 72) + 16));
  if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 2))
    NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@\nRegistered store: %@ with entry: %@"), "-[PFUbiquitySwitchboardEntry containerIdentifierChanged:]_block_invoke_2", 578, *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 64));
  return *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40);
}

void __57__PFUbiquitySwitchboardEntry_containerIdentifierChanged___block_invoke_3(uint64_t a1)
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotificationName:object:userInfo:", CFSTR("NSPersistentStoreCoordinatorStoresDidChangeNotification"), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __57__PFUbiquitySwitchboardEntry_containerIdentifierChanged___block_invoke_4(uint64_t a1)
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotificationName:object:userInfo:", CFSTR("NSPersistentStoreCoordinatorStoresDidChangeNotification"), *(_QWORD *)(a1 + 32), 0);

}

- (BOOL)finishSetupForStore:(_QWORD *)a3 withSetupAssistant:(int)a4 synchronously:(uint64_t *)a5 error:(uint64_t)a6 finishBlock:
{
  uint64_t v10;
  id Weak;
  uint64_t v12;
  int v13;
  char v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  NSObject *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  _BYTE buf[24];
  void *v42;
  uint64_t v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    if (!a2
      || (v10 = result, (Weak = objc_loadWeak((id *)(a2 + 8))) == 0)
      || (v12 = (uint64_t)Weak, !objc_msgSend(Weak, "persistentStoreCoordinator")))
    {
      v15 = objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134326, 0);
      if (v15)
      {
        if (a5)
        {
          v16 = v15;
          result = 0;
          *a5 = v16;
          return result;
        }
        return 0;
      }
      v17 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
      _NSCoreDataLog(17, v17, v18, v19, v20, v21, v22, v23, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/PFUbiquitySwitchboardEntry.m");
      v24 = __pflogFaultLog;
      result = os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT);
      if (!result)
        return result;
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/PFUbiquitySwitchboardEntry.m";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 667;
LABEL_14:
      _os_log_fault_impl(&dword_18A253000, v24, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
      return 0;
    }
    os_unfair_lock_lock((os_unfair_lock_t)(v10 + 100));
    v13 = *(unsigned __int8 *)(v10 + 98);
    if (!*(_BYTE *)(v10 + 98))
      *(_BYTE *)(v10 + 98) = 1;
    if (*(_BYTE *)(v10 + 97))
    {
      v14 = 1;
    }
    else
    {
      v14 = 1;
      if (!*(_BYTE *)(v10 + 96))
      {
        *(_BYTE *)(v10 + 97) = 1;
        v14 = 0;
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(v10 + 100));
    if (v13)
    {
      if ((v14 & 1) != 0)
        return 1;
LABEL_19:
      v25 = *(NSObject **)(v10 + 112);
      *(_QWORD *)buf = MEMORY[0x1E0C809B0];
      *(_QWORD *)&buf[8] = 3221225472;
      if (a4)
      {
        *(_QWORD *)&buf[16] = __70__PFUbiquitySwitchboardEntry_synchronouslyExecuteBlockOnPrivateQueue___block_invoke;
        v42 = &unk_1E1EDFF40;
        v43 = a6;
        dispatch_sync(v25, buf);
      }
      else
      {
        *(_QWORD *)&buf[16] = __57__PFUbiquitySwitchboardEntry_executeBlockOnPrivateQueue___block_invoke;
        v42 = &unk_1E1EDFF40;
        v43 = a6;
        dispatch_async(v25, buf);
      }
      return 1;
    }
    *(_QWORD *)(v10 + 104) = a3;
    -[PFUbiquitySwitchboardEntryMetadata setUseLocalStorage:](*(_QWORD *)(v10 + 88), 1u);
    v26 = *(_QWORD *)(v10 + 88);
    if (v26 && (v27 = *(_QWORD *)(v26 + 88)) != 0)
      v28 = *(_QWORD *)(v27 + 40);
    else
      v28 = 0;
    if (-[PFUbiquityPeerRangeCache cachePeerRanges:](v28))
    {
      if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 3))
        NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Beginning to watch for changes from: %@"), "-[PFUbiquitySwitchboardEntry finishSetupForStore:withSetupAssistant:synchronously:error:finishBlock:]", 690, v12);
      if (a3)
        v30 = (void *)a3[9];
      else
        v30 = 0;
      v31 = *(_QWORD *)(v10 + 88);
      if (v31
        && ((v32 = *(void **)(v31 + 88)) == 0
         || (objc_setProperty_atomic(v32, v29, v30, 64), (v31 = *(_QWORD *)(v10 + 88)) != 0)))
      {
        v33 = *(_QWORD *)(v31 + 80);
      }
      else
      {
        v33 = 0;
      }
      -[_PFUbiquityRecordsExporter beginWatchingForChangesFromStore:](v33, v12);
      if ((v14 & 1) != 0)
        return 1;
      goto LABEL_19;
    }
    v34 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
    _NSCoreDataLog(17, v34, v35, v36, v37, v38, v39, v40, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/PFUbiquitySwitchboardEntry.m");
    v24 = __pflogFaultLog;
    result = os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT);
    if (result)
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/PFUbiquitySwitchboardEntry.m";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 707;
      goto LABEL_14;
    }
  }
  return result;
}

- (void)executeBlockOnPrivateQueue:(uint64_t)a1
{
  NSObject *v2;
  _QWORD block[5];

  if (a1)
  {
    v2 = *(NSObject **)(a1 + 112);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __57__PFUbiquitySwitchboardEntry_executeBlockOnPrivateQueue___block_invoke;
    block[3] = &unk_1E1EDFF40;
    block[4] = a2;
    dispatch_async(v2, block);
  }
}

uint64_t __57__PFUbiquitySwitchboardEntry_executeBlockOnPrivateQueue___block_invoke(uint64_t a1)
{
  id v2;

  v2 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return objc_msgSend(v2, "drain");
}

- (void)afterDelay:(double)a3 executeBlockOnPrivateQueue:
{
  dispatch_time_t v5;
  NSObject *v6;
  _QWORD block[5];

  if (a1)
  {
    v5 = dispatch_time(0, 1000000000 * (uint64_t)a3);
    v6 = *(NSObject **)(a1 + 112);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __68__PFUbiquitySwitchboardEntry_afterDelay_executeBlockOnPrivateQueue___block_invoke;
    block[3] = &unk_1E1EDFF40;
    block[4] = a2;
    dispatch_after(v5, v6, block);
  }
}

uint64_t __68__PFUbiquitySwitchboardEntry_afterDelay_executeBlockOnPrivateQueue___block_invoke(uint64_t a1)
{
  id v2;

  v2 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return objc_msgSend(v2, "drain");
}

uint64_t __70__PFUbiquitySwitchboardEntry_synchronouslyExecuteBlockOnPrivateQueue___block_invoke(uint64_t a1)
{
  id v2;

  v2 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return objc_msgSend(v2, "drain");
}

@end
