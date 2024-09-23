@implementation _HDStaticSyncStore

- (_HDStaticSyncStore)initWithProfile:(id)a3 storeIdentifier:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  _HDStaticSyncStore *v12;
  _HDStaticSyncStore *v13;
  _HDStaticSyncStore *v14;
  objc_super v16;

  v8 = a3;
  v9 = a4;
  objc_msgSend(v8, "database");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDSyncStoreEntity syncStoreEntityWithUUID:type:healthDatabase:error:](HDSyncStoreEntity, "syncStoreEntityWithUUID:type:healthDatabase:error:", v9, 5, v10, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v16.receiver = self;
    v16.super_class = (Class)_HDStaticSyncStore;
    v12 = -[_HDStaticSyncStore init](&v16, sel_init);
    v13 = v12;
    if (v12)
    {
      objc_storeWeak((id *)&v12->_profile, v8);
      v13->_syncProvenance = objc_msgSend(v11, "syncProvenance");
      objc_storeStrong((id *)&v13->_storeIdentifier, a4);
    }
    self = v13;
    v14 = self;
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[NSUUID UUIDString](self->_storeIdentifier, "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p storeIdentifier:%@>"), v4, self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (int)protocolVersion
{
  return 16;
}

- (BOOL)canRecieveSyncObjectsForEntityClass:(Class)a3
{
  return 1;
}

- (BOOL)enforceSyncEntityOrdering
{
  return 1;
}

- (int64_t)expectedSequenceNumberForSyncEntityClass:(Class)a3
{
  return 0;
}

- (id)orderedSyncEntities
{
  id WeakRetained;
  void *v3;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "syncEngine");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allOrderedSyncEntities");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)shouldContinueAfterAnchorValidationError:(id)a3
{
  return 0;
}

- (BOOL)shouldEnforceSequenceOrdering
{
  return 0;
}

- (BOOL)supportsSpeculativeChangesForSyncEntityClass:(Class)a3
{
  return 0;
}

- (id)syncEntityDependenciesForSyncEntity:(Class)a3
{
  return (id)-[objc_class syncEntityDependenciesForSyncProtocolVersion:](a3, "syncEntityDependenciesForSyncProtocolVersion:", 16);
}

- (int64_t)syncEpoch
{
  return 0;
}

- (int64_t)syncProvenance
{
  return self->_syncProvenance;
}

- (id)syncStoreDefaultSourceBundleIdentifier
{
  return CFSTR("com.apple.Health");
}

- (id)syncStoreIdentifier
{
  return self->_storeIdentifier;
}

- (id)databaseIdentifier
{
  return 0;
}

- (int64_t)syncStoreType
{
  return 5;
}

- (HDProfile)profile
{
  return (HDProfile *)objc_loadWeakRetained((id *)&self->_profile);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storeIdentifier, 0);
  objc_destroyWeak((id *)&self->_profile);
}

@end
