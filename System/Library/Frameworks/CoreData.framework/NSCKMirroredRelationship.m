@implementation NSCKMirroredRelationship

- (void)createRecordID
{
  void *v1;
  void *v2;

  v1 = a1;
  if (a1)
  {
    v2 = -[NSCKRecordZoneMetadata createRecordZoneID]((void *)objc_msgSend(a1, "recordZone"));
    if (v2)
      v1 = (void *)objc_msgSend(objc_alloc((Class)getCloudKitCKRecordIDClass[0]()), "initWithRecordName:zoneID:", objc_msgSend(v1, "ckRecordID"), v2);
    else
      v1 = 0;

  }
  return v1;
}

- (void)createRecordIDForRecord
{
  void *v1;
  void *v2;

  v1 = a1;
  if (a1)
  {
    v2 = -[NSCKRecordZoneMetadata createRecordZoneID]((void *)objc_msgSend(a1, "recordZone"));
    if (v2)
      v1 = (void *)objc_msgSend(objc_alloc((Class)getCloudKitCKRecordIDClass[0]()), "initWithRecordName:zoneID:", objc_msgSend(v1, "recordName"), v2);
    else
      v1 = 0;

  }
  return v1;
}

- (void)createRecordIDForRelatedRecord
{
  void *v1;
  void *v2;

  v1 = a1;
  if (a1)
  {
    v2 = -[NSCKRecordZoneMetadata createRecordZoneID]((void *)objc_msgSend(a1, "recordZone"));
    if (v2)
      v1 = (void *)objc_msgSend(objc_alloc((Class)getCloudKitCKRecordIDClass[0]()), "initWithRecordName:zoneID:", objc_msgSend(v1, "relatedRecordName"), v2);
    else
      v1 = 0;

  }
  return v1;
}

- (BOOL)updateRelationshipValueUsingImportContext:(void *)a3 andManagedObjectContext:(int)a4 isDelete:(uint64_t *)a5 error:
{
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  char v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  NSObject *v34;
  uint8_t buf[4];
  const char *v36;
  __int16 v37;
  int v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  if (!result)
    return result;
  v9 = (void *)result;
  v10 = (id)objc_msgSend((id)objc_msgSend(a3, "persistentStoreCoordinator"), "managedObjectModel");
  v11 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v10, "entitiesByName"), "objectForKey:", objc_msgSend(v9, "cdEntityName")), "propertiesByName"), "objectForKey:", objc_msgSend(v9, "relationshipName"));
  v12 = -[NSCKMirroredRelationship createRecordIDForRecord](v9);
  v13 = -[NSCKMirroredRelationship createRecordIDForRelatedRecord](v9);
  v14 = objc_msgSend((id)objc_msgSend(v11, "entity"), "name");
  if (a2)
    v15 = objc_msgSend((id)objc_msgSend(*(id *)(a2 + 64), "objectForKey:", v14), "objectForKey:", v12);
  else
    v15 = 0;
  v16 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v11, "inverseRelationship"), "entity"), "name");
  if (a2)
  {
    v17 = objc_msgSend((id)objc_msgSend(*(id *)(a2 + 64), "objectForKey:", v16), "objectForKey:", v13);
    if (v15)
    {
      v18 = v17;
      if (v17)
      {
        v19 = (void *)objc_msgSend(a3, "objectWithID:", v15);
        v20 = objc_msgSend(a3, "objectWithID:", v18);
        v21 = (id)objc_msgSend((id)objc_msgSend(v19, "valueForKey:", objc_msgSend(v11, "name")), "mutableCopy");
        if (!v21)
          v21 = objc_alloc_init(MEMORY[0x1E0C99E20]);
        if (a4)
          objc_msgSend(v21, "removeObject:", v20);
        else
          objc_msgSend(v21, "addObject:", v20);
        objc_msgSend(v19, "setValue:forKey:", v21, objc_msgSend(v11, "name"));

        v22 = 0;
        v23 = 1;
        goto LABEL_18;
      }
      goto LABEL_15;
    }
LABEL_16:
    v24 = (void *)MEMORY[0x1E0CB35C8];
    v25 = *MEMORY[0x1E0CB28A8];
    v26 = 134413;
    goto LABEL_17;
  }
  if (!v15)
    goto LABEL_16;
LABEL_15:
  v24 = (void *)MEMORY[0x1E0CB35C8];
  v25 = *MEMORY[0x1E0CB28A8];
  v26 = 134412;
LABEL_17:
  v22 = objc_msgSend(v24, "errorWithDomain:code:userInfo:", v25, v26, 0);
  v23 = 0;
LABEL_18:

  if ((v23 & 1) != 0)
    return 1;
  if (v22)
  {
    if (a5)
    {
      result = 0;
      *a5 = v22;
      return result;
    }
  }
  else
  {
    v27 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
    _NSCoreDataLog(17, v27, v28, v29, v30, v31, v32, v33, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/NSCKMirroredRelationship.m");
    v34 = __pflogFaultLog;
    result = os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT);
    if (!result)
      return result;
    *(_DWORD *)buf = 136315394;
    v36 = "/Library/Caches/com.apple.xbs/Sources/Persistence/NSCKMirroredRelationship.m";
    v37 = 1024;
    v38 = 114;
    _os_log_fault_impl(&dword_18A253000, v34, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
  }
  return 0;
}

+ (id)fetchMirroredRelationshipsMatchingRelatingRecords:(void *)a3 andRelatingRecordIDs:(uint64_t)a4 fromStore:(void *)a5 inManagedObjectContext:(_QWORD *)a6 error:
{
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  NSFetchRequest *v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  NSObject *v36;
  id v37;
  id v42;
  __int128 v43;
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
  id v55;
  uint8_t buf[4];
  const char *v57;
  __int16 v58;
  int v59;
  uint64_t v60;
  _BYTE v61[128];
  _BYTE v62[128];
  _BYTE v63[128];
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  objc_opt_self();
  v55 = 0;
  v42 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v53 = 0u;
  v54 = 0u;
  v51 = 0u;
  v52 = 0u;
  v9 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v51, v63, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v52;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v52 != v10)
          objc_enumerationMutation(a3);
        v12 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * i);
        v13 = (id)objc_msgSend(v8, "objectForKey:", objc_msgSend(v12, "zoneID"));
        if (!v13)
        {
          v13 = objc_alloc_init(MEMORY[0x1E0C99E20]);
          objc_msgSend(v8, "setObject:forKey:", v13, objc_msgSend(v12, "zoneID"));
        }
        objc_msgSend(v13, "addObject:", objc_msgSend(v12, "recordName"));

      }
      v9 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v51, v63, 16);
    }
    while (v9);
  }
  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  v14 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v47, v62, 16);
  if (v14)
  {
    v15 = *(_QWORD *)v48;
    do
    {
      for (j = 0; j != v14; ++j)
      {
        if (*(_QWORD *)v48 != v15)
          objc_enumerationMutation(a2);
        v17 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * j);
        v18 = (id)objc_msgSend(v8, "objectForKey:", objc_msgSend((id)objc_msgSend(v17, "recordID"), "zoneID"));
        if (!v18)
        {
          v18 = objc_alloc_init(MEMORY[0x1E0C99E20]);
          objc_msgSend(v8, "setObject:forKey:", v18, objc_msgSend((id)objc_msgSend(v17, "recordID"), "zoneID"));
        }
        objc_msgSend(v18, "addObject:", objc_msgSend((id)objc_msgSend(v17, "recordID"), "recordName"));

      }
      v14 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v47, v62, 16);
    }
    while (v14);
  }
  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  v19 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v43, v61, 16);
  if (v19)
  {
    v20 = *(_QWORD *)v44;
LABEL_21:
    v21 = 0;
    while (1)
    {
      if (*(_QWORD *)v44 != v20)
        objc_enumerationMutation(v8);
      v22 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * v21);
      v23 = (void *)MEMORY[0x18D76B4E4]();
      v24 = +[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", +[NSCKMirroredRelationship entityPath](NSCKMirroredRelationship, "entityPath"));
      v25 = objc_msgSend(v8, "objectForKey:", v22);
      -[NSFetchRequest setPredicate:](v24, "setPredicate:", objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(ckRecordID IN %@ OR recordName IN %@ OR relatedRecordName IN %@) AND recordZone.ckRecordZoneName = %@ AND recordZone.ckOwnerName = %@"), v25, v25, v25, objc_msgSend(v22, "zoneName"), objc_msgSend(v22, "ownerName")));
      v60 = a4;
      -[NSFetchRequest setAffectedStores:](v24, "setAffectedStores:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v60, 1));
      -[NSFetchRequest setRelationshipKeyPathsForPrefetching:](v24, "setRelationshipKeyPathsForPrefetching:", &unk_1E1F525C0);
      -[NSFetchRequest setReturnsObjectsAsFaults:](v24, "setReturnsObjectsAsFaults:", 0);
      v26 = objc_msgSend(a5, "executeFetchRequest:error:", v24, &v55);
      if (v26)
      {
        objc_msgSend(v42, "addObjectsFromArray:", v26);
      }
      else
      {
        v27 = v55;

        v42 = 0;
      }
      objc_autoreleasePoolPop(v23);
      if (!v26)
        break;
      if (v19 == ++v21)
      {
        v19 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v43, v61, 16);
        if (v19)
          goto LABEL_21;
        break;
      }
    }
  }
  if (!v42)
  {
    v28 = v55;
    if (v28)
    {
      if (a6)
      {
        v42 = 0;
        *a6 = v28;
        goto LABEL_37;
      }
    }
    else
    {
      v29 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
      _NSCoreDataLog(17, v29, v30, v31, v32, v33, v34, v35, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/NSCKMirroredRelationship.m");
      v36 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        v57 = "/Library/Caches/com.apple.xbs/Sources/Persistence/NSCKMirroredRelationship.m";
        v58 = 1024;
        v59 = 172;
        _os_log_fault_impl(&dword_18A253000, v36, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
      }
    }
    v42 = 0;
  }
LABEL_37:

  v55 = 0;
  v37 = v42;
  return v42;
}

+ (uint64_t)fetchPendingMirroredRelationshipsInStore:(void *)a3 withManagedObjectContext:(_QWORD *)a4 error:
{
  NSFetchRequest *v7;
  uint64_t v8;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  int v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  objc_opt_self();
  v18 = 0;
  v7 = +[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", +[NSCKMirroredRelationship entityPath](NSCKMirroredRelationship, "entityPath"));
  v23[0] = a2;
  -[NSFetchRequest setAffectedStores:](v7, "setAffectedStores:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 1));
  -[NSFetchRequest setPredicate:](v7, "setPredicate:", objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("isPending == 1")));
  v8 = objc_msgSend(a3, "executeFetchRequest:error:", v7, &v18);
  if (!v8)
  {
    if (v18)
    {
      if (a4)
        *a4 = v18;
    }
    else
    {
      v10 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
      _NSCoreDataLog(17, v10, v11, v12, v13, v14, v15, v16, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/NSCKMirroredRelationship.m");
      v17 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        v20 = "/Library/Caches/com.apple.xbs/Sources/Persistence/NSCKMirroredRelationship.m";
        v21 = 1024;
        v22 = 193;
        _os_log_fault_impl(&dword_18A253000, v17, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
      }
    }
  }
  return v8;
}

+ (void)mirroredRelationshipForManyToMany:(uint64_t)a3 inStore:(void *)a4 withManagedObjectContext:(uint64_t)a5 error:
{
  NSFetchRequest *v9;
  void *v10;
  void *result;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  uint8_t buf[4];
  uint64_t v22;
  __int16 v23;
  void *v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  objc_opt_self();
  v9 = +[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", +[NSCKMirroredRelationship entityPath](NSCKMirroredRelationship, "entityPath"));
  v25[0] = a3;
  -[NSFetchRequest setAffectedStores:](v9, "setAffectedStores:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 1));
  if (a2)
    v10 = *(void **)(a2 + 32);
  else
    v10 = 0;
  -[NSFetchRequest setPredicate:](v9, "setPredicate:", objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("ckRecordID = %@"), objc_msgSend(v10, "recordName")));
  result = (void *)objc_msgSend(a4, "executeFetchRequest:error:", v9, a5);
  if (result)
  {
    v12 = result;
    if ((unint64_t)objc_msgSend(result, "count") >= 2)
    {
      v13 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Found more than one mirrored relationship matching a many to many: %@\n%@");
      _NSCoreDataLog(17, v13, v14, v15, v16, v17, v18, v19, a2);
      v20 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412546;
        v22 = a2;
        v23 = 2112;
        v24 = v12;
        _os_log_fault_impl(&dword_18A253000, v20, OS_LOG_TYPE_FAULT, "CoreData: Found more than one mirrored relationship matching a many to many: %@\n%@", buf, 0x16u);
      }
    }
    return (void *)objc_msgSend(v12, "lastObject");
  }
  return result;
}

+ (NSManagedObject)insertMirroredRelationshipForManyToMany:(uint64_t)a3 inZoneWithMetadata:(uint64_t)a4 inStore:(void *)a5 withManagedObjectContext:
{
  NSManagedObject *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;

  objc_opt_self();
  v9 = +[NSEntityDescription insertNewObjectForEntityForName:inManagedObjectContext:](NSEntityDescription, "insertNewObjectForEntityForName:inManagedObjectContext:", +[NSCKMirroredRelationship entityPath](NSCKMirroredRelationship, "entityPath"), a5);
  objc_msgSend(a5, "assignObject:toPersistentStore:", v9, a4);
  if (a2)
  {
    -[NSManagedObject setCkRecordID:](v9, "setCkRecordID:", objc_msgSend(*(id *)(a2 + 32), "recordName"));
    v10 = *(void **)(a2 + 16);
  }
  else
  {
    -[NSManagedObject setCkRecordID:](v9, "setCkRecordID:", objc_msgSend(0, "recordName"));
    v10 = 0;
  }
  -[NSManagedObject setCdEntityName:](v9, "setCdEntityName:", objc_msgSend((id)objc_msgSend(v10, "entity"), "name"));
  if (a2)
  {
    -[NSManagedObject setRecordName:](v9, "setRecordName:", objc_msgSend(*(id *)(a2 + 48), "recordName"));
    v11 = *(void **)(a2 + 24);
  }
  else
  {
    -[NSManagedObject setRecordName:](v9, "setRecordName:", objc_msgSend(0, "recordName"));
    v11 = 0;
  }
  -[NSManagedObject setRelatedEntityName:](v9, "setRelatedEntityName:", objc_msgSend((id)objc_msgSend(v11, "entity"), "name"));
  if (a2)
  {
    -[NSManagedObject setRelatedRecordName:](v9, "setRelatedRecordName:", objc_msgSend(*(id *)(a2 + 56), "recordName"));
    v12 = *(void **)(a2 + 16);
  }
  else
  {
    -[NSManagedObject setRelatedRecordName:](v9, "setRelatedRecordName:", objc_msgSend(0, "recordName"));
    v12 = 0;
  }
  -[NSManagedObject setRelationshipName:](v9, "setRelationshipName:", objc_msgSend(v12, "name"));
  v13 = MEMORY[0x1E0C9AAA0];
  -[NSManagedObject setIsPending:](v9, "setIsPending:", MEMORY[0x1E0C9AAA0]);
  -[NSManagedObject setIsUploaded:](v9, "setIsUploaded:", v13);
  -[NSManagedObject setNeedsDelete:](v9, "setNeedsDelete:", v13);
  -[NSManagedObject setRecordZone:](v9, "setRecordZone:", a3);
  return v9;
}

+ (uint64_t)purgeMirroredRelationshipsWithRecordIDs:(uint64_t)a3 fromStore:(void *)a4 withManagedObjectContext:(_QWORD *)a5 error:
{
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  id v13;
  NSFetchRequest *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t k;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  NSObject *v38;
  __int128 v41;
  __int128 v42;
  __int128 v43;
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
  __int128 v56;
  uint64_t v57;
  uint8_t buf[4];
  const char *v59;
  __int16 v60;
  int v61;
  _BYTE v62[128];
  _BYTE v63[128];
  _BYTE v64[128];
  uint64_t v65;
  _BYTE v66[128];
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  objc_opt_self();
  v57 = 0;
  v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  v9 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v53, v66, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v54;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v54 != v10)
          objc_enumerationMutation(a2);
        v12 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * i);
        v13 = (id)objc_msgSend(v8, "objectForKey:", objc_msgSend(v12, "zoneID"));
        if (!v13)
        {
          v13 = objc_alloc_init(MEMORY[0x1E0C99E20]);
          objc_msgSend(v8, "setObject:forKey:", v13, objc_msgSend(v12, "zoneID"));
        }
        objc_msgSend(v13, "addObject:", objc_msgSend(v12, "recordName"));

      }
      v9 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v53, v66, 16);
    }
    while (v9);
  }
  v14 = +[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", +[NSCKMirroredRelationship entityPath](NSCKMirroredRelationship, "entityPath"));
  v65 = a3;
  -[NSFetchRequest setAffectedStores:](v14, "setAffectedStores:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v65, 1));
  v51 = 0u;
  v52 = 0u;
  v49 = 0u;
  v50 = 0u;
  v15 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v49, v64, 16);
  if (v15)
  {
    v16 = *(_QWORD *)v50;
LABEL_12:
    v17 = 0;
    while (1)
    {
      if (*(_QWORD *)v50 != v16)
        objc_enumerationMutation(v8);
      v18 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * v17);
      v19 = objc_msgSend(v8, "objectForKey:", v18);
      -[NSFetchRequest setPredicate:](v14, "setPredicate:", objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("((recordZone.ckRecordZoneName = %@) AND (recordZone.ckOwnerName = %@) AND (ckRecordID IN %@))"), objc_msgSend(v18, "zoneName"), objc_msgSend(v18, "ownerName"), v19));
      v20 = (void *)objc_msgSend(a4, "executeFetchRequest:error:", v14, &v57);
      v21 = v20;
      if (!v20)
        goto LABEL_34;
      v47 = 0u;
      v48 = 0u;
      v45 = 0u;
      v46 = 0u;
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v45, v63, 16);
      if (v22)
      {
        v23 = *(_QWORD *)v46;
        do
        {
          for (j = 0; j != v22; ++j)
          {
            if (*(_QWORD *)v46 != v23)
              objc_enumerationMutation(v21);
            objc_msgSend(a4, "deleteObject:", *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * j));
          }
          v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v45, v63, 16);
        }
        while (v22);
      }
      if (++v17 == v15)
      {
        v15 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v49, v64, 16);
        if (v15)
          goto LABEL_12;
        break;
      }
    }
  }
  -[NSFetchRequest setPredicate:](v14, "setPredicate:", objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(needsDelete = 1 AND isUploaded = 1)")));
  v25 = (void *)objc_msgSend(a4, "executeFetchRequest:error:", v14, &v57);
  v26 = v25;
  if (!v25)
  {
LABEL_34:
    v30 = 0;
    goto LABEL_35;
  }
  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v41, v62, 16);
  if (v27)
  {
    v28 = *(_QWORD *)v42;
    do
    {
      for (k = 0; k != v27; ++k)
      {
        if (*(_QWORD *)v42 != v28)
          objc_enumerationMutation(v26);
        objc_msgSend(a4, "deleteObject:", *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * k));
      }
      v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v41, v62, 16);
    }
    while (v27);
  }
  v30 = 1;
LABEL_35:

  if ((v30 & 1) == 0)
  {
    if (v57)
    {
      if (a5)
        *a5 = v57;
    }
    else
    {
      v31 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
      _NSCoreDataLog(17, v31, v32, v33, v34, v35, v36, v37, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/NSCKMirroredRelationship.m");
      v38 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        v59 = "/Library/Caches/com.apple.xbs/Sources/Persistence/NSCKMirroredRelationship.m";
        v60 = 1024;
        v61 = 332;
        _os_log_fault_impl(&dword_18A253000, v38, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
      }
    }
  }
  return v30;
}

+ (id)markRelationshipsForDeletedRecordIDs:(uint64_t)a3 inStore:(void *)a4 withManagedObjectContext:(_QWORD *)a5 error:
{
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  id v14;
  NSFetchRequest *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  void *v27;
  void *v28;
  id v29;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  NSObject *v38;
  _QWORD *v39;
  NSFetchRequest *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v44;
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
  __int128 v56;
  uint64_t v57;
  uint8_t buf[4];
  const char *v59;
  __int16 v60;
  int v61;
  _BYTE v62[128];
  _BYTE v63[128];
  uint64_t v64;
  _BYTE v65[128];
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  objc_opt_self();
  v57 = 0;
  if (!objc_msgSend(a2, "count"))
    return (id)NSSet_EmptySet;
  v39 = a5;
  v8 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v9 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  v10 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v53, v65, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v54;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v54 != v11)
          objc_enumerationMutation(a2);
        v13 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * i);
        v14 = (id)objc_msgSend(v9, "objectForKey:", objc_msgSend(v13, "zoneID"));
        if (!v14)
        {
          v14 = objc_alloc_init(MEMORY[0x1E0C99E20]);
          objc_msgSend(v9, "setObject:forKey:", v14, objc_msgSend(v13, "zoneID"));
        }
        objc_msgSend(v14, "addObject:", objc_msgSend(v13, "recordName"));

      }
      v10 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v53, v65, 16);
    }
    while (v10);
  }
  v15 = +[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", +[NSCKMirroredRelationship entityPath](NSCKMirroredRelationship, "entityPath"));
  v64 = a3;
  -[NSFetchRequest setAffectedStores:](v15, "setAffectedStores:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v64, 1));
  v51 = 0u;
  v52 = 0u;
  v49 = 0u;
  v50 = 0u;
  v16 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v49, v63, 16);
  if (v16)
  {
    v42 = *(_QWORD *)v50;
    v17 = MEMORY[0x1E0C9AAB0];
    v18 = MEMORY[0x1E0C9AAA0];
    v40 = v15;
LABEL_13:
    v19 = 0;
    v41 = v16;
    while (1)
    {
      if (*(_QWORD *)v50 != v42)
        objc_enumerationMutation(v9);
      v44 = v19;
      v20 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * v19);
      v21 = objc_msgSend(v9, "objectForKey:", v20);
      -[NSFetchRequest setPredicate:](v15, "setPredicate:", objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("((recordZone.ckRecordZoneName = %@) AND (recordZone.ckOwnerName = %@) AND ((recordName IN %@) OR (relatedRecordName IN %@))) OR needsDelete = 1"), objc_msgSend(v20, "zoneName"), objc_msgSend(v20, "ownerName"), v21, v21));
      v22 = (void *)objc_msgSend(a4, "executeFetchRequest:error:", v15, &v57);
      v23 = v22;
      if (!v22)
        break;
      v47 = 0u;
      v48 = 0u;
      v45 = 0u;
      v46 = 0u;
      v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v45, v62, 16);
      if (v24)
      {
        v25 = *(_QWORD *)v46;
        do
        {
          for (j = 0; j != v24; ++j)
          {
            if (*(_QWORD *)v46 != v25)
              objc_enumerationMutation(v23);
            v27 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * j);
            v28 = -[NSCKMirroredRelationship createRecordID](v27);
            objc_msgSend(v8, "addObject:", v28);

            objc_msgSend(v27, "setNeedsDelete:", v17);
            objc_msgSend(v27, "setIsUploaded:", v18);
          }
          v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v45, v62, 16);
        }
        while (v24);
      }
      v19 = v44 + 1;
      v15 = v40;
      if (v44 + 1 == v41)
      {
        v16 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v49, v63, 16);
        if (v16)
          goto LABEL_13;
        goto LABEL_26;
      }
    }
    if (v57)
    {
      if (v39)
      {
        v29 = 0;
        *v39 = v57;
        goto LABEL_34;
      }
    }
    else
    {
      v31 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
      _NSCoreDataLog(17, v31, v32, v33, v34, v35, v36, v37, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/NSCKMirroredRelationship.m");
      v38 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        v59 = "/Library/Caches/com.apple.xbs/Sources/Persistence/NSCKMirroredRelationship.m";
        v60 = 1024;
        v61 = 386;
        _os_log_fault_impl(&dword_18A253000, v38, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
      }
    }
    v29 = 0;
  }
  else
  {
LABEL_26:
    v29 = (id)objc_msgSend(v8, "copy");
  }
LABEL_34:

  return v29;
}

+ (BOOL)updateMirroredRelationshipsMatchingRecords:(uint64_t)a3 forStore:(void *)a4 withManagedObjectContext:(uint64_t)a5 usingBlock:(_QWORD *)a6 error:
{
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t j;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t k;
  _BOOL8 result;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  NSObject *v45;
  _QWORD *v46;
  uint64_t v47;
  id v48;
  id obj;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  uint64_t v62;
  uint8_t buf[4];
  const char *v64;
  __int16 v65;
  int v66;
  _BYTE v67[128];
  _BYTE v68[128];
  _BYTE v69[128];
  uint64_t v70;

  v70 = *MEMORY[0x1E0C80C00];
  objc_opt_self();
  v62 = 0;
  obj = +[NSCKMirroredRelationship fetchMirroredRelationshipsMatchingRelatingRecords:andRelatingRecordIDs:fromStore:inManagedObjectContext:error:]((uint64_t)NSCKMirroredRelationship, a2, MEMORY[0x1E0C9AA60], a3, a4, &v62);
  if (obj)
  {
    v46 = a6;
    v47 = a5;
    v11 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v48 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v58 = 0u;
    v59 = 0u;
    v60 = 0u;
    v61 = 0u;
    v12 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v58, v69, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v59;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v59 != v14)
            objc_enumerationMutation(a2);
          v16 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * i);
          if (objc_msgSend((id)objc_msgSend(v16, "recordType"), "isEqualToString:", CFSTR("CDMR")))
          {
            objc_msgSend(v48, "setObject:forKey:", v16, objc_msgSend(v16, "recordID"));
            objc_msgSend(v11, "addObject:", objc_msgSend(v16, "recordID"));
          }
          else
          {
            v17 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Attempted to update a mirrored relationship with a non-mirrored-relationship record: %@");
            _NSCoreDataLog(17, v17, v18, v19, v20, v21, v22, v23, (uint64_t)v16);
            v24 = __pflogFaultLog;
            if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 138412290;
              v64 = (const char *)v16;
              _os_log_fault_impl(&dword_18A253000, v24, OS_LOG_TYPE_FAULT, "CoreData: Attempted to update a mirrored relationship with a non-mirrored-relationship record: %@", buf, 0xCu);
            }
          }
        }
        v13 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v58, v69, 16);
      }
      while (v13);
    }
    v25 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v54 = 0u;
    v55 = 0u;
    v56 = 0u;
    v57 = 0u;
    v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v68, 16);
    if (v26)
    {
      v27 = v26;
      v28 = *(_QWORD *)v55;
      do
      {
        for (j = 0; j != v27; ++j)
        {
          if (*(_QWORD *)v55 != v28)
            objc_enumerationMutation(obj);
          v30 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * j);
          v31 = (void *)objc_msgSend(objc_alloc((Class)getCloudKitCKRecordZoneIDClass[0]()), "initWithZoneName:ownerName:", objc_msgSend((id)objc_msgSend(v30, "recordZone"), "ckRecordZoneName"), objc_msgSend((id)objc_msgSend(v30, "recordZone"), "ckOwnerName"));
          v32 = (void *)objc_msgSend(objc_alloc((Class)getCloudKitCKRecordIDClass[0]()), "initWithRecordName:zoneID:", objc_msgSend(v30, "ckRecordID"), v31);
          objc_msgSend(v25, "setObject:forKey:", v30, v32);
          objc_msgSend(v11, "addObject:", v32);

        }
        v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v68, 16);
      }
      while (v27);
    }
    v52 = 0u;
    v53 = 0u;
    v50 = 0u;
    v51 = 0u;
    v33 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v50, v67, 16);
    if (v33)
    {
      v34 = v33;
      v35 = *(_QWORD *)v51;
      while (2)
      {
        for (k = 0; k != v34; ++k)
        {
          if (*(_QWORD *)v51 != v35)
            objc_enumerationMutation(v11);
          if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t, uint64_t *))(v47 + 16))(v47, objc_msgSend(v25, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v50 + 1) + 8 * k)), objc_msgSend(v48, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v50 + 1) + 8 * k)), &v62))
          {

            a6 = v46;
            goto LABEL_30;
          }
        }
        v34 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v50, v67, 16);
        if (v34)
          continue;
        break;
      }
    }

    return 1;
  }
  else
  {
LABEL_30:
    if (v62)
    {
      if (a6)
      {
        result = 0;
        *a6 = v62;
        return result;
      }
    }
    else
    {
      v38 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
      _NSCoreDataLog(17, v38, v39, v40, v41, v42, v43, v44, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/NSCKMirroredRelationship.m");
      v45 = __pflogFaultLog;
      result = os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT);
      if (!result)
        return result;
      *(_DWORD *)buf = 136315394;
      v64 = "/Library/Caches/com.apple.xbs/Sources/Persistence/NSCKMirroredRelationship.m";
      v65 = 1024;
      v66 = 456;
      _os_log_fault_impl(&dword_18A253000, v45, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
    }
    return 0;
  }
}

+ (uint64_t)fetchMirroredRelationshipsMatchingPredicate:(uint64_t)a3 fromStore:(void *)a4 inManagedObjectContext:(uint64_t)a5 error:
{
  NSFetchRequest *v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  objc_opt_self();
  v9 = +[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", +[NSCKMirroredRelationship entityPath](NSCKMirroredRelationship, "entityPath"));
  v11[0] = a3;
  -[NSFetchRequest setAffectedStores:](v9, "setAffectedStores:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1));
  -[NSFetchRequest setFetchBatchSize:](v9, "setFetchBatchSize:", 1000);
  -[NSFetchRequest setPredicate:](v9, "setPredicate:", a2);
  return objc_msgSend(a4, "executeFetchRequest:error:", v9, a5);
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

+ (uint64_t)countMirroredRelationshipsInStore:(uint64_t)a3 matchingPredicate:(uint64_t)a4 withManagedObjectContext:(id *)a5 error:
{
  NSFetchRequest *v9;
  uint64_t v10;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  objc_opt_self();
  v9 = +[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", +[NSCKMirroredRelationship entityPath](NSCKMirroredRelationship, "entityPath"));
  -[NSFetchRequest setPredicate:](v9, "setPredicate:", a3);
  -[NSFetchRequest setResultType:](v9, "setResultType:", 4);
  v12[0] = a2;
  -[NSFetchRequest setAffectedStores:](v9, "setAffectedStores:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1));
  if (a4)
  {
    v10 = -[NSManagedObjectContext _countForFetchRequest_:error:](a4, v9, a5);
    if (v10 == 0x7FFFFFFFFFFFFFFFLL)
      return 0;
  }
  else
  {
    v10 = 0;
  }
  return objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v10);
}

@end
