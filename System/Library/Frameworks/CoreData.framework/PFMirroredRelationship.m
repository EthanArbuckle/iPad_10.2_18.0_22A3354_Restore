@implementation PFMirroredRelationship

+ (PFMirroredOneToManyRelationship)mirroredRelationshipWithManagedObject:(uint64_t)a3 withRecordID:(uint64_t)a4 relatedToObjectWithRecordID:(uint64_t)a5 byRelationship:
{
  objc_opt_self();
  return -[PFMirroredOneToManyRelationship initWithManagedObject:withRecordName:relatedToRecordWithRecordName:byRelationship:]([PFMirroredOneToManyRelationship alloc], "initWithManagedObject:withRecordName:relatedToRecordWithRecordName:byRelationship:", a2, a3, a4, a5);
}

+ (PFMirroredManyToManyRelationshipV2)mirroredRelationshipWithManyToManyRecord:(uint64_t)a3 values:(uint64_t)a4 andManagedObjectModel:
{
  PFMirroredManyToManyRelationshipV2 *v7;

  objc_opt_self();
  if (objc_msgSend((id)objc_msgSend(a2, "recordType"), "hasPrefix:", CFSTR("CD_M2M_")))
    v7 = -[PFMirroredManyToManyRelationship initWithRecordID:recordType:managedObjectModel:andType:]([PFMirroredManyToManyRelationship alloc], "initWithRecordID:recordType:managedObjectModel:andType:", objc_msgSend(a2, "recordID"), objc_msgSend(a2, "recordType"), a4, 0);
  else
    v7 = -[PFMirroredManyToManyRelationshipV2 initWithRecord:andValues:withManagedObjectModel:andType:]([PFMirroredManyToManyRelationshipV2 alloc], "initWithRecord:andValues:withManagedObjectModel:andType:", a2, a3, a4, 0);
  return v7;
}

+ (PFMirroredManyToManyRelationship)mirroredRelationshipWithDeletedRecordType:(uint64_t)a3 recordID:(uint64_t)a4 andManagedObjectModel:
{
  objc_opt_self();
  return -[PFMirroredManyToManyRelationship initWithRecordID:recordType:managedObjectModel:andType:]([PFMirroredManyToManyRelationship alloc], "initWithRecordID:recordType:managedObjectModel:andType:", a3, a2, a4, 1);
}

- (BOOL)updateRelationshipValueUsingImportContext:(id)a3 andManagedObjectContext:(id)a4 error:(id *)a5
{
  objc_opt_class();
  NSRequestConcreteImplementation();
  return 0;
}

+ (BOOL)isValidMirroredRelationshipRecord:(id)a3 values:(id)a4
{
  int v6;
  __objc2_class **v7;

  v6 = objc_msgSend((id)objc_msgSend(a3, "recordType"), "hasPrefix:", CFSTR("CD_M2M_"));
  v7 = off_1E1EDAE18;
  if (!v6)
    v7 = off_1E1EDAE20;
  return -[__objc2_class _isValidMirroredRelationshipRecord:values:](*v7, "_isValidMirroredRelationshipRecord:values:", a3, a4);
}

@end
