@implementation NSCKHistoryAnalyzerState

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

- (NSManagedObjectID)analyzedObjectID
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSPersistentStore *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint8_t buf[4];
  NSCKHistoryAnalyzerState *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = objc_msgSend((id)-[NSCKHistoryAnalyzerState entityId](self, "entityId"), "unsignedLongValue");
  v4 = objc_msgSend((id)-[NSCKHistoryAnalyzerState entityPK](self, "entityPK"), "integerValue");
  if (!v3)
  {
    v8 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Cannot create objectID: called before the record has the necessary properties: %@");
    _NSCoreDataLog(17, v8, v9, v10, v11, v12, v13, v14, (uint64_t)self);
    v15 = __pflogFaultLog;
    if (!os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      goto LABEL_8;
    *(_DWORD *)buf = 138412290;
    v25 = self;
    goto LABEL_11;
  }
  v5 = v4;
  v6 = -[NSManagedObjectID persistentStore](-[NSManagedObject objectID](self, "objectID"), "persistentStore");
  v7 = (void *)_sqlCoreLookupSQLEntityForEntityID(v6, v3);
  if (v7)
  {
    if (v5 >= 1)
    {
      v7 = (void *)-[NSPersistentStore newObjectIDForEntity:pk:](v6, "newObjectIDForEntity:pk:", v7, v5);
      return (NSManagedObjectID *)v7;
    }
    v16 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Cannot create objectID: called before the record has the necessary properties: %@");
    _NSCoreDataLog(17, v16, v17, v18, v19, v20, v21, v22, (uint64_t)self);
    v15 = __pflogFaultLog;
    if (!os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
LABEL_8:
      v7 = 0;
      return (NSManagedObjectID *)v7;
    }
    *(_DWORD *)buf = 138412290;
    v25 = self;
LABEL_11:
    _os_log_fault_impl(&dword_18A253000, v15, OS_LOG_TYPE_FAULT, "CoreData: Cannot create objectID: called before the record has the necessary properties: %@", buf, 0xCu);
    goto LABEL_8;
  }
  return (NSManagedObjectID *)v7;
}

- (void)mergeWithState:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  uint8_t buf[4];
  id v14;
  __int16 v15;
  NSCKHistoryAnalyzerState *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend((id)objc_msgSend(a3, "originalTransactionNumber"), "compare:", -[NSCKHistoryAnalyzerState originalTransactionNumber](self, "originalTransactionNumber")) == -1|| objc_msgSend((id)objc_msgSend(a3, "originalTransactionNumber"), "compare:", -[NSCKHistoryAnalyzerState finalTransactionNumber](self, "finalTransactionNumber")) == -1|| objc_msgSend((id)objc_msgSend(a3, "originalTransactionNumber"), "compare:", -[NSCKHistoryAnalyzerState finalTransactionNumber](self, "finalTransactionNumber")) == -1|| objc_msgSend((id)objc_msgSend(a3, "finalTransactionNumber"), "compare:", -[NSCKHistoryAnalyzerState finalTransactionNumber](self, "finalTransactionNumber")) == -1)
  {
    v5 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "History analysis corruption detected. State is behind (or overlaps) this copy but is attempting to be merged. %@ / %@");
    _NSCoreDataLog(17, v5, v6, v7, v8, v9, v10, v11, (uint64_t)a3);
    v12 = __pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412546;
      v14 = a3;
      v15 = 2112;
      v16 = self;
      _os_log_fault_impl(&dword_18A253000, v12, OS_LOG_TYPE_FAULT, "CoreData: History analysis corruption detected. State is behind (or overlaps) this copy but is attempting to be merged. %@ / %@", buf, 0x16u);
    }
  }
  -[NSManagedObject setValue:forKey:](self, "setValue:forKey:", objc_msgSend(a3, "finalTransactionNumber"), CFSTR("finalTransactionNumber"));
  -[NSManagedObject setValue:forKey:](self, "setValue:forKey:", objc_msgSend(a3, "finalChangeAuthor"), CFSTR("finalChangeAuthor"));
  -[NSCKHistoryAnalyzerState setFinalChangeTypeNum:](self, "setFinalChangeTypeNum:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(a3, "finalChangeType")));
}

- (void)updateWithChange:(id)a3
{
  -[NSManagedObject setValue:forKey:](self, "setValue:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend((id)objc_msgSend(a3, "transaction"), "transactionNumber")), CFSTR("finalTransactionNumber"));
  -[NSManagedObject setValue:forKey:](self, "setValue:forKey:", objc_msgSend((id)objc_msgSend(a3, "transaction"), "author"), CFSTR("finalChangeAuthor"));
  -[NSCKHistoryAnalyzerState setFinalChangeTypeNum:](self, "setFinalChangeTypeNum:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(a3, "changeType")));
}

- (NSDictionary)tombstone
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v11;

  v2 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Tombstones aren't supported yet for CloudKit history analysis");
  _NSCoreDataLog(17, v2, v3, v4, v5, v6, v7, v8, v11);
  v9 = __pflogFaultLog;
  if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
  {
    LOWORD(v11) = 0;
    _os_log_fault_impl(&dword_18A253000, v9, OS_LOG_TYPE_FAULT, "CoreData: Tombstones aren't supported yet for CloudKit history analysis", (uint8_t *)&v11, 2u);
  }
  return 0;
}

- (int64_t)originalChangeType
{
  return objc_msgSend((id)-[NSCKHistoryAnalyzerState originalChangeTypeNum](self, "originalChangeTypeNum"), "integerValue");
}

- (int64_t)finalChangeType
{
  return objc_msgSend((id)-[NSCKHistoryAnalyzerState finalChangeTypeNum](self, "finalChangeTypeNum"), "integerValue");
}

+ (uint64_t)purgeAnalyzedHistoryFromStore:(void *)a3 withManagedObjectContext:(_QWORD *)a4 error:
{
  NSBatchDeleteRequest *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  int v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  objc_opt_self();
  v18 = 0;
  v7 = -[NSBatchDeleteRequest initWithFetchRequest:]([NSBatchDeleteRequest alloc], "initWithFetchRequest:", +[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", +[NSCKHistoryAnalyzerState entityPath](NSCKHistoryAnalyzerState, "entityPath")));
  -[NSBatchDeleteRequest setResultType:](v7, "setResultType:", 0);
  v23[0] = a2;
  -[NSPersistentStoreRequest setAffectedStores:](v7, "setAffectedStores:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 1));
  v8 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "executeRequest:error:", v7, &v18), "result"), "BOOLValue");

  if ((v8 & 1) == 0)
  {
    if (v18)
    {
      if (a4)
        *a4 = v18;
    }
    else
    {
      v9 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
      _NSCoreDataLog(17, v9, v10, v11, v12, v13, v14, v15, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/NSCKHistoryAnalyzerState.m");
      v16 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        v20 = "/Library/Caches/com.apple.xbs/Sources/Persistence/NSCKHistoryAnalyzerState.m";
        v21 = 1024;
        v22 = 161;
        _os_log_fault_impl(&dword_18A253000, v16, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
      }
    }
  }
  return v8;
}

+ (uint64_t)countAnalyzerStatesInStore:(uint64_t)a3 withManagedObjectContext:(id *)a4 error:
{
  NSFetchRequest *v7;
  uint64_t v8;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  objc_opt_self();
  objc_opt_self();
  v7 = +[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", +[NSCKHistoryAnalyzerState entityPath](NSCKHistoryAnalyzerState, "entityPath"));
  v10[0] = a2;
  -[NSFetchRequest setAffectedStores:](v7, "setAffectedStores:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1));
  -[NSFetchRequest setPredicate:](v7, "setPredicate:", 0);
  -[NSFetchRequest setResultType:](v7, "setResultType:", 4);
  if (a3)
  {
    v8 = -[NSManagedObjectContext _countForFetchRequest_:error:](a3, v7, a4);
    if (v8 == 0x7FFFFFFFFFFFFFFFLL)
      return 0;
  }
  else
  {
    v8 = 0;
  }
  return objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v8);
}

@end
