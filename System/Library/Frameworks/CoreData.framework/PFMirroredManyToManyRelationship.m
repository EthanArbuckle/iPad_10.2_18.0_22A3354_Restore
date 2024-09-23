@implementation PFMirroredManyToManyRelationship

- (PFMirroredManyToManyRelationship)initWithRecordID:(id)a3 recordType:(id)a4 managedObjectModel:(id)a5 andType:(unint64_t)a6
{
  PFMirroredManyToManyRelationship *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  objc_super v25;
  _QWORD v26[3];

  v26[2] = *MEMORY[0x1E0C80C00];
  v25.receiver = self;
  v25.super_class = (Class)PFMirroredManyToManyRelationship;
  v10 = -[PFMirroredManyToManyRelationship init](&v25, sel_init);
  if (v10)
  {
    objc_opt_self();
    v11 = objc_msgSend(a4, "length");
    if (v11 > objc_msgSend(CFSTR("CD_M2M_"), "length")
      && (v12 = (void *)objc_msgSend((id)objc_msgSend(a4, "substringFromIndex:", objc_msgSend(CFSTR("CD_M2M_"), "length")), "componentsSeparatedByString:", CFSTR("_")), objc_msgSend(v12, "count") == 2)&& (v13 = (void *)objc_msgSend((id)objc_msgSend(a5, "entitiesByName"), "objectForKey:", objc_msgSend(v12, "objectAtIndex:", 0))) != 0&& (v14 = (void *)objc_msgSend((id)objc_msgSend(v13, "relationshipsByName"), "objectForKey:", objc_msgSend(v12, "objectAtIndex:", 1))) != 0&& (v15 = v14, objc_msgSend(v14, "inverseRelationship")))
    {
      v26[0] = v15;
      v26[1] = objc_msgSend(v15, "inverseRelationship");
      v16 = (void *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 2);
    }
    else
    {
      v16 = 0;
    }
    v17 = (void *)objc_msgSend(v16, "objectAtIndex:", 0);
    v18 = objc_msgSend(v16, "objectAtIndex:", 1);
    if (v17 && (v19 = (void *)v18) != 0)
    {
      v20 = (void *)objc_msgSend(a3, "recordName");
      objc_opt_self();
      v21 = (void *)objc_msgSend(v20, "componentsSeparatedByString:", CFSTR(":"));
      if (objc_msgSend(v21, "count") != 2)
        v21 = 0;
      v22 = (void *)objc_msgSend(objc_alloc((Class)getCloudKitCKRecordIDClass[0]()), "initWithRecordName:zoneID:", objc_msgSend(v21, "objectAtIndex:", 0), objc_msgSend(a3, "zoneID"));
      v23 = (void *)objc_msgSend(objc_alloc((Class)getCloudKitCKRecordIDClass[0]()), "initWithRecordName:zoneID:", objc_msgSend(v21, "objectAtIndex:", 1), objc_msgSend(a3, "zoneID"));
      -[PFMirroredManyToManyRelationship _setManyToManyRecordID:manyToManyRecordType:ckRecordID:relatedCKRecordID:relationshipDescription:inverseRelationshipDescription:type:](v10, a3, a4, v22, v23, v17, v19, a6);

    }
    else
    {

      return 0;
    }
  }
  return v10;
}

- (id)_setManyToManyRecordID:(void *)a3 manyToManyRecordType:(void *)a4 ckRecordID:(void *)a5 relatedCKRecordID:(void *)a6 relationshipDescription:(void *)a7 inverseRelationshipDescription:(uint64_t)a8 type:
{
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  id result;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend((id)objc_msgSend(a2, "zoneID"), "isEqual:", objc_msgSend(a4, "zoneID"))
    || (objc_msgSend((id)objc_msgSend(a2, "zoneID"), "isEqual:", objc_msgSend(a5, "zoneID")) & 1) == 0)
  {
    _NSCoreDataLog(17, v16, v17, v18, v19, v20, v21, v22, (uint64_t)a2);
    v23 = __pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412802;
      v26 = a2;
      v27 = 2112;
      v28 = a4;
      v29 = 2112;
      v30 = a5;
    }
  }
  a1[4] = a2;
  a1[5] = a3;
  a1[2] = a6;
  a1[3] = a7;
  a1[6] = a4;
  result = a5;
  a1[7] = result;
  a1[1] = a8;
  return result;
}

- (void)dealloc
{
  objc_super v3;

  self->_relationshipDescription = 0;
  self->_inverseRelationshipDescription = 0;

  self->_manyToManyRecordID = 0;
  self->_manyToManyRecordType = 0;

  self->_ckRecordID = 0;
  self->_relatedCKRecordID = 0;
  v3.receiver = self;
  v3.super_class = (Class)PFMirroredManyToManyRelationship;
  -[PFMirroredManyToManyRelationship dealloc](&v3, sel_dealloc);
}

- (id)description
{
  id v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PFMirroredManyToManyRelationship;
  v3 = (id)objc_msgSend(-[PFMirroredManyToManyRelationship description](&v5, sel_description), "mutableCopy");
  objc_msgSend(v3, "appendFormat:", CFSTR(" %@-%@:%@-%@-%@:%@"), self->_manyToManyRecordID, -[NSEntityDescription name](-[NSPropertyDescription entity](self->_relationshipDescription, "entity"), "name"), self->_ckRecordID, -[NSPropertyDescription name](self->_relationshipDescription, "name"), -[NSEntityDescription name](-[NSPropertyDescription entity](-[NSRelationshipDescription inverseRelationship](self->_relationshipDescription, "inverseRelationship"), "entity"), "name"), self->_relatedCKRecordID);
  return v3;
}

- (BOOL)updateRelationshipValueUsingImportContext:(id)a3 andManagedObjectContext:(id)a4 error:(id *)a5
{
  CKRecordID *ckRecordID;
  NSString *v10;
  PFMirroredManyToManyRelationship *v11;
  CKRecordID *relatedCKRecordID;
  NSString *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  id v26;
  unint64_t type;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  NSObject *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  NSObject *v45;
  uint8_t buf[4];
  PFMirroredManyToManyRelationship *v48;
  __int16 v49;
  id v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  ckRecordID = self->_ckRecordID;
  v10 = -[NSEntityDescription name](-[NSPropertyDescription entity](self->_relationshipDescription, "entity"), "name");
  if (a3)
    v11 = (PFMirroredManyToManyRelationship *)objc_msgSend((id)objc_msgSend(*((id *)a3 + 8), "objectForKey:", v10), "objectForKey:", ckRecordID);
  else
    v11 = 0;
  relatedCKRecordID = self->_relatedCKRecordID;
  v13 = -[NSEntityDescription name](-[NSPropertyDescription entity](self->_inverseRelationshipDescription, "entity"), "name");
  if (a3)
    a3 = (id)objc_msgSend((id)objc_msgSend(*((id *)a3 + 8), "objectForKey:", v13), "objectForKey:", relatedCKRecordID);
  if ((-[PFMirroredManyToManyRelationship isTemporaryID](v11, "isTemporaryID") & 1) != 0
    || objc_msgSend(a3, "isTemporaryID"))
  {
    v14 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Got temporary objectIDs back during import where we should have permanent ones: %@ / %@");
    _NSCoreDataLog(17, v14, v15, v16, v17, v18, v19, v20, (uint64_t)v11);
    v21 = __pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412546;
      v48 = v11;
      v49 = 2112;
      v50 = a3;
      _os_log_fault_impl(&dword_18A253000, v21, OS_LOG_TYPE_FAULT, "CoreData: Got temporary objectIDs back during import where we should have permanent ones: %@ / %@", buf, 0x16u);
    }
  }
  v22 = 134412;
  if (v11)
  {
    if (a3)
    {
      v23 = (void *)objc_msgSend(a4, "objectWithID:", v11, 134412);
      v24 = objc_msgSend(a4, "objectWithID:", a3);
      v25 = (void *)objc_msgSend((id)objc_msgSend(v23, "valueForKey:", -[NSPropertyDescription name](self->_relationshipDescription, "name")), "mutableCopy");
      v26 = v25;
      type = self->_type;
      if (type == 1)
      {
        objc_msgSend(v25, "removeObject:", v24);
      }
      else
      {
        if (type)
        {
          v38 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "New many to many relationship type?: %@");
          _NSCoreDataLog(17, v38, v39, v40, v41, v42, v43, v44, (uint64_t)self);
          v45 = __pflogFaultLog;
          if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 138412290;
            v48 = self;
            _os_log_fault_impl(&dword_18A253000, v45, OS_LOG_TYPE_FAULT, "CoreData: New many to many relationship type?: %@", buf, 0xCu);
          }
          goto LABEL_27;
        }
        if (!v25)
          v26 = objc_alloc_init(MEMORY[0x1E0C99E20]);
        objc_msgSend(v26, "addObject:", v24);
      }
      objc_msgSend(v23, "setValue:forKey:", v26, -[NSPropertyDescription name](self->_relationshipDescription, "name"));
LABEL_27:

      LOBYTE(v28) = 1;
      return v28;
    }
  }
  else
  {
    v22 = 134413;
  }
  v28 = objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], v22, 0);
  if (!v28)
  {
    v30 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
    _NSCoreDataLog(17, v30, v31, v32, v33, v34, v35, v36, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/PFMirroredRelationship.m");
    v37 = __pflogFaultLog;
    LODWORD(v28) = os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT);
    if (!(_DWORD)v28)
      return v28;
    *(_DWORD *)buf = 136315394;
    v48 = (PFMirroredManyToManyRelationship *)"/Library/Caches/com.apple.xbs/Sources/Persistence/PFMirroredRelationship.m";
    v49 = 1024;
    LODWORD(v50) = 210;
    _os_log_fault_impl(&dword_18A253000, v37, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
    goto LABEL_22;
  }
  if (!a5)
  {
LABEL_22:
    LOBYTE(v28) = 0;
    return v28;
  }
  v29 = (void *)v28;
  LOBYTE(v28) = 0;
  *a5 = v29;
  return v28;
}

- (_QWORD)recordTypeToRecordID
{
  _QWORD *v1;
  void *v2;
  id v3;
  id v4;

  if (result)
  {
    v1 = result;
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:", result[6], 0);
    v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(v3, "setObject:forKey:", v2, objc_msgSend((id)objc_msgSend((id)v1[2], "entity"), "name"));

    v4 = (id)objc_msgSend(v3, "objectForKey:", objc_msgSend((id)objc_msgSend((id)v1[3], "entity"), "name"));
    if (!v4)
    {
      v4 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:", v1[7], 0);
      objc_msgSend(v3, "setObject:forKey:", v4, objc_msgSend((id)objc_msgSend((id)v1[3], "entity"), "name"));
    }

    return v3;
  }
  return result;
}

uint64_t __55__PFMirroredManyToManyRelationship_orderRelationships___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t result;

  result = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a2, "entity"), "name"), "compare:options:", objc_msgSend((id)objc_msgSend(a3, "entity"), "name"), 1);
  if (!result)
    return objc_msgSend((id)objc_msgSend(a2, "name"), "compare:options:", objc_msgSend(a3, "name"), 1);
  return result;
}

+ (uint64_t)ckRecordTypeForOrderedRelationships:(uint64_t)a1
{
  void *v3;

  objc_opt_self();
  v3 = (void *)objc_msgSend(a2, "objectAtIndexedSubscript:", 0);
  return objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@_%@"), CFSTR("CD_M2M_"), objc_msgSend((id)objc_msgSend(v3, "entity"), "name"), objc_msgSend(v3, "name"));
}

+ (uint64_t)ckRecordNameForOrderedRecordNames:(uint64_t)a1
{
  objc_opt_self();
  return objc_msgSend(a2, "componentsJoinedByString:", CFSTR(":"));
}

+ (BOOL)_isValidMirroredRelationshipRecord:(id)a3 values:(id)a4
{
  uint64_t v5;

  v5 = objc_msgSend((id)objc_msgSend(a3, "recordType"), "length");
  if (v5)
    LOBYTE(v5) = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "recordID"), "recordName"), "length") != 0;
  return v5;
}

@end
