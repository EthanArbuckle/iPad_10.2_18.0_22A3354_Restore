@implementation HDRollSyncIdentityDeviceKeyValueEntriesOperation

- (HDRollSyncIdentityDeviceKeyValueEntriesOperation)initWithOldSyncIdentity:(id)a3 newSyncIdentity:(id)a4
{
  id v7;
  id v8;
  HDRollSyncIdentityDeviceKeyValueEntriesOperation *v9;
  HDRollSyncIdentityDeviceKeyValueEntriesOperation *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HDRollSyncIdentityDeviceKeyValueEntriesOperation;
  v9 = -[HDRollSyncIdentityDeviceKeyValueEntriesOperation init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_oldSyncIdentity, a3);
    objc_storeStrong((id *)&v10->_newSyncIdentity, a4);
  }

  return v10;
}

- (BOOL)performWithProfile:(id)a3 transaction:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  _BOOL4 v20;
  void *v21;
  uint64_t v22;
  void *v23;
  BOOL v24;
  void *v26;

  v8 = a3;
  v9 = a4;
  objc_msgSend(v8, "syncIdentityManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "concreteIdentityForIdentity:shouldCreate:transaction:error:", self->_oldSyncIdentity, 1, v9, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v8, "syncIdentityManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "concreteIdentityForIdentity:shouldCreate:transaction:error:", self->_newSyncIdentity, 1, v9, a5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      +[HDDeviceContextEntity lookupOrCreateDeviceContextForSyncIdentity:WithTransaction:error:](HDDeviceContextEntity, "lookupOrCreateDeviceContextForSyncIdentity:WithTransaction:error:", v13, v9, a5);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14)
      {
        objc_msgSend(v13, "entity");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        +[HDDeviceContextEntity deviceContextEntityWithSyncIdentity:transaction:error:](HDDeviceContextEntity, "deviceContextEntityWithSyncIdentity:transaction:error:", objc_msgSend(v15, "persistentID"), v9, a5);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (v16)
        {
          v26 = v14;
          objc_msgSend(v11, "entity");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v17, "persistentID");
          objc_msgSend(v13, "entity");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = +[HDDeviceKeyValueStorageEntryEntity replaceEntriesForOldSyncIdentity:withNewSyncIdentity:deviceContextID:transaction:error:](HDDeviceUnprotectedKeyValueStorageEntryEntity, "replaceEntriesForOldSyncIdentity:withNewSyncIdentity:deviceContextID:transaction:error:", v18, objc_msgSend(v19, "persistentID"), objc_msgSend(v16, "persistentID"), v9, a5);

          if (v20)
          {
            objc_msgSend(v11, "entity");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = objc_msgSend(v21, "persistentID");
            objc_msgSend(v13, "entity");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = +[HDDeviceKeyValueStorageEntryEntity replaceEntriesForOldSyncIdentity:withNewSyncIdentity:deviceContextID:transaction:error:](HDDeviceKeyValueStorageEntryEntity, "replaceEntriesForOldSyncIdentity:withNewSyncIdentity:deviceContextID:transaction:error:", v22, objc_msgSend(v23, "persistentID"), objc_msgSend(v16, "persistentID"), v9, a5);

          }
          else
          {
            v24 = 0;
          }
          v14 = v26;
        }
        else
        {
          v24 = 0;
        }

      }
      else
      {
        v24 = 0;
      }

    }
    else
    {
      v24 = 0;
    }

  }
  else
  {
    v24 = 0;
  }

  return v24;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HDRollSyncIdentityDeviceKeyValueEntriesOperation)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  HDRollSyncIdentityDeviceKeyValueEntriesOperation *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("OldSyncIdentity"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("NewSyncIdentity"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[HDRollSyncIdentityDeviceKeyValueEntriesOperation initWithOldSyncIdentity:newSyncIdentity:](self, "initWithOldSyncIdentity:newSyncIdentity:", v5, v6);
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  HDSyncIdentity *oldSyncIdentity;
  id v5;

  oldSyncIdentity = self->_oldSyncIdentity;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", oldSyncIdentity, CFSTR("OldSyncIdentity"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_newSyncIdentity, CFSTR("NewSyncIdentity"));

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_newSyncIdentity, 0);
  objc_storeStrong((id *)&self->_oldSyncIdentity, 0);
}

@end
