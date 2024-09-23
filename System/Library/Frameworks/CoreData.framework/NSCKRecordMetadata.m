@implementation NSCKRecordMetadata

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

- (uint64_t)createRecordID
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  if (!objc_msgSend(a1, "recordZone"))
    goto LABEL_8;
  v2 = -[NSCKRecordZoneMetadata createRecordZoneID]((void *)objc_msgSend(a1, "recordZone"));
  if (!v2 || !objc_msgSend(a1, "ckRecordName"))
  {

    goto LABEL_8;
  }
  v3 = objc_msgSend(objc_alloc((Class)getCloudKitCKRecordIDClass[0]()), "initWithRecordName:zoneID:", objc_msgSend(a1, "ckRecordName"), v2);

  if (!v3)
  {
LABEL_8:
    v4 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "createRecordID called before the record has the necessary properties: %@");
    _NSCoreDataLog(17, v4, v5, v6, v7, v8, v9, v10, (uint64_t)a1);
    v11 = __pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      v14 = a1;
      _os_log_fault_impl(&dword_18A253000, v11, OS_LOG_TYPE_FAULT, "CoreData: createRecordID called before the record has the necessary properties: %@", buf, 0xCu);
    }
    return 0;
  }
  return v3;
}

- (id)createRecordFromSystemFields
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint8_t buf[4];
  uint64_t v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  NSCKRecordMetadata *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v3 = -[NSCKRecordMetadata ckRecordSystemFields](self, "ckRecordSystemFields");
  if (v3)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3710]), "initForReadingFromData:error:", v3, 0);
    v5 = (void *)objc_msgSend(objc_alloc((Class)getCloudKitCKRecordClass[0]()), "initWithCoder:", v4);
    if ((objc_msgSend((id)-[NSCKRecordMetadata ckRecordName](self, "ckRecordName"), "isEqualToString:", objc_msgSend((id)objc_msgSend(v5, "recordID"), "recordName")) & 1) != 0)
    {
      if ((objc_msgSend((id)objc_msgSend(v5, "recordType"), "hasPrefix:", CFSTR("CD_")) & 1) != 0)
        goto LABEL_10;
      v16 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSCKRecordMetadata: System fields record type doesn't match new schema: %@\n%@\n%@");
      v17 = -[NSCKRecordMetadata ckRecordName](self, "ckRecordName");
      objc_msgSend(v5, "recordID");
      _NSCoreDataLog(17, v16, v18, v19, v20, v21, v22, v23, v17);
      v14 = __pflogFaultLog;
      if (!os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
LABEL_9:

        v5 = 0;
LABEL_10:
        objc_msgSend(v4, "finishDecoding");

        return v5;
      }
      *(_DWORD *)buf = 138412802;
      v26 = -[NSCKRecordMetadata ckRecordName](self, "ckRecordName");
      v27 = 2112;
      v28 = objc_msgSend(v5, "recordID");
      v29 = 2112;
      v30 = self;
      v15 = "CoreData: NSCKRecordMetadata: System fields record type doesn't match new schema: %@\n%@\n%@";
    }
    else
    {
      v6 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NCKRecordMetadata: System fields record name doesn't match row: %@\n%@\n%@");
      v7 = -[NSCKRecordMetadata ckRecordName](self, "ckRecordName");
      objc_msgSend(v5, "recordID");
      _NSCoreDataLog(17, v6, v8, v9, v10, v11, v12, v13, v7);
      v14 = __pflogFaultLog;
      if (!os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
        goto LABEL_9;
      *(_DWORD *)buf = 138412802;
      v26 = -[NSCKRecordMetadata ckRecordName](self, "ckRecordName");
      v27 = 2112;
      v28 = objc_msgSend(v5, "recordID");
      v29 = 2112;
      v30 = self;
      v15 = "CoreData: NCKRecordMetadata: System fields record name doesn't match row: %@\n%@\n%@";
    }
    _os_log_fault_impl(&dword_18A253000, v14, OS_LOG_TYPE_FAULT, v15, buf, 0x20u);
    goto LABEL_9;
  }
  return 0;
}

- (void)createObjectIDForLinkedRow
{
  if (result)
    return (void *)+[NSCKRecordMetadata createObjectIDForEntityID:primaryKey:inSQLCore:]((uint64_t)NSCKRecordMetadata, (void *)objc_msgSend(result, "entityId"), (void *)objc_msgSend(result, "entityPK"), (void *)objc_msgSend((id)objc_msgSend(result, "objectID"), "persistentStore"));
  return result;
}

+ (uint64_t)createObjectIDForEntityID:(void *)a3 primaryKey:(void *)a4 inSQLCore:
{
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const void *v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  NSObject *v21;
  uint32_t v22;
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
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint8_t buf[4];
  void *v39;
  __int16 v40;
  void *v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  objc_opt_self();
  v7 = objc_msgSend(a2, "unsignedLongValue");
  v8 = objc_msgSend(a3, "integerValue");
  if (v7)
  {
    v9 = v8;
    v10 = _sqlCoreLookupSQLEntityForEntityID(a4, v7);
    if (v10)
    {
      if (v9 >= 1)
        return objc_msgSend(a4, "newObjectIDForEntity:pk:", v10, v9);
      v31 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Cannot create objectID: called before the record has the necessary properties (primaryKey): %@ / %@");
      _NSCoreDataLog(17, v31, v32, v33, v34, v35, v36, v37, (uint64_t)a2);
      v30 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412546;
        v39 = a2;
        v40 = 2112;
        v41 = a4;
        v20 = "CoreData: Cannot create objectID: called before the record has the necessary properties (primaryKey): %@ / %@";
        goto LABEL_11;
      }
    }
    else
    {
      v23 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Cannot create objectID. Unable to find entity with id '%@' in store '%@'");
      _NSCoreDataLog(17, v23, v24, v25, v26, v27, v28, v29, (uint64_t)a2);
      v30 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412546;
        v39 = a2;
        v40 = 2112;
        v41 = a4;
        v20 = "CoreData: Cannot create objectID. Unable to find entity with id '%@' in store '%@'";
LABEL_11:
        v21 = v30;
        v22 = 22;
        goto LABEL_12;
      }
    }
  }
  else
  {
    v12 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Cannot create objectID: called before the record has the necessary properties (entityID): %@");
    _NSCoreDataLog(17, v12, v13, v14, v15, v16, v17, v18, (uint64_t)a4);
    v19 = __pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      v39 = a4;
      v20 = "CoreData: Cannot create objectID: called before the record has the necessary properties (entityID): %@";
      v21 = v19;
      v22 = 12;
LABEL_12:
      _os_log_fault_impl(&dword_18A253000, v21, OS_LOG_TYPE_FAULT, v20, buf, v22);
    }
  }
  return 0;
}

+ (uint64_t)createObjectIDFromMetadataDictionary:(void *)a3 inSQLCore:
{
  objc_opt_self();
  return +[NSCKRecordMetadata createObjectIDForEntityID:primaryKey:inSQLCore:]((uint64_t)NSCKRecordMetadata, (void *)objc_msgSend(a2, "objectForKey:", CFSTR("entityId")), (void *)objc_msgSend(a2, "objectForKey:", CFSTR("entityPK")), a3);
}

+ (uint64_t)metadataForObject:(void *)a3 inManagedObjectContext:(_QWORD *)a4 error:
{
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v22;
  uint8_t buf[4];
  uint64_t v24;
  __int16 v25;
  uint64_t v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  objc_opt_self();
  v22 = 0;
  v27[0] = objc_msgSend(a2, "objectID");
  v7 = +[NSCKRecordMetadata metadataForObjectIDs:inStore:withManagedObjectContext:error:]((uint64_t)NSCKRecordMetadata, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 1), objc_msgSend((id)objc_msgSend(a2, "objectID"), "persistentStore"), a3, &v22);
  if (v7)
  {
    v8 = v7;
    v9 = objc_msgSend(v7, "lastObject");
    if ((unint64_t)objc_msgSend(v8, "count") >= 2)
    {
      v10 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Found more than one instance of NSCKRecordMetadata for object: %s\n%s");
      v11 = objc_msgSend((id)objc_msgSend(a2, "description"), "cStringUsingEncoding:", 4);
      objc_msgSend((id)objc_msgSend(v8, "description"), "cStringUsingEncoding:", 4);
      _NSCoreDataLog(17, v10, v12, v13, v14, v15, v16, v17, v11);
      v18 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        v19 = objc_msgSend((id)objc_msgSend(a2, "description"), "cStringUsingEncoding:", 4);
        v20 = objc_msgSend((id)objc_msgSend(v8, "description"), "cStringUsingEncoding:", 4);
        *(_DWORD *)buf = 136315394;
        v24 = v19;
        v25 = 2080;
        v26 = v20;
        _os_log_fault_impl(&dword_18A253000, v18, OS_LOG_TYPE_FAULT, "CoreData: Found more than one instance of NSCKRecordMetadata for object: %s\n%s", buf, 0x16u);
      }
    }
  }
  else
  {
    v9 = 0;
  }
  if (a4 && v22)
    *a4 = v22;
  return v9;
}

+ (id)metadataForObjectIDs:(uint64_t)a3 inStore:(void *)a4 withManagedObjectContext:(_QWORD *)a5 error:
{
  id v8;
  NSFetchRequest *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  NSObject *v28;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  id v35;
  uint8_t buf[4];
  const char *v37;
  __int16 v38;
  int v39;
  _BYTE v40[128];
  _QWORD v41[3];

  v41[1] = *MEMORY[0x1E0C80C00];
  objc_opt_self();
  v35 = 0;
  v30 = +[PFCloudKitMetadataModel createMapOfEntityIDToPrimaryKeySetForObjectIDs:](PFCloudKitMetadataModel, "createMapOfEntityIDToPrimaryKeySetForObjectIDs:", a2);
  v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v9 = +[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", +[NSCKRecordMetadata entityPath](NSCKRecordMetadata, "entityPath"));
  v41[0] = a3;
  -[NSFetchRequest setAffectedStores:](v9, "setAffectedStores:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v41, 1));
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v10 = (void *)objc_msgSend(v30, "allKeys");
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v31, v40, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v32;
LABEL_3:
    v13 = 0;
    while (1)
    {
      if (*(_QWORD *)v32 != v12)
        objc_enumerationMutation(v10);
      v14 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * v13);
      v15 = (void *)MEMORY[0x18D76B4E4]();
      v16 = objc_msgSend(v30, "objectForKey:", v14);
      -[NSFetchRequest setPredicate:](v9, "setPredicate:", objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("entityId = %@ and entityPK in %@"), v14, v16));
      -[NSFetchRequest setFetchBatchSize:](v9, "setFetchBatchSize:", 500);
      v17 = objc_msgSend(a4, "executeFetchRequest:error:", v9, &v35);
      if (v17)
      {
        objc_msgSend(v8, "addObjectsFromArray:", v17);
      }
      else
      {
        v18 = v35;

        v8 = 0;
      }
      objc_autoreleasePoolPop(v15);
      if (!v17)
        break;
      if (v11 == ++v13)
      {
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v31, v40, 16);
        if (v11)
          goto LABEL_3;
        break;
      }
    }
  }

  if (!v8)
  {
    v20 = v35;
    if (v20)
    {
      if (a5)
        *a5 = v20;
    }
    else
    {
      v21 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
      _NSCoreDataLog(17, v21, v22, v23, v24, v25, v26, v27, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/NSCKRecordMetadata.m");
      v28 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        v37 = "/Library/Caches/com.apple.xbs/Sources/Persistence/NSCKRecordMetadata.m";
        v38 = 1024;
        v39 = 179;
        _os_log_fault_impl(&dword_18A253000, v28, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
      }
    }
  }

  v35 = 0;
  return v8;
}

+ (id)createMapOfMetadataMatchingObjectIDs:(void *)a3 inStore:(void *)a4 inManagedObjectContext:(_QWORD *)a5 error:
{
  id v7;
  NSFetchRequest *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  id v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  NSFetchRequest *v34;
  unint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t i;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  NSObject *v52;
  uint64_t v53;
  id v54;
  id v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  NSObject *v63;
  NSFetchRequest *v66;
  void *v67;
  id v68;
  uint64_t v69;
  uint64_t v70;
  void *context;
  void *v72;
  uint64_t v73;
  id v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  id v88;
  uint8_t buf[4];
  const char *v90;
  __int16 v91;
  int v92;
  _BYTE v93[128];
  _BYTE v94[128];
  _BYTE v95[128];
  _QWORD v96[4];

  v96[1] = *MEMORY[0x1E0C80C00];
  objc_opt_self();
  v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v88 = 0;
  v8 = +[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", +[NSCKRecordMetadata entityPath](NSCKRecordMetadata, "entityPath"));
  v72 = a3;
  v96[0] = a3;
  -[NSFetchRequest setAffectedStores:](v8, "setAffectedStores:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v96, 1));
  v9 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v75 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v66 = v8;
  v67 = a4;
  v86 = 0u;
  v87 = 0u;
  v84 = 0u;
  v85 = 0u;
  v10 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v84, v95, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v85;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v85 != v11)
          objc_enumerationMutation(a2);
        v13 = *(void **)(*((_QWORD *)&v84 + 1) + 8 * v12);
        if (objc_msgSend(v13, "isTemporaryID"))
        {
          v14 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Somehow got a temporary objectID for export: %s");
          v15 = objc_msgSend((id)objc_msgSend(v13, "description"), "cStringUsingEncoding:", 4);
          _NSCoreDataLog(17, v14, v16, v17, v18, v19, v20, v21, v15);
          v22 = __pflogFaultLog;
          if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
          {
            v23 = objc_msgSend((id)objc_msgSend(v13, "description"), "cStringUsingEncoding:", 4);
            *(_DWORD *)buf = 136315138;
            v90 = (const char *)v23;
            _os_log_fault_impl(&dword_18A253000, v22, OS_LOG_TYPE_FAULT, "CoreData: Somehow got a temporary objectID for export: %s", buf, 0xCu);
          }
        }
        else
        {
          v24 = _sqlEntityForEntityDescription(objc_msgSend(v72, "model"), (_QWORD *)objc_msgSend(v13, "entity"));
          if (v24)
            v25 = *(unsigned int *)(v24 + 184);
          else
            v25 = 0;
          v26 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v25);
          v27 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v13, "_referenceData64"));
          v28 = (id)objc_msgSend(v75, "objectForKey:", v26);
          if (!v28)
          {
            v28 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
            objc_msgSend(v75, "setObject:forKey:", v28, v26);
          }
          objc_msgSend(v28, "addObject:", v27);

          v29 = (id)objc_msgSend(v9, "objectForKey:", v26);
          if (!v29)
          {
            v29 = objc_alloc_init(MEMORY[0x1E0C99E08]);
            objc_msgSend(v9, "setObject:forKey:", v29, v26);
          }
          objc_msgSend(v29, "setObject:forKey:", v13, v27);

        }
        ++v12;
      }
      while (v10 != v12);
      v30 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v84, v95, 16);
      v10 = v30;
    }
    while (v30);
  }
  v82 = 0u;
  v83 = 0u;
  v80 = 0u;
  v81 = 0u;
  v31 = (void *)objc_msgSend(v75, "allKeys");
  v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v80, v94, 16);
  v34 = v66;
  v33 = v67;
  if (v32)
  {
    v68 = v31;
    v70 = *(_QWORD *)v81;
    v35 = 0x1E0CB3000uLL;
LABEL_22:
    v73 = 0;
    v69 = v32;
    while (1)
    {
      if (*(_QWORD *)v81 != v70)
        objc_enumerationMutation(v68);
      v36 = *(_QWORD *)(*((_QWORD *)&v80 + 1) + 8 * v73);
      context = (void *)MEMORY[0x18D76B4E4]();
      -[NSFetchRequest setPredicate:](v34, "setPredicate:", objc_msgSend(*(id *)(v35 + 2176), "predicateWithFormat:", CFSTR("entityId = %@ and entityPK in %@"), v36, objc_msgSend(v75, "objectForKey:", v36)));
      -[NSFetchRequest setFetchBatchSize:](v34, "setFetchBatchSize:", 500);
      v37 = (void *)objc_msgSend(v33, "executeFetchRequest:error:", v34, &v88);
      v38 = v37;
      if (v37)
      {
        v78 = 0u;
        v79 = 0u;
        v76 = 0u;
        v77 = 0u;
        v39 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v76, v93, 16);
        if (v39)
        {
          v40 = *(_QWORD *)v77;
          do
          {
            for (i = 0; i != v39; ++i)
            {
              if (*(_QWORD *)v77 != v40)
                objc_enumerationMutation(v38);
              v42 = *(void **)(*((_QWORD *)&v76 + 1) + 8 * i);
              v43 = objc_msgSend((id)objc_msgSend(v9, "objectForKey:", objc_msgSend(v42, "entityId")), "objectForKey:", objc_msgSend(v42, "entityPK"));
              if (v43)
              {
                objc_msgSend(v7, "setObject:forKey:", v42, v43);
              }
              else
              {
                v44 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Exporter got record metadata back but doesn't have a corresponding objectID: %s");
                v45 = objc_msgSend((id)objc_msgSend(v42, "description"), "cStringUsingEncoding:", 4);
                _NSCoreDataLog(17, v44, v46, v47, v48, v49, v50, v51, v45);
                v52 = __pflogFaultLog;
                if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
                {
                  v53 = objc_msgSend((id)objc_msgSend(v42, "description"), "cStringUsingEncoding:", 4);
                  *(_DWORD *)buf = 136315138;
                  v90 = (const char *)v53;
                  _os_log_fault_impl(&dword_18A253000, v52, OS_LOG_TYPE_FAULT, "CoreData: Exporter got record metadata back but doesn't have a corresponding objectID: %s", buf, 0xCu);
                }
              }
            }
            v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v76, v93, 16);
          }
          while (v39);
          v34 = v66;
          v33 = v67;
          v35 = 0x1E0CB3000;
          v32 = v69;
        }
        else
        {
          v32 = v69;
        }
      }
      else
      {
        v54 = v88;

        v7 = 0;
      }
      objc_autoreleasePoolPop(context);
      if (!v38)
        break;
      if (++v73 == v32)
      {
        v32 = objc_msgSend(v68, "countByEnumeratingWithState:objects:count:", &v80, v94, 16);
        if (v32)
          goto LABEL_22;
        break;
      }
    }
  }
  if (!v7)
  {
    v55 = v88;
    if (v55)
    {
      if (a5)
      {
        v7 = 0;
        *a5 = v55;
        goto LABEL_50;
      }
    }
    else
    {
      v56 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
      _NSCoreDataLog(17, v56, v57, v58, v59, v60, v61, v62, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/NSCKRecordMetadata.m");
      v63 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        v90 = "/Library/Caches/com.apple.xbs/Sources/Persistence/NSCKRecordMetadata.m";
        v91 = 1024;
        v92 = 249;
        _os_log_fault_impl(&dword_18A253000, v63, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
      }
    }
    v7 = 0;
  }
LABEL_50:

  return v7;
}

+ (NSManagedObject)metadataForRecord:(void *)a3 inManagedObjectContext:(uint64_t)a4 fromStore:(_QWORD *)a5 error:
{
  uint64_t v9;
  void *v10;
  NSFetchRequest *v11;
  void *v12;
  void *v13;
  NSManagedObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  NSManagedObject *v24;
  id v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  NSObject *v34;
  uint64_t v36;
  uint64_t v37;
  id v38;
  uint8_t buf[4];
  const char *v40;
  __int16 v41;
  uint64_t v42;
  _QWORD v43[2];

  v43[1] = *MEMORY[0x1E0C80C00];
  v9 = objc_opt_self();
  v38 = 0;
  v10 = (void *)MEMORY[0x18D76B4E4](v9);
  v11 = +[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", +[NSCKRecordMetadata entityPath](NSCKRecordMetadata, "entityPath"));
  -[NSFetchRequest setPredicate:](v11, "setPredicate:", objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("ckRecordName = %@ and recordZone.ckRecordZoneName = %@ and recordZone.ckOwnerName = %@"), objc_msgSend((id)objc_msgSend(a2, "recordID"), "recordName"), objc_msgSend((id)objc_msgSend((id)objc_msgSend(a2, "recordID"), "zoneID"), "zoneName"), objc_msgSend((id)objc_msgSend((id)objc_msgSend(a2, "recordID"), "zoneID"), "ownerName")));
  v43[0] = a4;
  -[NSFetchRequest setAffectedStores:](v11, "setAffectedStores:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v43, 1));
  v12 = (void *)objc_msgSend(a3, "executeFetchRequest:error:", v11, &v38);
  if (v12)
  {
    v13 = v12;
    v14 = (NSManagedObject *)(id)objc_msgSend(v12, "lastObject");
    if ((unint64_t)objc_msgSend(v13, "count") < 2
      || (v15 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Found more than one instance of NSCKRecordMetadata for record: %s\n%s"), v16 = objc_msgSend((id)objc_msgSend(a2, "description"), "cStringUsingEncoding:", 4), objc_msgSend((id)objc_msgSend(v13, "description"), "cStringUsingEncoding:", 4), _NSCoreDataLog(17, v15, v17, v18, v19, v20, v21, v22, v16), v23 = __pflogFaultLog, !os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT)))
    {
      if (v14)
        goto LABEL_7;
      goto LABEL_5;
    }
    v36 = objc_msgSend((id)objc_msgSend(a2, "description"), "cStringUsingEncoding:", 4);
    v37 = objc_msgSend((id)objc_msgSend(v13, "description"), "cStringUsingEncoding:", 4);
    *(_DWORD *)buf = 136315394;
    v40 = (const char *)v36;
    v41 = 2080;
    v42 = v37;
    _os_log_fault_impl(&dword_18A253000, v23, OS_LOG_TYPE_FAULT, "CoreData: Found more than one instance of NSCKRecordMetadata for record: %s\n%s", buf, 0x16u);
    if (!v14)
    {
LABEL_5:
      v14 = +[NSEntityDescription insertNewObjectForEntityForName:inManagedObjectContext:](NSEntityDescription, "insertNewObjectForEntityForName:inManagedObjectContext:", +[NSCKRecordMetadata entityPath](NSCKRecordMetadata, "entityPath"), a3);
      -[NSManagedObject setCkRecordName:](v14, "setCkRecordName:", objc_msgSend((id)objc_msgSend(a2, "recordID"), "recordName"));
      objc_msgSend(a3, "assignObject:toPersistentStore:", v14, a4);
      v24 = v14;
    }
  }
  else
  {
    v14 = 0;
  }
LABEL_7:
  v25 = v38;
  objc_autoreleasePoolPop(v10);
  if (v38)
  {
    v26 = v38;
    if (v26)
    {
      if (a5)
        *a5 = v26;
    }
    else
    {
      v27 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
      _NSCoreDataLog(17, v27, v28, v29, v30, v31, v32, v33, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/NSCKRecordMetadata.m");
      v34 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        v40 = "/Library/Caches/com.apple.xbs/Sources/Persistence/NSCKRecordMetadata.m";
        v41 = 1024;
        LODWORD(v42) = 295;
        _os_log_fault_impl(&dword_18A253000, v34, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
      }
    }
  }
  return v14;
}

+ (id)metadataForRecordIDs:(void *)a3 fromStore:(void *)a4 inManagedObjectContext:(id *)a5 error:
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  NSManagedObject *v25;
  int v26;
  id v27;
  uint64_t v28;
  id v29;
  char v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  BOOL v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  NSObject *v50;
  NSFetchRequest *v51;
  uint64_t v52;
  id v53;
  id v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  NSObject *v62;
  id v65;
  char v66;
  id obja;
  uint64_t v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  id v79;
  uint8_t buf[4];
  const char *v81;
  __int16 v82;
  int v83;
  uint64_t v84;
  _BYTE v85[128];
  _BYTE v86[128];
  uint64_t v87;

  v87 = *MEMORY[0x1E0C80C00];
  objc_opt_self();
  v70 = (uint64_t)a3;
  v6 = objc_msgSend(a3, "mirroringDelegate");
  if (!v6)
  {
    v7 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Attempting to query cloudkit metadata without a mirroring delegate: %@");
    _NSCoreDataLog(17, v7, v8, v9, v10, v11, v12, v13, (uint64_t)a3);
    v14 = __pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      v81 = (const char *)v70;
      _os_log_fault_impl(&dword_18A253000, v14, OS_LOG_TYPE_FAULT, "CoreData: Attempting to query cloudkit metadata without a mirroring delegate: %@", buf, 0xCu);
    }
  }
  v79 = 0;
  v15 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v16 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v77 = 0u;
  v78 = 0u;
  v75 = 0u;
  v76 = 0u;
  v17 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v75, v86, 16);
  if (!v17)
  {
    v66 = 1;
    goto LABEL_25;
  }
  v18 = *(_QWORD *)v76;
  v66 = 1;
  do
  {
    v19 = 0;
    do
    {
      if (*(_QWORD *)v76 != v18)
        objc_enumerationMutation(a2);
      v20 = *(void **)(*((_QWORD *)&v75 + 1) + 8 * v19);
      v21 = (void *)MEMORY[0x18D76B4E4]();
      v22 = (void *)objc_msgSend(v20, "zoneID");
      v23 = (id)objc_msgSend(v15, "objectForKey:", v22);
      if (!v23)
      {
        v23 = objc_alloc_init(MEMORY[0x1E0C99E20]);
        objc_msgSend(v15, "setObject:forKey:", v23, v22);
      }
      objc_msgSend(v23, "addObject:", objc_msgSend(v20, "recordName"));

      if (objc_msgSend(v16, "objectForKey:", v22))
        goto LABEL_16;
      if (v6)
        v24 = *(void **)(v6 + 8);
      else
        v24 = 0;
      v25 = +[NSCKRecordZoneMetadata zoneMetadataForZoneID:inDatabaseWithScope:forStore:inContext:error:]((uint64_t)NSCKRecordZoneMetadata, v22, objc_msgSend(v24, "databaseScope"), v70, a4, (uint64_t)&v79);
      if (v25)
      {
        v79 = 0;
        objc_msgSend(v16, "setObject:forKey:", -[NSManagedObject objectID](v25, "objectID"), v22);
LABEL_16:
        v26 = 1;
        goto LABEL_17;
      }
      v27 = v79;
      v66 = 0;
      v26 = 0;
LABEL_17:
      objc_autoreleasePoolPop(v21);
      if (!v26)
        goto LABEL_25;
      ++v19;
    }
    while (v17 != v19);
    v28 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v75, v86, 16);
    v17 = v28;
  }
  while (v28);
LABEL_25:
  v29 = v79;
  if ((v66 & 1) != 0)
  {
    v73 = 0u;
    v74 = 0u;
    v71 = 0u;
    v72 = 0u;
    obja = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(a2, "count"));
    v33 = (void *)objc_msgSend(v15, "allKeys");
    v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v71, v85, 16);
    if (v34)
    {
      v65 = v33;
      v35 = *(_QWORD *)v72;
LABEL_29:
      v36 = 0;
      while (1)
      {
        if (*(_QWORD *)v72 != v35)
          objc_enumerationMutation(v65);
        v37 = *(_QWORD *)(*((_QWORD *)&v71 + 1) + 8 * v36);
        v38 = (void *)MEMORY[0x18D76B4E4]();
        v39 = objc_msgSend(v16, "objectForKey:", v37);
        v40 = objc_msgSend(v15, "objectForKey:", v37);
        v41 = v40;
        if (v39)
          v42 = v40 == 0;
        else
          v42 = 1;
        if (v42)
        {
          v43 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Invalid query for record metadata (by recordIDs): %@ returned no metadata or record names");
          _NSCoreDataLog(17, v43, v44, v45, v46, v47, v48, v49, v37);
          v50 = __pflogFaultLog;
          if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 138412290;
            v81 = (const char *)v37;
            _os_log_fault_impl(&dword_18A253000, v50, OS_LOG_TYPE_FAULT, "CoreData: Invalid query for record metadata (by recordIDs): %@ returned no metadata or record names", buf, 0xCu);
          }
        }
        v51 = +[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", +[NSCKRecordMetadata entityPath](NSCKRecordMetadata, "entityPath"));
        v84 = v70;
        -[NSFetchRequest setAffectedStores:](v51, "setAffectedStores:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v84, 1));
        -[NSFetchRequest setPredicate:](v51, "setPredicate:", objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("recordZone = %@ AND ckRecordName in %@"), v39, v41));
        v52 = objc_msgSend(a4, "executeFetchRequest:error:", v51, &v79);
        if (v52)
        {
          v79 = 0;
          objc_msgSend(obja, "addObjectsFromArray:", v52);
        }
        else
        {
          v53 = v79;
          v66 = 0;
        }
        objc_autoreleasePoolPop(v38);
        if (!v52)
          break;
        if (v34 == ++v36)
        {
          v34 = objc_msgSend(v65, "countByEnumeratingWithState:objects:count:", &v71, v85, 16);
          if (v34)
            goto LABEL_29;
          break;
        }
      }
    }
    v32 = obja;
    v54 = v79;
    if ((v66 & 1) != 0)
    {
      v31 = (void *)objc_msgSend(obja, "copy");
      v30 = 1;
    }
    else
    {
      v30 = 0;
      v31 = 0;
    }
  }
  else
  {
    v30 = 0;
    v31 = 0;
    v32 = 0;
  }

  if ((v30 & 1) == 0)
  {
    if (v79)
    {
      if (a5)
        *a5 = v79;
    }
    else
    {
      v55 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
      _NSCoreDataLog(17, v55, v56, v57, v58, v59, v60, v61, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/NSCKRecordMetadata.m");
      v62 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        v81 = "/Library/Caches/com.apple.xbs/Sources/Persistence/NSCKRecordMetadata.m";
        v82 = 1024;
        v83 = 386;
        _os_log_fault_impl(&dword_18A253000, v62, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
      }
    }
  }
  return v31;
}

+ (uint64_t)createMapOfMetadataMatchingRecords:(void *)a3 andRecordIDs:(void *)a4 inStore:(void *)a5 withManagedObjectContext:(id *)a6 error:
{
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  void *v25;
  id v26;
  NSManagedObject *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t j;
  void *v31;
  void *v32;
  id v33;
  NSManagedObject *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  BOOL v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  NSObject *v51;
  NSFetchRequest *v52;
  void *v53;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t k;
  void *v58;
  void *v59;
  id v60;
  id v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  NSObject *v70;
  void *v72;
  char v74;
  uint64_t v75;
  id obja;
  void *context;
  void *contexta;
  uint64_t v80;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  id v98;
  uint8_t buf[4];
  const char *v100;
  __int16 v101;
  int v102;
  _BYTE v103[128];
  uint64_t v104;
  _BYTE v105[128];
  _BYTE v106[128];
  _BYTE v107[128];
  uint64_t v108;

  v108 = *MEMORY[0x1E0C80C00];
  objc_opt_self();
  v8 = objc_msgSend(a4, "mirroringDelegate");
  if (v8)
  {
    v9 = *(void **)(v8 + 8);
  }
  else
  {
    v10 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Attempting to query cloudkit metadata without a mirroring delegate: %@");
    _NSCoreDataLog(17, v10, v11, v12, v13, v14, v15, v16, (uint64_t)a4);
    v17 = __pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      v100 = (const char *)a4;
      _os_log_fault_impl(&dword_18A253000, v17, OS_LOG_TYPE_FAULT, "CoreData: Attempting to query cloudkit metadata without a mirroring delegate: %@", buf, 0xCu);
    }
    v9 = 0;
  }
  context = (void *)objc_msgSend(v9, "databaseScope");
  v98 = 0;
  v18 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v19 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v20 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v80 = (uint64_t)a4;
  v96 = 0u;
  v97 = 0u;
  v94 = 0u;
  v95 = 0u;
  v21 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v94, v107, 16);
  if (v21)
  {
    v22 = *(_QWORD *)v95;
    do
    {
      for (i = 0; i != v21; ++i)
      {
        if (*(_QWORD *)v95 != v22)
          objc_enumerationMutation(a3);
        v24 = *(void **)(*((_QWORD *)&v94 + 1) + 8 * i);
        v25 = (void *)objc_msgSend(v24, "zoneID");
        v26 = (id)objc_msgSend(v19, "objectForKey:", v25);
        if (!v26)
        {
          v26 = objc_alloc_init(MEMORY[0x1E0C99E20]);
          objc_msgSend(v19, "setObject:forKey:", v26, v25);
        }
        objc_msgSend(v26, "addObject:", objc_msgSend(v24, "recordName"));

        if (!objc_msgSend(v20, "objectForKey:", v25))
        {
          v27 = +[NSCKRecordZoneMetadata zoneMetadataForZoneID:inDatabaseWithScope:forStore:inContext:error:]((uint64_t)NSCKRecordZoneMetadata, v25, (uint64_t)context, v80, a5, (uint64_t)&v98);
          if (!v27)
            goto LABEL_59;
          objc_msgSend(v20, "setObject:forKey:", -[NSManagedObject objectID](v27, "objectID"), v25);
        }
      }
      v21 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v94, v107, 16);
    }
    while (v21);
  }
  v92 = 0u;
  v93 = 0u;
  v90 = 0u;
  v91 = 0u;
  v28 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v90, v106, 16);
  if (v28)
  {
    v29 = *(_QWORD *)v91;
    do
    {
      for (j = 0; j != v28; ++j)
      {
        if (*(_QWORD *)v91 != v29)
          objc_enumerationMutation(a2);
        v31 = *(void **)(*((_QWORD *)&v90 + 1) + 8 * j);
        v32 = (void *)objc_msgSend((id)objc_msgSend(v31, "recordID"), "zoneID");
        v33 = (id)objc_msgSend(v19, "objectForKey:", v32);
        if (!v33)
        {
          v33 = objc_alloc_init(MEMORY[0x1E0C99E20]);
          objc_msgSend(v19, "setObject:forKey:", v33, v32);
        }
        objc_msgSend(v33, "addObject:", objc_msgSend((id)objc_msgSend(v31, "recordID"), "recordName"));

        if (!objc_msgSend(v20, "objectForKey:", v32))
        {
          v34 = +[NSCKRecordZoneMetadata zoneMetadataForZoneID:inDatabaseWithScope:forStore:inContext:error:]((uint64_t)NSCKRecordZoneMetadata, v32, (uint64_t)context, v80, a5, (uint64_t)&v98);
          if (!v34)
            goto LABEL_59;
          objc_msgSend(v20, "setObject:forKey:", -[NSManagedObject objectID](v34, "objectID"), v32);
        }
      }
      v28 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v90, v106, 16);
    }
    while (v28);
  }
  v88 = 0u;
  v89 = 0u;
  v86 = 0u;
  v87 = 0u;
  v35 = (void *)objc_msgSend(v19, "allKeys");
  v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v86, v105, 16);
  v37 = v80;
  if (v36)
  {
    obja = *(id *)v87;
    v74 = 1;
    v72 = v35;
LABEL_32:
    v38 = 0;
    v75 = v36;
    while (1)
    {
      if (*(id *)v87 != obja)
        objc_enumerationMutation(v35);
      v39 = *(_QWORD *)(*((_QWORD *)&v86 + 1) + 8 * v38);
      contexta = (void *)MEMORY[0x18D76B4E4]();
      v40 = objc_msgSend(v20, "objectForKey:", v39);
      v41 = objc_msgSend(v19, "objectForKey:", v39);
      v42 = v41;
      if (v40)
        v43 = v41 == 0;
      else
        v43 = 1;
      if (v43)
      {
        v44 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Invalid query for record metadata (by recordIDs): %@ returned no metadata or record names");
        _NSCoreDataLog(17, v44, v45, v46, v47, v48, v49, v50, v39);
        v51 = __pflogFaultLog;
        if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 138412290;
          v100 = (const char *)v39;
          _os_log_fault_impl(&dword_18A253000, v51, OS_LOG_TYPE_FAULT, "CoreData: Invalid query for record metadata (by recordIDs): %@ returned no metadata or record names", buf, 0xCu);
        }
      }
      v52 = +[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", +[NSCKRecordMetadata entityPath](NSCKRecordMetadata, "entityPath"));
      v104 = v37;
      -[NSFetchRequest setAffectedStores:](v52, "setAffectedStores:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v104, 1));
      -[NSFetchRequest setPredicate:](v52, "setPredicate:", objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("recordZone = %@ AND ckRecordName in %@"), v40, v42));
      v53 = (void *)objc_msgSend(a5, "executeFetchRequest:error:", v52, &v98);
      v54 = v53;
      if (v53)
      {
        v98 = 0;
        v82 = 0u;
        v83 = 0u;
        v84 = 0u;
        v85 = 0u;
        v55 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v82, v103, 16);
        if (v55)
        {
          v56 = *(_QWORD *)v83;
          do
          {
            for (k = 0; k != v55; ++k)
            {
              if (*(_QWORD *)v83 != v56)
                objc_enumerationMutation(v54);
              v58 = *(void **)(*((_QWORD *)&v82 + 1) + 8 * k);
              v59 = (void *)-[NSCKRecordMetadata createRecordID](v58);
              objc_msgSend(v18, "setObject:forKey:", v58, v59);

            }
            v55 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v82, v103, 16);
          }
          while (v55);
          v37 = v80;
          v35 = v72;
        }
      }
      else
      {
        v60 = v98;
        v74 = 0;
      }
      objc_autoreleasePoolPop(contexta);
      if (!v54)
        break;
      if (++v38 == v75)
      {
        v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v86, v105, 16);
        if (v36)
          goto LABEL_32;
        break;
      }
    }
  }
  else
  {
    v74 = 1;
  }
  v61 = v98;
  if ((v74 & 1) == 0)
  {
LABEL_59:
    if (v98)
    {
      if (a6)
      {
        v62 = 0;
        *a6 = v98;
        goto LABEL_65;
      }
    }
    else
    {
      v63 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
      _NSCoreDataLog(17, v63, v64, v65, v66, v67, v68, v69, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/NSCKRecordMetadata.m");
      v70 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        v100 = "/Library/Caches/com.apple.xbs/Sources/Persistence/NSCKRecordMetadata.m";
        v101 = 1024;
        v102 = 500;
        _os_log_fault_impl(&dword_18A253000, v70, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
      }
    }
    v62 = 0;
    goto LABEL_65;
  }
  v62 = objc_msgSend(v18, "copy");
LABEL_65:

  return v62;
}

+ (id)insertMetadataForObject:(id)a3 setRecordName:(BOOL)a4 inZoneWithID:(id)a5 recordNamePrefix:(id)a6 error:(id *)a7
{
  _BOOL4 v9;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  uint64_t v23;
  NSManagedObject *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  NSObject *v51;
  _QWORD v53[6];
  uint64_t v54;
  uint64_t *v55;
  uint64_t v56;
  void (*v57)(uint64_t, uint64_t);
  void (*v58)(uint64_t);
  uint64_t v59;
  void *v60;
  uint8_t buf[4];
  const char *v62;
  __int16 v63;
  int v64;
  __int128 v65;
  id (*v66)(uint64_t);
  void *v67;
  id v68;
  uint64_t *v69;
  uint64_t v70;

  v9 = a4;
  v70 = *MEMORY[0x1E0C80C00];
  objc_opt_self();
  v59 = 0;
  v60 = 0;
  v54 = 0;
  v55 = &v54;
  v56 = 0x3052000000;
  v57 = __Block_byref_object_copy__3;
  v58 = __Block_byref_object_dispose__3;
  v11 = (void *)objc_msgSend(a3, "managedObjectContext");
  v12 = (void *)objc_msgSend((id)objc_msgSend(a3, "objectID"), "persistentStore");
  v13 = objc_msgSend(v12, "mirroringDelegate");
  if (v13)
  {
    v14 = *(void **)(v13 + 8);
  }
  else
  {
    v15 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Attempting to query cloudkit metadata without a mirroring delegate: %@");
    _NSCoreDataLog(17, v15, v16, v17, v18, v19, v20, v21, (uint64_t)v12);
    v22 = __pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      LODWORD(v65) = 138412290;
      *(_QWORD *)((char *)&v65 + 4) = v12;
      _os_log_fault_impl(&dword_18A253000, v22, OS_LOG_TYPE_FAULT, "CoreData: Attempting to query cloudkit metadata without a mirroring delegate: %@", (uint8_t *)&v65, 0xCu);
    }
    v14 = 0;
  }
  v23 = objc_msgSend(v14, "databaseScope");
  v24 = +[NSEntityDescription insertNewObjectForEntityForName:inManagedObjectContext:](NSEntityDescription, "insertNewObjectForEntityForName:inManagedObjectContext:", +[NSCKRecordMetadata entityPath](NSCKRecordMetadata, "entityPath"), v11);
  v25 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "entity"), "attributesByName"), "objectForKey:", CFSTR("ckRecordID"));
  if (v25)
  {
    v26 = (void *)objc_msgSend(a3, "managedObjectContext");
    *(_QWORD *)&v65 = MEMORY[0x1E0C809B0];
    *((_QWORD *)&v65 + 1) = 3221225472;
    v66 = __117__NSCKRecordMetadata_insertMetadataForObject_usingMetadataContext_setRecordName_inZoneWithID_recordNamePrefix_error___block_invoke;
    v67 = &unk_1E1EDD618;
    v68 = a3;
    v69 = &v54;
    objc_msgSend(v26, "performBlockAndWait:", &v65);
  }
  if (!v55[5])
  {
    if (objc_msgSend(a6, "length"))
    {
      v27 = objc_msgSend((id)objc_msgSend(a3, "entity"), "name");
      v28 = (void *)objc_msgSend(a6, "stringByAppendingFormat:", CFSTR("%@_%@"), v27, objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3A28], "UUID"), "UUIDString"));
    }
    else
    {
      v28 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3A28], "UUID"), "UUIDString");
    }
    v29 = v28;
    v55[5] = (uint64_t)v29;
    if (v25)
    {
      if (v9)
      {
        v30 = (void *)objc_msgSend(a3, "managedObjectContext");
        v53[0] = MEMORY[0x1E0C809B0];
        v53[1] = 3221225472;
        v53[2] = __117__NSCKRecordMetadata_insertMetadataForObject_usingMetadataContext_setRecordName_inZoneWithID_recordNamePrefix_error___block_invoke_2;
        v53[3] = &unk_1E1EDD0E0;
        v53[4] = a3;
        v53[5] = &v54;
        objc_msgSend(v30, "performBlockAndWait:", v53);
      }
    }
  }
  objc_msgSend(v11, "assignObject:toPersistentStore:", v24, v12);
  -[NSManagedObject setCkRecordName:](v24, "setCkRecordName:", v55[5]);
  v31 = (void *)MEMORY[0x1E0CB37E8];
  v32 = _sqlEntityForEntityDescription(objc_msgSend(v12, "model"), (_QWORD *)objc_msgSend((id)objc_msgSend(a3, "objectID"), "entity"));
  if (v32)
    v33 = *(unsigned int *)(v32 + 184);
  else
    v33 = 0;
  -[NSManagedObject setEntityId:](v24, "setEntityId:", objc_msgSend(v31, "numberWithUnsignedInt:", v33));
  -[NSManagedObject setEntityPK:](v24, "setEntityPK:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend((id)objc_msgSend(a3, "objectID"), "_referenceData64")));
  -[NSManagedObject setRecordZone:](v24, "setRecordZone:", +[NSCKRecordZoneMetadata zoneMetadataForZoneID:inDatabaseWithScope:forStore:inContext:error:]((uint64_t)NSCKRecordZoneMetadata, a5, v23, (uint64_t)v12, v11, (uint64_t)&v60));
  if (!-[NSManagedObject recordZone](v24, "recordZone"))
  {
    v34 = (void *)MEMORY[0x18D76B4E4](objc_msgSend(v11, "deleteObject:", v24));
    v35 = __ckLoggingOverride;
    v36 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("Failed to get a metadata zone while creating metadata for object: %@\n%@"));
    _NSCoreDataLog(v35 != 0, v36, v37, v38, v39, v40, v41, v42, (uint64_t)"+[NSCKRecordMetadata insertMetadataForObject:usingMetadataContext:setRecordName:inZoneWithID:recordNamePrefix:error:]");
    v24 = 0;
    objc_autoreleasePoolPop(v34);
  }

  v55[5] = 0;
  if (!v24)
  {
    if (v60)
    {
      if (a7)
        *a7 = v60;
    }
    else
    {
      v44 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
      _NSCoreDataLog(17, v44, v45, v46, v47, v48, v49, v50, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/NSCKRecordMetadata.m");
      v51 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        v62 = "/Library/Caches/com.apple.xbs/Sources/Persistence/NSCKRecordMetadata.m";
        v63 = 1024;
        v64 = 587;
        _os_log_fault_impl(&dword_18A253000, v51, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
      }
    }
  }
  _Block_object_dispose(&v54, 8);
  return v24;
}

id __117__NSCKRecordMetadata_insertMetadataForObject_usingMetadataContext_setRecordName_inZoneWithID_recordNamePrefix_error___block_invoke(uint64_t a1)
{
  id result;

  result = (id)objc_msgSend(*(id *)(a1 + 32), "valueForKey:", CFSTR("ckRecordID"));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

uint64_t __117__NSCKRecordMetadata_insertMetadataForObject_usingMetadataContext_setRecordName_inZoneWithID_recordNamePrefix_error___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setValue:forKey:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), CFSTR("ckRecordID"));
}

+ (uint64_t)purgeRecordMetadataWithRecordIDs:(uint64_t)a3 inStore:(void *)a4 withManagedObjectContext:(id *)a5 error:
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
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  id v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  NSObject *v34;
  char v37;
  uint64_t v38;
  __int128 v39;
  __int128 v40;
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
  id v51;
  uint8_t buf[4];
  const char *v53;
  __int16 v54;
  int v55;
  _BYTE v56[128];
  _BYTE v57[128];
  uint64_t v58;
  _BYTE v59[128];
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  objc_opt_self();
  v51 = 0;
  v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v9 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v47, v59, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v48;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v48 != v10)
          objc_enumerationMutation(a2);
        v12 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * i);
        v13 = (id)objc_msgSend(v8, "objectForKey:", objc_msgSend(v12, "zoneID"));
        if (!v13)
        {
          v13 = objc_alloc_init(MEMORY[0x1E0C99E20]);
          objc_msgSend(v8, "setObject:forKey:", v13, objc_msgSend(v12, "zoneID"));
        }
        objc_msgSend(v13, "addObject:", objc_msgSend(v12, "recordName"));

      }
      v9 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v47, v59, 16);
    }
    while (v9);
  }
  v14 = +[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", +[NSCKRecordMetadata entityPath](NSCKRecordMetadata, "entityPath"));
  v58 = a3;
  -[NSFetchRequest setAffectedStores:](v14, "setAffectedStores:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v58, 1));
  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  v15 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v43, v57, 16);
  if (v15)
  {
    v37 = 1;
    v38 = *(_QWORD *)v44;
LABEL_12:
    v16 = 0;
    while (1)
    {
      if (*(_QWORD *)v44 != v38)
        objc_enumerationMutation(v8);
      v17 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * v16);
      v18 = (void *)MEMORY[0x18D76B4E4]();
      v19 = objc_msgSend(v8, "objectForKey:", v17);
      -[NSFetchRequest setPredicate:](v14, "setPredicate:", objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("((recordZone.ckRecordZoneName = %@) AND (recordZone.ckOwnerName = %@) AND (ckRecordName IN %@)) OR (needsCloudDelete = 1 AND needsUpload = 0)"), objc_msgSend(v17, "zoneName"), objc_msgSend(v17, "ownerName"), v19));
      v20 = (void *)objc_msgSend(a4, "executeFetchRequest:error:", v14, &v51);
      v21 = v20;
      if (v20)
      {
        v51 = 0;
        v39 = 0u;
        v40 = 0u;
        v41 = 0u;
        v42 = 0u;
        v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v39, v56, 16);
        if (v22)
        {
          v23 = *(_QWORD *)v40;
          do
          {
            for (j = 0; j != v22; ++j)
            {
              if (*(_QWORD *)v40 != v23)
                objc_enumerationMutation(v21);
              objc_msgSend(a4, "deleteObject:", *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * j));
            }
            v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v39, v56, 16);
          }
          while (v22);
        }
      }
      else
      {
        v25 = v51;
        v37 = 0;
      }
      objc_autoreleasePoolPop(v18);
      if (!v21)
        break;
      if (++v16 == v15)
      {
        v15 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v43, v57, 16);
        if (v15)
          goto LABEL_12;
        break;
      }
    }
  }
  else
  {
    v37 = 1;
  }
  v26 = v51;

  if ((v37 & 1) == 0)
  {
    if (v51)
    {
      if (a5)
        *a5 = v51;
    }
    else
    {
      v27 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
      _NSCoreDataLog(17, v27, v28, v29, v30, v31, v32, v33, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/NSCKRecordMetadata.m");
      v34 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        v53 = "/Library/Caches/com.apple.xbs/Sources/Persistence/NSCKRecordMetadata.m";
        v54 = 1024;
        v55 = 636;
        _os_log_fault_impl(&dword_18A253000, v34, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
      }
    }
  }
  return v37 & 1;
}

+ (uint64_t)countRecordMetadataInStore:(uint64_t)a3 matchingPredicate:(uint64_t)a4 withManagedObjectContext:(id *)a5 error:
{
  NSFetchRequest *v9;
  uint64_t v10;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  objc_opt_self();
  v9 = +[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", +[NSCKRecordMetadata entityPath](NSCKRecordMetadata, "entityPath"));
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

+ (id)batchUpdateMetadataMatchingEntityIdsAndPKs:(uint64_t)a3 withUpdates:(uint64_t)a4 inStore:(uint64_t)a5 withManagedObjectContext:(_QWORD *)a6 error:
{
  id v11;
  NSBatchUpdateRequest *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  id v22;
  _QWORD v24[10];
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  void (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  uint64_t v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  char v34;
  uint8_t buf[4];
  const char *v36;
  __int16 v37;
  int v38;
  _QWORD v39[2];

  v39[1] = *MEMORY[0x1E0C80C00];
  objc_opt_self();
  v31 = 0;
  v32 = &v31;
  v33 = 0x2020000000;
  v34 = 1;
  v25 = 0;
  v26 = &v25;
  v27 = 0x3052000000;
  v28 = __Block_byref_object_copy__3;
  v29 = __Block_byref_object_dispose__3;
  v30 = 0;
  v11 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v12 = -[NSBatchUpdateRequest initWithEntityName:]([NSBatchUpdateRequest alloc], "initWithEntityName:", +[NSCKRecordMetadata entityPath](NSCKRecordMetadata, "entityPath"));
  v39[0] = a4;
  -[NSPersistentStoreRequest setAffectedStores:](v12, "setAffectedStores:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v39, 1));
  -[NSBatchUpdateRequest setPropertiesToUpdate:](v12, "setPropertiesToUpdate:", a3);
  -[NSBatchUpdateRequest setResultType:](v12, "setResultType:", 1);
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __116__NSCKRecordMetadata_batchUpdateMetadataMatchingEntityIdsAndPKs_withUpdates_inStore_withManagedObjectContext_error___block_invoke;
  v24[3] = &unk_1E1EDD5C8;
  v24[4] = v12;
  v24[5] = a5;
  v24[6] = a4;
  v24[7] = v11;
  v24[8] = &v25;
  v24[9] = &v31;
  objc_msgSend(a2, "enumerateKeysAndObjectsUsingBlock:", v24);
  if (!*((_BYTE *)v32 + 24))
  {

    v13 = (id)v26[5];
    if (v13)
    {
      if (a6)
      {
        v11 = 0;
        *a6 = v13;
        goto LABEL_8;
      }
    }
    else
    {
      v14 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
      _NSCoreDataLog(17, v14, v15, v16, v17, v18, v19, v20, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/NSCKRecordMetadata.m");
      v21 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        v36 = "/Library/Caches/com.apple.xbs/Sources/Persistence/NSCKRecordMetadata.m";
        v37 = 1024;
        v38 = 793;
        _os_log_fault_impl(&dword_18A253000, v21, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
      }
    }
    v11 = 0;
  }
LABEL_8:

  v26[5] = 0;
  v22 = v11;
  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v31, 8);
  return v22;
}

void __116__NSCKRecordMetadata_batchUpdateMetadataMatchingEntityIdsAndPKs_withUpdates_inStore_withManagedObjectContext_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  void *v8;
  uint64_t v9;
  uint64_t v10;
  NSFetchRequest *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  v8 = (void *)MEMORY[0x18D76B4E4]();
  objc_msgSend(*(id *)(a1 + 32), "setPredicate:", objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("entityId = %@ AND entityPK IN %@"), a2, a3));
  v9 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "executeRequest:error:", *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "result");
  if (!v9)
  {
    *a4 = 1;
LABEL_13:
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 0;
    v19 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
    goto LABEL_14;
  }
  v10 = v9;
  v11 = +[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", +[NSCKRecordMetadata entityPath](NSCKRecordMetadata, "entityPath"));
  -[NSFetchRequest setPredicate:](v11, "setPredicate:", objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("SELF IN %@"), v10));
  -[NSFetchRequest setPropertiesToFetch:](v11, "setPropertiesToFetch:", &unk_1E1F522A8);
  v25[0] = *(_QWORD *)(a1 + 48);
  -[NSFetchRequest setAffectedStores:](v11, "setAffectedStores:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 1));
  -[NSFetchRequest setReturnsObjectsAsFaults:](v11, "setReturnsObjectsAsFaults:", 0);
  v12 = (void *)objc_msgSend(*(id *)(a1 + 40), "executeFetchRequest:error:", v11, *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
  if (!v12)
  {
    *a4 = 1;
    goto LABEL_13;
  }
  v13 = v12;
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v21 != v16)
          objc_enumerationMutation(v13);
        v18 = -[NSCKRecordMetadata createObjectIDForLinkedRow](*(void **)(*((_QWORD *)&v20 + 1) + 8 * i));
        objc_msgSend(*(id *)(a1 + 56), "addObject:", v18);

      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v15);
  }
LABEL_14:
  objc_autoreleasePoolPop(v8);
}

+ (void)enumerateRecordMetadataDictionariesMatchingObjectIDs:(void *)a3 withProperties:(void *)a4 inStore:(void *)a5 withManagedObjectContext:(uint64_t)a6 block:
{
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  int v25;
  uint64_t v26;
  uint64_t i;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t j;
  uint64_t v32;
  void *v33;
  NSFetchRequest *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  id v42;
  id v44;
  id obj;
  id obja;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  char v52;
  id v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  _BYTE v66[128];
  _BYTE v67[128];
  _BYTE v68[128];
  _BYTE v69[128];
  uint64_t v70;

  v70 = *MEMORY[0x1E0C80C00];
  objc_opt_self();
  objc_opt_self();
  v9 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v62 = 0u;
  v63 = 0u;
  v64 = 0u;
  v65 = 0u;
  obj = a2;
  v10 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v62, v69, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v63;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v63 != v12)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * v13);
        v15 = (void *)MEMORY[0x1E0CB37E8];
        v16 = _sqlEntityForEntityDescription(objc_msgSend(a4, "model"), (_QWORD *)objc_msgSend(v14, "entity"));
        if (v16)
          v17 = *(unsigned int *)(v16 + 184);
        else
          v17 = 0;
        v18 = objc_msgSend(v15, "numberWithUnsignedInt:", v17);
        v19 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v14, "_referenceData64"));
        v20 = (id)objc_msgSend(v9, "objectForKey:", v18);
        if (!v20)
        {
          v20 = objc_alloc_init(MEMORY[0x1E0C99E20]);
          objc_msgSend(v9, "setObject:forKey:", v20, v18);
        }
        objc_msgSend(v20, "addObject:", v19);

        ++v13;
      }
      while (v11 != v13);
      v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v62, v69, 16);
      v11 = v21;
    }
    while (v21);
  }
  v22 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v58 = 0u;
  v59 = 0u;
  v60 = 0u;
  v61 = 0u;
  v23 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v58, v68, 16);
  if (!v23)
    goto LABEL_22;
  v24 = v23;
  v25 = 0;
  v26 = *(_QWORD *)v59;
  do
  {
    for (i = 0; i != v24; ++i)
    {
      if (*(_QWORD *)v59 != v26)
        objc_enumerationMutation(a3);
      v28 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * i);
      objc_msgSend(v22, "addObject:", v28);
      v25 |= objc_msgSend(v28, "isEqualToString:", CFSTR("objectID"));
    }
    v24 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v58, v68, 16);
  }
  while (v24);
  if ((v25 & 1) == 0)
LABEL_22:
    objc_msgSend(v22, "addObject:", CFSTR("objectID"));
  v56 = 0u;
  v57 = 0u;
  v54 = 0u;
  v55 = 0u;
  v29 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v54, v67, 16);
  if (v29)
  {
    v30 = v29;
    v44 = 0;
    obja = *(id *)v55;
    do
    {
      for (j = 0; j != v30; ++j)
      {
        if (*(id *)v55 != obja)
          objc_enumerationMutation(v9);
        v32 = *(_QWORD *)(*((_QWORD *)&v54 + 1) + 8 * j);
        v33 = (void *)MEMORY[0x18D76B4E4]();
        v34 = +[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", +[NSCKRecordMetadata entityPath](NSCKRecordMetadata, "entityPath"));
        -[NSFetchRequest setResultType:](v34, "setResultType:", 2);
        -[NSFetchRequest setFetchBatchSize:](v34, "setFetchBatchSize:", 1000);
        -[NSFetchRequest setPropertiesToFetch:](v34, "setPropertiesToFetch:", v22);
        v35 = objc_msgSend(v9, "objectForKey:", v32);
        -[NSFetchRequest setPredicate:](v34, "setPredicate:", objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("entityId = %@ AND entityPK IN %@"), v32, v35));
        v53 = 0;
        v36 = (void *)objc_msgSend(a5, "executeFetchRequest:error:", v34, &v53);
        if (v36)
        {
          v37 = v36;
          v53 = 0;
          v52 = 0;
          v48 = 0u;
          v49 = 0u;
          v50 = 0u;
          v51 = 0u;
          v38 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v48, v66, 16);
          if (v38)
          {
            v39 = v38;
            v40 = *(_QWORD *)v49;
LABEL_31:
            v41 = 0;
            while (1)
            {
              if (*(_QWORD *)v49 != v40)
                objc_enumerationMutation(v37);
              (*(void (**)(uint64_t, _QWORD, _QWORD, char *))(a6 + 16))(a6, *(_QWORD *)(*((_QWORD *)&v48 + 1) + 8 * v41), 0, &v52);
              if (v52)
                break;
              if (v39 == ++v41)
              {
                v39 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v48, v66, 16);
                if (v39)
                  goto LABEL_31;
                break;
              }
            }
          }
        }
        else if (!v44)
        {
          v44 = v53;
        }
        objc_autoreleasePoolPop(v33);
      }
      v30 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v54, v67, 16);
    }
    while (v30);
  }
  else
  {
    v44 = 0;
  }
  v42 = v44;

}

- (id)createEncodedMoveReceiptData:(id *)a3
{
  void *v5;
  NSCKRecordMetadataReceiptArchive *v6;
  id v7;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  id v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v19 = 0;
  v5 = (void *)MEMORY[0x18D76B4E4](self, a2);
  v6 = -[NSCKRecordMetadataReceiptArchive initWithReceiptsToEncode:]([NSCKRecordMetadataReceiptArchive alloc], "initWithReceiptsToEncode:", -[NSCKRecordMetadata moveReceipts](self, "moveReceipts"));
  v7 = (id)objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v6, 1, &v19);
  if (v7)
  {

    objc_autoreleasePoolPop(v5);
  }
  else
  {
    v9 = v19;

    objc_autoreleasePoolPop(v5);
    v10 = v19;
    if (v10)
    {
      if (a3)
        *a3 = v10;
    }
    else
    {
      v11 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
      _NSCoreDataLog(17, v11, v12, v13, v14, v15, v16, v17, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/NSCKRecordMetadata.m");
      v18 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        v21 = "/Library/Caches/com.apple.xbs/Sources/Persistence/NSCKRecordMetadata.m";
        v22 = 1024;
        v23 = 903;
        _os_log_fault_impl(&dword_18A253000, v18, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
      }
    }
  }

  return v7;
}

- (BOOL)mergeMoveReceiptsWithData:(id)a3 error:(id *)a4
{
  NSPersistentStore *v7;
  NSManagedObjectContext *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
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
  NSManagedObjectContext *v37;
  _QWORD v38[8];
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  id v43;
  uint8_t buf[4];
  NSCKRecordMetadata *v45;
  __int16 v46;
  int v47;
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v43 = 0;
  v7 = -[NSManagedObjectID persistentStore](-[NSManagedObject objectID](self, "objectID"), "persistentStore");
  v8 = -[NSManagedObject managedObjectContext](self, "managedObjectContext");
  if (!v7)
  {
    v9 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to merge move receipts before assigning a record metadata to a store: %@");
    _NSCoreDataLog(17, v9, v10, v11, v12, v13, v14, v15, (uint64_t)self);
    v16 = __pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      v45 = self;
      _os_log_fault_impl(&dword_18A253000, v16, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to merge move receipts before assigning a record metadata to a store: %@", buf, 0xCu);
    }
  }
  v17 = (void *)MEMORY[0x18D76B4E4]();
  v18 = (id)objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), a3, &v43);
  if (v18)
  {
    v37 = v8;
    v19 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v20 = (void *)-[NSCKRecordMetadata moveReceipts](self, "moveReceipts");
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v39, v48, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v40;
      do
      {
        for (i = 0; i != v22; ++i)
        {
          if (*(_QWORD *)v40 != v23)
            objc_enumerationMutation(v20);
          v25 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v39 + 1) + 8 * i), "createRecordIDForMovedRecord");
          objc_msgSend(v19, "addObject:", v25);

        }
        v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v39, v48, 16);
      }
      while (v22);
    }
    v38[0] = MEMORY[0x1E0C809B0];
    v38[1] = 3221225472;
    v38[2] = __54__NSCKRecordMetadata_mergeMoveReceiptsWithData_error___block_invoke;
    v38[3] = &unk_1E1EDD5F0;
    v8 = v37;
    v38[4] = v19;
    v38[5] = v37;
    v38[6] = self;
    v38[7] = v7;
    objc_msgSend(v18, "enumerateArchivedRecordIDsUsingBlock:", v38);

    objc_autoreleasePoolPop(v17);
  }
  else
  {
    v27 = v43;
    objc_autoreleasePoolPop(v17);
    v28 = v43;
    if (v28)
    {
      if (a4)
        *a4 = v28;
    }
    else
    {
      v29 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
      _NSCoreDataLog(17, v29, v30, v31, v32, v33, v34, v35, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/NSCKRecordMetadata.m");
      v36 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        v45 = (NSCKRecordMetadata *)"/Library/Caches/com.apple.xbs/Sources/Persistence/NSCKRecordMetadata.m";
        v46 = 1024;
        v47 = 957;
        _os_log_fault_impl(&dword_18A253000, v36, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
      }
    }
  }

  v43 = 0;
  return v18 != 0;
}

uint64_t __54__NSCKRecordMetadata_mergeMoveReceiptsWithData_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t result;
  NSManagedObject *v7;

  result = objc_msgSend(*(id *)(a1 + 32), "containsObject:", a2);
  if ((result & 1) == 0)
  {
    v7 = +[NSEntityDescription insertNewObjectForEntityForName:inManagedObjectContext:](NSEntityDescription, "insertNewObjectForEntityForName:inManagedObjectContext:", +[NSCKRecordZoneMoveReceipt entityPath](NSCKRecordZoneMoveReceipt, "entityPath"), *(_QWORD *)(a1 + 40));
    -[NSManagedObject setRecordMetadata:](v7, "setRecordMetadata:", *(_QWORD *)(a1 + 48));
    -[NSManagedObject setMovedAt:](v7, "setMovedAt:", a3);
    -[NSManagedObject setNeedsCloudDelete:](v7, "setNeedsCloudDelete:", 0);
    -[NSManagedObject setZoneName:](v7, "setZoneName:", objc_msgSend((id)objc_msgSend(a2, "zoneID"), "zoneName"));
    -[NSManagedObject setOwnerName:](v7, "setOwnerName:", objc_msgSend((id)objc_msgSend(a2, "zoneID"), "ownerName"));
    -[NSManagedObject setRecordName:](v7, "setRecordName:", objc_msgSend(a2, "recordName"));
    objc_msgSend(*(id *)(a1 + 40), "assignObject:toPersistentStore:", v7, *(_QWORD *)(a1 + 56));
    return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
  }
  return result;
}

+ (id)encodeRecord:(id)a3 error:(id *)a4
{
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  id v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  int v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v21 = 0;
  v6 = (void *)MEMORY[0x18D76B4E4](a1, a2);
  v7 = (void *)objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", a3, 1, &v21);
  if (!v7 || (v8 = (id)objc_msgSend(v7, "compressedDataUsingAlgorithm:error:", 0, &v21)) == 0)
  {
    v10 = v21;
    objc_autoreleasePoolPop(v6);
    v11 = v21;
    if (v11)
    {
      if (a4)
      {
        v9 = 0;
        *a4 = v11;
        goto LABEL_10;
      }
    }
    else
    {
      v12 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
      _NSCoreDataLog(17, v12, v13, v14, v15, v16, v17, v18, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/NSCKRecordMetadata.m");
      v19 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        v23 = "/Library/Caches/com.apple.xbs/Sources/Persistence/NSCKRecordMetadata.m";
        v24 = 1024;
        v25 = 987;
        _os_log_fault_impl(&dword_18A253000, v19, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
      }
    }
    v9 = 0;
    goto LABEL_10;
  }
  v9 = v8;
  objc_autoreleasePoolPop(v6);
LABEL_10:

  return v9;
}

+ (id)recordFromEncodedData:(id)a3 error:(id *)a4
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  id v23;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  int v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v23 = 0;
  v6 = (void *)MEMORY[0x18D76B4E4](a1, a2);
  v7 = objc_msgSend(a3, "decompressedDataUsingAlgorithm:error:", 0, &v23);
  if (!v7
    || (v8 = v7,
        v9 = (void *)MEMORY[0x1E0CB3710],
        getCloudKitCKRecordClass[0](),
        (v10 = (id)objc_msgSend(v9, "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v8, &v23)) == 0))
  {
    v12 = v23;
    objc_autoreleasePoolPop(v6);
    v13 = v23;
    if (v13)
    {
      if (a4)
      {
        v11 = 0;
        *a4 = v13;
        goto LABEL_10;
      }
    }
    else
    {
      v14 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
      _NSCoreDataLog(17, v14, v15, v16, v17, v18, v19, v20, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/NSCKRecordMetadata.m");
      v21 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        v25 = "/Library/Caches/com.apple.xbs/Sources/Persistence/NSCKRecordMetadata.m";
        v26 = 1024;
        v27 = 1013;
        _os_log_fault_impl(&dword_18A253000, v21, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
      }
    }
    v11 = 0;
    goto LABEL_10;
  }
  v11 = v10;
  objc_autoreleasePoolPop(v6);
LABEL_10:

  return v11;
}

@end
