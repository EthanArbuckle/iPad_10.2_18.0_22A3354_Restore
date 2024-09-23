@implementation NSCKMetadataEntry

- (BOOL)BOOLValue
{
  return objc_msgSend((id)-[NSCKMetadataEntry BOOLValueNum](self, "BOOLValueNum"), "BOOLValue");
}

- (void)setBoolValue:(BOOL)a3
{
  -[NSCKMetadataEntry setBoolValueNum:](self, "setBoolValueNum:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3));
}

- (__CFString)describeValue
{
  __CFString *v1;
  __CFString *v2;
  void *v3;
  _BOOL8 v4;
  uint64_t v5;
  objc_class *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  if (result)
  {
    v1 = result;
    if (-[__CFString stringValue](result, "stringValue"))
    {
      return (__CFString *)-[__CFString stringValue](v1, "stringValue");
    }
    else if (-[__CFString integerValue](v1, "integerValue"))
    {
      return (__CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%ld"), objc_msgSend((id)-[__CFString integerValue](v1, "integerValue"), "integerValue"));
    }
    else if (-[__CFString BOOLValueNum](v1, "BOOLValueNum"))
    {
      if (-[__CFString BOOLValue](v1, "BOOLValue"))
        return CFSTR("YES");
      else
        return CFSTR("NO");
    }
    else
    {
      if (-[__CFString transformedValue](v1, "transformedValue"))
      {
        v2 = (__CFString *)-[__CFString transformedValue](v1, "transformedValue");
      }
      else if (-[__CFString dateValue](v1, "dateValue"))
      {
        v2 = (__CFString *)-[__CFString dateValue](v1, "dateValue");
      }
      else
      {
        v3 = (void *)MEMORY[0x18D76B4E4]();
        v4 = __ckLoggingOverride != 0;
        v5 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("%@ doesn't know how to handle it's specified value. Please file a bug with this outpout and send to Core Data | New Bugs."));
        v6 = (objc_class *)objc_opt_class();
        NSStringFromClass(v6);
        _NSCoreDataLog(v4, v5, v7, v8, v9, v10, v11, v12, (uint64_t)"-[NSCKMetadataEntry describeValue]");
        objc_autoreleasePoolPop(v3);
        v2 = v1;
      }
      return (__CFString *)-[__CFString description](v2, "description");
    }
  }
  return result;
}

+ (uint64_t)entryForKey:(uint64_t)a3 fromStore:(void *)a4 inManagedObjectContext:(uint64_t)a5 error:
{
  uint64_t v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  objc_opt_self();
  v11[0] = a2;
  v9 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  objc_opt_self();
  return objc_msgSend(+[NSCKMetadataEntry entriesForKeys:onlyFetchingProperties:fromStore:inManagedObjectContext:error:]((uint64_t)NSCKMetadataEntry, v9, 0, a3, a4, a5), "objectForKey:", a2);
}

+ (void)entriesForKeys:(uint64_t)a3 fromStore:(void *)a4 inManagedObjectContext:(uint64_t)a5 error:
{
  objc_opt_self();
  return +[NSCKMetadataEntry entriesForKeys:onlyFetchingProperties:fromStore:inManagedObjectContext:error:]((uint64_t)NSCKMetadataEntry, a2, 0, a3, a4, a5);
}

+ (void)entriesForKeys:(void *)a3 onlyFetchingProperties:(uint64_t)a4 fromStore:(void *)a5 inManagedObjectContext:(uint64_t)a6 error:
{
  NSFetchRequest *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  objc_opt_self();
  v11 = +[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", +[NSCKMetadataEntry entityPath](NSCKMetadataEntry, "entityPath"));
  -[NSFetchRequest setPredicate:](v11, "setPredicate:", objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("key IN (%@)"), a2));
  v24[0] = a4;
  -[NSFetchRequest setAffectedStores:](v11, "setAffectedStores:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 1));
  if (objc_msgSend(a3, "count"))
    -[NSFetchRequest setPropertiesToFetch:](v11, "setPropertiesToFetch:", a3);
  else
    -[NSFetchRequest setReturnsObjectsAsFaults:](v11, "setReturnsObjectsAsFaults:", 0);
  v12 = (void *)objc_msgSend(a5, "executeFetchRequest:error:", v11, a6);
  v13 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  if (v12)
  {
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v20;
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v20 != v16)
            objc_enumerationMutation(v12);
          objc_msgSend(v13, "setObject:forKey:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v17), objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v17), "key"));
          ++v17;
        }
        while (v15 != v17);
        v15 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v15);
    }
  }
  return v13;
}

+ (NSManagedObject)insertMetadataEntryWithKey:(uint64_t)a3 stringValue:(uint64_t)a4 forStore:(void *)a5 intoManagedObjectContext:
{
  NSManagedObject *v9;

  objc_opt_self();
  v9 = +[NSCKMetadataEntry _insertMetadataEntryWithKey:forStore:intoManagedObjectContext:]((uint64_t)NSCKMetadataEntry, a2, a4, a5);
  -[NSManagedObject setStringValue:](v9, "setStringValue:", a3);
  return v9;
}

+ (NSManagedObject)_insertMetadataEntryWithKey:(uint64_t)a3 forStore:(void *)a4 intoManagedObjectContext:
{
  NSManagedObject *v7;

  objc_opt_self();
  v7 = +[NSEntityDescription insertNewObjectForEntityForName:inManagedObjectContext:](NSEntityDescription, "insertNewObjectForEntityForName:inManagedObjectContext:", +[NSCKMetadataEntry entityPath](NSCKMetadataEntry, "entityPath"), a4);
  -[NSManagedObject setKey:](v7, "setKey:", a2);
  objc_msgSend(a4, "assignObject:toPersistentStore:", v7, a3);
  return v7;
}

+ (NSManagedObject)insertMetadataEntryWithKey:(uint64_t)a3 BOOLValue:(uint64_t)a4 forStore:(void *)a5 intoManagedObjectContext:
{
  NSManagedObject *v9;

  objc_opt_self();
  v9 = +[NSCKMetadataEntry _insertMetadataEntryWithKey:forStore:intoManagedObjectContext:]((uint64_t)NSCKMetadataEntry, a2, a4, a5);
  -[NSManagedObject setBoolValue:](v9, "setBoolValue:", a3);
  return v9;
}

+ (uint64_t)updateOrInsertMetadataEntryWithKey:(char)a3 BOOLValue:(uint64_t)a4 forStore:(void *)a5 intoManagedObjectContext:(_QWORD *)a6 error:
{
  _QWORD v12[4];
  char v13;

  objc_opt_self();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __106__NSCKMetadataEntry_updateOrInsertMetadataEntryWithKey_BOOLValue_forStore_intoManagedObjectContext_error___block_invoke;
  v12[3] = &__block_descriptor_33_e27_v16__0__NSCKMetadataEntry_8l;
  v13 = a3;
  return +[NSCKMetadataEntry _updateOrInsertMetadataEntryWithKey:valueSettingBlock:forStore:intoManagedObjectContext:error:]((uint64_t)NSCKMetadataEntry, a2, (uint64_t)v12, a4, a5, a6);
}

uint64_t __106__NSCKMetadataEntry_updateOrInsertMetadataEntryWithKey_BOOLValue_forStore_intoManagedObjectContext_error___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setBoolValue:", *(unsigned __int8 *)(a1 + 32));
}

+ (uint64_t)_updateOrInsertMetadataEntryWithKey:(uint64_t)a3 valueSettingBlock:(uint64_t)a4 forStore:(void *)a5 intoManagedObjectContext:(_QWORD *)a6 error:
{
  uint64_t v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  uint64_t v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  int v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  objc_opt_self();
  v21 = 0;
  v11 = +[NSCKMetadataEntry entryForKey:fromStore:inManagedObjectContext:error:]((uint64_t)NSCKMetadataEntry, a2, a4, a5, (uint64_t)&v21);
  if (!v11)
  {
    v11 = (uint64_t)+[NSCKMetadataEntry _insertMetadataEntryWithKey:forStore:intoManagedObjectContext:]((uint64_t)NSCKMetadataEntry, a2, a4, a5);
    if (!v11)
    {
      if (v21)
      {
        if (a6)
        {
          v11 = 0;
          *a6 = v21;
          return v11;
        }
      }
      else
      {
        v13 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
        _NSCoreDataLog(17, v13, v14, v15, v16, v17, v18, v19, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/NSCKMetadataEntry.m");
        v20 = __pflogFaultLog;
        if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 136315394;
          v23 = "/Library/Caches/com.apple.xbs/Sources/Persistence/NSCKMetadataEntry.m";
          v24 = 1024;
          v25 = 237;
          _os_log_fault_impl(&dword_18A253000, v20, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
        }
      }
      return 0;
    }
  }
  (*(void (**)(uint64_t, uint64_t))(a3 + 16))(a3, v11);
  return v11;
}

+ (uint64_t)updateOrInsertMetadataEntryWithKey:(uint64_t)a3 stringValue:(uint64_t)a4 forStore:(void *)a5 intoManagedObjectContext:(_QWORD *)a6 error:
{
  _QWORD v12[5];

  objc_opt_self();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __108__NSCKMetadataEntry_updateOrInsertMetadataEntryWithKey_stringValue_forStore_intoManagedObjectContext_error___block_invoke;
  v12[3] = &unk_1E1EE0398;
  v12[4] = a3;
  return +[NSCKMetadataEntry _updateOrInsertMetadataEntryWithKey:valueSettingBlock:forStore:intoManagedObjectContext:error:]((uint64_t)NSCKMetadataEntry, a2, (uint64_t)v12, a4, a5, a6);
}

uint64_t __108__NSCKMetadataEntry_updateOrInsertMetadataEntryWithKey_stringValue_forStore_intoManagedObjectContext_error___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setStringValue:", *(_QWORD *)(a1 + 32));
}

+ (uint64_t)updateOrInsertMetadataEntryWithKey:(uint64_t)a3 transformedValue:(uint64_t)a4 forStore:(void *)a5 intoManagedObjectContext:(_QWORD *)a6 error:
{
  _QWORD v12[5];

  objc_opt_self();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __113__NSCKMetadataEntry_updateOrInsertMetadataEntryWithKey_transformedValue_forStore_intoManagedObjectContext_error___block_invoke;
  v12[3] = &unk_1E1EE0398;
  v12[4] = a3;
  return +[NSCKMetadataEntry _updateOrInsertMetadataEntryWithKey:valueSettingBlock:forStore:intoManagedObjectContext:error:]((uint64_t)NSCKMetadataEntry, a2, (uint64_t)v12, a4, a5, a6);
}

uint64_t __113__NSCKMetadataEntry_updateOrInsertMetadataEntryWithKey_transformedValue_forStore_intoManagedObjectContext_error___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setTransformedValue:", *(_QWORD *)(a1 + 32));
}

+ (uint64_t)updateOrInsertMetadataEntryWithKey:(uint64_t)a3 integerValue:(uint64_t)a4 forStore:(void *)a5 intoManagedObjectContext:(_QWORD *)a6 error:
{
  _QWORD v12[5];

  objc_opt_self();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __109__NSCKMetadataEntry_updateOrInsertMetadataEntryWithKey_integerValue_forStore_intoManagedObjectContext_error___block_invoke;
  v12[3] = &unk_1E1EE0398;
  v12[4] = a3;
  return +[NSCKMetadataEntry _updateOrInsertMetadataEntryWithKey:valueSettingBlock:forStore:intoManagedObjectContext:error:]((uint64_t)NSCKMetadataEntry, a2, (uint64_t)v12, a4, a5, a6);
}

uint64_t __109__NSCKMetadataEntry_updateOrInsertMetadataEntryWithKey_integerValue_forStore_intoManagedObjectContext_error___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setIntegerValue:", *(_QWORD *)(a1 + 32));
}

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

@end
