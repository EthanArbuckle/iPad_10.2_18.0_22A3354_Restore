@implementation HDDeleteAllDeviceContextKeyValueEntriesOperation

- (HDDeleteAllDeviceContextKeyValueEntriesOperation)initWithSyncIdentity:(id)a3
{
  id v5;
  HDDeleteAllDeviceContextKeyValueEntriesOperation *v6;
  HDDeleteAllDeviceContextKeyValueEntriesOperation *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HDDeleteAllDeviceContextKeyValueEntriesOperation;
  v6 = -[HDDeleteAllDeviceContextKeyValueEntriesOperation init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_syncIdentity, a3);

  return v7;
}

- (id)transactionContext
{
  return +[HDDatabaseTransactionContext contextForWritingProtectedData](HDDatabaseTransactionContext, "contextForWritingProtectedData");
}

- (BOOL)performWithProfile:(id)a3 transaction:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  BOOL v12;

  v8 = a4;
  objc_msgSend(a3, "syncIdentityManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "concreteIdentityForIdentity:shouldCreate:transaction:error:", self->_syncIdentity, 0, v8, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v10, "entity");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = +[HDDeviceKeyValueStorageEntryEntity removeEntitesForKeys:domain:syncEntityIdentity:transaction:error:](HDDeviceProtectedKeyValueStorageEntryEntity, "removeEntitesForKeys:domain:syncEntityIdentity:transaction:error:", 0, 0, objc_msgSend(v11, "persistentID"), v8, a5);

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HDDeleteAllDeviceContextKeyValueEntriesOperation)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  HDDeleteAllDeviceContextKeyValueEntriesOperation *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SyncIdentity"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[HDDeleteAllDeviceContextKeyValueEntriesOperation initWithSyncIdentity:](self, "initWithSyncIdentity:", v5);
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_syncIdentity, CFSTR("SyncIdentity"));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syncIdentity, 0);
}

@end
