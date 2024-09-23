@implementation PFCloudKitStoreMonitor

- (id)initForStore:(id)a3
{
  PFCloudKitStoreMonitor *v4;
  PFCloudKitStoreMonitor *v5;
  void *v6;
  NSString *storeIdentifier;
  id v8;
  id v9;
  int v10;
  _QWORD v12[8];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)PFCloudKitStoreMonitor;
  v4 = -[PFCloudKitStoreMonitor init](&v17, sel_init);
  v5 = v4;
  if (v4)
  {
    *(_WORD *)&v4->_storeIsAlive = 0;
    v4->_monitorGroup = (OS_dispatch_group *)dispatch_group_create();
    v5->_aliveLock._os_unfair_lock_opaque = 0;
    *(_QWORD *)&v5->_retryCount = 0xA00000000;
    v5->_storeIdentifier = (NSString *)(id)objc_msgSend(a3, "identifier");
    v6 = (void *)MEMORY[0x18D76B4E4]();
    v13 = 0;
    v14 = &v13;
    v15 = 0x2020000000;
    v16 = 0;
    storeIdentifier = v5->_storeIdentifier;
    v8 = (id)objc_msgSend(a3, "URL");
    v9 = (id)objc_msgSend(a3, "persistentStoreCoordinator");
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __39__PFCloudKitStoreMonitor_initForStore___block_invoke;
    v12[3] = &unk_1E1EDE730;
    v12[4] = v5;
    v12[5] = v9;
    v12[6] = storeIdentifier;
    v12[7] = &v13;
    objc_msgSend(v9, "performBlockAndWait:", v12);
    v10 = *((unsigned __int8 *)v14 + 24);
    v5->_storeIsAlive = v10;
    if (v10)
    {
      objc_storeWeak((id *)&v5->_monitoredCoordinator, v9);
      objc_storeWeak((id *)&v5->_monitoredStore, a3);
    }

    _Block_object_dispose(&v13, 8);
    objc_autoreleasePoolPop(v6);
  }
  return v5;
}

uint64_t __39__PFCloudKitStoreMonitor_initForStore___block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "addObserver:selector:name:object:", *(_QWORD *)(a1 + 32), sel_coordinatorWillRemoveStore_, CFSTR("_NSPersistentStoreCoordinatorPrivateWillRemoveStoreNotification"), 0);
  result = objc_msgSend(*(id *)(a1 + 40), "persistentStoreForIdentifier:", *(_QWORD *)(a1 + 48));
  if (result)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
  return result;
}

- (void)dealloc
{
  objc_super v3;

  self->_storeIdentifier = 0;
  dispatch_release((dispatch_object_t)self->_monitorGroup);
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "removeObserver:name:object:", self, CFSTR("_NSPersistentStoreCoordinatorPrivateWillRemoveStoreNotification"), 0);
  v3.receiver = self;
  v3.super_class = (Class)PFCloudKitStoreMonitor;
  -[PFCloudKitStoreMonitor dealloc](&v3, sel_dealloc);
}

- (void)coordinatorWillRemoveStore:(id)a3
{
  id v4;
  int retryCount;
  NSObject *monitorGroup;
  dispatch_time_t v7;
  intptr_t v8;
  void *v9;
  _BOOL8 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
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
  NSString *storeIdentifier;
  uint8_t buf[4];
  PFCloudKitStoreMonitor *v36;
  __int16 v37;
  NSString *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v4 = (id)objc_msgSend((id)objc_msgSend(a3, "userInfo"), "objectForKey:", CFSTR("removed"));
  if (-[NSString isEqualToString:](self->_storeIdentifier, "isEqualToString:", objc_msgSend(v4, "identifier"))
    && objc_loadWeak((id *)&self->_monitoredStore) == v4)
  {
    os_unfair_lock_lock_with_options();
    *(_WORD *)&self->_storeIsAlive = 256;
    os_unfair_lock_unlock(&self->_aliveLock);
    retryCount = self->_retryCount;
    while (1)
    {
      self->_retryCount = retryCount + 1;
      monitorGroup = self->_monitorGroup;
      v7 = dispatch_time(0, 1000000000 * self->_timeoutSeconds);
      v8 = dispatch_group_wait(monitorGroup, v7);
      v9 = (void *)MEMORY[0x18D76B4E4]();
      if (!v8)
        break;
      v10 = __ckLoggingOverride != 0;
      v11 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("%@: Exporter / importer didn't tear down after 5 seconds, retrying (%d)."));
      _NSCoreDataLog(v10, v11, v12, v13, v14, v15, v16, v17, (uint64_t)"-[PFCloudKitStoreMonitor pfcloudstoremonitor_is_holding_your_store_open_waiting_for_cloudkit_activity_to_finish]");
      objc_autoreleasePoolPop(v9);
      retryCount = self->_retryCount;
      if (retryCount >= 10)
        goto LABEL_12;
    }
    if ((unint64_t)__ckLoggingOverride >= 0x10)
      v18 = 16;
    else
      v18 = __ckLoggingOverride;
    v19 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("%@: Exporter / importer finished after %d tries. Allowing store to deallocate."));
    _NSCoreDataLog(v18, v19, v20, v21, v22, v23, v24, v25, (uint64_t)"-[PFCloudKitStoreMonitor pfcloudstoremonitor_is_holding_your_store_open_waiting_for_cloudkit_activity_to_finish]");
    objc_autoreleasePoolPop(v9);
    if (self->_retryCount >= 10)
    {
LABEL_12:
      v26 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "PFCloudKitStoreMonitor failed to tear down gracefully, this means requests are probably about to fail: %@ - %@");
      _NSCoreDataLog(17, v26, v27, v28, v29, v30, v31, v32, (uint64_t)self);
      v33 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        storeIdentifier = self->_storeIdentifier;
        *(_DWORD *)buf = 138412546;
        v36 = self;
        v37 = 2112;
        v38 = storeIdentifier;
        _os_log_fault_impl(&dword_18A253000, v33, OS_LOG_TYPE_FAULT, "CoreData: PFCloudKitStoreMonitor failed to tear down gracefully, this means requests are probably about to fail: %@ - %@", buf, 0x16u);
      }
    }
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "removeObserver:name:object:", self, CFSTR("_NSPersistentStoreCoordinatorPrivateWillRemoveStoreNotification"), 0);
    objc_storeWeak((id *)&self->_monitoredCoordinator, 0);
    objc_storeWeak((id *)&self->_monitoredStore, 0);
  }
}

- (void)performBlock:(uint64_t)a1
{
  id v4;
  id WeakRetained;

  if (a1)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
    if (a2)
    {
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
      dispatch_group_enter(*(dispatch_group_t *)(a1 + 8));
      (*(void (**)(uint64_t))(a2 + 16))(a2);
      dispatch_group_leave(*(dispatch_group_t *)(a1 + 8));
    }
    else
    {
      WeakRetained = 0;
    }

  }
}

- (uint64_t)retainedMonitoredStore
{
  uint64_t v2;
  id WeakRetained;
  void *v5;
  _QWORD v6[7];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  uint64_t v12;

  if (!a1)
    return 0;
  v7 = 0;
  v8 = &v7;
  v9 = 0x3052000000;
  v10 = __Block_byref_object_copy__58;
  v11 = __Block_byref_object_dispose__58;
  v12 = 0;
  if (*(_BYTE *)(a1 + 20) && !*(_BYTE *)(a1 + 21))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    v5 = WeakRetained;
    if (WeakRetained)
    {
      v6[0] = MEMORY[0x1E0C809B0];
      v6[1] = 3221225472;
      v6[2] = __48__PFCloudKitStoreMonitor_retainedMonitoredStore__block_invoke;
      v6[3] = &unk_1E1EDE1F0;
      v6[5] = a1;
      v6[6] = &v7;
      v6[4] = WeakRetained;
      objc_msgSend(WeakRetained, "performBlockAndWait:", v6);
    }

    v2 = v8[5];
    if (!v2)
    {
      os_unfair_lock_lock_with_options();
      *(_WORD *)(a1 + 20) = 256;
      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 16));
      v2 = v8[5];
    }
  }
  else
  {
    v2 = 0;
  }
  _Block_object_dispose(&v7, 8);
  return v2;
}

id __48__PFCloudKitStoreMonitor_retainedMonitoredStore__block_invoke(uint64_t a1)
{
  id result;

  result = (id)objc_msgSend(*(id *)(a1 + 32), "persistentStoreForIdentifier:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 48));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = result;
  return result;
}

- (NSManagedObjectContext)newBackgroundContextForMonitoredCoordinator
{
  NSManagedObjectContext *v2;
  id WeakRetained;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  uint32_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v33;
  uint8_t buf[4];
  uint64_t v35;
  _QWORD v36[2];

  v36[1] = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v2 = -[NSManagedObjectContext initWithConcurrencyType:]([NSManagedObjectContext alloc], "initWithConcurrencyType:", 1);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    -[NSManagedObjectContext setPersistentStoreCoordinator:](v2, "setPersistentStoreCoordinator:", WeakRetained);
    -[NSManagedObjectContext _setAllowAncillaryEntities:](v2, "_setAllowAncillaryEntities:", 1);
    if (v2)
      *(_QWORD *)&v2->_flags &= ~0x100000000uLL;
    -[NSManagedObjectContext setMergePolicy:](v2, "setMergePolicy:", NSMergeByPropertyObjectTrumpMergePolicy);
    if (*(_QWORD *)(a1 + 48))
    {
      v36[0] = *(_QWORD *)(a1 + 48);
      v4 = (void *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 1);
      if (v2)
      {
        v5 = objc_msgSend(v4, "copy");

        v2->_persistentStoreIdentifiers = (NSArray *)v5;
      }
      if (objc_msgSend(WeakRetained, "persistentStoreForIdentifier:", *(_QWORD *)(a1 + 48)))
        goto LABEL_15;
      v6 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Called after the store is dead. This method needs to be called inside a performBlock on the store monitor: %@");
      _NSCoreDataLog(17, v6, v7, v8, v9, v10, v11, v12, a1);
      v13 = __pflogFaultLog;
      if (!os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
        goto LABEL_15;
      *(_DWORD *)buf = 138412290;
      v35 = a1;
      v14 = "CoreData: Called after the store is dead. This method needs to be called inside a performBlock on the store monitor: %@";
      goto LABEL_13;
    }
    v24 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Attempt to create context without a store identifier.");
    _NSCoreDataLog(17, v24, v25, v26, v27, v28, v29, v30, v33);
    v31 = __pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      v14 = "CoreData: Attempt to create context without a store identifier.";
      v22 = v31;
      v23 = 2;
      goto LABEL_18;
    }
  }
  else
  {
    v15 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Called after the store is dead. This method needs to be called inside a performBlock on the store monitor: %@");
    _NSCoreDataLog(17, v15, v16, v17, v18, v19, v20, v21, a1);
    v13 = __pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      v35 = a1;
      v14 = "CoreData: Called after the store is dead. This method needs to be called inside a performBlock on the store monitor: %@";
LABEL_13:
      v22 = v13;
      v23 = 12;
LABEL_18:
      _os_log_fault_impl(&dword_18A253000, v22, OS_LOG_TYPE_FAULT, v14, buf, v23);
    }
  }
LABEL_15:

  return v2;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_monitoredStore);
  objc_destroyWeak((id *)&self->_monitoredCoordinator);
}

@end
