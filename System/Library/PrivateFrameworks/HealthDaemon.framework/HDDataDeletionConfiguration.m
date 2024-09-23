@implementation HDDataDeletionConfiguration

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HDDataDeletionConfiguration)init
{
  HDDataDeletionConfiguration *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HDDataDeletionConfiguration;
  result = -[HDDataDeletionConfiguration init](&v3, sel_init);
  if (result)
  {
    *(_DWORD *)&result->_generateDeletedObjects = 65793;
    result->_preserveExactStartAndEndDates = 0;
  }
  return result;
}

- (HDDataDeletionConfiguration)initWithCoder:(id)a3
{
  id v5;
  HDDataDeletionConfiguration *v6;
  uint64_t v7;
  NSString *restrictedSourceBundleIdentifier;
  NSString *v9;
  NSString *v10;
  uint64_t v11;
  Class entityClass;
  void *v14;
  objc_super v15;

  v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)HDDataDeletionConfiguration;
  v6 = -[HDDataDeletionConfiguration init](&v15, sel_init);
  if (v6)
  {
    v6->_generateDeletedObjects = objc_msgSend(v5, "decodeBoolForKey:", CFSTR("generate_deleted"));
    v6->_failIfNotFound = objc_msgSend(v5, "decodeBoolForKey:", CFSTR("fail_not_found"));
    v6->_notifyObservers = objc_msgSend(v5, "decodeBoolForKey:", CFSTR("notify_observers"));
    v6->_secureDelete = objc_msgSend(v5, "decodeBoolForKey:", CFSTR("secure_delete"));
    v6->_preserveExactStartAndEndDates = objc_msgSend(v5, "decodeBoolForKey:", CFSTR("preserve_dates"));
    objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("source_bundle"));
    v7 = objc_claimAutoreleasedReturnValue();
    restrictedSourceBundleIdentifier = v6->_restrictedSourceBundleIdentifier;
    v6->_restrictedSourceBundleIdentifier = (NSString *)v7;

    objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("entity_class"));
    v9 = (NSString *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      NSClassFromString(v9);
      v11 = objc_claimAutoreleasedReturnValue();
      entityClass = v6->_entityClass;
      v6->_entityClass = (Class)v11;

      if (!v6->_entityClass)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, CFSTR("HDDataManager.m"), 1462, CFSTR("Failed to load entity class '%@' when handling deletion configuration entry."), v10);

      }
    }

  }
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  objc_class *entityClass;
  void *v5;
  id v6;

  v6 = a3;
  objc_msgSend(v6, "encodeBool:forKey:", self->_generateDeletedObjects, CFSTR("generate_deleted"));
  objc_msgSend(v6, "encodeBool:forKey:", self->_failIfNotFound, CFSTR("fail_not_found"));
  objc_msgSend(v6, "encodeBool:forKey:", self->_notifyObservers, CFSTR("notify_observers"));
  objc_msgSend(v6, "encodeBool:forKey:", self->_secureDelete, CFSTR("secure_delete"));
  objc_msgSend(v6, "encodeBool:forKey:", self->_preserveExactStartAndEndDates, CFSTR("preserve_dates"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_restrictedSourceBundleIdentifier, CFSTR("source_bundle"));
  entityClass = self->_entityClass;
  if (entityClass)
  {
    NSStringFromClass(entityClass);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("entity_class"));

  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  HDDataDeletionConfiguration *v4;

  v4 = -[HDDataDeletionConfiguration init](+[HDDataDeletionConfiguration allocWithZone:](HDDataDeletionConfiguration, "allocWithZone:", a3), "init");
  -[HDDataDeletionConfiguration setGenerateDeletedObjects:](v4, "setGenerateDeletedObjects:", self->_generateDeletedObjects);
  -[HDDataDeletionConfiguration setFailIfNotFound:](v4, "setFailIfNotFound:", self->_failIfNotFound);
  -[HDDataDeletionConfiguration setNotifyObservers:](v4, "setNotifyObservers:", self->_notifyObservers);
  -[HDDataDeletionConfiguration setSecureDelete:](v4, "setSecureDelete:", self->_secureDelete);
  -[HDDataDeletionConfiguration setPreserveExactStartAndEndDates:](v4, "setPreserveExactStartAndEndDates:", self->_preserveExactStartAndEndDates);
  -[HDDataDeletionConfiguration setEntityClass:](v4, "setEntityClass:", self->_entityClass);
  -[HDDataDeletionConfiguration setRestrictedSourceBundleIdentifier:](v4, "setRestrictedSourceBundleIdentifier:", self->_restrictedSourceBundleIdentifier);
  return v4;
}

- (BOOL)generateDeletedObjects
{
  return self->_generateDeletedObjects;
}

- (void)setGenerateDeletedObjects:(BOOL)a3
{
  self->_generateDeletedObjects = a3;
}

- (BOOL)failIfNotFound
{
  return self->_failIfNotFound;
}

- (void)setFailIfNotFound:(BOOL)a3
{
  self->_failIfNotFound = a3;
}

- (BOOL)notifyObservers
{
  return self->_notifyObservers;
}

- (void)setNotifyObservers:(BOOL)a3
{
  self->_notifyObservers = a3;
}

- (BOOL)secureDelete
{
  return self->_secureDelete;
}

- (void)setSecureDelete:(BOOL)a3
{
  self->_secureDelete = a3;
}

- (BOOL)preserveExactStartAndEndDates
{
  return self->_preserveExactStartAndEndDates;
}

- (void)setPreserveExactStartAndEndDates:(BOOL)a3
{
  self->_preserveExactStartAndEndDates = a3;
}

- (BOOL)userRequested
{
  return self->_userRequested;
}

- (void)setUserRequested:(BOOL)a3
{
  self->_userRequested = a3;
}

- (id)recursiveDeleteAuthorizationBlock
{
  return self->_recursiveDeleteAuthorizationBlock;
}

- (void)setRecursiveDeleteAuthorizationBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)restrictedSourceBundleIdentifier
{
  return self->_restrictedSourceBundleIdentifier;
}

- (void)setRestrictedSourceBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (Class)entityClass
{
  return self->_entityClass;
}

- (void)setEntityClass:(Class)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entityClass, 0);
  objc_storeStrong((id *)&self->_restrictedSourceBundleIdentifier, 0);
  objc_storeStrong(&self->_recursiveDeleteAuthorizationBlock, 0);
}

@end
