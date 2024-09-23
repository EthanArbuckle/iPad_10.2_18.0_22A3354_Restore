@implementation NSPersistentHistoryTransaction

+ (NSFetchRequest)fetchRequest
{
  NSEntityDescription *v2;
  NSEntityDescription *v3;
  NSFetchRequest *v4;
  NSFetchRequest *v5;

  v2 = +[NSPersistentHistoryTransaction entityDescription](NSPersistentHistoryTransaction, "entityDescription");
  if (!v2)
    return 0;
  v3 = v2;
  v4 = objc_alloc_init(NSFetchRequest);
  -[NSFetchRequest setEntity:](v4, "setEntity:", v3);
  v5 = v4;
  return v4;
}

+ (NSEntityDescription)entityDescription
{
  uint64_t v2;

  v2 = *(_QWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 712);
  if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    return +[NSPersistentHistoryTransaction entityDescriptionWithContext:](NSPersistentHistoryTransaction, "entityDescriptionWithContext:", v2);
  else
    return 0;
}

+ (NSEntityDescription)entityDescriptionWithContext:(NSManagedObjectContext *)context
{
  NSPersistentStoreCoordinator *v3;
  _PFModelMap *modelMap;
  uint64_t v5;

  if (context
    && ((v3 = -[NSManagedObjectContext persistentStoreCoordinator](context, "persistentStoreCoordinator")) == 0
      ? (modelMap = 0)
      : (modelMap = v3->_modelMap),
        v5 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@/%@"), +[_PFPersistentHistoryFetchModel ancillaryModelNamespace](_PFPersistentHistoryFetchModel, "ancillaryModelNamespace"), CFSTR("Transaction")), modelMap))
  {
    return (NSEntityDescription *)-[NSDictionary objectForKey:](modelMap->_entitiesByPath, "objectForKey:", v5);
  }
  else
  {
    return 0;
  }
}

- (BOOL)isEqual:(id)a3
{
  NSString *v5;
  int64_t v6;
  BOOL result;

  if (self == a3)
    return 1;
  v5 = -[NSPersistentHistoryTransaction storeID](self, "storeID");
  result = 0;
  if (v5 == (NSString *)objc_msgSend(a3, "storeID"))
  {
    v6 = -[NSPersistentHistoryTransaction transactionNumber](self, "transactionNumber");
    if (v6 == objc_msgSend(a3, "transactionNumber"))
      return 1;
  }
  return result;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<NSPersistentHistoryTransaction: %lld, %@, %@, %@, %@, %@, %@>"), -[NSPersistentHistoryTransaction transactionNumber](self, "transactionNumber"), -[NSPersistentHistoryTransaction timestamp](self, "timestamp"), -[NSPersistentHistoryTransaction bundleID](self, "bundleID"), -[NSPersistentHistoryTransaction processID](self, "processID"), -[NSPersistentHistoryTransaction contextName](self, "contextName"), -[NSPersistentHistoryTransaction author](self, "author"), -[NSPersistentHistoryTransaction changes](self, "changes"));
}

- (NSDate)timestamp
{
  objc_opt_class();
  NSRequestConcreteImplementation();
  return (NSDate *)objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
}

- (NSArray)changes
{
  objc_opt_class();
  NSRequestConcreteImplementation();
  return 0;
}

- (NSPersistentHistoryToken)token
{
  objc_opt_class();
  NSRequestConcreteImplementation();
  return 0;
}

- (id)initialQueryGenerationToken
{
  objc_opt_class();
  NSRequestConcreteImplementation();
  return 0;
}

- (id)postQueryGenerationToken
{
  objc_opt_class();
  NSRequestConcreteImplementation();
  return 0;
}

- (int64_t)transactionNumber
{
  objc_opt_class();
  NSRequestConcreteImplementation();
  return 0;
}

- (NSString)storeID
{
  objc_opt_class();
  NSRequestConcreteImplementation();
  return (NSString *)&stru_1E1EE23F0;
}

- (NSString)bundleID
{
  objc_opt_class();
  NSRequestConcreteImplementation();
  return (NSString *)&stru_1E1EE23F0;
}

- (NSString)processID
{
  objc_opt_class();
  NSRequestConcreteImplementation();
  return (NSString *)&stru_1E1EE23F0;
}

- (NSString)contextName
{
  objc_opt_class();
  NSRequestConcreteImplementation();
  return 0;
}

- (NSString)author
{
  objc_opt_class();
  NSRequestConcreteImplementation();
  return 0;
}

- (NSNotification)objectIDNotification
{
  objc_opt_class();
  NSRequestConcreteImplementation();
  return (NSNotification *)objc_msgSend(MEMORY[0x1E0CB37C0], "notificationWithName:object:", &stru_1E1EE23F0, 0);
}

@end
