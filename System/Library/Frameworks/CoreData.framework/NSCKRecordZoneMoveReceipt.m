@implementation NSCKRecordZoneMoveReceipt

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

- (id)createRecordIDForMovedRecord
{
  void *v3;
  void *v4;

  v3 = (void *)objc_msgSend(objc_alloc((Class)getCloudKitCKRecordZoneIDClass[0]()), "initWithZoneName:ownerName:", -[NSCKRecordZoneMoveReceipt zoneName](self, "zoneName"), -[NSCKRecordZoneMoveReceipt ownerName](self, "ownerName"));
  v4 = (void *)objc_msgSend(objc_alloc((Class)getCloudKitCKRecordIDClass[0]()), "initWithRecordName:zoneID:", -[NSCKRecordZoneMoveReceipt recordName](self, "recordName"), v3);

  return v4;
}

+ (id)moveReceiptsMatchingRecordIDs:(id)a3 inManagedObjectContext:(id)a4 persistentStore:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  _QWORD v22[10];
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  void (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  uint64_t v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  char v32;
  uint8_t buf[4];
  const char *v34;
  __int16 v35;
  int v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v29 = 0;
  v30 = &v29;
  v31 = 0x2020000000;
  v32 = 1;
  v23 = 0;
  v24 = &v23;
  v25 = 0x3052000000;
  v26 = __Block_byref_object_copy__19;
  v27 = __Block_byref_object_dispose__19;
  v28 = 0;
  v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (objc_msgSend(a3, "count"))
  {
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __104__NSCKRecordZoneMoveReceipt_moveReceiptsMatchingRecordIDs_inManagedObjectContext_persistentStore_error___block_invoke;
    v22[3] = &unk_1E1EDF008;
    v22[4] = a3;
    v22[5] = a4;
    v22[6] = a5;
    v22[7] = v10;
    v22[8] = &v23;
    v22[9] = &v29;
    objc_msgSend(a4, "performBlockAndWait:", v22);
  }
  v11 = v10;
  if (!*((_BYTE *)v30 + 24))
  {
    v12 = (id)v24[5];
    if (v12)
    {
      if (a6)
      {
        v10 = 0;
        *a6 = v12;
        goto LABEL_10;
      }
    }
    else
    {
      v13 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
      _NSCoreDataLog(17, v13, v14, v15, v16, v17, v18, v19, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/NSCKRecordZoneMoveReceipt.m");
      v20 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        v34 = "/Library/Caches/com.apple.xbs/Sources/Persistence/NSCKRecordZoneMoveReceipt.m";
        v35 = 1024;
        v36 = 88;
        _os_log_fault_impl(&dword_18A253000, v20, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
      }
    }
    v10 = 0;
  }
LABEL_10:

  v24[5] = 0;
  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v29, 8);
  return v10;
}

void __104__NSCKRecordZoneMoveReceipt_moveReceiptsMatchingRecordIDs_inManagedObjectContext_persistentStore_error___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  id v12;
  id obj;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  obj = *(id *)(a1 + 32);
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v15 != v5)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        v8 = (void *)MEMORY[0x18D76B4E4]();
        objc_msgSend(v2, "addObject:", objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("recordName = %@ AND zoneName = %@ AND ownerName = %@"), objc_msgSend(v7, "recordName"), objc_msgSend((id)objc_msgSend(v7, "zoneID"), "zoneName"), objc_msgSend((id)objc_msgSend(v7, "zoneID"), "ownerName")));
        if ((unint64_t)objc_msgSend(v2, "count") >= 0x64)
        {
          v9 = +[NSCKRecordZoneMoveReceipt _fetchReceiptsMatchingSubPredicates:inManagedObjectContext:persistentStore:error:]((uint64_t)NSCKRecordZoneMoveReceipt, (uint64_t)v2, *(void **)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
          if (!v9)
          {
            *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 0;
            v10 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
            objc_autoreleasePoolPop(v8);
            goto LABEL_13;
          }
          objc_msgSend(*(id *)(a1 + 56), "addObjectsFromArray:", v9);
        }
        objc_autoreleasePoolPop(v8);
      }
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_13:
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) && objc_msgSend(v2, "count"))
  {
    v11 = +[NSCKRecordZoneMoveReceipt _fetchReceiptsMatchingSubPredicates:inManagedObjectContext:persistentStore:error:]((uint64_t)NSCKRecordZoneMoveReceipt, (uint64_t)v2, *(void **)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
    if (v11)
    {
      objc_msgSend(*(id *)(a1 + 56), "addObjectsFromArray:", v11);
    }
    else
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 0;
      v12 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
    }
  }
}

+ (uint64_t)_fetchReceiptsMatchingSubPredicates:(void *)a3 inManagedObjectContext:(uint64_t)a4 persistentStore:(uint64_t)a5 error:
{
  NSFetchRequest *v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  objc_opt_self();
  v9 = +[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", +[NSCKRecordZoneMoveReceipt entityPath](NSCKRecordZoneMoveReceipt, "entityPath"));
  v11[0] = a4;
  -[NSFetchRequest setAffectedStores:](v9, "setAffectedStores:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1));
  -[NSFetchRequest setPredicate:](v9, "setPredicate:", objc_msgSend(MEMORY[0x1E0CB3528], "orPredicateWithSubpredicates:", a2));
  return objc_msgSend(a3, "executeFetchRequest:error:", v9, a5);
}

+ (id)countMoveReceiptsInStore:(id)a3 matchingPredicate:(id)a4 withManagedObjectContext:(id)a5 error:(id *)a6
{
  NSFetchRequest *v10;
  uint64_t v11;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v10 = +[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", +[NSCKRecordZoneMoveReceipt entityPath](NSCKRecordZoneMoveReceipt, "entityPath"));
  v13[0] = a3;
  -[NSFetchRequest setAffectedStores:](v10, "setAffectedStores:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1));
  -[NSFetchRequest setPredicate:](v10, "setPredicate:", a4);
  -[NSFetchRequest setResultType:](v10, "setResultType:", 4);
  if (a5)
  {
    v11 = -[NSManagedObjectContext _countForFetchRequest_:error:]((uint64_t)a5, v10, a6);
    if (v11 == 0x7FFFFFFFFFFFFFFFLL)
      return 0;
  }
  else
  {
    v11 = 0;
  }
  return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v11);
}

@end
