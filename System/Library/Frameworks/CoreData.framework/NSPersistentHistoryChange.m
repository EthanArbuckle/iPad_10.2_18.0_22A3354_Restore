@implementation NSPersistentHistoryChange

+ (NSFetchRequest)fetchRequest
{
  NSEntityDescription *v2;
  NSEntityDescription *v3;
  NSFetchRequest *v4;
  NSFetchRequest *v5;

  v2 = +[NSPersistentHistoryChange entityDescription](NSPersistentHistoryChange, "entityDescription");
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
    return +[NSPersistentHistoryChange entityDescriptionWithContext:](NSPersistentHistoryChange, "entityDescriptionWithContext:", v2);
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
        v5 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@/%@"), +[_PFPersistentHistoryFetchModel ancillaryModelNamespace](_PFPersistentHistoryFetchModel, "ancillaryModelNamespace"), CFSTR("Change")), modelMap))
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
  return self == a3;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<NSPersistentHistoryChange: %lld %@ %@ %lld %@ %@>"), -[NSPersistentHistoryChange changeID](self, "changeID"), -[NSPersistentHistoryChange changedObjectID](self, "changedObjectID"), +[NSPersistentHistoryChange shortStringForChangeType:](NSPersistentHistoryChange, "shortStringForChangeType:", -[NSPersistentHistoryChange changeType](self, "changeType")), -[NSPersistentHistoryTransaction transactionNumber](-[NSPersistentHistoryChange transaction](self, "transaction"), "transactionNumber"), -[NSPersistentHistoryChange updatedProperties](self, "updatedProperties"), -[NSPersistentHistoryChange tombstone](self, "tombstone"));
}

- (NSDictionary)tombstone
{
  objc_opt_class();
  NSRequestConcreteImplementation();
  return (NSDictionary *)MEMORY[0x1E0C9AA70];
}

- (NSManagedObjectID)changedObjectID
{
  objc_opt_class();
  NSRequestConcreteImplementation();
  return 0;
}

- (NSPersistentHistoryChangeType)changeType
{
  objc_opt_class();
  NSRequestConcreteImplementation();
  return -1;
}

- (NSPersistentHistoryTransaction)transaction
{
  objc_opt_class();
  NSRequestConcreteImplementation();
  return 0;
}

- (int64_t)changeID
{
  objc_opt_class();
  NSRequestConcreteImplementation();
  return -1;
}

- (NSSet)updatedProperties
{
  objc_opt_class();
  NSRequestConcreteImplementation();
  return 0;
}

+ (id)shortStringForChangeType:(int64_t)a3
{
  return (id)objc_msgSend((id)objc_msgSend(a1, "stringForChangeType:", a3), "stringByReplacingOccurrencesOfString:withString:", CFSTR("NSPersistentHistoryChangeType"), &stru_1E1EE23F0);
}

+ (id)stringForChangeType:(int64_t)a3
{
  if ((unint64_t)a3 >= 3)
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("'%ld' is an unknown NSPersistentHistoryChangeType value"), a3), 0));
  return off_1E1EDDDB0[a3];
}

@end
