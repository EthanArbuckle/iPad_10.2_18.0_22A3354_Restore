@implementation NSCKDatabaseMetadata

- (BOOL)hasSubscription
{
  return objc_msgSend((id)-[NSCKDatabaseMetadata hasSubscriptionNum](self, "hasSubscriptionNum"), "BOOLValue");
}

- (void)setHasSubscription:(BOOL)a3
{
  -[NSCKDatabaseMetadata setHasSubscriptionNum:](self, "setHasSubscriptionNum:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3));
}

- (int64_t)databaseScope
{
  return objc_msgSend((id)-[NSCKDatabaseMetadata databaseScopeNum](self, "databaseScopeNum"), "integerValue");
}

- (void)setDatabaseScope:(int64_t)a3
{
  -[NSCKDatabaseMetadata setDatabaseScopeNum:](self, "setDatabaseScopeNum:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3));
}

+ (NSManagedObject)databaseMetadataForScope:(uint64_t)a3 forStore:(void *)a4 inContext:(uint64_t)a5 error:
{
  NSFetchRequest *v9;
  void *v10;
  NSManagedObject *v11;
  __CFString *v12;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  objc_opt_self();
  v9 = +[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", +[NSCKDatabaseMetadata entityPath](NSCKDatabaseMetadata, "entityPath"));
  v14[0] = a3;
  -[NSFetchRequest setAffectedStores:](v9, "setAffectedStores:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1));
  -[NSFetchRequest setPredicate:](v9, "setPredicate:", objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("databaseScopeNum = %@"), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a2)));
  -[NSFetchRequest setPropertiesToFetch:](v9, "setPropertiesToFetch:", &unk_1E1F524E8);
  v10 = (void *)objc_msgSend(a4, "executeFetchRequest:error:", v9, a5);
  if (!v10)
    return 0;
  v11 = (NSManagedObject *)objc_msgSend(v10, "lastObject");
  if (!v11)
  {
    v11 = +[NSEntityDescription insertNewObjectForEntityForName:inManagedObjectContext:](NSEntityDescription, "insertNewObjectForEntityForName:inManagedObjectContext:", +[NSCKDatabaseMetadata entityPath](NSCKDatabaseMetadata, "entityPath"), a4);
    -[NSManagedObject setDatabaseScope:](v11, "setDatabaseScope:", a2);
    objc_opt_self();
    if ((unint64_t)(a2 - 1) > 2)
      v12 = 0;
    else
      v12 = off_1E1EE0678[a2 - 1];
    -[NSManagedObject setDatabaseName:](v11, "setDatabaseName:", v12);
    -[NSManagedObject setHasSubscriptionNum:](v11, "setHasSubscriptionNum:", &unk_1E1F4B6F0);
    objc_msgSend(a4, "assignObject:toPersistentStore:", v11, a3);
  }
  return v11;
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
