@implementation HDCloudSyncOwnerIdentifier

+ (id)unitTest_ownerIdentifierWithDatabaseIdentifer:(id)a3 deviceIdentifier:(id)a4 ownerDifferentiator:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = -[HDCloudSyncOwnerIdentifier _initWithDatabaseIdentifer:deviceIdentifier:ownerDifferentiator:]([HDCloudSyncOwnerIdentifier alloc], "_initWithDatabaseIdentifer:deviceIdentifier:ownerDifferentiator:", v9, v8, v7);

  return v10;
}

- (id)_initWithDatabaseIdentifer:(id)a3 deviceIdentifier:(id)a4 ownerDifferentiator:(id)a5
{
  id v9;
  id v10;
  id v11;
  HDCloudSyncOwnerIdentifier *v12;
  HDCloudSyncOwnerIdentifier *v13;
  uint64_t v14;
  NSString *deviceIdentifier;
  uint64_t v16;
  NSString *ownerDifferentiator;
  objc_super v19;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)HDCloudSyncOwnerIdentifier;
  v12 = -[HDCloudSyncOwnerIdentifier init](&v19, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_databaseIdentifier, a3);
    v14 = objc_msgSend(v10, "copy");
    deviceIdentifier = v13->_deviceIdentifier;
    v13->_deviceIdentifier = (NSString *)v14;

    v16 = objc_msgSend(v11, "copy");
    ownerDifferentiator = v13->_ownerDifferentiator;
    v13->_ownerDifferentiator = (NSString *)v16;

  }
  return v13;
}

- (NSString)string
{
  NSString *ownerIdentifierString;
  void *v4;
  NSUUID *databaseIdentifier;
  void *v6;
  void *v7;
  void *v8;
  NSString *v9;
  NSString *v10;
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  ownerIdentifierString = self->_ownerIdentifierString;
  if (!ownerIdentifierString)
  {
    v4 = (void *)MEMORY[0x1E0C99DE8];
    databaseIdentifier = self->_databaseIdentifier;
    v12[0] = self->_deviceIdentifier;
    -[NSUUID UUIDString](databaseIdentifier, "UUIDString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v12[1] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "arrayWithArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (self->_ownerDifferentiator)
      objc_msgSend(v8, "addObject:");
    objc_msgSend(v8, "componentsJoinedByString:", CFSTR(":"));
    v9 = (NSString *)objc_claimAutoreleasedReturnValue();
    v10 = self->_ownerIdentifierString;
    self->_ownerIdentifierString = v9;

    ownerIdentifierString = self->_ownerIdentifierString;
  }
  return ownerIdentifierString;
}

- (NSString)cloudKitIdentifier
{
  return self->_deviceIdentifier;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[HDCloudSyncOwnerIdentifier string](self, "string");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "string");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isEqualToString:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[HDCloudSyncOwnerIdentifier string](self, "string");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[HDCloudSyncOwnerIdentifier _initWithDatabaseIdentifer:deviceIdentifier:ownerDifferentiator:](+[HDCloudSyncOwnerIdentifier allocWithZone:](HDCloudSyncOwnerIdentifier, "allocWithZone:", a3), "_initWithDatabaseIdentifer:deviceIdentifier:ownerDifferentiator:", self->_databaseIdentifier, self->_deviceIdentifier, self->_ownerDifferentiator);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ownerIdentifierString, 0);
  objc_storeStrong((id *)&self->_ownerDifferentiator, 0);
  objc_storeStrong((id *)&self->_databaseIdentifier, 0);
  objc_storeStrong((id *)&self->_deviceIdentifier, 0);
}

@end
