@implementation NSCKRecordZoneMetadata

- (BOOL)hasRecordZone
{
  return objc_msgSend((id)-[NSCKRecordZoneMetadata hasRecordZoneNum](self, "hasRecordZoneNum"), "BOOLValue");
}

- (void)setHasRecordZone:(BOOL)a3
{
  -[NSCKRecordZoneMetadata setHasRecordZoneNum:](self, "setHasRecordZoneNum:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3));
}

- (BOOL)hasSubscription
{
  return objc_msgSend((id)-[NSCKRecordZoneMetadata hasSubscriptionNum](self, "hasSubscriptionNum"), "BOOLValue");
}

- (void)setHasSubscription:(BOOL)a3
{
  -[NSCKRecordZoneMetadata setHasSubscriptionNum:](self, "setHasSubscriptionNum:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3));
}

- (void)createRecordZoneID
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  uint8_t buf[4];
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v1 = result;
    if (!objc_msgSend(result, "ckRecordZoneName")
      || !objc_msgSend(v1, "ckOwnerName")
      || (result = (void *)objc_msgSend(objc_alloc((Class)getCloudKitCKRecordZoneIDClass[0]()), "initWithZoneName:ownerName:", objc_msgSend(v1, "ckRecordZoneName"), objc_msgSend(v1, "ckOwnerName"))) == 0)
    {
      v2 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "createRecordZoneID called before object has an owner name and zone name: %@");
      _NSCoreDataLog(17, v2, v3, v4, v5, v6, v7, v8, (uint64_t)v1);
      v9 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412290;
        v11 = v1;
        _os_log_fault_impl(&dword_18A253000, v9, OS_LOG_TYPE_FAULT, "CoreData: createRecordZoneID called before object has an owner name and zone name: %@", buf, 0xCu);
      }
      return 0;
    }
  }
  return result;
}

+ (NSManagedObject)zoneMetadataForZoneID:(uint64_t)a3 inDatabaseWithScope:(uint64_t)a4 forStore:(void *)a5 inContext:(uint64_t)a6 error:
{
  objc_opt_self();
  return +[NSCKRecordZoneMetadata zoneMetadataForZoneID:inDatabaseWithScope:forStore:inContext:createIfMissing:error:]((uint64_t)NSCKRecordZoneMetadata, a2, a3, a4, a5, 1, a6);
}

+ (NSManagedObject)zoneMetadataForZoneID:(uint64_t)a3 inDatabaseWithScope:(uint64_t)a4 forStore:(void *)a5 inContext:(int)a6 createIfMissing:(uint64_t)a7 error:
{
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  NSFetchRequest *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  NSManagedObject *v25;
  NSManagedObject *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  NSObject *v34;
  NSManagedObject *v35;
  NSManagedObject *v36;
  uint8_t buf[4];
  uint64_t v40;
  __int16 v41;
  NSManagedObject *v42;
  _QWORD v43[2];

  v43[1] = *MEMORY[0x1E0C80C00];
  objc_opt_self();
  if (a3 == 3)
  {
    if ((objc_msgSend((id)objc_msgSend(a2, "zoneName"), "isEqualToString:", CFSTR("com.apple.coredata.cloudkit.zone")) & 1) != 0
      || (v12 = (void *)objc_msgSend(a2, "zoneName"),
          objc_msgSend(v12, "isEqualToString:", getCloudKitCKRecordZoneDefaultName[0]())))
    {
      v13 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to work with the core-data or default zone in the shared database: %@");
      _NSCoreDataLog(17, v13, v14, v15, v16, v17, v18, v19, a4);
      v20 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412290;
        v40 = a4;
        _os_log_fault_impl(&dword_18A253000, v20, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to work with the core-data or default zone in the shared database: %@", buf, 0xCu);
      }
    }
  }
  v21 = +[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", +[NSCKRecordZoneMetadata entityPath](NSCKRecordZoneMetadata, "entityPath"));
  v43[0] = a4;
  -[NSFetchRequest setAffectedStores:](v21, "setAffectedStores:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v43, 1));
  v22 = (void *)MEMORY[0x1E0CB3880];
  v23 = objc_msgSend(a2, "zoneName");
  v24 = objc_msgSend(a2, "ownerName");
  -[NSFetchRequest setPredicate:](v21, "setPredicate:", objc_msgSend(v22, "predicateWithFormat:", CFSTR("%K = %@ AND %K = %@ AND database.databaseScopeNum = %@"), CFSTR("ckRecordZoneName"), v23, CFSTR("ckOwnerName"), v24, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3)));
  v25 = (NSManagedObject *)objc_msgSend(a5, "executeFetchRequest:error:", v21, a7);
  v26 = v25;
  if (v25)
  {
    if ((unint64_t)-[NSManagedObject count](v25, "count") >= 2)
    {
      v27 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Multiple zone entires discovered for a single record zone: %@\n%@");
      _NSCoreDataLog(17, v27, v28, v29, v30, v31, v32, v33, (uint64_t)a2);
      v34 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412546;
        v40 = (uint64_t)a2;
        v41 = 2112;
        v42 = v26;
        _os_log_fault_impl(&dword_18A253000, v34, OS_LOG_TYPE_FAULT, "CoreData: Multiple zone entires discovered for a single record zone: %@\n%@", buf, 0x16u);
      }
    }
    v26 = (NSManagedObject *)-[NSManagedObject lastObject](v26, "lastObject");
    if (!v26 && a6)
    {
      v35 = +[NSCKDatabaseMetadata databaseMetadataForScope:forStore:inContext:error:]((uint64_t)NSCKDatabaseMetadata, a3, a4, a5, a7);
      if (v35)
      {
        v36 = v35;
        v26 = +[NSEntityDescription insertNewObjectForEntityForName:inManagedObjectContext:](NSEntityDescription, "insertNewObjectForEntityForName:inManagedObjectContext:", +[NSCKRecordZoneMetadata entityPath](NSCKRecordZoneMetadata, "entityPath"), a5);
        -[NSManagedObject setCkRecordZoneName:](v26, "setCkRecordZoneName:", objc_msgSend(a2, "zoneName"));
        -[NSManagedObject setCkOwnerName:](v26, "setCkOwnerName:", objc_msgSend(a2, "ownerName"));
        -[NSManagedObject setDatabase:](v26, "setDatabase:", v36);
        objc_msgSend(a5, "assignObject:toPersistentStore:", v26, a4);
      }
      else
      {
        return 0;
      }
    }
  }
  return v26;
}

+ (id)fetchZoneIDsAssignedToObjectsWithIDs:(id)a3 fromStore:(id)a4 inContext:(id)a5 error:(id *)a6
{
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSFetchRequest *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  uint64_t v29;
  id obj;
  uint64_t v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  void *v42;
  uint8_t buf[4];
  const char *v44;
  __int16 v45;
  int v46;
  _BYTE v47[128];
  id v48;
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v42 = 0;
  v8 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  obj = +[PFCloudKitMetadataModel createMapOfEntityIDToPrimaryKeySetForObjectIDs:](PFCloudKitMetadataModel, "createMapOfEntityIDToPrimaryKeySetForObjectIDs:", a3);
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v49, 16);
  if (v9)
  {
    v29 = *(_QWORD *)v39;
    while (2)
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v39 != v29)
          objc_enumerationMutation(obj);
        v11 = *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * v10);
        v12 = objc_msgSend(obj, "objectForKey:", v11);
        v13 = +[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", +[NSCKRecordMetadata entityPath](NSCKRecordMetadata, "entityPath"));
        -[NSFetchRequest setPredicate:](v13, "setPredicate:", objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("entityId = %@ and entityPK IN %@"), v11, v12));
        -[NSFetchRequest setResultType:](v13, "setResultType:", 2);
        -[NSFetchRequest setPropertiesToFetch:](v13, "setPropertiesToFetch:", &unk_1E1F523C8);
        -[NSFetchRequest setPropertiesToGroupBy:](v13, "setPropertiesToGroupBy:", &unk_1E1F523E0);
        v48 = a4;
        -[NSFetchRequest setAffectedStores:](v13, "setAffectedStores:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v48, 1));
        v14 = (void *)objc_msgSend(a5, "executeFetchRequest:error:", v13, &v42);
        v15 = v14;
        if (!v14)
        {
          if (v42)
          {
            if (a6)
              *a6 = v42;
          }
          else
          {
            v20 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
            _NSCoreDataLog(17, v20, v21, v22, v23, v24, v25, v26, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/NSCKRecordZoneMetadata.m");
            v27 = __pflogFaultLog;
            if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 136315394;
              v44 = "/Library/Caches/com.apple.xbs/Sources/Persistence/NSCKRecordZoneMetadata.m";
              v45 = 1024;
              v46 = 172;
              _os_log_fault_impl(&dword_18A253000, v27, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
            }
          }

          v8 = 0;
          goto LABEL_23;
        }
        v33 = v10;
        v36 = 0u;
        v37 = 0u;
        v34 = 0u;
        v35 = 0u;
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v34, v47, 16);
        if (v16)
        {
          v17 = *(_QWORD *)v35;
          do
          {
            for (i = 0; i != v16; ++i)
            {
              if (*(_QWORD *)v35 != v17)
                objc_enumerationMutation(v15);
              v19 = (void *)objc_msgSend(objc_alloc((Class)getCloudKitCKRecordZoneIDClass[0]()), "initWithZoneName:ownerName:", objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * i), "objectForKey:", CFSTR("recordZone.ckRecordZoneName")), objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * i), "objectForKey:", CFSTR("recordZone.ckOwnerName")));
              objc_msgSend(v8, "addObject:", v19);

            }
            v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v34, v47, 16);
          }
          while (v16);
        }
        v10 = v33 + 1;
      }
      while (v33 + 1 != v9);
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v49, 16);
      if (v9)
        continue;
      break;
    }
  }
LABEL_23:

  return v8;
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
