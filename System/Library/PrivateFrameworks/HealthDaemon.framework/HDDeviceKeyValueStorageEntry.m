@implementation HDDeviceKeyValueStorageEntry

- (HDDeviceKeyValueStorageEntry)initWithDomain:(id)a3 key:(id)a4 value:(id)a5 modificationDate:(id)a6 syncIdentity:(id)a7 category:(int64_t)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  HDDeviceKeyValueStorageEntry *v18;
  HDDeviceKeyValueStorageEntry *v19;
  id v22;
  objc_super v23;

  v22 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v23.receiver = self;
  v23.super_class = (Class)HDDeviceKeyValueStorageEntry;
  v18 = -[HDDeviceKeyValueStorageEntry init](&v23, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_domain, a3);
    objc_storeStrong((id *)&v19->_key, a4);
    objc_storeStrong((id *)&v19->_value, a5);
    objc_storeStrong((id *)&v19->_modificationDate, a6);
    objc_storeStrong((id *)&v19->_syncIdentity, a7);
    v19->_protectionCategory = a8;
  }

  return v19;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[HDDeviceKeyValueStorageEntry initWithDomain:key:value:modificationDate:syncIdentity:category:](+[HDDeviceKeyValueStorageEntry allocWithZone:](HDDeviceKeyValueStorageEntry, "allocWithZone:", a3), "initWithDomain:key:value:modificationDate:syncIdentity:category:", self->_domain, self->_key, self->_value, self->_modificationDate, self->_syncIdentity, self->_protectionCategory);
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  HDDeviceKeyValueStorageEntry *v5;
  HDDeviceKeyValueStorageEntry *v6;
  NSString *domain;
  NSString *v8;
  uint64_t v9;
  NSString *v10;
  void *v11;
  char v12;
  NSString *key;
  NSString *v14;
  uint64_t v15;
  void *v16;
  NSString *v17;
  uint64_t v18;
  NSString *v19;
  void *v20;
  NSData *value;
  void *v22;
  NSDate *modificationDate;
  void *v24;
  int64_t protectionCategory;
  HDSyncIdentity *syncIdentity;
  void *v27;
  BOOL v28;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;

  v5 = (HDDeviceKeyValueStorageEntry *)a3;
  if (self == v5)
  {
    v12 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = v5;
      domain = self->_domain;
      -[HDDeviceKeyValueStorageEntry domain](v6, "domain");
      v8 = (NSString *)objc_claimAutoreleasedReturnValue();
      if (domain != v8)
      {
        -[HDDeviceKeyValueStorageEntry domain](v6, "domain");
        v9 = objc_claimAutoreleasedReturnValue();
        if (!v9)
        {
          v12 = 0;
          goto LABEL_28;
        }
        v3 = (void *)v9;
        v10 = self->_domain;
        -[HDDeviceKeyValueStorageEntry domain](v6, "domain");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (!-[NSString isEqualToString:](v10, "isEqualToString:", v11))
        {
          v12 = 0;
LABEL_27:

          goto LABEL_28;
        }
        v34 = v11;
      }
      key = self->_key;
      -[HDDeviceKeyValueStorageEntry key](v6, "key");
      v14 = (NSString *)objc_claimAutoreleasedReturnValue();
      if (key != v14)
      {
        -[HDDeviceKeyValueStorageEntry key](v6, "key");
        v15 = objc_claimAutoreleasedReturnValue();
        if (!v15)
          goto LABEL_25;
        v16 = (void *)v15;
        v17 = self->_key;
        -[HDDeviceKeyValueStorageEntry key](v6, "key");
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = v17;
        v20 = (void *)v18;
        if (!-[NSString isEqualToString:](v19, "isEqualToString:", v18))
        {

          goto LABEL_25;
        }
        v30 = v20;
        v32 = v16;
      }
      value = self->_value;
      -[HDDeviceKeyValueStorageEntry value](v6, "value", v30);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (!-[NSData isEqual:](value, "isEqual:", v22))
      {

        if (key == v14)
          goto LABEL_25;
        goto LABEL_23;
      }
      v33 = v3;
      modificationDate = self->_modificationDate;
      -[HDDeviceKeyValueStorageEntry modificationDate](v6, "modificationDate");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[NSDate isEqualToDate:](modificationDate, "isEqualToDate:", v24))
      {
        protectionCategory = self->_protectionCategory;
        if (protectionCategory == -[HDDeviceKeyValueStorageEntry protectionCategory](v6, "protectionCategory"))
        {
          syncIdentity = self->_syncIdentity;
          -[HDDeviceKeyValueStorageEntry syncIdentity](v6, "syncIdentity");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = -[HDSyncIdentity isEqual:](syncIdentity, "isEqual:", v27);

          if (key == v14)
          {

          }
          else
          {

          }
          v28 = domain == v8;
          v3 = v33;
LABEL_26:
          v11 = v34;
          if (!v28)
            goto LABEL_27;
LABEL_28:

          goto LABEL_29;
        }
      }

      v3 = v33;
      if (key != v14)
      {
LABEL_23:

      }
LABEL_25:

      v12 = 0;
      v28 = domain == v8;
      goto LABEL_26;
    }
    v12 = 0;
  }
LABEL_29:

  return v12;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %@, date modified: %@, protected entry: %d"), self->_key, self->_value, self->_modificationDate, self->_protectionCategory == 0);
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  void *v8;
  unint64_t v9;

  v3 = -[NSString hash](self->_key, "hash");
  v4 = -[NSString hash](self->_domain, "hash") ^ v3;
  v5 = -[NSData hash](self->_value, "hash");
  v6 = v4 ^ v5 ^ -[HDSyncIdentity hash](self->_syncIdentity, "hash");
  v7 = v6 ^ -[NSDate hash](self->_modificationDate, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_protectionCategory);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v7 ^ objc_msgSend(v8, "hash");

  return v9;
}

- (id)dateValue:(id *)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), self->_value, a3);
}

- (id)numberValue:(id *)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), self->_value, a3);
}

- (id)stringValue:(id *)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), self->_value, a3);
}

- (NSString)domain
{
  return self->_domain;
}

- (NSString)key
{
  return self->_key;
}

- (NSData)value
{
  return self->_value;
}

- (NSDate)modificationDate
{
  return self->_modificationDate;
}

- (HDSyncIdentity)syncIdentity
{
  return self->_syncIdentity;
}

- (int64_t)protectionCategory
{
  return self->_protectionCategory;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syncIdentity, 0);
  objc_storeStrong((id *)&self->_modificationDate, 0);
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_key, 0);
  objc_storeStrong((id *)&self->_domain, 0);
}

@end
