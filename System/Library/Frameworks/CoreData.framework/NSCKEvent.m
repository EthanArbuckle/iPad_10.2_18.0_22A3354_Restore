@implementation NSCKEvent

+ (NSString)entityPath
{
  void *v2;
  id v3;
  objc_class *v4;

  v2 = (void *)MEMORY[0x1E0CB3940];
  v3 = +[PFCloudKitMetadataModel ancillaryModelNamespace](PFCloudKitMetadataModel, "ancillaryModelNamespace");
  v4 = (objc_class *)objc_opt_class();
  return (NSString *)objc_msgSend(v2, "stringWithFormat:", CFSTR("%@/%@"), v3, NSStringFromClass(v4));
}

+ (uint64_t)beginEventForRequest:(uint64_t)a3 withMonitor:(_QWORD *)a4 error:
{
  uint64_t v7;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  _QWORD v18[8];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  void (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  uint64_t v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  void (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  uint64_t v30;
  uint8_t buf[4];
  const char *v32;
  __int16 v33;
  int v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  objc_opt_self();
  v25 = 0;
  v26 = &v25;
  v27 = 0x3052000000;
  v28 = __Block_byref_object_copy__11;
  v29 = __Block_byref_object_dispose__11;
  v30 = 0;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3052000000;
  v22 = __Block_byref_object_copy__11;
  v23 = __Block_byref_object_dispose__11;
  v24 = 0;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __52__NSCKEvent_beginEventForRequest_withMonitor_error___block_invoke;
  v18[3] = &unk_1E1EDD7B8;
  v18[4] = a3;
  v18[5] = a2;
  v18[6] = &v25;
  v18[7] = &v19;
  -[PFCloudKitStoreMonitor performBlock:](a3, (uint64_t)v18);
  if (!v26[5])
  {
    v9 = (id)v20[5];
    if (v9)
    {
      if (a4)
        *a4 = v9;
    }
    else
    {
      v10 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
      _NSCoreDataLog(17, v10, v11, v12, v13, v14, v15, v16, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/NSCKEvent.m");
      v17 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        v32 = "/Library/Caches/com.apple.xbs/Sources/Persistence/NSCKEvent.m";
        v33 = 1024;
        v34 = 92;
        _os_log_fault_impl(&dword_18A253000, v17, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
      }
    }
  }

  v20[5] = 0;
  v7 = v26[5];
  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v25, 8);
  return v7;
}

void __52__NSCKEvent_beginEventForRequest_withMonitor_error___block_invoke(uint64_t a1)
{
  void *v2;
  NSManagedObjectContext *v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  _QWORD v7[7];
  __int128 v8;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)-[PFCloudKitStoreMonitor retainedMonitoredStore](*(_QWORD *)(a1 + 32));
  if (v2)
  {
    v3 = -[PFCloudKitStoreMonitor newBackgroundContextForMonitoredCoordinator](*(_QWORD *)(a1 + 32));
    -[NSManagedObjectContext setTransactionAuthor:](v3, "setTransactionAuthor:", CFSTR("NSCloudKitMirroringDelegate.event"));
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __52__NSCKEvent_beginEventForRequest_withMonitor_error___block_invoke_2;
    v7[3] = &unk_1E1EDD6B8;
    v4 = *(_QWORD *)(a1 + 40);
    v7[4] = v3;
    v7[5] = v4;
    v7[6] = v2;
    v8 = *(_OWORD *)(a1 + 48);
    -[NSManagedObjectContext performBlockAndWait:](v3, "performBlockAndWait:", v7);

  }
  else
  {
    v5 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v6 = *MEMORY[0x1E0CB28A8];
    v9 = *MEMORY[0x1E0CB2D68];
    v10[0] = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Request '%@' was cancelled because the store was removed from the coordinator."), objc_msgSend(*(id *)(a1 + 40), "requestIdentifier"));
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40) = objc_msgSend(v5, "initWithDomain:code:userInfo:", v6, 134407, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1));
  }

}

NSPersistentCloudKitContainerEvent *__52__NSCKEvent_beginEventForRequest_withMonitor_error___block_invoke_2(uint64_t a1)
{
  NSManagedObject *v2;
  uint64_t v3;
  char isKindOfClass;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  NSPersistentCloudKitContainerEvent *result;
  uint64_t v15;
  id v16;
  uint8_t buf[4];
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v16 = 0;
  v2 = +[NSEntityDescription insertNewObjectForEntityForName:inManagedObjectContext:](NSEntityDescription, "insertNewObjectForEntityForName:inManagedObjectContext:", +[NSCKEvent entityPath](NSCKEvent, "entityPath"), *(_QWORD *)(a1 + 32));
  -[NSManagedObject setEventIdentifier:](v2, "setEventIdentifier:", objc_msgSend(*(id *)(a1 + 40), "requestIdentifier"));
  v3 = *(_QWORD *)(a1 + 40);
  objc_opt_self();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v5 = 0;
  if ((isKindOfClass & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = 1;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v5 = 2;
      }
      else
      {
        v6 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Cannot create persistent event for request: %@");
        _NSCoreDataLog(17, v6, v7, v8, v9, v10, v11, v12, v3);
        v13 = __pflogFaultLog;
        if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 138412290;
          v18 = v3;
          _os_log_fault_impl(&dword_18A253000, v13, OS_LOG_TYPE_FAULT, "CoreData: Cannot create persistent event for request: %@", buf, 0xCu);
        }
        v5 = 0;
      }
    }
  }
  -[NSManagedObject setCloudKitEventType:](v2, "setCloudKitEventType:", v5);
  -[NSManagedObject setStartedAt:](v2, "setStartedAt:", objc_msgSend(MEMORY[0x1E0C99D68], "date"));
  objc_msgSend(*(id *)(a1 + 32), "assignObject:toPersistentStore:", v2, *(_QWORD *)(a1 + 48));
  if (objc_msgSend(*(id *)(a1 + 32), "save:", &v16))
  {
    result = -[NSPersistentCloudKitContainerEvent initWithCKEvent:]([NSPersistentCloudKitContainerEvent alloc], "initWithCKEvent:", v2);
    v15 = *(_QWORD *)(a1 + 56);
  }
  else
  {
    result = (NSPersistentCloudKitContainerEvent *)v16;
    v15 = *(_QWORD *)(a1 + 64);
  }
  *(_QWORD *)(*(_QWORD *)(v15 + 8) + 40) = result;
  return result;
}

+ (uint64_t)finishEventForResult:(uint64_t)a3 withMonitor:(_QWORD *)a4 error:
{
  uint64_t v7;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  _QWORD v18[8];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  void (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  uint64_t v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  void (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  uint64_t v30;
  uint8_t buf[4];
  const char *v32;
  __int16 v33;
  int v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  objc_opt_self();
  v25 = 0;
  v26 = &v25;
  v27 = 0x3052000000;
  v28 = __Block_byref_object_copy__11;
  v29 = __Block_byref_object_dispose__11;
  v30 = 0;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3052000000;
  v22 = __Block_byref_object_copy__11;
  v23 = __Block_byref_object_dispose__11;
  v24 = 0;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __52__NSCKEvent_finishEventForResult_withMonitor_error___block_invoke;
  v18[3] = &unk_1E1EDD7B8;
  v18[4] = a3;
  v18[5] = a2;
  v18[6] = &v25;
  v18[7] = &v19;
  -[PFCloudKitStoreMonitor performBlock:](a3, (uint64_t)v18);
  if (!v26[5])
  {
    v9 = (id)v20[5];
    if (v9)
    {
      if (a4)
        *a4 = v9;
    }
    else
    {
      v10 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
      _NSCoreDataLog(17, v10, v11, v12, v13, v14, v15, v16, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/NSCKEvent.m");
      v17 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        v32 = "/Library/Caches/com.apple.xbs/Sources/Persistence/NSCKEvent.m";
        v33 = 1024;
        v34 = 149;
        _os_log_fault_impl(&dword_18A253000, v17, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
      }
    }
  }

  v20[5] = 0;
  v7 = v26[5];
  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v25, 8);
  return v7;
}

void __52__NSCKEvent_finishEventForResult_withMonitor_error___block_invoke(uint64_t a1)
{
  void *v2;
  NSManagedObjectContext *v3;
  id v4;
  uint64_t v5;
  _QWORD v6[7];
  __int128 v7;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)-[PFCloudKitStoreMonitor retainedMonitoredStore](*(_QWORD *)(a1 + 32));
  if (v2)
  {
    v3 = -[PFCloudKitStoreMonitor newBackgroundContextForMonitoredCoordinator](*(_QWORD *)(a1 + 32));
    -[NSManagedObjectContext setTransactionAuthor:](v3, "setTransactionAuthor:", CFSTR("NSCloudKitMirroringDelegate.event"));
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __52__NSCKEvent_finishEventForResult_withMonitor_error___block_invoke_2;
    v6[3] = &unk_1E1EDD6B8;
    v6[4] = *(_QWORD *)(a1 + 40);
    v6[5] = v2;
    v6[6] = v3;
    v7 = *(_OWORD *)(a1 + 48);
    -[NSManagedObjectContext performBlockAndWait:](v3, "performBlockAndWait:", v6);

  }
  else
  {
    v4 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v5 = *MEMORY[0x1E0CB28A8];
    v8 = *MEMORY[0x1E0CB2D68];
    v9[0] = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Request '%@' was cancelled because the store was removed from the coordinator."), objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "request"), "requestIdentifier"));
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40) = objc_msgSend(v4, "initWithDomain:code:userInfo:", v5, 134407, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1));
  }

}

void __52__NSCKEvent_finishEventForResult_withMonitor_error___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  NSFetchRequest *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  NSPersistentCloudKitContainerEvent *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  uint64_t v28;
  uint64_t v29;
  id v30[3];
  uint8_t buf[4];
  uint64_t v32;
  __int16 v33;
  uint64_t v34;
  _QWORD v35[2];

  v35[1] = *MEMORY[0x1E0C80C00];
  v30[0] = 0;
  v2 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "request"), "requestIdentifier");
  v4 = *(_QWORD *)(a1 + 40);
  v3 = *(void **)(a1 + 48);
  objc_opt_self();
  v5 = +[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", +[NSCKEvent entityPath](NSCKEvent, "entityPath"));
  -[NSFetchRequest setPredicate:](v5, "setPredicate:", objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("eventIdentifier = %@"), v2));
  v35[0] = v4;
  -[NSFetchRequest setAffectedStores:](v5, "setAffectedStores:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 1));
  v6 = (void *)objc_msgSend(v3, "executeFetchRequest:error:", v5, v30);
  v7 = v6;
  if (v6)
  {
    if ((unint64_t)objc_msgSend(v6, "count") >= 2)
    {
      v8 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Found multiple NSPersistentCloudKitContainerEvents for the identifier '%@'");
      _NSCoreDataLog(17, v8, v9, v10, v11, v12, v13, v14, v2);
      v15 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412290;
        v32 = v2;
        _os_log_fault_impl(&dword_18A253000, v15, OS_LOG_TYPE_FAULT, "CoreData: Found multiple NSPersistentCloudKitContainerEvents for the identifier '%@'", buf, 0xCu);
      }
    }
    v16 = (void *)objc_msgSend(v7, "lastObject");
    if (v16)
    {
      objc_msgSend(v16, "setEndedAt:", objc_msgSend(MEMORY[0x1E0C99D68], "date"));
      objc_msgSend(v16, "setSucceeded:", objc_msgSend(*(id *)(a1 + 32), "success"));
      objc_msgSend(v16, "setErrorDomain:", objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "error"), "domain"));
      objc_msgSend(v16, "setErrorCode:", objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "error"), "code"));
      if (objc_msgSend(*(id *)(a1 + 48), "save:", v30))
      {
        v17 = -[NSPersistentCloudKitContainerEvent initWithCKEvent:]([NSPersistentCloudKitContainerEvent alloc], "initWithCKEvent:", v16);
        v18 = *(_QWORD *)(a1 + 56);
LABEL_12:
        *(_QWORD *)(*(_QWORD *)(v18 + 8) + 40) = v17;
        return;
      }
LABEL_11:
      v17 = (NSPersistentCloudKitContainerEvent *)v30[0];
      v18 = *(_QWORD *)(a1 + 64);
      goto LABEL_12;
    }
  }
  if (v30[0])
    goto LABEL_11;
  v19 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "No event was found for the identifier '%@' in this result: %@");
  v20 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "request"), "requestIdentifier");
  _NSCoreDataLog(17, v19, v21, v22, v23, v24, v25, v26, v20);
  v27 = __pflogFaultLog;
  if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
  {
    v28 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "request"), "requestIdentifier");
    v29 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412546;
    v32 = v28;
    v33 = 2112;
    v34 = v29;
    _os_log_fault_impl(&dword_18A253000, v27, OS_LOG_TYPE_FAULT, "CoreData: No event was found for the identifier '%@' in this result: %@", buf, 0x16u);
  }
}

@end
