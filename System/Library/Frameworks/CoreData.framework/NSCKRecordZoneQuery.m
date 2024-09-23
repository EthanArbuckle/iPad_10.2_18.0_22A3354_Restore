@implementation NSCKRecordZoneQuery

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

- (void)createQueryForUpdatingRecords
{
  void *v1;
  void *v2;
  id v3;
  uint64_t v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v10;
  _QWORD v11[3];

  v1 = a1;
  v11[2] = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v2 = (void *)MEMORY[0x18D76B4E4]();
    v3 = (id)objc_msgSend(v1, "predicate");
    v4 = objc_msgSend(v1, "mostRecentRecordModificationDate");
    if (v3)
    {
      if (v4)
      {
        v5 = objc_alloc(MEMORY[0x1E0CB3528]);
        v11[0] = objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("modificationDate > %@"), objc_msgSend(v1, "mostRecentRecordModificationDate"));
        v11[1] = v3;
        v6 = (id)objc_msgSend(v5, "initWithType:subpredicates:", 1, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 2));
      }
      else
      {
        v6 = v3;
      }
    }
    else
    {
      if (v4)
        v7 = (void *)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("modificationDate > %@"), objc_msgSend(v1, "mostRecentRecordModificationDate"));
      else
        v7 = (void *)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithValue:", 1);
      v6 = v7;
    }
    v8 = v6;

    objc_autoreleasePoolPop(v2);
    v1 = (void *)objc_msgSend(objc_alloc((Class)getCloudKitCKQueryClass[0]()), "initWithRecordType:predicate:", objc_msgSend(v1, "recordType"), v8);
    v10 = objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("modificationDate"), 1);
    objc_msgSend(v1, "setSortDescriptors:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v10, 1));

  }
  return v1;
}

+ (NSManagedObject)zoneQueryForRecordType:(void *)a3 inZone:(uint64_t)a4 inStore:(void *)a5 managedObjectContext:(uint64_t)a6 error:
{
  NSFetchRequest *v11;
  void *v12;
  NSManagedObject *v13;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  objc_opt_self();
  v11 = +[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", +[NSCKRecordZoneQuery entityPath](NSCKRecordZoneQuery, "entityPath"));
  -[NSFetchRequest setPredicate:](v11, "setPredicate:", objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("recordType = %@ AND recordZone = %@"), a2, objc_msgSend(a3, "objectID")));
  v15[0] = a4;
  -[NSFetchRequest setAffectedStores:](v11, "setAffectedStores:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1));
  v12 = (void *)objc_msgSend(a5, "executeFetchRequest:error:", v11, a6);
  if (!v12)
    return 0;
  v13 = (NSManagedObject *)objc_msgSend(v12, "lastObject");
  if (!v13)
  {
    v13 = +[NSEntityDescription insertNewObjectForEntityForName:inManagedObjectContext:](NSEntityDescription, "insertNewObjectForEntityForName:inManagedObjectContext:", +[NSCKRecordZoneQuery entityPath](NSCKRecordZoneQuery, "entityPath"), a5);
    -[NSManagedObject setRecordType:](v13, "setRecordType:", a2);
    -[NSManagedObject setRecordZone:](v13, "setRecordZone:", a3);
  }
  return v13;
}

@end
