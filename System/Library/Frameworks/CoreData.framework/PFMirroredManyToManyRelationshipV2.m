@implementation PFMirroredManyToManyRelationshipV2

- (PFMirroredManyToManyRelationshipV2)initWithRecordID:(id)a3 forRecordWithID:(id)a4 relatedToRecordWithID:(id)a5 byRelationship:(id)a6 withInverse:(id)a7 andType:(unint64_t)a8
{
  PFMirroredManyToManyRelationshipV2 *v14;
  void *v15;
  void *v16;
  void *v17;
  PFMirroredManyToManyRelationshipV2 *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  objc_super v25;
  _QWORD v26[3];

  v26[2] = *MEMORY[0x1E0C80C00];
  v25.receiver = self;
  v25.super_class = (Class)PFMirroredManyToManyRelationshipV2;
  v14 = -[PFMirroredManyToManyRelationshipV2 init](&v25, sel_init);
  if (v14)
  {
    v26[0] = a6;
    v26[1] = a7;
    v15 = (void *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 2);
    objc_opt_self();
    v16 = (void *)objc_msgSend(v15, "mutableCopy");
    objc_msgSend(v16, "sortUsingComparator:", &__block_literal_global_20);
    v17 = (void *)objc_msgSend(v16, "copy");

    if ((id)objc_msgSend(v17, "objectAtIndex:", 0) == a6)
    {
      v18 = v14;
      v19 = a3;
      v20 = a4;
      v21 = a5;
      v22 = a6;
      v23 = a7;
    }
    else
    {
      v18 = v14;
      v19 = a3;
      v20 = a5;
      v21 = a4;
      v22 = a7;
      v23 = a6;
    }
    -[PFMirroredManyToManyRelationship _setManyToManyRecordID:manyToManyRecordType:ckRecordID:relatedCKRecordID:relationshipDescription:inverseRelationshipDescription:type:](v18, v19, CFSTR("CDMR"), v20, v21, v22, v23, a8);
  }
  return v14;
}

- (PFMirroredManyToManyRelationshipV2)initWithRecord:(id)a3 andValues:(id)a4 withManagedObjectModel:(id)a5 andType:(unint64_t)a6
{
  PFMirroredManyToManyRelationshipV2 *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)PFMirroredManyToManyRelationshipV2;
  v10 = -[PFMirroredManyToManyRelationshipV2 init](&v22, sel_init);
  if (v10)
  {
    v11 = (void *)objc_msgSend(a4, "objectForKey:", CFSTR("CD_recordNames"));
    objc_opt_self();
    v12 = (void *)objc_msgSend(v11, "componentsSeparatedByString:", CFSTR(":"));
    if (objc_msgSend(v12, "count") == 2)
      v13 = v12;
    else
      v13 = 0;
    v14 = (void *)objc_msgSend(a4, "objectForKey:", CFSTR("CD_relationships"));
    objc_opt_self();
    v15 = (void *)objc_msgSend(v14, "componentsSeparatedByString:", CFSTR(":"));
    if (objc_msgSend(v15, "count") != 2)
      v15 = 0;
    v16 = (void *)objc_msgSend(a4, "objectForKey:", CFSTR("CD_entityNames"));
    objc_opt_self();
    v17 = (void *)objc_msgSend(v16, "componentsSeparatedByString:", CFSTR(":"));
    if (objc_msgSend(v17, "count") == 2)
      v18 = v17;
    else
      v18 = 0;
    v19 = (void *)objc_msgSend(objc_alloc((Class)getCloudKitCKRecordIDClass[0]()), "initWithRecordName:zoneID:", objc_msgSend(v13, "objectAtIndex:", 0), objc_msgSend((id)objc_msgSend(a3, "recordID"), "zoneID"));
    v20 = (void *)objc_msgSend(objc_alloc((Class)getCloudKitCKRecordIDClass[0]()), "initWithRecordName:zoneID:", objc_msgSend(v13, "objectAtIndex:", 1), objc_msgSend((id)objc_msgSend(a3, "recordID"), "zoneID"));
    -[PFMirroredManyToManyRelationship _setManyToManyRecordID:manyToManyRecordType:ckRecordID:relatedCKRecordID:relationshipDescription:inverseRelationshipDescription:type:](v10, (void *)objc_msgSend(a3, "recordID"), (void *)objc_msgSend(a3, "recordType"), v19, v20, (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a5, "entitiesByName"), "objectForKey:", objc_msgSend(v18, "objectAtIndex:", 0)), "relationshipsByName"), "objectForKey:", objc_msgSend(v15, "objectAtIndex:", 0)), (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a5, "entitiesByName"), "objectForKey:",
                            objc_msgSend(v18, "objectAtIndex:", 1)),
                      "relationshipsByName"),
                "objectForKey:",
                objc_msgSend(v15, "objectAtIndex:", 1)),
      a6);

  }
  return v10;
}

- (void)populateRecordValues:(id)a3
{
  NSString *v5;
  CKRecordID *relatedCKRecordID;
  void *v7;
  NSString *v8;
  NSRelationshipDescription *inverseRelationshipDescription;
  void *v10;
  NSString *v11;
  NSRelationshipDescription *v12;
  void *v13;
  _QWORD v14[2];
  _QWORD v15[2];
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  if (self)
  {
    v5 = -[CKRecordID recordName](self->super._ckRecordID, "recordName");
    relatedCKRecordID = self->super._relatedCKRecordID;
  }
  else
  {
    v5 = (NSString *)objc_msgSend(0, "recordName");
    relatedCKRecordID = 0;
  }
  v16[0] = v5;
  v16[1] = -[CKRecordID recordName](relatedCKRecordID, "recordName");
  v7 = (void *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 2);
  objc_opt_self();
  objc_msgSend(a3, "setObject:forKey:", objc_msgSend(v7, "componentsJoinedByString:", CFSTR(":")), CFSTR("CD_recordNames"));
  if (self)
  {
    v8 = -[NSPropertyDescription name](self->super._relationshipDescription, "name");
    inverseRelationshipDescription = self->super._inverseRelationshipDescription;
  }
  else
  {
    v8 = (NSString *)objc_msgSend(0, "name");
    inverseRelationshipDescription = 0;
  }
  v15[0] = v8;
  v15[1] = -[NSPropertyDescription name](inverseRelationshipDescription, "name");
  v10 = (void *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 2);
  objc_opt_self();
  objc_msgSend(a3, "setObject:forKey:", objc_msgSend(v10, "componentsJoinedByString:", CFSTR(":")), CFSTR("CD_relationships"));
  if (self)
  {
    v11 = -[NSEntityDescription name](-[NSPropertyDescription entity](self->super._relationshipDescription, "entity"), "name");
    v12 = self->super._inverseRelationshipDescription;
  }
  else
  {
    v11 = (NSString *)objc_msgSend((id)objc_msgSend(0, "entity"), "name");
    v12 = 0;
  }
  v14[0] = v11;
  v14[1] = -[NSEntityDescription name](-[NSPropertyDescription entity](v12, "entity"), "name");
  v13 = (void *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 2);
  objc_opt_self();
  objc_msgSend(a3, "setObject:forKey:", objc_msgSend(v13, "componentsJoinedByString:", CFSTR(":")), CFSTR("CD_entityNames"));
}

+ (BOOL)_isValidMirroredRelationshipRecord:(id)a3 values:(id)a4
{
  uint64_t v5;

  v5 = objc_msgSend((id)objc_msgSend(a4, "objectForKey:", CFSTR("CD_recordNames")), "length");
  if (v5)
  {
    v5 = objc_msgSend((id)objc_msgSend(a4, "objectForKey:", CFSTR("CD_relationships")), "length");
    if (v5)
      LOBYTE(v5) = objc_msgSend((id)objc_msgSend(a4, "objectForKey:", CFSTR("CD_entityNames")), "length") != 0;
  }
  return v5;
}

@end
