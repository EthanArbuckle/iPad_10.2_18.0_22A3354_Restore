@implementation PFMirroredOneToManyRelationship

- (PFMirroredOneToManyRelationship)initWithManagedObject:(id)a3 withRecordName:(id)a4 relatedToRecordWithRecordName:(id)a5 byRelationship:(id)a6
{
  PFMirroredOneToManyRelationship *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v21;
  objc_super v22;
  uint8_t buf[4];
  uint64_t v24;
  __int16 v25;
  id v26;
  __int16 v27;
  id v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v22.receiver = self;
  v22.super_class = (Class)PFMirroredOneToManyRelationship;
  v10 = -[PFMirroredOneToManyRelationship init](&v22, sel_init);
  if (v10)
  {
    if ((objc_msgSend((id)objc_msgSend(a4, "zoneID"), "isEqual:", objc_msgSend(a5, "zoneID")) & 1) == 0)
    {
      v11 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Attempting to link objects across zones via one-to-many relationship '%@': %@ / %@\n%@");
      v12 = objc_msgSend(a6, "name");
      _NSCoreDataLog(17, v11, v13, v14, v15, v16, v17, v18, v12);
      v19 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        v21 = objc_msgSend(a6, "name");
        *(_DWORD *)buf = 138413058;
        v24 = v21;
        v25 = 2112;
        v26 = a4;
        v27 = 2112;
        v28 = a5;
        v29 = 2112;
        v30 = a3;
        _os_log_fault_impl(&dword_18A253000, v19, OS_LOG_TYPE_FAULT, "CoreData: Attempting to link objects across zones via one-to-many relationship '%@': %@ / %@\n%@", buf, 0x2Au);
      }
    }
    v10->_recordID = (CKRecordID *)a4;
    v10->_relationshipDescription = (NSRelationshipDescription *)a6;
    v10->_inverseRelationshipDescription = (NSRelationshipDescription *)(id)objc_msgSend(a6, "inverseRelationship");
    v10->_relatedRecordID = (CKRecordID *)a5;
  }
  return v10;
}

- (void)dealloc
{
  objc_super v3;

  self->_recordID = 0;
  self->_relationshipDescription = 0;

  self->_inverseRelationshipDescription = 0;
  self->_relatedRecordID = 0;
  v3.receiver = self;
  v3.super_class = (Class)PFMirroredOneToManyRelationship;
  -[PFMirroredOneToManyRelationship dealloc](&v3, sel_dealloc);
}

- (BOOL)updateRelationshipValueUsingImportContext:(id)a3 andManagedObjectContext:(id)a4 error:(id *)a5
{
  CKRecordID *recordID;
  NSString *v10;
  uint64_t v11;
  void *v12;
  CKRecordID *relatedRecordID;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _BOOL4 v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  NSObject *v32;
  CKRecordID *v33;
  NSRelationshipDescription *relationshipDescription;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  NSObject *v52;
  void *context;
  uint8_t buf[4];
  const char *v56;
  __int16 v57;
  NSRelationshipDescription *v58;
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  recordID = self->_recordID;
  v10 = -[NSEntityDescription name](-[NSPropertyDescription entity](self->_relationshipDescription, "entity"), "name");
  if (!a3
    || (v11 = objc_msgSend((id)objc_msgSend(*((id *)a3 + 8), "objectForKey:", v10), "objectForKey:", recordID)) == 0)
  {
    v25 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Import context cache is stale. To-one mirrored relationship source object has gone missing: %@ - %@");
    _NSCoreDataLog(17, v25, v26, v27, v28, v29, v30, v31, (uint64_t)self->_recordID);
    v32 = __pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      v33 = self->_recordID;
      relationshipDescription = self->_relationshipDescription;
      *(_DWORD *)buf = 138412546;
      v56 = (const char *)v33;
      v57 = 2112;
      v58 = relationshipDescription;
      _os_log_fault_impl(&dword_18A253000, v32, OS_LOG_TYPE_FAULT, "CoreData: Import context cache is stale. To-one mirrored relationship source object has gone missing: %@ - %@", buf, 0x16u);
    }
LABEL_16:
    v44 = (void *)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134412, 0);
    if (v44)
    {
      if (a5)
      {
        LOBYTE(v24) = 0;
        *a5 = v44;
        return v24;
      }
LABEL_21:
      LOBYTE(v24) = 0;
      return v24;
    }
LABEL_19:
    v45 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
    _NSCoreDataLog(17, v45, v46, v47, v48, v49, v50, v51, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/PFMirroredRelationship.m");
    v52 = __pflogFaultLog;
    v24 = os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT);
    if (!v24)
      return v24;
    *(_DWORD *)buf = 136315394;
    v56 = "/Library/Caches/com.apple.xbs/Sources/Persistence/PFMirroredRelationship.m";
    v57 = 1024;
    LODWORD(v58) = 463;
    _os_log_fault_impl(&dword_18A253000, v52, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
    goto LABEL_21;
  }
  v12 = (void *)objc_msgSend(a4, "objectWithID:", v11);
  relatedRecordID = self->_relatedRecordID;
  if (!relatedRecordID)
  {
    objc_msgSend(v12, "setValue:forKey:", 0, -[NSPropertyDescription name](self->_relationshipDescription, "name"));
    goto LABEL_19;
  }
  v14 = objc_msgSend((id)objc_msgSend(*((id *)a3 + 8), "objectForKey:", -[NSEntityDescription name](-[NSPropertyDescription entity](self->_inverseRelationshipDescription, "entity"), "name")), "objectForKey:", relatedRecordID);
  if (!v14)
  {
    v35 = (void *)MEMORY[0x18D76B4E4]();
    if ((unint64_t)__ckLoggingOverride >= 9)
      v36 = 9;
    else
      v36 = __ckLoggingOverride;
    v37 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("Couldn't find related object to link for object with record name %@ to %@ via %@"));
    -[NSPropertyDescription name](self->_relationshipDescription, "name");
    _NSCoreDataLog(v36, v37, v38, v39, v40, v41, v42, v43, (uint64_t)"-[PFMirroredOneToManyRelationship updateRelationshipValueUsingImportContext:andManagedObjectContext:error:]");
    objc_autoreleasePoolPop(v35);
    goto LABEL_16;
  }
  v15 = (void *)objc_msgSend(a4, "objectWithID:", v14);
  context = (void *)MEMORY[0x18D76B4E4]();
  if ((unint64_t)__ckLoggingOverride >= 9)
    v16 = 9;
  else
    v16 = __ckLoggingOverride;
  v17 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("Linking object with record name %@ to %@ via %@ on %@->%@"));
  -[NSPropertyDescription name](self->_relationshipDescription, "name");
  objc_msgSend(v15, "objectID");
  _NSCoreDataLog(v16, v17, v18, v19, v20, v21, v22, v23, (uint64_t)"-[PFMirroredOneToManyRelationship updateRelationshipValueUsingImportContext:andManagedObjectContext:error:]");
  objc_autoreleasePoolPop(context);
  objc_msgSend(v12, "setValue:forKey:", v15, -[NSPropertyDescription name](self->_relationshipDescription, "name"));
  LOBYTE(v24) = 1;
  return v24;
}

- (_QWORD)recordTypesToRecordIDs
{
  _QWORD *v1;
  void *v2;
  id v3;
  id v4;

  if (result)
  {
    v1 = result;
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:", result[4], 0);
    v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(v3, "setObject:forKey:", v2, objc_msgSend((id)objc_msgSend((id)v1[1], "entity"), "name"));

    v4 = (id)objc_msgSend(v3, "objectForKey:", objc_msgSend((id)objc_msgSend((id)v1[2], "entity"), "name"));
    if (!v4)
    {
      v4 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:", v1[3], 0);
      objc_msgSend(v3, "setObject:forKey:", v4, objc_msgSend((id)objc_msgSend((id)v1[2], "entity"), "name"));
    }

    return v3;
  }
  return result;
}

@end
