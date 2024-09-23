@implementation NSCKImportOperation

+ (uint64_t)fetchUnfinishedImportOperationsInStore:(void *)a3 withManagedObjectContext:(uint64_t)a4 error:
{
  NSFetchRequest *v7;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  objc_opt_self();
  v7 = +[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", +[NSCKImportOperation entityPath]());
  v9[0] = a2;
  -[NSFetchRequest setAffectedStores:](v7, "setAffectedStores:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1));
  return objc_msgSend(a3, "executeFetchRequest:error:", v7, a4);
}

+ (uint64_t)entityPath
{
  void *v0;
  id v1;
  objc_class *v2;

  objc_opt_self();
  v0 = (void *)MEMORY[0x1E0CB3940];
  v1 = +[PFCloudKitMetadataModel ancillaryModelNamespace](PFCloudKitMetadataModel, "ancillaryModelNamespace");
  v2 = (objc_class *)objc_opt_class();
  return objc_msgSend(v0, "stringWithFormat:", CFSTR("%@/%@"), v1, NSStringFromClass(v2));
}

+ (void)fetchOperationWithIdentifier:(uint64_t)a3 fromStore:(void *)a4 inManagedObjectContext:(uint64_t)a5 error:
{
  NSFetchRequest *v9;
  void *result;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  uint8_t buf[4];
  uint64_t v21;
  __int16 v22;
  void *v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  objc_opt_self();
  v9 = +[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", +[NSCKImportOperation entityPath]());
  v24[0] = a3;
  -[NSFetchRequest setAffectedStores:](v9, "setAffectedStores:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 1));
  -[NSFetchRequest setPredicate:](v9, "setPredicate:", objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("operationUUID == %@"), a2));
  result = (void *)objc_msgSend(a4, "executeFetchRequest:error:", v9, a5);
  if (result)
  {
    v11 = result;
    if ((unint64_t)objc_msgSend(result, "count") < 2)
    {
      return (void *)objc_msgSend(v11, "lastObject");
    }
    else
    {
      v12 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Duplicate operations for identifier: %@\n%@");
      _NSCoreDataLog(17, v12, v13, v14, v15, v16, v17, v18, a2);
      v19 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412546;
        v21 = a2;
        v22 = 2112;
        v23 = v11;
        _os_log_fault_impl(&dword_18A253000, v19, OS_LOG_TYPE_FAULT, "CoreData: Duplicate operations for identifier: %@\n%@", buf, 0x16u);
      }
      return 0;
    }
  }
  return result;
}

+ (BOOL)purgeFinishedImportOperationsInStore:(void *)a3 withManagedObjectContext:(uint64_t)a4 error:
{
  NSFetchRequest *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  objc_opt_self();
  v7 = +[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", +[NSCKImportOperation entityPath]());
  v21[0] = a2;
  -[NSFetchRequest setAffectedStores:](v7, "setAffectedStores:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 1));
  v8 = (void *)objc_msgSend(a3, "executeFetchRequest:error:", v7, a4);
  v9 = v8;
  if (v8)
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v17 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
          if (!objc_msgSend((id)objc_msgSend(v14, "pendingRelationships"), "count"))
            objc_msgSend(a3, "deleteObject:", v14);
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v11);
    }
  }
  return v9 != 0;
}

@end
