@implementation HDSyncIdentity

+ (id)legacySyncIdentity
{
  void *v2;
  HDSyncIdentity *v3;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", CFSTR("00000000-0000-0000-0000-000000000000"));
  v3 = -[HDSyncIdentity initWithHardwareIdentifier:databaseIdentifier:instanceDiscriminator:]([HDSyncIdentity alloc], "initWithHardwareIdentifier:databaseIdentifier:instanceDiscriminator:", v2, v2, &stru_1E6D11BB8);

  return v3;
}

- (HDSyncIdentity)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The -%@ method is not available on %@"), v5, objc_opt_class());

  return 0;
}

- (HDSyncIdentity)initWithHardwareIdentifier:(id)a3 databaseIdentifier:(id)a4 instanceDiscriminator:(id)a5
{
  id v8;
  id v9;
  id v10;
  HDSyncIdentity *v11;
  uint64_t v12;
  NSUUID *hardwareIdentifier;
  uint64_t v14;
  NSUUID *databaseIdentifier;
  uint64_t v16;
  NSString *instanceDiscriminator;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)HDSyncIdentity;
  v11 = -[HDSyncIdentity init](&v19, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    hardwareIdentifier = v11->_hardwareIdentifier;
    v11->_hardwareIdentifier = (NSUUID *)v12;

    v14 = objc_msgSend(v9, "copy");
    databaseIdentifier = v11->_databaseIdentifier;
    v11->_databaseIdentifier = (NSUUID *)v14;

    v16 = objc_msgSend(v10, "copy");
    instanceDiscriminator = v11->_instanceDiscriminator;
    v11->_instanceDiscriminator = (NSString *)v16;

  }
  return v11;
}

+ (HDSyncIdentity)syncIdentityWithCodable:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  __CFString *v14;
  __CFString *v15;
  HDSyncIdentity *v16;

  v5 = a3;
  v6 = (void *)MEMORY[0x1E0CB3A28];
  objc_msgSend(v5, "hardwareIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hk_UUIDWithData:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = (void *)MEMORY[0x1E0CB3A28];
    objc_msgSend(v5, "databaseIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "hk_UUIDWithData:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_msgSend(v5, "instanceDiscriminator");
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = (void *)v12;
      v14 = &stru_1E6D11BB8;
      if (v12)
        v14 = (__CFString *)v12;
      v15 = v14;

      v16 = -[HDSyncIdentity initWithHardwareIdentifier:databaseIdentifier:instanceDiscriminator:]([HDSyncIdentity alloc], "initWithHardwareIdentifier:databaseIdentifier:instanceDiscriminator:", v8, v11, v15);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a4, 3, CFSTR("Missing database identifier."));
      v16 = 0;
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a4, 3, CFSTR("Missing hardware identifier."));
    v16 = 0;
  }

  return v16;
}

- (id)codableSyncIdentity
{
  HDCodableSyncIdentity *v3;
  void *v4;
  void *v5;

  v3 = objc_alloc_init(HDCodableSyncIdentity);
  -[NSUUID hk_dataForUUIDBytes](self->_hardwareIdentifier, "hk_dataForUUIDBytes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCodableSyncIdentity setHardwareIdentifier:](v3, "setHardwareIdentifier:", v4);

  -[NSUUID hk_dataForUUIDBytes](self->_databaseIdentifier, "hk_dataForUUIDBytes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCodableSyncIdentity setDatabaseIdentifier:](v3, "setDatabaseIdentifier:", v5);

  -[HDCodableSyncIdentity setInstanceDiscriminator:](v3, "setInstanceDiscriminator:", self->_instanceDiscriminator);
  return v3;
}

- (id)identityString
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[NSUUID UUIDString](self->_hardwareIdentifier, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSUUID UUIDString](self->_databaseIdentifier, "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@:%@:%@"), v4, v5, self->_instanceDiscriminator);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  HDSyncIdentity *v4;
  char v5;

  v4 = (HDSyncIdentity *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && -[NSUUID isEqual:](self->_hardwareIdentifier, "isEqual:", v4->_hardwareIdentifier)
      && -[NSUUID isEqual:](self->_databaseIdentifier, "isEqual:", v4->_databaseIdentifier))
    {
      v5 = -[NSString isEqual:](self->_instanceDiscriminator, "isEqual:", v4->_instanceDiscriminator);
    }
    else
    {
      v5 = 0;
    }
  }

  return v5;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;

  v3 = -[NSUUID hash](self->_hardwareIdentifier, "hash");
  v4 = -[NSUUID hash](self->_databaseIdentifier, "hash") ^ v3;
  return v4 ^ -[NSString hash](self->_instanceDiscriminator, "hash");
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSUUID UUIDString](self->_hardwareIdentifier, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSUUID UUIDString](self->_databaseIdentifier, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %@:%@:%@>"), v5, v6, v7, self->_instanceDiscriminator);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSUUID *hardwareIdentifier;
  id v5;

  hardwareIdentifier = self->_hardwareIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", hardwareIdentifier, CFSTR("hwID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_databaseIdentifier, CFSTR("dbID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_instanceDiscriminator, CFSTR("instanceDisc"));

}

- (HDSyncIdentity)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;
  HDSyncIdentity *v10;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("hwID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("dbID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("instanceDisc"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    v8 = v6 == 0;
  else
    v8 = 1;
  if (v8 || v7 == 0)
  {
    v10 = 0;
  }
  else
  {
    self = -[HDSyncIdentity initWithHardwareIdentifier:databaseIdentifier:instanceDiscriminator:](self, "initWithHardwareIdentifier:databaseIdentifier:instanceDiscriminator:", v5, v6, v7);
    v10 = self;
  }

  return v10;
}

- (NSUUID)hardwareIdentifier
{
  return self->_hardwareIdentifier;
}

- (NSUUID)databaseIdentifier
{
  return self->_databaseIdentifier;
}

- (NSString)instanceDiscriminator
{
  return self->_instanceDiscriminator;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_instanceDiscriminator, 0);
  objc_storeStrong((id *)&self->_databaseIdentifier, 0);
  objc_storeStrong((id *)&self->_hardwareIdentifier, 0);
}

@end
